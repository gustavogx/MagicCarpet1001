.byte $02					; Attack Points (collision with player)
.byte OBJPROP_CAN_COLLIDE+OBJPROP_IS_NOT_BOSS+OBJPROP_UNKNOWN2	; $70
.byte $10, $0E				; Width, Height  (pixels)
.byte $02					; Health Points
.byte $1F					; ??? byte #6 of enemy profile
.byte SHOOT_EIGHT_BUBBLES	; Shot type
.byte $00, $08				; XY shooter offset
.byte $1C					; ??? byte #10 of enemy profile
