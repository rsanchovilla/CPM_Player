C ---------------------------------------------------------------------
      PROGRAM  GPLOT
C ---------------------------------------------------------------------
C     Uses GLIB
C
C     f80 =gplot
C     l80 gplot/N,gplot,gplotsub,glib/S,gsxlib/S,forlib/S,/E
C     gengraf gplot
C
C ---------------------------------------------------------------------
C
      INTEGER*2 ID

      REAL*4 X(1000),Y(1000)
      REAL*4 XPT,YPT
      REAL*4 XMIN,XMAX,XSTP
      REAL*4 YMIN,YMAX,YSTP
      REAL*4 VAL,VALMIN,VALMAX
      REAL*4 VIEWX0,VIEWX1,VIEWY0,VIEWY1

      INTEGER*1 LINE(80)
C     legend entry
      INTEGER*2 LEGLEN
      INTEGER*1 LEGEND(25)
      REAL*4 XLEGOF,YLEGOF,YLEGSP
C     x-axis label
      INTEGER*2 XLALEN
      INTEGER*1 XLABEL(25)
      REAL*4 XLABOF
C     y-axis label
      INTEGER*2 YLALEN
      INTEGER*1 YLABEL(25)
      REAL*4 YLABOF
C     text label
      INTEGER*2 TXTLEN
      INTEGER*1 TEXT(50)
C     for axis numbers
      INTEGER*2 NXDIG,NYDIG

      INTEGER*2 LUN,I,J,K,NPTS,NCURVE
      LOGICAL   LGRID,LMARK,LXAXIS,LYAXIS,LXDROP,LYDROP

      EXTERNAL  STRCMP,STRCHR,STRCPY,STRVAL,STRTOK,STRCMD
      LOGICAL   STRCMP
      INTEGER*2 STRCHR
      INTEGER*2 STRCPY
      REAL*4    STRVAL
      INTEGER*2 STRTOK
      INTEGER*2 STRCMD

C     file name, without dot and blank filled
      INTEGER*1 FILNAM(11)
      DATA FILNAM /'G','P','L','O','T',' ',' ',' ','P','L','T'/

C     output device
      ID = 1

      VIEWX0 = 0.1
      VIEWX1 = 0.9
      VIEWY0 = 0.1
      VIEWY1 = 0.9

      XMIN =  1.0E32
      XMAX = -1.0E32
      YMIN =  1.0E32
      YMAX = -1.0E32

C     where y-axis intersects X-axis in UC
      XINTS = 0.0
C     where y-axis intersects X-axis in UC
      YINTS = 0.0

      LGRID = .TRUE.
      LMARK = .TRUE.
      LXAXIS = .TRUE.
      LYAXIS = .TRUE.

      LXDROP = .FALSE.
      LYDROP = .FALSE.

      XLALEN = 0
      YLALEN = 0

C     label offsets from axes mm
      XLABOF =  8.0
      YLABOF = 12.0

C     legend block start point rel. view
      XLEGOF = 0.7
      YLEGOF = 0.95
C     and legend line spacing rel. view
      YLEGSP = 0.03

      NXDIG = 1
      NYDIG = 1

C     get command line parameters
      K = STRCMD(LINE,80)

C     at least 1 character after blank?
      IF ( K .LT. 2) GOTO 1

C     compose the 11 character file name
      CALL MAKFIL(LINE,K,FILNAM)

C     '=' character?
      J = STRCHR(LINE,1,K,61)
      IF ( J .LT. 0) GOTO 1

      J = J+1
C     read ID from LINE(J:K)
      VALMIN = STRVAL(LINE,J,K)
      IF ( VALMIN .LT. 99 .AND. VALMIN .GT. 0 ) ID = IFIX(VALMIN)

1     CONTINUE

C     open data file on current drive
      LUN = 10
      I = 0
      CALL OPEN(LUN,FILNAM,I)

      WRITE(1,10) (FILNAM(I),I=1,8),(FILNAM(J),J=9,11),ID
