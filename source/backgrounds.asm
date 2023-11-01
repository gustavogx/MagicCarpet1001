
.addr Data_TitleScreen 	;$e85f
.addr Data_TitleScreen 	;$e85f
.addr Data_Stage01_A	;$e882
.addr Data_Stage01_B	;$e895
.addr Data_Stage02_A	;$e8ee
.addr Data_Stage02_B	;$e901
.addr Data_Stage03_A	;$e8b8
.addr Data_Stage03_B	;$e8cb
.addr Data_Stage04_A	;$e924
.addr Data_Stage04_B	;$e937
.addr Data_Ending 		;$e95a
.addr Data_BlankScreen 	;$e97d

;; ============ Title Screen =============
Data_TitleScreen:
	.addr NameTable_TitleScreen ;$e9b3
	.byte PaletteOBJ_TitleScreen - Data_TitleScreen
	
	PaletteBG_TitleScreen:
	.incbin "rom-prg/stages/TitleScreen_BPL.bin"

	PaletteOBJ_TitleScreen:
	.incbin "rom-prg/stages/TitleScreen_OPL.bin"

;; ============== Stage 01 ===============
Data_Stage01_A:
	.addr NameTable_Stage01_A ;$eb30
	.byte PaletteOBJ_Stage01 - Data_Stage01_A
	
	PaletteBG_Stage01_A:
	.incbin "rom-prg/stages/Stage01_A_BPL.bin"

Data_Stage01_B:
	.addr NameTable_Stage01_B ;$ed8a
	.byte PaletteOBJ_Stage01 - Data_Stage01_B

	PaletteBG_Stage01_B:
	.incbin "rom-prg/stages/Stage01_B_BPL.bin"

	PaletteOBJ_Stage01:
	.incbin "rom-prg/stages/Stage01_OPL.bin"

;; ============== Stage 03 ===============
Data_Stage03_A: ; $68b8
	.addr NameTable_Stage03_A ;$efc8
	.byte PaletteOBJ_Stage03 - Data_Stage03_A
	
	PaletteBG_Stage03_A:
	.incbin "rom-prg/stages/Stage03_A_BPL.bin"

Data_Stage03_B:
	.addr NameTable_Stage03_B ;$f1f9
	.byte PaletteOBJ_Stage03 - Data_Stage03_B

	PaletteBG_Stage03_B:
	.incbin "rom-prg/stages/Stage03_B_BPL.bin"

	PaletteOBJ_Stage03:
	.incbin "rom-prg/stages/Stage03_OPL.bin"

;; ============== Stage 02 ===============
Data_Stage02_A:
	.addr NameTable_Stage02_A ;$f3f0
	.byte PaletteOBJ_Stage02 - Data_Stage02_A
	
	PaletteBG_Stage02_A:
	.incbin "rom-prg/stages/Stage02_A_BPL.bin"

Data_Stage02_B:
	.addr NameTable_Stage02_B ;$f65a
	.byte PaletteOBJ_Stage02 - Data_Stage02_B
	
	PaletteBG_Stage02_B:
	.incbin "rom-prg/stages/Stage02_B_BPL.bin"

	PaletteOBJ_Stage02:
	.incbin "rom-prg/stages/Stage02_OPL.bin"

;; ============== Stage 04 ===============
Data_Stage04_A:
	.addr NameTable_Stage04_A ;$f8ee
	.byte PaletteOBJ_Stage04 - Data_Stage04_A

	PaletteBG_Stage04_A:
	.incbin "rom-prg/stages/Stage04_A_BPL.bin"

Data_Stage04_B:
	.addr NameTable_Stage04_B ;$fad0
	.byte PaletteOBJ_Stage04 - Data_Stage04_B

	PaletteBG_Stage04_B:
	.incbin "rom-prg/stages/Stage04_B_BPL.bin"

	PaletteOBJ_Stage04:
	.incbin "rom-prg/stages/Stage04_OPL.bin"

;; ============== Ending ===============
Data_Ending:
	.addr NameTable_Ending ;$fcb7
	.byte PaletteOBJ_Ending - Data_Ending

	PaletteBG_Ending:
	.incbin "rom-prg/stages/Ending_BPL.bin"

	PaletteOBJ_Ending:
	.incbin "rom-prg/stages/Ending_OPL.bin"

Data_BlankScreen: 
	.addr NameTable_Blank ;$e9a0
	.byte PaletteOBJ_BlankScreen - Data_BlankScreen
	
	PaletteBG_BlankScreen:
	.incbin "rom-prg/stages/BlankScreen_BPL.bin"

	PaletteOBJ_BlankScreen:
	.incbin "rom-prg/stages/BlankScreen_OPL.bin"


;; ============ Nametables =============
NameTable_Blank:
.incbin "rom-prg/stages/BlankScreen_NT.bin"
.incbin "rom-prg/stages/BlankScreen_AT.bin"

NameTable_TitleScreen:
.incbin "rom-prg/stages/TitleScreen_RLE.nam"
;.incbin "rom-prg/stages/TitleScreen_NT.bin"
;.incbin "rom-prg/stages/TitleScreen_AT.bin"

NameTable_Stage01_A:
.incbin "rom-prg/stages/Stage01_A_RLE.nam"
;.incbin "rom-prg/stages/Stage01_A_NT.bin"
;.incbin "rom-prg/stages/Stage01_A_AT.bin"

NameTable_Stage01_B:
.incbin "rom-prg/stages/Stage01_B_RLE.nam"
;.incbin "rom-prg/stages/Stage01_B_NT.bin"
;.incbin "rom-prg/stages/Stage01_B_AT.bin"

NameTable_Stage03_A:
.incbin "rom-prg/stages/Stage03_A_RLE.nam"
;.incbin "rom-prg/stages/Stage03_A_NT.bin"
;.incbin "rom-prg/stages/Stage03_A_AT.bin"

NameTable_Stage03_B:
.incbin "rom-prg/stages/Stage03_B_RLE.nam"
;.incbin "rom-prg/stages/Stage03_B_NT.bin"
;.incbin "rom-prg/stages/Stage03_B_AT.bin"

NameTable_Stage02_A:
.incbin "rom-prg/stages/Stage02_A_RLE.nam"
;.incbin "rom-prg/stages/Stage02_A_NT.bin"
;.incbin "rom-prg/stages/Stage02_A_AT.bin"

NameTable_Stage02_B:
.incbin "rom-prg/stages/Stage02_B_RLE.nam"
;.incbin "rom-prg/stages/Stage02_B_NT.bin"
;.incbin "rom-prg/stages/Stage02_B_AT.bin"

NameTable_Stage04_A:
.incbin "rom-prg/stages/Stage04_A_RLE.nam"
;.incbin "rom-prg/stages/Stage04_A_NT.bin"
;.incbin "rom-prg/stages/Stage04_A_AT.bin"

NameTable_Stage04_B:
.incbin "rom-prg/stages/Stage04_B_RLE.nam"
;.incbin "rom-prg/stages/Stage04_B_NT.bin"
;.incbin "rom-prg/stages/Stage04_B_AT.bin"

NameTable_Ending:
.incbin "rom-prg/stages/Ending_RLE.nam"
;.incbin "rom-prg/stages/Ending_NT.bin"
;.incbin "rom-prg/stages/Ending_AT.bin"