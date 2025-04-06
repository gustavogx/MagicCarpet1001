; 8 Directional Projectile Trajectories Table
;					 	  
;					\     7 | 3     /
;			  	 	  \		|	  /		
;				    6   \	|	/  2
;					----- Enemy ------
;			  	    4	/	|	\  0
;			  		  /		|	  \		
;					/     5	| 1	    \
;					 			  
;
; octant 6
; font-up
; offsets 00 01 02 03 04
.addr Data_at8F36, Data_at8F3F, Data_at8F4A, Data_at8F55, Data_at8F5F

; octant 4
; front-down
; offsets 05 06 07 08 09
.addr Data_at8F69, Data_at8F72, Data_at8F7D, Data_at8F88, Data_at8F92

; octant 2
; back-up
; offsets 0A 0B 0C 0D 0E
.addr Data_at8F97, Data_at8FA0, Data_at8FAB, Data_at8FB6, Data_at8FC0

; octant 0
; back-down
; offsets 0F 10 11 12 13
.addr Data_at8FC5, Data_at8FCE, Data_at8FD9, Data_at8FE4, Data_at8FEE

; octant 7
; top-front
; offsets 14 15 16 17 18
.addr Data_at8FF3, Data_at8FFC, Data_at9007, Data_at9012, Data_at901C

; octant 3
; top-back
; offsets 19 1A 1B 1C 1D
.addr Data_at9021, Data_at902A, Data_at9035, Data_at9040, Data_at904A

; octant 5
; bottom-front
; offsets 1E 1F 20 21 22
.addr Data_at904F, Data_at9058, Data_at9063, Data_at906E, Data_at9078

; octant 1
; bottom-back
; offsets 23 24 25 26 27
.addr Data_at907D, Data_at9086, Data_at9091, Data_at909C, Data_at90A6


; >> Boss sparks fanning out

; three angles upwards: 90 60 and 30
; offsets 28 29 2A
.addr Data_at90AB, Data_at90B5, Data_at90BF

; central one goes spiralling
; offsets 2B
.addr Data_at90C9

; three angles downwards: 30 60 and 90
; offsets 2C 2D 2E
.addr Data_at9104, Data_at910E, Data_at9118


; >> Boss 3 comets fanning out

; up 30 degrees, horizontal, down 30 degrees
; offsets 2F 30 31
.addr Data_at9122, Data_at9128, Data_at9131


; >> Boss 2 ambers + 3 comets fanning out

; up 60 and 30 degrees, horizontal, down 30 and 60 degrees
; offsets 32 33 34 35 36
.addr Data_at9137, Data_at913D, Data_at9143, Data_at914C, Data_at9152


; >> Boss 5 spiralling ambers fanning out

; up-up, up-front, front, down-front, down-down
; offsets 37, 38, 39, 3A, 3B
.addr Data_at9158, Data_at9193, Data_at91CE, Data_at9209, Data_at9244

; =====================================================
; Projectile's paths
; =====================================================

; ===== 8 directional bubble shots ====================


; octant 6 (font-up)

; offset 00
Data_at8F36: 
.byte $16, $FE, $FE, $81, $16, $00, $00, $FE, $00

; offset 01
Data_at8F3F:
.byte $16, $FF, $FF, $C2, $00, $16, $FF, $00, $81, $FE, $00

; offset 02
Data_at8F4A:
.byte $16, $FE, $FF, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 03
Data_at8F55:
.byte $16, $FF, $00, $C2, $00, $16, $FF, $FF, $FE, $00

; offset 04 (straight front)
Data_at8F5F:
.byte $16, $FF, $00, $D0, $00, $16, $FE, $00, $FE, $00
; .byte $16, $FF, $00, $FE, $00 <- it could be just like this

; octant 4 (font-down)

; offset 05
Data_at8F69:
.byte $16, $FE, $02, $81, $16, $00, $00, $FE, $00

; offset 06
Data_at8F72:
.byte $16, $FF, $01, $C2, $00, $16, $FF, $00, $81, $FE, $00

; offset 07
Data_at8F7D:
.byte $16, $FE, $01, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 08
Data_at8F88:
.byte $16, $FF, $00, $C2, $00, $16, $FF, $01, $FE, $00

; offset 09 (straight front)
Data_at8F92:
.byte $16, $FF, $00, $FE, $00


; octant 2 (back-up)

; offset 0A
Data_at8F97:
.byte $16, $02, $FE, $81, $16, $00, $00, $FE, $00

; offset 0B
Data_at8FA0:
.byte $16, $01, $FF, $C2, $00, $16, $01, $00, $81, $FE, $00

; offset 0C
Data_at8FAB:
.byte $16, $02, $FF, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 0D
Data_at8FB6:
.byte $16, $01, $00, $C2, $00, $16, $01, $FF, $FE, $00

