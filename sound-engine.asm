; $9815
.proc UpdateSoundAtVBlank
	LDA $8E  
	BEQ :+
	JMP doneWithSoundEngine
	:

	LDX #$00 
	LDA #$01 
	STA $8C
	
	ReplaceMeLabel_S5: 
	TXA
	PHA
	LDA $8C  
	AND flagSound_70 
	BNE :+
	JMP skipToThis_1	
	:

	LDA $72,X
	BEQ :+
	DEC $72,X
	JMP skipToThis_1	
	:

	TXA
	ASL A    
	TAX
	
	ReplaceMeLabel_S1:
	LDA ($7A,X)
	AND #$80 
	BNE skipToThis_2
	TXA
	PHA
	LDA ($7A,X)
	ASL A    
	TAY
	JSR SquareWave0
	PLA
	TAX
	LSR A    
	TAY
	JSR UnknownSub4
	TXA
	PHA
	TYA
	TAX
	LDY #$01 
	LDA ($8A),Y
	TAY
	DEY
	TYA
	STA $72,X
	PLA
	TAX
	LDA #$02 
	JSR UnknownSub3
	JMP skipToThis_1

	skipToThis_2:
	LDA ($7A,X)
	CMP #$80 
	BNE :+
	JSR UnknownSub4
	TXA
	PHA
	LDY #$01 
	LDA ($8A),Y
	ASL A    
	TAY
	JSR SquareWave0_1
	PLA
	TAX
	LDA #$02 
	JSR UnknownSub3
	JMP ReplaceMeLabel_S1

	:
	LDA ($7A,X)
	
	Compare89:
	CMP #$89 
	BNE Compare81
	
	JSR UnknownSub4
	TXA
	PHA
	LDY #$01 
	LDA ($8A),Y
	ASL A    
	TAY
	JSR SquareWave0_2
	PLA
	TAX
	LDA #$02 
	JSR UnknownSub3
	JMP ReplaceMeLabel_S1

	Compare81:
	CMP #$81 
	BNE Compare82

	TXA
	TAY
	LSR A    
	JSR UnknownSoundSub0
	TYA
	TAX
	LSR A    
	TAY
	JSR UnknownSub4
	TYA
	TAX
	LDY #$01 
	LDA ($8A),Y
	TAY
	DEY
	TYA
	STA $72,X
	TXA
	ASL A    
	TAX
	LDA #$02 
	JSR UnknownSub3
	JMP skipToThis_1
	
	Compare82:
	CMP #$82 
	BNE Compare83
	TXA
	LSR A    
	TAY
	JSR UnknownSub4
	TYA
	TAX
	LDY #$01 
	LDA ($8A),Y
	TAY
	DEY
	TYA
	STA $72,X
	TXA
	ASL A    
	TAX
	LDA #$02 
	JSR UnknownSub3
	JMP skipToThis_1

	Compare83:
	CMP #$83 
	BNE Compare86
	TXA
	PHA
	LSR A    
	JSR UpdateAPUStatus0
	PLA
	TAX
	LDA #$01 
	JSR UnknownSub3
	JMP ReplaceMeLabel_S1

	Compare86:
	CMP #$86 
	BNE Compare84
	TXA
	CMP #$07 
	BCS ReplaceMeLabel_S2
	LDA #$F0 
	AND flagSound_70 
	STA flagSound_70 
	LDY #$00

	loop_S1:
		LDA $0098,Y
		AND #$F6 
		STA Sq0Duty_4000,Y
		LDA $009C,Y
		STA Sq1Duty_4004,Y
		LDA $00A0,Y
		STA TrgLinear_4008,Y     
		LDA $00A4,Y
		STA NoiseVolume_400C,Y   
		INY
		CPY #$02 
		BNE loop_S1

	LDA #$F0 
	AND flagSound_70 
	BNE :+
	LDA #$00 
	STA ApuStatus_4015
	STA $C9  
	JMP skipToThis_1

	:
	LDA $C9  
	STA ApuStatus_4015
	JMP skipToThis_1

	ReplaceMeLabel_S2:
	LDA $B8,X
	STA $7A,X
	LDA $B9,X
	STA $7B,X
	JMP ReplaceMeLabel_S1

	Compare84:
	CMP #$84 
	BNE Compare85

	TXA
	TAY
	LSR A    
	TAX
	LDA $90,X
	CMP #$00 
	BNE ReplaceMeLabel_S3
	LDA #$FF 
	STA $90,X
	TYA
	TAX
	LDA #$04 
	JSR UnknownSub3
	JMP ReplaceMeLabel_S1

	ReplaceMeLabel_S3:
	TYA
	TAX
	LSR A    
	TAY
	JSR UnknownSub4
	LDA $0090,Y
	CMP #$FF 
	BNE ReplaceMeLabel_S4
	TYA
	TAX
	LDY #$01 
	LDA ($8A),Y
	STA $90,X
	TXA
	ASL A    
	TAX
	LDA $8A  
	STA $A8,X
	LDA $8B  
	STA $A9,X
	
	ReplaceMeLabel_S4:
	TXA
	LSR A    
	TAX
	DEC $90,X
	TXA
	ASL A    
	TAX
	LDY #$02 
	LDA ($8A),Y
	STA $7A,X
	LDY #$03 
	LDA ($8A),Y
	STA $7B,X
	JMP ReplaceMeLabel_S1

	Compare85:
	CMP #$85 
	BNE skipToThis_1

	LDA $A8,X
	STA $7A,X
	LDA $A9,X
	STA $7B,X
	JMP ReplaceMeLabel_S1

	skipToThis_1:
	LDA $8C  
	ASL A    
	STA $8C  
	PLA
	TAX
	INX
	CPX #$08 
	BEQ doneWithSoundEngine
	JMP ReplaceMeLabel_S5

	doneWithSoundEngine:
	RTS
