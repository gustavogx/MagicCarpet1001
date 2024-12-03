.define PLS1 	FLAG_0
.define PLS2 	FLAG_1
.define TRI 	FLAG_2
.define DMC 	FLAG_3

; square0Duty_9815
.proc UpdateSoundAtVBlank
	lda flagUpdateSoundOnVBlank_8E  
	beq :+
	jmp doneWithSoundEngine
	:

	ldx #ZERO 
	lda #FLAG_0 
	sta soundEngine_8C
	
	ReplaceMeLabel_S5: 
	txa
	pha
	lda soundEngine_8C  
	and flagSound_70 
	bne :+
	jmp skipToThis_1	
	:

	lda soundEngineArray_72,X
	beq :+
	dec soundEngineArray_72,X
	jmp skipToThis_1	
	:

	txa
	asl A    
	tax
	
	ReplaceMeLabel_S1:
	lda (soundEngineAddrList_7A,X)
	and #FLAG_7
	bne skipToThis_2
	txa
	pha
	lda (soundEngineAddrList_7A,X)
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
	lda (soundEngineAddress_8A),Y
	tay
	dey
	tya
	sta soundEngineArray_72,X
	pla
	tax
	lda #$02 
	jsr UnknownSub3
	jmp skipToThis_1

	skipToThis_2:
	lda (soundEngineAddrList_7A,X)
	cmp #FLAG_7 
	bne :+
	jsr UnknownSub4
	txa
	pha
	ldy #$01 
	lda (soundEngineAddress_8A),Y
	asl A    
	tay
	jsr SquareWave0_1
	pla
	tax
	lda #$02 
	jsr UnknownSub3
	jmp ReplaceMeLabel_S1

	:
	lda (soundEngineAddrList_7A,X)
	
	Compare89:
	cmp #(FLAG_7 | FLAG_3 | FLAG_0) ;$89 
	bne Compare81
	
	jsr UnknownSub4
	txa
	pha
	ldy #$01 
	lda (soundEngineAddress_8A),Y
	asl A    
	tay
	jsr SquareWave0_2
	pla
	tax
	lda #$02 
	jsr UnknownSub3
	jmp ReplaceMeLabel_S1

	Compare81:
	cmp #(FLAG_7 | FLAG_0) ;$81
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
	lda (soundEngineAddress_8A),Y
	tay
	dey
	tya
	sta soundEngineArray_72,X
	txa
	asl A    
	tax
	lda #$02 
	jsr UnknownSub3
	jmp skipToThis_1
	
	Compare82:
	cmp #(FLAG_7 | FLAG_1) ;soundEngine_82
	bne Compare83
	txa
	lsr A    
	tay
	jsr UnknownSub4
	tya
	tax
	ldy #$01 
	lda (soundEngineAddress_8A),Y
	tay
	dey
	tya
	sta soundEngineArray_72,X
	txa
	asl A    
	tax
	lda #$02 
	jsr UnknownSub3
	jmp skipToThis_1

	Compare83:
	cmp #(FLAG_7 | FLAG_1 | FLAG_0) ;soundEngine_83
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
	cmp #(FLAG_7 | FLAG_2 | FLAG_1) ;$86 
	bne Compare84
	txa
	cmp #$07 
	bcs ReplaceMeLabel_S2
	lda #UPPER 
	and flagSound_70 
	sta flagSound_70 
	ldy #$00

	loop_S1:
		lda square0Duty_98,Y
		and #(UPPER+FLAG_1+FLAG_2) ; turns OFF flags 0 and 3
		sta Sq0Duty_4000,Y
		lda square1Duty_9C,Y
		sta Sq1Duty_4004,Y
		lda triangleLinear_A0,Y
		sta TrgLinear_4008,Y     
		lda noiseVolume_A4,Y
		sta NoiseVolume_400C,Y   
		iny
		cpy #$02 
		bne loop_S1

	lda #UPPER 
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
	lda soundEngineAddr_B8,X
	sta soundEngineAddrList_7A,X
	lda soundEngineAddr_B8+1,X
	sta soundEngineAddrList_7A+1,X
	jmp ReplaceMeLabel_S1

	Compare84:
	cmp #(FLAG_7 | FLAG_2) ;$84
	bne Compare85

	txa
	tay
	lsr A    
	tax
	lda soundEngine_90,X
	cmp #$00 
	bne ReplaceMeLabel_S3
	lda #FULL 
	sta soundEngine_90,X
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
	lda soundEngine_90,Y
	cmp #FULL 
	bne ReplaceMeLabel_S4
	tya
	tax
	ldy #$01 
	lda (soundEngineAddress_8A),Y
	sta soundEngine_90,X
	txa
	asl A    
	tax
	lda soundEngineAddress_8A  
	sta soundEngineAddr_A8,X
	lda soundEngineAddress_8A+1  
	sta soundEngineAddr_A8+1,X
	
	ReplaceMeLabel_S4:
	txa
	lsr A    
	tax
	dec soundEngine_90,X
	txa
	asl A    
	tax
	ldy #$02 
	lda (soundEngineAddress_8A),Y
	sta soundEngineAddrList_7A,X
	ldy #$03 
	lda (soundEngineAddress_8A),Y
	sta soundEngineAddrList_7A+1,X
	jmp ReplaceMeLabel_S1

	Compare85:
	cmp #(FLAG_7 | FLAG_2 | FLAG_0) ;$85
	bne skipToThis_1

	lda soundEngineAddr_A8,X
	sta soundEngineAddrList_7A,X
	lda soundEngineAddr_A8+1,X
	sta soundEngineAddrList_7A+1,X
	jmp ReplaceMeLabel_S1

	skipToThis_1:
	lda soundEngine_8C  
	asl A    
	sta soundEngine_8C  
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
; square0Sweep_99C3
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
		lda Data_at9DB4+4,Y
		and flagSound_70 
		beq :+

		tya
		asl A
		asl A
		tax
		pla
		tay
		lda Data_at9D22+0,Y
		sta square0Timer_9A,X
		lda Data_at9D22+1,Y
		sta square0Length_9B,X
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
		sta square0Timer_9A,X
		lda Data_at9D22+1,Y
		sta Sq0Length_4003,X
		sta square0Length_9B,X
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
	lda Data_at9DB4+8,Y
	sta Sq0Duty_4000,X
	lda Data_at9DB4+9,Y
	sta Sq0Sweep_4001,X
	rts

	:
	tya
	pha
	txa
	and #$07 
	lsr A    
	tay
	lda Data_at9DB4+4,Y
	and flagSound_70 
	beq :+

	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda Data_at9DB4+8,Y
	sta square0Duty_98,X
	lda Data_at9DB4+9,Y
	sta square0Sweep_99,X
	rts

	:
	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda Data_at9DB4+8,Y
	sta Sq0Duty_4000,X
	sta square0Duty_98,X
	lda Data_at9DB4+9,Y
	sta Sq0Sweep_4001,X
	sta square0Sweep_99,X
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
	lda Data_at9DB4+8,Y
	sta Sq0Duty_4000,X
	lda Data_at9DB4+9,Y
	sta Sq0Sweep_4001,X
	lda Data_at9DB4+10,Y
	sta Sq0Timer_4002,X
	lda Data_at9DB4+11,Y
	sta Sq0Length_4003,X     
	rts

	:
	tya
	pha
	txa
	and #$07   
	lsr A
	tay
	lda Data_at9DB4+4,Y
	and flagSound_70    
	beq :+
	tya
	asl A
	asl A
	tax
	pla
	tay
	lda Data_at9DB4+8,Y
	sta square0Duty_98,X  
	lda Data_at9DB4+9,Y
	sta square0Sweep_99,X  
	lda Data_at9DB4+10,Y
	sta square0Timer_9A,X  
	lda Data_at9DB4+11,Y
	sta square0Length_9B,X  
	rts

	:
	tya
	asl A    
	asl A    
	tax
	pla
	tay
	lda Data_at9DB4+8,Y
	sta Sq0Duty_4000,X
	sta square0Duty_98,X
	lda Data_at9DB4+9,Y
	sta Sq0Sweep_4001,X
	sta square0Sweep_99,X
	lda Data_at9DB4+10,Y
	sta Sq0Timer_4002,X
	sta square0Timer_9A,X
	lda Data_at9DB4+11,Y
	sta Sq0Length_4003,X     
	sta square0Length_9B,X
	rts
