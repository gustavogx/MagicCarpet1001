

.macro EnableScanlineIRQ
	sta $E001
.endmacro

.macro DisableScanlineIRQ
	sta $E000
.endmacro

.macro ReloadScanlineIRQ
	sta $C001
.endmacro

.macro LatchScanlineIRQ
	sta $C000
.endmacro

.macro AcknowledgeScanlineIRQ offset
	sta $E001	; acknowledge any pending interrupts
.endmacro

.macro WaitNextScanline
;	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
.endmacro

.define VERTICAL 0
.define HORIZONTAL 1
.macro SetMirroring arg
	lda #arg
	sta $A000	; Vertical Mirroring 
.endmacro

.macro DisableSRAM
	lda #$00
	sta $A001	; Disable SRAM
.endmacro

.proc InitializeMMC3

	ldx #$00
	jsr MMC3CHRBankSwitching_X

	ldx #$02
	jsr Bank_X_to_PRG_0

	ldx #$03
	jsr Bank_X_to_PRG_1

	lda #$00
	sta $A000	; Vertical Mirroring 
	sta $A001	; Disable SRAM
	sta $E000   ; Disable IRQ
	rts
.endproc

.proc Bank_X_to_PRG_0

	lda #$06
	sta $8000
	stx $8001
	rts
.endproc

.proc Bank_X_to_PRG_1

	lda #$07
	sta $8000
	stx $8001
	rts
.endproc

; This is a temporary function to help port from mapper ines 003 to 004.
.proc MMC3CHRBankSwitching_X

	cpx #$00
	bne :+

	lda #$00 ; R0
	sta $8000
	lda #$00
	sta $8001

	lda #$01 ; R1
	sta $8000
	lda #$02
	sta $8001

	lda #$02 ; R2
	sta $8000
	lda #$04
	sta $8001

	lda #$03 ; R3
	sta $8000
	lda #$05
	sta $8001

	lda #$04 ; R4
	sta $8000
	lda #$06
	sta $8001

	lda #$05 ; R5
	sta $8000
	lda #$07
	sta $8001

	JMP :+++

	:
	cpx #$01
	bne :+

	lda #$00 ; R0
	sta $8000
	lda #$08
	sta $8001

	lda #$01 ; R1
	sta $8000
	lda #$0A
	sta $8001

	lda #$02 ; R2
	sta $8000
	lda #$0C
	sta $8001

	lda #$03 ; R3
	sta $8000
	lda #$0D
	sta $8001

	lda #$04 ; R4
	sta $8000
	lda #$0E
	sta $8001

	lda #$05 ; R5
	sta $8000
	lda #$0F
	sta $8001

	jmp :++

	:
	cpx #$02
	bne :+	

	lda #$00 ; R0
	sta $8000
	lda #$10
	sta $8001

	lda #$01 ; R1
	sta $8000
	lda #$12
	sta $8001

	lda #$02 ; R2
	sta $8000
	lda #$14
	sta $8001

	lda #$03 ; R3
	sta $8000
	lda #$15
	sta $8001

	lda #$04 ; R4
	sta $8000
	lda #$16
	sta $8001

	lda #$05 ; R5
	sta $8000
	lda #$17
	sta $8001

	:
	rts
.endproc
