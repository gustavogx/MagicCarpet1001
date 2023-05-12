; Game Config.
.define STARTING_LIVES	$16
.define STARTING_POWER	$04
.define HEART_HEALTH_POINTS $50

; Engine Configuration

; Heart is object zero
; Other objects go after HEART
.define FIRST_OBJECT_SLOT $04

.define HEART_HUD_Y		$D8
.define HEART_OFFSCREEN $F8

.define BG_SCROLL_RATE	$02
	; $01 every frame 		(60fps)
	; $02 every other frame	(30fps) (original)
	; $03 every two frames 	(15fps)

.if BG_SCROLL_RATE = $01
	; 27 if BG_SCROLL_RATE = 1
	.define BG_SCROLL_LIMIT	 27
.elseif BG_SCROLL_RATE = $02
	; 14 if BG_SCROLL_RATE = 2 (original)
	.define BG_SCROLL_LIMIT	 14
.else 	
	; 9  if BG_SCROLL_RATE = 3
	.define BG_SCROLL_LIMIT	 9
.endif

.define SHOT_OBJECT_START	$0C
.define OBJECT_BYTE_SIZE	$06
.define FREE_SHOT_SLOTS		$06
.define FREE_OBJECT_SLOTS	$20
.define ENEMY_OBJECT_START	FREE_SHOT_SLOTS*OBJECT_BYTE_SIZE+SHOT_OBJECT_START

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

; macro GetObjectsIndexTable_Y
; Read the current stage index from currentStage_15
; Calculates the correct index on the object data file:
; Y(index) = (stage-1)*4
; Clobbers A and Y
.macro GetObjectsIndexTable_Y
	ldy currentStage_15
	dey
	tya
	asl A
	asl A
	tay
.endmacro

; macro Copy
; Copy data from <source> to <destination>
; Starts at an offset <begin> from <source>
; Ends at an offset <end> from <source>
; Clobbers A and Y
.macro Copy source,destination,begin,end
	ldy begin
:
	lda source,y
	sta destination,y
	iny
	cpy end
	bne :-
.endmacro

; macro Add16
; 16-bit addition
; Adds <value> to <address> and store the result at <address>
.macro Add16 address, value
	lda address+1
	clc
	adc value
	sta address+1
	lda address+0
	adc #$00
	sta address+0
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
.define counter_W_3C		$3C ; 2
.define var_3D				$3D	; 3
.define oamAddressPtr_3E	$3E ; 6 (word address)
; $3F low byte of $3E

.define var_40				$40	; 5
.define var_41				$41 ; 5
.define tile_Y_Lo_42		$42	; 7
.define tile_Y_Hi_43				$43 ; 6
.define var_44				$44 ; 2
.define counter_H_45				$45 ; 2
.define tile_X_Lo_46		$46 ; 6 
.define tile_X_Hi_47		$47	; 7
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
.define currentEnemyWave_5B	$5B ; 3
.define nextEnemyWave_5C	$5C ; 5
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

.define someObjProperty_0100 $0100 ; 1 only used once in UnusedFunction1

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
.define someObjProperty_0300 $0300 ; #10 of 10-byte file (also $0700)
.define someObjProperty_0301 $0301 ; #7 of 10-byte file
.define someObjProperty_0302 $0302 ; #6 of 10-byte file
.define someObjProperty_0303 $0303

.define someObjProperty_0333 $0333 ; 1 used once!

; page 04
.define someObjProperty_0400 $0400 ; playerX_0400
.define someObjProperty_0401 $0401
.define someObjProperty_0402 $0402 ; playerY_0402
.define someObjProperty_0403 $0403
.define someObjProperty_0404 $0404
.define someObjProperty_0405 $0405 ; #2 of 10-byte file (flags) BIT6 = can collide

; page 05
.define someObjProperty_0500 $0500
.define someObjProperty_0501 $0501 ; lo-byte of object AI??? address
.define someObjProperty_0502 $0502 ; hi-byte of object AI??? address
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
.define someObjProperty_0600 $0600 ; #3 of 10-byte file
.define someObjProperty_0601 $0601 ; #4 of 10-byte file
.define someObjProperty_0602 $0602 ; #1 of 10-byte file
.define healthPoints_0603 	 $0603 ; #5 of 10-byte file
.define someObjProperty_0604 $0604 ; #8 of 10-byte file ;; maybe speedX_0604
.define someObjProperty_0605 $0605 ; #9 of 10-byte file ;; maybe speedY_0604