.endproc
;
; $9AC7
.proc UnknownSub3
	clc
	adc soundEngineAddrList_7A,X
	sta soundEngineAddrList_7A,X
	bcc :+
	inc soundEngineAddrList_7A+1,X
	
	:
	rts
.endproc
;
; $9AD1
.proc UnknownSub4
	lda soundEngineAddrList_7A,X  
	sta soundEngineAddress_8A    
	lda soundEngineAddrList_7A+1,X  
	sta soundEngineAddress_8A+1    
	rts
.endproc
;
; $9ADA
.proc UnknownSoundSub
	cmp #$04 
	bcs :+
	tax
	lda Data_at9DB4,X
	and flagAPUStatus_C9  
	sta ApuStatus_4015
	rts

	:
	and #$03 
	tax
	lda Data_at9DB4+4,X
	and flagSound_70 
	beq :+
	lda Data_at9DB4,X
	and flagAPUStatus_C9  
	rts

	; Turn On Sound based on data from Data_at9DB4
	; x	: offset from Data_at9DB4
	:
	lda Data_at9DB4,X
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
	lda Data_at9DB4+4,X
	ora flagAPUStatus_C9  
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	rts

	:
	and #$03 
	tax
	lda Data_at9DB4+4,X
	and flagSound_70 
	beq :+
	lda Data_at9DB4+4,X
	ora flagAPUStatus_C9  
	sta flagAPUStatus_C9  
	rts

	:
	lda Data_at9DB4+4,X
	ora flagAPUStatus_C9  
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	rts
.endproc
;
; $9B2E
.proc StartSoundEngine

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
	sta soundEngine_90,Y ;  
	iny
	cpy #$47 
	bne :-
	sta flagSound_70 
	sta Sq0Sweep_4001 
	sta Sq1Sweep_4005 
	sta flagUpdateSoundOnVBlank_8E  
	lda #$FF 
	ldy #$00 
	:
	sta soundEngine_90,Y ;
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
.proc PlaySoundForever
	
	PushAXY
	
	lda #TRUE
	sta flagUpdateSoundOnVBlank_8E  
	lda flagSound_70 
	and #LOWER 
	sta flagSound_70 
	lda soundIndex_8D  
	asl A    
	asl A    
	tay

	ldx #$00
	:
		PushYX
		tax
		lda #$FF 
		sta soundEngine_94,X
		lda Data_at9E84,Y
		jsr UnknownSoundSub6
		PullYX
		iny
		inx
		cpx #$04 
		bne :-
	
	lda #$0F 
	sta ApuStatus_4015
	sta flagAPUStatus_C9  
	lda #$00 
	sta flagUpdateSoundOnVBlank_8E  
	
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
	eor #$FF 
	and flagSound_70 
	sta flagSound_70 
	rts

