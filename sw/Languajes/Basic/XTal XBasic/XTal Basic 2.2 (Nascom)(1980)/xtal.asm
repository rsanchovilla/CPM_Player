; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Monday, 06 of January 2020 at 04:30 PM
; 
1000 1808      jr      $100a			; Cold Start
1002 1846      jr      $104a			; Warm Start

; Initial execution start 

1004 31000e    ld      sp,$0e00			; 0e00=Stack
1007 cdf517    call    $17f5			; Init Aux reserved word table
100a 31000e    ld      sp,$0e00			; 0e00=Stack
100d 010e00    ld      bc,$000e
1010 217712    ld      hl,$1277
1013 11800c    ld      de,$0c80			
1016 edb0      ldir    				; init vars 0c80-0c8d
1018 cd3014    call    $1430			; Init stack and basic pointers
101b 2a8c0c    ld      hl,($0c8c)		; 0c8c=TEXT Addr of start of basic
101e 54        ld      d,h
101f 5d        ld      e,l
1020 cdd32b    call    $2bd3			; Get End of RAM
1023 2b        dec     hl
1024 cd4615    call    $1546			; call CPHLDE
1027 dafe12    jp      c,$12fe			; go to MEMFUL Error
102a 11ceff    ld      de,$ffce
102d 22920c    ld      ($0c92),hl		; 0c92=TOPRAM addr of topmost ram available to basic
1030 19        add     hl,de
1031 22880c    ld      ($0c88),hl		; 0c88=HIMEM Addr of Lower limit of string space
1034 cd0b14    call    $140b			; call NEW basic command
1037 cdf02a    call    $2af0			; call PRM
103a 		DB 00,'Xtal BASIC 2.22',00,0e,cd
104d f91e      ld      sp,hl
1050 ed52      sbc     hl,de
1052 cdf02a    call    $2af0			; call PRM
1055 		DB 'Size: '+80h
105b cd8127    call    $27810
105e f3        di      
105f cd3014    call    $1430			; Init stack and basic pointers
1062 c35513    jp      $1355			; go to READY

; Error Strings

1065 		DB 80h+'Next'
		DB 80h+'Syntax'
		DB 80h+'Return'
		DB 80h+'Data'
		DB 80h+'Qty'
		DB 80h+'Ovfl'
		DB 80h+'Mem Full'
		DB 80h+'Branch'
		DB 80h+'Range'
		DB 80h+'Dimension'
		DB 80h+'Division'
		DB 80h+'Direct'
		DB 80h+'Type'
		DB 80h+'Str Spc'
		DB 80h+'Str Ovfl'
		DB 80h+'Str complex'
		DB 80h+'Cont'
		DB 80h+'Fn Defn'
		DB 80h+'Operand'
		DB 80h+'Cmd'
		DB 80h+'Tape' 
		Db 80h

; Basic Tokens

10e2 		DB 80h+'END'
 		DB 80h+'FOR'
 		DB 80h+'NEXT'
 		DB 80h+'DATA'
 		DB 80h+'NAS'
 		DB 80h+'INPUT'
 		DB 80h+'DIM'
 		DB 80h+'READ'
 		DB 80h+'LET'
 		DB 80h+'GOTO'
 		DB 80h+'RUN'
 		DB 80h+'IF'
 		DB 80h+'RESTORE'
 		DB 80h+'GOSUB'
 		DB 80h+'RETURN'
 		DB 80h+'EDIT'
 		DB 80h+'REM'
 		DB 80h+'STOP'
 		DB 80h+'OUT'
 		DB 80h+'ON'
 		DB 80h+'CALL'
 		DB 80h+'WAIT'
 		DB 80h+'DEF'
 		DB 80h+'POKE'
 		DB 80h+'PRINT'
 		DB 80h+'CONT'
 		DB 80h+'LIST'
 		DB 80h+'CLEAR'
 		DB 80h+'CLOAD'
 		DB 80h+'CSAVE'
 		DB 80h+'NEW'
 		DB 80h+'SPEED'
 		DB 80h+'POP'
 		DB 80h+'TAB('
 		DB 80h+'TO'
 		DB 80h+'FN'
 		DB 80h+'SPC('
 		DB 80h+'THEN'
 		DB 80h+'NOT'
 		DB 80h+'STEP'
 		DB 80h+'+'
 		DB 80h+'-'
 		DB 80h+'^'
 		DB 80h+'*'
 		DB 80h+'/'
 		DB 80h+'AND'
 		DB 80h+'OR'
 		DB 80h+'>'
 		DB 80h+'='
 		DB 80h+'<'
 		DB 80h+'SGN'
 		DB 80h+'INT'
 		DB 80h+'ABS'
 		DB 80h+'CMD$'
 		DB 80h+'INP'
 		DB 80h+'POS'
 		DB 80h+'SQR'
 		DB 80h+'RND'
 		DB 80h+'LOG'
 		DB 80h+'EXP'
 		DB 80h+'COS'
 		DB 80h+'SIN'
 		DB 80h+'TAN'
 		DB 80h+'ATN'
 		DB 80h+'PEEK'
 		DB 80h+'LEN'
 		DB 80h+'STR$'
 		DB 80h+'VAL'
 		DB 80h+'ASC'
 		DB 80h+'CHR$'
 		DB 80h+'LEFT$'
 		DB 80h+'RIGHT$'
 		DB 80h+'MID$'
 		DB 80h+'SIZE'
 		DB 80h+'INCH'
 		DB 80h+'KBD'
 		DB 80h+'ERR'
 		DB 80h+'PI'
		DB 80h, 80h

; Token Jump table: addr for each basic command

11e8		DW 1701	 ; END
 		DW 1630  ; FOR
 		DW 1B2D  ; NEXT
 		DW 1885  ; DATA
11f0 		DW 2be5  ; NAS
 		DW 1A56  ; INPUT
 		DW 1D4A  ; DIM
 		DW 1A7E  ; READ
 		DW 189A  ; LET
 		DW 182E  ; GOTO
 		DW 1812  ; RUN
 		DW 1953  ; IF
 		DW 172D  ; RESTORE
 		DW 181D  ; GOSUB
 		DW 1862  ; RETURN
 		DW 2C00  ; EDIT
 		DW 1887  ; REM
 		DW 16FF  ; STOP
 		DW 221D  ; OUT
 		DW 18F0  ; ON
 		DW 1572  ; CALL
 		DW 2223  ; WAIT
 		DW 1F08  ; DEF
 		DW 2267  ; POKE
 		DW 19B2  ; PRINT
 		DW 1746  ; CONT
 		DW 157E  ; LIST
 		DW 17B0  ; CLEAR
 		DW 232E  ; CLOAD
 		DW 2B3F  ; CSAVE
 		DW 140A  ; NEW
 		DW 12A6  ; SPEED
 		DW 184C,79  ; POP  ??

 		DW 23B8,79  ; +  23b8,79
 		DW 23C8,7f  ; -  23c8,7f
 		DW 2877  ; ^     2877,7c
 		DW 24F9  ; *     24f9,7c   
 		DW 254B  ; /     254b,50
 		DW 1CAC  ; AND   1cac,46
 		DW 1CAB  ; OR   
 		DW   ; >
 		DW   ; =
 		DW   ; <

 		DW 2603  ; SGN
 		DW 26C2  ; INT
 		DW 2619  ; ABS
 		DW 22FC  ; CMD$
 		DW 2212  ; INP
 		DW 1F01  ; POS
 		DW 286E  ; SQR
 		DW 2280  ; RND
 		DW 24BA  ; LOG
 		DW 28BB  ; EXP
 		DW 2938  ; COS
 		DW 293E  ; SIN
 		DW 28FB  ; TAN
 		DW 2910  ; ATN
 		DW 2260  ; PEEK
 		DW 2157  ; LEN
 		DW 1F86  ; STR$
 		DW 21ED  ; VAL
 		DW 2166  ; ASC
 		DW 2177  ; CHR$
 		DW 2187  ; LEFT$
 		DW 21B6  ; RIGHT$
 		DW 21BF  ; MID$
 		DW 1ECD  ; SIZE
 		DW 128D  ; INCH
 		DW 1285  ; KBD
 		DW 1292  ; ERR
 		DW 1298  ; PI

1277	db 52 c7 4f 80 00 00 00
           20 00 00 fe ff 00 30

; KBD Basic Command 

1285 cdf72b    call    $2bf7		; call VKBD
1288 380b      jr      c,$1295
128a af        xor     a
128b 1808      jr      $1295

; INCH Basic Command 

128d cdcc2a    call    $2acc		; call GETKEY
1290 1803      jr      $1295

; ERR Basic command

1292 3a850c    ld      a,($0c85)		; 0c85=ERRMOD (non-zero if ON ERR active)
1295 c3041f    jp      $1f04

; PI Basic command

1298 014982    ld      bc,$8249
129b 11db0f    ld      de,$0fdb
129e c33526    jp      $2635
12a1 00        nop     
12a2 00        nop     
12a3 00        nop     
12a4 00        nop     
12a5 00        nop     

; SPEED Basic command

12a6 cd5022    call    $2250		; call I255
12a9 2f        cpl     
12aa 32860c    ld      ($0c86),a		; 0c86=SPEED Delay for VDU display
12ad c9        ret     

12ae 210400    ld      hl,$0004
12b1 39        add     hl,sp
12b2 7e        ld      a,(hl)
12b3 23        inc     hl
12b4 fe81      cp      $81
12b6 c0        ret     nz
12b7 4e        ld      c,(hl)
12b8 23        inc     hl
12b9 46        ld      b,(hl)
12ba 23        inc     hl
12bb e5        push    hl
12bc 60        ld      h,b
12bd 69        ld      l,c
12be 7a        ld      a,d
12bf b3        or      e
12c0 eb        ex      de,hl
12c1 2803      jr      z,$12c6
12c3 eb        ex      de,hl
12c4 ed52      sbc     hl,de
12c6 010d00    ld      bc,$000d
12c9 e1        pop     hl
12ca c8        ret     z
12cb 09        add     hl,bc
12cc 18e4      jr      $12b2

12ce cdeb12    call    $12eb
12d1 c5        push    bc
12d2 e3        ex      (sp),hl
12d3 c1        pop     bc
12d4 cd4615    call    $1546			; call CPHLDE
12d7 7e        ld      a,(hl)
12d8 02        ld      (bc),a
12d9 c8        ret     z
12da 0b        dec     bc
12db 2b        dec     hl
12dc 18f6      jr      $12d4

12de af        xor     a
12df 47        ld      b,a
12e0 e5        push    hl
12e1 21300d    ld      hl,$0d30
12e4 09        add     hl,bc
12e5 09        add     hl,bc
12e6 b7        or      a
12e7 ed72      sbc     hl,sp
12e9 1811      jr      $12fc

12eb e5        push    hl
12ec d5        push    de
12ed 11d0ff    ld      de,$ffd0
12f0 eb        ex      de,hl
12f1 b7        or      a
12f2 ed52      sbc     hl,de
12f4 3808      jr      c,$12fe			; go to MEMFUL Error
12f6 ed5b880c  ld      de,($0c88)		; 0c88=HIMEM
12fa 19        add     hl,de
12fb d1        pop     de
12fc e1        pop     hl
12fd d8        ret     c

; MEMFUL Error

12fe 1e07      ld      e,$07
1300 1817      jr      $1319			; go to BASIC Error

1302 2aaa0c    ld      hl,($0caa)		; 0caa=DATLN Line number of current DATA statement
1305 228a0c    ld      ($0c8a),hl		; 0c8a=LNNO Current line number

; SYNTAX Error

1308 1e02      ld      e,$02
130a 011e14    ld      bc,$141e
130d 011e0b    ld      bc,$0b1e
1310 011e01    ld      bc,$011e
1313 011e0a    ld      bc,$0a1e
1316 011e12    ld      bc,$121e

; BASIC Error

1319 7b        ld      a,e
131a 32850c    ld      ($0c85),a	; 0c85=ERRMOD (non-zero if ON ERR active)
131d 3a840c    ld      a,($0c84)	; 0c84=ERRNO Number of last error generated
1320 b7        or      a
1321 c22719    jp      nz,$1927
1324 cd3014    call    $1430		; Init stack and basic pointers
1327 cd0e1a    call    $1a0e		; call CRLFZ
132a 216510    ld      hl,$1065		; 1065=Error Message Table
132d 7e        ld      a,(hl)
132e 23        inc     hl
132f cb7f      bit     7,a
1331 28fa      jr      z,$132d
1333 1d        dec     e
1334 20f7      jr      nz,$132d
1336 e67f      and     $7f
1338 cd5c15    call    $155c		; call PR
133b 7e        ld      a,(hl)
133c 23        inc     hl
133d cb7f      bit     7,a
133f 28f5      jr      z,$1336
1341 cdf02a    call    $2af0			; call PRM
1344 		DB ' Error'+80h;
134a 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
134d 7c        ld      a,h
134e a5        and     l
134f 3c        inc     a
1350 c47a27    call    nz,$277a
1353 3ec1      ld      a,$c1

; READY print Ok and wait for comand

1355 cdf02a    call    $2af0			; call PRM
1358 		DB 0d,Ok,0d+80h;
135c 21ffff    ld      hl,$ffff
135f fd215c13  ld      iy,$135c
1363 228a0c    ld      ($0c8a),hl		; 0c8a=LNNO Current line number
1366 3e5d      ld      a,$5d
1368 cd1215    call    $1512		; call RDLN
136b 38e8      jr      c,$1355			; go to READY
136d cdd816    call    $16d8
1370 28ea      jr      z,$135c
1372 f5        push    af
1373 cd8c17    call    $178c		; call GETNM
1376 d5        push    de
1377 cd4914    call    $1449
137a 47        ld      b,a
137b d1        pop     de
137c f1        pop     af
137d d2b016    jp      nc,$16b0
1380 d5        push    de
1381 c5        push    bc
1382 af        xor     a
1383 32ad0c    ld      ($0cad),a
1386 cdd816    call    $16d8
1389 b7        or      a
138a f5        push    af
138b cdec13    call    $13ec
138e 3806      jr      c,$1396
1390 f1        pop     af
1391 f5        push    af
1392 ca4718    jp      z,$1847			; go to BRANCH Error
1395 b7        or      a
1396 c5        push    bc
1397 3012      jr      nc,$13ab
1399 eb        ex      de,hl
139a 2ab70c    ld      hl,($0cb7)		; 0cb7=TXTUNF Pointer to end of program text
139d b7        or      a
139e ed52      sbc     hl,de
13a0 e5        push    hl
13a1 eb        ex      de,hl
13a2 50        ld      d,b
13a3 59        ld      e,c
13a4 c1        pop     bc
13a5 edb0      ldir    
13a7 ed53b70c  ld      ($0cb7),de		; 0cb7=TXTUNF
13ab d1        pop     de
13ac f1        pop     af
13ad 2821      jr      z,$13d0
13af ed4bb70c  ld      bc,($0cb7)		; 0cb7=TXTUNF
13b3 e1        pop     hl
13b4 09        add     hl,bc
13b5 e5        push    hl
13b6 cdce12    call    $12ce
13b9 e1        pop     hl
13ba 22b70c    ld      ($0cb7),hl		; 0cb7=TXTUNF
13bd eb        ex      de,hl
13be 74        ld      (hl),h
13bf d1        pop     de
13c0 23        inc     hl
13c1 23        inc     hl
13c2 73        ld      (hl),e
13c3 23        inc     hl
13c4 72        ld      (hl),d
13c5 23        inc     hl
13c6 11d50c    ld      de,$0cd5			; 0cd5=BUFFER (Input Buffer)
13c9 1a        ld      a,(de)
13ca 77        ld      (hl),a
13cb 23        inc     hl
13cc 13        inc     de
13cd b7        or      a
13ce 20f9      jr      nz,$13c9
13d0 cd1614    call    $1416
13d3 23        inc     hl
13d4 eb        ex      de,hl
13d5 62        ld      h,d
13d6 6b        ld      l,e
13d7 7e        ld      a,(hl)
13d8 23        inc     hl
13d9 b6        or      (hl)
13da 280e      jr      z,$13ea
13dc 23        inc     hl
13dd 23        inc     hl
13de 23        inc     hl
13df af        xor     a
13e0 47        ld      b,a
13e1 4f        ld      c,a
13e2 edb1      cpir    
13e4 eb        ex      de,hl
13e5 73        ld      (hl),e
13e6 23        inc     hl
13e7 72        ld      (hl),d
13e8 18eb      jr      $13d5
13ea fde9      jp      (iy)
13ec 2a8c0c    ld      hl,($0c8c)		; 0c8c=TEXT
13ef 44        ld      b,h
13f0 4d        ld      c,l
13f1 7e        ld      a,(hl)
13f2 23        inc     hl
13f3 b6        or      (hl)
13f4 2b        dec     hl
13f5 c8        ret     z

13f6 23        inc     hl
13f7 23        inc     hl
13f8 7e        ld      a,(hl)
13f9 23        inc     hl
13fa 66        ld      h,(hl)
13fb 6f        ld      l,a
13fc ed52      sbc     hl,de
13fe 60        ld      h,b
13ff 69        ld      l,c
1400 7e        ld      a,(hl)
1401 23        inc     hl
1402 66        ld      h,(hl)
1403 6f        ld      l,a
1404 3f        ccf     
1405 c8        ret     z

1406 3f        ccf     
1407 d0        ret     nc

1408 18e5      jr      $13ef
140a c0        ret     nz

; NEW basic command

140b 2a8c0c    ld      hl,($0c8c)		; 0c8c=TEXT
140e af        xor     a
140f 77        ld      (hl),a
1410 23        inc     hl
1411 77        ld      (hl),a
1412 23        inc     hl
1413 22b70c    ld      ($0cb7),hl		; 0cb7=TXTUNF
1416 2a8c0c    ld      hl,($0c8c)		; 0c8c=TEXT
1419 2b        dec     hl
141a 22af0c    ld      ($0caf),hl
141d 2a920c    ld      hl,($0c92)		; 0c92=TOPRAM
1420 22a60c    ld      ($0ca6),hl		; 0ca6=STRBOT
1423 af        xor     a
1424 cd2d17    call    $172d			; call RESTORE Basic command
1427 2ab70c    ld      hl,($0cb7)		; 0cb7=TXTUNF
142a 22b90c    ld      ($0cb9),hl		; 0cb9=VARPTR Pointer to end of simple variable area
142d 22bb0c    ld      ($0cbb),hl		; 0cbb=LOMEM Pointer to end of array storage area

1430 c1        pop     bc			; Init stack and basic pointers
1431 31000e    ld      sp,$0e00			; 0e00=Stack
1434 21960c    ld      hl,$0c96
1437 22940c    ld      ($0c94),hl
143a af        xor     a
143b 6f        ld      l,a
143c 67        ld      h,a
143d 22b50c    ld      ($0cb5),hl
1440 32ac0c    ld      ($0cac),a
1443 e5        push    hl
1444 c5        push    bc
1445 2aaf0c    ld      hl,($0caf)
1448 c9        ret     

1449 af        xor     a
144a 32910c    ld      ($0c91),a
144d 0e05      ld      c,$05
144f 11d50c    ld      de,$0cd5			; 0cd5=BUFFER (Input Buffer)
1452 af        xor     a
1453 08        ex      af,af'
1454 7e        ld      a,(hl)
1455 fe20      cp      $20
1457 287c      jr      z,$14d5
1459 47        ld      b,a
145a fe22      cp      $22
145c cafd14    jp      z,$14fd
145f b7        or      a
1460 ca0315    jp      z,$1503
1463 3a910c    ld      a,($0c91)
1466 b7        or      a
1467 7e        ld      a,(hl)
1468 206b      jr      nz,$14d5
146a fe30      cp      $30
146c 3804      jr      c,$1472
146e fe3c      cp      $3c
1470 3863      jr      c,$14d5
1472 fe3f      cp      $3f
1474 3e98      ld      a,$98
1476 285d      jr      z,$14d5
1478 d5        push    de
1479 11e110    ld      de,$10e1
147c c5        push    bc
147d 01ca14    ld      bc,$14ca
1480 c5        push    bc
1481 067f      ld      b,$7f
1483 7e        ld      a,(hl)
1484 cda924    call    $24a9
1487 77        ld      (hl),a
1488 4e        ld      c,(hl)
1489 eb        ex      de,hl
148a 23        inc     hl
148b b6        or      (hl)
148c f28a14    jp      p,$148a
148f 04        inc     b
1490 7e        ld      a,(hl)
1491 e67f      and     $7f
1493 200b      jr      nz,$14a0
1495 08        ex      af,af'
1496 b7        or      a
1497 c0        ret     nz

1498 eb        ex      de,hl
1499 3d        dec     a
149a 08        ex      af,af'
149b 117f0e    ld      de,$0e7f
149e 18e1      jr      $1481
14a0 b9        cp      c
14a1 20e7      jr      nz,$148a
14a3 eb        ex      de,hl
14a4 e5        push    hl
14a5 13        inc     de
14a6 1a        ld      a,(de)
14a7 b7        or      a
14a8 fab814    jp      m,$14b8
14ab 4f        ld      c,a
14ac 23        inc     hl
14ad 7e        ld      a,(hl)
14ae cda924    call    $24a9
14b1 00        nop     
14b2 b9        cp      c
14b3 28f0      jr      z,$14a5
14b5 e1        pop     hl
14b6 18d0      jr      $1488
14b8 f1        pop     af
14b9 08        ex      af,af'
14ba 280a      jr      z,$14c6
14bc 08        ex      af,af'
14bd 79        ld      a,c
14be fe28      cp      $28
14c0 2005      jr      nz,$14c7
14c2 cbf0      set     6,b
14c4 08        ex      af,af'
14c5 00        nop     
14c6 08        ex      af,af'
14c7 48        ld      c,b
14c8 eb        ex      de,hl
14c9 c9        ret     