; page 07
.define someObjProperty_0700 $0700 ; #10 of 10-byte file (also $0300)
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
		dex
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
	jsr ClearNametable_A
	lda #$01
	jsr ClearNametable_A
	
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
	sta nextEnemyWave_5C
	
	lda #$00
	sta input1_20
	sta inputPrev_22
	sta currentEnemyWave_5B
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

	Copy HeartHUDData, OAM_0200, #0, #4
	
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
; Inputs: nextEnemyWave_5C, currentEnemyWave_5B
; Variable nextEnemyWave_5C holds the timer for loading next enemy batch.
; If timer larger than or equal to $FA, spawn new batch.
.proc LoadEnemyBatch
	lda nextEnemyWave_5C 		; count down until next batch load
	cmp #$FA					; will load next batch if counter >= $FA 
	bcs :+						; continue if it is time to load
	jmp doneLoadingEnemyBatch	; exit 

	; MACRO that reads the stage number and returns the index 
	; (address offset) for this stage's object data.
	:
	GetObjectsIndexTable_Y
	; now Y contains the index

	lda ObjectsData_A885+0,Y	; lo-byte of stage's enemy data
	sta objectPtr_34+0
	lda ObjectsData_A885+1,Y	; hi-byte of stage's enemy data
	sta objectPtr_34+1

	lda currentEnemyWave_5B	; index for current enemy batch
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

		jsr FindFreeObjectSlot_rX; finds a free object slot and return it on X
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

	inc currentEnemyWave_5B

	lda nextEnemyWave_5C
	clc
	adc #$F0
	sta nextEnemyWave_5C

doneLoadingEnemyBatch:
	rts
.endproc
;
; $822F
.proc LoadEnemyType
	tya
	pha

	; MACRO that reads the stage number and returns the index 
	GetObjectsIndexTable_Y	
	; now Y contains the index

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
	sta healthPoints_0603,X		; stores #5 byte of 10
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
	lda healthPoints_0603,X
	sec
	sbc someObjProperty_0602,Y
	beq :+
	bcs :++
	
	:
	jsr UnknownSub9
	jmp :++
	
	:
	sta healthPoints_0603,X
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
	lda healthPoints_0603,Y
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
	sta healthPoints_0603,Y
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
; Checks if object with index in X hit something important.
; X = 0 is the player
.proc HandleObjectCollision
	txa
	pha
	tya
	pha
	lda someObjProperty_0405,X		; object status flags
	bit BIT_6						; check if the object is tangible (flag 6)
	bne :+							; if tangile (can collide) continue
	jmp doneWithObjectCollision		; exit
	
	:
	lda someObjProperty_0302,X		; what is this flag? if 
	bne :+							; this is useless, skips nothing at all

	:
	cmp #$06 ; maybe? BIT1+BIT2		; what does it checks?
	bne handlePlayerGotExtraLife	; skip to GotExtraLife
	
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
	sta healthPoints_0603
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
		jsr SpawnObject

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
; AddOneHeart
; Adds ONE HEART equivalent in health points to player.
; 
.proc AddOneHeart
	lda healthPoints_0603
	clc
	adc #HEART_HEALTH_POINTS
	
	bcc :+ 					; did not overflowed
	lda #$FF				; if overflowed, set it to maximum
	
	:			
	sta healthPoints_0603	; store it into player's health
	
	updateHeartDisplay:
		lda #HEART_HUD_Y
		sta OAM_0200		; since HEART is always Sprite #0, the first byte is its Y value
	
	rts
