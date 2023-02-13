; Configurarion
.define STARTING_LIVES	$16
.define STARTING_POWER	$04

; Constants
.define HEART_HUD_Y		$D8
.define HEART_OFFSCREEN $F8

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
.define BankSwitching_FFF0 	$FFF0
.define UpdateDuringVBlank_Flag2	$75

.define VRAM_PALETTES_PAGE $3F

.segment "HEADER"
.include "inesheader.inc"

.segment "ZEROPAGE" ; LSB 0 - FF

; $00
; $01
; $02
; $03
; $04
; $05
; $06
; $07
; $08
; $09
; $0A
; $0B
.define var_0C				$0C ; 4
.define var_0D				$0D ; 3
.define updateDuringVBlank_0E	$0E ; 3
.define updateDuringVBlank_0F	$0F ; 3

; $10
.define livesCounter_11		$11 ; 5
.define frameCounter_12		$12 ; 8
.define frameCounter64_13	$13 ; 4
.define aliveTimer_14		$14 ; 6
.define bankIndex_15		$15 ; 14
.define levelProgression_16	$16 ; 3
.define flagPPUControl_17	$17 ; 8
.define flagPPUMask_18		$18 ; 6
.define flagPPUControl_19	$19 ; 10
.define flagUnknown_1A		$1A ; 5
.define flagNextLevel_1B	$1B ; 6
.define flagPause_1C		$1C ; 4
; $1D
.define flagPlayerHit_1E	$1E ; 3
.define flagUnknown_1F		$1F ; 2

.define input1_20			$20 ; 17
; $21
.define inputPrev_22		$22 ; 11
; $23
; $24
; $25
.define flagGameMode_26		$26 ; 4
.define frameScrollAt_27	$27 ; 2
.define frameScrollCtr_28	$28 ; 3
.define screenScrollX_29	$29 ; 7
.define var_2A				$2A	; 3
.define var_2B				$2B	; 4
.define var_2C				$2C	; 4
.define var_2D				$2D	; 4
.define var_2E				$2E	; 4
; $2F

; $30
; $31
.define addressPtr_32		$32 ; 32 (word address)
; $33 low byte of $32
.define objectPtr_34		$34 ; 14 (word address); object address in rom
; $35 low byte of $34
.define objectPtr_36		$36 ; 10 (word address)
; $37 low byte of $37
.define objectPtr_38		$38 ; 14 (word address)
; $39 low byte of $38
.define objectPtr_3A		$3A ; 13 (word address)
; $3B low byte of $3A
.define var_3C				$3C ; 2
.define var_3D				$3D	; 3
.define oamAddressPtr_3E	$3E ; 6 (word address)
; $3F low byte of $3E

.define var_40				$40	; 5
.define var_41				$41 ; 5
.define objects_Y_42		$42	; 7 ; used for Lives HUD and enemy shots
.define var_43				$43 ; 6
.define var_44				$44 ; 2
.define var_45				$45 ; 2
.define objects_X_46		$46 ; 6 ; used for Lives HUD and enemy shots
.define var_47				$47	; 7
.define var_48				$48 ; 2
.define var_49				$49 ; 4
.define var_4A				$4A ; 7
.define var_4B				$4B ; 5
.define var_4C				$4C ; 6
.define var_4D				$4D ; 6
.define var_4E				$4E ; 3
.define var_4F				$4F ; 2

.define var_50				$50 ; 4
.define var_51				$51 ; 4
.define var_52				$52 ; 4
; $53
.define var_54				$54 ; 6 ; object loading property
.define var_55				$55 ; 5 ; object loading property
.define var_56				$56 ; 5 ; object loading property
.define var_57				$57 ; 5 ; object loading property
.define var_58				$58 ; 5
.define var_59				$59 ; 5 ; flag that is either #$06 or #$FA (250)
.define var_5A				$5A ; 3
.define var_5B				$5B ; 3
.define var_5C				$5C ; 5
; $5D
.define var_5E				$5E ; 2
.define var_5F				$5F ; 9

.define var_60				$60 ; 7
; $61
.define var_62				$62 ; 3
; $63
.define powerUp_P_64		$64 ; 10
; $65
.define speed_66			$66 ; 6
.define vramAddress_67		$67 ; 3
; $68 low byte of $67
; $69

.define soundArray_70		$70
; $71
; $72
; $73
; $74
; $75
; $76
; $77
; $78
; $79
; $7A
; $7B
; $7C
; $7D
; $7E
; $7F

; $80
; $81
; $82
; $83
; $84
; $85
; $86
; $87
; $88
; $89
; $8A
; $8B
; $8C
.define soundAddress_8D		$8D
.define soundAddress_8E		$8E
.define soundAddress_8F		$8F

.define apuStatusFlag_C9	$C9
.define bgPalette_E0		$E0 ; 4



.segment "SPRITES" ; LSB 0 - FF

.segment "RAM" ; LSB 0100 - 07FF

.define someObjProperty_0100 $0100 ; 1 only used once

; page 02 - OAM
.define OBJ_Y 		0
.define OBJ_TILE 	1
.define OBJ_ATT 	2
.define OBJ_X 		3

.define OAM_0200	$0200 ; Y

;.define someObjProperty_0201 	$0201 ; Tile
;.define someObjProperty_0202 	$0202 ; Attribute
;.define someObjProperty_0203 	$0203 ; X

; page 03
.define someObjProperty_0300 $0300 ; #10 of 12-byte file (also $0700)
.define someObjProperty_0301 $0301 ; #7 of 12-byte file
.define someObjProperty_0302 $0302 ; #6 of 12-byte file
.define someObjProperty_0303 $0303

.define someObjProperty_0333 $0333 ; 1 used once!

; page 04
.define someObjProperty_0400 $0400 ; playerX_0400
.define someObjProperty_0401 $0401
.define someObjProperty_0402 $0402 ; playerY_0402
.define someObjProperty_0403 $0403
.define someObjProperty_0404 $0404
.define someObjProperty_0405 $0405 ; #2 of 12-byte file (flags)

; page 05
.define someObjProperty_0500 $0500
.define someObjProperty_0501 $0501 ; low byte of object AI??? address
.define someObjProperty_0502 $0502 ; high byte of object AI??? address
.define someObjProperty_0503 $0503
.define someObjProperty_0504 $0504
.define someObjProperty_0505 $0505

.define someObjProperty_0531 $0531
.define someObjProperty_0532 $0532
.define someObjProperty_0533 $0533
.define someObjProperty_0534 $0534
.define someObjProperty_0535 $0535

.define someObjProperty_05FB $05FB ;$0531
.define someObjProperty_05FC $05FC ;$0532
.define someObjProperty_05FD $05FD ;$0533
.define someObjProperty_05FE $05FE ;$0534
.define someObjProperty_05FF $05FF ;$0535

