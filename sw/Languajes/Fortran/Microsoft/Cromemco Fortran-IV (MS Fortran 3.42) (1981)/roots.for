      PROGRAM ROOTS
C
C    This program calculates and prints a table of square roots.
C
C    LUN 3 is assigned to the terminal, so the number 3 appears
C    in the WRITE statements.
C
      REAL A(10)
      INTEGER I, I2, J, J2, K
C
C    These lines print the heading for the table.
C
        WRITE (3, 1)
1       FORMAT (1X, /////, 25X, 'TABLE OF SQUARE ROOTS', /)
        WRITE (3, 2)
2       FORMAT (1X, 8X, '0', 6X, '1', 6X, '2', 6X, '3', 6X, '4', 6X,
     -                  '5', 6X, '6', 6X, '7', 6X, '8', 6X, '9', /)
C
C    The following lines calculate 10 square roots, load them into
C    an array, and print the elements of the array.
C
        DO 100 I = 1, 10
        I2 = I - 1
        DO 200 J = 1, 10
        J2 = J - 1
        A(J) = SQRT (FLOAT (I2*10 + J2))
200     CONTINUE
100     WRITE (3, 3) I2, (A(K), K = 1, 10)
3       FORMAT (1X, I1, '-', 10(F7.3))
        WRITE (3, 4)
4       FORMAT (1X, ///)
        END
 "¼ ";ÍÑ*Ä ëÍ*Æ ·ÍBK*Ä ë*Æ åÕÍ"=¯2­ G<2® ÑáõÃÑ