COMMENT

	*********************************************************
	*							*
	*	C-Basic menu program for Kaypro 10.		*
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

	VAR VERSION_STRING = STRING
	VERSION_STRING = "Version 1.0"

	DIM BYTE BUFFER_128(128)
	DIM BYTE FCBUFF(32)

	VAR SETDMA, SEARCH_FIRST, SEARCH_NEXT = INTEGER
	SETDMA = 26
	SEARCH_FIRST = 17
	SEARCH_NEXT = 18

	VAR RESPONSE, ESC, RTN, UP_ARROW, DOWN_ARROW, BACK_SPACE = CHAR
	VAR FILE_NAME, N_STR = STRING:14
	VAR TRUE, FALSE = INTEGER
	FALSE= 0
	TRUE = NOT FALSE   
	ESC = 1BH
	RTN = 0DH
	UP_ARROW = 2DH
	DOWN_ARROW = 2BH
	BACK_SPACE = 8
	N_STR = ""
	VAR BDOS = INTEGER
	BDOS = 5
	
	REM Alter the vector pad: "+" is down, "-" is up.
	REM EA35 and EA36 are equates in the BIOS that assign the arrow keys.
	BASED NEW_UP, NEW_DOWN  = BYTE
	BASE NEW_UP AT 0EA35H
	BASE NEW_DOWN AT 0EA36H
	NEW_UP = UP_ARROW
	NEW_DOWN = DOWN_ARROW

	REM The possible video attributes.
	VAR INVERSE, REDUCED, BLINKING, UNDERLINE, CURSOR = CHAR
	REM Intitialize attributes.
	INVERSE = '0'
	REDUCED = '1'
	BLINKING = '2'
	UNDERLINE = '3'
	CURSOR = '4' 

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

	VAR MSG_1, MSG_0 = STRING
	MSG_0 = "Hit the down-arrow to use this menu, or ESC to exit." 
	MSG_1 = "Hit RETURN to run a program, or ESC to exit.        "

	VAR J, K, L = INTEGER

	VAR XPL_MAX = INTEGER
	XPL_MAX = 14

	VAR CHOICE_MAX = INTEGER
	CHOICE_MAX = 6

	REM Image for printing menu on screen.
	DIM STRING:49; SCREEN(20)
	SCREEN (0) = "                                                 "
	SCREEN (1) = "     List CBasic source programs    (*.BAS)      "
	SCREEN (2) = "     List CBasic compiled programs  (*.INT)      "
	SCREEN (3) = "     Edit a program                              "
	SCREEN (4) = "     Compile a program                           "
	SCREEN (5) = "     Run a program                               "
	SCREEN (6) = "     Compile and run a program                   "

	REM Text of explanations.
	DIM STRING:25; EXPLAIN(20,20)
	EXPLAIN (0,1)  = "    Use the arrow keys to"
	EXPLAIN (0,2)  = " move the highlighted bar"
	EXPLAIN (0,3)  = " up and down.    When the"
	EXPLAIN (0,4)  = " program(s) that you want"
	EXPLAIN (0,5)  = " is(are) highlighted, hit"
	EXPLAIN (0,6)  = " the return key.         "
	EXPLAIN (0,7)  = "                         "
	EXPLAIN (0,8)  = "    A short description  "
	EXPLAIN (0,9)  = " of the highlighted item "
	EXPLAIN (0,10) = " will appear in this box."
	EXPLAIN (0,11) = "                         "
	EXPLAIN (0,12) = "    If you wish to exit  "
	EXPLAIN (0,13) = " from this menu, hit the "
	EXPLAIN (0,14) = " escape key.             "


	EXPLAIN (1,1)  = "    This option will show"
	EXPLAIN (1,2)  = " you all of the CBasic   "
	EXPLAIN (1,3)  = " source(uncompiled) files"
	EXPLAIN (1,4)  = " in this user group.     "
	EXPLAIN (1,5)  = "                         "
	EXPLAIN (1,6)  = "                         "
	EXPLAIN (1,7)  = "                         "
	EXPLAIN (1,8)  = "                         "
	EXPLAIN (1,9)  = "                         "
	EXPLAIN (1,10) = "                         "
	EXPLAIN (1,11) = "                         "
	EXPLAIN (1,12) = "                         "
	EXPLAIN (1,13) = "                         "
	EXPLAIN (1,14) = "                         "

	EXPLAIN (2,1)  = "    This option will show"
	EXPLAIN (2,2)  = " you all the executable  "
	EXPLAIN (2,3)  = " CBasic files in this    "
	EXPLAIN (2,4)  = " user group.             "
	EXPLAIN (2,5)  = "                         "
	EXPLAIN (2,6)  = "                         "
	EXPLAIN (2,7)  = "                         "
	EXPLAIN (2,8)  = "                         "
	EXPLAIN (2,9)  = "                         "
	EXPLAIN (2,10) = "                         "
	EXPLAIN (2,11) = "                         "
	EXPLAIN (2,12) = "                         "
	EXPLAIN (2,13) = "                         "
	EXPLAIN (2,14) = "                         "

	EXPLAIN (3,1)  = "   This option allows you"
	EXPLAIN (3,2)  = " to edit a CBasic file   "
	EXPLAIN (3,3)  = " using WordStar.         "
	EXPLAIN (3,4)  = "                         "
	EXPLAIN (3,5)  = "                         "
	EXPLAIN (3,6)  = "                         "
	EXPLAIN (3,7)  = "                         "
	EXPLAIN (3,8)  = "                         "
	EXPLAIN (3,9)  = "                         "
	EXPLAIN (3,10) = "                         "
	EXPLAIN (3,11) = "                         "
	EXPLAIN (3,12) = "                         "
	EXPLAIN (3,13) = "                         "
	EXPLAIN (3,14) = "                         "

	EXPLAIN (4,1)  = "   This option allows you"
	EXPLAIN (4,2)  = " to compile a CBasic     "
	EXPLAIN (4,3)  = " program.  That is, you  "
	EXPLAIN (4,4)  = " can turn a BAS file into"
	EXPLAIN (4,5)  = " an INT file.            "
	EXPLAIN (4,6)  = "                         "
	EXPLAIN (4,7)  = "                         "
	EXPLAIN (4,8)  = "                         "
	EXPLAIN (4,9)  = "                         "
	EXPLAIN (4,10) = "                         "
	EXPLAIN (4,11) = "                         "
	EXPLAIN (4,12) = "                         "
	EXPLAIN (4,13) = "                         "
	EXPLAIN (4,14) = "                         "

	EXPLAIN (5,1)  = "   This option allows you"
	EXPLAIN (5,2)  = " to run a psuedo-compiled"
	EXPLAIN (5,3)  = " (.INT) program.         "
	EXPLAIN (5,4)  = "                         "
	EXPLAIN (5,5)  = "                         "
	EXPLAIN (5,6)  = "                         "
	EXPLAIN (5,7)  = "                         "
	EXPLAIN (5,8)  = "                         "
	EXPLAIN (5,9)  = "                         "
	EXPLAIN (5,10) = "                         "
	EXPLAIN (5,11) = "                         "
	EXPLAIN (5,12) = "                         "
	EXPLAIN (5,13) = "                         "
	EXPLAIN (5,14) = "                         "

	EXPLAIN (6,1)  = "    This option compiles "
	EXPLAIN (6,2)  = " and runs a program.  If "
	EXPLAIN (6,3)  = " the compilation does not"
	EXPLAIN (6,4)  = " complete(due to errors),"
	EXPLAIN (6,5)  = " an attempt will still be"
	EXPLAIN (6,6)  = " made to run the INT file"
	EXPLAIN (6,7)  = " of the same name.       "
	EXPLAIN (6,8)  = "                         "
	EXPLAIN (6,9)  = "                         "
	EXPLAIN (6,10) = "                         "
	EXPLAIN (6,11) = "                         "
	EXPLAIN (6,12) = "                         "
	EXPLAIN (6,13) = "                         "
	EXPLAIN (6,14) = "                         "


