10 'Program name--ETCH        7/24/82
20 'Cursor control exercise
30 '
40 PRINT CHR$(26);
50 FOR Z = 1 TO 5:PRINT:NEXT
60 PRINT "    ETCH-A-SCREEN"
70 PRINT "    by David Blair"
80 PRINT "    6/14/82"
90 PRINT
100 PRINT "    modified by"
110 PRINT "    Archie L. Abaire, Jr."
120 PRINT "    7/24/82"
130 GOSUB 970:' "to continue" instruction
140 PRINT CHR$(26);
150 PRINT "      Commands"
160 PRINT
170 PRINT " <shift> '!' exits to menu
180 PRINT " <esc> starts program over"
185 PRINT " <ctl> C exits to MBASIC
190 PRINT " <ctl> (most other keys) gives a graphic character"
195 PRINT " <shift> '";CHR$(34);"' to enter ASCII numbers (3 digits)"
200 PRINT
210 PRINT " All commands are via the numeric key pad"
220 PRINT " 1 moves cursor down and to the left"
230 PRINT " 2 moves cursor down"
240 PRINT " 3 moves cursor down and to the right"
250 PRINT " 4 moves cursor to the left"
260 PRINT " 5 is a switch that turns tracer off/on"
270 PRINT " 6 moves cursor right"
280 PRINT " 7 moves cursor up and to the left"
290 PRINT " 8 moves cursor up"
300 PRINT " 9 moves cursor up and to the right"
310 PRINT " 0 erases any character at cursor position"
320 PRINT
330 PRINT " x Any other character becomes tracer"
340 GOSUB 970
350 '
360 PRINT CHR$(26);
370 B$ = "X":' Set tracer character
380 IPEN% = -1:' Turn off tracer
390 X% = 58
400 Y% = 44
410 PRINT CHR$(27);"=";CHR$(Y%);CHR$(X%);
420 A$ = INPUT$(1)
430 IF A$ = CHR$(27) THEN 140
440 IF A$ = CHR$(33) THEN 1010
445 IF A$ = CHR$(34) THEN GOSUB 1030
450 IF A$ < "0" THEN B$ = A$:GOTO 780:' If not numeric, set tracer
460 IF A$ > "9" THEN B$ = A$:GOTO 780
470 '
480 ' Move cursor
490 IF A$ = "1" THEN XX% = -1
500 IF A$ = "1" THEN YY% = 1
510 IF A$ = "2" THEN XX% = 0
520 IF A$ = "2" THEN YY% = 1
530 IF A$ = "3" THEN XX% = 1
540 IF A$ = "3" THEN YY% = 1
550 IF A$ = "4" THEN XX% = -1
560 IF A$ = "4" THEN YY% = 0
570 IF A$ = "5" THEN IPEN% = -IPEN%:' Reverse tracer switch
580 IF A$ = "5" THEN XX% = 0:YY% = 0
590 IF A$ = "6" THEN XX% = 1
600 IF A$ = "6" THEN YY% = 0
610 IF A$ = "7" THEN XX% = -1
620 IF A$ = "7" THEN YY% = -1
630 IF A$ = "8" THEN XX% = 0
640 IF A$ = "8" THEN YY% = -1
650 IF A$ = "9" THEN XX% = 1
660 IF A$ = "9" THEN YY% = -1
670 '
680 X% = X% + XX%
690 Y% = Y% + YY%
700 XFLAG% = 0:YFLAG% = 0
710 IF X% > 81 OR X% < 33 THEN XFLAG% = 1:' Keep cursor on screen
720 IF Y% < 33 OR Y% > 54 THEN YFLAG% = 1
730 IF XFLAG% = 1 OR YFLAG% = 1 THEN XX% = -XX%:YY% = -YY% 
740 IF XFLAG% = 0 AND YFLAG% = 0 THEN 780
750 X% = X% + XX%:' Restore previous X% and Y% values
760 Y% = Y% + YY%
770 ''
780 PRINT
790 IF A$ <> "0" THEN 870
800 XX% = -XX%:YY% = -YY%
810 X% = X% + XX%
820 Y% = Y% + YY%
830 PRINT CHR$(27);"=";CHR$(Y%);CHR$(X%);" ";
840 PRINT CHR$(27);"=";CHR$(Y%);CHR$(X%);
850 GOTO 420
860 '
870 PRINT CHR$(27);"=";CHR$(Y%);CHR$(X%);
880 IF IPEN% = -1 THEN 420
890 PRINT CHR$(27);"g";
900 PRINT B$;
910 PRINT CHR$(27);"G";
920 PRINT CHR$(27);"=";CHR$(Y%);CHR$(X%);
930 GOTO 420
940 '
950 '
960 ' Subroutine "to continue"
970 PRINT CHR$(27);"=";CHR$(54);CHR$(32);
980 PRINT "Press any key to continue ";
990 Z$ = INPUT$(1)
1000 RETURN
1010 END
1020 ' Subroutine for special characters
1030 A$ = INPUT$(3)
1040 A$ = CHR$(VAL(A$))
1050 RETURN
