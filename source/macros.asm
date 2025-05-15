.macro GAMEENGINE_OBJECTS_INDEX_rY
	; Read the current stage index from currentStage_15
	; Calculates the correct index on the object data file:
	; Y(index) = (stage-1)*4
	; Clobbers A and Y

	ldy currentStage_15
	dey
	tya
	asl A
	asl A
	tay
.endmacro

.macro GAMEENGINE_INITIALIZE_MAPPER
	; Initialize the mapper
	; This macro sets the initial bank for the game
	lda BankSwitching_FFF0	; Loads #$00 from ROM filling (dangerous!)
	sta BankSwitching_FFF0  ; Set mapper to Bank0
.endmacro

.macro GAMEENGINE_BANKSWITCH bank, offset
	.ifblank offset
		lda bank
	.else
		lda bank, offset
	.endif
	tax
	sta BankSwitching_FFF0,X
.endmacro

.macro GAMEENGINE_PPU_WARMUP
	; PPU Warm up
	ldx #$10 ; Wait 16 cycles for PPU to reach its stable state
	:
		lda PpuStatus_2002
		dex
		bne :-
.endmacro

.macro GAMEENGINE_DMA page
	lda #$00
	sta OamAddr_2003		; reset DMA pointer to begining of OAM
	lda page				; setup page number of OAM mirror in RAM
	sta SpriteDma_4014		; trigger sprite DMA from RAM to OAM
.endmacro

; macro TurnOFF
; Turns OFF a given flag
.macro TURNOFF flag
	and #(FULL-flag)
.endmacro

; macro TurnON
; Turns off a given flag
.macro TURNON flag
	ora #flag
.endmacro

; macro Flip
; Flips a single big flag
.macro Flip flag
	eor #flag
.endmacro

.macro DIV8 variable
; Divides value or accumulator by 8
	lsr variable
	lsr variable
	lsr variable
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

; macro AddByte2Word_A_X
; Adds a byte to a word, using X as index
; For optimization purpuses, the byte needs to start in A
.macro AddByte2Word_A_X byte, wordLo, wordHi, tempLo, tempHi, work
		bpl :+

		lda #$FF
		bne :++

	:
		lda #$00

	:
		sta work
		lda byte
		clc
		adc wordLo,X
		sta wordLo,X
		sta tempLo

		lda work
		adc wordHi,X
		sta wordHi,X
		sta tempHi
.endmacro

; Game Engine Macros =====================

; macro COPY_DATA
; COPY_DATA data from <source> to <destination>
; Starts at an offset <begin> from <source>
; Ends at an offset <end> from <source>
; Clobbers A and Y
.macro COPY_DATA source, destination, begin, end
	ldy begin
:
	lda source,y
	sta destination,y
	iny
	cpy end
	bne :-
.endmacro

.macro ADDRESS_TO_RAM source, destination
	lda #<source
	sta destination+0
	lda #>source
	sta destination+1
.endmacro

.macro COPY_WORD_Y addressOrigin, addressDestination
	lda addressOrigin+0,Y
	sta addressDestination+0
	lda addressOrigin+1,Y
	sta addressDestination+1
.endmacro

.macro COPY_WORD_X addressOrigin, addressDestination
	lda addressOrigin+0,X
	sta addressDestination+0
	lda addressOrigin+1,X
	sta addressDestination+1
.endmacro

.macro SCROLL_XY scrollX, scrollY
	lda scrollX
	sta PpuScroll_2005
	lda scrollY
	sta PpuScroll_2005
.endmacro

.macro RESET_SCROLLING
	lda #$00
	sta PpuScroll_2005
	sta PpuScroll_2005
.endmacro

; Sound Engine Macros =====================
.macro SOUNDENGINE_PLAY_ONCE index
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

.macro SOUNDENGINE_PLAY_FOREVER index
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

.macro SOUNDENGINE_STOP
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr TurnSoundOff
.endif
.endmacro

.macro SOUNDENGINE_START
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr StartSoundEngine
.endif
.endmacro

.macro SOUNDENGINE_RESET
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr ResetSoundEngine
.endif
.endmacro

.macro SOUNDENGINE_UPDATE_DURING_VBLANK
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr UpdateSoundAtVBlank
.endif
.endmacro

.macro SOUNDENGINE_WAIT_SOUND_FINISHES
.if DISABLE_SOUND = 1
	nop
	nop
	nop
.else
	jsr WaitUntilSoundFinished
.endif
.endmacro

