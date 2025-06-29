499 REM PRESS RETURN KEY AFTER EACH INPUT LETTER
500	PRINT CHR$(26)
510	FOR A=1 TO 10
520	PRINT"**************************************************"
530	PRINT"**************************************************"
540	PRINT"**************************************************"
550	PRINT"***********/\*************************************"
560	PRINT"**********/**\************************************"
570	PRINT"*********/****\********.------********************"
580	PRINT"********/------\*******|******|*******************"
590	PRINT"*******/********\******|******|******_______******"
600	PRINT"******/**********\*****|------******/*******\*****"
610	PRINT"***********************|******|*****|*************"
620	PRINT"***********************|******|*****|*************"
630	PRINT"***********************'------ *****|*************"
640	PRINT"************************************|*************"
650	PRINT"************************************\_______/*****"
660	PRINT"**************************************************"
670	PRINT"**************************************************"
680	PRINT"**************************************************"
690	NEXT A
700	PRINT:REM ALSO NEED TO PRESS RETURN KEY AFTER INPUT:
710 PRINT"PRESS ANY LETTER AND YOU WILL SEE"
720 PRINT:PRINT"       THAT LETTER LARGER THAN BEFORE."
730 PRINT:PRINT"   PRESS AGAIN, DELIGHTED BE -"
740 PRINT:PRINT"          THERE WILL COME SOME MORE..."
741 PRINT:
750	GOTO 900
760	REM "BOX"
770	FOR J=62213! TO 62253!
780	POKE J,150
790	NEXT
800	FOR J=62253! TO 63917! STEP 128
810	POKE J,150
820	NEXT
830	FOR J=63917! TO 63877! STEP -1
840	POKE J,150
850	NEXT
860	FOR J=63877! TO 62213! STEP -128
870	POKE J,150
880	NEXT
900	REM **INKEY$**
901 INPUT;" ",Y$
902 IF Y$="A" THEN GOTO 950:
903 IF Y$="B" THEN GOTO 1050:
904 IF Y$="C" THEN GOTO 1150
905 IF Y$="D" THEN GOTO 1250:
906 IF Y$="E" THEN GOTO 1350:
907 IF Y$="F" THEN GOTO 1450
908 IF Y$="G" THEN GOTO 1550:
909 IF Y$="H" THEN GOTO 1660:
910 IF Y$="I" THEN GOTO 1760
911 IF Y$="J" THEN GOTO 1860:
912 IF Y$="K" THEN GOTO 1970:
913 IF Y$="L" THEN GOTO 2070
914 IF Y$="M" THEN GOTO 2170:
915 IF Y$="N" THEN GOTO 2270:
916 IF Y$="O" THEN GOTO 2470 
930	IF Y$="P" THEN GOTO 2570:
931 IF Y$="Q" THEN GOTO 2680:
932 IF Y$="R" THEN GOTO 2800
933 IF Y$="S" THEN GOTO 2900:
934 IF Y$="T" THEN GOTO 3000:
935 IF Y$="U" THEN GOTO 3100 
940	IF Y$="V" THEN GOTO 3200:
941 IF Y$="W" THEN GOTO 3300:
942 IF Y$="X" THEN GOTO 3400
943 IF Y$="Y" THEN GOTO 3500:
944 IF Y$="Z" THEN GOTO 3600 ELSE 710
945 GOTO 710
949 RETURN
950	PRINT CHR$(26)
960	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
970	PRINT"                 AA"
980	PRINT"                A  A"
990	PRINT"               A    A           aaaa"
1000	PRINT"              AAAAAAAA              a"
1010	PRINT"             A        A         aaaaa"   
1020	PRINT"            A          A       a    a"
1030	PRINT"           A            A       aaaa a"
1040	GOSUB 760
1050	PRINT CHR$(26)
1060	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1070	PRINT"            BBBBBB"
1080	PRINT"            B     B             b"
1090	PRINT"            B     B             b"
1100	PRINT"            BBBBBB              b"
1110	PRINT"            B     B             bbbbb"    
1120	PRINT"            B     B             b    b"
1130	PRINT"            BBBBBB              bbbbb"
1140	GOSUB 760
1150	PRINT CHR$(26)
1160	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1170	PRINT"             CCCCC"
1180	PRINT"            C      C"
1190	PRINT"           C"
1200	PRINT"           C                    cccc"
1210	PRINT"           C                   c"   
1220	PRINT"            C      C           c"
1230	PRINT"             CCCCC              cccc"
1240	GOSUB 760
1250	PRINT CHR$(26)
1260	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1270	PRINT"            DDDDDDD"
1280	PRINT"            D      D                d"
1290	PRINT"            D      D                d"
1300	PRINT"            D      D            ddddd"
1310	PRINT"            D      D           d    d"
1320	PRINT"            D      D           d    d"
1330	PRINT"            DDDDDDD             ddddd"
1340	GOSUB 760
1350	PRINT CHR$(26)
1360	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1370	PRINT"            EEEEEEE"
1380	PRINT"            E"
1390	PRINT"            E                   eeee"
1400	PRINT"            EEE                e    e"
1410	PRINT"            E                  eeeee"
1420	PRINT"            E                  e"
1430	PRINT"            EEEEEEE             eeee"  
1440	GOSUB 760
1450	PRINT CHR$(26)
1460	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1470	PRINT"            FFFFFFF"
1480	PRINT"            F                    ff"
1490	PRINT"            F                   f  f"
1500	PRINT"            FFF                fff"
1510	PRINT"            F                   f"
1520	PRINT"            F                   f"
1530	PRINT"            F                   f"     
1540	GOSUB 760
1550	PRINT CHR$(26)
1560	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1570	PRINT"             GGGGG"
1580	PRINT"            G     G"
1590	PRINT"            G                  ggg"
1600	PRINT"            G                 g   g"
1610	PRINT"            G    GG           g   g"
1620	PRINT"            G     G            gggg"
1630	PRINT"             GGGGG                g"   
1640	PRINT"                                gg"
1650	GOSUB 760
1660	PRINT CHR$(26)
1670	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1680	PRINT"            H     H"
1690	PRINT"            H     H        h"
1700	PRINT"            H     H        h"
1710	PRINT"            HHHHHHH        hhhh"
1720	PRINT"            H     H        h   h"
1730	PRINT"            H     H        h   h"
1740	PRINT"            H     H        h   h"  
1750	GOSUB 760
1760	PRINT CHR$(26)
1770	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1780	PRINT"            IIIII
1790	PRINT"              I             i"
1800	PRINT"              I"
1810	PRINT"              I            ii"
1820	PRINT"              I             i"
1830	PRINT"              I             i"
1840	PRINT"            IIIII         iiiii" 
1850	GOSUB 760
1860	PRINT CHR$(26)
1870	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1880	PRINT"             JJJJJ"
1890	PRINT"               J            j"
1900	PRINT"               J"
1910	PRINT"               J            j"
1920	PRINT"               J            j"
1930	PRINT"           J  J             j"
1940	PRINT"            JJ          j  j"
1950	PRINT"                         jj"
1960	GOSUB 760
1970	PRINT CHR$(26)
1980	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
1990	PRINT"             K   K         k"
2000	PRINT"             K  K          k"
2010	PRINT"             K K           k  k"
2020	PRINT"             KK            k k"
2030	PRINT"             K K           kkk"
2040	PRINT"             K  K          k  k"
2050	PRINT"             K   K         k   k"
2060	GOSUB 760
2070	PRINT CHR$(26)
2080	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2090	PRINT"              L            ll"
2100	PRINT"              L             l"
2110	PRINT"              L             l"
2120	PRINT"              L             l"
2130	PRINT"              L             l"
2140	PRINT"              L             l"
2150	PRINT"              LLLLL        lll"
2160	GOSUB 760
2170	PRINT CHR$(26)
2180	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2190	PRINT"            M      M"
2200	PRINT"            M M  M M"
2210	PRINT"            M  MM  M        mm   mm"
2220	PRINT"            M      M        m m  mm"
2230	PRINT"            M      M        m  m  m"
2240	PRINT"            M      M        m     m"
2250	PRINT"            M      M        m     m"
2260	GOSUB 760
2270	PRINT CHR$(26)
2280	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2290	PRINT"            N     N"
2300	PRINT"            NN    N"
2310	PRINT"            N N   N         n   n"
2320	PRINT"            N  N  N         nn  n"
2330	PRINT"            N   N N         n n n"
2340	PRINT"            N    NN         n  nn"
2350	PRINT"            N     N         n   n"
2360	GOSUB 760
2470	PRINT CHR$(26)
2480	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2490	PRINT"                 OO"
2500	PRINT"               O    O"
2510	PRINT"              O      O           oo"
2520	PRINT"              O      O         o    o"
2530	PRINT"              O      O         o    o"   
2540	PRINT"               O    O          o    o"
2550	PRINT"                 OO              oo"
2560	GOSUB 760
2570	PRINT CHR$(26)
2580	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2590	PRINT"              PPPPPP"
2600	PRINT"              P     P"
2610	PRINT"              P     P          pppp"
2620	PRINT"              PPPPPP          p    p"
2630	PRINT"              P               p    p"   
2640	PRINT"              P               ppppp"
2650	PRINT"              P               p"
2660	PRINT"                              p"
2670	GOSUB 760
2680	PRINT CHR$(26)
2690	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2700	PRINT"                 QQ"
2710	PRINT"               Q    Q"
2720	PRINT"              Q      Q           qq"
2730	PRINT"              Q      Q         q    q"
2740	PRINT"              Q      Q         q    q"   
2750	PRINT"               Q   QQ          q    q"
2760	PRINT"                 QQ QQ           qqqq"
2770	PRINT"                                    q"
2780	PRINT"                                    qq"
2790	GOSUB 760
2800	PRINT CHR$(26)
2810	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2820	PRINT"              RRRRRR"
2830	PRINT"              R     R"
2840	PRINT"              R     R        r rrrr"
2850	PRINT"              RRRRRR          r    r"
2860	PRINT"              R     R         r"   
2870	PRINT"              R     R         r"
2880	PRINT"              R     R        rrr"
2890	GOSUB 760
2900	PRINT CHR$(26)
2910	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
2920	PRINT"               SSSSS"
2930	PRINT"              S     S"
2940	PRINT"              S                ssss"
2950	PRINT"               SSSSS          s"
2960	PRINT"                    S          ssss"
2970	PRINT"              S     S              s"
2980	PRINT"               SSSSS          sssss"
2990	GOSUB 760
3000	PRINT CHR$(26)
3010	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3020	PRINT"            TTTTTTTTTTTT"
3030	PRINT"                 TT              t"
3040	PRINT"                 TT            ttttt"
3050	PRINT"                 TT              t"
3060	PRINT"                 TT              t"
3070	PRINT"                 TT              t t"
3080	PRINT"                TTTT              t"
3090	GOSUB 760
3100	PRINT CHR$(26)
3110	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3120	PRINT"             U        U"
3130	PRINT"             U        U"
3140	PRINT"             U        U         u    u"
3150	PRINT"             U        U         u    u"
3160	PRINT"             U        U         u    u"
3170	PRINT"              U      U          u    u"
3180	PRINT"                UUUU             uuuu u"
3190	GOSUB 760
3200	PRINT CHR$(26)
3210	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3220	PRINT"             V           V"
3230	PRINT"              V         V"
3240	PRINT"               V       V"
3250	PRINT"                V     V         v     v"
3260	PRINT"                 V   V           v   v"
3270	PRINT"                  V V             v v"
3280	PRINT"                   V               v"
3290	GOSUB 760
3300	PRINT CHR$(26)
3310	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3320	PRINT"              W         W"
3330	PRINT"              W         W"
3340	PRINT"              W         W"
3350	PRINT"              W         W       w     w"
3360	PRINT"              W    W    W       w     w"
3370	PRINT"               W  W W  W        w  w  w"
3380	PRINT"                WW   WW           w  w"
3390	GOSUB 760
3400	PRINT CHR$(26)
3410	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3420	PRINT"              X     X"
3430	PRINT"               X   X"
3440	PRINT"                X X             x   x"
3450	PRINT"                 X               x x"
3460	PRINT"                X X               x"
3470	PRINT"               X   X             x x"
3480	PRINT"              X     X           x   x"
3490	GOSUB 760
3500	PRINT CHR$(26)
3510	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3520	PRINT"              Y     Y"
3530	PRINT"               Y   Y"
3540	PRINT"                Y Y             y   y"
3550	PRINT"                 Y              y   y"
3560	PRINT"                 Y               yyyy"
3570	PRINT"                 Y                  y"
3580	PRINT"                 Y                yyy"
3590	GOSUB 760
3600	PRINT CHR$(26)
3610	PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:
3620	PRINT"              ZZZZZZZZZ"
3630	PRINT"                     Z"
3640	PRINT"                   Z"
3650	PRINT"                  Z             zzzzz"
3660	PRINT"                 Z                 z"
3670	PRINT"               Z                 z"
3680	PRINT"              ZZZZZZZZZ         zzzzz"
3690	GOSUB 760
3700	GOTO 3700
