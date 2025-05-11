; The offset used to read from this list,
; stored in objectType_58, is the first byte in each file.

; The address itself is stored in objectPtr_38

.addr Data_atAF06	;	index $00
.addr Data_atAF12	;	index $01
.addr Data_atAF1E	;	index $02
.addr Data_atAF2A	;	index $03
.addr Data_atAF36	;	index $04
.addr Data_atAF42	;	index $05
.addr Data_atAF4E	;	index $06
.addr Data_atAF5A	;	index $07
.addr Data_atAF66	;	index $08
.addr Data_atAF72	;	index $09
.addr Data_atAF7E	;	index $0A
.addr Data_atAF8A	;	index $0B
.addr Data_atB27D	;	index $0C
.addr Data_atB289	;	index $0D
.addr Data_atB295	;	index $0E
.addr Data_atB2A1	;	index $0F

.addr Data_atB2AD	;	index $10
.addr Data_atB2B9	;	index $11
.addr Data_atB2C5	;	index $12
.addr Data_atB2D1	;	index $13
.addr Data_atB2DD	;	index $14
.addr Data_atB2E9	;	index $15
.addr Data_atB2F5	;	index $16
.addr Data_atB301 	;	index $17
.addr Data_atB30D	;	index $18
.addr Data_atB319	;	index $19
.addr Data_atB325	;	index $1A
.addr Data_atB331	;	index $1B
.addr Data_atAF96	;	index $1C
.addr Data_atB33D	;	index $1D
.addr Data_atB349	;	index $1E
.addr Data_atB355	;	index $1F

;; These below are enemies, followed by their AI

Data_atAF06:	;	index $00
.addr Data_atAFA2
.include "objects/profiles/enemy_profile_00.inc"
;.incbin "objects/metadata/data-10bytes-atAF08.bin"

Data_atAF12:	;	index $01
.addr Data_atB004
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atAF14.bin"

Data_atAF1E:	;	index $02
.addr Data_atB03A
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atAF20.bin"


Data_atAF2A:	;	index $03
.addr Data_atB070
.include "objects/profiles/enemy_profile_00.inc"
;.incbin "objects/metadata/data-10bytes-atAF2C.bin"


Data_atAF36:				; Index $04
.addr Data_atB09A			; Enemy AI/Animation
.include "objects/profiles/enemy_profile_04.inc"
;.incbin "objects/metadata/data-10bytes-atAF38.bin"

Data_atAF42:	;	index $05
.addr Data_atB0AD
.include "objects/profiles/enemy_profile_05.inc"
;.incbin "objects/metadata/data-10bytes-atAF44.bin"


Data_atAF4E:	;	index $06
.addr Data_atB0BF
.include "objects/profiles/enemy_profile_06.inc"
;.incbin "objects/metadata/data-10bytes-atAF50.bin"


Data_atAF5A:	;	index $07
.addr Data_atB123
.include "objects/profiles/enemy_profile_07.inc"
;.incbin "objects/metadata/data-10bytes-atAF5C.bin"


Data_atAF66:	;	index $08
.addr Data_atB169
.include "objects/profiles/enemy_profile_08.inc"
;.incbin "objects/metadata/data-10bytes-atAF68.bin"


Data_atAF72:	;	index $09
.addr Data_atB18F
.include "objects/profiles/enemy_profile_09.inc"
;.incbin "objects/metadata/data-10bytes-atAF74.bin"


Data_atAF7E:	;	index $0A
.addr Data_atB211
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atAF80.bin"


Data_atAF8A:	;	index $0B
.addr Data_atB247
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atAF8C.bin"

; This one seems off place. Boss???
Data_atAF96:
.addr Data_atB146
.include "objects/profiles/enemy_profile_1C.inc"
;.incbin "objects/metadata/data-10bytes-atAF98.bin"


; Enemy type and movement
; Blocks of 4 bytes
; Terminated by $FE, $00
;
; First byte is the enemy sprite/animation frame
;
; 19, 1A        : Rocket Bedouin
; 1B, 1C        : Head
; 1D, 1E        : Bee
; 1F, 20, 21    : Duck
; 2D, 2E, 2F    : Bat

