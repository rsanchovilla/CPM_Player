
/*MI - C  v-3.183  (C) COPYRIGHT  G. KERSTING / H. ROSE, 1983*/

DOUBLE ATOF(STR)
CHAR *STR;
{
   STATIC INT  EXPO, MINUS, ZIFFZAE;
   STATIC DOUBLE DOWERT, EEX;
   DOWERT = 0.0;
   EXPO = MINUS = ZIFFZAE = 0;
   WHILE (ISSPACE (*STR))
	++STR;
   IF (*STR == '+')
	++STR;
   IF (*STR == '-')
	{
	MINUS = 1;
	++STR;
	}
   WHILE ( ISDIGIT(*STR) )
	DOWERT= DOWERT*10. + (*STR++ -'0');
   IF ( *STR == '.' )
	{
	EEX = 1.0;
	++STR;
	WHILE ( ISDIGIT(*STR) )
	   {
	   EEX *= 10.;
	   DOWERT = DOWERT*10 + (*STR++ - '0');
	   }
	DOWERT /= EEX;
	}
   IF ( DOWERT )
	IF ( TOUPPER(*STR) == 'E' )
	   {
	   EXPO = ATOI(++STR);
	   IF ((EXPO += (*( ((CHAR*)&DOWERT) + 7) -128)) >127)
		{
		DOWERT = 0.9999999999999;
		*( ((CHAR *) &DOWERT) + 7) = 0XFF;
		}
	   ELSE
		IF ( EXPO < -128 )
		   RETURN 0.0;
		ELSE
	   	   *( ( (CHAR *) &DOWERT ) + 7 ) = EXPO + 128;
	   }
   IF ( MINUS )
	RETURN -DOWERT;
   RETURN DOWERT;
}

DOUBLE ABSD(D)
DOUBLE D;
{
   IF ( D >= 0 )
	RETURN D;
   RETURN -D;
}

/*		*/

LONG ATOL(HSTR)
CHAR *HSTR;
{
   STATIC CHAR *STR;
   STATIC LONG WERT;
   INT MINUS;
   MINUS = 0;
   WERT = 0L;
   STR= HSTR;
   WHILE (ISSPACE (*STR))
	++STR;
   IF (*STR == '+')
	++STR;
   IF (*STR == '-')
	{
	MINUS = 1;
	++STR;
	}
   WHILE ( ISDIGIT (*STR) )
	WERT = WERT * 10L + (*STR++ - '0');
   IF ( MINUS )
	RETURN -WERT;
   RETURN WERT;
}

LONG ABSL(L)
LONG L;
{
   IF ( L >= 0 )
	RETURN L;
   RETURN -L;
}

/*		*/

STATIC CHAR *ASCZIF = &"9876543210123456789"[9];

ATOI(HSTR)
CHAR *HSTR;
{
   STATIC CHAR *STR;
   STATIC INT WERT, MINUS;
   MINUS = WERT = 0;
   STR=HSTR;
   WHILE (ISSPACE(*STR))
	++STR;
   IF (*STR == '+')
	++STR;
   IF (*STR == '-')
	{
	MINUS = 1;
	++STR;
	}
   WHILE ( ISDIGIT (*STR) )
	WERT = WERT*10 + (*STR++ - '0');
   IF ( MINUS )
	RETURN - WERT;
   RETURN WERT;
}

ITOA(HZAHL,HSTR)
INT HZAHL;
CHAR *HSTR;
{
   STATIC INT I, MINUS, ZAHL;
   STATIC CHAR RSTR[9], *STR;
   RSTR[0]= 0;
   STR=HSTR;
   IF ( MINUS = ((ZAHL= HZAHL) < 0) )
	ZAHL = -ZAHL;
   I = 1;
   IF (ZAHL)
	{
	WHILE ( ZAHL )
	   {
	   RSTR[I++] = ASCZIF[ZAHL % 10];
	   ZAHL /= 10;
	   }
	IF (MINUS)
	   *STR++ = '-';
	}
   ELSE
	RSTR[I++] = '0';
   WHILE (*STR++ = RSTR[--I] )  ;
}

ABS(I)
INT I;
{
   IF (I >= 0)
	RETURN I;
   RETURN -I;
}

/*		*/

#INCLUDE IODEF.C

