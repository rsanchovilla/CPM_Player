C ************************************************************
C	Paket von Subroutines und Functions zur Ein-/Ausgabe
C	nach G.May, "Strukturiertes Programmieren mit FORTRAN"
C ************************************************************
	SUBROUTINE LINE
C
C	Ausgabe eines Zeilenwechsels
C
	CALL PUTCH(13)
	CALL PUTCH(10)
	RETURN
	END
C-------------------------------------------
	SUBROUTINE PUTN(X)
C
C	Ausgabe einer REAL-Zahl im Format G15.7
C
	BYTE BUFFER(15)
	ENCODE(BUFFER,99) X
	DO 1 I=1,15
		CALL PUTCH(BUFFER(I))
    1	CONTINUE
	RETURN
   99	FORMAT(G15.7)
	END
C-------------------------------------------
	SUBROUTINE PUTI(N)
C
C	Ausgabe einer INTEGER-Zahl im Format I8
C
	BYTE BUFFER(8)
	ENCODE (BUFFER,99) N
	DO 1 I=1,8
		CALL PUTCH(BUFFER(I))
    1	CONTINUE
	RETURN
   99	FORMAT(I8)
	END
C-------------------------------------------
	SUBROUTINE PUTEXT(CHARS)
C
C	Ausgabe eines Strings der Laenge N, abgelegt in CHARS
C
	BYTE CHARS(1),DOLLAR
	DATA DOLLAR/'$'/
	I=1
    1	IF (CHARS(I) .EQ. DOLLAR) GOTO 99
	CALL PUTCH(CHARS(I))
	I=I+1
	GOTO 1
   99	RETURN
	END
C-------------------------------------------
	SUBROUTINE BLANK(N)
C
C	Ausgabe von N Blanks
C
	DO 1 I=1,N
		CALL PUTCH(' ')
    1	CONTINUE
	RETURN
	END
C-------------------------------------------
	SUBROUTINE PAGE
C
C	Loeschen des Konsolbildschirms
C
	CALL PUTCH(26)
C  **** (26)=> ^Z = Clear Unprotected to Space ****
	CALL PUTCH(13)
	RETURN
	END
C-------------------------------------------
	SUBROUTINE INVA(IZ,IS)
C
C	Invers Anfang
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('j')
	RETURN
	END
C--------------------------------------------
	SUBROUTINE INVE(IZ,IS)
C
C	Invers Ende
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('k')
	RETURN
	END
C---------------------------------------------
	SUBROUTINE HINA(IZ,IS)
C
C	Halbe Intensitaet Anfang
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH(')')
	RETURN
	END
C-----------------------------------------------
	SUBROUTINE HINE(IZ,IS)
C
C	Halbe Intensitaet Ende
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('(')
	RETURN
	END
C-----------------------------------------------
	SUBROUTINE PROTA(IZ,IS)
C
C	Protect Mode Anfang
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('&')
	RETURN
	END
C----------------------------------------------
	SUBROUTINE PROTE(IZ,IS)
