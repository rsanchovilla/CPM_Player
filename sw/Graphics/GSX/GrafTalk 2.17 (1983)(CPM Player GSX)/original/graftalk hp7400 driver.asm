; Disassembly of the file "E:\Tmp\cpm\pcw\Save_RAM_00.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Saturday, 16 of March 2024 at 09:47 PM
; 
0100 cdcb03    call    $03cb
0103 2b        dec     hl
0104 f9        ld      sp,hl
0105 c38b35    jp      $358b
0108 77        ld      (hl),a
0109 be        cp      (hl)
010a ef        rst     $28
010b b0        or      b
010c 47        ld      b,a
010d 52        ld      d,d
010e 41        ld      b,c
010f 46        ld      b,(hl)
0110 54        ld      d,h
0111 41        ld      b,c
0112 4c        ld      c,h
0113 4b        ld      c,e
0114 cd4105    call    $0541
0117 c6a6      add     a,$a6
0119 00        nop     
011a cd4105    call    $0541
011d 37        scf     
011e a8        xor     b
011f 01cd41    ld      bc,$41cd
0122 05        dec     b
0123 9e        sbc     a,(hl)
0124 1a        ld      a,(de)
0125 06cd      ld      b,$cd
0127 41        ld      b,c
0128 05        dec     b
0129 f8        ret     m

012a ab        xor     e
012b 03        inc     bc
012c cd4105    call    $0541
012f c6a6      add     a,$a6
0131 02        ld      (bc),a
0132 cd4105    call    $0541
0135 c6a6      add     a,$a6
0137 0ecd      ld      c,$cd
0139 41        ld      b,c
013a 05        dec     b
013b 43        ld      b,e
013c 2c        inc     l
013d 16cd      ld      d,$cd
013f 41        ld      b,c
0140 05        dec     b
0141 4c        ld      c,h
0142 2c        inc     l
0143 16cd      ld      d,$cd
0145 41        ld      b,c
0146 05        dec     b
0147 d3aa      out     ($aa),a
0149 04        inc     b
014a cd4105    call    $0541
014d a2        and     d
014e 25        dec     h
014f 16cd      ld      d,$cd
0151 41        ld      b,c
0152 05        dec     b
0153 86        add     a,(hl)
0154 a7        and     a
0155 08        ex      af,af'
0156 cd4105    call    $0541
0159 162d      ld      d,$2d
015b 16cd      ld      d,$cd
015d 41        ld      b,c
015e 05        dec     b
015f 361f      ld      (hl),$1f
0161 06cd      ld      b,$cd
0163 41        ld      b,c
0164 05        dec     b
0165 01ab03    ld      bc,$03ab
0168 cd4105    call    $0541
016b 1d        dec     e
016c a7        and     a
016d 08        ex      af,af'
016e cd4105    call    $0541
0171 78        ld      a,b
0172 ae        xor     (hl)
0173 09        add     hl,bc
0174 cd4105    call    $0541
0177 3f        ccf     
0178 af        xor     a
0179 13        inc     de
017a cd4105    call    $0541
017d c6a6      add     a,$a6
017f 13        inc     de
0180 cd4105    call    $0541
0183 f41e16    call    p,$161e
0186 cd4105    call    $0541
0189 d0        ret     nc

018a 1812      jr      $019e
018c cd4105    call    $0541
018f 72        ld      (hl),d
0190 a8        xor     b
0191 13        inc     de
0192 cd4105    call    $0541
0195 d0        ret     nc

0196 1807      jr      $019f
0198 cd4105    call    $0541
019b 08        ex      af,af'
019c b0        or      b
019d 13        inc     de
019e cd4105    call    $0541
01a1 c6a6      add     a,$a6
01a3 05        dec     b
01a4 cd4105    call    $0541
01a7 63        ld      h,e
01a8 b6        or      (hl)
01a9 14        inc     d
01aa cd4105    call    $0541
01ad 6e        ld      l,(hl)
01ae 2816      jr      z,$01c6
01b0 cd4105    call    $0541
01b3 c1        pop     bc
01b4 1a        ld      a,(de)
01b5 07        rlca    
01b6 cd4105    call    $0541
01b9 85        add     a,l
01ba 1d        dec     e
01bb 06cd      ld      b,$cd
01bd 41        ld      b,c
01be 05        dec     b
01bf 29        add     hl,hl
01c0 19        add     hl,de
01c1 12        ld      (de),a
01c2 cd4105    call    $0541
01c5 b6        or      (hl)
01c6 b0        or      b
01c7 13        inc     de
01c8 cd4105    call    $0541
01cb 44        ld      b,h
01cc ba        cp      d
01cd 14        inc     d
01ce cd4105    call    $0541
01d1 c6a6      add     a,$a6
01d3 09        add     hl,bc
01d4 cd4105    call    $0541
01d7 58        ld      e,b
01d8 2b        dec     hl
01d9 06cd      ld      b,$cd
01db 41        ld      b,c
01dc 05        dec     b
01dd 86        add     a,(hl)
01de 2b        dec     hl
01df 06cd      ld      b,$cd
01e1 41        ld      b,c
01e2 05        dec     b
01e3 ef        rst     $28
01e4 ad        xor     l
01e5 05        dec     b
01e6 cd4105    call    $0541
01e9 c7        rst     $00
01ea 2016      jr      nz,$0202
01ec cd4105    call    $0541
01ef ea1e06    jp      pe,$061e
01f2 cd4105    call    $0541
01f5 381f      jr      c,$0216
01f7 16cd      ld      d,$cd
01f9 41        ld      b,c
01fa 05        dec     b
01fb ae        xor     (hl)
01fc 1b        dec     de
01fd 07        rlca    
01fe cd4105    call    $0541
0201 b5        or      l
0202 b1        or      c
0203 05        dec     b
0204 cd4105    call    $0541
0207 321906    ld      ($0619),a
020a cd4105    call    $0541
020d 40        ld      b,b
020e 1b        dec     de
020f 06cd      ld      b,$cd
0211 41        ld      b,c
0212 05        dec     b
0213 fc1a16    call    m,$161a
0216 cd4105    call    $0541
0219 68        ld      l,b
021a 1e06      ld      e,$06
021c cd4105    call    $0541
021f 99        sbc     a,c
0220 1e06      ld      e,$06
0222 cd4105    call    $0541
0225 5b        ld      e,e
0226 3016      jr      nc,$023e
0228 cd4105    call    $0541
022b c6a6      add     a,$a6
022d 0d        dec     c
022e cd4105    call    $0541
0231 e5        push    hl
0232 ae        xor     (hl)
0233 09        add     hl,bc
0234 cd4105    call    $0541
0237 eeb1      xor     $b1
0239 13        inc     de
023a cd4105    call    $0541
023d c6a6      add     a,$a6
023f 0f        rrca    
0240 cd4105    call    $0541
0243 d7        rst     $10
0244 a7        and     a
0245 02        ld      (bc),a
0246 cd4105    call    $0541
0249 07        rlca    
024a 19        add     hl,de
024b 06cd      ld      b,$cd
024d 41        ld      b,c
024e 05        dec     b
024f d0        ret     nc

0250 1806      jr      $0258
0252 cd4105    call    $0541
0255 bb        cp      e
0256 2e16      ld      l,$16
0258 cd4105    call    $0541
025b 1e29      ld      e,$29
025d 06cd      ld      b,$cd
025f 41        ld      b,c
0260 05        dec     b
0261 e8        ret     pe

0262 23        inc     hl
0263 06cd      ld      b,$cd
0265 41        ld      b,c
0266 05        dec     b
0267 fc2506    call    m,$0625
026a cd4105    call    $0541
026d 8b        adc     a,e
026e 2006      jr      nz,$0276
0270 cd4105    call    $0541
0273 b7        or      a
0274 1f        rra     
0275 06cd      ld      b,$cd
0277 41        ld      b,c
0278 05        dec     b
0279 f8        ret     m

027a aa        xor     d
027b 13        inc     de
027c cd4105    call    $0541
027f 23        inc     hl
0280 b2        or      d
0281 13        inc     de
0282 cd4105    call    $0541
0285 c6a6      add     a,$a6
0287 08        ex      af,af'
0288 cd4105    call    $0541
028b c2b213    jp      nz,$13b2
028e cd4105    call    $0541
0291 f8        ret     m

0292 1d        dec     e
0293 06cd      ld      b,$cd
0295 41        ld      b,c
0296 05        dec     b
0297 d41c06    call    nc,$061c
029a cd4105    call    $0541
029d 90        sub     b
029e 2116cd    ld      hl,$cd16
02a1 41        ld      b,c
02a2 05        dec     b
02a3 80        add     a,b
02a4 af        xor     a
02a5 09        add     hl,bc
02a6 cd4105    call    $0541
02a9 37        scf     
02aa a8        xor     b
02ab 18cd      jr      $027a
02ad 41        ld      b,c
02ae 05        dec     b
02af c6a6      add     a,$a6
02b1 19        add     hl,de
02b2 cd4105    call    $0541
02b5 b4        or      h
02b6 ad        xor     l
02b7 13        inc     de
02b8 cd4105    call    $0541
02bb 2ab413    ld      hl,($13b4)
02be cd4105    call    $0541
02c1 64        ld      h,h
02c2 b6        or      (hl)
02c3 15        dec     d
02c4 cd4105    call    $0541
02c7 c1        pop     bc
02c8 a8        xor     b
02c9 03        inc     bc
02ca cd4105    call    $0541
02cd e1        pop     hl
02ce a9        xor     c
02cf 03        inc     bc
02d0 cd4105    call    $0541
02d3 64        ld      h,h
02d4 1f        rra     
02d5 1601      ld      d,$01
02d7 00        nop     
02d8 1b        dec     de
02d9 3d        dec     a
02da 00        nop     
02db 00        nop     
02dc 00        nop     
02dd 00        nop     
02de 2000      jr      nz,$02e0
02e0 00        nop     
02e1 00        nop     
02e2 00        nop     
02e3 00        nop     
02e4 00        nop     
02e5 00        nop     
02e6 2000      jr      nz,$02e8
02e8 00        nop     
02e9 00        nop     
02ea 00        nop     
02eb 00        nop     
02ec 00        nop     
02ed 00        nop     
02ee 1a        ld      a,(de)
02ef 00        nop     
02f0 00        nop     
02f1 00        nop     
02f2 00        nop     
02f3 00        nop     
02f4 00        nop     
02f5 00        nop     
02f6 00        nop     
02f7 00        nop     
02f8 00        nop     
02f9 e5        push    hl
02fa c5        push    bc
02fb d5        push    de
02fc cdac04    call    $04ac
02ff cd1d05    call    $051d
0302 c21003    jp      nz,$0310
0305 e5        push    hl
0306 110c00    ld      de,$000c
0309 19        add     hl,de
030a 228003    ld      ($0380),hl
030d c37b03    jp      $037b
0310 d1        pop     de
0311 c1        pop     bc
0312 e1        pop     hl
0313 e5        push    hl
0314 c5        push    bc
0315 d5        push    de
0316 cd8a04    call    $048a
0319 2a8200    ld      hl,($0082)
031c 220a01    ld      ($010a),hl
031f 2a8000    ld      hl,($0080)
0322 1180ff    ld      de,$ff80
0325 19        add     hl,de
0326 e5        push    hl
0327 eb        ex      de,hl
0328 218c00    ld      hl,$008c
032b 19        add     hl,de
032c 228003    ld      ($0380),hl
032f e1        pop     hl
0330 018000    ld      bc,$0080
0333 09        add     hl,bc
0334 e5        push    hl
0335 eb        ex      de,hl
0336 2a0a01    ld      hl,($010a)
0339 7d        ld      a,l
033a 93        sub     e
033b 6f        ld      l,a
033c 7c        ld      a,h
033d 9a        sbc     a,d
033e 67        ld      h,a
033f c26a03    jp      nz,$036a
0342 7d        ld      a,l
0343 fe80      cp      $80
0345 f26a03    jp      p,$036a
0348 e5        push    hl
0349 118000    ld      de,$0080
034c 0e1a      ld      c,$1a
034e cd0500    call    $0005
0351 0e14      ld      c,$14
0353 117705    ld      de,$0577
0356 cd0500    call    $0005
0359 b7        or      a
035a e1        pop     hl
035b c27b03    jp      nz,$037b
035e d1        pop     de
035f d5        push    de
0360 4d        ld      c,l
0361 218000    ld      hl,$0080
0364 cd5c04    call    $045c
0367 c37b03    jp      $037b
036a 0e1a      ld      c,$1a
036c cd0500    call    $0005
036f 0e14      ld      c,$14
0371 117705    ld      de,$0577
0374 cd0500    call    $0005
0377 b7        or      a
0378 ca2f03    jp      z,$032f
037b e1        pop     hl
037c d1        pop     de
037d c1        pop     bc
037e e1        pop     hl
037f c3f8ab    jp      $abf8
0382 217805    ld      hl,$0578
0385 11b703    ld      de,$03b7
0388 0e08      ld      c,$08
038a cd5c04    call    $045c
038d 119803    ld      de,$0398
0390 0e09      ld      c,$09
0392 cd0500    call    $0005
0395 c30000    jp      $0000
0398 0d        dec     c
0399 0a        ld      a,(bc)
039a 0d        dec     c
039b 0a        ld      a,(bc)
039c 2a2a2a    ld      hl,($2a2a)
039f 2055      jr      nz,$03f6
03a1 4e        ld      c,(hl)
03a2 41        ld      b,c
03a3 42        ld      b,d
03a4 4c        ld      c,h
03a5 45        ld      b,l
03a6 2054      jr      nz,$03fc
03a8 4f        ld      c,a
03a9 2047      jr      nz,$03f2
03ab 45        ld      b,l
03ac 54        ld      d,h
03ad 204f      jr      nz,$03fe
03af 56        ld      d,(hl)
03b0 45        ld      b,l
03b1 52        ld      d,d
03b2 4c        ld      c,h
03b3 41        ld      b,c
03b4 59        ld      e,c
03b5 2028      jr      nz,$03df
03b7 58        ld      e,b
03b8 58        ld      e,b
03b9 58        ld      e,b
03ba 58        ld      e,b
03bb 58        ld      e,b
03bc 58        ld      e,b
03bd 58        ld      e,b
03be 58        ld      e,b
03bf 29        add     hl,hl
03c0 202a      jr      nz,$03ec
03c2 2a2a0a    ld      hl,($0a2a)
03c5 0d        dec     c
03c6 0a        ld      a,(bc)
03c7 0d        dec     c
03c8 24        inc     h
03c9 24        inc     h
03ca 08        ex      af,af'
03cb e1        pop     hl
03cc 225a04    ld      ($045a),hl
03cf 2a0600    ld      hl,($0006)
03d2 2b        dec     hl
03d3 f9        ld      sp,hl
03d4 210c01    ld      hl,$010c
03d7 117805    ld      de,$0578
03da 0e08      ld      c,$08
03dc cd5c04    call    $045c
03df 0e15      ld      c,$15
03e1 af        xor     a
03e2 118305    ld      de,$0583
03e5 cd6804    call    $0468
03e8 010400    ld      bc,$0004
03eb c5        push    bc
03ec 2a0801    ld      hl,($0108)
03ef 22a805    ld      ($05a8),hl
03f2 eb        ex      de,hl
03f3 0e1a      ld      c,$1a
03f5 cd0500    call    $0005
03f8 117705    ld      de,$0577
03fb 0e0f      ld      c,$0f
03fd cd0500    call    $0005
0400 117705    ld      de,$0577
0403 0e14      ld      c,$14
0405 cd0500    call    $0005
0408 b7        or      a
0409 c28203    jp      nz,$0382
040c 118000    ld      de,$0080
040f 2aa805    ld      hl,($05a8)
0412 19        add     hl,de
0413 22a805    ld      ($05a8),hl
0416 eb        ex      de,hl
0417 0e1a      ld      c,$1a
0419 cd0500    call    $0005
041c c1        pop     bc
041d 0d        dec     c
041e c5        push    bc
041f c20004    jp      nz,$0400
0422 c1        pop     bc
0423 2a0801    ld      hl,($0108)
0426 7e        ld      a,(hl)
0427 23        inc     hl
0428 66        ld      h,(hl)
0429 6f        ld      l,a
042a 29        add     hl,hl
042b 29        add     hl,hl
042c e5        push    hl
042d 29        add     hl,hl
042e d1        pop     de
042f 19        add     hl,de
0430 110200    ld      de,$0002
0433 19        add     hl,de
0434 eb        ex      de,hl
0435 2a0801    ld      hl,($0108)
0438 229e05    ld      ($059e),hl
043b 19        add     hl,de
043c 220801    ld      ($0108),hl
043f 226883    ld      ($8368),hl
0442 2a9e05    ld      hl,($059e)
0445 110200    ld      de,$0002
0448 19        add     hl,de
0449 22a005    ld      ($05a0),hl
044c 2a9e05    ld      hl,($059e)
044f 7e        ld      a,(hl)
0450 23        inc     hl
0451 66        ld      h,(hl)
0452 6f        ld      l,a
0453 22aa05    ld      ($05aa),hl
0456 2a0600    ld      hl,($0006)
0459 c30301    jp      $0103
045c 79        ld      a,c
045d b7        or      a
045e c8        ret     z

045f 7e        ld      a,(hl)
0460 12        ld      (de),a
0461 23        inc     hl
0462 13        inc     de
0463 0d        dec     c
0464 c25f04    jp      nz,$045f
0467 c9        ret     

0468 12        ld      (de),a
0469 13        inc     de
046a 0d        dec     c
046b c26804    jp      nz,$0468
046e c9        ret     

046f 328904    ld      ($0489),a
0472 7d        ld      a,l
0473 93        sub     e
0474 f5        push    af
0475 7c        ld      a,h
0476 9a        sbc     a,d
0477 c28304    jp      nz,$0483
047a 7c        ld      a,h
047b ba        cp      d
047c c28304    jp      nz,$0483
047f f1        pop     af
0480 c38504    jp      $0485
0483 33        inc     sp
0484 33        inc     sp
0485 3a8904    ld      a,($0489)
0488 c9        ret     

0489 00        nop     
048a cdac04    call    $04ac
048d 22a405    ld      ($05a4),hl
0490 110200    ld      de,$0002
0493 19        add     hl,de
0494 7e        ld      a,(hl)
0495 23        inc     hl
0496 66        ld      h,(hl)
0497 6f        ld      l,a
0498 229805    ld      ($0598),hl
049b 0e1a      ld      c,$1a
049d 118000    ld      de,$0080
04a0 cd0500    call    $0005
04a3 117705    ld      de,$0577
04a6 0e21      ld      c,$21
04a8 cd0500    call    $0005
04ab c9        ret     

04ac 22a605    ld      ($05a6),hl
04af 21a205    ld      hl,$05a2
04b2 3600      ld      (hl),$00
04b4 2aa005    ld      hl,($05a0)
04b7 e5        push    hl
04b8 e1        pop     hl
04b9 e5        push    hl
04ba 110400    ld      de,$0004
04bd 19        add     hl,de
04be eb        ex      de,hl
04bf 2aa605    ld      hl,($05a6)
04c2 0e08      ld      c,$08
04c4 1a        ld      a,(de)
04c5 be        cp      (hl)
04c6 c2d104    jp      nz,$04d1
04c9 23        inc     hl
04ca 13        inc     de
04cb 0d        dec     c
04cc c2c404    jp      nz,$04c4
04cf e1        pop     hl
04d0 c9        ret     

04d1 e1        pop     hl
04d2 110c00    ld      de,$000c
04d5 19        add     hl,de
04d6 e5        push    hl
04d7 21a205    ld      hl,$05a2
04da 34        inc     (hl)
04db 3aaa05    ld      a,($05aa)
04de be        cp      (hl)
04df c2b804    jp      nz,$04b8
04e2 2aa605    ld      hl,($05a6)
04e5 11fb04    ld      de,$04fb
04e8 0e08      ld      c,$08
04ea cd5c04    call    $045c
04ed 11f804    ld      de,$04f8
04f0 0e09      ld      c,$09
04f2 cd0500    call    $0005
04f5 c30000    jp      $0000
04f8 0a        ld      a,(bc)
04f9 0a        ld      a,(bc)
04fa 0d        dec     c
04fb 58        ld      e,b
04fc 58        ld      e,b
04fd 58        ld      e,b
04fe 58        ld      e,b
04ff 58        ld      e,b
0500 58        ld      e,b
0501 58        ld      e,b
0502 58        ld      e,b
0503 2049      jr      nz,$054e
0505 53        ld      d,e
0506 204e      jr      nz,$0556
0508 4f        ld      c,a
0509 54        ld      d,h
050a 2041      jr      nz,$054d
050c 4e        ld      c,(hl)
050d 204f      jr      nz,$055e
050f 56        ld      d,(hl)
0510 45        ld      b,l
0511 52        ld      d,d
0512 4c        ld      c,h
0513 41        ld      b,c
0514 59        ld      e,c
0515 204e      jr      nz,$0565
0517 41        ld      b,c
0518 4d        ld      c,l
0519 45        ld      b,l
051a 0a        ld      a,(bc)
051b 0d        dec     c
051c 24        inc     h
051d 229c05    ld      ($059c),hl
0520 7e        ld      a,(hl)
0521 23        inc     hl
0522 66        ld      h,(hl)
0523 6f        ld      l,a
0524 e5        push    hl
0525 110400    ld      de,$0004
0528 19        add     hl,de
0529 eb        ex      de,hl
052a 2a9c05    ld      hl,($059c)
052d 010400    ld      bc,$0004
0530 09        add     hl,bc
0531 eb        ex      de,hl
0532 0e08      ld      c,$08
0534 1a        ld      a,(de)
0535 be        cp      (hl)
0536 c23f05    jp      nz,$053f
0539 23        inc     hl
053a 13        inc     de
053b 0d        dec     c
053c c23405    jp      nz,$0534
053f e1        pop     hl
0540 c9        ret     

0541 e3        ex      (sp),hl
0542 c5        push    bc
0543 d5        push    de
0544 5e        ld      e,(hl)
0545 23        inc     hl
0546 56        ld      d,(hl)
0547 23        inc     hl
0548 46        ld      b,(hl)
0549 eb        ex      de,hl
054a 228003    ld      ($0380),hl
054d 2600      ld      h,$00
054f 68        ld      l,b
0550 29        add     hl,hl
0551 29        add     hl,hl
0552 e5        push    hl
0553 29        add     hl,hl
0554 d1        pop     de
0555 19        add     hl,de
0556 eb        ex      de,hl
0557 2aa005    ld      hl,($05a0)
055a 19        add     hl,de
055b e5        push    hl
055c cd1d05    call    $051d
055f ca7b03    jp      z,$037b
0562 e1        pop     hl
0563 cd8d04    call    $048d
0566 2a8200    ld      hl,($0082)
0569 220a01    ld      ($010a),hl
056c 2a8000    ld      hl,($0080)
056f 1180ff    ld      de,$ff80
0572 19        add     hl,de
0573 e5        push    hl
0574 c32f03    jp      $032f
0577 00        nop     
0578 47        ld      b,a
0579 52        ld      d,d
057a 41        ld      b,c
057b 46        ld      b,(hl)
057c 54        ld      d,h
057d 41        ld      b,c
057e 4c        ld      c,h
057f 4b        ld      c,e
0580 4f        ld      c,a
0581 56        ld      d,(hl)
0582 4c        ld      c,h
0583 03        inc     bc
0584 00        nop     
0585 00        nop     
0586 80        add     a,b
0587 010203    ld      bc,$0302
058a 04        inc     b
058b 05        dec     b
058c 0607      ld      b,$07
058e 08        ex      af,af'
058f 09        add     hl,bc
0590 0a        ld      a,(bc)
0591 0b        dec     bc
0592 0c        inc     c
0593 0d        dec     c
0594 0e0f      ld      c,$0f
0596 1077      djnz    $060f
0598 e601      and     $01
059a 00        nop     
059b 00        nop     
059c 63        ld      h,e
059d bd        cp      l
059e 3d        dec     a
059f bd        cp      l
05a0 3f        ccf     
05a1 bd        cp      l
05a2 17        rla     
05a3 00        nop     
05a4 63        ld      h,e
05a5 bd        cp      l
05a6 43        ld      b,e
05a7 35        dec     (hl)
05a8 3d        dec     a
05a9 bf        cp      a
05aa 1a        ld      a,(de)
05ab 00        nop     
05ac ac        xor     h
05ad 05        dec     b
05ae da0549    jp      c,$4905
05b1 4f        ld      c,a
05b2 50        ld      d,b
05b3 41        ld      b,c
05b4 4b        ld      c,e
05b5 3020      jr      nc,$05d7
05b7 20c3      jr      nz,$057c
05b9 ca05c3    jp      z,$c305
05bc cd05c3    call    $c305
05bf ce05      adc     a,$05
05c1 c3d105    jp      $05d1
05c4 c3d705    jp      $05d7
05c7 c3d905    jp      $05d9
05ca 3eff      ld      a,$ff
05cc c9        ret     

05cd c9        ret     

05ce 3eff      ld      a,$ff
05d0 c9        ret     

05d1 5e        ld      e,(hl)
05d2 0e05      ld      c,$05
05d4 c30500    jp      $0005
05d7 af        xor     a
05d8 c9        ret     

05d9 c9        ret     

05da 00        nop     
05db 00        nop     
05dc 00        nop     
05dd 00        nop     
05de 00        nop     
05df 00        nop     
05e0 00        nop     
05e1 00        nop     
05e2 00        nop     
05e3 00        nop     
05e4 00        nop     
05e5 00        nop     
05e6 00        nop     
05e7 00        nop     
05e8 00        nop     
05e9 00        nop     
05ea 00        nop     
05eb 00        nop     
05ec 00        nop     
05ed 00        nop     
05ee 00        nop     
05ef 00        nop     
05f0 00        nop     
05f1 00        nop     
05f2 00        nop     
05f3 00        nop     
05f4 00        nop     
05f5 00        nop     
05f6 00        nop     
05f7 00        nop     
05f8 00        nop     
05f9 00        nop     
05fa 00        nop     
05fb 00        nop     
05fc 00        nop     
05fd 00        nop     
05fe 00        nop     
05ff 00        nop     
0600 00        nop     
0601 00        nop     
0602 00        nop     
0603 00        nop     
0604 00        nop     
0605 00        nop     
0606 00        nop     
0607 00        nop     
0608 00        nop     
0609 00        nop     
060a 00        nop     
060b 00        nop     
060c 00        nop     
060d 00        nop     
060e 00        nop     
060f 00        nop     
0610 00        nop     
0611 00        nop     
0612 00        nop     
0613 00        nop     
0614 00        nop     
0615 00        nop     
0616 00        nop     
0617 00        nop     
0618 00        nop     
0619 00        nop     
061a 00        nop     
061b 00        nop     
061c 00        nop     
061d 00        nop     
061e 00        nop     
061f 00        nop     
0620 00        nop     
0621 00        nop     
0622 00        nop     
0623 00        nop     
0624 00        nop     
0625 00        nop     
0626 00        nop     
0627 00        nop     
0628 00        nop     
0629 00        nop     
062a 00        nop     
062b 00        nop     
062c 00        nop     
062d 00        nop     
062e 00        nop     
062f 00        nop     
0630 00        nop     
0631 00        nop     
0632 00        nop     
0633 00        nop     
0634 00        nop     
0635 00        nop     
0636 00        nop     
0637 00        nop     
0638 00        nop     
0639 00        nop     
063a 00        nop     
063b 00        nop     
063c 00        nop     
063d 00        nop     
063e 00        nop     
063f 00        nop     
0640 00        nop     
0641 00        nop     
0642 00        nop     
0643 00        nop     
0644 00        nop     
0645 00        nop     
0646 00        nop     
0647 00        nop     
0648 00        nop     
0649 00        nop     
064a 00        nop     
064b 00        nop     
064c 00        nop     
064d 00        nop     
064e 00        nop     
064f 00        nop     
0650 00        nop     
0651 00        nop     
0652 00        nop     
0653 00        nop     
0654 00        nop     
0655 00        nop     
0656 00        nop     
0657 00        nop     
0658 00        nop     
0659 00        nop     
065a 00        nop     
065b 00        nop     
065c 00        nop     
065d 00        nop     
065e 00        nop     
065f 00        nop     
0660 00        nop     
0661 00        nop     
0662 00        nop     
0663 00        nop     
0664 00        nop     
0665 00        nop     
0666 00        nop     
0667 00        nop     
0668 00        nop     
0669 00        nop     
066a 00        nop     
066b 00        nop     
066c 00        nop     
066d 00        nop     
066e 00        nop     
066f 00        nop     
0670 00        nop     
0671 00        nop     
0672 00        nop     
0673 00        nop     
0674 00        nop     
0675 00        nop     
0676 00        nop     
0677 00        nop     
0678 00        nop     
0679 00        nop     
067a 00        nop     
067b 00        nop     
067c 00        nop     
067d 00        nop     
067e 00        nop     
067f 00        nop     
0680 00        nop     
0681 00        nop     
0682 00        nop     
0683 00        nop     
0684 00        nop     
0685 00        nop     
0686 00        nop     
0687 00        nop     
0688 00        nop     
0689 00        nop     
068a 00        nop     
068b 00        nop     
068c 00        nop     
068d 00        nop     
068e 00        nop     
068f 00        nop     
0690 00        nop     
0691 00        nop     
0692 00        nop     
0693 00        nop     
0694 00        nop     
0695 00        nop     
0696 00        nop     
0697 00        nop     
0698 00        nop     
0699 00        nop     
069a 00        nop     
069b 00        nop     
069c 00        nop     
069d 00        nop     
069e 00        nop     
069f 00        nop     
06a0 00        nop     
06a1 00        nop     
06a2 00        nop     
06a3 00        nop     
06a4 00        nop     
06a5 00        nop     
06a6 00        nop     
06a7 00        nop     
06a8 00        nop     
06a9 00        nop     
06aa 00        nop     
06ab 00        nop     
06ac 00        nop     
06ad 00        nop     
06ae 00        nop     
06af 00        nop     
06b0 00        nop     
06b1 00        nop     
06b2 00        nop     
06b3 00        nop     
06b4 00        nop     
06b5 00        nop     
06b6 00        nop     
06b7 00        nop     
06b8 b8        cp      b
06b9 06a7      ld      b,$a7
06bb 0c        inc     c
06bc 53        ld      d,e
06bd 43        ld      b,e
06be 52        ld      d,d
06bf 45        ld      b,l
06c0 45        ld      b,l
06c1 4e        ld      c,(hl)
06c2 2020      jr      nz,$06e4
06c4 c30307    jp      $0703
06c7 c3c707    jp      $07c7
06ca c3c207    jp      $07c2
06cd c33809    jp      $0938
06d0 c34e09    jp      $094e
06d3 c35b09    jp      $095b
06d6 c38e07    jp      $078e
06d9 c38209    jp      $0982
06dc c38f07    jp      $078f
06df c3a207    jp      $07a2
06e2 c33d0a    jp      $0a3d
06e5 c3280a    jp      $0a28
06e8 c39909    jp      $0999
06eb c3e109    jp      $09e1
06ee c3fa09    jp      $09fa
06f1 c3200a    jp      $0a20
06f4 c3880a    jp      $0a88
06f7 c3d20a    jp      $0ad2
06fa c38e07    jp      $078e
06fd c38e07    jp      $078e
0700 c38e07    jp      $078e
0703 21280c    ld      hl,$0c28
0706 7e        ld      a,(hl)
0707 b7        or      a
0708 c8        ret     z

0709 3600      ld      (hl),$00
070b 210d0c    ld      hl,$0c0d
070e 11170c    ld      de,$0c17
0711 060a      ld      b,$0a
0713 7e        ld      a,(hl)
0714 12        ld      (de),a
0715 23        inc     hl
0716 13        inc     de
0717 05        dec     b
0718 c21307    jp      nz,$0713
071b cdf10a    call    $0af1		send stringz to plotter
071e 1b2e2800  db      27,'.','(',0
0722 cdf10a    call    $0af1		send stringz to plotter
0725 1b2e4932  db      27,'.',"I20;;17:"
     303b3b31  db      27,'.',"N;19:", 0
     373a1b2e
     4e3b31393a00        
0737 21a007    ld      hl,$07a0
073a 11a007    ld      de,$07a0
073d cd4e09    call    $094e
0740 cdab0a    call    $0aab
0743 cdb609    call    $09b6
0746 21a007    ld      hl,$07a0
0749 cdfa09    call    $09fa
074c 21290c    ld      hl,$0c29
074f 3a7435    ld      a,($3574)
0752 b7        or      a
0753 c26407    jp      nz,$0764
0756 3a7635    ld      a,($3576)
0759 b7        or      a
075a ca7e07    jp      z,$077e
075d 110400    ld      de,$0004
0760 19        add     hl,de
0761 c37e07    jp      $077e
0764 110800    ld      de,$0008
0767 19        add     hl,de
0768 3a7735    ld      a,($3577)
076b b7        or      a
076c c27307    jp      nz,$0773
076f 110800    ld      de,$0008
0772 19        add     hl,de
0773 3a7635    ld      a,($3576)
0776 b7        or      a
0777 ca7e07    jp      z,$077e
077a 110400    ld      de,$0004
077d 19        add     hl,de
077e eb        ex      de,hl
077f 21410c    ld      hl,$0c41
0782 0604      ld      b,$04
0784 1a        ld      a,(de)
0785 77        ld      (hl),a
0786 13        inc     de
0787 23        inc     hl
0788 05        dec     b
0789 c28407    jp      nz,$0784
078c 3eff      ld      a,$ff
078e c9        ret     

078f 21a007    ld      hl,$07a0
0792 eb        ex      de,hl
0793 21a007    ld      hl,$07a0
0796 cd4e09    call    $094e
0799 21a007    ld      hl,$07a0
079c cd880a    call    $0a88
079f c9        ret     

07a0 00        nop     
07a1 00        nop     
07a2 21280c    ld      hl,$0c28
07a5 7e        ld      a,(hl)
07a6 b7        or      a
07a7 c0        ret     nz

07a8 36ff      ld      (hl),$ff
07aa 21a007    ld      hl,$07a0
07ad 11a007    ld      de,$07a0
07b0 cd4e09    call    $094e
07b3 cdf10a    call    $0af1		send stringz to plotter
07b6 5350303b  db      "SP0;"
07ba 1b2e2900  db      27, ".)"
07be cdbb05    call    $05bb
07c1 c9        ret     

07c2 7e        ld      a,(hl)
07c3 32200c    ld      ($0c20),a
07c6 c9        ret     

07c7 23        inc     hl
07c8 3600      ld      (hl),$00
07ca 2b        dec     hl
07cb e5        push    hl
07cc 3a7535    ld      a,($3575)
07cf b7        or      a
07d0 c28008    jp      nz,$0880
07d3 e1        pop     hl
07d4 e5        push    hl
07d5 cdf007    call    $07f0
07d8 b7        or      a
07d9 cad507    jp      z,$07d5
07dc e1        pop     hl
07dd 3a1108    ld      a,($0811)
07e0 77        ld      (hl),a
07e1 b7        or      a
07e2 c8        ret     z

07e3 3a200c    ld      a,($0c20)
07e6 b7        or      a
07e7 cad407    jp      z,$07d4
07ea fe02      cp      $02
07ec c0        ret     nz

07ed 3602      ld      (hl),$02
07ef c9        ret     

07f0 cd0478    call    $7804
07f3 b7        or      a
07f4 c8        ret     z

07f5 cdaa77    call    $77aa
07f8 211108    ld      hl,$0811
07fb 3600      ld      (hl),$00
07fd fe1b      cp      $1b
07ff c8        ret     z

0800 3601      ld      (hl),$01
0802 fe0d      cp      $0d
0804 c8        ret     z

0805 4f        ld      c,a
0806 3a200c    ld      a,($0c20)
0809 fe02      cp      $02
080b c0        ret     nz

080c cd1208    call    $0812
080f af        xor     a
0810 c9        ret     

0811 00        nop     
0812 3a8735    ld      a,($3587)
0815 b9        cp      c
0816 c22308    jp      nz,$0823
0819 21210c    ld      hl,$0c21
081c 56        ld      d,(hl)
081d 23        inc     hl
081e 5e        ld      e,(hl)
081f 72        ld      (hl),d
0820 2b        dec     hl
0821 73        ld      (hl),e
0822 c9        ret     

0823 cd5c08    call    $085c
0826 c0        ret     nz

0827 e5        push    hl
0828 eb        ex      de,hl
0829 5e        ld      e,(hl)
082a 23        inc     hl
082b 56        ld      d,(hl)
082c 3a210c    ld      a,($0c21)
082f 4f        ld      c,a
0830 13        inc     de
0831 78        ld      a,b
0832 b7        or      a
0833 c23808    jp      nz,$0838
0836 1b        dec     de
0837 1b        dec     de
0838 0d        dec     c
0839 c23008    jp      nz,$0830
083c eb        ex      de,hl
083d 44        ld      b,h
083e 4d        ld      c,l
083f e1        pop     hl
0840 7d        ld      a,l
0841 91        sub     c
0842 7c        ld      a,h
0843 98        sbc     a,b
0844 d25508    jp      nc,$0855
0847 78        ld      a,b
0848 e680      and     $80
084a c25208    jp      nz,$0852
084d 44        ld      b,h
084e 4d        ld      c,l
084f c35508    jp      $0855
0852 010000    ld      bc,$0000
0855 eb        ex      de,hl
0856 70        ld      (hl),b
0857 2b        dec     hl
0858 71        ld      (hl),c
0859 c34809    jp      $0948
085c 2a410c    ld      hl,($0c41)
085f 11490c    ld      de,$0c49
0862 0600      ld      b,$00
0864 3a8335    ld      a,($3583)
0867 b9        cp      c
0868 c8        ret     z

0869 04        inc     b
086a 3a8435    ld      a,($3584)
086d b9        cp      c
086e c8        ret     z

086f 2a430c    ld      hl,($0c43)
0872 114b0c    ld      de,$0c4b
0875 3a8535    ld      a,($3585)
0878 b9        cp      c
0879 c8        ret     z

087a 05        dec     b
087b 3a8635    ld      a,($3586)
087e b9        cp      c
087f c9        ret     

0880 3a200c    ld      a,($0c20)
0883 fe02      cp      $02
0885 ca9c08    jp      z,$089c
0888 cd0b78    call    $780b
088b fe1b      cp      $1b
088d 0600      ld      b,$00
088f ca9908    jp      z,$0899
0892 fe0d      cp      $0d
0894 0601      ld      b,$01
0896 c28808    jp      nz,$0888
0899 e1        pop     hl
089a 70        ld      (hl),b
089b c9        ret     

089c cdf10a    call    $0af1		send stringz to plotter
089f 44503b00  db      "DP;",0
08a3 cd0478    call    $7804
08a6 b7        or      a
08a7 cabe08    jp      z,$08be
08aa cd0b78    call    $780b
08ad fe1b      cp      $1b
08af 0600      ld      b,$00
08b1 c2be08    jp      nz,$08be
08b4 cdf10a    call    $0af1		send stringz to plotter
08b7 44433b00  db      "DC;",0
08bb c39908    jp      $0899
08be cd1409    call    $0914
08c1 cdf10a    call    $0af1		send stringz to plotter
08c4 4f5300    db      "OS",0
08c7 211f09    ld      hl,$091f
08ca cd0409    call    $0904
08cd 211f09    ld      hl,$091f
08d0 cd0f0b    call    $0b0f
08d3 7d        ld      a,l
08d4 e604      and     $04
08d6 caa308    jp      z,$08a3
08d9 cdf10a    call    $0af1		send stringz to plotter
08dc 4f4400    db      "OD",0
08df 211f09    ld      hl,$091f
08e2 cd0409    call    $0904
08e5 cdf008    call    $08f0
08e8 cd4809    call    $0948
08eb 0602      ld      b,$02
08ed e1        pop     hl
08ee 70        ld      (hl),b
08ef c9        ret     

08f0 211f09    ld      hl,$091f
08f3 cd0f0b    call    $0b0f
08f6 e5        push    hl
08f7 eb        ex      de,hl
08f8 23        inc     hl
08f9 cd0f0b    call    $0b0f
08fc 224b0c    ld      ($0c4b),hl
08ff e1        pop     hl
0900 22490c    ld      ($0c49),hl
0903 c9        ret     

0904 e5        push    hl
0905 cdc705    call    $05c7
0908 e1        pop     hl
0909 fe0d      cp      $0d
090b da0409    jp      c,$0904
090e 77        ld      (hl),a
090f c8        ret     z

0910 23        inc     hl
0911 c30409    jp      $0904
0914 cdc405    call    $05c4
0917 b7        or      a
0918 c8        ret     z

0919 cdc705    call    $05c7
091c c31409    jp      $0914
091f 00        nop     
0920 00        nop     
0921 00        nop     
0922 00        nop     
0923 00        nop     
0924 00        nop     
0925 00        nop     
0926 00        nop     
0927 00        nop     
0928 00        nop     
0929 00        nop     
092a 00        nop     
092b 00        nop     
092c 00        nop     
092d 00        nop     
092e 00        nop     
092f 00        nop     
0930 00        nop     
0931 00        nop     
0932 00        nop     
0933 00        nop     
0934 00        nop     
0935 00        nop     
0936 00        nop     
0937 00        nop     
0938 d5        push    de
0939 eb        ex      de,hl
093a 21490c    ld      hl,$0c49
093d cd9009    call    $0990
0940 d1        pop     de
0941 214b0c    ld      hl,$0c4b
0944 cd9009    call    $0990
0947 c9        ret     

0948 21490c    ld      hl,$0c49
094b 114b0c    ld      de,$0c4b
094e cd670b    call    $0b67
0951 cdf10a    call    $0af1		send stringz to plotter
0954 50553b00  db      "PU;",0
0958 c36509    jp      $0965

095b cd670b    call    $0b67
095e cdf10a    call    $0af1		send stringz to plotter
0961 50443b00  db      "PD;",0
0965 cdf10a    call    $0af1		send stringz to plotter
0968 504100    db      "PA",0
096b 2a490c    ld      hl,($0c49)
096e cd880b    call    $0b88
0971 3e20      ld      a,$20
0973 cdfd0a    call    $0afd
0976 2a4b0c    ld      hl,($0c4b)
0979 cd880b    call    $0b88
097c 3e3b      ld      a,$3b
097e cdfd0a    call    $0afd
0981 c9        ret     

0982 11410c    ld      de,$0c41
0985 0608      ld      b,$08
0987 1a        ld      a,(de)
0988 77        ld      (hl),a
0989 23        inc     hl
098a 13        inc     de
098b 05        dec     b
098c c28709    jp      nz,$0987
098f c9        ret     

0990 7e        ld      a,(hl)
0991 12        ld      (de),a
0992 23        inc     hl
0993 13        inc     de
0994 7e        ld      a,(hl)
0995 12        ld      (de),a
0996 23        inc     hl
0997 13        inc     de
0998 c9        ret     

0999 0a        ld      a,(bc)
099a 6f        ld      l,a
099b 03        inc     bc
099c 0a        ld      a,(bc)
099d 67        ld      h,a
099e 221c0c    ld      ($0c1c),hl
09a1 e5        push    hl
09a2 eb        ex      de,hl
09a3 7e        ld      a,(hl)
09a4 23        inc     hl
09a5 66        ld      h,(hl)
09a6 6f        ld      l,a
09a7 221a0c    ld      ($0c1a),hl
09aa e1        pop     hl
09ab 29        add     hl,hl
09ac eb        ex      de,hl
09ad 210300    ld      hl,$0003
09b0 cd2180    call    $8021
09b3 22180c    ld      ($0c18),hl
09b6 cdf10a    call    $0af1		send stringz to plotter
09b9 534900    db      "SI",0
09bc 2a180c    ld      hl,($0c18)
09bf cdd009    call    $09d0
09c2 3e2c      ld      a,$2c
09c4 cdfd0a    call    $0afd
09c7 2a1a0c    ld      hl,($0c1a)
09ca cdd009    call    $09d0
09cd c3e10a    jp      $0ae1
09d0 110500    ld      de,$0005
09d3 cd7d80    call    $807d
09d6 eb        ex      de,hl
09d7 210200    ld      hl,$0002
09da cd2180    call    $8021
09dd cd7a0b    call    $0b7a
09e0 c9        ret     

09e1 e5        push    hl
09e2 d5        push    de
09e3 50        ld      d,b
09e4 59        ld      e,c
09e5 211c0c    ld      hl,$0c1c
09e8 cd9009    call    $0990
09eb d1        pop     de
09ec 211a0c    ld      hl,$0c1a
09ef cd9009    call    $0990
09f2 d1        pop     de
09f3 21180c    ld      hl,$0c18
09f6 cd9009    call    $0990
09f9 c9        ret     

09fa 11a10c    ld      de,$0ca1
09fd cd7f0b    call    $0b7f
0a00 cd4d0c    call    $0c4d
0a03 cdf10a    call    $0af1		send stringz to plotter
0a06 444900    db      "DI",0
0a09 2aa50c    ld      hl,($0ca5)
0a0c cd880b    call    $0b88
0a0f 3e2c      ld      a,$2c
0a11 cdfd0a    call    $0afd
0a14 2aa30c    ld      hl,($0ca3)
0a17 cd880b    call    $0b88
0a1a 3e3b      ld      a,$3b
0a1c cdfd0a    call    $0afd
0a1f c9        ret     

0a20 eb        ex      de,hl
0a21 21a10c    ld      hl,$0ca1
0a24 cd9009    call    $0990
0a27 c9        ret     

0a28 e5        push    hl
0a29 d5        push    de
0a2a cdf10a    call    $0af1		send stringz to plotter
0a2d 4c4200    db      "LB",0 
0a30 d1        pop     de
0a31 e1        pop     hl
0a32 1a        ld      a,(de)
0a33 47        ld      b,a
0a34 cde70a    call    $0ae7
0a37 3e03      ld      a,$03
0a39 cdfd0a    call    $0afd
0a3c c9        ret     

0a3d 0a        ld      a,(bc)
0a3e fe20      cp      $20
0a40 da7a0a    jp      c,$0a7a
0a43 c5        push    bc
0a44 d5        push    de
0a45 5e        ld      e,(hl)
0a46 23        inc     hl
0a47 56        ld      d,(hl)
0a48 2a180c    ld      hl,($0c18)
0a4b af        xor     a
0a4c 7c        ld      a,h
0a4d 1f        rra     
0a4e 67        ld      h,a
0a4f 7d        ld      a,l
0a50 1f        rra     
0a51 6f        ld      l,a
0a52 eb        ex      de,hl
0a53 cdda0a    call    $0ada
0a56 22490c    ld      ($0c49),hl
0a59 e1        pop     hl
0a5a 5e        ld      e,(hl)
0a5b 23        inc     hl
0a5c 56        ld      d,(hl)
0a5d 2a1a0c    ld      hl,($0c1a)
0a60 af        xor     a
0a61 7c        ld      a,h
0a62 1f        rra     
0a63 67        ld      h,a
0a64 7d        ld      a,l
0a65 1f        rra     
0a66 6f        ld      l,a
0a67 eb        ex      de,hl
0a68 cdda0a    call    $0ada
0a6b 224b0c    ld      ($0c4b),hl
0a6e cd4809    call    $0948
0a71 e1        pop     hl
0a72 11780a    ld      de,$0a78
0a75 c3280a    jp      $0a28
0a78 0100cd    ld      bc,$cd00
0a7b 4e        ld      c,(hl)
0a7c 09        add     hl,bc
0a7d cdf10a    call    $0af1		send stringz to plotter
0a80 50443B    db "PD;PU;",0
0a83 50553b    
0a86 00        
0a87 c9        ret     

0a88 7e        ld      a,(hl)
0a89 211e0c    ld      hl,$0c1e
0a8c be        cp      (hl)
0a8d c8        ret     z

				hp7400: Select Pen query
0a8e 77        ld      (hl),a
0a8f fe00      cp      $00
0a91 caab0a    jp      z,$0aab
0a94 3d        dec     a
0a95 217335    ld      hl,$3573
0a98 be        cp      (hl)
0a99 daab0a    jp      c,$0aab
0a9c c631      add     a,$31
0a9e 32ce0a    ld      ($0ace),a
0aa1 21bf0a    ld      hl,$0abf		"Select pen # 1"
0aa4 cd1c78    call    $781c		print string$ at addr [HL]
0aa7 cdaa77    call    $77aa
0aaa c9        ret     

PATCH:
0a9e 32ce0a    ld      ($0ace),a    -> 32a60a   ld (0aa6),a
0aa1 21bf0a    ld      hl,$0abf     -> cdf10a   call $0af1	send stringz to plotter 
0aa4 cd1c78    call    $781c        -> 535031   DB "SP1;",0,0
0aa7 cdaa77    call    $77aa        -> 3b0000


0aab cdf10a    call    $0af1		send stringz to plotter
0aae 53        ld      d,e
0aaf 50        ld      d,b
0ab0 00        nop     
0ab1 3a1e0c    ld      a,($0c1e)
0ab4 c630      add     a,$30
0ab6 cdfd0a    call    $0afd
0ab9 cde10a    call    $0ae1
0abc 3eff      ld      a,$ff
0abe c9        ret     

0abf 0d        DB 13,10, "Select pen # 1",13,10,'$'
0ac0 0a 53656c656374 20 70656E 20 23 20 
0ace 32
0acf 0d0a24

0ad2 3a1e0c    ld      a,($0c1e)
0ad5 77        ld      (hl),a
0ad6 23        inc     hl
0ad7 3600      ld      (hl),$00
0ad9 c9        ret     

0ada 7d        ld      a,l
0adb 93        sub     e
0adc 6f        ld      l,a
0add 7c        ld      a,h
0ade 9a        sbc     a,d
0adf 67        ld      h,a
0ae0 c9        ret     

0ae1 3e3b      ld      a,$3b
0ae3 cdfd0a    call    $0afd
0ae6 c9        ret     

0ae7 7e        ld      a,(hl)
0ae8 cdfd0a    call    $0afd
0aeb 23        inc     hl
0aec 05        dec     b
0aed c2e70a    jp      nz,$0ae7
0af0 c9        ret     

				send stringz to plotter

0af1 e1        pop     hl
0af2 7e        ld      a,(hl)
0af3 23        inc     hl
0af4 b7        or      a
0af5 e5        push    hl
0af6 c8        ret     z
0af7 cdfd0a    call    $0afd
0afa c3f10a    jp      $0af1

0afd d5        push    de
0afe c5        push    bc
0aff e5        push    hl
0b00 cd070b    call    $0b07
0b03 e1        pop     hl
0b04 c1        pop     bc
0b05 d1        pop     de
0b06 c9        ret     

0b07 21270c    ld      hl,$0c27
0b0a 77        ld      (hl),a
0b0b cdc105    call    $05c1
0b0e c9        ret     

0b0f e5        push    hl
0b10 af        xor     a
0b11 32640b    ld      ($0b64),a
0b14 210000    ld      hl,$0000
0b17 22650b    ld      ($0b65),hl
0b1a e1        pop     hl
0b1b 7e        ld      a,(hl)
0b1c fe20      cp      $20
0b1e c2250b    jp      nz,$0b25
0b21 23        inc     hl
0b22 c31b0b    jp      $0b1b
0b25 7e        ld      a,(hl)
0b26 d62d      sub     $2d
0b28 c2310b    jp      nz,$0b31
0b2b 3eff      ld      a,$ff
0b2d 32640b    ld      ($0b64),a
0b30 23        inc     hl
0b31 7e        ld      a,(hl)
0b32 d630      sub     $30
0b34 da540b    jp      c,$0b54
0b37 fe0a      cp      $0a
0b39 d2540b    jp      nc,$0b54
0b3c e5        push    hl
0b3d 5f        ld      e,a
0b3e 1600      ld      d,$00
0b40 d5        push    de
0b41 2a650b    ld      hl,($0b65)
0b44 eb        ex      de,hl
0b45 210a00    ld      hl,$000a
0b48 cd7d80    call    $807d
0b4b d1        pop     de
0b4c 19        add     hl,de
0b4d 22650b    ld      ($0b65),hl
0b50 e1        pop     hl
0b51 c3300b    jp      $0b30
0b54 eb        ex      de,hl
0b55 2a650b    ld      hl,($0b65)
0b58 3a640b    ld      a,($0b64)
0b5b b7        or      a
0b5c c8        ret     z

0b5d af        xor     a
0b5e 95        sub     l
0b5f 6f        ld      l,a
0b60 9c        sbc     a,h
0b61 95        sub     l
0b62 67        ld      h,a
0b63 c9        ret     

0b64 00        nop     
0b65 00        nop     
0b66 00        nop     
0b67 cd740b    call    $0b74
0b6a 224b0c    ld      ($0c4b),hl
0b6d cd740b    call    $0b74
0b70 22490c    ld      ($0c49),hl
0b73 c9        ret     

0b74 eb        ex      de,hl
0b75 7e        ld      a,(hl)
0b76 23        inc     hl
0b77 66        ld      h,(hl)
0b78 6f        ld      l,a
0b79 c9        ret     

0b7a 1603      ld      d,$03
0b7c c39a0b    jp      $0b9a
0b7f 7e        ld      a,(hl)
0b80 12        ld      (de),a
0b81 23        inc     hl
0b82 13        inc     de
0b83 7e        ld      a,(hl)
0b84 12        ld      (de),a
0b85 23        inc     hl
0b86 13        inc     de
0b87 c9        ret     

0b88 7c        ld      a,h
0b89 b7        or      a
0b8a f2980b    jp      p,$0b98
0b8d af        xor     a
0b8e 95        sub     l
0b8f 6f        ld      l,a
0b90 9c        sbc     a,h
0b91 95        sub     l
0b92 67        ld      h,a
0b93 3e2d      ld      a,$2d
0b95 cdfd0a    call    $0afd
0b98 16ff      ld      d,$ff
0b9a 1e00      ld      e,$00
0b9c 22090c    ld      ($0c09),hl
0b9f eb        ex      de,hl
0ba0 22050c    ld      ($0c05),hl
0ba3 211027    ld      hl,$2710
0ba6 22070c    ld      ($0c07),hl
0ba9 2a090c    ld      hl,($0c09)
0bac eb        ex      de,hl
0bad 2a070c    ld      hl,($0c07)
0bb0 cd2180    call    $8021
0bb3 220b0c    ld      ($0c0b),hl
0bb6 eb        ex      de,hl
0bb7 2a070c    ld      hl,($0c07)
0bba cd7d80    call    $807d
0bbd eb        ex      de,hl
0bbe 2a090c    ld      hl,($0c09)
0bc1 cdda0a    call    $0ada
0bc4 22090c    ld      ($0c09),hl
0bc7 2a070c    ld      hl,($0c07)
0bca eb        ex      de,hl
0bcb 210a00    ld      hl,$000a
0bce cd2180    call    $8021
0bd1 22070c    ld      ($0c07),hl
0bd4 e5        push    hl
0bd5 cde80b    call    $0be8
0bd8 e1        pop     hl
0bd9 7d        ld      a,l
0bda b7        or      a
0bdb c8        ret     z

0bdc 3d        dec     a
0bdd c2a90b    jp      nz,$0ba9
0be0 3e80      ld      a,$80
0be2 32050c    ld      ($0c05),a
0be5 c3a90b    jp      $0ba9
0be8 21060c    ld      hl,$0c06
0beb 35        dec     (hl)
0bec 2b        dec     hl
0bed c2f70b    jp      nz,$0bf7
0bf0 3e2e      ld      a,$2e
0bf2 cdfd0a    call    $0afd
0bf5 3680      ld      (hl),$80
0bf7 3a0b0c    ld      a,($0c0b)
0bfa 5f        ld      e,a
0bfb 86        add     a,(hl)
0bfc c8        ret     z

0bfd 3680      ld      (hl),$80
0bff 7b        ld      a,e
0c00 c630      add     a,$30
0c02 c3fd0a    jp      $0afd
0c05 80        add     a,b
0c06 fa0000    jp      m,$0000
0c09 00        nop     
0c0a 00        nop     
0c0b 03        inc     bc
0c0c 00        nop     
0c0d ff        rst     $38
0c0e 4c        ld      c,h
0c0f 00        nop     
0c10 6c        ld      l,h
0c11 00        nop     
0c12 72        ld      (hl),d
0c13 00        nop     
0c14 010100    ld      bc,$0001
0c17 ff        rst     $38
0c18 44        ld      b,h
0c19 00        nop     
0c1a 74        ld      (hl),h
0c1b 00        nop     
0c1c 67        ld      h,a
0c1d 00        nop     
0c1e 02        ld      (bc),a
0c1f 01000a    ld      bc,$0a00
0c22 00        nop     
0c23 f40100    call    p,$0001
0c26 00        nop     
0c27 3b        dec     sp
0c28 00        nop     
0c29 3c        inc     a
0c2a 28e2      jr      z,$0c0e
0c2c 1d        dec     e
0c2d 94        sub     h
0c2e 2ae21d    ld      hl,($1de2)
0c31 7d        ld      a,l
0c32 281a      jr      z,$0c4e
0c34 1f        rra     
0c35 202b      jr      nz,$0c62
0c37 29        add     hl,hl
0c38 1e00      ld      e,$00
0c3a 41        ld      b,c
0c3b 7d        ld      a,l
0c3c 281e      jr      z,$0c5c
0c3e 3f        ccf     
0c3f 202b      jr      nz,$0c6c
0c41 3c        inc     a
0c42 28e2      jr      z,$0c26
0c44 1d        dec     e
0c45 f8        ret     m

0c46 03        inc     bc
0c47 f8        ret     m

0c48 03        inc     bc
0c49 24        inc     h
0c4a 03        inc     bc
0c4b cb05      rlc     l
0c4d 2aa10c    ld      hl,($0ca1)
0c50 cdde7f    call    $7fde
0c53 21950c    ld      hl,$0c95
0c56 cd007e    call    $7e00
0c59 219d0c    ld      hl,$0c9d
0c5c cdbe81    call    $81be
0c5f 21990c    ld      hl,$0c99
0c62 cdfe7e    call    $7efe
0c65 219d0c    ld      hl,$0c9d
0c68 cdbe81    call    $81be
0c6b 219d0c    ld      hl,$0c9d
0c6e cddb7a    call    $7adb
0c71 21900c    ld      hl,$0c90
0c74 cdfe7e    call    $7efe
0c77 cd807a    call    $7a80
0c7a 22a30c    ld      ($0ca3),hl
0c7d 219d0c    ld      hl,$0c9d
0c80 cdcf7a    call    $7acf
0c83 21900c    ld      hl,$0c90
0c86 cdfe7e    call    $7efe
0c89 cd807a    call    $7a80
0c8c 22a50c    ld      ($0ca5),hl
0c8f c9        ret     

0c90 00        nop     
0c91 00        nop     
0c92 7e        ld      a,(hl)
0c93 87        add     a,a
0c94 00        nop     
0c95 00        nop     
0c96 00        nop     
0c97 00        nop     
0c98 90        sub     b
0c99 cf        rst     $08
0c9a 0f        rrca    
0c9b 49        ld      c,c
0c9c 83        add     a,e
0c9d 00        nop     
0c9e 00        nop     
0c9f 00        nop     
0ca0 00        nop     
0ca1 00        nop     
0ca2 00        nop     
0ca3 00        nop     
0ca4 00        nop     
0ca5 7f        ld      a,a
0ca6 00        nop     
0ca7 00        nop     
0ca8 00        nop     
0ca9 00        nop     
0caa 00        nop     
0cab 00        nop     
0cac 00        nop     
0cad 00        nop     
0cae 00        nop     
0caf 00        nop     
0cb0 00        nop     
0cb1 00        nop     
0cb2 00        nop     
0cb3 00        nop     
0cb4 00        nop     
0cb5 00        nop     
0cb6 00        nop     
0cb7 00        nop     
0cb8 00        nop     
0cb9 00        nop     
0cba 00        nop     
0cbb 00        nop     
0cbc 00        nop     
0cbd 00        nop     
0cbe 00        nop     
0cbf 00        nop     
0cc0 00        nop     
0cc1 00        nop     
0cc2 00        nop     
0cc3 00        nop     
0cc4 00        nop     
0cc5 00        nop     
0cc6 00        nop     
0cc7 00        nop     
0cc8 00        nop     
0cc9 00        nop     
0cca 00        nop     
0ccb 00        nop     
0ccc 00        nop     
0ccd 00        nop     
0cce 00        nop     
0ccf 00        nop     
0cd0 00        nop     
0cd1 00        nop     
0cd2 00        nop     
0cd3 00        nop     
0cd4 00        nop     
0cd5 00        nop     
0cd6 00        nop     
0cd7 00        nop     
0cd8 00        nop     
0cd9 00        nop     
0cda 00        nop     
0cdb 00        nop     
0cdc 00        nop     
0cdd 00        nop     
0cde 00        nop     
0cdf 00        nop     
0ce0 00        nop     
0ce1 00        nop     
0ce2 00        nop     
0ce3 00        nop     
0ce4 00        nop     
0ce5 00        nop     
0ce6 00        nop     
0ce7 00        nop     
0ce8 00        nop     
0ce9 00        nop     
0cea 00        nop     
0ceb 00        nop     
0cec 00        nop     
0ced 00        nop     
0cee 00        nop     
0cef 00        nop     
0cf0 00        nop     
0cf1 00        nop     
0cf2 00        nop     
0cf3 00        nop     
0cf4 00        nop     
0cf5 00        nop     
0cf6 00        nop     
0cf7 00        nop     
0cf8 00        nop     
0cf9 00        nop     
0cfa 00        nop     
0cfb 00        nop     
0cfc 00        nop     
0cfd 00        nop     
0cfe 00        nop     
0cff 00        nop     
0d00 00        nop     
0d01 00        nop     
0d02 00        nop     
0d03 00        nop     
0d04 00        nop     
0d05 00        nop     
0d06 00        nop     
0d07 00        nop     
0d08 00        nop     
0d09 00        nop     
0d0a 00        nop     
0d0b 00        nop     
0d0c 00        nop     
0d0d 00        nop     
0d0e 00        nop     
0d0f 00        nop     
0d10 00        nop     
0d11 00        nop     
0d12 00        nop     
0d13 00        nop     
0d14 00        nop     
0d15 00        nop     
0d16 00        nop     
0d17 00        nop     
0d18 00        nop     
0d19 00        nop     
0d1a 00        nop     
0d1b 00        nop     
0d1c 00        nop     
0d1d 00        nop     
0d1e 00        nop     
0d1f 00        nop     
0d20 00        nop     
0d21 00        nop     
0d22 00        nop     
0d23 00        nop     
0d24 00        nop     
0d25 00        nop     
0d26 00        nop     
0d27 00        nop     
0d28 00        nop     
0d29 00        nop     
0d2a 00        nop     
0d2b 00        nop     
0d2c 00        nop     
0d2d 00        nop     
0d2e 00        nop     
0d2f 00        nop     
0d30 00        nop     
0d31 00        nop     
0d32 00        nop     
0d33 00        nop     
0d34 00        nop     
0d35 00        nop     
0d36 00        nop     
0d37 00        nop     
0d38 00        nop     
0d39 00        nop     
0d3a 00        nop     
0d3b 00        nop     
0d3c 00        nop     
0d3d 00        nop     
0d3e 00        nop     
0d3f 00        nop     
0d40 00        nop     
0d41 00        nop     
0d42 00        nop     
0d43 00        nop     
0d44 00        nop     
0d45 00        nop     
0d46 00        nop     
0d47 00        nop     
0d48 00        nop     
0d49 00        nop     
0d4a 00        nop     
0d4b 00        nop     
0d4c 00        nop     
0d4d 00        nop     
0d4e 00        nop     
0d4f 00        nop     
0d50 00        nop     
0d51 00        nop     
0d52 00        nop     
0d53 00        nop     
0d54 00        nop     
0d55 00        nop     
0d56 00        nop     
0d57 00        nop     
0d58 00        nop     
0d59 00        nop     
0d5a 00        nop     
0d5b 00        nop     
0d5c 00        nop     
0d5d 00        nop     
0d5e 00        nop     
0d5f 00        nop     
0d60 00        nop     
0d61 00        nop     
0d62 00        nop     
0d63 00        nop     
0d64 00        nop     
0d65 00        nop     
0d66 00        nop     
0d67 00        nop     
0d68 00        nop     
0d69 00        nop     
0d6a 00        nop     
0d6b 00        nop     
0d6c 00        nop     
0d6d 00        nop     
0d6e 00        nop     
0d6f 00        nop     
0d70 00        nop     
0d71 00        nop     
0d72 00        nop     
0d73 00        nop     
0d74 00        nop     
0d75 00        nop     
0d76 00        nop     
0d77 00        nop     
0d78 00        nop     
0d79 00        nop     
0d7a 00        nop     
0d7b 00        nop     
0d7c 00        nop     
0d7d 00        nop     
0d7e 00        nop     
0d7f 00        nop     
0d80 00        nop     
0d81 00        nop     
0d82 00        nop     
0d83 00        nop     
0d84 00        nop     
0d85 00        nop     
0d86 00        nop     
0d87 00        nop     
0d88 00        nop     
0d89 00        nop     
0d8a 00        nop     
0d8b 00        nop     
0d8c 00        nop     
0d8d 00        nop     
0d8e 00        nop     
0d8f 00        nop     
0d90 00        nop     
0d91 00        nop     
0d92 00        nop     
0d93 00        nop     
0d94 00        nop     
0d95 00        nop     
0d96 00        nop     
0d97 00        nop     
0d98 00        nop     
0d99 00        nop     
0d9a 00        nop     
0d9b 00        nop     
0d9c 00        nop     
0d9d 00        nop     
0d9e 00        nop     
0d9f 00        nop     
0da0 00        nop     
0da1 00        nop     
0da2 00        nop     
0da3 00        nop     
0da4 00        nop     
0da5 00        nop     
0da6 00        nop     
0da7 00        nop     
0da8 00        nop     
0da9 00        nop     
0daa 00        nop     
0dab 00        nop     
0dac 00        nop     
0dad 00        nop     
0dae 00        nop     
0daf 00        nop     
0db0 00        nop     
0db1 00        nop     
0db2 00        nop     
0db3 00        nop     
0db4 00        nop     
0db5 00        nop     
0db6 00        nop     
0db7 00        nop     
0db8 00        nop     
0db9 00        nop     
0dba 00        nop     
0dbb 00        nop     
0dbc 00        nop     
0dbd 00        nop     
0dbe 00        nop     
0dbf 00        nop     
0dc0 00        nop     
0dc1 00        nop     
0dc2 00        nop     
0dc3 00        nop     
0dc4 00        nop     
0dc5 00        nop     
0dc6 00        nop     
0dc7 00        nop     
0dc8 00        nop     
0dc9 00        nop     
0dca 00        nop     
0dcb 00        nop     
0dcc 00        nop     
0dcd 00        nop     
0dce 00        nop     
0dcf 00        nop     
0dd0 00        nop     
0dd1 00        nop     
0dd2 00        nop     
0dd3 00        nop     
0dd4 00        nop     
0dd5 00        nop     
0dd6 00        nop     
0dd7 00        nop     
0dd8 00        nop     
0dd9 00        nop     
0dda 00        nop     
0ddb 00        nop     
0ddc 00        nop     
0ddd 00        nop     
0dde 00        nop     
0ddf 00        nop     
0de0 00        nop     
0de1 00        nop     
0de2 00        nop     
0de3 00        nop     
0de4 00        nop     
0de5 00        nop     
0de6 00        nop     
0de7 00        nop     
0de8 00        nop     
0de9 00        nop     
0dea 00        nop     
0deb 00        nop     
0dec 00        nop     
0ded 00        nop     
0dee 00        nop     
0def 00        nop     
0df0 00        nop     
0df1 00        nop     
0df2 00        nop     
0df3 00        nop     
0df4 00        nop     
0df5 00        nop     
0df6 00        nop     
0df7 00        nop     
0df8 00        nop     
0df9 00        nop     
0dfa 00        nop     
0dfb 00        nop     
0dfc 00        nop     
0dfd 00        nop     
0dfe 00        nop     
0dff 00        nop     
0e00 00        nop     
0e01 00        nop     
0e02 00        nop     
0e03 00        nop     
0e04 00        nop     
0e05 00        nop     
0e06 00        nop     
0e07 00        nop     
0e08 00        nop     
0e09 00        nop     
0e0a 00        nop     
0e0b 00        nop     
0e0c 00        nop     
0e0d 00        nop     
0e0e 00        nop     
0e0f 00        nop     
0e10 00        nop     
0e11 00        nop     
0e12 00        nop     
0e13 00        nop     
0e14 00        nop     
0e15 00        nop     
0e16 00        nop     
0e17 00        nop     
0e18 00        nop     
0e19 00        nop     
0e1a 00        nop     
0e1b 00        nop     
0e1c 00        nop     
0e1d 00        nop     
0e1e 00        nop     
0e1f 00        nop     
0e20 00        nop     
0e21 00        nop     
0e22 00        nop     
0e23 00        nop     
0e24 00        nop     
0e25 00        nop     
0e26 00        nop     
0e27 00        nop     
0e28 00        nop     
0e29 00        nop     
0e2a 00        nop     
0e2b 00        nop     
0e2c 00        nop     
0e2d 00        nop     
0e2e 00        nop     
0e2f 00        nop     
0e30 00        nop     
0e31 00        nop     
0e32 00        nop     
0e33 00        nop     
0e34 00        nop     
0e35 00        nop     
0e36 00        nop     
0e37 00        nop     
0e38 00        nop     
0e39 00        nop     
0e3a 00        nop     
0e3b 00        nop     
0e3c 00        nop     
0e3d 00        nop     
0e3e 00        nop     
0e3f 00        nop     
0e40 00        nop     
0e41 00        nop     
0e42 00        nop     
0e43 00        nop     
0e44 00        nop     
0e45 00        nop     
0e46 00        nop     
0e47 00        nop     
0e48 00        nop     
0e49 00        nop     
0e4a 00        nop     
0e4b 00        nop     
0e4c 00        nop     
0e4d 00        nop     
0e4e 00        nop     
0e4f 00        nop     
0e50 00        nop     
0e51 00        nop     
0e52 00        nop     
0e53 00        nop     
0e54 00        nop     
0e55 00        nop     
0e56 00        nop     
0e57 00        nop     
0e58 00        nop     
0e59 00        nop     
0e5a 00        nop     
0e5b 00        nop     
0e5c 00        nop     
0e5d 00        nop     
0e5e 00        nop     
0e5f 00        nop     
0e60 00        nop     
0e61 00        nop     
0e62 00        nop     
0e63 00        nop     
0e64 00        nop     
0e65 00        nop     
0e66 00        nop     
0e67 00        nop     
0e68 00        nop     
0e69 00        nop     
0e6a 00        nop     
0e6b 00        nop     
0e6c 00        nop     
0e6d 00        nop     
0e6e 00        nop     
0e6f 00        nop     
0e70 00        nop     
0e71 00        nop     
0e72 00        nop     
0e73 00        nop     
0e74 00        nop     
0e75 00        nop     
0e76 00        nop     
0e77 00        nop     
0e78 00        nop     
0e79 00        nop     
0e7a 00        nop     
0e7b 00        nop     
0e7c 00        nop     
0e7d 00        nop     
0e7e 00        nop     
0e7f 00        nop     
0e80 00        nop     
0e81 00        nop     
0e82 00        nop     
0e83 00        nop     
0e84 00        nop     
0e85 00        nop     
0e86 00        nop     
0e87 00        nop     
0e88 00        nop     
0e89 00        nop     
0e8a 00        nop     
0e8b 00        nop     
0e8c 00        nop     
0e8d 00        nop     
0e8e 00        nop     
0e8f 00        nop     
0e90 00        nop     
0e91 00        nop     
0e92 00        nop     
0e93 00        nop     
0e94 00        nop     
0e95 00        nop     
0e96 00        nop     
0e97 00        nop     
0e98 00        nop     
0e99 00        nop     
0e9a 00        nop     
0e9b 00        nop     
0e9c 00        nop     
0e9d 00        nop     
0e9e 00        nop     
0e9f 00        nop     
0ea0 00        nop     
0ea1 00        nop     
0ea2 00        nop     
0ea3 00        nop     
0ea4 00        nop     
0ea5 00        nop     
0ea6 00        nop     
0ea7 00        nop     
0ea8 00        nop     
0ea9 00        nop     
0eaa 00        nop     
0eab 00        nop     
0eac 00        nop     
0ead 00        nop     
0eae 00        nop     
0eaf 00        nop     
0eb0 00        nop     
0eb1 00        nop     
0eb2 00        nop     
0eb3 00        nop     
0eb4 00        nop     
0eb5 00        nop     
0eb6 00        nop     
0eb7 00        nop     
0eb8 00        nop     
0eb9 00        nop     
0eba 00        nop     
0ebb 00        nop     
0ebc 00        nop     
0ebd 00        nop     
0ebe 00        nop     
0ebf 00        nop     
0ec0 00        nop     
0ec1 00        nop     
0ec2 00        nop     
0ec3 00        nop     
0ec4 00        nop     
0ec5 00        nop     
0ec6 00        nop     
0ec7 00        nop     
0ec8 00        nop     
0ec9 00        nop     
0eca 00        nop     
0ecb 00        nop     
0ecc 00        nop     
0ecd 00        nop     
0ece 00        nop     
0ecf 00        nop     
0ed0 00        nop     
0ed1 00        nop     
0ed2 00        nop     
0ed3 00        nop     
0ed4 00        nop     
0ed5 00        nop     
0ed6 00        nop     
0ed7 00        nop     
0ed8 00        nop     
0ed9 00        nop     
0eda 00        nop     
0edb 00        nop     
0edc 00        nop     
0edd 00        nop     
0ede 00        nop     
0edf 00        nop     
0ee0 00        nop     
0ee1 00        nop     
0ee2 00        nop     
0ee3 00        nop     
0ee4 00        nop     
0ee5 00        nop     
0ee6 00        nop     
0ee7 00        nop     
0ee8 00        nop     
0ee9 00        nop     
0eea 00        nop     
0eeb 00        nop     
0eec 00        nop     
0eed 00        nop     
0eee 00        nop     
0eef 00        nop     
0ef0 00        nop     
0ef1 00        nop     
0ef2 00        nop     
0ef3 00        nop     
0ef4 00        nop     
0ef5 00        nop     
0ef6 00        nop     
0ef7 00        nop     
0ef8 00        nop     
0ef9 00        nop     
0efa 00        nop     
0efb 00        nop     
0efc 00        nop     
0efd 00        nop     
0efe 00        nop     
0eff 00        nop     
0f00 00        nop     
0f01 00        nop     
0f02 00        nop     
0f03 00        nop     
0f04 00        nop     
0f05 00        nop     
0f06 00        nop     
0f07 00        nop     
0f08 00        nop     
0f09 00        nop     
0f0a 00        nop     
0f0b 00        nop     
0f0c 00        nop     
0f0d 00        nop     
0f0e 00        nop     
0f0f 00        nop     
0f10 00        nop     
0f11 00        nop     
0f12 00        nop     
0f13 00        nop     
0f14 00        nop     
0f15 00        nop     
0f16 00        nop     
0f17 00        nop     
0f18 00        nop     
0f19 00        nop     
0f1a 00        nop     
0f1b 00        nop     
0f1c 00        nop     
0f1d 00        nop     
0f1e 00        nop     
0f1f 00        nop     
0f20 00        nop     
0f21 00        nop     
0f22 00        nop     
0f23 00        nop     
0f24 00        nop     
0f25 00        nop     
0f26 00        nop     
0f27 00        nop     
0f28 00        nop     
0f29 00        nop     
0f2a 00        nop     
0f2b 00        nop     
0f2c 00        nop     
0f2d 00        nop     
0f2e 00        nop     
0f2f 00        nop     
0f30 00        nop     
0f31 00        nop     
0f32 00        nop     
0f33 00        nop     
0f34 00        nop     
0f35 00        nop     
0f36 00        nop     
0f37 00        nop     
0f38 00        nop     
0f39 00        nop     
0f3a 00        nop     
0f3b 00        nop     
0f3c 00        nop     
0f3d 00        nop     
0f3e 00        nop     
0f3f 00        nop     
0f40 00        nop     
0f41 00        nop     
0f42 00        nop     
0f43 00        nop     
0f44 00        nop     
0f45 00        nop     
0f46 00        nop     
0f47 00        nop     
0f48 00        nop     
0f49 00        nop     
0f4a 00        nop     
0f4b 00        nop     
0f4c 00        nop     
0f4d 00        nop     
0f4e 00        nop     
0f4f 00        nop     
0f50 00        nop     
0f51 00        nop     
0f52 00        nop     
0f53 00        nop     
0f54 00        nop     
0f55 00        nop     
0f56 00        nop     
0f57 00        nop     
0f58 00        nop     
0f59 00        nop     
0f5a 00        nop     
0f5b 00        nop     
0f5c 00        nop     
0f5d 00        nop     
0f5e 00        nop     
0f5f 00        nop     
0f60 00        nop     
0f61 00        nop     
0f62 00        nop     
0f63 00        nop     
0f64 00        nop     
0f65 00        nop     
0f66 00        nop     
0f67 00        nop     
0f68 00        nop     
0f69 00        nop     
0f6a 00        nop     
0f6b 00        nop     
0f6c 00        nop     
0f6d 00        nop     
0f6e 00        nop     
0f6f 00        nop     
0f70 00        nop     
0f71 00        nop     
0f72 00        nop     
0f73 00        nop     
0f74 00        nop     
0f75 00        nop     
0f76 00        nop     
0f77 00        nop     
0f78 00        nop     
0f79 00        nop     
0f7a 00        nop     
0f7b 00        nop     
0f7c 00        nop     
0f7d 00        nop     
0f7e 00        nop     
0f7f 00        nop     
0f80 00        nop     
0f81 00        nop     
0f82 00        nop     
0f83 00        nop     
0f84 00        nop     
0f85 00        nop     
0f86 00        nop     
0f87 00        nop     
0f88 00        nop     
0f89 00        nop     
0f8a 00        nop     
0f8b 00        nop     
0f8c 00        nop     
0f8d 00        nop     
0f8e 00        nop     
0f8f 00        nop     
0f90 00        nop     
0f91 00        nop     
0f92 00        nop     
0f93 00        nop     
0f94 00        nop     
0f95 00        nop     
0f96 00        nop     
0f97 00        nop     
0f98 00        nop     
0f99 00        nop     
0f9a 00        nop     
0f9b 00        nop     
0f9c 00        nop     
0f9d 00        nop     
0f9e 00        nop     
0f9f 00        nop     
0fa0 00        nop     
0fa1 00        nop     
0fa2 00        nop     
0fa3 00        nop     
0fa4 00        nop     
0fa5 00        nop     
0fa6 00        nop     
0fa7 00        nop     
0fa8 00        nop     
0fa9 00        nop     
0faa 00        nop     
0fab 00        nop     
0fac 00        nop     
0fad 00        nop     
0fae 00        nop     
0faf 00        nop     
0fb0 00        nop     
0fb1 00        nop     
0fb2 00        nop     
0fb3 00        nop     
0fb4 00        nop     
0fb5 00        nop     
0fb6 00        nop     
0fb7 00        nop     
0fb8 00        nop     
0fb9 00        nop     
0fba 00        nop     
0fbb 00        nop     
0fbc 00        nop     
0fbd 00        nop     
0fbe 00        nop     
0fbf 00        nop     
0fc0 00        nop     
0fc1 00        nop     
0fc2 00        nop     
0fc3 00        nop     
0fc4 00        nop     
0fc5 00        nop     
0fc6 00        nop     
0fc7 00        nop     
0fc8 00        nop     
0fc9 00        nop     
0fca 00        nop     
0fcb 00        nop     
0fcc 00        nop     
0fcd 00        nop     
0fce 00        nop     
0fcf 00        nop     
0fd0 00        nop     
0fd1 00        nop     
0fd2 00        nop     
0fd3 00        nop     
0fd4 00        nop     
0fd5 00        nop     
0fd6 00        nop     
0fd7 00        nop     
0fd8 00        nop     
0fd9 00        nop     
0fda 00        nop     
0fdb 00        nop     
0fdc 00        nop     
0fdd 00        nop     
0fde 00        nop     
0fdf 00        nop     
0fe0 00        nop     
0fe1 00        nop     
0fe2 00        nop     
0fe3 00        nop     
0fe4 00        nop     
0fe5 00        nop     
0fe6 00        nop     
0fe7 00        nop     
0fe8 00        nop     
0fe9 00        nop     
0fea 00        nop     
0feb 00        nop     
0fec 00        nop     
0fed 00        nop     
0fee 00        nop     
0fef 00        nop     
0ff0 00        nop     
0ff1 00        nop     
0ff2 00        nop     
0ff3 00        nop     
0ff4 00        nop     
0ff5 00        nop     
0ff6 00        nop     
0ff7 00        nop     
0ff8 00        nop     
0ff9 00        nop     
0ffa 00        nop     
0ffb 00        nop     
0ffc 00        nop     
0ffd 00        nop     
0ffe 00        nop     
0fff 00        nop     
1000 00        nop     
1001 00        nop     
1002 00        nop     
1003 00        nop     
1004 00        nop     
1005 00        nop     
1006 00        nop     
1007 00        nop     
1008 00        nop     
1009 00        nop     
100a 00        nop     
100b 00        nop     
100c 00        nop     
100d 00        nop     
100e 00        nop     
100f 00        nop     
1010 00        nop     
1011 00        nop     
1012 00        nop     
1013 00        nop     
1014 00        nop     
1015 00        nop     
1016 00        nop     
1017 00        nop     
1018 00        nop     
1019 00        nop     
101a 00        nop     
101b 00        nop     
101c 00        nop     
101d 00        nop     
101e 00        nop     
101f 00        nop     
1020 00        nop     
1021 00        nop     
1022 00        nop     
1023 00        nop     
1024 00        nop     
1025 00        nop     
1026 00        nop     
1027 00        nop     
1028 00        nop     
1029 00        nop     
102a 00        nop     
102b 00        nop     
102c 00        nop     
102d 00        nop     
102e 00        nop     
102f 00        nop     
1030 00        nop     
1031 00        nop     
1032 00        nop     
1033 00        nop     
1034 00        nop     
1035 00        nop     
1036 00        nop     
1037 00        nop     
1038 00        nop     
1039 00        nop     
103a 00        nop     
103b 00        nop     
103c 00        nop     
103d 00        nop     
103e 00        nop     
103f 00        nop     
1040 00        nop     
1041 00        nop     
1042 00        nop     
1043 00        nop     
1044 00        nop     
1045 00        nop     
1046 00        nop     
1047 00        nop     
1048 00        nop     
1049 00        nop     
104a 00        nop     
104b 00        nop     
104c 00        nop     
104d 00        nop     
104e 00        nop     
104f 00        nop     
1050 00        nop     
1051 00        nop     
1052 00        nop     
1053 00        nop     
1054 00        nop     
1055 00        nop     
1056 00        nop     
1057 00        nop     
1058 00        nop     
1059 00        nop     
105a 00        nop     
105b 00        nop     
105c 00        nop     
105d 00        nop     
105e 00        nop     
105f 00        nop     
1060 00        nop     
1061 00        nop     
1062 00        nop     
1063 00        nop     
1064 00        nop     
1065 00        nop     
1066 00        nop     
1067 00        nop     
1068 00        nop     
1069 00        nop     
106a 00        nop     
106b 00        nop     
106c 00        nop     
106d 00        nop     
106e 00        nop     
106f 00        nop     
1070 00        nop     
1071 00        nop     
1072 00        nop     
1073 00        nop     
1074 00        nop     
1075 00        nop     
1076 00        nop     
1077 00        nop     
1078 00        nop     
1079 00        nop     
107a 00        nop     
107b 00        nop     
107c 00        nop     
107d 00        nop     
107e 00        nop     
107f 00        nop     
1080 00        nop     
1081 00        nop     
1082 00        nop     
1083 00        nop     
1084 00        nop     
1085 00        nop     
1086 00        nop     
1087 00        nop     
1088 00        nop     
1089 00        nop     
108a 00        nop     
108b 00        nop     
108c 00        nop     
108d 00        nop     
108e 00        nop     
108f 00        nop     
1090 00        nop     
1091 00        nop     
1092 00        nop     
1093 00        nop     
1094 00        nop     
1095 00        nop     
1096 00        nop     
1097 00        nop     
1098 00        nop     
1099 00        nop     
109a 00        nop     
109b 00        nop     
109c 00        nop     
109d 00        nop     
109e 00        nop     
109f 00        nop     
10a0 00        nop     
10a1 00        nop     
10a2 00        nop     
10a3 00        nop     
10a4 00        nop     
10a5 00        nop     
10a6 00        nop     
10a7 00        nop     
10a8 00        nop     
10a9 00        nop     
10aa 00        nop     
10ab 00        nop     
10ac 00        nop     
10ad 00        nop     
10ae 00        nop     
10af 00        nop     
10b0 00        nop     
10b1 00        nop     
10b2 00        nop     
10b3 00        nop     
10b4 00        nop     
10b5 00        nop     
10b6 00        nop     
10b7 00        nop     
10b8 00        nop     
10b9 00        nop     
10ba 00        nop     
10bb 00        nop     
10bc 00        nop     
10bd 00        nop     
10be 00        nop     
10bf 00        nop     
10c0 00        nop     
10c1 00        nop     
10c2 00        nop     
10c3 00        nop     
10c4 00        nop     
10c5 00        nop     
10c6 00        nop     
10c7 00        nop     
10c8 00        nop     
10c9 00        nop     
10ca 00        nop     
10cb 00        nop     
10cc 00        nop     
10cd 00        nop     
10ce 00        nop     
10cf 00        nop     
10d0 00        nop     
10d1 00        nop     
10d2 00        nop     
10d3 00        nop     
10d4 00        nop     
10d5 00        nop     
10d6 00        nop     
10d7 00        nop     
10d8 00        nop     
10d9 00        nop     
10da 00        nop     
10db 00        nop     
10dc 00        nop     
10dd 00        nop     
10de 00        nop     
10df 00        nop     
10e0 00        nop     
10e1 00        nop     
10e2 00        nop     
10e3 00        nop     
10e4 00        nop     
10e5 00        nop     
10e6 00        nop     
10e7 00        nop     
10e8 00        nop     
10e9 00        nop     
10ea 00        nop     
10eb 00        nop     
10ec 00        nop     
10ed 00        nop     
10ee 00        nop     
10ef 00        nop     
10f0 00        nop     
10f1 00        nop     
10f2 00        nop     
10f3 00        nop     
10f4 00        nop     
10f5 00        nop     
10f6 00        nop     
10f7 00        nop     
10f8 00        nop     
10f9 00        nop     
10fa 00        nop     
10fb 00        nop     
10fc 00        nop     
10fd 00        nop     
10fe 00        nop     
10ff 00        nop     
1100 00        nop     
1101 00        nop     
1102 00        nop     
1103 00        nop     
1104 00        nop     
1105 00        nop     
1106 00        nop     
1107 00        nop     
1108 00        nop     
1109 00        nop     
110a 00        nop     
110b 00        nop     
110c 00        nop     
110d 00        nop     
110e 00        nop     
110f 00        nop     
1110 00        nop     
1111 00        nop     
1112 00        nop     
1113 00        nop     
1114 00        nop     
1115 00        nop     
1116 00        nop     
1117 00        nop     
1118 00        nop     
1119 00        nop     
111a 00        nop     
111b 00        nop     
111c 00        nop     
111d 00        nop     
111e 00        nop     
111f 00        nop     
1120 00        nop     
1121 00        nop     
1122 00        nop     
1123 00        nop     
1124 00        nop     
1125 00        nop     
1126 00        nop     
1127 00        nop     
1128 00        nop     
1129 00        nop     
112a 00        nop     
112b 00        nop     
112c 00        nop     
112d 00        nop     
112e 00        nop     
112f 00        nop     
1130 00        nop     
1131 00        nop     
1132 00        nop     
1133 00        nop     
1134 00        nop     
1135 00        nop     
1136 00        nop     
1137 00        nop     
1138 00        nop     
1139 00        nop     
113a 00        nop     
113b 00        nop     
113c 00        nop     
113d 00        nop     
113e 00        nop     
113f 00        nop     
1140 00        nop     
1141 00        nop     
1142 00        nop     
1143 00        nop     
1144 00        nop     
1145 00        nop     
1146 00        nop     
1147 00        nop     
1148 00        nop     
1149 00        nop     
114a 00        nop     
114b 00        nop     
114c 00        nop     
114d 00        nop     
114e 00        nop     
114f 00        nop     
1150 00        nop     
1151 00        nop     
1152 00        nop     
1153 00        nop     
1154 00        nop     
1155 00        nop     
1156 00        nop     
1157 00        nop     
1158 00        nop     
1159 00        nop     
115a 00        nop     
115b 00        nop     
115c 00        nop     
115d 00        nop     
115e 00        nop     
115f 00        nop     
1160 00        nop     
1161 00        nop     
1162 00        nop     
1163 00        nop     
1164 00        nop     
1165 00        nop     
1166 00        nop     
1167 00        nop     
1168 00        nop     
1169 00        nop     
116a 00        nop     
116b 00        nop     
116c 00        nop     
116d 00        nop     
116e 00        nop     
116f 00        nop     
1170 00        nop     
1171 00        nop     
1172 00        nop     
1173 00        nop     
1174 00        nop     
1175 00        nop     
1176 00        nop     
1177 00        nop     
1178 00        nop     
1179 00        nop     
117a 00        nop     
117b 00        nop     
117c 00        nop     
117d 00        nop     
117e 00        nop     
117f 00        nop     
1180 00        nop     
1181 00        nop     
1182 00        nop     
1183 00        nop     
1184 00        nop     
1185 00        nop     
1186 00        nop     
1187 00        nop     
1188 00        nop     
1189 00        nop     
118a 00        nop     
118b 00        nop     
118c 00        nop     
118d 00        nop     
118e 00        nop     
118f 00        nop     
1190 00        nop     
1191 00        nop     
1192 00        nop     
1193 00        nop     
1194 00        nop     
1195 00        nop     
1196 00        nop     
1197 00        nop     
1198 00        nop     
1199 00        nop     
119a 00        nop     
119b 00        nop     
119c 00        nop     
119d 00        nop     
119e 00        nop     
119f 00        nop     
11a0 00        nop     
11a1 00        nop     
11a2 00        nop     
11a3 00        nop     
11a4 00        nop     
11a5 00        nop     
11a6 00        nop     
11a7 00        nop     
11a8 00        nop     
11a9 00        nop     
11aa 00        nop     
11ab 00        nop     
11ac 00        nop     
11ad 00        nop     
11ae 00        nop     
11af 00        nop     
11b0 00        nop     
11b1 00        nop     
11b2 00        nop     
11b3 00        nop     
11b4 00        nop     
11b5 00        nop     
11b6 00        nop     
11b7 00        nop     
11b8 00        nop     
11b9 00        nop     
11ba 00        nop     
11bb 00        nop     
11bc 00        nop     
11bd 00        nop     
11be 00        nop     
11bf 00        nop     
11c0 00        nop     
11c1 00        nop     
11c2 00        nop     
11c3 00        nop     
11c4 00        nop     
11c5 00        nop     
11c6 00        nop     
11c7 00        nop     
11c8 00        nop     
11c9 00        nop     
11ca 00        nop     
11cb 00        nop     
11cc 00        nop     
11cd 00        nop     
11ce 00        nop     
11cf 00        nop     
11d0 00        nop     
11d1 00        nop     
11d2 00        nop     
11d3 00        nop     
11d4 00        nop     
11d5 00        nop     
11d6 00        nop     
11d7 00        nop     
11d8 00        nop     
11d9 00        nop     
11da 00        nop     
11db 00        nop     
11dc 00        nop     
11dd 00        nop     
11de 00        nop     
11df 00        nop     
11e0 00        nop     
11e1 00        nop     
11e2 00        nop     
11e3 00        nop     
11e4 00        nop     
11e5 00        nop     
11e6 00        nop     
11e7 00        nop     
11e8 00        nop     
11e9 00        nop     
11ea 00        nop     
11eb 00        nop     
11ec 00        nop     
11ed 00        nop     
11ee 00        nop     
11ef 00        nop     
11f0 00        nop     
11f1 00        nop     
11f2 00        nop     
11f3 00        nop     
11f4 00        nop     
11f5 00        nop     
11f6 00        nop     
11f7 00        nop     
11f8 00        nop     
11f9 00        nop     
11fa 00        nop     
11fb 00        nop     
11fc 00        nop     
11fd 00        nop     
11fe 00        nop     
11ff 00        nop     
1200 00        nop     
1201 00        nop     
1202 00        nop     
1203 00        nop     
1204 00        nop     
1205 00        nop     
1206 00        nop     
1207 00        nop     
1208 00        nop     
1209 00        nop     
120a 00        nop     
120b 00        nop     
120c 00        nop     
120d 00        nop     
120e 00        nop     
120f 00        nop     
1210 00        nop     
1211 00        nop     
1212 00        nop     
1213 00        nop     
1214 00        nop     
1215 00        nop     
1216 00        nop     
1217 00        nop     
1218 00        nop     
1219 00        nop     
121a 00        nop     
121b 00        nop     
121c 00        nop     
121d 00        nop     
121e 00        nop     
121f 00        nop     
1220 00        nop     
1221 00        nop     
1222 00        nop     
1223 00        nop     
1224 00        nop     
1225 00        nop     
1226 00        nop     
1227 00        nop     
1228 00        nop     
1229 00        nop     
122a 00        nop     
122b 00        nop     
122c 00        nop     
122d 00        nop     
122e 00        nop     
122f 00        nop     
1230 00        nop     
1231 00        nop     
1232 00        nop     
1233 00        nop     
1234 00        nop     
1235 00        nop     
1236 00        nop     
1237 00        nop     
1238 00        nop     
1239 00        nop     
123a 00        nop     
123b 00        nop     
123c 00        nop     
123d 00        nop     
123e 00        nop     
123f 00        nop     
1240 00        nop     
1241 00        nop     
1242 00        nop     
1243 00        nop     
1244 00        nop     
1245 00        nop     
1246 00        nop     
1247 00        nop     
1248 00        nop     
1249 00        nop     
124a 00        nop     
124b 00        nop     
124c 00        nop     
124d 00        nop     
124e 00        nop     
124f 00        nop     
1250 00        nop     
1251 00        nop     
1252 00        nop     
1253 00        nop     
1254 00        nop     
1255 00        nop     
1256 00        nop     
1257 00        nop     
1258 00        nop     
1259 00        nop     
125a 00        nop     
125b 00        nop     
125c 00        nop     
125d 00        nop     
125e 00        nop     
125f 00        nop     
1260 00        nop     
1261 00        nop     
1262 00        nop     
1263 00        nop     
1264 00        nop     
1265 00        nop     
1266 00        nop     
1267 00        nop     
1268 00        nop     
1269 00        nop     
126a 00        nop     
126b 00        nop     
126c 00        nop     
126d 00        nop     
126e 00        nop     
126f 00        nop     
1270 00        nop     
1271 00        nop     
1272 00        nop     
1273 00        nop     
1274 00        nop     
1275 00        nop     
1276 00        nop     
1277 00        nop     
1278 00        nop     
1279 00        nop     
127a 00        nop     
127b 00        nop     
127c 00        nop     
127d 00        nop     
127e 00        nop     
127f 00        nop     
1280 00        nop     
1281 00        nop     
1282 00        nop     
1283 00        nop     
1284 00        nop     
1285 00        nop     
1286 00        nop     
1287 00        nop     
1288 00        nop     
1289 00        nop     
128a 00        nop     
128b 00        nop     
128c 00        nop     
128d 00        nop     
128e 00        nop     
128f 00        nop     
1290 00        nop     
1291 00        nop     
1292 00        nop     
1293 00        nop     
1294 00        nop     
1295 00        nop     
1296 00        nop     
1297 00        nop     
1298 00        nop     
1299 00        nop     
129a 00        nop     
129b 00        nop     
129c 00        nop     
129d 00        nop     
129e 00        nop     
129f 00        nop     
12a0 00        nop     
12a1 00        nop     
12a2 00        nop     
12a3 00        nop     
12a4 00        nop     
12a5 00        nop     
12a6 00        nop     
12a7 00        nop     
12a8 00        nop     
12a9 00        nop     
12aa 00        nop     
12ab 00        nop     
12ac 00        nop     
12ad 00        nop     
12ae 00        nop     
12af 00        nop     
12b0 00        nop     
12b1 00        nop     
12b2 00        nop     
12b3 00        nop     
12b4 00        nop     
12b5 00        nop     
12b6 00        nop     
12b7 00        nop     
12b8 00        nop     
12b9 00        nop     
12ba 00        nop     
12bb 00        nop     
12bc 00        nop     
12bd 00        nop     
12be 00        nop     
12bf 00        nop     
12c0 00        nop     
12c1 00        nop     
12c2 00        nop     
12c3 00        nop     
12c4 00        nop     
12c5 00        nop     
12c6 00        nop     
12c7 00        nop     
12c8 00        nop     
12c9 00        nop     
12ca 00        nop     
12cb 00        nop     
12cc 00        nop     
12cd 00        nop     
12ce 00        nop     
12cf 00        nop     
12d0 00        nop     
12d1 00        nop     
12d2 00        nop     
12d3 00        nop     
12d4 00        nop     
12d5 00        nop     
12d6 00        nop     
12d7 00        nop     
12d8 00        nop     
12d9 00        nop     
12da 00        nop     
12db 00        nop     
12dc 00        nop     
12dd 00        nop     
12de 00        nop     
12df 00        nop     
12e0 00        nop     
12e1 00        nop     
12e2 00        nop     
12e3 00        nop     
12e4 00        nop     
12e5 00        nop     
12e6 00        nop     
12e7 00        nop     
12e8 00        nop     
12e9 00        nop     
12ea 00        nop     
12eb 00        nop     
12ec 00        nop     
12ed 00        nop     
12ee 00        nop     
12ef 00        nop     
12f0 00        nop     
12f1 00        nop     
12f2 00        nop     
12f3 00        nop     
12f4 00        nop     
12f5 00        nop     
12f6 00        nop     
12f7 00        nop     
12f8 00        nop     
12f9 00        nop     
12fa 00        nop     
12fb 00        nop     
12fc 00        nop     
12fd 00        nop     
12fe 00        nop     
12ff 00        nop     
1300 00        nop     
1301 00        nop     
1302 00        nop     
1303 00        nop     
1304 00        nop     
1305 00        nop     
1306 00        nop     
1307 00        nop     
1308 00        nop     
1309 00        nop     
130a 00        nop     
130b 00        nop     
130c 00        nop     
130d 00        nop     
130e 00        nop     
130f 00        nop     
1310 00        nop     
1311 00        nop     
1312 00        nop     
1313 00        nop     
1314 00        nop     
1315 00        nop     
1316 00        nop     
1317 00        nop     
1318 00        nop     
1319 00        nop     
131a 00        nop     
131b 00        nop     
131c 00        nop     
131d 00        nop     
131e 00        nop     
131f 00        nop     
1320 00        nop     
1321 00        nop     
1322 00        nop     
1323 00        nop     
1324 00        nop     
1325 00        nop     
1326 00        nop     
1327 00        nop     
1328 00        nop     
1329 00        nop     
132a 00        nop     
132b 00        nop     
132c 00        nop     
132d 00        nop     
132e 00        nop     
132f 00        nop     
1330 00        nop     
1331 00        nop     
1332 00        nop     
1333 00        nop     
1334 00        nop     
1335 00        nop     
1336 00        nop     
1337 00        nop     
1338 00        nop     
1339 00        nop     
133a 00        nop     
133b 00        nop     
133c 00        nop     
133d 00        nop     
133e 00        nop     
133f 00        nop     
1340 00        nop     
1341 00        nop     
1342 00        nop     
1343 00        nop     
1344 00        nop     
1345 00        nop     
1346 00        nop     
1347 00        nop     
1348 00        nop     
1349 00        nop     
134a 00        nop     
134b 00        nop     
134c 00        nop     
134d 00        nop     
134e 00        nop     
134f 00        nop     
1350 00        nop     
1351 00        nop     
1352 00        nop     
1353 00        nop     
1354 00        nop     
1355 00        nop     
1356 00        nop     
1357 00        nop     
1358 00        nop     
1359 00        nop     
135a 00        nop     
135b 00        nop     
135c 00        nop     
135d 00        nop     
135e 00        nop     
135f 00        nop     
1360 00        nop     
1361 00        nop     
1362 00        nop     
1363 00        nop     
1364 00        nop     
1365 00        nop     
1366 00        nop     
1367 00        nop     
1368 00        nop     
1369 00        nop     
136a 00        nop     
136b 00        nop     
136c 00        nop     
136d 00        nop     
136e 00        nop     
136f 00        nop     
1370 00        nop     
1371 00        nop     
1372 00        nop     
1373 00        nop     
1374 00        nop     
1375 00        nop     
1376 00        nop     
1377 00        nop     
1378 00        nop     
1379 00        nop     
137a 00        nop     
137b 00        nop     
137c 00        nop     
137d 00        nop     
137e 00        nop     
137f 00        nop     
1380 00        nop     
1381 00        nop     
1382 00        nop     
1383 00        nop     
1384 00        nop     
1385 00        nop     
1386 00        nop     
1387 00        nop     
1388 00        nop     
1389 00        nop     
138a 00        nop     
138b 00        nop     
138c 00        nop     
138d 00        nop     
138e 00        nop     
138f 00        nop     
1390 00        nop     
1391 00        nop     
1392 00        nop     
1393 00        nop     
1394 00        nop     
1395 00        nop     
1396 00        nop     
1397 00        nop     
1398 00        nop     
1399 00        nop     
139a 00        nop     
139b 00        nop     
139c 00        nop     
139d 00        nop     
139e 00        nop     
139f 00        nop     
13a0 00        nop     
13a1 00        nop     
13a2 00        nop     
13a3 00        nop     
13a4 00        nop     
13a5 00        nop     
13a6 00        nop     
13a7 00        nop     
13a8 00        nop     
13a9 00        nop     
13aa 00        nop     
13ab 00        nop     
13ac 00        nop     
13ad 00        nop     
13ae 00        nop     
13af 00        nop     
13b0 00        nop     
13b1 00        nop     
13b2 00        nop     
13b3 00        nop     
13b4 00        nop     
13b5 00        nop     
13b6 00        nop     
13b7 00        nop     
13b8 00        nop     
13b9 00        nop     
13ba 00        nop     
13bb 00        nop     
13bc 00        nop     
13bd 00        nop     
13be 00        nop     
13bf 00        nop     
13c0 00        nop     
13c1 00        nop     
13c2 00        nop     
13c3 00        nop     
13c4 00        nop     
13c5 00        nop     
13c6 00        nop     
13c7 00        nop     
13c8 00        nop     
13c9 00        nop     
13ca 00        nop     
13cb 00        nop     
13cc 00        nop     
13cd 00        nop     
13ce 00        nop     
13cf 00        nop     
13d0 00        nop     
13d1 00        nop     
13d2 00        nop     
13d3 00        nop     
13d4 00        nop     
13d5 00        nop     
13d6 00        nop     
13d7 00        nop     
13d8 00        nop     
13d9 00        nop     
13da 00        nop     
13db 00        nop     
13dc 00        nop     
13dd 00        nop     
13de 00        nop     
13df 00        nop     
13e0 00        nop     
13e1 00        nop     
13e2 00        nop     
13e3 00        nop     
13e4 00        nop     
13e5 00        nop     
13e6 00        nop     
13e7 00        nop     
13e8 00        nop     
13e9 00        nop     
13ea 00        nop     
13eb 00        nop     
13ec 00        nop     
13ed 00        nop     
13ee 00        nop     
13ef 00        nop     
13f0 00        nop     
13f1 00        nop     
13f2 00        nop     
13f3 00        nop     
13f4 00        nop     
13f5 00        nop     
13f6 00        nop     
13f7 00        nop     
13f8 00        nop     
13f9 00        nop     
13fa 00        nop     
13fb 00        nop     
13fc 00        nop     
13fd 00        nop     
13fe 00        nop     
13ff 00        nop     
1400 00        nop     
1401 00        nop     
1402 00        nop     
1403 00        nop     
1404 00        nop     
1405 00        nop     
1406 00        nop     
1407 00        nop     
1408 00        nop     
1409 00        nop     
140a 00        nop     
140b 00        nop     
140c 00        nop     
140d 00        nop     
140e 00        nop     
140f 00        nop     
1410 00        nop     
1411 00        nop     
1412 00        nop     
1413 00        nop     
1414 00        nop     
1415 00        nop     
1416 00        nop     
1417 00        nop     
1418 00        nop     
1419 00        nop     
141a 00        nop     
141b 00        nop     
141c 00        nop     
141d 00        nop     
141e 00        nop     
141f 00        nop     
1420 00        nop     
1421 00        nop     
1422 00        nop     
1423 00        nop     
1424 00        nop     
1425 00        nop     
1426 00        nop     
1427 00        nop     
1428 00        nop     
1429 00        nop     
142a 00        nop     
142b 00        nop     
142c 00        nop     
142d 00        nop     
142e 00        nop     
142f 00        nop     
1430 00        nop     
1431 00        nop     
1432 00        nop     
1433 00        nop     
1434 00        nop     
1435 00        nop     
1436 00        nop     
1437 00        nop     
1438 00        nop     
1439 00        nop     
143a 00        nop     
143b 00        nop     
143c 00        nop     
143d 00        nop     
143e 00        nop     
143f 00        nop     
1440 00        nop     
1441 00        nop     
1442 00        nop     
1443 00        nop     
1444 00        nop     
1445 00        nop     
1446 00        nop     
1447 00        nop     
1448 00        nop     
1449 00        nop     
144a 00        nop     
144b 00        nop     
144c 00        nop     
144d 00        nop     
144e 00        nop     
144f 00        nop     
1450 00        nop     
1451 00        nop     
1452 00        nop     
1453 00        nop     
1454 00        nop     
1455 00        nop     
1456 00        nop     
1457 00        nop     
1458 00        nop     
1459 00        nop     
145a 00        nop     
145b 00        nop     
145c 00        nop     
145d 00        nop     
145e 00        nop     
145f 00        nop     
1460 00        nop     
1461 00        nop     
1462 00        nop     
1463 00        nop     
1464 00        nop     
1465 00        nop     
1466 00        nop     
1467 00        nop     
1468 00        nop     
1469 00        nop     
146a 00        nop     
146b 00        nop     
146c 00        nop     
146d 00        nop     
146e 00        nop     
146f 00        nop     
1470 00        nop     
1471 00        nop     
1472 00        nop     
1473 00        nop     
1474 00        nop     
1475 00        nop     
1476 00        nop     
1477 00        nop     
1478 00        nop     
1479 00        nop     
147a 00        nop     
147b 00        nop     
147c 00        nop     
147d 00        nop     
147e 00        nop     
147f 00        nop     
1480 00        nop     
1481 00        nop     
1482 00        nop     
1483 00        nop     
1484 00        nop     
1485 00        nop     
1486 00        nop     
1487 00        nop     
1488 00        nop     
1489 00        nop     
148a 00        nop     
148b 00        nop     
148c 00        nop     
148d 00        nop     
148e 00        nop     
148f 00        nop     
1490 00        nop     
1491 00        nop     
1492 00        nop     
1493 00        nop     
1494 00        nop     
1495 00        nop     
1496 00        nop     
1497 00        nop     
1498 00        nop     
1499 00        nop     
149a 00        nop     
149b 00        nop     
149c 00        nop     
149d 00        nop     
149e 00        nop     
149f 00        nop     
14a0 00        nop     
14a1 00        nop     
14a2 00        nop     
14a3 00        nop     
14a4 00        nop     
14a5 00        nop     
14a6 00        nop     
14a7 00        nop     
14a8 00        nop     
14a9 00        nop     
14aa 00        nop     
14ab 00        nop     
14ac 00        nop     
14ad 00        nop     
14ae 00        nop     
14af 00        nop     
14b0 00        nop     
14b1 00        nop     
14b2 00        nop     
14b3 00        nop     
14b4 00        nop     
14b5 00        nop     
14b6 00        nop     
14b7 00        nop     
14b8 00        nop     
14b9 00        nop     
14ba 00        nop     
14bb 00        nop     
14bc 00        nop     
14bd 00        nop     
14be 00        nop     
14bf 00        nop     
14c0 00        nop     
14c1 00        nop     
14c2 00        nop     
14c3 00        nop     
14c4 00        nop     
14c5 00        nop     
14c6 00        nop     
14c7 00        nop     
14c8 00        nop     
14c9 00        nop     
14ca 00        nop     
14cb 00        nop     
14cc 00        nop     
14cd 00        nop     
14ce 00        nop     
14cf 00        nop     
14d0 00        nop     
14d1 00        nop     
14d2 00        nop     
14d3 00        nop     
14d4 00        nop     
14d5 00        nop     
14d6 00        nop     
14d7 00        nop     
14d8 00        nop     
14d9 00        nop     
14da 00        nop     
14db 00        nop     
14dc 00        nop     
14dd 00        nop     
14de 00        nop     
14df 00        nop     
14e0 00        nop     
14e1 00        nop     
14e2 00        nop     
14e3 00        nop     
14e4 00        nop     
14e5 00        nop     
14e6 00        nop     
14e7 00        nop     
14e8 00        nop     
14e9 00        nop     
14ea 00        nop     
14eb 00        nop     
14ec 00        nop     
14ed 00        nop     
14ee 00        nop     
14ef 00        nop     
14f0 00        nop     
14f1 00        nop     
14f2 00        nop     
14f3 00        nop     
14f4 00        nop     
14f5 00        nop     
14f6 00        nop     
14f7 00        nop     
14f8 00        nop     
14f9 00        nop     
14fa 00        nop     
14fb 00        nop     
14fc 00        nop     
14fd 00        nop     
14fe 00        nop     
14ff 00        nop     
1500 00        nop     
1501 00        nop     
1502 00        nop     
1503 00        nop     
1504 00        nop     
1505 00        nop     
1506 00        nop     
1507 00        nop     
1508 00        nop     
1509 00        nop     
150a 00        nop     
150b 00        nop     
150c 00        nop     
150d 00        nop     
150e 00        nop     
150f 00        nop     
1510 00        nop     
1511 00        nop     
1512 00        nop     
1513 00        nop     
1514 00        nop     
1515 00        nop     
1516 00        nop     
1517 00        nop     
1518 00        nop     
1519 00        nop     
151a 00        nop     
151b 00        nop     
151c 00        nop     
151d 00        nop     
151e 00        nop     
151f 00        nop     
1520 00        nop     
1521 00        nop     
1522 00        nop     
1523 00        nop     
1524 00        nop     
1525 00        nop     
1526 00        nop     
1527 00        nop     
1528 00        nop     
1529 00        nop     
152a 00        nop     
152b 00        nop     
152c 00        nop     
152d 00        nop     
152e 00        nop     
152f 00        nop     
1530 00        nop     
1531 00        nop     
1532 00        nop     
1533 00        nop     
1534 00        nop     
1535 00        nop     
1536 00        nop     
1537 00        nop     
1538 00        nop     
1539 00        nop     
153a 00        nop     
153b 00        nop     
153c 00        nop     
153d 00        nop     
153e 00        nop     
153f 00        nop     
1540 00        nop     
1541 00        nop     
1542 00        nop     
1543 00        nop     
1544 00        nop     
1545 00        nop     
1546 00        nop     
1547 00        nop     
1548 00        nop     
1549 00        nop     
154a 00        nop     
154b 00        nop     
154c 00        nop     
154d 00        nop     
154e 00        nop     
154f 00        nop     
1550 00        nop     
1551 00        nop     
1552 00        nop     
1553 00        nop     
1554 00        nop     
1555 00        nop     
1556 00        nop     
1557 00        nop     
1558 00        nop     
1559 00        nop     
155a 00        nop     
155b 00        nop     
155c 00        nop     
155d 00        nop     
155e 00        nop     
155f 00        nop     
1560 00        nop     
1561 00        nop     
1562 00        nop     
1563 00        nop     
1564 00        nop     
1565 00        nop     
1566 00        nop     
1567 00        nop     
1568 00        nop     
1569 00        nop     
156a 00        nop     
156b 00        nop     
156c 00        nop     
156d 00        nop     
156e 00        nop     
156f 00        nop     
1570 00        nop     
1571 00        nop     
1572 00        nop     
1573 00        nop     
1574 00        nop     
1575 00        nop     
1576 00        nop     
1577 00        nop     
1578 00        nop     
1579 00        nop     
157a 00        nop     
157b 00        nop     
157c 00        nop     
157d 00        nop     
157e 00        nop     
157f 00        nop     
1580 00        nop     
1581 00        nop     
1582 00        nop     
1583 00        nop     
1584 00        nop     
1585 00        nop     
1586 00        nop     
1587 00        nop     
1588 00        nop     
1589 00        nop     
158a 00        nop     
158b 00        nop     
158c 00        nop     
158d 00        nop     
158e 00        nop     
158f 00        nop     
1590 00        nop     
1591 00        nop     
1592 00        nop     
1593 00        nop     
1594 00        nop     
1595 00        nop     
1596 00        nop     
1597 00        nop     
1598 00        nop     
1599 00        nop     
159a 00        nop     
159b 00        nop     
159c 00        nop     
159d 00        nop     
159e 00        nop     
159f 00        nop     
15a0 00        nop     
15a1 00        nop     
15a2 00        nop     
15a3 00        nop     
15a4 00        nop     
15a5 00        nop     
15a6 00        nop     
15a7 00        nop     
15a8 00        nop     
15a9 00        nop     
15aa 00        nop     
15ab 00        nop     
15ac 00        nop     
15ad 00        nop     
15ae 00        nop     
15af 00        nop     
15b0 00        nop     
15b1 00        nop     
15b2 00        nop     
15b3 00        nop     
15b4 00        nop     
15b5 00        nop     
15b6 00        nop     
15b7 00        nop     
15b8 00        nop     
15b9 00        nop     
15ba 00        nop     
15bb 00        nop     
15bc 00        nop     
15bd 00        nop     
15be 00        nop     
15bf 00        nop     
15c0 00        nop     
15c1 00        nop     
15c2 00        nop     
15c3 00        nop     
15c4 00        nop     
15c5 00        nop     
15c6 00        nop     
15c7 00        nop     
15c8 00        nop     
15c9 00        nop     
15ca 00        nop     
15cb 00        nop     
15cc 00        nop     
15cd 00        nop     
15ce 00        nop     
15cf 00        nop     
15d0 00        nop     
15d1 00        nop     
15d2 00        nop     
15d3 00        nop     
15d4 00        nop     
15d5 00        nop     
15d6 00        nop     
15d7 00        nop     
15d8 00        nop     
15d9 00        nop     
15da 00        nop     
15db 00        nop     
15dc 00        nop     
15dd 00        nop     
15de 00        nop     
15df 00        nop     
15e0 00        nop     
15e1 00        nop     
15e2 00        nop     
15e3 00        nop     
15e4 00        nop     
15e5 00        nop     
15e6 00        nop     
15e7 00        nop     
15e8 00        nop     
15e9 00        nop     
15ea 00        nop     
15eb 00        nop     
15ec 00        nop     
15ed 00        nop     
15ee 00        nop     
15ef 00        nop     
15f0 00        nop     
15f1 00        nop     
15f2 00        nop     
15f3 00        nop     
15f4 00        nop     
15f5 00        nop     
15f6 00        nop     
15f7 00        nop     
15f8 00        nop     
15f9 00        nop     
15fa 00        nop     
15fb 00        nop     
15fc 00        nop     
15fd 00        nop     
15fe 00        nop     
15ff 00        nop     
1600 00        nop     
1601 00        nop     
1602 00        nop     
1603 00        nop     
1604 00        nop     
1605 00        nop     
1606 00        nop     
1607 00        nop     
1608 00        nop     
1609 00        nop     
160a 00        nop     
160b 00        nop     
160c 00        nop     
160d 00        nop     
160e 00        nop     
160f 00        nop     
1610 00        nop     
1611 00        nop     
1612 00        nop     
1613 00        nop     
1614 00        nop     
1615 00        nop     
1616 00        nop     
1617 00        nop     
1618 00        nop     
1619 00        nop     
161a 00        nop     
161b 00        nop     
161c 00        nop     
161d 00        nop     
161e 00        nop     
161f 00        nop     
1620 00        nop     
1621 00        nop     
1622 00        nop     
1623 00        nop     
1624 00        nop     
1625 00        nop     
1626 00        nop     
1627 00        nop     
1628 00        nop     
1629 00        nop     
162a 00        nop     
162b 00        nop     
162c 00        nop     
162d 00        nop     
162e 00        nop     
162f 00        nop     
1630 00        nop     
1631 00        nop     
1632 00        nop     
1633 00        nop     
1634 00        nop     
1635 00        nop     
1636 00        nop     
1637 00        nop     
1638 00        nop     
1639 00        nop     
163a 00        nop     
163b 00        nop     
163c 00        nop     
163d 00        nop     
163e 00        nop     
163f 00        nop     
1640 00        nop     
1641 00        nop     
1642 00        nop     
1643 00        nop     
1644 00        nop     
1645 00        nop     
1646 00        nop     
1647 00        nop     
1648 00        nop     
1649 00        nop     
164a 00        nop     
164b 00        nop     
164c 00        nop     
164d 00        nop     
164e 00        nop     
164f 00        nop     
1650 00        nop     
1651 00        nop     
1652 00        nop     
1653 00        nop     
1654 00        nop     
1655 00        nop     
1656 00        nop     
1657 00        nop     
1658 00        nop     
1659 00        nop     
165a 00        nop     
165b 00        nop     
165c 00        nop     
165d 00        nop     
165e 00        nop     
165f 00        nop     
1660 00        nop     
1661 00        nop     
1662 00        nop     
1663 00        nop     
1664 00        nop     
1665 00        nop     
1666 00        nop     
1667 00        nop     
1668 00        nop     
1669 00        nop     
166a 00        nop     
166b 00        nop     
166c 00        nop     
166d 00        nop     
166e 00        nop     
166f 00        nop     
1670 00        nop     
1671 00        nop     
1672 00        nop     
1673 00        nop     
1674 00        nop     
1675 00        nop     
1676 00        nop     
1677 00        nop     
1678 00        nop     
1679 00        nop     
167a 00        nop     
167b 00        nop     
167c 00        nop     
167d 00        nop     
167e 00        nop     
167f 00        nop     
1680 00        nop     
1681 00        nop     
1682 00        nop     
1683 00        nop     
1684 00        nop     
1685 00        nop     
1686 00        nop     
1687 00        nop     
1688 00        nop     
1689 00        nop     
168a 00        nop     
168b 00        nop     
168c 00        nop     
168d 00        nop     
168e 00        nop     
168f 00        nop     
1690 00        nop     
1691 00        nop     
1692 00        nop     
1693 00        nop     
1694 00        nop     
1695 00        nop     
1696 00        nop     
1697 00        nop     
1698 00        nop     
1699 00        nop     
169a 00        nop     
169b 00        nop     
169c 00        nop     
169d 00        nop     
169e 00        nop     
169f 00        nop     
16a0 00        nop     
16a1 00        nop     
16a2 00        nop     
16a3 00        nop     
16a4 00        nop     
16a5 00        nop     
16a6 00        nop     
16a7 00        nop     
16a8 00        nop     
16a9 00        nop     
16aa 00        nop     
16ab 00        nop     
16ac 00        nop     
16ad 00        nop     
16ae 00        nop     
16af 00        nop     
16b0 00        nop     
16b1 00        nop     
16b2 00        nop     
16b3 00        nop     
16b4 00        nop     
16b5 00        nop     
16b6 00        nop     
16b7 00        nop     
16b8 00        nop     
16b9 00        nop     
16ba 00        nop     
16bb 00        nop     
16bc 00        nop     
16bd 00        nop     
16be 00        nop     
16bf 00        nop     
16c0 00        nop     
16c1 00        nop     
16c2 00        nop     
16c3 00        nop     
16c4 00        nop     
16c5 00        nop     
16c6 00        nop     
16c7 00        nop     
16c8 00        nop     
16c9 00        nop     
16ca 00        nop     
16cb 00        nop     
16cc 00        nop     
16cd 00        nop     
16ce 00        nop     
16cf 00        nop     
16d0 00        nop     
16d1 00        nop     
16d2 00        nop     
16d3 00        nop     
16d4 00        nop     
16d5 00        nop     
16d6 00        nop     
16d7 00        nop     
16d8 00        nop     
16d9 00        nop     
16da 00        nop     
16db 00        nop     
16dc 00        nop     
16dd 00        nop     
16de 00        nop     
16df 00        nop     
16e0 00        nop     
16e1 00        nop     
16e2 00        nop     
16e3 00        nop     
16e4 00        nop     
16e5 00        nop     
16e6 00        nop     
16e7 00        nop     
16e8 00        nop     
16e9 00        nop     
16ea 00        nop     
16eb 00        nop     
16ec 00        nop     
16ed 00        nop     
16ee 00        nop     
16ef 00        nop     
16f0 00        nop     
16f1 00        nop     
16f2 00        nop     
16f3 00        nop     
16f4 00        nop     
16f5 00        nop     
16f6 00        nop     
16f7 00        nop     
16f8 00        nop     
16f9 00        nop     
16fa 00        nop     
16fb 00        nop     
16fc 00        nop     
16fd 00        nop     
16fe 00        nop     
16ff 00        nop     
1700 00        nop     
1701 00        nop     
1702 00        nop     
1703 00        nop     
1704 00        nop     
1705 00        nop     
1706 00        nop     
1707 00        nop     
1708 00        nop     
1709 00        nop     
170a 00        nop     
170b 00        nop     
170c 00        nop     
170d 00        nop     
170e 00        nop     
170f 00        nop     
1710 00        nop     
1711 00        nop     
1712 00        nop     
1713 00        nop     
1714 00        nop     
1715 00        nop     
1716 00        nop     
1717 00        nop     
1718 00        nop     
1719 00        nop     
171a 00        nop     
171b 00        nop     
171c 00        nop     
171d 00        nop     
171e 00        nop     
171f 00        nop     
1720 00        nop     
1721 00        nop     
1722 00        nop     
1723 00        nop     
1724 00        nop     
1725 00        nop     
1726 00        nop     
1727 00        nop     
1728 00        nop     
1729 00        nop     
172a 00        nop     
172b 00        nop     
172c 00        nop     
172d 00        nop     
172e 00        nop     
172f 00        nop     
1730 00        nop     
1731 00        nop     
1732 00        nop     
1733 00        nop     
1734 00        nop     
1735 00        nop     
1736 00        nop     
1737 00        nop     
1738 00        nop     
1739 00        nop     
173a 00        nop     
173b 00        nop     
173c 00        nop     
173d 00        nop     
173e 00        nop     
173f 00        nop     
1740 00        nop     
1741 00        nop     
1742 00        nop     
1743 00        nop     
1744 00        nop     
1745 00        nop     
1746 00        nop     
1747 00        nop     
1748 00        nop     
1749 00        nop     
174a 00        nop     
174b 00        nop     
174c 00        nop     
174d 00        nop     
174e 00        nop     
174f 00        nop     
1750 00        nop     
1751 00        nop     
1752 00        nop     
1753 00        nop     
1754 00        nop     
1755 00        nop     
1756 00        nop     
1757 00        nop     
1758 00        nop     
1759 00        nop     
175a 00        nop     
175b 00        nop     
175c 00        nop     
175d 00        nop     
175e 00        nop     
175f 00        nop     
1760 00        nop     
1761 00        nop     
1762 00        nop     
1763 00        nop     
1764 00        nop     
1765 00        nop     
1766 00        nop     
1767 00        nop     
1768 00        nop     
1769 00        nop     
176a 00        nop     
176b 00        nop     
176c 00        nop     
176d 00        nop     
176e 00        nop     
176f 00        nop     
1770 00        nop     
1771 00        nop     
1772 00        nop     
1773 00        nop     
1774 00        nop     
1775 00        nop     
1776 00        nop     
1777 00        nop     
1778 00        nop     
1779 00        nop     
177a 00        nop     
177b 00        nop     
177c 00        nop     
177d 00        nop     
177e 00        nop     
177f 00        nop     
1780 00        nop     
1781 00        nop     
1782 00        nop     
1783 00        nop     
1784 00        nop     
1785 00        nop     
1786 00        nop     
1787 00        nop     
1788 00        nop     
1789 00        nop     
178a 00        nop     
178b 00        nop     
178c 00        nop     
178d 00        nop     
178e 00        nop     
178f 00        nop     
1790 00        nop     
1791 00        nop     
1792 00        nop     
1793 00        nop     
1794 00        nop     
1795 00        nop     
1796 00        nop     
1797 00        nop     
1798 00        nop     
1799 00        nop     
179a 00        nop     
179b 00        nop     
179c 00        nop     
179d 00        nop     
179e 00        nop     
179f 00        nop     
17a0 00        nop     
17a1 00        nop     
17a2 00        nop     
17a3 00        nop     
17a4 00        nop     
17a5 00        nop     
17a6 00        nop     
17a7 00        nop     
17a8 00        nop     
17a9 00        nop     
17aa 00        nop     
17ab 00        nop     
17ac 00        nop     
17ad 00        nop     
17ae 00        nop     
17af 00        nop     
17b0 00        nop     
17b1 00        nop     
17b2 00        nop     
17b3 00        nop     
17b4 00        nop     
17b5 00        nop     
17b6 00        nop     
17b7 00        nop     
17b8 00        nop     
17b9 00        nop     
17ba 00        nop     
17bb 00        nop     
17bc 00        nop     
17bd 00        nop     
17be 00        nop     
17bf 00        nop     
17c0 00        nop     
17c1 00        nop     
17c2 00        nop     
17c3 00        nop     
17c4 00        nop     
17c5 00        nop     
17c6 00        nop     
17c7 00        nop     
17c8 00        nop     
17c9 00        nop     
17ca 00        nop     
17cb 00        nop     
17cc 00        nop     
17cd 00        nop     
17ce 00        nop     
17cf 00        nop     
17d0 00        nop     
17d1 00        nop     
17d2 00        nop     
17d3 00        nop     
17d4 00        nop     
17d5 00        nop     
17d6 00        nop     
17d7 00        nop     
17d8 00        nop     
17d9 00        nop     
17da 00        nop     
17db 00        nop     
17dc 00        nop     
17dd 00        nop     
17de 00        nop     
17df 00        nop     
17e0 00        nop     
17e1 00        nop     
17e2 00        nop     
17e3 00        nop     
17e4 00        nop     
17e5 00        nop     
17e6 00        nop     
17e7 00        nop     
17e8 00        nop     
17e9 00        nop     
17ea 00        nop     
17eb 00        nop     
17ec 00        nop     
17ed 00        nop     
17ee 00        nop     
17ef 00        nop     
17f0 00        nop     
17f1 00        nop     
17f2 00        nop     
17f3 00        nop     
17f4 00        nop     
17f5 00        nop     
17f6 00        nop     
17f7 00        nop     
17f8 00        nop     
17f9 00        nop     
17fa 00        nop     
17fb 00        nop     
17fc 00        nop     
17fd 00        nop     
17fe 00        nop     
17ff 00        nop     
1800 00        nop     
1801 00        nop     
1802 00        nop     
1803 00        nop     
1804 00        nop     
1805 00        nop     
1806 00        nop     
1807 00        nop     
1808 00        nop     
1809 00        nop     
180a 00        nop     
180b 00        nop     
180c 00        nop     
180d 00        nop     
180e 00        nop     
180f 00        nop     
1810 00        nop     
1811 00        nop     
1812 00        nop     
1813 00        nop     
1814 00        nop     
1815 00        nop     
1816 00        nop     
1817 00        nop     
1818 00        nop     
1819 00        nop     
181a 00        nop     
181b 00        nop     
181c 00        nop     
181d 00        nop     
181e 00        nop     
181f 00        nop     
1820 00        nop     
1821 00        nop     
1822 00        nop     
1823 00        nop     
1824 00        nop     
1825 00        nop     
1826 00        nop     
1827 00        nop     
1828 00        nop     
1829 00        nop     
182a 00        nop     
182b 00        nop     
182c 00        nop     
182d 00        nop     
182e 00        nop     
182f 00        nop     
1830 00        nop     
1831 00        nop     
1832 00        nop     
1833 00        nop     
1834 00        nop     
1835 00        nop     
1836 00        nop     
1837 00        nop     
1838 00        nop     
1839 00        nop     
183a 00        nop     
183b 00        nop     
183c 00        nop     
183d 00        nop     
183e 00        nop     
183f 00        nop     
1840 00        nop     
1841 00        nop     
1842 00        nop     
1843 00        nop     
1844 00        nop     
1845 00        nop     
1846 00        nop     
1847 00        nop     
1848 00        nop     
1849 00        nop     
184a 00        nop     
184b 00        nop     
184c 00        nop     
184d 00        nop     
184e 00        nop     
184f 00        nop     
1850 00        nop     
1851 00        nop     
1852 00        nop     
1853 00        nop     
1854 00        nop     
1855 00        nop     
1856 00        nop     
1857 00        nop     
1858 00        nop     
1859 00        nop     
185a 00        nop     
185b 00        nop     
185c 00        nop     
185d 00        nop     
185e 00        nop     
185f 00        nop     
1860 00        nop     
1861 00        nop     
1862 00        nop     
1863 00        nop     
1864 00        nop     
1865 00        nop     
1866 00        nop     
1867 00        nop     
1868 00        nop     
1869 00        nop     
186a 00        nop     
186b 00        nop     
186c 00        nop     
186d 00        nop     
186e 00        nop     
186f 00        nop     
1870 00        nop     
1871 00        nop     
1872 00        nop     
1873 00        nop     
1874 00        nop     
1875 00        nop     
1876 00        nop     
1877 00        nop     
1878 00        nop     
1879 00        nop     
187a 00        nop     
187b 00        nop     
187c 00        nop     
187d 00        nop     
187e 00        nop     
187f 00        nop     
1880 00        nop     
1881 00        nop     
1882 00        nop     
1883 00        nop     
1884 00        nop     
1885 00        nop     
1886 00        nop     
1887 00        nop     
1888 00        nop     
1889 00        nop     
188a 00        nop     
188b 00        nop     
188c 00        nop     
188d 00        nop     
188e 00        nop     
188f 00        nop     
1890 00        nop     
1891 00        nop     
1892 00        nop     
1893 00        nop     
1894 00        nop     
1895 00        nop     
1896 00        nop     
1897 00        nop     
1898 00        nop     
1899 00        nop     
189a 00        nop     
189b 00        nop     
189c 00        nop     
189d 00        nop     
189e 00        nop     
189f 00        nop     
18a0 00        nop     
18a1 00        nop     
18a2 00        nop     
18a3 00        nop     
18a4 00        nop     
18a5 00        nop     
18a6 00        nop     
18a7 00        nop     
18a8 00        nop     
18a9 00        nop     
18aa 00        nop     
18ab 00        nop     
18ac 00        nop     
18ad 00        nop     
18ae 00        nop     
18af 00        nop     
18b0 00        nop     
18b1 00        nop     
18b2 00        nop     
18b3 00        nop     
18b4 00        nop     
18b5 00        nop     
18b6 00        nop     
18b7 00        nop     
18b8 00        nop     
18b9 00        nop     
18ba 00        nop     
18bb 00        nop     
18bc 00        nop     
18bd 00        nop     
18be 00        nop     
18bf 00        nop     
18c0 00        nop     
18c1 00        nop     
18c2 00        nop     
18c3 00        nop     
18c4 c41817    call    nz,$1718
18c7 314558    ld      sp,$5845
18ca 33        inc     sp
18cb 41        ld      b,c
18cc 2020      jr      nz,$18ee
18ce 2020      jr      nz,$18f0
18d0 110319    ld      de,$1903
18d3 219a8e    ld      hl,$8e9a
18d6 cd1038    call    $3810
18d9 32722e    ld      ($2e72),a
18dc b7        or      a
18dd cae118    jp      z,$18e1
18e0 c9        ret     

18e1 119a8e    ld      de,$8e9a
18e4 219c8e    ld      hl,$8e9c
18e7 3e02      ld      a,$02
18e9 cdfb2d    call    $2dfb
18ec 229c8e    ld      ($8e9c),hl
18ef 2a9a8e    ld      hl,($8e9a)
18f2 23        inc     hl
18f3 229a8e    ld      ($8e9a),hl
18f6 019a8e    ld      bc,$8e9a
18f9 119e8e    ld      de,$8e9e
18fc 21a68e    ld      hl,$8ea6
18ff cda370    call    $70a3
1902 c9        ret     

1903 14        inc     d
1904 00        nop     
1905 00        nop     
1906 00        nop     
1907 119a8e    ld      de,$8e9a
190a 219c8e    ld      hl,$8e9c
190d cd1038    call    $3810
1910 32742e    ld      ($2e74),a
1913 b7        or      a
1914 ca1b19    jp      z,$191b
1917 3a742e    ld      a,($2e74)
191a c9        ret     

191b 2a9c8e    ld      hl,($8e9c)
191e 23        inc     hl
191f 229c8e    ld      ($8e9c),hl
1922 019c8e    ld      bc,$8e9c
1925 119e8e    ld      de,$8e9e
1928 21a68e    ld      hl,$8ea6
192b cd7870    call    $7078
192e 3a742e    ld      a,($2e74)
1931 c9        ret     

1932 227e2e    ld      ($2e7e),hl
1935 eb        ex      de,hl
1936 22802e    ld      ($2e80),hl
1939 21268d    ld      hl,$8d26
193c cdfa4f    call    $4ffa
193f 21852e    ld      hl,$2e85
1942 cdcd81    call    $81cd
1945 21892e    ld      hl,$2e89
1948 cdbe81    call    $81be
194b 21852e    ld      hl,$2e85
194e cdcd81    call    $81cd
1951 218d2e    ld      hl,$2e8d
1954 cdbe81    call    $81be
1957 210100    ld      hl,$0001
195a 22912e    ld      ($2e91),hl
195d 01912e    ld      bc,$2e91
1960 11208e    ld      de,$8e20
1963 21f091    ld      hl,$91f0
1966 cd7870    call    $7078
1969 21f091    ld      hl,$91f0
196c cd7002    call    $0270
196f 114ea6    ld      de,$a64e
1972 21892e    ld      hl,$2e89
1975 3e02      ld      a,$02
1977 cd3a2e    call    $2e3a
197a 21892e    ld      hl,$2e89
197d cdbe81    call    $81be
1980 1152a6    ld      de,$a652
1983 218d2e    ld      hl,$2e8d
1986 3e02      ld      a,$02
1988 cd3a2e    call    $2e3a
198b 218d2e    ld      hl,$2e8d
198e cdbe81    call    $81be
1991 2a912e    ld      hl,($2e91)
1994 23        inc     hl
1995 eb        ex      de,hl
1996 2a628e    ld      hl,($8e62)
1999 eb        ex      de,hl
199a 7b        ld      a,e
199b 95        sub     l
199c 7a        ld      a,d
199d 9c        sbc     a,h
199e f25a19    jp      p,$195a
19a1 215ea6    ld      hl,$a65e
19a4 cdcd81    call    $81cd
19a7 210600    ld      hl,$0006
19aa cdf87e    call    $7ef8
19ad 21892e    ld      hl,$2e89
19b0 cd8b7d    call    $7d8b
19b3 215e8e    ld      hl,$8e5e
19b6 cd8b7d    call    $7d8b
19b9 21b18e    ld      hl,$8eb1
19bc cdbe81    call    $81be
19bf 2a7e2e    ld      hl,($2e7e)
19c2 cdcd81    call    $81cd
19c5 21b18e    ld      hl,$8eb1
19c8 cd007e    call    $7e00
19cb cd807a    call    $7a80
19ce 22af8e    ld      ($8eaf),hl
19d1 11921a    ld      de,$1a92
19d4 21af8e    ld      hl,$8eaf
19d7 3e02      ld      a,$02
19d9 cd697a    call    $7a69
19dc 22af8e    ld      ($8eaf),hl
19df 11af8e    ld      de,$8eaf
19e2 21628e    ld      hl,$8e62
19e5 3e02      ld      a,$02
19e7 cdfb2d    call    $2dfb
19ea 22932e    ld      ($2e93),hl
19ed 3a728e    ld      a,($8e72)
19f0 2f        cpl     
19f1 32952e    ld      ($2e95),a
19f4 b7        or      a
19f5 ca0a1a    jp      z,$1a0a
19f8 2a7e2e    ld      hl,($2e7e)
19fb cdcd81    call    $81cd
19fe 2a932e    ld      hl,($2e93)
1a01 cdfa7d    call    $7dfa
1a04 21b18e    ld      hl,$8eb1
1a07 cdbe81    call    $81be
1a0a 219a1a    ld      hl,$1a9a
1a0d cdcd81    call    $81cd
1a10 215ea6    ld      hl,$a65e
1a13 cdfe7e    call    $7efe
1a16 21962e    ld      hl,$2e96
1a19 cdbe81    call    $81be
1a1c 2a932e    ld      hl,($2e93)
1a1f cdde7f    call    $7fde
1a22 21b18e    ld      hl,$8eb1
1a25 cdfe7e    call    $7efe
1a28 2a7e2e    ld      hl,($2e7e)
1a2b cded7d    call    $7ded
1a2e 21961a    ld      hl,$1a96
1a31 cdfe7e    call    $7efe
1a34 21962e    ld      hl,$2e96
1a37 cded7d    call    $7ded
1a3a cd867c    call    $7c86
1a3d 21b58e    ld      hl,$8eb5
1a40 cdbe81    call    $81be
1a43 2aaf8e    ld      hl,($8eaf)
1a46 2b        dec     hl
1a47 eb        ex      de,hl
1a48 2a628e    ld      hl,($8e62)
1a4b 19        add     hl,de
1a4c eb        ex      de,hl
1a4d 2aaf8e    ld      hl,($8eaf)
1a50 cd2180    call    $8021
1a53 22ad8e    ld      ($8ead),hl
1a56 218d2e    ld      hl,$2e8d
1a59 cdcd81    call    $81cd
1a5c 215aa6    ld      hl,$a65a
1a5f cd8b7d    call    $7d8b
1a62 219a2e    ld      hl,$2e9a
1a65 cdbe81    call    $81be
1a68 119a2e    ld      de,$2e9a
1a6b 215e8e    ld      hl,$8e5e
1a6e 3e02      ld      a,$02
1a70 cd3a2e    call    $2e3a
1a73 21528e    ld      hl,$8e52
1a76 cdbe81    call    $81be
1a79 21961a    ld      hl,$1a96
1a7c cdcd81    call    $81cd
1a7f 2aad8e    ld      hl,($8ead)
1a82 cd857d    call    $7d85
1a85 21528e    ld      hl,$8e52
1a88 cdfe7e    call    $7efe
1a8b 2a802e    ld      hl,($2e80)
1a8e cdbe81    call    $81be
1a91 c9        ret     

1a92 010000    ld      bc,$0000
1a95 00        nop     
1a96 00        nop     
1a97 00        nop     
1a98 00        nop     
1a99 80        add     a,b
1a9a 00        nop     
1a9b 00        nop     
1a9c 40        ld      b,b
1a9d 82        add     a,d
1a9e 2aaf8e    ld      hl,($8eaf)
1aa1 22a12e    ld      ($2ea1),hl
1aa4 213a1b    ld      hl,$1b3a
1aa7 cdcd81    call    $81cd
1aaa 21528e    ld      hl,$8e52
1aad cdfe7e    call    $7efe
1ab0 21b98e    ld      hl,$8eb9
1ab3 cded7d    call    $7ded
1ab6 cd867c    call    $7c86
1ab9 21a32e    ld      hl,$2ea3
1abc cdbe81    call    $81be
1abf 21b58e    ld      hl,$8eb5
1ac2 cdcd81    call    $81cd
1ac5 21a72e    ld      hl,$2ea7
1ac8 cdbe81    call    $81be
1acb 21361b    ld      hl,$1b36
1ace cdc364    call    $64c3
1ad1 11a32e    ld      de,$2ea3
1ad4 21a72e    ld      hl,$2ea7
1ad7 cde364    call    $64e3
1ada 213e1b    ld      hl,$1b3e
1add cd0a02    call    $020a
1ae0 32ab2e    ld      ($2eab),a
1ae3 b7        or      a
1ae4 cae81a    jp      z,$1ae8
1ae7 c9        ret     

1ae8 21a72e    ld      hl,$2ea7
1aeb cdcd81    call    $81cd
1aee 21b18e    ld      hl,$8eb1
1af1 cd8b7d    call    $7d8b
1af4 21a72e    ld      hl,$2ea7
1af7 cdbe81    call    $81be
1afa 2aa12e    ld      hl,($2ea1)
1afd 2b        dec     hl
1afe 22a12e    ld      ($2ea1),hl
1b01 21a12e    ld      hl,$2ea1
1b04 cdfe36    call    $36fe
1b07 2f        cpl     
1b08 32ab2e    ld      ($2eab),a
1b0b b7        or      a
1b0c c2cb1a    jp      nz,$1acb
1b0f 2aaf8e    ld      hl,($8eaf)
1b12 22a12e    ld      ($2ea1),hl
1b15 21b58e    ld      hl,$8eb5
1b18 cdcd81    call    $81cd
1b1b 21a72e    ld      hl,$2ea7
1b1e cdbe81    call    $81be
1b21 21a32e    ld      hl,$2ea3
1b24 cdcd81    call    $81cd
1b27 21528e    ld      hl,$8e52
1b2a cded7d    call    $7ded
1b2d 21a32e    ld      hl,$2ea3
1b30 cdbe81    call    $81be
1b33 c3cb1a    jp      $1acb
1b36 00        nop     
1b37 00        nop     
1b38 00        nop     
1b39 00        nop     
1b3a 33        inc     sp
1b3b 33        inc     sp
1b3c 33        inc     sp
1b3d 81        add     a,c
1b3e 00        nop     
1b3f 00        nop     
1b40 22b52e    ld      ($2eb5),hl
1b43 21c81c    ld      hl,$1cc8
1b46 cd4602    call    $0246
1b49 32ad2e    ld      ($2ead),a
1b4c b7        or      a
1b4d ca541b    jp      z,$1b54
1b50 3aad2e    ld      a,($2ead)
1b53 c9        ret     

1b54 21c81c    ld      hl,$1cc8
1b57 cdc364    call    $64c3
1b5a 21a98e    ld      hl,$8ea9
1b5d cd7f50    call    $507f
1b60 11c72e    ld      de,$2ec7
1b63 21c32e    ld      hl,$2ec3
1b66 cdd401    call    $01d4
1b69 21cc1c    ld      hl,$1ccc
1b6c cdcd81    call    $81cd
1b6f 215e8e    ld      hl,$8e5e
1b72 cdfe7e    call    $7efe
1b75 21cb2e    ld      hl,$2ecb
1b78 cdbe81    call    $81be
1b7b 21bf2e    ld      hl,$2ebf
1b7e cdcd81    call    $81cd
1b81 215e8e    ld      hl,$8e5e
1b84 cdfe7e    call    $7efe
1b87 21cf2e    ld      hl,$2ecf
1b8a cdbe81    call    $81be
1b8d 21c32e    ld      hl,$2ec3
1b90 cdcd81    call    $81cd
1b93 215e8e    ld      hl,$8e5e
1b96 cd8b7d    call    $7d8b
1b99 21d32e    ld      hl,$2ed3
1b9c cdbe81    call    $81be
1b9f 3aa68e    ld      a,($8ea6)
1ba2 d602      sub     $02
1ba4 32d72e    ld      ($2ed7),a
1ba7 b7        or      a
1ba8 cac31b    jp      z,$1bc3
1bab f2e41b    jp      p,$1be4
1bae 21168d    ld      hl,$8d16
1bb1 cdfa4f    call    $4ffa
1bb4 01a78e    ld      bc,$8ea7
1bb7 11cb2e    ld      de,$2ecb
1bba 21cf2e    ld      hl,$2ecf
1bbd cd8665    call    $6586
1bc0 c3081c    jp      $1c08
1bc3 11cb2e    ld      de,$2ecb
1bc6 21bb2e    ld      hl,$2ebb
1bc9 cd0165    call    $6501
1bcc 21a78e    ld      hl,$8ea7
1bcf cd082d    call    $2d08
1bd2 11bb2e    ld      de,$2ebb
1bd5 215e8e    ld      hl,$8e5e
1bd8 cd3d65    call    $653d
1bdb 21c41c    ld      hl,$1cc4
1bde cd082d    call    $2d08
1be1 c3081c    jp      $1c08
1be4 21d01c    ld      hl,$1cd0
1be7 cdcd81    call    $81cd
1bea 21cb2e    ld      hl,$2ecb
1bed cdfe7e    call    $7efe
1bf0 21c72e    ld      hl,$2ec7
1bf3 cd8b7d    call    $7d8b
1bf6 21d82e    ld      hl,$2ed8
1bf9 cdbe81    call    $81be
1bfc 01dc2e    ld      bc,$2edc
1bff 11d32e    ld      de,$2ed3
1c02 21c32e    ld      hl,$2ec3
1c05 cd9402    call    $0294
1c08 21268d    ld      hl,$8d26
1c0b cdfa4f    call    $4ffa
1c0e 3a5e90    ld      a,($905e)
1c11 2f        cpl     
1c12 2ab52e    ld      hl,($2eb5)
1c15 a6        and     (hl)
1c16 32d72e    ld      ($2ed7),a
1c19 b7        or      a
1c1a c22c1c    jp      nz,$1c2c
1c1d 019c8e    ld      bc,$8e9c
1c20 11208e    ld      de,$8e20
1c23 21f091    ld      hl,$91f0
1c26 cd7870    call    $7078
1c29 c3481c    jp      $1c48
1c2c 11c790    ld      de,$90c7
1c2f 21f091    ld      hl,$91f0
1c32 cd2858    call    $5828
1c35 3ac790    ld      a,($90c7)
1c38 11f091    ld      de,$91f0
1c3b 6f        ld      l,a
1c3c 17        rla     
1c3d 9f        sbc     a,a
1c3e 67        ld      h,a
1c3f 19        add     hl,de
1c40 22e22e    ld      ($2ee2),hl
1c43 af        xor     a
1c44 2ae22e    ld      hl,($2ee2)
1c47 77        ld      (hl),a
1c48 21f091    ld      hl,$91f0
1c4b cd7002    call    $0270
1c4e 21d01c    ld      hl,$1cd0
1c51 cdcd81    call    $81cd
1c54 215ea6    ld      hl,$a65e
1c57 cdfe7e    call    $7efe
1c5a 21d32e    ld      hl,$2ed3
1c5d cd8b7d    call    $7d8b
1c60 21e42e    ld      hl,$2ee4
1c63 cdbe81    call    $81be
1c66 21bf2e    ld      hl,$2ebf
1c69 cdcd81    call    $81cd
1c6c 2152a6    ld      hl,$a652
1c6f cdfe7e    call    $7efe
1c72 21cb2e    ld      hl,$2ecb
1c75 cd8b7d    call    $7d8b
1c78 21c72e    ld      hl,$2ec7
1c7b cd8b7d    call    $7d8b
1c7e 215aa6    ld      hl,$a65a
1c81 cded7d    call    $7ded
1c84 21e82e    ld      hl,$2ee8
1c87 cdbe81    call    $81be
1c8a 11e82e    ld      de,$2ee8
1c8d 21e42e    ld      hl,$2ee4
1c90 cde364    call    $64e3
1c93 21368d    ld      hl,$8d36
1c96 cd7f50    call    $507f
1c99 21f091    ld      hl,$91f0
1c9c cdb065    call    $65b0
1c9f 21c72e    ld      hl,$2ec7
1ca2 cdcd81    call    $81cd
1ca5 215e8e    ld      hl,$8e5e
1ca8 cded7d    call    $7ded
1cab 21e42e    ld      hl,$2ee4
1cae cdbe81    call    $81be
1cb1 11e42e    ld      de,$2ee4
1cb4 21c32e    ld      hl,$2ec3
1cb7 cde364    call    $64e3
1cba 21e48c    ld      hl,$8ce4
1cbd cdc364    call    $64c3
1cc0 3aad2e    ld      a,($2ead)
1cc3 c9        ret     

1cc4 010000    ld      bc,$0000
1cc7 00        nop     
1cc8 00        nop     
1cc9 00        nop     
1cca 00        nop     
1ccb 00        nop     
1ccc c2f528    jp      nz,$28f5
1ccf 7f        ld      a,a
1cd0 00        nop     
1cd1 00        nop     
1cd2 00        nop     
1cd3 82        add     a,d
1cd4 22ed2e    ld      ($2eed),hl
1cd7 eb        ex      de,hl
1cd8 22ef2e    ld      ($2eef),hl
1cdb 3e03      ld      a,$03
1cdd 21f12e    ld      hl,$2ef1
1ce0 cd6582    call    $8265
1ce3 2af12e    ld      hl,($2ef1)
1ce6 eb        ex      de,hl
1ce7 2aed2e    ld      hl,($2eed)
1cea cde364    call    $64e3
1ced 2af32e    ld      hl,($2ef3)
1cf0 eb        ex      de,hl
1cf1 2aed2e    ld      hl,($2eed)
1cf4 cd1e65    call    $651e
1cf7 2af32e    ld      hl,($2ef3)
1cfa eb        ex      de,hl
1cfb 2aef2e    ld      hl,($2eef)
1cfe cd1e65    call    $651e
1d01 2af12e    ld      hl,($2ef1)
1d04 eb        ex      de,hl
1d05 2aef2e    ld      hl,($2eef)
1d08 cd1e65    call    $651e
1d0b 2af12e    ld      hl,($2ef1)
1d0e eb        ex      de,hl
1d0f 2aed2e    ld      hl,($2eed)
1d12 cd1e65    call    $651e
1d15 2af32e    ld      hl,($2ef3)
1d18 cdcd81    call    $81cd
1d1b 2af12e    ld      hl,($2ef1)
1d1e cded7d    call    $7ded
1d21 21ff2e    ld      hl,$2eff
1d24 cdbe81    call    $81be
1d27 2aef2e    ld      hl,($2eef)
1d2a cdcd81    call    $81cd
1d2d 2aed2e    ld      hl,($2eed)
1d30 cded7d    call    $7ded
1d33 21032f    ld      hl,$2f03
1d36 cdbe81    call    $81be
1d39 21032f    ld      hl,$2f03
1d3c cdda7b    call    $7bda
1d3f 21072f    ld      hl,$2f07
1d42 cdbe81    call    $81be
1d45 21ff2e    ld      hl,$2eff
1d48 cdda7b    call    $7bda
1d4b 21072f    ld      hl,$2f07
1d4e cded7d    call    $7ded
1d51 3d        dec     a
1d52 d67f      sub     $7f
1d54 9f        sbc     a,a
1d55 32f82e    ld      ($2ef8),a
1d58 010b2f    ld      bc,$2f0b
1d5b 11f92e    ld      de,$2ef9
1d5e 2af52e    ld      hl,($2ef5)
1d61 cdb601    call    $01b6
1d64 320f2f    ld      ($2f0f),a
1d67 b7        or      a
1d68 ca841d    jp      z,$1d84
1d6b 2af12e    ld      hl,($2ef1)
1d6e 22102f    ld      ($2f10),hl
1d71 2af32e    ld      hl,($2ef3)
1d74 22122f    ld      ($2f12),hl
1d77 01102f    ld      bc,$2f10
1d7a 2aef2e    ld      hl,($2eef)
1d7d eb        ex      de,hl
1d7e 2aed2e    ld      hl,($2eed)
1d81 cd6a02    call    $026a
1d84 c9        ret     

1d85 22212f    ld      ($2f21),hl
1d88 eb        ex      de,hl
1d89 22232f    ld      ($2f23),hl
1d8c 3e02      ld      a,$02
1d8e 21252f    ld      hl,$2f25
1d91 cd6582    call    $8265
1d94 3a818e    ld      a,($8e81)
1d97 32192f    ld      ($2f19),a
1d9a 21568e    ld      hl,$8e56
1d9d cdcd81    call    $81cd
1da0 2a252f    ld      hl,($2f25)
1da3 cdbe81    call    $81be
1da6 2a212f    ld      hl,($2f21)
1da9 7e        ld      a,(hl)
1daa 23        inc     hl
1dab 66        ld      h,(hl)
1dac 6f        ld      l,a
1dad eb        ex      de,hl
1dae 2a232f    ld      hl,($2f23)
1db1 73        ld      (hl),e
1db2 23        inc     hl
1db3 72        ld      (hl),d
1db4 11f41d    ld      de,$1df4
1db7 2a212f    ld      hl,($2f21)
1dba cd543a    call    $3a54
1dbd 322a2f    ld      ($2f2a),a
1dc0 b7        or      a
1dc1 cac81d    jp      z,$1dc8
1dc4 3a192f    ld      a,($2f19)
1dc7 c9        ret     

1dc8 215a8e    ld      hl,$8e5a
1dcb cdcd81    call    $81cd
1dce 2a252f    ld      hl,($2f25)
1dd1 cdbe81    call    $81be
1dd4 210100    ld      hl,$0001
1dd7 eb        ex      de,hl
1dd8 2a232f    ld      hl,($2f23)
1ddb 73        ld      (hl),e
1ddc 23        inc     hl
1ddd 72        ld      (hl),d
1dde 2a272f    ld      hl,($2f27)
1de1 7e        ld      a,(hl)
1de2 b7        or      a
1de3 caf01d    jp      z,$1df0
1de6 210200    ld      hl,$0002
1de9 eb        ex      de,hl
1dea 2a232f    ld      hl,($2f23)
1ded 73        ld      (hl),e
1dee 23        inc     hl
1def 72        ld      (hl),d
1df0 3a192f    ld      a,($2f19)
1df3 c9        ret     

1df4 1000      djnz    $1df6
1df6 00        nop     
1df7 00        nop     
1df8 2ad98c    ld      hl,($8cd9)
1dfb 23        inc     hl
1dfc 22d98c    ld      ($8cd9),hl
1dff cdfa2c    call    $2cfa
1e02 21d98c    ld      hl,$8cd9
1e05 cd5f54    call    $545f
1e08 3a7e8e    ld      a,($8e7e)
1e0b b7        or      a
1e0c ca1b1e    jp      z,$1e1b
1e0f 01d98c    ld      bc,$8cd9
1e12 11c08d    ld      de,$8dc0
1e15 21db8c    ld      hl,$8cdb
1e18 cd7870    call    $7078
1e1b 3a7d8e    ld      a,($8e7d)
1e1e b7        or      a
1e1f ca2e1e    jp      z,$1e2e
1e22 01d98c    ld      bc,$8cd9
1e25 11c88d    ld      de,$8dc8
1e28 21dd8c    ld      hl,$8cdd
1e2b cd7870    call    $7078
1e2e 3a7b8e    ld      a,($8e7b)
1e31 b7        or      a
1e32 ca411e    jp      z,$1e41
1e35 01d98c    ld      bc,$8cd9
1e38 11d08d    ld      de,$8dd0
1e3b 21df8c    ld      hl,$8cdf
1e3e cd7870    call    $7078
1e41 3a7f8e    ld      a,($8e7f)
1e44 b7        or      a
1e45 ca541e    jp      z,$1e54
1e48 01d98c    ld      bc,$8cd9
1e4b 11d88d    ld      de,$8dd8
1e4e 21e18c    ld      hl,$8ce1
1e51 cd7870    call    $7078
1e54 3a7c8e    ld      a,($8e7c)
1e57 b7        or      a
1e58 ca671e    jp      z,$1e67
1e5b 01d98c    ld      bc,$8cd9
1e5e 11e08d    ld      de,$8de0
1e61 21e38c    ld      hl,$8ce3
1e64 cd7870    call    $7078
1e67 c9        ret     

1e68 21911e    ld      hl,$1e91
1e6b cdcd81    call    $81cd
1e6e 21c18e    ld      hl,$8ec1
1e71 cdbe81    call    $81be
1e74 21951e    ld      hl,$1e95
1e77 cdcd81    call    $81cd
1e7a 21bd8e    ld      hl,$8ebd
1e7d cdbe81    call    $81be
1e80 218d1e    ld      hl,$1e8d
1e83 cdcd81    call    $81cd
1e86 21c58e    ld      hl,$8ec5
1e89 cdbe81    call    $81be
1e8c c9        ret     

1e8d 00        nop     
1e8e 00        nop     
1e8f 00        nop     
1e90 00        nop     
1e91 bc        cp      h
1e92 a2        and     d
1e93 31b9bc    ld      sp,$bcb9
1e96 a2        and     d
1e97 b1        or      c
1e98 b9        cp      c
1e99 222e2f    ld      ($2f2e),hl
1e9c 2a2e2f    ld      hl,($2f2e)
1e9f cdcd81    call    $81cd
1ea2 21768d    ld      hl,$8d76
1ea5 cded7d    call    $7ded
1ea8 d601      sub     $01
1eaa 9f        sbc     a,a
1eab 32332f    ld      ($2f33),a
1eae b7        or      a
1eaf cab31e    jp      z,$1eb3
1eb2 c9        ret     

1eb3 2a2e2f    ld      hl,($2f2e)
1eb6 eb        ex      de,hl
1eb7 21c18e    ld      hl,$8ec1
1eba 3e02      ld      a,$02
1ebc cd2f2e    call    $2e2f
1ebf 21c18e    ld      hl,$8ec1
1ec2 cdbe81    call    $81be
1ec5 2a2e2f    ld      hl,($2f2e)
1ec8 eb        ex      de,hl
1ec9 21bd8e    ld      hl,$8ebd
1ecc 3e02      ld      a,$02
1ece cd3a2e    call    $2e3a
1ed1 21bd8e    ld      hl,$8ebd
1ed4 cdbe81    call    $81be
1ed7 21c58e    ld      hl,$8ec5
1eda cdcd81    call    $81cd
1edd 2a2e2f    ld      hl,($2f2e)
1ee0 cd8b7d    call    $7d8b
1ee3 21c58e    ld      hl,$8ec5
1ee6 cdbe81    call    $81be
1ee9 c9        ret     

1eea 223d2f    ld      ($2f3d),hl
1eed eb        ex      de,hl
1eee 223f2f    ld      ($2f3f),hl
1ef1 212a1f    ld      hl,$1f2a
1ef4 cdca06    call    $06ca
1ef7 21422f    ld      hl,$2f42
1efa cdc706    call    $06c7
1efd 2a3f2f    ld      hl,($2f3f)
1f00 eb        ex      de,hl
1f01 2a3d2f    ld      hl,($2f3d)
1f04 cdda01    call    $01da
1f07 212e1f    ld      hl,$1f2e
1f0a cdca06    call    $06ca
1f0d 2a3f2f    ld      hl,($2f3f)
1f10 eb        ex      de,hl
1f11 2a3d2f    ld      hl,($2f3d)
1f14 cde364    call    $64e3
1f17 21422f    ld      hl,$2f42
1f1a cde42d    call    $2de4
1f1d 32352f    ld      ($2f35),a
1f20 21321f    ld      hl,$1f32
1f23 cd0e78    call    $780e
1f26 3a352f    ld      a,($2f35)
1f29 c9        ret     

1f2a 02        ld      (bc),a
1f2b 00        nop     
1f2c 00        nop     
1f2d 00        nop     
1f2e 00        nop     
1f2f 00        nop     
1f30 00        nop     
1f31 00        nop     
1f32 07        rlca    
1f33 00        nop     
1f34 00        nop     
1f35 00        nop     
1f36 22452f    ld      ($2f45),hl
1f39 114b2f    ld      de,$2f4b
1f3c 21472f    ld      hl,$2f47
1f3f cdd401    call    $01d4
1f42 2a452f    ld      hl,($2f45)
1f45 cd7002    call    $0270
1f48 af        xor     a
1f49 32628c    ld      ($8c62),a
1f4c 2152a6    ld      hl,$a652
1f4f cdcd81    call    $81cd
1f52 2162a6    ld      hl,$a662
1f55 cd8b7d    call    $7d8b
1f58 215aa6    ld      hl,$a65a
1f5b cded7d    call    $7ded
1f5e 214f2f    ld      hl,$2f4f
1f61 cdbe81    call    $81be
1f64 114f2f    ld      de,$2f4f
1f67 214ea6    ld      hl,$a64e
1f6a cded2b    call    $2bed
1f6d 214b2f    ld      hl,$2f4b
1f70 cdcd81    call    $81cd
1f73 215e8c    ld      hl,$8c5e
1f76 cded7d    call    $7ded
1f79 21532f    ld      hl,$2f53
1f7c cdbe81    call    $81be
1f7f 21b31f    ld      hl,$1fb3
1f82 cdcd81    call    $81cd
1f85 215a8c    ld      hl,$8c5a
1f88 cdfe7e    call    $7efe
1f8b 21472f    ld      hl,$2f47
1f8e cded7d    call    $7ded
1f91 cd867c    call    $7c86
1f94 214f2f    ld      hl,$2f4f
1f97 cdbe81    call    $81be
1f9a 114b2f    ld      de,$2f4b
1f9d 214f2f    ld      hl,$2f4f
1fa0 cde364    call    $64e3
1fa3 2a452f    ld      hl,($2f45)
1fa6 cdb065    call    $65b0
1fa9 11532f    ld      de,$2f53
1fac 21472f    ld      hl,$2f47
1faf cde364    call    $64e3
1fb2 c9        ret     

1fb3 00        nop     
1fb4 00        nop     
1fb5 00        nop     
1fb6 80        add     a,b
1fb7 22582f    ld      ($2f58),hl
1fba 3e01      ld      a,$01
1fbc 325b2f    ld      ($2f5b),a
1fbf af        xor     a
1fc0 325c2f    ld      ($2f5c),a
1fc3 af        xor     a
1fc4 325d2f    ld      ($2f5d),a
1fc7 210100    ld      hl,$0001
1fca 225e2f    ld      ($2f5e),hl
1fcd 2a5e2f    ld      hl,($2f5e)
1fd0 2b        dec     hl
1fd1 eb        ex      de,hl
1fd2 2a582f    ld      hl,($2f58)
1fd5 19        add     hl,de
1fd6 7e        ld      a,(hl)
1fd7 325a2f    ld      ($2f5a),a
1fda 2a5e2f    ld      hl,($2f5e)
1fdd 23        inc     hl
1fde 225e2f    ld      ($2f5e),hl
1fe1 3a5a2f    ld      a,($2f5a)
1fe4 214d8c    ld      hl,$8c4d
1fe7 96        sub     (hl)
1fe8 d601      sub     $01
1fea 9f        sbc     a,a
1feb 32602f    ld      ($2f60),a
1fee b7        or      a
1fef c23c20    jp      nz,$203c
1ff2 3a5a2f    ld      a,($2f5a)
1ff5 d60d      sub     $0d
1ff7 d601      sub     $01
1ff9 9f        sbc     a,a
1ffa 32602f    ld      ($2f60),a
1ffd b7        or      a
1ffe c22e20    jp      nz,$202e
2001 3a5a2f    ld      a,($2f5a)
2004 d620      sub     $20
2006 17        rla     
2007 9f        sbc     a,a
2008 32602f    ld      ($2f60),a
200b b7        or      a
200c c2cd1f    jp      nz,$1fcd
200f 3a5c2f    ld      a,($2f5c)
2012 3c        inc     a
2013 325c2f    ld      ($2f5c),a
2016 215d2f    ld      hl,$2f5d
2019 96        sub     (hl)
201a 3d        dec     a
201b d67f      sub     $7f
201d 9f        sbc     a,a
201e 32602f    ld      ($2f60),a
2021 b7        or      a
2022 ca2b20    jp      z,$202b
2025 3a5c2f    ld      a,($2f5c)
2028 325d2f    ld      ($2f5d),a
202b c3cd1f    jp      $1fcd
202e af        xor     a
202f 325c2f    ld      ($2f5c),a
2032 3a5b2f    ld      a,($2f5b)
2035 3c        inc     a
2036 325b2f    ld      ($2f5b),a
2039 c3cd1f    jp      $1fcd
203c 3a5c2f    ld      a,($2f5c)
203f d601      sub     $01
2041 9f        sbc     a,a
2042 32602f    ld      ($2f60),a
2045 b7        or      a
2046 ca5020    jp      z,$2050
2049 3a5b2f    ld      a,($2f5b)
204c 3d        dec     a
204d 325b2f    ld      ($2f5b),a
2050 3a5d2f    ld      a,($2f5d)
2053 3d        dec     a
2054 6f        ld      l,a
2055 17        rla     
2056 9f        sbc     a,a
2057 67        ld      h,a
2058 cdde7f    call    $7fde
205b 215ea6    ld      hl,$a65e
205e cdfe7e    call    $7efe
2061 2156a6    ld      hl,$a656
2064 cd8b7d    call    $7d8b
2067 214ea6    ld      hl,$a64e
206a cdbe81    call    $81be
206d 3a5b2f    ld      a,($2f5b)
2070 3d        dec     a
2071 6f        ld      l,a
2072 17        rla     
2073 9f        sbc     a,a
2074 67        ld      h,a
2075 cdde7f    call    $7fde
2078 2162a6    ld      hl,$a662
207b cdfe7e    call    $7efe
207e 215aa6    ld      hl,$a65a
2081 cd8b7d    call    $7d8b
2084 2152a6    ld      hl,$a652
2087 cdbe81    call    $81be
208a c9        ret     

208b 22622f    ld      ($2f62),hl
208e eb        ex      de,hl
208f 22642f    ld      ($2f64),hl
2092 3e04      ld      a,$04
2094 21662f    ld      hl,$2f66
2097 cd6582    call    $8265
209a 2a642f    ld      hl,($2f64)
209d eb        ex      de,hl
209e 2a622f    ld      hl,($2f62)
20a1 3e02      ld      a,$02
20a3 cd2f2e    call    $2e2f
20a6 21732f    ld      hl,$2f73
20a9 cdbe81    call    $81be
20ac 2a642f    ld      hl,($2f64)
20af eb        ex      de,hl
20b0 2a622f    ld      hl,($2f62)
20b3 3e02      ld      a,$02
20b5 cd3a2e    call    $2e3a
20b8 21772f    ld      hl,$2f77
20bb cdbe81    call    $81be
20be 2a682f    ld      hl,($2f68)
20c1 eb        ex      de,hl
20c2 2a662f    ld      hl,($2f66)
20c5 3e02      ld      a,$02
20c7 cd2f2e    call    $2e2f
20ca 217b2f    ld      hl,$2f7b
20cd cdbe81    call    $81be
20d0 2a682f    ld      hl,($2f68)
20d3 eb        ex      de,hl
20d4 2a662f    ld      hl,($2f66)
20d7 3e02      ld      a,$02
20d9 cd3a2e    call    $2e3a
20dc 217f2f    ld      hl,$2f7f
20df cdbe81    call    $81be
20e2 3e01      ld      a,$01
20e4 326e2f    ld      ($2f6e),a
20e7 210100    ld      hl,$0001
20ea 22832f    ld      ($2f83),hl
20ed 3a6e2f    ld      a,($2f6e)
20f0 2a6a2f    ld      hl,($2f6a)
20f3 a6        and     (hl)
20f4 d601      sub     $01
20f6 9f        sbc     a,a
20f7 32852f    ld      ($2f85),a
20fa b7        or      a
20fb c28623    jp      nz,$2386
20fe 2a832f    ld      hl,($2f83)
2101 cdfe7f    call    $7ffe
2104 04        inc     b
2105 4b        ld      c,e
2106 210d21    ld      hl,$210d
2109 89        adc     a,c
210a 218921    ld      hl,$2189
210d 21732f    ld      hl,$2f73
2110 cdcd81    call    $81cd
2113 21862f    ld      hl,$2f86
2116 cdbe81    call    $81be
2119 21862f    ld      hl,$2f86
211c cdcd81    call    $81cd
211f 2a6c2f    ld      hl,($2f6c)
2122 cd8b7d    call    $7d8b
2125 21862f    ld      hl,$2f86
2128 cdbe81    call    $81be
212b 21772f    ld      hl,$2f77
212e cded7d    call    $7ded
2131 3d        dec     a
2132 d67f      sub     $7f
2134 9f        sbc     a,a
2135 32852f    ld      ($2f85),a
2138 b7        or      a
2139 c28623    jp      nz,$2386
213c 018a2f    ld      bc,$2f8a
213f 117b2f    ld      de,$2f7b
2142 21862f    ld      hl,$2f86
2145 cda423    call    $23a4
2148 c31921    jp      $2119
214b 217b2f    ld      hl,$2f7b
214e cdcd81    call    $81cd
2151 218e2f    ld      hl,$2f8e
2154 cdbe81    call    $81be
2157 218e2f    ld      hl,$2f8e
215a cdcd81    call    $81cd
215d 2a6c2f    ld      hl,($2f6c)
2160 cd8b7d    call    $7d8b
2163 218e2f    ld      hl,$2f8e
2166 cdbe81    call    $81be
2169 217f2f    ld      hl,$2f7f
216c cded7d    call    $7ded
216f 3d        dec     a
2170 d67f      sub     $7f
2172 9f        sbc     a,a
2173 32852f    ld      ($2f85),a
2176 b7        or      a
2177 c28623    jp      nz,$2386
217a 01922f    ld      bc,$2f92
217d 118e2f    ld      de,$2f8e
2180 21732f    ld      hl,$2f73
2183 cda423    call    $23a4
2186 c35721    jp      $2157
2189 21a023    ld      hl,$23a0
218c cdcd81    call    $81cd
218f 2a6c2f    ld      hl,($2f6c)
2192 cdfe7e    call    $7efe
2195 21962f    ld      hl,$2f96
2198 cdbe81    call    $81be
219b 21772f    ld      hl,$2f77
219e cdcd81    call    $81cd
21a1 21732f    ld      hl,$2f73
21a4 cd8b7d    call    $7d8b
21a7 216f2f    ld      hl,$2f6f
21aa cdfe7e    call    $7efe
21ad 219a2f    ld      hl,$2f9a
21b0 cdbe81    call    $81be
21b3 21772f    ld      hl,$2f77
21b6 cdcd81    call    $81cd
21b9 21732f    ld      hl,$2f73
21bc cded7d    call    $7ded
21bf 216f2f    ld      hl,$2f6f
21c2 cdfe7e    call    $7efe
21c5 219e2f    ld      hl,$2f9e
21c8 cdbe81    call    $81be
21cb 217f2f    ld      hl,$2f7f
21ce cdcd81    call    $81cd
21d1 217b2f    ld      hl,$2f7b
21d4 cd8b7d    call    $7d8b
21d7 216f2f    ld      hl,$2f6f
21da cdfe7e    call    $7efe
21dd 21a22f    ld      hl,$2fa2
21e0 cdbe81    call    $81be
21e3 217f2f    ld      hl,$2f7f
21e6 cdcd81    call    $81cd
21e9 217b2f    ld      hl,$2f7b
21ec cded7d    call    $7ded
21ef 216f2f    ld      hl,$2f6f
21f2 cdfe7e    call    $7efe
21f5 21a62f    ld      hl,$2fa6
21f8 cdbe81    call    $81be
21fb 219e2f    ld      hl,$2f9e
21fe cd8b7d    call    $7d8b
2201 21aa2f    ld      hl,$2faa
2204 cdbe81    call    $81be
2207 219e2f    ld      hl,$2f9e
220a cdcd81    call    $81cd
220d 21a62f    ld      hl,$2fa6
2210 cded7d    call    $7ded
2213 21ae2f    ld      hl,$2fae
2216 cdbe81    call    $81be
2219 21a22f    ld      hl,$2fa2
221c cdcd81    call    $81cd
221f 219e2f    ld      hl,$2f9e
2222 cd8b7d    call    $7d8b
2225 21b22f    ld      hl,$2fb2
2228 cdbe81    call    $81be
222b 219e2f    ld      hl,$2f9e
222e cdcd81    call    $81cd
2231 21a22f    ld      hl,$2fa2
2234 cded7d    call    $7ded
2237 21b62f    ld      hl,$2fb6
223a cdbe81    call    $81be
223d 21aa2f    ld      hl,$2faa
2240 cdcd81    call    $81cd
2243 cd867c    call    $7c86
2246 21ba2f    ld      hl,$2fba
2249 cdbe81    call    $81be
224c 21ba2f    ld      hl,$2fba
224f cdcd81    call    $81cd
2252 21962f    ld      hl,$2f96
2255 cd8b7d    call    $7d8b
2258 21ba2f    ld      hl,$2fba
225b cdbe81    call    $81be
225e 21aa2f    ld      hl,$2faa
2261 cded7d    call    $7ded
2264 17        rla     
2265 3f        ccf     
2266 9f        sbc     a,a
2267 32852f    ld      ($2f85),a
226a b7        or      a
226b c28623    jp      nz,$2386
226e 21ba2f    ld      hl,$2fba
2271 cdcd81    call    $81cd
2274 21ae2f    ld      hl,$2fae
2277 cded7d    call    $7ded
227a 3d        dec     a
227b d67f      sub     $7f
227d 9f        sbc     a,a
227e 32852f    ld      ($2f85),a
2281 b7        or      a
2282 c2a622    jp      nz,$22a6
2285 21ba2f    ld      hl,$2fba
2288 cdcd81    call    $81cd
228b 21a62f    ld      hl,$2fa6
228e cd8b7d    call    $7d8b
2291 21be2f    ld      hl,$2fbe
2294 cdbe81    call    $81be
2297 217b2f    ld      hl,$2f7b
229a cdcd81    call    $81cd
229d 218e2f    ld      hl,$2f8e
22a0 cdbe81    call    $81be
22a3 c3c422    jp      $22c4
22a6 219e2f    ld      hl,$2f9e
22a9 cdcd81    call    $81cd
22ac 21be2f    ld      hl,$2fbe
22af cdbe81    call    $81be
22b2 21ba2f    ld      hl,$2fba
22b5 cdcd81    call    $81cd
22b8 21b62f    ld      hl,$2fb6
22bb cded7d    call    $7ded
22be 218e2f    ld      hl,$2f8e
22c1 cdbe81    call    $81be
22c4 21ba2f    ld      hl,$2fba
22c7 cdcd81    call    $81cd
22ca 21ae2f    ld      hl,$2fae
22cd cd8b7d    call    $7d8b
22d0 3d        dec     a
22d1 d67f      sub     $7f
22d3 9f        sbc     a,a
22d4 32852f    ld      ($2f85),a
22d7 b7        or      a
22d8 c2ff22    jp      nz,$22ff
22db 219e2f    ld      hl,$2f9e
22de cdcd81    call    $81cd
22e1 cd867c    call    $7c86
22e4 21c22f    ld      hl,$2fc2
22e7 cdbe81    call    $81be
22ea 21ba2f    ld      hl,$2fba
22ed cdcd81    call    $81cd
22f0 21b22f    ld      hl,$2fb2
22f3 cd8b7d    call    $7d8b
22f6 21c62f    ld      hl,$2fc6
22f9 cdbe81    call    $81be
22fc c31d23    jp      $231d
22ff 21ba2f    ld      hl,$2fba
2302 cdcd81    call    $81cd
2305 21a62f    ld      hl,$2fa6
2308 cded7d    call    $7ded
230b 21c22f    ld      hl,$2fc2
230e cdbe81    call    $81be
2311 217f2f    ld      hl,$2f7f
2314 cdcd81    call    $81cd
2317 21c62f    ld      hl,$2fc6
231a cdbe81    call    $81be
231d 3a6e2f    ld      a,($2f6e)
2320 d604      sub     $04
2322 d601      sub     $01
2324 9f        sbc     a,a
2325 32852f    ld      ($2f85),a
2328 b7        or      a
2329 c25323    jp      nz,$2353
232c 21be2f    ld      hl,$2fbe
232f cdcd81    call    $81cd
2332 219a2f    ld      hl,$2f9a
2335 cd8b7d    call    $7d8b
2338 21862f    ld      hl,$2f86
233b cdbe81    call    $81be
233e 21c22f    ld      hl,$2fc2
2341 cdcd81    call    $81cd
2344 219a2f    ld      hl,$2f9a
2347 cd8b7d    call    $7d8b
234a 21ca2f    ld      hl,$2fca
234d cdbe81    call    $81be
2350 c37723    jp      $2377
2353 219a2f    ld      hl,$2f9a
2356 cdcd81    call    $81cd
2359 21be2f    ld      hl,$2fbe
235c cded7d    call    $7ded
235f 21862f    ld      hl,$2f86
2362 cdbe81    call    $81be
2365 219a2f    ld      hl,$2f9a
2368 cdcd81    call    $81cd
236b 21c22f    ld      hl,$2fc2
236e cded7d    call    $7ded
2371 21ca2f    ld      hl,$2fca
2374 cdbe81    call    $81be
2377 01ce2f    ld      bc,$2fce
237a 118e2f    ld      de,$2f8e
237d 21862f    ld      hl,$2f86
2380 cda423    call    $23a4
2383 c34c22    jp      $224c
2386 3a6e2f    ld      a,($2f6e)
2389 6f        ld      l,a
238a 17        rla     
238b 9f        sbc     a,a
238c 67        ld      h,a
238d 29        add     hl,hl
238e 7d        ld      a,l
238f 326e2f    ld      ($2f6e),a
2392 2a832f    ld      hl,($2f83)
2395 23        inc     hl
2396 3e04      ld      a,$04
2398 95        sub     l
2399 3e00      ld      a,$00
239b 9c        sbc     a,h
239c f2ea20    jp      p,$20ea
239f c9        ret     

23a0 ee04      xor     $04
23a2 35        dec     (hl)
23a3 81        add     a,c
23a4 22d32f    ld      ($2fd3),hl
23a7 eb        ex      de,hl
23a8 22d52f    ld      ($2fd5),hl
23ab 3e02      ld      a,$02
23ad 21d72f    ld      hl,$2fd7
23b0 cd6582    call    $8265
23b3 3adb2f    ld      a,($2fdb)
23b6 2f        cpl     
23b7 32db2f    ld      ($2fdb),a
23ba b7        or      a
23bb c2d323    jp      nz,$23d3
23be 2ad52f    ld      hl,($2fd5)
23c1 eb        ex      de,hl
23c2 2ad32f    ld      hl,($2fd3)
23c5 cde364    call    $64e3
23c8 2ad92f    ld      hl,($2fd9)
23cb eb        ex      de,hl
23cc 2ad72f    ld      hl,($2fd7)
23cf cd1e65    call    $651e
23d2 c9        ret     

23d3 2ad92f    ld      hl,($2fd9)
23d6 eb        ex      de,hl
23d7 2ad72f    ld      hl,($2fd7)
23da cde364    call    $64e3
23dd 2ad52f    ld      hl,($2fd5)
23e0 eb        ex      de,hl
23e1 2ad32f    ld      hl,($2fd3)
23e4 cd1e65    call    $651e
23e7 c9        ret     

23e8 22dd2f    ld      ($2fdd),hl
23eb eb        ex      de,hl
23ec 22df2f    ld      ($2fdf),hl
23ef 3e05      ld      a,$05
23f1 21e12f    ld      hl,$2fe1
23f4 cd6582    call    $8265
23f7 210000    ld      hl,$0000
23fa 22f42f    ld      ($2ff4),hl
23fd 21f425    ld      hl,$25f4
2400 cdc364    call    $64c3
2403 2ae12f    ld      hl,($2fe1)
2406 eb        ex      de,hl
2407 2adf2f    ld      hl,($2fdf)
240a cde364    call    $64e3
240d 21f825    ld      hl,$25f8
2410 cdc364    call    $64c3
2413 11fa2f    ld      de,$2ffa
2416 21f62f    ld      hl,$2ff6
2419 cdd401    call    $01d4
241c 2add2f    ld      hl,($2fdd)
241f 7e        ld      a,(hl)
2420 b7        or      a
2421 c26d24    jp      nz,$246d
2424 2ae72f    ld      hl,($2fe7)
2427 cdcd81    call    $81cd
242a 21fe2f    ld      hl,$2ffe
242d cdbe81    call    $81be
2430 21ec2f    ld      hl,$2fec
2433 cdcd81    call    $81cd
2436 210230    ld      hl,$3002
2439 cdbe81    call    $81be
243c 21ec2f    ld      hl,$2fec
243f cdcd81    call    $81cd
2442 210630    ld      hl,$3006
2445 cdbe81    call    $81be
2448 2ae32f    ld      hl,($2fe3)
244b cdcd81    call    $81cd
244e 2ae12f    ld      hl,($2fe1)
2451 cded7d    call    $7ded
2454 21a6a6    ld      hl,$a6a6
2457 cdfe7e    call    $7efe
245a 2ae52f    ld      hl,($2fe5)
245d 7e        ld      a,(hl)
245e 23        inc     hl
245f 66        ld      h,(hl)
2460 6f        ld      l,a
2461 cdfa7d    call    $7dfa
2464 210a30    ld      hl,$300a
2467 cdbe81    call    $81be
246a c3b324    jp      $24b3
246d 21ec2f    ld      hl,$2fec
2470 cdcd81    call    $81cd
2473 21fe2f    ld      hl,$2ffe
2476 cdbe81    call    $81be
2479 2ae72f    ld      hl,($2fe7)
247c cdcd81    call    $81cd
247f 210230    ld      hl,$3002
2482 cdbe81    call    $81be
2485 2ae32f    ld      hl,($2fe3)
2488 cdcd81    call    $81cd
248b 2adf2f    ld      hl,($2fdf)
248e cded7d    call    $7ded
2491 219ea6    ld      hl,$a69e
2494 cdfe7e    call    $7efe
2497 2ae52f    ld      hl,($2fe5)
249a 7e        ld      a,(hl)
249b 23        inc     hl
249c 66        ld      h,(hl)
249d 6f        ld      l,a
249e cdfa7d    call    $7dfa
24a1 210630    ld      hl,$3006
24a4 cdbe81    call    $81be
24a7 21ec2f    ld      hl,$2fec
24aa cdcd81    call    $81cd
24ad 210a30    ld      hl,$300a
24b0 cdbe81    call    $81be
24b3 3af9a5    ld      a,($a5f9)
24b6 2f        cpl     
24b7 320e30    ld      ($300e),a
24ba b7        or      a
24bb c20f25    jp      nz,$250f
24be 210630    ld      hl,$3006
24c1 cdcd81    call    $81cd
24c4 21f02f    ld      hl,$2ff0
24c7 cdfe7e    call    $7efe
24ca 210f30    ld      hl,$300f
24cd cdbe81    call    $81be
24d0 210a30    ld      hl,$300a
24d3 cdcd81    call    $81cd
24d6 21f02f    ld      hl,$2ff0
24d9 cdfe7e    call    $7efe
24dc 211330    ld      hl,$3013
24df cdbe81    call    $81be
24e2 21f62f    ld      hl,$2ff6
24e5 cdcd81    call    $81cd
24e8 210f30    ld      hl,$300f
24eb cded7d    call    $7ded
24ee 211730    ld      hl,$3017
24f1 cdbe81    call    $81be
24f4 21fa2f    ld      hl,$2ffa
24f7 cdcd81    call    $81cd
24fa 211330    ld      hl,$3013
24fd cded7d    call    $7ded
2500 211b30    ld      hl,$301b
2503 cdbe81    call    $81be
2506 111b30    ld      de,$301b
2509 211730    ld      hl,$3017
250c cde364    call    $64e3
250f 11fa2f    ld      de,$2ffa
2512 21f62f    ld      hl,$2ff6
2515 cd1e65    call    $651e
2518 3af8a5    ld      a,($a5f8)
251b b7        or      a
251c c26625    jp      nz,$2566
251f 110230    ld      de,$3002
2522 21fe2f    ld      hl,$2ffe
2525 cd3d65    call    $653d
2528 2ae92f    ld      hl,($2fe9)
252b 7e        ld      a,(hl)
252c b7        or      a
252d ca5d25    jp      z,$255d
2530 21f62f    ld      hl,$2ff6
2533 cdcd81    call    $81cd
2536 21fe2f    ld      hl,$2ffe
2539 cded7d    call    $7ded
253c 211730    ld      hl,$3017
253f cdbe81    call    $81be
2542 21fa2f    ld      hl,$2ffa
2545 cdcd81    call    $81cd
2548 210230    ld      hl,$3002
254b cded7d    call    $7ded
254e 211b30    ld      hl,$301b
2551 cdbe81    call    $81be
2554 111b30    ld      de,$301b
2557 211730    ld      hl,$3017
255a cd1e65    call    $651e
255d 11fa2f    ld      de,$2ffa
2560 21f62f    ld      hl,$2ff6
2563 cd1e65    call    $651e
2566 2af42f    ld      hl,($2ff4)
2569 eb        ex      de,hl
256a 2ae52f    ld      hl,($2fe5)
256d 7e        ld      a,(hl)
256e 23        inc     hl
256f 66        ld      h,(hl)
2570 6f        ld      l,a
2571 7b        ld      a,e
2572 95        sub     l
2573 6f        ld      l,a
2574 7a        ld      a,d
2575 9c        sbc     a,h
2576 67        ld      h,a
2577 7d        ld      a,l
2578 07        rlca    
2579 b5        or      l
257a e67f      and     $7f
257c b4        or      h
257d d601      sub     $01
257f 9f        sbc     a,a
2580 320e30    ld      ($300e),a
2583 b7        or      a
2584 c2b525    jp      nz,$25b5
2587 210630    ld      hl,$3006
258a cdcd81    call    $81cd
258d 21f62f    ld      hl,$2ff6
2590 cd8b7d    call    $7d8b
2593 21f62f    ld      hl,$2ff6
2596 cdbe81    call    $81be
2599 210a30    ld      hl,$300a
259c cdcd81    call    $81cd
259f 21fa2f    ld      hl,$2ffa
25a2 cd8b7d    call    $7d8b
25a5 21fa2f    ld      hl,$2ffa
25a8 cdbe81    call    $81be
25ab 2af42f    ld      hl,($2ff4)
25ae 23        inc     hl
25af 22f42f    ld      ($2ff4),hl
25b2 c30f25    jp      $250f
25b5 3af9a5    ld      a,($a5f9)
25b8 2f        cpl     
25b9 320e30    ld      ($300e),a
25bc b7        or      a
25bd c2ed25    jp      nz,$25ed
25c0 210f30    ld      hl,$300f
25c3 cdcd81    call    $81cd
25c6 21f62f    ld      hl,$2ff6
25c9 cd8b7d    call    $7d8b
25cc 211730    ld      hl,$3017
25cf cdbe81    call    $81be
25d2 211330    ld      hl,$3013
25d5 cdcd81    call    $81cd
25d8 21fa2f    ld      hl,$2ffa
25db cd8b7d    call    $7d8b
25de 211b30    ld      hl,$301b
25e1 cdbe81    call    $81be
25e4 111b30    ld      de,$301b
25e7 211730    ld      hl,$3017
25ea cd1e65    call    $651e
25ed 21f425    ld      hl,$25f4
25f0 cdc364    call    $64c3
25f3 c9        ret     

25f4 02        ld      (bc),a
25f5 00        nop     
25f6 00        nop     
25f7 00        nop     
25f8 010000    ld      bc,$0000
25fb 00        nop     
25fc 222030    ld      ($3020),hl
25ff eb        ex      de,hl
2600 222230    ld      ($3022),hl
2603 3e06      ld      a,$06
2605 212430    ld      hl,$3024
2608 cd6582    call    $8265
260b 211629    ld      hl,$2916
260e cdc364    call    $64c3
2611 218ea6    ld      hl,$a68e
2614 cdcd81    call    $81cd
2617 2a2230    ld      hl,($3022)
261a cdfe7e    call    $7efe
261d 218aa6    ld      hl,$a68a
2620 cd8b7d    call    $7d8b
2623 213930    ld      hl,$3039
2626 cdbe81    call    $81be
2629 2196a6    ld      hl,$a696
262c cdcd81    call    $81cd
262f 2a2430    ld      hl,($3024)
2632 cdfe7e    call    $7efe
2635 2192a6    ld      hl,$a692
2638 cd8b7d    call    $7d8b
263b 213d30    ld      hl,$303d
263e cdbe81    call    $81be
2641 2a2e30    ld      hl,($302e)
2644 cdc87a    call    $7ac8
2647 2a2830    ld      hl,($3028)
264a 7e        ld      a,(hl)
264b 23        inc     hl
264c 66        ld      h,(hl)
264d 6f        ld      l,a
264e cdfa7d    call    $7dfa
2651 214130    ld      hl,$3041
2654 cdbe81    call    $81be
2657 211a29    ld      hl,$291a
265a cdcd81    call    $81cd
265d 214530    ld      hl,$3045
2660 cdbe81    call    $81be
2663 2a2830    ld      hl,($3028)
2666 7e        ld      a,(hl)
2667 23        inc     hl
2668 66        ld      h,(hl)
2669 6f        ld      l,a
266a eb        ex      de,hl
266b 2a2e30    ld      hl,($302e)
266e 7e        ld      a,(hl)
266f 23        inc     hl
2670 66        ld      h,(hl)
2671 6f        ld      l,a
2672 cd2180    call    $8021
2675 23        inc     hl
2676 224930    ld      ($3049),hl
2679 213130    ld      hl,$3031
267c cd282d    call    $2d28
267f 2a2030    ld      hl,($3020)
2682 7e        ld      a,(hl)
2683 b7        or      a
2684 c2cc26    jp      nz,$26cc
2687 2a2430    ld      hl,($3024)
268a cdcd81    call    $81cd
268d 214b30    ld      hl,$304b
2690 cdbe81    call    $81be
2693 2a2630    ld      hl,($3026)
2696 cdcd81    call    $81cd
2699 2a2430    ld      hl,($3024)
269c cded7d    call    $7ded
269f 214130    ld      hl,$3041
26a2 cdfe7e    call    $7efe
26a5 214f30    ld      hl,$304f
26a8 cdbe81    call    $81be
26ab 2196a6    ld      hl,$a696
26ae cdfe7e    call    $7efe
26b1 215330    ld      hl,$3053
26b4 cdbe81    call    $81be
26b7 21aea6    ld      hl,$a6ae
26ba cdcd81    call    $81cd
26bd 2a2a30    ld      hl,($302a)
26c0 cdfe7e    call    $7efe
26c3 215730    ld      hl,$3057
26c6 cdbe81    call    $81be
26c9 c30e27    jp      $270e
26cc 2a2230    ld      hl,($3022)
26cf cdcd81    call    $81cd
26d2 214b30    ld      hl,$304b
26d5 cdbe81    call    $81be
26d8 2a2630    ld      hl,($3026)
26db cdcd81    call    $81cd
26de 2a2230    ld      hl,($3022)
26e1 cded7d    call    $7ded
26e4 214130    ld      hl,$3041
26e7 cdfe7e    call    $7efe
26ea 214f30    ld      hl,$304f
26ed cdbe81    call    $81be
26f0 218ea6    ld      hl,$a68e
26f3 cdfe7e    call    $7efe
26f6 215b30    ld      hl,$305b
26f9 cdbe81    call    $81be
26fc 21b6a6    ld      hl,$a6b6
26ff cdcd81    call    $81cd
2702 2a2a30    ld      hl,($302a)
2705 cdfe7e    call    $7efe
2708 215730    ld      hl,$3057
270b cdbe81    call    $81be
270e 3eff      ld      a,$ff
2710 323030    ld      ($3030),a
2713 215730    ld      hl,$3057
2716 cdcd81    call    $81cd
2719 210000    ld      hl,$0000
271c cde77d    call    $7de7
271f 17        rla     
2720 9f        sbc     a,a
2721 325f30    ld      ($305f),a
2724 b7        or      a
2725 ca2c27    jp      z,$272c
2728 af        xor     a
2729 323030    ld      ($3030),a
272c 214b30    ld      hl,$304b
272f cdcd81    call    $81cd
2732 216030    ld      hl,$3060
2735 cdbe81    call    $81be
2738 213d30    ld      hl,$303d
273b cdcd81    call    $81cd
273e 216430    ld      hl,$3064
2741 cdbe81    call    $81be
2744 213930    ld      hl,$3039
2747 cdcd81    call    $81cd
274a 216830    ld      hl,$3068
274d cdbe81    call    $81be
2750 210100    ld      hl,$0001
2753 226c30    ld      ($306c),hl
2756 3af5a5    ld      a,($a5f5)
2759 b7        or      a
275a c26d27    jp      nz,$276d
275d 01ff30    ld      bc,$30ff
2760 2a2c30    ld      hl,($302c)
2763 eb        ex      de,hl
2764 216030    ld      hl,$3060
2767 cd635a    call    $5a63
276a c38527    jp      $2785
276d 210800    ld      hl,$0008
2770 eb        ex      de,hl
2771 2a2c30    ld      hl,($302c)
2774 19        add     hl,de
2775 226e30    ld      ($306e),hl
2778 016c30    ld      bc,$306c
277b 2a6e30    ld      hl,($306e)
277e eb        ex      de,hl
277f 21ff30    ld      hl,$30ff
2782 cd7870    call    $7078
2785 21ff30    ld      hl,$30ff
2788 cd7002    call    $0270
278b 2a2030    ld      hl,($3020)
278e 7e        ld      a,(hl)
278f b7        or      a
2790 c22f28    jp      nz,$282f
2793 213530    ld      hl,$3035
2796 cdcd81    call    $81cd
2799 2152a6    ld      hl,$a652
279c cdfe7e    call    $7efe
279f 216430    ld      hl,$3064
27a2 cd8b7d    call    $7d8b
27a5 215aa6    ld      hl,$a65a
27a8 cded7d    call    $7ded
27ab 217030    ld      hl,$3070
27ae cdbe81    call    $81be
27b1 216430    ld      hl,$3064
27b4 cdcd81    call    $81cd
27b7 215330    ld      hl,$3053
27ba cd8b7d    call    $7d8b
27bd 216430    ld      hl,$3064
27c0 cdbe81    call    $81be
27c3 217030    ld      hl,$3070
27c6 cdcd81    call    $81cd
27c9 2152a6    ld      hl,$a652
27cc cded7d    call    $7ded
27cf 217430    ld      hl,$3074
27d2 cdbe81    call    $81be
27d5 214530    ld      hl,$3045
27d8 cdcd81    call    $81cd
27db 217430    ld      hl,$3074
27de cded7d    call    $7ded
27e1 17        rla     
27e2 3f        ccf     
27e3 9f        sbc     a,a
27e4 325f30    ld      ($305f),a
27e7 b7        or      a
27e8 c2d428    jp      nz,$28d4
27eb 217030    ld      hl,$3070
27ee cdcd81    call    $81cd
27f1 215aa6    ld      hl,$a65a
27f4 cd8b7d    call    $7d8b
27f7 214530    ld      hl,$3045
27fa cdbe81    call    $81be
27fd 215730    ld      hl,$3057
2800 cdcd81    call    $81cd
2803 213930    ld      hl,$3039
2806 cd8b7d    call    $7d8b
2809 217830    ld      hl,$3078
280c cdbe81    call    $81be
280f 3a3030    ld      a,($3030)
2812 2f        cpl     
2813 325f30    ld      ($305f),a
2816 b7        or      a
2817 ca2c28    jp      z,$282c
281a 217830    ld      hl,$3078
281d cdcd81    call    $81cd
2820 214ea6    ld      hl,$a64e
2823 cded7d    call    $7ded
2826 217830    ld      hl,$3078
2829 cdbe81    call    $81be
282c c3c528    jp      $28c5
282f 213530    ld      hl,$3035
2832 cdcd81    call    $81cd
2835 214ea6    ld      hl,$a64e
2838 cdfe7e    call    $7efe
283b 216830    ld      hl,$3068
283e cded7d    call    $7ded
2841 cd867c    call    $7c86
2844 217830    ld      hl,$3078
2847 cdbe81    call    $81be
284a 216830    ld      hl,$3068
284d cdcd81    call    $81cd
2850 215b30    ld      hl,$305b
2853 cd8b7d    call    $7d8b
2856 216830    ld      hl,$3068
2859 cdbe81    call    $81be
285c 214530    ld      hl,$3045
285f cdcd81    call    $81cd
2862 217830    ld      hl,$3078
2865 cded7d    call    $7ded
2868 17        rla     
2869 3f        ccf     
286a 9f        sbc     a,a
286b 325f30    ld      ($305f),a
286e b7        or      a
286f c2d428    jp      nz,$28d4
2872 217830    ld      hl,$3078
2875 cdcd81    call    $81cd
2878 214ea6    ld      hl,$a64e
287b cd8b7d    call    $7d8b
287e 215ea6    ld      hl,$a65e
2881 cd8b7d    call    $7d8b
2884 214530    ld      hl,$3045
2887 cdbe81    call    $81be
288a 215730    ld      hl,$3057
288d cdcd81    call    $81cd
2890 213d30    ld      hl,$303d
2893 cd8b7d    call    $7d8b
2896 2152a6    ld      hl,$a652
2899 cd8b7d    call    $7d8b
289c 215aa6    ld      hl,$a65a
289f cded7d    call    $7ded
28a2 217030    ld      hl,$3070
28a5 cdbe81    call    $81be
28a8 3a3030    ld      a,($3030)
28ab 2f        cpl     
28ac 325f30    ld      ($305f),a
28af b7        or      a
28b0 cac528    jp      z,$28c5
28b3 217030    ld      hl,$3070
28b6 cdcd81    call    $81cd
28b9 2152a6    ld      hl,$a652
28bc cded7d    call    $7ded
28bf 217030    ld      hl,$3070
28c2 cdbe81    call    $81be
28c5 117030    ld      de,$3070
28c8 217830    ld      hl,$3078
28cb cde364    call    $64e3
28ce 21ff30    ld      hl,$30ff
28d1 cdb065    call    $65b0
28d4 2a6c30    ld      hl,($306c)
28d7 23        inc     hl
28d8 226c30    ld      ($306c),hl
28db 216030    ld      hl,$3060
28de cdcd81    call    $81cd
28e1 214f30    ld      hl,$304f
28e4 cd8b7d    call    $7d8b
28e7 216030    ld      hl,$3060
28ea cdbe81    call    $81be
28ed 2a6c30    ld      hl,($306c)
28f0 eb        ex      de,hl
28f1 2a4930    ld      hl,($3049)
28f4 7b        ld      a,e
28f5 95        sub     l
28f6 6f        ld      l,a
28f7 7a        ld      a,d
28f8 9c        sbc     a,h
28f9 67        ld      h,a
28fa 7d        ld      a,l
28fb 07        rlca    
28fc b5        or      l
28fd e67f      and     $7f
28ff b4        or      h
2900 3d        dec     a
2901 c681      add     a,$81
2903 9f        sbc     a,a
2904 325f30    ld      ($305f),a
2907 b7        or      a
2908 c25627    jp      nz,$2756
290b 211229    ld      hl,$2912
290e cdc364    call    $64c3
2911 c9        ret     

2912 02        ld      (bc),a
2913 00        nop     
2914 00        nop     
2915 00        nop     
2916 00        nop     
2917 00        nop     
2918 00        nop     
2919 00        nop     
291a f9        ld      sp,hl
291b 02        ld      (bc),a
291c 95        sub     l
291d a2        and     d
291e 227d30    ld      ($307d),hl
2921 eb        ex      de,hl
2922 227f30    ld      ($307f),hl
2925 3e05      ld      a,$05
2927 218130    ld      hl,$3081
292a cd6582    call    $8265
292d c35329    jp      $2953
2930 229730    ld      ($3097),hl
2933 21402b    ld      hl,$2b40
2936 cdcd81    call    $81cd
2939 2a9730    ld      hl,($3097)
293c cd8b7d    call    $7d8b
293f 219930    ld      hl,$3099
2942 cdbe81    call    $81be
2945 219930    ld      hl,$3099
2948 cd837a    call    $7a83
294b 1118fc    ld      de,$fc18
294e 19        add     hl,de
294f 229d30    ld      ($309d),hl
2952 c9        ret     

2953 af        xor     a
2954 2a8930    ld      hl,($3089)
2957 77        ld      (hl),a
2958 2a7f30    ld      hl,($307f)
295b cdcd81    call    $81cd
295e 2a7d30    ld      hl,($307d)
2961 cded7d    call    $7ded
2964 219f30    ld      hl,$309f
2967 cdbe81    call    $81be
296a ca392b    jp      z,$2b39
296d f29029    jp      p,$2990
2970 2a7f30    ld      hl,($307f)
2973 cdcd81    call    $81cd
2976 2a8130    ld      hl,($3081)
2979 cdbe81    call    $81be
297c 2a7d30    ld      hl,($307d)
297f cdcd81    call    $81cd
2982 2a8330    ld      hl,($3083)
2985 cdbe81    call    $81be
2988 3eff      ld      a,$ff
298a 328b30    ld      ($308b),a
298d c3ac29    jp      $29ac
2990 2a7d30    ld      hl,($307d)
2993 cdcd81    call    $81cd
2996 2a8130    ld      hl,($3081)
2999 cdbe81    call    $81be
299c 2a7f30    ld      hl,($307f)
299f cdcd81    call    $81cd
29a2 2a8330    ld      hl,($3083)
29a5 cdbe81    call    $81be
29a8 af        xor     a
29a9 328b30    ld      ($308b),a
29ac 2a8330    ld      hl,($3083)
29af cdcd81    call    $81cd
29b2 2a8130    ld      hl,($3081)
29b5 cded7d    call    $7ded
29b8 21a330    ld      hl,$30a3
29bb cdbe81    call    $81be
29be 21a330    ld      hl,$30a3
29c1 cde17b    call    $7be1
29c4 219f30    ld      hl,$309f
29c7 cdbe81    call    $81be
29ca 219f30    ld      hl,$309f
29cd cd3029    call    $2930
29d0 22a730    ld      ($30a7),hl
29d3 21442b    ld      hl,$2b44
29d6 cdcd81    call    $81cd
29d9 2aa730    ld      hl,($30a7)
29dc cdf07b    call    $7bf0
29df 21a930    ld      hl,$30a9
29e2 cdbe81    call    $81be
29e5 21a330    ld      hl,$30a3
29e8 cdcd81    call    $81cd
29eb 21a930    ld      hl,$30a9
29ee cd007e    call    $7e00
29f1 21a330    ld      hl,$30a3
29f4 cdbe81    call    $81be
29f7 21482b    ld      hl,$2b48
29fa cded7d    call    $7ded
29fd 3d        dec     a
29fe d67f      sub     $7f
2a00 9f        sbc     a,a
2a01 32ad30    ld      ($30ad),a
2a04 b7        or      a
2a05 c22c2a    jp      nz,$2a2c
2a08 21a930    ld      hl,$30a9
2a0b cdcd81    call    $81cd
2a0e 214c2b    ld      hl,$2b4c
2a11 cd007e    call    $7e00
2a14 21a930    ld      hl,$30a9
2a17 cdbe81    call    $81be
2a1a 214c2b    ld      hl,$2b4c
2a1d cdcd81    call    $81cd
2a20 21a330    ld      hl,$30a3
2a23 cdfe7e    call    $7efe
2a26 21a330    ld      hl,$30a3
2a29 cdbe81    call    $81be
2a2c 2a8130    ld      hl,($3081)
2a2f cdcd81    call    $81cd
2a32 21a930    ld      hl,$30a9
2a35 cd007e    call    $7e00
2a38 2a8130    ld      hl,($3081)
2a3b cdbe81    call    $81be
2a3e 2a8330    ld      hl,($3083)
2a41 cdcd81    call    $81cd
2a44 21a930    ld      hl,$30a9
2a47 cd007e    call    $7e00
2a4a 2a8330    ld      hl,($3083)
2a4d cdbe81    call    $81be
2a50 21502b    ld      hl,$2b50
2a53 cded7d    call    $7ded
2a56 3d        dec     a
2a57 d67f      sub     $7f
2a59 9f        sbc     a,a
2a5a 32ad30    ld      ($30ad),a
2a5d 2a8130    ld      hl,($3081)
2a60 cdcd81    call    $81cd
2a63 21502b    ld      hl,$2b50
2a66 cded7d    call    $7ded
2a69 3d        dec     a
2a6a d67f      sub     $7f
2a6c 9f        sbc     a,a
2a6d 21ad30    ld      hl,$30ad
2a70 b6        or      (hl)
2a71 32ae30    ld      ($30ae),a
2a74 b7        or      a
2a75 c2392b    jp      nz,$2b39
2a78 2a8130    ld      hl,($3081)
2a7b cd3029    call    $2930
2a7e 22af30    ld      ($30af),hl
2a81 21542b    ld      hl,$2b54
2a84 cdcd81    call    $81cd
2a87 2a8330    ld      hl,($3083)
2a8a cd8b7d    call    $7d8b
2a8d 219f30    ld      hl,$309f
2a90 cdbe81    call    $81be
2a93 219f30    ld      hl,$309f
2a96 cd3029    call    $2930
2a99 22b130    ld      ($30b1),hl
2a9c eb        ex      de,hl
2a9d 2aaf30    ld      hl,($30af)
2aa0 7b        ld      a,e
2aa1 95        sub     l
2aa2 6f        ld      l,a
2aa3 7a        ld      a,d
2aa4 9c        sbc     a,h
2aa5 67        ld      h,a
2aa6 22b330    ld      ($30b3),hl
2aa9 2ab330    ld      hl,($30b3)
2aac 118b30    ld      de,$308b
2aaf 19        add     hl,de
2ab0 7e        ld      a,(hl)
2ab1 6f        ld      l,a
2ab2 17        rla     
2ab3 9f        sbc     a,a
2ab4 67        ld      h,a
2ab5 eb        ex      de,hl
2ab6 2a8730    ld      hl,($3087)
2ab9 73        ld      (hl),e
2aba 23        inc     hl
2abb 72        ld      (hl),d
2abc 21b330    ld      hl,$30b3
2abf cdc87a    call    $7ac8
2ac2 2a8730    ld      hl,($3087)
2ac5 7e        ld      a,(hl)
2ac6 23        inc     hl
2ac7 66        ld      h,(hl)
2ac8 6f        ld      l,a
2ac9 cdfa7d    call    $7dfa
2acc 2a8530    ld      hl,($3085)
2acf cdbe81    call    $81be
2ad2 21a930    ld      hl,$30a9
2ad5 cdcd81    call    $81cd
2ad8 2a8530    ld      hl,($3085)
2adb cdfe7e    call    $7efe
2ade 2a8530    ld      hl,($3085)
2ae1 cdbe81    call    $81be
2ae4 2aaf30    ld      hl,($30af)
2ae7 cdde7f    call    $7fde
2aea 21a930    ld      hl,$30a9
2aed cdfe7e    call    $7efe
2af0 2a8130    ld      hl,($3081)
2af3 cdbe81    call    $81be
2af6 2ab130    ld      hl,($30b1)
2af9 cdde7f    call    $7fde
2afc 21a930    ld      hl,$30a9
2aff cdfe7e    call    $7efe
2b02 2a8330    ld      hl,($3083)
2b05 cdbe81    call    $81be
2b08 3a8b30    ld      a,($308b)
2b0b 2f        cpl     
2b0c 32ad30    ld      ($30ad),a
2b0f b7        or      a
2b10 ca142b    jp      z,$2b14
2b13 c9        ret     

2b14 2a8130    ld      hl,($3081)
2b17 cdcd81    call    $81cd
2b1a 21b530    ld      hl,$30b5
2b1d cdbe81    call    $81be
2b20 2a8330    ld      hl,($3083)
2b23 cdcd81    call    $81cd
2b26 2a8130    ld      hl,($3081)
2b29 cdbe81    call    $81be
2b2c 21b530    ld      hl,$30b5
2b2f cdcd81    call    $81cd
2b32 2a8330    ld      hl,($3083)
2b35 cdbe81    call    $81be
2b38 c9        ret     

2b39 3eff      ld      a,$ff
2b3b 2a8930    ld      hl,($3089)
2b3e 77        ld      (hl),a
2b3f c9        ret     

2b40 00        nop     
2b41 00        nop     
2b42 7a        ld      a,d
2b43 8a        adc     a,d
2b44 00        nop     
2b45 00        nop     
2b46 2084      jr      nz,$2acc
2b48 00        nop     
2b49 00        nop     
2b4a 2082      jr      nz,$2ace
2b4c 00        nop     
2b4d 00        nop     
2b4e 00        nop     
2b4f 82        add     a,d
2b50 00        nop     
2b51 40        ld      b,b
2b52 1c        inc     e
2b53 8e        adc     a,(hl)
2b54 72        ld      (hl),d
2b55 f9        ld      sp,hl
2b56 7f        ld      a,a
2b57 80        add     a,b
2b58 22ba30    ld      ($30ba),hl
2b5b eb        ex      de,hl
2b5c 22bc30    ld      ($30bc),hl
2b5f 3eff      ld      a,$ff
2b61 32628c    ld      ($8c62),a
2b64 11568c    ld      de,$8c56
2b67 21528c    ld      hl,$8c52
2b6a cded2b    call    $2bed
2b6d 215a8c    ld      hl,$8c5a
2b70 cdcd81    call    $81cd
2b73 2aba30    ld      hl,($30ba)
2b76 cdbe81    call    $81be
2b79 215e8c    ld      hl,$8c5e
2b7c cdcd81    call    $81cd
2b7f 2abc30    ld      hl,($30bc)
2b82 cdbe81    call    $81be
2b85 c9        ret     

2b86 22bf30    ld      ($30bf),hl
2b89 eb        ex      de,hl
2b8a 22c130    ld      ($30c1),hl
2b8d 11c930    ld      de,$30c9
2b90 21c730    ld      hl,$30c7
2b93 cdcd06    call    $06cd
2b96 2ac730    ld      hl,($30c7)
2b99 cdde7f    call    $7fde
2b9c 21138c    ld      hl,$8c13
2b9f cded7d    call    $7ded
2ba2 21178c    ld      hl,$8c17
2ba5 cd007e    call    $7e00
2ba8 21528c    ld      hl,$8c52
2bab cdbe81    call    $81be
2bae 2ac930    ld      hl,($30c9)
2bb1 cdde7f    call    $7fde
2bb4 211b8c    ld      hl,$8c1b
2bb7 cded7d    call    $7ded
2bba 211f8c    ld      hl,$8c1f
2bbd cd007e    call    $7e00
2bc0 21568c    ld      hl,$8c56
2bc3 cdbe81    call    $81be
2bc6 3eff      ld      a,$ff
2bc8 32628c    ld      ($8c62),a
2bcb 11568c    ld      de,$8c56
2bce 21528c    ld      hl,$8c52
2bd1 cded2b    call    $2bed
2bd4 215a8c    ld      hl,$8c5a
2bd7 cdcd81    call    $81cd
2bda 2abf30    ld      hl,($30bf)
2bdd cdbe81    call    $81be
2be0 215e8c    ld      hl,$8c5e
2be3 cdcd81    call    $81cd
2be6 2ac130    ld      hl,($30c1)
2be9 cdbe81    call    $81be
2bec c9        ret     

2bed 22cc30    ld      ($30cc),hl
2bf0 eb        ex      de,hl
2bf1 22ce30    ld      ($30ce),hl
2bf4 3a638c    ld      a,($8c63)
2bf7 c6ff      add     a,$ff
2bf9 9f        sbc     a,a
2bfa 32d030    ld      ($30d0),a
2bfd b7        or      a
2bfe c21a2c    jp      nz,$2c1a
2c01 2acc30    ld      hl,($30cc)
2c04 cdcd81    call    $81cd
2c07 215a8c    ld      hl,$8c5a
2c0a cdbe81    call    $81be
2c0d 2ace30    ld      hl,($30ce)
2c10 cdcd81    call    $81cd
2c13 215e8c    ld      hl,$8c5e
2c16 cdbe81    call    $81be
2c19 c9        ret     

2c1a 3a638c    ld      a,($8c63)
2c1d 3d        dec     a
2c1e c6ff      add     a,$ff
2c20 9f        sbc     a,a
2c21 32d030    ld      ($30d0),a
2c24 b7        or      a
2c25 c2892c    jp      nz,$2c89
2c28 3a628c    ld      a,($8c62)
2c2b 2f        cpl     
2c2c 32d030    ld      ($30d0),a
2c2f b7        or      a
2c30 c2642c    jp      nz,$2c64
2c33 2acc30    ld      hl,($30cc)
2c36 cdcd81    call    $81cd
2c39 21aaa6    ld      hl,$a6aa
2c3c cded7d    call    $7ded
2c3f 21aea6    ld      hl,$a6ae
2c42 cd007e    call    $7e00
2c45 215a8c    ld      hl,$8c5a
2c48 cdbe81    call    $81be
2c4b 2ace30    ld      hl,($30ce)
2c4e cdcd81    call    $81cd
2c51 21b2a6    ld      hl,$a6b2
2c54 cded7d    call    $7ded
2c57 21b6a6    ld      hl,$a6b6
2c5a cd007e    call    $7e00
2c5d 215e8c    ld      hl,$8c5e
2c60 cdbe81    call    $81be
2c63 c9        ret     

2c64 2acc30    ld      hl,($30cc)
2c67 cdcd81    call    $81cd
2c6a 21aea6    ld      hl,$a6ae
2c6d cd007e    call    $7e00
2c70 215a8c    ld      hl,$8c5a
2c73 cdbe81    call    $81be
2c76 2ace30    ld      hl,($30ce)
2c79 cdcd81    call    $81cd
2c7c 21b6a6    ld      hl,$a6b6
2c7f cd007e    call    $7e00
2c82 215e8c    ld      hl,$8c5e
2c85 cdbe81    call    $81be
2c88 c9        ret     

2c89 3a638c    ld      a,($8c63)
2c8c d602      sub     $02
2c8e c6ff      add     a,$ff
2c90 9f        sbc     a,a
2c91 32d030    ld      ($30d0),a
2c94 b7        or      a
2c95 c2f92c    jp      nz,$2cf9
2c98 3a628c    ld      a,($8c62)
2c9b 2f        cpl     
2c9c 32d030    ld      ($30d0),a
2c9f b7        or      a
2ca0 c2d42c    jp      nz,$2cd4
2ca3 2acc30    ld      hl,($30cc)
2ca6 cdcd81    call    $81cd
2ca9 218aa6    ld      hl,$a68a
2cac cded7d    call    $7ded
2caf 218ea6    ld      hl,$a68e
2cb2 cd007e    call    $7e00
2cb5 215a8c    ld      hl,$8c5a
2cb8 cdbe81    call    $81be
2cbb 2ace30    ld      hl,($30ce)
2cbe cdcd81    call    $81cd
2cc1 2192a6    ld      hl,$a692
2cc4 cded7d    call    $7ded
2cc7 2196a6    ld      hl,$a696
2cca cd007e    call    $7e00
2ccd 215e8c    ld      hl,$8c5e
2cd0 cdbe81    call    $81be
2cd3 c9        ret     

2cd4 2acc30    ld      hl,($30cc)
2cd7 cdcd81    call    $81cd
2cda 218ea6    ld      hl,$a68e
2cdd cd007e    call    $7e00
2ce0 215a8c    ld      hl,$8c5a
2ce3 cdbe81    call    $81be
2ce6 2ace30    ld      hl,($30ce)
2ce9 cdcd81    call    $81cd
2cec 2196a6    ld      hl,$a696
2cef cd007e    call    $7e00
2cf2 215e8c    ld      hl,$8c5e
2cf5 cdbe81    call    $81be
2cf8 c9        ret     

2cf9 c9        ret     

2cfa af        xor     a
2cfb 324e8c    ld      ($8c4e),a
2cfe 11568c    ld      de,$8c56
2d01 21528c    ld      hl,$8c52
2d04 cd6d6f    call    $6f6d
2d07 c9        ret     

2d08 22d430    ld      ($30d4),hl
2d0b 2ad430    ld      hl,($30d4)
2d0e 7e        ld      a,(hl)
2d0f 32a58b    ld      ($8ba5),a
2d12 21a68b    ld      hl,$8ba6
2d15 96        sub     (hl)
2d16 3d        dec     a
2d17 d67f      sub     $7f
2d19 9f        sbc     a,a
2d1a 32d630    ld      ($30d6),a
2d1d b7        or      a
2d1e ca272d    jp      z,$2d27
2d21 3aa68b    ld      a,($8ba6)
2d24 32a58b    ld      ($8ba5),a
2d27 c9        ret     

2d28 22d830    ld      ($30d8),hl
2d2b 11772d    ld      de,$2d77
2d2e 2ad830    ld      hl,($30d8)
2d31 cd092e    call    $2e09
2d34 21da30    ld      hl,$30da
2d37 cdbe81    call    $81be
2d3a 17        rla     
2d3b 9f        sbc     a,a
2d3c 32de30    ld      ($30de),a
2d3f b7        or      a
2d40 ca552d    jp      z,$2d55
2d43 21772d    ld      hl,$2d77
2d46 cdcd81    call    $81cd
2d49 21da30    ld      hl,$30da
2d4c cd8b7d    call    $7d8b
2d4f 21da30    ld      hl,$30da
2d52 cdbe81    call    $81be
2d55 217b2d    ld      hl,$2d7b
2d58 cdcd81    call    $81cd
2d5b 21da30    ld      hl,$30da
2d5e cdfe7e    call    $7efe
2d61 cd807a    call    $7a80
2d64 22df30    ld      ($30df),hl
2d67 21df30    ld      hl,$30df
2d6a cdee06    call    $06ee
2d6d 21da30    ld      hl,$30da
2d70 cd7f2d    call    $2d7f
2d73 cd976c    call    $6c97
2d76 c9        ret     

2d77 00        nop     
2d78 00        nop     
2d79 34        inc     (hl)
2d7a 89        adc     a,c
2d7b 6a        ld      l,d
2d7c 0b        dec     bc
2d7d 3687      ld      (hl),$87
2d7f 22e230    ld      ($30e2),hl
2d82 21e830    ld      hl,$30e8
2d85 cdf106    call    $06f1
2d88 2ae830    ld      hl,($30e8)
2d8b cdde7f    call    $7fde
2d8e 21e02d    ld      hl,$2de0
2d91 cd007e    call    $7e00
2d94 21ea30    ld      hl,$30ea
2d97 cdbe81    call    $81be
2d9a 21ea30    ld      hl,$30ea
2d9d cd837a    call    $7a83
2da0 22ee30    ld      ($30ee),hl
2da3 21ee30    ld      hl,$30ee
2da6 cdc87a    call    $7ac8
2da9 2176a6    ld      hl,$a676
2dac cdbe81    call    $81be
2daf 2ae230    ld      hl,($30e2)
2db2 cdbe81    call    $81be
2db5 2176a6    ld      hl,$a676
2db8 cdcd81    call    $81cd
2dbb 21e430    ld      hl,$30e4
2dbe cd007e    call    $7e00
2dc1 21f030    ld      hl,$30f0
2dc4 cdbe81    call    $81be
2dc7 21f030    ld      hl,$30f0
2dca cddb7a    call    $7adb
2dcd 217aa6    ld      hl,$a67a
2dd0 cdbe81    call    $81be
2dd3 21f030    ld      hl,$30f0
2dd6 cdcf7a    call    $7acf
2dd9 217ea6    ld      hl,$a67e
2ddc cdbe81    call    $81be
2ddf c9        ret     

2de0 5d        ld      e,l
2de1 0b        dec     bc
2de2 3687      ld      (hl),$87
2de4 22fd30    ld      ($30fd),hl
2de7 2afd30    ld      hl,($30fd)
2dea 7e        ld      a,(hl)
2deb 23        inc     hl
2dec 66        ld      h,(hl)
2ded 6f        ld      l,a
2dee 7d        ld      a,l
2def 07        rlca    
2df0 b5        or      l
2df1 e67f      and     $7f
2df3 b4        or      h
2df4 d601      sub     $01
2df6 9f        sbc     a,a
2df7 32f530    ld      ($30f5),a
2dfa c9        ret     

2dfb cd7782    call    $8277
2dfe 3e80      ld      a,$80
2e00 cd6d7a    call    $7a6d
2e03 eb        ex      de,hl
2e04 cd5880    call    $8058
2e07 eb        ex      de,hl
2e08 c9        ret     

2e09 cd682e    call    $2e68
2e0c cafd81    jp      z,$81fd
2e0f cdad80    call    $80ad
2e12 c5        push    bc
2e13 d5        push    de
2e14 cd067e    call    $7e06
2e17 f5        push    af
2e18 fc867c    call    m,$7c86
2e1b cd767f    call    $7f76
2e1e f1        pop     af
2e1f fc867c    call    m,$7c86
2e22 d1        pop     de
2e23 c1        pop     bc
2e24 cd047f    call    $7f04
2e27 c1        pop     bc
2e28 d1        pop     de
2e29 cd7480    call    $8074
2e2c c3f07d    jp      $7df0
2e2f cd7782    call    $8277
2e32 3e80      ld      a,$80
2e34 cd3e2e    call    $2e3e
2e37 c3867c    jp      $7c86
2e3a cd7782    call    $8277
2e3d af        xor     a
2e3e 32e88a    ld      ($8ae8),a
2e41 cd562e    call    $2e56
2e44 cdd681    call    $81d6
2e47 cd562e    call    $2e56
2e4a dafd81    jp      c,$81fd
2e4d cdb07f    call    $7fb0
2e50 dcd681    call    c,$81d6
2e53 c3472e    jp      $2e47
2e56 cd8b82    call    $828b
2e59 d8        ret     c

2e5a cdee81    call    $81ee
2e5d c8        ret     z

2e5e 3ae88a    ld      a,($8ae8)
2e61 b7        or      a
2e62 c8        ret     z

2e63 3e80      ld      a,$80
2e65 a9        xor     c
2e66 4f        ld      c,a
2e67 c9        ret     

2e68 d5        push    de
2e69 cdcd81    call    $81cd
2e6c e1        pop     hl
2e6d c3ee81    jp      $81ee
2e70 00        nop     
2e71 00        nop     
2e72 00        nop     
2e73 00        nop     
2e74 00        nop     
2e75 00        nop     
2e76 00        nop     
2e77 00        nop     
2e78 00        nop     
2e79 00        nop     
2e7a 00        nop     
2e7b 00        nop     
2e7c 00        nop     
2e7d 00        nop     
2e7e 6d        ld      l,l
2e7f b9        cp      c
2e80 91        sub     c
2e81 b9        cp      c
2e82 00        nop     
2e83 00        nop     
2e84 00        nop     
2e85 00        nop     
2e86 00        nop     
2e87 00        nop     
2e88 00        nop     
2e89 42        ld      b,d
2e8a 5c        ld      e,h
2e8b 207e      jr      nz,$2f0b
2e8d d28438    jp      nc,$3884
2e90 7a        ld      a,d
2e91 02        ld      (bc),a
2e92 00        nop     
2e93 02        ld      (bc),a
2e94 00        nop     
2e95 ff        rst     $38
2e96 8f        adc     a,a
2e97 c2757b    jp      nz,$7b75
2e9a d28438    jp      nc,$3884
2e9d 7b        ld      a,e
2e9e 00        nop     
2e9f 00        nop     
2ea0 00        nop     
2ea1 00        nop     
2ea2 00        nop     
2ea3 00        nop     
2ea4 00        nop     
2ea5 00        nop     
2ea6 00        nop     
2ea7 00        nop     
2ea8 00        nop     
2ea9 00        nop     
2eaa 00        nop     
2eab 00        nop     
2eac 00        nop     
2ead 00        nop     
2eae 00        nop     
2eaf 00        nop     
2eb0 00        nop     
2eb1 00        nop     
2eb2 00        nop     
2eb3 00        nop     
2eb4 00        nop     
2eb5 00        nop     
2eb6 00        nop     
2eb7 00        nop     
2eb8 00        nop     
2eb9 00        nop     
2eba 00        nop     
2ebb 00        nop     
2ebc 00        nop     
2ebd 00        nop     
2ebe 00        nop     
2ebf 00        nop     
2ec0 00        nop     
2ec1 00        nop     
2ec2 80        add     a,b
2ec3 00        nop     
2ec4 00        nop     
2ec5 00        nop     
2ec6 00        nop     
2ec7 00        nop     
2ec8 00        nop     
2ec9 00        nop     
2eca 00        nop     
2ecb 00        nop     
2ecc 00        nop     
2ecd 00        nop     
2ece 00        nop     
2ecf 00        nop     
2ed0 00        nop     
2ed1 00        nop     
2ed2 00        nop     
2ed3 00        nop     
2ed4 00        nop     
2ed5 00        nop     
2ed6 00        nop     
2ed7 00        nop     
2ed8 00        nop     
2ed9 00        nop     
2eda 00        nop     
2edb 00        nop     
2edc c7        rst     $00
2edd 2ed8      ld      l,$d8
2edf 2ea7      ld      l,$a7
2ee1 8e        adc     a,(hl)
2ee2 00        nop     
2ee3 00        nop     
2ee4 00        nop     
2ee5 00        nop     
2ee6 00        nop     
2ee7 00        nop     
2ee8 00        nop     
2ee9 00        nop     
2eea 00        nop     
2eeb 00        nop     
2eec 00        nop     
2eed 00        nop     
2eee 00        nop     
2eef 00        nop     
2ef0 00        nop     
2ef1 00        nop     
2ef2 00        nop     
2ef3 00        nop     
2ef4 00        nop     
2ef5 00        nop     
2ef6 00        nop     
2ef7 00        nop     
2ef8 00        nop     
2ef9 00        nop     
2efa 00        nop     
2efb 00        nop     
2efc 00        nop     
2efd 00        nop     
2efe 00        nop     
2eff 00        nop     
2f00 00        nop     
2f01 00        nop     
2f02 00        nop     
2f03 00        nop     
2f04 00        nop     
2f05 00        nop     
2f06 00        nop     
2f07 00        nop     
2f08 00        nop     
2f09 00        nop     
2f0a 00        nop     
2f0b fb        ei      
2f0c 2ef8      ld      l,$f8
2f0e 2e00      ld      l,$00
2f10 00        nop     
2f11 00        nop     
2f12 00        nop     
2f13 00        nop     
2f14 f9        ld      sp,hl
2f15 2efb      ld      l,$fb
2f17 2e00      ld      l,$00
2f19 00        nop     
2f1a 00        nop     
2f1b 00        nop     
2f1c 00        nop     
2f1d 00        nop     
2f1e 00        nop     
2f1f 00        nop     
2f20 00        nop     
2f21 00        nop     
2f22 00        nop     
2f23 00        nop     
2f24 00        nop     
2f25 00        nop     
2f26 00        nop     
2f27 00        nop     
2f28 00        nop     
2f29 00        nop     
2f2a 00        nop     
2f2b 00        nop     
2f2c 00        nop     
2f2d 00        nop     
2f2e 8f        adc     a,a
2f2f b8        cp      b
2f30 00        nop     
2f31 00        nop     
2f32 00        nop     
2f33 00        nop     
2f34 00        nop     
2f35 00        nop     
2f36 00        nop     
2f37 00        nop     
2f38 00        nop     
2f39 00        nop     
2f3a 00        nop     
2f3b 00        nop     
2f3c 00        nop     
2f3d 00        nop     
2f3e 00        nop     
2f3f 00        nop     
2f40 00        nop     
2f41 00        nop     
2f42 00        nop     
2f43 00        nop     
2f44 00        nop     
2f45 73        ld      (hl),e
2f46 90        sub     b
2f47 d0        ret     nc

2f48 fd09      add     iy,bc
2f4a 80        add     a,b
2f4b f0        ret     p

2f4c 6b        ld      l,e
2f4d 00        nop     
2f4e 7e        ld      a,(hl)
2f4f 42        ld      b,d
2f50 3a6a7f    ld      a,($7f6a)
2f53 73        ld      (hl),e
2f54 04        inc     b
2f55 47        ld      b,a
2f56 7d        ld      a,l
2f57 00        nop     
2f58 ff        rst     $38
2f59 3000      jr      nc,$2f5b
2f5b 010303    ld      bc,$0303
2f5e 05        dec     b
2f5f 00        nop     
2f60 00        nop     
2f61 00        nop     
2f62 00        nop     
2f63 00        nop     
2f64 00        nop     
2f65 00        nop     
2f66 00        nop     
2f67 00        nop     
2f68 00        nop     
2f69 00        nop     
2f6a 00        nop     
2f6b 00        nop     
2f6c 00        nop     
2f6d 00        nop     
2f6e 00        nop     
2f6f 00        nop     
2f70 00        nop     
2f71 00        nop     
2f72 80        add     a,b
2f73 00        nop     
2f74 00        nop     
2f75 00        nop     
2f76 00        nop     
2f77 00        nop     
2f78 00        nop     
2f79 00        nop     
2f7a 00        nop     
2f7b 00        nop     
2f7c 00        nop     
2f7d 00        nop     
2f7e 00        nop     
2f7f 00        nop     
2f80 00        nop     
2f81 00        nop     
2f82 00        nop     
2f83 00        nop     
2f84 00        nop     
2f85 00        nop     
2f86 00        nop     
2f87 00        nop     
2f88 00        nop     
2f89 00        nop     
2f8a 86        add     a,(hl)
2f8b 2f        cpl     
2f8c 7f        ld      a,a
2f8d 2f        cpl     
2f8e 00        nop     
2f8f 00        nop     
2f90 00        nop     
2f91 00        nop     
2f92 77        ld      (hl),a
2f93 2f        cpl     
2f94 8e        adc     a,(hl)
2f95 2f        cpl     
2f96 00        nop     
2f97 00        nop     
2f98 00        nop     
2f99 00        nop     
2f9a 00        nop     
2f9b 00        nop     
2f9c 00        nop     
2f9d 00        nop     
2f9e 00        nop     
2f9f 00        nop     
2fa0 00        nop     
2fa1 00        nop     
2fa2 00        nop     
2fa3 00        nop     
2fa4 00        nop     
2fa5 00        nop     
2fa6 00        nop     
2fa7 00        nop     
2fa8 00        nop     
2fa9 00        nop     
2faa 00        nop     
2fab 00        nop     
2fac 00        nop     
2fad 00        nop     
2fae 00        nop     
2faf 00        nop     
2fb0 00        nop     
2fb1 00        nop     
2fb2 00        nop     
2fb3 00        nop     
2fb4 00        nop     
2fb5 00        nop     
2fb6 00        nop     
2fb7 00        nop     
2fb8 00        nop     
2fb9 00        nop     
2fba 00        nop     
2fbb 00        nop     
2fbc 00        nop     
2fbd 00        nop     
2fbe 00        nop     
2fbf 00        nop     
2fc0 00        nop     
2fc1 00        nop     
2fc2 00        nop     
2fc3 00        nop     
2fc4 00        nop     
2fc5 00        nop     
2fc6 00        nop     
2fc7 00        nop     
2fc8 00        nop     
2fc9 00        nop     
2fca 00        nop     
2fcb 00        nop     
2fcc 00        nop     
2fcd 00        nop     
2fce ca2fc6    jp      z,$c62f
2fd1 2f        cpl     
2fd2 00        nop     
2fd3 00        nop     
2fd4 00        nop     
2fd5 00        nop     
2fd6 00        nop     
2fd7 00        nop     
2fd8 00        nop     
2fd9 00        nop     
2fda 00        nop     
2fdb 00        nop     
2fdc 00        nop     
2fdd c6b3      add     a,$b3
2fdf 36b9      ld      (hl),$b9
2fe1 40        ld      b,b
2fe2 8e        adc     a,(hl)
2fe3 3c        inc     a
2fe4 8e        adc     a,(hl)
2fe5 46        ld      b,(hl)
2fe6 8e        adc     a,(hl)
2fe7 cf        rst     $08
2fe8 b9        cp      c
2fe9 c6b3      add     a,$b3
2feb 00        nop     
2fec 00        nop     
2fed 00        nop     
2fee 00        nop     
2fef 00        nop     
2ff0 00        nop     
2ff1 00        nop     
2ff2 00        nop     
2ff3 80        add     a,b
2ff4 04        inc     b
2ff5 00        nop     
2ff6 03        inc     bc
2ff7 dd1f      rra     
2ff9 7d        ld      a,l
2ffa 6a        ld      l,d
2ffb 6c        ld      l,h
2ffc 09        add     hl,bc
2ffd 7f        ld      a,a
2ffe bd        cp      l
2fff 5f        ld      e,a
3000 73        ld      (hl),e
3001 7a        ld      a,d
3002 00        nop     
3003 00        nop     
3004 00        nop     
3005 00        nop     
3006 00        nop     
3007 00        nop     
3008 00        nop     
3009 00        nop     
300a 29        add     hl,hl
300b ad        xor     l
300c 98        sbc     a,b
300d 7e        ld      a,(hl)
300e 00        nop     
300f 00        nop     
3010 00        nop     
3011 00        nop     
3012 00        nop     
3013 29        add     hl,hl
3014 ad        xor     l
3015 98        sbc     a,b
3016 7d        ld      a,l
3017 03        inc     bc
3018 dd1f      rra     
301a 7d        ld      a,l
301b 40        ld      b,b
301c 82        add     a,d
301d 46        ld      b,(hl)
301e 7e        ld      a,(hl)
301f 00        nop     
3020 c6b3      add     a,$b3
3022 36b9      ld      (hl),$b9
3024 3c        inc     a
3025 8e        adc     a,(hl)
3026 40        ld      b,b
3027 8e        adc     a,(hl)
3028 46        ld      b,(hl)
3029 8e        adc     a,(hl)
302a 6d        ld      l,l
302b b9        cp      c
302c 108e      djnz    $2fbc
302e f1        pop     af
302f a5        and     l
3030 00        nop     
3031 00        nop     
3032 00        nop     
3033 00        nop     
3034 00        nop     
3035 00        nop     
3036 00        nop     
3037 00        nop     
3038 80        add     a,b
3039 03        inc     bc
303a dd1f      rra     
303c 7d        ld      a,l
303d 47        ld      b,a
303e 224c7e    ld      ($7e4c),hl
3041 00        nop     
3042 00        nop     
3043 00        nop     
3044 7f        ld      a,a
3045 e1        pop     hl
3046 de25      sbc     a,$25
3048 80        add     a,b
3049 05        dec     b
304a 00        nop     
304b 00        nop     
304c 00        nop     
304d 00        nop     
304e 81        add     a,c
304f 00        nop     
3050 00        nop     
3051 00        nop     
3052 81        add     a,c
3053 8a        adc     a,d
3054 ca627d    jp      z,$7d62
3057 0a        ld      a,(bc)
3058 d7        rst     $10
3059 a3        and     e
305a 7a        ld      a,d
305b 17        rla     
305c a6        and     (hl)
305d 2b        dec     hl
305e 7d        ld      a,l
305f 00        nop     
3060 00        nop     
3061 00        nop     
3062 40        ld      b,b
3063 83        add     a,e
3064 28c7      jr      z,$302d
3066 40        ld      b,b
3067 80        add     a,b
3068 03        inc     bc
3069 dd1f      rra     
306b 7d        ld      a,l
306c 0600      ld      b,$00
306e 188e      jr      $2ffe
3070 cefc      adc     a,$fc
3072 2280bb    ld      ($bb80),hl
3075 1a        ld      a,(de)
3076 2080      jr      nz,$2ff8
3078 1c        inc     e
3079 ce29      adc     a,$29
307b 7c        ld      a,h
307c 00        nop     
307d c1        pop     bc
307e 8e        adc     a,(hl)
307f bd        cp      l
3080 8e        adc     a,(hl)
3081 c1        pop     bc
3082 8e        adc     a,(hl)
3083 bd        cp      l
3084 8e        adc     a,(hl)
3085 c5        push    bc
3086 b8        cp      b
3087 44        ld      b,h
3088 8e        adc     a,(hl)
3089 ab        xor     e
308a b8        cp      b
308b 00        nop     
308c 0a        ld      a,(bc)
308d 0a        ld      a,(bc)
308e 0a        ld      a,(bc)
308f 08        ex      af,af'
3090 0a        ld      a,(bc)
3091 0c        inc     c
3092 07        rlca    
3093 08        ex      af,af'
3094 09        add     hl,bc
3095 0a        ld      a,(bc)
3096 0b        dec     bc
3097 9f        sbc     a,a
3098 3030      jr      nc,$30ca
309a f67a      or      $7a
309c 8a        adc     a,d
309d 03        inc     bc
309e 00        nop     
309f 56        ld      d,(hl)
30a0 3076      jr      nc,$3118
30a2 82        add     a,d
30a3 f9        ld      sp,hl
30a4 313682    ld      sp,$8236
30a7 04        inc     b
30a8 00        nop     
30a9 00        nop     
30aa 40        ld      b,b
30ab 1c        inc     e
30ac 8d        adc     a,l
30ad ff        rst     $38
30ae 00        nop     
30af 00        nop     
30b0 00        nop     
30b1 03        inc     bc
30b2 00        nop     
30b3 03        inc     bc
30b4 00        nop     
30b5 00        nop     
30b6 00        nop     
30b7 00        nop     
30b8 00        nop     
30b9 00        nop     
30ba f62f      or      $2f
30bc fa2f00    jp      m,$002f
30bf 00        nop     
30c0 00        nop     
30c1 00        nop     
30c2 00        nop     
30c3 00        nop     
30c4 00        nop     
30c5 00        nop     
30c6 80        add     a,b
30c7 00        nop     
30c8 00        nop     
30c9 00        nop     
30ca 00        nop     
30cb 00        nop     
30cc 52        ld      d,d
30cd 8c        adc     a,h
30ce 56        ld      d,(hl)
30cf 8c        adc     a,h
30d0 00        nop     
30d1 00        nop     
30d2 00        nop     
30d3 00        nop     
30d4 00        nop     
30d5 00        nop     
30d6 00        nop     
30d7 00        nop     
30d8 313000    ld      sp,$0030
30db 00        nop     
30dc 00        nop     
30dd 00        nop     
30de 00        nop     
30df 00        nop     
30e0 00        nop     
30e1 00        nop     
30e2 da30e6    jp      c,$e630
30e5 2e65      ld      l,$65
30e7 86        add     a,(hl)
30e8 00        nop     
30e9 00        nop     
30ea 00        nop     
30eb 00        nop     
30ec 00        nop     
30ed 00        nop     
30ee 00        nop     
30ef 00        nop     
30f0 00        nop     
30f1 00        nop     
30f2 00        nop     
30f3 00        nop     
30f4 00        nop     
30f5 00        nop     
30f6 00        nop     
30f7 00        nop     
30f8 00        nop     
30f9 00        nop     
30fa 00        nop     
30fb 00        nop     
30fc 00        nop     
30fd 00        nop     
30fe 00        nop     
30ff 46        ld      b,(hl)
3100 52        ld      d,d
3101 49        ld      c,c
3102 00        nop     
3103 53        ld      d,e
3104 41        ld      b,c
3105 54        ld      d,h
3106 00        nop     
3107 0c        inc     c
3108 00        nop     
3109 04        inc     b
310a 4a        ld      c,d
310b 41        ld      b,c
310c 4e        ld      c,(hl)
310d 00        nop     
310e 46        ld      b,(hl)
310f 45        ld      b,l
3110 42        ld      b,d
3111 00        nop     
3112 4d        ld      c,l
3113 41        ld      b,c
3114 00        nop     
3115 00        nop     
3116 00        nop     
3117 65        ld      h,l
3118 65        ld      h,l
3119 70        ld      (hl),b
311a 210000    ld      hl,$0000
311d 00        nop     
311e 00        nop     
311f 00        nop     
3120 00        nop     
3121 00        nop     
3122 00        nop     
3123 4f        ld      c,a
3124 4b        ld      c,e
3125 210000    ld      hl,$0000
3128 ec9a00    call    pe,$009a
312b 00        nop     
312c ca8502    jp      z,$0285
312f 00        nop     
3130 00        nop     
3131 ff        rst     $38
3132 00        nop     
3133 00        nop     
3134 41        ld      b,c
3135 44        ld      b,h
3136 52        ld      d,d
3137 55        ld      d,l
3138 4e        ld      c,(hl)
3139 50        ld      d,b
313a 2049      jr      nz,$3185
313c 2100b5    ld      hl,$b500
313f 85        add     a,l
3140 82        add     a,d
3141 310400    ld      sp,$0004
3144 c698      add     a,$98
3146 00        nop     
3147 66        ld      h,(hl)
3148 9b        sbc     a,e
3149 82        add     a,d
314a 310400    ld      sp,$0004
314d 09        add     hl,bc
314e 00        nop     
314f 08        ex      af,af'
3150 00        nop     
3151 c9        ret     

3152 98        sbc     a,b
3153 69        ld      l,c
3154 9b        sbc     a,e
3155 00        nop     
3156 00        nop     
3157 04        inc     b
3158 00        nop     
3159 010000    ld      bc,$0000
315c 00        nop     
315d 04        inc     b
315e 00        nop     
315f 04        inc     b
3160 00        nop     
3161 ff        rst     $38
3162 00        nop     
3163 00        nop     
3164 00        nop     
3165 ff        rst     $38
3166 ff        rst     $38
3167 02        ld      (bc),a
3168 00        nop     
3169 19        add     hl,de
316a 9b        sbc     a,e
316b 010043    ld      bc,$4300
316e 9b        sbc     a,e
316f 04        inc     b
3170 00        nop     
3171 de9a      sbc     a,$9a
3173 02        ld      (bc),a
3174 00        nop     
3175 e69a      and     $9a
3177 00        nop     
3178 b5        or      l
3179 85        add     a,l
317a ca85d9    jp      z,$d985
317d 40        ld      b,b
317e 14        inc     d
317f 1f        rra     
3180 04        inc     b
3181 00        nop     
3182 04        inc     b
3183 00        nop     
3184 00        nop     
3185 00        nop     
3186 00        nop     
3187 ff        rst     $38
3188 b5        or      l
3189 85        add     a,l
318a 00        nop     
318b b5        or      l
318c 85        add     a,l
318d ca85d9    jp      z,$d985
3190 40        ld      b,b
3191 d9        exx     
3192 40        ld      b,b
3193 14        inc     d
3194 1f        rra     
3195 00        nop     
3196 66        ld      h,(hl)
3197 9b        sbc     a,e
3198 ae        xor     (hl)
3199 31801f    ld      sp,$1f80
319c 80        add     a,b
319d 1f        rra     
319e 361f      ld      (hl),$1f
31a0 00        nop     
31a1 00        nop     
31a2 00        nop     
31a3 00        nop     
31a4 00        nop     
31a5 00        nop     
31a6 00        nop     
31a7 00        nop     
31a8 00        nop     
31a9 00        nop     
31aa 00        nop     
31ab 00        nop     
31ac 00        nop     
31ad 00        nop     
31ae 04        inc     b
31af 02        ld      (bc),a
31b0 00        nop     
31b1 00        nop     
31b2 00        nop     
31b3 00        nop     
31b4 00        nop     
31b5 00        nop     
31b6 00        nop     
31b7 00        nop     
31b8 00        nop     
31b9 00        nop     
31ba 00        nop     
31bb 00        nop     
31bc 00        nop     
31bd 00        nop     
31be 00        nop     
31bf 00        nop     
31c0 00        nop     
31c1 00        nop     
31c2 00        nop     
31c3 00        nop     
31c4 00        nop     
31c5 00        nop     
31c6 00        nop     
31c7 00        nop     
31c8 00        nop     
31c9 00        nop     
31ca 00        nop     
31cb 00        nop     
31cc 00        nop     
31cd 00        nop     
31ce 00        nop     
31cf 00        nop     
31d0 00        nop     
31d1 00        nop     
31d2 00        nop     
31d3 00        nop     
31d4 00        nop     
31d5 00        nop     
31d6 00        nop     
31d7 00        nop     
31d8 00        nop     
31d9 00        nop     
31da 00        nop     
31db 00        nop     
31dc 00        nop     
31dd 00        nop     
31de 00        nop     
31df 00        nop     
31e0 00        nop     
31e1 00        nop     
31e2 00        nop     
31e3 00        nop     
31e4 00        nop     
31e5 00        nop     
31e6 00        nop     
31e7 00        nop     
31e8 00        nop     
31e9 00        nop     
31ea 00        nop     
31eb 00        nop     
31ec 00        nop     
31ed 00        nop     
31ee 00        nop     
31ef 00        nop     
31f0 00        nop     
31f1 00        nop     
31f2 00        nop     
31f3 00        nop     
31f4 00        nop     
31f5 00        nop     
31f6 00        nop     
31f7 00        nop     
31f8 2f        cpl     
31f9 84        add     a,h
31fa 2e84      ld      l,$84
31fc 14        inc     d
31fd 3a9bff    ld      a,($ff9b)
3200 00        nop     
3201 00        nop     
3202 00        nop     
3203 00        nop     
3204 00        nop     
3205 00        nop     
3206 00        nop     
3207 00        nop     
3208 00        nop     
3209 00        nop     
320a 00        nop     
320b 00        nop     
320c 00        nop     
320d 00        nop     
320e 00        nop     
320f 00        nop     
3210 00        nop     
3211 00        nop     
3212 00        nop     
3213 00        nop     
3214 00        nop     
3215 00        nop     
3216 00        nop     
3217 00        nop     
3218 00        nop     
3219 00        nop     
321a 00        nop     
321b 00        nop     
321c 00        nop     
321d 00        nop     
321e 00        nop     
321f 00        nop     
3220 00        nop     
3221 00        nop     
3222 00        nop     
3223 00        nop     
3224 00        nop     
3225 00        nop     
3226 00        nop     
3227 00        nop     
3228 00        nop     
3229 00        nop     
322a 00        nop     
322b 00        nop     
322c 00        nop     
322d 00        nop     
322e 00        nop     
322f 00        nop     
3230 00        nop     
3231 00        nop     
3232 00        nop     
3233 00        nop     
3234 00        nop     
3235 00        nop     
3236 00        nop     
3237 00        nop     
3238 00        nop     
3239 00        nop     
323a 00        nop     
323b 00        nop     
323c 00        nop     
323d 00        nop     
323e 00        nop     
323f 00        nop     
3240 49        ld      c,c
3241 6e        ld      l,(hl)
3242 69        ld      l,c
3243 74        ld      (hl),h
3244 69        ld      l,c
3245 61        ld      h,c
3246 6c        ld      l,h
3247 69        ld      l,c
3248 73        ld      (hl),e
3249 65        ld      h,l
324a 64        ld      h,h
324b 21556e    ld      hl,$6e55
324e 6b        ld      l,e
324f 6e        ld      l,(hl)
3250 6f        ld      l,a
3251 77        ld      (hl),a
3252 6e        ld      l,(hl)
3253 2063      jr      nz,$32b8
3255 6f        ld      l,a
3256 6d        ld      l,l
3257 6d        ld      l,l
3258 61        ld      h,c
3259 6e        ld      l,(hl)
325a 64        ld      h,h
325b 210000    ld      hl,$0000
325e 00        nop     
325f 00        nop     
3260 00        nop     
3261 00        nop     
3262 00        nop     
3263 00        nop     
3264 00        nop     
3265 00        nop     
3266 00        nop     
3267 00        nop     
3268 00        nop     
3269 00        nop     
326a 00        nop     
326b 00        nop     
326c 00        nop     
326d 00        nop     
326e 00        nop     
326f 00        nop     
3270 00        nop     
3271 00        nop     
3272 00        nop     
3273 00        nop     
3274 00        nop     
3275 00        nop     
3276 00        nop     
3277 00        nop     
3278 00        nop     
3279 00        nop     
327a 00        nop     
327b 00        nop     
327c 00        nop     
327d 00        nop     
327e 00        nop     
327f 00        nop     
3280 00        nop     
3281 00        nop     
3282 00        nop     
3283 00        nop     
3284 00        nop     
3285 00        nop     
3286 00        nop     
3287 00        nop     
3288 00        nop     
3289 00        nop     
328a 00        nop     
328b 00        nop     
328c 00        nop     
328d 00        nop     
328e 00        nop     
328f 00        nop     
3290 00        nop     
3291 00        nop     
3292 00        nop     
3293 00        nop     
3294 00        nop     
3295 49        ld      c,c
3296 6c        ld      l,h
3297 6c        ld      l,h
3298 65        ld      h,l
3299 67        ld      h,a
329a 61        ld      h,c
329b 6c        ld      l,h
329c 2077      jr      nz,$3315
329e 6f        ld      l,a
329f 72        ld      (hl),d
32a0 6b        ld      l,e
32a1 73        ld      (hl),e
32a2 70        ld      (hl),b
32a3 61        ld      h,c
32a4 63        ld      h,e
32a5 65        ld      h,l
32a6 206e      jr      nz,$3316
32a8 75        ld      (hl),l
32a9 6d        ld      l,l
32aa 62        ld      h,d
32ab 65        ld      h,l
32ac 72        ld      (hl),d
32ad 210000    ld      hl,$0000
32b0 00        nop     
32b1 00        nop     
32b2 00        nop     
32b3 00        nop     
32b4 00        nop     
32b5 00        nop     
32b6 00        nop     
32b7 00        nop     
32b8 00        nop     
32b9 00        nop     
32ba 00        nop     
32bb 00        nop     
32bc 00        nop     
32bd 00        nop     
32be 00        nop     
32bf 00        nop     
32c0 00        nop     
32c1 00        nop     
32c2 00        nop     
32c3 00        nop     
32c4 00        nop     
32c5 00        nop     
32c6 00        nop     
32c7 00        nop     
32c8 00        nop     
32c9 00        nop     
32ca 00        nop     
32cb 00        nop     
32cc 00        nop     
32cd 00        nop     
32ce 00        nop     
32cf 00        nop     
32d0 00        nop     
32d1 00        nop     
32d2 00        nop     
32d3 00        nop     
32d4 00        nop     
32d5 00        nop     
32d6 00        nop     
32d7 00        nop     
32d8 00        nop     
32d9 00        nop     
32da 00        nop     
32db 00        nop     
32dc 00        nop     
32dd 00        nop     
32de 00        nop     
32df 00        nop     
32e0 00        nop     
32e1 00        nop     
32e2 00        nop     
32e3 00        nop     
32e4 00        nop     
32e5 00        nop     
32e6 00        nop     
32e7 00        nop     
32e8 00        nop     
32e9 00        nop     
32ea 00        nop     
32eb 00        nop     
32ec 00        nop     
32ed 00        nop     
32ee 00        nop     
32ef 00        nop     
32f0 00        nop     
32f1 00        nop     
32f2 00        nop     
32f3 00        nop     
32f4 00        nop     
32f5 00        nop     
32f6 00        nop     
32f7 00        nop     
32f8 00        nop     
32f9 00        nop     
32fa 00        nop     
32fb 00        nop     
32fc 00        nop     
32fd 00        nop     
32fe 00        nop     
32ff 00        nop     
3300 00        nop     
3301 00        nop     
3302 00        nop     
3303 00        nop     
3304 00        nop     
3305 00        nop     
3306 fc32f9    call    m,$f932
3309 320000    ld      ($0000),a
330c 00        nop     
330d 00        nop     
330e 00        nop     
330f 00        nop     
3310 00        nop     
3311 00        nop     
3312 00        nop     
3313 00        nop     
3314 00        nop     
3315 00        nop     
3316 00        nop     
3317 00        nop     
3318 00        nop     
3319 00        nop     
331a 00        nop     
331b 00        nop     
331c 00        nop     
331d 00        nop     
331e 00        nop     
331f 00        nop     
3320 00        nop     
3321 00        nop     
3322 00        nop     
3323 00        nop     
3324 00        nop     
3325 00        nop     
3326 00        nop     
3327 00        nop     
3328 00        nop     
3329 00        nop     
332a 00        nop     
332b 00        nop     
332c 00        nop     
332d 00        nop     
332e 00        nop     
332f 00        nop     
3330 00        nop     
3331 00        nop     
3332 00        nop     
3333 00        nop     
3334 00        nop     
3335 00        nop     
3336 00        nop     
3337 00        nop     
3338 00        nop     
3339 00        nop     
333a 00        nop     
333b 00        nop     
333c 00        nop     
333d 00        nop     
333e 00        nop     
333f 00        nop     
3340 00        nop     
3341 00        nop     
3342 00        nop     
3343 00        nop     
3344 00        nop     
3345 00        nop     
3346 00        nop     
3347 00        nop     
3348 00        nop     
3349 00        nop     
334a 00        nop     
334b 00        nop     
334c 00        nop     
334d 00        nop     
334e 00        nop     
334f 00        nop     
3350 00        nop     
3351 00        nop     
3352 00        nop     
3353 00        nop     
3354 00        nop     
3355 00        nop     
3356 00        nop     
3357 00        nop     
3358 00        nop     
3359 00        nop     
335a 00        nop     
335b 00        nop     
335c 00        nop     
335d 00        nop     
335e 00        nop     
335f 00        nop     
3360 00        nop     
3361 00        nop     
3362 00        nop     
3363 00        nop     
3364 00        nop     
3365 00        nop     
3366 00        nop     
3367 00        nop     
3368 00        nop     
3369 00        nop     
336a 00        nop     
336b 00        nop     
336c 00        nop     
336d 00        nop     
336e 00        nop     
336f 00        nop     
3370 00        nop     
3371 00        nop     
3372 00        nop     
3373 00        nop     
3374 00        nop     
3375 00        nop     
3376 00        nop     
3377 00        nop     
3378 00        nop     
3379 00        nop     
337a 00        nop     
337b 00        nop     
337c 00        nop     
337d 00        nop     
337e 00        nop     
337f 00        nop     
3380 00        nop     
3381 00        nop     
3382 00        nop     
3383 00        nop     
3384 00        nop     
3385 00        nop     
3386 00        nop     
3387 00        nop     
3388 00        nop     
3389 00        nop     
338a 00        nop     
338b 00        nop     
338c 00        nop     
338d 00        nop     
338e 00        nop     
338f 00        nop     
3390 00        nop     
3391 00        nop     
3392 00        nop     
3393 00        nop     
3394 00        nop     
3395 00        nop     
3396 00        nop     
3397 00        nop     
3398 00        nop     
3399 00        nop     
339a 00        nop     
339b 00        nop     
339c 00        nop     
339d 00        nop     
339e 00        nop     
339f 00        nop     
33a0 00        nop     
33a1 00        nop     
33a2 00        nop     
33a3 00        nop     
33a4 00        nop     
33a5 00        nop     
33a6 00        nop     
33a7 00        nop     
33a8 00        nop     
33a9 00        nop     
33aa 00        nop     
33ab 00        nop     
33ac 00        nop     
33ad 00        nop     
33ae 00        nop     
33af 00        nop     
33b0 00        nop     
33b1 00        nop     
33b2 00        nop     
33b3 00        nop     
33b4 00        nop     
33b5 00        nop     
33b6 00        nop     
33b7 00        nop     
33b8 00        nop     
33b9 00        nop     
33ba 00        nop     
33bb 00        nop     
33bc 00        nop     
33bd 00        nop     
33be 00        nop     
33bf 00        nop     
33c0 00        nop     
33c1 00        nop     
33c2 00        nop     
33c3 00        nop     
33c4 00        nop     
33c5 00        nop     
33c6 00        nop     
33c7 00        nop     
33c8 00        nop     
33c9 00        nop     
33ca 00        nop     
33cb 00        nop     
33cc 00        nop     
33cd 00        nop     
33ce 00        nop     
33cf 00        nop     
33d0 00        nop     
33d1 00        nop     
33d2 00        nop     
33d3 00        nop     
33d4 00        nop     
33d5 00        nop     
33d6 00        nop     
33d7 00        nop     
33d8 00        nop     
33d9 00        nop     
33da 00        nop     
33db 00        nop     
33dc 00        nop     
33dd 00        nop     
33de 00        nop     
33df 00        nop     
33e0 00        nop     
33e1 00        nop     
33e2 00        nop     
33e3 00        nop     
33e4 00        nop     
33e5 00        nop     
33e6 00        nop     
33e7 00        nop     
33e8 00        nop     
33e9 00        nop     
33ea 00        nop     
33eb 00        nop     
33ec 00        nop     
33ed 00        nop     
33ee 00        nop     
33ef 00        nop     
33f0 00        nop     
33f1 00        nop     
33f2 00        nop     
33f3 00        nop     
33f4 00        nop     
33f5 00        nop     
33f6 00        nop     
33f7 00        nop     
33f8 00        nop     
33f9 00        nop     
33fa 00        nop     
33fb 00        nop     
33fc 00        nop     
33fd 00        nop     
33fe 00        nop     
33ff 00        nop     
3400 00        nop     
3401 00        nop     
3402 00        nop     
3403 00        nop     
3404 00        nop     
3405 00        nop     
3406 00        nop     
3407 00        nop     
3408 00        nop     
3409 00        nop     
340a 00        nop     
340b 00        nop     
340c 00        nop     
340d 00        nop     
340e 00        nop     
340f 00        nop     
3410 00        nop     
3411 00        nop     
3412 00        nop     
3413 00        nop     
3414 00        nop     
3415 00        nop     
3416 00        nop     
3417 00        nop     
3418 00        nop     
3419 00        nop     
341a 00        nop     
341b 00        nop     
341c 00        nop     
341d 00        nop     
341e 00        nop     
341f 00        nop     
3420 00        nop     
3421 00        nop     
3422 00        nop     
3423 00        nop     
3424 00        nop     
3425 00        nop     
3426 00        nop     
3427 00        nop     
3428 00        nop     
3429 00        nop     
342a 00        nop     
342b 00        nop     
342c 00        nop     
342d 00        nop     
342e 00        nop     
342f 00        nop     
3430 00        nop     
3431 00        nop     
3432 00        nop     
3433 00        nop     
3434 00        nop     
3435 00        nop     
3436 00        nop     
3437 00        nop     
3438 00        nop     
3439 00        nop     
343a 00        nop     
343b 00        nop     
343c 00        nop     
343d 00        nop     
343e 00        nop     
343f 00        nop     
3440 00        nop     
3441 00        nop     
3442 00        nop     
3443 00        nop     
3444 00        nop     
3445 00        nop     
3446 00        nop     
3447 00        nop     
3448 00        nop     
3449 00        nop     
344a 00        nop     
344b 00        nop     
344c 00        nop     
344d 00        nop     
344e 00        nop     
344f 00        nop     
3450 00        nop     
3451 00        nop     
3452 00        nop     
3453 00        nop     
3454 00        nop     
3455 00        nop     
3456 00        nop     
3457 00        nop     
3458 00        nop     
3459 00        nop     
345a 00        nop     
345b 00        nop     
345c 00        nop     
345d 00        nop     
345e 00        nop     
345f 00        nop     
3460 00        nop     
3461 00        nop     
3462 00        nop     
3463 00        nop     
3464 00        nop     
3465 00        nop     
3466 00        nop     
3467 00        nop     
3468 00        nop     
3469 00        nop     
346a 00        nop     
346b 00        nop     
346c 00        nop     
346d 00        nop     
346e 00        nop     
346f 00        nop     
3470 00        nop     
3471 00        nop     
3472 00        nop     
3473 00        nop     
3474 00        nop     
3475 00        nop     
3476 00        nop     
3477 00        nop     
3478 00        nop     
3479 00        nop     
347a 00        nop     
347b 00        nop     
347c 00        nop     
347d 00        nop     
347e 00        nop     
347f 00        nop     
3480 00        nop     
3481 00        nop     
3482 00        nop     
3483 00        nop     
3484 00        nop     
3485 00        nop     
3486 00        nop     
3487 00        nop     
3488 00        nop     
3489 00        nop     
348a 00        nop     
348b 00        nop     
348c 00        nop     
348d 00        nop     
348e 00        nop     
348f 00        nop     
3490 00        nop     
3491 00        nop     
3492 00        nop     
3493 00        nop     
3494 00        nop     
3495 00        nop     
3496 00        nop     
3497 00        nop     
3498 00        nop     
3499 00        nop     
349a 00        nop     
349b 00        nop     
349c 00        nop     
349d 00        nop     
349e 00        nop     
349f 00        nop     
34a0 00        nop     
34a1 00        nop     
34a2 00        nop     
34a3 00        nop     
34a4 00        nop     
34a5 00        nop     
34a6 00        nop     
34a7 00        nop     
34a8 00        nop     
34a9 00        nop     
34aa 00        nop     
34ab 00        nop     
34ac 00        nop     
34ad 00        nop     
34ae 00        nop     
34af 00        nop     
34b0 00        nop     
34b1 00        nop     
34b2 00        nop     
34b3 00        nop     
34b4 00        nop     
34b5 00        nop     
34b6 00        nop     
34b7 00        nop     
34b8 00        nop     
34b9 00        nop     
34ba 00        nop     
34bb 00        nop     
34bc 00        nop     
34bd 00        nop     
34be 00        nop     
34bf 00        nop     
34c0 00        nop     
34c1 00        nop     
34c2 00        nop     
34c3 00        nop     
34c4 7e        ld      a,(hl)
34c5 fe03      cp      $03
34c7 d21f35    jp      nc,$351f
34ca 323a35    ld      ($353a),a
34cd 00        nop     
34ce 87        add     a,a
34cf 87        add     a,a
34d0 87        add     a,a
34d1 5f        ld      e,a
34d2 1600      ld      d,$00
34d4 d5        push    de
34d5 21808d    ld      hl,$8d80
34d8 19        add     hl,de
34d9 116b35    ld      de,$356b
34dc cd2135    call    $3521
34df d1        pop     de
34e0 21988d    ld      hl,$8d98
34e3 19        add     hl,de
34e4 117335    ld      de,$3573
34e7 cd2135    call    $3521
34ea 21b08d    ld      hl,$8db0
34ed 117b35    ld      de,$357b
34f0 cd2135    call    $3521
34f3 21b88d    ld      hl,$8db8
34f6 118335    ld      de,$3583
34f9 cd2135    call    $3521
34fc 3a3a35    ld      a,($353a)
34ff 213b35    ld      hl,$353b
3502 fe00      cp      $00
3504 ca1235    jp      z,$3512
3507 214b35    ld      hl,$354b
350a fe01      cp      $01
350c ca1235    jp      z,$3512
350f 215b35    ld      hl,$355b
3512 e5        push    hl
3513 cdf902    call    $02f9
3516 e1        pop     hl
3517 110800    ld      de,$0008
351a 19        add     hl,de
351b cdf902    call    $02f9
351e c9        ret     

351f af        xor     a
3520 c9        ret     

3521 0608      ld      b,$08
3523 7e        ld      a,(hl)
3524 12        ld      (de),a
3525 23        inc     hl
3526 13        inc     de
3527 05        dec     b
3528 c22335    jp      nz,$3523
352b c9        ret     

352c 3a3a35    ld      a,($353a)
352f 77        ld      (hl),a
3530 23        inc     hl
3531 3600      ld      (hl),$00
3533 c9        ret     

3534 c37d80    jp      $807d
3537 c32180    jp      $8021
353a 00        nop     
353b 49        ld      c,c
353c 4f        ld      c,a
353d 50        ld      d,b
353e 41        ld      b,c
353f 4b        ld      c,e
3540 3020      jr      nc,$3562
3542 2053      jr      nz,$3597
3544 43        ld      b,e
3545 52        ld      d,d
3546 45        ld      b,l
3547 45        ld      b,l
3548 4e        ld      c,(hl)
3549 2020      jr      nz,$356b
354b 49        ld      c,c
354c 4f        ld      c,a
354d 50        ld      d,b
354e 41        ld      b,c
354f 4b        ld      c,e
3550 312020    ld      sp,$2020
3553 50        ld      d,b
3554 4c        ld      c,h
3555 4f        ld      c,a
3556 54        ld      d,h
3557 54        ld      d,h
3558 45        ld      b,l
3559 52        ld      d,d
355a 2049      jr      nz,$35a5
355c 4f        ld      c,a
355d 50        ld      d,b
355e 41        ld      b,c
355f 4b        ld      c,e
3560 322020    ld      ($2020),a
3563 50        ld      d,b
3564 52        ld      d,d
3565 49        ld      c,c
3566 4e        ld      c,(hl)
3567 54        ld      d,h
3568 45        ld      b,l
3569 52        ld      d,d
356a 2000      jr      nz,$356c
356c 00        nop     
356d 00        nop     
356e 00        nop     
356f 00        nop     
3570 00        nop     
3571 00        nop     
3572 00        nop     
3573 00        nop     
3574 00        nop     
3575 00        nop     
3576 00        nop     
3577 010000    ld      bc,$0000
357a 00        nop     
357b 00        nop     
357c 00        nop     
357d 00        nop     
357e 00        nop     
357f 00        nop     
3580 00        nop     
3581 00        nop     
3582 00        nop     
3583 c4c3c1    call    nz,$c1c3
3586 c22000    jp      nz,$0020
3589 00        nop     
358a 00        nop     
358b 019135    ld      bc,$3591
358e c36a83    jp      $836a
3591 cdc801    call    $01c8
3594 cd453b    call    $3b45
3597 af        xor     a
3598 32589b    ld      ($9b58),a
359b 3a3a9b    ld      a,($9b3a)
359e 322f84    ld      ($842f),a
35a1 c3ce35    jp      $35ce
35a4 212f84    ld      hl,$842f
35a7 cdf201    call    $01f2
35aa 323584    ld      ($8435),a
35ad b7        or      a
35ae c2ce35    jp      nz,$35ce
35b1 cd243f    call    $3f24
35b4 3a159b    ld      a,($9b15)
35b7 b7        or      a
35b8 c2be35    jp      nz,$35be
35bb c3a435    jp      $35a4
35be 212f84    ld      hl,$842f
35c1 cdf201    call    $01f2
35c4 323584    ld      ($8435),a
35c7 b7        or      a
35c8 c2ce35    jp      nz,$35ce
35cb c3be35    jp      $35be
35ce 3a229b    ld      a,($9b22)
35d1 32249b    ld      ($9b24),a
35d4 cd3d40    call    $403d
35d7 3a2f84    ld      a,($842f)
35da 6f        ld      l,a
35db 17        rla     
35dc 9f        sbc     a,a
35dd 67        ld      h,a
35de eb        ex      de,hl
35df 2adaa5    ld      hl,($a5da)
35e2 7b        ld      a,e
35e3 95        sub     l
35e4 6f        ld      l,a
35e5 7a        ld      a,d
35e6 9c        sbc     a,h
35e7 67        ld      h,a
35e8 7d        ld      a,l
35e9 07        rlca    
35ea b5        or      l
35eb e67f      and     $7f
35ed b4        or      h
35ee d601      sub     $01
35f0 9f        sbc     a,a
35f1 323584    ld      ($8435),a
35f4 b7        or      a
35f5 c22a36    jp      nz,$362a
35f8 113384    ld      de,$8433
35fb 212f84    ld      hl,$842f
35fe cd8a3b    call    $3b8a
3601 323584    ld      ($8435),a
3604 b7        or      a
3605 c2a435    jp      nz,$35a4
3608 210100    ld      hl,$0001
360b 223684    ld      ($8436),hl
360e 112e84    ld      de,$842e
3611 212f84    ld      hl,$842f
3614 cd9a02    call    $029a
3617 2a3684    ld      hl,($8436)
361a 23        inc     hl
361b eb        ex      de,hl
361c 2a3384    ld      hl,($8433)
361f eb        ex      de,hl
3620 7b        ld      a,e
3621 95        sub     l
3622 7a        ld      a,d
3623 9c        sbc     a,h
3624 f20b36    jp      p,$360b
3627 c33336    jp      $3633
362a cd7d3a    call    $3a7d
362d 212e84    ld      hl,$842e
3630 cd4a01    call    $014a
3633 3a2e84    ld      a,($842e)
3636 d601      sub     $01
3638 9f        sbc     a,a
3639 323584    ld      ($8435),a
363c b7        or      a
363d c26d36    jp      nz,$366d
3640 3a2e84    ld      a,($842e)
3643 d602      sub     $02
3645 d601      sub     $01
3647 9f        sbc     a,a
3648 323584    ld      ($8435),a
364b b7        or      a
364c c25b36    jp      nz,$365b
364f 217936    ld      hl,$3679
3652 cd9d44    call    $449d
3655 cd1740    call    $4017
3658 c36d36    jp      $366d
365b 217b36    ld      hl,$367b
365e cd9d44    call    $449d
3661 cd1740    call    $4017
3664 cd753c    call    $3c75
3667 cd3d40    call    $403d
366a cd7943    call    $4379
366d cd453b    call    $3b45
3670 3a229b    ld      a,($9b22)
3673 32249b    ld      ($9b24),a
3676 c3a435    jp      $35a4
3679 00        nop     
367a 00        nop     
367b ff        rst     $38
367c ff        rst     $38
367d 223984    ld      ($8439),hl
3680 eb        ex      de,hl
3681 223b84    ld      ($843b),hl
3684 60        ld      h,b
3685 69        ld      l,c
3686 223d84    ld      ($843d),hl
3689 11ca9a    ld      de,$9aca
368c 21c49a    ld      hl,$9ac4
368f cd5038    call    $3850
3692 324384    ld      ($8443),a
3695 b7        or      a
3696 c2ce36    jp      nz,$36ce
3699 2a3d84    ld      hl,($843d)
369c 224484    ld      ($8444),hl
369f 014484    ld      bc,$8444
36a2 11c49a    ld      de,$9ac4
36a5 2a3b84    ld      hl,($843b)
36a8 cd4740    call    $4047
36ab 2ac49a    ld      hl,($9ac4)
36ae 23        inc     hl
36af 22c49a    ld      ($9ac4),hl
36b2 3a229b    ld      a,($9b22)
36b5 d616      sub     $16
36b7 17        rla     
36b8 9f        sbc     a,a
36b9 324384    ld      ($8443),a
36bc b7        or      a
36bd cac736    jp      z,$36c7
36c0 3a229b    ld      a,($9b22)
36c3 3c        inc     a
36c4 32229b    ld      ($9b22),a
36c7 cd3d40    call    $403d
36ca cd7943    call    $4379
36cd c9        ret     

36ce 3eff      ld      a,$ff
36d0 2a3984    ld      hl,($8439)
36d3 77        ld      (hl),a
36d4 c9        ret     

36d5 225184    ld      ($8451),hl
36d8 eb        ex      de,hl
36d9 225384    ld      ($8453),hl
36dc 2a5184    ld      hl,($8451)
36df 7e        ld      a,(hl)
36e0 23        inc     hl
36e1 66        ld      h,(hl)
36e2 6f        ld      l,a
36e3 eb        ex      de,hl
36e4 2a5384    ld      hl,($8453)
36e7 7e        ld      a,(hl)
36e8 23        inc     hl
36e9 66        ld      h,(hl)
36ea 6f        ld      l,a
36eb 7b        ld      a,e
36ec 95        sub     l
36ed 6f        ld      l,a
36ee 7a        ld      a,d
36ef 9c        sbc     a,h
36f0 67        ld      h,a
36f1 7d        ld      a,l
36f2 07        rlca    
36f3 b5        or      l
36f4 e67f      and     $7f
36f6 b4        or      h
36f7 d601      sub     $01
36f9 9f        sbc     a,a
36fa 324984    ld      ($8449),a
36fd c9        ret     

36fe 225e84    ld      ($845e),hl
3701 2a5e84    ld      hl,($845e)
3704 7e        ld      a,(hl)
3705 23        inc     hl
3706 66        ld      h,(hl)
3707 6f        ld      l,a
3708 7d        ld      a,l
3709 07        rlca    
370a b5        or      l
370b e67f      and     $7f
370d b4        or      h
370e d601      sub     $01
3710 9f        sbc     a,a
3711 325684    ld      ($8456),a
3714 c9        ret     

3715 226184    ld      ($8461),hl
3718 eb        ex      de,hl
3719 226384    ld      ($8463),hl
371c 60        ld      h,b
371d 69        ld      l,c
371e 226584    ld      ($8465),hl
3721 2a6384    ld      hl,($8463)
3724 7e        ld      a,(hl)
3725 23        inc     hl
3726 66        ld      h,(hl)
3727 6f        ld      l,a
3728 226784    ld      ($8467),hl
372b 216784    ld      hl,$8467
372e cd6e39    call    $396e
3731 327284    ld      ($8472),a
3734 b7        or      a
3735 ca4437    jp      z,$3744
3738 2a6784    ld      hl,($8467)
373b af        xor     a
373c 95        sub     l
373d 6f        ld      l,a
373e 9c        sbc     a,h
373f 95        sub     l
3740 67        ld      h,a
3741 226784    ld      ($8467),hl
3744 2a6584    ld      hl,($8465)
3747 7e        ld      a,(hl)
3748 326e84    ld      ($846e),a
374b 2a6584    ld      hl,($8465)
374e eb        ex      de,hl
374f 2a6184    ld      hl,($8461)
3752 cd8344    call    $4483
3755 3e01      ld      a,$01
3757 326d84    ld      ($846d),a
375a 2a6784    ld      hl,($8467)
375d eb        ex      de,hl
375e 210a00    ld      hl,$000a
3761 cd2180    call    $8021
3764 226984    ld      ($8469),hl
3767 eb        ex      de,hl
3768 210a00    ld      hl,$000a
376b cd7d80    call    $807d
376e eb        ex      de,hl
376f 2a6784    ld      hl,($8467)
3772 7b        ld      a,e
3773 95        sub     l
3774 6f        ld      l,a
3775 7a        ld      a,d
3776 9c        sbc     a,h
3777 67        ld      h,a
3778 af        xor     a
3779 95        sub     l
377a 6f        ld      l,a
377b 9c        sbc     a,h
377c 95        sub     l
377d 67        ld      h,a
377e 226b84    ld      ($846b),hl
3781 3a6e84    ld      a,($846e)
3784 6f        ld      l,a
3785 17        rla     
3786 9f        sbc     a,a
3787 67        ld      h,a
3788 eb        ex      de,hl
3789 21ffff    ld      hl,$ffff
378c 19        add     hl,de
378d eb        ex      de,hl
378e 2a6184    ld      hl,($8461)
3791 19        add     hl,de
3792 227384    ld      ($8473),hl
3795 2a6b84    ld      hl,($846b)
3798 113000    ld      de,$0030
379b 19        add     hl,de
379c 7d        ld      a,l
379d 2a7384    ld      hl,($8473)
37a0 77        ld      (hl),a
37a1 2a6984    ld      hl,($8469)
37a4 226784    ld      ($8467),hl
37a7 3a6e84    ld      a,($846e)
37aa 3d        dec     a
37ab 326e84    ld      ($846e),a
37ae 216784    ld      hl,$8467
37b1 cdfe36    call    $36fe
37b4 327284    ld      ($8472),a
37b7 b7        or      a
37b8 c2d537    jp      nz,$37d5
37bb 3a6d84    ld      a,($846d)
37be 2a6584    ld      hl,($8465)
37c1 be        cp      (hl)
37c2 3c        inc     a
37c3 da5737    jp      c,$3757
37c6 2a6584    ld      hl,($8465)
37c9 44        ld      b,h
37ca 4d        ld      c,l
37cb 110c38    ld      de,$380c
37ce 2a6184    ld      hl,($8461)
37d1 cd7944    call    $4479
37d4 c9        ret     

37d5 2a6384    ld      hl,($8463)
37d8 cd3938    call    $3839
37db 327284    ld      ($8472),a
37de b7        or      a
37df cae337    jp      z,$37e3
37e2 c9        ret     

37e3 3a6e84    ld      a,($846e)
37e6 3d        dec     a
37e7 c681      add     a,$81
37e9 9f        sbc     a,a
37ea 327284    ld      ($8472),a
37ed b7        or      a
37ee c2c637    jp      nz,$37c6
37f1 3a6e84    ld      a,($846e)
37f4 6f        ld      l,a
37f5 17        rla     
37f6 9f        sbc     a,a
37f7 67        ld      h,a
37f8 eb        ex      de,hl
37f9 21ffff    ld      hl,$ffff
37fc 19        add     hl,de
37fd eb        ex      de,hl
37fe 2a6184    ld      hl,($8461)
3801 19        add     hl,de
3802 227384    ld      ($8473),hl
3805 3e2d      ld      a,$2d
3807 2a7384    ld      hl,($8473)
380a 77        ld      (hl),a
380b c9        ret     

380c 23        inc     hl
380d 00        nop     
380e 00        nop     
380f 00        nop     
3810 227e84    ld      ($847e),hl
3813 eb        ex      de,hl
3814 228084    ld      ($8480),hl
3817 2a7e84    ld      hl,($847e)
381a 7e        ld      a,(hl)
381b 23        inc     hl
381c 66        ld      h,(hl)
381d 6f        ld      l,a
381e eb        ex      de,hl
381f 2a8084    ld      hl,($8480)
3822 7e        ld      a,(hl)
3823 23        inc     hl
3824 66        ld      h,(hl)
3825 6f        ld      l,a
3826 7b        ld      a,e
3827 95        sub     l
3828 6f        ld      l,a
3829 7a        ld      a,d
382a 9c        sbc     a,h
382b 67        ld      h,a
382c 7d        ld      a,l
382d 07        rlca    
382e b5        or      l
382f e67f      and     $7f
3831 b4        or      h
3832 17        rla     
3833 3f        ccf     
3834 9f        sbc     a,a
3835 327684    ld      ($8476),a
3838 c9        ret     

3839 228b84    ld      ($848b),hl
383c 2a8b84    ld      hl,($848b)
383f 7e        ld      a,(hl)
3840 23        inc     hl
3841 66        ld      h,(hl)
3842 6f        ld      l,a
3843 7d        ld      a,l
3844 07        rlca    
3845 b5        or      l
3846 e67f      and     $7f
3848 b4        or      h
3849 17        rla     
384a 3f        ccf     
384b 9f        sbc     a,a
384c 328384    ld      ($8483),a
384f c9        ret     

3850 229684    ld      ($8496),hl
3853 eb        ex      de,hl
3854 229884    ld      ($8498),hl
3857 2a9684    ld      hl,($8496)
385a 7e        ld      a,(hl)
385b 23        inc     hl
385c 66        ld      h,(hl)
385d 6f        ld      l,a
385e eb        ex      de,hl
385f 2a9884    ld      hl,($8498)
3862 7e        ld      a,(hl)
3863 23        inc     hl
3864 66        ld      h,(hl)
3865 6f        ld      l,a
3866 7b        ld      a,e
3867 95        sub     l
3868 6f        ld      l,a
3869 7a        ld      a,d
386a 9c        sbc     a,h
386b 67        ld      h,a
386c 7d        ld      a,l
386d 07        rlca    
386e b5        or      l
386f e67f      and     $7f
3871 b4        or      h
3872 3d        dec     a
3873 d67f      sub     $7f
3875 9f        sbc     a,a
3876 328e84    ld      ($848e),a
3879 c9        ret     

387a 22a384    ld      ($84a3),hl
387d 2aa384    ld      hl,($84a3)
3880 7e        ld      a,(hl)
3881 23        inc     hl
3882 66        ld      h,(hl)
3883 6f        ld      l,a
3884 7d        ld      a,l
3885 07        rlca    
3886 b5        or      l
3887 e67f      and     $7f
3889 b4        or      h
388a 3d        dec     a
388b d67f      sub     $7f
388d 9f        sbc     a,a
388e 329b84    ld      ($849b),a
3891 c9        ret     

3892 22ae84    ld      ($84ae),hl
3895 eb        ex      de,hl
3896 22b084    ld      ($84b0),hl
3899 2aae84    ld      hl,($84ae)
389c 7e        ld      a,(hl)
389d 23        inc     hl
389e 66        ld      h,(hl)
389f 6f        ld      l,a
38a0 eb        ex      de,hl
38a1 2ab084    ld      hl,($84b0)
38a4 7e        ld      a,(hl)
38a5 23        inc     hl
38a6 66        ld      h,(hl)
38a7 6f        ld      l,a
38a8 7b        ld      a,e
38a9 95        sub     l
38aa 6f        ld      l,a
38ab 7a        ld      a,d
38ac 9c        sbc     a,h
38ad 67        ld      h,a
38ae 7d        ld      a,l
38af 07        rlca    
38b0 b5        or      l
38b1 e67f      and     $7f
38b3 b4        or      h
38b4 3d        dec     a
38b5 c681      add     a,$81
38b7 9f        sbc     a,a
38b8 32a684    ld      ($84a6),a
38bb c9        ret     

38bc 22bb84    ld      ($84bb),hl
38bf 3e50      ld      a,$50
38c1 32b384    ld      ($84b3),a
38c4 3e01      ld      a,$01
38c6 32bd84    ld      ($84bd),a
38c9 3ab384    ld      a,($84b3)
38cc 6f        ld      l,a
38cd 17        rla     
38ce 9f        sbc     a,a
38cf 67        ld      h,a
38d0 eb        ex      de,hl
38d1 21ffff    ld      hl,$ffff
38d4 19        add     hl,de
38d5 eb        ex      de,hl
38d6 2abb84    ld      hl,($84bb)
38d9 19        add     hl,de
38da 7e        ld      a,(hl)
38db d620      sub     $20
38dd c6ff      add     a,$ff
38df 9f        sbc     a,a
38e0 32be84    ld      ($84be),a
38e3 b7        or      a
38e4 caeb38    jp      z,$38eb
38e7 3ab384    ld      a,($84b3)
38ea c9        ret     

38eb 3ab384    ld      a,($84b3)
38ee 3d        dec     a
38ef 32b384    ld      ($84b3),a
38f2 3abd84    ld      a,($84bd)
38f5 3c        inc     a
38f6 fe51      cp      $51
38f8 fac638    jp      m,$38c6
38fb 3ab384    ld      a,($84b3)
38fe c9        ret     

38ff 22c884    ld      ($84c8),hl
3902 2ac884    ld      hl,($84c8)
3905 7e        ld      a,(hl)
3906 23        inc     hl
3907 66        ld      h,(hl)
3908 6f        ld      l,a
3909 7d        ld      a,l
390a 07        rlca    
390b b5        or      l
390c e67f      and     $7f
390e b4        or      h
390f 3d        dec     a
3910 c681      add     a,$81
3912 9f        sbc     a,a
3913 32c084    ld      ($84c0),a
3916 c9        ret     

3917 22cb84    ld      ($84cb),hl
391a 2acb84    ld      hl,($84cb)
391d 7e        ld      a,(hl)
391e d65a      sub     $5a
3920 3d        dec     a
3921 d67f      sub     $7f
3923 9f        sbc     a,a
3924 32cd84    ld      ($84cd),a
3927 2acb84    ld      hl,($84cb)
392a 7e        ld      a,(hl)
392b d641      sub     $41
392d 17        rla     
392e 9f        sbc     a,a
392f 21cd84    ld      hl,$84cd
3932 b6        or      (hl)
3933 32ce84    ld      ($84ce),a
3936 b7        or      a
3937 ca3b39    jp      z,$393b
393a c9        ret     

393b 2acb84    ld      hl,($84cb)
393e 7e        ld      a,(hl)
393f c620      add     a,$20
3941 2acb84    ld      hl,($84cb)
3944 77        ld      (hl),a
3945 c9        ret     

3946 22d884    ld      ($84d8),hl
3949 eb        ex      de,hl
394a 22da84    ld      ($84da),hl
394d 2ad884    ld      hl,($84d8)
3950 7e        ld      a,(hl)
3951 23        inc     hl
3952 66        ld      h,(hl)
3953 6f        ld      l,a
3954 eb        ex      de,hl
3955 2ada84    ld      hl,($84da)
3958 7e        ld      a,(hl)
3959 23        inc     hl
395a 66        ld      h,(hl)
395b 6f        ld      l,a
395c 7b        ld      a,e
395d 95        sub     l
395e 6f        ld      l,a
395f 7a        ld      a,d
3960 9c        sbc     a,h
3961 67        ld      h,a
3962 7d        ld      a,l
3963 07        rlca    
3964 b5        or      l
3965 e67f      and     $7f
3967 b4        or      h
3968 17        rla     
3969 9f        sbc     a,a
396a 32d084    ld      ($84d0),a
396d c9        ret     

396e 22e584    ld      ($84e5),hl
3971 2ae584    ld      hl,($84e5)
3974 7e        ld      a,(hl)
3975 23        inc     hl
3976 66        ld      h,(hl)
3977 6f        ld      l,a
3978 7d        ld      a,l
3979 07        rlca    
397a b5        or      l
397b e67f      and     $7f
397d b4        or      h
397e 17        rla     
397f 9f        sbc     a,a
3980 32dd84    ld      ($84dd),a
3983 c9        ret     

3984 22e884    ld      ($84e8),hl
3987 3e32      ld      a,$32
3989 32eb84    ld      ($84eb),a
398c 3e01      ld      a,$01
398e 32ec84    ld      ($84ec),a
3991 3aec84    ld      a,($84ec)
3994 6f        ld      l,a
3995 17        rla     
3996 9f        sbc     a,a
3997 67        ld      h,a
3998 eb        ex      de,hl
3999 21ffff    ld      hl,$ffff
399c 19        add     hl,de
399d eb        ex      de,hl
399e 2ae884    ld      hl,($84e8)
39a1 19        add     hl,de
39a2 7e        ld      a,(hl)
39a3 32ea84    ld      ($84ea),a
39a6 d621      sub     $21
39a8 d601      sub     $01
39aa 9f        sbc     a,a
39ab 32ee84    ld      ($84ee),a
39ae b7        or      a
39af c2d839    jp      nz,$39d8
39b2 3aeb84    ld      a,($84eb)
39b5 11e79c    ld      de,$9ce7
39b8 6f        ld      l,a
39b9 17        rla     
39ba 9f        sbc     a,a
39bb 67        ld      h,a
39bc 19        add     hl,de
39bd 22ef84    ld      ($84ef),hl
39c0 3aea84    ld      a,($84ea)
39c3 2aef84    ld      hl,($84ef)
39c6 77        ld      (hl),a
39c7 3aeb84    ld      a,($84eb)
39ca 3c        inc     a
39cb 32eb84    ld      ($84eb),a
39ce 3aec84    ld      a,($84ec)
39d1 3c        inc     a
39d2 32ec84    ld      ($84ec),a
39d5 c39139    jp      $3991
39d8 3a589b    ld      a,($9b58)
39db 3d        dec     a
39dc d67f      sub     $7f
39de 9f        sbc     a,a
39df 32ee84    ld      ($84ee),a
39e2 3aec84    ld      a,($84ec)
39e5 d605      sub     $05
39e7 3d        dec     a
39e8 d67f      sub     $7f
39ea 9f        sbc     a,a
39eb 21ee84    ld      hl,$84ee
39ee a6        and     (hl)
39ef 32f184    ld      ($84f1),a
39f2 b7        or      a
39f3 cafd39    jp      z,$39fd
39f6 3a589b    ld      a,($9b58)
39f9 3d        dec     a
39fa 32589b    ld      ($9b58),a
39fd 3aec84    ld      a,($84ec)
3a00 3d        dec     a
3a01 c6ff      add     a,$ff
3a03 9f        sbc     a,a
3a04 32ee84    ld      ($84ee),a
3a07 b7        or      a
3a08 ca113a    jp      z,$3a11
3a0b 21503a    ld      hl,$3a50
3a0e cd0e78    call    $780e
3a11 3aeb84    ld      a,($84eb)
3a14 d64f      sub     $4f
3a16 3d        dec     a
3a17 d67f      sub     $7f
3a19 9f        sbc     a,a
3a1a 32ee84    ld      ($84ee),a
3a1d b7        or      a
3a1e c23f3a    jp      nz,$3a3f
3a21 3aeb84    ld      a,($84eb)
3a24 11e79c    ld      de,$9ce7
3a27 6f        ld      l,a
3a28 17        rla     
3a29 9f        sbc     a,a
3a2a 67        ld      h,a
3a2b 19        add     hl,de
3a2c 22ef84    ld      ($84ef),hl
3a2f 3e20      ld      a,$20
3a31 2aef84    ld      hl,($84ef)
3a34 77        ld      (hl),a
3a35 3aeb84    ld      a,($84eb)
3a38 3c        inc     a
3a39 32eb84    ld      ($84eb),a
3a3c c3113a    jp      $3a11
3a3f 01ed84    ld      bc,$84ed
3a42 114c3a    ld      de,$3a4c
3a45 21e89c    ld      hl,$9ce8
3a48 cd5a3d    call    $3d5a
3a4b c9        ret     

3a4c 17        rla     
3a4d 00        nop     
3a4e 00        nop     
3a4f 00        nop     
3a50 07        rlca    
3a51 00        nop     
3a52 00        nop     
3a53 00        nop     
3a54 22fb84    ld      ($84fb),hl
3a57 eb        ex      de,hl
3a58 22fd84    ld      ($84fd),hl
3a5b 2afb84    ld      hl,($84fb)
3a5e 7e        ld      a,(hl)
3a5f 23        inc     hl
3a60 66        ld      h,(hl)
3a61 6f        ld      l,a
3a62 eb        ex      de,hl
3a63 2afd84    ld      hl,($84fd)
3a66 7e        ld      a,(hl)
3a67 23        inc     hl
3a68 66        ld      h,(hl)
3a69 6f        ld      l,a
3a6a 7b        ld      a,e
3a6b 95        sub     l
3a6c 6f        ld      l,a
3a6d 7a        ld      a,d
3a6e 9c        sbc     a,h
3a6f 67        ld      h,a
3a70 7d        ld      a,l
3a71 07        rlca    
3a72 b5        or      l
3a73 e67f      and     $7f
3a75 b4        or      h
3a76 c6ff      add     a,$ff
3a78 9f        sbc     a,a
3a79 32f384    ld      ($84f3),a
3a7c c9        ret     

3a7d 210085    ld      hl,$8500
3a80 cd8439    call    $3984
3a83 c9        ret     

3a84 220285    ld      ($8502),hl
3a87 eb        ex      de,hl
3a88 220485    ld      ($8504),hl
3a8b 2a0485    ld      hl,($8504)
3a8e 7e        ld      a,(hl)
3a8f 6f        ld      l,a
3a90 17        rla     
3a91 9f        sbc     a,a
3a92 67        ld      h,a
3a93 eb        ex      de,hl
3a94 21ffff    ld      hl,$ffff
3a97 19        add     hl,de
3a98 eb        ex      de,hl
3a99 2a0285    ld      hl,($8502)
3a9c 19        add     hl,de
3a9d 7e        ld      a,(hl)
3a9e d620      sub     $20
3aa0 c6ff      add     a,$ff
3aa2 9f        sbc     a,a
3aa3 320685    ld      ($8506),a
3aa6 b7        or      a
3aa7 caab3a    jp      z,$3aab
3aaa c9        ret     

3aab 2a0485    ld      hl,($8504)
3aae 7e        ld      a,(hl)
3aaf 3c        inc     a
3ab0 2a0485    ld      hl,($8504)
3ab3 77        ld      (hl),a
3ab4 7e        ld      a,(hl)
3ab5 d650      sub     $50
3ab7 3d        dec     a
3ab8 d67f      sub     $7f
3aba 9f        sbc     a,a
3abb 320685    ld      ($8506),a
3abe b7        or      a
3abf cac33a    jp      z,$3ac3
3ac2 c9        ret     

3ac3 c38b3a    jp      $3a8b
3ac6 220885    ld      ($8508),hl
3ac9 eb        ex      de,hl
3aca 220a85    ld      ($850a),hl
3acd 2a0885    ld      hl,($8508)
3ad0 7e        ld      a,(hl)
3ad1 23        inc     hl
3ad2 66        ld      h,(hl)
3ad3 6f        ld      l,a
3ad4 220c85    ld      ($850c),hl
3ad7 2a0a85    ld      hl,($850a)
3ada 7e        ld      a,(hl)
3adb 23        inc     hl
3adc 66        ld      h,(hl)
3add 6f        ld      l,a
3ade eb        ex      de,hl
3adf 2a0885    ld      hl,($8508)
3ae2 73        ld      (hl),e
3ae3 23        inc     hl
3ae4 72        ld      (hl),d
3ae5 2a0c85    ld      hl,($850c)
3ae8 eb        ex      de,hl
3ae9 2a0a85    ld      hl,($850a)
3aec 73        ld      (hl),e
3aed 23        inc     hl
3aee 72        ld      (hl),d
3aef c9        ret     

3af0 220f85    ld      ($850f),hl
3af3 eb        ex      de,hl
3af4 221185    ld      ($8511),hl
3af7 2a0f85    ld      hl,($850f)
3afa 7e        ld      a,(hl)
3afb 321385    ld      ($8513),a
3afe 2a1185    ld      hl,($8511)
3b01 7e        ld      a,(hl)
3b02 2a0f85    ld      hl,($850f)
3b05 77        ld      (hl),a
3b06 3a1385    ld      a,($8513)
3b09 2a1185    ld      hl,($8511)
3b0c 77        ld      (hl),a
3b0d c9        ret     

3b0e 221585    ld      ($8515),hl
3b11 2a1585    ld      hl,($8515)
3b14 7e        ld      a,(hl)
3b15 d67a      sub     $7a
3b17 3d        dec     a
3b18 d67f      sub     $7f
3b1a 9f        sbc     a,a
3b1b 321785    ld      ($8517),a
3b1e 2a1585    ld      hl,($8515)
3b21 7e        ld      a,(hl)
3b22 d661      sub     $61
3b24 17        rla     
3b25 9f        sbc     a,a
3b26 211785    ld      hl,$8517
3b29 b6        or      (hl)
3b2a 321885    ld      ($8518),a
3b2d b7        or      a
3b2e ca323b    jp      z,$3b32
3b31 c9        ret     

3b32 2a1585    ld      hl,($8515)
3b35 7e        ld      a,(hl)
3b36 6f        ld      l,a
3b37 17        rla     
3b38 9f        sbc     a,a
3b39 67        ld      h,a
3b3a eb        ex      de,hl
3b3b 21e0ff    ld      hl,$ffe0
3b3e 19        add     hl,de
3b3f 7d        ld      a,l
3b40 2a1585    ld      hl,($8515)
3b43 77        ld      (hl),a
3b44 c9        ret     

3b45 01863b    ld      bc,$3b86
3b48 11c49a    ld      de,$9ac4
3b4b 21f09c    ld      hl,$9cf0
3b4e cd1537    call    $3715
3b51 3a219b    ld      a,($9b21)
3b54 6f        ld      l,a
3b55 17        rla     
3b56 9f        sbc     a,a
3b57 67        ld      h,a
3b58 221a85    ld      ($851a),hl
3b5b 01823b    ld      bc,$3b82
3b5e 111a85    ld      de,$851a
3b61 21f79c    ld      hl,$9cf7
3b64 cd1537    call    $3715
3b67 3a549b    ld      a,($9b54)
3b6a 6f        ld      l,a
3b6b 17        rla     
3b6c 9f        sbc     a,a
3b6d 67        ld      h,a
3b6e 221a85    ld      ($851a),hl
3b71 017e3b    ld      bc,$3b7e
3b74 111a85    ld      de,$851a
3b77 21fc9c    ld      hl,$9cfc
3b7a cd1537    call    $3715
3b7d c9        ret     

3b7e 010000    ld      bc,$0000
3b81 00        nop     
3b82 03        inc     bc
3b83 00        nop     
3b84 00        nop     
3b85 00        nop     
3b86 0600      ld      b,$00
3b88 00        nop     
3b89 00        nop     
3b8a 222585    ld      ($8525),hl
3b8d eb        ex      de,hl
3b8e 222785    ld      ($8527),hl
3b91 af        xor     a
3b92 321d85    ld      ($851d),a
3b95 3a2b85    ld      a,($852b)
3b98 b7        or      a
3b99 c2e03b    jp      nz,$3be0
3b9c 210100    ld      hl,$0001
3b9f eb        ex      de,hl
3ba0 2a2785    ld      hl,($8527)
3ba3 73        ld      (hl),e
3ba4 23        inc     hl
3ba5 72        ld      (hl),d
3ba6 2a2585    ld      hl,($8525)
3ba9 7e        ld      a,(hl)
3baa 213b9b    ld      hl,$9b3b
3bad 96        sub     (hl)
3bae c6ff      add     a,$ff
3bb0 9f        sbc     a,a
3bb1 322d85    ld      ($852d),a
3bb4 b7        or      a
3bb5 cabc3b    jp      z,$3bbc
3bb8 3a1d85    ld      a,($851d)
3bbb c9        ret     

3bbc 21713c    ld      hl,$3c71
3bbf cd0e78    call    $780e
3bc2 3eff      ld      a,$ff
3bc4 321d85    ld      ($851d),a
3bc7 3eff      ld      a,$ff
3bc9 322b85    ld      ($852b),a
3bcc 210400    ld      hl,$0004
3bcf 222985    ld      ($8529),hl
3bd2 210000    ld      hl,$0000
3bd5 eb        ex      de,hl
3bd6 2a2785    ld      hl,($8527)
3bd9 73        ld      (hl),e
3bda 23        inc     hl
3bdb 72        ld      (hl),d
3bdc 3a1d85    ld      a,($851d)
3bdf c9        ret     

3be0 3eff      ld      a,$ff
3be2 321d85    ld      ($851d),a
3be5 21713c    ld      hl,$3c71
3be8 cd0e78    call    $780e
3beb 2a2585    ld      hl,($8525)
3bee 7e        ld      a,(hl)
3bef d615      sub     $15
3bf1 c6ff      add     a,$ff
3bf3 9f        sbc     a,a
3bf4 322d85    ld      ($852d),a
3bf7 b7        or      a
3bf8 c2073c    jp      nz,$3c07
3bfb 2a2985    ld      hl,($8529)
3bfe 29        add     hl,hl
3bff 29        add     hl,hl
3c00 222985    ld      ($8529),hl
3c03 3a1d85    ld      a,($851d)
3c06 c9        ret     

3c07 2a2585    ld      hl,($8525)
3c0a 7e        ld      a,(hl)
3c0b d639      sub     $39
3c0d 3d        dec     a
3c0e d67f      sub     $7f
3c10 9f        sbc     a,a
3c11 322d85    ld      ($852d),a
3c14 2a2585    ld      hl,($8525)
3c17 7e        ld      a,(hl)
3c18 d630      sub     $30
3c1a 17        rla     
3c1b 9f        sbc     a,a
3c1c 212d85    ld      hl,$852d
3c1f b6        or      (hl)
3c20 322e85    ld      ($852e),a
3c23 b7        or      a
3c24 c24e3c    jp      nz,$3c4e
3c27 2a2785    ld      hl,($8527)
3c2a 7e        ld      a,(hl)
3c2b 23        inc     hl
3c2c 66        ld      h,(hl)
3c2d 6f        ld      l,a
3c2e eb        ex      de,hl
3c2f 210a00    ld      hl,$000a
3c32 cd7d80    call    $807d
3c35 11d0ff    ld      de,$ffd0
3c38 19        add     hl,de
3c39 eb        ex      de,hl
3c3a 2a2585    ld      hl,($8525)
3c3d 7e        ld      a,(hl)
3c3e 6f        ld      l,a
3c3f 17        rla     
3c40 9f        sbc     a,a
3c41 67        ld      h,a
3c42 19        add     hl,de
3c43 eb        ex      de,hl
3c44 2a2785    ld      hl,($8527)
3c47 73        ld      (hl),e
3c48 23        inc     hl
3c49 72        ld      (hl),d
3c4a 3a1d85    ld      a,($851d)
3c4d c9        ret     

3c4e 2a2785    ld      hl,($8527)
3c51 cdfe36    call    $36fe
3c54 322d85    ld      ($852d),a
3c57 b7        or      a
3c58 ca653c    jp      z,$3c65
3c5b 2a2985    ld      hl,($8529)
3c5e eb        ex      de,hl
3c5f 2a2785    ld      hl,($8527)
3c62 73        ld      (hl),e
3c63 23        inc     hl
3c64 72        ld      (hl),d
3c65 af        xor     a
3c66 321d85    ld      ($851d),a
3c69 af        xor     a
3c6a 322b85    ld      ($852b),a
3c6d 3a1d85    ld      a,($851d)
3c70 c9        ret     

3c71 07        rlca    
3c72 00        nop     
3c73 00        nop     
3c74 00        nop     
3c75 21c49a    ld      hl,$9ac4
3c78 cdff38    call    $38ff
3c7b 323485    ld      ($8534),a
3c7e b7        or      a
3c7f ca883c    jp      z,$3c88
3c82 210100    ld      hl,$0001
3c85 22c49a    ld      ($9ac4),hl
3c88 11c89a    ld      de,$9ac8
3c8b 21c49a    ld      hl,$9ac4
3c8e cd5038    call    $3850
3c91 323485    ld      ($8534),a
3c94 b7        or      a
3c95 ca9e3c    jp      z,$3c9e
3c98 2ac89a    ld      hl,($9ac8)
3c9b 22c49a    ld      ($9ac4),hl
3c9e 211600    ld      hl,$0016
3ca1 eb        ex      de,hl
3ca2 3a229b    ld      a,($9b22)
3ca5 6f        ld      l,a
3ca6 17        rla     
3ca7 9f        sbc     a,a
3ca8 67        ld      h,a
3ca9 7b        ld      a,e
3caa 95        sub     l
3cab 6f        ld      l,a
3cac 7a        ld      a,d
3cad 9c        sbc     a,h
3cae 67        ld      h,a
3caf eb        ex      de,hl
3cb0 2ac49a    ld      hl,($9ac4)
3cb3 19        add     hl,de
3cb4 223085    ld      ($8530),hl
3cb7 11c89a    ld      de,$9ac8
3cba 213085    ld      hl,$8530
3cbd cd5038    call    $3850
3cc0 323485    ld      ($8534),a
3cc3 b7        or      a
3cc4 cadd3c    jp      z,$3cdd
3cc7 211600    ld      hl,$0016
3cca eb        ex      de,hl
3ccb 2ac89a    ld      hl,($9ac8)
3cce 7b        ld      a,e
3ccf 95        sub     l
3cd0 6f        ld      l,a
3cd1 7a        ld      a,d
3cd2 9c        sbc     a,h
3cd3 67        ld      h,a
3cd4 eb        ex      de,hl
3cd5 2ac49a    ld      hl,($9ac4)
3cd8 19        add     hl,de
3cd9 7d        ld      a,l
3cda 32229b    ld      ($9b22),a
3cdd 210100    ld      hl,$0001
3ce0 eb        ex      de,hl
3ce1 3a229b    ld      a,($9b22)
3ce4 6f        ld      l,a
3ce5 17        rla     
3ce6 9f        sbc     a,a
3ce7 67        ld      h,a
3ce8 7b        ld      a,e
3ce9 95        sub     l
3cea 6f        ld      l,a
3ceb 7a        ld      a,d
3cec 9c        sbc     a,h
3ced 67        ld      h,a
3cee eb        ex      de,hl
3cef 2ac49a    ld      hl,($9ac4)
3cf2 19        add     hl,de
3cf3 223085    ld      ($8530),hl
3cf6 213085    ld      hl,$8530
3cf9 cdff38    call    $38ff
3cfc 323485    ld      ($8534),a
3cff b7        or      a
3d00 ca093d    jp      z,$3d09
3d03 3ac49a    ld      a,($9ac4)
3d06 32229b    ld      ($9b22),a
3d09 c9        ret     

3d0a cd3b78    call    $783b
3d0d c9        ret     

3d0e 3a219b    ld      a,($9b21)
3d11 d650      sub     $50
3d13 323885    ld      ($8538),a
3d16 b7        or      a
3d17 ca273d    jp      z,$3d27
3d1a f23a3d    jp      p,$3d3a
3d1d 11219b    ld      de,$9b21
3d20 21229b    ld      hl,$9b22
3d23 cd9843    call    $4398
3d26 c9        ret     

3d27 21c49a    ld      hl,$9ac4
3d2a cddd40    call    $40dd
3d2d d650      sub     $50
3d2f 3d        dec     a
3d30 c681      add     a,$81
3d32 9f        sbc     a,a
3d33 323885    ld      ($8538),a
3d36 b7        or      a
3d37 c21d3d    jp      nz,$3d1d
3d3a 3a229b    ld      a,($9b22)
3d3d 3c        inc     a
3d3e 323885    ld      ($8538),a
3d41 3a219b    ld      a,($9b21)
3d44 6f        ld      l,a
3d45 17        rla     
3d46 9f        sbc     a,a
3d47 67        ld      h,a
3d48 eb        ex      de,hl
3d49 21b1ff    ld      hl,$ffb1
3d4c 19        add     hl,de
3d4d 223985    ld      ($8539),hl
3d50 113985    ld      de,$8539
3d53 213885    ld      hl,$8538
3d56 cd9843    call    $4398
3d59 c9        ret     

3d5a 223c85    ld      ($853c),hl
3d5d eb        ex      de,hl
3d5e 223e85    ld      ($853e),hl
3d61 60        ld      h,b
3d62 69        ld      l,c
3d63 224085    ld      ($8540),hl
3d66 af        xor     a
3d67 2a4085    ld      hl,($8540)
3d6a 77        ld      (hl),a
3d6b 3e50      ld      a,$50
3d6d 324385    ld      ($8543),a
3d70 2a3e85    ld      hl,($853e)
3d73 7e        ld      a,(hl)
3d74 6f        ld      l,a
3d75 17        rla     
3d76 9f        sbc     a,a
3d77 67        ld      h,a
3d78 cdde7f    call    $7fde
3d7b 214685    ld      hl,$8546
3d7e cded7d    call    $7ded
3d81 d601      sub     $01
3d83 9f        sbc     a,a
3d84 324a85    ld      ($854a),a
3d87 b7        or      a
3d88 ca923d    jp      z,$3d92
3d8b 3a4385    ld      a,($8543)
3d8e 3d        dec     a
3d8f 324385    ld      ($8543),a
3d92 3e01      ld      a,$01
3d94 324585    ld      ($8545),a
3d97 3a4585    ld      a,($8545)
3d9a 324485    ld      ($8544),a
3d9d 3a4485    ld      a,($8544)
3da0 324a85    ld      ($854a),a
3da3 6f        ld      l,a
3da4 17        rla     
3da5 9f        sbc     a,a
3da6 67        ld      h,a
3da7 eb        ex      de,hl
3da8 21ffff    ld      hl,$ffff
3dab 19        add     hl,de
3dac eb        ex      de,hl
3dad 2a3c85    ld      hl,($853c)
3db0 19        add     hl,de
3db1 224b85    ld      ($854b),hl
3db4 2a3e85    ld      hl,($853e)
3db7 7e        ld      a,(hl)
3db8 6f        ld      l,a
3db9 17        rla     
3dba 9f        sbc     a,a
3dbb 67        ld      h,a
3dbc eb        ex      de,hl
3dbd 215000    ld      hl,$0050
3dc0 cd7d80    call    $807d
3dc3 eb        ex      de,hl
3dc4 3a4a85    ld      a,($854a)
3dc7 6f        ld      l,a
3dc8 17        rla     
3dc9 9f        sbc     a,a
3dca 67        ld      h,a
3dcb 19        add     hl,de
3dcc 11879d    ld      de,$9d87
3dcf 19        add     hl,de
3dd0 224d85    ld      ($854d),hl
3dd3 2a4b85    ld      hl,($854b)
3dd6 7e        ld      a,(hl)
3dd7 2a4d85    ld      hl,($854d)
3dda 96        sub     (hl)
3ddb c6ff      add     a,$ff
3ddd 9f        sbc     a,a
3dde 324f85    ld      ($854f),a
3de1 b7        or      a
3de2 c2f13d    jp      nz,$3df1
3de5 3a4485    ld      a,($8544)
3de8 214385    ld      hl,$8543
3deb be        cp      (hl)
3dec 3c        inc     a
3ded da9a3d    jp      c,$3d9a
3df0 c9        ret     

3df1 114485    ld      de,$8544
3df4 2a3e85    ld      hl,($853e)
3df7 cd9843    call    $4398
3dfa 3a4485    ld      a,($8544)
3dfd 6f        ld      l,a
3dfe 17        rla     
3dff 9f        sbc     a,a
3e00 67        ld      h,a
3e01 eb        ex      de,hl
3e02 21ffff    ld      hl,$ffff
3e05 19        add     hl,de
3e06 eb        ex      de,hl
3e07 2a3c85    ld      hl,($853c)
3e0a 19        add     hl,de
3e0b 7e        ld      a,(hl)
3e0c 324285    ld      ($8542),a
3e0f 214285    ld      hl,$8542
3e12 cd0e78    call    $780e
3e15 3a4485    ld      a,($8544)
3e18 324a85    ld      ($854a),a
3e1b 2a3e85    ld      hl,($853e)
3e1e 7e        ld      a,(hl)
3e1f 6f        ld      l,a
3e20 17        rla     
3e21 9f        sbc     a,a
3e22 67        ld      h,a
3e23 eb        ex      de,hl
3e24 215000    ld      hl,$0050
3e27 cd7d80    call    $807d
3e2a eb        ex      de,hl
3e2b 3a4a85    ld      a,($854a)
3e2e 6f        ld      l,a
3e2f 17        rla     
3e30 9f        sbc     a,a
3e31 67        ld      h,a
3e32 19        add     hl,de
3e33 11879d    ld      de,$9d87
3e36 19        add     hl,de
3e37 224b85    ld      ($854b),hl
3e3a 3a4285    ld      a,($8542)
3e3d 2a4b85    ld      hl,($854b)
3e40 77        ld      (hl),a
3e41 3eff      ld      a,$ff
3e43 2a4085    ld      hl,($8540)
3e46 77        ld      (hl),a
3e47 3a4485    ld      a,($8544)
3e4a 3c        inc     a
3e4b 324485    ld      ($8544),a
3e4e 214385    ld      hl,$8543
3e51 96        sub     (hl)
3e52 3d        dec     a
3e53 d67f      sub     $7f
3e55 9f        sbc     a,a
3e56 324f85    ld      ($854f),a
3e59 b7        or      a
3e5a c2193f    jp      nz,$3f19
3e5d 3a4485    ld      a,($8544)
3e60 324a85    ld      ($854a),a
3e63 6f        ld      l,a
3e64 17        rla     
3e65 9f        sbc     a,a
3e66 67        ld      h,a
3e67 eb        ex      de,hl
3e68 21ffff    ld      hl,$ffff
3e6b 19        add     hl,de
3e6c eb        ex      de,hl
3e6d 2a3c85    ld      hl,($853c)
3e70 19        add     hl,de
3e71 224b85    ld      ($854b),hl
3e74 2a3e85    ld      hl,($853e)
3e77 7e        ld      a,(hl)
3e78 6f        ld      l,a
3e79 17        rla     
3e7a 9f        sbc     a,a
3e7b 67        ld      h,a
3e7c eb        ex      de,hl
3e7d 215000    ld      hl,$0050
3e80 cd7d80    call    $807d
3e83 eb        ex      de,hl
3e84 3a4a85    ld      a,($854a)
3e87 6f        ld      l,a
3e88 17        rla     
3e89 9f        sbc     a,a
3e8a 67        ld      h,a
3e8b 19        add     hl,de
3e8c 11879d    ld      de,$9d87
3e8f 19        add     hl,de
3e90 224d85    ld      ($854d),hl
3e93 2a4b85    ld      hl,($854b)
3e96 7e        ld      a,(hl)
3e97 2a4d85    ld      hl,($854d)
3e9a 96        sub     (hl)
3e9b c6ff      add     a,$ff
3e9d 9f        sbc     a,a
3e9e 324f85    ld      ($854f),a
3ea1 b7        or      a
3ea2 c2fa3d    jp      nz,$3dfa
3ea5 3a4485    ld      a,($8544)
3ea8 3c        inc     a
3ea9 324485    ld      ($8544),a
3eac 214385    ld      hl,$8543
3eaf 96        sub     (hl)
3eb0 3d        dec     a
3eb1 d67f      sub     $7f
3eb3 9f        sbc     a,a
3eb4 324a85    ld      ($854a),a
3eb7 b7        or      a
3eb8 c2193f    jp      nz,$3f19
3ebb 3a4485    ld      a,($8544)
3ebe 324a85    ld      ($854a),a
3ec1 6f        ld      l,a
3ec2 17        rla     
3ec3 9f        sbc     a,a
3ec4 67        ld      h,a
3ec5 eb        ex      de,hl
3ec6 21ffff    ld      hl,$ffff
3ec9 19        add     hl,de
3eca eb        ex      de,hl
3ecb 2a3c85    ld      hl,($853c)
3ece 19        add     hl,de
3ecf 224b85    ld      ($854b),hl
3ed2 2a3e85    ld      hl,($853e)
3ed5 7e        ld      a,(hl)
3ed6 6f        ld      l,a
3ed7 17        rla     
3ed8 9f        sbc     a,a
3ed9 67        ld      h,a
3eda eb        ex      de,hl
3edb 215000    ld      hl,$0050
3ede cd7d80    call    $807d
3ee1 eb        ex      de,hl
3ee2 3a4a85    ld      a,($854a)
3ee5 6f        ld      l,a
3ee6 17        rla     
3ee7 9f        sbc     a,a
3ee8 67        ld      h,a
3ee9 19        add     hl,de
3eea 11879d    ld      de,$9d87
3eed 19        add     hl,de
3eee 224d85    ld      ($854d),hl
3ef1 2a4b85    ld      hl,($854b)
3ef4 7e        ld      a,(hl)
3ef5 2a4d85    ld      hl,($854d)
3ef8 96        sub     (hl)
3ef9 c6ff      add     a,$ff
3efb 9f        sbc     a,a
3efc 324f85    ld      ($854f),a
3eff b7        or      a
3f00 c21a3f    jp      nz,$3f1a
3f03 3a4485    ld      a,($8544)
3f06 3c        inc     a
3f07 324585    ld      ($8545),a
3f0a 214385    ld      hl,$8543
3f0d 96        sub     (hl)
3f0e 3d        dec     a
3f0f c681      add     a,$81
3f11 9f        sbc     a,a
3f12 324a85    ld      ($854a),a
3f15 b7        or      a
3f16 c2973d    jp      nz,$3d97
3f19 c9        ret     

3f1a 3a4485    ld      a,($8544)
3f1d 3d        dec     a
3f1e 324485    ld      ($8544),a
3f21 c3fa3d    jp      $3dfa
3f24 cd0e3d    call    $3d0e
3f27 3a249b    ld      a,($9b24)
3f2a 325185    ld      ($8551),a
3f2d 3a5185    ld      a,($8551)
3f30 d617      sub     $17
3f32 d601      sub     $01
3f34 9f        sbc     a,a
3f35 32a885    ld      ($85a8),a
3f38 b7        or      a
3f39 c2f93f    jp      nz,$3ff9
3f3c 3a5185    ld      a,($8551)
3f3f d618      sub     $18
3f41 d601      sub     $01
3f43 9f        sbc     a,a
3f44 32a885    ld      ($85a8),a
3f47 b7        or      a
3f48 c20840    jp      nz,$4008
3f4b 2ac49a    ld      hl,($9ac4)
3f4e eb        ex      de,hl
3f4f 3a229b    ld      a,($9b22)
3f52 6f        ld      l,a
3f53 17        rla     
3f54 9f        sbc     a,a
3f55 67        ld      h,a
3f56 7b        ld      a,e
3f57 95        sub     l
3f58 6f        ld      l,a
3f59 7a        ld      a,d
3f5a 9c        sbc     a,h
3f5b 67        ld      h,a
3f5c eb        ex      de,hl
3f5d 3a5185    ld      a,($8551)
3f60 6f        ld      l,a
3f61 17        rla     
3f62 9f        sbc     a,a
3f63 67        ld      h,a
3f64 19        add     hl,de
3f65 225485    ld      ($8554),hl
3f68 115485    ld      de,$8554
3f6b 215685    ld      hl,$8556
3f6e cd2840    call    $4028
3f71 015285    ld      bc,$8552
3f74 115185    ld      de,$8551
3f77 215685    ld      hl,$8556
3f7a cd5a3d    call    $3d5a
3f7d 3a5285    ld      a,($8552)
3f80 b7        or      a
3f81 ca873f    jp      z,$3f87
3f84 cd0e3d    call    $3d0e
3f87 215385    ld      hl,$8553
3f8a cd9c77    call    $779c
3f8d 3a5385    ld      a,($8553)
3f90 b7        or      a
3f91 c2cd3f    jp      nz,$3fcd
3f94 3a5185    ld      a,($8551)
3f97 3c        inc     a
3f98 325185    ld      ($8551),a
3f9b d618      sub     $18
3f9d 3d        dec     a
3f9e d67f      sub     $7f
3fa0 9f        sbc     a,a
3fa1 32a885    ld      ($85a8),a
3fa4 b7        or      a
3fa5 caad3f    jp      z,$3fad
3fa8 3e01      ld      a,$01
3faa 325185    ld      ($8551),a
3fad 3a5185    ld      a,($8551)
3fb0 21249b    ld      hl,$9b24
3fb3 96        sub     (hl)
3fb4 c6ff      add     a,$ff
3fb6 9f        sbc     a,a
3fb7 32a885    ld      ($85a8),a
3fba b7        or      a
3fbb c22d3f    jp      nz,$3f2d
3fbe 3a229b    ld      a,($9b22)
3fc1 325185    ld      ($8551),a
3fc4 3eff      ld      a,$ff
3fc6 32159b    ld      ($9b15),a
3fc9 cd0e3d    call    $3d0e
3fcc c9        ret     

3fcd af        xor     a
3fce 32159b    ld      ($9b15),a
3fd1 3a5185    ld      a,($8551)
3fd4 3c        inc     a
3fd5 32249b    ld      ($9b24),a
3fd8 6f        ld      l,a
3fd9 17        rla     
3fda 9f        sbc     a,a
3fdb 67        ld      h,a
3fdc cdde7f    call    $7fde
3fdf 21a985    ld      hl,$85a9
3fe2 cded7d    call    $7ded
3fe5 3d        dec     a
3fe6 d67f      sub     $7f
3fe8 9f        sbc     a,a
3fe9 32a885    ld      ($85a8),a
3fec b7        or      a
3fed caf53f    jp      z,$3ff5
3ff0 3e01      ld      a,$01
3ff2 32249b    ld      ($9b24),a
3ff5 cd0e3d    call    $3d0e
3ff8 c9        ret     

3ff9 015285    ld      bc,$8552
3ffc 115185    ld      de,$8551
3fff 21e89c    ld      hl,$9ce8
4002 cd5a3d    call    $3d5a
4005 c37d3f    jp      $3f7d
4008 015285    ld      bc,$8552
400b 115185    ld      de,$8551
400e 21389d    ld      hl,$9d38
4011 cd5a3d    call    $3d5a
4014 c37d3f    jp      $3f7d
4017 112440    ld      de,$4024
401a 21d89d    ld      hl,$9dd8
401d cd8844    call    $4488
4020 cd0a3d    call    $3d0a
4023 c9        ret     

4024 80        add     a,b
4025 07        rlca    
4026 00        nop     
4027 00        nop     
4028 22b185    ld      ($85b1),hl
402b eb        ex      de,hl
402c 22b385    ld      ($85b3),hl
402f 01b985    ld      bc,$85b9
4032 2ab385    ld      hl,($85b3)
4035 eb        ex      de,hl
4036 2ab185    ld      hl,($85b1)
4039 cd4740    call    $4047
403c c9        ret     

403d 11c49a    ld      de,$9ac4
4040 21989c    ld      hl,$9c98
4043 cd2840    call    $4028
4046 c9        ret     

4047 22bf85    ld      ($85bf),hl
404a eb        ex      de,hl
404b 22c185    ld      ($85c1),hl
404e 3e02      ld      a,$02
4050 21c385    ld      hl,$85c3
4053 cd6582    call    $8265
4056 af        xor     a
4057 2ac385    ld      hl,($85c3)
405a 77        ld      (hl),a
405b 11d540    ld      de,$40d5
405e 2abf85    ld      hl,($85bf)
4061 cd8344    call    $4483
4064 11c89a    ld      de,$9ac8
4067 2ac185    ld      hl,($85c1)
406a cd5038    call    $3850
406d 32d085    ld      ($85d0),a
4070 2ac185    ld      hl,($85c1)
4073 cdff38    call    $38ff
4076 21d085    ld      hl,$85d0
4079 b6        or      (hl)
407a 32d185    ld      ($85d1),a
407d b7        or      a
407e ca8240    jp      z,$4082
4081 c9        ret     

4082 2ac185    ld      hl,($85c1)
4085 eb        ex      de,hl
4086 21ca85    ld      hl,$85ca
4089 cdf842    call    $42f8
408c 3a619b    ld      a,($9b61)
408f 325a9b    ld      ($9b5a),a
4092 01d940    ld      bc,$40d9
4095 11ca85    ld      de,$85ca
4098 2ac585    ld      hl,($85c5)
409b cd8001    call    $0180
409e 2ac585    ld      hl,($85c5)
40a1 cdb241    call    $41b2
40a4 32d085    ld      ($85d0),a
40a7 b7        or      a
40a8 caac40    jp      z,$40ac
40ab c9        ret     

40ac 3a629b    ld      a,($9b62)
40af 325a9b    ld      ($9b5a),a
40b2 210300    ld      hl,$0003
40b5 eb        ex      de,hl
40b6 2ac585    ld      hl,($85c5)
40b9 19        add     hl,de
40ba 7e        ld      a,(hl)
40bb 2ac385    ld      hl,($85c3)
40be 77        ld      (hl),a
40bf 7e        ld      a,(hl)
40c0 6f        ld      l,a
40c1 17        rla     
40c2 9f        sbc     a,a
40c3 67        ld      h,a
40c4 22c785    ld      ($85c7),hl
40c7 01c785    ld      bc,$85c7
40ca 2ac585    ld      hl,($85c5)
40cd eb        ex      de,hl
40ce 2abf85    ld      hl,($85bf)
40d1 cd8001    call    $0180
40d4 c9        ret     

40d5 50        ld      d,b
40d6 00        nop     
40d7 00        nop     
40d8 00        nop     
40d9 04        inc     b
40da 00        nop     
40db 00        nop     
40dc 00        nop     
40dd 22db85    ld      ($85db),hl
40e0 11c89a    ld      de,$9ac8
40e3 2adb85    ld      hl,($85db)
40e6 cd5038    call    $3850
40e9 32e285    ld      ($85e2),a
40ec 2adb85    ld      hl,($85db)
40ef cdff38    call    $38ff
40f2 21e285    ld      hl,$85e2
40f5 b6        or      (hl)
40f6 32e385    ld      ($85e3),a
40f9 b7        or      a
40fa c22641    jp      nz,$4126
40fd 2adb85    ld      hl,($85db)
4100 eb        ex      de,hl
4101 21dd85    ld      hl,$85dd
4104 cdf842    call    $42f8
4107 112f41    ld      de,$412f
410a 21dd85    ld      hl,$85dd
410d cdec41    call    $41ec
4110 3a619b    ld      a,($9b61)
4113 325a9b    ld      ($9b5a),a
4116 012b41    ld      bc,$412b
4119 11dd85    ld      de,$85dd
411c 21d385    ld      hl,$85d3
411f cd8001    call    $0180
4122 3ad385    ld      a,($85d3)
4125 c9        ret     

4126 af        xor     a
4127 32d385    ld      ($85d3),a
412a c9        ret     

412b 010000    ld      bc,$0000
412e 00        nop     
412f 03        inc     bc
4130 00        nop     
4131 00        nop     
4132 00        nop     
4133 22e585    ld      ($85e5),hl
4136 eb        ex      de,hl
4137 22e785    ld      ($85e7),hl
413a 014841    ld      bc,$4148
413d 2ae785    ld      hl,($85e7)
4140 eb        ex      de,hl
4141 2ae585    ld      hl,($85e5)
4144 cd3744    call    $4437
4147 c9        ret     

4148 03        inc     bc
4149 00        nop     
414a 00        nop     
414b 00        nop     
414c 22f285    ld      ($85f2),hl
414f eb        ex      de,hl
4150 22f485    ld      ($85f4),hl
4153 210100    ld      hl,$0001
4156 eb        ex      de,hl
4157 2af285    ld      hl,($85f2)
415a 19        add     hl,de
415b 22f685    ld      ($85f6),hl
415e 210100    ld      hl,$0001
4161 eb        ex      de,hl
4162 2af485    ld      hl,($85f4)
4165 19        add     hl,de
4166 22f885    ld      ($85f8),hl
4169 210200    ld      hl,$0002
416c eb        ex      de,hl
416d 2af285    ld      hl,($85f2)
4170 19        add     hl,de
4171 22fa85    ld      ($85fa),hl
4174 210200    ld      hl,$0002
4177 eb        ex      de,hl
4178 2af485    ld      hl,($85f4)
417b 19        add     hl,de
417c 22fc85    ld      ($85fc),hl
417f 2afa85    ld      hl,($85fa)
4182 7e        ld      a,(hl)
4183 2afc85    ld      hl,($85fc)
4186 96        sub     (hl)
4187 d601      sub     $01
4189 9f        sbc     a,a
418a 32fe85    ld      ($85fe),a
418d 2af685    ld      hl,($85f6)
4190 7e        ld      a,(hl)
4191 2af885    ld      hl,($85f8)
4194 96        sub     (hl)
4195 d601      sub     $01
4197 9f        sbc     a,a
4198 32ff85    ld      ($85ff),a
419b 2af285    ld      hl,($85f2)
419e 7e        ld      a,(hl)
419f 2af485    ld      hl,($85f4)
41a2 96        sub     (hl)
41a3 d601      sub     $01
41a5 9f        sbc     a,a
41a6 21ff85    ld      hl,$85ff
41a9 a6        and     (hl)
41aa 21fe85    ld      hl,$85fe
41ad a6        and     (hl)
41ae 32ea85    ld      ($85ea),a
41b1 c9        ret     

41b2 220986    ld      ($8609),hl
41b5 210100    ld      hl,$0001
41b8 eb        ex      de,hl
41b9 2a0986    ld      hl,($8609)
41bc 19        add     hl,de
41bd 220b86    ld      ($860b),hl
41c0 210200    ld      hl,$0002
41c3 eb        ex      de,hl
41c4 2a0986    ld      hl,($8609)
41c7 19        add     hl,de
41c8 7e        ld      a,(hl)
41c9 d601      sub     $01
41cb 9f        sbc     a,a
41cc 320d86    ld      ($860d),a
41cf 2a0b86    ld      hl,($860b)
41d2 7e        ld      a,(hl)
41d3 d601      sub     $01
41d5 9f        sbc     a,a
41d6 320e86    ld      ($860e),a
41d9 2a0986    ld      hl,($8609)
41dc 7e        ld      a,(hl)
41dd d601      sub     $01
41df 9f        sbc     a,a
41e0 210e86    ld      hl,$860e
41e3 a6        and     (hl)
41e4 210d86    ld      hl,$860d
41e7 a6        and     (hl)
41e8 320186    ld      ($8601),a
41eb c9        ret     

41ec 221086    ld      ($8610),hl
41ef eb        ex      de,hl
41f0 221286    ld      ($8612),hl
41f3 210000    ld      hl,$0000
41f6 221486    ld      ($8614),hl
41f9 2a1086    ld      hl,($8610)
41fc 7e        ld      a,(hl)
41fd 321486    ld      ($8614),a
4200 2a1486    ld      hl,($8614)
4203 221686    ld      ($8616),hl
4206 210100    ld      hl,$0001
4209 eb        ex      de,hl
420a 2a1086    ld      hl,($8610)
420d 19        add     hl,de
420e 7e        ld      a,(hl)
420f 321486    ld      ($8614),a
4212 2a1486    ld      hl,($8614)
4215 221886    ld      ($8618),hl
4218 210200    ld      hl,$0002
421b eb        ex      de,hl
421c 2a1086    ld      hl,($8610)
421f 19        add     hl,de
4220 7e        ld      a,(hl)
4221 321486    ld      ($8614),a
4224 2a1486    ld      hl,($8614)
4227 221a86    ld      ($861a),hl
422a 2a1286    ld      hl,($8612)
422d 7e        ld      a,(hl)
422e 321486    ld      ($8614),a
4231 2a1486    ld      hl,($8614)
4234 221c86    ld      ($861c),hl
4237 210100    ld      hl,$0001
423a eb        ex      de,hl
423b 2a1286    ld      hl,($8612)
423e 19        add     hl,de
423f 222386    ld      ($8623),hl
4242 7e        ld      a,(hl)
4243 321486    ld      ($8614),a
4246 2a1486    ld      hl,($8614)
4249 221e86    ld      ($861e),hl
424c 210000    ld      hl,$0000
424f 222086    ld      ($8620),hl
4252 2a2386    ld      hl,($8623)
4255 7e        ld      a,(hl)
4256 17        rla     
4257 9f        sbc     a,a
4258 322586    ld      ($8625),a
425b b7        or      a
425c ca6542    jp      z,$4265
425f 21ff00    ld      hl,$00ff
4262 222086    ld      ($8620),hl
4265 2a1c86    ld      hl,($861c)
4268 eb        ex      de,hl
4269 2a1686    ld      hl,($8616)
426c 19        add     hl,de
426d 221686    ld      ($8616),hl
4270 2a1e86    ld      hl,($861e)
4273 eb        ex      de,hl
4274 2a1886    ld      hl,($8618)
4277 19        add     hl,de
4278 221886    ld      ($8618),hl
427b 2a2086    ld      hl,($8620)
427e eb        ex      de,hl
427f 2a1a86    ld      hl,($861a)
4282 19        add     hl,de
4283 221a86    ld      ($861a),hl
4286 11f442    ld      de,$42f4
4289 211686    ld      hl,$8616
428c cd4639    call    $3946
428f 322586    ld      ($8625),a
4292 b7        or      a
4293 c2a742    jp      nz,$42a7
4296 2a1886    ld      hl,($8618)
4299 23        inc     hl
429a 221886    ld      ($8618),hl
429d 2a1686    ld      hl,($8616)
42a0 1100ff    ld      de,$ff00
42a3 19        add     hl,de
42a4 221686    ld      ($8616),hl
42a7 11f442    ld      de,$42f4
42aa 211886    ld      hl,$8618
42ad cd4639    call    $3946
42b0 322586    ld      ($8625),a
42b3 b7        or      a
42b4 c2c842    jp      nz,$42c8
42b7 2a1a86    ld      hl,($861a)
42ba 23        inc     hl
42bb 221a86    ld      ($861a),hl
42be 2a1886    ld      hl,($8618)
42c1 1100ff    ld      de,$ff00
42c4 19        add     hl,de
42c5 221886    ld      ($8618),hl
42c8 3a1686    ld      a,($8616)
42cb 2a1086    ld      hl,($8610)
42ce 77        ld      (hl),a
42cf 210100    ld      hl,$0001
42d2 eb        ex      de,hl
42d3 2a1086    ld      hl,($8610)
42d6 19        add     hl,de
42d7 222386    ld      ($8623),hl
42da 3a1886    ld      a,($8618)
42dd 2a2386    ld      hl,($8623)
42e0 77        ld      (hl),a
42e1 210200    ld      hl,$0002
42e4 eb        ex      de,hl
42e5 2a1086    ld      hl,($8610)
42e8 19        add     hl,de
42e9 222686    ld      ($8626),hl
42ec 3a1a86    ld      a,($861a)
42ef 2a2686    ld      hl,($8626)
42f2 77        ld      (hl),a
42f3 c9        ret     

42f4 00        nop     
42f5 010000    ld      bc,$0000
42f8 222986    ld      ($8629),hl
42fb eb        ex      de,hl
42fc 222b86    ld      ($862b),hl
42ff 111e43    ld      de,$431e
4302 2a2986    ld      hl,($8629)
4305 cd2243    call    $4322
4308 2a2b86    ld      hl,($862b)
430b 7e        ld      a,(hl)
430c 23        inc     hl
430d 66        ld      h,(hl)
430e 6f        ld      l,a
430f 29        add     hl,hl
4310 29        add     hl,hl
4311 222d86    ld      ($862d),hl
4314 112d86    ld      de,$862d
4317 2a2986    ld      hl,($8629)
431a cdec41    call    $41ec
431d c9        ret     

431e 00        nop     
431f 02        ld      (bc),a
4320 00        nop     
4321 00        nop     
4322 223086    ld      ($8630),hl
4325 eb        ex      de,hl
4326 223286    ld      ($8632),hl
4329 2a3286    ld      hl,($8632)
432c 7e        ld      a,(hl)
432d 2a3086    ld      hl,($8630)
4330 77        ld      (hl),a
4331 210100    ld      hl,$0001
4334 eb        ex      de,hl
4335 2a3086    ld      hl,($8630)
4338 19        add     hl,de
4339 223486    ld      ($8634),hl
433c 210100    ld      hl,$0001
433f eb        ex      de,hl
4340 2a3286    ld      hl,($8632)
4343 19        add     hl,de
4344 7e        ld      a,(hl)
4345 2a3486    ld      hl,($8634)
4348 77        ld      (hl),a
4349 210200    ld      hl,$0002
434c eb        ex      de,hl
434d 2a3086    ld      hl,($8630)
4350 19        add     hl,de
4351 223686    ld      ($8636),hl
4354 af        xor     a
4355 2a3686    ld      hl,($8636)
4358 77        ld      (hl),a
4359 c9        ret     

435a 224186    ld      ($8641),hl
435d 2a4186    ld      hl,($8641)
4360 7e        ld      a,(hl)
4361 d610      sub     $10
4363 3d        dec     a
4364 c681      add     a,$81
4366 9f        sbc     a,a
4367 324386    ld      ($8643),a
436a 2a4186    ld      hl,($8641)
436d 7e        ld      a,(hl)
436e 17        rla     
436f 3f        ccf     
4370 9f        sbc     a,a
4371 214386    ld      hl,$8643
4374 a6        and     (hl)
4375 323986    ld      ($8639),a
4378 c9        ret     

4379 018643    ld      bc,$4386
437c 11989c    ld      de,$9c98
437f 21889d    ld      hl,$9d88
4382 cd3744    call    $4437
4385 c9        ret     

4386 50        ld      d,b
4387 00        nop     
4388 00        nop     
4389 00        nop     
438a c9        ret     

438b 7e        ld      a,(hl)
438c 23        inc     hl
438d 66        ld      h,(hl)
438e 6f        ld      l,a
438f 7e        ld      a,(hl)
4390 c9        ret     

4391 7e        ld      a,(hl)
4392 23        inc     hl
4393 66        ld      h,(hl)
4394 6f        ld      l,a
4395 1a        ld      a,(de)
4396 77        ld      (hl),a
4397 c9        ret     

4398 7e        ld      a,(hl)
4399 eb        ex      de,hl
439a 5e        ld      e,(hl)
439b 57        ld      d,a
439c cd5878    call    $7858
439f c9        ret     

43a0 0e19      ld      c,$19
43a2 cd0500    call    $0005
43a5 f5        push    af
43a6 0e0d      ld      c,$0d
43a8 cd0500    call    $0005
43ab f1        pop     af
43ac 5f        ld      e,a
43ad 1600      ld      d,$00
43af 0e0e      ld      c,$0e
43b1 c30500    jp      $0005
43b4 c9        ret     

43b5 c9        ret     

43b6 0e0f      ld      c,$0f
43b8 eb        ex      de,hl
43b9 e5        push    hl
43ba cd0500    call    $0005
43bd e1        pop     hl
43be 77        ld      (hl),a
43bf c9        ret     

43c0 0e10      ld      c,$10
43c2 c3b843    jp      $43b8
43c5 0e11      ld      c,$11
43c7 c3b843    jp      $43b8
43ca 0e12      ld      c,$12
43cc c3b843    jp      $43b8
43cf 0e11      ld      c,$11
43d1 c3b843    jp      $43b8
43d4 0e12      ld      c,$12
43d6 c3b843    jp      $43b8
43d9 0e13      ld      c,$13
43db eb        ex      de,hl
43dc c30500    jp      $0005
43df 0e14      ld      c,$14
43e1 c3b843    jp      $43b8
43e4 0e21      ld      c,$21
43e6 c3b843    jp      $43b8
43e9 0e22      ld      c,$22
43eb c3b843    jp      $43b8
43ee 0e15      ld      c,$15
43f0 c3b843    jp      $43b8
43f3 0e16      ld      c,$16
43f5 c3b843    jp      $43b8
43f8 0e17      ld      c,$17
43fa c3b843    jp      $43b8
43fd 0e18      ld      c,$18
43ff e5        push    hl
4400 cd0500    call    $0005
4403 e1        pop     hl
4404 77        ld      (hl),a
4405 c9        ret     

4406 0e1a      ld      c,$1a
4408 eb        ex      de,hl
4409 c30500    jp      $0005
440c 7e        ld      a,(hl)
440d 23        inc     hl
440e 66        ld      h,(hl)
440f 6f        ld      l,a
4410 c30644    jp      $4406
4413 0e19      ld      c,$19
4415 c3ff43    jp      $43ff
4418 e5        push    hl
4419 60        ld      h,b
441a 69        ld      l,c
441b 4e        ld      c,(hl)
441c 23        inc     hl
441d 46        ld      b,(hl)
441e e1        pop     hl
441f eb        ex      de,hl
4420 cd2e44    call    $442e
4423 78        ld      a,b
4424 b1        or      c
4425 c8        ret     z

4426 7e        ld      a,(hl)
4427 12        ld      (de),a
4428 23        inc     hl
4429 13        inc     de
442a 0b        dec     bc
442b c32344    jp      $4423
442e f5        push    af
442f 78        ld      a,b
4430 b1        or      c
4431 c23544    jp      nz,$4435
4434 f1        pop     af
4435 f1        pop     af
4436 c9        ret     

4437 e5        push    hl
4438 60        ld      h,b
4439 69        ld      l,c
443a 4e        ld      c,(hl)
443b 0600      ld      b,$00
443d c31e44    jp      $441e
4440 e5        push    hl
4441 60        ld      h,b
4442 69        ld      l,c
4443 4e        ld      c,(hl)
4444 23        inc     hl
4445 46        ld      b,(hl)
4446 e1        pop     hl
4447 cd2e44    call    $442e
444a 09        add     hl,bc
444b 2b        dec     hl
444c eb        ex      de,hl
444d 09        add     hl,bc
444e 2b        dec     hl
444f 78        ld      a,b
4450 b1        or      c
4451 c8        ret     z

4452 7e        ld      a,(hl)
4453 12        ld      (de),a
4454 2b        dec     hl
4455 1b        dec     de
4456 0b        dec     bc
4457 c34f44    jp      $444f
445a e5        push    hl
445b 60        ld      h,b
445c 69        ld      l,c
445d 4e        ld      c,(hl)
445e 0600      ld      b,$00
4460 c34644    jp      $4446
4463 1a        ld      a,(de)
4464 50        ld      d,b
4465 59        ld      e,c
4466 eb        ex      de,hl
4467 4e        ld      c,(hl)
4468 23        inc     hl
4469 46        ld      b,(hl)
446a 62        ld      h,d
446b 6b        ld      l,e
446c cd2e44    call    $442e
446f 0b        dec     bc
4470 13        inc     de
4471 77        ld      (hl),a
4472 cd2e44    call    $442e
4475 cd2344    call    $4423
4478 c9        ret     

4479 1a        ld      a,(de)
447a 50        ld      d,b
447b 59        ld      e,c
447c eb        ex      de,hl
447d 4e        ld      c,(hl)
447e 0600      ld      b,$00
4480 c36a44    jp      $446a
4483 3e20      ld      a,$20
4485 c37c44    jp      $447c
4488 3e20      ld      a,$20
448a c36644    jp      $4466
448d eb        ex      de,hl
448e 2a0600    ld      hl,($0006)
4491 eb        ex      de,hl
4492 c39844    jp      $4498
4495 119c44    ld      de,$449c
4498 73        ld      (hl),e
4499 23        inc     hl
449a 72        ld      (hl),d
449b c9        ret     

449c 00        nop     
449d 224686    ld      ($8646),hl
44a0 2a4686    ld      hl,($8646)
44a3 7e        ld      a,(hl)
44a4 323e8d    ld      ($8d3e),a
44a7 3a4886    ld      a,($8648)
44aa 2f        cpl     
44ab 325586    ld      ($8655),a
44ae b7        or      a
44af c2e144    jp      nz,$44e1
44b2 cdc30b    call    $0bc3
44b5 af        xor     a
44b6 324886    ld      ($8648),a
44b9 cd2d0c    call    $0c2d
44bc cd240a    call    $0a24
44bf 217846    ld      hl,$4678
44c2 cd9201    call    $0192
44c5 217c46    ld      hl,$467c
44c8 cdaa76    call    $76aa
44cb 325586    ld      ($8655),a
44ce b7        or      a
44cf c20246    jp      nz,$4602
44d2 cdf66f    call    $6ff6
44d5 017c46    ld      bc,$467c
44d8 117646    ld      de,$4676
44db 215686    ld      hl,$8656
44de cd1303    call    $0313
44e1 3a3e8d    ld      a,($8d3e)
44e4 2a4686    ld      hl,($8646)
44e7 ae        xor     (hl)
44e8 325586    ld      ($8655),a
44eb b7        or      a
44ec c25746    jp      nz,$4657
44ef cdf450    call    $50f4
44f2 cd8a46    call    $468a
44f5 3eff      ld      a,$ff
44f7 32988e    ld      ($8e98),a
44fa 3a5f90    ld      a,($905f)
44fd b7        or      a
44fe c2e645    jp      nz,$45e6
4501 11c790    ld      de,$90c7
4504 217390    ld      hl,$9073
4507 cd2858    call    $5828
450a 217190    ld      hl,$9071
450d cdfe36    call    $36fe
4510 215e90    ld      hl,$905e
4513 b6        or      (hl)
4514 325586    ld      ($8655),a
4517 b7        or      a
4518 c23145    jp      nz,$4531
451b cd585a    call    $5a58
451e 216e46    ld      hl,$466e
4521 cda256    call    $56a2
4524 325586    ld      ($8655),a
4527 b7        or      a
4528 c2b845    jp      nz,$45b8
452b 217e46    ld      hl,$467e
452e cdc876    call    $76c8
4531 01c790    ld      bc,$90c7
4534 117390    ld      de,$9073
4537 21c862    ld      hl,$62c8
453a cd5962    call    $6259
453d 325586    ld      ($8655),a
4540 b7        or      a
4541 c26645    jp      nz,$4566
4544 3ace90    ld      a,($90ce)
4547 214d86    ld      hl,$864d
454a 96        sub     (hl)
454b d601      sub     $01
454d 9f        sbc     a,a
454e 325586    ld      ($8655),a
4551 b7        or      a
4552 c2e144    jp      nz,$44e1
4555 3a6b90    ld      a,($906b)
4558 2f        cpl     
4559 325586    ld      ($8655),a
455c b7        or      a
455d c22b45    jp      nz,$452b
4560 cd2802    call    $0228
4563 c3d245    jp      $45d2
4566 118246    ld      de,$4682
4569 21958e    ld      hl,$8e95
456c cd9238    call    $3892
456f 325586    ld      ($8655),a
4572 b7        or      a
4573 c29d45    jp      nz,$459d
4576 2a958e    ld      hl,($8e95)
4579 11d6ff    ld      de,$ffd6
457c 19        add     hl,de
457d 22958e    ld      ($8e95),hl
4580 118646    ld      de,$4686
4583 21958e    ld      hl,$8e95
4586 cd9238    call    $3892
4589 325586    ld      ($8655),a
458c b7        or      a
458d c2a645    jp      nz,$45a6
4590 2a958e    ld      hl,($8e95)
4593 11dcff    ld      de,$ffdc
4596 19        add     hl,de
4597 22958e    ld      ($8e95),hl
459a c3af45    jp      $45af
459d 21958e    ld      hl,$8e95
45a0 cd594b    call    $4b59
45a3 c3be45    jp      $45be
45a6 21958e    ld      hl,$8e95
45a9 cd9e01    call    $019e
45ac c3be45    jp      $45be
45af 21958e    ld      hl,$8e95
45b2 cd1401    call    $0114
45b5 c3d245    jp      $45d2
45b8 216e46    ld      hl,$466e
45bb cd1401    call    $0114
45be 3a308e    ld      a,($8e30)
45c1 b7        or      a
45c2 cace45    jp      z,$45ce
45c5 11f091    ld      de,$91f0
45c8 21f291    ld      hl,$91f2
45cb cd2a62    call    $622a
45ce af        xor     a
45cf 32308e    ld      ($8e30),a
45d2 3a718d    ld      a,($8d71)
45d5 b7        or      a
45d6 c20145    jp      nz,$4501
45d9 3a5e90    ld      a,($905e)
45dc b7        or      a
45dd c2e144    jp      nz,$44e1
45e0 217e46    ld      hl,$467e
45e3 cdc876    call    $76c8
45e6 3a3a8d    ld      a,($8d3a)
45e9 d601      sub     $01
45eb 9f        sbc     a,a
45ec 325586    ld      ($8655),a
45ef b7        or      a
45f0 c25746    jp      nz,$4657
45f3 017246    ld      bc,$4672
45f6 115e86    ld      de,$865e
45f9 21c862    ld      hl,$62c8
45fc cd5962    call    $6259
45ff c36645    jp      $4566
4602 af        xor     a
4603 326890    ld      ($9068),a
4606 af        xor     a
4607 323d8d    ld      ($8d3d),a
460a af        xor     a
460b 327090    ld      ($9070),a
460e 210000    ld      hl,$0000
4611 226186    ld      ($8661),hl
4614 af        xor     a
4615 323b8d    ld      ($8d3b),a
4618 af        xor     a
4619 325f90    ld      ($905f),a
461c 3a578d    ld      a,($8d57)
461f b7        or      a
4620 c23246    jp      nz,$4632
4623 af        xor     a
4624 323a8d    ld      ($8d3a),a
4627 af        xor     a
4628 326490    ld      ($9064),a
462b af        xor     a
462c 323e8d    ld      ($8d3e),a
462f c3e144    jp      $44e1
4632 af        xor     a
4633 32578d    ld      ($8d57),a
4636 3a6490    ld      a,($9064)
4639 323a8d    ld      ($8d3a),a
463c cdf450    call    $50f4
463f 116a46    ld      de,$466a
4642 216e46    ld      hl,$466e
4645 cd4b70    call    $704b
4648 21588d    ld      hl,$8d58
464b cd714f    call    $4f71
464e 214c86    ld      hl,$864c
4651 cda377    call    $77a3
4654 c3ef44    jp      $44ef
4657 af        xor     a
4658 325f90    ld      ($905f),a
465b 2a4686    ld      hl,($8646)
465e 7e        ld      a,(hl)
465f b7        or      a
4660 ca6946    jp      z,$4669
4663 214986    ld      hl,$8649
4666 cda377    call    $77a3
4669 c9        ret     

466a 010000    ld      bc,$0000
466d 00        nop     
466e 00        nop     
466f 00        nop     
4670 00        nop     
4671 00        nop     
4672 03        inc     bc
4673 00        nop     
4674 00        nop     
4675 00        nop     
4676 00        nop     
4677 00        nop     
4678 0f        rrca    
4679 00        nop     
467a 00        nop     
467b 00        nop     
467c ff        rst     $38
467d ff        rst     $38
467e 1000      djnz    $4680
4680 00        nop     
4681 00        nop     
4682 2a0000    ld      hl,($0000)
4685 00        nop     
4686 24        inc     h
4687 00        nop     
4688 00        nop     
4689 00        nop     
468a 3eff      ld      a,$ff
468c 325e90    ld      ($905e),a
468f 210100    ld      hl,$0001
4692 22cc90    ld      ($90cc),hl
4695 cd2a4b    call    $4b2a
4698 3a6f90    ld      a,($906f)
469b b7        or      a
469c c2a946    jp      nz,$46a9
469f 3a6190    ld      a,($9061)
46a2 b7        or      a
46a3 caa946    jp      z,$46a9
46a6 cd3552    call    $5235
46a9 cdaa47    call    $47aa
46ac 3a5f90    ld      a,($905f)
46af b7        or      a
46b0 cab446    jp      z,$46b4
46b3 c9        ret     

46b4 21d390    ld      hl,$90d3
46b7 cdfe36    call    $36fe
46ba 326f86    ld      ($866f),a
46bd b7        or      a
46be c29f47    jp      nz,$479f
46c1 2ad390    ld      hl,($90d3)
46c4 11d490    ld      de,$90d4
46c7 19        add     hl,de
46c8 7e        ld      a,(hl)
46c9 216686    ld      hl,$8666
46cc 96        sub     (hl)
46cd c6ff      add     a,$ff
46cf 9f        sbc     a,a
46d0 326f86    ld      ($866f),a
46d3 b7        or      a
46d4 c2e146    jp      nz,$46e1
46d7 2ad390    ld      hl,($90d3)
46da 2b        dec     hl
46db 22d390    ld      ($90d3),hl
46de c3b446    jp      $46b4
46e1 3ad590    ld      a,($90d5)
46e4 32ce90    ld      ($90ce),a
46e7 3a6f90    ld      a,($906f)
46ea 2f        cpl     
46eb 326f86    ld      ($866f),a
46ee 3a3d8d    ld      a,($8d3d)
46f1 2f        cpl     
46f2 216f86    ld      hl,$866f
46f5 a6        and     (hl)
46f6 216290    ld      hl,$9062
46f9 a6        and     (hl)
46fa 326986    ld      ($8669),a
46fd af        xor     a
46fe 326886    ld      ($8668),a
4701 210000    ld      hl,$0000
4704 227086    ld      ($8670),hl
4707 3ace90    ld      a,($90ce)
470a 216586    ld      hl,$8665
470d 96        sub     (hl)
470e c6ff      add     a,$ff
4710 9f        sbc     a,a
4711 326f86    ld      ($866f),a
4714 b7        or      a
4715 c23b47    jp      nz,$473b
4718 3eff      ld      a,$ff
471a 326886    ld      ($8668),a
471d 3ad690    ld      a,($90d6)
4720 216586    ld      hl,$8665
4723 96        sub     (hl)
4724 c6ff      add     a,$ff
4726 9f        sbc     a,a
4727 326f86    ld      ($866f),a
472a b7        or      a
472b c23b47    jp      nz,$473b
472e 3a3d8d    ld      a,($8d3d)
4731 2f        cpl     
4732 326986    ld      ($8669),a
4735 210200    ld      hl,$0002
4738 227086    ld      ($8670),hl
473b 3a6986    ld      a,($8669)
473e 2f        cpl     
473f 326f86    ld      ($866f),a
4742 b7        or      a
4743 c29347    jp      nz,$4793
4746 2a7086    ld      hl,($8670)
4749 11d590    ld      de,$90d5
474c 19        add     hl,de
474d 227286    ld      ($8672),hl
4750 2ad390    ld      hl,($90d3)
4753 eb        ex      de,hl
4754 2a7086    ld      hl,($8670)
4757 7b        ld      a,e
4758 95        sub     l
4759 6f        ld      l,a
475a 7a        ld      a,d
475b 9c        sbc     a,h
475c 67        ld      h,a
475d 227486    ld      ($8674),hl
4760 117486    ld      de,$8674
4763 2a7286    ld      hl,($8672)
4766 cda561    call    $61a5
4769 2ad390    ld      hl,($90d3)
476c 11d490    ld      de,$90d4
476f 19        add     hl,de
4770 227286    ld      ($8672),hl
4773 3a6886    ld      a,($8668)
4776 2f        cpl     
4777 326f86    ld      ($866f),a
477a 2a7286    ld      hl,($8672)
477d 7e        ld      a,(hl)
477e 216786    ld      hl,$8667
4781 96        sub     (hl)
4782 c6ff      add     a,$ff
4784 9f        sbc     a,a
4785 216f86    ld      hl,$866f
4788 b6        or      (hl)
4789 327686    ld      ($8676),a
478c b7        or      a
478d ca9347    jp      z,$4793
4790 cd9061    call    $6190
4793 3a6886    ld      a,($8668)
4796 b7        or      a
4797 c28f46    jp      nz,$468f
479a af        xor     a
479b 325e90    ld      ($905e),a
479e c9        ret     

479f 3a3b8d    ld      a,($8d3b)
47a2 b7        or      a
47a3 caa747    jp      z,$47a7
47a6 c9        ret     

47a7 c38f46    jp      $468f
47aa 210000    ld      hl,$0000
47ad 22d390    ld      ($90d3),hl
47b0 3a5f90    ld      a,($905f)
47b3 b7        or      a
47b4 cabd47    jp      z,$47bd
47b7 21224b    ld      hl,$4b22
47ba cdc876    call    $76c8
47bd 210000    ld      hl,$0000
47c0 228b86    ld      ($868b),hl
47c3 210000    ld      hl,$0000
47c6 228d86    ld      ($868d),hl
47c9 af        xor     a
47ca 329592    ld      ($9295),a
47cd af        xor     a
47ce 328386    ld      ($8683),a
47d1 af        xor     a
47d2 328786    ld      ($8687),a
47d5 af        xor     a
47d6 327886    ld      ($8678),a
47d9 3a7886    ld      a,($8678)
47dc 327986    ld      ($8679),a
47df 3a6f90    ld      a,($906f)
47e2 b7        or      a
47e3 c24448    jp      nz,$4844
47e6 3a6190    ld      a,($9061)
47e9 b7        or      a
47ea c24d48    jp      nz,$484d
47ed 3a9592    ld      a,($9295)
47f0 3d        dec     a
47f1 d67f      sub     $7f
47f3 9f        sbc     a,a
47f4 328f86    ld      ($868f),a
47f7 b7        or      a
47f8 c22448    jp      nz,$4824
47fb 019592    ld      bc,$9295
47fe 114492    ld      de,$9244
4801 215f90    ld      hl,$905f
4804 cd7d36    call    $367d
4807 3e01      ld      a,$01
4809 329692    ld      ($9296),a
480c 3a9592    ld      a,($9295)
480f 3c        inc     a
4810 329592    ld      ($9295),a
4813 114392    ld      de,$9243
4816 6f        ld      l,a
4817 17        rla     
4818 9f        sbc     a,a
4819 67        ld      h,a
481a 19        add     hl,de
481b 229086    ld      ($8690),hl
481e 3e0d      ld      a,$0d
4820 2a9086    ld      hl,($8690)
4823 77        ld      (hl),a
4824 3a9692    ld      a,($9296)
4827 114392    ld      de,$9243
482a 6f        ld      l,a
482b 17        rla     
482c 9f        sbc     a,a
482d 67        ld      h,a
482e 19        add     hl,de
482f 7e        ld      a,(hl)
4830 327886    ld      ($8678),a
4833 3a9692    ld      a,($9296)
4836 3c        inc     a
4837 329692    ld      ($9296),a
483a 3a9592    ld      a,($9295)
483d 3d        dec     a
483e 329592    ld      ($9295),a
4841 c35f48    jp      $485f
4844 217886    ld      hl,$8678
4847 cda377    call    $77a3
484a c35f48    jp      $485f
484d 213a8d    ld      hl,$8d3a
4850 cdb771    call    $71b7
4853 111a4b    ld      de,$4b1a
4856 217886    ld      hl,$8678
4859 cd6c70    call    $706c
485c 325f90    ld      ($905f),a
485f 3a5f90    ld      a,($905f)
4862 b7        or      a
4863 c21e4a    jp      nz,$4a1e
4866 3a8786    ld      a,($8687)
4869 b7        or      a
486a c2b448    jp      nz,$48b4
486d 3a7886    ld      a,($8678)
4870 218286    ld      hl,$8682
4873 96        sub     (hl)
4874 d601      sub     $01
4876 9f        sbc     a,a
4877 328f86    ld      ($868f),a
487a 21d390    ld      hl,$90d3
487d cdfe36    call    $36fe
4880 218f86    ld      hl,$868f
4883 a6        and     (hl)
4884 328786    ld      ($8687),a
4887 3a7886    ld      a,($8678)
488a 218186    ld      hl,$8681
488d 96        sub     (hl)
488e d601      sub     $01
4890 9f        sbc     a,a
4891 329286    ld      ($8692),a
4894 b7        or      a
4895 c29049    jp      nz,$4990
4898 3a3d8d    ld      a,($8d3d)
489b 2f        cpl     
489c 328f86    ld      ($868f),a
489f 3a7886    ld      a,($8678)
48a2 217f86    ld      hl,$867f
48a5 96        sub     (hl)
48a6 d601      sub     $01
48a8 9f        sbc     a,a
48a9 218f86    ld      hl,$868f
48ac a6        and     (hl)
48ad 329286    ld      ($8692),a
48b0 b7        or      a
48b1 c2a74a    jp      nz,$4aa7
48b4 3a7886    ld      a,($8678)
48b7 d608      sub     $08
48b9 d601      sub     $01
48bb 9f        sbc     a,a
48bc 328f86    ld      ($868f),a
48bf 3a7886    ld      a,($8678)
48c2 21dc91    ld      hl,$91dc
48c5 96        sub     (hl)
48c6 d601      sub     $01
48c8 9f        sbc     a,a
48c9 329286    ld      ($8692),a
48cc 3a7886    ld      a,($8678)
48cf 21df91    ld      hl,$91df
48d2 96        sub     (hl)
48d3 d601      sub     $01
48d5 9f        sbc     a,a
48d6 219286    ld      hl,$8692
48d9 b6        or      (hl)
48da 218f86    ld      hl,$868f
48dd b6        or      (hl)
48de 329386    ld      ($8693),a
48e1 b7        or      a
48e2 c2ae49    jp      nz,$49ae
48e5 3a7886    ld      a,($8678)
48e8 217a86    ld      hl,$867a
48eb 96        sub     (hl)
48ec d601      sub     $01
48ee 9f        sbc     a,a
48ef 328f86    ld      ($868f),a
48f2 b7        or      a
48f3 c27f49    jp      nz,$497f
48f6 3a7886    ld      a,($8678)
48f9 21dd91    ld      hl,$91dd
48fc 96        sub     (hl)
48fd d601      sub     $01
48ff 9f        sbc     a,a
4900 328f86    ld      ($868f),a
4903 b7        or      a
4904 c2104a    jp      nz,$4a10
4907 3a7886    ld      a,($8678)
490a 21708d    ld      hl,$8d70
490d 96        sub     (hl)
490e d601      sub     $01
4910 9f        sbc     a,a
4911 328f86    ld      ($868f),a
4914 b7        or      a
4915 c28e4a    jp      nz,$4a8e
4918 3a7886    ld      a,($8678)
491b d620      sub     $20
491d 17        rla     
491e 3f        ccf     
491f 9f        sbc     a,a
4920 328f86    ld      ($868f),a
4923 b7        or      a
4924 c2cb4a    jp      nz,$4acb
4927 3a7886    ld      a,($8678)
492a d60d      sub     $0d
492c d601      sub     $01
492e 9f        sbc     a,a
492f 328f86    ld      ($868f),a
4932 b7        or      a
4933 c21e4a    jp      nz,$4a1e
4936 3a7886    ld      a,($8678)
4939 d61a      sub     $1a
493b d601      sub     $01
493d 9f        sbc     a,a
493e 328f86    ld      ($868f),a
4941 b7        or      a
4942 c2194a    jp      nz,$4a19
4945 3a7886    ld      a,($8678)
4948 d609      sub     $09
494a c6ff      add     a,$ff
494c 9f        sbc     a,a
494d 328f86    ld      ($868f),a
4950 b7        or      a
4951 c2d947    jp      nz,$47d9
4954 2a8d86    ld      hl,($868d)
4957 110800    ld      de,$0008
495a 19        add     hl,de
495b 7c        ld      a,h
495c e6ff      and     $ff
495e 67        ld      h,a
495f 7d        ld      a,l
4960 e6f8      and     $f8
4962 6f        ld      l,a
4963 eb        ex      de,hl
4964 2a8d86    ld      hl,($868d)
4967 7b        ld      a,e
4968 95        sub     l
4969 6f        ld      l,a
496a 7a        ld      a,d
496b 9c        sbc     a,h
496c 67        ld      h,a
496d 228b86    ld      ($868b),hl
4970 3e20      ld      a,$20
4972 327886    ld      ($8678),a
4975 2a8b86    ld      hl,($868b)
4978 2b        dec     hl
4979 228b86    ld      ($868b),hl
497c c3cb4a    jp      $4acb
497f 210200    ld      hl,$0002
4982 22d390    ld      ($90d3),hl
4985 3e48      ld      a,$48
4987 32d590    ld      ($90d5),a
498a 3e45      ld      a,$45
498c 32d690    ld      ($90d6),a
498f c9        ret     

4990 3a8386    ld      a,($8683)
4993 2f        cpl     
4994 328386    ld      ($8683),a
4997 3a7986    ld      a,($8679)
499a c6ff      add     a,$ff
499c 9f        sbc     a,a
499d 328f86    ld      ($868f),a
49a0 b7        or      a
49a1 c2cb4a    jp      nz,$4acb
49a4 2ad390    ld      hl,($90d3)
49a7 2b        dec     hl
49a8 22d390    ld      ($90d3),hl
49ab c3cb4a    jp      $4acb
49ae 210100    ld      hl,$0001
49b1 228b86    ld      ($868b),hl
49b4 218d86    ld      hl,$868d
49b7 cdfe36    call    $36fe
49ba 328f86    ld      ($868f),a
49bd b7        or      a
49be c2d947    jp      nz,$47d9
49c1 3a6f90    ld      a,($906f)
49c4 b7        or      a
49c5 cace49    jp      z,$49ce
49c8 217b86    ld      hl,$867b	 	backspace, space, backspace
49cb cd1c78    call    $781c		print string$ at addr [HL]
49ce 2ad390    ld      hl,($90d3)
49d1 11d490    ld      de,$90d4
49d4 19        add     hl,de
49d5 7e        ld      a,(hl)
49d6 218186    ld      hl,$8681
49d9 96        sub     (hl)
49da d601      sub     $01
49dc 9f        sbc     a,a
49dd 328f86    ld      ($868f),a
49e0 b7        or      a
49e1 caeb49    jp      z,$49eb
49e4 3a8386    ld      a,($8683)
49e7 2f        cpl     
49e8 328386    ld      ($8683),a
49eb 2ad390    ld      hl,($90d3)
49ee 2b        dec     hl
49ef 22d390    ld      ($90d3),hl
49f2 2a8b86    ld      hl,($868b)
49f5 2b        dec     hl
49f6 228b86    ld      ($868b),hl
49f9 2a8d86    ld      hl,($868d)
49fc 2b        dec     hl
49fd 228d86    ld      ($868d),hl
4a00 218b86    ld      hl,$868b
4a03 cdfe36    call    $36fe
4a06 328f86    ld      ($868f),a
4a09 b7        or      a
4a0a c2d947    jp      nz,$47d9
4a0d c3b449    jp      $49b4
4a10 2a8d86    ld      hl,($868d)
4a13 228b86    ld      ($868b),hl
4a16 c3b449    jp      $49b4
4a19 3eff      ld      a,$ff
4a1b 325f90    ld      ($905f),a
4a1e 210000    ld      hl,$0000
4a21 228d86    ld      ($868d),hl
4a24 af        xor     a
4a25 327886    ld      ($8678),a
4a28 3a7986    ld      a,($8679)
4a2b 218086    ld      hl,$8680
4a2e 96        sub     (hl)
4a2f d601      sub     $01
4a31 9f        sbc     a,a
4a32 328f86    ld      ($868f),a
4a35 b7        or      a
4a36 c2b74a    jp      nz,$4ab7
4a39 3a998e    ld      a,($8e99)
4a3c b7        or      a
4a3d c25a4a    jp      nz,$4a5a
4a40 3a6f90    ld      a,($906f)
4a43 b7        or      a
4a44 ca4a4a    jp      z,$4a4a
4a47 cd9061    call    $6190
4a4a 3a8386    ld      a,($8683)
4a4d b7        or      a
4a4e c2524a    jp      nz,$4a52
4a51 c9        ret     

4a52 3e7c      ld      a,$7c
4a54 327886    ld      ($8678),a
4a57 c3cb4a    jp      $4acb
4a5a cd9061    call    $6190
4a5d 3a8386    ld      a,($8683)
4a60 b7        or      a
4a61 c2754a    jp      nz,$4a75
4a64 3a3b8d    ld      a,($8d3b)
4a67 32998e    ld      ($8e99),a
4a6a 3a3b8d    ld      a,($8d3b)
4a6d b7        or      a
4a6e ca724a    jp      z,$4a72
4a71 c9        ret     

4a72 c3824a    jp      $4a82
4a75 3a7986    ld      a,($8679)
4a78 c6ff      add     a,$ff
4a7a 9f        sbc     a,a
4a7b 328f86    ld      ($868f),a
4a7e b7        or      a
4a7f c2884a    jp      nz,$4a88
4a82 cdf450    call    $50f4
4a85 c3d947    jp      $47d9
4a88 cd2a4b    call    $4b2a
4a8b c3df4a    jp      $4adf
4a8e af        xor     a
4a8f 32998e    ld      ($8e99),a
4a92 af        xor     a
4a93 326190    ld      ($9061),a
4a96 af        xor     a
4a97 6f        ld      l,a
4a98 17        rla     
4a99 9f        sbc     a,a
4a9a 67        ld      h,a
4a9b 229486    ld      ($8694),hl
4a9e cd9061    call    $6190
4aa1 cd2a4b    call    $4b2a
4aa4 c3aa47    jp      $47aa
4aa7 3eff      ld      a,$ff
4aa9 326f90    ld      ($906f),a
4aac 3eff      ld      a,$ff
4aae 32998e    ld      ($8e99),a
4ab1 cd2a4b    call    $4b2a
4ab4 c3d947    jp      $47d9
4ab7 2ad390    ld      hl,($90d3)
4aba 2b        dec     hl
4abb 22d390    ld      ($90d3),hl
4abe 3a6f90    ld      a,($906f)
4ac1 b7        or      a
4ac2 cac84a    jp      z,$4ac8
4ac5 cd9061    call    $6190
4ac8 c3d947    jp      $47d9
4acb 2a8d86    ld      hl,($868d)
4ace 23        inc     hl
4acf 228d86    ld      ($868d),hl
4ad2 3a6f90    ld      a,($906f)
4ad5 b7        or      a
4ad6 cadf4a    jp      z,$4adf
4ad9 217886    ld      hl,$8678
4adc cd0e78    call    $780e
4adf 111e4b    ld      de,$4b1e
4ae2 21d390    ld      hl,$90d3
4ae5 cd1038    call    $3810
4ae8 328f86    ld      ($868f),a
4aeb b7        or      a
4aec caf54a    jp      z,$4af5
4aef 21264b    ld      hl,$4b26
4af2 cdc876    call    $76c8
4af5 2ad390    ld      hl,($90d3)
4af8 23        inc     hl
4af9 22d390    ld      ($90d3),hl
4afc 11d490    ld      de,$90d4
4aff 19        add     hl,de
4b00 229086    ld      ($8690),hl
4b03 3a7886    ld      a,($8678)
4b06 2a9086    ld      hl,($8690)
4b09 77        ld      (hl),a
4b0a 218b86    ld      hl,$868b
4b0d cdfe36    call    $36fe
4b10 328f86    ld      ($868f),a
4b13 b7        or      a
4b14 c2d947    jp      nz,$47d9
4b17 c37549    jp      $4975
4b1a 010000    ld      bc,$0000
4b1d 00        nop     
4b1e ff        rst     $38
4b1f 00        nop     
4b20 00        nop     
4b21 00        nop     
4b22 08        ex      af,af'
4b23 00        nop     
4b24 00        nop     
4b25 00        nop     
4b26 0d        dec     c
4b27 00        nop     
4b28 00        nop     
4b29 00        nop     
4b2a 3a6f90    ld      a,($906f)
4b2d 2f        cpl     
4b2e 329b86    ld      ($869b),a
4b31 b7        or      a
4b32 c2584b    jp      nz,$4b58
4b35 3e2e      ld      a,$2e
4b37 329786    ld      ($8697),a
4b3a 3a998e    ld      a,($8e99)
4b3d b7        or      a
4b3e ca464b    jp      z,$4b46
4b41 3e3e      ld      a,$3e
4b43 329786    ld      ($8697),a
4b46 3a3b8d    ld      a,($8d3b)
4b49 b7        or      a
4b4a ca524b    jp      z,$4b52
4b4d 3e3a      ld      a,$3a
4b4f 329786    ld      ($8697),a
4b52 219786    ld      hl,$8697
4b55 cd0e78    call    $780e
4b58 c9        ret     

4b59 229d86    ld      ($869d),hl
4b5c af        xor     a
4b5d 32718d    ld      ($8d71),a
4b60 2a9d86    ld      hl,($869d)
4b63 7e        ld      a,(hl)
4b64 23        inc     hl
4b65 66        ld      h,(hl)
4b66 6f        ld      l,a
4b67 cdfe7f    call    $7ffe
4b6a 2ac54b    ld      hl,($4bc5)
4b6d c64b      add     a,$4b
4b6f d24bd9    jp      nc,$d94b
4b72 4b        ld      c,e
4b73 114c43    ld      de,$434c
4b76 4c        ld      c,h
4b77 4a        ld      c,d
4b78 4c        ld      c,h
4b79 4e        ld      c,(hl)
4b7a 4c        ld      c,h
4b7b 79        ld      a,c
4b7c 4c        ld      c,h
4b7d 98        sbc     a,b
4b7e 4c        ld      c,h
4b7f ae        xor     (hl)
4b80 4c        ld      c,h
4b81 b2        or      d
4b82 4c        ld      c,h
4b83 b6        or      (hl)
4b84 4c        ld      c,h
4b85 bd        cp      l
4b86 4c        ld      c,h
4b87 c1        pop     bc
4b88 4c        ld      c,h
4b89 c8        ret     z

4b8a 4c        ld      c,h
4b8b ef        rst     $28
4b8c 4c        ld      c,h
4b8d f3        di      
4b8e 4c        ld      c,h
4b8f 14        inc     d
4b90 4d        ld      c,l
4b91 214d2e    ld      hl,$2e4d
4b94 4d        ld      c,l
4b95 4a        ld      c,d
4b96 4d        ld      c,l
4b97 63        ld      h,e
4b98 4d        ld      c,l
4b99 6e        ld      l,(hl)
4b9a 4d        ld      c,l
4b9b 72        ld      (hl),d
4b9c 4d        ld      c,l
4b9d 79        ld      a,c
4b9e 4d        ld      c,l
4b9f 8f        adc     a,a
4ba0 4d        ld      c,l
4ba1 b9        cp      c
4ba2 4d        ld      c,l
4ba3 364e      ld      (hl),$4e
4ba5 40        ld      b,b
4ba6 4e        ld      c,(hl)
4ba7 44        ld      b,h
4ba8 4e        ld      c,(hl)
4ba9 48        ld      c,b
4baa 4e        ld      c,(hl)
4bab 4c        ld      c,h
4bac 4e        ld      c,(hl)
4bad 62        ld      h,d
4bae 4e        ld      c,(hl)
4baf 66        ld      h,(hl)
4bb0 4e        ld      c,(hl)
4bb1 90        sub     b
4bb2 4e        ld      c,(hl)
4bb3 a6        and     (hl)
4bb4 4e        ld      c,(hl)
4bb5 aa        xor     d
4bb6 4e        ld      c,(hl)
4bb7 b1        or      c
4bb8 4e        ld      c,(hl)
4bb9 b5        or      l
4bba 4e        ld      c,(hl)
4bbb bc        cp      h
4bbc 4e        ld      c,(hl)
4bbd c64e      add     a,$4e
4bbf 21da4e    ld      hl,$4eda
4bc2 cdc876    call    $76c8
4bc5 c9        ret     

4bc6 3eff      ld      a,$ff
4bc8 323c8d    ld      ($8d3c),a
4bcb 213a8d    ld      hl,$8d3a
4bce cd5001    call    $0150
4bd1 c9        ret     

4bd2 21d84e    ld      hl,$4ed8
4bd5 cd2c01    call    $012c
4bd8 c9        ret     

4bd9 01a886    ld      bc,$86a8
4bdc 11628e    ld      de,$8e62
4bdf 219892    ld      hl,$9298
4be2 cd5052    call    $5250
4be5 11d04e    ld      de,$4ed0
4be8 21628e    ld      hl,$8e62
4beb cd4639    call    $3946
4bee 32aa86    ld      ($86aa),a
4bf1 b7        or      a
4bf2 cafb4b    jp      z,$4bfb
4bf5 21e04e    ld      hl,$4ee0
4bf8 cdc876    call    $76c8
4bfb 21de4e    ld      hl,$4ede
4bfe cd2c01    call    $012c
4c01 01ab86    ld      bc,$86ab
4c04 11d04e    ld      de,$4ed0
4c07 21a886    ld      hl,$86a8
4c0a cd4401    call    $0144
4c0d cd364f    call    $4f36
4c10 c9        ret     

4c11 01a886    ld      bc,$86a8
4c14 11af86    ld      de,$86af
4c17 219892    ld      hl,$9298
4c1a cd5052    call    $5250
4c1d 11d04e    ld      de,$4ed0
4c20 21af86    ld      hl,$86af
4c23 cd5038    call    $3850
4c26 32aa86    ld      ($86aa),a
4c29 b7        or      a
4c2a ca334c    jp      z,$4c33
4c2d 21e04e    ld      hl,$4ee0
4c30 cdc876    call    $76c8
4c33 21de4e    ld      hl,$4ede
4c36 cd2c01    call    $012c
4c39 119892    ld      de,$9298
4c3c 21a886    ld      hl,$86a8
4c3f cd6201    call    $0162
4c42 c9        ret     

4c43 21de4e    ld      hl,$4ede
4c46 cdb350    call    $50b3
4c49 c9        ret     

4c4a cd1740    call    $4017
4c4d c9        ret     

4c4e 3a988e    ld      a,($8e98)
4c51 32778e    ld      ($8e77),a
4c54 3a988e    ld      a,($8e98)
4c57 2f        cpl     
4c58 32aa86    ld      ($86aa),a
4c5b b7        or      a
4c5c ca604c    jp      z,$4c60
4c5f c9        ret     

4c60 af        xor     a
4c61 327d8e    ld      ($8e7d),a
4c64 3a5e90    ld      a,($905e)
4c67 b7        or      a
4c68 ca6c4c    jp      z,$4c6c
4c6b c9        ret     

4c6c 21dd8c    ld      hl,$8cdd
4c6f cdd954    call    $54d9
4c72 21dd8c    ld      hl,$8cdd
4c75 cdf406    call    $06f4
4c78 c9        ret     

4c79 219892    ld      hl,$9298
4c7c cd3556    call    $5635
4c7f 219c92    ld      hl,$929c
4c82 cd3556    call    $5635
4c85 219892    ld      hl,$9298
4c88 cdcd81    call    $81cd
4c8b 219c92    ld      hl,$929c
4c8e cded7d    call    $7ded
4c91 d601      sub     $01
4c93 9f        sbc     a,a
4c94 32728d    ld      ($8d72),a
4c97 c9        ret     

4c98 219892    ld      hl,$9298
4c9b cd3556    call    $5635
4c9e 219c92    ld      hl,$929c
4ca1 cd3556    call    $5635
4ca4 119c92    ld      de,$929c
4ca7 219892    ld      hl,$9298
4caa cd1e65    call    $651e
4cad c9        ret     

4cae cd6801    call    $0168
4cb1 c9        ret     

4cb2 cd8601    call    $0186
4cb5 c9        ret     

4cb6 3a6490    ld      a,($9064)
4cb9 323a8d    ld      ($8d3a),a
4cbc c9        ret     

4cbd cd6e01    call    $016e
4cc0 c9        ret     

4cc1 3a988e    ld      a,($8e98)
4cc4 326290    ld      ($9062),a
4cc7 c9        ret     

4cc8 af        xor     a
4cc9 325f90    ld      ($905f),a
4ccc af        xor     a
4ccd 32578d    ld      ($8d57),a
4cd0 cd9061    call    $6190
4cd3 3a3a8d    ld      a,($8d3a)
4cd6 d601      sub     $01
4cd8 9f        sbc     a,a
4cd9 32aa86    ld      ($86aa),a
4cdc b7        or      a
4cdd cae14c    jp      z,$4ce1
4ce0 c9        ret     

4ce1 cd6674    call    $7466
4ce4 3a3a8d    ld      a,($8d3a)
4ce7 3d        dec     a
4ce8 323a8d    ld      ($8d3a),a
4ceb 326490    ld      ($9064),a
4cee c9        ret     

4cef cddc06    call    $06dc
4cf2 c9        ret     

4cf3 21d44e    ld      hl,$4ed4
4cf6 cd8802    call    $0288
4cf9 2f        cpl     
4cfa 32aa86    ld      ($86aa),a
4cfd b7        or      a
4cfe ca024d    jp      z,$4d02
4d01 c9        ret     

4d02 cddf06    call    $06df
4d05 cd9801    call    $0198
4d08 01d84e    ld      bc,$4ed8
4d0b 11de4e    ld      de,$4ede
4d0e 219892    ld      hl,$9298
4d11 cdce01    call    $01ce
4d14 3eff      ld      a,$ff
4d16 323e8d    ld      ($8d3e),a
4d19 af        xor     a
4d1a 323a8d    ld      ($8d3a),a
4d1d cdf450    call    $50f4
4d20 c9        ret     

4d21 01d84e    ld      bc,$4ed8
4d24 11d84e    ld      de,$4ed8
4d27 219892    ld      hl,$9298
4d2a cdce01    call    $01ce
4d2d c9        ret     

4d2e 219f86    ld      hl,$869f
4d31 cd8355    call    $5583
4d34 3a728d    ld      a,($8d72)
4d37 219f86    ld      hl,$869f
4d3a ae        xor     (hl)
4d3b 2f        cpl     
4d3c 32718d    ld      ($8d71),a
4d3f b7        or      a
4d40 ca444d    jp      z,$4d44
4d43 c9        ret     

4d44 3eff      ld      a,$ff
4d46 325e90    ld      ($905e),a
4d49 c9        ret     

4d4a 21af86    ld      hl,$86af
4d4d cdd954    call    $54d9
4d50 cdf450    call    $50f4
4d53 11d04e    ld      de,$4ed0
4d56 21d44e    ld      hl,$4ed4
4d59 cd4b70    call    $704b
4d5c 21af86    ld      hl,$86af
4d5f cd714f    call    $4f71
4d62 c9        ret     

4d63 3a3a8d    ld      a,($8d3a)
4d66 326490    ld      ($9064),a
4d69 af        xor     a
4d6a 323a8d    ld      ($8d3a),a
4d6d c9        ret     

4d6e cdfe01    call    $01fe
4d71 c9        ret     

4d72 21728d    ld      hl,$8d72
4d75 cd8355    call    $5583
4d78 c9        ret     

4d79 219892    ld      hl,$9298
4d7c cd3556    call    $5635
4d7f 219c92    ld      hl,$929c
4d82 cd3556    call    $5635
4d85 119c92    ld      de,$929c
4d88 219892    ld      hl,$9298
4d8b cde364    call    $64e3
4d8e c9        ret     

4d8f 219892    ld      hl,$9298
4d92 cd3556    call    $5635
4d95 219c92    ld      hl,$929c
4d98 cd3556    call    $5635
4d9b 3a5e90    ld      a,($905e)
4d9e 2f        cpl     
4d9f 32aa86    ld      ($86aa),a
4da2 b7        or      a
4da3 caac4d    jp      z,$4dac
4da6 21e38c    ld      hl,$8ce3
4da9 cd1f55    call    $551f
4dac 01e38c    ld      bc,$8ce3
4daf 119c92    ld      de,$929c
4db2 219892    ld      hl,$9298
4db5 cd5b65    call    $655b
4db8 c9        ret     

4db9 219892    ld      hl,$9298
4dbc cd3556    call    $5635
4dbf 3a978e    ld      a,($8e97)
4dc2 d602      sub     $02
4dc4 c6ff      add     a,$ff
4dc6 9f        sbc     a,a
4dc7 32aa86    ld      ($86aa),a
4dca b7        or      a
4dcb cad44d    jp      z,$4dd4
4dce 21e44e    ld      hl,$4ee4
4dd1 cdc876    call    $76c8
4dd4 2a958e    ld      hl,($8e95)
4dd7 22b186    ld      ($86b1),hl
4dda 21b386    ld      hl,$86b3
4ddd cdd954    call    $54d9
4de0 21af86    ld      hl,$86af
4de3 cdd954    call    $54d9
4de6 210000    ld      hl,$0000
4de9 22b586    ld      ($86b5),hl
4dec 3a5e90    ld      a,($905e)
4def 2f        cpl     
4df0 32aa86    ld      ($86aa),a
4df3 b7        or      a
4df4 cafd4d    jp      z,$4dfd
4df7 21b586    ld      hl,$86b5
4dfa cdd954    call    $54d9
4dfd 11b386    ld      de,$86b3
4e00 21b586    ld      hl,$86b5
4e03 cd5038    call    $3850
4e06 32aa86    ld      ($86aa),a
4e09 11d44e    ld      de,$4ed4
4e0c 21b586    ld      hl,$86b5
4e0f cd4639    call    $3946
4e12 21aa86    ld      hl,$86aa
4e15 b6        or      (hl)
4e16 32b786    ld      ($86b7),a
4e19 b7        or      a
4e1a c2504d    jp      nz,$4d50
4e1d 2ab586    ld      hl,($86b5)
4e20 cdde7f    call    $7fde
4e23 219892    ld      hl,$9298
4e26 cdbe81    call    $81be
4e29 01b186    ld      bc,$86b1
4e2c 113f8d    ld      de,$8d3f
4e2f 219892    ld      hl,$9298
4e32 cda370    call    $70a3
4e35 c9        ret     

4e36 af        xor     a
4e37 32988e    ld      ($8e98),a
4e3a 3eff      ld      a,$ff
4e3c 32718d    ld      ($8d71),a
4e3f c9        ret     

4e40 cd2e02    call    $022e
4e43 c9        ret     

4e44 cd3a02    call    $023a
4e47 c9        ret     

4e48 cd4002    call    $0240
4e4b c9        ret     

4e4c 219892    ld      hl,$9298
4e4f cd3556    call    $5635
4e52 219c92    ld      hl,$929c
4e55 cd3556    call    $5635
4e58 119c92    ld      de,$929c
4e5b 219892    ld      hl,$9298
4e5e cd0165    call    $6501
4e61 c9        ret     

4e62 cd8202    call    $0282
4e65 c9        ret     

4e66 219892    ld      hl,$9298
4e69 cd3556    call    $5635
4e6c 219c92    ld      hl,$929c
4e6f cd3556    call    $5635
4e72 3a5e90    ld      a,($905e)
4e75 2f        cpl     
4e76 32aa86    ld      ($86aa),a
4e79 b7        or      a
4e7a ca834e    jp      z,$4e83
4e7d 21e38c    ld      hl,$8ce3
4e80 cd1f55    call    $551f
4e83 01e38c    ld      bc,$8ce3
4e86 119c92    ld      de,$929c
4e89 219892    ld      hl,$9298
4e8c cd8665    call    $6586
4e8f c9        ret     

4e90 219892    ld      hl,$9298
4e93 cd3556    call    $5635
4e96 219c92    ld      hl,$929c
4e99 cd3556    call    $5635
4e9c 119c92    ld      de,$929c
4e9f 219892    ld      hl,$9298
4ea2 cd3d65    call    $653d
4ea5 c9        ret     

4ea6 cdac02    call    $02ac
4ea9 c9        ret     

4eaa 21a486    ld      hl,$86a4
4ead cda377    call    $77a3
4eb0 c9        ret     

4eb1 cda002    call    $02a0
4eb4 c9        ret     

4eb5 21d84e    ld      hl,$4ed8
4eb8 cdb350    call    $50b3
4ebb c9        ret     

4ebc 21de4e    ld      hl,$4ede
4ebf cd2c01    call    $012c
4ec2 cdc402    call    $02c4
4ec5 c9        ret     

4ec6 21de4e    ld      hl,$4ede
4ec9 cd2c01    call    $012c
4ecc cdca02    call    $02ca
4ecf c9        ret     

4ed0 010000    ld      bc,$0000
4ed3 00        nop     
4ed4 00        nop     
4ed5 00        nop     
4ed6 00        nop     
4ed7 00        nop     
4ed8 00        nop     
4ed9 00        nop     
4eda 1000      djnz    $4edc
4edc 00        nop     
4edd 00        nop     
4ede ff        rst     $38
4edf ff        rst     $38
4ee0 13        inc     de
4ee1 00        nop     
4ee2 00        nop     
4ee3 00        nop     
4ee4 0c        inc     c
4ee5 00        nop     
4ee6 00        nop     
4ee7 00        nop     
4ee8 21b986    ld      hl,$86b9
4eeb cd9c77    call    $779c
4eee 3ab986    ld      a,($86b9)
4ef1 2f        cpl     
4ef2 32be86    ld      ($86be),a
4ef5 b7        or      a
4ef6 c2164f    jp      nz,$4f16
4ef9 21ba86    ld      hl,$86ba
4efc cda377    call    $77a3
4eff 3a708d    ld      a,($8d70)
4f02 21ba86    ld      hl,$86ba
4f05 96        sub     (hl)
4f06 d601      sub     $01
4f08 9f        sbc     a,a
4f09 32be86    ld      ($86be),a
4f0c b7        or      a
4f0d ca164f    jp      z,$4f16
4f10 21174f    ld      hl,$4f17
4f13 cdc876    call    $76c8
4f16 c9        ret     

4f17 25        dec     h
4f18 00        nop     
4f19 00        nop     
4f1a 00        nop     
4f1b 22c086    ld      ($86c0),hl
4f1e eb        ex      de,hl
4f1f 22c286    ld      ($86c2),hl
4f22 01f091    ld      bc,$91f0
4f25 2ac286    ld      hl,($86c2)
4f28 eb        ex      de,hl
4f29 2ac086    ld      hl,($86c0)
4f2c cd635a    call    $5a63
4f2f 21f091    ld      hl,$91f0
4f32 cde861    call    $61e8
4f35 c9        ret     

4f36 214c4f    ld      hl,$4f4c
4f39 cdc364    call    $64c3
4f3c 11c886    ld      de,$86c8
4f3f 21c886    ld      hl,$86c8
4f42 cde364    call    $64e3
4f45 21e48c    ld      hl,$8ce4
4f48 cdc364    call    $64c3
4f4b c9        ret     

4f4c 010000    ld      bc,$0000
4f4f 00        nop     
4f50 3a5c8d    ld      a,($8d5c)
4f53 b7        or      a
4f54 c2644f    jp      nz,$4f64
4f57 2a668d    ld      hl,($8d66)
4f5a 227a8d    ld      ($8d7a),hl
4f5d 2a688d    ld      hl,($8d68)
4f60 227c8d    ld      ($8d7c),hl
4f63 c9        ret     

4f64 2a6a8d    ld      hl,($8d6a)
4f67 227a8d    ld      ($8d7a),hl
4f6a 2a6c8d    ld      hl,($8d6c)
4f6d 227c8d    ld      ($8d7c),hl
4f70 c9        ret     

4f71 22d186    ld      ($86d1),hl
4f74 cdf450    call    $50f4
4f77 3a6190    ld      a,($9061)
4f7a 2f        cpl     
4f7b 32d986    ld      ($86d9),a
4f7e b7        or      a
4f7f ca884f    jp      z,$4f88
4f82 21f24f    ld      hl,$4ff2
4f85 cdc876    call    $76c8
4f88 3eff      ld      a,$ff
4f8a 323d8d    ld      ($8d3d),a
4f8d cd8a46    call    $468a
4f90 3a5f90    ld      a,($905f)
4f93 b7        or      a
4f94 ca9d4f    jp      z,$4f9d
4f97 21f64f    ld      hl,$4ff6
4f9a cdc876    call    $76c8
4f9d 3ace90    ld      a,($90ce)
4fa0 21d586    ld      hl,$86d5
4fa3 96        sub     (hl)
4fa4 c6ff      add     a,$ff
4fa6 9f        sbc     a,a
4fa7 32d986    ld      ($86d9),a
4faa b7        or      a
4fab c28d4f    jp      nz,$4f8d
4fae 210200    ld      hl,$0002
4fb1 22cc90    ld      ($90cc),hl
4fb4 11c790    ld      de,$90c7
4fb7 217390    ld      hl,$9073
4fba cd2858    call    $5828
4fbd 01c790    ld      bc,$90c7
4fc0 117390    ld      de,$9073
4fc3 21da86    ld      hl,$86da
4fc6 cd9e5e    call    $5e9e
4fc9 32d986    ld      ($86d9),a
4fcc b7        or      a
4fcd c28d4f    jp      nz,$4f8d
4fd0 21da86    ld      hl,$86da
4fd3 cdcd81    call    $81cd
4fd6 cd807a    call    $7a80
4fd9 22de86    ld      ($86de),hl
4fdc 2ad186    ld      hl,($86d1)
4fdf eb        ex      de,hl
4fe0 21de86    ld      hl,$86de
4fe3 cd543a    call    $3a54
4fe6 32d986    ld      ($86d9),a
4fe9 b7        or      a
4fea c28d4f    jp      nz,$4f8d
4fed af        xor     a
4fee 323d8d    ld      ($8d3d),a
4ff1 c9        ret     

4ff2 1b        dec     de
4ff3 00        nop     
4ff4 00        nop     
4ff5 00        nop     
4ff6 1600      ld      d,$00
4ff8 00        nop     
4ff9 00        nop     
4ffa 22e186    ld      ($86e1),hl
4ffd 2ae186    ld      hl,($86e1)
5000 cdcd81    call    $81cd
5003 21fc8c    ld      hl,$8cfc
5006 cded7d    call    $7ded
5009 d601      sub     $01
500b 9f        sbc     a,a
500c 32e386    ld      ($86e3),a
500f b7        or      a
5010 ca1450    jp      z,$5014
5013 c9        ret     

5014 2ae186    ld      hl,($86e1)
5017 cdcd81    call    $81cd
501a 21fc8c    ld      hl,$8cfc
501d cdbe81    call    $81be
5020 21fc8c    ld      hl,$8cfc
5023 cd2750    call    $5027
5026 c9        ret     

5027 22e586    ld      ($86e5),hl
502a 210e8d    ld      hl,$8d0e
502d cdcd81    call    $81cd
5030 2182a6    ld      hl,$a682
5033 cdbe81    call    $81be
5036 21068d    ld      hl,$8d06
5039 cdcd81    call    $81cd
503c 21028d    ld      hl,$8d02
503f cdfe7e    call    $7efe
5042 2ae586    ld      hl,($86e5)
5045 cdfe7e    call    $7efe
5048 21e786    ld      hl,$86e7
504b cdbe81    call    $81be
504e 210a8d    ld      hl,$8d0a
5051 cdfe7e    call    $7efe
5054 21eb86    ld      hl,$86eb
5057 cdbe81    call    $81be
505a 21e786    ld      hl,$86e7
505d cdcd81    call    $81cd
5060 21128d    ld      hl,$8d12
5063 cdfe7e    call    $7efe
5066 210e8d    ld      hl,$8d0e
5069 cdfe7e    call    $7efe
506c 21ef86    ld      hl,$86ef
506f cdbe81    call    $81be
5072 01e786    ld      bc,$86e7
5075 11ef86    ld      de,$86ef
5078 21eb86    ld      hl,$86eb
507b cd2e67    call    $672e
507e c9        ret     

507f 22f486    ld      ($86f4),hl
5082 11af50    ld      de,$50af
5085 2af486    ld      hl,($86f4)
5088 cdd536    call    $36d5
508b 32f786    ld      ($86f7),a
508e 3a778e    ld      a,($8e77)
5091 2f        cpl     
5092 21f786    ld      hl,$86f7
5095 b6        or      (hl)
5096 32f886    ld      ($86f8),a
5099 b7        or      a
509a ca9e50    jp      z,$509e
509d c9        ret     

509e 2af486    ld      hl,($86f4)
50a1 7e        ld      a,(hl)
50a2 23        inc     hl
50a3 66        ld      h,(hl)
50a4 6f        ld      l,a
50a5 22008d    ld      ($8d00),hl
50a8 21008d    ld      hl,$8d00
50ab cdf406    call    $06f4
50ae c9        ret     

50af ff        rst     $38
50b0 ff        rst     $38
50b1 ff        rst     $38
50b2 ff        rst     $38
50b3 22fa86    ld      ($86fa),hl
50b6 212e8d    ld      hl,$8d2e
50b9 cd7f50    call    $507f
50bc 21168d    ld      hl,$8d16
50bf cdfa4f    call    $4ffa
50c2 11c790    ld      de,$90c7
50c5 21d590    ld      hl,$90d5
50c8 cd2858    call    $5828
50cb 3ac790    ld      a,($90c7)
50ce 11d590    ld      de,$90d5
50d1 6f        ld      l,a
50d2 17        rla     
50d3 9f        sbc     a,a
50d4 67        ld      h,a
50d5 19        add     hl,de
50d6 22ff86    ld      ($86ff),hl
50d9 af        xor     a
50da 2aff86    ld      hl,($86ff)
50dd 77        ld      (hl),a
50de 2afa86    ld      hl,($86fa)
50e1 7e        ld      a,(hl)
50e2 b7        or      a
50e3 c2ed50    jp      nz,$50ed
50e6 21d590    ld      hl,$90d5
50e9 cdb065    call    $65b0
50ec c9        ret     

50ed 21d590    ld      hl,$90d5
50f0 cd5c01    call    $015c
50f3 c9        ret     

50f4 af        xor     a
50f5 32998e    ld      ($8e99),a
50f8 3a3a8d    ld      a,($8d3a)
50fb c6ff      add     a,$ff
50fd 9f        sbc     a,a
50fe 326190    ld      ($9061),a
5101 b7        or      a
5102 ca0b51    jp      z,$510b
5105 213a8d    ld      hl,$8d3a
5108 cdb771    call    $71b7
510b 3a3e8d    ld      a,($8d3e)
510e b7        or      a
510f c21a51    jp      nz,$511a
5112 3a6190    ld      a,($9061)
5115 2f        cpl     
5116 326f90    ld      ($906f),a
5119 c9        ret     

511a af        xor     a
511b 326f90    ld      ($906f),a
511e c9        ret     

511f 220e87    ld      ($870e),hl
5122 eb        ex      de,hl
5123 221087    ld      ($8710),hl
5126 60        ld      h,b
5127 69        ld      l,c
5128 221287    ld      ($8712),hl
512b 3a3c8d    ld      a,($8d3c)
512e 2f        cpl     
512f 321987    ld      ($8719),a
5132 b7        or      a
5133 ca3c51    jp      z,$513c
5136 212952    ld      hl,$5229
5139 cdc876    call    $76c8
513c 3eff      ld      a,$ff
513e 320687    ld      ($8706),a
5141 af        xor     a
5142 32758d    ld      ($8d75),a
5145 3a5c8d    ld      a,($8d5c)
5148 b7        or      a
5149 c26351    jp      nz,$5163
514c 2a1087    ld      hl,($8710)
514f 7e        ld      a,(hl)
5150 23        inc     hl
5151 66        ld      h,(hl)
5152 6f        ld      l,a
5153 221a87    ld      ($871a),hl
5156 2a1287    ld      hl,($8712)
5159 7e        ld      a,(hl)
515a 23        inc     hl
515b 66        ld      h,(hl)
515c 6f        ld      l,a
515d 221c87    ld      ($871c),hl
5160 c37751    jp      $5177
5163 2a1087    ld      hl,($8710)
5166 7e        ld      a,(hl)
5167 23        inc     hl
5168 66        ld      h,(hl)
5169 6f        ld      l,a
516a 221c87    ld      ($871c),hl
516d 2a1287    ld      hl,($8712)
5170 7e        ld      a,(hl)
5171 23        inc     hl
5172 66        ld      h,(hl)
5173 6f        ld      l,a
5174 221a87    ld      ($871a),hl
5177 115e8d    ld      de,$8d5e
517a 211a87    ld      hl,$871a
517d cd5038    call    $3850
5180 321987    ld      ($8719),a
5183 b7        or      a
5184 ca8d51    jp      z,$518d
5187 212d52    ld      hl,$522d
518a cdc876    call    $76c8
518d 11608d    ld      de,$8d60
5190 211c87    ld      hl,$871c
5193 cd5038    call    $3850
5196 321987    ld      ($8719),a
5199 b7        or      a
519a caa351    jp      z,$51a3
519d 213152    ld      hl,$5231
51a0 cdc876    call    $76c8
51a3 117c8d    ld      de,$8d7c
51a6 2a1087    ld      hl,($8710)
51a9 cd5038    call    $3850
51ac 321987    ld      ($8719),a
51af b7        or      a
51b0 cab751    jp      z,$51b7
51b3 3a0687    ld      a,($8706)
51b6 c9        ret     

51b7 af        xor     a
51b8 320687    ld      ($8706),a
51bb 2a1287    ld      hl,($8712)
51be cdfe36    call    $36fe
51c1 321987    ld      ($8719),a
51c4 b7        or      a
51c5 c20652    jp      nz,$5206
51c8 2a1a87    ld      hl,($871a)
51cb 2b        dec     hl
51cc eb        ex      de,hl
51cd 2a608d    ld      hl,($8d60)
51d0 cd7d80    call    $807d
51d3 eb        ex      de,hl
51d4 2a1c87    ld      hl,($871c)
51d7 19        add     hl,de
51d8 221e87    ld      ($871e),hl
51db 011e87    ld      bc,$871e
51de 114f8d    ld      de,$8d4f
51e1 2a0e87    ld      hl,($870e)
51e4 cd7870    call    $7078
51e7 2a0e87    ld      hl,($870e)
51ea cdcd81    call    $81cd
51ed 21768d    ld      hl,$8d76
51f0 cded7d    call    $7ded
51f3 d601      sub     $01
51f5 9f        sbc     a,a
51f6 321987    ld      ($8719),a
51f9 b7        or      a
51fa ca0252    jp      z,$5202
51fd 3eff      ld      a,$ff
51ff 32758d    ld      ($8d75),a
5202 3a0687    ld      a,($8706)
5205 c9        ret     

5206 210100    ld      hl,$0001
5209 eb        ex      de,hl
520a 2a7a8d    ld      hl,($8d7a)
520d 7b        ld      a,e
520e 95        sub     l
520f 6f        ld      l,a
5210 7a        ld      a,d
5211 9c        sbc     a,h
5212 67        ld      h,a
5213 eb        ex      de,hl
5214 2a1087    ld      hl,($8710)
5217 7e        ld      a,(hl)
5218 23        inc     hl
5219 66        ld      h,(hl)
521a 6f        ld      l,a
521b 19        add     hl,de
521c cdde7f    call    $7fde
521f 2a0e87    ld      hl,($870e)
5222 cdbe81    call    $81be
5225 3a0687    ld      a,($8706)
5228 c9        ret     

5229 14        inc     d
522a 00        nop     
522b 00        nop     
522c 00        nop     
522d 1d        dec     e
522e 00        nop     
522f 00        nop     
5230 00        nop     
5231 17        rla     
5232 00        nop     
5233 00        nop     
5234 00        nop     
5235 11c58c    ld      de,$8cc5
5238 21e68c    ld      hl,$8ce6
523b cdf576    call    $76f5
523e c9        ret     

523f 014c52    ld      bc,$524c
5242 11e68c    ld      de,$8ce6
5245 21c58c    ld      hl,$8cc5
5248 cd0177    call    $7701
524b c9        ret     

524c 03        inc     bc
524d 00        nop     
524e 00        nop     
524f 00        nop     
5250 222387    ld      ($8723),hl
5253 eb        ex      de,hl
5254 222587    ld      ($8725),hl
5257 60        ld      h,b
5258 69        ld      l,c
5259 222787    ld      ($8727),hl
525c 210000    ld      hl,$0000
525f eb        ex      de,hl
5260 2a2587    ld      hl,($8725)
5263 73        ld      (hl),e
5264 23        inc     hl
5265 72        ld      (hl),d
5266 210000    ld      hl,$0000
5269 eb        ex      de,hl
526a 2a2787    ld      hl,($8727)
526d 73        ld      (hl),e
526e 23        inc     hl
526f 72        ld      (hl),d
5270 af        xor     a
5271 322b87    ld      ($872b),a
5274 3a5e90    ld      a,($905e)
5277 b7        or      a
5278 ca7c52    jp      z,$527c
527b c9        ret     

527c 3a3c8d    ld      a,($8d3c)
527f 2f        cpl     
5280 324587    ld      ($8745),a
5283 b7        or      a
5284 ca8d52    jp      z,$528d
5287 213053    ld      hl,$5330
528a cdc876    call    $76c8
528d cda256    call    $56a2
5290 3a978e    ld      a,($8e97)
5293 d605      sub     $05
5295 d601      sub     $01
5297 9f        sbc     a,a
5298 324587    ld      ($8745),a
529b 3a978e    ld      a,($8e97)
529e d604      sub     $04
52a0 d601      sub     $01
52a2 9f        sbc     a,a
52a3 214587    ld      hl,$8745
52a6 b6        or      (hl)
52a7 324687    ld      ($8746),a
52aa b7        or      a
52ab c2c752    jp      nz,$52c7
52ae 01c790    ld      bc,$90c7
52b1 117390    ld      de,$9073
52b4 212d87    ld      hl,$872d
52b7 cd5962    call    $6259
52ba 324587    ld      ($8745),a
52bd b7        or      a
52be c21d53    jp      nz,$531d
52c1 213453    ld      hl,$5334
52c4 cdc876    call    $76c8
52c7 3a2b87    ld      a,($872b)
52ca b7        or      a
52cb c22553    jp      nz,$5325
52ce 2a2587    ld      hl,($8725)
52d1 cdfe36    call    $36fe
52d4 324587    ld      ($8745),a
52d7 b7        or      a
52d8 cae152    jp      z,$52e1
52db 3a5c8d    ld      a,($8d5c)
52de 322a87    ld      ($872a),a
52e1 3a5c8d    ld      a,($8d5c)
52e4 212a87    ld      hl,$872a
52e7 ae        xor     (hl)
52e8 324587    ld      ($8745),a
52eb b7        or      a
52ec caf552    jp      z,$52f5
52ef 213853    ld      hl,$5338
52f2 cdc876    call    $76c8
52f5 2a2587    ld      hl,($8725)
52f8 7e        ld      a,(hl)
52f9 23        inc     hl
52fa 66        ld      h,(hl)
52fb 6f        ld      l,a
52fc 23        inc     hl
52fd eb        ex      de,hl
52fe 2a2587    ld      hl,($8725)
5301 73        ld      (hl),e
5302 23        inc     hl
5303 72        ld      (hl),d
5304 eb        ex      de,hl
5305 29        add     hl,hl
5306 2b        dec     hl
5307 2b        dec     hl
5308 eb        ex      de,hl
5309 2a2387    ld      hl,($8723)
530c 19        add     hl,de
530d 224787    ld      ($8747),hl
5310 2a958e    ld      hl,($8e95)
5313 eb        ex      de,hl
5314 2a4787    ld      hl,($8747)
5317 73        ld      (hl),e
5318 23        inc     hl
5319 72        ld      (hl),d
531a c37452    jp      $5274
531d 3eff      ld      a,$ff
531f 322b87    ld      ($872b),a
5322 c37452    jp      $5274
5325 2a958e    ld      hl,($8e95)
5328 eb        ex      de,hl
5329 2a2787    ld      hl,($8727)
532c 73        ld      (hl),e
532d 23        inc     hl
532e 72        ld      (hl),d
532f c9        ret     

5330 14        inc     d
5331 00        nop     
5332 00        nop     
5333 00        nop     
5334 220000    ld      ($0000),hl
5337 00        nop     
5338 2000      jr      nz,$533a
533a 00        nop     
533b 00        nop     
533c 224a87    ld      ($874a),hl
533f eb        ex      de,hl
5340 224c87    ld      ($874c),hl
5343 210000    ld      hl,$0000
5346 225287    ld      ($8752),hl
5349 3a5e90    ld      a,($905e)
534c b7        or      a
534d ca5153    jp      z,$5351
5350 c9        ret     

5351 2a5287    ld      hl,($8752)
5354 23        inc     hl
5355 225287    ld      ($8752),hl
5358 215287    ld      hl,$8752
535b cd5f54    call    $545f
535e 215487    ld      hl,$8754
5361 cdd954    call    $54d9
5364 115487    ld      de,$8754
5367 219b53    ld      hl,$539b
536a cd5038    call    $3850
536d 325687    ld      ($8756),a
5370 2a4c87    ld      hl,($874c)
5373 eb        ex      de,hl
5374 215487    ld      hl,$8754
5377 cd5038    call    $3850
537a 215687    ld      hl,$8756
537d b6        or      (hl)
537e 325787    ld      ($8757),a
5381 b7        or      a
5382 ca8b53    jp      z,$538b
5385 219f53    ld      hl,$539f
5388 cdc876    call    $76c8
538b 015287    ld      bc,$8752
538e 2a4a87    ld      hl,($874a)
5391 eb        ex      de,hl
5392 215487    ld      hl,$8754
5395 cda370    call    $70a3
5398 c34953    jp      $5349
539b 00        nop     
539c 00        nop     
539d 00        nop     
539e 00        nop     
539f 1a        ld      a,(de)
53a0 00        nop     
53a1 00        nop     
53a2 00        nop     
53a3 225987    ld      ($8759),hl
53a6 eb        ex      de,hl
53a7 225b87    ld      ($875b),hl
53aa 60        ld      h,b
53ab 69        ld      l,c
53ac 225d87    ld      ($875d),hl
53af 210000    ld      hl,$0000
53b2 226587    ld      ($8765),hl
53b5 3a5e90    ld      a,($905e)
53b8 b7        or      a
53b9 cabd53    jp      z,$53bd
53bc c9        ret     

53bd 2a6587    ld      hl,($8765)
53c0 23        inc     hl
53c1 226587    ld      ($8765),hl
53c4 2a5d87    ld      hl,($875d)
53c7 eb        ex      de,hl
53c8 216587    ld      hl,$8765
53cb cd5038    call    $3850
53ce 326787    ld      ($8767),a
53d1 b7        or      a
53d2 cadb53    jp      z,$53db
53d5 215754    ld      hl,$5457
53d8 cdc876    call    $76c8
53db 115354    ld      de,$5453
53de 2a5b87    ld      hl,($875b)
53e1 cdd536    call    $36d5
53e4 326787    ld      ($8767),a
53e7 b7        or      a
53e8 c24a54    jp      nz,$544a
53eb 11c790    ld      de,$90c7
53ee 21f091    ld      hl,$91f0
53f1 cd2858    call    $5828
53f4 2a5b87    ld      hl,($875b)
53f7 7e        ld      a,(hl)
53f8 23        inc     hl
53f9 66        ld      h,(hl)
53fa 6f        ld      l,a
53fb 2b        dec     hl
53fc 226887    ld      ($8768),hl
53ff 3ac790    ld      a,($90c7)
5402 6f        ld      l,a
5403 17        rla     
5404 9f        sbc     a,a
5405 67        ld      h,a
5406 eb        ex      de,hl
5407 2a6887    ld      hl,($8768)
540a 7b        ld      a,e
540b 95        sub     l
540c 6f        ld      l,a
540d 7a        ld      a,d
540e 9c        sbc     a,h
540f 67        ld      h,a
5410 7d        ld      a,l
5411 07        rlca    
5412 b5        or      l
5413 e67f      and     $7f
5415 b4        or      h
5416 3d        dec     a
5417 d67f      sub     $7f
5419 9f        sbc     a,a
541a 326787    ld      ($8767),a
541d b7        or      a
541e ca2754    jp      z,$5427
5421 215b54    ld      hl,$545b
5424 cdc876    call    $76c8
5427 3ac790    ld      a,($90c7)
542a 11f091    ld      de,$91f0
542d 6f        ld      l,a
542e 17        rla     
542f 9f        sbc     a,a
5430 67        ld      h,a
5431 19        add     hl,de
5432 226887    ld      ($8768),hl
5435 af        xor     a
5436 2a6887    ld      hl,($8768)
5439 77        ld      (hl),a
543a 016587    ld      bc,$8765
543d 2a5987    ld      hl,($8759)
5440 eb        ex      de,hl
5441 21f091    ld      hl,$91f0
5444 cda370    call    $70a3
5447 c3b553    jp      $53b5
544a 21f091    ld      hl,$91f0
544d cd1f55    call    $551f
5450 c33a54    jp      $543a
5453 010000    ld      bc,$0000
5456 00        nop     
5457 13        inc     de
5458 00        nop     
5459 00        nop     
545a 00        nop     
545b 210000    ld      hl,$0000
545e 00        nop     
545f 226b87    ld      ($876b),hl
5462 2a6b87    ld      hl,($876b)
5465 eb        ex      de,hl
5466 218a54    ld      hl,$548a
5469 cd5038    call    $3850
546c 327187    ld      ($8771),a
546f 114c8e    ld      de,$8e4c
5472 2a6b87    ld      hl,($876b)
5475 cd5038    call    $3850
5478 217187    ld      hl,$8771
547b b6        or      (hl)
547c 327287    ld      ($8772),a
547f b7        or      a
5480 ca8954    jp      z,$5489
5483 218e54    ld      hl,$548e
5486 cdc876    call    $76c8
5489 c9        ret     

548a 010000    ld      bc,$0000
548d 00        nop     
548e 13        inc     de
548f 00        nop     
5490 00        nop     
5491 00        nop     
5492 227487    ld      ($8774),hl
5495 eb        ex      de,hl
5496 227687    ld      ($8776),hl
5499 217a87    ld      hl,$877a
549c cdd954    call    $54d9
549f 2a7687    ld      hl,($8776)
54a2 eb        ex      de,hl
54a3 217a87    ld      hl,$877a
54a6 cd5038    call    $3850
54a9 327c87    ld      ($877c),a
54ac 11d154    ld      de,$54d1
54af 217a87    ld      hl,$877a
54b2 cd9238    call    $3892
54b5 217c87    ld      hl,$877c
54b8 b6        or      (hl)
54b9 327d87    ld      ($877d),a
54bc b7        or      a
54bd cac654    jp      z,$54c6
54c0 21d554    ld      hl,$54d5
54c3 cdc876    call    $76c8
54c6 2a7a87    ld      hl,($877a)
54c9 eb        ex      de,hl
54ca 2a7487    ld      hl,($8774)
54cd 73        ld      (hl),e
54ce 23        inc     hl
54cf 72        ld      (hl),d
54d0 c9        ret     

54d1 00        nop     
54d2 00        nop     
54d3 00        nop     
54d4 00        nop     
54d5 1a        ld      a,(de)
54d6 00        nop     
54d7 00        nop     
54d8 00        nop     
54d9 227f87    ld      ($877f),hl
54dc 218187    ld      hl,$8781
54df cd3556    call    $5635
54e2 218187    ld      hl,$8781
54e5 cdcd81    call    $81cd
54e8 cd807a    call    $7a80
54eb eb        ex      de,hl
54ec 2a7f87    ld      hl,($877f)
54ef 73        ld      (hl),e
54f0 23        inc     hl
54f1 72        ld      (hl),d
54f2 2a7f87    ld      hl,($877f)
54f5 cdc87a    call    $7ac8
54f8 218587    ld      hl,$8785
54fb cdbe81    call    $81be
54fe 218187    ld      hl,$8781
5501 cdcd81    call    $81cd
5504 218587    ld      hl,$8785
5507 cded7d    call    $7ded
550a c6ff      add     a,$ff
550c 9f        sbc     a,a
550d 328987    ld      ($8789),a
5510 b7        or      a
5511 ca1a55    jp      z,$551a
5514 211b55    ld      hl,$551b
5517 cdc876    call    $76c8
551a c9        ret     

551b 15        dec     d
551c 00        nop     
551d 00        nop     
551e 00        nop     
551f 228b87    ld      ($878b),hl
5522 11c790    ld      de,$90c7
5525 217390    ld      hl,$9073
5528 cd2858    call    $5828
552b 3ac790    ld      a,($90c7)
552e 3d        dec     a
552f 3d        dec     a
5530 d67f      sub     $7f
5532 9f        sbc     a,a
5533 329187    ld      ($8791),a
5536 3a6790    ld      a,($9067)
5539 218d87    ld      hl,$878d
553c 96        sub     (hl)
553d d601      sub     $01
553f 9f        sbc     a,a
5540 219187    ld      hl,$8791
5543 a6        and     (hl)
5544 329287    ld      ($8792),a
5547 b7        or      a
5548 c26755    jp      nz,$5567
554b 3ac790    ld      a,($90c7)
554e 3d        dec     a
554f c6ff      add     a,$ff
5551 9f        sbc     a,a
5552 329187    ld      ($8791),a
5555 b7        or      a
5556 ca5f55    jp      z,$555f
5559 217f55    ld      hl,$557f
555c cdc876    call    $76c8
555f 3a7390    ld      a,($9073)
5562 2a8b87    ld      hl,($878b)
5565 77        ld      (hl),a
5566 c9        ret     

5567 cd585a    call    $5a58
556a 2acc90    ld      hl,($90cc)
556d 23        inc     hl
556e 22cc90    ld      ($90cc),hl
5571 219387    ld      hl,$8793
5574 cdd954    call    $54d9
5577 3a9387    ld      a,($8793)
557a 2a8b87    ld      hl,($878b)
557d 77        ld      (hl),a
557e c9        ret     

557f 210000    ld      hl,$0000
5582 00        nop     
5583 229687    ld      ($8796),hl
5586 11c790    ld      de,$90c7
5589 217390    ld      hl,$9073
558c cd2858    call    $5828
558f 3a6790    ld      a,($9067)
5592 219887    ld      hl,$8798
5595 96        sub     (hl)
5596 d601      sub     $01
5598 9f        sbc     a,a
5599 329d87    ld      ($879d),a
559c 3a6790    ld      a,($9067)
559f 21ee91    ld      hl,$91ee
55a2 96        sub     (hl)
55a3 d601      sub     $01
55a5 9f        sbc     a,a
55a6 219d87    ld      hl,$879d
55a9 b6        or      (hl)
55aa 329e87    ld      ($879e),a
55ad b7        or      a
55ae c2da55    jp      nz,$55da
55b1 3a6790    ld      a,($9067)
55b4 219987    ld      hl,$8799
55b7 96        sub     (hl)
55b8 d601      sub     $01
55ba 9f        sbc     a,a
55bb 329d87    ld      ($879d),a
55be 3a6790    ld      a,($9067)
55c1 21ef91    ld      hl,$91ef
55c4 96        sub     (hl)
55c5 d601      sub     $01
55c7 9f        sbc     a,a
55c8 219d87    ld      hl,$879d
55cb b6        or      (hl)
55cc 329e87    ld      ($879e),a
55cf b7        or      a
55d0 c2e155    jp      nz,$55e1
55d3 21e755    ld      hl,$55e7
55d6 cdc876    call    $76c8
55d9 c9        ret     

55da 3eff      ld      a,$ff
55dc 2a9687    ld      hl,($8796)
55df 77        ld      (hl),a
55e0 c9        ret     

55e1 af        xor     a
55e2 2a9687    ld      hl,($8796)
55e5 77        ld      (hl),a
55e6 c9        ret     

55e7 0a        ld      a,(bc)
55e8 00        nop     
55e9 00        nop     
55ea 00        nop     
55eb 22a087    ld      ($87a0),hl
55ee 3a5e90    ld      a,($905e)
55f1 b7        or      a
55f2 c21a56    jp      nz,$561a
55f5 cda256    call    $56a2
55f8 3a978e    ld      a,($8e97)
55fb d602      sub     $02
55fd c6ff      add     a,$ff
55ff 9f        sbc     a,a
5600 32a587    ld      ($87a5),a
5603 b7        or      a
5604 ca0d56    jp      z,$560d
5607 212d56    ld      hl,$562d
560a cdc876    call    $76c8
560d 01958e    ld      bc,$8e95
5610 113f8d    ld      de,$8d3f
5613 2aa087    ld      hl,($87a0)
5616 cda370    call    $70a3
5619 c9        ret     

561a 21a687    ld      hl,$87a6
561d cde861    call    $61e8
5620 113156    ld      de,$5631
5623 2aa087    ld      hl,($87a0)
5626 cd1b4f    call    $4f1b
5629 cd9061    call    $6190
562c c9        ret     

562d 1f        rra     
562e 00        nop     
562f 00        nop     
5630 00        nop     
5631 05        dec     b
5632 00        nop     
5633 00        nop     
5634 00        nop     
5635 22ab87    ld      ($87ab),hl
5638 cda256    call    $56a2
563b 21c890    ld      hl,$90c8
563e cdcd81    call    $81cd
5641 2aab87    ld      hl,($87ab)
5644 cdbe81    call    $81be
5647 3a978e    ld      a,($8e97)
564a d602      sub     $02
564c d601      sub     $01
564e 9f        sbc     a,a
564f 32b187    ld      ($87b1),a
5652 b7        or      a
5653 ca5756    jp      z,$5657
5656 c9        ret     

5657 01c790    ld      bc,$90c7
565a 117390    ld      de,$9073
565d 2aab87    ld      hl,($87ab)
5660 cd9e5e    call    $5e9e
5663 32b187    ld      ($87b1),a
5666 b7        or      a
5667 ca7056    jp      z,$5670
566a 217156    ld      hl,$5671
566d cdc876    call    $76c8
5670 c9        ret     

5671 0b        dec     bc
5672 00        nop     
5673 00        nop     
5674 00        nop     
5675 22bb87    ld      ($87bb),hl
5678 eb        ex      de,hl
5679 22bd87    ld      ($87bd),hl
567c 11c790    ld      de,$90c7
567f 217390    ld      hl,$9073
5682 cd2858    call    $5828
5685 01c790    ld      bc,$90c7
5688 117390    ld      de,$9073
568b 2abb87    ld      hl,($87bb)
568e cd5962    call    $6259
5691 32b387    ld      ($87b3),a
5694 2a958e    ld      hl,($8e95)
5697 eb        ex      de,hl
5698 2abd87    ld      hl,($87bd)
569b 73        ld      (hl),e
569c 23        inc     hl
569d 72        ld      (hl),d
569e 3ab387    ld      a,($87b3)
56a1 c9        ret     

56a2 013b57    ld      bc,$573b
56a5 11d187    ld      de,$87d1
56a8 217390    ld      hl,$9073
56ab cd7944    call    $4479
56ae 11c790    ld      de,$90c7
56b1 217390    ld      hl,$9073
56b4 cd2858    call    $5828
56b7 af        xor     a
56b8 32978e    ld      ($8e97),a
56bb 217390    ld      hl,$9073
56be cd4757    call    $5747
56c1 32c487    ld      ($87c4),a
56c4 2f        cpl     
56c5 32d287    ld      ($87d2),a
56c8 b7        or      a
56c9 cad056    jp      z,$56d0
56cc 3ac487    ld      a,($87c4)
56cf c9        ret     

56d0 3a978e    ld      a,($8e97)
56d3 d602      sub     $02
56d5 c6ff      add     a,$ff
56d7 9f        sbc     a,a
56d8 32d287    ld      ($87d2),a
56db b7        or      a
56dc c2ef56    jp      nz,$56ef
56df 01958e    ld      bc,$8e95
56e2 113f8d    ld      de,$8d3f
56e5 21c890    ld      hl,$90c8
56e8 cd7870    call    $7078
56eb 3ac487    ld      a,($87c4)
56ee c9        ret     

56ef 3a978e    ld      a,($8e97)
56f2 d605      sub     $05
56f4 c6ff      add     a,$ff
56f6 9f        sbc     a,a
56f7 32d287    ld      ($87d2),a
56fa b7        or      a
56fb c21c57    jp      nz,$571c
56fe af        xor     a
56ff 325c8d    ld      ($8d5c),a
5702 11608d    ld      de,$8d60
5705 21958e    ld      hl,$8e95
5708 cd5038    call    $3850
570b 32d287    ld      ($87d2),a
570e b7        or      a
570f ca1857    jp      z,$5718
5712 213f57    ld      hl,$573f
5715 cdc876    call    $76c8
5718 3ac487    ld      a,($87c4)
571b c9        ret     

571c 3eff      ld      a,$ff
571e 325c8d    ld      ($8d5c),a
5721 115e8d    ld      de,$8d5e
5724 21958e    ld      hl,$8e95
5727 cd5038    call    $3850
572a 32d287    ld      ($87d2),a
572d b7        or      a
572e ca3757    jp      z,$5737
5731 214357    ld      hl,$5743
5734 cdc876    call    $76c8
5737 3ac487    ld      a,($87c4)
573a c9        ret     

573b 0600      ld      b,$00
573d 00        nop     
573e 00        nop     
573f 17        rla     
5740 00        nop     
5741 00        nop     
5742 00        nop     
5743 1d        dec     e
5744 00        nop     
5745 00        nop     
5746 00        nop     
5747 22dc87    ld      ($87dc),hl
574a 01da57    ld      bc,$57da
574d 2adc87    ld      hl,($87dc)
5750 eb        ex      de,hl
5751 21cb8e    ld      hl,$8ecb
5754 cd5962    call    $6259
5757 32e487    ld      ($87e4),a
575a b7        or      a
575b c29f57    jp      nz,$579f
575e 21e587    ld      hl,$87e5
5761 cdde57    call    $57de
5764 2f        cpl     
5765 32e487    ld      ($87e4),a
5768 b7        or      a
5769 c27457    jp      nz,$5774
576c 3e04      ld      a,$04
576e 32978e    ld      ($8e97),a
5771 c3bc57    jp      $57bc
5774 116e8d    ld      de,$8d6e
5777 21958e    ld      hl,$8e95
577a cd5038    call    $3850
577d 32e487    ld      ($87e4),a
5780 21e687    ld      hl,$87e6
5783 cdde57    call    $57de
5786 2f        cpl     
5787 21e487    ld      hl,$87e4
578a b6        or      (hl)
578b 32e787    ld      ($87e7),a
578e b7        or      a
578f c29a57    jp      nz,$579a
5792 3e05      ld      a,$05
5794 32978e    ld      ($8e97),a
5797 c3bc57    jp      $57bc
579a af        xor     a
579b 32d487    ld      ($87d4),a
579e c9        ret     

579f 2a958e    ld      hl,($8e95)
57a2 22e887    ld      ($87e8),hl
57a5 11f98f    ld      de,$8ff9
57a8 19        add     hl,de
57a9 7e        ld      a,(hl)
57aa 32978e    ld      ($8e97),a
57ad 2ae887    ld      hl,($87e8)
57b0 112b90    ld      de,$902b
57b3 19        add     hl,de
57b4 7e        ld      a,(hl)
57b5 6f        ld      l,a
57b6 17        rla     
57b7 9f        sbc     a,a
57b8 67        ld      h,a
57b9 22958e    ld      ($8e95),hl
57bc af        xor     a
57bd 325c8d    ld      ($8d5c),a
57c0 3a978e    ld      a,($8e97)
57c3 d604      sub     $04
57c5 d601      sub     $01
57c7 9f        sbc     a,a
57c8 32e487    ld      ($87e4),a
57cb b7        or      a
57cc cad457    jp      z,$57d4
57cf 3eff      ld      a,$ff
57d1 325c8d    ld      ($8d5c),a
57d4 3eff      ld      a,$ff
57d6 32d487    ld      ($87d4),a
57d9 c9        ret     

57da 0600      ld      b,$00
57dc 00        nop     
57dd 00        nop     
57de 22f387    ld      ($87f3),hl
57e1 3a7390    ld      a,($9073)
57e4 e65f      and     $5f
57e6 2af387    ld      hl,($87f3)
57e9 96        sub     (hl)
57ea c6ff      add     a,$ff
57ec 9f        sbc     a,a
57ed 32f987    ld      ($87f9),a
57f0 b7        or      a
57f1 c22058    jp      nz,$5820
57f4 3ac790    ld      a,($90c7)
57f7 3d        dec     a
57f8 32f987    ld      ($87f9),a
57fb 01f987    ld      bc,$87f9
57fe 117490    ld      de,$9074
5801 21fa87    ld      hl,$87fa
5804 cd9e5e    call    $5e9e
5807 32fe87    ld      ($87fe),a
580a b7        or      a
580b c22058    jp      nz,$5820
580e 21fa87    ld      hl,$87fa
5811 cdcd81    call    $81cd
5814 cd807a    call    $7a80
5817 22958e    ld      ($8e95),hl
581a 3eff      ld      a,$ff
581c 32eb87    ld      ($87eb),a
581f c9        ret     

5820 af        xor     a
5821 32eb87    ld      ($87eb),a
5824 3aeb87    ld      a,($87eb)
5827 c9        ret     

5828 220088    ld      ($8800),hl
582b eb        ex      de,hl
582c 220288    ld      ($8802),hl
582f 3a5e90    ld      a,($905e)
5832 b7        or      a
5833 ca3c58    jp      z,$583c
5836 21545a    ld      hl,$5a54
5839 cdc876    call    $76c8
583c af        xor     a
583d 2a0288    ld      hl,($8802)
5840 77        ld      (hl),a
5841 210000    ld      hl,$0000
5844 227190    ld      ($9071),hl
5847 2acc90    ld      hl,($90cc)
584a 226590    ld      ($9065),hl
584d af        xor     a
584e 320588    ld      ($8805),a
5851 11d390    ld      de,$90d3
5854 21cc90    ld      hl,$90cc
5857 cd5038    call    $3850
585a 321988    ld      ($8819),a
585d b7        or      a
585e c2dd59    jp      nz,$59dd
5861 2acc90    ld      hl,($90cc)
5864 11d490    ld      de,$90d4
5867 19        add     hl,de
5868 7e        ld      a,(hl)
5869 320688    ld      ($8806),a
586c d601      sub     $01
586e 9f        sbc     a,a
586f 321988    ld      ($8819),a
5872 b7        or      a
5873 c28a59    jp      nz,$598a
5876 3a0588    ld      a,($8805)
5879 b7        or      a
587a c2bf58    jp      nz,$58bf
587d 2a0288    ld      hl,($8802)
5880 7e        ld      a,(hl)
5881 216390    ld      hl,$9063
5884 96        sub     (hl)
5885 17        rla     
5886 3f        ccf     
5887 9f        sbc     a,a
5888 321988    ld      ($8819),a
588b b7        or      a
588c c28a59    jp      nz,$598a
588f 3a3b8d    ld      a,($8d3b)
5892 b7        or      a
5893 c2eb58    jp      nz,$58eb
5896 3a0688    ld      a,($8806)
5899 210b88    ld      hl,$880b
589c 96        sub     (hl)
589d d601      sub     $01
589f 9f        sbc     a,a
58a0 321988    ld      ($8819),a
58a3 b7        or      a
58a4 c2b459    jp      nz,$59b4
58a7 3a0688    ld      a,($8806)
58aa 210888    ld      hl,$8808
58ad 96        sub     (hl)
58ae d601      sub     $01
58b0 9f        sbc     a,a
58b1 321988    ld      ($8819),a
58b4 b7        or      a
58b5 c2aa59    jp      nz,$59aa
58b8 3a6890    ld      a,($9068)
58bb b7        or      a
58bc c25e59    jp      nz,$595e
58bf 3a0688    ld      a,($8806)
58c2 210c88    ld      hl,$880c
58c5 96        sub     (hl)
58c6 d601      sub     $01
58c8 9f        sbc     a,a
58c9 321988    ld      ($8819),a
58cc b7        or      a
58cd c2f959    jp      nz,$59f9
58d0 3a0688    ld      a,($8806)
58d3 210d88    ld      hl,$880d
58d6 96        sub     (hl)
58d7 d601      sub     $01
58d9 9f        sbc     a,a
58da 321988    ld      ($8819),a
58dd b7        or      a
58de c2025a    jp      nz,$5a02
58e1 3a7090    ld      a,($9070)
58e4 b7        or      a
58e5 c20b5a    jp      nz,$5a0b
58e8 c31e59    jp      $591e
58eb 3a0688    ld      a,($8806)
58ee 216e90    ld      hl,$906e
58f1 96        sub     (hl)
58f2 d601      sub     $01
58f4 9f        sbc     a,a
58f5 321988    ld      ($8819),a
58f8 3a0688    ld      a,($8806)
58fb 216d90    ld      hl,$906d
58fe 96        sub     (hl)
58ff d601      sub     $01
5901 9f        sbc     a,a
5902 321a88    ld      ($881a),a
5905 3a0688    ld      a,($8806)
5908 216c90    ld      hl,$906c
590b 96        sub     (hl)
590c d601      sub     $01
590e 9f        sbc     a,a
590f 211a88    ld      hl,$881a
5912 b6        or      (hl)
5913 211988    ld      hl,$8819
5916 b6        or      (hl)
5917 321b88    ld      ($881b),a
591a b7        or      a
591b c28059    jp      nz,$5980
591e 3a0688    ld      a,($8806)
5921 216a90    ld      hl,$906a
5924 96        sub     (hl)
5925 d601      sub     $01
5927 9f        sbc     a,a
5928 321988    ld      ($8819),a
592b b7        or      a
592c c28a59    jp      nz,$598a
592f 3a0688    ld      a,($8806)
5932 210988    ld      hl,$8809
5935 96        sub     (hl)
5936 d601      sub     $01
5938 9f        sbc     a,a
5939 321988    ld      ($8819),a
593c b7        or      a
593d c29459    jp      nz,$5994
5940 3a0588    ld      a,($8805)
5943 b7        or      a
5944 c2e859    jp      nz,$59e8
5947 3a0688    ld      a,($8806)
594a 210a88    ld      hl,$880a
594d 96        sub     (hl)
594e d601      sub     $01
5950 9f        sbc     a,a
5951 321988    ld      ($8819),a
5954 b7        or      a
5955 ca5e59    jp      z,$595e
5958 3a0988    ld      a,($8809)
595b 320688    ld      ($8806),a
595e 2a0288    ld      hl,($8802)
5961 7e        ld      a,(hl)
5962 3c        inc     a
5963 2a0288    ld      hl,($8802)
5966 77        ld      (hl),a
5967 7e        ld      a,(hl)
5968 6f        ld      l,a
5969 17        rla     
596a 9f        sbc     a,a
596b 67        ld      h,a
596c eb        ex      de,hl
596d 21ffff    ld      hl,$ffff
5970 19        add     hl,de
5971 eb        ex      de,hl
5972 2a0088    ld      hl,($8800)
5975 19        add     hl,de
5976 221c88    ld      ($881c),hl
5979 3a0688    ld      a,($8806)
597c 2a1c88    ld      hl,($881c)
597f 77        ld      (hl),a
5980 2acc90    ld      hl,($90cc)
5983 23        inc     hl
5984 22cc90    ld      ($90cc),hl
5987 c35158    jp      $5851
598a 2acc90    ld      hl,($90cc)
598d 23        inc     hl
598e 22cc90    ld      ($90cc),hl
5991 c3e859    jp      $59e8
5994 2a0288    ld      hl,($8802)
5997 7e        ld      a,(hl)
5998 c6ff      add     a,$ff
599a 9f        sbc     a,a
599b 321988    ld      ($8819),a
599e b7        or      a
599f caa759    jp      z,$59a7
59a2 3eff      ld      a,$ff
59a4 320588    ld      ($8805),a
59a7 c38059    jp      $5980
59aa 3a6890    ld      a,($9068)
59ad 2f        cpl     
59ae 326890    ld      ($9068),a
59b1 c38059    jp      $5980
59b4 2a0288    ld      hl,($8802)
59b7 7e        ld      a,(hl)
59b8 3c        inc     a
59b9 2a0288    ld      hl,($8802)
59bc 77        ld      (hl),a
59bd 7e        ld      a,(hl)
59be 6f        ld      l,a
59bf 17        rla     
59c0 9f        sbc     a,a
59c1 67        ld      h,a
59c2 eb        ex      de,hl
59c3 21ffff    ld      hl,$ffff
59c6 19        add     hl,de
59c7 eb        ex      de,hl
59c8 2a0088    ld      hl,($8800)
59cb 19        add     hl,de
59cc 221c88    ld      ($881c),hl
59cf 3e0d      ld      a,$0d
59d1 2a1c88    ld      hl,($881c)
59d4 77        ld      (hl),a
59d5 3e0a      ld      a,$0a
59d7 320688    ld      ($8806),a
59da c35e59    jp      $595e
59dd 3eff      ld      a,$ff
59df 325e90    ld      ($905e),a
59e2 210200    ld      hl,$0002
59e5 227190    ld      ($9071),hl
59e8 2a0088    ld      hl,($8800)
59eb 7e        ld      a,(hl)
59ec 326790    ld      ($9067),a
59ef 3e50      ld      a,$50
59f1 326390    ld      ($9063),a
59f4 af        xor     a
59f5 327090    ld      ($9070),a
59f8 c9        ret     

59f9 210300    ld      hl,$0003
59fc 227190    ld      ($9071),hl
59ff c38a59    jp      $598a
5a02 210a00    ld      hl,$000a
5a05 227190    ld      ($9071),hl
5a08 c38a59    jp      $598a
5a0b 3a0688    ld      a,($8806)
5a0e d620      sub     $20
5a10 d601      sub     $01
5a12 9f        sbc     a,a
5a13 321988    ld      ($8819),a
5a16 b7        or      a
5a17 c28059    jp      nz,$5980
5a1a 210100    ld      hl,$0001
5a1d 221e88    ld      ($881e),hl
5a20 2a1e88    ld      hl,($881e)
5a23 23        inc     hl
5a24 23        inc     hl
5a25 23        inc     hl
5a26 227190    ld      ($9071),hl
5a29 2a1e88    ld      hl,($881e)
5a2c 110d88    ld      de,$880d
5a2f 19        add     hl,de
5a30 221c88    ld      ($881c),hl
5a33 3a0688    ld      a,($8806)
5a36 2a1c88    ld      hl,($881c)
5a39 96        sub     (hl)
5a3a d601      sub     $01
5a3c 9f        sbc     a,a
5a3d 321988    ld      ($8819),a
5a40 b7        or      a
5a41 c28a59    jp      nz,$598a
5a44 2a1e88    ld      hl,($881e)
5a47 23        inc     hl
5a48 3e08      ld      a,$08
5a4a 95        sub     l
5a4b 3e00      ld      a,$00
5a4d 9c        sbc     a,h
5a4e f21d5a    jp      p,$5a1d
5a51 c35e59    jp      $595e
5a54 13        inc     de
5a55 00        nop     
5a56 00        nop     
5a57 00        nop     
5a58 2a6590    ld      hl,($9065)
5a5b 22cc90    ld      ($90cc),hl
5a5e af        xor     a
5a5f 325e90    ld      ($905e),a
5a62 c9        ret     

5a63 222588    ld      ($8825),hl
5a66 eb        ex      de,hl
5a67 222788    ld      ($8827),hl
5a6a 60        ld      h,b
5a6b 69        ld      l,c
5a6c 222988    ld      ($8829),hl
5a6f 3eff      ld      a,$ff
5a71 323488    ld      ($8834),a
5a74 af        xor     a
5a75 323588    ld      ($8835),a
5a78 2a2788    ld      hl,($8827)
5a7b 223888    ld      ($8838),hl
5a7e 2a2988    ld      hl,($8829)
5a81 223a88    ld      ($883a),hl
5a84 013888    ld      bc,$8838
5a87 11935b    ld      de,$5b93
5a8a 2a2588    ld      hl,($8825)
5a8d cd975b    call    $5b97
5a90 3a3688    ld      a,($8836)
5a93 322d88    ld      ($882d),a
5a96 210100    ld      hl,$0001
5a99 223688    ld      ($8836),hl
5a9c 3e01      ld      a,$01
5a9e 322c88    ld      ($882c),a
5aa1 3e01      ld      a,$01
5aa3 322b88    ld      ($882b),a
5aa6 3a2b88    ld      a,($882b)
5aa9 6f        ld      l,a
5aaa 17        rla     
5aab 9f        sbc     a,a
5aac 67        ld      h,a
5aad eb        ex      de,hl
5aae 21ffff    ld      hl,$ffff
5ab1 19        add     hl,de
5ab2 eb        ex      de,hl
5ab3 2a2988    ld      hl,($8829)
5ab6 19        add     hl,de
5ab7 7e        ld      a,(hl)
5ab8 322e88    ld      ($882e),a
5abb 213388    ld      hl,$8833
5abe 96        sub     (hl)
5abf d601      sub     $01
5ac1 9f        sbc     a,a
5ac2 323e88    ld      ($883e),a
5ac5 b7        or      a
5ac6 c2575b    jp      nz,$5b57
5ac9 3a2c88    ld      a,($882c)
5acc 6f        ld      l,a
5acd 17        rla     
5ace 9f        sbc     a,a
5acf 67        ld      h,a
5ad0 eb        ex      de,hl
5ad1 21ffff    ld      hl,$ffff
5ad4 19        add     hl,de
5ad5 eb        ex      de,hl
5ad6 2a2988    ld      hl,($8829)
5ad9 19        add     hl,de
5ada 223f88    ld      ($883f),hl
5add 3a2e88    ld      a,($882e)
5ae0 2a3f88    ld      hl,($883f)
5ae3 77        ld      (hl),a
5ae4 3a3488    ld      a,($8834)
5ae7 b7        or      a
5ae8 c2665b    jp      nz,$5b66
5aeb 3a2e88    ld      a,($882e)
5aee 213188    ld      hl,$8831
5af1 96        sub     (hl)
5af2 d601      sub     $01
5af4 9f        sbc     a,a
5af5 323e88    ld      ($883e),a
5af8 b7        or      a
5af9 c2335b    jp      nz,$5b33
5afc 3a2e88    ld      a,($882e)
5aff 212f88    ld      hl,$882f
5b02 96        sub     (hl)
5b03 d601      sub     $01
5b05 9f        sbc     a,a
5b06 323e88    ld      ($883e),a
5b09 b7        or      a
5b0a c24f5b    jp      nz,$5b4f
5b0d 3a2e88    ld      a,($882e)
5b10 213088    ld      hl,$8830
5b13 96        sub     (hl)
5b14 d601      sub     $01
5b16 9f        sbc     a,a
5b17 213588    ld      hl,$8835
5b1a a6        and     (hl)
5b1b 323e88    ld      ($883e),a
5b1e b7        or      a
5b1f c22c5b    jp      nz,$5b2c
5b22 3a2c88    ld      a,($882c)
5b25 6f        ld      l,a
5b26 17        rla     
5b27 9f        sbc     a,a
5b28 67        ld      h,a
5b29 223688    ld      ($8836),hl
5b2c 3a2c88    ld      a,($882c)
5b2f 3c        inc     a
5b30 322c88    ld      ($882c),a
5b33 3a2b88    ld      a,($882b)
5b36 212d88    ld      hl,$882d
5b39 be        cp      (hl)
5b3a 3c        inc     a
5b3b daa35a    jp      c,$5aa3
5b3e 2a3688    ld      hl,($8836)
5b41 eb        ex      de,hl
5b42 2a2988    ld      hl,($8829)
5b45 19        add     hl,de
5b46 223f88    ld      ($883f),hl
5b49 af        xor     a
5b4a 2a3f88    ld      hl,($883f)
5b4d 77        ld      (hl),a
5b4e c9        ret     

5b4f 3eff      ld      a,$ff
5b51 323588    ld      ($8835),a
5b54 c32c5b    jp      $5b2c
5b57 2a3688    ld      hl,($8836)
5b5a 23        inc     hl
5b5b 7d        ld      a,l
5b5c 322c88    ld      ($882c),a
5b5f af        xor     a
5b60 323588    ld      ($8835),a
5b63 c3c95a    jp      $5ac9
5b66 3a2e88    ld      a,($882e)
5b69 213288    ld      hl,$8832
5b6c 96        sub     (hl)
5b6d 3d        dec     a
5b6e c681      add     a,$81
5b70 9f        sbc     a,a
5b71 323e88    ld      ($883e),a
5b74 3a2e88    ld      a,($882e)
5b77 213088    ld      hl,$8830
5b7a 96        sub     (hl)
5b7b 17        rla     
5b7c 3f        ccf     
5b7d 9f        sbc     a,a
5b7e 213e88    ld      hl,$883e
5b81 a6        and     (hl)
5b82 324188    ld      ($8841),a
5b85 b7        or      a
5b86 c28c5b    jp      nz,$5b8c
5b89 c3eb5a    jp      $5aeb
5b8c af        xor     a
5b8d 323488    ld      ($8834),a
5b90 c3225b    jp      $5b22
5b93 0f        rrca    
5b94 00        nop     
5b95 00        nop     
5b96 00        nop     
5b97 224388    ld      ($8843),hl
5b9a eb        ex      de,hl
5b9b 224588    ld      ($8845),hl
5b9e 3e03      ld      a,$03
5ba0 214788    ld      hl,$8847
5ba3 cd6582    call    $8265
5ba6 2a4388    ld      hl,($8843)
5ba9 cdcd81    call    $81cd
5bac 21cf8b    ld      hl,$8bcf
5baf cdbe81    call    $81be
5bb2 2a4788    ld      hl,($8847)
5bb5 7e        ld      a,(hl)
5bb6 32cc8b    ld      ($8bcc),a
5bb9 2a4588    ld      hl,($8845)
5bbc 7e        ld      a,(hl)
5bbd 32cb8b    ld      ($8bcb),a
5bc0 af        xor     a
5bc1 32ce8b    ld      ($8bce),a
5bc4 af        xor     a
5bc5 324e88    ld      ($884e),a
5bc8 af        xor     a
5bc9 325188    ld      ($8851),a
5bcc 21cf8b    ld      hl,$8bcf
5bcf cdcd81    call    $81cd
5bd2 ca7a5d    jp      z,$5d7a
5bd5 f2f45b    jp      p,$5bf4
5bd8 115688    ld      de,$8856
5bdb 2a4988    ld      hl,($8849)
5bde cd5b5e    call    $5e5b
5be1 325788    ld      ($8857),a
5be4 b7        or      a
5be5 c2d85d    jp      nz,$5dd8
5be8 21cf8b    ld      hl,$8bcf
5beb cdda7b    call    $7bda
5bee 21cf8b    ld      hl,$8bcf
5bf1 cdbe81    call    $81be
5bf4 21cf8b    ld      hl,$8bcf
5bf7 cde17b    call    $7be1
5bfa 21035e    ld      hl,$5e03
5bfd cd8b7d    call    $7d8b
5c00 cd0a7a    call    $7a0a
5c03 32cd8b    ld      ($8bcd),a
5c06 d628      sub     $28
5c08 32cd8b    ld      ($8bcd),a
5c0b 215288    ld      hl,$8852
5c0e cdcd81    call    $81cd
5c11 3acd8b    ld      a,($8bcd)
5c14 6f        ld      l,a
5c15 17        rla     
5c16 9f        sbc     a,a
5c17 67        ld      h,a
5c18 cdf07b    call    $7bf0
5c1b 215888    ld      hl,$8858
5c1e cdbe81    call    $81be
5c21 215288    ld      hl,$8852
5c24 cdcd81    call    $81cd
5c27 3acc8b    ld      a,($8bcc)
5c2a 6f        ld      l,a
5c2b 17        rla     
5c2c 9f        sbc     a,a
5c2d 67        ld      h,a
5c2e cdf07b    call    $7bf0
5c31 215c88    ld      hl,$885c
5c34 cdbe81    call    $81be
5c37 21075e    ld      hl,$5e07
5c3a cdcd81    call    $81cd
5c3d 215c88    ld      hl,$885c
5c40 cd007e    call    $7e00
5c43 216088    ld      hl,$8860
5c46 cdbe81    call    $81be
5c49 21cf8b    ld      hl,$8bcf
5c4c cdcd81    call    $81cd
5c4f 215888    ld      hl,$8858
5c52 cd007e    call    $7e00
5c55 216088    ld      hl,$8860
5c58 cd8b7d    call    $7d8b
5c5b 21cf8b    ld      hl,$8bcf
5c5e cdbe81    call    $81be
5c61 3acc8b    ld      a,($8bcc)
5c64 c606      add     a,$06
5c66 324d88    ld      ($884d),a
5c69 3acd8b    ld      a,($8bcd)
5c6c 21cc8b    ld      hl,$8bcc
5c6f 96        sub     (hl)
5c70 17        rla     
5c71 9f        sbc     a,a
5c72 325788    ld      ($8857),a
5c75 b7        or      a
5c76 c2945c    jp      nz,$5c94
5c79 3acd8b    ld      a,($8bcd)
5c7c c603      add     a,$03
5c7e 325788    ld      ($8857),a
5c81 3a4d88    ld      a,($884d)
5c84 215788    ld      hl,$8857
5c87 96        sub     (hl)
5c88 17        rla     
5c89 9f        sbc     a,a
5c8a 326488    ld      ($8864),a
5c8d b7        or      a
5c8e c26d5d    jp      nz,$5d6d
5c91 c3d55c    jp      $5cd5
5c94 3acd8b    ld      a,($8bcd)
5c97 17        rla     
5c98 9f        sbc     a,a
5c99 325788    ld      ($8857),a
5c9c b7        or      a
5c9d c2b75c    jp      nz,$5cb7
5ca0 3acc8b    ld      a,($8bcc)
5ca3 c602      add     a,$02
5ca5 214d88    ld      hl,$884d
5ca8 96        sub     (hl)
5ca9 3d        dec     a
5caa d67f      sub     $7f
5cac 9f        sbc     a,a
5cad 325788    ld      ($8857),a
5cb0 b7        or      a
5cb1 c26d5d    jp      nz,$5d6d
5cb4 c3d55c    jp      $5cd5
5cb7 3acd8b    ld      a,($8bcd)
5cba 214d88    ld      hl,$884d
5cbd 86        add     a,(hl)
5cbe 325788    ld      ($8857),a
5cc1 3acc8b    ld      a,($8bcc)
5cc4 c602      add     a,$02
5cc6 215788    ld      hl,$8857
5cc9 96        sub     (hl)
5cca 3d        dec     a
5ccb d67f      sub     $7f
5ccd 9f        sbc     a,a
5cce 326488    ld      ($8864),a
5cd1 b7        or      a
5cd2 c26d5d    jp      nz,$5d6d
5cd5 3acd8b    ld      a,($8bcd)
5cd8 17        rla     
5cd9 3f        ccf     
5cda 9f        sbc     a,a
5cdb 325788    ld      ($8857),a
5cde b7        or      a
5cdf c2025d    jp      nz,$5d02
5ce2 3acc8b    ld      a,($8bcc)
5ce5 21cd8b    ld      hl,$8bcd
5ce8 96        sub     (hl)
5ce9 32cc8b    ld      ($8bcc),a
5cec af        xor     a
5ced 32cd8b    ld      ($8bcd),a
5cf0 215888    ld      hl,$8858
5cf3 cdcd81    call    $81cd
5cf6 21cf8b    ld      hl,$8bcf
5cf9 cdfe7e    call    $7efe
5cfc 21cf8b    ld      hl,$8bcf
5cff cdbe81    call    $81be
5d02 2a4988    ld      hl,($8849)
5d05 cd0b5e    call    $5e0b
5d08 325788    ld      ($8857),a
5d0b b7        or      a
5d0c c2d85d    jp      nz,$5dd8
5d0f 3acc8b    ld      a,($8bcc)
5d12 3d        dec     a
5d13 3d        dec     a
5d14 d67f      sub     $7f
5d16 9f        sbc     a,a
5d17 325788    ld      ($8857),a
5d1a b7        or      a
5d1b c2385d    jp      nz,$5d38
5d1e 3acd8b    ld      a,($8bcd)
5d21 3d        dec     a
5d22 c681      add     a,$81
5d24 9f        sbc     a,a
5d25 325788    ld      ($8857),a
5d28 b7        or      a
5d29 c28b5d    jp      nz,$5d8b
5d2c 21ff5d    ld      hl,$5dff
5d2f cdcd81    call    $81cd
5d32 21cf8b    ld      hl,$8bcf
5d35 cdbe81    call    $81be
5d38 3acc8b    ld      a,($8bcc)
5d3b 3d        dec     a
5d3c 32cc8b    ld      ($8bcc),a
5d3f 3acd8b    ld      a,($8bcd)
5d42 c6ff      add     a,$ff
5d44 9f        sbc     a,a
5d45 325788    ld      ($8857),a
5d48 b7        or      a
5d49 c2635d    jp      nz,$5d63
5d4c 3a5188    ld      a,($8851)
5d4f b7        or      a
5d50 c28b5d    jp      nz,$5d8b
5d53 116588    ld      de,$8865
5d56 2a4988    ld      hl,($8849)
5d59 cd5b5e    call    $5e5b
5d5c 325788    ld      ($8857),a
5d5f b7        or      a
5d60 c2d85d    jp      nz,$5dd8
5d63 3acd8b    ld      a,($8bcd)
5d66 3d        dec     a
5d67 32cd8b    ld      ($8bcd),a
5d6a c3025d    jp      $5d02
5d6d 3acd8b    ld      a,($8bcd)
5d70 324e88    ld      ($884e),a
5d73 af        xor     a
5d74 32cd8b    ld      ($8bcd),a
5d77 c3025d    jp      $5d02
5d7a 3e30      ld      a,$30
5d7c 2a4988    ld      hl,($8849)
5d7f 77        ld      (hl),a
5d80 210100    ld      hl,$0001
5d83 eb        ex      de,hl
5d84 2a4b88    ld      hl,($884b)
5d87 73        ld      (hl),e
5d88 23        inc     hl
5d89 72        ld      (hl),d
5d8a c9        ret     

5d8b 3a4e88    ld      a,($884e)
5d8e d601      sub     $01
5d90 9f        sbc     a,a
5d91 325788    ld      ($8857),a
5d94 b7        or      a
5d95 c2c95d    jp      nz,$5dc9
5d98 116688    ld      de,$8866
5d9b 2a4988    ld      hl,($8849)
5d9e cd5b5e    call    $5e5b
5da1 325788    ld      ($8857),a
5da4 b7        or      a
5da5 c2d85d    jp      nz,$5dd8
5da8 3e02      ld      a,$02
5daa 32cc8b    ld      ($8bcc),a
5dad 3a4e88    ld      a,($884e)
5db0 6f        ld      l,a
5db1 17        rla     
5db2 9f        sbc     a,a
5db3 67        ld      h,a
5db4 cdde7f    call    $7fde
5db7 21cf8b    ld      hl,$8bcf
5dba cdbe81    call    $81be
5dbd af        xor     a
5dbe 324e88    ld      ($884e),a
5dc1 3eff      ld      a,$ff
5dc3 325188    ld      ($8851),a
5dc6 c3cc5b    jp      $5bcc
5dc9 3ace8b    ld      a,($8bce)
5dcc 6f        ld      l,a
5dcd 17        rla     
5dce 9f        sbc     a,a
5dcf 67        ld      h,a
5dd0 eb        ex      de,hl
5dd1 2a4b88    ld      hl,($884b)
5dd4 73        ld      (hl),e
5dd5 23        inc     hl
5dd6 72        ld      (hl),d
5dd7 c9        ret     

5dd8 af        xor     a
5dd9 32ce8b    ld      ($8bce),a
5ddc 3e01      ld      a,$01
5dde 32cc8b    ld      ($8bcc),a
5de1 116788    ld      de,$8867
5de4 2a4988    ld      hl,($8849)
5de7 cd5b5e    call    $5e5b
5dea 325788    ld      ($8857),a
5ded b7        or      a
5dee c28b5d    jp      nz,$5d8b
5df1 3acc8b    ld      a,($8bcc)
5df4 2a4788    ld      hl,($8847)
5df7 be        cp      (hl)
5df8 3c        inc     a
5df9 dade5d    jp      c,$5dde
5dfc c38b5d    jp      $5d8b
5dff 00        nop     
5e00 00        nop     
5e01 00        nop     
5e02 00        nop     
5e03 00        nop     
5e04 00        nop     
5e05 2086      jr      nz,$5d8d
5e07 00        nop     
5e08 00        nop     
5e09 2083      jr      nz,$5d8e
5e0b 227188    ld      ($8871),hl
5e0e 21cf8b    ld      hl,$8bcf
5e11 cdcd81    call    $81cd
5e14 cd0a7a    call    $7a0a
5e17 327488    ld      ($8874),a
5e1a 21cf8b    ld      hl,$8bcf
5e1d cdcd81    call    $81cd
5e20 3a7488    ld      a,($8874)
5e23 6f        ld      l,a
5e24 17        rla     
5e25 9f        sbc     a,a
5e26 67        ld      h,a
5e27 cde77d    call    $7de7
5e2a 21cf8b    ld      hl,$8bcf
5e2d cdbe81    call    $81be
5e30 21575e    ld      hl,$5e57
5e33 cdcd81    call    $81cd
5e36 21cf8b    ld      hl,$8bcf
5e39 cdfe7e    call    $7efe
5e3c 21cf8b    ld      hl,$8bcf
5e3f cdbe81    call    $81be
5e42 3a7488    ld      a,($8874)
5e45 c630      add     a,$30
5e47 327588    ld      ($8875),a
5e4a 117588    ld      de,$8875
5e4d 2a7188    ld      hl,($8871)
5e50 cd5b5e    call    $5e5b
5e53 326988    ld      ($8869),a
5e56 c9        ret     

5e57 00        nop     
5e58 00        nop     
5e59 2084      jr      nz,$5ddf
5e5b 227f88    ld      ($887f),hl
5e5e eb        ex      de,hl
5e5f 228188    ld      ($8881),hl
5e62 3ace8b    ld      a,($8bce)
5e65 21cb8b    ld      hl,$8bcb
5e68 96        sub     (hl)
5e69 17        rla     
5e6a 3f        ccf     
5e6b 9f        sbc     a,a
5e6c 328388    ld      ($8883),a
5e6f b7        or      a
5e70 c2985e    jp      nz,$5e98
5e73 3ace8b    ld      a,($8bce)
5e76 3c        inc     a
5e77 32ce8b    ld      ($8bce),a
5e7a 6f        ld      l,a
5e7b 17        rla     
5e7c 9f        sbc     a,a
5e7d 67        ld      h,a
5e7e eb        ex      de,hl
5e7f 21ffff    ld      hl,$ffff
5e82 19        add     hl,de
5e83 eb        ex      de,hl
5e84 2a7f88    ld      hl,($887f)
5e87 19        add     hl,de
5e88 228488    ld      ($8884),hl
5e8b 2a8188    ld      hl,($8881)
5e8e 7e        ld      a,(hl)
5e8f 2a8488    ld      hl,($8884)
5e92 77        ld      (hl),a
5e93 af        xor     a
5e94 327788    ld      ($8877),a
5e97 c9        ret     

5e98 3eff      ld      a,$ff
5e9a 327788    ld      ($8877),a
5e9d c9        ret     

5e9e 228f88    ld      ($888f),hl
5ea1 eb        ex      de,hl
5ea2 229188    ld      ($8891),hl
5ea5 60        ld      h,b
5ea6 69        ld      l,c
5ea7 229388    ld      ($8893),hl
5eaa 2a9388    ld      hl,($8893)
5ead 7e        ld      a,(hl)
5eae 326d8c    ld      ($8c6d),a
5eb1 af        xor     a
5eb2 32718c    ld      ($8c71),a
5eb5 2a9188    ld      hl,($8891)
5eb8 cd135f    call    $5f13
5ebb 3a6f8c    ld      a,($8c6f)
5ebe 328788    ld      ($8887),a
5ec1 b7        or      a
5ec2 cac95e    jp      z,$5ec9
5ec5 3a8788    ld      a,($8887)
5ec8 c9        ret     

5ec9 21648c    ld      hl,$8c64
5ecc cdcd81    call    $81cd
5ecf 2a8f88    ld      hl,($888f)
5ed2 cdbe81    call    $81be
5ed5 3a8788    ld      a,($8887)
5ed8 c9        ret     

5ed9 229e88    ld      ($889e),hl
5edc eb        ex      de,hl
5edd 22a088    ld      ($88a0),hl
5ee0 60        ld      h,b
5ee1 69        ld      l,c
5ee2 22a288    ld      ($88a2),hl
5ee5 2aa288    ld      hl,($88a2)
5ee8 7e        ld      a,(hl)
5ee9 326d8c    ld      ($8c6d),a
5eec 3eff      ld      a,$ff
5eee 32718c    ld      ($8c71),a
5ef1 2aa088    ld      hl,($88a0)
5ef4 cd135f    call    $5f13
5ef7 3a6f8c    ld      a,($8c6f)
5efa 329688    ld      ($8896),a
5efd b7        or      a
5efe ca055f    jp      z,$5f05
5f01 3a9688    ld      a,($8896)
5f04 c9        ret     

5f05 2a688c    ld      hl,($8c68)
5f08 eb        ex      de,hl
5f09 2a9e88    ld      hl,($889e)
5f0c 73        ld      (hl),e
5f0d 23        inc     hl
5f0e 72        ld      (hl),d
5f0f 3a9688    ld      a,($8896)
5f12 c9        ret     

5f13 22a588    ld      ($88a5),hl
5f16 af        xor     a
5f17 326e8c    ld      ($8c6e),a
5f1a af        xor     a
5f1b 326f8c    ld      ($8c6f),a
5f1e af        xor     a
5f1f 32ab88    ld      ($88ab),a
5f22 3e01      ld      a,$01
5f24 326b8c    ld      ($8c6b),a
5f27 214960    ld      hl,$6049
5f2a cdcd81    call    $81cd
5f2d 21648c    ld      hl,$8c64
5f30 cdbe81    call    $81be
5f33 2aa588    ld      hl,($88a5)
5f36 cd5160    call    $6051
5f39 3a6a8c    ld      a,($8c6a)
5f3c 3c        inc     a
5f3d 326b8c    ld      ($8c6b),a
5f40 3a708c    ld      a,($8c70)
5f43 b7        or      a
5f44 c27c5f    jp      nz,$5f7c
5f47 3a6e8c    ld      a,($8c6e)
5f4a b7        or      a
5f4b ca4f5f    jp      z,$5f4f
5f4e c9        ret     

5f4f 3a6c8c    ld      a,($8c6c)
5f52 21a788    ld      hl,$88a7
5f55 96        sub     (hl)
5f56 d601      sub     $01
5f58 9f        sbc     a,a
5f59 32ad88    ld      ($88ad),a
5f5c b7        or      a
5f5d c2335f    jp      nz,$5f33
5f60 3a6c8c    ld      a,($8c6c)
5f63 21a888    ld      hl,$88a8
5f66 96        sub     (hl)
5f67 d601      sub     $01
5f69 9f        sbc     a,a
5f6a 32ad88    ld      ($88ad),a
5f6d b7        or      a
5f6e c2745f    jp      nz,$5f74
5f71 c34360    jp      $6043
5f74 3eff      ld      a,$ff
5f76 32ab88    ld      ($88ab),a
5f79 c3335f    jp      $5f33
5f7c 3a6e8c    ld      a,($8c6e)
5f7f b7        or      a
5f80 c22460    jp      nz,$6024
5f83 3a6c8c    ld      a,($8c6c)
5f86 21aa88    ld      hl,$88aa
5f89 96        sub     (hl)
5f8a c6ff      add     a,$ff
5f8c 9f        sbc     a,a
5f8d 21718c    ld      hl,$8c71
5f90 b6        or      (hl)
5f91 32ad88    ld      ($88ad),a
5f94 b7        or      a
5f95 c24360    jp      nz,$6043
5f98 3eff      ld      a,$ff
5f9a 32718c    ld      ($8c71),a
5f9d af        xor     a
5f9e 32ac88    ld      ($88ac),a
5fa1 2aa588    ld      hl,($88a5)
5fa4 cd5160    call    $6051
5fa7 3a6a8c    ld      a,($8c6a)
5faa 3c        inc     a
5fab 326b8c    ld      ($8c6b),a
5fae 3a708c    ld      a,($8c70)
5fb1 b7        or      a
5fb2 c2e25f    jp      nz,$5fe2
5fb5 3a6c8c    ld      a,($8c6c)
5fb8 21a788    ld      hl,$88a7
5fbb 96        sub     (hl)
5fbc d601      sub     $01
5fbe 9f        sbc     a,a
5fbf 32ad88    ld      ($88ad),a
5fc2 b7        or      a
5fc3 c2a15f    jp      nz,$5fa1
5fc6 3a6c8c    ld      a,($8c6c)
5fc9 21a888    ld      hl,$88a8
5fcc 96        sub     (hl)
5fcd d601      sub     $01
5fcf 9f        sbc     a,a
5fd0 32ad88    ld      ($88ad),a
5fd3 b7        or      a
5fd4 c2da5f    jp      nz,$5fda
5fd7 c34360    jp      $6043
5fda 3eff      ld      a,$ff
5fdc 32ac88    ld      ($88ac),a
5fdf c3a15f    jp      $5fa1
5fe2 3aac88    ld      a,($88ac)
5fe5 b7        or      a
5fe6 caf55f    jp      z,$5ff5
5fe9 2a688c    ld      hl,($8c68)
5fec af        xor     a
5fed 95        sub     l
5fee 6f        ld      l,a
5fef 9c        sbc     a,h
5ff0 95        sub     l
5ff1 67        ld      h,a
5ff2 22688c    ld      ($8c68),hl
5ff5 214d60    ld      hl,$604d
5ff8 cdcd81    call    $81cd
5ffb 2a688c    ld      hl,($8c68)
5ffe cdf07b    call    $7bf0
6001 21648c    ld      hl,$8c64
6004 cdfe7e    call    $7efe
6007 21648c    ld      hl,$8c64
600a cdbe81    call    $81be
600d 3aab88    ld      a,($88ab)
6010 b7        or      a
6011 ca2360    jp      z,$6023
6014 21648c    ld      hl,$8c64
6017 cdcd81    call    $81cd
601a cd867c    call    $7c86
601d 21648c    ld      hl,$8c64
6020 cdbe81    call    $81be
6023 c9        ret     

6024 3a718c    ld      a,($8c71)
6027 2f        cpl     
6028 32ad88    ld      ($88ad),a
602b b7        or      a
602c c20d60    jp      nz,$600d
602f 3aab88    ld      a,($88ab)
6032 b7        or      a
6033 ca4260    jp      z,$6042
6036 2a688c    ld      hl,($8c68)
6039 af        xor     a
603a 95        sub     l
603b 6f        ld      l,a
603c 9c        sbc     a,h
603d 95        sub     l
603e 67        ld      h,a
603f 22688c    ld      ($8c68),hl
6042 c9        ret     

6043 3eff      ld      a,$ff
6045 326f8c    ld      ($8c6f),a
6048 c9        ret     

6049 00        nop     
604a 00        nop     
604b 00        nop     
604c 00        nop     
604d 00        nop     
604e 00        nop     
604f 2084      jr      nz,$5fd5
6051 22af88    ld      ($88af),hl
6054 21b788    ld      hl,$88b7
6057 cdcd81    call    $81cd
605a 21bb88    ld      hl,$88bb
605d cdbe81    call    $81be
6060 210000    ld      hl,$0000
6063 22688c    ld      ($8c68),hl
6066 af        xor     a
6067 32708c    ld      ($8c70),a
606a af        xor     a
606b 32b188    ld      ($88b1),a
606e 3a6b8c    ld      a,($8c6b)
6071 326a8c    ld      ($8c6a),a
6074 3a6a8c    ld      a,($8c6a)
6077 6f        ld      l,a
6078 17        rla     
6079 9f        sbc     a,a
607a 67        ld      h,a
607b eb        ex      de,hl
607c 21ffff    ld      hl,$ffff
607f 19        add     hl,de
6080 eb        ex      de,hl
6081 2aaf88    ld      hl,($88af)
6084 19        add     hl,de
6085 7e        ld      a,(hl)
6086 326c8c    ld      ($8c6c),a
6089 21b688    ld      hl,$88b6
608c 96        sub     (hl)
608d 3d        dec     a
608e d67f      sub     $7f
6090 9f        sbc     a,a
6091 32bf88    ld      ($88bf),a
6094 3a6c8c    ld      a,($8c6c)
6097 21b588    ld      hl,$88b5
609a 96        sub     (hl)
609b 17        rla     
609c 9f        sbc     a,a
609d 21bf88    ld      hl,$88bf
60a0 b6        or      (hl)
60a1 32c088    ld      ($88c0),a
60a4 b7        or      a
60a5 c23a61    jp      nz,$613a
60a8 3a6c8c    ld      a,($8c6c)
60ab d630      sub     $30
60ad 326c8c    ld      ($8c6c),a
60b0 3a718c    ld      a,($8c71)
60b3 b7        or      a
60b4 c20e61    jp      nz,$610e
60b7 3ab188    ld      a,($88b1)
60ba b7        or      a
60bb c2dd60    jp      nz,$60dd
60be 218c61    ld      hl,$618c
60c1 cdcd81    call    $81cd
60c4 21648c    ld      hl,$8c64
60c7 cdfe7e    call    $7efe
60ca 3a6c8c    ld      a,($8c6c)
60cd 6f        ld      l,a
60ce 17        rla     
60cf 9f        sbc     a,a
60d0 67        ld      h,a
60d1 cd857d    call    $7d85
60d4 21648c    ld      hl,$8c64
60d7 cdbe81    call    $81be
60da c32461    jp      $6124
60dd 21bb88    ld      hl,$88bb
60e0 cdcd81    call    $81cd
60e3 3a6c8c    ld      a,($8c6c)
60e6 6f        ld      l,a
60e7 17        rla     
60e8 9f        sbc     a,a
60e9 67        ld      h,a
60ea cdf87e    call    $7ef8
60ed 21648c    ld      hl,$8c64
60f0 cd8b7d    call    $7d8b
60f3 21648c    ld      hl,$8c64
60f6 cdbe81    call    $81be
60f9 21bb88    ld      hl,$88bb
60fc cdcd81    call    $81cd
60ff 21b788    ld      hl,$88b7
6102 cdfe7e    call    $7efe
6105 21bb88    ld      hl,$88bb
6108 cdbe81    call    $81be
610b c32461    jp      $6124
610e 2a688c    ld      hl,($8c68)
6111 eb        ex      de,hl
6112 210a00    ld      hl,$000a
6115 cd7d80    call    $807d
6118 eb        ex      de,hl
6119 3a6c8c    ld      a,($8c6c)
611c 6f        ld      l,a
611d 17        rla     
611e 9f        sbc     a,a
611f 67        ld      h,a
6120 19        add     hl,de
6121 22688c    ld      ($8c68),hl
6124 3eff      ld      a,$ff
6126 32708c    ld      ($8c70),a
6129 3a6a8c    ld      a,($8c6a)
612c 216d8c    ld      hl,$8c6d
612f be        cp      (hl)
6130 3c        inc     a
6131 da7160    jp      c,$6071
6134 3eff      ld      a,$ff
6136 326e8c    ld      ($8c6e),a
6139 c9        ret     

613a 3a6c8c    ld      a,($8c6c)
613d 21b288    ld      hl,$88b2
6140 96        sub     (hl)
6141 d601      sub     $01
6143 9f        sbc     a,a
6144 32bf88    ld      ($88bf),a
6147 b7        or      a
6148 c22961    jp      nz,$6129
614b 3a6c8c    ld      a,($8c6c)
614e 21b388    ld      hl,$88b3
6151 96        sub     (hl)
6152 d601      sub     $01
6154 9f        sbc     a,a
6155 32bf88    ld      ($88bf),a
6158 b7        or      a
6159 c23461    jp      nz,$6134
615c 3a6c8c    ld      a,($8c6c)
615f 21b488    ld      hl,$88b4
6162 96        sub     (hl)
6163 c6ff      add     a,$ff
6165 9f        sbc     a,a
6166 32bf88    ld      ($88bf),a
6169 b7        or      a
616a ca6e61    jp      z,$616e
616d c9        ret     

616e 3a718c    ld      a,($8c71)
6171 21b188    ld      hl,$88b1
6174 b6        or      (hl)
6175 32bf88    ld      ($88bf),a
6178 b7        or      a
6179 c28461    jp      nz,$6184
617c 3eff      ld      a,$ff
617e 32b188    ld      ($88b1),a
6181 c32961    jp      $6129
6184 3eff      ld      a,$ff
6186 326f8c    ld      ($8c6f),a
6189 c33461    jp      $6134
618c 00        nop     
618d 00        nop     
618e 2084      jr      nz,$6114
6190 219d61    ld      hl,$619d
6193 cd0e78    call    $780e
6196 21a161    ld      hl,$61a1
6199 cd0e78    call    $780e
619c c9        ret     

619d 0d        dec     c
619e 00        nop     
619f 00        nop     
61a0 00        nop     
61a1 0a        ld      a,(bc)
61a2 00        nop     
61a3 00        nop     
61a4 00        nop     
61a5 22c388    ld      ($88c3),hl
61a8 eb        ex      de,hl
61a9 22c588    ld      ($88c5),hl
61ac 3e01      ld      a,$01
61ae 32c788    ld      ($88c7),a
61b1 3ac788    ld      a,($88c7)
61b4 2ac588    ld      hl,($88c5)
61b7 96        sub     (hl)
61b8 3d        dec     a
61b9 d67f      sub     $7f
61bb 9f        sbc     a,a
61bc 32c888    ld      ($88c8),a
61bf b7        or      a
61c0 cac461    jp      z,$61c4
61c3 c9        ret     

61c4 3ac788    ld      a,($88c7)
61c7 6f        ld      l,a
61c8 17        rla     
61c9 9f        sbc     a,a
61ca 67        ld      h,a
61cb eb        ex      de,hl
61cc 21ffff    ld      hl,$ffff
61cf 19        add     hl,de
61d0 eb        ex      de,hl
61d1 2ac388    ld      hl,($88c3)
61d4 19        add     hl,de
61d5 22c988    ld      ($88c9),hl
61d8 2ac988    ld      hl,($88c9)
61db cd0e78    call    $780e
61de 3ac788    ld      a,($88c7)
61e1 3c        inc     a
61e2 32c788    ld      ($88c7),a
61e5 c3b161    jp      $61b1
61e8 22cc88    ld      ($88cc),hl
61eb 210100    ld      hl,$0001
61ee 22cf88    ld      ($88cf),hl
61f1 2acf88    ld      hl,($88cf)
61f4 2b        dec     hl
61f5 eb        ex      de,hl
61f6 2acc88    ld      hl,($88cc)
61f9 19        add     hl,de
61fa 7e        ld      a,(hl)
61fb 32ce88    ld      ($88ce),a
61fe d601      sub     $01
6200 9f        sbc     a,a
6201 32d188    ld      ($88d1),a
6204 3ace88    ld      a,($88ce)
6207 d624      sub     $24
6209 d601      sub     $01
620b 9f        sbc     a,a
620c 21d188    ld      hl,$88d1
620f b6        or      (hl)
6210 32d288    ld      ($88d2),a
6213 b7        or      a
6214 ca1862    jp      z,$6218
6217 c9        ret     

6218 21ce88    ld      hl,$88ce
621b cd0e78    call    $780e
621e 2acf88    ld      hl,($88cf)
6221 23        inc     hl
6222 22cf88    ld      ($88cf),hl
6225 c3f161    jp      $61f1
6228 c9        ret     

6229 c9        ret     

622a 22d988    ld      ($88d9),hl
622d eb        ex      de,hl
622e 22db88    ld      ($88db),hl
6231 2ac49a    ld      hl,($9ac4)
6234 2b        dec     hl
6235 22c49a    ld      ($9ac4),hl
6238 cd3d40    call    $403d
623b 115762    ld      de,$6257
623e 21989c    ld      hl,$9c98
6241 cd8344    call    $4483
6244 2adb88    ld      hl,($88db)
6247 44        ld      b,h
6248 4d        ld      c,l
6249 2ad988    ld      hl,($88d9)
624c eb        ex      de,hl
624d 21989c    ld      hl,$9c98
6250 cd1844    call    $4418
6253 cd5202    call    $0252
6256 c9        ret     

6257 50        ld      d,b
6258 00        nop     
6259 0a        ld      a,(bc)
625a b7        or      a
625b c8        ret     z

625c fe07      cp      $07
625e da6362    jp      c,$6263
6261 3e06      ld      a,$06
6263 32de88    ld      ($88de),a
6266 47        ld      b,a
6267 7e        ld      a,(hl)
6268 32df88    ld      ($88df),a
626b b7        or      a
626c c8        ret     z

626d 23        inc     hl
626e 23        inc     hl
626f 7e        ld      a,(hl)
6270 32e088    ld      ($88e0),a
6273 23        inc     hl
6274 0e01      ld      c,$01
6276 d5        push    de
6277 e5        push    hl
6278 1a        ld      a,(de)
6279 fe61      cp      $61
627b da8062    jp      c,$6280
627e e6df      and     $df
6280 96        sub     (hl)
6281 e67f      and     $7f
6283 c29162    jp      nz,$6291
6286 23        inc     hl
6287 13        inc     de
6288 05        dec     b
6289 c27862    jp      nz,$6278
628c 3eff      ld      a,$ff
628e c3ab62    jp      $62ab
6291 3adf88    ld      a,($88df)
6294 b9        cp      c
6295 caa962    jp      z,$62a9
6298 0c        inc     c
6299 3ade88    ld      a,($88de)
629c 47        ld      b,a
629d e1        pop     hl
629e 1600      ld      d,$00
62a0 3ae088    ld      a,($88e0)
62a3 5f        ld      e,a
62a4 19        add     hl,de
62a5 d1        pop     de
62a6 c37662    jp      $6276
62a9 af        xor     a
62aa 4f        ld      c,a
62ab 21958e    ld      hl,$8e95
62ae 71        ld      (hl),c
62af 23        inc     hl
62b0 3600      ld      (hl),$00
62b2 e1        pop     hl
62b3 d1        pop     de
62b4 b7        or      a
62b5 c8        ret     z

62b6 7e        ld      a,(hl)
62b7 e680      and     $80
62b9 21988e    ld      hl,$8e98
62bc b6        or      (hl)
62bd 3eff      ld      a,$ff
62bf c0        ret     nz

62c0 21c662    ld      hl,$62c6
62c3 c3c876    jp      $76c8
62c6 1000      djnz    $62c8
62c8 54        ld      d,h
62c9 00        nop     
62ca 0640      ld      b,$40
62cc 7c        ld      a,h
62cd 7c        ld      a,h
62ce 7c        ld      a,h
62cf 7c        ld      a,h
62d0 7c        ld      a,h
62d1 40        ld      b,b
62d2 44        ld      b,h
62d3 41        ld      b,c
62d4 54        ld      d,h
62d5 41        ld      b,c
62d6 7c        ld      a,h
62d7 c24152    jp      nz,$5241
62da 7c        ld      a,h
62db 7c        ld      a,h
62dc 7c        ld      a,h
62dd 42        ld      b,d
62de 4f        ld      c,a
62df 58        ld      e,b
62e0 7c        ld      a,h
62e1 7c        ld      a,h
62e2 7c        ld      a,h
62e3 43        ld      b,e
62e4 55        ld      d,l
62e5 52        ld      d,d
62e6 56        ld      d,(hl)
62e7 45        ld      b,l
62e8 7c        ld      a,h
62e9 43        ld      b,e
62ea 54        ld      d,h
62eb 45        ld      b,l
62ec 58        ld      e,b
62ed 54        ld      d,h
62ee 7c        ld      a,h
62ef 43        ld      b,e
62f0 4c        ld      c,h
62f1 45        ld      b,l
62f2 41        ld      b,c
62f3 52        ld      d,d
62f4 53        ld      d,e
62f5 c34f4c    jp      $4c4f
62f8 4f        ld      c,a
62f9 52        ld      d,d
62fa 7c        ld      a,h
62fb 43        ld      b,e
62fc 4f        ld      c,a
62fd 4d        ld      c,l
62fe 50        ld      d,b
62ff 41        ld      b,c
6300 52        ld      d,d
6301 44        ld      b,h
6302 52        ld      d,d
6303 41        ld      b,c
6304 57        ld      d,a
6305 7c        ld      a,h
6306 7c        ld      a,h
6307 44        ld      b,h
6308 41        ld      b,c
6309 54        ld      d,h
630a 41        ld      b,c
630b 46        ld      b,(hl)
630c 49        ld      c,c
630d 44        ld      b,h
630e 55        ld      d,l
630f 4d        ld      c,l
6310 50        ld      d,b
6311 7c        ld      a,h
6312 7c        ld      a,h
6313 44        ld      b,h
6314 49        ld      c,c
6315 53        ld      d,e
6316 4b        ld      c,e
6317 7c        ld      a,h
6318 7c        ld      a,h
6319 44        ld      b,h
631a 45        ld      b,l
631b 56        ld      d,(hl)
631c 49        ld      c,c
631d 43        ld      b,e
631e 45        ld      b,l
631f c5        push    bc
6320 43        ld      b,e
6321 48        ld      c,b
6322 4f        ld      c,a
6323 7c        ld      a,h
6324 7c        ld      a,h
6325 45        ld      b,l
6326 4e        ld      c,(hl)
6327 44        ld      b,h
6328 7c        ld      a,h
6329 7c        ld      a,h
632a 7c        ld      a,h
632b 45        ld      b,l
632c 52        ld      d,d
632d 41        ld      b,c
632e 53        ld      d,e
632f 45        ld      b,l
6330 7c        ld      a,h
6331 45        ld      b,l
6332 58        ld      e,b
6333 49        ld      c,c
6334 54        ld      d,h
6335 7c        ld      a,h
6336 7c        ld      a,h
6337 45        ld      b,l
6338 44        ld      b,h
6339 49        ld      c,c
633a 54        ld      d,h
633b 7c        ld      a,h
633c 7c        ld      a,h
633d 49        ld      c,c
633e 4e        ld      c,(hl)
633f 49        ld      c,c
6340 54        ld      d,h
6341 49        ld      c,c
6342 41        ld      b,c
6343 49        ld      c,c
6344 46        ld      b,(hl)
6345 7c        ld      a,h
6346 7c        ld      a,h
6347 7c        ld      a,h
6348 7c        ld      a,h
6349 4a        ld      c,d
634a 55        ld      d,l
634b 4d        ld      c,l
634c 50        ld      d,b
634d 7c        ld      a,h
634e 7c        ld      a,h
634f 4b        ld      c,e
6350 45        ld      b,l
6351 59        ld      e,c
6352 42        ld      b,d
6353 4f        ld      c,a
6354 41        ld      b,c
6355 cc4547    call    z,$4745
6358 45        ld      b,l
6359 4e        ld      c,(hl)
635a 44        ld      b,h
635b 4c        ld      c,h
635c 4f        ld      c,a
635d 47        ld      b,a
635e 49        ld      c,c
635f 43        ld      b,e
6360 41        ld      b,c
6361 4d        ld      c,l
6362 4f        ld      c,a
6363 56        ld      d,(hl)
6364 45        ld      b,l
6365 7c        ld      a,h
6366 7c        ld      a,h
6367 4d        ld      c,l
6368 41        ld      b,c
6369 52        ld      d,d
636a 4b        ld      c,e
636b 7c        ld      a,h
636c 7c        ld      a,h
636d 4d        ld      c,l
636e 45        ld      b,l
636f 4e        ld      c,(hl)
6370 55        ld      d,l
6371 7c        ld      a,h
6372 7c        ld      a,h
6373 4e        ld      c,(hl)
6374 4f        ld      c,a
6375 7c        ld      a,h
6376 7c        ld      a,h
6377 7c        ld      a,h
6378 7c        ld      a,h
6379 4f        ld      c,a
637a 52        ld      d,d
637b 49        ld      c,c
637c 47        ld      b,a
637d 49        ld      c,c
637e 4e        ld      c,(hl)
637f d0        ret     nc

6380 49        ld      c,c
6381 45        ld      b,l
6382 43        ld      b,e
6383 48        ld      c,b
6384 41        ld      b,c
6385 50        ld      d,b
6386 4c        ld      c,h
6387 4f        ld      c,a
6388 54        ld      d,h
6389 7c        ld      a,h
638a 7c        ld      a,h
638b 52        ld      d,d
638c 4d        ld      c,l
638d 4f        ld      c,a
638e 56        ld      d,(hl)
638f 45        ld      b,l
6390 7c        ld      a,h
6391 52        ld      d,d
6392 55        ld      d,l
6393 4e        ld      c,(hl)
6394 7c        ld      a,h
6395 7c        ld      a,h
6396 7c        ld      a,h
6397 52        ld      d,d
6398 4d        ld      c,l
6399 41        ld      b,c
639a 52        ld      d,d
639b 4b        ld      c,e
639c 7c        ld      a,h
639d 52        ld      d,d
639e 44        ld      b,h
639f 52        ld      d,d
63a0 41        ld      b,c
63a1 57        ld      d,a
63a2 7c        ld      a,h
63a3 53        ld      d,e
63a4 54        ld      d,h
63a5 41        ld      b,c
63a6 54        ld      d,h
63a7 55        ld      d,l
63a8 53        ld      d,e
63a9 53        ld      d,e
63aa 54        ld      d,h
63ab 4f        ld      c,a
63ac 50        ld      d,b
63ad 7c        ld      a,h
63ae 7c        ld      a,h
63af 53        ld      d,e
63b0 49        ld      c,c
63b1 5a        ld      e,d
63b2 45        ld      b,l
63b3 7c        ld      a,h
63b4 7c        ld      a,h
63b5 54        ld      d,h
63b6 45        ld      b,l
63b7 58        ld      e,b
63b8 54        ld      d,h
63b9 7c        ld      a,h
63ba 7c        ld      a,h
63bb d8        ret     c

63bc 7c        ld      a,h
63bd 7c        ld      a,h
63be 7c        ld      a,h
63bf 7c        ld      a,h
63c0 7c        ld      a,h
63c1 d9        exx     
63c2 7c        ld      a,h
63c3 7c        ld      a,h
63c4 7c        ld      a,h
63c5 7c        ld      a,h
63c6 7c        ld      a,h
63c7 3f        ccf     
63c8 53        ld      d,e
63c9 49        ld      c,c
63ca 5a        ld      e,d
63cb 45        ld      b,l
63cc 7c        ld      a,h
63cd 3f        ccf     
63ce 43        ld      b,e
63cf 48        ld      c,b
63d0 41        ld      b,c
63d1 52        ld      d,d
63d2 46        ld      b,(hl)
63d3 3f        ccf     
63d4 43        ld      b,e
63d5 55        ld      d,l
63d6 52        ld      d,d
63d7 53        ld      d,e
63d8 4f        ld      c,a
63d9 41        ld      b,c
63da 4e        ld      c,(hl)
63db 47        ld      b,a
63dc 4c        ld      c,h
63dd 45        ld      b,l
63de 7c        ld      a,h
63df c1        pop     bc
63e0 44        ld      b,h
63e1 4a        ld      c,d
63e2 55        ld      d,l
63e3 53        ld      d,e
63e4 54        ld      d,h
63e5 c1        pop     bc
63e6 55        ld      d,l
63e7 54        ld      d,h
63e8 4f        ld      c,a
63e9 53        ld      d,e
63ea 43        ld      b,e
63eb 41        ld      b,c
63ec 52        ld      d,d
63ed 43        ld      b,e
63ee 7c        ld      a,h
63ef 7c        ld      a,h
63f0 7c        ld      a,h
63f1 41        ld      b,c
63f2 58        ld      e,b
63f3 49        ld      c,c
63f4 53        ld      d,e
63f5 7c        ld      a,h
63f6 7c        ld      a,h
63f7 c34841    jp      $4148
63fa 52        ld      d,d
63fb 41        ld      b,c
63fc 43        ld      b,e
63fd 43        ld      b,e
63fe 49        ld      c,c
63ff 52        ld      d,d
6400 43        ld      b,e
6401 4c        ld      c,h
6402 45        ld      b,l
6403 c34c49    jp      $494c
6406 50        ld      d,b
6407 50        ld      d,b
6408 49        ld      c,c
6409 43        ld      b,e
640a 4f        ld      c,a
640b 4f        ld      c,a
640c 52        ld      d,d
640d 44        ld      b,h
640e 49        ld      c,c
640f c5        push    bc
6410 4d        ld      c,l
6411 50        ld      d,b
6412 48        ld      c,b
6413 41        ld      b,c
6414 53        ld      d,e
6415 46        ld      b,(hl)
6416 55        ld      d,l
6417 4c        ld      c,h
6418 4c        ld      c,h
6419 7c        ld      a,h
641a 7c        ld      a,h
641b 48        ld      c,b
641c 45        ld      b,l
641d 4c        ld      c,h
641e 50        ld      d,b
641f 7c        ld      a,h
6420 7c        ld      a,h
6421 c9        ret     

6422 4e        ld      c,(hl)
6423 50        ld      d,b
6424 55        ld      d,l
6425 54        ld      d,h
6426 7c        ld      a,h
6427 4a        ld      c,d
6428 4f        ld      c,a
6429 59        ld      e,c
642a 53        ld      d,e
642b 54        ld      d,h
642c 49        ld      c,c
642d 4c        ld      c,h
642e 49        ld      c,c
642f 4e        ld      c,(hl)
6430 45        ld      b,l
6431 7c        ld      a,h
6432 7c        ld      a,h
6433 4d        ld      c,l
6434 45        ld      b,l
6435 53        ld      d,e
6436 53        ld      d,e
6437 41        ld      b,c
6438 47        ld      b,a
6439 4e        ld      c,(hl)
643a 55        ld      d,l
643b 4d        ld      c,l
643c 42        ld      b,d
643d 45        ld      b,l
643e 52        ld      d,d
643f 50        ld      d,b
6440 41        ld      b,c
6441 55        ld      d,l
6442 53        ld      d,e
6443 45        ld      b,l
6444 7c        ld      a,h
6445 52        ld      d,d
6446 45        ld      b,l
6447 53        ld      d,e
6448 45        ld      b,l
6449 52        ld      d,d
644a 56        ld      d,(hl)
644b 52        ld      d,d
644c 45        ld      b,l
644d 47        ld      b,a
644e 49        ld      c,c
644f 4f        ld      c,a
6450 4e        ld      c,(hl)
6451 52        ld      d,d
6452 45        ld      b,l
6453 43        ld      b,e
6454 4f        ld      c,a
6455 56        ld      d,(hl)
6456 45        ld      b,l
6457 d345      out     ($45),a
6459 51        ld      d,c
645a 55        ld      d,l
645b 45        ld      b,l
645c 4e        ld      c,(hl)
645d d34f      out     ($4f),a
645f 4c        ld      c,h
6460 49        ld      c,c
6461 44        ld      b,h
6462 7c        ld      a,h
6463 d348      out     ($48),a
6465 41        ld      b,c
6466 44        ld      b,h
6467 49        ld      c,c
6468 4e        ld      c,(hl)
6469 53        ld      d,e
646a 50        ld      d,b
646b 41        ld      b,c
646c 43        ld      b,e
646d 49        ld      c,c
646e 4e        ld      c,(hl)
646f 7c        ld      a,h
6470 7c        ld      a,h
6471 7c        ld      a,h
6472 7c        ld      a,h
6473 7c        ld      a,h
6474 7c        ld      a,h
6475 53        ld      d,e
6476 59        ld      e,c
6477 4d        ld      c,l
6478 42        ld      b,d
6479 4f        ld      c,a
647a 4c        ld      c,h
647b 53        ld      d,e
647c 51        ld      d,c
647d 55        ld      d,l
647e 41        ld      b,c
647f 52        ld      d,d
6480 45        ld      b,l
6481 53        ld      d,e
6482 50        ld      d,b
6483 45        ld      b,l
6484 43        ld      b,e
6485 49        ld      c,c
6486 41        ld      b,c
6487 53        ld      d,e
6488 48        ld      c,b
6489 52        ld      d,d
648a 49        ld      c,c
648b 4e        ld      c,(hl)
648c 4b        ld      c,e
648d d355      out     ($55),a
648f 42        ld      b,d
6490 53        ld      d,e
6491 45        ld      b,l
6492 54        ld      d,h
6493 d44954    call    nc,$5449
6496 4c        ld      c,h
6497 45        ld      b,l
6498 7c        ld      a,h
6499 57        ld      d,a
649a 49        ld      c,c
649b 4e        ld      c,(hl)
649c 44        ld      b,h
649d 4f        ld      c,a
649e 57        ld      d,a
649f 43        ld      b,e
64a0 52        ld      d,d
64a1 45        ld      b,l
64a2 41        ld      b,c
64a3 54        ld      d,h
64a4 45        ld      b,l
64a5 4e        ld      c,(hl)
64a6 41        ld      b,c
64a7 4d        ld      c,l
64a8 45        ld      b,l
64a9 7c        ld      a,h
64aa 7c        ld      a,h
64ab 4f        ld      c,a
64ac 55        ld      d,l
64ad 54        ld      d,h
64ae 50        ld      d,b
64af 55        ld      d,l
64b0 54        ld      d,h
64b1 56        ld      d,(hl)
64b2 49        ld      c,c
64b3 45        ld      b,l
64b4 57        ld      d,a
64b5 7c        ld      a,h
64b6 7c        ld      a,h
64b7 56        ld      d,(hl)
64b8 41        ld      b,c
64b9 52        ld      d,d
64ba 49        ld      c,c
64bb 41        ld      b,c
64bc 42        ld      b,d
64bd 3f        ccf     
64be 56        ld      d,(hl)
64bf 41        ld      b,c
64c0 52        ld      d,d
64c1 49        ld      c,c
64c2 41        ld      b,c
64c3 22e288    ld      ($88e2),hl
64c6 3a638c    ld      a,($8c63)
64c9 2ae288    ld      hl,($88e2)
64cc 96        sub     (hl)
64cd d601      sub     $01
64cf 9f        sbc     a,a
64d0 32e488    ld      ($88e4),a
64d3 b7        or      a
64d4 cad864    jp      z,$64d8
64d7 c9        ret     

64d8 2ae288    ld      hl,($88e2)
64db 7e        ld      a,(hl)
64dc 32638c    ld      ($8c63),a
64df cddf68    call    $68df
64e2 c9        ret     

64e3 22e688    ld      ($88e6),hl
64e6 eb        ex      de,hl
64e7 22e888    ld      ($88e8),hl
64ea af        xor     a
64eb 324e8c    ld      ($8c4e),a
64ee 3eff      ld      a,$ff
64f0 32628c    ld      ($8c62),a
64f3 2ae888    ld      hl,($88e8)
64f6 eb        ex      de,hl
64f7 2ae688    ld      hl,($88e6)
64fa cd9667    call    $6796
64fd cdbc69    call    $69bc
6500 c9        ret     

6501 22eb88    ld      ($88eb),hl
6504 eb        ex      de,hl
6505 22ed88    ld      ($88ed),hl
6508 af        xor     a
6509 324e8c    ld      ($8c4e),a
650c af        xor     a
650d 32628c    ld      ($8c62),a
6510 2aed88    ld      hl,($88ed)
6513 eb        ex      de,hl
6514 2aeb88    ld      hl,($88eb)
6517 cd9667    call    $6796
651a cdbc69    call    $69bc
651d c9        ret     

651e 22f088    ld      ($88f0),hl
6521 eb        ex      de,hl
6522 22f288    ld      ($88f2),hl
6525 3e01      ld      a,$01
6527 324e8c    ld      ($8c4e),a
652a 3eff      ld      a,$ff
652c 32628c    ld      ($8c62),a
652f 2af288    ld      hl,($88f2)
6532 eb        ex      de,hl
6533 2af088    ld      hl,($88f0)
6536 cd9667    call    $6796
6539 cdbc69    call    $69bc
653c c9        ret     

653d 22f588    ld      ($88f5),hl
6540 eb        ex      de,hl
6541 22f788    ld      ($88f7),hl
6544 3e01      ld      a,$01
6546 324e8c    ld      ($8c4e),a
6549 af        xor     a
654a 32628c    ld      ($8c62),a
654d 2af788    ld      hl,($88f7)
6550 eb        ex      de,hl
6551 2af588    ld      hl,($88f5)
6554 cd9667    call    $6796
6557 cdbc69    call    $69bc
655a c9        ret     

655b 22fa88    ld      ($88fa),hl
655e eb        ex      de,hl
655f 22fc88    ld      ($88fc),hl
6562 60        ld      h,b
6563 69        ld      l,c
6564 22fe88    ld      ($88fe),hl
6567 2afe88    ld      hl,($88fe)
656a 7e        ld      a,(hl)
656b 324f8c    ld      ($8c4f),a
656e 3e02      ld      a,$02
6570 324e8c    ld      ($8c4e),a
6573 3eff      ld      a,$ff
6575 32628c    ld      ($8c62),a
6578 2afc88    ld      hl,($88fc)
657b eb        ex      de,hl
657c 2afa88    ld      hl,($88fa)
657f cd9667    call    $6796
6582 cdbc69    call    $69bc
6585 c9        ret     

6586 220189    ld      ($8901),hl
6589 eb        ex      de,hl
658a 220389    ld      ($8903),hl
658d 60        ld      h,b
658e 69        ld      l,c
658f 220589    ld      ($8905),hl
6592 2a0589    ld      hl,($8905)
6595 7e        ld      a,(hl)
6596 324f8c    ld      ($8c4f),a
6599 3e02      ld      a,$02
659b 324e8c    ld      ($8c4e),a
659e af        xor     a
659f 32628c    ld      ($8c62),a
65a2 2a0389    ld      hl,($8903)
65a5 eb        ex      de,hl
65a6 2a0189    ld      hl,($8901)
65a9 cd9667    call    $6796
65ac cdbc69    call    $69bc
65af c9        ret     

65b0 220889    ld      ($8908),hl
65b3 110a89    ld      de,$890a
65b6 2a0889    ld      hl,($8908)
65b9 cdc665    call    $65c6
65bc 110a89    ld      de,$890a
65bf 2a0889    ld      hl,($8908)
65c2 cd2366    call    $6623
65c5 c9        ret     

65c6 220d89    ld      ($890d),hl
65c9 eb        ex      de,hl
65ca 220f89    ld      ($890f),hl
65cd 210000    ld      hl,$0000
65d0 eb        ex      de,hl
65d1 2a0f89    ld      hl,($890f)
65d4 73        ld      (hl),e
65d5 23        inc     hl
65d6 72        ld      (hl),d
65d7 2a0f89    ld      hl,($890f)
65da 7e        ld      a,(hl)
65db 23        inc     hl
65dc 66        ld      h,(hl)
65dd 6f        ld      l,a
65de eb        ex      de,hl
65df 2a0d89    ld      hl,($890d)
65e2 19        add     hl,de
65e3 7e        ld      a,(hl)
65e4 214d8c    ld      hl,$8c4d
65e7 96        sub     (hl)
65e8 d601      sub     $01
65ea 9f        sbc     a,a
65eb 321189    ld      ($8911),a
65ee b7        or      a
65ef caf365    jp      z,$65f3
65f2 c9        ret     

65f3 2a0f89    ld      hl,($890f)
65f6 7e        ld      a,(hl)
65f7 23        inc     hl
65f8 66        ld      h,(hl)
65f9 6f        ld      l,a
65fa 23        inc     hl
65fb eb        ex      de,hl
65fc 2a0f89    ld      hl,($890f)
65ff 73        ld      (hl),e
6600 23        inc     hl
6601 72        ld      (hl),d
6602 eb        ex      de,hl
6603 117cff    ld      de,$ff7c
6606 19        add     hl,de
6607 7d        ld      a,l
6608 07        rlca    
6609 b5        or      l
660a e67f      and     $7f
660c b4        or      h
660d 3d        dec     a
660e c681      add     a,$81
6610 9f        sbc     a,a
6611 321189    ld      ($8911),a
6614 b7        or      a
6615 c2d765    jp      nz,$65d7
6618 210100    ld      hl,$0001
661b eb        ex      de,hl
661c 2a0f89    ld      hl,($890f)
661f 73        ld      (hl),e
6620 23        inc     hl
6621 72        ld      (hl),d
6622 c9        ret     

6623 221389    ld      ($8913),hl
6626 eb        ex      de,hl
6627 221589    ld      ($8915),hl
662a 21528c    ld      hl,$8c52
662d cdcd81    call    $81cd
6630 211889    ld      hl,$8918
6633 cdbe81    call    $81be
6636 21568c    ld      hl,$8c56
6639 cdcd81    call    $81cd
663c 211c89    ld      hl,$891c
663f cdbe81    call    $81be
6642 af        xor     a
6643 324e8c    ld      ($8c4e),a
6646 210100    ld      hl,$0001
6649 222089    ld      ($8920),hl
664c 2a2089    ld      hl,($8920)
664f 2b        dec     hl
6650 eb        ex      de,hl
6651 2a1389    ld      hl,($8913)
6654 19        add     hl,de
6655 7e        ld      a,(hl)
6656 321789    ld      ($8917),a
6659 d60a      sub     $0a
665b d601      sub     $01
665d 9f        sbc     a,a
665e 322289    ld      ($8922),a
6661 b7        or      a
6662 c2c466    jp      nz,$66c4
6665 3a1789    ld      a,($8917)
6668 d60d      sub     $0d
666a d601      sub     $01
666c 9f        sbc     a,a
666d 322289    ld      ($8922),a
6670 b7        or      a
6671 c20f67    jp      nz,$670f
6674 3a8b8b    ld      a,($8b8b)
6677 2f        cpl     
6678 322289    ld      ($8922),a
667b b7        or      a
667c ca8866    jp      z,$6688
667f 112a67    ld      de,$672a
6682 211789    ld      hl,$8917
6685 cde506    call    $06e5
6688 2166a6    ld      hl,$a666
668b cdcd81    call    $81cd
668e 21528c    ld      hl,$8c52
6691 cd8b7d    call    $7d8b
6694 215a8c    ld      hl,$8c5a
6697 cdbe81    call    $81be
669a 216aa6    ld      hl,$a66a
669d cdcd81    call    $81cd
66a0 21568c    ld      hl,$8c56
66a3 cd8b7d    call    $7d8b
66a6 215e8c    ld      hl,$8c5e
66a9 cdbe81    call    $81be
66ac cdbc69    call    $69bc
66af 2a2089    ld      hl,($8920)
66b2 23        inc     hl
66b3 eb        ex      de,hl
66b4 2a1589    ld      hl,($8915)
66b7 7e        ld      a,(hl)
66b8 23        inc     hl
66b9 66        ld      h,(hl)
66ba 6f        ld      l,a
66bb eb        ex      de,hl
66bc 7b        ld      a,e
66bd 95        sub     l
66be 7a        ld      a,d
66bf 9c        sbc     a,h
66c0 f24966    jp      p,$6649
66c3 c9        ret     

66c4 216ea6    ld      hl,$a66e
66c7 cdcd81    call    $81cd
66ca 21528c    ld      hl,$8c52
66cd cd8b7d    call    $7d8b
66d0 215a8c    ld      hl,$8c5a
66d3 cdbe81    call    $81be
66d6 21568c    ld      hl,$8c56
66d9 cdcd81    call    $81cd
66dc 2172a6    ld      hl,$a672
66df cded7d    call    $7ded
66e2 215e8c    ld      hl,$8c5e
66e5 cdbe81    call    $81be
66e8 211889    ld      hl,$8918
66eb cdcd81    call    $81cd
66ee 216ea6    ld      hl,$a66e
66f1 cd8b7d    call    $7d8b
66f4 211889    ld      hl,$8918
66f7 cdbe81    call    $81be
66fa 211c89    ld      hl,$891c
66fd cdcd81    call    $81cd
6700 2172a6    ld      hl,$a672
6703 cded7d    call    $7ded
6706 211c89    ld      hl,$891c
6709 cdbe81    call    $81be
670c c3ac66    jp      $66ac
670f 211889    ld      hl,$8918
6712 cdcd81    call    $81cd
6715 215a8c    ld      hl,$8c5a
6718 cdbe81    call    $81be
671b 211c89    ld      hl,$891c
671e cdcd81    call    $81cd
6721 215e8c    ld      hl,$8c5e
6724 cdbe81    call    $81be
6727 c3ac66    jp      $66ac
672a 010000    ld      bc,$0000
672d 00        nop     
672e 222489    ld      ($8924),hl
6731 eb        ex      de,hl
6732 222689    ld      ($8926),hl
6735 60        ld      h,b
6736 69        ld      l,c
6737 222889    ld      ($8928),hl
673a 21178c    ld      hl,$8c17
673d cdcd81    call    $81cd
6740 2a2489    ld      hl,($8924)
6743 cdfe7e    call    $7efe
6746 219267    ld      hl,$6792
6749 cd8b7d    call    $7d8b
674c cd807a    call    $7a80
674f 22478c    ld      ($8c47),hl
6752 211f8c    ld      hl,$8c1f
6755 cdcd81    call    $81cd
6758 2a2689    ld      hl,($8926)
675b cdfe7e    call    $7efe
675e 219267    ld      hl,$6792
6761 cd8b7d    call    $7d8b
6764 cd807a    call    $7a80
6767 22498c    ld      ($8c49),hl
676a 21178c    ld      hl,$8c17
676d cdcd81    call    $81cd
6770 2a2889    ld      hl,($8928)
6773 cdfe7e    call    $7efe
6776 219267    ld      hl,$6792
6779 cd8b7d    call    $7d8b
677c cd807a    call    $7a80
677f 224b8c    ld      ($8c4b),hl
6782 014b8c    ld      bc,$8c4b
6785 11498c    ld      de,$8c49
6788 21478c    ld      hl,$8c47
678b cde806    call    $06e8
678e cd976c    call    $6c97
6791 c9        ret     

6792 00        nop     
6793 00        nop     
6794 00        nop     
6795 80        add     a,b
6796 222b89    ld      ($892b),hl
6799 eb        ex      de,hl
679a 222d89    ld      ($892d),hl
679d 3a638c    ld      a,($8c63)
67a0 c6ff      add     a,$ff
67a2 9f        sbc     a,a
67a3 322f89    ld      ($892f),a
67a6 b7        or      a
67a7 c2ef67    jp      nz,$67ef
67aa 3a628c    ld      a,($8c62)
67ad b7        or      a
67ae c2d667    jp      nz,$67d6
67b1 21528c    ld      hl,$8c52
67b4 cdcd81    call    $81cd
67b7 2a2b89    ld      hl,($892b)
67ba cd8b7d    call    $7d8b
67bd 215a8c    ld      hl,$8c5a
67c0 cdbe81    call    $81be
67c3 21568c    ld      hl,$8c56
67c6 cdcd81    call    $81cd
67c9 2a2d89    ld      hl,($892d)
67cc cd8b7d    call    $7d8b
67cf 215e8c    ld      hl,$8c5e
67d2 cdbe81    call    $81be
67d5 c9        ret     

67d6 2a2b89    ld      hl,($892b)
67d9 cdcd81    call    $81cd
67dc 215a8c    ld      hl,$8c5a
67df cdbe81    call    $81be
67e2 2a2d89    ld      hl,($892d)
67e5 cdcd81    call    $81cd
67e8 215e8c    ld      hl,$8c5e
67eb cdbe81    call    $81be
67ee c9        ret     

67ef 3a638c    ld      a,($8c63)
67f2 3d        dec     a
67f3 c6ff      add     a,$ff
67f5 9f        sbc     a,a
67f6 322f89    ld      ($892f),a
67f9 b7        or      a
67fa c26668    jp      nz,$6866
67fd 3a628c    ld      a,($8c62)
6800 b7        or      a
6801 c23568    jp      nz,$6835
6804 21aea6    ld      hl,$a6ae
6807 cdcd81    call    $81cd
680a 2a2b89    ld      hl,($892b)
680d cdfe7e    call    $7efe
6810 21528c    ld      hl,$8c52
6813 cd8b7d    call    $7d8b
6816 215a8c    ld      hl,$8c5a
6819 cdbe81    call    $81be
681c 21b6a6    ld      hl,$a6b6
681f cdcd81    call    $81cd
6822 2a2d89    ld      hl,($892d)
6825 cdfe7e    call    $7efe
6828 21568c    ld      hl,$8c56
682b cd8b7d    call    $7d8b
682e 215e8c    ld      hl,$8c5e
6831 cdbe81    call    $81be
6834 c9        ret     

6835 21aea6    ld      hl,$a6ae
6838 cdcd81    call    $81cd
683b 2a2b89    ld      hl,($892b)
683e cdfe7e    call    $7efe
6841 21aaa6    ld      hl,$a6aa
6844 cd8b7d    call    $7d8b
6847 215a8c    ld      hl,$8c5a
684a cdbe81    call    $81be
684d 21b6a6    ld      hl,$a6b6
6850 cdcd81    call    $81cd
6853 2a2d89    ld      hl,($892d)
6856 cdfe7e    call    $7efe
6859 21b2a6    ld      hl,$a6b2
685c cd8b7d    call    $7d8b
685f 215e8c    ld      hl,$8c5e
6862 cdbe81    call    $81be
6865 c9        ret     

6866 3a638c    ld      a,($8c63)
6869 d602      sub     $02
686b c6ff      add     a,$ff
686d 9f        sbc     a,a
686e 322f89    ld      ($892f),a
6871 b7        or      a
6872 c2de68    jp      nz,$68de
6875 3a628c    ld      a,($8c62)
6878 b7        or      a
6879 c2ad68    jp      nz,$68ad
687c 218ea6    ld      hl,$a68e
687f cdcd81    call    $81cd
6882 2a2b89    ld      hl,($892b)
6885 cdfe7e    call    $7efe
6888 21528c    ld      hl,$8c52
688b cd8b7d    call    $7d8b
688e 215a8c    ld      hl,$8c5a
6891 cdbe81    call    $81be
6894 2196a6    ld      hl,$a696
6897 cdcd81    call    $81cd
689a 2a2d89    ld      hl,($892d)
689d cdfe7e    call    $7efe
68a0 21568c    ld      hl,$8c56
68a3 cd8b7d    call    $7d8b
68a6 215e8c    ld      hl,$8c5e
68a9 cdbe81    call    $81be
68ac c9        ret     

68ad 218ea6    ld      hl,$a68e
68b0 cdcd81    call    $81cd
68b3 2a2b89    ld      hl,($892b)
68b6 cdfe7e    call    $7efe
68b9 218aa6    ld      hl,$a68a
68bc cd8b7d    call    $7d8b
68bf 215a8c    ld      hl,$8c5a
68c2 cdbe81    call    $81be
68c5 2196a6    ld      hl,$a696
68c8 cdcd81    call    $81cd
68cb 2a2d89    ld      hl,($892d)
68ce cdfe7e    call    $7efe
68d1 2192a6    ld      hl,$a692
68d4 cd8b7d    call    $7d8b
68d7 215e8c    ld      hl,$8c5e
68da cdbe81    call    $81be
68dd c9        ret     

68de c9        ret     

68df 3a8a8b    ld      a,($8b8a)
68e2 2f        cpl     
68e3 323289    ld      ($8932),a
68e6 b7        or      a
68e7 caeb68    jp      z,$68eb
68ea c9        ret     

68eb 3a638c    ld      a,($8c63)
68ee c6ff      add     a,$ff
68f0 9f        sbc     a,a
68f1 323289    ld      ($8932),a
68f4 b7        or      a
68f5 c22b69    jp      nz,$692b
68f8 21b869    ld      hl,$69b8
68fb cdcd81    call    $81cd
68fe 21948b    ld      hl,$8b94
6901 cdbe81    call    $81be
6904 21338c    ld      hl,$8c33
6907 cdcd81    call    $81cd
690a 21988b    ld      hl,$8b98
690d cdbe81    call    $81be
6910 21b869    ld      hl,$69b8
6913 cdcd81    call    $81cd
6916 219c8b    ld      hl,$8b9c
6919 cdbe81    call    $81be
691c 21378c    ld      hl,$8c37
691f cdcd81    call    $81cd
6922 21a08b    ld      hl,$8ba0
6925 cdbe81    call    $81be
6928 c3ab69    jp      $69ab
692b 3a638c    ld      a,($8c63)
692e 3d        dec     a
692f c6ff      add     a,$ff
6931 9f        sbc     a,a
6932 323289    ld      ($8932),a
6935 b7        or      a
6936 c26c69    jp      nz,$696c
6939 21d38b    ld      hl,$8bd3
693c cdcd81    call    $81cd
693f 21948b    ld      hl,$8b94
6942 cdbe81    call    $81be
6945 21d78b    ld      hl,$8bd7
6948 cdcd81    call    $81cd
694b 21988b    ld      hl,$8b98
694e cdbe81    call    $81be
6951 21db8b    ld      hl,$8bdb
6954 cdcd81    call    $81cd
6957 219c8b    ld      hl,$8b9c
695a cdbe81    call    $81be
695d 21df8b    ld      hl,$8bdf
6960 cdcd81    call    $81cd
6963 21a08b    ld      hl,$8ba0
6966 cdbe81    call    $81be
6969 c3ab69    jp      $69ab
696c 3a638c    ld      a,($8c63)
696f d602      sub     $02
6971 c6ff      add     a,$ff
6973 9f        sbc     a,a
6974 323289    ld      ($8932),a
6977 b7        or      a
6978 c2ab69    jp      nz,$69ab
697b 21238c    ld      hl,$8c23
697e cdcd81    call    $81cd
6981 21948b    ld      hl,$8b94
6984 cdbe81    call    $81be
6987 21278c    ld      hl,$8c27
698a cdcd81    call    $81cd
698d 21988b    ld      hl,$8b98
6990 cdbe81    call    $81be
6993 212b8c    ld      hl,$8c2b
6996 cdcd81    call    $81cd
6999 219c8b    ld      hl,$8b9c
699c cdbe81    call    $81be
699f 212f8c    ld      hl,$8c2f
69a2 cdcd81    call    $81cd
69a5 21a08b    ld      hl,$8ba0
69a8 cdbe81    call    $81be
69ab 11568c    ld      de,$8c56
69ae 21528c    ld      hl,$8c52
69b1 cd4f6a    call    $6a4f
69b4 328b8b    ld      ($8b8b),a
69b7 c9        ret     

69b8 00        nop     
69b9 00        nop     
69ba 00        nop     
69bb 00        nop     
69bc 3a8a8b    ld      a,($8b8a)
69bf b7        or      a
69c0 c2cd69    jp      nz,$69cd
69c3 115e8c    ld      de,$8c5e
69c6 215a8c    ld      hl,$8c5a
69c9 cd616d    call    $6d61
69cc c9        ret     

69cd 115e8c    ld      de,$8c5e
69d0 215a8c    ld      hl,$8c5a
69d3 cd4f6a    call    $6a4f
69d6 323489    ld      ($8934),a
69d9 3a8b8b    ld      a,($8b8b)
69dc b7        or      a
69dd c2156a    jp      nz,$6a15
69e0 3a3489    ld      a,($8934)
69e3 2f        cpl     
69e4 323989    ld      ($8939),a
69e7 b7        or      a
69e8 c2c369    jp      nz,$69c3
69eb 3eff      ld      a,$ff
69ed 328b8b    ld      ($8b8b),a
69f0 cd2a6b    call    $6b2a
69f3 11908b    ld      de,$8b90
69f6 218c8b    ld      hl,$8b8c
69f9 cd616d    call    $6d61
69fc 215a8c    ld      hl,$8c5a
69ff cdcd81    call    $81cd
6a02 21528c    ld      hl,$8c52
6a05 cdbe81    call    $81be
6a08 215e8c    ld      hl,$8c5e
6a0b cdcd81    call    $81cd
6a0e 21568c    ld      hl,$8c56
6a11 cdbe81    call    $81be
6a14 c9        ret     

6a15 3a3489    ld      a,($8934)
6a18 b7        or      a
6a19 c2fc69    jp      nz,$69fc
6a1c af        xor     a
6a1d 328b8b    ld      ($8b8b),a
6a20 3a4e8c    ld      a,($8c4e)
6a23 3d        dec     a
6a24 c6ff      add     a,$ff
6a26 9f        sbc     a,a
6a27 323989    ld      ($8939),a
6a2a b7        or      a
6a2b c2c369    jp      nz,$69c3
6a2e af        xor     a
6a2f 324e8c    ld      ($8c4e),a
6a32 11568c    ld      de,$8c56
6a35 21528c    ld      hl,$8c52
6a38 cd4f6a    call    $6a4f
6a3b cd2a6b    call    $6b2a
6a3e 11908b    ld      de,$8b90
6a41 218c8b    ld      hl,$8b8c
6a44 cd616d    call    $6d61
6a47 3e01      ld      a,$01
6a49 324e8c    ld      ($8c4e),a
6a4c c3c369    jp      $69c3
6a4f 224389    ld      ($8943),hl
6a52 eb        ex      de,hl
6a53 224589    ld      ($8945),hl
6a56 c3706a    jp      $6a70
6a59 224f89    ld      ($894f),hl
6a5c 2a4f89    ld      hl,($894f)
6a5f cdcd81    call    $81cd
6a62 214b89    ld      hl,$894b
6a65 cded7d    call    $7ded
6a68 3d        dec     a
6a69 c681      add     a,$81
6a6b 9f        sbc     a,a
6a6c 325189    ld      ($8951),a
6a6f c9        ret     

6a70 2a4389    ld      hl,($8943)
6a73 cdcd81    call    $81cd
6a76 21988b    ld      hl,$8b98
6a79 cded7d    call    $7ded
6a7c 215289    ld      hl,$8952
6a7f cdbe81    call    $81be
6a82 215289    ld      hl,$8952
6a85 cd596a    call    $6a59
6a88 325689    ld      ($8956),a
6a8b b7        or      a
6a8c c2986a    jp      nz,$6a98
6a8f 3a4889    ld      a,($8948)
6a92 32888b    ld      ($8b88),a
6a95 c3c66a    jp      $6ac6
6a98 21948b    ld      hl,$8b94
6a9b cdcd81    call    $81cd
6a9e 2a4389    ld      hl,($8943)
6aa1 cded7d    call    $7ded
6aa4 215289    ld      hl,$8952
6aa7 cdbe81    call    $81be
6aaa 215289    ld      hl,$8952
6aad cd596a    call    $6a59
6ab0 325689    ld      ($8956),a
6ab3 b7        or      a
6ab4 c2c06a    jp      nz,$6ac0
6ab7 3a4a89    ld      a,($894a)
6aba 32888b    ld      ($8b88),a
6abd c3c66a    jp      $6ac6
6ac0 3a4989    ld      a,($8949)
6ac3 32888b    ld      ($8b88),a
6ac6 2a4589    ld      hl,($8945)
6ac9 cdcd81    call    $81cd
6acc 21a08b    ld      hl,$8ba0
6acf cded7d    call    $7ded
6ad2 215289    ld      hl,$8952
6ad5 cdbe81    call    $81be
6ad8 215289    ld      hl,$8952
6adb cd596a    call    $6a59
6ade 325689    ld      ($8956),a
6ae1 b7        or      a
6ae2 c2ee6a    jp      nz,$6aee
6ae5 3a4889    ld      a,($8948)
6ae8 32898b    ld      ($8b89),a
6aeb c31c6b    jp      $6b1c
6aee 219c8b    ld      hl,$8b9c
6af1 cdcd81    call    $81cd
6af4 2a4589    ld      hl,($8945)
6af7 cded7d    call    $7ded
6afa 215289    ld      hl,$8952
6afd cdbe81    call    $81be
6b00 215289    ld      hl,$8952
6b03 cd596a    call    $6a59
6b06 325689    ld      ($8956),a
6b09 b7        or      a
6b0a c2166b    jp      nz,$6b16
6b0d 3a4a89    ld      a,($894a)
6b10 32898b    ld      ($8b89),a
6b13 c31c6b    jp      $6b1c
6b16 3a4989    ld      a,($8949)
6b19 32898b    ld      ($8b89),a
6b1c 3a898b    ld      a,($8b89)
6b1f 21888b    ld      hl,$8b88
6b22 b6        or      (hl)
6b23 c6ff      add     a,$ff
6b25 9f        sbc     a,a
6b26 323b89    ld      ($893b),a
6b29 c9        ret     

6b2a 215a8c    ld      hl,$8c5a
6b2d cdcd81    call    $81cd
6b30 21528c    ld      hl,$8c52
6b33 cded7d    call    $7ded
6b36 215b89    ld      hl,$895b
6b39 cdbe81    call    $81be
6b3c 215e8c    ld      hl,$8c5e
6b3f cdcd81    call    $81cd
6b42 21568c    ld      hl,$8c56
6b45 cded7d    call    $7ded
6b48 215f89    ld      hl,$895f
6b4b cdbe81    call    $81be
6b4e 3a888b    ld      a,($8b88)
6b51 215989    ld      hl,$8959
6b54 96        sub     (hl)
6b55 d601      sub     $01
6b57 9f        sbc     a,a
6b58 326389    ld      ($8963),a
6b5b b7        or      a
6b5c c2466c    jp      nz,$6c46
6b5f 3a888b    ld      a,($8b88)
6b62 215889    ld      hl,$8958
6b65 96        sub     (hl)
6b66 c6ff      add     a,$ff
6b68 9f        sbc     a,a
6b69 326389    ld      ($8963),a
6b6c b7        or      a
6b6d c27f6b    jp      nz,$6b7f
6b70 21988b    ld      hl,$8b98
6b73 cdcd81    call    $81cd
6b76 216489    ld      hl,$8964
6b79 cdbe81    call    $81be
6b7c c38b6b    jp      $6b8b
6b7f 21948b    ld      hl,$8b94
6b82 cdcd81    call    $81cd
6b85 216489    ld      hl,$8964
6b88 cdbe81    call    $81be
6b8b 216489    ld      hl,$8964
6b8e cdcd81    call    $81cd
6b91 21528c    ld      hl,$8c52
6b94 cded7d    call    $7ded
6b97 215f89    ld      hl,$895f
6b9a cdfe7e    call    $7efe
6b9d 215b89    ld      hl,$895b
6ba0 cd007e    call    $7e00
6ba3 21568c    ld      hl,$8c56
6ba6 cd8b7d    call    $7d8b
6ba9 21908b    ld      hl,$8b90
6bac cdbe81    call    $81be
6baf 3a898b    ld      a,($8b89)
6bb2 215889    ld      hl,$8958
6bb5 96        sub     (hl)
6bb6 c6ff      add     a,$ff
6bb8 9f        sbc     a,a
6bb9 326389    ld      ($8963),a
6bbc b7        or      a
6bbd c2cf6b    jp      nz,$6bcf
6bc0 21a08b    ld      hl,$8ba0
6bc3 cdcd81    call    $81cd
6bc6 216889    ld      hl,$8968
6bc9 cdbe81    call    $81be
6bcc c3ec6b    jp      $6bec
6bcf 3a898b    ld      a,($8b89)
6bd2 215989    ld      hl,$8959
6bd5 96        sub     (hl)
6bd6 d601      sub     $01
6bd8 9f        sbc     a,a
6bd9 326389    ld      ($8963),a
6bdc b7        or      a
6bdd c2376c    jp      nz,$6c37
6be0 219c8b    ld      hl,$8b9c
6be3 cdcd81    call    $81cd
6be6 216889    ld      hl,$8968
6be9 cdbe81    call    $81be
6bec 21908b    ld      hl,$8b90
6bef cdcd81    call    $81cd
6bf2 21a08b    ld      hl,$8ba0
6bf5 cded7d    call    $7ded
6bf8 3d        dec     a
6bf9 c681      add     a,$81
6bfb 9f        sbc     a,a
6bfc 326389    ld      ($8963),a
6bff b7        or      a
6c00 c2126c    jp      nz,$6c12
6c03 21a08b    ld      hl,$8ba0
6c06 cdcd81    call    $81cd
6c09 21908b    ld      hl,$8b90
6c0c cdbe81    call    $81be
6c0f c3726c    jp      $6c72
6c12 21908b    ld      hl,$8b90
6c15 cdcd81    call    $81cd
6c18 219c8b    ld      hl,$8b9c
6c1b cded7d    call    $7ded
6c1e 17        rla     
6c1f 3f        ccf     
6c20 9f        sbc     a,a
6c21 326389    ld      ($8963),a
6c24 b7        or      a
6c25 c2376c    jp      nz,$6c37
6c28 219c8b    ld      hl,$8b9c
6c2b cdcd81    call    $81cd
6c2e 21908b    ld      hl,$8b90
6c31 cdbe81    call    $81be
6c34 c3726c    jp      $6c72
6c37 216489    ld      hl,$8964
6c3a cdcd81    call    $81cd
6c3d 218c8b    ld      hl,$8b8c
6c40 cdbe81    call    $81be
6c43 c3966c    jp      $6c96
6c46 3a898b    ld      a,($8b89)
6c49 215889    ld      hl,$8958
6c4c 96        sub     (hl)
6c4d c6ff      add     a,$ff
6c4f 9f        sbc     a,a
6c50 326389    ld      ($8963),a
6c53 b7        or      a
6c54 c2666c    jp      nz,$6c66
6c57 21a08b    ld      hl,$8ba0
6c5a cdcd81    call    $81cd
6c5d 21908b    ld      hl,$8b90
6c60 cdbe81    call    $81be
6c63 c3726c    jp      $6c72
6c66 219c8b    ld      hl,$8b9c
6c69 cdcd81    call    $81cd
6c6c 21908b    ld      hl,$8b90
6c6f cdbe81    call    $81be
6c72 21908b    ld      hl,$8b90
6c75 cdcd81    call    $81cd
6c78 21568c    ld      hl,$8c56
6c7b cded7d    call    $7ded
6c7e 215b89    ld      hl,$895b
6c81 cdfe7e    call    $7efe
6c84 215f89    ld      hl,$895f
6c87 cd007e    call    $7e00
6c8a 21528c    ld      hl,$8c52
6c8d cd8b7d    call    $7d8b
6c90 218c8b    ld      hl,$8b8c
6c93 cdbe81    call    $81be
6c96 c9        ret     

6c97 014b8c    ld      bc,$8c4b
6c9a 11498c    ld      de,$8c49
6c9d 21478c    ld      hl,$8c47
6ca0 cdeb06    call    $06eb
6ca3 2a478c    ld      hl,($8c47)
6ca6 cdde7f    call    $7fde
6ca9 213f8c    ld      hl,$8c3f
6cac cdbe81    call    $81be
6caf 2a498c    ld      hl,($8c49)
6cb2 cdde7f    call    $7fde
6cb5 21438c    ld      hl,$8c43
6cb8 cdbe81    call    $81be
6cbb 213f8c    ld      hl,$8c3f
6cbe cdcd81    call    $81cd
6cc1 21178c    ld      hl,$8c17
6cc4 cd007e    call    $7e00
6cc7 2156a6    ld      hl,$a656
6cca cdbe81    call    $81be
6ccd 21438c    ld      hl,$8c43
6cd0 cdcd81    call    $81cd
6cd3 211f8c    ld      hl,$8c1f
6cd6 cd007e    call    $7e00
6cd9 215aa6    ld      hl,$a65a
6cdc cdbe81    call    $81be
6cdf 2a4b8c    ld      hl,($8c4b)
6ce2 cdde7f    call    $7fde
6ce5 21178c    ld      hl,$8c17
6ce8 cd007e    call    $7e00
6ceb 215ea6    ld      hl,$a65e
6cee cdbe81    call    $81be
6cf1 215aa6    ld      hl,$a65a
6cf4 cdcd81    call    $81cd
6cf7 2182a6    ld      hl,$a682
6cfa cd007e    call    $7e00
6cfd 2162a6    ld      hl,$a662
6d00 cdbe81    call    $81be
6d03 2156a6    ld      hl,$a656
6d06 cdcd81    call    $81cd
6d09 215ea6    ld      hl,$a65e
6d0c cd007e    call    $7e00
6d0f 2186a6    ld      hl,$a686
6d12 cdbe81    call    $81be
6d15 217ea6    ld      hl,$a67e
6d18 cdcd81    call    $81cd
6d1b 215ea6    ld      hl,$a65e
6d1e cdfe7e    call    $7efe
6d21 2166a6    ld      hl,$a666
6d24 cdbe81    call    $81be
6d27 217aa6    ld      hl,$a67a
6d2a cdcd81    call    $81cd
6d2d 215ea6    ld      hl,$a65e
6d30 cdfe7e    call    $7efe
6d33 216aa6    ld      hl,$a66a
6d36 cdbe81    call    $81be
6d39 217aa6    ld      hl,$a67a
6d3c cdcd81    call    $81cd
6d3f 2162a6    ld      hl,$a662
6d42 cdfe7e    call    $7efe
6d45 cd867c    call    $7c86
6d48 216ea6    ld      hl,$a66e
6d4b cdbe81    call    $81be
6d4e 217ea6    ld      hl,$a67e
6d51 cdcd81    call    $81cd
6d54 2162a6    ld      hl,$a662
6d57 cdfe7e    call    $7efe
6d5a 2172a6    ld      hl,$a672
6d5d cdbe81    call    $81be
6d60 c9        ret     

6d61 226e89    ld      ($896e),hl
6d64 eb        ex      de,hl
6d65 227089    ld      ($8970),hl
6d68 3aa58b    ld      a,($8ba5)
6d6b 3d        dec     a
6d6c 3d        dec     a
6d6d d67f      sub     $7f
6d6f 9f        sbc     a,a
6d70 327a89    ld      ($897a),a
6d73 3a4e8c    ld      a,($8c4e)
6d76 3d        dec     a
6d77 d601      sub     $01
6d79 9f        sbc     a,a
6d7a 217a89    ld      hl,$897a
6d7d a6        and     (hl)
6d7e 327b89    ld      ($897b),a
6d81 b7        or      a
6d82 c2ab6d    jp      nz,$6dab
6d85 af        xor     a
6d86 32a48b    ld      ($8ba4),a
6d89 2a6e89    ld      hl,($896e)
6d8c cdcd81    call    $81cd
6d8f 21528c    ld      hl,$8c52
6d92 cdbe81    call    $81be
6d95 2a7089    ld      hl,($8970)
6d98 cdcd81    call    $81cd
6d9b 21568c    ld      hl,$8c56
6d9e cdbe81    call    $81be
6da1 11568c    ld      de,$8c56
6da4 21528c    ld      hl,$8c52
6da7 cd6d6f    call    $6f6d
6daa c9        ret     

6dab 2a6e89    ld      hl,($896e)
6dae cdcd81    call    $81cd
6db1 21528c    ld      hl,$8c52
6db4 cded7d    call    $7ded
6db7 217c89    ld      hl,$897c
6dba cdbe81    call    $81be
6dbd 2a7089    ld      hl,($8970)
6dc0 cdcd81    call    $81cd
6dc3 21568c    ld      hl,$8c56
6dc6 cded7d    call    $7ded
6dc9 218089    ld      hl,$8980
6dcc cdbe81    call    $81be
6dcf 210200    ld      hl,$0002
6dd2 cdf07b    call    $7bf0
6dd5 218889    ld      hl,$8988
6dd8 cdbe81    call    $81be
6ddb 217c89    ld      hl,$897c
6dde cdcd81    call    $81cd
6de1 210200    ld      hl,$0002
6de4 cdf07b    call    $7bf0
6de7 218889    ld      hl,$8988
6dea cd8b7d    call    $7d8b
6ded 218c89    ld      hl,$898c
6df0 cdbe81    call    $81be
6df3 218c89    ld      hl,$898c
6df6 cd2c7a    call    $7a2c
6df9 218489    ld      hl,$8984
6dfc cdbe81    call    $81be
6dff 217689    ld      hl,$8976
6e02 cded7d    call    $7ded
6e05 3d        dec     a
6e06 c681      add     a,$81
6e08 9f        sbc     a,a
6e09 327a89    ld      ($897a),a
6e0c b7        or      a
6e0d ca116e    jp      z,$6e11
6e10 c9        ret     

6e11 217c89    ld      hl,$897c
6e14 cdcd81    call    $81cd
6e17 218489    ld      hl,$8984
6e1a cd007e    call    $7e00
6e1d 219089    ld      hl,$8990
6e20 cdbe81    call    $81be
6e23 218089    ld      hl,$8980
6e26 cdcd81    call    $81cd
6e29 218489    ld      hl,$8984
6e2c cd007e    call    $7e00
6e2f 219489    ld      hl,$8994
6e32 cdbe81    call    $81be
6e35 3a7389    ld      a,($8973)
6e38 324e8c    ld      ($8c4e),a
6e3b 3a7289    ld      a,($8972)
6e3e 21a58b    ld      hl,$8ba5
6e41 96        sub     (hl)
6e42 d601      sub     $01
6e44 9f        sbc     a,a
6e45 21a48b    ld      hl,$8ba4
6e48 a6        and     (hl)
6e49 327a89    ld      ($897a),a
6e4c b7        or      a
6e4d c2c76e    jp      nz,$6ec7
6e50 3aa58b    ld      a,($8ba5)
6e53 327289    ld      ($8972),a
6e56 af        xor     a
6e57 327489    ld      ($8974),a
6e5a 3a7289    ld      a,($8972)
6e5d d602      sub     $02
6e5f 6f        ld      l,a
6e60 17        rla     
6e61 9f        sbc     a,a
6e62 67        ld      h,a
6e63 29        add     hl,hl
6e64 29        add     hl,hl
6e65 23        inc     hl
6e66 eb        ex      de,hl
6e67 3a7489    ld      a,($8974)
6e6a 6f        ld      l,a
6e6b 17        rla     
6e6c 9f        sbc     a,a
6e6d 67        ld      h,a
6e6e 19        add     hl,de
6e6f 229889    ld      ($8998),hl
6e72 11aa8b    ld      de,$8baa
6e75 19        add     hl,de
6e76 7e        ld      a,(hl)
6e77 327589    ld      ($8975),a
6e7a 3a7489    ld      a,($8974)
6e7d 3c        inc     a
6e7e e603      and     $03
6e80 327489    ld      ($8974),a
6e83 3e01      ld      a,$01
6e85 324e8c    ld      ($8c4e),a
6e88 3a7589    ld      a,($8975)
6e8b b7        or      a
6e8c ca5a6e    jp      z,$6e5a
6e8f f2ab6e    jp      p,$6eab
6e92 af        xor     a
6e93 324e8c    ld      ($8c4e),a
6e96 210000    ld      hl,$0000
6e99 eb        ex      de,hl
6e9a 3a7589    ld      a,($8975)
6e9d 6f        ld      l,a
6e9e 17        rla     
6e9f 9f        sbc     a,a
6ea0 67        ld      h,a
6ea1 7b        ld      a,e
6ea2 95        sub     l
6ea3 6f        ld      l,a
6ea4 7a        ld      a,d
6ea5 9c        sbc     a,h
6ea6 67        ld      h,a
6ea7 7d        ld      a,l
6ea8 327589    ld      ($8975),a
6eab 21a78b    ld      hl,$8ba7
6eae cdcd81    call    $81cd
6eb1 3a7589    ld      a,($8975)
6eb4 6f        ld      l,a
6eb5 17        rla     
6eb6 9f        sbc     a,a
6eb7 67        ld      h,a
6eb8 cdf87e    call    $7ef8
6ebb 219a89    ld      hl,$899a
6ebe cdbe81    call    $81be
6ec1 219e89    ld      hl,$899e
6ec4 cdbe81    call    $81be
6ec7 218489    ld      hl,$8984
6eca cdcd81    call    $81cd
6ecd 219e89    ld      hl,$899e
6ed0 cded7d    call    $7ded
6ed3 218489    ld      hl,$8984
6ed6 cdbe81    call    $81be
6ed9 af        xor     a
6eda 32a48b    ld      ($8ba4),a
6edd 218489    ld      hl,$8984
6ee0 cdcd81    call    $81cd
6ee3 217689    ld      hl,$8976
6ee6 cded7d    call    $7ded
6ee9 17        rla     
6eea 3f        ccf     
6eeb 9f        sbc     a,a
6eec 327a89    ld      ($897a),a
6eef b7        or      a
6ef0 c2166f    jp      nz,$6f16
6ef3 3eff      ld      a,$ff
6ef5 32a48b    ld      ($8ba4),a
6ef8 219e89    ld      hl,$899e
6efb cdcd81    call    $81cd
6efe 218489    ld      hl,$8984
6f01 cd8b7d    call    $7d8b
6f04 219e89    ld      hl,$899e
6f07 cdbe81    call    $81be
6f0a 218489    ld      hl,$8984
6f0d cdda7b    call    $7bda
6f10 218489    ld      hl,$8984
6f13 cdbe81    call    $81be
6f16 219e89    ld      hl,$899e
6f19 cdcd81    call    $81cd
6f1c 219089    ld      hl,$8990
6f1f cdfe7e    call    $7efe
6f22 21528c    ld      hl,$8c52
6f25 cd8b7d    call    $7d8b
6f28 21528c    ld      hl,$8c52
6f2b cdbe81    call    $81be
6f2e 219e89    ld      hl,$899e
6f31 cdcd81    call    $81cd
6f34 219489    ld      hl,$8994
6f37 cdfe7e    call    $7efe
6f3a 21568c    ld      hl,$8c56
6f3d cd8b7d    call    $7d8b
6f40 21568c    ld      hl,$8c56
6f43 cdbe81    call    $81be
6f46 11568c    ld      de,$8c56
6f49 21528c    ld      hl,$8c52
6f4c cd6d6f    call    $6f6d
6f4f 3aa48b    ld      a,($8ba4)
6f52 2f        cpl     
6f53 327a89    ld      ($897a),a
6f56 b7        or      a
6f57 c25a6e    jp      nz,$6e5a
6f5a 218489    ld      hl,$8984
6f5d cdcd81    call    $81cd
6f60 219e89    ld      hl,$899e
6f63 cdbe81    call    $81be
6f66 3a4e8c    ld      a,($8c4e)
6f69 327389    ld      ($8973),a
6f6c c9        ret     

6f6d 22a389    ld      ($89a3),hl
6f70 eb        ex      de,hl
6f71 22a589    ld      ($89a5),hl
6f74 cde84e    call    $4ee8
6f77 21178c    ld      hl,$8c17
6f7a cdcd81    call    $81cd
6f7d 2aa389    ld      hl,($89a3)
6f80 cdfe7e    call    $7efe
6f83 21aa89    ld      hl,$89aa
6f86 cd8b7d    call    $7d8b
6f89 21138c    ld      hl,$8c13
6f8c cd8b7d    call    $7d8b
6f8f cd807a    call    $7a80
6f92 22ae89    ld      ($89ae),hl
6f95 211f8c    ld      hl,$8c1f
6f98 cdcd81    call    $81cd
6f9b 2aa589    ld      hl,($89a5)
6f9e cdfe7e    call    $7efe
6fa1 21aa89    ld      hl,$89aa
6fa4 cd8b7d    call    $7d8b
6fa7 211b8c    ld      hl,$8c1b
6faa cd8b7d    call    $7d8b
6fad cd807a    call    $7a80
6fb0 22b089    ld      ($89b0),hl
6fb3 3a4e8c    ld      a,($8c4e)
6fb6 21a789    ld      hl,$89a7
6fb9 96        sub     (hl)
6fba c6ff      add     a,$ff
6fbc 9f        sbc     a,a
6fbd 32b289    ld      ($89b2),a
6fc0 b7        or      a
6fc1 c2ce6f    jp      nz,$6fce
6fc4 11b089    ld      de,$89b0
6fc7 21ae89    ld      hl,$89ae
6fca cdd006    call    $06d0
6fcd c9        ret     

6fce 3a4e8c    ld      a,($8c4e)
6fd1 21a889    ld      hl,$89a8
6fd4 96        sub     (hl)
6fd5 c6ff      add     a,$ff
6fd7 9f        sbc     a,a
6fd8 32b289    ld      ($89b2),a
6fdb b7        or      a
6fdc c2e96f    jp      nz,$6fe9
6fdf 11b089    ld      de,$89b0
6fe2 21ae89    ld      hl,$89ae
6fe5 cdd306    call    $06d3
6fe8 c9        ret     

6fe9 014f8c    ld      bc,$8c4f
6fec 11b089    ld      de,$89b0
6fef 21ae89    ld      hl,$89ae
6ff2 cde206    call    $06e2
6ff5 c9        ret     

6ff6 21fd6f    ld      hl,$6ffd
6ff9 22288a    ld      ($8a28),hl
6ffc c9        ret     

6ffd 210370    ld      hl,$7003
7000 c3c876    jp      $76c8
7003 09        add     hl,bc
7004 00        nop     
7005 c5        push    bc
7006 eb        ex      de,hl
7007 4e        ld      c,(hl)
7008 23        inc     hl
7009 46        ld      b,(hl)
700a eb        ex      de,hl
700b 71        ld      (hl),c
700c 23        inc     hl
700d 70        ld      (hl),b
700e 23        inc     hl
700f eb        ex      de,hl
7010 2ac88c    ld      hl,($8cc8)
7013 eb        ex      de,hl
7014 73        ld      (hl),e
7015 23        inc     hl
7016 72        ld      (hl),d
7017 3aca8c    ld      a,($8cca)
701a 23        inc     hl
701b 77        ld      (hl),a
701c 23        inc     hl
701d 3a828c    ld      a,($8c82)
7020 77        ld      (hl),a
7021 d1        pop     de
7022 eb        ex      de,hl
7023 5e        ld      e,(hl)
7024 23        inc     hl
7025 56        ld      d,(hl)
7026 60        ld      h,b
7027 69        ld      l,c
7028 cd7271    call    $7172
702b eb        ex      de,hl
702c 79        ld      a,c
702d 21c88c    ld      hl,$8cc8
7030 4e        ld      c,(hl)
7031 23        inc     hl
7032 46        ld      b,(hl)
7033 23        inc     hl
7034 eb        ex      de,hl
7035 09        add     hl,bc
7036 eb        ex      de,hl
7037 8e        adc     a,(hl)
7038 eb        ex      de,hl
7039 32ca8c    ld      ($8cca),a
703c 22c88c    ld      ($8cc8),hl
703f c9        ret     

7040 210000    ld      hl,$0000
7043 22c88c    ld      ($8cc8),hl
7046 97        sub     a
7047 32ca8c    ld      ($8cca),a
704a c9        ret     

704b 46        ld      b,(hl)
704c eb        ex      de,hl
704d 7e        ld      a,(hl)
704e 23        inc     hl
704f 66        ld      h,(hl)
7050 6f        ld      l,a
7051 97        sub     a
7052 78        ld      a,b
7053 1f        rra     
7054 47        ld      b,a
7055 d25c70    jp      nc,$705c
7058 7c        ld      a,h
7059 f680      or      $80
705b 67        ld      h,a
705c 110100    ld      de,$0001
705f cd9a71    call    $719a
7062 22c58c    ld      ($8cc5),hl
7065 78        ld      a,b
7066 de00      sbc     a,$00
7068 32c78c    ld      ($8cc7),a
706b c9        ret     

706c e5        push    hl
706d eb        ex      de,hl
706e 5e        ld      e,(hl)
706f 23        inc     hl
7070 56        ld      d,(hl)
7071 eb        ex      de,hl
7072 22b371    ld      ($71b3),hl
7075 c37f70    jp      $707f
7078 e5        push    hl
7079 cdcd70    call    $70cd
707c cde470    call    $70e4
707f 97        sub     a
7080 cd0a71    call    $710a
7083 cd6271    call    $7162
7086 2ab571    ld      hl,($71b5)
7089 d1        pop     de
708a cda371    call    $71a3
708d d5        push    de
708e b7        or      a
708f c28070    jp      nz,$7080
7092 d1        pop     de
7093 3ac092    ld      a,($92c0)
7096 c9        ret     

7097 e5        push    hl
7098 eb        ex      de,hl
7099 5e        ld      e,(hl)
709a 23        inc     hl
709b 56        ld      d,(hl)
709c eb        ex      de,hl
709d 22b371    ld      ($71b3),hl
70a0 c3aa70    jp      $70aa
70a3 e5        push    hl
70a4 cdcd70    call    $70cd
70a7 cde470    call    $70e4
70aa 97        sub     a
70ab cd0a71    call    $710a
70ae cd6271    call    $7162
70b1 2ab571    ld      hl,($71b5)
70b4 d1        pop     de
70b5 f5        push    af
70b6 eb        ex      de,hl
70b7 cda371    call    $71a3
70ba 3ad88c    ld      a,($8cd8)
70bd f608      or      $08
70bf 32d88c    ld      ($8cd8),a
70c2 f1        pop     af
70c3 e5        push    hl
70c4 b7        or      a
70c5 c2ab70    jp      nz,$70ab
70c8 e1        pop     hl
70c9 3ac092    ld      a,($92c0)
70cc c9        ret     

70cd 210500    ld      hl,$0005
70d0 19        add     hl,de
70d1 3a828c    ld      a,($8c82)
70d4 be        cp      (hl)
70d5 c8        ret     z

70d6 d5        push    de
70d7 c5        push    bc
70d8 7e        ld      a,(hl)
70d9 21e370    ld      hl,$70e3
70dc 77        ld      (hl),a
70dd cdb771    call    $71b7
70e0 c1        pop     bc
70e1 d1        pop     de
70e2 c9        ret     

70e3 05        dec     b
70e4 eb        ex      de,hl
70e5 5e        ld      e,(hl)
70e6 23        inc     hl
70e7 56        ld      d,(hl)
70e8 23        inc     hl
70e9 e5        push    hl
70ea eb        ex      de,hl
70eb 22b371    ld      ($71b3),hl
70ee 0a        ld      a,(bc)
70ef 5f        ld      e,a
70f0 03        inc     bc
70f1 0a        ld      a,(bc)
70f2 57        ld      d,a
70f3 1b        dec     de
70f4 cd7271    call    $7172
70f7 eb        ex      de,hl
70f8 79        ld      a,c
70f9 e1        pop     hl
70fa 4e        ld      c,(hl)
70fb 23        inc     hl
70fc 46        ld      b,(hl)
70fd 23        inc     hl
70fe eb        ex      de,hl
70ff 09        add     hl,bc
7100 eb        ex      de,hl
7101 8e        adc     a,(hl)
7102 eb        ex      de,hl
7103 32c78c    ld      ($8cc7),a
7106 22c58c    ld      ($8cc5),hl
7109 c9        ret     

710a b7        or      a
710b ca1671    jp      z,$7116
710e 2a6071    ld      hl,($7160)
7111 44        ld      b,h
7112 4d        ld      c,l
7113 c31b71    jp      $711b
7116 2ab371    ld      hl,($71b3)
7119 44        ld      b,h
711a 4d        ld      c,l
711b 2acb8c    ld      hl,($8ccb)
711e eb        ex      de,hl
711f 2ac58c    ld      hl,($8cc5)
7122 cd9a71    call    $719a
7125 22ce8c    ld      ($8cce),hl
7128 eb        ex      de,hl
7129 3ac78c    ld      a,($8cc7)
712c 21cd8c    ld      hl,$8ccd
712f 9e        sbc     a,(hl)
7130 c25871    jp      nz,$7158
7133 2ad28c    ld      hl,($8cd2)
7136 2b        dec     hl
7137 cd9a71    call    $719a
713a da5871    jp      c,$7158
713d e5        push    hl
713e 2ad68c    ld      hl,($8cd6)
7141 19        add     hl,de
7142 22b571    ld      ($71b5),hl
7145 d1        pop     de
7146 60        ld      h,b
7147 69        ld      l,c
7148 13        inc     de
7149 13        inc     de
714a cd9a71    call    $719a
714d d8        ret     c

714e 23        inc     hl
714f 226071    ld      ($7160),hl
7152 1b        dec     de
7153 42        ld      b,d
7154 4b        ld      c,e
7155 3eff      ld      a,$ff
7157 c9        ret     

7158 c5        push    bc
7159 cd9172    call    $7291
715c c1        pop     bc
715d c31b71    jp      $711b
7160 00        nop     
7161 00        nop     
7162 57        ld      d,a
7163 97        sub     a
7164 2ac58c    ld      hl,($8cc5)
7167 09        add     hl,bc
7168 22c58c    ld      ($8cc5),hl
716b 21c78c    ld      hl,$8cc7
716e 8e        adc     a,(hl)
716f 77        ld      (hl),a
7170 7a        ld      a,d
7171 c9        ret     

7172 e5        push    hl
7173 210000    ld      hl,$0000
7176 010000    ld      bc,$0000
7179 e3        ex      (sp),hl
717a 7c        ld      a,h
717b b5        or      l
717c ca9771    jp      z,$7197
717f 97        sub     a
7180 7c        ld      a,h
7181 1f        rra     
7182 67        ld      h,a
7183 7d        ld      a,l
7184 1f        rra     
7185 6f        ld      l,a
7186 e3        ex      (sp),hl
7187 d28e71    jp      nc,$718e
718a 19        add     hl,de
718b 78        ld      a,b
718c 89        adc     a,c
718d 4f        ld      c,a
718e eb        ex      de,hl
718f 29        add     hl,hl
7190 eb        ex      de,hl
7191 78        ld      a,b
7192 8f        adc     a,a
7193 47        ld      b,a
7194 c37971    jp      $7179
7197 e3        ex      (sp),hl
7198 d1        pop     de
7199 c9        ret     

719a 7d        ld      a,l
719b 93        sub     e
719c 6f        ld      l,a
719d 7c        ld      a,h
719e 9a        sbc     a,d
719f 67        ld      h,a
71a0 3e00      ld      a,$00
71a2 c9        ret     

71a3 f5        push    af
71a4 c3ac71    jp      $71ac
71a7 7e        ld      a,(hl)
71a8 12        ld      (de),a
71a9 23        inc     hl
71aa 13        inc     de
71ab 0b        dec     bc
71ac 78        ld      a,b
71ad b1        or      c
71ae c2a771    jp      nz,$71a7
71b1 f1        pop     af
71b2 c9        ret     

71b3 15        dec     d
71b4 00        nop     
71b5 aa        xor     d
71b6 c422b4    call    nz,$b422
71b9 89        adc     a,c
71ba 2ab489    ld      hl,($89b4)
71bd 7e        ld      a,(hl)
71be 21828c    ld      hl,$8c82
71c1 96        sub     (hl)
71c2 d601      sub     $01
71c4 9f        sbc     a,a
71c5 32b989    ld      ($89b9),a
71c8 b7        or      a
71c9 cacd71    jp      z,$71cd
71cc c9        ret     

71cd af        xor     a
71ce 32c092    ld      ($92c0),a
71d1 2ab489    ld      hl,($89b4)
71d4 7e        ld      a,(hl)
71d5 3d        dec     a
71d6 e6f8      and     $f8
71d8 c6ff      add     a,$ff
71da 9f        sbc     a,a
71db 32b989    ld      ($89b9),a
71de b7        or      a
71df caeb71    jp      z,$71eb
71e2 cdd87e    call    $7ed8
71e5 53        ld      d,e
71e6 45        ld      b,l
71e7 4c        ld      c,h
71e8 46        ld      b,(hl)
71e9 49        ld      c,c
71ea 4c        ld      c,h
71eb 3a828c    ld      a,($8c82)
71ee c6ff      add     a,$ff
71f0 9f        sbc     a,a
71f1 32b989    ld      ($89b9),a
71f4 b7        or      a
71f5 ca0d72    jp      z,$720d
71f8 3a828c    ld      a,($8c82)
71fb 6f        ld      l,a
71fc 17        rla     
71fd 9f        sbc     a,a
71fe 67        ld      h,a
71ff 29        add     hl,hl
7200 118d8c    ld      de,$8c8d
7203 19        add     hl,de
7204 22ba89    ld      ($89ba),hl
7207 2aba89    ld      hl,($89ba)
720a cd5a76    call    $765a
720d 2ab489    ld      hl,($89b4)
7210 7e        ld      a,(hl)
7211 32828c    ld      ($8c82),a
7214 11868c    ld      de,$8c86
7217 6f        ld      l,a
7218 17        rla     
7219 9f        sbc     a,a
721a 67        ld      h,a
721b 19        add     hl,de
721c 22ba89    ld      ($89ba),hl
721f 2aba89    ld      hl,($89ba)
7222 7e        ld      a,(hl)
7223 b7        or      a
7224 c27372    jp      nz,$7273
7227 3a828c    ld      a,($8c82)
722a 11868c    ld      de,$8c86
722d 6f        ld      l,a
722e 17        rla     
722f 9f        sbc     a,a
7230 67        ld      h,a
7231 19        add     hl,de
7232 22ba89    ld      ($89ba),hl
7235 3eff      ld      a,$ff
7237 2aba89    ld      hl,($89ba)
723a 77        ld      (hl),a
723b 11bc89    ld      de,$89bc
723e 21b789    ld      hl,$89b7
7241 cd5077    call    $7750
7244 32b989    ld      ($89b9),a
7247 b7        or      a
7248 ca5472    jp      z,$7254
724b cdd87e    call    $7ed8
724e 45        ld      b,l
724f 4d        ld      c,l
7250 2d        dec     l
7251 4d        ld      c,l
7252 45        ld      b,l
7253 4d        ld      c,l
7254 3a828c    ld      a,($8c82)
7257 6f        ld      l,a
7258 17        rla     
7259 9f        sbc     a,a
725a 67        ld      h,a
725b 29        add     hl,hl
725c 118d8c    ld      de,$8c8d
725f 19        add     hl,de
7260 22ba89    ld      ($89ba),hl
7263 2abc89    ld      hl,($89bc)
7266 eb        ex      de,hl
7267 2aba89    ld      hl,($89ba)
726a 73        ld      (hl),e
726b 23        inc     hl
726c 72        ld      (hl),d
726d 21bc89    ld      hl,$89bc
7270 cd6776    call    $7667
7273 3a828c    ld      a,($8c82)
7276 6f        ld      l,a
7277 17        rla     
7278 9f        sbc     a,a
7279 67        ld      h,a
727a 29        add     hl,hl
727b 118d8c    ld      de,$8c8d
727e 19        add     hl,de
727f 22ba89    ld      ($89ba),hl
7282 2aba89    ld      hl,($89ba)
7285 cd4c76    call    $764c
7288 218f72    ld      hl,$728f
728b cd8c76    call    $768c
728e c9        ret     

728f 00        nop     
7290 00        nop     
7291 af        xor     a
7292 32c092    ld      ($92c0),a
7295 cdf472    call    $72f4
7298 3ac092    ld      a,($92c0)
729b b7        or      a
729c caa072    jp      z,$72a0
729f c9        ret     

72a0 cd8f74    call    $748f
72a3 3ac092    ld      a,($92c0)
72a6 b7        or      a
72a7 caab72    jp      z,$72ab
72aa c9        ret     

72ab 11c189    ld      de,$89c1
72ae 21c58c    ld      hl,$8cc5
72b1 cd3d76    call    $763d
72b4 2ac189    ld      hl,($89c1)
72b7 eb        ex      de,hl
72b8 2ad08c    ld      hl,($8cd0)
72bb 7b        ld      a,e
72bc 95        sub     l
72bd 6f        ld      l,a
72be 7a        ld      a,d
72bf 9c        sbc     a,h
72c0 67        ld      h,a
72c1 22c389    ld      ($89c3),hl
72c4 11f272    ld      de,$72f2
72c7 21c389    ld      hl,$89c3
72ca 3e02      ld      a,$02
72cc cd697a    call    $7a69
72cf 22c38c    ld      ($8cc3),hl
72d2 11cb8c    ld      de,$8ccb
72d5 21c38c    ld      hl,$8cc3
72d8 cd2876    call    $7628
72db 2ad48c    ld      hl,($8cd4)
72de 22838c    ld      ($8c83),hl
72e1 2ad68c    ld      hl,($8cd6)
72e4 22858c    ld      ($8c85),hl
72e7 cdbf74    call    $74bf
72ea 3ac192    ld      a,($92c1)
72ed b7        or      a
72ee c2e772    jp      nz,$72e7
72f1 c9        ret     

72f2 00        nop     
72f3 00        nop     
72f4 3ad88c    ld      a,($8cd8)
72f7 e607      and     $07
72f9 d607      sub     $07
72fb d601      sub     $01
72fd 9f        sbc     a,a
72fe 32d789    ld      ($89d7),a
7301 b7        or      a
7302 ca0673    jp      z,$7306
7305 c9        ret     

7306 217a73    ld      hl,$737a
7309 cd8076    call    $7680
730c 2f        cpl     
730d 32d789    ld      ($89d7),a
7310 b7        or      a
7311 ca1d73    jp      z,$731d
7314 cdd87e    call    $7ed8
7317 53        ld      d,e
7318 45        ld      b,l
7319 4c        ld      c,h
731a 46        ld      b,(hl)
731b 49        ld      c,c
731c 4c        ld      c,h
731d 217873    ld      hl,$7378
7320 cd8076    call    $7680
7323 32d789    ld      ($89d7),a
7326 b7        or      a
7327 c25e73    jp      nz,$735e
732a 017e73    ld      bc,$737e
732d 11c58c    ld      de,$8cc5
7330 21d489    ld      hl,$89d4
7333 cd0177    call    $7701
7336 3a828c    ld      a,($8c82)
7339 c630      add     a,$30
733b 32ce89    ld      ($89ce),a
733e 017873    ld      bc,$7378
7341 11d389    ld      de,$89d3
7344 21c889    ld      hl,$89c8
7347 cd8073    call    $7380
734a 32d789    ld      ($89d7),a
734d b7        or      a
734e ca5273    jp      z,$7352
7351 c9        ret     

7352 017e73    ld      bc,$737e
7355 11d489    ld      de,$89d4
7358 21c58c    ld      hl,$8cc5
735b cd0177    call    $7701
735e 217673    ld      hl,$7376
7361 cd8076    call    $7680
7364 32d789    ld      ($89d7),a
7367 b7        or      a
7368 ca6c73    jp      z,$736c
736b c9        ret     

736c 117c73    ld      de,$737c
736f 217873    ld      hl,$7378
7372 cdf473    call    $73f4
7375 c9        ret     

7376 02        ld      (bc),a
7377 00        nop     
7378 010000    ld      bc,$0000
737b 00        nop     
737c 00        nop     
737d 00        nop     
737e 03        inc     bc
737f 00        nop     
7380 22e189    ld      ($89e1),hl
7383 eb        ex      de,hl
7384 22e389    ld      ($89e3),hl
7387 60        ld      h,b
7388 69        ld      l,c
7389 22e589    ld      ($89e5),hl
738c 21f073    ld      hl,$73f0
738f cd8076    call    $7680
7392 2f        cpl     
7393 32ea89    ld      ($89ea),a
7396 b7        or      a
7397 caa373    jp      z,$73a3
739a cdd87e    call    $7ed8
739d 53        ld      d,e
739e 45        ld      b,l
739f 4c        ld      c,h
73a0 46        ld      b,(hl)
73a1 49        ld      c,c
73a2 4c        ld      c,h
73a3 11e889    ld      de,$89e8
73a6 219f8c    ld      hl,$8c9f
73a9 cd3377    call    $7733
73ac 01f273    ld      bc,$73f2
73af 2ae189    ld      hl,($89e1)
73b2 eb        ex      de,hl
73b3 21a08c    ld      hl,$8ca0
73b6 cd0177    call    $7701
73b9 2ae589    ld      hl,($89e5)
73bc 44        ld      b,h
73bd 4d        ld      c,l
73be 2ae389    ld      hl,($89e3)
73c1 eb        ex      de,hl
73c2 219f8c    ld      hl,$8c9f
73c5 cd9075    call    $7590
73c8 3ac092    ld      a,($92c0)
73cb 32d989    ld      ($89d9),a
73ce 3ac092    ld      a,($92c0)
73d1 b7        or      a
73d2 c2e473    jp      nz,$73e4
73d5 21ee73    ld      hl,$73ee
73d8 cd8c76    call    $768c
73db 3eff      ld      a,$ff
73dd 32cd8c    ld      ($8ccd),a
73e0 3ad989    ld      a,($89d9)
73e3 c9        ret     

73e4 21ee73    ld      hl,$73ee
73e7 cdc876    call    $76c8
73ea 3ad989    ld      a,($89d9)
73ed c9        ret     

73ee 010000    ld      bc,$0000
73f1 00        nop     
73f2 0b        dec     bc
73f3 00        nop     
73f4 22f489    ld      ($89f4),hl
73f7 eb        ex      de,hl
73f8 22f689    ld      ($89f6),hl
73fb 216474    ld      hl,$7464
73fe cd8076    call    $7680
7401 32fa89    ld      ($89fa),a
7404 b7        or      a
7405 ca0c74    jp      z,$740c
7408 3aec89    ld      a,($89ec)
740b c9        ret     

740c 2af489    ld      hl,($89f4)
740f 7e        ld      a,(hl)
7410 23        inc     hl
7411 66        ld      h,(hl)
7412 6f        ld      l,a
7413 22d48c    ld      ($8cd4),hl
7416 29        add     hl,hl
7417 29        add     hl,hl
7418 29        add     hl,hl
7419 29        add     hl,hl
741a 29        add     hl,hl
741b 29        add     hl,hl
741c 29        add     hl,hl
741d 22d28c    ld      ($8cd2),hl
7420 11d68c    ld      de,$8cd6
7423 21d28c    ld      hl,$8cd2
7426 cd5077    call    $7750
7429 32fa89    ld      ($89fa),a
742c b7        or      a
742d ca3974    jp      z,$7439
7430 cdd87e    call    $7ed8
7433 45        ld      b,l
7434 4d        ld      c,l
7435 2d        dec     l
7436 4d        ld      c,l
7437 45        ld      b,l
7438 4d        ld      c,l
7439 210000    ld      hl,$0000
743c 22d08c    ld      ($8cd0),hl
743f 2af689    ld      hl,($89f6)
7442 7e        ld      a,(hl)
7443 b7        or      a
7444 ca5674    jp      z,$7456
7447 2ad48c    ld      hl,($8cd4)
744a 23        inc     hl
744b eb        ex      de,hl
744c 210200    ld      hl,$0002
744f cd2180    call    $8021
7452 2b        dec     hl
7453 22d08c    ld      ($8cd0),hl
7456 af        xor     a
7457 32ec89    ld      ($89ec),a
745a 216474    ld      hl,$7464
745d cd8c76    call    $768c
7460 3aec89    ld      a,($89ec)
7463 c9        ret     

7464 02        ld      (bc),a
7465 00        nop     
7466 cd8f74    call    $748f
7469 219f8c    ld      hl,$8c9f
746c cd7479    call    $7974
746f d6ff      sub     $ff
7471 c6ff      add     a,$ff
7473 9f        sbc     a,a
7474 32058a    ld      ($8a05),a
7477 b7        or      a
7478 c28674    jp      nz,$7486
747b 3eff      ld      a,$ff
747d 32c092    ld      ($92c0),a
7480 218d74    ld      hl,$748d
7483 cdc876    call    $76c8
7486 3ac092    ld      a,($92c0)
7489 32fc89    ld      ($89fc),a
748c c9        ret     

748d 02        ld      (bc),a
748e 00        nop     
748f 21bd74    ld      hl,$74bd
7492 cd8076    call    $7680
7495 2f        cpl     
7496 32088a    ld      ($8a08),a
7499 b7        or      a
749a ca9e74    jp      z,$749e
749d c9        ret     

749e 21bd74    ld      hl,$74bd
74a1 cd9676    call    $7696
74a4 11c38c    ld      de,$8cc3
74a7 21cb8c    ld      hl,$8ccb
74aa cd3d76    call    $763d
74ad 2ad48c    ld      hl,($8cd4)
74b0 22838c    ld      ($8c83),hl
74b3 2ad68c    ld      hl,($8cd6)
74b6 22858c    ld      ($8c85),hl
74b9 cd3275    call    $7532
74bc c9        ret     

74bd 03        inc     bc
74be 00        nop     
74bf af        xor     a
74c0 32c092    ld      ($92c0),a
74c3 af        xor     a
74c4 32c192    ld      ($92c1),a
74c7 21838c    ld      hl,$8c83
74ca cd0b77    call    $770b
74cd 320d8a    ld      ($8a0d),a
74d0 b7        or      a
74d1 cad574    jp      z,$74d5
74d4 c9        ret     

74d5 21858c    ld      hl,$8c85
74d8 cdca79    call    $79ca
74db 2a858c    ld      hl,($8c85)
74de 118000    ld      de,$0080
74e1 19        add     hl,de
74e2 22858c    ld      ($8c85),hl
74e5 2ac38c    ld      hl,($8cc3)
74e8 22c08c    ld      ($8cc0),hl
74eb 219f8c    ld      hl,$8c9f
74ee cdb879    call    $79b8
74f1 320a8a    ld      ($8a0a),a
74f4 2ac38c    ld      hl,($8cc3)
74f7 23        inc     hl
74f8 22c38c    ld      ($8cc3),hl
74fb 2a838c    ld      hl,($8c83)
74fe 2b        dec     hl
74ff 22838c    ld      ($8c83),hl
7502 3a0a8a    ld      a,($8a0a)
7505 d601      sub     $01
7507 9f        sbc     a,a
7508 320d8a    ld      ($8a0d),a
750b b7        or      a
750c c2c774    jp      nz,$74c7
750f 3eff      ld      a,$ff
7511 32c092    ld      ($92c0),a
7514 3a0a8a    ld      a,($8a0a)
7517 e602      and     $02
7519 d601      sub     $01
751b 9f        sbc     a,a
751c 320d8a    ld      ($8a0d),a
751f b7        or      a
7520 c22a75    jp      nz,$752a
7523 213075    ld      hl,$7530
7526 cdc876    call    $76c8
7529 c9        ret     

752a 3eff      ld      a,$ff
752c 32c192    ld      ($92c1),a
752f c9        ret     

7530 03        inc     bc
7531 00        nop     
7532 af        xor     a
7533 32c092    ld      ($92c0),a
7536 af        xor     a
7537 32c192    ld      ($92c1),a
753a 21838c    ld      hl,$8c83
753d cd0b77    call    $770b
7540 32128a    ld      ($8a12),a
7543 b7        or      a
7544 ca4875    jp      z,$7548
7547 c9        ret     

7548 21858c    ld      hl,$8c85
754b cdca79    call    $79ca
754e 2a858c    ld      hl,($8c85)
7551 118000    ld      de,$0080
7554 19        add     hl,de
7555 22858c    ld      ($8c85),hl
7558 2ac38c    ld      hl,($8cc3)
755b 22c08c    ld      ($8cc0),hl
755e 219f8c    ld      hl,$8c9f
7561 cdbe79    call    $79be
7564 320f8a    ld      ($8a0f),a
7567 2ac38c    ld      hl,($8cc3)
756a 23        inc     hl
756b 22c38c    ld      ($8cc3),hl
756e 2a838c    ld      hl,($8c83)
7571 2b        dec     hl
7572 22838c    ld      ($8c83),hl
7575 3a0f8a    ld      a,($8a0f)
7578 d601      sub     $01
757a 9f        sbc     a,a
757b 32128a    ld      ($8a12),a
757e b7        or      a
757f c23a75    jp      nz,$753a
7582 3eff      ld      a,$ff
7584 32c092    ld      ($92c0),a
7587 218e75    ld      hl,$758e
758a cdc876    call    $76c8
758d c9        ret     

758e 04        inc     b
758f 00        nop     
7590 22148a    ld      ($8a14),hl
7593 eb        ex      de,hl
7594 22168a    ld      ($8a16),hl
7597 60        ld      h,b
7598 69        ld      l,c
7599 22188a    ld      ($8a18),hl
759c 2a168a    ld      hl,($8a16)
759f 7e        ld      a,(hl)
75a0 2a148a    ld      hl,($8a14)
75a3 77        ld      (hl),a
75a4 2a148a    ld      hl,($8a14)
75a7 cd6e79    call    $796e
75aa 321a8a    ld      ($8a1a),a
75ad af        xor     a
75ae 32c092    ld      ($92c0),a
75b1 2a188a    ld      hl,($8a18)
75b4 7e        ld      a,(hl)
75b5 b7        or      a
75b6 c2d575    jp      nz,$75d5
75b9 3a1a8a    ld      a,($8a1a)
75bc d6ff      sub     $ff
75be c6ff      add     a,$ff
75c0 9f        sbc     a,a
75c1 321d8a    ld      ($8a1d),a
75c4 b7        or      a
75c5 cac975    jp      z,$75c9
75c8 c9        ret     

75c9 3eff      ld      a,$ff
75cb 32c092    ld      ($92c0),a
75ce 212276    ld      hl,$7622
75d1 cdc876    call    $76c8
75d4 c9        ret     

75d5 3a1a8a    ld      a,($8a1a)
75d8 d6ff      sub     $ff
75da c6ff      add     a,$ff
75dc 9f        sbc     a,a
75dd 321d8a    ld      ($8a1d),a
75e0 b7        or      a
75e1 c20676    jp      nz,$7606
75e4 2a148a    ld      hl,($8a14)
75e7 cd9879    call    $7998
75ea 321a8a    ld      ($8a1a),a
75ed d6ff      sub     $ff
75ef c6ff      add     a,$ff
75f1 9f        sbc     a,a
75f2 321d8a    ld      ($8a1d),a
75f5 b7        or      a
75f6 cafa75    jp      z,$75fa
75f9 c9        ret     

75fa 3eff      ld      a,$ff
75fc 32c092    ld      ($92c0),a
75ff 212476    ld      hl,$7624
7602 cdc876    call    $76c8
7605 c9        ret     

7606 2a188a    ld      hl,($8a18)
7609 7e        ld      a,(hl)
760a 3d        dec     a
760b d601      sub     $01
760d 9f        sbc     a,a
760e 321d8a    ld      ($8a1d),a
7611 b7        or      a
7612 ca1676    jp      z,$7616
7615 c9        ret     

7616 3eff      ld      a,$ff
7618 32c092    ld      ($92c0),a
761b 212676    ld      hl,$7626
761e cdc876    call    $76c8
7621 c9        ret     

7622 05        dec     b
7623 00        nop     
7624 0600      ld      b,$00
7626 07        rlca    
7627 00        nop     
7628 7e        ld      a,(hl)
7629 23        inc     hl
762a 66        ld      h,(hl)
762b 6f        ld      l,a
762c 13        inc     de
762d 13        inc     de
762e eb        ex      de,hl
762f af        xor     a
7630 7a        ld      a,d
7631 1f        rra     
7632 77        ld      (hl),a
7633 2b        dec     hl
7634 7b        ld      a,e
7635 1f        rra     
7636 77        ld      (hl),a
7637 2b        dec     hl
7638 3e00      ld      a,$00
763a 1f        rra     
763b 77        ld      (hl),a
763c c9        ret     

763d 7e        ld      a,(hl)
763e 17        rla     
763f 23        inc     hl
7640 7e        ld      a,(hl)
7641 17        rla     
7642 4f        ld      c,a
7643 23        inc     hl
7644 7e        ld      a,(hl)
7645 17        rla     
7646 47        ld      b,a
7647 eb        ex      de,hl
7648 71        ld      (hl),c
7649 23        inc     hl
764a 70        ld      (hl),b
764b c9        ret     

764c 5e        ld      e,(hl)
764d 23        inc     hl
764e 56        ld      d,(hl)
764f 013a00    ld      bc,$003a
7652 219f8c    ld      hl,$8c9f
7655 eb        ex      de,hl
7656 cdd876    call    $76d8
7659 c9        ret     

765a 5e        ld      e,(hl)
765b 23        inc     hl
765c 56        ld      d,(hl)
765d 013a00    ld      bc,$003a
7660 219f8c    ld      hl,$8c9f
7663 cdd876    call    $76d8
7666 c9        ret     

7667 5e        ld      e,(hl)
7668 23        inc     hl
7669 56        ld      d,(hl)
766a 013a00    ld      bc,$003a
766d eb        ex      de,hl
766e e5        push    hl
766f af        xor     a
7670 77        ld      (hl),a
7671 23        inc     hl
7672 0b        dec     bc
7673 78        ld      a,b
7674 b1        or      c
7675 c26f76    jp      nz,$766f
7678 e1        pop     hl
7679 112e00    ld      de,$002e
767c 19        add     hl,de
767d 36ff      ld      (hl),$ff
767f c9        ret     

7680 46        ld      b,(hl)
7681 cda176    call    $76a1
7684 21d88c    ld      hl,$8cd8
7687 a6        and     (hl)
7688 c8        ret     z

7689 3eff      ld      a,$ff
768b c9        ret     

768c 46        ld      b,(hl)
768d cda176    call    $76a1
7690 21d88c    ld      hl,$8cd8
7693 b6        or      (hl)
7694 77        ld      (hl),a
7695 c9        ret     

7696 46        ld      b,(hl)
7697 cda176    call    $76a1
769a 21d88c    ld      hl,$8cd8
769d 2f        cpl     
769e a6        and     (hl)
769f 77        ld      (hl),a
76a0 c9        ret     

76a1 3e01      ld      a,$01
76a3 04        inc     b
76a4 05        dec     b
76a5 c8        ret     z

76a6 07        rlca    
76a7 c3a476    jp      $76a4
76aa 7e        ld      a,(hl)
76ab b7        or      a
76ac cac076    jp      z,$76c0
76af e1        pop     hl
76b0 22e576    ld      ($76e5),hl
76b3 210000    ld      hl,$0000
76b6 39        add     hl,sp
76b7 22e376    ld      ($76e3),hl
76ba 2ae576    ld      hl,($76e5)
76bd e5        push    hl
76be 97        sub     a
76bf c9        ret     

76c0 210000    ld      hl,$0000
76c3 22e376    ld      ($76e3),hl
76c6 97        sub     a
76c7 c9        ret     

76c8 cd9201    call    $0192
76cb 2ae376    ld      hl,($76e3)
76ce 7c        ld      a,h
76cf b5        or      l
76d0 c8        ret     z

76d1 f9        ld      sp,hl
76d2 2ae576    ld      hl,($76e5)
76d5 97        sub     a
76d6 3d        dec     a
76d7 e9        jp      (hl)
76d8 78        ld      a,b
76d9 b1        or      c
76da c8        ret     z

76db 7e        ld      a,(hl)
76dc 12        ld      (de),a
76dd 23        inc     hl
76de 13        inc     de
76df 0b        dec     bc
76e0 c3d876    jp      $76d8
76e3 03        inc     bc
76e4 fecb      cp      $cb
76e6 44        ld      b,h
76e7 010200    ld      bc,$0002
76ea 78        ld      a,b
76eb b1        or      c
76ec c8        ret     z

76ed 1a        ld      a,(de)
76ee 77        ld      (hl),a
76ef 23        inc     hl
76f0 13        inc     de
76f1 0b        dec     bc
76f2 c3ea76    jp      $76ea
76f5 010400    ld      bc,$0004
76f8 c3ea76    jp      $76ea
76fb 010800    ld      bc,$0008
76fe c3ea76    jp      $76ea
7701 e5        push    hl
7702 60        ld      h,b
7703 69        ld      l,c
7704 4e        ld      c,(hl)
7705 23        inc     hl
7706 46        ld      b,(hl)
7707 e1        pop     hl
7708 c3ea76    jp      $76ea
770b 010200    ld      bc,$0002
770e 7e        ld      a,(hl)
770f b7        or      a
7710 c21d77    jp      nz,$771d
7713 23        inc     hl
7714 0b        dec     bc
7715 78        ld      a,b
7716 b1        or      c
7717 c20e77    jp      nz,$770e
771a 3eff      ld      a,$ff
771c c9        ret     

771d af        xor     a
771e c9        ret     

771f 010400    ld      bc,$0004
7722 c30e77    jp      $770e
7725 010800    ld      bc,$0008
7728 c30e77    jp      $770e
772b eb        ex      de,hl
772c 4e        ld      c,(hl)
772d 23        inc     hl
772e 46        ld      b,(hl)
772f eb        ex      de,hl
7730 c30e77    jp      $770e
7733 0e00      ld      c,$00
7735 c33f77    jp      $773f
7738 0e20      ld      c,$20
773a c33f77    jp      $773f
773d 0a        ld      a,(bc)
773e 4f        ld      c,a
773f eb        ex      de,hl
7740 7e        ld      a,(hl)
7741 23        inc     hl
7742 66        ld      h,(hl)
7743 6f        ld      l,a
7744 b4        or      h
7745 c8        ret     z

7746 eb        ex      de,hl
7747 71        ld      (hl),c
7748 23        inc     hl
7749 1b        dec     de
774a 7a        ld      a,d
774b b3        or      e
774c c24777    jp      nz,$7747
774f c9        ret     

7750 d5        push    de
7751 5e        ld      e,(hl)
7752 23        inc     hl
7753 56        ld      d,(hl)
7754 eb        ex      de,hl
7755 227c77    ld      ($777c),hl
7758 eb        ex      de,hl
7759 2a6883    ld      hl,($8368)
775c 19        add     hl,de
775d da7877    jp      c,$7778
7760 97        sub     a
7761 eb        ex      de,hl
7762 2a0600    ld      hl,($0006)
7765 cd9577    call    $7795
7768 da7877    jp      c,$7778
776b 2a6883    ld      hl,($8368)
776e eb        ex      de,hl
776f 226883    ld      ($8368),hl
7772 e1        pop     hl
7773 73        ld      (hl),e
7774 23        inc     hl
7775 72        ld      (hl),d
7776 af        xor     a
7777 c9        ret     

7778 e1        pop     hl
7779 3eff      ld      a,$ff
777b c9        ret     

777c 80        add     a,b
777d 00        nop     
777e e5        push    hl
777f 2a6883    ld      hl,($8368)
7782 eb        ex      de,hl
7783 2a0600    ld      hl,($0006)
7786 cd9577    call    $7795
7789 d28f77    jp      nc,$778f
778c 210000    ld      hl,$0000
778f eb        ex      de,hl
7790 e1        pop     hl
7791 73        ld      (hl),e
7792 23        inc     hl
7793 72        ld      (hl),d
7794 c9        ret     

7795 7d        ld      a,l
7796 93        sub     e
7797 6f        ld      l,a
7798 7c        ld      a,h
7799 9a        sbc     a,d
779a 67        ld      h,a
779b c9        ret     

779c e5        push    hl
779d cd0478    call    $7804
77a0 e1        pop     hl
77a1 77        ld      (hl),a
77a2 c9        ret     

77a3 e5        push    hl
77a4 cdaa77    call    $77aa
77a7 e1        pop     hl
77a8 77        ld      (hl),a
77a9 c9        ret     

77aa cdc177    call    $77c1
77ad 2aec91    ld      hl,($91ec)
77b0 bd        cp      l
77b1 0601      ld      b,$01
77b3 caba77    jp      z,$77ba
77b6 bc        cp      h
77b7 0602      ld      b,$02
77b9 c0        ret     nz

77ba 78        ld      a,b
77bb cdd606    call    $06d6
77be c3aa77    jp      $77aa
77c1 cd0b78    call    $780b
77c4 47        ld      b,a
77c5 3aec02    ld      a,($02ec)
77c8 b7        or      a
77c9 4f        ld      c,a
77ca 78        ld      a,b
77cb c8        ret     z

77cc b9        cp      c
77cd c0        ret     nz

77ce 0e0f      ld      c,$0f
77d0 c5        push    bc
77d1 af        xor     a
77d2 3d        dec     a
77d3 c2d277    jp      nz,$77d2
77d6 cd0478    call    $7804
77d9 b7        or      a
77da c2e477    jp      nz,$77e4
77dd c1        pop     bc
77de 0d        dec     c
77df c2d077    jp      nz,$77d0
77e2 78        ld      a,b
77e3 c9        ret     

77e4 cd0b78    call    $780b
77e7 c1        pop     bc
77e8 b8        cp      b
77e9 c8        ret     z

77ea 47        ld      b,a
77eb 3aed02    ld      a,($02ed)
77ee b7        or      a
77ef cafa77    jp      z,$77fa
77f2 b8        cp      b
77f3 c2a377    jp      nz,$77a3
77f6 cd0b78    call    $780b
77f9 47        ld      b,a
77fa 78        ld      a,b
77fb f680      or      $80
77fd c9        ret     

77fe 5e        ld      e,(hl)
77ff 0e05      ld      c,$05
7801 c30500    jp      $0005
7804 cdfb78    call    $78fb
7807 c8        ret     z

7808 3eff      ld      a,$ff
780a c9        ret     

780b c3dd78    jp      $78dd
780e 5e        ld      e,(hl)
780f d5        push    de
7810 af        xor     a
7811 cdd606    call    $06d6
7814 d1        pop     de
7815 c3cc78    jp      $78cc
7818 5e        ld      e,(hl)
7819 c3cc78    jp      $78cc

				print string $-terminated at addr [HL]

781c 7e        ld      a,(hl)
781d fe24      cp      $24
781f c8        ret     z
7820 e5        push    hl
7821 cd0e78    call    $780e
7824 e1        pop     hl
7825 23        inc     hl
7826 c31c78    jp      $781c

7829 7e        ld      a,(hl)
782a b7        or      a
782b c8        ret     z
782c e5        push    hl
782d cd0e78    call    $780e
7830 e1        pop     hl
7831 23        inc     hl
7832 c32978    jp      $7829
7835 eb        ex      de,hl
7836 0e0a      ld      c,$0a
7838 c30500    jp      $0005
783b 0e18      ld      c,$18
783d cd9878    call    $7898
7840 c42978    call    nz,$7829
7843 0e22      ld      c,$22
7845 cd9878    call    $7898
7848 c8        ret     z

7849 0632      ld      b,$32
784b e3        ex      (sp),hl
784c e3        ex      (sp),hl
784d e3        ex      (sp),hl
784e e3        ex      (sp),hl
784f 05        dec     b
7850 c24b78    jp      nz,$784b
7853 3d        dec     a
7854 c24978    jp      nz,$7849
7857 c9        ret     

7858 15        dec     d
7859 1d        dec     e
785a 0e01      ld      c,$01
785c cd9878    call    $7898
785f ca6578    jp      z,$7865
7862 7b        ld      a,e
7863 5a        ld      e,d
7864 57        ld      d,a
7865 d5        push    de
7866 0e02      ld      c,$02
7868 cd9878    call    $7898
786b c42978    call    nz,$7829
786e 0e08      ld      c,$08
7870 cd9878    call    $7898
7873 d1        pop     de
7874 d5        push    de
7875 82        add     a,d
7876 0e09      ld      c,$09
7878 cda178    call    $78a1
787b 0e0a      ld      c,$0a
787d cd9878    call    $7898
7880 c42978    call    nz,$7829
7883 0e10      ld      c,$10
7885 cd9878    call    $7898
7888 d1        pop     de
7889 83        add     a,e
788a 0e11      ld      c,$11
788c cda178    call    $78a1
788f 0e12      ld      c,$12
7891 cd9878    call    $7898
7894 c42978    call    nz,$7829
7897 c9        ret     

7898 21d602    ld      hl,$02d6
789b 0600      ld      b,$00
789d 09        add     hl,bc
789e 7e        ld      a,(hl)
789f b7        or      a
78a0 c9        ret     

78a1 d5        push    de
78a2 5f        ld      e,a
78a3 cd9878    call    $7898
78a6 c2ae78    jp      nz,$78ae
78a9 cd0f78    call    $780f
78ac d1        pop     de
78ad c9        ret     

78ae 7b        ld      a,e
78af 1e30      ld      e,$30
78b1 fe0a      cp      $0a
78b3 dabc78    jp      c,$78bc
78b6 de0a      sbc     a,$0a
78b8 1c        inc     e
78b9 c3b178    jp      $78b1
78bc f5        push    af
78bd 7b        ld      a,e
78be fe30      cp      $30
78c0 c40f78    call    nz,$780f
78c3 f1        pop     af
78c4 c630      add     a,$30
78c6 5f        ld      e,a
78c7 cd0f78    call    $780f
78ca d1        pop     de
78cb c9        ret     

78cc d5        push    de
78cd cd0479    call    $7904
78d0 3a5379    ld      a,($7953)
78d3 b7        or      a
78d4 c2cd78    jp      nz,$78cd
78d7 c1        pop     bc
78d8 060c      ld      b,$0c
78da c34879    jp      $7948
78dd cdfb78    call    $78fb
78e0 0609      ld      b,$09
78e2 ca4879    jp      z,$7948
78e5 215579    ld      hl,$7955
78e8 4e        ld      c,(hl)
78e9 79        ld      a,c
78ea 3c        inc     a
78eb e607      and     $07
78ed 77        ld      (hl),a
78ee 79        ld      a,c
78ef 215679    ld      hl,$7956
78f2 b7        or      a
78f3 85        add     a,l
78f4 6f        ld      l,a
78f5 3e00      ld      a,$00
78f7 8c        adc     a,h
78f8 67        ld      h,a
78f9 7e        ld      a,(hl)
78fa c9        ret     

78fb cd0479    call    $7904
78fe 2a5479    ld      hl,($7954)
7901 7c        ld      a,h
7902 95        sub     l
7903 c9        ret     

7904 0606      ld      b,$06
7906 cd4879    call    $7948
7909 b7        or      a
790a c8        ret     z

790b 0609      ld      b,$09
790d cd4879    call    $7948
7910 47        ld      b,a
7911 3a5279    ld      a,($7952)
7914 b7        or      a
7915 ca3279    jp      z,$7932
7918 215379    ld      hl,$7953
791b 3e13      ld      a,$13
791d b8        cp      b
791e c22479    jp      nz,$7924
7921 3601      ld      (hl),$01
7923 c9        ret     

7924 7e        ld      a,(hl)
7925 b7        or      a
7926 ca3279    jp      z,$7932
7929 3e11      ld      a,$11
792b b8        cp      b
792c c23279    jp      nz,$7932
792f af        xor     a
7930 77        ld      (hl),a
7931 c9        ret     

7932 215479    ld      hl,$7954
7935 4e        ld      c,(hl)
7936 79        ld      a,c
7937 3c        inc     a
7938 e607      and     $07
793a 77        ld      (hl),a
793b 79        ld      a,c
793c 215679    ld      hl,$7956
793f b7        or      a
7940 85        add     a,l
7941 6f        ld      l,a
7942 3e00      ld      a,$00
7944 8c        adc     a,h
7945 67        ld      h,a
7946 70        ld      (hl),b
7947 c9        ret     

7948 215179    ld      hl,$7951
794b e5        push    hl
794c 2a0100    ld      hl,($0001)
794f 68        ld      l,b
7950 e9        jp      (hl)
7951 c9        ret     

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
795e c30000    jp      $0000
7961 0e0d      ld      c,$0d
7963 c30500    jp      $0005
7966 0e0e      ld      c,$0e
7968 5e        ld      e,(hl)
7969 1600      ld      d,$00
796b c30500    jp      $0005
796e 0e0f      ld      c,$0f
7970 eb        ex      de,hl
7971 c30500    jp      $0005
7974 0e10      ld      c,$10
7976 eb        ex      de,hl
7977 c30500    jp      $0005
797a 0e11      ld      c,$11
797c eb        ex      de,hl
797d c30500    jp      $0005
7980 0e12      ld      c,$12
7982 eb        ex      de,hl
7983 c30500    jp      $0005
7986 0e13      ld      c,$13
7988 eb        ex      de,hl
7989 c30500    jp      $0005
798c 0e14      ld      c,$14
798e eb        ex      de,hl
798f c30500    jp      $0005
7992 0e15      ld      c,$15
7994 eb        ex      de,hl
7995 c30500    jp      $0005
7998 0e16      ld      c,$16
799a eb        ex      de,hl
799b c30500    jp      $0005
799e 0e17      ld      c,$17
79a0 eb        ex      de,hl
79a1 c30500    jp      $0005
79a4 0e18      ld      c,$18
79a6 e5        push    hl
79a7 cd0500    call    $0005
79aa e1        pop     hl
79ab 77        ld      (hl),a
79ac c9        ret     

79ad 0e19      ld      c,$19
79af c3a679    jp      $79a6
79b2 0e1a      ld      c,$1a
79b4 eb        ex      de,hl
79b5 c30500    jp      $0005
79b8 0e21      ld      c,$21
79ba eb        ex      de,hl
79bb c30500    jp      $0005
79be 0e22      ld      c,$22
79c0 eb        ex      de,hl
79c1 c30500    jp      $0005
79c4 0e24      ld      c,$24
79c6 eb        ex      de,hl
79c7 c30500    jp      $0005
79ca 7e        ld      a,(hl)
79cb 23        inc     hl
79cc 66        ld      h,(hl)
79cd 6f        ld      l,a
79ce c3b279    jp      $79b2
79d1 cdde7f    call    $7fde
79d4 c3da79    jp      $79da
79d7 cdcd81    call    $81cd
79da 0604      ld      b,$04
79dc af        xor     a
79dd 21e58a    ld      hl,$8ae5
79e0 77        ld      (hl),a
79e1 23        inc     hl
79e2 05        dec     b
79e3 c2e079    jp      nz,$79e0
79e6 c3fd81    jp      $81fd
79e9 cdf179    call    $79f1
79ec 7d        ld      a,l
79ed c9        ret     

79ee cd267a    call    $7a26
79f1 cdfa79    call    $79fa
79f4 c3807a    jp      $7a80
79f7 cd267a    call    $7a26
79fa cd9880    call    $8098
79fd 21e88a    ld      hl,$8ae8
7a00 46        ld      b,(hl)
7a01 23        inc     hl
7a02 5e        ld      e,(hl)
7a03 23        inc     hl
7a04 56        ld      d,(hl)
7a05 23        inc     hl
7a06 4e        ld      c,(hl)
7a07 c39481    jp      $8194
7a0a cd807a    call    $7a80
7a0d 7d        ld      a,l
7a0e c9        ret     

7a0f 11ef8a    ld      de,$8aef
7a12 0608      ld      b,$08
7a14 7e        ld      a,(hl)
7a15 12        ld      (de),a
7a16 13        inc     de
7a17 23        inc     hl
7a18 05        dec     b
7a19 c2147a    jp      nz,$7a14
7a1c b7        or      a
7a1d 47        ld      b,a
7a1e 2b        dec     hl
7a1f 2b        dec     hl
7a20 4e        ld      c,(hl)
7a21 c8        ret     z

7a22 79        ld      a,c
7a23 c30582    jp      $8205
7a26 11e58a    ld      de,$8ae5
7a29 c3127a    jp      $7a12
7a2c cdcd81    call    $81cd
7a2f c8        ret     z

7a30 fa657a    jp      m,$7a65
7a33 78        ld      a,b
7a34 1f        rra     
7a35 f5        push    af
7a36 3e40      ld      a,$40
7a38 17        rla     
7a39 47        ld      b,a
7a3a 32ec8a    ld      ($8aec),a
7a3d 3e04      ld      a,$04
7a3f f5        push    af
7a40 cdad80    call    $80ad
7a43 d5        push    de
7a44 c5        push    bc
7a45 78        ld      a,b
7a46 b7        or      a
7a47 cd037e    call    $7e03
7a4a c1        pop     bc
7a4b d1        pop     de
7a4c cd8e7d    call    $7d8e
7a4f 21237b    ld      hl,$7b23
7a52 cdfe7e    call    $7efe
7a55 cdb780    call    $80b7
7a58 f1        pop     af
7a59 3d        dec     a
7a5a c23f7a    jp      nz,$7a3f
7a5d f1        pop     af
7a5e c6c0      add     a,$c0
7a60 80        add     a,b
7a61 47        ld      b,a
7a62 c3d681    jp      $81d6
7a65 cdcf82    call    $82cf
7a68 8b        adc     a,e
7a69 cd7782    call    $8277
7a6c af        xor     a
7a6d 32e88a    ld      ($8ae8),a
7a70 cd4880    call    $8048
7a73 eb        ex      de,hl
7a74 e5        push    hl
7a75 cd4880    call    $8048
7a78 e1        pop     hl
7a79 d8        ret     c

7a7a cdc280    call    $80c2
7a7d c3747a    jp      $7a74
7a80 21e98a    ld      hl,$8ae9
7a83 cdcd81    call    $81cd
7a86 3e90      ld      a,$90
7a88 b8        cp      b
7a89 cabd7a    jp      z,$7abd
7a8c d2957a    jp      nc,$7a95
7a8f cdcf82    call    $82cf
7a92 14        inc     d
7a93 068f      ld      b,$8f
7a95 cdf681    call    $81f6
7a98 cdcb7b    call    $7bcb
7a9b cde481    call    $81e4
7a9e eb        ex      de,hl
7a9f cab97a    jp      z,$7ab9
7aa2 eb        ex      de,hl
7aa3 21ed8a    ld      hl,$8aed
7aa6 3680      ld      (hl),$80
7aa8 cda580    call    $80a5
7aab 67        ld      h,a
7aac 3e98      ld      a,$98
7aae 90        sub     b
7aaf cd4182    call    $8241
7ab2 7c        ld      a,h
7ab3 17        rla     
7ab4 d46680    call    nc,$8066
7ab7 eb        ex      de,hl
7ab8 c9        ret     

7ab9 210000    ld      hl,$0000
7abc c9        ret     

7abd 3e80      ld      a,$80
7abf a9        xor     c
7ac0 b2        or      d
7ac1 b3        or      e
7ac2 c28f7a    jp      nz,$7a8f
7ac5 61        ld      h,c
7ac6 6b        ld      l,e
7ac7 c9        ret     

7ac8 7e        ld      a,(hl)
7ac9 23        inc     hl
7aca 66        ld      h,(hl)
7acb 6f        ld      l,a
7acc c3de7f    jp      $7fde
7acf cdcd81    call    $81cd
7ad2 21bc7b    ld      hl,$7bbc
7ad5 cd8b7d    call    $7d8b
7ad8 c3de7a    jp      $7ade
7adb cdcd81    call    $81cd
7ade c8        ret     z

7adf 78        ld      a,b
7ae0 fe99      cp      $99
7ae2 dae97a    jp      c,$7ae9
7ae5 cdcf82    call    $82cf
7ae8 17        rla     
7ae9 01227e    ld      bc,$7e22
7aec 1183f9    ld      de,$f983
7aef cd087f    call    $7f08
7af2 cdad80    call    $80ad
7af5 cd767f    call    $7f76
7af8 cdb780    call    $80b7
7afb 78        ld      a,b
7afc b1        or      c
7afd cdf07d    call    $7df0
7b00 21277b    ld      hl,$7b27
7b03 cded7d    call    $7ded
7b06 f5        push    af
7b07 fa137b    jp      m,$7b13
7b0a 21237b    ld      hl,$7b23
7b0d cded7d    call    $7ded
7b10 f4867c    call    p,$7c86
7b13 21277b    ld      hl,$7b27
7b16 cd8b7d    call    $7d8b
7b19 f1        pop     af
7b1a f4867c    call    p,$7c86
7b1d 212b7b    ld      hl,$7b2b
7b20 c34c7d    jp      $7d4c
7b23 00        nop     
7b24 00        nop     
7b25 00        nop     
7b26 80        add     a,b
7b27 00        nop     
7b28 00        nop     
7b29 00        nop     
7b2a 7f        ld      a,a
7b2b 05        dec     b
7b2c fb        ei      
7b2d d7        rst     $10
7b2e 1e86      ld      e,$86
7b30 64        ld      h,h
7b31 2699      ld      h,$99
7b33 87        add     a,a
7b34 58        ld      e,b
7b35 34        inc     (hl)
7b36 23        inc     hl
7b37 87        add     a,a
7b38 e1        pop     hl
7b39 5d        ld      e,l
7b3a a5        and     l
7b3b 86        add     a,(hl)
7b3c db0f      in      a,($0f)
7b3e 49        ld      c,c
7b3f 83        add     a,e
7b40 cdcd81    call    $81cd
7b43 f24d7b    jp      p,$7b4d
7b46 cd867c    call    $7c86
7b49 21867c    ld      hl,$7c86
7b4c e5        push    hl
7b4d 010081    ld      bc,$8100
7b50 51        ld      d,c
7b51 59        ld      e,c
7b52 cdb07f    call    $7fb0
7b55 da627b    jp      c,$7b62
7b58 21937b    ld      hl,$7b93
7b5b e5        push    hl
7b5c cd7480    call    $8074
7b5f cd067e    call    $7e06
7b62 01097f    ld      bc,$7f09
7b65 11a338    ld      de,$38a3
7b68 cdb07f    call    $7fb0
7b6b da8d7b    jp      c,$7b8d
7b6e 219c7b    ld      hl,$7b9c
7b71 e5        push    hl
7b72 cdad80    call    $80ad
7b75 21a37b    ld      hl,$7ba3
7b78 cd8b7d    call    $7d8b
7b7b c1        pop     bc
7b7c d1        pop     de
7b7d cd7480    call    $8074
7b80 d5        push    de
7b81 c5        push    bc
7b82 21a27b    ld      hl,$7ba2
7b85 cd607d    call    $7d60
7b88 c1        pop     bc
7b89 d1        pop     de
7b8a cd067e    call    $7e06
7b8d 21ab7b    ld      hl,$7bab
7b90 c34c7d    jp      $7d4c
7b93 21bc7b    ld      hl,$7bbc
7b96 cded7d    call    $7ded
7b99 c3867c    jp      $7c86
7b9c 21c07b    ld      hl,$7bc0
7b9f c38b7d    jp      $7d8b
7ba2 02        ld      (bc),a
7ba3 d7        rst     $10
7ba4 b3        or      e
7ba5 5d        ld      e,l
7ba6 81        add     a,c
7ba7 00        nop     
7ba8 00        nop     
7ba9 80        add     a,b
7baa 81        add     a,c
7bab 04        inc     b
7bac 62        ld      h,d
7bad 35        dec     (hl)
7bae 83        add     a,e
7baf 7e        ld      a,(hl)
7bb0 50        ld      d,b
7bb1 24        inc     h
7bb2 4c        ld      c,h
7bb3 7e        ld      a,(hl)
7bb4 79        ld      a,c
7bb5 a9        xor     c
7bb6 aa        xor     d
7bb7 7f        ld      a,a
7bb8 00        nop     
7bb9 00        nop     
7bba 00        nop     
7bbb 81        add     a,c
7bbc db0f      in      a,($0f)
7bbe 49        ld      c,c
7bbf 81        add     a,c
7bc0 92        sub     d
7bc1 0a        ld      a,(bc)
7bc2 0680      ld      b,$80
7bc4 00        nop     
7bc5 00        nop     
7bc6 00        nop     
7bc7 81        add     a,c
7bc8 cdcd81    call    $81cd
7bcb c8        ret     z

7bcc f5        push    af
7bcd fc867c    call    m,$7c86
7bd0 cd767f    call    $7f76
7bd3 f1        pop     af
7bd4 fa867c    jp      m,$7c86
7bd7 c3fd81    jp      $81fd
7bda cdcd81    call    $81cd
7bdd fa867c    jp      m,$7c86
7be0 c9        ret     

7be1 cdcd81    call    $81cd
7be4 cd037d    call    $7d03
7be7 011a7f    ld      bc,$7f1a
7bea 119b20    ld      de,$209b
7bed c3077f    jp      $7f07
7bf0 7c        ld      a,h
7bf1 b5        or      l
7bf2 ca947c    jp      z,$7c94
7bf5 7c        ld      a,h
7bf6 b7        or      a
7bf7 f2037c    jp      p,$7c03
7bfa 11357c    ld      de,$7c35
7bfd d5        push    de
7bfe eb        ex      de,hl
7bff cd5880    call    $8058
7c02 eb        ex      de,hl
7c03 3e11      ld      a,$11
7c05 29        add     hl,hl
7c06 3d        dec     a
7c07 d2057c    jp      nc,$7c05
7c0a e5        push    hl
7c0b 32e88a    ld      ($8ae8),a
7c0e 2ae98a    ld      hl,($8ae9)
7c11 22d28a    ld      ($8ad2),hl
7c14 2aeb8a    ld      hl,($8aeb)
7c17 22d48a    ld      ($8ad4),hl
7c1a 21e88a    ld      hl,$8ae8
7c1d 35        dec     (hl)
7c1e ca337c    jp      z,$7c33
7c21 cde481    call    $81e4
7c24 cd047f    call    $7f04
7c27 e1        pop     hl
7c28 29        add     hl,hl
7c29 e5        push    hl
7c2a 21d28a    ld      hl,$8ad2
7c2d dcfe7e    call    c,$7efe
7c30 c31a7c    jp      $7c1a
7c33 e1        pop     hl
7c34 c9        ret     

7c35 010081    ld      bc,$8100
7c38 51        ld      d,c
7c39 59        ld      e,c
7c3a cd7480    call    $8074
7c3d 78        ld      a,b
7c3e b1        or      c
7c3f c3037e    jp      $7e03
7c42 cdee81    call    $81ee
7c45 ca947c    jp      z,$7c94
7c48 f5        push    af
7c49 cdfd81    call    $81fd
7c4c ca9c7c    jp      z,$7c9c
7c4f e1        pop     hl
7c50 cdad80    call    $80ad
7c53 f2647c    jp      p,$7c64
7c56 c5        push    bc
7c57 d5        push    de
7c58 cd797f    call    $7f79
7c5b d1        pop     de
7c5c c1        pop     bc
7c5d f5        push    af
7c5e cdb07f    call    $7fb0
7c61 e1        pop     hl
7c62 7c        ld      a,h
7c63 1f        rra     
7c64 cdd981    call    $81d9
7c67 c1        pop     bc
7c68 d1        pop     de
7c69 d2707c    jp      nc,$7c70
7c6c 21867c    ld      hl,$7c86
7c6f e5        push    hl
7c70 cc817c    call    z,$7c81
7c73 cdad80    call    $80ad
7c76 cd007d    call    $7d00
7c79 c1        pop     bc
7c7a d1        pop     de
7c7b cd047f    call    $7f04
7c7e c3a37c    jp      $7ca3
7c81 3e7f      ld      a,$7f
7c83 a1        and     c
7c84 4f        ld      c,a
7c85 c9        ret     

7c86 21ec8a    ld      hl,$8aec
7c89 7e        ld      a,(hl)
7c8a b7        or      a
7c8b c8        ret     z

7c8c 2b        dec     hl
7c8d 3e80      ld      a,$80
7c8f ae        xor     (hl)
7c90 77        ld      (hl),a
7c91 c3fd81    jp      $81fd
7c94 010081    ld      bc,$8100
7c97 51        ld      d,c
7c98 59        ld      e,c
7c99 c3d681    jp      $81d6
7c9c f1        pop     af
7c9d fa4480    jp      m,$8044
7ca0 c3fd81    jp      $81fd
7ca3 3aec8a    ld      a,($8aec)
7ca6 fe88      cp      $88
7ca8 d2da7c    jp      nc,$7cda
7cab fe68      cp      $68
7cad dad27c    jp      c,$7cd2
7cb0 cdad80    call    $80ad
7cb3 cd767f    call    $7f76
7cb6 c681      add     a,$81
7cb8 c1        pop     bc
7cb9 d1        pop     de
7cba cada7c    jp      z,$7cda
7cbd f5        push    af
7cbe cd7480    call    $8074
7cc1 cdf37d    call    $7df3
7cc4 21e37c    ld      hl,$7ce3
7cc7 cd607d    call    $7d60
7cca c1        pop     bc
7ccb 110000    ld      de,$0000
7cce 4a        ld      c,d
7ccf c3087f    jp      $7f08
7cd2 010081    ld      bc,$8100
7cd5 51        ld      d,c
7cd6 59        ld      e,c
7cd7 c3d681    jp      $81d6
7cda cdfd81    call    $81fd
7cdd fab481    jp      m,$81b4
7ce0 c38381    jp      $8183
7ce3 07        rlca    
7ce4 7c        ld      a,h
7ce5 88        adc     a,b
7ce6 59        ld      e,c
7ce7 74        ld      (hl),h
7ce8 e0        ret     po

7ce9 97        sub     a
7cea 2677      ld      h,$77
7cec c41d1e    call    nz,$1e1d
7cef 7a        ld      a,d
7cf0 5e        ld      e,(hl)
7cf1 50        ld      d,b
7cf2 63        ld      h,e
7cf3 7c        ld      a,h
7cf4 1a        ld      a,(de)
7cf5 fe75      cp      $75
7cf7 7e        ld      a,(hl)
7cf8 1872      jr      $7d6c
7cfa 318000    ld      sp,$0080
7cfd 00        nop     
7cfe 00        nop     
7cff 81        add     a,c
7d00 cdd681    call    $81d6
7d03 e20a7d    jp      po,$7d0a
7d06 cdcf82    call    $82cf
7d09 8a        adc     a,d
7d0a 3e80      ld      a,$80
7d0c 32ec8a    ld      ($8aec),a
7d0f a8        xor     b
7d10 f5        push    af
7d11 21277d    ld      hl,$7d27
7d14 cd607d    call    $7d60
7d17 f1        pop     af
7d18 cdad80    call    $80ad
7d1b 6f        ld      l,a
7d1c 17        rla     
7d1d 9f        sbc     a,a
7d1e 67        ld      h,a
7d1f cdde7f    call    $7fde
7d22 c1        pop     bc
7d23 d1        pop     de
7d24 c3917d    jp      $7d91
7d27 09        add     hl,bc
7d28 d8        ret     c

7d29 ee94      xor     $94
7d2b 82        add     a,d
7d2c a9        xor     c
7d2d aa        xor     d
7d2e 7d        ld      a,l
7d2f 84        add     a,h
7d30 7d        ld      a,l
7d31 99        sbc     a,c
7d32 bf        cp      a
7d33 86        add     a,(hl)
7d34 7b        ld      a,e
7d35 e5        push    hl
7d36 2887      jr      z,$7cbf
7d38 8a        adc     a,d
7d39 71        ld      (hl),c
7d3a c0        ret     nz

7d3b 87        add     a,a
7d3c 6e        ld      l,(hl)
7d3d 95        sub     l
7d3e 14        inc     d
7d3f 87        add     a,a
7d40 b2        or      d
7d41 1ea0      ld      e,$a0
7d43 86        add     a,(hl)
7d44 ad        xor     l
7d45 7a        ld      a,d
7d46 02        ld      (bc),a
7d47 85        add     a,l
7d48 09        add     hl,bc
7d49 9d        sbc     a,l
7d4a 8d        adc     a,l
7d4b 83        add     a,e
7d4c eb        ex      de,hl
7d4d cdad80    call    $80ad
7d50 d5        push    de
7d51 cde481    call    $81e4
7d54 cd047f    call    $7f04
7d57 e1        pop     hl
7d58 cd607d    call    $7d60
7d5b c1        pop     bc
7d5c d1        pop     de
7d5d c3047f    jp      $7f04
7d60 eb        ex      de,hl
7d61 cdad80    call    $80ad
7d64 eb        ex      de,hl
7d65 7e        ld      a,(hl)
7d66 f5        push    af
7d67 23        inc     hl
7d68 cdcd81    call    $81cd
7d6b f1        pop     af
7d6c c1        pop     bc
7d6d d1        pop     de
7d6e 3d        dec     a
7d6f c8        ret     z

7d70 d5        push    de
7d71 c5        push    bc
7d72 f5        push    af
7d73 e5        push    hl
7d74 78        ld      a,b
7d75 b1        or      c
7d76 cd017f    call    $7f01
7d79 e1        pop     hl
7d7a cdee81    call    $81ee
7d7d e5        push    hl
7d7e cd917d    call    $7d91
7d81 e1        pop     hl
7d82 c36b7d    jp      $7d6b
7d85 cdf07f    call    $7ff0
7d88 c38e7d    jp      $7d8e
7d8b cdee81    call    $81ee
7d8e cafd81    jp      z,$81fd
7d91 3aec8a    ld      a,($8aec)
7d94 b7        or      a
7d95 cad681    jp      z,$81d6
7d98 90        sub     b
7d99 d2a17d    jp      nc,$7da1
7d9c 2f        cpl     
7d9d 3c        inc     a
7d9e cd7480    call    $8074
7da1 fe19      cp      $19
7da3 d2fd81    jp      nc,$81fd
7da6 f5        push    af
7da7 cd9880    call    $8098
7daa 67        ld      h,a
7dab f1        pop     af
7dac e5        push    hl
7dad cd4182    call    $8241
7db0 f1        pop     af
7db1 b7        or      a
7db2 21e98a    ld      hl,$8ae9
7db5 f2d37d    jp      p,$7dd3
7db8 7e        ld      a,(hl)
7db9 83        add     a,e
7dba 5f        ld      e,a
7dbb 23        inc     hl
7dbc 7e        ld      a,(hl)
7dbd 8a        adc     a,d
7dbe 57        ld      d,a
7dbf 23        inc     hl
7dc0 7e        ld      a,(hl)
7dc1 89        adc     a,c
7dc2 4f        ld      c,a
7dc3 d29481    jp      nc,$8194
7dc6 23        inc     hl
7dc7 34        inc     (hl)
7dc8 ca8381    jp      z,$8183
7dcb 2e01      ld      l,$01
7dcd cd5782    call    $8257
7dd0 c39481    jp      $8194
7dd3 af        xor     a
7dd4 90        sub     b
7dd5 47        ld      b,a
7dd6 7e        ld      a,(hl)
7dd7 9b        sbc     a,e
7dd8 5f        ld      e,a
7dd9 23        inc     hl
7dda 7e        ld      a,(hl)
7ddb 9a        sbc     a,d
7ddc 57        ld      d,a
7ddd 23        inc     hl
7dde 7e        ld      a,(hl)
7ddf 99        sbc     a,c
7de0 4f        ld      c,a
7de1 dc6080    call    c,$8060
7de4 c3d680    jp      $80d6
7de7 cdf07f    call    $7ff0
7dea c3f07d    jp      $7df0
7ded cdee81    call    $81ee
7df0 cafd81    jp      z,$81fd
7df3 3e80      ld      a,$80
7df5 a9        xor     c
7df6 4f        ld      c,a
7df7 c3917d    jp      $7d91
7dfa cdf07f    call    $7ff0
7dfd c3037e    jp      $7e03
7e00 cdee81    call    $81ee
7e03 ca4480    jp      z,$8044
7e06 cdfd81    call    $81fd
7e09 c8        ret     z

7e0a af        xor     a
7e0b 90        sub     b
7e0c 47        ld      b,a
7e0d cd567f    call    $7f56
7e10 eb        ex      de,hl
7e11 22d28a    ld      ($8ad2),hl
7e14 eb        ex      de,hl
7e15 79        ld      a,c
7e16 32d48a    ld      ($8ad4),a
7e19 46        ld      b,(hl)
7e1a af        xor     a
7e1b 6f        ld      l,a
7e1c cd6b80    call    $806b
7e1f cd7480    call    $8074
7e22 210000    ld      hl,$0000
7e25 44        ld      b,h
7e26 e5        push    hl
7e27 2ae98a    ld      hl,($8ae9)
7e2a 3aeb8a    ld      a,($8aeb)
7e2d 19        add     hl,de
7e2e 89        adc     a,c
7e2f 4f        ld      c,a
7e30 d2407e    jp      nc,$7e40
7e33 11ec8a    ld      de,$8aec
7e36 eb        ex      de,hl
7e37 34        inc     (hl)
7e38 eb        ex      de,hl
7e39 d1        pop     de
7e3a ca8381    jp      z,$8183
7e3d c3587e    jp      $7e58
7e40 d1        pop     de
7e41 cd687e    call    $7e68
7e44 67        ld      h,a
7e45 2e00      ld      l,$00
7e47 e5        push    hl
7e48 2ad28a    ld      hl,($8ad2)
7e4b 3ad48a    ld      a,($8ad4)
7e4e 19        add     hl,de
7e4f 89        adc     a,c
7e50 4f        ld      c,a
7e51 d1        pop     de
7e52 7a        ld      a,d
7e53 8b        adc     a,e
7e54 d1        pop     de
7e55 d2417e    jp      nc,$7e41
7e58 cd687e    call    $7e68
7e5b 67        ld      h,a
7e5c 2eff      ld      l,$ff
7e5e e5        push    hl
7e5f 2ae98a    ld      hl,($8ae9)
7e62 3aeb8a    ld      a,($8aeb)
7e65 c34e7e    jp      $7e4e
7e68 78        ld      a,b
7e69 3c        inc     a
7e6a 3d        dec     a
7e6b fa7f7e    jp      m,$7e7f
7e6e 7b        ld      a,e
7e6f 17        rla     
7e70 5f        ld      e,a
7e71 7a        ld      a,d
7e72 17        rla     
7e73 57        ld      d,a
7e74 78        ld      a,b
7e75 17        rla     
7e76 47        ld      b,a
7e77 29        add     hl,hl
7e78 79        ld      a,c
7e79 17        rla     
7e7a 4f        ld      c,a
7e7b 9f        sbc     a,a
7e7c eb        ex      de,hl
7e7d e3        ex      (sp),hl
7e7e e9        jp      (hl)
7e7f 1f        rra     
7e80 48        ld      c,b
7e81 47        ld      b,a
7e82 e1        pop     hl
7e83 c39481    jp      $8194
7e86 cdb67e    call    $7eb6
7e89 3e20      ld      a,$20
7e8b 32f78a    ld      ($8af7),a
7e8e 215041    ld      hl,$4150
7e91 22f88a    ld      ($8af8),hl
7e94 215553    ld      hl,$5355
7e97 22fa8a    ld      ($8afa),hl
7e9a 214520    ld      hl,$2045
7e9d 22fc8a    ld      ($8afc),hl
7ea0 cdc77e    call    $7ec7
7ea3 2a7e8a    ld      hl,($8a7e)
7ea6 360a      ld      (hl),$0a
7ea8 cdf783    call    $83f7
7eab 2a7e8a    ld      hl,($8a7e)
7eae 360a      ld      (hl),$0a
7eb0 fe54      cp      $54
7eb2 cad283    jp      z,$83d2
7eb5 c9        ret     

7eb6 e1        pop     hl
7eb7 e3        ex      (sp),hl
7eb8 0606      ld      b,$06
7eba 11fe8a    ld      de,$8afe
7ebd 7e        ld      a,(hl)
7ebe 12        ld      (de),a
7ebf 23        inc     hl
7ec0 13        inc     de
7ec1 05        dec     b
7ec2 c2bd7e    jp      nz,$7ebd
7ec5 e3        ex      (sp),hl
7ec6 e9        jp      (hl)
7ec7 21f78a    ld      hl,$8af7
7eca 060d      ld      b,$0d
7ecc c5        push    bc
7ecd 7e        ld      a,(hl)
7ece cde883    call    $83e8
7ed1 c1        pop     bc
7ed2 05        dec     b
7ed3 23        inc     hl
7ed4 c2cc7e    jp      nz,$7ecc
7ed7 c9        ret     

7ed8 cdb67e    call    $7eb6
7edb 3e20      ld      a,$20
7edd 32f78a    ld      ($8af7),a
7ee0 215354    ld      hl,$5453
7ee3 22f88a    ld      ($8af8),hl
7ee6 214f50    ld      hl,$504f
7ee9 22fa8a    ld      ($8afa),hl
7eec 212020    ld      hl,$2020
7eef 22fc8a    ld      ($8afc),hl
7ef2 cdc77e    call    $7ec7
7ef5 c3d283    jp      $83d2
7ef8 cdf07f    call    $7ff0
7efb c3017f    jp      $7f01
7efe cdee81    call    $81ee
7f01 cad981    jp      z,$81d9
7f04 cdfd81    call    $81fd
7f07 c8        ret     z

7f08 cd567f    call    $7f56
7f0b 79        ld      a,c
7f0c 0e00      ld      c,$00
7f0e c5        push    bc
7f0f 0e08      ld      c,$08
7f11 2b        dec     hl
7f12 46        ld      b,(hl)
7f13 c5        push    bc
7f14 2b        dec     hl
7f15 46        ld      b,(hl)
7f16 c5        push    bc
7f17 2b        dec     hl
7f18 46        ld      b,(hl)
7f19 c5        push    bc
7f1a 77        ld      (hl),a
7f1b 010000    ld      bc,$0000
7f1e 60        ld      h,b
7f1f 68        ld      l,b
7f20 e3        ex      (sp),hl
7f21 7c        ld      a,h
7f22 b7        or      a
7f23 ca4e7f    jp      z,$7f4e
7f26 1f        rra     
7f27 67        ld      h,a
7f28 79        ld      a,c
7f29 e3        ex      (sp),hl
7f2a d2327f    jp      nc,$7f32
7f2d 19        add     hl,de
7f2e 3ae98a    ld      a,($8ae9)
7f31 89        adc     a,c
7f32 1f        rra     
7f33 4f        ld      c,a
7f34 7c        ld      a,h
7f35 1f        rra     
7f36 67        ld      h,a
7f37 7d        ld      a,l
7f38 1f        rra     
7f39 6f        ld      l,a
7f3a 78        ld      a,b
7f3b 1f        rra     
7f3c 47        ld      b,a
7f3d e3        ex      (sp),hl
7f3e 2d        dec     l
7f3f 7c        ld      a,h
7f40 c2267f    jp      nz,$7f26
7f43 e1        pop     hl
7f44 e3        ex      (sp),hl
7f45 7d        ld      a,l
7f46 b7        or      a
7f47 c2217f    jp      nz,$7f21
7f4a d1        pop     de
7f4b c3d680    jp      $80d6
7f4e e1        pop     hl
7f4f 45        ld      b,l
7f50 6c        ld      l,h
7f51 61        ld      h,c
7f52 4f        ld      c,a
7f53 c3207f    jp      $7f20
7f56 21ec8a    ld      hl,$8aec
7f59 7e        ld      a,(hl)
7f5a 80        add     a,b
7f5b 47        ld      b,a
7f5c 1f        rra     
7f5d a8        xor     b
7f5e 78        ld      a,b
7f5f f26e7f    jp      p,$7f6e
7f62 c680      add     a,$80
7f64 cab381    jp      z,$81b3
7f67 77        ld      (hl),a
7f68 cd9880    call    $8098
7f6b 77        ld      (hl),a
7f6c 2b        dec     hl
7f6d c9        ret     

7f6e b7        or      a
7f6f e1        pop     hl
7f70 fa8381    jp      m,$8183
7f73 c3b481    jp      $81b4
7f76 cde481    call    $81e4
7f79 78        ld      a,b
7f7a fe98      cp      $98
7f7c 7b        ld      a,e
7f7d d2d981    jp      nc,$81d9
7f80 21ed8a    ld      hl,$8aed
7f83 3680      ld      (hl),$80
7f85 cda580    call    $80a5
7f88 77        ld      (hl),a
7f89 67        ld      h,a
7f8a fa947f    jp      m,$7f94
7f8d 7a        ld      a,d
7f8e b3        or      e
7f8f c2937f    jp      nz,$7f93
7f92 0d        dec     c
7f93 1b        dec     de
7f94 3e98      ld      a,$98
7f96 90        sub     b
7f97 cd4182    call    $8241
7f9a 7c        ld      a,h
7f9b 17        rla     
7f9c d4a681    call    nc,$81a6
7f9f 0600      ld      b,$00
7fa1 7b        ld      a,e
7fa2 f5        push    af
7fa3 3e98      ld      a,$98
7fa5 32ec8a    ld      ($8aec),a
7fa8 cdd680    call    $80d6
7fab f1        pop     af
7fac d8        ret     c

7fad 2f        cpl     
7fae 3c        inc     a
7faf c9        ret     

7fb0 78        ld      a,b
7fb1 b1        or      c
7fb2 cafd81    jp      z,$81fd
7fb5 210582    ld      hl,$8205
7fb8 e5        push    hl
7fb9 cdfd81    call    $81fd
7fbc 79        ld      a,c
7fbd 2f        cpl     
7fbe c8        ret     z

7fbf 21eb8a    ld      hl,$8aeb
7fc2 ae        xor     (hl)
7fc3 7e        ld      a,(hl)
7fc4 f0        ret     p

7fc5 cdcb7f    call    $7fcb
7fc8 1f        rra     
7fc9 a9        xor     c
7fca c9        ret     

7fcb 23        inc     hl
7fcc 7e        ld      a,(hl)
7fcd b8        cp      b
7fce c0        ret     nz

7fcf 2b        dec     hl
7fd0 7e        ld      a,(hl)
7fd1 b9        cp      c
7fd2 c0        ret     nz

7fd3 2b        dec     hl
7fd4 7e        ld      a,(hl)
7fd5 ba        cp      d
7fd6 c0        ret     nz

7fd7 2b        dec     hl
7fd8 7e        ld      a,(hl)
7fd9 93        sub     e
7fda c0        ret     nz

7fdb e1        pop     hl
7fdc e1        pop     hl
7fdd c9        ret     

7fde 4c        ld      c,h
7fdf 55        ld      d,l
7fe0 0600      ld      b,$00
7fe2 58        ld      e,b
7fe3 29        add     hl,hl
7fe4 219080    ld      hl,$8090
7fe7 22ec8a    ld      ($8aec),hl
7fea dc6080    call    c,$8060
7fed c3d680    jp      $80d6
7ff0 eb        ex      de,hl
7ff1 cdad80    call    $80ad
7ff4 eb        ex      de,hl
7ff5 cdde7f    call    $7fde
7ff8 c1        pop     bc
7ff9 d1        pop     de
7ffa cd7480    call    $8074
7ffd c9        ret     

7ffe 7c        ld      a,h
7fff b7        or      a
8000 c21c80    jp      nz,$801c
8003 b5        or      l
8004 ca1c80    jp      z,$801c
8007 d1        pop     de
8008 1a        ld      a,(de)
8009 bd        cp      l
800a da1580    jp      c,$8015
800d 29        add     hl,hl
800e 19        add     hl,de
800f 2b        dec     hl
8010 7e        ld      a,(hl)
8011 23        inc     hl
8012 66        ld      h,(hl)
8013 6f        ld      l,a
8014 e9        jp      (hl)
8015 6f        ld      l,a
8016 2600      ld      h,$00
8018 29        add     hl,hl
8019 23        inc     hl
801a 19        add     hl,de
801b e9        jp      (hl)
801c d1        pop     de
801d 1a        ld      a,(de)
801e c31580    jp      $8015
8021 eb        ex      de,hl
8022 7a        ld      a,d
8023 b3        or      e
8024 ca4480    jp      z,$8044
8027 7a        ld      a,d
8028 b7        or      a
8029 42        ld      b,d
802a fc5880    call    m,$8058
802d 7c        ld      a,h
802e a8        xor     b
802f 47        ld      b,a
8030 7c        ld      a,h
8031 b5        or      l
8032 c8        ret     z

8033 7c        ld      a,h
8034 b7        or      a
8035 eb        ex      de,hl
8036 fc5880    call    m,$8058
8039 c5        push    bc
803a cd0d82    call    $820d
803d f1        pop     af
803e b7        or      a
803f fc5880    call    m,$8058
8042 eb        ex      de,hl
8043 c9        ret     

8044 cdcf82    call    $82cf
8047 89        adc     a,c
8048 cd8b82    call    $828b
804b d8        ret     c

804c 5e        ld      e,(hl)
804d 23        inc     hl
804e 56        ld      d,(hl)
804f 3ae88a    ld      a,($8ae8)
8052 b7        or      a
8053 fc5880    call    m,$8058
8056 b7        or      a
8057 c9        ret     

8058 af        xor     a
8059 4f        ld      c,a
805a 93        sub     e
805b 5f        ld      e,a
805c 79        ld      a,c
805d 9a        sbc     a,d
805e 57        ld      d,a
805f c9        ret     

8060 21ed8a    ld      hl,$8aed
8063 7e        ld      a,(hl)
8064 2f        cpl     
8065 77        ld      (hl),a
8066 af        xor     a
8067 6f        ld      l,a
8068 90        sub     b
8069 47        ld      b,a
806a 7d        ld      a,l
806b 9b        sbc     a,e
806c 5f        ld      e,a
806d 7d        ld      a,l
806e 9a        sbc     a,d
806f 57        ld      d,a
8070 7d        ld      a,l
8071 99        sbc     a,c
8072 4f        ld      c,a
8073 c9        ret     

8074 cdad80    call    $80ad
8077 cdd981    call    $81d9
807a c1        pop     bc
807b d1        pop     de
807c c9        ret     

807d 7c        ld      a,h
807e b5        or      l
807f c8        ret     z

8080 eb        ex      de,hl
8081 7c        ld      a,h
8082 b5        or      l
8083 c8        ret     z

8084 44        ld      b,h
8085 4d        ld      c,l
8086 210000    ld      hl,$0000
8089 3e10      ld      a,$10
808b 29        add     hl,hl
808c eb        ex      de,hl
808d 29        add     hl,hl
808e eb        ex      de,hl
808f d29380    jp      nc,$8093
8092 09        add     hl,bc
8093 3d        dec     a
8094 c28b80    jp      nz,$808b
8097 c9        ret     

8098 21eb8a    ld      hl,$8aeb
809b 7e        ld      a,(hl)
809c 07        rlca    
809d 37        scf     
809e 1f        rra     
809f 77        ld      (hl),a
80a0 3f        ccf     
80a1 1f        rra     
80a2 23        inc     hl
80a3 23        inc     hl
80a4 77        ld      (hl),a
80a5 79        ld      a,c
80a6 07        rlca    
80a7 37        scf     
80a8 1f        rra     
80a9 4f        ld      c,a
80aa 1f        rra     
80ab ae        xor     (hl)
80ac c9        ret     

80ad 2ae98a    ld      hl,($8ae9)
80b0 e3        ex      (sp),hl
80b1 e5        push    hl
80b2 2aeb8a    ld      hl,($8aeb)
80b5 e3        ex      (sp),hl
80b6 e9        jp      (hl)
80b7 e1        pop     hl
80b8 e3        ex      (sp),hl
80b9 22eb8a    ld      ($8aeb),hl
80bc e1        pop     hl
80bd e3        ex      (sp),hl
80be 22e98a    ld      ($8ae9),hl
80c1 c9        ret     

80c2 7c        ld      a,h
80c3 aa        xor     d
80c4 f2cb80    jp      p,$80cb
80c7 ac        xor     h
80c8 f8        ret     m

80c9 eb        ex      de,hl
80ca c9        ret     

80cb 7d        ld      a,l
80cc 93        sub     e
80cd 7c        ld      a,h
80ce 9a        sbc     a,d
80cf 47        ld      b,a
80d0 1f        rra     
80d1 a8        xor     b
80d2 a8        xor     b
80d3 f0        ret     p

80d4 eb        ex      de,hl
80d5 c9        ret     

80d6 61        ld      h,c
80d7 6a        ld      l,d
80d8 53        ld      d,e
80d9 58        ld      e,b
80da cd1d81    call    $811d
80dd 14        inc     d
80de 15        dec     d
80df cab481    jp      z,$81b4
80e2 4a        ld      c,d
80e3 53        ld      d,e
80e4 5c        ld      e,h
80e5 45        ld      b,l
80e6 21ec8a    ld      hl,$8aec
80e9 96        sub     (hl)
80ea d2b481    jp      nc,$81b4
80ed 2f        cpl     
80ee 3c        inc     a
80ef 77        ld      (hl),a
80f0 c39481    jp      $8194
80f3 0600      ld      b,$00
80f5 21cc8a    ld      hl,$8acc
80f8 7e        ld      a,(hl)
80f9 b7        or      a
80fa c21081    jp      nz,$8110
80fd 78        ld      a,b
80fe d638      sub     $38
8100 c20581    jp      nz,$8105
8103 47        ld      b,a
8104 c9        ret     

8105 c640      add     a,$40
8107 47        ld      b,a
8108 1608      ld      d,$08
810a cd7b81    call    $817b
810d c3f580    jp      $80f5
8110 fa1b81    jp      m,$811b
8113 cd6881    call    $8168
8116 04        inc     b
8117 b7        or      a
8118 f21081    jp      p,$8110
811b 78        ld      a,b
811c c9        ret     

811d 0600      ld      b,$00
811f 7c        ld      a,h
8120 b7        or      a
8121 c24a81    jp      nz,$814a
8124 b5        or      l
8125 c23181    jp      nz,$8131
8128 b2        or      d
8129 c23a81    jp      nz,$813a
812c b3        or      e
812d c24381    jp      nz,$8143
8130 c9        ret     

8131 65        ld      h,l
8132 6a        ld      l,d
8133 53        ld      d,e
8134 58        ld      e,b
8135 0608      ld      b,$08
8137 c34a81    jp      $814a
813a eb        ex      de,hl
813b 110000    ld      de,$0000
813e 0610      ld      b,$10
8140 c34a81    jp      $814a
8143 63        ld      h,e
8144 68        ld      l,b
8145 110000    ld      de,$0000
8148 0618      ld      b,$18
814a 7c        ld      a,h
814b b7        or      a
814c fa5f81    jp      m,$815f
814f 7b        ld      a,e
8150 17        rla     
8151 5f        ld      e,a
8152 7a        ld      a,d
8153 17        rla     
8154 57        ld      d,a
8155 7d        ld      a,l
8156 17        rla     
8157 6f        ld      l,a
8158 7c        ld      a,h
8159 17        rla     
815a 67        ld      h,a
815b 04        inc     b
815c c34b81    jp      $814b
815f 22c78a    ld      ($8ac7),hl
8162 eb        ex      de,hl
8163 22c58a    ld      ($8ac5),hl
8166 78        ld      a,b
8167 c9        ret     

8168 e5        push    hl
8169 21c58a    ld      hl,$8ac5
816c 1e08      ld      e,$08
816e b7        or      a
816f 7e        ld      a,(hl)
8170 17        rla     
8171 77        ld      (hl),a
8172 23        inc     hl
8173 1d        dec     e
8174 c26f81    jp      nz,$816f
8177 e1        pop     hl
8178 c9        ret     

8179 1604      ld      d,$04
817b cd6881    call    $8168
817e 15        dec     d
817f c27b81    jp      nz,$817b
8182 c9        ret     

8183 119c81    ld      de,$819c
8186 d5        push    de
8187 cdcf82    call    $82cf
818a 13        inc     de
818b 11ffff    ld      de,$ffff
818e 4a        ld      c,d
818f 21ec8a    ld      hl,$8aec
8192 71        ld      (hl),c
8193 c9        ret     

8194 78        ld      a,b
8195 21ec8a    ld      hl,$8aec
8198 b7        or      a
8199 fca681    call    m,$81a6
819c 46        ld      b,(hl)
819d 23        inc     hl
819e 7e        ld      a,(hl)
819f e680      and     $80
81a1 a9        xor     c
81a2 4f        ld      c,a
81a3 c3d681    jp      $81d6
81a6 1c        inc     e
81a7 c0        ret     nz

81a8 14        inc     d
81a9 c0        ret     nz

81aa 0c        inc     c
81ab c0        ret     nz

81ac 0e80      ld      c,$80
81ae 34        inc     (hl)
81af c0        ret     nz

81b0 c38781    jp      $8187
81b3 e1        pop     hl
81b4 af        xor     a
81b5 67        ld      h,a
81b6 6f        ld      l,a
81b7 22e98a    ld      ($8ae9),hl
81ba 22eb8a    ld      ($8aeb),hl
81bd c9        ret     

81be e5        push    hl
81bf cde481    call    $81e4
81c2 e1        pop     hl
81c3 73        ld      (hl),e
81c4 23        inc     hl
81c5 72        ld      (hl),d
81c6 23        inc     hl
81c7 71        ld      (hl),c
81c8 23        inc     hl
81c9 70        ld      (hl),b
81ca c3f681    jp      $81f6
81cd cdee81    call    $81ee
81d0 e5        push    hl
81d1 cdd981    call    $81d9
81d4 e1        pop     hl
81d5 c9        ret     

81d6 cdf681    call    $81f6
81d9 eb        ex      de,hl
81da 22e98a    ld      ($8ae9),hl
81dd eb        ex      de,hl
81de 60        ld      h,b
81df 69        ld      l,c
81e0 22eb8a    ld      ($8aeb),hl
81e3 c9        ret     

81e4 2ae98a    ld      hl,($8ae9)
81e7 eb        ex      de,hl
81e8 2aeb8a    ld      hl,($8aeb)
81eb 44        ld      b,h
81ec 4d        ld      c,l
81ed c9        ret     

81ee 5e        ld      e,(hl)
81ef 23        inc     hl
81f0 56        ld      d,(hl)
81f1 23        inc     hl
81f2 4e        ld      c,(hl)
81f3 23        inc     hl
81f4 46        ld      b,(hl)
81f5 23        inc     hl
81f6 78        ld      a,b
81f7 b7        or      a
81f8 c8        ret     z

81f9 79        ld      a,c
81fa c30582    jp      $8205
81fd 3aec8a    ld      a,($8aec)
8200 b7        or      a
8201 c8        ret     z

8202 3aeb8a    ld      a,($8aeb)
8205 17        rla     
8206 9f        sbc     a,a
8207 b7        or      a
8208 37        scf     
8209 c0        ret     nz

820a c601      add     a,$01
820c c9        ret     

820d 7c        ld      a,h
820e 2f        cpl     
820f 47        ld      b,a
8210 7d        ld      a,l
8211 2f        cpl     
8212 4f        ld      c,a
8213 03        inc     bc
8214 210000    ld      hl,$0000
8217 3e11      ld      a,$11
8219 f5        push    af
821a b7        or      a
821b c32882    jp      $8228
821e f5        push    af
821f e5        push    hl
8220 09        add     hl,bc
8221 d22782    jp      nc,$8227
8224 f1        pop     af
8225 37        scf     
8226 3ee1      ld      a,$e1
8228 7b        ld      a,e
8229 17        rla     
822a 5f        ld      e,a
822b 7a        ld      a,d
822c 17        rla     
822d 57        ld      d,a
822e 7d        ld      a,l
822f 17        rla     
8230 6f        ld      l,a
8231 7c        ld      a,h
8232 17        rla     
8233 67        ld      h,a
8234 f1        pop     af
8235 3d        dec     a
8236 c21e82    jp      nz,$821e
8239 7c        ld      a,h
823a b7        or      a
823b 1f        rra     
823c 67        ld      h,a
823d 7d        ld      a,l
823e 1f        rra     
823f 6f        ld      l,a
8240 c9        ret     

8241 0600      ld      b,$00
8243 d608      sub     $08
8245 da5082    jp      c,$8250
8248 43        ld      b,e
8249 5a        ld      e,d
824a 51        ld      d,c
824b 0e00      ld      c,$00
824d c34382    jp      $8243
8250 c609      add     a,$09
8252 6f        ld      l,a
8253 af        xor     a
8254 2d        dec     l
8255 c8        ret     z

8256 79        ld      a,c
8257 1f        rra     
8258 4f        ld      c,a
8259 7a        ld      a,d
825a 1f        rra     
825b 57        ld      d,a
825c 7b        ld      a,e
825d 1f        rra     
825e 5f        ld      e,a
825f 78        ld      a,b
8260 1f        rra     
8261 47        ld      b,a
8262 c35382    jp      $8253
8265 eb        ex      de,hl
8266 60        ld      h,b
8267 69        ld      l,c
8268 4e        ld      c,(hl)
8269 23        inc     hl
826a 46        ld      b,(hl)
826b 23        inc     hl
826c eb        ex      de,hl
826d 71        ld      (hl),c
826e 23        inc     hl
826f 70        ld      (hl),b
8270 23        inc     hl
8271 eb        ex      de,hl
8272 3d        dec     a
8273 c26882    jp      nz,$8268
8276 c9        ret     

8277 32808a    ld      ($8a80),a
827a 22d28a    ld      ($8ad2),hl
827d eb        ex      de,hl
827e 22d48a    ld      ($8ad4),hl
8281 60        ld      h,b
8282 69        ld      l,c
8283 22818a    ld      ($8a81),hl
8286 af        xor     a
8287 32838a    ld      ($8a83),a
828a c9        ret     

828b e5        push    hl
828c d5        push    de
828d 3a838a    ld      a,($8a83)
8290 fe02      cp      $02
8292 d2a082    jp      nc,$82a0
8295 21d28a    ld      hl,$8ad2
8298 87        add     a,a
8299 5f        ld      e,a
829a 1600      ld      d,$00
829c 19        add     hl,de
829d c3b482    jp      $82b4
82a0 f5        push    af
82a1 3a808a    ld      a,($8a80)
82a4 fe04      cp      $04
82a6 2a818a    ld      hl,($8a81)
82a9 dab982    jp      c,$82b9
82ac f1        pop     af
82ad d602      sub     $02
82af 87        add     a,a
82b0 5f        ld      e,a
82b1 1600      ld      d,$00
82b3 19        add     hl,de
82b4 7e        ld      a,(hl)
82b5 23        inc     hl
82b6 66        ld      h,(hl)
82b7 6f        ld      l,a
82b8 f5        push    af
82b9 f1        pop     af
82ba 3a838a    ld      a,($8a83)
82bd 3c        inc     a
82be 32838a    ld      ($8a83),a
82c1 57        ld      d,a
82c2 3a808a    ld      a,($8a80)
82c5 ba        cp      d
82c6 d1        pop     de
82c7 d2cc82    jp      nc,$82cc
82ca e1        pop     hl
82cb c9        ret     

82cc e3        ex      (sp),hl
82cd e1        pop     hl
82ce c9        ret     

82cf e1        pop     hl
82d0 7e        ld      a,(hl)
82d1 23        inc     hl
82d2 e5        push    hl
82d3 b7        or      a
82d4 17        rla     
82d5 f5        push    af
82d6 4f        ld      c,a
82d7 0600      ld      b,$00
82d9 212183    ld      hl,$8321
82dc 09        add     hl,bc
82dd 5e        ld      e,(hl)
82de 23        inc     hl
82df 56        ld      d,(hl)
82e0 eb        ex      de,hl
82e1 22228a    ld      ($8a22),hl
82e4 211e8a    ld      hl,$8a1e
82e7 360d      ld      (hl),$0d
82e9 23        inc     hl
82ea 360a      ld      (hl),$0a
82ec 23        inc     hl
82ed 362a      ld      (hl),$2a
82ef 23        inc     hl
82f0 362a      ld      (hl),$2a
82f2 23        inc     hl
82f3 23        inc     hl
82f4 23        inc     hl
82f5 362a      ld      (hl),$2a
82f7 23        inc     hl
82f8 362a      ld      (hl),$2a
82fa 23        inc     hl
82fb 360d      ld      (hl),$0d
82fd 23        inc     hl
82fe 360a      ld      (hl),$0a
8300 211e8a    ld      hl,$8a1e
8303 060a      ld      b,$0a
8305 c5        push    bc
8306 7e        ld      a,(hl)
8307 cde883    call    $83e8
830a c1        pop     bc
830b 05        dec     b
830c 23        inc     hl
830d c20583    jp      nz,$8305
8310 3a6783    ld      a,($8367)
8313 3c        inc     a
8314 326783    ld      ($8367),a
8317 fe14      cp      $14
8319 d2d283    jp      nc,$83d2
831c f1        pop     af
831d d0        ret     nc

831e c3d283    jp      $83d2
8321 49        ld      c,c
8322 44        ld      b,h
8323 46        ld      b,(hl)
8324 304d      jr      nc,$8373
8326 50        ld      d,b
8327 49        ld      c,c
8328 52        ld      d,d
8329 46        ld      b,(hl)
832a 57        ld      d,a
832b 49        ld      c,c
832c 54        ld      d,h
832d 45        ld      b,l
832e 58        ld      e,b
832f 44        ld      b,h
8330 4f        ld      c,a
8331 4d        ld      c,l
8332 4c        ld      c,h
8333 44        ld      b,h
8334 5a        ld      e,d
8335 4c        ld      c,h
8336 47        ld      b,a
8337 53        ld      d,e
8338 51        ld      d,c
8339 49        ld      c,c
833a 42        ld      b,d
833b 54        ld      d,h
833c 4c        ld      c,h
833d 4f        ld      c,a
833e 42        ld      b,d
833f 44        ld      b,h
8340 45        ld      b,l
8341 49        ld      c,c
8342 53        ld      d,e
8343 42        ld      b,d
8344 45        ld      b,l
8345 49        ld      c,c
8346 4e        ld      c,(hl)
8347 4f        ld      c,a
8348 56        ld      d,(hl)
8349 43        ld      b,e
834a 4e        ld      c,(hl)
834b 47        ld      b,a
834c 4c        ld      c,h
834d 47        ld      b,a
834e 53        ld      d,e
834f 53        ld      d,e
8350 4e        ld      c,(hl)
8351 41        ld      b,c
8352 32494f    ld      ($4f49),a
8355 44        ld      b,h
8356 54        ld      d,h
8357 42        ld      b,d
8358 49        ld      c,c
8359 52        ld      d,d
835a 43        ld      b,e
835b 45        ld      b,l
835c 46        ld      b,(hl)
835d a8        xor     b
835e e3        ex      (sp),hl
835f a9        xor     c
8360 a0        and     b
8361 c1        pop     bc
8362 d6d4      sub     $d4
8364 c5        push    bc
8365 cb00      rlc     b
8367 00        nop     
8368 df        rst     $18
8369 fa3a00    jp      m,$003a
836c 01fec3    ld      bc,$c3fe
836f ca7883    jp      z,$8378
8372 2a0801    ld      hl,($0108)
8375 226883    ld      ($8368),hl
8378 2a0600    ld      hl,($0006)
837b 2b        dec     hl
837c f9        ld      sp,hl
837d c5        push    bc
837e 218483    ld      hl,$8384
8381 22288a    ld      ($8a28),hl
8384 c9        ret     

8385 219783    ld      hl,$8397
8388 7e        ld      a,(hl)
8389 a7        and     a
838a c8        ret     z

838b e5        push    hl
838c 5f        ld      e,a
838d 0e02      ld      c,$02
838f cd0500    call    $0005
8392 e1        pop     hl
8393 23        inc     hl
8394 c38883    jp      $8388
8397 0d        dec     c
8398 0a        ld      a,(bc)
8399 41        ld      b,c
839a 50        ld      d,b
839b 55        ld      d,l
839c 4c        ld      c,h
839d 49        ld      c,c
839e 42        ld      b,d
839f 2056      jr      nz,$83f7
83a1 65        ld      h,l
83a2 72        ld      (hl),d
83a3 73        ld      (hl),e
83a4 69        ld      l,c
83a5 6f        ld      l,a
83a6 6e        ld      l,(hl)
83a7 2031      jr      nz,$83da
83a9 2e35      ld      l,$35
83ab 33        inc     sp
83ac 4e        ld      c,(hl)
83ad 0d        dec     c
83ae 0a        ld      a,(bc)
83af 43        ld      b,e
83b0 6f        ld      l,a
83b1 70        ld      (hl),b
83b2 79        ld      a,c
83b3 72        ld      (hl),d
83b4 69        ld      l,c
83b5 67        ld      h,a
83b6 68        ld      l,b
83b7 74        ld      (hl),h
83b8 2031      jr      nz,$83eb
83ba 39        add     hl,sp
83bb 37        scf     
83bc 39        add     hl,sp
83bd 2028      jr      nz,$83e7
83bf 63        ld      h,e
83c0 29        add     hl,hl
83c1 2042      jr      nz,$8405
83c3 79        ld      a,c
83c4 2041      jr      nz,$8407
83c6 56        ld      d,(hl)
83c7 54        ld      d,h
83c8 45        ld      b,l
83c9 4b        ld      c,e
83ca 2049      jr      nz,$8415
83cc 6e        ld      l,(hl)
83cd 63        ld      h,e
83ce 2e0d      ld      l,$0d
83d0 0a        ld      a,(bc)
83d1 00        nop     
83d2 21da83    ld      hl,$83da
83d5 e5        push    hl
83d6 2a288a    ld      hl,($8a28)
83d9 e9        jp      (hl)
83da 3e0d      ld      a,$0d
83dc cde883    call    $83e8
83df 3e0a      ld      a,$0a
83e1 cde883    call    $83e8
83e4 c30000    jp      $0000
83e7 c9        ret     

83e8 c5        push    bc
83e9 d5        push    de
83ea e5        push    hl
83eb f5        push    af
83ec 0e02      ld      c,$02
83ee 5f        ld      e,a
83ef cd0500    call    $0005
83f2 f1        pop     af
83f3 e1        pop     hl
83f4 d1        pop     de
83f5 c1        pop     bc
83f6 c9        ret     

83f7 e5        push    hl
83f8 2a7e8a    ld      hl,($8a7e)
83fb 7e        ld      a,(hl)
83fc fe0a      cp      $0a
83fe cc0884    call    z,$8408
8401 23        inc     hl
8402 7e        ld      a,(hl)
8403 227e8a    ld      ($8a7e),hl
8406 e1        pop     hl
8407 c9        ret     

8408 c5        push    bc
8409 d5        push    de
840a 0e0a      ld      c,$0a
840c 112a8a    ld      de,$8a2a
840f cd0500    call    $0005
8412 212b8a    ld      hl,$8a2b
8415 5e        ld      e,(hl)
8416 1600      ld      d,$00
8418 eb        ex      de,hl
8419 19        add     hl,de
841a 23        inc     hl
841b 360d      ld      (hl),$0d
841d 23        inc     hl
841e 3e0a      ld      a,$0a
8420 cde883    call    $83e8
8423 77        ld      (hl),a
8424 eb        ex      de,hl
8425 d1        pop     de
8426 c1        pop     bc
8427 c9        ret     

8428 84        add     a,h
8429 00        nop     
842a 80        add     a,b
842b 00        nop     
842c 00        nop     
842d 00        nop     
842e 010700    ld      bc,$0007
8431 00        nop     
8432 00        nop     
8433 010000    ld      bc,$0000
8436 010000    ld      bc,$0000
8439 00        nop     
843a 00        nop     
843b 00        nop     
843c 00        nop     
843d 00        nop     
843e 00        nop     
843f 00        nop     
8440 00        nop     
8441 00        nop     
8442 00        nop     
8443 00        nop     
8444 00        nop     
8445 00        nop     
8446 3f        ccf     
8447 84        add     a,h
8448 00        nop     
8449 00        nop     
844a 00        nop     
844b 00        nop     
844c 00        nop     
844d 00        nop     
844e 00        nop     
844f 00        nop     
8450 00        nop     
8451 dd8c      adc     a,ixh
8453 af        xor     a
8454 50        ld      d,b
8455 00        nop     
8456 00        nop     
8457 00        nop     
8458 00        nop     
8459 00        nop     
845a 00        nop     
845b 00        nop     
845c 00        nop     
845d 00        nop     
845e 7f        ld      a,a
845f b9        cp      c
8460 00        nop     
8461 fc9c1a    call    m,$1a9c
8464 85        add     a,l
8465 7e        ld      a,(hl)
8466 3b        dec     sp
8467 00        nop     
8468 00        nop     
8469 00        nop     
846a 00        nop     
846b 010001    ld      bc,$0100
846e 00        nop     
846f 00        nop     
8470 00        nop     
8471 00        nop     
8472 ff        rst     $38
8473 fc9c00    call    m,$009c
8476 00        nop     
8477 00        nop     
8478 00        nop     
8479 00        nop     
847a 00        nop     
847b 00        nop     
847c 00        nop     
847d 00        nop     
847e d390      out     ($90),a
8480 1e4b      ld      e,$4b
8482 00        nop     
8483 ff        rst     $38
8484 00        nop     
8485 00        nop     
8486 00        nop     
8487 00        nop     
8488 00        nop     
8489 00        nop     
848a 00        nop     
848b 1a        ld      a,(de)
848c 85        add     a,l
848d 00        nop     
848e 00        nop     
848f 00        nop     
8490 00        nop     
8491 00        nop     
8492 00        nop     
8493 00        nop     
8494 00        nop     
8495 00        nop     
8496 d9        exx     
8497 8c        adc     a,h
8498 4c        ld      c,h
8499 8e        adc     a,(hl)
849a 00        nop     
849b 00        nop     
849c 00        nop     
849d 00        nop     
849e 00        nop     
849f 00        nop     
84a0 00        nop     
84a1 00        nop     
84a2 00        nop     
84a3 00        nop     
84a4 00        nop     
84a5 00        nop     
84a6 ff        rst     $38
84a7 00        nop     
84a8 00        nop     
84a9 00        nop     
84aa 00        nop     
84ab 00        nop     
84ac 00        nop     
84ad 00        nop     
84ae 95        sub     l
84af 8e        adc     a,(hl)
84b0 82        add     a,d
84b1 46        ld      b,(hl)
84b2 00        nop     
84b3 00        nop     
84b4 00        nop     
84b5 00        nop     
84b6 00        nop     
84b7 00        nop     
84b8 00        nop     
84b9 00        nop     
84ba 00        nop     
84bb 00        nop     
84bc 00        nop     
84bd 00        nop     
84be 00        nop     
84bf 00        nop     
84c0 00        nop     
84c1 00        nop     
84c2 00        nop     
84c3 00        nop     
84c4 00        nop     
84c5 00        nop     
84c6 00        nop     
84c7 00        nop     
84c8 d9        exx     
84c9 40        ld      b,b
84ca 00        nop     
84cb 00        nop     
84cc 00        nop     
84cd 00        nop     
84ce 00        nop     
84cf 00        nop     
84d0 00        nop     
84d1 00        nop     
84d2 00        nop     
84d3 00        nop     
84d4 00        nop     
84d5 00        nop     
84d6 00        nop     
84d7 00        nop     
84d8 98        sbc     a,b
84d9 a8        xor     b
84da cba7      res     4,a
84dc 00        nop     
84dd 00        nop     
84de 00        nop     
84df 00        nop     
84e0 00        nop     
84e1 00        nop     
84e2 00        nop     
84e3 00        nop     
84e4 00        nop     
84e5 67        ld      h,a
84e6 84        add     a,h
84e7 00        nop     
84e8 00        nop     
84e9 00        nop     
84ea 00        nop     
84eb 00        nop     
84ec 00        nop     
84ed 00        nop     
84ee 00        nop     
84ef 00        nop     
84f0 00        nop     
84f1 00        nop     
84f2 00        nop     
84f3 ff        rst     $38
84f4 00        nop     
84f5 00        nop     
84f6 00        nop     
84f7 00        nop     
84f8 00        nop     
84f9 00        nop     
84fa 00        nop     
84fb e4b9e6    call    po,$e6b9
84fe b9        cp      c
84ff 00        nop     
8500 210000    ld      hl,$0000
8503 00        nop     
8504 00        nop     
8505 00        nop     
8506 00        nop     
8507 00        nop     
8508 00        nop     
8509 00        nop     
850a 00        nop     
850b 00        nop     
850c 00        nop     
850d 00        nop     
850e 00        nop     
850f 00        nop     
8510 00        nop     
8511 00        nop     
8512 00        nop     
8513 00        nop     
8514 00        nop     
8515 00        nop     
8516 00        nop     
8517 00        nop     
8518 00        nop     
8519 00        nop     
851a 010000    ld      bc,$0000
851d 00        nop     
851e 00        nop     
851f 00        nop     
8520 00        nop     
8521 00        nop     
8522 00        nop     
8523 00        nop     
8524 00        nop     
8525 2f        cpl     
8526 84        add     a,h
8527 33        inc     sp
8528 84        add     a,h
8529 00        nop     
852a 00        nop     
852b 00        nop     
852c 00        nop     
852d ff        rst     $38
852e 00        nop     
852f 00        nop     
8530 00        nop     
8531 00        nop     
8532 00        nop     
8533 00        nop     
8534 00        nop     
8535 00        nop     
8536 00        nop     
8537 00        nop     
8538 00        nop     
8539 00        nop     
853a 00        nop     
853b 00        nop     
853c 00        nop     
853d 00        nop     
853e 00        nop     
853f 00        nop     
8540 00        nop     
8541 00        nop     
8542 00        nop     
8543 00        nop     
8544 00        nop     
8545 00        nop     
8546 00        nop     
8547 00        nop     
8548 00        nop     
8549 00        nop     
854a 00        nop     
854b 00        nop     
854c 00        nop     
854d 00        nop     
854e 00        nop     
854f 00        nop     
8550 00        nop     
8551 00        nop     
8552 00        nop     
8553 00        nop     
8554 00        nop     
8555 00        nop     
8556 00        nop     
8557 00        nop     
8558 00        nop     
8559 00        nop     
855a 00        nop     
855b 00        nop     
855c 00        nop     
855d 00        nop     
855e 00        nop     
855f 00        nop     
8560 00        nop     
8561 00        nop     
8562 00        nop     
8563 00        nop     
8564 00        nop     
8565 00        nop     
8566 00        nop     
8567 00        nop     
8568 00        nop     
8569 00        nop     
856a 00        nop     
856b 00        nop     
856c 00        nop     
856d 00        nop     
856e 00        nop     
856f 00        nop     
8570 00        nop     
8571 00        nop     
8572 00        nop     
8573 00        nop     
8574 00        nop     
8575 00        nop     
8576 00        nop     
8577 00        nop     
8578 00        nop     
8579 00        nop     
857a 00        nop     
857b 00        nop     
857c 00        nop     
857d 00        nop     
857e 00        nop     
857f 00        nop     
8580 00        nop     
8581 00        nop     
8582 00        nop     
8583 00        nop     
8584 00        nop     
8585 00        nop     
8586 00        nop     
8587 00        nop     
8588 00        nop     
8589 00        nop     
858a 00        nop     
858b 00        nop     
858c 00        nop     
858d 00        nop     
858e 00        nop     
858f 00        nop     
8590 00        nop     
8591 00        nop     
8592 00        nop     
8593 00        nop     
8594 00        nop     
8595 00        nop     
8596 00        nop     
8597 00        nop     
8598 00        nop     
8599 00        nop     
859a 00        nop     
859b 00        nop     
859c 00        nop     
859d 00        nop     
859e 00        nop     
859f 00        nop     
85a0 00        nop     
85a1 00        nop     
85a2 00        nop     
85a3 00        nop     
85a4 00        nop     
85a5 00        nop     
85a6 00        nop     
85a7 00        nop     
85a8 00        nop     
85a9 00        nop     
85aa 00        nop     
85ab 00        nop     
85ac 00        nop     
85ad 00        nop     
85ae 00        nop     
85af 00        nop     
85b0 00        nop     
85b1 98        sbc     a,b
85b2 9c        sbc     a,h
85b3 c49a00    call    nz,$009a
85b6 00        nop     
85b7 00        nop     
85b8 00        nop     
85b9 b8        cp      b
85ba 85        add     a,l
85bb b5        or      l
85bc 85        add     a,l
85bd 00        nop     
85be 00        nop     
85bf 98        sbc     a,b
85c0 9c        sbc     a,h
85c1 c49ab8    call    nz,$b89a
85c4 85        add     a,l
85c5 b5        or      l
85c6 85        add     a,l
85c7 00        nop     
85c8 00        nop     
85c9 00        nop     
85ca 04        inc     b
85cb 02        ld      (bc),a
85cc 00        nop     
85cd 00        nop     
85ce 00        nop     
85cf 00        nop     
85d0 ff        rst     $38
85d1 00        nop     
85d2 00        nop     
85d3 00        nop     
85d4 00        nop     
85d5 00        nop     
85d6 00        nop     
85d7 00        nop     
85d8 00        nop     
85d9 00        nop     
85da 00        nop     
85db 00        nop     
85dc 00        nop     
85dd 00        nop     
85de 00        nop     
85df 00        nop     
85e0 00        nop     
85e1 00        nop     
85e2 00        nop     
85e3 00        nop     
85e4 00        nop     
85e5 00        nop     
85e6 00        nop     
85e7 00        nop     
85e8 00        nop     
85e9 00        nop     
85ea 00        nop     
85eb 00        nop     
85ec 00        nop     
85ed 00        nop     
85ee 00        nop     
85ef 00        nop     
85f0 00        nop     
85f1 00        nop     
85f2 00        nop     
85f3 00        nop     
85f4 00        nop     
85f5 00        nop     
85f6 00        nop     
85f7 00        nop     
85f8 00        nop     
85f9 00        nop     
85fa 00        nop     
85fb 00        nop     
85fc 00        nop     
85fd 00        nop     
85fe 00        nop     
85ff 00        nop     
8600 00        nop     
8601 ff        rst     $38
8602 00        nop     
8603 00        nop     
8604 00        nop     
8605 00        nop     
8606 00        nop     
8607 00        nop     
8608 00        nop     
8609 b5        or      l
860a 85        add     a,l
860b b6        or      (hl)
860c 85        add     a,l
860d ff        rst     $38
860e ff        rst     $38
860f 00        nop     
8610 ca852d    jp      z,$2d85
8613 86        add     a,(hl)
8614 00        nop     
8615 00        nop     
8616 04        inc     b
8617 00        nop     
8618 02        ld      (bc),a
8619 00        nop     
861a 00        nop     
861b 00        nop     
861c 04        inc     b
861d 00        nop     
861e 00        nop     
861f 00        nop     
8620 00        nop     
8621 00        nop     
8622 00        nop     
8623 cb85      res     0,l
8625 ff        rst     $38
8626 cc8500    call    z,$0085
8629 ca85c4    jp      z,$c485
862c 9a        sbc     a,d
862d 04        inc     b
862e 00        nop     
862f 00        nop     
8630 ca851e    jp      z,$1e85
8633 43        ld      b,e
8634 cb85      res     0,l
8636 cc8500    call    z,$0085
8639 00        nop     
863a 00        nop     
863b 00        nop     
863c 00        nop     
863d 00        nop     
863e 00        nop     
863f 00        nop     
8640 00        nop     
8641 00        nop     
8642 00        nop     
8643 00        nop     
8644 00        nop     
8645 00        nop     
8646 79        ld      a,c
8647 3600      ld      (hl),$00
8649 00        nop     
864a 00        nop     
864b 00        nop     
864c 00        nop     
864d 40        ld      b,b
864e 00        nop     
864f 00        nop     
8650 00        nop     
8651 00        nop     
8652 00        nop     
8653 00        nop     
8654 00        nop     
8655 ff        rst     $38
8656 49        ld      c,c
8657 4e        ld      c,(hl)
8658 49        ld      c,c
8659 54        ld      d,h
865a 41        ld      b,c
865b 4c        ld      c,h
865c 2020      jr      nz,$867e
865e 45        ld      b,l
865f 4e        ld      c,(hl)
8660 44        ld      b,h
8661 00        nop     
8662 00        nop     
8663 00        nop     
8664 00        nop     
8665 21203e    ld      hl,$3e20
8668 00        nop     
8669 ff        rst     $38
866a 00        nop     
866b 00        nop     
866c 00        nop     
866d 00        nop     
866e 00        nop     
866f ff        rst     $38
8670 00        nop     
8671 00        nop     
8672 dd90      sub     b
8674 09        add     hl,bc
8675 00        nop     
8676 ff        rst     $38
8677 00        nop     
8678 00        nop     
8679 3280
867b 08200824  db      ^H,32,^H,'$' erase char 
867f 5e        ld      e,(hl)
8680 265c      ld      h,$5c
8682 210000    ld      hl,$0000
8685 00        nop     
8686 00        nop     
8687 00        nop     
8688 00        nop     
8689 00        nop     
868a 00        nop     
868b 00        nop     
868c 00        nop     
868d 00        nop     
868e 00        nop     
868f 00        nop     
8690 dd90      sub     b
8692 00        nop     
8693 00        nop     
8694 00        nop     
8695 00        nop     
8696 00        nop     
8697 00        nop     
8698 00        nop     
8699 00        nop     
869a 00        nop     
869b ff        rst     $38
869c 00        nop     
869d 95        sub     l
869e 8e        adc     a,(hl)
869f 00        nop     
86a0 00        nop     
86a1 00        nop     
86a2 00        nop     
86a3 00        nop     
86a4 0d        dec     c
86a5 00        nop     
86a6 00        nop     
86a7 00        nop     
86a8 00        nop     
86a9 00        nop     
86aa 00        nop     
86ab 98        sbc     a,b
86ac 92        sub     d
86ad 62        ld      h,d
86ae 8e        adc     a,(hl)
86af 00        nop     
86b0 00        nop     
86b1 00        nop     
86b2 00        nop     
86b3 00        nop     
86b4 00        nop     
86b5 00        nop     
86b6 00        nop     
86b7 00        nop     
86b8 00        nop     
86b9 00        nop     
86ba 00        nop     
86bb 00        nop     
86bc 00        nop     
86bd 00        nop     
86be ff        rst     $38
86bf 00        nop     
86c0 c7        rst     $00
86c1 aa        xor     d
86c2 67        ld      h,a
86c3 aa        xor     d
86c4 00        nop     
86c5 00        nop     
86c6 00        nop     
86c7 00        nop     
86c8 00        nop     
86c9 00        nop     
86ca 00        nop     
86cb 81        add     a,c
86cc 00        nop     
86cd 00        nop     
86ce 00        nop     
86cf 00        nop     
86d0 00        nop     
86d1 00        nop     
86d2 00        nop     
86d3 00        nop     
86d4 00        nop     
86d5 40        ld      b,b
86d6 00        nop     
86d7 00        nop     
86d8 00        nop     
86d9 00        nop     
86da 00        nop     
86db 00        nop     
86dc 00        nop     
86dd 00        nop     
86de 00        nop     
86df 00        nop     
86e0 00        nop     
86e1 1e8d      ld      e,$8d
86e3 00        nop     
86e4 00        nop     
86e5 fc8c0a    call    m,$0a8c
86e8 d7        rst     $10
86e9 23        inc     hl
86ea 7a        ld      a,d
86eb 1d        dec     e
86ec a7        and     a
86ed 68        ld      l,b
86ee 79        ld      a,c
86ef eb        ex      de,hl
86f0 51        ld      d,c
86f1 387a      jr      c,$876d
86f3 00        nop     
86f4 dd8c      adc     a,ixh
86f6 00        nop     
86f7 00        nop     
86f8 00        nop     
86f9 00        nop     
86fa 00        nop     
86fb 00        nop     
86fc 00        nop     
86fd 00        nop     
86fe 00        nop     
86ff 00        nop     
8700 00        nop     
8701 00        nop     
8702 00        nop     
8703 00        nop     
8704 00        nop     
8705 00        nop     
8706 00        nop     
8707 00        nop     
8708 00        nop     
8709 00        nop     
870a 00        nop     
870b 00        nop     
870c 00        nop     
870d 00        nop     
870e 97        sub     a
870f b8        cp      b
8710 8d        adc     a,l
8711 b8        cp      b
8712 95        sub     l
8713 b8        cp      b
8714 00        nop     
8715 00        nop     
8716 00        nop     
8717 00        nop     
8718 00        nop     
8719 ff        rst     $38
871a 05        dec     b
871b 00        nop     
871c 00        nop     
871d 00        nop     
871e 0a        ld      a,(bc)
871f 00        nop     
8720 00        nop     
8721 00        nop     
8722 00        nop     
8723 98        sbc     a,b
8724 92        sub     d
8725 98        sbc     a,b
8726 a8        xor     b
8727 9b        sbc     a,e
8728 a8        xor     b
8729 00        nop     
872a 00        nop     
872b 00        nop     
872c 00        nop     
872d 02        ld      (bc),a
872e 00        nop     
872f 0656      ld      b,$56
8731 53        ld      d,e
8732 7c        ld      a,h
8733 7c        ld      a,h
8734 7c        ld      a,h
8735 7c        ld      a,h
8736 56        ld      d,(hl)
8737 45        ld      b,l
8738 52        ld      d,d
8739 53        ld      d,e
873a 55        ld      d,l
873b 53        ld      d,e
873c 00        nop     
873d 00        nop     
873e 00        nop     
873f 00        nop     
8740 00        nop     
8741 00        nop     
8742 00        nop     
8743 00        nop     
8744 00        nop     
8745 00        nop     
8746 ff        rst     $38
8747 9a        sbc     a,d
8748 92        sub     d
8749 00        nop     
874a 00        nop     
874b 00        nop     
874c 00        nop     
874d 00        nop     
874e 00        nop     
874f 00        nop     
8750 00        nop     
8751 00        nop     
8752 00        nop     
8753 00        nop     
8754 00        nop     
8755 00        nop     
8756 00        nop     
8757 00        nop     
8758 00        nop     
8759 208e      jr      nz,$86e9
875b 3f        ccf     
875c b2        or      d
875d 4c        ld      c,h
875e 8e        adc     a,(hl)
875f 00        nop     
8760 00        nop     
8761 23        inc     hl
8762 00        nop     
8763 00        nop     
8764 00        nop     
8765 02        ld      (bc),a
8766 00        nop     
8767 00        nop     
8768 00        nop     
8769 92        sub     d
876a 00        nop     
876b d9        exx     
876c 8c        adc     a,h
876d 00        nop     
876e 00        nop     
876f 00        nop     
8770 00        nop     
8771 00        nop     
8772 00        nop     
8773 00        nop     
8774 00        nop     
8775 00        nop     
8776 00        nop     
8777 00        nop     
8778 00        nop     
8779 00        nop     
877a 00        nop     
877b 00        nop     
877c 00        nop     
877d 00        nop     
877e 00        nop     
877f 00        nop     
8780 00        nop     
8781 00        nop     
8782 00        nop     
8783 00        nop     
8784 00        nop     
8785 00        nop     
8786 00        nop     
8787 00        nop     
8788 00        nop     
8789 00        nop     
878a 00        nop     
878b 00        nop     
878c 00        nop     
878d 23        inc     hl
878e 00        nop     
878f 00        nop     
8790 00        nop     
8791 00        nop     
8792 00        nop     
8793 00        nop     
8794 00        nop     
8795 00        nop     
8796 00        nop     
8797 00        nop     
8798 54        ld      d,h
8799 46        ld      b,(hl)
879a 00        nop     
879b 00        nop     
879c 00        nop     
879d 00        nop     
879e 00        nop     
879f 00        nop     
87a0 00        nop     
87a1 00        nop     
87a2 00        nop     
87a3 00        nop     
87a4 00        nop     
87a5 00        nop     
87a6 2020      jr      nz,$87c8
87a8 2024      jr      nz,$87ce
87aa 00        nop     
87ab 00        nop     
87ac 00        nop     
87ad 00        nop     
87ae 00        nop     
87af 00        nop     
87b0 00        nop     
87b1 00        nop     
87b2 00        nop     
87b3 00        nop     
87b4 00        nop     
87b5 00        nop     
87b6 00        nop     
87b7 00        nop     
87b8 00        nop     
87b9 00        nop     
87ba 00        nop     
87bb 5c        ld      e,h
87bc a8        xor     b
87bd 98        sbc     a,b
87be a8        xor     b
87bf 00        nop     
87c0 00        nop     
87c1 00        nop     
87c2 00        nop     
87c3 00        nop     
87c4 ff        rst     $38
87c5 00        nop     
87c6 00        nop     
87c7 00        nop     
87c8 00        nop     
87c9 00        nop     
87ca 00        nop     
87cb 00        nop     
87cc 00        nop     
87cd 00        nop     
87ce 00        nop     
87cf 00        nop     
87d0 00        nop     
87d1 2e00      ld      l,$00
87d3 00        nop     
87d4 ff        rst     $38
87d5 00        nop     
87d6 00        nop     
87d7 00        nop     
87d8 00        nop     
87d9 00        nop     
87da 00        nop     
87db 00        nop     
87dc 73        ld      (hl),e
87dd 90        sub     b
87de 00        nop     
87df 00        nop     
87e0 00        nop     
87e1 00        nop     
87e2 00        nop     
87e3 00        nop     
87e4 00        nop     
87e5 52        ld      d,d
87e6 43        ld      b,e
87e7 00        nop     
87e8 00        nop     
87e9 00        nop     
87ea 00        nop     
87eb ff        rst     $38
87ec 00        nop     
87ed 00        nop     
87ee 00        nop     
87ef 00        nop     
87f0 00        nop     
87f1 00        nop     
87f2 00        nop     
87f3 e687      and     $87
87f5 00        nop     
87f6 00        nop     
87f7 00        nop     
87f8 00        nop     
87f9 010000    ld      bc,$0000
87fc 00        nop     
87fd 82        add     a,d
87fe 00        nop     
87ff 00        nop     
8800 73        ld      (hl),e
8801 90        sub     b
8802 c7        rst     $00
8803 90        sub     b
8804 00        nop     
8805 00        nop     
8806 32005c    ld      ($5c00),a
8809 205f      jr      nz,$886a
880b 7c        ld      a,h
880c 3d        dec     a
880d 5b        ld      e,e
880e 2b        dec     hl
880f 2d        dec     l
8810 2a2f28    ld      hl,($282f)
8813 29        add     hl,hl
8814 ff        rst     $38
8815 5d        ld      e,l
8816 00        nop     
8817 00        nop     
8818 00        nop     
8819 ff        rst     $38
881a 00        nop     
881b 00        nop     
881c 74        ld      (hl),h
881d 90        sub     b
881e 00        nop     
881f 00        nop     
8820 00        nop     
8821 00        nop     
8822 00        nop     
8823 00        nop     
8824 00        nop     
8825 60        ld      h,b
8826 3000      jr      nc,$8828
8828 8e        adc     a,(hl)
8829 ff        rst     $38
882a 3005      jr      nc,$8831
882c 0605      ld      b,$05
882e 302e      jr      nc,$885e
8830 3020      jr      nc,$8852
8832 39        add     hl,sp
8833 45        ld      b,l
8834 00        nop     
8835 00        nop     
8836 05        dec     b
8837 00        nop     
8838 00        nop     
8839 8e        adc     a,(hl)
883a ff        rst     $38
883b 3036      jr      nc,$8873
883d 88        adc     a,b
883e 00        nop     
883f 04        inc     b
8840 31ff00    ld      sp,$00ff
8843 60        ld      h,b
8844 3093      jr      nc,$87d9
8846 5b        ld      e,e
8847 00        nop     
8848 8e        adc     a,(hl)
8849 ff        rst     $38
884a 3036      jr      nc,$8882
884c 88        adc     a,b
884d 0b        dec     bc
884e 00        nop     
884f 00        nop     
8850 00        nop     
8851 00        nop     
8852 00        nop     
8853 00        nop     
8854 2084      jr      nz,$87da
8856 2d        dec     l
8857 ff        rst     $38
8858 00        nop     
8859 40        ld      b,b
885a 1c        inc     e
885b 8e        adc     a,(hl)
885c 00        nop     
885d 50        ld      d,b
885e 43        ld      b,e
885f 91        sub     c
8860 17        rla     
8861 b7        or      a
8862 51        ld      d,c
8863 72        ld      (hl),d
8864 00        nop     
8865 2e45      ld      l,$45
8867 2a0000    ld      hl,($0000)
886a 00        nop     
886b 00        nop     
886c 00        nop     
886d 00        nop     
886e 00        nop     
886f 00        nop     
8870 00        nop     
8871 ff        rst     $38
8872 3000      jr      nc,$8874
8874 00        nop     
8875 3000      jr      nc,$8877
8877 00        nop     
8878 00        nop     
8879 00        nop     
887a 00        nop     
887b 00        nop     
887c 00        nop     
887d 00        nop     
887e 00        nop     
887f ff        rst     $38
8880 3075      jr      nc,$88f7
8882 88        adc     a,b
8883 00        nop     
8884 03        inc     bc
8885 310000    ld      sp,$0000
8888 00        nop     
8889 00        nop     
888a 00        nop     
888b 00        nop     
888c 00        nop     
888d 00        nop     
888e 00        nop     
888f fa8774    jp      m,$7487
8892 90        sub     b
8893 f9        ld      sp,hl
8894 87        add     a,a
8895 00        nop     
8896 00        nop     
8897 00        nop     
8898 00        nop     
8899 00        nop     
889a 00        nop     
889b 00        nop     
889c 00        nop     
889d 00        nop     
889e 00        nop     
889f 00        nop     
88a0 00        nop     
88a1 00        nop     
88a2 00        nop     
88a3 00        nop     
88a4 00        nop     
88a5 74        ld      (hl),h
88a6 90        sub     b
88a7 2b        dec     hl
88a8 2d        dec     l
88a9 0d        dec     c
88aa 45        ld      b,l
88ab 00        nop     
88ac 00        nop     
88ad ff        rst     $38
88ae 00        nop     
88af 74        ld      (hl),h
88b0 90        sub     b
88b1 00        nop     
88b2 200d      jr      nz,$88c1
88b4 2e30      ld      l,$30
88b6 39        add     hl,sp
88b7 cccc4c    call    z,$4ccc
88ba 7d        ld      a,l
88bb cccc4c    call    z,$4ccc
88be 7d        ld      a,l
88bf 00        nop     
88c0 00        nop     
88c1 00        nop     
88c2 00        nop     
88c3 d5        push    de
88c4 90        sub     b
88c5 74        ld      (hl),h
88c6 86        add     a,(hl)
88c7 0a        ld      a,(bc)
88c8 ff        rst     $38
88c9 dd90      sub     b
88cb 00        nop     
88cc f0        ret     p

88cd 91        sub     c
88ce 00        nop     
88cf 02        ld      (bc),a
88d0 00        nop     
88d1 ff        rst     $38
88d2 ff        rst     $38
88d3 00        nop     
88d4 00        nop     
88d5 00        nop     
88d6 00        nop     
88d7 00        nop     
88d8 00        nop     
88d9 00        nop     
88da 00        nop     
88db 00        nop     
88dc 00        nop     
88dd 00        nop     
88de 0602      ld      b,$02
88e0 0600      ld      b,$00
88e2 e5        push    hl
88e3 af        xor     a
88e4 00        nop     
88e5 00        nop     
88e6 17        rla     
88e7 301b      jr      nc,$8904
88e9 3000      jr      nc,$88eb
88eb 00        nop     
88ec 00        nop     
88ed 00        nop     
88ee 00        nop     
88ef 00        nop     
88f0 17        rla     
88f1 301b      jr      nc,$890e
88f3 3000      jr      nc,$88f5
88f5 fe2f      cp      $2f
88f7 02        ld      (bc),a
88f8 3000      jr      nc,$88fa
88fa 00        nop     
88fb 00        nop     
88fc 00        nop     
88fd 00        nop     
88fe 00        nop     
88ff 00        nop     
8900 00        nop     
8901 00        nop     
8902 00        nop     
8903 00        nop     
8904 00        nop     
8905 00        nop     
8906 00        nop     
8907 00        nop     
8908 ff        rst     $38
8909 3003      jr      nc,$890e
890b 00        nop     
890c 00        nop     
890d ff        rst     $38
890e 300a      jr      nc,$891a
8910 89        adc     a,c
8911 ff        rst     $38
8912 00        nop     
8913 ff        rst     $38
8914 300a      jr      nc,$8920
8916 89        adc     a,c
8917 49        ld      c,c
8918 1c        inc     e
8919 ce29      adc     a,$29
891b 7c        ld      a,h
891c cefc      adc     a,$fc
891e 228003    ld      ($0380),hl
8921 00        nop     
8922 ff        rst     $38
8923 00        nop     
8924 eb        ex      de,hl
8925 86        add     a,(hl)
8926 ef        rst     $28
8927 86        add     a,(hl)
8928 e7        rst     $20
8929 86        add     a,(hl)
892a 00        nop     
892b 17        rla     
892c 301b      jr      nc,$8949
892e 3000      jr      nc,$8930
8930 00        nop     
8931 00        nop     
8932 ff        rst     $38
8933 00        nop     
8934 00        nop     
8935 00        nop     
8936 0100ff    ld      bc,$ff00
8939 00        nop     
893a 00        nop     
893b 00        nop     
893c 00        nop     
893d 00        nop     
893e 00        nop     
893f 00        nop     
8940 00        nop     
8941 00        nop     
8942 00        nop     
8943 00        nop     
8944 00        nop     
8945 00        nop     
8946 00        nop     
8947 00        nop     
8948 0100ff    ld      bc,$ff00
894b 17        rla     
894c b7        or      a
894d 51        ld      d,c
894e 73        ld      (hl),e
894f 00        nop     
8950 00        nop     
8951 00        nop     
8952 00        nop     
8953 00        nop     
8954 00        nop     
8955 00        nop     
8956 00        nop     
8957 00        nop     
8958 0100ff    ld      bc,$ff00
895b 00        nop     
895c 00        nop     
895d 00        nop     
895e 00        nop     
895f 00        nop     
8960 00        nop     
8961 00        nop     
8962 00        nop     
8963 00        nop     
8964 00        nop     
8965 00        nop     
8966 00        nop     
8967 00        nop     
8968 00        nop     
8969 00        nop     
896a 00        nop     
896b 00        nop     
896c 00        nop     
896d 00        nop     
896e 5a        ld      e,d
896f 8c        adc     a,h
8970 5e        ld      e,(hl)
8971 8c        adc     a,h
8972 00        nop     
8973 00        nop     
8974 00        nop     
8975 00        nop     
8976 00        nop     
8977 00        nop     
8978 00        nop     
8979 00        nop     
897a 00        nop     
897b 00        nop     
897c 00        nop     
897d 00        nop     
897e 00        nop     
897f 00        nop     
8980 00        nop     
8981 00        nop     
8982 00        nop     
8983 00        nop     
8984 00        nop     
8985 00        nop     
8986 00        nop     
8987 00        nop     
8988 00        nop     
8989 00        nop     
898a 00        nop     
898b 00        nop     
898c 00        nop     
898d 00        nop     
898e 00        nop     
898f 00        nop     
8990 00        nop     
8991 00        nop     
8992 00        nop     
8993 00        nop     
8994 00        nop     
8995 00        nop     
8996 00        nop     
8997 00        nop     
8998 00        nop     
8999 00        nop     
899a 00        nop     
899b 00        nop     
899c 00        nop     
899d 00        nop     
899e 00        nop     
899f 00        nop     
89a0 00        nop     
89a1 00        nop     
89a2 00        nop     
89a3 52        ld      d,d
89a4 8c        adc     a,h
89a5 56        ld      d,(hl)
89a6 8c        adc     a,h
89a7 00        nop     
89a8 010200    ld      bc,$0002
89ab 00        nop     
89ac 00        nop     
89ad 80        add     a,b
89ae 24        inc     h
89af 03        inc     bc
89b0 cb05      rlc     l
89b2 00        nop     
89b3 00        nop     
89b4 e3        ex      (sp),hl
89b5 70        ld      (hl),b
89b6 00        nop     
89b7 3a00ff    ld      a,($ff00)
89ba 97        sub     a
89bb 8c        adc     a,h
89bc 25        dec     h
89bd fa0000    jp      m,$0000
89c0 00        nop     
89c1 02        ld      (bc),a
89c2 00        nop     
89c3 02        ld      (bc),a
89c4 00        nop     
89c5 00        nop     
89c6 00        nop     
89c7 00        nop     
89c8 45        ld      b,l
89c9 58        ld      e,b
89ca 54        ld      d,h
89cb 4d        ld      c,l
89cc 45        ld      b,l
89cd 4d        ld      c,l
89ce 00        nop     
89cf 2044      jr      nz,$8a15
89d1 41        ld      b,c
89d2 54        ld      d,h
89d3 00        nop     
89d4 00        nop     
89d5 00        nop     
89d6 00        nop     
89d7 ff        rst     $38
89d8 00        nop     
89d9 00        nop     
89da 00        nop     
89db 00        nop     
89dc 00        nop     
89dd 00        nop     
89de 00        nop     
89df 00        nop     
89e0 00        nop     
89e1 f0        ret     p

89e2 91        sub     c
89e3 18b9      jr      $899e
89e5 7b        ld      a,e
89e6 ac        xor     h
89e7 00        nop     
89e8 29        add     hl,hl
89e9 00        nop     
89ea 00        nop     
89eb 00        nop     
89ec 00        nop     
89ed 00        nop     
89ee 00        nop     
89ef 00        nop     
89f0 00        nop     
89f1 00        nop     
89f2 00        nop     
89f3 00        nop     
89f4 78        ld      a,b
89f5 73        ld      (hl),e
89f6 7c        ld      a,h
89f7 73        ld      (hl),e
89f8 00        nop     
89f9 00        nop     
89fa 00        nop     
89fb 00        nop     
89fc 00        nop     
89fd 00        nop     
89fe 00        nop     
89ff 00        nop     
8a00 00        nop     
8a01 00        nop     
8a02 00        nop     
8a03 00        nop     
8a04 00        nop     
8a05 ff        rst     $38
8a06 00        nop     
8a07 00        nop     
8a08 ff        rst     $38
8a09 00        nop     
8a0a 00        nop     
8a0b 00        nop     
8a0c 00        nop     
8a0d ff        rst     $38
8a0e 00        nop     
8a0f 00        nop     
8a10 00        nop     
8a11 00        nop     
8a12 00        nop     
8a13 00        nop     
8a14 9f        sbc     a,a
8a15 8c        adc     a,h
8a16 18b9      jr      $89d1
8a18 7b        ld      a,e
8a19 ac        xor     h
8a1a 00        nop     
8a1b 00        nop     
8a1c 00        nop     
8a1d ff        rst     $38
8a1e 00        nop     
8a1f 00        nop     
8a20 00        nop     
8a21 00        nop     
8a22 00        nop     
8a23 00        nop     
8a24 00        nop     
8a25 00        nop     
8a26 00        nop     
8a27 00        nop     
8a28 fd6f      ld      iyl,a
8a2a 50        ld      d,b
8a2b 00        nop     
8a2c 0a        ld      a,(bc)
8a2d 00        nop     
8a2e 00        nop     
8a2f 00        nop     
8a30 00        nop     
8a31 00        nop     
8a32 00        nop     
8a33 00        nop     
8a34 00        nop     
8a35 00        nop     
8a36 00        nop     
8a37 00        nop     
8a38 00        nop     
8a39 00        nop     
8a3a 00        nop     
8a3b 00        nop     
8a3c 00        nop     
8a3d 00        nop     
8a3e 00        nop     
8a3f 00        nop     
8a40 00        nop     
8a41 00        nop     
8a42 00        nop     
8a43 00        nop     
8a44 00        nop     
8a45 00        nop     
8a46 00        nop     
8a47 00        nop     
8a48 00        nop     
8a49 00        nop     
8a4a 00        nop     
8a4b 00        nop     
8a4c 00        nop     
8a4d 00        nop     
8a4e 00        nop     
8a4f 00        nop     
8a50 00        nop     
8a51 00        nop     
8a52 00        nop     
8a53 00        nop     
8a54 00        nop     
8a55 00        nop     
8a56 00        nop     
8a57 00        nop     
8a58 00        nop     
8a59 00        nop     
8a5a 00        nop     
8a5b 00        nop     
8a5c 00        nop     
8a5d 00        nop     
8a5e 00        nop     
8a5f 00        nop     
8a60 00        nop     
8a61 00        nop     
8a62 00        nop     
8a63 00        nop     
8a64 00        nop     
8a65 00        nop     
8a66 00        nop     
8a67 00        nop     
8a68 00        nop     
8a69 00        nop     
8a6a 00        nop     
8a6b 00        nop     
8a6c 00        nop     
8a6d 00        nop     
8a6e 00        nop     
8a6f 00        nop     
8a70 00        nop     
8a71 00        nop     
8a72 00        nop     
8a73 00        nop     
8a74 00        nop     
8a75 00        nop     
8a76 00        nop     
8a77 00        nop     
8a78 00        nop     
8a79 00        nop     
8a7a 00        nop     
8a7b 00        nop     
8a7c 00        nop     
8a7d 00        nop     
8a7e 2c        inc     l
8a7f 8a        adc     a,d
8a80 02        ld      (bc),a
8a81 40        ld      b,b
8a82 83        add     a,e
8a83 03        inc     bc
8a84 00        nop     
8a85 00        nop     
8a86 00        nop     
8a87 00        nop     
8a88 00        nop     
8a89 00        nop     
8a8a 00        nop     
8a8b 00        nop     
8a8c 00        nop     
8a8d 00        nop     
8a8e 00        nop     
8a8f 00        nop     
8a90 00        nop     
8a91 00        nop     
8a92 00        nop     
8a93 00        nop     
8a94 00        nop     
8a95 00        nop     
8a96 00        nop     
8a97 00        nop     
8a98 00        nop     
8a99 00        nop     
8a9a 00        nop     
8a9b 00        nop     
8a9c 00        nop     
8a9d 00        nop     
8a9e 00        nop     
8a9f 00        nop     
8aa0 00        nop     
8aa1 00        nop     
8aa2 00        nop     
8aa3 00        nop     
8aa4 00        nop     
8aa5 00        nop     
8aa6 00        nop     
8aa7 00        nop     
8aa8 00        nop     
8aa9 00        nop     
8aaa 00        nop     
8aab 00        nop     
8aac 00        nop     
8aad 00        nop     
8aae 00        nop     
8aaf 00        nop     
8ab0 00        nop     
8ab1 00        nop     
8ab2 00        nop     
8ab3 00        nop     
8ab4 00        nop     
8ab5 00        nop     
8ab6 00        nop     
8ab7 00        nop     
8ab8 00        nop     
8ab9 00        nop     
8aba 00        nop     
8abb 00        nop     
8abc 00        nop     
8abd 00        nop     
8abe 00        nop     
8abf 00        nop     
8ac0 00        nop     
8ac1 00        nop     
8ac2 00        nop     
8ac3 00        nop     
8ac4 00        nop     
8ac5 00        nop     
8ac6 e3        ex      (sp),hl
8ac7 96        sub     (hl)
8ac8 81        add     a,c
8ac9 00        nop     
8aca 00        nop     
8acb 00        nop     
8acc 00        nop     
8acd 00        nop     
8ace 00        nop     
8acf 00        nop     
8ad0 00        nop     
8ad1 00        nop     
8ad2 2653      ld      h,$53
8ad4 95        sub     l
8ad5 a6        and     (hl)
8ad6 00        nop     
8ad7 00        nop     
8ad8 00        nop     
8ad9 00        nop     
8ada 00        nop     
8adb 00        nop     
8adc 00        nop     
8add 00        nop     
8ade 00        nop     
8adf 00        nop     
8ae0 00        nop     
8ae1 00        nop     
8ae2 00        nop     
8ae3 00        nop     
8ae4 00        nop     
8ae5 00        nop     
8ae6 00        nop     
8ae7 00        nop     
8ae8 80        add     a,b
8ae9 00        nop     
8aea 00        nop     
8aeb 00        nop     
8aec 00        nop     
8aed 80        add     a,b
8aee 00        nop     
8aef 00        nop     
8af0 00        nop     
8af1 00        nop     
8af2 00        nop     
8af3 00        nop     
8af4 00        nop     
8af5 00        nop     
8af6 00        nop     
8af7 00        nop     
8af8 00        nop     
8af9 00        nop     
8afa 00        nop     
8afb 00        nop     
8afc 00        nop     
8afd 00        nop     
8afe 00        nop     
8aff 00        nop     
8b00 00        nop     
8b01 00        nop     
8b02 00        nop     
8b03 00        nop     
8b04 00        nop     
8b05 00        nop     
8b06 00        nop     
8b07 00        nop     
8b08 00        nop     
8b09 00        nop     
8b0a 00        nop     
8b0b 00        nop     
8b0c 00        nop     
8b0d 00        nop     
8b0e 00        nop     
8b0f 00        nop     
8b10 00        nop     
8b11 00        nop     
8b12 00        nop     
8b13 00        nop     
8b14 00        nop     
8b15 00        nop     
8b16 00        nop     
8b17 00        nop     
8b18 00        nop     
8b19 00        nop     
8b1a 00        nop     
8b1b 00        nop     
8b1c 00        nop     
8b1d 00        nop     
8b1e 00        nop     
8b1f 00        nop     
8b20 00        nop     
8b21 00        nop     
8b22 00        nop     
8b23 00        nop     
8b24 00        nop     
8b25 00        nop     
8b26 00        nop     
8b27 00        nop     
8b28 00        nop     
8b29 00        nop     
8b2a 00        nop     
8b2b 00        nop     
8b2c 00        nop     
8b2d 00        nop     
8b2e 00        nop     
8b2f 00        nop     
8b30 00        nop     
8b31 00        nop     
8b32 00        nop     
8b33 00        nop     
8b34 00        nop     
8b35 00        nop     
8b36 00        nop     
8b37 00        nop     
8b38 00        nop     
8b39 00        nop     
8b3a 00        nop     
8b3b 00        nop     
8b3c 00        nop     
8b3d 00        nop     
8b3e 00        nop     
8b3f 00        nop     
8b40 00        nop     
8b41 00        nop     
8b42 00        nop     
8b43 00        nop     
8b44 00        nop     
8b45 00        nop     
8b46 00        nop     
8b47 00        nop     
8b48 00        nop     
8b49 00        nop     
8b4a 00        nop     
8b4b 00        nop     
8b4c 00        nop     
8b4d 00        nop     
8b4e 00        nop     
8b4f 00        nop     
8b50 00        nop     
8b51 00        nop     
8b52 00        nop     
8b53 00        nop     
8b54 00        nop     
8b55 00        nop     
8b56 00        nop     
8b57 00        nop     
8b58 00        nop     
8b59 00        nop     
8b5a 00        nop     
8b5b 00        nop     
8b5c 00        nop     
8b5d 00        nop     
8b5e 00        nop     
8b5f 00        nop     
8b60 00        nop     
8b61 00        nop     
8b62 00        nop     
8b63 00        nop     
8b64 00        nop     
8b65 00        nop     
8b66 00        nop     
8b67 00        nop     
8b68 00        nop     
8b69 00        nop     
8b6a 00        nop     
8b6b 00        nop     
8b6c 00        nop     
8b6d 00        nop     
8b6e 00        nop     
8b6f 00        nop     
8b70 00        nop     
8b71 00        nop     
8b72 00        nop     
8b73 00        nop     
8b74 00        nop     
8b75 00        nop     
8b76 00        nop     
8b77 00        nop     
8b78 00        nop     
8b79 00        nop     
8b7a 00        nop     
8b7b 00        nop     
8b7c 00        nop     
8b7d 00        nop     
8b7e 00        nop     
8b7f 00        nop     
8b80 00        nop     
8b81 00        nop     
8b82 00        nop     
8b83 00        nop     
8b84 00        nop     
8b85 00        nop     
8b86 00        nop     
8b87 00        nop     
8b88 00        nop     
8b89 00        nop     
8b8a 00        nop     
8b8b 00        nop     
8b8c 00        nop     
8b8d 00        nop     
8b8e 00        nop     
8b8f 00        nop     
8b90 00        nop     
8b91 00        nop     
8b92 00        nop     
8b93 00        nop     
8b94 00        nop     
8b95 00        nop     
8b96 00        nop     
8b97 00        nop     
8b98 00        nop     
8b99 00        nop     
8b9a 00        nop     
8b9b 00        nop     
8b9c 00        nop     
8b9d 00        nop     
8b9e 00        nop     
8b9f 00        nop     
8ba0 00        nop     
8ba1 00        nop     
8ba2 00        nop     
8ba3 00        nop     
8ba4 00        nop     
8ba5 01080a    ld      bc,$0a08
8ba8 d7        rst     $10
8ba9 23        inc     hl
8baa 79        ld      a,c
8bab 01fe00    ld      bc,$00fe
8bae 00        nop     
8baf 04        inc     b
8bb0 fb        ei      
8bb1 00        nop     
8bb2 00        nop     
8bb3 04        inc     b
8bb4 fe01      cp      $01
8bb6 fe01      cp      $01
8bb8 fc0000    call    m,$0000
8bbb 03        inc     bc
8bbc fe00      cp      $00
8bbe 00        nop     
8bbf 01f800    ld      bc,$00f8
8bc2 00        nop     
8bc3 01fe07    ld      bc,$07fe
8bc6 f9        ld      sp,hl
8bc7 00        nop     
8bc8 00        nop     
8bc9 00        nop     
8bca 00        nop     
8bcb 0f        rrca    
8bcc 010005    ld      bc,$0500
8bcf 80        add     a,b
8bd0 e9        jp      (hl)
8bd1 1f        rra     
8bd2 83        add     a,e
8bd3 00        nop     
8bd4 00        nop     
8bd5 00        nop     
8bd6 00        nop     
8bd7 00        nop     
8bd8 00        nop     
8bd9 00        nop     
8bda 81        add     a,c
8bdb 00        nop     
8bdc 00        nop     
8bdd 00        nop     
8bde 00        nop     
8bdf cc223e    call    z,$3e22
8be2 80        add     a,b
8be3 00        nop     
8be4 00        nop     
8be5 00        nop     
8be6 00        nop     
8be7 00        nop     
8be8 00        nop     
8be9 00        nop     
8bea 81        add     a,c
8beb 00        nop     
8bec 00        nop     
8bed 00        nop     
8bee 00        nop     
8bef 00        nop     
8bf0 00        nop     
8bf1 00        nop     
8bf2 81        add     a,c
8bf3 02        ld      (bc),a
8bf4 dd1f      rra     
8bf6 7d        ld      a,l
8bf7 00        nop     
8bf8 00        nop     
8bf9 00        nop     
8bfa 81        add     a,c
8bfb 3d        dec     a
8bfc 82        add     a,d
8bfd 46        ld      b,(hl)
8bfe 7e        ld      a,(hl)
8bff 02        ld      (bc),a
8c00 79        ld      a,c
8c01 70        ld      (hl),b
8c02 80        add     a,b
8c03 00        nop     
8c04 80        add     a,b
8c05 bb        cp      e
8c06 8a        adc     a,d
8c07 00        nop     
8c08 1876      jr      $8c80
8c0a 8e        adc     a,(hl)
8c0b 00        nop     
8c0c 00        nop     
8c0d 00        nop     
8c0e 80        add     a,b
8c0f 00        nop     
8c10 00        nop     
8c11 3083      jr      nc,$8b96
8c13 00        nop     
8c14 00        nop     
8c15 00        nop     
8c16 00        nop     
8c17 00        nop     
8c18 f0        ret     p

8c19 208e      jr      nz,$8ba9
8c1b 00        nop     
8c1c 00        nop     
8c1d 00        nop     
8c1e 00        nop     
8c1f 00        nop     
8c20 f0        ret     p

8c21 208e      jr      nz,$8bb1
8c23 02        ld      (bc),a
8c24 dd1f      rra     
8c26 7d        ld      a,l
8c27 00        nop     
8c28 00        nop     
8c29 00        nop     
8c2a 81        add     a,c
8c2b a5        and     l
8c2c 6f        ld      l,a
8c2d 13        inc     de
8c2e 7e        ld      a,(hl)
8c2f 7f        ld      a,a
8c30 9a        sbc     a,d
8c31 328000    ld      ($0080),a
8c34 00        nop     
8c35 00        nop     
8c36 81        add     a,c
8c37 cc223e    call    z,$3e22
8c3a 80        add     a,b
8c3b 3c        inc     a
8c3c 28e2      jr      z,$8c20
8c3e 1d        dec     e
8c3f 00        nop     
8c40 00        nop     
8c41 08        ex      af,af'
8c42 87        add     a,a
8c43 00        nop     
8c44 00        nop     
8c45 68        ld      l,b
8c46 87        add     a,a
8c47 44        ld      b,h
8c48 00        nop     
8c49 74        ld      (hl),h
8c4a 00        nop     
8c4b 67        ld      h,a
8c4c 00        nop     
8c4d 00        nop     
8c4e 010000    ld      bc,$0000
8c51 00        nop     
8c52 03        inc     bc
8c53 dd1f      rra     
8c55 7d        ld      a,l
8c56 a7        and     a
8c57 6f        ld      l,a
8c58 13        inc     de
8c59 7e        ld      a,(hl)
8c5a 03        inc     bc
8c5b dd1f      rra     
8c5d 7d        ld      a,l
8c5e a7        and     a
8c5f 6f        ld      l,a
8c60 13        inc     de
8c61 7e        ld      a,(hl)
8c62 ff        rst     $38
8c63 00        nop     
8c64 00        nop     
8c65 00        nop     
8c66 00        nop     
8c67 82        add     a,d
8c68 00        nop     
8c69 00        nop     
8c6a 010202    ld      bc,$0202
8c6d 01ff00    ld      bc,$00ff
8c70 ff        rst     $38
8c71 00        nop     
8c72 00        nop     
8c73 02        ld      (bc),a
8c74 fa0000    jp      m,$0000
8c77 00        nop     
8c78 00        nop     
8c79 00        nop     
8c7a 00        nop     
8c7b 00        nop     
8c7c 00        nop     
8c7d 00        nop     
8c7e 00        nop     
8c7f 00        nop     
8c80 00        nop     
8c81 00        nop     
8c82 05        dec     b
8c83 00        nop     
8c84 00        nop     
8c85 df        rst     $18
8c86 faff00    jp      m,$00ff
8c89 00        nop     
8c8a 00        nop     
8c8b ff        rst     $38
8c8c ff        rst     $38
8c8d 00        nop     
8c8e ff        rst     $38
8c8f 25        dec     h
8c90 fa0000    jp      m,$0000
8c93 00        nop     
8c94 00        nop     
8c95 00        nop     
8c96 00        nop     
8c97 31bf6b    ld      sp,$6bbf
8c9a eb        ex      de,hl
8c9b 00        nop     
8c9c 00        nop     
8c9d 77        ld      (hl),a
8c9e be        cp      (hl)
8c9f 00        nop     
8ca0 47        ld      b,a
8ca1 52        ld      d,d
8ca2 41        ld      b,c
8ca3 46        ld      b,(hl)
8ca4 54        ld      d,h
8ca5 4c        ld      c,h
8ca6 4b        ld      c,e
8ca7 3024      jr      nc,$8ccd
8ca9 24        inc     h
8caa 24        inc     h
8cab 00        nop     
8cac 00        nop     
8cad 00        nop     
8cae 00        nop     
8caf 00        nop     
8cb0 00        nop     
8cb1 00        nop     
8cb2 00        nop     
8cb3 00        nop     
8cb4 00        nop     
8cb5 00        nop     
8cb6 00        nop     
8cb7 00        nop     
8cb8 00        nop     
8cb9 00        nop     
8cba 00        nop     
8cbb 00        nop     
8cbc 00        nop     
8cbd 00        nop     
8cbe 00        nop     
8cbf 00        nop     
8cc0 57        ld      d,a
8cc1 00        nop     
8cc2 00        nop     
8cc3 58        ld      e,b
8cc4 00        nop     
8cc5 54        ld      d,h
8cc6 05        dec     b
8cc7 00        nop     
8cc8 cb2f      sra     a
8cca 00        nop     
8ccb 00        nop     
8ccc 00        nop     
8ccd 00        nop     
8cce 3f        ccf     
8ccf 05        dec     b
8cd0 2b        dec     hl
8cd1 00        nop     
8cd2 00        nop     
8cd3 2c        inc     l
8cd4 58        ld      e,b
8cd5 00        nop     
8cd6 6b        ld      l,e
8cd7 bf        cp      a
8cd8 0f        rrca    
8cd9 010004    ld      bc,$0400
8cdc 00        nop     
8cdd 02        ld      (bc),a
8cde 00        nop     
8cdf 010000    ld      bc,$0000
8ce2 00        nop     
8ce3 2a0200    ld      hl,($0002)
8ce6 1001      djnz    $8ce9
8ce8 00        nop     
8ce9 00        nop     
8cea ff        rst     $38
8ceb 00        nop     
8cec 00        nop     
8ced 00        nop     
8cee 00        nop     
8cef ff        rst     $38
8cf0 00        nop     
8cf1 00        nop     
8cf2 00        nop     
8cf3 00        nop     
8cf4 00        nop     
8cf5 00        nop     
8cf6 48        ld      c,b
8cf7 87        add     a,a
8cf8 4c        ld      c,h
8cf9 a6        and     (hl)
8cfa 2a8000    ld      hl,($0080)
8cfd 00        nop     
8cfe 00        nop     
8cff 81        add     a,c
8d00 02        ld      (bc),a
8d01 00        nop     
8d02 0a        ld      a,(bc)
8d03 d7        rst     $10
8d04 23        inc     hl
8d05 7a        ld      a,d
8d06 00        nop     
8d07 00        nop     
8d08 00        nop     
8d09 81        add     a,c
8d0a 8f        adc     a,a
8d0b c23580    jp      nz,$8035
8d0e 00        nop     
8d0f 00        nop     
8d10 40        ld      b,b
8d11 80        add     a,b
8d12 00        nop     
8d13 00        nop     
8d14 40        ld      b,b
8d15 81        add     a,c
8d16 00        nop     
8d17 00        nop     
8d18 00        nop     
8d19 81        add     a,c
8d1a 33        inc     sp
8d1b 33        inc     sp
8d1c 33        inc     sp
8d1d 81        add     a,c
8d1e 00        nop     
8d1f 00        nop     
8d20 00        nop     
8d21 81        add     a,c
8d22 00        nop     
8d23 00        nop     
8d24 00        nop     
8d25 82        add     a,d
8d26 00        nop     
8d27 00        nop     
8d28 00        nop     
8d29 81        add     a,c
8d2a 00        nop     
8d2b 00        nop     
8d2c 00        nop     
8d2d 00        nop     
8d2e 010001    ld      bc,$0100
8d31 00        nop     
8d32 010001    ld      bc,$0100
8d35 00        nop     
8d36 010000    ld      bc,$0000
8d39 00        nop     
8d3a 0100ff    ld      bc,$ff00
8d3d 00        nop     
8d3e 00        nop     
8d3f 04        inc     b
8d40 00        nop     
8d41 c30f00    jp      $000f
8d44 05        dec     b
8d45 00        nop     
8d46 00        nop     
8d47 00        nop     
8d48 00        nop     
8d49 00        nop     
8d4a 00        nop     
8d4b 00        nop     
8d4c 00        nop     
8d4d 00        nop     
8d4e 00        nop     
8d4f 04        inc     b
8d50 00        nop     
8d51 00        nop     
8d52 00        nop     
8d53 00        nop     
8d54 0600      ld      b,$00
8d56 00        nop     
8d57 00        nop     
8d58 00        nop     
8d59 00        nop     
8d5a ff        rst     $38
8d5b ff        rst     $38
8d5c 00        nop     
8d5d 00        nop     
8d5e 05        dec     b
8d5f 00        nop     
8d60 02        ld      (bc),a
8d61 00        nop     
8d62 00        nop     
8d63 00        nop     
8d64 00        nop     
8d65 00        nop     
8d66 010005    ld      bc,$0500
8d69 00        nop     
8d6a 010002    ld      bc,$0200
8d6d 00        nop     
8d6e 24        inc     h
8d6f 00        nop     
8d70 1b        dec     de
8d71 00        nop     
8d72 00        nop     
8d73 ff        rst     $38
8d74 ff        rst     $38
8d75 00        nop     
8d76 b7        or      a
8d77 43        ld      b,e
8d78 ba        cp      d
8d79 b8        cp      b
8d7a 010005    ld      bc,$0500
8d7d 00        nop     
8d7e 00        nop     
8d7f 00        nop     
8d80 00        nop     
8d81 00        nop     
8d82 00        nop     
8d83 00        nop     
8d84 00        nop     
8d85 00        nop     
8d86 00        nop     
8d87 00        nop     
8d88 45        ld      b,l
8d89 00        nop     
8d8a 00        nop     
8d8b 00        nop     
8d8c 00        nop     
8d8d 00        nop     
8d8e 00        nop     
8d8f 00        nop     
8d90 00        nop     
8d91 00        nop     
8d92 00        nop     
8d93 00        nop     
8d94 00        nop     
8d95 00        nop     
8d96 00        nop     
8d97 00        nop     
8d98 00        nop     
8d99 00        nop     
8d9a 00        nop     
8d9b 00        nop     
8d9c 010000    ld      bc,$0000
8d9f 00        nop     
8da0 00        nop     
8da1 08        ex      af,af'
8da2 0e0b      ld      c,$0b
8da4 00        nop     
8da5 00        nop     
8da6 00        nop     
8da7 00        nop     
8da8 00        nop     
8da9 00        nop     
8daa 00        nop     
8dab 00        nop     
8dac 12        ld      (de),a
8dad 00        nop     
8dae 6e        ld      l,(hl)
8daf 6e        ld      l,(hl)
8db0 00        nop     
8db1 00        nop     
8db2 00        nop     
8db3 00        nop     
8db4 00        nop     
8db5 00        nop     
8db6 00        nop     
8db7 00        nop     
8db8 c4c3c1    call    nz,$c1c3
8dbb c22000    jp      nz,$0020
8dbe 00        nop     
8dbf 00        nop     
8dc0 02        ld      (bc),a
8dc1 00        nop     
8dc2 00        nop     
8dc3 00        nop     
8dc4 00        nop     
8dc5 05        dec     b
8dc6 00        nop     
8dc7 00        nop     
8dc8 02        ld      (bc),a
8dc9 00        nop     
8dca 2800      jr      z,$8dcc
8dcc 00        nop     
8dcd 05        dec     b
8dce 00        nop     
8dcf 00        nop     
8dd0 02        ld      (bc),a
8dd1 00        nop     
8dd2 50        ld      d,b
8dd3 00        nop     
8dd4 00        nop     
8dd5 05        dec     b
8dd6 00        nop     
8dd7 00        nop     
8dd8 02        ld      (bc),a
8dd9 00        nop     
8dda 78        ld      a,b
8ddb 00        nop     
8ddc 00        nop     
8ddd 05        dec     b
8dde 00        nop     
8ddf 00        nop     
8de0 0100a0    ld      bc,$a000
8de3 00        nop     
8de4 00        nop     
8de5 05        dec     b
8de6 00        nop     
8de7 00        nop     
8de8 51        ld      d,c
8de9 00        nop     
8dea 55        ld      d,l
8deb 010005    ld      bc,$0500
8dee 00        nop     
8def 00        nop     
8df0 51        ld      d,c
8df1 00        nop     
8df2 04        inc     b
8df3 010005    ld      bc,$0500
8df6 00        nop     
8df7 00        nop     
8df8 51        ld      d,c
8df9 00        nop     
8dfa a6        and     (hl)
8dfb 010005    ld      bc,$0500
8dfe 00        nop     
8dff 00        nop     
8e00 05        dec     b
8e01 00        nop     
8e02 00        nop     
8e03 00        nop     
8e04 00        nop     
8e05 00        nop     
8e06 00        nop     
8e07 00        nop     
8e08 15        dec     d
8e09 00        nop     
8e0a f7        rst     $30
8e0b 010005    ld      bc,$0500
8e0e 00        nop     
8e0f 00        nop     
8e10 05        dec     b
8e11 00        nop     
8e12 00        nop     
8e13 00        nop     
8e14 00        nop     
8e15 00        nop     
8e16 00        nop     
8e17 00        nop     
8e18 15        dec     d
8e19 00        nop     
8e1a eb        ex      de,hl
8e1b 04        inc     b
8e1c 00        nop     
8e1d 05        dec     b
8e1e 00        nop     
8e1f 00        nop     
8e20 50        ld      d,b
8e21 00        nop     
8e22 83        add     a,e
8e23 09        add     hl,bc
8e24 00        nop     
8e25 05        dec     b
8e26 00        nop     
8e27 00        nop     
8e28 04        inc     b
8e29 00        nop     
8e2a 8b        adc     a,e
8e2b 1000      djnz    $8e2d
8e2d 05        dec     b
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
8e39 60        ld      h,b
8e3a 6a        ld      l,d
8e3b 8e        adc     a,(hl)
8e3c 00        nop     
8e3d 00        nop     
8e3e 00        nop     
8e3f 81        add     a,c
8e40 00        nop     
8e41 00        nop     
8e42 2083      jr      nz,$8dc7
8e44 0a        ld      a,(bc)
8e45 00        nop     
8e46 04        inc     b
8e47 00        nop     
8e48 010001    ld      bc,$0100
8e4b 00        nop     
8e4c 14        inc     d
8e4d 00        nop     
8e4e 51        ld      d,c
8e4f 00        nop     
8e50 15        dec     d
8e51 00        nop     
8e52 8f        adc     a,a
8e53 c2757c    jp      nz,$7c75
8e56 8f        adc     a,a
8e57 c2757a    jp      nz,$7a75
8e5a a5        and     l
8e5b 9b        sbc     a,e
8e5c 44        ld      b,h
8e5d 77        ld      (hl),a
8e5e 8f        adc     a,a
8e5f c2757c    jp      nz,$7c75
8e62 02        ld      (bc),a
8e63 00        nop     
8e64 010000    ld      bc,$0000
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
8e71 ff        rst     $38
8e72 00        nop     
8e73 00        nop     
8e74 00        nop     
8e75 00        nop     
8e76 00        nop     
8e77 ff        rst     $38
8e78 00        nop     
8e79 ff        rst     $38
8e7a 00        nop     
8e7b ff        rst     $38
8e7c ff        rst     $38
8e7d ff        rst     $38
8e7e ff        rst     $38
8e7f ff        rst     $38
8e80 ff        rst     $38
8e81 ff        rst     $38
8e82 00        nop     
8e83 ff        rst     $38
8e84 ff        rst     $38
8e85 ff        rst     $38
8e86 ff        rst     $38
8e87 ff        rst     $38
8e88 ff        rst     $38
8e89 00        nop     
8e8a 00        nop     
8e8b ff        rst     $38
8e8c ff        rst     $38
8e8d 010030    ld      bc,$3000
8e90 75        ld      (hl),l
8e91 010030    ld      bc,$3000
8e94 75        ld      (hl),l
8e95 02        ld      (bc),a
8e96 00        nop     
8e97 05        dec     b
8e98 ff        rst     $38
8e99 00        nop     
8e9a 00        nop     
8e9b 00        nop     
8e9c 00        nop     
8e9d 00        nop     
8e9e 04        inc     b
8e9f 00        nop     
8ea0 b4        or      h
8ea1 00        nop     
8ea2 00        nop     
8ea3 05        dec     b
8ea4 00        nop     
8ea5 00        nop     
8ea6 00        nop     
8ea7 00        nop     
8ea8 00        nop     
8ea9 00        nop     
8eaa 00        nop     
8eab 00        nop     
8eac 00        nop     
8ead 010003    ld      bc,$0300
8eb0 00        nop     
8eb1 60        ld      h,b
8eb2 04        inc     b
8eb3 6c        ld      l,h
8eb4 7f        ld      a,a
8eb5 02        ld      (bc),a
8eb6 dd1f      rra     
8eb8 7d        ld      a,l
8eb9 eb        ex      de,hl
8eba 51        ld      d,c
8ebb 387d      jr      c,$8f3a
8ebd 00        nop     
8ebe 00        nop     
8ebf 2083      jr      nz,$8e44
8ec1 00        nop     
8ec2 00        nop     
8ec3 00        nop     
8ec4 81        add     a,c
8ec5 00        nop     
8ec6 00        nop     
8ec7 70        ld      (hl),b
8ec8 84        add     a,h
8ec9 02        ld      (bc),a
8eca 00        nop     
8ecb 02        ld      (bc),a
8ecc 32064e    ld      ($4e06),a
8ecf 55        ld      d,l
8ed0 4d        ld      c,l
8ed1 52        ld      d,d
8ed2 4f        ld      c,a
8ed3 57        ld      d,a
8ed4 4e        ld      c,(hl)
8ed5 55        ld      d,l
8ed6 4d        ld      c,l
8ed7 43        ld      b,e
8ed8 4f        ld      c,a
8ed9 4c        ld      c,h
8eda 00        nop     
8edb 00        nop     
8edc 00        nop     
8edd 00        nop     
8ede 00        nop     
8edf 00        nop     
8ee0 00        nop     
8ee1 00        nop     
8ee2 00        nop     
8ee3 00        nop     
8ee4 00        nop     
8ee5 00        nop     
8ee6 00        nop     
8ee7 00        nop     
8ee8 00        nop     
8ee9 00        nop     
8eea 00        nop     
8eeb 00        nop     
8eec 00        nop     
8eed 00        nop     
8eee 00        nop     
8eef 00        nop     
8ef0 00        nop     
8ef1 00        nop     
8ef2 00        nop     
8ef3 00        nop     
8ef4 00        nop     
8ef5 00        nop     
8ef6 00        nop     
8ef7 00        nop     
8ef8 00        nop     
8ef9 00        nop     
8efa 00        nop     
8efb 00        nop     
8efc 00        nop     
8efd 00        nop     
8efe 00        nop     
8eff 00        nop     
8f00 00        nop     
8f01 00        nop     
8f02 00        nop     
8f03 00        nop     
8f04 00        nop     
8f05 00        nop     
8f06 00        nop     
8f07 00        nop     
8f08 00        nop     
8f09 00        nop     
8f0a 00        nop     
8f0b 00        nop     
8f0c 00        nop     
8f0d 00        nop     
8f0e 00        nop     
8f0f 00        nop     
8f10 00        nop     
8f11 00        nop     
8f12 00        nop     
8f13 00        nop     
8f14 00        nop     
8f15 00        nop     
8f16 00        nop     
8f17 00        nop     
8f18 00        nop     
8f19 00        nop     
8f1a 00        nop     
8f1b 00        nop     
8f1c 00        nop     
8f1d 00        nop     
8f1e 00        nop     
8f1f 00        nop     
8f20 00        nop     
8f21 00        nop     
8f22 00        nop     
8f23 00        nop     
8f24 00        nop     
8f25 00        nop     
8f26 00        nop     
8f27 00        nop     
8f28 00        nop     
8f29 00        nop     
8f2a 00        nop     
8f2b 00        nop     
8f2c 00        nop     
8f2d 00        nop     
8f2e 00        nop     
8f2f 00        nop     
8f30 00        nop     
8f31 00        nop     
8f32 00        nop     
8f33 00        nop     
8f34 00        nop     
8f35 00        nop     
8f36 00        nop     
8f37 00        nop     
8f38 00        nop     
8f39 00        nop     
8f3a 00        nop     
8f3b 00        nop     
8f3c 00        nop     
8f3d 00        nop     
8f3e 00        nop     
8f3f 00        nop     
8f40 00        nop     
8f41 00        nop     
8f42 00        nop     
8f43 00        nop     
8f44 00        nop     
8f45 00        nop     
8f46 00        nop     
8f47 00        nop     
8f48 00        nop     
8f49 00        nop     
8f4a 00        nop     
8f4b 00        nop     
8f4c 00        nop     
8f4d 00        nop     
8f4e 00        nop     
8f4f 00        nop     
8f50 00        nop     
8f51 00        nop     
8f52 00        nop     
8f53 00        nop     
8f54 00        nop     
8f55 00        nop     
8f56 00        nop     
8f57 00        nop     
8f58 00        nop     
8f59 00        nop     
8f5a 00        nop     
8f5b 00        nop     
8f5c 00        nop     
8f5d 00        nop     
8f5e 00        nop     
8f5f 00        nop     
8f60 00        nop     
8f61 00        nop     
8f62 00        nop     
8f63 00        nop     
8f64 00        nop     
8f65 00        nop     
8f66 00        nop     
8f67 00        nop     
8f68 00        nop     
8f69 00        nop     
8f6a 00        nop     
8f6b 00        nop     
8f6c 00        nop     
8f6d 00        nop     
8f6e 00        nop     
8f6f 00        nop     
8f70 00        nop     
8f71 00        nop     
8f72 00        nop     
8f73 00        nop     
8f74 00        nop     
8f75 00        nop     
8f76 00        nop     
8f77 00        nop     
8f78 00        nop     
8f79 00        nop     
8f7a 00        nop     
8f7b 00        nop     
8f7c 00        nop     
8f7d 00        nop     
8f7e 00        nop     
8f7f 00        nop     
8f80 00        nop     
8f81 00        nop     
8f82 00        nop     
8f83 00        nop     
8f84 00        nop     
8f85 00        nop     
8f86 00        nop     
8f87 00        nop     
8f88 00        nop     
8f89 00        nop     
8f8a 00        nop     
8f8b 00        nop     
8f8c 00        nop     
8f8d 00        nop     
8f8e 00        nop     
8f8f 00        nop     
8f90 00        nop     
8f91 00        nop     
8f92 00        nop     
8f93 00        nop     
8f94 00        nop     
8f95 00        nop     
8f96 00        nop     
8f97 00        nop     
8f98 00        nop     
8f99 00        nop     
8f9a 00        nop     
8f9b 00        nop     
8f9c 00        nop     
8f9d 00        nop     
8f9e 00        nop     
8f9f 00        nop     
8fa0 00        nop     
8fa1 00        nop     
8fa2 00        nop     
8fa3 00        nop     
8fa4 00        nop     
8fa5 00        nop     
8fa6 00        nop     
8fa7 00        nop     
8fa8 00        nop     
8fa9 00        nop     
8faa 00        nop     
8fab 00        nop     
8fac 00        nop     
8fad 00        nop     
8fae 00        nop     
8faf 00        nop     
8fb0 00        nop     
8fb1 00        nop     
8fb2 00        nop     
8fb3 00        nop     
8fb4 00        nop     
8fb5 00        nop     
8fb6 00        nop     
8fb7 00        nop     
8fb8 00        nop     
8fb9 00        nop     
8fba 00        nop     
8fbb 00        nop     
8fbc 00        nop     
8fbd 00        nop     
8fbe 00        nop     
8fbf 00        nop     
8fc0 00        nop     
8fc1 00        nop     
8fc2 00        nop     
8fc3 00        nop     
8fc4 00        nop     
8fc5 00        nop     
8fc6 00        nop     
8fc7 00        nop     
8fc8 00        nop     
8fc9 00        nop     
8fca 00        nop     
8fcb 00        nop     
8fcc 00        nop     
8fcd 00        nop     
8fce 00        nop     
8fcf 00        nop     
8fd0 00        nop     
8fd1 00        nop     
8fd2 00        nop     
8fd3 00        nop     
8fd4 00        nop     
8fd5 00        nop     
8fd6 00        nop     
8fd7 00        nop     
8fd8 00        nop     
8fd9 00        nop     
8fda 00        nop     
8fdb 00        nop     
8fdc 00        nop     
8fdd 00        nop     
8fde 00        nop     
8fdf 00        nop     
8fe0 00        nop     
8fe1 00        nop     
8fe2 00        nop     
8fe3 00        nop     
8fe4 00        nop     
8fe5 00        nop     
8fe6 00        nop     
8fe7 00        nop     
8fe8 00        nop     
8fe9 00        nop     
8fea 00        nop     
8feb 00        nop     
8fec 00        nop     
8fed 00        nop     
8fee 00        nop     
8fef 00        nop     
8ff0 00        nop     
8ff1 00        nop     
8ff2 00        nop     
8ff3 00        nop     
8ff4 00        nop     
8ff5 00        nop     
8ff6 00        nop     
8ff7 00        nop     
8ff8 00        nop     
8ff9 00        nop     
8ffa 02        ld      (bc),a
8ffb 02        ld      (bc),a
8ffc 00        nop     
8ffd 00        nop     
8ffe 00        nop     
8fff 00        nop     
9000 00        nop     
9001 00        nop     
9002 00        nop     
9003 00        nop     
9004 00        nop     
9005 00        nop     
9006 00        nop     
9007 00        nop     
9008 00        nop     
9009 00        nop     
900a 00        nop     
900b 00        nop     
900c 00        nop     
900d 00        nop     
900e 00        nop     
900f 00        nop     
9010 00        nop     
9011 00        nop     
9012 00        nop     
9013 00        nop     
9014 00        nop     
9015 00        nop     
9016 00        nop     
9017 00        nop     
9018 00        nop     
9019 00        nop     
901a 00        nop     
901b 00        nop     
901c 00        nop     
901d 00        nop     
901e 00        nop     
901f 00        nop     
9020 00        nop     
9021 00        nop     
9022 00        nop     
9023 00        nop     
9024 00        nop     
9025 00        nop     
9026 00        nop     
9027 00        nop     
9028 00        nop     
9029 00        nop     
902a 00        nop     
902b 00        nop     
902c 010200    ld      bc,$0002
902f 00        nop     
9030 00        nop     
9031 00        nop     
9032 00        nop     
9033 00        nop     
9034 00        nop     
9035 00        nop     
9036 00        nop     
9037 00        nop     
9038 00        nop     
9039 00        nop     
903a 00        nop     
903b 00        nop     
903c 00        nop     
903d 00        nop     
903e 00        nop     
903f 00        nop     
9040 00        nop     
9041 00        nop     
9042 00        nop     
9043 00        nop     
9044 00        nop     
9045 00        nop     
9046 00        nop     
9047 00        nop     
9048 00        nop     
9049 00        nop     
904a 00        nop     
904b 00        nop     
904c 00        nop     
904d 00        nop     
904e 00        nop     
904f 00        nop     
9050 00        nop     
9051 00        nop     
9052 00        nop     
9053 00        nop     
9054 00        nop     
9055 00        nop     
9056 00        nop     
9057 00        nop     
9058 00        nop     
9059 00        nop     
905a 00        nop     
905b 00        nop     
905c 00        nop     
905d 00        nop     
905e ff        rst     $38
905f 00        nop     
9060 00        nop     
9061 ff        rst     $38
9062 ff        rst     $38
9063 50        ld      d,b
9064 010800    ld      bc,$0008
9067 43        ld      b,e
9068 00        nop     
9069 00        nop     
906a 2c        inc     l
906b 00        nop     
906c 24        inc     h
906d 2c        inc     l
906e 25        dec     h
906f 00        nop     
9070 00        nop     
9071 02        ld      (bc),a
9072 00        nop     
9073 47        ld      b,a
9074 52        ld      d,d
9075 4f        ld      c,a
9076 53        ld      d,e
9077 53        ld      d,e
9078 2057      jr      nz,$90d1
907a 45        ld      b,l
907b 49        ld      c,c
907c 47        ld      b,a
907d 48        ld      c,b
907e 54        ld      d,h
907f 00        nop     
9080 00        nop     
9081 00        nop     
9082 00        nop     
9083 00        nop     
9084 00        nop     
9085 00        nop     
9086 00        nop     
9087 00        nop     
9088 00        nop     
9089 00        nop     
908a 00        nop     
908b 00        nop     
908c 00        nop     
908d 00        nop     
908e 00        nop     
908f 00        nop     
9090 00        nop     
9091 00        nop     
9092 00        nop     
9093 00        nop     
9094 00        nop     
9095 00        nop     
9096 00        nop     
9097 00        nop     
9098 00        nop     
9099 00        nop     
909a 00        nop     
909b 00        nop     
909c 00        nop     
909d 00        nop     
909e 00        nop     
909f 00        nop     
90a0 00        nop     
90a1 00        nop     
90a2 00        nop     
90a3 00        nop     
90a4 00        nop     
90a5 00        nop     
90a6 00        nop     
90a7 00        nop     
90a8 00        nop     
90a9 00        nop     
90aa 00        nop     
90ab 00        nop     
90ac 00        nop     
90ad 00        nop     
90ae 00        nop     
90af 00        nop     
90b0 00        nop     
90b1 00        nop     
90b2 00        nop     
90b3 00        nop     
90b4 00        nop     
90b5 00        nop     
90b6 00        nop     
90b7 00        nop     
90b8 00        nop     
90b9 00        nop     
90ba 00        nop     
90bb 00        nop     
90bc 00        nop     
90bd 00        nop     
90be 00        nop     
90bf 00        nop     
90c0 00        nop     
90c1 00        nop     
90c2 00        nop     
90c3 00        nop     
90c4 00        nop     
90c5 00        nop     
90c6 00        nop     
90c7 02        ld      (bc),a
90c8 00        nop     
90c9 00        nop     
90ca 00        nop     
90cb 00        nop     
90cc 0a        ld      a,(bc)
90cd 00        nop     
90ce 42        ld      b,d
90cf 0100ff    ld      bc,$ff00
90d2 00        nop     
90d3 09        add     hl,bc
90d4 00        nop     
90d5 42        ld      b,d
90d6 41        ld      b,c
90d7 52        ld      d,d
90d8 2043      jr      nz,$911d
90da 312043    ld      sp,$4320
90dd 326175    ld      ($7561),a
90e0 73        ld      (hl),e
90e1 65        ld      h,l
90e2 45        ld      b,l
90e3 4e        ld      c,(hl)
90e4 45        ld      b,l
90e5 52        ld      d,d
90e6 41        ld      b,c
90e7 4c        ld      c,h
90e8 5f        ld      e,a
90e9 53        ld      d,e
90ea 54        ld      d,h
90eb 4f        ld      c,a
90ec 52        ld      d,d
90ed 45        ld      b,l
90ee 53        ld      d,e
90ef 2053      jr      nz,$9144
90f1 50        ld      d,b
90f2 45        ld      b,l
90f3 43        ld      b,e
90f4 49        ld      c,c
90f5 41        ld      b,c
90f6 4c        ld      c,h
90f7 54        ld      d,h
90f8 59        ld      e,c
90f9 5f        ld      e,a
90fa 53        ld      d,e
90fb 54        ld      d,h
90fc 4f        ld      c,a
90fd 52        ld      d,d
90fe 45        ld      b,l
90ff 53        ld      d,e
9100 00        nop     
9101 00        nop     
9102 00        nop     
9103 00        nop     
9104 00        nop     
9105 00        nop     
9106 00        nop     
9107 00        nop     
9108 00        nop     
9109 00        nop     
910a 00        nop     
910b 00        nop     
910c 00        nop     
910d 00        nop     
910e 00        nop     
910f 00        nop     
9110 00        nop     
9111 00        nop     
9112 00        nop     
9113 00        nop     
9114 00        nop     
9115 00        nop     
9116 00        nop     
9117 00        nop     
9118 00        nop     
9119 00        nop     
911a 00        nop     
911b 00        nop     
911c 00        nop     
911d 00        nop     
911e 00        nop     
911f 00        nop     
9120 00        nop     
9121 00        nop     
9122 00        nop     
9123 00        nop     
9124 00        nop     
9125 00        nop     
9126 00        nop     
9127 00        nop     
9128 00        nop     
9129 00        nop     
912a 00        nop     
912b 00        nop     
912c 00        nop     
912d 00        nop     
912e 00        nop     
912f 00        nop     
9130 00        nop     
9131 00        nop     
9132 00        nop     
9133 00        nop     
9134 00        nop     
9135 00        nop     
9136 00        nop     
9137 00        nop     
9138 00        nop     
9139 00        nop     
913a 00        nop     
913b 00        nop     
913c 00        nop     
913d 00        nop     
913e 00        nop     
913f 00        nop     
9140 00        nop     
9141 00        nop     
9142 00        nop     
9143 00        nop     
9144 00        nop     
9145 00        nop     
9146 00        nop     
9147 00        nop     
9148 00        nop     
9149 00        nop     
914a 00        nop     
914b 00        nop     
914c 00        nop     
914d 00        nop     
914e 00        nop     
914f 00        nop     
9150 00        nop     
9151 00        nop     
9152 00        nop     
9153 00        nop     
9154 00        nop     
9155 00        nop     
9156 00        nop     
9157 00        nop     
9158 00        nop     
9159 00        nop     
915a 00        nop     
915b 00        nop     
915c 00        nop     
915d 00        nop     
915e 00        nop     
915f 00        nop     
9160 00        nop     
9161 00        nop     
9162 00        nop     
9163 00        nop     
9164 00        nop     
9165 00        nop     
9166 00        nop     
9167 00        nop     
9168 00        nop     
9169 00        nop     
916a 00        nop     
916b 00        nop     
916c 00        nop     
916d 00        nop     
916e 00        nop     
916f 00        nop     
9170 00        nop     
9171 00        nop     
9172 00        nop     
9173 00        nop     
9174 00        nop     
9175 00        nop     
9176 00        nop     
9177 00        nop     
9178 00        nop     
9179 00        nop     
917a 00        nop     
917b 00        nop     
917c 00        nop     
917d 00        nop     
917e 00        nop     
917f 00        nop     
9180 00        nop     
9181 00        nop     
9182 00        nop     
9183 00        nop     
9184 00        nop     
9185 00        nop     
9186 00        nop     
9187 00        nop     
9188 00        nop     
9189 00        nop     
918a 00        nop     
918b 00        nop     
918c 00        nop     
918d 00        nop     
918e 00        nop     
918f 00        nop     
9190 00        nop     
9191 00        nop     
9192 00        nop     
9193 00        nop     
9194 00        nop     
9195 00        nop     
9196 00        nop     
9197 00        nop     
9198 00        nop     
9199 00        nop     
919a 00        nop     
919b 00        nop     
919c 00        nop     
919d 00        nop     
919e 00        nop     
919f 00        nop     
91a0 00        nop     
91a1 00        nop     
91a2 00        nop     
91a3 00        nop     
91a4 00        nop     
91a5 00        nop     
91a6 00        nop     
91a7 00        nop     
91a8 00        nop     
91a9 00        nop     
91aa 00        nop     
91ab 00        nop     
91ac 00        nop     
91ad 00        nop     
91ae 00        nop     
91af 00        nop     
91b0 00        nop     
91b1 00        nop     
91b2 00        nop     
91b3 00        nop     
91b4 00        nop     
91b5 00        nop     
91b6 00        nop     
91b7 00        nop     
91b8 00        nop     
91b9 00        nop     
91ba 00        nop     
91bb 00        nop     
91bc 00        nop     
91bd 00        nop     
91be 00        nop     
91bf 00        nop     
91c0 00        nop     
91c1 00        nop     
91c2 00        nop     
91c3 00        nop     
91c4 00        nop     
91c5 00        nop     
91c6 00        nop     
91c7 00        nop     
91c8 00        nop     
91c9 00        nop     
91ca 00        nop     
91cb 00        nop     
91cc 00        nop     
91cd 00        nop     
91ce 00        nop     
91cf 00        nop     
91d0 00        nop     
91d1 00        nop     
91d2 00        nop     
91d3 00        nop     
91d4 00        nop     
91d5 00        nop     
91d6 09        add     hl,bc
91d7 060a      ld      b,$0a
91d9 00        nop     
91da 00        nop     
91db 00        nop     
91dc 7f        ld      a,a
91dd 180d      jr      $91ec
91df c4c3c1    call    nz,$c1c3
91e2 c22a1b    jp      nz,$1b2a
91e5 07        rlca    
91e6 0f        rrca    
91e7 14        inc     d
91e8 00        nop     
91e9 00        nop     
91ea 00        nop     
91eb 00        nop     
91ec ff        rst     $38
91ed ff        rst     $38
91ee 59        ld      e,c
91ef 4e        ld      c,(hl)
91f0 53        ld      d,e
91f1 50        ld      d,b
91f2 45        ld      b,l
91f3 43        ld      b,e
91f4 49        ld      c,c
91f5 41        ld      b,c
91f6 4c        ld      c,h
91f7 54        ld      d,h
91f8 59        ld      e,c
91f9 2053      jr      nz,$924e
91fb 54        ld      d,h
91fc 4f        ld      c,a
91fd 52        ld      d,d
91fe 45        ld      b,l
91ff 53        ld      d,e
9200 00        nop     
9201 53        ld      d,e
9202 54        ld      d,h
9203 49        ld      c,c
9204 43        ld      b,e
9205 53        ld      d,e
9206 00        nop     
9207 00        nop     
9208 00        nop     
9209 00        nop     
920a 00        nop     
920b 00        nop     
920c 00        nop     
920d 00        nop     
920e 00        nop     
920f 00        nop     
9210 00        nop     
9211 00        nop     
9212 00        nop     
9213 00        nop     
9214 00        nop     
9215 00        nop     
9216 00        nop     
9217 00        nop     
9218 00        nop     
9219 00        nop     
921a 00        nop     
921b 00        nop     
921c 00        nop     
921d 00        nop     
921e 00        nop     
921f 00        nop     
9220 00        nop     
9221 00        nop     
9222 00        nop     
9223 00        nop     
9224 00        nop     
9225 00        nop     
9226 00        nop     
9227 00        nop     
9228 00        nop     
9229 00        nop     
922a 00        nop     
922b 00        nop     
922c 00        nop     
922d 00        nop     
922e 00        nop     
922f 00        nop     
9230 00        nop     
9231 00        nop     
9232 00        nop     
9233 00        nop     
9234 00        nop     
9235 00        nop     
9236 00        nop     
9237 00        nop     
9238 00        nop     
9239 00        nop     
923a 00        nop     
923b 00        nop     
923c 00        nop     
923d 00        nop     
923e 00        nop     
923f 00        nop     
9240 00        nop     
9241 00        nop     
9242 00        nop     
9243 00        nop     
9244 00        nop     
9245 00        nop     
9246 00        nop     
9247 00        nop     
9248 00        nop     
9249 00        nop     
924a 00        nop     
924b 00        nop     
924c 00        nop     
924d 00        nop     
924e 00        nop     
924f 00        nop     
9250 00        nop     
9251 00        nop     
9252 00        nop     
9253 00        nop     
9254 00        nop     
9255 00        nop     
9256 00        nop     
9257 00        nop     
9258 00        nop     
9259 00        nop     
925a 00        nop     
925b 00        nop     
925c 00        nop     
925d 00        nop     
925e 00        nop     
925f 00        nop     
9260 00        nop     
9261 00        nop     
9262 00        nop     
9263 00        nop     
9264 00        nop     
9265 00        nop     
9266 00        nop     
9267 00        nop     
9268 00        nop     
9269 00        nop     
926a 00        nop     
926b 00        nop     
926c 00        nop     
926d 00        nop     
926e 00        nop     
926f 00        nop     
9270 00        nop     
9271 00        nop     
9272 00        nop     
9273 00        nop     
9274 00        nop     
9275 00        nop     
9276 00        nop     
9277 00        nop     
9278 00        nop     
9279 00        nop     
927a 00        nop     
927b 00        nop     
927c 00        nop     
927d 00        nop     
927e 00        nop     
927f 00        nop     
9280 00        nop     
9281 00        nop     
9282 00        nop     
9283 00        nop     
9284 00        nop     
9285 00        nop     
9286 00        nop     
9287 00        nop     
9288 00        nop     
9289 00        nop     
928a 00        nop     
928b 00        nop     
928c 00        nop     
928d 00        nop     
928e 00        nop     
928f 00        nop     
9290 00        nop     
9291 00        nop     
9292 00        nop     
9293 00        nop     
9294 00        nop     
9295 00        nop     
9296 00        nop     
9297 00        nop     
9298 010002    ld      bc,$0200
929b 00        nop     
929c 00        nop     
929d 00        nop     
929e 00        nop     
929f 00        nop     
92a0 00        nop     
92a1 00        nop     
92a2 00        nop     
92a3 00        nop     
92a4 00        nop     
92a5 00        nop     
92a6 00        nop     
92a7 00        nop     
92a8 00        nop     
92a9 00        nop     
92aa 00        nop     
92ab 00        nop     
92ac 00        nop     
92ad 00        nop     
92ae 00        nop     
92af 00        nop     
92b0 00        nop     
92b1 00        nop     
92b2 00        nop     
92b3 00        nop     
92b4 00        nop     
92b5 00        nop     
92b6 00        nop     
92b7 00        nop     
92b8 00        nop     
92b9 00        nop     
92ba 00        nop     
92bb 00        nop     
92bc 00        nop     
92bd 00        nop     
92be 00        nop     
92bf 00        nop     
92c0 00        nop     
92c1 00        nop     
92c2 00        nop     
92c3 00        nop     
92c4 00        nop     
92c5 00        nop     
92c6 00        nop     
92c7 00        nop     
92c8 00        nop     
92c9 00        nop     
92ca 00        nop     
92cb 00        nop     
92cc 00        nop     
92cd 00        nop     
92ce 00        nop     
92cf 00        nop     
92d0 00        nop     
92d1 00        nop     
92d2 00        nop     
92d3 00        nop     
92d4 00        nop     
92d5 00        nop     
92d6 00        nop     
92d7 00        nop     
92d8 00        nop     
92d9 00        nop     
92da 00        nop     
92db 00        nop     
92dc 00        nop     
92dd 00        nop     
92de 00        nop     
92df 00        nop     
92e0 00        nop     
92e1 00        nop     
92e2 00        nop     
92e3 00        nop     
92e4 00        nop     
92e5 00        nop     
92e6 00        nop     
92e7 00        nop     
92e8 00        nop     
92e9 00        nop     
92ea 00        nop     
92eb 00        nop     
92ec 00        nop     
92ed 00        nop     
92ee 00        nop     
92ef 00        nop     
92f0 00        nop     
92f1 00        nop     
92f2 00        nop     
92f3 00        nop     
92f4 00        nop     
92f5 00        nop     
92f6 00        nop     
92f7 00        nop     
92f8 00        nop     
92f9 00        nop     
92fa 00        nop     
92fb 00        nop     
92fc 00        nop     
92fd 00        nop     
92fe 00        nop     
92ff 00        nop     
9300 00        nop     
9301 00        nop     
9302 00        nop     
9303 00        nop     
9304 00        nop     
9305 00        nop     
9306 00        nop     
9307 00        nop     
9308 00        nop     
9309 00        nop     
930a 00        nop     
930b 00        nop     
930c 00        nop     
930d 00        nop     
930e 00        nop     
930f 00        nop     
9310 00        nop     
9311 00        nop     
9312 00        nop     
9313 00        nop     
9314 00        nop     
9315 00        nop     
9316 00        nop     
9317 00        nop     
9318 00        nop     
9319 00        nop     
931a 00        nop     
931b 00        nop     
931c 00        nop     
931d 00        nop     
931e 00        nop     
931f 00        nop     
9320 00        nop     
9321 00        nop     
9322 00        nop     
9323 00        nop     
9324 00        nop     
9325 00        nop     
9326 00        nop     
9327 00        nop     
9328 00        nop     
9329 00        nop     
932a 00        nop     
932b 00        nop     
932c 00        nop     
932d 00        nop     
932e 00        nop     
932f 00        nop     
9330 00        nop     
9331 00        nop     
9332 00        nop     
9333 00        nop     
9334 00        nop     
9335 00        nop     
9336 00        nop     
9337 00        nop     
9338 00        nop     
9339 00        nop     
933a 00        nop     
933b 00        nop     
933c 00        nop     
933d 00        nop     
933e 00        nop     
933f 00        nop     
9340 00        nop     
9341 00        nop     
9342 00        nop     
9343 00        nop     
9344 00        nop     
9345 00        nop     
9346 00        nop     
9347 00        nop     
9348 00        nop     
9349 00        nop     
934a 00        nop     
934b 00        nop     
934c 00        nop     
934d 00        nop     
934e 00        nop     
934f 00        nop     
9350 00        nop     
9351 00        nop     
9352 00        nop     
9353 00        nop     
9354 00        nop     
9355 00        nop     
9356 00        nop     
9357 00        nop     
9358 00        nop     
9359 00        nop     
935a 00        nop     
935b 00        nop     
935c 00        nop     
935d 00        nop     
935e 00        nop     
935f 00        nop     
9360 00        nop     
9361 00        nop     
9362 00        nop     
9363 00        nop     
9364 00        nop     
9365 00        nop     
9366 00        nop     
9367 00        nop     
9368 00        nop     
9369 00        nop     
936a 00        nop     
936b 00        nop     
936c 00        nop     
936d 00        nop     
936e 00        nop     
936f 00        nop     
9370 00        nop     
9371 00        nop     
9372 00        nop     
9373 00        nop     
9374 00        nop     
9375 00        nop     
9376 00        nop     
9377 00        nop     
9378 00        nop     
9379 00        nop     
937a 00        nop     
937b 00        nop     
937c 00        nop     
937d 00        nop     
937e 00        nop     
937f 00        nop     
9380 00        nop     
9381 00        nop     
9382 00        nop     
9383 00        nop     
9384 00        nop     
9385 00        nop     
9386 00        nop     
9387 00        nop     
9388 00        nop     
9389 00        nop     
938a 00        nop     
938b 00        nop     
938c 00        nop     
938d 00        nop     
938e 00        nop     
938f 00        nop     
9390 00        nop     
9391 00        nop     
9392 00        nop     
9393 00        nop     
9394 00        nop     
9395 00        nop     
9396 00        nop     
9397 00        nop     
9398 00        nop     
9399 00        nop     
939a 00        nop     
939b 00        nop     
939c 00        nop     
939d 00        nop     
939e 00        nop     
939f 00        nop     
93a0 00        nop     
93a1 00        nop     
93a2 00        nop     
93a3 00        nop     
93a4 00        nop     
93a5 00        nop     
93a6 00        nop     
93a7 00        nop     
93a8 00        nop     
93a9 00        nop     
93aa 00        nop     
93ab 00        nop     
93ac 00        nop     
93ad 00        nop     
93ae 00        nop     
93af 00        nop     
93b0 00        nop     
93b1 00        nop     
93b2 00        nop     
93b3 00        nop     
93b4 00        nop     
93b5 00        nop     
93b6 00        nop     
93b7 00        nop     
93b8 00        nop     
93b9 00        nop     
93ba 00        nop     
93bb 00        nop     
93bc 00        nop     
93bd 00        nop     
93be 00        nop     
93bf 00        nop     
93c0 00        nop     
93c1 00        nop     
93c2 00        nop     
93c3 00        nop     
93c4 00        nop     
93c5 00        nop     
93c6 00        nop     
93c7 00        nop     
93c8 00        nop     
93c9 00        nop     
93ca 00        nop     
93cb 00        nop     
93cc 00        nop     
93cd 00        nop     
93ce 00        nop     
93cf 00        nop     
93d0 00        nop     
93d1 00        nop     
93d2 00        nop     
93d3 00        nop     
93d4 00        nop     
93d5 00        nop     
93d6 00        nop     
93d7 00        nop     
93d8 00        nop     
93d9 00        nop     
93da 00        nop     
93db 00        nop     
93dc 00        nop     
93dd 00        nop     
93de 00        nop     
93df 00        nop     
93e0 00        nop     
93e1 00        nop     
93e2 00        nop     
93e3 00        nop     
93e4 00        nop     
93e5 00        nop     
93e6 00        nop     
93e7 00        nop     
93e8 00        nop     
93e9 00        nop     
93ea 00        nop     
93eb 00        nop     
93ec 00        nop     
93ed 00        nop     
93ee 00        nop     
93ef 00        nop     
93f0 00        nop     
93f1 00        nop     
93f2 00        nop     
93f3 00        nop     
93f4 00        nop     
93f5 00        nop     
93f6 00        nop     
93f7 00        nop     
93f8 00        nop     
93f9 00        nop     
93fa 00        nop     
93fb 00        nop     
93fc 00        nop     
93fd 00        nop     
93fe 00        nop     
93ff 00        nop     
9400 00        nop     
9401 00        nop     
9402 00        nop     
9403 00        nop     
9404 00        nop     
9405 00        nop     
9406 00        nop     
9407 00        nop     
9408 00        nop     
9409 00        nop     
940a 00        nop     
940b 00        nop     
940c 00        nop     
940d 00        nop     
940e 00        nop     
940f 00        nop     
9410 00        nop     
9411 00        nop     
9412 00        nop     
9413 00        nop     
9414 00        nop     
9415 00        nop     
9416 00        nop     
9417 00        nop     
9418 00        nop     
9419 00        nop     
941a 00        nop     
941b 00        nop     
941c 00        nop     
941d 00        nop     
941e 00        nop     
941f 00        nop     
9420 00        nop     
9421 00        nop     
9422 00        nop     
9423 00        nop     
9424 00        nop     
9425 00        nop     
9426 00        nop     
9427 00        nop     
9428 00        nop     
9429 00        nop     
942a 00        nop     
942b 00        nop     
942c 00        nop     
942d 00        nop     
942e 00        nop     
942f 00        nop     
9430 00        nop     
9431 00        nop     
9432 00        nop     
9433 00        nop     
9434 00        nop     
9435 00        nop     
9436 00        nop     
9437 00        nop     
9438 00        nop     
9439 00        nop     
943a 00        nop     
943b 00        nop     
943c 00        nop     
943d 00        nop     
943e 00        nop     
943f 00        nop     
9440 00        nop     
9441 00        nop     
9442 00        nop     
9443 00        nop     
9444 00        nop     
9445 00        nop     
9446 00        nop     
9447 00        nop     
9448 00        nop     
9449 00        nop     
944a 00        nop     
944b 00        nop     
944c 00        nop     
944d 00        nop     
944e 00        nop     
944f 00        nop     
9450 00        nop     
9451 00        nop     
9452 00        nop     
9453 00        nop     
9454 00        nop     
9455 00        nop     
9456 00        nop     
9457 00        nop     
9458 00        nop     
9459 00        nop     
945a 00        nop     
945b 00        nop     
945c 00        nop     
945d 00        nop     
945e 00        nop     
945f 00        nop     
9460 00        nop     
9461 00        nop     
9462 00        nop     
9463 00        nop     
9464 00        nop     
9465 00        nop     
9466 00        nop     
9467 00        nop     
9468 00        nop     
9469 00        nop     
946a 00        nop     
946b 00        nop     
946c 00        nop     
946d 00        nop     
946e 00        nop     
946f 00        nop     
9470 00        nop     
9471 00        nop     
9472 00        nop     
9473 00        nop     
9474 00        nop     
9475 00        nop     
9476 00        nop     
9477 00        nop     
9478 00        nop     
9479 00        nop     
947a 00        nop     
947b 00        nop     
947c 00        nop     
947d 00        nop     
947e 00        nop     
947f 00        nop     
9480 00        nop     
9481 00        nop     
9482 00        nop     
9483 00        nop     
9484 00        nop     
9485 00        nop     
9486 00        nop     
9487 00        nop     
9488 00        nop     
9489 00        nop     
948a 00        nop     
948b 00        nop     
948c 00        nop     
948d 00        nop     
948e 00        nop     
948f 00        nop     
9490 00        nop     
9491 00        nop     
9492 00        nop     
9493 00        nop     
9494 00        nop     
9495 00        nop     
9496 00        nop     
9497 00        nop     
9498 00        nop     
9499 00        nop     
949a 00        nop     
949b 00        nop     
949c 00        nop     
949d 00        nop     
949e 00        nop     
949f 00        nop     
94a0 00        nop     
94a1 00        nop     
94a2 00        nop     
94a3 00        nop     
94a4 00        nop     
94a5 00        nop     
94a6 00        nop     
94a7 00        nop     
94a8 00        nop     
94a9 00        nop     
94aa 00        nop     
94ab 00        nop     
94ac 00        nop     
94ad 00        nop     
94ae 00        nop     
94af 00        nop     
94b0 00        nop     
94b1 00        nop     
94b2 00        nop     
94b3 00        nop     
94b4 00        nop     
94b5 00        nop     
94b6 00        nop     
94b7 00        nop     
94b8 00        nop     
94b9 00        nop     
94ba 00        nop     
94bb 00        nop     
94bc 00        nop     
94bd 00        nop     
94be 00        nop     
94bf 00        nop     
94c0 00        nop     
94c1 00        nop     
94c2 00        nop     
94c3 00        nop     
94c4 00        nop     
94c5 00        nop     
94c6 00        nop     
94c7 00        nop     
94c8 00        nop     
94c9 00        nop     
94ca 00        nop     
94cb 00        nop     
94cc 00        nop     
94cd 00        nop     
94ce 00        nop     
94cf 00        nop     
94d0 00        nop     
94d1 00        nop     
94d2 00        nop     
94d3 00        nop     
94d4 00        nop     
94d5 00        nop     
94d6 00        nop     
94d7 00        nop     
94d8 00        nop     
94d9 00        nop     
94da 00        nop     
94db 00        nop     
94dc 00        nop     
94dd 00        nop     
94de 00        nop     
94df 00        nop     
94e0 00        nop     
94e1 00        nop     
94e2 00        nop     
94e3 00        nop     
94e4 00        nop     
94e5 00        nop     
94e6 00        nop     
94e7 00        nop     
94e8 00        nop     
94e9 00        nop     
94ea 00        nop     
94eb 00        nop     
94ec 00        nop     
94ed 00        nop     
94ee 00        nop     
94ef 00        nop     
94f0 00        nop     
94f1 00        nop     
94f2 00        nop     
94f3 00        nop     
94f4 00        nop     
94f5 00        nop     
94f6 00        nop     
94f7 00        nop     
94f8 00        nop     
94f9 00        nop     
94fa 00        nop     
94fb 00        nop     
94fc 00        nop     
94fd 00        nop     
94fe 00        nop     
94ff 00        nop     
9500 00        nop     
9501 00        nop     
9502 00        nop     
9503 00        nop     
9504 00        nop     
9505 00        nop     
9506 00        nop     
9507 00        nop     
9508 00        nop     
9509 00        nop     
950a 00        nop     
950b 00        nop     
950c 00        nop     
950d 00        nop     
950e 00        nop     
950f 00        nop     
9510 00        nop     
9511 00        nop     
9512 00        nop     
9513 00        nop     
9514 00        nop     
9515 00        nop     
9516 00        nop     
9517 00        nop     
9518 00        nop     
9519 00        nop     
951a 00        nop     
951b 00        nop     
951c 00        nop     
951d 00        nop     
951e 00        nop     
951f 00        nop     
9520 00        nop     
9521 00        nop     
9522 00        nop     
9523 00        nop     
9524 00        nop     
9525 00        nop     
9526 00        nop     
9527 00        nop     
9528 00        nop     
9529 00        nop     
952a 00        nop     
952b 00        nop     
952c 00        nop     
952d 00        nop     
952e 00        nop     
952f 00        nop     
9530 00        nop     
9531 00        nop     
9532 00        nop     
9533 00        nop     
9534 00        nop     
9535 00        nop     
9536 00        nop     
9537 00        nop     
9538 00        nop     
9539 00        nop     
953a 00        nop     
953b 00        nop     
953c 00        nop     
953d 00        nop     
953e 00        nop     
953f 00        nop     
9540 00        nop     
9541 00        nop     
9542 00        nop     
9543 00        nop     
9544 00        nop     
9545 00        nop     
9546 00        nop     
9547 00        nop     
9548 00        nop     
9549 00        nop     
954a 00        nop     
954b 00        nop     
954c 00        nop     
954d 00        nop     
954e 00        nop     
954f 00        nop     
9550 00        nop     
9551 00        nop     
9552 00        nop     
9553 00        nop     
9554 00        nop     
9555 00        nop     
9556 00        nop     
9557 00        nop     
9558 00        nop     
9559 00        nop     
955a 00        nop     
955b 00        nop     
955c 00        nop     
955d 00        nop     
955e 00        nop     
955f 00        nop     
9560 00        nop     
9561 00        nop     
9562 00        nop     
9563 00        nop     
9564 00        nop     
9565 00        nop     
9566 00        nop     
9567 00        nop     
9568 00        nop     
9569 00        nop     
956a 00        nop     
956b 00        nop     
956c 00        nop     
956d 00        nop     
956e 00        nop     
956f 00        nop     
9570 00        nop     
9571 00        nop     
9572 00        nop     
9573 00        nop     
9574 00        nop     
9575 00        nop     
9576 00        nop     
9577 00        nop     
9578 00        nop     
9579 00        nop     
957a 00        nop     
957b 00        nop     
957c 00        nop     
957d 00        nop     
957e 00        nop     
957f 00        nop     
9580 00        nop     
9581 00        nop     
9582 00        nop     
9583 00        nop     
9584 00        nop     
9585 00        nop     
9586 00        nop     
9587 00        nop     
9588 00        nop     
9589 00        nop     
958a 00        nop     
958b 00        nop     
958c 00        nop     
958d 00        nop     
958e 00        nop     
958f 00        nop     
9590 00        nop     
9591 00        nop     
9592 00        nop     
9593 00        nop     
9594 00        nop     
9595 00        nop     
9596 00        nop     
9597 00        nop     
9598 00        nop     
9599 00        nop     
959a 00        nop     
959b 00        nop     
959c 00        nop     
959d 00        nop     
959e 00        nop     
959f 00        nop     
95a0 00        nop     
95a1 00        nop     
95a2 00        nop     
95a3 00        nop     
95a4 00        nop     
95a5 00        nop     
95a6 00        nop     
95a7 00        nop     
95a8 00        nop     
95a9 00        nop     
95aa 00        nop     
95ab 00        nop     
95ac 00        nop     
95ad 00        nop     
95ae 00        nop     
95af 00        nop     
95b0 00        nop     
95b1 00        nop     
95b2 00        nop     
95b3 00        nop     
95b4 00        nop     
95b5 00        nop     
95b6 00        nop     
95b7 00        nop     
95b8 00        nop     
95b9 00        nop     
95ba 00        nop     
95bb 00        nop     
95bc 00        nop     
95bd 00        nop     
95be 00        nop     
95bf 00        nop     
95c0 00        nop     
95c1 00        nop     
95c2 00        nop     
95c3 00        nop     
95c4 00        nop     
95c5 00        nop     
95c6 00        nop     
95c7 00        nop     
95c8 00        nop     
95c9 00        nop     
95ca 00        nop     
95cb 00        nop     
95cc 00        nop     
95cd 00        nop     
95ce 00        nop     
95cf 00        nop     
95d0 00        nop     
95d1 00        nop     
95d2 00        nop     
95d3 00        nop     
95d4 00        nop     
95d5 00        nop     
95d6 00        nop     
95d7 00        nop     
95d8 00        nop     
95d9 00        nop     
95da 00        nop     
95db 00        nop     
95dc 00        nop     
95dd 00        nop     
95de 00        nop     
95df 00        nop     
95e0 00        nop     
95e1 00        nop     
95e2 00        nop     
95e3 00        nop     
95e4 00        nop     
95e5 00        nop     
95e6 00        nop     
95e7 00        nop     
95e8 00        nop     
95e9 00        nop     
95ea 00        nop     
95eb 00        nop     
95ec 00        nop     
95ed 00        nop     
95ee 00        nop     
95ef 00        nop     
95f0 00        nop     
95f1 00        nop     
95f2 00        nop     
95f3 00        nop     
95f4 00        nop     
95f5 00        nop     
95f6 00        nop     
95f7 00        nop     
95f8 00        nop     
95f9 00        nop     
95fa 00        nop     
95fb 00        nop     
95fc 00        nop     
95fd 00        nop     
95fe 00        nop     
95ff 00        nop     
9600 00        nop     
9601 00        nop     
9602 00        nop     
9603 00        nop     
9604 00        nop     
9605 00        nop     
9606 00        nop     
9607 00        nop     
9608 00        nop     
9609 00        nop     
960a 00        nop     
960b 00        nop     
960c 00        nop     
960d 00        nop     
960e 00        nop     
960f 00        nop     
9610 00        nop     
9611 00        nop     
9612 00        nop     
9613 00        nop     
9614 00        nop     
9615 00        nop     
9616 00        nop     
9617 00        nop     
9618 00        nop     
9619 00        nop     
961a 00        nop     
961b 00        nop     
961c 00        nop     
961d 00        nop     
961e 00        nop     
961f 00        nop     
9620 00        nop     
9621 00        nop     
9622 00        nop     
9623 00        nop     
9624 00        nop     
9625 00        nop     
9626 00        nop     
9627 00        nop     
9628 00        nop     
9629 00        nop     
962a 00        nop     
962b 00        nop     
962c 00        nop     
962d 00        nop     
962e 00        nop     
962f 00        nop     
9630 00        nop     
9631 00        nop     
9632 00        nop     
9633 00        nop     
9634 00        nop     
9635 00        nop     
9636 00        nop     
9637 00        nop     
9638 00        nop     
9639 00        nop     
963a 00        nop     
963b 00        nop     
963c 00        nop     
963d 00        nop     
963e 00        nop     
963f 00        nop     
9640 00        nop     
9641 00        nop     
9642 00        nop     
9643 00        nop     
9644 00        nop     
9645 00        nop     
9646 00        nop     
9647 00        nop     
9648 00        nop     
9649 00        nop     
964a 00        nop     
964b 00        nop     
964c 00        nop     
964d 00        nop     
964e 00        nop     
964f 00        nop     
9650 00        nop     
9651 00        nop     
9652 00        nop     
9653 00        nop     
9654 00        nop     
9655 00        nop     
9656 00        nop     
9657 00        nop     
9658 00        nop     
9659 00        nop     
965a 00        nop     
965b 00        nop     
965c 00        nop     
965d 00        nop     
965e 00        nop     
965f 00        nop     
9660 00        nop     
9661 00        nop     
9662 00        nop     
9663 00        nop     
9664 00        nop     
9665 00        nop     
9666 00        nop     
9667 00        nop     
9668 00        nop     
9669 00        nop     
966a 00        nop     
966b 00        nop     
966c 00        nop     
966d 00        nop     
966e 00        nop     
966f 00        nop     
9670 00        nop     
9671 00        nop     
9672 00        nop     
9673 00        nop     
9674 00        nop     
9675 00        nop     
9676 00        nop     
9677 00        nop     
9678 00        nop     
9679 00        nop     
967a 00        nop     
967b 00        nop     
967c 00        nop     
967d 00        nop     
967e 00        nop     
967f 00        nop     
9680 00        nop     
9681 00        nop     
9682 00        nop     
9683 00        nop     
9684 00        nop     
9685 00        nop     
9686 00        nop     
9687 00        nop     
9688 00        nop     
9689 00        nop     
968a 00        nop     
968b 00        nop     
968c 00        nop     
968d 00        nop     
968e 00        nop     
968f 00        nop     
9690 00        nop     
9691 00        nop     
9692 00        nop     
9693 00        nop     
9694 00        nop     
9695 00        nop     
9696 00        nop     
9697 00        nop     
9698 00        nop     
9699 00        nop     
969a 00        nop     
969b 00        nop     
969c 00        nop     
969d 00        nop     
969e 00        nop     
969f 00        nop     
96a0 00        nop     
96a1 00        nop     
96a2 00        nop     
96a3 00        nop     
96a4 00        nop     
96a5 00        nop     
96a6 00        nop     
96a7 00        nop     
96a8 00        nop     
96a9 00        nop     
96aa 00        nop     
96ab 00        nop     
96ac 00        nop     
96ad 00        nop     
96ae 00        nop     
96af 00        nop     
96b0 00        nop     
96b1 00        nop     
96b2 00        nop     
96b3 00        nop     
96b4 00        nop     
96b5 00        nop     
96b6 00        nop     
96b7 00        nop     
96b8 00        nop     
96b9 00        nop     
96ba 00        nop     
96bb 00        nop     
96bc 00        nop     
96bd 00        nop     
96be 00        nop     
96bf 00        nop     
96c0 00        nop     
96c1 00        nop     
96c2 00        nop     
96c3 00        nop     
96c4 00        nop     
96c5 00        nop     
96c6 00        nop     
96c7 00        nop     
96c8 00        nop     
96c9 00        nop     
96ca 00        nop     
96cb 00        nop     
96cc 00        nop     
96cd 00        nop     
96ce 00        nop     
96cf 00        nop     
96d0 00        nop     
96d1 00        nop     
96d2 00        nop     
96d3 00        nop     
96d4 00        nop     
96d5 00        nop     
96d6 00        nop     
96d7 00        nop     
96d8 00        nop     
96d9 00        nop     
96da 00        nop     
96db 00        nop     
96dc 00        nop     
96dd 00        nop     
96de 00        nop     
96df 00        nop     
96e0 00        nop     
96e1 00        nop     
96e2 00        nop     
96e3 00        nop     
96e4 00        nop     
96e5 00        nop     
96e6 00        nop     
96e7 00        nop     
96e8 00        nop     
96e9 00        nop     
96ea 00        nop     
96eb 00        nop     
96ec 00        nop     
96ed 00        nop     
96ee 00        nop     
96ef 00        nop     
96f0 00        nop     
96f1 00        nop     
96f2 00        nop     
96f3 00        nop     
96f4 00        nop     
96f5 00        nop     
96f6 00        nop     
96f7 00        nop     
96f8 00        nop     
96f9 00        nop     
96fa 00        nop     
96fb 00        nop     
96fc 00        nop     
96fd 00        nop     
96fe 00        nop     
96ff 00        nop     
9700 00        nop     
9701 00        nop     
9702 00        nop     
9703 00        nop     
9704 00        nop     
9705 00        nop     
9706 00        nop     
9707 00        nop     
9708 00        nop     
9709 00        nop     
970a 00        nop     
970b 00        nop     
970c 00        nop     
970d 00        nop     
970e 00        nop     
970f 00        nop     
9710 00        nop     
9711 00        nop     
9712 00        nop     
9713 00        nop     
9714 00        nop     
9715 00        nop     
9716 00        nop     
9717 00        nop     
9718 00        nop     
9719 00        nop     
971a 00        nop     
971b 00        nop     
971c 00        nop     
971d 00        nop     
971e 00        nop     
971f 00        nop     
9720 00        nop     
9721 00        nop     
9722 00        nop     
9723 00        nop     
9724 00        nop     
9725 00        nop     
9726 00        nop     
9727 00        nop     
9728 00        nop     
9729 00        nop     
972a 00        nop     
972b 00        nop     
972c 00        nop     
972d 00        nop     
972e 00        nop     
972f 00        nop     
9730 00        nop     
9731 00        nop     
9732 00        nop     
9733 00        nop     
9734 00        nop     
9735 00        nop     
9736 00        nop     
9737 00        nop     
9738 00        nop     
9739 00        nop     
973a 00        nop     
973b 00        nop     
973c 00        nop     
973d 00        nop     
973e 00        nop     
973f 00        nop     
9740 00        nop     
9741 00        nop     
9742 00        nop     
9743 00        nop     
9744 00        nop     
9745 00        nop     
9746 00        nop     
9747 00        nop     
9748 00        nop     
9749 00        nop     
974a 00        nop     
974b 00        nop     
974c 00        nop     
974d 00        nop     
974e 00        nop     
974f 00        nop     
9750 00        nop     
9751 00        nop     
9752 00        nop     
9753 00        nop     
9754 00        nop     
9755 00        nop     
9756 00        nop     
9757 00        nop     
9758 00        nop     
9759 00        nop     
975a 00        nop     
975b 00        nop     
975c 00        nop     
975d 00        nop     
975e 00        nop     
975f 00        nop     
9760 00        nop     
9761 00        nop     
9762 00        nop     
9763 00        nop     
9764 00        nop     
9765 00        nop     
9766 00        nop     
9767 00        nop     
9768 00        nop     
9769 00        nop     
976a 00        nop     
976b 00        nop     
976c 00        nop     
976d 00        nop     
976e 00        nop     
976f 00        nop     
9770 00        nop     
9771 00        nop     
9772 00        nop     
9773 00        nop     
9774 00        nop     
9775 00        nop     
9776 00        nop     
9777 00        nop     
9778 00        nop     
9779 00        nop     
977a 00        nop     
977b 00        nop     
977c 00        nop     
977d 00        nop     
977e 00        nop     
977f 00        nop     
9780 00        nop     
9781 00        nop     
9782 00        nop     
9783 00        nop     
9784 00        nop     
9785 00        nop     
9786 00        nop     
9787 00        nop     
9788 00        nop     
9789 00        nop     
978a 00        nop     
978b 00        nop     
978c 00        nop     
978d 00        nop     
978e 00        nop     
978f 00        nop     
9790 00        nop     
9791 00        nop     
9792 00        nop     
9793 00        nop     
9794 00        nop     
9795 00        nop     
9796 00        nop     
9797 00        nop     
9798 00        nop     
9799 00        nop     
979a 00        nop     
979b 00        nop     
979c 00        nop     
979d 00        nop     
979e 00        nop     
979f 00        nop     
97a0 00        nop     
97a1 00        nop     
97a2 00        nop     
97a3 00        nop     
97a4 00        nop     
97a5 00        nop     
97a6 00        nop     
97a7 00        nop     
97a8 00        nop     
97a9 00        nop     
97aa 00        nop     
97ab 00        nop     
97ac 00        nop     
97ad 00        nop     
97ae 00        nop     
97af 00        nop     
97b0 00        nop     
97b1 00        nop     
97b2 00        nop     
97b3 00        nop     
97b4 00        nop     
97b5 00        nop     
97b6 00        nop     
97b7 00        nop     
97b8 00        nop     
97b9 00        nop     
97ba 00        nop     
97bb 00        nop     
97bc 00        nop     
97bd 00        nop     
97be 00        nop     
97bf 00        nop     
97c0 00        nop     
97c1 00        nop     
97c2 00        nop     
97c3 00        nop     
97c4 00        nop     
97c5 00        nop     
97c6 00        nop     
97c7 00        nop     
97c8 00        nop     
97c9 00        nop     
97ca 00        nop     
97cb 00        nop     
97cc 00        nop     
97cd 00        nop     
97ce 00        nop     
97cf 00        nop     
97d0 00        nop     
97d1 00        nop     
97d2 00        nop     
97d3 00        nop     
97d4 00        nop     
97d5 00        nop     
97d6 00        nop     
97d7 00        nop     
97d8 00        nop     
97d9 00        nop     
97da 00        nop     
97db 00        nop     
97dc 00        nop     
97dd 00        nop     
97de 00        nop     
97df 00        nop     
97e0 00        nop     
97e1 00        nop     
97e2 00        nop     
97e3 00        nop     
97e4 00        nop     
97e5 00        nop     
97e6 00        nop     
97e7 00        nop     
97e8 00        nop     
97e9 00        nop     
97ea 00        nop     
97eb 00        nop     
97ec 00        nop     
97ed 00        nop     
97ee 00        nop     
97ef 00        nop     
97f0 00        nop     
97f1 00        nop     
97f2 00        nop     
97f3 00        nop     
97f4 00        nop     
97f5 00        nop     
97f6 00        nop     
97f7 00        nop     
97f8 00        nop     
97f9 00        nop     
97fa 00        nop     
97fb 00        nop     
97fc 00        nop     
97fd 00        nop     
97fe 00        nop     
97ff 00        nop     
9800 00        nop     
9801 00        nop     
9802 00        nop     
9803 00        nop     
9804 00        nop     
9805 00        nop     
9806 00        nop     
9807 00        nop     
9808 00        nop     
9809 00        nop     
980a 00        nop     
980b 00        nop     
980c 00        nop     
980d 00        nop     
980e 00        nop     
980f 00        nop     
9810 00        nop     
9811 00        nop     
9812 00        nop     
9813 00        nop     
9814 00        nop     
9815 00        nop     
9816 00        nop     
9817 00        nop     
9818 00        nop     
9819 00        nop     
981a 00        nop     
981b 00        nop     
981c 00        nop     
981d 00        nop     
981e 00        nop     
981f 00        nop     
9820 00        nop     
9821 00        nop     
9822 00        nop     
9823 00        nop     
9824 00        nop     
9825 00        nop     
9826 00        nop     
9827 00        nop     
9828 00        nop     
9829 00        nop     
982a 00        nop     
982b 00        nop     
982c 00        nop     
982d 00        nop     
982e 00        nop     
982f 00        nop     
9830 00        nop     
9831 00        nop     
9832 00        nop     
9833 00        nop     
9834 00        nop     
9835 00        nop     
9836 00        nop     
9837 00        nop     
9838 00        nop     
9839 00        nop     
983a 00        nop     
983b 00        nop     
983c 00        nop     
983d 00        nop     
983e 00        nop     
983f 00        nop     
9840 00        nop     
9841 00        nop     
9842 00        nop     
9843 00        nop     
9844 00        nop     
9845 00        nop     
9846 00        nop     
9847 00        nop     
9848 00        nop     
9849 00        nop     
984a 00        nop     
984b 00        nop     
984c 00        nop     
984d 00        nop     
984e 00        nop     
984f 00        nop     
9850 00        nop     
9851 00        nop     
9852 00        nop     
9853 00        nop     
9854 00        nop     
9855 00        nop     
9856 00        nop     
9857 00        nop     
9858 00        nop     
9859 00        nop     
985a 00        nop     
985b 00        nop     
985c 00        nop     
985d 00        nop     
985e 00        nop     
985f 00        nop     
9860 00        nop     
9861 00        nop     
9862 00        nop     
9863 00        nop     
9864 00        nop     
9865 00        nop     
9866 00        nop     
9867 00        nop     
9868 00        nop     
9869 00        nop     
986a 00        nop     
986b 00        nop     
986c 00        nop     
986d 00        nop     
986e 00        nop     
986f 00        nop     
9870 00        nop     
9871 00        nop     
9872 00        nop     
9873 00        nop     
9874 00        nop     
9875 00        nop     
9876 00        nop     
9877 00        nop     
9878 00        nop     
9879 00        nop     
987a 00        nop     
987b 00        nop     
987c 00        nop     
987d 00        nop     
987e 00        nop     
987f 00        nop     
9880 00        nop     
9881 00        nop     
9882 00        nop     
9883 00        nop     
9884 00        nop     
9885 00        nop     
9886 00        nop     
9887 00        nop     
9888 00        nop     
9889 00        nop     
988a 00        nop     
988b 00        nop     
988c 00        nop     
988d 00        nop     
988e 00        nop     
988f 00        nop     
9890 00        nop     
9891 00        nop     
9892 00        nop     
9893 00        nop     
9894 00        nop     
9895 00        nop     
9896 00        nop     
9897 00        nop     
9898 00        nop     
9899 00        nop     
989a 00        nop     
989b 00        nop     
989c 00        nop     
989d 00        nop     
989e 00        nop     
989f 00        nop     
98a0 00        nop     
98a1 00        nop     
98a2 00        nop     
98a3 00        nop     
98a4 00        nop     
98a5 00        nop     
98a6 00        nop     
98a7 00        nop     
98a8 00        nop     
98a9 00        nop     
98aa 00        nop     
98ab 00        nop     
98ac 00        nop     
98ad 00        nop     
98ae 00        nop     
98af 00        nop     
98b0 00        nop     
98b1 00        nop     
98b2 00        nop     
98b3 00        nop     
98b4 00        nop     
98b5 00        nop     
98b6 00        nop     
98b7 00        nop     
98b8 00        nop     
98b9 00        nop     
98ba 00        nop     
98bb 00        nop     
98bc 00        nop     
98bd 00        nop     
98be 00        nop     
98bf 00        nop     
98c0 00        nop     
98c1 00        nop     
98c2 00        nop     
98c3 00        nop     
98c4 00        nop     
98c5 00        nop     
98c6 00        nop     
98c7 00        nop     
98c8 00        nop     
98c9 00        nop     
98ca 00        nop     
98cb 00        nop     
98cc 00        nop     
98cd 00        nop     
98ce 00        nop     
98cf 00        nop     
98d0 00        nop     
98d1 00        nop     
98d2 00        nop     
98d3 00        nop     
98d4 00        nop     
98d5 00        nop     
98d6 00        nop     
98d7 00        nop     
98d8 00        nop     
98d9 00        nop     
98da 00        nop     
98db 00        nop     
98dc 00        nop     
98dd 00        nop     
98de 00        nop     
98df 00        nop     
98e0 00        nop     
98e1 00        nop     
98e2 00        nop     
98e3 00        nop     
98e4 00        nop     
98e5 00        nop     
98e6 00        nop     
98e7 00        nop     
98e8 00        nop     
98e9 00        nop     
98ea 00        nop     
98eb 00        nop     
98ec 00        nop     
98ed 00        nop     
98ee 00        nop     
98ef 00        nop     
98f0 00        nop     
98f1 00        nop     
98f2 00        nop     
98f3 00        nop     
98f4 00        nop     
98f5 00        nop     
98f6 00        nop     
98f7 00        nop     
98f8 00        nop     
98f9 00        nop     
98fa 00        nop     
98fb 00        nop     
98fc 00        nop     
98fd 00        nop     
98fe 00        nop     
98ff 00        nop     
9900 00        nop     
9901 00        nop     
9902 00        nop     
9903 00        nop     
9904 00        nop     
9905 00        nop     
9906 00        nop     
9907 00        nop     
9908 00        nop     
9909 00        nop     
990a 00        nop     
990b 00        nop     
990c 00        nop     
990d 00        nop     
990e 00        nop     
990f 00        nop     
9910 00        nop     
9911 00        nop     
9912 00        nop     
9913 00        nop     
9914 00        nop     
9915 00        nop     
9916 00        nop     
9917 00        nop     
9918 00        nop     
9919 00        nop     
991a 00        nop     
991b 00        nop     
991c 00        nop     
991d 00        nop     
991e 00        nop     
991f 00        nop     
9920 00        nop     
9921 00        nop     
9922 00        nop     
9923 00        nop     
9924 00        nop     
9925 00        nop     
9926 00        nop     
9927 00        nop     
9928 00        nop     
9929 00        nop     
992a 00        nop     
992b 00        nop     
992c 00        nop     
992d 00        nop     
992e 00        nop     
992f 00        nop     
9930 00        nop     
9931 00        nop     
9932 00        nop     
9933 00        nop     
9934 00        nop     
9935 00        nop     
9936 00        nop     
9937 00        nop     
9938 00        nop     
9939 00        nop     
993a 00        nop     
993b 00        nop     
993c 00        nop     
993d 00        nop     
993e 00        nop     
993f 00        nop     
9940 00        nop     
9941 00        nop     
9942 00        nop     
9943 00        nop     
9944 00        nop     
9945 00        nop     
9946 00        nop     
9947 00        nop     
9948 00        nop     
9949 00        nop     
994a 00        nop     
994b 00        nop     
994c 00        nop     
994d 00        nop     
994e 00        nop     
994f 00        nop     
9950 00        nop     
9951 00        nop     
9952 00        nop     
9953 00        nop     
9954 00        nop     
9955 00        nop     
9956 00        nop     
9957 00        nop     
9958 00        nop     
9959 00        nop     
995a 00        nop     
995b 00        nop     
995c 00        nop     
995d 00        nop     
995e 00        nop     
995f 00        nop     
9960 00        nop     
9961 00        nop     
9962 00        nop     
9963 00        nop     
9964 00        nop     
9965 00        nop     
9966 00        nop     
9967 00        nop     
9968 00        nop     
9969 00        nop     
996a 00        nop     
996b 00        nop     
996c 00        nop     
996d 00        nop     
996e 00        nop     
996f 00        nop     
9970 00        nop     
9971 00        nop     
9972 00        nop     
9973 00        nop     
9974 00        nop     
9975 00        nop     
9976 00        nop     
9977 00        nop     
9978 00        nop     
9979 00        nop     
997a 00        nop     
997b 00        nop     
997c 00        nop     
997d 00        nop     
997e 00        nop     
997f 00        nop     
9980 00        nop     
9981 00        nop     
9982 00        nop     
9983 00        nop     
9984 00        nop     
9985 00        nop     
9986 00        nop     
9987 00        nop     
9988 00        nop     
9989 00        nop     
998a 00        nop     
998b 00        nop     
998c 00        nop     
998d 00        nop     
998e 00        nop     
998f 00        nop     
9990 00        nop     
9991 00        nop     
9992 00        nop     
9993 00        nop     
9994 00        nop     
9995 00        nop     
9996 00        nop     
9997 00        nop     
9998 00        nop     
9999 00        nop     
999a 00        nop     
999b 00        nop     
999c 00        nop     
999d 00        nop     
999e 00        nop     
999f 00        nop     
99a0 00        nop     
99a1 00        nop     
99a2 00        nop     
99a3 00        nop     
99a4 00        nop     
99a5 00        nop     
99a6 00        nop     
99a7 00        nop     
99a8 00        nop     
99a9 00        nop     
99aa 00        nop     
99ab 00        nop     
99ac 00        nop     
99ad 00        nop     
99ae 00        nop     
99af 00        nop     
99b0 00        nop     
99b1 00        nop     
99b2 00        nop     
99b3 00        nop     
99b4 00        nop     
99b5 00        nop     
99b6 00        nop     
99b7 00        nop     
99b8 00        nop     
99b9 00        nop     
99ba 00        nop     
99bb 00        nop     
99bc 00        nop     
99bd 00        nop     
99be 00        nop     
99bf 00        nop     
99c0 00        nop     
99c1 00        nop     
99c2 00        nop     
99c3 00        nop     
99c4 00        nop     
99c5 00        nop     
99c6 00        nop     
99c7 00        nop     
99c8 00        nop     
99c9 00        nop     
99ca 00        nop     
99cb 00        nop     
99cc 00        nop     
99cd 00        nop     
99ce 00        nop     
99cf 00        nop     
99d0 00        nop     
99d1 00        nop     
99d2 00        nop     
99d3 00        nop     
99d4 00        nop     
99d5 00        nop     
99d6 00        nop     
99d7 00        nop     
99d8 00        nop     
99d9 00        nop     
99da 00        nop     
99db 00        nop     
99dc 00        nop     
99dd 00        nop     
99de 00        nop     
99df 00        nop     
99e0 00        nop     
99e1 00        nop     
99e2 00        nop     
99e3 00        nop     
99e4 00        nop     
99e5 00        nop     
99e6 00        nop     
99e7 00        nop     
99e8 00        nop     
99e9 00        nop     
99ea 00        nop     
99eb 00        nop     
99ec 00        nop     
99ed 00        nop     
99ee 00        nop     
99ef 00        nop     
99f0 00        nop     
99f1 00        nop     
99f2 00        nop     
99f3 00        nop     
99f4 00        nop     
99f5 00        nop     
99f6 00        nop     
99f7 00        nop     
99f8 00        nop     
99f9 00        nop     
99fa 00        nop     
99fb 00        nop     
99fc 00        nop     
99fd 00        nop     
99fe 00        nop     
99ff 00        nop     
9a00 00        nop     
9a01 00        nop     
9a02 00        nop     
9a03 00        nop     
9a04 00        nop     
9a05 00        nop     
9a06 00        nop     
9a07 00        nop     
9a08 00        nop     
9a09 00        nop     
9a0a 00        nop     
9a0b 00        nop     
9a0c 00        nop     
9a0d 00        nop     
9a0e 00        nop     
9a0f 00        nop     
9a10 00        nop     
9a11 00        nop     
9a12 00        nop     
9a13 00        nop     
9a14 00        nop     
9a15 00        nop     
9a16 00        nop     
9a17 00        nop     
9a18 00        nop     
9a19 00        nop     
9a1a 00        nop     
9a1b 00        nop     
9a1c 00        nop     
9a1d 00        nop     
9a1e 00        nop     
9a1f 00        nop     
9a20 00        nop     
9a21 00        nop     
9a22 00        nop     
9a23 00        nop     
9a24 00        nop     
9a25 00        nop     
9a26 00        nop     
9a27 00        nop     
9a28 00        nop     
9a29 00        nop     
9a2a 00        nop     
9a2b 00        nop     
9a2c 00        nop     
9a2d 00        nop     
9a2e 00        nop     
9a2f 00        nop     
9a30 00        nop     
9a31 00        nop     
9a32 00        nop     
9a33 00        nop     
9a34 00        nop     
9a35 00        nop     
9a36 00        nop     
9a37 00        nop     
9a38 00        nop     
9a39 00        nop     
9a3a 00        nop     
9a3b 00        nop     
9a3c 00        nop     
9a3d 00        nop     
9a3e 00        nop     
9a3f 00        nop     
9a40 00        nop     
9a41 00        nop     
9a42 00        nop     
9a43 00        nop     
9a44 00        nop     
9a45 00        nop     
9a46 00        nop     
9a47 00        nop     
9a48 00        nop     
9a49 00        nop     
9a4a 00        nop     
9a4b 00        nop     
9a4c 00        nop     
9a4d 00        nop     
9a4e 00        nop     
9a4f 00        nop     
9a50 00        nop     
9a51 00        nop     
9a52 00        nop     
9a53 00        nop     
9a54 00        nop     
9a55 00        nop     
9a56 00        nop     
9a57 00        nop     
9a58 00        nop     
9a59 00        nop     
9a5a 00        nop     
9a5b 00        nop     
9a5c 00        nop     
9a5d 00        nop     
9a5e 00        nop     
9a5f 00        nop     
9a60 00        nop     
9a61 00        nop     
9a62 00        nop     
9a63 00        nop     
9a64 00        nop     
9a65 00        nop     
9a66 00        nop     
9a67 00        nop     
9a68 00        nop     
9a69 00        nop     
9a6a 00        nop     
9a6b 00        nop     
9a6c 00        nop     
9a6d 00        nop     
9a6e 00        nop     
9a6f 00        nop     
9a70 00        nop     
9a71 00        nop     
9a72 00        nop     
9a73 00        nop     
9a74 00        nop     
9a75 00        nop     
9a76 00        nop     
9a77 00        nop     
9a78 00        nop     
9a79 00        nop     
9a7a 00        nop     
9a7b 00        nop     
9a7c 00        nop     
9a7d 00        nop     
9a7e 00        nop     
9a7f 00        nop     
9a80 00        nop     
9a81 00        nop     
9a82 00        nop     
9a83 00        nop     
9a84 00        nop     
9a85 00        nop     
9a86 00        nop     
9a87 00        nop     
9a88 00        nop     
9a89 00        nop     
9a8a 00        nop     
9a8b 00        nop     
9a8c 00        nop     
9a8d 00        nop     
9a8e 00        nop     
9a8f 00        nop     
9a90 00        nop     
9a91 00        nop     
9a92 00        nop     
9a93 00        nop     
9a94 00        nop     
9a95 00        nop     
9a96 00        nop     
9a97 00        nop     
9a98 00        nop     
9a99 00        nop     
9a9a 00        nop     
9a9b 00        nop     
9a9c 00        nop     
9a9d 00        nop     
9a9e 00        nop     
9a9f 00        nop     
9aa0 00        nop     
9aa1 00        nop     
9aa2 00        nop     
9aa3 00        nop     
9aa4 00        nop     
9aa5 00        nop     
9aa6 00        nop     
9aa7 00        nop     
9aa8 00        nop     
9aa9 00        nop     
9aaa 00        nop     
9aab 00        nop     
9aac 00        nop     
9aad 00        nop     
9aae 00        nop     
9aaf 00        nop     
9ab0 00        nop     
9ab1 00        nop     
9ab2 00        nop     
9ab3 00        nop     
9ab4 00        nop     
9ab5 00        nop     
9ab6 00        nop     
9ab7 00        nop     
9ab8 00        nop     
9ab9 00        nop     
9aba 00        nop     
9abb 00        nop     
9abc 00        nop     
9abd 00        nop     
9abe 00        nop     
9abf 00        nop     
9ac0 00        nop     
9ac1 00        nop     
9ac2 00        nop     
9ac3 00        nop     
9ac4 010001    ld      bc,$0100
9ac7 00        nop     
9ac8 010001    ld      bc,$0100
9acb 00        nop     
9acc 00        nop     
9acd 00        nop     
9ace 33        inc     sp
9acf 00        nop     
9ad0 00        nop     
9ad1 00        nop     
9ad2 03        inc     bc
9ad3 00        nop     
9ad4 03        inc     bc
9ad5 00        nop     
9ad6 010004    ld      bc,$0400
9ad9 00        nop     
9ada 010001    ld      bc,$0100
9add 00        nop     
9ade 00        nop     
9adf 00        nop     
9ae0 00        nop     
9ae1 00        nop     
9ae2 00        nop     
9ae3 00        nop     
9ae4 04        inc     b
9ae5 00        nop     
9ae6 010002    ld      bc,$0200
9ae9 00        nop     
9aea 03        inc     bc
9aeb 00        nop     
9aec 00        nop     
9aed 00        nop     
9aee 00        nop     
9aef 00        nop     
9af0 00        nop     
9af1 00        nop     
9af2 00        nop     
9af3 00        nop     
9af4 010001    ld      bc,$0100
9af7 00        nop     
9af8 010001    ld      bc,$0100
9afb 00        nop     
9afc 00        nop     
9afd 00        nop     
9afe 00        nop     
9aff 00        nop     
9b00 010050    ld      bc,$5000
9b03 00        nop     
9b04 00        nop     
9b05 00        nop     
9b06 00        nop     
9b07 00        nop     
9b08 00        nop     
9b09 00        nop     
9b0a 00        nop     
9b0b 00        nop     
9b0c 00        nop     
9b0d 00        nop     
9b0e 00        nop     
9b0f 00        nop     
9b10 00        nop     
9b11 00        nop     
9b12 80        add     a,b
9b13 00        nop     
9b14 00        nop     
9b15 00        nop     
9b16 00        nop     
9b17 ff        rst     $38
9b18 00        nop     
9b19 00        nop     
9b1a 00        nop     
9b1b 00        nop     
9b1c 00        nop     
9b1d 00        nop     
9b1e 00        nop     
9b1f 00        nop     
9b20 00        nop     
9b21 010101    ld      bc,$0101
9b24 010000    ld      bc,$0000
9b27 7f        ld      a,a
9b28 1804      jr      $9b2e
9b2a c4c3c1    call    nz,$c1c3
9b2d c2160e    jp      nz,$0e16
9b30 1c        inc     e
9b31 0f        rrca    
9b32 14        inc     d
9b33 1011      djnz    $9b46
9b35 02        ld      (bc),a
9b36 0609      ld      b,$09
9b38 0d        dec     c
9b39 05        dec     b
9b3a 07        rlca    
9b3b 15        dec     d
9b3c 00        nop     
9b3d 00        nop     
9b3e 00        nop     
9b3f 00        nop     
9b40 00        nop     
9b41 00        nop     
9b42 010000    ld      bc,$0000
9b45 00        nop     
9b46 010101    ld      bc,$0101
9b49 010101    ld      bc,$0101
9b4c 010302    ld      bc,$0203
9b4f 04        inc     b
9b50 00        nop     
9b51 00        nop     
9b52 00        nop     
9b53 00        nop     
9b54 010200    ld      bc,$0002
9b57 00        nop     
9b58 00        nop     
9b59 010100    ld      bc,$0001
9b5c 00        nop     
9b5d 00        nop     
9b5e 00        nop     
9b5f 00        nop     
9b60 00        nop     
9b61 010200    ld      bc,$0002
9b64 02        ld      (bc),a
9b65 00        nop     
9b66 00        nop     
9b67 00        nop     
9b68 00        nop     
9b69 00        nop     
9b6a 00        nop     
9b6b 00        nop     
9b6c 00        nop     
9b6d 00        nop     
9b6e 02        ld      (bc),a
9b6f 00        nop     
9b70 00        nop     
9b71 02        ld      (bc),a
9b72 00        nop     
9b73 00        nop     
9b74 00        nop     
9b75 00        nop     
9b76 00        nop     
9b77 00        nop     
9b78 00        nop     
9b79 00        nop     
9b7a 00        nop     
9b7b 00        nop     
9b7c 00        nop     
9b7d 00        nop     
9b7e 00        nop     
9b7f 00        nop     
9b80 00        nop     
9b81 00        nop     
9b82 00        nop     
9b83 00        nop     
9b84 00        nop     
9b85 00        nop     
9b86 00        nop     
9b87 00        nop     
9b88 00        nop     
9b89 00        nop     
9b8a 00        nop     
9b8b 00        nop     
9b8c 00        nop     
9b8d 00        nop     
9b8e 00        nop     
9b8f 00        nop     
9b90 00        nop     
9b91 00        nop     
9b92 00        nop     
9b93 00        nop     
9b94 00        nop     
9b95 00        nop     
9b96 00        nop     
9b97 00        nop     
9b98 00        nop     
9b99 00        nop     
9b9a 00        nop     
9b9b 00        nop     
9b9c 00        nop     
9b9d 00        nop     
9b9e 00        nop     
9b9f 00        nop     
9ba0 00        nop     
9ba1 00        nop     
9ba2 00        nop     
9ba3 00        nop     
9ba4 00        nop     
9ba5 00        nop     
9ba6 00        nop     
9ba7 00        nop     
9ba8 00        nop     
9ba9 00        nop     
9baa 00        nop     
9bab 00        nop     
9bac 00        nop     
9bad 00        nop     
9bae 00        nop     
9baf 00        nop     
9bb0 00        nop     
9bb1 00        nop     
9bb2 00        nop     
9bb3 00        nop     
9bb4 00        nop     
9bb5 00        nop     
9bb6 00        nop     
9bb7 00        nop     
9bb8 00        nop     
9bb9 00        nop     
9bba 00        nop     
9bbb 00        nop     
9bbc 00        nop     
9bbd 00        nop     
9bbe 00        nop     
9bbf 00        nop     
9bc0 00        nop     
9bc1 00        nop     
9bc2 00        nop     
9bc3 00        nop     
9bc4 00        nop     
9bc5 00        nop     
9bc6 00        nop     
9bc7 00        nop     
9bc8 00        nop     
9bc9 00        nop     
9bca 00        nop     
9bcb 00        nop     
9bcc 00        nop     
9bcd 00        nop     
9bce 00        nop     
9bcf 00        nop     
9bd0 00        nop     
9bd1 00        nop     
9bd2 00        nop     
9bd3 00        nop     
9bd4 00        nop     
9bd5 00        nop     
9bd6 00        nop     
9bd7 00        nop     
9bd8 00        nop     
9bd9 00        nop     
9bda 00        nop     
9bdb 00        nop     
9bdc 00        nop     
9bdd 00        nop     
9bde 00        nop     
9bdf 00        nop     
9be0 00        nop     
9be1 00        nop     
9be2 00        nop     
9be3 00        nop     
9be4 00        nop     
9be5 00        nop     
9be6 00        nop     
9be7 00        nop     
9be8 00        nop     
9be9 00        nop     
9bea 00        nop     
9beb 00        nop     
9bec 00        nop     
9bed 00        nop     
9bee 00        nop     
9bef 00        nop     
9bf0 00        nop     
9bf1 00        nop     
9bf2 00        nop     
9bf3 00        nop     
9bf4 00        nop     
9bf5 00        nop     
9bf6 00        nop     
9bf7 00        nop     
9bf8 00        nop     
9bf9 00        nop     
9bfa 00        nop     
9bfb 00        nop     
9bfc 00        nop     
9bfd 00        nop     
9bfe 00        nop     
9bff 00        nop     
9c00 00        nop     
9c01 00        nop     
9c02 00        nop     
9c03 00        nop     
9c04 00        nop     
9c05 00        nop     
9c06 00        nop     
9c07 00        nop     
9c08 00        nop     
9c09 00        nop     
9c0a 00        nop     
9c0b 00        nop     
9c0c 00        nop     
9c0d 00        nop     
9c0e 00        nop     
9c0f 00        nop     
9c10 00        nop     
9c11 00        nop     
9c12 00        nop     
9c13 00        nop     
9c14 00        nop     
9c15 00        nop     
9c16 00        nop     
9c17 00        nop     
9c18 00        nop     
9c19 00        nop     
9c1a 00        nop     
9c1b 00        nop     
9c1c 00        nop     
9c1d 00        nop     
9c1e 00        nop     
9c1f 00        nop     
9c20 00        nop     
9c21 00        nop     
9c22 00        nop     
9c23 00        nop     
9c24 00        nop     
9c25 0e52      ld      c,$52
9c27 44        ld      b,h
9c28 53        ld      d,e
9c29 57        ld      d,a
9c2a 57        ld      d,a
9c2b 52        ld      d,d
9c2c 45        ld      b,l
9c2d 58        ld      e,b
9c2e 49        ld      c,c
9c2f 46        ld      b,(hl)
9c30 4f        ld      c,a
9c31 46        ld      b,(hl)
9c32 46        ld      b,(hl)
9c33 53        ld      d,e
9c34 53        ld      d,e
9c35 47        ld      b,a
9c36 53        ld      d,e
9c37 52        ld      d,d
9c38 57        ld      d,a
9c39 53        ld      d,e
9c3a 58        ld      e,b
9c3b 52        ld      d,d
9c3c 4c        ld      c,h
9c3d 49        ld      c,c
9c3e 45        ld      b,l
9c3f 52        ld      d,d
9c40 49        ld      c,c
9c41 4e        ld      c,(hl)
9c42 44        ld      b,h
9c43 49        ld      c,c
9c44 47        ld      b,a
9c45 47        ld      b,a
9c46 47        ld      b,a
9c47 52        ld      d,d
9c48 00        nop     
9c49 00        nop     
9c4a 00        nop     
9c4b 00        nop     
9c4c 00        nop     
9c4d 00        nop     
9c4e 00        nop     
9c4f 00        nop     
9c50 00        nop     
9c51 00        nop     
9c52 00        nop     
9c53 00        nop     
9c54 00        nop     
9c55 00        nop     
9c56 00        nop     
9c57 00        nop     
9c58 00        nop     
9c59 00        nop     
9c5a 00        nop     
9c5b 00        nop     
9c5c 00        nop     
9c5d 00        nop     
9c5e 00        nop     
9c5f 00        nop     
9c60 00        nop     
9c61 00        nop     
9c62 00        nop     
9c63 00        nop     
9c64 00        nop     
9c65 00        nop     
9c66 00        nop     
9c67 00        nop     
9c68 00        nop     
9c69 00        nop     
9c6a 00        nop     
9c6b 00        nop     
9c6c 00        nop     
9c6d 00        nop     
9c6e 00        nop     
9c6f 00        nop     
9c70 00        nop     
9c71 00        nop     
9c72 00        nop     
9c73 00        nop     
9c74 00        nop     
9c75 00        nop     
9c76 00        nop     
9c77 00        nop     
9c78 00        nop     
9c79 00        nop     
9c7a 00        nop     
9c7b 00        nop     
9c7c 00        nop     
9c7d 00        nop     
9c7e 00        nop     
9c7f 00        nop     
9c80 00        nop     
9c81 00        nop     
9c82 00        nop     
9c83 00        nop     
9c84 00        nop     
9c85 00        nop     
9c86 00        nop     
9c87 00        nop     
9c88 00        nop     
9c89 00        nop     
9c8a 00        nop     
9c8b 00        nop     
9c8c 00        nop     
9c8d 00        nop     
9c8e 00        nop     
9c8f 00        nop     
9c90 00        nop     
9c91 00        nop     
9c92 00        nop     
9c93 00        nop     
9c94 00        nop     
9c95 00        nop     
9c96 00        nop     
9c97 00        nop     
9c98 2020      jr      nz,$9cba
9c9a 2020      jr      nz,$9cbc
9c9c 2020      jr      nz,$9cbe
9c9e 2020      jr      nz,$9cc0
9ca0 2020      jr      nz,$9cc2
9ca2 2020      jr      nz,$9cc4
9ca4 2020      jr      nz,$9cc6
9ca6 2020      jr      nz,$9cc8
9ca8 2020      jr      nz,$9cca
9caa 2020      jr      nz,$9ccc
9cac 2020      jr      nz,$9cce
9cae 2020      jr      nz,$9cd0
9cb0 2020      jr      nz,$9cd2
9cb2 2020      jr      nz,$9cd4
9cb4 2020      jr      nz,$9cd6
9cb6 2020      jr      nz,$9cd8
9cb8 2020      jr      nz,$9cda
9cba 2020      jr      nz,$9cdc
9cbc 2020      jr      nz,$9cde
9cbe 2020      jr      nz,$9ce0
9cc0 2020      jr      nz,$9ce2
9cc2 2020      jr      nz,$9ce4
9cc4 2020      jr      nz,$9ce6
9cc6 2020      jr      nz,$9ce8
9cc8 2020      jr      nz,$9cea
9cca 2020      jr      nz,$9cec
9ccc 2020      jr      nz,$9cee
9cce 2020      jr      nz,$9cf0
9cd0 2020      jr      nz,$9cf2
9cd2 2020      jr      nz,$9cf4
9cd4 2020      jr      nz,$9cf6
9cd6 2020      jr      nz,$9cf8
9cd8 2020      jr      nz,$9cfa
9cda 2020      jr      nz,$9cfc
9cdc 2020      jr      nz,$9cfe
9cde 2020      jr      nz,$9d00
9ce0 2020      jr      nz,$9d02
9ce2 2020      jr      nz,$9d04
9ce4 2020      jr      nz,$9d06
9ce6 2020      jr      nz,$9d08
9ce8 2d        dec     l
9ce9 2d        dec     l
9cea 2d        dec     l
9ceb 2d        dec     l
9cec 2d        dec     l
9ced 2d        dec     l
9cee 4e        ld      c,(hl)
9cef 2820      jr      z,$9d11
9cf1 2020      jr      nz,$9d13
9cf3 2020      jr      nz,$9d15
9cf5 312c20    ld      sp,$202c
9cf8 2031      jr      nz,$9d2b
9cfa 29        add     hl,hl
9cfb 3c        inc     a
9cfc 313e20    ld      sp,$203e
9cff 2020      jr      nz,$9d21
9d01 2020      jr      nz,$9d23
9d03 2020      jr      nz,$9d25
9d05 2020      jr      nz,$9d27
9d07 2020      jr      nz,$9d29
9d09 2020      jr      nz,$9d2b
9d0b 2020      jr      nz,$9d2d
9d0d 2020      jr      nz,$9d2f
9d0f 2020      jr      nz,$9d31
9d11 2020      jr      nz,$9d33
9d13 2020      jr      nz,$9d35
9d15 2020      jr      nz,$9d37
9d17 2020      jr      nz,$9d39
9d19 2020      jr      nz,$9d3b
9d1b 2020      jr      nz,$9d3d
9d1d 2020      jr      nz,$9d3f
9d1f 2020      jr      nz,$9d41
9d21 2020      jr      nz,$9d43
9d23 2020      jr      nz,$9d45
9d25 2020      jr      nz,$9d47
9d27 2020      jr      nz,$9d49
9d29 2020      jr      nz,$9d4b
9d2b 2020      jr      nz,$9d4d
9d2d 2020      jr      nz,$9d4f
9d2f 2020      jr      nz,$9d51
9d31 2020      jr      nz,$9d53
9d33 2020      jr      nz,$9d55
9d35 2020      jr      nz,$9d57
9d37 2020      jr      nz,$9d59
9d39 2020      jr      nz,$9d5b
9d3b 2020      jr      nz,$9d5d
9d3d 2020      jr      nz,$9d5f
9d3f 2020      jr      nz,$9d61
9d41 2020      jr      nz,$9d63
9d43 2020      jr      nz,$9d65
9d45 2020      jr      nz,$9d67
9d47 2020      jr      nz,$9d69
9d49 2020      jr      nz,$9d6b
9d4b 2020      jr      nz,$9d6d
9d4d 2020      jr      nz,$9d6f
9d4f 2020      jr      nz,$9d71
9d51 2020      jr      nz,$9d73
9d53 2020      jr      nz,$9d75
9d55 2020      jr      nz,$9d77
9d57 2020      jr      nz,$9d79
9d59 2020      jr      nz,$9d7b
9d5b 2020      jr      nz,$9d7d
9d5d 2020      jr      nz,$9d7f
9d5f 2020      jr      nz,$9d81
9d61 2020      jr      nz,$9d83
9d63 2020      jr      nz,$9d85
9d65 2020      jr      nz,$9d87
9d67 2020      jr      nz,$9d89
9d69 2020      jr      nz,$9d8b
9d6b 2020      jr      nz,$9d8d
9d6d 2020      jr      nz,$9d8f
9d6f 2020      jr      nz,$9d91
9d71 2020      jr      nz,$9d93
9d73 2020      jr      nz,$9d95
9d75 2020      jr      nz,$9d97
9d77 2020      jr      nz,$9d99
9d79 2020      jr      nz,$9d9b
9d7b 2020      jr      nz,$9d9d
9d7d 2020      jr      nz,$9d9f
9d7f 2020      jr      nz,$9da1
9d81 2020      jr      nz,$9da3
9d83 2020      jr      nz,$9da5
9d85 2020      jr      nz,$9da7
9d87 2020      jr      nz,$9da9
9d89 2020      jr      nz,$9dab
9d8b 2020      jr      nz,$9dad
9d8d 2020      jr      nz,$9daf
9d8f 2020      jr      nz,$9db1
9d91 2020      jr      nz,$9db3
9d93 2020      jr      nz,$9db5
9d95 2020      jr      nz,$9db7
9d97 2020      jr      nz,$9db9
9d99 2020      jr      nz,$9dbb
9d9b 2020      jr      nz,$9dbd
9d9d 2020      jr      nz,$9dbf
9d9f 2020      jr      nz,$9dc1
9da1 2020      jr      nz,$9dc3
9da3 2020      jr      nz,$9dc5
9da5 2020      jr      nz,$9dc7
9da7 2020      jr      nz,$9dc9
9da9 2020      jr      nz,$9dcb
9dab 2020      jr      nz,$9dcd
9dad 2020      jr      nz,$9dcf
9daf 2020      jr      nz,$9dd1
9db1 2020      jr      nz,$9dd3
9db3 2020      jr      nz,$9dd5
9db5 2020      jr      nz,$9dd7
9db7 2020      jr      nz,$9dd9
9db9 2020      jr      nz,$9ddb
9dbb 2020      jr      nz,$9ddd
9dbd 2020      jr      nz,$9ddf
9dbf 2020      jr      nz,$9de1
9dc1 2020      jr      nz,$9de3
9dc3 2020      jr      nz,$9de5
9dc5 2020      jr      nz,$9de7
9dc7 2020      jr      nz,$9de9
9dc9 2020      jr      nz,$9deb
9dcb 2020      jr      nz,$9ded
9dcd 2020      jr      nz,$9def
9dcf 2020      jr      nz,$9df1
9dd1 2020      jr      nz,$9df3
9dd3 2020      jr      nz,$9df5
9dd5 2020      jr      nz,$9df7
9dd7 2020      jr      nz,$9df9
9dd9 2020      jr      nz,$9dfb
9ddb 2020      jr      nz,$9dfd
9ddd 2020      jr      nz,$9dff
9ddf 2020      jr      nz,$9e01
9de1 2020      jr      nz,$9e03
9de3 2020      jr      nz,$9e05
9de5 2020      jr      nz,$9e07
9de7 2020      jr      nz,$9e09
9de9 2020      jr      nz,$9e0b
9deb 2020      jr      nz,$9e0d
9ded 2020      jr      nz,$9e0f
9def 2020      jr      nz,$9e11
9df1 2020      jr      nz,$9e13
9df3 2020      jr      nz,$9e15
9df5 2020      jr      nz,$9e17
9df7 2020      jr      nz,$9e19
9df9 2020      jr      nz,$9e1b
9dfb 2020      jr      nz,$9e1d
9dfd 2020      jr      nz,$9e1f
9dff 2020      jr      nz,$9e21
9e01 2020      jr      nz,$9e23
9e03 2020      jr      nz,$9e25
9e05 2020      jr      nz,$9e27
9e07 2020      jr      nz,$9e29
9e09 2020      jr      nz,$9e2b
9e0b 2020      jr      nz,$9e2d
9e0d 2020      jr      nz,$9e2f
9e0f 2020      jr      nz,$9e31
9e11 2020      jr      nz,$9e33
9e13 2020      jr      nz,$9e35
9e15 2020      jr      nz,$9e37
9e17 2020      jr      nz,$9e39
9e19 2020      jr      nz,$9e3b
9e1b 2020      jr      nz,$9e3d
9e1d 2020      jr      nz,$9e3f
9e1f 2020      jr      nz,$9e41
9e21 2020      jr      nz,$9e43
9e23 2020      jr      nz,$9e45
9e25 2020      jr      nz,$9e47
9e27 2020      jr      nz,$9e49
9e29 2020      jr      nz,$9e4b
9e2b 2020      jr      nz,$9e4d
9e2d 2020      jr      nz,$9e4f
9e2f 2020      jr      nz,$9e51
9e31 2020      jr      nz,$9e53
9e33 2020      jr      nz,$9e55
9e35 2020      jr      nz,$9e57
9e37 2020      jr      nz,$9e59
9e39 2020      jr      nz,$9e5b
9e3b 2020      jr      nz,$9e5d
9e3d 2020      jr      nz,$9e5f
9e3f 2020      jr      nz,$9e61
9e41 2020      jr      nz,$9e63
9e43 2020      jr      nz,$9e65
9e45 2020      jr      nz,$9e67
9e47 2020      jr      nz,$9e69
9e49 2020      jr      nz,$9e6b
9e4b 2020      jr      nz,$9e6d
9e4d 2020      jr      nz,$9e6f
9e4f 2020      jr      nz,$9e71
9e51 2020      jr      nz,$9e73
9e53 2020      jr      nz,$9e75
9e55 2020      jr      nz,$9e77
9e57 2020      jr      nz,$9e79
9e59 2020      jr      nz,$9e7b
9e5b 2020      jr      nz,$9e7d
9e5d 2020      jr      nz,$9e7f
9e5f 2020      jr      nz,$9e81
9e61 2020      jr      nz,$9e83
9e63 2020      jr      nz,$9e85
9e65 2020      jr      nz,$9e87
9e67 2020      jr      nz,$9e89
9e69 2020      jr      nz,$9e8b
9e6b 2020      jr      nz,$9e8d
9e6d 2020      jr      nz,$9e8f
9e6f 2020      jr      nz,$9e91
9e71 2020      jr      nz,$9e93
9e73 2020      jr      nz,$9e95
9e75 2020      jr      nz,$9e97
9e77 2020      jr      nz,$9e99
9e79 2020      jr      nz,$9e9b
9e7b 2020      jr      nz,$9e9d
9e7d 2020      jr      nz,$9e9f
9e7f 2020      jr      nz,$9ea1
9e81 2020      jr      nz,$9ea3
9e83 2020      jr      nz,$9ea5
9e85 2020      jr      nz,$9ea7
9e87 2020      jr      nz,$9ea9
9e89 2020      jr      nz,$9eab
9e8b 2020      jr      nz,$9ead
9e8d 2020      jr      nz,$9eaf
9e8f 2020      jr      nz,$9eb1
9e91 2020      jr      nz,$9eb3
9e93 2020      jr      nz,$9eb5
9e95 2020      jr      nz,$9eb7
9e97 2020      jr      nz,$9eb9
9e99 2020      jr      nz,$9ebb
9e9b 2020      jr      nz,$9ebd
9e9d 2020      jr      nz,$9ebf
9e9f 2020      jr      nz,$9ec1
9ea1 2020      jr      nz,$9ec3
9ea3 2020      jr      nz,$9ec5
9ea5 2020      jr      nz,$9ec7
9ea7 2020      jr      nz,$9ec9
9ea9 2020      jr      nz,$9ecb
9eab 2020      jr      nz,$9ecd
9ead 2020      jr      nz,$9ecf
9eaf 2020      jr      nz,$9ed1
9eb1 2020      jr      nz,$9ed3
9eb3 2020      jr      nz,$9ed5
9eb5 2020      jr      nz,$9ed7
9eb7 2020      jr      nz,$9ed9
9eb9 2020      jr      nz,$9edb
9ebb 2020      jr      nz,$9edd
9ebd 2020      jr      nz,$9edf
9ebf 2020      jr      nz,$9ee1
9ec1 2020      jr      nz,$9ee3
9ec3 2020      jr      nz,$9ee5
9ec5 2020      jr      nz,$9ee7
9ec7 2020      jr      nz,$9ee9
9ec9 2020      jr      nz,$9eeb
9ecb 2020      jr      nz,$9eed
9ecd 2020      jr      nz,$9eef
9ecf 2020      jr      nz,$9ef1
9ed1 2020      jr      nz,$9ef3
9ed3 2020      jr      nz,$9ef5
9ed5 2020      jr      nz,$9ef7
9ed7 2020      jr      nz,$9ef9
9ed9 2020      jr      nz,$9efb
9edb 2020      jr      nz,$9efd
9edd 2020      jr      nz,$9eff
9edf 2020      jr      nz,$9f01
9ee1 2020      jr      nz,$9f03
9ee3 2020      jr      nz,$9f05
9ee5 2020      jr      nz,$9f07
9ee7 2020      jr      nz,$9f09
9ee9 2020      jr      nz,$9f0b
9eeb 2020      jr      nz,$9f0d
9eed 2020      jr      nz,$9f0f
9eef 2020      jr      nz,$9f11
9ef1 2020      jr      nz,$9f13
9ef3 2020      jr      nz,$9f15
9ef5 2020      jr      nz,$9f17
9ef7 2020      jr      nz,$9f19
9ef9 2020      jr      nz,$9f1b
9efb 2020      jr      nz,$9f1d
9efd 2020      jr      nz,$9f1f
9eff 2020      jr      nz,$9f21
9f01 2020      jr      nz,$9f23
9f03 2020      jr      nz,$9f25
9f05 2020      jr      nz,$9f27
9f07 2020      jr      nz,$9f29
9f09 2020      jr      nz,$9f2b
9f0b 2020      jr      nz,$9f2d
9f0d 2020      jr      nz,$9f2f
9f0f 2020      jr      nz,$9f31
9f11 2020      jr      nz,$9f33
9f13 2020      jr      nz,$9f35
9f15 2020      jr      nz,$9f37
9f17 2020      jr      nz,$9f39
9f19 2020      jr      nz,$9f3b
9f1b 2020      jr      nz,$9f3d
9f1d 2020      jr      nz,$9f3f
9f1f 2020      jr      nz,$9f41
9f21 2020      jr      nz,$9f43
9f23 2020      jr      nz,$9f45
9f25 2020      jr      nz,$9f47
9f27 2020      jr      nz,$9f49
9f29 2020      jr      nz,$9f4b
9f2b 2020      jr      nz,$9f4d
9f2d 2020      jr      nz,$9f4f
9f2f 2020      jr      nz,$9f51
9f31 2020      jr      nz,$9f53
9f33 2020      jr      nz,$9f55
9f35 2020      jr      nz,$9f57
9f37 2020      jr      nz,$9f59
9f39 2020      jr      nz,$9f5b
9f3b 2020      jr      nz,$9f5d
9f3d 2020      jr      nz,$9f5f
9f3f 2020      jr      nz,$9f61
9f41 2020      jr      nz,$9f63
9f43 2020      jr      nz,$9f65
9f45 2020      jr      nz,$9f67
9f47 2020      jr      nz,$9f69
9f49 2020      jr      nz,$9f6b
9f4b 2020      jr      nz,$9f6d
9f4d 2020      jr      nz,$9f6f
9f4f 2020      jr      nz,$9f71
9f51 2020      jr      nz,$9f73
9f53 2020      jr      nz,$9f75
9f55 2020      jr      nz,$9f77
9f57 2020      jr      nz,$9f79
9f59 2020      jr      nz,$9f7b
9f5b 2020      jr      nz,$9f7d
9f5d 2020      jr      nz,$9f7f
9f5f 2020      jr      nz,$9f81
9f61 2020      jr      nz,$9f83
9f63 2020      jr      nz,$9f85
9f65 2020      jr      nz,$9f87
9f67 2020      jr      nz,$9f89
9f69 2020      jr      nz,$9f8b
9f6b 2020      jr      nz,$9f8d
9f6d 2020      jr      nz,$9f8f
9f6f 2020      jr      nz,$9f91
9f71 2020      jr      nz,$9f93
9f73 2020      jr      nz,$9f95
9f75 2020      jr      nz,$9f97
9f77 2020      jr      nz,$9f99
9f79 2020      jr      nz,$9f9b
9f7b 2020      jr      nz,$9f9d
9f7d 2020      jr      nz,$9f9f
9f7f 2020      jr      nz,$9fa1
9f81 2020      jr      nz,$9fa3
9f83 2020      jr      nz,$9fa5
9f85 2020      jr      nz,$9fa7
9f87 2020      jr      nz,$9fa9
9f89 2020      jr      nz,$9fab
9f8b 2020      jr      nz,$9fad
9f8d 2020      jr      nz,$9faf
9f8f 2020      jr      nz,$9fb1
9f91 2020      jr      nz,$9fb3
9f93 2020      jr      nz,$9fb5
9f95 2020      jr      nz,$9fb7
9f97 2020      jr      nz,$9fb9
9f99 2020      jr      nz,$9fbb
9f9b 2020      jr      nz,$9fbd
9f9d 2020      jr      nz,$9fbf
9f9f 2020      jr      nz,$9fc1
9fa1 2020      jr      nz,$9fc3
9fa3 2020      jr      nz,$9fc5
9fa5 2020      jr      nz,$9fc7
9fa7 2020      jr      nz,$9fc9
9fa9 2020      jr      nz,$9fcb
9fab 2020      jr      nz,$9fcd
9fad 2020      jr      nz,$9fcf
9faf 2020      jr      nz,$9fd1
9fb1 2020      jr      nz,$9fd3
9fb3 2020      jr      nz,$9fd5
9fb5 2020      jr      nz,$9fd7
9fb7 2020      jr      nz,$9fd9
9fb9 2020      jr      nz,$9fdb
9fbb 2020      jr      nz,$9fdd
9fbd 2020      jr      nz,$9fdf
9fbf 2020      jr      nz,$9fe1
9fc1 2020      jr      nz,$9fe3
9fc3 2020      jr      nz,$9fe5
9fc5 2020      jr      nz,$9fe7
9fc7 2020      jr      nz,$9fe9
9fc9 2020      jr      nz,$9feb
9fcb 2020      jr      nz,$9fed
9fcd 2020      jr      nz,$9fef
9fcf 2020      jr      nz,$9ff1
9fd1 2020      jr      nz,$9ff3
9fd3 2020      jr      nz,$9ff5
9fd5 2020      jr      nz,$9ff7
9fd7 2020      jr      nz,$9ff9
9fd9 2020      jr      nz,$9ffb
9fdb 2020      jr      nz,$9ffd
9fdd 2020      jr      nz,$9fff
9fdf 2020      jr      nz,$a001
9fe1 2020      jr      nz,$a003
9fe3 2020      jr      nz,$a005
9fe5 2020      jr      nz,$a007
9fe7 2020      jr      nz,$a009
9fe9 2020      jr      nz,$a00b
9feb 2020      jr      nz,$a00d
9fed 2020      jr      nz,$a00f
9fef 2020      jr      nz,$a011
9ff1 2020      jr      nz,$a013
9ff3 2020      jr      nz,$a015
9ff5 2020      jr      nz,$a017
9ff7 2020      jr      nz,$a019
9ff9 2020      jr      nz,$a01b
9ffb 2020      jr      nz,$a01d
9ffd 2020      jr      nz,$a01f
9fff 2020      jr      nz,$a021
a001 2020      jr      nz,$a023
a003 2020      jr      nz,$a025
a005 2020      jr      nz,$a027
a007 2020      jr      nz,$a029
a009 2020      jr      nz,$a02b
a00b 2020      jr      nz,$a02d
a00d 2020      jr      nz,$a02f
a00f 2020      jr      nz,$a031
a011 2020      jr      nz,$a033
a013 2020      jr      nz,$a035
a015 2020      jr      nz,$a037
a017 2020      jr      nz,$a039
a019 2020      jr      nz,$a03b
a01b 2020      jr      nz,$a03d
a01d 2020      jr      nz,$a03f
a01f 2020      jr      nz,$a041
a021 2020      jr      nz,$a043
a023 2020      jr      nz,$a045
a025 2020      jr      nz,$a047
a027 2020      jr      nz,$a049
a029 2020      jr      nz,$a04b
a02b 2020      jr      nz,$a04d
a02d 2020      jr      nz,$a04f
a02f 2020      jr      nz,$a051
a031 2020      jr      nz,$a053
a033 2020      jr      nz,$a055
a035 2020      jr      nz,$a057
a037 2020      jr      nz,$a059
a039 2020      jr      nz,$a05b
a03b 2020      jr      nz,$a05d
a03d 2020      jr      nz,$a05f
a03f 2020      jr      nz,$a061
a041 2020      jr      nz,$a063
a043 2020      jr      nz,$a065
a045 2020      jr      nz,$a067
a047 2020      jr      nz,$a069
a049 2020      jr      nz,$a06b
a04b 2020      jr      nz,$a06d
a04d 2020      jr      nz,$a06f
a04f 2020      jr      nz,$a071
a051 2020      jr      nz,$a073
a053 2020      jr      nz,$a075
a055 2020      jr      nz,$a077
a057 2020      jr      nz,$a079
a059 2020      jr      nz,$a07b
a05b 2020      jr      nz,$a07d
a05d 2020      jr      nz,$a07f
a05f 2020      jr      nz,$a081
a061 2020      jr      nz,$a083
a063 2020      jr      nz,$a085
a065 2020      jr      nz,$a087
a067 2020      jr      nz,$a089
a069 2020      jr      nz,$a08b
a06b 2020      jr      nz,$a08d
a06d 2020      jr      nz,$a08f
a06f 2020      jr      nz,$a091
a071 2020      jr      nz,$a093
a073 2020      jr      nz,$a095
a075 2020      jr      nz,$a097
a077 2020      jr      nz,$a099
a079 2020      jr      nz,$a09b
a07b 2020      jr      nz,$a09d
a07d 2020      jr      nz,$a09f
a07f 2020      jr      nz,$a0a1
a081 2020      jr      nz,$a0a3
a083 2020      jr      nz,$a0a5
a085 2020      jr      nz,$a0a7
a087 2020      jr      nz,$a0a9
a089 2020      jr      nz,$a0ab
a08b 2020      jr      nz,$a0ad
a08d 2020      jr      nz,$a0af
a08f 2020      jr      nz,$a0b1
a091 2020      jr      nz,$a0b3
a093 2020      jr      nz,$a0b5
a095 2020      jr      nz,$a0b7
a097 2020      jr      nz,$a0b9
a099 2020      jr      nz,$a0bb
a09b 2020      jr      nz,$a0bd
a09d 2020      jr      nz,$a0bf
a09f 2020      jr      nz,$a0c1
a0a1 2020      jr      nz,$a0c3
a0a3 2020      jr      nz,$a0c5
a0a5 2020      jr      nz,$a0c7
a0a7 2020      jr      nz,$a0c9
a0a9 2020      jr      nz,$a0cb
a0ab 2020      jr      nz,$a0cd
a0ad 2020      jr      nz,$a0cf
a0af 2020      jr      nz,$a0d1
a0b1 2020      jr      nz,$a0d3
a0b3 2020      jr      nz,$a0d5
a0b5 2020      jr      nz,$a0d7
a0b7 2020      jr      nz,$a0d9
a0b9 2020      jr      nz,$a0db
a0bb 2020      jr      nz,$a0dd
a0bd 2020      jr      nz,$a0df
a0bf 2020      jr      nz,$a0e1
a0c1 2020      jr      nz,$a0e3
a0c3 2020      jr      nz,$a0e5
a0c5 2020      jr      nz,$a0e7
a0c7 2020      jr      nz,$a0e9
a0c9 2020      jr      nz,$a0eb
a0cb 2020      jr      nz,$a0ed
a0cd 2020      jr      nz,$a0ef
a0cf 2020      jr      nz,$a0f1
a0d1 2020      jr      nz,$a0f3
a0d3 2020      jr      nz,$a0f5
a0d5 2020      jr      nz,$a0f7
a0d7 2020      jr      nz,$a0f9
a0d9 2020      jr      nz,$a0fb
a0db 2020      jr      nz,$a0fd
a0dd 2020      jr      nz,$a0ff
a0df 2020      jr      nz,$a101
a0e1 2020      jr      nz,$a103
a0e3 2020      jr      nz,$a105
a0e5 2020      jr      nz,$a107
a0e7 2020      jr      nz,$a109
a0e9 2020      jr      nz,$a10b
a0eb 2020      jr      nz,$a10d
a0ed 2020      jr      nz,$a10f
a0ef 2020      jr      nz,$a111
a0f1 2020      jr      nz,$a113
a0f3 2020      jr      nz,$a115
a0f5 2020      jr      nz,$a117
a0f7 2020      jr      nz,$a119
a0f9 2020      jr      nz,$a11b
a0fb 2020      jr      nz,$a11d
a0fd 2020      jr      nz,$a11f
a0ff 2020      jr      nz,$a121
a101 2020      jr      nz,$a123
a103 2020      jr      nz,$a125
a105 2020      jr      nz,$a127
a107 2020      jr      nz,$a129
a109 2020      jr      nz,$a12b
a10b 2020      jr      nz,$a12d
a10d 2020      jr      nz,$a12f
a10f 2020      jr      nz,$a131
a111 2020      jr      nz,$a133
a113 2020      jr      nz,$a135
a115 2020      jr      nz,$a137
a117 2020      jr      nz,$a139
a119 2020      jr      nz,$a13b
a11b 2020      jr      nz,$a13d
a11d 2020      jr      nz,$a13f
a11f 2020      jr      nz,$a141
a121 2020      jr      nz,$a143
a123 2020      jr      nz,$a145
a125 2020      jr      nz,$a147
a127 2020      jr      nz,$a149
a129 2020      jr      nz,$a14b
a12b 2020      jr      nz,$a14d
a12d 2020      jr      nz,$a14f
a12f 2020      jr      nz,$a151
a131 2020      jr      nz,$a153
a133 2020      jr      nz,$a155
a135 2020      jr      nz,$a157
a137 2020      jr      nz,$a159
a139 2020      jr      nz,$a15b
a13b 2020      jr      nz,$a15d
a13d 2020      jr      nz,$a15f
a13f 2020      jr      nz,$a161
a141 2020      jr      nz,$a163
a143 2020      jr      nz,$a165
a145 2020      jr      nz,$a167
a147 2020      jr      nz,$a169
a149 2020      jr      nz,$a16b
a14b 2020      jr      nz,$a16d
a14d 2020      jr      nz,$a16f
a14f 2020      jr      nz,$a171
a151 2020      jr      nz,$a173
a153 2020      jr      nz,$a175
a155 2020      jr      nz,$a177
a157 2020      jr      nz,$a179
a159 2020      jr      nz,$a17b
a15b 2020      jr      nz,$a17d
a15d 2020      jr      nz,$a17f
a15f 2020      jr      nz,$a181
a161 2020      jr      nz,$a183
a163 2020      jr      nz,$a185
a165 2020      jr      nz,$a187
a167 2020      jr      nz,$a189
a169 2020      jr      nz,$a18b
a16b 2020      jr      nz,$a18d
a16d 2020      jr      nz,$a18f
a16f 2020      jr      nz,$a191
a171 2020      jr      nz,$a193
a173 2020      jr      nz,$a195
a175 2020      jr      nz,$a197
a177 2020      jr      nz,$a199
a179 2020      jr      nz,$a19b
a17b 2020      jr      nz,$a19d
a17d 2020      jr      nz,$a19f
a17f 2020      jr      nz,$a1a1
a181 2020      jr      nz,$a1a3
a183 2020      jr      nz,$a1a5
a185 2020      jr      nz,$a1a7
a187 2020      jr      nz,$a1a9
a189 2020      jr      nz,$a1ab
a18b 2020      jr      nz,$a1ad
a18d 2020      jr      nz,$a1af
a18f 2020      jr      nz,$a1b1
a191 2020      jr      nz,$a1b3
a193 2020      jr      nz,$a1b5
a195 2020      jr      nz,$a1b7
a197 2020      jr      nz,$a1b9
a199 2020      jr      nz,$a1bb
a19b 2020      jr      nz,$a1bd
a19d 2020      jr      nz,$a1bf
a19f 2020      jr      nz,$a1c1
a1a1 2020      jr      nz,$a1c3
a1a3 2020      jr      nz,$a1c5
a1a5 2020      jr      nz,$a1c7
a1a7 2020      jr      nz,$a1c9
a1a9 2020      jr      nz,$a1cb
a1ab 2020      jr      nz,$a1cd
a1ad 2020      jr      nz,$a1cf
a1af 2020      jr      nz,$a1d1
a1b1 2020      jr      nz,$a1d3
a1b3 2020      jr      nz,$a1d5
a1b5 2020      jr      nz,$a1d7
a1b7 2020      jr      nz,$a1d9
a1b9 2020      jr      nz,$a1db
a1bb 2020      jr      nz,$a1dd
a1bd 2020      jr      nz,$a1df
a1bf 2020      jr      nz,$a1e1
a1c1 2020      jr      nz,$a1e3
a1c3 2020      jr      nz,$a1e5
a1c5 2020      jr      nz,$a1e7
a1c7 2020      jr      nz,$a1e9
a1c9 2020      jr      nz,$a1eb
a1cb 2020      jr      nz,$a1ed
a1cd 2020      jr      nz,$a1ef
a1cf 2020      jr      nz,$a1f1
a1d1 2020      jr      nz,$a1f3
a1d3 2020      jr      nz,$a1f5
a1d5 2020      jr      nz,$a1f7
a1d7 2020      jr      nz,$a1f9
a1d9 2020      jr      nz,$a1fb
a1db 2020      jr      nz,$a1fd
a1dd 2020      jr      nz,$a1ff
a1df 2020      jr      nz,$a201
a1e1 2020      jr      nz,$a203
a1e3 2020      jr      nz,$a205
a1e5 2020      jr      nz,$a207
a1e7 2020      jr      nz,$a209
a1e9 2020      jr      nz,$a20b
a1eb 2020      jr      nz,$a20d
a1ed 2020      jr      nz,$a20f
a1ef 2020      jr      nz,$a211
a1f1 2020      jr      nz,$a213
a1f3 2020      jr      nz,$a215
a1f5 2020      jr      nz,$a217
a1f7 2020      jr      nz,$a219
a1f9 2020      jr      nz,$a21b
a1fb 2020      jr      nz,$a21d
a1fd 2020      jr      nz,$a21f
a1ff 2020      jr      nz,$a221
a201 2020      jr      nz,$a223
a203 2020      jr      nz,$a225
a205 2020      jr      nz,$a227
a207 2020      jr      nz,$a229
a209 2020      jr      nz,$a22b
a20b 2020      jr      nz,$a22d
a20d 2020      jr      nz,$a22f
a20f 2020      jr      nz,$a231
a211 2020      jr      nz,$a233
a213 2020      jr      nz,$a235
a215 2020      jr      nz,$a237
a217 2020      jr      nz,$a239
a219 2020      jr      nz,$a23b
a21b 2020      jr      nz,$a23d
a21d 2020      jr      nz,$a23f
a21f 2020      jr      nz,$a241
a221 2020      jr      nz,$a243
a223 2020      jr      nz,$a245
a225 2020      jr      nz,$a247
a227 2020      jr      nz,$a249
a229 2020      jr      nz,$a24b
a22b 2020      jr      nz,$a24d
a22d 2020      jr      nz,$a24f
a22f 2020      jr      nz,$a251
a231 2020      jr      nz,$a253
a233 2020      jr      nz,$a255
a235 2020      jr      nz,$a257
a237 2020      jr      nz,$a259
a239 2020      jr      nz,$a25b
a23b 2020      jr      nz,$a25d
a23d 2020      jr      nz,$a25f
a23f 2020      jr      nz,$a261
a241 2020      jr      nz,$a263
a243 2020      jr      nz,$a265
a245 2020      jr      nz,$a267
a247 2020      jr      nz,$a269
a249 2020      jr      nz,$a26b
a24b 2020      jr      nz,$a26d
a24d 2020      jr      nz,$a26f
a24f 2020      jr      nz,$a271
a251 2020      jr      nz,$a273
a253 2020      jr      nz,$a275
a255 2020      jr      nz,$a277
a257 2020      jr      nz,$a279
a259 2020      jr      nz,$a27b
a25b 2020      jr      nz,$a27d
a25d 2020      jr      nz,$a27f
a25f 2020      jr      nz,$a281
a261 2020      jr      nz,$a283
a263 2020      jr      nz,$a285
a265 2020      jr      nz,$a287
a267 2020      jr      nz,$a289
a269 2020      jr      nz,$a28b
a26b 2020      jr      nz,$a28d
a26d 2020      jr      nz,$a28f
a26f 2020      jr      nz,$a291
a271 2020      jr      nz,$a293
a273 2020      jr      nz,$a295
a275 2020      jr      nz,$a297
a277 2020      jr      nz,$a299
a279 2020      jr      nz,$a29b
a27b 2020      jr      nz,$a29d
a27d 2020      jr      nz,$a29f
a27f 2020      jr      nz,$a2a1
a281 2020      jr      nz,$a2a3
a283 2020      jr      nz,$a2a5
a285 2020      jr      nz,$a2a7
a287 2020      jr      nz,$a2a9
a289 2020      jr      nz,$a2ab
a28b 2020      jr      nz,$a2ad
a28d 2020      jr      nz,$a2af
a28f 2020      jr      nz,$a2b1
a291 2020      jr      nz,$a2b3
a293 2020      jr      nz,$a2b5
a295 2020      jr      nz,$a2b7
a297 2020      jr      nz,$a2b9
a299 2020      jr      nz,$a2bb
a29b 2020      jr      nz,$a2bd
a29d 2020      jr      nz,$a2bf
a29f 2020      jr      nz,$a2c1
a2a1 2020      jr      nz,$a2c3
a2a3 2020      jr      nz,$a2c5
a2a5 2020      jr      nz,$a2c7
a2a7 2020      jr      nz,$a2c9
a2a9 2020      jr      nz,$a2cb
a2ab 2020      jr      nz,$a2cd
a2ad 2020      jr      nz,$a2cf
a2af 2020      jr      nz,$a2d1
a2b1 2020      jr      nz,$a2d3
a2b3 2020      jr      nz,$a2d5
a2b5 2020      jr      nz,$a2d7
a2b7 2020      jr      nz,$a2d9
a2b9 2020      jr      nz,$a2db
a2bb 2020      jr      nz,$a2dd
a2bd 2020      jr      nz,$a2df
a2bf 2020      jr      nz,$a2e1
a2c1 2020      jr      nz,$a2e3
a2c3 2020      jr      nz,$a2e5
a2c5 2020      jr      nz,$a2e7
a2c7 2020      jr      nz,$a2e9
a2c9 2020      jr      nz,$a2eb
a2cb 2020      jr      nz,$a2ed
a2cd 2020      jr      nz,$a2ef
a2cf 2020      jr      nz,$a2f1
a2d1 2020      jr      nz,$a2f3
a2d3 2020      jr      nz,$a2f5
a2d5 2020      jr      nz,$a2f7
a2d7 2020      jr      nz,$a2f9
a2d9 2020      jr      nz,$a2fb
a2db 2020      jr      nz,$a2fd
a2dd 2020      jr      nz,$a2ff
a2df 2020      jr      nz,$a301
a2e1 2020      jr      nz,$a303
a2e3 2020      jr      nz,$a305
a2e5 2020      jr      nz,$a307
a2e7 2020      jr      nz,$a309
a2e9 2020      jr      nz,$a30b
a2eb 2020      jr      nz,$a30d
a2ed 2020      jr      nz,$a30f
a2ef 2020      jr      nz,$a311
a2f1 2020      jr      nz,$a313
a2f3 2020      jr      nz,$a315
a2f5 2020      jr      nz,$a317
a2f7 2020      jr      nz,$a319
a2f9 2020      jr      nz,$a31b
a2fb 2020      jr      nz,$a31d
a2fd 2020      jr      nz,$a31f
a2ff 2020      jr      nz,$a321
a301 2020      jr      nz,$a323
a303 2020      jr      nz,$a325
a305 2020      jr      nz,$a327
a307 2020      jr      nz,$a329
a309 2020      jr      nz,$a32b
a30b 2020      jr      nz,$a32d
a30d 2020      jr      nz,$a32f
a30f 2020      jr      nz,$a331
a311 2020      jr      nz,$a333
a313 2020      jr      nz,$a335
a315 2020      jr      nz,$a337
a317 2020      jr      nz,$a339
a319 2020      jr      nz,$a33b
a31b 2020      jr      nz,$a33d
a31d 2020      jr      nz,$a33f
a31f 2020      jr      nz,$a341
a321 2020      jr      nz,$a343
a323 2020      jr      nz,$a345
a325 2020      jr      nz,$a347
a327 2020      jr      nz,$a349
a329 2020      jr      nz,$a34b
a32b 2020      jr      nz,$a34d
a32d 2020      jr      nz,$a34f
a32f 2020      jr      nz,$a351
a331 2020      jr      nz,$a353
a333 2020      jr      nz,$a355
a335 2020      jr      nz,$a357
a337 2020      jr      nz,$a359
a339 2020      jr      nz,$a35b
a33b 2020      jr      nz,$a35d
a33d 2020      jr      nz,$a35f
a33f 2020      jr      nz,$a361
a341 2020      jr      nz,$a363
a343 2020      jr      nz,$a365
a345 2020      jr      nz,$a367
a347 2020      jr      nz,$a369
a349 2020      jr      nz,$a36b
a34b 2020      jr      nz,$a36d
a34d 2020      jr      nz,$a36f
a34f 2020      jr      nz,$a371
a351 2020      jr      nz,$a373
a353 2020      jr      nz,$a375
a355 2020      jr      nz,$a377
a357 2020      jr      nz,$a379
a359 2020      jr      nz,$a37b
a35b 2020      jr      nz,$a37d
a35d 2020      jr      nz,$a37f
a35f 2020      jr      nz,$a381
a361 2020      jr      nz,$a383
a363 2020      jr      nz,$a385
a365 2020      jr      nz,$a387
a367 2020      jr      nz,$a389
a369 2020      jr      nz,$a38b
a36b 2020      jr      nz,$a38d
a36d 2020      jr      nz,$a38f
a36f 2020      jr      nz,$a391
a371 2020      jr      nz,$a393
a373 2020      jr      nz,$a395
a375 2020      jr      nz,$a397
a377 2020      jr      nz,$a399
a379 2020      jr      nz,$a39b
a37b 2020      jr      nz,$a39d
a37d 2020      jr      nz,$a39f
a37f 2020      jr      nz,$a3a1
a381 2020      jr      nz,$a3a3
a383 2020      jr      nz,$a3a5
a385 2020      jr      nz,$a3a7
a387 2020      jr      nz,$a3a9
a389 2020      jr      nz,$a3ab
a38b 2020      jr      nz,$a3ad
a38d 2020      jr      nz,$a3af
a38f 2020      jr      nz,$a3b1
a391 2020      jr      nz,$a3b3
a393 2020      jr      nz,$a3b5
a395 2020      jr      nz,$a3b7
a397 2020      jr      nz,$a3b9
a399 2020      jr      nz,$a3bb
a39b 2020      jr      nz,$a3bd
a39d 2020      jr      nz,$a3bf
a39f 2020      jr      nz,$a3c1
a3a1 2020      jr      nz,$a3c3
a3a3 2020      jr      nz,$a3c5
a3a5 2020      jr      nz,$a3c7
a3a7 2020      jr      nz,$a3c9
a3a9 2020      jr      nz,$a3cb
a3ab 2020      jr      nz,$a3cd
a3ad 2020      jr      nz,$a3cf
a3af 2020      jr      nz,$a3d1
a3b1 2020      jr      nz,$a3d3
a3b3 2020      jr      nz,$a3d5
a3b5 2020      jr      nz,$a3d7
a3b7 2020      jr      nz,$a3d9
a3b9 2020      jr      nz,$a3db
a3bb 2020      jr      nz,$a3dd
a3bd 2020      jr      nz,$a3df
a3bf 2020      jr      nz,$a3e1
a3c1 2020      jr      nz,$a3e3
a3c3 2020      jr      nz,$a3e5
a3c5 2020      jr      nz,$a3e7
a3c7 2020      jr      nz,$a3e9
a3c9 2020      jr      nz,$a3eb
a3cb 2020      jr      nz,$a3ed
a3cd 2020      jr      nz,$a3ef
a3cf 2020      jr      nz,$a3f1
a3d1 2020      jr      nz,$a3f3
a3d3 2020      jr      nz,$a3f5
a3d5 2020      jr      nz,$a3f7
a3d7 2020      jr      nz,$a3f9
a3d9 2020      jr      nz,$a3fb
a3db 2020      jr      nz,$a3fd
a3dd 2020      jr      nz,$a3ff
a3df 2020      jr      nz,$a401
a3e1 2020      jr      nz,$a403
a3e3 2020      jr      nz,$a405
a3e5 2020      jr      nz,$a407
a3e7 2020      jr      nz,$a409
a3e9 2020      jr      nz,$a40b
a3eb 2020      jr      nz,$a40d
a3ed 2020      jr      nz,$a40f
a3ef 2020      jr      nz,$a411
a3f1 2020      jr      nz,$a413
a3f3 2020      jr      nz,$a415
a3f5 2020      jr      nz,$a417
a3f7 2020      jr      nz,$a419
a3f9 2020      jr      nz,$a41b
a3fb 2020      jr      nz,$a41d
a3fd 2020      jr      nz,$a41f
a3ff 2020      jr      nz,$a421
a401 2020      jr      nz,$a423
a403 2020      jr      nz,$a425
a405 2020      jr      nz,$a427
a407 2020      jr      nz,$a429
a409 2020      jr      nz,$a42b
a40b 2020      jr      nz,$a42d
a40d 2020      jr      nz,$a42f
a40f 2020      jr      nz,$a431
a411 2020      jr      nz,$a433
a413 2020      jr      nz,$a435
a415 2020      jr      nz,$a437
a417 2020      jr      nz,$a439
a419 2020      jr      nz,$a43b
a41b 2020      jr      nz,$a43d
a41d 2020      jr      nz,$a43f
a41f 2020      jr      nz,$a441
a421 2020      jr      nz,$a443
a423 2020      jr      nz,$a445
a425 2020      jr      nz,$a447
a427 2020      jr      nz,$a449
a429 2020      jr      nz,$a44b
a42b 2020      jr      nz,$a44d
a42d 2020      jr      nz,$a44f
a42f 2020      jr      nz,$a451
a431 2020      jr      nz,$a453
a433 2020      jr      nz,$a455
a435 2020      jr      nz,$a457
a437 2020      jr      nz,$a459
a439 2020      jr      nz,$a45b
a43b 2020      jr      nz,$a45d
a43d 2020      jr      nz,$a45f
a43f 2020      jr      nz,$a461
a441 2020      jr      nz,$a463
a443 2020      jr      nz,$a465
a445 2020      jr      nz,$a467
a447 2020      jr      nz,$a469
a449 2020      jr      nz,$a46b
a44b 2020      jr      nz,$a46d
a44d 2020      jr      nz,$a46f
a44f 2020      jr      nz,$a471
a451 2020      jr      nz,$a473
a453 2020      jr      nz,$a475
a455 2020      jr      nz,$a477
a457 2020      jr      nz,$a479
a459 2020      jr      nz,$a47b
a45b 2020      jr      nz,$a47d
a45d 2020      jr      nz,$a47f
a45f 2020      jr      nz,$a481
a461 2020      jr      nz,$a483
a463 2020      jr      nz,$a485
a465 2020      jr      nz,$a487
a467 2020      jr      nz,$a489
a469 2020      jr      nz,$a48b
a46b 2020      jr      nz,$a48d
a46d 2020      jr      nz,$a48f
a46f 2020      jr      nz,$a491
a471 2020      jr      nz,$a493
a473 2020      jr      nz,$a495
a475 2020      jr      nz,$a497
a477 2020      jr      nz,$a499
a479 2020      jr      nz,$a49b
a47b 2020      jr      nz,$a49d
a47d 2020      jr      nz,$a49f
a47f 2020      jr      nz,$a4a1
a481 2020      jr      nz,$a4a3
a483 2020      jr      nz,$a4a5
a485 2020      jr      nz,$a4a7
a487 2020      jr      nz,$a4a9
a489 2020      jr      nz,$a4ab
a48b 2020      jr      nz,$a4ad
a48d 2020      jr      nz,$a4af
a48f 2020      jr      nz,$a4b1
a491 2020      jr      nz,$a4b3
a493 2020      jr      nz,$a4b5
a495 2020      jr      nz,$a4b7
a497 2020      jr      nz,$a4b9
a499 2020      jr      nz,$a4bb
a49b 2020      jr      nz,$a4bd
a49d 2020      jr      nz,$a4bf
a49f 2020      jr      nz,$a4c1
a4a1 2020      jr      nz,$a4c3
a4a3 2020      jr      nz,$a4c5
a4a5 2020      jr      nz,$a4c7
a4a7 2020      jr      nz,$a4c9
a4a9 2020      jr      nz,$a4cb
a4ab 2020      jr      nz,$a4cd
a4ad 2020      jr      nz,$a4cf
a4af 2020      jr      nz,$a4d1
a4b1 2020      jr      nz,$a4d3
a4b3 2020      jr      nz,$a4d5
a4b5 2020      jr      nz,$a4d7
a4b7 2020      jr      nz,$a4d9
a4b9 2020      jr      nz,$a4db
a4bb 2020      jr      nz,$a4dd
a4bd 2020      jr      nz,$a4df
a4bf 2020      jr      nz,$a4e1
a4c1 2020      jr      nz,$a4e3
a4c3 2020      jr      nz,$a4e5
a4c5 2020      jr      nz,$a4e7
a4c7 2020      jr      nz,$a4e9
a4c9 2020      jr      nz,$a4eb
a4cb 2020      jr      nz,$a4ed
a4cd 2020      jr      nz,$a4ef
a4cf 2020      jr      nz,$a4f1
a4d1 2020      jr      nz,$a4f3
a4d3 2020      jr      nz,$a4f5
a4d5 2020      jr      nz,$a4f7
a4d7 2020      jr      nz,$a4f9
a4d9 2020      jr      nz,$a4fb
a4db 2020      jr      nz,$a4fd
a4dd 2020      jr      nz,$a4ff
a4df 2020      jr      nz,$a501
a4e1 2020      jr      nz,$a503
a4e3 2020      jr      nz,$a505
a4e5 2020      jr      nz,$a507
a4e7 2020      jr      nz,$a509
a4e9 2020      jr      nz,$a50b
a4eb 2020      jr      nz,$a50d
a4ed 2020      jr      nz,$a50f
a4ef 2020      jr      nz,$a511
a4f1 2020      jr      nz,$a513
a4f3 2020      jr      nz,$a515
a4f5 2020      jr      nz,$a517
a4f7 2020      jr      nz,$a519
a4f9 2020      jr      nz,$a51b
a4fb 2020      jr      nz,$a51d
a4fd 2020      jr      nz,$a51f
a4ff 2020      jr      nz,$a521
a501 2020      jr      nz,$a523
a503 2020      jr      nz,$a525
a505 2020      jr      nz,$a527
a507 2020      jr      nz,$a529
a509 2020      jr      nz,$a52b
a50b 2020      jr      nz,$a52d
a50d 2020      jr      nz,$a52f
a50f 2020      jr      nz,$a531
a511 2020      jr      nz,$a533
a513 2020      jr      nz,$a535
a515 2020      jr      nz,$a537
a517 2020      jr      nz,$a539
a519 2020      jr      nz,$a53b
a51b 2020      jr      nz,$a53d
a51d 2020      jr      nz,$a53f
a51f 2020      jr      nz,$a541
a521 2020      jr      nz,$a543
a523 2020      jr      nz,$a545
a525 2020      jr      nz,$a547
a527 2020      jr      nz,$a549
a529 2020      jr      nz,$a54b
a52b 2020      jr      nz,$a54d
a52d 2020      jr      nz,$a54f
a52f 2020      jr      nz,$a551
a531 2020      jr      nz,$a553
a533 2020      jr      nz,$a555
a535 2020      jr      nz,$a557
a537 2020      jr      nz,$a559
a539 2020      jr      nz,$a55b
a53b 2020      jr      nz,$a55d
a53d 2020      jr      nz,$a55f
a53f 2020      jr      nz,$a561
a541 2020      jr      nz,$a563
a543 2020      jr      nz,$a565
a545 2020      jr      nz,$a567
a547 2020      jr      nz,$a569
a549 2020      jr      nz,$a56b
a54b 2020      jr      nz,$a56d
a54d 2020      jr      nz,$a56f
a54f 2020      jr      nz,$a571
a551 2020      jr      nz,$a573
a553 2020      jr      nz,$a575
a555 2020      jr      nz,$a577
a557 2000      jr      nz,$a559
a559 00        nop     
a55a 00        nop     
a55b 00        nop     
a55c 00        nop     
a55d 00        nop     
a55e 00        nop     
a55f 00        nop     
a560 00        nop     
a561 00        nop     
a562 00        nop     
a563 00        nop     
a564 00        nop     
a565 00        nop     
a566 00        nop     
a567 00        nop     
a568 00        nop     
a569 00        nop     
a56a 00        nop     
a56b 00        nop     
a56c 00        nop     
a56d 00        nop     
a56e 00        nop     
a56f 00        nop     
a570 00        nop     
a571 00        nop     
a572 00        nop     
a573 00        nop     
a574 00        nop     
a575 00        nop     
a576 00        nop     
a577 00        nop     
a578 00        nop     
a579 00        nop     
a57a 00        nop     
a57b 00        nop     
a57c 00        nop     
a57d 00        nop     
a57e 00        nop     
a57f 00        nop     
a580 00        nop     
a581 00        nop     
a582 00        nop     
a583 00        nop     
a584 00        nop     
a585 00        nop     
a586 00        nop     
a587 00        nop     
a588 00        nop     
a589 00        nop     
a58a 00        nop     
a58b 00        nop     
a58c 00        nop     
a58d 00        nop     
a58e 00        nop     
a58f 00        nop     
a590 00        nop     
a591 00        nop     
a592 00        nop     
a593 00        nop     
a594 00        nop     
a595 00        nop     
a596 00        nop     
a597 00        nop     
a598 00        nop     
a599 00        nop     
a59a 00        nop     
a59b 00        nop     
a59c 00        nop     
a59d 00        nop     
a59e 00        nop     
a59f 00        nop     
a5a0 00        nop     
a5a1 00        nop     
a5a2 00        nop     
a5a3 00        nop     
a5a4 00        nop     
a5a5 00        nop     
a5a6 00        nop     
a5a7 00        nop     
a5a8 2020      jr      nz,$a5ca
a5aa 2020      jr      nz,$a5cc
a5ac 2020      jr      nz,$a5ce
a5ae 2020      jr      nz,$a5d0
a5b0 2020      jr      nz,$a5d2
a5b2 2020      jr      nz,$a5d4
a5b4 2020      jr      nz,$a5d6
a5b6 2020      jr      nz,$a5d8
a5b8 2020      jr      nz,$a5da
a5ba 2020      jr      nz,$a5dc
a5bc 2020      jr      nz,$a5de
a5be 2020      jr      nz,$a5e0
a5c0 2020      jr      nz,$a5e2
a5c2 2020      jr      nz,$a5e4
a5c4 2020      jr      nz,$a5e6
a5c6 2020      jr      nz,$a5e8
a5c8 2020      jr      nz,$a5ea
a5ca 2020      jr      nz,$a5ec
a5cc 2020      jr      nz,$a5ee
a5ce 2020      jr      nz,$a5f0
a5d0 2020      jr      nz,$a5f2
a5d2 2020      jr      nz,$a5f4
a5d4 2020      jr      nz,$a5f6
a5d6 2020      jr      nz,$a5f8
a5d8 2640      ld      h,$40
a5da 1b        dec     de
a5db 00        nop     
a5dc ff        rst     $38
a5dd 00        nop     
a5de 15        dec     d
a5df 00        nop     
a5e0 df        rst     $18
a5e1 07        rlca    
a5e2 00        nop     
a5e3 05        dec     b
a5e4 00        nop     
a5e5 00        nop     
a5e6 00        nop     
a5e7 00        nop     
a5e8 00        nop     
a5e9 00        nop     
a5ea 00        nop     
a5eb 0a        ld      a,(bc)
a5ec d7        rst     $10
a5ed 23        inc     hl
a5ee 7b        ld      a,e
a5ef 010001    ld      bc,$0100
a5f2 00        nop     
a5f3 15        dec     d
a5f4 00        nop     
a5f5 00        nop     
a5f6 00        nop     
a5f7 ff        rst     $38
a5f8 00        nop     
a5f9 ff        rst     $38
a5fa ff        rst     $38
a5fb ff        rst     $38
a5fc ff        rst     $38
a5fd ff        rst     $38
a5fe ff        rst     $38
a5ff ff        rst     $38
a600 00        nop     
a601 00        nop     
a602 00        nop     
a603 00        nop     
a604 00        nop     
a605 00        nop     
a606 00        nop     
a607 00        nop     
a608 00        nop     
a609 00        nop     
a60a 00        nop     
a60b 00        nop     
a60c 00        nop     
a60d 00        nop     
a60e 00        nop     
a60f 00        nop     
a610 00        nop     
a611 00        nop     
a612 69        ld      l,c
a613 34        inc     (hl)
a614 228400    ld      ($0084),hl
a617 00        nop     
a618 00        nop     
a619 00        nop     
a61a 69        ld      l,c
a61b 34        inc     (hl)
a61c 228400    ld      ($0084),hl
a61f 00        nop     
a620 00        nop     
a621 00        nop     
a622 00        nop     
a623 00        nop     
a624 00        nop     
a625 00        nop     
a626 00        nop     
a627 00        nop     
a628 00        nop     
a629 00        nop     
a62a 00        nop     
a62b 00        nop     
a62c 00        nop     
a62d 00        nop     
a62e 00        nop     
a62f 00        nop     
a630 00        nop     
a631 00        nop     
a632 00        nop     
a633 00        nop     
a634 00        nop     
a635 00        nop     
a636 69        ld      l,c
a637 34        inc     (hl)
a638 228400    ld      ($0084),hl
a63b 00        nop     
a63c 00        nop     
a63d 00        nop     
a63e 00        nop     
a63f 00        nop     
a640 00        nop     
a641 00        nop     
a642 e4f170    call    po,$70f1
a645 83        add     a,e
a646 00        nop     
a647 00        nop     
a648 00        nop     
a649 00        nop     
a64a 00        nop     
a64b 00        nop     
a64c 00        nop     
a64d 00        nop     
a64e 51        ld      d,c
a64f ec597b    call    pe,$7b59
a652 d28438    jp      nc,$3884
a655 7a        ld      a,d
a656 1a        ld      a,(de)
a657 55        ld      d,l
a658 58        ld      e,b
a659 79        ld      a,c
a65a d28438    jp      nc,$3884
a65d 7a        ld      a,d
a65e 0a        ld      a,(bc)
a65f d7        rst     $10
a660 23        inc     hl
a661 7a        ld      a,d
a662 6d        ld      l,l
a663 0676      ld      b,$76
a665 7a        ld      a,d
a666 0b        dec     bc
a667 d7        rst     $10
a668 23        inc     hl
a669 7a        ld      a,d
a66a 00        nop     
a66b 00        nop     
a66c 00        nop     
a66d 00        nop     
a66e 00        nop     
a66f 00        nop     
a670 00        nop     
a671 00        nop     
a672 6f        ld      l,a
a673 0676      ld      b,$76
a675 7a        ld      a,d
a676 00        nop     
a677 00        nop     
a678 00        nop     
a679 00        nop     
a67a 00        nop     
a67b 00        nop     
a67c 00        nop     
a67d 00        nop     
a67e 010000    ld      bc,$0000
a681 81        add     a,c
a682 00        nop     
a683 00        nop     
a684 40        ld      b,b
a685 80        add     a,b
a686 7d        ld      a,l
a687 02        ld      (bc),a
a688 29        add     hl,hl
a689 80        add     a,b
a68a 0eb0      ld      c,$b0
a68c 75        ld      (hl),l
a68d 7d        ld      a,l
a68e 9a        sbc     a,d
a68f 5b        ld      e,e
a690 6a        ld      l,d
a691 72        ld      (hl),d
a692 04        inc     b
a693 7a        ld      a,d
a694 35        dec     (hl)
a695 7d        ld      a,l
a696 8a        adc     a,d
a697 ca627d    jp      z,$7d62
a69a 0eb0      ld      c,$b0
a69c 75        ld      (hl),l
a69d 7d        ld      a,l
a69e 9a        sbc     a,d
a69f 5b        ld      e,e
a6a0 6a        ld      l,d
a6a1 72        ld      (hl),d
a6a2 51        ld      d,c
a6a3 57        ld      d,a
a6a4 74        ld      (hl),h
a6a5 7d        ld      a,l
a6a6 29        add     hl,hl
a6a7 ad        xor     l
a6a8 187e      jr      $a728
a6aa 00        nop     
a6ab 00        nop     
a6ac 00        nop     
a6ad 00        nop     
a6ae 00        nop     
a6af 00        nop     
a6b0 00        nop     
a6b1 81        add     a,c
a6b2 00        nop     
a6b3 00        nop     
a6b4 00        nop     
a6b5 00        nop     
a6b6 cc223e    call    z,$3e22
a6b9 80        add     a,b
a6ba ba        cp      d
a6bb a6        and     (hl)
a6bc b5        or      l
a6bd a8        xor     b
a6be 42        ld      b,d
a6bf 41        ld      b,c
a6c0 52        ld      d,d
a6c1 2020      jr      nz,$a6e3
a6c3 2020      jr      nz,$a6e5
a6c5 2022      jr      nz,$a6e9
a6c7 58        ld      e,b
a6c8 a8        xor     b
a6c9 2a58a8    ld      hl,($a858)
a6cc 7e        ld      a,(hl)
a6cd b7        or      a
a6ce cad2a6    jp      z,$a6d2
a6d1 c9        ret     

a6d2 1198a8    ld      de,$a898
a6d5 215ca8    ld      hl,$a85c
a6d8 cd7556    call    $5675
a6db 329aa8    ld      ($a89a),a
a6de b7        or      a
a6df c249a7    jp      nz,$a749
a6e2 cd585a    call    $5a58
a6e5 019ba8    ld      bc,$a89b
a6e8 1198a8    ld      de,$a898
a6eb 219892    ld      hl,$9298
a6ee cd5052    call    $5250
a6f1 11cba7    ld      de,$a7cb
a6f4 2198a8    ld      hl,$a898
a6f7 cd4639    call    $3946
a6fa 329aa8    ld      ($a89a),a
a6fd b7        or      a
a6fe ca07a7    jp      z,$a707
a701 21cfa7    ld      hl,$a7cf
a704 cdc876    call    $76c8
a707 3eff      ld      a,$ff
a709 32718e    ld      ($8e71),a
a70c af        xor     a
a70d 32728e    ld      ($8e72),a
a710 af        xor     a
a711 32738e    ld      ($8e73),a
a714 2a98a8    ld      hl,($a898)
a717 22628e    ld      ($8e62),hl
a71a 3a708e    ld      a,($8e70)
a71d b7        or      a
a71e c230a7    jp      nz,$a730
a721 019da8    ld      bc,$a89d
a724 1198a8    ld      de,$a898
a727 219892    ld      hl,$9298
a72a cd4401    call    $0144
a72d c33ca7    jp      $a73c
a730 01a1a8    ld      bc,$a8a1
a733 11cba7    ld      de,$a7cb
a736 219ba8    ld      hl,$a89b
a739 cd4401    call    $0144
a73c 019ba8    ld      bc,$a89b
a73f 1198a8    ld      de,$a898
a742 219892    ld      hl,$9298
a745 cd2601    call    $0126
a748 c9        ret     

a749 11d3a7    ld      de,$a7d3
a74c 2198a8    ld      hl,$a898
a74f cd4639    call    $3946
a752 329aa8    ld      ($a89a),a
a755 b7        or      a
a756 c269a7    jp      nz,$a769
a759 af        xor     a
a75a 32ea8c    ld      ($8cea),a
a75d af        xor     a
a75e 32eb8c    ld      ($8ceb),a
a761 af        xor     a
a762 32ec8c    ld      ($8cec),a
a765 af        xor     a
a766 32ed8c    ld      ($8ced),a
a769 2a98a8    ld      hl,($a898)
a76c cdfe7f    call    $7ffe
a76f 09        add     hl,bc
a770 82        add     a,d
a771 a7        and     a
a772 89        adc     a,c
a773 a7        and     a
a774 90        sub     b
a775 a7        and     a
a776 95        sub     l
a777 a7        and     a
a778 9b        sbc     a,e
a779 a7        and     a
a77a a2        and     d
a77b a7        and     a
a77c a8        xor     b
a77d a7        and     a
a77e ae        xor     (hl)
a77f a7        and     a
a780 b4        or      h
a781 a7        and     a
a782 21f08c    ld      hl,$8cf0
a785 cd3556    call    $5635
a788 c9        ret     

a789 3a988e    ld      a,($8e98)
a78c 32ef8c    ld      ($8cef),a
a78f c9        ret     

a790 af        xor     a
a791 32708e    ld      ($8e70),a
a794 c9        ret     

a795 3eff      ld      a,$ff
a797 32708e    ld      ($8e70),a
a79a c9        ret     

a79b 21f88c    ld      hl,$8cf8
a79e cd3556    call    $5635
a7a1 c9        ret     

a7a2 3eff      ld      a,$ff
a7a4 32ea8c    ld      ($8cea),a
a7a7 c9        ret     

a7a8 3eff      ld      a,$ff
a7aa 32ed8c    ld      ($8ced),a
a7ad c9        ret     

a7ae 3eff      ld      a,$ff
a7b0 32ec8c    ld      ($8cec),a
a7b3 c9        ret     

a7b4 3eff      ld      a,$ff
a7b6 32eb8c    ld      ($8ceb),a
a7b9 3a5e90    ld      a,($905e)
a7bc 2f        cpl     
a7bd 329aa8    ld      ($a89a),a
a7c0 b7        or      a
a7c1 cacaa7    jp      z,$a7ca
a7c4 21f48c    ld      hl,$8cf4
a7c7 cd3556    call    $5635
a7ca c9        ret     

a7cb 010000    ld      bc,$0000
a7ce 00        nop     
a7cf 13        inc     de
a7d0 00        nop     
a7d1 00        nop     
a7d2 00        nop     
a7d3 0600      ld      b,$00
a7d5 00        nop     
a7d6 00        nop     
a7d7 01aaa8    ld      bc,$a8aa
a7da 11628e    ld      de,$8e62
a7dd 219892    ld      hl,$9298
a7e0 cd5052    call    $5250
a7e3 114fa8    ld      de,$a84f
a7e6 21628e    ld      hl,$8e62
a7e9 cd9238    call    $3892
a7ec 32aca8    ld      ($a8ac),a
a7ef b7        or      a
a7f0 caf9a7    jp      z,$a7f9
a7f3 2153a8    ld      hl,$a853
a7f6 cdc876    call    $76c8
a7f9 af        xor     a
a7fa 32718e    ld      ($8e71),a
a7fd 3eff      ld      a,$ff
a7ff 32738e    ld      ($8e73),a
a802 af        xor     a
a803 32728e    ld      ($8e72),a
a806 01ada8    ld      bc,$a8ad
a809 114ba8    ld      de,$a84b
a80c 21aaa8    ld      hl,$a8aa
a80f cd4401    call    $0144
a812 210100    ld      hl,$0001
a815 22b1a8    ld      ($a8b1),hl
a818 2ab1a8    ld      hl,($a8b1)
a81b 29        add     hl,hl
a81c 119692    ld      de,$9296
a81f 19        add     hl,de
a820 22b3a8    ld      ($a8b3),hl
a823 2ab3a8    ld      hl,($a8b3)
a826 eb        ex      de,hl
a827 21aaa8    ld      hl,$a8aa
a82a cd6201    call    $0162
a82d 2ab1a8    ld      hl,($a8b1)
a830 23        inc     hl
a831 eb        ex      de,hl
a832 2a628e    ld      hl,($8e62)
a835 eb        ex      de,hl
a836 7b        ld      a,e
a837 95        sub     l
a838 7a        ld      a,d
a839 9c        sbc     a,h
a83a f215a8    jp      p,$a815
a83d 3a888e    ld      a,($8e88)
a840 b7        or      a
a841 ca47a8    jp      z,$a847
a844 cd2001    call    $0120
a847 cd364f    call    $4f36
a84a c9        ret     

a84b 010000    ld      bc,$0000
a84e 00        nop     
a84f 00        nop     
a850 00        nop     
a851 00        nop     
a852 00        nop     
a853 13        inc     de
a854 00        nop     
a855 00        nop     
a856 00        nop     
a857 00        nop     
a858 d8        ret     c

a859 4e        ld      c,(hl)
a85a 00        nop     
a85b 00        nop     
a85c 09        add     hl,bc
a85d 00        nop     
a85e 0642      ld      b,$42
a860 41        ld      b,c
a861 53        ld      d,e
a862 45        ld      b,l
a863 7c        ld      a,h
a864 7c        ld      a,h
a865 c24153    jp      nz,$5341
a868 45        ld      b,l
a869 4c        ld      c,h
a86a 49        ld      c,c
a86b 48        ld      c,b
a86c 4f        ld      c,a
a86d 52        ld      d,d
a86e 49        ld      c,c
a86f 5a        ld      e,d
a870 4f        ld      c,a
a871 56        ld      d,(hl)
a872 45        ld      b,l
a873 52        ld      d,d
a874 54        ld      d,h
a875 49        ld      c,c
a876 43        ld      b,e
a877 57        ld      d,a
a878 49        ld      c,c
a879 44        ld      b,h
a87a 54        ld      d,h
a87b 48        ld      c,b
a87c 7c        ld      a,h
a87d 43        ld      b,e
a87e 4c        ld      c,h
a87f 55        ld      d,l
a880 53        ld      d,e
a881 54        ld      d,h
a882 45        ld      b,l
a883 53        ld      d,e
a884 54        ld      d,h
a885 41        ld      b,c
a886 43        ld      b,e
a887 4b        ld      c,e
a888 45        ld      b,l
a889 46        ld      b,(hl)
a88a 4c        ld      c,h
a88b 4f        ld      c,a
a88c 41        ld      b,c
a88d 54        ld      d,h
a88e 49        ld      c,c
a88f 50        ld      d,b
a890 45        ld      b,l
a891 52        ld      d,d
a892 43        ld      b,e
a893 45        ld      b,l
a894 4e        ld      c,(hl)
a895 00        nop     
a896 00        nop     
a897 00        nop     
a898 02        ld      (bc),a
a899 00        nop     
a89a 00        nop     
a89b 00        nop     
a89c 00        nop     
a89d 9b        sbc     a,e
a89e a8        xor     b
a89f cba7      res     4,a
a8a1 98        sbc     a,b
a8a2 92        sub     d
a8a3 98        sbc     a,b
a8a4 a8        xor     b
a8a5 00        nop     
a8a6 00        nop     
a8a7 00        nop     
a8a8 00        nop     
a8a9 00        nop     
a8aa 00        nop     
a8ab 00        nop     
a8ac 00        nop     
a8ad 98        sbc     a,b
a8ae 92        sub     d
a8af 62        ld      h,d
a8b0 8e        adc     a,(hl)
a8b1 00        nop     
a8b2 00        nop     
a8b3 00        nop     
a8b4 00        nop     
a8b5 b5        or      l
a8b6 a8        xor     b
a8b7 ef        rst     $28
a8b8 b0        or      b
a8b9 42        ld      b,d
a8ba 41        ld      b,c
a8bb 52        ld      d,d
a8bc 312020    ld      sp,$2020
a8bf 2020      jr      nz,$a8e1
a8c1 1113b0    ld      de,$b013
a8c4 219bb0    ld      hl,$b09b
a8c7 cd7556    call    $5675
a8ca 3215b0    ld      ($b015),a
a8cd b7        or      a
a8ce c2f2a8    jp      nz,$a8f2
a8d1 21088e    ld      hl,$8e08
a8d4 cdf801    call    $01f8
a8d7 2f        cpl     
a8d8 3215b0    ld      ($b015),a
a8db b7        or      a
a8dc cae5a8    jp      z,$a8e5
a8df 21d5a9    ld      hl,$a9d5
a8e2 cdc876    call    $76c8
a8e5 3a988e    ld      a,($8e98)
a8e8 32f6a5    ld      ($a5f6),a
a8eb 3a988e    ld      a,($8e98)
a8ee 32868e    ld      ($8e86),a
a8f1 c9        ret     

a8f2 2a13b0    ld      hl,($b013)
a8f5 cdfe7f    call    $7ffe
a8f8 08        ex      af,af'
a8f9 09        add     hl,bc
a8fa a9        xor     c
a8fb 17        rla     
a8fc a9        xor     c
a8fd 1ea9      ld      e,$a9
a8ff 31a93b    ld      sp,$3ba9
a902 a9        xor     c
a903 49        ld      c,c
a904 a9        xor     c
a905 5a        ld      e,d
a906 a9        xor     c
a907 64        ld      h,h
a908 a9        xor     c
a909 11d9a9    ld      de,$a9d9
a90c 21448e    ld      hl,$8e44
a90f cd9254    call    $5492
a912 af        xor     a
a913 32738d    ld      ($8d73),a
a916 c9        ret     

a917 3a988e    ld      a,($8e98)
a91a 32faa5    ld      ($a5fa),a
a91d c9        ret     

a91e 01d1a9    ld      bc,$a9d1
a921 114e8e    ld      de,$8e4e
a924 21e88d    ld      hl,$8de8
a927 cda353    call    $53a3
a92a 3a988e    ld      a,($8e98)
a92d 32838e    ld      ($8e83),a
a930 c9        ret     

a931 11d9a9    ld      de,$a9d9
a934 21488e    ld      hl,$8e48
a937 cd9254    call    $5492
a93a c9        ret     

a93b 3a988e    ld      a,($8e98)
a93e 2f        cpl     
a93f 32f6a5    ld      ($a5f6),a
a942 3a988e    ld      a,($8e98)
a945 32868e    ld      ($8e86),a
a948 c9        ret     

a949 21348e    ld      hl,$8e34
a94c cd3556    call    $5635
a94f 21388e    ld      hl,$8e38
a952 cd3556    call    $5635
a955 af        xor     a
a956 32738d    ld      ($8d73),a
a959 c9        ret     

a95a 11dda9    ld      de,$a9dd
a95d 2116b0    ld      hl,$b016
a960 cd9254    call    $5492
a963 c9        ret     

a964 1113b0    ld      de,$b013
a967 21ceb0    ld      hl,$b0ce
a96a cd7556    call    $5675
a96d 2f        cpl     
a96e 3215b0    ld      ($b015),a
a971 b7        or      a
a972 ca7ba9    jp      z,$a97b
a975 21d5a9    ld      hl,$a9d5
a978 cdc876    call    $76c8
a97b 2a13b0    ld      hl,($b013)
a97e cdfe7f    call    $7ffe
a981 05        dec     b
a982 8c        adc     a,h
a983 a9        xor     c
a984 95        sub     l
a985 a9        xor     c
a986 9f        sbc     a,a
a987 a9        xor     c
a988 aa        xor     d
a989 a9        xor     c
a98a caa9af    jp      z,$afa9
a98d 32fca5    ld      ($a5fc),a
a990 af        xor     a
a991 32fda5    ld      ($a5fd),a
a994 c9        ret     

a995 3eff      ld      a,$ff
a997 32fca5    ld      ($a5fc),a
a99a af        xor     a
a99b 32fda5    ld      ($a5fd),a
a99e c9        ret     

a99f 3eff      ld      a,$ff
a9a1 32fca5    ld      ($a5fc),a
a9a4 3eff      ld      a,$ff
a9a6 32fda5    ld      ($a5fd),a
a9a9 c9        ret     

a9aa 3a988e    ld      a,($8e98)
a9ad b7        or      a
a9ae cab7a9    jp      z,$a9b7
a9b1 2101a6    ld      hl,$a601
a9b4 cd3556    call    $5635
a9b7 3eff      ld      a,$ff
a9b9 32fca5    ld      ($a5fc),a
a9bc 3a988e    ld      a,($8e98)
a9bf 2f        cpl     
a9c0 32fda5    ld      ($a5fd),a
a9c3 3a988e    ld      a,($8e98)
a9c6 3200a6    ld      ($a600),a
a9c9 c9        ret     

a9ca 3a988e    ld      a,($8e98)
a9cd 320aa6    ld      ($a60a),a
a9d0 c9        ret     

a9d1 010000    ld      bc,$0000
a9d4 00        nop     
a9d5 1000      djnz    $a9d7
a9d7 00        nop     
a9d8 00        nop     
a9d9 64        ld      h,h
a9da 00        nop     
a9db 00        nop     
a9dc 00        nop     
a9dd 0600      ld      b,$00
a9df 00        nop     
a9e0 00        nop     
a9e1 111eb0    ld      de,$b01e
a9e4 219bb0    ld      hl,$b09b
a9e7 cd7556    call    $5675
a9ea 3220b0    ld      ($b020),a
a9ed b7        or      a
a9ee c212aa    jp      nz,$aa12
a9f1 21188e    ld      hl,$8e18
a9f4 cdf801    call    $01f8
a9f7 2f        cpl     
a9f8 3220b0    ld      ($b020),a
a9fb b7        or      a
a9fc ca05aa    jp      z,$aa05
a9ff 21f5aa    ld      hl,$aaf5
aa02 cdc876    call    $76c8
aa05 3a988e    ld      a,($8e98)
aa08 32f7a5    ld      ($a5f7),a
aa0b 3a988e    ld      a,($8e98)
aa0e 32878e    ld      ($8e87),a
aa11 c9        ret     

aa12 2a1eb0    ld      hl,($b01e)
aa15 cdfe7f    call    $7ffe
aa18 08        ex      af,af'
aa19 29        add     hl,hl
aa1a aa        xor     d
aa1b 37        scf     
aa1c aa        xor     d
aa1d 3eaa      ld      a,$aa
aa1f 51        ld      d,c
aa20 aa        xor     d
aa21 5b        ld      e,e
aa22 aa        xor     d
aa23 69        ld      l,c
aa24 aa        xor     d
aa25 7a        ld      a,d
aa26 aa        xor     d
aa27 84        add     a,h
aa28 aa        xor     d
aa29 11f9aa    ld      de,$aaf9
aa2c 21468e    ld      hl,$8e46
aa2f cd9254    call    $5492
aa32 af        xor     a
aa33 32748d    ld      ($8d74),a
aa36 c9        ret     

aa37 3a988e    ld      a,($8e98)
aa3a 32fba5    ld      ($a5fb),a
aa3d c9        ret     

aa3e 01f1aa    ld      bc,$aaf1
aa41 114e8e    ld      de,$8e4e
aa44 21f08d    ld      hl,$8df0
aa47 cda353    call    $53a3
aa4a 3a988e    ld      a,($8e98)
aa4d 32848e    ld      ($8e84),a
aa50 c9        ret     

aa51 11f9aa    ld      de,$aaf9
aa54 214a8e    ld      hl,$8e4a
aa57 cd9254    call    $5492
aa5a c9        ret     

aa5b 3a988e    ld      a,($8e98)
aa5e 2f        cpl     
aa5f 32f7a5    ld      ($a5f7),a
aa62 3a988e    ld      a,($8e98)
aa65 32878e    ld      ($8e87),a
aa68 c9        ret     

aa69 213c8e    ld      hl,$8e3c
aa6c cd3556    call    $5635
aa6f 21408e    ld      hl,$8e40
aa72 cd3556    call    $5635
aa75 af        xor     a
aa76 32748d    ld      ($8d74),a
aa79 c9        ret     

aa7a 11fdaa    ld      de,$aafd
aa7d 2121b0    ld      hl,$b021
aa80 cd9254    call    $5492
aa83 c9        ret     

aa84 111eb0    ld      de,$b01e
aa87 21ceb0    ld      hl,$b0ce
aa8a cd7556    call    $5675
aa8d 2f        cpl     
aa8e 3220b0    ld      ($b020),a
aa91 b7        or      a
aa92 ca9baa    jp      z,$aa9b
aa95 21f5aa    ld      hl,$aaf5
aa98 cdc876    call    $76c8
aa9b 2a1eb0    ld      hl,($b01e)
aa9e cdfe7f    call    $7ffe
aaa1 05        dec     b
aaa2 ac        xor     h
aaa3 aa        xor     d
aaa4 b5        or      l
aaa5 aa        xor     d
aaa6 bf        cp      a
aaa7 aa        xor     d
aaa8 caaaea    jp      z,$eaaa
aaab aa        xor     d
aaac af        xor     a
aaad 32fea5    ld      ($a5fe),a
aab0 af        xor     a
aab1 32ffa5    ld      ($a5ff),a
aab4 c9        ret     

aab5 3eff      ld      a,$ff
aab7 32fea5    ld      ($a5fe),a
aaba af        xor     a
aabb 32ffa5    ld      ($a5ff),a
aabe c9        ret     

aabf 3eff      ld      a,$ff
aac1 32fea5    ld      ($a5fe),a
aac4 3eff      ld      a,$ff
aac6 32ffa5    ld      ($a5ff),a
aac9 c9        ret     

aaca 3a988e    ld      a,($8e98)
aacd b7        or      a
aace cad7aa    jp      z,$aad7
aad1 2106a6    ld      hl,$a606
aad4 cd3556    call    $5635
aad7 3eff      ld      a,$ff
aad9 32fea5    ld      ($a5fe),a
aadc 3a988e    ld      a,($8e98)
aadf 2f        cpl     
aae0 32ffa5    ld      ($a5ff),a
aae3 3a988e    ld      a,($8e98)
aae6 3205a6    ld      ($a605),a
aae9 c9        ret     

aaea 3a988e    ld      a,($8e98)
aaed 320ba6    ld      ($a60b),a
aaf0 c9        ret     

aaf1 010000    ld      bc,$0000
aaf4 00        nop     
aaf5 1000      djnz    $aaf7
aaf7 00        nop     
aaf8 00        nop     
aaf9 64        ld      h,h
aafa 00        nop     
aafb 00        nop     
aafc 00        nop     
aafd 0600      ld      b,$00
aaff 00        nop     
ab00 00        nop     
ab01 2224b0    ld      ($b024),hl
ab04 eb        ex      de,hl
ab05 2226b0    ld      ($b026),hl
ab08 21df8c    ld      hl,$8cdf
ab0b cdedaf    call    $afed
ab0e 21dd8c    ld      hl,$8cdd
ab11 cd7f50    call    $507f
ab14 210200    ld      hl,$0002
ab17 22e48c    ld      ($8ce4),hl
ab1a 21e48c    ld      hl,$8ce4
ab1d cdc364    call    $64c3
ab20 3a798e    ld      a,($8e79)
ab23 2f        cpl     
ab24 322cb0    ld      ($b02c),a
ab27 b7        or      a
ab28 ca31ab    jp      z,$ab31
ab2b 211e8d    ld      hl,$8d1e
ab2e cdfa4f    call    $4ffa
ab31 af        xor     a
ab32 3228b0    ld      ($b028),a
ab35 cd504f    call    $4f50
ab38 2a7a8d    ld      hl,($8d7a)
ab3b 222db0    ld      ($b02d),hl
ab3e 2a24b0    ld      hl,($b024)
ab41 44        ld      b,h
ab42 4d        ld      c,l
ab43 112db0    ld      de,$b02d
ab46 212fb0    ld      hl,$b02f
ab49 cd1f51    call    $511f
ab4c 3a758d    ld      a,($8d75)
ab4f b7        or      a
ab50 c2a2ab    jp      nz,$aba2
ab53 2a26b0    ld      hl,($b026)
ab56 44        ld      b,h
ab57 4d        ld      c,l
ab58 112db0    ld      de,$b02d
ab5b 2133b0    ld      hl,$b033
ab5e cd1f51    call    $511f
ab61 3a758d    ld      a,($8d75)
ab64 b7        or      a
ab65 c2a2ab    jp      nz,$aba2
ab68 3a798e    ld      a,($8e79)
ab6b b7        or      a
ab6c c27eab    jp      nz,$ab7e
ab6f 01e38c    ld      bc,$8ce3
ab72 1133b0    ld      de,$b033
ab75 212fb0    ld      hl,$b02f
ab78 cd5b65    call    $655b
ab7b c3a6ab    jp      $aba6
ab7e 3a28b0    ld      a,($b028)
ab81 b7        or      a
ab82 c296ab    jp      nz,$ab96
ab85 1133b0    ld      de,$b033
ab88 212fb0    ld      hl,$b02f
ab8b cde364    call    $64e3
ab8e 3eff      ld      a,$ff
ab90 3228b0    ld      ($b028),a
ab93 c3a6ab    jp      $aba6
ab96 1133b0    ld      de,$b033
ab99 212fb0    ld      hl,$b02f
ab9c cd1e65    call    $651e
ab9f c3a6ab    jp      $aba6
aba2 af        xor     a
aba3 3228b0    ld      ($b028),a
aba6 2a2db0    ld      hl,($b02d)
aba9 23        inc     hl
abaa eb        ex      de,hl
abab 2a7c8d    ld      hl,($8d7c)
abae eb        ex      de,hl
abaf 7b        ld      a,e
abb0 95        sub     l
abb1 7a        ld      a,d
abb2 9c        sbc     a,h
abb3 f23bab    jp      p,$ab3b
abb6 3e02      ld      a,$02
abb8 32a68e    ld      ($8ea6),a
abbb 2adf8c    ld      hl,($8cdf)
abbe 22a78e    ld      ($8ea7),hl
abc1 3a798e    ld      a,($8e79)
abc4 b7        or      a
abc5 c2d7ab    jp      nz,$abd7
abc8 3e01      ld      a,$01
abca 32a68e    ld      ($8ea6),a
abcd 3ae38c    ld      a,($8ce3)
abd0 6f        ld      l,a
abd1 17        rla     
abd2 9f        sbc     a,a
abd3 67        ld      h,a
abd4 22a78e    ld      ($8ea7),hl
abd7 2add8c    ld      hl,($8cdd)
abda 22a98e    ld      ($8ea9),hl
abdd 2a26b0    ld      hl,($b026)
abe0 7e        ld      a,(hl)
abe1 23        inc     hl
abe2 66        ld      h,(hl)
abe3 6f        ld      l,a
abe4 22ab8e    ld      ($8eab),hl
abe7 cd4c02    call    $024c
abea cd8e02    call    $028e
abed 21f4ab    ld      hl,$abf4
abf0 cdedaf    call    $afed
abf3 c9        ret     

abf4 010000    ld      bc,$0000
abf7 00        nop     
abf8 2238b0    ld      ($b038),hl
abfb eb        ex      de,hl
abfc 223ab0    ld      ($b03a),hl
abff 60        ld      h,b
ac00 69        ld      l,c
ac01 223cb0    ld      ($b03c),hl
ac04 2a3ab0    ld      hl,($b03a)
ac07 7e        ld      a,(hl)
ac08 23        inc     hl
ac09 66        ld      h,(hl)
ac0a 6f        ld      l,a
ac0b 22628e    ld      ($8e62),hl
ac0e 21e9af    ld      hl,$afe9
ac11 cdcd81    call    $81cd
ac14 21668e    ld      hl,$8e66
ac17 cdfe7e    call    $7efe
ac1a 214eb0    ld      hl,$b04e
ac1d cdbe81    call    $81be
ac20 214ab0    ld      hl,$b04a
ac23 cdcd81    call    $81cd
ac26 2152b0    ld      hl,$b052
ac29 cdbe81    call    $81be
ac2c 3aea8c    ld      a,($8cea)
ac2f b7        or      a
ac30 ca3fac    jp      z,$ac3f
ac33 2a628e    ld      hl,($8e62)
ac36 cdde7f    call    $7fde
ac39 2152b0    ld      hl,$b052
ac3c cdbe81    call    $81be
ac3f 2152b0    ld      hl,$b052
ac42 cdcd81    call    $81cd
ac45 21f88c    ld      hl,$8cf8
ac48 cdfe7e    call    $7efe
ac4b 214ab0    ld      hl,$b04a
ac4e cd8b7d    call    $7d8b
ac51 215eb0    ld      hl,$b05e
ac54 cdbe81    call    $81be
ac57 21f88c    ld      hl,$8cf8
ac5a cdcd81    call    $81cd
ac5d 215eb0    ld      hl,$b05e
ac60 cd007e    call    $7e00
ac63 2156b0    ld      hl,$b056
ac66 cdbe81    call    $81be
ac69 2196a6    ld      hl,$a696
ac6c cdfe7e    call    $7efe
ac6f 215ab0    ld      hl,$b05a
ac72 cdbe81    call    $81be
ac75 3a708e    ld      a,($8e70)
ac78 b7        or      a
ac79 ca8eac    jp      z,$ac8e
ac7c 2156b0    ld      hl,$b056
ac7f cdcd81    call    $81cd
ac82 218ea6    ld      hl,$a68e
ac85 cdfe7e    call    $7efe
ac88 215ab0    ld      hl,$b05a
ac8b cdbe81    call    $81be
ac8e 215ab0    ld      hl,$b05a
ac91 cdcd81    call    $81cd
ac94 2152b0    ld      hl,$b052
ac97 cdfe7e    call    $7efe
ac9a 2146b0    ld      hl,$b046
ac9d cdfe7e    call    $7efe
aca0 2162b0    ld      hl,$b062
aca3 cdbe81    call    $81be
aca6 21f08c    ld      hl,$8cf0
aca9 cdcd81    call    $81cd
acac 2166b0    ld      hl,$b066
acaf cdbe81    call    $81be
acb2 21e5af    ld      hl,$afe5
acb5 cdc364    call    $64c3
acb8 3eff      ld      a,$ff
acba 323eb0    ld      ($b03e),a
acbd cd504f    call    $4f50
acc0 210100    ld      hl,$0001
acc3 226ab0    ld      ($b06a),hl
acc6 2a6ab0    ld      hl,($b06a)
acc9 29        add     hl,hl
acca 2b        dec     hl
accb 2b        dec     hl
accc eb        ex      de,hl
accd 2a38b0    ld      hl,($b038)
acd0 19        add     hl,de
acd1 7e        ld      a,(hl)
acd2 23        inc     hl
acd3 66        ld      h,(hl)
acd4 6f        ld      l,a
acd5 226cb0    ld      ($b06c),hl
acd8 21dd8c    ld      hl,$8cdd
acdb cd7f50    call    $507f
acde 2a7a8d    ld      hl,($8d7a)
ace1 226eb0    ld      ($b06e),hl
ace4 2a3cb0    ld      hl,($b03c)
ace7 44        ld      b,h
ace8 4d        ld      c,l
ace9 116eb0    ld      de,$b06e
acec 2170b0    ld      hl,$b070
acef cd1f51    call    $511f
acf2 016cb0    ld      bc,$b06c
acf5 116eb0    ld      de,$b06e
acf8 2174b0    ld      hl,$b074
acfb cd1f51    call    $511f
acfe 3a758d    ld      a,($8d75)
ad01 b7        or      a
ad02 c2c8ae    jp      nz,$aec8
ad05 3aea8c    ld      a,($8cea)
ad08 b7        or      a
ad09 c2b6ad    jp      nz,$adb6
ad0c 3aeb8c    ld      a,($8ceb)
ad0f 2f        cpl     
ad10 3278b0    ld      ($b078),a
ad13 b7        or      a
ad14 c270ad    jp      nz,$ad70
ad17 cd1602    call    $0216
ad1a 210100    ld      hl,$0001
ad1d 2279b0    ld      ($b079),hl
ad20 2a79b0    ld      hl,($b079)
ad23 29        add     hl,hl
ad24 2b        dec     hl
ad25 2b        dec     hl
ad26 eb        ex      de,hl
ad27 2a38b0    ld      hl,($b038)
ad2a 19        add     hl,de
ad2b 7e        ld      a,(hl)
ad2c 23        inc     hl
ad2d 66        ld      h,(hl)
ad2e 6f        ld      l,a
ad2f 227bb0    ld      ($b07b),hl
ad32 017bb0    ld      bc,$b07b
ad35 116eb0    ld      de,$b06e
ad38 217db0    ld      hl,$b07d
ad3b cd1f51    call    $511f
ad3e 217db0    ld      hl,$b07d
ad41 cd1c02    call    $021c
ad44 2a79b0    ld      hl,($b079)
ad47 23        inc     hl
ad48 eb        ex      de,hl
ad49 2a3ab0    ld      hl,($b03a)
ad4c 7e        ld      a,(hl)
ad4d 23        inc     hl
ad4e 66        ld      h,(hl)
ad4f 6f        ld      l,a
ad50 eb        ex      de,hl
ad51 7b        ld      a,e
ad52 95        sub     l
ad53 7a        ld      a,d
ad54 9c        sbc     a,h
ad55 f21dad    jp      p,$ad1d
ad58 2174b0    ld      hl,$b074
ad5b cdcd81    call    $81cd
ad5e 21f48c    ld      hl,$8cf4
ad61 cdfe7e    call    $7efe
ad64 21c58e    ld      hl,$8ec5
ad67 cd007e    call    $7e00
ad6a 2174b0    ld      hl,$b074
ad6d cdbe81    call    $81be
ad70 3a3eb0    ld      a,($b03e)
ad73 b7        or      a
ad74 c29cad    jp      nz,$ad9c
ad77 016eb0    ld      bc,$b06e
ad7a 11288e    ld      de,$8e28
ad7d 2166b0    ld      hl,$b066
ad80 cd7870    call    $7078
ad83 3a6f8e    ld      a,($8e6f)
ad86 b7        or      a
ad87 ca9cad    jp      z,$ad9c
ad8a 2174b0    ld      hl,$b074
ad8d cdcd81    call    $81cd
ad90 2166b0    ld      hl,$b066
ad93 cd8b7d    call    $7d8b
ad96 2174b0    ld      hl,$b074
ad99 cdbe81    call    $81be
ad9c 016eb0    ld      bc,$b06e
ad9f 11288e    ld      de,$8e28
ada2 2174b0    ld      hl,$b074
ada5 cda370    call    $70a3
ada8 3aec8c    ld      a,($8cec)
adab 213eb0    ld      hl,$b03e
adae a6        and     (hl)
adaf 3278b0    ld      ($b078),a
adb2 b7        or      a
adb3 c2c8ae    jp      nz,$aec8
adb6 3a708e    ld      a,($8e70)
adb9 b7        or      a
adba c21aae    jp      nz,$ae1a
adbd 2166b0    ld      hl,$b066
adc0 cdcd81    call    $81cd
adc3 218ea6    ld      hl,$a68e
adc6 cdfe7e    call    $7efe
adc9 218aa6    ld      hl,$a68a
adcc cd8b7d    call    $7d8b
adcf 2181b0    ld      hl,$b081
add2 cdbe81    call    $81be
add5 2174b0    ld      hl,$b074
add8 cdcd81    call    $81cd
addb 218ea6    ld      hl,$a68e
adde cdfe7e    call    $7efe
ade1 218aa6    ld      hl,$a68a
ade4 cd8b7d    call    $7d8b
ade7 2185b0    ld      hl,$b085
adea cdbe81    call    $81be
aded 2170b0    ld      hl,$b070
adf0 cdcd81    call    $81cd
adf3 2196a6    ld      hl,$a696
adf6 cdfe7e    call    $7efe
adf9 2162b0    ld      hl,$b062
adfc cded7d    call    $7ded
adff 2192a6    ld      hl,$a692
ae02 cd8b7d    call    $7d8b
ae05 2189b0    ld      hl,$b089
ae08 cdbe81    call    $81be
ae0b 215ab0    ld      hl,$b05a
ae0e cd8b7d    call    $7d8b
ae11 218db0    ld      hl,$b08d
ae14 cdbe81    call    $81be
ae17 c374ae    jp      $ae74
ae1a 2170b0    ld      hl,$b070
ae1d cdcd81    call    $81cd
ae20 218ea6    ld      hl,$a68e
ae23 cdfe7e    call    $7efe
ae26 2162b0    ld      hl,$b062
ae29 cded7d    call    $7ded
ae2c 218aa6    ld      hl,$a68a
ae2f cd8b7d    call    $7d8b
ae32 2181b0    ld      hl,$b081
ae35 cdbe81    call    $81be
ae38 215ab0    ld      hl,$b05a
ae3b cd8b7d    call    $7d8b
ae3e 2185b0    ld      hl,$b085
ae41 cdbe81    call    $81be
ae44 2166b0    ld      hl,$b066
ae47 cdcd81    call    $81cd
ae4a 2196a6    ld      hl,$a696
ae4d cdfe7e    call    $7efe
ae50 2192a6    ld      hl,$a692
ae53 cd8b7d    call    $7d8b
ae56 2189b0    ld      hl,$b089
ae59 cdbe81    call    $81be
ae5c 2174b0    ld      hl,$b074
ae5f cdcd81    call    $81cd
ae62 2196a6    ld      hl,$a696
ae65 cdfe7e    call    $7efe
ae68 2192a6    ld      hl,$a692
ae6b cd8b7d    call    $7d8b
ae6e 218db0    ld      hl,$b08d
ae71 cdbe81    call    $81be
ae74 2181b0    ld      hl,$b081
ae77 cdcd81    call    $81cd
ae7a 214eb0    ld      hl,$b04e
ae7d cd8b7d    call    $7d8b
ae80 2181b0    ld      hl,$b081
ae83 cdbe81    call    $81be
ae86 2189b0    ld      hl,$b089
ae89 cdcd81    call    $81cd
ae8c 214eb0    ld      hl,$b04e
ae8f cd8b7d    call    $7d8b
ae92 2189b0    ld      hl,$b089
ae95 cdbe81    call    $81be
ae98 2185b0    ld      hl,$b085
ae9b cdcd81    call    $81cd
ae9e 214eb0    ld      hl,$b04e
aea1 cded7d    call    $7ded
aea4 2185b0    ld      hl,$b085
aea7 cdbe81    call    $81be
aeaa 218db0    ld      hl,$b08d
aead cdcd81    call    $81cd
aeb0 214eb0    ld      hl,$b04e
aeb3 cded7d    call    $7ded
aeb6 218db0    ld      hl,$b08d
aeb9 cdbe81    call    $81be
aebc 0191b0    ld      bc,$b091
aebf 1185b0    ld      de,$b085
aec2 2181b0    ld      hl,$b081
aec5 cd9402    call    $0294
aec8 2a6eb0    ld      hl,($b06e)
aecb 23        inc     hl
aecc eb        ex      de,hl
aecd 2a7c8d    ld      hl,($8d7c)
aed0 eb        ex      de,hl
aed1 7b        ld      a,e
aed2 95        sub     l
aed3 7a        ld      a,d
aed4 9c        sbc     a,h
aed5 f2e1ac    jp      p,$ace1
aed8 3e03      ld      a,$03
aeda 32a68e    ld      ($8ea6),a
aedd 2adb8c    ld      hl,($8cdb)
aee0 22a78e    ld      ($8ea7),hl
aee3 2add8c    ld      hl,($8cdd)
aee6 22a98e    ld      ($8ea9),hl
aee9 2a6cb0    ld      hl,($b06c)
aeec 22ab8e    ld      ($8eab),hl
aeef cd4c02    call    $024c
aef2 cd8e02    call    $028e
aef5 3aea8c    ld      a,($8cea)
aef8 b7        or      a
aef9 ca0eaf    jp      z,$af0e
aefc 2162b0    ld      hl,$b062
aeff cdcd81    call    $81cd
af02 215ab0    ld      hl,$b05a
af05 cded7d    call    $7ded
af08 2162b0    ld      hl,$b062
af0b cdbe81    call    $81be
af0e af        xor     a
af0f 323eb0    ld      ($b03e),a
af12 2a6ab0    ld      hl,($b06a)
af15 23        inc     hl
af16 eb        ex      de,hl
af17 2a3ab0    ld      hl,($b03a)
af1a 7e        ld      a,(hl)
af1b 23        inc     hl
af1c 66        ld      h,(hl)
af1d 6f        ld      l,a
af1e eb        ex      de,hl
af1f 7b        ld      a,e
af20 95        sub     l
af21 7a        ld      a,d
af22 9c        sbc     a,h
af23 f2c3ac    jp      p,$acc3
af26 21e1af    ld      hl,$afe1
af29 cdc364    call    $64c3
af2c 3aef8c    ld      a,($8cef)
af2f 2f        cpl     
af30 21ec8c    ld      hl,$8cec
af33 b6        or      (hl)
af34 3278b0    ld      ($b078),a
af37 b7        or      a
af38 c2cfaf    jp      nz,$afcf
af3b 2156b0    ld      hl,$b056
af3e cdcd81    call    $81cd
af41 2152b0    ld      hl,$b052
af44 cdfe7e    call    $7efe
af47 2146b0    ld      hl,$b046
af4a cdfe7e    call    $7efe
af4d 2162b0    ld      hl,$b062
af50 cdbe81    call    $81be
af53 21648e    ld      hl,$8e64
af56 cd7f50    call    $507f
af59 3a708e    ld      a,($8e70)
af5c b7        or      a
af5d c299af    jp      nz,$af99
af60 213c8e    ld      hl,$8e3c
af63 cdcd81    call    $81cd
af66 2162b0    ld      hl,$b062
af69 cded7d    call    $7ded
af6c 215eb0    ld      hl,$b05e
af6f cdbe81    call    $81be
af72 115eb0    ld      de,$b05e
af75 21f08c    ld      hl,$8cf0
af78 cde364    call    $64e3
af7b 2162b0    ld      hl,$b062
af7e cdcd81    call    $81cd
af81 21408e    ld      hl,$8e40
af84 cd8b7d    call    $7d8b
af87 215eb0    ld      hl,$b05e
af8a cdbe81    call    $81be
af8d 115eb0    ld      de,$b05e
af90 21f08c    ld      hl,$8cf0
af93 cd1e65    call    $651e
af96 c3cfaf    jp      $afcf
af99 21348e    ld      hl,$8e34
af9c cdcd81    call    $81cd
af9f 2162b0    ld      hl,$b062
afa2 cded7d    call    $7ded
afa5 215eb0    ld      hl,$b05e
afa8 cdbe81    call    $81be
afab 11f08c    ld      de,$8cf0
afae 215eb0    ld      hl,$b05e
afb1 cde364    call    $64e3
afb4 2162b0    ld      hl,$b062
afb7 cdcd81    call    $81cd
afba 21388e    ld      hl,$8e38
afbd cd8b7d    call    $7d8b
afc0 215eb0    ld      hl,$b05e
afc3 cdbe81    call    $81be
afc6 11f08c    ld      de,$8cf0
afc9 215eb0    ld      hl,$b05e
afcc cd1e65    call    $651e
afcf 3a888e    ld      a,($8e88)
afd2 b7        or      a
afd3 cad9af    jp      z,$afd9
afd6 cd2001    call    $0120
afd9 af        xor     a
afda 32718e    ld      ($8e71),a
afdd cd364f    call    $4f36
afe0 c9        ret     

afe1 02        ld      (bc),a
afe2 00        nop     
afe3 00        nop     
afe4 00        nop     
afe5 00        nop     
afe6 00        nop     
afe7 00        nop     
afe8 00        nop     
afe9 00        nop     
afea 00        nop     
afeb 00        nop     
afec 80        add     a,b
afed 2298b0    ld      ($b098),hl
aff0 2a98b0    ld      hl,($b098)
aff3 7e        ld      a,(hl)
aff4 32a58b    ld      ($8ba5),a
aff7 21a68b    ld      hl,$8ba6
affa 96        sub     (hl)
affb 3d        dec     a
affc d67f      sub     $7f
affe 9f        sbc     a,a
afff 329ab0    ld      ($b09a),a
b002 b7        or      a
b003 ca0cb0    jp      z,$b00c
b006 3aa68b    ld      a,($8ba6)
b009 32a58b    ld      ($8ba5),a
b00c c9        ret     

b00d 00        nop     
b00e 00        nop     
b00f 00        nop     
b010 00        nop     
b011 00        nop     
b012 00        nop     
b013 00        nop     
b014 00        nop     
b015 00        nop     
b016 00        nop     
b017 00        nop     
b018 00        nop     
b019 00        nop     
b01a 00        nop     
b01b 00        nop     
b01c 00        nop     
b01d 00        nop     
b01e 00        nop     
b01f 00        nop     
b020 00        nop     
b021 00        nop     
b022 00        nop     
b023 00        nop     
b024 00        nop     
b025 00        nop     
b026 00        nop     
b027 00        nop     
b028 00        nop     
b029 00        nop     
b02a 00        nop     
b02b 00        nop     
b02c 00        nop     
b02d 00        nop     
b02e 00        nop     
b02f 00        nop     
b030 00        nop     
b031 00        nop     
b032 00        nop     
b033 00        nop     
b034 00        nop     
b035 00        nop     
b036 00        nop     
b037 00        nop     
b038 98        sbc     a,b
b039 92        sub     d
b03a 98        sbc     a,b
b03b a8        xor     b
b03c 9b        sbc     a,e
b03d a8        xor     b
b03e ff        rst     $38
b03f 00        nop     
b040 00        nop     
b041 00        nop     
b042 00        nop     
b043 00        nop     
b044 00        nop     
b045 00        nop     
b046 00        nop     
b047 00        nop     
b048 00        nop     
b049 80        add     a,b
b04a 00        nop     
b04b 00        nop     
b04c 00        nop     
b04d 81        add     a,c
b04e 00        nop     
b04f 00        nop     
b050 00        nop     
b051 00        nop     
b052 00        nop     
b053 00        nop     
b054 00        nop     
b055 82        add     a,d
b056 8a        adc     a,d
b057 47        ld      b,a
b058 12        ld      (de),a
b059 7f        ld      a,a
b05a e3        ex      (sp),hl
b05b 96        sub     (hl)
b05c 017c26    ld      bc,$267c
b05f 53        ld      d,e
b060 15        dec     d
b061 82        add     a,d
b062 e3        ex      (sp),hl
b063 96        sub     (hl)
b064 017c00    ld      bc,$007c
b067 00        nop     
b068 00        nop     
b069 00        nop     
b06a 010001    ld      bc,$0100
b06d 00        nop     
b06e 00        nop     
b06f 00        nop     
b070 00        nop     
b071 00        nop     
b072 00        nop     
b073 00        nop     
b074 00        nop     
b075 00        nop     
b076 00        nop     
b077 00        nop     
b078 00        nop     
b079 00        nop     
b07a 00        nop     
b07b 00        nop     
b07c 00        nop     
b07d 00        nop     
b07e 00        nop     
b07f 00        nop     
b080 00        nop     
b081 00        nop     
b082 00        nop     
b083 00        nop     
b084 00        nop     
b085 00        nop     
b086 00        nop     
b087 00        nop     
b088 00        nop     
b089 00        nop     
b08a 00        nop     
b08b 00        nop     
b08c 00        nop     
b08d 00        nop     
b08e 00        nop     
b08f 00        nop     
b090 00        nop     
b091 89        adc     a,c
b092 b0        or      b
b093 8d        adc     a,l
b094 b0        or      b
b095 db8c      in      a,($8c)
b097 00        nop     
b098 00        nop     
b099 00        nop     
b09a 00        nop     
b09b 08        ex      af,af'
b09c 00        nop     
b09d 0649      ld      b,$49
b09f 4e        ld      c,(hl)
b0a0 54        ld      d,h
b0a1 45        ld      b,l
b0a2 52        ld      d,d
b0a3 56        ld      d,(hl)
b0a4 cd4152    call    $5241
b0a7 47        ld      b,a
b0a8 49        ld      c,c
b0a9 4e        ld      c,(hl)
b0aa ce41      adc     a,$41
b0ac 4d        ld      c,l
b0ad 45        ld      b,l
b0ae 7c        ld      a,h
b0af 7c        ld      a,h
b0b0 4e        ld      c,(hl)
b0b1 54        ld      d,h
b0b2 48        ld      c,b
b0b3 7c        ld      a,h
b0b4 7c        ld      a,h
b0b5 7c        ld      a,h
b0b6 4e        ld      c,(hl)
b0b7 55        ld      d,l
b0b8 4d        ld      c,l
b0b9 45        ld      b,l
b0ba 52        ld      d,d
b0bb 49        ld      c,c
b0bc 52        ld      d,d
b0bd 41        ld      b,c
b0be 4e        ld      c,(hl)
b0bf 47        ld      b,a
b0c0 45        ld      b,l
b0c1 7c        ld      a,h
b0c2 53        ld      d,e
b0c3 49        ld      c,c
b0c4 47        ld      b,a
b0c5 4e        ld      c,(hl)
b0c6 49        ld      c,c
b0c7 46        ld      b,(hl)
b0c8 c1        pop     bc
b0c9 58        ld      e,b
b0ca 49        ld      c,c
b0cb 53        ld      d,e
b0cc 7c        ld      a,h
b0cd 7c        ld      a,h
b0ce 05        dec     b
b0cf 00        nop     
b0d0 065a      ld      b,$5a
b0d2 45        ld      b,l
b0d3 52        ld      d,d
b0d4 4f        ld      c,a
b0d5 7c        ld      a,h
b0d6 7c        ld      a,h
b0d7 4f        ld      c,a
b0d8 4e        ld      c,(hl)
b0d9 45        ld      b,l
b0da 7c        ld      a,h
b0db 7c        ld      a,h
b0dc 7c        ld      a,h
b0dd 54        ld      d,h
b0de 57        ld      d,a
b0df 4f        ld      c,a
b0e0 7c        ld      a,h
b0e1 7c        ld      a,h
b0e2 7c        ld      a,h
b0e3 d0        ret     nc

b0e4 4f        ld      c,a
b0e5 53        ld      d,e
b0e6 49        ld      c,c
b0e7 54        ld      d,h
b0e8 49        ld      c,c
b0e9 c7        rst     $00
b0ea 52        ld      d,d
b0eb 49        ld      c,c
b0ec 44        ld      b,h
b0ed 7c        ld      a,h
b0ee 7c        ld      a,h
b0ef 6d        ld      l,l
b0f0 b9        cp      c
b0f1 cdbe81    call    $81be
b0f4 116db9    ld      de,$b96d
b0f7 2195b9    ld      hl,$b995
b0fa cde364    call    $64e3
b0fd 217390    ld      hl,$9073
b100 cd5c01    call    $015c
b103 2146b9    ld      hl,$b946
b106 cdcd81    call    $81cd
b109 21aea6    ld      hl,$a6ae
b10c cd007e    call    $7e00
b10f 219fb9    ld      hl,$b99f
b112 cdbe81    call    $81be
b115 214ab9    ld      hl,$b94a
b118 cdcd81    call    $81cd
b11b 21aea6    ld      hl,$a6ae
b11e cd007e    call    $7e00
b121 2119b9    ld      hl,$b919
b124 cded7d    call    $7ded
b127 cd867c    call    $7c86
b12a 21a3b9    ld      hl,$b9a3
b12d cdbe81    call    $81be
b130 2152b9    ld      hl,$b952
b133 cdcd81    call    $81cd
b136 21b6a6    ld      hl,$a6b6
b139 cd007e    call    $7e00
b13c 21a7b9    ld      hl,$b9a7
b13f cdbe81    call    $81be
b142 214eb9    ld      hl,$b94e
b145 cdcd81    call    $81cd
b148 21b6a6    ld      hl,$a6b6
b14b cd007e    call    $7e00
b14e 2119b9    ld      hl,$b919
b151 cded7d    call    $7ded
b154 cd867c    call    $7c86
b157 21abb9    ld      hl,$b9ab
b15a cdbe81    call    $81be
b15d 01afb9    ld      bc,$b9af
b160 11a3b9    ld      de,$b9a3
b163 219fb9    ld      hl,$b99f
b166 cd0db5    call    $b50d
b169 01b3b9    ld      bc,$b9b3
b16c 113ab9    ld      de,$b93a
b16f 2136b9    ld      hl,$b936
b172 cd55b5    call    $b555
b175 21328d    ld      hl,$8d32
b178 cd7f50    call    $507f
b17b 211e8d    ld      hl,$8d1e
b17e cdfa4f    call    $4ffa
b181 3a868e    ld      a,($8e86)
b184 2f        cpl     
b185 3235b9    ld      ($b935),a
b188 b7        or      a
b189 c2d2b1    jp      nz,$b1d2
b18c 3af6a5    ld      a,($a5f6)
b18f 32f5a5    ld      ($a5f5),a
b192 3afaa5    ld      a,($a5fa)
b195 32f9a5    ld      ($a5f9),a
b198 21c2b3    ld      hl,$b3c2
b19b cdcd81    call    $81cd
b19e 215aa6    ld      hl,$a65a
b1a1 cdfe7e    call    $7efe
b1a4 21b6a6    ld      hl,$a6b6
b1a7 cd007e    call    $7e00
b1aa cd867c    call    $7c86
b1ad 216db9    ld      hl,$b96d
b1b0 cdbe81    call    $81be
b1b3 2affb8    ld      hl,($b8ff)
b1b6 22b9b9    ld      ($b9b9),hl
b1b9 2a01b9    ld      hl,($b901)
b1bc 22bbb9    ld      ($b9bb),hl
b1bf 2a09b9    ld      hl,($b909)
b1c2 22bfb9    ld      ($b9bf),hl
b1c5 01b7b9    ld      bc,$b9b7
b1c8 2afdb8    ld      hl,($b8fd)
b1cb eb        ex      de,hl
b1cc 21c0b3    ld      hl,$b3c0
b1cf cd6402    call    $0264
b1d2 3a878e    ld      a,($8e87)
b1d5 2f        cpl     
b1d6 3235b9    ld      ($b935),a
b1d9 b7        or      a
b1da c222b2    jp      nz,$b222
b1dd 3af7a5    ld      a,($a5f7)
b1e0 32f5a5    ld      ($a5f5),a
b1e3 3afba5    ld      a,($a5fb)
b1e6 32f9a5    ld      ($a5f9),a
b1e9 215ea6    ld      hl,$a65e
b1ec cdcd81    call    $81cd
b1ef 21aea6    ld      hl,$a6ae
b1f2 cd007e    call    $7e00
b1f5 cd867c    call    $7c86
b1f8 216db9    ld      hl,$b96d
b1fb cdbe81    call    $81be
b1fe 2a03b9    ld      hl,($b903)
b201 22c3b9    ld      ($b9c3),hl
b204 2a05b9    ld      hl,($b905)
b207 22c5b9    ld      ($b9c5),hl
b20a 2a07b9    ld      hl,($b907)
b20d 22c7b9    ld      ($b9c7),hl
b210 2a0bb9    ld      hl,($b90b)
b213 22cbb9    ld      ($b9cb),hl
b216 01c3b9    ld      bc,$b9c3
b219 1136b9    ld      de,$b936
b21c 21c6b3    ld      hl,$b3c6
b21f cd6402    call    $0264
b222 af        xor     a
b223 32f5a5    ld      ($a5f5),a
b226 11b6a6    ld      de,$a6b6
b229 21aea6    ld      hl,$a6ae
b22c 3e02      ld      a,$02
b22e cd3eb8    call    $b83e
b231 21eba5    ld      hl,$a5eb
b234 cdfe7e    call    $7efe
b237 21cfb9    ld      hl,$b9cf
b23a cdbe81    call    $81be
b23d 21b6a6    ld      hl,$a6b6
b240 cd007e    call    $7e00
b243 21d3b9    ld      hl,$b9d3
b246 cdbe81    call    $81be
b249 21cfb9    ld      hl,$b9cf
b24c cdcd81    call    $81cd
b24f 21aea6    ld      hl,$a6ae
b252 cd007e    call    $7e00
b255 21cfb9    ld      hl,$b9cf
b258 cdbe81    call    $81be
b25b cd867c    call    $7c86
b25e 21d7b9    ld      hl,$b9d7
b261 cdbe81    call    $81be
b264 21d3b9    ld      hl,$b9d3
b267 cdcd81    call    $81cd
b26a cd867c    call    $7c86
b26d 21dbb9    ld      hl,$b9db
b270 cdbe81    call    $81be
b273 3a0aa6    ld      a,($a60a)
b276 2f        cpl     
b277 3235b9    ld      ($b935),a
b27a b7        or      a
b27b c2a2b2    jp      nz,$b2a2
b27e 2142b9    ld      hl,$b942
b281 cdcd81    call    $81cd
b284 213eb9    ld      hl,$b93e
b287 cded7d    call    $7ded
b28a 21a6a6    ld      hl,$a6a6
b28d cdfe7e    call    $7efe
b290 21d3b9    ld      hl,$b9d3
b293 cdbe81    call    $81be
b296 2111b9    ld      hl,$b911
b299 cdcd81    call    $81cd
b29c 21dbb9    ld      hl,$b9db
b29f cdbe81    call    $81be
b2a2 3a0ba6    ld      a,($a60b)
b2a5 2f        cpl     
b2a6 3235b9    ld      ($b935),a
b2a9 b7        or      a
b2aa c2d1b2    jp      nz,$b2d1
b2ad 213ab9    ld      hl,$b93a
b2b0 cdcd81    call    $81cd
b2b3 2136b9    ld      hl,$b936
b2b6 cded7d    call    $7ded
b2b9 219ea6    ld      hl,$a69e
b2bc cdfe7e    call    $7efe
b2bf 21cfb9    ld      hl,$b9cf
b2c2 cdbe81    call    $81be
b2c5 2111b9    ld      hl,$b911
b2c8 cdcd81    call    $81cd
b2cb 21d7b9    ld      hl,$b9d7
b2ce cdbe81    call    $81be
b2d1 21648e    ld      hl,$8e64
b2d4 cd7f50    call    $507f
b2d7 3afaa5    ld      a,($a5fa)
b2da 32f9a5    ld      ($a5f9),a
b2dd 3a00a6    ld      a,($a600)
b2e0 b7        or      a
b2e1 caf0b2    jp      z,$b2f0
b2e4 2101a6    ld      hl,$a601
b2e7 cdcd81    call    $81cd
b2ea 213eb9    ld      hl,$b93e
b2ed cdbe81    call    $81be
b2f0 3afca5    ld      a,($a5fc)
b2f3 b7        or      a
b2f4 ca10b3    jp      z,$b310
b2f7 2affb8    ld      hl,($b8ff)
b2fa 22e1b9    ld      ($b9e1),hl
b2fd 2a01b9    ld      hl,($b901)
b300 22e3b9    ld      ($b9e3),hl
b303 01dfb9    ld      bc,$b9df
b306 2afdb8    ld      hl,($b8fd)
b309 eb        ex      de,hl
b30a 21c0b3    ld      hl,$b3c0
b30d cd5e02    call    $025e
b310 3afba5    ld      a,($a5fb)
b313 32f9a5    ld      ($a5f9),a
b316 3affa5    ld      a,($a5ff)
b319 b7        or      a
b31a ca3bb3    jp      z,$b33b
b31d 2a03b9    ld      hl,($b903)
b320 22e9b9    ld      ($b9e9),hl
b323 2a05b9    ld      hl,($b905)
b326 22ebb9    ld      ($b9eb),hl
b329 2a07b9    ld      hl,($b907)
b32c 22edb9    ld      ($b9ed),hl
b32f 01e9b9    ld      bc,$b9e9
b332 113ab9    ld      de,$b93a
b335 21c6b3    ld      hl,$b3c6
b338 cd5e02    call    $025e
b33b 3afaa5    ld      a,($a5fa)
b33e 32f9a5    ld      ($a5f9),a
b341 3afda5    ld      a,($a5fd)
b344 b7        or      a
b345 ca61b3    jp      z,$b361
b348 2afdb8    ld      hl,($b8fd)
b34b 22f5b9    ld      ($b9f5),hl
b34e 2a01b9    ld      hl,($b901)
b351 22f7b9    ld      ($b9f7),hl
b354 01f3b9    ld      bc,$b9f3
b357 2affb8    ld      hl,($b8ff)
b35a eb        ex      de,hl
b35b 21c0b3    ld      hl,$b3c0
b35e cd5e02    call    $025e
b361 3afba5    ld      a,($a5fb)
b364 32f9a5    ld      ($a5f9),a
b367 3a05a6    ld      a,($a605)
b36a b7        or      a
b36b ca7ab3    jp      z,$b37a
b36e 2106a6    ld      hl,$a606
b371 cdcd81    call    $81cd
b374 2136b9    ld      hl,$b936
b377 cdbe81    call    $81be
b37a 3afea5    ld      a,($a5fe)
b37d b7        or      a
b37e ca9fb3    jp      z,$b39f
b381 2a05b9    ld      hl,($b905)
b384 22fdb9    ld      ($b9fd),hl
b387 2a03b9    ld      hl,($b903)
b38a 22ffb9    ld      ($b9ff),hl
b38d 2a07b9    ld      hl,($b907)
b390 2201ba    ld      ($ba01),hl
b393 01fdb9    ld      bc,$b9fd
b396 1136b9    ld      de,$b936
b399 21c6b3    ld      hl,$b3c6
b39c cd5e02    call    $025e
b39f c9        ret     

b3a0 010000    ld      bc,$0000
b3a3 00        nop     
b3a4 cccc4c    call    z,$4ccc
b3a7 7c        ld      a,h
b3a8 27        daa     
b3a9 00        nop     
b3aa 00        nop     
b3ab 00        nop     
b3ac 00        nop     
b3ad 00        nop     
b3ae 34        inc     (hl)
b3af 87        add     a,a
b3b0 cccc0c    call    z,$0ccc
b3b3 81        add     a,c
b3b4 00        nop     
b3b5 00        nop     
b3b6 00        nop     
b3b7 7f        ld      a,a
b3b8 51        ld      d,c
b3b9 b8        cp      b
b3ba 7e        ld      a,(hl)
b3bb 80        add     a,b
b3bc cccc4c    call    z,$4ccc
b3bf 80        add     a,b
b3c0 ff        rst     $38
b3c1 ff        rst     $38
b3c2 66        ld      h,(hl)
b3c3 66        ld      h,(hl)
b3c4 66        ld      h,(hl)
b3c5 7f        ld      a,a
b3c6 00        nop     
b3c7 00        nop     
b3c8 2208ba    ld      ($ba08),hl
b3cb eb        ex      de,hl
b3cc 220aba    ld      ($ba0a),hl
b3cf 3e05      ld      a,$05
b3d1 210cba    ld      hl,$ba0c
b3d4 cd6582    call    $8265
b3d7 212eba    ld      hl,$ba2e
b3da cdcd81    call    $81cd
b3dd 2a12ba    ld      hl,($ba12)
b3e0 cdbe81    call    $81be
b3e3 212eba    ld      hl,$ba2e
b3e6 cdcd81    call    $81cd
b3e9 2a14ba    ld      hl,($ba14)
b3ec cdbe81    call    $81be
b3ef 2a08ba    ld      hl,($ba08)
b3f2 cdcd81    call    $81cd
b3f5 2132ba    ld      hl,$ba32
b3f8 cdbe81    call    $81be
b3fb 2a10ba    ld      hl,($ba10)
b3fe 7e        ld      a,(hl)
b3ff 23        inc     hl
b400 66        ld      h,(hl)
b401 6f        ld      l,a
b402 cdde7f    call    $7fde
b405 2a0aba    ld      hl,($ba0a)
b408 cdfe7e    call    $7efe
b40b 2136ba    ld      hl,$ba36
b40e cdbe81    call    $81be
b411 210100    ld      hl,$0001
b414 223aba    ld      ($ba3a),hl
b417 210100    ld      hl,$0001
b41a 223cba    ld      ($ba3c),hl
b41d 3af5a5    ld      a,($a5f5)
b420 b7        or      a
b421 c234b4    jp      nz,$b434
b424 0116ba    ld      bc,$ba16
b427 2a0eba    ld      hl,($ba0e)
b42a eb        ex      de,hl
b42b 2132ba    ld      hl,$ba32
b42e cd635a    call    $5a63
b431 c353b4    jp      $b453
b434 210800    ld      hl,$0008
b437 eb        ex      de,hl
b438 2a0eba    ld      hl,($ba0e)
b43b 19        add     hl,de
b43c 223eba    ld      ($ba3e),hl
b43f 013aba    ld      bc,$ba3a
b442 2a3eba    ld      hl,($ba3e)
b445 eb        ex      de,hl
b446 2116ba    ld      hl,$ba16
b449 cd7870    call    $7078
b44c 2a3aba    ld      hl,($ba3a)
b44f 23        inc     hl
b450 223aba    ld      ($ba3a),hl
b453 2116ba    ld      hl,$ba16
b456 cd7002    call    $0270
b459 114ea6    ld      de,$a64e
b45c 2a12ba    ld      hl,($ba12)
b45f 3e02      ld      a,$02
b461 cd49b8    call    $b849
b464 2a12ba    ld      hl,($ba12)
b467 cdbe81    call    $81be
b46a 1152a6    ld      de,$a652
b46d 2a14ba    ld      hl,($ba14)
b470 3e02      ld      a,$02
b472 cd49b8    call    $b849
b475 2a14ba    ld      hl,($ba14)
b478 cdbe81    call    $81be
b47b 2136ba    ld      hl,$ba36
b47e cdcd81    call    $81cd
b481 2132ba    ld      hl,$ba32
b484 cd8b7d    call    $7d8b
b487 2132ba    ld      hl,$ba32
b48a cdbe81    call    $81be
b48d 2a3cba    ld      hl,($ba3c)
b490 eb        ex      de,hl
b491 2a10ba    ld      hl,($ba10)
b494 7e        ld      a,(hl)
b495 23        inc     hl
b496 66        ld      h,(hl)
b497 6f        ld      l,a
b498 19        add     hl,de
b499 eb        ex      de,hl
b49a 2a0cba    ld      hl,($ba0c)
b49d 7e        ld      a,(hl)
b49e 23        inc     hl
b49f 66        ld      h,(hl)
b4a0 6f        ld      l,a
b4a1 eb        ex      de,hl
b4a2 7b        ld      a,e
b4a3 95        sub     l
b4a4 7a        ld      a,d
b4a5 9c        sbc     a,h
b4a6 f21ab4    jp      p,$b41a
b4a9 c9        ret     

b4aa 2241ba    ld      ($ba41),hl
b4ad 2a41ba    ld      hl,($ba41)
b4b0 7e        ld      a,(hl)
b4b1 32a58b    ld      ($8ba5),a
b4b4 21a68b    ld      hl,$8ba6
b4b7 96        sub     (hl)
b4b8 3d        dec     a
b4b9 d67f      sub     $7f
b4bb 9f        sbc     a,a
b4bc 3243ba    ld      ($ba43),a
b4bf b7        or      a
b4c0 cac9b4    jp      z,$b4c9
b4c3 3aa68b    ld      a,($8ba6)
b4c6 32a58b    ld      ($8ba5),a
b4c9 c9        ret     

b4ca 2245ba    ld      ($ba45),hl
b4cd eb        ex      de,hl
b4ce 2247ba    ld      ($ba47),hl
b4d1 3e02      ld      a,$02
b4d3 2149ba    ld      hl,$ba49
b4d6 cd6582    call    $8265
b4d9 2a45ba    ld      hl,($ba45)
b4dc cdcd81    call    $81cd
b4df 21e38b    ld      hl,$8be3
b4e2 cdbe81    call    $81be
b4e5 2a47ba    ld      hl,($ba47)
b4e8 cdcd81    call    $81cd
b4eb 21e78b    ld      hl,$8be7
b4ee cdbe81    call    $81be
b4f1 2a49ba    ld      hl,($ba49)
b4f4 cdcd81    call    $81cd
b4f7 21eb8b    ld      hl,$8beb
b4fa cdbe81    call    $81be
b4fd 2a4bba    ld      hl,($ba4b)
b500 cdcd81    call    $81cd
b503 21ef8b    ld      hl,$8bef
b506 cdbe81    call    $81be
b509 cd59b6    call    $b659
b50c c9        ret     

b50d 224eba    ld      ($ba4e),hl
b510 eb        ex      de,hl
b511 2250ba    ld      ($ba50),hl
b514 3e02      ld      a,$02
b516 2152ba    ld      hl,$ba52
b519 cd6582    call    $8265
b51c 2a4eba    ld      hl,($ba4e)
b51f cdcd81    call    $81cd
b522 21f38b    ld      hl,$8bf3
b525 cdbe81    call    $81be
b528 2a50ba    ld      hl,($ba50)
b52b cdcd81    call    $81cd
b52e 21f78b    ld      hl,$8bf7
b531 cdbe81    call    $81be
b534 2a52ba    ld      hl,($ba52)
b537 cdcd81    call    $81cd
b53a 21fb8b    ld      hl,$8bfb
b53d cdbe81    call    $81be
b540 2a54ba    ld      hl,($ba54)
b543 cdcd81    call    $81cd
b546 21ff8b    ld      hl,$8bff
b549 cdbe81    call    $81be
b54c 3eff      ld      a,$ff
b54e 32508c    ld      ($8c50),a
b551 cd59b6    call    $b659
b554 c9        ret     

b555 2257ba    ld      ($ba57),hl
b558 eb        ex      de,hl
b559 2259ba    ld      ($ba59),hl
b55c 3e02      ld      a,$02
b55e 215bba    ld      hl,$ba5b
b561 cd6582    call    $8265
b564 2a57ba    ld      hl,($ba57)
b567 cdcd81    call    $81cd
b56a 21038c    ld      hl,$8c03
b56d cdbe81    call    $81be
b570 2a59ba    ld      hl,($ba59)
b573 cdcd81    call    $81cd
b576 21078c    ld      hl,$8c07
b579 cdbe81    call    $81be
b57c 2a5bba    ld      hl,($ba5b)
b57f cdcd81    call    $81cd
b582 210b8c    ld      hl,$8c0b
b585 cdbe81    call    $81be
b588 2a5dba    ld      hl,($ba5d)
b58b cdcd81    call    $81cd
b58e 210f8c    ld      hl,$8c0f
b591 cdbe81    call    $81be
b594 3eff      ld      a,$ff
b596 32508c    ld      ($8c50),a
b599 cd59b6    call    $b659
b59c c9        ret     

b59d 2260ba    ld      ($ba60),hl
b5a0 11ecb5    ld      de,$b5ec
b5a3 2a60ba    ld      hl,($ba60)
b5a6 cd18b8    call    $b818
b5a9 2162ba    ld      hl,$ba62
b5ac cdbe81    call    $81be
b5af 17        rla     
b5b0 9f        sbc     a,a
b5b1 3266ba    ld      ($ba66),a
b5b4 b7        or      a
b5b5 cacab5    jp      z,$b5ca
b5b8 21ecb5    ld      hl,$b5ec
b5bb cdcd81    call    $81cd
b5be 2162ba    ld      hl,$ba62
b5c1 cd8b7d    call    $7d8b
b5c4 2162ba    ld      hl,$ba62
b5c7 cdbe81    call    $81be
b5ca 21f0b5    ld      hl,$b5f0
b5cd cdcd81    call    $81cd
b5d0 2162ba    ld      hl,$ba62
b5d3 cdfe7e    call    $7efe
b5d6 cd807a    call    $7a80
b5d9 2267ba    ld      ($ba67),hl
b5dc 2167ba    ld      hl,$ba67
b5df cdee06    call    $06ee
b5e2 2162ba    ld      hl,$ba62
b5e5 cdf4b5    call    $b5f4
b5e8 cd976c    call    $6c97
b5eb c9        ret     

b5ec 00        nop     
b5ed 00        nop     
b5ee 34        inc     (hl)
b5ef 89        adc     a,c
b5f0 6a        ld      l,d
b5f1 0b        dec     bc
b5f2 3687      ld      (hl),$87
b5f4 226aba    ld      ($ba6a),hl
b5f7 2170ba    ld      hl,$ba70
b5fa cdf106    call    $06f1
b5fd 2a70ba    ld      hl,($ba70)
b600 cdde7f    call    $7fde
b603 2155b6    ld      hl,$b655
b606 cd007e    call    $7e00
b609 2172ba    ld      hl,$ba72
b60c cdbe81    call    $81be
b60f 2172ba    ld      hl,$ba72
b612 cd837a    call    $7a83
b615 2276ba    ld      ($ba76),hl
b618 2176ba    ld      hl,$ba76
b61b cdc87a    call    $7ac8
b61e 2176a6    ld      hl,$a676
b621 cdbe81    call    $81be
b624 2a6aba    ld      hl,($ba6a)
b627 cdbe81    call    $81be
b62a 2176a6    ld      hl,$a676
b62d cdcd81    call    $81cd
b630 216cba    ld      hl,$ba6c
b633 cd007e    call    $7e00
b636 2178ba    ld      hl,$ba78
b639 cdbe81    call    $81be
b63c 2178ba    ld      hl,$ba78
b63f cddb7a    call    $7adb
b642 217aa6    ld      hl,$a67a
b645 cdbe81    call    $81be
b648 2178ba    ld      hl,$ba78
b64b cdcf7a    call    $7acf
b64e 217ea6    ld      hl,$a67e
b651 cdbe81    call    $81be
b654 c9        ret     

b655 5d        ld      e,l
b656 0b        dec     bc
b657 3687      ld      (hl),$87
b659 3a508c    ld      a,($8c50)
b65c b7        or      a
b65d c2deb6    jp      nz,$b6de
b660 21e78b    ld      hl,$8be7
b663 cdcd81    call    $81cd
b666 21e38b    ld      hl,$8be3
b669 cded7d    call    $7ded
b66c 2182ba    ld      hl,$ba82
b66f cdbe81    call    $81be
b672 21d78b    ld      hl,$8bd7
b675 cdcd81    call    $81cd
b678 21d38b    ld      hl,$8bd3
b67b cded7d    call    $7ded
b67e 2182ba    ld      hl,$ba82
b681 cd007e    call    $7e00
b684 21aea6    ld      hl,$a6ae
b687 cdbe81    call    $81be
b68a 21e38b    ld      hl,$8be3
b68d cdfe7e    call    $7efe
b690 21d38b    ld      hl,$8bd3
b693 cded7d    call    $7ded
b696 cd867c    call    $7c86
b699 21aaa6    ld      hl,$a6aa
b69c cdbe81    call    $81be
b69f 21ef8b    ld      hl,$8bef
b6a2 cdcd81    call    $81cd
b6a5 21eb8b    ld      hl,$8beb
b6a8 cded7d    call    $7ded
b6ab 2186ba    ld      hl,$ba86
b6ae cdbe81    call    $81be
b6b1 21df8b    ld      hl,$8bdf
b6b4 cdcd81    call    $81cd
b6b7 21db8b    ld      hl,$8bdb
b6ba cded7d    call    $7ded
b6bd 2186ba    ld      hl,$ba86
b6c0 cd007e    call    $7e00
b6c3 21b6a6    ld      hl,$a6b6
b6c6 cdbe81    call    $81be
b6c9 21eb8b    ld      hl,$8beb
b6cc cdfe7e    call    $7efe
b6cf 21db8b    ld      hl,$8bdb
b6d2 cded7d    call    $7ded
b6d5 cd867c    call    $7c86
b6d8 21b2a6    ld      hl,$a6b2
b6db cdbe81    call    $81be
b6de 21078c    ld      hl,$8c07
b6e1 cdcd81    call    $81cd
b6e4 21038c    ld      hl,$8c03
b6e7 cded7d    call    $7ded
b6ea 2182ba    ld      hl,$ba82
b6ed cdbe81    call    $81be
b6f0 21f78b    ld      hl,$8bf7
b6f3 cdcd81    call    $81cd
b6f6 21f38b    ld      hl,$8bf3
b6f9 cded7d    call    $7ded
b6fc 2182ba    ld      hl,$ba82
b6ff cd007e    call    $7e00
b702 219ea6    ld      hl,$a69e
b705 cdbe81    call    $81be
b708 21038c    ld      hl,$8c03
b70b cdfe7e    call    $7efe
b70e 21f38b    ld      hl,$8bf3
b711 cded7d    call    $7ded
b714 cd867c    call    $7c86
b717 219aa6    ld      hl,$a69a
b71a cdbe81    call    $81be
b71d 210f8c    ld      hl,$8c0f
b720 cdcd81    call    $81cd
b723 210b8c    ld      hl,$8c0b
b726 cded7d    call    $7ded
b729 2186ba    ld      hl,$ba86
b72c cdbe81    call    $81be
b72f 21ff8b    ld      hl,$8bff
b732 cdcd81    call    $81cd
b735 21fb8b    ld      hl,$8bfb
b738 cded7d    call    $7ded
b73b 2186ba    ld      hl,$ba86
b73e cd007e    call    $7e00
b741 21a6a6    ld      hl,$a6a6
b744 cdbe81    call    $81be
b747 210b8c    ld      hl,$8c0b
b74a cdfe7e    call    $7efe
b74d 21fb8b    ld      hl,$8bfb
b750 cded7d    call    $7ded
b753 cd867c    call    $7c86
b756 21a2a6    ld      hl,$a6a2
b759 cdbe81    call    $81be
b75c 21aea6    ld      hl,$a6ae
b75f cdcd81    call    $81cd
b762 219ea6    ld      hl,$a69e
b765 cdfe7e    call    $7efe
b768 218ea6    ld      hl,$a68e
b76b cdbe81    call    $81be
b76e 21aea6    ld      hl,$a6ae
b771 cdcd81    call    $81cd
b774 219aa6    ld      hl,$a69a
b777 cdfe7e    call    $7efe
b77a 21aaa6    ld      hl,$a6aa
b77d cd8b7d    call    $7d8b
b780 218aa6    ld      hl,$a68a
b783 cdbe81    call    $81be
b786 21b6a6    ld      hl,$a6b6
b789 cdcd81    call    $81cd
b78c 21a6a6    ld      hl,$a6a6
b78f cdfe7e    call    $7efe
b792 2196a6    ld      hl,$a696
b795 cdbe81    call    $81be
b798 21b6a6    ld      hl,$a6b6
b79b cdcd81    call    $81cd
b79e 21a2a6    ld      hl,$a6a2
b7a1 cdfe7e    call    $7efe
b7a4 21b2a6    ld      hl,$a6b2
b7a7 cd8b7d    call    $7d8b
b7aa 2192a6    ld      hl,$a692
b7ad cdbe81    call    $81be
b7b0 af        xor     a
b7b1 32508c    ld      ($8c50),a
b7b4 21aea6    ld      hl,$a6ae
b7b7 cdcd81    call    $81cd
b7ba 21f38b    ld      hl,$8bf3
b7bd cdfe7e    call    $7efe
b7c0 21aaa6    ld      hl,$a6aa
b7c3 cd8b7d    call    $7d8b
b7c6 21238c    ld      hl,$8c23
b7c9 cdbe81    call    $81be
b7cc 21aea6    ld      hl,$a6ae
b7cf cdcd81    call    $81cd
b7d2 21f78b    ld      hl,$8bf7
b7d5 cdfe7e    call    $7efe
b7d8 21aaa6    ld      hl,$a6aa
b7db cd8b7d    call    $7d8b
b7de 21278c    ld      hl,$8c27
b7e1 cdbe81    call    $81be
b7e4 21b6a6    ld      hl,$a6b6
b7e7 cdcd81    call    $81cd
b7ea 21fb8b    ld      hl,$8bfb
b7ed cdfe7e    call    $7efe
b7f0 21b2a6    ld      hl,$a6b2
b7f3 cd8b7d    call    $7d8b
b7f6 212b8c    ld      hl,$8c2b
b7f9 cdbe81    call    $81be
b7fc 21b6a6    ld      hl,$a6b6
b7ff cdcd81    call    $81cd
b802 21ff8b    ld      hl,$8bff
b805 cdfe7e    call    $7efe
b808 21b2a6    ld      hl,$a6b2
b80b cd8b7d    call    $7d8b
b80e 212f8c    ld      hl,$8c2f
b811 cdbe81    call    $81be
b814 cddf68    call    $68df
b817 c9        ret     

b818 cd77b8    call    $b877
b81b cafd81    jp      z,$81fd
b81e cdad80    call    $80ad
b821 c5        push    bc
b822 d5        push    de
b823 cd067e    call    $7e06
b826 f5        push    af
b827 fc867c    call    m,$7c86
b82a cd767f    call    $7f76
b82d f1        pop     af
b82e fc867c    call    m,$7c86
b831 d1        pop     de
b832 c1        pop     bc
b833 cd047f    call    $7f04
b836 c1        pop     bc
b837 d1        pop     de
b838 cd7480    call    $8074
b83b c3f07d    jp      $7df0
b83e cd7782    call    $8277
b841 3e80      ld      a,$80
b843 cd4db8    call    $b84d
b846 c3867c    jp      $7c86
b849 cd7782    call    $8277
b84c af        xor     a
b84d 32e88a    ld      ($8ae8),a
b850 cd65b8    call    $b865
b853 cdd681    call    $81d6
b856 cd65b8    call    $b865
b859 dafd81    jp      c,$81fd
b85c cdb07f    call    $7fb0
b85f dcd681    call    c,$81d6
b862 c356b8    jp      $b856
b865 cd8b82    call    $828b
b868 d8        ret     c

b869 cdee81    call    $81ee
b86c c8        ret     z

b86d 3ae88a    ld      a,($8ae8)
b870 b7        or      a
b871 c8        ret     z

b872 3e80      ld      a,$80
b874 a9        xor     c
b875 4f        ld      c,a
b876 c9        ret     

b877 d5        push    de
b878 cdcd81    call    $81cd
b87b e1        pop     hl
b87c c3ee81    jp      $81ee
b87f 00        nop     
b880 9b        sbc     a,e
b881 a8        xor     b
b882 cba7      res     4,a
b884 b5        or      l
b885 b8        cp      b
b886 00        nop     
b887 00        nop     
b888 00        nop     
b889 00        nop     
b88a 00        nop     
b88b 00        nop     
b88c 00        nop     
b88d 05        dec     b
b88e 00        nop     
b88f 00        nop     
b890 00        nop     
b891 2083      jr      nz,$b816
b893 010000    ld      bc,$0000
b896 00        nop     
b897 00        nop     
b898 00        nop     
b899 2083      jr      nz,$b81e
b89b 00        nop     
b89c 00        nop     
b89d ff        rst     $38
b89e 00        nop     
b89f 9b        sbc     a,e
b8a0 a8        xor     b
b8a1 cba7      res     4,a
b8a3 3c        inc     a
b8a4 8e        adc     a,(hl)
b8a5 40        ld      b,b
b8a6 8e        adc     a,(hl)
b8a7 46        ld      b,(hl)
b8a8 8e        adc     a,(hl)
b8a9 5b        ld      e,e
b8aa ab        xor     e
b8ab 00        nop     
b8ac 00        nop     
b8ad 00        nop     
b8ae 00        nop     
b8af 00        nop     
b8b0 00        nop     
b8b1 00        nop     
b8b2 00        nop     
b8b3 00        nop     
b8b4 00        nop     
b8b5 00        nop     
b8b6 00        nop     
b8b7 00        nop     
b8b8 00        nop     
b8b9 00        nop     
b8ba 00        nop     
b8bb 00        nop     
b8bc 00        nop     
b8bd 00        nop     
b8be 00        nop     
b8bf 00        nop     
b8c0 00        nop     
b8c1 00        nop     
b8c2 00        nop     
b8c3 00        nop     
b8c4 ff        rst     $38
b8c5 00        nop     
b8c6 80        add     a,b
b8c7 3b        dec     sp
b8c8 8b        adc     a,e
b8c9 c1        pop     bc
b8ca 8e        adc     a,(hl)
b8cb bd        cp      l
b8cc 8e        adc     a,(hl)
b8cd c5        push    bc
b8ce b8        cp      b
b8cf 44        ld      b,h
b8d0 8e        adc     a,(hl)
b8d1 ab        xor     e
b8d2 b8        cp      b
b8d3 00        nop     
b8d4 98        sbc     a,b
b8d5 92        sub     d
b8d6 98        sbc     a,b
b8d7 a8        xor     b
b8d8 9b        sbc     a,e
b8d9 a8        xor     b
b8da cba7      res     4,a
b8dc 00        nop     
b8dd 00        nop     
b8de 00        nop     
b8df 00        nop     
b8e0 34        inc     (hl)
b8e1 8e        adc     a,(hl)
b8e2 388e      jr      c,$b872
b8e4 44        ld      b,h
b8e5 8e        adc     a,(hl)
b8e6 59        ld      e,c
b8e7 ab        xor     e
b8e8 3c        inc     a
b8e9 8e        adc     a,(hl)
b8ea 40        ld      b,b
b8eb 8e        adc     a,(hl)
b8ec 46        ld      b,(hl)
b8ed 8e        adc     a,(hl)
b8ee 5b        ld      e,e
b8ef ab        xor     e
b8f0 44        ld      b,h
b8f1 8e        adc     a,(hl)
b8f2 3c        inc     a
b8f3 8e        adc     a,(hl)
b8f4 40        ld      b,b
b8f5 8e        adc     a,(hl)
b8f6 46        ld      b,(hl)
b8f7 8e        adc     a,(hl)
b8f8 00        nop     
b8f9 8e        adc     a,(hl)
b8fa 108e      djnz    $b88a
b8fc 00        nop     
b8fd 34        inc     (hl)
b8fe 8e        adc     a,(hl)
b8ff 388e      jr      c,$b88f
b901 44        ld      b,h
b902 8e        adc     a,(hl)
b903 3c        inc     a
b904 8e        adc     a,(hl)
b905 40        ld      b,b
b906 8e        adc     a,(hl)
b907 46        ld      b,(hl)
b908 8e        adc     a,(hl)
b909 00        nop     
b90a 8e        adc     a,(hl)
b90b 108e      djnz    $b89b
b90d 00        nop     
b90e 00        nop     
b90f 00        nop     
b910 00        nop     
b911 00        nop     
b912 00        nop     
b913 00        nop     
b914 00        nop     
b915 00        nop     
b916 00        nop     
b917 00        nop     
b918 80        add     a,b
b919 00        nop     
b91a 00        nop     
b91b 00        nop     
b91c 81        add     a,c
b91d 00        nop     
b91e 00        nop     
b91f 00        nop     
b920 82        add     a,d
b921 00        nop     
b922 60        ld      h,b
b923 6a        ld      l,d
b924 8e        adc     a,(hl)
b925 00        nop     
b926 80        add     a,b
b927 3b        dec     sp
b928 8b        adc     a,e
b929 00        nop     
b92a 00        nop     
b92b 00        nop     
b92c 81        add     a,c
b92d 00        nop     
b92e 80        add     a,b
b92f 3b        dec     sp
b930 8a        adc     a,d
b931 00        nop     
b932 00        nop     
b933 00        nop     
b934 80        add     a,b
b935 ff        rst     $38
b936 00        nop     
b937 80        add     a,b
b938 bb        cp      e
b939 8a        adc     a,d
b93a 00        nop     
b93b 1876      jr      $b9b3
b93d 8e        adc     a,(hl)
b93e 00        nop     
b93f 00        nop     
b940 00        nop     
b941 80        add     a,b
b942 00        nop     
b943 00        nop     
b944 3083      jr      nc,$b8c9
b946 02        ld      (bc),a
b947 dd1f      rra     
b949 7d        ld      a,l
b94a 00        nop     
b94b 00        nop     
b94c 00        nop     
b94d 00        nop     
b94e d28438    jp      nc,$3884
b951 7c        ld      a,h
b952 a5        and     l
b953 6f        ld      l,a
b954 13        inc     de
b955 7e        ld      a,(hl)
b956 11b919    ld      de,$19b9
b959 b9        cp      c
b95a 00        nop     
b95b 51        ld      d,c
b95c ec597b    call    pe,$7b59
b95f d28438    jp      nc,$3884
b962 7a        ld      a,d
b963 44        ld      b,h
b964 8e        adc     a,(hl)
b965 00        nop     
b966 8e        adc     a,(hl)
b967 ef        rst     $28
b968 a5        and     l
b969 5b        ld      e,e
b96a b9        cp      c
b96b 5f        ld      e,a
b96c b9        cp      c
b96d 0a        ld      a,(bc)
b96e d7        rst     $10
b96f a3        and     e
b970 7a        ld      a,d
b971 68        ld      l,b
b972 cc887b    call    z,$7b88
b975 46        ld      b,(hl)
b976 8e        adc     a,(hl)
b977 108e      djnz    $b907
b979 f1        pop     af
b97a a5        and     l
b97b 5b        ld      e,e
b97c b9        cp      c
b97d 5f        ld      e,a
b97e b9        cp      c
b97f 010000    ld      bc,$0000
b982 00        nop     
b983 34        inc     (hl)
b984 87        add     a,a
b985 ff        rst     $38
b986 ba        cp      d
b987 76        halt    
b988 7f        ld      a,a
b989 c3ba0d    jp      $0dba
b98c 7b        ld      a,e
b98d 0c        inc     c
b98e 00        nop     
b98f 0100eb    ld      bc,$eb00
b992 51        ld      d,c
b993 387d      jr      c,$ba12
b995 d0        ret     nc

b996 fd09      add     iy,bc
b998 80        add     a,b
b999 010001    ld      bc,$0100
b99c 00        nop     
b99d 73        ld      (hl),e
b99e 90        sub     b
b99f 02        ld      (bc),a
b9a0 dd1f      rra     
b9a2 7d        ld      a,l
b9a3 00        nop     
b9a4 00        nop     
b9a5 00        nop     
b9a6 81        add     a,c
b9a7 3d        dec     a
b9a8 82        add     a,d
b9a9 46        ld      b,(hl)
b9aa 7e        ld      a,(hl)
b9ab 02        ld      (bc),a
b9ac 79        ld      a,c
b9ad 70        ld      (hl),b
b9ae 80        add     a,b
b9af a7        and     a
b9b0 b9        cp      c
b9b1 ab        xor     e
b9b2 b9        cp      c
b9b3 3eb9      ld      a,$b9
b9b5 42        ld      b,d
b9b6 b9        cp      c
b9b7 3eb9      ld      a,$b9
b9b9 388e      jr      c,$b949
b9bb 44        ld      b,h
b9bc 8e        adc     a,(hl)
b9bd 6d        ld      l,l
b9be b9        cp      c
b9bf 00        nop     
b9c0 8e        adc     a,(hl)
b9c1 ef        rst     $28
b9c2 a5        and     l
b9c3 3c        inc     a
b9c4 8e        adc     a,(hl)
b9c5 40        ld      b,b
b9c6 8e        adc     a,(hl)
b9c7 46        ld      b,(hl)
b9c8 8e        adc     a,(hl)
b9c9 6d        ld      l,l
b9ca b9        cp      c
b9cb 108e      djnz    $b95b
b9cd f1        pop     af
b9ce a5        and     l
b9cf bd        cp      l
b9d0 5f        ld      e,a
b9d1 73        ld      (hl),e
b9d2 7a        ld      a,d
b9d3 0a        ld      a,(bc)
b9d4 d7        rst     $10
b9d5 23        inc     hl
b9d6 7b        ld      a,e
b9d7 bd        cp      l
b9d8 5f        ld      e,a
b9d9 f3        di      
b9da 7a        ld      a,d
b9db 0a        ld      a,(bc)
b9dc d7        rst     $10
b9dd a3        and     e
b9de 7b        ld      a,e
b9df 3eb9      ld      a,$b9
b9e1 388e      jr      c,$b971
b9e3 44        ld      b,h
b9e4 8e        adc     a,(hl)
b9e5 d3b9      out     ($b9),a
b9e7 c6b3      add     a,$b3
b9e9 3c        inc     a
b9ea 8e        adc     a,(hl)
b9eb 40        ld      b,b
b9ec 8e        adc     a,(hl)
b9ed 46        ld      b,(hl)
b9ee 8e        adc     a,(hl)
b9ef d7        rst     $10
b9f0 b9        cp      c
b9f1 c6b3      add     a,$b3
b9f3 42        ld      b,d
b9f4 b9        cp      c
b9f5 34        inc     (hl)
b9f6 8e        adc     a,(hl)
b9f7 44        ld      b,h
b9f8 8e        adc     a,(hl)
b9f9 dbb9      in      a,($b9)
b9fb c6b3      add     a,$b3
b9fd 40        ld      b,b
b9fe 8e        adc     a,(hl)
b9ff 3c        inc     a
ba00 8e        adc     a,(hl)
ba01 46        ld      b,(hl)
ba02 8e        adc     a,(hl)
ba03 cf        rst     $08
ba04 b9        cp      c
ba05 c6b3      add     a,$b3
ba07 00        nop     
ba08 3c        inc     a
ba09 8e        adc     a,(hl)
ba0a 29        add     hl,hl
ba0b b9        cp      c
ba0c 46        ld      b,(hl)
ba0d 8e        adc     a,(hl)
ba0e 108e      djnz    $b99e
ba10 f1        pop     af
ba11 a5        and     l
ba12 5b        ld      e,e
ba13 b9        cp      c
ba14 5f        ld      e,a
ba15 b9        cp      c
ba16 54        ld      d,h
ba17 48        ld      c,b
ba18 55        ld      d,l
ba19 00        nop     
ba1a 46        ld      b,(hl)
ba1b 52        ld      d,d
ba1c 49        ld      c,c
ba1d 00        nop     
ba1e 53        ld      d,e
ba1f 41        ld      b,c
ba20 54        ld      d,h
ba21 00        nop     
ba22 0c        inc     c
ba23 00        nop     
ba24 04        inc     b
ba25 4a        ld      c,d
ba26 41        ld      b,c
ba27 4e        ld      c,(hl)
ba28 00        nop     
ba29 46        ld      b,(hl)
ba2a 45        ld      b,l
ba2b 00        nop     
ba2c 00        nop     
ba2d 00        nop     
ba2e 00        nop     
ba2f 00        nop     
ba30 00        nop     
ba31 00        nop     
ba32 00        nop     
ba33 00        nop     
ba34 2083      jr      nz,$b9b9
ba36 00        nop     
ba37 00        nop     
ba38 00        nop     
ba39 81        add     a,c
ba3a 05        dec     b
ba3b 00        nop     
ba3c 04        inc     b
ba3d 00        nop     
ba3e 188e      jr      $b9ce
ba40 00        nop     
ba41 55        ld      d,l
ba42 ab        xor     e
ba43 00        nop     
ba44 00        nop     
ba45 11b919    ld      de,$19b9
ba48 b9        cp      c
ba49 11b919    ld      de,$19b9
ba4c b9        cp      c
ba4d 00        nop     
ba4e 9f        sbc     a,a
ba4f b9        cp      c
ba50 a3        and     e
ba51 b9        cp      c
ba52 a7        and     a
ba53 b9        cp      c
ba54 ab        xor     e
ba55 b9        cp      c
ba56 00        nop     
ba57 36b9      ld      (hl),$b9
ba59 3ab93e    ld      a,($3eb9)
ba5c b9        cp      c
ba5d 42        ld      b,d
ba5e b9        cp      c
ba5f 00        nop     
ba60 11b900    ld      de,$00b9
ba63 00        nop     
ba64 00        nop     
ba65 00        nop     
ba66 00        nop     
ba67 00        nop     
ba68 00        nop     
ba69 00        nop     
ba6a 62        ld      h,d
ba6b ba        cp      d
ba6c e62e      and     $2e
ba6e 65        ld      h,l
ba6f 86        add     a,(hl)
ba70 00        nop     
ba71 00        nop     
ba72 00        nop     
ba73 00        nop     
ba74 00        nop     
ba75 00        nop     
ba76 00        nop     
ba77 00        nop     
ba78 00        nop     
ba79 00        nop     
ba7a 00        nop     
ba7b 00        nop     
ba7c 00        nop     
ba7d 00        nop     
ba7e 00        nop     
ba7f 00        nop     
ba80 00        nop     
ba81 80        add     a,b
ba82 00        nop     
ba83 e8        ret     pe

ba84 00        nop     
ba85 8f        adc     a,a
ba86 00        nop     
ba87 00        nop     
ba88 2083      jr      nz,$ba0d
ba8a 4f        ld      c,a
ba8b 52        ld      d,d
ba8c 7c        ld      a,h
ba8d 52        ld      d,d
ba8e 45        ld      b,l
ba8f 46        ld      b,(hl)
ba90 45        ld      b,l
ba91 52        ld      d,d
ba92 45        ld      b,l
ba93 53        ld      d,e
ba94 48        ld      c,b
ba95 41        ld      b,c
ba96 50        ld      d,b
ba97 45        ld      b,l
ba98 7c        ld      a,h
ba99 05        dec     b
ba9a 00        nop     
ba9b 06d4      ld      b,$d4
ba9d 45        ld      b,l
ba9e 58        ld      e,b
ba9f 54        ld      d,h
baa0 7c        ld      a,h
baa1 7c        ld      a,h
baa2 ce41      adc     a,$41
baa4 4d        ld      c,l
baa5 45        ld      b,l
baa6 7c        ld      a,h
baa7 7c        ld      a,h
baa8 cc4142    call    z,$4241
baab 45        ld      b,l
baac 4c        ld      c,h
baad 7c        ld      a,h
baae d44954    call    nc,$5449
bab1 4c        ld      c,h
bab2 45        ld      b,l
bab3 7c        ld      a,h
bab4 cc4547    call    z,$4745
bab7 45        ld      b,l
bab8 4e        ld      c,(hl)
bab9 44        ld      b,h
baba 00        nop     
babb 00        nop     
babc 00        nop     
babd 00        nop     
babe 00        nop     
babf 00        nop     
bac0 00        nop     
bac1 00        nop     
bac2 00        nop     
bac3 00        nop     
bac4 00        nop     
bac5 00        nop     
bac6 00        nop     
bac7 00        nop     
bac8 00        nop     
bac9 00        nop     
baca 00        nop     
bacb 00        nop     
bacc 00        nop     
bacd 00        nop     
bace 00        nop     
bacf 00        nop     
bad0 00        nop     
bad1 00        nop     
bad2 00        nop     
bad3 010006    ld      bc,$0600
bad6 50        ld      d,b
bad7 45        ld      b,l
bad8 52        ld      d,d
bad9 4d        ld      c,l
bada 41        ld      b,c
badb 4e        ld      c,(hl)
badc 00        nop     
badd 00        nop     
bade 00        nop     
badf 00        nop     
bae0 00        nop     
bae1 00        nop     
bae2 00        nop     
bae3 00        nop     
bae4 00        nop     
bae5 00        nop     
bae6 9c        sbc     a,h
bae7 92        sub     d
bae8 a4        and     h
bae9 92        sub     d
baea 00        nop     
baeb 00        nop     
baec 00        nop     
baed 00        nop     
baee 42        ld      b,d
baef af        xor     a
baf0 00        nop     
baf1 00        nop     
baf2 eaba00    jp      pe,$00ba
baf5 00        nop     
baf6 00        nop     
baf7 00        nop     
baf8 05        dec     b
baf9 00        nop     
bafa 0642      ld      b,$42
bafc 45        ld      b,l
bafd 47        ld      b,a
bafe 49        ld      c,c
baff 4e        ld      c,(hl)
bb00 53        ld      d,e
bb01 45        ld      b,l
bb02 4e        ld      c,(hl)
bb03 44        ld      b,h
bb04 53        ld      d,e
bb05 7c        ld      a,h
bb06 7c        ld      a,h
bb07 cd4153    call    $5341
bb0a 4b        ld      c,e
bb0b 7c        ld      a,h
bb0c 7c        ld      a,h
bb0d cd4958    call    $5849
bb10 45        ld      b,l
bb11 44        ld      b,h
bb12 7c        ld      a,h
bb13 49        ld      c,c
bb14 47        ld      b,a
bb15 4e        ld      c,(hl)
bb16 4f        ld      c,a
bb17 52        ld      d,d
bb18 45        ld      b,l
bb19 02        ld      (bc),a
bb1a 00        nop     
bb1b 064c      ld      b,$4c
bb1d 45        ld      b,l
bb1e 46        ld      b,(hl)
bb1f 54        ld      d,h
bb20 7c        ld      a,h
bb21 7c        ld      a,h
bb22 52        ld      d,d
bb23 49        ld      c,c
bb24 47        ld      b,a
bb25 48        ld      c,b
bb26 54        ld      d,h
bb27 7c        ld      a,h
bb28 02        ld      (bc),a
bb29 00        nop     
bb2a 064c      ld      b,$4c
bb2c 49        ld      c,c
bb2d 4e        ld      c,(hl)
bb2e 45        ld      b,l
bb2f 7c        ld      a,h
bb30 7c        ld      a,h
bb31 46        ld      b,(hl)
bb32 49        ld      c,c
bb33 45        ld      b,l
bb34 4c        ld      c,h
bb35 44        ld      b,h
bb36 7c        ld      a,h
bb37 00        nop     
bb38 00        nop     
bb39 00        nop     
bb3a 00        nop     
bb3b 00        nop     
bb3c 00        nop     
bb3d 00        nop     
bb3e 00        nop     
bb3f 00        nop     
bb40 00        nop     
bb41 00        nop     
bb42 00        nop     
bb43 00        nop     
bb44 00        nop     
bb45 00        nop     
bb46 00        nop     
bb47 02        ld      (bc),a
bb48 00        nop     
bb49 0642      ld      b,$42
bb4b 45        ld      b,l
bb4c 47        ld      b,a
bb4d 49        ld      c,c
bb4e 4e        ld      c,(hl)
bb4f 53        ld      d,e
bb50 45        ld      b,l
bb51 4e        ld      c,(hl)
bb52 44        ld      b,h
bb53 53        ld      d,e
bb54 7c        ld      a,h
bb55 7c        ld      a,h
bb56 02        ld      (bc),a
bb57 00        nop     
bb58 0652      ld      b,$52
bb5a 4f        ld      c,a
bb5b 57        ld      d,a
bb5c 7c        ld      a,h
bb5d 7c        ld      a,h
bb5e 7c        ld      a,h
bb5f 43        ld      b,e
bb60 4f        ld      c,a
bb61 4c        ld      c,h
bb62 55        ld      d,l
bb63 4d        ld      c,l
bb64 4e        ld      c,(hl)
bb65 00        nop     
bb66 00        nop     
bb67 00        nop     
bb68 00        nop     
bb69 00        nop     
bb6a 00        nop     
bb6b 00        nop     
bb6c 00        nop     
bb6d 00        nop     
bb6e 00        nop     
bb6f 00        nop     
bb70 00        nop     
bb71 00        nop     
bb72 00        nop     
bb73 00        nop     
bb74 00        nop     
bb75 00        nop     
bb76 00        nop     
bb77 04        inc     b
bb78 00        nop     
bb79 0641      ld      b,$41
bb7b 55        ld      d,l
bb7c 54        ld      d,h
bb7d 4f        ld      c,a
bb7e 4d        ld      c,l
bb7f 41        ld      b,c
bb80 4a        ld      c,d
bb81 4f        ld      c,a
bb82 59        ld      e,c
bb83 7c        ld      a,h
bb84 7c        ld      a,h
bb85 7c        ld      a,h
bb86 53        ld      d,e
bb87 49        ld      c,c
bb88 4e        ld      c,(hl)
bb89 47        ld      b,a
bb8a 4c        ld      c,h
bb8b 45        ld      b,l
bb8c 53        ld      d,e
bb8d 49        ld      c,c
bb8e 5a        ld      e,d
bb8f 45        ld      b,l
bb90 7c        ld      a,h
bb91 7c        ld      a,h
bb92 00        nop     
bb93 00        nop     
bb94 00        nop     
bb95 00        nop     
bb96 010000    ld      bc,$0000
bb99 00        nop     
bb9a 00        nop     
bb9b 00        nop     
bb9c 00        nop     
bb9d 00        nop     
bb9e 00        nop     
bb9f 00        nop     
bba0 00        nop     
bba1 00        nop     
bba2 00        nop     
bba3 00        nop     
bba4 00        nop     
bba5 00        nop     
bba6 00        nop     
bba7 00        nop     
bba8 00        nop     
bba9 00        nop     
bbaa 00        nop     
bbab 00        nop     
bbac 00        nop     
bbad 00        nop     
bbae 00        nop     
bbaf 00        nop     
bbb0 00        nop     
bbb1 00        nop     
bbb2 00        nop     
bbb3 00        nop     
bbb4 00        nop     
bbb5 00        nop     
bbb6 00        nop     
bbb7 00        nop     
bbb8 00        nop     
bbb9 00        nop     
bbba 00        nop     
bbbb 00        nop     
bbbc 00        nop     
bbbd 00        nop     
bbbe 00        nop     
bbbf 00        nop     
bbc0 00        nop     
bbc1 00        nop     
bbc2 00        nop     
bbc3 00        nop     
bbc4 00        nop     
bbc5 d9        exx     
bbc6 0f        rrca    
bbc7 49        ld      c,c
bbc8 83        add     a,e
bbc9 39        add     hl,sp
bbca fa0e7b    jp      m,$7b0e
bbcd 00        nop     
bbce 00        nop     
bbcf 00        nop     
bbd0 00        nop     
bbd1 00        nop     
bbd2 00        nop     
bbd3 00        nop     
bbd4 00        nop     
bbd5 00        nop     
bbd6 00        nop     
bbd7 00        nop     
bbd8 00        nop     
bbd9 00        nop     
bbda 00        nop     
bbdb 00        nop     
bbdc 00        nop     
bbdd 00        nop     
bbde 00        nop     
bbdf 00        nop     
bbe0 00        nop     
bbe1 00        nop     
bbe2 00        nop     
bbe3 00        nop     
bbe4 00        nop     
bbe5 00        nop     
bbe6 00        nop     
bbe7 00        nop     
bbe8 00        nop     
bbe9 00        nop     
bbea 00        nop     
bbeb 00        nop     
bbec 00        nop     
bbed 00        nop     
bbee 00        nop     
bbef 00        nop     
bbf0 00        nop     
bbf1 00        nop     
bbf2 00        nop     
bbf3 00        nop     
bbf4 00        nop     
bbf5 00        nop     
bbf6 00        nop     
bbf7 00        nop     
bbf8 00        nop     
bbf9 00        nop     
bbfa 00        nop     
bbfb 00        nop     
bbfc 00        nop     
bbfd 00        nop     
bbfe 00        nop     
bbff 00        nop     
bc00 00        nop     
bc01 00        nop     
bc02 00        nop     
bc03 00        nop     
bc04 00        nop     
bc05 00        nop     
bc06 00        nop     
bc07 00        nop     
bc08 00        nop     
bc09 00        nop     
bc0a 00        nop     
bc0b 00        nop     
bc0c 00        nop     
bc0d 00        nop     
bc0e 00        nop     
bc0f 00        nop     
bc10 00        nop     
bc11 00        nop     
bc12 00        nop     
bc13 00        nop     
bc14 00        nop     
bc15 00        nop     
bc16 00        nop     
bc17 00        nop     
bc18 00        nop     
bc19 00        nop     
bc1a 00        nop     
bc1b 00        nop     
bc1c 00        nop     
bc1d 00        nop     
bc1e 00        nop     
bc1f 00        nop     
bc20 00        nop     
bc21 00        nop     
bc22 00        nop     
bc23 00        nop     
bc24 00        nop     
bc25 00        nop     
bc26 00        nop     
bc27 00        nop     
bc28 00        nop     
bc29 00        nop     
bc2a 00        nop     
bc2b 00        nop     
bc2c 00        nop     
bc2d 00        nop     
bc2e 00        nop     
bc2f 00        nop     
bc30 00        nop     
bc31 00        nop     
bc32 00        nop     
bc33 00        nop     
bc34 00        nop     
bc35 00        nop     
bc36 00        nop     
bc37 00        nop     
bc38 00        nop     
bc39 00        nop     
bc3a 00        nop     
bc3b 00        nop     
bc3c 00        nop     
bc3d 00        nop     
bc3e 00        nop     
bc3f 00        nop     
bc40 00        nop     
bc41 00        nop     
bc42 e62e      and     $2e
bc44 65        ld      h,l
bc45 86        add     a,(hl)
bc46 00        nop     
bc47 00        nop     
bc48 00        nop     
bc49 00        nop     
bc4a 00        nop     
bc4b 00        nop     
bc4c 00        nop     
bc4d 00        nop     
bc4e 00        nop     
bc4f 00        nop     
bc50 00        nop     
bc51 00        nop     
bc52 00        nop     
bc53 00        nop     
bc54 00        nop     
bc55 00        nop     
bc56 00        nop     
bc57 00        nop     
bc58 00        nop     
bc59 00        nop     
bc5a 00        nop     
bc5b 00        nop     
bc5c 00        nop     
bc5d 00        nop     
bc5e 00        nop     
bc5f 00        nop     
bc60 00        nop     
bc61 00        nop     
bc62 00        nop     
bc63 00        nop     
bc64 00        nop     
bc65 00        nop     
bc66 00        nop     
bc67 00        nop     
bc68 00        nop     
bc69 00        nop     
bc6a 00        nop     
bc6b 00        nop     
bc6c 80        add     a,b
bc6d 00        nop     
bc6e 00        nop     
bc6f 00        nop     
bc70 00        nop     
bc71 00        nop     
bc72 00        nop     
bc73 00        nop     
bc74 00        nop     
bc75 bc        cp      h
bc76 46        ld      b,(hl)
bc77 b5        or      l
bc78 ff        rst     $38
bc79 010001    ld      bc,$0100
bc7c 00        nop     
bc7d 02        ld      (bc),a
bc7e 00        nop     
bc7f 010004    ld      bc,$0400
bc82 00        nop     
bc83 c7        rst     $00
bc84 bb        cp      e
bc85 310810    ld      sp,$1008
bc88 80        add     a,b
bc89 cbbb      res     7,e
bc8b 5c        ld      e,h
bc8c 8f        adc     a,a
bc8d 82        add     a,d
bc8e 80        add     a,b
bc8f 46        ld      b,(hl)
bc90 8f        adc     a,a
bc91 02        ld      (bc),a
bc92 80        add     a,b
bc93 21f242    ld      hl,$42f2
bc96 7f        ld      a,a
bc97 3c        inc     a
bc98 8f        adc     a,a
bc99 02        ld      (bc),a
bc9a 80        add     a,b
bc9b 4e        ld      c,(hl)
bc9c 08        ex      af,af'
bc9d 1080      djnz    $bc1f
bc9f f4b766    call    p,$66b7
bca2 6d        ld      l,l
bca3 00        nop     
bca4 90        sub     b
bca5 bb        cp      e
bca6 ad        xor     l
bca7 ae        xor     (hl)
bca8 34        inc     (hl)
bca9 2e31      ld      l,$31
bcab 00        nop     
bcac 00        nop     
bcad 00        nop     
bcae 00        nop     
bcaf 00        nop     
bcb0 00        nop     
bcb1 00        nop     
bcb2 00        nop     
bcb3 00        nop     
bcb4 00        nop     
bcb5 00        nop     
bcb6 00        nop     
bcb7 00        nop     
bcb8 00        nop     
bcb9 00        nop     
bcba 00        nop     
bcbb 22bb2a    ld      ($2abb),hl
bcbe bb        cp      e
bcbf 22bb2a    ld      ($2abb),hl
bcc2 bb        cp      e
bcc3 00        nop     
bcc4 22bb2a    ld      ($2abb),hl
bcc7 bb        cp      e
bcc8 22bb2a    ld      ($2abb),hl
bccb bb        cp      e
bccc 00        nop     
bccd 22bb2a    ld      ($2abb),hl
bcd0 bb        cp      e
bcd1 22bb2a    ld      ($2abb),hl
bcd4 bb        cp      e
bcd5 00        nop     
bcd6 00        nop     
bcd7 00        nop     
bcd8 00        nop     
bcd9 00        nop     
bcda 80        add     a,b
bcdb 00        nop     
bcdc 00        nop     
bcdd 00        nop     
bcde 81        add     a,c
bcdf 00        nop     
bce0 00        nop     
bce1 00        nop     
bce2 81        add     a,c
bce3 00        nop     
bce4 00        nop     
bce5 00        nop     
bce6 81        add     a,c
bce7 d631      sub     $31
bce9 e26e33    jp      po,$336e
bcec b8        cp      b
bced 2f        cpl     
bcee 7f        ld      a,a
bcef 13        inc     de
bcf0 00        nop     
bcf1 80        add     a,b
bcf2 80        add     a,b
bcf3 0f        rrca    
bcf4 ec607e    call    pe,$7e60
bcf7 eebb      xor     $bb
bcf9 40        ld      b,b
bcfa 83        add     a,e
bcfb d1        pop     de
bcfc 0f        rrca    
bcfd 49        ld      c,c
bcfe 83        add     a,e
bcff 00        nop     
bd00 00        nop     
bd01 00        nop     
bd02 80        add     a,b
bd03 6c        ld      l,h
bd04 b8        cp      b
bd05 2f        cpl     
bd06 7f        ld      a,a
bd07 0f        rrca    
bd08 ec607e    call    pe,$7e60
bd0b 64        ld      h,h
bd0c 00        nop     
bd0d cf        rst     $08
bd0e 53        ld      d,e
bd0f 7b        ld      a,e
bd10 83        add     a,e
bd11 cf        rst     $08
bd12 53        ld      d,e
bd13 7b        ld      a,e
bd14 83        add     a,e
bd15 17        rla     
bd16 bf        cp      a
bd17 83        add     a,e
bd18 7f        ld      a,a
bd19 e25ca3    jp      po,$a35c
bd1c 6f        ld      l,a
bd1d 78        ld      a,b
bd1e be        cp      (hl)
bd1f 03        inc     bc
bd20 7f        ld      a,a
bd21 3661      ld      (hl),$61
bd23 77        ld      (hl),a
bd24 80        add     a,b
bd25 010000    ld      bc,$0000
bd28 81        add     a,c
bd29 4a        ld      c,d
bd2a 61        ld      h,c
bd2b 77        ld      (hl),a
bd2c 80        add     a,b
bd2d 8f        adc     a,a
bd2e c2757a    jp      nz,$7a75
bd31 00        nop     
bd32 00        nop     
bd33 00        nop     
bd34 80        add     a,b
bd35 6c        ld      l,h
bd36 b8        cp      b
bd37 2f        cpl     
bd38 7f        ld      a,a
bd39 0a        ld      a,(bc)
bd3a d7        rst     $10
bd3b 23        inc     hl
bd3c 7b        ld      a,e
bd3d 1a        ld      a,(de)
bd3e 00        nop     
bd3f ba        cp      d
bd40 a6        and     (hl)
bd41 4a        ld      c,d
bd42 014152    ld      bc,$5241
bd45 49        ld      c,c
bd46 54        ld      d,h
bd47 48        ld      c,b
bd48 2020      jr      nz,$bd6a
bd4a 202b      jr      nz,$bd77
bd4c a8        xor     b
bd4d 4b        ld      c,e
bd4e 014152    ld      bc,$5241
bd51 49        ld      c,c
bd52 54        ld      d,h
bd53 48        ld      c,b
bd54 312020    ld      sp,$2020
bd57 ba        cp      d
bd58 a6        and     (hl)
bd59 e20142    jp      po,$4201
bd5c 41        ld      b,c
bd5d 52        ld      d,d
bd5e 2020      jr      nz,$bd80
bd60 2020      jr      nz,$bd82
bd62 20b5      jr      nz,$bd19
bd64 a8        xor     b
bd65 e601      and     $01
bd67 42        ld      b,d
bd68 41        ld      b,c
bd69 52        ld      d,d
bd6a 312020    ld      sp,$2020
bd6d 2020      jr      nz,$bd8f
bd6f b5        or      l
bd70 a8        xor     b
bd71 f7        rst     $30
bd72 01424f    ld      bc,$4f42
bd75 58        ld      e,b
bd76 2020      jr      nz,$bd98
bd78 2020      jr      nz,$bd9a
bd7a 20ba      jr      nz,$bd36
bd7c a6        and     (hl)
bd7d ad        xor     l
bd7e 014558    ld      bc,$5845
bd81 314220    ld      sp,$2042
bd84 2020      jr      nz,$bda6
bd86 20c4      jr      nz,$bd4c
bd88 18b5      jr      $bd3f
bd8a 00        nop     
bd8b 45        ld      b,l
bd8c 58        ld      e,b
bd8d 33        inc     sp
bd8e 41        ld      b,c
bd8f 2020      jr      nz,$bdb1
bd91 2020      jr      nz,$bdb3
bd93 c418e6    call    nz,$e618
bd96 00        nop     
bd97 45        ld      b,l
bd98 58        ld      e,b
bd99 33        inc     sp
bd9a 42        ld      b,d
bd9b 2020      jr      nz,$bdbd
bd9d 2020      jr      nz,$bdbf
bd9f ba        cp      d
bda0 a6        and     (hl)
bda1 d9        exx     
bda2 014649    ld      bc,$4946
bda5 4c        ld      c,h
bda6 45        ld      b,l
bda7 53        ld      d,e
bda8 2020      jr      nz,$bdca
bdaa 20ba      jr      nz,$bd66
bdac a6        and     (hl)
bdad 2001      jr      nz,$bdb0
bdaf 49        ld      c,c
bdb0 4e        ld      c,(hl)
bdb1 49        ld      c,c
bdb2 54        ld      d,h
bdb3 41        ld      b,c
bdb4 4c        ld      c,h
bdb5 2020      jr      nz,$bdd7
bdb7 ac        xor     h
bdb8 05        dec     b
bdb9 08        ex      af,af'
bdba 00        nop     
bdbb 49        ld      c,c
bdbc 4f        ld      c,a
bdbd 50        ld      d,b
bdbe 41        ld      b,c
bdbf 4b        ld      c,e
bdc0 3020      jr      nc,$bde2
bdc2 20ac      jr      nz,$bd70
bdc4 05        dec     b
bdc5 0b        dec     bc
bdc6 00        nop     
bdc7 49        ld      c,c
bdc8 4f        ld      c,a
bdc9 50        ld      d,b
bdca 41        ld      b,c
bdcb 4b        ld      c,e
bdcc 312020    ld      sp,$2020
bdcf ac        xor     h
bdd0 05        dec     b
bdd1 0e00      ld      c,$00
bdd3 49        ld      c,c
bdd4 4f        ld      c,a
bdd5 50        ld      d,b
bdd6 41        ld      b,c
bdd7 4b        ld      c,e
bdd8 322020    ld      ($2020),a
bddb ba        cp      d
bddc a6        and     (hl)
bddd 7a        ld      a,d
bdde 02        ld      (bc),a
bddf 4f        ld      c,a
bde0 50        ld      d,b
bde1 54        ld      d,h
bde2 49        ld      c,c
bde3 4f        ld      c,a
bde4 4e        ld      c,(hl)
bde5 2020      jr      nz,$be07
bde7 ba        cp      d
bde8 a6        and     (hl)
bde9 1f        rra     
bdea 014f56    ld      bc,$564f
bded 4c        ld      c,h
bdee 42        ld      b,d
bdef 46        ld      b,(hl)
bdf0 52        ld      d,d
bdf1 2020      jr      nz,$be13
bdf3 ba        cp      d
bdf4 a6        and     (hl)
bdf5 1b        dec     de
bdf6 02        ld      (bc),a
bdf7 50        ld      d,b
bdf8 49        ld      c,c
bdf9 45        ld      b,l
bdfa 2020      jr      nz,$be1c
bdfc 2020      jr      nz,$be1e
bdfe 20b8      jr      nz,$bdb8
be00 0636      ld      b,$36
be02 00        nop     
be03 50        ld      d,b
be04 4c        ld      c,h
be05 4f        ld      c,a
be06 54        ld      d,h
be07 54        ld      d,h
be08 45        ld      b,l
be09 52        ld      d,d
be0a 20b8      jr      nz,$bdc4
be0c 065b      ld      b,$5b
be0e 00        nop     
be0f 50        ld      d,b
be10 52        ld      d,d
be11 49        ld      c,c
be12 4e        ld      c,(hl)
be13 54        ld      d,h
be14 45        ld      b,l
be15 52        ld      d,d
be16 20c4      jr      nz,$bddc
be18 18f2      jr      $be0c
be1a 00        nop     
be1b 50        ld      d,b
be1c 52        ld      d,d
be1d 54        ld      d,h
be1e 44        ld      b,h
be1f 55        ld      d,l
be20 4d        ld      c,l
be21 50        ld      d,b
be22 20ba      jr      nz,$bdde
be24 a6        and     (hl)
be25 48        ld      c,b
be26 02        ld      (bc),a
be27 53        ld      d,e
be28 43        ld      b,e
be29 41        ld      b,c
be2a 2020      jr      nz,$be4c
be2c 2020      jr      nz,$be4e
be2e 2057      jr      nz,$be87
be30 b6        or      (hl)
be31 68        ld      l,b
be32 02        ld      (bc),a
be33 53        ld      d,e
be34 43        ld      b,e
be35 41        ld      b,c
be36 3843      jr      c,$be7b
be38 2020      jr      nz,$be5a
be3a 2057      jr      nz,$be93
be3c b6        or      (hl)
be3d 72        ld      (hl),d
be3e 02        ld      (bc),a
be3f 53        ld      d,e
be40 43        ld      b,e
be41 41        ld      b,c
be42 3844      jr      c,$be88
be44 2020      jr      nz,$be66
be46 20c4      jr      nz,$be0c
be48 1880      jr      $bdca
be4a 00        nop     
be4b 53        ld      d,e
be4c 43        ld      b,e
be4d 41        ld      b,c
be4e 54        ld      d,h
be4f 45        ld      b,l
be50 312020    ld      sp,$2020
be53 b8        cp      b
be54 0611      ld      b,$11
be56 00        nop     
be57 53        ld      d,e
be58 43        ld      b,e
be59 52        ld      d,d
be5a 45        ld      b,l
be5b 45        ld      b,l
be5c 4e        ld      c,(hl)
be5d 2020      jr      nz,$be7f
be5f 2b        dec     hl
be60 a8        xor     b
be61 61        ld      h,c
be62 015350    ld      bc,$5053
be65 52        ld      d,d
be66 45        ld      b,l
be67 41        ld      b,c
be68 44        ld      b,h
be69 2020      jr      nz,$be8b
be6b ba        cp      d
be6c a6        and     (hl)
be6d 88        adc     a,b
be6e 015354    ld      bc,$5453
be71 41        ld      b,c
be72 54        ld      d,h
be73 55        ld      d,l
be74 53        ld      d,e
be75 2020      jr      nz,$be97
be77 00        nop     
be78 47        ld      b,a
be79 52        ld      d,d
be7a 41        ld      b,c
be7b 46        ld      b,(hl)
be7c 54        ld      d,h
be7d 41        ld      b,c
be7e 4c        ld      c,h
be7f 4b        ld      c,e
be80 45        ld      b,l
be81 52        ld      d,d
be82 52        ld      d,d
be83 00        nop     
be84 00        nop     
be85 00        nop     
be86 80        add     a,b
be87 010203    ld      bc,$0302
be8a 04        inc     b
be8b 05        dec     b
be8c 0607      ld      b,$07
be8e 08        ex      af,af'
be8f 09        add     hl,bc
be90 0a        ld      a,(bc)
be91 0b        dec     bc
be92 0c        inc     c
be93 0d        dec     c
be94 0e0f      ld      c,$0f
be96 1004      djnz    $be9c
be98 04        inc     b
be99 00        nop     
be9a 00        nop     
be9b 05        dec     b
be9c 00        nop     
be9d 46        ld      b,(hl)
be9e 02        ld      (bc),a
be9f 00        nop     
bea0 00        nop     
bea1 00        nop     
bea2 00        nop     
bea3 00        nop     
bea4 02        ld      (bc),a
bea5 00        nop     
bea6 45        ld      b,l
bea7 00        nop     
bea8 00        nop     
bea9 00        nop     
beaa 80        add     a,b
beab 00        nop     
beac 0100b1    ld      bc,$b100
beaf be        cp      (hl)
beb0 07        rlca    
beb1 81        add     a,c
beb2 74        ld      (hl),h
beb3 6f        ld      l,a
beb4 81        add     a,c
beb5 72        ld      (hl),d
beb6 65        ld      h,l
beb7 61        ld      h,c
beb8 64        ld      h,h
beb9 00        nop     
beba 45        ld      b,l
bebb 4e        ld      c,(hl)
bebc 65        ld      h,l
bebd 67        ld      h,a
bebe 61        ld      h,c
bebf 74        ld      (hl),h
bec0 69        ld      l,c
bec1 76        halt    
bec2 65        ld      h,l
bec3 81        add     a,c
bec4 6e        ld      l,(hl)
bec5 75        ld      (hl),l
bec6 6d        ld      l,l
bec7 62        ld      h,d
bec8 65        ld      h,l
bec9 72        ld      (hl),d
beca 81        add     a,c
becb 69        ld      l,c
becc 73        ld      (hl),e
becd 81        add     a,c
bece 69        ld      l,c
becf 6c        ld      l,h
bed0 6c        ld      l,h
bed1 65        ld      h,l
bed2 67        ld      h,a
bed3 61        ld      h,c
bed4 6c        ld      l,h
bed5 00        nop     
bed6 4d        ld      c,l
bed7 0d        dec     c
bed8 0a        ld      a,(bc)
bed9 0d        dec     c
beda 0a        ld      a,(bc)
bedb 54        ld      d,h
bedc 79        ld      a,c
bedd 70        ld      (hl),b
bede 65        ld      h,l
bedf 81        add     a,c
bee0 48        ld      c,b
bee1 45        ld      b,l
bee2 4c        ld      c,h
bee3 50        ld      d,b
bee4 81        add     a,c
bee5 66        ld      h,(hl)
bee6 6f        ld      l,a
bee7 72        ld      (hl),d
bee8 81        add     a,c
bee9 69        ld      l,c
beea 6e        ld      l,(hl)
beeb 66        ld      h,(hl)
beec 6f        ld      l,a
beed 72        ld      (hl),d
beee 6d        ld      l,l
beef 61        ld      h,c
bef0 74        ld      (hl),h
bef1 69        ld      l,c
bef2 6f        ld      l,a
bef3 6e        ld      l,(hl)
bef4 0d        dec     c
bef5 0a        ld      a,(bc)
bef6 00        nop     
bef7 45        ld      b,l
bef8 55        ld      d,l
bef9 6e        ld      l,(hl)
befa 6b        ld      l,e
befb 6e        ld      l,(hl)
befc 6f        ld      l,a
befd 77        ld      (hl),a
befe 6e        ld      l,(hl)
beff 81        add     a,c
bf00 6f        ld      l,a
bf01 72        ld      (hl),d
bf02 81        add     a,c
bf03 69        ld      l,c
bf04 6e        ld      l,(hl)
bf05 61        ld      h,c
bf06 70        ld      (hl),b
bf07 70        ld      (hl),b
bf08 72        ld      (hl),d
bf09 6f        ld      l,a
bf0a 70        ld      (hl),b
bf0b 72        ld      (hl),d
bf0c 69        ld      l,c
bf0d 61        ld      h,c
bf0e 74        ld      (hl),h
bf0f 65        ld      h,l
bf10 81        add     a,c
bf11 63        ld      h,e
bf12 6f        ld      l,a
bf13 6d        ld      l,l
bf14 6d        ld      l,l
bf15 61        ld      h,c
bf16 6e        ld      l,(hl)
bf17 64        ld      h,h
bf18 00        nop     
bf19 45        ld      b,l
bf1a 55        ld      d,l
bf1b 6e        ld      l,(hl)
bf1c 6b        ld      l,e
bf1d 6e        ld      l,(hl)
bf1e 6f        ld      l,a
bf1f 77        ld      (hl),a
bf20 6e        ld      l,(hl)
bf21 81        add     a,c
bf22 76        halt    
bf23 61        ld      h,c
bf24 72        ld      (hl),d
bf25 69        ld      l,c
bf26 61        ld      h,c
bf27 62        ld      h,d
bf28 6c        ld      l,h
bf29 65        ld      h,l
bf2a 81        add     a,c
bf2b 6e        ld      l,(hl)
bf2c 61        ld      h,c
bf2d 6d        ld      l,l
bf2e 65        ld      h,l
bf2f 00        nop     
bf30 45        ld      b,l
bf31 00        nop     
bf32 47        ld      b,a
bf33 52        ld      d,d
bf34 41        ld      b,c
bf35 46        ld      b,(hl)
bf36 54        ld      d,h
bf37 4c        ld      c,h
bf38 4b        ld      c,e
bf39 3024      jr      nc,$bf5f
bf3b 24        inc     h
bf3c 24        inc     h
bf3d 00        nop     
bf3e 00        nop     
bf3f 00        nop     
bf40 00        nop     
bf41 00        nop     
bf42 00        nop     
bf43 00        nop     
bf44 00        nop     
bf45 00        nop     
bf46 00        nop     
bf47 00        nop     
bf48 00        nop     
bf49 00        nop     
bf4a 00        nop     
bf4b 00        nop     
bf4c 00        nop     
bf4d 00        nop     
bf4e 00        nop     
bf4f 00        nop     
bf50 00        nop     
bf51 00        nop     
bf52 57        ld      d,a
bf53 00        nop     
bf54 00        nop     
bf55 58        ld      e,b
bf56 00        nop     
bf57 23        inc     hl
bf58 0a        ld      a,(bc)
bf59 00        nop     
bf5a cb2f      sra     a
bf5c 00        nop     
bf5d 00        nop     
bf5e 00        nop     
bf5f 00        nop     
bf60 d309      out     ($09),a
bf62 2b        dec     hl
bf63 00        nop     
bf64 00        nop     
bf65 2c        inc     l
bf66 58        ld      e,b
bf67 00        nop     
bf68 6b        ld      l,e
bf69 bf        cp      a
bf6a 0f        rrca    
bf6b 04        inc     b
bf6c 00        nop     
bf6d 08        ex      af,af'
bf6e 00        nop     
bf6f 010002    ld      bc,$0200
bf72 00        nop     
bf73 0c        inc     c
bf74 00        nop     
bf75 03        inc     bc
bf76 00        nop     
bf77 05        dec     b
bf78 00        nop     
bf79 0a        ld      a,(bc)
bf7a 00        nop     
bf7b 0600      ld      b,$00
bf7d 09        add     hl,bc
bf7e 00        nop     
bf7f 07        rlca    
bf80 00        nop     
bf81 0b        dec     bc
bf82 00        nop     
bf83 0d        dec     c
bf84 00        nop     
bf85 0e00      ld      c,$00
bf87 0f        rrca    
bf88 00        nop     
bf89 1000      djnz    $bf8b
bf8b 00        nop     
bf8c 00        nop     
bf8d 04        inc     b
bf8e 00        nop     
bf8f 08        ex      af,af'
bf90 00        nop     
bf91 010002    ld      bc,$0200
bf94 00        nop     
bf95 03        inc     bc
bf96 00        nop     
bf97 04        inc     b
bf98 00        nop     
bf99 05        dec     b
bf9a 00        nop     
bf9b 0600      ld      b,$00
bf9d 07        rlca    
bf9e 00        nop     
bf9f 010002    ld      bc,$0200
bfa2 00        nop     
bfa3 03        inc     bc
bfa4 00        nop     
bfa5 04        inc     b
bfa6 00        nop     
bfa7 05        dec     b
bfa8 00        nop     
bfa9 0600      ld      b,$00
bfab 07        rlca    
bfac 00        nop     
bfad 010002    ld      bc,$0200
bfb0 00        nop     
bfb1 03        inc     bc
bfb2 00        nop     
bfb3 04        inc     b
bfb4 00        nop     
bfb5 05        dec     b
bfb6 00        nop     
bfb7 0600      ld      b,$00
bfb9 07        rlca    
bfba 00        nop     
bfbb 010002    ld      bc,$0200
bfbe 00        nop     
bfbf 03        inc     bc
bfc0 00        nop     
bfc1 04        inc     b
bfc2 00        nop     
bfc3 05        dec     b
bfc4 00        nop     
bfc5 0600      ld      b,$00
bfc7 07        rlca    
bfc8 00        nop     
bfc9 08        ex      af,af'
bfca 00        nop     
bfcb 010002    ld      bc,$0200
bfce 00        nop     
bfcf 03        inc     bc
bfd0 00        nop     
bfd1 04        inc     b
bfd2 00        nop     
bfd3 05        dec     b
bfd4 00        nop     
bfd5 0600      ld      b,$00
bfd7 07        rlca    
bfd8 00        nop     
bfd9 08        ex      af,af'
bfda 00        nop     
bfdb 010002    ld      bc,$0200
bfde 00        nop     
bfdf 03        inc     bc
bfe0 00        nop     
bfe1 04        inc     b
bfe2 00        nop     
bfe3 00        nop     
bfe4 00        nop     
bfe5 00        nop     
bfe6 00        nop     
bfe7 00        nop     
bfe8 00        nop     
bfe9 00        nop     
bfea 00        nop     
bfeb 00        nop     
bfec 00        nop     
bfed 00        nop     
bfee 00        nop     
bfef 00        nop     
bff0 00        nop     
bff1 00        nop     
bff2 00        nop     
bff3 00        nop     
bff4 00        nop     
bff5 00        nop     
bff6 00        nop     
bff7 00        nop     
bff8 00        nop     
bff9 00        nop     
bffa 00        nop     
bffb 00        nop     
bffc 00        nop     
bffd 00        nop     
bffe 00        nop     
bfff 00        nop     


HP7400 commands

LBxxx ^C 	ascii char
PA0 0		plot absolute
PD		pen down
PU		pen up
SP1		select pen

DI0,127		absolute dir (chars rotation)
IN		init
SI.170,.290	absolute char size

DP   digitize point
DC   digitize clear
OD   output point from plotter to computer 
OS  query status of pen/current pos


ESC .( -> plotter on
ESC .I xxx : -> set hadshake
ESC .N xxx : -> set hadshake
