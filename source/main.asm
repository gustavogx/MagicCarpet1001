.feature force_range 	; enable hardcoding negative numbers for animations

.define DISABLE_SOUND 0
.include "macros.asm"
.include "config/defines.asm"
.include "config/engine_config.asm"

.segment "HEADER"
.include "config/inesheader.inc"

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
objDeltaX_0C:		.res 1 ; $0c 
objDeltaY_0D:		.res 1 ; $0d
updateAtVBlank_0E:	.res 1 ; $0e
updateAtVBlank_0F:	.res 1 ; $0f

.res 1 ; $10
livesCounter_11:		.res 1	; $11 ; 5
frameCounter_12:		.res 1	; $12 ; 8
timerInSeconds_13:		.res 1	; $13 ; 4
flagTimerInSeconds_14:	.res 1	; $14 ; 6
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
flagGameMode_26:		.res 1	; $26 ; STAGE (00), STARTSCREEN (01), BOSSFIGHT (02)
frameScrollAt_27:		.res 1	; $27 ; 2
frameScrollCtr_28:		.res 1	; $28 ; 3
screenScrollX_29:		.res 1	; $29 ; 7
var_2A:					.res 1	; $2A	; 3
enemySet1Size_2B:		.res 1	; $2B	; 4
enemySet2Size_2C:		.res 1	; $2C	; 4
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
beingUpdated_3D:		.res 1	; $3D ; 3
oamAddressPtr_3E:		.res 2	; $3E ; 6 (word address)
; $3F low byte of $3E

tPositionXLo_40:		.res 1	; $40 ; 5
tPositionXHi_41:		.res 1	; $41 ; 5
tPositionYLo_42:			.res 1	; $42 ; 7
tPositionYHi_43:			.res 1	; $43 ; 6
tilesWidth_44:					.res 1	; $44 ; 2
counter_H_45:			.res 1	; $45 ; 2
tile_X_Lo_46:			.res 1	; $46 ; 6 
temp_47:			.res 1	; $47 ; 7
delta_Y_Lo_48:			.res 1	; $48 ; 2
temp_49:			.res 1	; $49 ; 4
projectileIndex_4A:		.res 1	; $4A ; 7
dirDelta_4B:		.res 1	; $4B ; 5
dirDeltaSmallest_4C:	.res 1	; $4C ; 6
iterator_4D:			.res 1	; $4D ; 6
flagLoadShots_4E:		.res 1	; $4E ; 3
hitboxXRight_4F:		.res 1	; $4F ; 2

hitboxXLeft_50:			.res 1	; $50 ; 4
hitboxYBottom_51:		.res 1	; $51 ; 4
hitboxYTop_52:			.res 1	; $52 ; 4
.res 1 ; $53
new_X_Lo_54:			.res 1	; $54 ; 5 ; used by SpawnObject and SpawnEnemy_X
new_X_Hi_55:			.res 1	; $55 ; 5 ; object loading property
new_Y_Lo_56:			.res 1	; $56 ; 5 ; object loading property
new_Y_Hi_57:			.res 1	; $57 ; 5 ; object loading property
objectType_58:			.res 1	; $58 ; 5
objIndexStep_59:		.res 1	; $59 ; 5 ; it is either +6 or -6
flagEnemyWillShoot_5A:	.res 1	; $5A ; 3 ; used only within enemy AI to signal SHOOTING state
currentEnemyWave_5B:	.res 1	; $5B ; 3
nextEnemyWave_5C:		.res 1	; $5C ; 5
.res 1 ; $5D
flagUpdateObjectsOnVBlank_5A: .res 1	; $5E ; 2 is FALSE only on NEW GAME ore RESET
objIndex_5F:			.res 1	; $5F ; 9

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
flagUpdateSoundOnVBlank_8E:	.res 1	; $8E ; 
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
noiseVolume_A4:		.res 3 ; $A4
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


.segment "RAM" ; LSB 0100 - 07FF

.define someObjProperty_0100 $0100 ; 1 only used once in UnusedFunction1

.segment "SPRITES"

; page 02
.define OAM_0200	RAMPage_2 ; Y
;.define someObjProperty_0200 	$0200 ; Y
;.define someObjProperty_0201 	$0201 ; Tile
;.define someObjProperty_0202 	$0202 ; Attribute
;.define someObjProperty_0203 	$0203 ; X

; page 03
.define someObjProperty_0300 $0300 ; #10 byte of enemy profile (also $0700)
.define someObjProperty_0301 $0301 ; #7 byte of enemy profile (What kind of ATTACK?)
.define someObjProperty_0302 $0302 ; #6 byte of enemy profile (???)
.define someObjProperty_0303 $0303

; page 04
.define object_X_Lo_0400 $0400 ; object_X_Lo_0400
.define object_X_Hi_0401 $0401 ; object_X_Hi_0401
.define object_Y_Lo_0402 $0402 ; object_Y_Lo_0402
.define object_Y_Hi_0403 $0403 ; object_Y_Hi_0403

.define objAttributes_1_0404 $0404
; objAttributes_1_0404   7654 3210
; 						 |||| |||+-- 0:
;						 |||| ||+--- 1:
;						 |||| |+---- 2:
;						 |||| +----- 3: Player can shoot
;						 |||+------- 4: 
;						 ||+-------- 5: Player can shoot
;						 |+--------- 6:
;						 +---------- 7: Object needs to be updated
.define OBJPROP_TODO		FLAG_3
.define OBJPROP_SHOT		FLAG_5
.define OBJPROP_VALID		FLAG_7
.define BIT_OBJPROP_SHOT	BIT_5

