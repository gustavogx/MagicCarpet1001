.define PLS1 	BIT0
.define PLS2 	BIT1
.define TRI 	BIT2
.define DMC 	BIT3

; $9815
.proc UpdateSoundAtVBlank
	lda flagUpdateSoundAtVBlank_8E  
	beq :+
	jmp doneWithSoundEngine
	:

	ldx #$00 
	lda #$01 
	sta $8C
	
	ReplaceMeLabel_S5: 
	txa
	pha
	lda $8C  
	and flagSound_70 
	bne :+
	jmp skipToThis_1	
	:

	lda $72,X
	beq :+
	dec $72,X
	jmp skipToThis_1	
	:

	txa
	asl A    
	tax
	
	ReplaceMeLabel_S1:
	lda ($7A,X)
	and #$80 
	bne skipToThis_2
	txa
	pha
	lda ($7A,X)
	asl A    
	tay
	jsr SquareWave0
	pla
	tax
	lsr A    
	tay
	jsr UnknownSub4
	txa
	pha
	tya
	tax
	ldy #$01 
	lda ($8A),Y
	tay
	dey
	tya
	sta $72,X
	pla
	tax
	lda #$02 
	jsr UnknownSub3
	jmp skipToThis_1

	skipToThis_2:
	lda ($7A,X)
	cmp #$80 
	bne :+
	jsr UnknownSub4
	txa
	pha
	ldy #$01 
	lda ($8A),Y
	asl A    
	tay
	jsr SquareWave0_1
	pla
	tax
	lda #$02 
	jsr UnknownSub3
	jmp ReplaceMeLabel_S1

	:
	lda ($7A,X)
	
	Compare89:
	cmp #$89 
	bne Compare81
	
	jsr UnknownSub4
	txa
	pha
	ldy #$01 
	lda ($8A),Y
	asl A    
	tay
	jsr SquareWave0_2
	pla
	tax
	lda #$02 
	jsr UnknownSub3
	jmp ReplaceMeLabel_S1

	Compare81:
	cmp #$81 
	bne Compare82

	txa
	tay
	lsr A    
	jsr UnknownSoundSub
	tya
	tax
	lsr A    
	tay
	jsr UnknownSub4
	tya
	tax
	ldy #$01 
	lda ($8A),Y
	tay
	dey
	tya
	sta $72,X
	txa
	asl A    
	tax
	lda #$02 
	jsr UnknownSub3
	jmp skipToThis_1
	
	Compare82:
	cmp #$82 
	bne Compare83
	txa
	lsr A    
	tay
	jsr UnknownSub4
	tya
	tax
	ldy #$01 
	lda ($8A),Y
	tay
	dey
	tya
	sta $72,X
	txa
	asl A    
	tax
	lda #$02 
	jsr UnknownSub3
	jmp skipToThis_1

	Compare83:
	cmp #$83 
	bne Compare86
	txa
	pha
	lsr A    
	jsr UpdateAPUStatus
	pla
	tax
	lda #$01 
	jsr UnknownSub3
	jmp ReplaceMeLabel_S1

	Compare86:
	cmp #$86 
	bne Compare84
	txa
	cmp #$07 
	bcs ReplaceMeLabel_S2
	lda #$F0 
	and flagSound_70 
	sta flagSound_70 
	ldy #$00

	loop_S1:
		lda $0098,Y
		and #$F6 
		sta Sq0Duty_4000,Y
		lda $009C,Y
		sta Sq1Duty_4004,Y
		lda $00A0,Y
		sta TrgLinear_4008,Y     
		lda $00A4,Y
		sta NoiseVolume_400C,Y   
		iny
		cpy #$02 
		bne loop_S1

	lda #$F0 
	and flagSound_70 
	bne :+
	
	lda #ZERO
	sta ApuStatus_4015
	sta flagAPUStatus_C9

	jmp skipToThis_1

	:
	lda flagAPUStatus_C9  
	sta ApuStatus_4015
	jmp skipToThis_1

	ReplaceMeLabel_S2:
	lda $B8,X
	sta $7A,X
	lda $B9,X
	sta $7B,X
	jmp ReplaceMeLabel_S1

	Compare84:
	cmp #$84 
	bne Compare85

	txa
	tay
	lsr A    
	tax
	lda $90,X
	cmp #$00 
	bne ReplaceMeLabel_S3
	lda #$FF 
	sta $90,X
	tya
	tax
	lda #$04 
	jsr UnknownSub3
	jmp ReplaceMeLabel_S1

	ReplaceMeLabel_S3:
	tya
	tax
	lsr A    
	tay
	jsr UnknownSub4
	lda $0090,Y
	cmp #$FF 
	bne ReplaceMeLabel_S4
	tya
	tax
	ldy #$01 
	lda ($8A),Y
	sta $90,X
	txa
	asl A    
	tax
	lda $8A  
	sta $A8,X
	lda $8B  
	sta $A9,X
	
	ReplaceMeLabel_S4:
	txa
	lsr A    
	tax
	dec $90,X
	txa
	asl A    
	tax
	ldy #$02 
	lda ($8A),Y
	sta $7A,X
	ldy #$03 
	lda ($8A),Y
	sta $7B,X
	jmp ReplaceMeLabel_S1

	Compare85:
	cmp #$85 
	bne skipToThis_1

	lda $A8,X
	sta $7A,X
	lda $A9,X
	sta $7B,X
	jmp ReplaceMeLabel_S1

	skipToThis_1:
	lda $8C  
	asl A    
	sta $8C  
	pla
	tax
	inx
	cpx #$08 
	beq doneWithSoundEngine
	jmp ReplaceMeLabel_S5

	doneWithSoundEngine:
	rts
