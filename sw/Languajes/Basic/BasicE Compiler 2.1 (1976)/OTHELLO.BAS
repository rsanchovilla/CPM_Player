		REM THIS PROGRAM WAS WRITTEN BY MITCH J. BOGDANOWICZ  8/19/77
		REM COPYRIGHT 1977 MITCHELL J. BOGDANOWICZ JR.
		REM THE MEMORY MERCHANTS INC.
		REM   1350 BUFFALO ROAD
		REM   SUITE 11
		REM   ROCHESTER, NEW YORK    14624
		REM      716-328-5585
	DIM BOARD(12,12),LENGTH(64),MY(64),MX(64),SY(64),SX(64),RI(64),SI(64)
	DIM LN(64),MOVE(64),SAFE.MOVE(64),DANGER.MOVE(64),NO.DANGER(64)
1002	INPUT "IS THIS A NEW GAME OR OLD "; NEW.OR.OLD$
	PRINT
	RANDOMIZE
	INPUT "ENTER A FILE NAME FOR THIS GAME "; NAME$
	FILE.NAME$=LEFT$(NAME$,8)
	PRINT
	IF NEW.OR.OLD$="OLD" THEN GOTO 1345
	PRINT "THIS IS THE GAME OF OTHELLO":COUNTER=4 :EG=0 :EH=0
	PRINT : PRINT
1011	INPUT "DO YOU WANT THE RULES? (Y OR N) "; A$
	IF LEFT$(A$,1)="Y" THEN GOSUB 1240:GOTO 1016
	IF LEFT$(A$,1)<>"N" THEN GOTO 1011


1013	PRINT "THESE ARE YOUR CONTROL OPTIONS :" : GOSUB 1450


		REM SET UP BOARD

1016	FOR X=1 TO 8
	FOR Y=1 TO 8
	BOARD(Y,X)=0
	NEXT Y: NEXT X
	BOARD(4,4)=1:BOARD(5,5)=1:BOARD(4,5)=-1:BOARD(5,4)=-1


		REM SET DIFFICULTY

1022	PRINT "ENTER YOUR RANK (1 TO 9) - 9 IS MOST DIFFICULT.";:INPUT PLAYERS.RANK
	PRINT
	IF PLAYERS.RANK<1 OR PLAYERS.RANK>9 THEN GOTO 1022
	COUNTER=COUNTER+ABS(PLAYERS.RANK-5)
	IF PLAYERS.RANK=5 THEN GOTO 1043
	IF PLAYERS.RANK>5 THEN CH=RND ELSE GOTO 1028
	IF CH<=.750 THEN BOARD(1,8)=-1 ELSE GOSUB 1316
1028	IF PLAYERS.RANK>6 THEN CH=RND ELSE GOTO 1030
	IF CH<=.750 THEN BOARD(8,1)=-1 ELSE GOSUB 1316
1030	IF PLAYERS.RANK>7 THEN CH=RND ELSE GOTO 1032
	IF CH<=.750 THEN BOARD(8,8)=-1 ELSE GOSUB 1316
1032	IF PLAYERS.RANK>8 THEN CH=RND ELSE GOTO 1034
	IF CH<=.750 THEN BOARD(1,1)=-1 ELSE GOSUB 1316
1034	IF PLAYERS.RANK<5 THEN CH=RND ELSE GOTO 1036
	IF CH<=.750 THEN BOARD(1,1)=1 ELSE GOSUB 1321
1036	IF PLAYERS.RANK<4 THEN CH=RND ELSE GOTO 1038
	IF CH<=.750 THEN BOARD(8,8)=1 ELSE GOSUB 1321
1038	IF PLAYERS.RANK<3 THEN CH=RND ELSE GOTO 1040
	IF CH<=.750 THEN BOARD(1,8)=1 ELSE GOSUB 1321
