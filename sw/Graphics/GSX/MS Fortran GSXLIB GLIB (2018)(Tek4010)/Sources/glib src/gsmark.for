C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gsmark
C
C ---------------------------------------------
      SUBROUTINE GSMARK ( SIZE, NSTYLE, NCOLOR )
C
C     Select marker size and style
C
C     SIZE ..... in millimeters
C     NSTYLE ... 1...
C     NCOLOR ... color index
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 SIZE
      INTEGER*2 NSTYLE,NCOLOR

C     local
      INTEGER*2 NSIZE

      INCLUDE GLIB.FI

C     from millimeter to NDC
      NSIZE = SIZE * DEVSIY / (DEVYMM*SY)

      CALL GMKSET (NSIZE,NSTYLE,NCOLOR)

      RETURN

      END
C ---------------------------------------------
