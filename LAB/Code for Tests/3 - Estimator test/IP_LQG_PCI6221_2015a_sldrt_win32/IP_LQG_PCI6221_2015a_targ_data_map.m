  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (IP_LQG_PCI6221_2015a_P)
    ;%
      section.nData     = 17;
      section.data(17)  = dumData; %prealloc
      
	  ;% IP_LQG_PCI6221_2015a_P.A
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IP_LQG_PCI6221_2015a_P.ALPHA_MAX
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 25;
	
	  ;% IP_LQG_PCI6221_2015a_P.BETA_MAX
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 26;
	
	  ;% IP_LQG_PCI6221_2015a_P.K
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 27;
	
	  ;% IP_LQG_PCI6221_2015a_P.TIME_DELAY
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 32;
	
	  ;% IP_LQG_PCI6221_2015a_P.V_MAX
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 33;
	
	  ;% IP_LQG_PCI6221_2015a_P.V_MIN
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 34;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_FinalValue
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 35;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_InitialValue
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 36;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput1_InputFilter
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 37;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput_InputFilter
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 38;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput1_MaxMissedTicks
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 39;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput_MaxMissedTicks
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 40;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_MaxMissedTicks
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 41;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput1_YieldWhenWaiting
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 42;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput_YieldWhenWaiting
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 43;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_YieldWhenWaiting
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 44;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput1_Channels
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IP_LQG_PCI6221_2015a_P.EncoderInput_Channels
	  section.data(2).logicalSrcIdx = 18;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_Channels
	  section.data(3).logicalSrcIdx = 19;
	  section.data(3).dtTransOffset = 2;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_RangeMode
	  section.data(4).logicalSrcIdx = 20;
	  section.data(4).dtTransOffset = 3;
	
	  ;% IP_LQG_PCI6221_2015a_P.AnalogOutput_VoltRange
	  section.data(5).logicalSrcIdx = 21;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% IP_LQG_PCI6221_2015a_P.LQE_B
	  section.data(1).logicalSrcIdx = 22;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IP_LQG_PCI6221_2015a_P.LQE_C
	  section.data(2).logicalSrcIdx = 23;
	  section.data(2).dtTransOffset = 15;
	
	  ;% IP_LQG_PCI6221_2015a_P.LQE_X0
	  section.data(3).logicalSrcIdx = 24;
	  section.data(3).dtTransOffset = 40;
	
	  ;% IP_LQG_PCI6221_2015a_P.Angle_Value
	  section.data(4).logicalSrcIdx = 25;
	  section.data(4).dtTransOffset = 41;
	
	  ;% IP_LQG_PCI6221_2015a_P.Encoderresolution_Value
	  section.data(5).logicalSrcIdx = 26;
	  section.data(5).dtTransOffset = 42;
	
	  ;% IP_LQG_PCI6221_2015a_P.Angle_Value_f
	  section.data(6).logicalSrcIdx = 27;
	  section.data(6).dtTransOffset = 43;
	
	  ;% IP_LQG_PCI6221_2015a_P.Encoderresolution_Value_l
	  section.data(7).logicalSrcIdx = 28;
	  section.data(7).dtTransOffset = 44;
	
	  ;% IP_LQG_PCI6221_2015a_P.Bias_Value
	  section.data(8).logicalSrcIdx = 29;
	  section.data(8).dtTransOffset = 45;
	
	  ;% IP_LQG_PCI6221_2015a_P.Timedelay_Y0
	  section.data(9).logicalSrcIdx = 30;
	  section.data(9).dtTransOffset = 46;
	
	  ;% IP_LQG_PCI6221_2015a_P.Timedelay_YFinal
	  section.data(10).logicalSrcIdx = 31;
	  section.data(10).dtTransOffset = 47;
	
	  ;% IP_LQG_PCI6221_2015a_P.Constmotor_Value
	  section.data(11).logicalSrcIdx = 32;
	  section.data(11).dtTransOffset = 48;
	
	  ;% IP_LQG_PCI6221_2015a_P.Motorswitch_Threshold
	  section.data(12).logicalSrcIdx = 33;
	  section.data(12).dtTransOffset = 49;
	
	  ;% IP_LQG_PCI6221_2015a_P.Gain_Gain
	  section.data(13).logicalSrcIdx = 34;
	  section.data(13).dtTransOffset = 50;
	
	  ;% IP_LQG_PCI6221_2015a_P.Constsensors_Value
	  section.data(14).logicalSrcIdx = 35;
	  section.data(14).dtTransOffset = 51;
	
	  ;% IP_LQG_PCI6221_2015a_P.Sensorsswitch_Threshold
	  section.data(15).logicalSrcIdx = 36;
	  section.data(15).dtTransOffset = 53;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (IP_LQG_PCI6221_2015a_B)
    ;%
      section.nData     = 11;
      section.data(11)  = dumData; %prealloc
      
	  ;% IP_LQG_PCI6221_2015a_B.LQE
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IP_LQG_PCI6221_2015a_B.Gain
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 5;
	
	  ;% IP_LQG_PCI6221_2015a_B.Fcn
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 6;
	
	  ;% IP_LQG_PCI6221_2015a_B.Booleantodouble1
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 7;
	
	  ;% IP_LQG_PCI6221_2015a_B.Fcn_b
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 8;
	
	  ;% IP_LQG_PCI6221_2015a_B.Booleantodouble2
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 9;
	
	  ;% IP_LQG_PCI6221_2015a_B.Fcn_n
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 10;
	
	  ;% IP_LQG_PCI6221_2015a_B.Gain_p
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 11;
	
	  ;% IP_LQG_PCI6221_2015a_B.Sensorsswitch
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 12;
	
	  ;% IP_LQG_PCI6221_2015a_B.TmpSignalConversionAtLQEInport1
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 14;
	
	  ;% IP_LQG_PCI6221_2015a_B.Clock
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 17;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 1;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (IP_LQG_PCI6221_2015a_DW)
    ;%
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% IP_LQG_PCI6221_2015a_DW.EncoderInput1_PWORK
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IP_LQG_PCI6221_2015a_DW.EncoderInput_PWORK
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IP_LQG_PCI6221_2015a_DW.AnalogOutput_PWORK
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% IP_LQG_PCI6221_2015a_DW.ToWorkspace_PWORK.LoggedData
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% IP_LQG_PCI6221_2015a_DW.ToWorkspace1_PWORK.LoggedData
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% IP_LQG_PCI6221_2015a_DW.ToWorkspace2_PWORK.LoggedData
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% IP_LQG_PCI6221_2015a_DW.ToWorkspace3_PWORK.LoggedData
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 2512821902;
  targMap.checksum1 = 3712649244;
  targMap.checksum2 = 299326120;
  targMap.checksum3 = 2770756081;