10    FORMAT(1H ,'*** GPLOT ***',/,
     1       1H ,'Reading file "',8A1,'.'3A1,'".',/,
     2       1H ,'Plotting on device #',I3,/)

C     select output device
C     Note: also switches to graphics mode, so no further
C           text output should apper below.
      CALL GINIT(ID)

      CALL GVIEW(VIEWX0,VIEWX1, VIEWY0,VIEWY1)

C     start with no curve
      NCURVE = 0
C     start with first marker type
      IMARK = 1

C --------------------------------
C     prepare for next curve
50    CONTINUE
      NPTS = 0
      LEGLEN = 0

C     read next line
102   CONTINUE

      READ ( LUN, 1000, ERR=998, END=999 ) (LINE(I),I=1,80)
1000  FORMAT(80A1)

C     READ prepends LF on lines 2...n
C     first line:        '# comment'
C     subsequent lines:  LF,'# comment'
C                        LF,' 123.2 456.99'
      I = 1
      IF ( LINE(1) .EQ. 10 ) I=2

C     skip comment lines (35='#')
      IF ( LINE(I) .EQ. 35 ) GOTO 102

C     skip string comparisons if no command
      IF ( (LINE(I) .LT. 65) .OR. (LINE(2) .GT. 90) ) GOTO 103

C     commands start with a letter in 'A'...'Z'
C     normal commands
      IF ( STRCMP(LINE,I, 'LEGEND',6 ) )   GOTO 400
      IF ( STRCMP(LINE,I, 'GRID',4 ) )     GOTO 440
      IF ( STRCMP(LINE,I, 'LINE',4 ) )     GOTO 450
      IF ( STRCMP(LINE,I, 'PLOT',4 ) )     GOTO 500
      IF ( STRCMP(LINE,I, 'VIEWPORT',8 ) ) GOTO 700
      IF ( STRCMP(LINE,I, 'TEXT',4 ) )     GOTO 760
      IF ( STRCMP(LINE,I, 'MARKER',6 ) )   GOTO 780

C     commands starting with 'X' or 'Y'
      I = 3
      IF ( STRCMP(LINE,I, 'RANGE',5 ) )    GOTO 600
      IF ( STRCMP(LINE,I, 'AXIS',4 ) )     GOTO 610
      IF ( STRCMP(LINE,I, 'DROP',4 ) )     GOTO 620
      IF ( STRCMP(LINE,I, 'LABEL',5 ) )    GOTO 750
      IF ( STRCMP(LINE,I, 'DIGITS',6 ) )   GOTO 770

103   CONTINUE

C     array size exceeded?
      IF ( NPTS .GE. 1000 ) GOTO 102

C     parse LINE and add to point list
      NPTS = NPTS+1
      DECODE ( LINE, 1010 ) X(NPTS),Y(NPTS)
1010  FORMAT(2F10.5)

      GOTO 102

C --------------------------------
C     LEGEND("label")
C     LEGEND("label",xpos,ypos)
400   CONTINUE

C     locate "label" and copy LINE(J:K) to LEGEND(1,...)
      IF ( STRTOK(LINE,7,80,34,34,J,K) .NE. -1 )
     1     LEGLEN = STRCPY(LINE,J,K,LEGEND,1,25)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102
      XLEGOF = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102
      YLEGOF = STRVAL(LINE,J,K)

C     locate comma, closing parenthesis
      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102
      YLEGSP = STRVAL(LINE,J,K)

      GOTO 102

C --------------------------------
C     GRID (ON)
C     GRID (OFF)
440   CONTINUE
      IF ( STRTOK(LINE,5,80,40,41,J,K) .EQ. -1 ) GOTO 102
      LGRID = .FALSE.
C     (ON)               'N'
      IF ( LINE(J+1) .EQ. 78 ) LGRID = .TRUE.
      GOTO 102

C --------------------------------
C     LINE (X0,Y0,X1,Y1,NSYS)
C     NSYS= 0: UC, 1: rel. viewport, 2: mm abs.
450   CONTINUE

