; Game Configuration =================
.define STARTING_LIVES			 $06
.define STARTING_POWER			 $00
.define CONFIG_STARTING_HEALTH			 $01
.define CONFIG_PLAYER_SPEED_SLOW		 $02
.define CONFIG_PLAYER_SPEED_FAST		 $03
.define HEART_HEALTH_POINTS 	 $04
.define CONFIG_PLAYER_MAX_POWER		 $04
.define MAGIC_LAMP_HEALTH_POINTS $50
.define CONFIG_PLAYER_FLASHING_HEALTH	 $14
; ====================================

; Engine Configuration ===============
.define ASCII_TO_CHR_OFFSET		$36
.define TYPEWRITER_FRAME_INTERVAL $07
.define FRAMES_TO_SECOND		63	; 1s = f mod 62

.define ENEMY_WAVES_TO_FIRST	$0A
.define ENEMY_WAVES_TRIGGER		$FA
.define ENEMY_WAVES_TO_NEXT		$F0
.define ENEMY_WAVES_STEP		$01

.define GAMEMODE_STAGE			$00
.define GAMEMODE_STARTSCREEN	$01
.define GAMEMODE_BOSSFIGHT		$02

.define wvControl0 				$F0
.define wvSET1ENEMIES  			$F1
.define wvSET2ENEMIES  			$F2
.define wvControl3  			$F3
.define wvEND  					$FF

; Animation
.define acTIMER 				%10000000 ; $80
.define acLOOPN					%11000000 ; $C0
.define acLOOPBACK   			$FE
.define acEND					$FF

.define afPUFF					$12	; Puff 2 frames: $12, $13
.define afBUBBLE    			$16	; Bubble enemy projectile 1 frame
.define afAMBER    				$17	; Amber enemy projectile 2 frames: $17, $18
.define afBEDOUIN 				$19	; Bedouin 2 frames: $19, $1A
.define afJINN					$1B ; Jinn 2 frames: $1B, $1C
.define afBEE					$1D ; Bee 2 frames: $1D, $1E
.define afDUCK					$1F ; Duck 3 frames: $1F, $20, $21
.define afBAT					$2D ; Bat 3 frames: $2D, $2E, $2F
.define afBALL					$33 ; Ball 2 frames: $33, $34
.define afMINE					$35 ; Mine 2 frames: $35, $36
.define afBLOCK					$31 ; Block 2 frames: $31, $32
.define afBLOCKBREAK			$3A ; Block breaking 2 frames: $3A, $3B
.define afSPARKLE   			$3C ; Sparkle enemy projectile 2 frames: $3C, $3D
.define afTOPBALL				$40 ; Top half of ball 1 frame
.define afBOTTOMBALL			$41 ; Bottom half of ball 1 frame
.define afMETEOR 				$42 ; Meteor 1 frame
.define afBLANK 				$43 ; Blank 1 frame

.define afWITCH 				$28 ; Stage 1 Boss
.define afWITCHFLASHING 		$29

.define afCROC 					$2A ; Stage 2 Boss
.define afCROCSHOOTING 			$2B

.define afSKULL					$22 ; Stage 3 Boss
.define afSKULLFLASHING 		$23

.define afMOUTH 				$37 ; Stage 4 Boss
.define afMOUTHOPENING1 $37
.define afMOUTHOPENING2 $38
.define afMOUTHOPENING3 $39

