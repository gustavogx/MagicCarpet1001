; Address book
.word DATA_S1_01, DATA_S1_02, DATA_S1_03, DATA_S1_04
.word DATA_S1_05, DATA_S1_06, DATA_S1_07, DATA_S1_06
.word DATA_S1_08, DATA_S1_09, DATA_S1_08, DATA_S1_10
.word DATA_S1_11, DATA_S1_12, DATA_S1_13

.word $ffff

DATA_S1_01: ; $acb8
.incbin "rom-prg/objects/data-object-atACB8.bin" ; 

DATA_S1_02: ; $ace1
.incbin "rom-prg/objects/data-object-atACE1.bin"

DATA_S1_03: ; $ad05
.incbin "rom-prg/objects/data-object-atAD05.bin"

DATA_S1_04: ; $ad29
.incbin "rom-prg/objects/data-object-atAD29.bin"

DATA_S1_05: ; $ad5c
.incbin "rom-prg/objects/data-object-atAD5C.bin"

DATA_S1_06: ; $ad83
.incbin "rom-prg/objects/data-object-atAD83.bin"

DATA_S1_07: ; $adcd
.incbin "rom-prg/objects/data-object-atADAC.bin"

DATA_S1_08: ; $add3
.incbin "rom-prg/objects/data-object-atADD3.bin"

DATA_S1_09: ; $ae25
.incbin "rom-prg/objects/data-object-atAE25.bin"

DATA_S1_10: ; $ae63
.incbin "rom-prg/objects/data-object-atAE63.bin"

DATA_S1_11: ; $ae85
.incbin "rom-prg/objects/data-object-atAE85.bin"

DATA_S1_12: ; $aea2
.incbin "rom-prg/objects/data-object-atAEA2.bin"

DATA_S1_13: ; $aebf
.incbin "rom-prg/objects/data-object-atAEBF.bin"