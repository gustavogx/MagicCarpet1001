
; Enemies on each stage
;       Waves			Enemies
.addr	Data_atAC98,	Data_atAEC6 ; stage 1
.addr	Data_atB8ED,	Data_atBB5D ; stage 2
.addr	Data_atC50D,	Data_atC8B9 ; stage 3
.addr	Data_atE3A6,	Data_atC8B9 ; stage 4 (same enemies as Stage 3)

AnimationAtlas_A895:
; Because of the way the animation system works,
; the whole game is limited to 128 frames of animation, 
; from $00 up to $7F.
; Indices from $80 and up are reserved for control codes.

; Number digits from 0 to 9
.word NUMBER_ADDR_00, NUMBER_ADDR_01, NUMBER_ADDR_02, NUMBER_ADDR_03, NUMBER_ADDR_04
.word NUMBER_ADDR_05, NUMBER_ADDR_06, NUMBER_ADDR_07, NUMBER_ADDR_08, NUMBER_ADDR_09

; Game Over
.word DATA_ADDR_0A                              ; "Game Over" text

; Player
.word ANFR_1_PLAYER_FLYING_0B, ANFR_2_PLAYER_FLYING_0C, ANFR_3_PLAYER_FLYING_0D  ; Player Flying (3 frames)
.word DATA_ADDR_0E                              ; Player Shooting
.word DATA_ADDR_0F, DATA_ADDR_10                ; Player Death (2 frames)
.word DATA_ADDR_11                              ; Player projectiles horizontal

.word DATA_ADDR_12, DATA_ADDR_13                ; Enemy hit puff
.word DATA_ADDR_14                              ; 1up icon
.word DATA_ADDR_15                              ; P power up
.word ANFR_BUBBLE_16                            ; Bubble enemy projectile

.word ANFR_1_AMBER_17                           ; Amber 1
.word ANFR_2_AMBER_18                           ; Amber 2

.word DATA_ADDR_19, DATA_ADDR_1A                ; Enemy rocket-bedouins
.word DATA_ADDR_1B, DATA_ADDR_1C                ; Enemy jinn
.word DATA_ADDR_1D, DATA_ADDR_1E                ; Enemy bees
.word DATA_ADDR_1F, DATA_ADDR_20, DATA_ADDR_21  ; Enemy ducks
.word ANFR_SKULL_IDLE_22, ANFR_SKULL_FLASHING_23; Skull Boss (Idle and flashing)
.word DATA_ADDR_24, DATA_ADDR_25                ; Player diagonal projectiles (up and down)
.word DATA_ADDR_26                              ; Heart power up
.word DATA_ADDR_27                              ; Speed Power up
.word ANFR_WITCH_IDLE_28, ANFR_WITCH_FLASHING_29	; Witch Boss (Idle and flashing)
.word ANFR_CROCK_IDLE_2A, ANFR_CROCK_SHOOTING_2B	; Crock Boss (Idle and shooting)
.word ANFR_COMET_HORIZONTAL_2C                  ; Straight comet projectile
.word ANFR_BAT_1_2D, ANFR_BAT_1_2E, ANFR_BAT_1_2F  ; Enemy Bats
.word DATA_ADDR_30                              ; Single Falling Sparkle
.word ANFR_BLOCK_IDLE_31, ANFR_BLOCK_FLASHING_32, DATA_ADDR_33
.word DATA_ADDR_34, DATA_ADDR_35, DATA_ADDR_36
.word ANFR_MOUTH_OPENING_1_37
.word ANFR_MOUTH_OPENING_2_38, ANFR_MOUTH_OPENING_3_39, ANFR_BLOCK_BREAKING_1_3A, ANFR_BLOCK_BREAKING_2_3B

;.define afSPARKLE ANIM_SPARKLE_1_3C
.word ANIM_SPARKLE_1_3C, ANIM_SPARKLE_2_3D

.word ANFR_COMET_30UP_3E, ANFR_COMET_30DOWN_3F
.word DATA_ADDR_40, DATA_ADDR_41, ANFR_METEOR_42, ANFR_BLANK_43

