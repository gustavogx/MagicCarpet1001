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
.define SHOOT_NOTHING			$00
.define SHOOT_SINGLE_BUBBLE		$01
.define SHOOT_RING_BUBBLES		$03
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
