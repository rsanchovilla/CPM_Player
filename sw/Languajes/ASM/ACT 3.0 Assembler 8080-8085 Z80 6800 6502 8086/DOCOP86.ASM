	TITLE	'ACT 8086/88 Alphabetic Mnemonic List.'
;	DOCOP86.asm
;	80-08-28, seh.
byte	EQU	  -120	; Byte value
disp8	EQU	   88h	; 08-bit Displacement
disp16	EQU	 6666h	; 16-bit Displacement
memref	EQU	0ddddh	; Memory Reference
NewIP	EQU	0bbbbh	; IP value for long JMP/CALL
NewCS	EQU	0cccch	; CS value for long JMP/CALL
port	EQU	   33h	; Port Address
word	EQU	0faaah	; Word value
; Segment Override Prefix
	$CS		; Code  Segment
	$DS		; Data  Segment
	$ES		; Extra Segment
	$SS		; Stack Segment
; Unpacked BCD Arithmetic
	AAA		; Ascii Adjust for Addition
	AAD		; Ascii Adjust for Divide
	AAM		; Ascii Adjust for Multiply
	AAS		; Ascii Adjust for Subtract
; Add with Carry (16bit)
	ADC	BX,AX
	ADC	AX,#word	; special AX/AL form
	ADC	BX,#word
	ADC	BX,#byte	; byte is sign-extended to word
	ADC	BX,[memref]
	ADC	[memref],BX
	ADC	[memref],#word
; (8bit)
	ADC	AL,AH
	ADC	AL,#byte	; special AX/AL form
	ADC	BL,#byte
	ADC	AL,[memref]
	ADC	[memref],AL
	ADCB	[memref],#byte	; "B" suffix required
; Add (16bit)
	ADD	BX,AX
	ADD	AX,#word	; special AX/AL form
	ADD	BX,#word
	ADD	BX,#byte	; byte is sign-extended to word
	ADD	BX,[memref]
	ADD	[memref],BX
	ADD	[memref],#word
; (8bit)
	ADD	AL,AH
	ADD	AL,#byte	; special AX/AL form
	ADD	BL,#byte
	ADD	AL,[memref]
	ADD	[memref],AL
	ADDB	[memref],#byte	; "B" suffix required
; Logical AND (16bit)
	AND	BX,AX
	AND	AX,#word	; special AX/AL form
	AND	BX,#word
	AND	BX,[memref]
	AND	[memref],BX
; (8bit)
	AND	AL,AH
	AND	AL,#byte	; special AX/AL form
	AND	BL,#byte
	AND	AL,[memref]
	AND	[memref],AL
	ANDB	[memref],#byte	; "B" suffix required
; Call (intrasegment)
	CALL	Fwdref	; IP relative CALL
	CALL	BX	; call address in BX
	CALL	[memref] ; call 16bit address located at [memref]
; Call (intersegment)
	CALL	NewIP,NewCS
	CALLL	[memref]	; "L" suffix required
;	CALLL	BX		; Illegal
; Convert Byte to Word
	CBW
; Clear Carry
	CLC
; Clear Direction
	CLD
; Clear Interrupt
	CLI
; Complement Carry
	CMC
; Compare String
	CMPSB		; byte
	CMPS		; word
; Compare (16bit)
	CMP	BX,AX
	CMP	AX,#word	; special AX/AL form
	CMP	BX,#word
	CMP	BX,#byte	; byte is sign-extended to word
	CMP	BX,[memref]
	CMP	[memref],BX
	CMP	[memref],#word
; (8bit)
	CMP	AL,AH
	CMP	AL,#byte	; special AX/AL form
	CMP	BL,#byte
	CMP	AL,[memref]
	CMP	[memref],AL
	CMPB	[memref],#byte	; "B" suffix required
; Convert Word to Doubleword
	CWD
; Decimal Adjust for Add
	DAA
; Decimal Adjust for Subtract
	DAS
; Decrement (16bit)
	DEC	AX
	DEC	[memref]
; (8bit)
	DEC	AL
	DECB	[memref] ; "B" suffix required
; Unsigned Division (32bit/16bit)
	DIV	BX	; AX := DXAX/BX, DX := DXAX mod BX
	DIV	[memref]
; (16bit/8bit)
	DIV	BL	; AL := AX/BL, AH := AX mod BL
	DIVB	[memref] ; "B" suffix required
; Halt
	HALT
	HLT
; Integer Divide (32bit/16bit)
	IDIV	BX	; AX := DXAX div BX, DX := DXAX mod BX
	IDIV	[memref]
; (16bit/8bit)
	IDIV	BL	; AL := AX div BL, AH := AX mod BL
	IDIVB	[memref] ; "B" suffix required
; Integer Multiply (16bit*16bit)
	IMUL	BX	; DXAX := AX*BX
	IMUL	[memref]
