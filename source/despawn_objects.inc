; index $00
.addr Data_at877D	; hit sprite when arrow hits enemy
.byte $00, $00, $00, $00, $00, $00 

; index $01
.addr Data_at8782
.byte $00, $00, $00, $00, $00, $00

; index $02
.addr Data_at878A	; puff of smoke when enemy dies
.byte $00, $00, $00, $00, $00, $00

; index $03
.addr Data_at8798
.byte $00, $00, $01, $01, $00, $02

; index $04
.addr Data_at87CF
.byte $00, $68, $0B, $0B, $28, $03 

; index $05
.addr Data_at87EA 
.byte $00, $68, $08, $08, $29, $03

; index $06
.addr Data_at8805
.byte $00, $68, $08, $08, $2A, $03

; index $07
.addr Data_at8820
.byte $00, $68, $08, $08, $2B, $03

; index $08
.addr Data_at883B
.byte $00, $00, $07, $07, $00, $04

; index $09
.addr Data_at88E0
.byte $00, $00, $07, $07, $00, $04

; index $0A
.addr Data_at8985
.byte $00, $00, $07, $07, $00, $04

; index $0B
.addr Data_at8A2A
.byte $00, $00, $07, $07, $00, $04

; index $0C
.addr Data_at8ACF
.byte $00, $E0, $10, $10, $2C, $03

; =================================

; index $00
Data_at877D:
.incbin "rom-prg/objects/data-block-at877D.bin"
;.res 5
;.byte $12, $00, $00, $82, $FF

; index $01
Data_at8782:
.incbin "rom-prg/objects/data-block-at8782.bin"
;.res 8
;.byte $12, $00, $00, $13, $00, $00, $83, $FF

; index $02
Data_at878A:
.incbin "rom-prg/objects/data-block-at878A.bin"
;.res 14

; index $03
Data_at8798:
.incbin "rom-prg/objects/data-block-at8798.bin"
;.res 55

; index $04
Data_at87CF:
.incbin "rom-prg/objects/data-block-at87CF.bin"
;.res 27

; index $05
Data_at87EA:
.incbin "rom-prg/objects/data-block-at87EA.bin"
;.res 27

; index $06
Data_at8805:
.incbin "rom-prg/objects/data-block-at8805.bin"
;.res 27

; index $07
Data_at8820:
.incbin "rom-prg/objects/data-block-at8820.bin"
;.res 27

; index $08
Data_at883B:
.incbin "rom-prg/objects/data-block-at883B.bin"
;.res 165

; index $09
Data_at88E0:
.incbin "rom-prg/objects/data-block-at88E0.bin"
;.res 165

; index $0A
Data_at8985:
.incbin "rom-prg/objects/data-block-at8985.bin"
;.res 165

; index $0B
Data_at8A2A:
.incbin "rom-prg/objects/data-block-at8A2A.bin"
;.res 165

; index $0C
Data_at8ACF:
.incbin "rom-prg/objects/data-block-at8ACF.bin"
;.res 27