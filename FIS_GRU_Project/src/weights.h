#ifndef WEIGHTS_H
#define WEIGHTS_H

#include "config.h"

extern float bz[HIDDEN_SIZE];   // Bias for update gate
extern float Wz[HIDDEN_SIZE][INPUT_SIZE];
extern float Uz[HIDDEN_SIZE][HIDDEN_SIZE];

extern float br[HIDDEN_SIZE];   // Bias for reset gate
extern float Wr[HIDDEN_SIZE][INPUT_SIZE];
extern float Ur[HIDDEN_SIZE][HIDDEN_SIZE];

extern float bh[HIDDEN_SIZE];   // Bias for candidate activation
extern float Wh[HIDDEN_SIZE][INPUT_SIZE];
extern float Uh[HIDDEN_SIZE][HIDDEN_SIZE];

extern float bo[OUTPUT_SIZE];   // Bias for output layer
extern float Wo[OUTPUT_SIZE][HIDDEN_SIZE];

int load_weights();

#endif

