       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       AUTHOR. PF/TR.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       OBJECT-COMPUTER. CPM.
       SPECIAL-NAMES. CONSOLE IS CRT.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
       PROCEDURE DIVISION.
       LA-START.
           DISPLAY "Hola".
           STOP RUN.
