#include <stdio.h>
#include <stdlib.h>
#include "stwFIS.h"
#include "stwFIS_terminate.h"
#include "gru.h"
#include "weights.h"

#define MOTION_THRESHOLD 0.5  // Threshold for triggering GRU

int main(int argc, char *argv[]) {
    if (argc < 4) {
        printf("Usage: %s <hip> <hcomVel> <knee>\n", argv[0]);
        return 1;
    }

    // Read input arguments
    double hip = atof(argv[1]);
    double hcomVel = atof(argv[2]);
    double knee = atof(argv[3]);

    // Step 1: Run FIS
    printf("\n--- Running FIS Inference ---\n");
    double onset = stwFIS(hip, hcomVel, knee);
    printf("FIS Output (Onset Value): %.2f\n", onset);

    // If motion is detected, run GRU
    if (onset > MOTION_THRESHOLD) {
        printf("Motion detected (%.2f > %.2f), triggering GRU...\n", onset, MOTION_THRESHOLD);

        // Step 2: Load GRU Weights
        if (load_weights() != 0) {
            printf("Failed to load GRU weights. Exiting...\n");
            return 1;
        }

        // Step 3: Run GRU Inference
        float input[INPUT_SIZE] = {hip, hcomVel, knee};
        float hidden_state[HIDDEN_SIZE] = {0};  // Initialize hidden state
        float output[OUTPUT_SIZE];

        gru_forward_pass(input, hidden_state, output);

        // Display predictions
        printf("\n--- GRU Prediction ---\n");
        printf("Predicted Output: [%f, %f]\n", output[0], output[1]);
    } else {
        printf("No significant motion detected. GRU inference skipped.\n");
    }

    // Step 4: Clean Up
    stwFIS_terminate();
    return 0;
}