; 33, 34        : Ball
; 35, 36        : Mine
; 31, 32		: 4-Piece Block
; 3A, 3B		: 4-Piece Block/Breaking up
;
; Next 2 bytes are displacement in X and Y (between frames of animation)
;
; Last byte how many frames between updates

Data_atAFA2:
; Bee moving sine wave
;.incbin "objects/data/data1/data-block-atAFA2.bin"
.byte afBEE+0, -6,  0, acTIMER+3	; Enemy starting animation frame, X displacement, Y displacement, interframe timer
.byte afBEE+1, -5, -3, acTIMER+3
.byte afBEE+0, -4, -3, acTIMER+3
.byte afBEE+1, -2, -4, acTIMER+3
.byte afBEE+0, -2, -4, acTIMER+3
.byte afBEE+1,  0, -4, acTIMER+3
.byte afBEE+0,  0, -4, acTIMER+3
.byte afBEE+1, -2, -4, acTIMER+3
.byte afBEE+0, -2, -4, acTIMER+3
.byte afBEE+1, -4, -3, acTIMER+3
.byte afBEE+0, -5, -3, acTIMER+3
.byte afBEE+1, -6,  0, acTIMER+3
.byte afBEE+0, -6,  0, acTIMER+3
.byte afBEE+1, -5,  3, acTIMER+3
.byte afBEE+0, -4,  3, acTIMER+3
.byte afBEE+1, -2,  4, acTIMER+3
.byte afBEE+0, -2,  4, acTIMER+3
.byte afBEE+1,  0,  4, acTIMER+3
.byte afBEE+0,  0,  4, acTIMER+3
.byte afBEE+1, -2,  4, acTIMER+3
.byte afBEE+0, -2,  4, acTIMER+3
.byte afBEE+1, -4,  3, acTIMER+3
.byte afBEE+0, -5,  3, acTIMER+3
.byte afBEE+1, -6,  0, acTIMER+3
.byte acLOOPBACK, 0

Data_atB004:
; Duck moving forward, then diving
;.incbin "objects/data/data1/data-block-atB004.bin"
.byte afDUCK+0, -3,  0, acTIMER+3    ; Duck frame 0, move left, no vertical movement
.byte afDUCK+1, -3,  0, acTIMER+3    ; Duck frame 1, move left, no vertical movement
.byte afDUCK+2, -3,  0, acTIMER+3    ; Duck frame 2, move left, no vertical movement
.byte afDUCK+1, -3,  0, acTIMER+3    ; Duck frame 1, move left, no vertical movement
.byte acLOOPN+14, 0                  ; Loop 14 times (fly straight)
.byte afDUCK+0, -3,  2, acTIMER+3    ; Duck frame 0, move left, dive down
.byte afDUCK+1, -3,  2, acTIMER+3    ; Duck frame 1, move left, dive down
.byte afDUCK+2, -3,  2, acTIMER+3    ; Duck frame 2, move left, dive down
.byte afDUCK+1, -3,  0, acTIMER+3    ; Duck frame 1, move left, no vertical movement
.byte acLOOPN+18, $12                ; Loop 18 times (dive)
.byte afDUCK+0, -4,  0, acTIMER+3    ; Duck frame 0, move left faster, no vertical movement
.byte afDUCK+1, -4,  0, acTIMER+3    ; Duck frame 1, move left faster, no vertical movement
.byte afDUCK+2, -4,  0, acTIMER+3    ; Duck frame 2, move left faster, no vertical movement
.byte afDUCK+1, -4,  0, acTIMER+3    ; Duck frame 1, move left faster, no vertical movement
.byte acLOOPBACK, 32                 ; Loop back to position 32 (continue flying straight)

