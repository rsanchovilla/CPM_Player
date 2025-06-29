
C***********************************************************************
C
C     A simple FORTRAN interface to GSX-80 system
C     for Microsoft FORTRAN 3.44
C
C     Module GWK.FOR: Workstation Routines
C
C     Martin Hepperle, 2020
C
C***********************************************************************
C
C     Requires GSX.FI with common block for GSX data structure
C
C***********************************************************************
C ----<---------------------------------------------------------------->
      SUBROUTINE GWKOPN ( ID )
C
C     Open Workstation
C
      INTEGER*2 ID
C
      INCLUDE GSX.FI
C
      CONTRL(1) = 1
      CONTRL(2) = 0

      INTIN(1) = ID
      DO 100 I=2,10
         INTIN(I) = 1
100   CONTINUE

      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      NXRES = INTOUT(1)+1
      NYRES = INTOUT(2)+1

      DEVXMM = 1.0E-3 * NXRES * INTOUT(4)
      DEVYMM = 1.0E-3 * NYRES * INTOUT(5)

      RETURN
      END
C ----<---------------------------------------------------------------->
      SUBROUTINE GWKCLO
C
C     Close Workstation
C
      INCLUDE GSX.FI
C
      CONTRL(1) = 2
      CONTRL(2) = 0

      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
      SUBROUTINE GWKCLR

C
C     Clear Workstation
C
      INCLUDE GSX.FI
C
      CONTRL(1) = 3
      CONTRL(2) = 0

      CALL GSXCAL( CONTRL, INTIN, PTSIN, INTOUT, PTSOUT )

      RETURN
      END
C ----<---------------------------------------------------------------->
      SUBROUTINE GWKINQ ( ISIZRC, SIZMM )
C
C     Return resolution in RC and size in Millimeters
C
      INTEGER*2 ISIZRC(2)
      REAL*4 SIZMM(2)
C
      INCLUDE GSX.FI
C
      ISIZRC(1) = NXRES
      ISIZRC(2) = NYRES

      SIZMM(1) = DEVXMM
      SIZMM(2) = DEVYMM

      RETURN
      END
C ----<---------------------------------------------------------------->