1040	IF PLAYERS.RANK<2 THEN CH=RND ELSE GOTO 1042
	IF CH<=.750 THEN BOARD(8,1)=1 ELSE GOSUB 1321


1042		REM PRINT STARTING BOARD AND START GAME

1043	GOSUB 1046
	GOTO 1055


		REM DISPLAY BOARD

1046	FOR Y=1 TO 8
	FOR X=1 TO 8
	IF BOARD(Y,X)=1 THEN PRINT "X  ";
	IF BOARD(Y,X)=-1 THEN PRINT "O  ";
	IF BOARD(Y,X)=0 THEN PRINT "+  ";
	IF X=8 THEN PRINT
	NEXT X:NEXT Y: PRINT 
	RETURN


1055	PRINT
	INPUT "YOU ARE 'X', DO YOU WANT TO GO FIRST"; A$
	PRINT
	IF LEFT$(A$,1)="N" THEN 1069


		REM INPUT MOVE

1059	PRINT "YOUR MOVE";
	INPUT Y,X
	IF (Y=0) AND (X=0) THEN GOTO 1232 	REM SAVE DATA
	IF (Y=0) AND (X=1) THEN GOTO 1270 	REM FORFEIT MOVE
	IF (Y=0) AND (X=2) THEN GOTO 1117 	REM EXCHANGE BOARD W/CONT.
	IF (Y=0) AND (X=3) THEN GOTO 1118 	REM EXCHANGE BOARD
	IF (Y=0) AND (X=4) THEN EH=1 : GOTO 1217
	IF (Y=0) AND (X=5) THEN GOSUB 1325
	IF (Y=0) AND (X=6) THEN GOTO 1065 	REM AUTO MODE
	IF (Y=0) AND (X=7) THEN GOSUB 1100 	REM SET UP BOARD YOURSELF
	IF (Y=0) AND (X=8) THEN GOSUB 1110 	REM MOVE A PIECE
	IF (Y=0) AND (X=9) THEN GOSUB 1112 	REM DELETE A PIECE
	IF (Y=0) AND (X=10) THEN GOSUB 1450 	REM PRINT OPTIONS
	IF (Y=0) AND (X>10) THEN GOSUB 1450 : GOTO 1059
	IF (Y<0) OR (X<0) OR (Y>10) OR (X>10) THEN GOTO 1059
	IF Y=0 THEN GOSUB 1046 : GOTO 1059
	PRINT : COUNTER=COUNTER+1: GOSUB 1199
	IF BOARD(Y,X)<>0 THEN PRINT "INVALID MOVE, TRY AGAIN!":COUNTER=COUNTER-1: GOTO 1059
	BOARD(Y,X)=1 : GOSUB 1186 : GOSUB 1046
	IF COUNTER>=64 THEN GOTO 1217
	GOTO 1069


1065	REM AUTO

	AUTO$="AUTO"
	FIRST.TIME=0
	GOTO 1069


1069		REM FIND ALL POSSIBLE MOVES FOR BLACK

	IF INP(1) = 27 THEN AUTO$="MANUAL" : GOTO 1059 	REM AN ESCAPE STOPS AUTO
1070	Q=0
	FOR Y=1 TO 8
	FOR X=1 TO 8
	IF BOARD(Y,X)=-1 THEN GOSUB 1087
	NEXT X :NEXT Y
	IF Q=0 THEN 1217
	Q2=0
	FOR Q1=1 TO Q
	Q3=LENGTH(Q1)
    IF Q3>Q2 THEN Q2=Q3
	NEXT Q1: Q0=Q2:SD=0
1081	K=0: MM=0: NN=0:N1=0
	FOR Q1=1 TO Q
	IF Q2=LENGTH(Q1) THEN K=K+1


		REM TAKE A CORNER IF POSSIBLE

	IF ((MY(Q1)=1) OR (MY(Q1)=8))AND((MX(Q1)=1)OR(MX(Q1)=8))THEN Q2=LENGTH(Q1): GOTO 1172
	NEXT Q1:GOTO 1119


