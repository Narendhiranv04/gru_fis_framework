/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * trapmf.c
 *
 * Code generation for function 'trapmf'
 *
 */

/* Include files */
#include "trapmf.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"

/* Function Definitions */
double trapmf(double x, const double params[4])
{
  double u0;
  double y;
  u0 = 0.0;
  y = 0.0;
  if (x >= params[1]) {
    u0 = 1.0;
  }
  if (x < params[0]) {
    u0 = 0.0;
  }
  if ((params[0] <= x) && (x < params[1]) && (params[0] != params[1])) {
    u0 = (x - params[0]) * (1.0 / (params[1] - params[0]));
  }
  if (x <= params[2]) {
    y = 1.0;
  }
  if (x > params[3]) {
    y = 0.0;
  }
  if ((params[2] < x) && (x <= params[3]) && (params[2] != params[3])) {
    y = (params[3] - x) * (1.0 / (params[3] - params[2]));
  }
  if ((u0 <= y) || rtIsNaN(y)) {
    y = u0;
  }
  return y;
}

/* End of code generation (trapmf.c) */