; ==========================================

NUMBER_ADDR_00: ; $a91d
.byte $07, $07, $01, $01

NUMBER_ADDR_01: ; $a921 - offset $04
.byte $07, $07, $02, $01

NUMBER_ADDR_02: ; $a925 - offset $04
.byte $07, $07, $03, $01

NUMBER_ADDR_03: ; $a929 - offset $04
.byte $07, $07, $04, $01

NUMBER_ADDR_04: ; $a92d - offset $04
.byte $07, $07, $05, $01

NUMBER_ADDR_05: ; $a931 - offset $04
.byte $07, $07, $06, $01

NUMBER_ADDR_06: ; $a935 - offset $04
.byte $07, $07, $07, $01

NUMBER_ADDR_07: ; $a939 - offset $04
.byte $07, $07, $08, $01

NUMBER_ADDR_08: ; $a93d - offset $04
.byte $07, $07, $09, $01

NUMBER_ADDR_09: ; $a941 - offset $04
.byte $07, $07, $0a, $01

; ==========================================

DATA_ADDR_0A: ; $a945 - offset $04
;   This "GAME OVER" object is never used, since the
; current GAME OVER is loaded into OAM from the ROM.
.incbin "objects/animation/data-object-atA945.bin" ; "Game Over" text, NOT ASCII

ANFR_1_PLAYER_FLYING_0B:
.incbin "objects/animation/data-object-atA958.bin" ; Player Flying Frame 1/3

;.byte $1F, $1D ; W and H in pixels

;.byte $00		; blank
;.byte $12, $02	; tile, attribute (palette)
;.byte $13, $02
;.byte $00

;.byte $00
;.byte $14, $00
;.byte $15, $02
;.byte $00

;.byte $00
;.byte $16, $02
;.byte $17, $02
;.byte $18, $00

;.byte $19, $00
;.byte $1A, $00
;.byte $1B, $00
;.byte $1C, $00

ANFR_2_PLAYER_FLYING_0C:
.incbin "objects/animation/data-object-atA975.bin" ; Player Flying Frame 2/3

ANFR_3_PLAYER_FLYING_0D:
.incbin "objects/animation/data-object-atA993.bin" ; Player Flying Frame 3/3

DATA_ADDR_0E: ; $a9b0 - offset $1d
.incbin "objects/animation/data-object-atA9B0.bin" ; Player Shooting

DATA_ADDR_0F: ; $a9ce - offset $1e
.incbin "objects/animation/data-object-atA9CE.bin" ; Player Death Frame 1/2

DATA_ADDR_10: ; $a9e1 - offset $13
.incbin "objects/animation/data-object-atA9E1.bin" ; Player Death Frame 2/2

DATA_ADDR_11: ; $a9f5 - offset $14
.byte $06, $05, $3f, $03 			;	Player shot horizontal

DATA_ADDR_12: ; $a9f9 - offset $04
.incbin "objects/animation/data-object-atA9F9.bin" ;	Enemy hit puff Frame 1/2

DATA_ADDR_13: ; $aa03 - offset $0a
.incbin "objects/animation/data-object-atAA03.bin" ; 	Enemy hit puff Frame 2/2

DATA_ADDR_14: ; $aa0d - offset $0a
.incbin "objects/animation/data-object-atAA0D.bin" ;  One Up icon

DATA_ADDR_15: ; $aa17 - offset $0a
.byte $07, $07, $4c, $01		;	P power up

ANFR_BUBBLE_16: ; $aa1b - offset $04
.byte $04, $04, $4d, $01		;   Bubble enemy projectile

ANFR_1_AMBER_17: ; $aa1f - offset $04
.byte $07, $07, $4e, $00		;   Fireball 1

ANFR_2_AMBER_18: ; $aa23 - offset $04
.byte $07, $07, $4f, $03		;   Fireball 2

