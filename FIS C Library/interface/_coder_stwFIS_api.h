/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_stwFIS_api.h
 *
 * Code generation for function 'stwFIS'
 *
 */

#ifndef _CODER_STWFIS_API_H
#define _CODER_STWFIS_API_H

/* Include files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"
#include <string.h>

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
real_T stwFIS(real_T hip, real_T hcomVel, real_T knee);

void stwFIS_api(const mxArray *const prhs[3], const mxArray **plhs);

void stwFIS_atexit(void);

void stwFIS_initialize(void);

void stwFIS_terminate(void);

void stwFIS_xil_shutdown(void);

void stwFIS_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/* End of code generation (_coder_stwFIS_api.h) */
