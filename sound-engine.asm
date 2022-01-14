; $9815
.proc UpdateSoundAtVBlank
	LDA $8E                  
	BEQ $981C                
	JMP $99C2                
	LDX #$00                 
	LDA #$01                 
	STA $8C                  
	TXA                      
	PHA                      
	LDA $8C                  
	AND soundArray_70               
	BNE $982D                
	JMP $99B3                
	LDA $72,X                
	BEQ $9836                
	DEC $72,X                
	JMP $99B3                
	TXA                      
	ASL A                    
	TAX                      
	LDA ($7A,X)              
	AND #$80                 
	BNE $9866                
	TXA                      
	PHA                      
	LDA ($7A,X)              
	ASL A                    
	TAY                      
	JSR $99C3                
	PLA                      
	TAX                      
	LSR A                    
	TAY                      
	JSR $9AD1                
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
	JSR $9AC7                
	JMP $99B3                
	LDA ($7A,X)              
	CMP #$80                 
	BNE $9884                
	JSR $9AD1                
	TXA                      
	PHA                      
	LDY #$01                 
	LDA ($8A),Y              
	ASL A                    
	TAY                      
	JSR $9A0D                
	PLA                      
	TAX                      
	LDA #$02                 
	JSR $9AC7                
	JMP $9839                
	LDA ($7A,X)              
	CMP #$89                 
	BNE $98A2                
	JSR $9AD1                
	TXA                      
	PHA                      
	LDY #$01                 
	LDA ($8A),Y              
	ASL A                    
	TAY                      
	JSR $9A57                
	PLA                      
	TAX                      
	LDA #$02                 
	JSR $9AC7                
	JMP $9839                
	CMP #$81                 
	BNE $98C9                
	TXA                      
	TAY                      
	LSR A                    
	JSR $9ADA                
	TYA                      
	TAX                      
	LSR A                    
	TAY                      
	JSR $9AD1                
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
	JSR $9AC7                
	JMP $99B3                
	CMP #$82                 
	BNE $98E9                
	TXA                      
	LSR A                    
	TAY                      
	JSR $9AD1                
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
	JSR $9AC7                
	JMP $99B3                
	CMP #$83                 
	BNE $98FD                
	TXA                      
	PHA                      
	LSR A                    
	JSR $9B01                
	PLA                      
	TAX                      
	LDA #$01                 
	JSR $9AC7                
	JMP $9839                
	CMP #$86                 
	BNE $9950                
	TXA                      
	CMP #$07                 
	BCS $9945                
	LDA #$F0                 
	AND soundArray_70               
	STA soundArray_70               
	LDY #$00                 
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
	BNE $990E                
	LDA #$F0                 
	AND soundArray_70               
	BNE $993D                
	LDA #$00                 
	STA ApuStatus_4015       
	STA $C9                  
	JMP $99B3                
	LDA $C9                  
	STA ApuStatus_4015       
	JMP $99B3                
	LDA $B8,X                
	STA $7A,X                
	LDA $B9,X                
	STA $7B,X                
	JMP $9839                
	CMP #$84                 
	BNE $99A4                
	TXA                      
	TAY                      
	LSR A                    
	TAX                      
	LDA $90,X                
	CMP #$00                 
	BNE $996C                
	LDA #$FF                 
	STA $90,X                
	TYA                      
	TAX                      
	LDA #$04                 
	JSR $9AC7                
	JMP $9839                
	TYA                      
	TAX                      
	LSR A                    
	TAY                      
	JSR $9AD1                
	LDA $0090,Y              
	CMP #$FF                 
	BNE $998D                
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
	JMP $9839                
	CMP #$85                 
	BNE $99B3                
	LDA $A8,X                
	STA $7A,X                
	LDA $A9,X                
	STA $7B,X                
	JMP $9839                
	LDA $8C                  
	ASL A                    
	STA $8C                  
	PLA                      
	TAX                      
	INX                      
	CPX #$08                 
	BEQ $99C2                
	JMP $9822                
	RTS                      
