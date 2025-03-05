#include "utils.h"
#include <math.h>
#include <stdio.h>

void normalize(float dataset[][INPUT_SIZE + OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]) {
    for (int j = 0; j < INPUT_SIZE + OUTPUT_SIZE; j++) {
        min_vals[j] = dataset[0][j];
        max_vals[j] = dataset[0][j];
        for (int i = 1; i < num_samples; i++) {
            if (dataset[i][j] < min_vals[j]) min_vals[j] = dataset[i][j];
            if (dataset[i][j] > max_vals[j]) max_vals[j] = dataset[i][j];
        }
    }
    for (int i = 0; i < num_samples; i++) {
        for (int j = 0; j < INPUT_SIZE + OUTPUT_SIZE; j++) {
            dataset[i][j] = (dataset[i][j] - min_vals[j]) / (max_vals[j] - min_vals[j]);
        }
    }
}

void denormalize(float dataset[][OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]) {
    for (int i = 0; i < num_samples; i++) {
        for (int j = 0; j < OUTPUT_SIZE; j++) {
            dataset[i][j] = dataset[i][j] * (max_vals[j] - min_vals[j]) + min_vals[j];
        }
    }
}

float compute_rmse(float predicted[][OUTPUT_SIZE], float actual[][OUTPUT_SIZE], int rows) {
    float sum = 0.0;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < OUTPUT_SIZE; j++) {
            float diff = predicted[i][j] - actual[i][j];
            sum += diff * diff;
        }
    }
    return sqrt(sum / (rows * OUTPUT_SIZE));
}