Data_atB03A:
; Duck moving forward, then diving
;.incbin "objects/data/data1/data-block-atB03A.bin"
.byte afDUCK+1, -3,  0, acTIMER+3    ; Duck frame 1, move left, no vertical movement
.byte afDUCK+2, -3,  0, acTIMER+3    ; Duck frame 2, move left, no vertical movement
.byte afDUCK+1, -3,  0, acTIMER+3    ; Duck frame 1, move left, no vertical movement
.byte afDUCK+0, -3,  0, acTIMER+3    ; Duck frame 0, move left, no vertical movement
.byte acLOOPN+14, 0                  ; Loop 14 times (fly straight)
.byte afDUCK+1, -3,  2, acTIMER+3    ; Duck frame 1, move left, dive down
.byte afDUCK+2, -3,  2, acTIMER+3    ; Duck frame 2, move left, dive down
.byte afDUCK+1, -3,  2, acTIMER+3    ; Duck frame 1, move left, dive down
.byte afDUCK+0, -3,  0, acTIMER+3    ; Duck frame 0, move left, no vertical movement
.byte acLOOPN+18, $12                ; Loop 18 times (dive)
.byte afDUCK+1, -2,  0, acTIMER+3    ; Duck frame 1, move left slower, no vertical movement
.byte afDUCK+2, -2,  0, acTIMER+3    ; Duck frame 2, move left slower, no vertical movement
.byte afDUCK+1, -2,  0, acTIMER+3    ; Duck frame 1, move left slower, no vertical movement
.byte afDUCK+0, -2,  0, acTIMER+3    ; Duck frame 0, move left slower, no vertical movement
.byte acLOOPBACK, 32                 ; Loop back to position 32 (continue flying straight)

Data_atB070:
; Bee moving sawtooth wave
;.incbin "objects/data/data1/data-block-atB070.bin"
.byte afBEE+1, -2, -1, acTIMER+2  ; Bee frame 1, move left, move up
.byte afBEE+0, -2, -1, acTIMER+2  ; Bee frame 0, move left, move up
.byte acLOOPN+10, 0               ; Loop 10 times (move up)
.byte afBEE+1, -2,  1, acTIMER+2  ; Bee frame 1, move left, move down
.byte afBEE+0, -2,  1, acTIMER+2  ; Bee frame 0, move left, move down
.byte acLOOPN+6, 10               ; Loop 6 times (move down), jump to position 10
.byte afBEE+1, -2, -2, acTIMER+2  ; Bee frame 1, move left, move up faster
.byte afBEE+0, -2, -2, acTIMER+2  ; Bee frame 0, move left, move up faster
.byte acLOOPN+6, 20               ; Loop 6 times (move up faster), jump to position 20
.byte afBEE+1, -2,  2, acTIMER+2  ; Bee frame 1, move left, move down faster
.byte afBEE+0, -2,  2, acTIMER+2  ; Bee frame 0, move left, move down faster
.byte acLOOPN+8, 30               ; Loop 8 times (move down faster), jump to position 30
.byte acLOOPBACK, 0               ; Loop back to the beginning

Data_atB09A:
; Bedouin moving upward, then left
;.incbin "objects/data/data1/data-block-atB09A.bin"
.byte afBEDOUIN+1,  0, -3, acTIMER+3    ; Bedouin frame 1, no horizontal movement, move up
.byte afBEDOUIN+0,  0, -3, acTIMER+3    ; Bedouin frame 0, no horizontal movement, move up
.byte acLOOPN+31, 0                     ; Loop 31 times (move upward)
.byte afBEDOUIN+1, -2,  0               ; Bedouin frame 1, move left, no vertical movement
.byte afBEDOUIN+0, -2,  0, acTIMER+1    ; Bedouin frame 0, move left, no vertical movement, faster timing
.byte acLOOPBACK, 10                    ; Loop back to position 10 (continue moving left)

Data_atB0AD:
; Bedouin movement pattern - first up-right, then left
;.incbin "objects/data/data1/data-block-atB0AD.bin"
.byte afBEDOUIN+1, -1, 3, acTIMER+4    ; Bedouin frame 1, move left, move up, slower timing
.byte afBEDOUIN+0, -1, 3, acTIMER+4    ; Bedouin frame 0, move left, move up, slower timing
.byte acLOOPN+15, 0                    ; Repeat the above 15 times
.byte afBEDOUIN+1, -3, 0               ; Bedouin frame 1, move left faster, no vertical movement
.byte afBEDOUIN+0, -3, 0               ; Bedouin frame 0, move left faster, no vertical movement
.byte acLOOPBACK, 10                   ; Loop back to position 10 (continue moving left)

