
/*MI - C  v-3.183  (C) COPYRIGHT  G. KERSTING / H. ROSE, 1983*/

/*
 KURZVESION DER EIN-AUSGABEFUNKTIONEN FUER MI - C V3.18 

DIESE EINFACHEREN UND KUERZEREN FUNKTIONEN KOENNEN EINEN 
GROSSEN TEIL DER FUNKTIONEN AUS DER CIO.C (BZW. IN DER 
LIB.REL DIE MODULE VON FSEEK BIS NAM EINSCHLIESSLICH UND CHIO) 
ERSETZEN. EINZELNE FUNKTIONEN DUERFEN NICHT OHNE WEITERES 
AUSGETAUSCHT WERDEN. DIE UNGEPUFFERTE EIN- AUSGABE EBENSO 
WIE FSEEK SIND NICHT MEHR MOEGLICH.
FOPEN LAESST MAXIMAL XXXANZ (VOREINGESTELLT 4) GLEICHZEITIG 
EROEFNETE DATEIEN ZU. DIE EROEFFNUNGSART KANN "R" ODER "W"
SEIN.
DIE DATEI STDIO.H MUSS DANN DURCH STDIO-KU.RZ ERSETZT WERDEN.

IM ALLGEMEINEN HABEN PROGRAMME MIT DER KURZVERSION DER EIN-
AUSGABE LAENGERE LAUFZEITEN.

*/

/*   3/83, 10/83  */
#DEFINE EOL	13
#DEFINE LF	10
#DEFINE NULL	0
#DEFINE EOF	-1
#DEFINE STDIN	111
#DEFINE STDOUT	112
#DEFINE STDERR	112
#DEFINE _EXIT	XEXIT
/*  */

GETCHAR()
	{RETURN BDOS(1,1) & 127;}

PUTCHAR(C)
INT C;
	{BDOS(C,2);RETURN C;}

CHRRDY()
	{ RETURN BDOS(0,11) & 1; }

_EXIT(N)
INT N;
{
   BDOS(0,0);
}
/*	CP/M SUPPORT ROUTINE  FLOAT - VERSION
	RETURNS H=B, L=A
 */
BDOS (DE,C)
CHAR *DE; INT C;
{
#ASM
	POP H		; RETURN ADDRESSE
	POP D		; DE REGISTER
	POP B		; BDOS FUNCTION 
	PUSH B
	PUSH D		
	PUSH H
	CALL 5		; CP/M BDOS
	MOV H,B		;FUER CP/M 1.4
	MOV L,A
#ENDASM
}
/*  */
TYPEDEF CHAR  * FILE;
#DEFINE XXXANZ 4
#DEFINE XXXBLAE XXXANZ * 128
#DEFINE XXXFLAE XXXANZ * 36
STATIC CHAR XXXBUFF[XXXBLAE];
STATIC CHAR XXXFCB[XXXFLAE];
STATIC INT XXXPOI[XXXANZ];

/*STATIC INT XXXBEL[XXXANZ]= {0};*/
EXTERN INT XXXBEL[XXXANZ];

/*  */

FOPEN(HNAME,TYP)
CHAR *HNAME,*TYP;
{	STATIC INT I,K, NUM;
	STATIC CHAR *FPOI, *NAME;
	NUM=I=0;
	WHILE (1)
		{IF (! XXXBEL[NUM]) BREAK;
		IF ( ++NUM==XXXANZ) RETURN NULL;
		}
	IF (*TYP == 'R')XXXBEL[NUM]=1;
	ELSE IF (*TYP == 'W') XXXBEL[NUM]=2;
		ELSE RETURN NULL;
	FPOI=XXXFCB+NUM*36;
	WHILE ((I++) < 12) FPOI[I]=' ';
	IF (((NAME = HNAME)[1] == ':') && *NAME)
		{ IF (! NAME[2])
			{
 FLAB:			XXXBEL[NUM]=0;
			RETURN NULL;
			}
		*FPOI= *NAME & 15;
		I=2;
		}
	ELSE *FPOI=I=0;
	K=1;
	WHILE (NAME[I])
		{IF (NAME[I] == '.') {I++; BREAK;}
		IF (K == 9) BREAK;
		FPOI[K++]= TOUPPER(NAME[I++]);
		}
	K=9;
	IF (NAME[I-1] != '.')
		WHILE (NAME[I])
			{IF(NAME[I++]=='.') BREAK;
			IF(I > 20) GOTO FLAB;
			}
	WHILE (NAME[I])
		{FPOI[K++]= TOUPPER(NAME[I++]);
		IF (K == 12) BREAK;
		}
	/* FCB NUN BELEGT */
	IF (K== 1) GOTO FLAB;
	FPOI[12]=0;
	IF (*TYP == 'R')
		{XXXPOI[NUM]=128;
		IF((BDOS(FPOI,15)&255) == 255) GOTO FLAB;
		}
	ELSE
		{XXXPOI[NUM]=0;
		BDOS(FPOI,19);
		IF((BDOS(FPOI,22)&255) == 255) GOTO FLAB;
		}
	FPOI[32]=0;
	RETURN NUM+1;
}

