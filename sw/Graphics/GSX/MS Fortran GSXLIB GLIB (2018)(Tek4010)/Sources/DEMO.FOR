C***********************************************************************
C
C     A simple FORTRAN interface to GSX-80 system
C     for Microsoft FORTRAN 3.44
C
C     Please avoid MS-FTN before version 3.44 (many array acces bugs).
C
C     Martin Hepperle, 2020
C
C***********************************************************************
C
C     Requires GSX.FI with common block for GSX data structure
C
C     f80 =gsx
C     l80 gsx/N,gsx,gsxlib/S,forlib/S,/E
C     gengraf gsx
C
C     For clarity we always write INTEGER*2 which is the
C     default INTEGER in MS FORTRAN-80.
C     We avoid INTEGER*4 to save memory.
C
C***********************************************************************
      PROGRAM GSX
C
      INTEGER*1 STRING(80)
      INTEGER*2 ILEN, ISZMIN, ISZMAX
      INTEGER*2 NMKTYP,IMKMAX,IMKMIN
      INTEGER*2 I,J,IX,IY
C
      INCLUDE GSX.FI
C
      DATA STRING /'H','e','l','l','o',' ','G','S','X',
     1             ' ','W','o','r','l','d','!'/
C     length of STRING
      DATA ILEN /16/

C     1) query device properties
      CALL GWKOPN(1)
      CALL GWKCLO

C     header
      WRITE(1,1010)

      DO 100 I=1,22
         J = I+22
         IF ( I .GT. 12 ) GOTO 90
         WRITE(1,1020) I,INTOUT(I),J,INTOUT(J),I,PTSOUT(I)
         GOTO 100
90       WRITE(1,1025) I,INTOUT(I),J,INTOUT(J)
100   CONTINUE
      I = 45
      WRITE(1,1026) I,INTOUT(I)

C     number of markers
      NMKTYP = INTOUT(9)
C     min and max size
      IMKMIN = PTSOUT(10)
      IMKMAX = PTSOUT(12)
C     average line width
      IWIDTH = (PTSOUT(5)+PTSOUT(7))/2
C     character heights
      ISZMIN = PTSOUT(2)
      ISZMAX = PTSOUT(4)

C     2) draw something
      CALL GWKOPN(1)

      CALL GLNSET ( IWIDTH, 1 )
      CALL GLNPLT (    10,    10,    10, 32757)
      CALL GLNPLT (    10, 32757, 32757, 32757)
      CALL GLNPLT ( 32757, 32757, 32757,    10)
      CALL GLNPLT ( 32757,    10,    10,    10)
      CALL GLNSET ( IWIDTH, 2 )
      CALL GLNPLT (    10, 32757, 32757,    10)

      IX = 5000
      IY = 5000
      DO 200 I=1,5
         IMKSIZ = IMKMIN + (I-1)*(IMKMAX-IMKMIN)/5
         CALL GMKSET ( IMKSIZ, I )
         CALL GMKPLT ( IX, IY )
        IX = IX + 5000
         IY = IY + 5000
200   CONTINUE

      CALL GMKSET ( 5*IMKMIN, 2 )
      CALL GMKPLT ( 5000, 25000 )
      CALL GTXSET ( ISZMIN, 0 )
      CALL GTXOUT ( 5000, 25000, STRING, ILEN )

      CALL GMKSET ( 5*IMKMIN, 2 )
      CALL GMKPLT ( 5000, 15000 )
      CALL GTXSET ( ISZMAX, 0 )
      CALL GTXOUT ( 5000, 15000, STRING, ILEN )

      CALL GWKCLO

1010  FORMAT(1H ,18X,'--- DEVICE PROPERTIES ---')
1020  FORMAT(1H ,'INTOUT(',I2,') =',I6,4X,'INTOUT(',I2,') =',I6,4X,
     1           'PTSOUT(',I2,') =',I6,4X)
1025  FORMAT(1H ,'INTOUT(',I2,') =',I6,4X,'INTOUT(',I2,') =',I6)
1026  FORMAT(1H ,22X,'INTOUT(',I2,') =',I6)
C
      END

C ----<---------------------------------------------------------------->
