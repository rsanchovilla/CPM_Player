; Disassembly of the file "E:\Tmp\cpm\pcw\writmast.com"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Friday, 20 of December 2019 at 09:17 PM
; 
0100 c3ae04    jp      $04ae
0103 fdedfd    db      $fd, $ed, $fd    ; Undocumented 8 T-State NOP
0106 ed00      db      $ed, $00         ; Undocumented 8 T-State NOP
0108 0a        ld      a,(bc)
0109 a0        and     b
010a c8        ret     z

010b 02        ld      (bc),a
010c 02        ld      (bc),a
010d 09        add     hl,bc
010e 1b        dec     de
010f 64        ld      h,h
0110 48        ld      c,b
0111 57        ld      d,a
0112 72        ld      (hl),d
0113 69        ld      l,c
0114 74        ld      (hl),h
0115 65        ld      h,l
0116 4d        ld      c,l
0117 61        ld      h,c
0118 73        ld      (hl),e
0119 74        ld      (hl),h
011a 65        ld      h,l
011b 72        ld      (hl),d
011c 1b        dec     de
011d 64        ld      h,h
011e 40        ld      b,b
011f 2d        dec     l
0120 2d        dec     l
0121 43        ld      b,e
0122 72        ld      (hl),d
0123 6f        ld      l,a
0124 6d        ld      l,l
0125 65        ld      h,l
0126 6d        ld      l,l
0127 63        ld      h,e
0128 6f        ld      l,a
0129 2057      jr      nz,$0182
012b 6f        ld      l,a
012c 72        ld      (hl),d
012d 64        ld      h,h
012e 2050      jr      nz,$0180
0130 72        ld      (hl),d
0131 6f        ld      l,a
0132 63        ld      h,e
0133 65        ld      h,l
0134 73        ld      (hl),e
0135 73        ld      (hl),e
0136 69        ld      l,c
0137 6e        ld      l,(hl)
0138 67        ld      h,a
0139 2053      jr      nz,$018e
013b 79        ld      a,c
013c 73        ld      (hl),e
013d 74        ld      (hl),h
013e 65        ld      h,l
013f 6d        ld      l,l
0140 2c        inc     l
0141 2076      jr      nz,$01b9
0143 65        ld      h,l
0144 72        ld      (hl),d
0145 73        ld      (hl),e
0146 69        ld      l,c
0147 6f        ld      l,a
0148 6e        ld      l,(hl)
0149 2030      jr      nz,$017b
014b 322e30    ld      ($302e),a
014e 32200d    ld      ($0d20),a
0151 0a        ld      a,(bc)
0152 09        add     hl,bc
0153 43        ld      b,e
0154 6f        ld      l,a
0155 70        ld      (hl),b
0156 79        ld      a,c
0157 72        ld      (hl),d
0158 69        ld      l,c
0159 67        ld      h,a
015a 68        ld      l,b
015b 74        ld      (hl),h
015c 2028      jr      nz,$0186
015e 63        ld      h,e
015f 29        add     hl,hl
0160 2031      jr      nz,$0193
0162 39        add     hl,sp
0163 3831      jr      c,$0196
0165 2c        inc     l
0166 2031      jr      nz,$0199
0168 39        add     hl,sp
0169 3832      jr      c,$019d
016b 2c        inc     l
016c 2043      jr      nz,$01b1
016e 72        ld      (hl),d
016f 6f        ld      l,a
0170 6d        ld      l,l
0171 65        ld      h,l
0172 6d        ld      l,l
0173 63        ld      h,e
0174 6f        ld      l,a
0175 2c        inc     l
0176 2049      jr      nz,$01c1
0178 6e        ld      l,(hl)
0179 63        ld      h,e
017a 2e20      ld      l,$20
017c 2041      jr      nz,$01bf
017e 6c        ld      l,h
017f 6c        ld      l,h
0180 2072      jr      nz,$01f4
0182 69        ld      l,c
0183 67        ld      h,a
0184 68        ld      l,b
0185 74        ld      (hl),h
0186 73        ld      (hl),e
0187 2072      jr      nz,$01fb
0189 65        ld      h,l
018a 73        ld      (hl),e
018b 65        ld      h,l
018c 72        ld      (hl),d
018d 76        halt    
018e 65        ld      h,l
018f 64        ld      h,h
0190 2e24      ld      l,$24
0192 dd210d01  ld      ix,$010d
0196 cdf73e    call    $3ef7
0199 dd2198c5  ld      ix,$c598
019d cd003f    call    $3f00
01a0 0e8d      ld      c,$8d
01a2 cd0500    call    $0005
01a5 fe03      cp      $03
01a7 2006      jr      nz,$01af
01a9 dd21b1c7  ld      ix,$c7b1
01ad 1804      jr      $01b3
01af dd21c0c7  ld      ix,$c7c0
01b3 cd003f    call    $3f00
01b6 dd21d1c7  ld      ix,$c7d1
01ba cd003f    call    $3f00
01bd c9        ret     

01be cd6635    call    $3566
01c1 c8        ret     z

01c2 c5        push    bc
01c3 e5        push    hl
01c4 21ec01    ld      hl,$01ec
01c7 011700    ld      bc,$0017
01ca edb1      cpir    
01cc 201b      jr      nz,$01e9
01ce cd7635    call    $3576
01d1 2808      jr      z,$01db
01d3 fef0      cp      $f0
01d5 3804      jr      c,$01db
01d7 fef9      cp      $f9
01d9 380e      jr      c,$01e9
01db 01ec01    ld      bc,$01ec
01de 2b        dec     hl
01df b7        or      a
01e0 ed42      sbc     hl,bc
01e2 44        ld      b,h
01e3 4d        ld      c,l
01e4 210302    ld      hl,$0203
01e7 09        add     hl,bc
01e8 7e        ld      a,(hl)
01e9 e1        pop     hl
01ea c1        pop     bc
01eb c9        ret     

01ec ecedee    call    pe,$eeed
01ef ef        rst     $28
01f0 ff        rst     $38
01f1 fefd      cp      $fd
01f3 fcfbfa    call    m,$fafb
01f6 f9        ld      sp,hl
01f7 f8        ret     m

01f8 f7        rst     $30
01f9 f6f5      or      $f5
01fb f4f3f2    call    p,$f2f3
01fe 00        nop     
01ff 1c        inc     e
0200 1d        dec     e
0201 1e1f      ld      e,$1f
0203 f0        ret     p

0204 fb        ei      
0205 ef        rst     $28
0206 f5        push    af
0207 ecf4f9    call    pe,$f9f4
020a faf7f6    jp      m,$f6f7
020d f2f3ee    jp      p,$eef3
0210 edfd      db      $ed, $fd         ; Undocumented 8 T-State NOP
0212 fee9      cp      $e9
0214 f8        ret     m

0215 fcebff    call    m,$ffeb
0218 eaf1c5    jp      pe,$c5f1
021b d5        push    de
021c 111b47    ld      de,$471b
021f 0e02      ld      c,$02
0221 cd0500    call    $0005
0224 5a        ld      e,d
0225 cd0500    call    $0005
0228 cd3680    call    $8036
022b d1        pop     de
022c c1        pop     bc
022d c9        ret     

022e f5        push    af
022f c5        push    bc
0230 d5        push    de
0231 0e02      ld      c,$02
0233 1e1b      ld      e,$1b
0235 cd0500    call    $0005
0238 1e4c      ld      e,$4c
023a cd0500    call    $0005
023d d1        pop     de
023e c1        pop     bc
023f f1        pop     af
0240 c9        ret     

0241 f5        push    af
0242 c5        push    bc
0243 d5        push    de
0244 0e02      ld      c,$02
0246 1e1b      ld      e,$1b
0248 cd0500    call    $0005
024b 1e4d      ld      e,$4d
024d cd0500    call    $0005
0250 d1        pop     de
0251 c1        pop     bc
0252 f1        pop     af
0253 c9        ret     

0254 f5        push    af
0255 c5        push    bc
0256 d5        push    de
0257 1e07      ld      e,$07
0259 0e02      ld      c,$02
025b cd0500    call    $0005
025e d1        pop     de
025f c1        pop     bc
0260 f1        pop     af
0261 c9        ret     

0262 f5        push    af
0263 c5        push    bc
0264 d5        push    de
0265 117102    ld      de,$0271
0268 0e09      ld      c,$09
026a cd0500    call    $0005
026d d1        pop     de
026e c1        pop     bc
026f f1        pop     af
0270 c9        ret     

0271 0d        dec     c
0272 0a        ld      a,(bc)
0273 24        inc     h
0274 f5        push    af
0275 c5        push    bc
0276 d5        push    de
0277 1606      ld      d,$06
0279 1e00      ld      e,$00
027b 0e8e      ld      c,$8e
027d cd0500    call    $0005
0280 d1        pop     de
0281 c1        pop     bc
0282 f1        pop     af
0283 c9        ret     

0284 f5        push    af
0285 e5        push    hl
0286 3e06      ld      a,$06
0288 67        ld      h,a
0289 cdc993    call    $93c9
028c fe01      cp      $01
028e 2003      jr      nz,$0293
0290 97        sub     a
0291 1823      jr      $02b6
0293 fe0c      cp      $0c
0295 2004      jr      nz,$029b
0297 3e09      ld      a,$09
0299 1816      jr      $02b1
029b fe0d      cp      $0d
029d 2804      jr      z,$02a3
029f fe0a      cp      $0a
02a1 2008      jr      nz,$02ab
02a3 cd2694    call    $9426
02a6 cd3784    call    $8437
02a9 180b      jr      $02b6
02ab cd6696    call    $9666
02ae cd3784    call    $8437
02b1 f5        push    af
02b2 cd2694    call    $9426
02b5 f1        pop     af
02b6 cdbc02    call    $02bc
02b9 e1        pop     hl
02ba f1        pop     af
02bb c9        ret     

02bc cd2103    call    $0321
02bf cd9b03    call    $039b
02c2 cd2803    call    $0328
02c5 7c        ld      a,h
02c6 cd9b03    call    $039b
02c9 c9        ret     

02ca f5        push    af
02cb cd340f    call    $0f34
02ce cdb70e    call    $0eb7
02d1 cdec0e    call    $0eec
02d4 cd3e0f    call    $0f3e
02d7 cdd70e    call    $0ed7
02da f1        pop     af
02db c9        ret     

02dc f5        push    af
02dd c5        push    bc
02de cd3887    call    $8738
02e1 3d        dec     a
02e2 47        ld      b,a
02e3 3e4c      ld      a,$4c
02e5 cdfe02    call    $02fe
02e8 c1        pop     bc
02e9 f1        pop     af
02ea c9        ret     

02eb cd2e35    call    $352e
02ee 200d      jr      nz,$02fd
02f0 f5        push    af
02f1 c5        push    bc
02f2 cd3887    call    $8738
02f5 47        ld      b,a
02f6 3e3e      ld      a,$3e
02f8 cdfe02    call    $02fe
02fb c1        pop     bc
02fc f1        pop     af
02fd c9        ret     

02fe d5        push    de
02ff 321e03    ld      ($031e),a
0302 111a03    ld      de,$031a
0305 0e09      ld      c,$09
0307 cd0500    call    $0005
030a 78        ld      a,b
030b c61f      add     a,$1f
030d cd4583    call    $8345
0310 111d03    ld      de,$031d
0313 0e09      ld      c,$09
0315 cd0500    call    $0005
0318 d1        pop     de
0319 c9        ret     

031a 1b        dec     de
031b 5e        ld      e,(hl)
031c 24        inc     h
031d 6f        ld      l,a
031e 4c        ld      c,h
031f 1d        dec     e
0320 24        inc     h
0321 110003    ld      de,$0300
0324 cd9504    call    $0495
0327 c9        ret     

0328 110002    ld      de,$0200
032b cd9504    call    $0495
032e c9        ret     

032f 0e02      ld      c,$02
0331 1e1b      ld      e,$1b
0333 cd0500    call    $0005
0336 1e65      ld      e,$65
0338 cd0500    call    $0005
033b c9        ret     

033c f5        push    af
033d c5        push    bc
033e d5        push    de
033f cd2803    call    $0328
0342 1e20      ld      e,$20
0344 0e02      ld      c,$02
0346 cd0500    call    $0005
0349 cd2803    call    $0328
034c d1        pop     de
034d c1        pop     bc
034e f1        pop     af
034f c9        ret     

0350 f5        push    af
0351 c5        push    bc
0352 d5        push    de
0353 115f03    ld      de,$035f
0356 0e09      ld      c,$09
0358 cd0500    call    $0005
035b d1        pop     de
035c c1        pop     bc
035d f1        pop     af
035e c9        ret     

035f 1b        dec     de
0360 5a        ld      e,d
0361 24        inc     h
0362 f5        push    af
0363 c5        push    bc
0364 d5        push    de
0365 117103    ld      de,$0371
0368 0e09      ld      c,$09
036a cd0500    call    $0005
036d d1        pop     de
036e c1        pop     bc
036f f1        pop     af
0370 c9        ret     

0371 1b        dec     de
0372 5a        ld      e,d
0373 24        inc     h
0374 f5        push    af
0375 c5        push    bc
0376 d5        push    de
0377 1600      ld      d,$00
0379 1e00      ld      e,$00
037b 0e8e      ld      c,$8e
037d cd0500    call    $0005
0380 1e0d      ld      e,$0d
0382 0e02      ld      c,$02
0384 cd0500    call    $0005
0387 d1        pop     de
0388 c1        pop     bc
0389 f1        pop     af
038a c9        ret     

038b f5        push    af
038c c5        push    bc
038d d5        push    de
038e 1607      ld      d,$07
0390 1e00      ld      e,$00
0392 0e8e      ld      c,$8e
0394 cd0500    call    $0005
0397 d1        pop     de
0398 c1        pop     bc
0399 f1        pop     af
039a c9        ret     

039b f5        push    af
039c c5        push    bc
039d d5        push    de
039e e5        push    hl
039f fe11      cp      $11
03a1 3012      jr      nc,$03b5
03a3 21ba03    ld      hl,$03ba
03a6 cd8d90    call    $908d
03a9 7e        ld      a,(hl)
03aa 11cb03    ld      de,$03cb
03ad 0e09      ld      c,$09
03af cd0500    call    $0005
03b2 cd4583    call    $8345
03b5 e1        pop     hl
03b6 d1        pop     de
03b7 c1        pop     bc
03b8 f1        pop     af
03b9 c9        ret     

03ba 40        ld      b,b
03bb 41        ld      b,c
03bc 42        ld      b,d
03bd 43        ld      b,e
03be 50        ld      d,b
03bf 51        ld      d,c
03c0 52        ld      d,d
03c1 53        ld      d,e
03c2 60        ld      h,b
03c3 61        ld      h,c
03c4 62        ld      h,d
03c5 63        ld      h,e
03c6 70        ld      (hl),b
03c7 71        ld      (hl),c
03c8 72        ld      (hl),d
03c9 73        ld      (hl),e
03ca 24        inc     h
03cb 1b        dec     de
03cc 64        ld      h,h
03cd 24        inc     h
03ce f5        push    af
03cf c5        push    bc
03d0 d5        push    de
03d1 7a        ld      a,d
03d2 c61f      add     a,$1f
03d4 57        ld      d,a
03d5 7b        ld      a,e
03d6 c61f      add     a,$1f
03d8 5f        ld      e,a
03d9 d5        push    de
03da 0e02      ld      c,$02
03dc 1e1b      ld      e,$1b
03de cd0500    call    $0005
03e1 1e5e      ld      e,$5e
03e3 cd0500    call    $0005
03e6 d1        pop     de
03e7 cd0500    call    $0005
03ea 5a        ld      e,d
03eb cd0500    call    $0005
03ee d1        pop     de
03ef c1        pop     bc
03f0 f1        pop     af
03f1 c9        ret     

03f2 f5        push    af
03f3 3e1d      ld      a,$1d
03f5 cd4583    call    $8345
03f8 f1        pop     af
03f9 c9        ret     

03fa c5        push    bc
03fb d5        push    de
03fc 110704    ld      de,$0407
03ff 0e09      ld      c,$09
0401 cd0500    call    $0005
0404 d1        pop     de
0405 c1        pop     bc
0406 c9        ret     

0407 1b        dec     de
0408 3b        dec     sp
0409 24        inc     h
040a c5        push    bc
040b d5        push    de
040c 111704    ld      de,$0417
040f 0e09      ld      c,$09
0411 cd0500    call    $0005
0414 d1        pop     de
0415 c1        pop     bc
0416 c9        ret     

0417 1d        dec     e
0418 1b        dec     de
0419 3124f5    ld      sp,$f524
041c c5        push    bc
041d d5        push    de
041e 112d04    ld      de,$042d
0421 0e09      ld      c,$09
0423 cd0500    call    $0005
0426 d1        pop     de
0427 c1        pop     bc
0428 cd083e    call    $3e08
042b f1        pop     af
042c c9        ret     

042d 1b        dec     de
042e 321b2d    ld      ($2d1b),a
0431 24        inc     h
0432 f5        push    af
0433 c5        push    bc
0434 d5        push    de
0435 f5        push    af
0436 114804    ld      de,$0448
0439 0e09      ld      c,$09
043b cd0500    call    $0005
043e f1        pop     af
043f c61f      add     a,$1f
0441 cd4583    call    $8345
0444 d1        pop     de
0445 c1        pop     bc
0446 f1        pop     af
0447 c9        ret     

0448 1b        dec     de
0449 3c        inc     a
044a 24        inc     h
044b f5        push    af
044c c5        push    bc
044d d5        push    de
044e f5        push    af
044f 116104    ld      de,$0461
0452 0e09      ld      c,$09
0454 cd0500    call    $0005
0457 f1        pop     af
0458 c61f      add     a,$1f
045a cd4583    call    $8345
045d d1        pop     de
045e c1        pop     bc
045f f1        pop     af
0460 c9        ret     

0461 1b        dec     de
0462 3d        dec     a
0463 24        inc     h
0464 c5        push    bc
0465 d5        push    de
0466 117104    ld      de,$0471
0469 0e09      ld      c,$09
046b cd0500    call    $0005
046e d1        pop     de
046f c1        pop     bc
0470 c9        ret     

0471 0d        dec     c
0472 09        add     hl,bc
0473 09        add     hl,bc
0474 09        add     hl,bc
0475 09        add     hl,bc
0476 09        add     hl,bc
0477 09        add     hl,bc
0478 09        add     hl,bc
0479 09        add     hl,bc
047a 09        add     hl,bc
047b 2020      jr      nz,$049d
047d 2020      jr      nz,$049f
047f 2020      jr      nz,$04a1
0481 1b        dec     de
0482 64        ld      h,h
0483 40        ld      b,b
0484 0d        dec     c
0485 1b        dec     de
0486 64        ld      h,h
0487 61        ld      h,c
0488 24        inc     h
0489 c5        push    bc
048a d5        push    de
048b 1e7e      ld      e,$7e
048d 0e02      ld      c,$02
048f cd0500    call    $0005
0492 d1        pop     de
0493 c1        pop     bc
0494 c9        ret     

0495 f5        push    af
0496 c5        push    bc
0497 0e8e      ld      c,$8e
0499 cd0500    call    $0005
049c c1        pop     bc
049d f1        pop     af
049e c9        ret     

049f 11a904    ld      de,$04a9
04a2 0e09      ld      c,$09
04a4 cd0500    call    $0005
04a7 1804      jr      $04ad
04a9 1b        dec     de
04aa 2e39      ld      l,$39
04ac 24        inc     h
04ad c9        ret     

04ae 31d105    ld      sp,$05d1
04b1 cd6091    call    $9160
04b4 cd6203    call    $0362
04b7 cd9201    call    $0192
04ba cdc233    call    $33c2
04bd 2005      jr      nz,$04c4
04bf cdfc87    call    $87fc
04c2 18f6      jr      $04ba
04c4 cd843d    call    $3d84
04c7 cd3c86    call    $863c
04ca cd5003    call    $0350
04cd cda27f    call    $7fa2
04d0 cd8375    call    $7583
04d3 cd6203    call    $0362
04d6 cde290    call    $90e2
04d9 3005      jr      nc,$04e0
04db cd330d    call    $0d33
04de 18e4      jr      $04c4
04e0 210105    ld      hl,$0501
04e3 012400    ld      bc,$0024
04e6 edb1      cpir    
04e8 2005      jr      nz,$04ef
04ea cdf404    call    $04f4
04ed 18cb      jr      $04ba
04ef cd5402    call    $0254
04f2 18d0      jr      $04c4
04f4 010105    ld      bc,$0501
04f7 b7        or      a
04f8 ed42      sbc     hl,bc
04fa 7d        ld      a,l
04fb 212505    ld      hl,$0525
04fe c3c88c    jp      $8cc8
0501 1b        dec     de
0502 09        add     hl,bc
0503 0b        dec     bc
0504 0a        ld      a,(bc)
0505 08        ex      af,af'
0506 0c        inc     c
0507 19        add     hl,de
0508 0d        dec     c
0509 f8        ret     m

050a f5        push    af
050b edee      db      $ed, $ee         ; Undocumented 8 T-State NOP
050d ff        rst     $38
050e ef        rst     $28
050f e0        ret     po

0510 e1        pop     hl
0511 fefd      cp      $fd
0513 e3        ex      (sp),hl
0514 e2f17f    jp      po,$7ff1
0517 ece8eb    call    pe,$ebe8
051a fb        ei      
051b f3        di      
051c eaf0f4    jp      pe,$f4f0
051f fcfaf9    call    m,$f9fa
0522 f7        rst     $30
0523 f6f2      or      $f2
0525 e7        rst     $20
0526 07        rlca    
0527 56        ld      d,(hl)
0528 07        rlca    
0529 7d        ld      a,l
052a 0b        dec     bc
052b 86        add     a,(hl)
052c 0b        dec     bc
052d 8f        adc     a,a
052e 0b        dec     bc
052f 9b        sbc     a,e
0530 0b        dec     bc
0531 a3        and     e
0532 0b        dec     bc
0533 ae        xor     (hl)
0534 0c        inc     c
0535 c0        ret     nz

0536 07        rlca    
0537 ac        xor     h
0538 0b        dec     bc
0539 9e        sbc     a,(hl)
053a 07        rlca    
053b a9        xor     c
053c 07        rlca    
053d ae        xor     (hl)
053e 07        rlca    
053f b7        or      a
0540 07        rlca    
0541 fa0780    jp      m,$8007
0544 09        add     hl,bc
0545 380b      jr      c,$0552
0547 47        ld      b,a
0548 0b        dec     bc
0549 2d        dec     l
054a 0a        ld      a,(bc)
054b 96        sub     (hl)
054c 0a        ld      a,(bc)
054d c9        ret     

054e 0a        ld      a,(bc)
054f 1b        dec     de
0550 0b        dec     bc
0551 320cfa    ld      ($fa0c),a
0554 09        add     hl,bc
0555 56        ld      d,(hl)
0556 0b        dec     bc
0557 7a        ld      a,d
0558 0b        dec     bc
0559 4d        ld      c,l
055a 0c        inc     c
055b 95        sub     l
055c 0c        inc     c
055d a4        and     h
055e 0c        inc     c
055f d405d1    call    nc,$d105
0562 05        dec     b
0563 2e06      ld      l,$06
0565 32065d    ld      ($5d06),a
0568 0659      ld      b,$59
056a 062a      ld      b,$2a
056c 07        rlca    
056d 00        nop     
056e 00        nop     
056f 00        nop     
0570 00        nop     
0571 00        nop     
0572 00        nop     
0573 00        nop     
0574 00        nop     
0575 00        nop     
0576 00        nop     
0577 00        nop     
0578 00        nop     
0579 00        nop     
057a 00        nop     
057b 00        nop     
057c 00        nop     
057d 00        nop     
057e 00        nop     
057f 00        nop     
0580 00        nop     
0581 00        nop     
0582 00        nop     
0583 00        nop     
0584 00        nop     
0585 00        nop     
0586 00        nop     
0587 00        nop     
0588 00        nop     
0589 00        nop     
058a 00        nop     
058b 00        nop     
058c 00        nop     
058d 00        nop     
058e 00        nop     
058f 00        nop     
0590 00        nop     
0591 00        nop     
0592 00        nop     
0593 00        nop     
0594 00        nop     
0595 00        nop     
0596 00        nop     
0597 00        nop     
0598 00        nop     
0599 00        nop     
059a 00        nop     
059b 00        nop     
059c 00        nop     
059d 00        nop     
059e 00        nop     
059f 00        nop     
05a0 00        nop     
05a1 00        nop     
05a2 00        nop     
05a3 00        nop     
05a4 00        nop     
05a5 00        nop     
05a6 00        nop     
05a7 00        nop     
05a8 00        nop     
05a9 00        nop     
05aa 00        nop     
05ab 00        nop     
05ac 00        nop     
05ad 00        nop     
05ae 00        nop     
05af 00        nop     
05b0 00        nop     
05b1 00        nop     
05b2 00        nop     
05b3 00        nop     
05b4 00        nop     
05b5 00        nop     
05b6 00        nop     
05b7 00        nop     
05b8 00        nop     
05b9 00        nop     
05ba 00        nop     
05bb 00        nop     
05bc 00        nop     
05bd 00        nop     
05be 00        nop     
05bf 00        nop     
05c0 00        nop     
05c1 00        nop     
05c2 00        nop     
05c3 00        nop     
05c4 00        nop     
05c5 00        nop     
05c6 00        nop     
05c7 00        nop     
05c8 00        nop     
05c9 00        nop     
05ca 00        nop     
05cb 00        nop     
05cc 00        nop     
05cd 00        nop     
05ce 00        nop     
05cf 00        nop     
05d0 00        nop     
05d1 c3ee79    jp      $79ee
05d4 cdf007    call    $07f0
05d7 cd6599    call    $9965
05da fd212a06  ld      iy,$062a
05de cdda8e    call    $8eda
05e1 cd3943    call    $4339
05e4 47        ld      b,a
05e5 0e00      ld      c,$00
05e7 cdc993    call    $93c9
05ea fe20      cp      $20
05ec 28f9      jr      z,$05e7
05ee fea0      cp      $a0
05f0 28f5      jr      z,$05e7
05f2 fe0d      cp      $0d
05f4 2810      jr      z,$0606
05f6 fe0a      cp      $0a
05f8 2817      jr      z,$0611
05fa fe0c      cp      $0c
05fc 280d      jr      z,$060b
05fe fe01      cp      $01
0600 2809      jr      z,$060b
0602 0e00      ld      c,$00
0604 18e1      jr      $05e7
0606 0c        inc     c
0607 78        ld      a,b
0608 b9        cp      c
0609 30dc      jr      nc,$05e7
060b cd973c    call    $3c97
060e cdcf39    call    $39cf
0611 cd6599    call    $9965
0614 d5        push    de
0615 e5        push    hl
0616 cde78e    call    $8ee7
0619 cd0c3a    call    $3a0c
061c e1        pop     hl
061d d1        pop     de
061e cd772e    call    $2e77
0621 cdae86    call    $86ae
0624 cd4887    call    $8748
0627 c34f7d    jp      $7d4f
062a 00        nop     
062b 00        nop     
062c 00        nop     
062d 00        nop     
062e 0e86      ld      c,$86
0630 1802      jr      $0634
0632 0e81      ld      c,$81
0634 cdb70e    call    $0eb7
0637 cd6696    call    $9666
063a cd4b37    call    $374b
063d 79        ld      a,c
063e 2805      jr      z,$0645
0640 cd0a37    call    $370a
0643 1808      jr      $064d
0645 cde835    call    $35e8
0648 3003      jr      nc,$064d
064a c34f7d    jp      $7d4f
064d cd340f    call    $0f34
0650 cdec0e    call    $0eec
0653 cd3e0f    call    $0f3e
0656 c3d70e    jp      $0ed7
0659 3e01      ld      a,$01
065b 1801      jr      $065e
065d 97        sub     a
065e dde5      push    ix
0660 fde5      push    iy
0662 322507    ld      ($0725),a
0665 cd4d34    call    $344d
0668 2006      jr      nz,$0670
066a cdcf60    call    $60cf
066d c31d07    jp      $071d
0670 cd340f    call    $0f34
0673 fd212607  ld      iy,$0726
0677 cdd25f    call    $5fd2
067a cd0c3a    call    $3a0c
067d cda096    call    $96a0
0680 cd6599    call    $9965
0683 cdda8e    call    $8eda
0686 ed4b1d9a  ld      bc,($9a1d)
068a 2a1f9a    ld      hl,($9a1f)
068d b7        or      a
068e ed42      sbc     hl,bc
0690 7c        ld      a,h
0691 fe02      cp      $02
0693 2003      jr      nz,$0698
0695 7d        ld      a,l
0696 fe00      cp      $00
0698 300c      jr      nc,$06a6
069a cdde5f    call    $5fde
069d cd0c3a    call    $3a0c
06a0 cde78e    call    $8ee7
06a3 cd0c3a    call    $3a0c
06a6 cdde5f    call    $5fde
06a9 cd088f    call    $8f08
06ac 7a        ld      a,d
06ad b3        or      e
06ae 2059      jr      nz,$0709
06b0 7c        ld      a,h
06b1 fe02      cp      $02
06b3 2003      jr      nz,$06b8
06b5 7d        ld      a,l
06b6 fe00      cp      $00
06b8 304f      jr      nc,$0709
06ba 44        ld      b,h
06bb 4d        ld      c,l
06bc c5        push    bc
06bd 11e977    ld      de,$77e9
06c0 2a1d9a    ld      hl,($9a1d)
06c3 edb0      ldir    
06c5 c1        pop     bc
06c6 3a2507    ld      a,($0725)
06c9 b7        or      a
06ca 282e      jr      z,$06fa
06cc cd5f97    call    $975f
06cf cd6599    call    $9965
06d2 fd210010  ld      iy,$1000
06d6 cd088f    call    $8f08
06d9 301f      jr      nc,$06fa
06db 60        ld      h,b
06dc 69        ld      l,c
06dd 110000    ld      de,$0000
06e0 fd212607  ld      iy,$0726
06e4 cdda8e    call    $8eda
06e7 fd210010  ld      iy,$1000
06eb cde78e    call    $8ee7
06ee fd212607  ld      iy,$0726
06f2 cd088f    call    $8f08
06f5 cd0c3a    call    $3a0c
06f8 1807      jr      $0701
06fa fd210010  ld      iy,$1000
06fe cd3e0f    call    $0f3e
0701 11e977    ld      de,$77e9
0704 cdf096    call    $96f0
0707 180e      jr      $0717
0709 dd210fbf  ld      ix,$bf0f
070d cd463f    call    $3f46
0710 fd210010  ld      iy,$1000
0714 cd3e0f    call    $0f3e
0717 cdae86    call    $86ae
071a cd4887    call    $8748
071d cd4f7d    call    $7d4f
0720 fde1      pop     iy
0722 dde1      pop     ix
0724 c9        ret     

0725 00        nop     
0726 00        nop     
0727 00        nop     
0728 00        nop     
0729 00        nop     
072a cdb70e    call    $0eb7
072d cd2587    call    $8725
0730 f5        push    af
0731 cdb639    call    $39b6
0734 cd8d87    call    $878d
0737 47        ld      b,a
0738 cd3887    call    $8738
073b b8        cp      b
073c dccb87    call    c,$87cb
073f cd3c86    call    $863c
0742 cd2e02    call    $022e
0745 cd6404    call    $0464
0748 cd0c39    call    $390c
074b b7        or      a
074c cd0485    call    $8504
074f c1        pop     bc
0750 cd9c39    call    $399c
0753 c3e00e    jp      $0ee0
0756 cdb70e    call    $0eb7
0759 cddd33    call    $33dd
075c 2834      jr      z,$0792
075e cda096    call    $96a0
0761 cd340f    call    $0f34
0764 cdf369    call    $69f3
0767 3832      jr      c,$079b
0769 cd6599    call    $9965
076c d5        push    de
076d e5        push    hl
076e cdb639    call    $39b6
0771 cd3e0f    call    $0f3e
0774 e1        pop     hl
0775 d1        pop     de
0776 cd9f0e    call    $0e9f
0779 381d      jr      c,$0798
077b cdda8e    call    $8eda
077e cd3c86    call    $863c
0781 cd540f    call    $0f54
0784 cd040f    call    $0f04
0787 cdfa39    call    $39fa
078a cdb639    call    $39b6
078d cd3e0f    call    $0f3e
0790 1803      jr      $0795
0792 cdf369    call    $69f3
0795 cd9f0e    call    $0e9f
0798 dc4f7d    call    c,$7d4f
079b c34887    jp      $8748
079e cd3c3c    call    $3c3c
07a1 cd4f7d    call    $7d4f
07a4 cd4887    call    $8748
07a7 78        ld      a,b
07a8 c9        ret     

07a9 cd5c3c    call    $3c5c
07ac 18f3      jr      $07a1
07ae cdb639    call    $39b6
07b1 dc4f7d    call    c,$7d4f
07b4 c34887    jp      $8748
07b7 cdcf39    call    $39cf
07ba dc4f7d    call    c,$7d4f
07bd c34887    jp      $8748
07c0 cdc993    call    $93c9
07c3 f5        push    af
07c4 cdc890    call    $90c8
07c7 3806      jr      c,$07cf
07c9 f1        pop     af
07ca cd0485    call    $8504
07cd 1815      jr      $07e4
07cf cd2694    call    $9426
07d2 ee20      xor     $20
07d4 5f        ld      e,a
07d5 cdda97    call    $97da
07d8 f1        pop     af
07d9 3806      jr      c,$07e1
07db 7b        ld      a,e
07dc cd4583    call    $8345
07df 1803      jr      $07e4
07e1 cd4f7d    call    $7d4f
07e4 c34887    jp      $8748
07e7 cd8402    call    $0284
07ea cdf007    call    $07f0
07ed c3fc87    jp      $87fc
07f0 cddd33    call    $33dd
07f3 c8        ret     z

07f4 cded33    call    $33ed
07f7 c30f3e    jp      $3e0f
07fa cda096    call    $96a0
07fd cd340f    call    $0f34
0800 cd2587    call    $8725
0803 32fe0f    ld      ($0ffe),a
0806 cdb70e    call    $0eb7
0809 cdd875    call    $75d8
080c cd6696    call    $9666
080f fe0c      cp      $0c
0811 2019      jr      nz,$082c
0813 cd5643    call    $4356
0816 2814      jr      z,$082c
0818 cd820f    call    $0f82
081b 300f      jr      nc,$082c
081d cd4102    call    $0241
0820 010100    ld      bc,$0001
0823 cd5f97    call    $975f
0826 cde187    call    $87e1
0829 c37a09    jp      $097a
082c cda096    call    $96a0
082f 0601      ld      b,$01
0831 cd1a39    call    $391a
0834 380e      jr      c,$0844
0836 cdac0f    call    $0fac
0839 cddc37    call    $37dc
083c cd6696    call    $9666
083f fe01      cp      $01
0841 c25508    jp      nz,$0855
0844 cd540f    call    $0f54
0847 cd8d87    call    $878d
084a 47        ld      b,a
084b cd3887    call    $8738
084e b8        cp      b
084f dccb87    call    c,$87cb
0852 c37709    jp      $0977
0855 3afe0f    ld      a,($0ffe)
0858 fe01      cp      $01
085a 2876      jr      z,$08d2
085c cd6696    call    $9666
085f fe0c      cp      $0c
0861 2009      jr      nz,$086c
0863 cd9e38    call    $389e
0866 cd540f    call    $0f54
0869 c37709    jp      $0977
086c cd147a    call    $7a14
086f 47        ld      b,a
0870 3afe0f    ld      a,($0ffe)
0873 b8        cp      b
0874 d47e30    call    nc,$307e
0877 3afd0f    ld      a,($0ffd)
087a fe18      cp      $18
087c 2006      jr      nz,$0884
087e cd1d0f    call    $0f1d
0881 c37709    jp      $0977
0884 fe17      cp      $17
0886 202e      jr      nz,$08b6
0888 cd8d87    call    $878d
088b fe18      cp      $18
088d 28ef      jr      z,$087e
088f 3afc0f    ld      a,($0ffc)
0892 fe01      cp      $01
0894 200f      jr      nz,$08a5
0896 cd4102    call    $0241
0899 cde839    call    $39e8
089c cd6202    call    $0262
089f cdf20e    call    $0ef2
08a2 c37709    jp      $0977
08a5 cd1d0f    call    $0f1d
08a8 cd6202    call    $0262
08ab cd540f    call    $0f54
08ae fe01      cp      $01
08b0 c4f50e    call    nz,$0ef5
08b3 c37709    jp      $0977
08b6 3afc0f    ld      a,($0ffc)
08b9 fe01      cp      $01
08bb 2813      jr      z,$08d0
08bd cd1d0f    call    $0f1d
08c0 cd6202    call    $0262
08c3 fe01      cp      $01
08c5 2006      jr      nz,$08cd
08c7 cd540f    call    $0f54
08ca c37709    jp      $0977
08cd cd2694    call    $9426
08d0 1835      jr      $0907
08d2 3afd0f    ld      a,($0ffd)
08d5 fe18      cp      $18
08d7 2006      jr      nz,$08df
08d9 cd1d0f    call    $0f1d
08dc c37709    jp      $0977
08df fe17      cp      $17
08e1 2024      jr      nz,$0907
08e3 cd8d87    call    $878d
08e6 fe18      cp      $18
08e8 201d      jr      nz,$0907
08ea cd6696    call    $9666
08ed fe0c      cp      $0c
08ef 2011      jr      nz,$0902
08f1 cd540f    call    $0f54
08f4 cd6404    call    $0464
08f7 cdcb87    call    $87cb
08fa cdc993    call    $93c9
08fd cdf50e    call    $0ef5
0900 1875      jr      $0977
0902 cd1d0f    call    $0f1d
0905 1870      jr      $0977
0907 cdb987    call    $87b9
090a cd4102    call    $0241
090d cdc287    call    $87c2
0910 3afd0f    ld      a,($0ffd)
0913 47        ld      b,a
0914 cd8d87    call    $878d
0917 90        sub     b
0918 2e00      ld      l,$00
091a 3802      jr      c,$091e
091c 04        inc     b
091d 6f        ld      l,a
091e 3e18      ld      a,$18
0920 90        sub     b
0921 47        ld      b,a
0922 2600      ld      h,$00
0924 2d        dec     l
0925 7d        ld      a,l
0926 b7        or      a
0927 2017      jr      nz,$0940
0929 cd6696    call    $9666
092c fe0c      cp      $0c
092e 2007      jr      nz,$0937
0930 cdcb87    call    $87cb
0933 26ff      ld      h,$ff
0935 1809      jr      $0940
0937 fe01      cp      $01
0939 2005      jr      nz,$0940
093b cdcb87    call    $87cb
093e 1837      jr      $0977
0940 cde839    call    $39e8
0943 10df      djnz    $0924
0945 1601      ld      d,$01
0947 7c        ld      a,h
0948 b7        or      a
0949 201e      jr      nz,$0969
094b 1e18      ld      e,$18
094d cd8d87    call    $878d
0950 fe18      cp      $18
0952 200d      jr      nz,$0961
0954 cd6696    call    $9666
0957 fe0c      cp      $0c
0959 2005      jr      nz,$0960
095b cdcb87    call    $87cb
095e 1809      jr      $0969
0960 1d        dec     e
0961 cd9504    call    $0495
0964 cdf50e    call    $0ef5
0967 180e      jr      $0977
0969 1e17      ld      e,$17
096b cd9504    call    $0495
096e cdf50e    call    $0ef5
0971 cd6202    call    $0262
0974 cdf50e    call    $0ef5
0977 cd3e0f    call    $0f3e
097a cdd70e    call    $0ed7
097d c34887    jp      $8748
0980 cda096    call    $96a0
0983 cdb70e    call    $0eb7
0986 cd340f    call    $0f34
0989 cdac0f    call    $0fac
098c cd9e38    call    $389e
098f cd2a95    call    $952a
0992 cdac0f    call    $0fac
0995 cdc993    call    $93c9
0998 cdac0f    call    $0fac
099b cdb987    call    $87b9
099e 3afc0f    ld      a,($0ffc)
09a1 fe01      cp      $01
09a3 2825      jr      z,$09ca
09a5 f5        push    af
09a6 cd7e30    call    $307e
09a9 cda096    call    $96a0
09ac cdcb30    call    $30cb
09af cdb639    call    $39b6
09b2 f1        pop     af
09b3 fe4e      cp      $4e
09b5 dc540f    call    c,$0f54
09b8 cd3887    call    $8738
09bb fe19      cp      $19
09bd 282f      jr      z,$09ee
09bf cd6202    call    $0262
09c2 cd2e02    call    $022e
09c5 cdf50e    call    $0ef5
09c8 1803      jr      $09cd
09ca cd2e02    call    $022e
09cd cd5643    call    $4356
09d0 281c      jr      z,$09ee
09d2 cd820f    call    $0f82
09d5 3017      jr      nc,$09ee
09d7 cd6696    call    $9666
09da fe01      cp      $01
09dc 2810      jr      z,$09ee
09de fe0c      cp      $0c
09e0 280c      jr      z,$09ee
09e2 cde839    call    $39e8
09e5 cd3887    call    $8738
09e8 bb        cp      e
09e9 38ec      jr      c,$09d7
09eb cde187    call    $87e1
09ee cdc287    call    $87c2
09f1 cd3e0f    call    $0f3e
09f4 cdd70e    call    $0ed7
09f7 c34887    jp      $8748
09fa cd440f    call    $0f44
09fd 282b      jr      z,$0a2a
09ff cd6696    call    $9666
0a02 cdc53c    call    $3cc5
0a05 2823      jr      z,$0a2a
0a07 cda096    call    $96a0
0a0a cdb70e    call    $0eb7
0a0d cd540f    call    $0f54
0a10 cdd875    call    $75d8
0a13 0601      ld      b,$01
0a15 cd1a39    call    $391a
0a18 cdac0f    call    $0fac
0a1b cd6696    call    $9666
0a1e cd9e38    call    $389e
0a21 cd2694    call    $9426
0a24 cd9f0e    call    $0e9f
0a27 dc4f7d    call    c,$7d4f
0a2a c34887    jp      $8748
0a2d cddd33    call    $33dd
0a30 200c      jr      nz,$0a3e
0a32 cde533    call    $33e5
0a35 dd21470a  ld      ix,$0a47
0a39 cd973f    call    $3f97
0a3c 1806      jr      $0a44
0a3e cded33    call    $33ed
0a41 cd083e    call    $3e08
0a44 c34887    jp      $8748
0a47 43        ld      b,e
0a48 68        ld      l,b
0a49 61        ld      h,c
0a4a 72        ld      (hl),d
0a4b 61        ld      h,c
0a4c 63        ld      h,e
0a4d 74        ld      (hl),h
0a4e 65        ld      h,l
0a4f 72        ld      (hl),d
0a50 73        ld      (hl),e
0a51 2074      jr      nz,$0ac7
0a53 79        ld      a,c
0a54 70        ld      (hl),b
0a55 65        ld      h,l
0a56 64        ld      h,h
0a57 2070      jr      nz,$0ac9
0a59 75        ld      (hl),l
0a5a 73        ld      (hl),e
0a5b 68        ld      l,b
0a5c 2072      jr      nz,$0ad0
0a5e 65        ld      h,l
0a5f 73        ld      (hl),e
0a60 74        ld      (hl),h
0a61 206f      jr      nz,$0ad2
0a63 66        ld      h,(hl)
0a64 206c      jr      nz,$0ad2
0a66 69        ld      l,c
0a67 6e        ld      l,(hl)
0a68 65        ld      h,l
0a69 2072      jr      nz,$0add
0a6b 69        ld      l,c
0a6c 67        ld      h,a
0a6d 68        ld      l,b
0a6e 74        ld      (hl),h
0a6f 2e20      ld      l,$20
0a71 2050      jr      nz,$0ac3
0a73 72        ld      (hl),d
0a74 65        ld      h,l
0a75 73        ld      (hl),e
0a76 73        ld      (hl),e
0a77 2049      jr      nz,$0ac2
0a79 4e        ld      c,(hl)
0a7a 53        ld      d,e
0a7b 2043      jr      nz,$0ac0
0a7d 48        ld      c,b
0a7e 41        ld      b,c
0a7f 52        ld      d,d
0a80 206b      jr      nz,$0aed
0a82 65        ld      h,l
0a83 79        ld      a,c
0a84 2061      jr      nz,$0ae7
0a86 67        ld      h,a
0a87 61        ld      h,c
0a88 69        ld      l,c
0a89 6e        ld      l,(hl)
0a8a 2077      jr      nz,$0b03
0a8c 68        ld      l,b
0a8d 65        ld      h,l
0a8e 6e        ld      l,(hl)
0a8f 2064      jr      nz,$0af5
0a91 6f        ld      l,a
0a92 6e        ld      l,(hl)
0a93 65        ld      h,l
0a94 2e24      ld      l,$24
0a96 cd6696    call    $9666
0a99 cdc53c    call    $3cc5
0a9c 2828      jr      z,$0ac6
0a9e cdb70e    call    $0eb7
0aa1 cdb975    call    $75b9
0aa4 010100    ld      bc,$0001
0aa7 cd5f97    call    $975f
0aaa cddc37    call    $37dc
0aad cd9f0e    call    $0e9f
0ab0 3005      jr      nc,$0ab7
0ab2 cd4f7d    call    $7d4f
0ab5 180f      jr      $0ac6
0ab7 cd340f    call    $0f34
0aba cd540f    call    $0f54
0abd cd040f    call    $0f04
0ac0 cd3e0f    call    $0f3e
0ac3 cdd70e    call    $0ed7
0ac6 c34887    jp      $8748
0ac9 cd340f    call    $0f34
0acc cd6696    call    $9666
0acf cd110b    call    $0b11
0ad2 200d      jr      nz,$0ae1
0ad4 dd2162ca  ld      ix,$ca62
0ad8 cd463f    call    $3f46
0adb cd4f7d    call    $7d4f
0ade c33e0f    jp      $0f3e
0ae1 cd2694    call    $9426
0ae4 cd110b    call    $0b11
0ae7 20f8      jr      nz,$0ae1
0ae9 fe01      cp      $01
0aeb c4c993    call    nz,$93c9
0aee cd6696    call    $9666
0af1 cd110b    call    $0b11
0af4 2808      jr      z,$0afe
0af6 cd9e0a    call    $0a9e
0af9 cd3c86    call    $863c
0afc 18f0      jr      $0aee
0afe cdc53c    call    $3cc5
0b01 c8        ret     z

0b02 cd9e0a    call    $0a9e
0b05 cd3c86    call    $863c
0b08 cd6696    call    $9666
0b0b cd110b    call    $0b11
0b0e 28ee      jr      z,$0afe
0b10 c9        ret     

0b11 cdb13c    call    $3cb1
0b14 c8        ret     z

0b15 fe01      cp      $01
0b17 c8        ret     z

0b18 fe01      cp      $01
0b1a c9        ret     

0b1b cdb70e    call    $0eb7
0b1e cda096    call    $96a0
0b21 cdc53c    call    $3cc5
0b24 280f      jr      z,$0b35
0b26 cd2694    call    $9426
0b29 cd9f0e    call    $0e9f
0b2c dc4f7d    call    c,$7d4f
0b2f cd3c86    call    $863c
0b32 cd9e0a    call    $0a9e
0b35 c34887    jp      $8748
0b38 cdb70e    call    $0eb7
0b3b cd063d    call    $3d06
0b3e cd9f0e    call    $0e9f
0b41 cd0485    call    $8504
0b44 c34887    jp      $8748
0b47 cdb70e    call    $0eb7
0b4a cd143d    call    $3d14
0b4d cd9f0e    call    $0e9f
0b50 cd5185    call    $8551
0b53 c34887    jp      $8748
0b56 dd216bbf  ld      ix,$bf6b
0b5a cdf73e    call    $3ef7
0b5d cde03e    call    $3ee0
0b60 280a      jr      z,$0b6c
0b62 dd216cc3  ld      ix,$c36c
0b66 cdf73e    call    $3ef7
0b69 cdc93e    call    $3ec9
0b6c cd4f7d    call    $7d4f
0b6f cddd33    call    $33dd
0b72 c8        ret     z

0b73 dd21470a  ld      ix,$0a47
0b77 c39a3f    jp      $3f9a
0b7a c34f7d    jp      $7d4f
0b7d cd5339    call    $3953
0b80 cd5185    call    $8551
0b83 c37d80    jp      $807d
0b86 cd7639    call    $3976
0b89 cd0485    call    $8504
0b8c c37d80    jp      $807d
0b8f cd2694    call    $9426
0b92 cd5185    call    $8551
0b95 cd4887    call    $8748
0b98 c37d80    jp      $807d
0b9b cdc993    call    $93c9
0b9e cd0485    call    $8504
0ba1 18f2      jr      $0b95
0ba3 cd4d3a    call    $3a4d
0ba6 dc4f7d    call    c,$7d4f
0ba9 c34887    jp      $8748
0bac cdb70e    call    $0eb7
0baf cdeb42    call    $42eb
0bb2 47        ld      b,a
0bb3 cdef42    call    $42ef
0bb6 90        sub     b
0bb7 2876      jr      z,$0c2f
0bb9 3874      jr      c,$0c2f
0bbb 4f        ld      c,a
0bbc cdb639    call    $39b6
0bbf cd6696    call    $9666
0bc2 fe01      cp      $01
0bc4 2869      jr      z,$0c2f
0bc6 fe0c      cp      $0c
0bc8 2808      jr      z,$0bd2
0bca fe0a      cp      $0a
0bcc 2804      jr      z,$0bd2
0bce fe0d      cp      $0d
0bd0 2005      jr      nz,$0bd7
0bd2 cd7639    call    $3976
0bd5 1855      jr      $0c2c
0bd7 c5        push    bc
0bd8 cd7e30    call    $307e
0bdb c1        pop     bc
0bdc fe01      cp      $01
0bde 284f      jr      z,$0c2f
0be0 fe0d      cp      $0d
0be2 28ee      jr      z,$0bd2
0be4 fe0a      cp      $0a
0be6 28ea      jr      z,$0bd2
0be8 cdcf39    call    $39cf
0beb cd2587    call    $8725
0bee d602      sub     $02
0bf0 47        ld      b,a
0bf1 cdb639    call    $39b6
0bf4 cd8394    call    $9483
0bf7 fe8b      cp      $8b
0bf9 c42a95    call    nz,$952a
0bfc 79        ld      a,c
0bfd 90        sub     b
0bfe 300d      jr      nc,$0c0d
0c00 78        ld      a,b
0c01 91        sub     c
0c02 b7        or      a
0c03 1f        rra     
0c04 47        ld      b,a
0c05 cdeb42    call    $42eb
0c08 90        sub     b
0c09 38c7      jr      c,$0bd2
0c0b 1806      jr      $0c13
0c0d 1f        rra     
0c0e 47        ld      b,a
0c0f cdeb42    call    $42eb
0c12 80        add     a,b
0c13 3d        dec     a
0c14 cdc738    call    $38c7
0c17 3816      jr      c,$0c2f
0c19 cdb639    call    $39b6
0c1c cd9f0e    call    $0e9f
0c1f 3008      jr      nc,$0c29
0c21 cde839    call    $39e8
0c24 cd4f7d    call    $7d4f
0c27 1806      jr      $0c2f
0c29 cdef0e    call    $0eef
0c2c cd0485    call    $8504
0c2f c34887    jp      $8748
0c32 cd6534    call    $3465
0c35 200c      jr      nz,$0c43
0c37 cdc536    call    $36c5
0c3a da685f    jp      c,$5f68
0c3d cd685f    call    $5f68
0c40 c34f7d    jp      $7d4f
0c43 cdc536    call    $36c5
0c46 cd835f    call    $5f83
0c49 c44f7d    call    nz,$7d4f
0c4c c9        ret     

0c4d cda096    call    $96a0
0c50 fe21      cp      $21
0c52 382d      jr      c,$0c81
0c54 fe7f      cp      $7f
0c56 3029      jr      nc,$0c81
0c58 cd6696    call    $9666
0c5b fe0d      cp      $0d
0c5d 2007      jr      nz,$0c66
0c5f 3e0a      ld      a,$0a
0c61 cdda97    call    $97da
0c64 1809      jr      $0c6f
0c66 fe01      cp      $01
0c68 2013      jr      nz,$0c7d
0c6a 3e0a      ld      a,$0a
0c6c cdfc38    call    $38fc
0c6f cd2694    call    $9426
0c72 cd3c86    call    $863c
0c75 cd540f    call    $0f54
0c78 cd8904    call    $0489
0c7b 1815      jr      $0c92
0c7d fe0a      cp      $0a
0c7f 2803      jr      z,$0c84
0c81 c35402    jp      $0254
0c84 3e0d      ld      a,$0d
0c86 cdda97    call    $97da
0c89 cd2694    call    $9426
0c8c cd3c86    call    $863c
0c8f cd540f    call    $0f54
0c92 c3ae0c    jp      $0cae
0c95 cd5003    call    $0350
0c98 cd6d54    call    $546d
0c9b cd6203    call    $0362
0c9e cdae86    call    $86ae
0ca1 c34f7d    jp      $7d4f
0ca4 cdb70e    call    $0eb7
0ca7 cd4c76    call    $764c
0caa dc5402    call    c,$0254
0cad c9        ret     

0cae cdb70e    call    $0eb7
0cb1 cd3943    call    $4339
0cb4 47        ld      b,a
0cb5 cddd33    call    $33dd
0cb8 2831      jr      z,$0ceb
0cba c5        push    bc
0cbb cd7402    call    $0274
0cbe cd340f    call    $0f34
0cc1 cda038    call    $38a0
0cc4 cd3c86    call    $863c
0cc7 cd3887    call    $8738
0cca fe19      cp      $19
0ccc f5        push    af
0ccd dc2e02    call    c,$022e
0cd0 f1        pop     af
0cd1 fe18      cp      $18
0cd3 c4530e    call    nz,$0e53
0cd6 10ef      djnz    $0cc7
0cd8 cd7e30    call    $307e
0cdb cda096    call    $96a0
0cde cdcb30    call    $30cb
0ce1 cdef0e    call    $0eef
0ce4 cd3e0f    call    $0f3e
0ce7 cd3c86    call    $863c
0cea c1        pop     bc
0ceb cde839    call    $39e8
0cee fe01      cp      $01
0cf0 201d      jr      nz,$0d0f
0cf2 cd3087    call    $8730
0cf5 4f        ld      c,a
0cf6 cd9e38    call    $389e
0cf9 3835      jr      c,$0d30
0cfb cd530e    call    $0e53
0cfe 10f6      djnz    $0cf6
0d00 cd4933    call    $3349
0d03 cd4f87    call    $874f
0d06 1825      jr      $0d2d
0d08 cde839    call    $39e8
0d0b fe01      cp      $01
0d0d 28e7      jr      z,$0cf6
0d0f cd3887    call    $8738
0d12 fe19      cp      $19
0d14 3006      jr      nc,$0d1c
0d16 cd6202    call    $0262
0d19 cd740e    call    $0e74
0d1c 10ea      djnz    $0d08
0d1e cd4933    call    $3349
0d21 cd9f0e    call    $0e9f
0d24 3807      jr      c,$0d2d
0d26 cd3887    call    $8738
0d29 fe19      cp      $19
0d2b 3803      jr      c,$0d30
0d2d cd0485    call    $8504
0d30 c34887    jp      $8748
0d33 cd440f    call    $0f44
0d36 ca150e    jp      z,$0e15
0d39 32180e    ld      ($0e18),a
0d3c cdb70e    call    $0eb7
0d3f cddd33    call    $33dd
0d42 282a      jr      z,$0d6e
0d44 cd2587    call    $8725
0d47 32fe0f    ld      ($0ffe),a
0d4a cda096    call    $96a0
0d4d cd340f    call    $0f34
0d50 3a180e    ld      a,($0e18)
0d53 cdfc38    call    $38fc
0d56 da150e    jp      c,$0e15
0d59 cd2694    call    $9426
0d5c cd540f    call    $0f54
0d5f cd040f    call    $0f04
0d62 cd3e0f    call    $0f3e
0d65 cdd70e    call    $0ed7
0d68 cdc993    call    $93c9
0d6b c30f0e    jp      $0e0f
0d6e 3a180e    ld      a,($0e18)
0d71 cde13a    call    $3ae1
0d74 da150e    jp      c,$0e15
0d77 cd7a7f    call    $7f7a
0d7a cd6696    call    $9666
0d7d fe0a      cp      $0a
0d7f 2006      jr      nz,$0d87
0d81 cd8904    call    $0489
0d84 cd2803    call    $0328
0d87 cd2587    call    $8725
0d8a 47        ld      b,a
0d8b cdef42    call    $42ef
0d8e b8        cp      b
0d8f d20f0e    jp      nc,$0e0f
0d92 3c        inc     a
0d93 b8        cp      b
0d94 d45402    call    nc,$0254
0d97 cd7843    call    $4378
0d9a 2873      jr      z,$0e0f
0d9c 3a180e    ld      a,($0e18)
0d9f fe20      cp      $20
0da1 286c      jr      z,$0e0f
0da3 cdef42    call    $42ef
0da6 3c        inc     a
0da7 b8        cp      b
0da8 3065      jr      nc,$0e0f
0daa cd340f    call    $0f34
0dad cdad30    call    $30ad
0db0 fe01      cp      $01
0db2 280a      jr      z,$0dbe
0db4 cd2587    call    $8725
0db7 47        ld      b,a
0db8 cd147a    call    $7a14
0dbb b8        cp      b
0dbc 3805      jr      c,$0dc3
0dbe cd3e0f    call    $0f3e
0dc1 184c      jr      $0e0f
0dc3 cd1680    call    $8016
0dc6 cd190e    call    $0e19
0dc9 cd540f    call    $0f54
0dcc cd1680    call    $8016
0dcf cd3943    call    $4339
0dd2 47        ld      b,a
0dd3 cd9e38    call    $389e
0dd6 383d      jr      c,$0e15
0dd8 cd2694    call    $9426
0ddb cd360e    call    $0e36
0dde cdc993    call    $93c9
0de1 cd530e    call    $0e53
0de4 1808      jr      $0dee
0de6 cd9e38    call    $389e
0de9 382a      jr      c,$0e15
0deb cd530e    call    $0e53
0dee 78        ld      a,b
0def fe01      cp      $01
0df1 c44a0e    call    nz,$0e4a
0df4 cd1680    call    $8016
0df7 10ed      djnz    $0de6
0df9 cdcb30    call    $30cb
0dfc cdd23c    call    $3cd2
0dff cd4a0e    call    $0e4a
0e02 cd340f    call    $0f34
0e05 cd9f0e    call    $0e9f
0e08 3808      jr      c,$0e12
0e0a cd680e    call    $0e68
0e0d 1806      jr      $0e15
0e0f cd9f0e    call    $0e9f
0e12 dc4f7d    call    c,$7d4f
0e15 c34887    jp      $8748
0e18 00        nop     
0e19 3aff0f    ld      a,($0fff)
0e1c 4f        ld      c,a
0e1d cd3087    call    $8730
0e20 b9        cp      c
0e21 ca3c86    jp      z,$863c
0e24 cd3487    call    $8734
0e27 c608      add     a,$08
0e29 cd4487    call    $8744
0e2c f5        push    af
0e2d cd3c86    call    $863c
0e30 f1        pop     af
0e31 d608      sub     $08
0e33 c34487    jp      $8744
0e36 cd8043    call    $4380
0e39 c8        ret     z

0e3a cd1680    call    $8016
0e3d cddf30    call    $30df
0e40 d0        ret     nc

0e41 cd1680    call    $8016
0e44 cdec0e    call    $0eec
0e47 c32694    jp      $9426
0e4a cdb987    call    $87b9
0e4d cd2e02    call    $022e
0e50 c3c287    jp      $87c2
0e53 cd6202    call    $0262
0e56 cd3887    call    $8738
0e59 fe19      cp      $19
0e5b 3808      jr      c,$0e65
0e5d cdac87    call    $87ac
0e60 3e18      ld      a,$18
0e62 cd4087    call    $8740
0e65 c3740e    jp      $0e74
0e68 cdec0e    call    $0eec
0e6b cd2694    call    $9426
0e6e cdb639    call    $39b6
0e71 c33e0f    jp      $0f3e
0e74 c5        push    bc
0e75 cd5643    call    $4356
0e78 2823      jr      z,$0e9d
0e7a cd8b6b    call    $6b8b
0e7d 210100    ld      hl,$0001
0e80 7c        ld      a,h
0e81 b8        cp      b
0e82 2002      jr      nz,$0e86
0e84 7d        ld      a,l
0e85 b9        cp      c
0e86 2015      jr      nz,$0e9d
0e88 cda096    call    $96a0
0e8b fe0c      cp      $0c
0e8d 280e      jr      z,$0e9d
0e8f cdf984    call    $84f9
0e92 cd6202    call    $0262
0e95 cd8d87    call    $878d
0e98 fe18      cp      $18
0e9a ccac87    call    z,$87ac
0e9d c1        pop     bc
0e9e c9        ret     

0e9f c5        push    bc
0ea0 3aff0f    ld      a,($0fff)
0ea3 4f        ld      c,a
0ea4 cd4f87    call    $874f
0ea7 380c      jr      c,$0eb5
0ea9 3a0410    ld      a,($1004)
0eac b7        or      a
0ead 2806      jr      z,$0eb5
0eaf cd4d34    call    $344d
0eb2 2001      jr      nz,$0eb5
0eb4 37        scf     
0eb5 c1        pop     bc
0eb6 c9        ret     

0eb7 cd3087    call    $8730
0eba 32ff0f    ld      ($0fff),a
0ebd cd3487    call    $8734
0ec0 32fc0f    ld      ($0ffc),a
0ec3 cd3887    call    $8738
0ec6 32fd0f    ld      ($0ffd),a
0ec9 cd4d34    call    $344d
0ecc 2003      jr      nz,$0ed1
0ece 97        sub     a
0ecf 1802      jr      $0ed3
0ed1 3e01      ld      a,$01
0ed3 320410    ld      ($1004),a
0ed6 c9        ret     

0ed7 3afd0f    ld      a,($0ffd)
0eda cd4087    call    $8740
0edd c3e00e    jp      $0ee0
0ee0 3aff0f    ld      a,($0fff)
0ee3 cd1687    call    $8716
0ee6 3afc0f    ld      a,($0ffc)
0ee9 c34487    jp      $8744
0eec cdb639    call    $39b6
0eef cd3c86    call    $863c
0ef2 cd540f    call    $0f54
0ef5 c5        push    bc
0ef6 d5        push    de
0ef7 3aff0f    ld      a,($0fff)
0efa 47        ld      b,a
0efb c64e      add     a,$4e
0efd 57        ld      d,a
0efe cdbf7d    call    $7dbf
0f01 d1        pop     de
0f02 c1        pop     bc
0f03 c9        ret     

0f04 c5        push    bc
0f05 d5        push    de
0f06 cdb639    call    $39b6
0f09 3aff0f    ld      a,($0fff)
0f0c 4f        ld      c,a
0f0d 3afc0f    ld      a,($0ffc)
0f10 81        add     a,c
0f11 3d        dec     a
0f12 47        ld      b,a
0f13 3e4e      ld      a,$4e
0f15 81        add     a,c
0f16 57        ld      d,a
0f17 cdbf7d    call    $7dbf
0f1a d1        pop     de
0f1b c1        pop     bc
0f1c c9        ret     

0f1d 3afc0f    ld      a,($0ffc)
0f20 fe01      cp      $01
0f22 c42803    call    nz,$0328
0f25 cd540f    call    $0f54
0f28 cd6696    call    $9666
0f2b cd3784    call    $8437
0f2e cd9b03    call    $039b
0f31 c3040f    jp      $0f04
0f34 cd6599    call    $9965
0f37 fd210010  ld      iy,$1000
0f3b c3da8e    jp      $8eda
0f3e cde78e    call    $8ee7
0f41 c30c3a    jp      $3a0c
0f44 32530f    ld      ($0f53),a
0f47 cd6696    call    $9666
0f4a fe0c      cp      $0c
0f4c cc5402    call    z,$0254
0f4f 3a530f    ld      a,($0f53)
0f52 c9        ret     

0f53 00        nop     
0f54 f5        push    af
0f55 c5        push    bc
0f56 cd2694    call    $9426
0f59 fe01      cp      $01
0f5b 281f      jr      z,$0f7c
0f5d cd3784    call    $8437
0f60 b7        or      a
0f61 2816      jr      z,$0f79
0f63 47        ld      b,a
0f64 cdc993    call    $93c9
0f67 cd6696    call    $9666
0f6a cd3784    call    $8437
0f6d b8        cp      b
0f6e 280c      jr      z,$0f7c
0f70 cd7402    call    $0274
0f73 97        sub     a
0f74 cd9b03    call    $039b
0f77 1806      jr      $0f7f
0f79 cdc993    call    $93c9
0f7c cd7402    call    $0274
0f7f c1        pop     bc
0f80 f1        pop     af
0f81 c9        ret     

0f82 cdf342    call    $42f3
0f85 60        ld      h,b
0f86 69        ld      l,c
0f87 cd8b6b    call    $6b8b
0f8a 0b        dec     bc
0f8b b7        or      a
0f8c ed42      sbc     hl,bc
0f8e 7c        ld      a,h
0f8f b7        or      a
0f90 2018      jr      nz,$0faa
0f92 cd3887    call    $8738
0f95 47        ld      b,a
0f96 3e18      ld      a,$18
0f98 90        sub     b
0f99 380f      jr      c,$0faa
0f9b bd        cp      l
0f9c 380c      jr      c,$0faa
0f9e 78        ld      a,b
0f9f 85        add     a,l
0fa0 5f        ld      e,a
0fa1 cd8d87    call    $878d
0fa4 bb        cp      e
0fa5 2803      jr      z,$0faa
0fa7 7b        ld      a,e
0fa8 37        scf     
0fa9 c9        ret     

0faa b7        or      a
0fab c9        ret     

0fac f5        push    af
0fad cdf534    call    $34f5
0fb0 2804      jr      z,$0fb6
0fb2 3e81      ld      a,$81
0fb4 1810      jr      $0fc6
0fb6 cded34    call    $34ed
0fb9 2804      jr      z,$0fbf
0fbb 3e86      ld      a,$86
0fbd 1807      jr      $0fc6
0fbf cd0635    call    $3506
0fc2 2808      jr      z,$0fcc
0fc4 3e87      ld      a,$87
0fc6 cdfc38    call    $38fc
0fc9 cd2a95    call    $952a
0fcc 3afc0f    ld      a,($0ffc)
0fcf fe01      cp      $01
0fd1 2827      jr      z,$0ffa
0fd3 cd3784    call    $8437
0fd6 fe04      cp      $04
0fd8 280c      jr      z,$0fe6
0fda fe05      cp      $05
0fdc 2808      jr      z,$0fe6
0fde fe0c      cp      $0c
0fe0 2804      jr      z,$0fe6
0fe2 fe0d      cp      $0d
0fe4 2004      jr      nz,$0fea
0fe6 3e04      ld      a,$04
0fe8 1801      jr      $0feb
0fea 97        sub     a
0feb cd9b03    call    $039b
0fee cd3887    call    $8738
0ff1 fe19      cp      $19
0ff3 2805      jr      z,$0ffa
0ff5 3e20      ld      a,$20
0ff7 cd4583    call    $8345
0ffa f1        pop     af
0ffb c9        ret     

0ffc 00        nop     
0ffd 00        nop     
0ffe 00        nop     
0fff 00        nop     
1000 00        nop     
1001 00        nop     
1002 00        nop     
1003 00        nop     
1004 00        nop     
1005 cdc233    call    $33c2
1008 cc683f    call    z,$3f68
100b c8        ret     z

100c dd2137ce  ld      ix,$ce37
1010 cdf73e    call    $3ef7
1013 cd743f    call    $3f74
1016 d8        ret     c

1017 2811      jr      z,$102a
1019 cdd233    call    $33d2
101c cd7767    call    $6777
101f cdb221    call    $21b2
1022 cd962c    call    $2c96
1025 cdac2c    call    $2cac
1028 1803      jr      $102d
102a cda68c    call    $8ca6
102d c9        ret     

102e cdc233    call    $33c2
1031 cc683f    call    z,$3f68
1034 c8        ret     z

1035 dd21e11a  ld      ix,$1ae1
1039 fd21448e  ld      iy,$8e44
103d cd6f88    call    $886f
1040 b7        or      a
1041 c8        ret     z

1042 21601c    ld      hl,$1c60
1045 cdc88c    call    $8cc8
1048 b7        or      a
1049 c8        ret     z

104a cd6203    call    $0362
104d cd772e    call    $2e77
1050 b7        or      a
1051 cca68c    call    z,$8ca6
1054 cd5003    call    $0350
1057 c9        ret     

1058 cdc233    call    $33c2
105b cc683f    call    z,$3f68
105e c8        ret     z

105f dd21b01b  ld      ix,$1bb0
1063 fd21448e  ld      iy,$8e44
1067 cd6f88    call    $886f
106a b7        or      a
106b c8        ret     z

106c 21941c    ld      hl,$1c94
106f cdc88c    call    $8cc8
1072 c9        ret     

1073 cdc233    call    $33c2
1076 cc683f    call    z,$3f68
1079 c4197a    call    nz,$7a19
107c c9        ret     

107d cdc233    call    $33c2
1080 2809      jr      z,$108b
1082 dd21c7cc  ld      ix,$ccc7
1086 cd463f    call    $3f46
1089 97        sub     a
108a c9        ret     

108b fd218c8e  ld      iy,$8e8c
108f dd216dc9  ld      ix,$c96d
1093 0e0d      ld      c,$0d
1095 cddc8c    call    $8cdc
1098 b7        or      a
1099 c8        ret     z

109a 37        scf     
109b cdc221    call    $21c2
109e feff      cp      $ff
10a0 c8        ret     z

10a1 fe02      cp      $02
10a3 2010      jr      nz,$10b5
10a5 dd2123cd  ld      ix,$cd23
10a9 cd463f    call    $3f46
10ac cde989    call    $89e9
10af 04        inc     b
10b0 cdd38c    call    $8cd3
10b3 18c8      jr      $107d
10b5 cde497    call    $97e4
10b8 cd9b86    call    $869b
10bb cd5516    call    $1655
10be cdbd34    call    $34bd
10c1 cdca33    call    $33ca
10c4 cd0b7a    call    $7a0b
10c7 cd4933    call    $3349
10ca c9        ret     

10cb dd210c1b  ld      ix,$1b0c
10cf fd21448e  ld      iy,$8e44
10d3 cd6f88    call    $886f
10d6 b7        or      a
10d7 c8        ret     z

10d8 21681c    ld      hl,$1c68
10db cdc88c    call    $8cc8
10de c9        ret     

10df cdc233    call    $33c2
10e2 cc683f    call    z,$3f68
10e5 c8        ret     z

10e6 cd4d34    call    $344d
10e9 2005      jr      nz,$10f0
10eb cdcf60    call    $60cf
10ee 1806      jr      $10f6
10f0 cd5d34    call    $345d
10f3 cd0534    call    $3405
10f6 c9        ret     

10f7 cd4f20    call    $204f
10fa c640      add     a,$40
10fc 322911    ld      ($1129),a
10ff 111611    ld      de,$1116
1102 fd218c8e  ld      iy,$8e8c
1106 0600      ld      b,$00
1108 212d9a    ld      hl,$9a2d
110b cd5a8a    call    $8a5a
110e fe0d      cp      $0d
1110 2803      jr      z,$1115
1112 cdc93e    call    $3ec9
1115 c9        ret     

1116 54        ld      d,h
1117 65        ld      h,l
1118 78        ld      a,b
1119 74        ld      (hl),h
111a 2066      jr      nz,$1182
111c 69        ld      l,c
111d 6c        ld      l,h
111e 65        ld      h,l
111f 73        ld      (hl),e
1120 206f      jr      nz,$1191
1122 6e        ld      l,(hl)
1123 2064      jr      nz,$1189
1125 69        ld      l,c
1126 73        ld      (hl),e
1127 6b        ld      l,e
1128 2000      jr      nz,$112a
112a 3a24cd    ld      a,($cd24)
112d c23328    jp      nz,$2833
1130 08        ex      af,af'
1131 dd21f5cc  ld      ix,$ccf5
1135 cd463f    call    $3f46
1138 c9        ret     

1139 cd2820    call    $2028
113c d8        ret     c

113d cdb01c    call    $1cb0
1140 d44012    call    nc,$1240
1143 cdf710    call    $10f7
1146 c9        ret     

1147 cdc233    call    $33c2
114a cc683f    call    z,$3f68
114d c8        ret     z

114e 217011    ld      hl,$1170
1151 cda88d    call    $8da8
1154 dd21ac64  ld      ix,$64ac
1158 21b2d1    ld      hl,$d1b2
115b cd3988    call    $8839
115e b7        or      a
115f c8        ret     z

1160 3a3c74    ld      a,($743c)
1163 3d        dec     a
1164 21f764    ld      hl,$64f7
1167 5f        ld      e,a
1168 1600      ld      d,$00
116a 19        add     hl,de
116b 7e        ld      a,(hl)
116c cdd763    call    $63d7
116f c9        ret     

1170 66        ld      h,(hl)
1171 72        ld      (hl),d
1172 6f        ld      l,a
1173 6d        ld      l,l
1174 2074      jr      nz,$11ea
1176 65        ld      h,l
1177 6d        ld      l,l
1178 70        ld      (hl),b
1179 2066      jr      nz,$11e1
117b 69        ld      l,c
117c 6c        ld      l,h
117d 65        ld      h,l
117e 2024      jr      nz,$11a4
1180 cdc233    call    $33c2
1183 2809      jr      z,$118e
1185 dd21c7cc  ld      ix,$ccc7
1189 cd463f    call    $3f46
118c 97        sub     a
118d c9        ret     

118e dd212d9a  ld      ix,$9a2d
1192 21e2c4    ld      hl,$c4e2
1195 cd3988    call    $8839
1198 b7        or      a
1199 c8        ret     z

119a cde611    call    $11e6
119d feff      cp      $ff
119f c8        ret     z

11a0 fe02      cp      $02
11a2 200f      jr      nz,$11b3
11a4 dd219ecc  ld      ix,$cc9e
11a8 cd463f    call    $3f46
11ab cde989    call    $89e9
11ae cdd38c    call    $8cd3
11b1 18db      jr      $118e
11b3 cdf911    call    $11f9
11b6 fe01      cp      $01
11b8 281f      jr      z,$11d9
11ba f5        push    af
11bb cddd3b    call    $3bdd
11be cd6599    call    $9965
11c1 cd663b    call    $3b66
11c4 f1        pop     af
11c5 b7        or      a
11c6 2007      jr      nz,$11cf
11c8 cda37a    call    $7aa3
11cb 3807      jr      c,$11d4
11cd 180a      jr      $11d9
11cf cd7b7a    call    $7a7b
11d2 3005      jr      nc,$11d9
11d4 cd1910    call    $1019
11d7 180c      jr      $11e5
11d9 cd663b    call    $3b66
11dc cd9b86    call    $869b
11df cd0b7a    call    $7a0b
11e2 cd4933    call    $3349
11e5 c9        ret     

11e6 b7        or      a
11e7 cdc221    call    $21c2
11ea feff      cp      $ff
11ec 280a      jr      z,$11f8
11ee fe02      cp      $02
11f0 2806      jr      z,$11f8
11f2 cde497    call    $97e4
11f5 cd0f98    call    $980f
11f8 c9        ret     

11f9 cd9b86    call    $869b
11fc cd5516    call    $1655
11ff cdbd34    call    $34bd
1202 cdca33    call    $33ca
1205 cdb043    call    $43b0
1208 c9        ret     

1209 cdc233    call    $33c2
120c 200c      jr      nz,$121a
120e dd2188ce  ld      ix,$ce88
1212 cdf73e    call    $3ef7
1215 cd6202    call    $0262
1218 1826      jr      $1240
121a cd1b04    call    $041b
121d dd214ecd  ld      ix,$cd4e
1221 cdf73e    call    $3ef7
1224 cd743f    call    $3f74
1227 d8        ret     c

1228 280e      jr      z,$1238
122a cd6d44    call    $446d
122d cd7d99    call    $997d
1230 cde423    call    $23e4
1233 117412    ld      de,$1274
1236 1803      jr      $123b
1238 118412    ld      de,$1284
123b 0e09      ld      c,$09
123d cd0500    call    $0005
1240 cd528a    call    $8a52
1243 cd962c    call    $2c96
1246 cdac2c    call    $2cac
1249 cd3164    call    $6431
124c cd0e35    call    $350e
124f 2805      jr      z,$1256
1251 cd7b93    call    $937b
1254 180b      jr      $1261
1256 11000d    ld      de,$0d00
1259 cd9504    call    $0495
125c 0ea2      ld      c,$a2
125e cd0500    call    $0005
1261 111893    ld      de,$9318
1264 0e09      ld      c,$09
1266 cd0500    call    $0005
1269 119812    ld      de,$1298
126c 0e09      ld      c,$09
126e cd0500    call    $0005
1271 c30000    jp      $0000
1274 0d        dec     c
1275 0a        ld      a,(bc)
1276 54        ld      d,h
1277 65        ld      h,l
1278 78        ld      a,b
1279 74        ld      (hl),h
127a 2073      jr      nz,$12ef
127c 61        ld      h,c
127d 76        halt    
127e 65        ld      h,l
127f 64        ld      h,h
1280 2e2e      ld      l,$2e
1282 2e24      ld      l,$24
1284 0d        dec     c
1285 0a        ld      a,(bc)
1286 54        ld      d,h
1287 65        ld      h,l
1288 78        ld      a,b
1289 74        ld      (hl),h
128a 206e      jr      nz,$12fa
128c 6f        ld      l,a
128d 74        ld      (hl),h
128e 2073      jr      nz,$1303
1290 61        ld      h,c
1291 76        halt    
1292 65        ld      h,l
1293 64        ld      h,h
1294 2e2e      ld      l,$2e
1296 2e24      ld      l,$24
1298 47        ld      b,a
1299 6f        ld      l,a
129a 6f        ld      l,a
129b 64        ld      h,h
129c 62        ld      h,d
129d 79        ld      a,c
129e 65        ld      h,l
129f 0d        dec     c
12a0 0a        ld      a,(bc)
12a1 24        inc     h
12a2 cdc233    call    $33c2
12a5 cc683f    call    z,$3f68
12a8 c8        ret     z

12a9 cd005c    call    $5c00
12ac b7        or      a
12ad c8        ret     z

12ae cd6203    call    $0362
12b1 cd7f8d    call    $8d7f
12b4 cd5c58    call    $585c
12b7 301b      jr      nc,$12d4
12b9 cd6534    call    $3465
12bc 200e      jr      nz,$12cc
12be cd685f    call    $5f68
12c1 cd0c3a    call    $3a0c
12c4 cd835f    call    $5f83
12c7 cdae86    call    $86ae
12ca 1811      jr      $12dd
12cc cd0c3a    call    $3a0c
12cf cdae86    call    $86ae
12d2 1809      jr      $12dd
12d4 cd0c3a    call    $3a0c
12d7 cd928d    call    $8d92
12da cde25e    call    $5ee2
12dd cd5003    call    $0350
12e0 c9        ret     

12e1 cdc233    call    $33c2
12e4 cc683f    call    z,$3f68
12e7 c8        ret     z

12e8 210213    ld      hl,$1302
12eb cda88d    call    $8da8
12ee dd218d1a  ld      ix,$1a8d
12f2 fd21448e  ld      iy,$8e44
12f6 cd6f88    call    $886f
12f9 b7        or      a
12fa c8        ret     z

12fb 21501c    ld      hl,$1c50
12fe cdc88c    call    $8cc8
1301 c9        ret     

1302 74        ld      (hl),h
1303 6f        ld      l,a
1304 2024      jr      nz,$132a
1306 cd6203    call    $0362
1309 2159d6    ld      hl,$d659
130c cd3f65    call    $653f
130f cd5003    call    $0350
1312 c9        ret     

1313 cdc233    call    $33c2
1316 cc683f    call    z,$3f68
1319 c8        ret     z

131a fd218c8e  ld      iy,$8e8c
131e cd2c24    call    $242c
1321 cd3c28    call    $283c
1324 fe02      cp      $02
1326 2805      jr      z,$132d
1328 cd6f7b    call    $7b6f
132b 1807      jr      $1334
132d dd2180cc  ld      ix,$cc80
1331 cd463f    call    $3f46
1334 c9        ret     

1335 cdc233    call    $33c2
1338 cc683f    call    z,$3f68
133b c8        ret     z

133c cd4d34    call    $344d
133f cccf60    call    z,$60cf
1342 c8        ret     z

1343 dd21c41b  ld      ix,$1bc4
1347 fd21448e  ld      iy,$8e44
134b cd6f88    call    $886f
134e b7        or      a
134f c8        ret     z

1350 21a01c    ld      hl,$1ca0
1353 cdc88c    call    $8cc8
1356 c9        ret     

1357 cd6d13    call    $136d
135a c8        ret     z

135b cd6833    call    $3368
135e cdae86    call    $86ae
1361 c9        ret     

1362 cd6d13    call    $136d
1365 c8        ret     z

1366 cd9533    call    $3395
1369 cdae86    call    $86ae
136c c9        ret     

136d cdc233    call    $33c2
1370 cc683f    call    z,$3f68
1373 c8        ret     z

1374 dd21e11a  ld      ix,$1ae1
1378 fd21448e  ld      iy,$8e44
137c cd6f88    call    $886f
137f b7        or      a
1380 c8        ret     z

1381 21981c    ld      hl,$1c98
1384 cdc88c    call    $8cc8
1387 b7        or      a
1388 c8        ret     z

1389 3e01      ld      a,$01
138b b7        or      a
138c c9        ret     

138d cdc233    call    $33c2
1390 cc683f    call    z,$3f68
1393 c8        ret     z

1394 dd21b01b  ld      ix,$1bb0
1398 fd21448e  ld      iy,$8e44
139c cd6f88    call    $886f
139f b7        or      a
13a0 c8        ret     z

13a1 217a1c    ld      hl,$1c7a
13a4 cdc88c    call    $8cc8
13a7 c9        ret     

13a8 cdc233    call    $33c2
13ab cc683f    call    z,$3f68
13ae c8        ret     z

13af 21c913    ld      hl,$13c9
13b2 cda88d    call    $8da8
13b5 dd21ea1b  ld      ix,$1bea
13b9 fd21448e  ld      iy,$8e44
13bd cd6f88    call    $886f
13c0 b7        or      a
13c1 c8        ret     z

13c2 21ac1c    ld      hl,$1cac
13c5 cdc88c    call    $8cc8
13c8 c9        ret     

13c9 61        ld      h,c
13ca 6e        ld      l,(hl)
13cb 64        ld      h,h
13cc 2024      jr      nz,$13f2
13ce dd21741b  ld      ix,$1b74
13d2 fd21448e  ld      iy,$8e44
13d6 cd6f88    call    $886f
13d9 b7        or      a
13da c8        ret     z

13db 217e1c    ld      hl,$1c7e
13de cdc88c    call    $8cc8
13e1 c9        ret     

13e2 cdc233    call    $33c2
13e5 cc683f    call    z,$3f68
13e8 c8        ret     z

13e9 dd212d9a  ld      ix,$9a2d
13ed 21e2c4    ld      hl,$c4e2
13f0 cd3988    call    $8839
13f3 b7        or      a
13f4 c8        ret     z

13f5 cdfc26    call    $26fc
13f8 fe02      cp      $02
13fa 200f      jr      nz,$140b
13fc dd219ecc  ld      ix,$cc9e
1400 cd463f    call    $3f46
1403 cde989    call    $89e9
1406 cdd38c    call    $8cd3
1409 18de      jr      $13e9
140b 3e01      ld      a,$01
140d cd1f27    call    $271f
1410 cdae86    call    $86ae
1413 c9        ret     

1414 cdf428    call    $28f4
1417 c4f710    call    nz,$10f7
141a c9        ret     

141b cdc233    call    $33c2
141e cc683f    call    z,$3f68
1421 c4966f    call    nz,$6f96
1424 c9        ret     

1425 cdc233    call    $33c2
1428 cc683f    call    z,$3f68
142b c8        ret     z

142c dd2119cc  ld      ix,$cc19
1430 cdf73e    call    $3ef7
1433 cd7f8d    call    $8d7f
1436 fd219114  ld      iy,$1491
143a cd6599    call    $9965
143d cdda8e    call    $8eda
1440 cd6d44    call    $446d
1443 fd21448e  ld      iy,$8e44
1447 cd2c24    call    $242c
144a cd7d99    call    $997d
144d cde423    call    $23e4
1450 cdd233    call    $33d2
1453 cd7767    call    $6777
1456 dd212d9a  ld      ix,$9a2d
145a cdb01c    call    $1cb0
145d dd2134cc  ld      ix,$cc34
1461 cdf73e    call    $3ef7
1464 cd743f    call    $3f74
1467 d8        ret     c

1468 c8        ret     z

1469 fd21448e  ld      iy,$8e44
146d cde611    call    $11e6
1470 feff      cp      $ff
1472 c8        ret     z

1473 fe02      cp      $02
1475 2812      jr      z,$1489
1477 cdf911    call    $11f9
147a fd219114  ld      iy,$1491
147e cde78e    call    $8ee7
1481 cd0c3a    call    $3a0c
1484 cd928d    call    $8d92
1487 1807      jr      $1490
1489 dd2163cc  ld      ix,$cc63
148d cd463f    call    $3f46
1490 c9        ret     

1491 00        nop     
1492 00        nop     
1493 00        nop     
1494 00        nop     
1495 cdc233    call    $33c2
1498 cc683f    call    z,$3f68
149b c8        ret     z

149c dd21621a  ld      ix,$1a62
14a0 fd21448e  ld      iy,$8e44
14a4 cd6f88    call    $886f
14a7 b7        or      a
14a8 c8        ret     z

14a9 21461c    ld      hl,$1c46
14ac cdc88c    call    $8cc8
14af c9        ret     

14b0 dd21541a  ld      ix,$1a54
14b4 fd21448e  ld      iy,$8e44
14b8 cd6f88    call    $886f
14bb b7        or      a
14bc c8        ret     z

14bd 21421c    ld      hl,$1c42
14c0 cdc88c    call    $8cc8
14c3 c9        ret     

14c4 dd218d1b  ld      ix,$1b8d
14c8 fd21448e  ld      iy,$8e44
14cc cd6f88    call    $886f
14cf b7        or      a
14d0 c8        ret     z

14d1 21841c    ld      hl,$1c84
14d4 cdc88c    call    $8cc8
14d7 c9        ret     

14d8 dd21741a  ld      ix,$1a74
14dc fd21448e  ld      iy,$8e44
14e0 cd6f88    call    $886f
14e3 b7        or      a
14e4 c8        ret     z

14e5 214a1c    ld      hl,$1c4a
14e8 cdc88c    call    $8cc8
14eb c9        ret     

14ec cdc233    call    $33c2
14ef cc683f    call    z,$3f68
14f2 c8        ret     z

14f3 dd21da1b  ld      ix,$1bda
14f7 fd21448e  ld      iy,$8e44
14fb cd6f88    call    $886f
14fe b7        or      a
14ff c8        ret     z

1500 21a81c    ld      hl,$1ca8
1503 cdc88c    call    $8cc8
1506 c9        ret     

1507 cdc233    call    $33c2
150a cc683f    call    z,$3f68
150d c8        ret     z

150e dd21da1b  ld      ix,$1bda
1512 fd21448e  ld      iy,$8e44
1516 cd6f88    call    $886f
1519 b7        or      a
151a c8        ret     z

151b 21a41c    ld      hl,$1ca4
151e cdc88c    call    $8cc8
1521 c9        ret     

1522 dd21a01b  ld      ix,$1ba0
1526 fd21448e  ld      iy,$8e44
152a cd6f88    call    $886f
152d b7        or      a
152e c8        ret     z

152f 218c1c    ld      hl,$1c8c
1532 cdc88c    call    $8cc8
1535 c9        ret     

1536 cdc233    call    $33c2
1539 cc683f    call    z,$3f68
153c c8        ret     z

153d dd21b01b  ld      ix,$1bb0
1541 fd21448e  ld      iy,$8e44
1545 cd6f88    call    $886f
1548 b7        or      a
1549 c8        ret     z

154a 21901c    ld      hl,$1c90
154d cdc88c    call    $8cc8
1550 c9        ret     

1551 cdc233    call    $33c2
1554 cc683f    call    z,$3f68
1557 c8        ret     z

1558 cd4d34    call    $344d
155b cccf60    call    z,$60cf
155e c8        ret     z

155f 21a115    ld      hl,$15a1
1562 cda88d    call    $8da8
1565 fd218c8e  ld      iy,$8e8c
1569 dd216dc9  ld      ix,$c96d
156d 0e0d      ld      c,$0d
156f cddc8c    call    $8cdc
1572 b7        or      a
1573 c8        ret     z

1574 cd9d2b    call    $2b9d
1577 2009      jr      nz,$1582
1579 dd2123cd  ld      ix,$cd23
157d cd463f    call    $3f46
1580 181e      jr      $15a0
1582 113f4b    ld      de,$4b3f
1585 010001    ld      bc,$0100
1588 cdb315    call    $15b3
158b cdf661    call    $61f6
158e cdb01c    call    $1cb0
1591 d44012    call    nc,$1240
1594 cdd25f    call    $5fd2
1597 cd0c3a    call    $3a0c
159a cdf710    call    $10f7
159d cdae86    call    $86ae
15a0 c9        ret     

15a1 73        ld      (hl),e
15a2 65        ld      h,l
15a3 6c        ld      l,h
15a4 65        ld      h,l
15a5 63        ld      h,e
15a6 74        ld      (hl),h
15a7 65        ld      h,l
15a8 64        ld      h,h
15a9 2074      jr      nz,$161f
15ab 65        ld      h,l
15ac 78        ld      a,b
15ad 74        ld      (hl),h
15ae 2074      jr      nz,$1624
15b0 6f        ld      l,a
15b1 2024      jr      nz,$15d7
15b3 78        ld      a,b
15b4 b1        or      c
15b5 2808      jr      z,$15bf
15b7 1a        ld      a,(de)
15b8 cdd62b    call    $2bd6
15bb 13        inc     de
15bc 0b        dec     bc
15bd 18f4      jr      $15b3
15bf c9        ret     

15c0 c37944    jp      $4479
15c3 c3b544    jp      $44b5
15c6 cdd545    call    $45d5
15c9 c3c93e    jp      $3ec9
15cc 21ac64    ld      hl,$64ac
15cf 11f764    ld      de,$64f7
15d2 ed53d58e  ld      ($8ed5),de
15d6 111f65    ld      de,$651f
15d9 ed53d78e  ld      ($8ed7),de
15dd 3e01      ld      a,$01
15df 32d98e    ld      ($8ed9),a
15e2 11b6cd    ld      de,$cdb6
15e5 0600      ld      b,$00
15e7 cd5a8a    call    $8a5a
15ea c3c93e    jp      $3ec9
15ed cd5c16    call    $165c
15f0 cd663b    call    $3b66
15f3 cd9b86    call    $869b
15f6 c30534    jp      $3405
15f9 cd5c16    call    $165c
15fc cdce3b    call    $3bce
15ff c3ae86    jp      $86ae
1602 cd5c16    call    $165c
1605 cdc63a    call    $3ac6
1608 c3ae86    jp      $86ae
160b 3e05      ld      a,$05
160d dd2168cf  ld      ix,$cf68
1611 cdae80    call    $80ae
1614 d8        ret     c

1615 3e20      ld      a,$20
1617 cd4583    call    $8345
161a 44        ld      b,h
161b 4d        ld      c,l
161c 78        ld      a,b
161d b1        or      c
161e cc866b    call    z,$6b86
1621 cd5c16    call    $165c
1624 cd7a3a    call    $3a7a
1627 cd4933    call    $3349
162a c3ae86    jp      $86ae
162d cd866b    call    $6b86
1630 03        inc     bc
1631 18ee      jr      $1621
1633 cd866b    call    $6b86
1636 0b        dec     bc
1637 18e8      jr      $1621
1639 cd4d34    call    $344d
163c cccf60    call    z,$60cf
163f c8        ret     z

1640 cdd25f    call    $5fd2
1643 cd5c16    call    $165c
1646 cd0c3a    call    $3a0c
1649 c3ae86    jp      $86ae
164c fd216b16  ld      iy,$166b
1650 cde78e    call    $8ee7
1653 18ee      jr      $1643
1655 fd216b16  ld      iy,$166b
1659 c3678f    jp      $8f67
165c d5        push    de
165d e5        push    hl
165e cd6599    call    $9965
1661 fd216b16  ld      iy,$166b
1665 cdda8e    call    $8eda
1668 e1        pop     hl
1669 d1        pop     de
166a c9        ret     

166b 00        nop     
166c 00        nop     
166d 00        nop     
166e 00        nop     
166f cdce3b    call    $3bce
1672 cd6599    call    $9965
1675 cd663b    call    $3b66
1678 3e01      ld      a,$01
167a c9        ret     

167b cd6599    call    $9965
167e fd219816  ld      iy,$1698
1682 cdda8e    call    $8eda
1685 cdce3b    call    $3bce
1688 cd6599    call    $9965
168b d5        push    de
168c e5        push    hl
168d cde78e    call    $8ee7
1690 cd0c3a    call    $3a0c
1693 e1        pop     hl
1694 d1        pop     de
1695 3e01      ld      a,$01
1697 c9        ret     

1698 00        nop     
1699 00        nop     
169a 00        nop     
169b 00        nop     
169c cd4d34    call    $344d
169f 280d      jr      z,$16ae
16a1 cdd25f    call    $5fd2
16a4 cd0c3a    call    $3a0c
16a7 cdde5f    call    $5fde
16aa 3e01      ld      a,$01
16ac 1804      jr      $16b2
16ae cdcf60    call    $60cf
16b1 97        sub     a
16b2 c9        ret     

16b3 cdc233    call    $33c2
16b6 cc683f    call    z,$3f68
16b9 c8        ret     z

16ba cd4d34    call    $344d
16bd cccf60    call    z,$60cf
16c0 c8        ret     z

16c1 cdd25f    call    $5fd2
16c4 cd0c3a    call    $3a0c
16c7 cdc536    call    $36c5
16ca cdde5f    call    $5fde
16cd cd0c3a    call    $3a0c
16d0 cdc536    call    $36c5
16d3 cdd760    call    $60d7
16d6 c3ae86    jp      $86ae
16d9 cdff29    call    $29ff
16dc b7        or      a
16dd c8        ret     z

16de c3f710    jp      $10f7
16e1 cdc233    call    $33c2
16e4 cc683f    call    z,$3f68
16e7 c8        ret     z

16e8 cd6696    call    $9666
16eb 3e86      ld      a,$86
16ed cd0a37    call    $370a
16f0 3007      jr      nc,$16f9
16f2 dd21c9cd  ld      ix,$cdc9
16f6 cd463f    call    $3f46
16f9 c30534    jp      $3405
16fc cdc233    call    $33c2
16ff cc683f    call    z,$3f68
1702 c8        ret     z

1703 cd6696    call    $9666
1706 3e81      ld      a,$81
1708 cd0a37    call    $370a
170b 3007      jr      nc,$1714
170d dd21dbcd  ld      ix,$cddb
1711 cd463f    call    $3f46
1714 c30534    jp      $3405
1717 cdc233    call    $33c2
171a cc683f    call    z,$3f68
171d c8        ret     z

171e cd6696    call    $9666
1721 3e87      ld      a,$87
1723 cd0a37    call    $370a
1726 3007      jr      nc,$172f
1728 dd21eecd  ld      ix,$cdee
172c cd463f    call    $3f46
172f c30534    jp      $3405
1732 cdc233    call    $33c2
1735 cc683f    call    z,$3f68
1738 c8        ret     z

1739 cd6696    call    $9666
173c 3e82      ld      a,$82
173e cd0a37    call    $370a
1741 3007      jr      nc,$174a
1743 dd21fecd  ld      ix,$cdfe
1747 cd463f    call    $3f46
174a c30534    jp      $3405
174d cdc233    call    $33c2
1750 cc683f    call    z,$3f68
1753 c8        ret     z

1754 cd6696    call    $9666
1757 3e83      ld      a,$83
1759 cd0a37    call    $370a
175c 3007      jr      nc,$1765
175e dd2114ce  ld      ix,$ce14
1762 cd463f    call    $3f46
1765 c30534    jp      $3405
1768 cdc233    call    $33c2
176b cc683f    call    z,$3f68
176e c8        ret     z

176f cdb217    call    $17b2
1772 d8        ret     c

1773 c8        ret     z

1774 fd218d17  ld      iy,$178d
1778 cd678f    call    $8f67
177b cd6599    call    $9965
177e cdc536    call    $36c5
1781 cd663b    call    $3b66
1784 cd8338    call    $3883
1787 cd9b86    call    $869b
178a c30534    jp      $3405
178d 00        nop     
178e 00        nop     
178f 00        nop     
1790 00        nop     
1791 cdc233    call    $33c2
1794 cc683f    call    z,$3f68
1797 c8        ret     z

1798 cdb217    call    $17b2
179b d8        ret     c

179c c8        ret     z

179d cdc536    call    $36c5
17a0 010100    ld      bc,$0001
17a3 cd5f97    call    $975f
17a6 cdd599    call    $99d5
17a9 010100    ld      bc,$0001
17ac cd5f97    call    $975f
17af c30534    jp      $3405
17b2 dd2128ce  ld      ix,$ce28
17b6 cdf73e    call    $3ef7
17b9 cd743f    call    $3f74
17bc f5        push    af
17bd cca68c    call    z,$8ca6
17c0 f1        pop     af
17c1 c9        ret     

17c2 dd212d9a  ld      ix,$9a2d
17c6 21e2c4    ld      hl,$c4e2
17c9 cd3988    call    $8839
17cc 210000    ld      hl,$0000
17cf b7        or      a
17d0 c4c02c    call    nz,$2cc0
17d3 c9        ret     

17d4 dd21ac64  ld      ix,$64ac
17d8 21b2d1    ld      hl,$d1b2
17db cd3988    call    $8839
17de b7        or      a
17df c4f863    call    nz,$63f8
17e2 c9        ret     

17e3 dd212d9a  ld      ix,$9a2d
17e7 21e2c4    ld      hl,$c4e2
17ea cd3988    call    $8839
17ed b7        or      a
17ee c8        ret     z

17ef cdfc26    call    $26fc
17f2 fe02      cp      $02
17f4 2803      jr      z,$17f9
17f6 c3b84d    jp      $4db8
17f9 dd219ecc  ld      ix,$cc9e
17fd cd463f    call    $3f46
1800 cde989    call    $89e9
1803 cdd38c    call    $8cd3
1806 18db      jr      $17e3
1808 cdc233    call    $33c2
180b cc683f    call    z,$3f68
180e c8        ret     z

180f cd340f    call    $0f34
1812 cdb70e    call    $0eb7
1815 fde5      push    iy
1817 fd218c8e  ld      iy,$8e8c
181b cd2c24    call    $242c
181e cd9456    call    $5694
1821 3809      jr      c,$182c
1823 cd2d55    call    $552d
1826 dca68c    call    c,$8ca6
1829 cdef56    call    $56ef
182c fde1      pop     iy
182e cd3e0f    call    $0f3e
1831 c3d70e    jp      $0ed7
1834 c34154    jp      $5441
1837 cd8a42    call    $428a
183a c3b642    jp      $42b6
183d cd7042    call    $4270
1840 c3ab42    jp      $42ab
1843 cd7042    call    $4270
1846 c3b642    jp      $42b6
1849 cd8a42    call    $428a
184c c3ab42    jp      $42ab
184f cdf534    call    $34f5
1852 2804      jr      z,$1858
1854 cdfc16    call    $16fc
1857 c9        ret     

1858 3e81      ld      a,$81
185a c39135    jp      $3591
185d cdf534    call    $34f5
1860 2804      jr      z,$1866
1862 cdfc16    call    $16fc
1865 c9        ret     

1866 3e81      ld      a,$81
1868 c3e835    jp      $35e8
186b cded34    call    $34ed
186e 2804      jr      z,$1874
1870 cde116    call    $16e1
1873 c9        ret     

1874 3e86      ld      a,$86
1876 c39135    jp      $3591
1879 cded34    call    $34ed
187c 2804      jr      z,$1882
187e cde116    call    $16e1
1881 c9        ret     

1882 3e86      ld      a,$86
1884 c3e835    jp      $35e8
1887 cd0635    call    $3506
188a 2804      jr      z,$1890
188c cd1717    call    $1717
188f c9        ret     

1890 3e87      ld      a,$87
1892 c3e835    jp      $35e8
1895 cd0635    call    $3506
1898 2804      jr      z,$189e
189a cd1717    call    $1717
189d c9        ret     

189e 3e87      ld      a,$87
18a0 c39135    jp      $3591
18a3 21b518    ld      hl,$18b5
18a6 cda88d    call    $8da8
18a9 c36662    jp      $6266
18ac 21b518    ld      hl,$18b5
18af cda88d    call    $8da8
18b2 c37a61    jp      $617a
18b5 69        ld      l,c
18b6 6e        ld      l,(hl)
18b7 74        ld      (hl),h
18b8 6f        ld      l,a
18b9 2074      jr      nz,$192f
18bb 65        ld      h,l
18bc 6d        ld      l,l
18bd 70        ld      (hl),b
18be 2066      jr      nz,$1926
18c0 69        ld      l,c
18c1 6c        ld      l,h
18c2 65        ld      h,l
18c3 2024      jr      nz,$18e9
18c5 cdd318    call    $18d3
18c8 d43636    call    nc,$3636
18cb c9        ret     

18cc cdd318    call    $18d3
18cf d4e835    call    nc,$35e8
18d2 c9        ret     

18d3 cd6696    call    $9666
18d6 cd4e35    call    $354e
18d9 2805      jr      z,$18e0
18db cd3217    call    $1732
18de 37        scf     
18df c9        ret     

18e0 cd3635    call    $3536
18e3 c44d17    call    nz,$174d
18e6 b7        or      a
18e7 3e82      ld      a,$82
18e9 c9        ret     

18ea cdf818    call    $18f8
18ed d43636    call    nc,$3636
18f0 c9        ret     

18f1 cdf818    call    $18f8
18f4 d4e835    call    nc,$35e8
18f7 c9        ret     

18f8 cd6696    call    $9666
18fb cd3635    call    $3536
18fe 2805      jr      z,$1905
1900 cd4d17    call    $174d
1903 37        scf     
1904 c9        ret     

1905 cd4e35    call    $354e
1908 c43217    call    nz,$1732
190b b7        or      a
190c 3e83      ld      a,$83
190e c9        ret     

190f 3e01      ld      a,$01
1911 326542    ld      ($4265),a
1914 1804      jr      $191a
1916 97        sub     a
1917 326542    ld      ($4265),a
191a dd212d9a  ld      ix,$9a2d
191e 21e2c4    ld      hl,$c4e2
1921 cd3988    call    $8839
1924 b7        or      a
1925 c8        ret     z

1926 cd3c28    call    $283c
1929 fe02      cp      $02
192b 280a      jr      z,$1937
192d dd2150cf  ld      ix,$cf50
1931 cdf73e    call    $3ef7
1934 c30940    jp      $4009
1937 dd219ecc  ld      ix,$cc9e
193b cd463f    call    $3f46
193e cde989    call    $89e9
1941 cdd38c    call    $8cd3
1944 18d4      jr      $191a
1946 c3a68c    jp      $8ca6
1949 41        ld      b,c
194a 42        ld      b,d
194b 4f        ld      c,a
194c 52        ld      d,d
194d 54        ld      d,h
194e ff        rst     $38
194f 41        ld      b,c
1950 4c        ld      c,h
1951 49        ld      c,c
1952 47        ld      b,a
1953 4e        ld      c,(hl)
1954 ff        rst     $38
1955 42        ld      b,d
1956 4f        ld      c,a
1957 4c        ld      c,h
1958 44        ld      b,h
1959 46        ld      b,(hl)
195a 41        ld      b,c
195b 43        ld      b,e
195c 45        ld      b,l
195d ff        rst     $38
195e 43        ld      b,e
195f 4f        ld      c,a
1960 4e        ld      c,(hl)
1961 56        ld      d,(hl)
1962 45        ld      b,l
1963 52        ld      d,d
1964 54        ld      d,h
1965 2d        dec     l
1966 54        ld      d,h
1967 4f        ld      c,a
1968 2d        dec     l
1969 53        ld      d,e
196a 43        ld      b,e
196b 52        ld      d,d
196c 45        ld      b,l
196d 45        ld      b,l
196e 4e        ld      c,(hl)
196f ff        rst     $38
1970 43        ld      b,e
1971 52        ld      d,d
1972 45        ld      b,l
1973 41        ld      b,c
1974 54        ld      d,h
1975 45        ld      b,l
1976 ff        rst     $38
1977 44        ld      b,h
1978 45        ld      b,l
1979 4c        ld      c,h
197a 45        ld      b,l
197b 54        ld      d,h
197c 45        ld      b,l
197d ff        rst     $38
197e 44        ld      b,h
197f 45        ld      b,l
1980 53        ld      d,e
1981 45        ld      b,l
1982 4c        ld      c,h
1983 45        ld      b,l
1984 43        ld      b,e
1985 54        ld      d,h
1986 ff        rst     $38
1987 44        ld      b,h
1988 49        ld      c,c
1989 52        ld      d,d
198a 45        ld      b,l
198b 43        ld      b,e
198c 54        ld      d,h
198d 4f        ld      c,a
198e 52        ld      d,d
198f 59        ld      e,c
1990 ff        rst     $38
1991 44        ld      b,h
1992 49        ld      c,c
1993 53        ld      d,e
1994 4b        ld      c,e
1995 ff        rst     $38
1996 44        ld      b,h
1997 55        ld      d,l
1998 4d        ld      c,l
1999 50        ld      d,b
199a ff        rst     $38
199b 45        ld      b,l
199c 44        ld      b,h
199d 49        ld      c,c
199e 54        ld      d,h
199f ff        rst     $38
19a0 45        ld      b,l
19a1 58        ld      e,b
19a2 49        ld      c,c
19a3 54        ld      d,h
19a4 ff        rst     $38
19a5 46        ld      b,(hl)
19a6 49        ld      c,c
19a7 4e        ld      c,(hl)
19a8 44        ld      b,h
19a9 ff        rst     $38
19aa 47        ld      b,a
19ab 4f        ld      c,a
19ac ff        rst     $38
19ad 48        ld      c,b
19ae 45        ld      b,l
19af 4c        ld      c,h
19b0 50        ld      d,b
19b1 ff        rst     $38
19b2 49        ld      c,c
19b3 4e        ld      c,(hl)
19b4 44        ld      b,h
19b5 45        ld      b,l
19b6 58        ld      e,b
19b7 ff        rst     $38
19b8 4a        ld      c,d
19b9 55        ld      d,l
19ba 4d        ld      c,l
19bb 50        ld      d,b
19bc ff        rst     $38
19bd 4c        ld      c,h
19be 49        ld      c,c
19bf 53        ld      d,e
19c0 54        ld      d,h
19c1 ff        rst     $38
19c2 4c        ld      c,h
19c3 4f        ld      c,a
19c4 41        ld      b,c
19c5 44        ld      b,h
19c6 ff        rst     $38
19c7 4c        ld      c,h
19c8 4f        ld      c,a
19c9 43        ld      b,e
19ca 4b        ld      c,e
19cb ff        rst     $38
19cc 4d        ld      c,l
19cd 41        ld      b,c
19ce 52        ld      d,d
19cf 4b        ld      c,e
19d0 2d        dec     l
19d1 46        ld      b,(hl)
19d2 4f        ld      c,a
19d3 52        ld      d,d
19d4 2d        dec     l
19d5 49        ld      c,c
19d6 4e        ld      c,(hl)
19d7 44        ld      b,h
19d8 45        ld      b,l
19d9 58        ld      e,b
19da ff        rst     $38
19db 4d        ld      c,l
19dc 45        ld      b,l
19dd 52        ld      d,d
19de 47        ld      b,a
19df 45        ld      b,l
19e0 ff        rst     $38
19e1 50        ld      d,b
19e2 52        ld      d,d
19e3 49        ld      c,c
19e4 4e        ld      c,(hl)
19e5 54        ld      d,h
19e6 ff        rst     $38
19e7 51        ld      d,c
19e8 55        ld      d,l
19e9 49        ld      c,c
19ea 54        ld      d,h
19eb ff        rst     $38
19ec 52        ld      d,d
19ed 45        ld      b,l
19ee 41        ld      b,c
19ef 44        ld      b,h
19f0 ff        rst     $38
19f1 52        ld      d,d
19f2 45        ld      b,l
19f3 4e        ld      c,(hl)
19f4 41        ld      b,c
19f5 4d        ld      c,l
19f6 45        ld      b,l
19f7 ff        rst     $38
19f8 52        ld      d,d
19f9 45        ld      b,l
19fa 50        ld      d,b
19fb 4c        ld      c,h
19fc 41        ld      b,c
19fd 43        ld      b,e
19fe 45        ld      b,l
19ff ff        rst     $38
1a00 53        ld      d,e
1a01 41        ld      b,c
1a02 56        ld      d,(hl)
1a03 45        ld      b,l
1a04 ff        rst     $38
1a05 53        ld      d,e
1a06 43        ld      b,e
1a07 41        ld      b,c
1a08 4e        ld      c,(hl)
1a09 ff        rst     $38
1a0a 53        ld      d,e
1a0b 45        ld      b,l
1a0c 54        ld      d,h
1a0d ff        rst     $38
1a0e 53        ld      d,e
1a0f 48        ld      c,b
1a10 49        ld      c,c
1a11 46        ld      b,(hl)
1a12 54        ld      d,h
1a13 2d        dec     l
1a14 4d        ld      c,l
1a15 41        ld      b,c
1a16 52        ld      d,d
1a17 47        ld      b,a
1a18 49        ld      c,c
1a19 4e        ld      c,(hl)
1a1a 53        ld      d,e
1a1b ff        rst     $38
1a1c 53        ld      d,e
1a1d 48        ld      c,b
1a1e 4f        ld      c,a
1a1f 57        ld      d,a
1a20 ff        rst     $38
1a21 53        ld      d,e
1a22 55        ld      d,l
1a23 42        ld      b,d
1a24 53        ld      d,e
1a25 43        ld      b,e
1a26 52        ld      d,d
1a27 49        ld      c,c
1a28 50        ld      d,b
1a29 54        ld      d,h
1a2a ff        rst     $38
1a2b 53        ld      d,e
1a2c 55        ld      d,l
1a2d 50        ld      d,b
1a2e 45        ld      b,l
1a2f 52        ld      d,d
1a30 53        ld      d,e
1a31 43        ld      b,e
1a32 52        ld      d,d
1a33 49        ld      c,c
1a34 50        ld      d,b
1a35 54        ld      d,h
1a36 ff        rst     $38
1a37 54        ld      d,h
1a38 59        ld      e,c
1a39 50        ld      d,b
1a3a 45        ld      b,l
1a3b ff        rst     $38
1a3c 55        ld      d,l
1a3d 4e        ld      c,(hl)
1a3e 44        ld      b,h
1a3f 45        ld      b,l
1a40 52        ld      d,d
1a41 4c        ld      c,h
1a42 49        ld      c,c
1a43 4e        ld      c,(hl)
1a44 45        ld      b,l
1a45 ff        rst     $38
1a46 55        ld      d,l
1a47 4e        ld      c,(hl)
1a48 4c        ld      c,h
1a49 4f        ld      c,a
1a4a 43        ld      b,e
1a4b 4b        ld      c,e
1a4c ff        rst     $38
1a4d 57        ld      d,a
1a4e 52        ld      d,d
1a4f 49        ld      c,c
1a50 54        ld      d,h
1a51 45        ld      b,l
1a52 ff        rst     $38
1a53 00        nop     
1a54 46        ld      b,(hl)
1a55 4f        ld      c,a
1a56 52        ld      d,d
1a57 4d        ld      c,l
1a58 41        ld      b,c
1a59 54        ld      d,h
1a5a ff        rst     $38
1a5b 50        ld      d,b
1a5c 52        ld      d,d
1a5d 49        ld      c,c
1a5e 4e        ld      c,(hl)
1a5f 54        ld      d,h
1a60 ff        rst     $38
1a61 00        nop     
1a62 42        ld      b,d
1a63 41        ld      b,c
1a64 43        ld      b,e
1a65 4b        ld      c,e
1a66 57        ld      d,a
1a67 41        ld      b,c
1a68 52        ld      d,d
1a69 44        ld      b,h
1a6a ff        rst     $38
1a6b 46        ld      b,(hl)
1a6c 4f        ld      c,a
1a6d 52        ld      d,d
1a6e 57        ld      d,a
1a6f 41        ld      b,c
1a70 52        ld      d,d
1a71 44        ld      b,h
1a72 ff        rst     $38
1a73 00        nop     
1a74 46        ld      b,(hl)
1a75 49        ld      c,c
1a76 4c        ld      c,h
1a77 45        ld      b,l
1a78 53        ld      d,e
1a79 ff        rst     $38
1a7a 46        ld      b,(hl)
1a7b 4f        ld      c,a
1a7c 52        ld      d,d
1a7d 4d        ld      c,l
1a7e 41        ld      b,c
1a7f 54        ld      d,h
1a80 ff        rst     $38
1a81 54        ld      d,h
1a82 45        ld      b,l
1a83 4d        ld      c,l
1a84 50        ld      d,b
1a85 2d        dec     l
1a86 46        ld      b,(hl)
1a87 49        ld      c,c
1a88 4c        ld      c,h
1a89 45        ld      b,l
1a8a 53        ld      d,e
1a8b ff        rst     $38
1a8c 00        nop     
1a8d 42        ld      b,d
1a8e 45        ld      b,l
1a8f 47        ld      b,a
1a90 49        ld      c,c
1a91 4e        ld      c,(hl)
1a92 4e        ld      c,(hl)
1a93 49        ld      c,c
1a94 4e        ld      c,(hl)
1a95 47        ld      b,a
1a96 ff        rst     $38
1a97 45        ld      b,l
1a98 4e        ld      c,(hl)
1a99 44        ld      b,h
1a9a ff        rst     $38
1a9b 49        ld      c,c
1a9c 4e        ld      c,(hl)
1a9d 44        ld      b,h
1a9e 45        ld      b,l
1a9f 58        ld      e,b
1aa0 2d        dec     l
1aa1 45        ld      b,l
1aa2 4e        ld      c,(hl)
1aa3 54        ld      d,h
1aa4 52        ld      d,d
1aa5 59        ld      e,c
1aa6 ff        rst     $38
1aa7 4c        ld      c,h
1aa8 41        ld      b,c
1aa9 53        ld      d,e
1aaa 54        ld      d,h
1aab 2d        dec     l
1aac 4c        ld      c,h
1aad 4f        ld      c,a
1aae 43        ld      b,e
1aaf 41        ld      b,c
1ab0 54        ld      d,h
1ab1 49        ld      c,c
1ab2 4f        ld      c,a
1ab3 4e        ld      c,(hl)
1ab4 ff        rst     $38
1ab5 4e        ld      c,(hl)
1ab6 45        ld      b,l
1ab7 58        ld      e,b
1ab8 54        ld      d,h
1ab9 2d        dec     l
1aba 50        ld      d,b
1abb 41        ld      b,c
1abc 47        ld      b,a
1abd 45        ld      b,l
1abe ff        rst     $38
1abf 50        ld      d,b
1ac0 41        ld      b,c
1ac1 47        ld      b,a
1ac2 45        ld      b,l
1ac3 ff        rst     $38
1ac4 50        ld      d,b
1ac5 52        ld      d,d
1ac6 45        ld      b,l
1ac7 56        ld      d,(hl)
1ac8 49        ld      c,c
1ac9 4f        ld      c,a
1aca 55        ld      d,l
1acb 53        ld      d,e
1acc 2d        dec     l
1acd 50        ld      d,b
1ace 41        ld      b,c
1acf 47        ld      b,a
1ad0 45        ld      b,l
1ad1 ff        rst     $38
1ad2 53        ld      d,e
1ad3 45        ld      b,l
1ad4 4c        ld      c,h
1ad5 45        ld      b,l
1ad6 43        ld      b,e
1ad7 54        ld      d,h
1ad8 45        ld      b,l
1ad9 44        ld      b,h
1ada 2d        dec     l
1adb 54        ld      d,h
1adc 45        ld      b,l
1add 58        ld      e,b
1ade 54        ld      d,h
1adf ff        rst     $38
1ae0 00        nop     
1ae1 41        ld      b,c
1ae2 4c        ld      c,h
1ae3 4c        ld      c,h
1ae4 ff        rst     $38
1ae5 42        ld      b,d
1ae6 45        ld      b,l
1ae7 47        ld      b,a
1ae8 49        ld      c,c
1ae9 4e        ld      c,(hl)
1aea 2d        dec     l
1aeb 43        ld      b,e
1aec 55        ld      d,l
1aed 52        ld      d,d
1aee 53        ld      d,e
1aef 4f        ld      c,a
1af0 52        ld      d,d
1af1 ff        rst     $38
1af2 43        ld      b,e
1af3 55        ld      d,l
1af4 52        ld      d,d
1af5 53        ld      d,e
1af6 4f        ld      c,a
1af7 52        ld      d,d
1af8 2d        dec     l
1af9 45        ld      b,l
1afa 4e        ld      c,(hl)
1afb 44        ld      b,h
1afc ff        rst     $38
1afd 53        ld      d,e
1afe 45        ld      b,l
1aff 4c        ld      c,h
1b00 45        ld      b,l
1b01 43        ld      b,e
1b02 54        ld      d,h
1b03 45        ld      b,l
1b04 44        ld      b,h
1b05 2d        dec     l
1b06 54        ld      d,h
1b07 45        ld      b,l
1b08 58        ld      e,b
1b09 54        ld      d,h
1b0a ff        rst     $38
1b0b 00        nop     
1b0c 42        ld      b,d
1b0d 45        ld      b,l
1b0e 47        ld      b,a
1b0f 49        ld      c,c
1b10 4e        ld      c,(hl)
1b11 2d        dec     l
1b12 43        ld      b,e
1b13 55        ld      d,l
1b14 52        ld      d,d
1b15 53        ld      d,e
1b16 4f        ld      c,a
1b17 52        ld      d,d
1b18 ff        rst     $38
1b19 42        ld      b,d
1b1a 4f        ld      c,a
1b1b 4c        ld      c,h
1b1c 44        ld      b,h
1b1d 46        ld      b,(hl)
1b1e 41        ld      b,c
1b1f 43        ld      b,e
1b20 49        ld      c,c
1b21 4e        ld      c,(hl)
1b22 47        ld      b,a
1b23 ff        rst     $38
1b24 43        ld      b,e
1b25 55        ld      d,l
1b26 52        ld      d,d
1b27 53        ld      d,e
1b28 4f        ld      c,a
1b29 52        ld      d,d
1b2a 2d        dec     l
1b2b 45        ld      b,l
1b2c 4e        ld      c,(hl)
1b2d 44        ld      b,h
1b2e ff        rst     $38
1b2f 46        ld      b,(hl)
1b30 49        ld      c,c
1b31 4c        ld      c,h
1b32 45        ld      b,l
1b33 ff        rst     $38
1b34 49        ld      c,c
1b35 4e        ld      c,(hl)
1b36 44        ld      b,h
1b37 45        ld      b,l
1b38 58        ld      e,b
1b39 49        ld      c,c
1b3a 4e        ld      c,(hl)
1b3b 47        ld      b,a
1b3c ff        rst     $38
1b3d 53        ld      d,e
1b3e 45        ld      b,l
1b3f 4c        ld      c,h
1b40 45        ld      b,l
1b41 43        ld      b,e
1b42 54        ld      d,h
1b43 45        ld      b,l
1b44 44        ld      b,h
1b45 2d        dec     l
1b46 54        ld      d,h
1b47 45        ld      b,l
1b48 58        ld      e,b
1b49 54        ld      d,h
1b4a ff        rst     $38
1b4b 53        ld      d,e
1b4c 55        ld      d,l
1b4d 42        ld      b,d
1b4e 53        ld      d,e
1b4f 43        ld      b,e
1b50 52        ld      d,d
1b51 49        ld      c,c
1b52 50        ld      d,b
1b53 54        ld      d,h
1b54 49        ld      c,c
1b55 4e        ld      c,(hl)
1b56 47        ld      b,a
1b57 ff        rst     $38
1b58 53        ld      d,e
1b59 55        ld      d,l
1b5a 50        ld      d,b
1b5b 45        ld      b,l
1b5c 52        ld      d,d
1b5d 53        ld      d,e
1b5e 43        ld      b,e
1b5f 52        ld      d,d
1b60 49        ld      c,c
1b61 50        ld      d,b
1b62 54        ld      d,h
1b63 49        ld      c,c
1b64 4e        ld      c,(hl)
1b65 47        ld      b,a
1b66 ff        rst     $38
1b67 55        ld      d,l
1b68 4e        ld      c,(hl)
1b69 44        ld      b,h
1b6a 45        ld      b,l
1b6b 52        ld      d,d
1b6c 4c        ld      c,h
1b6d 49        ld      c,c
1b6e 4e        ld      c,(hl)
1b6f 49        ld      c,c
1b70 4e        ld      c,(hl)
1b71 47        ld      b,a
1b72 ff        rst     $38
1b73 00        nop     
1b74 46        ld      b,(hl)
1b75 49        ld      c,c
1b76 4c        ld      c,h
1b77 45        ld      b,l
1b78 ff        rst     $38
1b79 53        ld      d,e
1b7a 43        ld      b,e
1b7b 52        ld      d,d
1b7c 45        ld      b,l
1b7d 45        ld      b,l
1b7e 4e        ld      c,(hl)
1b7f ff        rst     $38
1b80 54        ld      d,h
1b81 4f        ld      c,a
1b82 50        ld      d,b
1b83 2d        dec     l
1b84 4f        ld      c,a
1b85 46        ld      b,(hl)
1b86 2d        dec     l
1b87 46        ld      b,(hl)
1b88 4f        ld      c,a
1b89 52        ld      d,d
1b8a 4d        ld      c,l
1b8b ff        rst     $38
1b8c 00        nop     
1b8d 49        ld      c,c
1b8e 4e        ld      c,(hl)
1b8f ff        rst     $38
1b90 4c        ld      c,h
1b91 45        ld      b,l
1b92 46        ld      b,(hl)
1b93 54        ld      d,h
1b94 ff        rst     $38
1b95 4f        ld      c,a
1b96 55        ld      d,l
1b97 54        ld      d,h
1b98 ff        rst     $38
1b99 52        ld      d,d
1b9a 49        ld      c,c
1b9b 47        ld      b,a
1b9c 48        ld      c,b
1b9d 54        ld      d,h
1b9e ff        rst     $38
1b9f 00        nop     
1ba0 46        ld      b,(hl)
1ba1 49        ld      c,c
1ba2 4c        ld      c,h
1ba3 45        ld      b,l
1ba4 ff        rst     $38
1ba5 54        ld      d,h
1ba6 45        ld      b,l
1ba7 4d        ld      c,l
1ba8 50        ld      d,b
1ba9 2d        dec     l
1baa 46        ld      b,(hl)
1bab 49        ld      c,c
1bac 4c        ld      c,h
1bad 45        ld      b,l
1bae ff        rst     $38
1baf 00        nop     
1bb0 53        ld      d,e
1bb1 45        ld      b,l
1bb2 4c        ld      c,h
1bb3 45        ld      b,l
1bb4 43        ld      b,e
1bb5 54        ld      d,h
1bb6 45        ld      b,l
1bb7 44        ld      b,h
1bb8 2d        dec     l
1bb9 54        ld      d,h
1bba 45        ld      b,l
1bbb 58        ld      e,b
1bbc 54        ld      d,h
1bbd ff        rst     $38
1bbe 57        ld      d,a
1bbf 4f        ld      c,a
1bc0 52        ld      d,d
1bc1 44        ld      b,h
1bc2 ff        rst     $38
1bc3 00        nop     
1bc4 43        ld      b,e
1bc5 4f        ld      c,a
1bc6 4c        ld      c,h
1bc7 55        ld      d,l
1bc8 4d        ld      c,l
1bc9 4e        ld      c,(hl)
1bca ff        rst     $38
1bcb 53        ld      d,e
1bcc 45        ld      b,l
1bcd 4c        ld      c,h
1bce 45        ld      b,l
1bcf 43        ld      b,e
1bd0 54        ld      d,h
1bd1 45        ld      b,l
1bd2 44        ld      b,h
1bd3 2d        dec     l
1bd4 54        ld      d,h
1bd5 45        ld      b,l
1bd6 58        ld      e,b
1bd7 54        ld      d,h
1bd8 ff        rst     $38
1bd9 00        nop     
1bda 43        ld      b,e
1bdb 48        ld      c,b
1bdc 41        ld      b,c
1bdd 52        ld      d,d
1bde 41        ld      b,c
1bdf 43        ld      b,e
1be0 54        ld      d,h
1be1 45        ld      b,l
1be2 52        ld      d,d
1be3 ff        rst     $38
1be4 57        ld      d,a
1be5 4f        ld      c,a
1be6 52        ld      d,d
1be7 44        ld      b,h
1be8 ff        rst     $38
1be9 00        nop     
1bea 45        ld      b,l
1beb 44        ld      b,h
1bec 49        ld      c,c
1bed 54        ld      d,h
1bee ff        rst     $38
1bef 50        ld      d,b
1bf0 52        ld      d,d
1bf1 49        ld      c,c
1bf2 4e        ld      c,(hl)
1bf3 54        ld      d,h
1bf4 ff        rst     $38
1bf5 00        nop     
1bf6 05        dec     b
1bf7 102e      djnz    $1c27
1bf9 1058      djnz    $1c53
1bfb 1073      djnz    $1c70
1bfd 107d      djnz    $1c7c
1bff 10cb      djnz    $1bcc
1c01 10df      djnz    $1be2
1c03 10f7      djnz    $1bfc
1c05 102c      djnz    $1c33
1c07 114711    ld      de,$1147
1c0a 80        add     a,b
1c0b 110912    ld      de,$1209
1c0e a2        and     d
1c0f 12        ld      (de),a
1c10 e1        pop     hl
1c11 12        ld      (de),a
1c12 0613      ld      b,$13
1c14 13        inc     de
1c15 13        inc     de
1c16 e1        pop     hl
1c17 12        ld      (de),a
1c18 f7        rst     $30
1c19 1035      djnz    $1c50
1c1b 13        inc     de
1c1c 57        ld      d,a
1c1d 13        inc     de
1c1e 8d        adc     a,l
1c1f 13        inc     de
1c20 a8        xor     b
1c21 13        inc     de
1c22 ce13      adc     a,$13
1c24 09        add     hl,bc
1c25 12        ld      (de),a
1c26 e21314    jp      po,$1413
1c29 14        inc     d
1c2a 1b        dec     de
1c2b 14        inc     d
1c2c 25        dec     h
1c2d 14        inc     d
1c2e 95        sub     l
1c2f 14        inc     d
1c30 b0        or      b
1c31 14        inc     d
1c32 c414d8    call    nz,$d814
1c35 14        inc     d
1c36 07        rlca    
1c37 15        dec     d
1c38 ec1422    call    pe,$2214
1c3b 15        dec     d
1c3c 3615      ld      (hl),$15
1c3e 62        ld      h,d
1c3f 13        inc     de
1c40 51        ld      d,c
1c41 15        dec     d
1c42 c0        ret     nz

1c43 15        dec     d
1c44 c3154b    jp      $4b15
1c47 74        ld      (hl),h
1c48 3d        dec     a
1c49 74        ld      (hl),h
1c4a f7        rst     $30
1c4b 10c6      djnz    $1c13
1c4d 15        dec     d
1c4e cc15ed    call    z,$ed15
1c51 15        dec     d
1c52 f9        ld      sp,hl
1c53 15        dec     d
1c54 02        ld      (bc),a
1c55 164c      ld      d,$4c
1c57 162d      ld      d,$2d
1c59 160b      ld      d,$0b
1c5b 1633      ld      d,$33
1c5d 1639      ld      d,$39
1c5f 166f      ld      d,$6f
1c61 1672      ld      d,$72
1c63 167b      ld      d,$7b
1c65 169c      ld      d,$9c
1c67 1668      ld      d,$68
1c69 17        rla     
1c6a e1        pop     hl
1c6b 1691      ld      d,$91
1c6d 17        rla     
1c6e d9        exx     
1c6f 1617      ld      d,$17
1c71 17        rla     
1c72 b3        or      e
1c73 164d      ld      d,$4d
1c75 17        rla     
1c76 3217fc    ld      ($fc17),a
1c79 1695      ld      d,$95
1c7b 1887      jr      $1c04
1c7d 18e3      jr      $1c62
1c7f 17        rla     
1c80 08        ex      af,af'
1c81 1834      jr      $1cb7
1c83 1837      jr      $1cbc
1c85 1843      jr      $1cca
1c87 183d      jr      $1cc6
1c89 1849      jr      $1cd4
1c8b 18c2      jr      $1c4f
1c8d 17        rla     
1c8e d4174f    call    nc,$4f17
1c91 185d      jr      $1cf0
1c93 186b      jr      $1d00
1c95 1879      jr      $1d10
1c97 186f      jr      $1d08
1c99 1672      ld      d,$72
1c9b 167b      ld      d,$7b
1c9d 169c      ld      d,$9c
1c9f 16a3      ld      d,$a3
1ca1 18ac      jr      $1c4f
1ca3 18ea      jr      $1c8f
1ca5 18f1      jr      $1c98
1ca7 18c5      jr      $1c6e
1ca9 18cc      jr      $1c77
1cab 1816      jr      $1cc3
1cad 19        add     hl,de
1cae 0f        rrca    
1caf 19        add     hl,de
1cb0 c5        push    bc
1cb1 d5        push    de
1cb2 e5        push    hl
1cb3 97        sub     a
1cb4 32091e    ld      ($1e09),a
1cb7 cdeb28    call    $28eb
1cba 2a0600    ld      hl,($0006)
1cbd 112d9a    ld      de,$9a2d
1cc0 b7        or      a
1cc1 ed52      sbc     hl,de
1cc3 cb3c      srl     h
1cc5 cb1d      rr      l
1cc7 19        add     hl,de
1cc8 22ef1f    ld      ($1fef),hl
1ccb cdc233    call    $33c2
1cce 281a      jr      z,$1cea
1cd0 cd4d34    call    $344d
1cd3 2808      jr      z,$1cdd
1cd5 cd5d34    call    $345d
1cd8 3e01      ld      a,$01
1cda 32091e    ld      ($1e09),a
1cdd fd21f11f  ld      iy,$1ff1
1ce1 cd6599    call    $9965
1ce4 cdda8e    call    $8eda
1ce7 cd243c    call    $3c24
1cea 212d9a    ld      hl,$9a2d
1ced 36ff      ld      (hl),$ff
1cef 23        inc     hl
1cf0 3600      ld      (hl),$00
1cf2 23        inc     hl
1cf3 36ff      ld      (hl),$ff
1cf5 23        inc     hl
1cf6 22f51f    ld      ($1ff5),hl
1cf9 e5        push    hl
1cfa 11f71f    ld      de,$1ff7
1cfd 0e11      ld      c,$11
1cff cd0500    call    $0005
1d02 c1        pop     bc
1d03 feff      cp      $ff
1d05 286d      jr      z,$1d74
1d07 7e        ld      a,(hl)
1d08 fee5      cp      $e5
1d0a 285b      jr      z,$1d67
1d0c 110420    ld      de,$2004
1d0f cd361e    call    $1e36
1d12 3053      jr      nc,$1d67
1d14 54        ld      d,h
1d15 5d        ld      e,l
1d16 cdc233    call    $33c2
1d19 2820      jr      z,$1d3b
1d1b 60        ld      h,b
1d1c 69        ld      l,c
1d1d 3e0f      ld      a,$0f
1d1f cd8d90    call    $908d
1d22 dd21299a  ld      ix,$9a29
1d26 7c        ld      a,h
1d27 ddbe01    cp      (ix+$01)
1d2a 2004      jr      nz,$1d30
1d2c 7d        ld      a,l
1d2d ddbe00    cp      (ix+$00)
1d30 3809      jr      c,$1d3b
1d32 cd0a1e    call    $1e0a
1d35 3004      jr      nc,$1d3b
1d37 b7        or      a
1d38 c3ed1d    jp      $1ded
1d3b c5        push    bc
1d3c fde1      pop     iy
1d3e cda63f    call    $3fa6
1d41 fde5      push    iy
1d43 e1        pop     hl
1d44 cd8d90    call    $908d
1d47 36ff      ld      (hl),$ff
1d49 23        inc     hl
1d4a 44        ld      b,h
1d4b 4d        ld      c,l
1d4c dd21ef1f  ld      ix,$1fef
1d50 78        ld      a,b
1d51 ddbe01    cp      (ix+$01)
1d54 2004      jr      nz,$1d5a
1d56 79        ld      a,c
1d57 ddbe00    cp      (ix+$00)
1d5a 380b      jr      c,$1d67
1d5c dd2117cb  ld      ix,$cb17
1d60 cd463f    call    $3f46
1d63 b7        or      a
1d64 c3ed1d    jp      $1ded
1d67 c5        push    bc
1d68 11f71f    ld      de,$1ff7
1d6b 0e12      ld      c,$12
1d6d cd0500    call    $0005
1d70 c1        pop     bc
1d71 c3031d    jp      $1d03
1d74 60        ld      h,b
1d75 69        ld      l,c
1d76 ed5bf51f  ld      de,($1ff5)
1d7a b7        or      a
1d7b ed52      sbc     hl,de
1d7d 2012      jr      nz,$1d91
1d7f 3e00      ld      a,$00
1d81 212d9a    ld      hl,$9a2d
1d84 77        ld      (hl),a
1d85 2af51f    ld      hl,($1ff5)
1d88 22299a    ld      ($9a29),hl
1d8b 222b9a    ld      ($9a2b),hl
1d8e 37        scf     
1d8f 185c      jr      $1ded
1d91 50        ld      d,b
1d92 59        ld      e,c
1d93 2a1d9a    ld      hl,($9a1d)
1d96 ed53299a  ld      ($9a29),de
1d9a ed531d9a  ld      ($9a1d),de
1d9e 1b        dec     de
1d9f ed532b9a  ld      ($9a2b),de
1da3 13        inc     de
1da4 cdc233    call    $33c2
1da7 280a      jr      z,$1db3
1da9 b7        or      a
1daa ed42      sbc     hl,bc
1dac 2805      jr      z,$1db3
1dae 44        ld      b,h
1daf 4d        ld      c,l
1db0 cd5f97    call    $975f
1db3 62        ld      h,d
1db4 6b        ld      l,e
1db5 012d9a    ld      bc,$9a2d
1db8 b7        or      a
1db9 ed42      sbc     hl,bc
1dbb 44        ld      b,h
1dbc 4d        ld      c,l
1dbd cdc233    call    $33c2
1dc0 2811      jr      z,$1dd3
1dc2 112d9a    ld      de,$9a2d
1dc5 cdf096    call    $96f0
1dc8 3003      jr      nc,$1dcd
1dca b7        or      a
1dcb 1820      jr      $1ded
1dcd ed5b1d9a  ld      de,($9a1d)
1dd1 1805      jr      $1dd8
1dd3 212d9a    ld      hl,$9a2d
1dd6 edb0      ldir    
1dd8 62        ld      h,d
1dd9 6b        ld      l,e
1dda 2b        dec     hl
1ddb 112d9a    ld      de,$9a2d
1dde cd5372    call    $7253
1de1 cdc233    call    $33c2
1de4 2806      jr      z,$1dec
1de6 cd243c    call    $3c24
1de9 cd5f97    call    $975f
1dec 37        scf     
1ded f5        push    af
1dee cdc233    call    $33c2
1df1 280a      jr      z,$1dfd
1df3 fd21f11f  ld      iy,$1ff1
1df7 cde78e    call    $8ee7
1dfa cd0c3a    call    $3a0c
1dfd 3a091e    ld      a,($1e09)
1e00 b7        or      a
1e01 c45534    call    nz,$3455
1e04 f1        pop     af
1e05 e1        pop     hl
1e06 d1        pop     de
1e07 c1        pop     bc
1e08 c9        ret     

1e09 00        nop     
1e0a c5        push    bc
1e0b d5        push    de
1e0c e5        push    hl
1e0d dde5      push    ix
1e0f fde5      push    iy
1e11 cd6599    call    $9965
1e14 d5        push    de
1e15 118f65    ld      de,$658f
1e18 010f00    ld      bc,$000f
1e1b cdf096    call    $96f0
1e1e ed4b1d9a  ld      bc,($9a1d)
1e22 ed43299a  ld      ($9a29),bc
1e26 d1        pop     de
1e27 fd21259a  ld      iy,$9a25
1e2b cdda8e    call    $8eda
1e2e fde1      pop     iy
1e30 dde1      pop     ix
1e32 e1        pop     hl
1e33 d1        pop     de
1e34 c1        pop     bc
1e35 c9        ret     

1e36 e5        push    hl
1e37 d5        push    de
1e38 c5        push    bc
1e39 23        inc     hl
1e3a e5        push    hl
1e3b 1a        ld      a,(de)
1e3c a7        and     a
1e3d 282d      jr      z,$1e6c
1e3f 0608      ld      b,$08
1e41 cd6f1e    call    $1e6f
1e44 381e      jr      c,$1e64
1e46 010800    ld      bc,$0008
1e49 09        add     hl,bc
1e4a 1a        ld      a,(de)
1e4b 13        inc     de
1e4c fe2e      cp      $2e
1e4e 280d      jr      z,$1e5d
1e50 a7        and     a
1e51 20f7      jr      nz,$1e4a
1e53 7e        ld      a,(hl)
1e54 fe20      cp      $20
1e56 2011      jr      nz,$1e69
1e58 e1        pop     hl
1e59 c1        pop     bc
1e5a d1        pop     de
1e5b e1        pop     hl
1e5c c9        ret     

1e5d 0603      ld      b,$03
1e5f cd6f1e    call    $1e6f
1e62 30f4      jr      nc,$1e58
1e64 1a        ld      a,(de)
1e65 13        inc     de
1e66 a7        and     a
1e67 20fb      jr      nz,$1e64
1e69 e1        pop     hl
1e6a 18ce      jr      $1e3a
1e6c 37        scf     
1e6d 18e9      jr      $1e58
1e6f c5        push    bc
1e70 d5        push    de
1e71 e5        push    hl
1e72 1a        ld      a,(de)
1e73 a7        and     a
1e74 287c      jr      z,$1ef2
1e76 fe2e      cp      $2e
1e78 2878      jr      z,$1ef2
1e7a fe5b      cp      $5b
1e7c 283a      jr      z,$1eb8
1e7e fe2a      cp      $2a
1e80 281a      jr      z,$1e9c
1e82 fe3f      cp      $3f
1e84 2803      jr      z,$1e89
1e86 be        cp      (hl)
1e87 206e      jr      nz,$1ef7
1e89 13        inc     de
1e8a 23        inc     hl
1e8b 10e5      djnz    $1e72
1e8d 1a        ld      a,(de)
1e8e a7        and     a
1e8f 2867      jr      z,$1ef8
1e91 fe2e      cp      $2e
1e93 2863      jr      z,$1ef8
1e95 fe2a      cp      $2a
1e97 13        inc     de
1e98 28f3      jr      z,$1e8d
1e9a 185b      jr      $1ef7
1e9c 13        inc     de
1e9d 1a        ld      a,(de)
1e9e fe2a      cp      $2a
1ea0 28fa      jr      z,$1e9c
1ea2 a7        and     a
1ea3 2853      jr      z,$1ef8
1ea5 fe2e      cp      $2e
1ea7 284f      jr      z,$1ef8
1ea9 cd6f1e    call    $1e6f
1eac 304a      jr      nc,$1ef8
1eae 23        inc     hl
1eaf 7e        ld      a,(hl)
1eb0 fe20      cp      $20
1eb2 28d9      jr      z,$1e8d
1eb4 10f3      djnz    $1ea9
1eb6 18d5      jr      $1e8d
1eb8 13        inc     de
1eb9 1a        ld      a,(de)
1eba a7        and     a
1ebb 283a      jr      z,$1ef7
1ebd fe2e      cp      $2e
1ebf 2836      jr      z,$1ef7
1ec1 fe5d      cp      $5d
1ec3 2832      jr      z,$1ef7
1ec5 be        cp      (hl)
1ec6 281b      jr      z,$1ee3
1ec8 4f        ld      c,a
1ec9 13        inc     de
1eca 1a        ld      a,(de)
1ecb fe2d      cp      $2d
1ecd 20eb      jr      nz,$1eba
1ecf 13        inc     de
1ed0 1a        ld      a,(de)
1ed1 a7        and     a
1ed2 2823      jr      z,$1ef7
1ed4 fe2e      cp      $2e
1ed6 281f      jr      z,$1ef7
1ed8 fe5d      cp      $5d
1eda 281b      jr      z,$1ef7
1edc be        cp      (hl)
1edd 38db      jr      c,$1eba
1edf 79        ld      a,c
1ee0 be        cp      (hl)
1ee1 30d7      jr      nc,$1eba
1ee3 1a        ld      a,(de)
1ee4 a7        and     a
1ee5 280b      jr      z,$1ef2
1ee7 fe2e      cp      $2e
1ee9 2807      jr      z,$1ef2
1eeb fe5d      cp      $5d
1eed 289a      jr      z,$1e89
1eef 13        inc     de
1ef0 18f1      jr      $1ee3
1ef2 7e        ld      a,(hl)
1ef3 fe20      cp      $20
1ef5 2801      jr      z,$1ef8
1ef7 37        scf     
1ef8 e1        pop     hl
1ef9 d1        pop     de
1efa c1        pop     bc
1efb c9        ret     

1efc c5        push    bc
1efd cd1d1f    call    $1f1d
1f00 03        inc     bc
1f01 b7        or      a
1f02 ed42      sbc     hl,bc
1f04 3815      jr      c,$1f1b
1f06 cd5402    call    $0254
1f09 dd2147cb  ld      ix,$cb47
1f0d cdf73e    call    $3ef7
1f10 cd743f    call    $3f74
1f13 3805      jr      c,$1f1a
1f15 2803      jr      z,$1f1a
1f17 37        scf     
1f18 1801      jr      $1f1b
1f1a b7        or      a
1f1b c1        pop     bc
1f1c c9        ret     

1f1d f5        push    af
1f1e d5        push    de
1f1f cd2d1f    call    $1f2d
1f22 fe08      cp      $08
1f24 2804      jr      z,$1f2a
1f26 cb21      sla     c
1f28 cb10      rl      b
1f2a d1        pop     de
1f2b f1        pop     af
1f2c c9        ret     

1f2d e5        push    hl
1f2e 0e1b      ld      c,$1b
1f30 cd0500    call    $0005
1f33 f5        push    af
1f34 d5        push    de
1f35 60        ld      h,b
1f36 69        ld      l,c
1f37 3e80      ld      a,$80
1f39 010000    ld      bc,$0000
1f3c f5        push    af
1f3d a6        and     (hl)
1f3e 2001      jr      nz,$1f41
1f40 03        inc     bc
1f41 1b        dec     de
1f42 7a        ld      a,d
1f43 b3        or      e
1f44 2807      jr      z,$1f4d
1f46 f1        pop     af
1f47 0f        rrca    
1f48 30f2      jr      nc,$1f3c
1f4a 23        inc     hl
1f4b 18ef      jr      $1f3c
1f4d f1        pop     af
1f4e d1        pop     de
1f4f f1        pop     af
1f50 e1        pop     hl
1f51 c9        ret     

1f52 c5        push    bc
1f53 fde5      push    iy
1f55 d5        push    de
1f56 fde1      pop     iy
1f58 fd7e0c    ld      a,(iy+$0c)
1f5b 32ee1f    ld      ($1fee),a
1f5e fd360c00  ld      (iy+$0c),$00
1f62 0e11      ld      c,$11
1f64 cd0500    call    $0005
1f67 feff      cp      $ff
1f69 2876      jr      z,$1fe1
1f6b e5        push    hl
1f6c dde1      pop     ix
1f6e dd7e00    ld      a,(ix+$00)
1f71 fee5      cp      $e5
1f73 2004      jr      nz,$1f79
1f75 0e12      ld      c,$12
1f77 18eb      jr      $1f64
1f79 0e1b      ld      c,$1b
1f7b cd0500    call    $0005
1f7e 32ed1f    ld      ($1fed),a
1f81 fde5      push    iy
1f83 d1        pop     de
1f84 dd7e0f    ld      a,(ix+$0f)
1f87 fe80      cp      $80
1f89 2020      jr      nz,$1fab
1f8b fd340c    inc     (iy+$0c)
1f8e 0e11      ld      c,$11
1f90 cd0500    call    $0005
1f93 feff      cp      $ff
1f95 280c      jr      z,$1fa3
1f97 e5        push    hl
1f98 dde1      pop     ix
1f9a dd7e00    ld      a,(ix+$00)
1f9d fee5      cp      $e5
1f9f 28ea      jr      z,$1f8b
1fa1 18d6      jr      $1f79
1fa3 fd7e0c    ld      a,(iy+$0c)
1fa6 210000    ld      hl,$0000
1fa9 1821      jr      $1fcc
1fab 2600      ld      h,$00
1fad 6f        ld      l,a
1fae 3aed1f    ld      a,($1fed)
1fb1 1600      ld      d,$00
1fb3 5f        ld      e,a
1fb4 0e8a      ld      c,$8a
1fb6 cd0500    call    $0005
1fb9 7a        ld      a,d
1fba b3        or      e
1fbb 2801      jr      z,$1fbe
1fbd 23        inc     hl
1fbe 3aed1f    ld      a,($1fed)
1fc1 fe10      cp      $10
1fc3 2001      jr      nz,$1fc6
1fc5 29        add     hl,hl
1fc6 dd7e0c    ld      a,(ix+$0c)
1fc9 b7        or      a
1fca 2814      jr      z,$1fe0
1fcc 0600      ld      b,$00
1fce 4f        ld      c,a
1fcf cb21      sla     c
1fd1 cb10      rl      b
1fd3 cb21      sla     c
1fd5 cb10      rl      b
1fd7 cb21      sla     c
1fd9 cb10      rl      b
1fdb cb21      sla     c
1fdd cb10      rl      b
1fdf 09        add     hl,bc
1fe0 97        sub     a
1fe1 f5        push    af
1fe2 3aee1f    ld      a,($1fee)
1fe5 fd770c    ld      (iy+$0c),a
1fe8 f1        pop     af
1fe9 fde1      pop     iy
1feb c1        pop     bc
1fec c9        ret     

1fed 00        nop     
1fee 00        nop     
1fef 00        nop     
1ff0 00        nop     
1ff1 00        nop     
1ff2 00        nop     
1ff3 00        nop     
1ff4 00        nop     
1ff5 00        nop     
1ff6 00        nop     
1ff7 00        nop     
1ff8 3f        ccf     
1ff9 3f        ccf     
1ffa 3f        ccf     
1ffb 3f        ccf     
1ffc 3f        ccf     
1ffd 3f        ccf     
1ffe 3f        ccf     
1fff 3f        ccf     
2000 3f        ccf     
2001 3f        ccf     
2002 3f        ccf     
2003 00        nop     
2004 2a2e43    ld      hl,($432e)
2007 4f        ld      c,a
2008 4d        ld      c,l
2009 00        nop     
200a 2a2e52    ld      hl,($522e)
200d 45        ld      b,l
200e 4c        ld      c,h
200f 00        nop     
2010 2a2e42    ld      hl,($422e)
2013 49        ld      c,c
2014 4e        ld      c,(hl)
2015 00        nop     
2016 2a2e4f    ld      hl,($4f2e)
2019 56        ld      d,(hl)
201a 52        ld      d,d
201b 00        nop     
201c 2a2e48    ld      hl,($482e)
201f 4c        ld      c,h
2020 50        ld      d,b
2021 00        nop     
2022 2a2e24    ld      hl,($242e)
2025 2a0000    ld      hl,($0000)
2028 e5        push    hl
2029 dde5      push    ix
202b dd21bdcb  ld      ix,$cbbd
202f 214120    ld      hl,$2041
2032 cd9f81    call    $819f
2035 3806      jr      c,$203d
2037 d641      sub     $41
2039 cd5820    call    $2058
203c b7        or      a
203d dde1      pop     ix
203f e1        pop     hl
2040 c9        ret     

2041 41        ld      b,c
2042 42        ld      b,d
2043 43        ld      b,e
2044 44        ld      b,h
2045 45        ld      b,l
2046 46        ld      b,(hl)
2047 47        ld      b,a
2048 48        ld      c,b
2049 00        nop     
204a 3a4e20    ld      a,($204e)
204d c9        ret     

204e 00        nop     
204f c5        push    bc
2050 0e19      ld      c,$19
2052 cd0500    call    $0005
2055 3c        inc     a
2056 c1        pop     bc
2057 c9        ret     

2058 c5        push    bc
2059 d5        push    de
205a 0e0d      ld      c,$0d
205c cd0500    call    $0005
205f 5f        ld      e,a
2060 0e0e      ld      c,$0e
2062 cd0500    call    $0005
2065 d1        pop     de
2066 c1        pop     bc
2067 c9        ret     

2068 3aa120    ld      a,($20a1)
206b b7        or      a
206c c9        ret     

206d 0e81      ld      c,$81
206f cd0500    call    $0005
2072 210500    ld      hl,$0005
2075 09        add     hl,bc
2076 5e        ld      e,(hl)
2077 23        inc     hl
2078 56        ld      d,(hl)
2079 eb        ex      de,hl
207a 23        inc     hl
207b 0604      ld      b,$04
207d 0e41      ld      c,$41
207f 11a220    ld      de,$20a2
2082 7e        ld      a,(hl)
2083 23        inc     hl
2084 b6        or      (hl)
2085 2807      jr      z,$208e
2087 79        ld      a,c
2088 12        ld      (de),a
2089 13        inc     de
208a 3e2c      ld      a,$2c
208c 12        ld      (de),a
208d 13        inc     de
208e 0c        inc     c
208f 23        inc     hl
2090 10f0      djnz    $2082
2092 1b        dec     de
2093 97        sub     a
2094 12        ld      (de),a
2095 1b        dec     de
2096 1a        ld      a,(de)
2097 fe41      cp      $41
2099 2005      jr      nz,$20a0
209b 3e01      ld      a,$01
209d 32a120    ld      ($20a1),a
20a0 c9        ret     

20a1 00        nop     
20a2 00        nop     
20a3 00        nop     
20a4 00        nop     
20a5 00        nop     
20a6 00        nop     
20a7 00        nop     
20a8 00        nop     
20a9 00        nop     
20aa d5        push    de
20ab e5        push    hl
20ac 21a220    ld      hl,$20a2
20af 57        ld      d,a
20b0 fe2c      cp      $2c
20b2 2003      jr      nz,$20b7
20b4 97        sub     a
20b5 180a      jr      $20c1
20b7 7a        ld      a,d
20b8 be        cp      (hl)
20b9 2805      jr      z,$20c0
20bb 23        inc     hl
20bc 97        sub     a
20bd be        cp      (hl)
20be 20f7      jr      nz,$20b7
20c0 7e        ld      a,(hl)
20c1 a7        and     a
20c2 e1        pop     hl
20c3 d1        pop     de
20c4 c9        ret     

20c5 0e15      ld      c,$15
20c7 c30500    jp      $0005
20ca 0e14      ld      c,$14
20cc c30500    jp      $0005
20cf 0e0f      ld      c,$0f
20d1 c30500    jp      $0005
20d4 0e16      ld      c,$16
20d6 c30500    jp      $0005
20d9 0e10      ld      c,$10
20db c30500    jp      $0005
20de 0e17      ld      c,$17
20e0 c30500    jp      $0005
20e3 00        nop     
20e4 00        nop     
20e5 00        nop     
20e6 00        nop     
20e7 00        nop     
20e8 00        nop     
20e9 00        nop     
20ea 00        nop     
20eb 00        nop     
20ec 00        nop     
20ed 00        nop     
20ee 00        nop     
20ef 00        nop     
20f0 00        nop     
20f1 00        nop     
20f2 00        nop     
20f3 00        nop     
20f4 00        nop     
20f5 00        nop     
20f6 00        nop     
20f7 00        nop     
20f8 00        nop     
20f9 00        nop     
20fa 00        nop     
20fb 00        nop     
20fc 00        nop     
20fd 00        nop     
20fe 00        nop     
20ff 00        nop     
2100 00        nop     
2101 00        nop     
2102 00        nop     
2103 00        nop     
2104 00        nop     
2105 00        nop     
2106 2d        dec     l
2107 2d        dec     l
2108 2d        dec     l
2109 2d        dec     l
210a 2d        dec     l
210b 2d        dec     l
210c 2d        dec     l
210d 2d        dec     l
210e 2d        dec     l
210f 2d        dec     l
2110 2d        dec     l
2111 00        nop     
2112 00        nop     
2113 00        nop     
2114 00        nop     
2115 00        nop     
2116 00        nop     
2117 00        nop     
2118 00        nop     
2119 00        nop     
211a 00        nop     
211b 00        nop     
211c 00        nop     
211d 00        nop     
211e 00        nop     
211f 00        nop     
2120 00        nop     
2121 00        nop     
2122 00        nop     
2123 00        nop     
2124 00        nop     
2125 00        nop     
2126 00        nop     
2127 2d        dec     l
2128 2d        dec     l
2129 2d        dec     l
212a 2d        dec     l
212b 2d        dec     l
212c 2d        dec     l
212d 2d        dec     l
212e 2d        dec     l
212f 2d        dec     l
2130 2d        dec     l
2131 2d        dec     l
2132 00        nop     
2133 00        nop     
2134 00        nop     
2135 00        nop     
2136 00        nop     
2137 00        nop     
2138 00        nop     
2139 00        nop     
213a 00        nop     
213b 00        nop     
213c 00        nop     
213d 00        nop     
213e 00        nop     
213f 00        nop     
2140 00        nop     
2141 00        nop     
2142 00        nop     
2143 00        nop     
2144 00        nop     
2145 00        nop     
2146 00        nop     
2147 00        nop     
2148 00        nop     
2149 00        nop     
214a 00        nop     
214b 00        nop     
214c 00        nop     
214d 00        nop     
214e 00        nop     
214f 00        nop     
2150 00        nop     
2151 00        nop     
2152 00        nop     
2153 00        nop     
2154 00        nop     
2155 00        nop     
2156 00        nop     
2157 00        nop     
2158 00        nop     
2159 00        nop     
215a 00        nop     
215b 00        nop     
215c 00        nop     
215d 00        nop     
215e 00        nop     
215f 00        nop     
2160 00        nop     
2161 00        nop     
2162 00        nop     
2163 00        nop     
2164 00        nop     
2165 00        nop     
2166 00        nop     
2167 00        nop     
2168 00        nop     
2169 00        nop     
216a 00        nop     
216b 00        nop     
216c 00        nop     
216d 00        nop     
216e 00        nop     
216f 00        nop     
2170 00        nop     
2171 00        nop     
2172 00        nop     
2173 00        nop     
2174 00        nop     
2175 00        nop     
2176 00        nop     
2177 00        nop     
2178 00        nop     
2179 00        nop     
217a 00        nop     
217b 00        nop     
217c 00        nop     
217d 00        nop     
217e 00        nop     
217f 00        nop     
2180 00        nop     
2181 00        nop     
2182 00        nop     
2183 00        nop     
2184 00        nop     
2185 00        nop     
2186 00        nop     
2187 00        nop     
2188 00        nop     
2189 00        nop     
218a 00        nop     
218b 00        nop     
218c 00        nop     
218d 00        nop     
218e 00        nop     
218f 00        nop     
2190 00        nop     
2191 00        nop     
2192 00        nop     
2193 00        nop     
2194 00        nop     
2195 00        nop     
2196 00        nop     
2197 00        nop     
2198 00        nop     
2199 00        nop     
219a 00        nop     
219b 00        nop     
219c 00        nop     
219d 00        nop     
219e 00        nop     
219f 00        nop     
21a0 00        nop     
21a1 00        nop     
21a2 00        nop     
21a3 00        nop     
21a4 00        nop     
21a5 00        nop     
21a6 00        nop     
21a7 00        nop     
21a8 00        nop     
21a9 00        nop     
21aa e5        push    hl
21ab 21e320    ld      hl,$20e3
21ae cb96      res     2,(hl)
21b0 e1        pop     hl
21b1 c9        ret     

21b2 e5        push    hl
21b3 21e320    ld      hl,$20e3
21b6 cb86      res     0,(hl)
21b8 e1        pop     hl
21b9 c9        ret     

21ba e5        push    hl
21bb 21e320    ld      hl,$20e3
21be cb8e      res     1,(hl)
21c0 e1        pop     hl
21c1 c9        ret     

21c2 c5        push    bc
21c3 d5        push    de
21c4 e5        push    hl
21c5 dde5      push    ix
21c7 fde5      push    iy
21c9 f5        push    af
21ca 97        sub     a
21cb 32e420    ld      ($20e4),a
21ce fde5      push    iy
21d0 e1        pop     hl
21d1 11e420    ld      de,$20e4
21d4 0e86      ld      c,$86
21d6 cd0500    call    $0005
21d9 21e420    ld      hl,$20e4
21dc 11b222    ld      de,$22b2
21df cd361e    call    $1e36
21e2 3808      jr      c,$21ec
21e4 f1        pop     af
21e5 dd216bc8  ld      ix,$c86b
21e9 c3a522    jp      $22a5
21ec fde5      push    iy
21ee e1        pop     hl
21ef 112621    ld      de,$2126
21f2 0e86      ld      c,$86
21f4 cd0500    call    $0005
21f7 cdbf22    call    $22bf
21fa fde5      push    iy
21fc e1        pop     hl
21fd 110521    ld      de,$2105
2200 0e86      ld      c,$86
2202 cd0500    call    $0005
2205 cdcd22    call    $22cd
2208 f1        pop     af
2209 3827      jr      c,$2232
220b 11e420    ld      de,$20e4
220e cdcf20    call    $20cf
2211 feff      cp      $ff
2213 ca7922    jp      z,$2279
2216 21e320    ld      hl,$20e3
2219 cbd6      set     2,(hl)
221b 21e320    ld      hl,$20e3
221e cb9e      res     3,(hl)
2220 cd0e35    call    $350e
2223 202e      jr      nz,$2253
2225 11e420    ld      de,$20e4
2228 cd521f    call    $1f52
222b cdfc1e    call    $1efc
222e 3823      jr      c,$2253
2230 1840      jr      $2272
2232 11e420    ld      de,$20e4
2235 0e11      ld      c,$11
2237 cd0500    call    $0005
223a feff      cp      $ff
223c 206a      jr      nz,$22a8
223e cd0e35    call    $350e
2241 2008      jr      nz,$224b
2243 210400    ld      hl,$0004
2246 cdfc1e    call    $1efc
2249 3027      jr      nc,$2272
224b cdaa21    call    $21aa
224e 21e320    ld      hl,$20e3
2251 cbde      set     3,(hl)
2253 112621    ld      de,$2126
2256 cdcf20    call    $20cf
2259 feff      cp      $ff
225b 2828      jr      z,$2285
225d 21e320    ld      hl,$20e3
2260 cb8e      res     1,(hl)
2262 110521    ld      de,$2105
2265 cdcf20    call    $20cf
2268 feff      cp      $ff
226a 282a      jr      z,$2296
226c cdb221    call    $21b2
226f 97        sub     a
2270 1838      jr      $22aa
2272 cda68c    call    $8ca6
2275 3eff      ld      a,$ff
2277 1831      jr      $22aa
2279 dd2115c8  ld      ix,$c815
227d 1826      jr      $22a5
227f dd2126c8  ld      ix,$c826
2283 1820      jr      $22a5
2285 dd212621  ld      ix,$2126
2289 cdf026    call    $26f0
228c feff      cp      $ff
228e 20d2      jr      nz,$2262
2290 dd2139c8  ld      ix,$c839
2294 180f      jr      $22a5
2296 dd210521  ld      ix,$2105
229a cdf026    call    $26f0
229d feff      cp      $ff
229f 20ce      jr      nz,$226f
22a1 dd2153c8  ld      ix,$c853
22a5 cd463f    call    $3f46
22a8 3e02      ld      a,$02
22aa fde1      pop     iy
22ac dde1      pop     ix
22ae e1        pop     hl
22af d1        pop     de
22b0 c1        pop     bc
22b1 c9        ret     

22b2 2a2e42    ld      hl,($422e)
22b5 41        ld      b,c
22b6 4b        ld      c,e
22b7 00        nop     
22b8 2a2e50    ld      hl,($502e)
22bb 52        ld      d,d
22bc 54        ld      d,h
22bd 00        nop     
22be 00        nop     
22bf e5        push    hl
22c0 212f21    ld      hl,$212f
22c3 3624      ld      (hl),$24
22c5 23        inc     hl
22c6 3624      ld      (hl),$24
22c8 23        inc     hl
22c9 364f      ld      (hl),$4f
22cb e1        pop     hl
22cc c9        ret     

22cd e5        push    hl
22ce 210e21    ld      hl,$210e
22d1 3624      ld      (hl),$24
22d3 23        inc     hl
22d4 3624      ld      (hl),$24
22d6 23        inc     hl
22d7 3654      ld      (hl),$54
22d9 e1        pop     hl
22da c9        ret     

22db e5        push    hl
22dc dde5      push    ix
22de 21e320    ld      hl,$20e3
22e1 cb4e      bit     1,(hl)
22e3 2826      jr      z,$230b
22e5 cddd23    call    $23dd
22e8 cde328    call    $28e3
22eb dd212621  ld      ix,$2126
22ef cd6423    call    $2364
22f2 fe02      cp      $02
22f4 2009      jr      nz,$22ff
22f6 dd214aca  ld      ix,$ca4a
22fa cd463f    call    $3f46
22fd 180e      jr      $230d
22ff fe01      cp      $01
2301 2802      jr      z,$2305
2303 1808      jr      $230d
2305 cdd623    call    $23d6
2308 cdba21    call    $21ba
230b 3e01      ld      a,$01
230d cdeb28    call    $28eb
2310 dde1      pop     ix
2312 e1        pop     hl
2313 c9        ret     

2314 c5        push    bc
2315 e5        push    hl
2316 dde5      push    ix
2318 cde328    call    $28e3
231b 21e320    ld      hl,$20e3
231e cb46      bit     0,(hl)
2320 2813      jr      z,$2335
2322 dd210521  ld      ix,$2105
2326 cd6423    call    $2364
2329 fe01      cp      $01
232b 2805      jr      z,$2332
232d cdd623    call    $23d6
2330 182a      jr      $235c
2332 cdb221    call    $21b2
2335 21e320    ld      hl,$20e3
2338 cb56      bit     2,(hl)
233a 2004      jr      nz,$2340
233c 3e01      ld      a,$01
233e 181c      jr      $235c
2340 d5        push    de
2341 11e420    ld      de,$20e4
2344 cdca20    call    $20ca
2347 d1        pop     de
2348 fe01      cp      $01
234a 2809      jr      z,$2355
234c fe02      cp      $02
234e 280a      jr      z,$235a
2350 cdd623    call    $23d6
2353 1807      jr      $235c
2355 cdaa21    call    $21aa
2358 1802      jr      $235c
235a 3e02      ld      a,$02
235c cdeb28    call    $28eb
235f dde1      pop     ix
2361 e1        pop     hl
2362 c1        pop     bc
2363 c9        ret     

2364 c5        push    bc
2365 d5        push    de
2366 cd5090    call    $9050
2369 b7        or      a
236a fa7f23    jp      m,$237f
236d dde5      push    ix
236f d1        pop     de
2370 0e14      ld      c,$14
2372 cd0500    call    $0005
2375 fe02      cp      $02
2377 280a      jr      z,$2383
2379 cd5090    call    $9050
237c 97        sub     a
237d 1806      jr      $2385
237f 3e01      ld      a,$01
2381 1802      jr      $2385
2383 3e02      ld      a,$02
2385 d1        pop     de
2386 c1        pop     bc
2387 c9        ret     

2388 c5        push    bc
2389 e5        push    hl
238a cde328    call    $28e3
238d d5        push    de
238e 112621    ld      de,$2126
2391 cdc520    call    $20c5
2394 d1        pop     de
2395 b7        or      a
2396 200a      jr      nz,$23a2
2398 21e320    ld      hl,$20e3
239b cbce      set     1,(hl)
239d cdd623    call    $23d6
23a0 1807      jr      $23a9
23a2 cd3724    call    $2437
23a5 30e3      jr      nc,$238a
23a7 3e02      ld      a,$02
23a9 cdeb28    call    $28eb
23ac e1        pop     hl
23ad c1        pop     bc
23ae c9        ret     

23af c5        push    bc
23b0 e5        push    hl
23b1 cddd23    call    $23dd
23b4 cde328    call    $28e3
23b7 d5        push    de
23b8 110521    ld      de,$2105
23bb cdc520    call    $20c5
23be d1        pop     de
23bf b7        or      a
23c0 2007      jr      nz,$23c9
23c2 21e320    ld      hl,$20e3
23c5 cbc6      set     0,(hl)
23c7 1807      jr      $23d0
23c9 cd3724    call    $2437
23cc 30e6      jr      nc,$23b4
23ce 3e02      ld      a,$02
23d0 cdeb28    call    $28eb
23d3 e1        pop     hl
23d4 c1        pop     bc
23d5 c9        ret     

23d6 218000    ld      hl,$0080
23d9 19        add     hl,de
23da 54        ld      d,h
23db 5d        ld      e,l
23dc c9        ret     

23dd 2180ff    ld      hl,$ff80
23e0 19        add     hl,de
23e1 54        ld      d,h
23e2 5d        ld      e,l
23e3 c9        ret     

23e4 c5        push    bc
23e5 d5        push    de
23e6 e5        push    hl
23e7 112621    ld      de,$2126
23ea cdd920    call    $20d9
23ed 21e520    ld      hl,$20e5
23f0 113721    ld      de,$2137
23f3 011000    ld      bc,$0010
23f6 edb0      ldir    
23f8 97        sub     a
23f9 323621    ld      ($2136),a
23fc 21e420    ld      hl,$20e4
23ff 11f420    ld      de,$20f4
2402 010900    ld      bc,$0009
2405 edb0      ldir    
2407 62        ld      h,d
2408 6b        ld      l,e
2409 3642      ld      (hl),$42
240b 23        inc     hl
240c 3641      ld      (hl),$41
240e 23        inc     hl
240f 364b      ld      (hl),$4b
2411 11f420    ld      de,$20f4
2414 0e13      ld      c,$13
2416 cd0500    call    $0005
2419 11e420    ld      de,$20e4
241c cdde20    call    $20de
241f 112621    ld      de,$2126
2422 cdde20    call    $20de
2425 cdac2c    call    $2cac
2428 e1        pop     hl
2429 d1        pop     de
242a c1        pop     bc
242b c9        ret     

242c d5        push    de
242d e5        push    hl
242e 11e420    ld      de,$20e4
2431 cda63f    call    $3fa6
2434 e1        pop     hl
2435 d1        pop     de
2436 c9        ret     

2437 f5        push    af
2438 c5        push    bc
2439 d5        push    de
243a e5        push    hl
243b dde5      push    ix
243d fde5      push    iy
243f 218000    ld      hl,$0080
2442 11e977    ld      de,$77e9
2445 018000    ld      bc,$0080
2448 edb0      ldir    
244a cdeb28    call    $28eb
244d cd5402    call    $0254
2450 119ba0    ld      de,$a09b
2453 0600      ld      b,$00
2455 212d9a    ld      hl,$9a2d
2458 cd5a8a    call    $8a5a
245b 1601      ld      d,$01
245d 1e18      ld      e,$18
245f cd9504    call    $0495
2462 cd743f    call    $3f74
2465 dafa25    jp      c,$25fa
2468 282f      jr      z,$2499
246a 214721    ld      hl,$2147
246d 11b326    ld      de,$26b3
2470 012100    ld      bc,$0021
2473 edb0      ldir    
2475 dd21dda0  ld      ix,$a0dd
2479 cdf73e    call    $3ef7
247c cdad89    call    $89ad
247f 21a626    ld      hl,$26a6
2482 cda88d    call    $8da8
2485 cdff29    call    $29ff
2488 b7        or      a
2489 20ea      jr      nz,$2475
248b 21b326    ld      hl,$26b3
248e 114721    ld      de,$2147
2491 012100    ld      bc,$0021
2494 edb0      ldir    
2496 c38a26    jp      $268a
2499 cd0e35    call    $350e
249c c2fa25    jp      nz,$25fa
249f cd7403    call    $0374
24a2 dd2181a1  ld      ix,$a181
24a6 cdf73e    call    $3ef7
24a9 cd743f    call    $3f74
24ac dafa25    jp      c,$25fa
24af cafa25    jp      z,$25fa
24b2 21e865    ld      hl,$65e8
24b5 11b326    ld      de,$26b3
24b8 0e86      ld      c,$86
24ba cd0500    call    $0005
24bd 11b326    ld      de,$26b3
24c0 cdcf20    call    $20cf
24c3 11b326    ld      de,$26b3
24c6 cdca20    call    $20ca
24c9 fe02      cp      $02
24cb cafa25    jp      z,$25fa
24ce 218000    ld      hl,$0080
24d1 116978    ld      de,$7869
24d4 018000    ld      bc,$0080
24d7 edb0      ldir    
24d9 11b326    ld      de,$26b3
24dc cdca20    call    $20ca
24df fe02      cp      $02
24e1 cafa25    jp      z,$25fa
24e4 218000    ld      hl,$0080
24e7 11e978    ld      de,$78e9
24ea 018000    ld      bc,$0080
24ed edb0      ldir    
24ef cd6820    call    $2068
24f2 2812      jr      z,$2506
24f4 dd214aa2  ld      ix,$a24a
24f8 cdf73e    call    $3ef7
24fb cde726    call    $26e7
24fe fe1b      cp      $1b
2500 cafa25    jp      z,$25fa
2503 97        sub     a
2504 181c      jr      $2522
2506 dd21bba1  ld      ix,$a1bb
250a cdf73e    call    $3ef7
250d cde726    call    $26e7
2510 fe1b      cp      $1b
2512 cafa25    jp      z,$25fa
2515 cdac90    call    $90ac
2518 cdaa20    call    $20aa
251b 28f0      jr      z,$250d
251d cd4583    call    $8345
2520 d641      sub     $41
2522 cd5820    call    $2058
2525 cd6202    call    $0262
2528 21d626    ld      hl,$26d6
252b 11b326    ld      de,$26b3
252e 010c00    ld      bc,$000c
2531 edb0      ldir    
2533 dd21b326  ld      ix,$26b3
2537 cdf026    call    $26f0
253a feff      cp      $ff
253c 200c      jr      nz,$254a
253e dd216c78  ld      ix,$786c
2542 cd003f    call    $3f00
2545 cde726    call    $26e7
2548 18c3      jr      $250d
254a 21fe25    ld      hl,$25fe
254d 220101    ld      ($0101),hl
2550 ed73d426  ld      ($26d4),sp
2554 3a0421    ld      a,($2104)
2557 32e226    ld      ($26e2),a
255a 3a4621    ld      a,($2146)
255d 32e326    ld      ($26e3),a
2560 3a2521    ld      a,($2125)
2563 32e426    ld      ($26e4),a
2566 3a6721    ld      a,($2167)
2569 32e526    ld      ($26e5),a
256c 3a8821    ld      a,($2188)
256f 32e626    ld      ($26e6),a
2572 210001    ld      hl,$0100
2575 e5        push    hl
2576 118000    ld      de,$0080
2579 018000    ld      bc,$0080
257c edb0      ldir    
257e 11b326    ld      de,$26b3
2581 cdc520    call    $20c5
2584 e1        pop     hl
2585 54        ld      d,h
2586 5d        ld      e,l
2587 2a1f9a    ld      hl,($9a1f)
258a b7        or      a
258b ed52      sbc     hl,de
258d 3805      jr      c,$2594
258f cdd623    call    $23d6
2592 18e1      jr      $2575
2594 11b326    ld      de,$26b3
2597 cdd920    call    $20d9
259a cd6820    call    $2068
259d 280d      jr      z,$25ac
259f dd21d378  ld      ix,$78d3
25a3 cd003f    call    $3f00
25a6 cde726    call    $26e7
25a9 cd6202    call    $0262
25ac cd4a20    call    $204a
25af 3d        dec     a
25b0 cd5820    call    $2058
25b3 dd21b7a2  ld      ix,$a2b7
25b7 cdf73e    call    $3ef7
25ba cd6820    call    $2068
25bd 2806      jr      z,$25c5
25bf dd21f4a4  ld      ix,$a4f4
25c3 1804      jr      $25c9
25c5 dd21c4a4  ld      ix,$a4c4
25c9 cd003f    call    $3f00
25cc dd211ba5  ld      ix,$a51b
25d0 cd003f    call    $3f00
25d3 cdc93e    call    $3ec9
25d6 cd528a    call    $8a52
25d9 11e420    ld      de,$20e4
25dc cdd920    call    $20d9
25df 112621    ld      de,$2126
25e2 cdd920    call    $20d9
25e5 110521    ld      de,$2105
25e8 cdd920    call    $20d9
25eb 114721    ld      de,$2147
25ee cdd920    call    $20d9
25f1 116821    ld      de,$2168
25f4 cdd920    call    $20d9
25f7 c30000    jp      $0000
25fa 37        scf     
25fb c39d26    jp      $269d
25fe ed7bd426  ld      sp,($26d4)
2602 cd7403    call    $0374
2605 cd5d65    call    $655d
2608 38ed      jr      c,$25f7
260a 21e320    ld      hl,$20e3
260d cb5e      bit     3,(hl)
260f 201c      jr      nz,$262d
2611 11e420    ld      de,$20e4
2614 cdcf20    call    $20cf
2617 feff      cp      $ff
2619 200c      jr      nz,$2627
261b cd6202    call    $0262
261e cd1483    call    $8314
2621 dd21c1a5  ld      ix,$a5c1
2625 182a      jr      $2651
2627 3ae226    ld      a,($26e2)
262a 320421    ld      ($2104),a
262d 112621    ld      de,$2126
2630 cdcf20    call    $20cf
2633 feff      cp      $ff
2635 2006      jr      nz,$263d
2637 dd21d4a5  ld      ix,$a5d4
263b 1814      jr      $2651
263d 3ae326    ld      a,($26e3)
2640 324621    ld      ($2146),a
2643 110521    ld      de,$2105
2646 cdcf20    call    $20cf
2649 feff      cp      $ff
264b 2009      jr      nz,$2656
264d dd21f2a5  ld      ix,$a5f2
2651 cd003f    call    $3f00
2654 18a1      jr      $25f7
2656 3ae426    ld      a,($26e4)
2659 322521    ld      ($2125),a
265c 21e320    ld      hl,$20e3
265f cb66      bit     4,(hl)
2661 280c      jr      z,$266f
2663 114721    ld      de,$2147
2666 cdcf20    call    $20cf
2669 3ae526    ld      a,($26e5)
266c 326721    ld      ($2167),a
266f 21e320    ld      hl,$20e3
2672 cb6e      bit     5,(hl)
2674 280c      jr      z,$2682
2676 116821    ld      de,$2168
2679 cdcf20    call    $20cf
267c 3ae626    ld      a,($26e6)
267f 328821    ld      ($2188),a
2682 11b326    ld      de,$26b3
2685 0e13      ld      c,$13
2687 cd0500    call    $0005
268a 21e977    ld      hl,$77e9
268d 118000    ld      de,$0080
2690 018000    ld      bc,$0080
2693 edb0      ldir    
2695 dd2110a6  ld      ix,$a610
2699 cdf73e    call    $3ef7
269c b7        or      a
269d fde1      pop     iy
269f dde1      pop     ix
26a1 e1        pop     hl
26a2 d1        pop     de
26a3 c1        pop     bc
26a4 f1        pop     af
26a5 c9        ret     

26a6 64        ld      h,h
26a7 65        ld      h,l
26a8 6c        ld      l,h
26a9 65        ld      h,l
26aa 74        ld      (hl),h
26ab 65        ld      h,l
26ac 2066      jr      nz,$2714
26ae 69        ld      l,c
26af 6c        ld      l,h
26b0 65        ld      h,l
26b1 2024      jr      nz,$26d7
26b3 00        nop     
26b4 00        nop     
26b5 00        nop     
26b6 00        nop     
26b7 00        nop     
26b8 00        nop     
26b9 00        nop     
26ba 00        nop     
26bb 00        nop     
26bc 00        nop     
26bd 00        nop     
26be 00        nop     
26bf 00        nop     
26c0 00        nop     
26c1 00        nop     
26c2 00        nop     
26c3 00        nop     
26c4 00        nop     
26c5 00        nop     
26c6 00        nop     
26c7 00        nop     
26c8 00        nop     
26c9 00        nop     
26ca 00        nop     
26cb 00        nop     
26cc 00        nop     
26cd 00        nop     
26ce 00        nop     
26cf 00        nop     
26d0 00        nop     
26d1 00        nop     
26d2 00        nop     
26d3 00        nop     
26d4 00        nop     
26d5 00        nop     
26d6 00        nop     
26d7 52        ld      d,d
26d8 45        ld      b,l
26d9 53        ld      d,e
26da 54        ld      d,h
26db 41        ld      b,c
26dc 52        ld      d,d
26dd 54        ld      d,h
26de 2043      jr      nz,$2723
26e0 4f        ld      c,a
26e1 4d        ld      c,l
26e2 00        nop     
26e3 00        nop     
26e4 00        nop     
26e5 00        nop     
26e6 00        nop     
26e7 cd5402    call    $0254
26ea cd7d80    call    $807d
26ed c3a27f    jp      $7fa2
26f0 dd360c00  ld      (ix+$0c),$00
26f4 dde5      push    ix
26f6 d1        pop     de
26f7 0e16      ld      c,$16
26f9 c30500    jp      $0005
26fc c5        push    bc
26fd d5        push    de
26fe e5        push    hl
26ff dde5      push    ix
2701 cdca28    call    $28ca
2704 114721    ld      de,$2147
2707 cdcf20    call    $20cf
270a feff      cp      $ff
270c 2004      jr      nz,$2712
270e 3e02      ld      a,$02
2710 1806      jr      $2718
2712 3e01      ld      a,$01
2714 321e27    ld      ($271e),a
2717 97        sub     a
2718 dde1      pop     ix
271a e1        pop     hl
271b d1        pop     de
271c c1        pop     bc
271d c9        ret     

271e 00        nop     
271f c5        push    bc
2720 d5        push    de
2721 e5        push    hl
2722 dde5      push    ix
2724 fde5      push    iy
2726 21e320    ld      hl,$20e3
2729 cbe6      set     4,(hl)
272b 32b327    ld      ($27b3),a
272e cd6599    call    $9965
2731 fd21b427  ld      iy,$27b4
2735 cdda8e    call    $8eda
2738 218000    ld      hl,$0080
273b 114721    ld      de,$2147
273e cdcb27    call    $27cb
2741 fe01      cp      $01
2743 2861      jr      z,$27a6
2745 47        ld      b,a
2746 3ab327    ld      a,($27b3)
2749 b7        or      a
274a 2813      jr      z,$275f
274c 78        ld      a,b
274d 32b327    ld      ($27b3),a
2750 180d      jr      $275f
2752 218000    ld      hl,$0080
2755 114721    ld      de,$2147
2758 cdcb27    call    $27cb
275b fe01      cp      $01
275d 2847      jr      z,$27a6
275f 54        ld      d,h
2760 5d        ld      e,l
2761 010000    ld      bc,$0000
2764 1a        ld      a,(de)
2765 fe1a      cp      $1a
2767 2813      jr      z,$277c
2769 fe01      cp      $01
276b 280f      jr      z,$277c
276d 13        inc     de
276e 03        inc     bc
276f cb42      bit     0,d
2771 28f1      jr      z,$2764
2773 54        ld      d,h
2774 5d        ld      e,l
2775 cdf096    call    $96f0
2778 3807      jr      c,$2781
277a 18d6      jr      $2752
277c 54        ld      d,h
277d 5d        ld      e,l
277e cdf096    call    $96f0
2781 3ab327    ld      a,($27b3)
2784 b7        or      a
2785 281f      jr      z,$27a6
2787 f5        push    af
2788 cd6599    call    $9965
278b d5        push    de
278c e5        push    hl
278d fd21b427  ld      iy,$27b4
2791 cde78e    call    $8ee7
2794 cd0c3a    call    $3a0c
2797 e1        pop     hl
2798 d1        pop     de
2799 f1        pop     af
279a fe03      cp      $03
279c 2805      jr      z,$27a3
279e cd7b7a    call    $7a7b
27a1 1803      jr      $27a6
27a3 cda37a    call    $7aa3
27a6 21e320    ld      hl,$20e3
27a9 cba6      res     4,(hl)
27ab fde1      pop     iy
27ad dde1      pop     ix
27af e1        pop     hl
27b0 d1        pop     de
27b1 c1        pop     bc
27b2 c9        ret     

27b3 00        nop     
27b4 00        nop     
27b5 00        nop     
27b6 00        nop     
27b7 00        nop     
27b8 c5        push    bc
27b9 d5        push    de
27ba e5        push    hl
27bb 114721    ld      de,$2147
27be 218000    ld      hl,$0080
27c1 cdcb27    call    $27cb
27c4 e5        push    hl
27c5 dde1      pop     ix
27c7 e1        pop     hl
27c8 d1        pop     de
27c9 c1        pop     bc
27ca c9        ret     

27cb c5        push    bc
27cc d5        push    de
27cd dde5      push    ix
27cf d5        push    de
27d0 54        ld      d,h
27d1 5d        ld      e,l
27d2 cde328    call    $28e3
27d5 d1        pop     de
27d6 0e14      ld      c,$14
27d8 cd0500    call    $0005
27db fe02      cp      $02
27dd 284a      jr      z,$2829
27df fe01      cp      $01
27e1 284d      jr      z,$2830
27e3 3a1e27    ld      a,($271e)
27e6 fe01      cp      $01
27e8 203b      jr      nz,$2825
27ea 97        sub     a
27eb 321e27    ld      ($271e),a
27ee d5        push    de
27ef dde1      pop     ix
27f1 dd7e20    ld      a,(ix+$20)
27f4 fe01      cp      $01
27f6 202d      jr      nz,$2825
27f8 dd7e0c    ld      a,(ix+$0c)
27fb b7        or      a
27fc 2027      jr      nz,$2825
27fe 7e        ld      a,(hl)
27ff b7        or      a
2800 281b      jr      z,$281d
2802 fe01      cp      $01
2804 2817      jr      z,$281d
2806 fe02      cp      $02
2808 201b      jr      nz,$2825
280a 0e14      ld      c,$14
280c cd0500    call    $0005
280f cd0500    call    $0005
2812 fe02      cp      $02
2814 2813      jr      z,$2829
2816 fe01      cp      $01
2818 2816      jr      z,$2830
281a 97        sub     a
281b 181a      jr      $2837
281d 014800    ld      bc,$0048
2820 09        add     hl,bc
2821 3e02      ld      a,$02
2823 1812      jr      $2837
2825 3e03      ld      a,$03
2827 180e      jr      $2837
2829 dd21cac8  ld      ix,$c8ca
282d cd463f    call    $3f46
2830 0e10      ld      c,$10
2832 cd0500    call    $0005
2835 3e01      ld      a,$01
2837 dde1      pop     ix
2839 d1        pop     de
283a c1        pop     bc
283b c9        ret     

283c c5        push    bc
283d d5        push    de
283e e5        push    hl
283f dde5      push    ix
2841 cdd828    call    $28d8
2844 116229    ld      de,$2962
2847 cde328    call    $28e3
284a 116821    ld      de,$2168
284d cdcf20    call    $20cf
2850 feff      cp      $ff
2852 2004      jr      nz,$2858
2854 3e02      ld      a,$02
2856 1806      jr      $285e
2858 3e01      ld      a,$01
285a 321e27    ld      ($271e),a
285d 97        sub     a
285e dde1      pop     ix
2860 e1        pop     hl
2861 d1        pop     de
2862 c1        pop     bc
2863 c9        ret     

2864 c5        push    bc
2865 d5        push    de
2866 e5        push    hl
2867 01e229    ld      bc,$29e2
286a 3a1e27    ld      a,($271e)
286d fe01      cp      $01
286f 200f      jr      nz,$2880
2871 116821    ld      de,$2168
2874 216229    ld      hl,$2962
2877 cdcb27    call    $27cb
287a fe01      cp      $01
287c 2816      jr      z,$2894
287e 1804      jr      $2884
2880 2ae229    ld      hl,($29e2)
2883 23        inc     hl
2884 22e229    ld      ($29e2),hl
2887 7c        ld      a,h
2888 b8        cp      b
2889 2002      jr      nz,$288d
288b 7d        ld      a,l
288c b9        cp      c
288d 30e2      jr      nc,$2871
288f 7e        ld      a,(hl)
2890 fe1a      cp      $1a
2892 28dd      jr      z,$2871
2894 f5        push    af
2895 cdeb28    call    $28eb
2898 f1        pop     af
2899 e1        pop     hl
289a d1        pop     de
289b c1        pop     bc
289c c9        ret     

289d e5        push    hl
289e c5        push    bc
289f 2ae229    ld      hl,($29e2)
28a2 016129    ld      bc,$2961
28a5 b7        or      a
28a6 ed42      sbc     hl,bc
28a8 2808      jr      z,$28b2
28aa 2ae229    ld      hl,($29e2)
28ad 77        ld      (hl),a
28ae 2b        dec     hl
28af 22e229    ld      ($29e2),hl
28b2 c1        pop     bc
28b3 e1        pop     hl
28b4 c9        ret     

28b5 cdd828    call    $28d8
28b8 cd4a20    call    $204a
28bb 326821    ld      ($2168),a
28be 21752c    ld      hl,$2c75
28c1 117121    ld      de,$2171
28c4 010300    ld      bc,$0003
28c7 edb0      ldir    
28c9 c9        ret     

28ca c5        push    bc
28cb fde5      push    iy
28cd e1        pop     hl
28ce 114721    ld      de,$2147
28d1 0e86      ld      c,$86
28d3 cd0500    call    $0005
28d6 c1        pop     bc
28d7 c9        ret     

28d8 fde5      push    iy
28da e1        pop     hl
28db 116821    ld      de,$2168
28de 0e86      ld      c,$86
28e0 c30500    jp      $0005
28e3 c5        push    bc
28e4 0e1a      ld      c,$1a
28e6 cd0500    call    $0005
28e9 c1        pop     bc
28ea c9        ret     

28eb d5        push    de
28ec 118000    ld      de,$0080
28ef cde328    call    $28e3
28f2 d1        pop     de
28f3 c9        ret     

28f4 dd2118c9  ld      ix,$c918
28f8 cd132a    call    $2a13
28fb b7        or      a
28fc c8        ret     z

28fd 21e429    ld      hl,$29e4
2900 cda88d    call    $8da8
2903 dd216dc9  ld      ix,$c96d
2907 fd215529  ld      iy,$2955
290b 0e0d      ld      c,$0d
290d cddc8c    call    $8cdc
2910 b7        or      a
2911 c8        ret     z

2912 78        ld      a,b
2913 fe0d      cp      $0d
2915 3806      jr      c,$291d
2917 dd21e4c8  ld      ix,$c8e4
291b 1829      jr      $2946
291d fde5      push    iy
291f e1        pop     hl
2920 115721    ld      de,$2157
2923 0e86      ld      c,$86
2925 cd0500    call    $0005
2928 215721    ld      hl,$2157
292b 110420    ld      de,$2004
292e cd361e    call    $1e36
2931 3806      jr      c,$2939
2933 dd2143c9  ld      ix,$c943
2937 180d      jr      $2946
2939 114721    ld      de,$2147
293c cdde20    call    $20de
293f b7        or      a
2940 2010      jr      nz,$2952
2942 dd21fbc8  ld      ix,$c8fb
2946 04        inc     b
2947 cdd38c    call    $8cd3
294a cd463f    call    $3f46
294d cde989    call    $89e9
2950 18b1      jr      $2903
2952 c3b01c    jp      $1cb0
2955 00        nop     
2956 00        nop     
2957 00        nop     
2958 00        nop     
2959 00        nop     
295a 00        nop     
295b 00        nop     
295c 00        nop     
295d 00        nop     
295e 00        nop     
295f 00        nop     
2960 00        nop     
2961 00        nop     
2962 00        nop     
2963 00        nop     
2964 00        nop     
2965 00        nop     
2966 00        nop     
2967 00        nop     
2968 00        nop     
2969 00        nop     
296a 00        nop     
296b 00        nop     
296c 00        nop     
296d 00        nop     
296e 00        nop     
296f 00        nop     
2970 00        nop     
2971 00        nop     
2972 00        nop     
2973 00        nop     
2974 00        nop     
2975 00        nop     
2976 00        nop     
2977 00        nop     
2978 00        nop     
2979 00        nop     
297a 00        nop     
297b 00        nop     
297c 00        nop     
297d 00        nop     
297e 00        nop     
297f 00        nop     
2980 00        nop     
2981 00        nop     
2982 00        nop     
2983 00        nop     
2984 00        nop     
2985 00        nop     
2986 00        nop     
2987 00        nop     
2988 00        nop     
2989 00        nop     
298a 00        nop     
298b 00        nop     
298c 00        nop     
298d 00        nop     
298e 00        nop     
298f 00        nop     
2990 00        nop     
2991 00        nop     
2992 00        nop     
2993 00        nop     
2994 00        nop     
2995 00        nop     
2996 00        nop     
2997 00        nop     
2998 00        nop     
2999 00        nop     
299a 00        nop     
299b 00        nop     
299c 00        nop     
299d 00        nop     
299e 00        nop     
299f 00        nop     
29a0 00        nop     
29a1 00        nop     
29a2 00        nop     
29a3 00        nop     
29a4 00        nop     
29a5 00        nop     
29a6 00        nop     
29a7 00        nop     
29a8 00        nop     
29a9 00        nop     
29aa 00        nop     
29ab 00        nop     
29ac 00        nop     
29ad 00        nop     
29ae 00        nop     
29af 00        nop     
29b0 00        nop     
29b1 00        nop     
29b2 00        nop     
29b3 00        nop     
29b4 00        nop     
29b5 00        nop     
29b6 00        nop     
29b7 00        nop     
29b8 00        nop     
29b9 00        nop     
29ba 00        nop     
29bb 00        nop     
29bc 00        nop     
29bd 00        nop     
29be 00        nop     
29bf 00        nop     
29c0 00        nop     
29c1 00        nop     
29c2 00        nop     
29c3 00        nop     
29c4 00        nop     
29c5 00        nop     
29c6 00        nop     
29c7 00        nop     
29c8 00        nop     
29c9 00        nop     
29ca 00        nop     
29cb 00        nop     
29cc 00        nop     
29cd 00        nop     
29ce 00        nop     
29cf 00        nop     
29d0 00        nop     
29d1 00        nop     
29d2 00        nop     
29d3 00        nop     
29d4 00        nop     
29d5 00        nop     
29d6 00        nop     
29d7 00        nop     
29d8 00        nop     
29d9 00        nop     
29da 00        nop     
29db 00        nop     
29dc 00        nop     
29dd 00        nop     
29de 00        nop     
29df 00        nop     
29e0 00        nop     
29e1 00        nop     
29e2 00        nop     
29e3 00        nop     
29e4 74        ld      (hl),h
29e5 6f        ld      l,a
29e6 2024      jr      nz,$2a0c
29e8 c5        push    bc
29e9 fde5      push    iy
29eb fd215529  ld      iy,$2955
29ef cd2c24    call    $242c
29f2 47        ld      b,a
29f3 04        inc     b
29f4 fde5      push    iy
29f6 dde1      pop     ix
29f8 fde1      pop     iy
29fa cd8889    call    $8988
29fd c1        pop     bc
29fe c9        ret     

29ff dd211fca  ld      ix,$ca1f
2a03 cd132a    call    $2a13
2a06 b7        or      a
2a07 c8        ret     z

2a08 0e13      ld      c,$13
2a0a cd0500    call    $0005
2a0d cdb01c    call    $1cb0
2a10 3e01      ld      a,$01
2a12 c9        ret     

2a13 dde5      push    ix
2a15 dd212d9a  ld      ix,$9a2d
2a19 21e2c4    ld      hl,$c4e2
2a1c cd3988    call    $8839
2a1f dde1      pop     ix
2a21 b7        or      a
2a22 c8        ret     z

2a23 cdca28    call    $28ca
2a26 cdc233    call    $33c2
2a29 2814      jr      z,$2a3f
2a2b cde829    call    $29e8
2a2e 200f      jr      nz,$2a3f
2a30 cdd38c    call    $8cd3
2a33 dd211fca  ld      ix,$ca1f
2a37 cd463f    call    $3f46
2a3a cde989    call    $89e9
2a3d 18d4      jr      $2a13
2a3f 3e01      ld      a,$01
2a41 c9        ret     

2a42 c5        push    bc
2a43 d5        push    de
2a44 e5        push    hl
2a45 21e320    ld      hl,$20e3
2a48 cbee      set     5,(hl)
2a4a 116821    ld      de,$2168
2a4d cdd420    call    $20d4
2a50 feff      cp      $ff
2a52 2809      jr      z,$2a5d
2a54 0e0f      ld      c,$0f
2a56 cd0500    call    $0005
2a59 feff      cp      $ff
2a5b 2006      jr      nz,$2a63
2a5d 21e320    ld      hl,$20e3
2a60 cbae      res     5,(hl)
2a62 97        sub     a
2a63 e1        pop     hl
2a64 d1        pop     de
2a65 c1        pop     bc
2a66 c9        ret     

2a67 c5        push    bc
2a68 d5        push    de
2a69 cdb528    call    $28b5
2a6c 116821    ld      de,$2168
2a6f 0e13      ld      c,$13
2a71 cd0500    call    $0005
2a74 d1        pop     de
2a75 c1        pop     bc
2a76 c9        ret     

2a77 c5        push    bc
2a78 d5        push    de
2a79 e5        push    hl
2a7a 116229    ld      de,$2962
2a7d cde328    call    $28e3
2a80 016229    ld      bc,$2962
2a83 2a152c    ld      hl,($2c15)
2a86 7c        ld      a,h
2a87 b8        cp      b
2a88 2002      jr      nz,$2a8c
2a8a 7d        ld      a,l
2a8b b9        cp      c
2a8c 2810      jr      z,$2a9e
2a8e ed43152c  ld      ($2c15),bc
2a92 01e229    ld      bc,$29e2
2a95 cde42a    call    $2ae4
2a98 116821    ld      de,$2168
2a9b cdc520    call    $20c5
2a9e 116821    ld      de,$2168
2aa1 cdd920    call    $20d9
2aa4 21e320    ld      hl,$20e3
2aa7 cbae      res     5,(hl)
2aa9 cdeb28    call    $28eb
2aac e1        pop     hl
2aad d1        pop     de
2aae c1        pop     bc
2aaf c9        ret     

2ab0 c5        push    bc
2ab1 d5        push    de
2ab2 e5        push    hl
2ab3 11f12a    ld      de,$2af1
2ab6 cde328    call    $28e3
2ab9 01f12a    ld      bc,$2af1
2abc 2a712b    ld      hl,($2b71)
2abf 7c        ld      a,h
2ac0 b8        cp      b
2ac1 2002      jr      nz,$2ac5
2ac3 7d        ld      a,l
2ac4 b9        cp      c
2ac5 2810      jr      z,$2ad7
2ac7 ed43712b  ld      ($2b71),bc
2acb 01712b    ld      bc,$2b71
2ace cde42a    call    $2ae4
2ad1 118921    ld      de,$2189
2ad4 cdc520    call    $20c5
2ad7 118921    ld      de,$2189
2ada cdd920    call    $20d9
2add cdeb28    call    $28eb
2ae0 e1        pop     hl
2ae1 d1        pop     de
2ae2 c1        pop     bc
2ae3 c9        ret     

2ae4 7c        ld      a,h
2ae5 b8        cp      b
2ae6 2002      jr      nz,$2aea
2ae8 7d        ld      a,l
2ae9 b9        cp      c
2aea d0        ret     nc

2aeb 3e1a      ld      a,$1a
2aed 77        ld      (hl),a
2aee 23        inc     hl
2aef 18f3      jr      $2ae4
2af1 00        nop     
2af2 00        nop     
2af3 00        nop     
2af4 00        nop     
2af5 00        nop     
2af6 00        nop     
2af7 00        nop     
2af8 00        nop     
2af9 00        nop     
2afa 00        nop     
2afb 00        nop     
2afc 00        nop     
2afd 00        nop     
2afe 00        nop     
2aff 00        nop     
2b00 00        nop     
2b01 00        nop     
2b02 00        nop     
2b03 00        nop     
2b04 00        nop     
2b05 00        nop     
2b06 00        nop     
2b07 00        nop     
2b08 00        nop     
2b09 00        nop     
2b0a 00        nop     
2b0b 00        nop     
2b0c 00        nop     
2b0d 00        nop     
2b0e 00        nop     
2b0f 00        nop     
2b10 00        nop     
2b11 00        nop     
2b12 00        nop     
2b13 00        nop     
2b14 00        nop     
2b15 00        nop     
2b16 00        nop     
2b17 00        nop     
2b18 00        nop     
2b19 00        nop     
2b1a 00        nop     
2b1b 00        nop     
2b1c 00        nop     
2b1d 00        nop     
2b1e 00        nop     
2b1f 00        nop     
2b20 00        nop     
2b21 00        nop     
2b22 00        nop     
2b23 00        nop     
2b24 00        nop     
2b25 00        nop     
2b26 00        nop     
2b27 00        nop     
2b28 00        nop     
2b29 00        nop     
2b2a 00        nop     
2b2b 00        nop     
2b2c 00        nop     
2b2d 00        nop     
2b2e 00        nop     
2b2f 00        nop     
2b30 00        nop     
2b31 00        nop     
2b32 00        nop     
2b33 00        nop     
2b34 00        nop     
2b35 00        nop     
2b36 00        nop     
2b37 00        nop     
2b38 00        nop     
2b39 00        nop     
2b3a 00        nop     
2b3b 00        nop     
2b3c 00        nop     
2b3d 00        nop     
2b3e 00        nop     
2b3f 00        nop     
2b40 00        nop     
2b41 00        nop     
2b42 00        nop     
2b43 00        nop     
2b44 00        nop     
2b45 00        nop     
2b46 00        nop     
2b47 00        nop     
2b48 00        nop     
2b49 00        nop     
2b4a 00        nop     
2b4b 00        nop     
2b4c 00        nop     
2b4d 00        nop     
2b4e 00        nop     
2b4f 00        nop     
2b50 00        nop     
2b51 00        nop     
2b52 00        nop     
2b53 00        nop     
2b54 00        nop     
2b55 00        nop     
2b56 00        nop     
2b57 00        nop     
2b58 00        nop     
2b59 00        nop     
2b5a 00        nop     
2b5b 00        nop     
2b5c 00        nop     
2b5d 00        nop     
2b5e 00        nop     
2b5f 00        nop     
2b60 00        nop     
2b61 00        nop     
2b62 00        nop     
2b63 00        nop     
2b64 00        nop     
2b65 00        nop     
2b66 00        nop     
2b67 00        nop     
2b68 00        nop     
2b69 00        nop     
2b6a 00        nop     
2b6b 00        nop     
2b6c 00        nop     
2b6d 00        nop     
2b6e 00        nop     
2b6f 00        nop     
2b70 00        nop     
2b71 f1        pop     af
2b72 2afde5    ld      hl,($e5fd)
2b75 fd21304c  ld      iy,$4c30
2b79 fde5      push    iy
2b7b e1        pop     hl
2b7c 7e        ld      a,(hl)
2b7d cd8d90    call    $908d
2b80 23        inc     hl
2b81 362f      ld      (hl),$2f
2b83 3e20      ld      a,$20
2b85 fd23      inc     iy
2b87 fdbe00    cp      (iy+$00)
2b8a 28f9      jr      z,$2b85
2b8c fde5      push    iy
2b8e e1        pop     hl
2b8f 118921    ld      de,$2189
2b92 0e86      ld      c,$86
2b94 cd0500    call    $0005
2b97 cdb92b    call    $2bb9
2b9a fde1      pop     iy
2b9c c9        ret     

2b9d cdd828    call    $28d8
2ba0 c3422a    jp      $2a42
2ba3 fde5      push    iy
2ba5 e1        pop     hl
2ba6 118921    ld      de,$2189
2ba9 0e86      ld      c,$86
2bab cd0500    call    $0005
2bae 21d22b    ld      hl,$2bd2
2bb1 119221    ld      de,$2192
2bb4 010300    ld      bc,$0003
2bb7 edb0      ldir    
2bb9 cd4a20    call    $204a
2bbc 328921    ld      ($2189),a
2bbf 118921    ld      de,$2189
2bc2 0e13      ld      c,$13
2bc4 cd0500    call    $0005
2bc7 0e16      ld      c,$16
2bc9 cd0500    call    $0005
2bcc 0e0f      ld      c,$0f
2bce c30500    jp      $0005
2bd1 2e50      ld      l,$50
2bd3 52        ld      d,d
2bd4 54        ld      d,h
2bd5 00        nop     
2bd6 c5        push    bc
2bd7 d5        push    de
2bd8 e5        push    hl
2bd9 32142c    ld      ($2c14),a
2bdc 01e229    ld      bc,$29e2
2bdf 2a152c    ld      hl,($2c15)
2be2 77        ld      (hl),a
2be3 23        inc     hl
2be4 22152c    ld      ($2c15),hl
2be7 7c        ld      a,h
2be8 b8        cp      b
2be9 2002      jr      nz,$2bed
2beb 7d        ld      a,l
2bec b9        cp      c
2bed 381d      jr      c,$2c0c
2bef 116229    ld      de,$2962
2bf2 cde328    call    $28e3
2bf5 116821    ld      de,$2168
2bf8 cdc520    call    $20c5
2bfb f5        push    af
2bfc cdeb28    call    $28eb
2bff f1        pop     af
2c00 b7        or      a
2c01 2803      jr      z,$2c06
2c03 97        sub     a
2c04 180a      jr      $2c10
2c06 216229    ld      hl,$2962
2c09 22152c    ld      ($2c15),hl
2c0c 3a142c    ld      a,($2c14)
2c0f b7        or      a
2c10 e1        pop     hl
2c11 d1        pop     de
2c12 c1        pop     bc
2c13 c9        ret     

2c14 00        nop     
2c15 62        ld      h,d
2c16 29        add     hl,hl
2c17 c5        push    bc
2c18 d5        push    de
2c19 e5        push    hl
2c1a 32142c    ld      ($2c14),a
2c1d 01712b    ld      bc,$2b71
2c20 2a712b    ld      hl,($2b71)
2c23 77        ld      (hl),a
2c24 23        inc     hl
2c25 22712b    ld      ($2b71),hl
2c28 7c        ld      a,h
2c29 b8        cp      b
2c2a 2002      jr      nz,$2c2e
2c2c 7d        ld      a,l
2c2d b9        cp      c
2c2e 38dc      jr      c,$2c0c
2c30 11f12a    ld      de,$2af1
2c33 cde328    call    $28e3
2c36 118921    ld      de,$2189
2c39 cdc520    call    $20c5
2c3c f5        push    af
2c3d cdeb28    call    $28eb
2c40 f1        pop     af
2c41 b7        or      a
2c42 2803      jr      z,$2c47
2c44 97        sub     a
2c45 18c9      jr      $2c10
2c47 21f12a    ld      hl,$2af1
2c4a 22712b    ld      ($2b71),hl
2c4d 18bd      jr      $2c0c
2c4f c5        push    bc
2c50 d5        push    de
2c51 e5        push    hl
2c52 cd682c    call    $2c68
2c55 cdfc26    call    $26fc
2c58 e1        pop     hl
2c59 d1        pop     de
2c5a c1        pop     bc
2c5b c9        ret     

2c5c e5        push    hl
2c5d cd682c    call    $2c68
2c60 210000    ld      hl,$0000
2c63 cdc02c    call    $2cc0
2c66 e1        pop     hl
2c67 c9        ret     

2c68 dde5      push    ix
2c6a dd21742c  ld      ix,$2c74
2c6e cd792c    call    $2c79
2c71 dde1      pop     ix
2c73 c9        ret     

2c74 2e24      ld      l,$24
2c76 54        ld      d,h
2c77 46        ld      b,(hl)
2c78 00        nop     
2c79 f5        push    af
2c7a c5        push    bc
2c7b d5        push    de
2c7c e5        push    hl
2c7d fde5      push    iy
2c7f e1        pop     hl
2c80 010b00    ld      bc,$000b
2c83 97        sub     a
2c84 edb1      cpir    
2c86 2b        dec     hl
2c87 54        ld      d,h
2c88 5d        ld      e,l
2c89 dde5      push    ix
2c8b e1        pop     hl
2c8c 010500    ld      bc,$0005
2c8f edb0      ldir    
2c91 e1        pop     hl
2c92 d1        pop     de
2c93 c1        pop     bc
2c94 f1        pop     af
2c95 c9        ret     

2c96 c5        push    bc
2c97 d5        push    de
2c98 e5        push    hl
2c99 3a2721    ld      a,($2127)
2c9c fe2d      cp      $2d
2c9e 2808      jr      z,$2ca8
2ca0 112621    ld      de,$2126
2ca3 0e13      ld      c,$13
2ca5 cd0500    call    $0005
2ca8 e1        pop     hl
2ca9 d1        pop     de
2caa c1        pop     bc
2cab c9        ret     

2cac c5        push    bc
2cad d5        push    de
2cae 3a0621    ld      a,($2106)
2cb1 fe2d      cp      $2d
2cb3 2808      jr      z,$2cbd
2cb5 110521    ld      de,$2105
2cb8 0e13      ld      c,$13
2cba cd0500    call    $0005
2cbd d1        pop     de
2cbe c1        pop     bc
2cbf c9        ret     

2cc0 c5        push    bc
2cc1 d5        push    de
2cc2 e5        push    hl
2cc3 e5        push    hl
2cc4 fde5      push    iy
2cc6 e1        pop     hl
2cc7 cd3c28    call    $283c
2cca e1        pop     hl
2ccb b7        or      a
2ccc c2542d    jp      nz,$2d54
2ccf cd3e8a    call    $8a3e
2cd2 cd4a8a    call    $8a4a
2cd5 7c        ld      a,h
2cd6 b5        or      l
2cd7 c4d73f    call    nz,$3fd7
2cda 0617      ld      b,$17
2cdc 2601      ld      h,$01
2cde cd6428    call    $2864
2ce1 6f        ld      l,a
2ce2 fe01      cp      $01
2ce4 2874      jr      z,$2d5a
2ce6 fe0a      cp      $0a
2ce8 280c      jr      z,$2cf6
2cea fe0d      cp      $0d
2cec 201a      jr      nz,$2d08
2cee cd6428    call    $2864
2cf1 fe0a      cp      $0a
2cf3 c49d28    call    nz,$289d
2cf6 05        dec     b
2cf7 2805      jr      z,$2cfe
2cf9 cd6202    call    $0262
2cfc 18de      jr      $2cdc
2cfe cde03e    call    $3ee0
2d01 285a      jr      z,$2d5d
2d03 cd6202    call    $0262
2d06 18d2      jr      $2cda
2d08 fea0      cp      $a0
2d0a 2809      jr      z,$2d15
2d0c fead      cp      $ad
2d0e 2805      jr      z,$2d15
2d10 cde290    call    $90e2
2d13 301e      jr      nc,$2d33
2d15 24        inc     h
2d16 7c        ld      a,h
2d17 fe51      cp      $51
2d19 3005      jr      nc,$2d20
2d1b cd682d    call    $2d68
2d1e 18be      jr      $2cde
2d20 05        dec     b
2d21 2805      jr      z,$2d28
2d23 cd682d    call    $2d68
2d26 18b4      jr      $2cdc
2d28 cdce03    call    $03ce
2d2b cd4583    call    $8345
2d2e cdf203    call    $03f2
2d31 18cb      jr      $2cfe
2d33 fe09      cp      $09
2d35 2011      jr      nz,$2d48
2d37 3e08      ld      a,$08
2d39 25        dec     h
2d3a 84        add     a,h
2d3b e6f8      and     $f8
2d3d 67        ld      h,a
2d3e 24        inc     h
2d3f fe51      cp      $51
2d41 3099      jr      nc,$2cdc
2d43 cd682d    call    $2d68
2d46 1896      jr      $2cde
2d48 fe0c      cp      $0c
2d4a 2092      jr      nz,$2cde
2d4c cd6404    call    $0464
2d4f cd6202    call    $0262
2d52 1888      jr      $2cdc
2d54 cd463f    call    $3f46
2d57 37        scf     
2d58 180a      jr      $2d64
2d5a cdc93e    call    $3ec9
2d5d cd528a    call    $8a52
2d60 cd0534    call    $3405
2d63 b7        or      a
2d64 e1        pop     hl
2d65 d1        pop     de
2d66 c1        pop     bc
2d67 c9        ret     

2d68 5d        ld      e,l
2d69 0e02      ld      c,$02
2d6b cd0500    call    $0005
2d6e c9        ret     

2d6f f5        push    af
2d70 c5        push    bc
2d71 d5        push    de
2d72 e5        push    hl
2d73 216821    ld      hl,$2168
2d76 11d12d    ld      de,$2dd1
2d79 012100    ld      bc,$0021
2d7c edb0      ldir    
2d7e 216229    ld      hl,$2962
2d81 11f22d    ld      de,$2df2
2d84 018000    ld      bc,$0080
2d87 edb0      ldir    
2d89 3a1e27    ld      a,($271e)
2d8c 32722e    ld      ($2e72),a
2d8f 2ae229    ld      hl,($29e2)
2d92 22732e    ld      ($2e73),hl
2d95 2a152c    ld      hl,($2c15)
2d98 22752e    ld      ($2e75),hl
2d9b e1        pop     hl
2d9c d1        pop     de
2d9d c1        pop     bc
2d9e f1        pop     af
2d9f c9        ret     

2da0 f5        push    af
2da1 c5        push    bc
2da2 d5        push    de
2da3 e5        push    hl
2da4 21d12d    ld      hl,$2dd1
2da7 116821    ld      de,$2168
2daa 012100    ld      bc,$0021
2dad edb0      ldir    
2daf 21f22d    ld      hl,$2df2
2db2 116229    ld      de,$2962
2db5 018000    ld      bc,$0080
2db8 edb0      ldir    
2dba 3a722e    ld      a,($2e72)
2dbd 321e27    ld      ($271e),a
2dc0 2a732e    ld      hl,($2e73)
2dc3 22e229    ld      ($29e2),hl
2dc6 2a752e    ld      hl,($2e75)
2dc9 22152c    ld      ($2c15),hl
2dcc e1        pop     hl
2dcd d1        pop     de
2dce c1        pop     bc
2dcf f1        pop     af
2dd0 c9        ret     

2dd1 00        nop     
2dd2 00        nop     
2dd3 00        nop     
2dd4 00        nop     
2dd5 00        nop     
2dd6 00        nop     
2dd7 00        nop     
2dd8 00        nop     
2dd9 00        nop     
2dda 00        nop     
2ddb 00        nop     
2ddc 00        nop     
2ddd 00        nop     
2dde 00        nop     
2ddf 00        nop     
2de0 00        nop     
2de1 00        nop     
2de2 00        nop     
2de3 00        nop     
2de4 00        nop     
2de5 00        nop     
2de6 00        nop     
2de7 00        nop     
2de8 00        nop     
2de9 00        nop     
2dea 00        nop     
2deb 00        nop     
2dec 00        nop     
2ded 00        nop     
2dee 00        nop     
2def 00        nop     
2df0 00        nop     
2df1 00        nop     
2df2 00        nop     
2df3 00        nop     
2df4 00        nop     
2df5 00        nop     
2df6 00        nop     
2df7 00        nop     
2df8 00        nop     
2df9 00        nop     
2dfa 00        nop     
2dfb 00        nop     
2dfc 00        nop     
2dfd 00        nop     
2dfe 00        nop     
2dff 00        nop     
2e00 00        nop     
2e01 00        nop     
2e02 00        nop     
2e03 00        nop     
2e04 00        nop     
2e05 00        nop     
2e06 00        nop     
2e07 00        nop     
2e08 00        nop     
2e09 00        nop     
2e0a 00        nop     
2e0b 00        nop     
2e0c 00        nop     
2e0d 00        nop     
2e0e 00        nop     
2e0f 00        nop     
2e10 00        nop     
2e11 00        nop     
2e12 00        nop     
2e13 00        nop     
2e14 00        nop     
2e15 00        nop     
2e16 00        nop     
2e17 00        nop     
2e18 00        nop     
2e19 00        nop     
2e1a 00        nop     
2e1b 00        nop     
2e1c 00        nop     
2e1d 00        nop     
2e1e 00        nop     
2e1f 00        nop     
2e20 00        nop     
2e21 00        nop     
2e22 00        nop     
2e23 00        nop     
2e24 00        nop     
2e25 00        nop     
2e26 00        nop     
2e27 00        nop     
2e28 00        nop     
2e29 00        nop     
2e2a 00        nop     
2e2b 00        nop     
2e2c 00        nop     
2e2d 00        nop     
2e2e 00        nop     
2e2f 00        nop     
2e30 00        nop     
2e31 00        nop     
2e32 00        nop     
2e33 00        nop     
2e34 00        nop     
2e35 00        nop     
2e36 00        nop     
2e37 00        nop     
2e38 00        nop     
2e39 00        nop     
2e3a 00        nop     
2e3b 00        nop     
2e3c 00        nop     
2e3d 00        nop     
2e3e 00        nop     
2e3f 00        nop     
2e40 00        nop     
2e41 00        nop     
2e42 00        nop     
2e43 00        nop     
2e44 00        nop     
2e45 00        nop     
2e46 00        nop     
2e47 00        nop     
2e48 00        nop     
2e49 00        nop     
2e4a 00        nop     
2e4b 00        nop     
2e4c 00        nop     
2e4d 00        nop     
2e4e 00        nop     
2e4f 00        nop     
2e50 00        nop     
2e51 00        nop     
2e52 00        nop     
2e53 00        nop     
2e54 00        nop     
2e55 00        nop     
2e56 00        nop     
2e57 00        nop     
2e58 00        nop     
2e59 00        nop     
2e5a 00        nop     
2e5b 00        nop     
2e5c 00        nop     
2e5d 00        nop     
2e5e 00        nop     
2e5f 00        nop     
2e60 00        nop     
2e61 00        nop     
2e62 00        nop     
2e63 00        nop     
2e64 00        nop     
2e65 00        nop     
2e66 00        nop     
2e67 00        nop     
2e68 00        nop     
2e69 00        nop     
2e6a 00        nop     
2e6b 00        nop     
2e6c 00        nop     
2e6d 00        nop     
2e6e 00        nop     
2e6f 00        nop     
2e70 00        nop     
2e71 00        nop     
2e72 00        nop     
2e73 00        nop     
2e74 00        nop     
2e75 00        nop     
2e76 00        nop     
2e77 fd21c331  ld      iy,$31c3
2e7b cdda8e    call    $8eda
2e7e cdef42    call    $42ef
2e81 3c        inc     a
2e82 32f62f    ld      ($2ff6),a
2e85 32f72f    ld      ($2ff7),a
2e88 dd21e72f  ld      ix,$2fe7
2e8c cdf73e    call    $3ef7
2e8f cda430    call    $30a4
2e92 cda096    call    $96a0
2e95 fea0      cp      $a0
2e97 2017      jr      nz,$2eb0
2e99 cd6599    call    $9965
2e9c cd2694    call    $9426
2e9f cda096    call    $96a0
2ea2 fea0      cp      $a0
2ea4 28f6      jr      z,$2e9c
2ea6 cdc53c    call    $3cc5
2ea9 280a      jr      z,$2eb5
2eab cd0c3a    call    $3a0c
2eae 180e      jr      $2ebe
2eb0 cdc53c    call    $3cc5
2eb3 2009      jr      nz,$2ebe
2eb5 cd7e30    call    $307e
2eb8 cdf031    call    $31f0
2ebb cdcb30    call    $30cb
2ebe cdd23c    call    $3cd2
2ec1 cdc47f    call    $7fc4
2ec4 dae32f    jp      c,$2fe3
2ec7 cd2587    call    $8725
2eca 47        ld      b,a
2ecb 3af62f    ld      a,($2ff6)
2ece b8        cp      b
2ecf 286e      jr      z,$2f3f
2ed1 d27e2f    jp      nc,$2f7e
2ed4 cdad30    call    $30ad
2ed7 cd8843    call    $4388
2eda 280b      jr      z,$2ee7
2edc cd6032    call    $3260
2edf b7        or      a
2ee0 cae32f    jp      z,$2fe3
2ee3 fe02      cp      $02
2ee5 2810      jr      z,$2ef7
2ee7 cd2587    call    $8725
2eea 47        ld      b,a
2eeb cd147a    call    $7a14
2eee b8        cp      b
2eef 3806      jr      c,$2ef7
2ef1 cdd23c    call    $3cd2
2ef4 c37e2f    jp      $2f7e
2ef7 cd3784    call    $8437
2efa b7        or      a
2efb 2813      jr      z,$2f10
2efd cd2587    call    $8725
2f00 57        ld      d,a
2f01 cd973c    call    $3c97
2f04 fe20      cp      $20
2f06 c4c993    call    nz,$93c9
2f09 cd0d32    call    $320d
2f0c 42        ld      b,d
2f0d cd9c39    call    $399c
2f10 cd9e38    call    $389e
2f13 dae32f    jp      c,$2fe3
2f16 cdc731    call    $31c7
2f19 cdfa39    call    $39fa
2f1c cd8043    call    $4380
2f1f c4df30    call    nz,$30df
2f22 cde839    call    $39e8
2f25 cd3943    call    $4339
2f28 3d        dec     a
2f29 cdd531    call    $31d5
2f2c b7        or      a
2f2d c4a038    call    nz,$38a0
2f30 cdcb30    call    $30cb
2f33 cd0d32    call    $320d
2f36 cd9d31    call    $319d
2f39 d2df2f    jp      nc,$2fdf
2f3c c3d82f    jp      $2fd8
2f3f cd9d31    call    $319d
2f42 d2df2f    jp      nc,$2fdf
2f45 cd6d30    call    $306d
2f48 cd6696    call    $9666
2f4b fe0d      cp      $0d
2f4d 2021      jr      nz,$2f70
2f4f cdc993    call    $93c9
2f52 cd6696    call    $9666
2f55 fe0c      cp      $0c
2f57 2005      jr      nz,$2f5e
2f59 cdc993    call    $93c9
2f5c 1854      jr      $2fb2
2f5e cd9e30    call    $309e
2f61 204f      jr      nz,$2fb2
2f63 cdf82f    call    $2ff8
2f66 cd2694    call    $9426
2f69 cd9e30    call    $309e
2f6c 2044      jr      nz,$2fb2
2f6e 18a9      jr      $2f19
2f70 fe0a      cp      $0a
2f72 2083      jr      nz,$2ef7
2f74 cd6696    call    $9666
2f77 fe0c      cp      $0c
2f79 ccc993    call    z,$93c9
2f7c 1834      jr      $2fb2
2f7e cd9d31    call    $319d
2f81 d2df2f    jp      nc,$2fdf
2f84 cda096    call    $96a0
2f87 fe2d      cp      $2d
2f89 2807      jr      z,$2f92
2f8b fead      cp      $ad
2f8d 200b      jr      nz,$2f9a
2f8f cd5132    call    $3251
2f92 cdf82f    call    $2ff8
2f95 cddc37    call    $37dc
2f98 1803      jr      $2f9d
2f9a cd1f30    call    $301f
2f9d cd9d31    call    $319d
2fa0 303d      jr      nc,$2fdf
2fa2 cd9e30    call    $309e
2fa5 200b      jr      nz,$2fb2
2fa7 cda096    call    $96a0
2faa fe0a      cp      $0a
2fac 2804      jr      z,$2fb2
2fae fe0c      cp      $0c
2fb0 2026      jr      nz,$2fd8
2fb2 cda430    call    $30a4
2fb5 cd5330    call    $3053
2fb8 cd3943    call    $4339
2fbb 90        sub     b
2fbc 3d        dec     a
2fbd 4f        ld      c,a
2fbe cd9d31    call    $319d
2fc1 301c      jr      nc,$2fdf
2fc3 cd2694    call    $9426
2fc6 79        ld      a,c
2fc7 fe01      cp      $01
2fc9 280a      jr      z,$2fd5
2fcb fe50      cp      $50
2fcd 3006      jr      nc,$2fd5
2fcf cda038    call    $38a0
2fd2 cdd531    call    $31d5
2fd5 cdcb30    call    $30cb
2fd8 3af72f    ld      a,($2ff7)
2fdb b7        or      a
2fdc c2be2e    jp      nz,$2ebe
2fdf 3e01      ld      a,$01
2fe1 1801      jr      $2fe4
2fe3 97        sub     a
2fe4 c3ae86    jp      $86ae
2fe7 2e2e      ld      l,$2e
2fe9 2e41      ld      l,$41
2feb 6c        ld      l,h
2fec 69        ld      l,c
2fed 67        ld      h,a
2fee 6e        ld      l,(hl)
2fef 69        ld      l,c
2ff0 6e        ld      l,(hl)
2ff1 67        ld      h,a
2ff2 2e2e      ld      l,$2e
2ff4 2e24      ld      l,$24
2ff6 00        nop     
2ff7 00        nop     
2ff8 0600      ld      b,$00
2ffa cd9d31    call    $319d
2ffd d0        ret     nc

2ffe cd6d30    call    $306d
3001 cdc993    call    $93c9
3004 cd9d31    call    $319d
3007 d0        ret     nc

3008 fe0d      cp      $0d
300a c0        ret     nz

300b cd9e30    call    $309e
300e c0        ret     nz

300f cd6696    call    $9666
3012 fe0c      cp      $0c
3014 2003      jr      nz,$3019
3016 c3c993    jp      $93c9
3019 cd5132    call    $3251
301c 04        inc     b
301d 18db      jr      $2ffa
301f cdf82f    call    $2ff8
3022 cd9d31    call    $319d
3025 d0        ret     nc

3026 c5        push    bc
3027 cd9e30    call    $309e
302a 2025      jr      nz,$3051
302c cda096    call    $96a0
302f fe0a      cp      $0a
3031 281e      jr      z,$3051
3033 fe0c      cp      $0c
3035 281a      jr      z,$3051
3037 cd2694    call    $9426
303a cda096    call    $96a0
303d fe20      cp      $20
303f 2810      jr      z,$3051
3041 cd3784    call    $8437
3044 b7        or      a
3045 c46696    call    nz,$9666
3048 cdc538    call    $38c5
304b cdc731    call    $31c7
304e cdc993    call    $93c9
3051 c1        pop     bc
3052 c9        ret     

3053 97        sub     a
3054 47        ld      b,a
3055 cd9d31    call    $319d
3058 d0        ret     nc

3059 cd6d30    call    $306d
305c cdc993    call    $93c9
305f fe0d      cp      $0d
3061 c0        ret     nz

3062 04        inc     b
3063 cd6696    call    $9666
3066 fe0c      cp      $0c
3068 ccc993    call    z,$93c9
306b 18e8      jr      $3055
306d cd7e30    call    $307e
3070 cdf031    call    $31f0
3073 cd6696    call    $9666
3076 fe20      cp      $20
3078 c0        ret     nz

3079 cdc993    call    $93c9
307c 18ef      jr      $306d
307e cd6696    call    $9666
3081 0e00      ld      c,$00
3083 cd6599    call    $9965
3086 cdc993    call    $93c9
3089 fea0      cp      $a0
308b 2003      jr      nz,$3090
308d 0c        inc     c
308e 18f6      jr      $3086
3090 b7        or      a
3091 2809      jr      z,$309c
3093 cd0c3a    call    $3a0c
3096 0600      ld      b,$00
3098 79        ld      a,c
3099 cd5f97    call    $975f
309c 79        ld      a,c
309d c9        ret     

309e cd6696    call    $9666
30a1 c32e35    jp      $352e
30a4 cd9e30    call    $309e
30a7 c8        ret     z

30a8 cde839    call    $39e8
30ab 18f7      jr      $30a4
30ad cd2694    call    $9426
30b0 cdb13c    call    $3cb1
30b3 2813      jr      z,$30c8
30b5 fe01      cp      $01
30b7 c8        ret     z

30b8 fe2d      cp      $2d
30ba 20f1      jr      nz,$30ad
30bc cd2587    call    $8725
30bf 47        ld      b,a
30c0 3af62f    ld      a,($2ff6)
30c3 b8        cp      b
30c4 38e7      jr      c,$30ad
30c6 28e5      jr      z,$30ad
30c8 c3c993    jp      $93c9
30cb cd6696    call    $9666
30ce fe0c      cp      $0c
30d0 c8        ret     z

30d1 cd147a    call    $7a14
30d4 3d        dec     a
30d5 c8        ret     z

30d6 cdc738    call    $38c7
30d9 d8        ret     c

30da cdd531    call    $31d5
30dd b7        or      a
30de c9        ret     

30df c5        push    bc
30e0 cda096    call    $96a0
30e3 fe21      cp      $21
30e5 3804      jr      c,$30eb
30e7 fe7f      cp      $7f
30e9 380f      jr      c,$30fa
30eb cde03c    call    $3ce0
30ee cdc53c    call    $3cc5
30f1 ca8931    jp      z,$3189
30f4 cd9231    call    $3192
30f7 da8931    jp      c,$3189
30fa cde03c    call    $3ce0
30fd cdc53c    call    $3cc5
3100 ca8931    jp      z,$3189
3103 cd9231    call    $3192
3106 da8931    jp      c,$3189
3109 cdcf39    call    $39cf
310c cd143d    call    $3d14
310f cdd23c    call    $3cd2
3112 cd2587    call    $8725
3115 3d        dec     a
3116 47        ld      b,a
3117 cdef42    call    $42ef
311a 90        sub     b
311b 286c      jr      z,$3189
311d 386a      jr      c,$3189
311f 47        ld      b,a
3120 cd3887    call    $8738
3123 4f        ld      c,a
3124 3a9131    ld      a,($3191)
3127 3c        inc     a
3128 329131    ld      ($3191),a
312b cb47      bit     0,a
312d 282d      jr      z,$315c
312f cd143d    call    $3d14
3132 cd2694    call    $9426
3135 cdc53c    call    $3cc5
3138 2831      jr      z,$316b
313a cda096    call    $96a0
313d fea0      cp      $a0
313f 28f1      jr      z,$3132
3141 fe20      cp      $20
3143 28ed      jr      z,$3132
3145 cdc53c    call    $3cc5
3148 281a      jr      z,$3164
314a cd9231    call    $3192
314d 380d      jr      c,$315c
314f cd6696    call    $9666
3152 cdc538    call    $38c5
3155 cdc731    call    $31c7
3158 10d5      djnz    $312f
315a 182a      jr      $3186
315c cdb639    call    $39b6
315f cd4933    call    $3349
3162 180a      jr      $316e
3164 cd147a    call    $7a14
3167 fe01      cp      $01
3169 2803      jr      z,$316e
316b cd063d    call    $3d06
316e cd063d    call    $3d06
3171 fe01      cp      $01
3173 2814      jr      z,$3189
3175 cd3887    call    $8738
3178 b9        cp      c
3179 20b4      jr      nz,$312f
317b cda096    call    $96a0
317e cdc538    call    $38c5
3181 cdc731    call    $31c7
3184 10e8      djnz    $316e
3186 37        scf     
3187 1801      jr      $318a
3189 b7        or      a
318a f5        push    af
318b cdcf39    call    $39cf
318e f1        pop     af
318f c1        pop     bc
3190 c9        ret     

3191 00        nop     
3192 c5        push    bc
3193 cd147a    call    $7a14
3196 47        ld      b,a
3197 cd2587    call    $8725
319a 90        sub     b
319b c1        pop     bc
319c c9        ret     

319d d5        push    de
319e e5        push    hl
319f 32c231    ld      ($31c2),a
31a2 21c631    ld      hl,$31c6
31a5 11289a    ld      de,$9a28
31a8 1a        ld      a,(de)
31a9 be        cp      (hl)
31aa 2010      jr      nz,$31bc
31ac 2b        dec     hl
31ad 1b        dec     de
31ae 1a        ld      a,(de)
31af be        cp      (hl)
31b0 200a      jr      nz,$31bc
31b2 2b        dec     hl
31b3 1b        dec     de
31b4 1a        ld      a,(de)
31b5 be        cp      (hl)
31b6 2004      jr      nz,$31bc
31b8 2b        dec     hl
31b9 1b        dec     de
31ba 1a        ld      a,(de)
31bb be        cp      (hl)
31bc 3ac231    ld      a,($31c2)
31bf e1        pop     hl
31c0 d1        pop     de
31c1 c9        ret     

31c2 00        nop     
31c3 00        nop     
31c4 00        nop     
31c5 00        nop     
31c6 00        nop     
31c7 fd21c331  ld      iy,$31c3
31cb c3358f    jp      $8f35
31ce fd21c331  ld      iy,$31c3
31d2 c3488f    jp      $8f48
31d5 f5        push    af
31d6 d5        push    de
31d7 e5        push    hl
31d8 fde5      push    iy
31da 110000    ld      de,$0000
31dd 2600      ld      h,$00
31df 6f        ld      l,a
31e0 fd21c331  ld      iy,$31c3
31e4 cdf48e    call    $8ef4
31e7 cdda8e    call    $8eda
31ea fde1      pop     iy
31ec e1        pop     hl
31ed d1        pop     de
31ee f1        pop     af
31ef c9        ret     

31f0 f5        push    af
31f1 c5        push    bc
31f2 d5        push    de
31f3 e5        push    hl
31f4 fde5      push    iy
31f6 fd21c331  ld      iy,$31c3
31fa cde78e    call    $8ee7
31fd 4f        ld      c,a
31fe 0600      ld      b,$00
3200 b7        or      a
3201 ed42      sbc     hl,bc
3203 cdda8e    call    $8eda
3206 fde1      pop     iy
3208 e1        pop     hl
3209 d1        pop     de
320a c1        pop     bc
320b f1        pop     af
320c c9        ret     

320d cd4e35    call    $354e
3210 280e      jr      z,$3220
3212 cd7d38    call    $387d
3215 cdc731    call    $31c7
3218 cd5e35    call    $355e
321b cd4635    call    $3546
321e 1811      jr      $3231
3220 cd3635    call    $3536
3223 280c      jr      z,$3231
3225 cd7738    call    $3877
3228 cdc731    call    $31c7
322b cd3e35    call    $353e
322e cd5635    call    $3556
3231 cdf534    call    $34f5
3234 2806      jr      z,$323c
3236 cd6538    call    $3865
3239 cdc731    call    $31c7
323c cded34    call    $34ed
323f 2806      jr      z,$3247
3241 cd6b38    call    $386b
3244 cdc731    call    $31c7
3247 cd0635    call    $3506
324a c8        ret     z

324b cd7138    call    $3871
324e c3c731    jp      $31c7
3251 c5        push    bc
3252 cd2694    call    $9426
3255 010100    ld      bc,$0001
3258 cd5f97    call    $975f
325b cdce31    call    $31ce
325e c1        pop     bc
325f c9        ret     

3260 c5        push    bc
3261 d5        push    de
3262 e5        push    hl
3263 dde5      push    ix
3265 fde5      push    iy
3267 cd2587    call    $8725
326a 47        ld      b,a
326b 3af62f    ld      a,($2ff6)
326e 90        sub     b
326f fe05      cp      $05
3271 3005      jr      nc,$3278
3273 3e01      ld      a,$01
3275 c30033    jp      $3300
3278 cdd23c    call    $3cd2
327b cdae86    call    $86ae
327e cd4f7d    call    $7d4f
3281 cd2694    call    $9426
3284 cde03c    call    $3ce0
3287 cd7d3c    call    $3c7d
328a dd210833  ld      ix,$3308
328e cd973f    call    $3f97
3291 cd3c86    call    $863c
3294 cd5003    call    $0350
3297 cda27f    call    $7fa2
329a cd6203    call    $0362
329d feeb      cp      $eb
329f 200c      jr      nz,$32ad
32a1 dd217fca  ld      ix,$ca7f
32a5 cdf73e    call    $3ef7
32a8 cdc93e    call    $3ec9
32ab 18cb      jr      $3278
32ad fe1b      cp      $1b
32af 2009      jr      nz,$32ba
32b1 cde03c    call    $3ce0
32b4 cd063d    call    $3d06
32b7 97        sub     a
32b8 1843      jr      $32fd
32ba fe0d      cp      $0d
32bc 200a      jr      nz,$32c8
32be cde03c    call    $3ce0
32c1 cd063d    call    $3d06
32c4 3e01      ld      a,$01
32c6 1835      jr      $32fd
32c8 fe2d      cp      $2d
32ca 2825      jr      z,$32f1
32cc fe08      cp      $08
32ce 2010      jr      nz,$32e0
32d0 cd2694    call    $9426
32d3 cdb13c    call    $3cb1
32d6 20b9      jr      nz,$3291
32d8 cd5402    call    $0254
32db cdc993    call    $93c9
32de 18b1      jr      $3291
32e0 fe0c      cp      $0c
32e2 20ad      jr      nz,$3291
32e4 cdef42    call    $42ef
32e7 47        ld      b,a
32e8 cd2587    call    $8725
32eb b8        cp      b
32ec dcc993    call    c,$93c9
32ef 18a0      jr      $3291
32f1 3ead      ld      a,$ad
32f3 cdfc38    call    $38fc
32f6 38bf      jr      c,$32b7
32f8 cdc731    call    $31c7
32fb 3e02      ld      a,$02
32fd cd1b04    call    $041b
3300 fde1      pop     iy
3302 dde1      pop     ix
3304 e1        pop     hl
3305 d1        pop     de
3306 c1        pop     bc
3307 c9        ret     

3308 50        ld      d,b
3309 6c        ld      l,h
330a 65        ld      h,l
330b 61        ld      h,c
330c 73        ld      (hl),e
330d 65        ld      h,l
330e 206d      jr      nz,$337d
3310 6f        ld      l,a
3311 76        halt    
3312 65        ld      h,l
3313 2063      jr      nz,$3378
3315 75        ld      (hl),l
3316 72        ld      (hl),d
3317 73        ld      (hl),e
3318 6f        ld      l,a
3319 72        ld      (hl),d
331a 2074      jr      nz,$3390
331c 6f        ld      l,a
331d 2064      jr      nz,$3383
331f 65        ld      h,l
3320 73        ld      (hl),e
3321 69        ld      l,c
3322 72        ld      (hl),d
3323 65        ld      h,l
3324 64        ld      h,h
3325 206c      jr      nz,$3393
3327 6f        ld      l,a
3328 63        ld      h,e
3329 61        ld      h,c
332a 74        ld      (hl),h
332b 69        ld      l,c
332c 6f        ld      l,a
332d 6e        ld      l,(hl)
332e 2061      jr      nz,$3391
3330 6e        ld      l,(hl)
3331 64        ld      h,h
3332 2070      jr      nz,$33a4
3334 72        ld      (hl),d
3335 65        ld      h,l
3336 73        ld      (hl),e
3337 73        ld      (hl),e
3338 2074      jr      nz,$33ae
333a 68        ld      l,b
333b 65        ld      h,l
333c 2068      jr      nz,$33a6
333e 79        ld      a,c
333f 70        ld      (hl),b
3340 68        ld      l,b
3341 65        ld      h,l
3342 6e        ld      l,(hl)
3343 206b      jr      nz,$33b0
3345 65        ld      h,l
3346 79        ld      a,c
3347 2e24      ld      l,$24
3349 c5        push    bc
334a cd6696    call    $9666
334d fe0c      cp      $0c
334f 2815      jr      z,$3366
3351 cda096    call    $96a0
3354 cd147a    call    $7a14
3357 47        ld      b,a
3358 cd9c39    call    $399c
335b cd2587    call    $8725
335e 90        sub     b
335f 3005      jr      nc,$3366
3361 ed44      neg     
3363 cdc738    call    $38c7
3366 c1        pop     bc
3367 c9        ret     

3368 fd21c331  ld      iy,$31c3
336c cdda8e    call    $8eda
336f cdb639    call    $39b6
3372 cdc47f    call    $7fc4
3375 d8        ret     c

3376 2a1d9a    ld      hl,($9a1d)
3379 7e        ld      a,(hl)
337a fe8b      cp      $8b
337c 2809      jr      z,$3387
337e 3e8b      ld      a,$8b
3380 cdfc38    call    $38fc
3383 d8        ret     c

3384 cdc731    call    $31c7
3387 cde839    call    $39e8
338a e5        push    hl
338b cd9d31    call    $319d
338e e1        pop     hl
338f d0        ret     nc

3390 cdb639    call    $39b6
3393 18dd      jr      $3372
3395 fd21c331  ld      iy,$31c3
3399 cdda8e    call    $8eda
339c cdb639    call    $39b6
339f cdc47f    call    $7fc4
33a2 d8        ret     c

33a3 2a1d9a    ld      hl,($9a1d)
33a6 7e        ld      a,(hl)
33a7 fe8b      cp      $8b
33a9 200c      jr      nz,$33b7
33ab cdb639    call    $39b6
33ae 010100    ld      bc,$0001
33b1 cd5f97    call    $975f
33b4 cdce31    call    $31ce
33b7 cde839    call    $39e8
33ba e5        push    hl
33bb cd9d31    call    $319d
33be e1        pop     hl
33bf 38de      jr      c,$339f
33c1 c9        ret     

33c2 e5        push    hl
33c3 218e35    ld      hl,$358e
33c6 cb66      bit     4,(hl)
33c8 e1        pop     hl
33c9 c9        ret     

33ca e5        push    hl
33cb 218e35    ld      hl,$358e
33ce cbe6      set     4,(hl)
33d0 e1        pop     hl
33d1 c9        ret     

33d2 e5        push    hl
33d3 cd1b04    call    $041b
33d6 218e35    ld      hl,$358e
33d9 cba6      res     4,(hl)
33db e1        pop     hl
33dc c9        ret     

33dd e5        push    hl
33de 218e35    ld      hl,$358e
33e1 cb6e      bit     5,(hl)
33e3 e1        pop     hl
33e4 c9        ret     

33e5 e5        push    hl
33e6 218e35    ld      hl,$358e
33e9 cbee      set     5,(hl)
33eb e1        pop     hl
33ec c9        ret     

33ed e5        push    hl
33ee 218e35    ld      hl,$358e
33f1 cbae      res     5,(hl)
33f3 e1        pop     hl
33f4 c9        ret     

33f5 e5        push    hl
33f6 218e35    ld      hl,$358e
33f9 cb5e      bit     3,(hl)
33fb e1        pop     hl
33fc c9        ret     

33fd e5        push    hl
33fe 218e35    ld      hl,$358e
3401 cbde      set     3,(hl)
3403 e1        pop     hl
3404 c9        ret     

3405 e5        push    hl
3406 218e35    ld      hl,$358e
3409 cb9e      res     3,(hl)
340b e1        pop     hl
340c c9        ret     

340d e5        push    hl
340e 218e35    ld      hl,$358e
3411 cb46      bit     0,(hl)
3413 e1        pop     hl
3414 c9        ret     

3415 e5        push    hl
3416 218e35    ld      hl,$358e
3419 cbc6      set     0,(hl)
341b e1        pop     hl
341c c9        ret     

341d e5        push    hl
341e 218e35    ld      hl,$358e
3421 cb56      bit     2,(hl)
3423 2002      jr      nz,$3427
3425 cb4e      bit     1,(hl)
3427 e1        pop     hl
3428 c9        ret     

3429 e5        push    hl
342a 218e35    ld      hl,$358e
342d cbd6      set     2,(hl)
342f e1        pop     hl
3430 c9        ret     

3431 e5        push    hl
3432 218e35    ld      hl,$358e
3435 cb96      res     2,(hl)
3437 e1        pop     hl
3438 c9        ret     

3439 e5        push    hl
343a 218e35    ld      hl,$358e
343d cbce      set     1,(hl)
343f e1        pop     hl
3440 c9        ret     

3441 f5        push    af
3442 3a8e35    ld      a,($358e)
3445 e6fc      and     $fc
3447 328e35    ld      ($358e),a
344a f1        pop     af
344b c9        ret     

344c c9        ret     

344d e5        push    hl
344e 218e35    ld      hl,$358e
3451 cb7e      bit     7,(hl)
3453 e1        pop     hl
3454 c9        ret     

3455 e5        push    hl
3456 218e35    ld      hl,$358e
3459 cbfe      set     7,(hl)
345b e1        pop     hl
345c c9        ret     

345d e5        push    hl
345e 218e35    ld      hl,$358e
3461 cbbe      res     7,(hl)
3463 e1        pop     hl
3464 c9        ret     

3465 e5        push    hl
3466 218f35    ld      hl,$358f
3469 cb46      bit     0,(hl)
346b e1        pop     hl
346c c9        ret     

346d e5        push    hl
346e 218f35    ld      hl,$358f
3471 cbc6      set     0,(hl)
3473 e1        pop     hl
3474 c9        ret     

3475 e5        push    hl
3476 218f35    ld      hl,$358f
3479 cb86      res     0,(hl)
347b e1        pop     hl
347c c9        ret     

347d e5        push    hl
347e 218f35    ld      hl,$358f
3481 cb4e      bit     1,(hl)
3483 e1        pop     hl
3484 c9        ret     

3485 e5        push    hl
3486 218f35    ld      hl,$358f
3489 cbce      set     1,(hl)
348b e1        pop     hl
348c c9        ret     

348d e5        push    hl
348e 218f35    ld      hl,$358f
3491 cb8e      res     1,(hl)
3493 e1        pop     hl
3494 c9        ret     

3495 e5        push    hl
3496 218e35    ld      hl,$358e
3499 cb76      bit     6,(hl)
349b e1        pop     hl
349c c9        ret     

349d e5        push    hl
349e 218e35    ld      hl,$358e
34a1 cbf6      set     6,(hl)
34a3 e1        pop     hl
34a4 c9        ret     

34a5 e5        push    hl
34a6 218f35    ld      hl,$358f
34a9 cb56      bit     2,(hl)
34ab e1        pop     hl
34ac c9        ret     

34ad e5        push    hl
34ae 218f35    ld      hl,$358f
34b1 cbd6      set     2,(hl)
34b3 e1        pop     hl
34b4 c9        ret     

34b5 e5        push    hl
34b6 218f35    ld      hl,$358f
34b9 cb96      res     2,(hl)
34bb e1        pop     hl
34bc c9        ret     

34bd e5        push    hl
34be 218e35    ld      hl,$358e
34c1 cb8e      res     1,(hl)
34c3 cbae      res     5,(hl)
34c5 cbbe      res     7,(hl)
34c7 23        inc     hl
34c8 cb86      res     0,(hl)
34ca cb96      res     2,(hl)
34cc cb9e      res     3,(hl)
34ce cba6      res     4,(hl)
34d0 cbae      res     5,(hl)
34d2 cbbe      res     7,(hl)
34d4 23        inc     hl
34d5 cb86      res     0,(hl)
34d7 cb8e      res     1,(hl)
34d9 e1        pop     hl
34da c9        ret     

34db 3a8f35    ld      a,($358f)
34de ee08      xor     $08
34e0 328f35    ld      ($358f),a
34e3 c9        ret     

34e4 3a8f35    ld      a,($358f)
34e7 ee10      xor     $10
34e9 328f35    ld      ($358f),a
34ec c9        ret     

34ed e5        push    hl
34ee 218f35    ld      hl,$358f
34f1 cb5e      bit     3,(hl)
34f3 e1        pop     hl
34f4 c9        ret     

34f5 e5        push    hl
34f6 218f35    ld      hl,$358f
34f9 cb66      bit     4,(hl)
34fb e1        pop     hl
34fc c9        ret     

34fd 3a8f35    ld      a,($358f)
3500 ee20      xor     $20
3502 328f35    ld      ($358f),a
3505 c9        ret     

3506 e5        push    hl
3507 218f35    ld      hl,$358f
350a cb6e      bit     5,(hl)
350c e1        pop     hl
350d c9        ret     

350e e5        push    hl
350f 218f35    ld      hl,$358f
3512 cb76      bit     6,(hl)
3514 e1        pop     hl
3515 c9        ret     

3516 e5        push    hl
3517 218f35    ld      hl,$358f
351a cbf6      set     6,(hl)
351c e1        pop     hl
351d c9        ret     

351e e5        push    hl
351f 218f35    ld      hl,$358f
3522 cbfe      set     7,(hl)
3524 e1        pop     hl
3525 c9        ret     

3526 e5        push    hl
3527 218f35    ld      hl,$358f
352a cbbe      res     7,(hl)
352c e1        pop     hl
352d c9        ret     

352e e5        push    hl
352f 218f35    ld      hl,$358f
3532 cb7e      bit     7,(hl)
3534 e1        pop     hl
3535 c9        ret     

3536 e5        push    hl
3537 219035    ld      hl,$3590
353a cb46      bit     0,(hl)
353c e1        pop     hl
353d c9        ret     

353e e5        push    hl
353f 219035    ld      hl,$3590
3542 cb86      res     0,(hl)
3544 e1        pop     hl
3545 c9        ret     

3546 e5        push    hl
3547 219035    ld      hl,$3590
354a cbc6      set     0,(hl)
354c e1        pop     hl
354d c9        ret     

354e e5        push    hl
354f 219035    ld      hl,$3590
3552 cb4e      bit     1,(hl)
3554 e1        pop     hl
3555 c9        ret     

3556 e5        push    hl
3557 219035    ld      hl,$3590
355a cbce      set     1,(hl)
355c e1        pop     hl
355d c9        ret     

355e e5        push    hl
355f 219035    ld      hl,$3590
3562 cb8e      res     1,(hl)
3564 e1        pop     hl
3565 c9        ret     

3566 e5        push    hl
3567 219035    ld      hl,$3590
356a cb66      bit     4,(hl)
356c e1        pop     hl
356d c9        ret     

356e e5        push    hl
356f 219035    ld      hl,$3590
3572 cbe6      set     4,(hl)
3574 e1        pop     hl
3575 c9        ret     

3576 e5        push    hl
3577 219035    ld      hl,$3590
357a cb76      bit     6,(hl)
357c e1        pop     hl
357d c9        ret     

357e e5        push    hl
357f 219035    ld      hl,$3590
3582 cbf6      set     6,(hl)
3584 e1        pop     hl
3585 c9        ret     

3586 e5        push    hl
3587 219035    ld      hl,$3590
358a cbb6      res     6,(hl)
358c e1        pop     hl
358d c9        ret     

358e 00        nop     
358f 00        nop     
3590 00        nop     
3591 cd4d34    call    $344d
3594 2005      jr      nz,$359b
3596 cdcf60    call    $60cf
3599 184c      jr      $35e7
359b cd5a36    call    $365a
359e cdd25f    call    $5fd2
35a1 cd0c3a    call    $3a0c
35a4 fd21f360  ld      iy,$60f3
35a8 cd6696    call    $9666
35ab cd8836    call    $3688
35ae cd6599    call    $9965
35b1 cd1e8f    call    $8f1e
35b4 301f      jr      nc,$35d5
35b6 cdc993    call    $93c9
35b9 fe0d      cp      $0d
35bb 2804      jr      z,$35c1
35bd fe0a      cp      $0a
35bf 20ed      jr      nz,$35ae
35c1 cd2694    call    $9426
35c4 cda096    call    $96a0
35c7 cda836    call    $36a8
35ca cd7d3c    call    $3c7d
35cd cd6599    call    $9965
35d0 cd1e8f    call    $8f1e
35d3 38d6      jr      c,$35ab
35d5 cde78e    call    $8ee7
35d8 cd0c3a    call    $3a0c
35db cda096    call    $96a0
35de cda836    call    $36a8
35e1 cd7d36    call    $367d
35e4 cd0534    call    $3405
35e7 c9        ret     

35e8 cd5a36    call    $365a
35eb cd6696    call    $9666
35ee fe21      cp      $21
35f0 3804      jr      c,$35f6
35f2 fe7f      cp      $7f
35f4 382c      jr      c,$3622
35f6 cda096    call    $96a0
35f9 fe21      cp      $21
35fb 381b      jr      c,$3618
35fd fe7f      cp      $7f
35ff 3017      jr      nc,$3618
3601 cd2694    call    $9426
3604 3abf36    ld      a,($36bf)
3607 4f        ld      c,a
3608 cd4b37    call    $374b
360b 2815      jr      z,$3622
360d cd0a37    call    $370a
3610 cdd23c    call    $3cd2
3613 cd6696    call    $9666
3616 181c      jr      $3634
3618 dd2162ca  ld      ix,$ca62
361c cd463f    call    $3f46
361f 37        scf     
3620 1813      jr      $3635
3622 cdc993    call    $93c9
3625 cd143d    call    $3d14
3628 cd8836    call    $3688
362b cdd23c    call    $3cd2
362e cd6696    call    $9666
3631 cdb636    call    $36b6
3634 b7        or      a
3635 c9        ret     

3636 cd5a36    call    $365a
3639 cd6696    call    $9666
363c cde290    call    $90e2
363f 3004      jr      nc,$3645
3641 fe20      cp      $20
3643 200a      jr      nz,$364f
3645 dd216eca  ld      ix,$ca6e
3649 cd463f    call    $3f46
364c 37        scf     
364d 180a      jr      $3659
364f cd8836    call    $3688
3652 cdc993    call    $93c9
3655 cdb636    call    $36b6
3658 b7        or      a
3659 c9        ret     

365a 32bf36    ld      ($36bf),a
365d fe82      cp      $82
365f 2004      jr      nz,$3665
3661 3e83      ld      a,$83
3663 1806      jr      $366b
3665 fe83      cp      $83
3667 2002      jr      nz,$366b
3669 3e82      ld      a,$82
366b 32c036    ld      ($36c0),a
366e 97        sub     a
366f 32be36    ld      ($36be),a
3672 cd6599    call    $9965
3675 fd21c136  ld      iy,$36c1
3679 cdda8e    call    $8eda
367c c9        ret     

367d fd21c136  ld      iy,$36c1
3681 cde78e    call    $8ee7
3684 cd0c3a    call    $3a0c
3687 c9        ret     

3688 11bf36    ld      de,$36bf
368b 1a        ld      a,(de)
368c 4f        ld      c,a
368d cd4b37    call    $374b
3690 c0        ret     nz

3691 3e01      ld      a,$01
3693 32be36    ld      ($36be),a
3696 010100    ld      bc,$0001
3699 cdf096    call    $96f0
369c fde5      push    iy
369e fd21c136  ld      iy,$36c1
36a2 cd0c60    call    $600c
36a5 fde1      pop     iy
36a7 c9        ret     

36a8 3abe36    ld      a,($36be)
36ab b7        or      a
36ac c8        ret     z

36ad 97        sub     a
36ae 32be36    ld      ($36be),a
36b1 11c036    ld      de,$36c0
36b4 18e0      jr      $3696
36b6 cda836    call    $36a8
36b9 cd7d36    call    $367d
36bc b7        or      a
36bd c9        ret     

36be 00        nop     
36bf 00        nop     
36c0 00        nop     
36c1 00        nop     
36c2 00        nop     
36c3 00        nop     
36c4 00        nop     
36c5 dde5      push    ix
36c7 dd210937  ld      ix,$3709
36cb 97        sub     a
36cc dd7700    ld      (ix+$00),a
36cf 3e81      ld      a,$81
36d1 cd0a37    call    $370a
36d4 3803      jr      c,$36d9
36d6 dd3400    inc     (ix+$00)
36d9 3e86      ld      a,$86
36db cd0a37    call    $370a
36de 3803      jr      c,$36e3
36e0 dd3400    inc     (ix+$00)
36e3 3e87      ld      a,$87
36e5 cd0a37    call    $370a
36e8 3803      jr      c,$36ed
36ea dd3400    inc     (ix+$00)
36ed 3e83      ld      a,$83
36ef cd0a37    call    $370a
36f2 3803      jr      c,$36f7
36f4 dd3400    inc     (ix+$00)
36f7 3e82      ld      a,$82
36f9 cd0a37    call    $370a
36fc 3803      jr      c,$3701
36fe dd3400    inc     (ix+$00)
3701 dd7e00    ld      a,(ix+$00)
3704 d601      sub     $01
3706 dde1      pop     ix
3708 c9        ret     

3709 00        nop     
370a c5        push    bc
370b d5        push    de
370c e5        push    hl
370d fde5      push    iy
370f 4f        ld      c,a
3710 cd4b37    call    $374b
3713 2806      jr      z,$371b
3715 cd2637    call    $3726
3718 b7        or      a
3719 1801      jr      $371c
371b 37        scf     
371c fde1      pop     iy
371e e1        pop     hl
371f d1        pop     de
3720 c1        pop     bc
3721 c9        ret     

3722 00        nop     
3723 00        nop     
3724 00        nop     
3725 00        nop     
3726 fd212237  ld      iy,$3722
372a cd6599    call    $9965
372d cdda8e    call    $8eda
3730 cd2694    call    $9426
3733 cd4b37    call    $374b
3736 2804      jr      z,$373c
3738 fe01      cp      $01
373a 20f4      jr      nz,$3730
373c 0602      ld      b,$02
373e cd488f    call    $8f48
3741 cd7b37    call    $377b
3744 cde78e    call    $8ee7
3747 cd0c3a    call    $3a0c
374a c9        ret     

374b 79        ld      a,c
374c fe82      cp      $82
374e 2005      jr      nz,$3755
3750 cd4e35    call    $354e
3753 1825      jr      $377a
3755 fe83      cp      $83
3757 2005      jr      nz,$375e
3759 cd3635    call    $3536
375c 181c      jr      $377a
375e fe81      cp      $81
3760 2005      jr      nz,$3767
3762 cdf534    call    $34f5
3765 1813      jr      $377a
3767 fe86      cp      $86
3769 2005      jr      nz,$3770
376b cded34    call    $34ed
376e 180a      jr      $377a
3770 fe87      cp      $87
3772 2005      jr      nz,$3779
3774 cd0635    call    $3506
3777 1801      jr      $377a
3779 97        sub     a
377a c9        ret     

377b c5        push    bc
377c d5        push    de
377d cd8394    call    $9483
3780 fe01      cp      $01
3782 2855      jr      z,$37d9
3784 b9        cp      c
3785 2839      jr      z,$37c0
3787 fe82      cp      $82
3789 200b      jr      nz,$3796
378b cd3635    call    $3536
378e c43e35    call    nz,$353e
3791 cc5635    call    z,$3556
3794 18e7      jr      $377d
3796 fe83      cp      $83
3798 200b      jr      nz,$37a5
379a cd4e35    call    $354e
379d c45e35    call    nz,$355e
37a0 cc4635    call    z,$3546
37a3 18d8      jr      $377d
37a5 fe81      cp      $81
37a7 2005      jr      nz,$37ae
37a9 cde434    call    $34e4
37ac 18cf      jr      $377d
37ae fe86      cp      $86
37b0 2005      jr      nz,$37b7
37b2 cddb34    call    $34db
37b5 18c6      jr      $377d
37b7 fe87      cp      $87
37b9 20c2      jr      nz,$377d
37bb cdfd34    call    $34fd
37be 18bd      jr      $377d
37c0 fe82      cp      $82
37c2 2003      jr      nz,$37c7
37c4 0c        inc     c
37c5 1805      jr      $37cc
37c7 fe83      cp      $83
37c9 2001      jr      nz,$37cc
37cb 0d        dec     c
37cc cd2a95    call    $952a
37cf c5        push    bc
37d0 010100    ld      bc,$0001
37d3 cd5f97    call    $975f
37d6 c1        pop     bc
37d7 10a4      djnz    $377d
37d9 d1        pop     de
37da c1        pop     bc
37db c9        ret     

37dc c5        push    bc
37dd d5        push    de
37de dde5      push    ix
37e0 97        sub     a
37e1 47        ld      b,a
37e2 4f        ld      c,a
37e3 50        ld      d,b
37e4 58        ld      e,b
37e5 326438    ld      ($3864),a
37e8 cd2694    call    $9426
37eb fe01      cp      $01
37ed 2803      jr      z,$37f2
37ef cdc993    call    $93c9
37f2 dd2a1d9a  ld      ix,($9a1d)
37f6 dd7e00    ld      a,(ix+$00)
37f9 fe81      cp      $81
37fb 2003      jr      nz,$3800
37fd 04        inc     b
37fe 180c      jr      $380c
3800 fe86      cp      $86
3802 2003      jr      nz,$3807
3804 14        inc     d
3805 1805      jr      $380c
3807 fe87      cp      $87
3809 2005      jr      nz,$3810
380b 1c        inc     e
380c dd23      inc     ix
380e 18e6      jr      $37f6
3810 dd216438  ld      ix,$3864
3814 78        ld      a,b
3815 fe02      cp      $02
3817 3816      jr      c,$382f
3819 e6fe      and     $fe
381b 47        ld      b,a
381c 0e81      ld      c,$81
381e cd7b37    call    $377b
3821 ddcb00c6  set     0,(ix+$00)
3825 cd2694    call    $9426
3828 fe01      cp      $01
382a 2803      jr      z,$382f
382c cdc993    call    $93c9
382f 7a        ld      a,d
3830 fe02      cp      $02
3832 3816      jr      c,$384a
3834 e6fe      and     $fe
3836 47        ld      b,a
3837 0e86      ld      c,$86
3839 cd7b37    call    $377b
383c ddcb00c6  set     0,(ix+$00)
3840 cd2694    call    $9426
3843 fe01      cp      $01
3845 2803      jr      z,$384a
3847 cdc993    call    $93c9
384a 7b        ld      a,e
384b fe02      cp      $02
384d 380c      jr      c,$385b
384f e6fe      and     $fe
3851 47        ld      b,a
3852 0e87      ld      c,$87
3854 cd7b37    call    $377b
3857 ddcb00c6  set     0,(ix+$00)
385b dd7e00    ld      a,(ix+$00)
385e 1f        rra     
385f dde1      pop     ix
3861 d1        pop     de
3862 c1        pop     bc
3863 c9        ret     

3864 00        nop     
3865 3e81      ld      a,$81
3867 cdfc38    call    $38fc
386a c9        ret     

386b 3e86      ld      a,$86
386d cdfc38    call    $38fc
3870 c9        ret     

3871 3e87      ld      a,$87
3873 cdfc38    call    $38fc
3876 c9        ret     

3877 3e82      ld      a,$82
3879 cdfc38    call    $38fc
387c c9        ret     

387d 3e83      ld      a,$83
387f cdfc38    call    $38fc
3882 c9        ret     

3883 c5        push    bc
3884 d5        push    de
3885 e5        push    hl
3886 cd088f    call    $8f08
3889 44        ld      b,h
388a 4d        ld      c,l
388b cd5f97    call    $975f
388e 7a        ld      a,d
388f b3        or      e
3890 2808      jr      z,$389a
3892 b7        or      a
3893 ed42      sbc     hl,bc
3895 3001      jr      nc,$3898
3897 1b        dec     de
3898 18ef      jr      $3889
389a e1        pop     hl
389b d1        pop     de
389c c1        pop     bc
389d c9        ret     

389e 3e01      ld      a,$01
38a0 d5        push    de
38a1 e5        push    hl
38a2 11ad38    ld      de,$38ad
38a5 2e03      ld      l,$03
38a7 cdda38    call    $38da
38aa e1        pop     hl
38ab d1        pop     de
38ac c9        ret     

38ad 0d        dec     c
38ae 0d        dec     c
38af 0d        dec     c
38b0 3e01      ld      a,$01
38b2 d5        push    de
38b3 e5        push    hl
38b4 11bb38    ld      de,$38bb
38b7 2e0a      ld      l,$0a
38b9 18ec      jr      $38a7
38bb 2020      jr      nz,$38dd
38bd 2020      jr      nz,$38df
38bf 2020      jr      nz,$38e1
38c1 2020      jr      nz,$38e3
38c3 2020      jr      nz,$38e5
38c5 3e01      ld      a,$01
38c7 d5        push    de
38c8 e5        push    hl
38c9 11d038    ld      de,$38d0
38cc 2e0a      ld      l,$0a
38ce 18d7      jr      $38a7
38d0 a0        and     b
38d1 a0        and     b
38d2 a0        and     b
38d3 a0        and     b
38d4 a0        and     b
38d5 a0        and     b
38d6 a0        and     b
38d7 a0        and     b
38d8 a0        and     b
38d9 a0        and     b
38da c5        push    bc
38db d5        push    de
38dc f5        push    af
38dd 0600      ld      b,$00
38df cdf438    call    $38f4
38e2 67        ld      h,a
38e3 cdf096    call    $96f0
38e6 7c        ld      a,h
38e7 3806      jr      c,$38ef
38e9 95        sub     l
38ea 2802      jr      z,$38ee
38ec 30f1      jr      nc,$38df
38ee b7        or      a
38ef c1        pop     bc
38f0 78        ld      a,b
38f1 d1        pop     de
38f2 c1        pop     bc
38f3 c9        ret     

38f4 bd        cp      l
38f5 3803      jr      c,$38fa
38f7 4d        ld      c,l
38f8 1801      jr      $38fb
38fa 4f        ld      c,a
38fb c9        ret     

38fc c5        push    bc
38fd d5        push    de
38fe 110b39    ld      de,$390b
3901 12        ld      (de),a
3902 010100    ld      bc,$0001
3905 cdf096    call    $96f0
3908 d1        pop     de
3909 c1        pop     bc
390a c9        ret     

390b 00        nop     
390c cd2587    call    $8725
390f fe01      cp      $01
3911 2803      jr      z,$3916
3913 cd9e38    call    $389e
3916 3e0c      ld      a,$0c
3918 18e2      jr      $38fc
391a c5        push    bc
391b d5        push    de
391c e5        push    hl
391d fde5      push    iy
391f cd6599    call    $9965
3922 fd214f39  ld      iy,$394f
3926 cdda8e    call    $8eda
3929 cde839    call    $39e8
392c fe01      cp      $01
392e 2805      jr      z,$3935
3930 10f7      djnz    $3929
3932 b7        or      a
3933 1801      jr      $3936
3935 37        scf     
3936 f5        push    af
3937 cd6599    call    $9965
393a cd088f    call    $8f08
393d 44        ld      b,h
393e 4d        ld      c,l
393f cde78e    call    $8ee7
3942 cd0c3a    call    $3a0c
3945 cd5f97    call    $975f
3948 f1        pop     af
3949 fde1      pop     iy
394b e1        pop     hl
394c d1        pop     de
394d c1        pop     bc
394e c9        ret     

394f 00        nop     
3950 00        nop     
3951 00        nop     
3952 00        nop     
3953 c5        push    bc
3954 d5        push    de
3955 329b39    ld      ($399b),a
3958 cd3087    call    $8730
395b 4f        ld      c,a
395c cd3c87    call    $873c
395f 47        ld      b,a
3960 cdfa39    call    $39fa
3963 cdb639    call    $39b6
3966 cd9c39    call    $399c
3969 79        ld      a,c
396a cd6187    call    $8761
396d cd4f87    call    $874f
3970 3a9b39    ld      a,($399b)
3973 d1        pop     de
3974 c1        pop     bc
3975 c9        ret     

3976 c5        push    bc
3977 d5        push    de
3978 329b39    ld      ($399b),a
397b cd3087    call    $8730
397e 4f        ld      c,a
397f cd3c87    call    $873c
3982 47        ld      b,a
3983 cde839    call    $39e8
3986 fe01      cp      $01
3988 ccb639    call    z,$39b6
398b cd9c39    call    $399c
398e 79        ld      a,c
398f cd6187    call    $8761
3992 cd4f87    call    $874f
3995 3a9b39    ld      a,($399b)
3998 d1        pop     de
3999 c1        pop     bc
399a c9        ret     

399b 00        nop     
399c f5        push    af
399d cdc993    call    $93c9
39a0 fe01      cp      $01
39a2 2810      jr      z,$39b4
39a4 cdc53c    call    $3cc5
39a7 2808      jr      z,$39b1
39a9 cd2587    call    $8725
39ac b8        cp      b
39ad 38ee      jr      c,$399d
39af 2803      jr      z,$39b4
39b1 cd2694    call    $9426
39b4 f1        pop     af
39b5 c9        ret     

39b6 c5        push    bc
39b7 cd3087    call    $8730
39ba 4f        ld      c,a
39bb cd2694    call    $9426
39be fe01      cp      $01
39c0 2808      jr      z,$39ca
39c2 cdc53c    call    $3cc5
39c5 20f4      jr      nz,$39bb
39c7 cdc993    call    $93c9
39ca cd4f87    call    $874f
39cd c1        pop     bc
39ce c9        ret     

39cf c5        push    bc
39d0 cd3087    call    $8730
39d3 4f        ld      c,a
39d4 cdc993    call    $93c9
39d7 fe01      cp      $01
39d9 2808      jr      z,$39e3
39db cdc53c    call    $3cc5
39de 20f4      jr      nz,$39d4
39e0 cd2694    call    $9426
39e3 cd4f87    call    $874f
39e6 c1        pop     bc
39e7 c9        ret     

39e8 c5        push    bc
39e9 cd3087    call    $8730
39ec 4f        ld      c,a
39ed cdc993    call    $93c9
39f0 cdc53c    call    $3cc5
39f3 20f8      jr      nz,$39ed
39f5 cd4f87    call    $874f
39f8 c1        pop     bc
39f9 c9        ret     

39fa c5        push    bc
39fb cd3087    call    $8730
39fe 4f        ld      c,a
39ff cd2694    call    $9426
3a02 cdc53c    call    $3cc5
3a05 20f8      jr      nz,$39ff
3a07 cd4f87    call    $874f
3a0a c1        pop     bc
3a0b c9        ret     

3a0c d5        push    de
3a0d e5        push    hl
3a0e fde5      push    iy
3a10 fd21433a  ld      iy,$3a43
3a14 cdda8e    call    $8eda
3a17 cd473a    call    $3a47
3a1a 3813      jr      c,$3a2f
3a1c 2820      jr      z,$3a3e
3a1e cd2694    call    $9426
3a21 cd473a    call    $3a47
3a24 2818      jr      z,$3a3e
3a26 3802      jr      c,$3a2a
3a28 18f4      jr      $3a1e
3a2a cdc993    call    $93c9
3a2d 180f      jr      $3a3e
3a2f cdc993    call    $93c9
3a32 fe01      cp      $01
3a34 2808      jr      z,$3a3e
3a36 cd473a    call    $3a47
3a39 38f4      jr      c,$3a2f
3a3b c42694    call    nz,$9426
3a3e fde1      pop     iy
3a40 e1        pop     hl
3a41 d1        pop     de
3a42 c9        ret     

3a43 00        nop     
3a44 00        nop     
3a45 00        nop     
3a46 00        nop     
3a47 cd6599    call    $9965
3a4a c31e8f    jp      $8f1e
3a4d c5        push    bc
3a4e 32793a    ld      ($3a79),a
3a51 cd3087    call    $8730
3a54 4f        ld      c,a
3a55 cd3887    call    $8738
3a58 47        ld      b,a
3a59 05        dec     b
3a5a 05        dec     b
3a5b 2809      jr      z,$3a66
3a5d cdfa39    call    $39fa
3a60 fe01      cp      $01
3a62 2805      jr      z,$3a69
3a64 18f4      jr      $3a5a
3a66 cdb639    call    $39b6
3a69 cd3887    call    $8738
3a6c fe01      cp      $01
3a6e cce839    call    z,$39e8
3a71 cd4f87    call    $874f
3a74 3a793a    ld      a,($3a79)
3a77 c1        pop     bc
3a78 c9        ret     

3a79 00        nop     
3a7a 79        ld      a,c
3a7b b0        or      b
3a7c 2005      jr      nz,$3a83
3a7e cd663b    call    $3b66
3a81 1840      jr      $3ac3
3a83 ed43c43a  ld      ($3ac4),bc
3a87 fd21c43a  ld      iy,$3ac4
3a8b cd866b    call    $6b86
3a8e 78        ld      a,b
3a8f fdbe01    cp      (iy+$01)
3a92 2004      jr      nz,$3a98
3a94 79        ld      a,c
3a95 fdbe00    cp      (iy+$00)
3a98 2814      jr      z,$3aae
3a9a 3809      jr      c,$3aa5
3a9c cdfa39    call    $39fa
3a9f fe01      cp      $01
3aa1 2820      jr      z,$3ac3
3aa3 18e6      jr      $3a8b
3aa5 cde839    call    $39e8
3aa8 fe01      cp      $01
3aaa 2817      jr      z,$3ac3
3aac 18dd      jr      $3a8b
3aae cd8b6b    call    $6b8b
3ab1 78        ld      a,b
3ab2 fe00      cp      $00
3ab4 2003      jr      nz,$3ab9
3ab6 79        ld      a,c
3ab7 fe01      cp      $01
3ab9 2808      jr      z,$3ac3
3abb cdfa39    call    $39fa
3abe cdb639    call    $39b6
3ac1 18eb      jr      $3aae
3ac3 c9        ret     

3ac4 00        nop     
3ac5 00        nop     
3ac6 cd0635    call    $3506
3ac9 2808      jr      z,$3ad3
3acb cdc993    call    $93c9
3ace fe01      cp      $01
3ad0 c8        ret     z

3ad1 18f3      jr      $3ac6
3ad3 cdc993    call    $93c9
3ad6 fe01      cp      $01
3ad8 c8        ret     z

3ad9 cd0635    call    $3506
3adc 28f5      jr      z,$3ad3
3ade c32694    jp      $9426
3ae1 c5        push    bc
3ae2 32573b    ld      ($3b57),a
3ae5 cd6696    call    $9666
3ae8 fe0a      cp      $0a
3aea 2808      jr      z,$3af4
3aec fe0d      cp      $0d
3aee 2804      jr      z,$3af4
3af0 fe01      cp      $01
3af2 2008      jr      nz,$3afc
3af4 3a573b    ld      a,($3b57)
3af7 cdfc38    call    $38fc
3afa 1856      jr      $3b52
3afc 3a573b    ld      a,($3b57)
3aff fe09      cp      $09
3b01 2039      jr      nz,$3b3c
3b03 cd3487    call    $8734
3b06 47        ld      b,a
3b07 3d        dec     a
3b08 e6f8      and     $f8
3b0a c608      add     a,$08
3b0c 90        sub     b
3b0d 47        ld      b,a
3b0e 0e00      ld      c,$00
3b10 cdc993    call    $93c9
3b13 cdc993    call    $93c9
3b16 0c        inc     c
3b17 fe0d      cp      $0d
3b19 280d      jr      z,$3b28
3b1b fe01      cp      $01
3b1d 280d      jr      z,$3b2c
3b1f cde290    call    $90e2
3b22 30ef      jr      nc,$3b13
3b24 10ed      djnz    $3b13
3b26 1808      jr      $3b30
3b28 41        ld      b,c
3b29 0d        dec     c
3b2a 1805      jr      $3b31
3b2c 0d        dec     c
3b2d 41        ld      b,c
3b2e 1801      jr      $3b31
3b30 41        ld      b,c
3b31 cd2694    call    $9426
3b34 10fb      djnz    $3b31
3b36 cd5f97    call    $975f
3b39 cd2694    call    $9426
3b3c cd6696    call    $9666
3b3f fe20      cp      $20
3b41 2805      jr      z,$3b48
3b43 fea0      cp      $a0
3b45 c45402    call    nz,$0254
3b48 cdb975    call    $75b9
3b4b 3a573b    ld      a,($3b57)
3b4e cdda97    call    $97da
3b51 b7        or      a
3b52 c1        pop     bc
3b53 3a573b    ld      a,($3b57)
3b56 c9        ret     

3b57 00        nop     
3b58 32dc3b    ld      ($3bdc),a
3b5b cd2694    call    $9426
3b5e fe01      cp      $01
3b60 20f9      jr      nz,$3b5b
3b62 3adc3b    ld      a,($3bdc)
3b65 c9        ret     

3b66 f5        push    af
3b67 c5        push    bc
3b68 d5        push    de
3b69 e5        push    hl
3b6a dde5      push    ix
3b6c fde5      push    iy
3b6e 2a1f9a    ld      hl,($9a1f)
3b71 ed5b299a  ld      de,($9a29)
3b75 b7        or      a
3b76 ed52      sbc     hl,de
3b78 383e      jr      c,$3bb8
3b7a eb        ex      de,hl
3b7b ed5b1d9a  ld      de,($9a1d)
3b7f 221d9a    ld      ($9a1d),hl
3b82 b7        or      a
3b83 ed52      sbc     hl,de
3b85 2818      jr      z,$3b9f
3b87 3809      jr      c,$3b92
3b89 ed531d9a  ld      ($9a1d),de
3b8d cd583b    call    $3b58
3b90 1826      jr      $3bb8
3b92 11ffff    ld      de,$ffff
3b95 fd21259a  ld      iy,$9a25
3b99 cdf48e    call    $8ef4
3b9c cdda8e    call    $8eda
3b9f cd2f98    call    $982f
3ba2 dcaa98    call    c,$98aa
3ba5 cd1d99    call    $991d
3ba8 cdc698    call    $98c6
3bab 20c1      jr      nz,$3b6e
3bad cdc13b    call    $3bc1
3bb0 cd6b6b    call    $6b6b
3bb3 3e01      ld      a,$01
3bb5 32f287    ld      ($87f2),a
3bb8 fde1      pop     iy
3bba dde1      pop     ix
3bbc e1        pop     hl
3bbd d1        pop     de
3bbe c1        pop     bc
3bbf f1        pop     af
3bc0 c9        ret     

3bc1 218f35    ld      hl,$358f
3bc4 3ec7      ld      a,$c7
3bc6 a6        and     (hl)
3bc7 77        ld      (hl),a
3bc8 23        inc     hl
3bc9 3efc      ld      a,$fc
3bcb a6        and     (hl)
3bcc 77        ld      (hl),a
3bcd c9        ret     

3bce 32dc3b    ld      ($3bdc),a
3bd1 cdc993    call    $93c9
3bd4 fe01      cp      $01
3bd6 20f9      jr      nz,$3bd1
3bd8 3adc3b    ld      a,($3bdc)
3bdb c9        ret     

3bdc 00        nop     
3bdd f5        push    af
3bde c5        push    bc
3bdf d5        push    de
3be0 e5        push    hl
3be1 dde5      push    ix
3be3 fde5      push    iy
3be5 2a1f9a    ld      hl,($9a1f)
3be8 23        inc     hl
3be9 ed5b1d9a  ld      de,($9a1d)
3bed 221d9a    ld      ($9a1d),hl
3bf0 b7        or      a
3bf1 ed52      sbc     hl,de
3bf3 2818      jr      z,$3c0d
3bf5 3009      jr      nc,$3c00
3bf7 ed531d9a  ld      ($9a1d),de
3bfb cdce3b    call    $3bce
3bfe 181b      jr      $3c1b
3c00 110000    ld      de,$0000
3c03 fd21259a  ld      iy,$9a25
3c07 cdf48e    call    $8ef4
3c0a cdda8e    call    $8eda
3c0d cd2f98    call    $982f
3c10 dc4698    call    c,$9846
3c13 cd8398    call    $9883
3c16 20cd      jr      nz,$3be5
3c18 cdc13b    call    $3bc1
3c1b fde1      pop     iy
3c1d dde1      pop     ix
3c1f e1        pop     hl
3c20 d1        pop     de
3c21 c1        pop     bc
3c22 f1        pop     af
3c23 c9        ret     

3c24 c5        push    bc
3c25 e5        push    hl
3c26 ed4b299a  ld      bc,($9a29)
3c2a 2a1d9a    ld      hl,($9a1d)
3c2d b7        or      a
3c2e ed42      sbc     hl,bc
3c30 2807      jr      z,$3c39
3c32 3805      jr      c,$3c39
3c34 cd2694    call    $9426
3c37 18f1      jr      $3c2a
3c39 e1        pop     hl
3c3a c1        pop     bc
3c3b c9        ret     

3c3c cd3887    call    $8738
3c3f f5        push    af
3c40 c617      add     a,$17
3c42 47        ld      b,a
3c43 cde839    call    $39e8
3c46 fe01      cp      $01
3c48 2808      jr      z,$3c52
3c4a cd3887    call    $8738
3c4d b8        cp      b
3c4e 38f3      jr      c,$3c43
3c50 1804      jr      $3c56
3c52 47        ld      b,a
3c53 cdb639    call    $39b6
3c56 f1        pop     af
3c57 cdb686    call    $86b6
3c5a 78        ld      a,b
3c5b c9        ret     

3c5c cd3887    call    $8738
3c5f f5        push    af
3c60 47        ld      b,a
3c61 c616      add     a,$16
3c63 cd4087    call    $8740
3c66 cdfa39    call    $39fa
3c69 fe01      cp      $01
3c6b 2809      jr      z,$3c76
3c6d cd3887    call    $8738
3c70 b8        cp      b
3c71 30f3      jr      nc,$3c66
3c73 cdb639    call    $39b6
3c76 47        ld      b,a
3c77 f1        pop     af
3c78 cdb686    call    $86b6
3c7b 78        ld      a,b
3c7c c9        ret     

3c7d cdc993    call    $93c9
3c80 cdb13c    call    $3cb1
3c83 2011      jr      nz,$3c96
3c85 cdc993    call    $93c9
3c88 cdb13c    call    $3cb1
3c8b 2002      jr      nz,$3c8f
3c8d 18f6      jr      $3c85
3c8f fe01      cp      $01
3c91 c42694    call    nz,$9426
3c94 3e20      ld      a,$20
3c96 c9        ret     

3c97 cd2694    call    $9426
3c9a cdb13c    call    $3cb1
3c9d 2011      jr      nz,$3cb0
3c9f cd2694    call    $9426
3ca2 cdb13c    call    $3cb1
3ca5 2002      jr      nz,$3ca9
3ca7 18f6      jr      $3c9f
3ca9 fe01      cp      $01
3cab c4c993    call    nz,$93c9
3cae 3e20      ld      a,$20
3cb0 c9        ret     

3cb1 e5        push    hl
3cb2 c5        push    bc
3cb3 010500    ld      bc,$0005
3cb6 21be3c    ld      hl,$3cbe
3cb9 edb1      cpir    
3cbb c1        pop     bc
3cbc e1        pop     hl
3cbd c9        ret     

3cbe 20a0      jr      nz,$3c60
3cc0 0d        dec     c
3cc1 0a        ld      a,(bc)
3cc2 0c        inc     c
3cc3 0101e5    ld      bc,$e501
3cc6 c5        push    bc
3cc7 010500    ld      bc,$0005
3cca 21c03c    ld      hl,$3cc0
3ccd edb1      cpir    
3ccf c1        pop     bc
3cd0 e1        pop     hl
3cd1 c9        ret     

3cd2 cdc993    call    $93c9
3cd5 fe01      cp      $01
3cd7 c8        ret     z

3cd8 cdb13c    call    $3cb1
3cdb 20f5      jr      nz,$3cd2
3cdd c32694    jp      $9426
3ce0 cd2694    call    $9426
3ce3 fe01      cp      $01
3ce5 c8        ret     z

3ce6 fea0      cp      $a0
3ce8 280b      jr      z,$3cf5
3cea fe20      cp      $20
3cec 2807      jr      z,$3cf5
3cee cdc53c    call    $3cc5
3cf1 2810      jr      z,$3d03
3cf3 18eb      jr      $3ce0
3cf5 cd2694    call    $9426
3cf8 fe01      cp      $01
3cfa c8        ret     z

3cfb fea0      cp      $a0
3cfd 28f6      jr      z,$3cf5
3cff fe20      cp      $20
3d01 28f2      jr      z,$3cf5
3d03 c3c993    jp      $93c9
3d06 c5        push    bc
3d07 cd7d3c    call    $3c7d
3d0a fe01      cp      $01
3d0c 2804      jr      z,$3d12
3d0e fe20      cp      $20
3d10 20f5      jr      nz,$3d07
3d12 c1        pop     bc
3d13 c9        ret     

3d14 c5        push    bc
3d15 cd973c    call    $3c97
3d18 fe01      cp      $01
3d1a 280e      jr      z,$3d2a
3d1c cd973c    call    $3c97
3d1f fe01      cp      $01
3d21 2807      jr      z,$3d2a
3d23 fe20      cp      $20
3d25 20f5      jr      nz,$3d1c
3d27 cd7d3c    call    $3c7d
3d2a c1        pop     bc
3d2b c9        ret     

3d2c f5        push    af
3d2d c5        push    bc
3d2e d5        push    de
3d2f cdd589    call    $89d5
3d32 cd7402    call    $0274
3d35 115d3d    ld      de,$3d5d
3d38 0e09      ld      c,$09
3d3a cd0500    call    $0005
3d3d cd1483    call    $8314
3d40 11012f    ld      de,$2f01
3d43 cd9504    call    $0495
3d46 11673d    ld      de,$3d67
3d49 0e09      ld      c,$09
3d4b cd0500    call    $0005
3d4e 97        sub     a
3d4f 32d83d    ld      ($3dd8),a
3d52 fd21d93d  ld      iy,$3dd9
3d56 cd678f    call    $8f67
3d59 d1        pop     de
3d5a c1        pop     bc
3d5b f1        pop     af
3d5c c9        ret     

3d5d 45        ld      b,l
3d5e 64        ld      h,h
3d5f 69        ld      l,c
3d60 74        ld      (hl),h
3d61 69        ld      l,c
3d62 6e        ld      l,(hl)
3d63 67        ld      h,a
3d64 3a2024    ld      a,($2420)
3d67 43        ld      b,e
3d68 6f        ld      l,a
3d69 6c        ld      l,h
3d6a 3a2020    ld      a,($2020)
3d6d 2020      jr      nz,$3d8f
3d6f 2020      jr      nz,$3d91
3d71 4c        ld      c,h
3d72 69        ld      l,c
3d73 6e        ld      l,(hl)
3d74 65        ld      h,l
3d75 3a2020    ld      a,($2020)
3d78 2020      jr      nz,$3d9a
3d7a 2020      jr      nz,$3d9c
3d7c 2020      jr      nz,$3d9e
3d7e 50        ld      d,b
3d7f 61        ld      h,c
3d80 67        ld      h,a
3d81 65        ld      h,l
3d82 3a24cd    ld      a,($cd24)
3d85 dd3d      dec     a
3d87 cd8b3d    call    $3d8b
3d8a c9        ret     

3d8b cd2587    call    $8725
3d8e 21d83d    ld      hl,$3dd8
3d91 be        cp      (hl)
3d92 2809      jr      z,$3d9d
3d94 32d83d    ld      ($3dd8),a
3d97 110133    ld      de,$3301
3d9a cd8f82    call    $828f
3d9d cd8b6b    call    $6b8b
3da0 dd21d93d  ld      ix,$3dd9
3da4 78        ld      a,b
3da5 ddbe01    cp      (ix+$01)
3da8 2004      jr      nz,$3dae
3daa 79        ld      a,c
3dab ddbe00    cp      (ix+$00)
3dae 280a      jr      z,$3dba
3db0 ed43d93d  ld      ($3dd9),bc
3db4 11013e    ld      de,$3e01
3db7 cd9982    call    $8299
3dba cd866b    call    $6b86
3dbd dd21db3d  ld      ix,$3ddb
3dc1 78        ld      a,b
3dc2 ddbe01    cp      (ix+$01)
3dc5 2004      jr      nz,$3dcb
3dc7 79        ld      a,c
3dc8 ddbe00    cp      (ix+$00)
3dcb 280a      jr      z,$3dd7
3dcd ed43db3d  ld      ($3ddb),bc
3dd1 11014b    ld      de,$4b01
3dd4 cd9982    call    $8299
3dd7 c9        ret     

3dd8 00        nop     
3dd9 00        nop     
3dda 00        nop     
3ddb 00        nop     
3ddc 00        nop     
3ddd cddd33    call    $33dd
3de0 2021      jr      nz,$3e03
3de2 21043e    ld      hl,$3e04
3de5 cd3087    call    $8730
3de8 be        cp      (hl)
3de9 2015      jr      nz,$3e00
3deb 23        inc     hl
3dec cdeb42    call    $42eb
3def be        cp      (hl)
3df0 200e      jr      nz,$3e00
3df2 23        inc     hl
3df3 cd147a    call    $7a14
3df6 be        cp      (hl)
3df7 2007      jr      nz,$3e00
3df9 23        inc     hl
3dfa cdef42    call    $42ef
3dfd be        cp      (hl)
3dfe 2803      jr      z,$3e03
3e00 cd0f3e    call    $3e0f
3e03 c9        ret     

3e04 00        nop     
3e05 00        nop     
3e06 00        nop     
3e07 00        nop     
3e08 f5        push    af
3e09 97        sub     a
3e0a 32043e    ld      ($3e04),a
3e0d f1        pop     af
3e0e c9        ret     

3e0f f5        push    af
3e10 c5        push    bc
3e11 d5        push    de
3e12 cdfa03    call    $03fa
3e15 cd3087    call    $8730
3e18 47        ld      b,a
3e19 32043e    ld      ($3e04),a
3e1c c64e      add     a,$4e
3e1e 4f        ld      c,a
3e1f cdeb42    call    $42eb
3e22 32053e    ld      ($3e05),a
3e25 cd147a    call    $7a14
3e28 57        ld      d,a
3e29 32063e    ld      ($3e06),a
3e2c cdef42    call    $42ef
3e2f 5f        ld      e,a
3e30 32073e    ld      ($3e07),a
3e33 7a        ld      a,d
3e34 b8        cp      b
3e35 3812      jr      c,$3e49
3e37 b9        cp      c
3e38 3805      jr      c,$3e3f
3e3a cd8f3e    call    $3e8f
3e3d 181a      jr      $3e59
3e3f 7b        ld      a,e
3e40 b9        cp      c
3e41 dc603e    call    c,$3e60
3e44 d47d3e    call    nc,$3e7d
3e47 1810      jr      $3e59
3e49 7b        ld      a,e
3e4a b8        cp      b
3e4b 3005      jr      nc,$3e52
3e4d cd8f3e    call    $3e8f
3e50 1807      jr      $3e59
3e52 b9        cp      c
3e53 dc723e    call    c,$3e72
3e56 d4893e    call    nc,$3e89
3e59 cd0a04    call    $040a
3e5c d1        pop     de
3e5d c1        pop     bc
3e5e f1        pop     af
3e5f c9        ret     

3e60 f5        push    af
3e61 cda13e    call    $3ea1
3e64 cd953e    call    $3e95
3e67 7a        ld      a,d
3e68 3c        inc     a
3e69 43        ld      b,e
3e6a cdbe3e    call    $3ebe
3e6d cd9b3e    call    $3e9b
3e70 f1        pop     af
3e71 c9        ret     

3e72 f5        push    af
3e73 78        ld      a,b
3e74 43        ld      b,e
3e75 cdbe3e    call    $3ebe
3e78 cd9b3e    call    $3e9b
3e7b f1        pop     af
3e7c c9        ret     

3e7d cda13e    call    $3ea1
3e80 cd953e    call    $3e95
3e83 7a        ld      a,d
3e84 59        ld      e,c
3e85 cdbe3e    call    $3ebe
3e88 c9        ret     

3e89 78        ld      a,b
3e8a 41        ld      b,c
3e8b cdbe3e    call    $3ebe
3e8e c9        ret     

3e8f 3e20      ld      a,$20
3e91 cd4583    call    $8345
3e94 c9        ret     

3e95 3e6c      ld      a,$6c
3e97 cd4583    call    $8345
3e9a c9        ret     

3e9b 3e52      ld      a,$52
3e9d cd4583    call    $8345
3ea0 c9        ret     

3ea1 e5        push    hl
3ea2 cdeb42    call    $42eb
3ea5 6f        ld      l,a
3ea6 78        ld      a,b
3ea7 ba        cp      d
3ea8 2812      jr      z,$3ebc
3eaa bd        cp      l
3eab 280a      jr      z,$3eb7
3ead f5        push    af
3eae 3e20      ld      a,$20
3eb0 cd4583    call    $8345
3eb3 f1        pop     af
3eb4 3c        inc     a
3eb5 18f0      jr      $3ea7
3eb7 f5        push    af
3eb8 3e4c      ld      a,$4c
3eba 18f4      jr      $3eb0
3ebc e1        pop     hl
3ebd c9        ret     

3ebe 90        sub     b
3ebf 2807      jr      z,$3ec8
3ec1 1e2d      ld      e,$2d
3ec3 0e06      ld      c,$06
3ec5 cd4790    call    $9047
3ec8 c9        ret     

3ec9 f5        push    af
3eca dde5      push    ix
3ecc dd210cc5  ld      ix,$c50c
3ed0 cd973f    call    $3f97
3ed3 cd7d80    call    $807d
3ed6 cda27f    call    $7fa2
3ed9 cd1b04    call    $041b
3edc dde1      pop     ix
3ede f1        pop     af
3edf c9        ret     

3ee0 dde5      push    ix
3ee2 dd212fc5  ld      ix,$c52f
3ee6 cd973f    call    $3f97
3ee9 cd7d80    call    $807d
3eec cda27f    call    $7fa2
3eef fe1b      cp      $1b
3ef1 cd1b04    call    $041b
3ef4 dde1      pop     ix
3ef6 c9        ret     

3ef7 cd0534    call    $3405
3efa cd3e8a    call    $8a3e
3efd cd6202    call    $0262
3f00 c5        push    bc
3f01 d5        push    de
3f02 e5        push    hl
3f03 fde5      push    iy
3f05 dde5      push    ix
3f07 e1        pop     hl
3f08 1100a0    ld      de,$a000
3f0b b7        or      a
3f0c ed52      sbc     hl,de
3f0e 3828      jr      c,$3f38
3f10 cd6f2d    call    $2d6f
3f13 fd21e865  ld      iy,$65e8
3f17 cd3c28    call    $283c
3f1a b7        or      a
3f1b 2017      jr      nz,$3f34
3f1d cdd73f    call    $3fd7
3f20 cd6428    call    $2864
3f23 fe01      cp      $01
3f25 2808      jr      z,$3f2f
3f27 b7        or      a
3f28 2805      jr      z,$3f2f
3f2a cd4583    call    $8345
3f2d 18f1      jr      $3f20
3f2f cda02d    call    $2da0
3f32 180c      jr      $3f40
3f34 dd218f65  ld      ix,$658f
3f38 dde5      push    ix
3f3a d1        pop     de
3f3b 0e09      ld      c,$09
3f3d cd0500    call    $0005
3f40 fde1      pop     iy
3f42 e1        pop     hl
3f43 d1        pop     de
3f44 c1        pop     bc
3f45 c9        ret     

3f46 f5        push    af
3f47 c5        push    bc
3f48 d5        push    de
3f49 dde5      push    ix
3f4b cd5402    call    $0254
3f4e dd21633f  ld      ix,$3f63
3f52 cdf73e    call    $3ef7
3f55 dde1      pop     ix
3f57 cd003f    call    $3f00
3f5a 3e03      ld      a,$03
3f5c cdf33f    call    $3ff3
3f5f d1        pop     de
3f60 c1        pop     bc
3f61 f1        pop     af
3f62 c9        ret     

3f63 0a        ld      a,(bc)
3f64 0a        ld      a,(bc)
3f65 0a        ld      a,(bc)
3f66 0a        ld      a,(bc)
3f67 24        inc     h
3f68 dde5      push    ix
3f6a dd2188ce  ld      ix,$ce88
3f6e cd463f    call    $3f46
3f71 dde1      pop     ix
3f73 c9        ret     

3f74 dde5      push    ix
3f76 dd2169c5  ld      ix,$c569
3f7a cd003f    call    $3f00
3f7d f5        push    af
3f7e cdf281    call    $81f2
3f81 32963f    ld      ($3f96),a
3f84 3e0e      ld      a,$0e
3f86 cdee81    call    $81ee
3f89 f1        pop     af
3f8a cddc81    call    $81dc
3f8d 3a963f    ld      a,($3f96)
3f90 cdee81    call    $81ee
3f93 dde1      pop     ix
3f95 c9        ret     

3f96 00        nop     
3f97 cd5402    call    $0254
3f9a f5        push    af
3f9b cdfa03    call    $03fa
3f9e cd003f    call    $3f00
3fa1 cd0a04    call    $040a
3fa4 f1        pop     af
3fa5 c9        ret     

3fa6 c5        push    bc
3fa7 d5        push    de
3fa8 e5        push    hl
3fa9 fde5      push    iy
3fab e1        pop     hl
3fac 010008    ld      bc,$0800
3faf 13        inc     de
3fb0 cdc93f    call    $3fc9
3fb3 1a        ld      a,(de)
3fb4 fe20      cp      $20
3fb6 280a      jr      z,$3fc2
3fb8 3e2e      ld      a,$2e
3fba cdd33f    call    $3fd3
3fbd 0603      ld      b,$03
3fbf cdc93f    call    $3fc9
3fc2 97        sub     a
3fc3 77        ld      (hl),a
3fc4 79        ld      a,c
3fc5 e1        pop     hl
3fc6 d1        pop     de
3fc7 c1        pop     bc
3fc8 c9        ret     

3fc9 1a        ld      a,(de)
3fca 13        inc     de
3fcb fe20      cp      $20
3fcd c4d33f    call    nz,$3fd3
3fd0 10f7      djnz    $3fc9
3fd2 c9        ret     

3fd3 77        ld      (hl),a
3fd4 23        inc     hl
3fd5 0c        inc     c
3fd6 c9        ret     

3fd7 118000    ld      de,$0080
3fda 3e03      ld      a,$03
3fdc cd8d90    call    $908d
3fdf 0e8a      ld      c,$8a
3fe1 cd0500    call    $0005
3fe4 7d        ld      a,l
3fe5 328821    ld      ($2188),a
3fe8 7b        ld      a,e
3fe9 b7        or      a
3fea 2806      jr      z,$3ff2
3fec 47        ld      b,a
3fed cd6428    call    $2864
3ff0 10fb      djnz    $3fed
3ff2 c9        ret     

3ff3 f5        push    af
3ff4 e5        push    hl
3ff5 cd0e35    call    $350e
3ff8 2007      jr      nz,$4001
3ffa ed44      neg     
3ffc cd2490    call    $9024
3fff 1805      jr      $4006
4001 6f        ld      l,a
4002 2600      ld      h,$00
4004 cf        rst     $08
4005 42        ld      b,d
4006 e1        pop     hl
4007 f1        pop     af
4008 c9        ret     

4009 cd663b    call    $3b66
400c fd215242  ld      iy,$4252
4010 cd6599    call    $9965
4013 cdda8e    call    $8eda
4016 cd0442    call    $4204
4019 da0141    jp      c,$4101
401c cd6428    call    $2864
401f fe60      cp      $60
4021 2807      jr      z,$402a
4023 fe01      cp      $01
4025 caf140    jp      z,$40f1
4028 18f2      jr      $401c
402a 3e5c      ld      a,$5c
402c 32e05a    ld      ($5ae0),a
402f 1803      jr      $4034
4031 cd4742    call    $4247
4034 21e15a    ld      hl,$5ae1
4037 064b      ld      b,$4b
4039 cdc47f    call    $7fc4
403c daec40    jp      c,$40ec
403f cd6428    call    $2864
4042 fe60      cp      $60
4044 2008      jr      nz,$404e
4046 cd9c41    call    $419c
4049 daec40    jp      c,$40ec
404c 18e3      jr      $4031
404e fe01      cp      $01
4050 caf140    jp      z,$40f1
4053 fe3a      cp      $3a
4055 282b      jr      z,$4082
4057 fe0d      cp      $0d
4059 28d9      jr      z,$4034
405b fe0a      cp      $0a
405d 28d5      jr      z,$4034
405f fe0c      cp      $0c
4061 28d1      jr      z,$4034
4063 fe20      cp      $20
4065 2808      jr      z,$406f
4067 fea0      cp      $a0
4069 2804      jr      z,$406f
406b fe09      cp      $09
406d 200c      jr      nz,$407b
406f 11e15a    ld      de,$5ae1
4072 e5        push    hl
4073 b7        or      a
4074 ed52      sbc     hl,de
4076 e1        pop     hl
4077 28c6      jr      z,$403f
4079 3e20      ld      a,$20
407b cdac90    call    $90ac
407e 77        ld      (hl),a
407f 23        inc     hl
4080 10bd      djnz    $403f
4082 3e5c      ld      a,$5c
4084 77        ld      (hl),a
4085 23        inc     hl
4086 97        sub     a
4087 77        ld      (hl),a
4088 cd5c58    call    $585c
408b 380c      jr      c,$4099
408d fd215242  ld      iy,$4252
4091 cde78e    call    $8ee7
4094 cd0c3a    call    $3a0c
4097 189b      jr      $4034
4099 ed4b1d9a  ld      bc,($9a1d)
409d cd0c3a    call    $3a0c
40a0 fd216642  ld      iy,$4266
40a4 cdda8e    call    $8eda
40a7 cd0441    call    $4104
40aa cd1241    call    $4112
40ad fe60      cp      $60
40af ca3140    jp      z,$4031
40b2 fe01      cp      $01
40b4 283b      jr      z,$40f1
40b6 cd5c58    call    $585c
40b9 30d2      jr      nc,$408d
40bb ed4b1d9a  ld      bc,($9a1d)
40bf fd216a42  ld      iy,$426a
40c3 cdda8e    call    $8eda
40c6 fd216642  ld      iy,$4266
40ca cde78e    call    $8ee7
40cd cd0c3a    call    $3a0c
40d0 ed5b1d9a  ld      de,($9a1d)
40d4 d5        push    de
40d5 fd216a42  ld      iy,$426a
40d9 cde78e    call    $8ee7
40dc cd0c3a    call    $3a0c
40df cd0441    call    $4104
40e2 d1        pop     de
40e3 ed4b6e42  ld      bc,($426e)
40e7 cdf096    call    $96f0
40ea 18ca      jr      $40b6
40ec cda68c    call    $8ca6
40ef 180d      jr      $40fe
40f1 3a6542    ld      a,($4265)
40f4 b7        or      a
40f5 c49c41    call    nz,$419c
40f8 cd663b    call    $3b66
40fb cd6b6b    call    $6b6b
40fe cd2642    call    $4226
4101 c3ae86    jp      $86ae
4104 60        ld      h,b
4105 69        ld      l,c
4106 ed4b1d9a  ld      bc,($9a1d)
410a b7        or      a
410b ed42      sbc     hl,bc
410d 44        ld      b,h
410e 4d        ld      c,l
410f c35f97    jp      $975f
4112 210000    ld      hl,$0000
4115 226e42    ld      ($426e),hl
4118 cd6428    call    $2864
411b fe01      cp      $01
411d 287c      jr      z,$419b
411f fe60      cp      $60
4121 2879      jr      z,$419c
4123 fe5c      cp      $5c
4125 20f1      jr      nz,$4118
4127 0e00      ld      c,$00
4129 21e977    ld      hl,$77e9
412c 110000    ld      de,$0000
412f 06ff      ld      b,$ff
4131 cd6428    call    $2864
4134 fe60      cp      $60
4136 2864      jr      z,$419c
4138 fe5c      cp      $5c
413a 2845      jr      z,$4181
413c fe01      cp      $01
413e 285c      jr      z,$419c
4140 77        ld      (hl),a
4141 23        inc     hl
4142 13        inc     de
4143 fe0d      cp      $0d
4145 280f      jr      z,$4156
4147 fe0a      cp      $0a
4149 280b      jr      z,$4156
414b fe0c      cp      $0c
414d 2807      jr      z,$4156
414f 10e0      djnz    $4131
4151 cd8141    call    $4181
4154 18db      jr      $4131
4156 cd147a    call    $7a14
4159 4f        ld      c,a
415a 3ea0      ld      a,$a0
415c 0d        dec     c
415d 280a      jr      z,$4169
415f 77        ld      (hl),a
4160 23        inc     hl
4161 13        inc     de
4162 10f8      djnz    $415c
4164 cd8141    call    $4181
4167 18f1      jr      $415a
4169 cd6428    call    $2864
416c fe20      cp      $20
416e 28f9      jr      z,$4169
4170 fea0      cp      $a0
4172 28f5      jr      z,$4169
4174 fe09      cp      $09
4176 28f1      jr      z,$4169
4178 10ba      djnz    $4134
417a f5        push    af
417b cd8141    call    $4181
417e f1        pop     af
417f 18b3      jr      $4134
4181 c5        push    bc
4182 42        ld      b,d
4183 4b        ld      c,e
4184 11e977    ld      de,$77e9
4187 2a6e42    ld      hl,($426e)
418a 09        add     hl,bc
418b 226e42    ld      ($426e),hl
418e cdf096    call    $96f0
4191 21e977    ld      hl,$77e9
4194 110000    ld      de,$0000
4197 c1        pop     bc
4198 06ff      ld      b,$ff
419a af        xor     a
419b c9        ret     

419c c5        push    bc
419d d5        push    de
419e e5        push    hl
419f dde5      push    ix
41a1 3a6542    ld      a,($4265)
41a4 b7        or      a
41a5 2008      jr      nz,$41af
41a7 cdce3b    call    $3bce
41aa cd0c39    call    $390c
41ad 1827      jr      $41d6
41af cd663b    call    $3b66
41b2 cd866b    call    $6b86
41b5 1803      jr      $41ba
41b7 cd4742    call    $4247
41ba 60        ld      h,b
41bb 69        ld      l,c
41bc e5        push    hl
41bd cd8754    call    $5487
41c0 e1        pop     hl
41c1 3839      jr      c,$41fc
41c3 cd4752    call    $5247
41c6 3834      jr      c,$41fc
41c8 cd866b    call    $6b86
41cb b7        or      a
41cc ed42      sbc     hl,bc
41ce 38e7      jr      c,$41b7
41d0 cd7417    call    $1774
41d3 cd9f51    call    $519f
41d6 fd215242  ld      iy,$4252
41da cd6599    call    $9965
41dd cdda8e    call    $8eda
41e0 fd215642  ld      iy,$4256
41e4 cd2c24    call    $242c
41e7 cdfc26    call    $26fc
41ea 3e00      ld      a,$00
41ec cd1f27    call    $271f
41ef 380b      jr      c,$41fc
41f1 fd215242  ld      iy,$4252
41f5 cde78e    call    $8ee7
41f8 cd0c3a    call    $3a0c
41fb b7        or      a
41fc 3e60      ld      a,$60
41fe dde1      pop     ix
4200 e1        pop     hl
4201 d1        pop     de
4202 c1        pop     bc
4203 c9        ret     

4204 c5        push    bc
4205 d5        push    de
4206 e5        push    hl
4207 fde5      push    iy
4209 dde5      push    ix
420b f5        push    af
420c 3a6542    ld      a,($4265)
420f b7        or      a
4210 280a      jr      z,$421c
4212 fd218c8e  ld      iy,$8e8c
4216 cd2c24    call    $242c
4219 cd9456    call    $5694
421c c1        pop     bc
421d 78        ld      a,b
421e dde1      pop     ix
4220 fde1      pop     iy
4222 e1        pop     hl
4223 d1        pop     de
4224 c1        pop     bc
4225 c9        ret     

4226 c5        push    bc
4227 d5        push    de
4228 e5        push    hl
4229 fde5      push    iy
422b dde5      push    ix
422d f5        push    af
422e 3a6542    ld      a,($4265)
4231 b7        or      a
4232 2809      jr      z,$423d
4234 cd9f51    call    $519f
4237 cdac4e    call    $4eac
423a cdef56    call    $56ef
423d c1        pop     bc
423e 78        ld      a,b
423f dde1      pop     ix
4241 fde1      pop     iy
4243 e1        pop     hl
4244 d1        pop     de
4245 c1        pop     bc
4246 c9        ret     

4247 3a6542    ld      a,($4265)
424a b7        or      a
424b c8        ret     z

424c 3e0c      ld      a,$0c
424e cdc453    call    $53c4
4251 c9        ret     

4252 00        nop     
4253 00        nop     
4254 00        nop     
4255 00        nop     
4256 00        nop     
4257 00        nop     
4258 00        nop     
4259 00        nop     
425a 00        nop     
425b 00        nop     
425c 00        nop     
425d 00        nop     
425e 00        nop     
425f 00        nop     
4260 00        nop     
4261 00        nop     
4262 00        nop     
4263 00        nop     
4264 00        nop     
4265 00        nop     
4266 00        nop     
4267 00        nop     
4268 00        nop     
4269 00        nop     
426a 00        nop     
426b 00        nop     
426c 00        nop     
426d 00        nop     
426e 00        nop     
426f 00        nop     
4270 cd7742    call    $4277
4273 dc0b7a    call    c,$7a0b
4276 c9        ret     

4277 e5        push    hl
4278 21444b    ld      hl,$4b44
427b 1804      jr      $4281
427d e5        push    hl
427e 21187a    ld      hl,$7a18
4281 7e        ld      a,(hl)
4282 cd6e6a    call    $6a6e
4285 3001      jr      nc,$4288
4287 77        ld      (hl),a
4288 e1        pop     hl
4289 c9        ret     

428a cd9142    call    $4291
428d dc0b7a    call    c,$7a0b
4290 c9        ret     

4291 e5        push    hl
4292 21444b    ld      hl,$4b44
4295 1804      jr      $429b
4297 e5        push    hl
4298 21187a    ld      hl,$7a18
429b 7e        ld      a,(hl)
429c 47        ld      b,a
429d cd116a    call    $6a11
42a0 3007      jr      nc,$42a9
42a2 77        ld      (hl),a
42a3 cd4d43    call    $434d
42a6 d4da42    call    nc,$42da
42a9 e1        pop     hl
42aa c9        ret     

42ab 3a454b    ld      a,($4b45)
42ae cd116a    call    $6a11
42b1 d0        ret     nc

42b2 32454b    ld      ($4b45),a
42b5 c9        ret     

42b6 cdef42    call    $42ef
42b9 47        ld      b,a
42ba cd6e6a    call    $6a6e
42bd d0        ret     nc

42be 32454b    ld      ($4b45),a
42c1 cdeb42    call    $42eb
42c4 4f        ld      c,a
42c5 cd147a    call    $7a14
42c8 b9        cp      c
42c9 3805      jr      c,$42d0
42cb 21187a    ld      hl,$7a18
42ce 1803      jr      $42d3
42d0 21444b    ld      hl,$4b44
42d3 cd4d43    call    $434d
42d6 d8        ret     c

42d7 21454b    ld      hl,$4b45
42da f5        push    af
42db cd5402    call    $0254
42de dd212bb4  ld      ix,$b42b
42e2 cd463f    call    $3f46
42e5 70        ld      (hl),b
42e6 cd4f7d    call    $7d4f
42e9 f1        pop     af
42ea c9        ret     

42eb 3a444b    ld      a,($4b44)
42ee c9        ret     

42ef 3a454b    ld      a,($4b45)
42f2 c9        ret     

42f3 e5        push    hl
42f4 d5        push    de
42f5 010000    ld      bc,$0000
42f8 2a494b    ld      hl,($4b49)
42fb 110400    ld      de,$0004
42fe cd3343    call    $4333
4301 382d      jr      c,$4330
4303 ed5b424b  ld      de,($4b42)
4307 cd3343    call    $4333
430a 3824      jr      c,$4330
430c ed5b434b  ld      de,($4b43)
4310 cd3343    call    $4333
4313 381b      jr      c,$4330
4315 ed5b474b  ld      de,($4b47)
4319 cd3343    call    $4333
431c 3812      jr      c,$4330
431e ed5b484b  ld      de,($4b48)
4322 cd3343    call    $4333
4325 3809      jr      c,$4330
4327 23        inc     hl
4328 4d        ld      c,l
4329 44        ld      b,h
432a 111800    ld      de,$0018
432d b7        or      a
432e ed52      sbc     hl,de
4330 d1        pop     de
4331 e1        pop     hl
4332 c9        ret     

4333 1600      ld      d,$00
4335 b7        or      a
4336 ed52      sbc     hl,de
4338 c9        ret     

4339 3a464b    ld      a,($4b46)
433c c9        ret     

433d 3a424b    ld      a,($4b42)
4340 c9        ret     

4341 3a484b    ld      a,($4b48)
4344 c9        ret     

4345 3a434b    ld      a,($4b43)
4348 c9        ret     

4349 3a474b    ld      a,($4b47)
434c c9        ret     

434d c5        push    bc
434e 3a454b    ld      a,($4b45)
4351 47        ld      b,a
4352 7e        ld      a,(hl)
4353 b8        cp      b
4354 c1        pop     bc
4355 c9        ret     

4356 e5        push    hl
4357 21414b    ld      hl,$4b41
435a cb5e      bit     3,(hl)
435c e1        pop     hl
435d c9        ret     

435e c5        push    bc
435f 3a414b    ld      a,($4b41)
4362 e600      and     $00
4364 0604      ld      b,$04
4366 cd1091    call    $9110
4369 c1        pop     bc
436a c9        ret     

436b c5        push    bc
436c 3a414b    ld      a,($4b41)
436f e600      and     $00
4371 0606      ld      b,$06
4373 cd1091    call    $9110
4376 c1        pop     bc
4377 c9        ret     

4378 e5        push    hl
4379 21414b    ld      hl,$4b41
437c cb46      bit     0,(hl)
437e e1        pop     hl
437f c9        ret     

4380 e5        push    hl
4381 21414b    ld      hl,$4b41
4384 cb4e      bit     1,(hl)
4386 e1        pop     hl
4387 c9        ret     

4388 e5        push    hl
4389 21414b    ld      hl,$4b41
438c cb56      bit     2,(hl)
438e e1        pop     hl
438f c9        ret     

4390 e5        push    hl
4391 212b4c    ld      hl,$4c2b
4394 cb4e      bit     1,(hl)
4396 e1        pop     hl
4397 c9        ret     

4398 e5        push    hl
4399 212b4c    ld      hl,$4c2b
439c cb46      bit     0,(hl)
439e e1        pop     hl
439f c9        ret     

43a0 e5        push    hl
43a1 212b4c    ld      hl,$4c2b
43a4 cb6e      bit     5,(hl)
43a6 e1        pop     hl
43a7 c9        ret     

43a8 e5        push    hl
43a9 212b4c    ld      hl,$4c2b
43ac cb7e      bit     7,(hl)
43ae e1        pop     hl
43af c9        ret     

43b0 2a1d9a    ld      hl,($9a1d)
43b3 7e        ld      a,(hl)
43b4 b7        or      a
43b5 2819      jr      z,$43d0
43b7 3d        dec     a
43b8 2816      jr      z,$43d0
43ba 3d        dec     a
43bb 2802      jr      z,$43bf
43bd 97        sub     a
43be c9        ret     

43bf 113f4b    ld      de,$4b3f
43c2 01ec00    ld      bc,$00ec
43c5 edb0      ldir    
43c7 010001    ld      bc,$0100
43ca cd5f97    call    $975f
43cd 3e01      ld      a,$01
43cf c9        ret     

43d0 cddc43    call    $43dc
43d3 014800    ld      bc,$0048
43d6 cd5f97    call    $975f
43d9 3e02      ld      a,$02
43db c9        ret     

43dc e5        push    hl
43dd 7e        ld      a,(hl)
43de 47        ld      b,a
43df 23        inc     hl
43e0 cb46      bit     0,(hl)
43e2 3e08      ld      a,$08
43e4 2014      jr      nz,$43fa
43e6 cb4e      bit     1,(hl)
43e8 3e28      ld      a,$28
43ea 200e      jr      nz,$43fa
43ec cb56      bit     2,(hl)
43ee 3e98      ld      a,$98
43f0 2008      jr      nz,$43fa
43f2 cb5e      bit     3,(hl)
43f4 3ed8      ld      a,$d8
43f6 2002      jr      nz,$43fa
43f8 3e00      ld      a,$00
43fa b0        or      b
43fb 32414b    ld      ($4b41),a
43fe 23        inc     hl
43ff 7e        ld      a,(hl)
4400 32454b    ld      ($4b45),a
4403 23        inc     hl
4404 7e        ld      a,(hl)
4405 32444b    ld      ($4b44),a
4408 23        inc     hl
4409 23        inc     hl
440a 23        inc     hl
440b 23        inc     hl
440c 7e        ld      a,(hl)
440d 32464b    ld      ($4b46),a
4410 23        inc     hl
4411 af        xor     a
4412 32424b    ld      ($4b42),a
4415 7e        ld      a,(hl)
4416 d602      sub     $02
4418 3001      jr      nc,$441b
441a af        xor     a
441b 32434b    ld      ($4b43),a
441e 23        inc     hl
441f af        xor     a
4420 32474b    ld      ($4b47),a
4423 7e        ld      a,(hl)
4424 32484b    ld      ($4b48),a
4427 23        inc     hl
4428 114e4b    ld      de,$4b4e
442b 013c00    ld      bc,$003c
442e edb0      ldir    
4430 7e        ld      a,(hl)
4431 324d4b    ld      ($4b4d),a
4434 23        inc     hl
4435 7e        ld      a,(hl)
4436 21414b    ld      hl,$4b41
4439 cb47      bit     0,a
443b 2802      jr      z,$443f
443d cbd6      set     2,(hl)
443f cb4f      bit     1,a
4441 2802      jr      z,$4445
4443 cbce      set     1,(hl)
4445 e1        pop     hl
4446 110500    ld      de,$0005
4449 19        add     hl,de
444a 5e        ld      e,(hl)
444b 23        inc     hl
444c 56        ld      d,(hl)
444d 210300    ld      hl,$0003
4450 19        add     hl,de
4451 3a424b    ld      a,($4b42)
4454 cd8d90    call    $908d
4457 3a484b    ld      a,($4b48)
445a cd8d90    call    $908d
445d 3a434b    ld      a,($4b43)
4460 cd8d90    call    $908d
4463 3a474b    ld      a,($4b47)
4466 cd8d90    call    $908d
4469 22494b    ld      ($4b49),hl
446c c9        ret     

446d cd663b    call    $3b66
4470 113f4b    ld      de,$4b3f
4473 010001    ld      bc,$0100
4476 c3f096    jp      $96f0
4479 cd6745    call    $4567
447c 213046    ld      hl,$4630
447f cdde45    call    $45de
4482 cdeb44    call    $44eb
4485 3003      jr      nc,$448a
4487 cd7945    call    $4579
448a 21444b    ld      hl,$4b44
448d cd4d43    call    $434d
4490 3805      jr      c,$4497
4492 cdd044    call    $44d0
4495 18e5      jr      $447c
4497 cdf342    call    $42f3
449a 3005      jr      nc,$44a1
449c cdda44    call    $44da
449f 18db      jr      $447c
44a1 3a444b    ld      a,($4b44)
44a4 47        ld      b,a
44a5 3a734c    ld      a,($4c73)
44a8 b8        cp      b
44a9 c40b7a    call    nz,$7a0b
44ac cdf681    call    $81f6
44af cdb639    call    $39b6
44b2 c34933    jp      $3349
44b5 cd8445    call    $4584
44b8 213f46    ld      hl,$463f
44bb cdde45    call    $45de
44be cdeb44    call    $44eb
44c1 3008      jr      nc,$44cb
44c3 cd9645    call    $4596
44c6 cdf681    call    $81f6
44c9 37        scf     
44ca c9        ret     

44cb cdf681    call    $81f6
44ce b7        or      a
44cf c9        ret     

44d0 dd2188a7  ld      ix,$a788
44d4 cdf73e    call    $3ef7
44d7 c3c93e    jp      $3ec9
44da dd2106a8  ld      ix,$a806
44de cdf73e    call    $3ef7
44e1 110c19    ld      de,$190c
44e4 79        ld      a,c
44e5 cd8f82    call    $828f
44e8 c3c93e    jp      $3ec9
44eb cde745    call    $45e7
44ee cdbf45    call    $45bf
44f1 3a3e4b    ld      a,($4b3e)
44f4 cdee81    call    $81ee
44f7 dd2a3a4b  ld      ix,($4b3a)
44fb fd21e745  ld      iy,$45e7
44ff cd3d81    call    $813d
4502 f5        push    af
4503 3e07      ld      a,$07
4505 cdee81    call    $81ee
4508 f1        pop     af
4509 3857      jr      c,$4562
450b 28e1      jr      z,$44ee
450d fe0d      cp      $0d
450f 284c      jr      z,$455d
4511 fe0b      cp      $0b
4513 2824      jr      z,$4539
4515 fe0a      cp      $0a
4517 2830      jr      z,$4549
4519 fe08      cp      $08
451b 28d1      jr      z,$44ee
451d fe0c      cp      $0c
451f 28cd      jr      z,$44ee
4521 2a364b    ld      hl,($4b36)
4524 ed4b3c4b  ld      bc,($4b3c)
4528 09        add     hl,bc
4529 5e        ld      e,(hl)
452a 23        inc     hl
452b 56        ld      d,(hl)
452c 217147    ld      hl,$4771
452f 19        add     hl,de
4530 56        ld      d,(hl)
4531 23        inc     hl
4532 66        ld      h,(hl)
4533 6a        ld      l,d
4534 cdbe45    call    $45be
4537 18b5      jr      $44ee
4539 ed5b3c4b  ld      de,($4b3c)
453d 1b        dec     de
453e 1b        dec     de
453f cb7a      bit     7,d
4541 20ab      jr      nz,$44ee
4543 ed533c4b  ld      ($4b3c),de
4547 18a5      jr      $44ee
4549 ed5b3c4b  ld      de,($4b3c)
454d 13        inc     de
454e 13        inc     de
454f 2a304b    ld      hl,($4b30)
4552 b7        or      a
4553 ed52      sbc     hl,de
4555 3897      jr      c,$44ee
4557 ed533c4b  ld      ($4b3c),de
455b 1891      jr      $44ee
455d cd1b04    call    $041b
4560 b7        or      a
4561 c9        ret     

4562 cd1b04    call    $041b
4565 37        scf     
4566 c9        ret     

4567 c5        push    bc
4568 d5        push    de
4569 e5        push    hl
456a 213f4b    ld      hl,$4b3f
456d 116e4c    ld      de,$4c6e
4570 01ec00    ld      bc,$00ec
4573 edb0      ldir    
4575 e1        pop     hl
4576 d1        pop     de
4577 c1        pop     bc
4578 c9        ret     

4579 c5        push    bc
457a d5        push    de
457b e5        push    hl
457c 216e4c    ld      hl,$4c6e
457f 113f4b    ld      de,$4b3f
4582 18ec      jr      $4570
4584 c5        push    bc
4585 d5        push    de
4586 e5        push    hl
4587 21244c    ld      hl,$4c24
458a 116e4c    ld      de,$4c6e
458d 014a00    ld      bc,$004a
4590 edb0      ldir    
4592 e1        pop     hl
4593 d1        pop     de
4594 c1        pop     bc
4595 c9        ret     

4596 c5        push    bc
4597 d5        push    de
4598 e5        push    hl
4599 216e4c    ld      hl,$4c6e
459c 11244c    ld      de,$4c24
459f 18ec      jr      $458d
45a1 c5        push    bc
45a2 d5        push    de
45a3 e5        push    hl
45a4 21244c    ld      hl,$4c24
45a7 116e4d    ld      de,$4d6e
45aa 014a00    ld      bc,$004a
45ad edb0      ldir    
45af e1        pop     hl
45b0 d1        pop     de
45b1 c1        pop     bc
45b2 c9        ret     

45b3 c5        push    bc
45b4 d5        push    de
45b5 e5        push    hl
45b6 216e4d    ld      hl,$4d6e
45b9 11244c    ld      de,$4c24
45bc 18ec      jr      $45aa
45be e9        jp      (hl)
45bf cdc545    call    $45c5
45c2 c39504    jp      $0495
45c5 c5        push    bc
45c6 e5        push    hl
45c7 2a344b    ld      hl,($4b34)
45ca ed4b3c4b  ld      bc,($4b3c)
45ce 09        add     hl,bc
45cf 5e        ld      e,(hl)
45d0 23        inc     hl
45d1 56        ld      d,(hl)
45d2 e1        pop     hl
45d3 c1        pop     bc
45d4 c9        ret     

45d5 213046    ld      hl,$4630
45d8 cdde45    call    $45de
45db c3e745    jp      $45e7
45de 010f00    ld      bc,$000f
45e1 11304b    ld      de,$4b30
45e4 edb0      ldir    
45e6 c9        ret     

45e7 2a3c4b    ld      hl,($4b3c)
45ea e5        push    hl
45eb 210000    ld      hl,$0000
45ee 223c4b    ld      ($4b3c),hl
45f1 dd2a384b  ld      ix,($4b38)
45f5 cdf73e    call    $3ef7
45f8 2a364b    ld      hl,($4b36)
45fb ed4b3c4b  ld      bc,($4b3c)
45ff 09        add     hl,bc
4600 7e        ld      a,(hl)
4601 215b47    ld      hl,$475b
4604 cd8d90    call    $908d
4607 7e        ld      a,(hl)
4608 23        inc     hl
4609 66        ld      h,(hl)
460a 6f        ld      l,a
460b cdbe45    call    $45be
460e ed5b3c4b  ld      de,($4b3c)
4612 13        inc     de
4613 13        inc     de
4614 ed533c4b  ld      ($4b3c),de
4618 2a304b    ld      hl,($4b30)
461b b7        or      a
461c ed52      sbc     hl,de
461e 30d8      jr      nc,$45f8
4620 e1        pop     hl
4621 223c4b    ld      ($4b3c),hl
4624 dde5      push    ix
4626 dd2165b2  ld      ix,$b265
462a cd9a3f    call    $3f9a
462d dde1      pop     ix
462f c9        ret     

4630 2600      ld      h,$00
4632 a5        and     l
4633 46        ld      b,(hl)
4634 5d        ld      e,l
4635 46        ld      b,(hl)
4636 13        inc     de
4637 47        ld      b,a
4638 f8        ret     m

4639 b0        or      b
463a 72        ld      (hl),d
463b ab        xor     e
463c 08        ex      af,af'
463d 00        nop     
463e 0618      ld      b,$18
4640 00        nop     
4641 d346      out     ($46),a
4643 8b        adc     a,e
4644 46        ld      b,(hl)
4645 41        ld      b,c
4646 47        ld      b,a
4647 b5        or      l
4648 b2        or      d
4649 cbae      res     5,(hl)
464b 00        nop     
464c 00        nop     
464d 0604      ld      b,$04
464f 00        nop     
4650 cd4685    call    $8546
4653 46        ld      b,(hl)
4654 3b        dec     sp
4655 47        ld      b,a
4656 b3        or      e
4657 b7        or      a
4658 e3        ex      (sp),hl
4659 b7        or      a
465a 00        nop     
465b 00        nop     
465c 07        rlca    
465d 03        inc     bc
465e 0d        dec     c
465f 04        inc     b
4660 0a        ld      a,(bc)
4661 05        dec     b
4662 0d        dec     c
4663 0629      ld      b,$29
4665 07        rlca    
4666 0e08      ld      c,$08
4668 0f        rrca    
4669 09        add     hl,bc
466a 060a      ld      b,$0a
466c 0f        rrca    
466d 0b        dec     bc
466e 260c      ld      h,$0c
4670 0a        ld      a,(bc)
4671 0d        dec     c
4672 100e      djnz    $4682
4674 13        inc     de
4675 1018      djnz    $468f
4677 111913    ld      de,$1319
467a 0c        inc     c
467b 14        inc     d
467c 1015      djnz    $4693
467e 0e16      ld      c,$16
4680 0d        dec     c
4681 17        rla     
4682 13        inc     de
4683 181f      jr      $46a4
4685 03        inc     bc
4686 07        rlca    
4687 07        rlca    
4688 04        inc     b
4689 08        ex      af,af'
468a 04        inc     b
468b 03        inc     bc
468c 1004      djnz    $4692
468e 0e05      ld      c,$05
4690 2c        inc     l
4691 0633      ld      b,$33
4693 07        rlca    
4694 3a0817    ld      a,($1708)
4697 09        add     hl,bc
4698 25        dec     h
4699 0a        ld      a,(bc)
469a 0e0b      ld      c,$0b
469c 13        inc     de
469d 0c        inc     c
469e 14        inc     d
469f 0d        dec     c
46a0 08        ex      af,af'
46a1 0e0f      ld      c,$0f
46a3 0f        rrca    
46a4 3842      jr      c,$46e8
46a6 4b        ld      c,e
46a7 4d        ld      c,l
46a8 4b        ld      c,e
46a9 8a        adc     a,d
46aa 4b        ld      c,e
46ab 43        ld      b,e
46ac 4b        ld      c,e
46ad 44        ld      b,h
46ae 4b        ld      c,e
46af 45        ld      b,l
46b0 4b        ld      c,e
46b1 a2        and     d
46b2 49        ld      c,c
46b3 46        ld      b,(hl)
46b4 4b        ld      c,e
46b5 47        ld      b,a
46b6 4b        ld      c,e
46b7 c7        rst     $00
46b8 4b        ld      c,e
46b9 48        ld      c,b
46ba 4b        ld      c,e
46bb 49        ld      c,c
46bc 4b        ld      c,e
46bd 4b        ld      c,e
46be 4b        ld      c,e
46bf 4c        ld      c,h
46c0 4b        ld      c,e
46c1 2801      jr      z,$46c4
46c3 29        add     hl,hl
46c4 012a01    ld      bc,$012a
46c7 2b        dec     hl
46c8 014c13    ld      bc,$134c
46cb 6e        ld      l,(hl)
46cc 2b        dec     hl
46cd a2        and     d
46ce 49        ld      c,c
46cf c8        ret     z

46d0 59        ld      e,c
46d1 05        dec     b
46d2 5a        ld      e,d
46d3 2c        inc     l
46d4 4c        ld      c,h
46d5 2e4c      ld      l,$4c
46d7 24        inc     h
46d8 4c        ld      c,h
46d9 264c      ld      h,$4c
46db 29        add     hl,hl
46dc 4c        ld      c,h
46dd 3049      jr      nc,$4728
46df 35        dec     (hl)
46e0 49        ld      c,c
46e1 304c      jr      nc,$472f
46e3 6d        ld      l,l
46e4 4c        ld      c,h
46e5 315972    ld      sp,$7259
46e8 6b        ld      l,e
46e9 34        inc     (hl)
46ea 89        adc     a,c
46eb 284c      jr      z,$4739
46ed f649      or      $49
46ef f3        di      
46f0 49        ld      c,c
46f1 e0        ret     po

46f2 49        ld      c,c
46f3 fa4902    jp      m,$0249
46f6 4a        ld      c,d
46f7 0a        ld      a,(bc)
46f8 4a        ld      c,d
46f9 114a16    ld      de,$164a
46fc 4a        ld      c,d
46fd 1c        inc     e
46fe 4a        ld      c,d
46ff 284a      jr      z,$474b
4701 2b        dec     hl
4702 4a        ld      c,d
4703 2f        cpl     
4704 4a        ld      c,d
4705 37        scf     
4706 4a        ld      c,d
4707 43        ld      b,e
4708 4a        ld      c,d
4709 45        ld      b,l
470a 4a        ld      c,d
470b 48        ld      c,b
470c 4a        ld      c,d
470d 4b        ld      c,e
470e 4a        ld      c,d
470f 4e        ld      c,(hl)
4710 4a        ld      c,d
4711 55        ld      d,l
4712 4a        ld      c,d
4713 02        ld      (bc),a
4714 00        nop     
4715 08        ex      af,af'
4716 00        nop     
4717 08        ex      af,af'
4718 00        nop     
4719 02        ld      (bc),a
471a 00        nop     
471b 02        ld      (bc),a
471c 00        nop     
471d 02        ld      (bc),a
471e 00        nop     
471f 0e00      ld      c,$00
4721 00        nop     
4722 00        nop     
4723 02        ld      (bc),a
4724 00        nop     
4725 08        ex      af,af'
4726 00        nop     
4727 02        ld      (bc),a
4728 00        nop     
4729 04        inc     b
472a 00        nop     
472b 0c        inc     c
472c 00        nop     
472d 0c        inc     c
472e 00        nop     
472f 1000      djnz    $4731
4731 1000      djnz    $4733
4733 1000      djnz    $4735
4735 1000      djnz    $4737
4737 1000      djnz    $4739
4739 1000      djnz    $473b
473b 12        ld      (de),a
473c 00        nop     
473d 14        inc     d
473e 00        nop     
473f 14        inc     d
4740 00        nop     
4741 02        ld      (bc),a
4742 00        nop     
4743 0600      ld      b,$00
4745 04        inc     b
4746 00        nop     
4747 04        inc     b
4748 00        nop     
4749 04        inc     b
474a 00        nop     
474b 1000      djnz    $474d
474d 1000      djnz    $474f
474f 0a        ld      a,(bc)
4750 00        nop     
4751 02        ld      (bc),a
4752 00        nop     
4753 1000      djnz    $4755
4755 1000      djnz    $4757
4757 1000      djnz    $4759
4759 02        ld      (bc),a
475a 00        nop     
475b bf        cp      a
475c 49        ld      c,c
475d bf        cp      a
475e 49        ld      c,c
475f c9        ret     

4760 49        ld      c,c
4761 af        xor     a
4762 49        ld      c,c
4763 60        ld      h,b
4764 49        ld      c,c
4765 66        ld      h,(hl)
4766 49        ld      c,c
4767 a3        and     e
4768 49        ld      c,c
4769 a2        and     d
476a 49        ld      c,c
476b 4e        ld      c,(hl)
476c 49        ld      c,c
476d 5b        ld      e,e
476e 5b        ld      e,e
476f 6f        ld      l,a
4770 5b        ld      e,e
4771 2e48      ld      l,$48
4773 48        ld      c,b
4774 48        ld      c,b
4775 54        ld      d,h
4776 48        ld      c,b
4777 60        ld      h,b
4778 48        ld      c,b
4779 a7        and     a
477a 48        ld      c,b
477b b7        or      a
477c 48        ld      c,b
477d 1049      djnz    $47c8
477f 2848      jr      z,$47c9
4781 9d        sbc     a,l
4782 47        ld      b,a
4783 7d        ld      a,l
4784 5b        ld      e,e
4785 87        add     a,a
4786 5b        ld      e,e
4787 ea67ee    jp      pe,$ee67
478a 67        ld      h,a
478b f267f2    jp      p,$f267
478e 67        ld      h,a
478f 3868      jr      c,$47f9
4791 3c        inc     a
4792 68        ld      l,b
4793 34        inc     (hl)
4794 68        ld      l,b
4795 93        sub     e
4796 68        ld      l,b
4797 d26840    jp      nc,$4068
479a 69        ld      l,c
479b 4e        ld      c,(hl)
479c 68        ld      l,b
479d e67f      and     $7f
479f fe20      cp      $20
47a1 3831      jr      c,$47d4
47a3 cd7402    call    $0274
47a6 cdd747    call    $47d7
47a9 cde847    call    $47e8
47ac c5        push    bc
47ad 3c        inc     a
47ae 4f        ld      c,a
47af 7b        ld      a,e
47b0 0605      ld      b,$05
47b2 cdf990    call    $90f9
47b5 b9        cp      c
47b6 3002      jr      nc,$47ba
47b8 0e00      ld      c,$00
47ba 79        ld      a,c
47bb 322e4b    ld      ($4b2e),a
47be c1        pop     bc
47bf 79        ld      a,c
47c0 cd0591    call    $9105
47c3 2f        cpl     
47c4 a6        and     (hl)
47c5 77        ld      (hl),a
47c6 3a2e4b    ld      a,($4b2e)
47c9 cd0591    call    $9105
47cc b6        or      (hl)
47cd 77        ld      (hl),a
47ce cd0a48    call    $480a
47d1 c35a49    jp      $495a
47d4 c35402    jp      $0254
47d7 f5        push    af
47d8 d5        push    de
47d9 2a324b    ld      hl,($4b32)
47dc ed5b3c4b  ld      de,($4b3c)
47e0 19        add     hl,de
47e1 7e        ld      a,(hl)
47e2 23        inc     hl
47e3 66        ld      h,(hl)
47e4 6f        ld      l,a
47e5 d1        pop     de
47e6 f1        pop     af
47e7 c9        ret     

47e8 eb        ex      de,hl
47e9 21404b    ld      hl,$4b40
47ec cb5b      bit     3,e
47ee 2805      jr      z,$47f5
47f0 21414b    ld      hl,$4b41
47f3 1807      jr      $47fc
47f5 cb63      bit     4,e
47f7 2803      jr      z,$47fc
47f9 212b4c    ld      hl,$4c2b
47fc 7a        ld      a,d
47fd e603      and     $03
47ff 4f        ld      c,a
4800 7b        ld      a,e
4801 e607      and     $07
4803 47        ld      b,a
4804 7e        ld      a,(hl)
4805 cd1091    call    $9110
4808 a1        and     c
4809 c9        ret     

480a cd1c48    call    $481c
480d 3a2e4b    ld      a,($4b2e)
4810 cb27      sla     a
4812 cd8d90    call    $908d
4815 4e        ld      c,(hl)
4816 23        inc     hl
4817 46        ld      b,(hl)
4818 c5        push    bc
4819 dde1      pop     ix
481b c9        ret     

481c 7a        ld      a,d
481d 0602      ld      b,$02
481f cdf990    call    $90f9
4822 21ed46    ld      hl,$46ed
4825 c38d90    jp      $908d
4828 cdf765    call    $65f7
482b c33349    jp      $4933
482e 212e4b    ld      hl,$4b2e
4831 3601      ld      (hl),$01
4833 cdd747    call    $47d7
4836 46        ld      b,(hl)
4837 e5        push    hl
4838 c5        push    bc
4839 cd6c48    call    $486c
483c c1        pop     bc
483d e1        pop     hl
483e d8        ret     c

483f 7e        ld      a,(hl)
4840 b7        or      a
4841 2002      jr      nz,$4845
4843 78        ld      a,b
4844 77        ld      (hl),a
4845 c3bf49    jp      $49bf
4848 212e4b    ld      hl,$4b2e
484b 3603      ld      (hl),$03
484d cd6c48    call    $486c
4850 d8        ret     c

4851 c3bf49    jp      $49bf
4854 212e4b    ld      hl,$4b2e
4857 3605      ld      (hl),$05
4859 cd6c48    call    $486c
485c d8        ret     c

485d c3c949    jp      $49c9
4860 212e4b    ld      hl,$4b2e
4863 3605      ld      (hl),$05
4865 cd6c48    call    $486c
4868 d8        ret     c

4869 c3af49    jp      $49af
486c cdd090    call    $90d0
486f 302f      jr      nc,$48a0
4871 cd3d80    call    $803d
4874 cd7402    call    $0274
4877 dd21eaa9  ld      ix,$a9ea
487b fd213349  ld      iy,$4933
487f 3a2e4b    ld      a,($4b2e)
4882 cdae80    call    $80ae
4885 381e      jr      c,$48a5
4887 e5        push    hl
4888 cdd747    call    $47d7
488b c1        pop     bc
488c 71        ld      (hl),c
488d 3a2e4b    ld      a,($4b2e)
4890 fe04      cp      $04
4892 3008      jr      nc,$489c
4894 78        ld      a,b
4895 b7        or      a
4896 280d      jr      z,$48a5
4898 36ff      ld      (hl),$ff
489a 1809      jr      $48a5
489c 23        inc     hl
489d 70        ld      (hl),b
489e 1805      jr      $48a5
48a0 cd5402    call    $0254
48a3 37        scf     
48a4 c9        ret     

48a5 b7        or      a
48a6 c9        ret     

48a7 dd21eaa9  ld      ix,$a9ea
48ab cde848    call    $48e8
48ae 3804      jr      c,$48b4
48b0 cd8849    call    $4988
48b3 d0        ret     nc

48b4 c36049    jp      $4960
48b7 dd2183aa  ld      ix,$aa83
48bb cde848    call    $48e8
48be 380b      jr      c,$48cb
48c0 cd8849    call    $4988
48c3 3803      jr      c,$48c8
48c5 c3ce48    jp      $48ce
48c8 cde248    call    $48e2
48cb c36649    jp      $4966
48ce dd21e649  ld      ix,$49e6
48d2 fd4600    ld      b,(iy+$00)
48d5 fd23      inc     iy
48d7 cd8889    call    $8988
48da 2806      jr      z,$48e2
48dc 212b4c    ld      hl,$4c2b
48df cbbe      res     7,(hl)
48e1 c9        ret     

48e2 212b4c    ld      hl,$4c2b
48e5 cbfe      set     7,(hl)
48e7 c9        ret     

48e8 cd3d80    call    $803d
48eb cd7402    call    $0274
48ee 21654a    ld      hl,$4a65
48f1 3e3c      ld      a,$3c
48f3 fd213349  ld      iy,$4933
48f7 cd3282    call    $8232
48fa d8        ret     c

48fb 78        ld      a,b
48fc 32644a    ld      ($4a64),a
48ff cdd747    call    $47d7
4902 eb        ex      de,hl
4903 d5        push    de
4904 21644a    ld      hl,$4a64
4907 013d00    ld      bc,$003d
490a edb0      ldir    
490c fde1      pop     iy
490e b7        or      a
490f c9        ret     

4910 cd3d80    call    $803d
4913 cd7402    call    $0274
4916 21644a    ld      hl,$4a64
4919 3e01      ld      a,$01
491b fd213349  ld      iy,$4933
491f dd21eaa9  ld      ix,$a9ea
4923 cd3282    call    $8232
4926 3808      jr      c,$4930
4928 3a644a    ld      a,($4a64)
492b cdd747    call    $47d7
492e 77        ld      (hl),a
492f c9        ret     

4930 c3a349    jp      $49a3
4933 f5        push    af
4934 fde5      push    iy
4936 2a2e4b    ld      hl,($4b2e)
4939 e5        push    hl
493a cdef82    call    $82ef
493d cde745    call    $45e7
4940 cd6c49    call    $496c
4943 cdfb82    call    $82fb
4946 e1        pop     hl
4947 222e4b    ld      ($4b2e),hl
494a fde1      pop     iy
494c f1        pop     af
494d c9        ret     

494e cdd747    call    $47d7
4951 cde847    call    $47e8
4954 322e4b    ld      ($4b2e),a
4957 cd0a48    call    $480a
495a cd6c49    call    $496c
495d c3003f    jp      $3f00
4960 11df49    ld      de,$49df
4963 c37249    jp      $4972
4966 11e549    ld      de,$49e5
4969 c37249    jp      $4972
496c cdbf45    call    $45bf
496f c37402    jp      $0274
4972 d5        push    de
4973 cd6c49    call    $496c
4976 cd8849    call    $4988
4979 d1        pop     de
497a 3001      jr      nc,$497d
497c eb        ex      de,hl
497d 46        ld      b,(hl)
497e 0e02      ld      c,$02
4980 23        inc     hl
4981 5e        ld      e,(hl)
4982 cd0500    call    $0005
4985 10f9      djnz    $4980
4987 c9        ret     

4988 cdd747    call    $47d7
498b 46        ld      b,(hl)
498c 04        inc     b
498d 05        dec     b
498e 2811      jr      z,$49a1
4990 e5        push    hl
4991 23        inc     hl
4992 7e        ld      a,(hl)
4993 fe20      cp      $20
4995 2007      jr      nz,$499e
4997 10f8      djnz    $4991
4999 e1        pop     hl
499a 3600      ld      (hl),$00
499c 1803      jr      $49a1
499e e1        pop     hl
499f b7        or      a
49a0 c9        ret     

49a1 37        scf     
49a2 c9        ret     

49a3 cd6c49    call    $496c
49a6 cdd747    call    $47d7
49a9 5e        ld      e,(hl)
49aa 0e02      ld      c,$02
49ac c30500    jp      $0005
49af cdd747    call    $47d7
49b2 7e        ld      a,(hl)
49b3 23        inc     hl
49b4 b6        or      (hl)
49b5 2012      jr      nz,$49c9
49b7 21ee49    ld      hl,$49ee
49ba cd6c49    call    $496c
49bd 18be      jr      $497d
49bf cdc545    call    $45c5
49c2 cdd747    call    $47d7
49c5 7e        ld      a,(hl)
49c6 c38f82    jp      $828f
49c9 cdc545    call    $45c5
49cc cdd747    call    $47d7
49cf 4e        ld      c,(hl)
49d0 23        inc     hl
49d1 46        ld      b,(hl)
49d2 c39982    jp      $8299
49d5 74        ld      (hl),h
49d6 65        ld      h,l
49d7 78        ld      a,b
49d8 74        ld      (hl),h
49d9 24        inc     h
49da 66        ld      h,(hl)
49db 69        ld      l,c
49dc 6c        ld      l,h
49dd 65        ld      h,l
49de 24        inc     h
49df 04        inc     b
49e0 6e        ld      l,(hl)
49e1 6f        ld      l,a
49e2 6e        ld      l,(hl)
49e3 65        ld      h,l
49e4 24        inc     h
49e5 07        rlca    
49e6 70        ld      (hl),b
49e7 72        ld      (hl),d
49e8 69        ld      l,c
49e9 6e        ld      l,(hl)
49ea 74        ld      (hl),h
49eb 65        ld      h,l
49ec 72        ld      (hl),d
49ed 24        inc     h
49ee 04        inc     b
49ef 6c        ld      l,h
49f0 61        ld      h,c
49f1 73        ld      (hl),e
49f2 74        ld      (hl),h
49f3 4f        ld      c,a
49f4 4e        ld      c,(hl)
49f5 24        inc     h
49f6 4f        ld      c,a
49f7 46        ld      b,(hl)
49f8 46        ld      b,(hl)
49f9 24        inc     h
49fa 68        ld      l,b
49fb 65        ld      h,l
49fc 61        ld      h,c
49fd 64        ld      h,h
49fe 69        ld      l,c
49ff 6e        ld      l,(hl)
4a00 67        ld      h,a
4a01 24        inc     h
4a02 66        ld      h,(hl)
4a03 6f        ld      l,a
4a04 6f        ld      l,a
4a05 74        ld      (hl),h
4a06 69        ld      l,c
4a07 6e        ld      l,(hl)
4a08 67        ld      h,a
4a09 24        inc     h
4a0a 6d        ld      l,l
4a0b 69        ld      l,c
4a0c 64        ld      h,h
4a0d 64        ld      h,h
4a0e 6c        ld      l,h
4a0f 65        ld      h,l
4a10 24        inc     h
4a11 6c        ld      l,h
4a12 65        ld      h,l
4a13 66        ld      h,(hl)
4a14 74        ld      (hl),h
4a15 24        inc     h
4a16 72        ld      (hl),d
4a17 69        ld      l,c
4a18 67        ld      h,a
4a19 68        ld      l,b
4a1a 74        ld      (hl),h
4a1b 24        inc     h
4a1c 61        ld      h,c
4a1d 6c        ld      l,h
4a1e 74        ld      (hl),h
4a1f 65        ld      h,l
4a20 72        ld      (hl),d
4a21 6e        ld      l,(hl)
4a22 61        ld      h,c
4a23 74        ld      (hl),h
4a24 69        ld      l,c
4a25 6e        ld      l,(hl)
4a26 67        ld      h,a
4a27 24        inc     h
4a28 6e        ld      l,(hl)
4a29 6f        ld      l,a
4a2a 24        inc     h
4a2b 79        ld      a,c
4a2c 65        ld      h,l
4a2d 73        ld      (hl),e
4a2e 24        inc     h
4a2f 72        ld      (hl),d
4a30 65        ld      h,l
4a31 67        ld      h,a
4a32 75        ld      (hl),l
4a33 6c        ld      l,h
4a34 61        ld      h,c
4a35 72        ld      (hl),d
4a36 24        inc     h
4a37 69        ld      l,c
4a38 6e        ld      l,(hl)
4a39 63        ld      h,e
4a3a 72        ld      (hl),d
4a3b 65        ld      h,l
4a3c 6d        ld      l,l
4a3d 65        ld      h,l
4a3e 6e        ld      l,(hl)
4a3f 74        ld      (hl),h
4a40 61        ld      h,c
4a41 6c        ld      l,h
4a42 24        inc     h
4a43 3824      jr      c,$4a69
4a45 313024    ld      sp,$2430
4a48 313224    ld      sp,$2432
4a4b 313524    ld      sp,$2435
4a4e 6e        ld      l,(hl)
4a4f 6f        ld      l,a
4a50 72        ld      (hl),d
4a51 6d        ld      l,l
4a52 61        ld      h,c
4a53 6c        ld      l,h
4a54 24        inc     h
4a55 6f        ld      l,a
4a56 6e        ld      l,(hl)
4a57 65        ld      h,l
4a58 2d        dec     l
4a59 61        ld      h,c
4a5a 6e        ld      l,(hl)
4a5b 64        ld      h,h
4a5c 2d        dec     l
4a5d 61        ld      h,c
4a5e 2d        dec     l
4a5f 68        ld      l,b
4a60 61        ld      h,c
4a61 6c        ld      l,h
4a62 66        ld      h,(hl)
4a63 24        inc     h
4a64 00        nop     
4a65 00        nop     
4a66 00        nop     
4a67 00        nop     
4a68 00        nop     
4a69 00        nop     
4a6a 00        nop     
4a6b 00        nop     
4a6c 00        nop     
4a6d 00        nop     
4a6e 00        nop     
4a6f 00        nop     
4a70 00        nop     
4a71 00        nop     
4a72 00        nop     
4a73 00        nop     
4a74 00        nop     
4a75 00        nop     
4a76 00        nop     
4a77 00        nop     
4a78 00        nop     
4a79 00        nop     
4a7a 00        nop     
4a7b 00        nop     
4a7c 00        nop     
4a7d 00        nop     
4a7e 00        nop     
4a7f 00        nop     
4a80 00        nop     
4a81 00        nop     
4a82 00        nop     
4a83 00        nop     
4a84 00        nop     
4a85 00        nop     
4a86 00        nop     
4a87 00        nop     
4a88 00        nop     
4a89 00        nop     
4a8a 00        nop     
4a8b 00        nop     
4a8c 00        nop     
4a8d 00        nop     
4a8e 00        nop     
4a8f 00        nop     
4a90 00        nop     
4a91 00        nop     
4a92 00        nop     
4a93 00        nop     
4a94 00        nop     
4a95 00        nop     
4a96 00        nop     
4a97 00        nop     
4a98 00        nop     
4a99 00        nop     
4a9a 00        nop     
4a9b 00        nop     
4a9c 00        nop     
4a9d 00        nop     
4a9e 00        nop     
4a9f 00        nop     
4aa0 00        nop     
4aa1 00        nop     
4aa2 00        nop     
4aa3 00        nop     
4aa4 00        nop     
4aa5 00        nop     
4aa6 00        nop     
4aa7 00        nop     
4aa8 00        nop     
4aa9 00        nop     
4aaa 00        nop     
4aab 00        nop     
4aac 00        nop     
4aad 00        nop     
4aae 00        nop     
4aaf 00        nop     
4ab0 00        nop     
4ab1 00        nop     
4ab2 00        nop     
4ab3 00        nop     
4ab4 00        nop     
4ab5 00        nop     
4ab6 00        nop     
4ab7 00        nop     
4ab8 00        nop     
4ab9 00        nop     
4aba 00        nop     
4abb 00        nop     
4abc 00        nop     
4abd 00        nop     
4abe 00        nop     
4abf 00        nop     
4ac0 00        nop     
4ac1 00        nop     
4ac2 00        nop     
4ac3 00        nop     
4ac4 00        nop     
4ac5 00        nop     
4ac6 00        nop     
4ac7 00        nop     
4ac8 00        nop     
4ac9 00        nop     
4aca 00        nop     
4acb 00        nop     
4acc 00        nop     
4acd 00        nop     
4ace 00        nop     
4acf 00        nop     
4ad0 00        nop     
4ad1 00        nop     
4ad2 00        nop     
4ad3 00        nop     
4ad4 00        nop     
4ad5 00        nop     
4ad6 00        nop     
4ad7 00        nop     
4ad8 00        nop     
4ad9 00        nop     
4ada 00        nop     
4adb 00        nop     
4adc 00        nop     
4add 00        nop     
4ade 00        nop     
4adf 00        nop     
4ae0 00        nop     
4ae1 00        nop     
4ae2 00        nop     
4ae3 00        nop     
4ae4 00        nop     
4ae5 00        nop     
4ae6 00        nop     
4ae7 00        nop     
4ae8 00        nop     
4ae9 00        nop     
4aea 00        nop     
4aeb 00        nop     
4aec 00        nop     
4aed 00        nop     
4aee 00        nop     
4aef 00        nop     
4af0 00        nop     
4af1 00        nop     
4af2 00        nop     
4af3 00        nop     
4af4 00        nop     
4af5 00        nop     
4af6 00        nop     
4af7 00        nop     
4af8 00        nop     
4af9 00        nop     
4afa 00        nop     
4afb 00        nop     
4afc 00        nop     
4afd 00        nop     
4afe 00        nop     
4aff 00        nop     
4b00 00        nop     
4b01 00        nop     
4b02 00        nop     
4b03 00        nop     
4b04 00        nop     
4b05 00        nop     
4b06 00        nop     
4b07 00        nop     
4b08 00        nop     
4b09 00        nop     
4b0a 00        nop     
4b0b 00        nop     
4b0c 00        nop     
4b0d 00        nop     
4b0e 00        nop     
4b0f 00        nop     
4b10 00        nop     
4b11 00        nop     
4b12 00        nop     
4b13 00        nop     
4b14 00        nop     
4b15 00        nop     
4b16 00        nop     
4b17 00        nop     
4b18 00        nop     
4b19 00        nop     
4b1a 00        nop     
4b1b 00        nop     
4b1c 00        nop     
4b1d 00        nop     
4b1e 00        nop     
4b1f 00        nop     
4b20 00        nop     
4b21 00        nop     
4b22 00        nop     
4b23 00        nop     
4b24 00        nop     
4b25 00        nop     
4b26 00        nop     
4b27 00        nop     
4b28 00        nop     
4b29 00        nop     
4b2a 00        nop     
4b2b 00        nop     
4b2c 00        nop     
4b2d 00        nop     
4b2e 00        nop     
4b2f 00        nop     
4b30 00        nop     
4b31 00        nop     
4b32 00        nop     
4b33 00        nop     
4b34 00        nop     
4b35 00        nop     
4b36 00        nop     
4b37 00        nop     
4b38 00        nop     
4b39 00        nop     
4b3a 00        nop     
4b3b 00        nop     
4b3c 00        nop     
4b3d 00        nop     
4b3e 00        nop     
4b3f 02        ld      (bc),a
4b40 00        nop     
4b41 29        add     hl,hl
4b42 00        nop     
4b43 02        ld      (bc),a
4b44 0a        ld      a,(bc)
4b45 46        ld      b,(hl)
4b46 010105    ld      bc,$0501
4b49 42        ld      b,d
4b4a 00        nop     
4b4b 5f        ld      e,a
4b4c 7e        ld      a,(hl)
4b4d 00        nop     
4b4e 00        nop     
4b4f 00        nop     
4b50 00        nop     
4b51 00        nop     
4b52 00        nop     
4b53 00        nop     
4b54 00        nop     
4b55 00        nop     
4b56 00        nop     
4b57 00        nop     
4b58 00        nop     
4b59 00        nop     
4b5a 00        nop     
4b5b 00        nop     
4b5c 00        nop     
4b5d 00        nop     
4b5e 00        nop     
4b5f 00        nop     
4b60 00        nop     
4b61 00        nop     
4b62 00        nop     
4b63 00        nop     
4b64 00        nop     
4b65 00        nop     
4b66 00        nop     
4b67 00        nop     
4b68 00        nop     
4b69 00        nop     
4b6a 00        nop     
4b6b 00        nop     
4b6c 00        nop     
4b6d 00        nop     
4b6e 00        nop     
4b6f 00        nop     
4b70 00        nop     
4b71 00        nop     
4b72 00        nop     
4b73 00        nop     
4b74 00        nop     
4b75 00        nop     
4b76 00        nop     
4b77 00        nop     
4b78 00        nop     
4b79 00        nop     
4b7a 00        nop     
4b7b 00        nop     
4b7c 00        nop     
4b7d 00        nop     
4b7e 00        nop     
4b7f 00        nop     
4b80 00        nop     
4b81 00        nop     
4b82 00        nop     
4b83 00        nop     
4b84 00        nop     
4b85 00        nop     
4b86 00        nop     
4b87 00        nop     
4b88 00        nop     
4b89 00        nop     
4b8a 00        nop     
4b8b 00        nop     
4b8c 00        nop     
4b8d 00        nop     
4b8e 00        nop     
4b8f 00        nop     
4b90 00        nop     
4b91 00        nop     
4b92 00        nop     
4b93 00        nop     
4b94 00        nop     
4b95 00        nop     
4b96 00        nop     
4b97 00        nop     
4b98 00        nop     
4b99 00        nop     
4b9a 00        nop     
4b9b 00        nop     
4b9c 00        nop     
4b9d 00        nop     
4b9e 00        nop     
4b9f 00        nop     
4ba0 00        nop     
4ba1 00        nop     
4ba2 00        nop     
4ba3 00        nop     
4ba4 00        nop     
4ba5 00        nop     
4ba6 00        nop     
4ba7 00        nop     
4ba8 00        nop     
4ba9 00        nop     
4baa 00        nop     
4bab 00        nop     
4bac 00        nop     
4bad 00        nop     
4bae 00        nop     
4baf 00        nop     
4bb0 00        nop     
4bb1 00        nop     
4bb2 00        nop     
4bb3 00        nop     
4bb4 00        nop     
4bb5 00        nop     
4bb6 00        nop     
4bb7 00        nop     
4bb8 00        nop     
4bb9 00        nop     
4bba 00        nop     
4bbb 00        nop     
4bbc 00        nop     
4bbd 00        nop     
4bbe 00        nop     
4bbf 00        nop     
4bc0 00        nop     
4bc1 00        nop     
4bc2 00        nop     
4bc3 00        nop     
4bc4 00        nop     
4bc5 00        nop     
4bc6 00        nop     
4bc7 00        nop     
4bc8 00        nop     
4bc9 00        nop     
4bca 00        nop     
4bcb 00        nop     
4bcc 00        nop     
4bcd 00        nop     
4bce 00        nop     
4bcf 00        nop     
4bd0 00        nop     
4bd1 00        nop     
4bd2 00        nop     
4bd3 00        nop     
4bd4 00        nop     
4bd5 00        nop     
4bd6 00        nop     
4bd7 00        nop     
4bd8 00        nop     
4bd9 00        nop     
4bda 00        nop     
4bdb 00        nop     
4bdc 00        nop     
4bdd 00        nop     
4bde 00        nop     
4bdf 00        nop     
4be0 00        nop     
4be1 00        nop     
4be2 00        nop     
4be3 00        nop     
4be4 00        nop     
4be5 00        nop     
4be6 00        nop     
4be7 00        nop     
4be8 00        nop     
4be9 00        nop     
4bea 00        nop     
4beb 00        nop     
4bec 00        nop     
4bed 00        nop     
4bee 00        nop     
4bef 00        nop     
4bf0 00        nop     
4bf1 00        nop     
4bf2 00        nop     
4bf3 00        nop     
4bf4 00        nop     
4bf5 00        nop     
4bf6 00        nop     
4bf7 00        nop     
4bf8 00        nop     
4bf9 00        nop     
4bfa 00        nop     
4bfb 00        nop     
4bfc 00        nop     
4bfd 00        nop     
4bfe 00        nop     
4bff 00        nop     
4c00 00        nop     
4c01 00        nop     
4c02 00        nop     
4c03 00        nop     
4c04 00        nop     
4c05 00        nop     
4c06 00        nop     
4c07 00        nop     
4c08 00        nop     
4c09 00        nop     
4c0a 00        nop     
4c0b 00        nop     
4c0c 00        nop     
4c0d 00        nop     
4c0e 00        nop     
4c0f 00        nop     
4c10 00        nop     
4c11 00        nop     
4c12 00        nop     
4c13 00        nop     
4c14 00        nop     
4c15 00        nop     
4c16 00        nop     
4c17 00        nop     
4c18 00        nop     
4c19 00        nop     
4c1a 00        nop     
4c1b 00        nop     
4c1c 00        nop     
4c1d 00        nop     
4c1e 00        nop     
4c1f 00        nop     
4c20 00        nop     
4c21 00        nop     
4c22 00        nop     
4c23 00        nop     
4c24 010001    ld      bc,$0100
4c27 00        nop     
4c28 00        nop     
4c29 010004    ld      bc,$0400
4c2c 010000    ld      bc,$0000
4c2f 00        nop     
4c30 07        rlca    
4c31 70        ld      (hl),b
4c32 72        ld      (hl),d
4c33 69        ld      l,c
4c34 6e        ld      l,(hl)
4c35 74        ld      (hl),h
4c36 65        ld      h,l
4c37 72        ld      (hl),d
4c38 00        nop     
4c39 00        nop     
4c3a 00        nop     
4c3b 00        nop     
4c3c 00        nop     
4c3d 00        nop     
4c3e 00        nop     
4c3f 00        nop     
4c40 00        nop     
4c41 00        nop     
4c42 00        nop     
4c43 00        nop     
4c44 00        nop     
4c45 00        nop     
4c46 00        nop     
4c47 00        nop     
4c48 00        nop     
4c49 00        nop     
4c4a 00        nop     
4c4b 00        nop     
4c4c 00        nop     
4c4d 00        nop     
4c4e 00        nop     
4c4f 00        nop     
4c50 00        nop     
4c51 00        nop     
4c52 00        nop     
4c53 00        nop     
4c54 00        nop     
4c55 00        nop     
4c56 00        nop     
4c57 00        nop     
4c58 00        nop     
4c59 00        nop     
4c5a 00        nop     
4c5b 00        nop     
4c5c 00        nop     
4c5d 00        nop     
4c5e 00        nop     
4c5f 00        nop     
4c60 00        nop     
4c61 00        nop     
4c62 00        nop     
4c63 00        nop     
4c64 00        nop     
4c65 00        nop     
4c66 00        nop     
4c67 00        nop     
4c68 00        nop     
4c69 00        nop     
4c6a 00        nop     
4c6b 00        nop     
4c6c 00        nop     
4c6d 010000    ld      bc,$0000
4c70 00        nop     
4c71 00        nop     
4c72 00        nop     
4c73 00        nop     
4c74 00        nop     
4c75 00        nop     
4c76 00        nop     
4c77 00        nop     
4c78 00        nop     
4c79 00        nop     
4c7a 00        nop     
4c7b 00        nop     
4c7c 00        nop     
4c7d 00        nop     
4c7e 00        nop     
4c7f 00        nop     
4c80 00        nop     
4c81 00        nop     
4c82 00        nop     
4c83 00        nop     
4c84 00        nop     
4c85 00        nop     
4c86 00        nop     
4c87 00        nop     
4c88 00        nop     
4c89 00        nop     
4c8a 00        nop     
4c8b 00        nop     
4c8c 00        nop     
4c8d 00        nop     
4c8e 00        nop     
4c8f 00        nop     
4c90 00        nop     
4c91 00        nop     
4c92 00        nop     
4c93 00        nop     
4c94 00        nop     
4c95 00        nop     
4c96 00        nop     
4c97 00        nop     
4c98 00        nop     
4c99 00        nop     
4c9a 00        nop     
4c9b 00        nop     
4c9c 00        nop     
4c9d 00        nop     
4c9e 00        nop     
4c9f 00        nop     
4ca0 00        nop     
4ca1 00        nop     
4ca2 00        nop     
4ca3 00        nop     
4ca4 00        nop     
4ca5 00        nop     
4ca6 00        nop     
4ca7 00        nop     
4ca8 00        nop     
4ca9 00        nop     
4caa 00        nop     
4cab 00        nop     
4cac 00        nop     
4cad 00        nop     
4cae 00        nop     
4caf 00        nop     
4cb0 00        nop     
4cb1 00        nop     
4cb2 00        nop     
4cb3 00        nop     
4cb4 00        nop     
4cb5 00        nop     
4cb6 00        nop     
4cb7 00        nop     
4cb8 00        nop     
4cb9 00        nop     
4cba 00        nop     
4cbb 00        nop     
4cbc 00        nop     
4cbd 00        nop     
4cbe 00        nop     
4cbf 00        nop     
4cc0 00        nop     
4cc1 00        nop     
4cc2 00        nop     
4cc3 00        nop     
4cc4 00        nop     
4cc5 00        nop     
4cc6 00        nop     
4cc7 00        nop     
4cc8 00        nop     
4cc9 00        nop     
4cca 00        nop     
4ccb 00        nop     
4ccc 00        nop     
4ccd 00        nop     
4cce 00        nop     
4ccf 00        nop     
4cd0 00        nop     
4cd1 00        nop     
4cd2 00        nop     
4cd3 00        nop     
4cd4 00        nop     
4cd5 00        nop     
4cd6 00        nop     
4cd7 00        nop     
4cd8 00        nop     
4cd9 00        nop     
4cda 00        nop     
4cdb 00        nop     
4cdc 00        nop     
4cdd 00        nop     
4cde 00        nop     
4cdf 00        nop     
4ce0 00        nop     
4ce1 00        nop     
4ce2 00        nop     
4ce3 00        nop     
4ce4 00        nop     
4ce5 00        nop     
4ce6 00        nop     
4ce7 00        nop     
4ce8 00        nop     
4ce9 00        nop     
4cea 00        nop     
4ceb 00        nop     
4cec 00        nop     
4ced 00        nop     
4cee 00        nop     
4cef 00        nop     
4cf0 00        nop     
4cf1 00        nop     
4cf2 00        nop     
4cf3 00        nop     
4cf4 00        nop     
4cf5 00        nop     
4cf6 00        nop     
4cf7 00        nop     
4cf8 00        nop     
4cf9 00        nop     
4cfa 00        nop     
4cfb 00        nop     
4cfc 00        nop     
4cfd 00        nop     
4cfe 00        nop     
4cff 00        nop     
4d00 00        nop     
4d01 00        nop     
4d02 00        nop     
4d03 00        nop     
4d04 00        nop     
4d05 00        nop     
4d06 00        nop     
4d07 00        nop     
4d08 00        nop     
4d09 00        nop     
4d0a 00        nop     
4d0b 00        nop     
4d0c 00        nop     
4d0d 00        nop     
4d0e 00        nop     
4d0f 00        nop     
4d10 00        nop     
4d11 00        nop     
4d12 00        nop     
4d13 00        nop     
4d14 00        nop     
4d15 00        nop     
4d16 00        nop     
4d17 00        nop     
4d18 00        nop     
4d19 00        nop     
4d1a 00        nop     
4d1b 00        nop     
4d1c 00        nop     
4d1d 00        nop     
4d1e 00        nop     
4d1f 00        nop     
4d20 00        nop     
4d21 00        nop     
4d22 00        nop     
4d23 00        nop     
4d24 00        nop     
4d25 00        nop     
4d26 00        nop     
4d27 00        nop     
4d28 00        nop     
4d29 00        nop     
4d2a 00        nop     
4d2b 00        nop     
4d2c 00        nop     
4d2d 00        nop     
4d2e 00        nop     
4d2f 00        nop     
4d30 00        nop     
4d31 00        nop     
4d32 00        nop     
4d33 00        nop     
4d34 00        nop     
4d35 00        nop     
4d36 00        nop     
4d37 00        nop     
4d38 00        nop     
4d39 00        nop     
4d3a 00        nop     
4d3b 00        nop     
4d3c 00        nop     
4d3d 00        nop     
4d3e 00        nop     
4d3f 00        nop     
4d40 00        nop     
4d41 00        nop     
4d42 00        nop     
4d43 00        nop     
4d44 00        nop     
4d45 00        nop     
4d46 00        nop     
4d47 00        nop     
4d48 00        nop     
4d49 00        nop     
4d4a 00        nop     
4d4b 00        nop     
4d4c 00        nop     
4d4d 00        nop     
4d4e 00        nop     
4d4f 00        nop     
4d50 00        nop     
4d51 00        nop     
4d52 00        nop     
4d53 00        nop     
4d54 00        nop     
4d55 00        nop     
4d56 00        nop     
4d57 00        nop     
4d58 00        nop     
4d59 00        nop     
4d5a 00        nop     
4d5b 00        nop     
4d5c 00        nop     
4d5d 00        nop     
4d5e 00        nop     
4d5f 00        nop     
4d60 00        nop     
4d61 00        nop     
4d62 00        nop     
4d63 00        nop     
4d64 00        nop     
4d65 00        nop     
4d66 00        nop     
4d67 00        nop     
4d68 00        nop     
4d69 00        nop     
4d6a 00        nop     
4d6b 00        nop     
4d6c 00        nop     
4d6d 00        nop     
4d6e 00        nop     
4d6f 00        nop     
4d70 00        nop     
4d71 00        nop     
4d72 00        nop     
4d73 00        nop     
4d74 00        nop     
4d75 00        nop     
4d76 00        nop     
4d77 00        nop     
4d78 00        nop     
4d79 00        nop     
4d7a 00        nop     
4d7b 00        nop     
4d7c 00        nop     
4d7d 00        nop     
4d7e 00        nop     
4d7f 00        nop     
4d80 00        nop     
4d81 00        nop     
4d82 00        nop     
4d83 00        nop     
4d84 00        nop     
4d85 00        nop     
4d86 00        nop     
4d87 00        nop     
4d88 00        nop     
4d89 00        nop     
4d8a 00        nop     
4d8b 00        nop     
4d8c 00        nop     
4d8d 00        nop     
4d8e 00        nop     
4d8f 00        nop     
4d90 00        nop     
4d91 00        nop     
4d92 00        nop     
4d93 00        nop     
4d94 00        nop     
4d95 00        nop     
4d96 00        nop     
4d97 00        nop     
4d98 00        nop     
4d99 00        nop     
4d9a 00        nop     
4d9b 00        nop     
4d9c 00        nop     
4d9d 00        nop     
4d9e 00        nop     
4d9f 00        nop     
4da0 00        nop     
4da1 00        nop     
4da2 00        nop     
4da3 00        nop     
4da4 00        nop     
4da5 00        nop     
4da6 00        nop     
4da7 00        nop     
4da8 00        nop     
4da9 00        nop     
4daa 00        nop     
4dab 00        nop     
4dac 00        nop     
4dad 00        nop     
4dae 00        nop     
4daf 00        nop     
4db0 00        nop     
4db1 00        nop     
4db2 00        nop     
4db3 00        nop     
4db4 00        nop     
4db5 00        nop     
4db6 00        nop     
4db7 00        nop     
4db8 cda145    call    $45a1
4dbb 213f4b    ld      hl,$4b3f
4dbe 11e977    ld      de,$77e9
4dc1 01ec00    ld      bc,$00ec
4dc4 edb0      ldir    
4dc6 fde5      push    iy
4dc8 cd4751    call    $5147
4dcb dde5      push    ix
4dcd cdb544    call    $44b5
4dd0 dde1      pop     ix
4dd2 3004      jr      nc,$4dd8
4dd4 fde1      pop     iy
4dd6 185b      jr      $4e33
4dd8 cd5951    call    $5159
4ddb 21e977    ld      hl,$77e9
4dde 116e4c    ld      de,$4c6e
4de1 01ec00    ld      bc,$00ec
4de4 edb0      ldir    
4de6 fde1      pop     iy
4de8 cd9456    call    $5694
4deb 3846      jr      c,$4e33
4ded cd8551    call    $5185
4df0 3a6d4c    ld      a,($4c6d)
4df3 b7        or      a
4df4 283a      jr      z,$4e30
4df6 47        ld      b,a
4df7 c5        push    bc
4df8 180f      jr      $4e09
4dfa c5        push    bc
4dfb cd4752    call    $5247
4dfe cdfc26    call    $26fc
4e01 cd5151    call    $5151
4e04 3e0c      ld      a,$0c
4e06 cdc453    call    $53c4
4e09 cd734e    call    $4e73
4e0c cd364e    call    $4e36
4e0f 3e1b      ld      a,$1b
4e11 380d      jr      c,$4e20
4e13 cd9043    call    $4390
4e16 2005      jr      nz,$4e1d
4e18 cdc14e    call    $4ec1
4e1b 1803      jr      $4e20
4e1d cdea4e    call    $4eea
4e20 c1        pop     bc
4e21 fe1b      cp      $1b
4e23 2802      jr      z,$4e27
4e25 10d3      djnz    $4dfa
4e27 cd7945    call    $4579
4e2a cdac4e    call    $4eac
4e2d cd9f51    call    $519f
4e30 cdef56    call    $56ef
4e33 c3b345    jp      $45b3
4e36 1811      jr      $4e49
4e38 cdc47f    call    $7fc4
4e3b 3834      jr      c,$4e71
4e3d cd9151    call    $5191
4e40 3807      jr      c,$4e49
4e42 cdb827    call    $27b8
4e45 fe01      cp      $01
4e47 2828      jr      z,$4e71
4e49 2a4c58    ld      hl,($584c)
4e4c ed5b2c4c  ld      de,($4c2c)
4e50 b7        or      a
4e51 ed52      sbc     hl,de
4e53 d0        ret     nc

4e54 dd7e00    ld      a,(ix+$00)
4e57 fe1a      cp      $1a
4e59 2816      jr      z,$4e71
4e5b fe0c      cp      $0c
4e5d 280d      jr      z,$4e6c
4e5f fe0d      cp      $0d
4e61 2804      jr      z,$4e67
4e63 fe0a      cp      $0a
4e65 20d1      jr      nz,$4e38
4e67 cdff51    call    $51ff
4e6a 30cc      jr      nc,$4e38
4e6c cdb253    call    $53b2
4e6f 18c7      jr      $4e38
4e71 37        scf     
4e72 c9        ret     

4e73 212b4c    ld      hl,$4c2b
4e76 cb66      bit     4,(hl)
4e78 280a      jr      z,$4e84
4e7a 3e19      ld      a,$19
4e7c cdc453    call    $53c4
4e7f 3e8c      ld      a,$8c
4e81 cdc453    call    $53c4
4e84 7e        ld      a,(hl)
4e85 e60c      and     $0c
4e87 b7        or      a
4e88 2814      jr      z,$4e9e
4e8a fe04      cp      $04
4e8c 280c      jr      z,$4e9a
4e8e fe08      cp      $08
4e90 2804      jr      z,$4e96
4e92 3e88      ld      a,$88
4e94 180a      jr      $4ea0
4e96 3e8a      ld      a,$8a
4e98 1806      jr      $4ea0
4e9a 3e8c      ld      a,$8c
4e9c 1802      jr      $4ea0
4e9e 3e8f      ld      a,$8f
4ea0 325658    ld      ($5856),a
4ea3 cdc453    call    $53c4
4ea6 c640      add     a,$40
4ea8 325758    ld      ($5857),a
4eab c9        ret     

4eac 3e8c      ld      a,$8c
4eae cdc453    call    $53c4
4eb1 212b4c    ld      hl,$4c2b
4eb4 cb66      bit     4,(hl)
4eb6 c8        ret     z

4eb7 3e19      ld      a,$19
4eb9 cdc453    call    $53c4
4ebc 3e88      ld      a,$88
4ebe c3c453    jp      $53c4
4ec1 cdff52    call    $52ff
4ec4 1811      jr      $4ed7
4ec6 cdc47f    call    $7fc4
4ec9 3e1b      ld      a,$1b
4ecb d8        ret     c

4ecc cd9151    call    $5191
4ecf 3806      jr      c,$4ed7
4ed1 cdb827    call    $27b8
4ed4 fe01      cp      $01
4ed6 c8        ret     z

4ed7 dd7e00    ld      a,(ix+$00)
4eda fe87      cp      $87
4edc 28e8      jr      z,$4ec6
4ede fe8b      cp      $8b
4ee0 28e4      jr      z,$4ec6
4ee2 e67f      and     $7f
4ee4 cdae51    call    $51ae
4ee7 30dd      jr      nc,$4ec6
4ee9 c9        ret     

4eea cd2e51    call    $512e
4eed 97        sub     a
4eee 322551    ld      ($5125),a
4ef1 cdff52    call    $52ff
4ef4 180f      jr      $4f05
4ef6 cd9151    call    $5191
4ef9 380a      jr      c,$4f05
4efb cdb827    call    $27b8
4efe fe01      cp      $01
4f00 2003      jr      nz,$4f05
4f02 c3c552    jp      $52c5
4f05 dd7e00    ld      a,(ix+$00)
4f08 fe1a      cp      $1a
4f0a 200d      jr      nz,$4f19
4f0c 3a2551    ld      a,($5125)
4f0f b7        or      a
4f10 20e9      jr      nz,$4efb
4f12 3e01      ld      a,$01
4f14 322551    ld      ($5125),a
4f17 3e1a      ld      a,$1a
4f19 cd1f4f    call    $4f1f
4f1c 30d8      jr      nc,$4ef6
4f1e c9        ret     

4f1f fe1a      cp      $1a
4f21 282b      jr      z,$4f4e
4f23 fe87      cp      $87
4f25 c8        ret     z

4f26 fe8b      cp      $8b
4f28 c8        ret     z

4f29 2a2c51    ld      hl,($512c)
4f2c fea0      cp      $a0
4f2e 2802      jr      z,$4f32
4f30 e67f      and     $7f
4f32 77        ld      (hl),a
4f33 23        inc     hl
4f34 222c51    ld      ($512c),hl
4f37 fe0d      cp      $0d
4f39 2817      jr      z,$4f52
4f3b fe0a      cp      $0a
4f3d 2813      jr      z,$4f52
4f3f fe0c      cp      $0c
4f41 280f      jr      z,$4f52
4f43 3a2651    ld      a,($5126)
4f46 3d        dec     a
4f47 322651    ld      ($5126),a
4f4a b7        or      a
4f4b 3e00      ld      a,$00
4f4d c0        ret     nz

4f4e 3e0d      ld      a,$0d
4f50 77        ld      (hl),a
4f51 23        inc     hl
4f52 3a5658    ld      a,($5856)
4f55 322851    ld      ($5128),a
4f58 cdc453    call    $53c4
4f5b 11e977    ld      de,$77e9
4f5e b7        or      a
4f5f ed52      sbc     hl,de
4f61 cac450    jp      z,$50c4
4f64 44        ld      b,h
4f65 4d        ld      c,l
4f66 62        ld      h,d
4f67 6b        ld      l,e
4f68 7e        ld      a,(hl)
4f69 23        inc     hl
4f6a fe0d      cp      $0d
4f6c ca2150    jp      z,$5021
4f6f fe0a      cp      $0a
4f71 ca2150    jp      z,$5021
4f74 fe0c      cp      $0c
4f76 ca2150    jp      z,$5021
4f79 fe20      cp      $20
4f7b 2808      jr      z,$4f85
4f7d fea0      cp      $a0
4f7f 2804      jr      z,$4f85
4f81 fe09      cp      $09
4f83 2012      jr      nz,$4f97
4f85 e67f      and     $7f
4f87 cdc453    call    $53c4
4f8a 0b        dec     bc
4f8b c5        push    bc
4f8c e5        push    hl
4f8d 54        ld      d,h
4f8e 5d        ld      e,l
4f8f 1b        dec     de
4f90 edb0      ldir    
4f92 e1        pop     hl
4f93 c1        pop     bc
4f94 2b        dec     hl
4f95 18d1      jr      $4f68
4f97 2b        dec     hl
4f98 0600      ld      b,$00
4f9a 78        ld      a,b
4f9b 325358    ld      ($5853),a
4f9e 7e        ld      a,(hl)
4f9f 47        ld      b,a
4fa0 23        inc     hl
4fa1 fe0d      cp      $0d
4fa3 2857      jr      z,$4ffc
4fa5 fe0a      cp      $0a
4fa7 2853      jr      z,$4ffc
4fa9 fe0c      cp      $0c
4fab 284f      jr      z,$4ffc
4fad fe09      cp      $09
4faf cac450    jp      z,$50c4
4fb2 fea0      cp      $a0
4fb4 281a      jr      z,$4fd0
4fb6 fe20      cp      $20
4fb8 280d      jr      z,$4fc7
4fba fe20      cp      $20
4fbc 38dc      jr      c,$4f9a
4fbe 3a2951    ld      a,($5129)
4fc1 3c        inc     a
4fc2 322951    ld      ($5129),a
4fc5 18d3      jr      $4f9a
4fc7 3a2b51    ld      a,($512b)
4fca 3c        inc     a
4fcb 322b51    ld      ($512b),a
4fce 18ca      jr      $4f9a
4fd0 0e00      ld      c,$00
4fd2 2b        dec     hl
4fd3 3a5758    ld      a,($5857)
4fd6 77        ld      (hl),a
4fd7 23        inc     hl
4fd8 0c        inc     c
4fd9 79        ld      a,c
4fda fe05      cp      $05
4fdc d2c450    jp      nc,$50c4
4fdf 7e        ld      a,(hl)
4fe0 fea0      cp      $a0
4fe2 28ef      jr      z,$4fd3
4fe4 fe20      cp      $20
4fe6 280b      jr      z,$4ff3
4fe8 3a5358    ld      a,($5853)
4feb fe20      cp      $20
4fed 2804      jr      z,$4ff3
4fef 2b        dec     hl
4ff0 3620      ld      (hl),$20
4ff2 0d        dec     c
4ff3 3a2a51    ld      a,($512a)
4ff6 81        add     a,c
4ff7 322a51    ld      ($512a),a
4ffa 189e      jr      $4f9a
4ffc 325358    ld      ($5853),a
4fff 2b        dec     hl
5000 2b        dec     hl
5001 7e        ld      a,(hl)
5002 fe20      cp      $20
5004 280d      jr      z,$5013
5006 fea0      cp      $a0
5008 2016      jr      nz,$5020
500a 3a2a51    ld      a,($512a)
500d 3d        dec     a
500e 322a51    ld      ($512a),a
5011 1807      jr      $501a
5013 3a2b51    ld      a,($512b)
5016 3d        dec     a
5017 322b51    ld      ($512b),a
501a 3a5358    ld      a,($5853)
501d 77        ld      (hl),a
501e 18e0      jr      $5000
5020 23        inc     hl
5021 11e977    ld      de,$77e9
5024 b7        or      a
5025 ed52      sbc     hl,de
5027 cac450    jp      z,$50c4
502a 44        ld      b,h
502b 4d        ld      c,l
502c 62        ld      h,d
502d 6b        ld      l,e
502e 7e        ld      a,(hl)
502f fec0      cp      $c0
5031 380b      jr      c,$503e
5033 c5        push    bc
5034 e5        push    hl
5035 54        ld      d,h
5036 5d        ld      e,l
5037 23        inc     hl
5038 edb0      ldir    
503a e1        pop     hl
503b c1        pop     bc
503c 1801      jr      $503f
503e 23        inc     hl
503f 0b        dec     bc
5040 78        ld      a,b
5041 b1        or      c
5042 20ea      jr      nz,$502e
5044 97        sub     a
5045 322751    ld      ($5127),a
5048 3a2a51    ld      a,($512a)
504b b7        or      a
504c 2876      jr      z,$50c4
504e 4f        ld      c,a
504f 3a2b51    ld      a,($512b)
5052 47        ld      b,a
5053 97        sub     a
5054 210000    ld      hl,$0000
5057 110000    ld      de,$0000
505a 3a5658    ld      a,($5856)
505d d680      sub     $80
505f cd8d90    call    $908d
5062 0d        dec     c
5063 20f5      jr      nz,$505a
5065 3a5758    ld      a,($5857)
5068 4f        ld      c,a
5069 d6c0      sub     $c0
506b cb3f      srl     a
506d c6c1      add     a,$c1
506f 58        ld      e,b
5070 b7        or      a
5071 ed52      sbc     hl,de
5073 3848      jr      c,$50bd
5075 0c        inc     c
5076 b9        cp      c
5077 30f7      jr      nc,$5070
5079 3a2951    ld      a,($5129)
507c d601      sub     $01
507e 3844      jr      c,$50c4
5080 2842      jr      z,$50c4
5082 5f        ld      e,a
5083 3a5658    ld      a,($5856)
5086 d680      sub     $80
5088 cb3f      srl     a
508a c679      add     a,$79
508c 47        ld      b,a
508d b7        or      a
508e ed52      sbc     hl,de
5090 380c      jr      c,$509e
5092 3a2851    ld      a,($5128)
5095 3c        inc     a
5096 322851    ld      ($5128),a
5099 b8        cp      b
509a 3015      jr      nc,$50b1
509c 18ef      jr      $508d
509e 19        add     hl,de
509f 7c        ld      a,h
50a0 b5        or      l
50a1 280e      jr      z,$50b1
50a3 7d        ld      a,l
50a4 322751    ld      ($5127),a
50a7 3a2851    ld      a,($5128)
50aa 3c        inc     a
50ab 322851    ld      ($5128),a
50ae 210000    ld      hl,$0000
50b1 3a2b51    ld      a,($512b)
50b4 5f        ld      e,a
50b5 b7        or      a
50b6 ed52      sbc     hl,de
50b8 3803      jr      c,$50bd
50ba 0c        inc     c
50bb 18f8      jr      $50b5
50bd 19        add     hl,de
50be 45        ld      b,l
50bf 21e977    ld      hl,$77e9
50c2 1807      jr      $50cb
50c4 0600      ld      b,$00
50c6 0e20      ld      c,$20
50c8 21e977    ld      hl,$77e9
50cb 3a2851    ld      a,($5128)
50ce cdc453    call    $53c4
50d1 7e        ld      a,(hl)
50d2 fe0d      cp      $0d
50d4 2839      jr      z,$510f
50d6 fe0a      cp      $0a
50d8 2835      jr      z,$510f
50da fe0c      cp      $0c
50dc 2831      jr      z,$510f
50de fe21      cp      $21
50e0 3014      jr      nc,$50f6
50e2 fe20      cp      $20
50e4 200a      jr      nz,$50f0
50e6 78        ld      a,b
50e7 b7        or      a
50e8 2003      jr      nz,$50ed
50ea 79        ld      a,c
50eb 1803      jr      $50f0
50ed 05        dec     b
50ee 79        ld      a,c
50ef 3c        inc     a
50f0 cdae51    call    $51ae
50f3 23        inc     hl
50f4 18db      jr      $50d1
50f6 cdae51    call    $51ae
50f9 23        inc     hl
50fa 3a2751    ld      a,($5127)
50fd b7        or      a
50fe 28d1      jr      z,$50d1
5100 3d        dec     a
5101 322751    ld      ($5127),a
5104 20cb      jr      nz,$50d1
5106 3a2851    ld      a,($5128)
5109 3d        dec     a
510a cdc453    call    $53c4
510d 18c2      jr      $50d1
510f f5        push    af
5110 3a5658    ld      a,($5856)
5113 cdc453    call    $53c4
5116 f1        pop     af
5117 cdae51    call    $51ae
511a d8        ret     c

511b cd2e51    call    $512e
511e cdc47f    call    $7fc4
5121 d0        ret     nc

5122 3e1b      ld      a,$1b
5124 c9        ret     

5125 00        nop     
5126 ff        rst     $38
5127 00        nop     
5128 8c        adc     a,h
5129 00        nop     
512a 00        nop     
512b 00        nop     
512c e9        jp      (hl)
512d 77        ld      (hl),a
512e 97        sub     a
512f 322a51    ld      ($512a),a
5132 322b51    ld      ($512b),a
5135 322751    ld      ($5127),a
5138 322951    ld      ($5129),a
513b 21e977    ld      hl,$77e9
513e 222c51    ld      ($512c),hl
5141 3eff      ld      a,$ff
5143 322651    ld      ($5126),a
5146 c9        ret     

5147 97        sub     a
5148 321e27    ld      ($271e),a
514b cdb827    call    $27b8
514e c3b555    jp      $55b5
5151 3e01      ld      a,$01
5153 321e27    ld      ($271e),a
5156 cdb827    call    $27b8
5159 cd3a53    call    $533a
515c 3e01      ld      a,$01
515e 325258    ld      ($5852),a
5161 210100    ld      hl,$0001
5164 224c58    ld      ($584c),hl
5167 2a2e4c    ld      hl,($4c2e)
516a 225a58    ld      ($585a),hl
516d 2a2c4c    ld      hl,($4c2c)
5170 ed5b264c  ld      de,($4c26)
5174 ed4b244c  ld      bc,($4c24)
5178 b7        or      a
5179 ed42      sbc     hl,bc
517b ed535858  ld      ($5858),de
517f d8        ret     c

5180 19        add     hl,de
5181 225858    ld      ($5858),hl
5184 c9        ret     

5185 dde5      push    ix
5187 dd2187d0  ld      ix,$d087
518b cdf73e    call    $3ef7
518e dde1      pop     ix
5190 c9        ret     

5191 dd23      inc     ix
5193 dde5      push    ix
5195 d1        pop     de
5196 7a        ld      a,d
5197 fe01      cp      $01
5199 2003      jr      nz,$519e
519b 7b        ld      a,e
519c fe00      cp      $00
519e c9        ret     

519f cd0e35    call    $350e
51a2 2005      jr      nz,$51a9
51a4 3e0c      ld      a,$0c
51a6 c3c453    jp      $53c4
51a9 3e0d      ld      a,$0d
51ab c3c453    jp      $53c4
51ae c5        push    bc
51af e5        push    hl
51b0 fe0d      cp      $0d
51b2 2804      jr      z,$51b8
51b4 fe0a      cp      $0a
51b6 2005      jr      nz,$51bd
51b8 cded51    call    $51ed
51bb 1827      jr      $51e4
51bd fe1a      cp      $1a
51bf 2006      jr      nz,$51c7
51c1 cdc552    call    $52c5
51c4 37        scf     
51c5 181d      jr      $51e4
51c7 fe0c      cp      $0c
51c9 2005      jr      nz,$51d0
51cb cd2952    call    $5229
51ce 1814      jr      $51e4
51d0 cd8355    call    $5583
51d3 fe02      cp      $02
51d5 2804      jr      z,$51db
51d7 fe03      cp      $03
51d9 2005      jr      nz,$51e0
51db cd5452    call    $5254
51de 3808      jr      c,$51e8
51e0 cdc453    call    $53c4
51e3 b7        or      a
51e4 3e00      ld      a,$00
51e6 1802      jr      $51ea
51e8 3e1b      ld      a,$1b
51ea e1        pop     hl
51eb c1        pop     bc
51ec c9        ret     

51ed c5        push    bc
51ee d5        push    de
51ef e5        push    hl
51f0 cdff51    call    $51ff
51f3 f5        push    af
51f4 cd1854    call    $5418
51f7 f1        pop     af
51f8 dc2952    call    c,$5229
51fb e1        pop     hl
51fc d1        pop     de
51fd c1        pop     bc
51fe c9        ret     

51ff ed5b4a58  ld      de,($584a)
5203 13        inc     de
5204 ed534a58  ld      ($584a),de
5208 3a414b    ld      a,($4b41)
520b cb5f      bit     3,a
520d 2818      jr      z,$5227
520f 2a494b    ld      hl,($4b49)
5212 3a474b    ld      a,($4b47)
5215 cd1b91    call    $911b
5218 3a484b    ld      a,($4b48)
521b cd1b91    call    $911b
521e b7        or      a
521f ed52      sbc     hl,de
5221 2802      jr      z,$5225
5223 3002      jr      nc,$5227
5225 37        scf     
5226 c9        ret     

5227 b7        or      a
5228 c9        ret     

5229 cdc552    call    $52c5
522c cda553    call    $53a5
522f 2a5a58    ld      hl,($585a)
5232 7c        ld      a,h
5233 b5        or      l
5234 2808      jr      z,$523e
5236 ed5b4c58  ld      de,($584c)
523a b7        or      a
523b ed52      sbc     hl,de
523d d8        ret     c

523e cd4752    call    $5247
5241 d8        ret     c

5242 cdff52    call    $52ff
5245 b7        or      a
5246 c9        ret     

5247 dde5      push    ix
5249 cd9843    call    $4398
524c 2803      jr      z,$5251
524e cda652    call    $52a6
5251 dde1      pop     ix
5253 c9        ret     

5254 f5        push    af
5255 dde5      push    ix
5257 e67f      and     $7f
5259 cda043    call    $43a0
525c 2844      jr      z,$52a2
525e fe02      cp      $02
5260 281a      jr      z,$527c
5262 3a4758    ld      a,($5847)
5265 fe00      cp      $00
5267 3839      jr      c,$52a2
5269 3d        dec     a
526a 324758    ld      ($5847),a
526d dd2196d0  ld      ix,$d096
5271 fe00      cp      $00
5273 fa9552    jp      m,$5295
5276 dd2100d1  ld      ix,$d100
527a 1819      jr      $5295
527c 3a4758    ld      a,($5847)
527f fe01      cp      $01
5281 f2a252    jp      p,$52a2
5284 3c        inc     a
5285 324758    ld      ($5847),a
5288 dd21cad0  ld      ix,$d0ca
528c fe01      cp      $01
528e f29552    jp      p,$5295
5291 dd2100d1  ld      ix,$d100
5295 cdf73e    call    $3ef7
5298 cda652    call    $52a6
529b 3005      jr      nc,$52a2
529d dde1      pop     ix
529f c1        pop     bc
52a0 78        ld      a,b
52a1 c9        ret     

52a2 dde1      pop     ix
52a4 f1        pop     af
52a5 c9        ret     

52a6 dd2131d1  ld      ix,$d131
52aa cd003f    call    $3f00
52ad cd5402    call    $0254
52b0 cd7d80    call    $807d
52b3 cda27f    call    $7fa2
52b6 fe1b      cp      $1b
52b8 37        scf     
52b9 c8        ret     z

52ba 1e2e      ld      e,$2e
52bc 3efd      ld      a,$fd
52be 0e02      ld      c,$02
52c0 cd4790    call    $9047
52c3 b7        or      a
52c4 c9        ret     

52c5 c5        push    bc
52c6 d5        push    de
52c7 e5        push    hl
52c8 2a494b    ld      hl,($4b49)
52cb 3c        inc     a
52cc 3a484b    ld      a,($4b48)
52cf cd1b91    call    $911b
52d2 ed5b4a58  ld      de,($584a)
52d6 b7        or      a
52d7 ed52      sbc     hl,de
52d9 d48953    call    nc,$5389
52dc 21c74b    ld      hl,$4bc7
52df cd4b53    call    $534b
52e2 3a414b    ld      a,($4b41)
52e5 e630      and     $30
52e7 fe20      cp      $20
52e9 2003      jr      nz,$52ee
52eb cded55    call    $55ed
52ee cd7a53    call    $537a
52f1 3e0d      ld      a,$0d
52f3 cdc453    call    $53c4
52f6 3e01      ld      a,$01
52f8 325258    ld      ($5852),a
52fb e1        pop     hl
52fc d1        pop     de
52fd c1        pop     bc
52fe c9        ret     

52ff c5        push    bc
5300 d5        push    de
5301 e5        push    hl
5302 cd3154    call    $5431
5305 3a424b    ld      a,($4b42)
5308 cd9c53    call    $539c
530b 214d4b    ld      hl,$4b4d
530e cd4b53    call    $534b
5311 3a414b    ld      a,($4b41)
5314 e630      and     $30
5316 fe10      cp      $10
5318 cced55    call    z,$55ed
531b cd7a53    call    $537a
531e cd1854    call    $5418
5321 218a4b    ld      hl,$4b8a
5324 cd4b53    call    $534b
5327 cd7a53    call    $537a
532a cd1854    call    $5418
532d 3a434b    ld      a,($4b43)
5330 cd9c53    call    $539c
5333 cd3a53    call    $533a
5336 e1        pop     hl
5337 d1        pop     de
5338 c1        pop     bc
5339 c9        ret     

533a 3a424b    ld      a,($4b42)
533d c603      add     a,$03
533f 47        ld      b,a
5340 3a434b    ld      a,($4b43)
5343 80        add     a,b
5344 6f        ld      l,a
5345 2600      ld      h,$00
5347 224a58    ld      ($584a),hl
534a c9        ret     

534b eb        ex      de,hl
534c 3e00      ld      a,$00
534e 32644a    ld      ($4a64),a
5351 2a4c58    ld      hl,($584c)
5354 ed4b294c  ld      bc,($4c29)
5358 b7        or      a
5359 ed42      sbc     hl,bc
535b d8        ret     c

535c 21644a    ld      hl,$4a64
535f 3a444b    ld      a,($4b44)
5362 47        ld      b,a
5363 1a        ld      a,(de)
5364 b7        or      a
5365 c8        ret     z

5366 80        add     a,b
5367 3d        dec     a
5368 77        ld      (hl),a
5369 05        dec     b
536a 2805      jr      z,$5371
536c 23        inc     hl
536d 3620      ld      (hl),$20
536f 10fb      djnz    $536c
5371 23        inc     hl
5372 eb        ex      de,hl
5373 4e        ld      c,(hl)
5374 0600      ld      b,$00
5376 23        inc     hl
5377 edb0      ldir    
5379 c9        ret     

537a 21644a    ld      hl,$4a64
537d 46        ld      b,(hl)
537e 04        inc     b
537f 05        dec     b
5380 c8        ret     z

5381 23        inc     hl
5382 7e        ld      a,(hl)
5383 cdc453    call    $53c4
5386 10f9      djnz    $5381
5388 c9        ret     

5389 24        inc     h
538a 25        dec     h
538b 280b      jr      z,$5398
538d 3e40      ld      a,$40
538f cd9c53    call    $539c
5392 cd9c53    call    $539c
5395 25        dec     h
5396 20f5      jr      nz,$538d
5398 7d        ld      a,l
5399 c39c53    jp      $539c
539c b7        or      a
539d c8        ret     z

539e 47        ld      b,a
539f cd1854    call    $5418
53a2 10fb      djnz    $539f
53a4 c9        ret     

53a5 3e0d      ld      a,$0d
53a7 cdc453    call    $53c4
53aa 3e0c      ld      a,$0c
53ac cdc453    call    $53c4
53af c3b253    jp      $53b2
53b2 cd3a53    call    $533a
53b5 3e01      ld      a,$01
53b7 325258    ld      ($5852),a
53ba ed5b4c58  ld      de,($584c)
53be 13        inc     de
53bf ed534c58  ld      ($584c),de
53c3 c9        ret     

53c4 f5        push    af
53c5 c5        push    bc
53c6 d5        push    de
53c7 e5        push    hl
53c8 dde5      push    ix
53ca fec0      cp      $c0
53cc 3023      jr      nc,$53f1
53ce fe01      cp      $01
53d0 2824      jr      z,$53f6
53d2 fe06      cp      $06
53d4 2820      jr      z,$53f6
53d6 fe09      cp      $09
53d8 2013      jr      nz,$53ed
53da dd215258  ld      ix,$5852
53de 3e20      ld      a,$20
53e0 cd0454    call    $5404
53e3 dd7e00    ld      a,(ix+$00)
53e6 3d        dec     a
53e7 e607      and     $07
53e9 20f3      jr      nz,$53de
53eb 180c      jr      $53f9
53ed cb7f      bit     7,a
53ef 2005      jr      nz,$53f6
53f1 cd0054    call    $5400
53f4 1803      jr      $53f9
53f6 cd0754    call    $5407
53f9 dde1      pop     ix
53fb e1        pop     hl
53fc d1        pop     de
53fd c1        pop     bc
53fe f1        pop     af
53ff c9        ret     

5400 dd215258  ld      ix,$5852
5404 dd3400    inc     (ix+$00)
5407 2aeb56    ld      hl,($56eb)
540a e9        jp      (hl)
540b 5f        ld      e,a
540c 0e05      ld      c,$05
540e c30500    jp      $0005
5411 215458    ld      hl,$5854
5414 46        ld      b,(hl)
5415 cf        rst     $08
5416 17        rla     
5417 c9        ret     

5418 f5        push    af
5419 c5        push    bc
541a d5        push    de
541b 3e0d      ld      a,$0d
541d cdc453    call    $53c4
5420 3e0a      ld      a,$0a
5422 cdc453    call    $53c4
5425 3e01      ld      a,$01
5427 325258    ld      ($5852),a
542a cd3154    call    $5431
542d d1        pop     de
542e c1        pop     bc
542f f1        pop     af
5430 c9        ret     

5431 3a284c    ld      a,($4c28)
5434 b7        or      a
5435 c8        ret     z

5436 47        ld      b,a
5437 3e20      ld      a,$20
5439 c5        push    bc
543a cd0754    call    $5407
543d c1        pop     bc
543e 10f7      djnz    $5437
5440 c9        ret     

5441 cd0e35    call    $350e
5444 2815      jr      z,$545b
5446 216454    ld      hl,$5464
5449 0e00      ld      c,$00
544b cf        rst     $08
544c 08        ex      af,af'
544d 216454    ld      hl,$5464
5450 114257    ld      de,$5742
5453 010900    ld      bc,$0009
5456 edb0      ldir    
5458 c30457    jp      $5704
545b 210b54    ld      hl,$540b
545e 22eb56    ld      ($56eb),hl
5461 c39f51    jp      $519f
5464 5f        ld      e,a
5465 66        ld      h,(hl)
5466 6f        ld      l,a
5467 6f        ld      l,a
5468 2e62      ld      l,$62
546a 61        ld      h,c
546b 72        ld      (hl),d
546c 00        nop     
546d fd218c8e  ld      iy,$8e8c
5471 cd2c24    call    $242c
5474 cd9456    call    $5694
5477 d8        ret     c

5478 cd8551    call    $5185
547b cd8754    call    $5487
547e cd9f51    call    $519f
5481 cdac4e    call    $4eac
5484 c3ef56    jp      $56ef
5487 cd9043    call    $4390
548a c42e51    call    nz,$512e
548d 3e01      ld      a,$01
548f 325258    ld      ($5852),a
5492 cd866b    call    $6b86
5495 ed434c58  ld      ($584c),bc
5499 ed435a58  ld      ($585a),bc
549d 2a264c    ld      hl,($4c26)
54a0 09        add     hl,bc
54a1 ed5b244c  ld      de,($4c24)
54a5 b7        or      a
54a6 ed52      sbc     hl,de
54a8 225858    ld      ($5858),hl
54ab cd5643    call    $4356
54ae 2807      jr      z,$54b7
54b0 97        sub     a
54b1 324758    ld      ($5847),a
54b4 cd3a53    call    $533a
54b7 cd734e    call    $4e73
54ba cdff52    call    $52ff
54bd cd2355    call    $5523
54c0 2807      jr      z,$54c9
54c2 cdfa39    call    $39fa
54c5 fe01      cp      $01
54c7 20f4      jr      nz,$54bd
54c9 cdb639    call    $39b6
54cc cdc47f    call    $7fc4
54cf d8        ret     c

54d0 cd9855    call    $5598
54d3 fe01      cp      $01
54d5 283f      jr      z,$5516
54d7 fe0c      cp      $0c
54d9 283b      jr      z,$5516
54db cd9043    call    $4390
54de 202f      jr      nz,$550f
54e0 fe0d      cp      $0d
54e2 2804      jr      z,$54e8
54e4 fe0a      cp      $0a
54e6 2011      jr      nz,$54f9
54e8 cd1854    call    $5418
54eb 2a4a58    ld      hl,($584a)
54ee 23        inc     hl
54ef 224a58    ld      ($584a),hl
54f2 cd2355    call    $5523
54f5 281f      jr      z,$5516
54f7 18d3      jr      $54cc
54f9 cd8355    call    $5583
54fc fe83      cp      $83
54fe 2804      jr      z,$5504
5500 fe82      cp      $82
5502 2004      jr      nz,$5508
5504 cd5452    call    $5254
5507 d8        ret     c

5508 e67f      and     $7f
550a cdc453    call    $53c4
550d 18bd      jr      $54cc
550f cd1f4f    call    $4f1f
5512 380d      jr      c,$5521
5514 18b6      jr      $54cc
5516 3e1a      ld      a,$1a
5518 cd9043    call    $4390
551b c41f4f    call    nz,$4f1f
551e cdc552    call    $52c5
5521 b7        or      a
5522 c9        ret     

5523 cd8b6b    call    $6b8b
5526 78        ld      a,b
5527 b7        or      a
5528 c0        ret     nz

5529 79        ld      a,c
552a fe01      cp      $01
552c c9        ret     

552d cd8551    call    $5185
5530 97        sub     a
5531 324758    ld      ($5847),a
5534 3e01      ld      a,$01
5536 325258    ld      ($5852),a
5539 cd734e    call    $4e73
553c cd3154    call    $5431
553f cd4d3a    call    $3a4d
5542 cdc47f    call    $7fc4
5545 3833      jr      c,$557a
5547 cd3887    call    $8738
554a fe19      cp      $19
554c 302b      jr      nc,$5579
554e cd9855    call    $5598
5551 fe01      cp      $01
5553 2824      jr      z,$5579
5555 fe0d      cp      $0d
5557 2804      jr      z,$555d
5559 fe0a      cp      $0a
555b 2005      jr      nz,$5562
555d cd1854    call    $5418
5560 18e0      jr      $5542
5562 cd8355    call    $5583
5565 fe83      cp      $83
5567 2804      jr      z,$556d
5569 fe82      cp      $82
556b 2005      jr      nz,$5572
556d cd5452    call    $5254
5570 3808      jr      c,$557a
5572 e67f      and     $7f
5574 cdc453    call    $53c4
5577 18c9      jr      $5542
5579 b7        or      a
557a f5        push    af
557b cd9f51    call    $519f
557e cdac4e    call    $4eac
5581 f1        pop     af
5582 c9        ret     

5583 f5        push    af
5584 3a4b4b    ld      a,($4b4b)
5587 47        ld      b,a
5588 3a4c4b    ld      a,($4b4c)
558b 4f        ld      c,a
558c f1        pop     af
558d b8        cp      b
558e 2805      jr      z,$5595
5590 b9        cp      c
5591 c0        ret     nz

5592 3e2d      ld      a,$2d
5594 c9        ret     

5595 3e20      ld      a,$20
5597 c9        ret     

5598 cd8394    call    $9483
559b fe8b      cp      $8b
559d 28f9      jr      z,$5598
559f fe81      cp      $81
55a1 f5        push    af
55a2 cce434    call    z,$34e4
55a5 f1        pop     af
55a6 fe86      cp      $86
55a8 f5        push    af
55a9 ccdb34    call    z,$34db
55ac f1        pop     af
55ad fe87      cp      $87
55af c0        ret     nz

55b0 cdfd34    call    $34fd
55b3 18e3      jr      $5598
55b5 c5        push    bc
55b6 d5        push    de
55b7 e5        push    hl
55b8 fde5      push    iy
55ba 218000    ld      hl,$0080
55bd 7e        ld      a,(hl)
55be b7        or      a
55bf 281e      jr      z,$55df
55c1 3d        dec     a
55c2 281b      jr      z,$55df
55c4 3d        dec     a
55c5 2020      jr      nz,$55e7
55c7 113f4b    ld      de,$4b3f
55ca 018000    ld      bc,$0080
55cd edb0      ldir    
55cf cdb827    call    $27b8
55d2 016c00    ld      bc,$006c
55d5 218000    ld      hl,$0080
55d8 edb0      ldir    
55da cdb827    call    $27b8
55dd 1808      jr      $55e7
55df cddc43    call    $43dc
55e2 014800    ld      bc,$0048
55e5 dd09      add     ix,bc
55e7 fde1      pop     iy
55e9 e1        pop     hl
55ea d1        pop     de
55eb c1        pop     bc
55ec c9        ret     

55ed 2a4c58    ld      hl,($584c)
55f0 ed5b244c  ld      de,($4c24)
55f4 b7        or      a
55f5 ed52      sbc     hl,de
55f7 d8        ret     c

55f8 cd3d56    call    $563d
55fb 3a414b    ld      a,($4b41)
55fe e6c0      and     $c0
5600 fe00      cp      $00
5602 2816      jr      z,$561a
5604 fe40      cp      $40
5606 280b      jr      z,$5613
5608 fe80      cp      $80
560a 281e      jr      z,$562a
560c 3a5858    ld      a,($5858)
560f cb47      bit     0,a
5611 2817      jr      z,$562a
5613 3a444b    ld      a,($4b44)
5616 c604      add     a,$04
5618 1818      jr      $5632
561a 3a444b    ld      a,($4b44)
561d 5f        ld      e,a
561e 3a454b    ld      a,($4b45)
5621 83        add     a,e
5622 90        sub     b
5623 380d      jr      c,$5632
5625 cb3f      srl     a
5627 b7        or      a
5628 1808      jr      $5632
562a 3a454b    ld      a,($4b45)
562d 90        sub     b
562e 3802      jr      c,$5632
5630 d605      sub     $05
5632 21644a    ld      hl,$4a64
5635 0e00      ld      c,$00
5637 3801      jr      c,$563a
5639 4f        ld      c,a
563a c36456    jp      $5664
563d e5        push    hl
563e cddb82    call    $82db
5641 2a5858    ld      hl,($5858)
5644 4d        ld      c,l
5645 44        ld      b,h
5646 23        inc     hl
5647 225858    ld      ($5858),hl
564a 210d83    ld      hl,$830d
564d cd928f    call    $8f92
5650 210d83    ld      hl,$830d
5653 0606      ld      b,$06
5655 7e        ld      a,(hl)
5656 cdd090    call    $90d0
5659 3003      jr      nc,$565e
565b 23        inc     hl
565c 10f7      djnz    $5655
565e 3e06      ld      a,$06
5660 90        sub     b
5661 47        ld      b,a
5662 e1        pop     hl
5663 c9        ret     

5664 79        ld      a,c
5665 80        add     a,b
5666 57        ld      d,a
5667 21644a    ld      hl,$4a64
566a 7e        ld      a,(hl)
566b ba        cp      d
566c 300e      jr      nc,$567c
566e 79        ld      a,c
566f 46        ld      b,(hl)
5670 90        sub     b
5671 47        ld      b,a
5672 7e        ld      a,(hl)
5673 72        ld      (hl),d
5674 cd8d90    call    $908d
5677 23        inc     hl
5678 3620      ld      (hl),$20
567a 10fb      djnz    $5677
567c 21644a    ld      hl,$4a64
567f 79        ld      a,c
5680 3c        inc     a
5681 cd8d90    call    $908d
5684 eb        ex      de,hl
5685 210d83    ld      hl,$830d
5688 0606      ld      b,$06
568a 7e        ld      a,(hl)
568b cdd090    call    $90d0
568e d0        ret     nc

568f eda0      ldi     
5691 10f7      djnz    $568a
5693 c9        ret     

5694 dde5      push    ix
5696 fde5      push    iy
5698 cda556    call    $56a5
569b 3e7f      ld      a,$7f
569d cdc453    call    $53c4
56a0 fde1      pop     iy
56a2 dde1      pop     ix
56a4 c9        ret     

56a5 cd0e35    call    $350e
56a8 2814      jr      z,$56be
56aa cda843    call    $43a8
56ad 202b      jr      nz,$56da
56af 211154    ld      hl,$5411
56b2 22eb56    ld      ($56eb),hl
56b5 215157    ld      hl,$5751
56b8 22ed56    ld      ($56ed),hl
56bb c36957    jp      $5769
56be 210b54    ld      hl,$540b
56c1 22eb56    ld      ($56eb),hl
56c4 212157    ld      hl,$5721
56c7 22ed56    ld      ($56ed),hl
56ca b7        or      a
56cb cda843    call    $43a8
56ce c0        ret     nz

56cf cd732b    call    $2b73
56d2 216457    ld      hl,$5764
56d5 22ed56    ld      ($56ed),hl
56d8 1809      jr      $56e3
56da cda32b    call    $2ba3
56dd 21f356    ld      hl,$56f3
56e0 22ed56    ld      ($56ed),hl
56e3 21172c    ld      hl,$2c17
56e6 22eb56    ld      ($56eb),hl
56e9 b7        or      a
56ea c9        ret     

56eb 00        nop     
56ec 00        nop     
56ed 00        nop     
56ee 00        nop     
56ef 2aed56    ld      hl,($56ed)
56f2 e9        jp      (hl)
56f3 cd0e35    call    $350e
56f6 c8        ret     z

56f7 cdb02a    call    $2ab0
56fa fd214257  ld      iy,$5742
56fe 118921    ld      de,$2189
5701 cda63f    call    $3fa6
5704 010000    ld      bc,$0000
5707 113157    ld      de,$5731
570a 212257    ld      hl,$5722
570d cf        rst     $08
570e 4b        ld      c,e
570f 3009      jr      nc,$571a
5711 dd2180cd  ld      ix,$cd80
5715 cd463f    call    $3f46
5718 183d      jr      $5757
571a 0e00      ld      c,$00
571c 210000    ld      hl,$0000
571f cf        rst     $08
5720 45        ld      b,l
5721 c9        ret     

5722 2f        cpl     
5723 62        ld      h,d
5724 69        ld      l,c
5725 6e        ld      l,(hl)
5726 2f        cpl     
5727 73        ld      (hl),e
5728 70        ld      (hl),b
5729 6f        ld      l,a
572a 6f        ld      l,a
572b 6c        ld      l,h
572c 2e62      ld      l,$62
572e 69        ld      l,c
572f 6e        ld      l,(hl)
5730 00        nop     
5731 39        add     hl,sp
5732 57        ld      d,a
5733 3f        ccf     
5734 57        ld      d,a
5735 42        ld      b,d
5736 57        ld      d,a
5737 00        nop     
5738 00        nop     
5739 73        ld      (hl),e
573a 70        ld      (hl),b
573b 6f        ld      l,a
573c 6f        ld      l,a
573d 6c        ld      l,h
573e 00        nop     
573f 2d        dec     l
5740 64        ld      h,h
5741 00        nop     
5742 00        nop     
5743 00        nop     
5744 00        nop     
5745 00        nop     
5746 00        nop     
5747 00        nop     
5748 00        nop     
5749 00        nop     
574a 00        nop     
574b 00        nop     
574c 00        nop     
574d 00        nop     
574e 00        nop     
574f 00        nop     
5750 00        nop     
5751 3a5458    ld      a,($5854)
5754 47        ld      b,a
5755 cf        rst     $08
5756 0b        dec     bc
5757 cdb70e    call    $0eb7
575a dd212d9a  ld      ix,$9a2d
575e cdb01c    call    $1cb0
5761 c3d70e    jp      $0ed7
5764 cdb02a    call    $2ab0
5767 18ee      jr      $5757
5769 21304c    ld      hl,$4c30
576c 7e        ld      a,(hl)
576d 11e977    ld      de,$77e9
5770 23        inc     hl
5771 0600      ld      b,$00
5773 4f        ld      c,a
5774 edb0      ldir    
5776 3e00      ld      a,$00
5778 12        ld      (de),a
5779 ed534858  ld      ($5848),de
577d 21e977    ld      hl,$77e9
5780 0e06      ld      c,$06
5782 cf        rst     $08
5783 2021      jr      nz,$57a6
5785 e9        jp      (hl)
5786 77        ld      (hl),a
5787 3868      jr      c,$57f1
5789 7a        ld      a,d
578a fe02      cp      $02
578c 2844      jr      z,$57d2
578e fe03      cp      $03
5790 2840      jr      z,$57d2
5792 b7        or      a
5793 2842      jr      z,$57d7
5795 112578    ld      de,$7825
5798 3e00      ld      a,$00
579a be        cp      (hl)
579b 2804      jr      z,$57a1
579d eda0      ldi     
579f 18f9      jr      $579a
57a1 3e2f      ld      a,$2f
57a3 12        ld      (de),a
57a4 13        inc     de
57a5 fde5      push    iy
57a7 e1        pop     hl
57a8 3e00      ld      a,$00
57aa be        cp      (hl)
57ab 2804      jr      z,$57b1
57ad eda0      ldi     
57af 18f9      jr      $57aa
57b1 21d12b    ld      hl,$2bd1
57b4 010500    ld      bc,$0005
57b7 edb0      ldir    
57b9 1b        dec     de
57ba ed534858  ld      ($5848),de
57be 212578    ld      hl,$7825
57c1 0e06      ld      c,$06
57c3 cf        rst     $08
57c4 2021      jr      nz,$57e7
57c6 25        dec     h
57c7 78        ld      a,b
57c8 3827      jr      c,$57f1
57ca 7a        ld      a,d
57cb fe01      cp      $01
57cd 2846      jr      z,$5815
57cf b7        or      a
57d0 2805      jr      z,$57d7
57d2 cd4058    call    $5840
57d5 1820      jr      $57f7
57d7 cd2958    call    $5829
57da dd2168d1  ld      ix,$d168
57de cd003f    call    $3f00
57e1 cd743f    call    $3f74
57e4 382d      jr      c,$5813
57e6 282b      jr      z,$5813
57e8 cd4058    call    $5840
57eb 3812      jr      c,$57ff
57ed cf        rst     $08
57ee 0d        dec     c
57ef 1806      jr      $57f7
57f1 0e05      ld      c,$05
57f3 1606      ld      d,$06
57f5 cf        rst     $08
57f6 08        ex      af,af'
57f7 3806      jr      c,$57ff
57f9 78        ld      a,b
57fa 325458    ld      ($5854),a
57fd b7        or      a
57fe c9        ret     

57ff f5        push    af
5800 cd3e8a    call    $8a3e
5803 cd6202    call    $0262
5806 f1        pop     af
5807 0602      ld      b,$02
5809 cf        rst     $08
580a 1c        inc     e
580b cd5402    call    $0254
580e 3e03      ld      a,$03
5810 cdf33f    call    $3ff3
5813 37        scf     
5814 c9        ret     

5815 cd2958    call    $5829
5818 dd219fd1  ld      ix,$d19f
581c cd003f    call    $3f00
581f cd5402    call    $0254
5822 3e03      ld      a,$03
5824 cdf33f    call    $3ff3
5827 37        scf     
5828 c9        ret     

5829 dd2156d1  ld      ix,$d156
582d cdf73e    call    $3ef7
5830 e5        push    hl
5831 e5        push    hl
5832 dde1      pop     ix
5834 2a4858    ld      hl,($5848)
5837 3624      ld      (hl),$24
5839 cd003f    call    $3f00
583c 3600      ld      (hl),$00
583e e1        pop     hl
583f c9        ret     

5840 0e01      ld      c,$01
5842 1600      ld      d,$00
5844 cf        rst     $08
5845 09        add     hl,bc
5846 c9        ret     

5847 00        nop     
5848 00        nop     
5849 00        nop     
584a 00        nop     
584b 00        nop     
584c 00        nop     
584d 00        nop     
584e 00        nop     
584f 00        nop     
5850 00        nop     
5851 00        nop     
5852 00        nop     
5853 00        nop     
5854 00        nop     
5855 00        nop     
5856 00        nop     
5857 00        nop     
5858 00        nop     
5859 00        nop     
585a 00        nop     
585b 00        nop     
585c c5        push    bc
585d dde5      push    ix
585f fde5      push    iy
5861 cdd658    call    $58d6
5864 cda25a    call    $5aa2
5867 b7        or      a
5868 2828      jr      z,$5892
586a fef1      cp      $f1
586c 2005      jr      nz,$5873
586e cd9d34    call    $349d
5871 18f1      jr      $5864
5873 cdc47f    call    $7fc4
5876 3815      jr      c,$588d
5878 cdbf58    call    $58bf
587b 3010      jr      nc,$588d
587d cd9b58    call    $589b
5880 3006      jr      nc,$5888
5882 fe01      cp      $01
5884 2807      jr      z,$588d
5886 18df      jr      $5867
5888 cd3359    call    $5933
588b 18e6      jr      $5873
588d cdfa58    call    $58fa
5890 1803      jr      $5895
5892 cd0259    call    $5902
5895 fde1      pop     iy
5897 dde1      pop     ix
5899 c1        pop     bc
589a c9        ret     

589b cd0b59    call    $590b
589e cda25a    call    $5aa2
58a1 b7        or      a
58a2 2819      jr      z,$58bd
58a4 fef1      cp      $f1
58a6 2815      jr      z,$58bd
58a8 32305b    ld      ($5b30),a
58ab cd7d3c    call    $3c7d
58ae fe01      cp      $01
58b0 280b      jr      z,$58bd
58b2 5f        ld      e,a
58b3 3a305b    ld      a,($5b30)
58b6 cd5559    call    $5955
58b9 3003      jr      nc,$58be
58bb 18e1      jr      $589e
58bd 37        scf     
58be c9        ret     

58bf 32305b    ld      ($5b30),a
58c2 cd7d3c    call    $3c7d
58c5 fe01      cp      $01
58c7 280b      jr      z,$58d4
58c9 5f        ld      e,a
58ca 3a305b    ld      a,($5b30)
58cd cd5559    call    $5955
58d0 30f0      jr      nc,$58c2
58d2 1801      jr      $58d5
58d4 b7        or      a
58d5 c9        ret     

58d6 dd21e05a  ld      ix,$5ae0
58da cd4134    call    $3441
58dd cd6599    call    $9965
58e0 fd21355b  ld      iy,$5b35
58e4 cdda8e    call    $8eda
58e7 fd21395b  ld      iy,$5b39
58eb cdda8e    call    $8eda
58ee fd218e35  ld      iy,$358e
58f2 fdcb00b6  res     6,(iy+$00)
58f6 cdc993    call    $93c9
58f9 c9        ret     

58fa fd21355b  ld      iy,$5b35
58fe cde78e    call    $8ee7
5901 c9        ret     

5902 fd21395b  ld      iy,$5b39
5906 cde78e    call    $8ee7
5909 37        scf     
590a c9        ret     

590b 3a8e35    ld      a,($358e)
590e e603      and     $03
5910 323d5b    ld      ($5b3d),a
5913 cd6599    call    $9965
5916 fd21315b  ld      iy,$5b31
591a cdda8e    call    $8eda
591d cd9534    call    $3495
5920 2010      jr      nz,$5932
5922 cd973c    call    $3c97
5925 cd6599    call    $9965
5928 fd21395b  ld      iy,$5b39
592c cdda8e    call    $8eda
592f cd7d3c    call    $3c7d
5932 c9        ret     

5933 fd21315b  ld      iy,$5b31
5937 cde78e    call    $8ee7
593a cd0c3a    call    $3a0c
593d cd4134    call    $3441
5940 fd218e35  ld      iy,$358e
5944 3a3d5b    ld      a,($5b3d)
5947 fdb600    or      (iy+$00)
594a 328e35    ld      ($358e),a
594d dd21e05a  ld      ix,$5ae0
5951 cda25a    call    $5aa2
5954 c9        ret     

5955 c5        push    bc
5956 e5        push    hl
5957 32305b    ld      ($5b30),a
595a 010500    ld      bc,$0005
595d 21a759    ld      hl,$59a7
5960 edb1      cpir    
5962 2820      jr      z,$5984
5964 cd1d34    call    $341d
5967 2808      jr      z,$5971
5969 7b        ld      a,e
596a cdac90    call    $90ac
596d 5f        ld      e,a
596e 3a305b    ld      a,($5b30)
5971 cd0d34    call    $340d
5974 2009      jr      nz,$597f
5976 fef0      cp      $f0
5978 2820      jr      z,$599a
597a bb        cp      e
597b 281d      jr      z,$599a
597d 1821      jr      $59a0
597f bb        cp      e
5980 281e      jr      z,$59a0
5982 1816      jr      $599a
5984 3e04      ld      a,$04
5986 91        sub     c
5987 cb27      sla     a
5989 cd0d34    call    $340d
598c 2007      jr      nz,$5995
598e cdac59    call    $59ac
5991 2807      jr      z,$599a
5993 180b      jr      $59a0
5995 cdac59    call    $59ac
5998 2806      jr      z,$59a0
599a cd4134    call    $3441
599d 37        scf     
599e 1801      jr      $59a1
59a0 b7        or      a
59a1 e1        pop     hl
59a2 c1        pop     bc
59a3 3a305b    ld      a,($5b30)
59a6 c9        ret     

59a7 81        add     a,c
59a8 82        add     a,d
59a9 f5        push    af
59aa f6f7      or      $f7
59ac 21be59    ld      hl,$59be
59af cd8d90    call    $908d
59b2 7e        ld      a,(hl)
59b3 23        inc     hl
59b4 66        ld      h,(hl)
59b5 6f        ld      l,a
59b6 4e        ld      c,(hl)
59b7 0600      ld      b,$00
59b9 23        inc     hl
59ba 7b        ld      a,e
59bb edb1      cpir    
59bd c9        ret     

59be c8        ret     z

59bf 59        ld      e,c
59c0 05        dec     b
59c1 5a        ld      e,d
59c2 42        ld      b,d
59c3 5a        ld      e,d
59c4 77        ld      (hl),a
59c5 5a        ld      e,d
59c6 82        add     a,d
59c7 5a        ld      e,d
59c8 00        nop     
59c9 00        nop     
59ca 00        nop     
59cb 00        nop     
59cc 00        nop     
59cd 00        nop     
59ce 00        nop     
59cf 00        nop     
59d0 00        nop     
59d1 00        nop     
59d2 00        nop     
59d3 00        nop     
59d4 00        nop     
59d5 00        nop     
59d6 00        nop     
59d7 00        nop     
59d8 00        nop     
59d9 00        nop     
59da 00        nop     
59db 00        nop     
59dc 00        nop     
59dd 00        nop     
59de 00        nop     
59df 00        nop     
59e0 00        nop     
59e1 00        nop     
59e2 00        nop     
59e3 00        nop     
59e4 00        nop     
59e5 00        nop     
59e6 00        nop     
59e7 00        nop     
59e8 00        nop     
59e9 00        nop     
59ea 00        nop     
59eb 00        nop     
59ec 00        nop     
59ed 00        nop     
59ee 00        nop     
59ef 00        nop     
59f0 00        nop     
59f1 00        nop     
59f2 00        nop     
59f3 00        nop     
59f4 00        nop     
59f5 00        nop     
59f6 00        nop     
59f7 00        nop     
59f8 00        nop     
59f9 00        nop     
59fa 00        nop     
59fb 00        nop     
59fc 00        nop     
59fd 00        nop     
59fe 00        nop     
59ff 00        nop     
5a00 00        nop     
5a01 00        nop     
5a02 00        nop     
5a03 00        nop     
5a04 00        nop     
5a05 00        nop     
5a06 00        nop     
5a07 00        nop     
5a08 00        nop     
5a09 00        nop     
5a0a 00        nop     
5a0b 00        nop     
5a0c 00        nop     
5a0d 00        nop     
5a0e 00        nop     
5a0f 00        nop     
5a10 00        nop     
5a11 00        nop     
5a12 00        nop     
5a13 00        nop     
5a14 00        nop     
5a15 00        nop     
5a16 00        nop     
5a17 00        nop     
5a18 00        nop     
5a19 00        nop     
5a1a 00        nop     
5a1b 00        nop     
5a1c 00        nop     
5a1d 00        nop     
5a1e 00        nop     
5a1f 00        nop     
5a20 00        nop     
5a21 00        nop     
5a22 00        nop     
5a23 00        nop     
5a24 00        nop     
5a25 00        nop     
5a26 00        nop     
5a27 00        nop     
5a28 00        nop     
5a29 00        nop     
5a2a 00        nop     
5a2b 00        nop     
5a2c 00        nop     
5a2d 00        nop     
5a2e 00        nop     
5a2f 00        nop     
5a30 00        nop     
5a31 00        nop     
5a32 00        nop     
5a33 00        nop     
5a34 00        nop     
5a35 00        nop     
5a36 00        nop     
5a37 00        nop     
5a38 00        nop     
5a39 00        nop     
5a3a 00        nop     
5a3b 00        nop     
5a3c 00        nop     
5a3d 00        nop     
5a3e 00        nop     
5a3f 00        nop     
5a40 00        nop     
5a41 00        nop     
5a42 34        inc     (hl)
5a43 61        ld      h,c
5a44 62        ld      h,d
5a45 63        ld      h,e
5a46 64        ld      h,h
5a47 65        ld      h,l
5a48 66        ld      h,(hl)
5a49 67        ld      h,a
5a4a 68        ld      l,b
5a4b 69        ld      l,c
5a4c 6a        ld      l,d
5a4d 6b        ld      l,e
5a4e 6c        ld      l,h
5a4f 6d        ld      l,l
5a50 6e        ld      l,(hl)
5a51 6f        ld      l,a
5a52 70        ld      (hl),b
5a53 71        ld      (hl),c
5a54 72        ld      (hl),d
5a55 73        ld      (hl),e
5a56 74        ld      (hl),h
5a57 75        ld      (hl),l
5a58 76        halt    
5a59 77        ld      (hl),a
5a5a 78        ld      a,b
5a5b 79        ld      a,c
5a5c 7a        ld      a,d
5a5d 41        ld      b,c
5a5e 42        ld      b,d
5a5f 43        ld      b,e
5a60 44        ld      b,h
5a61 45        ld      b,l
5a62 46        ld      b,(hl)
5a63 47        ld      b,a
5a64 48        ld      c,b
5a65 49        ld      c,c
5a66 4a        ld      c,d
5a67 4b        ld      c,e
5a68 4c        ld      c,h
5a69 4d        ld      c,l
5a6a 4e        ld      c,(hl)
5a6b 4f        ld      c,a
5a6c 50        ld      d,b
5a6d 51        ld      d,c
5a6e 52        ld      d,d
5a6f 53        ld      d,e
5a70 54        ld      d,h
5a71 55        ld      d,l
5a72 56        ld      d,(hl)
5a73 57        ld      d,a
5a74 58        ld      e,b
5a75 59        ld      e,c
5a76 5a        ld      e,d
5a77 0a        ld      a,(bc)
5a78 313233    ld      sp,$3332
5a7b 34        inc     (hl)
5a7c 35        dec     (hl)
5a7d 3637      ld      (hl),$37
5a7f 3839      jr      c,$5aba
5a81 301f      jr      nc,$5aa2
5a83 212223    ld      hl,$2322
5a86 24        inc     h
5a87 25        dec     h
5a88 2627      ld      h,$27
5a8a 2829      jr      z,$5ab5
5a8c 5f        ld      e,a
5a8d 60        ld      h,b
5a8e 7b        ld      a,e
5a8f 7d        ld      a,l
5a90 7e        ld      a,(hl)
5a91 7c        ld      a,h
5a92 40        ld      b,b
5a93 5b        ld      e,e
5a94 5d        ld      e,l
5a95 5e        ld      e,(hl)
5a96 2d        dec     l
5a97 3d        dec     a
5a98 3b        dec     sp
5a99 2b        dec     hl
5a9a 3a2a2c    ld      a,($2c2a)
5a9d 3c        inc     a
5a9e 2e3e      ld      l,$3e
5aa0 2f        cpl     
5aa1 3f        ccf     
5aa2 dd7e00    ld      a,(ix+$00)
5aa5 dd23      inc     ix
5aa7 fef2      cp      $f2
5aa9 2005      jr      nz,$5ab0
5aab cd1534    call    $3415
5aae 18f2      jr      $5aa2
5ab0 fef8      cp      $f8
5ab2 2005      jr      nz,$5ab9
5ab4 cd3934    call    $3439
5ab7 18e9      jr      $5aa2
5ab9 c9        ret     

5aba dd7e00    ld      a,(ix+$00)
5abd dd2b      dec     ix
5abf c9        ret     

5ac0 f5        push    af
5ac1 c5        push    bc
5ac2 d5        push    de
5ac3 e5        push    hl
5ac4 21c859    ld      hl,$59c8
5ac7 11b44a    ld      de,$4ab4
5aca 017a00    ld      bc,$007a
5acd edb0      ldir    
5acf e1        pop     hl
5ad0 d1        pop     de
5ad1 c1        pop     bc
5ad2 f1        pop     af
5ad3 c9        ret     

5ad4 f5        push    af
5ad5 c5        push    bc
5ad6 d5        push    de
5ad7 e5        push    hl
5ad8 21b44a    ld      hl,$4ab4
5adb 11c859    ld      de,$59c8
5ade 18ea      jr      $5aca
5ae0 00        nop     
5ae1 00        nop     
5ae2 00        nop     
5ae3 00        nop     
5ae4 00        nop     
5ae5 00        nop     
5ae6 00        nop     
5ae7 00        nop     
5ae8 00        nop     
5ae9 00        nop     
5aea 00        nop     
5aeb 00        nop     
5aec 00        nop     
5aed 00        nop     
5aee 00        nop     
5aef 00        nop     
5af0 00        nop     
5af1 00        nop     
5af2 00        nop     
5af3 00        nop     
5af4 00        nop     
5af5 00        nop     
5af6 00        nop     
5af7 00        nop     
5af8 00        nop     
5af9 00        nop     
5afa 00        nop     
5afb 00        nop     
5afc 00        nop     
5afd 00        nop     
5afe 00        nop     
5aff 00        nop     
5b00 00        nop     
5b01 00        nop     
5b02 00        nop     
5b03 00        nop     
5b04 00        nop     
5b05 00        nop     
5b06 00        nop     
5b07 00        nop     
5b08 00        nop     
5b09 00        nop     
5b0a 00        nop     
5b0b 00        nop     
5b0c 00        nop     
5b0d 00        nop     
5b0e 00        nop     
5b0f 00        nop     
5b10 00        nop     
5b11 00        nop     
5b12 00        nop     
5b13 00        nop     
5b14 00        nop     
5b15 00        nop     
5b16 00        nop     
5b17 00        nop     
5b18 00        nop     
5b19 00        nop     
5b1a 00        nop     
5b1b 00        nop     
5b1c 00        nop     
5b1d 00        nop     
5b1e 00        nop     
5b1f 00        nop     
5b20 00        nop     
5b21 00        nop     
5b22 00        nop     
5b23 00        nop     
5b24 00        nop     
5b25 00        nop     
5b26 00        nop     
5b27 00        nop     
5b28 00        nop     
5b29 00        nop     
5b2a 00        nop     
5b2b 00        nop     
5b2c 00        nop     
5b2d 00        nop     
5b2e 00        nop     
5b2f 00        nop     
5b30 00        nop     
5b31 00        nop     
5b32 00        nop     
5b33 00        nop     
5b34 00        nop     
5b35 00        nop     
5b36 00        nop     
5b37 00        nop     
5b38 00        nop     
5b39 00        nop     
5b3a 00        nop     
5b3b 00        nop     
5b3c 00        nop     
5b3d 00        nop     
5b3e d5        push    de
5b3f e5        push    hl
5b40 dde5      push    ix
5b42 cda15b    call    $5ba1
5b45 214e46    ld      hl,$464e
5b48 cdde45    call    $45de
5b4b cdeb44    call    $44eb
5b4e 3003      jr      nc,$5b53
5b50 cdad5b    call    $5bad
5b53 cdf681    call    $81f6
5b56 dde1      pop     ix
5b58 e1        pop     hl
5b59 d1        pop     de
5b5a c9        ret     

5b5b cd6c49    call    $496c
5b5e 11525f    ld      de,$5f52
5b61 cd1d34    call    $341d
5b64 2803      jr      z,$5b69
5b66 115c5f    ld      de,$5f5c
5b69 0e09      ld      c,$09
5b6b cd0500    call    $0005
5b6e c9        ret     

5b6f 11465f    ld      de,$5f46
5b72 cd7249    call    $4972
5b75 1e7d      ld      e,$7d
5b77 0e02      ld      c,$02
5b79 cd0500    call    $0005
5b7c c9        ret     

5b7d cd1d34    call    $341d
5b80 cdc45b    call    $5bc4
5b83 cd5b5b    call    $5b5b
5b86 c9        ret     

5b87 dd2137ba  ld      ix,$ba37
5b8b cde848    call    $48e8
5b8e f5        push    af
5b8f 1e7d      ld      e,$7d
5b91 0e02      ld      c,$02
5b93 cd0500    call    $0005
5b96 f1        pop     af
5b97 3804      jr      c,$5b9d
5b99 cd8849    call    $4988
5b9c d0        ret     nc

5b9d cd6f5b    call    $5b6f
5ba0 c9        ret     

5ba1 f5        push    af
5ba2 3a8e35    ld      a,($358e)
5ba5 32c35b    ld      ($5bc3),a
5ba8 cdc05a    call    $5ac0
5bab f1        pop     af
5bac c9        ret     

5bad f5        push    af
5bae c5        push    bc
5baf d5        push    de
5bb0 e5        push    hl
5bb1 3ac35b    ld      a,($5bc3)
5bb4 ee04      xor     $04
5bb6 cb57      bit     2,a
5bb8 cdc45b    call    $5bc4
5bbb cdd45a    call    $5ad4
5bbe e1        pop     hl
5bbf d1        pop     de
5bc0 c1        pop     bc
5bc1 f1        pop     af
5bc2 c9        ret     

5bc3 00        nop     
5bc4 2808      jr      z,$5bce
5bc6 cd3134    call    $3431
5bc9 21525f    ld      hl,$5f52
5bcc 1806      jr      $5bd4
5bce cd2934    call    $3429
5bd1 215c5f    ld      hl,$5f5c
5bd4 c9        ret     

5bd5 c5        push    bc
5bd6 d5        push    de
5bd7 dde5      push    ix
5bd9 d5        push    de
5bda dde1      pop     ix
5bdc dd7e00    ld      a,(ix+$00)
5bdf b7        or      a
5be0 200a      jr      nz,$5bec
5be2 11465f    ld      de,$5f46
5be5 0e09      ld      c,$09
5be7 cd0500    call    $0005
5bea 180f      jr      $5bfb
5bec 47        ld      b,a
5bed dd23      inc     ix
5bef dd5e00    ld      e,(ix+$00)
5bf2 0e02      ld      c,$02
5bf4 cd0500    call    $0005
5bf7 dd23      inc     ix
5bf9 10f4      djnz    $5bef
5bfb dde1      pop     ix
5bfd d1        pop     de
5bfe c1        pop     bc
5bff c9        ret     

5c00 d5        push    de
5c01 e5        push    hl
5c02 dde5      push    ix
5c04 cd7e35    call    $357e
5c07 1600      ld      d,$00
5c09 3e04      ld      a,$04
5c0b cd9b03    call    $039b
5c0e 21e05a    ld      hl,$5ae0
5c11 dd2171bb  ld      ix,$bb71
5c15 cd3d81    call    $813d
5c18 f5        push    af
5c19 fe0d      cp      $0d
5c1b 2008      jr      nz,$5c25
5c1d 3af05d    ld      a,($5df0)
5c20 47        ld      b,a
5c21 f1        pop     af
5c22 c3c55d    jp      $5dc5
5c25 cd4134    call    $3441
5c28 cd4c34    call    $344c
5c2b f1        pop     af
5c2c 1807      jr      $5c35
5c2e dd2171bb  ld      ix,$bb71
5c32 cd3d81    call    $813d
5c35 daed5d    jp      c,$5ded
5c38 cde290    call    $90e2
5c3b 3033      jr      nc,$5c70
5c3d cd008a    call    $8a00
5c40 38ec      jr      c,$5c2e
5c42 cd4583    call    $8345
5c45 dd218e35  ld      ix,$358e
5c49 ddcb004e  bit     1,(ix+$00)
5c4d 2010      jr      nz,$5c5f
5c4f ddcb0046  bit     0,(ix+$00)
5c53 280d      jr      z,$5c62
5c55 cd008a    call    $8a00
5c58 3005      jr      nc,$5c5f
5c5a cd338a    call    $8a33
5c5d 18cf      jr      $5c2e
5c5f cdf15d    call    $5df1
5c62 cd1d34    call    $341d
5c65 c4ac90    call    nz,$90ac
5c68 cdb65e    call    $5eb6
5c6b cd4134    call    $3441
5c6e 18be      jr      $5c2e
5c70 fe08      cp      $08
5c72 2804      jr      z,$5c78
5c74 fe7f      cp      $7f
5c76 2010      jr      nz,$5c88
5c78 3e00      ld      a,$00
5c7a ba        cp      d
5c7b 2806      jr      z,$5c83
5c7d cdf95d    call    $5df9
5c80 15        dec     d
5c81 18ab      jr      $5c2e
5c83 cd5402    call    $0254
5c86 18a6      jr      $5c2e
5c88 dd218e35  ld      ix,$358e
5c8c ddcb004e  bit     1,(ix+$00)
5c90 c2e05d    jp      nz,$5de0
5c93 fef3      cp      $f3
5c95 207c      jr      nz,$5d13
5c97 dd21f45e  ld      ix,$5ef4
5c9b cdba5e    call    $5eba
5c9e dad35d    jp      c,$5dd3
5ca1 dd21f5b9  ld      ix,$b9f5
5ca5 e5        push    hl
5ca6 21ee5e    ld      hl,$5eee
5ca9 cd8e81    call    $818e
5cac e1        pop     hl
5cad daed5d    jp      c,$5ded
5cb0 fe31      cp      $31
5cb2 2013      jr      nz,$5cc7
5cb4 f5        push    af
5cb5 3ac859    ld      a,($59c8)
5cb8 b7        or      a
5cb9 2007      jr      nz,$5cc2
5cbb f1        pop     af
5cbc dd211fba  ld      ix,$ba1f
5cc0 181c      jr      $5cde
5cc2 f1        pop     af
5cc3 0e81      ld      c,$81
5cc5 182d      jr      $5cf4
5cc7 fe32      cp      $32
5cc9 201b      jr      nz,$5ce6
5ccb f5        push    af
5ccc 3a055a    ld      a,($5a05)
5ccf b7        or      a
5cd0 2007      jr      nz,$5cd9
5cd2 f1        pop     af
5cd3 dd211fba  ld      ix,$ba1f
5cd7 1805      jr      $5cde
5cd9 f1        pop     af
5cda 0e82      ld      c,$82
5cdc 1816      jr      $5cf4
5cde cd463f    call    $3f46
5ce1 cde989    call    $89e9
5ce4 18bb      jr      $5ca1
5ce6 0605      ld      b,$05
5ce8 cd0d34    call    $340d
5ceb 2801      jr      z,$5cee
5ced 05        dec     b
5cee cdd38c    call    $8cd3
5cf1 c32e5c    jp      $5c2e
5cf4 cd008a    call    $8a00
5cf7 38a8      jr      c,$5ca1
5cf9 cd4583    call    $8345
5cfc cd008a    call    $8a00
5cff 3005      jr      nc,$5d06
5d01 cd338a    call    $8a33
5d04 189b      jr      $5ca1
5d06 79        ld      a,c
5d07 cdb65e    call    $5eb6
5d0a cdf15d    call    $5df1
5d0d cd4134    call    $3441
5d10 c32e5c    jp      $5c2e
5d13 fef5      cp      $f5
5d15 2006      jr      nz,$5d1d
5d17 dd21fa5e  ld      ix,$5efa
5d1b 184e      jr      $5d6b
5d1d fef6      cp      $f6
5d1f 2006      jr      nz,$5d27
5d21 dd21035f  ld      ix,$5f03
5d25 1844      jr      $5d6b
5d27 fef7      cp      $f7
5d29 2006      jr      nz,$5d31
5d2b dd210b5f  ld      ix,$5f0b
5d2f 183a      jr      $5d6b
5d31 fef4      cp      $f4
5d33 200f      jr      nz,$5d44
5d35 cd3e5b    call    $5b3e
5d38 cd4f7d    call    $7d4f
5d3b cde989    call    $89e9
5d3e cd4134    call    $3441
5d41 c32e5c    jp      $5c2e
5d44 fef0      cp      $f0
5d46 2011      jr      nz,$5d59
5d48 dd218e35  ld      ix,$358e
5d4c ddcb0046  bit     0,(ix+$00)
5d50 c2e05d    jp      nz,$5de0
5d53 dd211f5f  ld      ix,$5f1f
5d57 1812      jr      $5d6b
5d59 fef1      cp      $f1
5d5b 201c      jr      nz,$5d79
5d5d dd218e35  ld      ix,$358e
5d61 ddcb0046  bit     0,(ix+$00)
5d65 2079      jr      nz,$5de0
5d67 dd212a5f  ld      ix,$5f2a
5d6b cdba5e    call    $5eba
5d6e 3863      jr      c,$5dd3
5d70 cdb65e    call    $5eb6
5d73 cd4134    call    $3441
5d76 c32e5c    jp      $5c2e
5d79 fef2      cp      $f2
5d7b 201c      jr      nz,$5d99
5d7d cd0d34    call    $340d
5d80 205e      jr      nz,$5de0
5d82 dd21305f  ld      ix,$5f30
5d86 cdba5e    call    $5eba
5d89 3848      jr      c,$5dd3
5d8b dd218e35  ld      ix,$358e
5d8f ddcb00c6  set     0,(ix+$00)
5d93 cdb65e    call    $5eb6
5d96 c32e5c    jp      $5c2e
5d99 fef8      cp      $f8
5d9b 2017      jr      nz,$5db4
5d9d dd21365f  ld      ix,$5f36
5da1 cdba5e    call    $5eba
5da4 382d      jr      c,$5dd3
5da6 dd218e35  ld      ix,$358e
5daa ddcb00ce  set     1,(ix+$00)
5dae cdb65e    call    $5eb6
5db1 c32e5c    jp      $5c2e
5db4 fe0d      cp      $0d
5db6 2015      jr      nz,$5dcd
5db8 3600      ld      (hl),$00
5dba 97        sub     a
5dbb cd9b03    call    $039b
5dbe 42        ld      b,d
5dbf 7a        ld      a,d
5dc0 32f05d    ld      ($5df0),a
5dc3 3e01      ld      a,$01
5dc5 cd8635    call    $3586
5dc8 dde1      pop     ix
5dca e1        pop     hl
5dcb d1        pop     de
5dcc c9        ret     

5dcd cd5402    call    $0254
5dd0 c32e5c    jp      $5c2e
5dd3 f5        push    af
5dd4 3efb      ld      a,$fb
5dd6 cd3790    call    $9037
5dd9 f1        pop     af
5dda cdd38c    call    $8cd3
5ddd c32e5c    jp      $5c2e
5de0 dd212fbe  ld      ix,$be2f
5de4 cd463f    call    $3f46
5de7 cde989    call    $89e9
5dea c32e5c    jp      $5c2e
5ded 97        sub     a
5dee 18d5      jr      $5dc5
5df0 00        nop     
5df1 1e3e      ld      e,$3e
5df3 0e02      ld      c,$02
5df5 cd0500    call    $0005
5df8 c9        ret     

5df9 f5        push    af
5dfa c5        push    bc
5dfb d5        push    de
5dfc dde5      push    ix
5dfe 2b        dec     hl
5dff 0600      ld      b,$00
5e01 e5        push    hl
5e02 dde1      pop     ix
5e04 dd7e00    ld      a,(ix+$00)
5e07 cde290    call    $90e2
5e0a 3029      jr      nc,$5e35
5e0c 04        inc     b
5e0d dd7eff    ld      a,(ix-$01)
5e10 fef8      cp      $f8
5e12 2015      jr      nz,$5e29
5e14 78        ld      a,b
5e15 c610      add     a,$10
5e17 47        ld      b,a
5e18 2b        dec     hl
5e19 dd7efe    ld      a,(ix-$02)
5e1c fef2      cp      $f2
5e1e c2ad5e    jp      nz,$5ead
5e21 78        ld      a,b
5e22 c604      add     a,$04
5e24 47        ld      b,a
5e25 2b        dec     hl
5e26 c3ad5e    jp      $5ead
5e29 fef2      cp      $f2
5e2b c2ad5e    jp      nz,$5ead
5e2e 78        ld      a,b
5e2f c606      add     a,$06
5e31 47        ld      b,a
5e32 2b        dec     hl
5e33 1878      jr      $5ead
5e35 fef1      cp      $f1
5e37 2004      jr      nz,$5e3d
5e39 0605      ld      b,$05
5e3b 1870      jr      $5ead
5e3d fef0      cp      $f0
5e3f 2004      jr      nz,$5e45
5e41 060a      ld      b,$0a
5e43 1868      jr      $5ead
5e45 fe81      cp      $81
5e47 2004      jr      nz,$5e4d
5e49 0607      ld      b,$07
5e4b 1854      jr      $5ea1
5e4d fe82      cp      $82
5e4f 2004      jr      nz,$5e55
5e51 0607      ld      b,$07
5e53 184c      jr      $5ea1
5e55 fef5      cp      $f5
5e57 2004      jr      nz,$5e5d
5e59 0608      ld      b,$08
5e5b 1844      jr      $5ea1
5e5d fef6      cp      $f6
5e5f 2004      jr      nz,$5e65
5e61 0607      ld      b,$07
5e63 183c      jr      $5ea1
5e65 fef7      cp      $f7
5e67 2004      jr      nz,$5e6d
5e69 0608      ld      b,$08
5e6b 1834      jr      $5ea1
5e6d fef2      cp      $f2
5e6f 200c      jr      nz,$5e7d
5e71 0605      ld      b,$05
5e73 dd218e35  ld      ix,$358e
5e77 ddcb0086  res     0,(ix+$00)
5e7b 1830      jr      $5ead
5e7d fef8      cp      $f8
5e7f 2014      jr      nz,$5e95
5e81 060f      ld      b,$0f
5e83 dd7eff    ld      a,(ix-$01)
5e86 fef2      cp      $f2
5e88 2001      jr      nz,$5e8b
5e8a 05        dec     b
5e8b dd218e35  ld      ix,$358e
5e8f ddcb008e  res     1,(ix+$00)
5e93 1818      jr      $5ead
5e95 dd2144be  ld      ix,$be44
5e99 cd463f    call    $3f46
5e9c cde989    call    $89e9
5e9f 180f      jr      $5eb0
5ea1 dd7eff    ld      a,(ix-$01)
5ea4 fef2      cp      $f2
5ea6 2005      jr      nz,$5ead
5ea8 3e04      ld      a,$04
5eaa 80        add     a,b
5eab 47        ld      b,a
5eac 2b        dec     hl
5ead cdd38c    call    $8cd3
5eb0 dde1      pop     ix
5eb2 d1        pop     de
5eb3 c1        pop     bc
5eb4 f1        pop     af
5eb5 c9        ret     

5eb6 77        ld      (hl),a
5eb7 23        inc     hl
5eb8 14        inc     d
5eb9 c9        ret     

5eba 32f35e    ld      ($5ef3),a
5ebd e5        push    hl
5ebe dde5      push    ix
5ec0 fde5      push    iy
5ec2 cd0d34    call    $340d
5ec5 200a      jr      nz,$5ed1
5ec7 fd218e35  ld      iy,$358e
5ecb fdcb004e  bit     1,(iy+$00)
5ecf 2802      jr      z,$5ed3
5ed1 dd23      inc     ix
5ed3 dde5      push    ix
5ed5 e1        pop     hl
5ed6 cda88d    call    $8da8
5ed9 3af35e    ld      a,($5ef3)
5edc fde1      pop     iy
5ede dde1      pop     ix
5ee0 e1        pop     hl
5ee1 c9        ret     

5ee2 dde5      push    ix
5ee4 dd2175be  ld      ix,$be75
5ee8 cd463f    call    $3f46
5eeb dde1      pop     ix
5eed c9        ret     

5eee 7f        ld      a,a
5eef 08        ex      af,af'
5ef0 313200    ld      sp,$0032
5ef3 00        nop     
5ef4 3c        inc     a
5ef5 73        ld      (hl),e
5ef6 65        ld      h,l
5ef7 74        ld      (hl),h
5ef8 2024      jr      nz,$5f1e
5efa 3c        inc     a
5efb 6c        ld      l,h
5efc 65        ld      h,l
5efd 74        ld      (hl),h
5efe 74        ld      (hl),h
5eff 65        ld      h,l
5f00 72        ld      (hl),d
5f01 3e24      ld      a,$24
5f03 3c        inc     a
5f04 64        ld      h,h
5f05 69        ld      l,c
5f06 67        ld      h,a
5f07 69        ld      l,c
5f08 74        ld      (hl),h
5f09 3e24      ld      a,$24
5f0b 3c        inc     a
5f0c 70        ld      (hl),b
5f0d 75        ld      (hl),l
5f0e 6e        ld      l,(hl)
5f0f 63        ld      h,e
5f10 74        ld      (hl),h
5f11 2e3e      ld      l,$3e
5f13 24        inc     h
5f14 3c        inc     a
5f15 74        ld      (hl),h
5f16 65        ld      h,l
5f17 6d        ld      l,l
5f18 70        ld      (hl),b
5f19 2073      jr      nz,$5f8e
5f1b 65        ld      h,l
5f1c 74        ld      (hl),h
5f1d 3a243c    ld      a,($3c24)
5f20 61        ld      h,c
5f21 6e        ld      l,(hl)
5f22 79        ld      a,c
5f23 2063      jr      nz,$5f88
5f25 68        ld      l,b
5f26 61        ld      h,c
5f27 72        ld      (hl),d
5f28 3e24      ld      a,$24
5f2a 3c        inc     a
5f2b 2e2e      ld      l,$2e
5f2d 2e3e      ld      l,$3e
5f2f 24        inc     h
5f30 3c        inc     a
5f31 6e        ld      l,(hl)
5f32 6f        ld      l,a
5f33 74        ld      (hl),h
5f34 2024      jr      nz,$5f5a
5f36 3c        inc     a
5f37 43        ld      b,e
5f38 41        ld      b,c
5f39 50        ld      d,b
5f3a 53        ld      d,e
5f3b 206f      jr      nz,$5fac
5f3d 72        ld      (hl),d
5f3e 206c      jr      nz,$5fac
5f40 6f        ld      l,a
5f41 77        ld      (hl),a
5f42 65        ld      h,l
5f43 72        ld      (hl),d
5f44 2024      jr      nz,$5f6a
5f46 0b        dec     bc
5f47 2a2a2a    ld      hl,($2a2a)
5f4a 45        ld      b,l
5f4b 4d        ld      c,l
5f4c 50        ld      d,b
5f4d 54        ld      d,h
5f4e 59        ld      e,c
5f4f 2a2a2a    ld      hl,($2a2a)
5f52 53        ld      d,e
5f53 45        ld      b,l
5f54 4e        ld      c,(hl)
5f55 53        ld      d,e
5f56 49        ld      c,c
5f57 54        ld      d,h
5f58 49        ld      c,c
5f59 56        ld      d,(hl)
5f5a 45        ld      b,l
5f5b 24        inc     h
5f5c 49        ld      c,c
5f5d 4e        ld      c,(hl)
5f5e 53        ld      d,e
5f5f 45        ld      b,l
5f60 4e        ld      c,(hl)
5f61 53        ld      d,e
5f62 49        ld      c,c
5f63 54        ld      d,h
5f64 49        ld      c,c
5f65 56        ld      d,(hl)
5f66 45        ld      b,l
5f67 24        inc     h
5f68 f5        push    af
5f69 d5        push    de
5f6a e5        push    hl
5f6b fde5      push    iy
5f6d cd6599    call    $9965
5f70 fd21ef60  ld      iy,$60ef
5f74 cdda8e    call    $8eda
5f77 cd6d34    call    $346d
5f7a cd5d34    call    $345d
5f7d fde1      pop     iy
5f7f e1        pop     hl
5f80 d1        pop     de
5f81 f1        pop     af
5f82 c9        ret     

5f83 d5        push    de
5f84 e5        push    hl
5f85 fde5      push    iy
5f87 32c95f    ld      ($5fc9),a
5f8a cd6599    call    $9965
5f8d fd21ef60  ld      iy,$60ef
5f91 cd1e8f    call    $8f1e
5f94 282b      jr      z,$5fc1
5f96 3013      jr      nc,$5fab
5f98 d5        push    de
5f99 e5        push    hl
5f9a fde5      push    iy
5f9c cde78e    call    $8ee7
5f9f cdca5f    call    $5fca
5fa2 fde1      pop     iy
5fa4 e1        pop     hl
5fa5 d1        pop     de
5fa6 cdda8e    call    $8eda
5fa9 1803      jr      $5fae
5fab cdca5f    call    $5fca
5fae cd7534    call    $3475
5fb1 cd5534    call    $3455
5fb4 f5        push    af
5fb5 3efe      ld      a,$fe
5fb7 cd3790    call    $9037
5fba f1        pop     af
5fbb cd7d80    call    $807d
5fbe 3e01      ld      a,$01
5fc0 b7        or      a
5fc1 fde1      pop     iy
5fc3 e1        pop     hl
5fc4 d1        pop     de
5fc5 3ac95f    ld      a,($5fc9)
5fc8 c9        ret     

5fc9 00        nop     
5fca fd21f360  ld      iy,$60f3
5fce cdda8e    call    $8eda
5fd1 c9        ret     

5fd2 fde5      push    iy
5fd4 fd21ef60  ld      iy,$60ef
5fd8 cde78e    call    $8ee7
5fdb fde1      pop     iy
5fdd c9        ret     

5fde fde5      push    iy
5fe0 fd21f360  ld      iy,$60f3
5fe4 cde78e    call    $8ee7
5fe7 fde1      pop     iy
5fe9 c9        ret     

5fea c9        ret     

5feb d5        push    de
5fec e5        push    hl
5fed fde5      push    iy
5fef cd6534    call    $3465
5ff2 200c      jr      nz,$6000
5ff4 cd4d34    call    $344d
5ff7 280e      jr      z,$6007
5ff9 fd21f360  ld      iy,$60f3
5ffd cd0c60    call    $600c
6000 fd21ef60  ld      iy,$60ef
6004 cd0c60    call    $600c
6007 fde1      pop     iy
6009 e1        pop     hl
600a d1        pop     de
600b c9        ret     

600c cd6599    call    $9965
600f cd1e8f    call    $8f1e
6012 2802      jr      z,$6016
6014 300b      jr      nc,$6021
6016 110000    ld      de,$0000
6019 60        ld      h,b
601a 69        ld      l,c
601b cdf48e    call    $8ef4
601e cdda8e    call    $8eda
6021 c9        ret     

6022 d5        push    de
6023 e5        push    hl
6024 fde5      push    iy
6026 cd6599    call    $9965
6029 fd21f760  ld      iy,$60f7
602d cdda8e    call    $8eda
6030 09        add     hl,bc
6031 3001      jr      nc,$6034
6033 13        inc     de
6034 fd21fb60  ld      iy,$60fb
6038 cdda8e    call    $8eda
603b cd6534    call    $3465
603e 2061      jr      nz,$60a1
6040 cd4d34    call    $344d
6043 287b      jr      z,$60c0
6045 fd21ef60  ld      iy,$60ef
6049 cde78e    call    $8ee7
604c fd21fb60  ld      iy,$60fb
6050 cd1e8f    call    $8f1e
6053 3813      jr      c,$6068
6055 fd21ef60  ld      iy,$60ef
6059 cdc560    call    $60c5
605c fd21f360  ld      iy,$60f3
6060 cde78e    call    $8ee7
6063 cdc560    call    $60c5
6066 1858      jr      $60c0
6068 fd21f760  ld      iy,$60f7
606c cd1e8f    call    $8f1e
606f 3019      jr      nc,$608a
6071 fde5      push    iy
6073 fd21f360  ld      iy,$60f3
6077 cde78e    call    $8ee7
607a fde1      pop     iy
607c cd1e8f    call    $8f1e
607f 380e      jr      c,$608f
6081 fd21fb60  ld      iy,$60fb
6085 cd1e8f    call    $8f1e
6088 3005      jr      nc,$608f
608a cd5d34    call    $345d
608d 1831      jr      $60c0
608f fd21fb60  ld      iy,$60fb
6093 cd1e8f    call    $8f1e
6096 3828      jr      c,$60c0
6098 fd21f360  ld      iy,$60f3
609c cdc560    call    $60c5
609f 181f      jr      $60c0
60a1 fd21ef60  ld      iy,$60ef
60a5 cd1e8f    call    $8f1e
60a8 cde78e    call    $8ee7
60ab 2802      jr      z,$60af
60ad 3005      jr      nc,$60b4
60af cdc560    call    $60c5
60b2 180c      jr      $60c0
60b4 fd21f760  ld      iy,$60f7
60b8 cd1e8f    call    $8f1e
60bb 3803      jr      c,$60c0
60bd cd7534    call    $3475
60c0 fde1      pop     iy
60c2 e1        pop     hl
60c3 d1        pop     de
60c4 c9        ret     

60c5 b7        or      a
60c6 ed42      sbc     hl,bc
60c8 3001      jr      nc,$60cb
60ca 1b        dec     de
60cb cdda8e    call    $8eda
60ce c9        ret     

60cf dd219eb7  ld      ix,$b79e
60d3 cd463f    call    $3f46
60d6 c9        ret     

60d7 fde5      push    iy
60d9 cdd25f    call    $5fd2
60dc cd0c3a    call    $3a0c
60df cdde5f    call    $5fde
60e2 fd21ef60  ld      iy,$60ef
60e6 cd8338    call    $3883
60e9 cdae86    call    $86ae
60ec fde1      pop     iy
60ee c9        ret     

60ef 00        nop     
60f0 00        nop     
60f1 00        nop     
60f2 00        nop     
60f3 00        nop     
60f4 00        nop     
60f5 00        nop     
60f6 00        nop     
60f7 00        nop     
60f8 00        nop     
60f9 00        nop     
60fa 00        nop     
60fb 00        nop     
60fc 00        nop     
60fd 00        nop     
60fe 00        nop     
60ff c5        push    bc
6100 d5        push    de
6101 e5        push    hl
6102 dde5      push    ix
6104 fde5      push    iy
6106 dd21f9d2  ld      ix,$d2f9
610a fd218c8e  ld      iy,$8e8c
610e 0e2e      ld      c,$2e
6110 cddc8c    call    $8cdc
6113 b7        or      a
6114 ca7261    jp      z,$6172
6117 cd5c64    call    $645c
611a feff      cp      $ff
611c 200e      jr      nz,$612c
611e dd21ac64  ld      ix,$64ac
6122 11f764    ld      de,$64f7
6125 cd6973    call    $7369
6128 3821      jr      c,$614b
612a 1828      jr      $6154
612c dd21dfd1  ld      ix,$d1df
6130 cdf73e    call    $3ef7
6133 cd743f    call    $3f74
6136 383a      jr      c,$6172
6138 2808      jr      z,$6142
613a cd672a    call    $2a67
613d cde989    call    $89e9
6140 1812      jr      $6154
6142 cde989    call    $89e9
6145 04        inc     b
6146 cdd38c    call    $8cd3
6149 18bb      jr      $6106
614b dd210dd2  ld      ix,$d20d
614f cd463f    call    $3f46
6152 18ee      jr      $6142
6154 3a3c74    ld      a,($743c)
6157 47        ld      b,a
6158 3e28      ld      a,$28
615a 90        sub     b
615b 111e65    ld      de,$651e
615e 211d65    ld      hl,$651d
6161 0600      ld      b,$00
6163 4f        ld      c,a
6164 edb8      lddr    
6166 3aaa64    ld      a,($64aa)
6169 12        ld      (de),a
616a cd422a    call    $2a42
616d 28dc      jr      z,$614b
616f 3e01      ld      a,$01
6171 b7        or      a
6172 fde1      pop     iy
6174 dde1      pop     ix
6176 e1        pop     hl
6177 d1        pop     de
6178 c1        pop     bc
6179 c9        ret     

617a 3e00      ld      a,$00
617c 32aa64    ld      ($64aa),a
617f cdff60    call    $60ff
6182 2868      jr      z,$61ec
6184 cd6599    call    $9965
6187 fd21a664  ld      iy,$64a6
618b cdda8e    call    $8eda
618e cdf661    call    $61f6
6191 3009      jr      nc,$619c
6193 dd2122d2  ld      ix,$d222
6197 cd463f    call    $3f46
619a 1847      jr      $61e3
619c 21ed61    ld      hl,$61ed
619f cda88d    call    $8da8
61a2 dd2138d2  ld      ix,$d238
61a6 cddc81    call    $81dc
61a9 3003      jr      nc,$61ae
61ab 97        sub     a
61ac 1835      jr      $61e3
61ae 2833      jr      z,$61e3
61b0 cdd760    call    $60d7
61b3 cdd25f    call    $5fd2
61b6 cd1e8f    call    $8f1e
61b9 2802      jr      z,$61bd
61bb 3026      jr      nc,$61e3
61bd cdde5f    call    $5fde
61c0 cd1e8f    call    $8f1e
61c3 3805      jr      c,$61ca
61c5 cdd25f    call    $5fd2
61c8 181c      jr      $61e6
61ca cdd25f    call    $5fd2
61cd cdf48e    call    $8ef4
61d0 d5        push    de
61d1 e5        push    hl
61d2 cdde5f    call    $5fde
61d5 fd21a664  ld      iy,$64a6
61d9 cdda8e    call    $8eda
61dc e1        pop     hl
61dd d1        pop     de
61de cd088f    call    $8f08
61e1 1803      jr      $61e6
61e3 cde78e    call    $8ee7
61e6 cd0c3a    call    $3a0c
61e9 cdae86    call    $86ae
61ec c9        ret     

61ed 2044      jr      nz,$6233
61ef 65        ld      h,l
61f0 6c        ld      l,h
61f1 65        ld      h,l
61f2 74        ld      (hl),h
61f3 65        ld      h,l
61f4 3f        ccf     
61f5 24        inc     h
61f6 c5        push    bc
61f7 d5        push    de
61f8 e5        push    hl
61f9 fde5      push    iy
61fb fd216262  ld      iy,$6262
61ff cdd25f    call    $5fd2
6202 cdda8e    call    $8eda
6205 cdde5f    call    $5fde
6208 cd088f    call    $8f08
620b 44        ld      b,h
620c 4d        ld      c,l
620d 7a        ld      a,d
620e b3        or      e
620f 2806      jr      z,$6217
6211 01ffff    ld      bc,$ffff
6214 1b        dec     de
6215 18f6      jr      $620d
6217 cdd25f    call    $5fd2
621a cd0c3a    call    $3a0c
621d cdde5f    call    $5fde
6220 cdda8e    call    $8eda
6223 cd6599    call    $9965
6226 cd1e8f    call    $8f1e
6229 302d      jr      nc,$6258
622b cd8394    call    $9483
622e fe81      cp      $81
6230 2007      jr      nz,$6239
6232 cde434    call    $34e4
6235 3e81      ld      a,$81
6237 1814      jr      $624d
6239 fe86      cp      $86
623b 2007      jr      nz,$6244
623d cddb34    call    $34db
6240 3e86      ld      a,$86
6242 1809      jr      $624d
6244 fe87      cp      $87
6246 2005      jr      nz,$624d
6248 cdfd34    call    $34fd
624b 3e87      ld      a,$87
624d cdd62b    call    $2bd6
6250 20d1      jr      nz,$6223
6252 cd772a    call    $2a77
6255 37        scf     
6256 1804      jr      $625c
6258 cd772a    call    $2a77
625b b7        or      a
625c fde1      pop     iy
625e e1        pop     hl
625f d1        pop     de
6260 c1        pop     bc
6261 c9        ret     

6262 00        nop     
6263 00        nop     
6264 00        nop     
6265 00        nop     
6266 cd6599    call    $9965
6269 fd21a664  ld      iy,$64a6
626d cdda8e    call    $8eda
6270 010000    ld      bc,$0000
6273 cd6599    call    $9965
6276 fd21ef60  ld      iy,$60ef
627a cd1e8f    call    $8f1e
627d 3808      jr      c,$6287
627f 2806      jr      z,$6287
6281 cdfa39    call    $39fa
6284 03        inc     bc
6285 18ec      jr      $6273
6287 78        ld      a,b
6288 b1        or      c
6289 ca5463    jp      z,$6354
628c 0b        dec     bc
628d 78        ld      a,b
628e b1        or      c
628f ca5463    jp      z,$6354
6292 ed437e63  ld      ($637e),bc
6296 cdd25f    call    $5fd2
6299 cd0c3a    call    $3a0c
629c cd2587    call    $8725
629f 47        ld      b,a
62a0 32d663    ld      ($63d6),a
62a3 cd3887    call    $8738
62a6 4f        ld      c,a
62a7 cdde5f    call    $5fde
62aa cd0c3a    call    $3a0c
62ad cd3887    call    $8738
62b0 b9        cp      c
62b1 c25463    jp      nz,$6354
62b4 cd2587    call    $8725
62b7 328063    ld      ($6380),a
62ba cdd25f    call    $5fd2
62bd cd0c3a    call    $3a0c
62c0 3e11      ld      a,$11
62c2 32aa64    ld      ($64aa),a
62c5 cdff60    call    $60ff
62c8 ca5e63    jp      z,$635e
62cb 216c63    ld      hl,$636c
62ce cda88d    call    $8da8
62d1 dd2138d2  ld      ix,$d238
62d5 cddc81    call    $81dc
62d8 3004      jr      nc,$62de
62da 97        sub     a
62db c35e63    jp      $635e
62de 2804      jr      z,$62e4
62e0 0e01      ld      c,$01
62e2 1802      jr      $62e6
62e4 0e00      ld      c,$00
62e6 ed5b7e63  ld      de,($637e)
62ea 3ad663    ld      a,($63d6)
62ed 47        ld      b,a
62ee 3a8063    ld      a,($6380)
62f1 6f        ld      l,a
62f2 cdc993    call    $93c9
62f5 fe01      cp      $01
62f7 2856      jr      z,$634f
62f9 fe0d      cp      $0d
62fb 280f      jr      z,$630c
62fd fe0a      cp      $0a
62ff 280b      jr      z,$630c
6301 cdd62b    call    $2bd6
6304 cd2587    call    $8725
6307 bd        cp      l
6308 38e8      jr      c,$62f2
630a 1812      jr      $631e
630c cd2694    call    $9426
630f cd2587    call    $8725
6312 67        ld      h,a
6313 7d        ld      a,l
6314 94        sub     h
6315 67        ld      h,a
6316 3e20      ld      a,$20
6318 cdd62b    call    $2bd6
631b 25        dec     h
631c 20f8      jr      nz,$6316
631e 3e0d      ld      a,$0d
6320 cdd62b    call    $2bd6
6323 cb41      bit     0,c
6325 2817      jr      z,$633e
6327 cd9e38    call    $389e
632a cd2694    call    $9426
632d cdb639    call    $39b6
6330 3ad663    ld      a,($63d6)
6333 47        ld      b,a
6334 cd9c39    call    $399c
6337 c5        push    bc
6338 0601      ld      b,$01
633a cd1a39    call    $391a
633d c1        pop     bc
633e 1b        dec     de
633f 7a        ld      a,d
6340 b3        or      e
6341 280c      jr      z,$634f
6343 cde839    call    $39e8
6346 fe01      cp      $01
6348 2805      jr      z,$634f
634a cd9c39    call    $399c
634d 189f      jr      $62ee
634f cd772a    call    $2a77
6352 1814      jr      $6368
6354 dd2150d3  ld      ix,$d350
6358 cd463f    call    $3f46
635b cdc93e    call    $3ec9
635e fd21a664  ld      iy,$64a6
6362 cde78e    call    $8ee7
6365 cd0c3a    call    $3a0c
6368 cdae86    call    $86ae
636b c9        ret     

636c 2044      jr      nz,$63b2
636e 65        ld      h,l
636f 6c        ld      l,h
6370 65        ld      h,l
6371 74        ld      (hl),h
6372 65        ld      h,l
6373 2063      jr      nz,$63d8
6375 6f        ld      l,a
6376 6c        ld      l,h
6377 75        ld      (hl),l
6378 6d        ld      l,l
6379 6e        ld      l,(hl)
637a 73        ld      (hl),e
637b 3f        ccf     
637c 2024      jr      nz,$63a2
637e 00        nop     
637f 00        nop     
6380 00        nop     
6381 cd2587    call    $8725
6384 32d663    ld      ($63d6),a
6387 cd0364    call    $6403
638a cd682c    call    $2c68
638d cd3c28    call    $283c
6390 cd6428    call    $2864
6393 fe01      cp      $01
6395 283b      jr      z,$63d2
6397 fe0d      cp      $0d
6399 280b      jr      z,$63a6
639b fe0a      cp      $0a
639d 2807      jr      z,$63a6
639f cdfc38    call    $38fc
63a2 382e      jr      c,$63d2
63a4 18ea      jr      $6390
63a6 cde839    call    $39e8
63a9 cd6696    call    $9666
63ac fe01      cp      $01
63ae cc9e38    call    z,$389e
63b1 3ad663    ld      a,($63d6)
63b4 47        ld      b,a
63b5 cd9c39    call    $399c
63b8 cd2587    call    $8725
63bb b8        cp      b
63bc 28d2      jr      z,$6390
63be 3805      jr      c,$63c5
63c0 cd2694    call    $9426
63c3 18f3      jr      $63b8
63c5 cd2587    call    $8725
63c8 4f        ld      c,a
63c9 78        ld      a,b
63ca 91        sub     c
63cb 28c3      jr      z,$6390
63cd cdc738    call    $38c7
63d0 18be      jr      $6390
63d2 cdae86    call    $86ae
63d5 c9        ret     

63d6 00        nop     
63d7 fe11      cp      $11
63d9 ca8163    jp      z,$6381
63dc cd0364    call    $6403
63df cd4f2c    call    $2c4f
63e2 fe02      cp      $02
63e4 2009      jr      nz,$63ef
63e6 dd213bd3  ld      ix,$d33b
63ea cd463f    call    $3f46
63ed 1808      jr      $63f7
63ef 3e00      ld      a,$00
63f1 cd1f27    call    $271f
63f4 cdae86    call    $86ae
63f7 c9        ret     

63f8 cd0364    call    $6403
63fb dd213bd3  ld      ix,$d33b
63ff cd5c2c    call    $2c5c
6402 c9        ret     

6403 c5        push    bc
6404 d5        push    de
6405 e5        push    hl
6406 cd4a20    call    $204a
6409 c640      add     a,$40
640b 322164    ld      ($6421),a
640e fde5      push    iy
6410 e1        pop     hl
6411 112364    ld      de,$6423
6414 010e00    ld      bc,$000e
6417 edb0      ldir    
6419 fd212164  ld      iy,$6421
641d e1        pop     hl
641e d1        pop     de
641f c1        pop     bc
6420 c9        ret     

6421 00        nop     
6422 3a0000    ld      a,($0000)
6425 00        nop     
6426 00        nop     
6427 00        nop     
6428 00        nop     
6429 00        nop     
642a 00        nop     
642b 00        nop     
642c 00        nop     
642d 00        nop     
642e 00        nop     
642f 00        nop     
6430 00        nop     
6431 f5        push    af
6432 e5        push    hl
6433 dde5      push    ix
6435 fde5      push    iy
6437 fd218c8e  ld      iy,$8e8c
643b dd21ac64  ld      ix,$64ac
643f 218c8e    ld      hl,$8e8c
6442 dd7e00    ld      a,(ix+$00)
6445 b7        or      a
6446 280d      jr      z,$6455
6448 cd5473    call    $7354
644b 3600      ld      (hl),$00
644d cd672a    call    $2a67
6450 cd3873    call    $7338
6453 18ea      jr      $643f
6455 fde1      pop     iy
6457 dde1      pop     ix
6459 e1        pop     hl
645a f1        pop     af
645b c9        ret     

645c c5        push    bc
645d d5        push    de
645e e5        push    hl
645f dde5      push    ix
6461 c5        push    bc
6462 cdb528    call    $28b5
6465 c1        pop     bc
6466 fde5      push    iy
6468 e1        pop     hl
6469 48        ld      c,b
646a 0600      ld      b,$00
646c 09        add     hl,bc
646d 36ff      ld      (hl),$ff
646f e5        push    hl
6470 dd21ac64  ld      ix,$64ac
6474 dd7e00    ld      a,(ix+$00)
6477 b7        or      a
6478 281e      jr      z,$6498
647a 41        ld      b,c
647b cd4789    call    $8947
647e fe02      cp      $02
6480 2816      jr      z,$6498
6482 f5        push    af
6483 e5        push    hl
6484 dde1      pop     ix
6486 06ff      ld      b,$ff
6488 1600      ld      d,$00
648a cdf772    call    $72f7
648d 280d      jr      z,$649c
648f f1        pop     af
6490 b7        or      a
6491 2805      jr      z,$6498
6493 cd3873    call    $7338
6496 18e2      jr      $647a
6498 3eff      ld      a,$ff
649a 1801      jr      $649d
649c f1        pop     af
649d e1        pop     hl
649e 3600      ld      (hl),$00
64a0 dde1      pop     ix
64a2 e1        pop     hl
64a3 d1        pop     de
64a4 c1        pop     bc
64a5 c9        ret     

64a6 00        nop     
64a7 00        nop     
64a8 00        nop     
64a9 00        nop     
64aa 00        nop     
64ab 00        nop     
64ac 00        nop     
64ad 00        nop     
64ae 00        nop     
64af 00        nop     
64b0 00        nop     
64b1 00        nop     
64b2 00        nop     
64b3 00        nop     
64b4 00        nop     
64b5 00        nop     
64b6 00        nop     
64b7 00        nop     
64b8 00        nop     
64b9 00        nop     
64ba 00        nop     
64bb 00        nop     
64bc 00        nop     
64bd 00        nop     
64be 00        nop     
64bf 00        nop     
64c0 00        nop     
64c1 00        nop     
64c2 00        nop     
64c3 00        nop     
64c4 00        nop     
64c5 00        nop     
64c6 00        nop     
64c7 00        nop     
64c8 00        nop     
64c9 00        nop     
64ca 00        nop     
64cb 00        nop     
64cc 00        nop     
64cd 00        nop     
64ce 00        nop     
64cf 00        nop     
64d0 00        nop     
64d1 00        nop     
64d2 00        nop     
64d3 00        nop     
64d4 00        nop     
64d5 00        nop     
64d6 00        nop     
64d7 00        nop     
64d8 00        nop     
64d9 00        nop     
64da 00        nop     
64db 00        nop     
64dc 00        nop     
64dd 00        nop     
64de 00        nop     
64df 00        nop     
64e0 00        nop     
64e1 00        nop     
64e2 00        nop     
64e3 00        nop     
64e4 00        nop     
64e5 00        nop     
64e6 00        nop     
64e7 00        nop     
64e8 00        nop     
64e9 00        nop     
64ea 00        nop     
64eb 00        nop     
64ec 00        nop     
64ed 00        nop     
64ee 00        nop     
64ef 00        nop     
64f0 00        nop     
64f1 00        nop     
64f2 00        nop     
64f3 00        nop     
64f4 00        nop     
64f5 00        nop     
64f6 00        nop     
64f7 00        nop     
64f8 00        nop     
64f9 00        nop     
64fa 00        nop     
64fb 00        nop     
64fc 00        nop     
64fd 00        nop     
64fe 00        nop     
64ff 00        nop     
6500 00        nop     
6501 00        nop     
6502 00        nop     
6503 00        nop     
6504 00        nop     
6505 00        nop     
6506 00        nop     
6507 00        nop     
6508 00        nop     
6509 00        nop     
650a 00        nop     
650b 00        nop     
650c 00        nop     
650d 00        nop     
650e 00        nop     
650f 00        nop     
6510 00        nop     
6511 00        nop     
6512 00        nop     
6513 00        nop     
6514 00        nop     
6515 00        nop     
6516 00        nop     
6517 00        nop     
6518 00        nop     
6519 00        nop     
651a 00        nop     
651b 00        nop     
651c 00        nop     
651d 00        nop     
651e 00        nop     
651f 2028      jr      nz,$6549
6521 73        ld      (hl),e
6522 65        ld      h,l
6523 6c        ld      l,h
6524 65        ld      h,l
6525 63        ld      h,e
6526 74        ld      (hl),h
6527 65        ld      h,l
6528 64        ld      h,h
6529 2074      jr      nz,$659f
652b 65        ld      h,l
652c 78        ld      a,b
652d 74        ld      (hl),h
652e 29        add     hl,hl
652f ff        rst     $38
6530 2028      jr      nz,$655a
6532 63        ld      h,e
6533 6f        ld      l,a
6534 6c        ld      l,h
6535 75        ld      (hl),l
6536 6d        ld      l,l
6537 6e        ld      l,(hl)
6538 2074      jr      nz,$65ae
653a 65        ld      h,l
653b 78        ld      a,b
653c 74        ld      (hl),h
653d 29        add     hl,hl
653e ff        rst     $38
653f f5        push    af
6540 d5        push    de
6541 fde5      push    iy
6543 dde5      push    ix
6545 fd21e865  ld      iy,$65e8
6549 1100a0    ld      de,$a000
654c b7        or      a
654d ed52      sbc     hl,de
654f dd218f65  ld      ix,$658f
6553 cdc02c    call    $2cc0
6556 dde1      pop     ix
6558 fde1      pop     iy
655a d1        pop     de
655b f1        pop     af
655c c9        ret     

655d fd21e865  ld      iy,$65e8
6561 cd3c28    call    $283c
6564 fe02      cp      $02
6566 2818      jr      z,$6580
6568 cd6428    call    $2864
656b fe32      cp      $32
656d 2016      jr      nz,$6585
656f cd6428    call    $2864
6572 fe30      cp      $30
6574 200f      jr      nz,$6585
6576 cd6428    call    $2864
6579 fe32      cp      $32
657b 2008      jr      nz,$6585
657d b7        or      a
657e 180e      jr      $658e
6580 118f65    ld      de,$658f
6583 1803      jr      $6588
6585 11b665    ld      de,$65b6
6588 0e09      ld      c,$09
658a cd0500    call    $0005
658d 37        scf     
658e c9        ret     

658f 4d        ld      c,l
6590 65        ld      h,l
6591 73        ld      (hl),e
6592 73        ld      (hl),e
6593 61        ld      h,c
6594 67        ld      h,a
6595 65        ld      h,l
6596 2066      jr      nz,$65fe
6598 69        ld      l,c
6599 6c        ld      l,h
659a 65        ld      h,l
659b 2028      jr      nz,$65c5
659d 57        ld      d,a
659e 52        ld      d,d
659f 49        ld      c,c
65a0 54        ld      d,h
65a1 4d        ld      c,l
65a2 41        ld      b,c
65a3 53        ld      d,e
65a4 54        ld      d,h
65a5 2e48      ld      l,$48
65a7 4c        ld      c,h
65a8 50        ld      d,b
65a9 29        add     hl,hl
65aa 206e      jr      nz,$661a
65ac 6f        ld      l,a
65ad 74        ld      (hl),h
65ae 2066      jr      nz,$6616
65b0 6f        ld      l,a
65b1 75        ld      (hl),l
65b2 6e        ld      l,(hl)
65b3 64        ld      h,h
65b4 2e24      ld      l,$24
65b6 49        ld      c,c
65b7 6e        ld      l,(hl)
65b8 63        ld      h,e
65b9 6f        ld      l,a
65ba 72        ld      (hl),d
65bb 72        ld      (hl),d
65bc 65        ld      h,l
65bd 63        ld      h,e
65be 74        ld      (hl),h
65bf 2076      jr      nz,$6637
65c1 65        ld      h,l
65c2 72        ld      (hl),d
65c3 73        ld      (hl),e
65c4 69        ld      l,c
65c5 6f        ld      l,a
65c6 6e        ld      l,(hl)
65c7 206f      jr      nz,$6638
65c9 66        ld      h,(hl)
65ca 206d      jr      nz,$6639
65cc 65        ld      h,l
65cd 73        ld      (hl),e
65ce 73        ld      (hl),e
65cf 61        ld      h,c
65d0 67        ld      h,a
65d1 65        ld      h,l
65d2 2066      jr      nz,$663a
65d4 69        ld      l,c
65d5 6c        ld      l,h
65d6 65        ld      h,l
65d7 2028      jr      nz,$6601
65d9 57        ld      d,a
65da 52        ld      d,d
65db 49        ld      c,c
65dc 54        ld      d,h
65dd 4d        ld      c,l
65de 41        ld      b,c
65df 53        ld      d,e
65e0 54        ld      d,h
65e1 2e48      ld      l,$48
65e3 4c        ld      c,h
65e4 50        ld      d,b
65e5 29        add     hl,hl
65e6 2e24      ld      l,$24
65e8 00        nop     
65e9 3a5752    ld      a,($5257)
65ec 49        ld      c,c
65ed 54        ld      d,h
65ee 4d        ld      c,l
65ef 41        ld      b,c
65f0 53        ld      d,e
65f1 54        ld      d,h
65f2 2e48      ld      l,$48
65f4 4c        ld      c,h
65f5 50        ld      d,b
65f6 00        nop     
65f7 cd1b04    call    $041b
65fa cd6745    call    $4567
65fd fd21d36a  ld      iy,$6ad3
6601 cd6599    call    $9965
6604 cdda8e    call    $8eda
6607 cd528a    call    $8a52
660a 11011e    ld      de,$1e01
660d cd9504    call    $0495
6610 110067    ld      de,$6700
6613 0e09      ld      c,$09
6615 cd0500    call    $0005
6618 cd7769    call    $6977
661b af        xor     a
661c 32fe66    ld      ($66fe),a
661f 3e01      ld      a,$01
6621 32ff66    ld      ($66ff),a
6624 dd2172a6  ld      ix,$a672
6628 fd21d269  ld      iy,$69d2
662c cd2587    call    $8725
662f 110133    ld      de,$3301
6632 cd8f82    call    $828f
6635 cd3d81    call    $813d
6638 dad466    jp      c,$66d4
663b fe20      cp      $20
663d 2018      jr      nz,$6657
663f cd6696    call    $9666
6642 fe0d      cp      $0d
6644 cace66    jp      z,$66ce
6647 3e20      ld      a,$20
6649 cdda97    call    $97da
664c cd4583    call    $8345
664f cd6067    call    $6760
6652 cdc66a    call    $6ac6
6655 18d5      jr      $662c
6657 fe08      cp      $08
6659 201e      jr      nz,$6679
665b cda096    call    $96a0
665e fe0d      cp      $0d
6660 286c      jr      z,$66ce
6662 cd2694    call    $9426
6665 cd4467    call    $6744
6668 cd6203    call    $0362
666b cd5185    call    $8551
666e cd3c86    call    $863c
6671 cd5003    call    $0350
6674 cd4887    call    $8748
6677 18b3      jr      $662c
6679 fe0c      cp      $0c
667b 2015      jr      nz,$6692
667d cd6696    call    $9666
6680 fe0d      cp      $0d
6682 284a      jr      z,$66ce
6684 cdc993    call    $93c9
6687 cd3167    call    $6731
668a cdc66a    call    $6ac6
668d cd4887    call    $8748
6690 189a      jr      $662c
6692 fe09      cp      $09
6694 201e      jr      nz,$66b4
6696 cd2587    call    $8725
6699 cd116a    call    $6a11
669c 3030      jr      nc,$66ce
669e cd1667    call    $6716
66a1 47        ld      b,a
66a2 cd3087    call    $8730
66a5 4f        ld      c,a
66a6 c5        push    bc
66a7 cd9c39    call    $399c
66aa c1        pop     bc
66ab cd4f87    call    $874f
66ae cdc66a    call    $6ac6
66b1 c32c66    jp      $662c
66b4 fe0d      cp      $0d
66b6 281c      jr      z,$66d4
66b8 cdac90    call    $90ac
66bb fe54      cp      $54
66bd 200f      jr      nz,$66ce
66bf cdda97    call    $97da
66c2 cd4583    call    $8345
66c5 cdc66a    call    $6ac6
66c8 cd5767    call    $6757
66cb c32c66    jp      $662c
66ce cd5402    call    $0254
66d1 c32c66    jp      $662c
66d4 cd4d3a    call    $3a4d
66d7 0601      ld      b,$01
66d9 cd1a39    call    $391a
66dc 1803      jr      $66e1
66de cd7945    call    $4579
66e1 cd3e8a    call    $8a3e
66e4 11011e    ld      de,$1e01
66e7 cd9504    call    $0495
66ea cd7402    call    $0274
66ed fd21d36a  ld      iy,$6ad3
66f1 cde78e    call    $8ee7
66f4 cd0c3a    call    $3a0c
66f7 cdf681    call    $81f6
66fa cd0534    call    $3405
66fd c9        ret     

66fe 00        nop     
66ff 015441    ld      bc,$4154
6702 42        ld      b,d
6703 53        ld      d,e
6704 2020      jr      nz,$6726
6706 2020      jr      nz,$6728
6708 2020      jr      nz,$672a
670a 2020      jr      nz,$672c
670c 2020      jr      nz,$672e
670e 2020      jr      nz,$6730
6710 2043      jr      nz,$6755
6712 6f        ld      l,a
6713 6c        ld      l,h
6714 3a24f5    ld      a,($f524)
6717 3d        dec     a
6718 47        ld      b,a
6719 cb3f      srl     a
671b cb3f      srl     a
671d cb3f      srl     a
671f 32fe66    ld      ($66fe),a
6722 78        ld      a,b
6723 e607      and     $07
6725 3c        inc     a
6726 47        ld      b,a
6727 3e80      ld      a,$80
6729 07        rlca    
672a 10fd      djnz    $6729
672c 32ff66    ld      ($66ff),a
672f f1        pop     af
6730 c9        ret     

6731 f5        push    af
6732 3aff66    ld      a,($66ff)
6735 07        rlca    
6736 32ff66    ld      ($66ff),a
6739 3007      jr      nc,$6742
673b 3afe66    ld      a,($66fe)
673e 3c        inc     a
673f 32fe66    ld      ($66fe),a
6742 f1        pop     af
6743 c9        ret     

6744 f5        push    af
6745 3aff66    ld      a,($66ff)
6748 0f        rrca    
6749 32ff66    ld      ($66ff),a
674c 3007      jr      nc,$6755
674e 3afe66    ld      a,($66fe)
6751 3d        dec     a
6752 32fe66    ld      ($66fe),a
6755 f1        pop     af
6756 c9        ret     

6757 cd6a67    call    $676a
675a b6        or      (hl)
675b 77        ld      (hl),a
675c cd3167    call    $6731
675f c9        ret     

6760 cd6a67    call    $676a
6763 2f        cpl     
6764 a6        and     (hl)
6765 77        ld      (hl),a
6766 cd3167    call    $6731
6769 c9        ret     

676a 21044c    ld      hl,$4c04
676d 3afe66    ld      a,($66fe)
6770 cd8d90    call    $908d
6773 3aff66    ld      a,($66ff)
6776 c9        ret     

6777 cd4a20    call    $204a
677a c640      add     a,$40
677c 32db6a    ld      ($6adb),a
677f fd21db6a  ld      iy,$6adb
6783 cd3c28    call    $283c
6786 fe02      cp      $02
6788 2008      jr      nz,$6792
678a dd21d367  ld      ix,$67d3
678e cd463f    call    $3f46
6791 c9        ret     

6792 21a546    ld      hl,$46a5
6795 22324b    ld      ($4b32),hl
6798 210000    ld      hl,$0000
679b 223c4b    ld      ($4b3c),hl
679e 214600    ld      hl,$0046
67a1 22304b    ld      ($4b30),hl
67a4 211347    ld      hl,$4713
67a7 22364b    ld      ($4b36),hl
67aa 2a364b    ld      hl,($4b36)
67ad ed4b3c4b  ld      bc,($4b3c)
67b1 09        add     hl,bc
67b2 7e        ld      a,(hl)
67b3 218747    ld      hl,$4787
67b6 cd8d90    call    $908d
67b9 7e        ld      a,(hl)
67ba 23        inc     hl
67bb 66        ld      h,(hl)
67bc 6f        ld      l,a
67bd cdbe45    call    $45be
67c0 ed5b3c4b  ld      de,($4b3c)
67c4 13        inc     de
67c5 13        inc     de
67c6 ed533c4b  ld      ($4b3c),de
67ca 2a304b    ld      hl,($4b30)
67cd b7        or      a
67ce ed52      sbc     hl,de
67d0 30d8      jr      nc,$67aa
67d2 c9        ret     

67d3 57        ld      d,a
67d4 52        ld      d,d
67d5 49        ld      c,c
67d6 54        ld      d,h
67d7 4d        ld      c,l
67d8 41        ld      b,c
67d9 53        ld      d,e
67da 54        ld      d,h
67db 2e46      ld      l,$46
67dd 4d        ld      c,l
67de 54        ld      d,h
67df 206e      jr      nz,$684f
67e1 6f        ld      l,a
67e2 74        ld      (hl),h
67e3 2066      jr      nz,$684b
67e5 6f        ld      l,a
67e6 75        ld      (hl),l
67e7 6e        ld      l,(hl)
67e8 64        ld      h,h
67e9 24        inc     h
67ea 3e01      ld      a,$01
67ec 1806      jr      $67f4
67ee 3e03      ld      a,$03
67f0 1802      jr      $67f4
67f2 3e05      ld      a,$05
67f4 326c6a    ld      ($6a6c),a
67f7 326d6a    ld      ($6a6d),a
67fa cd5769    call    $6957
67fd c8        ret     z

67fe cd6669    call    $6966
6801 c8        ret     z

6802 cdd090    call    $90d0
6805 30f7      jr      nc,$67fe
6807 cddb82    call    $82db
680a 210d83    ld      hl,$830d
680d 77        ld      (hl),a
680e 23        inc     hl
680f 3a6c6a    ld      a,($6a6c)
6812 3d        dec     a
6813 326c6a    ld      ($6a6c),a
6816 2808      jr      z,$6820
6818 cd6669    call    $6966
681b cdd090    call    $90d0
681e 38ed      jr      c,$680d
6820 010d83    ld      bc,$830d
6823 cd788f    call    $8f78
6826 eb        ex      de,hl
6827 cdd747    call    $47d7
682a 73        ld      (hl),e
682b 3a6d6a    ld      a,($6a6d)
682e fe04      cp      $04
6830 d8        ret     c

6831 23        inc     hl
6832 72        ld      (hl),d
6833 c9        ret     

6834 3e01      ld      a,$01
6836 181a      jr      $6852
6838 3e3c      ld      a,$3c
683a 1816      jr      $6852
683c 3e3c      ld      a,$3c
683e cd5268    call    $6852
6841 e5        push    hl
6842 fde1      pop     iy
6844 3804      jr      c,$684a
6846 cdce48    call    $48ce
6849 c9        ret     

684a cde248    call    $48e2
684d c9        ret     

684e 3e3c      ld      a,$3c
6850 1800      jr      $6852
6852 326c6a    ld      ($6a6c),a
6855 cd5769    call    $6957
6858 37        scf     
6859 c8        ret     z

685a cdd747    call    $47d7
685d cd6669    call    $6966
6860 282d      jr      z,$688f
6862 fe20      cp      $20
6864 2005      jr      nz,$686b
6866 cd6669    call    $6966
6869 2824      jr      z,$688f
686b 4f        ld      c,a
686c 3a6c6a    ld      a,($6a6c)
686f fe02      cp      $02
6871 3002      jr      nc,$6875
6873 71        ld      (hl),c
6874 c9        ret     

6875 47        ld      b,a
6876 79        ld      a,c
6877 5d        ld      e,l
6878 54        ld      d,h
6879 23        inc     hl
687a 77        ld      (hl),a
687b cd6669    call    $6966
687e 2803      jr      z,$6883
6880 10f7      djnz    $6879
6882 04        inc     b
6883 05        dec     b
6884 3a6c6a    ld      a,($6a6c)
6887 90        sub     b
6888 12        ld      (de),a
6889 d5        push    de
688a cd8849    call    $4988
688d e1        pop     hl
688e d0        ret     nc

688f 3600      ld      (hl),$00
6891 37        scf     
6892 c9        ret     

6893 cd5769    call    $6957
6896 c8        ret     z

6897 cd6428    call    $2864
689a fe01      cp      $01
689c 2833      jr      z,$68d1
689e cdc53c    call    $3cc5
68a1 20f4      jr      nz,$6897
68a3 cd6669    call    $6966
68a6 fe01      cp      $01
68a8 2827      jr      z,$68d1
68aa cdc53c    call    $3cc5
68ad 28f4      jr      z,$68a3
68af 21044c    ld      hl,$4c04
68b2 0e01      ld      c,$01
68b4 0620      ld      b,$20
68b6 1805      jr      $68bd
68b8 cd6669    call    $6966
68bb 2814      jr      z,$68d1
68bd fe20      cp      $20
68bf 2805      jr      z,$68c6
68c1 79        ld      a,c
68c2 b6        or      (hl)
68c3 77        ld      (hl),a
68c4 1804      jr      $68ca
68c6 79        ld      a,c
68c7 2f        cpl     
68c8 a6        and     (hl)
68c9 77        ld      (hl),a
68ca cb01      rlc     c
68cc 30ea      jr      nc,$68b8
68ce 23        inc     hl
68cf 10e7      djnz    $68b8
68d1 c9        ret     

68d2 cd5769    call    $6957
68d5 c8        ret     z

68d6 cd6669    call    $6966
68d9 c8        ret     z

68da fe20      cp      $20
68dc 28f8      jr      z,$68d6
68de cdb390    call    $90b3
68e1 326c6a    ld      ($6a6c),a
68e4 cd6669    call    $6966
68e7 2002      jr      nz,$68eb
68e9 3e00      ld      a,$00
68eb cdb390    call    $90b3
68ee 326d6a    ld      ($6a6d),a
68f1 cdd747    call    $47d7
68f4 eb        ex      de,hl
68f5 cd1c48    call    $481c
68f8 7b        ld      a,e
68f9 0605      ld      b,$05
68fb cdf990    call    $90f9
68fe 47        ld      b,a
68ff 04        inc     b
6900 c5        push    bc
6901 d5        push    de
6902 5e        ld      e,(hl)
6903 23        inc     hl
6904 56        ld      d,(hl)
6905 23        inc     hl
6906 eb        ex      de,hl
6907 7e        ld      a,(hl)
6908 cdb390    call    $90b3
690b 4f        ld      c,a
690c 3a6c6a    ld      a,($6a6c)
690f b9        cp      c
6910 200f      jr      nz,$6921
6912 23        inc     hl
6913 7e        ld      a,(hl)
6914 cdb390    call    $90b3
6917 4f        ld      c,a
6918 3a6d6a    ld      a,($6a6d)
691b b7        or      a
691c 2809      jr      z,$6927
691e b9        cp      c
691f 2806      jr      z,$6927
6921 eb        ex      de,hl
6922 10de      djnz    $6902
6924 d1        pop     de
6925 c1        pop     bc
6926 c9        ret     

6927 e1        pop     hl
6928 f1        pop     af
6929 90        sub     b
692a 326c6a    ld      ($6a6c),a
692d cde847    call    $47e8
6930 79        ld      a,c
6931 cd0591    call    $9105
6934 2f        cpl     
6935 a6        and     (hl)
6936 4f        ld      c,a
6937 3a6c6a    ld      a,($6a6c)
693a cd0591    call    $9105
693d b1        or      c
693e 77        ld      (hl),a
693f c9        ret     

6940 cd5769    call    $6957
6943 c8        ret     z

6944 cd6669    call    $6966
6947 fe20      cp      $20
6949 28f9      jr      z,$6944
694b cdb390    call    $90b3
694e fe73      cp      $73
6950 ca3134    jp      z,$3431
6953 cd2934    call    $3429
6956 c9        ret     

6957 cd6428    call    $2864
695a fe01      cp      $01
695c 2806      jr      z,$6964
695e fe3a      cp      $3a
6960 20f5      jr      nz,$6957
6962 b7        or      a
6963 c9        ret     

6964 bf        cp      a
6965 c9        ret     

6966 e5        push    hl
6967 cd6428    call    $2864
696a cdc53c    call    $3cc5
696d 2806      jr      z,$6975
696f cde290    call    $90e2
6972 30f2      jr      nc,$6966
6974 b7        or      a
6975 e1        pop     hl
6976 c9        ret     

6977 f5        push    af
6978 c5        push    bc
6979 d5        push    de
697a e5        push    hl
697b cdc233    call    $33c2
697e 200c      jr      nz,$698c
6980 cde497    call    $97e4
6983 3e01      ld      a,$01
6985 32f287    ld      ($87f2),a
6988 3c        inc     a
6989 32f187    ld      ($87f1),a
698c cd6203    call    $0362
698f cd3e8a    call    $8a3e
6992 cd4d3a    call    $3a4d
6995 0620      ld      b,$20
6997 0e01      ld      c,$01
6999 21044c    ld      hl,$4c04
699c 11e977    ld      de,$77e9
699f c5        push    bc
69a0 79        ld      a,c
69a1 a6        and     (hl)
69a2 3e20      ld      a,$20
69a4 2802      jr      z,$69a8
69a6 3e54      ld      a,$54
69a8 12        ld      (de),a
69a9 13        inc     de
69aa c1        pop     bc
69ab cb01      rlc     c
69ad 30f0      jr      nc,$699f
69af 23        inc     hl
69b0 10ed      djnz    $699f
69b2 3e0d      ld      a,$0d
69b4 11e678    ld      de,$78e6
69b7 12        ld      (de),a
69b8 11e977    ld      de,$77e9
69bb 01fe00    ld      bc,$00fe
69be cdf096    call    $96f0
69c1 cd4d3a    call    $3a4d
69c4 cd4f7d    call    $7d4f
69c7 cd3c86    call    $863c
69ca cd5003    call    $0350
69cd e1        pop     hl
69ce d1        pop     de
69cf c1        pop     bc
69d0 f1        pop     af
69d1 c9        ret     

69d2 fde5      push    iy
69d4 fd21d76a  ld      iy,$6ad7
69d8 cd6599    call    $9965
69db cdda8e    call    $8eda
69de cd6203    call    $0362
69e1 cd4f7d    call    $7d4f
69e4 cde78e    call    $8ee7
69e7 cd0c3a    call    $3a0c
69ea cd3c86    call    $863c
69ed cd5003    call    $0350
69f0 fde1      pop     iy
69f2 c9        ret     

69f3 cd2587    call    $8725
69f6 cd116a    call    $6a11
69f9 3015      jr      nc,$6a10
69fb 47        ld      b,a
69fc cddd33    call    $33dd
69ff 2006      jr      nz,$6a07
6a01 cd9c39    call    $399c
6a04 cd3c86    call    $863c
6a07 cd2587    call    $8725
6a0a 57        ld      d,a
6a0b 78        ld      a,b
6a0c 92        sub     d
6a0d c4b238    call    nz,$38b2
6a10 c9        ret     

6a11 e5        push    hl
6a12 c5        push    bc
6a13 3d        dec     a
6a14 4f        ld      c,a
6a15 e6f8      and     $f8
6a17 326c6a    ld      ($6a6c),a
6a1a cb3f      srl     a
6a1c cb3f      srl     a
6a1e cb3f      srl     a
6a20 21044c    ld      hl,$4c04
6a23 cd8d90    call    $908d
6a26 79        ld      a,c
6a27 e607      and     $07
6a29 fe07      cp      $07
6a2b 280f      jr      z,$6a3c
6a2d 47        ld      b,a
6a2e 04        inc     b
6a2f 3e01      ld      a,$01
6a31 07        rlca    
6a32 10fd      djnz    $6a31
6a34 3d        dec     a
6a35 2f        cpl     
6a36 a6        and     (hl)
6a37 b7        or      a
6a38 2802      jr      z,$6a3c
6a3a 180f      jr      $6a4b
6a3c 3a6c6a    ld      a,($6a6c)
6a3f c608      add     a,$08
6a41 326c6a    ld      ($6a6c),a
6a44 3822      jr      c,$6a68
6a46 23        inc     hl
6a47 7e        ld      a,(hl)
6a48 b7        or      a
6a49 28f1      jr      z,$6a3c
6a4b 0601      ld      b,$01
6a4d 4f        ld      c,a
6a4e a0        and     b
6a4f 2010      jr      nz,$6a61
6a51 3a6c6a    ld      a,($6a6c)
6a54 3c        inc     a
6a55 326c6a    ld      ($6a6c),a
6a58 380e      jr      c,$6a68
6a5a cb00      rlc     b
6a5c 38e8      jr      c,$6a46
6a5e 79        ld      a,c
6a5f 18ed      jr      $6a4e
6a61 3a6c6a    ld      a,($6a6c)
6a64 3c        inc     a
6a65 37        scf     
6a66 1801      jr      $6a69
6a68 b7        or      a
6a69 c1        pop     bc
6a6a e1        pop     hl
6a6b c9        ret     

6a6c 00        nop     
6a6d 00        nop     
6a6e e5        push    hl
6a6f c5        push    bc
6a70 3d        dec     a
6a71 4f        ld      c,a
6a72 f607      or      $07
6a74 326c6a    ld      ($6a6c),a
6a77 cb3f      srl     a
6a79 cb3f      srl     a
6a7b cb3f      srl     a
6a7d 21044c    ld      hl,$4c04
6a80 cd8d90    call    $908d
6a83 79        ld      a,c
6a84 e607      and     $07
6a86 b7        or      a
6a87 280d      jr      z,$6a96
6a89 47        ld      b,a
6a8a 3e01      ld      a,$01
6a8c 07        rlca    
6a8d 10fd      djnz    $6a8c
6a8f 3d        dec     a
6a90 a6        and     (hl)
6a91 b7        or      a
6a92 2802      jr      z,$6a96
6a94 180f      jr      $6aa5
6a96 3a6c6a    ld      a,($6a6c)
6a99 d608      sub     $08
6a9b 326c6a    ld      ($6a6c),a
6a9e 3822      jr      c,$6ac2
6aa0 2b        dec     hl
6aa1 7e        ld      a,(hl)
6aa2 b7        or      a
6aa3 2897      jr      z,$6a3c
6aa5 0680      ld      b,$80
6aa7 4f        ld      c,a
6aa8 a0        and     b
6aa9 2010      jr      nz,$6abb
6aab 3a6c6a    ld      a,($6a6c)
6aae 3d        dec     a
6aaf 326c6a    ld      ($6a6c),a
6ab2 380e      jr      c,$6ac2
6ab4 cb08      rrc     b
6ab6 38e8      jr      c,$6aa0
6ab8 79        ld      a,c
6ab9 18ed      jr      $6aa8
6abb 3a6c6a    ld      a,($6a6c)
6abe 3c        inc     a
6abf 37        scf     
6ac0 1801      jr      $6ac3
6ac2 b7        or      a
6ac3 c1        pop     bc
6ac4 e1        pop     hl
6ac5 c9        ret     

6ac6 cd6203    call    $0362
6ac9 cd0485    call    $8504
6acc cd3c86    call    $863c
6acf cd5003    call    $0350
6ad2 c9        ret     

6ad3 00        nop     
6ad4 00        nop     
6ad5 00        nop     
6ad6 00        nop     
6ad7 00        nop     
6ad8 00        nop     
6ad9 00        nop     
6ada 00        nop     
6adb 00        nop     
6adc 3a5752    ld      a,($5257)
6adf 49        ld      c,c
6ae0 54        ld      d,h
6ae1 4d        ld      c,l
6ae2 41        ld      b,c
6ae3 53        ld      d,e
6ae4 54        ld      d,h
6ae5 2e46      ld      l,$46
6ae7 4d        ld      c,l
6ae8 54        ld      d,h
6ae9 00        nop     
6aea f5        push    af
6aeb c5        push    bc
6aec e5        push    hl
6aed 2a946f    ld      hl,($6f94)
6af0 cd5643    call    $4356
6af3 280b      jr      z,$6b00
6af5 cdf342    call    $42f3
6af8 7c        ld      a,h
6af9 b8        cp      b
6afa 2002      jr      nz,$6afe
6afc 7d        ld      a,l
6afd b9        cp      c
6afe 3006      jr      nc,$6b06
6b00 23        inc     hl
6b01 22946f    ld      ($6f94),hl
6b04 1806      jr      $6b0c
6b06 cd286b    call    $6b28
6b09 cdeb85    call    $85eb
6b0c e1        pop     hl
6b0d c1        pop     bc
6b0e f1        pop     af
6b0f c9        ret     

6b10 f5        push    af
6b11 e5        push    hl
6b12 2a946f    ld      hl,($6f94)
6b15 2b        dec     hl
6b16 7c        ld      a,h
6b17 b5        or      l
6b18 2805      jr      z,$6b1f
6b1a 22946f    ld      ($6f94),hl
6b1d 1806      jr      $6b25
6b1f cd386b    call    $6b38
6b22 cde485    call    $85e4
6b25 e1        pop     hl
6b26 f1        pop     af
6b27 c9        ret     

6b28 e5        push    hl
6b29 cd456b    call    $6b45
6b2c cd7d6b    call    $6b7d
6b2f 2a926f    ld      hl,($6f92)
6b32 23        inc     hl
6b33 22926f    ld      ($6f92),hl
6b36 e1        pop     hl
6b37 c9        ret     

6b38 e5        push    hl
6b39 cd586b    call    $6b58
6b3c 2a926f    ld      hl,($6f92)
6b3f 2b        dec     hl
6b40 22926f    ld      ($6f92),hl
6b43 e1        pop     hl
6b44 c9        ret     

6b45 c5        push    bc
6b46 e5        push    hl
6b47 2a906f    ld      hl,($6f90)
6b4a ed4b946f  ld      bc,($6f94)
6b4e 2b        dec     hl
6b4f 70        ld      (hl),b
6b50 2b        dec     hl
6b51 71        ld      (hl),c
6b52 22906f    ld      ($6f90),hl
6b55 e1        pop     hl
6b56 c1        pop     bc
6b57 c9        ret     

6b58 c5        push    bc
6b59 e5        push    hl
6b5a 2a906f    ld      hl,($6f90)
6b5d 4e        ld      c,(hl)
6b5e 23        inc     hl
6b5f 46        ld      b,(hl)
6b60 23        inc     hl
6b61 22906f    ld      ($6f90),hl
6b64 ed43946f  ld      ($6f94),bc
6b68 e1        pop     hl
6b69 c1        pop     bc
6b6a c9        ret     

6b6b e5        push    hl
6b6c 21906f    ld      hl,$6f90
6b6f 22906f    ld      ($6f90),hl
6b72 210100    ld      hl,$0001
6b75 22926f    ld      ($6f92),hl
6b78 cd7d6b    call    $6b7d
6b7b e1        pop     hl
6b7c c9        ret     

6b7d e5        push    hl
6b7e 210100    ld      hl,$0001
6b81 22946f    ld      ($6f94),hl
6b84 e1        pop     hl
6b85 c9        ret     

6b86 ed4b926f  ld      bc,($6f92)
6b8a c9        ret     

6b8b ed4b946f  ld      bc,($6f94)
6b8f c9        ret     

6b90 00        nop     
6b91 00        nop     
6b92 00        nop     
6b93 00        nop     
6b94 00        nop     
6b95 00        nop     
6b96 00        nop     
6b97 00        nop     
6b98 00        nop     
6b99 00        nop     
6b9a 00        nop     
6b9b 00        nop     
6b9c 00        nop     
6b9d 00        nop     
6b9e 00        nop     
6b9f 00        nop     
6ba0 00        nop     
6ba1 00        nop     
6ba2 00        nop     
6ba3 00        nop     
6ba4 00        nop     
6ba5 00        nop     
6ba6 00        nop     
6ba7 00        nop     
6ba8 00        nop     
6ba9 00        nop     
6baa 00        nop     
6bab 00        nop     
6bac 00        nop     
6bad 00        nop     
6bae 00        nop     
6baf 00        nop     
6bb0 00        nop     
6bb1 00        nop     
6bb2 00        nop     
6bb3 00        nop     
6bb4 00        nop     
6bb5 00        nop     
6bb6 00        nop     
6bb7 00        nop     
6bb8 00        nop     
6bb9 00        nop     
6bba 00        nop     
6bbb 00        nop     
6bbc 00        nop     
6bbd 00        nop     
6bbe 00        nop     
6bbf 00        nop     
6bc0 00        nop     
6bc1 00        nop     
6bc2 00        nop     
6bc3 00        nop     
6bc4 00        nop     
6bc5 00        nop     
6bc6 00        nop     
6bc7 00        nop     
6bc8 00        nop     
6bc9 00        nop     
6bca 00        nop     
6bcb 00        nop     
6bcc 00        nop     
6bcd 00        nop     
6bce 00        nop     
6bcf 00        nop     
6bd0 00        nop     
6bd1 00        nop     
6bd2 00        nop     
6bd3 00        nop     
6bd4 00        nop     
6bd5 00        nop     
6bd6 00        nop     
6bd7 00        nop     
6bd8 00        nop     
6bd9 00        nop     
6bda 00        nop     
6bdb 00        nop     
6bdc 00        nop     
6bdd 00        nop     
6bde 00        nop     
6bdf 00        nop     
6be0 00        nop     
6be1 00        nop     
6be2 00        nop     
6be3 00        nop     
6be4 00        nop     
6be5 00        nop     
6be6 00        nop     
6be7 00        nop     
6be8 00        nop     
6be9 00        nop     
6bea 00        nop     
6beb 00        nop     
6bec 00        nop     
6bed 00        nop     
6bee 00        nop     
6bef 00        nop     
6bf0 00        nop     
6bf1 00        nop     
6bf2 00        nop     
6bf3 00        nop     
6bf4 00        nop     
6bf5 00        nop     
6bf6 00        nop     
6bf7 00        nop     
6bf8 00        nop     
6bf9 00        nop     
6bfa 00        nop     
6bfb 00        nop     
6bfc 00        nop     
6bfd 00        nop     
6bfe 00        nop     
6bff 00        nop     
6c00 00        nop     
6c01 00        nop     
6c02 00        nop     
6c03 00        nop     
6c04 00        nop     
6c05 00        nop     
6c06 00        nop     
6c07 00        nop     
6c08 00        nop     
6c09 00        nop     
6c0a 00        nop     
6c0b 00        nop     
6c0c 00        nop     
6c0d 00        nop     
6c0e 00        nop     
6c0f 00        nop     
6c10 00        nop     
6c11 00        nop     
6c12 00        nop     
6c13 00        nop     
6c14 00        nop     
6c15 00        nop     
6c16 00        nop     
6c17 00        nop     
6c18 00        nop     
6c19 00        nop     
6c1a 00        nop     
6c1b 00        nop     
6c1c 00        nop     
6c1d 00        nop     
6c1e 00        nop     
6c1f 00        nop     
6c20 00        nop     
6c21 00        nop     
6c22 00        nop     
6c23 00        nop     
6c24 00        nop     
6c25 00        nop     
6c26 00        nop     
6c27 00        nop     
6c28 00        nop     
6c29 00        nop     
6c2a 00        nop     
6c2b 00        nop     
6c2c 00        nop     
6c2d 00        nop     
6c2e 00        nop     
6c2f 00        nop     
6c30 00        nop     
6c31 00        nop     
6c32 00        nop     
6c33 00        nop     
6c34 00        nop     
6c35 00        nop     
6c36 00        nop     
6c37 00        nop     
6c38 00        nop     
6c39 00        nop     
6c3a 00        nop     
6c3b 00        nop     
6c3c 00        nop     
6c3d 00        nop     
6c3e 00        nop     
6c3f 00        nop     
6c40 00        nop     
6c41 00        nop     
6c42 00        nop     
6c43 00        nop     
6c44 00        nop     
6c45 00        nop     
6c46 00        nop     
6c47 00        nop     
6c48 00        nop     
6c49 00        nop     
6c4a 00        nop     
6c4b 00        nop     
6c4c 00        nop     
6c4d 00        nop     
6c4e 00        nop     
6c4f 00        nop     
6c50 00        nop     
6c51 00        nop     
6c52 00        nop     
6c53 00        nop     
6c54 00        nop     
6c55 00        nop     
6c56 00        nop     
6c57 00        nop     
6c58 00        nop     
6c59 00        nop     
6c5a 00        nop     
6c5b 00        nop     
6c5c 00        nop     
6c5d 00        nop     
6c5e 00        nop     
6c5f 00        nop     
6c60 00        nop     
6c61 00        nop     
6c62 00        nop     
6c63 00        nop     
6c64 00        nop     
6c65 00        nop     
6c66 00        nop     
6c67 00        nop     
6c68 00        nop     
6c69 00        nop     
6c6a 00        nop     
6c6b 00        nop     
6c6c 00        nop     
6c6d 00        nop     
6c6e 00        nop     
6c6f 00        nop     
6c70 00        nop     
6c71 00        nop     
6c72 00        nop     
6c73 00        nop     
6c74 00        nop     
6c75 00        nop     
6c76 00        nop     
6c77 00        nop     
6c78 00        nop     
6c79 00        nop     
6c7a 00        nop     
6c7b 00        nop     
6c7c 00        nop     
6c7d 00        nop     
6c7e 00        nop     
6c7f 00        nop     
6c80 00        nop     
6c81 00        nop     
6c82 00        nop     
6c83 00        nop     
6c84 00        nop     
6c85 00        nop     
6c86 00        nop     
6c87 00        nop     
6c88 00        nop     
6c89 00        nop     
6c8a 00        nop     
6c8b 00        nop     
6c8c 00        nop     
6c8d 00        nop     
6c8e 00        nop     
6c8f 00        nop     
6c90 00        nop     
6c91 00        nop     
6c92 00        nop     
6c93 00        nop     
6c94 00        nop     
6c95 00        nop     
6c96 00        nop     
6c97 00        nop     
6c98 00        nop     
6c99 00        nop     
6c9a 00        nop     
6c9b 00        nop     
6c9c 00        nop     
6c9d 00        nop     
6c9e 00        nop     
6c9f 00        nop     
6ca0 00        nop     
6ca1 00        nop     
6ca2 00        nop     
6ca3 00        nop     
6ca4 00        nop     
6ca5 00        nop     
6ca6 00        nop     
6ca7 00        nop     
6ca8 00        nop     
6ca9 00        nop     
6caa 00        nop     
6cab 00        nop     
6cac 00        nop     
6cad 00        nop     
6cae 00        nop     
6caf 00        nop     
6cb0 00        nop     
6cb1 00        nop     
6cb2 00        nop     
6cb3 00        nop     
6cb4 00        nop     
6cb5 00        nop     
6cb6 00        nop     
6cb7 00        nop     
6cb8 00        nop     
6cb9 00        nop     
6cba 00        nop     
6cbb 00        nop     
6cbc 00        nop     
6cbd 00        nop     
6cbe 00        nop     
6cbf 00        nop     
6cc0 00        nop     
6cc1 00        nop     
6cc2 00        nop     
6cc3 00        nop     
6cc4 00        nop     
6cc5 00        nop     
6cc6 00        nop     
6cc7 00        nop     
6cc8 00        nop     
6cc9 00        nop     
6cca 00        nop     
6ccb 00        nop     
6ccc 00        nop     
6ccd 00        nop     
6cce 00        nop     
6ccf 00        nop     
6cd0 00        nop     
6cd1 00        nop     
6cd2 00        nop     
6cd3 00        nop     
6cd4 00        nop     
6cd5 00        nop     
6cd6 00        nop     
6cd7 00        nop     
6cd8 00        nop     
6cd9 00        nop     
6cda 00        nop     
6cdb 00        nop     
6cdc 00        nop     
6cdd 00        nop     
6cde 00        nop     
6cdf 00        nop     
6ce0 00        nop     
6ce1 00        nop     
6ce2 00        nop     
6ce3 00        nop     
6ce4 00        nop     
6ce5 00        nop     
6ce6 00        nop     
6ce7 00        nop     
6ce8 00        nop     
6ce9 00        nop     
6cea 00        nop     
6ceb 00        nop     
6cec 00        nop     
6ced 00        nop     
6cee 00        nop     
6cef 00        nop     
6cf0 00        nop     
6cf1 00        nop     
6cf2 00        nop     
6cf3 00        nop     
6cf4 00        nop     
6cf5 00        nop     
6cf6 00        nop     
6cf7 00        nop     
6cf8 00        nop     
6cf9 00        nop     
6cfa 00        nop     
6cfb 00        nop     
6cfc 00        nop     
6cfd 00        nop     
6cfe 00        nop     
6cff 00        nop     
6d00 00        nop     
6d01 00        nop     
6d02 00        nop     
6d03 00        nop     
6d04 00        nop     
6d05 00        nop     
6d06 00        nop     
6d07 00        nop     
6d08 00        nop     
6d09 00        nop     
6d0a 00        nop     
6d0b 00        nop     
6d0c 00        nop     
6d0d 00        nop     
6d0e 00        nop     
6d0f 00        nop     
6d10 00        nop     
6d11 00        nop     
6d12 00        nop     
6d13 00        nop     
6d14 00        nop     
6d15 00        nop     
6d16 00        nop     
6d17 00        nop     
6d18 00        nop     
6d19 00        nop     
6d1a 00        nop     
6d1b 00        nop     
6d1c 00        nop     
6d1d 00        nop     
6d1e 00        nop     
6d1f 00        nop     
6d20 00        nop     
6d21 00        nop     
6d22 00        nop     
6d23 00        nop     
6d24 00        nop     
6d25 00        nop     
6d26 00        nop     
6d27 00        nop     
6d28 00        nop     
6d29 00        nop     
6d2a 00        nop     
6d2b 00        nop     
6d2c 00        nop     
6d2d 00        nop     
6d2e 00        nop     
6d2f 00        nop     
6d30 00        nop     
6d31 00        nop     
6d32 00        nop     
6d33 00        nop     
6d34 00        nop     
6d35 00        nop     
6d36 00        nop     
6d37 00        nop     
6d38 00        nop     
6d39 00        nop     
6d3a 00        nop     
6d3b 00        nop     
6d3c 00        nop     
6d3d 00        nop     
6d3e 00        nop     
6d3f 00        nop     
6d40 00        nop     
6d41 00        nop     
6d42 00        nop     
6d43 00        nop     
6d44 00        nop     
6d45 00        nop     
6d46 00        nop     
6d47 00        nop     
6d48 00        nop     
6d49 00        nop     
6d4a 00        nop     
6d4b 00        nop     
6d4c 00        nop     
6d4d 00        nop     
6d4e 00        nop     
6d4f 00        nop     
6d50 00        nop     
6d51 00        nop     
6d52 00        nop     
6d53 00        nop     
6d54 00        nop     
6d55 00        nop     
6d56 00        nop     
6d57 00        nop     
6d58 00        nop     
6d59 00        nop     
6d5a 00        nop     
6d5b 00        nop     
6d5c 00        nop     
6d5d 00        nop     
6d5e 00        nop     
6d5f 00        nop     
6d60 00        nop     
6d61 00        nop     
6d62 00        nop     
6d63 00        nop     
6d64 00        nop     
6d65 00        nop     
6d66 00        nop     
6d67 00        nop     
6d68 00        nop     
6d69 00        nop     
6d6a 00        nop     
6d6b 00        nop     
6d6c 00        nop     
6d6d 00        nop     
6d6e 00        nop     
6d6f 00        nop     
6d70 00        nop     
6d71 00        nop     
6d72 00        nop     
6d73 00        nop     
6d74 00        nop     
6d75 00        nop     
6d76 00        nop     
6d77 00        nop     
6d78 00        nop     
6d79 00        nop     
6d7a 00        nop     
6d7b 00        nop     
6d7c 00        nop     
6d7d 00        nop     
6d7e 00        nop     
6d7f 00        nop     
6d80 00        nop     
6d81 00        nop     
6d82 00        nop     
6d83 00        nop     
6d84 00        nop     
6d85 00        nop     
6d86 00        nop     
6d87 00        nop     
6d88 00        nop     
6d89 00        nop     
6d8a 00        nop     
6d8b 00        nop     
6d8c 00        nop     
6d8d 00        nop     
6d8e 00        nop     
6d8f 00        nop     
6d90 00        nop     
6d91 00        nop     
6d92 00        nop     
6d93 00        nop     
6d94 00        nop     
6d95 00        nop     
6d96 00        nop     
6d97 00        nop     
6d98 00        nop     
6d99 00        nop     
6d9a 00        nop     
6d9b 00        nop     
6d9c 00        nop     
6d9d 00        nop     
6d9e 00        nop     
6d9f 00        nop     
6da0 00        nop     
6da1 00        nop     
6da2 00        nop     
6da3 00        nop     
6da4 00        nop     
6da5 00        nop     
6da6 00        nop     
6da7 00        nop     
6da8 00        nop     
6da9 00        nop     
6daa 00        nop     
6dab 00        nop     
6dac 00        nop     
6dad 00        nop     
6dae 00        nop     
6daf 00        nop     
6db0 00        nop     
6db1 00        nop     
6db2 00        nop     
6db3 00        nop     
6db4 00        nop     
6db5 00        nop     
6db6 00        nop     
6db7 00        nop     
6db8 00        nop     
6db9 00        nop     
6dba 00        nop     
6dbb 00        nop     
6dbc 00        nop     
6dbd 00        nop     
6dbe 00        nop     
6dbf 00        nop     
6dc0 00        nop     
6dc1 00        nop     
6dc2 00        nop     
6dc3 00        nop     
6dc4 00        nop     
6dc5 00        nop     
6dc6 00        nop     
6dc7 00        nop     
6dc8 00        nop     
6dc9 00        nop     
6dca 00        nop     
6dcb 00        nop     
6dcc 00        nop     
6dcd 00        nop     
6dce 00        nop     
6dcf 00        nop     
6dd0 00        nop     
6dd1 00        nop     
6dd2 00        nop     
6dd3 00        nop     
6dd4 00        nop     
6dd5 00        nop     
6dd6 00        nop     
6dd7 00        nop     
6dd8 00        nop     
6dd9 00        nop     
6dda 00        nop     
6ddb 00        nop     
6ddc 00        nop     
6ddd 00        nop     
6dde 00        nop     
6ddf 00        nop     
6de0 00        nop     
6de1 00        nop     
6de2 00        nop     
6de3 00        nop     
6de4 00        nop     
6de5 00        nop     
6de6 00        nop     
6de7 00        nop     
6de8 00        nop     
6de9 00        nop     
6dea 00        nop     
6deb 00        nop     
6dec 00        nop     
6ded 00        nop     
6dee 00        nop     
6def 00        nop     
6df0 00        nop     
6df1 00        nop     
6df2 00        nop     
6df3 00        nop     
6df4 00        nop     
6df5 00        nop     
6df6 00        nop     
6df7 00        nop     
6df8 00        nop     
6df9 00        nop     
6dfa 00        nop     
6dfb 00        nop     
6dfc 00        nop     
6dfd 00        nop     
6dfe 00        nop     
6dff 00        nop     
6e00 00        nop     
6e01 00        nop     
6e02 00        nop     
6e03 00        nop     
6e04 00        nop     
6e05 00        nop     
6e06 00        nop     
6e07 00        nop     
6e08 00        nop     
6e09 00        nop     
6e0a 00        nop     
6e0b 00        nop     
6e0c 00        nop     
6e0d 00        nop     
6e0e 00        nop     
6e0f 00        nop     
6e10 00        nop     
6e11 00        nop     
6e12 00        nop     
6e13 00        nop     
6e14 00        nop     
6e15 00        nop     
6e16 00        nop     
6e17 00        nop     
6e18 00        nop     
6e19 00        nop     
6e1a 00        nop     
6e1b 00        nop     
6e1c 00        nop     
6e1d 00        nop     
6e1e 00        nop     
6e1f 00        nop     
6e20 00        nop     
6e21 00        nop     
6e22 00        nop     
6e23 00        nop     
6e24 00        nop     
6e25 00        nop     
6e26 00        nop     
6e27 00        nop     
6e28 00        nop     
6e29 00        nop     
6e2a 00        nop     
6e2b 00        nop     
6e2c 00        nop     
6e2d 00        nop     
6e2e 00        nop     
6e2f 00        nop     
6e30 00        nop     
6e31 00        nop     
6e32 00        nop     
6e33 00        nop     
6e34 00        nop     
6e35 00        nop     
6e36 00        nop     
6e37 00        nop     
6e38 00        nop     
6e39 00        nop     
6e3a 00        nop     
6e3b 00        nop     
6e3c 00        nop     
6e3d 00        nop     
6e3e 00        nop     
6e3f 00        nop     
6e40 00        nop     
6e41 00        nop     
6e42 00        nop     
6e43 00        nop     
6e44 00        nop     
6e45 00        nop     
6e46 00        nop     
6e47 00        nop     
6e48 00        nop     
6e49 00        nop     
6e4a 00        nop     
6e4b 00        nop     
6e4c 00        nop     
6e4d 00        nop     
6e4e 00        nop     
6e4f 00        nop     
6e50 00        nop     
6e51 00        nop     
6e52 00        nop     
6e53 00        nop     
6e54 00        nop     
6e55 00        nop     
6e56 00        nop     
6e57 00        nop     
6e58 00        nop     
6e59 00        nop     
6e5a 00        nop     
6e5b 00        nop     
6e5c 00        nop     
6e5d 00        nop     
6e5e 00        nop     
6e5f 00        nop     
6e60 00        nop     
6e61 00        nop     
6e62 00        nop     
6e63 00        nop     
6e64 00        nop     
6e65 00        nop     
6e66 00        nop     
6e67 00        nop     
6e68 00        nop     
6e69 00        nop     
6e6a 00        nop     
6e6b 00        nop     
6e6c 00        nop     
6e6d 00        nop     
6e6e 00        nop     
6e6f 00        nop     
6e70 00        nop     
6e71 00        nop     
6e72 00        nop     
6e73 00        nop     
6e74 00        nop     
6e75 00        nop     
6e76 00        nop     
6e77 00        nop     
6e78 00        nop     
6e79 00        nop     
6e7a 00        nop     
6e7b 00        nop     
6e7c 00        nop     
6e7d 00        nop     
6e7e 00        nop     
6e7f 00        nop     
6e80 00        nop     
6e81 00        nop     
6e82 00        nop     
6e83 00        nop     
6e84 00        nop     
6e85 00        nop     
6e86 00        nop     
6e87 00        nop     
6e88 00        nop     
6e89 00        nop     
6e8a 00        nop     
6e8b 00        nop     
6e8c 00        nop     
6e8d 00        nop     
6e8e 00        nop     
6e8f 00        nop     
6e90 00        nop     
6e91 00        nop     
6e92 00        nop     
6e93 00        nop     
6e94 00        nop     
6e95 00        nop     
6e96 00        nop     
6e97 00        nop     
6e98 00        nop     
6e99 00        nop     
6e9a 00        nop     
6e9b 00        nop     
6e9c 00        nop     
6e9d 00        nop     
6e9e 00        nop     
6e9f 00        nop     
6ea0 00        nop     
6ea1 00        nop     
6ea2 00        nop     
6ea3 00        nop     
6ea4 00        nop     
6ea5 00        nop     
6ea6 00        nop     
6ea7 00        nop     
6ea8 00        nop     
6ea9 00        nop     
6eaa 00        nop     
6eab 00        nop     
6eac 00        nop     
6ead 00        nop     
6eae 00        nop     
6eaf 00        nop     
6eb0 00        nop     
6eb1 00        nop     
6eb2 00        nop     
6eb3 00        nop     
6eb4 00        nop     
6eb5 00        nop     
6eb6 00        nop     
6eb7 00        nop     
6eb8 00        nop     
6eb9 00        nop     
6eba 00        nop     
6ebb 00        nop     
6ebc 00        nop     
6ebd 00        nop     
6ebe 00        nop     
6ebf 00        nop     
6ec0 00        nop     
6ec1 00        nop     
6ec2 00        nop     
6ec3 00        nop     
6ec4 00        nop     
6ec5 00        nop     
6ec6 00        nop     
6ec7 00        nop     
6ec8 00        nop     
6ec9 00        nop     
6eca 00        nop     
6ecb 00        nop     
6ecc 00        nop     
6ecd 00        nop     
6ece 00        nop     
6ecf 00        nop     
6ed0 00        nop     
6ed1 00        nop     
6ed2 00        nop     
6ed3 00        nop     
6ed4 00        nop     
6ed5 00        nop     
6ed6 00        nop     
6ed7 00        nop     
6ed8 00        nop     
6ed9 00        nop     
6eda 00        nop     
6edb 00        nop     
6edc 00        nop     
6edd 00        nop     
6ede 00        nop     
6edf 00        nop     
6ee0 00        nop     
6ee1 00        nop     
6ee2 00        nop     
6ee3 00        nop     
6ee4 00        nop     
6ee5 00        nop     
6ee6 00        nop     
6ee7 00        nop     
6ee8 00        nop     
6ee9 00        nop     
6eea 00        nop     
6eeb 00        nop     
6eec 00        nop     
6eed 00        nop     
6eee 00        nop     
6eef 00        nop     
6ef0 00        nop     
6ef1 00        nop     
6ef2 00        nop     
6ef3 00        nop     
6ef4 00        nop     
6ef5 00        nop     
6ef6 00        nop     
6ef7 00        nop     
6ef8 00        nop     
6ef9 00        nop     
6efa 00        nop     
6efb 00        nop     
6efc 00        nop     
6efd 00        nop     
6efe 00        nop     
6eff 00        nop     
6f00 00        nop     
6f01 00        nop     
6f02 00        nop     
6f03 00        nop     
6f04 00        nop     
6f05 00        nop     
6f06 00        nop     
6f07 00        nop     
6f08 00        nop     
6f09 00        nop     
6f0a 00        nop     
6f0b 00        nop     
6f0c 00        nop     
6f0d 00        nop     
6f0e 00        nop     
6f0f 00        nop     
6f10 00        nop     
6f11 00        nop     
6f12 00        nop     
6f13 00        nop     
6f14 00        nop     
6f15 00        nop     
6f16 00        nop     
6f17 00        nop     
6f18 00        nop     
6f19 00        nop     
6f1a 00        nop     
6f1b 00        nop     
6f1c 00        nop     
6f1d 00        nop     
6f1e 00        nop     
6f1f 00        nop     
6f20 00        nop     
6f21 00        nop     
6f22 00        nop     
6f23 00        nop     
6f24 00        nop     
6f25 00        nop     
6f26 00        nop     
6f27 00        nop     
6f28 00        nop     
6f29 00        nop     
6f2a 00        nop     
6f2b 00        nop     
6f2c 00        nop     
6f2d 00        nop     
6f2e 00        nop     
6f2f 00        nop     
6f30 00        nop     
6f31 00        nop     
6f32 00        nop     
6f33 00        nop     
6f34 00        nop     
6f35 00        nop     
6f36 00        nop     
6f37 00        nop     
6f38 00        nop     
6f39 00        nop     
6f3a 00        nop     
6f3b 00        nop     
6f3c 00        nop     
6f3d 00        nop     
6f3e 00        nop     
6f3f 00        nop     
6f40 00        nop     
6f41 00        nop     
6f42 00        nop     
6f43 00        nop     
6f44 00        nop     
6f45 00        nop     
6f46 00        nop     
6f47 00        nop     
6f48 00        nop     
6f49 00        nop     
6f4a 00        nop     
6f4b 00        nop     
6f4c 00        nop     
6f4d 00        nop     
6f4e 00        nop     
6f4f 00        nop     
6f50 00        nop     
6f51 00        nop     
6f52 00        nop     
6f53 00        nop     
6f54 00        nop     
6f55 00        nop     
6f56 00        nop     
6f57 00        nop     
6f58 00        nop     
6f59 00        nop     
6f5a 00        nop     
6f5b 00        nop     
6f5c 00        nop     
6f5d 00        nop     
6f5e 00        nop     
6f5f 00        nop     
6f60 00        nop     
6f61 00        nop     
6f62 00        nop     
6f63 00        nop     
6f64 00        nop     
6f65 00        nop     
6f66 00        nop     
6f67 00        nop     
6f68 00        nop     
6f69 00        nop     
6f6a 00        nop     
6f6b 00        nop     
6f6c 00        nop     
6f6d 00        nop     
6f6e 00        nop     
6f6f 00        nop     
6f70 00        nop     
6f71 00        nop     
6f72 00        nop     
6f73 00        nop     
6f74 00        nop     
6f75 00        nop     
6f76 00        nop     
6f77 00        nop     
6f78 00        nop     
6f79 00        nop     
6f7a 00        nop     
6f7b 00        nop     
6f7c 00        nop     
6f7d 00        nop     
6f7e 00        nop     
6f7f 00        nop     
6f80 00        nop     
6f81 00        nop     
6f82 00        nop     
6f83 00        nop     
6f84 00        nop     
6f85 00        nop     
6f86 00        nop     
6f87 00        nop     
6f88 00        nop     
6f89 00        nop     
6f8a 00        nop     
6f8b 00        nop     
6f8c 00        nop     
6f8d 00        nop     
6f8e 00        nop     
6f8f 00        nop     
6f90 90        sub     b
6f91 6f        ld      l,a
6f92 00        nop     
6f93 00        nop     
6f94 00        nop     
6f95 00        nop     
6f96 cd005c    call    $5c00
6f99 b7        or      a
6f9a c8        ret     z

6f9b cd2f03    call    $032f
6f9e cd6203    call    $0362
6fa1 1611      ld      d,$11
6fa3 1e01      ld      e,$01
6fa5 cd9504    call    $0495
6fa8 063e      ld      b,$3e
6faa 211578    ld      hl,$7815
6fad cd1a02    call    $021a
6fb0 77        ld      (hl),a
6fb1 23        inc     hl
6fb2 cd2103    call    $0321
6fb5 10f6      djnz    $6fad
6fb7 3624      ld      (hl),$24
6fb9 dd211578  ld      ix,$7815
6fbd cd9a3f    call    $3f9a
6fc0 3e08      ld      a,$08
6fc2 cdfc89    call    $89fc
6fc5 cde989    call    $89e9
6fc8 21d971    ld      hl,$71d9
6fcb cda88d    call    $8da8
6fce 97        sub     a
6fcf cd9b03    call    $039b
6fd2 21e271    ld      hl,$71e2
6fd5 cda88d    call    $8da8
6fd8 3ed0      ld      a,$d0
6fda 0e02      ld      c,$02
6fdc 1e20      ld      e,$20
6fde cd4790    call    $9047
6fe1 cde989    call    $89e9
6fe4 cd3071    call    $7130
6fe7 dad270    jp      c,$70d2
6fea 3e16      ld      a,$16
6fec cdfc89    call    $89fc
6fef cde989    call    $89e9
6ff2 21e971    ld      hl,$71e9
6ff5 cda88d    call    $8da8
6ff8 97        sub     a
6ff9 cd9b03    call    $039b
6ffc 21f271    ld      hl,$71f2
6fff cda88d    call    $8da8
7002 3e02      ld      a,$02
7004 cd9b03    call    $039b
7007 21f671    ld      hl,$71f6
700a cda88d    call    $8da8
700d cdb171    call    $71b1
7010 dad270    jp      c,$70d2
7013 225478    ld      ($7854),hl
7016 1645      ld      d,$45
7018 1e01      ld      e,$01
701a cd9504    call    $0495
701d 97        sub     a
701e cd9b03    call    $039b
7021 110672    ld      de,$7206
7024 0e09      ld      c,$09
7026 cd0500    call    $0005
7029 cdc971    call    $71c9
702c 3e21      ld      a,$21
702e cdfc89    call    $89fc
7031 cde989    call    $89e9
7034 210d72    ld      hl,$720d
7037 cda88d    call    $8da8
703a cd9371    call    $7193
703d dad270    jp      c,$70d2
7040 dd212372  ld      ix,$7223
7044 cdf73e    call    $3ef7
7047 cd7d34    call    $347d
704a 2008      jr      nz,$7054
704c 113072    ld      de,$7230
704f 0e09      ld      c,$09
7051 cd0500    call    $0005
7054 cd7f8d    call    $8d7f
7057 cd5c58    call    $585c
705a 305f      jr      nc,$70bb
705c cde670    call    $70e6
705f cdc971    call    $71c9
7062 cdf770    call    $70f7
7065 cd0c3a    call    $3a0c
7068 cd7d34    call    $347d
706b 200c      jr      nz,$7079
706d cd0671    call    $7106
7070 385d      jr      c,$70cf
7072 cddb70    call    $70db
7075 284d      jr      z,$70c4
7077 18db      jr      $7054
7079 cdae86    call    $86ae
707c cd4f7d    call    $7d4f
707f cd3c86    call    $863c
7082 cd8402    call    $0284
7085 3e21      ld      a,$21
7087 cdfc89    call    $89fc
708a cde989    call    $89e9
708d 213e72    ld      hl,$723e
7090 cda88d    call    $8da8
7093 11d870    ld      de,$70d8
7096 0e09      ld      c,$09
7098 cd0500    call    $0005
709b cd2803    call    $0328
709e cd2803    call    $0328
70a1 cd5571    call    $7155
70a4 3829      jr      c,$70cf
70a6 fe4e      cp      $4e
70a8 280a      jr      z,$70b4
70aa fe59      cp      $59
70ac c48d34    call    nz,$348d
70af cd0671    call    $7106
70b2 381b      jr      c,$70cf
70b4 cddb70    call    $70db
70b7 280b      jr      z,$70c4
70b9 1885      jr      $7040
70bb cd0c3a    call    $3a0c
70be cd928d    call    $8d92
70c1 cde25e    call    $5ee2
70c4 3e20      ld      a,$20
70c6 cdfc89    call    $89fc
70c9 cde989    call    $89e9
70cc cd7402    call    $0274
70cf cdae86    call    $86ae
70d2 cd1b04    call    $041b
70d5 c35003    jp      $0350
70d8 2020      jr      nz,$70fa
70da 24        inc     h
70db dd215478  ld      ix,$7854
70df dd7e00    ld      a,(ix+$00)
70e2 ddb601    or      (ix+$01)
70e5 c9        ret     

70e6 dd215478  ld      ix,$7854
70ea dd7e00    ld      a,(ix+$00)
70ed b7        or      a
70ee 2003      jr      nz,$70f3
70f0 dd3501    dec     (ix+$01)
70f3 dd3500    dec     (ix+$00)
70f6 c9        ret     

70f7 d5        push    de
70f8 e5        push    hl
70f9 cd6599    call    $9965
70fc fd215778  ld      iy,$7857
7100 cdda8e    call    $8eda
7103 e1        pop     hl
7104 d1        pop     de
7105 c9        ret     

7106 c5        push    bc
7107 fde5      push    iy
7109 fd215778  ld      iy,$7857
710d cde78e    call    $8ee7
7110 d5        push    de
7111 e5        push    hl
7112 cd6599    call    $9965
7115 cdda8e    call    $8eda
7118 e1        pop     hl
7119 d1        pop     de
711a cd8338    call    $3883
711d 11e977    ld      de,$77e9
7120 3a5678    ld      a,($7856)
7123 4f        ld      c,a
7124 0600      ld      b,$00
7126 cdf096    call    $96f0
7129 cd2694    call    $9426
712c fde1      pop     iy
712e c1        pop     bc
712f c9        ret     

7130 e5        push    hl
7131 dde5      push    ix
7133 cd5003    call    $0350
7136 3e04      ld      a,$04
7138 cd9b03    call    $039b
713b dd2168b4  ld      ix,$b468
713f 21e977    ld      hl,$77e9
7142 cd3282    call    $8232
7145 3807      jr      c,$714e
7147 3624      ld      (hl),$24
7149 78        ld      a,b
714a 325678    ld      ($7856),a
714d b7        or      a
714e cd6203    call    $0362
7151 dde1      pop     ix
7153 e1        pop     hl
7154 c9        ret     

7155 dde5      push    ix
7157 cd5003    call    $0350
715a cd5402    call    $0254
715d dd21e8b4  ld      ix,$b4e8
7161 218d71    ld      hl,$718d
7164 cd9f81    call    $819f
7167 381e      jr      c,$7187
7169 fe4f      cp      $4f
716b 2006      jr      nz,$7173
716d dd211578  ld      ix,$7815
7171 1808      jr      $717b
7173 fe52      cp      $52
7175 200f      jr      nz,$7186
7177 dd21e977  ld      ix,$77e9
717b cd9a3f    call    $3f9a
717e cd338a    call    $8a33
7181 cd338a    call    $8a33
7184 18d7      jr      $715d
7186 b7        or      a
7187 cd6203    call    $0362
718a dde1      pop     ix
718c c9        ret     

718d 59        ld      e,c
718e 4e        ld      c,(hl)
718f 43        ld      b,e
7190 4f        ld      c,a
7191 52        ld      d,d
7192 00        nop     
7193 cd5003    call    $0350
7196 cd7d80    call    $807d
7199 dd210ab6  ld      ix,$b60a
719d 21ae71    ld      hl,$71ae
71a0 cddc81    call    $81dc
71a3 3806      jr      c,$71ab
71a5 cc8d34    call    z,$348d
71a8 c48534    call    nz,$3485
71ab c36203    jp      $0362
71ae 59        ld      e,c
71af 4e        ld      c,(hl)
71b0 00        nop     
71b1 cd5003    call    $0350
71b4 3e05      ld      a,$05
71b6 dd21a5b6  ld      ix,$b6a5
71ba cdae80    call    $80ae
71bd d8        ret     c

71be 7c        ld      a,h
71bf b5        or      l
71c0 2003      jr      nz,$71c5
71c2 21ff7f    ld      hl,$7fff
71c5 b7        or      a
71c6 c36203    jp      $0362
71c9 c5        push    bc
71ca d5        push    de
71cb ed4b5478  ld      bc,($7854)
71cf 164b      ld      d,$4b
71d1 1e01      ld      e,$01
71d3 cd9982    call    $8299
71d6 d1        pop     de
71d7 c1        pop     bc
71d8 c9        ret     

71d9 6f        ld      l,a
71da 6c        ld      l,h
71db 64        ld      h,h
71dc 2074      jr      nz,$7252
71de 65        ld      h,l
71df 78        ld      a,b
71e0 74        ld      (hl),h
71e1 24        inc     h
71e2 2077      jr      nz,$725b
71e4 69        ld      l,c
71e5 74        ld      (hl),h
71e6 68        ld      l,b
71e7 2024      jr      nz,$720d
71e9 6e        ld      l,(hl)
71ea 65        ld      h,l
71eb 77        ld      (hl),a
71ec 2074      jr      nz,$7262
71ee 65        ld      h,l
71ef 78        ld      a,b
71f0 74        ld      (hl),h
71f1 24        inc     h
71f2 2e20      ld      l,$20
71f4 2024      jr      nz,$721a
71f6 48        ld      c,b
71f7 6f        ld      l,a
71f8 77        ld      (hl),a
71f9 206d      jr      nz,$7268
71fb 61        ld      h,c
71fc 6e        ld      l,(hl)
71fd 79        ld      a,c
71fe 2074      jr      nz,$7274
7200 69        ld      l,c
7201 6d        ld      l,l
7202 65        ld      h,l
7203 73        ld      (hl),e
7204 3f        ccf     
7205 24        inc     h
7206 43        ld      b,e
7207 4f        ld      c,a
7208 55        ld      d,l
7209 4e        ld      c,(hl)
720a 54        ld      d,h
720b 3a2443    ld      a,($4324)
720e 6f        ld      l,a
720f 6e        ld      l,(hl)
7210 66        ld      h,(hl)
7211 69        ld      l,c
7212 72        ld      (hl),d
7213 6d        ld      l,l
7214 2072      jr      nz,$7288
7216 65        ld      h,l
7217 70        ld      (hl),b
7218 6c        ld      l,h
7219 61        ld      h,c
721a 63        ld      h,e
721b 65        ld      h,l
721c 6d        ld      l,l
721d 65        ld      h,l
721e 6e        ld      l,(hl)
721f 74        ld      (hl),h
7220 73        ld      (hl),e
7221 3f        ccf     
7222 24        inc     h
7223 53        ld      d,e
7224 65        ld      h,l
7225 61        ld      h,c
7226 72        ld      (hl),d
7227 63        ld      h,e
7228 68        ld      l,b
7229 69        ld      l,c
722a 6e        ld      l,(hl)
722b 67        ld      h,a
722c 2e2e      ld      l,$2e
722e 2e24      ld      l,$24
7230 61        ld      h,c
7231 6e        ld      l,(hl)
7232 64        ld      h,h
7233 2072      jr      nz,$72a7
7235 65        ld      h,l
7236 70        ld      (hl),b
7237 6c        ld      l,h
7238 61        ld      h,c
7239 63        ld      h,e
723a 69        ld      l,c
723b 6e        ld      l,(hl)
723c 67        ld      h,a
723d 24        inc     h
723e 54        ld      d,h
723f 65        ld      h,l
7240 78        ld      a,b
7241 74        ld      (hl),h
7242 2066      jr      nz,$72aa
7244 6f        ld      l,a
7245 75        ld      (hl),l
7246 6e        ld      l,(hl)
7247 64        ld      h,h
7248 2e20      ld      l,$20
724a 52        ld      d,d
724b 65        ld      h,l
724c 70        ld      (hl),b
724d 6c        ld      l,h
724e 61        ld      h,c
724f 63        ld      h,e
7250 65        ld      h,l
7251 3f        ccf     
7252 24        inc     h
7253 c5        push    bc
7254 d5        push    de
7255 dde5      push    ix
7257 fde5      push    iy
7259 221e74    ld      ($741e),hl
725c cd4573    call    $7345
725f cdeb72    call    $72eb
7262 387f      jr      c,$72e3
7264 222074    ld      ($7420),hl
7267 e5        push    hl
7268 dde1      pop     ix
726a dd23      inc     ix
726c cd4573    call    $7345
726f cdeb72    call    $72eb
7272 3842      jr      c,$72b6
7274 e5        push    hl
7275 fde1      pop     iy
7277 fd23      inc     iy
7279 06ff      ld      b,$ff
727b d5        push    de
727c 1600      ld      d,$00
727e cdf772    call    $72f7
7281 d1        pop     de
7282 282d      jr      z,$72b1
7284 382b      jr      c,$72b1
7286 212f74    ld      hl,$742f
7289 cd5473    call    $7354
728c 36ff      ld      (hl),$ff
728e 212274    ld      hl,$7422
7291 fde5      push    iy
7293 dde1      pop     ix
7295 cd5473    call    $7354
7298 36ff      ld      (hl),$ff
729a dde5      push    ix
729c e1        pop     hl
729d dd212f74  ld      ix,$742f
72a1 cd5473    call    $7354
72a4 36ff      ld      (hl),$ff
72a6 222074    ld      ($7420),hl
72a9 23        inc     hl
72aa dd212274  ld      ix,$7422
72ae cd5473    call    $7354
72b1 2a2074    ld      hl,($7420)
72b4 18a6      jr      $725c
72b6 62        ld      h,d
72b7 6b        ld      l,e
72b8 cd5473    call    $7354
72bb 36ff      ld      (hl),$ff
72bd 23        inc     hl
72be 54        ld      d,h
72bf 5d        ld      e,l
72c0 dde5      push    ix
72c2 e1        pop     hl
72c3 3600      ld      (hl),$00
72c5 23        inc     hl
72c6 7e        ld      a,(hl)
72c7 feff      cp      $ff
72c9 20f8      jr      nz,$72c3
72cb ed4b1e74  ld      bc,($741e)
72cf 7c        ld      a,h
72d0 b8        cp      b
72d1 2002      jr      nz,$72d5
72d3 7d        ld      a,l
72d4 b9        cp      c
72d5 2805      jr      z,$72dc
72d7 2a1e74    ld      hl,($741e)
72da 1880      jr      $725c
72dc 62        ld      h,d
72dd 6b        ld      l,e
72de 3600      ld      (hl),$00
72e0 b7        or      a
72e1 1801      jr      $72e4
72e3 37        scf     
72e4 fde1      pop     iy
72e6 dde1      pop     ix
72e8 d1        pop     de
72e9 c1        pop     bc
72ea c9        ret     

72eb e5        push    hl
72ec 23        inc     hl
72ed 7e        ld      a,(hl)
72ee b7        or      a
72ef 2803      jr      z,$72f4
72f1 b7        or      a
72f2 1801      jr      $72f5
72f4 37        scf     
72f5 e1        pop     hl
72f6 c9        ret     

72f7 dde5      push    ix
72f9 fde5      push    iy
72fb c5        push    bc
72fc dd7e00    ld      a,(ix+$00)
72ff dd23      inc     ix
7301 b8        cp      b
7302 2823      jr      z,$7327
7304 15        dec     d
7305 ccac90    call    z,$90ac
7308 14        inc     d
7309 4f        ld      c,a
730a fd7e00    ld      a,(iy+$00)
730d fd23      inc     iy
730f b8        cp      b
7310 280f      jr      z,$7321
7312 15        dec     d
7313 ccac90    call    z,$90ac
7316 14        inc     d
7317 b9        cp      c
7318 3807      jr      c,$7321
731a 28e0      jr      z,$72fc
731c 3e01      ld      a,$01
731e b7        or      a
731f 1811      jr      $7332
7321 3e01      ld      a,$01
7323 b7        or      a
7324 37        scf     
7325 180b      jr      $7332
7327 4f        ld      c,a
7328 fd7e00    ld      a,(iy+$00)
732b fd23      inc     iy
732d b8        cp      b
732e 20ec      jr      nz,$731c
7330 af        xor     a
7331 b7        or      a
7332 c1        pop     bc
7333 fde1      pop     iy
7335 dde1      pop     ix
7337 c9        ret     

7338 dd7e00    ld      a,(ix+$00)
733b b7        or      a
733c 2806      jr      z,$7344
733e dd23      inc     ix
7340 feff      cp      $ff
7342 20f4      jr      nz,$7338
7344 c9        ret     

7345 7e        ld      a,(hl)
7346 feff      cp      $ff
7348 2803      jr      z,$734d
734a 2b        dec     hl
734b 18f8      jr      $7345
734d 2b        dec     hl
734e 7e        ld      a,(hl)
734f feff      cp      $ff
7351 20fa      jr      nz,$734d
7353 c9        ret     

7354 f5        push    af
7355 dde5      push    ix
7357 dd7e00    ld      a,(ix+$00)
735a dd23      inc     ix
735c feff      cp      $ff
735e 2805      jr      z,$7365
7360 77        ld      (hl),a
7361 23        inc     hl
7362 0c        inc     c
7363 18f2      jr      $7357
7365 dde1      pop     ix
7367 f1        pop     af
7368 c9        ret     

7369 c5        push    bc
736a d5        push    de
736b e5        push    hl
736c dde5      push    ix
736e c5        push    bc
736f c5        push    bc
7370 dde5      push    ix
7372 e1        pop     hl
7373 01ff00    ld      bc,$00ff
7376 97        sub     a
7377 edb1      cpir    
7379 2b        dec     hl
737a 22db73    ld      ($73db),hl
737d c1        pop     bc
737e 04        inc     b
737f 78        ld      a,b
7380 cd8d90    call    $908d
7383 7c        ld      a,h
7384 ba        cp      d
7385 2002      jr      nz,$7389
7387 7d        ld      a,l
7388 bb        cp      e
7389 3048      jr      nc,$73d3
738b 22dd73    ld      ($73dd),hl
738e 06ff      ld      b,$ff
7390 3e01      ld      a,$01
7392 323c74    ld      ($743c),a
7395 dd7e00    ld      a,(ix+$00)
7398 b7        or      a
7399 2812      jr      z,$73ad
739b b7        or      a
739c cdf772    call    $72f7
739f 380c      jr      c,$73ad
73a1 cd3873    call    $7338
73a4 3a3c74    ld      a,($743c)
73a7 3c        inc     a
73a8 323c74    ld      ($743c),a
73ab 18e8      jr      $7395
73ad 2adb73    ld      hl,($73db)
73b0 e5        push    hl
73b1 23        inc     hl
73b2 dde5      push    ix
73b4 c1        pop     bc
73b5 b7        or      a
73b6 ed42      sbc     hl,bc
73b8 44        ld      b,h
73b9 4d        ld      c,l
73ba e1        pop     hl
73bb ed5bdd73  ld      de,($73dd)
73bf edb8      lddr    
73c1 c1        pop     bc
73c2 48        ld      c,b
73c3 0600      ld      b,$00
73c5 dde5      push    ix
73c7 d1        pop     de
73c8 fde5      push    iy
73ca e1        pop     hl
73cb edb0      ldir    
73cd 3eff      ld      a,$ff
73cf 12        ld      (de),a
73d0 b7        or      a
73d1 1802      jr      $73d5
73d3 c1        pop     bc
73d4 37        scf     
73d5 dde1      pop     ix
73d7 e1        pop     hl
73d8 d1        pop     de
73d9 c1        pop     bc
73da c9        ret     

73db 00        nop     
73dc 00        nop     
73dd 00        nop     
73de 00        nop     
73df c5        push    bc
73e0 d5        push    de
73e1 e5        push    hl
73e2 dde5      push    ix
73e4 cd4789    call    $8947
73e7 fe02      cp      $02
73e9 282c      jr      z,$7417
73eb 4f        ld      c,a
73ec 5d        ld      e,l
73ed 54        ld      d,h
73ee 78        ld      a,b
73ef cd8d90    call    $908d
73f2 7e        ld      a,(hl)
73f3 feff      cp      $ff
73f5 280a      jr      z,$7401
73f7 79        ld      a,c
73f8 b7        or      a
73f9 281c      jr      z,$7417
73fb 23        inc     hl
73fc e5        push    hl
73fd dde1      pop     ix
73ff 18e3      jr      $73e4
7401 23        inc     hl
7402 e5        push    hl
7403 010000    ld      bc,$0000
7406 3e00      ld      a,$00
7408 edb1      cpir    
740a 78        ld      a,b
740b 2f        cpl     
740c 47        ld      b,a
740d 79        ld      a,c
740e 2f        cpl     
740f 4f        ld      c,a
7410 03        inc     bc
7411 e1        pop     hl
7412 edb0      ldir    
7414 b7        or      a
7415 1801      jr      $7418
7417 37        scf     
7418 dde1      pop     ix
741a e1        pop     hl
741b d1        pop     de
741c c1        pop     bc
741d c9        ret     

741e 00        nop     
741f 00        nop     
7420 00        nop     
7421 00        nop     
7422 00        nop     
7423 00        nop     
7424 00        nop     
7425 00        nop     
7426 00        nop     
7427 00        nop     
7428 00        nop     
7429 00        nop     
742a 00        nop     
742b 00        nop     
742c 00        nop     
742d 00        nop     
742e 00        nop     
742f 00        nop     
7430 00        nop     
7431 00        nop     
7432 00        nop     
7433 00        nop     
7434 00        nop     
7435 00        nop     
7436 00        nop     
7437 00        nop     
7438 00        nop     
7439 00        nop     
743a 00        nop     
743b 00        nop     
743c 00        nop     
743d cdd38c    call    $8cd3
7440 97        sub     a
7441 328275    ld      ($7582),a
7444 214d75    ld      hl,$754d
7447 cd5a74    call    $745a
744a c9        ret     

744b cdd38c    call    $8cd3
744e 3e01      ld      a,$01
7450 328275    ld      ($7582),a
7453 215f75    ld      hl,$755f
7456 cd5a74    call    $745a
7459 c9        ret     

745a cd6203    call    $0362
745d cd1b04    call    $041b
7460 cda88d    call    $8da8
7463 04        inc     b
7464 78        ld      a,b
7465 328075    ld      ($7580),a
7468 3a8175    ld      a,($7581)
746b f630      or      $30
746d cd4583    call    $8345
7470 cd008a    call    $8a00
7473 cd6b80    call    $806b
7476 2033      jr      nz,$74ab
7478 3a8175    ld      a,($7581)
747b b7        or      a
747c 28f5      jr      z,$7473
747e d609      sub     $09
7480 ed44      neg     
7482 c4f33f    call    nz,$3ff3
7485 cd6b80    call    $806b
7488 2021      jr      nz,$74ab
748a 3a8275    ld      a,($7582)
748d b7        or      a
748e 280e      jr      z,$749e
7490 cd5c3c    call    $3c5c
7493 cd4f7d    call    $7d4f
7496 fe01      cp      $01
7498 20d9      jr      nz,$7473
749a 97        sub     a
749b c32775    jp      $7527
749e cd3c3c    call    $3c3c
74a1 cd4f7d    call    $7d4f
74a4 fe01      cp      $01
74a6 20cb      jr      nz,$7473
74a8 97        sub     a
74a9 187c      jr      $7527
74ab 213975    ld      hl,$7539
74ae dd2156d4  ld      ix,$d456
74b2 cd8e81    call    $818e
74b5 387e      jr      c,$7535
74b7 f5        push    af
74b8 cd4f7d    call    $7d4f
74bb cde989    call    $89e9
74be f1        pop     af
74bf cdd090    call    $90d0
74c2 3863      jr      c,$7527
74c4 78        ld      a,b
74c5 80        add     a,b
74c6 010000    ld      bc,$0000
74c9 4f        ld      c,a
74ca dd214775  ld      ix,$7547
74ce dd09      add     ix,bc
74d0 dd6e00    ld      l,(ix+$00)
74d3 dd6601    ld      h,(ix+$01)
74d6 e9        jp      (hl)
74d7 cde989    call    $89e9
74da 3a8075    ld      a,($7580)
74dd 47        ld      b,a
74de cdd38c    call    $8cd3
74e1 217275    ld      hl,$7572
74e4 cda88d    call    $8da8
74e7 78        ld      a,b
74e8 328075    ld      ($7580),a
74eb 3e04      ld      a,$04
74ed cdf33f    call    $3ff3
74f0 3a8075    ld      a,($7580)
74f3 47        ld      b,a
74f4 cdd38c    call    $8cd3
74f7 3a8275    ld      a,($7582)
74fa b7        or      a
74fb 2806      jr      z,$7503
74fd 215f75    ld      hl,$755f
7500 c36074    jp      $7460
7503 214d75    ld      hl,$754d
7506 c36074    jp      $7460
7509 3e01      ld      a,$01
750b 328275    ld      ($7582),a
750e 215f75    ld      hl,$755f
7511 1807      jr      $751a
7513 97        sub     a
7514 328275    ld      ($7582),a
7517 214d75    ld      hl,$754d
751a cde989    call    $89e9
751d 3a8075    ld      a,($7580)
7520 47        ld      b,a
7521 cdd38c    call    $8cd3
7524 c36074    jp      $7460
7527 e60f      and     $0f
7529 328175    ld      ($7581),a
752c cde989    call    $89e9
752f cd338a    call    $8a33
7532 c36874    jp      $7468
7535 cd5003    call    $0350
7538 c9        ret     

7539 df        rst     $18
753a 0b        dec     bc
753b 0a        ld      a,(bc)
753c 313233    ld      sp,$3332
753f 34        inc     (hl)
7540 35        dec     (hl)
7541 3637      ld      (hl),$37
7543 3839      jr      c,$757e
7545 3000      jr      nc,$7547
7547 d7        rst     $10
7548 74        ld      (hl),h
7549 09        add     hl,bc
754a 75        ld      (hl),l
754b 13        inc     de
754c 75        ld      (hl),l
754d 46        ld      b,(hl)
754e 4f        ld      c,a
754f 52        ld      d,d
7550 57        ld      d,a
7551 41        ld      b,c
7552 52        ld      d,d
7553 44        ld      b,h
7554 2061      jr      nz,$75b7
7556 74        ld      (hl),h
7557 2073      jr      nz,$75cc
7559 70        ld      (hl),b
755a 65        ld      h,l
755b 65        ld      h,l
755c 64        ld      h,h
755d 2024      jr      nz,$7583
755f 42        ld      b,d
7560 41        ld      b,c
7561 43        ld      b,e
7562 4b        ld      c,e
7563 57        ld      d,a
7564 41        ld      b,c
7565 52        ld      d,d
7566 44        ld      b,h
7567 2061      jr      nz,$75ca
7569 74        ld      (hl),h
756a 2073      jr      nz,$75df
756c 70        ld      (hl),b
756d 65        ld      h,l
756e 65        ld      h,l
756f 64        ld      h,h
7570 2024      jr      nz,$7596
7572 2e2e      ld      l,$2e
7574 2e50      ld      l,$50
7576 41        ld      b,c
7577 55        ld      d,l
7578 53        ld      d,e
7579 49        ld      c,c
757a 4e        ld      c,(hl)
757b 47        ld      b,a
757c 2e2e      ld      l,$2e
757e 2e24      ld      l,$24
7580 00        nop     
7581 05        dec     b
7582 00        nop     
7583 f5        push    af
7584 d5        push    de
7585 e5        push    hl
7586 fef0      cp      $f0
7588 282b      jr      z,$75b5
758a 5f        ld      e,a
758b 3ad677    ld      a,($77d6)
758e 57        ld      d,a
758f 7b        ld      a,e
7590 21d777    ld      hl,$77d7
7593 cd1e82    call    $821e
7596 2809      jr      z,$75a1
7598 ba        cp      d
7599 281a      jr      z,$75b5
759b 7b        ld      a,e
759c cd7a76    call    $767a
759f 1811      jr      $75b2
75a1 7b        ld      a,e
75a2 cde290    call    $90e2
75a5 3803      jr      c,$75aa
75a7 97        sub     a
75a8 18f2      jr      $759c
75aa 7a        ld      a,d
75ab cd1e82    call    $821e
75ae c47a76    call    nz,$767a
75b1 7b        ld      a,e
75b2 32d677    ld      ($77d6),a
75b5 e1        pop     hl
75b6 d1        pop     de
75b7 f1        pop     af
75b8 c9        ret     

75b9 f5        push    af
75ba e5        push    hl
75bb 3ad677    ld      a,($77d6)
75be b7        or      a
75bf 2814      jr      z,$75d5
75c1 2a1d9a    ld      hl,($9a1d)
75c4 7e        ld      a,(hl)
75c5 23        inc     hl
75c6 fea0      cp      $a0
75c8 2808      jr      z,$75d2
75ca fead      cp      $ad
75cc 2804      jr      z,$75d2
75ce cb7f      bit     7,a
75d0 20f2      jr      nz,$75c4
75d2 cd1676    call    $7616
75d5 e1        pop     hl
75d6 f1        pop     af
75d7 c9        ret     

75d8 f5        push    af
75d9 fde5      push    iy
75db cd6599    call    $9965
75de fd211176  ld      iy,$7611
75e2 cdda8e    call    $8eda
75e5 cd3087    call    $8730
75e8 321576    ld      ($7615),a
75eb cdc993    call    $93c9
75ee fe01      cp      $01
75f0 280f      jr      z,$7601
75f2 cd1676    call    $7616
75f5 fe0d      cp      $0d
75f7 2808      jr      z,$7601
75f9 fe0a      cp      $0a
75fb 2804      jr      z,$7601
75fd fe0c      cp      $0c
75ff 20ea      jr      nz,$75eb
7601 cde78e    call    $8ee7
7604 cd0c3a    call    $3a0c
7607 3a1576    ld      a,($7615)
760a cd1687    call    $8716
760d fde1      pop     iy
760f f1        pop     af
7610 c9        ret     

7611 4c        ld      c,h
7612 01ec00    ld      bc,$00ec
7615 edf5      db      $ed, $f5         ; Undocumented 8 T-State NOP
7617 c5        push    bc
7618 d5        push    de
7619 e5        push    hl
761a dde5      push    ix
761c 4f        ld      c,a
761d 2aec79    ld      hl,($79ec)
7620 dd21ea79  ld      ix,$79ea
7624 7c        ld      a,h
7625 ddbe01    cp      (ix+$01)
7628 2004      jr      nz,$762e
762a 7d        ld      a,l
762b ddbe00    cp      (ix+$00)
762e 380f      jr      c,$763f
7630 79        ld      a,c
7631 77        ld      (hl),a
7632 21ea77    ld      hl,$77ea
7635 11e977    ld      de,$77e9
7638 010002    ld      bc,$0200
763b edb0      ldir    
763d 1806      jr      $7645
763f 79        ld      a,c
7640 77        ld      (hl),a
7641 23        inc     hl
7642 22ec79    ld      ($79ec),hl
7645 dde1      pop     ix
7647 e1        pop     hl
7648 d1        pop     de
7649 c1        pop     bc
764a f1        pop     af
764b c9        ret     

764c 3ad677    ld      a,($77d6)
764f b7        or      a
7650 2826      jr      z,$7678
7652 2aec79    ld      hl,($79ec)
7655 11e977    ld      de,$77e9
7658 b7        or      a
7659 ed52      sbc     hl,de
765b 281b      jr      z,$7678
765d 21d777    ld      hl,$77d7
7660 3ad677    ld      a,($77d6)
7663 cd1e82    call    $821e
7666 21dd77    ld      hl,$77dd
7669 78        ld      a,b
766a 80        add     a,b
766b cd8d90    call    $908d
766e e5        push    hl
766f dde1      pop     ix
7671 dd6e00    ld      l,(ix+$00)
7674 dd6601    ld      h,(ix+$01)
7677 e9        jp      (hl)
7678 37        scf     
7679 c9        ret     

767a 21e977    ld      hl,$77e9
767d 22ec79    ld      ($79ec),hl
7680 c9        ret     

7681 cda096    call    $96a0
7684 fd21d277  ld      iy,$77d2
7688 cd6599    call    $9965
768b cdda8e    call    $8eda
768e cd8009    call    $0980
7691 010100    ld      bc,$0001
7694 cd5f97    call    $975f
7697 ed5bec79  ld      de,($79ec)
769b 1b        dec     de
769c 21e877    ld      hl,$77e8
769f b7        or      a
76a0 ed52      sbc     hl,de
76a2 3023      jr      nc,$76c7
76a4 1a        ld      a,(de)
76a5 fe0d      cp      $0d
76a7 2808      jr      z,$76b1
76a9 fe0a      cp      $0a
76ab 2804      jr      z,$76b1
76ad fe0c      cp      $0c
76af 20ea      jr      nz,$769b
76b1 1b        dec     de
76b2 21e877    ld      hl,$77e8
76b5 b7        or      a
76b6 ed52      sbc     hl,de
76b8 300d      jr      nc,$76c7
76ba 1a        ld      a,(de)
76bb fe0d      cp      $0d
76bd 2808      jr      z,$76c7
76bf fe0a      cp      $0a
76c1 2804      jr      z,$76c7
76c3 fe0c      cp      $0c
76c5 20ea      jr      nz,$76b1
76c7 13        inc     de
76c8 42        ld      b,d
76c9 4b        ld      c,e
76ca 2aec79    ld      hl,($79ec)
76cd ed53ec79  ld      ($79ec),de
76d1 b7        or      a
76d2 ed42      sbc     hl,bc
76d4 44        ld      b,h
76d5 4d        ld      c,l
76d6 cdf096    call    $96f0
76d9 cde78e    call    $8ee7
76dc cd0c3a    call    $3a0c
76df cd6696    call    $9666
76e2 cdac0f    call    $0fac
76e5 cddc37    call    $37dc
76e8 cdd70e    call    $0ed7
76eb cd3c86    call    $863c
76ee cd9277    call    $7792
76f1 b7        or      a
76f2 c9        ret     

76f3 010000    ld      bc,$0000
76f6 ed5bec79  ld      de,($79ec)
76fa cd2977    call    $7729
76fd 3010      jr      nc,$770f
76ff 28f9      jr      z,$76fa
7701 cd2977    call    $7729
7704 3009      jr      nc,$770f
7706 20f9      jr      nz,$7701
7708 cd2977    call    $7729
770b 3002      jr      nc,$770f
770d 28f9      jr      z,$7708
770f 13        inc     de
7710 0b        dec     bc
7711 ed53ec79  ld      ($79ec),de
7715 d9        exx     
7716 cd6599    call    $9965
7719 d5        push    de
771a e5        push    hl
771b d9        exx     
771c cdf096    call    $96f0
771f e1        pop     hl
7720 d1        pop     de
7721 cd0c3a    call    $3a0c
7724 cd9277    call    $7792
7727 b7        or      a
7728 c9        ret     

7729 03        inc     bc
772a 1b        dec     de
772b 21e877    ld      hl,$77e8
772e b7        or      a
772f ed52      sbc     hl,de
7731 3005      jr      nc,$7738
7733 1a        ld      a,(de)
7734 cd110b    call    $0b11
7737 37        scf     
7738 c9        ret     

7739 ed5bec79  ld      de,($79ec)
773d 1b        dec     de
773e ed53ec79  ld      ($79ec),de
7742 1a        ld      a,(de)
7743 cdfc38    call    $38fc
7746 cd2694    call    $9426
7749 cd9277    call    $7792
774c b7        or      a
774d c9        ret     

774e ed5bec79  ld      de,($79ec)
7752 1b        dec     de
7753 ed53ec79  ld      ($79ec),de
7757 1a        ld      a,(de)
7758 f5        push    af
7759 cdfc38    call    $38fc
775c f1        pop     af
775d cd7a7f    call    $7f7a
7760 cd3c86    call    $863c
7763 cd9277    call    $7792
7766 b7        or      a
7767 c9        ret     

7768 fd21d277  ld      iy,$77d2
776c cd6599    call    $9965
776f cdda8e    call    $8eda
7772 01e977    ld      bc,$77e9
7775 50        ld      d,b
7776 59        ld      e,c
7777 2aec79    ld      hl,($79ec)
777a ed43ec79  ld      ($79ec),bc
777e 2b        dec     hl
777f b7        or      a
7780 ed42      sbc     hl,bc
7782 44        ld      b,h
7783 4d        ld      c,l
7784 cdf096    call    $96f0
7787 cde78e    call    $8ee7
778a cd0c3a    call    $3a0c
778d cd9277    call    $7792
7790 b7        or      a
7791 c9        ret     

7792 cd9f0e    call    $0e9f
7795 3005      jr      nc,$779c
7797 cd4f7d    call    $7d4f
779a 1812      jr      $77ae
779c cd340f    call    $0f34
779f cdb70e    call    $0eb7
77a2 cd540f    call    $0f54
77a5 cd040f    call    $0f04
77a8 cd3e0f    call    $0f3e
77ab cdd70e    call    $0ed7
77ae c9        ret     

77af cd3087    call    $8730
77b2 4f        ld      c,a
77b3 cd2694    call    $9426
77b6 cd4f87    call    $874f
77b9 dc4f7d    call    c,$7d4f
77bc cd3c86    call    $863c
77bf 2aec79    ld      hl,($79ec)
77c2 2b        dec     hl
77c3 22ec79    ld      ($79ec),hl
77c6 7e        ld      a,(hl)
77c7 cdda97    call    $97da
77ca cd7a7f    call    $7f7a
77cd cd2694    call    $9426
77d0 b7        or      a
77d1 c9        ret     

77d2 00        nop     
77d3 00        nop     
77d4 00        nop     
77d5 00        nop     
77d6 00        nop     
77d7 e0        ret     po

77d8 e27fe8    jp      po,$e87f
77db f1        pop     af
77dc 00        nop     
77dd 81        add     a,c
77de 76        halt    
77df 39        add     hl,sp
77e0 77        ld      (hl),a
77e1 4e        ld      c,(hl)
77e2 77        ld      (hl),a
77e3 68        ld      l,b
77e4 77        ld      (hl),a
77e5 f3        di      
77e6 76        halt    
77e7 af        xor     a
77e8 77        ld      (hl),a
77e9 00        nop     
77ea 00        nop     
77eb 00        nop     
77ec 00        nop     
77ed 00        nop     
77ee 00        nop     
77ef 00        nop     
77f0 00        nop     
77f1 00        nop     
77f2 00        nop     
77f3 00        nop     
77f4 00        nop     
77f5 00        nop     
77f6 00        nop     
77f7 00        nop     
77f8 00        nop     
77f9 00        nop     
77fa 00        nop     
77fb 00        nop     
77fc 00        nop     
77fd 00        nop     
77fe 00        nop     
77ff 00        nop     
7800 00        nop     
7801 00        nop     
7802 00        nop     
7803 00        nop     
7804 00        nop     
7805 00        nop     
7806 00        nop     
7807 00        nop     
7808 00        nop     
7809 00        nop     
780a 00        nop     
780b 00        nop     
780c 00        nop     
780d 00        nop     
780e 00        nop     
780f 00        nop     
7810 00        nop     
7811 00        nop     
7812 00        nop     
7813 00        nop     
7814 00        nop     
7815 00        nop     
7816 00        nop     
7817 00        nop     
7818 00        nop     
7819 00        nop     
781a 00        nop     
781b 00        nop     
781c 00        nop     
781d 00        nop     
781e 00        nop     
781f 00        nop     
7820 00        nop     
7821 00        nop     
7822 00        nop     
7823 00        nop     
7824 00        nop     
7825 00        nop     
7826 00        nop     
7827 00        nop     
7828 00        nop     
7829 00        nop     
782a 00        nop     
782b 00        nop     
782c 00        nop     
782d 00        nop     
782e 00        nop     
782f 00        nop     
7830 00        nop     
7831 00        nop     
7832 00        nop     
7833 00        nop     
7834 00        nop     
7835 00        nop     
7836 00        nop     
7837 00        nop     
7838 00        nop     
7839 00        nop     
783a 00        nop     
783b 00        nop     
783c 00        nop     
783d 00        nop     
783e 00        nop     
783f 00        nop     
7840 00        nop     
7841 00        nop     
7842 00        nop     
7843 00        nop     
7844 00        nop     
7845 00        nop     
7846 00        nop     
7847 00        nop     
7848 00        nop     
7849 00        nop     
784a 00        nop     
784b 00        nop     
784c 00        nop     
784d 00        nop     
784e 00        nop     
784f 00        nop     
7850 00        nop     
7851 00        nop     
7852 00        nop     
7853 00        nop     
7854 00        nop     
7855 00        nop     
7856 00        nop     
7857 00        nop     
7858 00        nop     
7859 00        nop     
785a 00        nop     
785b 00        nop     
785c 00        nop     
785d 00        nop     
785e 00        nop     
785f 00        nop     
7860 00        nop     
7861 00        nop     
7862 00        nop     
7863 00        nop     
7864 00        nop     
7865 00        nop     
7866 00        nop     
7867 00        nop     
7868 00        nop     
7869 00        nop     
786a 00        nop     
786b 00        nop     
786c 00        nop     
786d 00        nop     
786e 00        nop     
786f 00        nop     
7870 00        nop     
7871 00        nop     
7872 00        nop     
7873 00        nop     
7874 00        nop     
7875 00        nop     
7876 00        nop     
7877 00        nop     
7878 00        nop     
7879 00        nop     
787a 00        nop     
787b 00        nop     
787c 00        nop     
787d 00        nop     
787e 00        nop     
787f 00        nop     
7880 00        nop     
7881 00        nop     
7882 00        nop     
7883 00        nop     
7884 00        nop     
7885 00        nop     
7886 00        nop     
7887 00        nop     
7888 00        nop     
7889 00        nop     
788a 00        nop     
788b 00        nop     
788c 00        nop     
788d 00        nop     
788e 00        nop     
788f 00        nop     
7890 00        nop     
7891 00        nop     
7892 00        nop     
7893 00        nop     
7894 00        nop     
7895 00        nop     
7896 00        nop     
7897 00        nop     
7898 00        nop     
7899 00        nop     
789a 00        nop     
789b 00        nop     
789c 00        nop     
789d 00        nop     
789e 00        nop     
789f 00        nop     
78a0 00        nop     
78a1 00        nop     
78a2 00        nop     
78a3 00        nop     
78a4 00        nop     
78a5 00        nop     
78a6 00        nop     
78a7 00        nop     
78a8 00        nop     
78a9 00        nop     
78aa 00        nop     
78ab 00        nop     
78ac 00        nop     
78ad 00        nop     
78ae 00        nop     
78af 00        nop     
78b0 00        nop     
78b1 00        nop     
78b2 00        nop     
78b3 00        nop     
78b4 00        nop     
78b5 00        nop     
78b6 00        nop     
78b7 00        nop     
78b8 00        nop     
78b9 00        nop     
78ba 00        nop     
78bb 00        nop     
78bc 00        nop     
78bd 00        nop     
78be 00        nop     
78bf 00        nop     
78c0 00        nop     
78c1 00        nop     
78c2 00        nop     
78c3 00        nop     
78c4 00        nop     
78c5 00        nop     
78c6 00        nop     
78c7 00        nop     
78c8 00        nop     
78c9 00        nop     
78ca 00        nop     
78cb 00        nop     
78cc 00        nop     
78cd 00        nop     
78ce 00        nop     
78cf 00        nop     
78d0 00        nop     
78d1 00        nop     
78d2 00        nop     
78d3 00        nop     
78d4 00        nop     
78d5 00        nop     
78d6 00        nop     
78d7 00        nop     
78d8 00        nop     
78d9 00        nop     
78da 00        nop     
78db 00        nop     
78dc 00        nop     
78dd 00        nop     
78de 00        nop     
78df 00        nop     
78e0 00        nop     
78e1 00        nop     
78e2 00        nop     
78e3 00        nop     
78e4 00        nop     
78e5 00        nop     
78e6 00        nop     
78e7 00        nop     
78e8 00        nop     
78e9 00        nop     
78ea 00        nop     
78eb 00        nop     
78ec 00        nop     
78ed 00        nop     
78ee 00        nop     
78ef 00        nop     
78f0 00        nop     
78f1 00        nop     
78f2 00        nop     
78f3 00        nop     
78f4 00        nop     
78f5 00        nop     
78f6 00        nop     
78f7 00        nop     
78f8 00        nop     
78f9 00        nop     
78fa 00        nop     
78fb 00        nop     
78fc 00        nop     
78fd 00        nop     
78fe 00        nop     
78ff 00        nop     
7900 00        nop     
7901 00        nop     
7902 00        nop     
7903 00        nop     
7904 00        nop     
7905 00        nop     
7906 00        nop     
7907 00        nop     
7908 00        nop     
7909 00        nop     
790a 00        nop     
790b 00        nop     
790c 00        nop     
790d 00        nop     
790e 00        nop     
790f 00        nop     
7910 00        nop     
7911 00        nop     
7912 00        nop     
7913 00        nop     
7914 00        nop     
7915 00        nop     
7916 00        nop     
7917 00        nop     
7918 00        nop     
7919 00        nop     
791a 00        nop     
791b 00        nop     
791c 00        nop     
791d 00        nop     
791e 00        nop     
791f 00        nop     
7920 00        nop     
7921 00        nop     
7922 00        nop     
7923 00        nop     
7924 00        nop     
7925 00        nop     
7926 00        nop     
7927 00        nop     
7928 00        nop     
7929 00        nop     
792a 00        nop     
792b 00        nop     
792c 00        nop     
792d 00        nop     
792e 00        nop     
792f 00        nop     
7930 00        nop     
7931 00        nop     
7932 00        nop     
7933 00        nop     
7934 00        nop     
7935 00        nop     
7936 00        nop     
7937 00        nop     
7938 00        nop     
7939 00        nop     
793a 00        nop     
793b 00        nop     
793c 00        nop     
793d 00        nop     
793e 00        nop     
793f 00        nop     
7940 00        nop     
7941 00        nop     
7942 00        nop     
7943 00        nop     
7944 00        nop     
7945 00        nop     
7946 00        nop     
7947 00        nop     
7948 00        nop     
7949 00        nop     
794a 00        nop     
794b 00        nop     
794c 00        nop     
794d 00        nop     
794e 00        nop     
794f 00        nop     
7950 00        nop     
7951 00        nop     
7952 00        nop     
7953 00        nop     
7954 00        nop     
7955 00        nop     
7956 00        nop     
7957 00        nop     
7958 00        nop     
7959 00        nop     
795a 00        nop     
795b 00        nop     
795c 00        nop     
795d 00        nop     
795e 00        nop     
795f 00        nop     
7960 00        nop     
7961 00        nop     
7962 00        nop     
7963 00        nop     
7964 00        nop     
7965 00        nop     
7966 00        nop     
7967 00        nop     
7968 00        nop     
7969 00        nop     
796a 00        nop     
796b 00        nop     
796c 00        nop     
796d 00        nop     
796e 00        nop     
796f 00        nop     
7970 00        nop     
7971 00        nop     
7972 00        nop     
7973 00        nop     
7974 00        nop     
7975 00        nop     
7976 00        nop     
7977 00        nop     
7978 00        nop     
7979 00        nop     
797a 00        nop     
797b 00        nop     
797c 00        nop     
797d 00        nop     
797e 00        nop     
797f 00        nop     
7980 00        nop     
7981 00        nop     
7982 00        nop     
7983 00        nop     
7984 00        nop     
7985 00        nop     
7986 00        nop     
7987 00        nop     
7988 00        nop     
7989 00        nop     
798a 00        nop     
798b 00        nop     
798c 00        nop     
798d 00        nop     
798e 00        nop     
798f 00        nop     
7990 00        nop     
7991 00        nop     
7992 00        nop     
7993 00        nop     
7994 00        nop     
7995 00        nop     
7996 00        nop     
7997 00        nop     
7998 00        nop     
7999 00        nop     
799a 00        nop     
799b 00        nop     
799c 00        nop     
799d 00        nop     
799e 00        nop     
799f 00        nop     
79a0 00        nop     
79a1 00        nop     
79a2 00        nop     
79a3 00        nop     
79a4 00        nop     
79a5 00        nop     
79a6 00        nop     
79a7 00        nop     
79a8 00        nop     
79a9 00        nop     
79aa 00        nop     
79ab 00        nop     
79ac 00        nop     
79ad 00        nop     
79ae 00        nop     
79af 00        nop     
79b0 00        nop     
79b1 00        nop     
79b2 00        nop     
79b3 00        nop     
79b4 00        nop     
79b5 00        nop     
79b6 00        nop     
79b7 00        nop     
79b8 00        nop     
79b9 00        nop     
79ba 00        nop     
79bb 00        nop     
79bc 00        nop     
79bd 00        nop     
79be 00        nop     
79bf 00        nop     
79c0 00        nop     
79c1 00        nop     
79c2 00        nop     
79c3 00        nop     
79c4 00        nop     
79c5 00        nop     
79c6 00        nop     
79c7 00        nop     
79c8 00        nop     
79c9 00        nop     
79ca 00        nop     
79cb 00        nop     
79cc 00        nop     
79cd 00        nop     
79ce 00        nop     
79cf 00        nop     
79d0 00        nop     
79d1 00        nop     
79d2 00        nop     
79d3 00        nop     
79d4 00        nop     
79d5 00        nop     
79d6 00        nop     
79d7 00        nop     
79d8 00        nop     
79d9 00        nop     
79da 00        nop     
79db 00        nop     
79dc 00        nop     
79dd 00        nop     
79de 00        nop     
79df 00        nop     
79e0 00        nop     
79e1 00        nop     
79e2 00        nop     
79e3 00        nop     
79e4 00        nop     
79e5 00        nop     
79e6 00        nop     
79e7 00        nop     
79e8 00        nop     
79e9 00        nop     
79ea e9        jp      (hl)
79eb 79        ld      a,c
79ec e9        jp      (hl)
79ed 77        ld      (hl),a
79ee cd147a    call    $7a14
79f1 47        ld      b,a
79f2 cd2587    call    $8725
79f5 b8        cp      b
79f6 2005      jr      nz,$79fd
79f8 cd0b7a    call    $7a0b
79fb 180a      jr      $7a07
79fd 21187a    ld      hl,$7a18
7a00 77        ld      (hl),a
7a01 cd4d43    call    $434d
7a04 d4da42    call    nc,$42da
7a07 cd083e    call    $3e08
7a0a c9        ret     

7a0b f5        push    af
7a0c cdeb42    call    $42eb
7a0f 32187a    ld      ($7a18),a
7a12 f1        pop     af
7a13 c9        ret     

7a14 3a187a    ld      a,($7a18)
7a17 c9        ret     

7a18 00        nop     
7a19 cd663b    call    $3b66
7a1c dd21fbd5  ld      ix,$d5fb
7a20 cdf73e    call    $3ef7
7a23 cd743f    call    $3f74
7a26 d8        ret     c

7a27 2003      jr      nz,$7a2c
7a29 c3a68c    jp      $8ca6
7a2c cd8394    call    $9483
7a2f fe01      cp      $01
7a31 2833      jr      z,$7a66
7a33 cb7f      bit     7,a
7a35 281d      jr      z,$7a54
7a37 fe87      cp      $87
7a39 2804      jr      z,$7a3f
7a3b fe8b      cp      $8b
7a3d 200b      jr      nz,$7a4a
7a3f cd2a95    call    $952a
7a42 010100    ld      bc,$0001
7a45 cd5f97    call    $975f
7a48 18e2      jr      $7a2c
7a4a cd2a95    call    $952a
7a4d e67f      and     $7f
7a4f cdda97    call    $97da
7a52 18d8      jr      $7a2c
7a54 fe0d      cp      $0d
7a56 2807      jr      z,$7a5f
7a58 fe0a      cp      $0a
7a5a 20d0      jr      nz,$7a2c
7a5c cd377b    call    $7b37
7a5f 3e0a      ld      a,$0a
7a61 cdfc38    call    $38fc
7a64 18c6      jr      $7a2c
7a66 cd7d99    call    $997d
7a69 cde423    call    $23e4
7a6c cdd233    call    $33d2
7a6f cd7767    call    $6777
7a72 cdb01c    call    $1cb0
7a75 d44012    call    nc,$1240
7a78 c3f710    jp      $10f7
7a7b fd21c331  ld      iy,$31c3
7a7f cdda8e    call    $8eda
7a82 cd9d31    call    $319d
7a85 301a      jr      nc,$7aa1
7a87 cdc993    call    $93c9
7a8a fe20      cp      $20
7a8c 280e      jr      z,$7a9c
7a8e fe09      cp      $09
7a90 20f0      jr      nz,$7a82
7a92 cd3f7b    call    $7b3f
7a95 380b      jr      c,$7aa2
7a97 cdd531    call    $31d5
7a9a 18e6      jr      $7a82
7a9c cd2f7b    call    $7b2f
7a9f 18e1      jr      $7a82
7aa1 b7        or      a
7aa2 c9        ret     

7aa3 fd21c331  ld      iy,$31c3
7aa7 cdda8e    call    $8eda
7aaa dd218c8e  ld      ix,$8e8c
7aae cd207b    call    $7b20
7ab1 cdf73e    call    $3ef7
7ab4 3600      ld      (hl),$00
7ab6 dd21a5d5  ld      ix,$d5a5
7aba cd003f    call    $3f00
7abd cd743f    call    $3f74
7ac0 3805      jr      c,$7ac7
7ac2 2016      jr      nz,$7ada
7ac4 cda68c    call    $8ca6
7ac7 cde78e    call    $8ee7
7aca d5        push    de
7acb e5        push    hl
7acc cd6599    call    $9965
7acf cdda8e    call    $8eda
7ad2 e1        pop     hl
7ad3 d1        pop     de
7ad4 cd8338    call    $3883
7ad7 37        scf     
7ad8 1845      jr      $7b1f
7ada cd9d31    call    $319d
7add 303f      jr      nc,$7b1e
7adf cdc993    call    $93c9
7ae2 fe21      cp      $21
7ae4 30f4      jr      nc,$7ada
7ae6 fe20      cp      $20
7ae8 282f      jr      z,$7b19
7aea fe0d      cp      $0d
7aec 280d      jr      z,$7afb
7aee fe09      cp      $09
7af0 281d      jr      z,$7b0f
7af2 fe0a      cp      $0a
7af4 2814      jr      z,$7b0a
7af6 cd5132    call    $3251
7af9 18df      jr      $7ada
7afb cd6696    call    $9666
7afe fe0a      cp      $0a
7b00 20d8      jr      nz,$7ada
7b02 cdc993    call    $93c9
7b05 cd5132    call    $3251
7b08 18d0      jr      $7ada
7b0a cd377b    call    $7b37
7b0d 18cb      jr      $7ada
7b0f cd3f7b    call    $7b3f
7b12 380b      jr      c,$7b1f
7b14 cdd531    call    $31d5
7b17 18c1      jr      $7ada
7b19 cd2f7b    call    $7b2f
7b1c 18bc      jr      $7ada
7b1e b7        or      a
7b1f c9        ret     

7b20 3e00      ld      a,$00
7b22 dde5      push    ix
7b24 e1        pop     hl
7b25 010f00    ld      bc,$000f
7b28 edb1      cpir    
7b2a 2002      jr      nz,$7b2e
7b2c 3624      ld      (hl),$24
7b2e c9        ret     

7b2f cd2694    call    $9426
7b32 3ea0      ld      a,$a0
7b34 c3da97    jp      $97da
7b37 cd2a95    call    $952a
7b3a 3e0d      ld      a,$0d
7b3c c3da97    jp      $97da
7b3f cd2587    call    $8725
7b42 47        ld      b,a
7b43 cd2694    call    $9426
7b46 cd2587    call    $8725
7b49 90        sub     b
7b4a ed44      neg     
7b4c 3d        dec     a
7b4d b7        or      a
7b4e c4c738    call    nz,$38c7
7b51 f5        push    af
7b52 3ea0      ld      a,$a0
7b54 cdda97    call    $97da
7b57 f1        pop     af
7b58 c9        ret     

7b59 2e2e      ld      l,$2e
7b5b 2e46      ld      l,$46
7b5d 6f        ld      l,a
7b5e 72        ld      (hl),d
7b5f 6d        ld      l,l
7b60 69        ld      l,c
7b61 6e        ld      l,(hl)
7b62 67        ld      h,a
7b63 2049      jr      nz,$7bae
7b65 6e        ld      l,(hl)
7b66 64        ld      h,h
7b67 65        ld      h,l
7b68 78        ld      a,b
7b69 2e2e      ld      l,$2e
7b6b 2e0d      ld      l,$0d
7b6d 0a        ld      a,(bc)
7b6e 24        inc     h
7b6f cdf342    call    $42f3
7b72 ed43497d  ld      ($7d49),bc
7b76 2a264c    ld      hl,($4c26)
7b79 224d7d    ld      ($7d4d),hl
7b7c 210000    ld      hl,$0000
7b7f 224b7d    ld      ($7d4b),hl
7b82 dd21597b  ld      ix,$7b59
7b86 cdf73e    call    $3ef7
7b89 fd21417d  ld      iy,$7d41
7b8d cdce3b    call    $3bce
7b90 cd6599    call    $9965
7b93 cdda8e    call    $8eda
7b96 cdc47f    call    $7fc4
7b99 386c      jr      c,$7c07
7b9b fd21e977  ld      iy,$77e9
7b9f cdeb42    call    $42eb
7ba2 3d        dec     a
7ba3 280a      jr      z,$7baf
7ba5 47        ld      b,a
7ba6 3ea0      ld      a,$a0
7ba8 fd7700    ld      (iy+$00),a
7bab fd23      inc     iy
7bad 10f9      djnz    $7ba8
7baf cd0b7c    call    $7c0b
7bb2 fe01      cp      $01
7bb4 2815      jr      z,$7bcb
7bb6 fd21417d  ld      iy,$7d41
7bba cde78e    call    $8ee7
7bbd cd0c3a    call    $3a0c
7bc0 fd21e977  ld      iy,$77e9
7bc4 cd777c    call    $7c77
7bc7 383e      jr      c,$7c07
7bc9 18cb      jr      $7b96
7bcb fd21417d  ld      iy,$7d41
7bcf cde78e    call    $8ee7
7bd2 cd0c3a    call    $3a0c
7bd5 1621      ld      d,$21
7bd7 cdc993    call    $93c9
7bda fe01      cp      $01
7bdc 2829      jr      z,$7c07
7bde fe0d      cp      $0d
7be0 2018      jr      nz,$7bfa
7be2 cd7d3c    call    $3c7d
7be5 cd6696    call    $9666
7be8 cdac90    call    $90ac
7beb ba        cp      d
7bec 280c      jr      z,$7bfa
7bee 57        ld      d,a
7bef cdb639    call    $39b6
7bf2 cd9e38    call    $389e
7bf5 3810      jr      c,$7c07
7bf7 cd7d3c    call    $3c7d
7bfa b7        or      a
7bfb 20da      jr      nz,$7bd7
7bfd cd2694    call    $9426
7c00 3e2c      ld      a,$2c
7c02 cdda97    call    $97da
7c05 18d0      jr      $7bd7
7c07 cdae86    call    $86ae
7c0a c9        ret     

7c0b 0632      ld      b,$32
7c0d cd6428    call    $2864
7c10 cd037d    call    $7d03
7c13 fe01      cp      $01
7c15 285f      jr      z,$7c76
7c17 fe87      cp      $87
7c19 20f2      jr      nz,$7c0d
7c1b cd6428    call    $2864
7c1e fe87      cp      $87
7c20 28eb      jr      z,$7c0d
7c22 cd037d    call    $7d03
7c25 fe20      cp      $20
7c27 28f2      jr      z,$7c1b
7c29 38f0      jr      c,$7c1b
7c2b 1803      jr      $7c30
7c2d cd6428    call    $2864
7c30 fe86      cp      $86
7c32 28f9      jr      z,$7c2d
7c34 fe81      cp      $81
7c36 28f5      jr      z,$7c2d
7c38 fe82      cp      $82
7c3a 28f1      jr      z,$7c2d
7c3c fe83      cp      $83
7c3e 28ed      jr      z,$7c2d
7c40 fe8b      cp      $8b
7c42 28e9      jr      z,$7c2d
7c44 cd037d    call    $7d03
7c47 fe87      cp      $87
7c49 2809      jr      z,$7c54
7c4b fd7700    ld      (iy+$00),a
7c4e fd23      inc     iy
7c50 10db      djnz    $7c2d
7c52 18b7      jr      $7c0b
7c54 97        sub     a
7c55 fd7700    ld      (iy+$00),a
7c58 fd23      inc     iy
7c5a ed4b4d7d  ld      bc,($7d4d)
7c5e fde5      push    iy
7c60 e1        pop     hl
7c61 cd9b8f    call    $8f9b
7c64 3e0d      ld      a,$0d
7c66 77        ld      (hl),a
7c67 23        inc     hl
7c68 3e24      ld      a,$24
7c6a 77        ld      (hl),a
7c6b 11e977    ld      de,$77e9
7c6e 0e09      ld      c,$09
7c70 cd0500    call    $0005
7c73 cd6202    call    $0262
7c76 c9        ret     

7c77 dde5      push    ix
7c79 fde5      push    iy
7c7b dde1      pop     ix
7c7d fd2a1d9a  ld      iy,($9a1d)
7c81 0600      ld      b,$00
7c83 1601      ld      d,$01
7c85 cdf772    call    $72f7
7c88 3009      jr      nc,$7c93
7c8a cde839    call    $39e8
7c8d fe01      cp      $01
7c8f 2854      jr      z,$7ce5
7c91 18ea      jr      $7c7d
7c93 2050      jr      nz,$7ce5
7c95 cdcf39    call    $39cf
7c98 dd7e00    ld      a,(ix+$00)
7c9b b7        or      a
7c9c 2804      jr      z,$7ca2
7c9e dd23      inc     ix
7ca0 18f6      jr      $7c98
7ca2 dd7e00    ld      a,(ix+$00)
7ca5 cdd090    call    $90d0
7ca8 3804      jr      c,$7cae
7caa dd23      inc     ix
7cac 18f4      jr      $7ca2
7cae dd2b      dec     ix
7cb0 dde5      push    ix
7cb2 d1        pop     de
7cb3 3e2c      ld      a,$2c
7cb5 dd7700    ld      (ix+$00),a
7cb8 dd7e00    ld      a,(ix+$00)
7cbb fe0d      cp      $0d
7cbd 2804      jr      z,$7cc3
7cbf dd23      inc     ix
7cc1 18f5      jr      $7cb8
7cc3 dde5      push    ix
7cc5 e1        pop     hl
7cc6 b7        or      a
7cc7 ed52      sbc     hl,de
7cc9 44        ld      b,h
7cca 4d        ld      c,l
7ccb fd2a1d9a  ld      iy,($9a1d)
7ccf fd2b      dec     iy
7cd1 dd2b      dec     ix
7cd3 fd7e00    ld      a,(iy+$00)
7cd6 cdd090    call    $90d0
7cd9 3025      jr      nc,$7d00
7cdb ddbe00    cp      (ix+$00)
7cde 28ef      jr      z,$7ccf
7ce0 cdf096    call    $96f0
7ce3 181b      jr      $7d00
7ce5 dde5      push    ix
7ce7 d1        pop     de
7ce8 dd7e00    ld      a,(ix+$00)
7ceb fe0d      cp      $0d
7ced 2804      jr      z,$7cf3
7cef dd23      inc     ix
7cf1 18f5      jr      $7ce8
7cf3 dd23      inc     ix
7cf5 dde5      push    ix
7cf7 e1        pop     hl
7cf8 b7        or      a
7cf9 ed52      sbc     hl,de
7cfb 44        ld      b,h
7cfc 4d        ld      c,l
7cfd cdf096    call    $96f0
7d00 dde1      pop     ix
7d02 c9        ret     

7d03 f5        push    af
7d04 c5        push    bc
7d05 dde5      push    ix
7d07 fe0c      cp      $0c
7d09 2821      jr      z,$7d2c
7d0b fe0d      cp      $0d
7d0d 2804      jr      z,$7d13
7d0f fe0a      cp      $0a
7d11 2029      jr      nz,$7d3c
7d13 ed4b4b7d  ld      bc,($7d4b)
7d17 03        inc     bc
7d18 ed434b7d  ld      ($7d4b),bc
7d1c dd21497d  ld      ix,$7d49
7d20 78        ld      a,b
7d21 ddbe01    cp      (ix+$01)
7d24 2004      jr      nz,$7d2a
7d26 79        ld      a,c
7d27 ddbe00    cp      (ix+$00)
7d2a 3810      jr      c,$7d3c
7d2c 010000    ld      bc,$0000
7d2f ed434b7d  ld      ($7d4b),bc
7d33 ed4b4d7d  ld      bc,($7d4d)
7d37 03        inc     bc
7d38 ed434d7d  ld      ($7d4d),bc
7d3c dde1      pop     ix
7d3e c1        pop     bc
7d3f f1        pop     af
7d40 c9        ret     

7d41 00        nop     
7d42 00        nop     
7d43 00        nop     
7d44 00        nop     
7d45 00        nop     
7d46 00        nop     
7d47 00        nop     
7d48 00        nop     
7d49 00        nop     
7d4a 00        nop     
7d4b 00        nop     
7d4c 00        nop     
7d4d 00        nop     
7d4e 00        nop     
7d4f f5        push    af
7d50 c5        push    bc
7d51 d5        push    de
7d52 e5        push    hl
7d53 fde5      push    iy
7d55 97        sub     a
7d56 32fa87    ld      ($87fa),a
7d59 cd6599    call    $9965
7d5c fd21f687  ld      iy,$87f6
7d60 cdda8e    call    $8eda
7d63 3af487    ld      a,($87f4)
7d66 32777f    ld      ($7f77),a
7d69 3af287    ld      a,($87f2)
7d6c 32797f    ld      ($7f79),a
7d6f 3af187    ld      a,($87f1)
7d72 32787f    ld      ($7f78),a
7d75 cd4d3a    call    $3a4d
7d78 cd3e8a    call    $8a3e
7d7b 3a777f    ld      a,($7f77)
7d7e 47        ld      b,a
7d7f c64e      add     a,$4e
7d81 57        ld      d,a
7d82 2617      ld      h,$17
7d84 cd5283    call    $8352
7d87 3005      jr      nc,$7d8e
7d89 cdf984    call    $84f9
7d8c 1807      jr      $7d95
7d8e cdbf7d    call    $7dbf
7d91 fe01      cp      $01
7d93 280b      jr      z,$7da0
7d95 25        dec     h
7d96 2808      jr      z,$7da0
7d98 cd6202    call    $0262
7d9b cd1680    call    $8016
7d9e 18e4      jr      $7d84
7da0 cde78e    call    $8ee7
7da3 cd0c3a    call    $3a0c
7da6 3a797f    ld      a,($7f79)
7da9 32f287    ld      ($87f2),a
7dac 3a777f    ld      a,($7f77)
7daf 32f487    ld      ($87f4),a
7db2 cdb534    call    $34b5
7db5 cdfd33    call    $33fd
7db8 fde1      pop     iy
7dba e1        pop     hl
7dbb d1        pop     de
7dbc c1        pop     bc
7dbd f1        pop     af
7dbe c9        ret     

7dbf c5        push    bc
7dc0 d5        push    de
7dc1 97        sub     a
7dc2 32a17e    ld      ($7ea1),a
7dc5 323584    ld      ($8435),a
7dc8 cd3784    call    $8437
7dcb b7        or      a
7dcc c4b639    call    nz,$39b6
7dcf cd6696    call    $9666
7dd2 fe0c      cp      $0c
7dd4 2009      jr      nz,$7ddf
7dd6 cd6404    call    $0464
7dd9 cdc993    call    $93c9
7ddc c3957e    jp      $7e95
7ddf cda096    call    $96a0
7de2 cda27e    call    $7ea2
7de5 380a      jr      c,$7df1
7de7 cde839    call    $39e8
7dea b7        or      a
7deb cd1680    call    $8016
7dee c3957e    jp      $7e95
7df1 cd6696    call    $9666
7df4 cd8283    call    $8382
7df7 cd2587    call    $8725
7dfa fefe      cp      $fe
7dfc d2847e    jp      nc,$7e84
7dff b8        cp      b
7e00 3015      jr      nc,$7e17
7e02 cd6696    call    $9666
7e05 fe0d      cp      $0d
7e07 2853      jr      z,$7e5c
7e09 fe0a      cp      $0a
7e0b 284f      jr      z,$7e5c
7e0d fe01      cp      $01
7e0f ca957e    jp      z,$7e95
7e12 cdc993    call    $93c9
7e15 18dd      jr      $7df4
7e17 cd1680    call    $8016
7e1a cd2e35    call    $352e
7e1d 2807      jr      z,$7e26
7e1f 3e01      ld      a,$01
7e21 32a17e    ld      ($7ea1),a
7e24 1804      jr      $7e2a
7e26 97        sub     a
7e27 32a17e    ld      ($7ea1),a
7e2a cd1680    call    $8016
7e2d cd2587    call    $8725
7e30 fefe      cp      $fe
7e32 3050      jr      nc,$7e84
7e34 ba        cp      d
7e35 301a      jr      nc,$7e51
7e37 cd6696    call    $9666
7e3a cd9d83    call    $839d
7e3d cdc993    call    $93c9
7e40 fe0d      cp      $0d
7e42 2851      jr      z,$7e95
7e44 fe0a      cp      $0a
7e46 284d      jr      z,$7e95
7e48 fe01      cp      $01
7e4a 2849      jr      z,$7e95
7e4c cd7a7f    call    $7f7a
7e4f 18d9      jr      $7e2a
7e51 cd6696    call    $9666
7e54 fe0d      cp      $0d
7e56 2804      jr      z,$7e5c
7e58 fe0a      cp      $0a
7e5a 2008      jr      nz,$7e64
7e5c cd9d83    call    $839d
7e5f cdc993    call    $93c9
7e62 1831      jr      $7e95
7e64 3e0d      ld      a,$0d
7e66 cd9d83    call    $839d
7e69 cdeb02    call    $02eb
7e6c cd2587    call    $8725
7e6f fefe      cp      $fe
7e71 3011      jr      nc,$7e84
7e73 cdc993    call    $93c9
7e76 fe0d      cp      $0d
7e78 281b      jr      z,$7e95
7e7a fe0a      cp      $0a
7e7c 2817      jr      z,$7e95
7e7e fe01      cp      $01
7e80 2813      jr      z,$7e95
7e82 18e8      jr      $7e6c
7e84 cdc993    call    $93c9
7e87 fe0a      cp      $0a
7e89 280a      jr      z,$7e95
7e8b fe0d      cp      $0d
7e8d 2806      jr      z,$7e95
7e8f cd2694    call    $9426
7e92 cd9e38    call    $389e
7e95 f5        push    af
7e96 3aa17e    ld      a,($7ea1)
7e99 b7        or      a
7e9a c4dc02    call    nz,$02dc
7e9d f1        pop     af
7e9e d1        pop     de
7e9f c1        pop     bc
7ea0 c9        ret     

7ea1 00        nop     
7ea2 c5        push    bc
7ea3 d5        push    de
7ea4 e5        push    hl
7ea5 32767f    ld      ($7f76),a
7ea8 3e01      ld      a,$01
7eaa b8        cp      b
7eab c26e7f    jp      nz,$7f6e
7eae 3e4f      ld      a,$4f
7eb0 ba        cp      d
7eb1 c26e7f    jp      nz,$7f6e
7eb4 cd2e35    call    $352e
7eb7 c26e7f    jp      nz,$7f6e
7eba 2a1d9a    ld      hl,($9a1d)
7ebd 7e        ld      a,(hl)
7ebe 23        inc     hl
7ebf fe20      cp      $20
7ec1 3816      jr      c,$7ed9
7ec3 fe7f      cp      $7f
7ec5 3012      jr      nc,$7ed9
7ec7 fe24      cp      $24
7ec9 2006      jr      nz,$7ed1
7ecb cd0e35    call    $350e
7ece ca6e7f    jp      z,$7f6e
7ed1 04        inc     b
7ed2 7a        ld      a,d
7ed3 b8        cp      b
7ed4 da6e7f    jp      c,$7f6e
7ed7 18e4      jr      $7ebd
7ed9 fea0      cp      $a0
7edb 28ea      jr      z,$7ec7
7edd fead      cp      $ad
7edf 28e6      jr      z,$7ec7
7ee1 fe0d      cp      $0d
7ee3 2805      jr      z,$7eea
7ee5 fe0a      cp      $0a
7ee7 c26e7f    jp      nz,$7f6e
7eea 2b        dec     hl
7eeb ed4b1f9a  ld      bc,($9a1f)
7eef 7c        ld      a,h
7ef0 b8        cp      b
7ef1 2004      jr      nz,$7ef7
7ef3 7d        ld      a,l
7ef4 b9        cp      c
7ef5 2802      jr      z,$7ef9
7ef7 3075      jr      nc,$7f6e
7ef9 cd4d34    call    $344d
7efc 2847      jr      z,$7f45
7efe e5        push    hl
7eff 2a279a    ld      hl,($9a27)
7f02 ed4bf560  ld      bc,($60f5)
7f06 a7        and     a
7f07 ed42      sbc     hl,bc
7f09 200a      jr      nz,$7f15
7f0b ed4bf360  ld      bc,($60f3)
7f0f 2a259a    ld      hl,($9a25)
7f12 a7        and     a
7f13 ed42      sbc     hl,bc
7f15 e1        pop     hl
7f16 2856      jr      z,$7f6e
7f18 302b      jr      nc,$7f45
7f1a e5        push    hl
7f1b ed4b1d9a  ld      bc,($9a1d)
7f1f b7        or      a
7f20 ed42      sbc     hl,bc
7f22 ed4b259a  ld      bc,($9a25)
7f26 09        add     hl,bc
7f27 ed5b279a  ld      de,($9a27)
7f2b 3001      jr      nc,$7f2e
7f2d 13        inc     de
7f2e ed4bf160  ld      bc,($60f1)
7f32 eb        ex      de,hl
7f33 a7        and     a
7f34 ed42      sbc     hl,bc
7f36 2008      jr      nz,$7f40
7f38 ed4bef60  ld      bc,($60ef)
7f3c eb        ex      de,hl
7f3d a7        and     a
7f3e ed42      sbc     hl,bc
7f40 e1        pop     hl
7f41 282b      jr      z,$7f6e
7f43 3029      jr      nc,$7f6e
7f45 7e        ld      a,(hl)
7f46 cd0e35    call    $350e
7f49 280d      jr      z,$7f58
7f4b 3600      ld      (hl),$00
7f4d 0601      ld      b,$01
7f4f e5        push    hl
7f50 2a1d9a    ld      hl,($9a1d)
7f53 cf        rst     $08
7f54 19        add     hl,de
7f55 e1        pop     hl
7f56 180b      jr      $7f63
7f58 3624      ld      (hl),$24
7f5a 0e09      ld      c,$09
7f5c ed5b1d9a  ld      de,($9a1d)
7f60 cd0500    call    $0005
7f63 77        ld      (hl),a
7f64 fe0a      cp      $0a
7f66 2003      jr      nz,$7f6b
7f68 cd8904    call    $0489
7f6b b7        or      a
7f6c 1801      jr      $7f6f
7f6e 37        scf     
7f6f e1        pop     hl
7f70 d1        pop     de
7f71 c1        pop     bc
7f72 3a767f    ld      a,($7f76)
7f75 c9        ret     

7f76 00        nop     
7f77 00        nop     
7f78 00        nop     
7f79 00        nop     
7f7a c5        push    bc
7f7b d5        push    de
7f7c e67f      and     $7f
7f7e fe09      cp      $09
7f80 2808      jr      z,$7f8a
7f82 5f        ld      e,a
7f83 0e06      ld      c,$06
7f85 cd0500    call    $0005
7f88 1815      jr      $7f9f
7f8a cd2587    call    $8725
7f8d 47        ld      b,a
7f8e cd2694    call    $9426
7f91 cd2587    call    $8725
7f94 90        sub     b
7f95 1e20      ld      e,$20
7f97 0e06      ld      c,$06
7f99 cd4790    call    $9047
7f9c cdc993    call    $93c9
7f9f d1        pop     de
7fa0 c1        pop     bc
7fa1 c9        ret     

7fa2 c5        push    bc
7fa3 cde07f    call    $7fe0
7fa6 fe20      cp      $20
7fa8 3018      jr      nc,$7fc2
7faa fe02      cp      $02
7fac 2011      jr      nz,$7fbf
7fae cde07f    call    $7fe0
7fb1 fe02      cp      $02
7fb3 2008      jr      nz,$7fbd
7fb5 cde07f    call    $7fe0
7fb8 f5        push    af
7fb9 cde07f    call    $7fe0
7fbc f1        pop     af
7fbd f680      or      $80
7fbf cdbe01    call    $01be
7fc2 c1        pop     bc
7fc3 c9        ret     

7fc4 c5        push    bc
7fc5 d5        push    de
7fc6 32df7f    ld      ($7fdf),a
7fc9 cd6b80    call    $806b
7fcc 280a      jr      z,$7fd8
7fce cda27f    call    $7fa2
7fd1 fe1b      cp      $1b
7fd3 2003      jr      nz,$7fd8
7fd5 37        scf     
7fd6 1801      jr      $7fd9
7fd8 b7        or      a
7fd9 d1        pop     de
7fda c1        pop     bc
7fdb 3adf7f    ld      a,($7fdf)
7fde c9        ret     

7fdf 00        nop     
7fe0 c5        push    bc
7fe1 d5        push    de
7fe2 e5        push    hl
7fe3 2a8e80    ld      hl,($808e)
7fe6 ed4b8c80  ld      bc,($808c)
7fea b7        or      a
7feb ed42      sbc     hl,bc
7fed 2820      jr      z,$800f
7fef 2a8e80    ld      hl,($808e)
7ff2 7c        ld      a,h
7ff3 b5        or      l
7ff4 2004      jr      nz,$7ffa
7ff6 ed438e80  ld      ($808e),bc
7ffa 60        ld      h,b
7ffb 69        ld      l,c
7ffc 7e        ld      a,(hl)
7ffd 03        inc     bc
7ffe 21ae80    ld      hl,$80ae
8001 b7        or      a
8002 ed42      sbc     hl,bc
8004 2003      jr      nz,$8009
8006 019080    ld      bc,$8090
8009 ed438c80  ld      ($808c),bc
800d 1803      jr      $8012
800f cd3680    call    $8036
8012 e1        pop     hl
8013 d1        pop     de
8014 c1        pop     bc
8015 c9        ret     

8016 f5        push    af
8017 c5        push    bc
8018 d5        push    de
8019 e5        push    hl
801a 0e0b      ld      c,$0b
801c 1efe      ld      e,$fe
801e cd0500    call    $0005
8021 b7        or      a
8022 280d      jr      z,$8031
8024 2a8e80    ld      hl,($808e)
8027 7c        ld      a,h
8028 b5        or      l
8029 2806      jr      z,$8031
802b cd3680    call    $8036
802e cd3d80    call    $803d
8031 e1        pop     hl
8032 d1        pop     de
8033 c1        pop     bc
8034 f1        pop     af
8035 c9        ret     

8036 0e80      ld      c,$80
8038 1efd      ld      e,$fd
803a c30500    jp      $0005
803d c5        push    bc
803e e5        push    hl
803f 47        ld      b,a
8040 2a8e80    ld      hl,($808e)
8043 7c        ld      a,h
8044 b5        or      l
8045 2821      jr      z,$8068
8047 70        ld      (hl),b
8048 23        inc     hl
8049 44        ld      b,h
804a 4d        ld      c,l
804b 21ae80    ld      hl,$80ae
804e b7        or      a
804f ed42      sbc     hl,bc
8051 2003      jr      nz,$8056
8053 019080    ld      bc,$8090
8056 210000    ld      hl,$0000
8059 228e80    ld      ($808e),hl
805c 2a8c80    ld      hl,($808c)
805f b7        or      a
8060 ed42      sbc     hl,bc
8062 2804      jr      z,$8068
8064 ed438e80  ld      ($808e),bc
8068 e1        pop     hl
8069 c1        pop     bc
806a c9        ret     

806b c5        push    bc
806c e5        push    hl
806d cd1680    call    $8016
8070 2a8e80    ld      hl,($808e)
8073 ed4b8c80  ld      bc,($808c)
8077 b7        or      a
8078 ed42      sbc     hl,bc
807a e1        pop     hl
807b c1        pop     bc
807c c9        ret     

807d e5        push    hl
807e cd1680    call    $8016
8081 219080    ld      hl,$8090
8084 228c80    ld      ($808c),hl
8087 228e80    ld      ($808e),hl
808a e1        pop     hl
808b c9        ret     

808c 90        sub     b
808d 80        add     a,b
808e 90        sub     b
808f 80        add     a,b
8090 00        nop     
8091 00        nop     
8092 00        nop     
8093 00        nop     
8094 00        nop     
8095 00        nop     
8096 00        nop     
8097 00        nop     
8098 00        nop     
8099 00        nop     
809a 00        nop     
809b 00        nop     
809c 00        nop     
809d 00        nop     
809e 00        nop     
809f 00        nop     
80a0 00        nop     
80a1 00        nop     
80a2 00        nop     
80a3 00        nop     
80a4 00        nop     
80a5 00        nop     
80a6 00        nop     
80a7 00        nop     
80a8 00        nop     
80a9 00        nop     
80aa 00        nop     
80ab 00        nop     
80ac 00        nop     
80ad 00        nop     
80ae c5        push    bc
80af d5        push    de
80b0 dde5      push    ix
80b2 fde5      push    iy
80b4 cddb82    call    $82db
80b7 4f        ld      c,a
80b8 0600      ld      b,$00
80ba 110d83    ld      de,$830d
80bd 212e81    ld      hl,$812e
80c0 c5        push    bc
80c1 cd8e81    call    $818e
80c4 c1        pop     bc
80c5 3860      jr      c,$8127
80c7 2830      jr      z,$80f9
80c9 fe0d      cp      $0d
80cb 283d      jr      z,$810a
80cd fe20      cp      $20
80cf 2839      jr      z,$810a
80d1 fe7f      cp      $7f
80d3 2804      jr      z,$80d9
80d5 fe08      cp      $08
80d7 200e      jr      nz,$80e7
80d9 78        ld      a,b
80da b7        or      a
80db 28e0      jr      z,$80bd
80dd 05        dec     b
80de 1b        dec     de
80df 3e20      ld      a,$20
80e1 12        ld      (de),a
80e2 cd338a    call    $8a33
80e5 18d6      jr      $80bd
80e7 cd8782    call    $8287
80ea 3808      jr      c,$80f4
80ec cd4583    call    $8345
80ef 12        ld      (de),a
80f0 13        inc     de
80f1 04        inc     b
80f2 18c9      jr      $80bd
80f4 cd5402    call    $0254
80f7 18c4      jr      $80bd
80f9 210d83    ld      hl,$830d
80fc e5        push    hl
80fd b7        or      a
80fe ed52      sbc     hl,de
8100 e1        pop     hl
8101 30ba      jr      nc,$80bd
8103 7e        ld      a,(hl)
8104 23        inc     hl
8105 cd4583    call    $8345
8108 18f2      jr      $80fc
810a 3e05      ld      a,$05
810c b8        cp      b
810d 3814      jr      c,$8123
810f 010d83    ld      bc,$830d
8112 2008      jr      nz,$811c
8114 0a        ld      a,(bc)
8115 fe34      cp      $34
8117 3803      jr      c,$811c
8119 3e34      ld      a,$34
811b 02        ld      (bc),a
811c cd788f    call    $8f78
811f cb7c      bit     7,h
8121 2803      jr      z,$8126
8123 21ff7f    ld      hl,$7fff
8126 b7        or      a
8127 fde1      pop     iy
8129 dde1      pop     ix
812b d1        pop     de
812c c1        pop     bc
812d c9        ret     

812e 3031      jr      nc,$8161
8130 323334    ld      ($3433),a
8133 35        dec     (hl)
8134 3637      ld      (hl),$37
8136 3839      jr      c,$8171
8138 200d      jr      nz,$8147
813a 7f        ld      a,a
813b 08        ex      af,af'
813c 00        nop     
813d cda27f    call    $7fa2
8140 fe1b      cp      $1b
8142 2008      jr      nz,$814c
8144 cdfd81    call    $81fd
8147 cca68c    call    z,$8ca6
814a 37        scf     
814b c9        ret     

814c feeb      cp      $eb
814e 2026      jr      nz,$8176
8150 cd1582    call    $8215
8153 202f      jr      nz,$8184
8155 cdf73e    call    $3ef7
8158 cd0582    call    $8205
815b 2814      jr      z,$8171
815d cdc93e    call    $3ec9
8160 c5        push    bc
8161 d5        push    de
8162 e5        push    hl
8163 dde5      push    ix
8165 cd8c81    call    $818c
8168 dde1      pop     ix
816a e1        pop     hl
816b d1        pop     de
816c c1        pop     bc
816d 97        sub     a
816e b7        or      a
816f 1818      jr      $8189
8171 cde989    call    $89e9
8174 18c7      jr      $813d
8176 fefb      cp      $fb
8178 200f      jr      nz,$8189
817a cd0d82    call    $820d
817d 2005      jr      nz,$8184
817f cde784    call    $84e7
8182 18b9      jr      $813d
8184 cd5402    call    $0254
8187 18b4      jr      $813d
8189 37        scf     
818a 3f        ccf     
818b c9        ret     

818c fde9      jp      (iy)
818e cd3d81    call    $813d
8191 d8        ret     c

8192 c8        ret     z

8193 cdac90    call    $90ac
8196 cd1e82    call    $821e
8199 c0        ret     nz

819a cd5402    call    $0254
819d 18ef      jr      $818e
819f d5        push    de
81a0 cd7d80    call    $807d
81a3 cd8e81    call    $818e
81a6 382d      jr      c,$81d5
81a8 28f6      jr      z,$81a0
81aa 57        ld      d,a
81ab 58        ld      e,b
81ac cd4583    call    $8345
81af cd7f82    call    $827f
81b2 e5        push    hl
81b3 21d781    ld      hl,$81d7
81b6 cd8e81    call    $818e
81b9 e1        pop     hl
81ba 3819      jr      c,$81d5
81bc 2003      jr      nz,$81c1
81be 7a        ld      a,d
81bf 18eb      jr      $81ac
81c1 fe0d      cp      $0d
81c3 2809      jr      z,$81ce
81c5 fe20      cp      $20
81c7 2805      jr      z,$81ce
81c9 cd338a    call    $8a33
81cc 18d2      jr      $81a0
81ce 3e20      ld      a,$20
81d0 cd4583    call    $8345
81d3 7a        ld      a,d
81d4 43        ld      b,e
81d5 d1        pop     de
81d6 c9        ret     

81d7 7f        ld      a,a
81d8 08        ex      af,af'
81d9 0d        dec     c
81da 2000      jr      nz,$81dc
81dc c5        push    bc
81dd e5        push    hl
81de 21eb81    ld      hl,$81eb
81e1 cd9f81    call    $819f
81e4 3802      jr      c,$81e8
81e6 78        ld      a,b
81e7 b7        or      a
81e8 e1        pop     hl
81e9 c1        pop     bc
81ea c9        ret     

81eb 4e        ld      c,(hl)
81ec 59        ld      e,c
81ed 00        nop     
81ee 321d82    ld      ($821d),a
81f1 c9        ret     

81f2 3a1d82    ld      a,($821d)
81f5 c9        ret     

81f6 f5        push    af
81f7 97        sub     a
81f8 321d82    ld      ($821d),a
81fb f1        pop     af
81fc c9        ret     

81fd e5        push    hl
81fe 211d82    ld      hl,$821d
8201 cb46      bit     0,(hl)
8203 e1        pop     hl
8204 c9        ret     

8205 e5        push    hl
8206 211d82    ld      hl,$821d
8209 cb4e      bit     1,(hl)
820b e1        pop     hl
820c c9        ret     

820d e5        push    hl
820e 211d82    ld      hl,$821d
8211 cb56      bit     2,(hl)
8213 e1        pop     hl
8214 c9        ret     

8215 e5        push    hl
8216 211d82    ld      hl,$821d
8219 cb5e      bit     3,(hl)
821b e1        pop     hl
821c c9        ret     

821d 00        nop     
821e d5        push    de
821f e5        push    hl
8220 0600      ld      b,$00
8222 5f        ld      e,a
8223 7e        ld      a,(hl)
8224 bb        cp      e
8225 2807      jr      z,$822e
8227 b7        or      a
8228 2804      jr      z,$822e
822a 23        inc     hl
822b 04        inc     b
822c 18f5      jr      $8223
822e b7        or      a
822f e1        pop     hl
8230 d1        pop     de
8231 c9        ret     

8232 227d82    ld      ($827d),hl
8235 0600      ld      b,$00
8237 4f        ld      c,a
8238 cd3d81    call    $813d
823b d8        ret     c

823c 2829      jr      z,$8267
823e fe0d      cp      $0d
8240 2839      jr      z,$827b
8242 fe7f      cp      $7f
8244 2804      jr      z,$824a
8246 fe08      cp      $08
8248 200b      jr      nz,$8255
824a 97        sub     a
824b b0        or      b
824c 2828      jr      z,$8276
824e 05        dec     b
824f 2b        dec     hl
8250 cd338a    call    $8a33
8253 18e3      jr      $8238
8255 cde290    call    $90e2
8258 301c      jr      nc,$8276
825a cd7f82    call    $827f
825d 3817      jr      c,$8276
825f cd4583    call    $8345
8262 04        inc     b
8263 77        ld      (hl),a
8264 23        inc     hl
8265 18d1      jr      $8238
8267 3624      ld      (hl),$24
8269 c5        push    bc
826a ed5b7d82  ld      de,($827d)
826e 0e09      ld      c,$09
8270 cd0500    call    $0005
8273 c1        pop     bc
8274 18c2      jr      $8238
8276 cd5402    call    $0254
8279 18bd      jr      $8238
827b b7        or      a
827c c9        ret     

827d 00        nop     
827e 00        nop     
827f cd0582    call    $8205
8282 2003      jr      nz,$8287
8284 c3008a    jp      $8a00
8287 d5        push    de
8288 57        ld      d,a
8289 79        ld      a,c
828a 3d        dec     a
828b b8        cp      b
828c 7a        ld      a,d
828d d1        pop     de
828e c9        ret     

828f cdce03    call    $03ce
8292 cda382    call    $82a3
8295 cdf203    call    $03f2
8298 c9        ret     

8299 cdce03    call    $03ce
829c cdc582    call    $82c5
829f cdf203    call    $03f2
82a2 c9        ret     

82a3 f5        push    af
82a4 c5        push    bc
82a5 d5        push    de
82a6 e5        push    hl
82a7 cddb82    call    $82db
82aa 4f        ld      c,a
82ab 0600      ld      b,$00
82ad 210f83    ld      hl,$830f
82b0 cd928f    call    $8f92
82b3 3e24      ld      a,$24
82b5 321283    ld      ($8312),a
82b8 110f83    ld      de,$830f
82bb 0e09      ld      c,$09
82bd cd0500    call    $0005
82c0 e1        pop     hl
82c1 d1        pop     de
82c2 c1        pop     bc
82c3 f1        pop     af
82c4 c9        ret     

82c5 d5        push    de
82c6 e5        push    hl
82c7 cddb82    call    $82db
82ca 210d83    ld      hl,$830d
82cd cd928f    call    $8f92
82d0 110d83    ld      de,$830d
82d3 0e09      ld      c,$09
82d5 cd0500    call    $0005
82d8 e1        pop     hl
82d9 d1        pop     de
82da c9        ret     

82db c5        push    bc
82dc d5        push    de
82dd e5        push    hl
82de 210d83    ld      hl,$830d
82e1 110e83    ld      de,$830e
82e4 010500    ld      bc,$0005
82e7 3620      ld      (hl),$20
82e9 edb0      ldir    
82eb e1        pop     hl
82ec d1        pop     de
82ed c1        pop     bc
82ee c9        ret     

82ef 210d83    ld      hl,$830d
82f2 110783    ld      de,$8307
82f5 010600    ld      bc,$0006
82f8 edb0      ldir    
82fa c9        ret     

82fb 210783    ld      hl,$8307
82fe 110d83    ld      de,$830d
8301 010600    ld      bc,$0006
8304 edb0      ldir    
8306 c9        ret     

8307 00        nop     
8308 00        nop     
8309 00        nop     
830a 00        nop     
830b 00        nop     
830c 00        nop     
830d 00        nop     
830e 00        nop     
830f 00        nop     
8310 00        nop     
8311 00        nop     
8312 00        nop     
8313 24        inc     h
8314 f5        push    af
8315 e5        push    hl
8316 dde5      push    ix
8318 fde5      push    iy
831a fd213783  ld      iy,$8337
831e cd2c24    call    $242c
8321 fde5      push    iy
8323 e1        pop     hl
8324 cd8d90    call    $908d
8327 3624      ld      (hl),$24
8329 fde5      push    iy
832b dde1      pop     ix
832d cd003f    call    $3f00
8330 fde1      pop     iy
8332 dde1      pop     ix
8334 e1        pop     hl
8335 f1        pop     af
8336 c9        ret     

8337 00        nop     
8338 00        nop     
8339 00        nop     
833a 00        nop     
833b 00        nop     
833c 00        nop     
833d 00        nop     
833e 00        nop     
833f 00        nop     
8340 00        nop     
8341 00        nop     
8342 00        nop     
8343 00        nop     
8344 00        nop     
8345 f5        push    af
8346 c5        push    bc
8347 d5        push    de
8348 5f        ld      e,a
8349 0e02      ld      c,$02
834b cd0500    call    $0005
834e d1        pop     de
834f c1        pop     bc
8350 f1        pop     af
8351 c9        ret     

8352 c5        push    bc
8353 cd866b    call    $6b86
8356 0b        dec     bc
8357 78        ld      a,b
8358 b1        or      c
8359 2821      jr      z,$837c
835b cd8b6b    call    $6b8b
835e 0b        dec     bc
835f 78        ld      a,b
8360 b1        or      c
8361 2019      jr      nz,$837c
8363 cda096    call    $96a0
8366 fe0c      cp      $0c
8368 2812      jr      z,$837c
836a cd3887    call    $8738
836d fe02      cp      $02
836f 280b      jr      z,$837c
8371 cda534    call    $34a5
8374 2006      jr      nz,$837c
8376 cdad34    call    $34ad
8379 37        scf     
837a 1804      jr      $8380
837c cdb534    call    $34b5
837f b7        or      a
8380 c1        pop     bc
8381 c9        ret     

8382 f5        push    af
8383 c5        push    bc
8384 cd6696    call    $9666
8387 3a3684    ld      a,($8436)
838a 47        ld      b,a
838b cd3784    call    $8437
838e b8        cp      b
838f 2809      jr      z,$839a
8391 323684    ld      ($8436),a
8394 cd2587    call    $8725
8397 323584    ld      ($8435),a
839a c1        pop     bc
839b f1        pop     af
839c c9        ret     

839d c5        push    bc
839e d5        push    de
839f e5        push    hl
83a0 fe0d      cp      $0d
83a2 280a      jr      z,$83ae
83a4 fe0a      cp      $0a
83a6 2043      jr      nz,$83eb
83a8 cd8904    call    $0489
83ab cd2803    call    $0328
83ae cd3784    call    $8437
83b1 b7        or      a
83b2 2837      jr      z,$83eb
83b4 fe04      cp      $04
83b6 2807      jr      z,$83bf
83b8 3a3684    ld      a,($8436)
83bb 67        ld      h,a
83bc 97        sub     a
83bd 1833      jr      $83f2
83bf cd3887    call    $8738
83c2 5f        ld      e,a
83c3 164f      ld      d,$4f
83c5 cd9504    call    $0495
83c8 97        sub     a
83c9 cd9b03    call    $039b
83cc 3a777f    ld      a,($7f77)
83cf 57        ld      d,a
83d0 cd2587    call    $8725
83d3 92        sub     d
83d4 3001      jr      nc,$83d7
83d6 97        sub     a
83d7 3c        inc     a
83d8 57        ld      d,a
83d9 cd9504    call    $0495
83dc 3a3684    ld      a,($8436)
83df 67        ld      h,a
83e0 fe04      cp      $04
83e2 2816      jr      z,$83fa
83e4 3e04      ld      a,$04
83e6 cd9b03    call    $039b
83e9 180f      jr      $83fa
83eb 3a3684    ld      a,($8436)
83ee 67        ld      h,a
83ef cd3784    call    $8437
83f2 bc        cp      h
83f3 283c      jr      z,$8431
83f5 6f        ld      l,a
83f6 97        sub     a
83f7 cd9b03    call    $039b
83fa 3a777f    ld      a,($7f77)
83fd 57        ld      d,a
83fe 3a3584    ld      a,($8435)
8401 f5        push    af
8402 92        sub     d
8403 3001      jr      nc,$8406
8405 97        sub     a
8406 3c        inc     a
8407 57        ld      d,a
8408 cd3887    call    $8738
840b 5f        ld      e,a
840c cd2587    call    $8725
840f 323584    ld      ($8435),a
8412 f1        pop     af
8413 b7        or      a
8414 2817      jr      z,$842d
8416 cd9504    call    $0495
8419 7c        ld      a,h
841a cd9b03    call    $039b
841d 3a777f    ld      a,($7f77)
8420 57        ld      d,a
8421 cd2587    call    $8725
8424 92        sub     d
8425 3001      jr      nc,$8428
8427 97        sub     a
8428 3c        inc     a
8429 57        ld      d,a
842a cd9504    call    $0495
842d 7d        ld      a,l
842e 323684    ld      ($8436),a
8431 e1        pop     hl
8432 d1        pop     de
8433 c1        pop     bc
8434 c9        ret     

8435 00        nop     
8436 00        nop     
8437 e5        push    hl
8438 219035    ld      hl,$3590
843b cb46      bit     0,(hl)
843d 2804      jr      z,$8443
843f 3e03      ld      a,$03
8441 1853      jr      $8496
8443 cb4e      bit     1,(hl)
8445 2804      jr      z,$844b
8447 3e06      ld      a,$06
8449 184b      jr      $8496
844b 218f35    ld      hl,$358f
844e cb6e      bit     5,(hl)
8450 2804      jr      z,$8456
8452 3e02      ld      a,$02
8454 1840      jr      $8496
8456 218f35    ld      hl,$358f
8459 cb66      bit     4,(hl)
845b 281e      jr      z,$847b
845d cb5e      bit     3,(hl)
845f 280d      jr      z,$846e
8461 cd9984    call    $8499
8464 2804      jr      z,$846a
8466 3e0d      ld      a,$0d
8468 182c      jr      $8496
846a 3e09      ld      a,$09
846c 1828      jr      $8496
846e cd9984    call    $8499
8471 2804      jr      z,$8477
8473 3e0c      ld      a,$0c
8475 181f      jr      $8496
8477 3e08      ld      a,$08
8479 181b      jr      $8496
847b cb5e      bit     3,(hl)
847d 280d      jr      z,$848c
847f cd9984    call    $8499
8482 2804      jr      z,$8488
8484 3e05      ld      a,$05
8486 180e      jr      $8496
8488 3e01      ld      a,$01
848a 180a      jr      $8496
848c cd9984    call    $8499
848f 2804      jr      z,$8495
8491 3e04      ld      a,$04
8493 1801      jr      $8496
8495 97        sub     a
8496 b7        or      a
8497 e1        pop     hl
8498 c9        ret     

8499 cd4d34    call    $344d
849c 2844      jr      z,$84e2
849e d5        push    de
849f e5        push    hl
84a0 21f260    ld      hl,$60f2
84a3 11289a    ld      de,$9a28
84a6 1a        ld      a,(de)
84a7 be        cp      (hl)
84a8 2010      jr      nz,$84ba
84aa 2b        dec     hl
84ab 1b        dec     de
84ac 1a        ld      a,(de)
84ad be        cp      (hl)
84ae 200a      jr      nz,$84ba
84b0 2b        dec     hl
84b1 1b        dec     de
84b2 1a        ld      a,(de)
84b3 be        cp      (hl)
84b4 2004      jr      nz,$84ba
84b6 2b        dec     hl
84b7 1b        dec     de
84b8 1a        ld      a,(de)
84b9 be        cp      (hl)
84ba 3823      jr      c,$84df
84bc 21f660    ld      hl,$60f6
84bf 11289a    ld      de,$9a28
84c2 1a        ld      a,(de)
84c3 be        cp      (hl)
84c4 2010      jr      nz,$84d6
84c6 2b        dec     hl
84c7 1b        dec     de
84c8 1a        ld      a,(de)
84c9 be        cp      (hl)
84ca 200a      jr      nz,$84d6
84cc 2b        dec     hl
84cd 1b        dec     de
84ce 1a        ld      a,(de)
84cf be        cp      (hl)
84d0 2004      jr      nz,$84d6
84d2 2b        dec     hl
84d3 1b        dec     de
84d4 1a        ld      a,(de)
84d5 be        cp      (hl)
84d6 3007      jr      nc,$84df
84d8 e1        pop     hl
84d9 d1        pop     de
84da 3e01      ld      a,$01
84dc b7        or      a
84dd 1803      jr      $84e2
84df e1        pop     hl
84e0 d1        pop     de
84e1 97        sub     a
84e2 c9        ret     

84e3 00        nop     
84e4 00        nop     
84e5 00        nop     
84e6 00        nop     
84e7 cdc233    call    $33c2
84ea 2809      jr      z,$84f5
84ec cd4f7d    call    $7d4f
84ef cd3c86    call    $863c
84f2 cd8402    call    $0284
84f5 cde989    call    $89e9
84f8 c9        ret     

84f9 cd3887    call    $8738
84fc 3d        dec     a
84fd 32fa87    ld      ($87fa),a
8500 cd6404    call    $0464
8503 c9        ret     

8504 f5        push    af
8505 cd3887    call    $8738
8508 fe19      cp      $19
850a 3841      jr      c,$854d
850c 281a      jr      z,$8528
850e cd5283    call    $8352
8511 302f      jr      nc,$8542
8513 1601      ld      d,$01
8515 1e18      ld      e,$18
8517 cd9504    call    $0495
851a cd6202    call    $0262
851d 3e18      ld      a,$18
851f 32fa87    ld      ($87fa),a
8522 cd6404    call    $0464
8525 cdb534    call    $34b5
8528 3e18      ld      a,$18
852a cd4087    call    $8740
852d f1        pop     af
852e 3818      jr      c,$8548
8530 1601      ld      d,$01
8532 1e18      ld      e,$18
8534 cd9504    call    $0495
8537 cd6202    call    $0262
853a cdb985    call    $85b9
853d cdac87    call    $87ac
8540 180e      jr      $8550
8542 3e18      ld      a,$18
8544 cd4087    call    $8740
8547 f1        pop     af
8548 cd4f7d    call    $7d4f
854b 1803      jr      $8550
854d f1        pop     af
854e 38f8      jr      c,$8548
8550 c9        ret     

8551 f5        push    af
8552 cd3887    call    $8738
8555 fe19      cp      $19
8557 3051      jr      nc,$85aa
8559 b7        or      a
855a 2030      jr      nz,$858c
855c 47        ld      b,a
855d cd3087    call    $8730
8560 4f        ld      c,a
8561 cd6599    call    $9965
8564 cde839    call    $39e8
8567 cd3887    call    $8738
856a 90        sub     b
856b fe02      cp      $02
856d f5        push    af
856e cd0c3a    call    $3a0c
8571 79        ld      a,c
8572 cd1687    call    $8716
8575 f1        pop     af
8576 2032      jr      nz,$85aa
8578 1601      ld      d,$01
857a 1e02      ld      e,$02
857c cd9504    call    $0495
857f cd2e02    call    $022e
8582 3e02      ld      a,$02
8584 32fa87    ld      ($87fa),a
8587 cd6404    call    $0464
858a 1804      jr      $8590
858c fe02      cp      $02
858e 3025      jr      nc,$85b5
8590 3e02      ld      a,$02
8592 cd4087    call    $8740
8595 f1        pop     af
8596 3818      jr      c,$85b0
8598 1601      ld      d,$01
859a 1e02      ld      e,$02
859c cd9504    call    $0495
859f cd2e02    call    $022e
85a2 cdb985    call    $85b9
85a5 cd9f87    call    $879f
85a8 180e      jr      $85b8
85aa f1        pop     af
85ab 3e02      ld      a,$02
85ad cd4087    call    $8740
85b0 cd4f7d    call    $7d4f
85b3 1803      jr      $85b8
85b5 f1        pop     af
85b6 38f8      jr      c,$85b0
85b8 c9        ret     

85b9 c5        push    bc
85ba d5        push    de
85bb e5        push    hl
85bc cd3487    call    $8734
85bf f5        push    af
85c0 cd3087    call    $8730
85c3 f5        push    af
85c4 cd6599    call    $9965
85c7 d5        push    de
85c8 e5        push    hl
85c9 47        ld      b,a
85ca c64e      add     a,$4e
85cc 57        ld      d,a
85cd cdb639    call    $39b6
85d0 cdbf7d    call    $7dbf
85d3 e1        pop     hl
85d4 d1        pop     de
85d5 cd0c3a    call    $3a0c
85d8 f1        pop     af
85d9 cd1687    call    $8716
85dc f1        pop     af
85dd cd4487    call    $8744
85e0 e1        pop     hl
85e1 d1        pop     de
85e2 c1        pop     bc
85e3 c9        ret     

85e4 e5        push    hl
85e5 21f187    ld      hl,$87f1
85e8 35        dec     (hl)
85e9 e1        pop     hl
85ea c9        ret     

85eb e5        push    hl
85ec 21f187    ld      hl,$87f1
85ef 34        inc     (hl)
85f0 e1        pop     hl
85f1 c9        ret     

85f2 32f587    ld      ($87f5),a
85f5 e5        push    hl
85f6 3af287    ld      a,($87f2)
85f9 fe01      cp      $01
85fb 200f      jr      nz,$860c
85fd 3ef8      ld      a,$f8
85ff cd0787    call    $8707
8602 300c      jr      nc,$8610
8604 3e08      ld      a,$08
8606 32f287    ld      ($87f2),a
8609 37        scf     
860a 1805      jr      $8611
860c 21f287    ld      hl,$87f2
860f 35        dec     (hl)
8610 b7        or      a
8611 3af587    ld      a,($87f5)
8614 e1        pop     hl
8615 c9        ret     

8616 32f587    ld      ($87f5),a
8619 3af287    ld      a,($87f2)
861c fe4e      cp      $4e
861e 2013      jr      nz,$8633
8620 3e08      ld      a,$08
8622 cd0787    call    $8707
8625 3803      jr      c,$862a
8627 97        sub     a
8628 180d      jr      $8637
862a 3e47      ld      a,$47
862c 32f287    ld      ($87f2),a
862f b7        or      a
8630 37        scf     
8631 1805      jr      $8638
8633 3c        inc     a
8634 32f287    ld      ($87f2),a
8637 b7        or      a
8638 3af587    ld      a,($87f5)
863b c9        ret     

863c f5        push    af
863d d5        push    de
863e 3af187    ld      a,($87f1)
8641 5f        ld      e,a
8642 3af287    ld      a,($87f2)
8645 57        ld      d,a
8646 cd9504    call    $0495
8649 d1        pop     de
864a f1        pop     af
864b c9        ret     

864c 32f587    ld      ($87f5),a
864f 3e01      ld      a,$01
8651 32f287    ld      ($87f2),a
8654 3af487    ld      a,($87f4)
8657 fe01      cp      $01
8659 2808      jr      z,$8663
865b 3e01      ld      a,$01
865d cd1687    call    $8716
8660 37        scf     
8661 1801      jr      $8664
8663 b7        or      a
8664 3af587    ld      a,($87f5)
8667 c9        ret     

8668 32f587    ld      ($87f5),a
866b 3af287    ld      a,($87f2)
866e 3d        dec     a
866f c608      add     a,$08
8671 e6f8      and     $f8
8673 3c        inc     a
8674 fe4f      cp      $4f
8676 381b      jr      c,$8693
8678 f5        push    af
8679 3e08      ld      a,$08
867b cd0787    call    $8707
867e 3809      jr      c,$8689
8680 f1        pop     af
8681 3e4e      ld      a,$4e
8683 cd4487    call    $8744
8686 97        sub     a
8687 180d      jr      $8696
8689 f1        pop     af
868a d608      sub     $08
868c b7        or      a
868d 37        scf     
868e cd4487    call    $8744
8691 1804      jr      $8697
8693 cd4487    call    $8744
8696 b7        or      a
8697 3af587    ld      a,($87f5)
869a c9        ret     

869b 32ad86    ld      ($86ad),a
869e 3e02      ld      a,$02
86a0 32f187    ld      ($87f1),a
86a3 cd4c86    call    $864c
86a6 3aad86    ld      a,($86ad)
86a9 cd4887    call    $8748
86ac c9        ret     

86ad 00        nop     
86ae f5        push    af
86af 3e0d      ld      a,$0d
86b1 cdb686    call    $86b6
86b4 f1        pop     af
86b5 c9        ret     

86b6 f5        push    af
86b7 c5        push    bc
86b8 d5        push    de
86b9 e5        push    hl
86ba fde5      push    iy
86bc 4f        ld      c,a
86bd cd6599    call    $9965
86c0 fd21f687  ld      iy,$87f6
86c4 cdda8e    call    $8eda
86c7 47        ld      b,a
86c8 3e18      ld      a,$18
86ca 90        sub     b
86cb 2813      jr      z,$86e0
86cd 47        ld      b,a
86ce cde839    call    $39e8
86d1 fe01      cp      $01
86d3 2802      jr      z,$86d7
86d5 10f7      djnz    $86ce
86d7 79        ld      a,c
86d8 80        add     a,b
86d9 4f        ld      c,a
86da cde78e    call    $8ee7
86dd cd0c3a    call    $3a0c
86e0 79        ld      a,c
86e1 0602      ld      b,$02
86e3 90        sub     b
86e4 2813      jr      z,$86f9
86e6 47        ld      b,a
86e7 cdfa39    call    $39fa
86ea fe01      cp      $01
86ec 2802      jr      z,$86f0
86ee 10f7      djnz    $86e7
86f0 79        ld      a,c
86f1 90        sub     b
86f2 4f        ld      c,a
86f3 cde78e    call    $8ee7
86f6 cd0c3a    call    $3a0c
86f9 79        ld      a,c
86fa 32f187    ld      ($87f1),a
86fd cd0534    call    $3405
8700 fde1      pop     iy
8702 e1        pop     hl
8703 d1        pop     de
8704 c1        pop     bc
8705 f1        pop     af
8706 c9        ret     

8707 c5        push    bc
8708 47        ld      b,a
8709 3af487    ld      a,($87f4)
870c 80        add     a,b
870d feb4      cp      $b4
870f 3003      jr      nc,$8714
8711 32f487    ld      ($87f4),a
8714 c1        pop     bc
8715 c9        ret     

8716 f5        push    af
8717 b7        or      a
8718 2809      jr      z,$8723
871a feb4      cp      $b4
871c 3005      jr      nc,$8723
871e 32f487    ld      ($87f4),a
8721 1800      jr      $8723
8723 f1        pop     af
8724 c9        ret     

8725 e5        push    hl
8726 3af287    ld      a,($87f2)
8729 21f487    ld      hl,$87f4
872c 3d        dec     a
872d 86        add     a,(hl)
872e e1        pop     hl
872f c9        ret     

8730 3af487    ld      a,($87f4)
8733 c9        ret     

8734 3af287    ld      a,($87f2)
8737 c9        ret     

8738 3af187    ld      a,($87f1)
873b c9        ret     

873c 3af387    ld      a,($87f3)
873f c9        ret     

8740 32f187    ld      ($87f1),a
8743 c9        ret     

8744 32f287    ld      ($87f2),a
8747 c9        ret     

8748 cd2587    call    $8725
874b 32f387    ld      ($87f3),a
874e c9        ret     

874f 326087    ld      ($8760),a
8752 cd3087    call    $8730
8755 b9        cp      c
8756 2803      jr      z,$875b
8758 37        scf     
8759 1801      jr      $875c
875b b7        or      a
875c 3a6087    ld      a,($8760)
875f c9        ret     

8760 00        nop     
8761 c5        push    bc
8762 fe01      cp      $01
8764 2825      jr      z,$878b
8766 47        ld      b,a
8767 cd2587    call    $8725
876a b8        cp      b
876b 3007      jr      nc,$8774
876d 78        ld      a,b
876e d608      sub     $08
8770 3819      jr      c,$878b
8772 18ee      jr      $8762
8774 90        sub     b
8775 fe4e      cp      $4e
8777 3012      jr      nc,$878b
8779 cd3087    call    $8730
877c 4f        ld      c,a
877d 78        ld      a,b
877e cd1687    call    $8716
8781 78        ld      a,b
8782 91        sub     c
8783 47        ld      b,a
8784 cd3487    call    $8734
8787 90        sub     b
8788 cd4487    call    $8744
878b c1        pop     bc
878c c9        ret     

878d cd5643    call    $4356
8790 280b      jr      z,$879d
8792 3afa87    ld      a,($87fa)
8795 fe02      cp      $02
8797 3804      jr      c,$879d
8799 fe19      cp      $19
879b 3801      jr      c,$879e
879d 97        sub     a
879e c9        ret     

879f f5        push    af
87a0 cd8d87    call    $878d
87a3 b7        or      a
87a4 2804      jr      z,$87aa
87a6 3c        inc     a
87a7 32fa87    ld      ($87fa),a
87aa f1        pop     af
87ab c9        ret     

87ac f5        push    af
87ad cd8d87    call    $878d
87b0 b7        or      a
87b1 2804      jr      z,$87b7
87b3 3d        dec     a
87b4 32fa87    ld      ($87fa),a
87b7 f1        pop     af
87b8 c9        ret     

87b9 f5        push    af
87ba cd8d87    call    $878d
87bd c43204    call    nz,$0432
87c0 f1        pop     af
87c1 c9        ret     

87c2 f5        push    af
87c3 cd8d87    call    $878d
87c6 c44b04    call    nz,$044b
87c9 f1        pop     af
87ca c9        ret     

87cb d5        push    de
87cc 3afa87    ld      a,($87fa)
87cf 5f        ld      e,a
87d0 1601      ld      d,$01
87d2 cdc287    call    $87c2
87d5 cd9504    call    $0495
87d8 cd4102    call    $0241
87db 97        sub     a
87dc 32fa87    ld      ($87fa),a
87df d1        pop     de
87e0 c9        ret     

87e1 1601      ld      d,$01
87e3 cd9504    call    $0495
87e6 cd2e02    call    $022e
87e9 7b        ld      a,e
87ea 32fa87    ld      ($87fa),a
87ed cd6404    call    $0464
87f0 c9        ret     

87f1 00        nop     
87f2 00        nop     
87f3 00        nop     
87f4 00        nop     
87f5 00        nop     
87f6 00        nop     
87f7 00        nop     
87f8 00        nop     
87f9 00        nop     
87fa 00        nop     
87fb 00        nop     
87fc cd5003    call    $0350
87ff cdad89    call    $89ad
8802 dd214919  ld      ix,$1949
8806 fd21448e  ld      iy,$8e44
880a 2159d6    ld      hl,$d659
880d cd6f88    call    $886f
8810 b7        or      a
8811 2806      jr      z,$8819
8813 21f61b    ld      hl,$1bf6
8816 cdc88c    call    $8cc8
8819 cd6203    call    $0362
881c cddd89    call    $89dd
881f cdc233    call    $33c2
8822 2005      jr      nz,$8829
8824 cd9201    call    $0192
8827 180f      jr      $8838
8829 cdf533    call    $33f5
882c c4ca02    call    nz,$02ca
882f cc4f7d    call    z,$7d4f
8832 cd3c86    call    $863c
8835 cd4887    call    $8748
8838 c9        ret     

8839 e5        push    hl
883a dde5      push    ix
883c dd7e00    ld      a,(ix+$00)
883f b7        or      a
8840 2008      jr      nz,$884a
8842 e5        push    hl
8843 dde1      pop     ix
8845 cd463f    call    $3f46
8848 1821      jr      $886b
884a fde5      push    iy
884c e1        pop     hl
884d fd218c8e  ld      iy,$8e8c
8851 cd6f88    call    $886f
8854 b7        or      a
8855 2814      jr      z,$886b
8857 323c74    ld      ($743c),a
885a 4f        ld      c,a
885b 0d        dec     c
885c 2805      jr      z,$8863
885e cd3873    call    $7338
8861 18f8      jr      $885b
8863 fde5      push    iy
8865 e1        pop     hl
8866 cd5473    call    $7354
8869 3600      ld      (hl),$00
886b dde1      pop     ix
886d e1        pop     hl
886e c9        ret     

886f c5        push    bc
8870 d5        push    de
8871 e5        push    hl
8872 224589    ld      ($8945),hl
8875 3ad48e    ld      a,($8ed4)
8878 f5        push    af
8879 0600      ld      b,$00
887b fde5      push    iy
887d d1        pop     de
887e cda27f    call    $7fa2
8881 feeb      cp      $eb
8883 202e      jr      nz,$88b3
8885 cd4789    call    $8947
8888 b7        or      a
8889 2817      jr      z,$88a2
888b fe01      cp      $01
888d 2806      jr      z,$8895
888f cd998c    call    $8c99
8892 b7        or      a
8893 280d      jr      z,$88a2
8895 d5        push    de
8896 11c08d    ld      de,$8dc0
8899 cd5a8a    call    $8a5a
889c d1        pop     de
889d cde989    call    $89e9
88a0 18dc      jr      $887e
88a2 cd518c    call    $8c51
88a5 cd7f8c    call    $8c7f
88a8 79        ld      a,c
88a9 b7        or      a
88aa ca3789    jp      z,$8937
88ad cde989    call    $89e9
88b0 c33789    jp      $8937
88b3 fefb      cp      $fb
88b5 2005      jr      nz,$88bc
88b7 cde784    call    $84e7
88ba 18c2      jr      $887e
88bc fe08      cp      $08
88be 2804      jr      z,$88c4
88c0 fe7f      cp      $7f
88c2 2010      jr      nz,$88d4
88c4 78        ld      a,b
88c5 b7        or      a
88c6 2807      jr      z,$88cf
88c8 cd338a    call    $8a33
88cb 1b        dec     de
88cc 05        dec     b
88cd 18af      jr      $887e
88cf cd5402    call    $0254
88d2 18aa      jr      $887e
88d4 fe0d      cp      $0d
88d6 2804      jr      z,$88dc
88d8 fe20      cp      $20
88da 2033      jr      nz,$890f
88dc cd4789    call    $8947
88df b7        or      a
88e0 281a      jr      z,$88fc
88e2 fe01      cp      $01
88e4 281b      jr      z,$8901
88e6 cd998c    call    $8c99
88e9 fe01      cp      $01
88eb 2814      jr      z,$8901
88ed cd518c    call    $8c51
88f0 cd7f8c    call    $8c7f
88f3 79        ld      a,c
88f4 b7        or      a
88f5 2840      jr      z,$8937
88f7 cde989    call    $89e9
88fa 183b      jr      $8937
88fc cd518c    call    $8c51
88ff 1836      jr      $8937
8901 d5        push    de
8902 11c08d    ld      de,$8dc0
8905 cd5a8a    call    $8a5a
8908 d1        pop     de
8909 cde989    call    $89e9
890c c37e88    jp      $887e
890f fe1b      cp      $1b
8911 2007      jr      nz,$891a
8913 cda68c    call    $8ca6
8916 0e00      ld      c,$00
8918 181d      jr      $8937
891a cde290    call    $90e2
891d 3012      jr      nc,$8931
891f cd008a    call    $8a00
8922 da7e88    jp      c,$887e
8925 cd4583    call    $8345
8928 cdac90    call    $90ac
892b 12        ld      (de),a
892c 13        inc     de
892d 04        inc     b
892e c37e88    jp      $887e
8931 cd5402    call    $0254
8934 c37e88    jp      $887e
8937 f1        pop     af
8938 57        ld      d,a
8939 3ad48e    ld      a,($8ed4)
893c 92        sub     d
893d 47        ld      b,a
893e 79        ld      a,c
893f e1        pop     hl
8940 d1        pop     de
8941 e3        ex      (sp),hl
8942 4d        ld      c,l
8943 e1        pop     hl
8944 c9        ret     

8945 00        nop     
8946 00        nop     
8947 fde5      push    iy
8949 dde5      push    ix
894b 0e01      ld      c,$01
894d cd8889    call    $8988
8950 280c      jr      z,$895e
8952 cd3873    call    $7338
8955 0c        inc     c
8956 dd7e00    ld      a,(ix+$00)
8959 b7        or      a
895a 2825      jr      z,$8981
895c 18ef      jr      $894d
895e dde5      push    ix
8960 e1        pop     hl
8961 cd3873    call    $7338
8964 dd7e00    ld      a,(ix+$00)
8967 b7        or      a
8968 2805      jr      z,$896f
896a cd8889    call    $8988
896d 2803      jr      z,$8972
896f 97        sub     a
8970 1811      jr      $8983
8972 e5        push    hl
8973 78        ld      a,b
8974 cd8d90    call    $908d
8977 3eff      ld      a,$ff
8979 be        cp      (hl)
897a e1        pop     hl
897b 28f2      jr      z,$896f
897d 3e01      ld      a,$01
897f 1802      jr      $8983
8981 3e02      ld      a,$02
8983 dde1      pop     ix
8985 fde1      pop     iy
8987 c9        ret     

8988 dde5      push    ix
898a fde5      push    iy
898c c5        push    bc
898d 04        inc     b
898e 05        dec     b
898f 2816      jr      z,$89a7
8991 dd7e00    ld      a,(ix+$00)
8994 dd23      inc     ix
8996 cdb390    call    $90b3
8999 4f        ld      c,a
899a fd7e00    ld      a,(iy+$00)
899d cdb390    call    $90b3
89a0 b9        cp      c
89a1 2004      jr      nz,$89a7
89a3 fd23      inc     iy
89a5 18e7      jr      $898e
89a7 c1        pop     bc
89a8 fde1      pop     iy
89aa dde1      pop     ix
89ac c9        ret     

89ad c5        push    bc
89ae d5        push    de
89af cd528a    call    $8a52
89b2 cdd589    call    $89d5
89b5 cd7402    call    $0274
89b8 164f      ld      d,$4f
89ba 1e01      ld      e,$01
89bc cd9504    call    $0495
89bf 97        sub     a
89c0 cd9b03    call    $039b
89c3 cdd589    call    $89d5
89c6 11d68d    ld      de,$8dd6
89c9 0e09      ld      c,$09
89cb cd0500    call    $0005
89ce 97        sub     a
89cf 32d48e    ld      ($8ed4),a
89d2 d1        pop     de
89d3 c1        pop     bc
89d4 c9        ret     

89d5 1601      ld      d,$01
89d7 1e01      ld      e,$01
89d9 cd9504    call    $0495
89dc c9        ret     

89dd f5        push    af
89de cdc233    call    $33c2
89e1 c42c3d    call    nz,$3d2c
89e4 cd4a8a    call    $8a4a
89e7 f1        pop     af
89e8 c9        ret     

89e9 c5        push    bc
89ea d5        push    de
89eb cd528a    call    $8a52
89ee 3ad48e    ld      a,($8ed4)
89f1 c609      add     a,$09
89f3 57        ld      d,a
89f4 1e01      ld      e,$01
89f6 cd9504    call    $0495
89f9 d1        pop     de
89fa c1        pop     bc
89fb c9        ret     

89fc 32d48e    ld      ($8ed4),a
89ff c9        ret     

8a00 32138e    ld      ($8e13),a
8a03 3ad48e    ld      a,($8ed4)
8a06 3c        inc     a
8a07 fe46      cp      $46
8a09 3808      jr      c,$8a13
8a0b d5        push    de
8a0c cd5402    call    $0254
8a0f d1        pop     de
8a10 37        scf     
8a11 1804      jr      $8a17
8a13 32d48e    ld      ($8ed4),a
8a16 b7        or      a
8a17 3a138e    ld      a,($8e13)
8a1a c9        ret     

8a1b c5        push    bc
8a1c 47        ld      b,a
8a1d 3ad48e    ld      a,($8ed4)
8a20 80        add     a,b
8a21 fe46      cp      $46
8a23 3808      jr      c,$8a2d
8a25 d5        push    de
8a26 cd5402    call    $0254
8a29 d1        pop     de
8a2a 37        scf     
8a2b 1804      jr      $8a31
8a2d 32d48e    ld      ($8ed4),a
8a30 b7        or      a
8a31 c1        pop     bc
8a32 c9        ret     

8a33 cd3c03    call    $033c
8a36 3ad48e    ld      a,($8ed4)
8a39 3d        dec     a
8a3a 32d48e    ld      ($8ed4),a
8a3d c9        ret     

8a3e d5        push    de
8a3f 110201    ld      de,$0102
8a42 cd9504    call    $0495
8a45 cd8b03    call    $038b
8a48 d1        pop     de
8a49 c9        ret     

8a4a f5        push    af
8a4b 3e01      ld      a,$01
8a4d cd3204    call    $0432
8a50 f1        pop     af
8a51 c9        ret     

8a52 f5        push    af
8a53 3e01      ld      a,$01
8a55 cd4b04    call    $044b
8a58 f1        pop     af
8a59 c9        ret     

8a5a e5        push    hl
8a5b dde5      push    ix
8a5d fde5      push    iy
8a5f d5        push    de
8a60 dde1      pop     ix
8a62 cdf73e    call    $3ef7
8a65 cd6202    call    $0262
8a68 cd6202    call    $0262
8a6b 223a8e    ld      ($8e3a),hl
8a6e ed5bd58e  ld      de,($8ed5)
8a72 ed533c8e  ld      ($8e3c),de
8a76 110000    ld      de,$0000
8a79 97        sub     a
8a7a 32428e    ld      ($8e42),a
8a7d e5        push    hl
8a7e dde1      pop     ix
8a80 cdf18b    call    $8bf1
8a83 13        inc     de
8a84 30fa      jr      nc,$8a80
8a86 cb43      bit     0,e
8a88 2005      jr      nz,$8a8f
8a8a 3e01      ld      a,$01
8a8c 32428e    ld      ($8e42),a
8a8f 3f        ccf     
8a90 cb1a      rr      d
8a92 cb1b      rr      e
8a94 dde5      push    ix
8a96 e1        pop     hl
8a97 dd213a8e  ld      ix,$8e3a
8a9b 7c        ld      a,h
8a9c ddbe01    cp      (ix+$01)
8a9f 2004      jr      nz,$8aa5
8aa1 7d        ld      a,l
8aa2 ddbe00    cp      (ix+$00)
8aa5 200b      jr      nz,$8ab2
8aa7 11058e    ld      de,$8e05
8aaa 0e09      ld      c,$09
8aac cd0500    call    $0005
8aaf c3c28b    jp      $8bc2
8ab2 7a        ld      a,d
8ab3 b3        or      e
8ab4 202a      jr      nz,$8ae0
8ab6 dd2a3c8e  ld      ix,($8e3c)
8aba dd22d58e  ld      ($8ed5),ix
8abe dd2a3a8e  ld      ix,($8e3a)
8ac2 cd8889    call    $8988
8ac5 2806      jr      z,$8acd
8ac7 cdf18b    call    $8bf1
8aca b7        or      a
8acb 28da      jr      z,$8aa7
8acd 0e00      ld      c,$00
8acf 21148e    ld      hl,$8e14
8ad2 cdcd8b    call    $8bcd
8ad5 3624      ld      (hl),$24
8ad7 cd388c    call    $8c38
8ada cd768d    call    $8d76
8add c3c28b    jp      $8bc2
8ae0 cd138c    call    $8c13
8ae3 1b        dec     de
8ae4 7a        ld      a,d
8ae5 b3        or      e
8ae6 20f8      jr      nz,$8ae0
8ae8 223e8e    ld      ($8e3e),hl
8aeb dd2ad58e  ld      ix,($8ed5)
8aef dd2b      dec     ix
8af1 dd22408e  ld      ($8e40),ix
8af5 dd2a3c8e  ld      ix,($8e3c)
8af9 dd22d58e  ld      ($8ed5),ix
8afd dd2a3a8e  ld      ix,($8e3a)
8b01 3e00      ld      a,$00
8b03 32438e    ld      ($8e43),a
8b06 0e00      ld      c,$00
8b08 21148e    ld      hl,$8e14
8b0b cdcd8b    call    $8bcd
8b0e 3624      ld      (hl),$24
8b10 3a438e    ld      a,($8e43)
8b13 cb47      bit     0,a
8b15 280c      jr      z,$8b23
8b17 3c        inc     a
8b18 32438e    ld      ($8e43),a
8b1b cd388c    call    $8c38
8b1e cd768d    call    $8d76
8b21 1818      jr      $8b3b
8b23 3c        inc     a
8b24 32438e    ld      ($8e43),a
8b27 79        ld      a,c
8b28 cd388c    call    $8c38
8b2b cd768d    call    $8d76
8b2e 1e09      ld      e,$09
8b30 0e02      ld      c,$02
8b32 cd0500    call    $0005
8b35 c608      add     a,$08
8b37 fe28      cp      $28
8b39 38f3      jr      c,$8b2e
8b3b 3a438e    ld      a,($8e43)
8b3e cb47      bit     0,a
8b40 281a      jr      z,$8b5c
8b42 dd223a8e  ld      ($8e3a),ix
8b46 dd2ad58e  ld      ix,($8ed5)
8b4a dd223c8e  ld      ($8e3c),ix
8b4e dd2a408e  ld      ix,($8e40)
8b52 dd22d58e  ld      ($8ed5),ix
8b56 dd2a3e8e  ld      ix,($8e3e)
8b5a 1840      jr      $8b9c
8b5c 3a428e    ld      a,($8e42)
8b5f cb47      bit     0,a
8b61 2817      jr      z,$8b7a
8b63 dde5      push    ix
8b65 dd2ad58e  ld      ix,($8ed5)
8b69 dd22408e  ld      ($8e40),ix
8b6d dde1      pop     ix
8b6f dd223e8e  ld      ($8e3e),ix
8b73 cdf18b    call    $8bf1
8b76 384a      jr      c,$8bc2
8b78 180c      jr      $8b86
8b7a dd223e8e  ld      ($8e3e),ix
8b7e dd2ad58e  ld      ix,($8ed5)
8b82 dd22408e  ld      ($8e40),ix
8b86 dd2a3c8e  ld      ix,($8e3c)
8b8a dd22d58e  ld      ($8ed5),ix
8b8e dd2a3a8e  ld      ix,($8e3a)
8b92 3a438e    ld      a,($8e43)
8b95 fe28      cp      $28
8b97 280f      jr      z,$8ba8
8b99 cd6202    call    $0262
8b9c cdf18b    call    $8bf1
8b9f dd7e00    ld      a,(ix+$00)
8ba2 b7        or      a
8ba3 281d      jr      z,$8bc2
8ba5 c3068b    jp      $8b06
8ba8 cde03e    call    $3ee0
8bab 2815      jr      z,$8bc2
8bad d5        push    de
8bae 1601      ld      d,$01
8bb0 1e04      ld      e,$04
8bb2 cd9504    call    $0495
8bb5 d1        pop     de
8bb6 cd8b03    call    $038b
8bb9 cd6202    call    $0262
8bbc 97        sub     a
8bbd 32438e    ld      ($8e43),a
8bc0 18da      jr      $8b9c
8bc2 3e00      ld      a,$00
8bc4 32d98e    ld      ($8ed9),a
8bc7 fde1      pop     iy
8bc9 dde1      pop     ix
8bcb e1        pop     hl
8bcc c9        ret     

8bcd f5        push    af
8bce d5        push    de
8bcf dde5      push    ix
8bd1 cd5473    call    $7354
8bd4 3ad98e    ld      a,($8ed9)
8bd7 b7        or      a
8bd8 2812      jr      z,$8bec
8bda dd2ad58e  ld      ix,($8ed5)
8bde dd5e00    ld      e,(ix+$00)
8be1 1600      ld      d,$00
8be3 dd2ad78e  ld      ix,($8ed7)
8be7 dd19      add     ix,de
8be9 cd5473    call    $7354
8bec dde1      pop     ix
8bee d1        pop     de
8bef f1        pop     af
8bf0 c9        ret     

8bf1 cd3873    call    $7338
8bf4 3ad98e    ld      a,($8ed9)
8bf7 b7        or      a
8bf8 280b      jr      z,$8c05
8bfa d5        push    de
8bfb ed5bd58e  ld      de,($8ed5)
8bff 13        inc     de
8c00 ed53d58e  ld      ($8ed5),de
8c04 d1        pop     de
8c05 dd7e00    ld      a,(ix+$00)
8c08 b7        or      a
8c09 2806      jr      z,$8c11
8c0b cd8889    call    $8988
8c0e c8        ret     z

8c0f 18e0      jr      $8bf1
8c11 37        scf     
8c12 c9        ret     

8c13 cd4573    call    $7345
8c16 3ad98e    ld      a,($8ed9)
8c19 b7        or      a
8c1a 280b      jr      z,$8c27
8c1c d5        push    de
8c1d ed5bd58e  ld      de,($8ed5)
8c21 1b        dec     de
8c22 ed53d58e  ld      ($8ed5),de
8c26 d1        pop     de
8c27 7e        ld      a,(hl)
8c28 b7        or      a
8c29 280b      jr      z,$8c36
8c2b e5        push    hl
8c2c dde1      pop     ix
8c2e dd23      inc     ix
8c30 cd8889    call    $8988
8c33 c8        ret     z

8c34 18dd      jr      $8c13
8c36 37        scf     
8c37 c9        ret     

8c38 f5        push    af
8c39 21148e    ld      hl,$8e14
8c3c 23        inc     hl
8c3d 1804      jr      $8c43
8c3f f5        push    af
8c40 21148e    ld      hl,$8e14
8c43 7e        ld      a,(hl)
8c44 fe24      cp      $24
8c46 2807      jr      z,$8c4f
8c48 cdb390    call    $90b3
8c4b 77        ld      (hl),a
8c4c 23        inc     hl
8c4d 18f4      jr      $8c43
8c4f f1        pop     af
8c50 c9        ret     

8c51 f5        push    af
8c52 c5        push    bc
8c53 d5        push    de
8c54 dde5      push    ix
8c56 78        ld      a,b
8c57 cd8d90    call    $908d
8c5a 54        ld      d,h
8c5b 5d        ld      e,l
8c5c e5        push    hl
8c5d dde1      pop     ix
8c5f 21148e    ld      hl,$8e14
8c62 0e01      ld      c,$01
8c64 cd5473    call    $7354
8c67 3620      ld      (hl),$20
8c69 23        inc     hl
8c6a 3624      ld      (hl),$24
8c6c 3ad48e    ld      a,($8ed4)
8c6f 81        add     a,c
8c70 32d48e    ld      ($8ed4),a
8c73 cd3f8c    call    $8c3f
8c76 cd768d    call    $8d76
8c79 dde1      pop     ix
8c7b d1        pop     de
8c7c c1        pop     bc
8c7d f1        pop     af
8c7e c9        ret     

8c7f f5        push    af
8c80 dde5      push    ix
8c82 dd21eb8d  ld      ix,$8deb
8c86 cdf73e    call    $3ef7
8c89 cd743f    call    $3f74
8c8c 3805      jr      c,$8c93
8c8e 2005      jr      nz,$8c95
8c90 cda68c    call    $8ca6
8c93 0e00      ld      c,$00
8c95 dde1      pop     ix
8c97 f1        pop     af
8c98 c9        ret     

8c99 cd338a    call    $8a33
8c9c 05        dec     b
8c9d 1b        dec     de
8c9e cd4789    call    $8947
8ca1 fe02      cp      $02
8ca3 28f4      jr      z,$8c99
8ca5 c9        ret     

8ca6 c5        push    bc
8ca7 d5        push    de
8ca8 cde989    call    $89e9
8cab 1608      ld      d,$08
8cad 1e01      ld      e,$01
8caf cd9504    call    $0495
8cb2 cd7402    call    $0274
8cb5 11df8d    ld      de,$8ddf
8cb8 0e09      ld      c,$09
8cba cd0500    call    $0005
8cbd cd5402    call    $0254
8cc0 3e01      ld      a,$01
8cc2 cdf33f    call    $3ff3
8cc5 d1        pop     de
8cc6 c1        pop     bc
8cc7 c9        ret     

8cc8 3d        dec     a
8cc9 cb27      sla     a
8ccb cd8d90    call    $908d
8cce 7e        ld      a,(hl)
8ccf 23        inc     hl
8cd0 66        ld      h,(hl)
8cd1 6f        ld      l,a
8cd2 e9        jp      (hl)
8cd3 04        inc     b
8cd4 1001      djnz    $8cd7
8cd6 c9        ret     

8cd7 cd338a    call    $8a33
8cda 18f8      jr      $8cd4
8cdc d5        push    de
8cdd e5        push    hl
8cde 0600      ld      b,$00
8ce0 fde5      push    iy
8ce2 e1        pop     hl
8ce3 cd3d81    call    $813d
8ce6 3003      jr      nc,$8ceb
8ce8 97        sub     a
8ce9 1831      jr      $8d1c
8ceb fe08      cp      $08
8ced 2804      jr      z,$8cf3
8cef fe7f      cp      $7f
8cf1 2005      jr      nz,$8cf8
8cf3 cd1f8d    call    $8d1f
8cf6 18eb      jr      $8ce3
8cf8 fe0d      cp      $0d
8cfa 2807      jr      z,$8d03
8cfc b9        cp      c
8cfd 2804      jr      z,$8d03
8cff fe20      cp      $20
8d01 200a      jr      nz,$8d0d
8d03 cd2e8d    call    $8d2e
8d06 2014      jr      nz,$8d1c
8d08 cd5402    call    $0254
8d0b 18d6      jr      $8ce3
8d0d cde290    call    $90e2
8d10 3005      jr      nc,$8d17
8d12 cd3f8d    call    $8d3f
8d15 18cc      jr      $8ce3
8d17 cd5402    call    $0254
8d1a 18c7      jr      $8ce3
8d1c e1        pop     hl
8d1d d1        pop     de
8d1e c9        ret     

8d1f 78        ld      a,b
8d20 b7        or      a
8d21 2807      jr      z,$8d2a
8d23 cd338a    call    $8a33
8d26 05        dec     b
8d27 2b        dec     hl
8d28 1803      jr      $8d2d
8d2a cd5402    call    $0254
8d2d c9        ret     

8d2e 78        ld      a,b
8d2f b7        or      a
8d30 280c      jr      z,$8d3e
8d32 cd008a    call    $8a00
8d35 3805      jr      c,$8d3c
8d37 3e20      ld      a,$20
8d39 cd4583    call    $8345
8d3c 3600      ld      (hl),$00
8d3e c9        ret     

8d3f f5        push    af
8d40 78        ld      a,b
8d41 fe08      cp      $08
8d43 381c      jr      c,$8d61
8d45 c5        push    bc
8d46 e5        push    hl
8d47 2b        dec     hl
8d48 010300    ld      bc,$0003
8d4b 3e2e      ld      a,$2e
8d4d edb9      cpdr    
8d4f e1        pop     hl
8d50 c1        pop     bc
8d51 280e      jr      z,$8d61
8d53 f1        pop     af
8d54 fe2e      cp      $2e
8d56 201a      jr      nz,$8d72
8d58 78        ld      a,b
8d59 fe08      cp      $08
8d5b 2015      jr      nz,$8d72
8d5d 3e2e      ld      a,$2e
8d5f 1801      jr      $8d62
8d61 f1        pop     af
8d62 cd008a    call    $8a00
8d65 380b      jr      c,$8d72
8d67 cd4583    call    $8345
8d6a cdac90    call    $90ac
8d6d 77        ld      (hl),a
8d6e 23        inc     hl
8d6f 04        inc     b
8d70 1803      jr      $8d75
8d72 cd5402    call    $0254
8d75 c9        ret     

8d76 11148e    ld      de,$8e14
8d79 0e09      ld      c,$09
8d7b cd0500    call    $0005
8d7e c9        ret     

8d7f cd3487    call    $8734
8d82 32a58d    ld      ($8da5),a
8d85 cd3887    call    $8738
8d88 32a68d    ld      ($8da6),a
8d8b cd3087    call    $8730
8d8e 32a78d    ld      ($8da7),a
8d91 c9        ret     

8d92 3aa58d    ld      a,($8da5)
8d95 cd4487    call    $8744
8d98 3aa68d    ld      a,($8da6)
8d9b cd4087    call    $8740
8d9e 3aa78d    ld      a,($8da7)
8da1 cd1687    call    $8716
8da4 c9        ret     

8da5 00        nop     
8da6 00        nop     
8da7 00        nop     
8da8 d5        push    de
8da9 e5        push    hl
8daa 0600      ld      b,$00
8dac 7e        ld      a,(hl)
8dad fe24      cp      $24
8daf 280c      jr      z,$8dbd
8db1 cd008a    call    $8a00
8db4 3807      jr      c,$8dbd
8db6 cd4583    call    $8345
8db9 23        inc     hl
8dba 04        inc     b
8dbb 18ef      jr      $8dac
8dbd e1        pop     hl
8dbe d1        pop     de
8dbf c9        ret     

8dc0 4f        ld      c,a
8dc1 6e        ld      l,(hl)
8dc2 65        ld      h,l
8dc3 206f      jr      nz,$8e34
8dc5 66        ld      h,(hl)
8dc6 2074      jr      nz,$8e3c
8dc8 68        ld      l,b
8dc9 65        ld      h,l
8dca 2066      jr      nz,$8e32
8dcc 6f        ld      l,a
8dcd 6c        ld      l,h
8dce 6c        ld      l,h
8dcf 6f        ld      l,a
8dd0 77        ld      (hl),a
8dd1 69        ld      l,c
8dd2 6e        ld      l,(hl)
8dd3 67        ld      h,a
8dd4 3a2443    ld      a,($4324)
8dd7 4f        ld      c,a
8dd8 4d        ld      c,l
8dd9 4d        ld      c,l
8dda 41        ld      b,c
8ddb 4e        ld      c,(hl)
8ddc 44        ld      b,h
8ddd 3a2420    ld      a,($2024)
8de0 43        ld      b,e
8de1 41        ld      b,c
8de2 4e        ld      c,(hl)
8de3 43        ld      b,e
8de4 45        ld      b,l
8de5 4c        ld      c,h
8de6 4c        ld      c,h
8de7 45        ld      b,l
8de8 44        ld      b,h
8de9 2e24      ld      l,$24
8deb 49        ld      c,c
8dec 73        ld      (hl),e
8ded 2074      jr      nz,$8e63
8def 68        ld      l,b
8df0 61        ld      h,c
8df1 74        ld      (hl),h
8df2 2077      jr      nz,$8e6b
8df4 68        ld      l,b
8df5 61        ld      h,c
8df6 74        ld      (hl),h
8df7 2079      jr      nz,$8e72
8df9 6f        ld      l,a
8dfa 75        ld      (hl),l
8dfb 206d      jr      nz,$8e6a
8dfd 65        ld      h,l
8dfe 61        ld      h,c
8dff 6e        ld      l,(hl)
8e00 74        ld      (hl),h
8e01 3f        ccf     
8e02 0d        dec     c
8e03 0a        ld      a,(bc)
8e04 24        inc     h
8e05 2a2a2a    ld      hl,($2a2a)
8e08 2065      jr      nz,$8e6f
8e0a 6d        ld      l,l
8e0b 70        ld      (hl),b
8e0c 74        ld      (hl),h
8e0d 79        ld      a,c
8e0e 202a      jr      nz,$8e3a
8e10 2a2a24    ld      hl,($242a)
8e13 00        nop     
8e14 00        nop     
8e15 00        nop     
8e16 00        nop     
8e17 00        nop     
8e18 00        nop     
8e19 00        nop     
8e1a 00        nop     
8e1b 00        nop     
8e1c 00        nop     
8e1d 00        nop     
8e1e 00        nop     
8e1f 00        nop     
8e20 00        nop     
8e21 00        nop     
8e22 00        nop     
8e23 00        nop     
8e24 00        nop     
8e25 00        nop     
8e26 00        nop     
8e27 00        nop     
8e28 00        nop     
8e29 00        nop     
8e2a 00        nop     
8e2b 00        nop     
8e2c 00        nop     
8e2d 00        nop     
8e2e 00        nop     
8e2f 00        nop     
8e30 00        nop     
8e31 00        nop     
8e32 00        nop     
8e33 00        nop     
8e34 00        nop     
8e35 00        nop     
8e36 00        nop     
8e37 00        nop     
8e38 00        nop     
8e39 00        nop     
8e3a 00        nop     
8e3b 00        nop     
8e3c 00        nop     
8e3d 00        nop     
8e3e 00        nop     
8e3f 00        nop     
8e40 00        nop     
8e41 00        nop     
8e42 00        nop     
8e43 00        nop     
8e44 00        nop     
8e45 00        nop     
8e46 00        nop     
8e47 00        nop     
8e48 00        nop     
8e49 00        nop     
8e4a 00        nop     
8e4b 00        nop     
8e4c 00        nop     
8e4d 00        nop     
8e4e 00        nop     
8e4f 00        nop     
8e50 00        nop     
8e51 00        nop     
8e52 00        nop     
8e53 00        nop     
8e54 00        nop     
8e55 00        nop     
8e56 00        nop     
8e57 00        nop     
8e58 00        nop     
8e59 00        nop     
8e5a 00        nop     
8e5b 00        nop     
8e5c 00        nop     
8e5d 00        nop     
8e5e 00        nop     
8e5f 00        nop     
8e60 00        nop     
8e61 00        nop     
8e62 00        nop     
8e63 00        nop     
8e64 00        nop     
8e65 00        nop     
8e66 00        nop     
8e67 00        nop     
8e68 00        nop     
8e69 00        nop     
8e6a 00        nop     
8e6b 00        nop     
8e6c 00        nop     
8e6d 00        nop     
8e6e 00        nop     
8e6f 00        nop     
8e70 00        nop     
8e71 00        nop     
8e72 00        nop     
8e73 00        nop     
8e74 00        nop     
8e75 00        nop     
8e76 00        nop     
8e77 00        nop     
8e78 00        nop     
8e79 00        nop     
8e7a 00        nop     
8e7b 00        nop     
8e7c 00        nop     
8e7d 00        nop     
8e7e 00        nop     
8e7f 00        nop     
8e80 00        nop     
8e81 00        nop     
8e82 00        nop     
8e83 00        nop     
8e84 00        nop     
8e85 00        nop     
8e86 00        nop     
8e87 00        nop     
8e88 00        nop     
8e89 00        nop     
8e8a 00        nop     
8e8b 00        nop     
8e8c 00        nop     
8e8d 00        nop     
8e8e 00        nop     
8e8f 00        nop     
8e90 00        nop     
8e91 00        nop     
8e92 00        nop     
8e93 00        nop     
8e94 00        nop     
8e95 00        nop     
8e96 00        nop     
8e97 00        nop     
8e98 00        nop     
8e99 00        nop     
8e9a 00        nop     
8e9b 00        nop     
8e9c 00        nop     
8e9d 00        nop     
8e9e 00        nop     
8e9f 00        nop     
8ea0 00        nop     
8ea1 00        nop     
8ea2 00        nop     
8ea3 00        nop     
8ea4 00        nop     
8ea5 00        nop     
8ea6 00        nop     
8ea7 00        nop     
8ea8 00        nop     
8ea9 00        nop     
8eaa 00        nop     
8eab 00        nop     
8eac 00        nop     
8ead 00        nop     
8eae 00        nop     
8eaf 00        nop     
8eb0 00        nop     
8eb1 00        nop     
8eb2 00        nop     
8eb3 00        nop     
8eb4 00        nop     
8eb5 00        nop     
8eb6 00        nop     
8eb7 00        nop     
8eb8 00        nop     
8eb9 00        nop     
8eba 00        nop     
8ebb 00        nop     
8ebc 00        nop     
8ebd 00        nop     
8ebe 00        nop     
8ebf 00        nop     
8ec0 00        nop     
8ec1 00        nop     
8ec2 00        nop     
8ec3 00        nop     
8ec4 00        nop     
8ec5 00        nop     
8ec6 00        nop     
8ec7 00        nop     
8ec8 00        nop     
8ec9 00        nop     
8eca 00        nop     
8ecb 00        nop     
8ecc 00        nop     
8ecd 00        nop     
8ece 00        nop     
8ecf 00        nop     
8ed0 00        nop     
8ed1 00        nop     
8ed2 00        nop     
8ed3 00        nop     
8ed4 00        nop     
8ed5 00        nop     
8ed6 00        nop     
8ed7 00        nop     
8ed8 00        nop     
8ed9 00        nop     
8eda fd7500    ld      (iy+$00),l
8edd fd7401    ld      (iy+$01),h
8ee0 fd7302    ld      (iy+$02),e
8ee3 fd7203    ld      (iy+$03),d
8ee6 c9        ret     

8ee7 fd6e00    ld      l,(iy+$00)
8eea fd6601    ld      h,(iy+$01)
8eed fd5e02    ld      e,(iy+$02)
8ef0 fd5603    ld      d,(iy+$03)
8ef3 c9        ret     

8ef4 c5        push    bc
8ef5 fd4e00    ld      c,(iy+$00)
8ef8 fd4601    ld      b,(iy+$01)
8efb 09        add     hl,bc
8efc fd4e02    ld      c,(iy+$02)
8eff fd4603    ld      b,(iy+$03)
8f02 eb        ex      de,hl
8f03 ed4a      adc     hl,bc
8f05 eb        ex      de,hl
8f06 c1        pop     bc
8f07 c9        ret     

8f08 c5        push    bc
8f09 fd4e00    ld      c,(iy+$00)
8f0c fd4601    ld      b,(iy+$01)
8f0f b7        or      a
8f10 ed42      sbc     hl,bc
8f12 fd4e02    ld      c,(iy+$02)
8f15 fd4603    ld      b,(iy+$03)
8f18 eb        ex      de,hl
8f19 ed42      sbc     hl,bc
8f1b eb        ex      de,hl
8f1c c1        pop     bc
8f1d c9        ret     

8f1e 7a        ld      a,d
8f1f fdbe03    cp      (iy+$03)
8f22 2004      jr      nz,$8f28
8f24 7b        ld      a,e
8f25 fdbe02    cp      (iy+$02)
8f28 200a      jr      nz,$8f34
8f2a 7c        ld      a,h
8f2b fdbe01    cp      (iy+$01)
8f2e 2004      jr      nz,$8f34
8f30 7d        ld      a,l
8f31 fdbe00    cp      (iy+$00)
8f34 c9        ret     

8f35 fd3400    inc     (iy+$00)
8f38 200d      jr      nz,$8f47
8f3a fd3401    inc     (iy+$01)
8f3d 2008      jr      nz,$8f47
8f3f fd3402    inc     (iy+$02)
8f42 2003      jr      nz,$8f47
8f44 fd3403    inc     (iy+$03)
8f47 c9        ret     

8f48 fd7e00    ld      a,(iy+$00)
8f4b b7        or      a
8f4c 2015      jr      nz,$8f63
8f4e fd7e01    ld      a,(iy+$01)
8f51 b7        or      a
8f52 200c      jr      nz,$8f60
8f54 fd7e02    ld      a,(iy+$02)
8f57 b7        or      a
8f58 2003      jr      nz,$8f5d
8f5a fd3503    dec     (iy+$03)
8f5d fd3502    dec     (iy+$02)
8f60 fd3501    dec     (iy+$01)
8f63 fd3500    dec     (iy+$00)
8f66 c9        ret     

8f67 fd360000  ld      (iy+$00),$00
8f6b fd360100  ld      (iy+$01),$00
8f6f fd360200  ld      (iy+$02),$00
8f73 fd360300  ld      (iy+$03),$00
8f77 c9        ret     

8f78 210000    ld      hl,$0000
8f7b 0a        ld      a,(bc)
8f7c b7        or      a
8f7d c8        ret     z

8f7e d630      sub     $30
8f80 f8        ret     m

8f81 fe0a      cp      $0a
8f83 d0        ret     nc

8f84 54        ld      d,h
8f85 5d        ld      e,l
8f86 29        add     hl,hl
8f87 29        add     hl,hl
8f88 19        add     hl,de
8f89 29        add     hl,hl
8f8a 5f        ld      e,a
8f8b 1600      ld      d,$00
8f8d 19        add     hl,de
8f8e 03        inc     bc
8f8f c37b8f    jp      $8f7b
8f92 af        xor     a
8f93 c39d8f    jp      $8f9d
8f96 3e30      ld      a,$30
8f98 c39d8f    jp      $8f9d
8f9b 3e20      ld      a,$20
8f9d 320f90    ld      ($900f),a
8fa0 221090    ld      ($9010),hl
8fa3 60        ld      h,b
8fa4 69        ld      l,c
8fa5 7c        ld      a,h
8fa6 b7        or      a
8fa7 f2b28f    jp      p,$8fb2
8faa 3e2d      ld      a,$2d
8fac cdf08f    call    $8ff0
8faf cd1290    call    $9012
8fb2 010500    ld      bc,$0005
8fb5 11f0d8    ld      de,$d8f0
8fb8 cdd78f    call    $8fd7
8fbb 1118fc    ld      de,$fc18
8fbe cdd78f    call    $8fd7
8fc1 119cff    ld      de,$ff9c
8fc4 cdd78f    call    $8fd7
8fc7 11f6ff    ld      de,$fff6
8fca cdd78f    call    $8fd7
8fcd 11ffff    ld      de,$ffff
8fd0 cdd78f    call    $8fd7
8fd3 2a1090    ld      hl,($9010)
8fd6 c9        ret     

8fd7 c5        push    bc
8fd8 062f      ld      b,$2f
8fda 04        inc     b
8fdb 19        add     hl,de
8fdc 7c        ld      a,h
8fdd 17        rla     
8fde d2da8f    jp      nc,$8fda
8fe1 eb        ex      de,hl
8fe2 cd1290    call    $9012
8fe5 19        add     hl,de
8fe6 78        ld      a,b
8fe7 c1        pop     bc
8fe8 fe30      cp      $30
8fea cafb8f    jp      z,$8ffb
8fed 0680      ld      b,$80
8fef 0d        dec     c
8ff0 e5        push    hl
8ff1 2a1090    ld      hl,($9010)
8ff4 77        ld      (hl),a
8ff5 23        inc     hl
8ff6 221090    ld      ($9010),hl
8ff9 e1        pop     hl
8ffa c9        ret     

8ffb 80        add     a,b
8ffc f20390    jp      p,$9003
8fff 90        sub     b
9000 c3ef8f    jp      $8fef
9003 0d        dec     c
9004 caff8f    jp      z,$8fff
9007 3a0f90    ld      a,($900f)
900a b7        or      a
900b c2f08f    jp      nz,$8ff0
900e c9        ret     

900f 00        nop     
9010 00        nop     
9011 00        nop     
9012 cd1790    call    $9017
9015 23        inc     hl
9016 c9        ret     

9017 7c        ld      a,h
9018 2f        cpl     
9019 67        ld      h,a
901a 7d        ld      a,l
901b 2f        cpl     
901c 6f        ld      l,a
901d c9        ret     

901e 7a        ld      a,d
901f bc        cp      h
9020 c0        ret     nz

9021 7b        ld      a,e
9022 bd        cp      l
9023 c9        ret     

9024 c5        push    bc
9025 010000    ld      bc,$0000
9028 0c        inc     c
9029 dde3      ex      (sp),ix
902b dde3      ex      (sp),ix
902d 20f9      jr      nz,$9028
902f 04        inc     b
9030 20f6      jr      nz,$9028
9032 3c        inc     a
9033 20f3      jr      nz,$9028
9035 c1        pop     bc
9036 c9        ret     

9037 c5        push    bc
9038 0e00      ld      c,$00
903a 069c      ld      b,$9c
903c 0c        inc     c
903d 20fd      jr      nz,$903c
903f 04        inc     b
9040 20fa      jr      nz,$903c
9042 3c        inc     a
9043 20f3      jr      nz,$9038
9045 c1        pop     bc
9046 c9        ret     

9047 f5        push    af
9048 cd0500    call    $0005
904b f1        pop     af
904c 3c        inc     a
904d 20f8      jr      nz,$9047
904f c9        ret     

9050 dd3520    dec     (ix+$20)
9053 dd7e20    ld      a,(ix+$20)
9056 b7        or      a
9057 f0        ret     p

9058 dd362000  ld      (ix+$20),$00
905c dd7e0c    ld      a,(ix+$0c)
905f d601      sub     $01
9061 f8        ret     m

9062 d5        push    de
9063 c5        push    bc
9064 dde5      push    ix
9066 d1        pop     de
9067 0e10      ld      c,$10
9069 cd0500    call    $0005
906c feff      cp      $ff
906e 2003      jr      nz,$9073
9070 3efe      ld      a,$fe
9072 c9        ret     

9073 dd350c    dec     (ix+$0c)
9076 0e0f      ld      c,$0f
9078 cd0500    call    $0005
907b feff      cp      $ff
907d 2003      jr      nz,$9082
907f 3efd      ld      a,$fd
9081 c9        ret     

9082 dd7e0f    ld      a,(ix+$0f)
9085 3d        dec     a
9086 dd7720    ld      (ix+$20),a
9089 af        xor     a
908a c1        pop     bc
908b d1        pop     de
908c c9        ret     

908d 85        add     a,l
908e 6f        ld      l,a
908f d0        ret     nc

9090 24        inc     h
9091 c9        ret     

9092 83        add     a,e
9093 5f        ld      e,a
9094 d0        ret     nc

9095 14        inc     d
9096 c9        ret     

9097 81        add     a,c
9098 4f        ld      c,a
9099 d0        ret     nc

909a 04        inc     b
909b c9        ret     

909c c5        push    bc
909d 4f        ld      c,a
909e 0600      ld      b,$00
90a0 dd09      add     ix,bc
90a2 c1        pop     bc
90a3 c9        ret     

90a4 c5        push    bc
90a5 4f        ld      c,a
90a6 0600      ld      b,$00
90a8 fd09      add     iy,bc
90aa c1        pop     bc
90ab c9        ret     

90ac cdc190    call    $90c1
90af d0        ret     nc

90b0 d620      sub     $20
90b2 c9        ret     

90b3 cdba90    call    $90ba
90b6 d0        ret     nc

90b7 c620      add     a,$20
90b9 c9        ret     

90ba fe41      cp      $41
90bc 3f        ccf     
90bd d0        ret     nc

90be fe5b      cp      $5b
90c0 c9        ret     

90c1 fe61      cp      $61
90c3 3f        ccf     
90c4 d0        ret     nc

90c5 fe7b      cp      $7b
90c7 c9        ret     

90c8 cdba90    call    $90ba
90cb d8        ret     c

90cc cdc190    call    $90c1
90cf c9        ret     

90d0 fe30      cp      $30
90d2 3f        ccf     
90d3 d0        ret     nc

90d4 fe3a      cp      $3a
90d6 c9        ret     

90d7 cdd090    call    $90d0
90da d8        ret     c

90db fe41      cp      $41
90dd 3f        ccf     
90de d0        ret     nc

90df fe47      cp      $47
90e1 c9        ret     

90e2 fe20      cp      $20
90e4 3805      jr      c,$90eb
90e6 fe7f      cp      $7f
90e8 3001      jr      nc,$90eb
90ea c9        ret     

90eb b7        or      a
90ec c9        ret     

90ed c5        push    bc
90ee 04        inc     b
90ef 1002      djnz    $90f3
90f1 1804      jr      $90f7
90f3 cb27      sla     a
90f5 18f8      jr      $90ef
90f7 c1        pop     bc
90f8 c9        ret     

90f9 c5        push    bc
90fa 04        inc     b
90fb 1002      djnz    $90ff
90fd 1804      jr      $9103
90ff cb3f      srl     a
9101 18f8      jr      $90fb
9103 c1        pop     bc
9104 c9        ret     

9105 c5        push    bc
9106 04        inc     b
9107 1002      djnz    $910b
9109 1803      jr      $910e
910b 07        rlca    
910c 18f9      jr      $9107
910e c1        pop     bc
910f c9        ret     

9110 c5        push    bc
9111 04        inc     b
9112 1002      djnz    $9116
9114 1803      jr      $9119
9116 0f        rrca    
9117 18f9      jr      $9112
9119 c1        pop     bc
911a c9        ret     

911b c5        push    bc
911c 0600      ld      b,$00
911e 4f        ld      c,a
911f b7        or      a
9120 ed42      sbc     hl,bc
9122 c1        pop     bc
9123 c9        ret     

9124 e5        push    hl
9125 60        ld      h,b
9126 69        ld      l,c
9127 0600      ld      b,$00
9129 4f        ld      c,a
912a b7        or      a
912b ed42      sbc     hl,bc
912d 44        ld      b,h
912e 4d        ld      c,l
912f e1        pop     hl
9130 c9        ret     

9131 e5        push    hl
9132 62        ld      h,d
9133 6b        ld      l,e
9134 1600      ld      d,$00
9136 5f        ld      e,a
9137 b7        or      a
9138 ed52      sbc     hl,de
913a 54        ld      d,h
913b 5d        ld      e,l
913c e1        pop     hl
913d c9        ret     

913e e5        push    hl
913f c5        push    bc
9140 dde5      push    ix
9142 e1        pop     hl
9143 0600      ld      b,$00
9145 4f        ld      c,a
9146 b7        or      a
9147 ed42      sbc     hl,bc
9149 e5        push    hl
914a dde1      pop     ix
914c c1        pop     bc
914d e1        pop     hl
914e c9        ret     

914f e5        push    hl
9150 c5        push    bc
9151 fde5      push    iy
9153 e1        pop     hl
9154 0600      ld      b,$00
9156 4f        ld      c,a
9157 b7        or      a
9158 ed42      sbc     hl,bc
915a e5        push    hl
915b fde1      pop     iy
915d c1        pop     bc
915e e1        pop     hl
915f c9        ret     

9160 cd7403    call    $0374
9163 cd4f20    call    $204f
9166 324e20    ld      ($204e),a
9169 c640      add     a,$40
916b 32e865    ld      ($65e8),a
916e cd2192    call    $9221
9171 303c      jr      nc,$91af
9173 cd5192    call    $9251
9176 3805      jr      c,$917d
9178 11dc91    ld      de,$91dc
917b 1827      jr      $91a4
917d cdb01c    call    $1cb0
9180 3805      jr      c,$9187
9182 11bd91    ld      de,$91bd
9185 181d      jr      $91a4
9187 cd5d65    call    $655d
918a 381d      jr      c,$91a9
918c cd9f04    call    $049f
918f 0e82      ld      c,$82
9191 11ffff    ld      de,$ffff
9194 cd0500    call    $0005
9197 11000e    ld      de,$0e00
919a cd9504    call    $0495
919d cde497    call    $97e4
91a0 cd7767    call    $6777
91a3 c9        ret     

91a4 0e09      ld      c,$09
91a6 cd0500    call    $0005
91a9 11000d    ld      de,$0d00
91ac cd9504    call    $0495
91af cd6202    call    $0262
91b2 110a92    ld      de,$920a
91b5 0e09      ld      c,$09
91b7 cd0500    call    $0005
91ba c30000    jp      $0000
91bd 55        ld      d,l
91be 6e        ld      l,(hl)
91bf 61        ld      h,c
91c0 62        ld      h,d
91c1 6c        ld      l,h
91c2 65        ld      h,l
91c3 2074      jr      nz,$9239
91c5 6f        ld      l,a
91c6 2072      jr      nz,$923a
91c8 65        ld      h,l
91c9 61        ld      h,c
91ca 64        ld      h,h
91cb 2064      jr      nz,$9231
91cd 69        ld      l,c
91ce 73        ld      (hl),e
91cf 6b        ld      l,e
91d0 2064      jr      nz,$9236
91d2 69        ld      l,c
91d3 72        ld      (hl),d
91d4 65        ld      h,l
91d5 63        ld      h,e
91d6 74        ld      (hl),h
91d7 6f        ld      l,a
91d8 72        ld      (hl),d
91d9 79        ld      a,c
91da 2e24      ld      l,$24
91dc 54        ld      d,h
91dd 65        ld      h,l
91de 72        ld      (hl),d
91df 6d        ld      l,l
91e0 69        ld      l,c
91e1 6e        ld      l,(hl)
91e2 61        ld      h,c
91e3 6c        ld      l,h
91e4 206d      jr      nz,$9253
91e6 75        ld      (hl),l
91e7 73        ld      (hl),e
91e8 74        ld      (hl),h
91e9 2062      jr      nz,$924d
91eb 65        ld      h,l
91ec 2043      jr      nz,$9231
91ee 72        ld      (hl),d
91ef 6f        ld      l,a
91f0 6d        ld      l,l
91f1 65        ld      h,l
91f2 6d        ld      l,l
91f3 63        ld      h,e
91f4 6f        ld      l,a
91f5 2033      jr      nz,$922a
91f7 313032    ld      sp,$3230
91fa 2c        inc     l
91fb 2043      jr      nz,$9240
91fd 2d        dec     l
91fe 31302c    ld      sp,$2c30
9201 206f      jr      nz,$9272
9203 72        ld      (hl),d
9204 2043      jr      nz,$9249
9206 2d        dec     l
9207 312e24    ld      sp,$242e
920a 57        ld      d,a
920b 72        ld      (hl),d
920c 69        ld      l,c
920d 74        ld      (hl),h
920e 65        ld      h,l
920f 4d        ld      c,l
9210 61        ld      h,c
9211 73        ld      (hl),e
9212 74        ld      (hl),h
9213 65        ld      h,l
9214 72        ld      (hl),d
9215 2061      jr      nz,$9278
9217 62        ld      h,d
9218 6f        ld      l,a
9219 72        ld      (hl),d
921a 74        ld      (hl),h
921b 65        ld      h,l
921c 64        ld      h,h
921d 2e0d      ld      l,$0d
921f 0a        ld      a,(bc)
9220 24        inc     h
9221 0e8d      ld      c,$8d
9223 cd0500    call    $0005
9226 fe02      cp      $02
9228 2008      jr      nz,$9232
922a cd1c93    call    $931c
922d cd1635    call    $3516
9230 181d      jr      $924f
9232 fe03      cp      $03
9234 200e      jr      nz,$9244
9236 3e06      ld      a,$06
9238 213780    ld      hl,$8037
923b 77        ld      (hl),a
923c 211b80    ld      hl,$801b
923f 77        ld      (hl),a
9240 21e592    ld      hl,$92e5
9243 77        ld      (hl),a
9244 210400    ld      hl,$0004
9247 cdfc1e    call    $1efc
924a 3004      jr      nc,$9250
924c cd6d20    call    $206d
924f 37        scf     
9250 c9        ret     

9251 cd7d80    call    $807d
9254 111493    ld      de,$9314
9257 0e09      ld      c,$09
9259 cd0500    call    $0005
925c 3e05      ld      a,$05
925e cd4583    call    $8345
9261 cde292    call    $92e2
9264 d0        ret     nc

9265 fe33      cp      $33
9267 cacc92    jp      z,$92cc
926a cde292    call    $92e2
926d 3016      jr      nc,$9285
926f cde292    call    $92e2
9272 3011      jr      nc,$9285
9274 fe31      cp      $31
9276 202c      jr      nz,$92a4
9278 cde292    call    $92e2
927b 3008      jr      nc,$9285
927d fe30      cp      $30
927f 2804      jr      z,$9285
9281 fe31      cp      $31
9283 201f      jr      nz,$92a4
9285 111893    ld      de,$9318
9288 0e09      ld      c,$09
928a cd0500    call    $0005
928d cd0e35    call    $350e
9290 2812      jr      z,$92a4
9292 0e98      ld      c,$98
9294 1600      ld      d,$00
9296 cdbd93    call    $93bd
9299 3009      jr      nc,$92a4
929b 0e05      ld      c,$05
929d 1600      ld      d,$00
929f 1e02      ld      e,$02
92a1 cdbd93    call    $93bd
92a4 cd6e35    call    $356e
92a7 3e72      ld      a,$72
92a9 326003    ld      ($0360),a
92ac 3e71      ld      a,$71
92ae 327203    ld      ($0372),a
92b1 3e24      ld      a,$24
92b3 322f04    ld      ($042f),a
92b6 210093    ld      hl,$9300
92b9 11ba03    ld      de,$03ba
92bc 011100    ld      bc,$0011
92bf edb0      ldir    
92c1 211193    ld      hl,$9311
92c4 115d01    ld      de,$015d
92c7 010300    ld      bc,$0003
92ca edb0      ldir    
92cc 0605      ld      b,$05
92ce cde292    call    $92e2
92d1 3002      jr      nc,$92d5
92d3 10f9      djnz    $92ce
92d5 cd7d80    call    $807d
92d8 37        scf     
92d9 c9        ret     

92da 1e02      ld      e,$02
92dc 0e02      ld      c,$02
92de cd0500    call    $0005
92e1 c9        ret     

92e2 06ff      ld      b,$ff
92e4 0e0b      ld      c,$0b
92e6 1efe      ld      e,$fe
92e8 cd0500    call    $0005
92eb b7        or      a
92ec 2004      jr      nz,$92f2
92ee 10f8      djnz    $92e8
92f0 b7        or      a
92f1 c9        ret     

92f2 0e80      ld      c,$80
92f4 cd0500    call    $0005
92f7 cdda92    call    $92da
92fa fe02      cp      $02
92fc 28f4      jr      z,$92f2
92fe 37        scf     
92ff c9        ret     

9300 40        ld      b,b
9301 48        ld      c,b
9302 42        ld      b,d
9303 4a        ld      c,d
9304 50        ld      d,b
9305 58        ld      e,b
9306 52        ld      d,d
9307 5a        ld      e,d
9308 60        ld      h,b
9309 68        ld      l,b
930a 62        ld      h,d
930b 6a        ld      l,d
930c 70        ld      (hl),b
930d 78        ld      a,b
930e 72        ld      (hl),d
930f 7a        ld      a,d
9310 24        inc     h
9311 00        nop     
9312 7f        ld      a,a
9313 00        nop     
9314 1b        dec     de
9315 2e30      ld      l,$30
9317 24        inc     h
9318 1b        dec     de
9319 2e31      ld      l,$31
931b 24        inc     h
931c 0e98      ld      c,$98
931e 16ff      ld      d,$ff
9320 cdbd93    call    $93bd
9323 3009      jr      nc,$932e
9325 0e05      ld      c,$05
9327 1602      ld      d,$02
9329 1e02      ld      e,$02
932b cdbd93    call    $93bd
932e 7a        ld      a,d
932f 32c693    ld      ($93c6),a
9332 0e04      ld      c,$04
9334 1602      ld      d,$02
9336 1e4b      ld      e,$4b
9338 cdb893    call    $93b8
933b 7a        ld      a,d
933c 32c593    ld      ($93c5),a
933f 0e02      ld      c,$02
9341 1600      ld      d,$00
9343 1e06      ld      e,$06
9345 cdb893    call    $93b8
9348 7a        ld      a,d
9349 32c393    ld      ($93c3),a
934c 0e05      ld      c,$05
934e 1610      ld      d,$10
9350 1e10      ld      e,$10
9352 cdb893    call    $93b8
9355 7a        ld      a,d
9356 32c493    ld      ($93c4),a
9359 0e0b      ld      c,$0b
935b 1600      ld      d,$00
935d cdb893    call    $93b8
9360 7a        ld      a,d
9361 32c293    ld      ($93c2),a
9364 0e0c      ld      c,$0c
9366 1600      ld      d,$00
9368 cdb893    call    $93b8
936b 7a        ld      a,d
936c 32c793    ld      ($93c7),a
936f 0e0a      ld      c,$0a
9371 1618      ld      d,$18
9373 cdb893    call    $93b8
9376 7a        ld      a,d
9377 32c893    ld      ($93c8),a
937a c9        ret     

937b 3ac593    ld      a,($93c5)
937e 0e04      ld      c,$04
9380 57        ld      d,a
9381 1e4b      ld      e,$4b
9383 cdb893    call    $93b8
9386 3ac393    ld      a,($93c3)
9389 0e02      ld      c,$02
938b 57        ld      d,a
938c 1e06      ld      e,$06
938e cdb893    call    $93b8
9391 3ac493    ld      a,($93c4)
9394 0e05      ld      c,$05
9396 57        ld      d,a
9397 1e10      ld      e,$10
9399 cdb893    call    $93b8
939c 3ac293    ld      a,($93c2)
939f 0e0b      ld      c,$0b
93a1 57        ld      d,a
93a2 cdb893    call    $93b8
93a5 3ac793    ld      a,($93c7)
93a8 57        ld      d,a
93a9 0e0c      ld      c,$0c
93ab cdb893    call    $93b8
93ae 3ac893    ld      a,($93c8)
93b1 57        ld      d,a
93b2 0e0a      ld      c,$0a
93b4 cdb893    call    $93b8
93b7 c9        ret     

93b8 0601      ld      b,$01
93ba cf        rst     $08
93bb 13        inc     de
93bc c9        ret     

93bd 0600      ld      b,$00
93bf cf        rst     $08
93c0 13        inc     de
93c1 c9        ret     

93c2 00        nop     
93c3 00        nop     
93c4 00        nop     
93c5 00        nop     
93c6 00        nop     
93c7 00        nop     
93c8 00        nop     
93c9 c5        push    bc
93ca cd8394    call    $9483
93cd f5        push    af
93ce c1        pop     bc
93cf cb7f      bit     7,a
93d1 284f      jr      z,$9422
93d3 fea0      cp      $a0
93d5 284b      jr      z,$9422
93d7 fe8b      cp      $8b
93d9 28ef      jr      z,$93ca
93db fe82      cp      $82
93dd 2012      jr      nz,$93f1
93df cd3635    call    $3536
93e2 2805      jr      z,$93e9
93e4 cd3e35    call    $353e
93e7 18e1      jr      $93ca
93e9 cd4e35    call    $354e
93ec cc5635    call    z,$3556
93ef 18d9      jr      $93ca
93f1 fe83      cp      $83
93f3 2012      jr      nz,$9407
93f5 cd4e35    call    $354e
93f8 2805      jr      z,$93ff
93fa cd5e35    call    $355e
93fd 18cb      jr      $93ca
93ff cd3635    call    $3536
9402 cc4635    call    z,$3546
9405 18c3      jr      $93ca
9407 fe81      cp      $81
9409 2005      jr      nz,$9410
940b cde434    call    $34e4
940e 18ba      jr      $93ca
9410 fe86      cp      $86
9412 2005      jr      nz,$9419
9414 cddb34    call    $34db
9417 18b1      jr      $93ca
9419 fe87      cp      $87
941b 2005      jr      nz,$9422
941d cdfd34    call    $34fd
9420 18a8      jr      $93ca
9422 c5        push    bc
9423 f1        pop     af
9424 c1        pop     bc
9425 c9        ret     

9426 c5        push    bc
9427 cd2a95    call    $952a
942a f5        push    af
942b c1        pop     bc
942c cb7f      bit     7,a
942e 284f      jr      z,$947f
9430 fea0      cp      $a0
9432 284b      jr      z,$947f
9434 fe8b      cp      $8b
9436 28ef      jr      z,$9427
9438 fe82      cp      $82
943a 2012      jr      nz,$944e
943c cd4e35    call    $354e
943f 2805      jr      z,$9446
9441 cd5e35    call    $355e
9444 18e1      jr      $9427
9446 cd3635    call    $3536
9449 cc4635    call    z,$3546
944c 18d9      jr      $9427
944e fe83      cp      $83
9450 2012      jr      nz,$9464
9452 cd3635    call    $3536
9455 2805      jr      z,$945c
9457 cd3e35    call    $353e
945a 18cb      jr      $9427
945c cd4e35    call    $354e
945f cc5635    call    z,$3556
9462 18c3      jr      $9427
9464 fe81      cp      $81
9466 2005      jr      nz,$946d
9468 cde434    call    $34e4
946b 18ba      jr      $9427
946d fe86      cp      $86
946f 2005      jr      nz,$9476
9471 cddb34    call    $34db
9474 18b1      jr      $9427
9476 fe87      cp      $87
9478 2005      jr      nz,$947f
947a cdfd34    call    $34fd
947d 18a8      jr      $9427
947f c5        push    bc
9480 f1        pop     af
9481 c1        pop     bc
9482 c9        ret     

9483 e5        push    hl
9484 fde5      push    iy
9486 c5        push    bc
9487 d5        push    de
9488 2a1f9a    ld      hl,($9a1f)
948b ed4b1d9a  ld      bc,($9a1d)
948f b7        or      a
9490 ed42      sbc     hl,bc
9492 300c      jr      nc,$94a0
9494 cd2f98    call    $982f
9497 dc4698    call    c,$9846
949a cd8398    call    $9883
949d ca2495    jp      z,$9524
94a0 2a1d9a    ld      hl,($9a1d)
94a3 7e        ld      a,(hl)
94a4 23        inc     hl
94a5 221d9a    ld      ($9a1d),hl
94a8 21259a    ld      hl,$9a25
94ab 34        inc     (hl)
94ac 200a      jr      nz,$94b8
94ae 23        inc     hl
94af 34        inc     (hl)
94b0 2006      jr      nz,$94b8
94b2 23        inc     hl
94b3 34        inc     (hl)
94b4 2002      jr      nz,$94b8
94b6 23        inc     hl
94b7 34        inc     (hl)
94b8 fe20      cp      $20
94ba 3804      jr      c,$94c0
94bc fe7f      cp      $7f
94be 3861      jr      c,$9521
94c0 fea0      cp      $a0
94c2 285d      jr      z,$9521
94c4 fe0a      cp      $0a
94c6 2804      jr      z,$94cc
94c8 fe0d      cp      $0d
94ca 200e      jr      nz,$94da
94cc cd2635    call    $3526
94cf cdea6a    call    $6aea
94d2 cd4c86    call    $864c
94d5 cdeb85    call    $85eb
94d8 184a      jr      $9524
94da fe0c      cp      $0c
94dc 2005      jr      nz,$94e3
94de cd286b    call    $6b28
94e1 18f2      jr      $94d5
94e3 fe09      cp      $09
94e5 2005      jr      nz,$94ec
94e7 cd6886    call    $8668
94ea 1838      jr      $9524
94ec cb7f      bit     7,a
94ee 2831      jr      z,$9521
94f0 fe8b      cp      $8b
94f2 2005      jr      nz,$94f9
94f4 cd1e35    call    $351e
94f7 182b      jr      $9524
94f9 fe82      cp      $82
94fb 2827      jr      z,$9524
94fd fe83      cp      $83
94ff 2823      jr      z,$9524
9501 fe81      cp      $81
9503 281f      jr      z,$9524
9505 fe86      cp      $86
9507 281b      jr      z,$9524
9509 fe87      cp      $87
950b 2817      jr      z,$9524
950d fe1a      cp      $1a
950f 2010      jr      nz,$9521
9511 3e01      ld      a,$01
9513 211d9a    ld      hl,$9a1d
9516 35        dec     (hl)
9517 fd21259a  ld      iy,$9a25
951b cd488f    call    $8f48
951e b7        or      a
951f 1803      jr      $9524
9521 cd1686    call    $8616
9524 d1        pop     de
9525 c1        pop     bc
9526 fde1      pop     iy
9528 e1        pop     hl
9529 c9        ret     

952a e5        push    hl
952b fde5      push    iy
952d c5        push    bc
952e d5        push    de
952f ed4b1d9a  ld      bc,($9a1d)
9533 2a299a    ld      hl,($9a29)
9536 b7        or      a
9537 ed42      sbc     hl,bc
9539 382a      jr      c,$9565
953b 21259a    ld      hl,$9a25
953e 7e        ld      a,(hl)
953f b7        or      a
9540 2015      jr      nz,$9557
9542 23        inc     hl
9543 7e        ld      a,(hl)
9544 b7        or      a
9545 2010      jr      nz,$9557
9547 23        inc     hl
9548 7e        ld      a,(hl)
9549 b7        or      a
954a 200b      jr      nz,$9557
954c 23        inc     hl
954d 7e        ld      a,(hl)
954e b7        or      a
954f 2006      jr      nz,$9557
9551 3e01      ld      a,$01
9553 b7        or      a
9554 c3e495    jp      $95e4
9557 cd2f98    call    $982f
955a dcaa98    call    c,$98aa
955d cd1d99    call    $991d
9560 cdc698    call    $98c6
9563 287f      jr      z,$95e4
9565 cd3087    call    $8730
9568 4f        ld      c,a
9569 21259a    ld      hl,$9a25
956c 7e        ld      a,(hl)
956d b7        or      a
956e 2011      jr      nz,$9581
9570 23        inc     hl
9571 7e        ld      a,(hl)
9572 b7        or      a
9573 200a      jr      nz,$957f
9575 23        inc     hl
9576 7e        ld      a,(hl)
9577 b7        or      a
9578 2003      jr      nz,$957d
957a 23        inc     hl
957b 35        dec     (hl)
957c 2b        dec     hl
957d 35        dec     (hl)
957e 2b        dec     hl
957f 35        dec     (hl)
9580 2b        dec     hl
9581 35        dec     (hl)
9582 2a1d9a    ld      hl,($9a1d)
9585 2b        dec     hl
9586 7e        ld      a,(hl)
9587 221d9a    ld      ($9a1d),hl
958a fe20      cp      $20
958c 3804      jr      c,$9592
958e fe7f      cp      $7f
9590 384c      jr      c,$95de
9592 fea0      cp      $a0
9594 2848      jr      z,$95de
9596 fe0c      cp      $0c
9598 2005      jr      nz,$959f
959a cd386b    call    $6b38
959d 1815      jr      $95b4
959f fe1a      cp      $1a
95a1 283e      jr      z,$95e1
95a3 fe0a      cp      $0a
95a5 2804      jr      z,$95ab
95a7 fe0d      cp      $0d
95a9 200e      jr      nz,$95b9
95ab cd2635    call    $3526
95ae cd106b    call    $6b10
95b1 cdec95    call    $95ec
95b4 cde485    call    $85e4
95b7 1828      jr      $95e1
95b9 fe09      cp      $09
95bb 2005      jr      nz,$95c2
95bd cdec95    call    $95ec
95c0 181f      jr      $95e1
95c2 cb7f      bit     7,a
95c4 2818      jr      z,$95de
95c6 fe82      cp      $82
95c8 281a      jr      z,$95e4
95ca fe83      cp      $83
95cc 2816      jr      z,$95e4
95ce fe8b      cp      $8b
95d0 2812      jr      z,$95e4
95d2 fe81      cp      $81
95d4 280e      jr      z,$95e4
95d6 fe86      cp      $86
95d8 280a      jr      z,$95e4
95da fe87      cp      $87
95dc 2806      jr      z,$95e4
95de cdf285    call    $85f2
95e1 cd4f87    call    $874f
95e4 d1        pop     de
95e5 c1        pop     bc
95e6 fde1      pop     iy
95e8 e1        pop     hl
95e9 c9        ret     

95ea 01cdf5    ld      bc,$f5cd
95ed c5        push    bc
95ee dde5      push    ix
95f0 cd3087    call    $8730
95f3 f5        push    af
95f4 226496    ld      ($9664),hl
95f7 ed4b299a  ld      bc,($9a29)
95fb 2b        dec     hl
95fc 7e        ld      a,(hl)
95fd fe0a      cp      $0a
95ff 2810      jr      z,$9611
9601 fe0c      cp      $0c
9603 280c      jr      z,$9611
9605 fe0d      cp      $0d
9607 2808      jr      z,$9611
9609 7c        ld      a,h
960a b8        cp      b
960b 2002      jr      nz,$960f
960d 7d        ld      a,l
960e b9        cp      c
960f 30ea      jr      nc,$95fb
9611 cd4c86    call    $864c
9614 7e        ld      a,(hl)
9615 23        inc     hl
9616 dd216496  ld      ix,$9664
961a 7c        ld      a,h
961b ddbe01    cp      (ix+$01)
961e 2004      jr      nz,$9624
9620 7d        ld      a,l
9621 ddbe00    cp      (ix+$00)
9624 2835      jr      z,$965b
9626 7e        ld      a,(hl)
9627 23        inc     hl
9628 fe09      cp      $09
962a 2005      jr      nz,$9631
962c cd6886    call    $8668
962f 18e9      jr      $961a
9631 cb7f      bit     7,a
9633 2821      jr      z,$9656
9635 fea0      cp      $a0
9637 281d      jr      z,$9656
9639 fe8b      cp      $8b
963b 2005      jr      nz,$9642
963d cd1e35    call    $351e
9640 18d8      jr      $961a
9642 fe82      cp      $82
9644 28d4      jr      z,$961a
9646 fe83      cp      $83
9648 28d0      jr      z,$961a
964a fe81      cp      $81
964c 28cc      jr      z,$961a
964e fe86      cp      $86
9650 28c8      jr      z,$961a
9652 fe87      cp      $87
9654 28c4      jr      z,$961a
9656 cd1686    call    $8616
9659 18bf      jr      $961a
965b f1        pop     af
965c cd6187    call    $8761
965f dde1      pop     ix
9661 c1        pop     bc
9662 f1        pop     af
9663 c9        ret     

9664 06cd      ld      b,$cd
9666 c5        push    bc
9667 e5        push    hl
9668 2a1f9a    ld      hl,($9a1f)
966b ed4b1d9a  ld      bc,($9a1d)
966f b7        or      a
9670 ed42      sbc     hl,bc
9672 281b      jr      z,$968f
9674 3819      jr      c,$968f
9676 0a        ld      a,(bc)
9677 fe1a      cp      $1a
9679 2008      jr      nz,$9683
967b ed431f9a  ld      ($9a1f),bc
967f 3e01      ld      a,$01
9681 181a      jr      $969d
9683 cb7f      bit     7,a
9685 2816      jr      z,$969d
9687 fea0      cp      $a0
9689 2812      jr      z,$969d
968b fead      cp      $ad
968d 280e      jr      z,$969d
968f cdd296    call    $96d2
9692 cdc993    call    $93c9
9695 fe01      cp      $01
9697 c42694    call    nz,$9426
969a cddf96    call    $96df
969d e1        pop     hl
969e c1        pop     bc
969f c9        ret     

96a0 c5        push    bc
96a1 e5        push    hl
96a2 2a1d9a    ld      hl,($9a1d)
96a5 ed4b299a  ld      bc,($9a29)
96a9 b7        or      a
96aa ed42      sbc     hl,bc
96ac 2813      jr      z,$96c1
96ae 3811      jr      c,$96c1
96b0 2a1d9a    ld      hl,($9a1d)
96b3 2b        dec     hl
96b4 7e        ld      a,(hl)
96b5 cb7f      bit     7,a
96b7 2816      jr      z,$96cf
96b9 fea0      cp      $a0
96bb 2812      jr      z,$96cf
96bd fead      cp      $ad
96bf 280e      jr      z,$96cf
96c1 cdd296    call    $96d2
96c4 cd2694    call    $9426
96c7 fe01      cp      $01
96c9 c4c993    call    nz,$93c9
96cc cddf96    call    $96df
96cf e1        pop     hl
96d0 c1        pop     bc
96d1 c9        ret     

96d2 cd3487    call    $8734
96d5 32ee96    ld      ($96ee),a
96d8 cd3087    call    $8730
96db 32ef96    ld      ($96ef),a
96de c9        ret     

96df f5        push    af
96e0 3aee96    ld      a,($96ee)
96e3 cd4487    call    $8744
96e6 3aef96    ld      a,($96ef)
96e9 cd1687    call    $8716
96ec f1        pop     af
96ed c9        ret     

96ee 40        ld      b,b
96ef 8e        adc     a,(hl)
96f0 c5        push    bc
96f1 d5        push    de
96f2 e5        push    hl
96f3 78        ld      a,b
96f4 b1        or      c
96f5 2862      jr      z,$9759
96f7 d5        push    de
96f8 c5        push    bc
96f9 2a1f9a    ld      hl,($9a1f)
96fc 09        add     hl,bc
96fd 225d97    ld      ($975d),hl
9700 ed5b219a  ld      de,($9a21)
9704 b7        or      a
9705 ed52      sbc     hl,de
9707 3822      jr      c,$972b
9709 2a299a    ld      hl,($9a29)
970c 110008    ld      de,$0800
970f 19        add     hl,de
9710 ed5b1d9a  ld      de,($9a1d)
9714 b7        or      a
9715 ed52      sbc     hl,de
9717 3009      jr      nc,$9722
9719 cd4698    call    $9846
971c fe02      cp      $02
971e 2838      jr      z,$9758
9720 18d7      jr      $96f9
9722 cdaa98    call    $98aa
9725 fe02      cp      $02
9727 282f      jr      z,$9758
9729 18ce      jr      $96f9
972b 2a1f9a    ld      hl,($9a1f)
972e e5        push    hl
972f ed5b1d9a  ld      de,($9a1d)
9733 23        inc     hl
9734 b7        or      a
9735 ed52      sbc     hl,de
9737 44        ld      b,h
9738 4d        ld      c,l
9739 ed5b5d97  ld      de,($975d)
973d ed531f9a  ld      ($9a1f),de
9741 e1        pop     hl
9742 2802      jr      z,$9746
9744 edb8      lddr    
9746 c1        pop     bc
9747 e1        pop     hl
9748 cdeb5f    call    $5feb
974b 7e        ld      a,(hl)
974c 23        inc     hl
974d cdda97    call    $97da
9750 0b        dec     bc
9751 78        ld      a,b
9752 b1        or      c
9753 20f6      jr      nz,$974b
9755 b7        or      a
9756 1801      jr      $9759
9758 37        scf     
9759 e1        pop     hl
975a d1        pop     de
975b c1        pop     bc
975c c9        ret     

975d 8e        adc     a,(hl)
975e 18c5      jr      $9725
9760 d5        push    de
9761 e5        push    hl
9762 cd2260    call    $6022
9765 2a1f9a    ld      hl,($9a1f)
9768 ed5b1d9a  ld      de,($9a1d)
976c b7        or      a
976d ed52      sbc     hl,de
976f 3863      jr      c,$97d4
9771 23        inc     hl
9772 22d897    ld      ($97d8),hl
9775 7c        ld      a,h
9776 b8        cp      b
9777 2002      jr      nz,$977b
9779 7d        ld      a,l
977a b9        cp      c
977b 3036      jr      nc,$97b3
977d ed5b1d9a  ld      de,($9a1d)
9781 2a219a    ld      hl,($9a21)
9784 b7        or      a
9785 ed52      sbc     hl,de
9787 7c        ld      a,h
9788 fe08      cp      $08
978a 2003      jr      nz,$978f
978c 7d        ld      a,l
978d fe01      cp      $01
978f dc4698    call    c,$9846
9792 fe02      cp      $02
9794 283d      jr      z,$97d3
9796 2a1d9a    ld      hl,($9a1d)
9799 2b        dec     hl
979a 221f9a    ld      ($9a1f),hl
979d cd8398    call    $9883
97a0 2832      jr      z,$97d4
97a2 60        ld      h,b
97a3 69        ld      l,c
97a4 ed5bd897  ld      de,($97d8)
97a8 b7        or      a
97a9 ed52      sbc     hl,de
97ab 44        ld      b,h
97ac 4d        ld      c,l
97ad 78        ld      a,b
97ae b1        or      c
97af 2823      jr      z,$97d4
97b1 18b2      jr      $9765
97b3 c5        push    bc
97b4 2ad897    ld      hl,($97d8)
97b7 b7        or      a
97b8 ed42      sbc     hl,bc
97ba 44        ld      b,h
97bb 4d        ld      c,l
97bc d1        pop     de
97bd 2a1d9a    ld      hl,($9a1d)
97c0 19        add     hl,de
97c1 ed5b1d9a  ld      de,($9a1d)
97c5 78        ld      a,b
97c6 b1        or      c
97c7 2802      jr      z,$97cb
97c9 edb0      ldir    
97cb 1b        dec     de
97cc ed531f9a  ld      ($9a1f),de
97d0 b7        or      a
97d1 1801      jr      $97d4
97d3 37        scf     
97d4 e1        pop     hl
97d5 d1        pop     de
97d6 c1        pop     bc
97d7 c9        ret     

97d8 00        nop     
97d9 00        nop     
97da e5        push    hl
97db 2a1d9a    ld      hl,($9a1d)
97de 77        ld      (hl),a
97df cd8394    call    $9483
97e2 e1        pop     hl
97e3 c9        ret     

97e4 d5        push    de
97e5 e5        push    hl
97e6 2a0600    ld      hl,($0006)
97e9 2b        dec     hl
97ea 22219a    ld      ($9a21),hl
97ed ed5b2b9a  ld      de,($9a2b)
97f1 13        inc     de
97f2 ed53299a  ld      ($9a29),de
97f6 1b        dec     de
97f7 ed531f9a  ld      ($9a1f),de
97fb b7        or      a
97fc ed52      sbc     hl,de
97fe 22239a    ld      ($9a23),hl
9801 13        inc     de
9802 ed531d9a  ld      ($9a1d),de
9806 cd7199    call    $9971
9809 cd6b6b    call    $6b6b
980c e1        pop     hl
980d d1        pop     de
980e c9        ret     

980f c5        push    bc
9810 d5        push    de
9811 e5        push    hl
9812 dde5      push    ix
9814 2a239a    ld      hl,($9a23)
9817 110008    ld      de,$0800
981a 0e8a      ld      c,$8a
981c cd0500    call    $0005
981f 45        ld      b,l
9820 cd8398    call    $9883
9823 fe01      cp      $01
9825 2802      jr      z,$9829
9827 10f7      djnz    $9820
9829 dde1      pop     ix
982b e1        pop     hl
982c d1        pop     de
982d c1        pop     bc
982e c9        ret     

982f c5        push    bc
9830 e5        push    hl
9831 2a219a    ld      hl,($9a21)
9834 ed4b1f9a  ld      bc,($9a1f)
9838 b7        or      a
9839 ed42      sbc     hl,bc
983b 7c        ld      a,h
983c fe08      cp      $08
983e 2003      jr      nz,$9843
9840 7d        ld      a,l
9841 fe00      cp      $00
9843 e1        pop     hl
9844 c1        pop     bc
9845 c9        ret     

9846 c5        push    bc
9847 d5        push    de
9848 e5        push    hl
9849 cd4599    call    $9945
984c ed5b299a  ld      de,($9a29)
9850 cd8823    call    $2388
9853 b7        or      a
9854 2029      jr      nz,$987f
9856 10f8      djnz    $9850
9858 2a1f9a    ld      hl,($9a1f)
985b b7        or      a
985c ed52      sbc     hl,de
985e 23        inc     hl
985f 44        ld      b,h
9860 4d        ld      c,l
9861 62        ld      h,d
9862 6b        ld      l,e
9863 ed5b299a  ld      de,($9a29)
9867 edb0      ldir    
9869 2a1f9a    ld      hl,($9a1f)
986c 1b        dec     de
986d ed531f9a  ld      ($9a1f),de
9871 b7        or      a
9872 ed52      sbc     hl,de
9874 54        ld      d,h
9875 5d        ld      e,l
9876 2a1d9a    ld      hl,($9a1d)
9879 b7        or      a
987a ed52      sbc     hl,de
987c 221d9a    ld      ($9a1d),hl
987f e1        pop     hl
9880 d1        pop     de
9881 c1        pop     bc
9882 c9        ret     

9883 c5        push    bc
9884 d5        push    de
9885 0610      ld      b,$10
9887 ed5b1f9a  ld      de,($9a1f)
988b 13        inc     de
988c cd1423    call    $2314
988f fe01      cp      $01
9891 2805      jr      z,$9898
9893 10f7      djnz    $988c
9895 05        dec     b
9896 1805      jr      $989d
9898 cd1299    call    $9912
989b 280a      jr      z,$98a7
989d 1b        dec     de
989e 1a        ld      a,(de)
989f fe1a      cp      $1a
98a1 28fa      jr      z,$989d
98a3 ed531f9a  ld      ($9a1f),de
98a7 d1        pop     de
98a8 c1        pop     bc
98a9 c9        ret     

98aa c5        push    bc
98ab d5        push    de
98ac e5        push    hl
98ad cd4599    call    $9945
98b0 ed5b1f9a  ld      de,($9a1f)
98b4 13        inc     de
98b5 cdaf23    call    $23af
98b8 b7        or      a
98b9 2007      jr      nz,$98c2
98bb 10f8      djnz    $98b5
98bd 1b        dec     de
98be ed531f9a  ld      ($9a1f),de
98c2 e1        pop     hl
98c3 d1        pop     de
98c4 c1        pop     bc
98c5 c9        ret     

98c6 c5        push    bc
98c7 d5        push    de
98c8 e5        push    hl
98c9 2a299a    ld      hl,($9a29)
98cc 110008    ld      de,$0800
98cf 19        add     hl,de
98d0 54        ld      d,h
98d1 5d        ld      e,l
98d2 0610      ld      b,$10
98d4 cddb22    call    $22db
98d7 fe01      cp      $01
98d9 2804      jr      z,$98df
98db 10f7      djnz    $98d4
98dd 182f      jr      $990e
98df c5        push    bc
98e0 62        ld      h,d
98e1 6b        ld      l,e
98e2 ed4b299a  ld      bc,($9a29)
98e6 b7        or      a
98e7 ed42      sbc     hl,bc
98e9 44        ld      b,h
98ea 4d        ld      c,l
98eb 2a1d9a    ld      hl,($9a1d)
98ee b7        or      a
98ef ed42      sbc     hl,bc
98f1 221d9a    ld      ($9a1d),hl
98f4 2a1f9a    ld      hl,($9a1f)
98f7 23        inc     hl
98f8 b7        or      a
98f9 ed52      sbc     hl,de
98fb 44        ld      b,h
98fc 4d        ld      c,l
98fd 62        ld      h,d
98fe 6b        ld      l,e
98ff ed5b299a  ld      de,($9a29)
9903 edb0      ldir    
9905 1b        dec     de
9906 ed531f9a  ld      ($9a1f),de
990a c1        pop     bc
990b cd1299    call    $9912
990e e1        pop     hl
990f d1        pop     de
9910 c1        pop     bc
9911 c9        ret     

9912 321c99    ld      ($991c),a
9915 78        ld      a,b
9916 fe10      cp      $10
9918 3a1c99    ld      a,($991c)
991b c9        ret     

991c 00        nop     
991d c5        push    bc
991e d5        push    de
991f e5        push    hl
9920 2a1f9a    ld      hl,($9a1f)
9923 e5        push    hl
9924 010008    ld      bc,$0800
9927 09        add     hl,bc
9928 221f9a    ld      ($9a1f),hl
992b 54        ld      d,h
992c 5d        ld      e,l
992d e1        pop     hl
992e e5        push    hl
992f 23        inc     hl
9930 ed4b299a  ld      bc,($9a29)
9934 b7        or      a
9935 ed42      sbc     hl,bc
9937 44        ld      b,h
9938 4d        ld      c,l
9939 e1        pop     hl
993a edb8      lddr    
993c 13        inc     de
993d ed531d9a  ld      ($9a1d),de
9941 e1        pop     hl
9942 d1        pop     de
9943 c1        pop     bc
9944 c9        ret     

9945 2a1f9a    ld      hl,($9a1f)
9948 ed4b299a  ld      bc,($9a29)
994c b7        or      a
994d ed42      sbc     hl,bc
994f 118000    ld      de,$0080
9952 0e8a      ld      c,$8a
9954 cd0500    call    $0005
9957 7c        ld      a,h
9958 fe00      cp      $00
995a 2003      jr      nz,$995f
995c 7d        ld      a,l
995d fe10      cp      $10
995f 3802      jr      c,$9963
9961 2e10      ld      l,$10
9963 45        ld      b,l
9964 c9        ret     

9965 fde5      push    iy
9967 fd21259a  ld      iy,$9a25
996b cde78e    call    $8ee7
996e fde1      pop     iy
9970 c9        ret     

9971 fde5      push    iy
9973 fd21259a  ld      iy,$9a25
9977 cd678f    call    $8f67
997a fde1      pop     iy
997c c9        ret     

997d d5        push    de
997e e5        push    hl
997f cdce3b    call    $3bce