14ca eb        ex      de,hl
14cb 79        ld      a,c
14cc c1        pop     bc
14cd d1        pop     de
14ce 08        ex      af,af'
14cf 2803      jr      z,$14d4
14d1 12        ld      (de),a
14d2 13        inc     de
14d3 0c        inc     c
14d4 08        ex      af,af'
14d5 23        inc     hl
14d6 12        ld      (de),a
14d7 13        inc     de
14d8 0c        inc     c
14d9 d63a      sub     $3a
14db 2809      jr      z,$14e6
14dd 08        ex      af,af'
14de c25214    jp      nz,$1452
14e1 08        ex      af,af'
14e2 fe49      cp      $49
14e4 2003      jr      nz,$14e9
14e6 32910c    ld      ($0c91),a
14e9 fe56      cp      $56
14eb 2807      jr      z,$14f4
14ed e6fe      and     $fe
14ef fe62      cp      $62
14f1 c25214    jp      nz,$1452
14f4 0600      ld      b,$00
14f6 7e        ld      a,(hl)
14f7 b7        or      a
14f8 2809      jr      z,$1503
14fa b8        cp      b
14fb 28d8      jr      z,$14d5
14fd 23        inc     hl
14fe 12        ld      (de),a
14ff 0c        inc     c
1500 13        inc     de
1501 18f3      jr      $14f6
1503 21d40c    ld      hl,$0cd4
1506 12        ld      (de),a
1507 13        inc     de
1508 12        ld      (de),a
1509 13        inc     de
150a 12        ld      (de),a
150b c9        ret     

150c cdf02a    call    $2af0		; call PRM
150f 		DB '?'+80h;
1510 3e20      ld      a,$20

; RDLN
;
; Prints the character in A, and then reads in a line at the keyboard,
; into the BUFFER starting at 0CD5. As each character is typed, it is
; echoed to the screen, with the exceptions that:
; ‘BS’ backspaces cursor and removes the last character from the buffer.
; ‘CS’ exits the routine with the carry flag set.
; ‘NL’ exits the routine with the carry flag reset, terminates the line in the buffer
; with a 00 byte, and leaves HL pointing to 0CD4 (BUFFER-1).
; No other control-characters are allowed, and characters will not print if
; the line length is 96 characters (the maximum)

1512 21d50c    ld      hl,$0cd5		; 0cd5=BUFFER (Input Buffer)
1515 cd5c15    call    $155c		; call PR
1518 cdcc2a    call    $2acc		; call GETKEY
151b d8        ret     c

151c 77        ld      (hl),a
151d fe08      cp      $08
151f 2009      jr      nz,$152a
1521 7d        ld      a,l
1522 fed5      cp      $d5
1524 28f2      jr      z,$1518
1526 7e        ld      a,(hl)
1527 2b        dec     hl
1528 18eb      jr      $1515
152a fe0d      cp      $0d
152c ca041a    jp      z,$1a04
152f 7d        ld      a,l
1530 fe34      cp      $34
1532 28e4      jr      z,$1518
1534 7e        ld      a,(hl)
1535 fe20      cp      $20
1537 38df      jr      c,$1518
1539 23        inc     hl
153a 32a20c    ld      ($0ca2),a
153d 18d6      jr      $1515
153f 00        nop     
1540 00        nop     
1541 00        nop     
1542 00        nop     
1543 00        nop     
1544 00        nop     
1545 00        nop     

; CPHLDE
;
; Compare HL and DE and return flags set as follows:
; Carry -- Set if HL<DE, reset if HL>=DE.
; Zero -- Set if HL=DE.

1546 7c        ld      a,h
1547 92        sub     d
1548 c0        ret     nz
1549 7d        ld      a,l
154a 93        sub     e
154b c9        ret     

; TSTCOM
;
; Check for ',' or syntax error

154c 7e        ld      a,(hl)		; call TSTCOM
154d fe2c      cp      $2c
154f 1805      jr      $1556

; TSTC
;
; check for char in next byte

1551 7e        ld      a,(hl)
1552 e3        ex      (sp),hl
1553 be        cp      (hl)
1554 23        inc     hl
1555 e3        ex      (sp),hl
1556 cad816    jp      z,$16d8
1559 c30813    jp      $1308			; go to SYNTAX Error

; PR
;
; Print character in A register, to VDU or current output device. The sideeffect
; of this is that the location PRTCOL, is adjusted to give the correct
; column on the screen/printer, for TABs, etc. In addition, a delay is
; imposed if the SPEED command has been used to slow down the print
; rate. Registers affected: NONE, but user’s output routine MUST reset 
; the carry flag

155c e5        push    hl
155d 218e0c    ld      hl,$0c8e		; 0c8e=PRTCOL Current print column
1560 fe0d      cp      $0d
1562 2002      jr      nz,$1566
1564 3600      ld      (hl),$00
1566 fe20      cp      $20
1568 3804      jr      c,$156e
156a 34        inc     (hl)
156b cd7422    call    $2274		; Appy defined print speed
156e e1        pop     hl
156f c3f42b    jp      $2bf4		; call ROUT

; CALL basic command

1572 cd6117    call    $1761		; call UEXINT
1575 e5        push    hl
1576 217c15    ld      hl,$157c
1579 e5        push    hl
157a eb        ex      de,hl
157b e9        jp      (hl)
157c e1        pop     hl
157d c9        ret     

; LIST Basic Command

157e cd8c17    call    $178c		; call GETNM
1581 c1        pop     bc
1582 d5        push    de
1583 11ffff    ld      de,$ffff
1586 2806      jr      z,$158e
1588 cd4c15    call    $154c		; call TSTCOM
158b cd8c17    call    $178c		; call GETNM
158e eb        ex      de,hl
158f 22a80c    ld      ($0ca8),hl
1592 d1        pop     de
1593 e5        push    hl
1594 c5        push    bc
1595 c0        ret     nz

1596 c1        pop     bc
1597 cdec13    call    $13ec
159a c5        push    bc
159b e1        pop     hl
159c 4e        ld      c,(hl)
159d 23        inc     hl
159e 46        ld      b,(hl)
159f 23        inc     hl
15a0 78        ld      a,b
15a1 b1        or      c
15a2 ca5513    jp      z,$1355		; go to READY
15a5 e3        ex      (sp),hl
15a6 7c        ld      a,h
15a7 b5        or      l
15a8 2009      jr      nz,$15b3
15aa cdcc2a    call    $2acc		; call GETKEY
15ad da5513    jp      c,$1355			; go to READY
15b0 2aa80c    ld      hl,($0ca8)
15b3 2b        dec     hl
15b4 e3        ex      (sp),hl
15b5 cdf816    call    $16f8
15b8 c5        push    bc
15b9 cdbe15    call    $15be
15bc 18dd      jr      $159b
15be cd091a    call    $1a09		; call CRLF
15c1 5e        ld      e,(hl)
15c2 23        inc     hl
15c3 56        ld      d,(hl)
15c4 23        inc     hl
15c5 e5        push    hl
15c6 cd8227    call    $2782
15c9 3e20      ld      a,$20
15cb e1        pop     hl
15cc cd5c15    call    $155c		; call PR
15cf 7e        ld      a,(hl)
15d0 fe22      cp      $22
15d2 200e      jr      nz,$15e2
15d4 cd5c15    call    $155c		; call PR
15d7 23        inc     hl
15d8 7e        ld      a,(hl)
15d9 fe22      cp      $22
15db 23        inc     hl
15dc 28ee      jr      z,$15cc
15de 2b        dec     hl
15df b7        or      a
15e0 20f2      jr      nz,$15d4
15e2 b7        or      a
15e3 23        inc     hl
15e4 c8        ret     z

15e5 feff      cp      $ff
15e7 2823      jr      z,$160c
15e9 b7        or      a
15ea f2cc15    jp      p,$15cc
15ed 11e210    ld      de,$10e2		; 10e2=Token table for basic commands
15f0 d67f      sub     $7f
15f2 47        ld      b,a
15f3 1a        ld      a,(de)
15f4 13        inc     de
15f5 b7        or      a
15f6 f2f315    jp      p,$15f3
15f9 e67f      and     $7f
15fb 2818      jr      z,$1615
15fd 10f4      djnz    $15f3
15ff e67f      and     $7f
1601 cd5c15    call    $155c		; call PR
1604 1a        ld      a,(de)
1605 13        inc     de
1606 b7        or      a
1607 f2ff15    jp      p,$15ff
160a 18c3      jr      $15cf
160c 7e        ld      a,(hl)
160d 23        inc     hl
160e e6bf      and     $bf
1610 11800e    ld      de,$0e80		; 0e80=Aux reserved word table
1613 18db      jr      $15f0
1615 2b        dec     hl
1616 7e        ld      a,(hl)
1617 23        inc     hl
1618 e67f      and     $7f
161a f640      or      $40
161c 1600      ld      d,$00
161e 5f        ld      e,a
161f cdf02a    call    $2af0			; call PRM
1622 		DB '??'+80h
1624 e5        push    hl
1625 cd8227    call    $2782
1628 e1        pop     hl
1629 cdf02a    call    $2af0			; call PRM
162c 		DB ' '+80h
162d 18a0      jr      $15cf
162f 00        nop     

; FOR Basic command

1630 3e64      ld      a,$64
1632 32ac0c    ld      ($0cac),a
1635 cd9a18    call    $189a
1638 e3        ex      (sp),hl
1639 cdae12    call    $12ae
163c d1        pop     de
163d 2002      jr      nz,$1641
163f 09        add     hl,bc
1640 f9        ld      sp,hl
1641 eb        ex      de,hl
1642 0e08      ld      c,$08
1644 cdde12    call    $12de
1647 e5        push    hl
1648 cd8518    call    $1885
164b e3        ex      (sp),hl
164c e5        push    hl
164d 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
1650 e3        ex      (sp),hl
1651 cd7a1b    call    $1b7a
1654 cd5115    call    $1551			; call TSTC
1657 		DB a2  				; 'TO' token
1658 cd771b    call    $1b77
165b e5        push    hl
165c cd5f26    call    $265f
165f e1        pop     hl
1660 c5        push    bc
1661 d5        push    de
1662 010081    ld      bc,$8100
1665 51        ld      d,c
1666 5a        ld      e,d
1667 7e        ld      a,(hl)
1668 fea7      cp      $a7
166a 3e01      ld      a,$01
166c 200e      jr      nz,$167c
166e cdd816    call    $16d8
1671 cd771b    call    $1b77
1674 e5        push    hl
1675 cd5f26    call    $265f
1678 cdf425    call    $25f4
167b e1        pop     hl
167c c5        push    bc
167d d5        push    de
167e f5        push    af
167f 33        inc     sp
1680 e5        push    hl
1681 2aaf0c    ld      hl,($0caf)
1684 e3        ex      (sp),hl
1685 0681      ld      b,$81
1687 c5        push    bc
1688 33        inc     sp
1689 cdf816    call    $16f8
168c 22af0c    ld      ($0caf),hl
168f 7e        ld      a,(hl)
1690 fe3a      cp      $3a
1692 281c      jr      z,$16b0
1694 ed5b8c0c  ld      de,($0c8c)		; 0c8c=TEXT
1698 1b        dec     de
1699 b7        or      a
169a 2806      jr      z,$16a2
169c cd4615    call    $1546			; call CPHLDE
169f c20813    jp      nz,$1308			; go to SYNTAX Error
16a2 23        inc     hl
16a3 7e        ld      a,(hl)
16a4 23        inc     hl
16a5 b6        or      (hl)
16a6 2861      jr      z,$1709
16a8 23        inc     hl
16a9 5e        ld      e,(hl)
16aa 23        inc     hl
16ab 56        ld      d,(hl)
16ac ed538a0c  ld      ($0c8a),de		; 0c8a=LNNO Current line number
16b0 cdd816    call    $16d8
16b3 118916    ld      de,$1689
16b6 d5        push    de
16b7 ed73a00c  ld      ($0ca0),sp		; 0ca0=save SP at start of each statement
16bb c8        ret     z

16bc feff      cp      $ff
16be 2827      jr      z,$16e7
16c0 d680      sub     $80
16c2 da9a18    jp      c,$189a
16c5 fe21      cp      $21
16c7 d20813    jp      nc,$1308			; go to SYNTAX Error
16ca 07        rlca    
16cb 11e811    ld      de,$11e8			; 11e8=Token Jump table: addr for each basic command
16ce 0600      ld      b,$00
16d0 4f        ld      c,a
16d1 eb        ex      de,hl
16d2 09        add     hl,bc
16d3 4e        ld      c,(hl)
16d4 23        inc     hl
16d5 46        ld      b,(hl)
16d6 c5        push    bc
16d7 eb        ex      de,hl
16d8 23        inc     hl
16d9 7e        ld      a,(hl)
16da fe20      cp      $20
16dc 28fa      jr      z,$16d8
16de fe3a      cp      $3a
16e0 d0        ret     nc

16e1 fe30      cp      $30
16e3 3f        ccf     
16e4 3c        inc     a
16e5 3d        dec     a
16e6 c9        ret     

16e7 cdd816    call    $16d8
16ea d680      sub     $80
16ec da0813    jp      c,$1308			; go to SYNTAX Error
16ef 87        add     a,a
16f0 fa0813    jp      m,$1308			; go to SYNTAX Error
16f3 11800f    ld      de,$0f80			; 0f80=Aux address table
16f6 18d6      jr      $16ce
16f8 cd002b    call    $2b00			; call GETK
16fb d0        ret     nc

16fc 00        nop     
16fd fe1b      cp      $1b
16ff c0        ret     nz

; STOP basic command

1700 f6c0      or      $c0
1702 22af0c    ld      ($0caf),hl
1705 21f6ff    ld      hl,$fff6
1708 c1        pop     bc
1709 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
170c f5        push    af
170d 7d        ld      a,l
170e a4        and     h
170f 3c        inc     a
1710 2809      jr      z,$171b
1712 22b30c    ld      ($0cb3),hl
1715 2aaf0c    ld      hl,($0caf)
1718 22b50c    ld      ($0cb5),hl
171b cd0e1a    call    $1a0e		; call CRLFZ
171e f1        pop     af
171f ca5513    jp      z,$1355			; go to READY
1722 cdf02a    call    $2af0			; call PRM
1725 		DB 'Break'+80h
172a c34a13    jp      $134a

; RESTORE basic command

172d ed5b8c0c  ld      de,($0c8c)		; 0c8c=TEXT
1731 280d      jr      z,$1740
1733 cd8c17    call    $178c		; call GETNM
1736 e5        push    hl
1737 cdec13    call    $13ec
173a 50        ld      d,b
173b 59        ld      e,c
173c e1        pop     hl
173d d28b18    jp      nc,$188b
1740 1b        dec     de
1741 ed53bd0c  ld      ($0cbd),de		; 0cbd=DATPTR Pointer to current position in current DATA statement
1745 c9        ret     

; CONT basic command

1746 2ab50c    ld      hl,($0cb5)
1749 7c        ld      a,h
174a b5        or      l
174b 1e11      ld      e,$11
174d ca0913    jp      z,$1309
1750 ed5bb30c  ld      de,($0cb3)
1754 ed538a0c  ld      ($0c8a),de		; 0c8a=LNNO Current line number
1758 c9        ret     

; LTRCHK
;
; Reads the character contained at (HL) into A, and tests to see if it is
; a letter in the range A - Z (i.e, a capital letter).
; Carry is Reset if it is a capital letter, and Set if it is any other
; character. No other registers are affected.

1759 7e        ld      a,(hl)
175a fe41      cp      $41
175c d8        ret     c

175d fe5b      cp      $5b
175f 3f        ccf     
1760 c9        ret     

; UEXINT
;
; Evaluate expression into an 
; integer, which must be in the range -65535 to +65535, returning the
; result in DE, as a signed 16-bit quantity. Note that, due to the range
; allowed, equivalent positive and negative values may be used
; interchangeably, e.g, -65535 is equivalent to +1.

1761 cd771b    call    $1b77
1764 180c      jr      $1772

; INTEXP
;
; As for UEXINT, but restricts the range to 0 to +65535

1766 cdd816    call    $16d8
1769 cd771b    call    $1b77
176c cdf425    call    $25f4
176f fa8717    jp      m,$1787			; go to QTY Error
1772 3ac20c    ld      a,($0cc2)	; 0cbf-0cc2=FPA Floating Point accumulator
1775 fe91      cp      $91
1777 da9726    jp      c,$2697
177a 018090    ld      bc,$9080
177d 110000    ld      de,$0000
1780 e5        push    hl
1781 cd6b26    call    $266b
1784 e1        pop     hl
1785 51        ld      d,c
1786 c8        ret     z

; QTY Error

1787 1e05      ld      e,$05
1789 c31913    jp      $1319			; go to BASIC Error

; GETNM
;
; Tests for a number (NB, NOT an expression, just a numeric
; constant), leaving HL pointing to the first non-numeric text
; character. the number must be an integer in the
; range 0-65529, and ‘Syntax Error’ is returned if it is not in this
; range. The number is returned in DE, and HL again points to
; the first non-numeric character. This routine is mainly used for
; fetching line numbers in the text (e.g, after GOTO or GOSUB
; statements). This routine leaves BC unaffected.

178c 2b        dec     hl
178d 110000    ld      de,$0000
1790 cdd816    call    $16d8
1793 d0        ret     nc

1794 e5        push    hl
1795 f5        push    af
1796 219819    ld      hl,$1998
1799 b7        or      a
179a ed52      sbc     hl,de
179c da0813    jp      c,$1308			; go to SYNTAX Error
179f 62        ld      h,d
17a0 6b        ld      l,e
17a1 29        add     hl,hl
17a2 29        add     hl,hl
17a3 19        add     hl,de
17a4 29        add     hl,hl
17a5 f1        pop     af
17a6 d630      sub     $30
17a8 5f        ld      e,a
17a9 1600      ld      d,$00
17ab 19        add     hl,de
17ac eb        ex      de,hl
17ad e1        pop     hl
17ae 18e0      jr      $1790

; CLEAR Basic command

17b0 2840      jr      z,$17f2
17b2 fe25      cp      $25
17b4 283f      jr      z,$17f5		; Init Aux reserved word table
17b6 cd6117    call    $1761		; call UEXINT
17b9 cdd916    call    $16d9
17bc e5        push    hl
17bd 2a920c    ld      hl,($0c92)		; 0c92=TOPRAM
17c0 2810      jr      z,$17d2
17c2 e1        pop     hl
17c3 cd4c15    call    $154c		; call TSTCOM
17c6 d5        push    de
17c7 cd6117    call    $1761		; call UEXINT
17ca cdd916    call    $16d9
17cd c20813    jp      nz,$1308			; go to SYNTAX Error
17d0 e3        ex      (sp),hl
17d1 eb        ex      de,hl
17d2 7d        ld      a,l
17d3 93        sub     e
17d4 5f        ld      e,a
17d5 7c        ld      a,h
17d6 9a        sbc     a,d
17d7 57        ld      d,a
17d8 dafe12    jp      c,$12fe			; go to MEMFUL Error
17db e5        push    hl
17dc 2ab70c    ld      hl,($0cb7)		; 0cb7=TXTUNF
17df 012800    ld      bc,$0028
17e2 09        add     hl,bc
17e3 b7        or      a
17e4 ed52      sbc     hl,de
17e6 d2fe12    jp      nc,$12fe			; go to MEMFUL Error
17e9 ed53880c  ld      ($0c88),de		; 0c88=HIMEM
17ed e1        pop     hl
17ee 22920c    ld      ($0c92),hl		; 0c92=TOPRAM
17f1 e1        pop     hl
17f2 c31a14    jp      $141a

17f5 d9        exx     				; Init Aux reserved word table
17f6 21800e    ld      hl,$0e80			; 0e80=Aux reserved word table
17f9 11810e    ld      de,$0e81
17fc 010001    ld      bc,$0100
17ff 3680      ld      (hl),$80
1801 edb0      ldir    
1803 360b      ld      (hl),$0b
1805 eb        ex      de,hl
1806 3613      ld      (hl),$13
1808 23        inc     hl
1809 eb        ex      de,hl
180a 0e7e      ld      c,$7e
180c edb0      ldir    
180e d9        exx     
180f 23        inc     hl
1810 c9        ret     

1811 00        nop    

; RUN Basic command
 
1812 ca1614    jp      z,$1416
1815 cd1a14    call    $141a
1818 018916    ld      bc,$1689
181b 1810      jr      $182d

; GOSUB Basic command

181d 0e03      ld      c,$03
181f cdde12    call    $12de
1822 c1        pop     bc
1823 e5        push    hl
1824 e5        push    hl
1825 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
1828 e3        ex      (sp),hl
1829 3e8d      ld      a,$8d
182b f5        push    af
182c 33        inc     sp
182d c5        push    bc

; GOTO Basic command

182e cd8c17    call    $178c		; call GETNM
1831 cd8718    call    $1887
1834 e5        push    hl
1835 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
1838 b7        or      a
1839 ed52      sbc     hl,de
183b e1        pop     hl
183c 23        inc     hl
183d dcef13    call    c,$13ef
1840 d4ec13    call    nc,$13ec
1843 60        ld      h,b
1844 69        ld      l,c
1845 2b        dec     hl
1846 d8        ret     c

; BRANCH Error

1847 1e08      ld      e,$08
1849 c31913    jp      $1319			; go to BASIC Error

184c c0        ret     nz

184d 16ff      ld      d,$ff
184f e5        push    hl
1850 dde1      pop     ix
1852 cdae12    call    $12ae
1855 f9        ld      sp,hl
1856 fe8d      cp      $8d
1858 2011      jr      nz,$186b
185a e1        pop     hl
185b dde3      ex      (sp),ix
185d 218916    ld      hl,$1689
1860 e3        ex      (sp),hl
1861 c9        ret     

