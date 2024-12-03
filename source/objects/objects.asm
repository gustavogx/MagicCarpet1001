
; Enemies on each stage
;       Waves			Enemies 		
.addr	Data_atAC98,	Data_atAEC6 ; stage 1
.addr	Data_atB8ED,	Data_atBB5D ; stage 2
.addr	Data_atC50D,	Data_atC8B9 ; stage 3
.addr	Data_atE3A6,	Data_atC8B9 ; stage 4

Data_atA895:

; Number digits from 0 to 9
.word NUMBER_ADDR_00, NUMBER_ADDR_01, NUMBER_ADDR_02, NUMBER_ADDR_03, NUMBER_ADDR_04
.word NUMBER_ADDR_05, NUMBER_ADDR_06, NUMBER_ADDR_07, NUMBER_ADDR_08, NUMBER_ADDR_09

; Game Over
.word DATA_ADDR_10                              ; "Game Over" text

; Player
.word DATA_ADDR_11, DATA_ADDR_12, DATA_ADDR_13  ; Player Flying (3 frames)
.word DATA_ADDR_14                              ; Player Shooting
.word DATA_ADDR_15, DATA_ADDR_16                ; Player Death (2 frames)

.word DATA_ADDR_17, DATA_ADDR_18, DATA_ADDR_19
.word DATA_ADDR_20, DATA_ADDR_21, DATA_ADDR_22, DATA_ADDR_23
.word DATA_ADDR_24, DATA_ADDR_25, DATA_ADDR_26, DATA_ADDR_27
.word DATA_ADDR_28, DATA_ADDR_29, DATA_ADDR_30, DATA_ADDR_31
.word DATA_ADDR_32, DATA_ADDR_33, DATA_ADDR_34, DATA_ADDR_35
.word DATA_ADDR_36, DATA_ADDR_37, DATA_ADDR_38, DATA_ADDR_39
.word DATA_ADDR_40, DATA_ADDR_41, DATA_ADDR_42, DATA_ADDR_43
.word DATA_ADDR_44, DATA_ADDR_45, DATA_ADDR_46, DATA_ADDR_47
.word DATA_ADDR_48, DATA_ADDR_49, DATA_ADDR_50, DATA_ADDR_51
.word DATA_ADDR_52, DATA_ADDR_53, DATA_ADDR_54, DATA_ADDR_55
.word DATA_ADDR_56, DATA_ADDR_57, DATA_ADDR_58, DATA_ADDR_59
.word DATA_ADDR_60, DATA_ADDR_61, DATA_ADDR_62, DATA_ADDR_63
.word DATA_ADDR_64, DATA_ADDR_65, DATA_ADDR_66, DATA_ADDR_67

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

DATA_ADDR_10: ; $a945 - offset $04
;   This "GAME OVER" object is never used, since the 
; current GAME OVER is loaded into OAM from the ROM.
.incbin "objects/animation/data-object-atA945.bin" ; "Game Over" text, NOT ASCII

DATA_ADDR_11: ; $a958 - offset $13
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

DATA_ADDR_12: ; $a975 - offset $1d
.incbin "objects/animation/data-object-atA975.bin" ; Player Flying Frame 2/3

DATA_ADDR_13: ; $a993 - offset $1e
.incbin "objects/animation/data-object-atA993.bin" ; Player Flying Frame 3/3

DATA_ADDR_14: ; $a9b0 - offset $1d
.incbin "objects/animation/data-object-atA9B0.bin" ; Player Shooting

DATA_ADDR_15: ; $a9ce - offset $1e
.incbin "objects/animation/data-object-atA9CE.bin" ; Player Death Frame 1/2

DATA_ADDR_16: ; $a9e1 - offset $13
.incbin "objects/animation/data-object-atA9E1.bin" ; Player Death Frame 2/2

DATA_ADDR_17: ; $a9f5 - offset $14
.byte $06, $05, $3f, $03 			;	Player shot horizontal

