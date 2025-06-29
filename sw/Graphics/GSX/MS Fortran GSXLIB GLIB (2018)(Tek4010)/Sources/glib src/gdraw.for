C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gdraw
C
C ---------------------------------------------
      SUBROUTINE GDRAW(X,Y)
C
C     Draw to point in UC
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4    X,Y
C     local
      INTEGER*2 IX,IY
      REAL XPT,YPT

      INCLUDE GLIB.FI

      IF (DOCLIP) GOTO 100

      XPT = DX + XV0+(X-XW0)*SX
      YPT = DY + YV0+(Y-YW0)*SY

C     clip to INTEGER*2 range
      XPT=AMAX1(0.0,AMIN1(XPT,32767.0))
      YPT=AMAX1(0.0,AMIN1(YPT,32767.0))
      IX = IFIX(XPT)
      IY = IFIX(YPT)

      CALL GIDRAW(IX,IY)

      RETURN

100   CALL GDRAWC(X,Y)
      RETURN

      END
C ---------------------------------------------
