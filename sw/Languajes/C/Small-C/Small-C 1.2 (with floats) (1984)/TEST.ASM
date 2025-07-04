;* * *  Small-C  V1.2  * * *
;       By Ron Cain  and  James Van Zandt
;     2 August 1984
;
	LD HL,(6)
	LD SP,HL
	CALL ccgo
	CALL qmain
	CALL qexit
	GLOBAL	CCAND
	GLOBAL	CCASR
	GLOBAL	CCASL
	GLOBAL	CCCDR
	GLOBAL	CCCAR
	GLOBAL	CCCMP
	GLOBAL	CCCMP1
	GLOBAL	CCCOM
	GLOBAL	CCDIV
	GLOBAL	CCEQ
	GLOBAL	CCGE
	GLOBAL	CCGO
	GLOBAL	CCGCHAR
	GLOBAL	CCGINT
	GLOBAL	CCGT
	GLOBAL	CCLE
	GLOBAL	CCLT
	GLOBAL	CCMULT
	GLOBAL	CCNE
	GLOBAL	CCNEG
	GLOBAL	CCOR
	GLOBAL	CCPINT
	GLOBAL	CCSUB
	GLOBAL	CCSXT
	GLOBAL	CCUCMP
	GLOBAL	CCUGE
	GLOBAL	CCUGT
	GLOBAL	CCULE
	GLOBAL	CCULT
	GLOBAL	CCXOR
	GLOBAL	CURRENT
	GLOBAL	ERR2
	GLOBAL	QALLOC
	GLOBAL	QARGC
	GLOBAL	QAVAIL
	GLOBAL	QCPM
	GLOBAL	QERR
	GLOBAL	QEXIT
	GLOBAL	QFCLOSE
	GLOBAL	QFOPEN
	GLOBAL	QFREE
	GLOBAL	QGETB
	GLOBAL	QGETC
	GLOBAL	QGETCHA
	GLOBAL	QGETS
	GLOBAL	QPUTB
	GLOBAL	QPUTC
	GLOBAL	QPUTCHA
	GLOBAL	QPUTS
	GLOBAL	_END
	global qfloat
	global qfmod
	global qfabs
	global qfloor
	global qceil
	global qrand
	global qifix
	GLOBAL	ADDHALF
	GLOBAL	DADD
	GLOBAL	DDIV
	GLOBAL	DGE
	GLOBAL	DIV1
	GLOBAL	DIV17
	GLOBAL	DLOAD
	GLOBAL	DMUL
	GLOBAL	DSTORE
	GLOBAL	DSWAP
	GLOBAL	DSUB
	GLOBAL	DEQ
	GLOBAL	DGT
	GLOBAL	DLE
	GLOBAL	DLT
	GLOBAL	DNE
	GLOBAL	DPUSH
	GLOBAL	DPUSH2
	GLOBAL	EXTRA
	GLOBAL	FA
	GLOBAL	FADD
	GLOBAL	FASIGN
	GLOBAL	FDIV
	GLOBAL	FMUL
	GLOBAL	FSUB
	GLOBAL	HLADD
	GLOBAL	HLSUB
	GLOBAL	ILLFCT
	GLOBAL	L247E
	GLOBAL	L2895
	GLOBAL	LDBCFA
	GLOBAL	LDBCHL
	GLOBAL	LDFABC
	GLOBAL	MINUSFA
	GLOBAL	ODD
	GLOBAL	PUSHFA
	GLOBAL	QCEIL
	GLOBAL	QIFIX
	GLOBAL	QFABS
	GLOBAL	QFLOAT
	GLOBAL	QFLOOR
	GLOBAL	QFMOD
	GLOBAL	QRAND
	GLOBAL	SGN
 GLOBAL QPRINTF	;printf(argcnt) int argcnt;
 GLOBAL QUTOI	;utoi(decstr,nbr) char *decstr; int *nbr;
 GLOBAL QITOD	;itod(nbr,str,sz) int nbr; char str[]; int sz;
 GLOBAL QITOU	;itou(nbr,str,sz) int nbr; char str[]; int sz;
 GLOBAL QITOX	;itox(nbr,str,sz) int nbr; char str[]; int sz;
 GLOBAL QFTOA	;ftoa(x,f,str)
 GLOBAL QFTOE	;ftoe(x,prec,str)
 GLOBAL QGETARG ;getarg(n,s,size)
