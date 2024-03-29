
; using MESEN naming convention
.define PpuControl_2000		$2000
.define PpuMask_2001		$2001
.define PpuStatus_2002		$2002
.define OamAddr_2003		$2003
.define PpuScroll_2005 		$2005
.define PpuAddr_2006		$2006
.define PpuData_2007		$2007
.define Sq0Duty_4000		$4000
.define Sq0Sweep_4001		$4001
.define Sq0Timer_4002		$4002
.define Sq0Length_4003		$4003
.define Sq1Duty_4004		$4004
.define Sq1Sweep_4005		$4005
.define TrgLinear_4008		$4008
.define NoiseVolume_400C	$400C
.define SpriteDma_4014		$4014
.define ApuStatus_4015		$4015
.define Ctrl1_4016			$4016
.define Ctrl2_FrameCtr_4017 $4017
.define BankSwitching_FFF0 	$FFF0
.define UpdateDuringVBlank_Flag2	$75

.define RAMPage_0	$0000
.define RAMPage_1 	$0100
.define RAMPage_2 	$0200
.define RAMPage_3 	$0300
.define RAMPage_4 	$0400
.define RAMPage_5 	$0500
.define RAMPage_6 	$0600
.define RAMPage_7 	$0700

.define BIT0	%00000001
.define BIT1	%00000010
.define BIT2	%00000100
.define BIT3	%00001000
.define BIT4	%00010000
.define BIT5	%00100000
.define BIT6	%01000000
.define BIT7	%10000000
.define ZERO    $00
.define ALL1	$FF