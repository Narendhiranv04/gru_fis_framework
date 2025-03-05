#include <math.h>  // Ensure sqrt() is available
#include "utils.h"
#include "config.h"  // Ensure INPUT_SIZE and OUTPUT_SIZE are available

void normalize(float dataset[][INPUT_SIZE + OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]) {
    (void)dataset;  // Suppress unused parameter warning
    (void)num_samples;
    (void)min_vals;
    (void)max_vals;
    // Normalization logic (if needed)
}

void denormalize(float dataset[][OUTPUT_SIZE], int num_samples, float min_vals[], float max_vals[]) {
    (void)dataset;  // Suppress unused parameter warning
    (void)num_samples;
    (void)min_vals;
    (void)max_vals;
    // Denormalization logic (if needed)
}

