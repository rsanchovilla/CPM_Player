      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID.    CALLROOT.
       AUTHOR.       CROMEMCO,INC.
       DATE-WRITTEN. OCTOBER, 1978.
      *REMARKS.    THIS PROGRAM ACCEPTS A NUMBER IN FREE-FIELD FORMAT,
      *    MOVES THOSE DIGITS TO THE LEFT OF THE DECIMAL DIGIT BY DIGIT
      *    TO A RIGHT JUSTIFIED FIELD, MOVES THOSE DIGITS TO THE RIGHT
      *    OF THE DECIMAL TO ANOTHER FIELD, AND PASSES THE RESULT TO A
      *    PROGRAM CALLED 'ROOT' WHICH CALCULATES AND RETURNS THE SQUARE
      *    ROOT OF THE NUMBER.
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. CROMEMCO SYSTEM THREE.
       OBJECT-COMPUTER. CROMEMCO SYSTEM THREE
                        MEMORY SIZE 65536 CHARACTERS.
      ***************
       DATA DIVISION.
      ***************
       WORKING-STORAGE SECTION.
       77  TEMP-IX                     USAGE INDEX.
       77  CHAR                        PIC X.
       77  COUNTER                     PIC 999  COMP-3.
       77  R-LEFT                      PIC Z(9).
       77  R-ROOT                      PIC Z(9).9(9).
       01  INPUT-AREAS.
           02  ALPHA-FIELD             PIC X(20).
           02  ALPHA-FIELD-CHAR        REDEFINES ALPHA-FIELD
                                       PIC X
                                       OCCURS 20 TIMES
                                       INDEXED BY ALPHA-IX.
           02  LEFT-PART               PIC X(9).
           02  LEFT-PART-CHAR          REDEFINES LEFT-PART
                                       PIC X
                                       OCCURS 9 TIMES
                                       INDEXED BY LEFT-IX.
           02  RIGHT-PART              PIC X(9).
           02  RIGHT-PART-CHAR         REDEFINES RIGHT-PART
                                       PIC X
                                       OCCURS 9 TIMES
                                       INDEXED BY RIGHT-IX.
       01  WORK-AREA.
           03  WA-OPERAND              PIC 9(9)V9(9).
           03  WA-R                    REDEFINES WA-OPERAND.
               05  WA-LEFT-PART        PIC 9(9).
               05  WA-RIGHT-PART       PIC 9(9).
           03  WA-ROOT                 PIC 9(9)V9(9)  COMP-3.
           03  WA-ITERATIONS           PIC 999        COMP-3.
           03  WA-ERROR-FLAG           PIC 9          COMP-3.
      ********************
       PROCEDURE DIVISION.
      ********************
       FIRST-PARAGRAPH.
           DISPLAY 'ENTER NUMBER WHOSE SQUARE ROOT YOU WISH COMPUTED'.
           DISPLAY 'NULL OR 0 ENTRY TERMINATES THE PROGRAM.'.
           PERFORM GET-NUMBER-1000.
           DISPLAY 'END OF JOB'.
           STOP RUN.
      /
       GET-NUMBER-1000                 SECTION.
       ACCEPT-NUMBER.
           MOVE SPACES TO ALPHA-FIELD.
           DISPLAY 'ENTER #'.
           ACCEPT ALPHA-FIELD.
       CHECK-VALIDITY.
      *
      *WE NOW CHECK FOR ANY INPUT ERRORS.
      *
           IF ALPHA-FIELD = SPACES
               GO TO END-SECTION-1000.
           MOVE 0 TO COUNTER.
           INSPECT ALPHA-FIELD
               TALLYING COUNTER FOR ALL "-".
           IF COUNTER NOT = 0
               PERFORM INPUT-ERROR
               GO TO ACCEPT-NUMBER.
           MOVE 0 TO COUNTER.
           INSPECT ALPHA-FIELD
               TALLYING COUNTER FOR ALL ".".
           IF COUNTER NOT < 2
               PERFORM INPUT-ERROR
               GO TO ACCEPT-NUMBER.
           MOVE ALL "0" TO LEFT-PART, RIGHT-PART.
           SET ALPHA-IX TO 1.
       DEBLANK.
      *
      *NOW WE SCAN TO THE FIRST NON-BLANK CHARACTER, SETTING
      *    ALPHA-IX TO POINT TO THIS CHARACTER.
      *    THIS IS DONE TO PERMIT THE NEXT PARAGRAPH TO SCAN
      *    FOR A DECIMAL POINT OR A SPACE DELIMITING THE
      *    DIGITS THAT LIE TO THE LEFT OF THE DECIMAL POINT.
      *
           IF ALPHA-IX > 20 GO TO INPUT-SCANNED.
           IF ALPHA-FIELD-CHAR(ALPHA-IX) = SPACE
               SET ALPHA-IX UP BY 1
               GO TO DEBLANK.
       SEARCH-TO-POINT-OR-BLANK.
      *
      *THIS PARAGRAPH SCANS TO A DECIMAL POINT, A SPACE, OR THE LIMIT
      *    OF THE INPUT FIELD.  THIS IS DONE TO GIVE THE NEXT
      *    PARAGRAPH A STARTING POINT FOR THE RIGHT-TO-LEFT CHARACTER
      *    BY CHARACTER MOVE.
      *
           IF ALPHA-FIELD-CHAR(ALPHA-IX) IS NUMERIC
               SET ALPHA-IX UP BY 1
               IF ALPHA-IX > 20
                   NEXT SENTENCE
               ELSE
                   GO TO SEARCH-TO-POINT-OR-BLANK.
           SET TEMP-IX TO ALPHA-IX.
           SET LEFT-IX TO 9.
           SET ALPHA-IX DOWN BY 1.
           IF ALPHA-IX < 1 GO TO START-RIGHT.
       FILL-LEFT-PART-FROM-THE-RIGHT.
      *
      *NOW WE MOVE THE CHARACTERS ONE BY ONE TO THE FIELD LEFT-PART
      *    STARTING AT THE LEAST SIGNIFICANT CHARACTER AND FILLING
      *    TO THE LEFT UNTIL LEFT-PART IS FILLED, OR THE INPUT
      *    IS EXHAUSTED.
      *
           MOVE ALPHA-FIELD-CHAR(ALPHA-IX) TO CHAR.
           IF CHAR NOT = SPACE
               MOVE CHAR TO LEFT-PART-CHAR(LEFT-IX)
               SET LEFT-IX ALPHA-IX DOWN BY 1
               IF ALPHA-IX NOT < 1 AND LEFT-IX NOT < 1
                   GO TO FILL-LEFT-PART-FROM-THE-RIGHT.
       START-RIGHT.
           SET RIGHT-IX TO 1.
           SET ALPHA-IX TO TEMP-IX.
           SET ALPHA-IX UP BY 1.
       FILL-RIGHT-PART.
      *
      *NOW RIGHT-PART IS FILLED FROM THAT PART OF THE INPUT THAT
      *    IS TO THE RIGHT OF THE DECIMAL POINT.  THE PROCESS
      *    ENDS WHEN RIGHT-PART IS FILLED OR THE INPUT FIELD IS
      *    EXHAUSTED.
      *
           IF ALPHA-IX > 20 GO TO INPUT-SCANNED.
           MOVE ALPHA-FIELD-CHAR(ALPHA-IX) TO CHAR.
           IF CHAR NOT = SPACE
               MOVE CHAR TO RIGHT-PART-CHAR(RIGHT-IX)
               SET RIGHT-IX, ALPHA-IX UP BY 1
               IF RIGHT-IX NOT > 9
                   GO TO FILL-RIGHT-PART.
       INPUT-SCANNED.
           IF LEFT-PART = ALL "0" AND RIGHT-PART = ALL "0"
               GO TO END-SECTION-1000.
           IF LEFT-PART NOT NUMERIC OR RIGHT-PART NOT NUMERIC
               PERFORM INPUT-ERROR
               GO TO ACCEPT-NUMBER.
           MOVE LEFT-PART TO WA-LEFT-PART.
           MOVE RIGHT-PART TO WA-RIGHT-PART.
       SUBPROGRAM-CALL.
      *
      *'ROOT', THE PROGRAM REFERENCED IN THE FOLLOWING CALL, HAS
      *    BEEN COMPILED SEPARATELY TO PRODUCE CODE WHICH CALCULATES
      *    THE SQUARE ROOT OF A NUMBER.  THIS CODE HAS THEN BEEN
      *    LINKED INTO THE STREAM OF CODE RESULTING FROM COMPILING
      *    THIS PROGRAM.
      *
           CALL 'ROOT' USING WORK-AREA.
           MOVE WA-LEFT-PART TO R-LEFT.
           MOVE WA-ROOT TO R-ROOT.
           DISPLAY 'THE SQUARE ROOT OF ' R-LEFT,
                                         '.',
                                         WA-RIGHT-PART,
                                         ' IS ',
                                         R-ROOT.
           DISPLAY 'ITERATIONS = ', WA-ITERATIONS.
           GO TO ACCEPT-NUMBER.
       INPUT-ERROR.
           DISPLAY 'INVALID NUMBER'.
       END-SECTION-1000.
           EXIT.