.endproc
;
; $86A9
; Load object var_58 from ROM to an empty slot X
.proc SpawnObject
	jsr FindFreeObjectSlot_rX
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
	sta healthPoints_0603
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
	sta healthPoints_0603,Y
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
	jsr FindFreeShotSlot_rX
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
	sta healthPoints_0603,X
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
; FindFreeShotSlot_rX (return x)
; Check if flags 7 and 4 are set in $0434
; Starting at $0434 go over 32 slots stopping at
; the first FREE slot.
; Return the slot position in X
.proc FindFreeShotSlot_rX
	clc
	ldx #SHOT_OBJECT_START ; $0C
	
	:
		lda someObjProperty_0404,X
		and #(BIT7+BIT4)
		beq :+
		txa
		adc #OBJECT_BYTE_SIZE ; $06
		tax
		cpx #(SHOT_OBJECT_START+FREE_SHOT_SLOTS*OBJECT_BYTE_SIZE) ; $30
		bcc :-	
	:
	rts
.endproc
;
; $8D60
; FindFreeObjectSlot_rX (return x)
; Check if flags 7 and 4 are set in $0434
; Starting at $0434 go over 32 slots stopping at
; the first FREE slot.
; Return the slot position in X
.proc FindFreeObjectSlot_rX
	clc
	ldx #ENEMY_OBJECT_START
	:
		lda someObjProperty_0404,X
		and #(BIT7+BIT4) ;%10010000 ; #$90
		beq :+
		txa
		adc #OBJECT_BYTE_SIZE; $06
		tax
		cpx #(ENEMY_OBJECT_START+FREE_OBJECT_SLOTS*OBJECT_BYTE_SIZE) ; $F0
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
	and #(ALL1-BIT3)	; turn off bit 3
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
	jsr FindFreeObjectSlot_rX
	cpx #$F0
	bcs :+ ; no slot available

	jsr UpdatePosition_ObjectX_EnemyY
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
	sta healthPoints_0603,X
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
; UpdatePosition_ObjectX_EnemyY
; Updates the position of an Object (X)
; by adding a displacement from an
; Enemy (Y) A.I.
.proc UpdatePosition_ObjectX_EnemyY

	; Add16 $0604 to $0400
	lda someObjProperty_0400,Y ; positionX_Lo
	clc
	adc someObjProperty_0604,Y ; speedX
	sta someObjProperty_0400,X 
	lda someObjProperty_0401,Y ; positionX_Hi
	adc #$00
	sta someObjProperty_0401,X

	; Add16 $0605 to $0402
	lda someObjProperty_0402,Y ; positionY_Lo
	clc
	adc someObjProperty_0605,Y ; speedY
	sta someObjProperty_0402,X
	lda someObjProperty_0403,Y ; positionY_Hi
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
.addr Data_at8F36, Data_at8F3F, Data_at8F4A, Data_at8F55
.addr Data_at8F5F, Data_at8F69, Data_at8F72, Data_at8F7D
.addr Data_at8F88, Data_at8F92, Data_at8F97, Data_at8FA0
.addr Data_at8FAB, Data_at8FB6, Data_at8FC0, Data_at8FC5
.addr Data_at8FCE, Data_at8FD9, Data_at8FE4, Data_at8FEE
.addr Data_at8FF3, Data_at8FFC, Data_at9007, Data_at9012
.addr Data_at901C, Data_at9021, Data_at902A, Data_at9035
.addr Data_at9040, Data_at904A, Data_at904F, Data_at9058
.addr Data_at9063, Data_at906E, Data_at9078, Data_at907D
.addr Data_at9086, Data_at9091, Data_at909C, Data_at90A6
.addr Data_at90AB, Data_at90B5, Data_at90BF, Data_at90C9
.addr Data_at9104, Data_at910E, Data_at9118, Data_at9122
.addr Data_at9128, Data_at9131, Data_at9137, Data_at913D
.addr Data_at9143, Data_at914C, Data_at9152, Data_at9158
.addr Data_at9193, Data_at91CE, Data_at9209, Data_at9244

;.incbin "rom-prg/objects/data-block-at8EBE-2.bin"

Data_at8F36: ; bubble shots (rocket beduins?)
;.incbin "rom-prg/objects/data-block-at8F36.bin"
.byte $16, $FE, $FE, $81, $16, $00, $00, $FE, $00
;.res 9

Data_at8F3F:
;.incbin "rom-prg/objects/data-block-at8F3F.bin"
.byte $16, $FF, $FF, $C2, $00, $16, $FF, $00, $81, $FE, $00
;.res 11

