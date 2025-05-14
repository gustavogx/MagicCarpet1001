.addr Data_at9335	; Boss 1 Shooting
.addr Data_at933D	; Boss 2 Shooting
.addr Data_at9345	; Boss 3 Shooting
.addr Data_at934D	; Boss 4 Shooting



;.define acTIMER %10000000

Data_at9335: ; Boss 1 shoot animation (one frame)
.byte afWITCHFLASHING, $00, $00, acTIMER+6
.byte afWITCHFLASHING, $00, $00
.byte acEND

Data_at933D: ; Boss 2 shoot animation (one frame)
.byte afCROCSHOOTING, $00, $00, acTIMER+6
.byte afCROCSHOOTING, $00, $00
.byte acEND

Data_at9345: ; Boss 3 shoot animation (one frame)
.byte afSKULLFLASHING, $00, $00, acTIMER+7
.byte afSKULLFLASHING, $00, $00
.byte acEND

Data_at934D: ; Boss 4 shoot animation (five frames)
.byte afMOUTHOPENING1, $00, $00, acTIMER+3
.byte afMOUTHOPENING2, $00, $00, acTIMER+4
.byte afMOUTHOPENING3, $00, $00, acTIMER+12
.byte afMOUTHOPENING2, $00, $00, acTIMER+5
.byte afMOUTHOPENING1, $00, $00, acTIMER+6
.byte acEND

