/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * stwFIS_initialize.c
 *
 * Code generation for function 'stwFIS_initialize'
 *
 */

/* Include files */
#include "stwFIS_initialize.h"
#include "rt_nonfinite.h"
#include "stwFIS_data.h"

/* Function Definitions */
void stwFIS_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_stwFIS = true;
}

/* End of code generation (stwFIS_initialize.c) */
