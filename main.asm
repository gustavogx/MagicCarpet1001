; Configurarion

; Constants
.define OAM_0200	$0200



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
.define Sq1Duty_4004		$4004
.define Sq1Sweep_4005		$4005
.define SpriteDma_4014		$4014
.define ApuStatus_4015		$4015
.define Ctrl1_4016			$4016
.define Ctrl2_FrameCtr_4017 $4017
.define BankSwitching_FFF0 			$FFF0
.define UpdateDuringVBlank_Flag2	$75

.segment "HEADER"
.include "inesheader.inc"

.segment "ZEROPAGE" ; LSB 0 - FF
.res 12
var_0C:					.res 1
.res 1
updateDuringVBlank_0E: 	.res 1
updateDuringVBlank_0F: 	.res 1
.res 1
livesCounter_11:		.res 1
frameCounter_12:		.res 1
frameCounter64_13:		.res 1
aliveTimer_14:			.res 1
bankIndex_15:			.res 1
levelProgression_16:	.res 1
flagPPUControl_17:		.res 1
flagPPUMask_18:	 		.res 1
flagPPUControl_19:		.res 1
flagUnknown_1A:			.res 1
flagNextLevel_1B:		.res 1
flagPause_1C:			.res 1
.res 1
flagPlayerHit_1E:		.res 1
flagUnknown_1F:			.res 1
input1_20:				.res 1
.res 1
inputPrev_22:			.res 1
.res 3
flagGameMode_26: 		.res 1
frameToScroll_27:		.res 1
frameCounterToScroll_28: .res 1
screenScrollX_29:		.res 1
.res 8
addressPtr_32:			.res 2
objectPtr_34: 			.res 2 ; object address in rom
.res 2
otherObjPtr_38:			.res 2
anotherObjPtr_3A:		.res 2
.res 2
oamAddressPtr_3E:		.res 1
;3F
;40
;41
.res 3
spriteY_42:				.res 1
;43
;44
;46
.res 3
spriteX_46:				.res 1
;47
;48
;49
;4A
;4B
;4C
.res 6
temp_4D:				.res 1
var_4E:					.res 1
.res 5
var_54:					.res 1
var_55:					.res 1
var_56:					.res 1
var_57:					.res 1 ;.define UpdateDuringVBlank_Flag1	$57
var_58:					.res 1
var_59:					.res 1 ; flag that is either $06 or $FA (250)
.res 1
var_5B:					.res 1
var_5C:					.res 1
.res 1
var_5E:					.res 1
var_5F:					.res 1
.res 4
powerUp_P_64:			.res 1
.res 1
speed_66:				.res 1
.res 9
soundArray_70: 			.res 29
soundAddress_8D:		.res 1 ; still dont know
soundAddress_8E:		.res 1 ; still dont know
soundAddress_8F: 		.res 1
.res 57
apuStatusFlag_C9:		.res 1
.res 22
bgPalette_E0:			.res 16

.define var_2C	$2C
.define var_2D	$2D

.segment "SPRITES" ; LSB 0 - FF

.segment "RAM" ; LSB 0 - FF

.define someObjProperty_0300 $0300
.define someObjProperty_0301 $0301
.define someObjProperty_0302 $0302
.define someObjProperty_0303 $0303

.define someObjProperty_0400 $0400 ; playerX_0400
.define someObjProperty_0401 $0401
.define someObjProperty_0402 $0402 ; playerY_0402
.define someObjProperty_0403 $0403
.define someObjProperty_0404 $0404
.define someObjProperty_0405 $0405

.define someObjProperty_0500 $0500
.define someObjProperty_0501 $0501
.define someObjProperty_0502 $0502
.define someObjProperty_0503 $0503
.define someObjProperty_0504 $0504
.define someObjProperty_0505 $0505

.define someObjProperty_0600 $0600
.define someObjProperty_0601 $0601
.define someObjProperty_0602 $0602
.define hitPoints_0603 		 $0603
.define someObjProperty_0604 $0604
.define someObjProperty_0605 $0605

.define someObjProperty_0700 $0700



.segment "STARTUP"

.define BIT0	%00000001
.define BIT1	%00000010
.define BIT2	%00000100
.define BIT3	%00001000
.define BIT4	%00010000
.define BIT5	%00100000
.define BIT6	%01000000
.define BIT7	%10000000

; $8000
BIT_0:	.byte BIT0
BIT_1:	.byte BIT1
BIT_2:	.byte BIT2
BIT_3:	.byte BIT3
BIT_4:	.byte BIT4
BIT_5:	.byte BIT5
BIT_6:	.byte BIT6
BIT_7:	.byte BIT7

.define BUTTON_RIGHT	BIT_0
.define BUTTON_LEFT		BIT_1
.define BUTTON_DOWN		BIT_2
.define BUTTON_UP		BIT_3
.define BUTTON_START	BIT_4
.define BUTTON_SELECT	BIT_5
.define BUTTON_B		BIT_6
.define BUTTON_A		BIT_7

; $8008
HeartHUDData:
.byte $D8, $81, $01, $38; 8008 - 800B

BankSequenceArray:
.byte $01, $01, $01, $02; 800C - 800F
;
; $8010
; Reset handler, called by reset interrupt
HandleReset:
	lda #$C0
	sta Ctrl2_FrameCtr_4017
	
	ldx #$10 ; Wait 16 cycles for PPU to reach its STAble STAte
	:	
		lda PpuStatus_2002
		DEX
		bne :-

	lda BankSwitching_FFF0	; Loads a $00 from ROM filling (dangerous!)
	sta BankSwitching_FFF0  ; Set mapper to Bank0
	
	ldx #$00
	jsr SetupAfterReset	

	jsr SetFlag_59
	nop  ;
	nop  ;
	nop  ; jsr ResetSoundEngine

	lda #$01 
	sta flagGameMode_26

	lda #$00 
	TAX
	jsr LoadStage                

	lda #$01                 
	ldx #$01                 
	jsr LoadStage                

	lda #$88                 
	and #$F7                 
	sta flagPPUControl_17                  
	sta flagPPUControl_19   
	lda #$1C                 
	sta flagPPUMask_18                  
	lda #$00                 
	sta bankIndex_15         
	lda #$00                 
	sta powerUp_P_64         
	lda #$10
	sta livesCounter_11      
	lda #$00                 
	sta soundAddress_8F               
	sta PpuScroll_2005       
	sta PpuScroll_2005       
	jsr RenderON                
	lda #$00                 
	sta soundAddress_8D                  
	nop  ;
	nop  ;
	nop  ; jsr InitializeSound ; see sound engine                

WaitForPressStart:       
	lda #$00                 
	jsr ReadControl_A        
	lda input1_20            
	
	checkInputStart:         
	cmp  #BIT4 ; not cmp  BUTTON_START for some reason
	beq :+     
	jmp WaitForPressStart    
	:

	sta inputPrev_22
	:
		lda input1_20            
		cmp  inputPrev_22         
		beq :-

	nop  ;
	nop  ;
	nop  ;jsr Sound_DontKnowWhatItDoes

	lda #$07                 
	sta soundAddress_8D      
	
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
	
	lda #$00                 
	sta bankIndex_15         
	jmp MaybeStartGame ; Check what this one does

MaybeStartingNewGame:
	jsr RenderingOFF                

	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound 

	lda #$00                 
	sta PpuControl_2000      
	jsr ClearNametablePattern
	lda #$01                 
	jsr ClearNametablePattern
	ldy bankIndex_15         
	lda BankSequenceArray,y        
	tax                      
	sta BankSwitching_FFF0+0,X
	inc bankIndex_15         
	clc                      
	lda bankIndex_15         
	asl A                    
	pha                      
	ldx #$00                 
	jsr LoadStage            
	pla                      
	clc                      
	adc #$01                 
	ldx #$01                 
	jsr LoadStage            
	lda #$FF                 
	sta var_0C                  
	lda #$00                 
	sta flagGameMode_26      
	ldx #$02                 
	stx frameToScroll_27     
	ldx #$01                 
	stx levelProgression_16  
	lda #%00011100                 
	sta flagPPUMask_18      
	lda #%10001000                 
	sta flagPPUControl_17   
	sta flagPPUControl_19   
	lda #$0A                 
	sta var_5C
	lda #$00                 
	sta input1_20            
	sta inputPrev_22         
	sta var_5B
	sta aliveTimer_14        
	sta frameCounter64_13    
	jsr InitializeGameVariables                
	jsr InitializeGameVariables2                
	jsr MaybeTriggerNextLevel                
	lda #$00                 
	sta flagNextLevel_1B     
	sta flagUnknown_1A                  
	jsr RenderON             

	lda #$01                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr InitializeSound      
	lda bankIndex_15         
	cmp  #$02                 
	bcs loopMain             
	ldy #$00                 

	EnableHeartAsSpriteZero:
	:
		lda HeartHUDData,y
		sta OAM_0200,y           
		iny                      
		cpy #$04                 
		bne :-
		
	SetupNewLevel:                  
		lda #$F8                 
		sta OAM_0200

		jsr InitializeGameVariables                
		jsr MaybeTriggerNextLevel                

	loopMain:                
		jsr UnknownSub1                
		jsr LoadEnemies
		jsr LivesHUD
		lda $62                  
		beq :+
		sta var_4E                  
		jsr UnknownSub12
		:
		lda flagPlayerHit_1E        
		beq skipPlayerHit        
		dec livesCounter_11      
		lda #$01                 
		jsr HandleAliveTimer     
		lda #$00                 
		sta flagPlayerHit_1E        
		sta soundAddress_8F               
		jmp SetupNewLevel          

		skipPlayerHit:           
		lda livesCounter_11      
		bne skipSomethingImportant
		nop  ;
		nop  ;
		nop  ; jsr Sound_DontKnowWhatItDoes
		jsr UnknownSub5             
		jsr PaletteFading        
		jsr RenderingOFF                
		lda #$FF                 
		sta updateDuringVBlank_0E
		sta updateDuringVBlank_0F
		jmp HandleReset          
		
		skipSomethingImportant:  
		lda flagNextLevel_1B     
		beq dontAdvanceLevel     
		nop  ;
		nop  ;
		nop  ; jsr Sound_DontKnowWhatItDoes
		jmp MaybeStartGame

		dontAdvanceLevel:        
		jmp loopMain             
