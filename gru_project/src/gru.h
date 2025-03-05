#ifndef GRU_H
#define GRU_H

#include "config.h"

// GRU Forward Pass Function (Fixing the signature to accept 1D pointers)
void gru_forward_pass(float *input, float *hidden_state, float *output);

// RMSE Calculation Function
float compute_rmse(float *predicted, float *actual, int size);

#endif

