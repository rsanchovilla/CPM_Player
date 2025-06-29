C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 05/2020
C
C     f80 =ghatch
C
C ---------------------------------------------
      SUBROUTINE GHATCH(X,Y,N,ANGLE,DIST)
C
C     Hatch a polygon with lines at and angle.
C
C     X() ... polygon points
C     Y() ... polygon points
C     N ..... number of points
C     ANGLE . angle in degrees
C     DIST .. distance in millimeters
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      INTEGER*2 N
      REAL*4 X(N),Y(N),ANGLE,DIST
C     local
      LOGICAL*1 CONTI
      REAL*4 X1,Y1,A,SA,CA,DDX,DDY
      EXTERNAL FINDC
      LOGICAL*1 FINDC

      INCLUDE GLIB.FI

C     hatch line vector
C     angle from mm to UC
      SA = SIN(ANGLE*0.01745329252)
      CA = COS(ANGLE*0.01745329252)
      A = ATAN2(SA*DEVSIY*DEVXMM*SX,CA*DEVSIX*DEVYMM*SY)
      SA = SIN(A)
      CA = COS(A)
C     translation vector for given distance (mm -> UC)
      DDX = -DIST*SA * DEVSIX/(DEVXMM*SX)
      DDY =  DIST*CA * DEVSIY/(DEVYMM*SY)

C     upwards
C     start point
      X1 = (X(1)+X(2))*0.5
      Y1 = (Y(1)+Y(2))*0.5
100   CONTINUE
        CONTI = FINDC(X1,Y1,CA,SA,X,Y,N)
        X1 = X1 + DDX
        Y1 = Y1 + DDY
      IF ( CONTI ) GOTO 100

C     downwards
C     start point
      X1 = (X(1)+X(2))*0.5
      Y1 = (Y(1)+Y(2))*0.5
200   CONTINUE
        X1 = X1 - DDX
        Y1 = Y1 - DDY
        CONTI = FINDC(X1,Y1,CA,SA,X,Y,N)
      IF ( CONTI ) GOTO 200

      RETURN

      END
C ---------------------------------------------
C
C     Intersect a line with a convex polygon.
C
      LOGICAL*1 FUNCTION FINDC(X1,Y1,DX,DY,X,Y,N)
C
C     X1,Y1 ... starting point of line
C     DX, DY .. direction vector to end point
C     X(),Y() . polygon points
C     N ....... number of points in X() and Y()
C
C     Uses the parametric form of lines for calculation
C     of intersection.
C     Only two intersections are found, no convex polygons.
C
C     Martin Hepperle, 05/2020
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4 X1,Y1,DX,DY
      REAL*4 X(100),Y(100)
      INTEGER*2 N
C     local
      REAL*4 X2,Y2,A1,A2,B1,B2
      REAL*4 DY2B1,DY1B1,DB2B1,DA2A1
      REAL*4 DY2Y1,DX2X1,DIVI,DIFX,DIFY,T
      REAL*4 XS(2),YS(2),XSNEW,YSNEW
      REAL*4 TLO,THI
      INTEGER*2 IDX,I

      FINDC = .FALSE.
C     0...1 with tolerance
      TLO = -1.0E-25
      THI = 1.0 - TLO

C     end point
      X2 = X1 + DX
      Y2 = Y1 + DY

      IDX = 0

C     start with end point to close the polygon
      A1 = X(N)
      B1 = Y(N)

      DO 200 I=1,N
        A2 = X(I)
        B2 = Y(I)

C       some abbreviations
        DY2B1 = Y2 - B1
        DY1B1 = Y1 - B1
        DB2B1 = B2 - B1
        DA2A1 = A2 - A1

        DIVI  = DY*DA2A1 - DX*DB2B1

C       no intersection if division by zero
        IF ( ABS(DIVI) .LT. 1.0E-30 ) GOTO 100

C       parameter P2 = P1 + T*DELTA
        T = (DY2B1*X1 - DY1B1*X2 - DY*A1) / DIVI

C       test if point is in line segment or outside
        IF ( T .LT. TLO .OR. T .GT. THI ) GOTO 100

C       yes we found an intersection
        FINDC = .TRUE.

C       intersection point on polygon line
        XSNEW = A1 + T*DA2A1
        YSNEW = B1 + T*DB2B1

C       first point?
        IF ( IDX .EQ. 0 ) GOTO 90

C       same point?
        DIFX = ABS(XSNEW - XS(IDX))
        DIFY = ABS(YSNEW - YS(IDX))

        IF ( DIFX .LT. 1.0E-15 .AND.
     1       DIFY .LT. 1.0E-15 ) IDX = 0

C        IF ( XSNEW .EQ. XS(IDX) .AND.
C     1       YSNEW .EQ. YS(IDX) ) IDX=0

90      CONTINUE
C       store intersection point
        IDX = IDX + 1
        XS(IDX) = XSNEW
        YS(IDX) = YSNEW

C       first intersection point?
        IF ( IDX .EQ. 1 ) GOTO 100

C       second intersection
        CALL GMOVE(XS(1),YS(1))
        CALL GDRAW(XS(2),YS(2))

C       yes we found an intersection
        FINDC = .TRUE.
C       prepare for next
        IDX = 0

100     CONTINUE
C       prepare for next segment
        A1 = A2
        B1 = B2
200   CONTINUE

      RETURN
      END
C ---------------------------------------------