;



;==================================
; Beginning of Subroutines
;==================================

; $8170
.proc SetFlag_59
	lda #$06                 
	sta var_59                  
	rts                       
.endproc
;
; $8175
; Loads objects (enemies?)
; Checks address $5C for a value grater than #$FA (250). If not, skip

.proc LoadEnemies
	lda var_5C                  
	cmp  #$FA                 
	bcs :+
	jmp leaveThisRountine                
	:
	ldy bankIndex_15         
	dey                      
	tya                      
	asl A                    
	asl A                    
	tay                      
	lda ObjectStart,y              
	sta objectPtr_34                  
	lda ObjectStart+1,y              
	sta objectPtr_34+1                  
	lda var_5B                  
	asl A                    
	tay                      
	lda (objectPtr_34),y              
	cmp  #$FF                 
	bne :++
	iny                      
	lda (objectPtr_34),y              
	cmp  #$FF                 
	bne :+                
	jmp leaveThisRountine                
	:
	dey                      
	lda (objectPtr_34),y              
	:
	sta anotherObjPtr_3A                  
	iny                      
	lda (objectPtr_34),y              
	sta anotherObjPtr_3A+1                  
	ldy #$00                 
	loopY:
		jsr CheckSomethingUnknown1                
		cpx #$F0                 
		bcs doneLooping                
		lda (anotherObjPtr_3A),y              
		cmp  #$F8                 
		bne :+
		lda #$01                 
		sta flagUnknown_1A                  
		ldx #$30                 
		jsr Clear54Bytes_Page04  
		nop  ;
		nop  ;
		nop  ; jsr Sound_DontKnowWhatItDoes
		nop  ;
		nop  ;
		nop  ; jsr DoSomethingWithSound 
		lda #$02                 
		sta soundAddress_8D      
		nop  ;
		nop  ;
		nop  ; jsr InitializeSound      
		iny                      
		lda (anotherObjPtr_3A),y              
		:
		cmp  #$F0                 
		bne :+
		and #$00                 
		sta var_2D                  
		iny                      
		lda (anotherObjPtr_3A),y              
		:
		cmp #$FF                 
		beq doneLooping                
		cmp #$F1                 
		bne :+                
		and #$03                 
		sta var_2D                  
		iny                      
		lda (anotherObjPtr_3A),y              
		sta $2B                  
		inc $2B                  
		iny                      
		lda (anotherObjPtr_3A),y              
		:
		cmp  #$F2                 
		bne :+                
		and #$03                 
		sta var_2D                  
		iny                      
		lda (anotherObjPtr_3A),y              
		sta var_2C                  
		inc var_2C                  
		iny                      
		lda (anotherObjPtr_3A),y              
		:
		sta var_58
		iny                      
		lda (anotherObjPtr_3A),y              
		sta var_54                  
		iny                      
		lda (anotherObjPtr_3A),y              
		sta var_55                  
		iny                      
		lda (anotherObjPtr_3A),y              
		sta var_56                  
		iny                      
		lda (anotherObjPtr_3A),y              
		sta var_57                  
		jsr LoadSomethingImportant                
		iny                      
		jmp loopY

doneLooping:
	inc var_5B                  
	lda var_5C                  
	clc                      
	adc #$F0                 
	sta var_5C                  

leaveThisRountine:
	rts                       
.endproc
;
; $822F
.proc LoadSomethingImportant
	tya                      
	pha                      
	ldy bankIndex_15         
	dey                      
	tya                      
	asl A                    
	asl A                    
	tay                      
	lda ObjectStart+2,y              
	sta objectPtr_34                  
	lda ObjectStart+3,y              
	sta objectPtr_34+1                  
	lda var_58                  
	asl A                    
	tay                      
	lda (objectPtr_34),y              
	sta otherObjPtr_38+0
	iny                      
	lda (objectPtr_34),y              
	sta otherObjPtr_38+1
	ldy #$00                 
	lda (otherObjPtr_38),y
	sta someObjProperty_0501,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0502,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0602,X              
	iny                      
	lda (otherObjPtr_38),y              
	ora #$60                 
	ora var_2D                  
	sta someObjProperty_0405,X              
	iny                      
	lda (otherObjPtr_38),y              
	sta someObjProperty_0600,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0601,X              
	iny                      
	lda (otherObjPtr_38),y
	sta hitPoints_0603,X     
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0302,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0301,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0604,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0605,X              
	iny                      
	lda (otherObjPtr_38),y
	sta someObjProperty_0700,X              
	sta someObjProperty_0300,X              
	lda var_54                  
	sta someObjProperty_0400,X              
	lda var_55                  
	sta someObjProperty_0401,X              
	lda var_56                  
	sta someObjProperty_0402,X              
	lda var_57                  
	sta someObjProperty_0403,X              
	lda #$00                 
	sta someObjProperty_0503,X              
	sta someObjProperty_0504,X              
	sta someObjProperty_0505,X              
	sta someObjProperty_0303,X              
	lda #$80                 
	sta someObjProperty_0404,X              
	pla                      
	tay                      
	rts                       
.endproc
;
; $82C9
.proc UnknownSub1
	jsr UnknownSub2
	lda #$00                 
	sta $5A                  
	lda #$06                 
	sta $4D                  
	
	BeginHere:
	ldx $4D                  
	lda someObjProperty_0404,X              
	BIT BIT_4                
	beq :++
	jsr HandleObjectCollision
	lda someObjProperty_0303,X              
	cmp  #$02                 
	bne :+                
	lda #$FF                 
	sta flagPlayerHit_1E        
	lda #$00                 
	sta someObjProperty_0303,X              
	:
	jmp doneWithThis                
	:
	lda someObjProperty_0404,X              
	bpl doneWithThis                
	lda someObjProperty_0401,X              
	beq :+                
	cmp  #$FF                 
	bne SecondPart                
	lda someObjProperty_0400,X              
	clc                      
	adc someObjProperty_0600,X              
	bcc SecondPart                
	:
	lda someObjProperty_0403,X              
	beq ThirdPart                
	cmp  #$FF                 
	bne SecondPart                
	lda someObjProperty_0402,X              
	clc                      
	adc someObjProperty_0601,X              
	bcs ThirdPart                
	
	SecondPart:
	lda someObjProperty_0405,X              
	and #$10                 
	beq :+
	lda someObjProperty_0404,X              
	and #$20                 
	beq :++
	:
	lda #$10                 
	sta someObjProperty_0404,X              
	jmp doneWithThis                
	:
	lda someObjProperty_0404,X              
	and #$DF                 
	sta someObjProperty_0404,X              
	jmp doneWithThis                
	
	ThirdPart:
	lda someObjProperty_0404,X              
	ora #$20                 
	sta someObjProperty_0404,X              
	jsr UnknownSub3
	lda someObjProperty_0404,X              
	and #$08                 
	beq doneWithThis                
	lda $5A                  
	bne doneWithThis                
	jsr $8D73                
	
	doneWithThis:
	lda $4D                  
	clc                      
	adc #$06                 
	sta $4D                  
	cmp  #$F0                 
	beq :+
	jmp BeginHere                
	:
	jsr UnknownSub8                
	rts                       
.endproc
;
; $8369
.proc UnknownSub2
	lda someObjProperty_0400                
	clc                      
	adc #$08                 
	sta $0702                
	lda someObjProperty_0400                
	adc someObjProperty_0600                
	sbc  #$08                 
	sta $0703                
	lda someObjProperty_0402                
	adc #$03                 
	sta $0704                
	lda someObjProperty_0402                
	adc someObjProperty_0601                
	sbc  #$04                 
	sta $0705                
	rts                       
.endproc
;
; $8391
.proc UnknownSub3
	lda someObjProperty_0405,X              
	and #$10                 
	beq SecondPart                
	
	lda someObjProperty_0401,X              
	beq :+
	lda #$00                 
	beq :++
	
	:
	lda someObjProperty_0400,X              
	
	:
	sta $0702,X              
	lda someObjProperty_0403,X              
	beq :+
	lda #$00                 
	beq :++
	
	:
	lda someObjProperty_0402,X              
	
	:
	sta $0704,X              
	lda someObjProperty_0400,X              
	clc                      
	adc someObjProperty_0600,X              
	cmp  $0702,X              
	bcs :+
	lda #$FF                 
	
	:
	sta $0703,X              
	lda someObjProperty_0402,X              
	clc                      
	adc someObjProperty_0601,X              
	cmp  $0704,X              
	bcs :+
	lda #$FF                 
	
	:
	sta $0705,X              
	rts                       

	SecondPart:
	lda someObjProperty_0400,X              
	sta $0702,X              
	clc                      
	adc someObjProperty_0600,X              
	sta $0703,X              
	lda someObjProperty_0402,X              
	sta $0704,X              
	clc                      
	adc someObjProperty_0601,X              
	sta $0705,X              
	rts                       

