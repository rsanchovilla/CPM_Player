	PROGRAM COPYTX
C
C   Text copy program to to show some file facilities
C   29 Dec 82
C
	INTEGER*1  FNAME(20),LINE(80),I,J,BLANK
	INTEGER*2  IUNIT,OUNIT
C
	IUNIT = 20
	OUNIT = 21
	BLANK = 32
C
	PRINT 110
	READ (1,100) FNAME
	OPEN (IUNIT,FNAME)
	PRINT 120
	READ (1,100) FNAME
	OPEN (OUNIT,FNAME)
C
  10	CONTINUE
	READ (IUNIT,100,END=70,ERR=80) LINE
C   Using A format, LINE is filled with trailing blanks
C   Search for last non-blank character
	J = 80
  20	IF (LINE(J).NE.BLANK) GOTO 50
	IF (J.EQ.1) GOTO 30
	J = J - 1
	GOTO 20
C
C   Blank line
  30	WRITE (OUNIT,140)
	GOTO 10
C
C   Output the contents of LINE
  50	WRITE (OUNIT,100) (LINE(I),I=1,J)
	GOTO 10
C
C   End of file on input
  70	PRINT 130
	STOP
C
C   Error on input (e.g. file does not exist)
  80	PRINT 150
	STOP
C
  100	FORMAT (80A1)
  110	FORMAT (' Input filename - ')
  120	FORMAT (' Output filename - ')
  130	FORMAT (' Copy complete'/)
  140	FORMAT ()
  150	FORMAT (' Input error'/)
	END