1087		REM CHECK IN ALL DIRECTIONS FOR A WHITE STRING TO FLIP

	FOR R=Y-1 TO Y+1
    FOR S=X-1 TO X+1
	IF (R=0) OR (S=0) THEN 1092
	IF BOARD(R,S)=1 THEN GOSUB 1095
1092	NEXT S: NEXT R
	RETURN




		REM FIND DIRECTION AND LENGTH OF WHITE STRING

1095	R1=R-Y : S1=S-X
	C=1
	R2=R+R1 :S2=S+S1
1098	IF (R2=0) OR (S2=0) THEN RETURN
	IF BOARD(R2,S2)=1 THEN C=C+1 :R2=R2+R1 :S2=S2+S1 :GOTO 1098
	IF BOARD(R2,S2)=-1 THEN RETURN
	IF (R2>8) OR (R2<1) OR (S2>8) OR (S2<1) THEN RETURN
	C=C+1
	Q=Q+1:SAFE.MOVE(Q)=0 :DANGER.MOVE(Q)=0
	MY(Q)=C*R1+Y : LENGTH(Q)=C-1 : SY(Q)=Y : SX(Q)=X
	MX(Q)=C*S1+X


		REM RECOGNIZE DANGER ZONES

	IF (MX(Q)=1)OR(MX(Q)=8)OR(MY(Q)=1)OR(MY(Q)=8) THEN GOSUB 1306
	IF (MX(Q)=2) AND (MY(Q)>=2) AND (MY(Q)<=7) THEN DANGER.MOVE(Q)=1
	IF (MX(Q)=7) AND (MY(Q)>=2) AND (MY(Q)<=7) THEN DANGER.MOVE(Q)=1
	IF (MY(Q)=2) AND (MX(Q)>=2) AND (MX(Q)<=7) THEN DANGER.MOVE(Q)=1
	IF (MY(Q)=7) AND (MX(Q)>=2) AND (MX(Q)<=7) THEN DANGER.MOVE(Q)=1
	IF BOARD(1,1)=-1 AND MX(Q)=2 AND MY(Q)=2 THEN DANGER.MOVE(Q)=0
	IF BOARD(1,8)=-1 AND MX(Q)=7 AND MY(Q)=2 THEN DANGER.MOVE(Q)=0
	IF BOARD(8,1)=-1 AND MX(Q)=2 AND MY(Q)=7 THEN DANGER.MOVE(Q)=0
	IF BOARD(8,8)=-1 AND MX(Q)=7 AND MY(Q)=7 THEN DANGER.MOVE(Q)=0
	RI(Q)=R1 : SI(Q)=S1
	RETURN


1100	PRINT "ENTER THE PIECE (X,O OR +)"
	PRINT "ENTER R TO RETURN"; : INPUT P$
	IF P$="R" THEN Y=0 : RETURN
	INPUT "COORDINATES(Y,X): ";Y,X
	IF P$="X" THEN BOARD(Y,X)=-1
	IF P$="O" THEN BOARD(Y,X)= 1
	IF P$="+" THEN BOARD(Y,X)= 0
	GOTO 1100


1110	PRINT "MOVE A PIECE(X OR O)"
	INPUT "FROM ";Y,X
	IF Y=0 THEN RETURN
	INPUT " TO ";Y1,X1
	TEMP.=BOARD(Y,X)
	BOARD(Y,X)=0
	BOARD(Y1,X1)=TEMP.
	GOTO 1110

1112	INPUT "DELETE THE PIECE (Y,X): ";Y,X
	IF Y=0 THEN RETURN
	BOARD (Y,X)=0
	GOTO 1112


1117	REM EXCHANGE BOARD RETAINING CONTINUITY
	
	GOSUB	1400		REM EXCHANGE PIECES
	PRINT
	GOSUB 	1046		REM PRINT BOARD
	PRINT
	GOTO	1069		REM BLACK MOVES WHAT WOULD HAVE BEEN WHITE


