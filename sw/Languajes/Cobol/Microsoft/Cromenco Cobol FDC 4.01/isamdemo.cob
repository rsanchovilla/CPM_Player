       IDENTIFICATION DIVISION.
       PROGRAM-ID. ISAMDEMO

       	       	   COBOL VERSION 04.01

       	       	   THIS PROGRAM DEMONSTRATES THE USE OF AN ISAM
       	       	   FILE IN A CROMEMCO COBOL PROGRAM.

      *---------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       	   SELECT DISK-FILE ASSIGN DISK
                            ORGANIZATION IS INDEXED
                            ACCESS DYNAMIC
                            RECORD KEY IS DKEY
                            FILE STATUS IS DSTATUS.

      *--------------
       DATA DIVISION.

       FILE SECTION.
       FD  DISK-FILE   LABEL RECORD IS STANDARD
                       VALUE OF FILE-ID IS "ISAMDEMO.DAT".
       01  DREC.
       	   03  DKEY.
       	       05  LAST-NAME	       PIC X(20).
       	       05  FIRST-NAME	       PIC X(15).
       	   03  ADDRESS 		       PIC X(40).

       WORKING-STORAGE SECTION.
       77  DSTATUS     		       PIC XX.
       
       SCREEN SECTION.
       01  PROG-DETAILS.
       	   03  BLANK SCREEN.
       	   03  LINE 1 "This program will ask the user to enter several".
       	   03  LINE 2 "names and addresses in any order, while writing".
       	   03  LINE 3 "the data to an ISAM file using the DYNAMIC".
       	   03  LINE 4 "ACCESS mode.  The program will then read the".
       	   03  LINE 5 "names and addresses back in alphabetical order.".

       01  NAME-DATA.
       	   03  LINE 7 COLUMN 1
       	       "Enter last name:  ".
       	   03  BLANK LINE PIC X(20) USING LAST-NAME.
       	   03  LINE 8 COLUMN 1
       	       "Enter first name: ".
       	   03  BLANK LINE PIC X(15) USING FIRST-NAME.
       	   03  LINE 9 COLUMN 1
       	       "Enter address (or all spaces to start reading):    ".
       	   03  LINE 10 COLUMN 18 BLANK LINE PIC X(40) USING ADDRESS.

       01  HEADING.
       	   03  LINE 12 COLUMN 1 "Last".
       	   03  COLUMN 21 "First".
       	   03  COLUMN 36 "Address".
       	   03  LINE 14 COLUMN 1.

      *-------------------
       PROCEDURE DIVISION.
       START-P.
       	   DISPLAY PROG-DETAILS.

       	   OPEN OUTPUT DISK-FILE.
           MOVE SPACES TO DREC.
           MOVE "A" TO ADDRESS.
       	   PERFORM ACCEPT-DATA UNTIL ADDRESS = ALL SPACES.
       	   CLOSE DISK-FILE.

       	   OPEN INPUT DISK-FILE.
       	   DISPLAY HEADING.
       	   MOVE "00" TO DSTATUS.
       	   PERFORM READ-AND-DISPLAY UNTIL DSTATUS NOT = "00".
       	   CLOSE DISK-FILE.

       	   DISPLAY "All records read and displayed".
       	   STOP RUN.

       ACCEPT-DATA SECTION.
       AD1.
           DISPLAY NAME-DATA.
       	   ACCEPT NAME-DATA.
           IF ADDRESS = SPACES GO TO AD2.
       	   WRITE DREC
       	       INVALID KEY
       	       	   DISPLAY (24, 1) ERASE
                                   "Invalid key on write, I/O status: "
                                   DSTATUS
       	       	   STOP RUN.
       AD2.
           EXIT.

       READ-AND-DISPLAY SECTION.
       RAD1.
       	   READ DISK-FILE NEXT.
           IF DSTATUS = "00"
               DISPLAY DREC.
