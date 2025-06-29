	DSEG
.2:
	DS 4
	CSEG
	DSEG
.3:
	DW 0
	CSEG
	PUBLIC alloc_
alloc_:	CALL .sav##
	DW .4
	LXI H,8-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	INX H
	INX H
	INX H
	LXI D,2
	XCHG
	CALL .ur##
	INX H
	XCHG
	LXI H,0-.4
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LHLD .3
	XCHG
	LXI H,2-.4
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	MOV A,D
	ORA E
	JNZ .5
	LXI H,.2
	XCHG
	LXI H,2-.4
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	XCHG
	SHLD .3
	SHLD .2
	LXI H,1
	SHLD .2+2
.5:
	LXI H,2-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	JMP .7
.6:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,2-.4
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	mov h,b
	mov l,c
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.7:
	LXI H,2
	DAD B
	MOV E,M
	INX H
	MOV D,M
	LXI H,0-.4
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .uf##
	JZ .9
	LXI H,2
	DAD B
	MOV E,M
	INX H
	MOV D,M
	LXI H,0-.4
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .eq##
	JZ .10
	mov h,b
	mov l,c
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,4-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
	JMP .11
.10:
	LXI H,0-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	INX H
	POP D
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	XCHG
	CALL .sb##
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	LXI H,2
	DAD B
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DAD H
	DAD H
	MOV D,B
	MOV E,C
	DAD D
	MOV B,H
	MOV C,L
	LXI H,0-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,2
	DAD B
	MOV M,E
	INX H
	MOV M,D
.11:
	LXI H,2-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	SHLD .3
	MOV H,B
	MOV L,C
	LXI D,4
	DAD D
	RET
.9:
	MOV H,B
	MOV L,C
	XCHG
	LHLD .3
	CALL .eq##
	JZ .12
	LXI H,0-.4
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	FUNC	morecore_
	CALL morecore_
	POP D
	MOV B,H
	MOV C,L
	MOV A,H
	ORA L
	JNZ .13
	LXI H,0
	RET
.13:
.12:
	JMP .6
.8:
	RET
.4 EQU -4
	PUBLIC morecore_
morecore_:	CALL .sav##
	DW .14
	LXI H,8-.14
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DAD H
	DAD H
	PUSH H
	FUNC	xsbrk_
	CALL xsbrk_
	POP D
	MOV B,H
	MOV C,L
	LXI D,-1
	CALL .eq##
	JZ .15
	LXI H,0
	RET
.15:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,2-.14
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,8-.14
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,4-.14
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	INX H
	INX H
	POP D
	MOV M,E
	INX H
	MOV M,D
	LXI H,2-.14
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,4
	DAD D
	PUSH H
	FUNC	free_
	CALL free_
	POP D
	LHLD .3
	RET
.14 EQU -2
	PUBLIC free_
free_:	CALL .sav##
	DW .16
	LXI H,8-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,-16
	DAD D
	MOV B,H
	MOV C,L
	LHLD .3
	XCHG
	LXI H,2-.16
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	JMP .18
.17:
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	LXI H,2-.16
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.18:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,2-.16
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ug##
	JZ .20
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	MOV H,B
	MOV L,C
	POP D
	XCHG
	CALL .ul##
	JNZ .19
.20:
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,4-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	POP H
	CALL .uf##
	JZ .21
	MOV H,B
	MOV L,C
	XCHG
	LXI H,2-.16
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ug##
	JNZ .19
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	MOV H,B
	MOV L,C
	POP D
	XCHG
	CALL .ul##
	JNZ .19
.21:
	JMP .17
.19:
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,2
	DAD B
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DAD H
	DAD H
	MOV D,B
	MOV E,C
	DAD D
	POP D
	CALL .eq##
	JZ .22
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	XCHG
	INX H
	INX H
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	INX H
	POP D
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	mov h,b
	mov l,c
	MOV M,E
	INX H
	MOV M,D
	JMP .23
.22:
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	INX H
	MOV D,M
	mov h,b
	mov l,c
	MOV M,E
	INX H
	MOV M,D
.23:
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	INX H
	INX H
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DAD H
	DAD H
	XCHG
	LXI H,2-.16
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	MOV D,B
	MOV E,C
	CALL .eq##
	JZ .24
	LXI H,2
	DAD B
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,4-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	INX H
	INX H
	POP D
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	mov h,b
	mov l,c
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,4-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
	JMP .25
.24:
	MOV H,B
	MOV L,C
	PUSH H
	LXI H,4-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
.25:
	LXI H,2-.16
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	SHLD .3
	RET
.16 EQU -2
	COMMON /.lnprm/
	DS 4
	END