; page 06
.define someObjProperty_0600 $0600 ; #3 of 12-byte file
.define someObjProperty_0601 $0601 ; #4 of 12-byte file
.define someObjProperty_0602 $0602 ; #1 of 12-byte file
.define hitPoints_0603 		 $0603 ; #5 of 12-byte file
.define someObjProperty_0604 $0604 ; #8 of 12-byte file
.define someObjProperty_0605 $0605 ; #9 of 12-byte file

; page 07
.define someObjProperty_0700 $0700 ; #10 of 12-byte file (also $0300)
.define someObjProperty_0701 $0701
.define someObjProperty_0702 $0702
.define someObjProperty_0703 $0703
.define someObjProperty_0704 $0704
.define someObjProperty_0705 $0705

.define BIT0	%00000001
.define BIT1	%00000010
.define BIT2	%00000100
.define BIT3	%00001000
.define BIT4	%00010000
.define BIT5	%00100000
.define BIT6	%01000000
.define BIT7	%10000000


.segment "STARTUP"


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

; Heart is object zero
.define FIRST_OBJECT_SLOT $04

BankSequenceArray:
.byte $01, $01, $01, $02; 800C - 800F
;
; $8010
; Reset handler, called by reset interrupt
HandleReset:
	lda #$C0
	sta Ctrl2_FrameCtr_4017
	
	ldx #$10 ; Wait 16 cycles for PPU to reach its stable state
	:	
		lda PpuStatus_2002
		DEX
		bne :-

	lda BankSwitching_FFF0	; Loads a $00 from ROM filling (dangerous!)
	sta BankSwitching_FFF0; Set mapper to Bank0
	
	ldx #$00
	jsr SetupAfterReset	

	jsr SetFlag_59
	nop;
	nop;
	nop; jsr ResetSoundEngine

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
	lda #STARTING_POWER
	sta powerUp_P_64
	lda #STARTING_LIVES
	sta livesCounter_11
	lda #$00
	sta soundAddress_8F
	sta PpuScroll_2005
	sta PpuScroll_2005
	jsr RenderON
	lda #$00
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr InitializeSound ; see sound engine

WaitForPressStart:
	lda #$00
	jsr ReadControl_A
	lda input1_20
	
	checkInputStart:
	cmp #BIT4 ; not cmp BUTTON_START for some reason
	beq :+
	jmp WaitForPressStart
	:

	sta inputPrev_22
	:
		lda input1_20
		cmp inputPrev_22
		beq :-

	nop;
	nop;
	nop;jsr Sound_DontKnowWhatItDoes

	lda #$07
	sta soundAddress_8D
	
	nop;
	nop;
	nop; jsr PlaySFX
	
	lda #$00
	sta bankIndex_15
	jmp MaybeStartGame ; Check what this one does

MaybeStartingNewGame:
	jsr RenderingOFF

	nop;
	nop;
	nop; jsr DoSomethingWithSound 

	lda #$00
	sta PpuControl_2000
	jsr ClearNametablePattern
	lda #$01
	jsr ClearNametablePattern
	ldy bankIndex_15
	lda BankSequenceArray,y
	tax
	sta BankSwitching_FFF0+0,x
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
	stx frameScrollAt_27
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
	nop;
	nop;
	nop; jsr InitializeSound
	lda bankIndex_15
	cmp #$02
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
		lda #HEART_OFFSCREEN
		sta OAM_0200

		jsr InitializeGameVariables
		jsr MaybeTriggerNextLevel

	loopMain:
		jsr UnknownSub1
		jsr LoadEnemies
		jsr LivesHUD
		lda var_62
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
		nop;
		nop;
		nop; jsr Sound_DontKnowWhatItDoes
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
		nop;
		nop;
		nop; jsr Sound_DontKnowWhatItDoes
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
; Checks variable var_5C for a value grater than #$FA (250). If not, skip
; Inputs: var_5C, var_5B
.proc LoadEnemies
	lda var_5C
	cmp #$FA
	bcs :+
	jmp leaveThisRountine
	:
	ldy bankIndex_15
	dey
	tya
	asl A
	asl A
	tay
	lda ObjectsData_A885+0,y
	sta objectPtr_34+0
	lda ObjectsData_A885+1,y
	sta objectPtr_34+1
	lda var_5B
	asl A
	tay
	lda (objectPtr_34),y
	cmp #$FF
	bne :++
	iny
	lda (objectPtr_34),y
	cmp #$FF
	bne :+
	jmp leaveThisRountine
	:
	dey
	lda (objectPtr_34),y
	:
	sta objectPtr_3A+0
	iny
	lda (objectPtr_34),y
	sta objectPtr_3A+1
	ldy #$00
	loopY:
		jsr FindFreeObjSlot
		cpx #$F0 ; No slot available to load object
		bcs doneLooping
		lda (objectPtr_3A),y
		cmp #$F8
		bne :+
		lda #$01
		sta flagUnknown_1A
		ldx #$30
		jsr Clear54Bytes_Page04
		nop;
		nop;
		nop; jsr Sound_DontKnowWhatItDoes
		nop;
		nop;
		nop; jsr DoSomethingWithSound 
		lda #$02
		sta soundAddress_8D
		nop;
		nop;
		nop; jsr InitializeSound
		iny
		lda (objectPtr_3A),y
		:
		cmp #$F0
		bne :+
		and #$00
		sta var_2D
		iny
		lda (objectPtr_3A),y
		:
		cmp #$FF
		beq doneLooping
		cmp #$F1
		bne :+
		and #$03
		sta var_2D
		iny
		lda (objectPtr_3A),y
		sta var_2B
		inc var_2B
		iny
		lda (objectPtr_3A),y
		:
		cmp #$F2
		bne :+
		and #$03
		sta var_2D
		iny
		lda (objectPtr_3A),y
		sta var_2C
		inc var_2C
		iny
		lda (objectPtr_3A),y
		:
		sta var_58
		iny
		lda (objectPtr_3A),y
		sta var_54
		iny
		lda (objectPtr_3A),y
		sta var_55
		iny
		lda (objectPtr_3A),y
		sta var_56
		iny
		lda (objectPtr_3A),y
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
	lda ObjectsData_A885+2,y
	sta objectPtr_34+0
	lda ObjectsData_A885+3,y
	sta objectPtr_34+1
	lda var_58
	asl A
	tay
	lda (objectPtr_34),y
	sta objectPtr_38+0
	iny
	lda (objectPtr_34),y
	sta objectPtr_38+1
	ldy #$00
	lda (objectPtr_38),y
	sta someObjProperty_0501,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0502,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0602,x
	iny
	lda (objectPtr_38),y
	ora #(BIT5+BIT6)
	ora var_2D					; hold an extra flag?
	sta someObjProperty_0405,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0600,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0601,x
	iny
	lda (objectPtr_38),y
	sta hitPoints_0603,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0302,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0301,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0604,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0605,x
	iny
	lda (objectPtr_38),y
	sta someObjProperty_0700,x
	sta someObjProperty_0300,x
	lda var_54
	sta someObjProperty_0400,x
	lda var_55
	sta someObjProperty_0401,x
	lda var_56
	sta someObjProperty_0402,x
	lda var_57
	sta someObjProperty_0403,x
	lda #$00
	sta someObjProperty_0503,x
	sta someObjProperty_0504,x
	sta someObjProperty_0505,x
	sta someObjProperty_0303,x
	lda #$80
	sta someObjProperty_0404,x
	pla
	tay
	rts
