*	SUBMIT - EXECUTE COMMAND FILES
*
*	THIS PROGRAM PROVIDES A COMMAND FILE
*	EXECUTION (SUBMIT) CAPABILITY FOR THE
*	HRUN HDOS EMULATION SYSTEM.  TO USE IT,
*	A COMMAND FILE CONSISTING OF COMMANDS TO
*	BE EXECUTED MUST BE WRITTEN USING A TEXT
*	EDITOR.  THEN THE COMMAND FILE IS EXECUTED
*	WITH
*
*	>SUBMIT DEV:FNAME [parm1 ... parmn]
*
*	IF COMMANDS ARE TO BE PASSED ON TO A
*	PROGRAM, THEY MUST BE ALL INCLUDED ON ONE
*	LINE IN THE COMMAND FILE, WITH SEMICOLONS
*	(;) SEPARATING THE INDIVIDUAL COMMANDS.
*	THE SEMICOLONS WILL BE CONVERTED TO NEW-
*	LINE CHARACTERS BY SUBMIT.

*	BY P. SWAYNE, HUG 30-DEC-82

	XTEXT	HOSDEF
	XTEXT	HOSEQU
$DADA	EQU	30072A
$CDEHL	EQU	30216A
$CHL	EQU	30224A
$TYPTX	EQU	31136A
S.CUSOR	EQU	20D8H		CURSOR POSITION

*	HRUN EQUIVALENCES

INCNT	EQU	103H		INPUT CHARACTER COUNT
INBUF	EQU	104H		INPUT BUFFER

CMDPTR	EQU	2017H		COMMAND POINTER (FORMERLY TAPE CHECKSUM)
CMDEND	EQU	2019H		COMMAND END (FORMERLY TAPE ERROR EXIT)

	ORG	USERFWA

START	LXI	H,0
	DAD	SP		FIND STACK
	MOV	A,L
	CPI	200Q		ANY ARGUMENT?
	JZ	CONT		NO, WE ARE EXECUTING A FILE
	CALL	SOB		SKIP BLANKS
	SHLD	PARADR		SAVE PARAMETER ADDRESS
	LXI	D,DEFALT	POINT TO DEFAULTS
	XRA	A
	SCALL	.OPENR		TRY TO OPEN COMMAND FILE
	JC	ERROR		CAN'T DO IT
	LXI	H,BUFFER	PUT COMMAND FILE HERE
	SHLD	CMDPTR		SET UP COMMAND POINTER
	XCHG			DE = BUFFER
	LXI	B,1000H		OUGHT TO BE ENOUGH
	XRA	A
	SCALL	.READ		READ IN COMMAND FILE
	XCHG			HL = NEXT UNUSED ADDRESS
	SHLD	CMDEND		SAVE END OF COMMANDS ADDR
	PUSH	PSW		SAVE FLAGS
	PUSH	B		SAVE UNUSED COUNT
	XRA	A
	SCALL	.CLOSE		CLOSE COMMAND FILE
	POP	B
	POP	PSW
	JC	GOTCMD		GOT IT
	CALL	$TYPTX
	DB	10,7,'ERROR - Command file too big.',8AH
	XRA	A
	SCALL	.EXIT		RETURN TO HDOS
GOTCMD	CPI	1		EOF?
	JNZ	ERROR		NO, ERROR
	MOV	H,B
	MOV	L,C		GET UNUSED BYTE COUNT
	CALL	$CHL		COMPLEMENT IT
	XCHG			PUT IT IN DE
	LXI	H,1000H		GET OUR LOAD SIZE
	DAD	D		SUBTRACT UNUSED
	SHLD	SIZE		SAVE INPUT FILE SIZE
	LHLD	PARADR		GET PARAMETER ADDRESS
FPAR	MOV	A,M		FIND END OF FILE NAME
	ORA	A		END?
	JZ	FPAR1		YES
	CPI	' '		END?
	JZ	FPAR1		YES
	INX	H		ELSE, INCREMENT POINTER
	JMP	FPAR
FPAR1	CALL	SOB		SKIP BLANKS
	SHLD	PARADR		SAVE START OF PARAMETERS
	LXI	H,SUBSUB	POINT TO SUB.SUB
	LXI	D,DEFALT
	XRA	A
	SCALL	.OPENW		OPEN FOR WRITE
	JC	ERROR
