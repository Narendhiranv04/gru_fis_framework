#main.c, rt_nonfinite.c, rtGetInf.c, rtGetNaN.c, stwFIS_data.c, stwFIS_initialize.c
#stwFIS_terminate.c, stwFIS.c, trapmf.c

# Makefile for FIS 
CFLAGS = -Wno-implicit-function-declaration
CC = gcc

# The final output
all: final_STW_FIS

# Files required for final
# final: main.o
final_STW_FIS: main.o rt_nonfinite.o rtGetInf.o rtGetNaN.o stwFIS.o stwFIS_initialize.o stwFIS_terminate.o stwFIS_data.o trapmf.o
	@echo "Linking for final application"
	$(CC) $(CFLAGS) main.o rt_nonfinite.o rtGetInf.o rtGetNaN.o stwFIS.o stwFIS_initialize.o stwFIS_terminate.o stwFIS_data.o trapmf.o -o final_STW_FIS

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

rt_nonfinite.o: rt_nonfinite.c
	$(CC) $(CFLAGS) -c rt_nonfinite.c

rtGetInf.o: rtGetInf.c
	$(CC) $(CFLAGS) -c rtGetInf.c

rtGetNaN.o: rtGetNaN.c
	$(CC) $(CFLAGS) -c rtGetNaN.c

stwFIS.o: stwFIS.c
	$(CC) $(CFLAGS) -c stwFIS.c

stwFIS_initialize.o: stwFIS_initialize.c
	$(CC) $(CFLAGS) -c stwFIS_initialize.c

stwFIS_terminate.o: stwFIS_terminate.c
	$(CC) $(CFLAGS) -c stwFIS_terminate.c

stwFIS_data.o: stwFIS_data.c
	$(CC) $(CFLAGS) -c stwFIS_data.c

trapmf.o: trapmf.c
	$(CC) $(CFLAGS) -c trapmf.c

clean:
	@echo "remove all the created .o files and the .exe file"
	del main.o rt_nonfinite.o rtGetInf.o rtGetNaN.o stwFIS.o stwFIS_initialize.o stwFIS_terminate.o stwFIS_data.o trapmf.o final_STW_FIS.exe