C
C	Protect Mode Ende
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('''')
	RETURN
        END
C----------------------------------------------
	SUBROUTINE BLIA(IZ,IS)
C
C	Blinken Anfang
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('^')
	RETURN
	END
C---------------------------------------------
	SUBROUTINE BLIE(IZ,IS)
C
C	Blinken Ende
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('q')
	RETURN
	END
C---------------------------------------------
	SUBROUTINE BLAA(IZ,IS)
C
C	Blank-Field Anfang
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('_')
	RETURN
	END
C------------------------------------------------
	SUBROUTINE BLAE(IZ,IS)
C
C	Blank-Field Ende
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('q')
	RETURN
	END
C-----------------------------------------------
	SUBROUTINE ULNA(IZ,IS)
C
C	Underline Anfang
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('l')
	RETURN
	END
C----------------------------------------------
	SUBROUTINE UNLE(IZ,IS)
C
C	Underline Ende
C
	CALL POSIT(IZ,IS)
	CALL PUTCH(27)
	CALL PUTCH('m')
	RETURN
	END
C-----------------------------------------------
	SUBROUTINE POSIT(IZ,IS)
C
C	Cursor Positionieren
C
	CALL PUTCH(27)
	CALL PUTCH('=')
	CALL PUTCH(31+IZ)
	CALL PUTCH(31+IS)
	RETURN
	END
C-----------------------------------------------
	SUBROUTINE BEEP
C
C	Piepton erzeugen
C
	CALL PUTCH(7)
	RETURN
	END
C----------------------------------------------
	SUBROUTINE PUTCH(A)
C
C	Ausgabe eines Zeichens auf der Konsole
C	$TTYOT gibt den A-Reg.inhalt aus, der durch
C	die Byte-Zuweisung erzeugt wird...
C
	BYTE A,B
	B = A
	CALL $TTYOT
	RETURN
	END
C-------------------------------------------
	FUNCTION GETN(DUMMY)
C
C	Einlesen einer REAL Zahl bis ',' ' ' oder CRLF
C
	BYTE INBUF(81),BLANK,PUNKT,KOMMA,STRP,CR,NULL,FORMAT(7),TAB
	COMMON /FTNEA/ N,INBUF
	DATA BLANK/' '/,PUNKT/'.'/,KOMMA/','/,STRP/';'/,TAB/9/,
     *	CR/13/,NULL/'0'/,FORMAT/'(','F','0','0','.','0',')'/
C
    3	IF (N .EQ. 0) CALL LESEN
	   DO 1 I=N,80
		IF ((INBUF(I) .NE. BLANK).AND.
     *		    (INBUF(I) .NE. TAB)) GOTO 2
    1	   CONTINUE
	   N = 0
	   GOTO 3
C
    2	DO 4 J=I,81
		IF (INBUF(J) .EQ. BLANK) GOTO 5
		IF (INBUF(J) .EQ. KOMMA) GOTO 5
		IF (INBUF(J) .EQ. STRP ) GOTO 5
		IF (INBUF(J) .EQ. CR   ) GOTO 5
		IF (INBUF(J) .EQ. TAB  ) GOTO 5
    4	CONTINUE
    5	LEN = J-I
	N = J+1
	IF (N .GE. 80) N = 0
	IF ((LEN .GT. 80).OR.(LEN .LT. 1)) LEN = 30
	FORMAT(3) = NULL+LEN/10
	FORMAT(4) = NULL+MOD(LEN,10)
	GETN = CVT$(INBUF(I),FORMAT)
	RETURN
	END
C-------------------------------------------
	FUNCTION CVT$(BUF,FOR)
	BYTE BUF(1),FOR(7)
	DECODE(BUF,FOR) X
	CVT$ = X
	RETURN
	END
C-------------------------------------------
	FUNCTION GETCH(DUMMY)
C
C	Einlesen eines Zeichens
C
	BYTE INBUF(81),CHAR
	COMMON /FTNEA/ N,INBUF
	DATA BLANK/'    '/
C
	IF (N .EQ. 0) CALL LESEN
	X = BLANK
	CALL POKE(IADR(X),INBUF(N))
	N = N+1
	IF (N .EQ. 81) CALL LESEN
	GETCH = X
	RETURN
	END
C-------------------------------------------
	SUBROUTINE LESEN
C
C	Lesen einer Eingabezeile
C
	BYTE INBUF(81)
	COMMON /FTNEA/ N,INBUF
C
	READ (3,99) INBUF
   99	FORMAT(81A1)
	INBUF(81) = 13
	N = 1
	RETURN
	END
C---------------------------------------------
	SUBROUTINE WAIT(N)
C
C	Warteschleife von N Millisekunden
C
	K=N/39*30
	A=1.
	DO 100 I=1,K
	       A=A*1.0001
100	CONTINUE
	RETURN
	END
C ------------------------------------------------
	SUBROUTINE CPOS(IZ,IS)
	BYTE CHAR,LIN,COL,CPM,DUMMY
   	CALL CPM(2,27)
	CALL CPM(2,63)
	CALL GETCHR(LIN)
	CALL GETCHR(COL)
	CALL GETCHR(DUMMY)
	IZ=LIN-31
	IS=COL-31
	RETURN
	END
C -------
	SUBROUTINE GETCHR(CHAR)
	BYTE CHAR,CPM
1	CHAR=CPM(6,255)
	IF (CHAR .EQ. 0) GOTO 1
	RETURN
	END
C ********************************************
C	ENDE LIB.FOR
C ********************************************
