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

; macro Flip
; Flips a single big flag
.macro Flip flag 
	eor #flag
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

; macro PushYX
; Pushes the registers Y and X, in this order, 
; on the top of the stack
.macro PushYX
	tya
	pha
	txa
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

; macro PullYX
; Pulls the registers Y and X, in reverse order, 
; from the top of the stack
.macro PullYX
	pla
	tax
	pla
	tay
.endmacro

.macro COPY16 source, destination
	lda #<source
	sta destination+0
	lda #>source
	sta destination+1
.endmacro

; Sound Engine Macros =====================

.macro PlaySoundOnce index
.if DISABLE_SOUND = 1
	lda index
	sta soundIndex_8D
	nop
	nop
	nop
.else
	lda index
	sta soundIndex_8D
	jsr PlaySoundOnce
.endif
.endmacro

.macro PlaySoundForever index
.if DISABLE_SOUND = 1
	lda index
	sta soundIndex_8D
	nop
	nop
	nop
.else
	lda index
	sta soundIndex_8D	
	jsr PlaySoundForever
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

.macro StartSoundEngine
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr StartSoundEngine
.endif
.endmacro

.macro ResetSoundEngine
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr ResetSoundEngine
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