DATA_ADDR_19: ; $aa27 - offset $04
.incbin "objects/animation/data-object-atAA27.bin" ;  Enemy rocket-bedouin Frame 1/2

DATA_ADDR_1A: ; $aa39 - offset $12
.incbin "objects/animation/data-object-atAA39.bin" ;  Enemy rocket-bedouin Frame 1/2

DATA_ADDR_1B: ; $aa47 - offset $0e
.incbin "objects/animation/data-object-atAA47.bin" ;  Enemy heads Frame 1/2

DATA_ADDR_1C: ; $aa51 - offset $0a
.incbin "objects/animation/data-object-atAA51.bin" ;  Enemy heads Frame 2/2

DATA_ADDR_1D: ; $aa5b - offset $0a
.incbin "objects/animation/data-object-atAA5B.bin" ;  Enemy bee Frame 1/2

DATA_ADDR_1E: ; $aa64 - offset $09
.incbin "objects/animation/data-object-atAA64.bin" ;  Enemy bee Frame 2/2

DATA_ADDR_1F: ; $aa6e - offset $0a
.incbin "objects/animation/data-object-atAA6E.bin" ;  Enemy duck Frame 1/2

DATA_ADDR_20: ; $aa79 - offset $0b
.incbin "objects/animation/data-object-atAA79.bin" ;  Enemy duck Frame 2/2

DATA_ADDR_21: ; $aa82 - offset $09
.incbin "objects/animation/data-object-atAA82.bin" ;  Enemy duck Frame 3/2

ANFR_SKULL_IDLE_22: ; $aa8c - offset $0a
.incbin "objects/animation/data-object-atAA8C.bin" ;  Skull Boss Idle

ANFR_SKULL_FLASHING_23: ; $aaae - offset $22
.incbin "objects/animation/data-object-atAAAE.bin" ;  Skull Boss Flashing

DATA_ADDR_24: ; $aad0 - offset $22
.byte $07, $05, $7f, $03 		;	Player shot vertical up

DATA_ADDR_25: ; $aad4 - offset $04
.byte $07, $05, $80, $03		;	Player shot vertical down

DATA_ADDR_26: ; $aad8 - offset $04
.byte $07, $07, $81, $01		;	Heart power up

DATA_ADDR_27: ; $aadc - offset $04
.byte $07, $07, $82, $01		; 	Speed Power up

ANFR_WITCH_IDLE_28: ; $aae0 - offset $04
.incbin "objects/animation/data-object-atAAE0.bin" ; Witch boss Idle

ANFR_WITCH_FLASHING_29: ; $ab08 - offset $28
.incbin "objects/animation/data-object-atAB08.bin" ; Witch boss Flashing

ANFR_CROCK_IDLE_2A: ; $ab30 - offset $28
.incbin "objects/animation/data-object-atAB30.bin" ; Crock boss Idle

ANFR_CROCK_SHOOTING_2B: ; $ab65 - offset $35
.incbin "objects/animation/data-object-atAB65.bin" ; Crock boss shooting (mouth open)

ANFR_COMET_HORIZONTAL_2C: ; $ab9a - offset $35
.incbin "objects/animation/data-object-atAB9A.bin" ; Straight comet shot

ANFR_BAT_1_2D: ; $aba2 - offset $08
.incbin "objects/animation/data-object-atABA2.bin" ; Enemy Bat Frame 1/3

ANFR_BAT_1_2E: ; $abb0 - offset $0e
.incbin "objects/animation/data-object-atABB0.bin" ; Enemy Bat Frame 2/3

ANFR_BAT_1_2F: ; $abbc - offset $0c
.incbin "objects/animation/data-object-atABBC.bin" ; Enemy Bat Frame 3/3

DATA_ADDR_30: ; $abca - offset $0e
.byte $05, $07, $c1, $03 ; Single Falling Sparkle

ANFR_BLOCK_IDLE_31: ; $abce - offset $04
.incbin "objects/animation/data-object-atABCE.bin" ; Enemy 4-pieces block Idle

