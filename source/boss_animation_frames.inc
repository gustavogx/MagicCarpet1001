.addr Data_at9335	; Boss 1 Shooting
.addr Data_at933D	; Boss 2 Shooting
.addr Data_at9345	; Boss 3 Shooting
.addr Data_at934D	; Boss 4 Shooting

Data_at9335: ; Boss 1 shoot animation (one frame)
.byte $29, $00, $00, $86, $29, $00, $00, $FF 

Data_at933D: ; Boss 2 shoot animation (one frame)
.byte $2B, $00, $00, $86, $2B, $00, $00, $FF 

Data_at9345: ; Boss 3 shoot animation (one frame)
.byte $23, $00, $00, $87, $23, $00, $00, $FF 

Data_at934D: ; Boss 4 shoot animation (five frames)
.byte $37, $00, $00, $83, $38, $00, $00, $84, $39, $00, $00, $8C, $38, $00, $00, $85, $37, $00, $00, $86, $FF