C     locate opening parenthesis, comma
      K = 4
      IF ( STRTOK(LINE,K,80,40,44,J,K) .EQ. -1 ) GOTO 102

C     read X0 from LINE(J:K)
      X(1) = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read Y0 from LINE(J:K)
      Y(1) = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read X1 from LINE(J:K)
      X(2) = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read Y1 from LINE(J:K)
      Y(2) = STRVAL(LINE,J,K)

C     locate comma, closing parenthesis
      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102

C     read FLAG from LINE(J:K)
      I = IFIX(STRVAL(LINE,J,K))

      CALL GSPEN(0.5,1,1)

      IF ( I .EQ. 0 ) GOTO 455
      IF ( I .EQ. 1 ) GOTO 452

C     2: from millimeter to UC
      CALL GMMUC(X(1),Y(1),X(1),Y(1))
      CALL GMMUC(X(2),Y(2),X(2),Y(2))
      GOTO 455

452   CONTINUE
C     1; from frame to UC
      CALL GFRUC(X(1),Y(1),X(1),Y(1))
      CALL GFRUC(X(2),Y(2),X(2),Y(2))
      GOTO 455

455   CONTINUE
C     draw line in UC
      CALL GMOVE(X(1),Y(1))
      CALL GDRAW(X(2),Y(2))

      GOTO 102

C --------------------------------
C     read XRANGE label
C     XRANGE (min,step,max)
C     YRANGE (min,step,max)
600   CONTINUE

C     locate opening parenthesis, comma
      K = 7
      IF ( STRTOK(LINE,K,80,40,44,J,K) .EQ. -1 ) GOTO 102

C     read XMIN from LINE(J:K)
      VALMIN = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read XSTEP from LINE(J:K)
      VALSTP = STRVAL(LINE,J,K)

C     locate comma, closing parenthesis
      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102

C     read XMAX from LINE(J:K)
      VALMAX = STRVAL(LINE,J,K)

      IF ( LINE(2) .EQ. 89 ) GOTO 601

C     'XRANGE'
      XMIN = VALMIN
      XMAX = VALMAX
      XSTP = VALSTP
      CALL GWIND(XMIN,XMAX, YMIN,YMAX)
      GOTO 102

C     'YRANGE'
601   CONTINUE
      YMIN = VALMIN
      YMAX = VALMAX
      YSTP = VALSTP
      CALL GWIND(XMIN,XMAX, YMIN,YMAX)
      GOTO 102

C --------------------------------
C     read .AXIS flag
C     XAXIS (ON)
C     YAXIS (OFF)
610   CONTINUE

C     locate opening parenthesis, closing parentesis
      K = 6
      IF ( STRTOK(LINE,K,80,40,41,J,K) .EQ. -1 ) GOTO 102

      IF ( LINE(2) .EQ. 89 ) GOTO 611

C     'XAXIS'
      LXAXIS = .FALSE.
C     (ON)               'N'
      IF ( LINE(J+1) .EQ. 78 ) LXAXIS = .TRUE.
      GOTO 102

C     'YAXIS'
611   CONTINUE
      LYAXIS = .FALSE.
C     (ON)               'N'
      IF ( LINE(J+1) .EQ. 78 ) LYAXIS = .TRUE.
      GOTO 102

C --------------------------------
C     read .DROP flag
C     XDROP
C     YDROP
620   CONTINUE

C     locate opening parenthesis, closing parentesis
      K = 6
      IF ( STRTOK(LINE,K,80,40,41,J,K) .EQ. -1 ) GOTO 102

      IF ( LINE(2) .EQ. 89 ) GOTO 621

C     'XDROP (ON/OFF)'
      LXDROP = .FALSE.
C     (ON)               'N'
      IF ( LINE(J+1) .EQ. 78 ) LXDROP = .TRUE.
      GOTO 102

C     'YDROP (ON/OFF)'
621   CONTINUE
      LYDROP = .FALSE.
C     (ON)               'N'
      IF ( LINE(J+1) .EQ. 78 ) LYDROP = .TRUE.
      GOTO 102

