#include "file_io.h"
#include <stdio.h>
#include <stdlib.h>

void read_csv(const char *filename, float dataset[][INPUT_SIZE + OUTPUT_SIZE], int num_samples) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening dataset file");
        exit(EXIT_FAILURE);
    }
    char line[256];
    fgets(line, sizeof(line), file); // Skip header
    for (int i = 0; i < num_samples; i++) {
        for (int j = 0; j < INPUT_SIZE + OUTPUT_SIZE; j++) {
            if (fscanf(file, "%f,", &dataset[i][j]) != 1) {
                fprintf(stderr, "Error reading dataset at row %d, col %d\n", i, j);
                fclose(file);
                exit(EXIT_FAILURE);
            }
        }
    }
    fclose(file);
}