.endproc
;
; $99C3
.proc SquareWave0
	txa
	cmp #$07 
	bcs :+

	asl A    
	tax
	lda Data_at9D22+0,Y
	sta Sq0Timer_4002,X
	lda Data_at9D22+1,Y
	sta Sq0Length_4003,X     
	rts
	
	:
	tya
	pha
	txa
	and #$07 
	lsr A    
	tay
	lda $9DB8,Y
	and flagSound_70 
	beq :+

	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda Data_at9D22+0,Y
	sta $9A,X
	lda Data_at9D22+1,Y
	sta $9B,X
	rts

	:
	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda Data_at9D22+0,Y
	sta Sq0Timer_4002,X
	sta $9A,X
	lda Data_at9D22+1,Y
	sta Sq0Length_4003,X     
	sta $9B,X
	rts

.endproc
;
; $9A0D
.proc SquareWave0_1
	txa
	cmp #$07 
	bcs :+

	asl A    
	tax
	lda $9DBC,Y
	sta Sq0Duty_4000,X
	lda $9DBD,Y
	sta Sq0Sweep_4001,X
	rts

	:
	tya
	pha
	txa
	and #$07 
	lsr A    
	tay
	lda $9DB8,Y
	and flagSound_70 
	beq :+

	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda $9DBC,Y
	sta $98,X
	lda $9DBD,Y
	sta $99,X
	rts

	:
	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda $9DBC,Y
	sta Sq0Duty_4000,X
	sta $98,X
	lda $9DBD,Y
	sta Sq0Sweep_4001,X
	sta $99,X
	rts
.endproc
;
; $9A57
.proc SquareWave0_2
	txa
	cmp #$07 
	bcs :+
	asl A    
	tax
	lda $9DBC,Y
	sta Sq0Duty_4000,X
	lda $9DBD,Y
	sta Sq0Sweep_4001,X
	lda $9DBE,Y
	sta Sq0Timer_4002,X
	lda $9DBF,Y
	sta Sq0Length_4003,X     
	rts

	:
	tya
	pha
	txa
	and #$07   
	lsr A
	tay
	lda $9DB8,Y
	and flagSound_70    
	beq :+
	tya
	asl A
	asl A
	tax
	pla
	tay
	lda $9DBC,Y
	sta $98,X  
	lda $9DBD,Y
	sta $99,X  
	lda $9DBE,Y
	sta $9A,X  
	lda $9DBF,Y
	sta $9B,X  
	rts

	:
	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda $9DBC,Y
	sta Sq0Duty_4000,X
	sta $98,X
	lda $9DBD,Y
	sta Sq0Sweep_4001,X
	sta $99,X
	lda $9DBE,Y
	sta Sq0Timer_4002,X
	sta $9A,X
	lda $9DBF,Y
	sta Sq0Length_4003,X     
	sta $9B,X
	rts