ANFR_BLOCK_FLASHING_32: ; $abd8 - offset $0a
.incbin "objects/animation/data-object-atABD8.bin" ; Enemy 4-pieces block Flashing

DATA_ADDR_33: ; $abe2 - offset $0a
.incbin "objects/animation/data-object-atABE2.bin" ; Enemy ball Frame 1/2

DATA_ADDR_34: ; $abec - offset $0a
.incbin "objects/animation/data-object-atABEC.bin" ; Enemy ball Frame 2/2

DATA_ADDR_35: ; $abf6 - offset $0a
.incbin "objects/animation/data-object-atABF6.bin" ; Enemy Mine Frame 1/2

DATA_ADDR_36: ; $ac00 - offset $0a
.incbin "objects/animation/data-object-atAC00.bin" ; Enemy Mine Frame 2/2

ANFR_MOUTH_OPENING_1_37: ; $ac0a - offset $0a
.incbin "objects/animation/data-object-atAC0A.bin" ; Mouth Boss Frame 1/3 (open animation)

ANFR_MOUTH_OPENING_2_38: ; $ac1c - offset $12
.incbin "objects/animation/data-object-atAC1C.bin" ; Mouth Boss Frame 2/3 (open animation)

ANFR_MOUTH_OPENING_3_39: ; $ac2e - offset $12
.incbin "objects/animation/data-object-atAC2E.bin" ; Mouth Boss Frame 3/3 (open animation)

ANFR_BLOCK_BREAKING_1_3A: ; $ac48 - offset $1a
.incbin "objects/animation/data-object-atAC48.bin" ; Enemy 4-pieces block (breaking up) Frame 1/2

ANFR_BLOCK_BREAKING_2_3B: ; $ac57 - offset $0f
.incbin "objects/animation/data-object-atAC57.bin" ; Enemy 4-pieces block (breaking up) Frame 2/2

ANIM_SPARKLE_1_3C: ; $ac66 - offset $0f
.byte $06, $06, $f6, $01 ; Enemy shot sparkle Frame 1/2

ANIM_SPARKLE_2_3D: ; $ac6a - offset $04
.byte $06, $06, $f7, $00 ; Enemy shot sparkle Frame 2/2

ANFR_COMET_30UP_3E: ; $ac6e - offset $04
.incbin "objects/animation/data-object-atAC6E.bin" ; Upwards comet shot

ANFR_COMET_30DOWN_3F: ; $ac76 - offset $08
.incbin "objects/animation/data-object-atAC76.bin" ; Downwards comet shot

DATA_ADDR_40: ; $ac7e - offset $08
.incbin "objects/animation/data-object-atAC7E.bin" ; Enemy Top half ball

DATA_ADDR_41: ; $ac84 - offset $06
.incbin "objects/animation/data-object-atAC84.bin" ; Enemy Bottom half ball

ANFR_METEOR_42: ; $ac8a - offset $06
.incbin "objects/animation/data-object-atAC8A.bin" ; Enemy Falling Meteor

ANFR_BLANK_43: ; $ac94 - offset $0a
.byte $01, $01, $00, $00 ; Blank


; ======================================
; Stage 01 Enemies

; Waves
Data_atAC98:
.include "objects/data/objects_S1_waves.inc"

; Singles
Data_atAEC6:
.include "objects/data/objects_S1_data.inc"
; ======================================



; ======================================
; Stage 02 Enemies
Data_atB8ED:
.include "objects/data/objects_S2_waves.inc"

Data_atBB5D:
.include "objects/data/objects_S2_data.inc"
; ======================================


; ======================================
; Stage 03 Enemies
Data_atC50D:
.include "objects/data/objects_S3_waves.inc"

Data_atC8B9:
.include "objects/data/objects_S3_S4_data.inc"
; ======================================


; ======================================
; Stage 04 Enemies
Data_atE3A6:
.include "objects/data/objects_S4_waves.inc"
; ======================================

Data_atE801:
;.res 70
.incbin "objects/data/stage4/data-block-atE801.bin"
