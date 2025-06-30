C ---------------------------------------------------------------------
C
C     Subroutines for GPLOT
C
C     Martin Hepperle, May 2020
C
C ---------------------------------------------------------------------
      LOGICAL FUNCTION STRCMP(STRING,IFROM,KEY,KLEN)
C
C     Compare STRING(IFROM:ITO) with KEY and return .TRUE.
C     if it matches KEY.
C
C     parameters
      INTEGER*1 STRING(80),KEY(25)
      INTEGER*2 IFROM,KLEN
C     local
      INTEGER*2 I,J

      STRCMP = .TRUE.

      J = IFROM - 1
      DO 100 I=1,KLEN
         J = J+1
         IF ( STRING(J) .EQ. KEY(I) ) GOTO 100
C        leave loop
         STRCMP = .FALSE.
         GOTO 101
100   CONTINUE

101   CONTINUE

      RETURN
      END
C ---------------------------------------------------------------------
C
C     Search for character CHAR in STRING(IFROM:ITO)
C
      INTEGER*2 FUNCTION STRCHR(STRING,IFROM,ITO,CHAR)
C     parameters
      INTEGER*1 STRING(80)
      INTEGER*2 IFROM,ITO,CHAR
C     local
      INTEGER*2 I

      STRCHR = -1

      I = IFROM
100   CONTINUE

         IF ( I .GT. ITO ) GOTO 102
         IF ( STRING(I) .EQ. CHAR ) GOTO 101
         I = I+1
      GOTO 100

101   CONTINUE
      STRCHR = I

102   CONTINUE

      RETURN
      END

C ---------------------------------------------------------------------
      INTEGER*2 FUNCTION STRCPY(SOURCE,IFROM,ITO,DEST,JFROM,JTO)
C
C     Copy SOURCE(IFROM:ITO) to DEST(JFROM,JTO)
C     Stops when either ITO or JTO is reached
C
C     parameters
      INTEGER*1 SOURCE(80),DEST(80)
      INTEGER*2 IFROM,ITO,JFROM,JTO
C     local
      INTEGER*2 I,J

      I = IFROM
      J = JFROM
100   CONTINUE
         IF ( (J .GT. JTO) .OR.
     1        (I .GT. ITO) ) GOTO 101
         DEST(J) = SOURCE(I)
         I = I+1
         J = J+1
      GOTO 100
101   CONTINUE

      STRCPY = J - JFROM

      RETURN
      END
C ---------------------------------------------------------------------
      REAL*4 FUNCTION STRVAL(STRING,IFROM,ITO)
C
C     Convert a string STRING(IFROM:ITO) to a real number.
C     The number may have a sign and a decimal point, but no
C     exponential notation.
C
C     parameters
      INTEGER*1 STRING(80)
      INTEGER*2 IFROM,ITO
C     local
      INTEGER*2 I,J,IDIVI
      REAL*4 SIGN,VAL

      SIGN  = 1.0
      VAL   = 0.0
      IDIVI = ITO

      DO 100 I=IFROM,ITO
C        '-'
         IF (STRING(I) .EQ. 45) SIGN=-1.0
C        '.'
         IF (STRING(I) .EQ. 46) IDIVI=I
C        '0' to '9'
         IF ((STRING(I) .LT. 48) .OR.
     1       (STRING(I) .GT. 57) ) GOTO 100
         J = STRING(I)
         VAL = VAL * 10.0 + FLOAT(J-48)
100   CONTINUE

      STRVAL = SIGN * VAL / (10.0**(ITO-IDIVI))

      RETURN
      END
C ---------------------------------------------------------------------
      INTEGER*2 FUNCTION STRTOK(STRING,START,SLEN,CBEG,CEND,TBEG,TEND)
C
C     Search STRING for a token string delimited by CBEG and CEND and
C     return its start and end indices TBEG resp. TEND.
C
      INTEGER*1 STRING(80)
      INTEGER*2 START,SLEN,CBEG,CEND,TBEG,TEND
C     local
      INTEGER*2 J,K
      INTEGER*2 STRCHR
      EXTERNAL  STRCHR

C     34: double quote
C     40: opening parenthesis
C     41: closing parenthesis
C     44: comma

      STRTOK = -1

C     locate opening character (leave space for closing character)
      J = STRCHR(STRING,START,SLEN-1,CBEG)

      IF ( J .EQ. -1 ) GOTO 100
      J = J+1

C     locate closing character
      K = STRCHR(STRING,J,SLEN,CEND)

      IF ( K .EQ. -1 ) GOTO 100

C     return token start end end
      TBEG = J
      TEND = K-1
C     next token start
      STRTOK = K+1

100   CONTINUE

      RETURN
      END
C ---------------------------------------------------------------------
      INTEGER*2 FUNCTION STRCMD(STRING,MAXLEN)
C
C     COPY the CP/M parameter string to STRING and return its length.
C     Note: the parameter string usually starts with the blank character
C           which is following the program name.
C
      INTEGER*1 STRING(80)
      INTEGER*2 MAXLEN

      EXTERNAL  PEEK
      INTEGER*1 PEEK

      INTEGER*2 ADDR
      INTEGER*2 I,N

      ADDR = 128
      N = PEEK(ADDR)
      IF ( N .GT. MAXLEN ) N=MAXLEN

      DO 100 I=1,N
         ADDR = ADDR+1
         STRING(I) = PEEK(ADDR)
100   CONTINUE

      STRCMD = N

      RETURN
      END

C ---------------------------------------------------------------------
      SUBROUTINE MAKFIL(STRING,NLEN,FILNAM)
C
C     Build a 11 character, blank filled, CP/M 2.2 conforming
C     file name fron a given file name given in STRING(1:NLEN).
C     STRING may contain a dot separated extension or none.
C
      INTEGER*1 STRING(80)
      INTEGER*2 NLEN
      INTEGER*1 FILNAM(11)

      INTEGER*2 I,J

C     prefill with blanks
      DO 1 I=1,11
         FILNAM(I)=' '
1     CONTINUE

C     skip leading blanks
      DO 11 I=1,NLEN
         IF ( STRING(I) .NE. 32 ) GOTO 12
11    CONTINUE

12    CONTINUE

C     copy file name from STRING(I:)
      J = 1

2     CONTINUE
C        end of input ?
         IF ( I .GT. NLEN ) GOTO 5
C        end of destination ?
         IF ( J .GT. 8 ) GOTO 5
C        done on blank ?
         IF ( STRING(I) .EQ. 32 ) GOTO 5
C        dot ?
         IF ( STRING(I) .EQ. 46 ) GOTO 3
         FILNAM(J) = STRING(I)
         J = J+1
         I = I+1
      GOTO 2

3     CONTINUE
C     skip dot encountered at I
      I = I+1
      DO 4 J=9,11
         IF ( I .GT. NLEN ) GOTO 4
         FILNAM(J) = STRING(I)
         I=I+1
4     CONTINUE

C     done with file name
5     CONTINUE

      RETURN
      END
C ---------------------------------------------------------------------
