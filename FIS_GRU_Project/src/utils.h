#ifndef UTILS_H
#define UTILS_H

#include "config.h"

void normalize(float dataset[][INPUT_SIZE + OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]);
void denormalize(float dataset[][OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]);
extern float compute_rmse(float predicted[][OUTPUT_SIZE], float actual[][OUTPUT_SIZE], int rows);  // Extern declaration

#endif  // UTILS_H

