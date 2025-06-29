C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C
C     f80 =gtext
C ---------------------------------------------
      SUBROUTINE GTEXT(X,Y,TEXT,LEN,SIZE,ANGLE,NALIGN)
C
C     Output a text string in UC
C
C     X, Y ... position of upper left corner point
C     TEXT ... string of character codes (32...126)
C     LEN .... length of TEXT
C     SIZE ... size in millimeters
C     ANGLE .. baseline angle (deg), 0=right, 90=up
C     NALIGN  aligment, 2 digit number NX.NY
C     NX = 0_:   left align
C     NX = 1_:   center
C     NX = 2_:   right align
C     NY = _0:   baseline align
C     NY = _1:   centerline align
C     NY = _2:   topline align
C
C ---------------------------------------------
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4 X,Y,SIZE,ANGLE
      INTEGER*2 LEN,NALIGN
      LOGICAL*1 TEXT(255)
C     local
      INTEGER*2 I,ICHAR,NX,NY
      REAL*4 W,H,ARAD,SINA,COSA,DDX,DDY

      INCLUDE GLIB.FI

C     get text dimensions in millimeters
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

C     move starting point
      X = X + DDX
      Y = Y + DDY

      DO 100 I=1,LEN
         ICHAR = TEXT(I)
         CALL GCHAR(X,Y,ICHAR,SIZE,ANGLE)
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
