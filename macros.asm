; macro GetObjectsIndexTable_Y
; Read the current stage index from currentStage_15
; Calculates the correct index on the object data file:
; Y(index) = (stage-1)*4
; Clobbers A and Y
.macro GetObjectsIndexTable_Y
	ldy currentStage_15
	dey
	tya
	asl A
	asl A
	tay
.endmacro

; macro Copy
; Copy data from <source> to <destination>
; Starts at an offset <begin> from <source>
; Ends at an offset <end> from <source>
; Clobbers A and Y
.macro Copy source,destination,begin,end
	ldy begin
:
	lda source,y
	sta destination,y
	iny
	cpy end
	bne :-
.endmacro

; macro Add16
; 16-bit addition
; Adds <value> to <address> and store the result at <address>
.macro Add16 address, value
	lda address+1
	clc
	adc value
	sta address+1
	lda address+0
	adc #$00
	sta address+0
.endmacro

; macro TurnOFF
; Turns OFF a given flag
.macro TurnOFF flag
	and #(ALL1-flag)
.endmacro

; macro TurnON
; Turns off a given flag
.macro TurnON flag
	ora #flag
.endmacro

; macro PushAXY
; Pushes the registers A, X and Y, in this order, 
; on the top of the stack
.macro PushAXY
	pha
	txa
	pha
	tya
	pha
.endmacro

; macro PullAXY
; Pulls the registers A, X and Y, in reverse order, 
; from the top of the stack
.macro PullAXY
	pla
	tay
	pla
	tax
	pla
.endmacro

; macro PushXY
; Pushes the registers X and Y, in this order, 
; on the top of the stack
.macro PushXY
	txa
	pha
	tya
	pha
.endmacro

; macro PullXY
; Pulls the registers X and Y, in reverse order, 
; from the top of the stack
.macro PullXY
	pla
	tay
	pla
	tax
.endmacro

; macro SpawnMultipleProjectiles
; Spawn a given number of projectiles
; from give address, using call
.macro SpawnMultipleProjectiles address, number
	txa
	tay
	ldx #$00
	
	:
		lda address,X
		sta projectileIndex_4A
		jsr HandleSpawnProjectile_Y
		inx
		cpx #number
		bne :-
.endmacro

; Sound Engine Macros =====================

.macro PlayThisSFX index
.if DISABLE_SOUND = 1
	lda index
	sta soundIndex_8D
	nop
	nop
	nop
.else
	lda index
	sta soundIndex_8D
	jsr PlaySFX
.endif
.endmacro

.macro PlayThisSong index
.if DISABLE_SOUND = 1
	lda index
	sta soundIndex_8D
	nop
	nop
	nop
.else
	lda index
	sta soundIndex_8D	
	jsr PlaySong
.endif
.endmacro

.macro StopPlaying
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr TurnSoundOff
.endif
.endmacro

.macro ResetSound
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr ResetSoundEngine
.endif
.endmacro

.macro UpdateSound
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr DoSomethingWithSound
.endif
.endmacro

.macro UpdateSoundDuringVBlank
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr UpdateSoundAtVBlank
.endif
.endmacro

.macro WaitUntilSoundFinishes
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr WaitUntilSoundFinished
.endif
.endmacro

