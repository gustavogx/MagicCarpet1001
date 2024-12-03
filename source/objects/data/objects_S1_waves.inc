; This file contains all 13 enemy waves in Stage 1

; Address book
.word WAVE_S1_01, WAVE_S1_02, WAVE_S1_03, WAVE_S1_04
.word WAVE_S1_05, WAVE_S1_06, WAVE_S1_07, WAVE_S1_06
.word WAVE_S1_08, WAVE_S1_09, WAVE_S1_08, WAVE_S1_10
.word WAVE_S1_11, WAVE_S1_12, WAVE_S1_13

.word $ffff ; termination value for loading enemy waves

WAVE_S1_01: ; $acb8
.incbin "objects/data/waves1/enemy-wave-atACB8.bin" 

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
.incbin "objects/data/waves1/enemy-wave-atAE85.bin"

WAVE_S1_12: ; $aea2
.incbin "objects/data/waves1/enemy-wave-atAEA2.bin"

WAVE_S1_13: ; $aebf
.incbin "objects/data/waves1/enemy-wave-atAEBF.bin"