/*
 *
 *		MACHINE  DEPENDENT  STUFF
 *
 *
 *		"run time" (for libc.rel)
 *
 *				C 1.2.0
 *
 */


/*	Bios entry points	*/
#define SELDSK		 9
#define SETTRK		10
#define SETSEC		11
#define SETDMA		12
#define READ		13
#define WRITE		14
#define SECTRAN		16

#define JMPLEN		 3		/* length of jmp instruction */

int *
bios(jmpnum,bc,de)	/* This version of bios() recognizes that SELDSK
			 * and SECTRAN return their values in HL not A and
			 * that SECTRAN is passed DE AND HL.
			 */
 char *jmpnum;
 int	bc,de;
{
	register int *p;

	p = JMPLEN * (jmpnum-1) + *(p = 1);

	return (jmpnum == SELDSK || jmpnum == SECTRAN)?
		ccall(p,0,0,bc,de):
		ccalla(p,0,0,bc,0);
}

/*
 * inp() and outp() are machine dependent. these are for 8080,Z80,8085 CPU'
 * They do not work in a split I&D enviornment, though they are ROMable.
 */
inp(port)
 char	port;
{
	char	a[3];

	a[0] = 0xDB;		/* 8080 in instr */
	a[1] = port;
	a[2] = 0xC9;		/* 8080 ret instr */
	return ccalla(a, 0, 0, 0, 0);
}

outp(port,c)
 char port, c;
{
	char	a[3];

	a[0] = 0xD3;		/* 8080 out instr */
	a[1] = port;
	a[2] = 0xC9;		/* 8080 ret */
	return ccall(a, 0, c, 0, 0);
}

#define	CLIB	1
#ifdef	CLIB
ccasl()
{
#asm
	XCHG
	MOV	A,E
	ORA	A
	RZ
C99:	DAD	H
	DCR	A
	JNZ	C99
#endasm
}

ccasr()
{
#asm
	XCHG		; rotate (not really asr)
	MOV	A,E
	ORA	A
	RZ
C99:	ORA	A
	MOV	A,H
	RAR
	MOV	H,A
	MOV	A,L
	RAR
	MOV	L,A
	DCR	E
	JNZ	C99
#endasm
}

ccneg()
{
#asm
	MOV	A,H
	CMA
	MOV	H,A
	MOV	A,L
	CMA
	MOV	L,A
	INX	H
#endasm
}

cccom()
{
#asm
	MOV	A,L
	CMA
	MOV	L,A
	MOV	A,H
	CMA
	MOV	H,A
#endasm
}

ccand()
{
#asm
	MOV	A,H
	ANA	D
	MOV	H,A
	MOV	A,L
	ANA	E
	MOV	L,A
#endasm
}

ccor()
{
#asm
	MOV	A,H
	ORA	D
	MOV	H,A
	MOV	A,L
	ORA	E
	MOV	L,A
#endasm
}

ccsub()
{
#asm
	MOV	A,E
	SUB	L
	MOV	L,A
	MOV	A,D
	SBB	H
	MOV	H,A
#endasm
}

ccxor()
{
#asm
	MOV	A,H
	XRA	D
	MOV	H,A
	MOV	A,L
	XRA	E
	MOV	L,A
#endasm
}

cceq()
{
#asm
	MOV	A,L
	SUB	E
	MOV	L,A
	MOV	A,H
	SBB	D
	ORA	L
	LXI	H,1
	RZ
	DCR	L
#endasm
}

ccne()
{
#asm
	MOV	A,L
	SUB	E
	MOV	L,A
	MOV	A,H
	SBB	D
	MOV	H,A
	ORA	L
	RZ
	LXI	H,1
#endasm
}

cclt()
{
#asm
	MOV	A,E
	SUB	L
	MOV	A,D
	SBB	H
	LXI	H,0
	RP
	INR	L
#endasm
}

ccgt()
{
#asm
	MOV	A,L
	SUB	E
	MOV	A,H
	SBB	D
	LXI	H,0
	RP
	INR	L
#endasm
}

ccge()
{
#asm
	MOV	A,E
	SUB	L
	MOV	A,D
	SBB	H
	LXI	H,1
	RP
	DCR	L
#endasm
}

ccle()
{
#asm
	MOV	A,L
	SUB	E
	MOV	A,H
	SBB	D
	LXI	H,1
	RP
	DCR	L
#endasm
}

ccult()
{
#asm
	MOV	A,E
	SUB	L
	MOV	A,D
	SBB	H
	LXI	H,1
	RC
	DCR	L
#endasm
}

ccugt()
{
#asm
	MOV	A,L
	SUB	E
	MOV	A,H
	SBB	D
	LXI	H,1
	RC
	DCX	H
#endasm
}

ccuge()
{
#asm
	MOV	A,E
	SUB	L
	MOV	A,D
	SBB	H
	LXI	H,0
	RC
	INR	L
#endasm
}

