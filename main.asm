; Game Config.
.define STARTING_LIVES	$16
.define STARTING_POWER	$04

; Engine Config.
.define HEART_HUD_Y		$D8
.define HEART_OFFSCREEN $F8

.define BG_SCROLL_RATE	$02
	; $01 every frame 		(60fps)
	; $02 every other frame	(30fps) (original)
	; $03 every two frames 	(15fps)

.define BG_SCROLL_LIMIT	 14
	; 9  if BG_SCROLL_RATE = 3
	; 14 if BG_SCROLL_RATE = 2 (original)
	; 27 if BG_SCROLL_RATE = 1

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

; Y_GetObjectIndexFromStage
; Read the current stage index from currentStage_15
; Calculates the correct index on the object data file:
; Y(index) = (stage-1)*4
; Destroys A and Y
.macro Y_GetObjectIndexFromStage
	ldy currentStage_15
	dey
	tya
	asl A
	asl A
	tay
.endmacro

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
.define currentStage_15		$15 ; 14 ; Stage Index 0(opening), 1, 2, 3, 4, and 5(ending)
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
.define currentEnemyBatch_5B	$5B ; 3
.define nextEnemyBatch_5C		$5C ; 5
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
.define ZERO    $00
.define ALL1	$FF

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
	lda #(BIT7+BIT6)	; flags %1100 0000
	sta Ctrl2_FrameCtr_4017
	
	ldx #$10 ; Wait 16 cycles for PPU to reach its stable state
	:	
		lda PpuStatus_2002
		DEX
		bne :-

	lda BankSwitching_FFF0	; Loads #$00 from ROM filling (dangerous!)
	sta BankSwitching_FFF0  ; Set mapper to Bank0
	
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

	lda #(BIT7+BIT3) ; flags %1000 1000
	and #(ALL1-BIT3) ; flags %1111 0111
	sta flagPPUControl_17
	sta flagPPUControl_19

	lda #(BIT4+BIT3+BIT2)
	sta flagPPUMask_18

	lda #$00 ; Start at the opening screen
	sta currentStage_15
	
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
	sta currentStage_15
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
	
	ldy currentStage_15
	lda BankSequenceArray,Y
	tax
	sta BankSwitching_FFF0,X
	inc currentStage_15
	
	clc
	lda currentStage_15
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
	
	lda #ZERO	;	no flags %0000 0000
	sta flagGameMode_26
	
	ldx #BG_SCROLL_RATE	;	how fast to update backgrounds
	stx frameScrollAt_27
	
	ldx #$01	;   counts how many screen have scrolled
	stx levelProgression_16
	
	lda #(BIT4+BIT3+BIT2) 	; flags %0001 1100
	sta flagPPUMask_18
	
	lda #(BIT7+BIT3)		; flags %1000 1000
	sta flagPPUControl_17
	sta flagPPUControl_19
	
	lda #$0A
	sta nextEnemyBatch_5C
	
	lda #$00
	sta input1_20
	sta inputPrev_22
	sta currentEnemyBatch_5B
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
	
	lda currentStage_15
	cmp #$02
	bcs loopMain
	
	ldy #$00

	EnableHeartAsSpriteZero:
	:
		lda HeartHUDData,Y
		sta OAM_0200,Y
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
		jsr LoadEnemyBatch
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
; Why use a JMP call for this?
; It is used only once during Reset and
; having these 2 lines there is of no consequence.
.proc SetFlag_59
	lda #$06
	sta var_59
	rts
