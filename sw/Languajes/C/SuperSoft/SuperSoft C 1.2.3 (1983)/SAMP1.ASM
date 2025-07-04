	COMMON /errno_/
.2:
	DS 0
	CSEG
	COMMON /stdin_/
.3:
	DS 0
	CSEG
	COMMON /stdout_/
.4:
	DS 0
	CSEG
	COMMON /stderr_/
.5:
	DS 0
	CSEG
	PUBLIC strlen_
strlen_:	CALL .zsav##
	DW .6
	LXI H,12-.6
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.7:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	mov a,m
	ora a
	JZ .8
	JMP .7
.8:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.6
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .sb##
	DCX H
	RET
.6 EQU 0
	PUBLIC isalpha_
isalpha_:	CALL .zsav##
	DW .9
	LXI H,12-.9
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.9
	DAD SP
	MOV M,E
	PUSH D
	FUNC	isupper_
	CALL isupper_
	POP D
	JNZ .10
	LXI H,3-.9
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	islower_
	CALL islower_
	POP D
	JNZ .10
	LXI H,0
	JMP .11
.10:
	LXI H,1
.11:
	RET
.9 EQU -1
	PUBLIC isupper_
isupper_:	CALL .zsav##
	DW .12
	LXI H,12-.12
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.12
	DAD SP
	MOV M,E
	LXI H,65
	CALL .ge##
	JZ .14
	LXI H,3-.12
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,90
	CALL .le##
	JNZ .13
.14:
	LXI H,0
	JMP .15
.13:
	LXI H,1
.15:
	RET
.12 EQU -1
	PUBLIC islower_
islower_:	CALL .zsav##
	DW .16
	LXI H,12-.16
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.16
	DAD SP
	MOV M,E
	LXI H,97
	CALL .ge##
	JZ .18
	LXI H,3-.16
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,122
	CALL .le##
	JNZ .17
.18:
	LXI H,0
	JMP .19
.17:
	LXI H,1
.19:
	RET
.16 EQU -1
	PUBLIC isdigit_
isdigit_:	CALL .zsav##
	DW .20
	LXI H,12-.20
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.20
	DAD SP
	MOV M,E
	LXI H,48
	CALL .ge##
	JZ .22
	LXI H,3-.20
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,57
	CALL .le##
	JNZ .21
.22:
	LXI H,0
	JMP .23
.21:
	LXI H,1
.23:
	RET
.20 EQU -1
	PUBLIC iswhite_
iswhite_:	CALL .zsav##
	DW .24
	LXI H,12-.24
	DAD SP
	MOV E,M
	MVI D,0
	XCHG
	JMP .25
.27:
.28:
.29:
.30:
.31:
	LXI H,1
	RET
.32:
	LXI H,0
	RET
.25:
	CALL .swt##
	DW 5
	DW 32,.27
	DW 9,.28
	DW 13,.29
	DW 10,.30
	DW 12,.31
	DW .32
.26:
	RET
.24 EQU 0
	PUBLIC toupper_
toupper_:	CALL .zsav##
	DW .33
	LXI H,12-.33
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.33
	DAD SP
	MOV M,E
	LXI H,97
	CALL .ge##
	JZ .34
	LXI H,3-.33
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,122
	CALL .le##
	JZ .34
	LXI H,3-.33
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,-32
	DAD D
	RET
.34:
	LXI H,3-.33
	DAD SP
	MOV E,M
	MVI D,0
	XCHG
	RET
.33 EQU -1
	PUBLIC puts_
puts_:	CALL .zsav##
	DW .35
	LXI H,12-.35
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.36:
	MOV H,B
	MOV L,C
	mov a,m
	ora a
	JZ .37
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	putchar_
	CALL putchar_
	POP D
	JMP .36
.37:
	LXI H,12-.35
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.35 EQU 0
	PUBLIC gets_
gets_:	CALL .zsav##
	DW .38
	LXI H,12-.38
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.39:
	FUNC	getchar_
	CALL getchar_
	XCHG
	LXI H,1-.38
	DAD SP
	MOV M,E
	XCHG
	JMP .41
.43:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.38
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .eq##
	JZ .44
	LXI H,0
	XCHG
	mov h,b
	mov l,c
	MOV M,E
	LXI H,0
	RET
.44:
.45:
.46:
	LXI H,0
	XCHG
	mov h,b
	mov l,c
	MOV M,E
	LXI H,12-.38
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.47:
	LXI H,0
	XCHG
	mov h,b
	mov l,c
	MOV M,E
	LXI H,-1
	RET
