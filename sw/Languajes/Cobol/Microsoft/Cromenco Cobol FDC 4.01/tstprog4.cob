        IDENTIFICATION DIVISION.
        PROGRAM-ID. TSTPROG4.
        DATA DIVISION.
        WORKING-STORAGE SECTION. 
        77  A                 PIC 99 VALUE 0.
        PROCEDURE DIVISION.
        BEGIN.       
            IF A = 10 GO TO ENDING.
            DISPLAY A.
            ADD 1 TO A.
            GO TO BEGIN.
        ENDING.
            STOP RUN.
