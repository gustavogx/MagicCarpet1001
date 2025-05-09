; This file contains all 13 enemy waves in Stage 1

; Address book
.word WAVE_S1_01, WAVE_S1_02, WAVE_S1_03, WAVE_S1_04
.word WAVE_S1_05, WAVE_S1_06, WAVE_S1_07, WAVE_S1_06
.word WAVE_S1_08, WAVE_S1_09, WAVE_S1_08, WAVE_S1_10
.word WAVE_S1_11, WAVE_S1_12, WAVE_S1_13

.word $ffff ; termination value for loading enemy waves

WAVE_S1_01: ; $acb8
;.incbin "objects/data/waves1/enemy-wave-atACB8.bin" 
.byte $00, $3C, $01, $BE, $00 ; Enemy Stage index, XLo, XHi, YLo, YHi
.byte $01, $0A, $01, $64, $00
.byte $02, $00, $01, $46, $00
.byte $0A, $64, $01, $78, $00
.byte $0B, $5A, $01, $96, $00
.byte $03, $6E, $01, $78, $00
.byte $03, $60, $01, $64, $00
.byte $03, $78, $01, $5A, $00
.byte wvEND

WAVE_S1_02: ; $ace1
.incbin "objects/data/waves1/enemy-wave-atACE1.bin"

WAVE_S1_03: ; $ad05
.incbin "objects/data/waves1/enemy-wave-atAD05.bin"

WAVE_S1_04: ; $ad29
.incbin "objects/data/waves1/enemy-wave-atAD29.bin"

WAVE_S1_05: ; $ad5c
.incbin "objects/data/waves1/enemy-wave-atAD5C.bin"

WAVE_S1_06: ; $ad83
.incbin "objects/data/waves1/enemy-wave-atAD83.bin"

WAVE_S1_07: ; $adcd
.incbin "objects/data/waves1/enemy-wave-atADAC.bin"

WAVE_S1_08: ; $add3
.incbin "objects/data/waves1/enemy-wave-atADD3.bin"

WAVE_S1_09: ; $ae25
.incbin "objects/data/waves1/enemy-wave-atAE25.bin"

WAVE_S1_10: ; $ae63
.incbin "objects/data/waves1/enemy-wave-atAE63.bin"

WAVE_S1_11: ; $ae85
;.incbin "objects/data/waves1/enemy-wave-atAE85.bin"
.byte wvSET2ENEMIES, 5			; enemy set (drops), set size
.byte $04, $5A, $01, $4B, $01   ; enemy stage index,   XLo,    XHi,    YLo,    YHi
.byte $04, $3C, $01, $2D, $01
.byte $04, $1E, $01, $0F, $01
.byte $04, $FF, $00, $F0, $00
.byte $04, $E1, $00, $D2, $00
.byte wvControl0, wvEND

WAVE_S1_12: ; $aea2
.incbin "objects/data/waves1/enemy-wave-atAEA2.bin"

WAVE_S1_13: ; $aebf
.incbin "objects/data/waves1/enemy-wave-atAEBF.bin"