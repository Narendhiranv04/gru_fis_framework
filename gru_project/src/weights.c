#include <stdio.h>
#include <stdlib.h>
#include "weights.h"

// Allocate memory for weight matrices
float Wz[HIDDEN_SIZE][INPUT_SIZE], Wr[HIDDEN_SIZE][INPUT_SIZE], Wh[HIDDEN_SIZE][INPUT_SIZE];
float Uz[HIDDEN_SIZE][HIDDEN_SIZE], Ur[HIDDEN_SIZE][HIDDEN_SIZE], Uh[HIDDEN_SIZE][HIDDEN_SIZE];
float bz[HIDDEN_SIZE], br[HIDDEN_SIZE], bh[HIDDEN_SIZE];
float Wo[OUTPUT_SIZE][HIDDEN_SIZE], bo[OUTPUT_SIZE];

// Helper function to load matrix from file
void load_matrix(const char *filename, float *matrix, int rows, int cols) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening weight file");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < rows * cols; i++) {
        if (fscanf(file, "%f,", &matrix[i]) != 1) {
            perror("Error reading weight file");
            exit(EXIT_FAILURE);
        }
    }
    fclose(file);
}

// Function to load weights
void load_weights() {
    printf("Loading weights...\n");

    load_matrix("gru_weights/gru_layer_1_kernel.txt", (float *)Wz, HIDDEN_SIZE, INPUT_SIZE);
    load_matrix("gru_weights/gru_layer_1_recurrent_kernel.txt", (float *)Uz, HIDDEN_SIZE, HIDDEN_SIZE);
    load_matrix("gru_weights/gru_layer_1_bias.txt", bz, HIDDEN_SIZE, 1);

    load_matrix("gru_weights/gru_layer_2_kernel.txt", (float *)Wh, HIDDEN_SIZE, INPUT_SIZE);
    load_matrix("gru_weights/gru_layer_2_recurrent_kernel.txt", (float *)Uh, HIDDEN_SIZE, HIDDEN_SIZE);
    load_matrix("gru_weights/gru_layer_2_bias.txt", bh, HIDDEN_SIZE, 1);

    load_matrix("gru_weights/output_kernel.txt", (float *)Wo, OUTPUT_SIZE, HIDDEN_SIZE);
    load_matrix("gru_weights/output_bias.txt", bo, OUTPUT_SIZE, 1);

    printf("Weights loaded successfully!\n");
}