; (8bit*8bit)
	IMUL	BL	; AX := AL*BL
	IMULB	[memref] ; "B" suffix required
; Input (16bit)
	IN	port
	IN	DX
; (8bit)
	INB	port	; "B" suffix required
	INB	DX	; "B" suffix required
	INB		; same as "INB DX"
; Increment (16bit)
	INC	AX
	INC	[memref]
; (8bit)
	INC	AL
	INCB	[memref]	; "B" suffix required
; General Interrupt
	INT	7	; interrupt #7
	INT	#7	; ...equivalent form
	INT	3	; special 1byte form
	INT		; ...equivalent form
; Interrupt on Overflow
	INTO
; Return from Interrupt
	IRET
; Conditional Jumps
:short:
	JA	:short	; Above
	JAE	:short	; Above or Equal
	JB	:short	; Below
	JC	:short	; Carry (same as Below)
	JBE	:short	; Below or Equal
	JCXZ	:short	; CX is Zero
	JE	:short	; Equal
	JG	:short	; Greater
	JGE	:short	; Greater or Equal
	JL	:short	; Less
	JLE	:short	; Less or Equal
	JMPS	:short	; Unconditional
; Jump (intrasegment)
	JMP	:short	; short form, only to back-references
	JMP	Fwdref	; long form, all forward references
	JMP	BX	; jump to location in BX
	JMP	[memref] ; jump to address specified @ [memref]
; Jump (intersegment)
	JMP	NewIP,NewCS	; "L" suffix optional
	JMPL	[memref]	; "L" suffix required
;	JMPL	BX		; Illegal (registers disallowed)
; Conditional Jumps (continued)
	JNA	:short	; Not Above
	JNAE	:short	; Not Above or Equal
	JNB	:short	; Not Below
	JNC	:short	; No carry (Not below)
	JNBE	:short	; Not Below or Equal
	JNE	:short	; Not Equal
	JNG	:short	; Not Greater
	JNGE	:short	; Not Greater or Equal
	JNL	:short	; Not Less
	JNLE	:short	; Not Less or Equal
	JNO	:short	; Not Overflow
	JNP	:short	; Not Parity
	JNS	:short	; Not Sign
	JNZ	:short	; Not Zero
	JO	:short	; Overflow
	JP	:short	; Parity
	JPE	:short	; Parity Even
	JPO	:short	; Parity Odd
	JS	:short	; Sign
	JZ	:short	; Zero
; Load AH from Flags
	LAHF
; General Load (16bit)
; Form of opcode is "LD Destination,Source"
; "Destination" must be an 8086 register
; "Source" must be a memory reference "[memref]" or "#expr"
; "Source" cannot be a register (use MOV instead)
	LD	AX,[memref]	; special AX/AL form
	LD	AX,memref	; ...equivalent form
	LD	AX,#word	; #immediate value
	LD	SS,[memref]	; segment register
;	LD	CS,[memref]	; Illegal (use long JMP)
;	LD	SS,#word	; seg. registers cannot use "#"
; Load DS (and register) with (32bit) pointer
	LDS	AX,[memref]
	LDS	SI,[memref]
; Load Effective Address (16bit) to register
	LEA	AX,[memref]
; Load ES (and register) with (32bit) pointer
	LES	AX,[memref]
	LES	DI,[memref]
; Bus Lock (instruction prefix)
	LOCK
; Load String
	LODS	; word
	LODSB	; byte
; Loop (if <condition>, decrement CX and JMP; else continue)
:top:
	LOOP	:top	; until CX = 0
	LOOPE	:top	; Equal
	LOOPNE	:top	; Not Equal
	LOOPNZ	:top	; Not Zero
	LOOPZ	:top	; Zero
; Move String
	MOVS	; word
	MOVSB	; byte
; General MOV (16bit)
; Form of opcode is "MOV Destination,Source"
; "Destination" and "Source" must be 8086 registers
; Registers must be same size ("8bit,8bit" or "16bit,16bit")
; Cannot MOV between segment registers (cannot "MOV ES,DS")
	MOV	AX,BX
	MOV	AX,SS
	MOV	SS,AX
;	MOV	CS,AX	; Illegal (use JMPL to alter CS reg)
;	MOV	DS,SS	; Illegal (cannot use 2 segment regs)
; (8bit)
	MOV	AL,BL
;	MOV	AL,SS	; Illegal (registers must be same width)
; Unsigned Multiply (16bit*16bit)
	MUL	BX	; DXAX := AX * BX
	MUL	[memref]
; (8bit*8bit)
	MUL	BL	; AX := AL * BL
	MULB	[memref] ; "B" suffix required
; Negate (16bit) ("2s complement")
	NEG	AX	; AX := -AX
