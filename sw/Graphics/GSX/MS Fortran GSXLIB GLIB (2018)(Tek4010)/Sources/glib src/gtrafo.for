C ---------------------------------------------
C
C     Library module for GSX output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gtrafo
C
C ---------------------------------------------
      SUBROUTINE GUCNDC(UCX,UCY,NDCX,NDCY)
C
C     Convert absolute point from UC to NDC
C
      REAL*4 UCX,UCY
      INTEGER*2 NDCX,NDCY
      REAL*4 X,Y

      INCLUDE GLIB.FI

C     clip to integer range to avoid overflow
      X = MIN0(MAX0(0.0,(DX + XV0+(UCX-XW0)*SX)),32767.0)
      Y = MIN0(MAX0(0.0,(DY + YV0+(UCY-YW0)*SY)),32767.0)

      NDCX = IFIX(X)
      NDCY = IFIX(Y)

      END
C ---------------------------------------------
      SUBROUTINE GFRUC(XREL,YREL,XUC,YUC)
C
C     Convert point from FRame to UC
C
      REAL*4 XREL,YREL,XUC,YUC

      INCLUDE GLIB.FI

      XUC = XW0 + (DEVSIX * XREL - DX - XV0)/SX
      YUC = YW0 + (DEVSIY * YREL - DY - YV0)/SY

      END

C ---------------------------------------------
      SUBROUTINE GMMUC(XMM,YMM,XUC,YUC)
C
C     Convert absolute point from MM to UC
C
      REAL*4 XMM,YMM,XUC,YUC

      INCLUDE GLIB.FI

      XUC = XW0 + (DEVSIX * XMM / DEVXMM - DX - XV0)/SX
      YUC = YW0 + (DEVSIY * YMM / DEVYMM - DY - YV0)/SY

      END
C ---------------------------------------------
      SUBROUTINE GDMMUC(DDX,DDY)
C
C     Convert distance from MM to UC
C
      REAL*4 DDX,DDY

      INCLUDE GLIB.FI

      DDX = DEVSIX * DDX / (DEVXMM*SX)
      DDY = DEVSIY * DDY / (DEVYMM*SY)

      END
C ---------------------------------------------
