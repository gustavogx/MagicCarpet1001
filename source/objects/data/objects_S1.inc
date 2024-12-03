; Address book
.word DATA_S1_01, DATA_S1_02, DATA_S1_03, DATA_S1_04
.word DATA_S1_05, DATA_S1_06, DATA_S1_07, DATA_S1_06
.word DATA_S1_08, DATA_S1_09, DATA_S1_08, DATA_S1_10
.word DATA_S1_11, DATA_S1_12, DATA_S1_13

.word $ffff

DATA_S1_01: ; $acb8
.incbin "objects/data/stage1/data-object-atACB8.bin" 

DATA_S1_02: ; $ace1
.incbin "objects/data/stage1/data-object-atACE1.bin"

DATA_S1_03: ; $ad05
.incbin "objects/data/stage1/data-object-atAD05.bin"

DATA_S1_04: ; $ad29
.incbin "objects/data/stage1/data-object-atAD29.bin"

DATA_S1_05: ; $ad5c
.incbin "objects/data/stage1/data-object-atAD5C.bin"

DATA_S1_06: ; $ad83
.incbin "objects/data/stage1/data-object-atAD83.bin"

DATA_S1_07: ; $adcd
.incbin "objects/data/stage1/data-object-atADAC.bin"

DATA_S1_08: ; $add3
.incbin "objects/data/stage1/data-object-atADD3.bin"

DATA_S1_09: ; $ae25
.incbin "objects/data/stage1/data-object-atAE25.bin"

DATA_S1_10: ; $ae63
.incbin "objects/data/stage1/data-object-atAE63.bin"

DATA_S1_11: ; $ae85
.incbin "objects/data/stage1/data-object-atAE85.bin"

DATA_S1_12: ; $aea2
.incbin "objects/data/stage1/data-object-atAEA2.bin"

DATA_S1_13: ; $aebf
.incbin "objects/data/stage1/data-object-atAEBF.bin"