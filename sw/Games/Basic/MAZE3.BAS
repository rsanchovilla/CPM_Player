10 WIDTH 255:Print CHR$(26):Print TAB(20); "M A Z E"
11 Print:Print:Print:Print TAB(30); "by Wade Satterfield"
15 CLEAR ,,5000
20 DEFINT A-Z
30 DEF FNXY$(R,C)=ESC$+"="+CHR$(R+31)+CHR$(C+31)
40 DIM L(3), R(3), F(3), DR(3), DC(3), W(4)
41 DIMM(15,15), F$(4), L$(4), R$(4), V$(4),	LF$(4), RF$(4)
50 FOR I=0 TO 3
60	F(I)=2^I
70	L(I)=2^(I-1 AND 3)
80	R(I)=2^(I+1 AND 3)
90 NEXT I
100 DR(0)=-1
110 DC(1)=1
120 DR(2)=1
130 DC(3)=-1
135 ER=RND*16 AND 15
136 EC=RND*16 AND 15
137 RD=RND*4 AND 3
138 RR=RND*16 AND 15
139 RC=RND*16 AND 15
140 D=RND*4-.5
145 NORTH=RND*4 AND 3
150 R=RND*15
160 C=RND*15
165 CRUMBS=100
170 C$=CHR$(11)+CHR$(10)+CHR$(8)+CHR$(12)+" "
180 FOR I=0 TO 15
190	FOR J=0 TO 15
200		READ M(I,J)
210	NEXT J
220 NEXT I
230 W(0)=25
240 W(1)=18
250 W(2)=10
260 W(3)=4
270 W(4)=1
280 ESC$=CHR$(27)
290 C1$="|"
300 C2$="/"
310 C4$="|"
320 C7$=CHR$(7)
330 C14$="\"
340 N$(0)="Plunk!"
350 N$(1)="Crunch"
360 N$(2)="Plink!"
370 N$(3)=" Biff"
380 N$(4)=" Plop"
390 N$(5)="Splat"
400 N$(6)=" Thud"
410 N$(7)="KA-BOOM!! (a biggy)"
420 D$(0)="N"
430 D$(1)="E"
440 D$(2)="S"
450 D$(3)="W"
490 GOSUB 4000 ' INITIALIZE MORE STUFF
500 ' MAIN LOOP
510 GOSUB 2000
520 X=FRE("")
530 A$=INKEY$
540 IF LEN(A$) THEN Q=INSTR(1,C$,A$) ELSE Q=0
550 ON Q GOSUB 600,700,800,900,1000
555 RAT=RAT+1 AND 31
556 IF RAT=0 THEN GOSUB 3000
560 IF Q THEN 500 ELSE 520
600 ' STEP FORWARD
610 IF (F(D) AND M(R,C)) THEN PRINT C7$;:Return
620 R=R+DR(D) AND 15
630 C=C+DC(D) AND 15
635 IF EC=C AND ER=R THEN 5160
640 RETURN
700 ' BACKUP
710 D1=D+2 AND 3
720 IF (F(D1) AND M(R,C)) THEN PRINT C7$; :Return
730 R=R+DR(D1) AND 15
740 C=C+DC(D1) AND 15
745 IF EC=C AND ER=R THEN 5160
750 RETURN
800 ' TURN LEFT
810 D=(D-1) AND 3
820 RETURN
900 ' RIGHT TURN
910 D=D+1 AND 3
920 RETURN
1000 ' DROP CROUTON
1010 Q=0
1020 IF CRUMBS=0 THEN 1070
1030 CRUMBS=CRUMBS-1
1040 M(R,C)=M(R,C) OR 16
1050 PRINT FNXY$(22,23); N$(RND*8 AND 7);
1060 RETURN
1070 PRINT FNXY$(22,16); "You are out of croutons.";
1080 RETURN
2000 ' DRAW PICTURE
2010 X=R
2020 Y=C
2030 PRINT CHR$(26);
2035 Z=FRE("")
2040 FOR S=1 TO 4
2045 A$=INKEY$
2047 IF LEN(A$) THEN 540
2050 PRINT V$(S);
2060 IF L(D) AND M(X,Y) THEN PRINT L$(S);Else IF F(D) AND M(X+DR(D-1 AND 3) AND 15, Y+DC(D-1 AND 3) AND 15) Then Print LF$(S);
2070 IF R(D) AND M(X,Y) THEN PRINT R$(S); Else IF F(D) AND M(X+DR(D+1 AND 3) AND 15,	Y+DC(D+1 AND 3) AND 15) Then PRINT RF$(S);
2080 IF F(D) AND M(X,Y) THEN PRINT F$(S); :	S=4
2110	X=X+DR(D) AND 15
2120	Y=Y+DC(D) AND 15
2130 NEXT S
2150 X=R
2160 Y=C
2170 FOR I=1 TO 3
2175	IF (F(D) AND M(X,Y)) THEN I=3 : GOTO 2210
2180	X=X+DR(D) AND 15
2190	Y=Y+DC(D) AND 15
2200	IF X=ER AND Y=EC Then Print FNXY$(W(I)-2,24); "EXIT";
2205	IF 16 AND M(X,Y) Then Print FNXY$((W(I)+W(I+1))/2,26); ".";
2210 NEXT I
2220 PRINT FNXY$(21,25);
2230 PRINT D$(D-NORTH AND 3); CHR$(8);
2999 RETURN
3000 ' MOUSE MOVER
3010 ON RND^2*5 +.5 GOTO 3100,3200,3300,3400,3500
3100 ' MOVE
3110 IF (F(RD) AND M(RR,RC))=0 Then RR=RR+DR(RD) AND 15 :	RC=RC+DC(RD) AND 15
3120 RETURN
3200 ' TURN LEFT
3210 RD=RD-1 AND 3
3220 RETURN
3300 ' EAT
3310 M(RR,RC)=M(RR,RC) AND -17
3320 RETURN
3330 ' TURN RIGHT
3340 RD=RD+1 AND 3
3350 RETURN
3400 ' TURN RIGHT
3410 RD=RD+1 AND 3
3420 RETURN
3500 'RUSTLE
3510 PRINT FNXY$(22,16);
3520 ON RND*4.2+.5 GOTO 3530,3550,3570,3590,3610
3530 PRINT "Squeek squeek";
3540 GOTO 3620
3550 PRINT "Sniff sniff";
3560 GOTO 3620
3570 PRINT "Munch munch";
3580 GOTO 3620
3590 PRINT "Rustle Rustle";
3600 GOTO 3620
3610 PRINT "    Burp!";
3620 PRINT FNXY$(20,25);
3630 RETURN
4000 ' INITIALIZE
4010 FOR I=1 TO 4
4020	L$(I)=FNXY$(W(I-1)-1,26-W(I-1))
4030	FOR J=W(I-1)-1 TO W(I) STEP -1
4040	    L$(I)=L$(I)+C2$
4050	    IF J<>W(I) THEN L$(I)=L$(I)+CHR$(11)
4060	NEXT J
4070	R$(I)=FNXY$(W(I),27+W(I))
4080	FOR J=W(I) TO W(I-1)-1
4090	    R$(I)=R$(I)+C14$
4100	    IF J<>W(I-1)-1 THEN R$(I)=R$(I)+CHR$(10)
4110	NEXT J
4120	F$(I)=FNXY$(W(I),25-W(I))+STRING$(W(I)*2+3,45)
4130	LF$(I)=FNXY$(W(I),26-W(I-1))+STRING$(W(I-1)-W(I)-1,45)
4140	RF$(I)=FNXY$(W(I),28+W(I))+	STRING$(W(I-1)-W(I)-1,45)
4150	V$(I)=FNXY$(1,25-W(I))
4160	X$=FNXY$(1,27+W(I))
4170	FOR J=1 TO W(I)-1
4180	    V$(I)=V$(I)+C1$
4190	    X$=X$+C4$
4200	    IF J<>W(I)-1 THEN X$=X$+CHR$(8)+CHR$(10) :V$(I)=V$(I)+CHR$(8)+CHR$(10)
4210	NEXT J
4220	V$(I)=V$(I)+X$
4230 NEXT I
4240 V$(4)=""
4250 RETURN
5000 DATA 9,1,5,3,9,4,3,12,3,13,4,3,9,4,1,3
5010 DATA 14,10,11,10,14,11,12,1,6,9,3,10,12,3,10,14
5020 DATA 5,2,12,4,5,0,5,2,9,2,12,0,1,6,8,5
5030 DATA 11,12,5,3,11,10,11,10,10,10,13,6,12,7,12,3
5040 DATA 8,5,5,2,8,2,12,6,10,10,9,3,9,3,9,2
5050 DATA 10,9,3,10,10,12,5,5,6,12,6,12,6,12,6,14
5060 DATA 2,10,8,2,12,1,3,9,5,5,5,5,5,5,5,5
5070 DATA 14,10,10,14,11,10,10,16,13,1,5,7,9,5,1,3
5080 DATA 5,6,12,1,4,2,12,4,1,6,9,7,8,7,10,8
5090 DATA 5,3,11,12,3,14,9,3,10,9,4,5,6,9,2,12
5100 DATA 11,8,4,7,8,1,6,10,8,4,5,1,7,10,12,3
5110 DATA 8,4,1,5,2,12,7,8,4,5,3,12,5,0,3,10
5120 DATA 10,9,4,7,12,5,1,4,7,9,4,1,3,14,8,6
5130 DATA 14,10,9,1,7,9,2,11,9,2,11,10,10,11,10,11
5140 DATA 5,6,10,14,9,2,10,8,2,14,8,0,0,0,0,0
5150 DATA 13,5,4,5,6,10,14,10,12,7,10,14,14,10,14,14
5160 PRINT FNXY$(22,16); "YOIKS YOU GOT OUT!!"
5170 END