Data_atB0BF:
;.incbin "objects/data/data1/data-block-atB0BF.bin"
.byte afJINN+1, -1, -3, acTIMER+2
.byte afJINN+0, -1, -3, acTIMER+2
.byte acLOOPN+14, 0
.byte afJINN+1, -2, -3, acTIMER+2
.byte afJINN+0, -2, -3, acTIMER+2
.byte acLOOPN+10, 10
.byte afJINN+1, -2, -2, acTIMER+3
.byte afJINN+0, -2, -2, acTIMER+3
.byte acLOOPN+10, 20
.byte afJINN+1, -3, -1, acTIMER+4
.byte afJINN+0, -3, -1, acTIMER+4
.byte acLOOPN+10, 30
.byte afJINN+1, -3, 0, acTIMER+5
.byte afJINN+0, -3, 0, acTIMER+5
.byte acLOOPN+2, 40
.byte afJINN+1, -4, 3, acTIMER+5
.byte afJINN+0, -4, 3, acTIMER+5
.byte acLOOPN+2, 50
.byte afJINN+1, -2, 4, acTIMER+4
.byte afJINN+0, -2, 4, acTIMER+4
.byte acLOOPN+2, 60
.byte afJINN+1, 0, 4, acTIMER+4
.byte afJINN+0, 0, 4, acTIMER+4
.byte acLOOPN+2, 70
.byte afJINN+1, 2, 4, acTIMER+2
.byte afJINN+0, 2, 4, acTIMER+2
.byte acLOOPN+2, 80
.byte afJINN+1, 2, 2, acTIMER+1
.byte afJINN+0, 2, 3, acTIMER+1
.byte acLOOPBACK, 90

Data_atB123:
;.incbin "objects/data/data1/data-block-atB123.bin"
.byte afJINN+1,  1,  2, acTIMER+5
.byte afJINN+0,  1,  2, acTIMER+5
.byte afJINN+1,  2,  1, acTIMER+5
.byte afJINN+0,  3,  1, acTIMER+5
.byte afJINN+1, -1,  2, acTIMER+5
.byte afJINN+0, -1,  2, acTIMER+5
.byte afJINN+1, -2,  1, acTIMER+5
.byte afJINN+0, -3,  1, acTIMER+5
.byte acLOOPBACK, 0
.byte acEND

Data_atB146:
;.incbin "objects/data/data1/data-block-atB146.bin"
.byte afJINN+1,  2,  3, acTIMER+4
.byte afJINN+0,  3,  3, acTIMER+4
.byte afJINN+1,  5,  2, acTIMER+5
.byte afJINN+0,  6,  2, acTIMER+5
.byte afJINN+1, -2,  4, acTIMER+4
.byte afJINN+0, -4,  4, acTIMER+4
.byte afJINN+1, -5,  3, acTIMER+5
.byte afJINN+0, -7,  3, acTIMER+5
.byte acLOOPBACK, 0, $FF

Data_atB169:
;.incbin "objects/data/data1/data-block-atB169.bin"
.byte afBEE+1, -1,  1
.byte afBEE+1, -1,  1
.byte afBEE+1, -1,  1
.byte afBEE+0, -1,  1
.byte afBEE+0, -1,  1
.byte afBEE+0, -1,  1
.byte afBEE+1, -1, -1
.byte afBEE+1, -1, -1
.byte afBEE+1, -1, -1
.byte afBEE+0, -1, -1
.byte afBEE+0, -1, -1
.byte afBEE+0, -1, -1
.byte acLOOPBACK, 0

