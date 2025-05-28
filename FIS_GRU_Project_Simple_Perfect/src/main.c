/***********************************************************************
 * GRU-FIS inference
 * • Prints FIS offset of every timestep in every accepted batch
 * • Counts cleared vs. not-cleared offsets
 * • Shows latency / FPS summary only
 * • CSV still records latency + predictions + RMSE
 ************************************************************************/
#include <onnxruntime_c_api.h>
#undef  ORT_API_VERSION
#define ORT_API_VERSION 21

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "stwFIS.h"
#include "stwFIS_terminate.h"

/* ───────── constants ───────── */
#define INPUT_WINDOW      25
#define OUTPUT_WINDOW      5
#define BATCH_LEN         30
#define FEATURE_COLS       3
#define TARGET_COLS        2
#define NUM_COLS          (FEATURE_COLS+TARGET_COLS)
#define MAX_LINE        1024
#define MOTION_THRESHOLD 0.5
#define RNG_SEED          80

/* ───────── ORT handles ───────── */
static const OrtApi *api=NULL;
static OrtEnv   *env=NULL;
static OrtSession *sess=NULL;
static OrtSessionOptions *opts=NULL;
static OrtAllocator *alloc=NULL;

/* ───────── helpers ───────── */
static void *xmalloc(size_t n){void *p=malloc(n); if(!p){perror("malloc"); exit(1);} return p;}
static void *xrealloc(void *p,size_t n){void *q=realloc(p,n); if(!q){perror("realloc"); exit(1);} return q;}
static double msec(const struct timespec *s,const struct timespec *e){
    return (e->tv_sec - s->tv_sec)*1000.0 + (e->tv_nsec - s->tv_nsec)/1e6;
}
static void minmax(const float *d,int rows,int start,int n,float *mn,float *mx){
    for(int j=0;j<n;j++){ mn[j]=mx[j]=d[start+j]; }
    for(int i=0;i<rows;i++) for(int j=0;j<n;j++){
        float v=d[i*NUM_COLS+start+j];
        if(v<mn[j]) mn[j]=v;
        if(v>mx[j]) mx[j]=v;
    }
}

/* CSV loader (keeps counter) */
static int load_csv(const char *path,float **rows,unsigned char **ctr){
    FILE *fp=fopen(path,"r"); if(!fp){perror("fopen"); return -1;}
    size_t cap=8192,n=0; float *dat=xmalloc(cap*NUM_COLS*sizeof(float));
    unsigned char *c=xmalloc(cap*sizeof(unsigned char));
    char buf[MAX_LINE]; int first=1;
    while(fgets(buf,sizeof(buf),fp)){
        if(first){first=0; continue;}                        /* skip header */
        char *tok=strtok(buf,",\n\r"); float v[7]; int col=0;
        while(tok && col<7){ v[col++]=strtof(tok,NULL); tok=strtok(NULL,",\n\r"); }
        if(col<7) continue;
        if(n==cap){
            cap*=2;
            dat=xrealloc(dat,cap*NUM_COLS*sizeof(float));
            c  =xrealloc(c  ,cap*sizeof(unsigned char));
        }
        c[n]=(unsigned char)v[1];                            /* counter */
        for(int j=0;j<NUM_COLS;j++) dat[n*NUM_COLS+j]=v[j+2];
        ++n;
    }
    fclose(fp); *rows=dat; *ctr=c; return (int)n;
}

/* build 30-row batches (between counter==0 rows) */
static int build_batches(const unsigned char *ctr,int rows,int **starts){
    size_t cap=1024,n=0; int *list=xmalloc(cap*sizeof(int));
    int seg_start=-1, seg_len=0;
    for(int i=0;i<rows;i++){
        if(ctr[i]==0){
            if(seg_start>=0){
                int nb= seg_len/ BATCH_LEN;
                for(int b=0;b<nb;b++){
                    if(n==cap){cap*=2; list=xrealloc(list,cap*sizeof(int));}
                    list[n++]= seg_start + b*BATCH_LEN;
                }
            }
            seg_start=i+1; seg_len=0;
        } else ++seg_len;
    }
    if(seg_start>=0){
        int nb= seg_len/ BATCH_LEN;
        for(int b=0;b<nb;b++){
            if(n==cap){cap*=2; list=xrealloc(list,cap*sizeof(int));}
            list[n++]= seg_start + b*BATCH_LEN;
        }
    }
    *starts=list; return (int)n;
}

