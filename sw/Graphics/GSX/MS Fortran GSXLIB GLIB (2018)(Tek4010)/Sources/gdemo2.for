      PROGRAM GDEMO2
C ---------------------------------------------
C
C     test GLIB
C
C     Martin Hepperle, 11/2018
C
C     f80 =gdemo2
C     l80 gdemo2/N,gdemo2,glib/S,gsxlib/S,forlib/S,/E
C
C ---------------------------------------------
      REAL PI,X,Y

      LOGICAL*1 TEXT(20)
      REAL*4 XPT(10),YPT(10)

      INTEGER*2 ID

C     select output device
      ID =1
      CALL GINIT(ID)

C     setup first viewport position
      CALL GVIEW(0.05,0.5, 0.0,0.5)
C     demo plot into first window
      CALL PLOTIT
C     unit scaling
      CALL GWIND(0.0,1.0,0.0,1.0)
      X = 0.5
      Y = 1.0
      CALL GTEXT ( X, Y, 'Viewport #1', 11, 3.0, 0.0, 10 )

C     setup second viewport position
      CALL GVIEW(0.6,0.95, 0.6,0.95)
C     demo plot into second window
      CALL PLOTIT

      CALL GSPEN(0.5,2,1)
      CALL GXRAST(0.0,6.2832,1.570796327,-1.0,1.0)
      CALL GYRAST(-1.0,1.0,0.5,0.0,6.2832)
      CALL GSPEN(0.5,1,1)
      CALL GRECT(0.0,-1.0,6.2832,1.0)
C     unit scaling
      CALL GWIND(0.0,1.0,0.0,1.0)
      X = 0.5
      Y = 1.0
      CALL GTEXT ( X, Y, 'Viewport #2', 11, 3.0, 0.0, 10 )

C     setup third viewport position
      CALL GVIEW(0.05,0.5,  0.6,0.95)
C     unit scaling
      CALL GWIND(0.0,1.0,0.0,1.0)
      X = 0.5
      Y = 1.0
      CALL GTEXT ( X, Y, 'Viewport #3', 11, 3.0, 0.0, 10 )
C     setup window
      CALL GWIND(-3.0,8.0,-1.0,5.0)

C     draw a frame around this viewport
      XPT(1) = -3.0
      YPT(1) = -1.0
      XPT(2) = 8.0
      YPT(2) = YPT(1)
      XPT(3) = XPT(2)
      YPT(3) = 5.0
      XPT(4) = XPT(1)
      YPT(4) = YPT(3)
      CALL GRECT(XPT(1),YPT(1), XPT(3),YPT(3))
      XPT(1) = -2.0
      YPT(1) = 0.0
      XPT(2) = 0.0
      YPT(2) = 3.0
      XPT(3) = 3.0
      YPT(3) = 2.0
      CALL GPOLY(XPT,YPT,3)
      CALL GHATCH(XPT,YPT,3, 45.0,2.0)
      CALL GHATCH(XPT,YPT,3,-45.0,2.0)
      XPT(1) = 4.0
      YPT(1) = 0.0
      XPT(2) = 6.0
      YPT(2) = 3.0
      XPT(3) = 5.0
      YPT(3) = -1.0
      CALL GPOLY(XPT,YPT,3)
      CALL GHATCH(XPT,YPT,3,5.0,3.0)
      XPT(1) = -2.0
      YPT(1) = 4.0
      XPT(2) = 6.0
      YPT(2) = 4.0
      XPT(3) = 6.0
      YPT(3) = 4.5
      XPT(4) = -2.0
      YPT(4) = 4.5
      CALL GPOLY(XPT,YPT,4)
      CALL GHATCH(XPT,YPT,4,90.0,5.0)

C     setup third viewport position
      CALL GVIEW(0.5,0.9,  0.1,0.5)
C     unit scaling
      CALL GWIND(0.0,1.0,0.0,1.0)
      X = 0.5
      Y = 1.0
      CALL GTEXT ( X, Y, 'Viewport #4', 11, 3.0, 0.0, 10 )
C     setup window
      CALL GWIND(-3.0,8.0,-1.0,5.0)

