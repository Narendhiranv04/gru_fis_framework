#include "gru.h"
#include "weights.h"
#include <math.h>
#include <stdio.h>

// Sigmoid activation function
void sigmoid(float *x, int size) {
    for (int i = 0; i < size; i++) {
        x[i] = 1.0f / (1.0f + expf(-x[i]));
    }
}

// Tanh activation function
void tanh_activation(float *x, int size) {
    for (int i = 0; i < size; i++) {
        x[i] = tanhf(x[i]);
    }
}

// GRU forward pass function
void gru_forward_pass(float *input, float *hidden_state, float *output) {
    float update_gate[HIDDEN_SIZE], reset_gate[HIDDEN_SIZE], candidate[HIDDEN_SIZE];

    // Compute Update Gate: z = sigmoid(Wz * input + Uz * hidden_state + bz)
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        update_gate[i] = bz[i];
        for (int j = 0; j < INPUT_SIZE; j++) {
            update_gate[i] += Wz[i][j] * input[j];
        }
        for (int j = 0; j < HIDDEN_SIZE; j++) {
            update_gate[i] += Uz[i][j] * hidden_state[j];
        }
    }
    sigmoid(update_gate, HIDDEN_SIZE);

    // Compute Reset Gate: r = sigmoid(Wr * input + Ur * hidden_state + br)
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        reset_gate[i] = br[i];
        for (int j = 0; j < INPUT_SIZE; j++) {
            reset_gate[i] += Wr[i][j] * input[j];
        }
        for (int j = 0; j < HIDDEN_SIZE; j++) {
            reset_gate[i] += Ur[i][j] * hidden_state[j];
        }
    }
    sigmoid(reset_gate, HIDDEN_SIZE);

    // Compute Candidate: h_tilde = tanh(Wh * input + Uh * (reset_gate * hidden_state) + bh)
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        candidate[i] = bh[i];
        for (int j = 0; j < INPUT_SIZE; j++) {
            candidate[i] += Wh[i][j] * input[j];
        }
        for (int j = 0; j < HIDDEN_SIZE; j++) {
            candidate[i] += Uh[i][j] * hidden_state[j] * reset_gate[j];
        }
    }
    tanh_activation(candidate, HIDDEN_SIZE);

    // Compute Hidden State: h = (1 - z) * candidate + z * hidden_state
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        hidden_state[i] = (1 - update_gate[i]) * candidate[i] + update_gate[i] * hidden_state[i];
    }

    // Output Layer (Dense)
    for (int i = 0; i < OUTPUT_SIZE; i++) {
        output[i] = bo[i];
        for (int j = 0; j < HIDDEN_SIZE; j++) {
            output[i] += Wo[i][j] * hidden_state[j];
        }
    }
}

// Compute RMSE between predicted and actual values
float compute_rmse(float *predicted, float *actual, int size) {
    float error = 0.0;
    for (int i = 0; i < size; i++) {
        float diff = predicted[i] - actual[i];
        error += diff * diff;
    }
    return sqrtf(error / size);
}

