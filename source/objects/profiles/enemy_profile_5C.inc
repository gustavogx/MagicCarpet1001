.byte $02					; Attack Points (collision with player)
.byte OBJPROP_CAN_COLLIDE+OBJPROP_IS_NOT_BOSS+OBJPROP_UNKNOWN2	; $70
.byte $08, $08				; Width, Height  (pixels)
.byte $02					; Health Points
.byte $1F					; ??? byte #6 of enemy profile
.byte SHOOT_SINGLE_BUBBLE	; Shot type
.byte $00, $08				; XY shooter offset
.byte $00					; ??? byte #10 of enemy profile