1862 c0        ret     nz

1863 16ff      ld      d,$ff
1865 cdae12    call    $12ae
1868 f9        ld      sp,hl
1869 fe8d      cp      $8d
186b 1e03      ld      e,$03
186d 20da      jr      nz,$1849
186f e1        pop     hl
1870 228a0c    ld      ($0c8a),hl		; 0c8a=LNNO Current line number
1873 23        inc     hl
1874 7c        ld      a,h
1875 b5        or      l
1876 2007      jr      nz,$187f
1878 3aad0c    ld      a,($0cad)
187b b7        or      a
187c c25413    jp      nz,$1354
187f 218916    ld      hl,$1689
1882 e3        ex      (sp),hl
1883 3ee1      ld      a,$e1
1885 013a0e    ld      bc,$0e3a
1888 00        nop     
1889 0600      ld      b,$00
188b 79        ld      a,c
188c 48        ld      c,b
188d 47        ld      b,a
188e 7e        ld      a,(hl)
188f b7        or      a
1890 c8        ret     z

1891 b8        cp      b
1892 c8        ret     z

1893 23        inc     hl
1894 fe22      cp      $22
1896 28f3      jr      z,$188b
1898 18f4      jr      $188e
189a cd531d    call    $1d53
189d cd5115    call    $1551		; call TSTC
18a0 		DB b0			; '=' token
18a1 d5        push    de
18a2 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
18a5 f5        push    af
18a6 cd8b1b    call    $1b8b
18a9 f1        pop     af
18aa e3        ex      (sp),hl
18ab 22af0c    ld      ($0caf),hl
18ae 1f        rra     
18af cd7c1b    call    $1b7c
18b2 2835      jr      z,$18e9
18b4 e5        push    hl
18b5 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
18b8 e5        push    hl
18b9 23        inc     hl
18ba 23        inc     hl
18bb 5e        ld      e,(hl)
18bc 23        inc     hl
18bd 56        ld      d,(hl)
18be 2a8c0c    ld      hl,($0c8c)		; 0c8c=TEXT
18c1 b7        or      a
18c2 ed52      sbc     hl,de
18c4 3012      jr      nc,$18d8
18c6 2a880c    ld      hl,($0c88)		; 0c88=HIMEM
18c9 b7        or      a
18ca ed52      sbc     hl,de
18cc d1        pop     de
18cd 3011      jr      nc,$18e0
18cf 2ab70c    ld      hl,($0cb7)		; 0cb7=TXTUNF
18d2 b7        or      a
18d3 ed52      sbc     hl,de
18d5 3009      jr      nc,$18e0
18d7 3ed1      ld      a,$d1
18d9 cd4621    call    $2146
18dc eb        ex      de,hl
18dd cd961f    call    $1f96
18e0 cd4621    call    $2146
18e3 e1        pop     hl
18e4 cd4126    call    $2641
18e7 e1        pop     hl
18e8 c9        ret     

18e9 e5        push    hl
18ea cd3e26    call    $263e
18ed d1        pop     de
18ee e1        pop     hl
18ef c9        ret     

18f0 fecc      cp      $cc
18f2 281c      jr      z,$1910
18f4 cd5022    call    $2250		; call I255
18f7 7e        ld      a,(hl)
18f8 47        ld      b,a
18f9 fe8d      cp      $8d
18fb 2805      jr      z,$1902
18fd cd5115    call    $1551		; call TSTC
1900 		db 89      		; GOTO Token
1901 2b        dec     hl
1902 4b        ld      c,e
1903 0d        dec     c
1904 78        ld      a,b
1905 cabc16    jp      z,$16bc
1908 cd8d17    call    $178d
190b fe2c      cp      $2c
190d c0        ret     nz

190e 18f3      jr      $1903
1910 cdd816    call    $16d8
1913 fe89      cp      $89
1915 2805      jr      z,$191c
1917 fe8d      cp      $8d
1919 c20813    jp      nz,$1308			; go to SYNTAX Error
191c 32840c    ld      ($0c84),a		; 0c84=ERRNO Number of last error generated
191f cd8d17    call    $178d
1922 ed53d10c  ld      ($0cd1),de	; 0cd1=ERRLN Line number for location of ON ERR routine
1926 c9        ret     

1927 ed7ba00c  ld      sp,($0ca0)		; 0ca0=save SP at start of each statement
192b c1        pop     bc
192c fe8d      cp      $8d
192e 2015      jr      nz,$1945
1930 2aaf0c    ld      hl,($0caf)
1933 f5        push    af
1934 7e        ld      a,(hl)
1935 b7        or      a
1936 2004      jr      nz,$193c
1938 23        inc     hl
1939 23        inc     hl
193a 23        inc     hl
193b 23        inc     hl
193c 23        inc     hl
193d f1        pop     af
193e e5        push    hl
193f 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
1942 e5        push    hl
1943 f5        push    af
1944 33        inc     sp
1945 ed5bd10c  ld      de,($0cd1)	; 0cd1=ERRLN Line number for location of ON ERR routine
1949 af        xor     a
194a 32840c    ld      ($0c84),a		; 0c84=ERRNO Number of last error generated
194d c5        push    bc
194e c34018    jp      $1840
1951 00        nop     
1952 00        nop     
1953 cd8b1b    call    $1b8b
1956 7e        ld      a,(hl)
1957 fe89      cp      $89
1959 2805      jr      z,$1960
195b cd5115    call    $1551		; call TSTC
195e 		db a5        		; then token
195f 2b        dec     hl
1960 cd7a1b    call    $1b7a
1963 cdf425    call    $25f4
1966 ca8718    jp      z,$1887
1969 cdd816    call    $16d8
196c da2e18    jp      c,$182e		; call GOTO Basic command
196f c3bb16    jp      $16bb
1972 cd4d22    call    $224d
1975 f5        push    af
1976 cd4c15    call    $154c		; call TSTCOM
1979 cd5022    call    $2250		; call I255
197c e60f      and     $0f
197e 2002      jr      nz,$1982
1980 c610      add     a,$10
1982 3d        dec     a
1983 e60f      and     $0f
1985 07        rlca    
1986 07        rlca    
1987 07        rlca    
1988 07        rlca    
1989 17        rla     
198a cb12      rl      d
198c 17        rla     
198d cb12      rl      d
198f 5f        ld      e,a
1990 f1        pop     af
1991 fe30      cp      $30
1993 d28717    jp      nc,$1787			; go to QTY Error
1996 e5        push    hl
1997 2a180c    ld      hl,($0c18)
199a 3629      ld      (hl),$29
199c 210a08    ld      hl,$080a
199f 19        add     hl,de
19a0 5f        ld      e,a
19a1 328e0c    ld      ($0c8e),a		; 0c8e=PRTCOL Current print column
19a4 1600      ld      d,$00
19a6 19        add     hl,de
19a7 22290c    ld      ($0c29),hl
19aa e1        pop     hl
19ab cd4c15    call    $154c		; call TSTCOM
19ae 2b        dec     hl
19af cdd816    call    $16d8
19b2 2855      jr      z,$1a09		; call CRLF
19b4 c8        ret     z

19b5 fea1      cp      $a1
19b7 285c      jr      z,$1a15
19b9 fea4      cp      $a4
19bb 2858      jr      z,$1a15
19bd fe40      cp      $40
19bf 28b1      jr      z,$1972
19c1 e5        push    hl
19c2 fe2c      cp      $2c
19c4 282a      jr      z,$19f0
19c6 fe3b      cp      $3b
19c8 286a      jr      z,$1a34
19ca c1        pop     bc
19cb cd8b1b    call    $1b8b
19ce e5        push    hl
19cf 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
19d2 b7        or      a
19d3 2015      jr      nz,$19ea
19d5 cd8c27    call    $278c
19d8 cdba1f    call    $1fba
19db 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
19de 3a8e0c    ld      a,($0c8e)		; 0c8e=PRTCOL Current print column
19e1 86        add     a,(hl)
19e2 cdfc1f    call    $1ffc
19e5 cdf02a    call    $2af0			; call PRM
19e8 		Db ' '+80h
19e9 af        xor     a
19ea c4fc1f    call    nz,$1ffc
19ed e1        pop     hl
19ee 18be      jr      $19ae
19f0 3a870c    ld      a,($0c87)		; 0c87=COMMAC largest col in print zone
19f3 47        ld      b,a
19f4 3a8e0c    ld      a,($0c8e)		; 0c8e=PRTCOL Current print column
19f7 b8        cp      b
19f8 d4091a    call    nc,$1a09		; call CRLF
19fb 3037      jr      nc,$1a34
19fd d610      sub     $10
19ff 30fc      jr      nc,$19fd
1a01 2f        cpl     
1a02 1827      jr      $1a2b
1a04 3600      ld      (hl),$00
1a06 21d40c    ld      hl,$0cd4

; CRLF
;
; Prints CRLF, using PR

1a09 3e0d      ld      a,$0d
1a0b c35c15    jp      $155c		; call PR

; CRLFZ
;
; As for CRLF, except that no CRLF is printed if the cursor is already at
; column zero. Registers affected: A, set to 0DH (or 00H if at column zero 
; under CRLFZ)

1a0e 3a8e0c    ld      a,($0c8e)		; 0c8e=PRTCOL Current print column
1a11 b7        or      a
1a12 20f5      jr      nz,$1a09		; call CRLF
1a14 c9        ret     

1a15 f5        push    af
1a16 cd4d22    call    $224d
1a19 cd5115    call    $1551		; call TSTC
1a1c 		db 29			; ')' char
1a1d 2b        dec     hl
1a1e f1        pop     af
1a1f d6a4      sub     $a4
1a21 e5        push    hl
1a22 2803      jr      z,$1a27
1a24 3a8e0c    ld      a,($0c8e)		; 0c8e=PRTCOL Current print column
1a27 2f        cpl     
1a28 83        add     a,e
1a29 3009      jr      nc,$1a34
1a2b 3c        inc     a
1a2c 47        ld      b,a
1a2d 3e20      ld      a,$20
1a2f cd5c15    call    $155c		; call PR
1a32 10f9      djnz    $1a2d
1a34 e1        pop     hl
1a35 cdd816    call    $16d8
1a38 c3b419    jp      $19b4
1a3b 3aae0c    ld      a,($0cae)
1a3e b7        or      a
1a3f c20213    jp      nz,$1302
1a42 c1        pop     bc
1a43 cdf02a    call    $2af0			; call PRM
1a46 		DB 'Re-enter all',0d+80h
1a53 c34514    jp      $1445
1a56 cd671f    call    $1f67
1a59 7e        ld      a,(hl)
1a5a fe22      cp      $22
1a5c 200c      jr      nz,$1a6a
1a5e cdbb1f    call    $1fbb
1a61 cd5115    call    $1551		; call TSTC
1a64 		db 3b        		; ';' char
1a65 e5        push    hl
1a66 cdfc1f    call    $1ffc
1a69 3ee5      ld      a,$e5
1a6b cd0c15    call    $150c
1a6e c1        pop     bc
1a6f da0617    jp      c,$1706
1a72 23        inc     hl
1a73 7e        ld      a,(hl)
1a74 b7        or      a
1a75 2b        dec     hl
1a76 c5        push    bc
1a77 ca8418    jp      z,$1884
1a7a 362c      ld      (hl),$2c
1a7c 1805      jr      $1a83
1a7e e5        push    hl
1a7f 2abd0c    ld      hl,($0cbd)		; 0cbd=DATPTR Pointer to current position in current DATA statement
1a82 f6af      or      $af
1a84 32ae0c    ld      ($0cae),a
1a87 e3        ex      (sp),hl
1a88 1803      jr      $1a8d
1a8a cd4c15    call    $154c		
1a8d cd531d    call    $1d53
1a90 e3        ex      (sp),hl
1a91 d5        push    de
1a92 7e        ld      a,(hl)
1a93 fe2c      cp      $2c
1a95 281b      jr      z,$1ab2
1a97 3aae0c    ld      a,($0cae)
1a9a b7        or      a
1a9b 2070      jr      nz,$1b0d
1a9d cdf02a    call    $2af0			; call PRM
1aa0 		DB '?'+80h
1aa1 cd0c15    call    $150c
1aa4 d1        pop     de
1aa5 c1        pop     bc
1aa6 da0617    jp      c,$1706
1aa9 23        inc     hl
1aaa 7e        ld      a,(hl)
1aab b7        or      a
1aac 2b        dec     hl
1aad c5        push    bc
1aae ca8418    jp      z,$1884
1ab1 d5        push    de
1ab2 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
1ab5 b7        or      a
1ab6 281a      jr      z,$1ad2
1ab8 cdd816    call    $16d8
1abb 57        ld      d,a
1abc 47        ld      b,a
1abd fe22      cp      $22
1abf 2805      jr      z,$1ac6
1ac1 163a      ld      d,$3a
1ac3 062c      ld      b,$2c
1ac5 2b        dec     hl
1ac6 cdbe1f    call    $1fbe
1ac9 eb        ex      de,hl
1aca 21dd1a    ld      hl,$1add
1acd e3        ex      (sp),hl
1ace d5        push    de
1acf c3b418    jp      $18b4
1ad2 cdd816    call    $16d8
1ad5 cdf326    call    $26f3
1ad8 e3        ex      (sp),hl
1ad9 cd3e26    call    $263e
1adc e1        pop     hl
1add cdd916    call    $16d9
1ae0 2805      jr      z,$1ae7
1ae2 fe2c      cp      $2c
1ae4 c23b1a    jp      nz,$1a3b
1ae7 e3        ex      (sp),hl
1ae8 cdd916    call    $16d9
1aeb 209d      jr      nz,$1a8a
1aed d1        pop     de
1aee 3aae0c    ld      a,($0cae)
1af1 b7        or      a
1af2 c24117    jp      nz,$1741
1af5 eb        ex      de,hl
1af6 d5        push    de
1af7 b6        or      (hl)
1af8 2811      jr      z,$1b0b
1afa cdf02a    call    $2af0			; call PRM
1afd 		DB 'Extra ignored',0d+80h
1b0b e1        pop     hl
1b0c c9        ret     

1b0d cd8518    call    $1885
1b10 b7        or      a
1b11 2011      jr      nz,$1b24
1b13 23        inc     hl
1b14 7e        ld      a,(hl)
1b15 23        inc     hl
1b16 b6        or      (hl)
1b17 1e04      ld      e,$04			; DATA error
1b19 ca1913    jp      z,$1319			; go to BASIC Error
1b1c 23        inc     hl
1b1d 5e        ld      e,(hl)
1b1e 23        inc     hl
1b1f 56        ld      d,(hl)
1b20 ed53aa0c  ld      ($0caa),de		; 0caa=DATLN Line number of current DATA statement
1b24 cdd816    call    $16d8
1b27 fe83      cp      $83
1b29 20e2      jr      nz,$1b0d
1b2b 1885      jr      $1ab2
1b2d 110000    ld      de,$0000
1b30 c4531d    call    nz,$1d53
1b33 22af0c    ld      ($0caf),hl
1b36 cdae12    call    $12ae
1b39 c21113    jp      nz,$1311			; go to NEXT Error
1b3c f9        ld      sp,hl
1b3d d5        push    de
1b3e 7e        ld      a,(hl)
1b3f 23        inc     hl
1b40 f5        push    af
1b41 d5        push    de
1b42 cd3226    call    $2632
1b45 e3        ex      (sp),hl
1b46 e5        push    hl
1b47 cdbf23    call    $23bf
1b4a e1        pop     hl
1b4b cd3e26    call    $263e
1b4e e1        pop     hl
1b4f cd6226    call    $2662
1b52 e5        push    hl
1b53 cd6b26    call    $266b
1b56 e1        pop     hl
1b57 c1        pop     bc
1b58 90        sub     b
1b59 cd6226    call    $2662
1b5c 2809      jr      z,$1b67
1b5e ed538a0c  ld      ($0c8a),de		; 0c8a=LNNO Current line number
1b62 69        ld      l,c
1b63 60        ld      h,b
1b64 c38516    jp      $1685
1b67 f9        ld      sp,hl
1b68 2aaf0c    ld      hl,($0caf)
1b6b 7e        ld      a,(hl)
1b6c fe2c      cp      $2c
1b6e c28916    jp      nz,$1689
1b71 cdd816    call    $16d8
1b74 cd301b    call    $1b30
1b77 cd8b1b    call    $1b8b
1b7a f637      or      $37
1b7c 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
1b7f 8f        adc     a,a
1b80 b7        or      a
1b81 e8        ret     pe

; go to TYPE Error

1b82 1e0d      ld      e,$0d
1b84 c31913    jp      $1319			; go to BASIC Error

1b87 cd5115    call    $1551		; call TSTC
1b8a 		db 28			; '(' char
1b8b 2b        dec     hl
1b8c 1600      ld      d,$00
1b8e d5        push    de
1b8f 0e01      ld      c,$01
1b91 cdde12    call    $12de
1b94 cdfe1b    call    $1bfe
1b97 22b10c    ld      ($0cb1),hl
1b9a 2ab10c    ld      hl,($0cb1)
1b9d c1        pop     bc
1b9e 78        ld      a,b
1b9f fe78      cp      $78
1ba1 d47a1b    call    nc,$1b7a
1ba4 7e        ld      a,(hl)
1ba5 1600      ld      d,$00
1ba7 d6af      sub     $af
1ba9 3815      jr      c,$1bc0
1bab fe03      cp      $03
1bad 3011      jr      nc,$1bc0
1baf fe01      cp      $01
1bb1 17        rla     
1bb2 aa        xor     d
1bb3 ba        cp      d
1bb4 57        ld      d,a
1bb5 da0813    jp      c,$1308			; go to SYNTAX Error
1bb8 22a80c    ld      ($0ca8),hl
1bbb cdd816    call    $16d8
1bbe 18e7      jr      $1ba7
1bc0 7a        ld      a,d
1bc1 b7        or      a
1bc2 c2d21c    jp      nz,$1cd2
1bc5 7e        ld      a,(hl)
1bc6 22a80c    ld      ($0ca8),hl
1bc9 d6a8      sub     $a8
1bcb d8        ret     c

1bcc fe07      cp      $07
1bce d0        ret     nc

1bcf 5f        ld      e,a
1bd0 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
1bd3 3d        dec     a
1bd4 b3        or      e
1bd5 7b        ld      a,e
1bd6 cadd20    jp      z,$20dd
1bd9 07        rlca    
1bda 83        add     a,e
1bdb 5f        ld      e,a
1bdc 212a12    ld      hl,$122a
1bdf 19        add     hl,de
1be0 78        ld      a,b
1be1 56        ld      d,(hl)
1be2 ba        cp      d
1be3 d0        ret     nc

1be4 23        inc     hl
1be5 cd7a1b    call    $1b7a
1be8 c5        push    bc
1be9 019a1b    ld      bc,$1b9a
1bec c5        push    bc
1bed 43        ld      b,e
1bee 4a        ld      c,d
1bef cd2526    call    $2625
1bf2 58        ld      e,b
1bf3 51        ld      d,c
1bf4 4e        ld      c,(hl)
1bf5 23        inc     hl
1bf6 46        ld      b,(hl)
1bf7 23        inc     hl
1bf8 c5        push    bc
1bf9 2aa80c    ld      hl,($0ca8)
1bfc 1890      jr      $1b8e
1bfe af        xor     a
1bff 32900c    ld      ($0c90),a	; 0c90=TYPE of expr being eval (0=number, 1=string)
1c02 cdd816    call    $16d8
1c05 1e13      ld      e,$13		; Operand error
1c07 ca1913    jp      z,$1319		; go to BASIC Error
1c0a daf326    jp      c,$26f3
1c0d cd5917    call    $1759		; call LTRCHK
1c10 303d      jr      nc,$1c4f
1c12 fea8      cp      $a8
1c14 28e8      jr      z,$1bfe
1c16 fe2e      cp      $2e
1c18 caf326    jp      z,$26f3
1c1b fea9      cp      $a9
1c1d 281f      jr      z,$1c3e
1c1f fe22      cp      $22
1c21 cabb1f    jp      z,$1fbb
1c24 feff      cp      $ff
1c26 2838      jr      z,$1c60
1c28 fea6      cp      $a6
1c2a ca301d    jp      z,$1d30
1c2d fea3      cp      $a3
1c2f ca2a1f    jp      z,$1f2a
1c32 d6b2      sub     $b2
1c34 303c      jr      nc,$1c72
1c36 cd871b    call    $1b87
1c39 cd5115    call    $1551		; call TSTC
1c3c 		db 29			; ')' char
1c3d c9        ret     

1c3e 167d      ld      d,$7d
1c40 cd8e1b    call    $1b8e
1c43 2ab10c    ld      hl,($0cb1)
1c46 e5        push    hl
1c47 cd1d26    call    $261d
1c4a cd7a1b    call    $1b7a
1c4d e1        pop     hl
1c4e c9        ret     

1c4f cd531d    call    $1d53
1c52 e5        push    hl
1c53 eb        ex      de,hl
1c54 22bf0c    ld      ($0cbf),hl	; 0cbf-0cc2=FPA Floating Point accumulator
1c57 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
1c5a b7        or      a
1c5b cc3226    call    z,$2632
1c5e e1        pop     hl
1c5f c9        ret     

