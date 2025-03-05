#ifndef GRU_H
#define GRU_H

#include <stdio.h>
#include <stdlib.h>

#define INPUT_SIZE 3      // (hcom_velocity, hip_angle, knee_angle)
#define OUTPUT_SIZE 2     // (hip_torque, knee_torque)
#define SEQ_LEN 25        // Input sequence length
#define PRED_LEN 5        // Prediction window
#define HIDDEN_UNITS 200  // GRU hidden units

// Function to perform GRU forward pass
void gru_forward(float input[SEQ_LEN][INPUT_SIZE], float output[PRED_LEN][OUTPUT_SIZE]);

#endif

