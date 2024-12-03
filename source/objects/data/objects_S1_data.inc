; The offset used to read from this list, 
; stored in objectType_58, is the first byte in each file. 

; The address itself is stored in objectPtr_38

.addr Data_atAF06
.addr Data_atAF12
.addr Data_atAF1E
.addr Data_atAF2A
.addr Data_atAF36
.addr Data_atAF42
.addr Data_atAF4E
.addr Data_atAF5A
.addr Data_atAF66
.addr Data_atAF72
.addr Data_atAF7E
.addr Data_atAF8A

.addr Data_atB27D
.addr Data_atB289
.addr Data_atB295
.addr Data_atB2A1
.addr Data_atB2AD
.addr Data_atB2B9
.addr Data_atB2C5
.addr Data_atB2D1
.addr Data_atB2DD
.addr Data_atB2E9
.addr Data_atB2F5
.addr Data_atB301 
.addr Data_atB30D
.addr Data_atB319
.addr Data_atB325
.addr Data_atB331
.addr Data_atAF96
.addr Data_atB33D
.addr Data_atB349
.addr Data_atB355 ; AF04

;; These below are enemies, followed by their AI

Data_atAF06:
.addr Data_atAFA2
.incbin "objects/metadata/data-10bytes-atAF08.bin"
;.byte $02, $70, $10, $0B, $10, $1F, $01, $05, $0A, $00
;.byte $02, $70, $00, $00, $00, $00, $00, $00, $00, $00

Data_atAF12:
.addr Data_atB004
.incbin "objects/metadata/data-10bytes-atAF14.bin"
;.byte $02, $70, $10, $0E, $02, $1F, $01, $00, $0A, $00
;.byte $02, $70, $00, $00, $00, $00, $00, $00, $00, $00

Data_atAF1E:
.addr Data_atB03A
.incbin "objects/metadata/data-10bytes-atAF20.bin"
;.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00


Data_atAF2A:
.addr Data_atB070
.incbin "objects/metadata/data-10bytes-atAF2C.bin"
;.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00


Data_atAF36:
.addr Data_atB09A
.incbin "objects/metadata/data-10bytes-atAF38.bin"


Data_atAF42:
.addr Data_atB0AD
.incbin "objects/metadata/data-10bytes-atAF44.bin"


Data_atAF4E:
.addr Data_atB0BF
.incbin "objects/metadata/data-10bytes-atAF50.bin"


Data_atAF5A:
.addr Data_atB123
.incbin "objects/metadata/data-10bytes-atAF5C.bin"


Data_atAF66:
.addr Data_atB169
.incbin "objects/metadata/data-10bytes-atAF68.bin"


Data_atAF72:
.addr Data_atB18F
.incbin "objects/metadata/data-10bytes-atAF74.bin"


Data_atAF7E:
.addr Data_atB211
.incbin "objects/metadata/data-10bytes-atAF80.bin"


Data_atAF8A:
.addr Data_atB247
.incbin "objects/metadata/data-10bytes-atAF8C.bin"

; This one seems off place. Boss???
Data_atAF96:
.addr Data_atB146
.incbin "objects/metadata/data-10bytes-atAF98.bin"


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
; Last byte how many frames between updates (negative number)
;
Data_atAFA2:
; Bee moving sine wave
.incbin "objects/data/data1/data-block-atAFA2.bin"

Data_atB004:
.incbin "objects/data/data1/data-block-atB004.bin"

Data_atB03A:
.incbin "objects/data/data1/data-block-atB03A.bin"

Data_atB070:
.incbin "objects/data/data1/data-block-atB070.bin"

Data_atB09A:
.incbin "objects/data/data1/data-block-atB09A.bin"

Data_atB0AD:
.incbin "objects/data/data1/data-block-atB0AD.bin"

Data_atB0BF:
.incbin "objects/data/data1/data-block-atB0BF.bin"

Data_atB123:
.incbin "objects/data/data1/data-block-atB123.bin"

Data_atB146:
.incbin "objects/data/data1/data-block-atB146.bin"

Data_atB169:
.incbin "objects/data/data1/data-block-atB169.bin"

Data_atB18F:
.incbin "objects/data/data1/data-block-atB18F.bin"

Data_atB211:
.incbin "objects/data/data1/data-block-atB211.bin"

Data_atB247:
.incbin "objects/data/data1/data-block-atB247.bin" 

;==========================


;; These below are PROBABLY enemies, followed by their AI

Data_atB27D:
.addr Data_atB361
;.incbin "objects/metadata/data-10bytes-atB27F.bin" 

.byte $02 ; attack points
.byte $70 ; object flags
.byte $10 ; hit box width
.byte $0B ; hit box height
.byte $02 ; health points
.byte $1F ; unknown property
.byte $01 ; unknown property
.byte $05 ; object VX
.byte $0A ; object VY
.byte $33 ; unknown property