.endproc
;
; $83F4
.proc UnknownSub8
	ldy #$00                 
	
	BeginHere:
	lda someObjProperty_0404,y              
	bmi :+
	jmp DoneWithThis                
	
	:
	lda someObjProperty_0405,y              
	BIT BIT_6                
	bne :+
	jmp DoneWithThis                
	
	:
	lda $0702,y              
	sta $4F                  
	lda $0703,y              
	sta $50                  
	lda $0704,y              
	sta $51                  
	lda $0705,y              
	sta $52                  
	ldx #$30                 
	
	AnotherCheckAndLeave:
	lda someObjProperty_0404,X              
	bpl StartLeaving
	and #$20                 
	beq StartLeaving
	lda someObjProperty_0405,X              
	BIT BIT_6                
	beq StartLeaving
	
	and #$10                 
	bne :+
	cpy #$00                 
	beq :+
	
	StartLeaving:
	jmp dontHandleObjCollision                
	
	: ; $843B
	lda $0702,X              
	cmp  $50                  
	bcs StartLeaving
	lda $4F                  
	cmp  $0703,X              
	bcs StartLeaving
	lda $0704,X              
	cmp  $52                  
	bcs StartLeaving
	lda $51                  
	cmp  $0705,X              
	bcs StartLeaving
	lda hitPoints_0603,X     
	sec                       
	sbc  someObjProperty_0602,y              
	beq :+
	bcs :++
	
	:
	jsr UnknownSub9                
	jmp :++
	
	:
	sta hitPoints_0603,X     
	lda $1A                  
	bne :+
	clc                      
	lda someObjProperty_0400,X              
	adc #$07                 
	sta someObjProperty_0400,X              
	lda someObjProperty_0401,X              
	adc #$00                 
	sta someObjProperty_0401,X              
	
	:
	cpy #$00                 
	bne :+
	
	:
	lda hitPoints_0603,y     
	sec                       
	sbc  someObjProperty_0602,X              
	beq doHandleObjCollision                
	bcc doHandleObjCollision                
	
	cpy #$00                 
	bne doStoreHitPointsAndLeave                
	cmp  #$14                 
	bcs doStoreHitPointsAndLeave                
	pha                      
	lda #$D7                 
	sta someObjProperty_0501                
	lda #$8B                 
	sta someObjProperty_0502                
	lda #$00                 
	sta someObjProperty_0503                
	sta someObjProperty_0504                
	sta someObjProperty_0505                
	pla                      
	cmp  #$01                 
	bne doStoreHitPointsAndLeave                
	pha                      
	lda #$F8                 
	sta OAM_0200             
	pla                      
	
	doStoreHitPointsAndLeave:
	sta hitPoints_0603,y     
	jmp DoneWithThis                
	
	doHandleObjCollision:
	tya                      
	tax                      
	jsr HandleObjectCollision
	jmp DoneWithThis                
	
	dontHandleObjCollision:
	txa                      
	clc                      
	adc #$06                 
	tax                      
	cmp  #$F0                 
	bcc :+
	bcs DoneWithThis                
	
	:
	jmp AnotherCheckAndLeave
	
	DoneWithThis:
	tya                      
	clc                      
	
	EvenMoreDone:
	adc #$06                 
	cmp  #$30                 
	bcs :+
	tay                      
	jmp BeginHere                
	
	:
	rts                       
.endproc
;
; $84E2
.proc UnknownSub9
	txa                      
	pha                      
	tya                      
	pha                      
	lda someObjProperty_0405,X              
	BIT BIT_4                
	bne :+
	jmp doHandleObjCollision                
	
	:
	BIT BIT_0                
	beq :+
	lda $2B                  
	beq doHandleObjCollision                
	sec                       
	sbc  #$01                 
	sta $2B                  
	cmp  #$01                 
	bne doALSOHandleObjCollision
	sta $2E                  
	jsr UnknownSub4                
	jmp doHandleObjCollision                
	
	:
	BIT BIT_1                
	beq :+
	lda var_2C                  
	beq doHandleObjCollision                
	sec                       
	sbc  #$01                 
	sta var_2C                  
	cmp  #$01                 
	bne doALSOHandleObjCollision
	sta $2E                  
	jsr UnknownSub4                
	jmp doHandleObjCollision                
	
	:
	BIT BIT_3                
	beq doALSOHandleObjCollision
	cpy #$00                 
	bne skipHandlingCollision
	
	doALSOHandleObjCollision:
	jsr HandleObjectCollision
	lda soundAddress_8D      
	cmp  #$05                 
	beq skipHandlingCollision
	nop  ;
	nop  ;
	nop  ;	jsr DoSomethingWithSound 

	lda #$04                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              

	jmp skipHandlingCollision
	
	doHandleObjCollision:
	jsr HandleObjectCollision
	skipHandlingCollision:   
	pla                      
	tay                      
	pla                      
	tax                      
	rts                       
.endproc
;
; $854C
; Checks is object with index in X hit something important.
; X = 0 is the player
.proc HandleObjectCollision
	txa                      
	pha                      
	tya                      
	pha                      
	lda someObjProperty_0405,X              
	BIT BIT_6                
	bne :+
	jmp doneWithThisRoutine_X
	
	:
	lda someObjProperty_0302,X              
	bne :+
	
	:
	cmp  #$06                 
	bne handlePlayerGotExtraLife
	lda $60                  
	beq :+
	dec $60                  
	
	:
	lda #$00                 
	jmp SecondPart
	handlePlayerGotExtraLife:
	cmp  #$28                 
	bne handlePlayerGotPowerUp
	nop  ;
	nop  ;
	nop  ; jsr UnknownSoundSub2
                
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound             
 
	lda #$06                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
	inc livesCounter_11      
	jmp doneWithThisRoutine_X
	handlePlayerGotPowerUp:  
	cmp  #$29                 
	bne handlePlayerGotHeart 
	nop  ;
	nop  ;
	nop  ; jsr UnknownSoundSub2
                
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound             
 
	lda #$07                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
              
	lda powerUp_P_64         
	cmp  #$04                 
	bcc :+
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound             
 
	jmp doneWithThisRoutine_X
	
	:
	inc powerUp_P_64         
	jmp doneWithThisRoutine_X
	
	handlePlayerGotHeart:    
	cmp  #$2A                 
	bne skipHeart            
	nop  ;
	nop  ;
	nop  ; jsr UnknownSoundSub2
          
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound             
 
	lda #$07                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
              
	jsr AddOneHeart          
	jmp doneWithThisRoutine_X
	
	skipHeart:               
	cmp  #$2B                 
	bne :+
	nop  ;
	nop  ;
	nop  ; jsr UnknownSoundSub2
                
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound             
 
	lda #$07                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
              
	lda #$03                 
	sta speed_66             
	jmp doneWithThisRoutine_X
	
	:
	cmp  #$2C                 
	bne :++
	lda someObjProperty_0401,X              
	beq :+
	jmp doneWithThisRoutine_X
	
	:
	lda #$0C                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
              
	lda #$50                 
	sta hitPoints_0603       
	lda #$BD                 
	sta someObjProperty_0501                
	lda #$8B                 
	sta someObjProperty_0502                
	lda #$00                 
	sta someObjProperty_0503                
	sta someObjProperty_0504                
	sta someObjProperty_0505                
	lda #$D8                 
	sta OAM_0200             
	jmp doneWithThisRoutine_X
	
	:
	cmp  #$1F                 
	bne :+
	lda #$02                 
	bne SecondPart
	
	:
	cmp  #$1A                 
	bne :+
	nop  ;
	nop  ;
	nop  ; jsr UnknownSoundSub2
                
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound             
 
	lda #$05                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr PlaySFX              
              
	lda #$01                 
	sta soundAddress_8F               
	lda #$03                 
	bne SecondPart
	
	:
	cmp  #$32                 
	bne :+
	lda #$04                 
	bne SecondPart
	
	:
	cmp  #$33                 
	bne :+
	lda #$05                 
	bne SecondPart
	
	:
	cmp  #$34                 
	bne :+
	lda #$06                 
	bne SecondPart
	
	:
	cmp  #$35                 
	bne :+
	lda #$07                 
	bne SecondPart
	
	:
	cmp  #$36                 
	bne :+
	lda #$0C                 
	bne SecondPart
	
	:
	cmp  #$24                 
	bne doneWithThisRoutine_X
	lda #$09                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr InitializeSound      

	lda #$08                 
	clc                      
	adc bankIndex_15         
	sbc  #$00                 
	
	SecondPart:
	sta var_58                  
	lda someObjProperty_0404,X              
	and #$20                 
	beq doneWithThisRoutine_X
	clc                      
	lda someObjProperty_0400,X              
	sta var_54                  
	lda someObjProperty_0401,X              
	adc #$00                 
	sta var_55                  
	clc                      
	lda someObjProperty_0402,X              
	sta var_56                  
	lda someObjProperty_0403,X              
	adc #$00                 
	sta var_57                  
	jsr UnknownSub7                
	doneWithThisRoutine_X:   
	pla                      
	tay                      
	pla                      
	tax                      
	lda #$00                 
	sta someObjProperty_0404,X              
	rts                       
.endproc
;
; $8696
.proc AddOneHeart
	lda hitPoints_0603       
	clc                      
	adc #$04                 
	bcc didNotExceedFF       
	lda #$FF                 
	didNotExceedFF:          
	sta hitPoints_0603       
	updateHeartDisplay:      
	lda #$D8                 
	sta OAM_0200             
	rts                       
.endproc
;
; $86A9
.proc UnknownSub7
	jsr CheckSomethingUnknown1
	cpx #$F0                 
	bcc :+               
	rts                       
	
	:
	lda var_58                  
	asl A                    
	asl A                    
	asl A                    
	tay                      
	lda DATA_BLOCK_8715+0,y              
	sta someObjProperty_0501,X              
	lda DATA_BLOCK_8715+1,y              
	sta someObjProperty_0502,X              
	lda DATA_BLOCK_8715+2,y              
	sta someObjProperty_0602,X              
	lda DATA_BLOCK_8715+3,y              
	sta someObjProperty_0405,X              
	lda DATA_BLOCK_8715+4,y              
	sta someObjProperty_0600,X              
	lda DATA_BLOCK_8715+5,y              
	sta someObjProperty_0601,X              
	lda DATA_BLOCK_8715+6,y              
	sta someObjProperty_0302,X              
	lda DATA_BLOCK_8715+7,y              
	sta someObjProperty_0303,X              
	lda var_54                  
	sta someObjProperty_0400,X              
	lda var_55                  
	sta someObjProperty_0401,X              
	lda var_56                  
	sta someObjProperty_0402,X              
	lda var_57                  
	sta someObjProperty_0403,X              
	lda #$00                 
	sta someObjProperty_0503,X              
	sta someObjProperty_0504,X              
	sta someObjProperty_0505,X              
	sta someObjProperty_0700,X              
	sta someObjProperty_0300,X              
	sta someObjProperty_0301,X              
	lda #$80                 
	sta someObjProperty_0404,X              
	rts                       