.endproc
;
; $82C9
.proc UnknownSub1
	jsr UnknownSub2
	lda #$00
	sta var_5A
	lda #$06
	sta var_4D
	
	BeginHere:
	ldx var_4D
	lda someObjProperty_0404,x
	bit BIT_4
	beq :++
	jsr HandleObjectCollision
	lda someObjProperty_0303,x
	cmp #$02
	bne :+
	lda #$FF
	sta flagPlayerHit_1E
	lda #$00
	sta someObjProperty_0303,x
	:
	jmp doneWithThis
	:
	lda someObjProperty_0404,x
	bpl doneWithThis
	lda someObjProperty_0401,x
	beq :+
	cmp #$FF
	bne SecondPart
	lda someObjProperty_0400,x
	clc
	adc someObjProperty_0600,x
	bcc SecondPart
	:
	lda someObjProperty_0403,x
	beq ThirdPart
	cmp #$FF
	bne SecondPart
	lda someObjProperty_0402,x
	clc
	adc someObjProperty_0601,x
	bcs ThirdPart
	
	SecondPart:
	lda someObjProperty_0405,x
	and #$10
	beq :+
	lda someObjProperty_0404,x
	and #$20
	beq :++
	:
	lda #$10
	sta someObjProperty_0404,x
	jmp doneWithThis
	:
	lda someObjProperty_0404,x
	and #$DF
	sta someObjProperty_0404,x
	jmp doneWithThis
	
	ThirdPart:
	lda someObjProperty_0404,x
	ora #$20
	sta someObjProperty_0404,x
	jsr UnknownSub3
	lda someObjProperty_0404,x
	and #$08
	beq doneWithThis
	lda var_5A
	bne doneWithThis
	jsr UnknownSub24
	
	doneWithThis:
	lda var_4D
	clc
	adc #$06
	sta var_4D
	cmp #$F0
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
	sta someObjProperty_0702
	lda someObjProperty_0400
	adc someObjProperty_0600
	sbc #$08
	sta someObjProperty_0703
	lda someObjProperty_0402
	adc #$03
	sta someObjProperty_0704
	lda someObjProperty_0402
	adc someObjProperty_0601
	sbc #$04
	sta someObjProperty_0705
	rts
