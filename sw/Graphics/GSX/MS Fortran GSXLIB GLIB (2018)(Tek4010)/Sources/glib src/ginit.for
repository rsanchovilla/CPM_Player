C ---------------------------------------------
C
C     Library module for GSX output
C
C     Martin Hepperle, 11/2018
C
C     f80 =ginit
C
C ---------------------------------------------
      SUBROUTINE GINIT(ID)
C
C     Assign device ID for output
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      INTEGER*2 ID

      INCLUDE GLIB.FI

C     default view
      DATA XV0,XV1,YV0,YV1 /0.0,1.0,0.0,1.0/
C     default window
      DATA XW0,XW1,YW0,YW1 /0.0,1.0,0.0,1.0/
C     default scaling
      DATA DX,DY,SX,SY /0.0,0.0,1.0,1.0/
C     previous point
      DATA IXPREV,IYPREV /0,0/
C     no clipping
      DATA DOCLIP /.FALSE./

      IDEV = ID

      DEVSIX = 32767.0
      DEVSIY = 32767.0

      CALL GWIND(XW0,XW1,YW0,YW1)

      CALL GWKOPN(ID)

      CALL GSIZE(DEVXMM,DEVYMM)

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GSIZE(XMM,YMM)
C
C     Reaches down to low level GSXLIB
C
      REAL*4 XMM,YMM

      INCLUDE GSX.FI

      XMM = DEVXMM
      YMM = DEVYMM

      RETURN
      END
C ---------------------------------------------
