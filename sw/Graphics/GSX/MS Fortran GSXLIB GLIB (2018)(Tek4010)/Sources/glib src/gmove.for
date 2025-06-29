C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gmove
C
C ---------------------------------------------
      SUBROUTINE GMOVE(X,Y)
C
C     Move to point in UC
C
      IMPLICIT LOGICAL(A-Z)

      REAL*4 X,Y

      INTEGER*2 IX,IY
      REAL*4 XPT,YPT

      INCLUDE GLIB.FI

      IF (DOCLIP) GOTO 100

      XPT = DX + XV0+(X-XW0)*SX
      YPT = DY + YV0+(Y-YW0)*SY

C     clip to INTEGER*2 range
      XPT=AMAX1(0.0,AMIN1(XPT,32767.0))
      YPT=AMAX1(0.0,AMIN1(YPT,32767.0))
      IX = IFIX(XPT)
      IY = IFIX(YPT)

      CALL GIMOVE(IX,IY)

      RETURN

100   CALL GMOVEC(X,Y)

      RETURN

      END
C ---------------------------------------------
