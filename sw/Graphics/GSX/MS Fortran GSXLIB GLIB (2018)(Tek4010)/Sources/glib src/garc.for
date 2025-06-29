C ---------------------------------------------
C
C     Library module for Tektronix output
C
C     Martin Hepperle, 11/2018
C
C     f80 =garc
C
C ---------------------------------------------
      SUBROUTINE GARC(X,Y,R,PHI0,PHI1,DPHI)
C
C     Draw an arc on Tektronix 4014
C
C     X,Y ... center point
C     R ..... radius
C     PHI0 .. start angle (degrees)
C     PHI1 .. end angle (degrees)
C     DPHI .. angular step size

      REAL X,Y,R,PHI0,PHI1,DPHI

      REAL P0,P1,DP,XP,YP
      INTEGER N,NP

      P0 = AMIN1(PHI0,PHI1)
      P1 = AMAX1(PHI0,PHI1)
      NP = INT((P1-P0)/DPHI)
      P0 = P0*0.01745329251
      P1 = P1*0.01745329251
      DP = (P1-P0)/NP

C     start point
      P = P0
      XP = X + R*COS(P)
      YP = Y + R*SIN(P)
      CALL GMOVE(XP,YP)
      P = P + DP

      DO 100 N=1,NP
         XP = X + R*COS(P)
         YP = Y + R*SIN(P)
         CALL GDRAW(XP,YP)
         P = P + DP
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
