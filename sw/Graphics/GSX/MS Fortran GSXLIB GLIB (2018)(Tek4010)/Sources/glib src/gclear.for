C ---------------------------------------------
C
C     Library module for Graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =Gclear
C
C ---------------------------------------------
      SUBROUTINE GCLEAR
C
C     Clear Device
C
      IMPLICIT LOGICAL(A-Z)

      CALL GWKCLR

      RETURN
      END
C ---------------------------------------------