.endproc
;
; $8715
DATA_BLOCK_8715:
.incbin "rom-prg/objects/data-block-at8715.bin"
;
; $8AEA
.proc UnknownSub4
	lda $2E                  
	beq doneWithThisRoutine
	lda frameCounter_12      
	and #$07                 
	bne :+
	lda #$32                 
	bne doStartToLeave
	
	:
	BIT BIT_0                
	bne :+
	lda #$33                 
	bne doStartToLeave
	
	:
	BIT BIT_1                
	bne :+
	lda #$34                 
	bne doStartToLeave
	
	:
	lda #$35                 
	
	doStartToLeave:
	pha                      
	lda #$00                 
	sta $2E                  
	pla                      
	sta someObjProperty_0302,X              
	
	doneWithThisRoutine:
	rts                       
.endproc
;
; $8B16
.proc InitializeGameVariables
	lda #$F2                 
	sta someObjProperty_0400                
	lda #$FF                 
	sta someObjProperty_0401                
	lda #$70                 
	sta someObjProperty_0402                
	lda #$7D                 
	sta someObjProperty_0501                
	lda #$8B                 
	sta someObjProperty_0502                
	lda #$A0                 
	sta someObjProperty_0404                
	lda #$00                 
	sta someObjProperty_0503                
	sta someObjProperty_0504                
	sta someObjProperty_0505                
	sta aliveTimer_14        
	sta soundAddress_8D      
	lda #$1A                 
	sta someObjProperty_0302                
	lda #$03                 
	sta someObjProperty_0602                
	lda #$14                 
	sta someObjProperty_0600                
	lda #$18                 
	sta someObjProperty_0601                
	lda #$18                 
	sta someObjProperty_0604                
	lda #$0E                 
	sta someObjProperty_0605                
	lda #$00                 
	sta someObjProperty_0405                
	lda #$00                 
	sta $60                  
	lda flagNextLevel_1B     
	bne :+
	lda #$01                 
	sta hitPoints_0603       
	lda powerUp_P_64         
	beq :+
	dec powerUp_P_64         
	:           
	rts                       
.endproc
;
; $8B7D ;;;;;;; objects?
DATA_BLOCK_8B7A:
.incbin "rom-prg/objects/data-block-at8B7A.bin"
;
; $8BE5
.proc InitializeGameVariables2
	ldy #$06                 
	lda #$C0                 
	sta someObjProperty_0400,y              
	lda #$D8                 
	sta someObjProperty_0402,y              
	lda #$A0                 
	sta someObjProperty_0404,y              
	lda #$00                 
	sta someObjProperty_0405,y              
	sta someObjProperty_0503,y              
	sta someObjProperty_0504,y              
	sta someObjProperty_0505,y              
	sta someObjProperty_0302,y              
	sta someObjProperty_0303,y              
	sta someObjProperty_0604,y              
	sta someObjProperty_0605,y              
	sta someObjProperty_0602,y              
	lda #$FF                 
	sta hitPoints_0603,y     
	lda #$07                 
	sta someObjProperty_0600,y              
	lda #$07                 
	sta someObjProperty_0601,y              
	rts                       
.endproc
;
; $8C23
.proc MaybeTriggerNextLevel
	lda #$00                 
	sta var_5F                  
	lda flagNextLevel_1B     
	bne :+
	lda #$02                 
	sta speed_66             
	:
	lda #$FF                 
	sta var_5E                  
	rts                       
.endproc
;
; $8C34
.proc UnknownSub12
	txa                      
	pha                      
	lda var_4E                  
	BIT BIT_1
	beq skipThisRoutine
	
	ldx powerUp_P_64         
	txa                      
	beq secondPart
	cpx #$01                 
	bne :+
	lda #$01                 
	bne secondPart
	
	:
	cpx #$02                 
	bne :+
	lda #$02                 
	bne secondPart
	
	:
	cpx #$03                 
	bne :+
	lda #$02                 
	bne secondPart
	
	:
	cpx #$04                 
	bne skipOtherPath                
	lda #$03                 
	
	secondPart:
	cmp  $60                  
	bcc skipThisRoutine                
	cpx #$03                 
	bcc :+
	inc $60                  
	inc $60                  
	lda #$01                 
	jsr UnknownSub13                
	lda #$02                 
	jsr UnknownSub13                
	
	
	:
	inc $60                  
	lda #$00                 
	jsr UnknownSub13                
	lda soundAddress_8D      
	cmp  #$07                 
	bne :+
	lda frameCounter_12      
	and #$03                 
	bne skipThisRoutine                
	nop  ;
	nop  ;
	nop  ; jsr $9C91  ; This is sound              
	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound 
	
	beq :++
	
	:
	cmp  #$05                 
	beq skipThisRoutine                
	
	:
	lda #$03                 
	sta soundAddress_8D      
	nop  ; 
	nop  ; 
	nop  ; jsr PlaySFX              
	
	skipThisRoutine:
	lda #$00                 
	sta $62                  
	sta var_4E                  
	pla                      
	tax                      
	rts                       
	
	skipOtherPath:
	cpx #$05                 
	bcc :+
	lda #$02                 
	sta powerUp_P_64         

	:
	jmp skipThisRoutine

.endproc
;
; $8CB0
.proc UnknownSub13

	pha                      
	jsr UnknownSub14
	cpx #$30                 
	bcc :+
	pla                      
	rts                       

	:
	pla                      
	asl A                    
	asl A                    
	asl A                    
	tay                      
	lda DATA_BLOCK_8D1D+0,y              
	sta someObjProperty_0501,X              
	lda DATA_BLOCK_8D1D+1,y              
	sta someObjProperty_0502,X              
	lda DATA_BLOCK_8D1D+2,y              
	cpy #$00                 
	beq :+
	clc                      
	adc #$02                 
	
	:
	sta someObjProperty_0602,X              
	lda DATA_BLOCK_8D1D+3,y              
	sta someObjProperty_0302,X              
	lda DATA_BLOCK_8D1D+4,y              
	sta someObjProperty_0600,X              
	lda DATA_BLOCK_8D1D+5,y              
	sta someObjProperty_0601,X              
	lda someObjProperty_0400                
	clc                      
	adc DATA_BLOCK_8D1D+6,y              
	sta someObjProperty_0400,X              
	lda someObjProperty_0402                
	clc                      
	adc DATA_BLOCK_8D1D+7,y              
	sta someObjProperty_0402,X              
	lda #$00                 
	sta someObjProperty_0503,X              
	sta someObjProperty_0504,X              
	sta someObjProperty_0505,X              
	sta someObjProperty_0401,X              
	sta someObjProperty_0403,X              
	sta hitPoints_0603,X     
	lda #$40                 
	sta someObjProperty_0405,X              
	lda #$80                 
	sta someObjProperty_0404,X              
	rts                       

.endproc
;
; $8D1D
DATA_BLOCK_8D1D:
.incbin "rom-prg/objects/data-block-at8D1D.bin"
;
; $8D4D
.proc UnknownSub14
	clc                      
	ldx #$0C                 
	
	:
	lda someObjProperty_0404,X              
	and #$90                 
	beq :+
	txa                      
	adc #$06                 
	tax                      
	cpx #$30                 
	bcc :-
	
	:
	rts                       
.endproc
;
; $8D60
.proc CheckSomethingUnknown1
	clc                      
	ldx #$30                 
	:
		lda someObjProperty_0404,X              
		and #$90                 
		beq :+
		txa                      
		adc #$06                 
		tax                      
		cpx #$F0                 
		bcc :-
	:
	rts                       
.endproc
;
; $8D73
.proc UnknownSub24
	lda someObjProperty_0301,X              
	bne :+
	rts                       

	:
	lda someObjProperty_0404,X              
	and #$F7                 
	sta someObjProperty_0404,X              
	lda someObjProperty_0700,X              
	sta someObjProperty_0300,X              
	lda someObjProperty_0301,X              
	cmp  #$01                 
	bne :+
	jsr UnknownSub25
	jmp skipThisRoutine
	
	:
	cmp  #$03                 
	bne :+
	jsr UnknownSub16         
	jmp skipThisRoutine
	
	:
	cmp  #$05                 
	bne :+++
	lda #$0F                 
	BIT frameCounter_12
	beq :+
	jsr UnknownSub20
	jmp :++
	
	:
	jsr UnknownSub25
	
	:
	lda $1A                  
	beq :+
	jsr UnknownSub15
	
	:
	cmp  #$06                 
	bne :+
	jsr UnknownSub21
	jsr UnknownSub15
	
	:
	cmp  #$07                 
	bne :+
	jsr UnknownSub22
	jsr UnknownSub15
	
	:
	cmp  #$08                 
	bne skipThisRoutine
	jsr UnknownSub23
	jsr UnknownSub15
	
	skipThisRoutine:
	lda #$01                 
	sta $5A                  
	rts                       