.endproc
;
; $8175
; LoadEnemyBatch
; Loads Batch of Enemies
; Inputs: nextEnemyBatch_5C, currentEnemyBatch_5B
; Variable nextEnemyBatch_5C holds the timer for loading next enemy batch.
; If timer larger than or equal to $FA, spawn new batch.
.proc LoadEnemyBatch
	lda nextEnemyBatch_5C 		; count down until next batch load
	cmp #$FA					; will load next batch if counter >= $FA 
	bcs :+						; continue if it is time to load
	jmp doneLoadingEnemyBatch	; exit 

	; MACRO that reads the stage number and returns the index 
	; (address offset) for this stage's object data.
	Y_GetObjectIndexFromStage
	; now Y contains the index

	lda ObjectsData_A885+0,Y	; lo-byte of stage's enemy data
	sta objectPtr_34+0
	lda ObjectsData_A885+1,Y	; hi-byte of stage's enemy data
	sta objectPtr_34+1

	lda currentEnemyBatch_5B	; index for current enemy batch
	asl A
	tay
	lda (objectPtr_34),Y		; lo-byte of current enemy batch
	cmp #$FF					; check if end-of-line (EOL)
	bne :++						; if !EOL skip far ahead
	iny							
	lda (objectPtr_34),Y		; hi-byte of current enemy batch
	cmp #$FF					; check if end-of-file (EOF=FFFF)
	bne :+						; if !EOF skip ahead
	jmp doneLoadingEnemyBatch	; exit if EOF

	:							; if EOL was found
	dey							; go back 1 byte
	lda (objectPtr_34),Y		; read again: ; lo-byte of enemy batch description

	:
	sta objectPtr_3A+0 			; store lo-byte of enemy batch description
	iny
	lda (objectPtr_34),Y		; hi-byte of enemy batch description
	sta objectPtr_3A+1			; store hi-byte of enemy batch description
	
	; loop over every object of current enemy batch
	ldy #$00
	loopYLoadObject:

		jsr X_FindFreeObjectSlot; finds a free object slot and return it on X
		cpx #$F0 				; no slot available to load object
		bcs doneLooping			; exit if no free slot found
		
		lda (objectPtr_3A),Y	; read #1 byte of object descriptor
		cmp #$F8				; check for control character $F8 = STAGE BOSS
		bne :+					; if not, skip ahead

		lda #BIT0				; if control $F8 was found
		sta flagUnknown_1A		; set this flag to %0000 0001
		ldx #$30				; WHY? 
		jsr ClearObjectsDescription; Clears page $04 of RAM
	
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
		lda (objectPtr_3A),Y
		
		:						; if not previous $F8
		cmp #$F0				; check for control character $F0
		bne :+					; if not, skip ahead
		and #ZERO				; WHY? equivalent to LDA #$00
		sta var_2D				; zeroing var_2D (still unknown?)
		iny
		lda (objectPtr_3A),Y
		
		:						; if not previous $F0
		cmp #$FF				; check for control character $FF
		beq doneLooping			; if so, break loop

		cmp #$F1				; check for control character $F1
		bne :+					; if not, skip ahead

		and #(BIT1+BIT0)		; $F1 & $03 = $01
		sta var_2D				; object status flags?
		iny
		lda (objectPtr_3A),Y	; read next byte after $F1
		sta var_2B				; store it
		inc var_2B				; increment it (is it a counter?)
		iny			
		lda (objectPtr_3A),Y	; read next byte
		
		:						; if not previous $F1
		cmp #$F2				; check for control character $F2
		bne :+					; if not, skip ahead

		and #(BIT1+BIT0)		; $F2 & $03 = $02
		sta var_2D				; object status flags?
		iny
		lda (objectPtr_3A),Y	; read next byte after $F2
		sta var_2C				; store it
		inc var_2C				; increment it (is it a counter?)
		iny
		lda (objectPtr_3A),Y	; read next byte
		
		; no control character found. 
		; loading enemy
		: 
		sta var_58			 	; #1 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta var_54				; X position, #2 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta var_55				; #3 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta var_56				; Y position, #4 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta var_57				; #5 byte of object file
		jsr LoadEnemyType		; Use's var_58 to load the specific enemy type
		iny
		jmp loopYLoadObject

doneLooping:

	inc currentEnemyBatch_5B

	lda nextEnemyBatch_5C
	clc
	adc #$F0
	sta nextEnemyBatch_5C

doneLoadingEnemyBatch:
	rts
