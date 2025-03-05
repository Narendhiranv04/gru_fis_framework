CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -lm
SRC = src/main.c src/gru.c src/weights.c
OBJ = $(SRC:.c=.o)
TARGET = gru_inference

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ) $(LDFLAGS)

clean:
	rm -f $(OBJ) $(TARGET)

