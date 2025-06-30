COMMENT

	*********************************************************
	*							*
	*	Auxilliary program for CBMENU.BAS		*
	*							*
	*	By R. Schrader					*
	*							*
	*	Copyright (C) 1983 by Non-Linear Systems, Inc   *
	*	No warranty is made, expressed, or implied.	*
	*							*
	*********************************************************

END
 	$LINES

	VAR CREDIT_STRING = STRING
	CREDIT_STRING = "     WRITTEN BY ROBERT SCHRADER     "

	VAR C = CHAR
	VAR FILE_NAME = STRING:14
	BASED F_NAME = STRING:14
	BASE F_NAME AT 80H
	VAR TRUE, FALSE = INTEGER

	REM Translation tables.
	VAR SPEC_CHAR = STRING:128
	VAR UP_CASE = STRING:128
	UP_CASE    = "..............................." +\
		     " !"+CHR(34)+"#$%&'()*+,-./0123456789:;<=>?" +\
		     "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_" +\
		     "`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~"

	SPEC_CHAR  = "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" +\
		     " !"+chr(34)+"#$%&'()$+$-$/0123456789$$$$$$" +\
		     "@ABCDEFGHIJKLMNOPQRSTUVWXYZ$\$^_" +\
		     "`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~"


	PROCEDURE COMMAND_LINE( FILE_NAME1,DEFAULT_CMND,COM_FILE,RECOVER=STRING )
		DEFAULT_CMND = " "+DEFAULT_CMND
		BASED FILE_CONTROL_BLOCK = STRING
		BASED COMMAND_BUFFER = STRING
		BASED DRIVE_NUMBER, BUFFER_LENGTH = BYTE
		BASED EXTENT_NUMBER, RECORD_NUMBER = BYTE
		$CONSTANT TFCB = 5CH
		$CONSTANT TBUFF= 80H

		BASE FILE_CONTROL_BLOCK AT TFCB
		BASE DRIVE_NUMBER	AT TFCB
		BASE EXTENT_NUMBER	AT TFCB+16
		BASE RECORD_NUMBER	AT TFCB+32
		BASE COMMAND_BUFFER	AT TBUFF
		BASE BUFFER_LENGTH	AT TBUFF

		FILE_CONTROL_BLOCK  = FCB$(RIGHT(FILE_NAME1,3))
		EXTENT_NUMBER = 0
		RECORD_NUMBER = 0
		DRIVE_NUMBER = ASCII(FILE_NAME1)-64
		COMMAND_BUFFER = XLATE(DEFAULT_CMND,UP_CASE)
		BUFFER_LENGTH  = LEN(DEFAULT_CMND)
		IF LEN(RECOVER) THEN
			EXECUTE COM_FILE,RECOVER
		    ELSE
			EXECUTE COM_FILE
	END of procedure set up parameters for command line.

	F_NAME = RIGHT(F_NAME,2)
	F_NAME = LEFT$(F_NAME,(LEN(F_NAME)-4))
	PRINT "A4>CBAS2 ";F_NAME
	PRINT "A4>CRUN2 ";F_NAME
	COMMAND_LINE F_NAME,F_NAME,"CBAS2.COM","CRUN2 "+F_NAME