;		/* places in s the n-th argument (assumes s 
;			has size bytes). Returns s.	*/
 GLOBAL QSETARGS ;setargs()	/* fetch arguments */
 GLOBAL QSTDIN
 GLOBAL QSTDOUT
	global qatan
	global qatan2
	global qcos
	global qcosh
	global qexp
	global qlog
	global qlog10
	global qpow
	global qsin
	global qsinh
	global qsqrt
	global qtan
	global qtanh
	GLOBAL	QATAN
	GLOBAL	QATAN2
	GLOBAL	QCOS
	GLOBAL	QCOSH
	GLOBAL	QEXP
	GLOBAL	QLOG
	GLOBAL	QLOG10
	GLOBAL	QPOW
	GLOBAL	QSIN
	GLOBAL	QSINH
	GLOBAL	QSQRT
	GLOBAL	QTAN
	GLOBAL	QTANH
	global qinfile
	global qoutfile
	global qbuf
	global qchr
	global qfile
	global qa
	global qb
	global qc
	global qd
	global qline
	global qe
	global qf
	global qmain
qmain:
	global qsetargs
	CALL qsetargs
	global qprintf
	LD HL,cc1+0
	PUSH HL
	LD A,1
	CALL qprintf
	POP BC
	LD HL,cc1+14
	PUSH HL
	LD HL,1
	CALL ccneg
	PUSH HL
	LD A,2
	CALL qprintf
	POP BC
	POP BC
	LD HL,cc1+23
	PUSH HL
	LD HL,1
	CALL ccneg
	PUSH HL
	LD A,2
	CALL qprintf
	POP BC
	POP BC
	LD HL,cc1+32
	PUSH HL
	LD HL,cc1+41
	PUSH HL
	LD A,2
	CALL qprintf
	POP BC
	POP BC
	LD HL,cc1+47
	PUSH HL
	LD HL,65
	PUSH HL
	LD A,2
	CALL qprintf
	POP BC
	POP BC
	global qputs
	LD HL,cc1+56
	PUSH HL
	CALL qputs
	POP BC
	global qgets
	LD HL,qbuf
	PUSH HL
	CALL qgets
	POP BC
	LD HL,qbuf
	PUSH HL
	CALL qputs
	POP BC
	LD HL,cc1+72
	PUSH HL
	CALL qputs
	POP BC
	global qgetchar
	CALL qgetchar
	LD A,L
	LD (qchr),A
	LD HL,cc1+91
	PUSH HL
	CALL qputs
	POP BC
	global qputchar
	LD A,(qchr)
	CALL ccsxt
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	global qalpha
	CALL qalpha
	LD HL,cc1+112
	PUSH HL
	LD HL,1
	PUSH HL
	LD HL,1
	PUSH HL
	LD HL,2
	PUSH HL
	LD HL,3
	PUSH HL
	LD A,5
	CALL qprintf
	EX DE,HL
	LD HL,10
	ADD HL,SP
	LD SP,HL
	EX DE,HL
	LD HL,cc1+154
	PUSH HL
	LD HL,cc1+187
	CALL dload
	CALL dpush
	CALL qsqrt
	POP BC
	POP BC
	POP BC
	CALL dpush
	LD A,4
	CALL qprintf
	EX DE,HL
	LD HL,8
	ADD HL,SP
	LD SP,HL
	EX DE,HL
	LD HL,cc1+193
	PUSH HL
	LD HL,cc1+239
	CALL dload
	CALL dpush
	LD HL,cc1+245
	CALL dload
	CALL dpush
	LD HL,cc1+251
	CALL dload
	CALL dpush
	LD A,10
	CALL qprintf
	EX DE,HL
	LD HL,20
	ADD HL,SP
	LD SP,HL
	EX DE,HL
	LD HL,cc1+257
	PUSH HL
	LD HL,cc1+293
	CALL dload
	CALL minusfa
	CALL dpush
	LD HL,cc1+299
	CALL dload
	CALL minusfa
	CALL dpush
	LD HL,cc1+305
	CALL dload
	CALL dpush
	LD HL,cc1+311
	CALL dload
	CALL dpush
	LD A,13
	CALL qprintf
	EX DE,HL
	LD HL,26
	ADD HL,SP
	LD SP,HL
	EX DE,HL
	LD HL,0
	LD (qline),HL
	LD HL,qline
	global qoutf
	LD HL,cc1+317
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+323
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+329
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+335
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+341
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+347
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+353
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+359
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+365
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+371
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+377
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+383
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+389
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,cc1+395
	CALL dload
	CALL dpush
	CALL qoutf
	POP BC
	POP BC
	POP BC
	LD HL,17
	LD (qb),HL
	LD HL,6
	LD (qc),HL
	LD HL,qb
	LD (qd),HL
	LD HL,cc1+401
	CALL dload
	LD HL,qe
	CALL dstore
	LD HL,cc1+407
	CALL dload
	LD HL,qf
	CALL dstore
	LD HL,(qb)
	LD (qa),HL
	global qout
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccor
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccxor
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccand
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL cceq
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,qe
	CALL dload
	CALL dpush2
	POP HL
	CALL qfloat
	CALL dswap
	CALL deq
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL dpush
	LD HL,(qb)
	CALL qfloat
	CALL deq
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL dpush
	LD HL,qf
	CALL dload
	CALL deq
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccne
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL cclt
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccle
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccge
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccgt
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccasl
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	POP DE
	CALL ccasr
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	POP DE
	ADD HL,DE
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,qe
	CALL dload
	CALL dpush2
	POP HL
	CALL qfloat
	CALL dswap
	CALL dadd
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL dpush
	LD HL,(qb)
	CALL qfloat
	CALL dadd
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL dpush
	LD HL,qf
	CALL dload
	CALL dadd
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccsub
	LD (qa),HL
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccsub
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	CALL ccmult
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,qe
	CALL dload
	CALL dpush2
	POP HL
	CALL qfloat
	CALL dswap
	CALL dmul
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL dpush
	LD HL,(qb)
	CALL qfloat
	CALL dmul
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qe
	CALL dload
	CALL dpush
	LD HL,qf
	CALL dload
	CALL dmul
	CALL qifix
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	POP DE
	CALL ccdiv
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	PUSH HL
	LD HL,(qc)
	POP DE
	CALL ccdiv
	EX DE,HL
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	INC HL
	LD (qb),HL
	DEC HL
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	INC HL
	LD (qb),HL
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qb)
	DEC HL
	LD (qb),HL
	INC HL
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	LD HL,(qb)
	DEC HL
	LD (qb),HL
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qd)
	CALL ccgint
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,qb
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qa)
	CALL qfloat
	LD HL,qe
	CALL dstore
	LD HL,qe
	CALL dload
	CALL dpush
	CALL qifix
	POP BC
	POP BC
	POP BC
	PUSH HL
	CALL qout
	POP BC
	LD HL,(qd)
	PUSH HL
	LD HL,1
	ADD HL,HL
	POP DE
	ADD HL,DE
	CALL ccgint
	LD (qa),HL
	LD HL,(qa)
	PUSH HL
	CALL qout
	POP BC
	LD HL,13
	PUSH HL
	CALL qputchar
	POP BC
	global qgetarg
	LD HL,1
	PUSH HL
	LD HL,qfile
	PUSH HL
	LD HL,16
	PUSH HL
	CALL qgetarg
	POP BC
	POP BC
	POP BC
	PUSH HL
	LD HL,1
	CALL ccneg
	CALL cceq
	LD A,H
	OR L
	JP Z,cc3
	global qexit
	CALL qexit