.endproc
;
; $822F
.proc LoadEnemyType
	tya
	pha

	; MACRO that reads the stage number and returns the index 
	Y_GetObjectIndexFromStage	
	
	lda ObjectsData_A885+2,Y	; lo-byte of stage's enemies AI/Animation data(?)
	sta objectPtr_34+0
	lda ObjectsData_A885+3,Y	; hi-byte of stage's enemies AI/Animation data(?)
	sta objectPtr_34+1

	; var_58 holds the index (address offset) for a given enemy's data
	lda var_58					; this was the FIRST byte loaded from the object file
	asl A						; multiply by 2 since address are WORDs (2 bytes)
	tay
	lda (objectPtr_34),Y		; lo-byte of a given enemy data
	sta objectPtr_38+0
	iny
	lda (objectPtr_34),Y		; hi-byte of a given enemy data
	sta objectPtr_38+1

	ldy #$00
	lda (objectPtr_38),Y		; lo-byte of of Enemy AI(?)
	sta someObjProperty_0501,X	; stores lo-byte of of Enemy AI(?)
	iny
	lda (objectPtr_38),Y		; hi-byte of of Enemy AI(?)
	sta someObjProperty_0502,X	; stores hi-byte of of Enemy AI(?)
	iny
	lda (objectPtr_38),Y		; loads #1 byte of 10
	sta someObjProperty_0602,X	; stores #1 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #2 byte of 10
	ora #(BIT5+BIT6)			; turn ON flags 5 and 6
	ora var_2D					; turn ON other flags from var_2D (see previous routine)
	sta someObjProperty_0405,X	; store #2 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #3 byte of 10
	sta someObjProperty_0600,X	; stores #3 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #4 byte of 10
	sta someObjProperty_0601,X	; stores #4 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #5 byte of 10
	sta hitPoints_0603,X		; stores #5 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #6 byte of 10
	sta someObjProperty_0302,X	; stores #6 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #7 byte of 10
	sta someObjProperty_0301,X	; stores #7 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #8 byte of 10
	sta someObjProperty_0604,X	; stores #8 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #9 byte of 10
	sta someObjProperty_0605,X	; stores #9 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #10 byte of 10
	sta someObjProperty_0700,X	; stores #10 byte of 10
	sta someObjProperty_0300,X	; stores #10 byte of 10
	
	lda var_54
	sta someObjProperty_0400,X 	; X position, #2 byte of object file
	lda var_55
	sta someObjProperty_0401,X	; #3 byte of object file
	lda var_56
	sta someObjProperty_0402,X	; Y position, #4 byte of object file
	lda var_57
	sta someObjProperty_0403,X	; #5 byte of object file
	
	lda #$00
	sta someObjProperty_0503,X	; zero out 
	sta someObjProperty_0504,X	; zero out 
	sta someObjProperty_0505,X	; zero out 
	sta someObjProperty_0303,X	; zero out 

	lda #BIT7
	sta someObjProperty_0404,X ; Object Control Flags(?)
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
	lda someObjProperty_0404,X
	bit BIT_4
	beq :++
	jsr HandleObjectCollision
	lda someObjProperty_0303,X
	cmp #$02
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
	cmp #$FF
	bne SecondPart
	lda someObjProperty_0400,X
	clc
	adc someObjProperty_0600,X
	bcc SecondPart
	:
	lda someObjProperty_0403,X
	beq ThirdPart
	cmp #$FF
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
	sta someObjProperty_0702,X
	lda someObjProperty_0403,X
	beq :+
	lda #$00
	beq :++
	
	:
	lda someObjProperty_0402,X
	
	:
	sta someObjProperty_0704,X
	lda someObjProperty_0400,X
	clc
	adc someObjProperty_0600,X
	cmp someObjProperty_0702,X
	bcs :+
	lda #$FF
	
	:
	sta someObjProperty_0703,X
	lda someObjProperty_0402,X
	clc
	adc someObjProperty_0601,X
	cmp someObjProperty_0704,X
	bcs :+
	lda #$FF
	
	:
	sta someObjProperty_0705,X
	rts

	SecondPart:
	lda someObjProperty_0400,X
	sta someObjProperty_0702,X
	clc
	adc someObjProperty_0600,X
	sta someObjProperty_0703,X
	lda someObjProperty_0402,X
	sta someObjProperty_0704,X
	clc
	adc someObjProperty_0601,X
	sta someObjProperty_0705,X
	rts