.endproc
;
; $9AC7
.proc UnknownSub3
	clc
	adc $7A,X
	sta $7A,X
	bcc :+
	inc $7B,X
	
	:
	rts
.endproc
;
; $9AD1
.proc UnknownSub4
	lda $7A,X  
	sta $8A    
	lda $7B,X  
	sta $8B    
	rts
.endproc
;
; $9ADA
.proc UnknownSoundSub
	cmp #$04 
	bcs :+
	tax
	lda $9DB4,X
	and flagAPUStatus_C9  
	sta ApuStatus_4015
	rts

	:
	and #$03 
	tax
	lda $9DB8,X
	and flagSound_70 
	beq :+
	lda $9DB4,X
	and flagAPUStatus_C9  
	rts

	; Turn On Sound based on data from $9DB4
	; x	: offset from $9DB4
	:
	lda $9DB4,X
	and flagAPUStatus_C9
	sta ApuStatus_4015
	rts
.endproc
;
; $9B01
.proc UpdateAPUStatus
	cmp #$04 
	bcs :+
	tax
	lda $9DB8,X
	ora flagAPUStatus_C9  
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	rts

	:
	and #$03 
	tax
	lda $9DB8,X
	and flagSound_70 
	beq :+
	lda $9DB8,X
	ora flagAPUStatus_C9  
	sta flagAPUStatus_C9  
	rts

	:
	lda $9DB8,X
	ora flagAPUStatus_C9  
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	rts
.endproc
;
; $9B2E
.proc ResetSoundEngine

	PushAXY
	lda #$00 
	ldy #$00 
	:
	sta flagSound_70,Y
	iny
	cpy #$20 
	bne :-
	ldy #$08 
	:
	sta $0090,Y
	iny
	cpy #$47 
	bne :-
	sta flagSound_70 
	sta Sq0Sweep_4001 
	sta Sq1Sweep_4005 
	sta flagUpdateSoundAtVBlank_8E  
	lda #$FF 
	ldy #$00 
	:
	sta $0090,Y
	iny
	cpy #$08 
	bne :-
	lda #$8F 
	sta Sq0Duty_4000  
	sta Sq1Duty_4004  
	
	lda #(PLS1+PLS2+TRI+DMC)
	sta ApuStatus_4015			; enable all channels
	sta flagAPUStatus_C9  

	PullAXY
	rts
.endproc
;
; $9B74
.proc PlaySong
	
	PushAXY
	
	lda #$01 
	sta flagUpdateSoundAtVBlank_8E  
	lda flagSound_70 
	and #$0F 
	sta flagSound_70 
	lda soundIndex_8D  
	asl A    
	asl A    
	tay

	ldx #$00
	:
		tya
		pha
		txa
		pha
		tax
		lda #$FF 
		sta $94,X
		lda $9E84,Y
		jsr UnknownSoundSub6
		pla
		tax
		pla
		tay
		iny
		inx
		cpx #$04 
		bne :-
	
	lda #$0F 
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	lda #$00 
	sta flagUpdateSoundAtVBlank_8E  
	
	PullAXY
	rts
.endproc
;
; $9BB4
.proc UnknownSoundSub6
	cmp #$FF 
	bne SecondPart 
	lda #$10 
	cpx #$00 
	beq :++
	:
	asl A    
	dex
	bne :-
	:
	EOR #$FF 
	and flagSound_70 
	sta flagSound_70 
	rts

SecondPart:
	cpx #$FF 
	bne :+
	tay
	ldx $9ED6,Y
	
	:
	asl A    
	tay
	lda #$00 
	sta $76,X
	txa
	asl A    
	pha
	
	lda #$10 
	cpx #$00 
	beq :++
	
	:
	asl A    
	dex
	bne :-
	
	:
	ora flagSound_70
	sta flagSound_70 
	pla
	tax
	lda $9EB4,Y
	sta $C0,X
	sta $82,X
	lda $9EB5,Y
	sta $C1,X
	sta $83,X
	rts