.48:
.49:
	LXI H,10
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
	LXI H,12-.38
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	JMP .42
.50:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.38
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .eq##
	JNZ .42
	LXI H,8
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
.51:
	LXI H,32
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.38
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ne##
	JZ .52
	LXI H,8
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
	MOV H,B
	MOV L,C
	DCX H
	MOV B,H
	MOV C,L
.52:
	JMP .42
.53:
	LXI H,10
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
	MOV H,B
	MOV L,C
	XCHG
	LXI H,2-.38
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,12-.38
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.54:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,2-.38
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ul##
	JZ .55
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	putchar_
	CALL putchar_
	POP D
	JMP .54
.55:
	JMP .42
.56:
	LXI H,1-.38
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	POP D
	MOV M,E
	JMP .42
.41:
	CALL .swt##
	DW 9
	DW 26,.43
	DW 10,.45
	DW 13,.46
	DW 7,.47
	DW 21,.48
	DW 24,.49
	DW 127,.50
	DW 8,.51
	DW 18,.53
	DW .56
.42:
	JMP .39
.40:
	RET
.38 EQU -3
	PUBLIC cput_
cput_:	CALL .zsav##
	DW .57
	RET
.57 EQU 0
	PUBLIC putchar_
putchar_:	CALL .zsav##
	DW .58
	LXI H,12-.58
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,10
	CALL .eq##
	JZ .59
	LXI H,13
	PUSH H
	FUNC	cconout_
	CALL cconout_
	POP D
.59:
	LXI H,12-.58
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	cconout_
	CALL cconout_
	POP D
	RET
.58 EQU 0
	COMMON /ccugot_/
.60:
	DS 2
	CSEG
	PUBLIC getchar_
getchar_:	CALL .zsav##
	DW .61
	LXI H,.1+0
	SHLD .60
	LHLD .60
	mov a,m
	ora a
	JZ .62
	LHLD .60
	MOV E,M
	MVI D,0
	MOV B,D
	MOV C,E
	LXI H,0
	PUSH H
	LHLD .60
	POP D
	MOV M,E
	JMP .63
.62:
	FUNC	cconin_
	CALL cconin_
	MOV B,H
	MOV C,L
.63:
	MOV H,B
	MOV L,C
	JMP .64
.66:
	LXI H,10
	MOV B,H
	MOV C,L
	PUSH H
	FUNC	cconout_
	CALL cconout_
	POP D
	JMP .65
.67:
	LXI H,-1
	MOV B,H
	MOV C,L
	JMP .65
.64:
	CALL .swt##
	DW 2
	DW 13,.66
	DW 26,.67
	DW .65
.65:
	MOV H,B
	MOV L,C
	RET
.61 EQU 0
.1:
	DB 0
	PUBLIC ugetchar_
ugetchar_:	CALL .zsav##
	DW .69
	LXI H,12-.69
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	LHLD .60
	POP D
	MOV M,E
	RET
.69 EQU 0
	PUBLIC movmem_
movmem_:	CALL .zsav##
	DW .70
	LXI H,14-.70
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,12-.70
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .eq##
	JNZ .72
	LXI H,16-.70
	DAD SP
	mov a,m
	inx h
	ora m
	JNZ .71
.72:
	MOV H,B
	MOV L,C
	RET
.71:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.70
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ul##
	JZ .73
	LXI H,16-.70
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,14-.70
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	PUSH B
	FUNC	ccldir_
	CALL ccldir_
	POP D
	POP D
	POP D
	JMP .74
.73:
	LXI H,16-.70
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,14-.70
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,18-.70
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	DCX H
	PUSH H
	MOV H,B
	MOV L,C
	XCHG
	LXI H,20-.70
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	DCX H
	PUSH H
	FUNC	cclddr_
	CALL cclddr_
	POP D
	POP D
	POP D
.74:
	LXI H,14-.70
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,16-.70
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	RET
.70 EQU 0
	PUBLIC setmem_
setmem_:	CALL .zsav##
	DW .75
	LXI H,14-.75
	DAD SP
	mov a,m
	inx h
	ora m
	JZ .76
	LXI H,16-.75
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	LXI H,14-.75
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	XCHG
	POP D
	MOV M,E
	LXI H,14-.75
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DCX H
	PUSH H
	PUSH B
	MOV H,B
	MOV L,C
	INX H
	PUSH H
	FUNC	ccldir_
	CALL ccldir_
	POP D
	POP D
	POP D
.76:
	LXI H,12-.75
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.75 EQU 0
	PUBLIC xmain_