ccule()
{
#asm
	MOV	A,L
	SUB	E
	MOV	A,H
	SBB	D
	LXI	H,0
	RC
	INX	H
#endasm
}

brk()
{
#asm
EXT	CCNEG
EXT	EDATA
EXT	CCEDATA
	POP	D
	POP	H
	PUSH	D
	PUSH	H

	INR	H		; save 100h for misc
	CALL	CCNEG
	DAD	SP
	JNC	C1ERR

	POP	H
	PUSH	H
	LXI	D,EDATA
	MOV	A,L
	SUB	E
	MOV	L,A
	MOV	A,H
	SBB	D
	JC	C1ERR

	POP	H
	SHLD	CCEDATA
	POP	D
	PUSH	D
	PUSH	D
	LXI	H,0
	RET

C1ERR:	POP	D
	POP	D
	PUSH	D
	PUSH	D

CERROR: LXI	H,-1
#endasm
}

ccgint()
{
#asm
	MOV	E,M
	INX	H
	MOV	D,M
	XCHG
#endasm
}

ccpint()
{
#asm
	XCHG
	MOV	M,E
	INX	H
	MOV	M,D
	XCHG
#endasm
}

comlen()
{
#asm
	LHLD	80H	; Returns length of command line
	MVI	H,0
#endasm
}

ccudiv()
{
#asm
DIV0	EQU	0	; zero here turns off divide by 0 message

EXT	CCNEG


CCUDIV:	XRA	A	; clear S condition code
	JMP	CCDV9

PUBLIC	CCDIV
CCDIV:	CALL	CCDMSE	; de = de / hl; signed; S = f(de,hl)

CCDV9:	PUSH	B
	PUSH	PSW

	CALL	CCDV1
	XCHG
	POP	PSW
	POP	B
	RP
	CALL	CCNEG
	XCHG
	CALL	CCNEG
	XCHG
	RET

CCDV1:	MOV	A,H
	ORA	L
	JZ	CCDIV0

	MOV	A,H		; BC = -HL
	CMA
	MOV	B,A
	MOV	A,L
	CMA
	MOV	C,A
	INX	B
	LXI	H,0

	CALL	CCDV2
CCDV2:	MOV	A,D
	MOV	D,E
	MVI	E,8

CCDV3:	DAD	H
	JC	CCOVER
	ADD	A
	JNC	CCDV4
	INX	H

CCDV4:	PUSH	H
	DAD	B
	JC	CCDV5

		POP	H
		DCR	E
		JNZ	CCDV3
		MOV	E,A
		RET

CCDV5:	INX	SP
	INX	SP
	INR	A
	DCR	E
	JNZ	CCDV3
	MOV	E,A
	RET

CCOVER:	ADC	A
	JNC	CCOSUB
	INX	H

CCOSUB:	DAD	B
	DCR	E
	JNZ	CCDV3
	MOV	E,A
	RET

CCDMSE:	MOV	A,D
	XRA	H
	PUSH	PSW

	MOV	A,H
	RAL
	CC	CCNEG
	MOV	A,D
	RAL
	JNC	CCDMS1
	XCHG
	CALL	CCNEG
	XCHG
CCDMS1:	POP	PSW
	RET

CCDIV0	EQU	$
	IF DIV0
DIV0MSG:	DB	'Division by 0!',13,10,7,'$'
		LXI	D,DIV0MSG
		MVI	C,9		; Print string
		CALL	CCBDOS
	ENDIF
	LXI	D,0			; X / 0 == 0
	POP	B
#endasm
}

setexit()
{
#asm
EXT	CCEXPC

	LXI	H,2
	DAD	SP
	SHLD	CCEXPC+2
	POP	H
	SHLD	CCEXPC
	PUSH	H
	MOV	H,B
	MOV	L,C
	SHLD	CCEXPC+4
	LXI	H,0
#endasm
}

reset()
{
#asm
EXT	CCEXPC

	POP	D
	POP	D
	LHLD	CCEXPC+2	; could check for exitsp > current SP
	SPHL
	LHLD	CCEXPC
	PUSH	H
	LHLD	CCEXPC+4
	MOV	B,H
	MOV	C,L
	XCHG
#endasm
}

streq()
{
#asm
EXT	XXKLG

	PUSH	H
	MOV	H,B
	MOV	L,C
	SHLD	XXKLG	; bad kludge
	POP	H
	POP	B
	POP	D
	XTHL
	PUSH	B
	PUSH	B
	LXI	B,0
	JMP	CCLP

CCMORE:	INX	B
	INX	H
	INX	D

CCLP:	LDAX	D
	ORA	A
	JZ	CCOUT
	CMP	M
	JZ	CCMORE
	LXI	B,0

CCOUT:	PUSH	B
	LHLD	XXKLG
	MOV	B,H
	MOV	C,L
	POP	H
#endasm
}