cc3:
	global qfopen
	LD HL,qfile
	PUSH HL
	LD HL,cc1+413
	PUSH HL
	CALL qfopen
	POP BC
	POP BC
	LD (qinfile),HL
	LD HL,2
	PUSH HL
	LD HL,qfile
	PUSH HL
	LD HL,16
	PUSH HL
	CALL qgetarg
	POP BC
	POP BC
	POP BC
	PUSH HL
	LD HL,1
	CALL ccneg
	CALL cceq
	LD A,H
	OR L
	JP Z,cc4
	CALL qexit
cc4:
	LD HL,qfile
	PUSH HL
	LD HL,cc1+415
	PUSH HL
	CALL qfopen
	POP BC
	POP BC
	LD (qoutfile),HL
cc5:
	global qgetc
	LD HL,(qinfile)
	PUSH HL
	CALL qgetc
	POP BC
	LD (qc),HL
	PUSH HL
	LD HL,1
	CALL ccneg
	CALL ccne
	LD A,H
	OR L
	JP Z,cc6
	global qputc
	LD HL,(qc)
	PUSH HL
	LD HL,(qoutfile)
	PUSH HL
	CALL qputc
	POP BC
	POP BC
	JP cc5
cc6:
	global qfclose
	LD HL,(qoutfile)
	PUSH HL
	CALL qfclose
	POP BC
	RET
