C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gwind
C
C ---------------------------------------------
      SUBROUTINE GWIND(XLO,XHI,YLO,YHI)
C
C     Define UC scaling for viewport
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 XLO,XHI,YLO,YHI

      INCLUDE GLIB.FI

      XW0 = XLO
      XW1 = XHI
      YW0 = YLO
      YW1 = YHI

      SX = DEVSIX * (XV1-XV0) / (XW1-XW0)
      SY = DEVSIY * (YV1-YV0) / (YW1-YW0)

      DX = XV0 * DEVSIX
      DY = YV0 * DEVSIY

      RETURN
      END
C ---------------------------------------------