xmain_:	CALL .zsav##
	DW .77
	LXI H,2-.77
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,4-.77
	DAD SP
	PUSH H
	FUNC	loadargs_
	CALL loadargs_
	POP D
	PUSH H
	FUNC	main_
	CALL main_
	POP D
	POP D
	PUSH H
	FUNC	exit_
	CALL exit_
	POP D
	RET
.77 EQU -2
	PUBLIC loadargs_
loadargs_:	CALL .zsav##
	DW .78
	LXI H,.68+0
	XCHG
	LXI H,-124-.78
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,-124-.78
	DAD SP
	MOV B,H
	MOV C,L
	FUNC	comlen_
	CALL comlen_
	PUSH H
	FUNC	comline_
	CALL comline_
	POP D
	DAD D
	PUSH H
	FUNC	comline_
	CALL comline_
	PUSH H
	LXI H,10-.78
	DAD SP
	PUSH H
	LXI H,-116-.78
	DAD SP
	PUSH H
	FUNC	loadline_
	CALL loadline_
	XCHG
	LXI H,8
	DAD SP
	SPHL
	MOV H,B
	MOV L,C
	CALL .sb##
	MOV B,H
	MOV C,L
	PUSH B
	PUSH B
	FUNC	evnbrk_
	CALL evnbrk_
	POP D
	PUSH H
	LXI H,16-.78
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
	PUSH D
	LXI H,-120-.78
	DAD SP
	PUSH H
	FUNC	movmem_
	CALL movmem_
	POP D
	POP D
	POP D
	MOV H,B
	MOV L,C
	LXI D,1
	XCHG
	CALL .ur##
	RET
.78 EQU -128
.68:
	DB 0
	PUBLIC loadline_
loadline_:	CALL .zsav##
	DW .80
	LXI H,12-.80
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.81:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,14-.80
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ul##
	JZ .82
	LXI H,18-.80
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,18-.80
	DAD SP
	PUSH H
	FUNC	nextarg_
	CALL nextarg_
	POP D
	POP D
	XCHG
	mov h,b
	mov l,c
	MOV M,E
	INX H
	MOV M,D
	MOV A,D
	ORA E
	JZ .82
	mov h,b
	mov l,c
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	MVI D,0
	XCHG
	JMP .83
.85:
	MOV H,B
	MOV L,C
	INX H
	INX H
	MOV B,H
	MOV C,L
	JMP .84
.83:
	CALL .swt##
	DW 0
	DW .85
.84:
	JMP .81
.82:
	MOV H,B
	MOV L,C
	RET
.80 EQU 0
	PUBLIC nextarg_
nextarg_:	CALL .zsav##
	DW .86
	LXI H,12-.86
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
	JMP .88
.87:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
.88:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,14-.86
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .uf##
	JZ .90
	LXI H,0
	RET
.90:
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	iswhite_
	CALL iswhite_
	POP D
	JZ .89
	JMP .87
.89:
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	XCHG
	JMP .91
.93:
.94:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	LXI H,1-.86
	DAD SP
	MOV M,E
	JMP .92
.95:
	LXI H,0
	XCHG
	LXI H,1-.86
	DAD SP
	MOV M,E
	JMP .92
.91:
	CALL .swt##
	DW 2
	DW 39,.93
	DW 34,.94
	DW .95
.92:
	LXI H,-127-.86
	DAD SP
	XCHG
	LXI H,2-.86
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,1
	XCHG
	LXI H,-129-.86
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	JMP .97
.96:
	LXI H,-129-.86
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
.97:
	LXI H,1-.86
	DAD SP
	mov a,m
	ora a
	JZ .99
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	LXI H,1-.86
	DAD SP
	MOV L,M
	MVI H,0
	CALL .ne##
	JMP .100
.99:
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	iswhite_
	CALL iswhite_
	POP D
	CALL .nt##
.100:
	MOV A,H
	ORA L
	JZ .98
	MOV H,B
	MOV L,C
	XCHG
	LXI H,14-.86
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ul##
	JZ .98
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	LXI H,92
	CALL .eq##
	JZ .101
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
.101:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	LXI H,4-.86
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	POP D
	MOV M,E
	JMP .96
.98:
	LXI H,0
	PUSH H
	LXI H,4-.86
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	LXI H,-129-.86
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	LXI H,-127-.86
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	FUNC	sbrk_
	CALL sbrk_
	POP D
	XCHG
	LXI H,4-.86
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	PUSH D
	LXI H,-123-.86
	DAD SP
	PUSH H
	FUNC	movmem_
	CALL movmem_
	POP D
	POP D
	POP D
	MOV H,B
	MOV L,C
	INX H
	PUSH H
	LXI H,14-.86
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
	LXI H,2-.86
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.86 EQU -133
	PUBLIC sbrk_
