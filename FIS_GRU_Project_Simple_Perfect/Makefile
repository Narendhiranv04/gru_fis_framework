#———————————————————————————
# Configurable install path for ONNX Runtime
#———————————————————————————
# point this at wherever you unpack onnxruntime-linux-x64-*/  
# defaults to the subfolder next to your Makefile
ONNX_HOME       ?= $(CURDIR)/onnxruntime-linux-x64-1.21.0
ORT_API_VERSION ?= 21

#———————————————————————————
# Detect the versioned .so inside ONNX_HOME/lib
#———————————————————————————
# we look for libonnxruntime.so.* (e.g. libonnxruntime.so.1.21.0)
ORT_LIB := $(notdir $(firstword $(wildcard $(ONNX_HOME)/lib/libonnxruntime.so.*)))
ifeq ($(ORT_LIB),)
  $(error could not find any libonnxruntime.so.* under $(ONNX_HOME)/lib)
endif

#———————————————————————————
# Compiler & flags
#———————————————————————————
CC     := gcc
CFLAGS := -Wall -Wextra -O2 \
          -Wno-implicit-function-declaration \
          -DORT_API_VERSION=$(ORT_API_VERSION) \
          -Iinclude \
          -I$(ONNX_HOME)/include

# link with the exact versioned .so and embed an rpath
LDFLAGS := -L$(ONNX_HOME)/lib \
           -Wl,-rpath=$(ONNX_HOME)/lib \
           -l:$(ORT_LIB) \
           -lm

#———————————————————————————
# sources / objects / target
#———————————————————————————
SRC    := \
    src/main.c \
    src/stwFIS.c src/stwFIS_initialize.c src/stwFIS_terminate.c \
    src/stwFIS_data.c src/trapmf.c src/rt_nonfinite.c \
    src/rtGetInf.c src/rtGetNaN.c \
    src/gru.c src/weights.c src/utils.c src/file_io.c

OBJ    := $(SRC:src/%.c=build/%.o)
TARGET := bin/fis_gru_exe

#———————————————————————————
# build rules
#———————————————————————————
.PHONY: all clean
all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(dir $@)
	@echo "Linking → $@"
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

build/%.o: src/%.c
	@mkdir -p $(dir $@)
	@echo "Compiling $<"
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "Cleaning…"
	rm -rf build/*.o $(TARGET)

