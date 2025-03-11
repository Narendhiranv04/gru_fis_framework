# 🚀 FIS-GRU Inference Project Setup Guide

This guide covers setting up, running, and deploying the Fuzzy Inference System (FIS) integrated with a GRU-based ONNX model using ONNX Runtime on your Raspberry Pi.

---

## 📌 **Step-by-Step Setup**

### 1. 📂 **Clone Repository**

```bash
git clone https://github.com/Narendhiranv04/gru_fis_framework
cd FIS_GRU_Project
```

## 🔧 Environment Setup

### Step 1: **Install Python and Virtual Environment**

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

### Step 2: **Create and Activate Virtual Environment**

```bash
python3 -m venv tflite_env
source tflite_env/bin/activate
```

### Step 3: **Install Python Dependencies**

```bash
pip install numpy pandas sklearn scipy onnxruntime
```

---


## 🛠️ Compilation and Execution

### Step 1: **Install ONNX Runtime for C**

Download and extract ONNX Runtime for ARM (for Raspberry Pi):

```bash
wget onnxruntime-linux-x64-1.21.0.tgz
tar -xzvf /home/naren/Downloads/onnxruntime-linux-x64-1.21.0.tgz
```

Set up paths for `include` and `lib`.

### Step 2: **Compile the Project**

```bash
make clean
make 
```

Make sure paths to ONNX Runtime are correctly specified.

### Step 2: **Run the Executable**

```bash
./bin/fis_gru_exe ./all_data ./model_gru.onnx
```

You should see outputs for predictions, ground truth values, and RMSE.

---

## 🖥️ Deploying on Raspberry Pi

Yet - to - be - done

