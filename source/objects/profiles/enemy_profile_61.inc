.byte $03					; Attack Points (collision with player)
.byte OBJPROP_CAN_COLLIDE+OBJPROP_IS_NOT_BOSS+OBJPROP_UNKNOWN2	; $70
.byte $10, $10				; Width, Height  (pixels)
.byte $03					; Health Points
.byte $36					; ??? byte #6 of enemy profile
.byte SHOOT_EIGHT_BUBBLES	; Shot type
.byte $00, $08				; XY shooter offset
.byte $14					; ??? byte #10 of enemy profile