cc1:	DEFB 104,101,108,108,111,44,32,119,111,114
	DEFB 108,100,13,0,32,117,58,32,37,117
	DEFB 32,13,0,32,120,58,32,37,120,32
	DEFB 13,0,32,115,58,32,37,115,32,13
	DEFB 0,104,101,108,108,111,0,32,99,58
	DEFB 32,37,99,32,13,0,116,121,112,101
	DEFB 32,97,32,115,116,114,105,110,103,58
	DEFB 32,0,13,116,121,112,101,32,97,32
	DEFB 99,104,97,114,97,99,116,101,114,58
	DEFB 0,32,32,84,104,101,32,99,104,97
	DEFB 114,97,99,116,101,114,32,119,97,115
	DEFB 32,0,84,104,101,32,70,105,98,98
	DEFB 111,110,97,99,99,105,32,115,101,113
	DEFB 117,101,110,99,101,46,46,46,37,100
	DEFB 44,32,37,100,44,32,37,100,44,32
	DEFB 37,100,13,0,116,104,101,32,115,113
	DEFB 117,97,114,101,32,114,111,111,116,32
	DEFB 111,102,32,50,32,105,115,32,37,49
	DEFB 53,46,49,50,102,13,0,0,0,0
	DEFB 0,0,130,109,111,114,101,32,110,117
	DEFB 109,98,101,114,115,58,32,99,61,37
	DEFB 49,50,46,51,101,44,32,109,112,47
	DEFB 109,101,61,37,57,46,51,101,44,32
	DEFB 104,98,97,114,61,37,101,13,0,0
	DEFB 128,117,243,14,157,160,142,199,131,101
	DEFB 139,29,199,81,3,39,39,45,49,52
	DEFB 61,37,101,44,32,45,46,48,48,49
	DEFB 52,61,37,101,44,32,49,52,61,37
	DEFB 101,44,32,46,48,48,49,52,61,37
	DEFB 101,13,0,0,0,0,0,96,132,197
	DEFB 109,52,128,55,119,0,0,0,0,96
	DEFB 132,197,109,52,128,55,119,0,0,0
	DEFB 0,0,129,205,204,204,204,12,129,123
	DEFB 20,174,71,1,129,166,155,196,32,0
	DEFB 129,93,220,70,3,0,129,214,226,83
	DEFB 0,0,129,124,99,8,0,0,129,192
	DEFB 214,0,0,0,129,122,21,0,0,0
	DEFB 129,38,2,0,0,0,129,55,0,0
	DEFB 0,0,129,5,0,0,0,0,129,1
	DEFB 0,0,0,0,129,0,0,0,0,0
	DEFB 129,0,0,0,0,0,130,0,0,0
	DEFB 0,64,130,114,0,119,0