DATA_ADDR_18: ; $a9f9 - offset $04
.incbin "objects/animation/data-object-atA9F9.bin" ;	Enemy hit puff Frame 1/2

DATA_ADDR_19: ; $aa03 - offset $0a
.incbin "objects/animation/data-object-atAA03.bin" ; 	Enemy hit puff Frame 2/2

DATA_ADDR_20: ; $aa0d - offset $0a
.incbin "objects/animation/data-object-atAA0D.bin" ;  One Up icon

DATA_ADDR_21: ; $aa17 - offset $0a
.byte $07, $07, $4c, $01		;	P power up

DATA_ADDR_22: ; $aa1b - offset $04
.byte $04, $04, $4d, $01		;   Bubble enemy shot

DATA_ADDR_23: ; $aa1f - offset $04
.byte $07, $07, $4e, $00		;   Fireball 1

DATA_ADDR_24: ; $aa23 - offset $04
.byte $07, $07, $4f, $03		;   Fireball 2

DATA_ADDR_25: ; $aa27 - offset $04
.incbin "objects/animation/data-object-atAA27.bin" ;  Enemy flying rocket-bedouin Frame 1/2

DATA_ADDR_26: ; $aa39 - offset $12
.incbin "objects/animation/data-object-atAA39.bin" ;  Enemy flying rocket-bedouin Frame 1/2

DATA_ADDR_27: ; $aa47 - offset $0e
.incbin "objects/animation/data-object-atAA47.bin" ;  Enemy flying heads Frame 1/2

DATA_ADDR_28: ; $aa51 - offset $0a
.incbin "objects/animation/data-object-atAA51.bin" ;  Enemy flying heads Frame 2/2

DATA_ADDR_29: ; $aa5b - offset $0a
.incbin "objects/animation/data-object-atAA5B.bin" ;  Enemy bee Frame 1/2

DATA_ADDR_30: ; $aa64 - offset $09
.incbin "objects/animation/data-object-atAA64.bin" ;  Enemy bee Frame 2/2

DATA_ADDR_31: ; $aa6e - offset $0a
.incbin "objects/animation/data-object-atAA6E.bin" ;  Enemy duck Frame 1/2

DATA_ADDR_32: ; $aa79 - offset $0b
.incbin "objects/animation/data-object-atAA79.bin" ;  Enemy duck Frame 2/2

DATA_ADDR_33: ; $aa82 - offset $09
.incbin "objects/animation/data-object-atAA82.bin" ;  Enemy duck Frame 3/2

DATA_ADDR_34: ; $aa8c - offset $0a
.incbin "objects/animation/data-object-atAA8C.bin" ;  Skull Boss Idle

DATA_ADDR_35: ; $aaae - offset $22
.incbin "objects/animation/data-object-atAAAE.bin" ;  Skull Boss Flashing

DATA_ADDR_36: ; $aad0 - offset $22
.byte $07, $05, $7f, $03 		;	Player shot vertical up

DATA_ADDR_37: ; $aad4 - offset $04
.byte $07, $05, $80, $03		;	Player shot vertical down

DATA_ADDR_38: ; $aad8 - offset $04
.byte $07, $07, $81, $01		;	Heart power up

DATA_ADDR_39: ; $aadc - offset $04
.byte $07, $07, $82, $01		; 	Speed Power up

DATA_ADDR_40: ; $aae0 - offset $04
.incbin "objects/animation/data-object-atAAE0.bin" ; Witch boss Idle

DATA_ADDR_41: ; $ab08 - offset $28
.incbin "objects/animation/data-object-atAB08.bin" ; Witch boss Flashing

DATA_ADDR_42: ; $ab30 - offset $28
.incbin "objects/animation/data-object-atAB30.bin" ; Crock boss Idle

DATA_ADDR_43: ; $ab65 - offset $35
.incbin "objects/animation/data-object-atAB65.bin" ; Crock boss shooting (mouth open)

DATA_ADDR_44: ; $ab9a - offset $35
.incbin "objects/animation/data-object-atAB9A.bin" ; Straight comet shot