1118	REM EXCHANGE BOARD

	GOSUB 1400
	PRINT
	GOSUB 1046
	PRINT
	GOTO 1059


		REM LOOK FOR A MULTIPLE STRING MOVE

1119	F=0
	FOR Q8=1 TO Q
	FOR Q9=1 TO Q
	IF (MY(Q8)=MY(Q9)) AND (Q8<>Q9) AND (MX(Q8)=MX(Q9)) THEN GOSUB 1144
	NEXT Q9: NEXT Q8 :H=0


		REM IF NO MULTIPLE MOVES, GO SELECT A STRAIGHT MOVE

	IF F=0 THEN 1149


		REM EVALUATE MULTIPLE MOVES

	FOR G=1 TO F
	IF LN(G)>H THEN J=G :H=LN(G)
	NEXT G
	IF LN(J)<=Q2 THEN 1149
	P=0 : FOR G=1 TO F
	IF LN(G)=LN(J) THEN P=P+1
	NEXT G
	P8=P : FOR PP=1 TO 3
	P1=INT(RND *P8)+1 :P=0
	FOR G=1 TO F
	IF LN(J)=LN(G) THEN GOSUB 1302
	IF P=P1 AND LN(J)=LN(G)   THEN Q2=LENGTH(MOVE(G)) :Q1=MOVE(G) :GOTO 1172
	IF DANGER.MOVE(MOVE(G))=0 THEN LET NN=1
	NEXT G
	IF NN<>1 THEN GOTO 1149
	NEXT PP : GOTO 1149


		REM GET LENGTH ETC. OF MULTIPLE STRING MOVE

1144	F=F+1
	LN(F)=LENGTH(Q8)+LENGTH(Q9)-1 : MOVE(F)=Q9
	IF LENGTH(Q8)>LENGTH(Q9) THEN MOVE(F)=Q8
	RETURN




		REM SELECT A MOVE

1149    K8=K: FOR QQ=1 TO 5
	K1=INT(RND*K8)+1
	K=0
	FOR Q1=1 TO Q
	IF Q2=LENGTH(Q1) THEN GOSUB 1237
	IF K=K1 AND Q2=LENGTH(Q1) THEN GOTO 1172
	IF DANGER.MOVE(Q1)=0 THEN LET MM=1 : N1=N1+1 : NO.DANGER(N1)=Q1
	NEXT Q1
	IF MM<>1 THEN GOTO 1164
	NEXT QQ
	FOR N2=1 TO N1
	IF Q2=LENGTH(NO.DANGER(N2)) THEN Q1=NO.DANGER(N1): GOTO 1172
	NEXT N2
	Q2=Q2-1
	IF Q2 >0 THEN GOTO 1081
1164	IF DD=1 THEN GOTO 1184
	Q2=Q0 :FOR Q6=1 TO Q : DANGER.MOVE(Q6)=0 
	IF BOARD(1,1)<>-1 AND MY(Q6)=2 AND MX(Q6)=2 THEN DANGER.MOVE(Q6)=1
	IF BOARD(1,8)<>-1 AND MY(Q6)=2 AND MX(Q6)=7 THEN DANGER.MOVE(Q6)=1
	IF BOARD(8,1)<>-1 AND MY(Q6)=7 AND MX(Q6)=2 THEN DANGER.MOVE(Q6)=1
	IF BOARD(8,8)<>-1 AND MY(Q6)=7 AND MX(Q6)=7 THEN DANGER.MOVE(Q6)=1
	NEXT Q6 : DD=1 : GOTO 1081


		REM FLIP A STRING

