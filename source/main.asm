.define DISABLE_SOUND 0
.include "macros.asm"
.include "defines.asm"
.include "engine-config.asm"

; song names
.define OPENING_SONG 	$00; 00 Opening song
.define STAGE_SONG 		$01; 01 Stage song
.define BOSS_SONG 		$02; 02 Boss song
.define ARROW_SHOT_SFX 	$03; 03 Arrow shot SFX
.define ENEMY_DEATH_SFX $04; 04 Enemy death SFX
.define PLAYER_DEATH_SFX $05; 05 Player death SFX
.define EXTRA_LIFE_SFX 	$06; 06 Extra life SFX
.define GAME_START_SFX 	$07; 07 Game Start / Item grab SFX
.define GAME_PAUSE_SFX 	$08; 08 Pause
.define BOSS_DEATH_SFX 	$09; 09 Boss death SFX
.define ENEMY_HIT_SFX 	$0A; 0A Enemy hit SFX
.define ENDING_SONG 	$0B; 0B Ending song
.define MAGIC_LAMP_SFX 	$0C; 0C Magic Lamp SFX

.segment "HEADER"
.include "inesheader.inc"

.segment "ZEROPAGE" ; LSB 0 - FF
.res 1 ; $00
.res 1 ; $01
.res 1 ; $02
.res 1 ; $03
.res 1 ; $04
.res 1 ; $05
.res 1 ; $06
.res 1 ; $07
.res 1 ; $08
.res 1 ; $09
.res 1 ; $0a
.res 1 ; $0b
var_0C:	.res 1 ; $0c
var_0D:	.res 1 ; $0d
updateDuringVBlank_0E:	.res 1 ; $0e
updateDuringVBlank_0F:	.res 1 ; $0f
.res 1 ; $10
livesCounter_11:		.res 1	; $11 ; 5
frameCounter_12:		.res 1	; $12 ; 8
frameCounter62_13:		.res 1	; $13 ; 4
aliveTimer_14:			.res 1	; $14 ; 6
currentStage_15:		.res 1	; $15 ; 14 ; Stage Index 0(opening), 1, 2, 3, 4, and 5(ending)
levelProgression_16:	.res 1	; $16 ; 3
flagPPUControl_17:		.res 1	; $17 ; 8
flagPPUMask_18:			.res 1	; $18 ; 6
flagPPUControl_19:		.res 1	; $19 ; 10
flagBossFight_1A:		.res 1	; $1A ; 5
flagNextLevel_1B:		.res 1	; $1B ; 6
flagPause_1C:			.res 1	; $1C ; 4
.res 1
flagPlayerHit_1E:		.res 1	; $1E ; 3
flagUnknown_1F:			.res 1	; $1F ; 2

input1_20	:			.res 1	; $20 ; 17
.res 1 ; $21
inputPrev_22:			.res 1	; $22 ; 11
.res 1 ; $23
.res 1 ; $24
.res 1 ; $25
flagGameMode_26:		.res 1	; $26 ; 4
frameScrollAt_27:		.res 1	; $27 ; 2
frameScrollCtr_28:		.res 1	; $28 ; 3
screenScrollX_29:		.res 1	; $29 ; 7
var_2A:					.res 1	; $2A	; 3
var_2B:					.res 1	; $2B	; 4
enemySetSize_2C:		.res 1	; $2C	; 4
var_2D:					.res 1	; $2D	; 4
flagGenDrop_2E:			.res 1	; $2E	; 4
.res 1 ; $2F

.res 1 ; $30
.res 1 ; $31
addressPtr_32:			.res 2	; $32 ; 32 (word address)
; $33 low byte of $32
objectPtr_34:			.res 2	; $34 ; 14 (word address); object address in rom
; $35 low byte of $34
objectPtr_36:			.res 2	; $36 ; 10 (word address)
; $37 low byte of $37
objectPtr_38:			.res 2	; $38 ; 14 (word address)
; $39 low byte of $38
objectPtr_3A:			.res 2	; $3A ; 13 (word address)
; $3B low byte of $3A
counter_W_3C:			.res 1	; $3C ; 2
beingUpdated_3D:					.res 1	; $3D ; 3
oamAddressPtr_3E:		.res 2	; $3E ; 6 (word address)
; $3F low byte of $3E

var_40:					.res 1	; $40 ; 5
var_41:					.res 1	; $41 ; 5
tile_Y_Lo_42:			.res 1	; $42 ; 7
tile_Y_Hi_43:			.res 1	; $43 ; 6
var_44:					.res 1	; $44 ; 2
counter_H_45:			.res 1	; $45 ; 2
tile_X_Lo_46:			.res 1	; $46 ; 6 
tile_X_Hi_47:			.res 1	; $47 ; 7
var_48:					.res 1	; $48 ; 2
var_49:					.res 1	; $49 ; 4
projectileIndex_4A:		.res 1	; $4A ; 7
velocityCarry_4B:		.res 1	; $4B ; 5
velocityComponent_4C:	.res 1	; $4C ; 6
iterator_4D:			.res 1	; $4D ; 6
flagLoadShots_4E:		.res 1	; $4E ; 3
hitboxXRight_4F:		.res 1	; $4F ; 2

hitboxXLeft_50:			.res 1	; $50 ; 4
hitboxYBottom_51:		.res 1	; $51 ; 4
hitboxYTop_52:			.res 1	; $52 ; 4
.res 1 ; $53
new_X_Lo_54:			.res 1	; $54 ; 5 ; used by SpawnObject and SpawnEnemy
new_X_Hi_55:			.res 1	; $55 ; 5 ; object loading property
new_Y_Lo_56:			.res 1	; $56 ; 5 ; object loading property
new_Y_Hi_57:			.res 1	; $57 ; 5 ; object loading property
objectType_58:			.res 1	; $58 ; 5
objIndexStep_59:		.res 1	; $59 ; 5 ; it is either +6 or -6
var_5A:					.res 1	; $5A ; 3
currentEnemyWave_5B:	.res 1	; $5B ; 3
nextEnemyWave_5C:		.res 1	; $5C ; 5
.res 1 ; $5D
var_5E:					.res 1	; $5E ; 2
objectIndex_5F:			.res 1	; $5F ; 9

arrowsFlying_60:		.res 1	; $60 ; 7
.res 1 ; $61
flagPlayerHasShot_62:	.res 1 ; $62 ; 3
.res 1 ; $63
powerLevel_64:			.res 1	; $64 ; 10
.res 1 ; $65
speedLevel_66:			.res 1	; $66 ; 6
vramAddress_67:			.res 2	; $67 ; 3
; $68 low byte of $67
.res 1 ; $69
.res 1 ; $6a
.res 1 ; $6b
.res 1 ; $6c
.res 1 ; $6d
.res 1 ; $6e
.res 1 ; $6f

flagSound_70:			.res 1	; $70
.res 1 ; $71
soundEngineArray_72: 	.res 1 	; $72
.res 1 ; $73
.res 1 ; $74
.res 1 ; $75
soundEngine_76:			.res 1 ; $76
.res 1 ; $77
.res 1 ; $78
.res 1 ; $79
soundEngineAddrList_7A:	.res 1 ; $7A
.res 1 ; $7B
.res 1 ; $7C
.res 1 ; $7D
.res 1 ; $7E
.res 1 ; $7F

.res 1 ; $80
.res 1 ; $81
soundEngine_82:			.res 1 ; $82
soundEngine_83:			.res 1 ; $83
.res 1 ; $84
.res 1 ; $85
.res 1 ; $86
.res 1 ; $87
.res 1 ; $88
.res 1 ; $89
soundEngineAddress_8A:	.res 2 ; $8A $8B
; $8B
soundEngine_8C: 		.res 1 ; $8C
soundIndex_8D:			.res 1	; $8D
flagUpdateSoundAtVBlank_8E:	.res 1	; $8E
flagPlaySFX_8F:			.res 1	; $8F

soundEngine_90:		.res 1 ; $90
.res 1 ; $91
.res 1 ; $92
.res 1 ; $93
soundEngine_94:		.res 1 ; $94
.res 1 ; $95
.res 1 ; $96
.res 1 ; $97
square0Duty_98:		.res 1 ; $98
square0Sweep_99:	.res 1 ; $98
square0Timer_9A:	.res 1 ; $9A
square0Length_9B:	.res 1 ; $9A
square1Duty_9C:		.res 1 ; $9C
square1Sweep_9D:	.res 1 ; $9D
square1Timer_9E:	.res 1 ; $9E
square1Length_9F:	.res 1 ; $9F


triangleLinear_A0:	.res 3 ; $A0
.res 1 ; $A3
noiseVolume_A4:	.res 3 ; $A4
.res 1 ; $A7
soundEngineAddr_A8:	.res 2 ; $A8
; $A9
.res 1 ; $AA
.res 1 ; $AB
.res 1 ; $AC
.res 1 ; $AD
.res 1 ; $AE
.res 1 ; $AF

.res 1 ; $B0
.res 1 ; $B1
.res 1 ; $B2
.res 1 ; $B3
.res 1 ; $B4
.res 1 ; $B5
.res 1 ; $B6
.res 1 ; $B7
soundEngineAddr_B8:	.res 2 ; $B8 $B9
.res 1 ; $BA
.res 1 ; $BB
.res 1 ; $BC
.res 1 ; $BD
.res 1 ; $BE
.res 1 ; $BF

soundEngine_C0: .res 1 ; $C0
soundEngine_C1:	.res 1 ; $C1
.res 1 ; $C2
.res 1 ; $C3
.res 1 ; $C4
.res 1 ; $C5
.res 1 ; $C6
.res 1 ; $C7
.res 1 ; $C8
flagAPUStatus_C9:		.res 1	; $C9
.res 1 ; $CA
.res 1 ; $CB
.res 1 ; $CC
.res 1 ; $CD
.res 1 ; $CE
.res 1 ; $CF

.res 16 ; $D0

paletteRAM_E0:			.res 32	; $E0 ; 4


.segment "SPRITES" ; LSB 0 - FF

.segment "RAM" ; LSB 0100 - 07FF

.define someObjProperty_0100 $0100 ; 1 only used once in UnusedFunction1

; page 02 - OAM
.define OBJ_Y 		0
.define OBJ_TILE 	1
.define OBJ_ATT 	2
.define OBJ_X 		3

; page 02
.define OAM_0200	RAMPage_2 ; Y
;.define someObjProperty_0200 	$0200 ; Y
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
.define object_X_Lo_0400 $0400 ; object_X_Lo_0400
.define object_X_Hi_0401 $0401 ; object_X_Hi_0401
.define object_Y_Lo_0402 $0402 ; object_Y_Lo_0402
.define object_Y_Hi_0403 $0403 ; object_Y_Hi_0403

