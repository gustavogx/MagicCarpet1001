; Address book
.word DATA_ADDR_68, DATA_ADDR_69, DATA_ADDR_70, DATA_ADDR_71
.word DATA_ADDR_72, DATA_ADDR_73, DATA_ADDR_74, DATA_ADDR_73
.word DATA_ADDR_75, DATA_ADDR_76, DATA_ADDR_75, DATA_ADDR_77
.word DATA_ADDR_78, DATA_ADDR_79, DATA_ADDR_80

.word $ffff

DATA_ADDR_68: ; $acb8
.incbin "rom-prg/objects/data-object-atACB8.bin" ; 

DATA_ADDR_69: ; $ace1
.incbin "rom-prg/objects/data-object-atACE1.bin"

DATA_ADDR_70: ; $ad05
.incbin "rom-prg/objects/data-object-atAD05.bin"

DATA_ADDR_71: ; $ad29
.incbin "rom-prg/objects/data-object-atAD29.bin"

DATA_ADDR_72: ; $ad5c
.incbin "rom-prg/objects/data-object-atAD5C.bin"

DATA_ADDR_73: ; $ad83
.incbin "rom-prg/objects/data-object-atAD83.bin"

DATA_ADDR_74: ; $adcd
.incbin "rom-prg/objects/data-object-atADAC.bin"

DATA_ADDR_75: ; $add3
.incbin "rom-prg/objects/data-object-atADD3.bin"

DATA_ADDR_76: ; $ae25
.incbin "rom-prg/objects/data-object-atAE25.bin"

DATA_ADDR_77: ; $ae63
.incbin "rom-prg/objects/data-object-atAE63.bin"

DATA_ADDR_78: ; $ae85
.incbin "rom-prg/objects/data-object-atAE85.bin"

DATA_ADDR_79: ; $aea2
.incbin "rom-prg/objects/data-object-atAEA2.bin"

DATA_ADDR_80: ; $aebf
.incbin "rom-prg/objects/data-object-atAEBF.bin"