import tensorflow as tf
import numpy as np

# ✅ Load the model WITHOUT compilation to bypass the 'mse' issue
model = tf.keras.models.load_model("gru_model.h5", compile=False)

# Get GRU layers
gru_layers = [layer for layer in model.layers if isinstance(layer, tf.keras.layers.GRU)]
output_layer = model.layers[-1]  # Output dense layer

# Save GRU weights
weight_names = ["kernel", "recurrent_kernel", "bias"]
for i, layer in enumerate(gru_layers, start=1):
    weights = layer.get_weights()
    for name, weight in zip(weight_names, weights):
        np.savetxt(f"gru_weights/gru_layer_{i}_{name}.txt", weight.flatten(), delimiter=",")

# Save Output Layer weights
output_weights = output_layer.get_weights()
np.savetxt("gru_weights/output_kernel.txt", output_weights[0].flatten(), delimiter=",")
np.savetxt("gru_weights/output_bias.txt", output_weights[1].flatten(), delimiter=",")

print("✅ All weights saved successfully!")

