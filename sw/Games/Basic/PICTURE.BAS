10	PRINT
15	E$=CHR$(27):
20	CLS$=CHR$(26):
25	GY$=E$+"g":
30	GN$=E$+"G":
35	DY$=E$+")":
40	DN$=E$+"(":
45	PRINT CLS$
50	PRINT:PRINT:PRINT:
55	PRINT DY$ "THIS PROGRAM WILL TAKE YOU TO"
60	PRINT:PRINT DN$ "    THE CASTLE!"
65	PRINT:PRINT:PRINT:
70	PRINT DY$ "JUST PRESS THE";
75	PRINT DN$ " RETURN ";
80	PRINT DY$ "KEY AND THE PICTURE"
85	PRINT "WILL CHANGE FOR YOU"
90	PRINT:PRINT:PRINT:PRINT:
95	PRINT"press ";
96      PRINT DN$ "RETURN ";
97      PRINT DY$;
98      PRINT:INPUT "to begin",X$:PRINT CLS$
100 GOTO 882
780	PRINT:INPUT" ",X$:PRINT CLS$
785	REM CASTLE
790	PRINT:PRINT:PRINT:PRINT:
795	PRINT"         .        .        ."
800	PRINT"         >>       >>       >>"
805	PRINT"         |        |        |"
810	PRINT"         |        |        |"
815	PRINT"        ===      ===      ==="
820	PRINT"        ===      ===      ==="
825	PRINT"       ======================="
830	PRINT"       == ======== ======== =="
835	PRINT"       == ======== ======== =="
840	PRINT"       ======================="
845	PRINT"       =========+++++========="
850	PRINT"       ========-|   |-========"
855	PRINT"       == =====-|   |-===== =="
860	PRINT"______________________________________"
865	PRINT:PRINT:PRINT:PRINT DY$ "CONGRADULATIONS.  THE CASTLE IS YOURS."
870	PRINT DN$
875	PRINT:INPUT" ",X$:PRINT CLS$
876 PRINT"WOULDN'T IT BE FUN TO TRY IT ALL AGAIN?"
877 PRINT:PRINT:PRINT"MAYBE THIS TIME YOU COULD ENTER SOME WRONG NUMBERS"
878 PRINT"JUST TO SEE WHAT HAPPENS."
879 PRINT:PRINT:PRINT"OR, IF YOU JUST LIKE THE CASTLE,"
880 PRINT:PRINT"            ENTER `B:PICTURE.BAS'"
881 END
882	REM ALPHABET
885	PRINT:PRINT:PRINT:PRINT:
890	PRINT"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
895	PRINT:PRINT:PRINT:PRINT:
900	PRINT"a b c d e f g h i j k l m n o p q r s t u v w x y z"
901 PRINT:PRINT:PRINT DY$ "                         ALPHABET"
902 PRINT DN$
905	PRINT:INPUT" ",X$:PRINT CLS$
910	FOR LOOP1=1 TO 10
915		PRINT:PRINT:
920		PRINT"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
925		PRINT:PRINT:
930		PRINT"a b c d e f g h i j k l m n o p q r s t u v w x y z"
935		PRINT:PRINT:
940		FOR LOOP2=1 TO 2
945			PRINT DY$
950			PRINT"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
955			PRINT:PRINT:
960			PRINT"a b c d e f g h i j k l m n o p q r s t u v w x y z"
965			PRINT DN$
970		NEXT LOOP2
975	NEXT LOOP1
980	PRINT:INPUT" ",X$:PRINT CLS$
982 GOTO 1320
985	REM HOUSE
990	PRINT:PRINT:PRINT:PRINT:
995	PRINT"                _"
1000	PRINT"              _____"
1005	PRINT"      ^      _______              ^"
1010	PRINT"     / \    /-------\            / \   ^"
1015	PRINT"     / \     - -----             / \  / \"
1020	PRINT"     / \     - -----   ___       / \  / \"
1025	PRINT"      |      _______   ^ ^        |    |"
1030	PRINT"_____________________________________________"
1035	PRINT:PRINT:PRINT:PRINT:
1040 REM should I try some dim?
1045	PRINT"     OOPS.  MAYBE..."
1046 PRINT:INPUT" ",X$:PRINT CLS$
1047 GOTO 1870
1050	PRINT DN$
1055	PRINT:INPUT" ",X$:PRINT CLS$
1060	REM AIRPLANE
1065	PRINT:PRINT:PRINT:PRINT:
1070	PRINT"                   \/"
1075	PRINT"          |--(+)---OO---(+)--|"
1080	PRINT"                ^      ^"
1085	PRINT:INPUT" ",X$:PRINT CLS$
1090	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1095	PRINT"                   \/"
1100	PRINT"          |--(+)---OO---(+)--|"
1105	PRINT"                ^      ^"
1110	PRINT:INPUT" ",X$:PRINT CLS$
1115	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1120	PRINT"                   \/"
1125	PRINT"          |--(+)---OO---(+)--|"
1130	PRINT"                ^      ^"
1135	PRINT:PRINT:PRINT"____________________________________________________"
1140	PRINT:INPUT" ",X$:PRINT CLS$
1145	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1150	PRINT"                   \/"
1155	PRINT"          |--(+)---OO---(+)--|"
1160	PRINT"                ^      ^"
1165	PRINT:PRINT"____________________________________________________"
1170	PRINT:INPUT" ",X$:PRINT CLS$
1175	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1180	PRINT B$
1185	PRINT"                   \/"
1190	PRINT"          |--(+)---OO---(+)--|"
1195	PRINT"                ^      ^"
1200	PRINT"____________________________________________________"
1205	PRINT:INPUT" ",X$:PRINT CLS$
1210	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1215	PRINT"            ^"
1220	PRINT"            |-------=@=--O)."
1225	PRINT"                 ^     ^"
1230	PRINT"____________________________________________________"
1235	PRINT:INPUT" ",X$:PRINT CLS$
1240	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1245	PRINT"                     ^"
1250	PRINT"                     |-------=@=--O)."
1255	PRINT"                          ^     ^"
1260	PRINT"____________________________________________________"
1265	PRINT:INPUT" ",X$:PRINT CLS$
1270	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1275	PRINT"                                   ^"
1280	PRINT"                                   |-------=@=--O)."
1285	PRINT"                                        ^     ^"
1290	PRINT"____________________________________________________"
1295	PRINT:PRINT:PRINT:
1300	PRINT DY$
1305	PRINT"               HAS THE AIRPLANE BROUGHT US THERE?"
1310	PRINT DN$
1315	PRINT:INPUT" ",X$:PRINT CLS$
1316 GOTO 1650
1320	REM NUMBERS
1325	FOR LOOP1=1 TO 15
1330		PRINT"1"
1335		PRINT"   2"
1340		PRINT"      3"
1345		PRINT"         4"
1350		PRINT"            5"
1355		PRINT"               6"
1360		PRINT"                  7"
1365		PRINT"                     8"
1370		PRINT"                        9"
1375		PRINT"                           10"
1380		PRINT DY$;
1385		PRINT"                        9"
1390		PRINT"                     8"
1395		PRINT"                   7"
1400		PRINT"                6"
1405		PRINT"             5"
1410		PRINT"          4"
1415		PRINT"       3"
1420		PRINT"    2"
1425		PRINT" 1"
1430		PRINT DN$
1435		PRINT"               1"
1440		PRINT"                  2"
1445		PRINT"                     3"
1450		PRINT"                        4"
1455		PRINT"                           5"
1460		PRINT"                              6"
1465		PRINT"                                 7"
1470		PRINT"                                    8"
1475		PRINT"                                       9"
1480		PRINT"                                          10"
1485		PRINT DY$;
1490		PRINT"                                      9"
1495		PRINT"                                  8"
1500		PRINT"                               7"
1505		PRINT"                            6"
1510		PRINT"                         5"
1515		PRINT"                      4"
1520		PRINT"                   3"
1525		PRINT"                2"
1530		PRINT"             1"
1535		PRINT DN$
1540	NEXT LOOP1
1541 PRINT DY$ "              NUMBERS"
1542 PRINT DN$
1545	PRINT:INPUT" ",X$:PRINT CLS$
1547 GOTO 1075
1650 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1660	PRINT"                                   ^"
1670	PRINT"                                o  |-------=@=--O)."
1680	PRINT"                                +       ^     ^"
1690	PRINT"________________________________^____________________"
1700	PRINT:PRINT:PRINT:
1710 PRINT:INPUT" ",X$:PRINT CLS$
1720 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1730	PRINT"                                   ^"
1740	PRINT"                             o     |-------=@=--O)."
1750	PRINT"                             +          ^     ^"
1760	PRINT"_____________________________^_______________________"
1770	PRINT:PRINT:PRINT:
1780 PRINT:INPUT" ",X$:PRINT CLS$
1790 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1800	PRINT"                                   ^"
1810	PRINT"                             o/    |-------=@=--O)."
1820	PRINT"                             +          ^     ^"
1830	PRINT"_____________________________^_______________________"
1840	PRINT:PRINT:
1843 PRINT"                         LOOK, THE CASTLE!"
1850 PRINT:INPUT" ",X$:PRINT CLS$
1860 GOTO 985
1870 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1880	PRINT"                                   ^"
1890	PRINT"                            \o     |-------=@=--O)."
2000	PRINT"                             +          ^     ^"
2010	PRINT"_____________________________^_______________________"
2020	PRINT:PRINT:
2030 PRINT"   HOW ABOUT OVER THERE..."
2040 PRINT:INPUT" ",X$:PRINT CLS$
2050 GOTO 785
