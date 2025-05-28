#ifndef CONFIG_H
#define CONFIG_H
#define HIDDEN_SIZE 200  // Hidden units in GRU
#define NUM_WEIGHTS 8
#define INPUT_SIZE 3      // Number of input features (hcom_velocity, hip_angle, knee_angle)
#define OUTPUT_SIZE 2     // Number of output features (hip_torque, knee_torque)
#define INPUT_SEQ_LEN 25  // Input window size
#define OUTPUT_SEQ_LEN 5  // Output window size
#define NUM_SAMPLES 10000 // Update this based on dataset size
#define DATASET_FILE "dataset.csv"

#endif // CONFIG_H
