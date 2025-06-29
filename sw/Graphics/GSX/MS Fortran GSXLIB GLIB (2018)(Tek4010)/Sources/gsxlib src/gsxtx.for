C***********************************************************************
C
C     A simple FORTRAN interface to GSX-80 system
C     for Microsoft FORTRAN 3.44
C
C     Module GTX.FOR: Text Routines
C
C     Martin Hepperle, 2020
C
C***********************************************************************
C
C     Requires GSX.FI with common block for GSX data structure
C
C***********************************************************************
C ----<---------------------------------------------------------------->
      SUBROUTINE GTXOUT ( IX, IY, CTEXT, ILEN )
C     parameters
      INTEGER*2 IX, IY, ILEN
      INTEGER*1 CTEXT(100)
C     local
      INTEGER*2 I
C
      INCLUDE GSX.FI
C

C     plot text
      CONTRL(1) = 8
      CONTRL(2) = 1
      CONTRL(4) = ILEN

      PTSIN(1) = IX
      PTSIN(2) = IY

      DO 100 I=1,ILEN
         INTIN(I) = CTEXT(I)
100   CONTINUE

      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
      SUBROUTINE GTXSET ( ISIZE, IDEGZ, ICOLOR )
C     parameters
C     IDEGZ = baseline angle in 1/10 degrees
      INTEGER*2 ISIZE, IDEGZ, ICOLOR
C     local
      INTEGER*2 I
C
      INCLUDE GSX.FI
C
C     set character height
      CONTRL(1) = 12
      CONTRL(2) = 1
      PTSIN(1) = 0
      PTSIN(2) = ISIZE
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

C     set text angle
      CONTRL(1) = 13
      CONTRL(2) = 0
      INTIN(1) = IDEGZ
      INTIN(2) = IFIX(COS(0.1*IDEGZ)*100.0)
      INTIN(3) = IFIX(SIN(0.1*IDEGZ)*100.0)
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
