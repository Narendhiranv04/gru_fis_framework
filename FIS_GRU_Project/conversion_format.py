import tf2onnx
import onnx
import tensorflow as tf
import sys

# Define paths
pb_model_path = "/home/naren/FIS-20250303T182335Z-001/FIS/FIS_GRU_Project"  # Folder containing 'saved_model.pb'
onnx_model_path = "model_gru.onnx"

# Try using the tf2onnx command line approach instead
# This method directly uses the tf2onnx converter which is more reliable
try:
    from tf2onnx.tfonnx import process_tf_graph
    from tf2onnx.tf_loader import import_graphdef
    
    # Load the saved model
    graph_def, inputs, outputs = import_graphdef(pb_model_path)
    
    # Convert to ONNX
    onnx_model = process_tf_graph(graph_def, input_names=inputs, output_names=outputs)
    
    # Save the model
    onnx.save_model(onnx_model, onnx_model_path)
    print(f"ONNX model saved successfully at: {onnx_model_path}")
    
except Exception as e:
    print(f"Error with direct conversion: {e}")
    print("Trying alternative method using command line...")
    
    # Alternative method: Use the command line converter directly
    import subprocess
    cmd = [
        sys.executable, "-m", "tf2onnx.convert",
        "--saved-model", pb_model_path,
        "--output", onnx_model_path,
        "--opset", "13"
    ]
    try:
        result = subprocess.run(cmd, check=True, capture_output=True, text=True)
        print(result.stdout)
        print(f"ONNX model saved successfully at: {onnx_model_path}")
    except subprocess.CalledProcessError as e:
        print(f"Command line conversion failed: {e}")
        print("STDOUT:", e.stdout)
        print("STDERR:", e.stderr)
