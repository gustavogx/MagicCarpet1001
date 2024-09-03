; Game Configuration =================
.define STARTING_LIVES			 $06
.define STARTING_POWER			 $00
.define PLAYER_SPEED_SLOW		 $02
.define PLAYER_SPEED_FAST		 $03
.define HEART_HEALTH_POINTS 	 $04
.define PLAYER_MAX_POWER		 $04
.define MAGIC_LAMP_HEALTH_POINTS $50
; ====================================

; Engine Configuration ===============
.define ENEMY_WAVES_TO_FIRST	$0A
.define ENEMY_WAVES_TRIGGER		$FA
.define ENEMY_WAVES_TO_NEXT		$F0
.define ENEMY_WAVES_STEP		$01

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
.define PLAYER_START_X_Lo	$F2
.define PLAYER_START_X_Hi	$FF
.define PLAYER_START_Y_Lo	$70
	
; Other objects go after HEART
.define FIRST_OBJECT_SLOT $04

; Player's shots slots
.define SHOT_OBJECT_START	$0C	;	12
.define OBJECT_BYTE_SIZE	$06 ;	 6
.define FREE_SHOT_SLOTS		$06	;	 6
.define ENEMY_OBJECT_START	FREE_SHOT_SLOTS*OBJECT_BYTE_SIZE+SHOT_OBJECT_START

; Enemy slots
.define FREE_OBJECT_SLOTS	$20 ;	20

.define VRAM_PALETTES_PAGE $3F

.define BG_SCROLL_RATE	$02
	; $01 every frame 		(60fps)
	; $02 every other frame	(30fps) (original)
	; $03 every two frames 	(15fps)

.if BG_SCROLL_RATE = $02
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