.endproc
;
; $99C3
.proc SquareWave0
	TXA
	CMP #$07 
	BCS :+

	ASL A    
	TAX
	LDA Data_at9D22+0,Y
	STA Sq0Timer_4002,X
	LDA Data_at9D22+1,Y
	STA Sq0Length_4003,X     
	RTS
	
	:
	TYA
	PHA
	TXA
	AND #$07 
	LSR A    
	TAY
	LDA $9DB8,Y
	AND flagSound_70 
	BEQ :+

	TYA
	ASL A    
	ASL A    
	TAX
	PLA
	TAY
	LDA Data_at9D22+0,Y
	STA $9A,X
	LDA Data_at9D22+1,Y
	STA $9B,X
	RTS

	:
	TYA
	ASL A    
	ASL A    
	TAX
	PLA
	TAY
	LDA Data_at9D22+0,Y
	STA Sq0Timer_4002,X
	STA $9A,X
	LDA Data_at9D22+1,Y
	STA Sq0Length_4003,X     
	STA $9B,X
	RTS

.endproc
;
; $9A0D
.proc SquareWave0_1
	TXA
	CMP #$07 
	BCS :+

	ASL A    
	TAX
	LDA $9DBC,Y
	STA Sq0Duty_4000,X
	LDA $9DBD,Y
	STA Sq0Sweep_4001,X
	RTS

	:
	TYA
	PHA
	TXA
	AND #$07 
	LSR A    
	TAY
	LDA $9DB8,Y
	AND flagSound_70 
	BEQ :+

	TYA
	ASL A    
	ASL A    
	TAX
	PLA
	TAY
	LDA $9DBC,Y
	STA $98,X
	LDA $9DBD,Y
	STA $99,X
	RTS

	:
	TYA
	ASL A    
	ASL A    
	TAX
	PLA
	TAY
	LDA $9DBC,Y
	STA Sq0Duty_4000,X
	STA $98,X
	LDA $9DBD,Y
	STA Sq0Sweep_4001,X
	STA $99,X
	RTS
.endproc
;
; $9A57
.proc SquareWave0_2
	TXA
	CMP #$07 
	BCS :+
	ASL A    
	TAX
	LDA $9DBC,Y
	STA Sq0Duty_4000,X
	LDA $9DBD,Y
	STA Sq0Sweep_4001,X
	LDA $9DBE,Y
	STA Sq0Timer_4002,X
	LDA $9DBF,Y
	STA Sq0Length_4003,X     
	RTS

	:
	TYA
	PHA
	TXA
	AND #$07   
	LSR A
	TAY
	LDA $9DB8,Y
	AND flagSound_70    
	BEQ :+
	TYA
	ASL A
	ASL A
	TAX
	PLA
	TAY
	LDA $9DBC,Y
	STA $98,X  
	LDA $9DBD,Y
	STA $99,X  
	LDA $9DBE,Y
	STA $9A,X  
	LDA $9DBF,Y
	STA $9B,X  
	RTS

	:
	TYA
	ASL A    
	ASL A    
	TAX
	PLA
	TAY
	LDA $9DBC,Y
	STA Sq0Duty_4000,X
	STA $98,X
	LDA $9DBD,Y
	STA Sq0Sweep_4001,X
	STA $99,X
	LDA $9DBE,Y
	STA Sq0Timer_4002,X
	STA $9A,X
	LDA $9DBF,Y
	STA Sq0Length_4003,X     
	STA $9B,X
	RTS
