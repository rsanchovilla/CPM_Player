C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gdraw
C
C ---------------------------------------------
      SUBROUTINE GMARK(X,Y)
C
C     Mark point in UC
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4    X,Y
C     local
      INTEGER*2 IX,IY
      REAL XPT,YPT

C     for XW0,XW1,YW0,YW1
      INCLUDE GLIB.FI

      IF (.NOT. GCLIP) GOTO 100

      IF ( (X .LT. XW0) .OR. (X .GT. XW1) .OR.
     1     (Y .LT. YW0) .OR. (Y .GT. YW1) ) GOTO 200

100   CONTINUE
      XPT = DX + XV0+(X-XW0)*SX
      YPT = DY + YV0+(Y-YW0)*SY

C     clip to INTEGER*2 range
      XPT=AMIN1(XPT,32767.0)
      YPT=AMIN1(YPT,32767.0)
      IX = IFIX(XPT)
      IY = IFIX(YPT)

      CALL GMKPLT(IX,IY)

200   CONTINUE
      RETURN

      END
C ---------------------------------------------