WLOOP	LHLD	BUFPTR		GET BUFFER POINTER
	MOV	A,M		GET INPUT CHARACTER
	INX	H
	SHLD	BUFPTR		UPDATE BUFFER POINTER
	ORA	A
	JZ	WEND		END OF INPUT FILE
	MOV	B,A		SAVE CHARACTER
	LHLD	SIZE		GET SIZE
	MOV	A,H
	ORA	L		TEST FOR DONE
	JZ	WEND
	DCX	H		DECREMENT IT
	SHLD	SIZE
	MOV	A,B		RESTORE CHARACTER
	CPI	'$'		PARAMETER MARKER?
	JNZ	WCHR		NO, WRITE CHARACTER
	LHLD	BUFPTR
	MOV	A,M		ELSE, GET NEXT CHARACTER
	INX	H
	SHLD	BUFPTR
	MOV	B,A		SAVE CHARACTER
	LHLD	SIZE
	MOV	A,H
	ORA	L
	JZ	WEND
	DCX	H
	SHLD	SIZE
	MOV	A,B
	CPI	'$'		ANOTHER DOLLAR?
	JZ	WCHR		YES, WRITE A DOLLAR
	SUI	'0'		ELSE, REMOVE ASCII BIAS
	JC	BADPAR		BAD PARAMETER
	CPI	10		MORE THAN 9
	JC	WLOOP1
BADPAR	CALL	$TYPTX
	DB	0AH,'ERROR - Bad parameter.',8AH
	JMP	CONTEND
NFPAR	CALL	$TYPTX
	DB	0AH,'ERROR - Not enough parameters.',8AH
	JMP	CONTEND
WLOOP1	MOV	B,A		SAVE PAR. NO. IN B
	LHLD	PARADR		GET PARAMETER ADDRESS
	DCR	B		FIRST PARAMETER?
	JZ	WLOOP4		YES, GET IT
WLOOP2	CALL	SOB		SKIP BLANKS
WLOOP3	MOV	A,M
	ORA	A
	JZ	NFPAR		NOT ENOUGH PARMS.
	CPI	' '
	INX	H
	JNZ	WLOOP3		FIND NEXT SPACE
	DCR	B		FOUND OURS?
	JNZ	WLOOP2
	CALL	SOB		SKIP BLANKS
WLOOP4	MOV	A,M		GET A CHARACTER
	ORA	A		END OF PARAMETER?
	JZ	WLOOP
	CPI	' '
	JZ	WLOOP
	CALL	WCHAR		IF NOT, WRITE CHARACTER
	INX	H
	JMP	WLOOP4		CONTINUE UNTIL DONE
WCHR	CALL	WCHAR		WRITE CHARACTER
	JMP	WLOOP		LOOP UNTIL DONE
WCHAR	PUSH	H		SAVE REGISTERS
	PUSH	D
	PUSH	B
	PUSH	PSW
	LDA	CHRCNT		GET CHARACTER COUNTER
	LXI	H,WBUF		AND WRITE BUFFER
	CALL	$DADA		MOVE TO NEXT POSITION
	POP	PSW		GET CHARACTER TO WRITE
	MOV	M,A		PUT IT IN
	LDA	CHRCNT		GET CHARACTER COUNTER AGAIN
	INR	A		INCREMENT IT
	STA	CHRCNT
	JNZ	WCHARX		BUFFER NOT FULL
	LXI	D,WBUF		FILE IS HERE
	LXI	B,256		WRITE ONE SECTOR
	XRA	A
	SCALL	.WRITE		WRITE SUB.SUB FILE
	JC	ERROR
WCHARX	POP	B		RESTORE REGISTERS
	POP	D
	POP	H
	RET
WEND	CALL	WCHAR		WRITE TRAILING ZERO
	LDA	CHRCNT		GET CHARACTER COUNTER
	ORA	A		INCOMPLETE BUFFER?
	JZ	WEND1		NO, DO NOT WRITE
	LXI	D,WBUF		ELSE, WRITE BUFFER
	LXI	B,256
	XRA	A
	SCALL	.WRITE
	JC	ERROR
WEND1	XRA	A
	SCALL	.CLOSE		CLOSE SUB.SUB FILE
	JC	ERROR

CONT	LHLD	CMDPTR		GET COMMAND POINTER
	XCHG			IN DE
	LHLD	CMDEND		AND END OF COMMANDS
	CALL	$CDEHL		COMPARE
	JZ	CONTEND		END OF COMMANDS
	LXI	H,SUBSUB	POINT TO SUB.SUB
	LXI	D,DEFALT
	XRA	A
	SCALL	.OPENR		OPEN FOR READ
	JNC	CONTA		GOOD OPEN