.endproc
;
; $8391
.proc UnknownSub3
	lda someObjProperty_0405,x
	and #$10
	beq SecondPart
	
	lda someObjProperty_0401,x
	beq :+
	lda #$00
	beq :++
	
	:
	lda someObjProperty_0400,x
	
	:
	sta someObjProperty_0702,x
	lda someObjProperty_0403,x
	beq :+
	lda #$00
	beq :++
	
	:
	lda someObjProperty_0402,x
	
	:
	sta someObjProperty_0704,x
	lda someObjProperty_0400,x
	clc
	adc someObjProperty_0600,x
	cmp someObjProperty_0702,x
	bcs :+
	lda #$FF
	
	:
	sta someObjProperty_0703,x
	lda someObjProperty_0402,x
	clc
	adc someObjProperty_0601,x
	cmp someObjProperty_0704,x
	bcs :+
	lda #$FF
	
	:
	sta someObjProperty_0705,x
	rts

	SecondPart:
	lda someObjProperty_0400,x
	sta someObjProperty_0702,x
	clc
	adc someObjProperty_0600,x
	sta someObjProperty_0703,x
	lda someObjProperty_0402,x
	sta someObjProperty_0704,x
	clc
	adc someObjProperty_0601,x
	sta someObjProperty_0705,x
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
	bit BIT_6
	bne :+
	jmp DoneWithThis
	
	:
	lda someObjProperty_0702,y
	sta var_4F
	lda someObjProperty_0703,y
	sta var_50
	lda someObjProperty_0704,y
	sta var_51
	lda someObjProperty_0705,y
	sta var_52
	ldx #$30
	
	AnotherCheckAndLeave:
	lda someObjProperty_0404,x
	bpl StartLeaving
	and #$20
	beq StartLeaving
	lda someObjProperty_0405,x
	bit BIT_6
	beq StartLeaving
	
	and #$10
	bne :+
	cpy #$00
	beq :+
	
	StartLeaving:
	jmp dontHandleObjCollision
	
	: ; $843B
	lda someObjProperty_0702,x
	cmp var_50
	bcs StartLeaving
	lda var_4F
	cmp someObjProperty_0703,x
	bcs StartLeaving
	lda someObjProperty_0704,x
	cmp var_52
	bcs StartLeaving
	lda var_51
	cmp someObjProperty_0705,x
	bcs StartLeaving
	lda hitPoints_0603,x
	sec
	sbc someObjProperty_0602,y
	beq :+
	bcs :++
	
	:
	jsr UnknownSub9
	jmp :++
	
	:
	sta hitPoints_0603,x
	lda flagUnknown_1A
	bne :+
	clc
	lda someObjProperty_0400,x
	adc #$07
	sta someObjProperty_0400,x
	lda someObjProperty_0401,x
	adc #$00
	sta someObjProperty_0401,x
	
	:
	cpy #$00
	bne :+
	
	:
	lda hitPoints_0603,y
	sec
	sbc someObjProperty_0602,x
	beq doHandleObjCollision
	bcc doHandleObjCollision
	
	cpy #$00
	bne doStoreHitPointsAndLeave
	cmp #$14
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
	cmp #$01
	bne doStoreHitPointsAndLeave
	pha
	lda #HEART_OFFSCREEN
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
	cmp #$F0
	bcc :+
	bcs DoneWithThis
	
	:
	jmp AnotherCheckAndLeave
	
	DoneWithThis:
	tya
	clc
	
	EvenMoreDone:
	adc #$06
	cmp #$30
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
	lda someObjProperty_0405,x
	bit BIT_4
	bne :+
	jmp doHandleObjCollision
	
	:
	bit BIT_0
	beq :+
	lda var_2B
	beq doHandleObjCollision
	sec
	sbc #$01
	sta var_2B
	cmp #$01
	bne doALSOHandleObjCollision
	sta var_2E
	jsr UnknownSub4
	jmp doHandleObjCollision
	
	:
	bit BIT_1
	beq :+
	lda var_2C
	beq doHandleObjCollision
	sec
	sbc #$01
	sta var_2C
	cmp #$01
	bne doALSOHandleObjCollision
	sta var_2E
	jsr UnknownSub4
	jmp doHandleObjCollision
	
	:
	bit BIT_3
	beq doALSOHandleObjCollision
	cpy #$00
	bne skipHandlingCollision
	
	doALSOHandleObjCollision:
	jsr HandleObjectCollision
	lda soundAddress_8D
	cmp #$05
	beq skipHandlingCollision
	nop;
	nop;
	nop;	jsr DoSomethingWithSound 

	lda #$04
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX

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
	lda someObjProperty_0405,x
	bit BIT_6
	bne :+
	jmp doneWithThisRoutine_X
	
	:
	lda someObjProperty_0302,x
	bne :+
	
	:
	cmp #$06
	bne handlePlayerGotExtraLife
	lda var_60
	beq :+
	dec var_60
	
	:
	lda #$00
	jmp SecondPart
	handlePlayerGotExtraLife:
	cmp #$28
	bne handlePlayerGotPowerUp
	nop;
	nop;
	nop; jsr UnknownSoundSub2

	nop;
	nop;
	nop; jsr DoSomethingWithSound
 
	lda #$06
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX
	inc livesCounter_11
	jmp doneWithThisRoutine_X
	handlePlayerGotPowerUp:
	cmp #$29
	bne handlePlayerGotHeart 
	nop;
	nop;
	nop; jsr UnknownSoundSub2

	nop;
	nop;
	nop; jsr DoSomethingWithSound
 
	lda #$07
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX

	lda powerUp_P_64
	cmp #$04
	bcc :+
	nop;
	nop;
	nop; jsr DoSomethingWithSound
 
	jmp doneWithThisRoutine_X
	
	:
	inc powerUp_P_64
	jmp doneWithThisRoutine_X
	
	handlePlayerGotHeart:
	cmp #$2A
	bne skipHeart
	nop;
	nop;
	nop; jsr UnknownSoundSub2

	nop;
	nop;
	nop; jsr DoSomethingWithSound
 
	lda #$07
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX

	jsr AddOneHeart
	jmp doneWithThisRoutine_X
	
	skipHeart:
	cmp #$2B
	bne :+
	nop;
	nop;
	nop; jsr UnknownSoundSub2

	nop;
	nop;
	nop; jsr DoSomethingWithSound
 
	lda #$07
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX

	lda #$03
	sta speed_66
	jmp doneWithThisRoutine_X
	
	:
	cmp #$2C
	bne :++
	lda someObjProperty_0401,x
	beq :+
	jmp doneWithThisRoutine_X
	
	:
	lda #$0C
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX

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
	cmp #$1F
	bne :+
	lda #$02
	bne SecondPart
	
	:
	cmp #$1A
	bne :+
	nop;
	nop;
	nop; jsr UnknownSoundSub2

	nop;
	nop;
	nop; jsr DoSomethingWithSound
 
	lda #$05
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr PlaySFX

	lda #$01
	sta soundAddress_8F
	lda #$03
	bne SecondPart
	
	:
	cmp #$32
	bne :+
	lda #$04
	bne SecondPart
	
	:
	cmp #$33
	bne :+
	lda #$05
	bne SecondPart
	
	:
	cmp #$34
	bne :+
	lda #$06
	bne SecondPart
	
	:
	cmp #$35
	bne :+
	lda #$07
	bne SecondPart
	
	:
	cmp #$36
	bne :+
	lda #$0C
	bne SecondPart
	
	:
	cmp #$24
	bne doneWithThisRoutine_X
	lda #$09
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr InitializeSound

	lda #$08
	clc
	adc bankIndex_15
	sbc #$00
	
	SecondPart:
	sta var_58
	lda someObjProperty_0404,x
	and #$20
	beq doneWithThisRoutine_X
	clc
	lda someObjProperty_0400,x
	sta var_54
	lda someObjProperty_0401,x
	adc #$00
	sta var_55
	clc
	lda someObjProperty_0402,x
	sta var_56
	lda someObjProperty_0403,x
	adc #$00
	sta var_57
	jsr UnknownSub7
	doneWithThisRoutine_X:
	pla
	tay
	pla
	tax
	lda #$00
	sta someObjProperty_0404,x
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
	lda #HEART_HUD_Y
	sta OAM_0200
	rts
.endproc
;
; $86A9
.proc UnknownSub7
	jsr FindFreeObjSlot
	cpx #$F0
	bcc :+
	rts
	
	:
	lda var_58
	asl A
	asl A
	asl A
	tay
	lda Data_at8715+0,y
	sta someObjProperty_0501,x
	lda Data_at8715+1,y
	sta someObjProperty_0502,x
	lda Data_at8715+2,y
	sta someObjProperty_0602,x
	lda Data_at8715+3,y
	sta someObjProperty_0405,x
	lda Data_at8715+4,y
	sta someObjProperty_0600,x
	lda Data_at8715+5,y
	sta someObjProperty_0601,x
	lda Data_at8715+6,y
	sta someObjProperty_0302,x
	lda Data_at8715+7,y
	sta someObjProperty_0303,x
	lda var_54
	sta someObjProperty_0400,x
	lda var_55
	sta someObjProperty_0401,x
	lda var_56
	sta someObjProperty_0402,x
	lda var_57
	sta someObjProperty_0403,x
	lda #$00
	sta someObjProperty_0503,x
	sta someObjProperty_0504,x
	sta someObjProperty_0505,x
	sta someObjProperty_0700,x
	sta someObjProperty_0300,x
	sta someObjProperty_0301,x
	lda #$80
	sta someObjProperty_0404,x
	rts
