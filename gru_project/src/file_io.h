#ifndef FILE_IO_H
#define FILE_IO_H

#include "config.h"

void read_csv(const char *filename, float dataset[][INPUT_SIZE + OUTPUT_SIZE], int num_samples);

#endif // FILE_IO_H
