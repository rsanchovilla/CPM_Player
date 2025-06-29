C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gaxlab
C
C ---------------------------------------------
      SUBROUTINE GXALAB(X0,X1,YPOS,XSTEP,SIZE,ANGLE,NDIG)
C
C     Label an x-axis in UC
C
C     X0 ..... ordinate of start point
C     X1 ..... ordinate of end point
C     YPOS ... vertical position of axis line
C     XSTEP .. distance between tick marks
C     SIZE ... text height in millimeters
C     ANGLE .. text angle in degrees
C     NDIG ... number of digits behind the decimal
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4    X0,X1,YPOS,XSTEP,SIZE,ANGLE
      INTEGER*2 NDIG
C     local
      LOGICAL*1 TEXT(20)
      INTEGER*2 I,ISTEPS
      REAL*4    X,XP,YP

      ISTEPS = 1 + INT((X1-X0)/XSTEP+0.5)

C     Error: too many steps
      IF ( ISTEPS .GT. 5000 ) RETURN

      X = X0
      DO 100 I=1,ISTEPS
C        use tmp variables because TNUM updates XP,YP
         XP = X
         YP = YPOS
         CALL GNUM(XP,YP,SIZE,ANGLE,X,NDIG,12)
         X = X + XSTEP
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GYALAB(Y0,Y1,XPOS,YSTEP,SIZE,ANGLE,NDIG)
C
C     Label an x-axis in UC
C
C     Y0 ..... ordinate of start point
C     Y1 ..... ordinate of end point
C     XPOS ... vertical position of axis line
C     YSTEP .. distance between tick marks
C     SIZE ... text height in millimeters
C     ANGLE .. text angle in degrees
C     NDIG ... number of digits behind the decimal
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4    Y0,Y1,XPOS,YSTEP,SIZE,ANGLE
      INTEGER*2 NDIG
C     local
      LOGICAL*1 TEXT(20)
      INTEGER*2 I,ISTEPS
      REAL*4    Y,XP,YP

      ISTEPS = 1 + INT((Y1-Y0)/YSTEP+0.5)

C     Error: too many steps
      IF ( ISTEPS .GT. 5000 ) RETURN

      Y = Y0
      DO 100 I=1,ISTEPS
C        use tmp variables because TNUM updates XP,YP
         XP = XPOS
         YP = Y
         CALL GNUM(XP,YP,SIZE,ANGLE,Y,NDIG,21)
         Y = Y + YSTEP
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