1172	FOR Q4=1 TO Q2+1 : DD=0
	BOARD(SY(Q1)+RI(Q1)*Q4,SX(Q1)+SI(Q1)*Q4)=-1
	NEXT Q4


		REM LOOK FOR MULTIPLE MOVES

	FOR Q6=1 TO Q
	IF (MY(Q1)=MY(Q6)) AND (Q1<>Q6) AND (MX(Q1)=MX(Q6)) THEN GOSUB 1181
	NEXT Q6 :PRINT:PRINT"MY MOVE ";MY(Q1);",";MX(Q1):EG=0:EH=0:COUNTER=COUNTER+1
	PRINT
	IF AUTO$="AUTO" AND FIRST.TIME=1 THEN GOSUB 1400
	GOSUB 1046
	IF AUTO$="AUTO" AND FIRST.TIME=0 THEN GOSUB 1400 :\
		FIRST.TIME=1 : GOTO 1069
	IF AUTO$="AUTO" THEN FIRST.TIME=0 : GOTO 1069
	GOTO 1059


		REM FLIP 	REMAINDER OF MULTIPLE MOVE

1181	FOR Q4=1 TO LENGTH(Q6) +1
	BOARD(SY(Q6)+RI(Q6)*Q4,SX(Q6)+SI(Q6)*Q4)=-1
	NEXT Q4 :RETURN
1184	Q2=Q0 : FOR Q6=1 TO Q : DANGER.MOVE(Q6)=0 : NEXT Q6 : GOTO 1081


		REM FLIP ALL DISCS FOR WHITE'S MOVE

1186	FOR Q5=Y-1 TO Y+1
	FOR Q6=X-1 TO X+1
	IF BOARD(Q5,Q6)=-1 THEN GOSUB 1190
	NEXT Q6 :NEXT Q5 : RETURN
1190	R1=Q5-Y :S1=Q6-X :R2=R1+Q5 :S2=S1+Q6
1191	IF BOARD(R2,S2)=-1 THEN GOSUB 1198 :GOTO 1191
	IF BOARD(R2,S2)=0 THEN RETURN
	IF (R2>8) OR (R2<1) OR (S2>8) OR (S2<1) THEN RETURN
	R2=R1+Q5 : S2=S1+Q6
	IF BOARD(R2-R1,S2-S1)=-1 THEN BOARD(R2-R1,S2-S1)=1
1196	IF BOARD(R2,S2)=-1 THEN BOARD(R2,S2)=1 :GOSUB 1198 :GOTO 1196
	RETURN


1198	R2=R2+R1 : S2=S2+S1 : RETURN


1199		REM CHECK FOR A LEGAL MOVE BY WHITE

	IF BOARD(Y,X)<>0 THEN RETURN
	VM=0
	FOR R=Y-1 TO Y+1
	FOR S=X-1 TO X+1
	IF (R=0) OR (S=0) THEN 1206
	IF BOARD(R,S)=-1 THEN GOSUB 1210
1206	NEXT S :NEXT R
	IF VM>0 THEN RETURN
	PRINT "YOU CAN'T FLIP ANY OF YOUR OPPONENT'S PIECES WITH THAT MOVE"
	Y=11 :X=11 :BOARD(Y,X)=2 : RETURN
1210	R1=R-Y : S1=S-X : R2=R : S2=S
1211	IF (R2=0) OR (S2=0) THEN RETURN
	R2=R2+R1 : S2=S2+S1
	IF BOARD(R2,S2)=-1 THEN 1211
	IF BOARD(R2,S2)=0 THEN RETURN
	IF (R2>8) OR (R2<1) OR (S2>8) OR (S2<1) THEN RETURN
	VM=1 : RETURN


1217		REM END OF GAME TALLY AND 'NO MOVE' SITUATIONS

	W=0 :B=0
	FOR Y=1 TO 8
	FOR X=1 TO 8
	Z=BOARD(Y,X)
	IF Z=0 AND EH=1 THEN GOTO 1224
	IF AUTO$="AUTO" AND Z=0 THEN EG=1 : GOSUB 1400 : GOTO 1069
	IF Z=0 THEN PRINT "I HAVE NO MOVES AVAILABLE, PLEASE GO AGAIN.":PRINT:EG=1:GOTO 1059
