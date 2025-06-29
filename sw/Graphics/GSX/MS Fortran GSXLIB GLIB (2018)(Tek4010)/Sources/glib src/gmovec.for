C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gmovec
C
C ---------------------------------------------
      SUBROUTINE GMOVEC(X,Y)
C
C     Move with clipping to viewport
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 X,Y

      INCLUDE GLIB.FI

      XCLIP = X
      YCLIP = Y

      RETURN
      END
C ---------------------------------------------
