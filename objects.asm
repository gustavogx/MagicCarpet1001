
.word Data_atAC98, Data_atAEC6 ; stage 1
.word Data_atB8ED, Data_atBB5D ; stage 2
.word Data_atC50D, Data_atC8B9 ; stage 3
.word Data_atE3A6, Data_atC8B9 ; stage 4

Data_atA895:

; Number digits from 0 to 9
.word NUMBER_ADDR_00, NUMBER_ADDR_01, NUMBER_ADDR_02, NUMBER_ADDR_03, NUMBER_ADDR_04
.word NUMBER_ADDR_05, NUMBER_ADDR_06, NUMBER_ADDR_07, NUMBER_ADDR_08, NUMBER_ADDR_09

; Game Over
.word DATA_ADDR_10                              ; "Game Over" text

; Player
.word DATA_ADDR_11, DATA_ADDR_12, DATA_ADDR_13  ; Player Flying (3 frames)
.word DATA_ADDR_14                              ; Player Shooting
.word DATA_ADDR_15, DATA_ADDR_16                ;  Player Death (2 frames)

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
.incbin "rom-prg/objects/data-object-atA945.bin" ; "Game Over" text

DATA_ADDR_11: ; $a958 - offset $13
.incbin "rom-prg/objects/data-object-atA958.bin" ; Player Flying Frame 1/3

DATA_ADDR_12: ; $a975 - offset $1d
.incbin "rom-prg/objects/data-object-atA975.bin" ; Player Flying Frame 2/3

DATA_ADDR_13: ; $a993 - offset $1e
.incbin "rom-prg/objects/data-object-atA993.bin" ; Player Flying Frame 3/3

DATA_ADDR_14: ; $a9b0 - offset $1d
.incbin "rom-prg/objects/data-object-atA9b0.bin" ; Player Shooting

DATA_ADDR_15: ; $a9ce - offset $1e
.incbin "rom-prg/objects/data-object-atA9CE.bin" ; Player Death Frame 1/2

DATA_ADDR_16: ; $a9e1 - offset $13
.incbin "rom-prg/objects/data-object-atA9E1.bin" ; Player Death Frame 2/2

DATA_ADDR_17: ; $a9f5 - offset $14
.byte $06, $05, $3f, $03 			;	Player shot horizontal

DATA_ADDR_18: ; $a9f9 - offset $04
.incbin "rom-prg/objects/data-object-atA9F9.bin" ;	Enemy hit puff Frame 1/2

DATA_ADDR_19: ; $aa03 - offset $0a
.incbin "rom-prg/objects/data-object-atAA03.bin" ; 	Enemy hit puff Frame 2/2

DATA_ADDR_20: ; $aa0d - offset $0a
.incbin "rom-prg/objects/data-object-atAA0D.bin" ;  One Up icon

DATA_ADDR_21: ; $aa17 - offset $0a
.byte $07, $07, $4c, $01		;	P power up

DATA_ADDR_22: ; $aa1b - offset $04
.byte $04, $04, $4d, $01		;   Bubble enemy shot

DATA_ADDR_23: ; $aa1f - offset $04
.byte $07, $07, $4e, $00		;   Small puff of smoke 1

DATA_ADDR_24: ; $aa23 - offset $04
.byte $07, $07, $4f, $03		;   Small puff of smoke 2

DATA_ADDR_25: ; $aa27 - offset $04
.incbin "rom-prg/objects/data-object-atAA27.bin" ;  Enemy flying rock ninja Frame 1/2

DATA_ADDR_26: ; $aa39 - offset $12
.incbin "rom-prg/objects/data-object-atAA39.bin" ;  Enemy flying rock ninja Frame 1/2

DATA_ADDR_27: ; $aa47 - offset $0e
.incbin "rom-prg/objects/data-object-atAA47.bin" ;  Enemy flying mask Frame 1/2

DATA_ADDR_28: ; $aa51 - offset $0a
.incbin "rom-prg/objects/data-object-atAA51.bin" ;  Enemy flying mask Frame 2/2

DATA_ADDR_29: ; $aa5b - offset $0a
.incbin "rom-prg/objects/data-object-atAA5B.bin" ;  Enemy bee Frame 1/2