qout:
	LD HL,cc7+0
	PUSH HL
	LD HL,(qline)
	INC HL
	LD (qline),HL
	DEC HL
	PUSH HL
	LD HL,6
	ADD HL,SP
	CALL ccgint
	PUSH HL
	LD A,3
	CALL qprintf
	POP BC
	POP BC
	POP BC
	RET
cc7:	DEFB 9,37,100,58,32,37,100,0
qalpha:
	LD HL,1
	LD HL,cc8+0
	PUSH HL
	CALL qputs
	POP BC
	global qbeta
	CALL qbeta
	global qgamma
	CALL qgamma
	CALL qgamma
	LD HL,cc8+16
	PUSH HL
	CALL qputs
	POP BC
	RET
cc8:	DEFB 13,101,110,116,101,114,105,110,103,32
	DEFB 97,108,112,104,97,0,13,97,108,112
	DEFB 104,97,32,115,105,103,110,105,110,103
	DEFB 32,111,102,102,0
qbeta:
	LD HL,2
	LD HL,cc9+0
	PUSH HL
	CALL qputs
	POP BC
	CALL qgamma
	LD HL,cc9+15
	PUSH HL
	CALL qputs
	POP BC
	RET
cc9:	DEFB 13,101,110,116,101,114,105,110,103,32
	DEFB 98,101,116,97,0,13,98,101,116,97
	DEFB 32,115,105,103,110,105,110,103,32,111
	DEFB 102,102,0
qgamma:
	LD HL,3
	LD HL,cc10+0
	PUSH HL
	CALL qputs
	POP BC
	global qerr
	LD HL,cc10+16
	PUSH HL
	CALL qerr
	POP BC
	LD HL,cc10+29
	PUSH HL
	CALL qputs
	POP BC
	RET
cc10:	DEFB 13,101,110,116,101,114,105,110,103,32
	DEFB 103,97,109,109,97,0,106,117,115,116
	DEFB 32,116,101,115,116,105,110,103,0,13
	DEFB 103,97,109,109,97,32,115,105,103,110
	DEFB 105,110,103,32,111,102,102,0
	global qputnum
qputnum:
	LD HL,2
	ADD HL,SP
	CALL ccgint
	PUSH HL
	LD HL,0
	CALL cclt
	LD A,H
	OR L
	JP Z,cc12
	LD HL,2
	ADD HL,SP
	PUSH HL
	LD HL,4
	ADD HL,SP
	CALL ccgint
	CALL ccneg
	CALL ccpint
	LD HL,45
	PUSH HL
	CALL qputchar
	POP BC
cc12:
	LD HL,2
	ADD HL,SP
	CALL ccgint
	PUSH HL
	LD HL,9
	CALL ccgt
	LD A,H
	OR L
	JP Z,cc13
	LD HL,2
	ADD HL,SP
	CALL ccgint
	PUSH HL
	LD HL,10
	POP DE
	CALL ccdiv
	PUSH HL
	CALL qputnum
	POP BC
cc13:
	LD HL,48
	PUSH HL
	LD HL,4
	ADD HL,SP
	CALL ccgint
	PUSH HL
	LD HL,10
	POP DE
	CALL ccdiv
	EX DE,HL
	POP DE
	ADD HL,DE
	PUSH HL
	CALL qputchar
	POP BC
	RET
qoutf:
	LD HL,cc14+0
	PUSH HL
	LD HL,4
	ADD HL,SP
	CALL dload
	CALL dpush
	LD A,4
	CALL qprintf
	EX DE,HL
	LD HL,8
	ADD HL,SP
	LD SP,HL
	EX DE,HL
	RET
cc14:	DEFB 32,37,49,54,46,49,51,102,32,13
	DEFB 0
qinfile:	DEFS 2
qfile:	DEFS 16
qline:	DEFS 2
qa:	DEFS 2
qb:	DEFS 2
qc:	DEFS 2
qd:	DEFS 2
qe:	DEFS 6
qf:	DEFS 6
qchr:	DEFS 1
qbuf:	DEFS 80
qoutfile:	DEFS 2

; --- End of Compilation ---