.endproc
;
; $8DDB
.proc UnknownSub25
	lda #$00                 
	sta $4B                  
	lda someObjProperty_0400,X              
	sec                       
	sbc  someObjProperty_0400                
	bcs :+
	EOR #$FF                 
	
	:
	ROL $4B                  
	sta $4C                  
	lda someObjProperty_0402,X              
	sec                       
	sbc  someObjProperty_0402                
	bcs :+
	EOR #$FF                 
	
	:
	ROL $4B                  
	cmp  $4C                  
	bcs :+
	ldy $4C                  
	sta $4C                  
	tya                      
	
	:
	ROL $4B                  
	sec                       
	sbc  $4C                  
	ldy #$00                 
	
	:
	sec                       
	sbc  $4C                  
	bcc :+
	iny                      
	cpy #$04                 
	bcc :-
	
	:
	tya                      
	ldy $4B                  
	clc                      
	adc DATA_BLOCK_8E25,y    
	asl A                    
	sta $4A                  
	txa                      
	tay                      
	jsr $8E47                
	rts                       
.endproc
;
; $8E25
DATA_BLOCK_8E25:
.byte $0f, $23, $0a, $19, $05, $1e, $00, $1e
;
; $8E2D
.proc UnknownSub16
	txa                      
	tay                      
	ldx #$00                 
	
	:
	lda DATA_BLOCK_8E3F,X              
	sta $4A                  
	jsr UnknownSub17 ; ==========================
	inx                      
	cpx #$08                 
	bne :-
	rts                       
.endproc
;
; $8E3F
DATA_BLOCK_8E3F:
.byte $00, $08, $0a, $44, $46, $1c, $14, $30
;
; $8E47
.proc UnknownSub17
	txa                      
	pha                      
	tya                      
	pha                      
	jsr CheckSomethingUnknown1
	cpx #$F0                 
	bcs doneWithThis
	jsr UnknownSub18
	ldy $4A                  
	jsr UnknownSub19
	lda #$01                 
	sta someObjProperty_0602,X              
	lda #$60                 
	sta someObjProperty_0405,X              
	lda #$04                 
	sta someObjProperty_0600,X              
	sta someObjProperty_0601,X              
	lda #$00                 
	sta hitPoints_0603,X     
	sta someObjProperty_0301,X              
	sta someObjProperty_0302,X              
	lda #$80                 
	sta someObjProperty_0404,X              
	
	doneWithThis:
	pla                      
	tay                      
	pla                      
	tax                      
	rts                       
.endproc
;
; $8E81
.proc UnknownSub18

	lda someObjProperty_0400,y              
	clc                      
	adc someObjProperty_0604,y              
	sta someObjProperty_0400,X              
	lda someObjProperty_0401,y              
	adc #$00                 
	sta someObjProperty_0401,X              
	lda someObjProperty_0402,y              
	clc                      
	adc someObjProperty_0605,y              
	sta someObjProperty_0402,X              
	lda someObjProperty_0403,y              
	adc #$00                 
	sta someObjProperty_0403,X              
	rts                       
.endproc
;
; $8EA6
.proc UnknownSub19
	lda DATA_BLOCK_8EBE+0,y              
	sta someObjProperty_0501,X              
	lda DATA_BLOCK_8EBE+1,y              
	sta someObjProperty_0502,X              
	lda #$00                 
	sta someObjProperty_0505,X              
	sta someObjProperty_0503,X              
	sta someObjProperty_0504,X              
	rts                       
.endproc
;
; $8EBE
DATA_BLOCK_8EBE:
.incbin "rom-prg/objects/data-block-at8EBE.bin"
;
; $927F
.proc UnknownSub20
	txa                      
	tay                      
	ldx #$00                 
	
	:
	lda DATA_BLOCK_9291,X              
	sta $4A                  
	jsr UnknownSub17                
	inx                      
	cpx #$05                 
	bne :-
	rts                       
.endproc
;
; $9291
DATA_BLOCK_9291:
.byte $52, $54, $56, $58, $5a
;
; $9296
.proc UnknownSub21
	txa                      
	tay                      
	ldx #$00                 
	
	:
	lda DATA_BLOCK_92A8,X              
	sta $4A                  
	jsr UnknownSub17                
	inx                      
	cpx #$03                 
	bne :-
	rts                       
.endproc
;
; $92A8
DATA_BLOCK_92A8:
.byte $5E, $60, $62
;
; $92AB
.proc UnknownSub22
	txa                      
	tay                      
	ldx #$00                 
	
	:
	lda DATA_BLOCK_92BD,X              
	sta $4A                  
	jsr UnknownSub17                
	inx                      
	cpx #$05                 
	bne :-
	rts                       
.endproc
;
; $92BD
DATA_BLOCK_92BD:
.byte $64, $66, $68, $6A, $6C
;
; $92C2
.proc UnknownSub23
	txa                      
	tay                      
	ldx #$00                 
	:
	lda DATA_BLOCK_92D4,X              
	sta $4A                  
	jsr UnknownSub17                
	inx                      
	cpx #$08                 
	bne :-
	rts                       
.endproc
;
; $92D4
DATA_BLOCK_92D4:
.byte $66, $68, $6A, $6E, $70, $72, $74, $76
;
; $92DC
.proc UnknownSub15
	txa                      
	pha                      
	tya                      
	pha                      
	lda #$05                 
	sta $0333                
	lda $0531                
	sta $05FB                
	lda $0532                
	sta $05FC                
	lda $0533                
	sta $05FD                
	lda $0534                
	sta $05FE                
	lda $0535                
	sta $05FF                
	lda #$00                 
	sta $0533                
	sta $0534                
	sta $0535                
	lda #$2D                 
	sta $34                  
	lda #$93                 
	sta $35                  
	lda bankIndex_15         
	sec                       
	sbc  #$01                 
	asl A                    
	tay                      
	lda ($34),y              
	sta $0531                
	iny                      
	lda ($34),y              
	sta $0532                
	pla                      
	tay                      
	pla                      
	tax                      
	rts                       
.endproc
; $932D
.incbin "rom-prg/objects/data-block-at932D.bin"
;
; $9362
.proc LivesHUD
	ldx livesCounter_11      
	cpx #$0A                 
	bcc :+
	ldx #$0A                 

	:
	txa                      
	asl A                    
	tax                      
	ldy #$06                 
	lda LivesGraphicData,X              
	sta someObjProperty_0501,y              
	lda LivesGraphicData+1,X              
	sta someObjProperty_0502,y              
	rts                       
.endproc
;
; $937C
LivesGraphicData:
.incbin "rom-prg/objects/data-block-at937C.bin"
;
.segment "CODEBLOCK"
; $93C9
.proc ClearPages_03_to_07_From_00
	lda #$00
	TAY
	:
		sta someObjProperty_0300,y
		sta someObjProperty_0400,y
		sta someObjProperty_0500,y
		sta someObjProperty_0600,y
		sta someObjProperty_0700,y
		INY
		cpy #$DF
		bne :-
	rts 
.endproc
;
; $93E1
.proc Clear54Bytes_Page04
	pha                      
	txa                      
	pha                      
	tya                      
	pha                      
	ldy #$36                 
	lda #$00                 
	:
		sta someObjProperty_0400,y              
		iny                      
		bne :-
	pla                      
	tay                      
	pla                      
	tax                      
	pla                      
	rts                       
.endproc
;
; $93F6
.proc MaybeStartGame
	jsr PaletteFading        
	lda #$02                 
	jsr HandleAliveTimer                
	lda bankIndex_15         
	cmp  #$04	;; Check if the last stage was completed
	bne :+
		jmp EndGame
	:                
	lda OAM_0200             
	pha                      
	jsr ClearMemoryPage0200_OAM
	pla                      
	sta OAM_0200             
	ldy #$01
	:                 
		lda $8008,y              
		sta OAM_0200,y           
		iny                      
		cpy #$04                 
		bne :-
	lda hitPoints_0603       
	pha                      
	jsr ClearPages_03_to_07_From_00  
	pla                      
	sta hitPoints_0603       
	jmp MaybeStartingNewGame                
.endproc
;
; $942D
.proc SetupAfterReset
	lda #$00
	sta PpuControl_2000
	sta PpuMask_2001
	sei
	cld
	jsr ClearMemoryPage0200_OAM
	lda #$00
	jsr ClearNametablePattern
	lda #$01
	jsr ClearNametablePattern
	doClearZeroPage:
	lda #$00
	TAY
	loopClearZeroPage:
		sta $0000,y
		INY
		bne loopClearZeroPage
	jsr ClearPages_03_to_07_From_00
	lda #$57
	sta updateDuringVBlank_0E
	lda #$75
	sta updateDuringVBlank_0F
	rts 
.endproc
;
; $9459
.proc ClearMemoryPage0200_OAM
	lda #$00
	ldy #$00
	:
	sta OAM_0200,y	
	INY	
	bne :-
	rts 	
.endproc
;
; $9464
.proc ClearNametablePattern
	asl A
	asl A
	clc	
	adc #$20
	sta PpuAddr_2006
	lda #$00
	sta PpuAddr_2006

	ldx #$20
	loopXClearNametable:
		ldy #$1E
		loopYClearNameTable:
			sta PpuData_2007
			dey
			bne loopYClearNameTable
		DEX
		bne loopXClearNametable

	lda #$FF
	ldx #$40
	:
		sta PpuData_2007
		DEX
		bne :-
	rts 
.endproc
;
; $9489
; LoadPaletteIntoPPU(A,y)
; Loads 16 colors from addressPtr_32, offset Y
; 	A : 	$00 Background
;   		$10 Sprites
;   Y : 	offset from addressPtr_32
.proc LoadPaletteIntoPPU
	ldx #$3F                 
	stx PpuAddr_2006         
	sta PpuAddr_2006         
	ldx #$10                 
	:
		lda (addressPtr_32),y              
		sta PpuData_2007         
		iny                      
		dex                      
		bne :-
	rts                       
.endproc
;
; $949D
; LoadPaletteIntoRAM(A,y)
;
.proc LoadPaletteIntoRAM
	tax                      
	clc                      
	adc #$10                 
	sta temp_4D                  
	:
		lda (addressPtr_32),y              
		sta bgPalette_E0,X 
		iny                      
		inx                      
		cpx temp_4D                  
		bne :-
	rts                       