.endproc
;
; $8715
Data_at8715:
.incbin "rom-prg/objects/data-block-at8715.bin"
;
; $8AEA
.proc UnknownSub4
	lda var_2E
	beq doneWithThisRoutine
	lda frameCounter_12
	and #$07
	bne :+
	lda #$32
	bne doStartToLeave
	
	:
	bit BIT_0
	bne :+
	lda #$33
	bne doStartToLeave
	
	:
	bit BIT_1
	bne :+
	lda #$34
	bne doStartToLeave
	
	:
	lda #$35
	
	doStartToLeave:
	pha
	lda #$00
	sta var_2E
	pla
	sta someObjProperty_0302,x
	
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
	sta var_60
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
Data_at8B7A:
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
	bit BIT_1
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
	cmp var_60
	bcc skipThisRoutine
	cpx #$03
	bcc :+
	inc var_60
	inc var_60
	lda #$01
	jsr UnknownSub13
	lda #$02
	jsr UnknownSub13
	
	
	:
	inc var_60
	lda #$00
	jsr UnknownSub13
	lda soundAddress_8D
	cmp #$07
	bne :+
	lda frameCounter_12
	and #$03
	bne skipThisRoutine
	nop;
	nop;
	nop; jsr $9C91; This is sound
	nop;
	nop;
	nop; jsr DoSomethingWithSound 
	
	beq :++
	
	:
	cmp #$05
	beq skipThisRoutine
	
	:
	lda #$03
	sta soundAddress_8D
	nop; 
	nop; 
	nop; jsr PlaySFX
	
	skipThisRoutine:
	lda #$00
	sta var_62
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
	lda Data_at8D1D+0,y
	sta someObjProperty_0501,x
	lda Data_at8D1D+1,y
	sta someObjProperty_0502,x
	lda Data_at8D1D+2,y
	cpy #$00
	beq :+
	clc
	adc #$02
	
	:
	sta someObjProperty_0602,x
	lda Data_at8D1D+3,y
	sta someObjProperty_0302,x
	lda Data_at8D1D+4,y
	sta someObjProperty_0600,x
	lda Data_at8D1D+5,y
	sta someObjProperty_0601,x
	lda someObjProperty_0400
	clc
	adc Data_at8D1D+6,y
	sta someObjProperty_0400,x
	lda someObjProperty_0402
	clc
	adc Data_at8D1D+7,y
	sta someObjProperty_0402,x
	lda #$00
	sta someObjProperty_0503,x
	sta someObjProperty_0504,x
	sta someObjProperty_0505,x
	sta someObjProperty_0401,x
	sta someObjProperty_0403,x
	sta hitPoints_0603,x
	lda #$40
	sta someObjProperty_0405,x
	lda #$80
	sta someObjProperty_0404,x
	rts

.endproc
;
; $8D1D
Data_at8D1D:
.incbin "rom-prg/objects/data-block-at8D1D.bin"
;
; $8D4D
.proc UnknownSub14
	clc
	ldx #$0C
	
	:
	lda someObjProperty_0404,x
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
; FindFreeObjSlot (return x)
; Check if flags 7 and 4 are set in $0434
; Starting at $0434 go over 32 slots stopping at
; the first FREE slot.
; Return the slot position in X
.proc FindFreeObjSlot
	clc
	ldx #$30
	:
		lda someObjProperty_0404,x
		and #(BIT7+BIT4) ;%10010000 ; #$90
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
	lda someObjProperty_0301,x
	bne :+
	rts

	:
	lda someObjProperty_0404,x
	and #$F7
	sta someObjProperty_0404,x
	lda someObjProperty_0700,x
	sta someObjProperty_0300,x
	lda someObjProperty_0301,x
	cmp #$01
	bne :+
	jsr UnknownSub25
	jmp skipThisRoutine
	
	:
	cmp #$03
	bne :+
	jsr UnknownSub16
	jmp skipThisRoutine
	
	:
	cmp #$05
	bne :+++
	lda #$0F
	bit frameCounter_12
	beq :+
	jsr UnknownSub20
	jmp :++
	
	:
	jsr UnknownSub25
	
	:
	lda flagUnknown_1A
	beq :+
	jsr UnknownSub15
	
	:
	cmp #$06
	bne :+
	jsr UnknownSub21
	jsr UnknownSub15
	
	:
	cmp #$07
	bne :+
	jsr UnknownSub22
	jsr UnknownSub15
	
	:
	cmp #$08
	bne skipThisRoutine
	jsr UnknownSub23
	jsr UnknownSub15
	
	skipThisRoutine:
	lda #$01
	sta var_5A
	rts
.endproc
;
; $8DDB
.proc UnknownSub25
	lda #$00
	sta var_4B
	lda someObjProperty_0400,x
	sec
	sbc someObjProperty_0400
	bcs :+
	eor #$FF
	
	:
	rol var_4B
	sta var_4C
	lda someObjProperty_0402,x
	sec
	sbc someObjProperty_0402
	bcs :+
	eor #$FF
	
	:
	rol var_4B
	cmp var_4C
	bcs :+
	ldy var_4C
	sta var_4C
	tya
	
	:
	rol var_4B
	sec
	sbc var_4C
	ldy #$00
	
	:
	sec
	sbc var_4C
	bcc :+
	iny
	cpy #$04
	bcc :-
	
	:
	tya
	ldy var_4B
	clc
	adc Data_at8E25,y
	asl A
	sta var_4A
	txa
	tay
	jsr UnknownSub17
	rts
.endproc
;
; $8E25
Data_at8E25:
.byte $0f, $23, $0a, $19, $05, $1e, $00, $1e
;
; $8E2D
.proc UnknownSub16
	txa
	tay
	ldx #$00
	
	:
	lda Data_at8E3F,x
	sta var_4A
	jsr UnknownSub17 ; ==========================
	inx
	cpx #$08
	bne :-
	rts
.endproc
;
; $8E3F
Data_at8E3F:
.byte $00, $08, $0a, $44, $46, $1c, $14, $30
;
; $8E47
.proc UnknownSub17
	txa
	pha
	tya
	pha
	jsr FindFreeObjSlot
	cpx #$F0
	bcs doneWithThis
	jsr UnknownSub18
	ldy var_4A
	jsr UnknownSub19
	lda #$01
	sta someObjProperty_0602,x
	lda #$60
	sta someObjProperty_0405,x
	lda #$04
	sta someObjProperty_0600,x
	sta someObjProperty_0601,x
	lda #$00
	sta hitPoints_0603,x
	sta someObjProperty_0301,x
	sta someObjProperty_0302,x
	lda #$80
	sta someObjProperty_0404,x
	
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
	sta someObjProperty_0400,x
	lda someObjProperty_0401,y
	adc #$00
	sta someObjProperty_0401,x
	lda someObjProperty_0402,y
	clc
	adc someObjProperty_0605,y
	sta someObjProperty_0402,x
	lda someObjProperty_0403,y
	adc #$00
	sta someObjProperty_0403,x
	rts
.endproc
;
; $8EA6
.proc UnknownSub19
	lda Data_at8EBE+0,y
	sta someObjProperty_0501,x
	lda Data_at8EBE+1,y
	sta someObjProperty_0502,x
	lda #$00
	sta someObjProperty_0505,x
	sta someObjProperty_0503,x
	sta someObjProperty_0504,x
	rts
.endproc
;
; $8EBE
Data_at8EBE:
.incbin "rom-prg/objects/data-block-at8EBE.bin"
;
; $927F
.proc UnknownSub20
	txa
	tay
	ldx #$00
	
	:
	lda Data_at9291,x
	sta var_4A
	jsr UnknownSub17
	inx
	cpx #$05
	bne :-
	rts
.endproc
;
; $9291
Data_at9291:
.byte $52, $54, $56, $58, $5a
;
; $9296
.proc UnknownSub21
	txa
	tay
	ldx #$00
	
	:
	lda Data_at92A8,x
	sta var_4A
	jsr UnknownSub17
	inx
	cpx #$03
	bne :-
	rts
