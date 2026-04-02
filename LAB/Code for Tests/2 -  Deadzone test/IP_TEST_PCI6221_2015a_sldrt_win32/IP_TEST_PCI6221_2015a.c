/*
 * IP_TEST_PCI6221_2015a.c
 *
 * Code generation for model "IP_TEST_PCI6221_2015a".
 *
 * Model version              : 1.0
 * Simulink Coder version : 8.9 (R2015b) 13-Aug-2015
 * C source code generated on : Tue Mar 31 16:23:43 2026
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86/Pentium
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "IP_TEST_PCI6221_2015a.h"
#include "IP_TEST_PCI6221_2015a_private.h"
#include "IP_TEST_PCI6221_2015a_dt.h"

/* options for Simulink Desktop Real-Time board 0 */
static double RTWinBoardOptions0[] = {
  0.0,
  0.0,
  0.0,
  2.0,
  2.0,
};

/* list of Simulink Desktop Real-Time timers */
const int RTWinTimerCount = 1;
const double RTWinTimers[2] = {
  0.01, 0.0,
};

/* list of Simulink Desktop Real-Time boards */
const int RTWinBoardCount = 1;
RTWINBOARD RTWinBoards[1] = {
  { "National_Instruments/PCI-6221", 4294967295U, 5, RTWinBoardOptions0 },
};

/* Block signals (auto storage) */
B_IP_TEST_PCI6221_2015a_T IP_TEST_PCI6221_2015a_B;

/* Block states (auto storage) */
DW_IP_TEST_PCI6221_2015a_T IP_TEST_PCI6221_2015a_DW;

/* Real-time model */
RT_MODEL_IP_TEST_PCI6221_2015a_T IP_TEST_PCI6221_2015a_M_;
RT_MODEL_IP_TEST_PCI6221_2015a_T *const IP_TEST_PCI6221_2015a_M =
  &IP_TEST_PCI6221_2015a_M_;
real_T rt_atan2d_snf(real_T u0, real_T u1)
{
  real_T y;
  int32_T u0_0;
  int32_T u1_0;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else if (rtIsInf(u0) && rtIsInf(u1)) {
    if (u0 > 0.0) {
      u0_0 = 1;
    } else {
      u0_0 = -1;
    }

    if (u1 > 0.0) {
      u1_0 = 1;
    } else {
      u1_0 = -1;
    }

    y = atan2(u0_0, u1_0);
  } else if (u1 == 0.0) {
    if (u0 > 0.0) {
      y = RT_PI / 2.0;
    } else if (u0 < 0.0) {
      y = -(RT_PI / 2.0);
    } else {
      y = 0.0;
    }
  } else {
    y = atan2(u0, u1);
  }

  return y;
}