.endproc
;
; $9AC7
.proc UnknownSub3
	CLC
	ADC $7A,X
	STA $7A,X
	BCC :+
	INC $7B,X
	
	:
	RTS
.endproc
;
; $9AD1
.proc UnknownSub4
	LDA $7A,X  
	STA $8A    
	LDA $7B,X  
	STA $8B    
	RTS
.endproc
;
; $9ADA
.proc UnknownSoundSub0
	CMP #$04 
	BCS :+
	TAX
	LDA $9DB4,X
	AND $C9  
	STA ApuStatus_4015
	RTS

	:
	AND #$03 
	TAX
	LDA $9DB8,X
	AND flagSound_70 
	BEQ :+
	LDA $9DB4,X
	AND $C9  
	RTS

	; Turn On Sound based on data from $9DB4
	; x	: offset from $9DB4
	:
	LDA $9DB4,X
	AND $C9
	STA ApuStatus_4015
	RTS
.endproc
;
; $9B01
.proc UpdateAPUStatus0
	CMP #$04 
	BCS :+
	TAX
	LDA $9DB8,X
	ORA $C9  
	STA ApuStatus_4015
	STA $C9  
	RTS

	:
	AND #$03 
	TAX
	LDA $9DB8,X
	AND flagSound_70 
	BEQ :+
	LDA $9DB8,X
	ORA $C9  
	STA $C9  
	RTS

	:
	LDA $9DB8,X
	ORA $C9  
	STA ApuStatus_4015
	STA $C9  
	RTS
.endproc
;
; $9B2E
; SoundRoutine(Y)
.proc ResetSoundEngine
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA #$00 
	LDY #$00 
	:
	STA flagSound_70,Y
	INY
	CPY #$20 
	BNE :-
	LDY #$08 
	:
	STA $0090,Y
	INY
	CPY #$47 
	BNE :-
	STA flagSound_70 
	STA Sq0Sweep_4001 
	STA Sq1Sweep_4005 
	STA $8E  
	LDA #$FF 
	LDY #$00 
	:
	STA $0090,Y
	INY
	CPY #$08 
	BNE :-
	LDA #$8F 
	STA Sq0Duty_4000  
	STA Sq1Duty_4004  
	LDA #$0F 
	STA ApuStatus_4015
	STA $C9  
	PLA
	TAY
	PLA
	TAX
	PLA
	RTS
.endproc
;
; $9B74
.proc InitializeSound
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA #$01 
	STA $8E  
	LDA flagSound_70 
	AND #$0F 
	STA flagSound_70 
	LDA $8D  
	ASL A    
	ASL A    
	TAY

	LDX #$00
	:
	TYA
	PHA
	TXA
	PHA
	TAX
	LDA #$FF 
	STA $94,X
	LDA $9E84,Y
	JSR UnknownSoundSub6
	PLA
	TAX
	PLA
	TAY
	INY
	INX
	CPX #$04 
	BNE :-
	
	LDA #$0F 
	STA ApuStatus_4015
	STA $C9  
	LDA #$00 
	STA $8E  
	PLA
	TAY
	PLA
	TAX
	PLA
	RTS
.endproc
;
; $9BB4
.proc UnknownSoundSub6
	CMP #$FF 
	BNE SecondPart 
	LDA #$10 
	CPX #$00 
	BEQ :++
	:
	ASL A    
	DEX
	BNE :-
	:
	EOR #$FF 
	AND flagSound_70 
	STA flagSound_70 
	RTS

SecondPart:
	CPX #$FF 
	BNE :+
	TAY
	LDX $9ED6,Y
	
	:
	ASL A    
	TAY
	LDA #$00 
	STA $76,X
	TXA
	ASL A    
	PHA
	
	LDA #$10 
	CPX #$00 
	BEQ :++
	
	:
	ASL A    
	DEX
	BNE :-
	
	:
	ORA flagSound_70
	STA flagSound_70 
	PLA
	TAX
	LDA $9EB4,Y
	STA $C0,X
	STA $82,X
	LDA $9EB5,Y
	STA $C1,X
	STA $83,X
	RTS
