#include <stdio.h>
#include <stdlib.h>
#include "config.h"
#include "weights.h"

// Define GRU weight matrices
float bz[HIDDEN_SIZE];  
float Wz[HIDDEN_SIZE][INPUT_SIZE];
float Uz[HIDDEN_SIZE][HIDDEN_SIZE];

float br[HIDDEN_SIZE];  
float Wr[HIDDEN_SIZE][INPUT_SIZE];
float Ur[HIDDEN_SIZE][HIDDEN_SIZE];

float bh[HIDDEN_SIZE];  
float Wh[HIDDEN_SIZE][INPUT_SIZE];
float Uh[HIDDEN_SIZE][HIDDEN_SIZE];

float bo[OUTPUT_SIZE];  
float Wo[OUTPUT_SIZE][HIDDEN_SIZE];

const char *weight_files[NUM_WEIGHTS] = {
    "models/gru_weights/gru_layer_1_kernel.txt",
    "models/gru_weights/gru_layer_1_recurrent_kernel.txt",
    "models/gru_weights/gru_layer_1_bias.txt",
    "models/gru_weights/gru_layer_2_kernel.txt",
    "models/gru_weights/gru_layer_2_recurrent_kernel.txt",
    "models/gru_weights/gru_layer_2_bias.txt",
    "models/gru_weights/output_kernel.txt",
    "models/gru_weights/output_bias.txt"
};

// Function to read weights from text files
int load_weights() {
    FILE *file;

    // Load Update Gate Weights
    file = fopen(weight_files[0], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[0]); return -1; }
    for (int i = 0; i < HIDDEN_SIZE; i++)
        for (int j = 0; j < INPUT_SIZE; j++)
            if (fscanf(file, "%f", &Wz[i][j]) != 1) { printf("Error reading Wz\n"); fclose(file); return -1; }
    fclose(file);

    file = fopen(weight_files[1], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[1]); return -1; }
    for (int i = 0; i < HIDDEN_SIZE; i++)
        for (int j = 0; j < HIDDEN_SIZE; j++)
            if (fscanf(file, "%f", &Uz[i][j]) != 1) { printf("Error reading Uz\n"); fclose(file); return -1; }
    fclose(file);

    file = fopen(weight_files[2], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[2]); return -1; }
    for (int i = 0; i < HIDDEN_SIZE; i++)
        if (fscanf(file, "%f", &bz[i]) != 1) { printf("Error reading bz\n"); fclose(file); return -1; }
    fclose(file);

    // Load Reset Gate Weights
    file = fopen(weight_files[3], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[3]); return -1; }
    for (int i = 0; i < HIDDEN_SIZE; i++)
        for (int j = 0; j < INPUT_SIZE; j++)
            if (fscanf(file, "%f", &Wr[i][j]) != 1) { printf("Error reading Wr\n"); fclose(file); return -1; }
    fclose(file);

    file = fopen(weight_files[4], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[4]); return -1; }
    for (int i = 0; i < HIDDEN_SIZE; i++)
        for (int j = 0; j < HIDDEN_SIZE; j++)
            if (fscanf(file, "%f", &Ur[i][j]) != 1) { printf("Error reading Ur\n"); fclose(file); return -1; }
    fclose(file);

    file = fopen(weight_files[5], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[5]); return -1; }
    for (int i = 0; i < HIDDEN_SIZE; i++)
        if (fscanf(file, "%f", &br[i]) != 1) { printf("Error reading br\n"); fclose(file); return -1; }
    fclose(file);

    // Load Output Weights
    file = fopen(weight_files[6], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[6]); return -1; }
    for (int i = 0; i < OUTPUT_SIZE; i++)
        for (int j = 0; j < HIDDEN_SIZE; j++)
            if (fscanf(file, "%f", &Wo[i][j]) != 1) { printf("Error reading Wo\n"); fclose(file); return -1; }
    fclose(file);

    file = fopen(weight_files[7], "r");
    if (!file) { printf("Error: Cannot open %s\n", weight_files[7]); return -1; }
    for (int i = 0; i < OUTPUT_SIZE; i++)
        if (fscanf(file, "%f", &bo[i]) != 1) { printf("Error reading bo\n"); fclose(file); return -1; }
    fclose(file);

    printf("Weights loaded successfully!\n");
    return 0;
}