DATA_ADDR_30: ; $aa64 - offset $09
.incbin "rom-prg/objects/data-object-atAA64.bin" ;  Enemy bee Frame 2/2

DATA_ADDR_31: ; $aa6e - offset $0a
.incbin "rom-prg/objects/data-object-atAA6E.bin" ;  Enemy duck Frame 1/2

DATA_ADDR_32: ; $aa79 - offset $0b
.incbin "rom-prg/objects/data-object-atAA79.bin" ;  Enemy duck Frame 2/2

DATA_ADDR_33: ; $aa82 - offset $09
.incbin "rom-prg/objects/data-object-atAA82.bin" ;  Enemy duck Frame 3/2

DATA_ADDR_34: ; $aa8c - offset $0a
.incbin "rom-prg/objects/data-object-atAA8C.bin" ;  Skull Boss Idle

DATA_ADDR_35: ; $aaae - offset $22
.incbin "rom-prg/objects/data-object-atAAAE.bin" ;  Skull Boss Flashing

DATA_ADDR_36: ; $aad0 - offset $22
.byte $07, $05, $7f, $03 		;	Player shot vertical up

DATA_ADDR_37: ; $aad4 - offset $04
.byte $07, $05, $80, $03		;	Player shot vertical down

DATA_ADDR_38: ; $aad8 - offset $04
.byte $07, $07, $81, $01		;	Heart power up

DATA_ADDR_39: ; $aadc - offset $04
.byte $07, $07, $82, $01		; 	Speed Power up

DATA_ADDR_40: ; $aae0 - offset $04
.incbin "rom-prg/objects/data-object-atAAE0.bin" ; Witch boss Idle

DATA_ADDR_41: ; $ab08 - offset $28
.incbin "rom-prg/objects/data-object-atAB08.bin" ; Witch boss Flashing

DATA_ADDR_42: ; $ab30 - offset $28
.incbin "rom-prg/objects/data-object-atAB30.bin" ; Crock boss Idle

DATA_ADDR_43: ; $ab65 - offset $35
.incbin "rom-prg/objects/data-object-atAB65.bin" ; Crock boss shooting (mouth open)

DATA_ADDR_44: ; $ab9a - offset $35
.incbin "rom-prg/objects/data-object-atAB9A.bin" ; Straight comet shot

DATA_ADDR_45: ; $aba2 - offset $08
.incbin "rom-prg/objects/data-object-atABA2.bin" ; Enemy Bat Frame 1/3

DATA_ADDR_46: ; $abb0 - offset $0e
.incbin "rom-prg/objects/data-object-atABB0.bin" ; Enemy Bat Frame 2/3

DATA_ADDR_47: ; $abbc - offset $0c
.incbin "rom-prg/objects/data-object-atABBC.bin" ; Enemy Bat Frame 3/3

DATA_ADDR_48: ; $abca - offset $0e
.byte $05, $07, $c1, $03 ; Single Falling Sparkle

DATA_ADDR_49: ; $abce - offset $04
.incbin "rom-prg/objects/data-object-atABCE.bin" ; Enemy 4-pieces block Idle

DATA_ADDR_50: ; $abd8 - offset $0a
.incbin "rom-prg/objects/data-object-atABD8.bin" ; Enemy 4-pieces block Flashing

DATA_ADDR_51: ; $abe2 - offset $0a
.incbin "rom-prg/objects/data-object-atABE2.bin" ; Enemy ball Frame 1/2

DATA_ADDR_52: ; $abec - offset $0a
.incbin "rom-prg/objects/data-object-atABEC.bin" ; Enemy ball Frame 2/2

DATA_ADDR_53: ; $abf6 - offset $0a
.incbin "rom-prg/objects/data-object-atABF6.bin" ; Enemy Mine Frame 1/2

DATA_ADDR_54: ; $ac00 - offset $0a
.incbin "rom-prg/objects/data-object-atAC00.bin" ; Enemy Mine Frame 2/2

DATA_ADDR_55: ; $ac0a - offset $0a
.incbin "rom-prg/objects/data-object-atAC0A.bin" ; Mouth Boss Frame 1/3 (open animation)

DATA_ADDR_56: ; $ac1c - offset $12
.incbin "rom-prg/objects/data-object-atAC1C.bin" ; Mouth Boss Frame 2/3 (open animation)

