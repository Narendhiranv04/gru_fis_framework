/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * stwFIS.c
 *
 * Code generation for function 'stwFIS'
 *
 */

/* Include files */
#include "stwFIS.h"
#include "rt_nonfinite.h"
#include "stwFIS_data.h"
#include "stwFIS_initialize.h"
#include "trapmf.h"
#include "rt_nonfinite.h"

/* Function Definitions */
double stwFIS(double hip, double hcomVel, double knee)
{
  static const double outputMFCache[202] = {1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            0.96666666666666667,
                                            0.0,
                                            0.93333333333333324,
                                            0.0,
                                            0.89999999999999991,
                                            0.0,
                                            0.86666666666666659,
                                            0.0,
                                            0.83333333333333337,
                                            0.0,
                                            0.8,
                                            0.0,
                                            0.76666666666666661,
                                            0.0,
                                            0.73333333333333328,
                                            0.0,
                                            0.7,
                                            0.0,
                                            0.66666666666666652,
                                            0.0,
                                            0.63333333333333341,
                                            0.033333333333333187,
                                            0.6,
                                            0.066666666666666555,
                                            0.56666666666666665,
                                            0.099999999999999922,
                                            0.53333333333333333,
                                            0.1333333333333333,
                                            0.49999999999999989,
                                            0.16666666666666666,
                                            0.46666666666666656,
                                            0.20000000000000004,
                                            0.43333333333333335,
                                            0.2333333333333332,
                                            0.4,
                                            0.26666666666666661,
                                            0.36666666666666664,
                                            0.29999999999999993,
                                            0.33333333333333326,
                                            0.33333333333333331,
                                            0.29999999999999993,
                                            0.3666666666666667,
                                            0.26666666666666655,
                                            0.40000000000000008,
                                            0.23333333333333317,
                                            0.4333333333333334,
                                            0.19999999999999982,
                                            0.46666666666666679,
                                            0.16666666666666646,
                                            0.50000000000000011,
                                            0.13333333333333308,
                                            0.53333333333333355,
                                            0.10000000000000009,
                                            0.56666666666666654,
                                            0.066666666666666735,
                                            0.59999999999999987,
                                            0.033333333333333368,
                                            0.6333333333333333,
                                            0.0,
                                            0.66666666666666663,
                                            0.0,
                                            0.7,
                                            0.0,
                                            0.73333333333333339,
                                            0.0,
                                            0.76666666666666672,
                                            0.0,
                                            0.80000000000000016,
                                            0.0,
                                            0.83333333333333348,
                                            0.0,
                                            0.86666666666666681,
                                            0.0,
                                            0.90000000000000024,
                                            0.0,
                                            0.93333333333333357,
                                            0.0,
                                            0.96666666666666656,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            1.0};
  static const double x[101] = {
      0.0,  0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1,  0.11,
      0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2,  0.21, 0.22, 0.23,
      0.24, 0.25, 0.26, 0.27, 0.28, 0.29, 0.3,  0.31, 0.32, 0.33, 0.34, 0.35,
      0.36, 0.37, 0.38, 0.39, 0.4,  0.41, 0.42, 0.43, 0.44, 0.45, 0.46, 0.47,
      0.48, 0.49, 0.5,  0.51, 0.52, 0.53, 0.54, 0.55, 0.56, 0.57, 0.58, 0.59,
      0.6,  0.61, 0.62, 0.63, 0.64, 0.65, 0.66, 0.67, 0.68, 0.69, 0.7,  0.71,
      0.72, 0.73, 0.74, 0.75, 0.76, 0.77, 0.78, 0.79, 0.8,  0.81, 0.82, 0.83,
      0.84, 0.85, 0.86, 0.87, 0.88, 0.89, 0.9,  0.91, 0.92, 0.93, 0.94, 0.95,
      0.96, 0.97, 0.98, 0.99, 1.0};
  static const double dv1[4] = {0.0, 0.0, 40.0, 58.0};
  static const double dv2[4] = {58.0, 80.0, 140.0, 140.0};
  static const double dv3[4] = {-0.19, -0.19, 0.0, 0.042};
  static const double dv4[4] = {0.4, 0.8, 1.55, 1.55};
  static const double dv5[4] = {0.0, 0.0, 25.0, 65.0};
  static const double dv6[4] = {65.0, 85.0, 140.0, 140.0};
  static const signed char iv[30] = {1, 0, 0, 3, 3, 3, 2, 2, 2, 2,
                                     0, 1, 0, 3, 2, 2, 3, 3, 2, 2,
                                     0, 0, 1, 0, 3, 2, 3, 2, 3, 2};
  static const signed char iv1[10] = {1, 1, 1, 2, 1, 1, 1, 1, 1, 1};
  static const signed char iv2[10] = {1, 1, 1, 2, 2, 2, 2, 2, 2, 2};
  double orr[1010];
  double arr[101];
  double dv[9];
  double arg2[3];
  double aggVal;
  double d;
  double ex;
  double onsetFIS;
  double sw;
  int k;
  int mfIndex;
  int ruleID;
  boolean_T exitg1;
  if (!isInitialized_stwFIS) {
    stwFIS_initialize();
  }
  /*  For command terminal */
  /*  fis = readfis('stwFIS.fis'); */
  /*  fisData = getFISCodeGenerationData(fis); */
  /*  save('fisData.mat','fisData'); */
  /* Load the FIS data from the saved structure */
  /* Evaluate the fis to predict the Onset. */
  dv[0] = trapmf(hip, dv1);
  dv[1] = 0.0;
  if ((hip > 40.0) && (hip < 65.0)) {
    dv[1] = (hip - 40.0) * 0.04;
  }
  if ((hip > 65.0) && (hip < 80.0)) {
    dv[1] = (80.0 - hip) * 0.066666666666666666;
  }
  if (hip == 65.0) {
    dv[1] = 1.0;
  }
  dv[2] = trapmf(hip, dv2);
  dv[3] = trapmf(hcomVel, dv3);
  dv[4] = 0.0;
  if ((hcomVel > 0.0) && (hcomVel < 0.4)) {
    dv[4] = hcomVel * 2.5;
  }
  if ((hcomVel > 0.4) && (hcomVel < 0.8)) {
    dv[4] = (0.8 - hcomVel) * 2.5;
  }
  if (hcomVel == 0.4) {
    dv[4] = 1.0;
  }
  dv[5] = trapmf(hcomVel, dv4);
  dv[6] = trapmf(knee, dv5);
  dv[7] = 0.0;
  if ((knee > 25.0) && (knee < 65.0)) {
    dv[7] = (knee - 25.0) * 0.025;
  }
  if ((knee > 65.0) && (knee < 85.0)) {
    dv[7] = (85.0 - knee) * 0.05;
  }
  if (knee == 65.0) {
    dv[7] = 1.0;
  }
  dv[8] = trapmf(knee, dv6);
  sw = 0.0;
  for (ruleID = 0; ruleID < 10; ruleID++) {
    mfIndex = iv[ruleID];
    if (mfIndex == 0) {
      d = (iv1[ruleID] == 1);
    } else {
      d = dv[mfIndex - 1];
    }
    arg2[0] = d;
    mfIndex = iv[ruleID + 10];
    if (mfIndex == 0) {
      d = (iv1[ruleID] == 1);
    } else {
      d = dv[mfIndex + 2];
    }
    arg2[1] = d;
    mfIndex = iv[ruleID + 20];
    if (mfIndex == 0) {
      d = (iv1[ruleID] == 1);
    } else {
      d = dv[mfIndex + 5];
    }
    arg2[2] = d;
    if (iv1[ruleID] == 1) {
      if (!rtIsNaN(arg2[0])) {
        mfIndex = 1;
      } else {
        mfIndex = 0;
        k = 2;
        exitg1 = false;
        while ((!exitg1) && (k <= 3)) {
          if (!rtIsNaN(arg2[k - 1])) {
            mfIndex = k;
            exitg1 = true;
          } else {
            k++;
          }
        }
      }
      if (mfIndex == 0) {
        ex = arg2[0];
      } else {
        ex = arg2[mfIndex - 1];
        mfIndex++;
        for (k = mfIndex; k < 4; k++) {
          d = arg2[k - 1];
          if (ex > d) {
            ex = d;
          }
        }
      }
    } else {
      if (!rtIsNaN(arg2[0])) {
        mfIndex = 1;
      } else {
        mfIndex = 0;
        k = 2;
        exitg1 = false;
        while ((!exitg1) && (k <= 3)) {
          if (!rtIsNaN(arg2[k - 1])) {
            mfIndex = k;
            exitg1 = true;
          } else {
            k++;
          }
        }
      }
      if (mfIndex == 0) {
        ex = arg2[0];
      } else {
        ex = arg2[mfIndex - 1];
        mfIndex++;
        for (k = mfIndex; k < 4; k++) {
          d = arg2[k - 1];
          if (ex < d) {
            ex = d;
          }
        }
      }
    }
    sw += ex;
    for (k = 0; k < 101; k++) {
      d = outputMFCache[(iv2[ruleID] + (k << 1)) - 1];
      mfIndex = k + 101 * ruleID;
      orr[mfIndex] = d;
      if (d > ex) {
        orr[mfIndex] = ex;
      } else {
        orr[mfIndex] = d;
      }
    }
  }
  for (k = 0; k < 101; k++) {
    aggVal = orr[k];
    for (mfIndex = 0; mfIndex < 9; mfIndex++) {
      d = orr[k + 101 * (mfIndex + 1)];
      if ((aggVal < d) || rtIsNaN(aggVal)) {
        aggVal = d;
      }
    }
    arr[k] = aggVal;
  }
  if (sw == 0.0) {
    onsetFIS = 0.5;
  } else {
    ex = 0.0;
    aggVal = 0.0;
    for (mfIndex = 0; mfIndex < 101; mfIndex++) {
      aggVal += arr[mfIndex];
    }
    if (aggVal == 0.0) {
      onsetFIS = 0.5;
    } else {
      for (mfIndex = 0; mfIndex < 101; mfIndex++) {
        ex += x[mfIndex] * arr[mfIndex];
      }
      onsetFIS = ex * (1.0 / aggVal);
    }
  }
  return onsetFIS;
}

/* End of code generation (stwFIS.c) */