1224	IF Z=1 THEN W=W+1
	IF Z=-1 THEN B=B+1
	NEXT X :NEXT Y
	PRINT
	PRINT "THE GAME IS OVER, I HAVE CAPTURED ";B;"DISCS AND YOU HAVE ";W;"DISCS"
	IF W=B THEN PRINT "TIE GAME------YOU LUCKED OUT":GOTO 1232
	IF W>B THEN PRINT "YOU WIN BY ";W-B;"DISCS":GOTO 1232
	PRINT "I WIN BY ";B-W;"DISCS"
1232	PRINT "DO YOU WANT TO SAVE THE DATA?(YES OR NO)";: INPUT SAVE$
	IF SAVE$="YES" THEN GOSUB 1322
1234	PRINT "WOULD YOU LIKE TO PLAY AGAIN? (YES OR NO OR RESUME)"
	INPUT A$
	IF A$="RESUME" THEN GOSUB 1046 : GOTO 1059
	IF A$="YES" THEN GOTO 1002
	IF A$="NO" THEN STOP
	GOTO 1234
1237	IF DANGER.MOVE(Q1)=0 THEN K=K+1 ELSE RETURN
	IF SAFE.MOVE(Q1)>0 THEN K=K1
	RETURN


1240	PRINT "                         RULES                              "
	PRINT : PRINT "YOU HAVE WHITE(X) DISCS AND THE COMPUTER HAS BLACK(O)"
	PRINT "A MOVE CONSISTS OF OUTFLANKING YOUR OPPONENT'S DISC(S), THEN "
	PRINT "FLIPPING THE OUTFLANKED DISC(S) OVER TO YOUR COLOR."
	PRINT "           TO OUTFLANK MEANS TO PLACE A DISC SO THAT YOUR "
	PRINT "OPPONENT'S ROW(OR ROWS) OF DISC(S) IS BORDERED AT EACH END BY A"
	PRINT "DISC OF YOUR COLOR."
	PRINT "IF A PLAYER CANNOT OUTFLANK AND FLIP AT LEAST ONE OPPOSING DISC, THE"
	PRINT "TURN IS FORFEITED AND THE OPPONENT MOVES AGAIN. TO FORFEIT  A TURN,"
	PRINT "ANSWER  -1,-1  TO 'YOUR MOVE?'."
	PRINT "A DISC MAY OUTFLANK ANY NUMBER OF DISCS IN ONE OR MORE ROWS. A ROW"
	PRINT "IS DEFINED AS ONE OR MORE DISCS IN A CONTINUOUS STRAIGHT LINE."
	PRINT "A DISC MAY OUTFLANK IN ANY DIRECTION: HORIZONTALLY, VERTICALLY OR "
	PRINT "DIAGONALLY. A DISC MAY OUTFLANK IN ANY NUMBER OF DIRECTIONS AT THE"
	PRINT "SAME TIME . A DISC MAY ONLY BE OUTFLANKED AS A DIRECT RESULT OF A MOVE"
	PRINT "AND MUST FALL IN THE DIRECT LINE OF THE DISC PLACED."
	PRINT "WHEN IT IS NO LONGER POSSIBLE FOR EITHER PLAYER TO MOVE,"
	PRINT "                THE GAME IS OVER"
	PRINT "DISCS ARE COUNTED AND THE PLAYER WITH THE MOST DISCS IS THE WINNER."
	PRINT "TO ABORT A GAME ANSWER  0,0  TO 'YOUR MOVE?'"
	PRINT "TO TALLY-UP AND QUIT TYPE 99,99 TO 'YOUR MOVE'"
	PRINT:PRINT
	INPUT "DO YOU WANT A SAMPLE BOARD, (Y OR N)"; S$
	IF LEFT$(S$,1)<>"Y" THEN RETURN
	PRINT "THIS IS THE BOARD AND HOW THE SPACES ARE NUMBERED":PRINT:FOR Y=1 TO 8:FOR X=1 TO 8
	PRINT Y;",";X;" ";
	IF X=8 THEN PRINT : PRINT
	NEXT X : NEXT Y : PRINT : RETURN


		REM CHECK FOR ALL OF WHITE'S POSSIBLE MOVES

