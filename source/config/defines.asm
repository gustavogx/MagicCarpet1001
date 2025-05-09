
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

.define RAMPage_0	$0000
.define RAMPage_1 	$0100
.define RAMPage_2 	$0200
.define RAMPage_3 	$0300
.define RAMPage_4 	$0400
.define RAMPage_5 	$0500
.define RAMPage_6 	$0600
.define RAMPage_7 	$0700

; page 02 - OAM
.define OAM_Y 		0
.define OAM_TILE 	1
.define OAM_ATT 	2
.define OAM_X 		3
.define OAM_STRIDE	4


.define FLAG_0	%00000001
.define FLAG_1	%00000010
.define FLAG_2	%00000100
.define FLAG_3	%00001000
.define FLAG_4	%00010000
.define FLAG_5	%00100000
.define FLAG_6	%01000000
.define FLAG_7	%10000000

.define ZERO	$00
.define FULL	$FF
.define ALL1	$FF

.define TRUE	$01  ; Boolean true value
.define FALSE	$00  ; Boolean false value
.define LOWER	%00001111  ; Lower 4 bits mask
.define UPPER	%11110000  ; Upper 4 bits mask

.define EOL	$FF