Data_atB18F:
; Bedouin moving in a circular pattern
;.incbin "objects/data/data1/data-block-atB18F.bin"
.byte afBEDOUIN+0, -2,  2, acTIMER+2    ; Bedouin frame 0, move left, move down
.byte afBEDOUIN+1, -2,  2, acTIMER+2    ; Bedouin frame 1, move left, move down
.byte afBEDOUIN+0, -2,  2, acTIMER+2    ; Bedouin frame 0, move left, move down
.byte afBEDOUIN+1, -2,  2, acTIMER+2    ; Bedouin frame 1, move left, move down
.byte afBEDOUIN+0, -2,  2, acTIMER+2    ; Bedouin frame 0, move left, move down
.byte afBEDOUIN+1, -2,  1, acTIMER+2    ; Bedouin frame 1, move left, move down slower
.byte afBEDOUIN+0, -3,  1, acTIMER+2    ; Bedouin frame 0, move left faster, move down slower
.byte afBEDOUIN+1, -3,  1, acTIMER+2    ; Bedouin frame 1, move left faster, move down slower
.byte afBEDOUIN+0, -3,  0, acTIMER+2    ; Bedouin frame 0, move left faster, no vertical movement
.byte afBEDOUIN+1, -3, -1, acTIMER+2    ; Bedouin frame 1, move left faster, move up
.byte afBEDOUIN+0, -3, -1, acTIMER+2    ; Bedouin frame 0, move left faster, move up
.byte afBEDOUIN+1, -2, -1, acTIMER+2    ; Bedouin frame 1, move left, move up
.byte afBEDOUIN+0, -2, -2, acTIMER+2    ; Bedouin frame 0, move left, move up faster
.byte afBEDOUIN+1, -2, -2, acTIMER+2    ; Bedouin frame 1, move left, move up faster
.byte afBEDOUIN+0, -2, -2, acTIMER+2    ; Bedouin frame 0, move left, move up faster
.byte afBEDOUIN+1, -2, -2, acTIMER+2    ; Bedouin frame 1, move left, move up faster
.byte afBEDOUIN+0, -2, -2, acTIMER+2    ; Bedouin frame 0, move left, move up faster
.byte afBEDOUIN+1, -2, -2, acTIMER+2    ; Bedouin frame 1, move left, move up faster
.byte afBEDOUIN+0, -2, -2, acTIMER+2    ; Bedouin frame 0, move left, move up faster
.byte afBEDOUIN+1, -2, -2, acTIMER+2    ; Bedouin frame 1, move left, move up faster
.byte afBEDOUIN+0, -2, -2, acTIMER+2    ; Bedouin frame 0, move left, move up faster
.byte afBEDOUIN+1, -2, -2, acTIMER+2    ; Bedouin frame 1, move left, move up faster
.byte afBEDOUIN+0, -2, -1, acTIMER+2    ; Bedouin frame 0, move left, move up
.byte afBEDOUIN+1, -3, -1, acTIMER+2    ; Bedouin frame 1, move left faster, move up
.byte afBEDOUIN+0, -3, -1, acTIMER+2    ; Bedouin frame 0, move left faster, move up
.byte afBEDOUIN+1, -3,  0, acTIMER+2    ; Bedouin frame 1, move left faster, no vertical movement
.byte afBEDOUIN+0, -3,  1, acTIMER+2    ; Bedouin frame 0, move left faster, move down
.byte afBEDOUIN+1, -3,  1, acTIMER+2    ; Bedouin frame 1, move left faster, move down
.byte afBEDOUIN+0, -2,  1, acTIMER+2    ; Bedouin frame 0, move left, move down
.byte afBEDOUIN+1, -2,  2, acTIMER+2    ; Bedouin frame 1, move left, move down
.byte afBEDOUIN+0, -2,  2, acTIMER+2    ; Bedouin frame 0, move left, move down
.byte afBEDOUIN+1, -2,  2, acTIMER+2    ; Bedouin frame 1, move left, move down
.byte acLOOPBACK, 0                     ; Loop back to the beginning

Data_atB211:
; Duck moving forward, then rising
;.incbin "objects/data/data1/data-block-atB211.bin"
.byte afDUCK+2, -3, 0, acTIMER+2
.byte afDUCK+1, -3, 0, acTIMER+2
.byte afDUCK+0, -3, 0, acTIMER+2
.byte afDUCK+1, -3, 0, acTIMER+2
.byte acLOOPN+12, 0
.byte afDUCK+2, -3, -2, acTIMER+2
.byte afDUCK+1, -3, -2, acTIMER+2
.byte afDUCK+0, -3, 0, acTIMER+2
.byte afDUCK+1, -3, 0, acTIMER+2
.byte acLOOPN+16, $12
.byte afDUCK+2, -2, 0, acTIMER+2
.byte afDUCK+1, -2, 0, acTIMER+2
.byte afDUCK+0, -2, 0, acTIMER+2
.byte afDUCK+1, -2, 0, acTIMER+2
.byte acLOOPBACK, $24