1270	Q=0: FOR Y=1 TO 8
	FOR X=1 TO 8
	IF BOARD(Y,X)=1 THEN GOSUB 1286
	NEXT X:NEXT Y
	IF Q=0 AND EG=1 THEN EH=1: GOTO 1217
	IF Q=0 THEN EG=1: GOTO 1070
	PRINT "I'M SORRY, YOU MAY NOT FORFEIT THIS MOVE"
	PRINT "YOU HAVE THESE LEGAL MOVES AVAILABLE:":PRINT
	FOR Q9=1 TO Q
	FOR QI=1 TO Q
	IF MX(Q9)=MX(QI) AND MY(Q9)=MY(QI) AND Q9<>QI THEN MX(QI)=0:MY(QI)=0
	NEXT QI : NEXT Q9
	FOR Q9=1 TO Q
	IF MX(Q9)=0 AND MY(Q9)=0 THEN GOTO 1285
	PRINT MY(Q9);",";MX(Q9),
1285	NEXT Q9 : PRINT : GOTO 1059
1286	FOR R=Y-1 TO Y+1
	FOR S=X-1 TO X+1
	IF (R=0) OR (S=0) THEN 1291
	IF (R=9) OR(S=9) THEN 1291
	IF BOARD(R,S)=-1 THEN GOSUB 1292
1291	NEXT S: NEXT R: RETURN
1292	R1=R-Y: S1=S-X:C=1
	R2=R+R1 :S2=S+S1
1294	IF (R2=0) OR (S2=0) THEN RETURN
	IF BOARD(R2,S2)=-1 THEN R2=R2+R1:C=C+1:S2=S2+S1:GOTO 1294
	IF BOARD(R2,S2)=1 THEN RETURN
	IF (R2>8) OR (R2<1) OR (S2>8) OR (S2<1) THEN RETURN
	C=C+1 :Q=Q+1
    MY(Q)=C*R1+Y
	MX(Q)=C*S1+X
	RETURN


1302	IF DANGER.MOVE(MOVE(G))=0 THEN P=P+1 ELSE RETURN
	IF SAFE.MOVE(MOVE(G))>0 THEN P=P1
	RETURN




		REM AVOID DANGER ZONES

1306	IF (MY(Q)=1) AND (MX(Q)=2) AND (BOARD(1,1)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=2) AND (MX(Q)=1) AND (BOARD(1,1)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=1) AND (MX(Q)=7) AND (BOARD(1,8)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=2) AND (MX(Q)=8) AND (BOARD(1,8)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=7) AND (MX(Q)=1) AND (BOARD(8,1)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=8) AND (MX(Q)=2) AND (BOARD(8,1)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=8) AND (MX(Q)=7) AND (BOARD(8,8)<>-1) THEN DANGER.MOVE(Q)=1 
	IF (MY(Q)=7) AND (MX(Q)=8) AND (BOARD(8,8)<>-1) THEN DANGER.MOVE(Q)=1 
	SAFE.MOVE(Q)=1  : RETURN


		REM RANDOMLY PLACE A BLACK (" O ") PIECE (HANDICAP)

1316	X=INT(RND*8)+1
	Y=INT(RND*8)+1
	IF BOARD(Y,X)<>0 THEN GOTO 1316
	BOARD(Y,X)=-1 : RETURN


		REM RANDOMLY PLACE A WHITE (" X ") PIECE (HANDICAP)