1c60 cdd816    call    $16d8
1c63 d6c0      sub     $c0
1c65 da0813    jp      c,$1308			; go to SYNTAX Error
1c68 e5        push    hl
1c69 2600      ld      h,$00
1c6b 07        rlca    
1c6c 6f        ld      l,a
1c6d 01800f    ld      bc,$0f80		; 0f80=Aux address table
1c70 1833      jr      $1ca5
1c72 0600      ld      b,$00
1c74 07        rlca    
1c75 4f        ld      c,a
1c76 c5        push    bc
1c77 cdd816    call    $16d8
1c7a 79        ld      a,c
1c7b fe2d      cp      $2d
1c7d 301e      jr      nc,$1c9d
1c7f fe27      cp      $27
1c81 3817      jr      c,$1c9a
1c83 cd871b    call    $1b87
1c86 cd4c15    call    $154c		; call TSTCOM
1c89 cd7b1b    call    $1b7b
1c8c eb        ex      de,hl
1c8d 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
1c90 e3        ex      (sp),hl
1c91 e5        push    hl
1c92 eb        ex      de,hl
1c93 cd5022    call    $2250		; call I255
1c96 eb        ex      de,hl
1c97 e3        ex      (sp),hl
1c98 1808      jr      $1ca2
1c9a cd361c    call    $1c36
1c9d e3        ex      (sp),hl
1c9e 114a1c    ld      de,$1c4a
1ca1 d5        push    de
1ca2 013f12    ld      bc,$123f
1ca5 09        add     hl,bc
1ca6 4e        ld      c,(hl)
1ca7 23        inc     hl
1ca8 66        ld      h,(hl)
1ca9 69        ld      l,c
1caa e9        jp      (hl)
1cab f6af      or      $af
1cad f5        push    af
1cae cd7a1b    call    $1b7a
1cb1 cd7217    call    $1772
1cb4 f1        pop     af
1cb5 eb        ex      de,hl
1cb6 c1        pop     bc
1cb7 e3        ex      (sp),hl
1cb8 eb        ex      de,hl
1cb9 cd3526    call    $2635
1cbc f5        push    af
1cbd cd7217    call    $1772
1cc0 f1        pop     af
1cc1 c1        pop     bc
1cc2 79        ld      a,c
1cc3 21ec1e    ld      hl,$1eec
1cc6 2005      jr      nz,$1ccd
1cc8 a3        and     e
1cc9 4f        ld      c,a
1cca 78        ld      a,b
1ccb a2        and     d
1ccc e9        jp      (hl)
1ccd b3        or      e
1cce 4f        ld      c,a
1ccf 78        ld      a,b
1cd0 b2        or      d
1cd1 e9        jp      (hl)
1cd2 217e22    ld      hl,$227e
1cd5 3a900c    ld      a,($0c90)	; 0c90=TYPE of expr being eval (0=number, 1=string)
1cd8 1f        rra     
1cd9 7a        ld      a,d
1cda 17        rla     
1cdb 5f        ld      e,a
1cdc 1664      ld      d,$64
1cde 78        ld      a,b
1cdf ba        cp      d
1ce0 d0        ret     nc

1ce1 c3e81b    jp      $1be8
1ce4 00        nop     
1ce5 79        ld      a,c
1ce6 b7        or      a
1ce7 1f        rra     
1ce8 c1        pop     bc
1ce9 d1        pop     de
1cea f5        push    af
1ceb cd7c1b    call    $1b7c
1cee 21261d    ld      hl,$1d26
1cf1 e5        push    hl
1cf2 ca6b26    jp      z,$266b
1cf5 af        xor     a
1cf6 32900c    ld      ($0c90),a	; 0c90=TYPE of expr being eval (0=number, 1=string)
1cf9 d5        push    de
1cfa cd2921    call    $2129
1cfd 7e        ld      a,(hl)
1cfe 23        inc     hl
1cff 23        inc     hl
1d00 4e        ld      c,(hl)
1d01 23        inc     hl
1d02 46        ld      b,(hl)
1d03 d1        pop     de
1d04 c5        push    bc
1d05 f5        push    af
1d06 cd2d21    call    $212d
1d09 cd6226    call    $2662
1d0c f1        pop     af
1d0d 57        ld      d,a
1d0e e1        pop     hl
1d0f 7b        ld      a,e
1d10 b2        or      d
1d11 c8        ret     z

1d12 7a        ld      a,d
1d13 d601      sub     $01
1d15 d8        ret     c

1d16 af        xor     a
1d17 bb        cp      e
1d18 3c        inc     a
1d19 d0        ret     nc

1d1a 15        dec     d
1d1b 1d        dec     e
1d1c 0a        ld      a,(bc)
1d1d be        cp      (hl)
1d1e 23        inc     hl
1d1f 03        inc     bc
1d20 28ed      jr      z,$1d0f
1d22 3f        ccf     
1d23 c3ff25    jp      $25ff
1d26 3c        inc     a
1d27 8f        adc     a,a
1d28 c1        pop     bc
1d29 a0        and     b
1d2a c6ff      add     a,$ff
1d2c 9f        sbc     a,a
1d2d c30626    jp      $2606
1d30 165a      ld      d,$5a
1d32 cd8e1b    call    $1b8e
1d35 cd7a1b    call    $1b7a
1d38 cd7217    call    $1772
1d3b 7b        ld      a,e
1d3c 2f        cpl     
1d3d 4f        ld      c,a
1d3e 7a        ld      a,d
1d3f 2f        cpl     
1d40 cdec1e    call    $1eec
1d43 c1        pop     bc
1d44 c39a1b    jp      $1b9a
1d47 cdd916    call    $16d9
1d4a c8        ret     z

1d4b cd4c15    call    $154c		; call TSTCOM
1d4e 01471d    ld      bc,$1d47
1d51 c5        push    bc
1d52 f6af      or      $af
1d54 328f0c    ld      ($0c8f),a	; 0c8f=DIMFLG DIM array/access array flag
1d57 46        ld      b,(hl)
1d58 cd5917    call    $1759		; call LTRCHK
1d5b da0813    jp      c,$1308			; go to SYNTAX Error
1d5e af        xor     a
1d5f 4f        ld      c,a
1d60 32900c    ld      ($0c90),a	; 0c90=TYPE of expr being eval (0=number, 1=string)
1d63 cdd816    call    $16d8
1d66 3805      jr      c,$1d6d
1d68 cd5917    call    $1759		; call LTRCHK
1d6b 380b      jr      c,$1d78
1d6d 4f        ld      c,a
1d6e cdd816    call    $16d8
1d71 38fb      jr      c,$1d6e
1d73 cd5917    call    $1759		; call LTRCHK
1d76 30f6      jr      nc,$1d6e
1d78 d624      sub     $24
1d7a 2009      jr      nz,$1d85
1d7c 3c        inc     a
1d7d 32900c    ld      ($0c90),a	; 0c90=TYPE of expr being eval (0=number, 1=string)
1d80 cbf9      set     7,c
1d82 cdd816    call    $16d8
1d85 3aac0c    ld      a,($0cac)
1d88 3d        dec     a
1d89 ca1c1e    jp      z,$1e1c
1d8c f2941d    jp      p,$1d94
1d8f 7e        ld      a,(hl)
1d90 d628      sub     $28
1d92 2861      jr      z,$1df5
1d94 af        xor     a
1d95 32ac0c    ld      ($0cac),a
1d98 e5        push    hl
1d99 ed5bb90c  ld      de,($0cb9)	; 0cb9=VARPTR Pointer to end of simple variable area
1d9d 2ab70c    ld      hl,($0cb7)		; 0cb7=TXTUNF
1da0 cd4615    call    $1546			; call CPHLDE
1da3 2810      jr      z,$1db5
1da5 79        ld      a,c
1da6 96        sub     (hl)
1da7 23        inc     hl
1da8 2002      jr      nz,$1dac
1daa 78        ld      a,b
1dab 96        sub     (hl)
1dac 23        inc     hl
1dad 2838      jr      z,$1de7
1daf 23        inc     hl
1db0 23        inc     hl
1db1 23        inc     hl
1db2 23        inc     hl
1db3 18eb      jr      $1da0
1db5 e1        pop     hl
1db6 e3        ex      (sp),hl
1db7 d5        push    de
1db8 11521c    ld      de,$1c52
1dbb cd4615    call    $1546			; call CPHLDE
1dbe d1        pop     de
1dbf 2829      jr      z,$1dea
1dc1 e3        ex      (sp),hl
1dc2 e5        push    hl
1dc3 c5        push    bc
1dc4 010600    ld      bc,$0006
1dc7 2abb0c    ld      hl,($0cbb)		; 0cbb=LOMEM
1dca e5        push    hl
1dcb 09        add     hl,bc
1dcc c1        pop     bc
1dcd e5        push    hl
1dce cdce12    call    $12ce
1dd1 e1        pop     hl
1dd2 22bb0c    ld      ($0cbb),hl		; 0cbb=LOMEM
1dd5 60        ld      h,b
1dd6 69        ld      l,c
1dd7 22b90c    ld      ($0cb9),hl		; 0cb9=VARPTR Pointer to end of simple variable area
1dda 2b        dec     hl
1ddb 3600      ld      (hl),$00
1ddd cd4615    call    $1546			; call CPHLDE
1de0 20f8      jr      nz,$1dda
1de2 d1        pop     de
1de3 73        ld      (hl),e
1de4 23        inc     hl
1de5 72        ld      (hl),d
1de6 23        inc     hl
1de7 eb        ex      de,hl
1de8 e1        pop     hl
1de9 c9        ret     

1dea 32c20c    ld      ($0cc2),a	; 0cbf-0cc2=FPA Floating Point accumulator
1ded 217712    ld      hl,$1277
1df0 22bf0c    ld      ($0cbf),hl	; 0cbf-0cc2=FPA Floating Point accumulator
1df3 e1        pop     hl
1df4 c9        ret     

1df5 e5        push    hl
1df6 2a8f0c    ld      hl,($0c8f)		; 0c8f=DIMFLG DIM array/access array flag
1df9 e3        ex      (sp),hl
1dfa 57        ld      d,a
1dfb d5        push    de
1dfc c5        push    bc
1dfd cd6617    call    $1766		; call INTEXP
1e00 c1        pop     bc
1e01 f1        pop     af
1e02 eb        ex      de,hl
1e03 e3        ex      (sp),hl
1e04 e5        push    hl
1e05 eb        ex      de,hl
1e06 3c        inc     a
1e07 57        ld      d,a
1e08 7e        ld      a,(hl)
1e09 fe2c      cp      $2c
1e0b 28ee      jr      z,$1dfb
1e0d cd5115    call    $1551		; call TSTC
1e10 		db 29			; ')' char
1e11 22b10c    ld      ($0cb1),hl
1e14 e1        pop     hl
1e15 228f0c    ld      ($0c8f),hl	; 0c8f=DIMFLG DIM array/access array flag
1e18 1e00      ld      e,$00
1e1a d5        push    de
1e1b 11e5f5    ld      de,$f5e5
1e1e 2ab90c    ld      hl,($0cb9)	; 0cb9=VARPTR Pointer to end of simple variable area
1e21 3e19      ld      a,$19
1e23 ed5bbb0c  ld      de,($0cbb)		; 0cbb=LOMEM
1e27 cd4615    call    $1546			; call CPHLDE
1e2a 2822      jr      z,$1e4e
1e2c 7e        ld      a,(hl)
1e2d b9        cp      c
1e2e 23        inc     hl
1e2f 2002      jr      nz,$1e33
1e31 7e        ld      a,(hl)
1e32 b8        cp      b
1e33 23        inc     hl
1e34 5e        ld      e,(hl)
1e35 23        inc     hl
1e36 56        ld      d,(hl)
1e37 23        inc     hl
1e38 20e8      jr      nz,$1e22
1e3a 3a8f0c    ld      a,($0c8f)	; 0c8f=DIMFLG DIM array/access array flag
1e3d b7        or      a
1e3e c21413    jp      nz,$1314		; go to DIM Error
1e41 f1        pop     af
1e42 44        ld      b,h
1e43 4d        ld      c,l
1e44 28ad      jr      z,$1df3
1e46 96        sub     (hl)
1e47 285e      jr      z,$1ea7

; RANGE Error

1e49 1e09      ld      e,$09
1e4b c31913    jp      $1319		; go to BASIC Error

1e4e 110400    ld      de,$0004
1e51 f1        pop     af
1e52 ca8717    jp      z,$1787			; go to QTY Error
1e55 71        ld      (hl),c
1e56 23        inc     hl
1e57 70        ld      (hl),b
1e58 23        inc     hl
1e59 4f        ld      c,a
1e5a cdde12    call    $12de
1e5d 23        inc     hl
1e5e 23        inc     hl
1e5f 22a80c    ld      ($0ca8),hl
1e62 71        ld      (hl),c
1e63 23        inc     hl
1e64 3a8f0c    ld      a,($0c8f)	; 0c8f=DIMFLG DIM array/access array flag
1e67 17        rla     
1e68 79        ld      a,c
1e69 010b00    ld      bc,$000b
1e6c 3002      jr      nc,$1e70
1e6e c1        pop     bc
1e6f 03        inc     bc
1e70 71        ld      (hl),c
1e71 23        inc     hl
1e72 70        ld      (hl),b
1e73 23        inc     hl
1e74 f5        push    af
1e75 e5        push    hl
1e76 cddb26    call    $26db
1e79 eb        ex      de,hl
1e7a e1        pop     hl
1e7b f1        pop     af
1e7c 3d        dec     a
1e7d 20ea      jr      nz,$1e69
1e7f f5        push    af
1e80 42        ld      b,d
1e81 4b        ld      c,e
1e82 eb        ex      de,hl
1e83 19        add     hl,de
1e84 38c3      jr      c,$1e49			; go to RANGE Error
1e86 cdeb12    call    $12eb
1e89 22bb0c    ld      ($0cbb),hl		; 0cbb=LOMEM
1e8c 2b        dec     hl
1e8d 3600      ld      (hl),$00
1e8f cd4615    call    $1546			; call CPHLDE
1e92 20f8      jr      nz,$1e8c
1e94 03        inc     bc
1e95 57        ld      d,a
1e96 2aa80c    ld      hl,($0ca8)
1e99 5e        ld      e,(hl)
1e9a eb        ex      de,hl
1e9b 29        add     hl,hl
1e9c 09        add     hl,bc
1e9d eb        ex      de,hl
1e9e 2b        dec     hl
1e9f 2b        dec     hl
1ea0 73        ld      (hl),e
1ea1 23        inc     hl
1ea2 72        ld      (hl),d
1ea3 23        inc     hl
1ea4 f1        pop     af
1ea5 3822      jr      c,$1ec9
1ea7 47        ld      b,a
1ea8 4f        ld      c,a
1ea9 7e        ld      a,(hl)
1eaa 23        inc     hl
1eab 16e1      ld      d,$e1
1ead 5e        ld      e,(hl)
1eae 23        inc     hl
1eaf 56        ld      d,(hl)
1eb0 23        inc     hl
1eb1 e3        ex      (sp),hl
1eb2 f5        push    af
1eb3 cd4615    call    $1546			; call CPHLDE
1eb6 3091      jr      nc,$1e49			; go to RANGE Error
1eb8 e5        push    hl
1eb9 cddb26    call    $26db
1ebc d1        pop     de
1ebd 19        add     hl,de
1ebe f1        pop     af
1ebf 3d        dec     a
1ec0 44        ld      b,h
1ec1 4d        ld      c,l
1ec2 20e8      jr      nz,$1eac
1ec4 29        add     hl,hl
1ec5 29        add     hl,hl
1ec6 c1        pop     bc
1ec7 09        add     hl,bc
1ec8 eb        ex      de,hl
1ec9 2ab10c    ld      hl,($0cb1)
1ecc c9        ret     

1ecd c1        pop     bc
1ece e1        pop     hl
1ecf 7e        ld      a,(hl)
1ed0 fe24      cp      $24
1ed2 2001      jr      nz,$1ed5
1ed4 23        inc     hl
1ed5 e5        push    hl
1ed6 c5        push    bc
1ed7 cdf91e    call    $1ef9
1eda 200b      jr      nz,$1ee7
1edc e5        push    hl
1edd cd2921    call    $2129
1ee0 cd3420    call    $2034
1ee3 d1        pop     de
1ee4 2aa60c    ld      hl,($0ca6)		; 0ca6=STRBOT
1ee7 7d        ld      a,l
1ee8 93        sub     e
1ee9 4f        ld      c,a
1eea 7c        ld      a,h
1eeb 9a        sbc     a,d
1eec 41        ld      b,c
1eed 50        ld      d,b
1eee 1e00      ld      e,$00
1ef0 21900c    ld      hl,$0c90		; 0c90=TYPE of expr being eval (0=number, 1=string)
1ef3 73        ld      (hl),e
1ef4 0690      ld      b,$90
1ef6 c30b26    jp      $260b
1ef9 ed5bbb0c  ld      de,($0cbb)		; 0cbb=LOMEM
1efd 2a880c    ld      hl,($0c88)		; 0c88=HIMEM
1f00 c9        ret     

1f01 3a8e0c    ld      a,($0c8e)		; 0c8e=PRTCOL Current print column
1f04 47        ld      b,a
1f05 af        xor     a
1f06 18e5      jr      $1eed
1f08 cd751f    call    $1f75
1f0b cd671f    call    $1f67
1f0e 018518    ld      bc,$1885
1f11 c5        push    bc
1f12 d5        push    de
1f13 cd5115    call    $1551		; call TSTC
1f16 		db 28			; '(' char
1f17 cd531d    call    $1d53
1f1a cd7a1b    call    $1b7a
1f1d cd5115    call    $1551		; call TSTC
1f20 		db 29        		; ')' char
1f21 cd5115    call    $1551		; call TSTC
1f24 		db b0        		; '=' token
1f25 44        ld      b,h
1f26 4d        ld      c,l
1f27 e3        ex      (sp),hl
1f28 1838      jr      $1f62
1f2a cd751f    call    $1f75
1f2d d5        push    de
1f2e cd361c    call    $1c36
1f31 cd7a1b    call    $1b7a
1f34 e3        ex      (sp),hl
1f35 5e        ld      e,(hl)
1f36 23        inc     hl
1f37 56        ld      d,(hl)
1f38 23        inc     hl
1f39 7e        ld      a,(hl)
1f3a 23        inc     hl
1f3b 66        ld      h,(hl)
1f3c 6f        ld      l,a
1f3d cd4615    call    $1546			; call CPHLDE
1f40 ca1713    jp      z,$1317			; go to Fn Defn Error
1f43 4e        ld      c,(hl)
1f44 23        inc     hl
1f45 46        ld      b,(hl)
1f46 23        inc     hl
1f47 c5        push    bc
1f48 4e        ld      c,(hl)
1f49 23        inc     hl
1f4a 46        ld      b,(hl)
1f4b c5        push    bc
1f4c 2b        dec     hl
1f4d 2b        dec     hl
1f4e 2b        dec     hl
1f4f e5        push    hl
1f50 d5        push    de
1f51 cd3e26    call    $263e
1f54 e1        pop     hl
1f55 cd771b    call    $1b77
1f58 2b        dec     hl
1f59 cdd816    call    $16d8
1f5c c20813    jp      nz,$1308			; go to SYNTAX Error
1f5f e1        pop     hl
1f60 d1        pop     de
1f61 c1        pop     bc
1f62 71        ld      (hl),c
1f63 23        inc     hl
1f64 70        ld      (hl),b
1f65 184d      jr      $1fb4
1f67 e5        push    hl
1f68 2a8a0c    ld      hl,($0c8a)		; 0c8a=LNNO Current line number
1f6b 23        inc     hl
1f6c 7c        ld      a,h
1f6d b5        or      l
1f6e e1        pop     hl
1f6f c0        ret     nz
1f70 1e0c      ld      e,$0c			; direct error
1f72 c31913    jp      $1319			; go to BASIC Error
1f75 cd5115    call    $1551		; call TSTC
1f78 		db a3			; FN token
1f79 3e80      ld      a,$80
1f7b 32ac0c    ld      ($0cac),a
1f7e b6        or      (hl)
1f7f 47        ld      b,a
1f80 cd581d    call    $1d58
1f83 c37a1b    jp      $1b7a
1f86 cd7a1b    call    $1b7a
1f89 cd8c27    call    $278c
1f8c cdba1f    call    $1fba
1f8f cd2921    call    $2129
1f92 018321    ld      bc,$2183
1f95 c5        push    bc
1f96 7e        ld      a,(hl)
1f97 23        inc     hl
1f98 23        inc     hl
1f99 e5        push    hl
1f9a cd0c20    call    $200c
1f9d e1        pop     hl
1f9e 4e        ld      c,(hl)
1f9f 23        inc     hl
1fa0 46        ld      b,(hl)
1fa1 cdae1f    call    $1fae
1fa4 e5        push    hl
1fa5 6f        ld      l,a
1fa6 cd1d21    call    $211d
1fa9 d1        pop     de
1faa c9        ret     

1fab cd0c20    call    $200c
1fae 21a20c    ld      hl,$0ca2
1fb1 e5        push    hl
1fb2 77        ld      (hl),a
1fb3 23        inc     hl
1fb4 23        inc     hl
1fb5 73        ld      (hl),e
1fb6 23        inc     hl
1fb7 72        ld      (hl),d
1fb8 e1        pop     hl
1fb9 c9        ret     

1fba 2b        dec     hl
1fbb 0622      ld      b,$22
1fbd 50        ld      d,b
1fbe e5        push    hl
1fbf 0eff      ld      c,$ff
1fc1 23        inc     hl
1fc2 7e        ld      a,(hl)
1fc3 0c        inc     c
1fc4 b7        or      a
1fc5 2806      jr      z,$1fcd
1fc7 ba        cp      d
1fc8 2803      jr      z,$1fcd
1fca b8        cp      b
1fcb 20f4      jr      nz,$1fc1
1fcd fe22      cp      $22
1fcf ccd816    call    z,$16d8
1fd2 e3        ex      (sp),hl
1fd3 23        inc     hl
1fd4 eb        ex      de,hl
1fd5 79        ld      a,c
1fd6 cdae1f    call    $1fae
1fd9 11a20c    ld      de,$0ca2
1fdc 2a940c    ld      hl,($0c94)
1fdf 22bf0c    ld      ($0cbf),hl	; 0cbf-0cc2=FPA Floating Point accumulator
1fe2 3e01      ld      a,$01
1fe4 32900c    ld      ($0c90),a	; 0c90=TYPE of expr being eval (0=number, 1=string)
1fe7 cd4126    call    $2641
1fea 22940c    ld      ($0c94),hl
1fed b7        or      a
1fee ed52      sbc     hl,de
1ff0 e1        pop     hl
1ff1 7e        ld      a,(hl)
1ff2 c0        ret     nz
1ff3 1e10      ld      e,$10			; Str too complex error
1ff5 c31913    jp      $1319			; go to BASIC Error
1ff8 23        inc     hl
1ff9 cdba1f    call    $1fba
1ffc cd2921    call    $2129
1fff cd6226    call    $2662
2002 1c        inc     e
2003 1d        dec     e
2004 c8        ret     z