.endproc
;
; $99C3
.proc SquareWave0
	TXA                      
	CMP #$07                 
	BCS $99D7                
	ASL A                    
	TAX                      
	LDA $9D22,Y              
	STA Sq0Timer_4002,X      
	LDA $9D23,Y              
	STA Sq0Length_4003,X     
	RTS                      
.endproc
;
; $99D7
.proc UnknownSub1
	TYA                      
	PHA                      
	TXA                      
	AND #$07                 
	LSR A                    
	TAY                      
	LDA $9DB8,Y              
	AND soundArray_70               
	BEQ $99F6                
	TYA                      
	ASL A                    
	ASL A                    
	TAX                      
	PLA                      
	TAY                      
	LDA $9D22,Y              
	STA $9A,X                
	LDA $9D23,Y              
	STA $9B,X                
	RTS                      
.endproc
;
; $99F6
.proc SquareWave0_2
	TYA                      
	ASL A                    
	ASL A                    
	TAX                      
	PLA                      
	TAY                      
	LDA $9D22,Y              
	STA Sq0Timer_4002,X      
	STA $9A,X                
	LDA $9D23,Y              
	STA Sq0Length_4003,X     
	STA $9B,X                
	RTS                      
.endproc
;
; $9A0D
.proc SquareWave0_3
  TXA                      
  CMP #$07                 
  BCS $9A21                
  ASL A                    
  TAX                      
  LDA $9DBC,Y              
  STA Sq0Duty_4000,X       
  LDA $9DBD,Y              
  STA Sq0Sweep_4001,X      
  RTS                      
.endproc
;
; $9A21
.proc UnknownSub2
	TYA                      
	PHA                      
	TXA                      
	AND #$07                 
	LSR A                    
	TAY                      
	LDA $9DB8,Y              
	AND soundArray_70               
	BEQ $9A40                
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
.endproc
;
; $9A40
.proc SquareWave0_4
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
.proc SquareWave0_5
	TXA                      
	CMP #$07                 
	BCS $9A77                
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
.endproc
;
; $9A77
.proc SquareWave0_6
	TXA                      
	CMP #$07                 
	BCS $9A77                
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
.endproc
;
; $9AA0
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
	BCC $9AD0                
	INC $7B,X                
	RTS                      
.endproc
;
; $9AD1
.proc UnknownSub4
	CLC                      
	ADC $7A,X                
	STA $7A,X                
	BCC $9AD0                
	INC $7B,X                
	RTS                      
.endproc
;
; $9ADA
.proc UnknownSoundSub0
	CMP #$04                 
	BCS $9AE8                
	TAX                      
	LDA $9DB4,X              
	AND $C9                  
	STA ApuStatus_4015       
	RTS                      
.endproc
;
; $9AE8
.proc UnknownSoundSub1
	AND #$03                 
	TAX                      
	LDA $9DB8,X              
	AND soundArray_70               
	BEQ $9AF8                
	LDA $9DB4,X              
	AND $C9                  
	RTS                      
.endproc
;
; $9AF8
; Turn On Sound based on data from $9DB4
; x	: offset from $9DB4
.proc TurnOnSound
	LDA $9DB4,X              
	AND $C9
	STA ApuStatus_4015       
	RTS                      
.endproc
;
; $9B01
.proc UpdateAPUStatus0
	CMP #$04                 
	BCS $9B11                
	TAX                      
	LDA $9DB8,X              
	ORA $C9                  
	STA ApuStatus_4015       
	STA $C9                  
	RTS                      
.endproc
;
; $9B11
.proc UpdateAPUStatus1
	AND #$03                 
	TAX                      
	LDA $9DB8,X              
	AND soundArray_70               
	BEQ $9B23                
	LDA $9DB8,X              
	ORA $C9                  
	STA $C9                  
	RTS                      