sbrk_:	CALL .zsav##
	DW .102
	COMMON /ccedata_/
.103:
	DS 0
	CSEG
	LHLD .103
	MOV B,H
	MOV C,L
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.102
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	MOV D,B
	MOV E,C
	XCHG
	CALL .ug##
	JZ .104
	LXI H,12-.102
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,0
	CALL .lt##
	JZ .105
	LXI H,-1
	RET
.105:
	JMP .106
.104:
	LXI H,12-.102
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,0
	CALL .gt##
	JZ .107
	LXI H,-1
	RET
.107:
.106:
	MOV H,B
	MOV L,C
	XCHG
	LXI H,12-.102
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DAD D
	PUSH H
	FUNC	brk_
	CALL brk_
	POP D
	JZ .108
	LXI H,-1
	RET
.108:
	MOV H,B
	MOV L,C
	RET
.102 EQU 0
	PUBLIC ubrk_
ubrk_:	CALL .zsav##
	DW .109
	LXI H,0
	PUSH H
	FUNC	sbrk_
	CALL sbrk_
	POP D
	PUSH H
	db 253,225
	LXI H,12-.109
	DAD SP
	mov a,m
	inx h
	ora m
	JNZ .110
	db 253,229
	POP H
	RET
.110:
	LXI H,12-.109
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,1
	CALL .ur##
	LXI D,32767
	CALL .an##
	MOV B,H
	MOV C,L
	PUSH H
	FUNC	sbrk_
	CALL sbrk_
	POP D
	LXI D,-1
	CALL .eq##
	JZ .111
	LXI H,-1
	RET
.111:
	LXI H,12-.109
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV H,B
	MOV L,C
	CALL .sb##
	PUSH H
	FUNC	sbrk_
	CALL sbrk_
	POP D
	LXI D,-1
	CALL .eq##
	JZ .112
	MOV H,B
	MOV L,C
	PUSH H
	db 221,225
	db 221,229
	POP H
	CALL .ng##
	PUSH H
	FUNC	sbrk_
	CALL sbrk_
	POP D
	LXI H,-1
	RET
.112:
	db 253,229
	POP H
	RET
.109 EQU 0
	PUBLIC wrdbrk_
wrdbrk_:	CALL .zsav##
	DW .113
	LXI H,12-.113
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	FUNC	evnbrk_
	CALL evnbrk_
	POP D
	RET
.113 EQU 0
	PUBLIC evnbrk_
evnbrk_:	CALL .zsav##
	DW .114
	LXI H,0
	PUSH H
	FUNC	sbrk_
	CALL sbrk_
	POP D
	LXI D,1
	CALL .an##
	PUSH H
	FUNC	sbrk_
	CALL sbrk_
	POP D
	LXI H,12-.114
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	FUNC	ubrk_
	CALL ubrk_
	POP D
	RET
.114 EQU 0
	PUBLIC exit_
exit_:	CALL .zsav##
	DW .115
	LXI H,12-.115
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	FUNC	ccexit_
	CALL ccexit_
	POP D
	RET
.115 EQU 0
	COMMON /filedesc_/
.116:
	DS 2
	CSEG
	COMMON /ap_/
.117:
	DS 2
	CSEG
	COMMON /ac_/
.118:
	DS 2
	CSEG
	COMMON /bs_/
.119:
	DS 2
	CSEG
	COMMON /bu_/
.120:
	DS 1
	CSEG
	COMMON /errno_/
	DS 0
	CSEG
	COMMON /filedesc_/
	DS 0
	CSEG
	COMMON /filedesc_/
	DS 0
	CSEG
	COMMON /filedesc_/
	DS 0
	CSEG
	PUBLIC isalnum_
isalnum_:	CALL .zsav##
	DW .121
	LXI H,12-.121
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.121
	DAD SP
	MOV M,E
	PUSH D
	FUNC	isalpha_
	CALL isalpha_
	POP D
	JNZ .122
	LXI H,3-.121
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	isdigit_
	CALL isdigit_
	POP D
	JNZ .122
	LXI H,0
	JMP .123
.122:
	LXI H,1
.123:
	RET
.121 EQU -1
	PUBLIC isascii_
isascii_:	CALL .zsav##
	DW .124
	LXI H,12-.124
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,128
	CALL .an##
	LXI D,0
	CALL .eq##
	RET
.124 EQU 0
	PUBLIC iscntrl_
iscntrl_:	CALL .zsav##
	DW .125
	LXI H,12-.125
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,224
	CALL .an##
	LXI D,0
	CALL .eq##
	RET