DATA_ADDR_57: ; $ac2e - offset $12
.incbin "rom-prg/objects/data-object-atAC2E.bin" ; Mouth Boss Frame 3/3 (open animation)

DATA_ADDR_58: ; $ac48 - offset $1a
.incbin "rom-prg/objects/data-object-atAC48.bin" ; Enemy 4-pieces block (breaking up?) Frame 1/2

DATA_ADDR_59: ; $ac57 - offset $0f
.incbin "rom-prg/objects/data-object-atAC57.bin" ; Enemy 4-pieces block (breaking up?) Frame 2/2

DATA_ADDR_60: ; $ac66 - offset $0f
.byte $06, $06, $f6, $01 ; Enemy shot sparkle Frame 1/2

DATA_ADDR_61: ; $ac6a - offset $04
.byte $06, $06, $f7, $00 ; Enemy shot sparkle Frame 2/2

DATA_ADDR_62: ; $ac6e - offset $04
.incbin "rom-prg/objects/data-object-atAC6E.bin" ; Upwards comet shot

DATA_ADDR_63: ; $ac76 - offset $08
.incbin "rom-prg/objects/data-object-atAC76.bin" ; Downwards comet shot

DATA_ADDR_64: ; $ac7e - offset $08
.incbin "rom-prg/objects/data-object-atAC7E.bin" ; Enemy Top half ball

DATA_ADDR_65: ; $ac84 - offset $06
.incbin "rom-prg/objects/data-object-atAC84.bin" ; Enemy Bottom half ball

DATA_ADDR_66: ; $ac8a - offset $06
.incbin "rom-prg/objects/data-object-atAC8A.bin" ; Enemy Falling Meteor

DATA_ADDR_67: ; $ac94 - offset $0a
.byte $01, $01, $00, $00 ; Blank 


; ======================================
; Stage 01 Enemies
Data_atAC98: ; Address book
.word DATA_ADDR_68, DATA_ADDR_69, DATA_ADDR_70, DATA_ADDR_71
.word DATA_ADDR_72, DATA_ADDR_73, DATA_ADDR_74, DATA_ADDR_73
.word DATA_ADDR_75, DATA_ADDR_76, DATA_ADDR_75, DATA_ADDR_77
.word DATA_ADDR_78, DATA_ADDR_79, DATA_ADDR_80

.word $ffff

DATA_ADDR_68: ; $acb8
.incbin "rom-prg/objects/data-object-atACB8.bin" ; 

DATA_ADDR_69: ; $ace1
.incbin "rom-prg/objects/data-object-atACE1.bin"

DATA_ADDR_70: ; $ad05
.incbin "rom-prg/objects/data-object-atAD05.bin"

DATA_ADDR_71: ; $ad29
.incbin "rom-prg/objects/data-object-atAD29.bin"

DATA_ADDR_72: ; $ad5c
.incbin "rom-prg/objects/data-object-atAD5C.bin"

DATA_ADDR_73: ; $ad83
.incbin "rom-prg/objects/data-object-atAD83.bin"

DATA_ADDR_74: ; $adcd
.incbin "rom-prg/objects/data-object-atADAC.bin"

DATA_ADDR_75: ; $add3
.incbin "rom-prg/objects/data-object-atADD3.bin"

DATA_ADDR_76: ; $ae25
.incbin "rom-prg/objects/data-object-atAE25.bin"

DATA_ADDR_77: ; $ae63
.incbin "rom-prg/objects/data-object-atAE63.bin"

DATA_ADDR_78: ; $ae85
.incbin "rom-prg/objects/data-object-atAE85.bin"

DATA_ADDR_79: ; $aea2
.incbin "rom-prg/objects/data-object-atAEA2.bin"

DATA_ADDR_80: ; $aebf
.incbin "rom-prg/objects/data-object-atAEBF.bin"

; ======================================
Data_atAEC6:

;; First Block
.word Data_atAF06
.word Data_atAF12
.word Data_atAF1E
.word Data_atAF2A
.word Data_atAF36
.word Data_atAF42
.word Data_atAF4E
.word Data_atAF5A
.word Data_atAF66
.word Data_atAF72
.word Data_atAF7E
.word Data_atAF8A