2005 0a        ld      a,(bc)
2006 cd5c15    call    $155c		; call PR
2009 03        inc     bc
200a 18f7      jr      $2003
200c b7        or      a
200d 0ef1      ld      c,$f1
200f f5        push    af
2010 ed5b880c  ld      de,($0c88)		; 0c88=HIMEM
2014 2aa60c    ld      hl,($0ca6)		; 0ca6=STRBOT
2017 2f        cpl     
2018 4f        ld      c,a
2019 06ff      ld      b,$ff
201b 09        add     hl,bc
201c 23        inc     hl
201d cd4615    call    $1546			; call CPHLDE
2020 3807      jr      c,$2029
2022 22a60c    ld      ($0ca6),hl		; 0ca6=STRBOT
2025 23        inc     hl
2026 eb        ex      de,hl
2027 f1        pop     af
2028 c9        ret     

2029 f1        pop     af
202a 1e0e      ld      e,$0e
202c 28c7      jr      z,$1ff5
202e bf        cp      a
202f f5        push    af
2030 010e20    ld      bc,$200e
2033 c5        push    bc
2034 2a920c    ld      hl,($0c92)		; 0c92=TOPRAM
2037 22a60c    ld      ($0ca6),hl		; 0ca6=STRBOT
203a 210000    ld      hl,$0000
203d e5        push    hl
203e 2a880c    ld      hl,($0c88)		; 0c88=HIMEM
2041 e5        push    hl
2042 21960c    ld      hl,$0c96
2045 ed5b940c  ld      de,($0c94)
2049 cd4615    call    $1546			; call CPHLDE
204c 014520    ld      bc,$2045
204f 203f      jr      nz,$2090
2051 2ab70c    ld      hl,($0cb7)		; 0cb7=TXTUNF
2054 ed5bb90c  ld      de,($0cb9)		; 0cb9=VARPTR Pointer to end of simple variable area
2058 cd4615    call    $1546			; call CPHLDE
205b 280a      jr      z,$2067
205d 7e        ld      a,(hl)
205e 23        inc     hl
205f 23        inc     hl
2060 b7        or      a
2061 cd9320    call    $2093
2064 18ee      jr      $2054
2066 c1        pop     bc
2067 ed5bbb0c  ld      de,($0cbb)		; 0cbb=LOMEM
206b cd4615    call    $1546			; call CPHLDE
206e 2848      jr      z,$20b8
2070 cd6226    call    $2662
2073 7b        ld      a,e
2074 e5        push    hl
2075 09        add     hl,bc
2076 b7        or      a
2077 f26620    jp      p,$2066
207a 22a80c    ld      ($0ca8),hl
207d e1        pop     hl
207e 4e        ld      c,(hl)
207f 0600      ld      b,$00
2081 09        add     hl,bc
2082 09        add     hl,bc
2083 23        inc     hl
2084 ed5ba80c  ld      de,($0ca8)
2088 cd4615    call    $1546			; call CPHLDE
208b 28da      jr      z,$2067
208d 018420    ld      bc,$2084
2090 c5        push    bc
2091 f680      or      $80
2093 7e        ld      a,(hl)
2094 23        inc     hl
2095 23        inc     hl
2096 5e        ld      e,(hl)
2097 23        inc     hl
2098 56        ld      d,(hl)
2099 23        inc     hl
209a f0        ret     p

209b b7        or      a
209c c8        ret     z

209d 44        ld      b,h
209e 4d        ld      c,l
209f 2aa60c    ld      hl,($0ca6)		; 0ca6=STRBOT
20a2 ed52      sbc     hl,de
20a4 60        ld      h,b
20a5 69        ld      l,c
20a6 d8        ret     c

20a7 e1        pop     hl
20a8 e3        ex      (sp),hl
20a9 cd4615    call    $1546			; call CPHLDE
20ac e3        ex      (sp),hl
20ad e5        push    hl
20ae 60        ld      h,b
20af 69        ld      l,c
20b0 d0        ret     nc

20b1 c1        pop     bc
20b2 f1        pop     af
20b3 f1        pop     af
20b4 e5        push    hl
20b5 d5        push    de
20b6 c5        push    bc
20b7 c9        ret     

20b8 d1        pop     de
20b9 e1        pop     hl
20ba 7d        ld      a,l
20bb b4        or      h
20bc c8        ret     z

20bd 2b        dec     hl
20be 46        ld      b,(hl)
20bf 2b        dec     hl
20c0 4e        ld      c,(hl)
20c1 e5        push    hl
20c2 2b        dec     hl
20c3 2b        dec     hl
20c4 6e        ld      l,(hl)
20c5 2600      ld      h,$00
20c7 09        add     hl,bc
20c8 50        ld      d,b
20c9 59        ld      e,c
20ca 2b        dec     hl
20cb 44        ld      b,h
20cc 4d        ld      c,l
20cd 2aa60c    ld      hl,($0ca6)		; 0ca6=STRBOT
20d0 cdd112    call    $12d1
20d3 e1        pop     hl
20d4 71        ld      (hl),c
20d5 23        inc     hl
20d6 70        ld      (hl),b
20d7 69        ld      l,c
20d8 60        ld      h,b
20d9 2b        dec     hl
20da c33720    jp      $2037
20dd c5        push    bc
20de e5        push    hl
20df 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
20e2 e3        ex      (sp),hl
20e3 cdfe1b    call    $1bfe
20e6 e3        ex      (sp),hl
20e7 cd7b1b    call    $1b7b
20ea 7e        ld      a,(hl)
20eb e5        push    hl
20ec 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
20ef e5        push    hl
20f0 86        add     a,(hl)
20f1 1e0f      ld      e,$0f		; Str Overflow error
20f3 da1913    jp      c,$1319		; go to BASIC Error
20f6 cdab1f    call    $1fab
20f9 d1        pop     de
20fa cd2d21    call    $212d
20fd e3        ex      (sp),hl
20fe cd2c21    call    $212c
2101 e5        push    hl
2102 ed5ba40c  ld      de,($0ca4)
2106 cd1421    call    $2114
2109 cd1421    call    $2114
210c 219d1b    ld      hl,$1b9d
210f e3        ex      (sp),hl
2110 e5        push    hl
2111 c3d91f    jp      $1fd9
2114 e1        pop     hl
2115 e3        ex      (sp),hl
2116 7e        ld      a,(hl)
2117 23        inc     hl
2118 23        inc     hl
2119 4e        ld      c,(hl)
211a 23        inc     hl
211b 46        ld      b,(hl)
211c 6f        ld      l,a
211d 2c        inc     l
211e 2d        dec     l
211f c8        ret     z

2120 0a        ld      a,(bc)
2121 12        ld      (de),a
2122 03        inc     bc
2123 13        inc     de
2124 18f8      jr      $211e
2126 cd7b1b    call    $1b7b
2129 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
212c eb        ex      de,hl
212d cd4621    call    $2146
2130 eb        ex      de,hl
2131 c0        ret     nz

2132 d5        push    de
2133 50        ld      d,b
2134 59        ld      e,c
2135 1b        dec     de
2136 4e        ld      c,(hl)
2137 2aa60c    ld      hl,($0ca6)		; 0ca6=STRBOT
213a cd4615    call    $1546			; call CPHLDE
213d 2005      jr      nz,$2144
213f 47        ld      b,a
2140 09        add     hl,bc
2141 22a60c    ld      ($0ca6),hl		; 0ca6=STRBOT
2144 e1        pop     hl
2145 c9        ret     

2146 2a940c    ld      hl,($0c94)
2149 2b        dec     hl
214a 46        ld      b,(hl)
214b 2b        dec     hl
214c 4e        ld      c,(hl)
214d 2b        dec     hl
214e 2b        dec     hl
214f cd4615    call    $1546			; call CPHLDE
2152 c0        ret     nz

2153 22940c    ld      ($0c94),hl
2156 c9        ret     

2157 01041f    ld      bc,$1f04
215a c5        push    bc
215b cd2621    call    $2126
215e af        xor     a
215f 57        ld      d,a
2160 32900c    ld      ($0c90),a	; 0c90=TYPE of expr being eval (0=number, 1=string)
2163 7e        ld      a,(hl)
2164 b7        or      a
2165 c9        ret     

2166 01041f    ld      bc,$1f04
2169 c5        push    bc
216a cd5b21    call    $215b
216d ca8717    jp      z,$1787			; go to QTY Error
2170 23        inc     hl
2171 23        inc     hl
2172 5e        ld      e,(hl)
2173 23        inc     hl
2174 56        ld      d,(hl)
2175 1a        ld      a,(de)
2176 c9        ret     

2177 3e01      ld      a,$01
2179 cdab1f    call    $1fab
217c cd5322    call    $2253
217f 2aa40c    ld      hl,($0ca4)
2182 73        ld      (hl),e
2183 c1        pop     bc
2184 c3d91f    jp      $1fd9
2187 cd0822    call    $2208
218a af        xor     a
218b e3        ex      (sp),hl
218c 4f        ld      c,a
218d e5        push    hl
218e 7e        ld      a,(hl)
218f b8        cp      b
2190 3802      jr      c,$2194
2192 78        ld      a,b
2193 110e00    ld      de,$000e
2196 c5        push    bc
2197 cd0c20    call    $200c
219a c1        pop     bc
219b e1        pop     hl
219c e5        push    hl
219d 23        inc     hl
219e 23        inc     hl
219f 46        ld      b,(hl)
21a0 23        inc     hl
21a1 66        ld      h,(hl)
21a2 68        ld      l,b
21a3 0600      ld      b,$00
21a5 09        add     hl,bc
21a6 44        ld      b,h
21a7 4d        ld      c,l
21a8 cdae1f    call    $1fae
21ab 6f        ld      l,a
21ac cd1d21    call    $211d
21af d1        pop     de
21b0 cd2d21    call    $212d
21b3 c3d91f    jp      $1fd9
21b6 cd0822    call    $2208
21b9 d1        pop     de
21ba d5        push    de
21bb 1a        ld      a,(de)
21bc 90        sub     b
21bd 18cc      jr      $218b
21bf eb        ex      de,hl
21c0 7e        ld      a,(hl)
21c1 cd0d22    call    $220d
21c4 04        inc     b
21c5 05        dec     b
21c6 ca8717    jp      z,$1787			; go to QTY Error
21c9 c5        push    bc
21ca 1eff      ld      e,$ff
21cc fe29      cp      $29
21ce 2806      jr      z,$21d6
21d0 cd4c15    call    $154c		; call TSTCOM
21d3 cd5022    call    $2250		; call I255
21d6 cd5115    call    $1551		; call TSTC
21d9 		db 29        		; ')' char
21da f1        pop     af
21db e3        ex      (sp),hl
21dc 018d21    ld      bc,$218d
21df c5        push    bc
21e0 3d        dec     a
21e1 be        cp      (hl)
21e2 0600      ld      b,$00
21e4 d0        ret     nc

21e5 4f        ld      c,a
21e6 7e        ld      a,(hl)
21e7 91        sub     c
21e8 bb        cp      e
21e9 47        ld      b,a
21ea d8        ret     c

21eb 43        ld      b,e
21ec c9        ret     

21ed cd5b21    call    $215b
21f0 ca2d24    jp      z,$242d
21f3 5f        ld      e,a
21f4 23        inc     hl
21f5 23        inc     hl
21f6 7e        ld      a,(hl)
21f7 23        inc     hl
21f8 66        ld      h,(hl)
21f9 6f        ld      l,a
21fa e5        push    hl
21fb 19        add     hl,de
21fc 46        ld      b,(hl)
21fd 72        ld      (hl),d
21fe e3        ex      (sp),hl
21ff c5        push    bc
2200 7e        ld      a,(hl)
2201 cdf326    call    $26f3
2204 c1        pop     bc
2205 e1        pop     hl
2206 70        ld      (hl),b
2207 c9        ret     

2208 eb        ex      de,hl
2209 cd5115    call    $1551		; call TSTC
220c 		db 29        		; ')' char
220d c1        pop     bc
220e d1        pop     de
220f c5        push    bc
2210 43        ld      b,e
2211 c9        ret     

2212 cd5322    call    $2253
2215 c5        push    bc
2216 4f        ld      c,a
2217 ed78      in      a,(c)
2219 c1        pop     bc
221a c3041f    jp      $1f04
221d cd4022    call    $2240
2220 ed79      out     (c),a
2222 c9        ret     

2223 cd4022    call    $2240
2226 f5        push    af
2227 c5        push    bc
2228 1e00      ld      e,$00
222a cdd916    call    $16d9
222d 2807      jr      z,$2236
222f cd4c15    call    $154c		; call TSTCOM
2232 cd5422    call    $2254
2235 5f        ld      e,a
2236 c1        pop     bc
2237 f1        pop     af
2238 47        ld      b,a
2239 ed78      in      a,(c)
223b ab        xor     e
223c a0        and     b
223d 28fa      jr      z,$2239
223f c9        ret     

2240 cd5022    call    $2250		; call I255
2243 4f        ld      c,a
2244 c5        push    bc
2245 cd4c15    call    $154c		; call TSTCOM
2248 cd5022    call    $2250		; call I255
224b c1        pop     bc
224c c9        ret     

224d cdd816    call    $16d8

; I255
;
; Here, we restrict the range to 0 to +255, and the result is returned
; in A as well as DE (D=00, of course).

2250 cd771b    call    $1b77
2253 cd6c17    call    $176c
2256 7a        ld      a,d
2257 b7        or      a
2258 c28717    jp      nz,$1787			; go to QTY Error
225b cdd916    call    $16d9
225e 7b        ld      a,e
225f c9        ret     

2260 cd7217    call    $1772
2263 1a        ld      a,(de)
2264 c3041f    jp      $1f04
2267 cd6117    call    $1761		; call UEXINT
226a d5        push    de
226b cd4c15    call    $154c		; call TSTCOM
226e cd5022    call    $2250		; call I255
2271 d1        pop     de
2272 12        ld      (de),a
2273 c9        ret     

2274 f5        push    af			; Appy defined print speed
2275 3a860c    ld      a,($0c86)		; 0c86=SPEED Delay for VDU display
2278 b7        or      a
2279 c4232a    call    nz,$2a23			; Appy print delay
227c f1        pop     af
227d c9        ret     

227e e5        push    hl
227f 1c        inc     e
2280 cdf425    call    $25f4
2283 382d      jr      c,$22b2
2285 21800c    ld      hl,$0c80			; 0c80-0c83=RNDNO last random number generated
2288 cd3226    call    $2632
228b c8        ret     z

228c ed5f      ld      a,r
228e e607      and     $07
2290 0600      ld      b,$00
2292 21d022    ld      hl,$22d0
2295 87        add     a,a
2296 87        add     a,a
2297 4f        ld      c,a
2298 09        add     hl,bc
2299 cd6226    call    $2662
229c cdfb24    call    $24fb
229f ed5f      ld      a,r
22a1 e603      and     $03
22a3 0600      ld      b,$00
22a5 fe01      cp      $01
22a7 88        adc     a,b
22a8 21ec22    ld      hl,$22ec
22ab 87        add     a,a
22ac 87        add     a,a
22ad 4f        ld      c,a
22ae 09        add     hl,bc
22af cdbf23    call    $23bf
22b2 cd5f26    call    $265f
22b5 7b        ld      a,e
22b6 59        ld      e,c
22b7 ee4f      xor     $4f
22b9 4f        ld      c,a
22ba 3680      ld      (hl),$80
22bc 2b        dec     hl
22bd 46        ld      b,(hl)
22be 3680      ld      (hl),$80
22c0 ed5f      ld      a,r
22c2 2003      jr      nz,$22c7
22c4 0c        inc     c
22c5 15        dec     d
22c6 1c        inc     e
22c7 cd1a24    call    $241a
22ca 21800c    ld      hl,$0c80			; 0c80-0c83=RNDNO last random number generated
22cd c33e26    jp      $263e
22d0 35        dec     (hl)
22d1 4a        ld      c,d
22d2 ca9939    jp      z,$3999
22d5 1c        inc     e
22d6 76        halt    
22d7 98        sbc     a,b
22d8 2295b3    ld      ($b395),hl
22db 98        sbc     a,b
22dc 0a        ld      a,(bc)
22dd dd47      ld      b,a
22df 98        sbc     a,b
22e0 53        ld      d,e
22e1 d1        pop     de
22e2 99        sbc     a,c
22e3 99        sbc     a,c
22e4 0a        ld      a,(bc)
22e5 1a        ld      a,(de)
22e6 9f        sbc     a,a
22e7 98        sbc     a,b
22e8 65        ld      h,l
22e9 bc        cp      h
22ea cd98d6    call    $d698
22ed 77        ld      (hl),a
22ee 3e98      ld      a,$98
22f0 68        ld      l,b
22f1 b1        or      c
22f2 46        ld      b,(hl)
22f3 68        ld      l,b
22f4 99        sbc     a,c
22f5 e9        jp      (hl)
22f6 92        sub     d
22f7 69        ld      l,c
22f8 10d1      djnz    $22cb
22fa 75        ld      (hl),l
22fb 68        ld      l,b
22fc cd5322    call    $2253
22ff b7        or      a
2300 21e110    ld      hl,$10e1
2303 f4c72b    call    p,$2bc7
2306 3003      jr      nc,$230b
2308 217f0e    ld      hl,$0e7f
230b e67f      and     $7f
230d 47        ld      b,a
230e 04        inc     b
230f 23        inc     hl
2310 7e        ld      a,(hl)
2311 b7        or      a
2312 f20f23    jp      p,$230f
2315 e67f      and     $7f
2317 ca0b13    jp      z,$130b		; go to CMD Error
231a 10f3      djnz    $230f
231c 11c40c    ld      de,$0cc4		; 0cc4-0cd0=PRTTXT Text area for forming numbers before printing
231f d5        push    de
2320 12        ld      (de),a
2321 23        inc     hl
2322 13        inc     de
2323 7e        ld      a,(hl)
2324 b7        or      a
2325 f22023    jp      p,$2320
2328 af        xor     a
2329 12        ld      (de),a
232a e1        pop     hl
232b c38c1f    jp      $1f8c

; CLOAD

232e fe3f      cp      $3f		; '?'
2330 f5        push    af
2331 ccd816    call    z,$16d8
2334 08        ex      af,af'
2335 f1        pop     af
2336 08        ex      af,af'
2337 fe40      cp      $40		; '@'
2339 ca7c2a    jp      z,$2a7c
233c 08        ex      af,af'
233d f5        push    af
233e cd232b    call    $2b23		; call getfilename
2341 0eae      ld      c,$ae
2343 cd522a    call    $2a52
2346 cda823    call    $23a8		; hl=0cd5=BUFFER (Input Buffer), de=0cc4-0cd0=PRTTXT Text area for forming numbers before printing
2349 cd602a    call    $2a60
234c 3600      ld      (hl),$00
234e 2ed5      ld      l,$d5
2350 cdb224    call    $24b2
2353 08        ex      af,af'
2354 b7        or      a
2355 280c      jr      z,$2363
2357 08        ex      af,af'
2358 cda823    call    $23a8		; hl=0cd5=BUFFER (Input Buffer), de=0cc4-0cd0=PRTTXT Text area for forming numbers before printing
235b 1a        ld      a,(de)
235c 96        sub     (hl)
235d 20e2      jr      nz,$2341
235f 13        inc     de
2360 23        inc     hl
2361 10f8      djnz    $235b
2363 f1        pop     af
2364 08        ex      af,af'
2365 00        nop     
2366 ed5b8c0c  ld      de,($0c8c)	; 0c8c=TEXT
236a cd502a    call    $2a50
236d cdfa2b    call    $2bfa		; call RIM
2370 4f        ld      c,a
2371 cdfa2b    call    $2bfa		; call RIM
2374 81        add     a,c
2375 4f        ld      c,a
2376 cdfa2b    call    $2bfa		; call RIM
2379 6f        ld      l,a
237a cdfa2b    call    $2bfa		; call RIM
237d 67        ld      h,a
237e eb        ex      de,hl
237f cd9a2b    call    $2b9a
2382 79        ld      a,c
2383 94        sub     h
2384 95        sub     l
2385 4f        ld      c,a
2386 cd6f2a    call    $2a6f
2389 43        ld      b,e
238a 0e00      ld      c,$00
238c cd602a    call    $2a60
238f cd091a    call    $1a09		; call CRLF
2392 eb        ex      de,hl
2393 7c        ld      a,h
2394 b7        or      a
2395 20d3      jr      nz,$236a
2397 cdfd2b    call    $2bfd		; call MFLP
239a 08        ex      af,af'
239b 2804      jr      z,$23a1
239d ed53b70c  ld      ($0cb7),de	; 0cb7=TXTUNF
23a1 fd215c13  ld      iy,$135c
23a5 c3d013    jp      $13d0
23a8 21d50c    ld      hl,$0cd5		; 0cd5=BUFFER (Input Buffer)
23ab 11c40c    ld      de,$0cc4		; 0cc4-0cd0=PRTTXT Text area for forming numbers before printing
23ae 010006    ld      bc,$0600
23b1 c9        ret     

