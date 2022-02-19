; The offset used to read from this list, stored in var_58
; is the first byte in each file. 
; The address itself is stored in otherObjPtr_38
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
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF12:
.word Data_atB004
.incbin "rom-prg/objects/data-12bytes-atAF14.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF1E:
.word Data_atB03A
.incbin "rom-prg/objects/data-12bytes-atAF20.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF2A:
.word Data_atB070
.incbin "rom-prg/objects/data-12bytes-atAF2C.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF36:
.word Data_atB09A
.incbin "rom-prg/objects/data-12bytes-atAF38.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF42:
.word Data_atB0AD
.incbin "rom-prg/objects/data-12bytes-atAF44.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF4E:
.word Data_atB0BF
.incbin "rom-prg/objects/data-12bytes-atAF50.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF5A:
.word Data_atB123
.incbin "rom-prg/objects/data-12bytes-atAF5C.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF66:
.word Data_atB169
.incbin "rom-prg/objects/data-12bytes-atAF68.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF72:
.word Data_atB18F
.incbin "rom-prg/objects/data-12bytes-atAF74.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF7E:
.word Data_atB211
.incbin "rom-prg/objects/data-12bytes-atAF80.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF8A:
.word Data_atB247
.incbin "rom-prg/objects/data-12bytes-atAF8C.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

Data_atAF96:
.word Data_atB146
.incbin "rom-prg/objects/data-12bytes-atAF98.bin"
;.incbin "rom-prg/objects/data-12bytes-zero.bin"

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