REM ************************** PROCEDURES **************************


	PROCEDURE POSITION (X,Y=CHAR)
		PRINT ESC;'=';Y+31;X+31;
	END

	PROCEDURE CLEAR
		REM CLEAR VIDEO DISPLAY
		PRINT "     "
		PRINT CHR(1AH);
	END

	PROCEDURE PAUSE
		VAR X = CHAR
		INPUT3 "PLEASE PUSH ANY KEY TO CONTINUE.";X
	END

	PROCEDURE SET_ON (ATT=CHAR)
		PRINT ESC; 'B'; ATT;
	END

	PROCEDURE SET_OFF (ATT=CHAR)
		PRINT ESC; 'C'; ATT;
	END

	PROCEDURE PIXON (X1,Y1 = CHAR)
		PRINT ESC; '*'; Y1+31; X1+31;
	END

	PROCEDURE PIXOFF (X1,Y1 = CHAR)
		PRINT ESC; ' '; Y1+31; X1+31;
	END

	PROCEDURE LINEON (X1,Y1,X2,Y2 = CHAR)
		PRINT ESC; 'L'; Y1+31; X1+31; Y2+31; X2+31;
	END

	PROCEDURE LINEOFF (X1,Y1,X2,Y2 = CHAR)
		PRINT ESC; 'D'; Y1+31; X1+31; Y2+31; X2+31;
	END

	PROCEDURE RE_SET
		REM Set the vector pad back to normal.
		NEW_UP = 0BH
		NEW_DOWN = 0AH
		REM Restore the cursor.
		SET_ON CURSOR
	END

	FUNCTION KBHIT(ENTRY=CHAR)=INTEGER
		VAR AF, BC, DE, HL = INTEGER
		BC = 6
		DE = 0FFH
		CALL (BDOS,HL,DE,BC,AF)
		ENTRY = CHR(AF/256)
	END = AF/256

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

	PROCEDURE DUMP_NAMES(TYPE=STRING;GROUP=INTEGER)
		VAR COL = INTEGER
		VAR AF, BC, DE, HL = INTEGER
		BC = SETDMA
		LOCATION ARRAY DE = BUFFER_128
		CALL (BDOS,HL,DE,BC,AF)

		FOR J = 0 TO 11
			FCBUFF(J) = "?"
		NEXT J

		FOR J = 12 TO 31
			FCBUFF(J) = 00H
		NEXT J

		COL = 0
		PRINT
		LOCATION ARRAY DE = FCBUFF
		BC = SEARCH_FIRST
		CALL(BDOS,HL,DE,BC,AF)

		WHILE ( AF >= 0 ) DO BEGIN
			AF = AF / 256
			AF = AF * 32
			IF (BUFFER_128[AF] = CHR(GROUP)) AND \
				(BUFFER_128(AF+9)=MID(TYPE,1,1)) AND \
				(BUFFER_128(AF+10)=MID(TYPE,2,1)) AND \
				(BUFFER_128(AF+11)=MID(TYPE,3,1)) THEN BEGIN
				FOR J = (AF+1) TO (AF+11)
					PRINT BUFFER_128(J);
				NEXT J
				PRINT "   ";
				COL = COL + 1
				IF COL = 5 THEN BEGIN
					COL = 0
					PRINT
				END
			END

			LOCATION ARRAY DE = FCBUFF
			BC = SEARCH_NEXT
			CALL (BDOS,HL,DE,BC,AF)
		END
	END

	FUNCTION GET_FILE_NAME( TYPE=STRING )=INTEGER
		SET_ON CURSOR
		VAR RESULT,P,LENGTH = INTEGER
		CLEAR
		TEXT 0,%

         Name the file, following these rules:  
             a.  Use A: or B: or C: to indicate in which  drive the file
		 is located. If none is given, A: will be assumed.  
             b.  Give a file name of eight characters or less.  The first
                 character must be alphabetic.  Then either alphabetic or
                 numeric characters may be used.  
             c.  Type a period.  
             d.  Give a file type of three characters or less.  If you do
                 not give a file type, a default type may be supplied.  

             Example:  B:SMITH.MSS

         If you want to return to the main menu, press the ESCape key.  
         If you want to continue, enter the file name here ==>%;

		INPUT3 FILE_NAME
		IF RIGHT$(FILE_NAME,1)<>ESC AND LEN(FILE_NAME)<>0 THEN BEGIN
			IF MID(FILE_NAME,2,1)<>":" THEN FILE_NAME="A:"+FILE_NAME
			IF INSTR(1,"bBcC",LEFT$(FILE_NAME,1))=0 THEN 
				FILE_NAME="A"+RIGHT(FILE_NAME,2)
			ELSE FILE_NAME=XLATE(LEFT$(FILE_NAME,1),UP_CASE)+\
				RIGHT(FILE_NAME,2)
			REM At this point the drive name is adequate.
			REM Now we attend to the period.
 			P = INSTR(3,FILE_NAME,".")
			IF P = 3 THEN BEGIN
				FILE_NAME=LEFT$(FILE_NAME,2)+"$"+RIGHT(FILE_NAME,3)
				P = 4
				END
			LENGTH = LEN(FILE_NAME)
			IF ((P=0) OR (P>11)) THEN BEGIN
				IF LENGTH>10 THEN LENGTH=10
				FILE_NAME=LEFT$(FILE_NAME,LENGTH)+"."
				LENGTH = LENGTH + 1
				P = LENGTH
				END
			REM A period now exists in the 4th to 11th characters.
			REM Now the extent must be handled.
			IF ((P+3)>LENGTH) THEN FILE_NAME=LEFT$(FILE_NAME,P)+TYPE
			LENGTH = LEN(FILE_NAME) 
			REM Now replace certain special characters in
			REM between colon and period or in extent, and
			REM change all lowercase letters to uppercase.
			FILE_NAME=LEFT$(FILE_NAME,2)+\
				  XLATE(MID$(FILE_NAME,3,(P-3)),SPEC_CHAR)+\
				  "."+\
				  XLATE(RIGHT$(FILE_NAME,(LENGTH-P)),SPEC_CHAR)
			RESULT = TRUE
			END
		    ELSE BEGIN Set return false + clear esc sequence to video.
			RESULT = FALSE
			PRINT ' ';
			END
		SET_OFF CURSOR
	END = RESULT


	PROCEDURE GET_RESPONSE
		INPUT3 RESPONSE
		REPEAT BEGIN
			CASE RESPONSE OF
				UP_ARROW: IF L > 0 THEN BEGIN
					POSITION 2, L+6
					PRINT SCREEN[L]
					L = L - 1
					SET_ON INVERSE
					POSITION 2, L+6
					PRINT SCREEN[L]
					SET_OFF INVERSE
				END

				DOWN_ARROW: IF L < CHOICE_MAX THEN BEGIN
					POSITION 2, L+6
					PRINT SCREEN[L]
					L = L + 1
					SET_ON INVERSE
					POSITION 2, L+6
					PRINT SCREEN[L]
					SET_OFF INVERSE
				END

			END

			POSITION 4, 24
			IF L = 0 THEN PRINT MSG_0; ELSE PRINT MSG_1;

			K = 1	
			WHILE (NOT KBHIT(RESPONSE) AND (K<=XPL_MAX)) DO BEGIN
				POSITION 52, K+6
				PRINT EXPLAIN[L,K]
				K = K + 1
			END
		END
		UNTIL ((K>=XPL_MAX)OR(RESPONSE=ESC)OR((RESPONSE=RTN)AND(L>0)))
	END

	PROCEDURE DRAW_SCREEN
		VAR I = INTEGER
		ECHO OFF
		CLEAR

		REM Draw the outer border.
		LINEON 2,2,   159,2
		LINEON 2,2,   2,98
		LINEON 2,98,  159,98
		LINEON 159,2, 159,98

		REM Draw the inner lines.
		LINEON 2,19, 159,19
		LINEON 101,19, 101,91
		LINEON 2,91, 159,91

		POSITION 20, 3
		PRINT "	<< KAYPRO 10 CBASIC MENU >>"

		POSITION 4, 24
		PRINT MSG_0;

		POSITION 55,3
		PRINT VERSION_STRING;

		FOR I = 1 TO CHOICE_MAX
			POSITION 2, I+6
			PRINT SCREEN[I]
		NEXT I

		L = 0

		FOR K = 1 TO 14
			POSITION 52, K+6
			PRINT EXPLAIN[L,K]
		NEXT K
		SET_ON INVERSE
		POSITION 2, L+6
		PRINT SCREEN[L]
		SET_OFF INVERSE
	END



