C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 05/2020
C
C     f80 =gpoly
C
C ---------------------------------------------
      SUBROUTINE GPOLY(X,Y,N)
C
C     Outline the given polygon.
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      INTEGER*2 N
      REAL*4 X(N),Y(N)
C     local
      INTEGER*2 I

C     close polygon
      CALL GMOVE(X(N),Y(N))

      DO 100 I=1,N
        CALL GDRAW(X(I),Y(I))
100   CONTINUE

      RETURN

      END
C ---------------------------------------------
