C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =grast
C
C ---------------------------------------------
      SUBROUTINE GXRAST(X0,X1,XSTEP,Y0,Y1)
C
C     Draw a grid of vertical lines
C
C     Y1  | | | |
C     Y0  | | | |
C         X0 .. X1
C     X0 ..... ordinate of start point
C     X1 ..... ordinate of end point
C     XSTEP .. distance between tick marks
C     Y0 ..... coordinate of start point
C     Y1 ..... coordinate of end point
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 X0,X1,XSTEP,Y0,Y1

C     local
      INTEGER*2 NSTEPS
      REAL YSTEP

      NSTEPS = 1 + INT((X1-X0)/XSTEP+0.5)
      YSTEP = 0.0

      CALL GRAST(X0,Y0,X0,Y1,XSTEP,YSTEP,NSTEPS)

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GYRAST(Y0,Y1,YSTEP,X0,X1)
C
C     Draw a grid of horizontal lines
C
C     Y1  --------
C     .,  --------
C     Y0  --------
C         X0     X1
C
C     Y0 ..... coordinate of start point
C     Y1 ..... coordinate of end point
C     YSTEP .. distance between tick marks
C     X0 ..... ordinate of start point
C     X1 ..... ordinate of end point
C     all in UC
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 Y0,Y1,YSTEP,X0,X1

C     local
      INTEGER*2 NSTEPS
      REAL Y

      NSTEPS = 1 + INT((Y1-Y0)/YSTEP+0.5)

      XSTEP = 0.0

      CALL GRAST(X0,Y0,X1,Y0,XSTEP,YSTEP,NSTEPS)

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GRAST(X0,Y0,X1,Y1,XSTEP,YSTEP,NSTEPS)
C
C     Draw a grid of (usually horizontal or vertical) lines.
C
C     X0 ..... ordinate of start point
C     Y0 ..... coordinate of start point
C     X1 ..... ordinate of end point
C     Y1 ..... coordinate of end point
C     XSTEP .. horizontal distance to shift
C     YSTEP .. vertical distance to shift
C     NSTEPS . number of steps to perform
C     all in UC
C
      IMPLICIT LOGICAL(A-Z)

C     parameters
      REAL*4 X0,Y0,X1,Y1,XSTEP,YSTEP
      INTEGER*2 NSTEPS

C     local
      REAL*4 XBEG,YBEG,XEND,YEND
      INTEGER*2 I

C     Error: too many steps
      IF ( NSTEPS .GT. 5000 ) RETURN

      XBEG = X0
      YBEG = Y0
      XEND = X1
      YEND = Y1

      DO 100 I=1,NSTEPS
         CALL GMOVE(XBEG,YBEG)
         CALL GDRAW(XEND,YEND)
C        translate
         XBEG = XBEG + XSTEP
         YBEG = YBEG + YSTEP
         XEND = XEND + XSTEP
         YEND = YEND + YSTEP
100   CONTINUE

      RETURN
      END
C ---------------------------------------------
