.addr Data_at9335	; Boss 1 Shooting
.addr Data_at933D	; Boss 2 Shooting
.addr Data_at9345	; Boss 3 Shooting
.addr Data_at934D	; Boss 4 Shooting

.define afWitchFlashing $29
.define afCrockShooting $2B
.define afSkullFlashing $23
.define afMouthOpening1 $37
.define afMouthOpening2 $38
.define afMouthOpening3 $39

;.define anTimer %10000000

Data_at9335: ; Boss 1 shoot animation (one frame)
.byte afWitchFlashing, $00, $00, anTimer+6
.byte afWitchFlashing, $00, $00
.byte $FF 

Data_at933D: ; Boss 2 shoot animation (one frame)
.byte afCrockShooting, $00, $00, anTimer+6
.byte afCrockShooting, $00, $00
.byte $FF 

Data_at9345: ; Boss 3 shoot animation (one frame)
.byte afSkullFlashing, $00, $00, anTimer+7
.byte afSkullFlashing, $00, $00
.byte $FF 

Data_at934D: ; Boss 4 shoot animation (five frames)
.byte afMouthOpening1, $00, $00, anTimer+3
.byte afMouthOpening2, $00, $00, anTimer+4
.byte afMouthOpening3, $00, $00, anTimer+12
.byte afMouthOpening2, $00, $00, anTimer+5
.byte afMouthOpening1, $00, $00, anTimer+6
.byte $FF

