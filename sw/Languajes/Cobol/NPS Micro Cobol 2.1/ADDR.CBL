IDENTIFICATION DIVISION.
PROGRAM-ID.
    ADDRESS-FILE.
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. Z80.
OBJECT-COMPUTER. Z80.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT ADDR-FILE ASSIGN ADDR.FIL.
    SELECT NADDR-FILE ASSIGN NADDR.FIL.
DATA DIVISION.
FILE SECTION.
FD ADDR-FILE.
01 ADDR-RECORD.
  02 NAME PIC X(30).
  02 SCHOOL PIC X(30).
  02 ADDRESS PIC X(30).
  02 CITY PIC X(15).
  02 STATE PIC X(5).
  02 ZIP PIC X(5).

FD NADDR-FILE.
01 NADDR-RECORD.
  02 NNAME     PIC X(30).
  02 NSCHOOL   PIC X(30).
  02 NADDRESS  PIC X(30).
  02 NCITY     PIC X(15).
  02 NSTATE    PIC X(5).
  02 NZIP      PIC X(5).
WORKING-STORAGE SECTION.
01 END-OF-FILE PIC X VALUE 'F'.
01 NAMES-CONT PIC X VALUE 'Y'.
PROCEDURE DIVISION.
MAIN-PARA.
   OPEN INPUT ADDR-FILE.
   OPEN OUTPUT NADDR-FILE.
   READ ADDR-FILE END MOVE 'T' TO END-OF-FILE.
   PERFORM READ-OLD-FILE UNTIL END-OF-FILE EQUAL 'T'.
   PERFORM ADD-NEW-NAMES UNTIL NAMES-CONT EQUAL 'N'.
   CLOSE ADDR-FILE.
   CLOSE NADDR-FILE.
   STOP RUN.

READ-OLD-FILE.
   MOVE ADDR-RECORD TO NADDR-RECORD.
   WRITE NADDR-RECORD.
   READ ADDR-FILE END MOVE 'T' TO END-OF-FILE.

ADD-NEW-NAMES.
   DISPLAY 'INPUT NEW NAME'.
   ACCEPT NNAME.
   DISPLAY 'INPUT NEW SCHOOL'.
   ACCEPT NSCHOOL.
   DISPLAY 'INPUT ADDRESS'.
   ACCEPT NADDRESS.
   DISPLAY 'INPUT CITY'.
   ACCEPT NCITY.
   DISPLAY 'INPUT STATE'.
   ACCEPT NSTATE.
   DISPLAY 'INPUT ZIP'.
   ACCEPT NZIP.
   WRITE NADDR-RECORD.
   DISPLAY 'TO CONTINUE TYPE Y ELSE TYPE N'.
   ACCEPT NAMES-CONT.