.endproc
;
; $9B23
.proc UpdateAPUStatus2
	LDA $9DB8,X              
	ORA $C9                  
	STA ApuStatus_4015       
	STA $C9                  
	RTS                      
.endproc
;
; $9B2E
; SoundRoutine(Y)
.proc SomethingWithSound_1
	PHA                      
	TXA                      
	PHA                      
	TYA                      
	PHA                      
	LDA #$00                 
	LDY #$00                 
	:
	STA soundArray_70,Y             
	INY                      
	CPY #$20                 
	BNE :-                
	LDY #$08                 
	:
	STA $0090,Y              
	INY                      
	CPY #$47                 
	BNE :-                
	STA soundArray_70               
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
	LDA soundArray_70               
	AND #$0F                 
	STA soundArray_70               
	LDA $8D                  
	ASL A                    
	ASL A                    
	TAY                      
	LDX #$00                 
	TYA                      
	PHA                      
	TXA                      
	PHA                      
	TAX                      
	LDA #$FF                 
	STA $94,X                
	LDA $9E84,Y              
	JSR $9BB4                
	PLA                      
	TAX                      
	PLA                      
	TAY                      
	INY                      
	INX                      
	CPX #$04                 
	BNE $9B8A                
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
	AND soundArray_70               
	STA soundArray_70               
	RTS                      

SecondPart:
	CPX #$FF                 
	BNE $9BD1                
	TAY                      
	LDX $9ED6,Y              
	ASL A                    
	TAY                      
	LDA #$00                 
	STA $76,X                
	TXA                      
	ASL A                    
	PHA                      
	LDA #$10                 
	CPX #$00                 
	BEQ $9BE4                
	ASL A                    
	DEX                      
	BNE $9BE0                
	ORA soundArray_70               
	STA soundArray_70               
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
	LDA var_8F               
	BNE doneWithThisRoutine  
	LDA #$01                 
	STA $8E                  
	LDA soundArray_70               
	AND #$F0                 
	STA soundArray_70               
	LDA #$10                 
	LDX #$00                 
	LDY #$00                 
	loopSoundEffectSqW0:     
	BIT soundArray_70               
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
	TYA                      
	PHA                      
	TXA                      
	PHA                      
	LDA #$FF                 
	STA $90,X                
	LDA $9E84,Y              
	JSR $9C55                
	PLA                      
	TAX                      
	PLA                      
	TAY                      
	INY                      
	INX                      
	CPX #$04                 
	BNE $9C2C                
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
	BNE $9C6A                
	LDA #$01                 
	CPX #$00                 
	BEQ $9C63                
	ASL A                    
	DEX                      
	BNE $9C5F                
	EOR #$FF                 
	AND soundArray_70               
	STA soundArray_70               
	RTS                      
.endproc
;
; $9C6A
.proc UnknownSoundSub3
	CPX #$FF                 
	BNE $9C72                
	TAY                      
	LDX $9ED6,Y              
	ASL A                    
	TAY                      
	LDA #$00                 
	STA $72,X                
	LDA $9DB8,X              
	ORA soundArray_70               
	STA soundArray_70               
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
.proc UnknownSoundSub2
	PHA                      
	LDA soundArray_70               
	AND #$0F                 
	BNE $9C92                
	PLA                      
	RTS                      
.endproc
;
; $9C9A
.proc DoSomethingWithSound_2
	PHA                      
	TXA                      
	PHA                      
	TYA                      
	PHA                      
	LDA soundArray_70               
	AND #$F0                 
	STA soundArray_70               
	LDA #$FF                 
	LDX #$00                 
	loopZeroOut_90_to_93:    
	STA $90,X                
	INX                      
	CPX #$04                 
	BNE loopZeroOut_90_to_93 
	LDA soundArray_70               
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
	LDA soundArray_70               
	AND #$0F                 
	STA soundArray_70               
	LDA #$FF                 
	LDX #$04                 
	STA $90,X                
	INX                      
	CPX #$08                 
	BNE $9D07                
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