EXTERN UNSIGNED HPROAD, HSPADR;
TYPEDEF UNION INFB {
		INT ZEI;
		STRUCT {
			UNION INFB *PTR;
			UNSIGNED LAENGE;
			UNSIGNED PRUEF;
			INT DUMMY;
			} INFO;
		   } INFBLO;
STATIC INFBLO ANFBLO; 		
/* STATIC INFBLO *XXXLET = NULL;   */
EXTERN INFBLO *XXXLET;

CALLOC(N, EINH)
UNSIGNED N, EINH;
{
   STATIC INFBLO *PTR1, *PTR2, *JSBRK;
   STATIC UNSIGNED BYTPLATZ, HADR;
   BYTPLATZ = 1 + (( N * EINH + 7) >> 3);
   IF ( (PTR1 = XXXLET) == NULL )
	{
	ANFBLO.INFO.PTR = XXXLET = PTR1 = &ANFBLO;
	ANFBLO.INFO.PRUEF = 
	ANFBLO.INFO.LAENGE = 0;
	}
   PTR2 = PTR1->INFO.PTR;
   WHILE (1)
	{
	IF ( PTR2  -> INFO.LAENGE >= BYTPLATZ )
	   {
	   IF ( PTR2 ->INFO.LAENGE == BYTPLATZ )
		PTR1 -> INFO.PTR = PTR2 -> INFO.PTR;
	   ELSE
		{
		PTR2 -> INFO.LAENGE -= BYTPLATZ;
		PTR2 += PTR2 -> INFO.LAENGE;
		PTR2 -> INFO.LAENGE = BYTPLATZ;
		}
	   PTR2 -> INFO.PRUEF = ~ BYTPLATZ;
	   XXXLET = PTR1;
	   RETURN ( (CHAR*)(PTR2+1));
	   }
	IF ( PTR2 == XXXLET )
	   {
	   IF ( ( JSBRK = SBRK(BYTPLATZ << 3) ) == NULL )
		RETURN NULL;
	   JSBRK -> INFO.PRUEF =
	   ~ (JSBRK -> INFO.LAENGE = BYTPLATZ);
	   CFREE (JSBRK + 1);
	   }
	PTR1 = PTR2;
	PTR2 = PTR2 -> INFO.PTR;
   }  
}

CFREE(PTR)
CHAR *PTR;
{
   STATIC INFBLO *PTR1, *PTR2;
   PTR1 = (INFBLO *) PTR  - 1;
   IF (PTR1 -> INFO.LAENGE + PTR1 -> INFO.PRUEF + 1)
	RETURN -1;
   PTR1 -> INFO.PRUEF= 0;
   FOR (PTR2 = XXXLET; !(PTR1 > PTR2 && PTR1 < PTR2->INFO.PTR);
			PTR2 = PTR2 -> INFO.PTR)
	IF ( PTR2 >= PTR2 -> INFO.PTR && (PTR1 > PTR2 ||
				PTR1 < PTR2 -> INFO.PTR) )
		BREAK;
   IF ( (PTR1 + PTR1 -> INFO.LAENGE) == PTR2 -> INFO.PTR )
	{
	PTR1->INFO.LAENGE += PTR2->INFO.PTR->INFO.LAENGE;
	PTR1->INFO.PTR = PTR2->INFO.PTR->INFO.PTR;
	}
   ELSE
	PTR1->INFO.PTR = PTR2->INFO.PTR;
   IF ( PTR2 + PTR2->INFO.LAENGE == PTR1 )
	{
	PTR2->INFO.LAENGE += PTR1->INFO.LAENGE;
	PTR2->INFO.PTR = PTR1->INFO.PTR;
	}
   ELSE
	PTR2->INFO.PTR = PTR1;
   XXXLET = PTR2;
 RETURN 0;
} 

STRSAVE(STR)
CHAR *STR;
{
   CHAR *SAVPOI;
   IF ( (SAVPOI = CALLOC(STRLEN(STR)+1,1) )  != NULL )
	STRCPY(SAVPOI,STR);
   RETURN SAVPOI;
}

/*		*/

#DEFINE VASM 1
#IFNDEF VASM
/*
STATIC CHAR *HSTR1, *HSTR2, *IND;;
STATIC UNSIGNED MAX; 
*/
#ELSE
#ASM
HSTR1:	DS 2
HSTR2:	DS 2
IND:	DS 2
MAX:	DS 2
#ENDASM
#ENDIF

