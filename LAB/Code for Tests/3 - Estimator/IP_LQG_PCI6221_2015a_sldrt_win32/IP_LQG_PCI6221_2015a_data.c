/*
 * IP_LQG_PCI6221_2015a_data.c
 *
 * Code generation for model "IP_LQG_PCI6221_2015a".
 *
 * Model version              : 1.4
 * Simulink Coder version : 8.9 (R2015b) 13-Aug-2015
 * C source code generated on : Tue Mar 31 17:15:14 2026
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86/Pentium
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "IP_LQG_PCI6221_2015a.h"
#include "IP_LQG_PCI6221_2015a_private.h"

/* Block parameters (auto storage) */
P_IP_LQG_PCI6221_2015a_T IP_LQG_PCI6221_2015a_P = {
  /*  Variable: A
   * Referenced by: '<Root>/LQE'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, -0.017404859575843416, 0.0,
    -0.017375920561817897, -232.02520137511431, 0.0, 20.786124708700459, 0.0,
    63.831866309774568, 0.0, 0.0, -0.0023164464704312983, 1.0,
    -0.0071135482677263393, 0.0, 0.0, 57.534432075073113, 0.0,
    57.438769726892971, -755.4249991873927 },
  1.5707963267948966,                  /* Variable: ALPHA_MAX
                                        * Referenced by:
                                        *   '<S4>/Lower Limit'
                                        *   '<S4>/Upper Limit'
                                        */
  0.26179938779914941,                 /* Variable: BETA_MAX
                                        * Referenced by:
                                        *   '<S2>/Lower Limit'
                                        *   '<S2>/Upper Limit'
                                        */

  /*  Variable: K
   * Referenced by: '<Root>/Gain'
   */
  { -99.999999991631341, -34.210789658008416, 244.98513844670123,
    37.144733815913469, 0.20910349209979417 },
  6.0,                                 /* Variable: TIME_DELAY
                                        * Referenced by: '<S1>/Time delay'
                                        */
  5.0,                                 /* Variable: V_MAX
                                        * Referenced by: '<S1>/Motor protection'
                                        */
  -5.0,                                /* Variable: V_MIN
                                        * Referenced by: '<S1>/Motor protection'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_FinalValue
                                        * Referenced by: '<S1>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_InitialValue
                                        * Referenced by: '<S1>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: EncoderInput1_InputFilter
                                        * Referenced by: '<S3>/Encoder Input1'
                                        */
  0.0,                                 /* Mask Parameter: EncoderInput_InputFilter
                                        * Referenced by: '<S5>/Encoder Input'
                                        */
  0.0,                                 /* Mask Parameter: EncoderInput1_MaxMissedTicks
                                        * Referenced by: '<S3>/Encoder Input1'
                                        */
  0.0,                                 /* Mask Parameter: EncoderInput_MaxMissedTicks
                                        * Referenced by: '<S5>/Encoder Input'
                                        */
  10.0,                                /* Mask Parameter: AnalogOutput_MaxMissedTicks
                                        * Referenced by: '<S1>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: EncoderInput1_YieldWhenWaiting
                                        * Referenced by: '<S3>/Encoder Input1'
                                        */
  0.0,                                 /* Mask Parameter: EncoderInput_YieldWhenWaiting
                                        * Referenced by: '<S5>/Encoder Input'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_YieldWhenWaiting
                                        * Referenced by: '<S1>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: EncoderInput1_Channels
                                        * Referenced by: '<S3>/Encoder Input1'
                                        */
  1,                                   /* Mask Parameter: EncoderInput_Channels
                                        * Referenced by: '<S5>/Encoder Input'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_Channels
                                        * Referenced by: '<S1>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_RangeMode
                                        * Referenced by: '<S1>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_VoltRange
                                        * Referenced by: '<S1>/Analog Output'
                                        */

  /*  Expression: [B L]
   * Referenced by: '<Root>/LQE'
   */
  { 0.0, 0.0, 0.0, 0.0, 333.33674812968326, 4051.4523531738014,
    117.21025329670334, -0.022973252945161792, -103.95848689509299,
    -35.263030236598773, -0.022973252945161792, -82.22302984081999,
    4052.8207848288953, 5662.2822050750174, 31.564729578773765 },

  /*  Expression: eye(5)
   * Referenced by: '<Root>/LQE'
   */
  { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0 },
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/LQE'
                                        */
  6.2831853071795862,                  /* Expression: 2*pi
                                        * Referenced by: '<S6>/Angle'
                                        */
  4096.0,                              /* Expression: 4096
                                        * Referenced by: '<S6>/Encoder resolution'
                                        */
  6.2831853071795862,                  /* Expression: 2*pi
                                        * Referenced by: '<S5>/Angle'
                                        */
  4096.0,                              /* Expression: 4096
                                        * Referenced by: '<S5>/Encoder resolution'
                                        */
  3.1415926535897931,                  /* Expression: pi
                                        * Referenced by: '<S5>/Bias'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S1>/Time delay'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<S1>/Time delay'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S1>/Const motor'
                                        */
  3.0,                                 /* Expression: 3
                                        * Referenced by: '<S1>/Motor switch'
                                        */
  -1.0,                                /* Expression: -1
                                        * Referenced by: '<S1>/Gain'
                                        */

  /*  Expression: [0 0]
   * Referenced by: '<S1>/Const sensors'
   */
  { 0.0, 0.0 },
  3.0                                  /* Expression: 3
                                        * Referenced by: '<S1>/Sensors switch'
                                        */
};

/* Constant parameters (auto storage) */
const ConstP_IP_LQG_PCI6221_2015a_T IP_LQG_PCI6221_2015a_ConstP = {
  /* Expression: A-L*C
   * Referenced by: '<Root>/LQE'
   */
  { 4051.4523531738014, 117.21025329670334, -0.022973252945161792,
    -103.95848689509299, -35.263030236598773, 0.0, 0.0, 0.0, 0.0, 0.0,
    -0.022973252945161792, -82.22302984081999, 4052.8207848288953,
    5662.2822050750174, 31.564729578773765, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0 }
};
