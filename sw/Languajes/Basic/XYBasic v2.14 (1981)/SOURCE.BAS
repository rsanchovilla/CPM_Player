10 'XYSOURCE.BAS 11/12/81
20 'CP/M SDISK XYBASIC program to purge conditionals from source
30 CLEAR 10000
40 CLEAR @3
50 PRINT "XYBASIC source conditional purging program"
60 PRINT "Source files on A:, destination on B:"
70 DEF INT A-Z
80 DEF STR S
90 DIM SRESP(100), RESP(100)  'responses to prompts and answers
100 NRESP = 0 'number of responses so far
110 S1 = CHR$(9)+"if"+CHR$(9)
120 S2 = CHR$(9)+"IF"+CHR$(9)
130 S3 = CHR$(9)+"else"
140 S4 = CHR$(9)+"ELSE"
150 S5 = CHR$(9)+"endif"
160 S6 = CHR$(9)+"ENDIF"
170 MAXLEVEL = 10  'maximum depth of conditional nesting
180 DIM LSTAT (MAXLEVEL)  'status of each nested conditional
190 'LSTAT is -1 to kill, 0 for indeterminate, 1 to leave
200 INPUT "Language filename" LANG$
210 LEVEL = 0  'current level of conditional nesting
220 LSTAT (0) = 0  'status of current level
230 INPUT "Source filename" SFILE$
240 DFILE$ = "b:"+SFILE$
250 OPEN I, @1, SFILE$
260 OPEN O, @2, DFILE$
270 MARGIN @2, 155
280 FOR I = 1 TO 5
290 LINPUT @1, L$  'read a header line
300 PRINT LEVEL; "+ "; L$
310 PRINT @2, L$
320 NEXT I
330 OPEN I, @3, LANG$
340 LINPUT @3, L$
350 PRINTLEVEL; "> "; L$
360 PRINT@2, L$
370 IF NOT EOF(3) THEN GOTO 340
380 CLOSE @3
390 LINPUT @1, L$ 'read a source file line
400 'scan source line for IF, ELSE, ENDIF
410 IF INSTR(L$,S1) THEN I=INSTR(L$,S1) : GOTO 540
420 IF INSTR(L$,S2) THEN I=INSTR(L$,S2) : GOTO 540
430 IF INSTR(L$,S3) THEN GOTO 790
440 IF INSTR(L$,S4) THEN GOTO 790
450 IF INSTR (L$,S5) THEN  GOTO 860
460 IF INSTR (L$,S6) THEN GOTO 860
470 IF LSTAT(LEVEL) <0 THEN PRINT LEVEL; "O ";L$ : GOTO 500
480 PRINT LEVEL; "+ ";L$
490 PRINT @2, L$ 'and write to destination
500 IF NOT EOF(1) THEN GOTO 390
510 IF LEVEL <> 0 THEN PRINT "Error:  eof at level "; LEVEL : STOP
520 CLOSE
530 GOTO 210
540 'IF seen in current line
550 IF I=1 THEN GOTO 620
560 'IF occurred after label, so print the label first
570 IF LSTAT(LEVEL) < 0 THEN PRINTLEVEL; "O "; LEFT$(L$, I-1) : GOTO 600
580 PRINTLEVEL; "+ "; LEFT$(L$, I-1)
590 PRINT @2, LEFT$(L$, I-1)
600 L$ = MID$(L$,I) 'remove label from l$
610 I = 1 'and update position of i
620 LEVEL = LEVEL + 1
630 IF LSTAT(LEVEL-1) < 0 THEN LSTAT(LEVEL) = LSTAT (LEVEL-1) - 1 : GOTO 470
640 'must determine whether conditional has been seen before
650 LCND$ = MID$ (L$, I+4)
660 'strip off comments if found
670 IF INSTR(LCND$,CHR$(9)) THEN LCND$=LEFT$(LCND$,INSTR(LCND$,CHR$(9))-1)
680 FOR J = 1 TO NRESP
690 IF SRESP(J) = LCND$ THEN LSTAT(LEVEL) = RESP(J) : GOTO 760
700 NEXT J
710 PRINT "IF found: "; LCND$
720 INPUT "Type -1, 0, 1 for False, Indeterminate, True" LSTAT(LEVEL)
730 NRESP = NRESP+1
740 SRESP (NRESP) = LCND$
750 RESP (NRESP) = LSTAT (LEVEL)
760 IF LSTAT(LEVEL) <> 1 THEN GOTO 470
770 PRINT LEVEL; "O "; L$
780 GOTO 390
790 'ELSE seen
800 IF LEVEL = 0 THEN PRINT "Error:  ELSE at level 0" : STOP
810 IF LSTAT(LEVEL) < -1 THEN GOTO 470 'inside a false condition, else goes too
820 IF LSTAT(LEVEL) = 0 THEN GOTO 470 'inside indeterminate, remain so
830 PRINT LEVEL; "O "; L$
840 LSTAT(LEVEL) = -LSTAT (LEVEL) 'reverse status inside elsepart
850 GOTO 390
860 'ENDIF seen
870 IF LEVEL=0 THEN PRINT "Error:  ENDIF at level 0" : STOP
880 LEVEL = LEVEL - 1
890 IF LSTAT (LEVEL+1) = 0 THEN GOTO 480
900 PRINT LEVEL; "O "; L$
910 GOTO 390
920 FOR I = 1 TO NRESP
930 PRINTRESP(I); SRESP(I)
940 NEXT