STRCMP(STR1, STR2)
CHAR *STR1, *STR2;
{
#IFNDEF VASM
	WHILE ( *STR1  == * STR2  )
	   {
	   IF(*STR1 ++)
		++ STR2;
	   ELSE
		RETURN 0;
	   }
	RETURN (*STR1 - *STR2);
#ELSE	VASM
#ASM
	POP	B		
	POP	D		
	POP	H
	PUSH	H
	PUSH	D
	PUSH	B
STRCM1:				
	LDAX	D
	CMP	M
	JNZ	STRCM2		
	ORA	A		
	JZ	STRCM2		
	INX	D		
	INX	H
	JMP	STRCM1
STRCM2:
	SUB	M		
	MOV	L,A		
	SBB	A
	MOV	H,A
	RET			
#ENDASM
#ENDIF	VASM
}

INDEX(STR1, STR2)
CHAR *STR1, *STR2;
{
#IFNDEF	VASM 
	STATIC INT I;
	STATIC CHAR *VSTR1, *VSTR2;
	I = 0;
	WHILE (STR1[I])
	   {
	   VSTR1= STR1 + I;
	   VSTR2= STR2;
	   WHILE (1)
		{
		IF ( *VSTR2) 
		   IF (*VSTR2 == *VSTR1++)
			{
			++VSTR2;
			CONTINUE;
			}
		   ELSE
			{
			++I;
			BREAK;
			}
		ELSE
		   RETURN I;
		}
	   }
	RETURN -1;

#ELSE	VASM
#ASM
	LXI	H,0		
	SHLD	IND
	POP	B		
	POP	D		
	POP	H
	SHLD	HSTR2
	XCHG
	SHLD	HSTR1
	PUSH	D
	PUSH	H
	PUSH	B
IND1:
	XCHG			
	LHLD	HSTR2		
	XCHG
	CALL	COMPAR		
	JZ	GLEICH
	LHLD	IND		
	INX	H
	SHLD	IND
	LHLD	HSTR1
	MOV	A,M		
	ANA	A		
	JZ	UNGLE
	INX	H
	SHLD	HSTR1		
	JMP	IND1
#ENDASM
#ENDIF	VASM
}

#IFDEF	VASM
#ASM
COMPAR:
	LDAX	D
	ORA	A		
	RZ			
	CMP	M
	RNZ			
	INX	D		
	INX	H
	JMP	COMPAR
#ENDASM
#ENDIF

RINDEX(STR1, STR2)
CHAR *STR1, *STR2;
{
#IFNDEF	VASM
	STATIC CHAR *VSTR1, *VSTR2;
	STATIC INT ANZ, IND;
	IF ( (IND = STRLEN(STR1) - STRLEN(STR2) ) <= 0)
	   RETURN -1;
	ANZ = IND + 1;
	WHILE (ANZ--)
	   {
	   VSTR1= STR1 + IND;
	   VSTR2= STR2;
	   WHILE (1)
		{
		IF ( *VSTR2) 
		   IF (*VSTR2 == *VSTR1++)
			{
			++VSTR2;
			CONTINUE;
			}
		   ELSE
			{
			--IND;
			BREAK;
			}
		ELSE
		   RETURN IND;
		}
	   }
	RETURN -1;

#ELSE	VASM
#ASM
	POP	B		
	POP	D		
	POP	H
	SHLD	HSTR2
	XCHG
	SHLD	HSTR1
	PUSH	D
	PUSH	H
	PUSH	B
;
	CALL	STRLI0		
	MOV	B,H		
	MOV	C,L		
	LHLD	HSTR1		
	XCHG			
	CALL	STRLI0		
	MOV	A,L		
	SUB	C
	MOV	L,A
	MOV	A,H
	SBB	B
	MOV	H,A
	JC	UNGLE		
	SHLD	IND		
	XCHG
	LHLD	HSTR1		
	DAD	D
RIND2:
	XCHG			
	LHLD	HSTR2		
	XCHG
	CALL	COMPAR		
	JZ	GLEICH
	LHLD	IND		
	MOV	A,H
	ORA	L
	JZ	UNGLE
	DCX	H		
	SHLD	IND
	XCHG
	LHLD	HSTR1
	DAD	D		
	JMP	RIND2
GLEICH:
	LHLD	IND		
	RET
UNGLE:
	LXI	H,-1		
	RET
#ENDASM
#ENDIF	VASM
}