; (8bit)
	NEG	AL	; AL := -AL
	NEGB	[memref] ; "B" suffix required
; No Operation
	NOP		; equivalent to "XCHG AX,AX"
; Not (16bit) ("1s complement")
; does not affect flags
	NOT	AX	; AX := ;AX
; (8bit)
	NOT	AL	; AL := ;AL
	NOTB	[memref] ; "B" suffix required
; Logical OR (16bit)
	OR	BX,AX
	OR	AX,#word	; special AX/AL form
	OR	BX,#word
	OR	BX,[memref]
	OR	[memref],BX
; (8bit)
	OR	AL,AH
	OR	AL,#byte	; special AX/AL form
	OR	BL,#byte
	OR	AL,[memref]
	OR	[memref],AL
	ORB	[memref],#byte	; "B" suffix required
; Output (16bit)
	OUT	port
	OUT	DX	; variable port
	OUT		; ...equivalent form
; (8bit)
	OUTB	port
	OUTB	DX
	OUTB
; Pop (16bit only)
	POP	CX
;	POP	CS	; Illegal (use RETL)
	POP	SS	; dangerous, but legal
	POP	ES
	POP	[memref]
; Pop Flags
	POPF
; Push (16bit only)
	PUSH	BX
	PUSH	CS	; "POP CS" is illegal
	PUSH	[memref]
; Push Flags
	PUSHF
; Rotate Left through Carry (16bit)
	RCL	AX	;count = 1
	RCL	AX,CL	;count in CL
	RCL	[memref]
	RCL	[memref],CL
; (8bit)
	RCL	AL
	RCL	AL,CL
	RCLB	[memref] ; "B" suffix required
	RCLB	[memref],CL
; Rotate Right through Carry (16bit)
	RCR	AX	;count = 1
	RCR	AX,CL	;count in CL
	RCR	[memref]
	RCR	[memref],CL
; (8bit)
	RCR	AL
	RCR	AL,CL
	RCRB	[memref] ; "B" suffix required
	RCRB	[memref],CL
; Repeat (string operation)
	REP	; until CX = 0
	REPE	; Equal
	REPNE	; Not Equal
	REPNZ	; Not Zero
	REPZ	; Zero
; Return (intrasegment)
	RET
	RET	word	; SP := SP + word
; (intersegment)
	RETL
	RETL	word	; SP := SP + word
; Rotate Left (16bit)
	ROL	AX	;count = 1
	ROL	AX,CL	;count in CL
	ROL	[memref]
	ROL	[memref],CL
; (8bit)
	ROL	AL
	ROL	AL,CL
	ROLB	[memref] ; "B" suffix required
	ROLB	[memref],CL
; Rotate Right (16bit)
	ROR	AX	;count = 1
	ROR	AX,CL	;count in CL
	ROR	[memref]
	ROR	[memref],CL
; (8bit)
	ROR	AL
	ROR	AL,CL
	RORB	[memref] ; "B" suffix required
	RORB	[memref],CL
; Store AH to Flags
	SAHF
; Shift Arithmetic Left	(16bit)
	SAL	AX	;count = 1
	SAL	AX,CL	;count in CL
	SAL	[memref]
	SAL	[memref],CL
; (8bit)
	SAL	AL
	SAL	AL,CL
	SALB	[memref] ; "B" suffix required
	SALB	[memref],CL
; Shift Aritmetic Right (16bit)
	SAR	AX	;count = 1
	SAR	AX,CL	;count in CL
	SAR	[memref]
	SAR	[memref],CL
; (8bit)
	SAR	AL
	SAR	AL,CL
	SARB	[memref] ; "B" suffix required
	SARB	[memref],CL
; Subtract with Borrow (16bit)
	SBB	BX,AX
	SBB	AX,#word	; special AX/AL form
	SBB	BX,#word
	SBB	BX,#byte	; byte is sign-extended to word
	SBB	BX,[memref]
	SBB	[memref],BX
	SBB	[memref],#word
; (8bit)
	SBB	AL,AH
	SBB	AL,#byte	; special AX/AL form
	SBB	BL,#byte
	SBB	AL,[memref]
	SBB	[memref],AL
	SBBB	[memref],#byte	; "B" suffix required
; Scan String
	SCAS	; word
	SCASB	; byte
; Shift Logical Left (16bit) (same as SAL)
	SHL	AX	;count = 1
	SHL	AX,CL	;count in CL
	SHL	[memref]
	SHL	[memref],CL
; (8bit)
	SHL	AL
	SHL	AL,CL
	SHLB	[memref] ; "B" suffix required
	SHLB	[memref],CL
; Shift Logical Right (16bit)
	SHR	AX	;count = 1
	SHR	AX,CL	;count in CL
	SHR	[memref]
	SHR	[memref],CL