.125 EQU 0
	PUBLIC ispunct_
ispunct_:	CALL .zsav##
	DW .126
	LXI H,12-.126
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.126
	DAD SP
	MOV M,E
	PUSH D
	FUNC	isascii_
	CALL isascii_
	POP D
	JZ .128
	LXI H,3-.126
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	iscntrl_
	CALL iscntrl_
	POP D
	JNZ .128
	LXI H,3-.126
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	isalnum_
	CALL isalnum_
	POP D
	JZ .127
.128:
	LXI H,0
	JMP .129
.127:
	LXI H,1
.129:
	RET
.126 EQU -1
	PUBLIC isprint_
isprint_:	CALL .zsav##
	DW .130
	LXI H,12-.130
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,255
	CALL .an##
	MOV B,H
	MOV C,L
	LXI D,32
	XCHG
	CALL .ge##
	JZ .132
	MOV H,B
	MOV L,C
	LXI D,126
	XCHG
	CALL .le##
	JNZ .131
.132:
	LXI H,0
	JMP .133
.131:
	LXI H,1
.133:
	RET
.130 EQU 0
	PUBLIC isspace_
isspace_:	CALL .zsav##
	DW .134
	LXI H,12-.134
	DAD SP
	MOV E,M
	MVI D,0
	XCHG
	JMP .135
.137:
.138:
.139:
	LXI H,1
	RET
.140:
	LXI H,0
	RET
.135:
	CALL .swt##
	DW 3
	DW 32,.137
	DW 9,.138
	DW 10,.139
	DW .140
.136:
	RET
.134 EQU 0
	PUBLIC isnumeri_
isnumeri_:	CALL .zsav##
	DW .141
	LXI H,12-.141
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	toupper_
	CALL toupper_
	POP D
	XCHG
	LXI H,3-.141
	DAD SP
	MOV M,E
	LXI H,14-.141
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,10
	CALL .le##
	JZ .142
	LXI H,3-.141
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,48
	CALL .ge##
	JZ .144
	LXI H,14-.141
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,48
	DAD D
	DCX H
	PUSH H
	LXI H,5-.141
	DAD SP
	MOV E,M
	MVI D,0
	POP H
	CALL .le##
	JNZ .143
.144:
	LXI H,0
	JMP .145
.143:
	LXI H,1
.145:
	RET
.142:
	LXI H,3-.141
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,48
	CALL .ge##
	JZ .147
	LXI H,3-.141
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,57
	CALL .le##
	JNZ .146
.147:
	LXI H,3-.141
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,65
	CALL .ge##
	JZ .148
	LXI H,14-.141
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,65
	DAD D
	LXI D,-11
	DAD D
	PUSH H
	LXI H,5-.141
	DAD SP
	MOV E,M
	MVI D,0
	POP H
	CALL .le##
	JNZ .146
.148:
	LXI H,0
	JMP .149
.146:
	LXI H,1
.149:
	RET
.141 EQU -1
	PUBLIC tolower_
tolower_:	CALL .zsav##
	DW .150
	LXI H,12-.150
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,3-.150
	DAD SP
	MOV M,E
	PUSH D
	FUNC	isupper_
	CALL isupper_
	POP D
	JZ .151
	LXI H,3-.150
	DAD SP
	MOV E,M
	MVI D,0
	LXI H,32
	DAD D
	JMP .152
.151:
	LXI H,3-.150
	DAD SP
	MOV E,M
	MVI D,0
	XCHG
.152:
	RET
.150 EQU -1
	PUBLIC strncpy_
strncpy_:	CALL .zsav##
	DW .153
	LXI H,12-.153
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.154:
	LXI H,16-.153
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DCX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	INX H
	MOV A,H
	ORA L
	JZ .155
	LXI H,14-.153
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	mov a,m
	ora a
	JZ .156
	LXI H,14-.153
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	XCHG
	JMP .157
.156:
	LXI H,0
.157:
	PUSH H
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	POP D
	MOV M,E
	JMP .154
.155:
	LXI H,12-.153
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.153 EQU 0
	PUBLIC strcpy_
strcpy_:	CALL .zsav##
	DW .158
	LXI H,12-.158
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.159:
	LXI H,14-.158
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	POP D
	MOV M,E
	MOV A,D
	ORA E
	JZ .160
	JMP .159
.160:
	MOV H,B
	MOV L,C
	RET
.158 EQU 0
	PUBLIC strcat_
strcat_:	CALL .zsav##
	DW .161
	LXI H,12-.161
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.162:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	mov a,m
	ora a
	JZ .163
	JMP .162