#IFDEF	VASM
#ASM
MAXNUL:
	MOV	A,B		
	RAL
	JC	MAXN1		
	MOV	A,B		
	ORA	C
	RNZ			
MAXN1:
	XRA	A		
NULLRET:
	MOV	H,A		
	MOV	L,A
	RET
STRLI0:
	LXI	H,0		
STRLI1:
	LDAX	D		
	ANA	A
	RZ
	INX	H
	INX	D
	JMP	STRLI1
#ENDASM
#ENDIF	VASM

STRNCAT(STR1, STR2, MAX)
CHAR *STR1, *STR2;
INT MAX;
{
#IFNDEF VASM
	STATIC INT I;
	IF ( (I = MAX) <= 0 )
	   RETURN;
	WHILE ( *STR1 ++ ) ;
	-- STR1;
	WHILE ( I-- && (*STR1 ++ = * STR2 ++) ) ;
	*STR1 = 0;
#ELSE	VASM
#ASM
	LXI	H,7		
	DAD	SP		
	MOV	B,M		
	DCX	H
	MOV	C,M
	DCX	H
	MOV	D,M
	DCX	H
	MOV	E,M
	DCX	H
	MOV	A,M
	DCX	H
	MOV	L,M
	MOV	H,A
;
	CALL	MAXNUL		
	RZ			
STNCA1:
	MOV	A,M		
	ANA	A		
	JZ	STNCA2
	INX	H
	JMP	STNCA1
STNCA2:
	LDAX	D		
	MOV	M,A		
	ANA	A		
	RZ			
	INX	D
	INX	H
	DCX	B		
	MOV	A,B
	ORA	C
	JNZ	STNCA2		
	MOV	M,A
	RET
#ENDASM
#ENDIF	VASM
}

STRNCPY(STR1, STR2, MAX)
CHAR *STR1, *STR2;
INT MAX;
{
#IFNDEF VASM
	STATIC INT I;
	IF ( (I = MAX) <= 0 )
	   RETURN;
	WHILE ( I-- && (*STR1++ = *STR2++) ) ;
#ELSE	VASM
#ASM
	LXI	H,7		
	DAD	SP		
	MOV	B,M		
	DCX	H
	MOV	C,M
	DCX	H
	MOV	D,M
	DCX	H
	MOV	E,M
	DCX	H
	MOV	A,M
	DCX	H
	MOV	L,M
	MOV	H,A
;
	CALL	MAXNUL		
	RZ			
STRNC1:
	LDAX	D
	MOV	M,A
	ANA	A
	RZ			
	DCX	B
	MOV	A,B
	ORA	C
	RZ			
	INX	D
	INX	H
	JMP	STRNC1
#ENDASM
#ENDIF	VASM
}

STRNCMP(STR1, STR2, MAX)
CHAR *STR1, *STR2;
INT MAX;
{
#IFNDEF VASM
	STATIC INT I;
	IF ( (I = MAX) <= 0 )
	   RETURN;
	WHILE ( *STR1  == *STR2 )
	   {
	   IF ( --I )
		{
	   	IF(*STR1 ++)
		   ++ STR2;
	   	ELSE
		   RETURN 0;
	   	}
	   ELSE
		BREAK;
	   }
	RETURN (*STR1 - *STR2);
#ELSE	VASM
#ASM
	LXI	H,7		
	DAD	SP		
	MOV	B,M		
	DCX	H
	MOV	C,M
	DCX	H
	MOV	D,M
	DCX	H
	MOV	E,M
	DCX	H
	MOV	A,M
	DCX	H
	MOV	L,M
	MOV	H,A
	XCHG
;
	CALL	MAXNUL		
	RZ			
STNCM1:				
	LDAX	D
	CMP	M
	JNZ	STRCM2		
	ORA	A
	JZ	STRCM2		
	DCX	B		
	MOV	A,B
	ORA	C
	JZ	NULLRET		
	INX	D
	INX	H
	JMP	STNCM1
#ENDASM
#ENDIF	VASM
}

/*		*/

/*
#DEFINE VASM 1
*/

