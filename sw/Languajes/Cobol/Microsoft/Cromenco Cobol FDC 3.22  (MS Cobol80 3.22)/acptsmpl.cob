       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCEPT-SAMPLE
       	       	   THIS PROGRAM ILLUSTRATES A FEW OF THE
       	       	   INTERACTIVE ACCEPT AND DISPLAY FEATURES
       	       	   AVAILABLE IN COBOL.
       AUTHOR. 	   CROMEMCO, INC.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  ALPHA-NUM-FIELD 	       PIC X(20).
       77  NUM-FIELD   	   	       PIC S9999V999.
       77  DONT-CARE   	   	       PIC X.
       77  FALSE       	   	       PIC 9 COMP VALUE 0.
       	   88  TRUE    	   	       VALUE 1.
       PROCEDURE DIVISION.
       START-P.
       	   PERFORM DEMONSTRATE UNTIL TRUE.
       	   STOP RUN.
       DEMONSTRATE.
       	   DISPLAY (1, 1) ERASE.
       	   DISPLAY (3, 5) 'ENTER ALPHANUMERIC DATA: '
       	   DISPLAY (8, 5) 'UPDATE THE EXISTING DATA: '
       	   DISPLAY (13, 5) 'ENTER NUMERIC DATA: '
       	   DISPLAY (18, 5) 'NOW UPDATE THIS DATA: '
       	   ACCEPT (3, 31) ALPHA-NUM-FIELD WITH PROMPT.
       	   ACCEPT (8, 31) ALPHA-NUM-FIELD WITH PROMPT
       	       	       	   	       	       UPDATE.
       	   ACCEPT (13, 31) NUM-FIELD WITH PROMPT
       	       	       	   	          TRAILING-SIGN.
       	   ACCEPT (18, 31) NUM-FIELD WITH PROMPT
       	       	       	   	          TRAILING-SIGN
       	       	       	   	       	  UPDATE.
       	   DISPLAY (24, 40) 'PRESS <CR> TO REPEAT '.
       	   ACCEPT (24, 61) DONT-CARE.