.endproc
;
; $92A8
Data_at92A8:
.byte $5E, $60, $62
;
; $92AB
.proc UnknownSub22
	txa
	tay
	ldx #$00
	
	:
	lda Data_at92BD,x
	sta var_4A
	jsr UnknownSub17
	inx
	cpx #$05
	bne :-
	rts
.endproc
;
; $92BD
Data_at92BD:
.byte $64, $66, $68, $6A, $6C
;
; $92C2
.proc UnknownSub23
	txa
	tay
	ldx #$00
	:
	lda Data_at92D4,x
	sta var_4A
	jsr UnknownSub17
	inx
	cpx #$08
	bne :-
	rts
.endproc
;
; $92D4
Data_at92D4:
.byte $66, $68, $6A, $6E, $70, $72, $74, $76
;
; $92DC
.proc UnknownSub15
	txa
	pha
	tya
	pha
	lda #$05
	sta someObjProperty_0333 ; not used in any other place
	lda someObjProperty_0531
	sta someObjProperty_05FB
	lda someObjProperty_0532
	sta someObjProperty_05FC
	lda someObjProperty_0533
	sta someObjProperty_05FD
	lda someObjProperty_0534
	sta someObjProperty_05FE
	lda someObjProperty_0535
	sta someObjProperty_05FF
	lda #$00
	sta someObjProperty_0533
	sta someObjProperty_0534
	sta someObjProperty_0535
	lda #<Data_at932D ;; see data below
	sta objectPtr_34+0
	lda #>Data_at932D ;; see data below
	sta objectPtr_34+1
	lda bankIndex_15
	sec
	sbc #$01
	asl A
	tay
	lda (objectPtr_34),y
	sta someObjProperty_0531 ; boss AI?
	iny
	lda (objectPtr_34),y
	sta someObjProperty_0532 ; boss AI?
	pla
	tay
	pla
	tax
	rts
.endproc
; $932D
Data_at932D:
;.incbin "rom-prg/objects/data-block-at932D.bin"
.word Data_at9335, Data_at933D
.word Data_at9345, Data_at934D

Data_at9335: ; Boss 1 shoot animation (one frame)
.byte $29, $00, $00, $86, $29, $00, $00, $FF 

Data_at933D: ; Boss 2 shoot animation (one frame)
.byte $2B, $00, $00, $86, $2B, $00, $00, $FF 

Data_at9345: ; Boss 3 shoot animation (one frame)
.byte $23, $00, $00, $87, $23, $00, $00, $FF 

Data_at934D: ; Boss 4 shoot animation (five frames)
.byte $37, $00, $00, $83, $38, $00, $00, $84, $39, $00, $00, $8C, $38, $00, $00, $85, $37, $00, $00, $86, $FF

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
	lda LivesGraphicData,x
	sta someObjProperty_0501,y
	lda LivesGraphicData+1,x
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
	tay
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
	cmp #$04	;; Check if the last stage was completed
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
		lda HeartHUDData,y
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
	tay
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
; LoadPaletteIntoVRAM_A_Y
; Loads 16 colors from addressPtr_32, with offset Y
; Stores into VRAM
; 	A : 	$00 Background
;			$10 Sprites
;	Y : 	offset from addressPtr_32
.proc LoadPaletteIntoVRAM_A_Y
	ldx #VRAM_PALETTES_PAGE
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
; LoadPaletteIntoRAM_A_Y
; Loads 16 colors from addressPtr_32, with offset Y
; Stores into RAM address bgPalette_E0, with offset A
; 	A : 	offset from bgPalette_E0  (address high byte)
;	Y : 	offset from addressPtr_32 (address word)
.proc LoadPaletteIntoRAM_A_Y
	tax
	clc
	adc #$10
	sta var_4D
	:
		lda (addressPtr_32),y
		sta bgPalette_E0,x 
		iny
		inx
		cpx var_4D
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
	cmp #$80
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
; LoadStage(A,x)
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
	lda BackgroundData_E847+0,y
	sta addressPtr_32+0
	lda BackgroundData_E847+1,y
	sta addressPtr_32+1
	lda #$00
	ldy #$03
	jsr LoadPaletteIntoVRAM_A_Y
	lda #$00
	ldy #$03
	jsr LoadPaletteIntoRAM_A_Y
	ldy #$02
	lda (addressPtr_32),y
	tay
	lda #$10
	jsr LoadPaletteIntoVRAM_A_Y
	ldy #$02
	lda (addressPtr_32),y
	tay
	lda #$10
	jsr LoadPaletteIntoRAM_A_Y
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
			cmp #$01
			bne :-
		pla
		sec
		sbc #$01
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
	lda Ctrl1_4016,x
	lsr A
	bcs RegisterInput
	lsr A
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
			lda bgPalette_E0,x
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
			lda bgPalette_E0,x
			sec
			sbc #$10
			bcs paletteDidNotUnderflow
			lda #$0F
			
			paletteDidNotUnderflow:
			sta bgPalette_E0,x
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
	sta var_2A
	jsr ClearNametablePattern
	lda #$01
	jsr ClearNametablePattern
	lda #$00
	tax
	sta BankSwitching_FFF0+0,x
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
	
	nop;
	nop;
	nop;jsr InitializeSound

	loopPressANYButton:
		lda input1_20
		beq loopPressANYButton
	
	sta inputPrev_22
	:
		lda input1_20
		cmp inputPrev_22
		beq :-
	nop;
	nop;
	nop; jsr Sound_DontKnowWhatItDoes
	lda #$00
	sta screenScrollX_29
	sta var_2A
	jsr PaletteFading
	jsr RenderingOFF
	jsr ClearMemoryPage0200_OAM
	lda #$02
	jsr HandleAliveTimer
	lda #$00
	sta PpuControl_2000
	sta screenScrollX_29
	sta var_2A
	jsr ClearNametablePattern
	lda #$01
	jsr ClearNametablePattern
	lda #$02
	tax
	sta BankSwitching_FFF0+0,x
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
	sta addressPtr_32+0
	lda EndCreditsData+1,y
	sta addressPtr_32+1
	ldy #$00
	lda (addressPtr_32),y
	sta vramAddress_67+0
	iny
	lda (addressPtr_32),y
	sta vramAddress_67+1
	iny
	loopLoadCredits:
		lda vramAddress_67+0
		sta PpuAddr_2006
		lda vramAddress_67+1
		sta PpuAddr_2006
		lda (addressPtr_32),y
		cmp #$FF
		beq leaveEndCredits
		cmp #$20
		bne :+
		lda #$00
		sta PpuData_2007
		lda #$00
		sta PpuScroll_2005
		sta PpuScroll_2005
		beq :++
		:
		sec
		sbc #$36
		sta PpuData_2007
		lda #$00
		sta PpuScroll_2005
		sta PpuScroll_2005
		lda #$0A
		sta soundAddress_8D
		nop;
		nop;
		nop;jsr PlaySFX
		:
		lda vramAddress_67+1
		clc
		adc #$01
		sta vramAddress_67+1
		lda vramAddress_67+0
		adc #$00
		sta vramAddress_67+0
		doWait_07_Blanks:
		ldx #$07
		:
			jsr WaitVBlank
			dex
			bne :-
		iny
		bne loopLoadCredits
	nop;
	nop;
	nop;jsr DoSomethingWithSound 
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
		lda Data_at97F5,y
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
	cmp #$0A
	bne :-
	rts