.define objAttributes_2_0405 $0405 ; #2 byte of enemy profile (flags) 
; objAttributes_2_0405   7654 3210
; 						 |||| |||+-- 0: Enemy is part of SET 1
;						 |||| ||+--- 1: Enemy is part of SET 2
;						 |||| |+---- 2:
;						 |||| +----- 3:
;						 |||+------- 4: Obj is enemy or pickup (not boss)
;						 ||+-------- 5:
;						 |+--------- 6: Obj can collide
;						 +---------- 7: Obj is fixed (doesn't move)


; page 05
;.define someObjProperty_0500 		$0500
.define animationTable_Lo_0501 		$0501 
.define animationTable_Hi_0502 		$0502 
.define animationTable_Index_0503 	$0503
.define animationDelay_0504 		$0504
.define animationLoopCounter_0505 	$0505

; ENEMY_OBJECT_START = $30
.define page_5_Gap		 	RAMPage_6-(animationLoopCounter_0505+ENEMY_OBJECT_START+1)

; page 06
.define objWidthPixels_0600 		$0600 ; #3 byte of enemy profile
.define objHeightPixels_0601 		$0601 ; #4 byte of enemy profile
.define objAttackPoints_0602 		$0602 ; #1 byte of enemy profile
.define objHealthPoints_0603 	 	$0603 ; #5 byte of enemy profile
.define objShooterPosX_0604 		$0604 ; #8 byte of enemy profile :: shooter vertex X offset
.define objShooterPoxY_0605 		$0605 ; #9 byte of enemy profile :: shooter vertex Y offset

; page 07
.define someObjProperty_0700 		$0700 	; #10 byte of enemy profile (also $0300)
.define objCurrentFrameOffset_0701 	$0701	; current animation frame (see AnimationAtlas)
.define objHitBox_Left_X_0702 		$0702	; vertices of hit box
.define objHitBox_Right_X_0703 		$0703	; vertices of hit box
.define objHitBox_Top_Y_0704 		$0704	; vertices of hit box
.define objHitBox_Bottom_Y_0705 	$0705	; vertices of hit box

.segment "BANK0"


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


; $8008
HeartHUDData:
.byte HEART_HUD_Y, HEART_HUD_TILE, HEART_HUD_ATT, HEART_HUD_X

; 800C - 800F
BankSequenceArray:
.byte Stage1Bank, Stage2Bank, Stage3Bank, Stage4Bank

; $8010
HandleReset:
	; Reset handler, called by reset interrupt
	
	lda #(APU_FRAMECOUNTER_MODE_5STEPS+APU_FRAMECOUNTER_IRQ_DISABLE)
	sta Ctrl2_FrameCtr_4017
	
	GAMEENGINE_PPU_WARMUP
	GAMEENGINE_INITIALIZE_MAPPER	

	ldx #$00
	jsr SetupAfterReset	
	jsr InitializeObjectIndexStep

	SOUNDENGINE_START

	lda #GAMEMODE_STARTSCREEN 
	sta flagGameMode_26

	lda #$00 
	tax
	jsr LoadStage_A_X

	lda #$01
	ldx #$01
	jsr LoadStage_A_X

	lda #(FLAG_7+FLAG_3) 	; flags %1000 1000
	TURNOFF	FLAG_3			; and #(ALL1-FLAG_3) ; flags %1111 0111 (Why?)
	sta flagPPUControl_17
	sta flagPPUControl_19

	lda #(FLAG_4+FLAG_3+FLAG_2)
	sta flagPPUMask_18

	lda #$00 				; Start at the opening screen
	sta currentStage_15
	
	lda #STARTING_POWER
	sta powerLevel_64
	
	lda #STARTING_LIVES
	sta livesCounter_11
	
	lda #$00
	sta flagPlaySFX_8F
	sta PpuScroll_2005
	sta PpuScroll_2005
	
	jsr RenderingON
	
	SOUNDENGINE_PLAY_FOREVER #SONG_TITLESCREEN
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

	SOUNDENGINE_STOP
	SOUNDENGINE_PLAY_ONCE #SFX_GAME_START
	
	lda #$00
	sta currentStage_15

	; Handles when a stage is cleared.
	; Decides if the program has to 
	; jump back to StartingNewStage
	; or to EndGame.
	jmp HandleStageClear	; New stage or game credits?

StartingNewStage:

	jsr RenderingOFF

	SOUNDENGINE_RESET 

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
	jsr LoadStage_A_X
	
	pla
	clc
	adc #$01
	ldx #$01
	jsr LoadStage_A_X
	
	lda #FULL
	sta objDeltaX_0C
	
	lda #GAMEMODE_STAGE
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
	
	lda #ZERO
	sta input1_20
	sta inputPrev_22
	sta currentEnemyWave_5B
	sta flagTimerInSeconds_14
	sta timerInSeconds_13
	
	jsr InitializePlayer
	jsr InitializeHUD_Lives
	jsr TriggerNextLevel
	
	lda #FALSE
	sta flagNextLevel_1B
	sta flagBossFight_1A
	
	jsr RenderingON

	SOUNDENGINE_PLAY_FOREVER #SONG_STAGES
	
	lda currentStage_15
	cmp #$02
	bcs loopMain

	COPY_DATA HeartHUDData, OAM_0200, #0, #4
	
	SetupNewLevel:
		lda #HEART_OFFSCREEN
		sta OAM_0200

		jsr InitializePlayer
		jsr TriggerNextLevel

	loopMain:
		jsr HandlePhysics
		jsr LoadEnemyWave
		jsr LivesHUD

		lda flagPlayerHasShot_62	; did the player shoot?
		beq :+						; if not, skip
		sta flagLoadShots_4E		; else, order shots
		jsr HandlePlayerShots
		
		:
		lda flagPlayerHit_1E		; test if player has been hit
		beq :+						; if not, skip

		; player hit
		dec livesCounter_11			; decrease lives
		lda #$01					; Wait 1 second before
		jsr WaitForSeconds_A		; respawning the player

		lda #FALSE					; reset hit flag
		sta flagPlayerHit_1E
		sta flagPlaySFX_8F			; play $00 SFX?
		jmp SetupNewLevel

		:	; is the player out of lives?
			lda livesCounter_11		; check if lives are 0
			bne :+					; if not, skip
		
		; GAME OVER ========================
		SOUNDENGINE_STOP
		jsr ShowGameOver_WaitAnyButtonPress

		jsr PaletteFading
		jsr RenderingOFF
		lda #FULL
		sta updateAtVBlank_0E
		sta updateAtVBlank_0F
		jmp HandleReset
		; ==================================
		
		:
		lda flagNextLevel_1B		; check if level transitioning
		beq :+						; if not, we're done

		SOUNDENGINE_STOP

		; Handles when a stage is cleared.
		; Decides if the program has to 
		; jump back to StartingNewStage
		; or to EndGame.
		jmp HandleStageClear	; New stage or game credits?

		:
		jmp loopMain
;



;==================================
; Beginning of Subroutines
;==================================

; $8170
.proc InitializeObjectIndexStep
	; Why use a JSR call for this?
	; It is used only once during Reset and
	; having these 2 lines, it is of no consequence.
	; Maybe it was a last minute fix done on the ROM itself.
	; This step is used to add or subtract from the objIndex_5F
	; It has two possible values: 6 or -6
	; objIndex_5F counts up from 0 to 240
	; and then counts down from 240 back to 0

	lda #OBJECT_BYTE_SIZE	
	sta objIndexStep_59
	rts
.endproc
;
; $8175
.proc LoadEnemyWave
	; Loads a Batch of Enemies
	; Inputs: nextEnemyWave_5C, currentEnemyWave_5B
	; Variable nextEnemyWave_5C holds the timer for loading next enemy batch.
	; If timer larger than or equal to $FA, spawn new batch.

	lda nextEnemyWave_5C 		; count down until next batch load
	cmp #ENEMY_WAVES_TRIGGER	; will load next batch if counter >= $FA 
	bcs :+						; continue if it is time to load
	jmp doneLoadingEnemyBatch	; exit 

	; MACRO that reads the stage number and returns the index 
	; (address offset) for this stage's object data.
	:
	GAMEENGINE_OBJECTS_INDEX_rY	
	; retrieves the index of ObjectsData for this stage.
								; now Y contains the index

	COPY_WORD_Y ObjectsData_A885, objectPtr_34	; stage's enemy data

	lda currentEnemyWave_5B		; index for current enemy batch
	asl A
	tay
	lda (objectPtr_34),Y		; lo-byte of current enemy batch
	cmp #EOL					; check if end-of-line (EOL)
	bne :++						; if !EOL skip far ahead
	iny							
	lda (objectPtr_34),Y		; hi-byte of current enemy batch
	cmp #EOL					; check if end-of-file (EOF=FFFF)
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
		cpx #ENEMY_OBJECT_END	; no slot available to load object
		bcs doneLooping			; exit if no free slot found
		
		lda (objectPtr_3A),Y	; read object type
		cmp #(UPPER+FLAG_3)		; this is a STAGE_BOSS $F8
		bne :+					; if not, skip ahead

		lda #TRUE				; if STAGE_BOSS
		sta flagBossFight_1A	; set this flag TRUE
		ldx #ENEMY_OBJECT_START	; WHY? $30 is the first enemy slot
		jsr ClearObjectsDescription; Clears page $04 of RAM
	
		; Stage Boss Song===============
		SOUNDENGINE_STOP	
		SOUNDENGINE_RESET 
		SOUNDENGINE_PLAY_FOREVER #SONG_BOSSES
		; ==============================

		iny
		lda (objectPtr_3A),Y
		
		:						; if not previous $F8
		cmp #$F0				; check for control character $F0
		bne :+					; if not, skip ahead

		and #ZERO				; WHY "and"? equivalent to LDA #$00
		sta var_2D				; zeroing var_2D (still unknown?)
		iny
		lda (objectPtr_3A),Y
		
		:						; if not previous $F0
		cmp #$FF				; check for control character $FF
		beq doneLooping			; if so, break loop

		cmp #$F1				; check for control character $F1
		bne :+					; if not, skip ahead

		and #(FLAG_1+FLAG_0)	; $F1 & $03 = $01
		sta var_2D				; object status flags?
		iny
		lda (objectPtr_3A),Y	; read next byte after $F1
		sta enemySet1Size_2B	; store it
		inc enemySet1Size_2B	; increment it (is it a counter?)
		iny			
		lda (objectPtr_3A),Y	; read next byte
		
		:						; if not previous $F1
		cmp #$F2				; check for control character $F2
		bne :+					; if not, skip ahead

		and #(FLAG_1+FLAG_0)	; $F2 & $03 = $02
		sta var_2D				; object status flags?
		iny
		lda (objectPtr_3A),Y	; read next byte after $F2
		sta enemySet2Size_2C	; enemy is part of a set
		inc enemySet2Size_2C	; size of set (stores n+1)
		iny
		lda (objectPtr_3A),Y	; read next byte
		
		; no control character found. 
		; loading enemy
		: 
		sta objectType_58			; #1 byte of enemy profile
		iny
		lda (objectPtr_3A),Y
		sta new_X_Lo_54				; X position, #2 byte of enemy profile
		iny
		lda (objectPtr_3A),Y
		sta new_X_Hi_55				; #3 byte of enemy profile
		iny
		lda (objectPtr_3A),Y
		sta new_Y_Lo_56				; Y position, #4 byte of enemy profile
		iny
		lda (objectPtr_3A),Y
		sta new_Y_Hi_57				; #5 byte of enemy profile
		jsr SpawnEnemy_X			; Use's objectType_58 to load the specific enemy type
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
.proc SpawnEnemy_X
;	Loads a new enemy from ROM
; 	X is the object slot
; 	Clobbers X and Y (protects A)
	tya
	pha

	; MACRO that reads the stage number and returns the index 
	GAMEENGINE_OBJECTS_INDEX_rY	
	; now Y contains the index

	COPY_WORD_Y ObjectsData_A885+2, objectPtr_34	; stage's enemy data

	; objectType_58 holds the index (address offset) for a given enemy's data
	lda objectType_58			; this was the FIRST byte loaded from the object file
	asl A						; multiply by 2 since address are WORDs (2 bytes)
	
	tay
	lda (objectPtr_34),Y		; lo-byte of a given enemy data
	sta objectPtr_38+0
	iny
	lda (objectPtr_34),Y		; hi-byte of a given enemy data
	sta objectPtr_38+1

	; Now objectPtr_38 points to the enemy data
	; Uses Y to index into the enemy data
	ldy #ZERO

	lda (objectPtr_38),Y		; lo-byte of Enemy AI(?)
	sta animationTable_Lo_0501,X	; stores lo-byte of Enemy AI(?)
	iny
	lda (objectPtr_38),Y		; hi-byte of Enemy AI(?)
	sta animationTable_Hi_0502,X	; stores hi-byte of Enemy AI(?)
	iny

	lda (objectPtr_38),Y		; loads #1 byte of 10
	sta objAttackPoints_0602,X	; stores #1 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #2 byte of 10
	ora #(OBJPROP_UNKNOWN2+OBJPROP_CAN_COLLIDE)		; turn ON flags 5 and 6
	ora var_2D					; turn ON other flags from var_2D (see previous routine)
	sta objAttributes_2_0405,X	; store #2 byte of 10
	iny

	lda (objectPtr_38),Y		; loads #3 byte of 10
	sta objWidthPixels_0600,X	; stores #3 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #4 byte of 10
	sta objHeightPixels_0601,X	; stores #4 byte of 10
	iny

	lda (objectPtr_38),Y		; loads #5 byte of 10 
	sta objHealthPoints_0603,X	; stores #5 byte of 10
	iny
	lda (objectPtr_38),Y		; loads #6 byte of 10
	sta someObjProperty_0302,X	; stores #6 byte of 10
	iny

	; What kind of ATTACK?
	lda (objectPtr_38),Y		; loads #7 byte of 10 
	sta someObjProperty_0301,X	; stores #7 byte of 10
	iny
	
	; Shooter Position: X Offset from Enemy's position
	lda (objectPtr_38),Y		; loads #8 byte of 10
	sta objShooterPosX_0604,X	; stores #8 byte of 10
	iny

	; Shooter Position: Y Offset from Enemy's position
	lda (objectPtr_38),Y		; loads #9 byte of 10
	sta objShooterPoxY_0605,X	; stores #9 byte of 10
	iny
	
	lda (objectPtr_38),Y		; loads #10 byte of 10
	sta someObjProperty_0700,X	; stores #10 byte of 10
	sta someObjProperty_0300,X	; stores #10 byte of 10
	
	lda new_X_Lo_54
	sta object_X_Lo_0400,X 	; X position, #2 byte of enemy profile
	lda new_X_Hi_55
	sta object_X_Hi_0401,X	; #3 byte of enemy profile
	lda new_Y_Lo_56
	sta object_Y_Lo_0402,X	; Y position, #4 byte of enemy profile
	lda new_Y_Hi_57
	sta object_Y_Hi_0403,X	; #5 byte of enemy profile
	
	lda #ZERO
	sta animationTable_Index_0503,X	; zero out 
	sta animationDelay_0504,X		; zero out 
	sta animationLoopCounter_0505,X	; zero out 
	sta someObjProperty_0303,X		; zero out 

	lda #OBJPROP_VALID
	sta objAttributes_1_0404,X ; Set as VALID OBJECT

	pla
	tay
	rts
.endproc
;
; $82C9
.proc HandlePhysics

	jsr CalculatePlayerHitBox

	lda #FALSE
	sta flagEnemyWillShoot_5A

	lda #OBJECT_BYTE_SIZE
	sta iterator_4D
	
	loopCheckCollisions:

		ldx iterator_4D
		lda objAttributes_1_0404,X
		bit BIT_4
		beq :++

			jsr HandleCollisionEffects
			lda someObjProperty_0303,X
			cmp #$02
			bne :+

				lda #$FF
				sta flagPlayerHit_1E
				lda #$00
				sta someObjProperty_0303,X		
			:
			jmp doneWithPhysics
		:
		lda objAttributes_1_0404,X
		bpl doneWithPhysics		; test BIT_7 for unresolved collision

		lda object_X_Hi_0401,X
		beq :+
		
		cmp #$FF
		bne SecondPart
		
		lda object_X_Lo_0400,X
		clc
		adc objWidthPixels_0600,X
		bcc SecondPart

		:
		lda object_Y_Hi_0403,X
		beq AI_EnemyWillShoot
		
		cmp #$FF
		bne SecondPart
		
		lda object_Y_Lo_0402,X
		clc
		adc objHeightPixels_0601,X
		bcs AI_EnemyWillShoot
	
		SecondPart:
		lda objAttributes_2_0405,X
		and #FLAG_4
		beq :+

		lda objAttributes_1_0404,X
		and #FLAG_5
		beq :++

		:
		lda #FLAG_4
		sta objAttributes_1_0404,X
		jmp doneWithPhysics

		:
		lda objAttributes_1_0404,X
		TURNOFF FLAG_5					;	and #(ALL1-FLAG_5)
		sta objAttributes_1_0404,X
		jmp doneWithPhysics
	
		AI_EnemyWillShoot:
			lda objAttributes_1_0404,X
			ora #FLAG_5
			sta objAttributes_1_0404,X
			
			jsr CalculateEnemyHitBox_X
			
			lda objAttributes_1_0404,X
			and #FLAG_3
			beq doneWithPhysics
			
			lda flagEnemyWillShoot_5A
			bne doneWithPhysics
			
			jsr HandleEnemyIA_Shooting_X
	
		doneWithPhysics:
		lda iterator_4D
		clc
		adc #OBJECT_BYTE_SIZE
		sta iterator_4D
		cmp #ENEMY_OBJECT_END				; 240, or 40 object slots of 6 bytes each
		beq :+
		jmp loopCheckCollisions

	:
	jsr HandleCollisionCheck
	
	rts
.endproc
;
; $8369
; Populate the Player's data ($0702-05) 
; with its hitbox's vertices coordinates.
.proc CalculatePlayerHitBox

	lda object_X_Lo_0400					; get player's X position
	clc
	adc #CONFIG_PLAYER_HITBOX_BORDER_XMIN	; add 8 pixels
	sta objHitBox_Left_X_0702			; store left X
	
	lda object_X_Lo_0400					; get player's X position
	adc objWidthPixels_0600					; add object's width (in pixels)
	sbc #CONFIG_PLAYER_HITBOX_BORDER_XMAX 	; subtract 8 pixels
	sta objHitBox_Right_X_0703			; store right X

	lda object_Y_Lo_0402					; get player's Y position
	adc #CONFIG_PLAYER_HITBOX_BORDER_YMIN	; add 3 pixels
	sta objHitBox_Top_Y_0704				; store top Y

	lda object_Y_Lo_0402					; get player's Y position
	adc objHeightPixels_0601					; add object's height
	sbc #CONFIG_PLAYER_HITBOX_BORDER_YMAX	; subtract 4 pixels
	sta objHitBox_Bottom_Y_0705			; store bottom Y

	rts
.endproc
;
; $8391
.proc CalculateEnemyHitBox_X

	lda objAttributes_2_0405,X
	and #OBJPROP_IS_NOT_BOSS
	beq objectIsBoss

	lda object_X_Hi_0401,X
	beq :+
	lda #$00
	beq :++
	
	:
	lda object_X_Lo_0400,X
	
	:
	sta objHitBox_Left_X_0702,X
	lda object_Y_Hi_0403,X
	beq :+
	lda #$00
	beq :++
	
	:
	lda object_Y_Lo_0402,X
	
	:
	sta objHitBox_Top_Y_0704,X
	lda object_X_Lo_0400,X
	clc
	adc objWidthPixels_0600,X
	cmp objHitBox_Left_X_0702,X
	bcs :+
	lda #$FF
	
	:
	sta objHitBox_Right_X_0703,X
	lda object_Y_Lo_0402,X
	clc
	adc objHeightPixels_0601,X
	cmp objHitBox_Top_Y_0704,X
	bcs :+
	lda #$FF
	
	:
	sta objHitBox_Bottom_Y_0705,X
	rts

	objectIsBoss: ; make the hit box the same size as the sprite
	
	lda object_X_Lo_0400,X
	sta objHitBox_Left_X_0702,X
	clc
	adc objWidthPixels_0600,X
	sta objHitBox_Right_X_0703,X
	lda object_Y_Lo_0402,X
	sta objHitBox_Top_Y_0704,X
	clc
	adc objHeightPixels_0601,X
	sta objHitBox_Bottom_Y_0705,X
	rts

.endproc
;
; $83F4
.proc HandleCollisionCheck	
; Clobbers A,X,Y
;
;	Checks every player object (player and arrows) 
;	against every enemy.
;
;	Y are the player's objects
;	Y = 0 (slot 0) THE PLAYER
;	Y = 6 (slot 1) HEART ICON?
;	Y = 12, 18, 24, 30, 36, 42 (slots from 2 to 7) arrows
;
;	X are the enemies
; 	X = 48 (slot 8/enemy slot 0)
; 	ends at X = 234 (enemy slot 31)
	ldy #ZERO
	
	loopOverPlayerObjects:

		lda objAttributes_1_0404,Y
		bmi :+						; if FLAG_7 this is a VALID object

		jmp nextCollisionCheck
	
	:
		lda objAttributes_2_0405,Y	; object flags
		bit BIT_OBJPROP_CAN_COLLIDE	; test for BIT 6: object can collide
		bne :+						; if flag set, continue
		
		jmp nextCollisionCheck		; if not, break
	
	:	
		lda objHitBox_Left_X_0702,Y 
		sta hitboxXRight_4F
		lda objHitBox_Right_X_0703,Y
		sta hitboxXLeft_50
		lda objHitBox_Top_Y_0704,Y
		sta hitboxYBottom_51
		lda objHitBox_Bottom_Y_0705,Y
		sta hitboxYTop_52	
		
		ldx #ENEMY_OBJECT_START 	; start of enemies slots
	
	loopOverEnemies:
		
		lda objAttributes_1_0404,X
		bpl noCollisionDetected
		
		and #OBJPROP_SHOT
		beq noCollisionDetected
		
		lda objAttributes_2_0405,X
		bit BIT_OBJPROP_CAN_COLLIDE
		beq noCollisionDetected
	
		and #OBJPROP_IS_NOT_BOSS
		bne :+

		cpy #ZERO
		beq :+
	
	noCollisionDetected:
		jmp nextEnemyObject ; mid-code drain to next enemy check
	
	:
		lda objHitBox_Left_X_0702,X
		cmp hitboxXLeft_50
		bcs noCollisionDetected

		lda hitboxXRight_4F
		cmp objHitBox_Right_X_0703,X
		bcs noCollisionDetected

		lda objHitBox_Top_Y_0704,X
		cmp hitboxYTop_52
		bcs noCollisionDetected

		lda hitboxYBottom_51
		cmp objHitBox_Bottom_Y_0705,X
		bcs noCollisionDetected

		lda objHealthPoints_0603,X
		sec
		sbc objAttackPoints_0602,Y
		beq :+
		bcs :++
	
	:
		jsr DispatchEnemy_X
		jmp :++
	
	:
		sta objHealthPoints_0603,X
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
		lda objHealthPoints_0603,Y
		sec
		sbc objAttackPoints_0602,X
		beq doHandleObjCollision
		bcc doHandleObjCollision
	
		cpy #$00
		bne doStoreHitPointsAndLeave
		cmp #$14
		bcs doStoreHitPointsAndLeave
		pha

		ADDRESS_TO_RAM Animation_PlayerFlying_8BD7, animationTable_Lo_0501 ; and 0502, word address

		lda #ZERO
		sta animationTable_Index_0503
		sta animationDelay_0504
		sta animationLoopCounter_0505
		pla
		cmp #$01
		bne doStoreHitPointsAndLeave

		pha
		lda #HEART_OFFSCREEN
		sta OAM_0200
		pla
	
	doStoreHitPointsAndLeave:
		sta objHealthPoints_0603,Y
		jmp nextCollisionCheck
	
	doHandleObjCollision:
		tya
		tax
		jsr HandleCollisionEffects
		jmp nextCollisionCheck
	
	nextEnemyObject:
		txa
		clc
		adc #OBJECT_BYTE_SIZE
		tax
		cmp #ENEMY_OBJECT_END
		bcc :+
		bcs nextCollisionCheck
	
	:
		jmp loopOverEnemies
	
	nextCollisionCheck:
		tya
		clc
	
		adc #OBJECT_BYTE_SIZE
		cmp #OBJECT_BYTE_SIZE*8
		bcs :+
		tay
		jmp loopOverPlayerObjects
	
	:
		rts
.endproc
;
; $84E2
.proc DispatchEnemy_X

	PushXY

	lda objAttributes_2_0405,X
	bit BIT_OBJPROP_IS_NOT_BOSS	
	bne :+						
		jmp doHandleObjCollision ; handle object pickup
	
	; There can be 2 sets of enemies on the screen
	:  
	bit BIT_OBJPROP_PARTOF_SET1 ; check for Set 1
	beq :+						

		lda enemySet1Size_2B
		beq doHandleObjCollision
		sec
		sbc #$01
		sta enemySet1Size_2B
		cmp #$01
		bne doALSOHandleObjCollision
		
		sta flagGenDrop_2E
		jsr GenerateDrop
		jmp doHandleObjCollision
	
	:  
	bit BIT_OBJPROP_PARTOF_SET2	; check for Set 2
	beq :+						

		lda enemySet2Size_2C
		beq doHandleObjCollision
		sec
		sbc #$01
		sta enemySet2Size_2C
		cmp #$01
		bne doALSOHandleObjCollision
		
		sta flagGenDrop_2E			; if an enemy set was completed, generate a drop
		jsr GenerateDrop
		jmp doHandleObjCollision
	
	:
	bit BIT_OBJPROP_UNUSED
	beq doALSOHandleObjCollision
	
		cpy #$00
		bne skipHandlingCollision
	
	doALSOHandleObjCollision:
		jsr HandleCollisionEffects
		lda soundIndex_8D
		cmp #$05
		beq skipHandlingCollision

		; Sound effect =================
		SOUNDENGINE_RESET 
		SOUNDENGINE_PLAY_ONCE #SFX_ENEMY_DEATH
		; ==============================

		jmp skipHandlingCollision
	
	doHandleObjCollision:
		jsr HandleCollisionEffects

	skipHandlingCollision:
	PullXY

	rts
.endproc
;
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

; $854C
.proc HandleCollisionEffects
; Checks if object with index X collided with something important.
; 	X = 0 is the player
	
	PushXY
	lda objAttributes_2_0405,X		; Object status flags
	bit BIT_OBJPROP_CAN_COLLIDE			; check if the object is tangible (flag 6)
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
			SOUNDENGINE_WAIT_SOUND_FINISHES
			SOUNDENGINE_RESET	
			SOUNDENGINE_PLAY_ONCE #SFX_EXTRA_LIFE
			; ==============================

			inc livesCounter_11
			jmp doneWithObjectCollision

		handlePlayerGotPowerUp:
			cmp #OBJTYPE_POWERUP ; $29	
			bne handlePlayerGotHeart 

			; Sound effect =================
			SOUNDENGINE_WAIT_SOUND_FINISHES
			SOUNDENGINE_RESET
			SOUNDENGINE_PLAY_ONCE #SFX_GAME_START
			; ==============================

			lda powerLevel_64
			cmp #CONFIG_PLAYER_MAX_POWER

			bcc :+ 	; if didn't reach maximum power, continue to power increase
					; else play sound cue and exit
			SOUNDENGINE_RESET
		
			jmp doneWithObjectCollision
		
			:
			inc powerLevel_64
			jmp doneWithObjectCollision
		
		handlePlayerGotHeart:
			cmp #OBJTYPE_HEART ; $2A	
			bne handlePlayerGotSpeedUp

			; Sound effect =================
			SOUNDENGINE_WAIT_SOUND_FINISHES
			SOUNDENGINE_RESET
			SOUNDENGINE_PLAY_ONCE #SFX_GAME_START
			; ==============================

			jsr AddOneHeart
			jmp doneWithObjectCollision
		
		handlePlayerGotSpeedUp:
			cmp #OBJTYPE_SPEEDUP; $2B
			bne handlePlayerGotMagicLamp

			; Sound effect =================
			SOUNDENGINE_WAIT_SOUND_FINISHES
			SOUNDENGINE_RESET
			SOUNDENGINE_PLAY_ONCE #SFX_GAME_START
			; ==============================

			lda #CONFIG_PLAYER_SPEED_FAST
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
			SOUNDENGINE_PLAY_ONCE #SFX_MAGIC_LAMP
			; ==============================

			lda #MAGIC_LAMP_HEALTH_POINTS
			sta objHealthPoints_0603

			ADDRESS_TO_RAM Animation_PlayerFlashing_8BBD, animationTable_Lo_0501 ; and 0502 word address
			
			lda #ZERO
			sta animationTable_Index_0503
			sta animationDelay_0504
			sta animationLoopCounter_0505
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
		SOUNDENGINE_WAIT_SOUND_FINISHES
		SOUNDENGINE_RESET
		SOUNDENGINE_PLAY_ONCE #SFX_PLAYER_DEATH

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

	SOUNDENGINE_PLAY_FOREVER #SFX_BOSS_DEATH


	lda #$08
	clc
	adc currentStage_15
	sbc #$00
	
	handleDespawning:
		sta objectType_58			; death animation index
		
		lda objAttributes_1_0404,X
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
		sta objAttributes_1_0404,X

	rts
.endproc
;
; $8696
; AddOneHeart
; Adds ONE HEART equivalent in health points to player.
; 
.proc AddOneHeart
	lda objHealthPoints_0603
	clc
	adc #HEART_HEALTH_POINTS
	
	bcc :+ 					; did not overflowed
	lda #$FF				; if overflowed, set it to maximum
	
	:			
	sta objHealthPoints_0603	; store it into player's health
	
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
	cpx #ENEMY_OBJECT_END
	bcc :+
	
	rts
	
	:
	lda objectType_58
	asl A
	asl A
	asl A
	tay
	lda Data_at8715+0,Y			; object VX table address
	sta animationTable_Lo_0501,X	; object VX table address
	lda Data_at8715+1,Y			; object VY table address
	sta animationTable_Hi_0502,X  ; object VY table address
	lda Data_at8715+2,Y
	sta objAttackPoints_0602,X
	lda Data_at8715+3,Y
	sta objAttributes_2_0405,X
	lda Data_at8715+4,Y
	sta objWidthPixels_0600,X
	lda Data_at8715+5,Y
	sta objHeightPixels_0601,X
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
	
	lda #ZERO
	sta animationTable_Index_0503,X
	sta animationDelay_0504,X
	sta animationLoopCounter_0505,X

	sta someObjProperty_0700,X
	sta someObjProperty_0300,X
	sta someObjProperty_0301,X
	lda #FLAG_7
	sta objAttributes_1_0404,X ; Set VALID OBJECT

	rts
.endproc
;
; $8715
; Object type table?
Data_at8715:
.include "objects/despawn/despawn_objects.inc"
;
; $8AEA
.proc GenerateDrop 
; Generate a random drop

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

	bne :+					
		; case 0: Extra life (1/8 chance)
		lda #($0A + $28)		; $0A + $28 
		bne doneWithDrops
	
	:
	bit BIT_0				
	bne :+
		; case 2, 4, 6: Power (3/8 chance)
		lda #($0A + $29)		; $0A + $29
		bne doneWithDrops
	
	:
	bit BIT_1					
	bne :+
		; case 1, 5: Heart (2/8 chance)
		lda #($0A + $2A)		; $0A + $2A
		bne doneWithDrops
	
	:						
		; case 3, 7: Speed (2/8 chance)
		lda #($0A + $2B)		; $0A + $2B
	
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


	; $0400-0400 holds the player's position
	; X_Lo, X_Hi, Y_Lo, Y_Hi
	;
	lda #CONFIG_PLAYER_START_X_Lo
	sta object_X_Lo_0400
	lda #CONFIG_PLAYER_START_X_Hi
	sta object_X_Hi_0401
	lda #CONFIG_PLAYER_START_Y_Lo
	sta object_Y_Lo_0402

	; Stores address for player's entering animation
	ADDRESS_TO_RAM Animation_PlayerEntering_8B7D, animationTable_Lo_0501

	; Player Status
	lda #(FLAG_7+FLAG_5)			; $A0
	sta objAttributes_1_0404

	lda #ZERO
	sta animationTable_Index_0503
	sta animationDelay_0504
	sta animationLoopCounter_0505

	sta flagTimerInSeconds_14
	sta soundIndex_8D

	lda #$1A
	sta someObjProperty_0302
	lda #$03
	sta objAttackPoints_0602
	
	lda #$14
	sta objWidthPixels_0600
	lda #$18
	sta objHeightPixels_0601
	
	lda #$18
	sta objShooterPosX_0604
	lda #$0E
	sta objShooterPoxY_0605

	lda #ZERO
	sta objAttributes_2_0405

	lda #$00
	sta arrowsFlying_60
	
	lda flagNextLevel_1B			; check if level transitioning
	bne :+							; if not, player has just died
		lda #CONFIG_STARTING_HEALTH	; reset player's health
		sta objHealthPoints_0603
		
		lda powerLevel_64			; check player's power
		beq :+						; if power is 0, skip decreasing
		dec powerLevel_64			; decrease player's power
	:

	rts
	
	unusedReturn:				; This part is unaccessible.
	sta powerLevel_64			; It seems to be left over from 
	rts							; older code.
.endproc
;
; $8B7D
; Player animation FLASHING and ENTERING the stage
Animation_PlayerEntering_8B7D:
.incbin "objects/data/misc/data-block-at8B7D.bin"
;.byte $0B, $10, $00, $81, $0C, $0C, $00, $81
;.byte $0D, $0B, $00, $81, $0B, $09, $00, $82
;.byte $0C, $07, $00, $82, $0D, $05, $00, $82
;.byte $0B, $00, $00, $81, $43, $00, $00, $82
;.byte $0C, $00, $00, $81, $43, $00, $00, $82
;.byte $0D, $00, $00, $81, $43, $00, $00, $82
;.byte $C7, $18, $0B, $00, $00, $86, $0C, $00 
;.byte $00, $86, $0D, $00, $00, $86, $FE, $32

; $8BBD
; Player animation FLASHING (magic lamp)
Animation_PlayerFlashing_8BBD:
.incbin "objects/data/misc/data-block-at8BBD.bin"
;.byte $0B, $00, $00, $81, $43, $00, $00, $83
;.byte $0C, $00, $00, $81, $43, $00, $00, $83
;.byte $0D, $00, $00, $81, $43, $00, $00, $83
;.byte $FE, $00

; $8BD7
; Player animation NORMAL (not flashing)
Animation_PlayerFlying_8BD7:
.incbin "objects/data/misc/data-block-at8BD7.bin"
;.byte $0B, $00, $00, $86, $0C, $00, $00, $86, $0D, $00, $00, $86, $FE, $00
;
; $8BE5
.proc InitializeHUD_Lives

	ldy #OBJECT_BYTE_SIZE		; Position of HEART in object array

	lda #LIVES_HUD_X
	sta object_X_Lo_0400,Y
	
	lda #LIVES_HUD_Y
	sta object_Y_Lo_0402,Y
	
	lda #(FLAG_5+FLAG_7)		; %1010 0000
	sta objAttributes_1_0404,Y
	
	lda #ZERO
	sta objAttributes_2_0405,Y
	sta animationTable_Index_0503,Y
	sta animationDelay_0504,Y
	sta animationLoopCounter_0505,Y
	sta someObjProperty_0302,Y
	sta someObjProperty_0303,Y
	sta objShooterPosX_0604,Y
	sta objShooterPoxY_0605,Y
	sta objAttackPoints_0602,Y

	lda #FULL					; the HEART icon doesn't really need health points
	sta objHealthPoints_0603,Y
	lda #$07					; sprite-1 (for no apparent reason)
	sta objWidthPixels_0600,Y
	lda #$07					; sprite-1
	sta objHeightPixels_0601,Y
	
	rts

.endproc
;
; $8C23
.proc TriggerNextLevel
	lda #ZERO
	sta objIndex_5F		; reset object handling index
	
	lda flagNextLevel_1B
	bne :+
		lda #CONFIG_PLAYER_SPEED_SLOW
		sta speedLevel_66
	
	:
	lda #FULL		; it could just be TRUE ($01)
	sta flagUpdateObjectsOnVBlank_5A
	rts
.endproc
;
; $8C34
.proc HandlePlayerShots
	; Shoots arrows according to flagLoadShots_4E
	; and to the player's current power level.
	; powerLevel_64 = 	1 - single arrow, shoot once
	;					2 - single arrow, shoot twice
	;					3 - triple arrow, shoot one
	;					4 - triple arrow, shoot twice
	; Clobbers A

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
	SOUNDENGINE_WAIT_SOUND_FINISHES
	SOUNDENGINE_RESET 
	; ==============================
	
	beq :++
	
	:
	cmp #$05
	beq doneShooting
	
	:
	SOUNDENGINE_PLAY_ONCE #SFX_ARROW_SHOT

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
	sta animationTable_Lo_0501,X
	lda Data_at8D1D+1,Y			; Movement Table hi byte
	sta animationTable_Hi_0502,X	

	lda Data_at8D1D+2,Y			; load byte 1
	cpy #$00					; check if single arrow
	beq :+						; if single arrow, skip forward
	clc							; else, 
	adc #$02					; add 2
	
	:
	sta objAttackPoints_0602,X		; store A (byte 1) #$02 single, #$04 triple
	lda Data_at8D1D+3,Y			; load byte 2
	sta someObjProperty_0302,X	; store byte 2
	lda Data_at8D1D+4,Y			; load byte 3
	sta objWidthPixels_0600,X		; store byte 3
	lda Data_at8D1D+5,Y			; load byte 4
	sta objHeightPixels_0601,X		; store byte 4
	
	lda object_X_Lo_0400		; load player X position from RAM
	clc
	adc Data_at8D1D+6,Y			; add arrow X position (byte 5)
	sta object_X_Lo_0400,X		; store arrow position
	
	lda object_Y_Lo_0402		; load player Y position from RAM
	clc
	adc Data_at8D1D+7,Y			; add arrow Y position (byte 6)
	sta object_Y_Lo_0402,X		; store arrow position
	
	lda #ZERO					; zero-out other properties
	sta animationTable_Index_0503,X
	sta animationDelay_0504,X
	sta animationLoopCounter_0505,X

	sta object_X_Hi_0401,X
	sta object_Y_Hi_0403,X
	sta objHealthPoints_0603,X

	lda #FLAG_6					; SET COLLISION ON
	sta objAttributes_2_0405,X

	lda #FLAG_7					; VALID OBJECT
	sta objAttributes_1_0404,X
	
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
;.incbin "objects/data/misc/data-block-at8D1D.bin"

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
		lda objAttributes_1_0404,X
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
.proc FindFreeObjectSlot_rX
	; Check if flags 7 and 4 are set in $0434
	; Starting at $0434 go over 32 slots stopping at
	; the first FREE slot.
	; Return the slot position in X
	clc
	ldx #ENEMY_OBJECT_START
	:
		lda objAttributes_1_0404,X
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
	
	lda someObjProperty_0301,X	; Is the enemy ready to shoot?
	bne :+						; if TRUE, continue
	
	rts

	:
	lda objAttributes_1_0404,X
	TURNOFF FLAG_3				; and #(ALL1-FLAG_3)
	sta objAttributes_1_0404,X

	lda someObjProperty_0700,X
	sta someObjProperty_0300,X
	
	lda someObjProperty_0301,X	; what kind of attack?

	; SIMPLE ENEMY SHOTS

	; single bubble at the player direction
	cmp #SHOOT_SINGLE_BUBBLE
	bne :+
		jsr ShootAtPlayer_X
		jmp doneHandlingShooting
	
	; multidirectional ring of bubbles
	:
	cmp #SHOOT_EIGHT_BUBBLES
	bne :+
		jsr SpawnProjectiles_8_X
		jmp doneHandlingShooting
	
	; COMPLEX BOSS SHOTS

	; wall of 4 bubble with a central wavy spark
	:
	cmp #SHOOT_5_BUBBLES
	bne :+++
	
		lda #LOWER
		bit frameCounter_12		; uses timer for diversity
		beq :+

			; 3 in 4 attacks are SHOOT_5_BUBBLES
			jsr Level_1_Attack
			jmp :++
	
		; 1 in 4 attacks is just SHOOT_SINGLE_BUBBLE
		:
		jsr ShootAtPlayer_X
	
		:
		lda flagBossFight_1A
		beq :+
		jsr HandleBossAnimation_Shooting
	
	:
	cmp #SHOOT_3_COMETS
	bne :+
	jsr Level_2_Attack
	jsr HandleBossAnimation_Shooting
	
	:
	cmp #SHOOT_3_COMETS_2_AMBERS
	bne :+
	jsr Level_3_Attack
	jsr HandleBossAnimation_Shooting
	
	:
	cmp #SHOOT_3_COMETS_5_AMBERS
	bne doneHandlingShooting
	jsr Level_4_Attack
	jsr HandleBossAnimation_Shooting
	
doneHandlingShooting:
	lda #TRUE
	sta flagEnemyWillShoot_5A
	rts
.endproc
;
; $8DDB
.proc ShootAtPlayer_X
;
; Return which of the 8 available directions is closest to the player,
; From enemy X to the player.
; This routine decides which one of those 8 directions
; the projectile should follow.
;
; 	X register is the enemy that is going to shoot.
;
;					\ 		|	    /
;					  \		|	  /
;						\	|	/
;					----- Enemy ------
;			  			/	|	\
;			   		  /		|	  \
;					/		|	    \
;
;	In this case, both X and Y velocities must be negative.
;
; 	Clobbers A

	lda #$00
	sta dirDelta_4B			; reset result
	
	; deltaX
	lda object_X_Lo_0400,X	; load enemy X position
	sec
	sbc object_X_Lo_0400	; subtract player's X position
	bcs :+					; if Enemy_X >= Player_X, skip ahead.
		eor #FULL			; if not (Enemy_X < Player_X), get the complement.
	:
	rol dirDelta_4B			; roll in the carry (sign) into dirDelta_4B.
	sta dirDeltaSmallest_4C	; store the difference between the two X positions.

	; At this point, dirDeltaSmallest_4C is the absolute value of the distance in X
	; dirDelta_4B is the sign of the distance in X (1 = positive, 0 = negative)
	; In other words, dirDelta_4B tell us if the player is to the left (1) or right (0) of the enemy.

	; deltaY
	lda object_Y_Lo_0402,X	; load enemy Y position
	sec
	sbc object_Y_Lo_0402	; subtract player's Y position
	bcs :+					; if Enemy_Y >= Player_Y, skip ahead.
		eor #FULL			; if not (Enemy_Y < Player_Y), get the complement.
	:
	rol dirDelta_4B			; roll in the carry (sign) into dirDelta_4B.
							; A still holds the difference betweem the two Y poitions.

	; At this point, BIT0 of dirDelta_4B is the sign of the distance in Y (1 = positive, 0 = negative)
	; In other words, dirDelta_4B tell us if the player is above (1) or below (0) the enemy.
	;
	; When combined, there are 4 possibilities for dirDelta_4B:
	;
	;					    	|	  
	;					 11 	|	 01
	;						 	|	
	;					----- Enemy ------
	;			  			 	|	
	;			   		 10 	|	 00
	;					   		|	  
	; In other words, dirDelta_4B is the QUADRANT of the player relative to the enemy.
	;
	; To calculate the OCTANT, we need to know which component is larger: deltaX or deltaY.
	;
	cmp dirDeltaSmallest_4C		; Compare the deltaX(dirDeltaSmallest_4C) and deltaY(A).
	bcs :+						; If (deltaY>=deltaX), dont't swap them.
		ldy dirDeltaSmallest_4C	; else (deltaY<deltaX), swap them.
		sta dirDeltaSmallest_4C	; this holds the SMALEST component
		tya						; and A holds the LARGEST component	
	:	
	rol dirDelta_4B				; roll in the carry (sign) into dirDelta_4B.

	; At this point, dirDelta_4B is the OCTANT of the player relative to the enemy.
	; The new BIT0 indicate which "cone" the player is in relative to the enemy.
	;
	;					\ 	 dY>=dX		/
	;					  \		1 	  /
	;						\		/
	;			dX>dY	0	  Enemy 	0	dX>dY
	;						/		\
	;			   		  /		1	  \
	;					/	 dY>=dX	    \

	; When combined, the 3 bits of dirDelta_4B are the OCTANT of the player relative to the enemy.
	;
	;					 	  
	;					\111(7) | 011(3)/
	;			  	 	 \		|	  /		
	;				110(6) \	|	/ 010(2)
	;					----- Enemy ------
	;			  	100(4)	/	|	\ 000(0)
	;			  		  /		|	  \		
	;					/101(5)	| 001(1)\
	;					 			  
	;
	; So that dirDelta_4B indexes a table of octants, 
	; pointing to the correct data in projectiles.inc
	;
	sec
	sbc dirDeltaSmallest_4C
	
	; Division
	; This divides the largest component by the smallest one.
	ldy #$00					
	:							; 
		sec						; Division is just counting how
		sbc dirDeltaSmallest_4C	; many times one can subtract
		bcc :+					; the divisor from the dividend,
		iny						; before the result becomes negative.
		cpy #$04				; This division is limited to 4.
		bcc :-
	:
	tya							; Store the result of the division in A.
	;
	;	At this point, A holds how many times the largest delta
	;	is larger than the smallest one, limited to 4.
	;
	;	So, every octant has 5 possible values: A=0,1,2,3,4
	
	ldy dirDelta_4B			; Use the sign as LUT index


	clc
	adc Data_at8E25,Y		; Add the LUT value to the division result
	asl A					; 2*A since addresses are 16-bit words.
	sta projectileIndex_4A	; Store the index for the SpawnProjectile_Y.
	txa
	tay						; Transfer the Enemy index to Y.
	jsr SpawnProjectile_Y 	; Spawn the projectile.
	
	rts

.endproc
;
; macro SpawnMultipleProjectiles_X
; Spawn a given <number> of projectiles
; from given <address>, using call
.macro SpawnMultipleProjectiles_X address, number
	txa
	tay
	ldx #$00
	
	:
		lda address,X
		sta projectileIndex_4A
		jsr SpawnProjectile_Y
		inx
		cpx #number
		bne :-
.endmacro
;
; $8E25
	; 	LUT of OFFSETS
Data_at8E25:
;offset	$00	 $01	$02	$03	$04	 $05	$06	$07
.byte 	$0f, $23, $0a, $19, $05, $1e, $00, $1e; <- this is a legit error in the original code!
; Octant 7 should have $14 instead of $1e on the table above.
;
; $8E2D
; Shoot Bubbles 8 directions
.proc SpawnProjectiles_8_X
	SpawnMultipleProjectiles_X Data_at8E3F, $08
	rts
.endproc
;
; $8E3F
Data_at8E3F:
.byte $00, $08, $0a, $44, $46, $1c, $14, $30
;
; $8E47
.proc SpawnProjectile_Y
	; Spawn a projectile from Enemy Y
	PushXY
	
	jsr FindFreeObjectSlot_rX			; get free slot
	cpx #ENEMY_OBJECT_END				; check if list is full
	bcs doneSpawningProjectiles			; if TRUE, break.

		jsr GetShooterPosition_X_Y		; Retrieve's the shoorter's position and allocate the projectile's vertex
		
		ldy projectileIndex_4A
		jsr AllocateNewProjectile_X_Y

		lda #$01
		sta objAttackPoints_0602,X
		
		lda #(FLAG_5+FLAG_6)
		sta objAttributes_2_0405,X
		
		lda #$04
		sta objWidthPixels_0600,X
		sta objHeightPixels_0601,X
		
		lda #ZERO
		sta objHealthPoints_0603,X
		sta someObjProperty_0301,X
		sta someObjProperty_0302,X
		
		lda #FLAG_7
		sta objAttributes_1_0404,X
	
	doneSpawningProjectiles:
	PullXY
	rts
.endproc
;
; $8E81
.proc GetShooterPosition_X_Y
	; Updates the position of an object X
	; by adding a displacement from an Enemy (Y) A.I.

	; Calculate Shooter's X
	lda object_X_Lo_0400,Y 		; Get Enemy's X_Lo
	clc
	adc objShooterPosX_0604,Y 	; Add OFFSET in X
	sta object_X_Lo_0400,X 		; Store in Projectile's X_Lo
	lda object_X_Hi_0401,Y 		; Get Enemy's X_Hi
	adc #$00					; Add carry to X_Hi
	sta object_X_Hi_0401,X		; Stores in Projectile's X_Hi

	; Calculate Shooter's Y
	lda object_Y_Lo_0402,Y 		; Get Enemy's Y_Lo
	clc							
	adc objShooterPoxY_0605,Y 	; Add OFFSET in Y
	sta object_Y_Lo_0402,X		; Store in Projectile's Y_Lo
	lda object_Y_Hi_0403,Y 		; Get Enemy's Y_Hi
	adc #$00					; Add carry to Y_Hi
	sta object_Y_Hi_0403,X		; Stores in Projectile's Y_Hi

	rts
.endproc
;
; $8EA6
.proc AllocateNewProjectile_X_Y
	; Allocate a new projectile from offset Y
	; into object position X
	lda Projectile_Trajectories_at8EBE+0,Y
	sta animationTable_Lo_0501,X
	lda Projectile_Trajectories_at8EBE+1,Y
	sta animationTable_Hi_0502,X
	
	lda #ZERO
	sta animationLoopCounter_0505,X
	sta animationTable_Index_0503,X
	sta animationDelay_0504,X

	rts
.endproc
;
; $8EBE
; Projectile Trajectories Table
Projectile_Trajectories_at8EBE:
.include "objects/misc/projectiles.inc"
;
;
; $927F
; Level_1_Attack (The Witch) - First used by level 1 boss, 
; later by bedouins.
; Shoots 5 Sparkles (4 linear and 1 wavy)
.proc Level_1_Attack 	
	SpawnMultipleProjectiles_X Data_at9291, $05
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
	SpawnMultipleProjectiles_X Data_at92A8, $03
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
	SpawnMultipleProjectiles_X Data_at92BD, $05
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
	SpawnMultipleProjectiles_X Data_at92D4, $08
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
	sta someObjProperty_0303+ENEMY_OBJECT_START

	lda animationTable_Lo_0501+ENEMY_OBJECT_START
	sta animationTable_Lo_0501+ENEMY_OBJECT_START+page_5_Gap
	lda animationTable_Hi_0502+ENEMY_OBJECT_START
	sta animationTable_Hi_0502+ENEMY_OBJECT_START+page_5_Gap
	lda animationTable_Index_0503+ENEMY_OBJECT_START
	sta animationTable_Index_0503+ENEMY_OBJECT_START+page_5_Gap
	lda animationDelay_0504+ENEMY_OBJECT_START
	sta animationDelay_0504+ENEMY_OBJECT_START+page_5_Gap
	lda animationLoopCounter_0505+ENEMY_OBJECT_START
	sta animationLoopCounter_0505+ENEMY_OBJECT_START+page_5_Gap
	
	lda #ZERO
	sta animationTable_Index_0503+ENEMY_OBJECT_START
	sta animationDelay_0504+ENEMY_OBJECT_START
	sta animationLoopCounter_0505+ENEMY_OBJECT_START

	ADDRESS_TO_RAM Data_at932D, objectPtr_34 ; see data below

	lda currentStage_15			; get stage index (starts at 1)
	sec
	sbc #$01					; shifts down (starts at 0)
	asl A						; 2*A (since addresses are 16-bit words)
	tay							; use as Y index

	lda (objectPtr_34),Y		; boss shooting animation address (lo)
	sta animationTable_Lo_0501+ENEMY_OBJECT_START
	iny
	lda (objectPtr_34),Y		; boss shooting animation address (hi)
	sta animationTable_Hi_0502+ENEMY_OBJECT_START
	
	PullXY
	rts
.endproc
;
; $932D
Data_at932D:
;Boss animation frames
.include "objects/misc/boss_animation_frames.inc"
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
	sta animationTable_Lo_0501,Y
	lda LivesGraphicData+1,X
	sta animationTable_Hi_0502,Y
	rts
.endproc
;
; $937C
LivesGraphicData:
.include "objects/data/hud_lives.inc"
;
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
;		StartingNewStage
;	or
;		EndGame
; Both of which are part of the main program.
; Because of this, this block is actually part of the main program too.
.proc HandleStageClear

	jsr PaletteFading			; Fade-out palletes
	
	lda #$02					
	jsr WaitForSeconds_A		; Wait 2 seconds
	
	lda currentStage_15
	cmp #LAST_STAGE_INDEX		; Check if the last stage was completed
	bne :+						; if not, skip ahead.
		jmp EndGame				; else (completed last stage), end the game.
	
	:							; This next block clears OAM but retains the heart Y position
	lda OAM_0200				; Load the current HEART_HUD_Y position.
	pha							; Push it away
	jsr ClearPage_2_OAM			; Clear page 2 (objects)
	pla							; Pull it back
	sta OAM_0200				; Restore the current HEART_HUD_Y position.
	COPY_DATA HeartHUDData, OAM_0200, #1, #4 ; Copy the rest of the HEART_HUD data.

	lda objHealthPoints_0603		; Load the current health points.
	pha							; Push it away
	jsr ClearPages_3_to_7		; Clear pages 3 to 7
	pla							; Pull it back
	sta objHealthPoints_0603		; Restore the current health points.

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
	sta updateAtVBlank_0E
	lda #$75
	sta updateAtVBlank_0F
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
.proc LoadStage_A_X
	jsr WaitVBlank				; Wait for VBlank to start and end

	ldy #$00
	sty PpuMask_2001			; Mask off rendering
	sty PpuControl_2000			; Turn off PPU
	
	asl A						; Multiply by 2
	tay							; Store A in Y
	txa							; Transfer X to A
	pha							; Store A(X) in stack

	lda BackgroundData_E847+0,Y	; Load Lo byte of address of background data
	sta addressPtr_32+0			; Store Lo byte of address of background data
	lda BackgroundData_E847+1,Y	; Load Hi byte of address of background data
	sta addressPtr_32+1			; Store Hi byte of address of background data
	
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
; Wait for the next VBlank to start and then for it to end.
	pha
	
	jsr CheckForVBlank		; Check if VBlank is active
	:						; Wait for VBlank to end
		lda PpuStatus_2002
		bpl :-
	pla

	rts
.endproc
;
; $9564
.proc CheckForVBlank
; Check if VBlank is active
;	PpuStatus_2002 (read only)
; 	VSO- ----	vblank (V), sprite 0 hit (S), sprite overflow (O);
; 	Bit7 (V) can be checked with either bmi (TRUE) or bpl (FALSE)
	:
		lda PpuStatus_2002
		bmi :-
	rts
.endproc
;
; $956A
; WaitForSeconds_A
; Wait for a given number of seconds.
; A times 62 frames.
.proc WaitForSeconds_A
	:
		pha
		lda #$00
		sta flagTimerInSeconds_14
		:
			lda flagTimerInSeconds_14
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
.proc RenderingON
	
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
	; Reads 8 bits from control A
	; A control being read: 0 = player 1, 1 = player 2
	; Stores the result in input1_20
	; 
	; Comment:
	; Since this function clobbers X and it
	; calls ShiftRegisterController_X, which clobbers A,
	; there doesn't seem to be a reason not to use X as controller 
	; index from the start.

	; Strobe control port to reset its latch.
	ldx #$01			; High
	stx Ctrl1_4016
	ldx #$00			; Low
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
.proc ShiftRegisterController_X
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

	asl input1_20			; Shift bits to the left <<
	lda Ctrl1_4016,X		; retrieve controller port X

	; A non-zero value means a button is pressed.
	; Shift up to 6 times for more precision (avoid ghosting or input lost)
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
		SCROLL_XY screenScrollX_29, #$00
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
	jsr LoadStage_A_X
	lda #$88
	ora #$18
	sta flagPPUControl_17
	sta flagPPUControl_19
	jsr RenderingON
	
	SOUNDENGINE_PLAY_FOREVER #SONG_ENDING

	loopPressANYButton:
		lda input1_20
		beq loopPressANYButton
	
	sta inputPrev_22
	:
		lda input1_20
		cmp inputPrev_22
		beq :-
	
	SOUNDENGINE_STOP

	lda #$00
	sta screenScrollX_29
	sta var_2A
	jsr PaletteFading
	jsr RenderingOFF
	jsr ClearPage_2_OAM
	lda #$02			; Wait 2 seconds before
	jsr WaitForSeconds_A	; respawings the player
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
	TURNOFF FLAG_4				; and #(ALL1-FLAG_4)
	sta flagPPUControl_17
	sta flagPPUControl_19
	
	lda #$0B
	ldx #$00
	jsr LoadStage_A_X
	jsr RenderingON
	lda #$00
	jsr RollEndCredits_A
	lda #$01
	jsr RollEndCredits_A
	lda #$02
	jsr RollEndCredits_A
	lda #$03
	jsr RollEndCredits_A
	lda #$04
	jsr RollEndCredits_A
	lda #$05
	jsr RollEndCredits_A

	lda #$00
	sta PpuScroll_2005  ; reset scrolling
	sta PpuScroll_2005
	
	: 		; End of Credits
	jmp :-  ; This is the shortest loop to soft lock the game. Must Reset!
.endproc
;
; $96AC
.proc RollEndCredits_A
	; Write the End Credits from address EndCreditsData_9718
	; A select which phrase to write (the are six: 0 to 5).

	asl A				; multiply by 2 since addresses are WORDs
	tay

	COPY_WORD_Y EndCreditsData_9718, addressPtr_32

	; addressPtr_32 holds the address for the phrase
	; the first two bytes are the "coordinates" where to write
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
	; a control character EOL($FF) is found
	loopLoadCredits:
		
		; move "cursor" to the correct position
		lda vramAddress_67+0	
		sta PpuAddr_2006		; hi-byte write
		lda vramAddress_67+1
		sta PpuAddr_2006		; lo-byte write
		
		
		lda (addressPtr_32),Y	; load the next character (ASCII code)
		
		cmp #EOL				; if "EOF", finish writing line.
		beq doneWriting
		
		
		cmp #$20				; if "SPACE", write character $OO
		bne :+

			lda #$00
			sta PpuData_2007
			RESET_SCROLLING		; reset scrolling register
			beq :++

		: 						; writing a character
		sec
		sbc #ASCII_TO_CHR_OFFSET; subtract offset to convert from ASCII to CHR
		sta PpuData_2007
		RESET_SCROLLING			; reset scrolling register
		
		; play a sound effect
		SOUNDENGINE_PLAY_ONCE #SFX_TYPE_WRITER

		: ; advance to next screen position
		lda vramAddress_67+1
		clc
		adc #$01
		sta vramAddress_67+1
		lda vramAddress_67+0
		adc #$00
		sta vramAddress_67+0

		; wait 7 vblanks between characters
		ldx #TYPEWRITER_FRAME_INTERVAL
		:
			jsr WaitVBlank
			dex
			bne :-
		iny
		bne loopLoadCredits
	
	SOUNDENGINE_RESET
	
	doneWriting:
	rts

.endproc
;
; $9718
EndCreditsData_9718:

.addr EndingText_9724, EndingText_9733
.addr EndingText_974F, EndingText_976B
.addr EndingText_9785, EndingText_97A3

EndingText_9724:
.byte $20, $6d, "STAFF       ", EOL

EndingText_9733:
.byte $21, $06, "PROGRAM  BY  PATRICK     ", EOL

EndingText_974F:
.byte $21, $86, "GRAPHIC  BY  JULIA       ", EOL

EndingText_976B:
.byte $22, $08, "MUSIC  BY  RUTH        ", EOL

EndingText_9785:
.byte $22, $a4, "SPECIAL THANKS  MARTINO    ", EOL

EndingText_97A3:
.byte $23, $4c, "THE END", EOL

;
; $97AD
.proc ShowGameOver_WaitAnyButtonPress
	lda #$00
	sta currentStage_15
	sta PpuControl_2000
	jsr WaitVBlank
	lda flagPPUMask_18
	TURNOFF FLAG_4 			; and #(ALL1-FLAG_4) $EF
	sta PpuMask_2001
	lda flagPPUControl_19
	sta flagPPUControl_17
	jsr WaitVBlank
	jsr ClearPage_2_OAM

	COPY_DATA Data_at97F5, OAM_0200, #$00, #$20

	jsr UpdatePPUSettings
	lda #$02				; Waits 2 seconds
	jsr WaitForSeconds_A	; before respawning the player
	lda #$00
	sta timerInSeconds_13
	
	; Wait for any button to be pressed before reseting.
	;
	; Checks for a button being pressed and then released.
	; First, checks for button presses every 10 frames.
	; Then, checks for a change on the controller state every frame.
	: ; Check for press
	lda input1_20			; Load current button being pressed.
	bne :+					; If pressed, skip forward.
	lda timerInSeconds_13	; else, check if 10 frames have passed.
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
.incbin "objects/data/misc/data-block-at97F5.bin"
;
; =====================================================
;	SOUND ENGINE AND DATA
; =====================================================
;
; $9815
.include "sounds/sounds.asm"
;
; =====================================================
;
; $A3AC
.proc HandleVBlank

	PushAXY
	
	; Check if only sound should be updated
	lda updateAtVBlank_0E
	cmp #$57
	beq :+	
		jmp doUpdateSoundOnly

	:
	lda updateAtVBlank_0F
	cmp #$75
	beq :+
		jmp doUpdateSoundOnly

	; Proceed with regular VBLANK updates
	:	; Setup OAM DMA
		GAMEENGINE_DMA #>OAM_0200	; DMA from RAM page 2 to OAM

		lda PpuStatus_2002
		inc frameCounter_12
		lda frameCounter_12
		and #FRAMES_TO_SECOND 		; $3F = every 62 frames, increase aliveTimer
		bne :+

		inc flagTimerInSeconds_14
		inc timerInSeconds_13

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
		
		SCROLL_XY screenScrollX_29, #$00
		
		lda flagPPUControl_19
		sta PpuControl_2000
	
		lda frameCounter_12
		and #$01 				 ; Checking if this is an ODD frame
		bne :+					 ; Skip if ODD
			dec nextEnemyWave_5C ; Decrement the counter for next enemy batch on EVEN frames

	:	; Check if objects should be updated
		lda flagUpdateObjectsOnVBlank_5A
		beq :+

		jsr HandleControllerInputs	
		jsr HandleSpriteUpdates		; Most expensive
	
	:
		jsr PowerUpCheat

	doUpdateSoundOnly:
		SOUNDENGINE_UPDATE_DURING_VBLANK	; Sound is always very expensive

	PullAXY
	
	rti
.endproc
;
; $A424
.proc ReadControl_1
	lda #ZERO
	jsr ReadControl_A
	rts
.endproc
;
; $A42A
.proc HandleScrollingControl

	ldx flagGameMode_26
	bne :+	; any mode that's not GAMEMODE_STAGE ($00) doesn't scrool

	inc frameScrollCtr_28
	lda frameScrollCtr_28
	cmp frameScrollAt_27
	bcc :+
	
	; doScrollBackground
	lda #ZERO
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

		lda #GAMEMODE_BOSSFIGHT
		sta flagGameMode_26
	
		doKeepScrollingStage:
		clc
		inc levelProgression_16
		lda flagPPUControl_19
		Flip FLAG_0
		sta flagPPUControl_19
	
	doneWithScrolling:
	rts

.endproc
;
; $A458
; ===================================
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
; ===================================
;
; $A46F
.proc HandleSpriteUpdates
; This routine updates every sprite of the game 
; It is called 60 times per second, at every VBlank time.
; Since it takes longer than vblank, its internal state is global

; Globals
;	objIndex_5F 	Holds the next object index to be updated
;					It maybe be reset by TriggerNextLevel

;	oamAddressPtr_3E Restarts from #FIRST_OBJECT_SLOT at every call
; 	beingUpdated_3D	 Holds the object being worked on
;					 Necessary to check if objIndex_5F was changed 
;					 externally.

	lda #FIRST_OBJECT_SLOT		; Updates start AFTER heart icon
	sta oamAddressPtr_3E		; Store first OAM address
	
	lda objIndex_5F				; Get current objetc index
								; It counts from 0 to 240 or 240 to 0, 
								; depending on objIndexStep_59
	sta beingUpdated_3D			; Store current object index
	
	loopOverObjects:

		ldx objIndex_5F			; load object index into X
		lda objAttributes_1_0404,X	; check if object should be handled
		bmi :+						; if BIT7 is set, handle object		
			jmp NextObjectIndex		; else move forward.
	
	: 
		ldy animationDelay_0504,X
		beq :+ 
		
			dec animationDelay_0504,X
			dec animationTable_Index_0503,X
			jmp UpdateMovementFromDeltas
	
	:
		lda animationTable_Lo_0501,X	; Loads ANIMATION address (Lo)
		sta objectPtr_36+0
		lda animationTable_Hi_0502,X	; Loads ANIMATION address (Hi)
		sta objectPtr_36+1
		
		ldy animationTable_Index_0503,X	; Loads ANIMATION frame index
	

		ReplaceMeLabel_7:
		
			;	Let's analyze one case: shooting 
			;	lda (objectPtr_36),Y reading the animation table at 8F3F
			; 	$16, $FF, $FF, $C2, $00, $16, $FF, $00, $81, $FE, $00
			;
			;	$16 doesn't have bit7, so it will load the animation/movement.
			;	UpdateAnimationFrame
			;	$16 is a offset and need to be doubled (word)
			; 

			lda (objectPtr_36),Y 		; reads next animation instruction
			bmi :+				 		; if BIT7 is set, this is a control byte
				jmp UpdateAnimationFrame  ; if  BIT7 is NOT set, will load
		
			:
			asl A						; remove BIT7
			bmi ReplaceMeLabel_1		; if BIT6 is set, jump to ReplaceMeLabel_1

			; If ONLY BIT7 is set (and not BIT6), then this is the animation delay.
			lsr A						; return to original value (sans BIT7)
			sbc #$00					; optimization for subtracting 1 since 
										; the carry flag C will always be cleared
										; by the las bmi
			
			sta animationDelay_0504,X	; This is the animation delay, or how many frames
										; need to be waited before updating both animation
										; and movement of projectiles and enemies.
		
		UpdateMovementFromDeltas:
			lda objAttributes_2_0405,X
			bpl MaintainPosition		; test BIT_OBJPROP_IS_FIXED

				lda objDeltaX_0C
				AddByte2Word_A_X objDeltaX_0C, object_X_Lo_0400, object_X_Hi_0401, tPositionXLo_40, tPositionXHi_41, temp_47

				lda objDeltaY_0D
				AddByte2Word_A_X objDeltaY_0D, object_Y_Lo_0402, object_Y_Hi_0403, tPositionYLo_42, tPositionYHi_43, temp_49

				jmp ReplaceMeLabel_5
		
		MaintainPosition:				; just copy position from object to temp variables
			lda object_X_Lo_0400,X
			sta tPositionXLo_40
			lda object_X_Hi_0401,X
			sta tPositionXHi_41
			lda object_Y_Lo_0402,X
			sta tPositionYLo_42
			lda object_Y_Hi_0403,X
			sta tPositionYHi_43
		

		ReplaceMeLabel_5:
			inc animationTable_Index_0503,X
			lda objCurrentFrameOffset_0701,X
			tax
			lda AnimationAtlas_A895+0,X
			sta addressPtr_32+0
			lda AnimationAtlas_A895+1,X
			sta addressPtr_32+1
			ldx objIndex_5F
			jmp ReplaceMeLabel_6
		
		ReplaceMeLabel_1:
			asl A						; remove BIT7 (formaly BIT6)
			bmi checkForControl			; if BIT7 is set, check for control byte

			dec animationLoopCounter_0505,X
			lda animationLoopCounter_0505,X
			bne :+
				iny
				iny
				jmp ReplaceMeLabel_7
		
		:
			bpl loopReadingAnimation

			lda (objectPtr_36),Y
			and #(FLAG_4+LOWER)
			sta animationLoopCounter_0505,X
			
			loopReadingAnimation:
				iny							; advance to next index in animation table
				lda (objectPtr_36),Y		; read new index in animation table
				tay
				lda (objectPtr_36),Y		; loads next animation frame index
				jmp UpdateAnimationFrame	; retrieve frame
				
				checkForControl:
					cmp #$F8
					beq loopReadingAnimation
			
			asl A
			bmi :+

				DIV8 A
				and #LOWER
				lda objAttributes_1_0404,X
				TURNON FLAG_3
				sta objAttributes_1_0404,X
				jmp NextObjectIndex
		
		:
			lda someObjProperty_0303,X
			cmp #$03
			bne :+
			beq :++
		
		:
			cmp #$04					; Boss Death
			bne :++

				lda #$01
				sta flagNextLevel_1B
		
		:
			lda #$00
			sta someObjProperty_0302,X
			sta someObjProperty_0303,X
		
		:
			cmp #$05					; Boss Shooting
			bne :+ 
			jsr Copy_5BytesPage05_FromEnd_ToBeginning
			jmp :++
		
		:
			lda #$10
			sta objAttributes_1_0404,X
		
		:
			jmp NextObjectIndex
			
			; UpdateAnimationFrame
			; $16 is a offset and need to be doubled (word)
			; X = $2C
			; sta objCurrentFrameOffset_0701,X (X = object index)
			; objCurrentFrameOffset_0701,X stores the offset $2C
			; X = A ($2C)
			

		UpdateAnimationFrame:					; A holds index for object's animation frame to be loaded
			asl A								; transform index in WORD offset.
			sta objCurrentFrameOffset_0701,X 	; stores animation frame index.
			tax									; start using index as X offset
			COPY_WORD_X AnimationAtlas_A895, addressPtr_32
			; Now addressPtr_32 points to the animation frame
			
			iny									; advance to next index from projectile/animation
			ldx objIndex_5F						; Load current object index
			lda objAttributes_2_0405,X			
			bpl :+								; Branch if !BIT7 of objAttributes_2_0405
				
				lda (objectPtr_36),Y			; Load next byte from ANIMATION TABLE
				clc								
				adc objDeltaX_0C				; Add it to delta X
				jmp :++
		
				:								; It BIT7 of objAttributes_2_0405 is ONE
				lda (objectPtr_36),Y			; Load next byte from ANIMATION TABLE
		
			:
			sta tile_X_Lo_46
			AddByte2Word_A_X tile_X_Lo_46, object_X_Lo_0400, object_X_Hi_0401, tPositionXLo_40, tPositionXHi_41, temp_47

			iny									; next index in ANIMATION TABLE
			lda objAttributes_2_0405,X
			bpl :+
				lda (objectPtr_36),Y
				clc
				adc objDeltaY_0D
				jmp :++

			:
				lda (objectPtr_36),Y
			
			:
			sta delta_Y_Lo_48
			AddByte2Word_A_X delta_Y_Lo_48, object_Y_Lo_0402, object_Y_Hi_0403, tPositionYLo_42, tPositionYHi_43, temp_49
			
			iny								; advance to next index in ANIMATION TABLE
			tya								; stores index in Y
			sta animationTable_Index_0503,X	; stores index in object's animation frame index
		
		ReplaceMeLabel_6:
			lda objAttributes_1_0404,X
			and #OBJPROP_SHOT
			bne :+

			jmp NextObjectIndex
		
		:
			lda objAttributes_2_0405,X
			and #(OBJPROP_UNKNOWN+OBJPROP_IS_NOT_BOSS)
			beq :+

			lda frameCounter_12
			and #$03					; A%3 = 0, 1, or 2
			bne :+

			dec someObjProperty_0300,X
			lda someObjProperty_0300,X
			bne :+

			lda objAttributes_1_0404,X
			ora #OBJPROP_TODO
			sta objAttributes_1_0404,X
		
		; loads a frame of animation
		; X indexes the object
		; Y indexes the byte being loaded
		:				
			ldy #$00			  	; starts from first tile
			lda (addressPtr_32),Y 	; reads object WIDTH in pixels
			bpl :+				  	; if positive, continue
				jmp WriteOAMEntry  	; if negative, do something else
		
		:
			sta objWidthPixels_0600,X	; stores WIDTH in pixels
			DIV8 A						; divide by 8 (get size in tiles)		
			clc		
			adc #$01					; add 1
			sta tilesWidth_44  			; store W+1 in future counter
			iny							; next value
			lda (addressPtr_32),Y		; reads	object HEIGHT in pixels
			sta objHeightPixels_0601,X	; store HEIGHT in pixels
			DIV8 A						; divide by 8 (get size in tiles)
			clc
			adc #$01					; add 1
			sta counter_H_45			; store H+1 in counter
			iny							; next value
			ldx oamAddressPtr_3E		; loads next OAM free address
		
		loopLoadFrames:
			
			lda tilesWidth_44
			sta counter_W_3C			; counts tiles in X
			
			lda tPositionXLo_40			; X position LO
			sta tile_X_Lo_46
			
			lda tPositionXHi_41			; X position HI
			sta temp_47
		
		
			loopLoadFrameTiles:			; load frame tiles
				
				lda (addressPtr_32),Y		; load tile index
				beq :+						; if tile $00 (blank), skip

				lda temp_47					; check X HI
				bne :++						; break if X HI not zero

				lda tPositionYHi_43			; check Y HI
				bne :++						; break if Y HI not zero

				lda (addressPtr_32),Y 		; load tile index
				sta OAM_0200+OAM_TILE,X		; store tile index in OAM
				lda tPositionYLo_42			; load tile Y position from RAM
				sta OAM_0200+OAM_Y,X		; store tile Y position in OAM 
				iny							; next value
				lda (addressPtr_32),Y		; load tile attributes
				sta OAM_0200+OAM_ATT,X		; store tile attributes in OAM
				lda tile_X_Lo_46			; load tile X position from RAM
				sta OAM_0200+OAM_X,X		; store tile X position in OAM
				txa
				clc
				adc #OAM_STRIDE				; 4-byte stride in OAM
				beq FinishingSpriteUpdates	; break if overflow
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
				inc temp_47				; add carry to X_HI
				jmp loopLoadFrameTiles  ; loop
			
			:
				iny
				jmp :--
			
			: ; end-of-line
				dec counter_H_45		; decrement H counter
				beq :+					; break if end-of-file

				lda tPositionYLo_42		
				clc
				adc #$08
				sta tPositionYLo_42		; step 8 pixels in Y
				bcc loopLoadFrames		; if not overflow, loop to next frame
				
				inc tPositionYHi_43		; if overflow, add to Y HI
				jmp loopLoadFrames		; loop to next frame
			
			:
				stx oamAddressPtr_3E	; stores next OAM free address
		
		NextObjectIndex:

			lda objIndex_5F			; get current object index
			clc
			adc objIndexStep_59		; add step (+6 or -6)
			cmp #ENEMY_OBJECT_END	; check if 240 (40 objects)
			bcc ContinueUpdating	; if less than 240, skip ahead	
			beq ResetIndex			; if equal to 240, continue
		
			lda #ENEMY_OBJECT_END - OBJECT_BYTE_SIZE; $EA Replace last object				
			bne ContinueUpdating
			
			ResetIndex:
				lda #$00
			
			ContinueUpdating:

				sta objIndex_5F
				cmp beingUpdated_3D
				beq ClearRemainingOAM

				jmp loopOverObjects		

			WriteOAMEntry:				; Not really, but since $0200 will be
										; DMAed to OAM, then yes.
		
				ldx oamAddressPtr_3E
				
				lda tPositionXHi_41		; get high byte of sprite's X position
				bne NextObjectIndex		; if not zero, skip sprite.
										; this ensures that the sprite is on screen.

				lda tPositionYHi_43		; get high byte of sprite's Y position
				bne NextObjectIndex		; if not zero, skip sprite.
										; this ensures that the sprite is on screen.
				
				; writing 4 byte per sprite 		
				lda tPositionYLo_42		; Y position
				sta OAM_0200+OAM_Y,X		
				iny

				lda (addressPtr_32),Y	; tile chr
				sta OAM_0200+OAM_TILE,X
				iny
				
				lda (addressPtr_32),Y	; tile attribute
				sta OAM_0200+OAM_ATT,X

				lda tPositionXLo_40		; X position
				sta OAM_0200+OAM_X,X
				
				txa						; move to next sprite
				clc
				adc #OAM_STRIDE
				beq FinishingSpriteUpdates	; if overflow, finish

				sta oamAddressPtr_3E	; store next OAM free address
				jmp NextObjectIndex		; loop over next object
		
		ClearRemainingOAM:
			ldx oamAddressPtr_3E		; get next OAM free address
			cpx #ZERO					; if zero, finish
			beq FinishingSpriteUpdates
			
			lda #ZERO					
			:
				sta OAM_0200,X			; clear remaining OAM
				inx						; loop over the remaining OAM
				bne :-
		
		FinishingSpriteUpdates:
			lda objIndex_5F
			cmp beingUpdated_3D
			bne :+

		; reverse the indexing
			lda #ZERO				
			sta objIndex_5F		; reset object index
			sec
			sbc objIndexStep_59		; convert +6 into -6
			sta objIndexStep_59

		:

	rts

.endproc
;
; $A709
.proc Copy_5BytesPage05_FromEnd_ToBeginning
	lda animationTable_Lo_0501+ENEMY_OBJECT_START+page_5_Gap
	sta animationTable_Lo_0501+ENEMY_OBJECT_START
	lda animationTable_Hi_0502+ENEMY_OBJECT_START+page_5_Gap
	sta animationTable_Hi_0502+ENEMY_OBJECT_START
	lda animationTable_Index_0503+ENEMY_OBJECT_START+page_5_Gap
	sta animationTable_Index_0503+ENEMY_OBJECT_START
	lda animationDelay_0504+ENEMY_OBJECT_START+page_5_Gap
	sta animationDelay_0504+ENEMY_OBJECT_START
	lda animationLoopCounter_0505+ENEMY_OBJECT_START+page_5_Gap
	sta animationLoopCounter_0505+ENEMY_OBJECT_START
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
	cmp #CONFIG_PLAYER_MAX_POWER+1
	bcc :+
	lda #ZERO
	sta powerLevel_64
	
	:
	lda input1_20
	sta flagUnknown_1F
	rts
.endproc
;
; $A743
.proc HandleControllerInputs

	lda #ZERO
	jsr ReadControl_A

	lda flagPause_1C
	bne doGameIsPaused

	lda object_X_Hi_0401
	bne doGameIsPaused

	lda flagTimerInSeconds_14
	cmp #$02
	bcc handlePlayerActions
	lda #(OBJPROP_IS_NOT_BOSS+OBJPROP_CAN_COLLIDE)
	sta objAttributes_2_0405
	bne handlePlayerActions
	
	doGameIsPaused:
		jsr CheckForPause
		lda input1_20
		sta inputPrev_22
		rts

	handlePlayerActions:

	lda input1_20
	
	checkInputRight:
		bit BIT_BUTTON_RIGHT
		beq checkInputLeft

		lda object_X_Lo_0400
		cmp #CONFIG_PLAYER_X_MAX
		bcs checkInputDown
		adc speedLevel_66
		bcc :+
		
	checkInputLeft:
		bit BIT_BUTTON_LEFT
		beq checkInputDown
		lda object_X_Lo_0400
		cmp #CONFIG_PLAYER_X_MIN
		bcc checkInputDown
		sbc speedLevel_66

		:
		sta object_X_Lo_0400
	
	checkInputDown:
		lda input1_20
		bit BIT_BUTTON_DOWN
		beq checkInputUp
		lda object_Y_Lo_0402
		cmp #CONFIG_PLAYER_Y_MAX
		bcs checkInputA
		adc speedLevel_66
		bcc :+
	
	checkInputUp:
		bit BIT_BUTTON_UP
		beq checkInputA
		lda object_Y_Lo_0402
		cmp #CONFIG_PLAYER_Y_MIN
		bcc checkInputA
		sbc speedLevel_66

		:
		sta object_Y_Lo_0402
	
	checkInputA:
		lda input1_20
		bit BIT_BUTTON_A
		beq checkOnlyForPause

		lda inputPrev_22
		bit BIT_BUTTON_A
		bne checkOnlyForPause
		
		lda #FLAG_1
		jsr CheckPlayerCanShoot_A_rA
		sta flagPlayerHasShot_62
		
		lda objHealthPoints_0603
		cmp #CONFIG_PLAYER_FLASHING_HEALTH	; if the player is with over health
		bcc :+
		
		ADDRESS_TO_RAM Data_atA80A, animationTable_Lo_0501		
		lda #ZERO
		sta animationTable_Index_0503
		beq checkOnlyForPause
	
	:
		ADDRESS_TO_RAM Data_atA7F0, animationTable_Lo_0501
		lda #ZERO
		sta animationTable_Index_0503
		
	checkOnlyForPause:
		jsr CheckForPause
		lda input1_20
		sta inputPrev_22

	rts
.endproc
;
; $A7F0
Data_atA7F0:
.incbin "objects/data/misc/data-block-atA7F0.bin"
;
; $A80A
Data_atA80A:
.incbin "objects/data/misc/data-block-atA80A.bin"
;
; $A83C
; CheckPlayerCanShoot_A_rA
; Checks if the player is able to shoot.
; In case not, zeoes-out A
; else, leaves A untouched.
.proc CheckPlayerCanShoot_A_rA

	pha
	lda objAttributes_1_0404
	bit BIT_OBJPROP_SHOT
	beq :+
	
	pla
	rts

	:
		pla
		lda #ZERO
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
		Flip FLAG_0
		sta flagPause_1C
		beq :+
	
		SOUNDENGINE_STOP
		SOUNDENGINE_PLAY_ONCE #SFX_GAME_PAUSE

		jmp exitPauseRoutine
	
	:
		SOUNDENGINE_RESET 
		lda flagBossFight_1A
		beq :+

		SOUNDENGINE_PLAY_FOREVER #SONG_BOSSES
		rts

	:
		SOUNDENGINE_PLAY_FOREVER #SONG_STAGES
	
	exitPauseRoutine:
		rts
.endproc
;
; $A885
ObjectsData_A885:
.include "objects/objects.asm"


; $E847
;
BackgroundData_E847:
.include "stages/backgrounds.asm"


.segment "EXTRA_DATA"	; not used
.byte $00, $01, $02, $03

.segment "VECTORS"
	.word HandleVBlank
	.word HandleReset
	.word HandleReset ; for some reason, the irq vector also points to the reset

.segment "CHARS0"
.incbin "graphics/bank0.chr"

.segment "CHARS1"
.incbin "graphics/bank1.chr"

.segment "CHARS2"
.incbin "graphics/bank2.chr"

.segment "CHARS3"
.incbin "graphics/bank3.chr"