0MENU	REM MASTER MENU ENTRY POINT

	SET_OFF CURSOR

	DRAW_SCREEN

	REPEAT GET_RESPONSE
	UNTIL ( (RESPONSE = ESC) OR ((RESPONSE = RTN)AND(L>0)) )

	ECHO ON

	IF (RESPONSE = RTN) THEN BEGIN
		CASE L OF
		    1: BEGIN
			CLEAR
			PRINT "A4>D *.BAS"
			DUMP_NAMES "BAS",4
			PRINT
			PAUSE
			GOTO 0MENU
			END 
		    2: BEGIN
			CLEAR
			PRINT "A4>D *.INT"
			DUMP_NAMES "INT",4
			PRINT
			PAUSE
			GOTO 0MENU
			END
		    3: BEGIN
			IF NOT GET_FILE_NAME ("BAS") THEN GOTO 0MENU
			RE_SET
			CLEAR
			PRINT "A4>WS ";FILE_NAME
			COMMAND_LINE FILE_NAME,FILE_NAME,"WS.COM","CBMENU"
			END
		    4: BEGIN
			IF NOT GET_FILE_NAME ("BAS") THEN GOTO 0MENU
			RE_SET
			CLEAR
			PRINT "A4>CBAS2 ";FILE_NAME
			COMMAND_LINE FILE_NAME,FILE_NAME, "CBAS2.COM", "CBMENU"
			END
		    5: BEGIN
			IF NOT GET_FILE_NAME ("INT") THEN GOTO 0MENU
			RE_SET
			CLEAR
			PRINT "A4>CRUN2 ";LEFT$(FILE_NAME,(LEN(FILE_NAME)-4))
			COMMAND_LINE FILE_NAME,FILE_NAME,"CRUN2.COM","CBMENU"
			END
		    6: BEGIN
			IF NOT GET_FILE_NAME ("BAS") THEN GOTO 0MENU
			RE_SET
			CLEAR
			COMMAND_LINE FILE_NAME,FILE_NAME,"CANDR-C.COM", "CBMENU"
			END
		END
	END

	RE_SET
	CLEAR

TN) THEN BEGIN
		CASE L OF
		