.endproc
;
; $94AE
; LoadNametable(A)
.proc LoadNametable
	asl A                    
	asl A                    
	clc                      
	adc #$20                 
	sta PpuAddr_2006         
	lda #$00                 
	sta PpuAddr_2006         
	tay                      
	tax                      
ReadData:
	lda (addressPtr_32),y              
	beq doneLoading                
	cmp  #$80                 
	bcc DistinctTiles                
RepeatedTitles:
	lda #%01111111                 
	and (addressPtr_32),y              
	tax                      
	jsr NextBGByte_Y                
	lda (addressPtr_32),y              
	:
		sta PpuData_2007         
		dex                      
		bne :-
	jsr NextBGByte_Y                
	jmp :++                
	
	DistinctTiles:
	lda (addressPtr_32),y              
	tax                      
	:
		jsr NextBGByte_Y                
		lda (addressPtr_32),y              
		sta PpuData_2007         
		dex                      
		bne :-
	jsr NextBGByte_Y                
	:
	jmp ReadData

	doneLoading:
	rts                       
.endproc
;
; $94F0
.proc NextBGByte_Y
	iny                      
	bne :+
		inc addressPtr_32+1                  
	:
	rts                       
.endproc
;
; $94F6
; LoadStage(A,X)
; A : Name
.proc LoadStage
	jsr WaitVBlank           
	ldy #$00                 
	sty PpuMask_2001         
	sty PpuControl_2000      
	asl A                    
	tay                      
	txa                      
	pha                      
	lda BackgroundStart+0,y
	sta addressPtr_32+0
	lda BackgroundStart+1,y              
	sta addressPtr_32+1                  
	lda #$00                 
	ldy #$03                 
	jsr LoadPaletteIntoPPU
	lda #$00                 
	ldy #$03                 
	jsr LoadPaletteIntoRAM                
	ldy #$02                 
	lda (addressPtr_32),y              
	tay                      
	lda #$10                 
	jsr LoadPaletteIntoPPU                
	ldy #$02                 
	lda (addressPtr_32),y              
	tay                      
	lda #$10                 
	jsr LoadPaletteIntoRAM                
	ldy #$00                 
	lda (addressPtr_32),y              
	pha                      
	iny                      
	lda (addressPtr_32),y              
	sta addressPtr_32+1
	pla                      
	sta addressPtr_32+0
	pla                      
	jsr LoadNametable                
	lda #$00                 
	sta PpuAddr_2006         
	sta PpuAddr_2006         
	rts                       
.endproc
;
; $954B
.proc UpdatePPUSettings
	jsr WaitVBlank           
	lda flagPPUMask_18      
	sta PpuMask_2001         
	lda flagPPUControl_19   
	sta PpuControl_2000      
	rts                       
.endproc
;
; $9559
.proc WaitVBlank
	pha                      
	jsr CheckForVBlank       
	doCheckPPUStatus:        
		lda PpuStatus_2002       
		bpl doCheckPPUStatus     
	pla                      
	rts                       
.endproc
;
; $9564
.proc CheckForVBlank
	lda PpuStatus_2002       
	bmi CheckForVBlank       
	rts                       
.endproc
;
; $956A
; HandleAliveTimer(A)
.proc HandleAliveTimer
	:
		pha                      
		lda #$00                 
		sta aliveTimer_14  
		:      
			lda aliveTimer_14        
			cmp  #$01                 
			bne :-
		pla                      
		sec                       
		sbc  #$01                 
	bne :--
	rts                       
.endproc
; 
; $957C
.proc RenderingOFF
	jsr WaitVBlank           
	lda #$00                 
	sta PpuMask_2001         
	rts                       
.endproc
;
; $9585
; Turn PPU Randering ON
; Configure PPU
; flagPPUMask_18
; flagPPUControl_17
.proc RenderON
	lda #$00                 
	sta PpuControl_2000      
	jsr WaitVBlank           
	lda flagPPUMask_18                  
	sta PpuMask_2001         
	lda flagPPUControl_17
	sta PpuControl_2000      
	rts                       
.endproc
;
; $9598
.proc ReadControl_A
	ldx #$01                 
	stx Ctrl1_4016           
	ldx #$00                 
	stx Ctrl1_4016           
	tax                      

	ldy #$08                 
	:       
		jsr StrobeControl_X      
		dey                      
		bne :-
	rts                       
.endproc
;
; $95AC
.proc StrobeControl_X
	asl input1_20            
	lda Ctrl1_4016,X         
	lsr  A                    
	bcs RegisterInput      
	lsr  A                    
	bcs RegisterInput      
	rts                       
.endproc
;
; $95B8
.proc RegisterInput
	inc input1_20            
	rts                       
.endproc
;
; $95BB
.proc PaletteFading
	ldy #$05                 

loopDarkenBGFiveSteps:
	onceEveryThreeFrames:
		lda frameCounter_12
		and #$03                 
		bne onceEveryThreeFrames
	jsr WaitVBlank           
	ldx #$00                 
	lda #$3F                 
	sta PpuAddr_2006         
	stx PpuAddr_2006         
	:      
		lda bgPalette_E0,X       
		sta PpuData_2007         
		inx                      
		cpx #$20                 
		bne :-
	lda flagPPUControl_19   
	sta PpuControl_2000      
	lda screenScrollX_29     
	sta PpuScroll_2005       
	lda #$00                 
	sta PpuScroll_2005       
	ldx #$00                 
	loopDarkenONETone:       
		lda bgPalette_E0,X       
		sec                       
		sbc  #$10                 
		bcs paletteDidNotUnderflow
		lda #$0F                 
		
		paletteDidNotUnderflow:  
		sta bgPalette_E0,X       
		inx                      
		cpx #$20                 
		bne loopDarkenONETone    
	dey                      
	bne loopDarkenBGFiveSteps
	rts                       
.endproc
;
; $95FF
.proc EndGame
	jsr RenderingOFF
	jsr ClearMemoryPage0200_OAM
	lda #$00                 
	sta PpuControl_2000      
	sta screenScrollX_29     
	sta $2A                  
	jsr ClearNametablePattern
	lda #$01                 
	jsr ClearNametablePattern
	lda #$00                 
	tax                      
	sta BankSwitching_FFF0+0,X
	inc bankIndex_15         
	lda #$0A                 
	ldx #$00                 
	jsr LoadStage            
	lda #$88                 
	ora #$18                 
	sta flagPPUControl_17   
	sta flagPPUControl_19   
	jsr RenderON             
	lda #$0B                 
	sta soundAddress_8D      
	
	nop  ;
	nop  ;
	nop  ;jsr InitializeSound      

	loopPressANYButton:
		lda input1_20            
		beq loopPressANYButton   
	
	sta inputPrev_22         
	:
		lda input1_20            
		cmp  inputPrev_22         
		beq :-
	nop  ;
	nop  ;
	nop  ; jsr Sound_DontKnowWhatItDoes
	lda #$00                 
	sta screenScrollX_29     
	sta $2A                  
	jsr PaletteFading        
	jsr RenderingOFF
	jsr ClearMemoryPage0200_OAM
	lda #$02                 
	jsr HandleAliveTimer     
	lda #$00                 
	sta PpuControl_2000      
	sta screenScrollX_29     
	sta $2A                  
	jsr ClearNametablePattern
	lda #$01                 
	jsr ClearNametablePattern
	lda #$02                 
	tax                      
	sta BankSwitching_FFF0+0,X
	lda flagPPUControl_17   
	and #$EF                 
	sta flagPPUControl_17   
	sta flagPPUControl_19   
	lda #$0B                 
	ldx #$00                 
	jsr LoadStage            
	jsr RenderON             
	lda #$00                 
	jsr RollEndCredits       
	lda #$01                 
	jsr RollEndCredits       
	lda #$02                 
	jsr RollEndCredits       
	lda #$03                 
	jsr RollEndCredits       
	lda #$04                 
	jsr RollEndCredits       
	lda #$05                 
	jsr RollEndCredits       
	lda #$00                 
	sta PpuScroll_2005       
	sta PpuScroll_2005       
	:    
	jmp :- ; End of Credits, Must Reset 
.endproc
;
; $96AC
.proc RollEndCredits
	asl A                    
	tay                      
	lda EndCreditsData,y              
	sta addressPtr_32    
	lda EndCreditsData+1,y              
	sta $33                  
	ldy #$00                 
	lda (addressPtr_32),y
	sta $67                  
	iny                      
	lda (addressPtr_32),y
	sta $68                  
	iny                      
	loopLoadCredits:         
		lda $67                  
		sta PpuAddr_2006         
		lda $68                  
		sta PpuAddr_2006         
		lda (addressPtr_32),y
		cmp  #$FF                 
		beq leaveEndCredits      
		cmp  #$20                 
		bne :+
		lda #$00                 
		sta PpuData_2007         
		lda #$00                 
		sta PpuScroll_2005       
		sta PpuScroll_2005       
		beq :++                
		:
		sec                       
		sbc  #$36                 
		sta PpuData_2007         
		lda #$00                 
		sta PpuScroll_2005       
		sta PpuScroll_2005       
		lda #$0A                 
		sta soundAddress_8D      
		nop  ;
		nop  ;
		nop  ;jsr PlaySFX              
		:
		lda $68                  
		clc                      
		adc #$01                 
		sta $68                  
		lda $67                  
		adc #$00                 
		sta $67                  
		doWait_07_Blanks:        
		ldx #$07                 
		:     
			jsr WaitVBlank           
			dex                      
			bne :-
		iny                      
		bne loopLoadCredits      
	nop  ;
	nop  ;
	nop  ;jsr DoSomethingWithSound 
	leaveEndCredits:         
	rts                       
