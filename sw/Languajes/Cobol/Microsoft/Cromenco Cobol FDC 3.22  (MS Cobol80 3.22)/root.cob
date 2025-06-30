      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID.  ROOT.
       DATE-WRITTEN. OCTOBER,1978.
      *REMARKS.    THIS PROGRAM MAY BE CALLED FROM A COBOL PROGRAM
      *    TO CALCULATE THE SQUARE ROOT OF A NUMBER WITH PICTURE
      *    OF 9(9)V9(9).
      *    THE CALCULATIONS ARE BY THE NEWTON-RAPHSON METHOD.
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  CROMEMCO SYSTEM THREE.
       OBJECT-COMPUTER.  CROMEMCO SYSTEM THREE
                         MEMORY SIZE 65536 CHARACTERS.
      ***************
       DATA DIVISION.
      ***************
       WORKING-STORAGE SECTION.
       77  DIVIDE-FLAG                 PIC 9.
       77  ROOT                        PIC 9(9)V9(9)  COMP-3.
       77  TEST                        PIC 9(9)V9(9)  COMP-3.
       77  DIFFERENCE                  PIC 9(9)V9(9).
       01  WORK-AREA.
           05  WA-OPERAND              PIC 9(9)V9(9).
           05  WA-ROOT                 PIC 9(9)V9(9) COMP-3.
           05  WA-ITERATIONS           PIC 999       COMP-3.
           05  WA-ERROR-FLAG           PIC 9         COMP-3.
      *****************
       LINKAGE SECTION.
      *****************
       01  DATA-FROM-CALLING-PROGRAM.
           03  LS-OPERAND              PIC 9(9)V9(9).
           03  LS-ROOT                 PIC 9(9)V9(9)   COMP-3.
           03  LS-ITERATIONS           PIC 999         COMP-3.
           03  LS-ERROR-FLAG           PIC 9           COMP-3.
      *******************
       PROCEDURE DIVISION    USING DATA-FROM-CALLING-PROGRAM.
      *******************
       FIRST-PARAGRAPH.
           MOVE DATA-FROM-CALLING-PROGRAM TO WORK-AREA.
           MOVE 0 TO DIVIDE-FLAG.
           IF WA-OPERAND IS NOT NUMERIC
               MOVE 1 TO WA-ERROR-FLAG
               GO TO PREPARE-TO-RETURN.
           IF WA-OPERAND < 0
               MOVE 1 TO WA-ERROR-FLAG
               GO TO PREPARE-TO-RETURN.
           IF WA-OPERAND < 1 
               COMPUTE WA-OPERAND = WA-OPERAND * 10000
               MOVE 1 TO DIVIDE-FLAG.
           PERFORM COMPUTE-ROOT-1000.
           IF DIVIDE-FLAG NOT = 0
               COMPUTE WA-OPERAND = WA-OPERAND / 10000
               COMPUTE WA-ROOT = WA-ROOT / 100.
       PREPARE-TO-RETURN.
           MOVE WORK-AREA TO DATA-FROM-CALLING-PROGRAM.
       RETURN-NOW.
           EXIT PROGRAM.
      /
       COMPUTE-ROOT-1000               SECTION.
       INITIALIZE.
           MOVE 0 TO WA-ROOT, WA-ERROR-FLAG.
           MOVE 1 TO DIFFERENCE.
       BEGIN.
           DIVIDE WA-OPERAND BY 2 GIVING ROOT.
           PERFORM ITERATE VARYING WA-ITERATIONS FROM 0 BY 1
               UNTIL DIFFERENCE < .00001 OR WA-ITERATIONS = 999.
           MOVE ROOT TO WA-ROOT.
           GO TO END-SECTION.
       ITERATE.
           COMPUTE ROOT = (ROOT + WA-OPERAND / ROOT) / 2.
           COMPUTE TEST = ROOT * ROOT.
           COMPUTE TEST = TEST / WA-OPERAND.
           COMPUTE DIFFERENCE = 1 - TEST.
      * NOTE THAT THE ABOVE LINE PRODUCES THE ABSOLUTE VALUE
      * OF DIFFERENCE, SINCE THERE IS NO 'S' IN THE PICTURE
      * CLAUSE OF DIFFERENCE.
       END-SECTION.
           EXIT.
