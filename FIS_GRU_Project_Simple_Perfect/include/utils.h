#ifndef UTILS_H
#define UTILS_H

void normalize(float dataset[][INPUT_SIZE + OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]);
void denormalize(float dataset[][OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]);
float compute_rmse(float predicted[][OUTPUT_SIZE], float actual[][OUTPUT_SIZE], int rows);

#endif // UTILS_H
