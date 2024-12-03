; This file contains all 14 enemy waves in Stage 2

; Address book
.word WAVE_S2_01, WAVE_S2_02, WAVE_S2_03, WAVE_S2_04, WAVE_S2_05 
.word WAVE_S2_02, WAVE_S2_06, WAVE_S2_07, WAVE_S2_08, WAVE_S2_03
.word WAVE_S2_04, WAVE_S2_09, WAVE_S2_10, WAVE_S2_11, WAVE_S2_12 

.word $ffff

WAVE_S2_01: ; $b90d
.incbin "objects/data/stage2/data-block-atB90D.bin"

WAVE_S2_02: ; $b936
.incbin "objects/data/stage2/data-block-atB936.bin"

WAVE_S2_03: ; $b95a
.incbin "objects/data/stage2/data-block-atB95A.bin"

WAVE_S2_05: ; $b986
.incbin "objects/data/stage2/data-block-atB986.bin"

WAVE_S2_06: ; $b9b2
.incbin "objects/data/stage2/data-block-atB9B2.bin"

WAVE_S2_07: ; $b9f2
.incbin "objects/data/stage2/data-block-atB9F2.bin"

WAVE_S2_08: ; $ba1b
.incbin "objects/data/stage2/data-block-atBA1B.bin"

WAVE_S2_09: ; $ba5b
.incbin "objects/data/stage2/data-block-atBA5B.bin"

WAVE_S2_04: ; $ba87
.incbin "objects/data/stage2/data-block-atBA87.bin"

WAVE_S2_10: ; $bab5
.incbin "objects/data/stage2/data-block-atBAB5.bin"

WAVE_S2_11: ; $baeb
.incbin "objects/data/stage2/data-block-atBAEB.bin"

WAVE_S2_12: ; $bb56
.incbin "objects/data/stage2/data-block-atBB56.bin"