; (8bit)
	SHR	AL
	SHR	AL,CL
	SHRB	[memref] ; "B" suffix required
	SHRB	[memref],CL
; Set Carry
	STC
; Set Direction
	STD
; Set Interrupt
	STI
; Store String
	STOS	; word
	STOSB	; byte
; General Store (16bit) (no pun intended)
; Form of opcode is "STO Source,Destination"
; "Source" must be an 8086 register, or "#expression"
; "Destination" must be a memory reference ("[memref]")
; "Destination" cannot be an 8086 register
	STO	AX,[memref]	; special AX/AL form
	STO	AX,memref	; ...equivalent form (8080 style)
	STO	BX,[memref]
	STO	#word,[memref]
; (8bit)
	STO	AL,[memref]	; special AX/AL form
	STO	AL,memref	; ...equivalent form (8080 style)
	STO	BL,[memref]
	STOB	#byte,[memref]	; "B" suffix required
; Subtract (16bit)
	SUB	BX,AX
	SUB	AX,#word	; special AX/AL form
	SUB	BX,#word
	SUB	BX,#byte	; byte is sign-extended to word
	SUB	BX,[memref]
	SUB	[memref],BX
	SUB	[memref],#word
; (8bit)
	SUB	AL,AH
	SUB	AL,#byte	; special AX/AL form
	SUB	BL,#byte
	SUB	AL,[memref]
	SUB	[memref],AL
	SUBB	[memref],#byte	; "B" suffix required
; Logical Test (16bit) (set flags like "AND", no result)
	TEST	BX,AX
	TEST	AX,#word	; special AX/AL form
	TEST	BX,#word
	TEST	BX,[memref]
	TEST	[memref],BX
; (8bit)
	TEST	AL,AH
	TEST	AL,#byte	; special AX/AL form
	TEST	BL,#byte
	TEST	AL,[memref]
	TEST	[memref],AL
	TESTB	[memref],#byte	; "B" suffix required
; Wait for external device
	WAIT
; Exchange (16bit)
	XCHG	AX,BX	; special AX form
	XCHG	BX,CX
; (8bit)
	XCHG	AL,BL
	XCHG	AL,[memref]
; Translate (AL := [BX+AL])
	XLAT
; Logical XOR (16bit)
	XOR	BX,AX
	XOR	AX,#word	; special AX/AL form
	XOR	BX,#word
	XOR	BX,[memref]
	XOR	[memref],BX
; (8bit)
	XOR	AL,AH
	XOR	AL,#byte	; special AX/AL form
	XOR	BL,#byte
	XOR	AL,[memref]
	XOR	[memref],AL
	XORB	[memref],#byte	; "B" suffix required
	TITLE	'Memory Reference Examples.'
; These examples demonstrate all possible 8086
; addressing modes and their associated ACT86 syntaxes.
; These examples use the INC opcode for demonstration purposes,
; but each example is a legal anyplace (except CALL/JMP/LD/STO)
; '[memref]' is demonstrated above.

; BP can be used with SI or DI and any displacement
; (The 8086 does not support a "[BP]" addressing mode:
; ACT86 will assemble "[BP+0]" instead.)
	INC	[BP]	; special case
	INC	[BP+disp8]
	INC	[BP+disp16]
	INC	[BP+DI]
	INC	[BP+DI+disp8]
	INC	[BP+DI+disp16]
	INC	[BP+SI]
	INC	[BP+SI+disp8]
	INC	[BP+SI+disp16]
; BX can be used with SI or DI and any displacement
	INC	[BX]
	INC	[BX+disp8]
	INC	[BX+disp16]
	INC	[BX+DI]
	INC	[BX+DI+disp8]
	INC	[BX+DI+disp16]
	INC	[BX+SI]
	INC	[BX+SI+disp8]
	INC	[BX+SI+disp16]
; DI can be used with BP or BX and any displacement
	INC	[DI]
	INC	[DI+disp8]
	INC	[DI+disp16]
	INC	[DI+BP]		;same as "[BP+DI]"
	INC	[DI+BP+disp8]	;(redundant)
	INC	[DI+BP+disp16]	;(redundant)
	INC	[DI+BX]		;same as "[BX+DI]"
	INC	[DI+BX+disp8]
	INC	[DI+BX+disp16]
; SI can be used with BP or BX and any displacement
	INC	[SI]
	INC	[SI+disp8]
	INC	[SI+disp16]
	INC	[SI+BP]
	INC	[SI+BP+disp8]
	INC	[SI+BP+disp16]
	INC	[SI+BX]
	INC	[SI+BX+disp8]
	INC	[SI+BX+disp16]
; a 16bit displacement can be used without a register
	INC	[memref]
; a 16bit expression will be interpreted as above
; (CALL and JMP interpret this form differently)
	INC	memref

Fwdref:	END
