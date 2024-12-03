
.word DATA_S2_01, DATA_S2_02, DATA_S2_03, DATA_S2_04, DATA_S2_05 
.word DATA_S2_02, DATA_S2_06, DATA_S2_07, DATA_S2_08, DATA_S2_03
.word DATA_S2_04, DATA_S2_09, DATA_S2_10, DATA_S2_11, DATA_S2_12 

.word $ffff

DATA_S2_01: ; $b90d
.incbin "objects/data/stage2/data-block-atB90D.bin"

DATA_S2_02: ; $b936
.incbin "objects/data/stage2/data-block-atB936.bin"

DATA_S2_03: ; $b95a
.incbin "objects/data/stage2/data-block-atB95A.bin"

DATA_S2_05: ; $b986
.incbin "objects/data/stage2/data-block-atB986.bin"

DATA_S2_06: ; $b9b2
.incbin "objects/data/stage2/data-block-atB9B2.bin"

DATA_S2_07: ; $b9f2
.incbin "objects/data/stage2/data-block-atB9F2.bin"

DATA_S2_08: ; $ba1b
.incbin "objects/data/stage2/data-block-atBA1B.bin"

DATA_S2_09: ; $ba5b
.incbin "objects/data/stage2/data-block-atBA5B.bin"

DATA_S2_04: ; $ba87
.incbin "objects/data/stage2/data-block-atBA87.bin"

DATA_S2_10: ; $bab5
.incbin "objects/data/stage2/data-block-atBAB5.bin"

DATA_S2_11: ; $baeb
.incbin "objects/data/stage2/data-block-atBAEB.bin"

DATA_S2_12: ; $bb56
.incbin "objects/data/stage2/data-block-atBB56.bin"