.endproc
;
; $83F4
.proc UnknownSub8
	ldy #$00
	
	BeginHere:
	lda someObjProperty_0404,Y
	bmi :+
	jmp DoneWithThis
	
	:
	lda someObjProperty_0405,Y
	bit BIT_6
	bne :+
	jmp DoneWithThis
	
	:
	lda someObjProperty_0702,Y
	sta var_4F
	lda someObjProperty_0703,Y
	sta var_50
	lda someObjProperty_0704,Y
	sta var_51
	lda someObjProperty_0705,Y
	sta var_52
	ldx #$30
	
	AnotherCheckAndLeave:
	lda someObjProperty_0404,X
	bpl StartLeaving
	and #$20
	beq StartLeaving
	lda someObjProperty_0405,X
	bit BIT_6
	beq StartLeaving
	
	and #$10
	bne :+
	cpy #$00
	beq :+
	
	StartLeaving:
	jmp dontHandleObjCollision
	
	: ; $843B
	lda someObjProperty_0702,X
	cmp var_50
	bcs StartLeaving
	lda var_4F
	cmp someObjProperty_0703,X
	bcs StartLeaving
	lda someObjProperty_0704,X
	cmp var_52
	bcs StartLeaving
	lda var_51
	cmp someObjProperty_0705,X
	bcs StartLeaving
	lda hitPoints_0603,X
	sec
	sbc someObjProperty_0602,Y
	beq :+
	bcs :++
	
	:
	jsr UnknownSub9
	jmp :++
	
	:
	sta hitPoints_0603,X
	lda flagUnknown_1A
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
	lda hitPoints_0603,Y
	sec
	sbc someObjProperty_0602,X
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
	sta hitPoints_0603,Y
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
	lda someObjProperty_0405,X
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
	lda someObjProperty_0405,X
	bit BIT_6
	bne :+
	jmp doneWithObjectCollision
	
	:
	lda someObjProperty_0302,X
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
	jmp doneWithObjectCollision
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
 
	jmp doneWithObjectCollision
	
	:
	inc powerUp_P_64
	jmp doneWithObjectCollision
	
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
	jmp doneWithObjectCollision
	
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
	jmp doneWithObjectCollision
	
	:
	cmp #$2C
	bne :++
	lda someObjProperty_0401,X
	beq :+
	jmp doneWithObjectCollision
	
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
	jmp doneWithObjectCollision
	
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
	bne doneWithObjectCollision
	lda #$09
	sta soundAddress_8D
	nop;
	nop;
	nop; jsr InitializeSound

	lda #$08
	clc
	adc currentStage_15
	sbc #$00
	
	SecondPart:
	sta var_58
	lda someObjProperty_0404,X
	and #$20
	beq doneWithObjectCollision
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

	doneWithObjectCollision:
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
	lda #HEART_HUD_Y
	sta OAM_0200
	rts