Data_at8F4A: ; bubble shots (bees?)
;.incbin "rom-prg/objects/data-block-at8F4A.bin"
.byte $16, $FE, $FF, $81, $C4, $00, $16, $00, $00, $FE, $00
;.res 11

Data_at8F55: ; bubble shots (rocket beduins?)
;.incbin "rom-prg/objects/data-block-at8F55.bin"
.byte $16, $FF, $00, $C2, $00, $16, $FF, $FF, $FE, $00
;.res 10

Data_at8F5F:
;.incbin "rom-prg/objects/data-block-at8F5F.bin"
.res 10

Data_at8F69:
;.incbin "rom-prg/objects/data-block-at8F69.bin"
.res 9

Data_at8F72:
;.incbin "rom-prg/objects/data-block-at8F72.bin"
.res 11

Data_at8F7D:
;.incbin "rom-prg/objects/data-block-at8F7D.bin"
.res 11

Data_at8F88:
;.incbin "rom-prg/objects/data-block-at8F88.bin"
.res 10

Data_at8F92:
;.incbin "rom-prg/objects/data-block-at8F92.bin"
.res 5

Data_at8F97:
;.incbin "rom-prg/objects/data-block-at8F97.bin"
.res 9

Data_at8FA0:
;.incbin "rom-prg/objects/data-block-at8FA0.bin"
.res 11

Data_at8FAB:
;.incbin "rom-prg/objects/data-block-at8FAB.bin"
.res 11

Data_at8FB6:
;.incbin "rom-prg/objects/data-block-at8FB6.bin"
.res 10

Data_at8FC0:
;.incbin "rom-prg/objects/data-block-at8FC0.bin"
.res 5

Data_at8FC5:
;.incbin "rom-prg/objects/data-block-at8FC5.bin"
.res 9

Data_at8FCE:
;.incbin "rom-prg/objects/data-block-at8FCE.bin"
.res 11

Data_at8FD9:
;.incbin "rom-prg/objects/data-block-at8FD9.bin"
.res 11

Data_at8FE4:
;.incbin "rom-prg/objects/data-block-at8FE4.bin"
.res 10

Data_at8FEE:
;.incbin "rom-prg/objects/data-block-at8FEE.bin"
.res 5

Data_at8FF3:
;.incbin "rom-prg/objects/data-block-at8FF3.bin"
.res 9

Data_at8FFC:
;.incbin "rom-prg/objects/data-block-at8FFC.bin"
.res 11

Data_at9007:
;.incbin "rom-prg/objects/data-block-at9007.bin"
.res 11

Data_at9012:
;.incbin "rom-prg/objects/data-block-at9012.bin"
.res 10

Data_at901C:
;.incbin "rom-prg/objects/data-block-at901C.bin"
.res 5

Data_at9021:
;.incbin "rom-prg/objects/data-block-at9021.bin"
.res 9

Data_at902A:
;.incbin "rom-prg/objects/data-block-at902A.bin"
.res 11

Data_at9035:
;.incbin "rom-prg/objects/data-block-at9035.bin"
.res 11

Data_at9040:
;.incbin "rom-prg/objects/data-block-at9040.bin"
.res 10

Data_at904A:
;.incbin "rom-prg/objects/data-block-at904A.bin"
.res 5

Data_at904F:
;.incbin "rom-prg/objects/data-block-at904F.bin"
.res 9

Data_at9058:
;.incbin "rom-prg/objects/data-block-at9058.bin"
.res 11

Data_at9063:
;.incbin "rom-prg/objects/data-block-at9063.bin"
.res 11

Data_at906E:
;.incbin "rom-prg/objects/data-block-at906E.bin"
.res 10

Data_at9078:
;.incbin "rom-prg/objects/data-block-at9078.bin"
.res 5

Data_at907D:
;.incbin "rom-prg/objects/data-block-at907D.bin"
.res 9

Data_at9086:
;.incbin "rom-prg/objects/data-block-at9086.bin"
.res 11

Data_at9091:
;.incbin "rom-prg/objects/data-block-at9091.bin"
.res 11

Data_at909C:
;.incbin "rom-prg/objects/data-block-at909C.bin"
.res 10