.endproc
;
; $9718
EndCreditsData:
.incbin "rom-prg/stages/EndCredits.bin"
;
; $97AD
.proc UnknownSub5
	lda #$00                 
	sta bankIndex_15         
	sta PpuControl_2000      
	jsr WaitVBlank           
	lda flagPPUMask_18      
	and #$EF                 
	sta PpuMask_2001         
	lda flagPPUControl_19   
	sta flagPPUControl_17   
	jsr WaitVBlank           
	jsr ClearMemoryPage0200_OAM
	ldy #$00                 
	:
		lda StillUnkownData,y              
		sta OAM_0200,y           
		iny                      
		cpy #$20                 
		bne :-
	jsr UpdatePPUSettings
	lda #$02                 
	jsr HandleAliveTimer     
	lda #$00                 
	sta frameCounter64_13    
	:
	lda input1_20            
	bne WaitforButtonPress                
	lda frameCounter64_13    
	cmp  #$0A                 
	bne :-
	rts                       
.endproc
;
; $97EC
.proc WaitforButtonPress
	sta inputPrev_22         
	:
		lda input1_20            
		cmp  inputPrev_22         
		beq :-
	rts                       
.endproc
;
; $97F5 32 bytes of data
StillUnkownData:
.incbin "rom-prg/objects/data-block-at97F5.bin"
;
; =====================================================
;
; $9815
.segment "SOUNDENGINE"
;.include "sound-engine.asm"


; $9D22 data
;.incbin "rom-prg/sounds/sound-data-at9D32.bin"

;
; $A3AC
.segment "CODEBLOCK2"
.proc HandleVBlank
	pha                      
	txa                      
	pha                      
	tya                      
	pha                      
	lda updateDuringVBlank_0E
	cmp #$57                 
	beq doKeepUpdatingAtVBlank_from0E
	jmp doUpdateSoundOnly    

	doKeepUpdatingAtVBlank_from0E:
	lda updateDuringVBlank_0F
	cmp  #$75                 
	beq doKeepUpdatingAtVBlank_from0F
	jmp doUpdateSoundOnly    

	doKeepUpdatingAtVBlank_from0F:
	lda #$00                 
	sta OamAddr_2003         
	lda #$02                 
	sta SpriteDma_4014       
	lda PpuStatus_2002       
	inc frameCounter_12      
	lda frameCounter_12      
	and #$3F                 
	bne dontINCTimer         
	inc aliveTimer_14        
	inc frameCounter64_13    

	dontINCTimer:            
	lda flagNextLevel_1B     
	bne doLevelTransition    
	ldy bankIndex_15         
	bne dontLevelTransition  

	doLevelTransition:       
	jsr ReadControl_1        
	jmp doUpdateSoundOnly    

	dontLevelTransition:     
	lda flagPause_1C         

	gameIsPaused:            
	beq gameNotPaused        
	jsr HandleControllerInputs

	jmp doUpdateSoundOnly    

	gameNotPaused:           
	jsr HandleScrolling      
	lda screenScrollX_29     
	sta PpuScroll_2005       
	lda #$00                 
	sta PpuScroll_2005       
	lda flagPPUControl_19   
	sta PpuControl_2000      
	lda frameCounter_12      
	and #$01                 
	bne :+                
	dec $5C                  
	
	:
	lda $5E                  
	beq :+                
	jsr HandleControllerInputs
	jsr HandleObjects
	
	:
	jsr PowerUpCheat

	doUpdateSoundOnly:       
	nop  ;
	nop  ;
	nop  ; jsr UpdateSoundAtVBlank  

	pla                      
	tay                      
	pla                      
	tax                      
	pla                      
	RTI                      
.endproc
;
; $A424
.proc ReadControl_1
	lda #$00                 
	jsr ReadControl_A        
	rts                       
.endproc
;
; $A42A
.proc HandleScrolling
	ldx flagGameMode_26      
	bne doneWithScrollHandling
	inc frameCounterToScroll_28
	lda frameCounterToScroll_28
	cmp  frameToScroll_27     
	bcc doneWithScrollHandling
	
	doScrollBackground:      
	lda #$00                 
	sta frameCounterToScroll_28
	jsr HandleStageScrolling 
	
	doneWithScrollHandling:  
	rts                       
.endproc
;
; $A43E
.proc HandleStageScrolling
	inc screenScrollX_29     
	lda screenScrollX_29     
	bne doneWithScrolling    
	ldx levelProgression_16  
	
	testIfScrolled_14_Screens:
	cpx #$0E                 
	bcc doKeepScrollingStage 
	lda #$02                 
	sta flagGameMode_26      
	
	doKeepScrollingStage:    
	clc                      
	inc levelProgression_16  
	lda flagPPUControl_19   
	EOR #$01                 
	sta flagPPUControl_19   
	
	doneWithScrolling:       
	rts                       
.endproc
;
; $A458
.proc UnknownSub10
	
	:
	jsr UnknownSub11
	BIT $0100                
	dex                      
	bne :-                
	rts                       
.endproc
;
; $A462
.proc UnknownSub11
	txa                      
	pha                      
	ldx #$00                 
	:
	inx                      
	cpx #$0F                 
	bne :-
	pla                      
	tax                      
	tax                      
	rts                       
.endproc
;
; $A46F
.proc HandleObjects
	lda #$04                 
	sta oamAddressPtr_3E                  
	lda $5F                  
	sta $3D                  
	
	BeginHere:
	ldx $5F                  
	lda someObjProperty_0404,X              
	bmi :+
	jmp SecondPart                
	
	:
	ldy someObjProperty_0504,X              
	beq :+
	dec someObjProperty_0504,X              
	dec someObjProperty_0503,X              
	jmp ReplaceMeLabel_2                
	
	:
	lda someObjProperty_0501,X              
	sta $36                  
	lda someObjProperty_0502,X              
	sta $37                  
	ldy someObjProperty_0503,X              
	
	ReplaceMeLabel_7:
	lda ($36),y              
	bmi :+
	jmp ReplaceMeLabel_3                
	
	:
	asl A                    
	bmi ReplaceMeLabel_1                
	lsr  A                    
	sbc  #$00                 
	sta someObjProperty_0504,X              
	
	ReplaceMeLabel_2:
	lda someObjProperty_0405,X              
	bpl ReplaceMeLabel_4                
	lda $0C                  
	bpl :+
	lda #$FF                 
	bne :++
	
	:
	lda #$00                 
	
	:
	sta $47                  
	lda $0C                  
	clc                      
	adc someObjProperty_0400,X              
	sta someObjProperty_0400,X              
	sta $40                  
	lda $47                  
	adc someObjProperty_0401,X              
	sta someObjProperty_0401,X              
	sta $41                  
	lda $0D                  
	bpl :+
	lda #$FF                 
	bne :++
	
	:
	lda #$00                 
	
	:
	sta $49                  
	lda $0D                  
	clc                      
	adc someObjProperty_0402,X              
	sta someObjProperty_0402,X              
	sta spriteY_42                  
	lda $49                  
	adc someObjProperty_0403,X              
	sta someObjProperty_0403,X              
	sta $43                  
	jmp ReplaceMeLabel_5
	
	ReplaceMeLabel_4:
	lda someObjProperty_0400,X              
	sta $40                  
	lda someObjProperty_0401,X              
	sta $41                  
	lda someObjProperty_0402,X              
	sta spriteY_42                  
	lda someObjProperty_0403,X              
	sta $43                  
	
	ReplaceMeLabel_5:
	inc someObjProperty_0503,X              
	lda $0701,X              
	tax                      
	lda Data_atA895+0,X              
	sta addressPtr_32    
	lda Data_atA895+1,X              
	sta $33                  
	ldx $5F                  
	jmp ReplaceMeLabel_6
	
	ReplaceMeLabel_1:
	asl A                    
	bmi loopTest
	dec someObjProperty_0505,X              
	lda someObjProperty_0505,X              
	bne :+
	iny                      
	iny                      
	jmp ReplaceMeLabel_7                
	
	:
	bpl loop          
	lda ($36),y              
	and #$1F                 
	sta someObjProperty_0505,X              
	
	loop:
		iny                      
		lda ($36),y              
		tay                      
		lda ($36),y              
		jmp ReplaceMeLabel_3                
		
		loopTest:
		cmp  #$F8                 
		beq loop
		asl A                    
		bmi :+
	
	lsr  A                    
	lsr  A                    
	lsr  A                    
	and #$0F                 
	lda someObjProperty_0404,X              
	ora #$08                 
	sta someObjProperty_0404,X              
	jmp SecondPart                
	
	:
	lda someObjProperty_0303,X              
	cmp  #$03                 
	bne :+                
	beq :++
	
	:
	cmp  #$04                 
	bne :++
	lda #$01                 
	sta flagNextLevel_1B     
	
	:
	lda #$00                 
	sta someObjProperty_0302,X              
	sta someObjProperty_0303,X              
	
	:
	cmp  #$05                 
	bne :+ 
	jsr Copy_5BytesPage05_FromEnd_ToBeginning                
	jmp :++
	
	:
	lda #$10                 
	sta someObjProperty_0404,X              
	
	:
	jmp SecondPart                
	
	ReplaceMeLabel_3:
	asl A                    
	sta $0701,X              
	tax                      
	lda Data_atA895+0,X              
	sta addressPtr_32    
	lda Data_atA895+1,X              
	sta $33                  
	iny                      
	ldx $5F                  
	lda someObjProperty_0405,X              
	bpl :+
	lda ($36),y              
	clc                      
	adc $0C                  
	jmp :++
	
	:
	lda ($36),y              
	
	:
	sta spriteX_46                  
	bpl :+
	lda #$FF                 
	bne :++
	
	:
	lda #$00                 
	
	:
	sta $47                  
	lda spriteX_46                  
	clc                      
	adc someObjProperty_0400,X              
	sta someObjProperty_0400,X              
	sta $40                  
	lda $47                  
	adc someObjProperty_0401,X              
	sta someObjProperty_0401,X              
	sta $41                  
	iny                      
	lda someObjProperty_0405,X              
	bpl :+
	lda ($36),y              
	clc                      
	adc $0D                  
	jmp :++
	
	:
	lda ($36),y              
	
	:
	sta $48                  
	bpl :+
	lda #$FF                 
	bne :++
	
	:
	lda #$00                 
	
	:
	sta $49                  
	lda $48                  
	clc                      
	adc someObjProperty_0402,X              
	sta someObjProperty_0402,X              
	sta spriteY_42                  
	lda $49                  
	adc someObjProperty_0403,X              
	sta someObjProperty_0403,X              
	sta $43                  
	iny                      
	tya                      
	sta someObjProperty_0503,X              
	
	ReplaceMeLabel_6:
	lda someObjProperty_0404,X              
	and #$20                 
	bne :+
	jmp SecondPart                
	
	:
	lda someObjProperty_0405,X              
	and #$18                 
	beq :+
	lda frameCounter_12      
	and #$03                 
	bne :+
	dec someObjProperty_0300,X              
	lda someObjProperty_0300,X              
	bne :+
	lda someObjProperty_0404,X              
	ora #$08                 
	sta someObjProperty_0404,X              
	
	:
	ldy #$00                 
	lda (addressPtr_32),y
	bpl :+
	jmp ReplaceMeLabel_8
	
	:
	sta someObjProperty_0600,X              
	lsr  A                    
	lsr  A                    
	lsr  A                    
	clc                      
	adc #$01                 
	sta $44                  
	iny                      
	lda (addressPtr_32),y
	sta someObjProperty_0601,X              
	lsr  A                    
	lsr  A                    
	lsr  A                    
	clc                      
	adc #$01                 
	sta $45                  
	iny                      
	ldx oamAddressPtr_3E                  
	
	ReplaceMeLabel_11:
	lda $44                  
	sta $3C                  
	lda $40                  
	sta spriteX_46                  
	lda $41                  
	sta $47                  
	
	ReplaceMeLabel_10:
	lda (addressPtr_32),y
	beq :+
	lda $47                  
	bne :++
	lda $43                  
	bne :++
	lda (addressPtr_32),y ; XXX
	sta OAM_0200+1,X	; tile #
	lda spriteY_42				
	sta OAM_0200+0,X    ; y - 1       
	iny                      
	lda (addressPtr_32),y
	sta OAM_0200+2,X	; attributes
	lda spriteX_46                  
	sta OAM_0200+3,X	; x
	txa                      
	clc                      
	adc #$04                 
	beq ReplaceMeLabel_9                
	tax                      
	
	:
	iny                      
	dec $3C                  
	beq :++
	lda spriteX_46                  
	adc #$08                 
	sta spriteX_46                  
	bcc ReplaceMeLabel_10
	inc $47                  
	jmp ReplaceMeLabel_10
	
	:
	iny                      
	jmp :--
	
	:
	dec $45                  
	beq :+
	lda spriteY_42                  
	clc                      
	adc #$08                 
	sta spriteY_42                  
	bcc ReplaceMeLabel_11
	inc $43                  
	jmp ReplaceMeLabel_11
	
	:
	stx oamAddressPtr_3E                  
	
	SecondPart:
	lda $5F                  
	clc                      
	adc var_59               
	cmp  #$F0                 
	bcc :++
	beq :+
	lda #$EA                 
	bne :++
	
	:
	lda #$00                 
	
	:
	sta $5F                  
	cmp  $3D                  
	beq ReplaceMeLabel_12
	jmp BeginHere
	
	ReplaceMeLabel_8:
	ldx oamAddressPtr_3E                  
	lda $41                  
	bne SecondPart                
	lda $43                  
	bne SecondPart                
	lda spriteY_42                  
	sta OAM_0200,X           
	iny                      
	lda (addressPtr_32),y
	sta $0201,X              
	iny                      
	lda (addressPtr_32),y
	sta $0202,X              
	lda $40                  
	sta $0203,X              
	txa                      
	clc                      
	adc #$04                 
	beq ReplaceMeLabel_9                
	sta oamAddressPtr_3E                  
	jmp SecondPart                
	
	ReplaceMeLabel_12:
	ldx oamAddressPtr_3E                  
	cpx #$00                 
	beq ReplaceMeLabel_9                
	lda #$00                 
	
	:
	sta OAM_0200,X           
	inx                      
	bne :-
	
	ReplaceMeLabel_9:
	lda $5F                  
	cmp  $3D                  
	bne :+
	lda #$00                 
	sta $5F                  
	sec                       
	sbc var_59               
	sta var_59               

	:
	rts                       