; offset 0E (straight back)
Data_at8FC0:
.byte $16, $01, $00, $FE, $00


; octant 0 (back-down)

; offset 0F
Data_at8FC5:
.byte $16, $02, $02, $81, $16, $00, $00, $FE, $00

; offset 10
Data_at8FCE:
.byte $16, $01, $01, $C2, $00, $16, $01, $00, $81, $FE, $00

; offset 11
Data_at8FD9:
.byte $16, $02, $01, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 12
Data_at8FE4:
.byte $16, $01, $00, $C2, $00, $16, $01, $01, $FE, $00

; offset 13 (straight back)
Data_at8FEE:
.byte $16, $01, $00, $FE, $00


; octant 7 (top-front)

; offset 14
Data_at8FF3:
.byte $16, $FE, $FE, $81, $16, $00, $00, $FE, $00

; offset 15
Data_at8FFC:
.byte $16, $FF, $FF, $C2, $00, $16, $00, $FF, $81, $FE, $00

; offset 16
Data_at9007:
.byte $16, $FF, $FE, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 17
Data_at9012:
.byte $16, $00, $FF, $C2, $00, $16, $FF, $FF, $FE, $00

; offset 18 (straight up)
Data_at901C:
.byte $16, $00, $FF, $FE, $00


; octant 3 (top-back)

; offset 19
Data_at9021:
.byte $16, $02, $FE, $81, $16, $00, $00, $FE, $00

; offset 1A
Data_at902A:
.byte $16, $01, $FF, $C2, $00, $16, $00, $FF, $81, $FE, $00

; offset 1B
Data_at9035:
.byte $16, $01, $FE, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 1C
Data_at9040:
.byte $16, $00, $FF, $C2, $00, $16, $01, $FF, $FE, $00


; offset 1D (straight up)
Data_at904A:
.byte $16, $00, $FF, $FE, $00


; octant 5 (bottom-front)

; offset 1E
Data_at904F:
.byte $16, $FE, $02, $81, $16, $00, $00, $FE, $00

; offset 1F
Data_at9058:
.byte $16, $FF, $01, $C2, $00, $16, $00, $01, $81, $FE, $00

; offset 20
Data_at9063:
.byte $16, $FF, $02, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 21
Data_at906E:
.byte $16, $00, $01, $C2, $00, $16, $FF, $01, $FE, $00

; offset 22 (straight down)
Data_at9078:
.byte $16, $00, $01, $FE, $00


; octant 1 (bottom-back)

; offset 23
Data_at907D:
.byte $16, $02, $02, $81, $16, $00, $00, $FE, $00

; offset 24
Data_at9086:
.byte $16, $01, $01, $C2, $00, $16, $00, $01, $81, $FE, $00

; offset 25
Data_at9091:
.byte $16, $01, $02, $81, $C4, $00, $16, $00, $00, $FE, $00

; offset 26
Data_at909C:
.byte $16, $00, $01, $C2, $00, $16, $01, $01, $FE, $00

; offset 27 (straight down)
Data_at90A6:
.byte $16, $00, $01, $FE, $00






Data_at90AB:
;.incbin "rom-prg/objects/data-block-XX90AB.bin"
.byte $3C, $00, $FD, $81, $3D, $00, $FE, $81, $FE, $00
;.res 10

Data_at90B5:
;.incbin "rom-prg/objects/data-block-XX90B5.bin"
.byte $3C, $FF, $FE, $81, $3D, $FF, $FE, $81, $FE, $00
;.res 10

Data_at90BF:
;.incbin "rom-prg/objects/data-block-XX90BF.bin"
.byte $3C, $FE, $FF, $81, $3D, $FE, $FF, $81, $FE, $00
;.res 10

Data_at90C9: ; Boss 1 Sparkles
;.incbin "rom-prg/objects/data-block-XX90C9.bin"
.byte $3D, $FD, $FE, $3C, $FD, $FF, $3D, $FD
.byte $FF, $3C, $FD, $00, $3D, $FD, $01, $3C
.byte $FD, $01, $3D, $FD, $02, $3C, $FD, $01
.byte $3D, $FE, $02, $3C, $FF, $03, $3D, $01
.byte $03, $3C, $02, $02, $3D, $03, $01, $3C
.byte $03, $FF, $3D, $02, $FE, $3C, $01, $FD
.byte $3D, $FF, $FD, $3C, $FE, $FE, $3D, $FD
.byte $FF, $FE, $00
;;.res 59

Data_at9104:
;.incbin "rom-prg/objects/data-block-XX9104.bin"
.byte $3C, $FE, $01, $81, $3D, $FE, $01, $81, $FE, $00
;.res 10

Data_at910E:
;.incbin "rom-prg/objects/data-block-XX910E.bin"
.byte $3C, $FF, $02, $81, $3D, $FF, $02, $81, $FE, $00
;.res 10

