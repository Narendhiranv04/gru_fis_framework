#include <math.h>
#include "gru.h"
#include "weights.h"

void gru_forward_pass(float input[INPUT_SIZE], float hidden_state[HIDDEN_SIZE], float output[OUTPUT_SIZE]) {
    float update_gate[HIDDEN_SIZE];
    float reset_gate[HIDDEN_SIZE];
    float candidate[HIDDEN_SIZE];

    // Compute Update Gate
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        update_gate[i] = bz[i];
        for (int j = 0; j < INPUT_SIZE; j++)
            update_gate[i] += Wz[i][j] * input[j];
        for (int j = 0; j < HIDDEN_SIZE; j++)
            update_gate[i] += Uz[i][j] * hidden_state[j];

        update_gate[i] = 1.0 / (1.0 + exp(-update_gate[i])); // Sigmoid
    }

    // Compute Reset Gate
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        reset_gate[i] = br[i];
        for (int j = 0; j < INPUT_SIZE; j++)
            reset_gate[i] += Wr[i][j] * input[j];
        for (int j = 0; j < HIDDEN_SIZE; j++)
            reset_gate[i] += Ur[i][j] * hidden_state[j];

        reset_gate[i] = 1.0 / (1.0 + exp(-reset_gate[i])); // Sigmoid
    }

    // Compute Candidate Activation
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        candidate[i] = bh[i];
        for (int j = 0; j < INPUT_SIZE; j++)
            candidate[i] += Wh[i][j] * input[j];
        for (int j = 0; j < HIDDEN_SIZE; j++)
            candidate[i] += Uh[i][j] * hidden_state[j] * reset_gate[j];

        candidate[i] = tanh(candidate[i]); // Tanh activation
    }

    // Compute Hidden State Update
    for (int i = 0; i < HIDDEN_SIZE; i++) {
        hidden_state[i] = (1.0 - update_gate[i]) * hidden_state[i] + update_gate[i] * candidate[i];
    }

    // Compute Output
    for (int i = 0; i < OUTPUT_SIZE; i++) {
        output[i] = bo[i];
        for (int j = 0; j < HIDDEN_SIZE; j++)
            output[i] += Wo[i][j] * hidden_state[j];
    }
}