/* Model output function */
void IP_TEST_PCI6221_2015a_output(void)
{
  /* local block i/o variables */
  real_T rtb_Clock;
  real_T rtb_Divide2_i;
  real_T rtb_Biasremoval;
  real_T temp;
  real_T currentTime;

  /* SignalGenerator: '<Root>/Square wave' */
  temp = IP_TEST_PCI6221_2015a_P.Squarewave_Frequency *
    IP_TEST_PCI6221_2015a_M->Timing.t[0];

  /* Step: '<S3>/Step' */
  currentTime = IP_TEST_PCI6221_2015a_M->Timing.t[0];

  /* Clock: '<S3>/Clock' */
  rtb_Clock = IP_TEST_PCI6221_2015a_M->Timing.t[0];

  /* SignalGenerator: '<Root>/Square wave' */
  if (temp - floor(temp) >= 0.5) {
    temp = IP_TEST_PCI6221_2015a_P.Squarewave_Amplitude;
  } else {
    temp = -IP_TEST_PCI6221_2015a_P.Squarewave_Amplitude;
  }

  /* Step: '<S3>/Step' */
  if (currentTime < IP_TEST_PCI6221_2015a_P.Ramp_start) {
    currentTime = IP_TEST_PCI6221_2015a_P.Step_Y0;
  } else {
    currentTime = IP_TEST_PCI6221_2015a_P.Ramp_slope;
  }

  /* Product: '<Root>/Product' incorporates:
   *  Constant: '<S3>/Constant'
   *  Constant: '<S3>/Constant1'
   *  Product: '<S3>/Product'
   *  Sum: '<S3>/Output'
   *  Sum: '<S3>/Sum'
   */
  IP_TEST_PCI6221_2015a_B.Product = ((rtb_Clock -
    IP_TEST_PCI6221_2015a_P.Ramp_start) * currentTime +
    IP_TEST_PCI6221_2015a_P.Ramp_X0) * temp;

  /* ManualSwitch: '<Root>/Manual Switch' incorporates:
   *  Constant: '<Root>/No movement'
   */
  if (IP_TEST_PCI6221_2015a_P.ManualSwitch_CurrentSetting == 1) {
    IP_TEST_PCI6221_2015a_B.ManualSwitch =
      IP_TEST_PCI6221_2015a_P.Nomovement_Value;
  } else {
    IP_TEST_PCI6221_2015a_B.ManualSwitch = IP_TEST_PCI6221_2015a_B.Product;
  }

  /* End of ManualSwitch: '<Root>/Manual Switch' */
  /* S-Function Block: <Root>/Motor */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) IP_TEST_PCI6221_2015a_P.Motor_RangeMode;
      parm.rangeidx = IP_TEST_PCI6221_2015a_P.Motor_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                     &IP_TEST_PCI6221_2015a_P.Motor_Channels,
                     &IP_TEST_PCI6221_2015a_B.ManualSwitch, &parm);
    }
  }

  /* S-Function Block: <Root>/Motor shaft encoder */
  {
    ENCODERINPARM parm;
    parm.quad = (QUADMODE) 2;
    parm.index = (INDEXPULSE) 1;
    parm.infilter = IP_TEST_PCI6221_2015a_P.Motorshaftencoder_InputFilter;
    RTBIO_DriverIO(0, ENCODERINPUT, IOREAD, 1,
                   &IP_TEST_PCI6221_2015a_P.Motorshaftencoder_Channels,
                   &rtb_Divide2_i, &parm);
  }

  /* S-Function Block: <Root>/Pendulum encoder */
  {
    ENCODERINPARM parm;
    parm.quad = (QUADMODE) 2;
    parm.index = (INDEXPULSE) 1;
    parm.infilter = IP_TEST_PCI6221_2015a_P.Pendulumencoder_InputFilter;
    RTBIO_DriverIO(0, ENCODERINPUT, IOREAD, 1,
                   &IP_TEST_PCI6221_2015a_P.Pendulumencoder_Channels,
                   &rtb_Biasremoval, &parm);
  }

  /* Product: '<S2>/Divide2' incorporates:
   *  Constant: '<S2>/Angle'
   *  Constant: '<S2>/Encoder resolution'
   */
  rtb_Divide2_i = rtb_Divide2_i * IP_TEST_PCI6221_2015a_P.Angle_Value /
    IP_TEST_PCI6221_2015a_P.Encoderresolution_Value;

  /* Fcn: '<S2>/Fcn' */
  IP_TEST_PCI6221_2015a_B.Fcn = rt_atan2d_snf(sin(rtb_Divide2_i), cos
    (rtb_Divide2_i));

  /* Sum: '<S1>/Bias removal' incorporates:
   *  Constant: '<S1>/Angle'
   *  Constant: '<S1>/Bias'
   *  Constant: '<S1>/Encoder resolution'
   *  Product: '<S1>/Divide2'
   */
  rtb_Biasremoval = rtb_Biasremoval * IP_TEST_PCI6221_2015a_P.Angle_Value_b /
    IP_TEST_PCI6221_2015a_P.Encoderresolution_Value_c -
    IP_TEST_PCI6221_2015a_P.Bias_Value;

  /* Fcn: '<S1>/Fcn' */
  IP_TEST_PCI6221_2015a_B.Fcn_h = rt_atan2d_snf(sin(rtb_Biasremoval), cos
    (rtb_Biasremoval));

  /* Clock: '<Root>/Clock' */
  IP_TEST_PCI6221_2015a_B.Clock = IP_TEST_PCI6221_2015a_M->Timing.t[0];
}

/* Model update function */
void IP_TEST_PCI6221_2015a_update(void)
{
  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++IP_TEST_PCI6221_2015a_M->Timing.clockTick0)) {
    ++IP_TEST_PCI6221_2015a_M->Timing.clockTickH0;
  }

  IP_TEST_PCI6221_2015a_M->Timing.t[0] =
    IP_TEST_PCI6221_2015a_M->Timing.clockTick0 *
    IP_TEST_PCI6221_2015a_M->Timing.stepSize0 +
    IP_TEST_PCI6221_2015a_M->Timing.clockTickH0 *
    IP_TEST_PCI6221_2015a_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.01s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++IP_TEST_PCI6221_2015a_M->Timing.clockTick1)) {
      ++IP_TEST_PCI6221_2015a_M->Timing.clockTickH1;
    }

    IP_TEST_PCI6221_2015a_M->Timing.t[1] =
      IP_TEST_PCI6221_2015a_M->Timing.clockTick1 *
      IP_TEST_PCI6221_2015a_M->Timing.stepSize1 +
      IP_TEST_PCI6221_2015a_M->Timing.clockTickH1 *
      IP_TEST_PCI6221_2015a_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Model initialize function */
