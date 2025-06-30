105 DC$=CHR$(27)+"Y":CO=32:CL$=CHR$(27)+"E":CH$=CHR$(27)+"H": REM ESC Y = cursor pos, ESC E = cls, ESC H = home
106 CW$=CHR$(27)+"( "+CHR$(27)+")": REM ESC ( ESC ) = set/reset reverse video VT52
107 HD$="-":VD$="|":CD$=CHR$(27)+"B":CB$=CHR$(8): REM ESC B = cursor down, chr(8)= cursor back
1191 PRINT CHR$(27)+"E";:PRINT:PRINT:TB$="=":T1$="/":T2$="\":T3$="\":T4$="/":WIDTH 200:PRINT 
1192 PRINT "    "+T4$+TB$+TB$+TB$+TB$+TB$+TB$+TB$+TB$+TB$+T1$+" ";TAB(60)"WELCOME TO...":PRINT "   ";T4$;TB$;TB$;TB$;TB$;TB$;TB$;TB$;TB$;TB$;T1$;"  "
1193 PRINT "       "+T4$+TB$+T1$+"         "+T4$+TB$+T1$+"                ";
1194 PRINT "                                    "+T4$+TB$+T1$+" "
1195 PRINT "      "+T4$+TB$+T1$+"         ";T4$;TB$;T1$;"                 ";
1196 PRINT "                                   ";T4$;TB$;T1$;" "
1197 PRINT "     "+T4$+TB$+T1$+T4$+TB$+TB$+T3$+"     "+T4$+TB$+T1$+T4$+TB$+TB$+T3$+"     "+T4$+TB$+TB$+TB$+T3$+"   "+T4$;
1198 PRINT TB$+TB$+TB$+TB$+TB$+TB$+T1$+T4$+TB$+TB$+TB$+TB$+TB$+TB$+TB$+T1$+"   "+T4$;:PRINT TB$+TB$+TB$+T3$+"   "+T4$+TB$+TB$+TB$+TB$+TB$+TB$+TB$+TB$+T1$+" "
1199 PRINT "    ";T4$;TB$;T1$;T4$;TB$;TB$;TB$;TB$;T3$;"   ";T4$;TB$;T1$;T4$;TB$;TB$;TB$;TB$;T3$;"   ";T4$;TB$;TB$;TB$;TB$;TB$;T3$;" ";T4$;TB$;
1200 PRINT TB$;TB$;TB$;TB$;TB$;T1$;T4$;TB$;TB$;TB$;TB$;TB$;TB$;TB$;T1$;"   ";T4$;TB$;TB$;TB$;TB$;TB$;T3$;" ";T4$;TB$;TB$;TB$;TB$;TB$;TB$;TB$;TB$;T1$;" "
1201 PRINT "   ";T4$;TB$;T1$;T4$;TB$;TB$;T1$;" ";TB$;TB$;T3$;" ";T4$;TB$;T1$;T4$;TB$;TB$;T1$;" ";TB$;TB$;T3$;" ";T4$;TB$;T1$;"  ";T4$;TB$;T1$;T4$;TB$;T1$;
1202 PRINT "  ";T4$;TB$;T1$;T4$;TB$;T1$;"   ";T4$;TB$;TB$;"   ";T4$;TB$;T1$;"     ";T4$;TB$;T1$;"    ";T4$;TB$;T1$
1203 PRINT "  ";T4$;TB$;T1$;T4$;TB$;TB$;T1$;" ";TB$;TB$;TB$;T1$;T4$;TB$;T1$;T4$;TB$;TB$;T1$;" ";TB$;TB$;TB$;T1$;T4$;TB$;T1$;"  ";T4$;TB$;T1$;T4$;TB$;T1$;" ";
1204 PRINT " ";T4$;TB$;T1$;T4$;TB$;T1$;"   ";T4$;TB$;TB$;TB$;"  ";T4$;TB$;T1$;"     ";T4$;TB$;T1$;"    ";T4$;TB$;T1$;" "
1205 PRINT " ";T4$;TB$;T1$;" \";TB$;TB$;"     ";T4$;TB$;T1$;" \";TB$;TB$;"     ";T4$;TB$;T1$;"  ";T4$;TB$;T1$;" \";TB$;TB$;TB$;
1206 PRINT TB$;TB$;T1$;" \";TB$;TB$;TB$;TB$;TB$;TB$;T1$;TB$;TB$;" ";T4$;TB$;T1$;"      \";TB$;TB$;TB$;TB$;TB$;TB$;TB$;T1$;" "
1207 PRINT T4$;TB$;T1$;"   \";TB$;TB$;TB$;"  ";T4$;TB$;T1$;"   \";TB$;TB$;TB$;"  ";T4$;TB$;T1$;"  ";T4$;TB$;T1$;"   \";TB$;TB$;
1208 PRINT TB$;T1$;"   \";TB$;TB$;TB$;TB$;T1$;" ";TB$;TB$;T4$;TB$;T1$;"        \";TB$;TB$;TB$;TB$;TB$;T1$;" "
1209 PRINT "                                    ";T4$;TB$;T1$;" "
1210 PRINT "                                   ";T4$;TB$;T1$;" "
1211 PRINT "                                ";T4$;TB$;TB$;TB$;T1$;"  ":WIDTH 80:PRINT 
1212 PRINT TAB(5);"COMPUTER PROGRAM AND AUDIO VISUAL DISPLAY COPYRIGHTED 1983"
1213 PRINT TAB(7);"BY THE AVALON HILL GAME COMPANY.  ALL RIGHTS RESERVED."
1214 PRINT:RUN "GARD.BAS"
