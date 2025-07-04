      PROGRAM ROOTS
C
C
C      THIS PROGRAM CALCULATES AND DISPLAYS THE SAME TABLE
C      OF SQUARE ROOTS DISPLAYED BY THE EXAMPLE PROGRAM
C      ROOTS IN THE CROMEMCO FORTRAN MANUAL.
C      
C
      REAL A(10)
      INTEGER I,J,K
C
C
C      THESE LINES DISPLAY THE HEADING FOR THE TABLE
C      
C
      WRITE(3,1)
1     FORMAT(1X,/////,25X,21HTable of Square Roots,/)
      WRITE(3,2)
2     FORMAT(1X,8X,1H0,6X,1H1,6X,1H2,6X,1H3,6X,1H4,6X,1H5,6X,1H6,6X,1H7,
     *6X,1H8,6X,1H9,/)
C
C
C      THE FOLLOWING LINES CALCULATE 10 SQUARE ROOTS, LOAD
C      THEM INTO AN ARRAY, AND DISPLAY THE ELEMENTS OF THE
C      ARRAY.  THIS REPEATS 10 TIMES TO DISPLAY THE ENTIRE
C      TABLE.
C      
C
C      *** FOR
      CONTINUE
      I=0
23000 IF(.NOT.(I.LE.9))GOTO 23002
C        *** FOR
        CONTINUE
        J=0
23003   IF(.NOT.(J.LE.9))GOTO 23005
          A(J+1)=SQRT(FLOAT(10*I+J))
23004     J=J+1
          GOTO 23003
23005   CONTINUE
        WRITE(3,3)I,(A(K),K=1,10)
23001   I=I+1
        GOTO 23000
23002 CONTINUE
      WRITE(3,4)
3     FORMAT(1X,I1,1H-,10F7.3)
4     FORMAT(1X,//////)
      END      