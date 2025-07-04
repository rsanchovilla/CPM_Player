
/*
	CC0T.C -- TRS-80 C PREPROCESSOR
	WRITTEN BY LEOR ZOLMAN

	THIS PROGRAM TAKES, AS INPUT, A C SOURCE FILE WRITTEN
	USING THE SPECIAL "POUND SIGN" ENCODING FOR CHARACTERS
	WHICH ARE UNPRINTABLE (AND UNENTERABLE) ON THE EARLY
	MODEL TRS-80 COMPUTERS. WHEREVER CC0T FINDS A SEQUENCE
		#X
	IN THE INPUT FILE, WHERE "X" IS ONE OF THE SPECIAL
	CHARACTERS AS OUTLINED IN THE SOURCE FOR CONVERT.C,
	THEN THE TWO-CHARACTER SEQUENCE IS CONVERTED TO A
	SINGLE CHARACTER AS REQUIRED BY THE BDS C COMPILER.
	THE RESULTANT FILE MAY THEN BE COMPILED WITH CC1, CC2,
	ETC.

*/

#INCLUDE "BDSCIO.H"

#DEFINE POUND 0X23
#DEFINE LEFTBRACK 0X5B
#DEFINE BACKSLASH 0X5C
#DEFINE RIGHTBRACK 0X5D
#DEFINE CIRCUM 0X7E
#DEFINE VERTIBAR 0X7C
#DEFINE UNDERSCORE 0X5F
#DEFINE UPARROW 0X5E

CHAR IBUF[BUFSIZ], OBUF[BUFSIZ];

MAIN(ARGC,ARGV)
INT ARGC;
CHAR *ARGV[];
BEGIN
	INT FD1, FD2;
	CHAR C;
	IF (ARGC != 3) BEGIN
			PRINTF("USAGE: CC0T OLD NEW <CR>\N");
			EXIT();
		       END
	FD1 = FOPEN(ARGV[1],IBUF);
	IF (FD1 == ERROR) BEGIN
			PRINTF("CANNOT OPEN INPUT FILE.\N");
			EXIT();
		       END
	FD2 = FCREAT(ARGV[2],OBUF);
	IF (FD2 == ERROR) BEGIN
			PRINTF("CANNOT OPEN OUTPUT FILE.\N");
			EXIT();
		       END
	WHILE ((( C = GETC(IBUF)) != CPMEOF) && C != 255)
	BEGIN
	  IF (C != POUND) PUTC2(C);
	  ELSE SWITCH(C = GETC(IBUF))
	   BEGIN
		CASE 'B': PUTC2(BACKSLASH);
			  BREAK;
		CASE 'L': PUTC2(LEFTBRACK);	
			  BREAK;	
		CASE 'R': PUTC2(RIGHTBRACK);
			  BREAK;
		CASE 'C': PUTC2(CIRCUM);	
			  BREAK;
		CASE 'V': PUTC2(VERTIBAR);
			  BREAK;
		CASE 'U': PUTC2(UNDERSCORE);
			  BREAK;
		CASE 'H': PUTC2(UPARROW);
			  BREAK;
		DEFAULT:  PUTC2(POUND);
			  PUTC2(C);
	    END
	END

	IF (C == 255) C = CPMEOF;
	PUTC2(C);
	FFLUSH(OBUF);
	FCLOSE(OBUF);
	FCLOSE(IBUF);
END


PUTC2(C)
CHAR C;
BEGIN
	IF (PUTC(C,OBUF) < 0) BEGIN
		PRINTF("OUTPUT WRITE ERROR (DISK FULL?)\N");
		EXIT();
	END
END