.endproc
;
; $97EC
.proc WaitforButtonPress
	sta inputPrev_22
	:
		lda input1_20
		cmp inputPrev_22
		beq :-
	rts
.endproc
;
; $97F5 32 bytes of data
Data_at97F5:
.incbin "rom-prg/objects/data-block-at97F5.bin"
;
; =====================================================
;
; $9815
.segment "SOUNDENGINE"
;.include "sound-engine.asm"

.res 1293

; $9D22 data
Data_at9D22:
.incbin "rom-prg/sound/sound-data-at9D32.bin"

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
	cmp #$75
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
	dec var_5C
	
	:
	lda var_5E
	beq :+
	jsr HandleControllerInputs
	jsr HandleObjects
	
	:
	jsr PowerUpCheat

	doUpdateSoundOnly:
	nop;
	nop;
	nop; jsr UpdateSoundAtVBlank

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
	inc frameScrollCtr_28
	lda frameScrollCtr_28
	cmp frameScrollAt_27
	bcc doneWithScrollHandling
	
	doScrollBackground:
	lda #$00
	sta frameScrollCtr_28
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
	eor #$01
	sta flagPPUControl_19
	
	doneWithScrolling:
	rts
.endproc
;
; $A458
.proc UnknownSub10
	
	:
	jsr UnknownSub11
	bit someObjProperty_0100
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
	lda #FIRST_OBJECT_SLOT
	sta oamAddressPtr_3E
	lda var_5F
	sta var_3D
	
	BeginHere:
	ldx var_5F
	lda someObjProperty_0404,x
	bmi :+
	jmp SecondPart
	
	:
	ldy someObjProperty_0504,x
	beq :+
	dec someObjProperty_0504,x
	dec someObjProperty_0503,x
	jmp ReplaceMeLabel_2
	
	:
	lda someObjProperty_0501,x
	sta objectPtr_36+0
	lda someObjProperty_0502,x
	sta objectPtr_36+1
	ldy someObjProperty_0503,x
	
	ReplaceMeLabel_7:
	lda (objectPtr_36),y
	bmi :+
	jmp ReplaceMeLabel_3
	
	:
	asl A
	bmi ReplaceMeLabel_1
	lsr A
	sbc #$00
	sta someObjProperty_0504,x
	
	ReplaceMeLabel_2:
	lda someObjProperty_0405,x
	bpl ReplaceMeLabel_4
	lda var_0C
	bpl :+
	lda #$FF
	bne :++
	
	:
	lda #$00
	
	:
	sta var_47
	lda var_0C
	clc
	adc someObjProperty_0400,x
	sta someObjProperty_0400,x
	sta var_40
	lda var_47
	adc someObjProperty_0401,x
	sta someObjProperty_0401,x
	sta var_41
	lda var_0D
	bpl :+
	lda #$FF
	bne :++
	
	:
	lda #$00
	
	:
	sta var_49
	lda var_0D
	clc
	adc someObjProperty_0402,x
	sta someObjProperty_0402,x
	sta objects_Y_42
	lda var_49
	adc someObjProperty_0403,x
	sta someObjProperty_0403,x
	sta var_43
	jmp ReplaceMeLabel_5
	
	ReplaceMeLabel_4:
	lda someObjProperty_0400,x
	sta var_40
	lda someObjProperty_0401,x
	sta var_41
	lda someObjProperty_0402,x
	sta objects_Y_42
	lda someObjProperty_0403,x
	sta var_43
	
	ReplaceMeLabel_5:
	inc someObjProperty_0503,x
	lda someObjProperty_0701,x
	tax
	lda Data_atA895+0,x
	sta addressPtr_32+0
	lda Data_atA895+1,x
	sta addressPtr_32+1
	ldx var_5F
	jmp ReplaceMeLabel_6
	
	ReplaceMeLabel_1:
	asl A
	bmi loopTest
	dec someObjProperty_0505,x
	lda someObjProperty_0505,x
	bne :+
	iny
	iny
	jmp ReplaceMeLabel_7
	
	:
	bpl loop
	lda (objectPtr_36),y
	and #$1F
	sta someObjProperty_0505,x
	
	loop:
		iny
		lda (objectPtr_36),y
		tay
		lda (objectPtr_36),y
		jmp ReplaceMeLabel_3
		
		loopTest:
		cmp #$F8
		beq loop
		asl A
		bmi :+
	
	lsr A
	lsr A
	lsr A
	and #$0F
	lda someObjProperty_0404,x
	ora #$08
	sta someObjProperty_0404,x
	jmp SecondPart
	
	:
	lda someObjProperty_0303,x
	cmp #$03
	bne :+
	beq :++
	
	:
	cmp #$04
	bne :++
	lda #$01
	sta flagNextLevel_1B
	
	:
	lda #$00
	sta someObjProperty_0302,x
	sta someObjProperty_0303,x
	
	:
	cmp #$05
	bne :+ 
	jsr Copy_5BytesPage05_FromEnd_ToBeginning
	jmp :++
	
	:
	lda #$10
	sta someObjProperty_0404,x
	
	:
	jmp SecondPart
	
	ReplaceMeLabel_3:
	asl A
	sta someObjProperty_0701,x
	tax
	lda Data_atA895+0,x
	sta addressPtr_32+0
	lda Data_atA895+1,x
	sta addressPtr_32+1
	iny
	ldx var_5F
	lda someObjProperty_0405,x
	bpl :+
	lda (objectPtr_36),y
	clc
	adc var_0C
	jmp :++
	
	:
	lda (objectPtr_36),y
	
	:
	sta objects_X_46
	bpl :+
	lda #$FF
	bne :++
	
	:
	lda #$00
	
	:
	sta var_47
	lda objects_X_46
	clc
	adc someObjProperty_0400,x
	sta someObjProperty_0400,x
	sta var_40
	lda var_47
	adc someObjProperty_0401,x
	sta someObjProperty_0401,x
	sta var_41
	iny
	lda someObjProperty_0405,x
	bpl :+
	lda (objectPtr_36),y
	clc
	adc var_0D
	jmp :++
	
	:
	lda (objectPtr_36),y
	
	:
	sta var_48
	bpl :+
	lda #$FF
	bne :++
	
	:
	lda #$00
	
	:
	sta var_49
	lda var_48
	clc
	adc someObjProperty_0402,x
	sta someObjProperty_0402,x
	sta objects_Y_42
	lda var_49
	adc someObjProperty_0403,x
	sta someObjProperty_0403,x
	sta var_43
	iny
	tya
	sta someObjProperty_0503,x
	
	ReplaceMeLabel_6:
	lda someObjProperty_0404,x
	and #$20
	bne :+
	jmp SecondPart
	
	:
	lda someObjProperty_0405,x
	and #$18
	beq :+
	lda frameCounter_12
	and #$03
	bne :+
	dec someObjProperty_0300,x
	lda someObjProperty_0300,x
	bne :+
	lda someObjProperty_0404,x
	ora #$08
	sta someObjProperty_0404,x
	
	:
	ldy #$00
	lda (addressPtr_32),y
	bpl :+
	jmp ReplaceMeLabel_8
	
	:
	sta someObjProperty_0600,x
	lsr A
	lsr A
	lsr A
	clc
	adc #$01
	sta var_44
	iny
	lda (addressPtr_32),y
	sta someObjProperty_0601,x
	lsr A
	lsr A
	lsr A
	clc
	adc #$01
	sta var_45
	iny
	ldx oamAddressPtr_3E
	
	ReplaceMeLabel_11:
	lda var_44
	sta var_3C
	lda var_40
	sta objects_X_46
	lda var_41
	sta var_47
	
	ReplaceMeLabel_10:
	lda (addressPtr_32),y
	beq :+
	lda var_47
	bne :++
	lda var_43
	bne :++
	lda (addressPtr_32),y ; XXX
	sta OAM_0200+OBJ_TILE,x	; tile #
	lda objects_Y_42				
	sta OAM_0200+OBJ_Y,x	; y 
	iny
	lda (addressPtr_32),y
	sta OAM_0200+OBJ_ATT,x	; attributes
	lda objects_X_46
	sta OAM_0200+OBJ_X,x	; x
	txa
	clc
	adc #$04
	beq ReplaceMeLabel_9
	tax
	
	:
	iny
	dec var_3C
	beq :++
	lda objects_X_46
	adc #$08
	sta objects_X_46
	bcc ReplaceMeLabel_10
	inc var_47
	jmp ReplaceMeLabel_10
	
	:
	iny
	jmp :--
	
	:
	dec var_45
	beq :+
	lda objects_Y_42
	clc
	adc #$08
	sta objects_Y_42
	bcc ReplaceMeLabel_11
	inc var_43
	jmp ReplaceMeLabel_11
	
	:
	stx oamAddressPtr_3E
	
	SecondPart:
	lda var_5F
	clc
	adc var_59
	cmp #$F0
	bcc :++
	beq :+
	lda #$EA
	bne :++
	
	:
	lda #$00
	
	:
	sta var_5F
	cmp var_3D
	beq ReplaceMeLabel_12
	jmp BeginHere
	
	ReplaceMeLabel_8:
	ldx oamAddressPtr_3E
	lda var_41
	bne SecondPart
	lda var_43
	bne SecondPart
	lda objects_Y_42
	sta OAM_0200+OBJ_Y,x
	iny
	lda (addressPtr_32),y
	sta OAM_0200+OBJ_TILE,x
	iny
	lda (addressPtr_32),y
	sta OAM_0200+OBJ_ATT,x
	lda var_40
	sta OAM_0200+OBJ_X,x
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
	sta OAM_0200,x
	inx
	bne :-
	
	ReplaceMeLabel_9:
	lda var_5F
	cmp var_3D
	bne :+
	lda #$00
	sta var_5F
	sec
	sbc var_59
	sta var_59

	:
	rts
