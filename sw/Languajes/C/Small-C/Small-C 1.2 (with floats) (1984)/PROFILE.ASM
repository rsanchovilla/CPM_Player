; NAME...
;	PROFILE
;
; PURPOSE...
;	Count calls to each function, report number of calls
;	at exit() time, enable walkback trace on errors.
;
;	Exported symbols...
;
	GLOBAL	CCREGIS		;entering a function
	GLOBAL	CCLEAVI		;leaving a function
	GLOBAL	CCCALLS		;report calls to functions
;
;	Imported symbols...
;
	GLOBAL	QPUTS
	GLOBAL	QPUTCHAR
	GLOBAL	CURRENT		;points to stack frame for
;					current function
	GLOBAL	CCCAR		;like CAR() in LISP
	GLOBAL	CCCDR		;like CDR() in LISP
;
;	Entering new function...add a link to the previous one
;
;		register()
;			{de = *sp++;
CCREGIS: POP	DE
;			*--sp = current;
	LD	HL,(CURRENT)
	PUSH	HL
;			current=sp;
	LD	HL,0
	ADD	HL,SP
	LD	(CURRENT),HL
;			hl=*(current+1);
	CALL	CCCDR
;			++(hl-3);  /* 3 byte integer */
	DEC	HL
	DEC	HL
	DEC	HL
	CALL	CINCREM
	CALL	C,CINCREM
	CALL	C,CINCREM
CCREG2:
;			*--sp = de;
;			return;
	EX	DE,HL
	JP	(HL)
;
CINCREM: LD	A,(HL)
	ADD	A,1
	DAA
	LD	(HL),A
	INC	HL
	RET
;
;	leaving a function...remove a link
;
;			current=*current
CCLEAVI: EX	DE,HL		     ;save function value if any
	LD	HL,(CURRENT)
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	LD	(CURRENT),HL
	EX	DE,HL			 ;restore function value
	RET
;
;	report the function calls, called before exit()
;			calls(p) int *p;
CCCALLS: PUSH	HL
;			{	puts("calls\tfunction\n");
	LD	HL,CMSG
	PUSH	HL
	CALL	QPUTS
	POP	HL
;				while(p)
	POP	HL
CCCAL2: LD	A,L
	OR	H
	RET	Z
;					{puts(p+5);
	LD	(POINT),HL
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	PUSH	HL
	CALL	QPUTS
	POP	HL
	LD	HL,9
;					putchar('\t');
	PUSH	HL
	CALL	QPUTCHAR
	POP	HL
;					ptn(p+4);
	LD	HL,(POINT)
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	CALL	CCPTN
;					putchar('\n');
	LD	HL,13
	PUSH	HL
	CALL	QPUTCHAR
	POP	HL
;					p=*p;
	LD	HL,(POINT)
	CALL	CCCAR
;					}
	JP	CCCAL2
;			}
;			ptn(x) char *x;
;			{	c=' '-'0';
CCPTN:	LD	C,' '-'0'
;				ptb(x);ptb(x);ptb(x);
	CALL	CCPUTB
	CALL	CCPUTB
;						fall into...
;			}
;			ptb(y) char *y;
;			{	ptnib((*x)>>4);
CCPUTB:	LD	A,(HL)
	RRA
	RRA
	RRA
	RRA
	CALL	CCPTNIB
;				ptnib(*x--);
;			}
	LD	A,(HL)
	CALL	CCPTNIB
	DEC	HL
	RET
;			ptnib(z) char (z);
;			{	x=x&15;
CCPTNIB: AND	0FH
;				if(x)	c=0;
;				else	x=c;
	JP	NZ,CCP33
	LD	A,C
	DB	0C2H	;jp nz, (skips 2 bytes)
CCP33:	LD	C,0
;				putchar(x+'0');
	ADD	A,'0'
	PUSH	DE	;save...
	PUSH	BC
	PUSH	HL
	LD	L,A
	LD	H,0
	PUSH	HL
	CALL	QPUTCHAR
	POP	HL
	POP	HL	;recover...
	POP	BC
	POP	DE
;			}
	RET
;
CMSG:	DB	'function  calls',13,0
POINT:	DW	0
