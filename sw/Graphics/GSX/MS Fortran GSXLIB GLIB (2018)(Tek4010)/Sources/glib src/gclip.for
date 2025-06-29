C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gclip
C
C ---------------------------------------------
      SUBROUTINE GCLIP(CLIP)
C
C     Switch clipping on/off
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      LOGICAL CLIP
C
      INCLUDE GLIB.FI

C     clipping flag
      DOCLIP = CLIP

      RETURN
      END
C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =tclips
C
C ---------------------------------------------
      SUBROUTINE GCLIPS(X,Y,IX,IY)
C
C     Determine sector of X,Y for clipping tests
C
C                    IY
C          |   |     1
C       ---+---+---
C          |   |     0
C       ---+---+---
C          |   |    -1
C   IX  -1   0   1
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4    X,Y
      INTEGER*2 IX,IY
C
      INCLUDE GLIB.FI

      IF ( X .LE. XW1 ) GOTO 1
      IX = 1
      GOTO 10

1     IF ( X .GE. XW0 ) GOTO 2
      IX = -1
      GOTO 10

2     IX = 0

10    IF ( Y .LE. YW1 ) GOTO 3
      IY = 1
      GOTO 20

3     IF ( Y .GE. YW0 ) GOTO 4
      IY = -1
      GOTO 20

4     IY = 0

20    CONTINUE

      RETURN
      END
C ---------------------------------------------