23b2 cd2526    call    $2625
23b5 cd0626    call    $2606
23b8 c1        pop     bc
23b9 d1        pop     de
23ba 1811      jr      $23cd
23bc 21b229    ld      hl,$29b2
23bf cd6226    call    $2662
23c2 1809      jr      $23cd
23c4 cd6226    call    $2662
23c7 21c1d1    ld      hl,$d1c1
23ca cd1d26    call    $261d
23cd 78        ld      a,b
23ce b7        or      a
23cf c8        ret     z

23d0 3ac20c    ld      a,($0cc2)	; 0cbf-0cc2=FPA Floating Point accumulator
23d3 b7        or      a
23d4 ca3526    jp      z,$2635
23d7 90        sub     b
23d8 300c      jr      nc,$23e6
23da ed44      neg     
23dc eb        ex      de,hl
23dd cd2526    call    $2625
23e0 eb        ex      de,hl
23e1 cd3526    call    $2635
23e4 c1        pop     bc
23e5 d1        pop     de
23e6 fe19      cp      $19
23e8 d0        ret     nc

23e9 f5        push    af
23ea cd4a26    call    $264a
23ed 67        ld      h,a
23ee f1        pop     af
23ef cd8c24    call    $248c
23f2 b4        or      h
23f3 21bf0c    ld      hl,$0cbf		; 0cbf-0cc2=FPA Floating Point accumulator
23f6 f20924    jp      p,$2409
23f9 cd6b24    call    $246b
23fc 304c      jr      nc,$244a
23fe 23        inc     hl
23ff 34        inc     (hl)
2400 2864      jr      z,$2466		; go to OVERFLOW Error
2402 2e01      ld      l,$01
2404 cd9f24    call    $249f
2407 1841      jr      $244a
2409 af        xor     a
240a 90        sub     b
240b 47        ld      b,a
240c 7e        ld      a,(hl)
240d 9b        sbc     a,e
240e 5f        ld      e,a
240f 23        inc     hl
2410 7e        ld      a,(hl)
2411 9a        sbc     a,d
2412 57        ld      d,a
2413 23        inc     hl
2414 7e        ld      a,(hl)
2415 99        sbc     a,c
2416 4f        ld      c,a
2417 dc7724    call    c,$2477
241a 68        ld      l,b
241b 63        ld      h,e
241c af        xor     a
241d 47        ld      b,a
241e 79        ld      a,c
241f b7        or      a
2420 2017      jr      nz,$2439
2422 4a        ld      c,d
2423 54        ld      d,h
2424 65        ld      h,l
2425 6f        ld      l,a
2426 78        ld      a,b
2427 d608      sub     $08
2429 fee0      cp      $e0
242b 20f0      jr      nz,$241d
242d af        xor     a
242e 32c20c    ld      ($0cc2),a	; 0cbf-0cc2=FPA Floating Point accumulator
2431 c9        ret     

2432 05        dec     b
2433 29        add     hl,hl
2434 cb12      rl      d
2436 79        ld      a,c
2437 8f        adc     a,a
2438 4f        ld      c,a
2439 f23224    jp      p,$2432
243c 78        ld      a,b
243d 5c        ld      e,h
243e 45        ld      b,l
243f b7        or      a
2440 2808      jr      z,$244a
2442 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
2445 86        add     a,(hl)
2446 77        ld      (hl),a
2447 30e4      jr      nc,$242d
2449 c8        ret     z

244a 78        ld      a,b
244b 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
244e b7        or      a
244f fc5c24    call    m,$245c
2452 46        ld      b,(hl)
2453 23        inc     hl
2454 7e        ld      a,(hl)
2455 e680      and     $80
2457 a9        xor     c
2458 4f        ld      c,a
2459 c33526    jp      $2635
245c 1c        inc     e
245d c0        ret     nz

245e 14        inc     d
245f c0        ret     nz

2460 0c        inc     c
2461 c0        ret     nz

2462 0e80      ld      c,$80
2464 34        inc     (hl)
2465 c0        ret     nz

; OVERFLOW Error

2466 1e06      ld      e,$06		; Overflow
2468 c31913    jp      $1319		; go to BASIC Error

246b 7e        ld      a,(hl)
246c 83        add     a,e
246d 5f        ld      e,a
246e 23        inc     hl
246f 7e        ld      a,(hl)
2470 8a        adc     a,d
2471 57        ld      d,a
2472 23        inc     hl
2473 7e        ld      a,(hl)
2474 89        adc     a,c
2475 4f        ld      c,a
2476 c9        ret     

2477 21c30c    ld      hl,$0cc3
247a 7e        ld      a,(hl)
247b 2f        cpl     
247c 77        ld      (hl),a
247d af        xor     a
247e 6f        ld      l,a
247f 7d        ld      a,l
2480 90        sub     b
2481 47        ld      b,a
2482 7d        ld      a,l
2483 9b        sbc     a,e
2484 5f        ld      e,a
2485 7d        ld      a,l
2486 9a        sbc     a,d
2487 57        ld      d,a
2488 7d        ld      a,l
2489 99        sbc     a,c
248a 4f        ld      c,a
248b c9        ret     

248c 0600      ld      b,$00
248e d608      sub     $08
2490 3807      jr      c,$2499
2492 43        ld      b,e
2493 5a        ld      e,d
2494 51        ld      d,c
2495 0e00      ld      c,$00
2497 18f5      jr      $248e
2499 c609      add     a,$09
249b 6f        ld      l,a
249c af        xor     a
249d 2d        dec     l
249e c8        ret     z

249f cb19      rr      c
24a1 cb1a      rr      d
24a3 cb1b      rr      e
24a5 cb18      rr      b
24a7 18f3      jr      $249c
24a9 fe61      cp      $61
24ab d8        ret     c

24ac fe7b      cp      $7b
24ae d0        ret     nc

24af e65f      and     $5f
24b1 c9        ret     

24b2 cdf91f    call    $1ff9
24b5 c3091a    jp      $1a09		; call CRLF
24b8 00        nop     
24b9 00        nop     
24ba cdf425    call    $25f4
24bd b7        or      a
24be ea8717    jp      pe,$1787		; go to QTY Error
24c1 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
24c4 7e        ld      a,(hl)
24c5 013580    ld      bc,$8035
24c8 11f304    ld      de,$04f3
24cb 90        sub     b
24cc f5        push    af
24cd 70        ld      (hl),b
24ce d5        push    de
24cf c5        push    bc
24d0 cdcd23    call    $23cd
24d3 c1        pop     bc
24d4 d1        pop     de
24d5 04        inc     b
24d6 cd4d25    call    $254d
24d9 21fd29    ld      hl,$29fd
24dc cdc423    call    $23c4
24df 21cf29    ld      hl,$29cf
24e2 cd7f29    call    $297f
24e5 018080    ld      bc,$8080
24e8 110000    ld      de,$0000
24eb cdcd23    call    $23cd
24ee f1        pop     af
24ef cdb223    call    $23b2
24f2 013180    ld      bc,$8031
24f5 111872    ld      de,$7218
24f8 21c1d1    ld      hl,$d1c1
24fb cdf425    call    $25f4
24fe c8        ret     z

24ff 2e00      ld      l,$00
2501 cdb525    call    $25b5
2504 d9        exx     
2505 010000    ld      bc,$0000
2508 50        ld      d,b
2509 58        ld      e,b
250a 211a24    ld      hl,$241a
250d e5        push    hl
250e 211625    ld      hl,$2516
2511 e5        push    hl
2512 e5        push    hl
2513 21bf0c    ld      hl,$0cbf		; 0cbf-0cc2=FPA Floating Point accumulator
2516 7e        ld      a,(hl)
2517 23        inc     hl
2518 b7        or      a
2519 281f      jr      z,$253a
251b e5        push    hl
251c 2e08      ld      l,$08
251e 1f        rra     
251f 67        ld      h,a
2520 79        ld      a,c
2521 3009      jr      nc,$252c
2523 d5        push    de
2524 d9        exx     
2525 e1        pop     hl
2526 19        add     hl,de
2527 79        ld      a,c
2528 e5        push    hl
2529 d9        exx     
252a d1        pop     de
252b 89        adc     a,c
252c 1f        rra     
252d 4f        ld      c,a
252e cb1a      rr      d
2530 cb1b      rr      e
2532 cb18      rr      b
2534 2d        dec     l
2535 7c        ld      a,h
2536 20e6      jr      nz,$251e
2538 e1        pop     hl
2539 c9        ret     

253a 43        ld      b,e
253b 5a        ld      e,d
253c 51        ld      d,c
253d 4f        ld      c,a
253e c9        ret     

253f cd2526    call    $2625
2542 012084    ld      bc,$8420
2545 110000    ld      de,$0000
2548 cd3526    call    $2635
254b c1        pop     bc
254c d1        pop     de
254d cdf425    call    $25f4
2550 ca0e13    jp      z,$130e			; go to DIV Error
2553 2eff      ld      l,$ff
2555 cdb525    call    $25b5
2558 34        inc     (hl)
2559 34        inc     (hl)
255a 2b        dec     hl
255b e5        push    hl
255c d9        exx     
255d e1        pop     hl
255e 4e        ld      c,(hl)
255f 2b        dec     hl
2560 56        ld      d,(hl)
2561 2b        dec     hl
2562 5e        ld      e,(hl)
2563 e5        push    hl
2564 d9        exx     
2565 e1        pop     hl
2566 41        ld      b,c
2567 eb        ex      de,hl
2568 af        xor     a
2569 4f        ld      c,a
256a 57        ld      d,a
256b 5f        ld      e,a
256c 32910c    ld      ($0c91),a
256f e5        push    hl
2570 c5        push    bc
2571 78        ld      a,b
2572 e5        push    hl
2573 d9        exx     
2574 e1        pop     hl
2575 b7        or      a
2576 ed52      sbc     hl,de
2578 99        sbc     a,c
2579 e5        push    hl
257a d9        exx     
257b e1        pop     hl
257c 47        ld      b,a
257d 3a910c    ld      a,($0c91)
2580 de00      sbc     a,$00
2582 3f        ccf     
2583 3007      jr      nc,$258c
2585 32910c    ld      ($0c91),a
2588 f1        pop     af
2589 f1        pop     af
258a 37        scf     
258b d2c1e1    jp      nc,$e1c1
258e 79        ld      a,c
258f 3c        inc     a
2590 3d        dec     a
2591 1f        rra     
2592 fa4b24    jp      m,$244b
2595 17        rla     
2596 cb13      rl      e
2598 cb12      rl      d
259a cb11      rl      c
259c 29        add     hl,hl
259d cb10      rl      b
259f 3a910c    ld      a,($0c91)
25a2 17        rla     
25a3 32910c    ld      ($0c91),a
25a6 79        ld      a,c
25a7 b2        or      d
25a8 b3        or      e
25a9 20c4      jr      nz,$256f
25ab e5        push    hl
25ac 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
25af 35        dec     (hl)
25b0 e1        pop     hl
25b1 20bc      jr      nz,$256f
25b3 183f      jr      $25f4
25b5 78        ld      a,b
25b6 b7        or      a
25b7 281f      jr      z,$25d8
25b9 7d        ld      a,l
25ba 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
25bd ae        xor     (hl)
25be 80        add     a,b
25bf 47        ld      b,a
25c0 1f        rra     
25c1 a8        xor     b
25c2 78        ld      a,b
25c3 f2d725    jp      p,$25d7
25c6 c680      add     a,$80
25c8 77        ld      (hl),a
25c9 ca3825    jp      z,$2538
25cc cd4a26    call    $264a
25cf 77        ld      (hl),a
25d0 2b        dec     hl
25d1 c9        ret     

25d2 cdf425    call    $25f4
25d5 2f        cpl     
25d6 e1        pop     hl
25d7 b7        or      a
25d8 e1        pop     hl
25d9 f22d24    jp      p,$242d
25dc 1813      jr      $25f1
25de cd5f26    call    $265f
25e1 78        ld      a,b
25e2 b7        or      a
25e3 c8        ret     z

25e4 c602      add     a,$02
25e6 3809      jr      c,$25f1
25e8 47        ld      b,a
25e9 cdcd23    call    $23cd
25ec 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
25ef 34        inc     (hl)
25f0 c0        ret     nz

25f1 c36624    jp      $2466		; go to OVERFLOW Error
25f4 3ac20c    ld      a,($0cc2)	; 0cbf-0cc2=FPA Floating Point accumulator
25f7 b7        or      a
25f8 c8        ret     z

25f9 3ac10c    ld      a,($0cc1)	; 0cbf-0cc2=FPA Floating Point accumulator
25fc fe2f      cp      $2f
25fe 17        rla     
25ff 9f        sbc     a,a
2600 c0        ret     nz

2601 3c        inc     a
2602 c9        ret     

2603 cdf425    call    $25f4
2606 0688      ld      b,$88
2608 110000    ld      de,$0000
260b 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
260e 4f        ld      c,a
260f 70        ld      (hl),b
2610 0600      ld      b,$00
2612 23        inc     hl
2613 3680      ld      (hl),$80
2615 17        rla     
2616 c31724    jp      $2417
2619 cdf425    call    $25f4
261c f0        ret     p

261d 21c10c    ld      hl,$0cc1		; 0cbf-0cc2=FPA Floating Point accumulator
2620 7e        ld      a,(hl)
2621 ee80      xor     $80
2623 77        ld      (hl),a
2624 c9        ret     

2625 eb        ex      de,hl
2626 2abf0c    ld      hl,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
2629 e3        ex      (sp),hl
262a e5        push    hl
262b 2ac10c    ld      hl,($0cc1)	; 0cbf-0cc2=FPA Floating Point accumulator
262e e3        ex      (sp),hl
262f e5        push    hl
2630 eb        ex      de,hl
2631 c9        ret     

2632 cd6226    call    $2662
2635 ed53bf0c  ld      ($0cbf),de	; 0cbf-0cc2=FPA Floating Point accumulator
2639 ed43c10c  ld      ($0cc1),bc	; 0cbf-0cc2=FPA Floating Point accumulator
263d c9        ret     

263e 11bf0c    ld      de,$0cbf		; 0cbf-0cc2=FPA Floating Point accumulator
2641 0604      ld      b,$04
2643 1a        ld      a,(de)
2644 77        ld      (hl),a
2645 13        inc     de
2646 23        inc     hl
2647 10fa      djnz    $2643
2649 c9        ret     

264a 21c10c    ld      hl,$0cc1		; 0cbf-0cc2=FPA Floating Point accumulator
264d 7e        ld      a,(hl)
264e 07        rlca    
264f 37        scf     
2650 1f        rra     
2651 77        ld      (hl),a
2652 3f        ccf     
2653 1f        rra     
2654 23        inc     hl
2655 23        inc     hl
2656 77        ld      (hl),a
2657 79        ld      a,c
2658 07        rlca    
2659 37        scf     
265a 1f        rra     
265b 4f        ld      c,a
265c 1f        rra     
265d ae        xor     (hl)
265e c9        ret     

265f 21bf0c    ld      hl,$0cbf		; 0cbf-0cc2=FPA Floating Point accumulator
2662 5e        ld      e,(hl)
2663 23        inc     hl
2664 56        ld      d,(hl)
2665 23        inc     hl
2666 4e        ld      c,(hl)
2667 23        inc     hl
2668 46        ld      b,(hl)
2669 23        inc     hl
266a c9        ret     

266b 78        ld      a,b
266c b7        or      a
266d 2885      jr      z,$25f4
266f 21fd25    ld      hl,$25fd
2672 e5        push    hl
2673 cdf425    call    $25f4
2676 79        ld      a,c
2677 c8        ret     z

2678 21c10c    ld      hl,$0cc1		; 0cbf-0cc2=FPA Floating Point accumulator
267b ae        xor     (hl)
267c 79        ld      a,c
267d f8        ret     m

267e cd8426    call    $2684
2681 1f        rra     
2682 a9        xor     c
2683 c9        ret     

2684 23        inc     hl
2685 78        ld      a,b
2686 be        cp      (hl)
2687 c0        ret     nz

2688 2b        dec     hl
2689 79        ld      a,c
268a be        cp      (hl)
268b c0        ret     nz

268c 2b        dec     hl
268d 7a        ld      a,d
268e be        cp      (hl)
268f c0        ret     nz

2690 2b        dec     hl
2691 7b        ld      a,e
2692 96        sub     (hl)
2693 c0        ret     nz

2694 e1        pop     hl
2695 e1        pop     hl
2696 c9        ret     

2697 47        ld      b,a
2698 4f        ld      c,a
2699 57        ld      d,a
269a 5f        ld      e,a
269b b7        or      a
269c c8        ret     z

269d e5        push    hl
269e cd5f26    call    $265f
26a1 cd4a26    call    $264a
26a4 ae        xor     (hl)
26a5 67        ld      h,a
26a6 fcbb26    call    m,$26bb
26a9 3e98      ld      a,$98
26ab 90        sub     b
26ac cd8c24    call    $248c
26af 7c        ld      a,h
26b0 17        rla     
26b1 dc5c24    call    c,$245c
26b4 0600      ld      b,$00
26b6 dc7724    call    c,$2477
26b9 e1        pop     hl
26ba c9        ret     

26bb 1b        dec     de
26bc 7a        ld      a,d
26bd a3        and     e
26be 3c        inc     a
26bf c0        ret     nz

26c0 0b        dec     bc
26c1 c9        ret     

26c2 21c20c    ld      hl,$0cc2		; 0cbf-0cc2=FPA Floating Point accumulator
26c5 7e        ld      a,(hl)
26c6 fe98      cp      $98
26c8 3abf0c    ld      a,($0cbf)	; 0cbf-0cc2=FPA Floating Point accumulator
26cb d0        ret     nc

26cc 7e        ld      a,(hl)
26cd cd9726    call    $2697
26d0 3698      ld      (hl),$98
26d2 7b        ld      a,e
26d3 f5        push    af
26d4 79        ld      a,c
26d5 17        rla     
26d6 cd1724    call    $2417
26d9 f1        pop     af
26da c9        ret     

26db 210000    ld      hl,$0000
26de 78        ld      a,b
26df b1        or      c
26e0 c8        ret     z

26e1 3e10      ld      a,$10
26e3 29        add     hl,hl
26e4 3806      jr      c,$26ec
26e6 eb        ex      de,hl
26e7 29        add     hl,hl
26e8 eb        ex      de,hl
26e9 3004      jr      nc,$26ef
26eb 09        add     hl,bc
26ec da491e    jp      c,$1e49			; go to RANGE Error
26ef 3d        dec     a
26f0 20f1      jr      nz,$26e3
26f2 c9        ret     

26f3 fe2d      cp      $2d
26f5 f5        push    af
26f6 2805      jr      z,$26fd
26f8 fe2b      cp      $2b
26fa 2801      jr      z,$26fd
26fc 2b        dec     hl
26fd cd2d24    call    $242d
2700 47        ld      b,a
2701 57        ld      d,a
2702 5f        ld      e,a
2703 2f        cpl     
2704 4f        ld      c,a
2705 cdd816    call    $16d8
2708 384f      jr      c,$2759
270a fe2e      cp      $2e
270c 2828      jr      z,$2736
270e fe45      cp      $45
2710 2027      jr      nz,$2739
2712 cdd816    call    $16d8
2715 e5        push    hl
2716 212a27    ld      hl,$272a
2719 e3        ex      (sp),hl
271a 15        dec     d
271b fea9      cp      $a9
271d c8        ret     z

271e fe2d      cp      $2d
2720 c8        ret     z

2721 14        inc     d
2722 fea8      cp      $a8
2724 c8        ret     z

2725 fe2b      cp      $2b
2727 c8        ret     z

2728 f1        pop     af
2729 2b        dec     hl
272a cdd816    call    $16d8
272d 3840      jr      c,$276f
272f 14        inc     d
2730 2007      jr      nz,$2739
2732 af        xor     a
2733 93        sub     e
2734 5f        ld      e,a
2735 0c        inc     c
2736 0c        inc     c
2737 28cc      jr      z,$2705
2739 e5        push    hl
273a 7b        ld      a,e
273b 90        sub     b
273c f45127    call    p,$2751
273f f24827    jp      p,$2748
2742 f5        push    af
2743 cd3f25    call    $253f
2746 f1        pop     af
2747 3c        inc     a
2748 20f2      jr      nz,$273c
274a d1        pop     de
274b f1        pop     af
274c cc1d26    call    z,$261d
274f eb        ex      de,hl
2750 c9        ret     

2751 c8        ret     z

2752 f5        push    af
2753 cdde25    call    $25de
2756 f1        pop     af
2757 3d        dec     a
2758 c9        ret     

