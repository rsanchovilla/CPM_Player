C ---------------------------------------------------------------------
      PROGRAM  GDEMO1
C ---------------------------------------------------------------------
C     Test GLIB
C
C     f80 =gdemo1
C     l80 l80 gdemo1/N,gdemo1,glib/S,gsxlib/S,forlib/S,/E
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

      CALL GWIND(-0.5,10.5, -0.5,10.5)

      CALL GRECT(0.0,0.0, 10.0,10.0)

C     mark center point
      CALL GMOVE(4.0,5.0)
      CALL GDRAW(6.0,5.0)
      CALL GMOVE(5.0,4.0)
      CALL GDRAW(5.0,6.0)

      NDIG = 1

      DO 200 J=0,315,45
         X = 5.0
         Y = 5.0
         SIZE = 6.5
         ANGLE = J*1.0

C        clip image below venter line
         CALL GCLIP(.FALSE.)
         IF ( J .GT. 1780 ) CALL GCLIP(.TRUE.)

         DO 100 I=1,12
            ICHR = TEXT(I)
            CALL GCHAR(X,Y,ICHR,SIZE,ANGLE)
100      CONTINUE

         CALL GNUM ( X, Y, SIZE, ANGLE, ANGLE, NDIG, 00 )

200   CONTINUE

C     Done: make sure the device is closed
      CALL GCLOSE

      END
C ---------------------------------------------------------------------
