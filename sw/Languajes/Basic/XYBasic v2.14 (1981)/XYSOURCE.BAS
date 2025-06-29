10 'XYSOURCE.BAS 11/11/81
20 'CP/M SDISK XYBASIC program to purge conditionals from source
30 CLEAR 10000
40 PRINT "XYBASIC source conditional purging program"
50 PRINT "Source files on A:, destination on B:"
60 DEF INT A-Z
70 DEF STR S
80 DIM SRESP(100), RESP(100)  'responses to prompts and answers
90 NRESP = 0 'number of responses so far
100 S1 = CHR$(9)+"if"+CHR$(9)
110 S2 = CHR$(9)+"IF"+CHR$(9)
120 S3 = CHR$(9)+"else"
130 S4 = CHR$(9)+"ELSE"
140 S5 = CHR$(9)+"endif"
150 S6 = CHR$(9)+"ENDIF"
160 MAXLEVEL = 10  'maximum depth of conditional nesting
170 DIM LSTAT (MAXLEVEL)  'status of each nested conditional
180 'LSTAT is -1 to kill, 0 for indeterminate, 1 to leave
190 LEVEL = 0  'current level of conditional nesting
200 LSTAT (0) = 0  'status of current level
210 INPUT "Source filename" SFILE$
220 DFILE$ = "b:"+SFILE$
230 OPEN I, @1, SFILE$
240 OPEN O, @2, DFILE$
250 MARGIN @2, 155
260 LINPUT @1, L$ 'read a source file line
270 'scan source line for IF, ELSE, ENDIF
280 IF INSTR(L$,S1) THEN I=INSTR(L$,S1) : GOTO 410
290 IF INSTR(L$,S2) THEN I=INSTR(L$,S2) : GOTO 410
300 IF INSTR(L$,S3) THEN GOTO 660
310 IF INSTR(L$,S4) THEN GOTO 660
320 IF INSTR (L$,S5) THEN  GOTO 730
330 IF INSTR (L$,S6) THEN GOTO 730
340 IF LSTAT(LEVEL) <0 THEN PRINT LEVEL; "O ";L$ : GOTO 370
350 PRINT LEVEL; "+ ";L$
360 PRINT @2, L$ 'and write to destination
370 IF NOT EOF(1) THEN GOTO 260
380 IF LEVEL <> 0 THEN PRINT "Error:  eof at level "; LEVEL : STOP
390 CLOSE
400 GOTO 190
410 'IF seen in current line
420 IF I=1 THEN GOTO 490
430 'IF occurred after label, so print the label first
440 IF LSTAT(LEVEL) < 0 THEN PRINTLEVEL; "O "; LEFT$(L$, I-1) : GOTO 470
450 PRINTLEVEL; "+ "; LEFT$(L$, I-1)
460 PRINT @2, LEFT$(L$, I-1)
470 L$ = MID$(L$,I) 'remove label from l$
480 I = 1 'and update position of i
490 LEVEL = LEVEL + 1
500 IF LSTAT(LEVEL-1) < 0 THEN LSTAT(LEVEL) = LSTAT (LEVEL-1) - 1 : GOTO 340
510 'must determine whether conditional has been seen before
520 LCND$ = MID$ (L$, I+4)
530 'strip off comments if found
540 IF INSTR(LCND$,CHR$(9)) THEN LCND$=LEFT$(LCND$,INSTR(LCND$,CHR$(9))-1)
550 FOR J = 1 TO NRESP
560 IF SRESP(J) = LCND$ THEN LSTAT(LEVEL) = RESP(J) : GOTO 630
570 NEXT J
580 PRINT "IF found: "; LCND$
590 INPUT "Type -1, 0, 1 for False, Indeterminate, True" LSTAT(LEVEL)
600 NRESP = NRESP+1
610 SRESP (NRESP) = LCND$
620 RESP (NRESP) = LSTAT (LEVEL)
630 IF LSTAT(LEVEL) <> 1 THEN GOTO 340
640 PRINT LEVEL; "O "; L$
650 GOTO 260
660 'ELSE seen
670 IF LEVEL = 0 THEN PRINT "Error:  ELSE at level 0" : STOP
680 IF LSTAT(LEVEL) < -1 THEN GOTO 340 'inside a false condition, else goes too
690 IF LSTAT(LEVEL) = 0 THEN GOTO 340 'inside indeterminate, remain so
700 PRINT LEVEL; "O "; L$
710 LSTAT(LEVEL) = -LSTAT (LEVEL) 'reverse status inside elsepart
720 GOTO 260
730 'ENDIF seen
740 IF LEVEL=0 THEN PRINT "Error:  ENDIF at level 0" : STOP
750 LEVEL = LEVEL - 1
760 IF LSTAT (LEVEL+1) = 0 THEN GOTO 350
770 PRINT LEVEL; "O "; L$
780 GOTO 260
790 FOR I = 1 TO NRESP
800 PRINTRESP(I); SRESP(I)
810 NEXT