GETC(HUNIT)
CHAR HUNIT;
{  STATIC INT UNIT;
   IF ((UNIT=HUNIT) == STDIN) RETURN GETCHAR();
   IF (UNIT-- > XXXANZ) RETURN EOF;
   IF (XXXBEL[UNIT] != 1) RETURN EOF;
   IF (XXXPOI[UNIT] < 128)
	RETURN XXXBUFF[(UNIT << 7)+XXXPOI[UNIT]++] & 255;
   BDOS(XXXBUFF+(UNIT << 7),26);
   XXXPOI[UNIT]=1;
   IF(BDOS(XXXFCB+UNIT*36,20) & 255) RETURN EOF;
   RETURN XXXBUFF[UNIT << 7] & 255;
}

PUTC(C,HUNIT)
INT C; CHAR HUNIT;
{  STATIC INT UNIT;
   IF ((UNIT=HUNIT) == STDOUT) RETURN PUTCHAR(C);
   IF (UNIT-- > XXXANZ) RETURN EOF;
   IF (XXXBEL[UNIT] != 2) RETURN EOF;
   IF (XXXPOI[UNIT] < 128)
	{XXXBUFF[(UNIT << 7)+XXXPOI[UNIT]++]=C;
	RETURN C;
	}
   BDOS(XXXBUFF+(UNIT << 7),26);
   XXXPOI[UNIT]=1;
   IF(BDOS(XXXFCB+UNIT*36,21) & 255) RETURN EOF;
   XXXBUFF[UNIT << 7]=C;
   RETURN C;
}

FCLOSE(UNIT)
CHAR UNIT;
{
	IF (UNIT-- > XXXANZ) RETURN EOF;
	IF (XXXBEL[UNIT] == 2)
		{ WHILE(XXXPOI[UNIT]<128) PUTC(26,UNIT+1);
		IF (PUTC(26,UNIT+1) == EOF)
		   {BDOS(XXXFCB+UNIT*36,16);
		   XXXBEL[UNIT]=0;
		   RETURN EOF;
		   }
		XXXBEL[UNIT]=0;
		IF((BDOS(XXXFCB+UNIT*36,16)&255)==255)
			RETURN EOF;
		RETURN 1;
		}
	IF (XXXBEL[UNIT] == 1) 
	   { XXXBEL[UNIT]=0;
	   RETURN 1;
	   }
	XXXBEL[UNIT]=0;
	RETURN EOF;
}

CLOSAL()
{
   STATIC INT I;
   FOR (I=1; I <= XXXANZ; ++I)
	FCLOSE(I);
}

EXIT(N)
INT N;
{
   CLOSAL();
   _EXIT();
}


		IF (PUTC(26,UNIT+1) == EOF)
		   {BDOS(XXXFCB+UNIT*36,16);
		   XXXBEL[UNIT]=0;
		   RETURN EOF;
		   }
		XXXBEL[UNIT]=0;
		IF((BDOS(XXXFCB+UNIT*36,16)&255)==255)
			RETURN EOF;
		RETURN 1;
		}
	IF (XXXBEL[UNIT] == 1) 
	   { XXXBEL[UNIT]=0;
	   RETURN 1;
	   }
	XXXBEL[UNIT]=0;
	RETURN EOF;
}

CLOSAL()
{
   STATIC INT I;
   FOR (I=1; I <= XXXANZ; ++I)
	FCLOċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċċ