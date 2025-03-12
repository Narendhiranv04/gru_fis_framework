

import tensorflow as tf
import os

# Load the trained model
h5_model_path = "/home/naren/Downloads/simple_gru_model.h5"  # Update with actual path
pb_model_dir = ""  # Directory to save the PB model

# Define the custom loss function explicitly
custom_objects = {
    "mse": tf.keras.losses.MeanSquaredError()
}

# Load the Keras model with custom loss function handling
model = tf.keras.models.load_model(h5_model_path, custom_objects=custom_objects)

# Save the model in TensorFlow's SavedModel format
tf.saved_model.save(model, pb_model_dir)

print(f"✅ Model successfully saved in Protocol Buffer (.pb) format at: {pb_model_dir}")