Data_at90A6:
;.incbin "rom-prg/objects/data-block-at90A6.bin"
.res 5

Data_at90AB:
;.incbin "rom-prg/objects/data-block-at90AB.bin"
.res 10

Data_at90B5:
;.incbin "rom-prg/objects/data-block-at90B5.bin"
.res 10

Data_at90BF:
;.incbin "rom-prg/objects/data-block-at90BF.bin"
.res 10

Data_at90C9: ; Boss 1 Sparkles
;.incbin "rom-prg/objects/data-block-at90C9.bin"
.byte $3D, $FD, $FE, $3C, $FD, $FF, $3D, $FD
.byte $FF, $3C, $FD, $00, $3D, $FD, $01, $3C
.byte $FD, $01, $3D, $FD, $02, $3C, $FD, $01
.byte $3D, $FE, $02, $3C, $FF, $03, $3D, $01
.byte $03, $3C, $02, $02, $3D, $03, $01, $3C
.byte $03, $FF, $3D, $02, $FE, $3C, $01, $FD
.byte $3D, $FF, $FD, $3C, $FE, $FE, $3D, $FD
.byte $FF, $FE, $00
;.res 59

Data_at9104:
;.incbin "rom-prg/objects/data-block-at9104.bin"
.res 10

Data_at910E:
;.incbin "rom-prg/objects/data-block-at910E.bin"
.res 10

Data_at9118:
;.incbin "rom-prg/objects/data-block-at9118.bin"
.res 10

Data_at9122:
;.incbin "rom-prg/objects/data-block-at9122.bin"
.res 6

Data_at9128:
;.incbin "rom-prg/objects/data-block-at9128.bin"
.res 9

Data_at9131:
;.incbin "rom-prg/objects/data-block-at9131.bin"
.res 6

Data_at9137:
;.incbin "rom-prg/objects/data-block-at9137.bin"
.res 6

Data_at913D:
;.incbin "rom-prg/objects/data-block-at913D.bin"
.res 6

Data_at9143:
;.incbin "rom-prg/objects/data-block-at9143.bin"
.res 9

Data_at914C:
;.incbin "rom-prg/objects/data-block-at914C.bin"
.res 6

Data_at9152:
;.incbin "rom-prg/objects/data-block-at9152.bin"
.res 6

Data_at9158:
;.incbin "rom-prg/objects/data-block-at9158.bin"
.byte $18, $FE, $FC, $17, $FE, $FD, $18, $FE
.byte $FD, $17, $FE, $FF, $18, $FE, $00, $17
.byte $FE, $00, $18, $FE, $01, $17, $FE, $00
.byte $18, $FF, $01, $17, $00, $02, $18, $00
.byte $02, $17, $01, $01, $18, $02, $00, $17
.byte $02, $FD, $18, $01, $FC, $17, $00, $FB
.byte $18, $00, $FB, $17, $FF, $FC, $18, $FE
.byte $FD, $FE, $00
;.res 59

Data_at9193:
;.incbin "rom-prg/objects/data-block-at9193.bin"
.byte $18, $FD, $FC, $17, $FD, $FD, $18, $FD
.byte $FD, $17, $FD, $FF, $18, $FD, $01, $17
.byte $FD, $01, $18, $FD, $02, $17, $FD, $01
.byte $18, $FE, $02, $17, $FF, $03, $18, $01
.byte $03, $17, $02, $02, $18, $03, $01, $17
.byte $03, $FE, $18, $02, $FD, $17, $01, $FC
.byte $18, $FF, $FC, $17, $FD, $FC, $18, $FC
.byte $FD, $FE, $00
;.res 59

Data_at91CE:
;.incbin "rom-prg/objects/data-block-at91CE.bin"
.byte $18, $FD, $FE, $17, $FD, $FF, $18, $FD
.byte $FF, $17, $FD, $00, $18, $FD, $01, $17
.byte $FD, $01, $18, $FD, $02, $17, $FD, $01
.byte $18, $FD, $02, $17, $FE, $03, $18, $00
.byte $03, $17, $01, $02, $18, $02, $01, $17
.byte $02, $FF, $18, $01, $FE, $17, $00, $FD
.byte $18, $FE, $FD, $17, $FD, $FE, $18, $FC
.byte $FF, $FE, $00
;.res 59

