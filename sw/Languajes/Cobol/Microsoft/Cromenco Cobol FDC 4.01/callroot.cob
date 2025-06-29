       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALLROOT

       	       	   COBOL VERSION 04.01

       	       	   THIS PROGRAM ACCEPTS A NUMBER USING THE
       	       	   FORMAT 3 ACCEPT AND DISPLAY CAPABILITIES
       	       	   AND PASSES IT TO A SUBPROGRAM CALLED 'ROOT.COM'
       	       	   WHICH CALCULATES AND RETURNS THE SQUARE ROOT
       	       	   OF THE NUMBER.

       AUTHOR.       CROMEMCO,INC.
       INSTALLATION. SOFTWARE DEVELOPMENT.
       DATE-WRITTEN. SEPTEMBER 1980.
       DATE-COMPILED. SEPTEMBER 1980.
       SECURITY.     NONE.

      *---------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. CROMEMCO SYSTEM THREE.
       OBJECT-COMPUTER. CROMEMCO SYSTEM THREE
                        MEMORY SIZE 65536 CHARACTERS.

      *--------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  D-ROOT  		       PIC ZZZ,ZZZ,ZZZ.9(7).
       77  NUM 	   		       PIC 9(9)V9(7).
       77  ROOT	   		       PIC 9(9)V9(7) COMP-3.

      *-------------------
       PROCEDURE DIVISION.
       FIRST-PARAGRAPH.
       	   DISPLAY (1, 1) ERASE
       	           (2, 10) 'This program calculates square roots'.
       	   MOVE 1 TO NUM.
       	   PERFORM DEMONSTRATION UNTIL NUM = 0.
           DISPLAY (8, 1) 'End of demonstration'.
           DISPLAY ' '.
       	   STOP RUN.

       DEMONSTRATION.
       	   DISPLAY (5, 1) 'Enter number (a 0 entry ends the program): '
       	   ACCEPT (, ) NUM WITH PROMPT.
       	   IF NUM NOT = 0
               DISPLAY (7, 1) ERASE 'Calculating...'
       	       CALL 'ROOT' USING NUM, ROOT
       	       MOVE ROOT TO D-ROOT
       	       DISPLAY (7, 1) ERASE 'The square root is: '
                       (, )    D-ROOT.