; objAttributes_2_0405   7654 3210
; 						 |||| |||+-- 0: Enemy is part of SET 1
;						 |||| ||+--- 1: Enemy is part of SET 2
;						 |||| |+---- 2:
;						 |||| +----- 3:
;						 |||+------- 4: Obj is enemy or pickup (not boss)
;						 ||+-------- 5:
;						 |+--------- 6: Obj can collide
;						 +---------- 7: Obj is fixed (doesn't move)
.define OBJPROP_PARTOF_SET1 FLAG_0
.define OBJPROP_PARTOF_SET2 FLAG_1
.define OBJPROP_UNUSED1		FLAG_2
.define OBJPROP_UNKNOWN 	FLAG_3
.define OBJPROP_IS_NOT_BOSS	FLAG_4
.define OBJPROP_UNKNOWN2	FLAG_5
.define OBJPROP_CAN_COLLIDE	FLAG_6
.define OBJPROP_IS_FIXED	FLAG_7		; ??? TEST MORE

.define BIT_OBJPROP_PARTOF_SET1 BIT_0
.define BIT_OBJPROP_PARTOF_SET2 BIT_1
.define BIT_OBJPROP_UNUSED 		BIT_3
.define BIT_OBJPROP_IS_NOT_BOSS	BIT_4
.define BIT_OBJPROP_CAN_COLLIDE	BIT_6
.define BIT_OBJPROP_IS_FIXED	BIT_7	; ??? TEST MORE

; Heart is object zero (never shuffled)
.define HEART_HUD_Y		$D8
.define HEART_OFFSCREEN $F8
.define HEART_HUD_TILE	$81
.define HEART_HUD_ATT	$01
.define HEART_HUD_X		$38

; Lives counter starts as object one (then is shuffled)
.define LIVES_HUD_X		$C0
.define LIVES_HUD_Y		$D8

; Player starting position and stats
.define CONFIG_PLAYER_START_X_Lo	$F2
.define CONFIG_PLAYER_START_X_Hi	$FF
.define CONFIG_PLAYER_START_Y_Lo	$70

; Player hitbox
.define CONFIG_PLAYER_HITBOX_BORDER_XMIN	$08
.define CONFIG_PLAYER_HITBOX_BORDER_XMAX	$08
.define CONFIG_PLAYER_HITBOX_BORDER_YMIN	$03
.define CONFIG_PLAYER_HITBOX_BORDER_YMAX	$04

; Player screen limits
.define CONFIG_PLAYER_X_MIN	18
.define CONFIG_PLAYER_X_MAX	220
.define CONFIG_PLAYER_Y_MIN	20
.define CONFIG_PLAYER_Y_MAX	184

; Other objects go after HEART
.define FIRST_OBJECT_SLOT $04

; Player's shots slots
.define SHOT_OBJECT_START	$0C	;	12
.define OBJECT_BYTE_SIZE	$06 ;	 6
.define FREE_SHOT_SLOTS		$06	;	 6
.define ENEMY_OBJECT_START	FREE_SHOT_SLOTS*OBJECT_BYTE_SIZE+SHOT_OBJECT_START

; Enemy slots
.define FREE_OBJECT_SLOTS	$20 ;	20
.define ENEMY_OBJECT_END	$F0

.define VRAM_PALETTES_PAGE $3F

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
; ====================================

.define Stage1Bank   $01
.define Stage2Bank   $01
.define Stage3Bank   $01
.define Stage4Bank   $02

.define LAST_STAGE_INDEX $04

; song names ==========================
.define SONG_TITLESCREEN $00; 00 Opening song
.define SONG_STAGES 	$01; 01 Stage song
.define SONG_BOSSES 	$02; 02 Boss song
.define SFX_ARROW_SHOT 	$03; 03 Arrow shot SFX
.define SFX_ENEMY_DEATH $04; 04 Enemy death SFX
.define SFX_PLAYER_DEATH $05; 05 Player death SFX
.define SFX_EXTRA_LIFE 	$06; 06 Extra life SFX
.define SFX_GAME_START 	$07; 07 Game Start / Item grab SFX
.define SFX_GAME_PAUSE 	$08; 08 Pause
.define SFX_BOSS_DEATH 	$09; 09 Boss death SFX
.define SFX_TYPE_WRITER	$0A; 0A Type writer key stroke SFX
.define SONG_ENDING 	$0B; 0B Ending song
.define SFX_MAGIC_LAMP 	$0C; 0C Magic Lamp SFX

; shots type ==========================
;
;	Shot types:
;	00 nothing
;	01 single directional bubble
;	02 nothing
;	03 ring of bubble
;	04 nothing
;	05 wall of 4 bubbles + 1 wavy spark
; 	06 three comets
;	07 wall with three comets and 2 ambers
;	08 3 commets wall with 5 ambers, 1 wavy
;
.define SHOOT_NOTHING			$00
.define SHOOT_SINGLE_BUBBLE		$01
.define SHOOT_EIGHT_BUBBLES		$03
.define SHOOT_5_BUBBLES			$05
.define SHOOT_3_COMETS			$06
.define SHOOT_3_COMETS_2_AMBERS	$07
.define SHOOT_3_COMETS_5_AMBERS	$08

; buttons =============================
.define BUTTON_RIGHT	FLAG_0
.define BUTTON_LEFT		FLAG_1
.define BUTTON_DOWN		FLAG_2
.define BUTTON_UP		FLAG_3
.define BUTTON_START	FLAG_4
.define BUTTON_SELECT	FLAG_5
.define BUTTON_B		FLAG_6
.define BUTTON_A		FLAG_7

; APU Frame Counter ===================
.define APU_FRAMECOUNTER_MODE_4STEPS	ZERO
.define APU_FRAMECOUNTER_MODE_5STEPS	FLAG_7
.define APU_FRAMECOUNTER_IRQ_DISABLE	FLAG_6
.define APU_FRAMECOUNTER_IRQ_ENABLE		ZERO
