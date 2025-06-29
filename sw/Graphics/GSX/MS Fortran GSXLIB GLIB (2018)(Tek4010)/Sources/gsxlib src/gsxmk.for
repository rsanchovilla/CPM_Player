C***********************************************************************
C
C     A simple FORTRAN interface to GSX-80 system
C     for Microsoft FORTRAN 3.44
C
C     Module GMK.FOR: Marker Routines
C
C     Martin Hepperle, 2020
C
C***********************************************************************
C
C     Requires GSX.FI with common block for GSX data structure
C
C***********************************************************************
C ----<---------------------------------------------------------------->
      SUBROUTINE GMKSET ( ISIZE, IMARK, ICOLOR )
      INTEGER*2 IMARK, ISIZE, ICOLOR
C
      INCLUDE GSX.FI
C

C     set marker color index
      CONTRL(1) = 20
      CONTRL(2) = 0
      INTIN(1) = ICOLOR
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

C     set marker type
      CONTRL(1) = 18
      CONTRL(2) = 0
      INTIN(1) = IMARK
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

C     set marker size
      CONTRL(1) = 19
      CONTRL(2) = 0
      PTSIN(1) = 0
      PTSIN(2) = ISIZE
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
      SUBROUTINE GMKPLT ( IX, IY )
      INTEGER*2 IX, IY
C
      INCLUDE GSX.FI
C
C     plot marker
      CONTRL(1) = 7
      CONTRL(2) = 1
      PTSIN(1) = IX
      PTSIN(2) = IY
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