1321	X=INT(RND*8)+1
	Y=INT(RND*8)+1
	IF BOARD(Y,X)<>0 THEN GOTO 1321
	BOARD(Y,X)=1 : RETURN


1322	PRINT " THE PRESENT FILE IS NAMED ";FILE.NAME$
	PRINT " IF YOU WANT TO CHANGE IT, INPUT A DIFFERENT NAME"
	PRINT "OTHERWISE ENTER A '*' ";
	INPUT NAME$
	IF NAME$="*" THEN GOTO 1325
	FILE.NAME$=LEFT$(NAME$,8)
	GOTO 1325


1325		REM SAVE ALL DATA FOR A FUTURE FINISH

	FILE FILE.NAME$
	FOR SAVE = 1 TO 64
		PRINT # 1;\
			LENGTH(SAVE),MY(SAVE),MX(SAVE),\
			SY(SAVE),SX(SAVE),RI(SAVE),\
			SI(SAVE),LN(SAVE),MOVE(SAVE),\
			SAFE.MOVE(SAVE),DANGER.MOVE(SAVE),NO.DANGER(SAVE)
	NEXT SAVE
	FOR SAVE.A = 1 TO 12
		FOR SAVE.B = 1 TO 12
		PRINT # 1; BOARD(SAVE.A,SAVE.B)
		NEXT SAVE.B
	NEXT SAVE.A
	PRINT # 1; COUNTER,EG,EH,PLAYERS.RANK,\
				Q,Q0,Q2,Q3,\
				K,K1,K8,MM,\
				NN,N1,R,S,\
				R1,S1,C,R2,\
				S2,F,H,P,\
				P8,DD,VM,NAME$
	CLOSE 1
	RETURN




1345		REM READ IN DATA



	FILE FILE.NAME$

	FOR LOAD = 1 TO 64
		READ # 1;\
			LENGTH(LOAD),MY(LOAD),MX(LOAD),\
			SY(LOAD),SX(LOAD),RI(LOAD),\
			SI(LOAD),LN(LOAD),MOVE(LOAD),\
			SAFE.MOVE(LOAD),DANGER.MOVE(LOAD),NO.DANGER(LOAD)
	NEXT LOAD
	FOR LOAD.A = 1 TO 12
		FOR LOAD.B = 1 TO 12
		READ # 1; BOARD(LOAD.A,LOAD.B)
		NEXT LOAD.B
	NEXT LOAD.A
	READ # 1; COUNTER,EG,EH,PLAYERS.RANK,\
				Q,Q0,Q2,Q3,\
				K,K1,K8,MM,\
				NN,N1,R,S,\
				R1,S1,C,R2,\
				S2,F,H,P,\
				P8,DD,VM,NAME$
	CLOSE 1
	GOSUB 1046 : GOTO 1059
1400	FOR X = 1 TO 8
		FOR Y = 1 TO 8
		BOARD(Y,X)=- BOARD(Y,X)
		NEXT Y
	NEXT X
	RETURN


1450	REM OPTIONS ON Y,X RESPONSE OF 0,#

	PRINT
	PRINT "COMMAND 0,0 = SAVE DATA"
	PRINT "COMMAND 0,1 = FORFEIT MOVE"
	PRINT "COMMAND 0,2 = EXCHANGE BOARD"
	PRINT "COMMAND 0,3 = EXCHANGE PIECES"
	PRINT "COMMAND 0,4 = END GAME + TALLY"
	PRINT "COMMAND 0,5 = SAVE DATA ON CURRENT FILE"
	PRINT "COMMAND 0,6 = AUTO MODE"
	PRINT "COMMAND 0,7 = SET UP BOARD YOURSELF"
	PRINT "COMMAND 0,8 = MOVE A PIECE"
	PRINT "COMMAND 0,9 = DELETE A PIECE"
	PRINT "COMMAND 0,10 = PRINT OPTIONS"
	PRINT
	PRINT
	RETURN


	END



