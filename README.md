# FIS + GRU Project

This repository contains a combined Fuzzy Inference System (FIS) + Gated Recurrent Unit (GRU) demo in C,  
as well as Python scripts for data preparation and model conversion.

---

## Prerequisites

- **Git**  
- **C toolchain** (e.g. `gcc`, `make`)  
- **Python 3.7+**  

---

## 1. Clone the repo

```bash
git clone https://github.com/Narendhiranv04/gru_fis_framework.git
cd gru_fis_framework
````

---

## 2. Create & activate a Python virtual environment

```bash
python3 -m venv .venv
source .venv/bin/activate
```

---

## 3. Install Python dependencies

```bash
pip install --upgrade pip
pip install \
  numpy \
  pandas \
  scikit-learn \
  scipy \
  h5py \
  onnxruntime
```

---



You should now have:

```
├── include/
├── src/
├── onnxruntime-linux-x64-1.21.0/
│   ├── include/
│   └── lib/
└── Makefile
```


## 4. Build the C executable

```bash
make clean all
```

* Compiles sources in `src/` → `build/*.o`
* Links against ONNX Runtime → `bin/fis_gru_exe`
* Embeds an rpath so you don’t need to set `LD_LIBRARY_PATH`

---

## 6. Run the demo

```bash
./bin/fis_gru_exe /test_data_unshuffled.csv /model_gru.onnx

```

---

## 7. Deactivate the Python virtual environment

```bash
deactivate
```

## Output
![image](https://github.com/user-attachments/assets/5829c4cf-3db4-4d55-b035-1bbd175af128)

CSV file containing the FIS offset value along with hip and knee torques is also saved accordingly.