bdos()
{
#asm
CCBDOS	EQU	5H

	MOV	H,B	; save b
	MOV	L,C
	POP	B	; pop return address
	POP	D	; pop new d value
	XTHL		; tos contains old b; h contains new b
	PUSH	B	; push return address
	MOV	B,H	; put b value where it belongs
	MOV	C,L
	PUSH	B

	CALL	CCBDOS
	POP	D
	POP	H
	POP	B

	PUSH	H	; restore stack for C
	PUSH	H
	PUSH	H

	MOV	D,A
	MOV	A,E
	CPI	12
	RZ
	CPI	24
	RZ
	CPI	27
	RZ
	CPI	29
	RZ
	CPI	31
	RZ

	MOV	L,D
	MVI	H,0	; should be a sign extend...
#endasm
}

cconst()
{
#asm
CCBDOS	EQU	5H

	PUSH	B	; save reg variable
	MVI	C,11	; bdos function number
	CALL	CCBDOS	; execute function
	MVI	H,0	; set up return value
	MOV	L,A
	POP	B	; restore register variable
#endasm
}

cconin()
{
#asm
CCBDOS	EQU	5H

	PUSH	B	; save reg variable
	MVI	C,1	; bdos function number
	CALL	CCBDOS	; execute function
	MVI	H,0	; set up retun value
	MOV	L,A
	POP	B	; restore register variable
#endasm
}

cconout()
{
#asm
CCBDOS	EQU	5H

	POP	H	; pop return addr
	POP	D	; pop parameter
	PUSH	D	; restore parameter
	PUSH	H	; and return address
	PUSH	B	; save register variable
	MVI	C,2	; bdos function number
	CALL	CCBDOS	; execute function
	POP	B	; restore register variable
#endasm
}

ccall()
{
#asm
	EXT	CCALLER

	PUSH	B
	CALL	CCALLER
	POP	B
#endasm
}

ccalla()
{
#asm
	EXT	CCALLER

	PUSH	B
	CALL	CCALLER
	POP	B
	MOV	L,A
	MVI	H,0
#endasm
}

ccaller()
{
#asm
	LXI	H,15	; get address to call
	DAD	SP
	MOV	B,M
	DCX	H
	MOV	C,M
	DCX	H
	PUSH	B	; and put on stack so we can ret to it.
	MOV	D,M	; move hl parm to de
	DCX	H
	MOV	E,M
	PUSH	D	; and push it
	DCX	H
			; blow off flags
	DCX	H
	MOV	A,M	; load a
	DCX	H
	MOV	B,M	; load bc
	DCX	H
	MOV	C,M
	DCX	H
	MOV	D,M	; load de
	DCX	H
	MOV	E,M
	POP	H	; pop hl off stack
;	RET		; jp *sp++
#endasm
}

setjmp()
{
#asm
EXT	CCLJRV
	POP	D
	POP	H
	PUSH	H
	PUSH	D

	MOV	M,C	; preserve reg var
	INX	H
	MOV	M,B
	INX	H

	XCHG		; preserve old sp
	LXI	H,2
	DAD	SP
	XCHG
	MOV	M,E
	INX	H
	MOV	M,D
	INX	H

	POP	D	; preserve ret addr
	PUSH	D
	MOV	M,E
	INX	H
	MOV	M,D
	LXI	H,0
#endasm
}

longjmp()
{
#asm
EXT	CCLJRV
	POP	PSW	; ret addr and we don't care
	POP	H	; state area
	POP	D	; return value
	SHLD	CCLJRV	; (kinda nasty)
	XCHG

	MOV	C,M	; fetch reg var
	INX	H
	MOV	B,M
	INX	H

	MOV	E,M	; fetch old sp
	INX	H
	MOV	D,M
	INX	H
	XCHG
	SPHL
	XCHG

	MOV	E,M	; fetch ret addr
	INX	H
	MOV	D,M
	PUSH	D
	LHLD	CCLJRV	; load return value from nasty place
#endasm
}

ccmult()
{
#asm
	PUSH	B
	XRA	A
	CMP	H
	JZ	CCEXCH
	CMP	L
	JZ	CCEXCH

CCM3:	MOV	B,H
	MOV	C,L
	MOV	A,E
	PUSH	D
	CALL	CCBMULT
	XTHL
	MOV	A,H
	CALL	CCBMULT
	MOV	H,L
	MVI	L,0
	POP	B
	DAD	B
	POP	B
	RET

CCEXCH:	XCHG
	JMP	CCM3


CCBMULT:LXI	H,0
	MVI	E,7
	ADD	A
	JC	CCM6
	RZ

CCM2:	JNC	CCM4
CCM6:	DAD	B

CCM4:	DAD	H
	ADC	A
	DCR	E
	JNZ	CCM2
	RNC
	DAD	B
#endasm
}

comline()
{
#asm
	LXI	H,81H	; Returns address of command line.
#endasm
}
#endif
	XCHG
	MOV	M,