.endproc
;
; $86A9
; Load object var_58 from ROM to 
; an empty slot X
.proc UnknownSub7
	jsr X_FindFreeObjectSlot
	cpx #$F0
	bcc :+
	rts
	
	:
	lda var_58
	asl A
	asl A
	asl A
	tay
	lda Data_at8715+0,Y
	sta someObjProperty_0501,X
	lda Data_at8715+1,Y
	sta someObjProperty_0502,X
	lda Data_at8715+2,Y
	sta someObjProperty_0602,X
	lda Data_at8715+3,Y
	sta someObjProperty_0405,X
	lda Data_at8715+4,Y
	sta someObjProperty_0600,X
	lda Data_at8715+5,Y
	sta someObjProperty_0601,X
	lda Data_at8715+6,Y
	sta someObjProperty_0302,X
	lda Data_at8715+7,Y
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
	sta someObjProperty_0400,Y
	lda #$D8
	sta someObjProperty_0402,Y
	lda #$A0
	sta someObjProperty_0404,Y
	lda #$00
	sta someObjProperty_0405,Y
	sta someObjProperty_0503,Y
	sta someObjProperty_0504,Y
	sta someObjProperty_0505,Y
	sta someObjProperty_0302,Y
	sta someObjProperty_0303,Y
	sta someObjProperty_0604,Y
	sta someObjProperty_0605,Y
	sta someObjProperty_0602,Y
	lda #$FF
	sta hitPoints_0603,Y
	lda #$07
	sta someObjProperty_0600,Y
	lda #$07
	sta someObjProperty_0601,Y
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
	lda Data_at8D1D+0,Y
	sta someObjProperty_0501,X
	lda Data_at8D1D+1,Y
	sta someObjProperty_0502,X
	lda Data_at8D1D+2,Y
	cpy #$00
	beq :+
	clc
	adc #$02
	
	:
	sta someObjProperty_0602,X
	lda Data_at8D1D+3,Y
	sta someObjProperty_0302,X
	lda Data_at8D1D+4,Y
	sta someObjProperty_0600,X
	lda Data_at8D1D+5,Y
	sta someObjProperty_0601,X
	lda someObjProperty_0400
	clc
	adc Data_at8D1D+6,Y
	sta someObjProperty_0400,X
	lda someObjProperty_0402
	clc
	adc Data_at8D1D+7,Y
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
Data_at8D1D:
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
; X_FindFreeObjectSlot (return x)
; Check if flags 7 and 4 are set in $0434
; Starting at $0434 go over 32 slots stopping at
; the first FREE slot.
; Return the slot position in X
.proc X_FindFreeObjectSlot
	clc
	ldx #$30
	:
		lda someObjProperty_0404,X
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
	lda someObjProperty_0400,X
	sec
	sbc someObjProperty_0400
	bcs :+
	eor #$FF
	
	:
	rol var_4B
	sta var_4C
	lda someObjProperty_0402,X
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
	adc Data_at8E25,Y
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
	lda Data_at8E3F,X
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
	jsr X_FindFreeObjectSlot
	cpx #$F0
	bcs :+

	jsr UnknownSub18
	ldy var_4A
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
	
	:
	pla
	tay
	pla
	tax
	rts
.endproc
;
; $8E81
.proc UnknownSub18

	lda someObjProperty_0400,Y
	clc
	adc someObjProperty_0604,Y
	sta someObjProperty_0400,X
	lda someObjProperty_0401,Y
	adc #$00
	sta someObjProperty_0401,X
	lda someObjProperty_0402,Y
	clc
	adc someObjProperty_0605,Y
	sta someObjProperty_0402,X
	lda someObjProperty_0403,Y
	adc #$00
	sta someObjProperty_0403,X
	rts
.endproc
;
; $8EA6
.proc UnknownSub19
	lda Data_at8EBE+0,Y
	sta someObjProperty_0501,X
	lda Data_at8EBE+1,Y
	sta someObjProperty_0502,X
	lda #$00
	sta someObjProperty_0505,X
	sta someObjProperty_0503,X
	sta someObjProperty_0504,X
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
	lda Data_at9291,X
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
	lda Data_at92A8,X
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
	lda Data_at92BD,X
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
	lda Data_at92D4,X
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
	lda currentStage_15
	sec
	sbc #$01
	asl A
	tay
	lda (objectPtr_34),Y
	sta someObjProperty_0531 ; boss AI?
	iny
	lda (objectPtr_34),Y
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
	lda LivesGraphicData,X
	sta someObjProperty_0501,Y
	lda LivesGraphicData+1,X
	sta someObjProperty_0502,Y
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
		sta someObjProperty_0300,Y
		sta someObjProperty_0400,Y
		sta someObjProperty_0500,Y
		sta someObjProperty_0600,Y
		sta someObjProperty_0700,Y
		INY
		cpy #$DF
		bne :-
	rts 
.endproc
;
; $93E1
; ClearObjectsDescription
; Clear page $04 of RAM from $0400 to $0436
; This page can hold up to 9 different enemy types(?)
.proc ClearObjectsDescription
	pha
	txa
	pha
	tya
	pha
	ldy #$36
	lda #$00
	:
		sta someObjProperty_0400,Y
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
	lda currentStage_15
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
		lda HeartHUDData,Y
		sta OAM_0200,Y
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
		sta $0000,Y
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
	sta OAM_0200,Y	
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
		lda (addressPtr_32),Y
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
		lda (addressPtr_32),Y
		sta bgPalette_E0,X 
		iny
		inx
		cpx var_4D
		bne :-
	rts
