000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID. STOCK-FILE-SET-UP.
000030 AUTHOR. MICRO FOCUS LTD.
000040 ENVIRONMENT DIVISION.
000050 CONFIGURATION SECTION.
000060 SOURCE-COMPUTER. 
000070 OBJECT-COMPUTER. 
000075 SPECIAL-NAMES. CONSOLE IS CRT.
000080 INPUT-OUTPUT SECTION.
000090 FILE-CONTROL.
000100     SELECT STOCK-FILE ASSIGN "STOCK.IT"
000110     ORGANIZATION INDEXED
000120     ACCESS DYNAMIC
000130     RECORD KEY STOCK-CODE.
000140 DATA DIVISION.
000150 FILE SECTION.
000160 FD  STOCK-FILE; RECORD 32.
000170 01  STOCK-ITEM.
000180     02  STOCK-CODE PIC X(4).
000190     02  PRODUCT-DESC PIC X(20).
000200     02  UNIT-SIZE PIC 9(4).
000210 WORKING-STORAGE SECTION.
000220 01  SCREEN-HEADINGS.
000230     02  ASK-CODE PIC X(21) VALUE "STOCK CODE     <    >".
000240     02  FILLER PIC X(59).
000250     02  ASK-DESC PIC X(16) VALUE "DESCRIPTION    <".
000260     02  SI-DESC PIC X(21) VALUE "                    >".
000270     02  FILLER PIC X(43).
000280     02  ASK-SIZE PIC X(21) VALUE "UNIT SIZE      <    >".
000290  01  ENTER-IT REDEFINES SCREEN-HEADINGS.
000300     02  FILLER PIC X(16).
000310     02  CRT-STOCK-CODE PIC X(4).
000320     02  FILLER PIC X(76).
000330     02  CRT-PROD-DESC PIC X(20).
000340     02  FILLER PIC X(60).
000350     02  CRT-UNIT-SIZE PIC 9(4).
000360     02  FILLER PIC X.
000370 PROCEDURE DIVISION.
000380 SR1.
000390     DISPLAY SPACE.
000400     OPEN I-O STOCK-FILE.
000410     DISPLAY SCREEN-HEADINGS.
000420 NORMAL-INPUT.
000430     MOVE SPACE TO ENTER-IT.
000440     DISPLAY ENTER-IT.
000450 CORRECT-ERROR.
000460     ACCEPT ENTER-IT.
000470     IF CRT-STOCK-CODE = SPACE GO TO END-IT.
000480     IF CRT-UNIT-SIZE NOT NUMERIC GO TO CORRECT-ERROR.
000490     MOVE CRT-PROD-DESC TO PRODUCT-DESC.
000500     MOVE CRT-UNIT-SIZE TO UNIT-SIZE.
000510     MOVE CRT-STOCK-CODE TO STOCK-CODE.
000520     WRITE STOCK-ITEM; INVALID GO TO CORRECT-ERROR.
000530     GO TO NORMAL-INPUT.
000540 END-IT.
000550     CLOSE STOCK-FILE.
000560     DISPLAY SPACE.
000570     DISPLAY "END OF PROGRAM".
000580     STOP RUN.