STRCAT(STR1, STR2)
CHAR *STR1, *STR2;
{
#IFNDEF VASM
	WHILE ( *STR1 ++ ) ;
	-- STR1;
	WHILE ( *STR1 ++ = * STR2 ++ ) ;
#ELSE	VASM
#ASM
	POP	B		
	POP	H		
	POP	D
	PUSH	D
	PUSH	H
	PUSH	B
STRCA1:
	MOV	A,M		
	ANA	A		
	JZ	STRCA2
	INX	H
	JMP	STRCA1
STRCA2:
	LDAX	D		
	MOV	M,A		
	ANA	A
	RZ
	INX	D
	INX	H
	JMP	STRCA2
#ENDASM
#ENDIF	VASM
}

STRCPY(STR1, STR2)
CHAR *STR1, *STR2;
{
#IFNDEF VASM
	WHILE ( *STR1 ++ = * STR2 ++ ) ;
#ELSE	VASM
#ASM
	POP	B		
	POP	H		
	POP	D
	PUSH	D
	PUSH	H
	PUSH	B
;
STRCP1:
	LDAX	D
	MOV	M,A
	ANA	A
	RZ
	INX	D
	INX	H
	JMP	STRCP1
#ENDASM
#ENDIF	VASM
}

STRLEN(STR1)
CHAR *STR1;
{
#IFNDEF VASM
	STATIC CHAR *PTR;
	PTR = STR1;
	WHILE (*PTR ++) ;
	RETURN ( PTR - STR1 -1);
#ELSE	VASM
#ASM
	POP	B		
	POP	D
	PUSH	D
	PUSH	B
STRL0:
	LXI	H,0		
STRL1:
	LDAX	D		
	ANA	A
	RZ
	INX	H
	INX	D
	JMP	STRL1
#ENDASM
#ENDIF	VASM
}

/*		*/
/*
#DEFINE VASM 1
*/

ISALPHA(C)
INT C;
{
#IFNDEF VASM
  IF ((C >= 'A' && C <= 'Z') || (C >= 'a' && C <= 'z'))
	RETURN C;
  RETURN 0;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
ISALP2:				
	LXI	H,0		
	ORA	A		
	RNZ			
	MOV	A,E		
	CPI	'A'		
	RC			
	CPI	7BH		
	RNC			
	MOV	L,A		
	CPI	'Z'+1		
	RC			
	CPI	61H		
	RNC			
	MVI	L,0
#ENDASM
#ENDIF
}

ISUPPER(C)
INT C;
{
#IFNDEF	VASM
   IF (C >= 'A' && C <= 'Z')
	RETURN C;
   RETURN 0;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
;
	LXI	H,0		
	ORA	A		
	RNZ			
	MOV	A,E		
	CPI	'A'		
	RC			
	CPI	'Z'+1		
	RNC			
	MOV	L,A
#ENDASM
#ENDIF
}

ISLOWER(C)
INT C;
{
#IFNDEF	VASM
   IF  (C >= 'a' && C <= 'z')
	RETURN C;
   RETURN 0;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
;
	LXI	H,0		
	ORA	A		
	RNZ			
	MOV	A,E		
	CPI	61H		
	RC			
	CPI	7BH		
	RNC			
	MOV	L,A
#ENDASM
#ENDIF
}

ISDIGIT(C)
INT C;
{
#IFNDEF	VASM
   IF (C >= '0' && C <= '9')
	RETURN C;
   RETURN 0;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
;
	LXI	H,0		
	ORA	A		
	RNZ			
ISDIG2:				
	MOV	A,E		
	CPI	'0'		
	RC			
	CPI	'9'+1		
	RNC			
	MOV	L,A
#ENDASM
#ENDIF
}

ISSPACE(C)
INT C;
{
#IFNDEF VASM
   IF (C == ' ' || C == '\T' || C == '\N' || C == '\R')
	RETURN C;
   RETURN 0;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
;
	LXI	H,0		
	ORA	A		
	RNZ			
	MOV	A,E		
	MOV	L,A
	CPI	9		
	RZ			
	CPI	0AH		
	RZ			
	CPI	' '		
	RZ			
	CPI	0DH		
	RZ			
	MVI	L,0
#ENDASM
#ENDIF
}