void IP_TEST_PCI6221_2015a_initialize(void)
{
  /* S-Function Block: <Root>/Motor */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) IP_TEST_PCI6221_2015a_P.Motor_RangeMode;
      parm.rangeidx = IP_TEST_PCI6221_2015a_P.Motor_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                     &IP_TEST_PCI6221_2015a_P.Motor_Channels,
                     &IP_TEST_PCI6221_2015a_P.Motor_InitialValue, &parm);
    }
  }

  /* S-Function Block: <Root>/Motor shaft encoder */
  {
    ENCODERINPARM parm;
    parm.quad = (QUADMODE) 2;
    parm.index = (INDEXPULSE) 1;
    parm.infilter = IP_TEST_PCI6221_2015a_P.Motorshaftencoder_InputFilter;
    RTBIO_DriverIO(0, ENCODERINPUT, IORESET, 1,
                   &IP_TEST_PCI6221_2015a_P.Motorshaftencoder_Channels, NULL,
                   &parm);
  }

  /* S-Function Block: <Root>/Pendulum encoder */
  {
    ENCODERINPARM parm;
    parm.quad = (QUADMODE) 2;
    parm.index = (INDEXPULSE) 1;
    parm.infilter = IP_TEST_PCI6221_2015a_P.Pendulumencoder_InputFilter;
    RTBIO_DriverIO(0, ENCODERINPUT, IORESET, 1,
                   &IP_TEST_PCI6221_2015a_P.Pendulumencoder_Channels, NULL,
                   &parm);
  }
}

/* Model terminate function */
void IP_TEST_PCI6221_2015a_terminate(void)
{
  /* S-Function Block: <Root>/Motor */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) IP_TEST_PCI6221_2015a_P.Motor_RangeMode;
      parm.rangeidx = IP_TEST_PCI6221_2015a_P.Motor_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                     &IP_TEST_PCI6221_2015a_P.Motor_Channels,
                     &IP_TEST_PCI6221_2015a_P.Motor_FinalValue, &parm);
    }
  }
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/
void MdlOutputs(int_T tid)
{
  IP_TEST_PCI6221_2015a_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  IP_TEST_PCI6221_2015a_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  IP_TEST_PCI6221_2015a_initialize();
}

void MdlTerminate(void)
{
  IP_TEST_PCI6221_2015a_terminate();
}