Data_atB247:
; Duck moving forward, then rising
;.incbin "objects/data/data1/data-block-atB247.bin"
.byte afDUCK+0, -2, 0, acTIMER+2
.byte afDUCK+1, -2, 0, acTIMER+2
.byte afDUCK+2, -2, 0, acTIMER+2
.byte afDUCK+1, -2, 0, acTIMER+2
.byte acLOOPN+12, 0
.byte afDUCK+0, -3, -2, acTIMER+2
.byte afDUCK+1, -3, -2, acTIMER+2
.byte afDUCK+2, -3, 0, acTIMER+2
.byte afDUCK+1, -3, 0, acTIMER+2
.byte acLOOPN+16, $12
.byte afDUCK+0, -3, 0, acTIMER+2
.byte afDUCK+1, -3, 0, acTIMER+2
.byte afDUCK+2, -3, 0, acTIMER+2
.byte afDUCK+1, -3, 0, acTIMER+2
.byte acLOOPBACK, $24

;==========================


;; Enemies Animation/Movement (Game AI)

Data_atB27D:
.addr Data_atB361
.include "objects/profiles/enemy_profile_0C.inc"
;.incbin "objects/metadata/data-10bytes-atB27F.bin"

;.byte $02 ; attack points
;.byte $70 ; object flags
;.byte $10 ; hit box width
;.byte $0B ; hit box height
;.byte $02 ; health points
;.byte $1F ; unknown property
;.byte $01 ; type of shot
;.byte $05 ; object VX
;.byte $0A ; object VY
;.byte $33 ; unknown property

Data_atB289:
.addr Data_atB377
.include "objects/profiles/enemy_profile_0D.inc"
;.incbin "objects/metadata/data-10bytes-atB28B.bin"

Data_atB295:
.addr Data_atB38D
.include "objects/profiles/enemy_profile_0E.inc"
;.incbin "objects/metadata/data-10bytes-atB297.bin"

Data_atB2A1:
.addr Data_atB397
.include "objects/profiles/enemy_profile_0D.inc"
;.incbin "objects/metadata/data-10bytes-atB2A3.bin"

Data_atB2AD:
.addr Data_atB3AD
.include "objects/profiles/enemy_profile_0C.inc"
;.incbin "objects/metadata/data-10bytes-atB2AF.bin"

Data_atB2B9:
.addr Data_atB3C3
.include "objects/profiles/enemy_profile_11.inc"
;.incbin "objects/metadata/data-10bytes-atB2BB.bin"

Data_atB2C5:
.addr Data_atB3E9
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atB2C7.bin"

Data_atB2D1:
.addr Data_atB40F
.include "objects/profiles/enemy_profile_13.inc"
;.incbin "objects/metadata/data-10bytes-atB2D3.bin"

Data_atB2DD:
.addr Data_atB421
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atB2DF.bin"

Data_atB2E9:
.addr Data_atB447
.include "objects/profiles/enemy_profile_11.inc"
;.incbin "objects/metadata/data-10bytes-atB2EB.bin"

Data_atB2F5:
.addr Data_atB46D
.include "objects/profiles/enemy_profile_16.inc"
;.incbin "objects/metadata/data-10bytes-atB2F7.bin"

Data_atB301:
.addr Data_atB511
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atB303.bin"

Data_atB30D:
.addr Data_atB5B5
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atB30F.bin"

Data_atB319:
.addr Data_atB659
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atB31B.bin"

Data_atB325:
.addr Data_atB6FD
.include "objects/profiles/enemy_profile_01.inc"
;.incbin "objects/metadata/data-10bytes-atB327.bin"

Data_atB331:
.addr Data_atB7A1
.include "objects/profiles/enemy_profile_1B.inc"
;.incbin "objects/metadata/data-10bytes-atB333.bin"

Data_atB33D:
.addr Data_atB845
.include "objects/profiles/enemy_profile_00.inc"
;.incbin "objects/metadata/data-10bytes-atB33F.bin"

Data_atB349:
.addr Data_atB859
.include "objects/profiles/enemy_profile_00.inc"
;.incbin "objects/metadata/data-10bytes-atB34B.bin"

Data_atB355:	; BOSS
.addr Data_atB86D
.include "objects/profiles/enemy_profile_1F.inc"
;.incbin "objects/metadata/data-10bytes-atB357.bin"