SecondPart:
	cpx #$FF 
	bne :+
		tay
		ldx Data_at9ED6,Y
	
	:
	asl A    
	tay
	lda #$00 
	sta soundEngine_76,X
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
	lda Data_at9EB4+0,Y
	sta soundEngine_C0,X
	sta soundEngine_82,X
	lda Data_at9EB4+1,Y
	sta soundEngine_C1,X
	sta soundEngine_83,X
	rts
.endproc
;
; $9BFA
.proc PlaySoundOnce

	PushAXY
	lda flagPlaySFX_8F 
	bne doneWithSFX

	lda #$01 
	sta flagUpdateSoundOnVBlank_8E
	
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
		sta soundEngine_90,X
		lda Data_at9E84,Y
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
	sta flagUpdateSoundOnVBlank_8E  

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
	eor #$FF 
	and flagSound_70 
	sta flagSound_70 
	rts

	:
	cpx #$FF 
	bne :+
	tay
	ldx Data_at9ED6,Y
	
	:
	asl A    
	tay
	lda #$00 
	sta soundEngineArray_72,X
	lda Data_at9DB4+4,X
	ora flagSound_70 
	sta flagSound_70 
	txa
	asl A    
	tax
	lda Data_at9EB4+0,Y
	sta soundEngineAddr_B8,X
	sta soundEngineAddrList_7A,X
	lda Data_at9EB4+1,Y
	sta soundEngineAddr_B8+1,X
	sta soundEngineAddrList_7A+1,X
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
.proc ResetSoundEngine

	PushAXY

	lda flagSound_70 
	and #UPPER 
	sta flagSound_70 
	
	lda #$FF	
	ldx #$00 
	loopZeroOut_90_to_93:    
		sta soundEngine_90,X
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
		lda square0Duty_98,Y
		sta Sq0Duty_4000,Y
		lda square1Duty_9C,Y
		sta Sq1Duty_4004,Y
		lda triangleLinear_A0,Y
		sta TrgLinear_4008,Y     
		lda noiseVolume_A4,Y
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
		sta soundEngine_90,X
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