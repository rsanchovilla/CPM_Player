
COMMENT

	*********************************************************
	*							*
	*	Backup menu program for Kaypro 10.		*
	*							*
	*	By R. Schrader					*
	*							*
	*	Copyright (C) 1983 by Non-Linear Systems, Inc   *
	*	No warranty is made, expressed, or implied.	*
	*							*
	*********************************************************

END
	FILES R(128)
 	$LINES

	VAR CREDIT_STRING = STRING
	CREDIT_STRING = "     WRITTEN BY ROBERT SCHRADER     "

	VAR VERSION_STRING = STRING
	VERSION_STRING = "Version 2.1"

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
	UP_ARROW = 0BH
	DOWN_ARROW = 0AH
	BACK_SPACE = 8
	N_STR = ""
	VAR BDOS = INTEGER
	BDOS = 5
	

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
	VAR CALLING_INT = INTEGER
	VAR CALLING_USER = STRING

	VAR XPL_MAX = INTEGER
	XPL_MAX = 14

	VAR CHOICE_MAX = INTEGER
	CHOICE_MAX = 6

	REM Image for printing menu on screen.
	DIM STRING:49; SCREEN(20)
	SCREEN (0) = "                                                 "
	SCREEN (1) = "     Select user groups                          "
	SCREEN (2) = "     List files                                  "
	SCREEN (3) = "     Run BACKUP program                          "
	SCREEN (4) = "     Run RESTORATION program                     "
	SCREEN (5) = "     Look at backup files                        "
	SCREEN (6) = "     Instructions                                "


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

	EXPLAIN (1,1)  = "       This option allows"
	EXPLAIN (1,2)  = " you to select the user  "
	EXPLAIN (1,3)  = " group that you want to  "
	EXPLAIN (1,4)  = " backup.                 "
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
	EXPLAIN (2,2)  = " you all of the files in "
	EXPLAIN (2,3)  = " this user group on the  "
	EXPLAIN (2,4)  = " currently logged disk.  "
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

	EXPLAIN (3,1)  = "    This option will copy"
	EXPLAIN (3,2)  = " files from a given user "
	EXPLAIN (3,3)  = " area to one or more     "
	EXPLAIN (3,4)  = " floppy disks. Be sure to"
	EXPLAIN (3,5)  = " have several formatted  "
	EXPLAIN (3,6)  = " disks available with the"
	EXPLAIN (3,7)  = " write-protect notches   "
	EXPLAIN (3,8)  = " uncovered.              "
	EXPLAIN (3,9)  = "   It is recommended that"
	EXPLAIN (3,10) = " the user read the docu- "
	EXPLAIN (3,11) = " mentation on 'MUFBAR'   "
	EXPLAIN (3,12) = " before selecting this   "
	EXPLAIN (3,13) = " option.                 "
	EXPLAIN (3,14) = "                         "

	EXPLAIN (4,1)  = "    This option will re- "
	EXPLAIN (4,2)  = " store files from disks  "
	EXPLAIN (4,3)  = " created by the backup   "
	EXPLAIN (4,4)  = " option. It expects the  "
	EXPLAIN (4,5)  = " files to be restored to "
	EXPLAIN (4,6)  = " be on a floppy in drive "
	EXPLAIN (4,7)  = " C, and it will copy them"
	EXPLAIN (4,8)  = " back to drive A."
	EXPLAIN (4,9)  = "                         "
	EXPLAIN (4,10) = "                         "
	EXPLAIN (4,11) = "                         "
	EXPLAIN (4,12) = "                         "
	EXPLAIN (4,13) = "                         "
	EXPLAIN (4,14) = "                         "

	EXPLAIN (5,1)  = "   This option will list "
	EXPLAIN (5,2)  = " all the files on your   "
	EXPLAIN (5,3)  = " backup disk.            "
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

	EXPLAIN (6,1)  = "   This option provides  "
	EXPLAIN (6,2)  = " some instructions for   "
	EXPLAIN (6,3)  = " the use of the backup   "
	EXPLAIN (6,4)  = " programs.  It, however, "
	EXPLAIN (6,5)  = " is not intended as a    "
	EXPLAIN (6,6)  = " substitute for reading  "
	EXPLAIN (6,7)  = " the documentation.      "
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


	PROCEDURE CHANGE_TO_USER (NEW_USER=INTEGER)
		BASED CURRENT_USER = BYTE
		BASE CURRENT_USER AT 04H
		CURRENT_USER = NEW_USER * 16

		VAR HL, DE, BC, AF = INTEGER
		BC = 20H
		DE = NEW_USER 
		CALL (BDOS, HL, DE, BC, AF)

		CLEAR
	END


	PROCEDURE FIND_CALLING_USER 
		BASED CURRENT_USER = BYTE
		BASE CURRENT_USER AT 04H
		CALLING_INT = CURRENT_USER/16
		IF (CURRENT_USER/16 < 9) \
			THEN CALLING_USER = CHR(48+CURRENT_USER/16)
			ELSE CALLING_USER = "1"+CHR(38+CURRENT_USER/16)
	END

	FUNCTION KBHIT=INTEGER
		VAR M = INTEGER
		VAR B = CHAR
		INPUT3 #5; RESPONSE
		IF RESPONSE = 0 THEN M = 0
				ELSE M = -1
	END = M

	FUNCTION COMMAND_LINE_USER = INTEGER
		VAR U = INTEGER
		BASED S = STRING
		BASE S AT 80H
		U = 0
		IF LEN(S) = 2 THEN U = ASC(MID(S,2,1))-48
		IF LEN(S) = 3 THEN U = ASC(MID(S,3,1))-38
	END = U

	PROCEDURE BUILD_SUB_FILE(NAME1,NAME2=STRING;G=INTEGER)
		IF G < 10 THEN NAME2 = NAME2 + ' ' + CHR(G+48)
			  ELSE NAME2 = NAME2 + " 1" + CHR(G+38)
		CREATE "$$$.SUB"
		OPEN #0;"$$$.SUB"
		VAR ADDR, REC = INTEGER
		LOCATION FILE ADDR = #0
		BASED LINE = STRING
		BASE LINE AT ADDR
		ON ERROR GOTO 0END
		REC = 0
		WHILE(1) DO BEGIN
			READ #0,REC
			REC = REC + 1
			END