.endproc
;
; $9BFA
.proc PlaySFX
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA soundAddress_8F 
	BNE doneWithThisRoutine  
	LDA #$01 
	STA $8E  
	LDA flagSound_70 
	AND #$F0 
	STA flagSound_70 
	LDA #$10 
	LDX #$00 
	LDY #$00 
	loopSoundEffectSqW0:     
	BIT flagSound_70 
	BNE skipDoingSomethingWithSquareWave0
	PHA
	TXA
	STA Sq0Duty_4000,Y
	PLA
	skipDoingSomethingWithSquareWave0:
	INY
	INY
	INY
	INY
	ASL A    
	CPY #$0C 
	BNE loopSoundEffectSqW0  
	LDA $8D  
	ASL A    
	ASL A    
	TAY

	LDX #$00 
	:
	TYA
	PHA
	TXA
	PHA
	LDA #$FF 
	STA $90,X
	LDA $9E84,Y
	JSR UnknownSoundSub4
	PLA
	TAX
	PLA
	TAY
	INY
	INX
	CPX #$04 
	BNE :-
	LDA #$0F 
	STA ApuStatus_4015
	STA $C9  
	LDA #$00 
	STA $8E  

	doneWithThisRoutine:     
	PLA
	TAY
	PLA
	TAX
	PLA
	RTS
.endproc
;
; $9C55
.proc UnknownSoundSub4
	CMP #$FF 
	BNE :++
	
	LDA #$01 
	CPX #$00 
	BEQ :+

	loop_S2:
	ASL A    
	DEX
	BNE loop_S2
	
	:
	EOR #$FF 
	AND flagSound_70 
	STA flagSound_70 
	RTS

	:
	CPX #$FF 
	BNE :+
	TAY
	LDX $9ED6,Y
	
	:
	ASL A    
	TAY
	LDA #$00 
	STA $72,X
	LDA $9DB8,X
	ORA flagSound_70 
	STA flagSound_70 
	TXA
	ASL A    
	TAX
	LDA $9EB4,Y
	STA $B8,X
	STA $7A,X
	LDA $9EB5,Y
	STA $B9,X
	STA $7B,X
	RTS
.endproc
;
; $9C91
.proc UnknownSoundSub2	;	Called from main.asm
	PHA
	:
	LDA flagSound_70 
	AND #$0F 
	BNE :-
	PLA
	RTS
.endproc
;
; $9C9A
.proc DoSomethingWithSound
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA flagSound_70 
	AND #$F0 
	STA flagSound_70 
	LDA #$FF 
	LDX #$00 
	loopZeroOut_90_to_93:    
	STA $90,X
	INX
	CPX #$04 
	BNE loopZeroOut_90_to_93 
	LDA flagSound_70 
	AND #$F0 
	BNE skipZeroingVolume    
	LDA #$00 
	STA Sq0Duty_4000  
	STA Sq1Duty_4004  
	STA TrgLinear_4008
	STA NoiseVolume_400C     
	JMP $9CEB
	skipZeroingVolume:
	LDY #$00 
	loopLoadThreeBytesSoundRegisters:
	LDA $0098,Y
	STA Sq0Duty_4000,Y
	LDA $009C,Y
	STA Sq1Duty_4004,Y
	LDA $00A0,Y
	STA TrgLinear_4008,Y     
	LDA $00A4,Y
	STA NoiseVolume_400C,Y   
	INY
	CPY #$03 
	BNE loopLoadThreeBytesSoundRegisters
	LDA $C9  
	STA ApuStatus_4015
	PLA
	TAY
	PLA
	TAX
	PLA
	RTS
.endproc
; $9CF1
.proc Sound_DontKnowWhatItDoes
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA #$00 
	STA ApuStatus_4015
	STA $C9  
	LDA flagSound_70 
	AND #$0F 
	STA flagSound_70 
	LDA #$FF 
	LDX #$04

	:
	STA $90,X
	INX
	CPX #$08 
	BNE :-

	LDA #$00 
	STA Sq0Duty_4000  
	STA Sq1Duty_4004  
	STA TrgLinear_4008
	STA NoiseVolume_400C     
	PLA
	TAY
	PLA
	TAX
	PLA
	RTS
.endproc