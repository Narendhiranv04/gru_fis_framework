/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_stwFIS_info.c
 *
 * Code generation for function 'stwFIS'
 *
 */

/* Include files */
#include "_coder_stwFIS_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void);

/* Function Definitions */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void)
{
  const mxArray *nameCaptureInfo;
  const char_T *data[4] = {
      "789c6360f4f465646060e0638000013608cd0be34369260654802ecf8883860156061614"
      "7d30f97e289d9c9f57925a5102e1e425e6a6c275a6e4e766e625e695"
      "845416a43214a516e7e794a5a68065d2327352433273538391397e205eae1b92149c0392"
      "02b19d335293b3834b73198a328a112ecc41e6c0c32301877f590884",
      "073a400f0f747523c5be1564da0733df85807d30f9e8d05867ab98d0e2d4a2e218e78cc4"
      "dce21897d4e2ec92fc82184f6042cb2bc9cccf5370492d494d06b162"
      "dc3c83159c159cf3535263d2328b5d124b12f572134b90dd9d80c35dfc44ba1b57bee065"
      "e000d319ff6f31d2d3be957de75be8691f0c0c947d1538cc2336dd89",
      "e1b04f004d3e2d3333dbdcdcd520caa7d030c0abd8ddc3b0d2c8dd1de18e0002f6107207"
      "030e3eadcd070042e752f3",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 1576U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *propFieldName[9] = {"Version",
                                    "ResolvedFunctions",
                                    "Checksum",
                                    "EntryPoints",
                                    "CoverageInfo",
                                    "IsPolymorphic",
                                    "PropertyList",
                                    "UUID",
                                    "ClassEntryPointIsHandle"};
  const char_T *epFieldName[8] = {
      "Name",     "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "FullPath", "TimeStamp",      "Constructor",     "Visible"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 8, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 3);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("stwFIS"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath",
                emlrtMxCreateString("C:\\Users\\Chams\\Desktop\\Intention "
                                    "Detection\\FIS C Code\\stwFIS.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739500.66104166664));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("24.1.0.2689473 (R2024a) Update 6"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("fiik77E0ZLq1PJsGH1y2GG"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/* End of code generation (_coder_stwFIS_info.c) */
