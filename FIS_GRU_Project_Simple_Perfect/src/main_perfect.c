// Force ONNX Runtime API version 21
#undef ORT_API_VERSION
#define ORT_API_VERSION 21

#include <onnxruntime_c_api.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <dirent.h>
#include <time.h>

#include "stwFIS.h"
#include "stwFIS_terminate.h"

// Preprocessing and testing parameters
#define MOTION_THRESHOLD 0.5      // FIS threshold for motion detection
#define INPUT_WINDOW     25       // Past 25 timesteps as input window
#define OUTPUT_WINDOW    5        // Predict next 5 timesteps (one-shot model output)
#define NUM_COLS         5        // 3 features + 2 targets (after dropping "time" and "counter")
#define FEATURE_COLS     3        // hcom_velocity, hip_angle, knee_angle
#define TARGET_COLS      2        // hip_torque, knee_torque
#define MAX_LINE_LENGTH  1024

// Global ONNX Runtime variables
static const OrtApi* g_ort = NULL;
static OrtEnv* g_env = NULL;
static OrtSession* g_session = NULL;
static OrtSessionOptions* g_session_options = NULL;
static OrtAllocator* g_allocator = NULL;

//------------------------------------------------------
// ONNX Model Initialization and One-Shot Inference Function
//------------------------------------------------------
int init_onnx_model(const char* model_path) {
    OrtStatus* status = NULL;
    g_ort = OrtGetApiBase()->GetApi(21);
    status = g_ort->CreateEnv(ORT_LOGGING_LEVEL_WARNING, "test", &g_env);
    if (status != NULL) {
        fprintf(stderr, "Error creating ONNX env: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        return -1;
    }
    status = g_ort->CreateSessionOptions(&g_session_options);
    if (status != NULL) {
        fprintf(stderr, "Error creating session options: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        return -1;
    }
    g_ort->SetIntraOpNumThreads(g_session_options, 1);
    status = g_ort->CreateSession(g_env, model_path, g_session_options, &g_session);
    if (status != NULL) {
        fprintf(stderr, "Error creating session from model %s: %s\n", model_path, g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        return -1;
    }
    status = g_ort->GetAllocatorWithDefaultOptions(&g_allocator);
    if (status != NULL) {
        fprintf(stderr, "Error getting allocator: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        return -1;
    }
    return 0;
}

int onnx_inference(const float *input_seq, float *output_pred) {
    OrtStatus* status = NULL;
    int64_t input_dims[3] = {1, INPUT_WINDOW, FEATURE_COLS};
    size_t input_tensor_size = 1 * INPUT_WINDOW * FEATURE_COLS;
    int64_t output_dims[3] = {1, OUTPUT_WINDOW, TARGET_COLS};
    size_t output_tensor_size = 1 * OUTPUT_WINDOW * TARGET_COLS;

    OrtMemoryInfo* memory_info = NULL;
    status = g_ort->CreateCpuMemoryInfo(OrtArenaAllocator, OrtMemTypeDefault, &memory_info);
    if (status != NULL) {
        fprintf(stderr, "Error creating CPU memory info: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        return -1;
    }
    OrtValue* input_tensor = NULL;
    status = g_ort->CreateTensorWithDataAsOrtValue(memory_info, (void*)input_seq,
                                                     input_tensor_size * sizeof(float),
                                                     input_dims, 3,
                                                     ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT,
                                                     &input_tensor);
    g_ort->ReleaseMemoryInfo(memory_info);
    if (status != NULL) {
        fprintf(stderr, "Error creating input tensor: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        return -1;
    }
    char* actual_input_name = NULL;
    OrtStatus* status_in = g_ort->SessionGetInputName(g_session, 0, g_allocator, &actual_input_name);
    if (status_in != NULL) {
        fprintf(stderr, "Error getting input name: %s\n", g_ort->GetErrorMessage(status_in));
        g_ort->ReleaseStatus(status_in);
        g_ort->ReleaseValue(input_tensor);
        return -1;
    }
    char* actual_output_name = NULL;
    OrtStatus* status_out = g_ort->SessionGetOutputName(g_session, 0, g_allocator, &actual_output_name);
    if (status_out != NULL) {
        fprintf(stderr, "Error getting output name: %s\n", g_ort->GetErrorMessage(status_out));
        g_ort->ReleaseStatus(status_out);
        g_ort->ReleaseValue(input_tensor);
        g_ort->AllocatorFree(g_allocator, actual_input_name);
        return -1;
    }
    printf("Model input name: %s\n", actual_input_name);
    printf("Model output name: %s\n", actual_output_name);
    const char* input_names[] = { actual_input_name };
    const char* output_names[] = { actual_output_name };

    OrtValue* output_tensor = NULL;
    status = g_ort->Run(g_session, NULL, input_names,
                        (const OrtValue* const *)&input_tensor, 1,
                        output_names, 1, &output_tensor);
    if (status != NULL) {
        fprintf(stderr, "Error during ONNX inference: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        g_ort->ReleaseValue(input_tensor);
        g_ort->AllocatorFree(g_allocator, actual_input_name);
        g_ort->AllocatorFree(g_allocator, actual_output_name);
        return -1;
    }
    float* output_data = NULL;
    status = g_ort->GetTensorMutableData(output_tensor, (void**)&output_data);
    if (status != NULL) {
        fprintf(stderr, "Error getting output tensor data: %s\n", g_ort->GetErrorMessage(status));
        g_ort->ReleaseStatus(status);
        g_ort->ReleaseValue(input_tensor);
        g_ort->ReleaseValue(output_tensor);
        g_ort->AllocatorFree(g_allocator, actual_input_name);
        g_ort->AllocatorFree(g_allocator, actual_output_name);
        return -1;
    }
    memcpy(output_pred, output_data, output_tensor_size * sizeof(float));

    g_ort->ReleaseValue(input_tensor);
    g_ort->ReleaseValue(output_tensor);
    g_ort->AllocatorFree(g_allocator, actual_input_name);
    g_ort->AllocatorFree(g_allocator, actual_output_name);
    return 0;
}

//-----------------------------------------
// FIS Initialization Functions
//-----------------------------------------
static double argInit_real_T(void) {
    return 0.0;
}
void main_stwFIS(void) {
    double hip_tmp = argInit_real_T();
    hip_tmp = stwFIS(hip_tmp, hip_tmp, hip_tmp);
}

//-----------------------------------------
// CSV Loading and Preprocessing Functions
//-----------------------------------------
int load_dataset_from_directory(const char *directory, float **dataset, int *num_rows) {
    DIR *dir = opendir(directory);
    if (!dir) {
        perror("opendir");
        return -1;
    }
    struct dirent *entry;
    int capacity = 1000;
    *dataset = (float *)malloc(capacity * NUM_COLS * sizeof(float));
    if (!*dataset) {
        perror("malloc");
        closedir(dir);
        return -1;
    }
    *num_rows = 0;
    char filepath[1024];
    while ((entry = readdir(dir)) != NULL) {
        if (entry->d_type == DT_REG && strstr(entry->d_name, ".csv") != NULL) {
            snprintf(filepath, sizeof(filepath), "%s/%s", directory, entry->d_name);
            FILE *f = fopen(filepath, "r");
            if (!f) {
                perror("fopen");
                continue;
            }
            char line[MAX_LINE_LENGTH];
            int first_line = 1;  // skip header
            while (fgets(line, MAX_LINE_LENGTH, f)) {
                if (first_line) { first_line = 0; continue; }
                line[strcspn(line, "\n")] = 0;
                char *token;
                int col = 0;
                float row_values[7];
                token = strtok(line, ",");
                while (token && col < 7) {
                    row_values[col] = atof(token);
                    token = strtok(NULL, ",");
                    col++;
                }
                if (col < 7)
                    continue;
                if (*num_rows >= capacity) {
                    capacity *= 2;
                    *dataset = (float *)realloc(*dataset, capacity * NUM_COLS * sizeof(float));
                    if (!*dataset) {
                        perror("realloc");
                        fclose(f);
                        closedir(dir);
                        return -1;
                    }
                }
                for (int i = 0; i < NUM_COLS; i++) {
                    (*dataset)[(*num_rows) * NUM_COLS + i] = row_values[i + 2];
                }
                (*num_rows)++;
            }
            fclose(f);
        }
    }
    closedir(dir);
    return 0;
}

void compute_min_max(const float *dataset, int num_rows, int start_col, int num_cols, float *min_arr, float *max_arr) {
    for (int j = 0; j < num_cols; j++) {
        min_arr[j] = dataset[0 * NUM_COLS + start_col + j];
        max_arr[j] = dataset[0 * NUM_COLS + start_col + j];
    }
    for (int i = 0; i < num_rows; i++) {
        for (int j = 0; j < num_cols; j++) {
            float val = dataset[i * NUM_COLS + start_col + j];
            if (val < min_arr[j])
                min_arr[j] = val;
            if (val > max_arr[j])
                max_arr[j] = val;
        }
    }
}

//-----------------------------------------
// Main Testing Routine (using validation data, one-shot inference, FIS check, and RMSE computation)
//-----------------------------------------
int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <csv_directory> <model.onnx>\n", argv[0]);
        return 1;
    }
    const char *csv_directory = argv[1];
    const char *model_path = argv[2];

    // Load dataset.
    float *dataset = NULL;
    int total_rows = 0;
    if (load_dataset_from_directory(csv_directory, &dataset, &total_rows) != 0) {
        printf("Failed to load dataset from directory.\n");
        return 1;
    }
    printf("Loaded dataset with %d rows.\n", total_rows);

    // Compute min and max for features (columns 0-2) and targets (columns 3-4).
    float X_min[FEATURE_COLS], X_max[FEATURE_COLS];
    float Y_min[TARGET_COLS], Y_max[TARGET_COLS];
    compute_min_max(dataset, total_rows, 0, FEATURE_COLS, X_min, X_max);
    compute_min_max(dataset, total_rows, FEATURE_COLS, TARGET_COLS, Y_min, Y_max);

    // Compute scaled features.
    float *X_scaled = (float *)malloc(total_rows * FEATURE_COLS * sizeof(float));
    float *Y_scaled = (float *)malloc(total_rows * TARGET_COLS * sizeof(float));
    if (!X_scaled || !Y_scaled) {
        perror("malloc");
        free(dataset);
        return 1;
    }
    for (int i = 0; i < total_rows; i++) {
        for (int j = 0; j < FEATURE_COLS; j++) {
            float val = dataset[i * NUM_COLS + j];
            float range = X_max[j] - X_min[j];
            X_scaled[i * FEATURE_COLS + j] = (range == 0) ? 0 : (val - X_min[j]) / range;
        }
        for (int j = 0; j < TARGET_COLS; j++) {
            float val = dataset[i * NUM_COLS + FEATURE_COLS + j];
            float range = Y_max[j] - Y_min[j];
            Y_scaled[i * TARGET_COLS + j] = (range == 0) ? 0 : (val - Y_min[j]) / range;
        }
    }

    // Split dataset: 70% training, 20% validation, 10% test.
    int train_size = (int)(0.7 * total_rows);
    int val_size = (int)(0.2 * total_rows);
    int test_size = total_rows - (train_size + val_size);
    printf("Train size: %d, Val size: %d, Test size: %d\n", train_size, val_size, test_size);

    // Use validation data: indices [train_size, train_size+val_size-1].
    int val_start = train_size;
    int num_val_windows = val_size - INPUT_WINDOW - OUTPUT_WINDOW + 1;
    if (num_val_windows <= 0) {
        printf("Not enough validation data for sliding windows.\n");
        free(dataset);
        free(X_scaled);
        free(Y_scaled);
        return 1;
    }
    srand(time(NULL));
    int random_window = rand() % num_val_windows;
    int window_start = val_start + random_window;
    printf("Randomly selected validation window starting at row %d (of dataset)\n", window_start);

    // --- FIS Check ---
    // Check each row in the selected 25-step window (using raw, unscaled values)
    // Here, we assume: column 1 = hip_angle, column 0 = hcom_velocity, column 2 = knee_angle.
    int motion_detected = 0;
    for (int t = 0; t < INPUT_WINDOW; t++) {
        int row_index = window_start + t;
        double raw_hip = dataset[row_index * NUM_COLS + 1];
        double raw_hcom = dataset[row_index * NUM_COLS + 0];
        double raw_knee = dataset[row_index * NUM_COLS + 2];
        double onset = stwFIS(raw_hip, raw_hcom, raw_knee);
        printf("FIS onset for row %d: %.8f\n", row_index, onset);
        if (onset > MOTION_THRESHOLD) {
            motion_detected = 1;
            // Optionally, break if you only care about at least one trigger.
            // break;
        }
    }
    if (!motion_detected) {
        printf("No significant motion detected in the 25-step window. GRU inference skipped.\n");
        free(dataset);
        free(X_scaled);
        free(Y_scaled);
        return 0;
    }

    // Prepare the input sequence from the selected window (using scaled features).
    float input_seq[INPUT_WINDOW * FEATURE_COLS];
    for (int t = 0; t < INPUT_WINDOW; t++) {
        int row_index = window_start + t;
        for (int j = 0; j < FEATURE_COLS; j++) {
            input_seq[t * FEATURE_COLS + j] = X_scaled[row_index * FEATURE_COLS + j];
        }
    }

    // Check ground truth availability for the next OUTPUT_WINDOW timesteps.
    if (window_start + INPUT_WINDOW + OUTPUT_WINDOW - 1 >= train_size + val_size) {
        printf("Not enough validation data for output window comparison.\n");
        free(dataset);
        free(X_scaled);
        free(Y_scaled);
        return 1;
    }

    // Initialize the ONNX model.
    printf("Loading ONNX model from: %s\n", model_path);
    if (init_onnx_model(model_path) != 0) {
        printf("Failed to initialize ONNX model. Exiting...\n");
        free(dataset);
        free(X_scaled);
        free(Y_scaled);
        return 1;
    }
    printf("ONNX model loaded successfully!\n");

    // Run one-shot inference.
    float output_pred[OUTPUT_WINDOW * TARGET_COLS];
    if (onnx_inference(input_seq, output_pred) != 0) {
        printf("ONNX inference failed.\n");
        free(dataset);
        free(X_scaled);
        free(Y_scaled);
        return 1;
    }

    // Inverse-scale predictions and print them.
    printf("\nOne-shot Predictions (next %d timesteps):\n", OUTPUT_WINDOW);
    double predictions[OUTPUT_WINDOW][TARGET_COLS];
    for (int step = 0; step < OUTPUT_WINDOW; step++) {
        for (int k = 0; k < TARGET_COLS; k++) {
            predictions[step][k] = output_pred[step * TARGET_COLS + k] * (Y_max[k] - Y_min[k]) + Y_min[k];
            printf("Step %d Predicted (feature %d): %.8f\t", step + 1, k, predictions[step][k]);
        }
        printf("\n");
    }

    // Inverse-scale ground truth and print it.
    printf("\nGround Truth (next %d timesteps):\n", OUTPUT_WINDOW);
    double ground_truth[OUTPUT_WINDOW][TARGET_COLS];
    for (int i = 0; i < OUTPUT_WINDOW; i++) {
        int row_index = window_start + INPUT_WINDOW + i;
        for (int k = 0; k < TARGET_COLS; k++) {
            ground_truth[i][k] = Y_scaled[row_index * TARGET_COLS + k] * (Y_max[k] - Y_min[k]) + Y_min[k];
            printf("Step %d Actual (feature %d): %.8f\t", i + 1, k, ground_truth[i][k]);
        }
        printf("\n");
    }

    // Calculate RMSE for each target (hip and knee) over the 5 timesteps.
    double sum_sq_hip = 0.0, sum_sq_knee = 0.0;
    for (int i = 0; i < OUTPUT_WINDOW; i++) {
        double diff_hip = predictions[i][0] - ground_truth[i][0];
        double diff_knee = predictions[i][1] - ground_truth[i][1];
        sum_sq_hip += diff_hip * diff_hip;
        sum_sq_knee += diff_knee * diff_knee;
    }
    double rmse_hip = sqrt(sum_sq_hip / OUTPUT_WINDOW);
    double rmse_knee = sqrt(sum_sq_knee / OUTPUT_WINDOW);
    printf("\nMean RMSE:\nHip Torque: %.8f\nKnee Torque: %.8f\n", rmse_hip, rmse_knee);

    free(dataset);
    free(X_scaled);
    free(Y_scaled);

    // Clean up ONNX Runtime resources.
    if (g_session) g_ort->ReleaseSession(g_session);
    if (g_session_options) g_ort->ReleaseSessionOptions(g_session_options);
    if (g_env) g_ort->ReleaseEnv(g_env);

    stwFIS_terminate();
    printf("\nInference complete.\n");
    return 0;
}

