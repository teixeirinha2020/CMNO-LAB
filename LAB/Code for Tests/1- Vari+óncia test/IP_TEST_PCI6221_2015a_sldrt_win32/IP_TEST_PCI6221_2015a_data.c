/*
 * IP_TEST_PCI6221_2015a_data.c
 *
 * Code generation for model "IP_TEST_PCI6221_2015a".
 *
 * Model version              : 1.1
 * Simulink Coder version : 8.9 (R2015b) 13-Aug-2015
 * C source code generated on : Tue Mar 31 16:20:17 2026
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86/Pentium
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "IP_TEST_PCI6221_2015a.h"
#include "IP_TEST_PCI6221_2015a_private.h"

/* Block parameters (auto storage) */
P_IP_TEST_PCI6221_2015a_T IP_TEST_PCI6221_2015a_P = {
  0.0,                                 /* Mask Parameter: Motor_FinalValue
                                        * Referenced by: '<Root>/Motor'
                                        */
  0.0,                                 /* Mask Parameter: Motor_InitialValue
                                        * Referenced by: '<Root>/Motor'
                                        */
  0.0,                                 /* Mask Parameter: Motorshaftencoder_InputFilter
                                        * Referenced by: '<Root>/Motor shaft encoder'
                                        */
  0.0,                                 /* Mask Parameter: Pendulumencoder_InputFilter
                                        * Referenced by: '<Root>/Pendulum encoder'
                                        */
  10.0,                                /* Mask Parameter: Motor_MaxMissedTicks
                                        * Referenced by: '<Root>/Motor'
                                        */
  0.0,                                 /* Mask Parameter: Motorshaftencoder_MaxMissedTicks
                                        * Referenced by: '<Root>/Motor shaft encoder'
                                        */
  0.0,                                 /* Mask Parameter: Pendulumencoder_MaxMissedTicks
                                        * Referenced by: '<Root>/Pendulum encoder'
                                        */
  0.0,                                 /* Mask Parameter: Ramp_X0
                                        * Referenced by: '<S3>/Constant1'
                                        */
  0.0,                                 /* Mask Parameter: Motor_YieldWhenWaiting
                                        * Referenced by: '<Root>/Motor'
                                        */
  0.0,                                 /* Mask Parameter: Motorshaftencoder_YieldWhenWaiting
                                        * Referenced by: '<Root>/Motor shaft encoder'
                                        */
  0.0,                                 /* Mask Parameter: Pendulumencoder_YieldWhenWaiting
                                        * Referenced by: '<Root>/Pendulum encoder'
                                        */
  1.0,                                 /* Mask Parameter: Ramp_slope
                                        * Referenced by: '<S3>/Step'
                                        */
  0.0,                                 /* Mask Parameter: Ramp_start
                                        * Referenced by:
                                        *   '<S3>/Constant'
                                        *   '<S3>/Step'
                                        */
  0,                                   /* Mask Parameter: Motor_Channels
                                        * Referenced by: '<Root>/Motor'
                                        */
  0,                                   /* Mask Parameter: Motorshaftencoder_Channels
                                        * Referenced by: '<Root>/Motor shaft encoder'
                                        */
  1,                                   /* Mask Parameter: Pendulumencoder_Channels
                                        * Referenced by: '<Root>/Pendulum encoder'
                                        */
  0,                                   /* Mask Parameter: Motor_RangeMode
                                        * Referenced by: '<Root>/Motor'
                                        */
  0,                                   /* Mask Parameter: Motor_VoltRange
                                        * Referenced by: '<Root>/Motor'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/No movement'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<Root>/Square wave'
                                        */
  0.25,                                /* Expression: .25
                                        * Referenced by: '<Root>/Square wave'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S3>/Step'
                                        */
  6.2831853071795862,                  /* Expression: 2*pi
                                        * Referenced by: '<S2>/Angle'
                                        */
  4096.0,                              /* Expression: 4096
                                        * Referenced by: '<S2>/Encoder resolution'
                                        */
  6.2831853071795862,                  /* Expression: 2*pi
                                        * Referenced by: '<S1>/Angle'
                                        */
  4096.0,                              /* Expression: 4096
                                        * Referenced by: '<S1>/Encoder resolution'
                                        */
  3.1415926535897931,                  /* Expression: pi
                                        * Referenced by: '<S1>/Bias'
                                        */
  1U                                   /* Computed Parameter: ManualSwitch_CurrentSetting
                                        * Referenced by: '<Root>/Manual Switch'
                                        */
};
