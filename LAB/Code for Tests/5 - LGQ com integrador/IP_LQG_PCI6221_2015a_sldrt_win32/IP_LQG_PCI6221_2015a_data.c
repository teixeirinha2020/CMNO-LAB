/*
 * IP_LQG_PCI6221_2015a_data.c
 *
 * Code generation for model "IP_LQG_PCI6221_2015a".
 *
 * Model version              : 1.0
 * Simulink Coder version : 8.9 (R2015b) 13-Aug-2015
 * C source code generated on : Tue Mar 31 17:30:44 2026
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
  1.5707963267948966,                  /* Variable: ALPHA_MAX
                                        * Referenced by:
                                        *   '<S4>/Lower Limit'
                                        *   '<S4>/Upper Limit'
                                        */

  /*  Variable: A_aug
   * Referenced by: '<Root>/LQG'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, -0.017404859575843416, 0.0,
    -0.017375920561817897, -232.02520137511431, 0.0, 0.0, 20.786124708700459,
    0.0, 63.831866309774568, 0.0, 0.0, 0.0, -0.0023164464704312983, 1.0,
    -0.0071135482677263393, 0.0, 0.0, 0.0, 57.534432075073113, 0.0,
    57.438769726892971, -755.4249991873927, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
  0.26179938779914941,                 /* Variable: BETA_MAX
                                        * Referenced by:
                                        *   '<S2>/Lower Limit'
                                        *   '<S2>/Upper Limit'
                                        */

  /*  Variable: K
   * Referenced by: '<Root>/LQG'
   */
  { -112.97948102858936, -36.384592249934315, 259.38020953835951,
    39.338800324353208, 0.2102618106336501, -38.729833461366972 },

  /*  Variable: L_aug
   * Referenced by: '<Root>/LQG'
   */
  { 1811.8804156201634, 52.145444119934105, -0.019801161649075163,
    -46.737299305724626, -15.800322707627977, 1.0, -0.019801161649075163,
    -25.044859351655138, 1813.2684483382454, 2568.0580596632376,
    12.591801489102144, 0.0 },
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

  /*  Expression: zeros(6,1)
   * Referenced by: '<Root>/LQG'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
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
  /* Expression: A_aug - B_aug * K - L_aug * C_aug
   * Referenced by: '<Root>/LQG'
   */
  { 0.0, 0.0, 0.0, 0.0, -37660.212811449222, 0.0, 0.0, 0.0, 0.0, 0.0,
    -12128.32166261758, 0.0, 0.0, 0.0, 0.0, 0.0, 86460.955576712615, 0.0, 0.0,
    0.0, 0.0, 0.0, 13113.067775442827, 0.0, 0.0, 0.0, 0.0, 0.0,
    70.087988212480184, 0.0, 0.0, 0.0, 0.0, 0.0, -12910.076741616262, 0.0 },

  /* Expression: A_aug - B_aug * K - L_aug * C_aug
   * Referenced by: '<Root>/LQG'
   */
  { 1811.8804156201634, 52.145444119934105, -0.019801161649075163,
    -46.737299305724626, -15.800322707627977, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    -0.019801161649075163, -25.044859351655138, 1813.2684483382454,
    2568.0580596632376, 12.591801489102144, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
};
