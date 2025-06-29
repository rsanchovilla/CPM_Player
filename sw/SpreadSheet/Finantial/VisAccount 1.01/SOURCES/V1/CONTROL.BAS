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
