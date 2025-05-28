#ifndef WEIGHTS_H
#define WEIGHTS_H

#include "config.h"

// Declare weight matrices and bias vectors
extern float Wz[HIDDEN_SIZE][INPUT_SIZE], Wr[HIDDEN_SIZE][INPUT_SIZE], Wh[HIDDEN_SIZE][INPUT_SIZE];
extern float Uz[HIDDEN_SIZE][HIDDEN_SIZE], Ur[HIDDEN_SIZE][HIDDEN_SIZE], Uh[HIDDEN_SIZE][HIDDEN_SIZE];
extern float bz[HIDDEN_SIZE], br[HIDDEN_SIZE], bh[HIDDEN_SIZE];
extern float Wo[OUTPUT_SIZE][HIDDEN_SIZE], bo[OUTPUT_SIZE];

// Function to load weights from text files
void load_weights();

#endif

