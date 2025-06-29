C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gspen
C
C ---------------------------------------------
      SUBROUTINE GSPEN ( WIDTH, NSTYLE, NCOLOR )
C
C     Select pen width and style.
C
C     WIDTH .... in mllimeters
C     NSTYLE ... 1...
C     NCOLOR ... color index
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      INTEGER*2 NSTYLE,NCOLOR
      REAL*4 WIDTH

C     local
      INTEGER*2 NWIDTH

      INCLUDE GLIB.FI

C     from millimeters to NDC
      NWIDTH = WIDTH * DEVSIY / DEVYMM

      CALL GLNSET (NWIDTH,NSTYLE,NCOLOR)

      RETURN

      END
C ---------------------------------------------
