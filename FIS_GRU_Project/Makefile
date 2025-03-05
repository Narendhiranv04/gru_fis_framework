# Compiler & Flags
CC = gcc
CFLAGS = -Wall -Wextra -O2 -Wno-implicit-function-declaration -Iinclude
LDFLAGS = -lm  # Link with math library

# Source Files (FIS + GRU)
SRC = src/main.c src/stwFIS.c src/stwFIS_initialize.c src/stwFIS_terminate.c \
      src/stwFIS_data.c src/trapmf.c src/rt_nonfinite.c src/rtGetInf.c src/rtGetNaN.c \
      src/gru.c src/weights.c src/utils.c src/file_io.c

# Object Files (Generated from Source)
OBJ = $(SRC:.c=.o)

# Output Executable
TARGET = bin/fis_gru_exe

# Default Target
all: $(TARGET)

# Linking all object files to create the final executable
$(TARGET): $(OBJ)
	@echo "Linking FIS + GRU into $(TARGET)"
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ) $(LDFLAGS)

# Compilation Rule for C Files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean Up
clean:
	@echo "Cleaning up object files and executables..."
	rm -f $(OBJ) $(TARGET)

