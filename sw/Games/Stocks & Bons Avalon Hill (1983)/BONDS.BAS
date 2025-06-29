1 WIDTH 250:PRINT CHR$(27)+"E"
4 DIM PINFO(5,10,1),PRC(11,9,1),CPRC(9),SPRC(9),PV(5),PO(5)
5 DEF FNJ$(L,S$)= SPACE$(L-LEN(S$))+S$
6 DEF FNC$(S$)=SPACE$((SCRW-LEN(S$))/2)+S$
7 DEF FNUPPER$(S$)=CHR$(+32*(LEFT$(S$,1)>="a")+ASC(LEFT$(S$,1)))
8 DEF FNLOWER$(S$)=CHR$(-32*(LEFT$(S$,1)<="Z")+ASC(LEFT$(S$,1)))
9 DEF FNCURSOR$(C,R)=CHR$(27)+"Y"+CHR$(31+C)+CHR$(31+R)
10 GOSUB 10000:FOR YEAR = 1 TO 11
20 GOSUB 6000
30 FOR PS=0 TO NP
40   PF=0 : PLAYER = PO(PS)
60   IF PINFO(PLAYER,10,1)<>0 THEN GOSUB 2000 :' player's move
70 NEXT PS
80 IF BC>0 AND NP-BC+1<2 GOTO 100
90 NEXT YEAR
100 'End of Game -- Print Results
110 PRINT CHR$(27)+"E";: P1$ = "END OF GAME": GOSUB 11500
120 FOR L1=0 TO NP
130   PRINT FNCURSOR$(6+L1*2,IND);: PRINT PNAM$(L1)" ";
140   PRINT STRING$(40-11-LEN(PNAM$(L1)),".");
150   PRINT USING "$$,###,###"; PINFO(L1,10,1)
160 NEXT L1
170 PRINT FNCURSOR$(23,IND);: PRINT "Play another game (y/n)";
171 AN$=INKEY$:IF AN$<>"Y" AND AN$<>"y" AND AN$<>"N" AND AN$<>"n" GOTO 171
180 IF FNUPPER$(AN$)="Y" THEN RUN ELSE PRINT CHR$(27)+"E":WIDTH 80:END
1000 '---------- Determine Dividends and Net Worth ----------
1010 FOR PLAYER=0 TO NP
1020   NW = PINFO(PLAYER,10,0)
1030   FOR L=0 TO 9
1040     IF PINFO(PLAYER,L,0) = 0 THEN 1090
1050     IF PRC(YEAR,L,0) < 50 GOTO 1080
1055      DV = INT((PINFO(PLAYER,L,0)*PRC(YEAR,L,0)*VAL(LEFT$(STCK$(L),1))+50)/100):IF L=1 THEN DV=DV+PINFO(PLAYER,L,0)*XD
1060      NW = NW + DV
1080     NW = NW + PINFO(PLAYER,L,0)*PRC(YEAR,L,0)
1090   NEXT L
1100   PV(PLAYER) = NW
1110 NEXT PLAYER
1115 'Determine player order (Richest first)
1120 FOR L1=0 TO NP
1130   HV = -1
1140   FOR L2=0 TO NP
1150     IF PV(L2) > HV THEN HV = PV(L2):S=L2
1160   NEXT L2
1170   PO(L1)=S: PV(S)=-2
1180 NEXT L1
1999 RETURN
2000 '---------- Player's Move  ----------
2010 PRINT CHR$(27)+"E";: P1$=PNAM$(PLAYER)+"'"
2020 IF FNUPPER$(RIGHT$(PNAM$(PLAYER),1))<>"S" THEN P1$=P1$+"S"
2030 P1$=P1$+" PORTFOLIO"
2040 GOSUB 11800
2050 PRINT FNCURSOR$(5,IND+19);: GOSUB 11200: PRINT "Shr   Prc    Val  Div": GOSUB 11210
2060 NW=0
2070 FOR L=0 TO 9 : GOSUB 2290 : NEXT
2080 PRINT TAB(IND+3);"Cash";STRING$(22,".");FNJ$(6,STR$(PINFO(PLAYER,10,0)))
2082 PRINT TAB(IND+30);STRING$(5,95)
2084 NW = NW + PINFO(PLAYER,10,0)
2086 PINFO(PLAYER,10,1) = NW
2088 PRINT FNCURSOR$(18,IND+18);: PRINT "Net Worth.."; FNJ$(6,STR$(NW))
2090 PF=1
2100  IF PINFO(PLAYER,10,1)<1 THEN PINFO(PLAYER,10,1)=0:PRINT FNCURSOR$(20,IND);: PRINT PNAM$(PLAYER);" is BANKRUPT and ELIMINATED": BC=BC+1 : GOTO 2120
2110 IF YEAR < 11 THEN GOSUB 2350: RETURN
2120 GOSUB 11000: RETURN
2290 '---------- Display Holdings in Stock L
2300 PRINT TAB(IND);
2301 IF PINFO(PLAYER,L,0)=0 THEN P1$="":P3$="":P4$="":HV=0:GOTO 2320
2302 IF PF=1 THEN DV=PD(L):GOTO 2308
2303 IF PRC(YEAR,L,0)<50 THEN P4$="":GOTO 2310
2304 DV=INT((PINFO(PLAYER,L,0)*PRC(YEAR,L,0)*VAL(LEFT$(STCK$(L),1))+50)/100):IF L=1 THEN DV=DV+PINFO(PLAYER,L,0)*XD
2305 PINFO(PLAYER,10,0) = PINFO(PLAYER,10,0)+DV
2306 PD(L)=DV
2308 IF DV=0 THEN P4$="" ELSE P4$=STR$(DV)
2310 P1$= STR$(PINFO(PLAYER,L,0)): HV = PINFO (PLAYER,L,0) * PRC(YEAR,L,0): P3$=STR$(HV)
2320 P2$ = STR$ (PRC(YEAR,L,0))
2330 PRINT STCK$(L);TAB(IND+15);FNJ$(7,P1$);FNJ$(6,P2$);FNJ$(7,P3$);FNJ$(5,P4$)
2335 NW=NW+HV
2340 RETURN
2350 '---------- Player Move Dialogue
2360 GOSUB 3900
2370 PRINT FNCURSOR$(19,  1):PRINT TAB(IND);"Select Action:  ";"1 - Buy and Sell Securities"
2380 PRINT TAB(IND+16);"2 - Display Price History"
2390 PRINT TAB(IND+16);"3 - Security Review"
2400 PRINT TAB(IND+16);"4 - Instructions"
2410 PRINT TAB(IND+16);"5 - End Turn"; 
2420 AN$=INKEY$:IF AN$<"1" OR AN$>"5" THEN GOTO 2420
2430 IF AN$="1" THEN GOSUB 3000: GOTO 2350
2440 IF AN$="2" THEN GOSUB 4000: GOTO 2000
2450 IF AN$="3" THEN GOSUB 9000: GOTO 2000
2460 IF AN$="4" THEN GOSUB 9500: GOTO 2000
2470 IF AN$="5" THEN RETURN
2480 GOTO 2420
2999 RETURN
3000 '---------- Buy and Sell Securities
3010 GOSUB 3900
3020 PRINT FNCURSOR$(20,  1):PRINT TAB(IND);"Type first 2 letters of stock name, then RETURN."
3030 PRINT TAB(IND);"(Press RETURN without stock name to exit.  >";
3040 AN$=""
3045 ANN$=INKEY$:IF ANN$="" THEN GOTO 3045 ELSE IF ANN$=CHR$(13) OR (FNUPPER$(ANN$)="N" AND LEN(AN$)=0) THEN RETURN 
3050 PRINT ANN$;:AN$=AN$+ANN$:IF LEN(AN$)<2 THEN GOTO 3045
3060 GOSUB 11100 '-- Adjust AN$ for comparison
3070 FOR L=0 TO 9: IF LEFT$(AN$,2)=MID$(STCK$(L),4,2) GOTO 3100
3080 NEXT: GOTO 3040
3100 PRINT FNCURSOR$(L+5,1);:PRINT CHR$(27)+")";:GOSUB 2290:PRINT CHR$(27)+"(";
3110 IF L>0 THEN T$="shares" ELSE T$="bonds":FOR PAUSE=1 TO 1000:NEXT
3115 GOSUB 3900
3130 IF L=0 THEN HV = INT (PINFO(PLAYER,10,0) / PRC (YEAR,L,0)) : GOTO 3170
3140 IF PRC(YEAR,L,0)=0 THEN HV=0: GOTO 3170
3150 HV = INT(PINFO(PLAYER,10,0) / PRC(YEAR,L,0) / 10) * 10
3170 PRINT FNCURSOR$(20,IND);"You may buy up to";FNJ$(5,STR$(HV));" ";T$
3175 IF PINFO(PLAYER,L,0)=0 THEN PRINT SPC(SCRW*2-1): GOTO 3220
3180 PRINT TAB(IND);"You may sell up to";FNJ$(5,STR$(-PINFO(PLAYER,L,0)));" ";T$
3190 IF L=0 THEN  GOTO 3220
3200 HP = INT(PINFO(PLAYER,L,1)/PINFO(PLAYER,L,0)+.5)
3210 PRINT TAB(IND);: PRINT USING "You paid $$## per share"; HP 
3220 PRINT TAB(IND);"How many ";T$;: INPUT AN$
3230 IF AN$="" GOTO 3330
3240 AN = VAL (AN$): IF L=0 THEN GOTO 3260
3250 AN = INT(AN/10)*10: IF AN<0 AND RIGHT$(AN$,1)<>"0" THEN AN=AN+10
3260 IF AN > HV OR AN < -PINFO(PLAYER,L,0) GOTO 3115
3270 PD (L)=0
3280 PINFO(PLAYER,L,0) = PINFO(PLAYER,L,0)+AN: PINFO(PLAYER,10,0)=PINFO(PLAYER,10,0) - (AN * PRC(YEAR,L,0))
3290 IF AN < 0 THEN PINFO(PLAYER,L,1)=PINFO(PLAYER,L,1)+AN*HP: GOTO 3310
3300 PINFO(PLAYER,L,1)=PINFO(PLAYER,L,1)+AN*PRC(YEAR,L,0)
3310 PRINT FNCURSOR$(16,IND+29);: PRINT FNJ$(6,STR$(PINFO(PLAYER,10,0)))
3330 PRINT FNCURSOR$(L+5,1):GOSUB 2290
3340 GOTO 3000
3900 PRINT FNCURSOR$(19,1):FOR ILINE=19 TO 23:PRINT SPC(79);:IF ILINE<>23 THEN PRINT:NEXT
3999 RETURN
4000 '---------- Display Stock Price History
4010 PRINT CHR$(27)+"E";: P1$="PRICE HISTORY": GOSUB 11500
4020 PRINT FNCURSOR$(6,IND);
4030 FOR L3=1 TO 9: PRINT FNCURSOR$(6+L3,IND);: PRINT " ";L3;" - ";SNAM$(L3): NEXT
4040 PRINT FNCURSOR$(17,IND);: PRINT STRING$(40,61)
4050 PRINT FNCURSOR$(18,IND);: PRINT "Enter selection by number,"
4060 PRINT FNCURSOR$(19,IND);: PRINT "or press RETURN to play on...";
4070 AN$=INKEY$: IF AN$="" THEN 4070
4080 IF AN$=CHR$(13) THEN RETURN
4090 IF LEN(A$)>1 THEN 4070
4100 IF "1" > AN$ OR AN$ > "9" THEN 4070
4110 AN=VAL(AN$)
4120 PRINT CHR$(27)+"E";: P1$=SNAM$(AN): GOSUB 11500
4125 GOSUB 4400
4130 FOR L3=1 TO YEAR
4140   P=PRC(L3,AN,1)
4145   IF P>0 THEN SPLIT=1 ELSE P=PRC(L3,AN,0): SPLIT=0
4150   GOSUB 4500
4160 NEXT L3
4170 GOSUB 11000
4180 GOTO 4010
4400 '----- draw graph box
4405 REM
4410 FOR L3=IND-2 TO IND+40:PRINT FNCURSOR$(5,L3);"-";FNCURSOR$(22,L3);"-";:NEXT
4415 PRINT
4420 FOR L3=6 TO 21:PRINT FNCURSOR$(L3,IND-7);:PRINT USING "###";10*(21-L3);:PRINT " ";"|";:PRINT FNCURSOR$(L3,IND+41);"|";" ";:PRINT USING LEFT$("###",2+(10*(21-L3))\100);10*(21-L3) :NEXT L3
4425 PRINT
4430 PRINT FNCURSOR$(5,IND-3);"+"
4432 PRINT FNCURSOR$(5,IND+41);"+"
4434 PRINT FNCURSOR$(22,IND-3);"+"
4436 PRINT FNCURSOR$(22,IND+41);"+"
4490 RETURN
4500 '----- Display this year's bar
4510 H=IND+(L3-1)*4
4512 PRINT FNCURSOR$(21,H);"=":IF P<=5 THEN GOTO 4590
4520 TOP=INT((P-5)/10): RES=(P-5) MOD 10
4530 IF TOP>16 THEN TOP=16: RES=0
4540 FOR Y=1 TO TOP
4550  PRINT FNCURSOR$(21-Y,H);CHR$(27)+")"+" "
4560 NEXT Y
4570 IF 1 <= RES AND RES <= 3 THEN PRINT FNCURSOR$(21-TOP-1,H);: PRINT CHR$(27)+"("+"_"
4575 IF 4 <= RES AND RES <= 6 THEN PRINT FNCURSOR$(21-TOP-1,H);: PRINT CHR$(27)+")"+"="
4580 IF 7 <= RES THEN PRINT FNCURSOR$(21-TOP-1,H);:PRINT CHR$(27)+")"+"="
4590 IF SPLIT=1 THEN P=PRC(L3,AN,0)
4600 PRINT FNCURSOR$(23,H);: PRINT CHR$(27)+"(";:PRINT USING "###";P;
4610 IF SPLIT=0 THEN RETURN
4630 PRINT FNCURSOR$(21-INT(P/10)-1,H-1);: PRINT "2:1" 
4650 RETURN
6000 '---------- Determine Market --------
6020 FBB = 0: IF BBCRD(YEAR-1) > 18 THEN FBB=1 '-- bull=0, bear=1
6030 FOR L1=1 TO 9
6040 DICE = INT(6*RND(1)+1)+INT(6*RND(1)+1): IF DICE = 2 OR DICE = 12 GOTO 6060
6050 D=DICE-2: CPRC(L1)=CALC%(FBB,D,L1): NEXT L1: GOTO 7080
6060 D=DICE-2:FOR L1=1 TO 9: CPRC(L1)=CALC%(FBB,D,L1):NEXT L1
6070 GOTO 7080
6999 RETURN
7000 '---------- Display BULL or BEAR MARKET
7001 PRINT CHR$(27)+"E";:P1$="BULL MARKET"
7006 GOTO 7050
7025 PRINT CHR$(27)+"E";:P1$="BEAR MARKET"
7050 FOR XI=1 TO 15:PRINT:NEXT XI :GOSUB 11500: PRINT CHR$(7);
7075 RETURN
7080 '---------- Display Bull/Bear and Market conditions
7085 PRINT CHR$(27)+"E";
7090 IF FBB=0 THEN GOSUB 7000 ELSE GOSUB 7025
7100 FOR PAUSE=1 TO  500: NEXT PAUSE: PRINT CHR$(27)+"E";: FOR PAUSE=1 TO 300: NEXT PAUSE
7140 PRINT CHR$(27)+"E";: P1$="MARKET SITUATION": GOSUB 11800
7143 PRINT: PRINT: XD = 0
7145 ON BBCRD(YEAR-1) GOSUB 7305,7345,7405,7445,7515,7580,7620,7670,7716,7720,7775,7825,7865,7925,7975,8040,8080,8120,8170,8210,8260,8300,8340,8380,8435,8475,8530,8590,8635,8685,8725,8775,8810,8870,8910,8960
7150 GOSUB 11210: GOSUB 11000
7155 '-- Compute new prices
7160 FOR L1 = 1 TO 9
7165   IF PRC(YEAR-1,L1,0)=0 THEN PRC(YEAR,L1,0)=100+CPRC(L1)+SPRC(L1):GOTO 7210
7170   PRC(YEAR,L1,0)=PRC(YEAR-1,L1,0)+CPRC(L1)+SPRC(L1)
7175   IF PRC(YEAR,L1,0) > 0 GOTO 7190
7180   PRINT CHR$(27)+"E";: PRC(YEAR,L1,0)=0: PRINT FNCURSOR$(5,1);: PRINT FNC$(SNAM$(L1))
7181   PRINT FNCURSOR$(7,1);: PRINT FNC$("is BANKRUPT ... stock declared WORTHLESS");
7182   FOR L2=0 TO NP: PINFO(L2,L1,0)=0: NEXT L2
7183   FOR F = 100 TO 20 STEP -5: SOUND 15*F,1: NEXT
7185   SOUND 40,16: GOSUB 11000: GOTO 7210
7190  IF PRC(YEAR,L1,0) < 150 GOTO 7210 '-- check for stock split
7195  PRC(YEAR,L1,1) = PRC(YEAR,L1,0): PRC(YEAR,L1,0)=INT(PRC(YEAR,L1,0)/2+.5)
7197  FOR PLAYER=0 TO NP: PINFO(PLAYER,L1,0)=PINFO(PLAYER,L1,0)*2: NEXT PLAYER
7210 NEXT L1
7225 '-- Display changes and new prices
7226 PRINT CHR$(27)+"E";: P1$ = "PRICE CHANGE BOARD": GOSUB 11800
7228 GOSUB 11200
7229 PRINT FNCURSOR$(6,IND);: PRINT SPC(12);"   Old   Reg   Spc      New"
7230 PRINT FNCURSOR$(7,IND);: PRINT SPC(12);"   Prc   +/-   +/-      Prc"
7231 GOSUB 11210
7232 FOR L1=0 TO 9
7235 P1=PRC(YEAR-1,L1,0):P2=CPRC(L1):P3=SPRC(L1):P4=PRC(YEAR,L1,1)
7240 PRINT FNCURSOR$(9+L1,IND);: PRINT USING "\          \ ##### "; MID$(STCK$(L1),4);P1;
7244 IF P2<>0 THEN PRINT USING "+#### "; P2; ELSE PRINT SPC(6);
7246 IF P3<>0 THEN PRINT USING "+####  ";P3; ELSE PRINT SPC(7);
7247 IF P4>0 THEN PRINT USING "###"; P4;: PC$="/###" ELSE PC$="#######"
7248 PRINT USING PC$; PRC(YEAR,L1,0)
7249 SPRC(L1)=0
7250 NEXT L1
7255 GOSUB 1000
7260 GOSUB 11000
7270 RETURN
7300 '---------- Market Scenarios ----------
7305 PRINT FNCURSOR$(7,IND);:PRINT "Company prospectors find huge, new"
7315 PRINT TAB(IND);"high-grade ore deposits."
7330 PRINT:PRINT TAB(IND); "     Uranium Enterprises, Inc. +10"
7340 SPRC(8) = 10: RETURN
7345 PRINT FNCURSOR$(7,IND);:PRINT "War scare promotes mixed activity on"
7355 PRINT TAB(IND); "Wall Street."
7370 PRINT:PRINT TAB(IND); "    Pioneer Mutual Fund       -8"
7380 PRINT:PRINT TAB(IND); "    Stryker Drilling          +8"
7390 PRINT:PRINT TAB(IND); "    Uranium Enterprises, Inc. +5"
7400 SPRC(3)=-8 : SPRC(5)=8 : SPRC(8)=5 : RETURN
7405 PRINT FNCURSOR$(7,IND);:PRINT "President announces expansion plans to"
7415 PRINT TAB(IND); "increase productive capacity 30%."
7430 PRINT:PRINT TAB(IND); "    United Auto Company +15";
7440 SPRC(7)=15 : RETURN
7445 PRINT FNCURSOR$(7,IND);:PRINT "General market rise over the last two"
7455 PRINT TAB(IND); "months."
7470 PRINT:PRINT TAB(IND); "    Growth Corporation     +8"
7480 PRINT:PRINT TAB(IND); "    Metro Properties, Inc. +5"
7490 PRINT:PRINT TAB(IND); "    Pioneer Mutual Fund    +5"
7500 PRINT:PRINT TAB(IND); "    United Auto Company    +7"
7510 SPRC(1)=8 : SPRC(2)=5 : SPRC(3)=5 : SPRC(7)=7 : RETURN
7515 PRINT FNCURSOR$(7,IND);:PRINT "Experimental nuclear power station"
7525 PRINT TAB(IND); "proves more economical than anticipated."
7530 PRINT TAB(IND); "Three electrical power companies"
7540 PRINT TAB(IND); "announce plans to build large-scale"
7550 PRINT TAB(IND); "nuclear power plants."
7565 PRINT:PRINT TAB(IND); "    Uranium Enterprises, Inc. +10"
7575 SPRC(8)=10 : RETURN
7580 PRINT FNCURSOR$(7,IND);:PRINT "Company lands ten-year contract with"
7590 PRINT TAB(IND); "large industrial equipment corporation."
7605 PRINT:PRINT TAB(IND); "    Tricity Transport +15"
7615 SPRC(6)=15 : RETURN
7620 PRINT FNCURSOR$(7,IND);:PRINT "Commission grants permission to con-"
7630 PRINT TAB(IND); "struct a new nuclear generating plant of"
7640 PRINT TAB(IND); "great capacity and efficiency."
7655 PRINT:PRINT TAB(IND); "    Valley Power & Light +5"
7665 SPRC(9)=5 : RETURN   
7670 PRINT FNCURSOR$(7,IND);:PRINT "United Auto announces new advanced-"
7680 PRINT TAB(IND); "design auto entry in the mini-car"
7690 PRINT TAB(IND); "field."
7705 PRINT:PRINT TAB(IND); "    United Auto Company +10"
7715 SPRC(7)=10 : RETURN
7716 PRINT FNCURSOR$(7,IND);:PRINT "Three-for-one split rumored.": GOTO 7700
7720 PRINT TAB(IND); "Corporation releases high profit and"
7730 PRINT TAB(IND); "sales financial report and announces"
7740 PRINT TAB(IND); "plans to invest an additional $2 million"
7745 PRINT TAB(IND); "on special research projects next year."
7760 PRINT:PRINT TAB(IND); "    Growth Corporation +8"
7770 SPRC(1)=8 : RETURN
7775 PRINT FNCURSOR$(7,IND);:PRINT "Influx of personnel of new company in"
7785 PRINT TAB(IND); "nearby town creates a severe housing"
7795 PRINT TAB(IND); "shortage."
7810 PRINT:PRINT TAB(IND); "    Shady Brooks +5"
7820 SPRC(4)=5 : RETURN
7825 PRINT FNCURSOR$(7,IND);:PRINT "National firm leases company's largest"
7835 PRINT TAB(IND); "office building."
7850 PRINT:PRINT TAB(IND); "    Metro Properties, Inc. +5"
7860 SPRC(2)=5 : RETURN
7865 PRINT FNCURSOR$(7,IND);:PRINT "Corporation announces new metal forming"
7875 PRINT TAB(IND); "process which it claims will revolu-"
7885 PRINT TAB(IND); "tionize all metal-working industries"
7895 PRINT TAB(IND); "covered by U.S. and foreign patents."
7910 PRINT:PRINT TAB(IND); "    Growth Corporation +10"
7920 SPRC(1)=10:RETURN
7925 PRINT FNCURSOR$(7,IND);:PRINT "Corporation unexpectedly relinquishes"
7935 PRINT TAB(IND); "its monopoly on its major product after"
7945 PRINT TAB(IND); "a lengthy anti-trust suit."
7960 PRINT:PRINT TAB(IND); "    Growth Corporation -10"
7970 SPRC(1)=-10 : RETURN
7975 PRINT FNCURSOR$(7,IND);:PRINT "Large petroleum corporation offers to"
7985 PRINT TAB(IND); "buy all assets for cash.  Offer is well"
7995 PRINT TAB(IND); "above book value.  Directors approve and"
8000 PRINT TAB(IND); "will submit recommendation to stock-"
8010 PRINT TAB(IND); "holders."
8025 PRINT:PRINT TAB(IND); "    Stryker Drilling +17"
8035 SPRC(5)=17:RETURN
8040 PRINT FNCURSOR$(7,IND);:PRINT "Buying wave raises the market."
8055 PRINT:PRINT TAB(IND); "    Pioneer Mutual Fund  +3"
8065 PRINT:PRINT TAB(IND); "    Valley Power & Light +4"
8075 SPRC(3)=3 : SPRC(9)=4 : RETURN
8080 PRINT FNCURSOR$(7,IND);:PRINT "Major coal company announces reduced"
8090 PRINT TAB(IND); "coal prices to electric power utilities."
8105 PRINT:PRINT TAB(IND); "    Valley Power & Light +5"
8115 SPRC(9)=5 : RETURN
8120 PRINT FNCURSOR$(7,IND);:PRINT "Intensive advertising campaign gains"
8130 PRINT TAB(IND); "company three major, long-term con-"
8140 PRINT TAB(IND); "tracts."
8155 PRINT:PRINT TAB(IND); "    Tricity Transport +10"
8165 SPRC(6)=10 : RETURN
8170 PRINT FNCURSOR$(7,IND);:PRINT "Competitor invents a new economical"
8180 PRINT TAB(IND); "automatic transmission."
8195 PRINT:PRINT TAB(IND); "    United Auto Company -5"
8205 SPRC(7)=-5 : RETURN
8210 PRINT FNCURSOR$(7,IND);:PRINT "City Council considers the company's"
8220 PRINT TAB(IND); "choicest property for large industrial"
8230 PRINT TAB(IND); "fair."
8245 PRINT:PRINT TAB(IND); "    Metro Properties, Inc. +10"
8255 SPRC(2)=10 : RETURN
8260 PRINT FNCURSOR$(7,IND);:PRINT "Public Utility Commission rejects"
8270 PRINT TAB(IND); "company's request for rate hike."
8285 PRINT:PRINT TAB(IND); "    Valley Power & Light -14"
8295 SPRC(9)=-14 : RETURN
8300 PRINT FNCURSOR$(7,IND);:PRINT "Land rights litigation holds up pro-"
8310 PRINT TAB(IND); "gress."
8325 PRINT:PRINT TAB(IND); "    Stryker Drilling -10"
8335 SPRC(5)=-10 : RETURN
8340 PRINT FNCURSOR$(7,IND);:PRINT "Internal Revenue depletion allowance"
8350 PRINT TAB(IND); "reduced 50%."
8365 PRINT:PRINT TAB(IND); "    Stryker Drilling -15"
8375 SPRC(5)=-15 : RETURN
8380 PRINT FNCURSOR$(7,IND);:PRINT "Surge of profit-taking drops stock"
8390 PRINT TAB(IND); "market."
8400 PRINT:PRINT TAB(IND); "    Growth Corporation     -8"
8410 PRINT:PRINT TAB(IND); "    Metro Properties, Inc. -5"
8420 PRINT:PRINT TAB(IND); "    United Auto Company    -7"
8430 SPRC(1)=-8:SPRC(2)=-5:SPRC(7)=-7:RETURN
8435 PRINT FNCURSOR$(7,IND);:PRINT "Company moves to a new, excellent"
8445 PRINT TAB(IND); "location."
8460 PRINT:PRINT TAB(IND); "    Tricity Transport +5"
8470 SPRC(6)=5 : RETURN
8475 PRINT FNCURSOR$(7,IND);:PRINT "Extra year-end dividend of $2 per share"
8485 PRINT TAB(IND); "declared by the board of directors."
8500 PRINT:PRINT TAB(IND); "    Growth Corporation +10"
8510 PRINT:PRINT TAB(IND); "    Stockholders $2/Share"
8520 XD=2
8525 SPRC(1)=10 : RETURN
8530 PRINT FNCURSOR$(7,IND);:PRINT "Large terminal destroyed by fire;"
8540 PRINT TAB(IND); "insufficient insurance on building due"
8550 PRINT TAB(IND); "to company's delayed move to new"
8560 PRINT TAB(IND); "location."
8575 PRINT:PRINT TAB(IND); "    Tricity Transport -25"
8585 SPRC(6)=-25 : RETURN
8590 PRINT FNCURSOR$(7,IND);:PRINT "President, Vice-President, and chief"
8600 PRINT TAB(IND); "counsel of Growth Corporation of America"
8605 PRINT TAB(IND); "reach retirement age."
8620 PRINT:PRINT TAB(IND); "    Growth Corporation -10"
8630 SPRC(1)=-10 : RETURN
8635 PRINT FNCURSOR$(7,IND);:PRINT "Government suddenly announces it will no"
8645 PRINT TAB(IND); "longer support ore prices, since it has"
8655 PRINT TAB(IND); "large stockpiles."
8670 PRINT:PRINT TAB(IND); "    Uranium Enterprises, Inc. -25"
8680 SPRC(8)=-25 : RETURN
8685 PRINT FNCURSOR$(7,IND);:PRINT "Urban renewal program delayed by"
8695 PRINT TAB(IND); "indecision of city planning commission."
8710 PRINT:PRINT TAB(IND); "    Metro Properties, Inc. -10"
8720 SPRC(2)=-10 : RETURN
8725 PRINT FNCURSOR$(7,IND);:PRINT "Two founders and major stockholders of"
8735 PRINT TAB(IND); "the corporation disagree on policy."
8745 PRINT TAB(IND); "One sells out his entire holdings."
8760 PRINT:PRINT TAB(IND); "    Growth Corporation -8"
8770 SPRC(1)=-8 : RETURN
8775 PRINT FNCURSOR$(7,IND);:PRINT "Foreign car rage hits the buying public."
8780 PRINT TAB(IND); "Big cars in slow demand."
8795 PRINT:PRINT TAB(IND); "    United Auto Company -15"
8805 SPRC(7)=-15 : RETURN
8810 PRINT FNCURSOR$(7,IND);:PRINT "Strikes halt production in all eight"
8820 PRINT TAB(IND); "United Auto plants as U.A.W. and company";
8830 PRINT TAB(IND); "official fail to reach agreement on"
8840 PRINT TAB(IND); "labor contract."
8855 PRINT:PRINT TAB(IND); "    United Auto Company -15"
8865 SPRC(7)=-15 : RETURN
8870 PRINT FNCURSOR$(7,IND);:PRINT "Company's annual report shows net"
8880 PRINT TAB(IND); "earnings off during fourth quarter."
8895 PRINT:PRINT TAB(IND); "    Metro Properties, Inc. -5"
8905 SPRC(2)=-5 : RETURN
8910 PRINT FNCURSOR$(7,IND);:PRINT "Community steadily deteriorates.  The"
8920 PRINT TAB(IND); "management is forced to lower rental"
8930 PRINT TAB(IND); "rates to attract tenants."
8945 PRINT:PRINT TAB(IND); "    Shady Brooks -5"
8955 SPRC(4)=-5 : RETURN
8960 PRINT FNCURSOR$(7,IND);:PRINT "President hospitalized in sanatorium for"
8970 PRINT TAB(IND); "an indefinite period."
8985 PRINT:PRINT TAB(IND); "    Tricity Transport -5"
8995 SPRC(6)=-5 : RETURN
9000 '---------- Security Review
9001 HIPAGENR=10:P=1
9002 PRINT CHR$(27)+"E";
9004 P1$="SECURITIES REVIEW": GOSUB 11500
9014 IF P=0 THEN RETURN
9016 PRINT FNCURSOR$(5,IND);: PRINT SNAM$(P-1);SPC(32-LEN(SNAM$(P-1)));
9018 IF VAL(LEFT$(STCK$(P-1),1))=0 THEN PRINT "No Yield"                                  ELSE PRINT "Yield ";LEFT$(STCK$(P-1),2);
9020 GOSUB 11210
9022 ON P GOSUB 9034,9042,9058,9070,9080,9086,9096,9112,9132,9140
9030 PRINT FNCURSOR$(22,1)
9032 GOSUB 11600:GOSUB 11700:GOTO 9002
9033 '-----
9034 PRINT FNCURSOR$(7,IND);: PRINT "An AAA bond with a good yield.  This    "
9036 PRINT TAB(IND);"investment represents extreme security  "
9038 PRINT TAB(IND);"and good income, but, of course, no     "
9040 PRINT TAB(IND);"appreciation.";SPC(27);: RETURN
9041 '----------
9042 PRINT FNCURSOR$(7,IND);: PRINT "A well-established company with a pheno-"
9044 PRINT TAB(IND);"menal growth record.  It is an expanding"
9046 PRINT TAB(IND);"industry, spends a lot of money on re-  "
9048 PRINT TAB(IND);"search, and is expected to continue its "
9050 PRINT TAB(IND);"growth pattern.  The company's policy of"
9052 PRINT TAB(IND);"reinvesting earnings causes low yield.  "
9054 PRINT TAB(IND);"The price-to-earnings ratio of this     "
9056 PRINT TAB(IND);"stock is extremely high.";SPC(16); : RETURN
9057 '----------
9058 PRINT FNCURSOR$(7,IND);: PRINT "An investment representing good pros-   "
9060 PRINT TAB(IND);"pects of high appreciation.  No divi-   "
9062 PRINT TAB(IND);"dends are expected in the immediate     "
9064 PRINT TAB(IND);"future.  However, the city's proposed   "
9066 PRINT TAB(IND);"urban renewal program could have great  "
9068 PRINT TAB(IND);"effect on earnings.";SPC(20);: RETURN
9069 '----------
9070 PRINT FNCURSOR$(7,IND);: PRINT "A common stock mutual fund offer-       "
9072 PRINT TAB(IND); "ed by a large mututal fund company.  It "
9074 PRINT TAB(IND); "has a good yield of 4%.  Stock in this  "
9076 PRINT TAB(IND); "fund represents a good, steady income,  "
9078 PRINT TAB(IND); "but only a fair appreciation investment.": RETURN
9079 '----------
9080 PRINT FNCURSOR$(7,IND);: PRINT "A real estate investment representing   "
9082 PRINT TAB(IND); "extremely high income, but steadily de- "
9084 PRINT TAB(IND); "preciating capital assets.              ": RETURN
9085 '----------
9086 PRINT FNCURSOR$(7,IND);: PRINT "A stock representing extremely specula- "
9088 PRINT TAB(IND); "tive investment.  Profits go toward     "
9090 PRINT TAB(IND); "drilling new oil wells, so no dividends "
9092 PRINT TAB(IND); "are expected.  This stock could be worth"
9094 PRINT TAB(IND); "rags or riches.";SPC(24);: RETURN
9095 '----------
9096 PRINT FNCURSOR$(7,IND);: PRINT "A stock representing a high appreciation"
9098 PRINT TAB(IND); "investment prospect with a good stable  "
9100 PRINT TAB(IND); "outlook depending on the administrative "
9102 PRINT TAB(IND); "ability and ambition of its respected,  "
9104 PRINT TAB(IND); "ethical, and energetic young president. "
9106 PRINT TAB(IND); "As all profits go back into the company,"
9108 PRINT TAB(IND); "dividends are not expected to be de-    "
9110 PRINT TAB(IND); "clared in the forseeable future.        ": RETURN
9111 '----------
9112 PRINT FNCURSOR$(7,IND);: PRINT "A medium large company in the large,    "
9114 PRINT TAB(IND); "oligopolistic automobile industry.      "
9116 PRINT TAB(IND); "United Auto, like others in the indus-  "
9118 PRINT TAB(IND); "try, is subject to the whims of public  "
9120 PRINT TAB(IND); "fancy.  Stock in this company represents"
9122 PRINT TAB(IND); "a somewhat speculative investment with a"
9124 PRINT TAB(IND); "good growth pattern.  Because it is pop-"
9126 PRINT TAB(IND); "ular with the investing public, it has  "
9128 PRINT TAB(IND); "a fairly high price-to-earnings ratio   "
9130 PRINT TAB(IND); "and low yield.";SPC(25); : RETURN
9131 '----------
9132 PRINT FNCURSOR$(7,IND);: PRINT "A highly speculative, high income stock "
9134 PRINT TAB(IND); "ideal for the short or medium term in-  "
9136 PRINT TAB(IND); "vestor.  Its long term prospects are    "
9138 PRINT TAB(IND); "fair to poor.";SPC(26);:RETURN
9139 '----------
9140 PRINT FNCURSOR$(7,IND);: PRINT "A stable, steadily growing public util- "
9142 PRINT TAB(IND); "ity company located in a well-establish-"
9144 PRINT TAB(IND); "ed, healthy industrial area.  Stock in  "
9146 PRINT TAB(IND); "this company represents a safe, medium  "
9148 PRINT TAB(IND); "yield, medium growth investment.        ": RETURN
9500 '---------- Instructions ----------
9502 P=1
9505 PRINT CHR$(27)+"E";
9510 P1$="INSTRUCTIONS": GOSUB 11500
9550 HIPAGENR=3
9565 IF P=0 THEN RETURN
9575 PRINT FNCURSOR$(3,IND+34);: PRINT USING "Page #";P;
9580 ON P GOSUB 9600,9700,9800
9583 GOSUB 11600
9585 GOSUB 11700:GOTO 9505
9600 ' page 1
9606 PRINT:PRINT:PRINT TAB(IND);CHR$(27)+")PLAY"+CHR$(27)+"(. During each of the 10 years of   "
9608 PRINT TAB(IND);"play, each player invests in securities "
9610 PRINT TAB(IND); "at the current market price for the     "
9612 PRINT TAB(IND); "year.  As a guide in selecting invest-  "
9614 PRINT TAB(IND); "ments, players should consult the secur-"
9616 PRINT TAB(IND); "ites review and price history graphs.   "
9618 PRINT TAB(IND); "All stock is sold only in blocks of 10  "
9620 PRINT TAB(IND); "shares.  Player turn sequence is in net "
9622 PRINT TAB(IND); "worth order.  Wealthiest Player goes    "
9624 PRINT TAB(IND); "first.  All players start the game with "
9626 PRINT TAB(IND); "$5000 cash.                             "
9628 PRINT TAB(IND); BLINE$
9630 PRINT TAB(IND);CHR$(27)+")ESTABLISHING BULL OR BEAR MARKET";CHR$(27)+"(. Compu-"
9634 PRINT TAB(IND); "ter will determine the market for each  "
9636 PRINT TAB(IND); "year.  The chances are 50/50 for a BULL "
9638 PRINT TAB(IND); "or BEAR market.                         "
9640 RETURN
9700 ' page 2
9702 PRINT:PRINT:PRINT TAB(IND);CHR$(27)+")DETERMINING CURRENT MARKET PRICE OF"+CHR$(27)+"("
9704 PRINT TAB(IND);CHR$(27)+")STOCKS"+CHR$(27)+"(.  Computer will determine how many"
9710 PRINT TAB(IND); "points each stock rises or falls for the"
9712 PRINT TAB(IND); "year.  In addition to the normal yearly "
9714 PRINT TAB(IND); "changes, prices are further adjusted by "
9716 PRINT TAB(IND); "special yearly situations.              "
9718 PRINT TAB(IND); BLINE$ 
9722 PRINT TAB(IND);CHR$(27)+")DIVIDENDS AND INTEREST"+CHR$(27)+"("
9724 PRINT TAB(IND); "At the beginning of each year, dividends"
9726 PRINT TAB(IND); "and interest will be posted to each     "
9728 PRINT TAB(IND); "player's cash account.  If the price of "
9730 PRINT TAB(IND); "a stock drops below $50, players holding"
9732 PRINT TAB(IND); "that stock receive no dividends.  When  "
9734 PRINT TAB(IND); "the price again reaches $50, the payment"
9736 PRINT TAB(IND); "of dividends is resumed.                "
9738 PRINT TAB(IND); BLINE$ 
9740 RETURN
9800 ' page 3
9802 PRINT:PRINT:PRINT TAB(IND);CHR$(27)+")STOCK SPLITS";CHR$(27)+"(.  When the price of a stock"
9806 PRINT TAB(IND); "reaches $150 or more, the stock splits  "
9808 PRINT TAB(IND); "2-for-1.  The price of the stock is     "
9810 PRINT TAB(IND); "halved and the number of shares in that "
9812 PRINT TAB(IND); "stock held by each player is doubled.   "
9814 PRINT TAB(IND); BLINE$ 
9816 PRINT TAB(IND)+CHR$(27)+")WORTHLESS STOCK"+CHR$(27)+"(.  When the price of a"
9820 PRINT TAB(IND); "stock drops to $0 or below, the corpor- "
9822 PRINT TAB(IND); "ation is declared bankrupt.  Players    "
9824 PRINT TAB(IND); "owning this stock lose all shares.  The "
9826 PRINT TAB(IND); "price of the stock is re-established the"
9828 PRINT TAB(IND); "following year.                         "
9830 PRINT TAB(IND); BLINE$ 
9832 PRINT TAB(IND);CHR$(27)+")CLOSINGS"+CHR$(27)+"(.  At the end of the 10 years,"
9836 PRINT TAB(IND); "closing prices are posted and the player"
9838 PRINT TAB(IND); "with the most net worth wins the game.  "
9840 RETURN
10000 '---------- Initialization ----------
10010 ' Determine Screen Width and Indent Value
10011 PRINT CHR$(27)+"E";
10014 SCRW=80: PRINT SPC(41);: IF POS(0) < 40 THEN SCRW=40
10016 IND = (SCRW-40)/2+1: BLINE$=STRING$(40," ")
10018 ' Announce Game and play song
10030 PRINT CHR$(27)+"E";
10032 PRINT FNCURSOR$(15,IND+10);:PRINT "Setting up game...."
10070 DIM CALC%(1,10,9)
10080 FOR L1=0 TO 1 : FOR L2=0 TO 10: FOR L3=1 TO 9
10090   READ CALC%(L1,L2,L3)
10100 NEXT: NEXT: NEXT
10110 DIM STCK$(9)
10120 STCK$(0) = "5% City Bonds"
10130 STCK$(1) = "1% Growth Corp"
10140 STCK$(2) = "0% Metro Prop"
10150 STCK$(3) = "4% Pioneer Mutl"
10160 STCK$(4) = "7% Shady Brooks"
10170 STCK$(5) = "0% Stryker Drlg"
10180 STCK$(6) = "0% Tricity Tran"
10190 STCK$(7) = "2% United Auto"
10200 STCK$(8) = "6% Uranium Ent"
10210 STCK$(9) = "3% Valley Power"
10220 FOR L1=0 TO 11: PRC(L1,0,0) = 1000: NEXT
10230 FOR L1=1 TO 9:  PRC(0,L1,0) = 100: NEXT
10240 DIM SNAM$(9)
10250 SNAM$(0) = "CENTRAL CITY MUNICIPAL BONDS"
10260 SNAM$(1) = "GROWTH CORPORATION OF AMERICA"
10270 SNAM$(2) = "METRO PROPERTIES, INC."
10280 SNAM$(3) = "PIONEER MUTUAL FUND"
10290 SNAM$(4) = "SHADY BROOKS DEVELOPMENT"
10300 SNAM$(5) = "STRYKER DRILLING COMPANY"
10310 SNAM$(6) = "TRICITY TRANSPORT COMPANY"
10320 SNAM$(7) = "UNITED AUTO COMPANY"
10330 SNAM$(8) = "URANIUM ENTERPRISES INC."
10340 SNAM$(9) = "VALLEY POWER & LIGHT COMPANY"
10350 ' Bull market calculator data
10360 DATA -2, -10, -7, -9, -2, -9, -7, -16, -4
10370 DATA 26, 16, 25, 8, -14, 21, 14, -4, 17
10380 DATA 18, 23, 11, 12, 46, 18, -5, 34, 15
10390 DATA 23, 28, -2, 11, 56, 19, 30, 29, 14
10400 DATA 20, 15, 15, 7, -20, 15, 13, -10, 12
10410 DATA 17, 21, 13, -2, 37, 23, 23, 19, 14
10420 DATA 19, 24, 17, 9, -5, 26, 13, -7, 15
10430 DATA 11, 18, 14, 11, 67, 15, 22, 18, 13
10440 DATA 13, 31, 1, 14, -11, 18, 18, -14, 10
10450 DATA 14, -8, 19, -1, -9, 25, -10, 13, 19
10460 DATA 24, 24, 23, 20, 51, 27, 38, 33, 18
10470 'Bear market calculator data
10480 DATA 12, 14, 13, 10, 10, 20, 21, 25, 8
10490 DATA 7, -6, 10, -10, 30, 6, 19, 22, 2
10500 DATA 9, 10, 7, -5, -20, 12, 21, 18, 7
10510 DATA 7, 8, 5, -6, -40, 3, 16, -14, 4
10520 DATA 8, 6, 4, -4, 40, 8, 4, -12, 3
10530 DATA 6, 4, 3, 3, -15, 5, 8, -8, 5
10540 DATA 5, 7, -1, -3, 45, 6, -10, 10, 4
10550 DATA -2, 6, -3, 8, -20, 7, 10, 14, 6
10560 DATA 11, 11, -5, -7, 30, 10, -11, -18, -4
10570 DATA -5, 13, -8, 6, 25, 4, 18, -22, -4
10580 DATA -8, -10, -10, -15, -20, -20, -23, -25, -7
10590 DIM BBCRD(10)
10595 GOSUB 11000
10600 FOR L1=1 TO 11 : ' Generate 11 unique scenarios (range 1 to 36)
10610   RN = INT (36*RND(1)+1)
10620   L2 = 0
10630   IF BBCRD(L2) = 0 THEN BBCRD(L2) = RN: GOTO 10660
10640   IF BBCRD(L2) = RN THEN GOTO 10610
10650   L2 = L2 + 1 : GOTO 10630
10660 NEXT
10661 PRINT CHR$(27)+"E";FNCURSOR$(6,1)
10695 PRINT FNCURSOR$(15,IND+2);:PRINT "Would you like instructions? (y/n) ";
10696 AN$=INKEY$
10697 IF AN$ = "y" OR AN$ = "Y" THEN GOSUB 9500 ELSE IF AN$ = "n" OR AN$ = "N" THEN GOTO 10698 ELSE GOTO 10696
10698 PRINT CHR$(27)+"E";: PRINT FNCURSOR$(15,IND);: PRINT "How many investors (1 to 6)";
10699 NP$=INKEY$:IF NP$="" THEN GOTO 10699 ELSE NP=ASC(NP$):IF NP<49 OR NP>54 THEN GOTO 10699 ELSE NP=NP-48
10700 PRINT " "
10710 NP = NP-1
10720 FOR L = 0 TO NP: PINFO(L,10,0) = 5000: PINFO(L,10,1) = 5000 : NEXT
10730 PRINT FNCURSOR$(15,IND);: PRINT "Enter their names (up to 10 characters):"
10740 DIM PNAM$(NP): FOR L1 = 0 TO NP
10750 PRINT TAB(IND);"Investor #"; L1+1; ":"; : INPUT " ",PNAM$(L1)
10760 IF LEN(PNAM$(L1)) < 1 OR LEN(PNAM$(L1)) > 10 THEN PRINT TAB(IND);CHR$(7);"     Name missing or too long. Try again.": GOTO 10750
10770 FOR L2=0 TO L1-1: IF PNAM$(L1)=PNAM$(L2) THEN PRINT TAB(IND);CHR$(7);"     Duplicate name; please use another name.": GOTO 10750
10780 NEXT L2:FOR L3=1 TO LEN(PNAM$(L1)): MID$(PNAM$(L1),L3,1)=FNUPPER$(MID$(PNAM$(L1),L3,1)):  NEXT L3:NEXT L1
10999 RETURN
11000 '---------- Pause for any key
11010 PRINT FNCURSOR$(23,1):PRINT TAB(IND+5);"Press any key to continue...";
11020 IF INKEY$ = "" THEN SEED=(SEED+10*RND(1)) MOD 32717:GOTO 11020
11030 PRINT FNCURSOR$(22,1):PRINT TAB(IND+5);SPC(40);:RANDOMIZE SEED
11040 RETURN
11100 '---------- Adjust AN$ for Name Comparison
11102 AN$=AN$+"  "
11104 AN$=FNUPPER$(AN$)+FNLOWER$(MID$(AN$,2,1))
11106 RETURN
11200 '---------- Display:  BOLD on
11202  RETURN
11210 '---------- Display:  BOLD off
11212 RETURN
11220 '---------- Display:  REVERSE on
11222 PRINT CHR$(27)+")";:RETURN
11230 '---------- Display:  REVERSE off
11232 PRINT CHR$(27)+"(";:RETURN
11240 '---------- Display:  BLINK on
11242 RETURN
11250 '---------- Display:  BLINK off
11252 RETURN
11500 '---------- Display P1$ in box, centered and reversed
11505 'graphics mode
11510 LP1=LEN(P1$)
11515 XIND=INT((40-(LP1+6))/2)+IND
11520 PRINT
11525 PRINT TAB(XIND);"+";STRING$(LP1+4,61);"+"
11535 PRINT TAB(XIND);"|";"  ";P1$;"  ";"|"
11545 PRINT TAB(XIND);"+";STRING$(LP1+4,61);"+"
11550 'return to text mode
11555 RETURN
11600 '---------- Display paging instructions
11605 PRINT
11610 PRINT "     Press SPACE for next page, BACKSPACE for previous, RETURN to play.";
11625 RETURN
11700 '---------- Handle paging controls
11705 'set HIPAGENR to number of highest page.  P is returned in [1,HIPAGENR].
11710 'if P=0 on return, ESC was depressed.
11715 CMD$=INKEY$: IF CMD$="" GOTO 11715
11720 IF CMD$=CHR$(13) THEN P=0: RETURN
11725 IF CMD$=CHR$(32) THEN P=P+1 : GOTO 11735
11730 IF CMD$=CHR$(8)  THEN P=P-1 ELSE GOTO 11715
11735 IF P<1 THEN P=HIPAGENR ELSE IF P>HIPAGENR THEN P=1
11740 RETURN
11800 '---------- Display P1$ Boxed with Year or Closing Appended
11810 P1$=P1$ + " -- "
11820 IF YEAR > 10 THEN P2$=  "CLOSING" ELSE P2$=  "YEAR"+STR$(YEAR)
11830 P1$=P1$+P2$: GOSUB 11500
11840 RETURN
 