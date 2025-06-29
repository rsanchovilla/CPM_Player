C ---------------------------------------------
C
C     Library module for graphics  output
C
C     Martin Hepperle, 11/2018
C
C     f80 =grect
C
C ---------------------------------------------
      SUBROUTINE GRECT(X0,Y0,X1,Y1)
C
C     Draw a rectangle in UC
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4 X0,Y0,X1,Y1

      CALL GMOVE(X0,Y0)
      CALL GDRAW(X1,Y0)
      CALL GDRAW(X1,Y1)
      CALL GDRAW(X0,Y1)
      CALL GDRAW(X0,Y0)

      RETURN
      END
C ---------------------------------------------