Data_at9209:
;.incbin "rom-prg/objects/data-block-at9209.bin"
.byte $18, $FD, $04, $17, $FD, $03, $18, $FD
.byte $03, $17, $FD, $01, $18, $FD, $FF, $17
.byte $FD, $FF, $18, $FD, $FE, $17, $FD, $FF
.byte $18, $FE, $FE, $17, $FF, $FD, $18, $01
.byte $FD, $17, $02, $FE, $18, $03, $FF, $17
.byte $03, $02, $18, $02, $03, $17, $01, $04
.byte $18, $FF, $04, $17, $FD, $04, $18, $FC
.byte $03, $FE, $00
;.res 59

Data_at9244:
;.incbin "rom-prg/objects/data-block-at9244.bin"
.byte $18, $FE, $04, $17, $FE, $03, $18, $FE 
.byte $03, $17, $FE, $01, $18, $FE, $00, $17
.byte $FE, $00, $18, $FE, $FF, $17, $FE, $00
.byte $18, $FF, $FF, $17, $00, $FE, $18, $00
.byte $FE, $17, $01, $FF, $18, $02, $00, $17
.byte $02, $03, $18, $01, $04, $17, $00, $05
.byte $18, $00, $05, $17, $FF, $04, $18, $FE
.byte $03, $FE, $00
;.res 59


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
; Clobbers A
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
	lda #<Data_at932D ;; see data below XXX
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
;
; $932D
Data_at932D:
;.incbin "rom-prg/objects/data-block-at932D.bin"
.addr Data_at9335, Data_at933D
.addr Data_at9345, Data_at934D

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
	lda LivesGraphicData+0,X
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
		iny
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

	Copy HeartHUDData, OAM_0200, #1, #4

	lda healthPoints_0603
	pha
	jsr ClearPages_03_to_07_From_00
	pla
	sta healthPoints_0603
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
	jsr ClearNametable_A
	lda #$01
	jsr ClearNametable_A
	doClearZeroPage:
	lda #$00
	tay
	loopClearZeroPage:
		sta $0000,Y
		iny
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
	iny	
	bne :-
	rts 	
.endproc
;
; $9464
; ClearNametable_A
; Clear all bytes (tile 0)
; Set all attributes to palette 3
; Starting point is defined by A as an offset from $2000
;	A=0 : Nametable 0 : $2000
;	A=1 : Nametable 1 : $2400
;	A=2 : Nametable 2 : $2800
;	A=3 : Nametable 3 : $2C00
; Since this rom uses vertical mirroring, A=2 or 3 are
; never used, because: 
; 	A=2 : Nametable 0 (same as 2)
; 	A=3 : Nametable 1 (same as 3)
.proc ClearNametable_A
	asl A
	asl A
	clc	
	adc #$20
	sta PpuAddr_2006
	lda #$00
	sta PpuAddr_2006
	; clear pattern
	ldx #$20		; 32 columns
	:
		ldy #$1E	; 30 rows
		:
			sta PpuData_2007
			dey
			bne :-
		dex
		bne :--
	; clear attributes
	lda #$FF		; all tiles using palette 3
	ldx #$40
	:
		sta PpuData_2007
		dex
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
	jsr ClearNametable_A
	lda #$01
	jsr ClearNametable_A
	lda #$00
	tax
	sta BankSwitching_FFF0,X
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
	jsr ClearNametable_A
	lda #$01
	jsr ClearNametable_A
	lda #$02
	tax
	sta BankSwitching_FFF0,X
	lda flagPPUControl_17
	and #(ALL1-BIT4)
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
	sta PpuScroll_2005  ; reset scrolling
	sta PpuScroll_2005
	
	: 		; End of Credits
	jmp :-  ; This is the shortest loop to soft lock the game. Must Reset!