;; Second Block
.word Data_atB27D
.word Data_atB289
.word Data_atB295
.word Data_atB2A1
.word Data_atB2AD
.word Data_atB2B9
.word Data_atB2C5
.word Data_atB2D1
.word Data_atB2DD
.word Data_atB2E9
.word Data_atB2F5
.word Data_atB301 
.word Data_atB30D
.word Data_atB319
.word Data_atB325
.word Data_atB331

.word Data_atAF96

.word Data_atB33D
.word Data_atB349
.word Data_atB355

;; These below are PROBABLY enemies, followed by their AI

Data_atAF06:
.word Data_atAFA2
.incbin "rom-prg/objects/data-12bytes-atAF08.bin"

Data_atAF12:
.word Data_atB004
.incbin "rom-prg/objects/data-12bytes-atAF14.bin"

Data_atAF1E:
.word Data_atB03A
.incbin "rom-prg/objects/data-12bytes-atAF20.bin"

Data_atAF2A:
.word Data_atB070
.incbin "rom-prg/objects/data-12bytes-atAF2C.bin"

Data_atAF36:
.word Data_atB09A
.incbin "rom-prg/objects/data-12bytes-atAF38.bin"

Data_atAF42:
.word Data_atB0AD
.incbin "rom-prg/objects/data-12bytes-atAF44.bin"

Data_atAF4E:
.word Data_atB0BF
.incbin "rom-prg/objects/data-12bytes-atAF50.bin"

Data_atAF5A:
.word Data_atB123
.incbin "rom-prg/objects/data-12bytes-atAF5C.bin"

Data_atAF66:
.word Data_atB169
.incbin "rom-prg/objects/data-12bytes-atAF68.bin"

Data_atAF72:
.word Data_atB18F
.incbin "rom-prg/objects/data-12bytes-atAF74.bin"

Data_atAF7E:
.word Data_atB211
.incbin "rom-prg/objects/data-12bytes-atAF80.bin"

Data_atAF8A:
.word Data_atB247
.incbin "rom-prg/objects/data-12bytes-atAF8C.bin"

Data_atAF96:
.word Data_atB146
.incbin "rom-prg/objects/data-12bytes-atAF98.bin"

; Each one of the above has one below (enemy AI?)
Data_atAFA2:
.incbin "rom-prg/objects/data-block-atAFA2.bin"

Data_atB004:
.incbin "rom-prg/objects/data-block-atB004.bin"

Data_atB03A:
.incbin "rom-prg/objects/data-block-atB03A.bin"

Data_atB070:
.incbin "rom-prg/objects/data-block-atB070.bin"

Data_atB09A:
.incbin "rom-prg/objects/data-block-atB09A.bin"

Data_atB0AD:
.incbin "rom-prg/objects/data-block-atB0AD.bin"

Data_atB0BF:
.incbin "rom-prg/objects/data-block-atB0BF.bin"

Data_atB123:
.incbin "rom-prg/objects/data-block-atB123.bin"

Data_atB146:
.incbin "rom-prg/objects/data-block-atB146.bin"

Data_atB169:
.incbin "rom-prg/objects/data-block-atB169.bin"

Data_atB18F:
.incbin "rom-prg/objects/data-block-atB18F.bin"

Data_atB211:
.incbin "rom-prg/objects/data-block-atB211.bin"

Data_atB247:
.incbin "rom-prg/objects/data-block-atB247.bin" 

;==========================


;; These below are PROBABLY enemies, followed by their AI

Data_atB27D:
.word Data_atB361
.incbin "rom-prg/objects/data-12bytes-atB27F.bin" 

Data_atB289:
.word Data_atB377
.incbin "rom-prg/objects/data-12bytes-atB28B.bin" 

Data_atB295:
.word Data_atB38D
.incbin "rom-prg/objects/data-12bytes-atB297.bin" 

Data_atB2A1:
.word Data_atB397
.incbin "rom-prg/objects/data-12bytes-atB2A3.bin" 

Data_atB2AD:
.word Data_atB3AD
.incbin "rom-prg/objects/data-12bytes-atB2AF.bin" 

Data_atB2B9:
.word Data_atB3C3
.incbin "rom-prg/objects/data-12bytes-atB2BB.bin" 

Data_atB2C5:
.word Data_atB3E9
.incbin "rom-prg/objects/data-12bytes-atB2C7.bin" 

