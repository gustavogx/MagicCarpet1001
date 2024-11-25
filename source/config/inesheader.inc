.define PRG_ROM_BANKS 2 ; * 16KB PRG ROM
.define CHR_ROM_BANKS 4 ; * 8KB CHR ROM
.define iNES_MAPPER 3   ; Mapper 003
.define MIRRORING   1   ; 0 Horizontal, 1 Vertical

Flags6 = iNES_MAPPER << 4 + MIRRORING

.byte "NES"
.byte $1a
.byte PRG_ROM_BANKS 
.byte CHR_ROM_BANKS 
.byte Flags6 
.byte $00
.byte $00
.byte $00
.byte $00
.byte $00, $00, $00, $00, $00 ; filler bytes