.endproc
;
; $A709
.proc Copy_5BytesPage05_FromEnd_ToBeginning
	lda $05FB                
	sta $0531                
	lda $05FC                
	sta $0532                
	lda $05FD                
	sta $0533                
	lda $05FE                
	sta $0534                
	lda $05FF                
	sta $0535                
	rts                       
.endproc
;
; $A728
.proc PowerUpCheat
	lda input1_20            
	cmp  #$60                 
	bne :+
	cmp  flagUnknown_1F                  
	beq :+
	inc powerUp_P_64         
	lda powerUp_P_64         
	cmp  #$05                 
	bcc :+
	lda #$00                 
	sta powerUp_P_64         
	
	:
	lda input1_20            
	sta flagUnknown_1F                  
	rts                       
.endproc
;
; $A743
.proc HandleControllerInputs
	lda #$00                 
	jsr ReadControl_A        
	lda flagPause_1C         
	bne doGameIsPaused       
	lda someObjProperty_0401                
	bne doGameIsPaused       
	lda aliveTimer_14        
	cmp  #$02                 
	bcc HandlePlayerActions  
	lda #$50                 
	sta someObjProperty_0405                
	bne HandlePlayerActions  
	
	doGameIsPaused:          
	jsr CheckForPause        
	lda input1_20            
	sta inputPrev_22         
	rts                       
.endproc
;
; $A766
.proc HandlePlayerActions

	lda input1_20            
	
checkInputRight:         
	BIT BUTTON_RIGHT
	beq checkInputLeft       

	lda someObjProperty_0400                
	cmp  #$DC                 
	bcs checkInputDown       
	adc speed_66             
	bcc :+
	
checkInputLeft:          
	BIT BUTTON_LEFT
	beq checkInputDown       
	lda someObjProperty_0400                
	cmp  #$12                 
	bcc checkInputDown       
	sbc  speed_66             

	:
	sta someObjProperty_0400                
	
	checkInputDown:          
	lda input1_20            
	BIT BUTTON_DOWN                
	beq checkInputUp         
	lda someObjProperty_0402                
	cmp  #$B8                 
	bcs checkInputA          
	adc speed_66             
	bcc :+                
	
	checkInputUp:            
	BIT BUTTON_UP
	beq checkInputA          
	lda someObjProperty_0402                
	cmp  #$14                 
	bcc checkInputA          
	sbc  speed_66             
	:
	sta someObjProperty_0402                
	
	checkInputA:             
	lda input1_20            
	BIT BUTTON_A
	beq OnlyCheckForPause                
	lda inputPrev_22         
	BIT BUTTON_A
	bne OnlyCheckForPause                
	lda #$02                 
	jsr UnknownSub6
	sta $62                  
	lda hitPoints_0603       
	cmp  #$14                 
	bcc :+
	lda #$0A                 
	sta someObjProperty_0501                
	lda #$A8                 
	sta someObjProperty_0502                
	lda #$00                 
	sta someObjProperty_0503                
	beq OnlyCheckForPause
	:                
	lda #$F0                 
	sta someObjProperty_0501                
	lda #$A7                 
	sta someObjProperty_0502                
	lda #$00                 
	sta someObjProperty_0503                
	
	OnlyCheckForPause:
	jsr CheckForPause        
	lda input1_20            
	sta inputPrev_22         
	rts                       
.endproc
;
; $A7F0
.incbin "rom-prg/objects/data-block-atA7F0.bin"
;
; $A83C
.proc UnknownSub6
	pha                      
	lda someObjProperty_0404                
	BIT BIT_5                
	beq :+                
	pla                      
	rts                       
	:
	pla                      
	lda #$00                 
	rts                       
.endproc
;
; $A84B
.proc CheckForPause
	lda input1_20            

	checkInputPressStart:    
	BIT BUTTON_START
	beq dontPause            
	lda inputPrev_22         
	BIT BUTTON_START
	bne dontPause            
	lda flagPause_1C         
	EOR #$01                 
	sta flagPause_1C         
	beq :+                
	
	nop  ;
	nop  ;
	nop  ;	jsr Sound_DontKnowWhatItDoes

	lda #$08                 
	sta soundAddress_8D      
	
	nop  ;
	nop  ;
	nop  ;jsr PlaySFX              

	jmp dontPause            
	:

	nop  ;
	nop  ;
	nop  ; jsr DoSomethingWithSound 

	lda flagUnknown_1A                  
	beq :+
	lda #$02                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr InitializeSound      
	rts                       

	:
	lda #$01                 
	sta soundAddress_8D      
	nop  ;
	nop  ;
	nop  ; jsr InitializeSound      
	
	dontPause:               
	rts                       
.endproc
;
; $A885
.segment "OBJECTS"

ObjectStart:
.include "objects.asm"


; $E847
.segment "BACKGROUND"

BackgroundStart:
.include "backgrounds.asm"


.segment "DATA3"
.byte $00, $01, $02, $03

.segment "VECTORS"
	.word HandleVBlank
	.word HandleReset
	.word HandleReset ; for some reason, the irq vector also points to the reset

.segment "CHARS0"
.incbin "rom-chr/bank0.chr"

.segment "CHARS1"
.incbin "rom-chr/bank1.chr"

.segment "CHARS2"
.incbin "rom-chr/bank2.chr"

.segment "CHARS3"
.incbin "rom-chr/bank3.chr"