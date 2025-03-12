# gru_fis_framework


✅ Essential Files and Dependencies
📌 C Source and Header Files

    main.c (Your current inference code, with ONNX runtime and FIS logic)
    stwFIS.c and stwFIS.h
        MATLAB-generated FIS implementation in C.
    rt_nonfinite.c, rt_nonfinite.h (Matlab-generated, typically for numerical stability handling)
    stwFIS_terminate.c and stwFIS_terminate.h (Termination cleanup functions for FIS)

📌 ONNX Runtime Files

    ONNX Runtime binaries (onnxruntime.so or .a libraries)
    ONNX headers:
        onnxruntime_c_api.h
        (Include appropriate version-specific headers)

📌 GRU Model Files

    Exported GRU model file: model_gru.onnx

📌 Dataset Files

    Directory with your CSV data files:
        Ensure correct structure (all_data/*.csv)
        Clearly define which columns represent features and targets.