.163:
	MOV H,B
	MOV L,C
	DCX H
	MOV B,H
	MOV C,L
.164:
	LXI H,14-.161
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	POP D
	MOV M,E
	MOV A,D
	ORA E
	JZ .165
	JMP .164
.165:
	LXI H,12-.161
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.161 EQU 0
	PUBLIC strncat_
strncat_:	CALL .zsav##
	DW .166
	LXI H,12-.166
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.167:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	mov a,m
	ora a
	JZ .168
	JMP .167
.168:
	MOV H,B
	MOV L,C
	DCX H
	MOV B,H
	MOV C,L
.169:
	LXI H,16-.166
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DCX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	INX H
	MOV A,H
	ORA L
	JNZ .171
	LXI H,0
	XCHG
	mov h,b
	mov l,c
	MOV M,E
	JMP .170
.171:
	LXI H,14-.166
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	POP D
	MOV M,E
	MOV A,D
	ORA E
	JZ .170
	JMP .169
.170:
	LXI H,12-.166
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.166 EQU 0
	PUBLIC strcmp_
strcmp_:	CALL .zsav##
	DW .172
	LXI H,12-.172
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.173:
	LXI H,14-.172
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	POP H
	CALL .ne##
	JZ .175
	LXI H,14-.172
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	POP H
	CALL .sb##
	RET
.175:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	mov a,m
	ora a
	JNZ .176
	LXI H,0
	RET
.176:
	JMP .173
.174:
	RET
.172 EQU 0
	PUBLIC strncmp_
strncmp_:	CALL .zsav##
	DW .177
	LXI H,12-.177
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.178:
	LXI H,16-.177
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DCX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	MOV A,D
	ORA E
	JZ .179
	LXI H,14-.177
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	POP H
	CALL .ne##
	JZ .180
	LXI H,14-.177
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	POP H
	CALL .sb##
	RET
.180:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	mov a,m
	ora a
	JNZ .181
	LXI H,0
	RET
.181:
	JMP .178
.179:
	LXI H,14-.177
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	MVI D,0
	PUSH D
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	POP H
	CALL .sb##
	RET
.177 EQU 0
	PUBLIC rindex_
rindex_:	CALL .zsav##
	DW .182
	LXI H,0
	XCHG
	LXI H,2-.182
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,12-.182
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
.183:
	MOV H,B
	MOV L,C
	mov a,m
	ora a
	JZ .184
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	LXI H,14-.182
	DAD SP
	MOV L,M
	MVI H,0
	CALL .eq##
	JZ .185
	MOV H,B
	MOV L,C
	DCX H
	XCHG
	LXI H,2-.182
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.185:
	JMP .183
.184:
	LXI H,2-.182
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.182 EQU -2
	PUBLIC substr_
substr_:	CALL .zsav##
	DW .186
	LXI H,12-.186
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,14-.186
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,2-.186
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,0-.186
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.187:
	MOV H,B
	MOV L,C
	mov a,m
	ora a
	JNZ .189
	LXI H,0-.186
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.189:
	LXI H,2-.186
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	mov a,m
	ora a
	JNZ .190
	LXI H,0
	RET
.190:
	LXI H,2-.186
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	POP H
	CALL .ne##
	JZ .191
	LXI H,12-.186
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,2-.186
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,0-.186
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.191:
	JMP .187
.188:
	RET
.186 EQU -4
	PUBLIC usubstr_
usubstr_:	CALL .zsav##
	DW .192
	LXI H,12-.192
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,14-.192
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,2-.192
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,0-.192
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.193:
	MOV H,B
	MOV L,C
	mov a,m
	ora a
	JNZ .195
	LXI H,0-.192
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.195:
	LXI H,2-.192
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	mov a,m
	ora a
	JNZ .196
	LXI H,0
	RET
.196:
	LXI H,2-.192
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	toupper_
	CALL toupper_
	POP D
	PUSH H
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	toupper_
	CALL toupper_
	POP D
	POP D
	CALL .ne##
	JZ .197
	LXI H,12-.192
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,2-.192
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,0-.192
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.197:
	JMP .193
.194:
	RET
.192 EQU -4
	PUBLIC atoi_
atoi_:	CALL .zsav##
	DW .198
.199:
	LXI H,12-.198
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	iswhite_
	CALL iswhite_
	POP D
	JZ .200
	JMP .199
.200:
	LXI H,12-.198
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DCX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	MOV E,M
	MVI D,0
	XCHG
	JMP .201
.203:
	LXI H,1
	XCHG
	LXI H,2-.198
	DAD SP
	MOV M,E
	LXI H,12-.198
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	JMP .202
.204:
	LXI H,12-.198
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
.205:
	LXI H,0
	XCHG
	LXI H,2-.198
	DAD SP
	MOV M,E
	JMP .202