C     draw a frame around this viewport
      CALL GRECT(-3.0,-1.0, 8.0,5.0)

      CALL GXAXIS(-3.0,8.0,0.0,0.5,1.5)
      CALL GYAXIS(-1.0,5.0,0.0,0.5,1.5)

      CALL GSMARK(3.0,2,1)
      X = 5.0
      Y = 0.0
      CALL GMARK(X,Y)
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 0, 10 )

      X = 5.0
      Y = 0.5
      CALL GMARK(X,Y)
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 1, 10 )

      X = 5.0
      Y = 1.0
      CALL GMARK(X,Y)
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 2, 10 )

      X = 5.0
      Y = 1.5
      CALL GMARK(X,Y)
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 3, 10 )

      X = 5.0
      Y = 2.0
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 4, 10 )

      X = 5.0
      Y = 2.5
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 4, 00 )

      X = 5.0
      Y = 2.5
      CALL GNUM ( X, Y, 3.5, 0.0, 1.2345, 4, 20 )

      X = 1.0
      Y = 3.0
      CALL GTEXT ( X, Y, 'Some Text', 9, 4.0, 0.0, 00 )
      X = 1.0
      Y = 3.5
      CALL GTEXT ( X, Y, 'More Text', 9, 4.0, 0.0, 00 )

      X = 1.0
      Y = 3.5
      CALL GSMARK(2.0,2,1)
      CALL GMARK(X,Y)
      CALL GCHSIZ('M',4.0,DX,DY)
      CALL GDMMUC(DX,DY)
      X = X+DX
      CALL GMARK(X,Y)
      Y = Y+DY
      CALL GMARK(X,Y)
      Y = Y-DY
      CALL GCHSIZ('o',4.0,DX,DY)
      CALL GDMMUC(DX,DY)
      X = X+DX
      CALL GMARK(X,Y)
      CALL GCHSIZ('r',4.0,DX,DY)
      CALL GDMMUC(DX,DY)
      X = X+DX
      CALL GMARK(X,Y)
      CALL GCHSIZ('e',4.0,DX,DY)
      CALL GDMMUC(DX,DY)
      X = X+DX
      CALL GMARK(X,Y)
      CALL GCHSIZ(' ',4.0,DX,DY)
      CALL GDMMUC(DX,DY)
      X = X+DX
      CALL GMARK(X,Y)

      TEXT(1) = 'H'
      TEXT(2) = 'e'
      TEXT(3) = 'l'
      TEXT(4) = 'l'
      TEXT(5) = 'o'
      TEXT(6) = ' '
      TEXT(7) = 'W'
      TEXT(8) = 'o'
      TEXT(9) = 'r'
      TEXT(10) = 'l'
      TEXT(11) = 'd'
      X = 1.0
      Y = 4.0
      CALL GTEXT ( X, Y, TEXT, 11, 4.0, 0.0, 10 )

      X1 = -6.0
      Y1 = 1.0
      X2 = 3.0
      Y2 = 7.0
      CALL GMOVEC(X1,Y1)
      CALL GDRAWC(X2,Y2)

      X1 = 0.0
      Y1 = -3.0
      X2 = 3.0
      Y2 = 3.0
      CALL GMOVEC(X1,Y1)
      CALL GDRAWC(X2,Y2)

      X1 = 9.0
      Y1 = 0.0
      X2 = 6.0
      Y2 = 3.0
      CALL GMOVEC(X1,Y1)
      CALL GDRAWC(X2,Y2)

      X1 = 5.0
      Y1 = -4.0
      X2 = 5.0
      Y2 = 2.5
      CALL GMOVEC(X1,Y1)
      CALL GDRAWC(X2,Y2)

      X1 = -7.0
      Y1 = 2.0
      X2 = 6.0
      Y2 = 2.0
      CALL GMOVEC(X1,Y1)
      CALL GDRAWC(X2,Y2)

      X1 = 1.0
      Y1 = 2.0
      R  = 1.0
      CALL GARC(X1,Y1,R,0.0,90.0,10.0)
      R  = 1.1
      CALL GARC(X1,Y1,R,0.0,180.0,10.0)
      R  = 1.2
      CALL GARC(X1,Y1,R,0.0,270.0,10.0)

      R  = 1.5
      CALL GARC(X1,Y1,R,0.0,360.0,45.0)


C     back
      CALL GCLOSE

      END

C-----------------------------------------------------------------

      SUBROUTINE PLOTIT

C     setup window scaling
      CALL GWIND(-0.1,6.9, -1.1,1.1)

      PI = 4.0*ATAN(1.0)

C     plot x-axis
      CALL GXAXIS(0.0,2.0*PI,0.0,PI/10.0,1.0)
      CALL GXAXIS(0.0,2.0*PI,0.0,PI/2.0,-1.5)
      CALL GXALAB(0.0,2.0*PI,-0.1,PI/2.0,2.0,0.0,2)

C     plot y-axis
      CALL GYAXIS(-1.0,1.0,0.0,0.1,1.0)
      CALL GYAXIS(-1.0,1.0,0.0,0.5,-1.5)
      CALL GYALAB(-1.0,1.0,-0.2,0.5,2.0,0.0,1)

C     draw sine curve
      X = 0.0
      Y = SIN(X)
      CALL GMOVE(X,Y)
200   Y = SIN(X)
      CALL GDRAW(X,Y)
      X = X + PI/20.0
      IF ( X .LE. 2.001*PI ) GOTO 200


C     draw cosine curve
      X = 0.0
      Y = COS(X)
      CALL GMOVE(X,Y)
300   Y = COS(X)
      CALL GDRAW(X,Y)
      X = X + PI/20.0
      IF ( X .LE. 2.001*PI ) GOTO 300

C     mark cosine curve
      CALL GSMARK(2.0,3,1)
      X = 0.0
400   Y = COS(X)
      CALL GMARK(X,Y)
      CALL GMOVE(X,Y)
      CALL GDRAW(X,0.0)
      X = X + PI/10.0
      IF ( X .LE. 2.001*PI ) GOTO 400

      RETURN
      END
C ---------------------------------------------