Data_atB289:
.addr Data_atB377
.incbin "objects/metadata/data-10bytes-atB28B.bin" 

Data_atB295:
.addr Data_atB38D
.incbin "objects/metadata/data-10bytes-atB297.bin" 

Data_atB2A1:
.addr Data_atB397
.incbin "objects/metadata/data-10bytes-atB2A3.bin" 

Data_atB2AD:
.addr Data_atB3AD
.incbin "objects/metadata/data-10bytes-atB2AF.bin" 

Data_atB2B9:
.addr Data_atB3C3
.incbin "objects/metadata/data-10bytes-atB2BB.bin" 

Data_atB2C5:
.addr Data_atB3E9
.incbin "objects/metadata/data-10bytes-atB2C7.bin" 

Data_atB2D1:
.addr Data_atB40F
.incbin "objects/metadata/data-10bytes-atB2D3.bin" 

Data_atB2DD:
.addr Data_atB421
.incbin "objects/metadata/data-10bytes-atB2DF.bin" 

Data_atB2E9:
.addr Data_atB447
.incbin "objects/metadata/data-10bytes-atB2EB.bin" 

Data_atB2F5:
.addr Data_atB46D
.incbin "objects/metadata/data-10bytes-atB2F7.bin" 

Data_atB301:
.addr Data_atB511
.incbin "objects/metadata/data-10bytes-atB303.bin" 

Data_atB30D:
.addr Data_atB5B5
.incbin "objects/metadata/data-10bytes-atB30F.bin" 

Data_atB319:
.addr Data_atB659
.incbin "objects/metadata/data-10bytes-atB31B.bin" 

Data_atB325:
.addr Data_atB6FD
.incbin "objects/metadata/data-10bytes-atB327.bin" 

Data_atB331:
.addr Data_atB7A1
.incbin "objects/metadata/data-10bytes-atB333.bin" 

Data_atB33D:
.addr Data_atB845
.incbin "objects/metadata/data-10bytes-atB33F.bin" 

Data_atB349:
.addr Data_atB859
.incbin "objects/metadata/data-10bytes-atB34B.bin" 

Data_atB355:
.addr Data_atB86D
;.incbin "objects/metadata/data-10bytes-atB357.bin"

.byte $03 ; attack points
.byte $70 ; object flags
.byte $1F ; hit box width
.byte $23 ; hit box height
.byte $8C ; health points
.byte $24 ; unknown property
.byte $05 ; type of shot
		;	00 nothing
		;	01 single directional bubble 
		;	02 nothing
		;	03 ring of bubble
		;	04 nothing
		;	05 wall of 4 bubbles + 1 wavy spark 
		; 	06 three comets
		;	07 wall with three comets and 2 ambers
		;	08 3 commets wall with 5 ambers, 1 wavy
.byte $00 ; object VX
.byte $0A ; object VY
.byte $17 ; unknown property

; Each one of the above has one below (enemy AI?)

Data_atB361:
.incbin "objects/data/data1/data-block-atB361.bin"

Data_atB377:
.incbin "objects/data/data1/data-block-atB377.bin"

Data_atB38D:
.incbin "objects/data/data1/data-block-atB38D.bin"

Data_atB397:
.incbin "objects/data/data1/data-block-atB397.bin"

Data_atB3AD:
.incbin "objects/data/data1/data-block-atB3AD.bin"

Data_atB3C3:
.incbin "objects/data/data1/data-block-atB3C3.bin"

Data_atB3E9:
.incbin "objects/data/data1/data-block-atB3E9.bin"

Data_atB40F:
.incbin "objects/data/data1/data-block-atB40F.bin"

Data_atB421:
.incbin "objects/data/data1/data-block-atB421.bin"

Data_atB447:
.incbin "objects/data/data1/data-block-atB447.bin"

Data_atB46D:
.incbin "objects/data/data1/data-block-atB46D.bin"

Data_atB511:
.incbin "objects/data/data1/data-block-atB511.bin"

Data_atB5B5:
.incbin "objects/data/data1/data-block-atB5B5.bin"

Data_atB659:
.incbin "objects/data/data1/data-block-atB659.bin"

Data_atB6FD:
.incbin "objects/data/data1/data-block-atB6FD.bin"

Data_atB7A1:
.incbin "objects/data/data1/data-block-atB7A1.bin"

Data_atB845:
.incbin "objects/data/data1/data-block-atB845.bin"

Data_atB859:
.incbin "objects/data/data1/data-block-atB859.bin"

Data_atB86D:
.incbin "objects/data/data1/data-block-atB86D.bin"