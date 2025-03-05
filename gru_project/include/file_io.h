#ifndef FILE_IO_H
#define FILE_IO_H

#include <stdio.h>
#include <stdlib.h>

// Function to load weights from text files
void load_weights(const char *filename, float *weights, int rows, int cols);

#endif