.endproc
;
; $94AE
; LoadNametable_A
.proc LoadNametable_A
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
	lda (addressPtr_32),Y
	beq doneLoading
	cmp #$80
	bcc DistinctTiles
RepeatedTitles:
	lda #%01111111
	and (addressPtr_32),Y
	tax
	jsr NextBGByte_Y
	lda (addressPtr_32),Y
	:
		sta PpuData_2007
		dex
		bne :-
	jsr NextBGByte_Y
	jmp :++
	
	DistinctTiles:
	lda (addressPtr_32),Y
	tax
	:
		jsr NextBGByte_Y
		lda (addressPtr_32),Y
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
; LoadStage_A_X
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
	lda BackgroundData_E847+0,Y
	sta addressPtr_32+0
	lda BackgroundData_E847+1,Y
	sta addressPtr_32+1
	
	lda #$00
	ldy #$03
	jsr LoadPaletteIntoVRAM_A_Y
	
	lda #$00
	ldy #$03
	jsr LoadPaletteIntoRAM_A_Y
	
	ldy #$02
	lda (addressPtr_32),Y
	tay
	lda #$10
	jsr LoadPaletteIntoVRAM_A_Y
	
	ldy #$02
	lda (addressPtr_32),Y
	tay
	
	lda #$10
	jsr LoadPaletteIntoRAM_A_Y
	ldy #$00
	lda (addressPtr_32),Y
	
	pha
	iny
	lda (addressPtr_32),Y
	sta addressPtr_32+1
	pla
	sta addressPtr_32+0
	pla
	
	jsr LoadNametable_A
	
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
	lda Ctrl1_4016,X
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
			sbc #$10
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
	sta var_2A
	jsr ClearNametablePattern
	lda #$01
	jsr ClearNametablePattern
	lda #$00
	tax
	sta BankSwitching_FFF0+0,X
	inc currentStage_15
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
	lda EndCreditsData,Y
	sta addressPtr_32+0
	lda EndCreditsData+1,Y
	sta addressPtr_32+1
	ldy #$00
	lda (addressPtr_32),Y
	sta vramAddress_67+0
	iny
	lda (addressPtr_32),Y
	sta vramAddress_67+1
	iny
	loopLoadCredits:
		lda vramAddress_67+0
		sta PpuAddr_2006
		lda vramAddress_67+1
		sta PpuAddr_2006
		lda (addressPtr_32),Y
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
	sta currentStage_15
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
		lda Data_at97F5,Y
		sta OAM_0200,Y
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
	ldy currentStage_15
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
	jsr HandleScrollingControl
	lda screenScrollX_29
	sta PpuScroll_2005
	lda #$00
	sta PpuScroll_2005
	lda flagPPUControl_19
	sta PpuControl_2000
	
	lda frameCounter_12
	and #$01 	; Checking if this is an ODD frame
	bne :+		; Skip if ODD
	dec nextEnemyBatch_5C	; Decrement the counter for next enemy batch on EVEN frames
	
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
.proc HandleScrollingControl
	ldx flagGameMode_26
	bne :+
	inc frameScrollCtr_28
	lda frameScrollCtr_28
	cmp frameScrollAt_27
	bcc :+
	
	; doScrollBackground
	lda #$00
	sta frameScrollCtr_28
	jsr HandleStageScrolling 
	
	:
	rts