DATA_ADDR_45: ; $aba2 - offset $08
.incbin "objects/animation/data-object-atABA2.bin" ; Enemy Bat Frame 1/3

DATA_ADDR_46: ; $abb0 - offset $0e
.incbin "objects/animation/data-object-atABB0.bin" ; Enemy Bat Frame 2/3

DATA_ADDR_47: ; $abbc - offset $0c
.incbin "objects/animation/data-object-atABBC.bin" ; Enemy Bat Frame 3/3

DATA_ADDR_48: ; $abca - offset $0e
.byte $05, $07, $c1, $03 ; Single Falling Sparkle

DATA_ADDR_49: ; $abce - offset $04
.incbin "objects/animation/data-object-atABCE.bin" ; Enemy 4-pieces block Idle

DATA_ADDR_50: ; $abd8 - offset $0a
.incbin "objects/animation/data-object-atABD8.bin" ; Enemy 4-pieces block Flashing

DATA_ADDR_51: ; $abe2 - offset $0a
.incbin "objects/animation/data-object-atABE2.bin" ; Enemy ball Frame 1/2

DATA_ADDR_52: ; $abec - offset $0a
.incbin "objects/animation/data-object-atABEC.bin" ; Enemy ball Frame 2/2

DATA_ADDR_53: ; $abf6 - offset $0a
.incbin "objects/animation/data-object-atABF6.bin" ; Enemy Mine Frame 1/2

DATA_ADDR_54: ; $ac00 - offset $0a
.incbin "objects/animation/data-object-atAC00.bin" ; Enemy Mine Frame 2/2

DATA_ADDR_55: ; $ac0a - offset $0a
.incbin "objects/animation/data-object-atAC0A.bin" ; Mouth Boss Frame 1/3 (open animation)

DATA_ADDR_56: ; $ac1c - offset $12
.incbin "objects/animation/data-object-atAC1C.bin" ; Mouth Boss Frame 2/3 (open animation)

DATA_ADDR_57: ; $ac2e - offset $12
.incbin "objects/animation/data-object-atAC2E.bin" ; Mouth Boss Frame 3/3 (open animation)

DATA_ADDR_58: ; $ac48 - offset $1a
.incbin "objects/animation/data-object-atAC48.bin" ; Enemy 4-pieces block (breaking up) Frame 1/2

DATA_ADDR_59: ; $ac57 - offset $0f
.incbin "objects/animation/data-object-atAC57.bin" ; Enemy 4-pieces block (breaking up) Frame 2/2

DATA_ADDR_60: ; $ac66 - offset $0f
.byte $06, $06, $f6, $01 ; Enemy shot sparkle Frame 1/2

DATA_ADDR_61: ; $ac6a - offset $04
.byte $06, $06, $f7, $00 ; Enemy shot sparkle Frame 2/2

DATA_ADDR_62: ; $ac6e - offset $04
.incbin "objects/animation/data-object-atAC6E.bin" ; Upwards comet shot

DATA_ADDR_63: ; $ac76 - offset $08
.incbin "objects/animation/data-object-atAC76.bin" ; Downwards comet shot

DATA_ADDR_64: ; $ac7e - offset $08
.incbin "objects/animation/data-object-atAC7E.bin" ; Enemy Top half ball

DATA_ADDR_65: ; $ac84 - offset $06
.incbin "objects/animation/data-object-atAC84.bin" ; Enemy Bottom half ball

DATA_ADDR_66: ; $ac8a - offset $06
.incbin "objects/animation/data-object-atAC8A.bin" ; Enemy Falling Meteor

DATA_ADDR_67: ; $ac94 - offset $0a
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
.include "objects/data/objects_S3_data.inc"
; ======================================


; ======================================
; Stage 04 Enemies
Data_atE3A6:
.include "objects/data/objects_S4_waves.inc"
; ======================================

Data_atE801:
;.res 70
.incbin "objects/data/stage4/data-block-atE801.bin"
