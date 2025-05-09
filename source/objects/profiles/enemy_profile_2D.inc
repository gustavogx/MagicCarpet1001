.byte $03					; Attack Points (collision with player)
.byte OBJPROP_CAN_COLLIDE+OBJPROP_IS_NOT_BOSS+OBJPROP_UNKNOWN2	; $70
.byte $10, $15				; Width, Height  (pixels)
.byte $03					; Health Points
.byte $1F					; ??? byte #6 of enemy profile
.byte SHOOT_SINGLE_BUBBLE	; Shot type
.byte $00, $0A				; XY shooter offset
.byte $2E					; ??? byte #10 of enemy profile
