%NOLIST	rem Theis is ALL.BAS used to include FORMAT and CONTROL

	rem This is FORMAT.BAS used to set common and formats.

	COMMON BLOCK.SIZE,PAGELEN,Z2,RX,T%(1),A(1),CLEAR$,CO.NAME$,D$(1),\
		LLL$,PPP$,DATE1$(1),BIZMII.FLAG
	N$=CO.NAME$
	L$=LLL$:P$=PPP$

	rem This is CONTROL.BAS used to set up control characters for
	rem your terminal.

	clear$=chr$(27)+"E"
	block.size=1024
	ON$=chr$(27)+"p" 
	OFF$=chr$(27)+"q"
	pagelen=51
	UP$=CHR$(27)+"A"
	CUR$=CHR$(27)+"Y"+CHR$(44)+CHR$(32)
	GOTO 50.5
50	CUR2$=CHR$(27)+"Y"+CHR$(CL+32)+CHR$(CC+32):RETURN
50.5	REM
%LIST