.define object_Attrib_1_0404 $0404
; object_Attrib_1_0404   7654 3210
; 						 |||| |||+-- 0:
;						 |||| ||+--- 1:
;						 |||| |+---- 2:
;						 |||| +----- 3:
;						 |||+------- 4: 
;						 ||+-------- 5: Player can shoot
;						 |+--------- 6:
;						 +---------- 7: Object is valid OR? flag if object has unresolved collision

.define object_Attrib_2_0405 $0405 ; #2 of 10-byte file (flags) 
; object_Attrib_2_0405   7654 3210
; 						 |||| |||+-- 0:
;						 |||| ||+--- 1: Enemy is part of a set
;						 |||| |+---- 2:
;						 |||| +----- 3:
;						 |||+------- 4: Enemy is a boss 
;						 ||+-------- 5:
;						 |+--------- 6: Obj can collide
;						 +---------- 7:
.define OBJPROP_PARTOF_SET 	BIT_1
.define OBJPROP_STAGE_BOSS	BIT_4
.define OBJPROP_CAN_COLLIDE	BIT_6

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

.define page_5_Gap		 	RAMPage_6-someObjProperty_0535-1

; page 06
.define objectWidth_0600 		$0600 ; #3 of 10-byte file
.define objectHeight_0601 		$0601 ; #4 of 10-byte file
.define someObjProperty_0602 	$0602 ; #1 of 10-byte file
.define healthPoints_0603 	 	$0603 ; #5 of 10-byte file
.define objectSpeed_X_0604 		$0604 ; #8 of 10-byte file 
.define objectSpeed_Y_0605 		$0605 ; #9 of 10-byte file

; page 07
.define someObjProperty_0700 $0700 ; #10 of 10-byte file (also $0300)
.define someObjProperty_0701 $0701
.define objectHitBox_Left_X_0702 	$0702	; maybe vertices of hit box
.define objectHitBox_Right_X_0703 	$0703	; maybe vertices of hit box
.define objectHitBox_Top_Y_0704 	$0704	; maybe vertices of hit box
.define objectHitBox_Bottom_Y_0705 	$0705	; maybe vertices of hit box

.segment "STARTUP"