0END		ON ERROR OFF
		POKE ADDR, LEN(NAME2)
		LINE = NAME2
		POKE ADDR + LEN(NAME2) + 1, 0
		WRITE #0,REC

		POKE ADDR, LEN(NAME1)
		LINE = NAME1
		POKE ADDR + LEN(NAME1) + 1, 0
		WRITE #0,REC+1

		CLOSE #0
		STOP
	END



	PROCEDURE DUMP_NAMES(GROUP=INTEGER)
		VAR M = INTEGER
		REM This is a modified version of dump_names.
		REM It prints files of all extents.
		VAR COL = INTEGER
		VAR AF, BC, DE, HL = INTEGER
		BC = SETDMA
		LOCATION ARRAY DE = BUFFER_128
		CALL (BDOS,HL,DE,BC,AF)

		FOR M = 0 TO 11
			FCBUFF(M) = "?"
		NEXT M

		FOR M = 12 TO 31
			FCBUFF(M) = 00H
		NEXT M

		COL = 0
		PRINT
		LOCATION ARRAY DE = FCBUFF
		BC = SEARCH_FIRST
		CALL(BDOS,HL,DE,BC,AF)

		WHILE ( AF >= 0 ) DO BEGIN
			AF = AF / 256
			AF = AF * 32
			IF (BUFFER_128[AF] = CHR(GROUP)) THEN BEGIN
				FOR M = (AF+1) TO (AF+11)
					PRINT BUFFER_128(M);
				NEXT M
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
			WHILE ( (NOT KBHIT) AND (K<=XPL_MAX) ) DO BEGIN
				POSITION 52, K+6
				PRINT EXPLAIN[L,K]
				K = K + 1
			END
		END
		UNTIL (RESPONSE=ESC)OR((RESPONSE=RTN)AND(L>0))
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
		PRINT "	<< KAYPRO 10 BACKUP MENU >>"

		POSITION 4, 24
		PRINT MSG_0;

		POSITION 55,3
		PRINT VERSION_STRING;

		POSITION 7,20
		PRINT "                              ";
		POSITION 7,20
		PRINT "CURRENTLY IN USER #";J;

		POSITION 7,21
		PRINT "                                   ";
		POSITION 7,21 
		CASE J OF 
			0: PRINT "System and utilities"
			1: PRINT "Word processing"
			2: PRINT "Spreadsheet"
			3: PRINT "MBasic"
			4: PRINT "C-Basic"
			5: PRINT "S-Basic"
			6: PRINT "Telecommunications"
		END

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

REM *****************************************************


	J = COMMAND_LINE_USER
	CHANGE_TO_USER J


0MENU	REM MASTER MENU ENTRY POINT

	SET_OFF CURSOR

	DRAW_SCREEN

	GET_RESPONSE

	ECHO OFF

	IF (RESPONSE = RTN) THEN BEGIN
		CASE L OF
		    1: BEGIN
			ECHO ON
			SET_ON CURSOR
			REPEAT
				BEGIN
				CLEAR
				POSITION 5,5
				PRINT "WHAT USER GROUP DO YOU WISH TO USE"
				POSITION 5,6
				PRINT " THIS PROGRAM IN (0 - 15)";
				INPUT J
				END
			UNTIL ((J>=0) AND (J<=15))
			SET_OFF CURSOR
			ECHO OFF
			CHANGE_TO_USER J
			GOTO 0MENU
			END
		    2: BEGIN
			CLEAR
			PRINT "A";J;">D *.*"
			DUMP_NAMES J
			PRINT
			PAUSE
			GOTO 0MENU
			END 
		    3: BEGIN
			CLEAR
			SET_ON CURSOR
			BUILD_SUB_FILE "MUFBACK","BKMENU",J
			END
		    4: BEGIN
			CLEAR
			SET_ON CURSOR
			BUILD_SUB_FILE "MUFREST","BKMENU",J
			END
		    5: BEGIN
			CLEAR
			SET_ON CURSOR
			BUILD_SUB_FILE "MUFLOOK","BKMENU",J
			END
		    6: BEGIN
			CLEAR
			SET_ON CURSOR
			BUILD_SUB_FILE "MUFDESC","BKMENU",J
			END
		END
	END

	CHANGE_TO_USER 0
	SET_ON CURSOR
	CLEAR

