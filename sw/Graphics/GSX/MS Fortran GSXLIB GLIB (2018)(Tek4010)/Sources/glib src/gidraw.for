C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gidraw
C
C ---------------------------------------------
      SUBROUTINE GIDRAW(IX,IY)
C
C     Draw to point in DC
C
      IMPLICIT LOGICAL(A-Z)

      INTEGER*2 IX, IY

      INCLUDE GLIB.FI

      IX = MAX0(IX,0)
      IX = MIN0(IX,IFIX(DEVSIX))

      IY = MAX0(IY,0)
      IY = MIN0(IY,IFIX(DEVSIY))

      CALL GLNPLT ( IXPREV, IYPREV, IX, IY )

      IXPREV = IX
      IYPREV = IY

      RETURN
      END
C ---------------------------------------------