Data_atB2D1:
.word Data_atB40F
.incbin "rom-prg/objects/data-12bytes-atB2D3.bin" 

Data_atB2DD:
.word Data_atB421
.incbin "rom-prg/objects/data-12bytes-atB2DF.bin" 

Data_atB2E9:
.word Data_atB447
.incbin "rom-prg/objects/data-12bytes-atB2EB.bin" 

Data_atB2F5:
.word Data_atB46D
.incbin "rom-prg/objects/data-12bytes-atB2F7.bin" 

Data_atB301:
.word Data_atB511
.incbin "rom-prg/objects/data-12bytes-atB303.bin" 

Data_atB30D:
.word Data_atB5B5
.incbin "rom-prg/objects/data-12bytes-atB30F.bin" 

Data_atB319:
.word Data_atB659
.incbin "rom-prg/objects/data-12bytes-atB31B.bin" 

Data_atB325:
.word Data_atB6FD
.incbin "rom-prg/objects/data-12bytes-atB327.bin" 

Data_atB331:
.word Data_atB7A1
.incbin "rom-prg/objects/data-12bytes-atB333.bin" 

Data_atB33D:
.word Data_atB845
.incbin "rom-prg/objects/data-12bytes-atB33F.bin" 

Data_atB349:
.word Data_atB859
.incbin "rom-prg/objects/data-12bytes-atB34B.bin" 

Data_atB355:
.word Data_atB86D
.incbin "rom-prg/objects/data-12bytes-atB357.bin"

; Each one of the above has one below (enemy AI?)

Data_atB361:
.incbin "rom-prg/objects/data-block-atB361.bin"

Data_atB377:
.incbin "rom-prg/objects/data-block-atB377.bin"

Data_atB38D:
.incbin "rom-prg/objects/data-block-atB38D.bin"

Data_atB397:
.incbin "rom-prg/objects/data-block-atB397.bin"

Data_atB3AD:
.incbin "rom-prg/objects/data-block-atB3AD.bin"

Data_atB3C3:
.incbin "rom-prg/objects/data-block-atB3C3.bin"

Data_atB3E9:
.incbin "rom-prg/objects/data-block-atB3E9.bin"

Data_atB40F:
.incbin "rom-prg/objects/data-block-atB40F.bin"

Data_atB421:
.incbin "rom-prg/objects/data-block-atB421.bin"

Data_atB447:
.incbin "rom-prg/objects/data-block-atB447.bin"

Data_atB46D:
.incbin "rom-prg/objects/data-block-atB46D.bin"

Data_atB511:
.incbin "rom-prg/objects/data-block-atB511.bin"

Data_atB5B5:
.incbin "rom-prg/objects/data-block-atB5B5.bin"

Data_atB659:
.incbin "rom-prg/objects/data-block-atB659.bin"

Data_atB6FD:
.incbin "rom-prg/objects/data-block-atB6FD.bin"

Data_atB7A1:
.incbin "rom-prg/objects/data-block-atB7A1.bin"

Data_atB845:
.incbin "rom-prg/objects/data-block-atB845.bin"

Data_atB859:
.incbin "rom-prg/objects/data-block-atB859.bin"

Data_atB86D:
.incbin "rom-prg/objects/data-block-atB86D.bin"


; ======================================
; Stage 02 Enemies
Data_atB8ED:
.incbin "rom-prg/objects/temp-address-atB8ED.bin"

.word $ffff

.incbin "rom-prg/objects/data-block-atB90D.bin"

; ======================================

Data_atBB5D:
.incbin "rom-prg/objects/data-block-atBB5D.bin"

; ======================================
; Stage 03 Enemies
Data_atC50D:
.incbin "rom-prg/objects/temp-address-atC50D.bin"

.word $ffff

.incbin "rom-prg/objects/data-block-atC52D.bin"

; ======================================

Data_atC8B9:
.incbin "rom-prg/objects/temp-address-atC8B9.bin"

.incbin "rom-prg/objects/data-block-atC947.bin"

; ======================================
; Stage 04 Enemies
Data_atE3A6:
.incbin "rom-prg/objects/temp-address-atE3A6.bin"

.word $ffff

.incbin "rom-prg/objects/data-block-atE3C6.bin"