.endproc
;
; $9BFA
.proc PlaySFX

	PushAXY
	lda flagPlaySFX_8F 
	bne doneWithSFX

	lda #$01 
	sta flagUpdateSoundAtVBlank_8E
	
	lda flagSound_70 
	and #$F0 
	sta flagSound_70 
	
	lda #$10 
	ldx #$00 
	ldy #$00 
	loopSoundEffectSqW0:     
		bit flagSound_70 
		bne :+
		pha
		txa
		sta Sq0Duty_4000,Y
		pla
		
		:
		iny
		iny
		iny
		iny
		asl A
		cpy #$0C 
		bne loopSoundEffectSqW0  

	lda soundIndex_8D  
	asl A    
	asl A    
	tay
	ldx #$00 
	loopSoundEffect:
		tya
		pha
		txa
		pha
		lda #$FF 
		sta $90,X
		lda $9E84,Y
		jsr UnknownSoundSub4
		pla
		tax
		pla
		tay
		iny
		inx
		cpx #$04 
		bne loopSoundEffect

	lda #$0F 
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	
	lda #$00 
	sta flagUpdateSoundAtVBlank_8E  

	doneWithSFX:     
	PullAXY

	rts
.endproc
;
; $9C55
.proc UnknownSoundSub4
	cmp #$FF 
	bne :++
	
	lda #$01 
	cpx #$00 
	beq :+

	loop_S2:
	asl A    
	dex
	bne loop_S2
	
	:
	EOR #$FF 
	and flagSound_70 
	sta flagSound_70 
	rts

	:
	cpx #$FF 
	bne :+
	tay
	ldx $9ED6,Y
	
	:
	asl A    
	tay
	lda #$00 
	sta $72,X
	lda $9DB8,X
	ora flagSound_70 
	sta flagSound_70 
	txa
	asl A    
	tax
	lda $9EB4,Y
	sta $B8,X
	sta $7A,X
	lda $9EB5,Y
	sta $B9,X
	sta $7B,X
	rts
.endproc
;
; $9C91
.proc WaitUntilSoundFinished	;	Called from main.asm
	pha

	:
		lda flagSound_70 
		and #$0F 
		bne :-

	pla
	rts
.endproc
;
; $9C9A
.proc DoSomethingWithSound

	PushAXY

	lda flagSound_70 
	and #$F0 
	sta flagSound_70 
	
	lda #$FF	
	ldx #$00 
	loopZeroOut_90_to_93:    
		sta $90,X
		inx
		cpx #$04 
		bne loopZeroOut_90_to_93 

	lda flagSound_70 
	and #$F0 
	bne skipZeroingVolume    

	lda #$00 
	sta Sq0Duty_4000  
	sta Sq1Duty_4004  
	sta TrgLinear_4008
	sta NoiseVolume_400C     
	jmp doneWithThis

	skipZeroingVolume:
	ldy #$00 
	:
		lda $0098,Y
		sta Sq0Duty_4000,Y
		lda $009C,Y
		sta Sq1Duty_4004,Y
		lda $00A0,Y
		sta TrgLinear_4008,Y     
		lda $00A4,Y
		sta NoiseVolume_400C,Y   
		iny
		cpy #$03 
		bne :-
	
	lda flagAPUStatus_C9  
	sta ApuStatus_4015

	doneWithThis:
	PullAXY
	rts
.endproc

; $9CF1
.proc TurnSoundOff

	PushAXY

	lda #ZERO
	sta ApuStatus_4015		; mute all channels

	sta flagAPUStatus_C9  
	lda flagSound_70 
	and #%00001111
	sta flagSound_70 

	lda #$FF 
	ldx #$04
	:
		sta $90,X
		inx
		cpx #$08 
		bne :-

	lda #ZERO
	sta Sq0Duty_4000  
	sta Sq1Duty_4004  
	sta TrgLinear_4008
	sta NoiseVolume_400C     

	PullAXY
	rts
.endproc