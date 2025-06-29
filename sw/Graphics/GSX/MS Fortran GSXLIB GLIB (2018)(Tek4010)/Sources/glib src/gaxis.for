C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gaxis
C
C ---------------------------------------------
      SUBROUTINE GXAXIS(X0,X1,YPOS,XSTEP,YTICK)
C
C     Draw a horizontal x-axis in UC
C
C     X0 ..... ordinate of start point
C     X1 ..... ordinate of end point
C     YPOS ... vertical position of axis line
C     XSTEP .. distance between tick marks
C     YTICK .. tick length in millimeters
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4    X0,X1,YPOS,XSTEP,YTICK
C     local
      INTEGER*2 NSTEPS
      REAL*4    TICK,YSTEP

C     for DEVSIY,DEVYMM,SY
      INCLUDE GLIB.FI

      CALL GMOVE(X0,YPOS)
      CALL GDRAW(X1,YPOS)

      NSTEPS = 1 + INT((X1-X0)/XSTEP+0.5)
C     delta-mm to delta-UC
      TICK = DEVSIY * YTICK / (DEVYMM * SY)
      YSTEP = 0.0
      CALL GRAST(X0,YPOS,X0,YPOS+TICK,XSTEP,YSTEP,NSTEPS)

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GYAXIS(Y0,Y1,XPOS,YSTEP,XTICK)
C
C     Draw a vertical y-axis in UC
C
C     Y0 ..... coordinate of start point
C     Y1 ..... coordinate of end point
C     XPOS ... horizontal position of axis line
C     YSTEP .. distance between tick marks
C     XTICK .. tick length in millimeters
C
      IMPLICIT LOGICAL(A-Z)
C     parameters
      REAL*4    Y0,Y1,XPOS,YSTEP,XTICK
C     local
      INTEGER*2 NSTEPS
      REAL*4    TICK,XSTEP

C     for DEVSIX,DEVXMM,SX
      INCLUDE GLIB.FI

      CALL GMOVE(XPOS,Y0)
      CALL GDRAW(XPOS,Y1)

      NSTEPS = 1 + INT((Y1-Y0)/YSTEP+0.5)
C     delta-mm to delta-UC
      TICK = DEVSIX * XTICK / (DEVXMM * SX)
      XSTEP = 0.0
      CALL GRAST(XPOS,Y0,XPOS+TICK,Y0,XSTEP,YSTEP,NSTEPS)

      RETURN
      END
C ---------------------------------------------
      SUBROUTINE GAUTO ( X0,X1,MAXDIV, XX0,XX1,XXS)
C
C     Create a "nice" range for scaling of an axis
C
C     in: data range and maximum number of divisions
      REAL*4 X0,X1
      INTEGER*2 MAXDIV
C     out: start and end values, step size
      REAL*4 XX0,XX1,XXS
C     local
      REAL*4 DX,ABSDX,TMP
      REAL*4 FIRST,LAST,STEP
      LOGICAL SWAP
C     function
      REAL*4   GNICET
      EXTERNAL GNICET

      SWAP = .FALSE.
      IF ( X1 .GT. X0 ) GOTO 100
C        reverse range
         TMP = X1
         X1  = X0
         X0  = TMP
         SWAP = .TRUE.
100   CONTINUE

      DX    = X1 - X0
      ABSDX = ABS(DX)

      STEP = SIGN(1.0,DX) * GNICET(ABSDX,MAXDIV)

C     determine lower limit
      FIRST = STEP

110   CONTINUE
      IF ( FIRST .LE. X0 ) GOTO 120
         FIRST = FIRST - STEP
      GOTO 110

120   CONTINUE
      IF ( FIRST .GE. X0 - STEP) GOTO 130
         FIRST = FIRST + STEP
      GOTO 120

C     upper limit
130   CONTINUE
      LAST = FIRST + STEP

140   CONTINUE
      IF ( LAST .GE. X1 ) GOTO 150
         LAST = LAST + STEP
      GOTO 140

150   CONTINUE
      IF ( LAST .LE. X1 + STEP ) GOTO 160
         LAST = LAST - STEP
      GOTO 150

160   CONTINUE
      IF ( .NOT. SWAP ) GOTO 170
C        reverse range
         TMP = FIRST
         FIRST = LAST
         LAST = TMP
         STEP = -STEP
170   CONTINUE

      XX0 = FIRST
      XX1 = LAST
      XXS = STEP

      RETURN
      END
C ---------------------------------------------------------------------
C
C     Generate a "nice" tick step over DIST with less than NVALS
C
      REAL*4 FUNCTION GNICET(DIST,NVALS)
      REAL*4    DIST
      INTEGER*2 NVALS
C     local
      REAL*4    SCALE,STEP
      REAL*4    FACTOR(3)
      INTEGER*2 I, NTICKS

C     preset initial values (will be modified below)f
      FACTOR(1) = 0.5
      FACTOR(2) = 1.0
      FACTOR(3) = 2.0

C     scale range down to 1.0
      SCALE = 1.0
90    CONTINUE
      IF ( DIST .LT. 1.0 ) GOTO 100
         DIST = DIST / 10.0
         SCALE = SCALE * 10.0
      GOTO 90

100   CONTINUE

C     get proper step size
      STEP = FACTOR(3)
      I = 1
110   CONTINUE
         NTICKS = IFIX(DIST / FACTOR(I))
         IF ( NTICKS .GT. NVALS ) GOTO 120
         STEP = FACTOR(I)
         I = I + 1
         IF ( I .GT. 3 ) I = 1
C        adapt
         FACTOR(I) = FACTOR(I)/10.0
      GOTO 110

120   CONTINUE

      GNICET = STEP * SCALE

      RETURN
      END
C ---------------------------------------------------------------------