.endproc
;
; $96AC
; RollEndCredits
; Loads the End Credits from address EndCreditsData
; A select which phrase to write (there are five)
.proc RollEndCredits
	; shifts left to compensate for the fact that
	; each address is a word (16bit)
	asl A
	tay
	lda EndCreditsData+0,Y
	sta addressPtr_32+0
	lda EndCreditsData+1,Y
	sta addressPtr_32+1
	; addressPtr_32 holds the address for the phrase
	; the first two bytes are the coordinates where to write
	; (actually, the address in vram)
	; Store the coordinates at vramAddress_67
	ldy #$00
	lda (addressPtr_32),Y
	sta vramAddress_67+0
	iny
	lda (addressPtr_32),Y
	sta vramAddress_67+1
	iny
	; Loop over all the caracters until
	; until a control character $FF is found
	loopLoadCredits:
		; move "cursor" to the correct position
		lda vramAddress_67+0
		sta PpuAddr_2006
		lda vramAddress_67+1
		sta PpuAddr_2006
		; load the next character (ASCII code)
		lda (addressPtr_32),Y
		; if "EOF", finish writing line.
		cmp #$FF
		beq leaveEndCredits
		; if "SPACE", write character $OO
		cmp #$20
		bne :+
		lda #$00
		sta PpuData_2007
		lda #$00
		sta PpuScroll_2005 ; reset scrolling
		sta PpuScroll_2005
		beq :++

		: 	; writing a character
		sec
		sbc #$36 ; subtract offset to convert from ASCII to CHR
		sta PpuData_2007
		lda #$00
		sta PpuScroll_2005 ; reset scrolling
		sta PpuScroll_2005
		
		; play a sound effect
		lda #$0A
		sta soundAddress_8D
		nop;
		nop;
		nop;jsr PlaySFX

		: ; advance to next screen position
		Add16 vramAddress_67, #1
		
		; wait 7 vblanks between characters
		ldx #$07
		:
			jsr WaitVBlank
			dex
			bne :-
		iny
		bne loopLoadCredits
	
	; play another sound
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

	Copy Data_at97F5, OAM_0200, #$00, #$20

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

;.res 1293

; $9D22 data
Data_at9D22:
;.incbin "rom-prg/sound/sound-data-at9D32.bin"

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
	dec nextEnemyWave_5C	; Decrement the counter for next enemy batch on EVEN frames
	
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
.proc UnusedFunction1
	
	:
	jsr UnusedFunction2
	bit someObjProperty_0100
	dex
	bne :-
	rts