.endproc
;
; $A43E
.proc HandleStageScrolling
	inc screenScrollX_29
	lda screenScrollX_29
	bne doneWithScrolling
	ldx levelProgression_16
	
	; testIfScrolled_14_Screens:
	cpx #BG_SCROLL_LIMIT
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
	sta objectPtr_36+0
	lda someObjProperty_0502,X
	sta objectPtr_36+1
	ldy someObjProperty_0503,X
	
	ReplaceMeLabel_7:
	lda (objectPtr_36),Y
	bmi :+
	jmp ReplaceMeLabel_3
	
	:
	asl A
	bmi ReplaceMeLabel_1
	lsr A
	sbc #$00
	sta someObjProperty_0504,X
	
	ReplaceMeLabel_2:
	lda someObjProperty_0405,X
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
	adc someObjProperty_0400,X
	sta someObjProperty_0400,X
	sta var_40
	lda var_47
	adc someObjProperty_0401,X
	sta someObjProperty_0401,X
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
	adc someObjProperty_0402,X
	sta someObjProperty_0402,X
	sta objects_Y_42
	lda var_49
	adc someObjProperty_0403,X
	sta someObjProperty_0403,X
	sta var_43
	jmp ReplaceMeLabel_5
	
	ReplaceMeLabel_4:
	lda someObjProperty_0400,X
	sta var_40
	lda someObjProperty_0401,X
	sta var_41
	lda someObjProperty_0402,X
	sta objects_Y_42
	lda someObjProperty_0403,X
	sta var_43
	
	ReplaceMeLabel_5:
	inc someObjProperty_0503,X
	lda someObjProperty_0701,X
	tax
	lda Data_atA895+0,X
	sta addressPtr_32+0
	lda Data_atA895+1,X
	sta addressPtr_32+1
	ldx var_5F
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
	lda (objectPtr_36),Y
	and #$1F
	sta someObjProperty_0505,X
	
	loop:
		iny
		lda (objectPtr_36),Y
		tay
		lda (objectPtr_36),Y
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
	lda someObjProperty_0404,X
	ora #$08
	sta someObjProperty_0404,X
	jmp SecondPart
	
	:
	lda someObjProperty_0303,X
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
	sta someObjProperty_0302,X
	sta someObjProperty_0303,X
	
	:
	cmp #$05
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
	sta someObjProperty_0701,X
	tax
	lda Data_atA895+0,X
	sta addressPtr_32+0
	lda Data_atA895+1,X
	sta addressPtr_32+1
	iny
	ldx var_5F
	lda someObjProperty_0405,X
	bpl :+
	lda (objectPtr_36),Y
	clc
	adc var_0C
	jmp :++
	
	:
	lda (objectPtr_36),Y
	
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
	adc someObjProperty_0400,X
	sta someObjProperty_0400,X
	sta var_40
	lda var_47
	adc someObjProperty_0401,X
	sta someObjProperty_0401,X
	sta var_41
	iny
	lda someObjProperty_0405,X
	bpl :+
	lda (objectPtr_36),Y
	clc
	adc var_0D
	jmp :++
	
	:
	lda (objectPtr_36),Y
	
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
	adc someObjProperty_0402,X
	sta someObjProperty_0402,X
	sta objects_Y_42
	lda var_49
	adc someObjProperty_0403,X
	sta someObjProperty_0403,X
	sta var_43
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
	lda (addressPtr_32),Y
	bpl :+
	jmp ReplaceMeLabel_8
	
	:
	sta someObjProperty_0600,X
	lsr A
	lsr A
	lsr A
	clc
	adc #$01
	sta var_44
	iny
	lda (addressPtr_32),Y
	sta someObjProperty_0601,X
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
	lda (addressPtr_32),Y
	beq :+
	lda var_47
	bne :++
	lda var_43
	bne :++
	lda (addressPtr_32),Y ; XXX
	sta OAM_0200+OBJ_TILE,X	; tile #
	lda objects_Y_42				
	sta OAM_0200+OBJ_Y,X	; y 
	iny
	lda (addressPtr_32),Y
	sta OAM_0200+OBJ_ATT,X	; attributes
	lda objects_X_46
	sta OAM_0200+OBJ_X,X	; x
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
	sta OAM_0200+OBJ_Y,X
	iny
	lda (addressPtr_32),Y
	sta OAM_0200+OBJ_TILE,X
	iny
	lda (addressPtr_32),Y
	sta OAM_0200+OBJ_ATT,X
	lda var_40
	sta OAM_0200+OBJ_X,X
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