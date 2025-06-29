C ---------------------------------------------
C
C     Library module for graphics output
C
C     Martin Hepperle, 11/2018
C
C     f80 =gdrawc
C
C ---------------------------------------------
      SUBROUTINE GDRAWC(X2,Y2)
C
C     Draw with clipping
C
      IMPLICIT LOGICAL(A-Z)

      REAL*4 X2, Y2

      REAL*4    X1,Y1,DDX,DDY,A,B
      INTEGER*2 IX1,IX2,IY1,IY2

C     for DOCLIP, XCLIP, YCLIP
      INCLUDE GLIB.FI

      X1 = XCLIP
      Y1 = YCLIP

      XCLIP = X2
      YCLIP = Y2

C     determine sector of end points
      CALL GCLIPS(X1,Y1,IX1,IY1)
      CALL GCLIPS(X2,Y2,IX2,IY2)

C     easy: both points outside?
      IF ( IX1*IX2 .EQ. 1 .OR. IY1*IY2 .EQ. 1 ) GOTO 40

C     Warning: X2 != X1
      DDX = X2-X1
      DDY = Y2-Y1

C     clip X1
C     Y = A*X+B
      A = 0.0
      IF ( DDX .NE. 0.0 ) A = DDY/DDX
      B = Y1 - A*X1

C     X1 in center
      IF (IX1 .EQ. 0 ) GOTO 10
C     X1 clipped left
      IF (IX1 .LT. 0 ) GOTO 1
C     X1 to right border
      X1 = XW1
      GOTO 2

C     X1 to left border
1     X1 = XW0

C     new Y1 value
2     CONTINUE
      Y1 = A*X1 + B
      CALL GCLIPS(X1,Y1,IX1,IY1)

C     clip Y1
10    CONTINUE

C     Y1 in center
      IF (IY1 .EQ. 0 ) GOTO 20

C     Y1 below
      IF (IY1 .LT. 0 ) GOTO 11

C     Y1 above
      Y1 = YW1
      GOTO 12

C     clip below
11    Y1 = YW0

C     new X1 value
12    CONTINUE
      IF ( A .NE. 0.0 ) X1 = (Y1-B)/A


C     clip X2
20    CONTINUE
C     X2 in center
      IF (IX2 .EQ. 0 ) GOTO 30

C     X2 clipped left
      IF (IX2 .LT. 0 ) GOTO 21

C     X2 to right border
      X2 = YW1
      GOTO 22

C     X2 to left border
21    X2 = XW0

C     new Y2 value for X2
22    CONTINUE
      Y2 = A*X2 + B
      CALL GCLIPS(X2,Y2,IX2,IY2)

C     clip Y2
30    CONTINUE
C     Y2 in center
      IF (IY2 .EQ. 0 ) GOTO 33
C     Y2 below
      IF (IY2 .LT. 0 ) GOTO 31
C     clip to upper border
      Y2 = YW1
      GOTO 32
C     clip to lower border
31    Y2 = YW0
C     new X2 value for Y2
32    CONTINUE
      IF ( A .NE. 0.0 ) X2 = (Y2-B)/A

33    CONTINUE
C     avoid recursion
      DOCLIP = .FALSE.
      CALL GMOVE(X1,Y1)
      CALL GDRAW(X2,Y2)
      DOCLIP = .TRUE.

40    CONTINUE

      RETURN
      END
C ---------------------------------------------
