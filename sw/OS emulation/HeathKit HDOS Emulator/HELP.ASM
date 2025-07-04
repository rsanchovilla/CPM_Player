*	HELP - PRINT HRUN COMMANDS
*
*	THIS PROGRAM PRINTS A LIST OF COMMANDS
*	AVAILABLE AT THE SYSTEM LEVEL IN HRUN

.EXIT	EQU	0
.SCOUT	EQU	2
.ERROR	EQU	57Q
$TYPTX	EQU	195EH

	ORG	2280H

START	MVI	A,0AH
	SCALL	.SCOUT
	XRA	A
	MVI	H,10
	SCALL	.ERROR		PRINT SIGN-ON MESSAGE
	CALL	$TYPTX
	DB	10
	DB	'Valid System Commands:',10
	DB	'HELP		Print This List',10
	DB	'BYE		Return to CP/M',10
	DB	'CAT [DEV:]	List Files on Disk (using PIP.ABS)',10
	DB	'COPY TO=FROM	Copy FROM file to TO',10
	DB	'DATE [NEWDATE]	Display or Set Date',10
	DB	'DELETE FNAME	Delete File(s) (also DEL)',10
	DB	'DIR [DEV:]	List Files on Disk (using DIR.ABS)',10
	DB	'MAKEDIR [DEV:]	Make a DIRECT.SYS file [on DEV:] (required for CAT)',10
	DB	'PIP		Execute PIP',10
	DB	'RENAME TO=FROM	Rename File FROM to TO (also REN)',10
	DB	'RESET DEV:	Change Disk in Drive DEV:',10
	DB	'RUN FNAME	Run Program',10
	DB	'SET DEV: opt	Select Option for Device (requires SET.ABS)',10
	DB	'SET HELP	Documentation for SET Command',10
	DB	'TYPE FNAME	Type file contents on terminal',10
	DB	'VER		Display the Current Version of HDOS',10,10
	DB	'FNAME		Same as  RUN SY0:FNAME.ABS',10+80H
	XRA	A
	SCALL	.EXIT
	END	START
                                                                                                                           