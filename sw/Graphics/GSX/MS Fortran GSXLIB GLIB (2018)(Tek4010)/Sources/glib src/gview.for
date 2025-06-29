C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gview
C
C ---------------------------------------------
      SUBROUTINE GVIEW(XLO,XHI,YLO,YHI)
C
C     Define viewport position relative to DC
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 XLO,XHI,YLO,YHI

      INCLUDE GLIB.FI

      IF ( XLO .LT. 0.0 ) XLO = 0.0
      IF ( XHI .GT. 1.0 ) XHI = 1.0

      IF ( YLO .LT. 0.0 ) YLO = 0.0
      IF ( YHI .GT. 1.0 ) YHI = 1.0

      XV0 = XLO
      XV1 = XHI
      YV0 = YLO
      YV1 = YHI

      SX = DEVSIX * (XV1-XV0) / (XW1-XW0)
      SY = DEVSIY * (YV1-YV0) / (YW1-YW0)

      DX = XV0 * DEVSIX
      DY = YV0 * DEVSIY

      RETURN
      END
C ---------------------------------------------