; $8000
; These next 8 addresses in ROM hold
; a sequence of bit flags.
; This is done this way so flags can be tested
; with the BIT instruction, which does not
; have an immediate mode (can't be tested with a constant)
BIT_0:	.byte FLAG_0
BIT_1:	.byte FLAG_1
BIT_2:	.byte FLAG_2
BIT_3:	.byte FLAG_3
BIT_4:	.byte FLAG_4
BIT_5:	.byte FLAG_5
BIT_6:	.byte FLAG_6
BIT_7:	.byte FLAG_7

.define BIT_BUTTON_RIGHT	BIT_0
.define BIT_BUTTON_LEFT		BIT_1
.define BIT_BUTTON_DOWN		BIT_2
.define BIT_BUTTON_UP		BIT_3
.define BIT_BUTTON_START	BIT_4
.define BIT_BUTTON_SELECT	BIT_5
.define BIT_BUTTON_B		BIT_6
.define BIT_BUTTON_A		BIT_7

.define BUTTON_RIGHT	FLAG_0
.define BUTTON_LEFT		FLAG_1
.define BUTTON_DOWN		FLAG_2
.define BUTTON_UP		FLAG_3
.define BUTTON_START	FLAG_4
.define BUTTON_SELECT	FLAG_5
.define BUTTON_B		FLAG_6
.define BUTTON_A		FLAG_7
; $8008
HeartHUDData:
.byte HEART_HUD_Y, HEART_HUD_TILE, HEART_HUD_ATT, HEART_HUD_X

; 800C - 800F
BankSequenceArray:
.byte Stage1Bank, Stage2Bank, Stage3Bank, Stage4Bank

; $8010
; Reset handler, called by reset interrupt
HandleReset:
	lda #(FLAG_7+FLAG_6)		; flags %1100 0000
	sta Ctrl2_FrameCtr_4017
	
	; PPU Warm up
	ldx #$10 ; Wait 16 cycles for PPU to reach its stable state
	:	
		lda PpuStatus_2002
		dex
		bne :-

	lda BankSwitching_FFF0	; Loads #$00 from ROM filling (dangerous!)
	sta BankSwitching_FFF0  ; Set mapper to Bank0
	
	ldx #$00
	jsr SetupAfterReset	
	jsr InitializeObjectIndexStep

	StartSoundEngine

	lda #$01 
	sta flagGameMode_26

	lda #$00 
	tax
	jsr LoadStage

	lda #$01
	ldx #$01
	jsr LoadStage

	lda #(FLAG_7+FLAG_3) 		; flags %1000 1000
	TurnOFF	FLAG_3			; and #(ALL1-FLAG_3) ; flags %1111 0111 (Why?)
	sta flagPPUControl_17
	sta flagPPUControl_19

	lda #(FLAG_4+FLAG_3+FLAG_2)
	sta flagPPUMask_18

	lda #$00 ; Start at the opening screen
	sta currentStage_15
	
	lda #STARTING_POWER
	sta powerLevel_64
	
	lda #STARTING_LIVES
	sta livesCounter_11
	
	lda #$00
	sta flagPlaySFX_8F
	sta PpuScroll_2005
	sta PpuScroll_2005
	
	jsr RenderON
	
	PlaySoundForever #OPENING_SONG
	; 00 Opening song
	; 01 Stage song
	; 02 Boss song
	; 03 Arrow shot SFX
	; 04 Enemy death SFX
	; 05 Player death SFX
	; 06 Extra life SFX
	; 07 Game Start / Item grab SFX
	; 08 Pause
	; 09 Boss death SFX (played as SONG for looping)
	; 0A Enemy hit SFX
	; 0B Ending song

WaitForPressStart:
	
	lda #$00
	jsr ReadControl_A
	lda input1_20
	
	checkInputStart:
	cmp #FLAG_4 ; equivalent to BIT_BUTTON_START
	beq :+
	jmp WaitForPressStart

:
	sta inputPrev_22
	:
		lda input1_20
		cmp inputPrev_22
		beq :-

	StopPlaying
	PlaySoundOnce #GAME_START_SFX
	
	lda #$00
	sta currentStage_15
	jmp HandleStageClear ; Check what this one does

StartingNewStage:

	jsr RenderingOFF

	ResetSoundEngine 

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
	
	lda #ZERO				; no flags %0000 0000
	sta flagGameMode_26
	
	ldx #BG_SCROLL_RATE		; how fast to update backgrounds
	stx frameScrollAt_27
	
	ldx #$01				; counts how many screen have scrolled
	stx levelProgression_16
	
	lda #(FLAG_4+FLAG_3+FLAG_2) 	; flags %0001 1100
	sta flagPPUMask_18
	
	lda #(FLAG_7+FLAG_3)		; flags %1000 1000
	sta flagPPUControl_17
	sta flagPPUControl_19
	
	lda #ENEMY_WAVES_TO_FIRST
	sta nextEnemyWave_5C
	
	lda #$00
	sta input1_20
	sta inputPrev_22
	sta currentEnemyWave_5B
	sta aliveTimer_14
	sta frameCounter62_13
	
	jsr InitializePlayer
	jsr InitializeHUD_Lives
	jsr TriggerNextLevel
	
	lda #FALSE
	sta flagNextLevel_1B
	sta flagBossFight_1A
	
	jsr RenderON

	PlaySoundForever #STAGE_SONG
	
	lda currentStage_15
	cmp #$02
	bcs loopMain

	Copy HeartHUDData, OAM_0200, #0, #4
	
	SetupNewLevel:
		lda #HEART_OFFSCREEN
		sta OAM_0200

		jsr InitializePlayer
		jsr TriggerNextLevel

	loopMain:
		jsr UnknownSub1
		jsr LoadEnemyBatch
		jsr LivesHUD

		lda flagPlayerHasShot_62	; did the player shoot?
		beq :+						; if not, skip
		sta flagLoadShots_4E		; else, order shots
		jsr HandlePlayerShots
		
		:
		lda flagPlayerHit_1E
		beq skipPlayerHit
		dec livesCounter_11
		lda #$01					; Wait 1 second before
		jsr WaitAliveTime_A			; respawning the player
		lda #$00
		sta flagPlayerHit_1E
		sta flagPlaySFX_8F
		jmp SetupNewLevel

		skipPlayerHit:
		lda livesCounter_11
		bne skipSomethingImportant
		StopPlaying

		jsr ShowGameOver_WaitAnyButtonPress
		jsr PaletteFading
		jsr RenderingOFF
		lda #$FF
		sta updateDuringVBlank_0E
		sta updateDuringVBlank_0F
		jmp HandleReset
		
		skipSomethingImportant:
		lda flagNextLevel_1B
		beq dontAdvanceLevel
		StopPlaying

		; Handles when a stage is cleared.
		; Decides if the program has to 
		; jump back to StartingNewStage
		; or to EndGame.
		jmp HandleStageClear	; New stage or game credits?

		dontAdvanceLevel:
		jmp loopMain
;



;==================================
; Beginning of Subroutines
;==================================

; $8170
; Why use a JSR call for this?
; It is used only once during Reset and
; having these 2 lines, it is of no consequence.
; Maybe it was a last minute fix done on the ROM itself.
; This step is used to add or subtract from the objectIndex_5F
; It has two possible values: 6 or -6
; objectIndex_5F counts up from 0 to 240
; and then counts down from 240 back to 0
.proc InitializeObjectIndexStep
	lda #OBJECT_BYTE_SIZE	
	sta objIndexStep_59
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
	cmp #ENEMY_WAVES_TRIGGER	; will load next batch if counter >= $FA 
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

	lda currentEnemyWave_5B		; index for current enemy batch
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
		
		lda (objectPtr_3A),Y	; read object type
		cmp #$F8				; this is a STAGE_BOSS $F8
		bne :+					; if not, skip ahead

		lda #TRUE				; if STAGE_BOSS
		sta flagBossFight_1A	; set this flag TRUE
		ldx #$30				; WHY? 
		jsr ClearObjectsDescription; Clears page $04 of RAM
	
		; Stage Boss Song===============
		StopPlaying	
		ResetSoundEngine 
		PlaySoundForever #BOSS_SONG
		; ==============================

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

		and #(FLAG_1+FLAG_0)		; $F1 & $03 = $01
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

		and #(FLAG_1+FLAG_0)		; $F2 & $03 = $02
		sta var_2D				; object status flags?
		iny
		lda (objectPtr_3A),Y	; read next byte after $F2
		sta enemySetSize_2C		; enemy is part of a set
		inc enemySetSize_2C		; size of set (stores n+1)
		iny
		lda (objectPtr_3A),Y	; read next byte
		
		; no control character found. 
		; loading enemy
		: 
		sta objectType_58		; #1 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta new_X_Lo_54				; X position, #2 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta new_X_Hi_55				; #3 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta new_Y_Lo_56				; Y position, #4 byte of object file
		iny
		lda (objectPtr_3A),Y
		sta new_Y_Hi_57				; #5 byte of object file
		jsr SpawnEnemy		; Use's objectType_58 to load the specific enemy type
		iny
		jmp loopYLoadObject

doneLooping:

	inc currentEnemyWave_5B

	lda nextEnemyWave_5C
	clc
	adc #ENEMY_WAVES_TO_NEXT
	sta nextEnemyWave_5C

doneLoadingEnemyBatch:
	rts
.endproc
;
; $822F
.proc SpawnEnemy
	tya
	pha

	; MACRO that reads the stage number and returns the index 
	GetObjectsIndexTable_Y	
	; now Y contains the index

	lda ObjectsData_A885+2,Y	; lo-byte of stage's enemies AI/Animation data(?)
	sta objectPtr_34+0
	lda ObjectsData_A885+3,Y	; hi-byte of stage's enemies AI/Animation data(?)
	sta objectPtr_34+1

	; objectType_58 holds the index (address offset) for a given enemy's data
	lda objectType_58			; this was the FIRST byte loaded from the object file
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
	ora #(FLAG_5+FLAG_6)			; turn ON flags 5 and 6
	ora var_2D					; turn ON other flags from var_2D (see previous routine)
	sta object_Attrib_2_0405,X	; store #2 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #3 byte of 10
	sta objectWidth_0600,X		; stores #3 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #4 byte of 10
	sta objectHeight_0601,X		; stores #4 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #5 byte of 10 - Health points
	sta healthPoints_0603,X		; stores #5 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #6 byte of 10
	sta someObjProperty_0302,X	; stores #6 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #7 byte of 10
	sta someObjProperty_0301,X	; stores #7 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #8 byte of 10
	sta objectSpeed_X_0604,X	; stores #8 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #9 byte of 10
	sta objectSpeed_Y_0605,X	; stores #9 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #10 byte of 10
	sta someObjProperty_0700,X	; stores #10 byte of 10
	sta someObjProperty_0300,X	; stores #10 byte of 10
	
	lda new_X_Lo_54
	sta object_X_Lo_0400,X 	; X position, #2 byte of object file
	lda new_X_Hi_55
	sta object_X_Hi_0401,X	; #3 byte of object file
	lda new_Y_Lo_56
	sta object_Y_Lo_0402,X	; Y position, #4 byte of object file
	lda new_Y_Hi_57
	sta object_Y_Hi_0403,X	; #5 byte of object file
	
	lda #$00
	sta someObjProperty_0503,X	; zero out 
	sta someObjProperty_0504,X	; zero out 
	sta someObjProperty_0505,X	; zero out 
	sta someObjProperty_0303,X	; zero out 

	lda #FLAG_7
	sta object_Attrib_1_0404,X ; Set as VALID OBJECT
	pla
	tay
	rts
.endproc
;
; $82C9
.proc UnknownSub1

	jsr CalculatePlayerHitBox

	lda #$00
	sta var_5A
	lda #$06
	sta iterator_4D
	
	loopCheckCollisions:

		ldx iterator_4D
		lda object_Attrib_1_0404,X
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
			jmp doneCheckingPlayerCollision
		:
		lda object_Attrib_1_0404,X
		bpl doneCheckingPlayerCollision		; test BIT_7 for unresolved collision

		lda object_X_Hi_0401,X
		beq :+
		
		cmp #$FF
		bne SecondPart
		
		lda object_X_Lo_0400,X
		clc
		adc objectWidth_0600,X
		bcc SecondPart

		:
		lda object_Y_Hi_0403,X
		beq ThirdPart
		
		cmp #$FF
		bne SecondPart
		
		lda object_Y_Lo_0402,X
		clc
		adc objectHeight_0601,X
		bcs ThirdPart
	
		SecondPart:
		lda object_Attrib_2_0405,X
		and #FLAG_4
		beq :+

		lda object_Attrib_1_0404,X
		and #FLAG_5
		beq :++

		:
		lda #FLAG_4
		sta object_Attrib_1_0404,X
		jmp doneCheckingPlayerCollision

		:
		lda object_Attrib_1_0404,X
		TurnOFF FLAG_5					;	and #(ALL1-FLAG_5)
		sta object_Attrib_1_0404,X
		jmp doneCheckingPlayerCollision
	
		ThirdPart:
		lda object_Attrib_1_0404,X
		ora #FLAG_5
		sta object_Attrib_1_0404,X
		jsr CalculateEnemyHitBox_X
		lda object_Attrib_1_0404,X
		and #FLAG_3
		beq doneCheckingPlayerCollision
		lda var_5A
		bne doneCheckingPlayerCollision
		jsr HandleEnemyIA_Shooting_X
	
		doneCheckingPlayerCollision:
		lda iterator_4D
		clc
		adc #$06
		sta iterator_4D
		cmp #$F0
		beq :+
		jmp loopCheckCollisions

	:
	jsr UnknownSub8
	
	rts
.endproc
;
; $8369
; Populate the Player's data ($0702-05) 
; with its hitbox's vertices coordinates.
.proc CalculatePlayerHitBox

	lda object_X_Lo_0400			; get player's X position
	clc
	adc #$08						; add 8 pixels
	sta objectHitBox_Left_X_0702	; store left X
	
	lda object_X_Lo_0400			; get player's X position
	adc objectWidth_0600			; add object's width (in pixels)
	sbc #$08						; subtract 8 pixels
	sta objectHitBox_Right_X_0703	; store right X

	lda object_Y_Lo_0402			; get player's Y position
	adc #$03						; add 3 pixels
	sta objectHitBox_Top_Y_0704		; store top Y

	lda object_Y_Lo_0402			; get player's Y position
	adc objectHeight_0601			; add object's height
	sbc #$04						; subtract 4 pixels
	sta objectHitBox_Bottom_Y_0705	; store bottom Y

	rts
.endproc
;
; $8391
.proc CalculateEnemyHitBox_X
	lda object_Attrib_2_0405,X
	and #FLAG_4
	beq objectIsBoss
	
	lda object_X_Hi_0401,X
	beq :+
	lda #$00
	beq :++
	
	:
	lda object_X_Lo_0400,X
	
	:
	sta objectHitBox_Left_X_0702,X
	lda object_Y_Hi_0403,X
	beq :+
	lda #$00
	beq :++
	
	:
	lda object_Y_Lo_0402,X
	
	:
	sta objectHitBox_Top_Y_0704,X
	lda object_X_Lo_0400,X
	clc
	adc objectWidth_0600,X
	cmp objectHitBox_Left_X_0702,X
	bcs :+
	lda #$FF
	
	:
	sta objectHitBox_Right_X_0703,X
	lda object_Y_Lo_0402,X
	clc
	adc objectHeight_0601,X
	cmp objectHitBox_Top_Y_0704,X
	bcs :+
	lda #$FF
	
	:
	sta objectHitBox_Bottom_Y_0705,X
	rts

	objectIsBoss: ; make the hit box the same size as the sprite
	lda object_X_Lo_0400,X
	sta objectHitBox_Left_X_0702,X
	clc
	adc objectWidth_0600,X
	sta objectHitBox_Right_X_0703,X
	lda object_Y_Lo_0402,X
	sta objectHitBox_Top_Y_0704,X
	clc
	adc objectHeight_0601,X
	sta objectHitBox_Bottom_Y_0705,X
	rts

.endproc
;
; $83F4
.proc UnknownSub8	; Maybe object collision?
	ldy #$00
	
	BeginHere:
	lda object_Attrib_1_0404,Y
	bmi :+
	jmp DoneWithThis
	
	:
	lda object_Attrib_2_0405,Y	; object flags
	bit OBJPROP_CAN_COLLIDE		; test for BIT 6: object can collide
	bne :+						; if flag set, continue
	jmp DoneWithThis			; if not, break
	
	:	; flag 6 is set: object has collision enabled
	lda objectHitBox_Left_X_0702,Y ;
	sta hitboxXRight_4F
	lda objectHitBox_Right_X_0703,Y
	sta hitboxXLeft_50
	lda objectHitBox_Top_Y_0704,Y
	sta hitboxYBottom_51
	lda objectHitBox_Bottom_Y_0705,Y
	sta hitboxYTop_52
	
	ldx #$30
	AnotherCheckAndLeave:
	lda object_Attrib_1_0404,X
	bpl StartLeaving
	and #FLAG_5
	beq StartLeaving
	lda object_Attrib_2_0405,X
	bit BIT_6
	beq StartLeaving
	
	and #FLAG_4
	bne :+
	cpy #$00
	beq :+
	
	StartLeaving:
	jmp dontHandleObjCollision
	
	: ; $843B
	lda objectHitBox_Left_X_0702,X
	cmp hitboxXLeft_50
	bcs StartLeaving
	lda hitboxXRight_4F
	cmp objectHitBox_Right_X_0703,X
	bcs StartLeaving
	lda objectHitBox_Top_Y_0704,X
	cmp hitboxYTop_52
	bcs StartLeaving
	lda hitboxYBottom_51
	cmp objectHitBox_Bottom_Y_0705,X
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
	lda flagBossFight_1A
	bne :+
	clc
	lda object_X_Lo_0400,X
	adc #$07
	sta object_X_Lo_0400,X
	lda object_X_Hi_0401,X
	adc #$00
	sta object_X_Hi_0401,X
	
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
	lda #<Data_at8BD7
	sta someObjProperty_0501
	lda #>Data_at8BD7
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

	PushXY

	lda object_Attrib_2_0405,X
	bit OBJPROP_STAGE_BOSS		; object is a TODO! NOT BOSS
	bne :+						; if YES set, continue below
		jmp doHandleObjCollision	; if NOT, skip to uniary-collision
	
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
		sta flagGenDrop_2E
		jsr GenerateDrop
		jmp doHandleObjCollision
	
	:  
	bit OBJPROP_PARTOF_SET		; enemy is part of set?
	beq :+						; if not, break.

		lda enemySetSize_2C
		beq doHandleObjCollision
		sec
		sbc #$01
		sta enemySetSize_2C
		cmp #$01
		bne doALSOHandleObjCollision
		
		sta flagGenDrop_2E			; if an enemy set was completed, generate a drop
		jsr GenerateDrop
		jmp doHandleObjCollision
	
	:
	bit BIT_3
	beq doALSOHandleObjCollision
		cpy #$00
		bne skipHandlingCollision
	
	doALSOHandleObjCollision:
		jsr HandleObjectCollision
		lda soundIndex_8D
		cmp #$05
		beq skipHandlingCollision

		; Sound effect =================
		ResetSoundEngine 
		PlaySoundOnce #ENEMY_DEATH_SFX
		; ==============================

		jmp skipHandlingCollision
	
	doHandleObjCollision:
		jsr HandleObjectCollision

	skipHandlingCollision:
	PullXY

	rts
.endproc
;
; $854C
.define OBJTYPE_ARROW		$06

.define OBJTYPE_ENEMY		$1F
.define OBJTYPE_PLAYER		$1A

.define OBJTYPE_EXTRA_LIFE  $28
.define OBJTYPE_POWERUP		$29
.define OBJTYPE_HEART		$2A
.define OBJTYPE_SPEEDUP		$2B
.define OBJTYPE_MAGIC_LAMP	$2C

.define SPAWNTYPE_NOTHING	$00
.define SPAWNTYPE_PUFF		$02
.define SPAWNTYPE_PLAYERDEATH $03

.proc HandleObjectCollision
; Checks if object with index X collided with something important.
; 	X = 0 is the player
	
	PushXY
	lda object_Attrib_2_0405,X		; Object status flags
	bit OBJPROP_CAN_COLLIDE			; check if the object is tangible (flag 6)
	bne :+							; if TANGIBLE (can collide), continue
	jmp doneWithObjectCollision		; else exit
	
	:
	lda someObjProperty_0302,X		; Collision type?
	bne :+							; this is useless, skips nothing at all
									; could be replaced by nop nop
	:
	cmp #OBJTYPE_ARROW				; Check if object is an arrow shot.
	bne handlePickups				; if it did, continue to handlePickups
	
	lda arrowsFlying_60				; else, check if arrowsFlying_60 is zero
	beq :+							; if it is, go to secondPart
	dec arrowsFlying_60				; else, decrease arrowsFlying_60 and then go to secondPart
	
	:
	lda #SPAWNTYPE_NOTHING					
	jmp handleDespawning

	handlePickups:

		; Pickups section
		; Detecting if the player has collected a power up.

		handlePlayerGotExtraLife:

			cmp #OBJTYPE_EXTRA_LIFE
			bne handlePlayerGotPowerUp	; if pickup is not ExtraLife, skip to next
			
			; Sound effect =================
			WaitUntilSoundFinishes
			ResetSoundEngine	
			PlaySoundOnce #EXTRA_LIFE_SFX
			; ==============================

			inc livesCounter_11
			jmp doneWithObjectCollision

		handlePlayerGotPowerUp:
			cmp #OBJTYPE_POWERUP ; $29	
			bne handlePlayerGotHeart 

			; Sound effect =================
			WaitUntilSoundFinishes
			ResetSoundEngine
			PlaySoundOnce #GAME_START_SFX
			; ==============================

			lda powerLevel_64
			cmp #PLAYER_MAX_POWER

			bcc :+ 	; if didn't reach maximum power, continue to power increase
					; else play sound cue and exit
			ResetSoundEngine
		
			jmp doneWithObjectCollision
		
			:
			inc powerLevel_64
			jmp doneWithObjectCollision
		
		handlePlayerGotHeart:
			cmp #OBJTYPE_HEART ; $2A	
			bne handlePlayerGotSpeedUp

			; Sound effect =================
			WaitUntilSoundFinishes
			ResetSoundEngine
			PlaySoundOnce #GAME_START_SFX
			; ==============================

			jsr AddOneHeart
			jmp doneWithObjectCollision
		
		handlePlayerGotSpeedUp:
			cmp #OBJTYPE_SPEEDUP; $2B
			bne handlePlayerGotMagicLamp

			; Sound effect =================
			WaitUntilSoundFinishes
			ResetSoundEngine
			PlaySoundOnce #GAME_START_SFX
			; ==============================

			lda #PLAYER_SPEED_FAST
			sta speedLevel_66
			jmp doneWithObjectCollision
		
		handlePlayerGotMagicLamp:
			cmp #OBJTYPE_MAGIC_LAMP; $2C
			bne doneWithPickups

			lda object_X_Hi_0401,X			; check if Magic Lamp is not offscreen
			beq :+							; if not, continue forward
			jmp doneWithObjectCollision		; else (is offscreen), break.
			:

			; Sound effect =================
			PlaySoundOnce #MAGIC_LAMP_SFX
			; ==============================

			lda #MAGIC_LAMP_HEALTH_POINTS
			sta healthPoints_0603
			lda #<Data_at8BBD
			sta someObjProperty_0501
			lda #>Data_at8BBD
			sta someObjProperty_0502
			lda #$00
			sta someObjProperty_0503
			sta someObjProperty_0504
			sta someObjProperty_0505
			lda #HEART_HUD_Y
			sta OAM_0200

			jmp doneWithObjectCollision
		
		doneWithPickups:
		
		cmp #OBJTYPE_ENEMY ; $1F
		bne :+
		
		lda #SPAWNTYPE_PUFF ; $02
		bne handleDespawning
	
	:
	cmp #OBJTYPE_PLAYER; $1A
	bne :+
		WaitUntilSoundFinishes
		ResetSoundEngine
		PlaySoundOnce #PLAYER_DEATH_SFX

		lda #TRUE
		sta flagPlaySFX_8F
		lda #SPAWNTYPE_PLAYERDEATH ; $03
		bne handleDespawning
	
	:
	cmp #(FLAG_1|FLAG_4|FLAG_5); $32
	bne :+

	lda #$04
	bne handleDespawning
	
	:
	cmp #(FLAG_0|FLAG_1|FLAG_4|FLAG_5); $33
	bne :+

	lda #$05
	bne handleDespawning
	
	:
	cmp #$34
	bne :+
	lda #$06
	bne handleDespawning
	
	:
	cmp #$35
	bne :+
	lda #$07
	bne handleDespawning
	
	:
	cmp #$36
	bne :+
	lda #$0C
	bne handleDespawning
	
	:
	cmp #$24
	bne doneWithObjectCollision

	PlaySoundForever #BOSS_DEATH_SFX


	lda #$08
	clc
	adc currentStage_15
	sbc #$00
	
	handleDespawning:
		sta objectType_58			; death animation index
		
		lda object_Attrib_1_0404,X
		and #FLAG_5 ; check if this object spawns another?
		beq doneWithObjectCollision

		clc
		lda object_X_Lo_0400,X
		sta new_X_Lo_54
		lda object_X_Hi_0401,X
		adc #$00					; there's no adc before. this is pointless
		sta new_X_Hi_55
		clc
		lda object_Y_Lo_0402,X
		sta new_Y_Lo_56
		lda object_Y_Hi_0403,X
		adc #$00					; there's no adc before. this is pointless
		sta new_Y_Hi_57
		jsr SpawnObject

	doneWithObjectCollision:

		PullXY
		lda #ZERO
		sta object_Attrib_1_0404,X

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
; Load object objectType_58 from ROM to an empty slot X
.proc SpawnObject
	
	jsr FindFreeObjectSlot_rX
	cpx #$F0
	bcc :+
	
	rts
	
	:
	lda objectType_58
	asl A
	asl A
	asl A
	tay
	lda Data_at8715+0,Y			; object VX table address
	sta someObjProperty_0501,X	; object VX table address
	lda Data_at8715+1,Y			; object VY table address
	sta someObjProperty_0502,X  ; object VY table address
	lda Data_at8715+2,Y
	sta someObjProperty_0602,X
	lda Data_at8715+3,Y
	sta object_Attrib_2_0405,X
	lda Data_at8715+4,Y
	sta objectWidth_0600,X
	lda Data_at8715+5,Y
	sta objectHeight_0601,X
	lda Data_at8715+6,Y
	sta someObjProperty_0302,X
	lda Data_at8715+7,Y
	sta someObjProperty_0303,X
	lda new_X_Lo_54
	sta object_X_Lo_0400,X
	lda new_X_Hi_55
	sta object_X_Hi_0401,X
	lda new_Y_Lo_56
	sta object_Y_Lo_0402,X
	lda new_Y_Hi_57
	sta object_Y_Hi_0403,X
	lda #$00
	sta someObjProperty_0503,X
	sta someObjProperty_0504,X
	sta someObjProperty_0505,X
	sta someObjProperty_0700,X
	sta someObjProperty_0300,X
	sta someObjProperty_0301,X
	lda #FLAG_7
	sta object_Attrib_1_0404,X ; Set VALID OBJECT

	rts
.endproc
;
; $8715
; Object type table?
Data_at8715:
.include "despawn_objects.inc"
;
; $8AEA
.proc GenerateDrop ; Generate a random drop
	lda flagGenDrop_2E	  	; check drop flag
	beq doneWithThisRoutine	; if flag not set, break.

	lda frameCounter_12		; load which frame are we
	and #$07				; module 8
	; A = 0 0000 0000
	;	  1 0000 0001
	; 	  2 0000 0010
	; 	  3 0000 0011
	;	  4 0000 0100
	;	  5 0000 0101
	; 	  6 0000 0110
	;	  7 0000 0111

	bne :+					; case 0: Extra life (1/8 chance)
	lda #$32				; $0A + $28 
	bne doneWithDrops
	
	:
	bit BIT_0				; case 2, 4, 6: Power (3/8 chance)
	bne :+
	lda #$33				; $0A + $29
	bne doneWithDrops
	
	:
	bit BIT_1				; case 1, 5: Heart (2/8 chance)
	bne :+
	lda #$34				; $0A + $2A
	bne doneWithDrops
	
	:						; case 3, 7: Speed (2/8 chance)
	lda #$35				; $0A + $2B
	
	doneWithDrops:
		pha
		lda #$00			; reset 
		sta flagGenDrop_2E	; reset generate drop flag
		pla
		sta someObjProperty_0302,X	; store drop type
	
	doneWithThisRoutine:
	rts
.endproc
;
; $8B16
.proc InitializePlayer

	lda #PLAYER_START_X_Lo
	sta object_X_Lo_0400
	lda #PLAYER_START_X_Hi
	sta object_X_Hi_0401
	lda #PLAYER_START_Y_Lo
	sta object_Y_Lo_0402

	lda #<Data_at8B7D					
	sta someObjProperty_0501
	lda #>Data_at8B7D		
	sta someObjProperty_0502

	lda #(FLAG_7+FLAG_5)			; $A0
	sta object_Attrib_1_0404

	lda #ZERO
	sta someObjProperty_0503
	sta someObjProperty_0504
	sta someObjProperty_0505
	sta aliveTimer_14
	sta soundIndex_8D

	lda #$1A
	sta someObjProperty_0302
	lda #$03
	sta someObjProperty_0602
	
	lda #$14
	sta objectWidth_0600
	lda #$18
	sta objectHeight_0601
	
	lda #$18
	sta objectSpeed_X_0604
	lda #$0E
	sta objectSpeed_Y_0605

	lda #ZERO
	sta object_Attrib_2_0405

	lda #$00
	sta arrowsFlying_60
	
	lda flagNextLevel_1B
	bne :+
	lda #$01
	sta healthPoints_0603
	lda powerLevel_64
	beq :+
	dec powerLevel_64

	:
	rts
	
	unusedReturn:				; This part is unaccessible.
	sta powerLevel_64			; It seems to be left over from 
	rts							; older code.
.endproc
;
; $8B7D
Data_at8B7D:
.incbin "rom-prg/objects/data-block-at8B7D.bin"
;.byte $0B, $10, $00, $81, $0C, $0C, $00, $81
;.byte $0D, $0B, $00, $81, $0B, $09, $00, $82
;.byte $0C, $07, $00, $82, $0D, $05, $00, $82
;.byte $0B, $00, $00, $81, $43, $00, $00, $82
;.byte $0C, $00, $00, $81, $43, $00, $00, $82
;.byte $0D, $00, $00, $81, $43, $00, $00, $82
;.byte $C7, $18, $0B, $00, $00, $86, $0C, $00 
;.byte $00, $86, $0D, $00, $00, $86, $FE, $32

Data_at8BBD:
.incbin "rom-prg/objects/data-block-at8BBD.bin"
;.byte $0B, $00, $00, $81, $43, $00, $00, $83
;.byte $0C, $00, $00, $81, $43, $00, $00, $83
;.byte $0D, $00, $00, $81, $43, $00, $00, $83
;.byte $FE, $00

Data_at8BD7:
.incbin "rom-prg/objects/data-block-at8BD7.bin"
;.byte $0B, $00, $00, $86, $0C, $00, $00, $86, $0D, $00, $00, $86, $FE, $00
;
; $8BE5
.proc InitializeHUD_Lives
	ldy #OBJECT_BYTE_SIZE
	lda #LIVES_HUD_X
	sta object_X_Lo_0400,Y
	lda #LIVES_HUD_Y
	sta object_Y_Lo_0402,Y
	lda #(FLAG_5+FLAG_7)				; $A0
	sta object_Attrib_1_0404,Y
	lda #ZERO
	sta object_Attrib_2_0405,Y
	sta someObjProperty_0503,Y
	sta someObjProperty_0504,Y
	sta someObjProperty_0505,Y
	sta someObjProperty_0302,Y
	sta someObjProperty_0303,Y
	sta objectSpeed_X_0604,Y
	sta objectSpeed_Y_0605,Y
	sta someObjProperty_0602,Y
	lda #$FF
	sta healthPoints_0603,Y
	lda #$07
	sta objectWidth_0600,Y
	lda #$07						; this LDA is pointless if the value didn't change.
	sta objectHeight_0601,Y
	rts
.endproc
;
; $8C23
.proc TriggerNextLevel
	lda #$00
	sta objectIndex_5F		; reset object handling index
	lda flagNextLevel_1B
	bne :+
	lda #PLAYER_SPEED_SLOW
	sta speedLevel_66
	
	:
	lda #$FF
	sta var_5E
	rts
.endproc
;
; $8C34
; HandlePlayerShots
; Shoots arrows according to flagLoadShots_4E
; and to the player's current power level.
; powerLevel_64 = 	1 - single arrow, shoot once
;					2 - single arrow, shoot twice
;					3 - triple arrow, shoot one
;					4 - triple arrow, shoot twice
; Clobbers A
.proc HandlePlayerShots

	txa
	pha

	lda flagLoadShots_4E		; check for autorization
	bit BIT_1
	beq doneShooting
	

	ldx powerLevel_64			; check power level
	txa							
	beq doShootArrow			; if power = 0, continue to doShootArrow

	; X is the Power Level
	; Set a relation between the power level and 
	; the number of allowed arrows on the screen.
	; 	X | A
	; 	1 | 1
	; 	2 | 2
	; 	3 | 2
	; 	4 | 3
	cpx #$01					; check if power = 1
	bne :+						; if not, skip forward
	lda #$01					; else (power=1), A = 1 and
	bne doShootArrow			; continue to doShootArrow
	
	:
	cpx #$02					; check if power = 2
	bne :+						; if not, skip forward
	lda #$02					; else (power=2), A = 2 and
	bne doShootArrow			; continue to doShootArrow
	
	:
	cpx #$03					; check if power = 3
	bne :+						; if not, skip forward
	lda #$02					; else (power=3), A = 2 and
	bne doShootArrow			; continue to doShootArrow
	
	:
	cpx #$04					; check if power = 4
	bne tooMuchPower			; if not, skip forward
	lda #$03					; else (power=4), A = 3 and
	
	doShootArrow:
		; Check the number of arrows allowed on the screen
		; Will only shoot if A is at least equal to arrowsFlying_60.
		;
		; arrowsFlying_60 = 0 (no arrows on the screen)
		; 		Any value of A allow shooting
		;
		; arrowsFlying_60 = 1
		;		Allow shooting if power level not zero (A>=1)
		; 
		; arrowsFlying_60 = 2
		; 		Allow shooting if power level greater than 2 (A>=2)
		;
		; arrowsFlying_60 = 3
		; 		Only allow shooting if power level equal to max (A=3)
		;
		; arrowsFlying_60 >= 4
		; 		Cannot shoot on any power level.
		;
		cmp arrowsFlying_60		; compare A to arrowsFlying_60
		bcc doneShooting		; if A < arrowsFlying_60, break.

								; else (A>=arrowsFlying_60)
		cpx #$03				; compare power to level 3
		bcc singleShot			; if power<3 (levels 1 or 2), do singleShot

	tripleShot:
		inc arrowsFlying_60
		inc arrowsFlying_60
		lda #$01
		jsr ShootArrow_A
		lda #$02
		jsr ShootArrow_A
	
	singleShot:
		inc arrowsFlying_60
		lda #$00
		jsr ShootArrow_A

	lda soundIndex_8D
	cmp #$07
	bne :+
	
	lda frameCounter_12
	and #$03
	bne doneShooting
	
	; Sound effect =================
	WaitUntilSoundFinishes
	ResetSoundEngine 
	; ==============================
	
	beq :++
	
	:
	cmp #$05
	beq doneShooting
	
	:
	PlaySoundOnce #$03

	doneShooting:
		lda #$00
		sta flagPlayerHasShot_62	;	clear flags
		sta flagLoadShots_4E		; 	clear flags
		pla
		tax
		rts
	
	tooMuchPower:					; This section should never
		cpx #$05					; be reached during normal gameplay.
		bcc :+						; If power is larger than 4
		lda #$02					; reset it to 2 (why not 4?)
		sta powerLevel_64

	:
	jmp doneShooting

.endproc
;
; $8CB0
; ShootArrow_A
; Loads the arrow object and shoots it.
; 	A = 0 Straight arrow
; 	A = 1 Up arrow
; 	A = 2 Down arrow
.proc ShootArrow_A

	pha							; temporarily put A away
	jsr FindFreeArrowSlot_rX	; look for free arrow slot
	cpx #$30					; check if shot list is not full
	bcc :+						; if not, continue
	pla							; else (list full), retrieve A and leave.
	rts

	:
	pla							; retrieve parameter A
	asl A				
	asl A
	asl A						; Calculate offset for 8-byte stride
	tay							; use A as index
	lda Data_at8D1D+0,Y			; Movement Table lo byte
	sta someObjProperty_0501,X
	lda Data_at8D1D+1,Y			; Movement Table hi byte
	sta someObjProperty_0502,X	

	lda Data_at8D1D+2,Y			; load byte 1
	cpy #$00					; check if single arrow
	beq :+						; if single arrow, skip forward
	clc							; else, 
	adc #$02					; add 2
	
	:
	sta someObjProperty_0602,X	; store A (byte 1) #$02 single, #$04 triple
	lda Data_at8D1D+3,Y			; load byte 2
	sta someObjProperty_0302,X	; store byte 2
	lda Data_at8D1D+4,Y			; load byte 3
	sta objectWidth_0600,X	; store byte 3
	lda Data_at8D1D+5,Y			; load byte 4
	sta objectHeight_0601,X	; store byte 4
	
	lda object_X_Lo_0400		; load player X position from RAM
	clc
	adc Data_at8D1D+6,Y			; add arrow X position (byte 5)
	sta object_X_Lo_0400,X		; store arrow position
	
	lda object_Y_Lo_0402		; load player Y position from RAM
	clc
	adc Data_at8D1D+7,Y			; add arrow Y position (byte 6)
	sta object_Y_Lo_0402,X		; store arrow position
	
	lda #$00					; zero-out other properties
	sta someObjProperty_0503,X
	sta someObjProperty_0504,X
	sta someObjProperty_0505,X
	sta object_X_Hi_0401,X
	sta object_Y_Hi_0403,X
	sta healthPoints_0603,X

	lda #FLAG_6					; SET COLLISION ON
	sta object_Attrib_2_0405,X

	lda #FLAG_7					; VALID OBJECT
	sta object_Attrib_1_0404,X
	
	rts

.endproc
;
; $8D1D
Data_at8D1D:
; Arrow data
; (word) Address for movement table
;
; 	6 bytes:
;	1	2	3	4	5	6
;	|	|	|	|	|   |
;	|	|	|	|	|	+-- Y relative to player
;	|	|	|	|	+------ X relative to player
;	|	|	|	+----------
;	|	|	+--------------
;	|	+------------------
;	+----------------------
;
;.incbin "rom-prg/objects/data-block-at8D1D.bin"

.addr Data_at8D35
.byte $02, $06, $06, $05, $12, $0C 

.addr Data_at8D3D
.byte $02, $06, $06, $05, $13, $0C

.addr Data_at8D45
.byte $02, $06, $06, $05, $13, $0C

Data_at8D35:
.byte $11, $00, $00, $11, $05, $00, $FE, $03

Data_at8D3D:
.byte $24, $00, $00, $24, $04, $FF, $FE, $03

Data_at8D45:
.byte $25, $00, $00, $25, $04, $01, $FE, $03
;
;
; $8D4D
; FindFreeArrowSlot_rX (return x)
; Check if flags 7 and 4 are set in $0434
; Starting at $0434 go over 32 slots stopping at
; the first FREE slot.
; Return the slot position in X
.proc FindFreeArrowSlot_rX
	clc
	ldx #SHOT_OBJECT_START ; $0C
	
	:
		lda object_Attrib_1_0404,X
		and #(FLAG_7+FLAG_4)
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
		lda object_Attrib_1_0404,X
		and #(FLAG_7+FLAG_4) ;%10010000 ; #$90
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
.proc HandleEnemyIA_Shooting_X
	
	lda someObjProperty_0301,X	; check if enemy is shooting?
	bne :+						; if not, break.
	rts

	:
	lda object_Attrib_1_0404,X
	TurnOFF FLAG_3				; and #(ALL1-FLAG_3)
	sta object_Attrib_1_0404,X

	lda someObjProperty_0700,X
	sta someObjProperty_0300,X
	
	lda someObjProperty_0301,X	; what kind of attack?

	cmp #$01
	bne :+
	jsr ShootAtPlayer_X
	jmp doneHandlingShooting
	
	:
	cmp #$03
	bne :+
	jsr SpawnProjectiles_8_1
	jmp doneHandlingShooting
	
	:
	cmp #$05
	bne :+++
	lda #$0F
	bit frameCounter_12
	beq :+
	jsr Level_1_Attack
	jmp :++
	
	:
	jsr ShootAtPlayer_X
	
	:
	lda flagBossFight_1A
	beq :+
	jsr HandleBossAnimation_Shooting
	
	:
	cmp #$06
	bne :+
	jsr Level_2_Attack
	jsr HandleBossAnimation_Shooting
	
	:
	cmp #$07
	bne :+
	jsr Level_3_Attack
	jsr HandleBossAnimation_Shooting
	
	:
	cmp #$08
	bne doneHandlingShooting
	jsr Level_4_Attack
	jsr HandleBossAnimation_Shooting
	
	doneHandlingShooting:
	lda #$01
	sta var_5A
	rts
.endproc
;
; $8DDB
; ShootAtPlayer_X
;
; Shoots a single projectile in the direction closest 
; to the player's current position, using one of 8 shooting 
; directions pre-calculated (LUT).
; This routine decides which one of those 8 directions
; the projectile should follow.
;
; 	X register is the enemy that is going to shoot.
;
;					  \ 	|	  /
;					   \	|	 /
;						\	|	/
;					----- Enemy ------
;			  			/	|	\
;			   		   /	|	 \
;					  /		|	  \
;
;	In this case, both X and Y velocities must be negative.
;
; Clobbers A
.proc ShootAtPlayer_X

	lda #$00
	sta velocityCarry_4B	; starts with positive vX
	
	; X direction
	lda object_X_Lo_0400,X		; load enemy X position
	sec
	sbc object_X_Lo_0400		; subtract player's X position
	bcs :+						; if Enemy_X >= Player_X, skip ahead.
	eor #$FF					; if not (Enemy_X < Player_X), bit-flip result.
	:
	rol velocityCarry_4B		; Store the carry (sign)
	sta velocityComponent_4C	; Store the value (VX)

	; Y direction
	lda object_Y_Lo_0402,X		; load enemy Y position
	sec
	sbc object_Y_Lo_0402		; subtract player's Y position
	bcs :+						; if Enemy_Y >= Player_Y, skip ahead.
	eor #$FF					; if not (Enemy_Y < Player_Y), bit-flip result.	
	:
	rol velocityCarry_4B		; Store the carry (sign)
								; A still holds VY

	;	There are 4 possibilities for the Carry:
	;
	;				eY >= pY	eY < pY
	;	eX >= pX	 11 (3)		 10 (2)
	;	eX <  pX	 00 (0)		 01 (1)
	;

	cmp velocityComponent_4C	; Which component is larger?
	bcs :+						; If (VY>=VX), dont't swap them.
	ldy velocityComponent_4C	; else (VY<VX), swap them.
	sta velocityComponent_4C	; this holds the SMALEST component
	tya							; and A holds the LARGEST component	
	:	
	rol velocityCarry_4B

	;	There are now 8 possibilities for the Carry:
	;
	;	if   (VY>=VX):
	;				eY >= pY	eY < pY
	;	eX >= pX	111 (7)		101 (5)
	;	eX <  pX	001 (1)		011 (3)
	; 
	;	else (VY<VX):
	;				eY >= pY	eY < pY
	;	eX >= pX	110 (6)		100 (4)
	;	eX <  pX	000 (0)		010 (2)
	;

	; 
	sec
	sbc velocityComponent_4C
	
	; Division
	ldy #$00					; This divides the largest component 	
	:							; by the smallest one.
	sec							; Division is just counting how
	sbc velocityComponent_4C	; many times one can subtract
	bcc :+						; a value before the result becomes
	iny							; legative.
	cpy #$04					; If division is larger than 4, break.
	bcc :-
	:
	tya							; Store the result of the division in A.

	ldy velocityCarry_4B		; Use the Carry as LUT index
	clc
	adc Data_at8E25,Y			; Add the LUT value to the division result
	asl A						; 2*A since addresses are 16-bit words.
	sta projectileIndex_4A		; Store the index for the HandleSpawnProjectile_Y.
	txa
	tay							; Transfer the Enemy index to Y.
	jsr HandleSpawnProjectile_Y ; Spawn the projectile.
	rts
.endproc
;
; $8E25
Data_at8E25:
.byte $0f, $23, $0a, $19, $05, $1e, $00, $1e
;
; $8E2D
; Shoot Bubbles 8 directions
.proc SpawnProjectiles_8_1
	SpawnMultipleProjectiles Data_at8E3F, $08
	rts
.endproc
;
; $8E3F
Data_at8E3F:
.byte $00, $08, $0a, $44, $46, $1c, $14, $30
;
; $8E47
; HandleSpawnProjectile_Y
; Spawn a projectile from Enemy Y
.proc HandleSpawnProjectile_Y

	PushXY
	jsr FindFreeObjectSlot_rX			; get free slot
	cpx #$F0							; check if list is full
	bcs doneSpawningProjectiles			; if it is (full), break.

	jsr HandleEnemyIA_Movement_X_Y
	ldy projectileIndex_4A
	jsr GetProjectileTrajectoryAddress_X_Y

	lda #$01
	sta someObjProperty_0602,X
	lda #(FLAG_5+FLAG_6)
	sta object_Attrib_2_0405,X
	lda #$04
	sta objectWidth_0600,X
	sta objectHeight_0601,X
	
	lda #ZERO
	sta healthPoints_0603,X
	sta someObjProperty_0301,X
	sta someObjProperty_0302,X
	lda #FLAG_7
	sta object_Attrib_1_0404,X
	
	doneSpawningProjectiles:
	PullXY
	rts
.endproc
;
; $8E81
; HandleEnemyIA_Movement_X_Y
; Updates the position of an Object (X)
; by adding a displacement from an
; Enemy (Y) A.I.
.proc HandleEnemyIA_Movement_X_Y

	; Add16 $0604 to $0400
	lda object_X_Lo_0400,Y 		; positionX_Lo
	clc
	adc objectSpeed_X_0604,Y 	; X velocity
	sta object_X_Lo_0400,X 
	lda object_X_Hi_0401,Y 		; positionX_Hi
	adc #$00
	sta object_X_Hi_0401,X

	; Add16 $0605 to $0402
	lda object_Y_Lo_0402,Y 		; positionY_Lo
	clc
	adc objectSpeed_Y_0605,Y 	; Y velocity 
	sta object_Y_Lo_0402,X
	lda object_Y_Hi_0403,Y 		; positionY_Hi
	adc #$00
	sta object_Y_Hi_0403,X
	rts
.endproc
;
; $8EA6
.proc GetProjectileTrajectoryAddress_X_Y
	
	lda Data_at8EBE+0,Y
	sta someObjProperty_0501,X
	lda Data_at8EBE+1,Y
	sta someObjProperty_0502,X
	
	lda #ZERO
	sta someObjProperty_0505,X
	sta someObjProperty_0503,X
	sta someObjProperty_0504,X
	rts
.endproc
;
; $8EBE
; Projectile Trajectories Table
.include "trajectories.inc"
;
;
; $927F
; Level_1_Attack (The Witch) - First used by level 1 boss, 
; later by bedouins.
; Shoots 5 Sparkles (4 linear and 1 wavy)
.proc Level_1_Attack 	
	SpawnMultipleProjectiles Data_at9291, $05
	rts
.endproc
;
; $9291
Data_at9291:
.byte $52, $54, $56, $58, $5a
;
; $9296						
; Level_2_Attack (The Crock) - Used by level 2 boss.
; Shoots 3 Fireballs (all linear)
.proc Level_2_Attack
	SpawnMultipleProjectiles Data_at92A8, $03
	rts
.endproc
;
; $92A8
Data_at92A8:
.byte $5E, $60, $62
;
; $92AB
; Level_3_Attack (The Skull) - Used by level 3 boss.
; Shoots 3 Fireballs and 2 Ambers (all linear)
.proc Level_3_Attack
	SpawnMultipleProjectiles Data_at92BD, $05
	rts
.endproc
;
; $92BD
Data_at92BD:
.byte $64, $66, $68, $6A, $6C
;
; $92C2
; Level_4_Attack (The Mouth) - Used by level 4 boss.
; Shoots 3 Fireballs (linear) and 5 Ambers (3 linear and 1 wavy)
.proc Level_4_Attack
	SpawnMultipleProjectiles Data_at92D4, $08
	rts
.endproc
;
; $92D4
Data_at92D4:
.byte $66, $68, $6A, $6E, $70, $72, $74, $76
;
; $92DC
; Clobbers A
.proc HandleBossAnimation_Shooting
PushXY
	lda #$05
	sta someObjProperty_0333 ; not used in any other place

	lda someObjProperty_0531
	sta someObjProperty_0531+page_5_Gap
	lda someObjProperty_0532
	sta someObjProperty_0532+page_5_Gap
	lda someObjProperty_0533
	sta someObjProperty_0533+page_5_Gap
	lda someObjProperty_0534
	sta someObjProperty_0534+page_5_Gap
	lda someObjProperty_0535
	sta someObjProperty_0535+page_5_Gap
	
	lda #ZERO
	sta someObjProperty_0533
	sta someObjProperty_0534
	sta someObjProperty_0535

	lda #<Data_at932D 			; see data below
	sta objectPtr_34+0
	lda #>Data_at932D 			; see data below
	sta objectPtr_34+1

	lda currentStage_15			; get stage index (starts at 1)
	sec
	sbc #$01					; shifts down (starts at 0)
	asl A						; 2*A (since addresses are 16-bit words)
	tay							; use as Y index

	lda (objectPtr_34),Y		; boss shooting animation address (lo)
	sta someObjProperty_0531 
	iny
	lda (objectPtr_34),Y		; boss shooting animation address (hi)
	sta someObjProperty_0532 
	
	PullXY
	rts
.endproc
;
; $932D
Data_at932D:
;Boss animation frames
.include "boss_animation_frames.inc"
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
.include "hud_lives.inc"
;
.segment "CODEBLOCK"
; $93C9
.proc ClearPages_3_to_7
	lda #$00
	tay
	:
		sta RAMPage_3,Y
		sta RAMPage_4,Y
		sta RAMPage_5,Y
		sta RAMPage_6,Y
		sta RAMPage_7,Y
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

	PushAXY
	ldy #$36
	lda #$00
	:
		sta RAMPage_4,Y
		iny
		bne :-

	PullAXY
	rts
.endproc
;
; $93F6
; HandleStageClear
; ATENTION: This block of code is not actually a subroutine!
; It is never called with a JSR instruction and it doesn't end in RTS.
; Instead, it always return either by JMP to 
;		StartingNewSage
;	or
;		EndGame
; Both of which are part of the main program.
; Because of this, this block is actually part of the main program too.
;
; Maybe it was added at the last minute?
.proc HandleStageClear

	jsr PaletteFading			; Fade-out palletes
	
	lda #$02					
	jsr WaitAliveTime_A			; Wait 2 seconds
	
	lda currentStage_15
	cmp #$04					; Check if the last stage was completed
	bne :+						; if not, skip ahead.
		jmp EndGame				; else (completed last stage), end the game.
	
	:
	lda OAM_0200				; Load the current HEAR_HUD_Y position.
	pha							; Push it away
	jsr ClearPage_2_OAM			; Clear page 2 (objects)
	pla							; Pull it back
	sta OAM_0200				; Restore the current HEAR_HUD_Y position.
	Copy HeartHUDData, OAM_0200, #1, #4 ; Copy the rest of the HEAR_HUD data.

	lda healthPoints_0603		; Load the current health points.
	pha							; Push it away
	jsr ClearPages_3_to_7		; Clear pages 3 to 7
	pla							; Pull it back
	sta healthPoints_0603		; Restore the current health points.

	jmp StartingNewStage		
.endproc
;
; $942D
.proc SetupAfterReset
	lda #$00
	sta PpuControl_2000
	sta PpuMask_2001
	sei
	cld
	jsr ClearPage_2_OAM
	lda #$00
	jsr ClearNametable_A
	lda #$01
	jsr ClearNametable_A

	; Clear Zero Page
	lda #$00
	tay
	:
		sta RAMPage_0,Y	; initialize RAM
		iny
		bne :-			; loop if didn't overflow

	jsr ClearPages_3_to_7
	lda #$57
	sta updateDuringVBlank_0E
	lda #$75
	sta updateDuringVBlank_0F
	rts 
.endproc
;
; $9459
; ClearPage_2_OAM
; Initializes RAM Page 2 with zero values.
; Page 2 in RAM mirrors OAM (Object Attribute Memory)
; Every VBlank, Page 2 is copied to OAM via DMA (Direct Memory Access)
.proc ClearPage_2_OAM
	lda #$00
	ldy #$00

	:
		sta RAMPage_2,Y	; same as OAM_0200
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

	asl A				; A times 4
	asl A
	clc	
	adc #$20			; Make Hi byte of video address
	sta PpuAddr_2006	; Store Hi byte
	lda #$00
	sta PpuAddr_2006	; Store Lo byte

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
; Stores into RAM address paletteRAM_E0, with offset A
; 	A : 	offset from paletteRAM_E0  (address high byte)
;	Y : 	offset from addressPtr_32 (address word)
.proc LoadPaletteIntoRAM_A_Y
	tax
	clc
	adc #$10
	sta iterator_4D
	:
		lda (addressPtr_32),Y
		sta paletteRAM_E0,X 
		iny
		inx
		cpx iterator_4D
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
	cmp #FLAG_7				; $80
	bcc DistinctTiles
RepeatedTitles:
	lda #(ALL1-FLAG_7) 		; %01111111
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
	:
		lda PpuStatus_2002
		bpl :-
	pla
	rts
.endproc
;
; $9564
.proc CheckForVBlank
	:
	lda PpuStatus_2002
	bmi :-
	rts
.endproc
;
; $956A
; WaitAliveTime_A
; Wait A seconds before respawning the player
.proc WaitAliveTime_A
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
; ReadControl_A
; Reads 8 bits from control A
; A control being read: 0 = player 1, 1 = player 2
;
; 	Since this function clobbers X and it
; calls ShiftRegisterController_X, which clobbers A,
; there doesn't seem to be a reason not to use X as controller 
; index from the start.
.proc ReadControl_A

	ldx #$01			; Strobe control port to reset its latch.
	stx Ctrl1_4016
	ldx #$00
	stx Ctrl1_4016

	tax					; Transfer A to X.

	ldy #$08
	:
		jsr ShiftRegisterController_X
		dey
		bne :-
	rts
.endproc
;
; $95AC
; ShiftRegisterController_X
;	Strobe the controller port.
;	Each bit, in order, is a possible button press.
;	X : Controller 0 = Player 1, 1 = Player 2
;
;	7654 3210
;	|||| ||||
;	|||| |||+-- A
; 	|||| ||+--- B
; 	|||| |+---- Select
;	|||| +----- Start
; 	|||+------- Up
; 	||+-------- Down
; 	|+--------- Left
;	+---------- Right
;
; Clobbers A
.proc ShiftRegisterController_X

	asl input1_20			; Shift bits to the left <<
	lda Ctrl1_4016,X		; Strobe port 0 (player 1)
	lsr A					; Shift bits to the left, with carry
	bcs RegisterInput		; If carry set, proceed to register it.
	lsr A					; else, shift again.
	bcs RegisterInput		; If carry set, proceed to register it.
	rts

RegisterInput:
	inc input1_20			; Add the bit corresponding to the pressed button 
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
			lda paletteRAM_E0,X
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
			lda paletteRAM_E0,X
			sec
			sbc #$10
			bcs paletteDidNotUnderflow
			lda #$0F
			
			paletteDidNotUnderflow:
			sta paletteRAM_E0,X
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
	jsr ClearPage_2_OAM
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
	
	PlaySoundForever #ENDING_SONG

	loopPressANYButton:
		lda input1_20
		beq loopPressANYButton
	
	sta inputPrev_22
	:
		lda input1_20
		cmp inputPrev_22
		beq :-
	
	StopPlaying

	lda #$00
	sta screenScrollX_29
	sta var_2A
	jsr PaletteFading
	jsr RenderingOFF
	jsr ClearPage_2_OAM
	lda #$02					; Wait 2 seconds before
	jsr WaitAliveTime_A	; respawings the player
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
	TurnOFF FLAG_4				; and #(ALL1-FLAG_4)
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
		PlaySoundOnce #$0A

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
	ResetSoundEngine
	
	leaveEndCredits:
	rts
.endproc
;
; $9718
EndCreditsData:

.addr EndingText_9724, EndingText_9733
.addr EndingText_974F, EndingText_976B
.addr EndingText_9785, EndingText_97A3

EndingText_9724:
.byte $20, $6d, "STAFF       ", $FF

EndingText_9733:
.byte $21, $06, "PROGRAM  BY  PATRICK     ", $FF

EndingText_974F:
.byte $21, $86, "GRAPHIC  BY  JULIA       ", $FF

EndingText_976B:
.byte $22, $08, "MUSIC  BY  RUTH        ", $FF

EndingText_9785:
.byte $22, $a4, "SPECIAL THANKS  MARTINO    ", $FF

EndingText_97A3:
.byte $23, $4c, "THE END", $FF

;.incbin "rom-prg/stages/EndCredits.bin"
;
; $97AD
.proc ShowGameOver_WaitAnyButtonPress
	lda #$00
	sta currentStage_15
	sta PpuControl_2000
	jsr WaitVBlank
	lda flagPPUMask_18
	TurnOFF FLAG_4 			; and #(ALL1-FLAG_4) $EF
	sta PpuMask_2001
	lda flagPPUControl_19
	sta flagPPUControl_17
	jsr WaitVBlank
	jsr ClearPage_2_OAM

	Copy Data_at97F5, OAM_0200, #$00, #$20

	jsr UpdatePPUSettings
	lda #$02				; Waits 2 seconds
	jsr WaitAliveTime_A		; before respawning the player
	lda #$00
	sta frameCounter62_13
	
	; Wait for any button to be pressed before reseting.
	;
	; Checks for a button being pressed and then released.
	; First, checks for button presses every 10 frames.
	; Then, checks for a change on the controller state every frame.
	: ; Check for press
	lda input1_20			; Load current button being pressed.
	bne :+					; If pressed, skip forward.
	lda frameCounter62_13	; else, check if 10 frames have passed.
	cmp #$0A				; If so (10 frames since last check),
	bne :-					; check for the first press again.
	rts						; else (other frames), return.

	: ; Wait for release	
	sta inputPrev_22		; Store the previous press
	:						
		lda input1_20		; Load the new controller state.
		cmp inputPrev_22	; Compare with the previous one.
		beq :-				; While they are the same, loop back.
	rts						; else, return.
.endproc
;
; $97F5 32 bytes of data
; Hard-coded "GAME OVER" message using game 8 sprites
Data_at97F5:
.incbin "rom-prg/objects/data-block-at97F5.bin"
;
; =====================================================
;
; $9815
.segment "SOUNDENGINE"
.include "sound-engine.asm"

; Sound data

Data_at9D22:
.incbin "rom-prg/sound/sound-data-at9D22.bin"

Data_at9DB4:
.incbin "rom-prg/sound/sound-data-at9DB4.bin"

Data_at9E84:
.incbin "rom-prg/sound/sound-data-at9E84.bin"

Data_at9EB4:
.incbin "rom-prg/sound/sound-data-at9EB4.bin"

Data_at9ED6:
.incbin "rom-prg/sound/sound-data-at9ED6.bin"
;
; =====================================================
;
.segment "CODEBLOCK2"
;
; $A3AC
.proc HandleVBlank

	PushAXY
	
	lda updateDuringVBlank_0E
	cmp #$57
	beq :+
	
	jmp doUpdateSoundOnly

	:
		lda updateDuringVBlank_0F
		cmp #$75
		beq :+

		jmp doUpdateSoundOnly

	:						; Setup OAM DMA
		lda #$00			
		sta OamAddr_2003		; reset DMA pointer to begining of OAM
		lda #>OAM_0200			; setup page number of OAM mirror in RAM
		sta SpriteDma_4014		; trigger sprite DMA from RAM to OAM

		lda PpuStatus_2002
		inc frameCounter_12
		lda frameCounter_12
		and #63 				; $3F = every 62 frames, increase aliveTimer
		bne :+

		inc aliveTimer_14
		inc frameCounter62_13

	:
		lda flagNextLevel_1B
		bne doLevelTransition
		ldy currentStage_15
		bne dontLevelTransition

	doLevelTransition:
		jsr ReadControl_1
		jmp doUpdateSoundOnly

	dontLevelTransition:
		lda flagPause_1C
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
		and #$01 				; Checking if this is an ODD frame
		bne :+					; Skip if ODD

		dec nextEnemyWave_5C	; Decrement the counter for next enemy batch on EVEN frames

	:
		lda var_5E
		beq :+

		jsr HandleControllerInputs
		jsr HandleObjectsUpdates
	
	:
		jsr PowerUpCheat

	doUpdateSoundOnly:
		UpdateSoundDuringVBlank

	PullAXY
	
	rti
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
	
	cpx #BG_SCROLL_LIMIT		; test if reached end of stage
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
; HandleObjectsUpdates
; This routine updates every object of the game, every VBlank time.
; THIS IS BAD PROGRAMING!
; This routine doesn't fit during vblank.
.proc HandleObjectsUpdates

	lda #FIRST_OBJECT_SLOT		; Configuration constant
	sta oamAddressPtr_3E		; Store first OAM address
	
	lda objectIndex_5F			; Object index, initialized with $00
	sta beingUpdated_3D			; Store current object index
	
	BeginHere:
		ldx objectIndex_5F			; load object index into X
		lda object_Attrib_1_0404,X	; check if object should be handled
		bmi :+						; if negative, handle object
		
		jmp UpdateObjectIndex		; else move forward.
	
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
		lda object_Attrib_2_0405,X
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
		adc object_X_Lo_0400,X
		sta object_X_Lo_0400,X
		sta var_40
		lda tile_X_Hi_47
		adc object_X_Hi_0401,X
		sta object_X_Hi_0401,X
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
		adc object_Y_Lo_0402,X
		sta object_Y_Lo_0402,X
		sta tile_Y_Lo_42
		lda var_49
		adc object_Y_Hi_0403,X
		sta object_Y_Hi_0403,X
		sta tile_Y_Hi_43
		jmp ReplaceMeLabel_5
	
	ReplaceMeLabel_4:
		lda object_X_Lo_0400,X
		sta var_40
		lda object_X_Hi_0401,X
		sta var_41
		lda object_Y_Lo_0402,X
		sta tile_Y_Lo_42
		lda object_Y_Hi_0403,X
		sta tile_Y_Hi_43
	
	ReplaceMeLabel_5:
		inc someObjProperty_0503,X
		lda someObjProperty_0701,X
		tax
		lda Data_atA895+0,X
		sta addressPtr_32+0
		lda Data_atA895+1,X
		sta addressPtr_32+1
		ldx objectIndex_5F
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
		and #(FLAG_4+LOWER)
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
		lda object_Attrib_1_0404,X
		ora #$08
		sta object_Attrib_1_0404,X
		jmp UpdateObjectIndex
	
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
		sta object_Attrib_1_0404,X
	
	:
		jmp UpdateObjectIndex
	
	RetrieveObject:				; A holds index for object to be loaded
		asl A						; index is doubled since addresses are 16bit (double stride)
		sta someObjProperty_0701,X 	; store obj index
		tax							; start using index as X offset
		lda Data_atA895+0,X 		; Data_atA895 is the animation frames book.
		sta addressPtr_32+0
		lda Data_atA895+1,X
		sta addressPtr_32+1 		; Now addressPtr_32 points to the animation frame
		iny
		ldx objectIndex_5F
		lda object_Attrib_2_0405,X
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
		adc object_X_Lo_0400,X
		sta object_X_Lo_0400,X
		sta var_40
		lda tile_X_Hi_47
		adc object_X_Hi_0401,X
		sta object_X_Hi_0401,X
		sta var_41
		iny
		lda object_Attrib_2_0405,X
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
		adc object_Y_Lo_0402,X
		sta object_Y_Lo_0402,X
		sta tile_Y_Lo_42
		lda var_49
		adc object_Y_Hi_0403,X
		sta object_Y_Hi_0403,X
		sta tile_Y_Hi_43
		iny
		tya
		sta someObjProperty_0503,X
	
	ReplaceMeLabel_6:
		lda object_Attrib_1_0404,X
		and #FLAG_5
		bne :+

		jmp UpdateObjectIndex
	
	:
		lda object_Attrib_2_0405,X
		and #(FLAG_3+FLAG_4)
		beq :+

		lda frameCounter_12
		and #(FLAG_0+FLAG_1)
		bne :+

		dec someObjProperty_0300,X
		lda someObjProperty_0300,X
		bne :+

		lda object_Attrib_1_0404,X
		ora #FLAG_3
		sta object_Attrib_1_0404,X
	
	; loads a frame of animation
	; X indexes the object
	; Y indexes the byte being loaded
	:				
		ldy #$00			  ; starts from first tile
		lda (addressPtr_32),Y ; reads object WIDTH in pixels
		bpl :+				  ; if positive, continue

		jmp ReplaceMeLabel_8  ; if negative, do something else
	
	:
		sta objectWidth_0600,X	; stores WIDTH in pixels
		lsr A						; divide by 8 (get size in tiles)
		lsr A
		lsr A
		clc		
		adc #$01					; add 1
		sta var_44  				; store W in temp variable
		iny							; next value
		lda (addressPtr_32),Y		; reads	object HEIGHT in pixels
		sta objectHeight_0601,X		; store HEIGHT in pixels
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

		lda (addressPtr_32),Y 		; load tile index
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
		stx oamAddressPtr_3E	; stores next OAM free address
	
	UpdateObjectIndex:
		lda objectIndex_5F
		clc
		adc objIndexStep_59
		cmp #$F0			; Check if 240 (40 objects)
		bcc :++
	
		beq :+
	
		lda #$EA
		bne :++
		
	:
		lda #$00
		
	:
		sta objectIndex_5F
		cmp beingUpdated_3D
		beq ReplaceMeLabel_12
		jmp BeginHere
	
	ReplaceMeLabel_8:
		ldx oamAddressPtr_3E
		lda var_41
		bne UpdateObjectIndex
		lda tile_Y_Hi_43
		bne UpdateObjectIndex
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
		jmp UpdateObjectIndex
	
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
		lda objectIndex_5F
		cmp beingUpdated_3D
		bne :+

	; reverse the indexing
		lda #$00				
		sta objectIndex_5F		; reset object index
		sec
		sbc objIndexStep_59		; convert +6 into -6
		sta objIndexStep_59

	:

	rts

.endproc
;
; $A709
.proc Copy_5BytesPage05_FromEnd_ToBeginning
	lda someObjProperty_0531+page_5_Gap
	sta someObjProperty_0531
	lda someObjProperty_0532+page_5_Gap
	sta someObjProperty_0532
	lda someObjProperty_0533+page_5_Gap
	sta someObjProperty_0533
	lda someObjProperty_0534+page_5_Gap
	sta someObjProperty_0534
	lda someObjProperty_0535+page_5_Gap
	sta someObjProperty_0535
	rts
.endproc
;
; $A728
.proc PowerUpCheat
	lda input1_20
	cmp #(BUTTON_B+BUTTON_SELECT)
	bne :+
	cmp flagUnknown_1F
	beq :+
	inc powerLevel_64
	lda powerLevel_64
	cmp #$05
	bcc :+
	lda #$00
	sta powerLevel_64
	
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

	lda object_X_Hi_0401
	bne doGameIsPaused

	lda aliveTimer_14
	cmp #$02
	bcc HandlePlayerActions
	lda #$50
	sta object_Attrib_2_0405
	bne HandlePlayerActions
	
	doGameIsPaused:
		jsr CheckForPause
		lda input1_20
		sta inputPrev_22
		rts

	HandlePlayerActions:

	lda input1_20
	
	checkInputRight:
		bit BIT_BUTTON_RIGHT
		beq checkInputLeft

		lda object_X_Lo_0400
		cmp #$DC
		bcs checkInputDown
		adc speedLevel_66
		bcc :+
		
	checkInputLeft:
		bit BIT_BUTTON_LEFT
		beq checkInputDown
		lda object_X_Lo_0400
		cmp #$12
		bcc checkInputDown
		sbc speedLevel_66

		:
		sta object_X_Lo_0400
	
	checkInputDown:
		lda input1_20
		bit BIT_BUTTON_DOWN
		beq checkInputUp
		lda object_Y_Lo_0402
		cmp #$B8
		bcs checkInputA
		adc speedLevel_66
		bcc :+
	
	checkInputUp:
		bit BIT_BUTTON_UP
		beq checkInputA
		lda object_Y_Lo_0402
		cmp #$14
		bcc checkInputA
		sbc speedLevel_66

		:
		sta object_Y_Lo_0402
	
	checkInputA:
		lda input1_20
		bit BIT_BUTTON_A
		beq OnlyCheckForPause
		lda inputPrev_22
		bit BIT_BUTTON_A
		bne OnlyCheckForPause
		
		lda #FLAG_1
		jsr CheckPlayerCanShoot_A_rA
		sta flagPlayerHasShot_62
		
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
;
; $A80A
Data_atA80A:
.incbin "rom-prg/objects/data-block-atA80A.bin"
;
; $A83C
; CheckPlayerCanShoot_A_rA
; Checks if the player is able to shoot.
; In case not, zeoes-out A
; else, leaves A untouched.
.proc CheckPlayerCanShoot_A_rA
	pha
	lda object_Attrib_1_0404
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
	bit BIT_BUTTON_START
	beq exitPauseRoutine
	
	lda inputPrev_22
	bit BIT_BUTTON_START
	bne exitPauseRoutine
	
	lda flagPause_1C
	eor #$01
	sta flagPause_1C
	beq :+
	
	StopPlaying
	PlaySoundOnce #$08

	jmp exitPauseRoutine
	
	:
	ResetSoundEngine 

	lda flagBossFight_1A
	beq :+
	PlaySoundForever #BOSS_SONG
	rts

	:
	PlaySoundForever #STAGE_SONG
	
	exitPauseRoutine:
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