.201:
	CALL .swt##
	DW 2
	DW 45,.203
	DW 43,.204
	DW .205
.202:
	LXI H,0
	MOV B,H
	MOV C,L
.206:
	LXI H,12-.198
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	MOV E,M
	MVI D,0
	LXI H,3-.198
	DAD SP
	MOV M,E
	PUSH D
	FUNC	isdigit_
	CALL isdigit_
	POP D
	JZ .207
	MOV H,B
	MOV L,C
	LXI D,10
	CALL .ml##
	PUSH H
	LXI H,5-.198
	DAD SP
	MOV E,M
	MVI D,0
	POP H
	DAD D
	LXI D,-48
	DAD D
	MOV B,H
	MOV C,L
	JMP .206
.207:
	LXI H,2-.198
	DAD SP
	mov a,m
	ora a
	JZ .208
	MOV H,B
	MOV L,C
	CALL .ng##
	JMP .209
.208:
	MOV H,B
	MOV L,C
.209:
	RET
.198 EQU -2
	PUBLIC sleep_
sleep_:	CALL .zsav##
	DW .210
.211:
	LXI H,12-.210
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	DCX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	MOV A,D
	ORA E
	JZ .212
	LXI H,9216
	MOV B,H
	MOV C,L
.213:
	MOV H,B
	MOV L,C
	DCX H
	MOV B,H
	MOV C,L
	MOV A,H
	ORA L
	JZ .214
	JMP .213
.214:
	JMP .211
.212:
	RET
.210 EQU 0
	PUBLIC abs_
abs_:	CALL .zsav##
	DW .215
	LXI H,12-.215
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,0
	CALL .lt##
	JZ .216
	MOV H,B
	MOV L,C
	CALL .ng##
	JMP .217
.216:
	MOV H,B
	MOV L,C
.217:
	RET
.215 EQU 0
	PUBLIC absval_
absval_:	CALL .zsav##
	DW .218
	LXI H,12-.218
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	MOV B,D
	MOV C,E
	LXI H,0
	CALL .lt##
	JZ .219
	MOV H,B
	MOV L,C
	CALL .ng##
	JMP .220
.219:
	MOV H,B
	MOV L,C
.220:
	RET
.218 EQU 0
	PUBLIC min_
min_:	CALL .zsav##
	DW .221
	LXI H,12-.221
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,14-.221
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .lt##
	JZ .222
	LXI H,12-.221
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	JMP .223
.222:
	LXI H,14-.221
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
.223:
	RET
.221 EQU 0
	PUBLIC max_
max_:	CALL .zsav##
	DW .224
	LXI H,12-.224
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,14-.224
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .lt##
	JZ .225
	LXI H,14-.224
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	JMP .226
.225:
	LXI H,12-.224
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
.226:
	RET
.224 EQU 0
	PUBLIC kbhit_
kbhit_:	CALL .zsav##
	DW .227
	FUNC	cconst_
	CALL cconst_
	RET
.227 EQU 0
	PUBLIC pause_
pause_:	CALL .zsav##
	DW .228
.229:
	FUNC	kbhit_
	CALL kbhit_
	JNZ .230
	JMP .229
.230:
	RET
.228 EQU 0
	PUBLIC putdec_
putdec_:	CALL .zsav##
	DW .231
	LXI H,12-.231
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,0
	CALL .ge##
	JZ .232
	LXI H,12-.231
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	JMP .233
.232:
	LXI H,45
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
	LXI H,12-.231
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	CALL .ng##
.233:
	MOV B,H
	MOV C,L
	MOV H,B
	MOV L,C
	LXI D,10
	XCHG
	CALL .ud##
	XCHG
	LXI H,12-.231
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	MOV A,D
	ORA E
	JZ .234
	LXI H,12-.231
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	PUSH D
	FUNC	putdec_
	CALL putdec_
	POP D
.234:
	MOV H,B
	MOV L,C
	LXI D,10
	XCHG
	CALL .um##
	LXI D,48
	DAD D
	PUSH H
	FUNC	putchar_
	CALL putchar_
	POP D
	RET
.231 EQU 0
	COMMON /ccrand_/
.235:
	DS 2
	CSEG
	PUBLIC srand_
srand_:	CALL .zsav##
	DW .236
	LXI H,12-.236
	DAD SP
	mov a,m
	inx h
	ora m
	JNZ .237
	LXI H,.79+0
	PUSH H
	FUNC	puts_
	CALL puts_
	POP D
	JMP .239