;.byte $03 ; attack points
;.byte $70 ; object flags
;.byte $1F ; hit box width
;.byte $23 ; hit box height
;.byte $8C ; health points
;.byte $24 ; unknown property
;.byte $05 ; type of shot
		;	00 nothing
		;	01 single directional bubble
		;	02 nothing
		;	03 ring of bubble
		;	04 nothing
		;	05 wall of 4 bubbles + 1 wavy spark
		; 	06 three comets
		;	07 wall with three comets and 2 ambers
		;	08 3 commets wall with 5 ambers, 1 wavy
;.byte $00 ; object VX
;.byte $0A ; object VY
;.byte $17 ; unknown property

; Each one of the above has one below (enemy AI?)

Data_atB361:
;.incbin "objects/data/data1/data-block-atB361.bin"
.byte afBEE+1, -3, 0, acTIMER+3
.byte afBEE+0, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afBEE+1, -3, -2, acTIMER+3
.byte afBEE+0, -3, -2, acTIMER+3
.byte acLOOPN+15, 10
.byte acLOOPBACK, 0

Data_atB377:
;.incbin "objects/data/data1/data-block-atB377.bin"
.byte afBEE+0, -3, 0, acTIMER+3
.byte afBEE+1, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afBEE+0, -3, -1, acTIMER+3
.byte afBEE+1, -3, -1, acTIMER+3
.byte acLOOPN+15, 10
.byte acLOOPBACK, 0

Data_atB38D:
;.incbin "objects/data/data1/data-block-atB38D.bin"
.byte afBEE+1, -3, 0, acTIMER+3
.byte afBEE+0, -3, 0, acTIMER+3
.byte acLOOPBACK, 0

Data_atB397:
;.incbin "objects/data/data1/data-block-atB397.bin"
.byte afBEE+0, -3, 0, acTIMER+3
.byte afBEE+1, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afBEE+0, -3, 1, acTIMER+3
.byte afBEE+1, -3, 1, acTIMER+3
.byte acLOOPN+15, 10
.byte acLOOPBACK, 0

Data_atB3AD:
;.incbin "objects/data/data1/data-block-atB3AD.bin"
.byte afBEE+1, -3, 0, acTIMER+3
.byte afBEE+0, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afBEE+1, -3, 2, acTIMER+3
.byte afBEE+0, -3, 2, acTIMER+3
.byte acLOOPN+15, 10
.byte acLOOPBACK, 0

Data_atB3C3:
;.incbin "objects/data/data1/data-block-atB3C3.bin"
.byte afDUCK+0, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+2, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afDUCK+0, -3, -2, acTIMER+3
.byte afDUCK+1, -3, -2, acTIMER+3
.byte afDUCK+2, -3, -2, acTIMER+3
.byte afDUCK+1, -3, -2, acTIMER+3
.byte acLOOPN+15, $12
.byte acLOOPBACK, 0

Data_atB3E9:
;.incbin "objects/data/data1/data-block-atB3E9.bin"
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+2, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+0, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afDUCK+1, -3, -1, acTIMER+3
.byte afDUCK+2, -3, -1, acTIMER+3
.byte afDUCK+1, -3, -1, acTIMER+3
.byte afDUCK+0, -3, -1, acTIMER+3
.byte acLOOPN+15, $12
.byte acLOOPBACK, 0

Data_atB40F:
;.incbin "objects/data/data1/data-block-atB40F.bin"
.byte afDUCK+2, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+0, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte acLOOPBACK, 0

Data_atB421:
;.incbin "objects/data/data1/data-block-atB421.bin"
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+2, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+0, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afDUCK+1, -3, 1, acTIMER+3
.byte afDUCK+2, -3, 1, acTIMER+3
.byte afDUCK+1, -3, 1, acTIMER+3
.byte afDUCK+0, -3, 1, acTIMER+3
.byte acLOOPN+15, $12
.byte acLOOPBACK, 0

Data_atB447:
;.incbin "objects/data/data1/data-block-atB447.bin"
.byte afDUCK+0, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte afDUCK+2, -3, 0, acTIMER+3
.byte afDUCK+1, -3, 0, acTIMER+3
.byte acLOOPN+15, 0
.byte afDUCK+0, -3, 2, acTIMER+3
.byte afDUCK+1, -3, 2, acTIMER+3
.byte afDUCK+2, -3, 2, acTIMER+3
.byte afDUCK+1, -3, 2, acTIMER+3
.byte acLOOPN+15, $12
.byte acLOOPBACK, 0