/* ORT helpers */
static void ort_init(const char *model){
    api=OrtGetApiBase()->GetApi(ORT_API_VERSION);
    api->CreateEnv(ORT_LOGGING_LEVEL_ERROR,"gru",&env);
    api->CreateSessionOptions(&opts);
    api->SetIntraOpNumThreads(opts,1);
    api->CreateSession(env,model,opts,&sess);
    api->GetAllocatorWithDefaultOptions(&alloc);
}
static void ort_run(const float *inp,float *out){
    int64_t in_dims[3]={1,INPUT_WINDOW,FEATURE_COLS};
    size_t  in_sz=INPUT_WINDOW*FEATURE_COLS, out_sz=OUTPUT_WINDOW*TARGET_COLS;
    OrtMemoryInfo *mi; api->CreateCpuMemoryInfo(OrtArenaAllocator,OrtMemTypeDefault,&mi);
    OrtValue *in_t; api->CreateTensorWithDataAsOrtValue(mi,(void*)inp,in_sz*sizeof(float),
                     in_dims,3,ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT,&in_t);
    api->ReleaseMemoryInfo(mi);
    char *in_name,*out_name;
    api->SessionGetInputName (sess,0,alloc,&in_name);
    api->SessionGetOutputName(sess,0,alloc,&out_name);
    const char *ins[]={in_name},*outs[]={out_name};
    OrtValue *out_t=NULL;
    api->Run(sess,NULL,ins,(const OrtValue* const*)&in_t,1,outs,1,&out_t);
    float *raw; api->GetTensorMutableData(out_t,(void**)&raw);
    memcpy(out,raw,out_sz*sizeof(float));
    api->ReleaseValue(in_t); api->ReleaseValue(out_t);
    api->AllocatorFree(alloc,in_name); api->AllocatorFree(alloc,out_name);
}

