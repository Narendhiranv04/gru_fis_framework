#include <stdio.h>
#include <math.h>
#include "gru.h"
#include "weights.h"

#define NUM_SAMPLES 10  // Number of test samples

// Ground truth (for RMSE calculation) - Should be dynamically loaded in a real scenario
float actual_outputs[NUM_SAMPLES][OUTPUT_SIZE] = {
    {0.1, -0.2}, {0.3, 0.5}, {0.0, 0.1}, {-0.1, 0.2}, {0.4, -0.3}, 
    {-0.2, 0.4}, {0.5, 0.6}, {-0.1, -0.4}, {0.3, -0.1}, {0.2, 0.0}
};

int main() {
    printf("Loading weights...\n");
    load_weights();
    
    float input[INPUT_SIZE] = {0.1, 0.2, 0.3};  // Example input: [hcom_vel, hip_angle, knee_angle]
    float hidden_state[HIDDEN_SIZE] = {0};      // Initialize hidden state
    float output[OUTPUT_SIZE];

    printf("\n--- Running GRU Inference ---\n");
    float total_rmse = 0.0;

    for (int i = 0; i < NUM_SAMPLES; i++) {
        // Correct function call using 1D arrays
        gru_forward_pass(input, hidden_state, output);

        // Compute RMSE for this sample
        float rmse_sample = compute_rmse(output, actual_outputs[i], OUTPUT_SIZE);
        total_rmse += rmse_sample;

        // Display prediction vs actual
        printf("\nSample %d:\n", i + 1);
        printf("  Predicted: [%f, %f]\n", output[0], output[1]);
        printf("  Actual:    [%f, %f]\n", actual_outputs[i][0], actual_outputs[i][1]);
        printf("  RMSE:      %f\n", rmse_sample);
    }

    // Compute final RMSE
    float final_rmse = total_rmse / NUM_SAMPLES;
    printf("\n=== Final RMSE: %f ===\n", final_rmse);

    return 0;
}