2759 d5        push    de
275a 57        ld      d,a
275b 78        ld      a,b
275c 89        adc     a,c
275d 47        ld      b,a
275e c5        push    bc
275f e5        push    hl
2760 d5        push    de
2761 cdde25    call    $25de
2764 f1        pop     af
2765 d630      sub     $30
2767 cdb223    call    $23b2
276a e1        pop     hl
276b c1        pop     bc
276c d1        pop     de
276d 1896      jr      $2705
276f 7b        ld      a,e
2770 07        rlca    
2771 07        rlca    
2772 83        add     a,e
2773 07        rlca    
2774 86        add     a,(hl)
2775 d630      sub     $30
2777 5f        ld      e,a
2778 18b0      jr      $272a
277a cdf02a    call    $2af0			; call PRM
277d 		DB ' in '+80h
2781 eb        ex      de,hl
2782 af        xor     a
2783 0698      ld      b,$98
2785 cd0b26    call    $260b
2788 21f81f    ld      hl,$1ff8
278b e5        push    hl
278c 21c40c    ld      hl,$0cc4		; 0cc4-0cd0=PRTTXT Text area for forming numbers before printing
278f e5        push    hl
2790 cdf425    call    $25f4
2793 3620      ld      (hl),$20
2795 f29a27    jp      p,$279a
2798 362d      ld      (hl),$2d
279a 23        inc     hl
279b 3630      ld      (hl),$30
279d ca4728    jp      z,$2847
27a0 e5        push    hl
27a1 fc1d26    call    m,$261d
27a4 af        xor     a
27a5 f5        push    af
27a6 cd4d28    call    $284d
27a9 014391    ld      bc,$9143
27ac 11f84f    ld      de,$4ff8
27af cd6b26    call    $266b
27b2 b7        or      a
27b3 e2c627    jp      po,$27c6
27b6 f1        pop     af
27b7 cd5227    call    $2752
27ba f5        push    af
27bb 18ec      jr      $27a9
27bd cd3f25    call    $253f
27c0 f1        pop     af
27c1 3c        inc     a
27c2 f5        push    af
27c3 cd4d28    call    $284d
27c6 cdbc23    call    $23bc
27c9 3c        inc     a
27ca cd9726    call    $2697
27cd cd3526    call    $2635
27d0 010603    ld      bc,$0306
27d3 f1        pop     af
27d4 81        add     a,c
27d5 3c        inc     a
27d6 fae227    jp      m,$27e2
27d9 fe08      cp      $08
27db f2e227    jp      p,$27e2
27de 3c        inc     a
27df 47        ld      b,a
27e0 3e02      ld      a,$02
27e2 3d        dec     a
27e3 3d        dec     a
27e4 e1        pop     hl
27e5 f5        push    af
27e6 115c28    ld      de,$285c
27e9 1006      djnz    $27f1
27eb 362e      ld      (hl),$2e
27ed 23        inc     hl
27ee 3630      ld      (hl),$30
27f0 23        inc     hl
27f1 05        dec     b
27f2 362e      ld      (hl),$2e
27f4 2001      jr      nz,$27f7
27f6 23        inc     hl
27f7 c5        push    bc
27f8 e5        push    hl
27f9 d5        push    de
27fa cd5f26    call    $265f
27fd e1        pop     hl
27fe 062f      ld      b,$2f
2800 04        inc     b
2801 7b        ld      a,e
2802 96        sub     (hl)
2803 5f        ld      e,a
2804 23        inc     hl
2805 7a        ld      a,d
2806 9e        sbc     a,(hl)
2807 57        ld      d,a
2808 23        inc     hl
2809 79        ld      a,c
280a 9e        sbc     a,(hl)
280b 4f        ld      c,a
280c 2b        dec     hl
280d 2b        dec     hl
280e 30f0      jr      nc,$2800
2810 cd6b24    call    $246b
2813 23        inc     hl
2814 cd3526    call    $2635
2817 eb        ex      de,hl
2818 e1        pop     hl
2819 70        ld      (hl),b
281a 23        inc     hl
281b c1        pop     bc
281c 0d        dec     c
281d 20d2      jr      nz,$27f1
281f 05        dec     b
2820 280b      jr      z,$282d
2822 2b        dec     hl
2823 7e        ld      a,(hl)
2824 fe30      cp      $30
2826 28fa      jr      z,$2822
2828 fe2e      cp      $2e
282a 2801      jr      z,$282d
282c 23        inc     hl
282d f1        pop     af
282e 281a      jr      z,$284a
2830 3645      ld      (hl),$45
2832 23        inc     hl
2833 362b      ld      (hl),$2b
2835 f23c28    jp      p,$283c
2838 362d      ld      (hl),$2d
283a ed44      neg     
283c 062f      ld      b,$2f
283e 04        inc     b
283f d60a      sub     $0a
2841 30fb      jr      nc,$283e
2843 c63a      add     a,$3a
2845 23        inc     hl
2846 70        ld      (hl),b
2847 23        inc     hl
2848 77        ld      (hl),a
2849 23        inc     hl
284a 71        ld      (hl),c
284b e1        pop     hl
284c c9        ret     

284d 017494    ld      bc,$9474
2850 11f723    ld      de,$23f7
2853 cd6b26    call    $266b
2856 b7        or      a
2857 e1        pop     hl
2858 e2bd27    jp      po,$27bd
285b e9        jp      (hl)
285c a0        and     b
285d 86        add     a,(hl)
285e 011027    ld      bc,$2710
2861 00        nop     
2862 e8        ret     pe

2863 03        inc     bc
2864 00        nop     
2865 64        ld      h,h
2866 00        nop     
2867 00        nop     
2868 0a        ld      a,(bc)
2869 00        nop     
286a 00        nop     
286b 010000    ld      bc,$0000
286e cd2526    call    $2625
2871 21b229    ld      hl,$29b2
2874 cd3226    call    $2632
2877 c1        pop     bc
2878 d1        pop     de
2879 cdf425    call    $25f4
287c 78        ld      a,b
287d 283c      jr      z,$28bb
287f f28628    jp      p,$2886
2882 b7        or      a
2883 ca0e13    jp      z,$130e			; go to DIV Error
2886 b7        or      a
2887 ca2e24    jp      z,$242e
288a d5        push    de
288b c5        push    bc
288c 79        ld      a,c
288d f67f      or      $7f
288f cd5f26    call    $265f
2892 f2a328    jp      p,$28a3
2895 d5        push    de
2896 c5        push    bc
2897 cdc226    call    $26c2
289a c1        pop     bc
289b d1        pop     de
289c f5        push    af
289d cd6b26    call    $266b
28a0 e1        pop     hl
28a1 7c        ld      a,h
28a2 1f        rra     
28a3 e1        pop     hl
28a4 22c10c    ld      ($0cc1),hl	; 0cbf-0cc2=FPA Floating Point accumulator
28a7 e1        pop     hl
28a8 22bf0c    ld      ($0cbf),hl	; 0cbf-0cc2=FPA Floating Point accumulator
28ab dcb02b    call    c,$2bb0
28ae cc1d26    call    z,$261d
28b1 d5        push    de
28b2 c5        push    bc
28b3 cdba24    call    $24ba
28b6 c1        pop     bc
28b7 d1        pop     de
28b8 cdfb24    call    $24fb
28bb cd2526    call    $2625
28be 013881    ld      bc,$8138
28c1 113baa    ld      de,$aa3b
28c4 cdfb24    call    $24fb
28c7 3ac20c    ld      a,($0cc2)	; 0cbf-0cc2=FPA Floating Point accumulator
28ca fe88      cp      $88
28cc d2d225    jp      nc,$25d2
28cf cdc226    call    $26c2
28d2 c680      add     a,$80
28d4 c602      add     a,$02
28d6 dad225    jp      c,$25d2
28d9 f5        push    af
28da 21fd29    ld      hl,$29fd
28dd cdbf23    call    $23bf
28e0 cdf224    call    $24f2
28e3 f1        pop     af
28e4 c1        pop     bc
28e5 d1        pop     de
28e6 f5        push    af
28e7 cdca23    call    $23ca
28ea cd1d26    call    $261d
28ed 21012a    ld      hl,$2a01
28f0 cd8e29    call    $298e
28f3 110000    ld      de,$0000
28f6 c1        pop     bc
28f7 4a        ld      c,d
28f8 c3fb24    jp      $24fb
28fb cd2526    call    $2625
28fe cd3e29    call    $293e
2901 c1        pop     bc
2902 e1        pop     hl
2903 cd2526    call    $2625
2906 eb        ex      de,hl
2907 cd3526    call    $2635
290a cd3829    call    $2938
290d c34b25    jp      $254b
2910 cdf425    call    $25f4
2913 fcb02b    call    m,$2bb0
2916 fc1d26    call    m,$261d
2919 3ac20c    ld      a,($0cc2)	; 0cbf-0cc2=FPA Floating Point accumulator
291c fe81      cp      $81
291e 380c      jr      c,$292c
2920 010081    ld      bc,$8100
2923 51        ld      d,c
2924 59        ld      e,c
2925 cd4d25    call    $254d
2928 21c423    ld      hl,$23c4
292b e5        push    hl
292c 21dc29    ld      hl,$29dc
292f cd7f29    call    $297f
2932 21ae29    ld      hl,$29ae
2935 c9        ret     

2936 00        nop     
2937 00        nop     
2938 21ae29    ld      hl,$29ae
293b cdbf23    call    $23bf
293e cd2526    call    $2625
2941 014983    ld      bc,$8349
2944 11db0f    ld      de,$0fdb
2947 cd3526    call    $2635
294a c1        pop     bc
294b d1        pop     de
294c cd4d25    call    $254d
294f cd2526    call    $2625
2952 cdc226    call    $26c2
2955 c1        pop     bc
2956 d1        pop     de
2957 cdca23    call    $23ca
295a 21b629    ld      hl,$29b6
295d cdc423    call    $23c4
2960 cdf425    call    $25f4
2963 37        scf     
2964 f26e29    jp      p,$296e
2967 cdbc23    call    $23bc
296a cdf425    call    $25f4
296d b7        or      a
296e f5        push    af
296f f41d26    call    p,$261d
2972 21b629    ld      hl,$29b6
2975 cdbf23    call    $23bf
2978 f1        pop     af
2979 d41d26    call    nc,$261d
297c 21ba29    ld      hl,$29ba
297f cd2526    call    $2625
2982 11f924    ld      de,$24f9
2985 d5        push    de
2986 e5        push    hl
2987 cd5f26    call    $265f
298a cdfb24    call    $24fb
298d e1        pop     hl
298e cd2526    call    $2625
2991 7e        ld      a,(hl)
2992 23        inc     hl
2993 cd3226    call    $2632
2996 06f1      ld      b,$f1
2998 c1        pop     bc
2999 d1        pop     de
299a 3d        dec     a
299b c8        ret     z

299c d5        push    de
299d c5        push    bc
299e f5        push    af
299f e5        push    hl
29a0 cdfb24    call    $24fb
29a3 e1        pop     hl
29a4 cd6226    call    $2662
29a7 e5        push    hl
29a8 cdcd23    call    $23cd
29ab e1        pop     hl
29ac 18e9      jr      $2997
29ae db0f      in      a,($0f)
29b0 49        ld      c,c
29b1 81        add     a,c
29b2 00        nop     
29b3 00        nop     
29b4 00        nop     
29b5 80        add     a,b
29b6 00        nop     
29b7 00        nop     
29b8 00        nop     
29b9 7f        ld      a,a
29ba 05        dec     b
29bb ba        cp      d
29bc d7        rst     $10	; NASSYS: RCAL-relative call
29bd 1e86      ld      e,$86
29bf 64        ld      h,h
29c0 2699      ld      h,$99
29c2 87        add     a,a
29c3 58        ld      e,b
29c4 34        inc     (hl)
29c5 23        inc     hl
29c6 87        add     a,a
29c7 e0        ret     po

29c8 5d        ld      e,l
29c9 a5        and     l
29ca 86        add     a,(hl)
29cb da0f49    jp      c,$490f
29ce 83        add     a,e
29cf 03        inc     bc
29d0 aa        xor     d
29d1 56        ld      d,(hl)
29d2 19        add     hl,de
29d3 80        add     a,b
29d4 f1        pop     af
29d5 227680    ld      ($8076),hl
29d8 45        ld      b,l
29d9 aa        xor     d
29da 3882      jr      c,$295e
29dc 09        add     hl,bc
29dd 4a        ld      c,d
29de d7        rst     $10	; NASSYS: RCAL-relative call
29df 3b        dec     sp
29e0 78        ld      a,b
29e1 02        ld      (bc),a
29e2 6e        ld      l,(hl)
29e3 84        add     a,h
29e4 7b        ld      a,e
29e5 fec1      cp      $c1
29e7 2f        cpl     
29e8 7c        ld      a,h
29e9 74        ld      (hl),h
29ea 319a7d    ld      sp,$7d9a
29ed 84        add     a,h
29ee 3d        dec     a
29ef 5a        ld      e,d
29f0 7d        ld      a,l
29f1 c8        ret     z

29f2 7f        ld      a,a
29f3 91        sub     c
29f4 7e        ld      a,(hl)
29f5 e4bb4c    call    po,$4cbb
29f8 7e        ld      a,(hl)
29f9 6c        ld      l,h
29fa aa        xor     d
29fb aa        xor     d
29fc 7f        ld      a,a
29fd 00        nop     
29fe 00        nop     
29ff 00        nop     
2a00 81        add     a,c
2a01 08        ex      af,af'
2a02 40        ld      b,b
2a03 2e94      ld      l,$94
2a05 74        ld      (hl),h
2a06 70        ld      (hl),b
2a07 4f        ld      c,a
2a08 2e77      ld      l,$77
2a0a 6e        ld      l,(hl)
2a0b 02        ld      (bc),a
2a0c 88        adc     a,b
2a0d 7a        ld      a,d
2a0e e6a0      and     $a0
2a10 2a7c50    ld      hl,($507c)
2a13 aa        xor     d
2a14 aa        xor     d
2a15 7e        ld      a,(hl)
2a16 ff        rst     $38
2a17 ff        rst     $38
2a18 7f        ld      a,a
2a19 7f        ld      a,a
2a1a 00        nop     
2a1b 00        nop     
2a1c 80        add     a,b
2a1d 81        add     a,c
2a1e 00        nop     
2a1f 00        nop     
2a20 00        nop     
2a21 81        add     a,c

2a22 af        xor     a	; Apply short delay
2a23 c5        push    bc	; Appy print delay
2a24 47        ld      b,a
2a25 f5        push    af
2a26 cdeb2b    call    $2beb	; call RDEL
2a29 f1        pop     af
2a2a 10f9      djnz    $2a25
2a2c c1        pop     bc
2a2d c9        ret     

; save filename in tape

2a2e 7e        ld      a,(hl)
2a2f 81        add     a,c
2a30 4f        ld      c,a
2a31 7e        ld      a,(hl)
2a32 cdee2b    call    $2bee	; call SRLX
2a35 23        inc     hl
2a36 10f6      djnz    $2a2e
2a38 79        ld      a,c
2a39 c3ee2b    jp      $2bee	; call SRLX
2a3c 00        nop     

; save header

; save on tape 256 zeroes, the 4 times header char 
; in RegC when calling this

2a3d cd222a    call    $2a22	; call Apply short delay (a=0 on return)
2a40 c5        push    bc
2a41 47        ld      b,a	; b=0
2a42 4f        ld      c,a	; c=0
2a43 cd492a    call    $2a49	; save on tape b times char c (save 256 zeroes)
2a46 c1        pop     bc	
2a47 0604      ld      b,$04	; save on tape 4 times header char
2a49 79        ld      a,c
2a4a cdee2b    call    $2bee	; call SRLX
2a4d 10fa      djnz    $2a49
2a4f c9        ret     

2a50 0eff      ld      c,$ff
2a52 0604      ld      b,$04
2a54 cdfa2b    call    $2bfa		; call RIM
2a57 b9        cp      c
2a58 20f8      jr      nz,$2a52
2a5a 10f8      djnz    $2a54
2a5c c9        ret     

2a5d cd091a    call    $1a09		; call CRLF
2a60 cdfa2b    call    $2bfa		; call RIM
2a63 08        ex      af,af'
2a64 2803      jr      z,$2a69
2a66 08        ex      af,af'
2a67 77        ld      (hl),a
2a68 08        ex      af,af'
2a69 08        ex      af,af'
2a6a 81        add     a,c
2a6b 4f        ld      c,a
2a6c 23        inc     hl
2a6d 10f1      djnz    $2a60
2a6f cdfa2b    call    $2bfa		; call RIM
2a72 b9        cp      c
2a73 c8        ret     z

2a74 cdfd2b    call    $2bfd		; call MFLP
2a77 1e15      ld      e,$15		; Tape Error
2a79 c31913    jp      $1319		; go to BASIC Error
2a7c cdd816    call    $16d8
2a7f 78        ld      a,b
2a80 b7        or      a
2a81 f5        push    af
2a82 3e01      ld      a,$01
2a84 32ac0c    ld      ($0cac),a
2a87 cd531d    call    $1d53
2a8a e3        ex      (sp),hl
2a8b e5        push    hl
2a8c 32ac0c    ld      ($0cac),a
2a8f 60        ld      h,b
2a90 69        ld      l,c
2a91 eb        ex      de,hl
2a92 19        add     hl,de
2a93 eb        ex      de,hl
2a94 0600      ld      b,$00
2a96 4e        ld      c,(hl)
2a97 09        add     hl,bc
2a98 09        add     hl,bc
2a99 23        inc     hl
2a9a cd7a1b    call    $1b7a
2a9d 0ed2      ld      c,$d2
2a9f cdfd2b    call    $2bfd		; call MFLP
2aa2 f1        pop     af
2aa3 200b      jr      nz,$2ab0
2aa5 cd3d2a    call    $2a3d		; call save header RegC
2aa8 cdbb2a    call    $2abb
2aab cd2e2a    call    $2a2e		; call save filename in tape
2aae 18f8      jr      $2aa8
2ab0 cd522a    call    $2a52
2ab3 cdbb2a    call    $2abb
2ab6 cd602a    call    $2a60
2ab9 18f8      jr      $2ab3
2abb 010004    ld      bc,$0400
2abe cd4615    call    $1546			; call CPHLDE
2ac1 d8        ret     c

2ac2 cdfd2b    call    $2bfd		; call MFLP
2ac5 e1        pop     hl
2ac6 e1        pop     hl
2ac7 c9        ret     

2ac8 00        nop     
2ac9 e5        push    hl
2aca 1804      jr      $2ad0

; GETKEY 
;
; Input character from keyboard, returning character in A, and with the
; carry flag set if the character is the ‘CS’ (BREAK) code. In that case,
; A=00. No other registers are affected. Note that this routine actually
; WAITS for a keypress. Non-NASCOM users MAY need to modify this
; routine, since it refers to the cursor location (to blink it under NAS-SYS).

2acc e5        push    hl
2acd 2a290c    ld      hl,($0c29)
2ad0 c5        push    bc
2ad1 4e        ld      c,(hl)
2ad2 365f      ld      (hl),$5f
2ad4 cde72a    call    $2ae7
2ad7 71        ld      (hl),c
2ad8 3805      jr      c,$2adf
2ada cde72a    call    $2ae7
2add 30f2      jr      nc,$2ad1
2adf c1        pop     bc
2ae0 e1        pop     hl
2ae1 fe1b      cp      $1b
2ae3 3f        ccf     
2ae4 c8        ret     z

2ae5 b7        or      a
2ae6 c9        ret     

2ae7 06c0      ld      b,$c0
2ae9 cdf72b    call    $2bf7			; call VKBD
2aec d8        ret     c

2aed 10fa      djnz    $2ae9
2aef c9        ret     

; PRM 
;
; Prints the message immediately following the sub-routine call, terminated
; by having the MSB of the last character set. This means that all other
; character codes must have ASCII values in the range 00-7F.

2af0 e3        ex      (sp),hl		
2af1 7e        ld      a,(hl)
2af2 cb7f      bit     7,a
2af4 cbbf      res     7,a
2af6 f5        push    af
2af7 cd5c15    call    $155c		; call PR
2afa f1        pop     af
2afb 23        inc     hl
2afc 28f3      jr      z,$2af1
2afe e3        ex      (sp),hl
2aff c9        ret     

; GETK
;
; A special routine written specifically for the NASCOM, to allow for the
; slowness of the NASCOM keyboard scan. This just detects the ‘CS’ or
; ‘BS’ characters, for breaking into a program or LIST. It may be replaced
; by a jump to VKBD (2BF7) on systems other than NASCOM

2b00 e5        push    hl
2b01 3e02      ld      a,$02
2b03 21000c    ld      hl,$0c00
2b06 ae        xor     (hl)
2b07 d300      out     ($00),a
2b09 ee01      xor     $01
2b0b d300      out     ($00),a
2b0d ee02      xor     $02
2b0f d300      out     ($00),a
2b11 7e        ld      a,(hl)
2b12 d300      out     ($00),a
2b14 e1        pop     hl
2b15 db00      in      a,($00)
2b17 2f        cpl     
2b18 e611      and     $11
2b1a c8        ret     z
2b1b e610      and     $10
2b1d 28ad      jr      z,$2acc		; call GETKEY
2b1f cdf72b    call    $2bf7		; call VKBD
2b22 c9        ret     

; getfilename

; Copy csave/cloas filename to 0cc4-0cd0
; len = 6 chars, only 0..Z allows, no lowercase
; if invalid char, resto of filename is space

