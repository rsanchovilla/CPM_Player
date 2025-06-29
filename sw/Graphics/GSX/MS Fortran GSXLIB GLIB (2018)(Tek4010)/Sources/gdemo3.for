C ---------------------------------------------------------------------
      PROGRAM  GDEMO3
C ---------------------------------------------------------------------
C     Test GLIB
C
C     f80 =gdemo3
C     l80 l80 gdemo3/N,gdemo3,glib/S,gsxlib/S,forlib/S,/E
C     gengraf gdemo3
C
C ---------------------------------------------------------------------
C
      INTEGER*2 ID
      LOGICAL*1 TEXT(12)
      INTEGER*2 ICHR,NDIG
      REAL*4    X,Y,SIZE,ANGLE,XMM,YMM,RATIO

      DATA TEXT /'H','e','l','l','o',' ','W','o','r','l','d','!' /

C     select output device
      ID = 1
      CALL GINIT(ID)

      CALL GSIZE(XMM,YMM)

C     setup isotropic user system
      RATIO = YMM/XMM
      X = 0.0
      Y = 0.0
      IF ( RATIO .LT. 1.0 ) X = (1.0-RATIO)/2.0
      IF ( RATIO .GT. 1.0 ) Y = (1.0-1.0/RATIO)/2.0

C     centered viewport position
      CALL GVIEW(X,1.0-X, Y,1.0-Y)

C     setup user system
      CALL GWIND(0.0,10.0, 0.0,10.0)

      CALL GRECT(0.0,0.0, 10.0,10.0)

      CALL TABLE(0.0)

C     load font #2
      I = 2
      CALL GSFONT(I)

      CALL TABLE(0.5)

C     Done: make sure the device is closed
      CALL GCLOSE

      END
C ---------------------------------------------------------------------
      SUBROUTINE TABLE(DX)


      NDIG = 0

      Y = 9.5
      SIZE = 7.0
      ANGLE = 0.0
      ICHR = 32

      DO 200 IR=0,11

         X = 0.25 + DX

         DO 100 I=1,8
            X0 = X
            CALL GMOVE(X,Y+0.1)
            CALL GDRAW(X,Y)

C            CALL GNUM ( X, Y-1.0, 5.0, ICHR, ANGLE, NDIG, 00 )

            CALL GCHAR(X,Y,ICHR,SIZE,ANGLE)

            CALL GMOVE(X0,Y)
            CALL GDRAW(X,Y)
            CALL GDRAW(X,Y+0.1)

            ICHR = ICHR+1
            X = X0 + 1.25
100      CONTINUE
         Y = Y - 0.8

200   CONTINUE

      RETURN
      END

C ---------------------------------------------------------------------