CONTR	CALL	$TYPTX
	DB	10,7,'ERROR - Internal command file cannot be read.',8AH
	XRA	A
	SCALL	.EXIT
CONTA	XRA	A
	LXI	D,BUFFER
	SCALL	.READ		READ IN INTERNAL FILE
	PUSH	PSW		SAVE FLAGS
	XRA	A
	SCALL	.CLOSE		CLOSE INTERNAL FILE
	POP	PSW
	CPI	1		EOF?
	JNZ	CONTR		NO, ERROR
CONT1	MVI	C,0		CLEAR QUOTE FLAG
	LDA	S.CUSOR		GET CURSOR POSITION
	CPI	1		IN FIRST LINE?
	JZ	CONT1A		YES
	MVI	A,10		ELSE, PRINT NEW LINE
	SCALL	.SCOUT
CONT1A	MVI	A,'>'
	SCALL	.SCOUT		PRINT PROMPT
	LHLD	CMDPTR		GET COMMAND POINTER
	MVI	B,0		CLEAR A COUNTER
	LXI	D,INBUF		POINT TO INPUT BUFFER
	MOV	A,M		GET FIRST CHARACTER
	CPI	27H		"'"?
	JNZ	CONTLP		NO
	INX	H		SKIP QUOTE
	MVI	C,1		FLAG QUOTE
CONTLP	MOV	A,M		GET A CHARACTER
	ORA	A		END OF COMMANDS?
	JZ	CONTEND		YES
	CPI	10		NEW LINE?
	PUSH	PSW		SAVE IT
	JNZ	CONT1B		NOT NEW LINE
	MVI	A,0DH		ELSE, REPLACE WITH CR
CONT1B	SCALL	.SCOUT		PRINT CHARACTER
	POP	PSW		RESTORE ORIGINAL CHARACTER
	CPI	';'		SEMICOLON?
	JNZ	CONT1C		NO
	MVI	A,10		REPLACE WITH NEW-LINE
CONT1C	CPI	'^'		CONTROL CHARACTER WANTED?
	JNZ	CONT1D		NO
	INX	H		ELSE, GET NEXT CHARACTER
	MOV	A,M
	ANI	5FH		CAPITALIZE
	SCALL	.SCOUT		PRINT CHARACTER
	SUI	40H		REMOVE ASCII BIAS
CONT1D	STAX	D		STORE CHARACTER
	MOV	A,M		GET CHARACTER AGAIN
	INX	D		INCREMENT POINTERS
	INX	H
	INR	B		AND COUNTER
	CPI	10		END OF ENTRY?
	JNZ	CONTLP		IF NOT, LOOP
	SHLD	CMDPTR		ELSE, UPDATE COMMAND POINTER
	MOV	A,C		GET QUOTE FLAG
	ORA	A		IS IT SET?
	JNZ	CONT1		IF SO, GET NEXT LINE
	MOV	A,B		GET COUNT
	STA	INCNT		SET IT IN HRUN
	MVI	A,1
	STA	S.CUSOR		SHOW CUSOR IN FIRST COLUMN
	XRA	A
	SCALL	.EXIT		AND RETURN TO HRUN
CONTEND	LXI	H,SUBSUB	POINT TO SUB.SUB
	LXI	D,DEFALT
	SCALL	.DELET		DELETE INTERNAL FILE
	CALL	$TYPTX
	DB	'End of SUBMIT file.',8AH
	XRA	A
	SCALL	.EXIT

SOB	MOV	A,M		SKIP BLANKS
	CPI	' '
	RNZ
	INX	H
	JMP	SOB

ERROR	PUSH	PSW		SAVE ERROR CODE
	CALL	$TYPTX
	DB	10,7,'ERROR -',' '+80H
	POP	PSW
	MVI	H,10		TRAILING CHARACTER
	SCALL	.ERROR		PRINT ERROR
	SCALL	.CLRCO		CLEAR OUT ANY OTHER COMMANDS
	XRA	A
	SCALL	.EXIT

PARADR	DW	0
SIZE	DW	0
CHRCNT	DB	0
BUFPTR	DW	BUFFER
SUBSUB	DB	'SUB',0
DEFALT	DB	'SY0SUB'

WBUF	EQU	*		WRITE BUFFER
BUFFER	EQU	*+256		BUFFER STARTS HERE
	END	START
                                                                                                                                                                                                                                      