.endproc
;
; $A462
.proc UnusedFunction2
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
	lda (objectPtr_36),Y ; reads which object to load
	bmi :+				 ; if index is negative, skip ahead
	jmp RetrieveObject   ; if index is positive, will load
	
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
	sta tile_X_Hi_47
	lda var_0C
	clc
	adc someObjProperty_0400,X
	sta someObjProperty_0400,X
	sta var_40
	lda tile_X_Hi_47
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
	sta tile_Y_Lo_42
	lda var_49
	adc someObjProperty_0403,X
	sta someObjProperty_0403,X
	sta tile_Y_Hi_43
	jmp ReplaceMeLabel_5
	
	ReplaceMeLabel_4:
	lda someObjProperty_0400,X
	sta var_40
	lda someObjProperty_0401,X
	sta var_41
	lda someObjProperty_0402,X
	sta tile_Y_Lo_42
	lda someObjProperty_0403,X
	sta tile_Y_Hi_43
	
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
		jmp RetrieveObject
		
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
	
	RetrieveObject:				; A holds index for object to be loaded
	asl A						; index is doubled since addresses are 16bit (double stride)
	sta someObjProperty_0701,X 	; store obj index
	tax							; start using index as X offset
	lda Data_atA895+0,X 		; Data_atA895 is the animation frames book.
	sta addressPtr_32+0
	lda Data_atA895+1,X
	sta addressPtr_32+1 		; Now addressPtr_32 points to the animation frame
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
	sta tile_X_Lo_46
	bpl :+
	lda #$FF
	bne :++
	
	:
	lda #$00
	
	:
	sta tile_X_Hi_47
	lda tile_X_Lo_46
	clc
	adc someObjProperty_0400,X
	sta someObjProperty_0400,X
	sta var_40
	lda tile_X_Hi_47
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
	sta tile_Y_Lo_42
	lda var_49
	adc someObjProperty_0403,X
	sta someObjProperty_0403,X
	sta tile_Y_Hi_43
	iny
	tya
	sta someObjProperty_0503,X
	
	ReplaceMeLabel_6:
	lda someObjProperty_0404,X
	and #BIT5
	bne :+
	jmp SecondPart
	
	:
	lda someObjProperty_0405,X
	and #(BIT3+BIT4)
	beq :+
	lda frameCounter_12
	and #(BIT0+BIT1)
	bne :+
	dec someObjProperty_0300,X
	lda someObjProperty_0300,X
	bne :+
	lda someObjProperty_0404,X
	ora #BIT3
	sta someObjProperty_0404,X
	
	; loads a frame of animation
	; X indexes the object
	; Y indexes the file being loaded
	:				
	ldy #$00			  ; starts from first tile
	lda (addressPtr_32),Y ; reads object WIDTH in pixels
	bpl :+				  ; if positive, continue
	jmp ReplaceMeLabel_8  ; if negative, do something else
	
	:
	sta someObjProperty_0600,X	; stores WIDTH
	lsr A						; divide by 8 (get size in tiles)
	lsr A
	lsr A
	clc		
	adc #$01					; add 1
	sta var_44  				; store W in temp variable
	iny							; next value
	lda (addressPtr_32),Y		; reads	object HEIGHT in pixels
	sta someObjProperty_0601,X	; store HEIGHT
	lsr A						; divide by 8 (get size in tiles)
	lsr A
	lsr A
	clc
	adc #$01					; add 1
	sta counter_H_45			; store H in temp variable
	iny							; next value
	ldx oamAddressPtr_3E		; loads next OAM free address
	
	ReplaceMeLabel_11:
	lda var_44
	sta counter_W_3C			; counts tiles in X
	lda var_40					; X position LO
	sta tile_X_Lo_46
	lda var_41					; X position HI
	sta tile_X_Hi_47
	
	
	loopLoadFrameTiles:			; load frame tiles
	lda (addressPtr_32),Y		; load tile index
	beq :+						; if tile $00 (blank), skip
	lda tile_X_Hi_47			; check X HI
	bne :++						; break if X HI not zero
	lda tile_Y_Hi_43			; check Y HI
	bne :++						; break if Y HI not zero
	lda (addressPtr_32),Y 		; load tile index from file
	sta OAM_0200+OBJ_TILE,X		; store tile index in OAM
	lda tile_Y_Lo_42			; load tile Y position from RAM
	sta OAM_0200+OBJ_Y,X		; store tile Y position in OAM 
	iny							; next value
	lda (addressPtr_32),Y		; load tile attributes
	sta OAM_0200+OBJ_ATT,X		; store tile attributes in OAM
	lda tile_X_Lo_46			; load tile X position from RAM
	sta OAM_0200+OBJ_X,X		; store tile X position in OAM
	txa
	clc
	adc #$04					; 4-byte stride in OAM
	beq ReplaceMeLabel_9		; break if overflow
	tax	
	
	; also arive here if found a blank tile
	:
	iny						; next value
	dec counter_W_3C		; decrement W counter
	beq :++					; break if end-of-line
	lda tile_X_Lo_46		
	adc #$08
	sta tile_X_Lo_46		; step 8 pixels in X
	bcc loopLoadFrameTiles	; loop if less than $FF
	inc tile_X_Hi_47		; add carry to X_HI
	jmp loopLoadFrameTiles  ; loop
	
	:
	iny
	jmp :--
	
	: ; end-of-line
	dec counter_H_45		; decrement H counter
	beq :+					; break if end-of-file
	lda tile_Y_Lo_42		
	clc
	adc #$08
	sta tile_Y_Lo_42		; step 8 pixels in Y
	bcc ReplaceMeLabel_11	; if not overflow, loop to next frame
	inc tile_Y_Hi_43		; if overflow, add to Y HI
	jmp ReplaceMeLabel_11	; loop to next frame
	
	:
	stx oamAddressPtr_3E	; stores back next OAM free address
	
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
	lda tile_Y_Hi_43
	bne SecondPart
	lda tile_Y_Lo_42
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
	lda healthPoints_0603
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