/* Registration function */
RT_MODEL_IP_TEST_PCI6221_2015a_T *IP_TEST_PCI6221_2015a(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* non-finite (run-time) assignments */
  IP_TEST_PCI6221_2015a_P.Motorshaftencoder_InputFilter = rtInf;
  IP_TEST_PCI6221_2015a_P.Pendulumencoder_InputFilter = rtInf;
  IP_TEST_PCI6221_2015a_P.Motorshaftencoder_MaxMissedTicks = rtInf;
  IP_TEST_PCI6221_2015a_P.Pendulumencoder_MaxMissedTicks = rtInf;

  /* initialize real-time model */
  (void) memset((void *)IP_TEST_PCI6221_2015a_M, 0,
                sizeof(RT_MODEL_IP_TEST_PCI6221_2015a_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&IP_TEST_PCI6221_2015a_M->solverInfo,
                          &IP_TEST_PCI6221_2015a_M->Timing.simTimeStep);
    rtsiSetTPtr(&IP_TEST_PCI6221_2015a_M->solverInfo, &rtmGetTPtr
                (IP_TEST_PCI6221_2015a_M));
    rtsiSetStepSizePtr(&IP_TEST_PCI6221_2015a_M->solverInfo,
                       &IP_TEST_PCI6221_2015a_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&IP_TEST_PCI6221_2015a_M->solverInfo,
                          (&rtmGetErrorStatus(IP_TEST_PCI6221_2015a_M)));
    rtsiSetRTModelPtr(&IP_TEST_PCI6221_2015a_M->solverInfo,
                      IP_TEST_PCI6221_2015a_M);
  }

  rtsiSetSimTimeStep(&IP_TEST_PCI6221_2015a_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&IP_TEST_PCI6221_2015a_M->solverInfo,"FixedStepDiscrete");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = IP_TEST_PCI6221_2015a_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    IP_TEST_PCI6221_2015a_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    IP_TEST_PCI6221_2015a_M->Timing.sampleTimes =
      (&IP_TEST_PCI6221_2015a_M->Timing.sampleTimesArray[0]);
    IP_TEST_PCI6221_2015a_M->Timing.offsetTimes =
      (&IP_TEST_PCI6221_2015a_M->Timing.offsetTimesArray[0]);

    /* task periods */
    IP_TEST_PCI6221_2015a_M->Timing.sampleTimes[0] = (0.0);
    IP_TEST_PCI6221_2015a_M->Timing.sampleTimes[1] = (0.01);

    /* task offsets */
    IP_TEST_PCI6221_2015a_M->Timing.offsetTimes[0] = (0.0);
    IP_TEST_PCI6221_2015a_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(IP_TEST_PCI6221_2015a_M, &IP_TEST_PCI6221_2015a_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = IP_TEST_PCI6221_2015a_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    IP_TEST_PCI6221_2015a_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(IP_TEST_PCI6221_2015a_M, 4.0);
  IP_TEST_PCI6221_2015a_M->Timing.stepSize0 = 0.01;
  IP_TEST_PCI6221_2015a_M->Timing.stepSize1 = 0.01;

  /* External mode info */
  IP_TEST_PCI6221_2015a_M->Sizes.checksums[0] = (2303129328U);
  IP_TEST_PCI6221_2015a_M->Sizes.checksums[1] = (1724479514U);
  IP_TEST_PCI6221_2015a_M->Sizes.checksums[2] = (1730226969U);
  IP_TEST_PCI6221_2015a_M->Sizes.checksums[3] = (1974344791U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    IP_TEST_PCI6221_2015a_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(IP_TEST_PCI6221_2015a_M->extModeInfo,
      &IP_TEST_PCI6221_2015a_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(IP_TEST_PCI6221_2015a_M->extModeInfo,
                        IP_TEST_PCI6221_2015a_M->Sizes.checksums);
    rteiSetTPtr(IP_TEST_PCI6221_2015a_M->extModeInfo, rtmGetTPtr
                (IP_TEST_PCI6221_2015a_M));
  }

  IP_TEST_PCI6221_2015a_M->solverInfoPtr = (&IP_TEST_PCI6221_2015a_M->solverInfo);
  IP_TEST_PCI6221_2015a_M->Timing.stepSize = (0.01);
  rtsiSetFixedStepSize(&IP_TEST_PCI6221_2015a_M->solverInfo, 0.01);
  rtsiSetSolverMode(&IP_TEST_PCI6221_2015a_M->solverInfo,
                    SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  IP_TEST_PCI6221_2015a_M->ModelData.blockIO = ((void *)
    &IP_TEST_PCI6221_2015a_B);
  (void) memset(((void *) &IP_TEST_PCI6221_2015a_B), 0,
                sizeof(B_IP_TEST_PCI6221_2015a_T));

  /* parameters */
  IP_TEST_PCI6221_2015a_M->ModelData.defaultParam = ((real_T *)
    &IP_TEST_PCI6221_2015a_P);

  /* states (dwork) */
  IP_TEST_PCI6221_2015a_M->ModelData.dwork = ((void *) &IP_TEST_PCI6221_2015a_DW);
  (void) memset((void *)&IP_TEST_PCI6221_2015a_DW, 0,
                sizeof(DW_IP_TEST_PCI6221_2015a_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    IP_TEST_PCI6221_2015a_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* Initialize Sizes */
  IP_TEST_PCI6221_2015a_M->Sizes.numContStates = (0);/* Number of continuous states */
  IP_TEST_PCI6221_2015a_M->Sizes.numY = (0);/* Number of model outputs */
  IP_TEST_PCI6221_2015a_M->Sizes.numU = (0);/* Number of model inputs */
  IP_TEST_PCI6221_2015a_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  IP_TEST_PCI6221_2015a_M->Sizes.numSampTimes = (2);/* Number of sample times */
  IP_TEST_PCI6221_2015a_M->Sizes.numBlocks = (30);/* Number of blocks */
  IP_TEST_PCI6221_2015a_M->Sizes.numBlockIO = (5);/* Number of block outputs */
  IP_TEST_PCI6221_2015a_M->Sizes.numBlockPrms = (28);/* Sum of parameter "widths" */
  return IP_TEST_PCI6221_2015a_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