C --------------------------------
C     read VIEWPORT
C     VIEWPORT (X0,X1,Y0,Y1)
700   CONTINUE

C     locate opening parenthesis, comma
      K = 9
      IF ( STRTOK(LINE,K,80,40,44,J,K) .EQ. -1 ) GOTO 102

C     read X0 from LINE(J:K)
      VIEWX0 = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read X1 from LINE(J:K)
      VIEWX1 = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read Y0 from LINE(J:K)
      VIEWY0 = STRVAL(LINE,J,K)

C     locate comma, closing parenthesis
      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102

C     read Y1 from LINE(J:K)
      VIEWY1 = STRVAL(LINE,J,K)

      CALL GVIEW(VIEWX0,VIEWX1, VIEWY0,VIEWY1)

C     restart autorange
      XMIN =  1.0E32
      XMAX = -1.0E32
      YMIN =  1.0E32
      YMAX = -1.0E32
      XINTS = 0.0
      YINTS = 0.0

      NCURVE = 0

      GOTO 102

C --------------------------------
C     read axis label
C     XLABEL (""), optional offset XLABEL("",XOFFSET)
C     YLABEL (""), optional offset YLABEL("",YOFFSET)
750   CONTINUE

C     locate double quotes
      K = 5
      IF ( STRTOK(LINE,K,80,34,34,J,K) .EQ. -1 ) GOTO 102

      IF ( LINE(2) .EQ. 89 ) GOTO 751
C     'XLABEL'
C     copy LINE(J:K) to XLABEL(1,...) and append space
      XLALEN = STRCPY(LINE,J,K,XLABEL,1,25)

      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102
      XLABOF = STRVAL(LINE,J,K)

      GOTO 102

751   CONTINUE
C     copy LINE(J:K) to YLABEL(1,...) and append space
      YLALEN = STRCPY(LINE,J,K,YLABEL,1,25)

      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102
      YLABOF = STRVAL(LINE,J,K)

      GOTO 102

C --------------------------------
C     read TEXT label
C     TEXT(X,Y,STRING,SIZE,ANGLE,NSYS)
760   CONTINUE

C     locate opening parenthesis, comma
      K = 5
      IF ( STRTOK(LINE,K,80,40,44,J,K) .EQ. -1 ) GOTO 102

C     read XPT from LINE(J:K)
      XPT = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read YPT from LINE(J:K)
      YPT = STRVAL(LINE,J,K)

C     locate double quotes
      IF ( STRTOK(LINE,K,80,34,34,J,K) .EQ. -1 ) GOTO 102

C     read text
      TXTLEN = STRCPY(LINE,J,K,TEXT,1,50)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read SIZE from LINE(J:K)
      SIZE = STRVAL(LINE,J,K)

C     locate comma, comma
      IF ( STRTOK(LINE,K,80,44,44,J,K) .EQ. -1 ) GOTO 102

C     read ANGLE from LINE(J:K)
      ANGLE = STRVAL(LINE,J,K)

C     locate comma, closing parenthesis
      IF ( STRTOK(LINE,K,80,44,41,J,K) .EQ. -1 ) GOTO 102

C     read FLAG from LINE(J:K)
      I = IFIX(STRVAL(LINE,J,K))

      IF ( I .EQ. 0 ) GOTO 765
      IF ( I .EQ. 1 ) GOTO 762

C     2: from millimeter to UC
      CALL GMMUC(XPT,YPT,XPT,YPT)

      GOTO 765

762   CONTINUE
C     XPT,YPT from frame to UC
      CALL GFRUC(XPT,YPT,XPT,YPT)
      GOTO 765

765   CONTINUE
C     draw text in UC
      CALL GTEXT(XPT,YPT,TEXT,TXTLEN,SIZE,ANGLE,00)

      GOTO 102

C --------------------------------
C     read axis digits
C     XDIGITS (1)
C     YDIGITS (2)
770   CONTINUE

