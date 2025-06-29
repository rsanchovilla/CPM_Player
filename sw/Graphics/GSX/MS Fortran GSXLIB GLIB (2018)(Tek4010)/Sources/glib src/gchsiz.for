C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C
C     f80 =gchsiz
C ---------------------------------------------
      SUBROUTINE GTXSIZ(TEXT,LEN,SIZE,W,H)
C
C     Return dimensions of a text string.
C
C     TEXT ... string of character codes (32...126)
C     LEN .... length of TEXT
C     SIZE ... size in millimeters
C     W,H .... dimensions in millimeters
C ---------------------------------------------
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4 X,Y,SIZE,W,H
      INTEGER*2 LEN
      LOGICAL*1 TEXT(255)
C     local
      INTEGER*2 I
      INTEGER*1 CCHAR
      REAL*4 DX,DY

      W = 0.0
      H = 0.0

      DO 100 I=1,LEN
         CCHAR = TEXT(I)
         CALL GCHSIZ(CCHAR,SIZE,DX,DY)
         W = W + DX
         H = AMAX1(H,DY)
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GCHSIZ(CCHR,SIZE,W,H)
C ---------------------------------------------
C     Return dimensions of a character in UC
C
C     CCHAR .. character (ASCII 32...126)
C     SIZE ... size in millimeters
C     W,H ...  character dimensions in millimeters
C ---------------------------------------------
C
      IMPLICIT LOGICAL(A-Z)

      REAL*4    SIZE,W,H
      INTEGER*1 CCHR
C     local
      INTEGER*2 NCHAR,NWIDTH

C     for WIDTH
      INCLUDE GLIB.FI

      NCHAR = CCHR

      W = 0.0
C     height of character in mm
      H = SIZE

      IF ( NCHAR .LT. 32 .OR. NCHAR .GT. 126 ) RETURN

C     width of character in mm
      NWIDTH = WIDTH(NCHAR-31)
      W = SIZE * NWIDTH / 22.0

      RETURN
      END
C ---------------------------------------------