Data_atB46D:
;.incbin "objects/data/data1/data-block-atB46D.bin"
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte acLOOPN+1, 0
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte acLOOPBACK, $22

Data_atB511:
;.incbin "objects/data/data1/data-block-atB511.bin"
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte acLOOPN+2, 0
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte acLOOPBACK, $22

Data_atB5B5:
;.incbin "objects/data/data1/data-block-atB5B5.bin"
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte acLOOPN+3, 0
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte acLOOPBACK, $22

Data_atB659:
;.incbin "objects/data/data1/data-block-atB659.bin"
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte acLOOPN+4, 0
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte acLOOPBACK, $22

Data_atB6FD:
;.incbin "objects/data/data1/data-block-atB6FD.bin"
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte acLOOPN+5, 0
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte acLOOPBACK, $22

Data_atB7A1:
;.incbin "objects/data/data1/data-block-atB7A1.bin"
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+0, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+2, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte afDUCK+1, -2, 0, acTIMER+1
.byte acLOOPN+6, 0
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+0, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+0, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+2, -2, -2, acTIMER+1
.byte afDUCK+1, -2, -1, acTIMER+1
.byte afDUCK+1, -3, -1, acTIMER+1
.byte afDUCK+0, -3, -1, acTIMER+1
.byte afDUCK+0, -3, 0, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+1, -3, 1, acTIMER+1
.byte afDUCK+2, -2, 1, acTIMER+1
.byte afDUCK+2, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte afDUCK+1, -2, 2, acTIMER+1
.byte acLOOPBACK, $22

Data_atB845:
;.incbin "objects/data/data1/data-block-atB845.bin"
.byte afBEE+1, -1, 1
.byte afBEE+1, -1, 0
.byte afBEE+1, -1, 1
.byte afBEE+0, -1, 1
.byte afBEE+0, -1, 0
.byte afBEE+0, -1, 1
.byte acLOOPBACK, 0

Data_atB859:
;.incbin "objects/data/data1/data-block-atB859.bin"
.byte afBEE+0, -1, -1
.byte afBEE+0, -1, 0
.byte afBEE+0, -1, -1
.byte afBEE+1, -1, -1
.byte afBEE+1, -1, 0
.byte afBEE+1, -1, -1
.byte acLOOPBACK, 0

Data_atB86D:
;.incbin "objects/data/data1/data-block-atB86D.bin"
.byte afWITCH, -3, 0, acTIMER+1
.byte acLOOPN+24, 0
.byte afWITCH, -4, 1, acTIMER+3
.byte afWITCH, -4, 1, acTIMER+3
.byte afWITCH, -3, 2, acTIMER+3
.byte afWITCH, -2, 3, acTIMER+3
.byte afWITCH, -1, 4, acTIMER+3
.byte afWITCH, -1, 4, acTIMER+3
.byte afWITCH, 0, 4, acTIMER+3
.byte acLOOPN+29, $1E
.byte afWITCH, 1, 4, acTIMER+3
.byte afWITCH, 1, 4, acTIMER+3
.byte afWITCH, 2, 3, acTIMER+3
.byte afWITCH, 3, 2, acTIMER+3
.byte afWITCH, 4, 1, acTIMER+3
.byte afWITCH, 4, 1, acTIMER+3
.byte afWITCH, 4, 0, acTIMER+3
.byte acLOOPN+2, $3C
.byte afWITCH, 4, -1, acTIMER+3
.byte afWITCH, 4, -1, acTIMER+3
.byte afWITCH, 3, -2, acTIMER+3
.byte afWITCH, 2, -3, acTIMER+3
.byte afWITCH, 1, -4, acTIMER+3
.byte afWITCH, 1, -4, acTIMER+3
.byte afWITCH, 0, -4, acTIMER+3
.byte acLOOPN+29, $5A
.byte afWITCH, -1, -4, acTIMER+3
.byte afWITCH, -1, -4, acTIMER+3
.byte afWITCH, -2, -3, acTIMER+3
.byte afWITCH, -3, -2, acTIMER+3
.byte afWITCH, -4, -1, acTIMER+3
.byte afWITCH, -4, -1, acTIMER+3
.byte afWITCH, -4, 0, acTIMER+3
.byte acLOOPN+2, $78
.byte acLOOPBACK, 6