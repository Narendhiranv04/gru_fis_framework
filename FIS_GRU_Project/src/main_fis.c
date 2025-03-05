// Include files
#include "main.h"
#include "rt_nonfinite.h"
#include "stwFIS.h"
#include "stwFIS_terminate.h"
#include <stdio.h>

/* Function Declarations */
static double argInit_real_T(void);

/* Function Definitions */
static double argInit_real_T(void)
{
  return 0.0;
}

int main(int argc, char *argv[])
{
  double hip = atof(argv[1]);
  double hcomVel = atof(argv[2]);
  double knee = atof(argv[3]);
  double onset;
  main_stwFIS();

  // Modification to test the FIS

  onset = stwFIS(hip,hcomVel,knee);

  printf("%.2f",onset);

  stwFIS_terminate();
  return 0;
}

void main_stwFIS(void)
{
  double hip_tmp;
  /* Initialize function 'stwFIS' input arguments. */
  hip_tmp = argInit_real_T();
  /* Call the entry-point 'stwFIS'. */
  hip_tmp = stwFIS(hip_tmp, hip_tmp, hip_tmp);
}