.238:
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
.239:
	FUNC	kbhit_
	CALL kbhit_
	JNZ .240
	JMP .238
.240:
	MOV H,B
	MOV L,C
	SHLD .235
	JMP .241
.237:
	LXI H,12-.236
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	SHLD .235
.241:
	RET
.236 EQU 0
.79:
	DB 87,97,105,116,32,97,32,109,111,109,101,110,116,44,32
	DB 116,104,101,110,32,115,116,114,105,107,101,32,97,32,107
	DB 101,121,0
	PUBLIC rand_
rand_:	CALL .zsav##
	DW .243
	LHLD .235
	LXI D,32719
	CALL .ml##
	INX H
	INX H
	INX H
	LXI D,32749
	XCHG
	CALL .rm##
	SHLD .235
	RET
.243 EQU 0
	PUBLIC peek_
peek_:	CALL .zsav##
	DW .244
	LXI H,12-.244
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	MOV E,M
	MVI D,0
	XCHG
	RET
.244 EQU 0
	PUBLIC poke_
poke_:	CALL .zsav##
	DW .245
	LXI H,14-.245
	DAD SP
	MOV E,M
	MVI D,0
	PUSH D
	LXI H,14-.245
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	RET
.245 EQU 0
	PUBLIC initw_
initw_:	CALL .zsav##
	DW .246
.247:
	LXI H,14-.246
	DAD SP
	mov a,m
	inx h
	ora m
	JZ .248
	LXI H,14-.246
	DAD SP
	PUSH H
	FUNC	getval_
	CALL getval_
	POP D
	PUSH H
	LXI H,14-.246
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	DCX H
	POP D
	MOV M,E
	INX H
	MOV M,D
	JMP .247
.248:
	RET
.246 EQU 0
	PUBLIC initb_
initb_:	CALL .zsav##
	DW .249
.250:
	LXI H,14-.249
	DAD SP
	mov a,m
	inx h
	ora m
	JZ .251
	LXI H,14-.249
	DAD SP
	PUSH H
	FUNC	getval_
	CALL getval_
	POP D
	PUSH H
	LXI H,14-.249
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	INX H
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
	XCHG
	DCX H
	POP D
	MOV M,E
	JMP .250
.251:
	RET
.249 EQU 0
	PUBLIC getval_
getval_:	CALL .zsav##
	DW .252
	LXI H,12-.252
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
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	MOV A,D
	ORA E
	JNZ .253
	LXI H,0
	PUSH H
	LXI H,14-.252
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
	XCHG
	RET
.253:
	LXI H,0
	XCHG
	LXI H,2-.252
	DAD SP
	MOV M,E
	INX H
	MOV M,D
.254:
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	isdigit_
	CALL isdigit_
	POP D
	JZ .255
	LXI H,2-.252
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,10
	CALL .ml##
	PUSH H
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	DCX H
	MOV E,M
	MVI D,0
	POP H
	DAD D
	LXI D,-48
	DAD D
	XCHG
	LXI H,2-.252
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	JMP .254
.255:
.256:
	MOV H,B
	MOV L,C
	mov a,m
	ora a
	JZ .257
	mov h,b
	mov l,c
	MOV E,M
	MVI D,0
	PUSH D
	FUNC	isdigit_
	CALL isdigit_
	POP D
	JNZ .257
	MOV H,B
	MOV L,C
	INX H
	MOV B,H
	MOV C,L
	JMP .256
.257:
	MOV H,B
	MOV L,C
	PUSH H
	LXI H,14-.252
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	POP D
	MOV M,E
	INX H
	MOV M,D
	LXI H,2-.252
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	XCHG
	RET
.252 EQU -2
	PUBLIC qsort_
qsort_:	CALL .zsav##
	DW .258
	LXI H,14-.258
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,16-.258
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ml##
	XCHG
	LXI H,-6-.258
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	LXI H,14-.258
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,2
	CALL .dv##
	XCHG
	LXI H,0-.258
	DAD SP
	MOV M,E
	INX H
	MOV M,D
	JMP .260
.259:
	LXI H,2
	XCHG
	LXI H,0-.258
	DAD SP
	PUSH H
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	XCHG
	CALL .dv##
	XCHG
	POP H
	MOV M,E
	INX H
	MOV M,D
.260:
	LXI H,0-.258
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,0
	CALL .gt##
	JZ .261
	LXI H,0-.258
	DAD SP
	MOV E,M
	INX H
	MOV D,M
	LXI H,16-.258
	DAD SP
	MOV A,M
	INX H
	MOV H,M
	MOV L,A
	CALL .ml##
	