C     locate pair of parenthesis
      K = 5
      IF ( STRTOK(LINE,K,80,40,41,J,K) .EQ. -1 ) GOTO 102

      VAL = STRVAL(LINE,J,K)

      IF ( LINE(2) .EQ. 89 ) GOTO 771
      NXDIG = IFIX(VAL)
      GOTO 102

771   CONTINUE
      NYDIG = IFIX(VAL)
      GOTO 102

C --------------------------------
C     MARKER (ON)
C     MARKER (OFF)
780   CONTINUE
      IF ( STRTOK(LINE,5,80,40,41,J,K) .EQ. -1 ) GOTO 102
      LMARK = .FALSE.
C     (ON)               'N'
      IF ( LINE(J+1) .EQ. 78 ) LMARK = .TRUE.
      GOTO 102

C --------------------------------
C     plot curve
500   CONTINUE

      IF ( NCURVE .GT. 0 ) GOTO 905

C --------------------------------
C     FIRST curve
C --------------------------------

C     scaling on FIRST data set only

C     optional AUTOSCALE
      IF ( (XMIN .NE.  1.0E32) .AND.
     1     (XMAX .NE. -1.0E32) ) GOTO 806

      DO 805 I=1,NPTS
         IF ( X(I) .LT. XMIN ) XMIN = X(I)
         IF ( X(I) .GT. XMAX ) XMAX = X(I)
805   CONTINUE

      CALL GAUTO(XMIN,XMAX,10, XMIN,XMAX,XSTP)
      IF ( XMIN .GT. 0.0 ) XINTS = XMIN
      IF ( XMAX .LT. 0.0 ) XINTS = XMAX

806   CONTINUE
      IF ( (YMIN .NE.  1.0E32) .AND.
     1     (YMAX .NE. -1.0E32) ) GOTO 808

      DO 807 I=1,NPTS
         IF ( Y(I) .LT. YMIN ) YMIN = Y(I)
         IF ( Y(I) .GT. YMAX ) YMAX = Y(I)
807   CONTINUE

      CALL GAUTO(YMIN,YMAX,10, YMIN,YMAX,YSTP)
      IF ( YMIN .GT. 0.0 ) YINTS = YMIN
      IF ( YMAX .LT. 0.0 ) YINTS = YMAX

808   CONTINUE

      CALL GWIND(XMIN,XMAX, YMIN,YMAX)
      CALL GRECT(XMIN,YMIN, XMAX,YMAX)

      IF ( LXAXIS .EQ. .FALSE. ) GOTO 809

C     plot X-AXIS
C     x-axis with +1.5 mm minor and -2.0 major ticks
      VALSTP = 0.5*XSTP
      CALL GXAXIS(XMIN,XMAX, YINTS, VALSTP, 1.5)
      CALL GXAXIS(XMIN,XMAX, YINTS, XSTP, -2.0)

C     distance of numbers in millimeters
      YPT = -3.0
C     YPT to UC
      CALL GDMMUC(XPT,YPT)
C     add origin
      YPT = YINTS + YPT
      CALL GXALAB(XMIN,XMAX, YPT, XSTP,2.5,0.0,NXDIG)

C     vertical offset of X-label
      YPT = XLABOF
C     YPT to UC
      CALL GDMMUC(XPT,YPT)
C     down from origin
      YPT = YINTS - YPT
C     in UC
      XPT = (XMAX+XMIN)*0.5
      IF ( XLALEN .GT. 0 )
     1    CALL GTEXT(XPT,YPT,XLABEL,XLALEN,4.0,0.0,12)

809   CONTINUE
      IF ( LGRID .EQ. .FALSE. ) GOTO 810

C     draw vertical raster lines inside frame
      VALSTP = XSTP
      CALL GSPEN(0.25,2,1)
      CALL GXRAST(XMIN+VALSTP,XMAX-0.5*VALSTP,VALSTP,YMIN,YMAX)
      CALL GSPEN(0.25,1,1)

810   CONTINUE
      IF ( LYAXIS .EQ. .FALSE. ) GOTO 811