2b23 cdab23    call    $23ab		; make HL point to filename
2b26 0d        dec     c
2b27 7e        ld      a,(hl)		; get first filename char
2b28 fe5b      cp      $5b		; cp with 'Z'+1
2b2a 300d      jr      nc,$2b39		; jmp if char >= 'Z'+1
2b2c fe30      cp      $30
2b2e 3809      jr      c,$2b39		; jmp if char < '0'
2b30 eda0      ldi     			; copy char to filename (allowd chars '0'..'Z'
2b32 10f3      djnz    $2b27		; max 6 chars the #00
2b34 af        xor     a
2b35 12        ld      (de),a
2b36 c3fd2b    jp      $2bfd		; call MFLP
2b39 3e20      ld      a,$20		; Invalid filename char -> replace rest of filename by space
2b3b 12        ld      (de),a
2b3c 13        inc     de
2b3d 18f3      jr      $2b32

; CSAVE

2b3f d640      sub     $40		; cmp first non blank char after csave with '@'
2b41 47        ld      b,a
2b42 ca7c2a    jp      z,$2a7c		; JMP if CSAVE @
2b45 cd232b    call    $2b23		; call getfilename
2b48 0eae      ld      c,$ae
2b4a cd3d2a    call    $2a3d		; call save header $ae
2b4d cda823    call    $23a8		; hl=0cd5=BUFFER (Input Buffer), de=0cc4-0cd0=PRTTXT Text area for forming numbers before printing
2b50 eb        ex      de,hl
2b51 cd2e2a    call    $2a2e		; call save filename in tape
2b54 cd222a    call    $2a22		; call Apply short delay
2b57 2a8c0c    ld      hl,($0c8c)	; 0c8c=TEXT	Start of basic program
2b5a ed5bb70c  ld      de,($0cb7)	; 0cb7=TXTUNF	End of basic program
2b5e eb        ex      de,hl
2b5f 37        scf     
2b60 ed52      sbc     hl,de		; HL=basic prog len
2b62 3830      jr      c,$2b94		; jp out if negative len
2b64 eb        ex      de,hl		; now hl=start of basic prog
2b65 3e04      ld      a,$04
2b67 0eff      ld      c,$ff
2b69 cd402a    call    $2a40		; call save header $ff
2b6c af        xor     a
2b6d ba        cp      d
2b6e 2002      jr      nz,$2b72
2b70 43        ld      b,e
2b71 04        inc     b
2b72 58        ld      e,b
2b73 7d        ld      a,l		; Save on tape HL=start of basic, DE=len
2b74 cdee2b    call    $2bee	; call SRLX
2b77 7c        ld      a,h
2b78 cdee2b    call    $2bee	; call SRLX
2b7b 7b        ld      a,e
2b7c cdee2b    call    $2bee	; call SRLX
2b7f 7a        ld      a,d
2b80 cdee2b    call    $2bee	; call SRLX
2b83 0c        inc     c
2b84 cd9a2b    call    $2b9a
2b87 cd382a    call    $2a38
2b8a 0e00      ld      c,$00
2b8c cd2e2a    call    $2a2e		; call save filename in tape
2b8f cd091a    call    $1a09		; call CRLF
2b92 18c6      jr      $2b5a
2b94 cdfd2b    call    $2bfd		; call MFLP
2b97 c35513    jp      $1355		; go to READY
2b9a cd9d2b    call    $2b9d
2b9d d5        push    de
2b9e cdf12b    call    $2bf1	; call TBCD3
2ba1 d1        pop     de
2ba2 eb        ex      de,hl
2ba3 c9        ret     

; FNENDI
;
; number in AB to f.p and test for ) to end

2ba4 cded1e    call    $1eed
2ba7 cd7a1b    call    $1b7a
2baa e1        pop     hl
2bab cd5115    call    $1551		; call TSTC
2bae 		db 29        		; ')' char
2baf c9        ret     

2bb0 211d26    ld      hl,$261d
2bb3 e3        ex      (sp),hl
2bb4 e9        jp      (hl)
2bb5 00        nop     
2bb6 00        nop     
2bb7 00        nop     
2bb8 00        nop     
2bb9 00        nop     
2bba 00        nop     
2bbb 00        nop     
2bbc 00        nop     
2bbd 00        nop     
2bbe 00        nop     
2bbf 00        nop     
2bc0 00        nop     
2bc1 00        nop     
2bc2 00        nop     
2bc3 00        nop     
2bc4 00        nop     
2bc5 00        nop     
2bc6 00        nop     
2bc7 216410    ld      hl,$1064
2bca 47        ld      b,a
2bcb cbb0      res     6,b
2bcd 07        rlca    
2bce 07        rlca    
2bcf 78        ld      a,b
2bd0 d8        ret     c

2bd1 3d        dec     a
2bd2 c9        ret     

2bd3 7e        ld      a,(hl)		; Get End of RAM
2bd4 47        ld      b,a
2bd5 2f        cpl     
2bd6 77        ld      (hl),a
2bd7 be        cp      (hl)
2bd8 70        ld      (hl),b
2bd9 c0        ret     nz
2bda 24        inc     h
2bdb 18f6      jr      $2bd3

; SETVID
;
; Set VDU back to normal

2bdd e5        push    hl		
2bde df        rst     $18		; NASSYS: Set VDU output
2bdf 		DB 77
2be0 e1        pop     hl
2be1 c9        ret     

2be2 c9        ret     

2be3 2a0600    ld      hl,($0006)
2be6 2b        dec     hl
2be7 2b        dec     hl
2be8 c9        ret     

2be9 59        ld      e,c
2bea 03        inc     bc

; RDEL 
;
; Delay depending on RegA. A=0 on exit

2beb ff        rst     $38		; NASSYS: Delay routine
2bec c9        ret     

2bed 00        nop     

; SRLX

2bee df        rst     $18		; NASSYS: Output to uart
2bef 		DB 6f
2bf0 c9        ret     

; TBCD3
;
; Print HL value in ascii, followed by space
 
2bf1 df        rst     $18		; NASSYS: Print HL in hex
2bf2 		DB 66
2bf3 c9        ret     

; ROUT
;
; NASSYS Print char in A

2bf4 f7        rst     $30		; NASSYS: print char in RagA. Must clear carry on exit
2bf5 c9        ret     

2bf6 00        nop     

; VKBD
;
; NASSYS Keyboard scan

2bf7 df        rst     $18		; NASSYS: Scan keyboard. Carry=0 if no key pressed
2bf8 		DB 62        		;                             =1, if key pressed (RegA=Key Code)
2bf9 c9        ret     

; RIM 

2bfa cf        rst     $08		; NASSYS: Input char to A (wait until key pressed)
2bfb c9        ret     

2bfc 00        nop     

; MFLP
;
; Toggle tape led

2bfd df        rst     $18		; NASSYS: Switch tape motor
2bfe 		DB 5f
2bff c9        ret     

; EDIT

2c00 cddd2b    call    $2bdd		; call SETVDU
2c03 cd8c17    call    $178c		; call GETNM
2c06 cd3014    call    $1430		; Init stack and basic pointers
2c09 d9        exx     
2c0a fd210a2c  ld      iy,$2c0a
2c0e d9        exx     
2c0f cdec13    call    $13ec
2c12 3803      jr      c,$2c17
2c14 ca5513    jp      z,$1355		; go to READY
2c17 03        inc     bc
2c18 03        inc     bc
2c19 c5        push    bc
2c1a 60        ld      h,b
2c1b 69        ld      l,c
2c1c 5e        ld      e,(hl)
2c1d 23        inc     hl
2c1e 56        ld      d,(hl)
2c1f 13        inc     de
2c20 d9        exx     
2c21 e1        pop     hl
2c22 118a0b    ld      de,$0b8a
2c25 ed53290c  ld      ($0c29),de
2c29 cdf02a    call    $2af0		; call PRM
2c2c 		DB 0d,0d+80h
2c2e 00        nop     
2c2f 11ca0a    ld      de,$0aca
2c32 d5        push    de
2c33 ed53290c  ld      ($0c29),de
2c37 cdc115    call    $15c1
2c3a 2a290c    ld      hl,($0c29)
2c3d 3e20      ld      a,$20
2c3f 77        ld      (hl),a
2c40 218a0b    ld      hl,$0b8a
2c43 22290c    ld      ($0c29),hl
2c46 e1        pop     hl
2c47 e5        push    hl
2c48 3e03      ld      a,$03
2c4a 11d50c    ld      de,$0cd5			; 0cd5=BUFFER (Input Buffer)
2c4d 013000    ld      bc,$0030
2c50 edb0      ldir    
2c52 0e10      ld      c,$10
2c54 09        add     hl,bc
2c55 3d        dec     a
2c56 20f5      jr      nz,$2c4d
2c58 4f        ld      c,a
2c59 d1        pop     de
2c5a d5        push    de
2c5b c5        push    bc
2c5c 21d50c    ld      hl,$0cd5			; 0cd5=BUFFER (Input Buffer)
2c5f 3e03      ld      a,$03
2c61 013000    ld      bc,$0030
2c64 edb0      ldir    
2c66 0e10      ld      c,$10
2c68 eb        ex      de,hl
2c69 09        add     hl,bc
2c6a eb        ex      de,hl
2c6b 3d        dec     a
2c6c 20f3      jr      nz,$2c61
2c6e c1        pop     bc
2c6f e1        pop     hl
2c70 e5        push    hl
2c71 114000    ld      de,$0040
2c74 79        ld      a,c
2c75 d630      sub     $30
2c77 3803      jr      c,$2c7c
2c79 19        add     hl,de
2c7a 18f9      jr      $2c75
2c7c c630      add     a,$30
2c7e 5f        ld      e,a
2c7f 19        add     hl,de
2c80 cdc92a    call    $2ac9			; call GETKEY
2c83 da5513    jp      c,$1355			; go to READY
2c86 fe0d      cp      $0d
2c88 2011      jr      nz,$2c9b
2c8a 11650d    ld      de,$0d65
2c8d 1b        dec     de
2c8e 1a        ld      a,(de)
2c8f fe20      cp      $20
2c91 28fa      jr      z,$2c8d
2c93 13        inc     de
2c94 eb        ex      de,hl
2c95 cd041a    call    $1a04
2c98 c36d13    jp      $136d
2c9b e5        push    hl
2c9c 21592c    ld      hl,$2c59
2c9f e3        ex      (sp),hl
2ca0 fe12      cp      $12
2ca2 2006      jr      nz,$2caa
2ca4 79        ld      a,c
2ca5 fe8f      cp      $8f
2ca7 d0        ret     nc
2ca8 0c        inc     c
2ca9 c9        ret     
2caa fe11      cp      $11
2cac 2004      jr      nz,$2cb2
2cae 0d        dec     c
2caf f0        ret     p

2cb0 0c        inc     c
2cb1 c9        ret     

2cb2 fe15      cp      $15
2cb4 2015      jr      nz,$2ccb
2cb6 21d50c    ld      hl,$0cd5			; 0cd5=BUFFER (Input Buffer)
2cb9 09        add     hl,bc
2cba 54        ld      d,h
2cbb 5d        ld      e,l
2cbc 23        inc     hl
2cbd c5        push    bc
2cbe 3e90      ld      a,$90
2cc0 91        sub     c
2cc1 4f        ld      c,a
2cc2 edb0      ldir    
2cc4 c1        pop     bc
2cc5 3e20      ld      a,$20
2cc7 32640d    ld      ($0d64),a	
2cca c9        ret     

2ccb fe16      cp      $16
2ccd 2015      jr      nz,$2ce4
2ccf 11640d    ld      de,$0d64			; 0d64=BUFEND (Edit)
2cd2 21630d    ld      hl,$0d63
2cd5 c5        push    bc
2cd6 3e90      ld      a,$90
2cd8 91        sub     c
2cd9 4f        ld      c,a
2cda edb8      lddr    
2cdc c1        pop     bc
2cdd 21d50c    ld      hl,$0cd5			; 0cd5=BUFFER (Input Buffer)
2ce0 09        add     hl,bc
2ce1 3620      ld      (hl),$20
2ce3 c9        ret     

2ce4 fe08      cp      $08
2ce6 200d      jr      nz,$2cf5
2ce8 21d50c    ld      hl,$0cd5			; 0cd5=BUFFER (Input Buffer)
2ceb 09        add     hl,bc
2cec 7e        ld      a,(hl)
2ced 3e20      ld      a,$20
2cef 77        ld      (hl),a
2cf0 0d        dec     c
2cf1 f0        ret     p

2cf2 0c        inc     c
2cf3 00        nop     
2cf4 c9        ret     

2cf5 21d50c    ld      hl,$0cd5			; 0cd5=BUFFER (Input Buffer)
2cf8 09        add     hl,bc
2cf9 fe20      cp      $20
2cfb 38a7      jr      c,$2ca4
2cfd 77        ld      (hl),a
2cfe 18a4      jr      $2ca4
2d00 cd392d    call    $2d39
2d03 c5        push    bc
2d04 3e01      ld      a,$01
2d06 cd482d    call    $2d48
2d09 e1        pop     hl
2d0a c9        ret     

2d0b cd392d    call    $2d39
2d0e c5        push    bc
2d0f 3e00      ld      a,$00
2d11 cd482d    call    $2d48
2d14 e1        pop     hl
2d15 c9        ret     

2d16 cd242d    call    $2d24
2d19 cd392d    call    $2d39
2d1c c5        push    bc
2d1d 3e01      ld      a,$01
2d1f cdac2d    call    $2dac
2d22 e1        pop     hl
2d23 c9        ret     

2d24 cd6117    call    $1761		; call UEXINT
2d27 ed531c0c  ld      ($0c1c),de
2d2b cd4c15    call    $154c		; call TSTCOM
2d2e cd6117    call    $1761		; call UEXINT
2d31 ed531e0c  ld      ($0c1e),de
2d35 cd4c15    call    $154c		; call TSTCOM
2d38 c9        ret     

2d39 cd6117    call    $1761		; call UEXINT
2d3c d5        push    de
2d3d cd4c15    call    $154c		; call TSTCOM
2d40 cd6117    call    $1761		; call UEXINT
2d43 e5        push    hl
2d44 c1        pop     bc
2d45 e1        pop     hl
2d46 eb        ex      de,hl
2d47 c9        ret     

2d48 f5        push    af
2d49 c5        push    bc
2d4a d5        push    de
2d4b e5        push    hl
2d4c f5        push    af
2d4d cd6e2d    call    $2d6e
2d50 d1        pop     de
2d51 3018      jr      nc,$2d6b
2d53 be        cp      (hl)
2d54 3801      jr      c,$2d57
2d56 77        ld      (hl),a
2d57 7a        ld      a,d
2d58 b7        or      a
2d59 2006      jr      nz,$2d61
2d5b 78        ld      a,b
2d5c 2f        cpl     
2d5d a6        and     (hl)
2d5e 77        ld      (hl),a
2d5f 180a      jr      $2d6b
2d61 3d        dec     a
2d62 78        ld      a,b
2d63 2004      jr      nz,$2d69
2d65 b6        or      (hl)
2d66 77        ld      (hl),a
2d67 1802      jr      $2d6b
2d69 ae        xor     (hl)
2d6a 77        ld      (hl),a
2d6b c3bd2e    jp      $2ebd
2d6e 7c        ld      a,h
2d6f b2        or      d
2d70 c0        ret     nz

2d71 7b        ld      a,e
2d72 fe60      cp      $60
2d74 d0        ret     nc

2d75 7d        ld      a,l
2d76 fe30      cp      $30
2d78 d0        ret     nc

2d79 ed44      neg     
2d7b c630      add     a,$30
2d7d 26ff      ld      h,$ff
2d7f d603      sub     $03
2d81 3002      jr      nc,$2d85
2d83 c630      add     a,$30
2d85 24        inc     h
2d86 d603      sub     $03
2d88 30fb      jr      nc,$2d85
2d8a c604      add     a,$04
2d8c cb3b      srl     e
2d8e 3002      jr      nc,$2d92
2d90 c603      add     a,$03
2d92 47        ld      b,a
2d93 af        xor     a
2d94 57        ld      d,a
2d95 6f        ld      l,a
2d96 37        scf     
2d97 17        rla     
2d98 10fd      djnz    $2d97
2d9a 47        ld      b,a
2d9b cb3c      srl     h
2d9d cb1d      rr      l
2d9f cb3c      srl     h
2da1 cb1d      rr      l
2da3 19        add     hl,de
2da4 110a08    ld      de,$080a
2da7 19        add     hl,de
2da8 3ec0      ld      a,$c0
2daa 37        scf     
2dab c9        ret     

2dac f5        push    af
2dad c5        push    bc
2dae d5        push    de
2daf e5        push    hl
2db0 dde5      push    ix
2db2 0606      ld      b,$06
2db4 3b        dec     sp
2db5 10fd      djnz    $2db4
2db7 dd210000  ld      ix,$0000
2dbb dd39      add     ix,sp
2dbd dd7701    ld      (ix+$01),a
2dc0 dd360000  ld      (ix+$00),$00
2dc4 e5        push    hl
2dc5 2a1c0c    ld      hl,($0c1c)
2dc8 eb        ex      de,hl
2dc9 b7        or      a
2dca ed52      sbc     hl,de
2dcc 3009      jr      nc,$2dd7
2dce 19        add     hl,de
2dcf eb        ex      de,hl
2dd0 b7        or      a
2dd1 ed52      sbc     hl,de
2dd3 ddcb00c6  set     0,(ix+$00)
2dd7 dd7402    ld      (ix+$02),h
2dda dd7503    ld      (ix+$03),l
2ddd ed5b1e0c  ld      de,($0c1e)
2de1 e1        pop     hl
2de2 b7        or      a
2de3 ed52      sbc     hl,de
2de5 3009      jr      nc,$2df0
2de7 19        add     hl,de
2de8 eb        ex      de,hl
2de9 b7        or      a
2dea ed52      sbc     hl,de
2dec ddcb00ce  set     1,(ix+$00)
2df0 dd7404    ld      (ix+$04),h
2df3 dd7505    ld      (ix+$05),l
2df6 dd6602    ld      h,(ix+$02)
2df9 dd6e03    ld      l,(ix+$03)
2dfc dd5604    ld      d,(ix+$04)
2dff dd5e05    ld      e,(ix+$05)
2e02 b7        or      a
2e03 ed52      sbc     hl,de
2e05 3011      jr      nc,$2e18
2e07 19        add     hl,de
2e08 dd7404    ld      (ix+$04),h
2e0b dd7505    ld      (ix+$05),l
2e0e dd7202    ld      (ix+$02),d
2e11 dd7303    ld      (ix+$03),e
2e14 ddcb00d6  set     2,(ix+$00)
2e18 00        nop     
2e19 dd5602    ld      d,(ix+$02)
2e1c dd5e03    ld      e,(ix+$03)
2e1f 210000    ld      hl,$0000
2e22 b7        or      a
2e23 ed52      sbc     hl,de
2e25 cb2c      sra     h
2e27 cb1d      rr      l
2e29 110000    ld      de,$0000
2e2c 010000    ld      bc,$0000
2e2f cd6c2e    call    $2e6c
2e32 13        inc     de
2e33 d5        push    de
2e34 dd5604    ld      d,(ix+$04)
2e37 dd5e05    ld      e,(ix+$05)
2e3a 19        add     hl,de
2e3b d1        pop     de
2e3c cb7c      bit     7,h
2e3e 200c      jr      nz,$2e4c
2e40 d5        push    de
2e41 dd5602    ld      d,(ix+$02)
2e44 dd5e03    ld      e,(ix+$03)
2e47 b7        or      a
2e48 ed52      sbc     hl,de
2e4a d1        pop     de
2e4b 03        inc     bc
2e4c e5        push    hl
2e4d dd6602    ld      h,(ix+$02)
2e50 dd6e03    ld      l,(ix+$03)
2e53 b7        or      a
2e54 ed52      sbc     hl,de
2e56 e1        pop     hl
2e57 30d6      jr      nc,$2e2f
2e59 0606      ld      b,$06
2e5b 33        inc     sp
2e5c 10fd      djnz    $2e5b
2e5e dde1      pop     ix
2e60 e1        pop     hl
2e61 d1        pop     de
2e62 c1        pop     bc
2e63 f1        pop     af
2e64 ed531c0c  ld      ($0c1c),de
2e68 221e0c    ld      ($0c1e),hl
2e6b c9        ret     

2e6c c5        push    bc
2e6d d5        push    de
2e6e e5        push    hl
2e6f ddcb0056  bit     2,(ix+$00)
2e73 2804      jr      z,$2e79
2e75 c5        push    bc
2e76 d5        push    de
2e77 c1        pop     bc
2e78 d1        pop     de
2e79 ddcb004e  bit     1,(ix+$00)
2e7d 2808      jr      z,$2e87
2e7f 210000    ld      hl,$0000
2e82 b7        or      a
2e83 ed42      sbc     hl,bc
2e85 44        ld      b,h
2e86 4d        ld      c,l
2e87 ddcb0046  bit     0,(ix+$00)
2e8b 2807      jr      z,$2e94
2e8d 210000    ld      hl,$0000
2e90 b7        or      a
2e91 ed52      sbc     hl,de
2e93 eb        ex      de,hl
2e94 ddcb005e  bit     3,(ix+$00)
2e98 c4ae2e    call    nz,$2eae
2e9b 2a1c0c    ld      hl,($0c1c)
2e9e 19        add     hl,de
2e9f eb        ex      de,hl
2ea0 2a1e0c    ld      hl,($0c1e)
2ea3 09        add     hl,bc
2ea4 dd7e01    ld      a,(ix+$01)
2ea7 cd482d    call    $2d48
2eaa e1        pop     hl
2eab d1        pop     de
2eac c1        pop     bc
2ead c9        ret     

2eae 60        ld      h,b
2eaf 69        ld      l,c
2eb0 09        add     hl,bc
2eb1 09        add     hl,bc
2eb2 cb2c      sra     h
2eb4 cb1d      rr      l
2eb6 cb2c      sra     h
2eb8 cb1d      rr      l
2eba 44        ld      b,h
2ebb 4d        ld      c,l
2ebc c9        ret     

2ebd e1        pop     hl
2ebe d1        pop     de
2ebf c1        pop     bc
2ec0 f1        pop     af
2ec1 c9        ret     

2ec2 3e0c      ld      a,$0c	; CHR(12)
2ec4 f7        rst     $30	; NAS-SYS ROUT - print char
2ec5 c9        ret     

2ec6 cd6117    call    $1761		; call UEXINT
2ec9 d5        push    de
2eca cd4c15    call    $154c		; call TSTCOM
2ecd cd6117    call    $1761		; call UEXINT
2ed0 e3        ex      (sp),hl
2ed1 73        ld      (hl),e
2ed2 23        inc     hl
2ed3 72        ld      (hl),d
2ed4 e1        pop     hl
2ed5 c9        ret     

2ed6 e1        pop     hl
2ed7 23        inc     hl
2ed8 cd6117    call    $1761		; call UEXINT
2edb 1a        ld      a,(de)
2edc 13        inc     de
2edd 47        ld      b,a
2ede 1a        ld      a,(de)
2edf e5        push    hl
2ee0 c3a42b    jp      $2ba4		; call FNENDI
