C ---------------------------------------------
C
C     Library module for GSX output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gimove
C
C ---------------------------------------------
      SUBROUTINE GIMOVE(IX,IY)
C
C     Move to device point
C
      IMPLICIT LOGICAL(A-Z)

      INTEGER*2 IX,IY

      INCLUDE GLIB.FI

      IX = MAX0(IX,0)
      IX = MIN0(IX,IFIX(DEVSIX))

      IY = MAX0(IY,0)
      IY = MIN0(IY,IFIX(DEVSIY))

      IXPREV = IX
      IYPREV = IY

      RETURN
      END
C ---------------------------------------------
