.byte $03					; Attack Points (collision with player)
.byte OBJPROP_CAN_COLLIDE+OBJPROP_IS_NOT_BOSS+OBJPROP_UNKNOWN2	; $70
.byte $16, $15				; Width, Height  (pixels)
.byte $04					; Health Points
.byte $32					; ??? byte #6 of enemy profile
.byte SHOOT_5_BUBBLES		; Shot type
.byte $00, $0A				; XY shooter offset
.byte $07					; ??? byte #10 of enemy profile