TOLOWER(C)
INT C;
{
#IFNDEF VASM
 IF (C >= 'A' && C <= 'Z')
  RETURN C + 0X20;
 RETURN C;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
	MOV	D,A
;
	XCHG
	ORA	A		
	RNZ			
	MOV	A,L		
	CPI	'A'		
	RC			
	CPI	'Z'+1		
	RNC			
	ADI	20H		
	MOV	L,A
#ENDASM
#ENDIF
}

TOUPPER(C)
INT C;
{
#IFNDEF VASM
 IF (C >= 'a' && C <= 'z')
  RETURN C - 0X20;
 RETURN C;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
	MOV	D,A
;
	XCHG
	ORA	A		
	RNZ			
	MOV	A,L		
	CPI	61H		
	RC			
	CPI	7BH		
	RNC			
	SUI	20H		
	MOV	L,A
#ENDASM
#ENDIF
}

ISASCII(C)
INT  C;
{
#IFNDEF VASM
 IF (C & 0XFF80)
  RETURN 0;
 RETURN C;
#ELSE	VASM
#ASM
	LXI	H,2		
	DAD	SP
	MOV	E,M		
	INX	H
	MOV	A,M		
;
	LXI	H,0		
	ORA	A		
	RNZ			
	MOV	A,E		
	RAL
	RC			
	MOV	L,E
#ENDASM
#ENDIF
}

ISALNUM(C)
INT C;
{
#IFNDEF	VASM
   IF ( ISALPHA(C) )
	RETURN C;
   RETURN ISDIGIT(C);
#ELSE VASM
#ASM
	LXI	H,2
	DAD	SP
	MOV	E,M
	INX	H
	MOV	D,M
	MOV	A,D
	CALL	ISALP2		
	MOV	A,H
	ORA	L
	RNZ
	JMP	ISDIG2
#ENDASM
#ENDIF	VASM
}

/*		*/
#ASM
	ENTRY SBRK
	ENTRY HPROAD
	ENTRY HSPADR
	EXT XXXERS
;
HPROAD:	DS 2
HSPADR:	DS 2
;
SBRK:
	LDA	XXXERS
	ANA	A
	JZ	SBRK1
	XRA	A
	STA	XXXERS
	LXI	H,MEMMAX
	LXI	D,PROMAX
	MOV	A,E
	SUB	L
	MOV	A,D
	SBB	H
	JC	SBRK2
	XCHG
SBRK2:
	SHLD	HPROAD
	SHLD	HSPADR
SBRK1:
	LXI	H,-1024
	DAD	SP
	MOV	C,L
	MOV	B,H
	LXI	H,2		
	DAD	SP
	MOV	E,M
	INX	H
	MOV	D,M
	LHLD	HSPADR		
	PUSH	H		
	MOV	A,E
	ADD	L
	MOV	L,A
	MOV	A,D
	ADC	H
	MOV	H,A
	JC	KEINPL
	MOV	A,C		
	SUB	L		
	MOV	A,B
	SBB	H
	POP	D		
	JC	KEINPL		
				
	SHLD	HSPADR		
	XCHG			
	RET
KEINPL:
	LXI	H,0
	RET
;

#ASM

;MI - C  v-3.18   (C) COPYRIGHT  G. KERSTING / H. ROSE, 1983
; HILFSVARIABLEN ZUR BESTIMMEN DES FREIEN SPEICHERS 
; 	+ INITILALISIERUNGSPROZEDUR 
;
	ENTRY MEMMAX
	ENTRY PROMAX
	ENTRY XXXINI
;
	ENTRY XXXMER,XXXDAT,XXXZEI,XXXLET,XXXERS,CCTRCV
	ENTRY XXXBEL
;
XXXINI:
	LXI H,1
	SHLD XXXERS	
	DCX H
	SHLD XXXMER	
	SHLD XXXDAT	
	SHLD XXXZEI	
	SHLD XXXZEI+2	
;
	SHLD XXXLET	
	DCX H
	SHLD CCTRCV	
	RET
;
	DSEG
XXXBEL:
XXXMER:	DS 2
XXXDAT:	DS 2
XXXZEI:	DS 2
	DS 2
;
XXXERS:	DS 2
XXXLET:	DS 2
CCTRCV:	DS 2
	CSEG
;
	DSEG
;
	DS 1
MEMMAX	EQU $
	CSEG
;
	DS 1
PROMAX	EQU $

#ENDASM