C     plot Y-AXIS
C     y-axis with +1.5 mm minor and -2.0 major ticks
      VALSTP = 0.5*YSTP
      CALL GYAXIS(YMIN,YMAX, XINTS, VALSTP, 1.5)
      CALL GYAXIS(YMIN,YMAX, XINTS, YSTP, -2.0)

C     distance of numbers in millimeters
      XPT = -3.0
C     XPT to UC
      CALL GDMMUC(XPT,YPT)
C     add origin
      XPT = XINTS + XPT
      CALL GYALAB(YMIN,YMAX, XPT, YSTP,2.5,0.0,NYDIG)

C     horizontal offset of Y-label
      XPT = YLABOF
C     XPT to UC
      CALL GDMMUC(XPT,YPT)
C     down from origin
      XPT = XINTS - XPT
C     y in UC
      YPT = (YMAX+YMIN)*0.5
      IF ( YLALEN .GT. 0 )
     1   CALL GTEXT(XPT,YPT,YLABEL,YLALEN,4.0,90.0,10)

811   CONTINUE
      IF ( LGRID .EQ. .FALSE. ) GOTO 812

C     draw horizontal raster lines inside frame
      VALSTP = YSTP
      CALL GSPEN(0.25,2,1)
      CALL GYRAST(YMIN+VALSTP,YMAX-0.5*VALSTP,VALSTP,XMIN,XMAX)
      CALL GSPEN(0.25,1,1)

812   CONTINUE

C --------------------------------
C     all curves
C --------------------------------
905   CONTINUE

      IF ( NPTS .LT. 1 ) GOTO 50

      NCURVE = NCURVE+1

      CALL GMOVE(X(1),Y(1))
      DO 650 I=2,NPTS
         CALL GDRAW(X(I),Y(I))
650   CONTINUE

      IF ( LMARK .EQ. .FALSE. ) GOTO 656
C     plot marker at each point
      CALL GSMARK(10.0,IMARK,1)
      DO 655 I=1,NPTS
         CALL GMARK(X(I),Y(I))
655   CONTINUE
C
C     prepare fo next
      IMARK=IMARK+1
      IF ( IMARK .GT. 6 ) IMARK = 1

656   CONTINUE
      IF ( .NOT. LXDROP ) GOTO 659
C     drop vertical lines to X-Axis
      DO 657 I=1,NPTS
         CALL GMOVE(X(I),Y(I))
         CALL GDRAW(X(I),YINTS)
657   CONTINUE

659   CONTINUE
      IF ( .NOT. LYDROP ) GOTO 668
C     drop horizontal lines to Y-Axis
      DO 660 I=1,NPTS
         CALL GMOVE(X(I),Y(I))
         CALL GDRAW(XINTS,Y(I))
660   CONTINUE

668   CONTINUE
      IF ( LEGLEN .EQ. 0 ) GOTO 670

C     add legend entry
C     in normalized UC
      CALL GWIND(0.0,1.0, 0.0,1.0)
      XPT = XLEGOF
      YPT = YLEGOF - (NCURVE-1)*YLEGSP
      CALL GMOVE(XPT,YPT)
      XPT = XPT + 0.08
      CALL GDRAW(XPT,YPT)

      IF ( LMARK .EQ. .FALSE. ) GOTO 669
      XPT = XPT - 0.04
      CALL GMARK(XPT,YPT)

669   CONTINUE
C     Note: GTEXT updates XPT and YPT to lower left of next char
      XPT = XLEGOF + 0.09
      CALL GTEXT(XPT,YPT, LEGEND,LEGLEN, 2.5, 0.0, 01)
C     restore
      CALL GWIND(XMIN,XMAX, YMIN,YMAX)

670   CONTINUE
C     prepare next curve
      GOTO 50

998   CONTINUE
      WRITE(1,1020)
1020  FORMAT(1H ,'Error: cannot read from file.')

999   CONTINUE
C     Done: make sure the device is closed
      CALL GCLOSE

      END
C ---------------------------------------------------------------------
C ---------------------------------------------------------------------
