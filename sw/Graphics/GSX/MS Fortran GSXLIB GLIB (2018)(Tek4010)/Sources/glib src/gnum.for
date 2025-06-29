C ---------------------------------------------
C
C     Library module for Tektronix output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gnum
C
C ---------------------------------------------
      SUBROUTINE GNUM ( X, Y, SIZE, ANGLE, VAL, NDIG, NALIGN )
C
C     Output a REAL number at UC point X,Y.
C
C     X,Y ... starting point of text, updated to end point
C     SIZE .. character size in millimeters
C     ANGLE . angle of baseline (degrees), 0=right, 90=up
C     VAL ... REAL number to write
C     NDIG .. number of digits after decimal point
C     NALIGN  aligment, 2 digit number NX.NY
C     NX = 0_:   left align
C     NX = 1_:   center
C     NX = 2_:   right align
C     NY = _0:   baseline align
C     NY = _1:   centerline align
C     NY = _2:   topline align

C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4    X, Y, SIZE, ANGLE, VAL
      INTEGER*2 NDIG, NALIGN

C     local
      INTEGER*1 TEXT(20)
      INTEGER*2 LEN,NX,NY,ICHR
      REAL*4 W,H,ARAD,SINA,COSA,DDX,DDY

      INCLUDE GLIB.FI

      CALL GNUMST(VAL,NDIG,TEXT,LEN)

      CALL GTXSIZ(TEXT,LEN,SIZE,W,H)

      NX = NALIGN/10
      NY = NALIGN - NX*10

C     NALIGN = 0_:   left align
      IF ( NX .EQ.  0 ) W = 0.0

C     NALIGN = 1_:   center
      IF ( NX .EQ. 1 ) W = W/2.0

C     NALIGN = 2_:   right align
      IF ( NX .EQ. 2 ) W = W

C     NY = _0:   baseline align
      IF ( NY .EQ. 0 ) H = 0.0

C     NY = _1:   centerline align
      IF ( NY .EQ. 1 ) H = H/2.0

C     NY = _2:   topline align
      IF ( NY .EQ. 2 ) H = H

C     for translation vector
      ARAD = ANGLE*0.01745329252
      SINA = SIN(ARAD)
      COSA = COS(ARAD)

C     still in millimeters
      DDX =  H*SINA - W*COSA
      DDY = -H*COSA - W*SINA

C     now to UC
      DDX = DDX * DEVSIX / (DEVXMM*SX)
      DDY = DDY * DEVSIY / (DEVYMM*SY)

      X = X + DDX
      Y = Y + DDY

      DO 100 I=1,LEN
         ICHR = TEXT(I)
         CALL GCHAR(X,Y,ICHR,SIZE,ANGLE)
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GNUMST ( VAL, NDIG, FMT, LEN )
C
C     Convert a REAL number to a string.
C
C     VAL ... number to convert
C     NDIG .. digits after decimal point
C     FMT ... a buffer of 20 characters
C     LEN ... resulting length of string in FMT(1:LEN)
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4    VAL
      INTEGER*2 NDIG, LEN
      INTEGER*1 FMT(20)
C     local
      INTEGER*2 I,J,I0, I1

C     '         0.00  '
C     '          .50  '
C     '         -.50  '
      ENCODE(FMT,10) VAL
10    FORMAT(F20.10)

C
C     Note we MUST compare agains numbers,
C     not characters like '.' for MS-Fortran 3.44
C

C     find first non-blank character
      I0 = 0
100   I0 = I0+1
      IF((I0 .LT. 20) .AND.
     1   (FMT(I0) .EQ. 32)) GOTO 100


      IF ( I0 .EQ. 1) GOTO 102

C     check whether to insert a leading zero
C     minus?
      IF ( FMT(I0) .NE. 45) GOTO 101

C     starts with a minus
      IF ( FMT(I0+1) .NE. 46) GOTO 101

C     starts with '-.' -> '-0.'
      FMT(I0)   = '0'
      I0 = I0-1
      FMT(I0)   = '-'
      GOTO 102

101   IF ( FMT(I0) .NE. 46) GOTO 102
C     starts with a decimal dot
      I0 = I0-1
      FMT(I0) = '0'

102   CONTINUE
C     we now have a leading '-' or '0'
C     find the decimal dot ASCII 46
      I1=I0-1
103   I1=I1+1
      IF((I1 .LT. 20) .AND.
     1   (FMT(I1) .NE. 46) ) GOTO 103

C     if NDIG=0: suppress decimal dot
      IF ( NDIG .EQ. 0 ) I1=I1-1

      I1 = I1+NDIG
      IF ( I1 .GT. 20 ) I1 = 20

C     left align text in FMT
      J=1
      DO 104 I=I0,I1
         FMT(J) = FMT(I)
         J=J+1
104   CONTINUE

      LEN = I1-I0+1

      RETURN
      END
C ---------------------------------------------