int main(int argc,char **argv){
    if(argc<3){
        fprintf(stderr,"Usage: %s <test_csv> <model.onnx>\n",argv[0]);
        return 1;
    }
    const char *csv_path=argv[1], *model_path=argv[2];

    /* ── load CSV ───────────────────────── */
    float *raw=NULL; unsigned char *ctr=NULL;
    int rows=load_csv(csv_path,&raw,&ctr);
    printf("Rows read              : %d\n",rows);

    /* ── build batches ──────────────────── */
    int *starts=NULL; int n_batches=build_batches(ctr,rows,&starts);
    printf("30-row candidate batches: %d\n",n_batches);

    /* ── global min-max for scaling ─────── */
    float xmin[FEATURE_COLS],xmax[FEATURE_COLS],ymin[TARGET_COLS],ymax[TARGET_COLS];
    minmax(raw,rows,0,FEATURE_COLS ,xmin,xmax);
    minmax(raw,rows,FEATURE_COLS,TARGET_COLS,ymin,ymax);

    /* scaled feature matrix */
    float *Xsc=xmalloc(rows*FEATURE_COLS*sizeof(float));
    for(int i=0;i<rows;i++) for(int j=0;j<FEATURE_COLS;j++){
        float rng=xmax[j]-xmin[j];
        Xsc[i*FEATURE_COLS+j]=(rng==0)?0:(raw[i*NUM_COLS+j]-xmin[j])/rng;
    }

    /* shuffle batches (deterministic) */
    srand(RNG_SEED);
    for(int i=n_batches-1;i>0;i--){ int j=rand()%(i+1); int t=starts[i]; starts[i]=starts[j]; starts[j]=t; }

    /* ── ORT init ───────────────────────── */
    ort_init(model_path);

    /* CSV header */
    FILE *csv=fopen("batch_results.csv","w");
    fprintf(csv,"batch_id,start_row,lat_ms");
    for(int t=1;t<=OUTPUT_WINDOW;t++) fprintf(csv,",hip_pred_%d",t);
    for(int t=1;t<=OUTPUT_WINDOW;t++) fprintf(csv,",knee_pred_%d",t);
    fprintf(csv,",rmse_scaled_hip,rmse_scaled_knee,rmse_phys_hip,rmse_phys_knee\n");

    /* accumulators */
    double sseS_H=0,sseS_K=0, sseP_H=0,sseP_K=0;
    double lat_sum=0,lat_sq=0;
    long   offset_pass=0, offset_fail=0;
    int    accepted=0, skipped=0;

    float inp[INPUT_WINDOW*FEATURE_COLS];
    float out[OUTPUT_WINDOW*TARGET_COLS];

    printf("\n=== Batch offsets (threshold %.2f) =====================\n",MOTION_THRESHOLD);

    for(int b=0;b<n_batches;b++){
        int s=starts[b];

        /* ---- compute 25 offsets ---- */
        double offs[INPUT_WINDOW];
        int motion=0;
        for(int t=0;t<INPUT_WINDOW;t++){
            double o=stwFIS(raw[(s+t)*NUM_COLS+1],
                            raw[(s+t)*NUM_COLS+0],
                            raw[(s+t)*NUM_COLS+2]);
            offs[t]=o;
            if(o>MOTION_THRESHOLD){ motion=1; ++offset_pass; } else ++offset_fail;
        }

        /* print offsets row */
        printf("Batch %3d (row %6d): [",b,s);
        for(int t=0;t<INPUT_WINDOW;t++)
            printf("%.3f%s",offs[t],t+1==INPUT_WINDOW?"]\n":" ");
        if(!motion){ ++skipped; continue; }

        /* ---- run network ---- */
        memcpy(inp,&Xsc[s*FEATURE_COLS],INPUT_WINDOW*FEATURE_COLS*sizeof(float));
        struct timespec t0,t1; clock_gettime(CLOCK_MONOTONIC,&t0);
        ort_run(inp,out);
        clock_gettime(CLOCK_MONOTONIC,&t1);
        double lat=msec(&t0,&t1);

        /* ---- per-batch RMSE (for CSV only) ---- */
        double b_sseS_H=0,b_sseS_K=0,b_sseP_H=0,b_sseP_K=0;
        double hip_pred_phys[OUTPUT_WINDOW];
        double knee_pred_phys[OUTPUT_WINDOW];

        for(int t=0;t<OUTPUT_WINDOW;t++){
            int gt=(s+INPUT_WINDOW+t)*NUM_COLS+FEATURE_COLS;

            double pHs=out[t*TARGET_COLS+0];
            double pKs=out[t*TARGET_COLS+1];

            double gHp=raw[gt+0];
            double gKp=raw[gt+1];

            double pHp=pHs*(ymax[0]-ymin[0])+ymin[0];
            double pKp=pKs*(ymax[1]-ymin[1])+ymin[1];
            double gHs=(gHp-ymin[0])/(ymax[0]-ymin[0]);
            double gKs=(gKp-ymin[1])/(ymax[1]-ymin[1]);

            hip_pred_phys[t]=pHp;
            knee_pred_phys[t]=pKp;

            double dS_H=pHs-gHs, dS_K=pKs-gKs;
            double dP_H=pHp-gHp, dP_K=pKp-gKp;

            sseS_H+=dS_H*dS_H;  sseS_K+=dS_K*dS_K;
            sseP_H+=dP_H*dP_H;  sseP_K+=dP_K*dP_K;

            b_sseS_H+=dS_H*dS_H; b_sseS_K+=dS_K*dS_K;
            b_sseP_H+=dP_H*dP_H; b_sseP_K+=dP_K*dP_K;
        }

        double rmseSH=sqrt(b_sseS_H/OUTPUT_WINDOW);
        double rmseSK=sqrt(b_sseS_K/OUTPUT_WINDOW);
        double rmsePH=sqrt(b_sseP_H/OUTPUT_WINDOW);
        double rmsePK=sqrt(b_sseP_K/OUTPUT_WINDOW);

        /* CSV row */
        fprintf(csv,"%d,%d,%.2f",b,s,lat);
        for(int t=0;t<OUTPUT_WINDOW;t++) fprintf(csv,",%.6f",hip_pred_phys[t]);
        for(int t=0;t<OUTPUT_WINDOW;t++) fprintf(csv,",%.6f",knee_pred_phys[t]);
        fprintf(csv,",%.6f,%.6f,%.6f,%.6f\n",rmseSH,rmseSK,rmsePH,rmsePK);

        lat_sum+=lat; lat_sq+=lat*lat;
        ++accepted;
    }
    fclose(csv);

    /* ───── summary ───── */
    printf("\nOffsets above threshold : %ld\n",offset_pass);
    printf("Offsets below threshold : %ld\n",offset_fail);
    printf("Batches accepted        : %d\n",accepted);
    printf("Batches skipped (FIS)   : %d\n",skipped);

    if(accepted){
        double mean_lat=lat_sum/accepted;
        double std_lat = sqrt(lat_sq/accepted - mean_lat*mean_lat);
        printf("\nLatency  (1 batch = 30 rows → 5-step output)\n");
        printf("   %.2f ± %.2f ms   |   %.1f batches/s (≈ FPS)\n",
               mean_lat,std_lat,1000.0/mean_lat);
    }
    printf("\nCSV written: batch_results.csv (includes RMSE columns)\n");

    /* cleanup */
    free(raw); free(ctr); free(Xsc); free(starts);
    if(sess) api->ReleaseSession(sess);
    if(opts) api->ReleaseSessionOptions(opts);
    if(env)  api->ReleaseEnv(env);
    stwFIS_terminate();
    return 0;
}