.endproc
;
; $A709
.proc Copy_5BytesPage05_FromEnd_ToBeginning
	lda someObjProperty_05FB
	sta someObjProperty_0531
	lda someObjProperty_05FC
	sta someObjProperty_0532
	lda someObjProperty_05FD
	sta someObjProperty_0533
	lda someObjProperty_05FE
	sta someObjProperty_0534
	lda someObjProperty_05FF
	sta someObjProperty_0535
	rts
.endproc
;
; $A728
.proc PowerUpCheat
	lda input1_20
	cmp #$60
	bne :+
	cmp flagUnknown_1F
	beq :+
	inc powerUp_P_64
	lda powerUp_P_64
	cmp #$05
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
	cmp #$02
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
	bit BUTTON_RIGHT
	beq checkInputLeft

	lda someObjProperty_0400
	cmp #$DC
	bcs checkInputDown
	adc speed_66
	bcc :+
	
checkInputLeft:
	bit BUTTON_LEFT
	beq checkInputDown
	lda someObjProperty_0400
	cmp #$12
	bcc checkInputDown
	sbc speed_66

	:
	sta someObjProperty_0400
	
	checkInputDown:
	lda input1_20
	bit BUTTON_DOWN
	beq checkInputUp
	lda someObjProperty_0402
	cmp #$B8
	bcs checkInputA
	adc speed_66
	bcc :+
	
	checkInputUp:
	bit BUTTON_UP
	beq checkInputA
	lda someObjProperty_0402
	cmp #$14
	bcc checkInputA
	sbc speed_66
	:
	sta someObjProperty_0402
	
	checkInputA:
	lda input1_20
	bit BUTTON_A
	beq OnlyCheckForPause
	lda inputPrev_22
	bit BUTTON_A
	bne OnlyCheckForPause
	lda #$02
	jsr UnknownSub6
	sta var_62
	lda hitPoints_0603
	cmp #$14
	bcc :+
	lda #<Data_atA80A
	sta someObjProperty_0501
	lda #>Data_atA80A
	sta someObjProperty_0502
	lda #$00
	sta someObjProperty_0503
	beq OnlyCheckForPause
	:
	lda #<Data_atA7F0
	sta someObjProperty_0501
	lda #>Data_atA7F0
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
Data_atA7F0:
.incbin "rom-prg/objects/data-block-atA7F0.bin"
; $A80A
Data_atA80A:
.incbin "rom-prg/objects/data-block-atA80A.bin"
;
; $A83C
.proc UnknownSub6
	pha
	lda someObjProperty_0404
	bit BIT_5
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
	bit BUTTON_START
	beq dontPause
	lda inputPrev_22
	bit BUTTON_START
	bne dontPause
	lda flagPause_1C
	eor #$01
	sta flagPause_1C
	beq :+
	
	nop;
	nop;
	nop;	jsr Sound_DontKnowWhatItDoes

	lda #$08
	sta soundAddress_8D
	
	nop;
	nop;
	nop;jsr PlaySFX

	jmp dontPause
	:

	nop;
	nop;
	nop; jsr DoSomethingWithSound 

	lda flagUnknown_1A
	beq :+
	lda #$02
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr InitializeSound
	rts

	:
	lda #$01
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr InitializeSound
	
	dontPause:
	rts
.endproc
;
; $A885
.segment "OBJECTS"

ObjectsData_A885:
.include "objects.asm"


; $E847
.segment "BACKGROUND"

BackgroundData_E847:
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