Data_at9118:
;.incbin "rom-prg/objects/data-block-XX9118.bin"
.byte $3C, $00, $03, $81, $3D, $00, $02, $81, $FE, $00
;.res 10

Data_at9122:
;.incbin "rom-prg/objects/data-block-XX9122.bin"
.byte $3E, $FD, $FF, $FE, $00, $FF
;.res 6

Data_at9128:
;.incbin "rom-prg/objects/data-block-XX9128.bin"
.byte $2C, $FC, $00, $2C, $FD, $00, $FE, $00, $FF
;.res 9

Data_at9131:
;.incbin "rom-prg/objects/data-block-XX9131.bin"
.byte $3F, $FD, $01, $FE, $00, $FF
;.res 6

Data_at9137:
;.incbin "rom-prg/objects/data-block-XX9137.bin"
.byte $17, $FE, $FE, $FE, $00, $FF
;.res 6

Data_at913D:
;.incbin "rom-prg/objects/data-block-XX913D.bin"
.byte $3E, $FD, $FF, $FE, $00, $FF
;.res 6

Data_at9143:
;.incbin "rom-prg/objects/data-block-XX9143.bin"
.byte $2C, $FD, $00, $2C, $FC, $00, $FE, $00, $FF
;.res 9

Data_at914C:
;.incbin "rom-prg/objects/data-block-XX914C.bin"
.byte $3F, $FD, $01, $FE, $00, $FF
;.res 6

Data_at9152:
;.incbin "rom-prg/objects/data-block-XX9152.bin"
.byte $17, $FE, $02, $FE, $00, $FF
;.res 6


; ==============================================
; Spiralling AMBER fanning out
; ==============================================

Data_at9158:
; Spiralling AMBER 60deg up
.byte $18, $FE, $FC, $17, $FE, $FD, $18, $FE
.byte $FD, $17, $FE, $FF, $18, $FE, $00, $17
.byte $FE, $00, $18, $FE, $01, $17, $FE, $00
.byte $18, $FF, $01, $17, $00, $02, $18, $00
.byte $02, $17, $01, $01, $18, $02, $00, $17
.byte $02, $FD, $18, $01, $FC, $17, $00, $FB
.byte $18, $00, $FB, $17, $FF, $FC, $18, $FE
.byte $FD, $FE, $00
;.res 59

Data_at9193:
; Spiralling AMBER 30deg up
.byte $18, $FD, $FC, $17, $FD, $FD, $18, $FD
.byte $FD, $17, $FD, $FF, $18, $FD, $01, $17
.byte $FD, $01, $18, $FD, $02, $17, $FD, $01
.byte $18, $FE, $02, $17, $FF, $03, $18, $01
.byte $03, $17, $02, $02, $18, $03, $01, $17
.byte $03, $FE, $18, $02, $FD, $17, $01, $FC
.byte $18, $FF, $FC, $17, $FD, $FC, $18, $FC
.byte $FD, $FE, $00
;.res 59

Data_at91CE:
; Spiralling AMBER straight ahead
.byte $18, $FD, $FE, $17, $FD, $FF, $18, $FD
.byte $FF, $17, $FD, $00, $18, $FD, $01, $17
.byte $FD, $01, $18, $FD, $02, $17, $FD, $01
.byte $18, $FD, $02, $17, $FE, $03, $18, $00
.byte $03, $17, $01, $02, $18, $02, $01, $17
.byte $02, $FF, $18, $01, $FE, $17, $00, $FD
.byte $18, $FE, $FD, $17, $FD, $FE, $18, $FC
.byte $FF, $FE, $00
;.res 59

Data_at9209:
; Spiralling AMBER 30deg up
.byte $18, $FD, $04, $17, $FD, $03, $18, $FD
.byte $03, $17, $FD, $01, $18, $FD, $FF, $17
.byte $FD, $FF, $18, $FD, $FE, $17, $FD, $FF
.byte $18, $FE, $FE, $17, $FF, $FD, $18, $01
.byte $FD, $17, $02, $FE, $18, $03, $FF, $17
.byte $03, $02, $18, $02, $03, $17, $01, $04
.byte $18, $FF, $04, $17, $FD, $04, $18, $FC
.byte $03, $FE, $00

Data_at9244:
; Spiralling AMBER 60deg up
.byte $18, $FE, $04, $17, $FE, $03, $18, $FE 
.byte $03, $17, $FE, $01, $18, $FE, $00, $17
.byte $FE, $00, $18, $FE, $FF, $17, $FE, $00
.byte $18, $FF, $FF, $17, $00, $FE, $18, $00
.byte $FE, $17, $01, $FF, $18, $02, $00, $17
.byte $02, $03, $18, $01, $04, $17, $00, $05
.byte $18, $00, $05, $17, $FF, $04, $18, $FE
.byte $03, $FE, $00
