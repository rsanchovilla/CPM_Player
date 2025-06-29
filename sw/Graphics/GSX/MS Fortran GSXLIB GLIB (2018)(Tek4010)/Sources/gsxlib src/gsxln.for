C***********************************************************************
C
C     A simple FORTRAN interface to GSX-80 system
C     for Microsoft FORTRAN 3.44
C
C     Module GSXLN.FOR: Line Routines
C
C     Martin Hepperle, 2020
C
C***********************************************************************
C
C     Requires GSX.FI with common block for GSX data structure
C
C***********************************************************************
C ----<---------------------------------------------------------------->
      SUBROUTINE GLNPLT ( IX0, IY0, IX1, IY1 )
      INTEGER*2 IX0, IY0, IX1, IY1
C
      INCLUDE GSX.FI
C
      CONTRL(1) = 6
      CONTRL(2) = 2

      PTSIN(1) = IX0
      PTSIN(2) = IY0
      PTSIN(3) = IX1
      PTSIN(4) = IY1

      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
      SUBROUTINE GLNSET ( IWIDTH, NSTYLE, NCOLOR )
      INTEGER*2 IWIDTH, NSTYLE, NCOLOR
C
      INCLUDE GSX.FI
C

C     set line width
      CONTRL(1) = 16
      CONTRL(2) = 1
      PTSIN(1) = IWIDTH
      PTSIN(2) = 0
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

C     set line type
      CONTRL(1) = 15
      CONTRL(2) = 0
      INTIN(1) = NSTYLE
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

C     set line color index
      CONTRL(1) = 17
      CONTRL(2) = 0
      INTIN(1) = NCOLOR
      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END

C ----<---------------------------------------------------------------->
