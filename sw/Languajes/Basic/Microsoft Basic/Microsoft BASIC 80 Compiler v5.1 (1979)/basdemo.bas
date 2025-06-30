900 DEFINT A-Z
1000 PRINT "BASIC Compiler/Interpreter comparison demonstration"
1010 PRINT "(C) Copyright 1979, Lifeboat Associates"
1015 DIM AR(1000)
1020 PRINT: PRINT: PRINT "There are two tests to run:" 
1021 PRINT "   A)  The first test concatenates a single character"
1022 PRINT "       to a string variable until it is 255 bytes long."
1023 PRINT
1024 PRINT "   B)  The second test does a SHELL-METZNER sort on a"
1025 PRINT "       numerical array of up to 1000 elements.": PRINT
1026 INPUT "Which test? A or B";YN$
1027 IF YN$="A" GOTO 1500
1028 IF YN$<>"B" GOTO 1020
1030 INPUT "How many elements to sort";N
1032 N=ABS(N):IF N>1000 THEN PRINT:PRINT:PRINT "Only 1000 elements please.":GOTO 1020
1040 PRINT: PRINT "You have two choices for filling the array:"
1050 PRINT "  1) Fill it automatically with random numbers."
1060 PRINT "  2) Type in all ";
1070 PRINT N;" numbers."
1080 PRINT: INPUT "Choose number 1 or 2 ";YN$
1085 PRINT
1090 IF YN$="" OR MID$(YN$,1,1) <> "2" GOTO 1200
1100 FOR I = 1 TO N
1110 PRINT "What is element number";I;: INPUT AR(I)
1120 NEXT I
1130 GOTO 1300
1200 PRINT: PRINT: PRINT "Filling the array..."
1205 FOR I = 1 TO N
1210 AR(I) = INT(RND(I)*10000)
1220 NEXT I
1300 PRINT: PRINT: PRINT "Finished filling the array."
1304 PRINT: INPUT "Print the unsorted array (Y/N)";YN$
1305 IF YN$="Y" THEN GOSUB 1350
1310 PRINT: PRINT "      SORTING"
1320 GOSUB 4000
1330 PRINT: PRINT "Array sorted."
1340 PRINT: INPUT "Print the array (Y/N)";YN$
1344 IF YN$="Y" THEN GOSUB 1350: GOTO 1020
1345 GOTO 1020
1350 FOR I = 1 TO N STEP 4
1360 PRINT AR(I), AR(I+1), AR(I+2), AR(I+3)
1370 NEXT I
1380 RETURN
1500 REM
1501 REM    ---  CONCATENATION TEST  ----
1502 REM
1503 PRINT: INPUT "How many concatenation cycles (50 will take less than a minute)";N
1505 PRINT: PRINT "       CONCATENATION TEST BEGINS NOW..."
1510 FOR I = 1 TO N
1515 FOR J = 1 TO 255
1520 X$ = X$ + "1"
1525 NEXT J
1527 X$=""
1528 PRINT I;
1530 NEXT I
1535 PRINT: PRINT: PRINT "       TEST COMPLETED"
1540 GOTO 1020
4000 REM
4001 REM    SHELL - METZNER SORT OF N ELEMENTS IN BASIC
4002 REM
4010 BM = N: BT = N
4020 BM = INT (BM/2): IF BM = 0 THEN RETURN
4030 BK = BT - BM: BJ = 1
4040 BI = BJ
4050 BL = BI + BM
4060 IF AR(BI) > AR(BL) GOTO 4100
4070 SWAP AR(BI),AR(BL)
4080 BI = BI - BM
4090 IF BI >= 1 GOTO 4050
4100 BJ = BJ + 1: IF BJ > BK GOTO 4020
4110 GOTO 4040
40