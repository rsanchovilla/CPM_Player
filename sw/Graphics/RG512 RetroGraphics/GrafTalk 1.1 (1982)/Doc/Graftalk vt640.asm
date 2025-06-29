; Disassembly of the file "E:\Tmp\cpm\pcw\Save_RAM_00.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Friday, 15 of March 2024 at 01:55 PM
; 
0100 cd4c76    call    $764c
0103 2b        dec     hl
0104 f9        ld      sp,hl
0105 c3902b    jp      $2b90
0108 43        ld      b,e
0109 b9        cp      c
010a 78        ld      a,b
010b 03        inc     bc
010c 47        ld      b,a
010d 52        ld      d,d
010e 41        ld      b,c
010f 46        ld      b,(hl)
0110 54        ld      d,h
0111 41        ld      b,c
0112 4c        ld      c,h
0113 4b        ld      c,e
0114 cdbc77    call    $77bc
0117 a1        and     c
0118 1102cd    ld      de,$cd02
011b bc        cp      h
011c 77        ld      (hl),a
011d 8f        adc     a,a
011e a4        and     h
011f 00        nop     
0120 cdbc77    call    $77bc
0123 1b        dec     de
0124 a3        and     e
0125 08        ex      af,af'
0126 cdbc77    call    $77bc
0129 0b        dec     bc
012a 2210cd    ld      ($cd10),hl
012d bc        cp      h
012e 77        ld      (hl),a
012f 14        inc     d
0130 2210cd    ld      ($cd10),hl
0133 bc        cp      h
0134 77        ld      (hl),a
0135 6d        ld      l,l
0136 a7        and     a
0137 00        nop     
0138 cdbc77    call    $77bc
013b daa901    jp      c,$01a9
013e cdbc77    call    $77bc
0141 91        sub     c
0142 1b        dec     de
0143 10cd      djnz    $0112
0145 bc        cp      h
0146 77        ld      (hl),a
0147 05        dec     b
0148 a5        and     l
0149 03        inc     bc
014a cdbc77    call    $77bc
014d de22      sbc     a,$22
014f 10cd      djnz    $011e
0151 bc        cp      h
0152 77        ld      (hl),a
0153 3aa800    ld      a,($00a8)
0156 cdbc77    call    $77bc
0159 5d        ld      e,l
015a a4        and     h
015b 03        inc     bc
015c cdbc77    call    $77bc
015f 94        sub     h
0160 ab        xor     e
0161 0d        dec     c
0162 cdbc77    call    $77bc
0165 1b        dec     de
0166 a3        and     e
0167 0d        dec     c
0168 cdbc77    call    $77bc
016b f9        ld      sp,hl
016c 14        inc     d
016d 10cd      djnz    $013c
016f bc        cp      h
0170 77        ld      (hl),a
0171 d5        push    de
0172 0e0c      ld      c,$0c
0174 cdbc77    call    $77bc
0177 c7        rst     $00
0178 a4        and     h
0179 0d        dec     c
017a cdbc77    call    $77bc
017d 5d        ld      e,l
017e ac        xor     h
017f 0d        dec     c
0180 cdbc77    call    $77bc
0183 1b        dec     de
0184 a3        and     e
0185 01cdbc    ld      bc,$bccd
0188 77        ld      (hl),a
0189 69        ld      l,c
018a 15        dec     d
018b 02        ld      (bc),a
018c cdbc77    call    $77bc
018f b8        cp      b
0190 b2        or      d
0191 0ecd      ld      c,$cd
0193 bc        cp      h
0194 77        ld      (hl),a
0195 55        ld      d,l
0196 1e10      ld      e,$10
0198 cdbc77    call    $77bc
019b 89        adc     a,c
019c 14        inc     d
019d 02        ld      (bc),a
019e cdbc77    call    $77bc
01a1 2e0f      ld      l,$0f
01a3 0c        inc     c
01a4 cdbc77    call    $77bc
01a7 0b        dec     bc
01a8 ad        xor     l
01a9 0d        dec     c
01aa cdbc77    call    $77bc
01ad 96        sub     (hl)
01ae b6        or      (hl)
01af 0ecd      ld      c,$cd
01b1 bc        cp      h
01b2 77        ld      (hl),a
01b3 1b        dec     de
01b4 a3        and     e
01b5 04        inc     b
01b6 cdbc77    call    $77bc
01b9 caaa01    jp      z,$01aa
01bc cdbc77    call    $77bc
01bf c9        ret     

01c0 1610      ld      d,$10
01c2 cdbc77    call    $77bc
01c5 3d        dec     a
01c6 15        dec     d
01c7 10cd      djnz    $0196
01c9 bc        cp      h
01ca 77        ld      (hl),a
01cb 50        ld      d,b
01cc 0f        rrca    
01cd 02        ld      (bc),a
01ce cdbc77    call    $77bc
01d1 d5        push    de
01d2 0e02      ld      c,$02
01d4 cdbc77    call    $77bc
01d7 4b        ld      c,e
01d8 12        ld      (de),a
01d9 02        ld      (bc),a
01da cdbc77    call    $77bc
01dd bf        cp      a
01de a6        and     (hl)
01df 04        inc     b
01e0 cdbc77    call    $77bc
01e3 011110    ld      bc,$1011
01e6 cdbc77    call    $77bc
01e9 23        inc     hl
01ea 2610      ld      h,$10
01ec cdbc77    call    $77bc
01ef 07        rlca    
01f0 1102cd    ld      de,$cd02
01f3 bc        cp      h
01f4 77        ld      (hl),a
01f5 00        nop     
01f6 00        nop     
01f7 01cdbc    ld      bc,$bccd
01fa 77        ld      (hl),a
01fb 43        ld      b,e
01fc ae        xor     (hl)
01fd 0d        dec     c
01fe cdbc77    call    $77bc
0201 1b        dec     de
0202 a3        and     e
0203 09        add     hl,bc
0204 cdbc77    call    $77bc
0207 f5        push    af
0208 a4        and     h
0209 00        nop     
020a cdbc77    call    $77bc
020d 76        halt    
020e 1102cd    ld      de,$cd02
0211 bc        cp      h
0212 77        ld      (hl),a
0213 3f        ccf     
0214 1102cd    ld      de,$cd02
0217 bc        cp      h
0218 77        ld      (hl),a
0219 83        add     a,e
021a 24        inc     h
021b 10cd      djnz    $01ea
021d bc        cp      h
021e 77        ld      (hl),a
021f 15        dec     d
0220 2202cd    ld      ($cd02),hl
0223 bc        cp      h
0224 77        ld      (hl),a
0225 a3        and     e
0226 1b        dec     de
0227 02        ld      (bc),a
0228 cdbc77    call    $77bc
022b b7        or      a
022c 1d        dec     e
022d 02        ld      (bc),a
022e cdbc77    call    $77bc
0231 46        ld      b,(hl)
0232 1802      jr      $0236
0234 cdbc77    call    $77bc
0237 4d        ld      c,l
0238 a7        and     a
0239 0d        dec     c
023a cdbc77    call    $77bc
023d 78        ld      a,b
023e ae        xor     (hl)
023f 0d        dec     c
0240 cdbc77    call    $77bc
0243 08        ex      af,af'
0244 a4        and     h
0245 03        inc     bc
0246 cdbc77    call    $77bc
0249 17        rla     
024a af        xor     a
024b 0d        dec     c
024c cdbc77    call    $77bc
024f fc1402    call    m,$0214
0252 cdbc77    call    $77bc
0255 d8        ret     c

0256 13        inc     de
0257 02        ld      (bc),a
0258 cdbc77    call    $77bc
025b 92        sub     d
025c 17        rla     
025d 10cd      djnz    $022c
025f bc        cp      h
0260 77        ld      (hl),a
0261 1b        dec     de
0262 a3        and     e
0263 12        ld      (de),a
0264 cdbc77    call    $77bc
0267 25        dec     h
0268 1102cd    ld      de,$cd02
026b bc        cp      h
026c 77        ld      (hl),a
026d 09        add     hl,bc
026e aa        xor     d
026f 0d        dec     c
0270 cdbc77    call    $77bc
0273 7f        ld      a,a
0274 b0        or      b
0275 0d        dec     c
0276 cdbc77    call    $77bc
0279 b9        cp      c
027a b2        or      d
027b 0f        rrca    
027c cdbc77    call    $77bc
027f 1b        dec     de
0280 a3        and     e
0281 00        nop     
0282 cdbc77    call    $77bc
0285 d5        push    de
0286 a3        and     e
0287 00        nop     
0288 cdbc77    call    $77bc
028b 69        ld      l,c
028c 15        dec     d
028d 1001      djnz    $0290
028f 00        nop     
0290 1b        dec     de
0291 3d        dec     a
0292 00        nop     
0293 00        nop     
0294 00        nop     
0295 00        nop     
0296 2000      jr      nz,$0298
0298 00        nop     
0299 00        nop     
029a 00        nop     
029b 00        nop     
029c 00        nop     
029d 00        nop     
029e 2000      jr      nz,$02a0
02a0 00        nop     
02a1 00        nop     
02a2 00        nop     
02a3 00        nop     
02a4 00        nop     
02a5 00        nop     
02a6 1a        ld      a,(de)
02a7 00        nop     
02a8 00        nop     
02a9 00        nop     
02aa 00        nop     
02ab 00        nop     
02ac 00        nop     
02ad 00        nop     
02ae 00        nop     
02af 00        nop     
02b0 00        nop     
02b1 b1        or      c
02b2 02        ld      (bc),a
02b3 78        ld      a,b
02b4 03        inc     bc
02b5 49        ld      c,c
02b6 4f        ld      c,a
02b7 50        ld      d,b
02b8 41        ld      b,c
02b9 4b        ld      c,e
02ba 3020      jr      nc,$02dc
02bc 20c3      jr      nz,$0281
02be cf        rst     $08
02bf 02        ld      (bc),a
02c0 c30f03    jp      $030f
02c3 c31203    jp      $0312
02c6 c34203    jp      $0342
02c9 c35003    jp      $0350
02cc c35d03    jp      $035d
02cf 21702b    ld      hl,$2b70
02d2 7e        ld      a,(hl)
02d3 326f03    ld      ($036f),a
02d6 327203    ld      ($0372),a
02d9 23        inc     hl
02da 7e        ld      a,(hl)
02db 326903    ld      ($0369),a
02de 326c03    ld      ($036c),a
02e1 23        inc     hl
02e2 7e        ld      a,(hl)
02e3 327503    ld      ($0375),a
02e6 21752b    ld      hl,$2b75
02e9 7e        ld      a,(hl)
02ea b7        or      a
02eb c47403    call    nz,$0374
02ee 23        inc     hl
02ef 7e        ld      a,(hl)
02f0 b7        or      a
02f1 c47403    call    nz,$0374
02f4 217703    ld      hl,$0377
02f7 3604      ld      (hl),$04
02f9 3a772b    ld      a,($2b77)
02fc b7        or      a
02fd ca0203    jp      z,$0302
0300 360c      ld      (hl),$0c
0302 cd5003    call    $0350
0305 b7        or      a
0306 3eff      ld      a,$ff
0308 c8        ret     z

0309 cd5d03    call    $035d
030c c30203    jp      $0302
030f 3eff      ld      a,$ff
0311 c9        ret     

0312 3e10      ld      a,$10
0314 cd6803    call    $0368
0317 cd6b03    call    $036b
031a 57        ld      d,a
031b 217703    ld      hl,$0377
031e a6        and     (hl)
031f be        cp      (hl)
0320 3e00      ld      a,$00
0322 c0        ret     nz

0323 3a742b    ld      a,($2b74)
0326 b7        or      a
0327 3eff      ld      a,$ff
0329 c8        ret     z

032a 7a        ld      a,d
032b e601      and     $01
032d 214103    ld      hl,$0341
0330 7e        ld      a,(hl)
0331 c8        ret     z

0332 cd7103    call    $0371
0335 e67f      and     $7f
0337 fe13      cp      $13
0339 3e00      ld      a,$00
033b ca3f03    jp      z,$033f
033e 2f        cpl     
033f 77        ld      (hl),a
0340 c9        ret     

0341 ff        rst     $38
0342 e5        push    hl
0343 cd1203    call    $0312
0346 b7        or      a
0347 ca4303    jp      z,$0343
034a e1        pop     hl
034b 7e        ld      a,(hl)
034c cd6e03    call    $036e
034f c9        ret     

0350 af        xor     a
0351 cd6803    call    $0368
0354 cd6b03    call    $036b
0357 e601      and     $01
0359 c8        ret     z

035a 3eff      ld      a,$ff
035c c9        ret     

035d cd5003    call    $0350
0360 b7        or      a
0361 ca5d03    jp      z,$035d
0364 cd7103    call    $0371
0367 c9        ret     

0368 d300      out     ($00),a
036a c9        ret     

036b db00      in      a,($00)
036d c9        ret     

036e d300      out     ($00),a
0370 c9        ret     

0371 db00      in      a,($00)
0373 c9        ret     

0374 d300      out     ($00),a
0376 c9        ret     

0377 04        inc     b
0378 00        nop     
0379 00        nop     
037a 00        nop     
037b 00        nop     
037c 00        nop     
037d 00        nop     
037e 00        nop     
037f 00        nop     
0380 00        nop     
0381 00        nop     
0382 00        nop     
0383 00        nop     
0384 00        nop     
0385 00        nop     
0386 00        nop     
0387 00        nop     
0388 00        nop     
0389 00        nop     
038a 00        nop     
038b 00        nop     
038c 00        nop     
038d 00        nop     
038e 00        nop     
038f 00        nop     
0390 00        nop     
0391 00        nop     
0392 00        nop     
0393 00        nop     
0394 00        nop     
0395 00        nop     
0396 00        nop     
0397 00        nop     
0398 00        nop     
0399 00        nop     
039a 00        nop     
039b 00        nop     
039c 00        nop     
039d 00        nop     
039e 00        nop     
039f 00        nop     
03a0 00        nop     
03a1 00        nop     
03a2 00        nop     
03a3 00        nop     
03a4 00        nop     
03a5 00        nop     
03a6 00        nop     
03a7 00        nop     
03a8 00        nop     
03a9 00        nop     
03aa 00        nop     
03ab 00        nop     
03ac 00        nop     
03ad 00        nop     
03ae 00        nop     
03af 00        nop     
03b0 00        nop     
03b1 00        nop     
03b2 00        nop     
03b3 00        nop     
03b4 00        nop     
03b5 00        nop     
03b6 00        nop     
03b7 00        nop     
03b8 00        nop     
03b9 00        nop     
03ba 00        nop     
03bb 00        nop     
03bc 00        nop     
03bd 00        nop     
03be 00        nop     
03bf 00        nop     
03c0 00        nop     
03c1 00        nop     
03c2 00        nop     
03c3 00        nop     
03c4 00        nop     
03c5 00        nop     
03c6 00        nop     
03c7 00        nop     
03c8 00        nop     
03c9 c30000    jp      $0000
03cc c30000    jp      $0000
03cf c30000    jp      $0000
03d2 c30000    jp      $0000
03d5 c30000    jp      $0000
03d8 c30000    jp      $0000
03db c30804    jp      $0408
03de c30000    jp      $0000
03e1 c30000    jp      $0000
03e4 c30000    jp      $0000
03e7 c30000    jp      $0000
03ea c30000    jp      $0000
03ed c30000    jp      $0000
03f0 c30000    jp      $0000
03f3 c30000    jp      $0000
03f6 c30000    jp      $0000
03f9 c30000    jp      $0000
03fc c30000    jp      $0000
03ff c30000    jp      $0000
0402 c30000    jp      $0000
0405 c30000    jp      $0000
0408 c9        ret     

0409 00        nop     
040a 00        nop     
040b 00        nop     
040c 00        nop     
040d 00        nop     
040e 00        nop     
040f 00        nop     
0410 00        nop     
0411 00        nop     
0412 00        nop     
0413 00        nop     
0414 00        nop     
0415 00        nop     
0416 00        nop     
0417 00        nop     
0418 00        nop     
0419 00        nop     
041a 00        nop     
041b 00        nop     
041c 00        nop     
041d 00        nop     
041e 00        nop     
041f 00        nop     
0420 00        nop     
0421 00        nop     
0422 00        nop     
0423 00        nop     
0424 00        nop     
0425 00        nop     
0426 00        nop     
0427 00        nop     
0428 00        nop     
0429 9c        sbc     a,h
042a 312a29    ld      sp,$292a
042d 04        inc     b
042e 7d        ld      a,l
042f ac        xor     h
0430 47        ld      b,a
0431 21bd06    ld      hl,$06bd
0434 115907    ld      de,$0759
0437 7e        ld      a,(hl)
0438 a8        xor     b
0439 77        ld      (hl),a
043a 23        inc     hl
043b 7a        ld      a,d
043c bc        cp      h
043d c23704    jp      nz,$0437
0440 7b        ld      a,e
0441 bd        cp      l
0442 c23704    jp      nz,$0437
0445 c9        ret     

0446 00        nop     
0447 00        nop     
0448 00        nop     
0449 00        nop     
044a 00        nop     
044b 00        nop     
044c 00        nop     
044d 00        nop     
044e 00        nop     
044f 00        nop     
0450 00        nop     
0451 00        nop     
0452 00        nop     
0453 00        nop     
0454 00        nop     
0455 00        nop     
0456 cd6904    call    $0469
0459 c8        ret     z

045a 210030    ld      hl,$3000
045d 0610      ld      b,$10
045f ae        xor     (hl)
0460 6f        ld      l,a
0461 77        ld      (hl),a
0462 24        inc     h
0463 24        inc     h
0464 05        dec     b
0465 c25f04    jp      nz,$045f
0468 c9        ret     

0469 2ad205    ld      hl,($05d2)
046c eb        ex      de,hl
046d 210600    ld      hl,$0006
0470 73        ld      (hl),e
0471 23        inc     hl
0472 72        ld      (hl),d
0473 21c304    ld      hl,$04c3
0476 111101    ld      de,$0111
0479 19        add     hl,de
047a 5e        ld      e,(hl)
047b 23        inc     hl
047c 56        ld      d,(hl)
047d 01a004    ld      bc,$04a0
0480 af        xor     a
0481 3d        dec     a
0482 00        nop     
0483 00        nop     
0484 00        nop     
0485 c8        ret     z

0486 21a004    ld      hl,$04a0
0489 7e        ld      a,(hl)
048a bb        cp      e
048b c0        ret     nz

048c 23        inc     hl
048d 7e        ld      a,(hl)
048e ba        cp      d
048f c9        ret     

0490 3600      ld      (hl),$00
0492 eb        ex      de,hl
0493 22a004    ld      ($04a0),hl
0496 cd6e06    call    $066e
0499 21a204    ld      hl,$04a2
049c 36ff      ld      (hl),$ff
049e af        xor     a
049f c9        ret     

04a0 8e        adc     a,(hl)
04a1 aa        xor     d
04a2 ff        rst     $38
04a3 00        nop     
04a4 00        nop     
04a5 00        nop     
04a6 00        nop     
04a7 00        nop     
04a8 00        nop     
04a9 00        nop     
04aa 00        nop     
04ab 00        nop     
04ac 00        nop     
04ad 00        nop     
04ae 00        nop     
04af 00        nop     
04b0 00        nop     
04b1 00        nop     
04b2 00        nop     
04b3 00        nop     
04b4 00        nop     
04b5 00        nop     
04b6 00        nop     
04b7 00        nop     
04b8 00        nop     
04b9 00        nop     
04ba 00        nop     
04bb 00        nop     
04bc 00        nop     
04bd 00        nop     
04be 00        nop     
04bf 00        nop     
04c0 00        nop     
04c1 00        nop     
04c2 00        nop     
04c3 00        nop     
04c4 00        nop     
04c5 00        nop     
04c6 00        nop     
04c7 00        nop     
04c8 00        nop     
04c9 00        nop     
04ca 00        nop     
04cb 00        nop     
04cc 00        nop     
04cd 00        nop     
04ce 00        nop     
04cf 00        nop     
04d0 00        nop     
04d1 00        nop     
04d2 00        nop     
04d3 00        nop     
04d4 00        nop     
04d5 00        nop     
04d6 00        nop     
04d7 00        nop     
04d8 00        nop     
04d9 00        nop     
04da 00        nop     
04db 00        nop     
04dc 00        nop     
04dd 00        nop     
04de 00        nop     
04df 00        nop     
04e0 00        nop     
04e1 00        nop     
04e2 00        nop     
04e3 00        nop     
04e4 00        nop     
04e5 00        nop     
04e6 00        nop     
04e7 00        nop     
04e8 00        nop     
04e9 00        nop     
04ea 00        nop     
04eb 00        nop     
04ec 00        nop     
04ed 00        nop     
04ee 00        nop     
04ef 00        nop     
04f0 00        nop     
04f1 00        nop     
04f2 00        nop     
04f3 00        nop     
04f4 00        nop     
04f5 00        nop     
04f6 00        nop     
04f7 00        nop     
04f8 00        nop     
04f9 00        nop     
04fa 00        nop     
04fb 00        nop     
04fc 00        nop     
04fd 00        nop     
04fe 00        nop     
04ff 00        nop     
0500 00        nop     
0501 00        nop     
0502 00        nop     
0503 00        nop     
0504 00        nop     
0505 00        nop     
0506 00        nop     
0507 00        nop     
0508 00        nop     
0509 00        nop     
050a 00        nop     
050b 00        nop     
050c 00        nop     
050d 00        nop     
050e 00        nop     
050f 00        nop     
0510 00        nop     
0511 00        nop     
0512 00        nop     
0513 00        nop     
0514 00        nop     
0515 00        nop     
0516 00        nop     
0517 00        nop     
0518 00        nop     
0519 00        nop     
051a 00        nop     
051b 00        nop     
051c 00        nop     
051d 00        nop     
051e 00        nop     
051f 00        nop     
0520 00        nop     
0521 00        nop     
0522 00        nop     
0523 00        nop     
0524 00        nop     
0525 00        nop     
0526 00        nop     
0527 00        nop     
0528 00        nop     
0529 00        nop     
052a 00        nop     
052b 00        nop     
052c 00        nop     
052d 00        nop     
052e 00        nop     
052f 00        nop     
0530 00        nop     
0531 00        nop     
0532 00        nop     
0533 00        nop     
0534 00        nop     
0535 00        nop     
0536 00        nop     
0537 00        nop     
0538 00        nop     
0539 00        nop     
053a 00        nop     
053b 00        nop     
053c 00        nop     
053d 00        nop     
053e 00        nop     
053f 00        nop     
0540 00        nop     
0541 00        nop     
0542 00        nop     
0543 00        nop     
0544 00        nop     
0545 00        nop     
0546 00        nop     
0547 00        nop     
0548 00        nop     
0549 00        nop     
054a 00        nop     
054b 00        nop     
054c 00        nop     
054d 00        nop     
054e 00        nop     
054f 00        nop     
0550 00        nop     
0551 00        nop     
0552 00        nop     
0553 00        nop     
0554 00        nop     
0555 00        nop     
0556 00        nop     
0557 00        nop     
0558 00        nop     
0559 00        nop     
055a 00        nop     
055b 00        nop     
055c 00        nop     
055d 00        nop     
055e 00        nop     
055f 00        nop     
0560 00        nop     
0561 00        nop     
0562 00        nop     
0563 00        nop     
0564 00        nop     
0565 00        nop     
0566 00        nop     
0567 00        nop     
0568 00        nop     
0569 00        nop     
056a 00        nop     
056b 00        nop     
056c 00        nop     
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
05a3 2ad205    ld      hl,($05d2)
05a6 79        ld      a,c
05a7 fe02      cp      $02
05a9 c2b805    jp      nz,$05b8
05ac e5        push    hl
05ad 2ad405    ld      hl,($05d4)
05b0 7b        ld      a,e
05b1 29        add     hl,hl
05b2 8d        adc     a,l
05b3 6f        ld      l,a
05b4 22d405    ld      ($05d4),hl
05b7 e1        pop     hl
05b8 e9        jp      (hl)
05b9 0600      ld      b,$00
05bb 2ab905    ld      hl,($05b9)
05be 5e        ld      e,(hl)
05bf 23        inc     hl
05c0 56        ld      d,(hl)
05c1 eb        ex      de,hl
05c2 22d205    ld      ($05d2),hl
05c5 11a305    ld      de,$05a3
05c8 2ab905    ld      hl,($05b9)
05cb 73        ld      (hl),e
05cc 23        inc     hl
05cd 72        ld      (hl),d
05ce 00        nop     
05cf 00        nop     
05d0 00        nop     
05d1 c9        ret     

05d2 06fe      ld      b,$fe
05d4 8e        adc     a,(hl)
05d5 aa        xor     d
05d6 60        ld      h,b
05d7 69        ld      l,c
05d8 73        ld      (hl),e
05d9 23        inc     hl
05da 72        ld      (hl),d
05db 210000    ld      hl,$0000
05de 22d405    ld      ($05d4),hl
05e1 cd2f06    call    $062f
05e4 b7        or      a
05e5 c2fd05    jp      nz,$05fd
05e8 cd8e06    call    $068e
05eb cdae06    call    $06ae
05ee 0d        dec     c
05ef 0a        ld      a,(bc)
05f0 0a        ld      a,(bc)
05f1 4f        ld      c,a
05f2 4b        ld      c,e
05f3 0d        dec     c
05f4 0a        ld      a,(bc)
05f5 0a        ld      a,(bc)
05f6 00        nop     
05f7 cd8e06    call    $068e
05fa c30000    jp      $0000
05fd cd8e06    call    $068e
0600 cdae06    call    $06ae
0603 46        ld      b,(hl)
0604 49        ld      c,c
0605 4c        ld      c,h
0606 45        ld      b,l
0607 2045      jr      nz,$064e
0609 52        ld      d,d
060a 52        ld      d,d
060b 4f        ld      c,a
060c 52        ld      d,d
060d 202d      jr      nz,$063c
060f 2073      jr      nz,$0684
0611 74        ld      (hl),h
0612 61        ld      h,c
0613 72        ld      (hl),d
0614 74        ld      (hl),h
0615 206f      jr      nz,$0686
0617 76        halt    
0618 65        ld      h,l
0619 72        ld      (hl),d
061a 212107    ld      hl,$0721
061d 07        rlca    
061e 07        rlca    
061f 07        rlca    
0620 07        rlca    
0621 07        rlca    
0622 07        rlca    
0623 07        rlca    
0624 07        rlca    
0625 07        rlca    
0626 07        rlca    
0627 07        rlca    
0628 07        rlca    
0629 07        rlca    
062a 07        rlca    
062b 00        nop     
062c c30000    jp      $0000
062f 215d06    ld      hl,$065d
0632 cd956c    call    $6c95
0635 216306    ld      hl,$0663
0638 115b06    ld      de,$065b
063b 015b06    ld      bc,$065b
063e cd5e6e    call    $6e5e
0641 b7        or      a
0642 c2fd05    jp      nz,$05fd
0645 215b06    ld      hl,$065b
0648 115f06    ld      de,$065f
064b cd296b    call    $6b29
064e 21c903    ld      hl,$03c9
0651 116106    ld      de,$0661
0654 cd756b    call    $6b75
0657 cd6b6f    call    $6f6b
065a c9        ret     

065b 00        nop     
065c 00        nop     
065d 0600      ld      b,$00
065f ca0226    jp      z,$2602
0662 04        inc     b
0663 47        ld      b,a
0664 52        ld      d,d
0665 41        ld      b,c
0666 46        ld      b,(hl)
0667 54        ld      d,h
0668 41        ld      b,c
0669 4c        ld      c,h
066a 4b        ld      c,e
066b 43        ld      b,e
066c 4f        ld      c,a
066d 4d        ld      c,l
066e e1        pop     hl
066f 2b        dec     hl
0670 2b        dec     hl
0671 2b        dec     hl
0672 3600      ld      (hl),$00
0674 23        inc     hl
0675 3600      ld      (hl),$00
0677 23        inc     hl
0678 3600      ld      (hl),$00
067a 23        inc     hl
067b e5        push    hl
067c 218d06    ld      hl,$068d
067f 7e        ld      a,(hl)
0680 b7        or      a
0681 3600      ld      (hl),$00
0683 cad605    jp      z,$05d6
0686 cdd506    call    $06d5
0689 cd2b04    call    $042b
068c c9        ret     

068d 00        nop     
068e f5        push    af
068f 3e0d      ld      a,$0d
0691 cd9b06    call    $069b
0694 3e0a      ld      a,$0a
0696 cd9b06    call    $069b
0699 f1        pop     af
069a c9        ret     

069b f5        push    af
069c c5        push    bc
069d d5        push    de
069e e5        push    hl
069f e67f      and     $7f
06a1 5f        ld      e,a
06a2 0e02      ld      c,$02
06a4 1600      ld      d,$00
06a6 cd0500    call    $0005
06a9 e1        pop     hl
06aa d1        pop     de
06ab c1        pop     bc
06ac f1        pop     af
06ad c9        ret     

06ae e1        pop     hl
06af 7e        ld      a,(hl)
06b0 23        inc     hl
06b1 e5        push    hl
06b2 b7        or      a
06b3 c8        ret     z

06b4 5f        ld      e,a
06b5 0e02      ld      c,$02
06b7 cd0500    call    $0005
06ba c3ae06    jp      $06ae
06bd 68        ld      l,b
06be 78        ld      a,b
06bf 48        ld      c,b
06c0 a3        and     e
06c1 ac        xor     h
06c2 60        ld      h,b
06c3 a8        xor     b
06c4 ad        xor     l
06c5 53        ld      d,e
06c6 cc777c    call    z,$7c77
06c9 ab        xor     e
06ca 53        ld      d,e
06cb d67f      sub     $7f
06cd 7c        ld      a,h
06ce ab        xor     e
06cf 4b        ld      c,e
06d0 72        ld      (hl),d
06d1 4c        ld      c,h
06d2 7c        ld      a,h
06d3 6c        ld      l,h
06d4 64        ld      h,h
06d5 60        ld      h,b
06d6 03        inc     bc
06d7 ab        xor     e
06d8 a0        and     b
06d9 a7        and     a
06da a7        and     a
06db a7        and     a
06dc a7        and     a
06dd fee8      cp      $e8
06df ff        rst     $38
06e0 e4ece1    call    po,$e1ec
06e3 e4f7e8    call    po,$e8f7
06e6 ff        rst     $38
06e7 8d        adc     a,l
06e8 80        add     a,b
06e9 8d        adc     a,l
06ea fb        ei      
06eb c8        ret     z

06ec df        rst     $18
06ed 83        add     a,e
06ee 8d        adc     a,l
06ef 9c        sbc     a,h
06f0 83        add     a,e
06f1 9f        sbc     a,a
06f2 a0        and     b
06f3 a7        and     a
06f4 a7        and     a
06f5 ad        xor     l
06f6 60        ld      h,b
06f7 23        inc     hl
06f8 ab        xor     e
06f9 60        ld      h,b
06fa 03        inc     bc
06fb ab        xor     e
06fc e8        ret     pe

06fd c3d9c8    jp      $c8d9
0700 df        rst     $18
0701 8d        adc     a,l
0702 dec8      sbc     a,$c8
0704 df        rst     $18
0705 c4ccc1    call    nz,$c1cc
0708 8d        adc     a,l
0709 c3d8c0    jp      $c0d8
070c cf        rst     $08
070d c8        ret     z

070e df        rst     $18
070f 8d        adc     a,l
0710 80        add     a,b
0711 8d        adc     a,l
0712 9b        sbc     a,e
0713 8d        adc     a,l
0714 cec5      adc     a,$c5
0716 ccdf8d    call    z,$8ddf
0719 c0        ret     nz

071a ccd5c4    call    z,$c4d5
071d c0        ret     nz

071e d8        ret     c

071f c0        ret     nz

0720 8d        adc     a,l
0721 97        sub     a
0722 93        sub     e
0723 ad        xor     l
0724 8c        adc     a,h
0725 19        add     hl,de
0726 aa        xor     d
0727 ab        xor     e
0728 aa        xor     d
0729 bc        cp      h
072a ad        xor     l
072b ad        xor     l
072c 48        ld      c,b
072d 68        ld      l,b
072e 78        ld      a,b
072f 60        ld      h,b
0730 10ab      djnz    $06dd
0732 7c        ld      a,h
0733 6c        ld      l,h
0734 4c        ld      c,h
0735 53        ld      d,e
0736 a0        and     b
0737 67        ld      h,a
0738 e3        ex      (sp),hl
0739 aa        xor     d
073a 53        ld      d,e
073b 8d        adc     a,l
073c 77        ld      (hl),a
073d 5b        ld      e,e
073e ab        xor     e
073f a8        xor     b
0740 67        ld      h,a
0741 5b        ld      e,e
0742 ab        xor     e
0743 da8e46    jp      c,$468e
0746 28c2      jr      z,$070a
0748 84        add     a,h
0749 84        add     a,h
074a 46        ld      b,(hl)
074b 6e        ld      l,(hl)
074c 81        add     a,c
074d aa        xor     d
074e 46        ld      b,(hl)
074f 8f        adc     a,a
0750 84        add     a,h
0751 a9        xor     c
0752 8c        adc     a,h
0753 ad        xor     l
0754 ad        xor     l
0755 8f        adc     a,a
0756 79        ld      a,c
0757 a8        xor     b
0758 64        ld      h,h
0759 cdae06    call    $06ae
075c 0d        dec     c
075d 0a        ld      a,(bc)
075e 0a        ld      a,(bc)
075f 0a        ld      a,(bc)
0760 0a        ld      a,(bc)
0761 0a        ld      a,(bc)
0762 0a        ld      a,(bc)
0763 57        ld      d,a
0764 65        ld      h,l
0765 6c        ld      l,h
0766 63        ld      h,e
0767 6f        ld      l,a
0768 6d        ld      l,l
0769 65        ld      h,l
076a 2074      jr      nz,$07e0
076c 6f        ld      l,a
076d 2047      jr      nz,$07b6
076f 72        ld      (hl),d
0770 61        ld      h,c
0771 66        ld      h,(hl)
0772 54        ld      d,h
0773 61        ld      h,c
0774 6c        ld      l,h
0775 6b        ld      l,e
0776 2020      jr      nz,$0798
0778 2020      jr      nz,$079a
077a 2020      jr      nz,$079c
077c 2020      jr      nz,$079e
077e 2020      jr      nz,$07a0
0780 2020      jr      nz,$07a2
0782 43        ld      b,e
0783 6f        ld      l,a
0784 70        ld      (hl),b
0785 79        ld      a,c
0786 72        ld      (hl),d
0787 69        ld      l,c
0788 67        ld      h,a
0789 68        ld      l,b
078a 74        ld      (hl),h
078b 2031      jr      nz,$07be
078d 39        add     hl,sp
078e 3832      jr      c,$07c2
0790 2020      jr      nz,$07b2
0792 2052      jr      nz,$07e6
0794 65        ld      h,l
0795 64        ld      h,h
0796 64        ld      h,h
0797 69        ld      l,c
0798 6e        ld      l,(hl)
0799 67        ld      h,a
079a 2047      jr      nz,$07e3
079c 72        ld      (hl),d
079d 6f        ld      l,a
079e 75        ld      (hl),l
079f 70        ld      (hl),b
07a0 2049      jr      nz,$07eb
07a2 6e        ld      l,(hl)
07a3 63        ld      h,e
07a4 0d        dec     c
07a5 0a        ld      a,(bc)
07a6 56        ld      d,(hl)
07a7 65        ld      h,l
07a8 72        ld      (hl),d
07a9 2031      jr      nz,$07dc
07ab 2e31      ld      l,$31
07ad 2020      jr      nz,$07cf
07af 2053      jr      nz,$0804
07b1 65        ld      h,l
07b2 72        ld      (hl),d
07b3 2031      jr      nz,$07e6
07b5 33        inc     sp
07b6 3037      jr      nc,$07ef
07b8 2020      jr      nz,$07da
07ba 2020      jr      nz,$07dc
07bc 2020      jr      nz,$07de
07be 2020      jr      nz,$07e0
07c0 2020      jr      nz,$07e2
07c2 2020      jr      nz,$07e4
07c4 2036      jr      nz,$07fc
07c6 3039      jr      nc,$0801
07c8 204d      jr      nz,$0817
07ca 61        ld      h,c
07cb 69        ld      l,c
07cc 6e        ld      l,(hl)
07cd 2053      jr      nz,$0822
07cf 74        ld      (hl),h
07d0 72        ld      (hl),d
07d1 65        ld      h,l
07d2 65        ld      h,l
07d3 74        ld      (hl),h
07d4 2c        inc     l
07d5 2052      jr      nz,$0829
07d7 69        ld      l,c
07d8 64        ld      h,h
07d9 67        ld      h,a
07da 65        ld      h,l
07db 66        ld      h,(hl)
07dc 69        ld      l,c
07dd 65        ld      h,l
07de 6c        ld      l,h
07df 64        ld      h,h
07e0 2c        inc     l
07e1 2043      jr      nz,$0826
07e3 54        ld      d,h
07e4 2c        inc     l
07e5 2055      jr      nz,$083c
07e7 53        ld      d,e
07e8 41        ld      b,c
07e9 0d        dec     c
07ea 0a        ld      a,(bc)
07eb 0a        ld      a,(bc)
07ec 0a        ld      a,(bc)
07ed 00        nop     
07ee c9        ret     

07ef 00        nop     
07f0 00        nop     
07f1 00        nop     
07f2 00        nop     
07f3 00        nop     
07f4 00        nop     
07f5 00        nop     
07f6 00        nop     
07f7 00        nop     
07f8 00        nop     
07f9 00        nop     
07fa 00        nop     
07fb 00        nop     
07fc 00        nop     
07fd 00        nop     
07fe 00        nop     
07ff 00        nop     
0800 00        nop     
0801 00        nop     
0802 00        nop     
0803 00        nop     
0804 00        nop     
0805 00        nop     
0806 00        nop     
0807 00        nop     
0808 00        nop     
0809 00        nop     
080a 00        nop     
080b 00        nop     
080c 00        nop     
080d 00        nop     
080e 00        nop     
080f 00        nop     
0810 00        nop     
0811 00        nop     
0812 00        nop     
0813 00        nop     
0814 00        nop     
0815 00        nop     
0816 00        nop     
0817 00        nop     
0818 00        nop     
0819 00        nop     
081a 00        nop     
081b 00        nop     
081c 00        nop     
081d 00        nop     
081e 00        nop     
081f 00        nop     
0820 00        nop     
0821 00        nop     
0822 00        nop     
0823 00        nop     
0824 00        nop     
0825 00        nop     
0826 00        nop     
0827 00        nop     
0828 00        nop     
0829 00        nop     
082a 00        nop     
082b 00        nop     
082c 00        nop     
082d 00        nop     
082e 00        nop     
082f 00        nop     
0830 00        nop     
0831 00        nop     
0832 00        nop     
0833 00        nop     
0834 00        nop     
0835 00        nop     
0836 00        nop     
0837 00        nop     
0838 00        nop     
0839 00        nop     
083a 00        nop     
083b 00        nop     
083c 00        nop     
083d 00        nop     
083e 00        nop     
083f 00        nop     
0840 00        nop     
0841 00        nop     
0842 00        nop     
0843 00        nop     
0844 00        nop     
0845 00        nop     
0846 00        nop     
0847 00        nop     
0848 00        nop     
0849 00        nop     
084a 00        nop     
084b 00        nop     
084c 00        nop     
084d 00        nop     
084e 00        nop     
084f 00        nop     
0850 00        nop     
0851 00        nop     
0852 00        nop     
0853 00        nop     
0854 00        nop     
0855 00        nop     
0856 00        nop     
0857 00        nop     
0858 00        nop     
0859 00        nop     
085a 00        nop     
085b 00        nop     
085c 00        nop     
085d 00        nop     
085e 00        nop     
085f 00        nop     
0860 00        nop     
0861 00        nop     
0862 00        nop     
0863 00        nop     
0864 00        nop     
0865 00        nop     
0866 00        nop     
0867 00        nop     
0868 00        nop     
0869 00        nop     
086a 00        nop     
086b 00        nop     
086c 00        nop     
086d 00        nop     
086e 00        nop     
086f 00        nop     
0870 00        nop     
0871 00        nop     
0872 00        nop     
0873 00        nop     
0874 00        nop     
0875 00        nop     
0876 00        nop     
0877 00        nop     
0878 00        nop     
0879 00        nop     
087a 00        nop     
087b 00        nop     
087c 00        nop     
087d 00        nop     
087e 00        nop     
087f 00        nop     
0880 00        nop     
0881 00        nop     
0882 00        nop     
0883 00        nop     
0884 00        nop     
0885 00        nop     
0886 00        nop     
0887 00        nop     
0888 00        nop     
0889 00        nop     
088a 00        nop     
088b 00        nop     
088c 00        nop     
088d 00        nop     
088e 00        nop     
088f 00        nop     
0890 00        nop     
0891 00        nop     
0892 00        nop     
0893 00        nop     
0894 00        nop     
0895 00        nop     
0896 00        nop     
0897 00        nop     
0898 00        nop     
0899 00        nop     
089a 00        nop     
089b 00        nop     
089c 00        nop     
089d 00        nop     
089e 00        nop     
089f 00        nop     
08a0 00        nop     
08a1 00        nop     
08a2 00        nop     
08a3 00        nop     
08a4 00        nop     
08a5 00        nop     
08a6 00        nop     
08a7 00        nop     
08a8 00        nop     
08a9 00        nop     
08aa 00        nop     
08ab 00        nop     
08ac 00        nop     
08ad 00        nop     
08ae 00        nop     
08af 00        nop     
08b0 00        nop     
08b1 00        nop     
08b2 00        nop     
08b3 00        nop     
08b4 00        nop     
08b5 00        nop     
08b6 00        nop     
08b7 00        nop     
08b8 00        nop     
08b9 00        nop     
08ba 00        nop     
08bb 00        nop     
08bc 00        nop     
08bd 00        nop     
08be 00        nop     
08bf 00        nop     
08c0 00        nop     
08c1 00        nop     
08c2 00        nop     
08c3 00        nop     
08c4 00        nop     
08c5 00        nop     
08c6 00        nop     
08c7 00        nop     
08c8 00        nop     
08c9 00        nop     
08ca 00        nop     
08cb 00        nop     
08cc 00        nop     
08cd 00        nop     
08ce 00        nop     
08cf 00        nop     
08d0 00        nop     
08d1 00        nop     
08d2 00        nop     
08d3 00        nop     
08d4 00        nop     
08d5 00        nop     
08d6 00        nop     
08d7 00        nop     
08d8 00        nop     
08d9 00        nop     
08da 00        nop     
08db 00        nop     
08dc 00        nop     
08dd 00        nop     
08de 00        nop     
08df 00        nop     
08e0 00        nop     
08e1 00        nop     
08e2 00        nop     
08e3 00        nop     
08e4 00        nop     
08e5 00        nop     
08e6 00        nop     
08e7 00        nop     
08e8 00        nop     
08e9 00        nop     
08ea 00        nop     
08eb 00        nop     
08ec 00        nop     
08ed 00        nop     
08ee 00        nop     
08ef 00        nop     
08f0 00        nop     
08f1 00        nop     
08f2 00        nop     
08f3 00        nop     
08f4 00        nop     
08f5 00        nop     
08f6 00        nop     
08f7 00        nop     
08f8 00        nop     
08f9 00        nop     
08fa 00        nop     
08fb 00        nop     
08fc 00        nop     
08fd 00        nop     
08fe 00        nop     
08ff 00        nop     
0900 00        nop     
0901 00        nop     
0902 00        nop     
0903 00        nop     
0904 00        nop     
0905 00        nop     
0906 00        nop     
0907 00        nop     
0908 00        nop     
0909 00        nop     
090a 00        nop     
090b 00        nop     
090c 00        nop     
090d 00        nop     
090e 00        nop     
090f 00        nop     
0910 00        nop     
0911 00        nop     
0912 00        nop     
0913 00        nop     
0914 00        nop     
0915 00        nop     
0916 00        nop     
0917 00        nop     
0918 00        nop     
0919 00        nop     
091a 00        nop     
091b 00        nop     
091c 00        nop     
091d 00        nop     
091e 00        nop     
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
0938 00        nop     
0939 00        nop     
093a 00        nop     
093b 00        nop     
093c 00        nop     
093d 00        nop     
093e 00        nop     
093f 00        nop     
0940 00        nop     
0941 00        nop     
0942 00        nop     
0943 00        nop     
0944 00        nop     
0945 00        nop     
0946 00        nop     
0947 00        nop     
0948 00        nop     
0949 00        nop     
094a 00        nop     
094b 00        nop     
094c 00        nop     
094d 00        nop     
094e 00        nop     
094f 00        nop     
0950 00        nop     
0951 00        nop     
0952 00        nop     
0953 00        nop     
0954 00        nop     
0955 00        nop     
0956 00        nop     
0957 00        nop     
0958 00        nop     
0959 00        nop     
095a 00        nop     
095b 00        nop     
095c 00        nop     
095d 00        nop     
095e 00        nop     
095f 00        nop     
0960 00        nop     
0961 00        nop     
0962 00        nop     
0963 00        nop     
0964 00        nop     
0965 00        nop     
0966 00        nop     
0967 00        nop     
0968 00        nop     
0969 00        nop     
096a 00        nop     
096b 00        nop     
096c 00        nop     
096d 00        nop     
096e 00        nop     
096f 00        nop     
0970 00        nop     
0971 00        nop     
0972 00        nop     
0973 00        nop     
0974 00        nop     
0975 00        nop     
0976 00        nop     
0977 00        nop     
0978 00        nop     
0979 00        nop     
097a 00        nop     
097b 00        nop     
097c 00        nop     
097d 00        nop     
097e 00        nop     
097f 00        nop     
0980 00        nop     
0981 00        nop     
0982 00        nop     
0983 00        nop     
0984 00        nop     
0985 00        nop     
0986 00        nop     
0987 00        nop     
0988 00        nop     
0989 00        nop     
098a 00        nop     
098b 00        nop     
098c 00        nop     
098d 00        nop     
098e 00        nop     
098f 00        nop     
0990 00        nop     
0991 00        nop     
0992 00        nop     
0993 00        nop     
0994 00        nop     
0995 00        nop     
0996 00        nop     
0997 00        nop     
0998 00        nop     
0999 00        nop     
099a 00        nop     
099b 00        nop     
099c 00        nop     
099d 00        nop     
099e 00        nop     
099f 00        nop     
09a0 00        nop     
09a1 00        nop     
09a2 00        nop     
09a3 00        nop     
09a4 00        nop     
09a5 00        nop     
09a6 00        nop     
09a7 00        nop     
09a8 00        nop     
09a9 00        nop     
09aa 00        nop     
09ab 00        nop     
09ac 00        nop     
09ad 00        nop     
09ae 00        nop     
09af 00        nop     
09b0 00        nop     
09b1 00        nop     
09b2 00        nop     
09b3 00        nop     
09b4 00        nop     
09b5 00        nop     
09b6 00        nop     
09b7 00        nop     
09b8 00        nop     
09b9 00        nop     
09ba 00        nop     
09bb 00        nop     
09bc 00        nop     
09bd 00        nop     
09be 00        nop     
09bf 00        nop     
09c0 00        nop     
09c1 00        nop     
09c2 00        nop     
09c3 00        nop     
09c4 00        nop     
09c5 00        nop     
09c6 00        nop     
09c7 00        nop     
09c8 00        nop     
09c9 00        nop     
09ca 00        nop     
09cb 00        nop     
09cc 00        nop     
09cd 00        nop     
09ce 00        nop     
09cf 00        nop     
09d0 00        nop     
09d1 00        nop     
09d2 00        nop     
09d3 00        nop     
09d4 00        nop     
09d5 00        nop     
09d6 00        nop     
09d7 00        nop     
09d8 00        nop     
09d9 00        nop     
09da 00        nop     
09db 00        nop     
09dc 00        nop     
09dd 00        nop     
09de 00        nop     
09df 00        nop     
09e0 00        nop     
09e1 00        nop     
09e2 00        nop     
09e3 00        nop     
09e4 00        nop     
09e5 00        nop     
09e6 00        nop     
09e7 00        nop     
09e8 00        nop     
09e9 00        nop     
09ea 00        nop     
09eb 00        nop     
09ec 00        nop     
09ed 00        nop     
09ee 00        nop     
09ef 00        nop     
09f0 00        nop     
09f1 00        nop     
09f2 00        nop     
09f3 00        nop     
09f4 00        nop     
09f5 00        nop     
09f6 00        nop     
09f7 00        nop     
09f8 00        nop     
09f9 00        nop     
09fa 00        nop     
09fb 00        nop     
09fc 00        nop     
09fd 00        nop     
09fe 00        nop     
09ff 00        nop     
0a00 00        nop     
0a01 00        nop     
0a02 00        nop     
0a03 00        nop     
0a04 00        nop     
0a05 00        nop     
0a06 00        nop     
0a07 00        nop     
0a08 00        nop     
0a09 00        nop     
0a0a 00        nop     
0a0b 00        nop     
0a0c 00        nop     
0a0d 00        nop     
0a0e 00        nop     
0a0f 00        nop     
0a10 00        nop     
0a11 00        nop     
0a12 00        nop     
0a13 00        nop     
0a14 00        nop     
0a15 00        nop     
0a16 00        nop     
0a17 00        nop     
0a18 00        nop     
0a19 00        nop     
0a1a 00        nop     
0a1b 00        nop     
0a1c 00        nop     
0a1d 00        nop     
0a1e 00        nop     
0a1f 00        nop     
0a20 00        nop     
0a21 00        nop     
0a22 00        nop     
0a23 00        nop     
0a24 00        nop     
0a25 00        nop     
0a26 00        nop     
0a27 00        nop     
0a28 00        nop     
0a29 00        nop     
0a2a 00        nop     
0a2b 00        nop     
0a2c 00        nop     
0a2d 00        nop     
0a2e 00        nop     
0a2f 00        nop     
0a30 00        nop     
0a31 00        nop     
0a32 00        nop     
0a33 00        nop     
0a34 00        nop     
0a35 00        nop     
0a36 00        nop     
0a37 00        nop     
0a38 00        nop     
0a39 00        nop     
0a3a 00        nop     
0a3b 00        nop     
0a3c 00        nop     
0a3d 00        nop     
0a3e 00        nop     
0a3f 00        nop     
0a40 00        nop     
0a41 00        nop     
0a42 00        nop     
0a43 00        nop     
0a44 00        nop     
0a45 00        nop     
0a46 00        nop     
0a47 00        nop     
0a48 00        nop     
0a49 00        nop     
0a4a 00        nop     
0a4b 00        nop     
0a4c 00        nop     
0a4d 00        nop     
0a4e 00        nop     
0a4f 00        nop     
0a50 00        nop     
0a51 00        nop     
0a52 00        nop     
0a53 00        nop     
0a54 00        nop     
0a55 00        nop     
0a56 00        nop     
0a57 00        nop     
0a58 00        nop     
0a59 00        nop     
0a5a 00        nop     
0a5b 00        nop     
0a5c 00        nop     
0a5d 00        nop     
0a5e 00        nop     
0a5f 00        nop     
0a60 00        nop     
0a61 00        nop     
0a62 00        nop     
0a63 00        nop     
0a64 00        nop     
0a65 00        nop     
0a66 00        nop     
0a67 00        nop     
0a68 00        nop     
0a69 00        nop     
0a6a 00        nop     
0a6b 00        nop     
0a6c 00        nop     
0a6d 00        nop     
0a6e 00        nop     
0a6f 00        nop     
0a70 00        nop     
0a71 00        nop     
0a72 00        nop     
0a73 00        nop     
0a74 00        nop     
0a75 00        nop     
0a76 00        nop     
0a77 00        nop     
0a78 00        nop     
0a79 00        nop     
0a7a 00        nop     
0a7b 00        nop     
0a7c 00        nop     
0a7d 00        nop     
0a7e 00        nop     
0a7f 00        nop     
0a80 00        nop     
0a81 00        nop     
0a82 00        nop     
0a83 00        nop     
0a84 00        nop     
0a85 00        nop     
0a86 00        nop     
0a87 00        nop     
0a88 00        nop     
0a89 00        nop     
0a8a 00        nop     
0a8b 00        nop     
0a8c 00        nop     
0a8d 00        nop     
0a8e 00        nop     
0a8f 00        nop     
0a90 00        nop     
0a91 00        nop     
0a92 00        nop     
0a93 00        nop     
0a94 00        nop     
0a95 00        nop     
0a96 00        nop     
0a97 00        nop     
0a98 00        nop     
0a99 00        nop     
0a9a 00        nop     
0a9b 00        nop     
0a9c 00        nop     
0a9d 00        nop     
0a9e 00        nop     
0a9f 00        nop     
0aa0 00        nop     
0aa1 00        nop     
0aa2 00        nop     
0aa3 00        nop     
0aa4 00        nop     
0aa5 00        nop     
0aa6 00        nop     
0aa7 00        nop     
0aa8 00        nop     
0aa9 00        nop     
0aaa 00        nop     
0aab 00        nop     
0aac 00        nop     
0aad 00        nop     
0aae 00        nop     
0aaf 00        nop     
0ab0 00        nop     
0ab1 00        nop     
0ab2 00        nop     
0ab3 00        nop     
0ab4 00        nop     
0ab5 00        nop     
0ab6 00        nop     
0ab7 00        nop     
0ab8 00        nop     
0ab9 00        nop     
0aba 00        nop     
0abb 00        nop     
0abc 00        nop     
0abd 00        nop     
0abe 00        nop     
0abf 00        nop     
0ac0 00        nop     
0ac1 00        nop     
0ac2 00        nop     
0ac3 00        nop     
0ac4 00        nop     
0ac5 00        nop     
0ac6 00        nop     
0ac7 00        nop     
0ac8 00        nop     
0ac9 00        nop     
0aca 00        nop     
0acb 00        nop     
0acc 00        nop     
0acd 00        nop     
0ace 00        nop     
0acf 00        nop     
0ad0 00        nop     
0ad1 00        nop     
0ad2 00        nop     
0ad3 00        nop     
0ad4 00        nop     
0ad5 00        nop     
0ad6 00        nop     
0ad7 00        nop     
0ad8 00        nop     
0ad9 00        nop     
0ada 00        nop     
0adb 00        nop     
0adc 00        nop     
0add 00        nop     
0ade 00        nop     
0adf 00        nop     
0ae0 00        nop     
0ae1 00        nop     
0ae2 00        nop     
0ae3 00        nop     
0ae4 00        nop     
0ae5 00        nop     
0ae6 00        nop     
0ae7 00        nop     
0ae8 00        nop     
0ae9 00        nop     
0aea 00        nop     
0aeb 00        nop     
0aec 00        nop     
0aed 00        nop     
0aee 00        nop     
0aef 00        nop     
0af0 00        nop     
0af1 00        nop     
0af2 00        nop     
0af3 00        nop     
0af4 00        nop     
0af5 00        nop     
0af6 00        nop     
0af7 00        nop     
0af8 00        nop     
0af9 00        nop     
0afa 00        nop     
0afb 00        nop     
0afc 00        nop     
0afd 00        nop     
0afe 00        nop     
0aff 00        nop     
0b00 00        nop     
0b01 00        nop     
0b02 00        nop     
0b03 00        nop     
0b04 00        nop     
0b05 00        nop     
0b06 00        nop     
0b07 00        nop     
0b08 00        nop     
0b09 00        nop     
0b0a 00        nop     
0b0b 00        nop     
0b0c 00        nop     
0b0d 00        nop     
0b0e 00        nop     
0b0f 00        nop     
0b10 00        nop     
0b11 00        nop     
0b12 00        nop     
0b13 00        nop     
0b14 00        nop     
0b15 00        nop     
0b16 00        nop     
0b17 00        nop     
0b18 00        nop     
0b19 00        nop     
0b1a 00        nop     
0b1b 00        nop     
0b1c 00        nop     
0b1d 00        nop     
0b1e 00        nop     
0b1f 00        nop     
0b20 00        nop     
0b21 00        nop     
0b22 00        nop     
0b23 00        nop     
0b24 00        nop     
0b25 00        nop     
0b26 00        nop     
0b27 00        nop     
0b28 00        nop     
0b29 00        nop     
0b2a 00        nop     
0b2b 00        nop     
0b2c 00        nop     
0b2d 00        nop     
0b2e 00        nop     
0b2f 00        nop     
0b30 00        nop     
0b31 00        nop     
0b32 00        nop     
0b33 00        nop     
0b34 00        nop     
0b35 00        nop     
0b36 00        nop     
0b37 00        nop     
0b38 00        nop     
0b39 00        nop     
0b3a 00        nop     
0b3b 00        nop     
0b3c 00        nop     
0b3d 00        nop     
0b3e 00        nop     
0b3f 00        nop     
0b40 00        nop     
0b41 00        nop     
0b42 00        nop     
0b43 00        nop     
0b44 00        nop     
0b45 00        nop     
0b46 00        nop     
0b47 00        nop     
0b48 00        nop     
0b49 00        nop     
0b4a 00        nop     
0b4b 00        nop     
0b4c 00        nop     
0b4d 00        nop     
0b4e 00        nop     
0b4f 00        nop     
0b50 00        nop     
0b51 00        nop     
0b52 00        nop     
0b53 00        nop     
0b54 00        nop     
0b55 00        nop     
0b56 00        nop     
0b57 00        nop     
0b58 00        nop     
0b59 00        nop     
0b5a 00        nop     
0b5b 00        nop     
0b5c 00        nop     
0b5d 00        nop     
0b5e 00        nop     
0b5f 00        nop     
0b60 00        nop     
0b61 00        nop     
0b62 00        nop     
0b63 00        nop     
0b64 00        nop     
0b65 00        nop     
0b66 00        nop     
0b67 00        nop     
0b68 00        nop     
0b69 00        nop     
0b6a 00        nop     
0b6b 00        nop     
0b6c 00        nop     
0b6d 00        nop     
0b6e 00        nop     
0b6f 00        nop     
0b70 00        nop     
0b71 00        nop     
0b72 00        nop     
0b73 00        nop     
0b74 00        nop     
0b75 00        nop     
0b76 00        nop     
0b77 00        nop     
0b78 00        nop     
0b79 00        nop     
0b7a 00        nop     
0b7b 00        nop     
0b7c 00        nop     
0b7d 00        nop     
0b7e 00        nop     
0b7f 00        nop     
0b80 00        nop     
0b81 00        nop     
0b82 00        nop     
0b83 00        nop     
0b84 00        nop     
0b85 00        nop     
0b86 00        nop     
0b87 00        nop     
0b88 00        nop     
0b89 00        nop     
0b8a 00        nop     
0b8b 00        nop     
0b8c 00        nop     
0b8d 00        nop     
0b8e 00        nop     
0b8f 00        nop     
0b90 00        nop     
0b91 00        nop     
0b92 00        nop     
0b93 00        nop     
0b94 00        nop     
0b95 00        nop     
0b96 00        nop     
0b97 00        nop     
0b98 00        nop     
0b99 00        nop     
0b9a 00        nop     
0b9b 00        nop     
0b9c 00        nop     
0b9d 00        nop     
0b9e 00        nop     
0b9f 00        nop     
0ba0 00        nop     
0ba1 00        nop     
0ba2 00        nop     
0ba3 00        nop     
0ba4 00        nop     
0ba5 00        nop     
0ba6 00        nop     
0ba7 00        nop     
0ba8 00        nop     
0ba9 00        nop     
0baa 00        nop     
0bab 00        nop     
0bac 00        nop     
0bad 00        nop     
0bae 00        nop     
0baf 00        nop     
0bb0 00        nop     
0bb1 00        nop     
0bb2 00        nop     
0bb3 00        nop     
0bb4 00        nop     
0bb5 00        nop     
0bb6 00        nop     
0bb7 00        nop     
0bb8 00        nop     
0bb9 00        nop     
0bba 00        nop     
0bbb 00        nop     
0bbc 00        nop     
0bbd 00        nop     
0bbe 00        nop     
0bbf 00        nop     
0bc0 00        nop     
0bc1 00        nop     
0bc2 00        nop     
0bc3 00        nop     
0bc4 00        nop     
0bc5 00        nop     
0bc6 00        nop     
0bc7 00        nop     
0bc8 00        nop     
0bc9 00        nop     
0bca 00        nop     
0bcb 00        nop     
0bcc 00        nop     
0bcd 00        nop     
0bce 00        nop     
0bcf 00        nop     
0bd0 00        nop     
0bd1 00        nop     
0bd2 00        nop     
0bd3 00        nop     
0bd4 00        nop     
0bd5 00        nop     
0bd6 00        nop     
0bd7 00        nop     
0bd8 00        nop     
0bd9 00        nop     
0bda 00        nop     
0bdb 00        nop     
0bdc 00        nop     
0bdd 00        nop     
0bde 00        nop     
0bdf 00        nop     
0be0 00        nop     
0be1 00        nop     
0be2 00        nop     
0be3 00        nop     
0be4 00        nop     
0be5 00        nop     
0be6 00        nop     
0be7 00        nop     
0be8 00        nop     
0be9 00        nop     
0bea 00        nop     
0beb 00        nop     
0bec 00        nop     
0bed 00        nop     
0bee 00        nop     
0bef 00        nop     
0bf0 00        nop     
0bf1 00        nop     
0bf2 00        nop     
0bf3 00        nop     
0bf4 00        nop     
0bf5 00        nop     
0bf6 00        nop     
0bf7 00        nop     
0bf8 00        nop     
0bf9 00        nop     
0bfa 00        nop     
0bfb 00        nop     
0bfc 00        nop     
0bfd 00        nop     
0bfe 00        nop     
0bff 00        nop     
0c00 00        nop     
0c01 00        nop     
0c02 00        nop     
0c03 00        nop     
0c04 00        nop     
0c05 00        nop     
0c06 00        nop     
0c07 00        nop     
0c08 00        nop     
0c09 00        nop     
0c0a 00        nop     
0c0b 00        nop     
0c0c 00        nop     
0c0d 00        nop     
0c0e 00        nop     
0c0f 00        nop     
0c10 00        nop     
0c11 00        nop     
0c12 00        nop     
0c13 00        nop     
0c14 00        nop     
0c15 00        nop     
0c16 00        nop     
0c17 00        nop     
0c18 00        nop     
0c19 00        nop     
0c1a 00        nop     
0c1b 00        nop     
0c1c 00        nop     
0c1d 00        nop     
0c1e 00        nop     
0c1f 00        nop     
0c20 00        nop     
0c21 00        nop     
0c22 00        nop     
0c23 00        nop     
0c24 00        nop     
0c25 00        nop     
0c26 00        nop     
0c27 00        nop     
0c28 00        nop     
0c29 00        nop     
0c2a 00        nop     
0c2b 00        nop     
0c2c 00        nop     
0c2d 00        nop     
0c2e 00        nop     
0c2f 00        nop     
0c30 00        nop     
0c31 00        nop     
0c32 00        nop     
0c33 00        nop     
0c34 00        nop     
0c35 00        nop     
0c36 00        nop     
0c37 00        nop     
0c38 00        nop     
0c39 00        nop     
0c3a 00        nop     
0c3b 00        nop     
0c3c 00        nop     
0c3d 00        nop     
0c3e 00        nop     
0c3f 00        nop     
0c40 00        nop     
0c41 00        nop     
0c42 00        nop     
0c43 00        nop     
0c44 00        nop     
0c45 00        nop     
0c46 00        nop     
0c47 00        nop     
0c48 00        nop     
0c49 00        nop     
0c4a 00        nop     
0c4b 00        nop     
0c4c 00        nop     
0c4d 00        nop     
0c4e 00        nop     
0c4f 00        nop     
0c50 00        nop     
0c51 00        nop     
0c52 00        nop     
0c53 00        nop     
0c54 00        nop     
0c55 00        nop     
0c56 00        nop     
0c57 00        nop     
0c58 00        nop     
0c59 00        nop     
0c5a 00        nop     
0c5b 00        nop     
0c5c 00        nop     
0c5d 00        nop     
0c5e 00        nop     
0c5f 00        nop     
0c60 00        nop     
0c61 00        nop     
0c62 00        nop     
0c63 00        nop     
0c64 00        nop     
0c65 00        nop     
0c66 00        nop     
0c67 00        nop     
0c68 00        nop     
0c69 00        nop     
0c6a 00        nop     
0c6b 00        nop     
0c6c 00        nop     
0c6d 00        nop     
0c6e 00        nop     
0c6f 00        nop     
0c70 00        nop     
0c71 00        nop     
0c72 00        nop     
0c73 00        nop     
0c74 00        nop     
0c75 00        nop     
0c76 00        nop     
0c77 00        nop     
0c78 00        nop     
0c79 00        nop     
0c7a 00        nop     
0c7b 00        nop     
0c7c 00        nop     
0c7d 00        nop     
0c7e 00        nop     
0c7f 00        nop     
0c80 00        nop     
0c81 00        nop     
0c82 00        nop     
0c83 00        nop     
0c84 00        nop     
0c85 00        nop     
0c86 00        nop     
0c87 00        nop     
0c88 00        nop     
0c89 00        nop     
0c8a 00        nop     
0c8b 00        nop     
0c8c 00        nop     
0c8d 00        nop     
0c8e 00        nop     
0c8f 00        nop     
0c90 00        nop     
0c91 00        nop     
0c92 00        nop     
0c93 00        nop     
0c94 00        nop     
0c95 00        nop     
0c96 00        nop     
0c97 00        nop     
0c98 00        nop     
0c99 00        nop     
0c9a 00        nop     
0c9b 00        nop     
0c9c 00        nop     
0c9d 00        nop     
0c9e 00        nop     
0c9f 00        nop     
0ca0 00        nop     
0ca1 00        nop     
0ca2 00        nop     
0ca3 00        nop     
0ca4 00        nop     
0ca5 00        nop     
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
0ec9 c9        ret     

0eca 0ee4      ld      c,$e4
0ecc 2853      jr      z,$0f21
0ece 43        ld      b,e
0ecf 41        ld      b,c
0ed0 54        ld      d,h
0ed1 45        ld      b,l
0ed2 312020    ld      sp,$2020
0ed5 22a826    ld      ($26a8),hl
0ed8 2aa826    ld      hl,($26a8)
0edb 7e        ld      a,(hl)
0edc d65a      sub     $5a
0ede 3d        dec     a
0edf c681      add     a,$81
0ee1 9f        sbc     a,a
0ee2 32aa26    ld      ($26aa),a
0ee5 2aa826    ld      hl,($26a8)
0ee8 7e        ld      a,(hl)
0ee9 d641      sub     $41
0eeb 17        rla     
0eec 3f        ccf     
0eed 9f        sbc     a,a
0eee 21aa26    ld      hl,$26aa
0ef1 a6        and     (hl)
0ef2 32ab26    ld      ($26ab),a
0ef5 b7        or      a
0ef6 c2210f    jp      nz,$0f21
0ef9 2aa826    ld      hl,($26a8)
0efc 7e        ld      a,(hl)
0efd d67a      sub     $7a
0eff 32aa26    ld      ($26aa),a
0f02 3d        dec     a
0f03 d67f      sub     $7f
0f05 9f        sbc     a,a
0f06 32ab26    ld      ($26ab),a
0f09 3aaa26    ld      a,($26aa)
0f0c 17        rla     
0f0d 9f        sbc     a,a
0f0e 21ab26    ld      hl,$26ab
0f11 b6        or      (hl)
0f12 32ac26    ld      ($26ac),a
0f15 b7        or      a
0f16 ca1a0f    jp      z,$0f1a
0f19 c9        ret     

0f1a 2aa826    ld      hl,($26a8)
0f1d cd3031    call    $3130
0f20 c9        ret     

0f21 2aa826    ld      hl,($26a8)
0f24 cd392f    call    $2f39
0f27 c9        ret     

0f28 22b626    ld      ($26b6),hl
0f2b 2ab626    ld      hl,($26b6)
0f2e cdc10f    call    $0fc1
0f31 32ae26    ld      ($26ae),a
0f34 2f        cpl     
0f35 32b926    ld      ($26b9),a
0f38 b7        or      a
0f39 ca400f    jp      z,$0f40
0f3c 3aae26    ld      a,($26ae)
0f3f c9        ret     

0f40 2ab626    ld      hl,($26b6)
0f43 7e        ld      a,(hl)
0f44 d65e      sub     $5e
0f46 c6ff      add     a,$ff
0f48 9f        sbc     a,a
0f49 32b926    ld      ($26b9),a
0f4c b7        or      a
0f4d ca540f    jp      z,$0f54
0f50 3aae26    ld      a,($26ae)
0f53 c9        ret     

0f54 2ab626    ld      hl,($26b6)
0f57 cdc10f    call    $0fc1
0f5a 32ae26    ld      ($26ae),a
0f5d 2f        cpl     
0f5e 32b926    ld      ($26b9),a
0f61 b7        or      a
0f62 ca690f    jp      z,$0f69
0f65 3aae26    ld      a,($26ae)
0f68 c9        ret     

0f69 2ab626    ld      hl,($26b6)
0f6c 7e        ld      a,(hl)
0f6d d65e      sub     $5e
0f6f d601      sub     $01
0f71 9f        sbc     a,a
0f72 32b926    ld      ($26b9),a
0f75 b7        or      a
0f76 ca7d0f    jp      z,$0f7d
0f79 3aae26    ld      a,($26ae)
0f7c c9        ret     

0f7d 2ab626    ld      hl,($26b6)
0f80 7e        ld      a,(hl)
0f81 d63c      sub     $3c
0f83 d601      sub     $01
0f85 9f        sbc     a,a
0f86 32b926    ld      ($26b9),a
0f89 b7        or      a
0f8a c2aa0f    jp      nz,$0faa
0f8d 2ab626    ld      hl,($26b6)
0f90 7e        ld      a,(hl)
0f91 d620      sub     $20
0f93 2ab626    ld      hl,($26b6)
0f96 77        ld      (hl),a
0f97 7e        ld      a,(hl)
0f98 d620      sub     $20
0f9a 17        rla     
0f9b 9f        sbc     a,a
0f9c 32b926    ld      ($26b9),a
0f9f b7        or      a
0fa0 caa70f    jp      z,$0fa7
0fa3 3aae26    ld      a,($26ae)
0fa6 c9        ret     

0fa7 c38d0f    jp      $0f8d
0faa 3a0998    ld      a,($9809)
0fad 110098    ld      de,$9800
0fb0 6f        ld      l,a
0fb1 17        rla     
0fb2 9f        sbc     a,a
0fb3 67        ld      h,a
0fb4 19        add     hl,de
0fb5 22ba26    ld      ($26ba),hl
0fb8 3e01      ld      a,$01
0fba 2aba26    ld      hl,($26ba)
0fbd 77        ld      (hl),a
0fbe c32b0f    jp      $0f2b
0fc1 22c526    ld      ($26c5),hl
0fc4 3a2498    ld      a,($9824)
0fc7 3d        dec     a
0fc8 c681      add     a,$81
0fca 9f        sbc     a,a
0fcb 32c926    ld      ($26c9),a
0fce 3a0998    ld      a,($9809)
0fd1 3d        dec     a
0fd2 d67f      sub     $7f
0fd4 9f        sbc     a,a
0fd5 21c926    ld      hl,$26c9
0fd8 a6        and     (hl)
0fd9 32ca26    ld      ($26ca),a
0fdc b7        or      a
0fdd c2e50f    jp      nz,$0fe5
0fe0 af        xor     a
0fe1 32bd26    ld      ($26bd),a
0fe4 c9        ret     

0fe5 3a0998    ld      a,($9809)
0fe8 6f        ld      l,a
0fe9 17        rla     
0fea 9f        sbc     a,a
0feb 67        ld      h,a
0fec 29        add     hl,hl
0fed 11b997    ld      de,$97b9
0ff0 19        add     hl,de
0ff1 22cb26    ld      ($26cb),hl
0ff4 2acb26    ld      hl,($26cb)
0ff7 cdba10    call    $10ba
0ffa cd5d36    call    $365d
0ffd 3a0998    ld      a,($9809)
1000 110098    ld      de,$9800
1003 6f        ld      l,a
1004 17        rla     
1005 9f        sbc     a,a
1006 67        ld      h,a
1007 19        add     hl,de
1008 7e        ld      a,(hl)
1009 32c826    ld      ($26c8),a
100c 214999    ld      hl,$9949
100f cdde2e    call    $2ede
1012 32c926    ld      ($26c9),a
1015 3ac826    ld      a,($26c8)
1018 21c926    ld      hl,$26c9
101b 96        sub     (hl)
101c 3d        dec     a
101d d67f      sub     $7f
101f 9f        sbc     a,a
1020 32ca26    ld      ($26ca),a
1023 b7        or      a
1024 c25c10    jp      nz,$105c
1027 3ac826    ld      a,($26c8)
102a 114899    ld      de,$9948
102d 6f        ld      l,a
102e 17        rla     
102f 9f        sbc     a,a
1030 67        ld      h,a
1031 19        add     hl,de
1032 7e        ld      a,(hl)
1033 2ac526    ld      hl,($26c5)
1036 77        ld      (hl),a
1037 3a0998    ld      a,($9809)
103a 110098    ld      de,$9800
103d 6f        ld      l,a
103e 17        rla     
103f 9f        sbc     a,a
1040 67        ld      h,a
1041 19        add     hl,de
1042 22cb26    ld      ($26cb),hl
1045 3ac826    ld      a,($26c8)
1048 3c        inc     a
1049 2acb26    ld      hl,($26cb)
104c 77        ld      (hl),a
104d 3eff      ld      a,$ff
104f 32bd26    ld      ($26bd),a
1052 216c10    ld      hl,$106c
1055 cdba10    call    $10ba
1058 3abd26    ld      a,($26bd)
105b c9        ret     

105c 216c10    ld      hl,$106c
105f cdba10    call    $10ba
1062 3a0998    ld      a,($9809)
1065 3d        dec     a
1066 320998    ld      ($9809),a
1069 c3c40f    jp      $0fc4
106c 00        nop     
106d 00        nop     
106e 3a0998    ld      a,($9809)
1071 d604      sub     $04
1073 17        rla     
1074 3f        ccf     
1075 9f        sbc     a,a
1076 32ce26    ld      ($26ce),a
1079 b7        or      a
107a c2af10    jp      nz,$10af
107d 3a0998    ld      a,($9809)
1080 3c        inc     a
1081 320998    ld      ($9809),a
1084 6f        ld      l,a
1085 17        rla     
1086 9f        sbc     a,a
1087 67        ld      h,a
1088 29        add     hl,hl
1089 11b997    ld      de,$97b9
108c 19        add     hl,de
108d 22cf26    ld      ($26cf),hl
1090 2a7d97    ld      hl,($977d)
1093 eb        ex      de,hl
1094 2acf26    ld      hl,($26cf)
1097 73        ld      (hl),e
1098 23        inc     hl
1099 72        ld      (hl),d
109a 3a0998    ld      a,($9809)
109d 110098    ld      de,$9800
10a0 6f        ld      l,a
10a1 17        rla     
10a2 9f        sbc     a,a
10a3 67        ld      h,a
10a4 19        add     hl,de
10a5 22d126    ld      ($26d1),hl
10a8 3e01      ld      a,$01
10aa 2ad126    ld      hl,($26d1)
10ad 77        ld      (hl),a
10ae c9        ret     

10af af        xor     a
10b0 320998    ld      ($9809),a
10b3 21d326    ld      hl,$26d3
10b6 cda62f    call    $2fa6
10b9 c9        ret     

10ba 22e426    ld      ($26e4),hl
10bd 2ae426    ld      hl,($26e4)
10c0 7e        ld      a,(hl)
10c1 23        inc     hl
10c2 66        ld      h,(hl)
10c3 6f        ld      l,a
10c4 7d        ld      a,l
10c5 07        rlca    
10c6 b5        or      l
10c7 e67f      and     $7f
10c9 b4        or      h
10ca d601      sub     $01
10cc 9f        sbc     a,a
10cd 32e926    ld      ($26e9),a
10d0 b7        or      a
10d1 c2f110    jp      nz,$10f1
10d4 3a0598    ld      a,($9805)
10d7 32e826    ld      ($26e8),a
10da 210a98    ld      hl,$980a
10dd cdbd1f    call    $1fbd
10e0 2a7597    ld      hl,($9775)
10e3 22e626    ld      ($26e6),hl
10e6 2ae426    ld      hl,($26e4)
10e9 7e        ld      a,(hl)
10ea 23        inc     hl
10eb 66        ld      h,(hl)
10ec 6f        ld      l,a
10ed 227597    ld      ($9775),hl
10f0 c9        ret     

10f1 2ae626    ld      hl,($26e6)
10f4 227597    ld      ($9775),hl
10f7 21e826    ld      hl,$26e8
10fa cdbd1f    call    $1fbd
10fd cd5d36    call    $365d
1100 c9        ret     

1101 21eb26    ld      hl,$26eb
1104 cda62f    call    $2fa6
1107 c9        ret     

1108 3af397    ld      a,($97f3)
110b 6f        ld      l,a
110c 17        rla     
110d 9f        sbc     a,a
110e 67        ld      h,a
110f 29        add     hl,hl
1110 119b97    ld      de,$979b
1113 19        add     hl,de
1114 22f026    ld      ($26f0),hl
1117 2af026    ld      hl,($26f0)
111a eb        ex      de,hl
111b 218d97    ld      hl,$978d
111e cdb42e    call    $2eb4
1121 32f226    ld      ($26f2),a
1124 b7        or      a
1125 ca2b11    jp      z,$112b
1128 cd3402    call    $0234
112b c9        ret     

112c 22f426    ld      ($26f4),hl
112f 2af426    ld      hl,($26f4)
1132 7e        ld      a,(hl)
1133 6f        ld      l,a
1134 17        rla     
1135 9f        sbc     a,a
1136 67        ld      h,a
1137 228997    ld      ($9789),hl
113a 7d        ld      a,l
113b 07        rlca    
113c b5        or      l
113d e67f      and     $7f
113f b4        or      h
1140 17        rla     
1141 9f        sbc     a,a
1142 32f926    ld      ($26f9),a
1145 b7        or      a
1146 ca5311    jp      z,$1153
1149 2a8997    ld      hl,($9789)
114c 110001    ld      de,$0100
114f 19        add     hl,de
1150 228997    ld      ($9789),hl
1153 210100    ld      hl,$0001
1156 eb        ex      de,hl
1157 2af426    ld      hl,($26f4)
115a 19        add     hl,de
115b 7e        ld      a,(hl)
115c 32f626    ld      ($26f6),a
115f 210200    ld      hl,$0002
1162 eb        ex      de,hl
1163 2af426    ld      hl,($26f4)
1166 19        add     hl,de
1167 7e        ld      a,(hl)
1168 32f726    ld      ($26f7),a
116b 11b911    ld      de,$11b9
116e 21f626    ld      hl,$26f6
1171 cd8426    call    $2684
1174 22fa26    ld      ($26fa),hl
1177 11bb11    ld      de,$11bb
117a 21fa26    ld      hl,$26fa
117d cdf72c    call    $2cf7
1180 32f926    ld      ($26f9),a
1183 b7        or      a
1184 ca9111    jp      z,$1191
1187 2a8997    ld      hl,($9789)
118a 110001    ld      de,$0100
118d 19        add     hl,de
118e 228997    ld      ($9789),hl
1191 2af626    ld      hl,($26f6)
1194 eb        ex      de,hl
1195 210200    ld      hl,$0002
1198 cd777e    call    $7e77
119b 228b97    ld      ($978b),hl
119e 7d        ld      a,l
119f 07        rlca    
11a0 b5        or      l
11a1 e67f      and     $7f
11a3 b4        or      h
11a4 17        rla     
11a5 3f        ccf     
11a6 9f        sbc     a,a
11a7 32f926    ld      ($26f9),a
11aa b7        or      a
11ab caaf11    jp      z,$11af
11ae c9        ret     

11af 11f626    ld      de,$26f6
11b2 21fc26    ld      hl,$26fc
11b5 cd5c01    call    $015c
11b8 c9        ret     

11b9 02        ld      (bc),a
11ba 00        nop     
11bb 010022    ld      bc,$2200
11be 0627      ld      b,$27
11c0 eb        ex      de,hl
11c1 220827    ld      ($2708),hl
11c4 cd8f12    call    $128f
11c7 2a8997    ld      hl,($9789)
11ca 220a27    ld      ($270a),hl
11cd 2a9597    ld      hl,($9795)
11d0 eb        ex      de,hl
11d1 210002    ld      hl,$0200
11d4 cdd37e    call    $7ed3
11d7 eb        ex      de,hl
11d8 2a0a27    ld      hl,($270a)
11db 19        add     hl,de
11dc 11738d    ld      de,$8d73
11df 19        add     hl,de
11e0 220c27    ld      ($270c),hl
11e3 2a0827    ld      hl,($2708)
11e6 44        ld      b,h
11e7 4d        ld      c,l
11e8 2a0c27    ld      hl,($270c)
11eb eb        ex      de,hl
11ec 2a0627    ld      hl,($2706)
11ef cd383a    call    $3a38
11f2 c9        ret     

11f3 220f27    ld      ($270f),hl
11f6 eb        ex      de,hl
11f7 221127    ld      ($2711),hl
11fa cd8f12    call    $128f
11fd 2a8997    ld      hl,($9789)
1200 23        inc     hl
1201 221527    ld      ($2715),hl
1204 210100    ld      hl,$0001
1207 221327    ld      ($2713),hl
120a 2a1527    ld      hl,($2715)
120d 221727    ld      ($2717),hl
1210 2a9597    ld      hl,($9795)
1213 eb        ex      de,hl
1214 210002    ld      hl,$0200
1217 cdd37e    call    $7ed3
121a eb        ex      de,hl
121b 2a1727    ld      hl,($2717)
121e 19        add     hl,de
121f 11728d    ld      de,$8d72
1222 19        add     hl,de
1223 221927    ld      ($2719),hl
1226 2a1327    ld      hl,($2713)
1229 2b        dec     hl
122a eb        ex      de,hl
122b 2a0f27    ld      hl,($270f)
122e 19        add     hl,de
122f 221b27    ld      ($271b),hl
1232 2a1927    ld      hl,($2719)
1235 7e        ld      a,(hl)
1236 2a1b27    ld      hl,($271b)
1239 96        sub     (hl)
123a c6ff      add     a,$ff
123c 9f        sbc     a,a
123d 321d27    ld      ($271d),a
1240 b7        or      a
1241 ca4912    jp      z,$1249
1244 3eff      ld      a,$ff
1246 32c997    ld      ($97c9),a
1249 2a1527    ld      hl,($2715)
124c 221727    ld      ($2717),hl
124f 2a9597    ld      hl,($9795)
1252 eb        ex      de,hl
1253 210002    ld      hl,$0200
1256 cdd37e    call    $7ed3
1259 eb        ex      de,hl
125a 2a1727    ld      hl,($2717)
125d 19        add     hl,de
125e 11728d    ld      de,$8d72
1261 19        add     hl,de
1262 221927    ld      ($2719),hl
1265 2a1327    ld      hl,($2713)
1268 2b        dec     hl
1269 eb        ex      de,hl
126a 2a0f27    ld      hl,($270f)
126d 19        add     hl,de
126e 7e        ld      a,(hl)
126f 2a1927    ld      hl,($2719)
1272 77        ld      (hl),a
1273 2a1527    ld      hl,($2715)
1276 23        inc     hl
1277 221527    ld      ($2715),hl
127a 2a1327    ld      hl,($2713)
127d 23        inc     hl
127e eb        ex      de,hl
127f 2a1127    ld      hl,($2711)
1282 7e        ld      a,(hl)
1283 23        inc     hl
1284 66        ld      h,(hl)
1285 6f        ld      l,a
1286 eb        ex      de,hl
1287 7b        ld      a,e
1288 95        sub     l
1289 7a        ld      a,d
128a 9c        sbc     a,h
128b f20712    jp      p,$1207
128e c9        ret     

128f 118b97    ld      de,$978b
1292 218d97    ld      hl,$978d
1295 cdf72c    call    $2cf7
1298 322d27    ld      ($272d),a
129b 3af397    ld      a,($97f3)
129e 210b98    ld      hl,$980b
12a1 96        sub     (hl)
12a2 d601      sub     $01
12a4 9f        sbc     a,a
12a5 212d27    ld      hl,$272d
12a8 a6        and     (hl)
12a9 322e27    ld      ($272e),a
12ac b7        or      a
12ad cab112    jp      z,$12b1
12b0 c9        ret     

12b1 210200    ld      hl,$0002
12b4 221f27    ld      ($271f),hl
12b7 2a1f27    ld      hl,($271f)
12ba 29        add     hl,hl
12bb 118b97    ld      de,$978b
12be 19        add     hl,de
12bf 222f27    ld      ($272f),hl
12c2 118b97    ld      de,$978b
12c5 2a2f27    ld      hl,($272f)
12c8 cd7630    call    $3076
12cb 322d27    ld      ($272d),a
12ce b7        or      a
12cf c2eb12    jp      nz,$12eb
12d2 2a1f27    ld      hl,($271f)
12d5 11f297    ld      de,$97f2
12d8 19        add     hl,de
12d9 7e        ld      a,(hl)
12da 210b98    ld      hl,$980b
12dd 96        sub     (hl)
12de c6ff      add     a,$ff
12e0 9f        sbc     a,a
12e1 322d27    ld      ($272d),a
12e4 b7        or      a
12e5 c2eb12    jp      nz,$12eb
12e8 c31514    jp      $1415
12eb 2a1f27    ld      hl,($271f)
12ee 23        inc     hl
12ef 3e04      ld      a,$04
12f1 95        sub     l
12f2 3e00      ld      a,$00
12f4 9c        sbc     a,h
12f5 f2b412    jp      p,$12b4
12f8 2a9b97    ld      hl,($979b)
12fb 222127    ld      ($2721),hl
12fe 3acc97    ld      a,($97cc)
1301 b7        or      a
1302 ca2213    jp      z,$1322
1305 2a2127    ld      hl,($2721)
1308 eb        ex      de,hl
1309 210002    ld      hl,$0200
130c cdd37e    call    $7ed3
130f 11738d    ld      de,$8d73
1312 19        add     hl,de
1313 222f27    ld      ($272f),hl
1316 019397    ld      bc,$9793
1319 11f697    ld      de,$97f6
131c 2a2f27    ld      hl,($272f)
131f cd6a02    call    $026a
1322 210400    ld      hl,$0004
1325 222727    ld      ($2727),hl
1328 3eff      ld      a,$ff
132a 322927    ld      ($2729),a
132d 2a2727    ld      hl,($2727)
1330 222127    ld      ($2721),hl
1333 2b        dec     hl
1334 222327    ld      ($2723),hl
1337 2a2727    ld      hl,($2727)
133a 29        add     hl,hl
133b 119397    ld      de,$9793
133e 19        add     hl,de
133f 7e        ld      a,(hl)
1340 23        inc     hl
1341 66        ld      h,(hl)
1342 6f        ld      l,a
1343 222527    ld      ($2725),hl
1346 2a2727    ld      hl,($2727)
1349 11c897    ld      de,$97c8
134c 19        add     hl,de
134d 7e        ld      a,(hl)
134e 322a27    ld      ($272a),a
1351 210200    ld      hl,$0002
1354 221f27    ld      ($271f),hl
1357 2a2127    ld      hl,($2721)
135a 222f27    ld      ($272f),hl
135d 11c897    ld      de,$97c8
1360 19        add     hl,de
1361 223127    ld      ($2731),hl
1364 2a2327    ld      hl,($2723)
1367 223327    ld      ($2733),hl
136a 11c897    ld      de,$97c8
136d 19        add     hl,de
136e 7e        ld      a,(hl)
136f 2a3127    ld      hl,($2731)
1372 77        ld      (hl),a
1373 2a2f27    ld      hl,($272f)
1376 11f297    ld      de,$97f2
1379 19        add     hl,de
137a 223527    ld      ($2735),hl
137d 2a3327    ld      hl,($2733)
1380 11f297    ld      de,$97f2
1383 19        add     hl,de
1384 7e        ld      a,(hl)
1385 2a3527    ld      hl,($2735)
1388 77        ld      (hl),a
1389 2a2127    ld      hl,($2721)
138c 29        add     hl,hl
138d 223727    ld      ($2737),hl
1390 118b97    ld      de,$978b
1393 19        add     hl,de
1394 223927    ld      ($2739),hl
1397 2a2327    ld      hl,($2723)
139a 29        add     hl,hl
139b 223b27    ld      ($273b),hl
139e 118b97    ld      de,$978b
13a1 19        add     hl,de
13a2 7e        ld      a,(hl)
13a3 23        inc     hl
13a4 66        ld      h,(hl)
13a5 6f        ld      l,a
13a6 eb        ex      de,hl
13a7 2a3927    ld      hl,($2739)
13aa 73        ld      (hl),e
13ab 23        inc     hl
13ac 72        ld      (hl),d
13ad 2a3727    ld      hl,($2737)
13b0 119397    ld      de,$9793
13b3 19        add     hl,de
13b4 223d27    ld      ($273d),hl
13b7 2a3b27    ld      hl,($273b)
13ba 119397    ld      de,$9793
13bd 19        add     hl,de
13be 7e        ld      a,(hl)
13bf 23        inc     hl
13c0 66        ld      h,(hl)
13c1 6f        ld      l,a
13c2 eb        ex      de,hl
13c3 2a3d27    ld      hl,($273d)
13c6 73        ld      (hl),e
13c7 23        inc     hl
13c8 72        ld      (hl),d
13c9 2a2127    ld      hl,($2721)
13cc 2b        dec     hl
13cd 222127    ld      ($2721),hl
13d0 2a2327    ld      hl,($2723)
13d3 2b        dec     hl
13d4 222327    ld      ($2723),hl
13d7 2a1f27    ld      hl,($271f)
13da 23        inc     hl
13db eb        ex      de,hl
13dc 2a2727    ld      hl,($2727)
13df eb        ex      de,hl
13e0 7b        ld      a,e
13e1 95        sub     l
13e2 7a        ld      a,d
13e3 9c        sbc     a,h
13e4 f25413    jp      p,$1354
13e7 3a2a27    ld      a,($272a)
13ea 32c997    ld      ($97c9),a
13ed 3a2927    ld      a,($2729)
13f0 b7        or      a
13f1 caf813    jp      z,$13f8
13f4 af        xor     a
13f5 32c997    ld      ($97c9),a
13f8 3a0b98    ld      a,($980b)
13fb 32f397    ld      ($97f3),a
13fe 2a8b97    ld      hl,($978b)
1401 228d97    ld      ($978d),hl
1404 2a2527    ld      hl,($2725)
1407 229597    ld      ($9795),hl
140a 3a2927    ld      a,($2729)
140d b7        or      a
140e ca1414    jp      z,$1414
1411 cd0811    call    $1108
1414 c9        ret     

1415 af        xor     a
1416 322927    ld      ($2729),a
1419 2a1f27    ld      hl,($271f)
141c 222727    ld      ($2727),hl
141f c32d13    jp      $132d
1422 224027    ld      ($2740),hl
1425 eb        ex      de,hl
1426 224227    ld      ($2742),hl
1429 3e02      ld      a,$02
142b 214427    ld      hl,$2744
142e cdbb80    call    $80bb
1431 2a4427    ld      hl,($2744)
1434 cd212f    call    $2f21
1437 324f27    ld      ($274f),a
143a b7        or      a
143b ca3f14    jp      z,$143f
143e c9        ret     

143f 2a4227    ld      hl,($2742)
1442 cd2c11    call    $112c
1445 210000    ld      hl,$0000
1448 224827    ld      ($2748),hl
144b 210002    ld      hl,$0200
144e eb        ex      de,hl
144f 2a8997    ld      hl,($9789)
1452 7b        ld      a,e
1453 95        sub     l
1454 6f        ld      l,a
1455 7a        ld      a,d
1456 9c        sbc     a,h
1457 67        ld      h,a
1458 224a27    ld      ($274a),hl
145b 2a4a27    ld      hl,($274a)
145e eb        ex      de,hl
145f 2a4827    ld      hl,($2748)
1462 19        add     hl,de
1463 225027    ld      ($2750),hl
1466 2a4427    ld      hl,($2744)
1469 eb        ex      de,hl
146a 215027    ld      hl,$2750
146d cd722e    call    $2e72
1470 324f27    ld      ($274f),a
1473 b7        or      a
1474 ca8b14    jp      z,$148b
1477 2a4427    ld      hl,($2744)
147a 7e        ld      a,(hl)
147b 23        inc     hl
147c 66        ld      h,(hl)
147d 6f        ld      l,a
147e eb        ex      de,hl
147f 2a4827    ld      hl,($2748)
1482 7b        ld      a,e
1483 95        sub     l
1484 6f        ld      l,a
1485 7a        ld      a,d
1486 9c        sbc     a,h
1487 67        ld      h,a
1488 224a27    ld      ($274a),hl
148b 2a4627    ld      hl,($2746)
148e 7e        ld      a,(hl)
148f 6f        ld      l,a
1490 17        rla     
1491 9f        sbc     a,a
1492 67        ld      h,a
1493 cd547e    call    $7e54
1496 02        ld      (bc),a
1497 9b        sbc     a,e
1498 14        inc     d
1499 e2142a    jp      po,$2a14
149c 48        ld      c,b
149d 27        daa     
149e eb        ex      de,hl
149f 2a4027    ld      hl,($2740)
14a2 19        add     hl,de
14a3 225027    ld      ($2750),hl
14a6 114a27    ld      de,$274a
14a9 2a5027    ld      hl,($2750)
14ac cdbd11    call    $11bd
14af 2a4a27    ld      hl,($274a)
14b2 eb        ex      de,hl
14b3 2a4827    ld      hl,($2748)
14b6 19        add     hl,de
14b7 224827    ld      ($2748),hl
14ba 2a4427    ld      hl,($2744)
14bd eb        ex      de,hl
14be 214827    ld      hl,$2748
14c1 cd322e    call    $2e32
14c4 324f27    ld      ($274f),a
14c7 b7        or      a
14c8 cacc14    jp      z,$14cc
14cb c9        ret     

14cc 210000    ld      hl,$0000
14cf 228997    ld      ($9789),hl
14d2 2a8b97    ld      hl,($978b)
14d5 23        inc     hl
14d6 228b97    ld      ($978b),hl
14d9 210002    ld      hl,$0200
14dc 224a27    ld      ($274a),hl
14df c35b14    jp      $145b
14e2 2a4827    ld      hl,($2748)
14e5 eb        ex      de,hl
14e6 2a4027    ld      hl,($2740)
14e9 19        add     hl,de
14ea 225027    ld      ($2750),hl
14ed 114a27    ld      de,$274a
14f0 2a5027    ld      hl,($2750)
14f3 cdf311    call    $11f3
14f6 c3af14    jp      $14af
14f9 225327    ld      ($2753),hl
14fc eb        ex      de,hl
14fd 225527    ld      ($2755),hl
1500 60        ld      h,b
1501 69        ld      l,c
1502 225727    ld      ($2757),hl
1505 2a5727    ld      hl,($2757)
1508 225927    ld      ($2759),hl
150b 015927    ld      bc,$2759
150e 2a5527    ld      hl,($2755)
1511 eb        ex      de,hl
1512 2a5327    ld      hl,($2753)
1515 cd2214    call    $1422
1518 c9        ret     

1519 010022    ld      bc,$2200
151c 5e        ld      e,(hl)
151d 27        daa     
151e eb        ex      de,hl
151f 226027    ld      ($2760),hl
1522 60        ld      h,b
1523 69        ld      l,c
1524 226227    ld      ($2762),hl
1527 2a6227    ld      hl,($2762)
152a 226427    ld      ($2764),hl
152d 016427    ld      bc,$2764
1530 2a6027    ld      hl,($2760)
1533 eb        ex      de,hl
1534 2a5e27    ld      hl,($275e)
1537 cd2214    call    $1422
153a c9        ret     

153b 02        ld      (bc),a
153c 00        nop     
153d 227127    ld      ($2771),hl
1540 216927    ld      hl,$2769
1543 cd8873    call    $7388
1546 3a6927    ld      a,($2769)
1549 2f        cpl     
154a 327427    ld      ($2774),a
154d b7        or      a
154e c25f15    jp      nz,$155f
1551 2a7127    ld      hl,($2771)
1554 cd8f73    call    $738f
1557 af        xor     a
1558 320998    ld      ($9809),a
155b 3a6927    ld      a,($2769)
155e c9        ret     

155f 2a7127    ld      hl,($2771)
1562 cd280f    call    $0f28
1565 326927    ld      ($2769),a
1568 c9        ret     

1569 117597    ld      de,$9775
156c 217627    ld      hl,$2776
156f cd1839    call    $3918
1572 3a1298    ld      a,($9812)
1575 320b98    ld      ($980b),a
1578 018515    ld      bc,$1585
157b 117627    ld      de,$2776
157e 211798    ld      hl,$9817
1581 cd1b15    call    $151b
1584 c9        ret     

1585 04        inc     b
1586 00        nop     
1587 3e42      ld      a,$42
1589 329f99    ld      ($999f),a
158c 3e02      ld      a,$02
158e 32d698    ld      ($98d6),a
1591 c9        ret     

1592 cd3736    call    $3637
1595 2a7597    ld      hl,($9775)
1598 11eaff    ld      de,$ffea
159b 19        add     hl,de
159c 227597    ld      ($9775),hl
159f cd9532    call    $3295
15a2 cd5d36    call    $365d
15a5 cd9939    call    $3999
15a8 c9        ret     

15a9 227c27    ld      ($277c),hl
15ac 3ad698    ld      a,($98d6)
15af d616      sub     $16
15b1 d601      sub     $01
15b3 9f        sbc     a,a
15b4 327e27    ld      ($277e),a
15b7 b7        or      a
15b8 cafb15    jp      z,$15fb
15bb 3ad297    ld      a,($97d2)
15be 327e27    ld      ($277e),a
15c1 114999    ld      de,$9949
15c4 6f        ld      l,a
15c5 17        rla     
15c6 9f        sbc     a,a
15c7 67        ld      h,a
15c8 19        add     hl,de
15c9 227f27    ld      ($277f),hl
15cc 3a7e27    ld      a,($277e)
15cf 114899    ld      de,$9948
15d2 6f        ld      l,a
15d3 17        rla     
15d4 9f        sbc     a,a
15d5 67        ld      h,a
15d6 19        add     hl,de
15d7 228127    ld      ($2781),hl
15da 215000    ld      hl,$0050
15dd eb        ex      de,hl
15de 3ad297    ld      a,($97d2)
15e1 6f        ld      l,a
15e2 17        rla     
15e3 9f        sbc     a,a
15e4 67        ld      h,a
15e5 7b        ld      a,e
15e6 95        sub     l
15e7 6f        ld      l,a
15e8 7a        ld      a,d
15e9 9c        sbc     a,h
15ea 67        ld      h,a
15eb 228327    ld      ($2783),hl
15ee 018327    ld      bc,$2783
15f1 2a8127    ld      hl,($2781)
15f4 eb        ex      de,hl
15f5 2a7f27    ld      hl,($277f)
15f8 cd7a3a    call    $3a7a
15fb 3ad297    ld      a,($97d2)
15fe 114899    ld      de,$9948
1601 6f        ld      l,a
1602 17        rla     
1603 9f        sbc     a,a
1604 67        ld      h,a
1605 19        add     hl,de
1606 227f27    ld      ($277f),hl
1609 2a7c27    ld      hl,($277c)
160c 7e        ld      a,(hl)
160d 2a7f27    ld      hl,($277f)
1610 77        ld      (hl),a
1611 cd7c17    call    $177c
1614 cd1602    call    $0216
1617 c9        ret     

1618 3ad297    ld      a,($97d2)
161b 328627    ld      ($2786),a
161e 114899    ld      de,$9948
1621 6f        ld      l,a
1622 17        rla     
1623 9f        sbc     a,a
1624 67        ld      h,a
1625 19        add     hl,de
1626 228727    ld      ($2787),hl
1629 3a8627    ld      a,($2786)
162c 114999    ld      de,$9949
162f 6f        ld      l,a
1630 17        rla     
1631 9f        sbc     a,a
1632 67        ld      h,a
1633 19        add     hl,de
1634 228927    ld      ($2789),hl
1637 215000    ld      hl,$0050
163a eb        ex      de,hl
163b 3ad297    ld      a,($97d2)
163e 6f        ld      l,a
163f 17        rla     
1640 9f        sbc     a,a
1641 67        ld      h,a
1642 7b        ld      a,e
1643 95        sub     l
1644 6f        ld      l,a
1645 7a        ld      a,d
1646 9c        sbc     a,h
1647 67        ld      h,a
1648 228b27    ld      ($278b),hl
164b 018b27    ld      bc,$278b
164e 2a8927    ld      hl,($2789)
1651 eb        ex      de,hl
1652 2a8727    ld      hl,($2787)
1655 cd573a    call    $3a57
1658 3e20      ld      a,$20
165a 329899    ld      ($9998),a
165d cd1602    call    $0216
1660 c9        ret     

1661 217597    ld      hl,$9775
1664 cdfd36    call    $36fd
1667 d650      sub     $50
1669 3d        dec     a
166a d67f      sub     $7f
166c 9f        sbc     a,a
166d 328f27    ld      ($278f),a
1670 b7        or      a
1671 ca7b16    jp      z,$167b
1674 3ad397    ld      a,($97d3)
1677 3c        inc     a
1678 32d397    ld      ($97d3),a
167b 3ad397    ld      a,($97d3)
167e d616      sub     $16
1680 17        rla     
1681 3f        ccf     
1682 9f        sbc     a,a
1683 328f27    ld      ($278f),a
1686 b7        or      a
1687 c29f16    jp      nz,$169f
168a 3ad397    ld      a,($97d3)
168d 3c        inc     a
168e 32d397    ld      ($97d3),a
1691 2a7597    ld      hl,($9775)
1694 23        inc     hl
1695 227597    ld      ($9775),hl
1698 cd5d36    call    $365d
169b cd9939    call    $3999
169e c9        ret     

169f cd8819    call    $1988
16a2 3e16      ld      a,$16
16a4 32d397    ld      ($97d3),a
16a7 c39116    jp      $1691
16aa 2a7597    ld      hl,($9775)
16ad 111600    ld      de,$0016
16b0 19        add     hl,de
16b1 227597    ld      ($9775),hl
16b4 cd9532    call    $3295
16b7 cd5d36    call    $365d
16ba cd9939    call    $3999
16bd c9        ret     

16be 3e56      ld      a,$56
16c0 329f99    ld      ($999f),a
16c3 3e16      ld      a,$16
16c5 32d698    ld      ($98d6),a
16c8 c9        ret     

16c9 229b27    ld      ($279b),hl
16cc 2a9b27    ld      hl,($279b)
16cf 7e        ld      a,(hl)
16d0 6f        ld      l,a
16d1 17        rla     
16d2 9f        sbc     a,a
16d3 67        ld      h,a
16d4 eb        ex      de,hl
16d5 210800    ld      hl,$0008
16d8 cd777e    call    $7e77
16db 7d        ld      a,l
16dc 329d27    ld      ($279d),a
16df 6f        ld      l,a
16e0 17        rla     
16e1 9f        sbc     a,a
16e2 67        ld      h,a
16e3 29        add     hl,hl
16e4 29        add     hl,hl
16e5 29        add     hl,hl
16e6 7d        ld      a,l
16e7 329d27    ld      ($279d),a
16ea 2a9b27    ld      hl,($279b)
16ed 7e        ld      a,(hl)
16ee 219d27    ld      hl,$279d
16f1 96        sub     (hl)
16f2 3d        dec     a
16f3 d601      sub     $01
16f5 9f        sbc     a,a
16f6 329327    ld      ($2793),a
16f9 c9        ret     

16fa 22a727    ld      ($27a7),hl
16fd 2aa727    ld      hl,($27a7)
1700 cdbc01    call    $01bc
1703 329f27    ld      ($279f),a
1706 c9        ret     

1707 3ad297    ld      a,($97d2)
170a 3d        dec     a
170b 3d        dec     a
170c d67f      sub     $7f
170e 9f        sbc     a,a
170f 32ab27    ld      ($27ab),a
1712 b7        or      a
1713 ca1d17    jp      z,$171d
1716 3ad297    ld      a,($97d2)
1719 3d        dec     a
171a 32d297    ld      ($97d2),a
171d c9        ret     

171e 22b527    ld      ($27b5),hl
1721 2ab527    ld      hl,($27b5)
1724 cdbc01    call    $01bc
1727 32ad27    ld      ($27ad),a
172a c9        ret     

172b 213e17    ld      hl,$173e
172e cdbb73    call    $73bb
1731 2a7597    ld      hl,($9775)
1734 227797    ld      ($9777),hl
1737 3ad297    ld      a,($97d2)
173a 32d497    ld      ($97d4),a
173d c9        ret     

173e 07        rlca    
173f 00        nop     
1740 00        nop     
1741 00        nop     
1742 3e4e      ld      a,$4e
1744 329f99    ld      ($999f),a
1747 3e0e      ld      a,$0e
1749 32d698    ld      ($98d6),a
174c c9        ret     

174d 015d17    ld      bc,$175d
1750 11399a    ld      de,$9a39
1753 214999    ld      hl,$9949
1756 cd573a    call    $3a57
1759 cd1602    call    $0216
175c c9        ret     

175d 50        ld      d,b
175e 00        nop     
175f 00        nop     
1760 00        nop     
1761 3ad698    ld      a,($98d6)
1764 d602      sub     $02
1766 d601      sub     $01
1768 9f        sbc     a,a
1769 32bc27    ld      ($27bc),a
176c b7        or      a
176d ca7317    jp      z,$1773
1770 cd2601    call    $0126
1773 cd6116    call    $1661
1776 3e01      ld      a,$01
1778 32d297    ld      ($97d2),a
177b c9        ret     

177c 3ad297    ld      a,($97d2)
177f d650      sub     $50
1781 17        rla     
1782 9f        sbc     a,a
1783 32be27    ld      ($27be),a
1786 b7        or      a
1787 ca9117    jp      z,$1791
178a 3ad297    ld      a,($97d2)
178d 3c        inc     a
178e 32d297    ld      ($97d2),a
1791 c9        ret     

1792 22c027    ld      ($27c0),hl
1795 eb        ex      de,hl
1796 22c227    ld      ($27c2),hl
1799 af        xor     a
179a 2ac227    ld      hl,($27c2)
179d 77        ld      (hl),a
179e 3e01      ld      a,$01
17a0 32c427    ld      ($27c4),a
17a3 3ac427    ld      a,($27c4)
17a6 11d797    ld      de,$97d7
17a9 6f        ld      l,a
17aa 17        rla     
17ab 9f        sbc     a,a
17ac 67        ld      h,a
17ad 19        add     hl,de
17ae 22c527    ld      ($27c5),hl
17b1 2ac027    ld      hl,($27c0)
17b4 7e        ld      a,(hl)
17b5 2ac527    ld      hl,($27c5)
17b8 96        sub     (hl)
17b9 d601      sub     $01
17bb 9f        sbc     a,a
17bc 32c727    ld      ($27c7),a
17bf b7        or      a
17c0 c2e317    jp      nz,$17e3
17c3 3ac427    ld      a,($27c4)
17c6 3c        inc     a
17c7 fe16      cp      $16
17c9 faa017    jp      m,$17a0
17cc 2ac027    ld      hl,($27c0)
17cf 7e        ld      a,(hl)
17d0 d620      sub     $20
17d2 17        rla     
17d3 9f        sbc     a,a
17d4 32c727    ld      ($27c7),a
17d7 b7        or      a
17d8 cadc17    jp      z,$17dc
17db c9        ret     

17dc 2ac027    ld      hl,($27c0)
17df cda915    call    $15a9
17e2 c9        ret     

17e3 3ac427    ld      a,($27c4)
17e6 6f        ld      l,a
17e7 17        rla     
17e8 9f        sbc     a,a
17e9 67        ld      h,a
17ea cd547e    call    $7e54
17ed 14        inc     d
17ee 1618      ld      d,$18
17f0 1d        dec     e
17f1 1819      jr      $180c
17f3 1821      jr      $1816
17f5 1825      jr      $181c
17f7 1829      jr      $1822
17f9 182d      jr      $1828
17fb 1831      jr      $182e
17fd 1835      jr      $1834
17ff 1839      jr      $183a
1801 183d      jr      $1840
1803 1841      jr      $1846
1805 1845      jr      $184c
1807 1849      jr      $1852
1809 184d      jr      $1858
180b 1851      jr      $185e
180d 185c      jr      $186b
180f 1860      jr      $1871
1811 1864      jr      $1877
1813 186b      jr      $1880
1815 18cd      jr      $17e4
1817 07        rlca    
1818 17        rla     
1819 cd1816    call    $1618
181c c9        ret     

181d cd4f23    call    $234f
1820 c9        ret     

1821 cd0717    call    $1707
1824 c9        ret     

1825 cd7c17    call    $177c
1828 c9        ret     

1829 cd1519    call    $1915
182c c9        ret     

182d cd6116    call    $1661
1830 c9        ret     

1831 cdbe16    call    $16be
1834 c9        ret     

1835 cd4217    call    $1742
1838 c9        ret     

1839 cd2b17    call    $172b
183c c9        ret     

183d cd4d17    call    $174d
1840 c9        ret     

1841 cda518    call    $18a5
1844 c9        ret     

1845 cdaa16    call    $16aa
1848 c9        ret     

1849 cd9215    call    $1592
184c c9        ret     

184d cd8715    call    $1587
1850 c9        ret     

1851 2ac227    ld      hl,($27c2)
1854 eb        ex      de,hl
1855 217b18    ld      hl,$187b
1858 cde51b    call    $1be5
185b c9        ret     

185c cd7d18    call    $187d
185f c9        ret     

1860 cd6117    call    $1761
1863 c9        ret     

1864 cde103    call    $03e1
1867 cd3736    call    $3637
186a c9        ret     

186b 2a7597    ld      hl,($9775)
186e 227b97    ld      ($977b),hl
1871 cd3736    call    $3637
1874 3e01      ld      a,$01
1876 2ac227    ld      hl,($27c2)
1879 77        ld      (hl),a
187a c9        ret     

187b ff        rst     $38
187c ff        rst     $38
187d 3ad297    ld      a,($97d2)
1880 d650      sub     $50
1882 17        rla     
1883 3f        ccf     
1884 9f        sbc     a,a
1885 32ca27    ld      ($27ca),a
1888 b7        or      a
1889 ca8d18    jp      z,$188d
188c c9        ret     

188d 3ad297    ld      a,($97d2)
1890 3c        inc     a
1891 32d297    ld      ($97d2),a
1894 21d297    ld      hl,$97d2
1897 cdfa16    call    $16fa
189a 32ca27    ld      ($27ca),a
189d b7        or      a
189e caa218    jp      z,$18a2
18a1 c9        ret     

18a2 c37d18    jp      $187d
18a5 210100    ld      hl,$0001
18a8 eb        ex      de,hl
18a9 3ad397    ld      a,($97d3)
18ac 6f        ld      l,a
18ad 17        rla     
18ae 9f        sbc     a,a
18af 67        ld      h,a
18b0 7b        ld      a,e
18b1 95        sub     l
18b2 6f        ld      l,a
18b3 7a        ld      a,d
18b4 9c        sbc     a,h
18b5 67        ld      h,a
18b6 eb        ex      de,hl
18b7 2a7597    ld      hl,($9775)
18ba 19        add     hl,de
18bb 22cd27    ld      ($27cd),hl
18be 117597    ld      de,$9775
18c1 217797    ld      hl,$9777
18c4 cde830    call    $30e8
18c7 11d297    ld      de,$97d2
18ca 21d497    ld      hl,$97d4
18cd cd1231    call    $3112
18d0 2a7597    ld      hl,($9775)
18d3 23        inc     hl
18d4 eb        ex      de,hl
18d5 2acd27    ld      hl,($27cd)
18d8 7b        ld      a,e
18d9 95        sub     l
18da 6f        ld      l,a
18db 7a        ld      a,d
18dc 9c        sbc     a,h
18dd 67        ld      h,a
18de 7d        ld      a,l
18df 32cc27    ld      ($27cc),a
18e2 d616      sub     $16
18e4 3d        dec     a
18e5 c681      add     a,$81
18e7 9f        sbc     a,a
18e8 32cf27    ld      ($27cf),a
18eb 3acc27    ld      a,($27cc)
18ee 3d        dec     a
18ef 17        rla     
18f0 3f        ccf     
18f1 9f        sbc     a,a
18f2 21cf27    ld      hl,$27cf
18f5 a6        and     (hl)
18f6 32d027    ld      ($27d0),a
18f9 b7        or      a
18fa c20c19    jp      nz,$190c
18fd 3e01      ld      a,$01
18ff 32d397    ld      ($97d3),a
1902 cd9532    call    $3295
1905 cd5d36    call    $365d
1908 cd9939    call    $3999
190b c9        ret     

190c 3acc27    ld      a,($27cc)
190f 32d397    ld      ($97d3),a
1912 c30219    jp      $1902
1915 3ad397    ld      a,($97d3)
1918 3d        dec     a
1919 3d        dec     a
191a d67f      sub     $7f
191c 9f        sbc     a,a
191d 32d427    ld      ($27d4),a
1920 b7        or      a
1921 c24e19    jp      nz,$194e
1924 cd3736    call    $3637
1927 2a7597    ld      hl,($9775)
192a 2b        dec     hl
192b 227597    ld      ($9775),hl
192e 217597    ld      hl,$9775
1931 cd212f    call    $2f21
1934 32d427    ld      ($27d4),a
1937 b7        or      a
1938 c24219    jp      nz,$1942
193b cd5d36    call    $365d
193e cd9939    call    $3999
1941 c9        ret     

1942 cd2601    call    $0126
1945 210100    ld      hl,$0001
1948 227597    ld      ($9775),hl
194b c33b19    jp      $193b
194e 3ad397    ld      a,($97d3)
1951 3d        dec     a
1952 32d397    ld      ($97d3),a
1955 2a7597    ld      hl,($9775)
1958 2b        dec     hl
1959 227597    ld      ($9775),hl
195c 3ad397    ld      a,($97d3)
195f 3d        dec     a
1960 3d        dec     a
1961 d67f      sub     $7f
1963 9f        sbc     a,a
1964 32d427    ld      ($27d4),a
1967 217597    ld      hl,$9775
196a cdfd36    call    $36fd
196d d650      sub     $50
196f 3d        dec     a
1970 d67f      sub     $7f
1972 9f        sbc     a,a
1973 21d427    ld      hl,$27d4
1976 a6        and     (hl)
1977 32d527    ld      ($27d5),a
197a b7        or      a
197b ca8519    jp      z,$1985
197e 3ad397    ld      a,($97d3)
1981 3d        dec     a
1982 32d397    ld      ($97d3),a
1985 c33b19    jp      $193b
1988 01b919    ld      bc,$19b9
198b 11d99a    ld      de,$9ad9
198e 21899a    ld      hl,$9a89
1991 cd383a    call    $3a38
1994 11b119    ld      de,$19b1
1997 21b9a1    ld      hl,$a1b9
199a cda33a    call    $3aa3
199d 11ad19    ld      de,$19ad
19a0 21b519    ld      hl,$19b5
19a3 cdb839    call    $39b8
19a6 21bd19    ld      hl,$19bd
19a9 cdbb73    call    $73bb
19ac c9        ret     

19ad 010000    ld      bc,$0000
19b0 00        nop     
19b1 50        ld      d,b
19b2 00        nop     
19b3 00        nop     
19b4 00        nop     
19b5 1800      jr      $19b7
19b7 00        nop     
19b8 00        nop     
19b9 3007      jr      nc,$19c2
19bb 00        nop     
19bc 00        nop     
19bd 0a        ld      a,(bc)
19be 00        nop     
19bf 00        nop     
19c0 00        nop     
19c1 af        xor     a
19c2 32ed97    ld      ($97ed),a
19c5 af        xor     a
19c6 32ee97    ld      ($97ee),a
19c9 af        xor     a
19ca 32f197    ld      ($97f1),a
19cd af        xor     a
19ce 32d697    ld      ($97d6),a
19d1 3e01      ld      a,$01
19d3 32f297    ld      ($97f2),a
19d6 21e999    ld      hl,$99e9
19d9 cdde2e    call    $2ede
19dc 32de27    ld      ($27de),a
19df af        xor     a
19e0 32d797    ld      ($97d7),a
19e3 210000    ld      hl,$0000
19e6 227d97    ld      ($977d),hl
19e9 3ade27    ld      a,($27de)
19ec d601      sub     $01
19ee 9f        sbc     a,a
19ef 32e227    ld      ($27e2),a
19f2 b7        or      a
19f3 caf719    jp      z,$19f7
19f6 c9        ret     

19f7 3e01      ld      a,$01
19f9 32df27    ld      ($27df),a
19fc 11df27    ld      de,$27df
19ff 217d97    ld      hl,$977d
1a02 cd2b1d    call    $1d2b
1a05 11df27    ld      de,$27df
1a08 21e999    ld      hl,$99e9
1a0b cda630    call    $30a6
1a0e 3adf27    ld      a,($27df)
1a11 21de27    ld      hl,$27de
1a14 96        sub     (hl)
1a15 3d        dec     a
1a16 d67f      sub     $7f
1a18 9f        sbc     a,a
1a19 32e227    ld      ($27e2),a
1a1c b7        or      a
1a1d ca211a    jp      z,$1a21
1a20 c9        ret     

1a21 3adf27    ld      a,($27df)
1a24 32e227    ld      ($27e2),a
1a27 11e899    ld      de,$99e8
1a2a 6f        ld      l,a
1a2b 17        rla     
1a2c 9f        sbc     a,a
1a2d 67        ld      h,a
1a2e 19        add     hl,de
1a2f 7e        ld      a,(hl)
1a30 32da27    ld      ($27da),a
1a33 3ae227    ld      a,($27e2)
1a36 11e999    ld      de,$99e9
1a39 6f        ld      l,a
1a3a 17        rla     
1a3b 9f        sbc     a,a
1a3c 67        ld      h,a
1a3d 19        add     hl,de
1a3e 7e        ld      a,(hl)
1a3f 32db27    ld      ($27db),a
1a42 21da27    ld      hl,$27da
1a45 cd3031    call    $3130
1a48 21db27    ld      hl,$27db
1a4b cd3031    call    $3130
1a4e 3e01      ld      a,$01
1a50 32e027    ld      ($27e0),a
1a53 3ae027    ld      a,($27e0)
1a56 6f        ld      l,a
1a57 17        rla     
1a58 9f        sbc     a,a
1a59 67        ld      h,a
1a5a 29        add     hl,hl
1a5b 22e327    ld      ($27e3),hl
1a5e 11d598    ld      de,$98d5
1a61 19        add     hl,de
1a62 22e527    ld      ($27e5),hl
1a65 2ae327    ld      hl,($27e3)
1a68 11d698    ld      de,$98d6
1a6b 19        add     hl,de
1a6c 22e727    ld      ($27e7),hl
1a6f 3adb27    ld      a,($27db)
1a72 2ae727    ld      hl,($27e7)
1a75 96        sub     (hl)
1a76 d601      sub     $01
1a78 9f        sbc     a,a
1a79 32e227    ld      ($27e2),a
1a7c 3ada27    ld      a,($27da)
1a7f 2ae527    ld      hl,($27e5)
1a82 96        sub     (hl)
1a83 d601      sub     $01
1a85 9f        sbc     a,a
1a86 21e227    ld      hl,$27e2
1a89 a6        and     (hl)
1a8a 32e927    ld      ($27e9),a
1a8d b7        or      a
1a8e c2a01a    jp      nz,$1aa0
1a91 3ae027    ld      a,($27e0)
1a94 3c        inc     a
1a95 fe12      cp      $12
1a97 fa501a    jp      m,$1a50
1a9a 3eff      ld      a,$ff
1a9c 32d797    ld      ($97d7),a
1a9f c9        ret     

1aa0 3ae027    ld      a,($27e0)
1aa3 32d797    ld      ($97d7),a
1aa6 3adf27    ld      a,($27df)
1aa9 c602      add     a,$02
1aab 32df27    ld      ($27df),a
1aae 32f297    ld      ($97f2),a
1ab1 3adf27    ld      a,($27df)
1ab4 32e027    ld      ($27e0),a
1ab7 11e027    ld      de,$27e0
1aba 21e999    ld      hl,$99e9
1abd cda630    call    $30a6
1ac0 3ae027    ld      a,($27e0)
1ac3 d650      sub     $50
1ac5 17        rla     
1ac6 3f        ccf     
1ac7 9f        sbc     a,a
1ac8 32e227    ld      ($27e2),a
1acb b7        or      a
1acc c2901b    jp      nz,$1b90
1acf 3adf27    ld      a,($27df)
1ad2 32f297    ld      ($97f2),a
1ad5 210100    ld      hl,$0001
1ad8 eb        ex      de,hl
1ad9 3af297    ld      a,($97f2)
1adc 6f        ld      l,a
1add 17        rla     
1ade 9f        sbc     a,a
1adf 67        ld      h,a
1ae0 7b        ld      a,e
1ae1 95        sub     l
1ae2 6f        ld      l,a
1ae3 7a        ld      a,d
1ae4 9c        sbc     a,h
1ae5 67        ld      h,a
1ae6 eb        ex      de,hl
1ae7 3ade27    ld      a,($27de)
1aea 6f        ld      l,a
1aeb 17        rla     
1aec 9f        sbc     a,a
1aed 67        ld      h,a
1aee 19        add     hl,de
1aef 7d        ld      a,l
1af0 32f197    ld      ($97f1),a
1af3 3adf27    ld      a,($27df)
1af6 11e899    ld      de,$99e8
1af9 6f        ld      l,a
1afa 17        rla     
1afb 9f        sbc     a,a
1afc 67        ld      h,a
1afd 19        add     hl,de
1afe 7e        ld      a,(hl)
1aff 32dc27    ld      ($27dc),a
1b02 3adf27    ld      a,($27df)
1b05 3c        inc     a
1b06 32df27    ld      ($27df),a
1b09 32ef97    ld      ($97ef),a
1b0c 3adf27    ld      a,($27df)
1b0f 21de27    ld      hl,$27de
1b12 96        sub     (hl)
1b13 3d        dec     a
1b14 d67f      sub     $7f
1b16 9f        sbc     a,a
1b17 32e227    ld      ($27e2),a
1b1a b7        or      a
1b1b c2901b    jp      nz,$1b90
1b1e 3adf27    ld      a,($27df)
1b21 11e899    ld      de,$99e8
1b24 6f        ld      l,a
1b25 17        rla     
1b26 9f        sbc     a,a
1b27 67        ld      h,a
1b28 19        add     hl,de
1b29 7e        ld      a,(hl)
1b2a 21dc27    ld      hl,$27dc
1b2d 96        sub     (hl)
1b2e d601      sub     $01
1b30 9f        sbc     a,a
1b31 32e227    ld      ($27e2),a
1b34 b7        or      a
1b35 c2491b    jp      nz,$1b49
1b38 3aed97    ld      a,($97ed)
1b3b 3c        inc     a
1b3c 32ed97    ld      ($97ed),a
1b3f 3adf27    ld      a,($27df)
1b42 3c        inc     a
1b43 32df27    ld      ($27df),a
1b46 c30c1b    jp      $1b0c
1b49 3adf27    ld      a,($27df)
1b4c 3c        inc     a
1b4d 32df27    ld      ($27df),a
1b50 32f097    ld      ($97f0),a
1b53 3adf27    ld      a,($27df)
1b56 21de27    ld      hl,$27de
1b59 96        sub     (hl)
1b5a 3d        dec     a
1b5b d67f      sub     $7f
1b5d 9f        sbc     a,a
1b5e 32e227    ld      ($27e2),a
1b61 b7        or      a
1b62 c2901b    jp      nz,$1b90
1b65 3adf27    ld      a,($27df)
1b68 11e899    ld      de,$99e8
1b6b 6f        ld      l,a
1b6c 17        rla     
1b6d 9f        sbc     a,a
1b6e 67        ld      h,a
1b6f 19        add     hl,de
1b70 7e        ld      a,(hl)
1b71 21dc27    ld      hl,$27dc
1b74 96        sub     (hl)
1b75 d601      sub     $01
1b77 9f        sbc     a,a
1b78 32e227    ld      ($27e2),a
1b7b b7        or      a
1b7c c2901b    jp      nz,$1b90
1b7f 3aee97    ld      a,($97ee)
1b82 3c        inc     a
1b83 32ee97    ld      ($97ee),a
1b86 3adf27    ld      a,($27df)
1b89 3c        inc     a
1b8a 32df27    ld      ($27df),a
1b8d c3531b    jp      $1b53
1b90 c9        ret     

1b91 22eb27    ld      ($27eb),hl
1b94 cd9201    call    $0192
1b97 cd5d36    call    $365d
1b9a cd9f30    call    $309f
1b9d 2aeb27    ld      hl,($27eb)
1ba0 eb        ex      de,hl
1ba1 21a81b    ld      hl,$1ba8
1ba4 cde51b    call    $1be5
1ba7 c9        ret     

1ba8 00        nop     
1ba9 00        nop     
1baa 2a7597    ld      hl,($9775)
1bad 22ee27    ld      ($27ee),hl
1bb0 2a7797    ld      hl,($9777)
1bb3 22f027    ld      ($27f0),hl
1bb6 11f027    ld      de,$27f0
1bb9 21ee27    ld      hl,$27ee
1bbc cd722e    call    $2e72
1bbf 32f527    ld      ($27f5),a
1bc2 b7        or      a
1bc3 cacf1b    jp      z,$1bcf
1bc6 11f027    ld      de,$27f0
1bc9 21ee27    ld      hl,$27ee
1bcc cde830    call    $30e8
1bcf 2aee27    ld      hl,($27ee)
1bd2 227597    ld      ($9775),hl
1bd5 11f027    ld      de,$27f0
1bd8 21ee27    ld      hl,$27ee
1bdb cd5923    call    $2359
1bde cd9532    call    $3295
1be1 cd5d36    call    $365d
1be4 c9        ret     

1be5 22f727    ld      ($27f7),hl
1be8 eb        ex      de,hl
1be9 22f927    ld      ($27f9),hl
1bec af        xor     a
1bed 2af927    ld      hl,($27f9)
1bf0 77        ld      (hl),a
1bf1 cdc119    call    $19c1
1bf4 3ad797    ld      a,($97d7)
1bf7 d601      sub     $01
1bf9 9f        sbc     a,a
1bfa 320728    ld      ($2807),a
1bfd b7        or      a
1bfe c20e1d    jp      nz,$1d0e
1c01 3ad797    ld      a,($97d7)
1c04 17        rla     
1c05 9f        sbc     a,a
1c06 320728    ld      ($2807),a
1c09 b7        or      a
1c0a c2201d    jp      nz,$1d20
1c0d 3ad797    ld      a,($97d7)
1c10 6f        ld      l,a
1c11 17        rla     
1c12 9f        sbc     a,a
1c13 67        ld      h,a
1c14 cd547e    call    $7e54
1c17 113a1c    ld      de,$1c3a
1c1a 42        ld      b,d
1c1b 1c        inc     e
1c1c 46        ld      b,(hl)
1c1d 1c        inc     e
1c1e 4e        ld      c,(hl)
1c1f 1c        inc     e
1c20 55        ld      d,l
1c21 1c        inc     e
1c22 59        ld      e,c
1c23 1c        inc     e
1c24 5d        ld      e,l
1c25 1c        inc     e
1c26 6a        ld      l,d
1c27 1c        inc     e
1c28 77        ld      (hl),a
1c29 1c        inc     e
1c2a 84        add     a,h
1c2b 1c        inc     e
1c2c ae        xor     (hl)
1c2d 1c        inc     e
1c2e b2        or      d
1c2f 1c        inc     e
1c30 c41cc8    call    nz,$c81c
1c33 1c        inc     e
1c34 d21cd6    jp      nc,$d61c
1c37 1c        inc     e
1c38 ec1ccd    call    pe,$cd1c
1c3b 3a02af    ld      a,($af02)
1c3e 32cd97    ld      ($97cd),a
1c41 c9        ret     

1c42 cd811f    call    $1f81
1c45 c9        ret     

1c46 af        xor     a
1c47 32cd97    ld      ($97cd),a
1c4a cd7002    call    $0270
1c4d c9        ret     

1c4e 3e03      ld      a,$03
1c50 2af927    ld      hl,($27f9)
1c53 77        ld      (hl),a
1c54 c9        ret     

1c55 cda401    call    $01a4
1c58 c9        ret     

1c59 cdf801    call    $01f8
1c5c c9        ret     

1c5d 01271d    ld      bc,$1d27
1c60 11271d    ld      de,$1d27
1c63 21271d    ld      hl,$1d27
1c66 cd8c01    call    $018c
1c69 c9        ret     

1c6a 01291d    ld      bc,$1d29
1c6d 11291d    ld      de,$1d29
1c70 21271d    ld      hl,$1d27
1c73 cd8c01    call    $018c
1c76 c9        ret     

1c77 01271d    ld      bc,$1d27
1c7a 11291d    ld      de,$1d29
1c7d 21271d    ld      hl,$1d27
1c80 cd8c01    call    $018c
1c83 c9        ret     

1c84 3af197    ld      a,($97f1)
1c87 d601      sub     $01
1c89 9f        sbc     a,a
1c8a 320728    ld      ($2807),a
1c8d b7        or      a
1c8e ca921c    jp      z,$1c92
1c91 c9        ret     

1c92 11f297    ld      de,$97f2
1c95 21e999    ld      hl,$99e9
1c98 cda630    call    $30a6
1c9b 3af297    ld      a,($97f2)
1c9e 11e899    ld      de,$99e8
1ca1 6f        ld      l,a
1ca2 17        rla     
1ca3 9f        sbc     a,a
1ca4 67        ld      h,a
1ca5 19        add     hl,de
1ca6 7e        ld      a,(hl)
1ca7 328aa2    ld      ($a28a),a
1caa cde001    call    $01e0
1cad c9        ret     

1cae cdaa1b    call    $1baa
1cb1 c9        ret     

1cb2 2a7d97    ld      hl,($977d)
1cb5 227597    ld      ($9775),hl
1cb8 cd9532    call    $3295
1cbb cd5d36    call    $365d
1cbe 3e01      ld      a,$01
1cc0 32d397    ld      ($97d3),a
1cc3 c9        ret     

1cc4 cd7401    call    $0174
1cc7 c9        ret     

1cc8 cdc039    call    $39c0
1ccb 210828    ld      hl,$2808
1cce cda62f    call    $2fa6
1cd1 c9        ret     

1cd2 cd6201    call    $0162
1cd5 c9        ret     

1cd6 2a7997    ld      hl,($9779)
1cd9 227b97    ld      ($977b),hl
1cdc 210100    ld      hl,$0001
1cdf 227597    ld      ($9775),hl
1ce2 cd3736    call    $3637
1ce5 3e02      ld      a,$02
1ce7 2af927    ld      hl,($27f9)
1cea 77        ld      (hl),a
1ceb c9        ret     

1cec 2a7797    ld      hl,($9777)
1cef 227b97    ld      ($977b),hl
1cf2 117597    ld      de,$9775
1cf5 217b97    ld      hl,$977b
1cf8 cd682f    call    $2f68
1cfb 320728    ld      ($2807),a
1cfe b7        or      a
1cff ca0b1d    jp      z,$1d0b
1d02 117597    ld      de,$9775
1d05 217b97    ld      hl,$977b
1d08 cde830    call    $30e8
1d0b c3e21c    jp      $1ce2
1d0e 2a7d97    ld      hl,($977d)
1d11 eb        ex      de,hl
1d12 2a7597    ld      hl,($9775)
1d15 19        add     hl,de
1d16 227597    ld      ($9775),hl
1d19 cd5d36    call    $365d
1d1c cd9532    call    $3295
1d1f c9        ret     

1d20 211428    ld      hl,$2814
1d23 cda62f    call    $2fa6
1d26 c9        ret     

1d27 00        nop     
1d28 00        nop     
1d29 ff        rst     $38
1d2a ff        rst     $38
1d2b 222528    ld      ($2825),hl
1d2e eb        ex      de,hl
1d2f 222728    ld      ($2827),hl
1d32 21e999    ld      hl,$99e9
1d35 cdde2e    call    $2ede
1d38 322b28    ld      ($282b),a
1d3b 210000    ld      hl,$0000
1d3e eb        ex      de,hl
1d3f 2a2528    ld      hl,($2825)
1d42 73        ld      (hl),e
1d43 23        inc     hl
1d44 72        ld      (hl),d
1d45 3e01      ld      a,$01
1d47 322a28    ld      ($282a),a
1d4a 2a2728    ld      hl,($2827)
1d4d eb        ex      de,hl
1d4e 21e999    ld      hl,$99e9
1d51 cda630    call    $30a6
1d54 2a2728    ld      hl,($2827)
1d57 7e        ld      a,(hl)
1d58 11e899    ld      de,$99e8
1d5b 6f        ld      l,a
1d5c 17        rla     
1d5d 9f        sbc     a,a
1d5e 67        ld      h,a
1d5f 19        add     hl,de
1d60 7e        ld      a,(hl)
1d61 322928    ld      ($2829),a
1d64 d62d      sub     $2d
1d66 c6ff      add     a,$ff
1d68 9f        sbc     a,a
1d69 322e28    ld      ($282e),a
1d6c b7        or      a
1d6d c27e1d    jp      nz,$1d7e
1d70 3eff      ld      a,$ff
1d72 322a28    ld      ($282a),a
1d75 2a2728    ld      hl,($2827)
1d78 7e        ld      a,(hl)
1d79 3c        inc     a
1d7a 2a2728    ld      hl,($2827)
1d7d 77        ld      (hl),a
1d7e 2a2728    ld      hl,($2827)
1d81 7e        ld      a,(hl)
1d82 11e899    ld      de,$99e8
1d85 6f        ld      l,a
1d86 17        rla     
1d87 9f        sbc     a,a
1d88 67        ld      h,a
1d89 19        add     hl,de
1d8a 7e        ld      a,(hl)
1d8b 322928    ld      ($2829),a
1d8e d623      sub     $23
1d90 c6ff      add     a,$ff
1d92 9f        sbc     a,a
1d93 322e28    ld      ($282e),a
1d96 b7        or      a
1d97 c2b01d    jp      nz,$1db0
1d9a 21007d    ld      hl,$7d00
1d9d eb        ex      de,hl
1d9e 2a2528    ld      hl,($2825)
1da1 73        ld      (hl),e
1da2 23        inc     hl
1da3 72        ld      (hl),d
1da4 2a2728    ld      hl,($2827)
1da7 7e        ld      a,(hl)
1da8 3c        inc     a
1da9 2a2728    ld      hl,($2827)
1dac 77        ld      (hl),a
1dad c3161e    jp      $1e16
1db0 2a2728    ld      hl,($2827)
1db3 7e        ld      a,(hl)
1db4 11e899    ld      de,$99e8
1db7 6f        ld      l,a
1db8 17        rla     
1db9 9f        sbc     a,a
1dba 67        ld      h,a
1dbb 19        add     hl,de
1dbc 7e        ld      a,(hl)
1dbd 322928    ld      ($2829),a
1dc0 d639      sub     $39
1dc2 3d        dec     a
1dc3 d67f      sub     $7f
1dc5 9f        sbc     a,a
1dc6 322e28    ld      ($282e),a
1dc9 3a2928    ld      a,($2829)
1dcc d630      sub     $30
1dce 17        rla     
1dcf 9f        sbc     a,a
1dd0 212e28    ld      hl,$282e
1dd3 b6        or      (hl)
1dd4 322f28    ld      ($282f),a
1dd7 b7        or      a
1dd8 c2161e    jp      nz,$1e16
1ddb 2a2528    ld      hl,($2825)
1dde 7e        ld      a,(hl)
1ddf 23        inc     hl
1de0 66        ld      h,(hl)
1de1 6f        ld      l,a
1de2 eb        ex      de,hl
1de3 210a00    ld      hl,$000a
1de6 cdd37e    call    $7ed3
1de9 11d0ff    ld      de,$ffd0
1dec 19        add     hl,de
1ded eb        ex      de,hl
1dee 3a2928    ld      a,($2829)
1df1 6f        ld      l,a
1df2 17        rla     
1df3 9f        sbc     a,a
1df4 67        ld      h,a
1df5 19        add     hl,de
1df6 eb        ex      de,hl
1df7 2a2528    ld      hl,($2825)
1dfa 73        ld      (hl),e
1dfb 23        inc     hl
1dfc 72        ld      (hl),d
1dfd 2a2728    ld      hl,($2827)
1e00 7e        ld      a,(hl)
1e01 3c        inc     a
1e02 2a2728    ld      hl,($2827)
1e05 77        ld      (hl),a
1e06 7e        ld      a,(hl)
1e07 212b28    ld      hl,$282b
1e0a 96        sub     (hl)
1e0b 3d        dec     a
1e0c c681      add     a,$81
1e0e 9f        sbc     a,a
1e0f 322e28    ld      ($282e),a
1e12 b7        or      a
1e13 c2b01d    jp      nz,$1db0
1e16 3a2a28    ld      a,($282a)
1e19 3c        inc     a
1e1a d601      sub     $01
1e1c 9f        sbc     a,a
1e1d 322e28    ld      ($282e),a
1e20 2a2528    ld      hl,($2825)
1e23 cd202d    call    $2d20
1e26 212e28    ld      hl,$282e
1e29 a6        and     (hl)
1e2a 322f28    ld      ($282f),a
1e2d b7        or      a
1e2e ca3b1e    jp      z,$1e3b
1e31 210100    ld      hl,$0001
1e34 eb        ex      de,hl
1e35 2a2528    ld      hl,($2825)
1e38 73        ld      (hl),e
1e39 23        inc     hl
1e3a 72        ld      (hl),d
1e3b 3a2a28    ld      a,($282a)
1e3e 6f        ld      l,a
1e3f 17        rla     
1e40 9f        sbc     a,a
1e41 67        ld      h,a
1e42 eb        ex      de,hl
1e43 2a2528    ld      hl,($2825)
1e46 7e        ld      a,(hl)
1e47 23        inc     hl
1e48 66        ld      h,(hl)
1e49 6f        ld      l,a
1e4a cdd37e    call    $7ed3
1e4d eb        ex      de,hl
1e4e 2a2528    ld      hl,($2825)
1e51 73        ld      (hl),e
1e52 23        inc     hl
1e53 72        ld      (hl),d
1e54 c9        ret     

1e55 3ad397    ld      a,($97d3)
1e58 323328    ld      ($2833),a
1e5b 3ad297    ld      a,($97d2)
1e5e 323428    ld      ($2834),a
1e61 2a7597    ld      hl,($9775)
1e64 223728    ld      ($2837),hl
1e67 211800    ld      hl,$0018
1e6a eb        ex      de,hl
1e6b 3ad397    ld      a,($97d3)
1e6e 6f        ld      l,a
1e6f 17        rla     
1e70 9f        sbc     a,a
1e71 67        ld      h,a
1e72 7b        ld      a,e
1e73 95        sub     l
1e74 6f        ld      l,a
1e75 7a        ld      a,d
1e76 9c        sbc     a,h
1e77 67        ld      h,a
1e78 eb        ex      de,hl
1e79 2a7597    ld      hl,($9775)
1e7c 19        add     hl,de
1e7d 227597    ld      ($9775),hl
1e80 3e18      ld      a,$18
1e82 32d397    ld      ($97d3),a
1e85 3e01      ld      a,$01
1e87 32d297    ld      ($97d2),a
1e8a 117d1f    ld      de,$1f7d
1e8d 21e999    ld      hl,$99e9
1e90 cda33a    call    $3aa3
1e93 013528    ld      bc,$2835
1e96 117f1f    ld      de,$1f7f
1e99 21e999    ld      hl,$99e9
1e9c cd7a33    call    $337a
1e9f 11d297    ld      de,$97d2
1ea2 21d397    ld      hl,$97d3
1ea5 cdb839    call    $39b8
1ea8 213128    ld      hl,$2831
1eab cdc201    call    $01c2
1eae 2f        cpl     
1eaf 323928    ld      ($2839),a
1eb2 b7        or      a
1eb3 c2a81e    jp      nz,$1ea8
1eb6 3ac597    ld      a,($97c5)
1eb9 b7        or      a
1eba cac31e    jp      z,$1ec3
1ebd 213128    ld      hl,$2831
1ec0 cdd50e    call    $0ed5
1ec3 3a3128    ld      a,($2831)
1ec6 d67f      sub     $7f
1ec8 d601      sub     $01
1eca 9f        sbc     a,a
1ecb 323928    ld      ($2839),a
1ece b7        or      a
1ecf c23a1f    jp      nz,$1f3a
1ed2 3a3128    ld      a,($2831)
1ed5 d618      sub     $18
1ed7 d601      sub     $01
1ed9 9f        sbc     a,a
1eda 323928    ld      ($2839),a
1edd b7        or      a
1ede c2851e    jp      nz,$1e85
1ee1 3a3128    ld      a,($2831)
1ee4 d608      sub     $08
1ee6 d601      sub     $01
1ee8 9f        sbc     a,a
1ee9 323928    ld      ($2839),a
1eec b7        or      a
1eed c23a1f    jp      nz,$1f3a
1ef0 3a3128    ld      a,($2831)
1ef3 d60d      sub     $0d
1ef5 d601      sub     $01
1ef7 9f        sbc     a,a
1ef8 323928    ld      ($2839),a
1efb b7        or      a
1efc c2671f    jp      nz,$1f67
1eff 3a3128    ld      a,($2831)
1f02 d620      sub     $20
1f04 17        rla     
1f05 9f        sbc     a,a
1f06 323928    ld      ($2839),a
1f09 b7        or      a
1f0a c2a81e    jp      nz,$1ea8
1f0d 3ad297    ld      a,($97d2)
1f10 11e899    ld      de,$99e8
1f13 6f        ld      l,a
1f14 17        rla     
1f15 9f        sbc     a,a
1f16 67        ld      h,a
1f17 19        add     hl,de
1f18 223a28    ld      ($283a),hl
1f1b 3a3128    ld      a,($2831)
1f1e 2a3a28    ld      hl,($283a)
1f21 77        ld      (hl),a
1f22 3ad297    ld      a,($97d2)
1f25 d64f      sub     $4f
1f27 17        rla     
1f28 9f        sbc     a,a
1f29 323928    ld      ($2839),a
1f2c b7        or      a
1f2d ca371f    jp      z,$1f37
1f30 3ad297    ld      a,($97d2)
1f33 3c        inc     a
1f34 32d297    ld      ($97d2),a
1f37 c3931e    jp      $1e93
1f3a 3ad297    ld      a,($97d2)
1f3d 3d        dec     a
1f3e 3d        dec     a
1f3f d67f      sub     $7f
1f41 9f        sbc     a,a
1f42 323928    ld      ($2839),a
1f45 b7        or      a
1f46 ca501f    jp      z,$1f50
1f49 3ad297    ld      a,($97d2)
1f4c 3d        dec     a
1f4d 32d297    ld      ($97d2),a
1f50 3ad297    ld      a,($97d2)
1f53 11e899    ld      de,$99e8
1f56 6f        ld      l,a
1f57 17        rla     
1f58 9f        sbc     a,a
1f59 67        ld      h,a
1f5a 19        add     hl,de
1f5b 223a28    ld      ($283a),hl
1f5e 3e20      ld      a,$20
1f60 2a3a28    ld      hl,($283a)
1f63 77        ld      (hl),a
1f64 c3931e    jp      $1e93
1f67 3a3328    ld      a,($2833)
1f6a 32d397    ld      ($97d3),a
1f6d 3a3428    ld      a,($2834)
1f70 32d297    ld      ($97d2),a
1f73 2a3728    ld      hl,($2837)
1f76 227597    ld      ($9775),hl
1f79 cd5d36    call    $365d
1f7c c9        ret     

1f7d 50        ld      d,b
1f7e 00        nop     
1f7f 1800      jr      $1f81
1f81 3af297    ld      a,($97f2)
1f84 323d28    ld      ($283d),a
1f87 113d28    ld      de,$283d
1f8a 213e28    ld      hl,$283e
1f8d cd2b1d    call    $1d2b
1f90 2a3e28    ld      hl,($283e)
1f93 7d        ld      a,l
1f94 07        rlca    
1f95 b5        or      l
1f96 e67f      and     $7f
1f98 b4        or      h
1f99 d601      sub     $01
1f9b 9f        sbc     a,a
1f9c 324128    ld      ($2841),a
1f9f b7        or      a
1fa0 caad1f    jp      z,$1fad
1fa3 3a0698    ld      a,($9806)
1fa6 6f        ld      l,a
1fa7 17        rla     
1fa8 9f        sbc     a,a
1fa9 67        ld      h,a
1faa 223e28    ld      ($283e),hl
1fad 3a0598    ld      a,($9805)
1fb0 320698    ld      ($9806),a
1fb3 213e28    ld      hl,$283e
1fb6 cdbd1f    call    $1fbd
1fb9 cd5d36    call    $365d
1fbc c9        ret     

1fbd 224328    ld      ($2843),hl
1fc0 2a4328    ld      hl,($2843)
1fc3 7e        ld      a,(hl)
1fc4 3d        dec     a
1fc5 c681      add     a,$81
1fc7 9f        sbc     a,a
1fc8 324528    ld      ($2845),a
1fcb 2a4328    ld      hl,($2843)
1fce 7e        ld      a,(hl)
1fcf d602      sub     $02
1fd1 3d        dec     a
1fd2 d67f      sub     $7f
1fd4 9f        sbc     a,a
1fd5 214528    ld      hl,$2845
1fd8 b6        or      (hl)
1fd9 324628    ld      ($2846),a
1fdc b7        or      a
1fdd c2fe21    jp      nz,$21fe
1fe0 3a0598    ld      a,($9805)
1fe3 6f        ld      l,a
1fe4 17        rla     
1fe5 9f        sbc     a,a
1fe6 67        ld      h,a
1fe7 29        add     hl,hl
1fe8 224728    ld      ($2847),hl
1feb 11a397    ld      de,$97a3
1fee 19        add     hl,de
1fef 224928    ld      ($2849),hl
1ff2 2a7597    ld      hl,($9775)
1ff5 eb        ex      de,hl
1ff6 2a4928    ld      hl,($2849)
1ff9 73        ld      (hl),e
1ffa 23        inc     hl
1ffb 72        ld      (hl),d
1ffc 2a4728    ld      hl,($2847)
1fff 11a797    ld      de,$97a7
2002 19        add     hl,de
2003 224b28    ld      ($284b),hl
2006 2a7797    ld      hl,($9777)
2009 eb        ex      de,hl
200a 2a4b28    ld      hl,($284b)
200d 73        ld      (hl),e
200e 23        inc     hl
200f 72        ld      (hl),d
2010 3a0598    ld      a,($9805)
2013 324528    ld      ($2845),a
2016 11f697    ld      de,$97f6
2019 6f        ld      l,a
201a 17        rla     
201b 9f        sbc     a,a
201c 67        ld      h,a
201d 19        add     hl,de
201e 224d28    ld      ($284d),hl
2021 3ad297    ld      a,($97d2)
2024 2a4d28    ld      hl,($284d)
2027 77        ld      (hl),a
2028 3a4528    ld      a,($2845)
202b 11f897    ld      de,$97f8
202e 6f        ld      l,a
202f 17        rla     
2030 9f        sbc     a,a
2031 67        ld      h,a
2032 19        add     hl,de
2033 224f28    ld      ($284f),hl
2036 3ad397    ld      a,($97d3)
2039 2a4f28    ld      hl,($284f)
203c 77        ld      (hl),a
203d 3a4528    ld      a,($2845)
2040 11fa97    ld      de,$97fa
2043 6f        ld      l,a
2044 17        rla     
2045 9f        sbc     a,a
2046 67        ld      h,a
2047 19        add     hl,de
2048 225128    ld      ($2851),hl
204b 3ad497    ld      a,($97d4)
204e 2a5128    ld      hl,($2851)
2051 77        ld      (hl),a
2052 2a4728    ld      hl,($2847)
2055 11ab97    ld      de,$97ab
2058 19        add     hl,de
2059 225328    ld      ($2853),hl
205c 2a7997    ld      hl,($9779)
205f eb        ex      de,hl
2060 2a5328    ld      hl,($2853)
2063 73        ld      (hl),e
2064 23        inc     hl
2065 72        ld      (hl),d
2066 3a4528    ld      a,($2845)
2069 11cd97    ld      de,$97cd
206c 6f        ld      l,a
206d 17        rla     
206e 9f        sbc     a,a
206f 67        ld      h,a
2070 19        add     hl,de
2071 225528    ld      ($2855),hl
2074 3acd97    ld      a,($97cd)
2077 2a5528    ld      hl,($2855)
207a 77        ld      (hl),a
207b 3a0598    ld      a,($9805)
207e 6f        ld      l,a
207f 17        rla     
2080 9f        sbc     a,a
2081 67        ld      h,a
2082 eb        ex      de,hl
2083 211800    ld      hl,$0018
2086 cdd37e    call    $7ed3
2089 1141a2    ld      de,$a241
208c 19        add     hl,de
208d 225728    ld      ($2857),hl
2090 010922    ld      bc,$2209
2093 11af99    ld      de,$99af
2096 2a5728    ld      hl,($2857)
2099 cd573a    call    $3a57
209c 3a0598    ld      a,($9805)
209f 6f        ld      l,a
20a0 17        rla     
20a1 9f        sbc     a,a
20a2 67        ld      h,a
20a3 eb        ex      de,hl
20a4 210300    ld      hl,$0003
20a7 cdd37e    call    $7ed3
20aa 110998    ld      de,$9809
20ad 19        add     hl,de
20ae 224728    ld      ($2847),hl
20b1 010522    ld      bc,$2205
20b4 111b98    ld      de,$981b
20b7 2a4728    ld      hl,($2847)
20ba cd573a    call    $3a57
20bd 3a0598    ld      a,($9805)
20c0 6f        ld      l,a
20c1 17        rla     
20c2 9f        sbc     a,a
20c3 67        ld      h,a
20c4 eb        ex      de,hl
20c5 210300    ld      hl,$0003
20c8 cdd37e    call    $7ed3
20cb 111b98    ld      de,$981b
20ce 19        add     hl,de
20cf 224728    ld      ($2847),hl
20d2 010522    ld      bc,$2205
20d5 111498    ld      de,$9814
20d8 2a4728    ld      hl,($2847)
20db cd573a    call    $3a57
20de 2a4328    ld      hl,($2843)
20e1 7e        ld      a,(hl)
20e2 320598    ld      ($9805),a
20e5 6f        ld      l,a
20e6 17        rla     
20e7 9f        sbc     a,a
20e8 67        ld      h,a
20e9 29        add     hl,hl
20ea 224728    ld      ($2847),hl
20ed 11a397    ld      de,$97a3
20f0 19        add     hl,de
20f1 7e        ld      a,(hl)
20f2 23        inc     hl
20f3 66        ld      h,(hl)
20f4 6f        ld      l,a
20f5 227597    ld      ($9775),hl
20f8 2a4728    ld      hl,($2847)
20fb 11a797    ld      de,$97a7
20fe 19        add     hl,de
20ff 7e        ld      a,(hl)
2100 23        inc     hl
2101 66        ld      h,(hl)
2102 6f        ld      l,a
2103 227797    ld      ($9777),hl
2106 3a0598    ld      a,($9805)
2109 324528    ld      ($2845),a
210c 11f697    ld      de,$97f6
210f 6f        ld      l,a
2110 17        rla     
2111 9f        sbc     a,a
2112 67        ld      h,a
2113 19        add     hl,de
2114 7e        ld      a,(hl)
2115 32d297    ld      ($97d2),a
2118 3a4528    ld      a,($2845)
211b 11f897    ld      de,$97f8
211e 6f        ld      l,a
211f 17        rla     
2120 9f        sbc     a,a
2121 67        ld      h,a
2122 19        add     hl,de
2123 7e        ld      a,(hl)
2124 32d397    ld      ($97d3),a
2127 3a4528    ld      a,($2845)
212a 11fa97    ld      de,$97fa
212d 6f        ld      l,a
212e 17        rla     
212f 9f        sbc     a,a
2130 67        ld      h,a
2131 19        add     hl,de
2132 7e        ld      a,(hl)
2133 32d497    ld      ($97d4),a
2136 2a4728    ld      hl,($2847)
2139 11ab97    ld      de,$97ab
213c 19        add     hl,de
213d 7e        ld      a,(hl)
213e 23        inc     hl
213f 66        ld      h,(hl)
2140 6f        ld      l,a
2141 227997    ld      ($9779),hl
2144 3a4528    ld      a,($2845)
2147 11cd97    ld      de,$97cd
214a 6f        ld      l,a
214b 17        rla     
214c 9f        sbc     a,a
214d 67        ld      h,a
214e 19        add     hl,de
214f 7e        ld      a,(hl)
2150 32cd97    ld      ($97cd),a
2153 3a4528    ld      a,($2845)
2156 11fc97    ld      de,$97fc
2159 6f        ld      l,a
215a 17        rla     
215b 9f        sbc     a,a
215c 67        ld      h,a
215d 19        add     hl,de
215e 7e        ld      a,(hl)
215f 321298    ld      ($9812),a
2162 3a4528    ld      a,($2845)
2165 11fe97    ld      de,$97fe
2168 6f        ld      l,a
2169 17        rla     
216a 9f        sbc     a,a
216b 67        ld      h,a
216c 19        add     hl,de
216d 7e        ld      a,(hl)
216e 321398    ld      ($9813),a
2171 3a0598    ld      a,($9805)
2174 6f        ld      l,a
2175 17        rla     
2176 9f        sbc     a,a
2177 67        ld      h,a
2178 eb        ex      de,hl
2179 211800    ld      hl,$0018
217c cdd37e    call    $7ed3
217f 1141a2    ld      de,$a241
2182 19        add     hl,de
2183 224928    ld      ($2849),hl
2186 010922    ld      bc,$2209
2189 2a4928    ld      hl,($2849)
218c eb        ex      de,hl
218d 21af99    ld      hl,$99af
2190 cd573a    call    $3a57
2193 3a0598    ld      a,($9805)
2196 6f        ld      l,a
2197 17        rla     
2198 9f        sbc     a,a
2199 67        ld      h,a
219a eb        ex      de,hl
219b 210300    ld      hl,$0003
219e cdd37e    call    $7ed3
21a1 110998    ld      de,$9809
21a4 19        add     hl,de
21a5 224728    ld      ($2847),hl
21a8 010522    ld      bc,$2205
21ab 2a4728    ld      hl,($2847)
21ae eb        ex      de,hl
21af 211b98    ld      hl,$981b
21b2 cd573a    call    $3a57
21b5 3a0598    ld      a,($9805)
21b8 6f        ld      l,a
21b9 17        rla     
21ba 9f        sbc     a,a
21bb 67        ld      h,a
21bc eb        ex      de,hl
21bd 210300    ld      hl,$0003
21c0 cdd37e    call    $7ed3
21c3 111b98    ld      de,$981b
21c6 19        add     hl,de
21c7 224728    ld      ($2847),hl
21ca 010522    ld      bc,$2205
21cd 2a4728    ld      hl,($2847)
21d0 eb        ex      de,hl
21d1 211498    ld      hl,$9814
21d4 cd573a    call    $3a57
21d7 217997    ld      hl,$9779
21da cd9c2e    call    $2e9c
21dd 215928    ld      hl,$2859
21e0 cd1480    call    $8014
21e3 cae721    jp      z,$21e7
21e6 c9        ret     

21e7 110722    ld      de,$2207
21ea 214999    ld      hl,$9949
21ed cda33a    call    $3aa3
21f0 210000    ld      hl,$0000
21f3 227997    ld      ($9779),hl
21f6 cd8802    call    $0288
21f9 af        xor     a
21fa 32cd97    ld      ($97cd),a
21fd c9        ret     

21fe 215d28    ld      hl,$285d
2201 cda62f    call    $2fa6
2204 c9        ret     

2205 03        inc     bc
2206 00        nop     
2207 50        ld      d,b
2208 00        nop     
2209 1800      jr      $220b
220b 211222    ld      hl,$2212
220e cd2c01    call    $012c
2211 c9        ret     

2212 010022    ld      bc,$2200
2215 78        ld      a,b
2216 283a      jr      z,$2252
2218 12        ld      (de),a
2219 98        sbc     a,b
221a 320b98    ld      ($980b),a
221d 117997    ld      de,$9779
2220 217597    ld      hl,$9775
2223 cd322e    call    $2e32
2226 328928    ld      ($2889),a
2229 b7        or      a
222a c29222    jp      nz,$2292
222d 117997    ld      de,$9779
2230 217e28    ld      hl,$287e
2233 cd1839    call    $3918
2236 2a7997    ld      hl,($9779)
2239 eb        ex      de,hl
223a 2a7828    ld      hl,($2878)
223d 7e        ld      a,(hl)
223e 23        inc     hl
223f 66        ld      h,(hl)
2240 6f        ld      l,a
2241 19        add     hl,de
2242 228a28    ld      ($288a),hl
2245 118a28    ld      de,$288a
2248 218128    ld      hl,$2881
224b cd1839    call    $3918
224e 2a7597    ld      hl,($9775)
2251 23        inc     hl
2252 227c28    ld      ($287c),hl
2255 227a28    ld      ($287a),hl
2258 01da22    ld      bc,$22da
225b 117e28    ld      de,$287e
225e 218428    ld      hl,$2884
2261 cd6801    call    $0168
2264 01da22    ld      bc,$22da
2267 118128    ld      de,$2881
226a 218428    ld      hl,$2884
226d cd1b15    call    $151b
2270 11dc22    ld      de,$22dc
2273 217e28    ld      hl,$287e
2276 cd0c38    call    $380c
2279 11dc22    ld      de,$22dc
227c 218128    ld      hl,$2881
227f cd0c38    call    $380c
2282 2a7a28    ld      hl,($287a)
2285 23        inc     hl
2286 eb        ex      de,hl
2287 2a7997    ld      hl,($9779)
228a eb        ex      de,hl
228b 7b        ld      a,e
228c 95        sub     l
228d 7a        ld      a,d
228e 9c        sbc     a,h
228f f25522    jp      p,$2255
2292 117597    ld      de,$9775
2295 217e28    ld      hl,$287e
2298 cd1839    call    $3918
229b 210100    ld      hl,$0001
229e 227a28    ld      ($287a),hl
22a1 11da22    ld      de,$22da
22a4 217e28    ld      hl,$287e
22a7 cd0c38    call    $380c
22aa 01da22    ld      bc,$22da
22ad 117e28    ld      de,$287e
22b0 211798    ld      hl,$9817
22b3 cd1b15    call    $151b
22b6 2a7a28    ld      hl,($287a)
22b9 23        inc     hl
22ba eb        ex      de,hl
22bb 2a7828    ld      hl,($2878)
22be 7e        ld      a,(hl)
22bf 23        inc     hl
22c0 66        ld      h,(hl)
22c1 6f        ld      l,a
22c2 eb        ex      de,hl
22c3 7b        ld      a,e
22c4 95        sub     l
22c5 7a        ld      a,d
22c6 9c        sbc     a,h
22c7 f29e22    jp      p,$229e
22ca 2a7997    ld      hl,($9779)
22cd eb        ex      de,hl
22ce 2a7828    ld      hl,($2878)
22d1 7e        ld      a,(hl)
22d2 23        inc     hl
22d3 66        ld      h,(hl)
22d4 6f        ld      l,a
22d5 19        add     hl,de
22d6 227997    ld      ($9779),hl
22d9 c9        ret     

22da 04        inc     b
22db 00        nop     
22dc fcff22    call    m,$22ff
22df 8d        adc     a,l
22e0 28eb      jr      z,$22cd
22e2 228f28    ld      ($288f),hl
22e5 60        ld      h,b
22e6 69        ld      l,c
22e7 229128    ld      ($2891),hl
22ea 3a1298    ld      a,($9812)
22ed 320b98    ld      ($980b),a
22f0 2a8d28    ld      hl,($288d)
22f3 eb        ex      de,hl
22f4 219728    ld      hl,$2897
22f7 cd1839    call    $3918
22fa 2a9128    ld      hl,($2891)
22fd eb        ex      de,hl
22fe 219a28    ld      hl,$289a
2301 cd1839    call    $3918
2304 2a8d28    ld      hl,($288d)
2307 7e        ld      a,(hl)
2308 23        inc     hl
2309 66        ld      h,(hl)
230a 6f        ld      l,a
230b 229528    ld      ($2895),hl
230e 014d23    ld      bc,$234d
2311 119728    ld      de,$2897
2314 219d28    ld      hl,$289d
2317 cd6801    call    $0168
231a 014d23    ld      bc,$234d
231d 119a28    ld      de,$289a
2320 219d28    ld      hl,$289d
2323 cd1b15    call    $151b
2326 114d23    ld      de,$234d
2329 219728    ld      hl,$2897
232c cd0c38    call    $380c
232f 114d23    ld      de,$234d
2332 219a28    ld      hl,$289a
2335 cd0c38    call    $380c
2338 2a9528    ld      hl,($2895)
233b 23        inc     hl
233c eb        ex      de,hl
233d 2a8f28    ld      hl,($288f)
2340 7e        ld      a,(hl)
2341 23        inc     hl
2342 66        ld      h,(hl)
2343 6f        ld      l,a
2344 eb        ex      de,hl
2345 7b        ld      a,e
2346 95        sub     l
2347 7a        ld      a,d
2348 9c        sbc     a,h
2349 f20b23    jp      p,$230b
234c c9        ret     

234d 04        inc     b
234e 00        nop     
234f 117597    ld      de,$9775
2352 217597    ld      hl,$9775
2355 cd5923    call    $2359
2358 c9        ret     

2359 22a328    ld      ($28a3),hl
235c eb        ex      de,hl
235d 22a528    ld      ($28a5),hl
2360 3a1298    ld      a,($9812)
2363 320b98    ld      ($980b),a
2366 2aa528    ld      hl,($28a5)
2369 7e        ld      a,(hl)
236a 23        inc     hl
236b 66        ld      h,(hl)
236c 6f        ld      l,a
236d 22a728    ld      ($28a7),hl
2370 117997    ld      de,$9779
2373 2aa328    ld      hl,($28a3)
2376 cd722e    call    $2e72
2379 32b828    ld      ($28b8),a
237c b7        or      a
237d ca8123    jp      z,$2381
2380 c9        ret     

2381 117997    ld      de,$9779
2384 21a728    ld      hl,$28a7
2387 cd722e    call    $2e72
238a 32b828    ld      ($28b8),a
238d b7        or      a
238e ca9723    jp      z,$2397
2391 2a7997    ld      hl,($9779)
2394 22a728    ld      ($28a7),hl
2397 117997    ld      de,$9779
239a 21a728    ld      hl,$28a7
239d cd682f    call    $2f68
23a0 32b828    ld      ($28b8),a
23a3 b7        or      a
23a4 c20424    jp      nz,$2404
23a7 117b24    ld      de,$247b
23aa 2aa328    ld      hl,($28a3)
23ad cd722e    call    $2e72
23b0 32b828    ld      ($28b8),a
23b3 b7        or      a
23b4 c2e523    jp      nz,$23e5
23b7 210100    ld      hl,$0001
23ba 227997    ld      ($9779),hl
23bd 117b24    ld      de,$247b
23c0 21ab28    ld      hl,$28ab
23c3 cd1839    call    $3918
23c6 017f24    ld      bc,$247f
23c9 11ab28    ld      de,$28ab
23cc 211798    ld      hl,$9817
23cf cd1b15    call    $151b
23d2 118124    ld      de,$2481
23d5 211498    ld      hl,$9814
23d8 cd4239    call    $3942
23db 117d24    ld      de,$247d
23de 211b98    ld      hl,$981b
23e1 cd4239    call    $3942
23e4 c9        ret     

23e5 2aa328    ld      hl,($28a3)
23e8 7e        ld      a,(hl)
23e9 23        inc     hl
23ea 66        ld      h,(hl)
23eb 6f        ld      l,a
23ec 2b        dec     hl
23ed 227997    ld      ($9779),hl
23f0 217997    ld      hl,$9779
23f3 cd212f    call    $2f21
23f6 32b828    ld      ($28b8),a
23f9 b7        or      a
23fa ca0324    jp      z,$2403
23fd 210100    ld      hl,$0001
2400 227997    ld      ($9779),hl
2403 c9        ret     

2404 2aa728    ld      hl,($28a7)
2407 23        inc     hl
2408 22a928    ld      ($28a9),hl
240b 2aa328    ld      hl,($28a3)
240e eb        ex      de,hl
240f 21ab28    ld      hl,$28ab
2412 cd1839    call    $3918
2415 11a928    ld      de,$28a9
2418 21ae28    ld      hl,$28ae
241b cd1839    call    $3918
241e 2aa928    ld      hl,($28a9)
2421 22b928    ld      ($28b9),hl
2424 017f24    ld      bc,$247f
2427 11ae28    ld      de,$28ae
242a 21b128    ld      hl,$28b1
242d cd6801    call    $0168
2430 017f24    ld      bc,$247f
2433 11ab28    ld      de,$28ab
2436 21b128    ld      hl,$28b1
2439 cd1b15    call    $151b
243c 117f24    ld      de,$247f
243f 21ae28    ld      hl,$28ae
2442 cd0c38    call    $380c
2445 117f24    ld      de,$247f
2448 21ab28    ld      hl,$28ab
244b cd0c38    call    $380c
244e 2ab928    ld      hl,($28b9)
2451 23        inc     hl
2452 eb        ex      de,hl
2453 2a7997    ld      hl,($9779)
2456 eb        ex      de,hl
2457 7b        ld      a,e
2458 95        sub     l
2459 7a        ld      a,d
245a 9c        sbc     a,h
245b f22124    jp      p,$2421
245e 2a7997    ld      hl,($9779)
2461 2b        dec     hl
2462 eb        ex      de,hl
2463 2aa728    ld      hl,($28a7)
2466 7b        ld      a,e
2467 95        sub     l
2468 6f        ld      l,a
2469 7a        ld      a,d
246a 9c        sbc     a,h
246b 67        ld      h,a
246c eb        ex      de,hl
246d 2aa328    ld      hl,($28a3)
2470 7e        ld      a,(hl)
2471 23        inc     hl
2472 66        ld      h,(hl)
2473 6f        ld      l,a
2474 19        add     hl,de
2475 227997    ld      ($9779),hl
2478 c3f023    jp      $23f0
247b 010000    ld      bc,$0000
247e 00        nop     
247f 04        inc     b
2480 00        nop     
2481 00        nop     
2482 02        ld      (bc),a
2483 217597    ld      hl,$9775
2486 cd212f    call    $2f21
2489 32cd28    ld      ($28cd),a
248c b7        or      a
248d ca9924    jp      z,$2499
2490 cd2e7d    call    $7d2e
2493 39        add     hl,sp
2494 39        add     hl,sp
2495 2020      jr      nz,$24b7
2497 2020      jr      nz,$24b9
2499 01ce28    ld      bc,$28ce
249c 117597    ld      de,$9775
249f 2109a2    ld      hl,$a209
24a2 cd6736    call    $3667
24a5 3e01      ld      a,$01
24a7 32bf28    ld      ($28bf),a
24aa 3abf28    ld      a,($28bf)
24ad 32cd28    ld      ($28cd),a
24b0 114899    ld      de,$9948
24b3 6f        ld      l,a
24b4 17        rla     
24b5 9f        sbc     a,a
24b6 67        ld      h,a
24b7 19        add     hl,de
24b8 22d228    ld      ($28d2),hl
24bb 3acd28    ld      a,($28cd)
24be 1108a2    ld      de,$a208
24c1 6f        ld      l,a
24c2 17        rla     
24c3 9f        sbc     a,a
24c4 67        ld      h,a
24c5 19        add     hl,de
24c6 22d428    ld      ($28d4),hl
24c9 2ad228    ld      hl,($28d2)
24cc 7e        ld      a,(hl)
24cd 2ad428    ld      hl,($28d4)
24d0 96        sub     (hl)
24d1 c6ff      add     a,$ff
24d3 9f        sbc     a,a
24d4 32d628    ld      ($28d6),a
24d7 b7        or      a
24d8 c2e524    jp      nz,$24e5
24db 3abf28    ld      a,($28bf)
24de 3c        inc     a
24df fe51      cp      $51
24e1 faa724    jp      m,$24a7
24e4 c9        ret     

24e5 3eff      ld      a,$ff
24e7 32cd97    ld      ($97cd),a
24ea 214999    ld      hl,$9949
24ed cdde2e    call    $2ede
24f0 32c528    ld      ($28c5),a
24f3 d601      sub     $01
24f5 9f        sbc     a,a
24f6 32cd28    ld      ($28cd),a
24f9 b7        or      a
24fa c20126    jp      nz,$2601
24fd 11c128    ld      de,$28c1
2500 211b98    ld      hl,$981b
2503 cd6c37    call    $376c
2506 32cd28    ld      ($28cd),a
2509 3ac428    ld      a,($28c4)
250c c6ff      add     a,$ff
250e 9f        sbc     a,a
250f 21cd28    ld      hl,$28cd
2512 a6        and     (hl)
2513 32d628    ld      ($28d6),a
2516 b7        or      a
2517 c29d25    jp      nz,$259d
251a 3ac428    ld      a,($28c4)
251d 21c528    ld      hl,$28c5
2520 96        sub     (hl)
2521 17        rla     
2522 3f        ccf     
2523 9f        sbc     a,a
2524 32cd28    ld      ($28cd),a
2527 b7        or      a
2528 c2b425    jp      nz,$25b4
252b 117597    ld      de,$9775
252e 21c628    ld      hl,$28c6
2531 cd1839    call    $3918
2534 3a1298    ld      a,($9812)
2537 320b98    ld      ($980b),a
253a 011f26    ld      bc,$261f
253d 11c628    ld      de,$28c6
2540 211498    ld      hl,$9814
2543 cd1b15    call    $151b
2546 111f26    ld      de,$261f
2549 21c628    ld      hl,$28c6
254c cd0c38    call    $380c
254f 011d26    ld      bc,$261d
2552 11c628    ld      de,$28c6
2555 21c528    ld      hl,$28c5
2558 cd1b15    call    $151b
255b 3a1398    ld      a,($9813)
255e 320b98    ld      ($980b),a
2561 111498    ld      de,$9814
2564 211b98    ld      hl,$981b
2567 cd5337    call    $3753
256a 3ac528    ld      a,($28c5)
256d 6f        ld      l,a
256e 17        rla     
256f 9f        sbc     a,a
2570 67        ld      h,a
2571 22bd28    ld      ($28bd),hl
2574 01bd28    ld      bc,$28bd
2577 111498    ld      de,$9814
257a 214999    ld      hl,$9949
257d cd1b15    call    $151b
2580 11bd28    ld      de,$28bd
2583 211498    ld      hl,$9814
2586 cd0c38    call    $380c
2589 117997    ld      de,$9779
258c 217597    ld      hl,$9775
258f cd722e    call    $2e72
2592 32cd28    ld      ($28cd),a
2595 b7        or      a
2596 ca9c25    jp      z,$259c
2599 cde601    call    $01e6
259c c9        ret     

259d 3ac528    ld      a,($28c5)
25a0 21c428    ld      hl,$28c4
25a3 96        sub     (hl)
25a4 6f        ld      l,a
25a5 17        rla     
25a6 9f        sbc     a,a
25a7 67        ld      h,a
25a8 22bd28    ld      ($28bd),hl
25ab 11bd28    ld      de,$28bd
25ae 211498    ld      hl,$9814
25b1 cd0c38    call    $380c
25b4 117597    ld      de,$9775
25b7 21c628    ld      hl,$28c6
25ba cd1839    call    $3918
25bd 3a1298    ld      a,($9812)
25c0 320b98    ld      ($980b),a
25c3 011f26    ld      bc,$261f
25c6 11c628    ld      de,$28c6
25c9 21c128    ld      hl,$28c1
25cc cd6801    call    $0168
25cf 111f26    ld      de,$261f
25d2 21c628    ld      hl,$28c6
25d5 cd0c38    call    $380c
25d8 011d26    ld      bc,$261d
25db 11c628    ld      de,$28c6
25de 21c528    ld      hl,$28c5
25e1 cd1b15    call    $151b
25e4 3a1398    ld      a,($9813)
25e7 320b98    ld      ($980b),a
25ea 3ac528    ld      a,($28c5)
25ed 6f        ld      l,a
25ee 17        rla     
25ef 9f        sbc     a,a
25f0 67        ld      h,a
25f1 22bd28    ld      ($28bd),hl
25f4 01bd28    ld      bc,$28bd
25f7 11c128    ld      de,$28c1
25fa 214999    ld      hl,$9949
25fd cd1b15    call    $151b
2600 c9        ret     

2601 117597    ld      de,$9775
2604 21c628    ld      hl,$28c6
2607 cd1839    call    $3918
260a 3a1298    ld      a,($9812)
260d 320b98    ld      ($980b),a
2610 012126    ld      bc,$2621
2613 11c628    ld      de,$28c6
2616 211798    ld      hl,$9817
2619 cd1b15    call    $151b
261c c9        ret     

261d 010003    ld      bc,$0300
2620 00        nop     
2621 04        inc     b
2622 00        nop     
2623 2a7997    ld      hl,($9779)
2626 23        inc     hl
2627 22d828    ld      ($28d8),hl
262a 117597    ld      de,$9775
262d 21d828    ld      hl,$28d8
2630 cd322e    call    $2e32
2633 32df28    ld      ($28df),a
2636 b7        or      a
2637 c27b26    jp      nz,$267b
263a 11d828    ld      de,$28d8
263d 21e028    ld      hl,$28e0
2640 cd1839    call    $3918
2643 2a7597    ld      hl,($9775)
2646 2b        dec     hl
2647 22da28    ld      ($28da),hl
264a 3a1298    ld      a,($9812)
264d 320b98    ld      ($980b),a
2650 2ad828    ld      hl,($28d8)
2653 22dc28    ld      ($28dc),hl
2656 018226    ld      bc,$2682
2659 11e028    ld      de,$28e0
265c 211798    ld      hl,$9817
265f cd1b15    call    $151b
2662 118226    ld      de,$2682
2665 21e028    ld      hl,$28e0
2668 cd0c38    call    $380c
266b 2adc28    ld      hl,($28dc)
266e 23        inc     hl
266f eb        ex      de,hl
2670 2ada28    ld      hl,($28da)
2673 eb        ex      de,hl
2674 7b        ld      a,e
2675 95        sub     l
2676 7a        ld      a,d
2677 9c        sbc     a,h
2678 f25326    jp      p,$2653
267b 2a7597    ld      hl,($9775)
267e 227997    ld      ($9779),hl
2681 c9        ret     

2682 04        inc     b
2683 00        nop     
2684 cd9c26    call    $269c
2687 7a        ld      a,d
2688 b3        or      e
2689 c8        ret     z

268a 7c        ld      a,h
268b b5        or      l
268c c8        ret     z

268d 7c        ld      a,h
268e aa        xor     d
268f f5        push    af
2690 d5        push    de
2691 eb        ex      de,hl
2692 cd777e    call    $7e77
2695 e1        pop     hl
2696 f1        pop     af
2697 fcae7e    call    m,$7eae
269a eb        ex      de,hl
269b c9        ret     

269c 7e        ld      a,(hl)
269d 23        inc     hl
269e 66        ld      h,(hl)
269f 6f        ld      l,a
26a0 eb        ex      de,hl
26a1 7e        ld      a,(hl)
26a2 23        inc     hl
26a3 66        ld      h,(hl)
26a4 6f        ld      l,a
26a5 eb        ex      de,hl
26a6 c9        ret     

26a7 00        nop     
26a8 00        nop     
26a9 00        nop     
26aa 00        nop     
26ab 00        nop     
26ac 00        nop     
26ad 00        nop     
26ae 00        nop     
26af 00        nop     
26b0 00        nop     
26b1 00        nop     
26b2 00        nop     
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
26d3 4d        ld      c,l
26d4 61        ld      h,c
26d5 63        ld      h,e
26d6 72        ld      (hl),d
26d7 6f        ld      l,a
26d8 73        ld      (hl),e
26d9 2074      jr      nz,$274f
26db 6f        ld      l,a
26dc 6f        ld      l,a
26dd 2064      jr      nz,$2743
26df 65        ld      h,l
26e0 65        ld      h,l
26e1 70        ld      (hl),b
26e2 210000    ld      hl,$0000
26e5 00        nop     
26e6 00        nop     
26e7 00        nop     
26e8 00        nop     
26e9 00        nop     
26ea 00        nop     
26eb 4f        ld      c,a
26ec 4b        ld      c,e
26ed 210000    ld      hl,$0000
26f0 9d        sbc     a,l
26f1 97        sub     a
26f2 00        nop     
26f3 00        nop     
26f4 2084      jr      nz,$267a
26f6 02        ld      (bc),a
26f7 00        nop     
26f8 00        nop     
26f9 ff        rst     $38
26fa 00        nop     
26fb 00        nop     
26fc 41        ld      b,c
26fd 44        ld      b,h
26fe 52        ld      d,d
26ff 55        ld      d,l
2700 4e        ld      c,(hl)
2701 50        ld      d,b
2702 2049      jr      nz,$274d
2704 21000b    ld      hl,$0b00
2707 84        add     a,h
2708 4a        ld      c,d
2709 27        daa     
270a 04        inc     b
270b 00        nop     
270c 77        ld      (hl),a
270d 95        sub     l
270e 00        nop     
270f 17        rla     
2710 98        sbc     a,b
2711 4a        ld      c,d
2712 27        daa     
2713 04        inc     b
2714 00        nop     
2715 09        add     hl,bc
2716 00        nop     
2717 08        ex      af,af'
2718 00        nop     
2719 7a        ld      a,d
271a 95        sub     l
271b 1a        ld      a,(de)
271c 98        sbc     a,b
271d 00        nop     
271e 00        nop     
271f 04        inc     b
2720 00        nop     
2721 010000    ld      bc,$0000
2724 00        nop     
2725 04        inc     b
2726 00        nop     
2727 04        inc     b
2728 00        nop     
2729 ff        rst     $38
272a 00        nop     
272b 00        nop     
272c 00        nop     
272d ff        rst     $38
272e ff        rst     $38
272f 02        ld      (bc),a
2730 00        nop     
2731 ca9701    jp      z,$0197
2734 00        nop     
2735 f49704    call    p,$0497
2738 00        nop     
2739 8f        adc     a,a
273a 97        sub     a
273b 02        ld      (bc),a
273c 00        nop     
273d 97        sub     a
273e 97        sub     a
273f 00        nop     
2740 0b        dec     bc
2741 84        add     a,h
2742 2084      jr      nz,$26c8
2744 f9        ld      sp,hl
2745 3619      ld      (hl),$19
2747 15        dec     d
2748 04        inc     b
2749 00        nop     
274a 04        inc     b
274b 00        nop     
274c 00        nop     
274d 00        nop     
274e 00        nop     
274f ff        rst     $38
2750 0b        dec     bc
2751 84        add     a,h
2752 00        nop     
2753 0b        dec     bc
2754 84        add     a,h
2755 2084      jr      nz,$26db
2757 f9        ld      sp,hl
2758 36f9      ld      (hl),$f9
275a 3619      ld      (hl),$19
275c 15        dec     d
275d 00        nop     
275e 17        rla     
275f 98        sbc     a,b
2760 76        halt    
2761 27        daa     
2762 85        add     a,l
2763 15        dec     d
2764 85        add     a,l
2765 15        dec     d
2766 3b        dec     sp
2767 15        dec     d
2768 00        nop     
2769 00        nop     
276a 00        nop     
276b 00        nop     
276c 00        nop     
276d 00        nop     
276e 00        nop     
276f 00        nop     
2770 00        nop     
2771 00        nop     
2772 00        nop     
2773 00        nop     
2774 00        nop     
2775 00        nop     
2776 04        inc     b
2777 02        ld      (bc),a
2778 00        nop     
2779 00        nop     
277a 00        nop     
277b 00        nop     
277c 00        nop     
277d 00        nop     
277e 00        nop     
277f 00        nop     
2780 00        nop     
2781 00        nop     
2782 00        nop     
2783 00        nop     
2784 00        nop     
2785 00        nop     
2786 00        nop     
2787 00        nop     
2788 00        nop     
2789 00        nop     
278a 00        nop     
278b 00        nop     
278c 00        nop     
278d 00        nop     
278e 00        nop     
278f 00        nop     
2790 00        nop     
2791 00        nop     
2792 00        nop     
2793 00        nop     
2794 00        nop     
2795 00        nop     
2796 00        nop     
2797 00        nop     
2798 00        nop     
2799 00        nop     
279a 00        nop     
279b 00        nop     
279c 00        nop     
279d 00        nop     
279e 00        nop     
279f 00        nop     
27a0 00        nop     
27a1 00        nop     
27a2 00        nop     
27a3 00        nop     
27a4 00        nop     
27a5 00        nop     
27a6 00        nop     
27a7 00        nop     
27a8 00        nop     
27a9 00        nop     
27aa 00        nop     
27ab 00        nop     
27ac 00        nop     
27ad 00        nop     
27ae 00        nop     
27af 00        nop     
27b0 00        nop     
27b1 00        nop     
27b2 00        nop     
27b3 00        nop     
27b4 00        nop     
27b5 00        nop     
27b6 00        nop     
27b7 00        nop     
27b8 00        nop     
27b9 00        nop     
27ba 00        nop     
27bb 00        nop     
27bc 00        nop     
27bd 00        nop     
27be 00        nop     
27bf 00        nop     
27c0 85        add     a,l
27c1 82        add     a,d
27c2 84        add     a,h
27c3 82        add     a,d
27c4 14        inc     d
27c5 eb        ex      de,hl
27c6 97        sub     a
27c7 ff        rst     $38
27c8 00        nop     
27c9 00        nop     
27ca 00        nop     
27cb 00        nop     
27cc 00        nop     
27cd 00        nop     
27ce 00        nop     
27cf 00        nop     
27d0 00        nop     
27d1 00        nop     
27d2 00        nop     
27d3 00        nop     
27d4 00        nop     
27d5 00        nop     
27d6 00        nop     
27d7 00        nop     
27d8 00        nop     
27d9 00        nop     
27da 00        nop     
27db 00        nop     
27dc 00        nop     
27dd 00        nop     
27de 00        nop     
27df 00        nop     
27e0 00        nop     
27e1 00        nop     
27e2 00        nop     
27e3 00        nop     
27e4 00        nop     
27e5 00        nop     
27e6 00        nop     
27e7 00        nop     
27e8 00        nop     
27e9 00        nop     
27ea 00        nop     
27eb 00        nop     
27ec 00        nop     
27ed 00        nop     
27ee 00        nop     
27ef 00        nop     
27f0 00        nop     
27f1 00        nop     
27f2 00        nop     
27f3 00        nop     
27f4 00        nop     
27f5 00        nop     
27f6 00        nop     
27f7 00        nop     
27f8 00        nop     
27f9 00        nop     
27fa 00        nop     
27fb 00        nop     
27fc 00        nop     
27fd 00        nop     
27fe 00        nop     
27ff 00        nop     
2800 00        nop     
2801 00        nop     
2802 00        nop     
2803 00        nop     
2804 00        nop     
2805 00        nop     
2806 00        nop     
2807 00        nop     
2808 49        ld      c,c
2809 4e        ld      c,(hl)
280a 49        ld      c,c
280b 54        ld      d,h
280c 49        ld      c,c
280d 41        ld      b,c
280e 4c        ld      c,h
280f 49        ld      c,c
2810 53        ld      d,e
2811 45        ld      b,l
2812 44        ld      b,h
2813 21554e    ld      hl,$4e55
2816 4b        ld      c,e
2817 4e        ld      c,(hl)
2818 4f        ld      c,a
2819 57        ld      d,a
281a 4e        ld      c,(hl)
281b 2043      jr      nz,$2860
281d 4f        ld      c,a
281e 4d        ld      c,l
281f 4d        ld      c,l
2820 41        ld      b,c
2821 4e        ld      c,(hl)
2822 44        ld      b,h
2823 210000    ld      hl,$0000
2826 00        nop     
2827 00        nop     
2828 00        nop     
2829 00        nop     
282a 00        nop     
282b 00        nop     
282c 00        nop     
282d 00        nop     
282e 00        nop     
282f 00        nop     
2830 00        nop     
2831 00        nop     
2832 00        nop     
2833 00        nop     
2834 00        nop     
2835 00        nop     
2836 00        nop     
2837 00        nop     
2838 00        nop     
2839 00        nop     
283a 00        nop     
283b 00        nop     
283c 00        nop     
283d 00        nop     
283e 00        nop     
283f 00        nop     
2840 00        nop     
2841 00        nop     
2842 00        nop     
2843 00        nop     
2844 00        nop     
2845 00        nop     
2846 00        nop     
2847 00        nop     
2848 00        nop     
2849 00        nop     
284a 00        nop     
284b 00        nop     
284c 00        nop     
284d 00        nop     
284e 00        nop     
284f 00        nop     
2850 00        nop     
2851 00        nop     
2852 00        nop     
2853 00        nop     
2854 00        nop     
2855 00        nop     
2856 00        nop     
2857 00        nop     
2858 00        nop     
2859 00        nop     
285a 00        nop     
285b 00        nop     
285c 00        nop     
285d 49        ld      c,c
285e 6c        ld      l,h
285f 6c        ld      l,h
2860 65        ld      h,l
2861 67        ld      h,a
2862 61        ld      h,c
2863 6c        ld      l,h
2864 2077      jr      nz,$28dd
2866 6f        ld      l,a
2867 72        ld      (hl),d
2868 6b        ld      l,e
2869 73        ld      (hl),e
286a 70        ld      (hl),b
286b 61        ld      h,c
286c 63        ld      h,e
286d 65        ld      h,l
286e 206e      jr      nz,$28de
2870 75        ld      (hl),l
2871 6d        ld      l,l
2872 62        ld      h,d
2873 65        ld      h,l
2874 72        ld      (hl),d
2875 210000    ld      hl,$0000
2878 00        nop     
2879 00        nop     
287a 00        nop     
287b 00        nop     
287c 00        nop     
287d 00        nop     
287e 00        nop     
287f 00        nop     
2880 00        nop     
2881 00        nop     
2882 00        nop     
2883 00        nop     
2884 00        nop     
2885 00        nop     
2886 00        nop     
2887 00        nop     
2888 00        nop     
2889 00        nop     
288a 00        nop     
288b 00        nop     
288c 00        nop     
288d 00        nop     
288e 00        nop     
288f 00        nop     
2890 00        nop     
2891 00        nop     
2892 00        nop     
2893 00        nop     
2894 00        nop     
2895 00        nop     
2896 00        nop     
2897 00        nop     
2898 00        nop     
2899 00        nop     
289a 00        nop     
289b 00        nop     
289c 00        nop     
289d 00        nop     
289e 00        nop     
289f 00        nop     
28a0 00        nop     
28a1 00        nop     
28a2 00        nop     
28a3 00        nop     
28a4 00        nop     
28a5 00        nop     
28a6 00        nop     
28a7 00        nop     
28a8 00        nop     
28a9 00        nop     
28aa 00        nop     
28ab 00        nop     
28ac 00        nop     
28ad 00        nop     
28ae 00        nop     
28af 00        nop     
28b0 00        nop     
28b1 00        nop     
28b2 00        nop     
28b3 00        nop     
28b4 00        nop     
28b5 00        nop     
28b6 00        nop     
28b7 00        nop     
28b8 00        nop     
28b9 00        nop     
28ba 00        nop     
28bb 00        nop     
28bc 00        nop     
28bd 00        nop     
28be 00        nop     
28bf 00        nop     
28c0 00        nop     
28c1 00        nop     
28c2 00        nop     
28c3 00        nop     
28c4 00        nop     
28c5 00        nop     
28c6 00        nop     
28c7 00        nop     
28c8 00        nop     
28c9 00        nop     
28ca 00        nop     
28cb 00        nop     
28cc 00        nop     
28cd 00        nop     
28ce c428c1    call    nz,$c128
28d1 2800      jr      z,$28d3
28d3 00        nop     
28d4 00        nop     
28d5 00        nop     
28d6 00        nop     
28d7 00        nop     
28d8 00        nop     
28d9 00        nop     
28da 00        nop     
28db 00        nop     
28dc 00        nop     
28dd 00        nop     
28de 00        nop     
28df 00        nop     
28e0 00        nop     
28e1 00        nop     
28e2 00        nop     
28e3 00        nop     
28e4 00        nop     
28e5 00        nop     
28e6 00        nop     
28e7 00        nop     
28e8 00        nop     
28e9 00        nop     
28ea 00        nop     
28eb 00        nop     
28ec 00        nop     
28ed 00        nop     
28ee 00        nop     
28ef 00        nop     
28f0 00        nop     
28f1 00        nop     
28f2 00        nop     
28f3 00        nop     
28f4 00        nop     
28f5 00        nop     
28f6 00        nop     
28f7 00        nop     
28f8 00        nop     
28f9 00        nop     
28fa 00        nop     
28fb 00        nop     
28fc 00        nop     
28fd 00        nop     
28fe 00        nop     
28ff 00        nop     
2900 00        nop     
2901 00        nop     
2902 00        nop     
2903 00        nop     
2904 00        nop     
2905 00        nop     
2906 00        nop     
2907 00        nop     
2908 00        nop     
2909 00        nop     
290a 00        nop     
290b 00        nop     
290c 00        nop     
290d 00        nop     
290e 00        nop     
290f 00        nop     
2910 00        nop     
2911 00        nop     
2912 00        nop     
2913 00        nop     
2914 00        nop     
2915 00        nop     
2916 00        nop     
2917 00        nop     
2918 00        nop     
2919 00        nop     
291a 00        nop     
291b 00        nop     
291c 00        nop     
291d 00        nop     
291e 00        nop     
291f 00        nop     
2920 00        nop     
2921 00        nop     
2922 00        nop     
2923 00        nop     
2924 00        nop     
2925 00        nop     
2926 00        nop     
2927 00        nop     
2928 00        nop     
2929 00        nop     
292a 00        nop     
292b 00        nop     
292c 00        nop     
292d 00        nop     
292e 00        nop     
292f 00        nop     
2930 00        nop     
2931 00        nop     
2932 00        nop     
2933 00        nop     
2934 00        nop     
2935 00        nop     
2936 00        nop     
2937 00        nop     
2938 00        nop     
2939 00        nop     
293a 00        nop     
293b 00        nop     
293c 00        nop     
293d 00        nop     
293e 00        nop     
293f 00        nop     
2940 00        nop     
2941 00        nop     
2942 00        nop     
2943 00        nop     
2944 00        nop     
2945 00        nop     
2946 00        nop     
2947 00        nop     
2948 00        nop     
2949 00        nop     
294a 00        nop     
294b 00        nop     
294c 00        nop     
294d 00        nop     
294e 00        nop     
294f 00        nop     
2950 00        nop     
2951 00        nop     
2952 00        nop     
2953 00        nop     
2954 00        nop     
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
29e4 00        nop     
29e5 00        nop     
29e6 00        nop     
29e7 00        nop     
29e8 00        nop     
29e9 00        nop     
29ea 00        nop     
29eb 00        nop     
29ec 00        nop     
29ed 00        nop     
29ee 00        nop     
29ef 00        nop     
29f0 00        nop     
29f1 00        nop     
29f2 00        nop     
29f3 00        nop     
29f4 00        nop     
29f5 00        nop     
29f6 00        nop     
29f7 00        nop     
29f8 00        nop     
29f9 00        nop     
29fa 00        nop     
29fb 00        nop     
29fc 00        nop     
29fd 00        nop     
29fe 00        nop     
29ff 00        nop     
2a00 00        nop     
2a01 00        nop     
2a02 00        nop     
2a03 00        nop     
2a04 00        nop     
2a05 00        nop     
2a06 00        nop     
2a07 00        nop     
2a08 00        nop     
2a09 00        nop     
2a0a 00        nop     
2a0b 00        nop     
2a0c 00        nop     
2a0d 00        nop     
2a0e 00        nop     
2a0f 00        nop     
2a10 00        nop     
2a11 00        nop     
2a12 00        nop     
2a13 00        nop     
2a14 00        nop     
2a15 00        nop     
2a16 00        nop     
2a17 00        nop     
2a18 00        nop     
2a19 00        nop     
2a1a 00        nop     
2a1b 00        nop     
2a1c 00        nop     
2a1d 00        nop     
2a1e 00        nop     
2a1f 00        nop     
2a20 00        nop     
2a21 00        nop     
2a22 00        nop     
2a23 00        nop     
2a24 00        nop     
2a25 00        nop     
2a26 00        nop     
2a27 00        nop     
2a28 00        nop     
2a29 00        nop     
2a2a 00        nop     
2a2b 00        nop     
2a2c 00        nop     
2a2d 00        nop     
2a2e 00        nop     
2a2f 00        nop     
2a30 00        nop     
2a31 00        nop     
2a32 00        nop     
2a33 00        nop     
2a34 00        nop     
2a35 00        nop     
2a36 00        nop     
2a37 00        nop     
2a38 00        nop     
2a39 00        nop     
2a3a 00        nop     
2a3b 00        nop     
2a3c 00        nop     
2a3d 00        nop     
2a3e 00        nop     
2a3f 00        nop     
2a40 00        nop     
2a41 00        nop     
2a42 00        nop     
2a43 00        nop     
2a44 00        nop     
2a45 00        nop     
2a46 00        nop     
2a47 00        nop     
2a48 00        nop     
2a49 00        nop     
2a4a 00        nop     
2a4b 00        nop     
2a4c 00        nop     
2a4d 00        nop     
2a4e 00        nop     
2a4f 00        nop     
2a50 00        nop     
2a51 00        nop     
2a52 00        nop     
2a53 00        nop     
2a54 00        nop     
2a55 00        nop     
2a56 00        nop     
2a57 00        nop     
2a58 00        nop     
2a59 00        nop     
2a5a 00        nop     
2a5b 00        nop     
2a5c 00        nop     
2a5d 00        nop     
2a5e 00        nop     
2a5f 00        nop     
2a60 00        nop     
2a61 00        nop     
2a62 00        nop     
2a63 00        nop     
2a64 00        nop     
2a65 00        nop     
2a66 00        nop     
2a67 00        nop     
2a68 00        nop     
2a69 00        nop     
2a6a 00        nop     
2a6b 00        nop     
2a6c 00        nop     
2a6d 00        nop     
2a6e 00        nop     
2a6f 00        nop     
2a70 00        nop     
2a71 00        nop     
2a72 00        nop     
2a73 00        nop     
2a74 00        nop     
2a75 00        nop     
2a76 00        nop     
2a77 00        nop     
2a78 00        nop     
2a79 00        nop     
2a7a 00        nop     
2a7b 00        nop     
2a7c 00        nop     
2a7d 00        nop     
2a7e 00        nop     
2a7f 00        nop     
2a80 00        nop     
2a81 00        nop     
2a82 00        nop     
2a83 00        nop     
2a84 00        nop     
2a85 00        nop     
2a86 00        nop     
2a87 00        nop     
2a88 00        nop     
2a89 00        nop     
2a8a 00        nop     
2a8b 00        nop     
2a8c 00        nop     
2a8d 00        nop     
2a8e 00        nop     
2a8f 00        nop     
2a90 00        nop     
2a91 00        nop     
2a92 00        nop     
2a93 00        nop     
2a94 00        nop     
2a95 00        nop     
2a96 00        nop     
2a97 00        nop     
2a98 00        nop     
2a99 00        nop     
2a9a 00        nop     
2a9b 00        nop     
2a9c 00        nop     
2a9d 00        nop     
2a9e 00        nop     
2a9f 00        nop     
2aa0 00        nop     
2aa1 00        nop     
2aa2 00        nop     
2aa3 00        nop     
2aa4 00        nop     
2aa5 00        nop     
2aa6 00        nop     
2aa7 00        nop     
2aa8 00        nop     
2aa9 00        nop     
2aaa 00        nop     
2aab 00        nop     
2aac 00        nop     
2aad 00        nop     
2aae 00        nop     
2aaf 00        nop     
2ab0 00        nop     
2ab1 00        nop     
2ab2 00        nop     
2ab3 00        nop     
2ab4 00        nop     
2ab5 00        nop     
2ab6 00        nop     
2ab7 00        nop     
2ab8 00        nop     
2ab9 00        nop     
2aba 00        nop     
2abb 00        nop     
2abc 00        nop     
2abd 00        nop     
2abe 00        nop     
2abf 00        nop     
2ac0 00        nop     
2ac1 00        nop     
2ac2 00        nop     
2ac3 00        nop     
2ac4 00        nop     
2ac5 00        nop     
2ac6 00        nop     
2ac7 00        nop     
2ac8 00        nop     
2ac9 7e        ld      a,(hl)
2aca fe03      cp      $03
2acc d2242b    jp      nc,$2b24
2acf 323f2b    ld      ($2b3f),a
2ad2 00        nop     
2ad3 87        add     a,a
2ad4 87        add     a,a
2ad5 87        add     a,a
2ad6 5f        ld      e,a
2ad7 1600      ld      d,$00
2ad9 d5        push    de
2ada 21648c    ld      hl,$8c64
2add 19        add     hl,de
2ade 11702b    ld      de,$2b70
2ae1 cd262b    call    $2b26
2ae4 d1        pop     de
2ae5 217c8c    ld      hl,$8c7c
2ae8 19        add     hl,de
2ae9 11782b    ld      de,$2b78
2aec cd262b    call    $2b26
2aef 21948c    ld      hl,$8c94
2af2 11802b    ld      de,$2b80
2af5 cd262b    call    $2b26
2af8 219c8c    ld      hl,$8c9c
2afb 11882b    ld      de,$2b88
2afe cd262b    call    $2b26
2b01 3a3f2b    ld      a,($2b3f)
2b04 21402b    ld      hl,$2b40
2b07 fe00      cp      $00
2b09 ca172b    jp      z,$2b17
2b0c 21502b    ld      hl,$2b50
2b0f fe01      cp      $01
2b11 ca172b    jp      z,$2b17
2b14 21602b    ld      hl,$2b60
2b17 e5        push    hl
2b18 cd7c75    call    $757c
2b1b e1        pop     hl
2b1c 110800    ld      de,$0008
2b1f 19        add     hl,de
2b20 cd7c75    call    $757c
2b23 c9        ret     

2b24 af        xor     a
2b25 c9        ret     

2b26 0608      ld      b,$08
2b28 7e        ld      a,(hl)
2b29 12        ld      (de),a
2b2a 23        inc     hl
2b2b 13        inc     de
2b2c 05        dec     b
2b2d c2282b    jp      nz,$2b28
2b30 c9        ret     

2b31 3a3f2b    ld      a,($2b3f)
2b34 77        ld      (hl),a
2b35 23        inc     hl
2b36 3600      ld      (hl),$00
2b38 c9        ret     

2b39 c3d37e    jp      $7ed3
2b3c c3777e    jp      $7e77
2b3f 00        nop     
2b40 49        ld      c,c
2b41 4f        ld      c,a
2b42 50        ld      d,b
2b43 41        ld      b,c
2b44 4b        ld      c,e
2b45 3020      jr      nc,$2b67
2b47 2053      jr      nz,$2b9c
2b49 43        ld      b,e
2b4a 52        ld      d,d
2b4b 45        ld      b,l
2b4c 45        ld      b,l
2b4d 4e        ld      c,(hl)
2b4e 2020      jr      nz,$2b70
2b50 49        ld      c,c
2b51 4f        ld      c,a
2b52 50        ld      d,b
2b53 41        ld      b,c
2b54 4b        ld      c,e
2b55 312020    ld      sp,$2020
2b58 50        ld      d,b
2b59 4c        ld      c,h
2b5a 4f        ld      c,a
2b5b 54        ld      d,h
2b5c 54        ld      d,h
2b5d 45        ld      b,l
2b5e 52        ld      d,d
2b5f 2049      jr      nz,$2baa
2b61 4f        ld      c,a
2b62 50        ld      d,b
2b63 41        ld      b,c
2b64 4b        ld      c,e
2b65 322020    ld      ($2020),a
2b68 50        ld      d,b
2b69 52        ld      d,d
2b6a 49        ld      c,c
2b6b 4e        ld      c,(hl)
2b6c 54        ld      d,h
2b6d 45        ld      b,l
2b6e 52        ld      d,d
2b6f 2000      jr      nz,$2b71
2b71 00        nop     
2b72 00        nop     
2b73 00        nop     
2b74 00        nop     
2b75 00        nop     
2b76 00        nop     
2b77 00        nop     
2b78 00        nop     
2b79 00        nop     
2b7a 00        nop     
2b7b 00        nop     
2b7c 00        nop     
2b7d 00        nop     
2b7e 00        nop     
2b7f 00        nop     
2b80 00        nop     
2b81 00        nop     
2b82 00        nop     
2b83 00        nop     
2b84 00        nop     
2b85 00        nop     
2b86 00        nop     
2b87 00        nop     
2b88 08        ex      af,af'
2b89 0c        inc     c
2b8a 0b        dec     bc
2b8b 0a        ld      a,(bc)
2b8c 2000      jr      nz,$2b8e
2b8e 00        nop     
2b8f 00        nop     
2b90 01962b    ld      bc,$2b96
2b93 c3c081    jp      $81c0
2b96 cdaa01    call    $01aa
2b99 cd6731    call    $3167
2b9c af        xor     a
2b9d 320998    ld      ($9809),a
2ba0 3e07      ld      a,$07
2ba2 328582    ld      ($8285),a
2ba5 c3d22b    jp      $2bd2
2ba8 218582    ld      hl,$8285
2bab cdc201    call    $01c2
2bae 328b82    ld      ($828b),a
2bb1 b7        or      a
2bb2 c2d22b    jp      nz,$2bd2
2bb5 cd4435    call    $3544
2bb8 3ac697    ld      a,($97c6)
2bbb b7        or      a
2bbc c2c22b    jp      nz,$2bc2
2bbf c3a82b    jp      $2ba8
2bc2 218582    ld      hl,$8285
2bc5 cdc201    call    $01c2
2bc8 328b82    ld      ($828b),a
2bcb b7        or      a
2bcc c2d22b    jp      nz,$2bd2
2bcf c3c22b    jp      $2bc2
2bd2 3ad397    ld      a,($97d3)
2bd5 32d597    ld      ($97d5),a
2bd8 cd5d36    call    $365d
2bdb 3a8582    ld      a,($8285)
2bde d61b      sub     $1b
2be0 d601      sub     $01
2be2 9f        sbc     a,a
2be3 328b82    ld      ($828b),a
2be6 b7        or      a
2be7 c21c2c    jp      nz,$2c1c
2bea 118982    ld      de,$8289
2bed 218582    ld      hl,$8285
2bf0 cdac31    call    $31ac
2bf3 328b82    ld      ($828b),a
2bf6 b7        or      a
2bf7 c2a82b    jp      nz,$2ba8
2bfa 210100    ld      hl,$0001
2bfd 228c82    ld      ($828c),hl
2c00 118482    ld      de,$8284
2c03 218582    ld      hl,$8285
2c06 cd5802    call    $0258
2c09 2a8c82    ld      hl,($828c)
2c0c 23        inc     hl
2c0d eb        ex      de,hl
2c0e 2a8982    ld      hl,($8289)
2c11 eb        ex      de,hl
2c12 7b        ld      a,e
2c13 95        sub     l
2c14 7a        ld      a,d
2c15 9c        sbc     a,h
2c16 f2fd2b    jp      p,$2bfd
2c19 c3252c    jp      $2c25
2c1c cd9f30    call    $309f
2c1f 218482    ld      hl,$8284
2c22 cd3e01    call    $013e
2c25 3a8482    ld      a,($8284)
2c28 d601      sub     $01
2c2a 9f        sbc     a,a
2c2b 328b82    ld      ($828b),a
2c2e b7        or      a
2c2f c26e2c    jp      nz,$2c6e
2c32 3a8482    ld      a,($8284)
2c35 d602      sub     $02
2c37 d601      sub     $01
2c39 9f        sbc     a,a
2c3a 328b82    ld      ($828b),a
2c3d b7        or      a
2c3e c25c2c    jp      nz,$2c5c
2c41 3a8482    ld      a,($8284)
2c44 d603      sub     $03
2c46 d601      sub     $01
2c48 9f        sbc     a,a
2c49 328b82    ld      ($828b),a
2c4c b7        or      a
2c4d c27a2c    jp      nz,$2c7a
2c50 219b2c    ld      hl,$2c9b
2c53 cdbd3a    call    $3abd
2c56 cd3736    call    $3637
2c59 c36e2c    jp      $2c6e
2c5c 219d2c    ld      hl,$2c9d
2c5f cdbd3a    call    $3abd
2c62 cd3736    call    $3637
2c65 cd9532    call    $3295
2c68 cd5d36    call    $365d
2c6b cd9939    call    $3999
2c6e cd6731    call    $3167
2c71 3ad397    ld      a,($97d3)
2c74 32d597    ld      ($97d5),a
2c77 c3a82b    jp      $2ba8
2c7a 21972c    ld      hl,$2c97
2c7d cd4602    call    $0246
2c80 2f        cpl     
2c81 328b82    ld      ($828b),a
2c84 b7        or      a
2c85 c2a82b    jp      nz,$2ba8
2c88 cd3736    call    $3637
2c8b cdda01    call    $01da
2c8e cde403    call    $03e4
2c91 cd7a01    call    $017a
2c94 cd2882    call    $8228
2c97 00        nop     
2c98 00        nop     
2c99 00        nop     
2c9a 00        nop     
2c9b 00        nop     
2c9c 00        nop     
2c9d ff        rst     $38
2c9e ff        rst     $38
2c9f 228f82    ld      ($828f),hl
2ca2 eb        ex      de,hl
2ca3 229182    ld      ($8291),hl
2ca6 60        ld      h,b
2ca7 69        ld      l,c
2ca8 229382    ld      ($8293),hl
2cab 117b97    ld      de,$977b
2cae 217597    ld      hl,$9775
2cb1 cd722e    call    $2e72
2cb4 329982    ld      ($8299),a
2cb7 b7        or      a
2cb8 c2f02c    jp      nz,$2cf0
2cbb 2a9382    ld      hl,($8293)
2cbe 229a82    ld      ($829a),hl
2cc1 019a82    ld      bc,$829a
2cc4 117597    ld      de,$9775
2cc7 2a9182    ld      hl,($8291)
2cca cd6736    call    $3667
2ccd 2a7597    ld      hl,($9775)
2cd0 23        inc     hl
2cd1 227597    ld      ($9775),hl
2cd4 3ad397    ld      a,($97d3)
2cd7 d616      sub     $16
2cd9 17        rla     
2cda 9f        sbc     a,a
2cdb 329982    ld      ($8299),a
2cde b7        or      a
2cdf cae92c    jp      z,$2ce9
2ce2 3ad397    ld      a,($97d3)
2ce5 3c        inc     a
2ce6 32d397    ld      ($97d3),a
2ce9 cd5d36    call    $365d
2cec cd9939    call    $3999
2cef c9        ret     

2cf0 3eff      ld      a,$ff
2cf2 2a8f82    ld      hl,($828f)
2cf5 77        ld      (hl),a
2cf6 c9        ret     

2cf7 22a782    ld      ($82a7),hl
2cfa eb        ex      de,hl
2cfb 22a982    ld      ($82a9),hl
2cfe 2aa782    ld      hl,($82a7)
2d01 7e        ld      a,(hl)
2d02 23        inc     hl
2d03 66        ld      h,(hl)
2d04 6f        ld      l,a
2d05 eb        ex      de,hl
2d06 2aa982    ld      hl,($82a9)
2d09 7e        ld      a,(hl)
2d0a 23        inc     hl
2d0b 66        ld      h,(hl)
2d0c 6f        ld      l,a
2d0d 7b        ld      a,e
2d0e 95        sub     l
2d0f 6f        ld      l,a
2d10 7a        ld      a,d
2d11 9c        sbc     a,h
2d12 67        ld      h,a
2d13 7d        ld      a,l
2d14 07        rlca    
2d15 b5        or      l
2d16 e67f      and     $7f
2d18 b4        or      h
2d19 d601      sub     $01
2d1b 9f        sbc     a,a
2d1c 329f82    ld      ($829f),a
2d1f c9        ret     

2d20 22b482    ld      ($82b4),hl
2d23 2ab482    ld      hl,($82b4)
2d26 7e        ld      a,(hl)
2d27 23        inc     hl
2d28 66        ld      h,(hl)
2d29 6f        ld      l,a
2d2a 7d        ld      a,l
2d2b 07        rlca    
2d2c b5        or      l
2d2d e67f      and     $7f
2d2f b4        or      h
2d30 d601      sub     $01
2d32 9f        sbc     a,a
2d33 32ac82    ld      ($82ac),a
2d36 c9        ret     

2d37 22b782    ld      ($82b7),hl
2d3a eb        ex      de,hl
2d3b 22b982    ld      ($82b9),hl
2d3e 60        ld      h,b
2d3f 69        ld      l,c
2d40 22bb82    ld      ($82bb),hl
2d43 2ab982    ld      hl,($82b9)
2d46 7e        ld      a,(hl)
2d47 23        inc     hl
2d48 66        ld      h,(hl)
2d49 6f        ld      l,a
2d4a 22bd82    ld      ($82bd),hl
2d4d 21bd82    ld      hl,$82bd
2d50 cd902f    call    $2f90
2d53 32c882    ld      ($82c8),a
2d56 b7        or      a
2d57 ca662d    jp      z,$2d66
2d5a 2abd82    ld      hl,($82bd)
2d5d af        xor     a
2d5e 95        sub     l
2d5f 6f        ld      l,a
2d60 9c        sbc     a,h
2d61 95        sub     l
2d62 67        ld      h,a
2d63 22bd82    ld      ($82bd),hl
2d66 2abb82    ld      hl,($82bb)
2d69 7e        ld      a,(hl)
2d6a 32c482    ld      ($82c4),a
2d6d 2abb82    ld      hl,($82bb)
2d70 eb        ex      de,hl
2d71 2ab782    ld      hl,($82b7)
2d74 cda33a    call    $3aa3
2d77 3e01      ld      a,$01
2d79 32c382    ld      ($82c3),a
2d7c 2abd82    ld      hl,($82bd)
2d7f eb        ex      de,hl
2d80 210a00    ld      hl,$000a
2d83 cd777e    call    $7e77
2d86 22bf82    ld      ($82bf),hl
2d89 eb        ex      de,hl
2d8a 210a00    ld      hl,$000a
2d8d cdd37e    call    $7ed3
2d90 eb        ex      de,hl
2d91 2abd82    ld      hl,($82bd)
2d94 7b        ld      a,e
2d95 95        sub     l
2d96 6f        ld      l,a
2d97 7a        ld      a,d
2d98 9c        sbc     a,h
2d99 67        ld      h,a
2d9a af        xor     a
2d9b 95        sub     l
2d9c 6f        ld      l,a
2d9d 9c        sbc     a,h
2d9e 95        sub     l
2d9f 67        ld      h,a
2da0 22c182    ld      ($82c1),hl
2da3 3ac482    ld      a,($82c4)
2da6 6f        ld      l,a
2da7 17        rla     
2da8 9f        sbc     a,a
2da9 67        ld      h,a
2daa eb        ex      de,hl
2dab 21ffff    ld      hl,$ffff
2dae 19        add     hl,de
2daf eb        ex      de,hl
2db0 2ab782    ld      hl,($82b7)
2db3 19        add     hl,de
2db4 22c982    ld      ($82c9),hl
2db7 2ac182    ld      hl,($82c1)
2dba 113000    ld      de,$0030
2dbd 19        add     hl,de
2dbe 7d        ld      a,l
2dbf 2ac982    ld      hl,($82c9)
2dc2 77        ld      (hl),a
2dc3 2abf82    ld      hl,($82bf)
2dc6 22bd82    ld      ($82bd),hl
2dc9 3ac482    ld      a,($82c4)
2dcc 3d        dec     a
2dcd 32c482    ld      ($82c4),a
2dd0 21bd82    ld      hl,$82bd
2dd3 cd202d    call    $2d20
2dd6 32c882    ld      ($82c8),a
2dd9 b7        or      a
2dda c2f72d    jp      nz,$2df7
2ddd 3ac382    ld      a,($82c3)
2de0 2abb82    ld      hl,($82bb)
2de3 be        cp      (hl)
2de4 3c        inc     a
2de5 da792d    jp      c,$2d79
2de8 2abb82    ld      hl,($82bb)
2deb 44        ld      b,h
2dec 4d        ld      c,l
2ded 112e2e    ld      de,$2e2e
2df0 2ab782    ld      hl,($82b7)
2df3 cd993a    call    $3a99
2df6 c9        ret     

2df7 2ab982    ld      hl,($82b9)
2dfa cd5b2e    call    $2e5b
2dfd 32c882    ld      ($82c8),a
2e00 b7        or      a
2e01 ca052e    jp      z,$2e05
2e04 c9        ret     

2e05 3ac482    ld      a,($82c4)
2e08 3d        dec     a
2e09 c681      add     a,$81
2e0b 9f        sbc     a,a
2e0c 32c882    ld      ($82c8),a
2e0f b7        or      a
2e10 c2e82d    jp      nz,$2de8
2e13 3ac482    ld      a,($82c4)
2e16 6f        ld      l,a
2e17 17        rla     
2e18 9f        sbc     a,a
2e19 67        ld      h,a
2e1a eb        ex      de,hl
2e1b 21ffff    ld      hl,$ffff
2e1e 19        add     hl,de
2e1f eb        ex      de,hl
2e20 2ab782    ld      hl,($82b7)
2e23 19        add     hl,de
2e24 22c982    ld      ($82c9),hl
2e27 3e2d      ld      a,$2d
2e29 2ac982    ld      hl,($82c9)
2e2c 77        ld      (hl),a
2e2d c9        ret     

2e2e 23        inc     hl
2e2f 00        nop     
2e30 00        nop     
2e31 00        nop     
2e32 22d482    ld      ($82d4),hl
2e35 eb        ex      de,hl
2e36 22d682    ld      ($82d6),hl
2e39 2ad482    ld      hl,($82d4)
2e3c 7e        ld      a,(hl)
2e3d 23        inc     hl
2e3e 66        ld      h,(hl)
2e3f 6f        ld      l,a
2e40 eb        ex      de,hl
2e41 2ad682    ld      hl,($82d6)
2e44 7e        ld      a,(hl)
2e45 23        inc     hl
2e46 66        ld      h,(hl)
2e47 6f        ld      l,a
2e48 7b        ld      a,e
2e49 95        sub     l
2e4a 6f        ld      l,a
2e4b 7a        ld      a,d
2e4c 9c        sbc     a,h
2e4d 67        ld      h,a
2e4e 7d        ld      a,l
2e4f 07        rlca    
2e50 b5        or      l
2e51 e67f      and     $7f
2e53 b4        or      h
2e54 17        rla     
2e55 3f        ccf     
2e56 9f        sbc     a,a
2e57 32cc82    ld      ($82cc),a
2e5a c9        ret     

2e5b 22e182    ld      ($82e1),hl
2e5e 2ae182    ld      hl,($82e1)
2e61 7e        ld      a,(hl)
2e62 23        inc     hl
2e63 66        ld      h,(hl)
2e64 6f        ld      l,a
2e65 7d        ld      a,l
2e66 07        rlca    
2e67 b5        or      l
2e68 e67f      and     $7f
2e6a b4        or      h
2e6b 17        rla     
2e6c 3f        ccf     
2e6d 9f        sbc     a,a
2e6e 32d982    ld      ($82d9),a
2e71 c9        ret     

2e72 22ec82    ld      ($82ec),hl
2e75 eb        ex      de,hl
2e76 22ee82    ld      ($82ee),hl
2e79 2aec82    ld      hl,($82ec)
2e7c 7e        ld      a,(hl)
2e7d 23        inc     hl
2e7e 66        ld      h,(hl)
2e7f 6f        ld      l,a
2e80 eb        ex      de,hl
2e81 2aee82    ld      hl,($82ee)
2e84 7e        ld      a,(hl)
2e85 23        inc     hl
2e86 66        ld      h,(hl)
2e87 6f        ld      l,a
2e88 7b        ld      a,e
2e89 95        sub     l
2e8a 6f        ld      l,a
2e8b 7a        ld      a,d
2e8c 9c        sbc     a,h
2e8d 67        ld      h,a
2e8e 7d        ld      a,l
2e8f 07        rlca    
2e90 b5        or      l
2e91 e67f      and     $7f
2e93 b4        or      h
2e94 3d        dec     a
2e95 d67f      sub     $7f
2e97 9f        sbc     a,a
2e98 32e482    ld      ($82e4),a
2e9b c9        ret     

2e9c 22f982    ld      ($82f9),hl
2e9f 2af982    ld      hl,($82f9)
2ea2 7e        ld      a,(hl)
2ea3 23        inc     hl
2ea4 66        ld      h,(hl)
2ea5 6f        ld      l,a
2ea6 7d        ld      a,l
2ea7 07        rlca    
2ea8 b5        or      l
2ea9 e67f      and     $7f
2eab b4        or      h
2eac 3d        dec     a
2ead d67f      sub     $7f
2eaf 9f        sbc     a,a
2eb0 32f182    ld      ($82f1),a
2eb3 c9        ret     

2eb4 220483    ld      ($8304),hl
2eb7 eb        ex      de,hl
2eb8 220683    ld      ($8306),hl
2ebb 2a0483    ld      hl,($8304)
2ebe 7e        ld      a,(hl)
2ebf 23        inc     hl
2ec0 66        ld      h,(hl)
2ec1 6f        ld      l,a
2ec2 eb        ex      de,hl
2ec3 2a0683    ld      hl,($8306)
2ec6 7e        ld      a,(hl)
2ec7 23        inc     hl
2ec8 66        ld      h,(hl)
2ec9 6f        ld      l,a
2eca 7b        ld      a,e
2ecb 95        sub     l
2ecc 6f        ld      l,a
2ecd 7a        ld      a,d
2ece 9c        sbc     a,h
2ecf 67        ld      h,a
2ed0 7d        ld      a,l
2ed1 07        rlca    
2ed2 b5        or      l
2ed3 e67f      and     $7f
2ed5 b4        or      h
2ed6 3d        dec     a
2ed7 c681      add     a,$81
2ed9 9f        sbc     a,a
2eda 32fc82    ld      ($82fc),a
2edd c9        ret     

2ede 221183    ld      ($8311),hl
2ee1 3e50      ld      a,$50
2ee3 320983    ld      ($8309),a
2ee6 3e01      ld      a,$01
2ee8 321383    ld      ($8313),a
2eeb 3a0983    ld      a,($8309)
2eee 6f        ld      l,a
2eef 17        rla     
2ef0 9f        sbc     a,a
2ef1 67        ld      h,a
2ef2 eb        ex      de,hl
2ef3 21ffff    ld      hl,$ffff
2ef6 19        add     hl,de
2ef7 eb        ex      de,hl
2ef8 2a1183    ld      hl,($8311)
2efb 19        add     hl,de
2efc 7e        ld      a,(hl)
2efd d620      sub     $20
2eff c6ff      add     a,$ff
2f01 9f        sbc     a,a
2f02 321483    ld      ($8314),a
2f05 b7        or      a
2f06 ca0d2f    jp      z,$2f0d
2f09 3a0983    ld      a,($8309)
2f0c c9        ret     

2f0d 3a0983    ld      a,($8309)
2f10 3d        dec     a
2f11 320983    ld      ($8309),a
2f14 3a1383    ld      a,($8313)
2f17 3c        inc     a
2f18 fe51      cp      $51
2f1a fae82e    jp      m,$2ee8
2f1d 3a0983    ld      a,($8309)
2f20 c9        ret     

2f21 221e83    ld      ($831e),hl
2f24 2a1e83    ld      hl,($831e)
2f27 7e        ld      a,(hl)
2f28 23        inc     hl
2f29 66        ld      h,(hl)
2f2a 6f        ld      l,a
2f2b 7d        ld      a,l
2f2c 07        rlca    
2f2d b5        or      l
2f2e e67f      and     $7f
2f30 b4        or      h
2f31 3d        dec     a
2f32 c681      add     a,$81
2f34 9f        sbc     a,a
2f35 321683    ld      ($8316),a
2f38 c9        ret     

2f39 222183    ld      ($8321),hl
2f3c 2a2183    ld      hl,($8321)
2f3f 7e        ld      a,(hl)
2f40 d65a      sub     $5a
2f42 3d        dec     a
2f43 d67f      sub     $7f
2f45 9f        sbc     a,a
2f46 322383    ld      ($8323),a
2f49 2a2183    ld      hl,($8321)
2f4c 7e        ld      a,(hl)
2f4d d641      sub     $41
2f4f 17        rla     
2f50 9f        sbc     a,a
2f51 212383    ld      hl,$8323
2f54 b6        or      (hl)
2f55 322483    ld      ($8324),a
2f58 b7        or      a
2f59 ca5d2f    jp      z,$2f5d
2f5c c9        ret     

2f5d 2a2183    ld      hl,($8321)
2f60 7e        ld      a,(hl)
2f61 c620      add     a,$20
2f63 2a2183    ld      hl,($8321)
2f66 77        ld      (hl),a
2f67 c9        ret     

2f68 222e83    ld      ($832e),hl
2f6b eb        ex      de,hl
2f6c 223083    ld      ($8330),hl
2f6f 2a2e83    ld      hl,($832e)
2f72 7e        ld      a,(hl)
2f73 23        inc     hl
2f74 66        ld      h,(hl)
2f75 6f        ld      l,a
2f76 eb        ex      de,hl
2f77 2a3083    ld      hl,($8330)
2f7a 7e        ld      a,(hl)
2f7b 23        inc     hl
2f7c 66        ld      h,(hl)
2f7d 6f        ld      l,a
2f7e 7b        ld      a,e
2f7f 95        sub     l
2f80 6f        ld      l,a
2f81 7a        ld      a,d
2f82 9c        sbc     a,h
2f83 67        ld      h,a
2f84 7d        ld      a,l
2f85 07        rlca    
2f86 b5        or      l
2f87 e67f      and     $7f
2f89 b4        or      h
2f8a 17        rla     
2f8b 9f        sbc     a,a
2f8c 322683    ld      ($8326),a
2f8f c9        ret     

2f90 223b83    ld      ($833b),hl
2f93 2a3b83    ld      hl,($833b)
2f96 7e        ld      a,(hl)
2f97 23        inc     hl
2f98 66        ld      h,(hl)
2f99 6f        ld      l,a
2f9a 7d        ld      a,l
2f9b 07        rlca    
2f9c b5        or      l
2f9d e67f      and     $7f
2f9f b4        or      h
2fa0 17        rla     
2fa1 9f        sbc     a,a
2fa2 323383    ld      ($8333),a
2fa5 c9        ret     

2fa6 223e83    ld      ($833e),hl
2fa9 3e32      ld      a,$32
2fab 324183    ld      ($8341),a
2fae 3e01      ld      a,$01
2fb0 324283    ld      ($8342),a
2fb3 3a4283    ld      a,($8342)
2fb6 6f        ld      l,a
2fb7 17        rla     
2fb8 9f        sbc     a,a
2fb9 67        ld      h,a
2fba eb        ex      de,hl
2fbb 21ffff    ld      hl,$ffff
2fbe 19        add     hl,de
2fbf eb        ex      de,hl
2fc0 2a3e83    ld      hl,($833e)
2fc3 19        add     hl,de
2fc4 7e        ld      a,(hl)
2fc5 324083    ld      ($8340),a
2fc8 d621      sub     $21
2fca d601      sub     $01
2fcc 9f        sbc     a,a
2fcd 324483    ld      ($8344),a
2fd0 b7        or      a
2fd1 c2fa2f    jp      nz,$2ffa
2fd4 3a4183    ld      a,($8341)
2fd7 119899    ld      de,$9998
2fda 6f        ld      l,a
2fdb 17        rla     
2fdc 9f        sbc     a,a
2fdd 67        ld      h,a
2fde 19        add     hl,de
2fdf 224583    ld      ($8345),hl
2fe2 3a4083    ld      a,($8340)
2fe5 2a4583    ld      hl,($8345)
2fe8 77        ld      (hl),a
2fe9 3a4183    ld      a,($8341)
2fec 3c        inc     a
2fed 324183    ld      ($8341),a
2ff0 3a4283    ld      a,($8342)
2ff3 3c        inc     a
2ff4 324283    ld      ($8342),a
2ff7 c3b32f    jp      $2fb3
2ffa 3a0998    ld      a,($9809)
2ffd 3d        dec     a
2ffe d67f      sub     $7f
3000 9f        sbc     a,a
3001 324483    ld      ($8344),a
3004 3a4283    ld      a,($8342)
3007 d605      sub     $05
3009 3d        dec     a
300a d67f      sub     $7f
300c 9f        sbc     a,a
300d 214483    ld      hl,$8344
3010 a6        and     (hl)
3011 324783    ld      ($8347),a
3014 b7        or      a
3015 ca1f30    jp      z,$301f
3018 3a0998    ld      a,($9809)
301b 3d        dec     a
301c 320998    ld      ($9809),a
301f 3a4283    ld      a,($8342)
3022 3d        dec     a
3023 c6ff      add     a,$ff
3025 9f        sbc     a,a
3026 324483    ld      ($8344),a
3029 b7        or      a
302a ca3330    jp      z,$3033
302d 217230    ld      hl,$3072
3030 cdbb73    call    $73bb
3033 3a4183    ld      a,($8341)
3036 d64f      sub     $4f
3038 3d        dec     a
3039 d67f      sub     $7f
303b 9f        sbc     a,a
303c 324483    ld      ($8344),a
303f b7        or      a
3040 c26130    jp      nz,$3061
3043 3a4183    ld      a,($8341)
3046 119899    ld      de,$9998
3049 6f        ld      l,a
304a 17        rla     
304b 9f        sbc     a,a
304c 67        ld      h,a
304d 19        add     hl,de
304e 224583    ld      ($8345),hl
3051 3e20      ld      a,$20
3053 2a4583    ld      hl,($8345)
3056 77        ld      (hl),a
3057 3a4183    ld      a,($8341)
305a 3c        inc     a
305b 324183    ld      ($8341),a
305e c33330    jp      $3033
3061 014383    ld      bc,$8343
3064 116e30    ld      de,$306e
3067 219999    ld      hl,$9999
306a cd7a33    call    $337a
306d c9        ret     

306e 17        rla     
306f 00        nop     
3070 00        nop     
3071 00        nop     
3072 07        rlca    
3073 00        nop     
3074 00        nop     
3075 00        nop     
3076 225183    ld      ($8351),hl
3079 eb        ex      de,hl
307a 225383    ld      ($8353),hl
307d 2a5183    ld      hl,($8351)
3080 7e        ld      a,(hl)
3081 23        inc     hl
3082 66        ld      h,(hl)
3083 6f        ld      l,a
3084 eb        ex      de,hl
3085 2a5383    ld      hl,($8353)
3088 7e        ld      a,(hl)
3089 23        inc     hl
308a 66        ld      h,(hl)
308b 6f        ld      l,a
308c 7b        ld      a,e
308d 95        sub     l
308e 6f        ld      l,a
308f 7a        ld      a,d
3090 9c        sbc     a,h
3091 67        ld      h,a
3092 7d        ld      a,l
3093 07        rlca    
3094 b5        or      l
3095 e67f      and     $7f
3097 b4        or      h
3098 c6ff      add     a,$ff
309a 9f        sbc     a,a
309b 324983    ld      ($8349),a
309e c9        ret     

309f 215683    ld      hl,$8356
30a2 cda62f    call    $2fa6
30a5 c9        ret     

30a6 225883    ld      ($8358),hl
30a9 eb        ex      de,hl
30aa 225a83    ld      ($835a),hl
30ad 2a5a83    ld      hl,($835a)
30b0 7e        ld      a,(hl)
30b1 6f        ld      l,a
30b2 17        rla     
30b3 9f        sbc     a,a
30b4 67        ld      h,a
30b5 eb        ex      de,hl
30b6 21ffff    ld      hl,$ffff
30b9 19        add     hl,de
30ba eb        ex      de,hl
30bb 2a5883    ld      hl,($8358)
30be 19        add     hl,de
30bf 7e        ld      a,(hl)
30c0 d620      sub     $20
30c2 c6ff      add     a,$ff
30c4 9f        sbc     a,a
30c5 325c83    ld      ($835c),a
30c8 b7        or      a
30c9 cacd30    jp      z,$30cd
30cc c9        ret     

30cd 2a5a83    ld      hl,($835a)
30d0 7e        ld      a,(hl)
30d1 3c        inc     a
30d2 2a5a83    ld      hl,($835a)
30d5 77        ld      (hl),a
30d6 7e        ld      a,(hl)
30d7 d650      sub     $50
30d9 3d        dec     a
30da d67f      sub     $7f
30dc 9f        sbc     a,a
30dd 325c83    ld      ($835c),a
30e0 b7        or      a
30e1 cae530    jp      z,$30e5
30e4 c9        ret     

30e5 c3ad30    jp      $30ad
30e8 225e83    ld      ($835e),hl
30eb eb        ex      de,hl
30ec 226083    ld      ($8360),hl
30ef 2a5e83    ld      hl,($835e)
30f2 7e        ld      a,(hl)
30f3 23        inc     hl
30f4 66        ld      h,(hl)
30f5 6f        ld      l,a
30f6 226283    ld      ($8362),hl
30f9 2a6083    ld      hl,($8360)
30fc 7e        ld      a,(hl)
30fd 23        inc     hl
30fe 66        ld      h,(hl)
30ff 6f        ld      l,a
3100 eb        ex      de,hl
3101 2a5e83    ld      hl,($835e)
3104 73        ld      (hl),e
3105 23        inc     hl
3106 72        ld      (hl),d
3107 2a6283    ld      hl,($8362)
310a eb        ex      de,hl
310b 2a6083    ld      hl,($8360)
310e 73        ld      (hl),e
310f 23        inc     hl
3110 72        ld      (hl),d
3111 c9        ret     

3112 226583    ld      ($8365),hl
3115 eb        ex      de,hl
3116 226783    ld      ($8367),hl
3119 2a6583    ld      hl,($8365)
311c 7e        ld      a,(hl)
311d 326983    ld      ($8369),a
3120 2a6783    ld      hl,($8367)
3123 7e        ld      a,(hl)
3124 2a6583    ld      hl,($8365)
3127 77        ld      (hl),a
3128 3a6983    ld      a,($8369)
312b 2a6783    ld      hl,($8367)
312e 77        ld      (hl),a
312f c9        ret     

3130 226b83    ld      ($836b),hl
3133 2a6b83    ld      hl,($836b)
3136 7e        ld      a,(hl)
3137 d67a      sub     $7a
3139 3d        dec     a
313a d67f      sub     $7f
313c 9f        sbc     a,a
313d 326d83    ld      ($836d),a
3140 2a6b83    ld      hl,($836b)
3143 7e        ld      a,(hl)
3144 d661      sub     $61
3146 17        rla     
3147 9f        sbc     a,a
3148 216d83    ld      hl,$836d
314b b6        or      (hl)
314c 326e83    ld      ($836e),a
314f b7        or      a
3150 ca5431    jp      z,$3154
3153 c9        ret     

3154 2a6b83    ld      hl,($836b)
3157 7e        ld      a,(hl)
3158 6f        ld      l,a
3159 17        rla     
315a 9f        sbc     a,a
315b 67        ld      h,a
315c eb        ex      de,hl
315d 21e0ff    ld      hl,$ffe0
3160 19        add     hl,de
3161 7d        ld      a,l
3162 2a6b83    ld      hl,($836b)
3165 77        ld      (hl),a
3166 c9        ret     

3167 01a831    ld      bc,$31a8
316a 117597    ld      de,$9775
316d 21a199    ld      hl,$99a1
3170 cd372d    call    $2d37
3173 3ad297    ld      a,($97d2)
3176 6f        ld      l,a
3177 17        rla     
3178 9f        sbc     a,a
3179 67        ld      h,a
317a 227083    ld      ($8370),hl
317d 01a431    ld      bc,$31a4
3180 117083    ld      de,$8370
3183 21a899    ld      hl,$99a8
3186 cd372d    call    $2d37
3189 3a0598    ld      a,($9805)
318c 6f        ld      l,a
318d 17        rla     
318e 9f        sbc     a,a
318f 67        ld      h,a
3190 227083    ld      ($8370),hl
3193 01a031    ld      bc,$31a0
3196 117083    ld      de,$8370
3199 21ad99    ld      hl,$99ad
319c cd372d    call    $2d37
319f c9        ret     

31a0 010000    ld      bc,$0000
31a3 00        nop     
31a4 03        inc     bc
31a5 00        nop     
31a6 00        nop     
31a7 00        nop     
31a8 0600      ld      b,$00
31aa 00        nop     
31ab 00        nop     
31ac 227b83    ld      ($837b),hl
31af eb        ex      de,hl
31b0 227d83    ld      ($837d),hl
31b3 af        xor     a
31b4 327383    ld      ($8373),a
31b7 3a8183    ld      a,($8381)
31ba b7        or      a
31bb c20032    jp      nz,$3200
31be 210100    ld      hl,$0001
31c1 eb        ex      de,hl
31c2 2a7d83    ld      hl,($837d)
31c5 73        ld      (hl),e
31c6 23        inc     hl
31c7 72        ld      (hl),d
31c8 2a7b83    ld      hl,($837b)
31cb 7e        ld      a,(hl)
31cc d615      sub     $15
31ce c6ff      add     a,$ff
31d0 9f        sbc     a,a
31d1 328383    ld      ($8383),a
31d4 b7        or      a
31d5 cadc31    jp      z,$31dc
31d8 3a7383    ld      a,($8373)
31db c9        ret     

31dc 219132    ld      hl,$3291
31df cdbb73    call    $73bb
31e2 3eff      ld      a,$ff
31e4 327383    ld      ($8373),a
31e7 3eff      ld      a,$ff
31e9 328183    ld      ($8381),a
31ec 210400    ld      hl,$0004
31ef 227f83    ld      ($837f),hl
31f2 210000    ld      hl,$0000
31f5 eb        ex      de,hl
31f6 2a7d83    ld      hl,($837d)
31f9 73        ld      (hl),e
31fa 23        inc     hl
31fb 72        ld      (hl),d
31fc 3a7383    ld      a,($8373)
31ff c9        ret     

3200 3eff      ld      a,$ff
3202 327383    ld      ($8373),a
3205 219132    ld      hl,$3291
3208 cdbb73    call    $73bb
320b 2a7b83    ld      hl,($837b)
320e 7e        ld      a,(hl)
320f d615      sub     $15
3211 c6ff      add     a,$ff
3213 9f        sbc     a,a
3214 328383    ld      ($8383),a
3217 b7        or      a
3218 c22732    jp      nz,$3227
321b 2a7f83    ld      hl,($837f)
321e 29        add     hl,hl
321f 29        add     hl,hl
3220 227f83    ld      ($837f),hl
3223 3a7383    ld      a,($8373)
3226 c9        ret     

3227 2a7b83    ld      hl,($837b)
322a 7e        ld      a,(hl)
322b d639      sub     $39
322d 3d        dec     a
322e d67f      sub     $7f
3230 9f        sbc     a,a
3231 328383    ld      ($8383),a
3234 2a7b83    ld      hl,($837b)
3237 7e        ld      a,(hl)
3238 d630      sub     $30
323a 17        rla     
323b 9f        sbc     a,a
323c 218383    ld      hl,$8383
323f b6        or      (hl)
3240 328483    ld      ($8384),a
3243 b7        or      a
3244 c26e32    jp      nz,$326e
3247 2a7d83    ld      hl,($837d)
324a 7e        ld      a,(hl)
324b 23        inc     hl
324c 66        ld      h,(hl)
324d 6f        ld      l,a
324e eb        ex      de,hl
324f 210a00    ld      hl,$000a
3252 cdd37e    call    $7ed3
3255 11d0ff    ld      de,$ffd0
3258 19        add     hl,de
3259 eb        ex      de,hl
325a 2a7b83    ld      hl,($837b)
325d 7e        ld      a,(hl)
325e 6f        ld      l,a
325f 17        rla     
3260 9f        sbc     a,a
3261 67        ld      h,a
3262 19        add     hl,de
3263 eb        ex      de,hl
3264 2a7d83    ld      hl,($837d)
3267 73        ld      (hl),e
3268 23        inc     hl
3269 72        ld      (hl),d
326a 3a7383    ld      a,($8373)
326d c9        ret     

326e 2a7d83    ld      hl,($837d)
3271 cd202d    call    $2d20
3274 328383    ld      ($8383),a
3277 b7        or      a
3278 ca8532    jp      z,$3285
327b 2a7f83    ld      hl,($837f)
327e eb        ex      de,hl
327f 2a7d83    ld      hl,($837d)
3282 73        ld      (hl),e
3283 23        inc     hl
3284 72        ld      (hl),d
3285 af        xor     a
3286 327383    ld      ($8373),a
3289 af        xor     a
328a 328183    ld      ($8381),a
328d 3a7383    ld      a,($8373)
3290 c9        ret     

3291 07        rlca    
3292 00        nop     
3293 00        nop     
3294 00        nop     
3295 217597    ld      hl,$9775
3298 cd212f    call    $2f21
329b 328a83    ld      ($838a),a
329e b7        or      a
329f caa832    jp      z,$32a8
32a2 210100    ld      hl,$0001
32a5 227597    ld      ($9775),hl
32a8 117997    ld      de,$9779
32ab 217597    ld      hl,$9775
32ae cd722e    call    $2e72
32b1 328a83    ld      ($838a),a
32b4 b7        or      a
32b5 cabe32    jp      z,$32be
32b8 2a7997    ld      hl,($9779)
32bb 227597    ld      ($9775),hl
32be 211600    ld      hl,$0016
32c1 eb        ex      de,hl
32c2 3ad397    ld      a,($97d3)
32c5 6f        ld      l,a
32c6 17        rla     
32c7 9f        sbc     a,a
32c8 67        ld      h,a
32c9 7b        ld      a,e
32ca 95        sub     l
32cb 6f        ld      l,a
32cc 7a        ld      a,d
32cd 9c        sbc     a,h
32ce 67        ld      h,a
32cf eb        ex      de,hl
32d0 2a7597    ld      hl,($9775)
32d3 19        add     hl,de
32d4 228683    ld      ($8386),hl
32d7 117997    ld      de,$9779
32da 218683    ld      hl,$8386
32dd cd722e    call    $2e72
32e0 328a83    ld      ($838a),a
32e3 b7        or      a
32e4 cafd32    jp      z,$32fd
32e7 211600    ld      hl,$0016
32ea eb        ex      de,hl
32eb 2a7997    ld      hl,($9779)
32ee 7b        ld      a,e
32ef 95        sub     l
32f0 6f        ld      l,a
32f1 7a        ld      a,d
32f2 9c        sbc     a,h
32f3 67        ld      h,a
32f4 eb        ex      de,hl
32f5 2a7597    ld      hl,($9775)
32f8 19        add     hl,de
32f9 7d        ld      a,l
32fa 32d397    ld      ($97d3),a
32fd 210100    ld      hl,$0001
3300 eb        ex      de,hl
3301 3ad397    ld      a,($97d3)
3304 6f        ld      l,a
3305 17        rla     
3306 9f        sbc     a,a
3307 67        ld      h,a
3308 7b        ld      a,e
3309 95        sub     l
330a 6f        ld      l,a
330b 7a        ld      a,d
330c 9c        sbc     a,h
330d 67        ld      h,a
330e eb        ex      de,hl
330f 2a7597    ld      hl,($9775)
3312 19        add     hl,de
3313 228683    ld      ($8386),hl
3316 218683    ld      hl,$8386
3319 cd212f    call    $2f21
331c 328a83    ld      ($838a),a
331f b7        or      a
3320 ca2933    jp      z,$3329
3323 3a7597    ld      a,($9775)
3326 32d397    ld      ($97d3),a
3329 c9        ret     

332a cde773    call    $73e7
332d c9        ret     

332e 3ad297    ld      a,($97d2)
3331 d650      sub     $50
3333 328e83    ld      ($838e),a
3336 b7        or      a
3337 ca4733    jp      z,$3347
333a f25a33    jp      p,$335a
333d 11d297    ld      de,$97d2
3340 21d397    ld      hl,$97d3
3343 cdb839    call    $39b8
3346 c9        ret     

3347 217597    ld      hl,$9775
334a cdfd36    call    $36fd
334d d650      sub     $50
334f 3d        dec     a
3350 c681      add     a,$81
3352 9f        sbc     a,a
3353 328e83    ld      ($838e),a
3356 b7        or      a
3357 c23d33    jp      nz,$333d
335a 3ad397    ld      a,($97d3)
335d 3c        inc     a
335e 328e83    ld      ($838e),a
3361 3ad297    ld      a,($97d2)
3364 6f        ld      l,a
3365 17        rla     
3366 9f        sbc     a,a
3367 67        ld      h,a
3368 eb        ex      de,hl
3369 21b1ff    ld      hl,$ffb1
336c 19        add     hl,de
336d 228f83    ld      ($838f),hl
3370 118f83    ld      de,$838f
3373 218e83    ld      hl,$838e
3376 cdb839    call    $39b8
3379 c9        ret     

337a 229283    ld      ($8392),hl
337d eb        ex      de,hl
337e 229483    ld      ($8394),hl
3381 60        ld      h,b
3382 69        ld      l,c
3383 229683    ld      ($8396),hl
3386 af        xor     a
3387 2a9683    ld      hl,($8396)
338a 77        ld      (hl),a
338b 3e50      ld      a,$50
338d 329983    ld      ($8399),a
3390 2a9483    ld      hl,($8394)
3393 7e        ld      a,(hl)
3394 6f        ld      l,a
3395 17        rla     
3396 9f        sbc     a,a
3397 67        ld      h,a
3398 cd347e    call    $7e34
339b 219c83    ld      hl,$839c
339e cd437c    call    $7c43
33a1 d601      sub     $01
33a3 9f        sbc     a,a
33a4 32a083    ld      ($83a0),a
33a7 b7        or      a
33a8 cab233    jp      z,$33b2
33ab 3a9983    ld      a,($8399)
33ae 3d        dec     a
33af 329983    ld      ($8399),a
33b2 3e01      ld      a,$01
33b4 329b83    ld      ($839b),a
33b7 3a9b83    ld      a,($839b)
33ba 329a83    ld      ($839a),a
33bd 3a9a83    ld      a,($839a)
33c0 32a083    ld      ($83a0),a
33c3 6f        ld      l,a
33c4 17        rla     
33c5 9f        sbc     a,a
33c6 67        ld      h,a
33c7 eb        ex      de,hl
33c8 21ffff    ld      hl,$ffff
33cb 19        add     hl,de
33cc eb        ex      de,hl
33cd 2a9283    ld      hl,($8392)
33d0 19        add     hl,de
33d1 22a183    ld      ($83a1),hl
33d4 2a9483    ld      hl,($8394)
33d7 7e        ld      a,(hl)
33d8 6f        ld      l,a
33d9 17        rla     
33da 9f        sbc     a,a
33db 67        ld      h,a
33dc eb        ex      de,hl
33dd 215000    ld      hl,$0050
33e0 cdd37e    call    $7ed3
33e3 eb        ex      de,hl
33e4 3aa083    ld      a,($83a0)
33e7 6f        ld      l,a
33e8 17        rla     
33e9 9f        sbc     a,a
33ea 67        ld      h,a
33eb 19        add     hl,de
33ec 11389a    ld      de,$9a38
33ef 19        add     hl,de
33f0 22a383    ld      ($83a3),hl
33f3 2aa183    ld      hl,($83a1)
33f6 7e        ld      a,(hl)
33f7 2aa383    ld      hl,($83a3)
33fa 96        sub     (hl)
33fb c6ff      add     a,$ff
33fd 9f        sbc     a,a
33fe 32a583    ld      ($83a5),a
3401 b7        or      a
3402 c21134    jp      nz,$3411
3405 3a9a83    ld      a,($839a)
3408 219983    ld      hl,$8399
340b be        cp      (hl)
340c 3c        inc     a
340d daba33    jp      c,$33ba
3410 c9        ret     

3411 119a83    ld      de,$839a
3414 2a9483    ld      hl,($8394)
3417 cdb839    call    $39b8
341a 3a9a83    ld      a,($839a)
341d 6f        ld      l,a
341e 17        rla     
341f 9f        sbc     a,a
3420 67        ld      h,a
3421 eb        ex      de,hl
3422 21ffff    ld      hl,$ffff
3425 19        add     hl,de
3426 eb        ex      de,hl
3427 2a9283    ld      hl,($8392)
342a 19        add     hl,de
342b 7e        ld      a,(hl)
342c 329883    ld      ($8398),a
342f 219883    ld      hl,$8398
3432 cdbb73    call    $73bb
3435 3a9a83    ld      a,($839a)
3438 32a083    ld      ($83a0),a
343b 2a9483    ld      hl,($8394)
343e 7e        ld      a,(hl)
343f 6f        ld      l,a
3440 17        rla     
3441 9f        sbc     a,a
3442 67        ld      h,a
3443 eb        ex      de,hl
3444 215000    ld      hl,$0050
3447 cdd37e    call    $7ed3
344a eb        ex      de,hl
344b 3aa083    ld      a,($83a0)
344e 6f        ld      l,a
344f 17        rla     
3450 9f        sbc     a,a
3451 67        ld      h,a
3452 19        add     hl,de
3453 11389a    ld      de,$9a38
3456 19        add     hl,de
3457 22a183    ld      ($83a1),hl
345a 3a9883    ld      a,($8398)
345d 2aa183    ld      hl,($83a1)
3460 77        ld      (hl),a
3461 3eff      ld      a,$ff
3463 2a9683    ld      hl,($8396)
3466 77        ld      (hl),a
3467 3a9a83    ld      a,($839a)
346a 3c        inc     a
346b 329a83    ld      ($839a),a
346e 219983    ld      hl,$8399
3471 96        sub     (hl)
3472 3d        dec     a
3473 d67f      sub     $7f
3475 9f        sbc     a,a
3476 32a583    ld      ($83a5),a
3479 b7        or      a
347a c23935    jp      nz,$3539
347d 3a9a83    ld      a,($839a)
3480 32a083    ld      ($83a0),a
3483 6f        ld      l,a
3484 17        rla     
3485 9f        sbc     a,a
3486 67        ld      h,a
3487 eb        ex      de,hl
3488 21ffff    ld      hl,$ffff
348b 19        add     hl,de
348c eb        ex      de,hl
348d 2a9283    ld      hl,($8392)
3490 19        add     hl,de
3491 22a183    ld      ($83a1),hl
3494 2a9483    ld      hl,($8394)
3497 7e        ld      a,(hl)
3498 6f        ld      l,a
3499 17        rla     
349a 9f        sbc     a,a
349b 67        ld      h,a
349c eb        ex      de,hl
349d 215000    ld      hl,$0050
34a0 cdd37e    call    $7ed3
34a3 eb        ex      de,hl
34a4 3aa083    ld      a,($83a0)
34a7 6f        ld      l,a
34a8 17        rla     
34a9 9f        sbc     a,a
34aa 67        ld      h,a
34ab 19        add     hl,de
34ac 11389a    ld      de,$9a38
34af 19        add     hl,de
34b0 22a383    ld      ($83a3),hl
34b3 2aa183    ld      hl,($83a1)
34b6 7e        ld      a,(hl)
34b7 2aa383    ld      hl,($83a3)
34ba 96        sub     (hl)
34bb c6ff      add     a,$ff
34bd 9f        sbc     a,a
34be 32a583    ld      ($83a5),a
34c1 b7        or      a
34c2 c21a34    jp      nz,$341a
34c5 3a9a83    ld      a,($839a)
34c8 3c        inc     a
34c9 329a83    ld      ($839a),a
34cc 219983    ld      hl,$8399
34cf 96        sub     (hl)
34d0 3d        dec     a
34d1 d67f      sub     $7f
34d3 9f        sbc     a,a
34d4 32a083    ld      ($83a0),a
34d7 b7        or      a
34d8 c23935    jp      nz,$3539
34db 3a9a83    ld      a,($839a)
34de 32a083    ld      ($83a0),a
34e1 6f        ld      l,a
34e2 17        rla     
34e3 9f        sbc     a,a
34e4 67        ld      h,a
34e5 eb        ex      de,hl
34e6 21ffff    ld      hl,$ffff
34e9 19        add     hl,de
34ea eb        ex      de,hl
34eb 2a9283    ld      hl,($8392)
34ee 19        add     hl,de
34ef 22a183    ld      ($83a1),hl
34f2 2a9483    ld      hl,($8394)
34f5 7e        ld      a,(hl)
34f6 6f        ld      l,a
34f7 17        rla     
34f8 9f        sbc     a,a
34f9 67        ld      h,a
34fa eb        ex      de,hl
34fb 215000    ld      hl,$0050
34fe cdd37e    call    $7ed3
3501 eb        ex      de,hl
3502 3aa083    ld      a,($83a0)
3505 6f        ld      l,a
3506 17        rla     
3507 9f        sbc     a,a
3508 67        ld      h,a
3509 19        add     hl,de
350a 11389a    ld      de,$9a38
350d 19        add     hl,de
350e 22a383    ld      ($83a3),hl
3511 2aa183    ld      hl,($83a1)
3514 7e        ld      a,(hl)
3515 2aa383    ld      hl,($83a3)
3518 96        sub     (hl)
3519 c6ff      add     a,$ff
351b 9f        sbc     a,a
351c 32a583    ld      ($83a5),a
351f b7        or      a
3520 c23a35    jp      nz,$353a
3523 3a9a83    ld      a,($839a)
3526 3c        inc     a
3527 329b83    ld      ($839b),a
352a 219983    ld      hl,$8399
352d 96        sub     (hl)
352e 3d        dec     a
352f c681      add     a,$81
3531 9f        sbc     a,a
3532 32a083    ld      ($83a0),a
3535 b7        or      a
3536 c2b733    jp      nz,$33b7
3539 c9        ret     

353a 3a9a83    ld      a,($839a)
353d 3d        dec     a
353e 329a83    ld      ($839a),a
3541 c31a34    jp      $341a
3544 cd2e33    call    $332e
3547 3ad597    ld      a,($97d5)
354a 32a783    ld      ($83a7),a
354d 3aa783    ld      a,($83a7)
3550 d617      sub     $17
3552 d601      sub     $01
3554 9f        sbc     a,a
3555 32fe83    ld      ($83fe),a
3558 b7        or      a
3559 c21936    jp      nz,$3619
355c 3aa783    ld      a,($83a7)
355f d618      sub     $18
3561 d601      sub     $01
3563 9f        sbc     a,a
3564 32fe83    ld      ($83fe),a
3567 b7        or      a
3568 c22836    jp      nz,$3628
356b 2a7597    ld      hl,($9775)
356e eb        ex      de,hl
356f 3ad397    ld      a,($97d3)
3572 6f        ld      l,a
3573 17        rla     
3574 9f        sbc     a,a
3575 67        ld      h,a
3576 7b        ld      a,e
3577 95        sub     l
3578 6f        ld      l,a
3579 7a        ld      a,d
357a 9c        sbc     a,h
357b 67        ld      h,a
357c eb        ex      de,hl
357d 3aa783    ld      a,($83a7)
3580 6f        ld      l,a
3581 17        rla     
3582 9f        sbc     a,a
3583 67        ld      h,a
3584 19        add     hl,de
3585 22aa83    ld      ($83aa),hl
3588 11aa83    ld      de,$83aa
358b 21ac83    ld      hl,$83ac
358e cd4836    call    $3648
3591 01a883    ld      bc,$83a8
3594 11a783    ld      de,$83a7
3597 21ac83    ld      hl,$83ac
359a cd7a33    call    $337a
359d 3aa883    ld      a,($83a8)
35a0 b7        or      a
35a1 caa735    jp      z,$35a7
35a4 cd2e33    call    $332e
35a7 21a983    ld      hl,$83a9
35aa cd8873    call    $7388
35ad 3aa983    ld      a,($83a9)
35b0 b7        or      a
35b1 c2ed35    jp      nz,$35ed
35b4 3aa783    ld      a,($83a7)
35b7 3c        inc     a
35b8 32a783    ld      ($83a7),a
35bb d618      sub     $18
35bd 3d        dec     a
35be d67f      sub     $7f
35c0 9f        sbc     a,a
35c1 32fe83    ld      ($83fe),a
35c4 b7        or      a
35c5 cacd35    jp      z,$35cd
35c8 3e01      ld      a,$01
35ca 32a783    ld      ($83a7),a
35cd 3aa783    ld      a,($83a7)
35d0 21d597    ld      hl,$97d5
35d3 96        sub     (hl)
35d4 c6ff      add     a,$ff
35d6 9f        sbc     a,a
35d7 32fe83    ld      ($83fe),a
35da b7        or      a
35db c24d35    jp      nz,$354d
35de 3ad397    ld      a,($97d3)
35e1 32a783    ld      ($83a7),a
35e4 3eff      ld      a,$ff
35e6 32c697    ld      ($97c6),a
35e9 cd2e33    call    $332e
35ec c9        ret     

35ed af        xor     a
35ee 32c697    ld      ($97c6),a
35f1 3aa783    ld      a,($83a7)
35f4 3c        inc     a
35f5 32d597    ld      ($97d5),a
35f8 6f        ld      l,a
35f9 17        rla     
35fa 9f        sbc     a,a
35fb 67        ld      h,a
35fc cd347e    call    $7e34
35ff 21ff83    ld      hl,$83ff
3602 cd437c    call    $7c43
3605 3d        dec     a
3606 d67f      sub     $7f
3608 9f        sbc     a,a
3609 32fe83    ld      ($83fe),a
360c b7        or      a
360d ca1536    jp      z,$3615
3610 3e01      ld      a,$01
3612 32d597    ld      ($97d5),a
3615 cd2e33    call    $332e
3618 c9        ret     

3619 01a883    ld      bc,$83a8
361c 11a783    ld      de,$83a7
361f 219999    ld      hl,$9999
3622 cd7a33    call    $337a
3625 c39d35    jp      $359d
3628 01a883    ld      bc,$83a8
362b 11a783    ld      de,$83a7
362e 21e999    ld      hl,$99e9
3631 cd7a33    call    $337a
3634 c39d35    jp      $359d
3637 114436    ld      de,$3644
363a 21899a    ld      hl,$9a89
363d cda83a    call    $3aa8
3640 cd2a33    call    $332a
3643 c9        ret     

3644 80        add     a,b
3645 07        rlca    
3646 00        nop     
3647 00        nop     
3648 220784    ld      ($8407),hl
364b eb        ex      de,hl
364c 220984    ld      ($8409),hl
364f 010f84    ld      bc,$840f
3652 2a0984    ld      hl,($8409)
3655 eb        ex      de,hl
3656 2a0784    ld      hl,($8407)
3659 cd6736    call    $3667
365c c9        ret     

365d 117597    ld      de,$9775
3660 214999    ld      hl,$9949
3663 cd4836    call    $3648
3666 c9        ret     

3667 221584    ld      ($8415),hl
366a eb        ex      de,hl
366b 221784    ld      ($8417),hl
366e 3e02      ld      a,$02
3670 211984    ld      hl,$8419
3673 cdbb80    call    $80bb
3676 af        xor     a
3677 2a1984    ld      hl,($8419)
367a 77        ld      (hl),a
367b 11f536    ld      de,$36f5
367e 2a1584    ld      hl,($8415)
3681 cda33a    call    $3aa3
3684 117997    ld      de,$9779
3687 2a1784    ld      hl,($8417)
368a cd722e    call    $2e72
368d 322684    ld      ($8426),a
3690 2a1784    ld      hl,($8417)
3693 cd212f    call    $2f21
3696 212684    ld      hl,$8426
3699 b6        or      (hl)
369a 322784    ld      ($8427),a
369d b7        or      a
369e caa236    jp      z,$36a2
36a1 c9        ret     

36a2 2a1784    ld      hl,($8417)
36a5 eb        ex      de,hl
36a6 212084    ld      hl,$8420
36a9 cd1839    call    $3918
36ac 3a1298    ld      a,($9812)
36af 320b98    ld      ($980b),a
36b2 01f936    ld      bc,$36f9
36b5 112084    ld      de,$8420
36b8 2a1b84    ld      hl,($841b)
36bb cd6801    call    $0168
36be 2a1b84    ld      hl,($841b)
36c1 cdd237    call    $37d2
36c4 322684    ld      ($8426),a
36c7 b7        or      a
36c8 cacc36    jp      z,$36cc
36cb c9        ret     

36cc 3a1398    ld      a,($9813)
36cf 320b98    ld      ($980b),a
36d2 210300    ld      hl,$0003
36d5 eb        ex      de,hl
36d6 2a1b84    ld      hl,($841b)
36d9 19        add     hl,de
36da 7e        ld      a,(hl)
36db 2a1984    ld      hl,($8419)
36de 77        ld      (hl),a
36df 7e        ld      a,(hl)
36e0 6f        ld      l,a
36e1 17        rla     
36e2 9f        sbc     a,a
36e3 67        ld      h,a
36e4 221d84    ld      ($841d),hl
36e7 011d84    ld      bc,$841d
36ea 2a1b84    ld      hl,($841b)
36ed eb        ex      de,hl
36ee 2a1584    ld      hl,($8415)
36f1 cd6801    call    $0168
36f4 c9        ret     

36f5 50        ld      d,b
36f6 00        nop     
36f7 00        nop     
36f8 00        nop     
36f9 04        inc     b
36fa 00        nop     
36fb 00        nop     
36fc 00        nop     
36fd 223184    ld      ($8431),hl
3700 117997    ld      de,$9779
3703 2a3184    ld      hl,($8431)
3706 cd722e    call    $2e72
3709 323884    ld      ($8438),a
370c 2a3184    ld      hl,($8431)
370f cd212f    call    $2f21
3712 213884    ld      hl,$8438
3715 b6        or      (hl)
3716 323984    ld      ($8439),a
3719 b7        or      a
371a c24637    jp      nz,$3746
371d 2a3184    ld      hl,($8431)
3720 eb        ex      de,hl
3721 213384    ld      hl,$8433
3724 cd1839    call    $3918
3727 114f37    ld      de,$374f
372a 213384    ld      hl,$8433
372d cd0c38    call    $380c
3730 3a1298    ld      a,($9812)
3733 320b98    ld      ($980b),a
3736 014b37    ld      bc,$374b
3739 113384    ld      de,$8433
373c 212984    ld      hl,$8429
373f cd6801    call    $0168
3742 3a2984    ld      a,($8429)
3745 c9        ret     

3746 af        xor     a
3747 322984    ld      ($8429),a
374a c9        ret     

374b 010000    ld      bc,$0000
374e 00        nop     
374f 03        inc     bc
3750 00        nop     
3751 00        nop     
3752 00        nop     
3753 223b84    ld      ($843b),hl
3756 eb        ex      de,hl
3757 223d84    ld      ($843d),hl
375a 016837    ld      bc,$3768
375d 2a3d84    ld      hl,($843d)
3760 eb        ex      de,hl
3761 2a3b84    ld      hl,($843b)
3764 cd573a    call    $3a57
3767 c9        ret     

3768 03        inc     bc
3769 00        nop     
376a 00        nop     
376b 00        nop     
376c 224884    ld      ($8448),hl
376f eb        ex      de,hl
3770 224a84    ld      ($844a),hl
3773 210100    ld      hl,$0001
3776 eb        ex      de,hl
3777 2a4884    ld      hl,($8448)
377a 19        add     hl,de
377b 224c84    ld      ($844c),hl
377e 210100    ld      hl,$0001
3781 eb        ex      de,hl
3782 2a4a84    ld      hl,($844a)
3785 19        add     hl,de
3786 224e84    ld      ($844e),hl
3789 210200    ld      hl,$0002
378c eb        ex      de,hl
378d 2a4884    ld      hl,($8448)
3790 19        add     hl,de
3791 225084    ld      ($8450),hl
3794 210200    ld      hl,$0002
3797 eb        ex      de,hl
3798 2a4a84    ld      hl,($844a)
379b 19        add     hl,de
379c 225284    ld      ($8452),hl
379f 2a5084    ld      hl,($8450)
37a2 7e        ld      a,(hl)
37a3 2a5284    ld      hl,($8452)
37a6 96        sub     (hl)
37a7 d601      sub     $01
37a9 9f        sbc     a,a
37aa 325484    ld      ($8454),a
37ad 2a4c84    ld      hl,($844c)
37b0 7e        ld      a,(hl)
37b1 2a4e84    ld      hl,($844e)
37b4 96        sub     (hl)
37b5 d601      sub     $01
37b7 9f        sbc     a,a
37b8 325584    ld      ($8455),a
37bb 2a4884    ld      hl,($8448)
37be 7e        ld      a,(hl)
37bf 2a4a84    ld      hl,($844a)
37c2 96        sub     (hl)
37c3 d601      sub     $01
37c5 9f        sbc     a,a
37c6 215584    ld      hl,$8455
37c9 a6        and     (hl)
37ca 215484    ld      hl,$8454
37cd a6        and     (hl)
37ce 324084    ld      ($8440),a
37d1 c9        ret     

37d2 225f84    ld      ($845f),hl
37d5 210100    ld      hl,$0001
37d8 eb        ex      de,hl
37d9 2a5f84    ld      hl,($845f)
37dc 19        add     hl,de
37dd 226184    ld      ($8461),hl
37e0 210200    ld      hl,$0002
37e3 eb        ex      de,hl
37e4 2a5f84    ld      hl,($845f)
37e7 19        add     hl,de
37e8 7e        ld      a,(hl)
37e9 d601      sub     $01
37eb 9f        sbc     a,a
37ec 326384    ld      ($8463),a
37ef 2a6184    ld      hl,($8461)
37f2 7e        ld      a,(hl)
37f3 d601      sub     $01
37f5 9f        sbc     a,a
37f6 326484    ld      ($8464),a
37f9 2a5f84    ld      hl,($845f)
37fc 7e        ld      a,(hl)
37fd d601      sub     $01
37ff 9f        sbc     a,a
3800 216484    ld      hl,$8464
3803 a6        and     (hl)
3804 216384    ld      hl,$8463
3807 a6        and     (hl)
3808 325784    ld      ($8457),a
380b c9        ret     

380c 226684    ld      ($8466),hl
380f eb        ex      de,hl
3810 226884    ld      ($8468),hl
3813 210000    ld      hl,$0000
3816 226a84    ld      ($846a),hl
3819 2a6684    ld      hl,($8466)
381c 7e        ld      a,(hl)
381d 326a84    ld      ($846a),a
3820 2a6a84    ld      hl,($846a)
3823 226c84    ld      ($846c),hl
3826 210100    ld      hl,$0001
3829 eb        ex      de,hl
382a 2a6684    ld      hl,($8466)
382d 19        add     hl,de
382e 7e        ld      a,(hl)
382f 326a84    ld      ($846a),a
3832 2a6a84    ld      hl,($846a)
3835 226e84    ld      ($846e),hl
3838 210200    ld      hl,$0002
383b eb        ex      de,hl
383c 2a6684    ld      hl,($8466)
383f 19        add     hl,de
3840 7e        ld      a,(hl)
3841 326a84    ld      ($846a),a
3844 2a6a84    ld      hl,($846a)
3847 227084    ld      ($8470),hl
384a 2a6884    ld      hl,($8468)
384d 7e        ld      a,(hl)
384e 326a84    ld      ($846a),a
3851 2a6a84    ld      hl,($846a)
3854 227284    ld      ($8472),hl
3857 210100    ld      hl,$0001
385a eb        ex      de,hl
385b 2a6884    ld      hl,($8468)
385e 19        add     hl,de
385f 227984    ld      ($8479),hl
3862 7e        ld      a,(hl)
3863 326a84    ld      ($846a),a
3866 2a6a84    ld      hl,($846a)
3869 227484    ld      ($8474),hl
386c 210000    ld      hl,$0000
386f 227684    ld      ($8476),hl
3872 2a7984    ld      hl,($8479)
3875 7e        ld      a,(hl)
3876 17        rla     
3877 9f        sbc     a,a
3878 327b84    ld      ($847b),a
387b b7        or      a
387c ca8538    jp      z,$3885
387f 21ff00    ld      hl,$00ff
3882 227684    ld      ($8476),hl
3885 2a7284    ld      hl,($8472)
3888 eb        ex      de,hl
3889 2a6c84    ld      hl,($846c)
388c 19        add     hl,de
388d 226c84    ld      ($846c),hl
3890 2a7484    ld      hl,($8474)
3893 eb        ex      de,hl
3894 2a6e84    ld      hl,($846e)
3897 19        add     hl,de
3898 226e84    ld      ($846e),hl
389b 2a7684    ld      hl,($8476)
389e eb        ex      de,hl
389f 2a7084    ld      hl,($8470)
38a2 19        add     hl,de
38a3 227084    ld      ($8470),hl
38a6 111439    ld      de,$3914
38a9 216c84    ld      hl,$846c
38ac cd682f    call    $2f68
38af 327b84    ld      ($847b),a
38b2 b7        or      a
38b3 c2c738    jp      nz,$38c7
38b6 2a6e84    ld      hl,($846e)
38b9 23        inc     hl
38ba 226e84    ld      ($846e),hl
38bd 2a6c84    ld      hl,($846c)
38c0 1100ff    ld      de,$ff00
38c3 19        add     hl,de
38c4 226c84    ld      ($846c),hl
38c7 111439    ld      de,$3914
38ca 216e84    ld      hl,$846e
38cd cd682f    call    $2f68
38d0 327b84    ld      ($847b),a
38d3 b7        or      a
38d4 c2e838    jp      nz,$38e8
38d7 2a7084    ld      hl,($8470)
38da 23        inc     hl
38db 227084    ld      ($8470),hl
38de 2a6e84    ld      hl,($846e)
38e1 1100ff    ld      de,$ff00
38e4 19        add     hl,de
38e5 226e84    ld      ($846e),hl
38e8 3a6c84    ld      a,($846c)
38eb 2a6684    ld      hl,($8466)
38ee 77        ld      (hl),a
38ef 210100    ld      hl,$0001
38f2 eb        ex      de,hl
38f3 2a6684    ld      hl,($8466)
38f6 19        add     hl,de
38f7 227984    ld      ($8479),hl
38fa 3a6e84    ld      a,($846e)
38fd 2a7984    ld      hl,($8479)
3900 77        ld      (hl),a
3901 210200    ld      hl,$0002
3904 eb        ex      de,hl
3905 2a6684    ld      hl,($8466)
3908 19        add     hl,de
3909 227c84    ld      ($847c),hl
390c 3a7084    ld      a,($8470)
390f 2a7c84    ld      hl,($847c)
3912 77        ld      (hl),a
3913 c9        ret     

3914 00        nop     
3915 010000    ld      bc,$0000
3918 227f84    ld      ($847f),hl
391b eb        ex      de,hl
391c 228184    ld      ($8481),hl
391f 113e39    ld      de,$393e
3922 2a7f84    ld      hl,($847f)
3925 cd4239    call    $3942
3928 2a8184    ld      hl,($8481)
392b 7e        ld      a,(hl)
392c 23        inc     hl
392d 66        ld      h,(hl)
392e 6f        ld      l,a
392f 29        add     hl,hl
3930 29        add     hl,hl
3931 228384    ld      ($8483),hl
3934 118384    ld      de,$8483
3937 2a7f84    ld      hl,($847f)
393a cd0c38    call    $380c
393d c9        ret     

393e 00        nop     
393f 02        ld      (bc),a
3940 00        nop     
3941 00        nop     
3942 228684    ld      ($8486),hl
3945 eb        ex      de,hl
3946 228884    ld      ($8488),hl
3949 2a8884    ld      hl,($8488)
394c 7e        ld      a,(hl)
394d 2a8684    ld      hl,($8486)
3950 77        ld      (hl),a
3951 210100    ld      hl,$0001
3954 eb        ex      de,hl
3955 2a8684    ld      hl,($8486)
3958 19        add     hl,de
3959 228a84    ld      ($848a),hl
395c 210100    ld      hl,$0001
395f eb        ex      de,hl
3960 2a8884    ld      hl,($8488)
3963 19        add     hl,de
3964 7e        ld      a,(hl)
3965 2a8a84    ld      hl,($848a)
3968 77        ld      (hl),a
3969 210200    ld      hl,$0002
396c eb        ex      de,hl
396d 2a8684    ld      hl,($8486)
3970 19        add     hl,de
3971 228c84    ld      ($848c),hl
3974 af        xor     a
3975 2a8c84    ld      hl,($848c)
3978 77        ld      (hl),a
3979 c9        ret     

397a 229784    ld      ($8497),hl
397d 2a9784    ld      hl,($8497)
3980 7e        ld      a,(hl)
3981 d604      sub     $04
3983 3d        dec     a
3984 c681      add     a,$81
3986 9f        sbc     a,a
3987 329984    ld      ($8499),a
398a 2a9784    ld      hl,($8497)
398d 7e        ld      a,(hl)
398e 17        rla     
398f 3f        ccf     
3990 9f        sbc     a,a
3991 219984    ld      hl,$8499
3994 a6        and     (hl)
3995 328f84    ld      ($848f),a
3998 c9        ret     

3999 01a639    ld      bc,$39a6
399c 114999    ld      de,$9949
399f 21399a    ld      hl,$9a39
39a2 cd573a    call    $3a57
39a5 c9        ret     

39a6 50        ld      d,b
39a7 00        nop     
39a8 00        nop     
39a9 00        nop     
39aa c9        ret     

39ab 7e        ld      a,(hl)
39ac 23        inc     hl
39ad 66        ld      h,(hl)
39ae 6f        ld      l,a
39af 7e        ld      a,(hl)
39b0 c9        ret     

39b1 7e        ld      a,(hl)
39b2 23        inc     hl
39b3 66        ld      h,(hl)
39b4 6f        ld      l,a
39b5 1a        ld      a,(de)
39b6 77        ld      (hl),a
39b7 c9        ret     

39b8 7e        ld      a,(hl)
39b9 eb        ex      de,hl
39ba 5e        ld      e,(hl)
39bb 57        ld      d,a
39bc cd0474    call    $7404
39bf c9        ret     

39c0 0e19      ld      c,$19
39c2 cd0500    call    $0005
39c5 f5        push    af
39c6 0e0d      ld      c,$0d
39c8 cd0500    call    $0005
39cb f1        pop     af
39cc 5f        ld      e,a
39cd 1600      ld      d,$00
39cf 0e0e      ld      c,$0e
39d1 c30500    jp      $0005
39d4 c9        ret     

39d5 c9        ret     

39d6 0e0f      ld      c,$0f
39d8 eb        ex      de,hl
39d9 e5        push    hl
39da cd0500    call    $0005
39dd e1        pop     hl
39de 77        ld      (hl),a
39df c9        ret     

39e0 0e10      ld      c,$10
39e2 c3d839    jp      $39d8
39e5 0e11      ld      c,$11
39e7 c3d839    jp      $39d8
39ea 0e12      ld      c,$12
39ec c3d839    jp      $39d8
39ef 0e11      ld      c,$11
39f1 c3d839    jp      $39d8
39f4 0e12      ld      c,$12
39f6 c3d839    jp      $39d8
39f9 0e13      ld      c,$13
39fb eb        ex      de,hl
39fc c30500    jp      $0005
39ff 0e14      ld      c,$14
3a01 c3d839    jp      $39d8
3a04 0e21      ld      c,$21
3a06 c3d839    jp      $39d8
3a09 0e22      ld      c,$22
3a0b c3d839    jp      $39d8
3a0e 0e15      ld      c,$15
3a10 c3d839    jp      $39d8
3a13 0e16      ld      c,$16
3a15 c3d839    jp      $39d8
3a18 0e17      ld      c,$17
3a1a c3d839    jp      $39d8
3a1d 0e18      ld      c,$18
3a1f e5        push    hl
3a20 cd0500    call    $0005
3a23 e1        pop     hl
3a24 77        ld      (hl),a
3a25 c9        ret     

3a26 0e1a      ld      c,$1a
3a28 eb        ex      de,hl
3a29 c30500    jp      $0005
3a2c 7e        ld      a,(hl)
3a2d 23        inc     hl
3a2e 66        ld      h,(hl)
3a2f 6f        ld      l,a
3a30 c3263a    jp      $3a26
3a33 0e19      ld      c,$19
3a35 c31f3a    jp      $3a1f
3a38 e5        push    hl
3a39 60        ld      h,b
3a3a 69        ld      l,c
3a3b 4e        ld      c,(hl)
3a3c 23        inc     hl
3a3d 46        ld      b,(hl)
3a3e e1        pop     hl
3a3f eb        ex      de,hl
3a40 cd4e3a    call    $3a4e
3a43 78        ld      a,b
3a44 b1        or      c
3a45 c8        ret     z

3a46 7e        ld      a,(hl)
3a47 12        ld      (de),a
3a48 23        inc     hl
3a49 13        inc     de
3a4a 0b        dec     bc
3a4b c3433a    jp      $3a43
3a4e f5        push    af
3a4f 78        ld      a,b
3a50 b1        or      c
3a51 c2553a    jp      nz,$3a55
3a54 f1        pop     af
3a55 f1        pop     af
3a56 c9        ret     

3a57 e5        push    hl
3a58 60        ld      h,b
3a59 69        ld      l,c
3a5a 4e        ld      c,(hl)
3a5b 0600      ld      b,$00
3a5d c33e3a    jp      $3a3e
3a60 e5        push    hl
3a61 60        ld      h,b
3a62 69        ld      l,c
3a63 4e        ld      c,(hl)
3a64 23        inc     hl
3a65 46        ld      b,(hl)
3a66 e1        pop     hl
3a67 cd4e3a    call    $3a4e
3a6a 09        add     hl,bc
3a6b 2b        dec     hl
3a6c eb        ex      de,hl
3a6d 09        add     hl,bc
3a6e 2b        dec     hl
3a6f 78        ld      a,b
3a70 b1        or      c
3a71 c8        ret     z

3a72 7e        ld      a,(hl)
3a73 12        ld      (de),a
3a74 2b        dec     hl
3a75 1b        dec     de
3a76 0b        dec     bc
3a77 c36f3a    jp      $3a6f
3a7a e5        push    hl
3a7b 60        ld      h,b
3a7c 69        ld      l,c
3a7d 4e        ld      c,(hl)
3a7e 0600      ld      b,$00
3a80 c3663a    jp      $3a66
3a83 1a        ld      a,(de)
3a84 50        ld      d,b
3a85 59        ld      e,c
3a86 eb        ex      de,hl
3a87 4e        ld      c,(hl)
3a88 23        inc     hl
3a89 46        ld      b,(hl)
3a8a 62        ld      h,d
3a8b 6b        ld      l,e
3a8c cd4e3a    call    $3a4e
3a8f 0b        dec     bc
3a90 13        inc     de
3a91 77        ld      (hl),a
3a92 cd4e3a    call    $3a4e
3a95 cd433a    call    $3a43
3a98 c9        ret     

3a99 1a        ld      a,(de)
3a9a 50        ld      d,b
3a9b 59        ld      e,c
3a9c eb        ex      de,hl
3a9d 4e        ld      c,(hl)
3a9e 0600      ld      b,$00
3aa0 c38a3a    jp      $3a8a
3aa3 3e20      ld      a,$20
3aa5 c39c3a    jp      $3a9c
3aa8 3e20      ld      a,$20
3aaa c3863a    jp      $3a86
3aad eb        ex      de,hl
3aae 2a0600    ld      hl,($0006)
3ab1 eb        ex      de,hl
3ab2 c3b83a    jp      $3ab8
3ab5 11bc3a    ld      de,$3abc
3ab8 73        ld      (hl),e
3ab9 23        inc     hl
3aba 72        ld      (hl),d
3abb c9        ret     

3abc 00        nop     
3abd 229c84    ld      ($849c),hl
3ac0 2a9c84    ld      hl,($849c)
3ac3 7e        ld      a,(hl)
3ac4 323e8c    ld      ($8c3e),a
3ac7 3a9e84    ld      a,($849e)
3aca 2f        cpl     
3acb 32a484    ld      ($84a4),a
3ace b7        or      a
3acf c2f83a    jp      nz,$3af8
3ad2 cdbb05    call    $05bb
3ad5 af        xor     a
3ad6 329e84    ld      ($849e),a
3ad9 cd5907    call    $0759
3adc cd5604    call    $0456
3adf 21b13b    ld      hl,$3bb1
3ae2 cd1942    call    $4219
3ae5 21b53b    ld      hl,$3bb5
3ae8 cdaf71    call    $71af
3aeb 32a484    ld      ($84a4),a
3aee b7        or      a
3aef c27e3b    jp      nz,$3b7e
3af2 cdd46a    call    $6ad4
3af5 cdb001    call    $01b0
3af8 3a3e8c    ld      a,($8c3e)
3afb 2a9c84    ld      hl,($849c)
3afe ae        xor     (hl)
3aff 32a484    ld      ($84a4),a
3b02 b7        or      a
3b03 c29a3b    jp      nz,$3b9a
3b06 3ab68d    ld      a,($8db6)
3b09 b7        or      a
3b0a ca133b    jp      z,$3b13
3b0d 213a8c    ld      hl,$8c3a
3b10 cd956c    call    $6c95
3b13 cdbf3b    call    $3bbf
3b16 3ab48d    ld      a,($8db4)
3b19 b7        or      a
3b1a c2563b    jp      nz,$3b56
3b1d cd6e48    call    $486e
3b20 3a9f8d    ld      a,($8d9f)
3b23 d602      sub     $02
3b25 d601      sub     $01
3b27 9f        sbc     a,a
3b28 32a484    ld      ($84a4),a
3b2b b7        or      a
3b2c c2783b    jp      nz,$3b78
3b2f 3a9f8d    ld      a,($8d9f)
3b32 3d        dec     a
3b33 c6ff      add     a,$ff
3b35 9f        sbc     a,a
3b36 32a484    ld      ($84a4),a
3b39 b7        or      a
3b3a ca433b    jp      z,$3b43
3b3d 21b73b    ld      hl,$3bb7
3b40 cdcd71    call    $71cd
3b43 219d8d    ld      hl,$8d9d
3b46 cda63c    call    $3ca6
3b49 3ab38d    ld      a,($8db3)
3b4c b7        or      a
3b4d c2f83a    jp      nz,$3af8
3b50 21b73b    ld      hl,$3bb7
3b53 cdcd71    call    $71cd
3b56 3a3a8c    ld      a,($8c3a)
3b59 d601      sub     $01
3b5b 9f        sbc     a,a
3b5c 32a484    ld      ($84a4),a
3b5f b7        or      a
3b60 c29a3b    jp      nz,$3b9a
3b63 01bb3b    ld      bc,$3bbb
3b66 11a584    ld      de,$84a5
3b69 216657    ld      hl,$5766
3b6c cd6856    call    $5668
3b6f 219d8d    ld      hl,$8d9d
3b72 cda63c    call    $3ca6
3b75 c3f83a    jp      $3af8
3b78 cdc53f    call    $3fc5
3b7b c3f83a    jp      $3af8
3b7e af        xor     a
3b7f 323a8c    ld      ($8c3a),a
3b82 cd0b41    call    $410b
3b85 af        xor     a
3b86 323e8c    ld      ($8c3e),a
3b89 af        xor     a
3b8a 32bc8d    ld      ($8dbc),a
3b8d af        xor     a
3b8e 323b8c    ld      ($8c3b),a
3b91 210000    ld      hl,$0000
3b94 22a884    ld      ($84a8),hl
3b97 c3f83a    jp      $3af8
3b9a af        xor     a
3b9b 32b48d    ld      ($8db4),a
3b9e 2a9c84    ld      hl,($849c)
3ba1 7e        ld      a,(hl)
3ba2 b7        or      a
3ba3 caac3b    jp      z,$3bac
3ba6 219f84    ld      hl,$849f
3ba9 cd8f73    call    $738f
3bac c9        ret     

3bad cd6d5b    call    $5b6d
3bb0 c9        ret     

3bb1 0f        rrca    
3bb2 00        nop     
3bb3 00        nop     
3bb4 00        nop     
3bb5 ff        rst     $38
3bb6 ff        rst     $38
3bb7 1000      djnz    $3bb9
3bb9 00        nop     
3bba 00        nop     
3bbb 03        inc     bc
3bbc 00        nop     
3bbd 00        nop     
3bbe 00        nop     
3bbf af        xor     a
3bc0 32b38d    ld      ($8db3),a
3bc3 3e01      ld      a,$01
3bc5 321c8e    ld      ($8e1c),a
3bc8 3ab68d    ld      a,($8db6)
3bcb b7        or      a
3bcc c2fa3b    jp      nz,$3bfa
3bcf 3a3a8c    ld      a,($8c3a)
3bd2 d601      sub     $01
3bd4 9f        sbc     a,a
3bd5 213e8c    ld      hl,$8c3e
3bd8 a6        and     (hl)
3bd9 32ae84    ld      ($84ae),a
3bdc b7        or      a
3bdd c2953c    jp      nz,$3c95
3be0 3abc8d    ld      a,($8dbc)
3be3 2f        cpl     
3be4 32ae84    ld      ($84ae),a
3be7 b7        or      a
3be8 caf13b    jp      z,$3bf1
3beb 21af84    ld      hl,$84af
3bee cdbb73    call    $73bb
3bf1 21a43c    ld      hl,$3ca4
3bf4 cddf4b    call    $4bdf
3bf7 c3033c    jp      $3c03
3bfa cdc743    call    $43c7
3bfd 21b78d    ld      hl,$8db7
3c00 cddf4b    call    $4bdf
3c03 3ab48d    ld      a,($8db4)
3c06 b7        or      a
3c07 ca0b3c    jp      z,$3c0b
3c0a c9        ret     

3c0b 3a1f8e    ld      a,($8e1f)
3c0e 111f8e    ld      de,$8e1f
3c11 6f        ld      l,a
3c12 17        rla     
3c13 9f        sbc     a,a
3c14 67        ld      h,a
3c15 19        add     hl,de
3c16 7e        ld      a,(hl)
3c17 21ad84    ld      hl,$84ad
3c1a 96        sub     (hl)
3c1b c6ff      add     a,$ff
3c1d 9f        sbc     a,a
3c1e 32ae84    ld      ($84ae),a
3c21 3a1f8e    ld      a,($8e1f)
3c24 d601      sub     $01
3c26 9f        sbc     a,a
3c27 21ae84    ld      hl,$84ae
3c2a b6        or      (hl)
3c2b 32b084    ld      ($84b0),a
3c2e b7        or      a
3c2f c23c3c    jp      nz,$3c3c
3c32 3a1f8e    ld      a,($8e1f)
3c35 3d        dec     a
3c36 321f8e    ld      ($8e1f),a
3c39 c30b3c    jp      $3c0b
3c3c 3e01      ld      a,$01
3c3e 32ab84    ld      ($84ab),a
3c41 3aab84    ld      a,($84ab)
3c44 111f8e    ld      de,$8e1f
3c47 6f        ld      l,a
3c48 17        rla     
3c49 9f        sbc     a,a
3c4a 67        ld      h,a
3c4b 19        add     hl,de
3c4c 7e        ld      a,(hl)
3c4d 321d8e    ld      ($8e1d),a
3c50 3abc8d    ld      a,($8dbc)
3c53 b7        or      a
3c54 ca583c    jp      z,$3c58
3c57 c9        ret     

3c58 3aab84    ld      a,($84ab)
3c5b 211f8e    ld      hl,$8e1f
3c5e 96        sub     (hl)
3c5f 3d        dec     a
3c60 d67f      sub     $7f
3c62 9f        sbc     a,a
3c63 32ae84    ld      ($84ae),a
3c66 b7        or      a
3c67 c2c33b    jp      nz,$3bc3
3c6a 3a1d8e    ld      a,($8e1d)
3c6d d620      sub     $20
3c6f c6ff      add     a,$ff
3c71 9f        sbc     a,a
3c72 32ae84    ld      ($84ae),a
3c75 b7        or      a
3c76 c2833c    jp      nz,$3c83
3c79 3aab84    ld      a,($84ab)
3c7c 3c        inc     a
3c7d 32ab84    ld      ($84ab),a
3c80 c3413c    jp      $3c41
3c83 3a1d8e    ld      a,($8e1d)
3c86 21ac84    ld      hl,$84ac
3c89 96        sub     (hl)
3c8a d601      sub     $01
3c8c 9f        sbc     a,a
3c8d 32ae84    ld      ($84ae),a
3c90 b7        or      a
3c91 c2c33b    jp      nz,$3bc3
3c94 c9        ret     

3c95 011f8e    ld      bc,$8e1f
3c98 11208e    ld      de,$8e20
3c9b 21b48d    ld      hl,$8db4
3c9e cd9f2c    call    $2c9f
3ca1 c3033c    jp      $3c03
3ca4 ff        rst     $38
3ca5 ff        rst     $38
3ca6 22b284    ld      ($84b2),hl
3ca9 2ab284    ld      hl,($84b2)
3cac 7e        ld      a,(hl)
3cad 23        inc     hl
3cae 66        ld      h,(hl)
3caf 6f        ld      l,a
3cb0 cd547e    call    $7e54
3cb3 220d3d    ld      ($3d0d),hl
3cb6 0e3d      ld      c,$3d
3cb8 1d        dec     e
3cb9 3d        dec     a
3cba 213d53    ld      hl,$533d
3cbd 3d        dec     a
3cbe 7f        ld      a,a
3cbf 3d        dec     a
3cc0 86        add     a,(hl)
3cc1 3d        dec     a
3cc2 8a        adc     a,d
3cc3 3d        dec     a
3cc4 a0        and     b
3cc5 3d        dec     a
3cc6 a7        and     a
3cc7 3d        dec     a
3cc8 be        cp      (hl)
3cc9 3d        dec     a
3cca c23dc8    jp      nz,$c83d
3ccd 3d        dec     a
3cce eb        ex      de,hl
3ccf 3d        dec     a
3cd0 ef        rst     $28
3cd1 3d        dec     a
3cd2 07        rlca    
3cd3 3e14      ld      a,$14
3cd5 3e18      ld      a,$18
3cd7 3e36      ld      a,$36
3cd9 3e3f      ld      a,$3f
3cdb 3e43      ld      a,$43
3cdd 3e59      ld      a,$59
3cdf 3e83      ld      a,$83
3ce1 3e87      ld      a,$87
3ce3 3e8e      ld      a,$8e
3ce5 3e92      ld      a,$92
3ce7 3ea8      ld      a,$a8
3ce9 3eac      ld      a,$ac
3ceb 3ed6      ld      a,$d6
3ced 3eec      ld      a,$ec
3cef 3ef0      ld      a,$f0
3cf1 3ef7      ld      a,$f7
3cf3 3efe      ld      a,$fe
3cf5 3e05      ld      a,$05
3cf7 3f        ccf     
3cf8 2ab284    ld      hl,($84b2)
3cfb 7e        ld      a,(hl)
3cfc 23        inc     hl
3cfd 66        ld      h,(hl)
3cfe 6f        ld      l,a
3cff 11deff    ld      de,$ffde
3d02 19        add     hl,de
3d03 22cd84    ld      ($84cd),hl
3d06 21cd84    ld      hl,$84cd
3d09 cd8001    call    $0180
3d0c c9        ret     

3d0d c9        ret     

3d0e 3eff      ld      a,$ff
3d10 323c8c    ld      ($8c3c),a
3d13 213a8c    ld      hl,$8c3a
3d16 cd4401    call    $0144
3d19 cd0b41    call    $410b
3d1c c9        ret     

3d1d cd1a01    call    $011a
3d20 c9        ret     

3d21 01cf84    ld      bc,$84cf
3d24 117a8d    ld      de,$8d7a
3d27 21498f    ld      hl,$8f49
3d2a cd3a44    call    $443a
3d2d 11103f    ld      de,$3f10
3d30 217a8d    ld      hl,$8d7a
3d33 cdd372    call    $72d3
3d36 32d184    ld      ($84d1),a
3d39 b7        or      a
3d3a ca433d    jp      z,$3d43
3d3d 211a3f    ld      hl,$3f1a
3d40 cdcd71    call    $71cd
3d43 01d284    ld      bc,$84d2
3d46 11103f    ld      de,$3f10
3d49 21cf84    ld      hl,$84cf
3d4c cd3201    call    $0132
3d4f cd6402    call    $0264
3d52 c9        ret     

3d53 01cf84    ld      bc,$84cf
3d56 11d684    ld      de,$84d6
3d59 21498f    ld      hl,$8f49
3d5c cd3a44    call    $443a
3d5f 11103f    ld      de,$3f10
3d62 21d684    ld      hl,$84d6
3d65 cdfb72    call    $72fb
3d68 32d184    ld      ($84d1),a
3d6b b7        or      a
3d6c ca753d    jp      z,$3d75
3d6f 211a3f    ld      hl,$3f1a
3d72 cdcd71    call    $71cd
3d75 11498f    ld      de,$8f49
3d78 21cf84    ld      hl,$84cf
3d7b cd5001    call    $0150
3d7e c9        ret     

3d7f 21183f    ld      hl,$3f18
3d82 cdcb40    call    $40cb
3d85 c9        ret     

3d86 cd3736    call    $3637
3d89 c9        ret     

3d8a 21bc84    ld      hl,$84bc
3d8d cdea47    call    $47ea
3d90 21c084    ld      hl,$84c0
3d93 cdea47    call    $47ea
3d96 11c084    ld      de,$84c0
3d99 21bc84    ld      hl,$84bc
3d9c cdfb5b    call    $5bfb
3d9f c9        ret     

3da0 cd5601    call    $0156
3da3 cd0b41    call    $410b
3da6 c9        ret     

3da7 3a3a8c    ld      a,($8c3a)
3daa d601      sub     $01
3dac 9f        sbc     a,a
3dad 32d184    ld      ($84d1),a
3db0 b7        or      a
3db1 caba3d    jp      z,$3dba
3db4 211e3f    ld      hl,$3f1e
3db7 cdcd71    call    $71cd
3dba cd0b41    call    $410b
3dbd c9        ret     

3dbe cd6e01    call    $016e
3dc1 c9        ret     

3dc2 3eff      ld      a,$ff
3dc4 32b78d    ld      ($8db7),a
3dc7 c9        ret     

3dc8 af        xor     a
3dc9 32b48d    ld      ($8db4),a
3dcc cddd55    call    $55dd
3dcf 3a3a8c    ld      a,($8c3a)
3dd2 d601      sub     $01
3dd4 9f        sbc     a,a
3dd5 32d184    ld      ($84d1),a
3dd8 b7        or      a
3dd9 cadd3d    jp      z,$3ddd
3ddc c9        ret     

3ddd cd6b6f    call    $6f6b
3de0 3a3a8c    ld      a,($8c3a)
3de3 3d        dec     a
3de4 323a8c    ld      ($8c3a),a
3de7 cd0b41    call    $410b
3dea c9        ret     

3deb cde103    call    $03e1
3dee c9        ret     

3def 21143f    ld      hl,$3f14
3df2 cd4602    call    $0246
3df5 2f        cpl     
3df6 32d184    ld      ($84d1),a
3df9 b7        or      a
3dfa cafe3d    jp      z,$3dfe
3dfd c9        ret     

3dfe cde403    call    $03e4
3e01 cd7a01    call    $017a
3e04 cdda01    call    $01da
3e07 3eff      ld      a,$ff
3e09 323e8c    ld      ($8c3e),a
3e0c af        xor     a
3e0d 323a8c    ld      ($8c3a),a
3e10 cd0b41    call    $410b
3e13 c9        ret     

3e14 cdb001    call    $01b0
3e17 c9        ret     

3e18 11c084    ld      de,$84c0
3e1b 21bc84    ld      hl,$84bc
3e1e cd1855    call    $5518
3e21 32d184    ld      ($84d1),a
3e24 b7        or      a
3e25 ca293e    jp      z,$3e29
3e28 c9        ret     

3e29 010c3f    ld      bc,$3f0c
3e2c 11bc84    ld      de,$84bc
3e2f 21d884    ld      hl,$84d8
3e32 cdb601    call    $01b6
3e35 c9        ret     

3e36 af        xor     a
3e37 32b68d    ld      ($8db6),a
3e3a af        xor     a
3e3b 323e8c    ld      ($8c3e),a
3e3e c9        ret     

3e3f cdce01    call    $01ce
3e42 c9        ret     

3e43 21bc84    ld      hl,$84bc
3e46 cdea47    call    $47ea
3e49 21c084    ld      hl,$84c0
3e4c cdea47    call    $47ea
3e4f 11c084    ld      de,$84c0
3e52 21bc84    ld      hl,$84bc
3e55 cdc05b    call    $5bc0
3e58 c9        ret     

3e59 21bc84    ld      hl,$84bc
3e5c cdea47    call    $47ea
3e5f 21c084    ld      hl,$84c0
3e62 cdea47    call    $47ea
3e65 3ab38d    ld      a,($8db3)
3e68 2f        cpl     
3e69 32d184    ld      ($84d1),a
3e6c b7        or      a
3e6d ca763e    jp      z,$3e76
3e70 21f58b    ld      hl,$8bf5
3e73 cdfc46    call    $46fc
3e76 01f58b    ld      bc,$8bf5
3e79 11c084    ld      de,$84c0
3e7c 21bc84    ld      hl,$84bc
3e7f cd385c    call    $5c38
3e82 c9        ret     

3e83 cd243f    call    $3f24
3e86 c9        ret     

3e87 21183f    ld      hl,$3f18
3e8a cdfe01    call    $01fe
3e8d c9        ret     

3e8e cd0402    call    $0204
3e91 c9        ret     

3e92 21bc84    ld      hl,$84bc
3e95 cdea47    call    $47ea
3e98 21c084    ld      hl,$84c0
3e9b cdea47    call    $47ea
3e9e 11c084    ld      de,$84c0
3ea1 21bc84    ld      hl,$84bc
3ea4 cdde5b    call    $5bde
3ea7 c9        ret     

3ea8 cd4002    call    $0240
3eab c9        ret     

3eac 21bc84    ld      hl,$84bc
3eaf cdea47    call    $47ea
3eb2 21c084    ld      hl,$84c0
3eb5 cdea47    call    $47ea
3eb8 3ab38d    ld      a,($8db3)
3ebb 2f        cpl     
3ebc 32d184    ld      ($84d1),a
3ebf b7        or      a
3ec0 cac93e    jp      z,$3ec9
3ec3 21f58b    ld      hl,$8bf5
3ec6 cdfc46    call    $46fc
3ec9 01f58b    ld      bc,$8bf5
3ecc 11c084    ld      de,$84c0
3ecf 21bc84    ld      hl,$84bc
3ed2 cd635c    call    $5c63
3ed5 c9        ret     

3ed6 21bc84    ld      hl,$84bc
3ed9 cdea47    call    $47ea
3edc 21c084    ld      hl,$84c0
3edf cdea47    call    $47ea
3ee2 11c084    ld      de,$84c0
3ee5 21bc84    ld      hl,$84bc
3ee8 cd1a5c    call    $5c1a
3eeb c9        ret     

3eec cd5e02    call    $025e
3eef c9        ret     

3ef0 21cc84    ld      hl,$84cc
3ef3 cd8f73    call    $738f
3ef6 c9        ret     

3ef7 21223f    ld      hl,$3f22
3efa cdcb40    call    $40cb
3efd c9        ret     

3efe 21183f    ld      hl,$3f18
3f01 cd7c02    call    $027c
3f04 c9        ret     

3f05 21183f    ld      hl,$3f18
3f08 cd8202    call    $0282
3f0b c9        ret     

3f0c 02        ld      (bc),a
3f0d 00        nop     
3f0e 00        nop     
3f0f 00        nop     
3f10 010000    ld      bc,$0000
3f13 00        nop     
3f14 00        nop     
3f15 00        nop     
3f16 00        nop     
3f17 00        nop     
3f18 ff        rst     $38
3f19 ff        rst     $38
3f1a 13        inc     de
3f1b 00        nop     
3f1c 00        nop     
3f1d 00        nop     
3f1e 1b        dec     de
3f1f 00        nop     
3f20 00        nop     
3f21 00        nop     
3f22 00        nop     
3f23 00        nop     
3f24 114d85    ld      de,$854d
3f27 21e284    ld      hl,$84e2
3f2a cd4148    call    $4841
3f2d 2f        cpl     
3f2e 324f85    ld      ($854f),a
3f31 b7        or      a
3f32 ca3b3f    jp      z,$3f3b
3f35 21bf3f    ld      hl,$3fbf
3f38 cdcd71    call    $71cd
3f3b 2a4d85    ld      hl,($854d)
3f3e cd547e    call    $7e54
3f41 0d        dec     c
3f42 5c        ld      e,h
3f43 3f        ccf     
3f44 65        ld      h,l
3f45 3f        ccf     
3f46 6a        ld      l,d
3f47 3f        ccf     
3f48 71        ld      (hl),c
3f49 3f        ccf     
3f4a 78        ld      a,b
3f4b 3f        ccf     
3f4c 7d        ld      a,l
3f4d 3f        ccf     
3f4e 82        add     a,d
3f4f 3f        ccf     
3f50 87        add     a,a
3f51 3f        ccf     
3f52 a0        and     b
3f53 3f        ccf     
3f54 a7        and     a
3f55 3f        ccf     
3f56 ac        xor     h
3f57 3f        ccf     
3f58 b1        or      c
3f59 3f        ccf     
3f5a b8        cp      b
3f5b 3f        ccf     
3f5c af        xor     a
3f5d 32598c    ld      ($8c59),a
3f60 af        xor     a
3f61 32578c    ld      ($8c57),a
3f64 c9        ret     

3f65 af        xor     a
3f66 32588c    ld      ($8c58),a
3f69 c9        ret     

3f6a 21c33f    ld      hl,$3fc3
3f6d cd3801    call    $0138
3f70 c9        ret     

3f71 21c33f    ld      hl,$3fc3
3f74 cd8f5b    call    $5b8f
3f77 c9        ret     

3f78 af        xor     a
3f79 328b8d    ld      ($8d8b),a
3f7c c9        ret     

3f7d af        xor     a
3f7e 32b78d    ld      ($8db7),a
3f81 c9        ret     

3f82 af        xor     a
3f83 328c8d    ld      ($8d8c),a
3f86 c9        ret     

3f87 af        xor     a
3f88 329c8d    ld      ($8d9c),a
3f8b 3ab38d    ld      a,($8db3)
3f8e 2f        cpl     
3f8f 324f85    ld      ($854f),a
3f92 b7        or      a
3f93 ca9f3f    jp      z,$3f9f
3f96 11178e    ld      de,$8e17
3f99 21c38d    ld      hl,$8dc3
3f9c cdba49    call    $49ba
3f9f c9        ret     

3fa0 21c33f    ld      hl,$3fc3
3fa3 cdfe01    call    $01fe
3fa6 c9        ret     

3fa7 af        xor     a
3fa8 32958d    ld      ($8d95),a
3fab c9        ret     

3fac af        xor     a
3fad 32998d    ld      ($8d99),a
3fb0 c9        ret     

3fb1 21c33f    ld      hl,$3fc3
3fb4 cd7c02    call    $027c
3fb7 c9        ret     

3fb8 21c33f    ld      hl,$3fc3
3fbb cd8202    call    $0282
3fbe c9        ret     

3fbf 1000      djnz    $3fc1
3fc1 00        nop     
3fc2 00        nop     
3fc3 00        nop     
3fc4 00        nop     
3fc5 2a9d8d    ld      hl,($8d9d)
3fc8 225285    ld      ($8552),hl
3fcb 11178e    ld      de,$8e17
3fce 21c38d    ld      hl,$8dc3
3fd1 cdba49    call    $49ba
3fd4 3abb8d    ld      a,($8dbb)
3fd7 215185    ld      hl,$8551
3fda 96        sub     (hl)
3fdb c6ff      add     a,$ff
3fdd 9f        sbc     a,a
3fde 325485    ld      ($8554),a
3fe1 b7        or      a
3fe2 caeb3f    jp      z,$3feb
3fe5 21fe3f    ld      hl,$3ffe
3fe8 cdcd71    call    $71cd
3feb 215585    ld      hl,$8555
3fee cdea47    call    $47ea
3ff1 015285    ld      bc,$8552
3ff4 113f8c    ld      de,$8c3f
3ff7 215585    ld      hl,$8555
3ffa cd816b    call    $6b81
3ffd c9        ret     

3ffe 1000      djnz    $4000
4000 00        nop     
4001 00        nop     
4002 225a85    ld      ($855a),hl
4005 2a5a85    ld      hl,($855a)
4008 cd2380    call    $8023
400b 21fc8b    ld      hl,$8bfc
400e cd437c    call    $7c43
4011 d601      sub     $01
4013 9f        sbc     a,a
4014 325c85    ld      ($855c),a
4017 b7        or      a
4018 ca1c40    jp      z,$401c
401b c9        ret     

401c 2a5a85    ld      hl,($855a)
401f cd2380    call    $8023
4022 21fc8b    ld      hl,$8bfc
4025 cd1480    call    $8014
4028 21fc8b    ld      hl,$8bfc
402b cd2f40    call    $402f
402e c9        ret     

402f 225e85    ld      ($855e),hl
4032 210e8c    ld      hl,$8c0e
4035 cd2380    call    $8023
4038 21d7a2    ld      hl,$a2d7
403b cd1480    call    $8014
403e 21068c    ld      hl,$8c06
4041 cd2380    call    $8023
4044 21028c    ld      hl,$8c02
4047 cd547d    call    $7d54
404a 2a5e85    ld      hl,($855e)
404d cd547d    call    $7d54
4050 216085    ld      hl,$8560
4053 cd1480    call    $8014
4056 210a8c    ld      hl,$8c0a
4059 cd547d    call    $7d54
405c 216485    ld      hl,$8564
405f cd1480    call    $8014
4062 216085    ld      hl,$8560
4065 cd2380    call    $8023
4068 21128c    ld      hl,$8c12
406b cd547d    call    $7d54
406e 210e8c    ld      hl,$8c0e
4071 cd547d    call    $7d54
4074 216885    ld      hl,$8568
4077 cd1480    call    $8014
407a 016085    ld      bc,$8560
407d 116885    ld      de,$8568
4080 216485    ld      hl,$8564
4083 cd7e5e    call    $5e7e
4086 c9        ret     

4087 226d85    ld      ($856d),hl
408a 11c740    ld      de,$40c7
408d 2a6d85    ld      hl,($856d)
4090 cdaa72    call    $72aa
4093 327085    ld      ($8570),a
4096 11008c    ld      de,$8c00
4099 2a6d85    ld      hl,($856d)
409c cdaa72    call    $72aa
409f 327185    ld      ($8571),a
40a2 3a8b8d    ld      a,($8d8b)
40a5 2f        cpl     
40a6 217185    ld      hl,$8571
40a9 b6        or      (hl)
40aa 217085    ld      hl,$8570
40ad b6        or      (hl)
40ae 327285    ld      ($8572),a
40b1 b7        or      a
40b2 cab640    jp      z,$40b6
40b5 c9        ret     

40b6 2a6d85    ld      hl,($856d)
40b9 7e        ld      a,(hl)
40ba 23        inc     hl
40bb 66        ld      h,(hl)
40bc 6f        ld      l,a
40bd 22008c    ld      ($8c00),hl
40c0 21008c    ld      hl,$8c00
40c3 cdf903    call    $03f9
40c6 c9        ret     

40c7 ff        rst     $38
40c8 ff        rst     $38
40c9 ff        rst     $38
40ca ff        rst     $38
40cb 227485    ld      ($8574),hl
40ce 212e8c    ld      hl,$8c2e
40d1 cd8740    call    $4087
40d4 21168c    ld      hl,$8c16
40d7 cd0240    call    $4002
40da 11178e    ld      de,$8e17
40dd 21a18e    ld      hl,$8ea1
40e0 cdba49    call    $49ba
40e3 2a7485    ld      hl,($8574)
40e6 7e        ld      a,(hl)
40e7 b7        or      a
40e8 c2ff40    jp      nz,$40ff
40eb 11178e    ld      de,$8e17
40ee 21a18e    ld      hl,$8ea1
40f1 cd735d    call    $5d73
40f4 3ab38d    ld      a,($8db3)
40f7 b7        or      a
40f8 cafc40    jp      z,$40fc
40fb c9        ret     

40fc c3da40    jp      $40da
40ff 11178e    ld      de,$8e17
4102 21a18e    ld      hl,$8ea1
4105 cd5755    call    $5557
4108 c3f440    jp      $40f4
410b af        xor     a
410c 32b68d    ld      ($8db6),a
410f 3a3a8c    ld      a,($8c3a)
4112 d601      sub     $01
4114 9f        sbc     a,a
4115 327a85    ld      ($857a),a
4118 b7        or      a
4119 ca1d41    jp      z,$411d
411c c9        ret     

411d 3eff      ld      a,$ff
411f 32b68d    ld      ($8db6),a
4122 213a8c    ld      hl,$8c3a
4125 cd956c    call    $6c95
4128 c9        ret     

4129 228485    ld      ($8584),hl
412c eb        ex      de,hl
412d 228685    ld      ($8586),hl
4130 60        ld      h,b
4131 69        ld      l,c
4132 228885    ld      ($8588),hl
4135 3a5a8c    ld      a,($8c5a)
4138 b7        or      a
4139 c25341    jp      nz,$4153
413c 2a8685    ld      hl,($8586)
413f 7e        ld      a,(hl)
4140 23        inc     hl
4141 66        ld      h,(hl)
4142 6f        ld      l,a
4143 228b85    ld      ($858b),hl
4146 2a8885    ld      hl,($8588)
4149 7e        ld      a,(hl)
414a 23        inc     hl
414b 66        ld      h,(hl)
414c 6f        ld      l,a
414d 228d85    ld      ($858d),hl
4150 c36741    jp      $4167
4153 2a8685    ld      hl,($8586)
4156 7e        ld      a,(hl)
4157 23        inc     hl
4158 66        ld      h,(hl)
4159 6f        ld      l,a
415a 228d85    ld      ($858d),hl
415d 2a8885    ld      hl,($8588)
4160 7e        ld      a,(hl)
4161 23        inc     hl
4162 66        ld      h,(hl)
4163 6f        ld      l,a
4164 228b85    ld      ($858b),hl
4167 3eff      ld      a,$ff
4169 327c85    ld      ($857c),a
416c 2a8b85    ld      hl,($858b)
416f eb        ex      de,hl
4170 2a5c8c    ld      hl,($8c5c)
4173 7b        ld      a,e
4174 95        sub     l
4175 6f        ld      l,a
4176 7a        ld      a,d
4177 9c        sbc     a,h
4178 67        ld      h,a
4179 7d        ld      a,l
417a 07        rlca    
417b b5        or      l
417c e67f      and     $7f
417e b4        or      h
417f 3d        dec     a
4180 d67f      sub     $7f
4182 9f        sbc     a,a
4183 328f85    ld      ($858f),a
4186 2a8d85    ld      hl,($858d)
4189 eb        ex      de,hl
418a 2a5e8c    ld      hl,($8c5e)
418d 7b        ld      a,e
418e 95        sub     l
418f 6f        ld      l,a
4190 7a        ld      a,d
4191 9c        sbc     a,h
4192 67        ld      h,a
4193 7d        ld      a,l
4194 07        rlca    
4195 b5        or      l
4196 e67f      and     $7f
4198 b4        or      h
4199 3d        dec     a
419a d67f      sub     $7f
419c 9f        sbc     a,a
419d 218f85    ld      hl,$858f
41a0 b6        or      (hl)
41a1 329085    ld      ($8590),a
41a4 b7        or      a
41a5 caac41    jp      z,$41ac
41a8 3a7c85    ld      a,($857c)
41ab c9        ret     

41ac af        xor     a
41ad 327c85    ld      ($857c),a
41b0 2a8d85    ld      hl,($858d)
41b3 7d        ld      a,l
41b4 07        rlca    
41b5 b5        or      l
41b6 e67f      and     $7f
41b8 b4        or      h
41b9 d601      sub     $01
41bb 9f        sbc     a,a
41bc 328f85    ld      ($858f),a
41bf b7        or      a
41c0 c2f941    jp      nz,$41f9
41c3 2a8b85    ld      hl,($858b)
41c6 7d        ld      a,l
41c7 07        rlca    
41c8 b5        or      l
41c9 e67f      and     $7f
41cb b4        or      h
41cc d601      sub     $01
41ce 9f        sbc     a,a
41cf 328f85    ld      ($858f),a
41d2 b7        or      a
41d3 c20942    jp      nz,$4209
41d6 2a8b85    ld      hl,($858b)
41d9 2b        dec     hl
41da eb        ex      de,hl
41db 2a5e8c    ld      hl,($8c5e)
41de cdd37e    call    $7ed3
41e1 eb        ex      de,hl
41e2 2a8d85    ld      hl,($858d)
41e5 19        add     hl,de
41e6 229185    ld      ($8591),hl
41e9 019185    ld      bc,$8591
41ec 114f8c    ld      de,$8c4f
41ef 2a8485    ld      hl,($8584)
41f2 cd566b    call    $6b56
41f5 3a7c85    ld      a,($857c)
41f8 c9        ret     

41f9 2a8b85    ld      hl,($858b)
41fc cd347e    call    $7e34
41ff 2a8485    ld      hl,($8584)
4202 cd1480    call    $8014
4205 3a7c85    ld      a,($857c)
4208 c9        ret     

4209 2a8d85    ld      hl,($858d)
420c cd347e    call    $7e34
420f 2a8485    ld      hl,($8584)
4212 cd1480    call    $8014
4215 3a7c85    ld      a,($857c)
4218 c9        ret     

4219 229485    ld      ($8594),hl
421c 2a9485    ld      hl,($8594)
421f cd2573    call    $7325
4222 329b85    ld      ($859b),a
4225 b7        or      a
4226 ca2a42    jp      z,$422a
4229 c9        ret     

422a 21bd43    ld      hl,$43bd
422d cd956c    call    $6c95
4230 3a9885    ld      a,($8598)
4233 2f        cpl     
4234 329b85    ld      ($859b),a
4237 b7        or      a
4238 c25b42    jp      nz,$425b
423b 3a718f    ld      a,($8f71)
423e b7        or      a
423f ca4b42    jp      z,$424b
4242 cd2e7d    call    $7d2e
4245 4e        ld      c,(hl)
4246 4f        ld      c,a
4247 46        ld      b,(hl)
4248 49        ld      c,c
4249 4c        ld      c,h
424a 45        ld      b,l
424b 01c143    ld      bc,$43c1
424e 11b943    ld      de,$43b9
4251 219c85    ld      hl,$859c
4254 cd5e6e    call    $6e5e
4257 af        xor     a
4258 329885    ld      ($8598),a
425b cd446f    call    $6f44
425e 11b143    ld      de,$43b1
4261 21a785    ld      hl,$85a7
4264 cd4a6b    call    $6b4a
4267 11a785    ld      de,$85a7
426a 2a9485    ld      hl,($8594)
426d cdfb72    call    $72fb
4270 329b85    ld      ($859b),a
4273 b7        or      a
4274 ca8042    jp      z,$4280
4277 cd2e7d    call    $7d2e
427a 45        ld      b,l
427b 52        ld      d,d
427c 52        ld      d,d
427d 4f        ld      c,a
427e 52        ld      d,d
427f 24        inc     h
4280 2a9485    ld      hl,($8594)
4283 7e        ld      a,(hl)
4284 23        inc     hl
4285 66        ld      h,(hl)
4286 6f        ld      l,a
4287 29        add     hl,hl
4288 23        inc     hl
4289 22a985    ld      ($85a9),hl
428c 11a985    ld      de,$85a9
428f 21b943    ld      hl,$43b9
4292 cd296b    call    $6b29
4295 11b143    ld      de,$43b1
4298 21ab85    ld      hl,$85ab
429b cd4a6b    call    $6b4a
429e 11ab85    ld      de,$85ab
42a1 21b943    ld      hl,$43b9
42a4 cd296b    call    $6b29
42a7 210000    ld      hl,$0000
42aa 22a985    ld      ($85a9),hl
42ad 11b543    ld      de,$43b5
42b0 219785    ld      hl,$8597
42b3 cd4a6b    call    $6b4a
42b6 3a9785    ld      a,($8597)
42b9 3d        dec     a
42ba d601      sub     $01
42bc 9f        sbc     a,a
42bd 329b85    ld      ($859b),a
42c0 3a9785    ld      a,($8597)
42c3 d601      sub     $01
42c5 9f        sbc     a,a
42c6 219b85    ld      hl,$859b
42c9 b6        or      (hl)
42ca 32ad85    ld      ($85ad),a
42cd b7        or      a
42ce c20743    jp      nz,$4307
42d1 3a9785    ld      a,($8597)
42d4 d680      sub     $80
42d6 d601      sub     $01
42d8 9f        sbc     a,a
42d9 329b85    ld      ($859b),a
42dc b7        or      a
42dd c26e43    jp      nz,$436e
42e0 3a9785    ld      a,($8597)
42e3 d681      sub     $81
42e5 17        rla     
42e6 3f        ccf     
42e7 9f        sbc     a,a
42e8 329b85    ld      ($859b),a
42eb b7        or      a
42ec c26f43    jp      nz,$436f
42ef 2aa985    ld      hl,($85a9)
42f2 23        inc     hl
42f3 22a985    ld      ($85a9),hl
42f6 11a08e    ld      de,$8ea0
42f9 19        add     hl,de
42fa 22ae85    ld      ($85ae),hl
42fd 3a9785    ld      a,($8597)
4300 2aae85    ld      hl,($85ae)
4303 77        ld      (hl),a
4304 c3ad42    jp      $42ad
4307 21c343    ld      hl,$43c3
430a cdbb73    call    $73bb
430d cddd55    call    $55dd
4310 21b085    ld      hl,$85b0
4313 cd3556    call    $5635
4316 11a985    ld      de,$85a9
4319 21a18e    ld      hl,$8ea1
431c cdf255    call    $55f2
431f cddd55    call    $55dd
4322 111f8e    ld      de,$8e1f
4325 21208e    ld      hl,$8e20
4328 cdf255    call    $55f2
432b cddd55    call    $55dd
432e 3e01      ld      a,$01
4330 329685    ld      ($8596),a
4333 3a9685    ld      a,($8596)
4336 211c8e    ld      hl,$8e1c
4339 96        sub     (hl)
433a 17        rla     
433b 3f        ccf     
433c 9f        sbc     a,a
433d 329b85    ld      ($859b),a
4340 b7        or      a
4341 c25443    jp      nz,$4354
4344 21bd85    ld      hl,$85bd
4347 cdbb73    call    $73bb
434a 3a9685    ld      a,($8596)
434d 3c        inc     a
434e 329685    ld      ($8596),a
4351 c33343    jp      $4333
4354 3a9785    ld      a,($8597)
4357 3d        dec     a
4358 d601      sub     $01
435a 9f        sbc     a,a
435b 329b85    ld      ($859b),a
435e b7        or      a
435f ca6b43    jp      z,$436b
4362 cd2e7d    call    $7d2e
4365 46        ld      b,(hl)
4366 41        ld      b,c
4367 54        ld      d,h
4368 41        ld      b,c
4369 4c        ld      c,h
436a 20cd      jr      nz,$4339
436c dd55      ld      d,ixl
436e c9        ret     

436f cddd55    call    $55dd
4372 11a985    ld      de,$85a9
4375 21a18e    ld      hl,$8ea1
4378 cdf255    call    $55f2
437b 3a9785    ld      a,($8597)
437e d681      sub     $81
4380 d601      sub     $01
4382 9f        sbc     a,a
4383 329b85    ld      ($859b),a
4386 b7        or      a
4387 c26b43    jp      nz,$436b
438a 3a9785    ld      a,($8597)
438d d682      sub     $82
438f d601      sub     $01
4391 9f        sbc     a,a
4392 329b85    ld      ($859b),a
4395 b7        or      a
4396 c2a742    jp      nz,$42a7
4399 219685    ld      hl,$8596
439c cd8f73    call    $738f
439f 3a9785    ld      a,($8597)
43a2 d683      sub     $83
43a4 d601      sub     $01
43a6 9f        sbc     a,a
43a7 329b85    ld      ($859b),a
43aa b7        or      a
43ab c2a742    jp      nz,$42a7
43ae c36b43    jp      $436b
43b1 02        ld      (bc),a
43b2 00        nop     
43b3 00        nop     
43b4 00        nop     
43b5 010000    ld      bc,$0000
43b8 00        nop     
43b9 00        nop     
43ba 00        nop     
43bb 00        nop     
43bc 00        nop     
43bd 08        ex      af,af'
43be 00        nop     
43bf 00        nop     
43c0 00        nop     
43c1 00        nop     
43c2 00        nop     
43c3 07        rlca    
43c4 00        nop     
43c5 00        nop     
43c6 00        nop     
43c7 11d78b    ld      de,$8bd7
43ca 21f88b    ld      hl,$8bf8
43cd cdfa71    call    $71fa
43d0 c9        ret     

43d1 01de43    ld      bc,$43de
43d4 11f88b    ld      de,$8bf8
43d7 21d78b    ld      hl,$8bd7
43da cd0672    call    $7206
43dd c9        ret     

43de 03        inc     bc
43df 00        nop     
43e0 00        nop     
43e1 00        nop     
43e2 22c185    ld      ($85c1),hl
43e5 210200    ld      hl,$0002
43e8 22c485    ld      ($85c4),hl
43eb 013244    ld      bc,$4432
43ee 11c685    ld      de,$85c6
43f1 21c38d    ld      hl,$8dc3
43f4 cd993a    call    $3a99
43f7 11178e    ld      de,$8e17
43fa 21c38d    ld      hl,$8dc3
43fd cdba49    call    $49ba
4400 2ac485    ld      hl,($85c4)
4403 229d8d    ld      ($8d9d),hl
4406 01178e    ld      bc,$8e17
4409 11c38d    ld      de,$8dc3
440c 2ac185    ld      hl,($85c1)
440f cdc256    call    $56c2
4412 32c785    ld      ($85c7),a
4415 b7        or      a
4416 ca1f44    jp      z,$441f
4419 213644    ld      hl,$4436
441c cdcd71    call    $71cd
441f 2ac485    ld      hl,($85c4)
4422 23        inc     hl
4423 22c485    ld      ($85c4),hl
4426 3ab38d    ld      a,($8db3)
4429 2f        cpl     
442a 32c785    ld      ($85c7),a
442d b7        or      a
442e c2eb43    jp      nz,$43eb
4431 c9        ret     

4432 08        ex      af,af'
4433 00        nop     
4434 00        nop     
4435 00        nop     
4436 24        inc     h
4437 00        nop     
4438 00        nop     
4439 00        nop     
443a 22c985    ld      ($85c9),hl
443d eb        ex      de,hl
443e 22cb85    ld      ($85cb),hl
4441 60        ld      h,b
4442 69        ld      l,c
4443 22cd85    ld      ($85cd),hl
4446 210000    ld      hl,$0000
4449 eb        ex      de,hl
444a 2acb85    ld      hl,($85cb)
444d 73        ld      (hl),e
444e 23        inc     hl
444f 72        ld      (hl),d
4450 210000    ld      hl,$0000
4453 eb        ex      de,hl
4454 2acd85    ld      hl,($85cd)
4457 73        ld      (hl),e
4458 23        inc     hl
4459 72        ld      (hl),d
445a af        xor     a
445b 32d185    ld      ($85d1),a
445e 3ab38d    ld      a,($8db3)
4461 b7        or      a
4462 ca6644    jp      z,$4466
4465 c9        ret     

4466 3a3c8c    ld      a,($8c3c)
4469 2f        cpl     
446a 32ee85    ld      ($85ee),a
446d b7        or      a
446e ca7744    jp      z,$4477
4471 210d45    ld      hl,$450d
4474 cdcd71    call    $71cd
4477 cd6e48    call    $486e
447a 3a9f8d    ld      a,($8d9f)
447d d604      sub     $04
447f d601      sub     $01
4481 9f        sbc     a,a
4482 32ee85    ld      ($85ee),a
4485 b7        or      a
4486 c2a244    jp      nz,$44a2
4489 01178e    ld      bc,$8e17
448c 11c38d    ld      de,$8dc3
448f 21d385    ld      hl,$85d3
4492 cd6856    call    $5668
4495 32ee85    ld      ($85ee),a
4498 b7        or      a
4499 c2f944    jp      nz,$44f9
449c 211145    ld      hl,$4511
449f cdcd71    call    $71cd
44a2 3ad185    ld      a,($85d1)
44a5 b7        or      a
44a6 c20145    jp      nz,$4501
44a9 2acb85    ld      hl,($85cb)
44ac cd2573    call    $7325
44af 32ee85    ld      ($85ee),a
44b2 b7        or      a
44b3 cabc44    jp      z,$44bc
44b6 3a5a8c    ld      a,($8c5a)
44b9 32d085    ld      ($85d0),a
44bc 3a5a8c    ld      a,($8c5a)
44bf 21d085    ld      hl,$85d0
44c2 ae        xor     (hl)
44c3 32ee85    ld      ($85ee),a
44c6 b7        or      a
44c7 cad044    jp      z,$44d0
44ca 211545    ld      hl,$4515
44cd cdcd71    call    $71cd
44d0 2acb85    ld      hl,($85cb)
44d3 7e        ld      a,(hl)
44d4 23        inc     hl
44d5 66        ld      h,(hl)
44d6 6f        ld      l,a
44d7 23        inc     hl
44d8 eb        ex      de,hl
44d9 2acb85    ld      hl,($85cb)
44dc 73        ld      (hl),e
44dd 23        inc     hl
44de 72        ld      (hl),d
44df eb        ex      de,hl
44e0 29        add     hl,hl
44e1 2b        dec     hl
44e2 2b        dec     hl
44e3 eb        ex      de,hl
44e4 2ac985    ld      hl,($85c9)
44e7 19        add     hl,de
44e8 22ef85    ld      ($85ef),hl
44eb 2a9d8d    ld      hl,($8d9d)
44ee 2b        dec     hl
44ef eb        ex      de,hl
44f0 2aef85    ld      hl,($85ef)
44f3 73        ld      (hl),e
44f4 23        inc     hl
44f5 72        ld      (hl),d
44f6 c35e44    jp      $445e
44f9 3eff      ld      a,$ff
44fb 32d185    ld      ($85d1),a
44fe c35e44    jp      $445e
4501 2a9d8d    ld      hl,($8d9d)
4504 2b        dec     hl
4505 eb        ex      de,hl
4506 2acd85    ld      hl,($85cd)
4509 73        ld      (hl),e
450a 23        inc     hl
450b 72        ld      (hl),d
450c c9        ret     

450d 14        inc     d
450e 00        nop     
450f 00        nop     
4510 00        nop     
4511 220000    ld      ($0000),hl
4514 00        nop     
4515 2000      jr      nz,$4517
4517 00        nop     
4518 00        nop     
4519 22f285    ld      ($85f2),hl
451c eb        ex      de,hl
451d 22f485    ld      ($85f4),hl
4520 210000    ld      hl,$0000
4523 22f785    ld      ($85f7),hl
4526 3ab38d    ld      a,($8db3)
4529 b7        or      a
452a ca2e45    jp      z,$452e
452d c9        ret     

452e 2af785    ld      hl,($85f7)
4531 23        inc     hl
4532 22f785    ld      ($85f7),hl
4535 21f785    ld      hl,$85f7
4538 cd3c46    call    $463c
453b 21f985    ld      hl,$85f9
453e cdb646    call    $46b6
4541 11f985    ld      de,$85f9
4544 217845    ld      hl,$4578
4547 cdfb72    call    $72fb
454a 32fb85    ld      ($85fb),a
454d 2af485    ld      hl,($85f4)
4550 eb        ex      de,hl
4551 21f985    ld      hl,$85f9
4554 cdfb72    call    $72fb
4557 21fb85    ld      hl,$85fb
455a b6        or      (hl)
455b 32fc85    ld      ($85fc),a
455e b7        or      a
455f ca6845    jp      z,$4568
4562 217c45    ld      hl,$457c
4565 cdcd71    call    $71cd
4568 01f785    ld      bc,$85f7
456b 2af285    ld      hl,($85f2)
456e eb        ex      de,hl
456f 21f985    ld      hl,$85f9
4572 cd816b    call    $6b81
4575 c32645    jp      $4526
4578 00        nop     
4579 00        nop     
457a 00        nop     
457b 00        nop     
457c 1a        ld      a,(de)
457d 00        nop     
457e 00        nop     
457f 00        nop     
4580 22fe85    ld      ($85fe),hl
4583 eb        ex      de,hl
4584 220086    ld      ($8600),hl
4587 60        ld      h,b
4588 69        ld      l,c
4589 220286    ld      ($8602),hl
458c 210000    ld      hl,$0000
458f 220786    ld      ($8607),hl
4592 3ab38d    ld      a,($8db3)
4595 b7        or      a
4596 ca9a45    jp      z,$459a
4599 c9        ret     

459a 2a0786    ld      hl,($8607)
459d 23        inc     hl
459e 220786    ld      ($8607),hl
45a1 2a0286    ld      hl,($8602)
45a4 eb        ex      de,hl
45a5 210786    ld      hl,$8607
45a8 cdfb72    call    $72fb
45ab 320986    ld      ($8609),a
45ae b7        or      a
45af cab845    jp      z,$45b8
45b2 213446    ld      hl,$4634
45b5 cdcd71    call    $71cd
45b8 113046    ld      de,$4630
45bb 2a0086    ld      hl,($8600)
45be cdaa72    call    $72aa
45c1 320986    ld      ($8609),a
45c4 b7        or      a
45c5 c22746    jp      nz,$4627
45c8 11178e    ld      de,$8e17
45cb 21a18e    ld      hl,$8ea1
45ce cdba49    call    $49ba
45d1 2a0086    ld      hl,($8600)
45d4 7e        ld      a,(hl)
45d5 23        inc     hl
45d6 66        ld      h,(hl)
45d7 6f        ld      l,a
45d8 2b        dec     hl
45d9 220a86    ld      ($860a),hl
45dc 3a178e    ld      a,($8e17)
45df 6f        ld      l,a
45e0 17        rla     
45e1 9f        sbc     a,a
45e2 67        ld      h,a
45e3 eb        ex      de,hl
45e4 2a0a86    ld      hl,($860a)
45e7 7b        ld      a,e
45e8 95        sub     l
45e9 6f        ld      l,a
45ea 7a        ld      a,d
45eb 9c        sbc     a,h
45ec 67        ld      h,a
45ed 7d        ld      a,l
45ee 07        rlca    
45ef b5        or      l
45f0 e67f      and     $7f
45f2 b4        or      h
45f3 3d        dec     a
45f4 d67f      sub     $7f
45f6 9f        sbc     a,a
45f7 320986    ld      ($8609),a
45fa b7        or      a
45fb ca0446    jp      z,$4604
45fe 213846    ld      hl,$4638
4601 cdcd71    call    $71cd
4604 3a178e    ld      a,($8e17)
4607 11a18e    ld      de,$8ea1
460a 6f        ld      l,a
460b 17        rla     
460c 9f        sbc     a,a
460d 67        ld      h,a
460e 19        add     hl,de
460f 220a86    ld      ($860a),hl
4612 af        xor     a
4613 2a0a86    ld      hl,($860a)
4616 77        ld      (hl),a
4617 010786    ld      bc,$8607
461a 2afe85    ld      hl,($85fe)
461d eb        ex      de,hl
461e 21a18e    ld      hl,$8ea1
4621 cd816b    call    $6b81
4624 c39245    jp      $4592
4627 21a18e    ld      hl,$8ea1
462a cdfc46    call    $46fc
462d c31746    jp      $4617
4630 010000    ld      bc,$0000
4633 00        nop     
4634 13        inc     de
4635 00        nop     
4636 00        nop     
4637 00        nop     
4638 210000    ld      hl,$0000
463b 00        nop     
463c 220d86    ld      ($860d),hl
463f 2a0d86    ld      hl,($860d)
4642 eb        ex      de,hl
4643 216746    ld      hl,$4667
4646 cdfb72    call    $72fb
4649 321086    ld      ($8610),a
464c 11648d    ld      de,$8d64
464f 2a0d86    ld      hl,($860d)
4652 cdfb72    call    $72fb
4655 211086    ld      hl,$8610
4658 b6        or      (hl)
4659 321186    ld      ($8611),a
465c b7        or      a
465d ca6646    jp      z,$4666
4660 216b46    ld      hl,$466b
4663 cdcd71    call    $71cd
4666 c9        ret     

4667 010000    ld      bc,$0000
466a 00        nop     
466b 13        inc     de
466c 00        nop     
466d 00        nop     
466e 00        nop     
466f 221386    ld      ($8613),hl
4672 eb        ex      de,hl
4673 221586    ld      ($8615),hl
4676 211986    ld      hl,$8619
4679 cdb646    call    $46b6
467c 2a1586    ld      hl,($8615)
467f eb        ex      de,hl
4680 211986    ld      hl,$8619
4683 cdfb72    call    $72fb
4686 321b86    ld      ($861b),a
4689 11ae46    ld      de,$46ae
468c 211986    ld      hl,$8619
468f cd8072    call    $7280
4692 211b86    ld      hl,$861b
4695 b6        or      (hl)
4696 321c86    ld      ($861c),a
4699 b7        or      a
469a caa346    jp      z,$46a3
469d 21b246    ld      hl,$46b2
46a0 cdcd71    call    $71cd
46a3 2a1986    ld      hl,($8619)
46a6 eb        ex      de,hl
46a7 2a1386    ld      hl,($8613)
46aa 73        ld      (hl),e
46ab 23        inc     hl
46ac 72        ld      (hl),d
46ad c9        ret     

46ae 00        nop     
46af 00        nop     
46b0 00        nop     
46b1 00        nop     
46b2 1a        ld      a,(de)
46b3 00        nop     
46b4 00        nop     
46b5 00        nop     
46b6 221e86    ld      ($861e),hl
46b9 212086    ld      hl,$8620
46bc cdea47    call    $47ea
46bf 212086    ld      hl,$8620
46c2 cd2380    call    $8023
46c5 cdd678    call    $78d6
46c8 eb        ex      de,hl
46c9 2a1e86    ld      hl,($861e)
46cc 73        ld      (hl),e
46cd 23        inc     hl
46ce 72        ld      (hl),d
46cf 2a1e86    ld      hl,($861e)
46d2 cd1e79    call    $791e
46d5 212486    ld      hl,$8624
46d8 cd1480    call    $8014
46db 212086    ld      hl,$8620
46de cd2380    call    $8023
46e1 212486    ld      hl,$8624
46e4 cd437c    call    $7c43
46e7 c6ff      add     a,$ff
46e9 9f        sbc     a,a
46ea 322886    ld      ($8628),a
46ed b7        or      a
46ee caf746    jp      z,$46f7
46f1 21f846    ld      hl,$46f8
46f4 cdcd71    call    $71cd
46f7 c9        ret     

46f8 15        dec     d
46f9 00        nop     
46fa 00        nop     
46fb 00        nop     
46fc 222a86    ld      ($862a),hl
46ff 11178e    ld      de,$8e17
4702 21c38d    ld      hl,$8dc3
4705 cdba49    call    $49ba
4708 3a178e    ld      a,($8e17)
470b 3d        dec     a
470c 3d        dec     a
470d d67f      sub     $7f
470f 9f        sbc     a,a
4710 322d86    ld      ($862d),a
4713 3abb8d    ld      a,($8dbb)
4716 212c86    ld      hl,$862c
4719 96        sub     (hl)
471a d601      sub     $01
471c 9f        sbc     a,a
471d 212d86    ld      hl,$862d
4720 a6        and     (hl)
4721 322e86    ld      ($862e),a
4724 b7        or      a
4725 c24447    jp      nz,$4744
4728 3a178e    ld      a,($8e17)
472b 3d        dec     a
472c c6ff      add     a,$ff
472e 9f        sbc     a,a
472f 322d86    ld      ($862d),a
4732 b7        or      a
4733 ca3c47    jp      z,$473c
4736 215c47    ld      hl,$475c
4739 cdcd71    call    $71cd
473c 3ac38d    ld      a,($8dc3)
473f 2a2a86    ld      hl,($862a)
4742 77        ld      (hl),a
4743 c9        ret     

4744 cdd44b    call    $4bd4
4747 3a1c8e    ld      a,($8e1c)
474a 3c        inc     a
474b 321c8e    ld      ($8e1c),a
474e 212f86    ld      hl,$862f
4751 cdb646    call    $46b6
4754 3a2f86    ld      a,($862f)
4757 2a2a86    ld      hl,($862a)
475a 77        ld      (hl),a
475b c9        ret     

475c 210000    ld      hl,$0000
475f 00        nop     
4760 223286    ld      ($8632),hl
4763 cd6e48    call    $486e
4766 3abb8d    ld      a,($8dbb)
4769 219f8e    ld      hl,$8e9f
476c 96        sub     (hl)
476d d601      sub     $01
476f 9f        sbc     a,a
4770 323486    ld      ($8634),a
4773 b7        or      a
4774 c28f47    jp      nz,$478f
4777 3abb8d    ld      a,($8dbb)
477a 21a08e    ld      hl,$8ea0
477d 96        sub     (hl)
477e d601      sub     $01
4780 9f        sbc     a,a
4781 323486    ld      ($8634),a
4784 b7        or      a
4785 c29647    jp      nz,$4796
4788 219c47    ld      hl,$479c
478b cdcd71    call    $71cd
478e c9        ret     

478f 3eff      ld      a,$ff
4791 2a3286    ld      hl,($8632)
4794 77        ld      (hl),a
4795 c9        ret     

4796 af        xor     a
4797 2a3286    ld      hl,($8632)
479a 77        ld      (hl),a
479b c9        ret     

479c 0a        ld      a,(bc)
479d 00        nop     
479e 00        nop     
479f 00        nop     
47a0 223686    ld      ($8636),hl
47a3 3ab38d    ld      a,($8db3)
47a6 b7        or      a
47a7 c2cf47    jp      nz,$47cf
47aa cd6e48    call    $486e
47ad 3a9f8d    ld      a,($8d9f)
47b0 d602      sub     $02
47b2 c6ff      add     a,$ff
47b4 9f        sbc     a,a
47b5 323886    ld      ($8638),a
47b8 b7        or      a
47b9 cac247    jp      z,$47c2
47bc 21e247    ld      hl,$47e2
47bf cdcd71    call    $71cd
47c2 019d8d    ld      bc,$8d9d
47c5 113f8c    ld      de,$8c3f
47c8 2a3686    ld      hl,($8636)
47cb cd816b    call    $6b81
47ce c9        ret     

47cf 213986    ld      hl,$8639
47d2 cd3556    call    $5635
47d5 11e647    ld      de,$47e6
47d8 2a3686    ld      hl,($8636)
47db cdec01    call    $01ec
47de cddd55    call    $55dd
47e1 c9        ret     

47e2 1f        rra     
47e3 00        nop     
47e4 00        nop     
47e5 00        nop     
47e6 05        dec     b
47e7 00        nop     
47e8 00        nop     
47e9 00        nop     
47ea 223e86    ld      ($863e),hl
47ed cd6e48    call    $486e
47f0 21188e    ld      hl,$8e18
47f3 cd2380    call    $8023
47f6 2a3e86    ld      hl,($863e)
47f9 cd1480    call    $8014
47fc 3a9f8d    ld      a,($8d9f)
47ff d602      sub     $02
4801 d601      sub     $01
4803 9f        sbc     a,a
4804 324186    ld      ($8641),a
4807 b7        or      a
4808 ca0c48    jp      z,$480c
480b c9        ret     

480c 3a9f8d    ld      a,($8d9f)
480f c6ff      add     a,$ff
4811 9f        sbc     a,a
4812 324186    ld      ($8641),a
4815 b7        or      a
4816 ca1f48    jp      z,$481f
4819 213948    ld      hl,$4839
481c cdcd71    call    $71cd
481f 01178e    ld      bc,$8e17
4822 11c38d    ld      de,$8dc3
4825 2a3e86    ld      hl,($863e)
4828 cde851    call    $51e8
482b 324186    ld      ($8641),a
482e b7        or      a
482f ca3848    jp      z,$4838
4832 213d48    ld      hl,$483d
4835 cdcd71    call    $71cd
4838 c9        ret     

4839 1f        rra     
483a 00        nop     
483b 00        nop     
483c 00        nop     
483d 0b        dec     bc
483e 00        nop     
483f 00        nop     
4840 00        nop     
4841 224b86    ld      ($864b),hl
4844 eb        ex      de,hl
4845 224d86    ld      ($864d),hl
4848 11178e    ld      de,$8e17
484b 21c38d    ld      hl,$8dc3
484e cdba49    call    $49ba
4851 01178e    ld      bc,$8e17
4854 11c38d    ld      de,$8dc3
4857 2a4b86    ld      hl,($864b)
485a cd6856    call    $5668
485d 324386    ld      ($8643),a
4860 2a9d8d    ld      hl,($8d9d)
4863 eb        ex      de,hl
4864 2a4d86    ld      hl,($864d)
4867 73        ld      (hl),e
4868 23        inc     hl
4869 72        ld      (hl),d
486a 3a4386    ld      a,($8643)
486d c9        ret     

486e 011449    ld      bc,$4914
4871 115286    ld      de,$8652
4874 21c38d    ld      hl,$8dc3
4877 cd993a    call    $3a99
487a 11178e    ld      de,$8e17
487d 21c38d    ld      hl,$8dc3
4880 cdba49    call    $49ba
4883 01178e    ld      bc,$8e17
4886 11c38d    ld      de,$8dc3
4889 219f8d    ld      hl,$8d9f
488c cd2049    call    $4920
488f 3a9f8d    ld      a,($8d9f)
4892 d602      sub     $02
4894 d601      sub     $01
4896 9f        sbc     a,a
4897 325386    ld      ($8653),a
489a b7        or      a
489b c2bd48    jp      nz,$48bd
489e 3a9f8d    ld      a,($8d9f)
48a1 d604      sub     $04
48a3 d601      sub     $01
48a5 9f        sbc     a,a
48a6 325386    ld      ($8653),a
48a9 b7        or      a
48aa c2ca48    jp      nz,$48ca
48ad 3a9f8d    ld      a,($8d9f)
48b0 d605      sub     $05
48b2 d601      sub     $01
48b4 9f        sbc     a,a
48b5 325386    ld      ($8653),a
48b8 b7        or      a
48b9 c2ec48    jp      nz,$48ec
48bc c9        ret     

48bd 019d8d    ld      bc,$8d9d
48c0 113f8c    ld      de,$8c3f
48c3 21188e    ld      hl,$8e18
48c6 cd566b    call    $6b56
48c9 c9        ret     

48ca af        xor     a
48cb 325a8c    ld      ($8c5a),a
48ce 2a5e8c    ld      hl,($8c5e)
48d1 23        inc     hl
48d2 225486    ld      ($8654),hl
48d5 115486    ld      de,$8654
48d8 219d8d    ld      hl,$8d9d
48db cdfb72    call    $72fb
48de 325386    ld      ($8653),a
48e1 b7        or      a
48e2 caeb48    jp      z,$48eb
48e5 211849    ld      hl,$4918
48e8 cdcd71    call    $71cd
48eb c9        ret     

48ec 3eff      ld      a,$ff
48ee 325a8c    ld      ($8c5a),a
48f1 2a5c8c    ld      hl,($8c5c)
48f4 23        inc     hl
48f5 225486    ld      ($8654),hl
48f8 115486    ld      de,$8654
48fb 219d8d    ld      hl,$8d9d
48fe cdfb72    call    $72fb
4901 325386    ld      ($8653),a
4904 b7        or      a
4905 ca0e49    jp      z,$490e
4908 211c49    ld      hl,$491c
490b cdcd71    call    $71cd
490e 3e04      ld      a,$04
4910 329f8d    ld      ($8d9f),a
4913 c9        ret     

4914 08        ex      af,af'
4915 00        nop     
4916 00        nop     
4917 00        nop     
4918 17        rla     
4919 00        nop     
491a 00        nop     
491b 00        nop     
491c 1d        dec     e
491d 00        nop     
491e 00        nop     
491f 00        nop     
4920 225786    ld      ($8657),hl
4923 eb        ex      de,hl
4924 225986    ld      ($8659),hl
4927 60        ld      h,b
4928 69        ld      l,c
4929 225b86    ld      ($865b),hl
492c 3e01      ld      a,$01
492e 2a5786    ld      hl,($8657)
4931 77        ld      (hl),a
4932 2a5b86    ld      hl,($865b)
4935 44        ld      b,h
4936 4d        ld      c,l
4937 2a5986    ld      hl,($8659)
493a eb        ex      de,hl
493b 216657    ld      hl,$5766
493e cd6856    call    $5668
4941 325e86    ld      ($865e),a
4944 b7        or      a
4945 c2b549    jp      nz,$49b5
4948 3e02      ld      a,$02
494a 2a5786    ld      hl,($8657)
494d 77        ld      (hl),a
494e 01b649    ld      bc,$49b6
4951 2a5986    ld      hl,($8659)
4954 eb        ex      de,hl
4955 21c159    ld      hl,$59c1
4958 cd6856    call    $5668
495b 325e86    ld      ($865e),a
495e b7        or      a
495f c2b549    jp      nz,$49b5
4962 3e03      ld      a,$03
4964 2a5786    ld      hl,($8657)
4967 77        ld      (hl),a
4968 01b649    ld      bc,$49b6
496b 2a5986    ld      hl,($8659)
496e eb        ex      de,hl
496f 21145a    ld      hl,$5a14
4972 cd6856    call    $5668
4975 325e86    ld      ($865e),a
4978 b7        or      a
4979 c2b549    jp      nz,$49b5
497c 3e04      ld      a,$04
497e 2a5786    ld      hl,($8657)
4981 77        ld      (hl),a
4982 01b649    ld      bc,$49b6
4985 2a5986    ld      hl,($8659)
4988 eb        ex      de,hl
4989 21c25a    ld      hl,$5ac2
498c cd6856    call    $5668
498f 325e86    ld      ($865e),a
4992 b7        or      a
4993 c2b549    jp      nz,$49b5
4996 3e05      ld      a,$05
4998 2a5786    ld      hl,($8657)
499b 77        ld      (hl),a
499c 01b649    ld      bc,$49b6
499f 2a5986    ld      hl,($8659)
49a2 eb        ex      de,hl
49a3 21175a    ld      hl,$5a17
49a6 cd6856    call    $5668
49a9 325e86    ld      ($865e),a
49ac b7        or      a
49ad c2b549    jp      nz,$49b5
49b0 af        xor     a
49b1 2a5786    ld      hl,($8657)
49b4 77        ld      (hl),a
49b5 c9        ret     

49b6 08        ex      af,af'
49b7 00        nop     
49b8 00        nop     
49b9 00        nop     
49ba 226086    ld      ($8660),hl
49bd eb        ex      de,hl
49be 226286    ld      ($8662),hl
49c1 3ab38d    ld      a,($8db3)
49c4 b7        or      a
49c5 cace49    jp      z,$49ce
49c8 21cc4b    ld      hl,$4bcc
49cb cdcd71    call    $71cd
49ce 3ab98d    ld      a,($8db9)
49d1 b7        or      a
49d2 cad849    jp      z,$49d8
49d5 cdbf3b    call    $3bbf
49d8 af        xor     a
49d9 2a6286    ld      hl,($8662)
49dc 77        ld      (hl),a
49dd af        xor     a
49de 32b98d    ld      ($8db9),a
49e1 3a1c8e    ld      a,($8e1c)
49e4 32ba8d    ld      ($8dba),a
49e7 3a1c8e    ld      a,($8e1c)
49ea 211f8e    ld      hl,$8e1f
49ed 96        sub     (hl)
49ee 3d        dec     a
49ef d67f      sub     $7f
49f1 9f        sbc     a,a
49f2 326d86    ld      ($866d),a
49f5 b7        or      a
49f6 c2e94a    jp      nz,$4ae9
49f9 2a6286    ld      hl,($8662)
49fc 7e        ld      a,(hl)
49fd 21b88d    ld      hl,$8db8
4a00 96        sub     (hl)
4a01 17        rla     
4a02 3f        ccf     
4a03 9f        sbc     a,a
4a04 326d86    ld      ($866d),a
4a07 b7        or      a
4a08 ca114a    jp      z,$4a11
4a0b 21d04b    ld      hl,$4bd0
4a0e cdcd71    call    $71cd
4a11 3a1c8e    ld      a,($8e1c)
4a14 111f8e    ld      de,$8e1f
4a17 6f        ld      l,a
4a18 17        rla     
4a19 9f        sbc     a,a
4a1a 67        ld      h,a
4a1b 19        add     hl,de
4a1c 7e        ld      a,(hl)
4a1d 326486    ld      ($8664),a
4a20 216c86    ld      hl,$866c
4a23 96        sub     (hl)
4a24 d601      sub     $01
4a26 9f        sbc     a,a
4a27 326d86    ld      ($866d),a
4a2a b7        or      a
4a2b c2664b    jp      nz,$4b66
4a2e 3a6486    ld      a,($8664)
4a31 216786    ld      hl,$8667
4a34 96        sub     (hl)
4a35 d601      sub     $01
4a37 9f        sbc     a,a
4a38 326d86    ld      ($866d),a
4a3b b7        or      a
4a3c c25c4b    jp      nz,$4b5c
4a3f 3abc8d    ld      a,($8dbc)
4a42 b7        or      a
4a43 c2bd4a    jp      nz,$4abd
4a46 3a3b8c    ld      a,($8c3b)
4a49 2f        cpl     
4a4a 326d86    ld      ($866d),a
4a4d b7        or      a
4a4e c2844a    jp      nz,$4a84
4a51 3a6486    ld      a,($8664)
4a54 21c28d    ld      hl,$8dc2
4a57 96        sub     (hl)
4a58 d601      sub     $01
4a5a 9f        sbc     a,a
4a5b 326d86    ld      ($866d),a
4a5e 3a6486    ld      a,($8664)
4a61 21c18d    ld      hl,$8dc1
4a64 96        sub     (hl)
4a65 d601      sub     $01
4a67 9f        sbc     a,a
4a68 326e86    ld      ($866e),a
4a6b 3a6486    ld      a,($8664)
4a6e 21c08d    ld      hl,$8dc0
4a71 96        sub     (hl)
4a72 d601      sub     $01
4a74 9f        sbc     a,a
4a75 216e86    ld      hl,$866e
4a78 b6        or      (hl)
4a79 216d86    ld      hl,$866d
4a7c b6        or      (hl)
4a7d 326f86    ld      ($866f),a
4a80 b7        or      a
4a81 c2df4a    jp      nz,$4adf
4a84 3a6486    ld      a,($8664)
4a87 21bf8d    ld      hl,$8dbf
4a8a 96        sub     (hl)
4a8b d601      sub     $01
4a8d 9f        sbc     a,a
4a8e 326d86    ld      ($866d),a
4a91 3a6486    ld      a,($8664)
4a94 21be8d    ld      hl,$8dbe
4a97 96        sub     (hl)
4a98 d601      sub     $01
4a9a 9f        sbc     a,a
4a9b 216d86    ld      hl,$866d
4a9e b6        or      (hl)
4a9f 326e86    ld      ($866e),a
4aa2 b7        or      a
4aa3 c2234b    jp      nz,$4b23
4aa6 3a6486    ld      a,($8664)
4aa9 216986    ld      hl,$8669
4aac 96        sub     (hl)
4aad d601      sub     $01
4aaf 9f        sbc     a,a
4ab0 326d86    ld      ($866d),a
4ab3 b7        or      a
4ab4 cabd4a    jp      z,$4abd
4ab7 3a6886    ld      a,($8668)
4aba 326486    ld      ($8664),a
4abd 2a6286    ld      hl,($8662)
4ac0 7e        ld      a,(hl)
4ac1 3c        inc     a
4ac2 2a6286    ld      hl,($8662)
4ac5 77        ld      (hl),a
4ac6 7e        ld      a,(hl)
4ac7 6f        ld      l,a
4ac8 17        rla     
4ac9 9f        sbc     a,a
4aca 67        ld      h,a
4acb eb        ex      de,hl
4acc 21ffff    ld      hl,$ffff
4acf 19        add     hl,de
4ad0 eb        ex      de,hl
4ad1 2a6086    ld      hl,($8660)
4ad4 19        add     hl,de
4ad5 227086    ld      ($8670),hl
4ad8 3a6486    ld      a,($8664)
4adb 2a7086    ld      hl,($8670)
4ade 77        ld      (hl),a
4adf 3a1c8e    ld      a,($8e1c)
4ae2 3c        inc     a
4ae3 321c8e    ld      ($8e1c),a
4ae6 c3e749    jp      $49e7
4ae9 3e0d      ld      a,$0d
4aeb 32bd8d    ld      ($8dbd),a
4aee 3abc8d    ld      a,($8dbc)
4af1 b7        or      a
4af2 c28f4b    jp      nz,$4b8f
4af5 3a6486    ld      a,($8664)
4af8 216686    ld      hl,$8666
4afb 96        sub     (hl)
4afc c6ff      add     a,$ff
4afe 9f        sbc     a,a
4aff 326d86    ld      ($866d),a
4b02 b7        or      a
4b03 c2ba4b    jp      nz,$4bba
4b06 2a6286    ld      hl,($8662)
4b09 7e        ld      a,(hl)
4b0a 3d        dec     a
4b0b 2a6286    ld      hl,($8662)
4b0e 77        ld      (hl),a
4b0f 7e        ld      a,(hl)
4b10 3d        dec     a
4b11 d67f      sub     $7f
4b13 9f        sbc     a,a
4b14 326d86    ld      ($866d),a
4b17 b7        or      a
4b18 c2b24b    jp      nz,$4bb2
4b1b 3eff      ld      a,$ff
4b1d 32b98d    ld      ($8db9),a
4b20 c3c149    jp      $49c1
4b23 2a6286    ld      hl,($8662)
4b26 7e        ld      a,(hl)
4b27 d601      sub     $01
4b29 9f        sbc     a,a
4b2a 326d86    ld      ($866d),a
4b2d b7        or      a
4b2e c2df4a    jp      nz,$4adf
4b31 3a6486    ld      a,($8664)
4b34 32bd8d    ld      ($8dbd),a
4b37 3a1c8e    ld      a,($8e1c)
4b3a 3c        inc     a
4b3b 321c8e    ld      ($8e1c),a
4b3e 111c8e    ld      de,$8e1c
4b41 21208e    ld      hl,$8e20
4b44 cda630    call    $30a6
4b47 3a1c8e    ld      a,($8e1c)
4b4a 211f8e    ld      hl,$8e1f
4b4d 96        sub     (hl)
4b4e 3d        dec     a
4b4f d67f      sub     $7f
4b51 9f        sbc     a,a
4b52 326d86    ld      ($866d),a
4b55 b7        or      a
4b56 c2e94a    jp      nz,$4ae9
4b59 c3bf4b    jp      $4bbf
4b5c 3abc8d    ld      a,($8dbc)
4b5f 2f        cpl     
4b60 32bc8d    ld      ($8dbc),a
4b63 c3df4a    jp      $4adf
4b66 2a6286    ld      hl,($8662)
4b69 7e        ld      a,(hl)
4b6a 3c        inc     a
4b6b 2a6286    ld      hl,($8662)
4b6e 77        ld      (hl),a
4b6f 7e        ld      a,(hl)
4b70 6f        ld      l,a
4b71 17        rla     
4b72 9f        sbc     a,a
4b73 67        ld      h,a
4b74 eb        ex      de,hl
4b75 21ffff    ld      hl,$ffff
4b78 19        add     hl,de
4b79 eb        ex      de,hl
4b7a 2a6086    ld      hl,($8660)
4b7d 19        add     hl,de
4b7e 227086    ld      ($8670),hl
4b81 3e0d      ld      a,$0d
4b83 2a7086    ld      hl,($8670)
4b86 77        ld      (hl),a
4b87 3e0a      ld      a,$0a
4b89 326486    ld      ($8664),a
4b8c c3bd4a    jp      $4abd
4b8f 2a6286    ld      hl,($8662)
4b92 7e        ld      a,(hl)
4b93 6f        ld      l,a
4b94 17        rla     
4b95 9f        sbc     a,a
4b96 67        ld      h,a
4b97 eb        ex      de,hl
4b98 2a6086    ld      hl,($8660)
4b9b 19        add     hl,de
4b9c 227086    ld      ($8670),hl
4b9f 116a86    ld      de,$866a
4ba2 2a7086    ld      hl,($8670)
4ba5 cdec71    call    $71ec
4ba8 2a6286    ld      hl,($8662)
4bab 7e        ld      a,(hl)
4bac c602      add     a,$02
4bae 2a6286    ld      hl,($8662)
4bb1 77        ld      (hl),a
4bb2 3eff      ld      a,$ff
4bb4 32b98d    ld      ($8db9),a
4bb7 c3bf4b    jp      $4bbf
4bba 3eff      ld      a,$ff
4bbc 32b38d    ld      ($8db3),a
4bbf 3e50      ld      a,$50
4bc1 32b88d    ld      ($8db8),a
4bc4 2a6086    ld      hl,($8660)
4bc7 7e        ld      a,(hl)
4bc8 32bb8d    ld      ($8dbb),a
4bcb c9        ret     

4bcc 13        inc     de
4bcd 00        nop     
4bce 00        nop     
4bcf 00        nop     
4bd0 0c        inc     c
4bd1 00        nop     
4bd2 00        nop     
4bd3 00        nop     
4bd4 3aba8d    ld      a,($8dba)
4bd7 321c8e    ld      ($8e1c),a
4bda af        xor     a
4bdb 32b38d    ld      ($8db3),a
4bde c9        ret     

4bdf 227486    ld      ($8674),hl
4be2 af        xor     a
4be3 327786    ld      ($8677),a
4be6 af        xor     a
4be7 321f8e    ld      ($8e1f),a
4bea 3ab48d    ld      a,($8db4)
4bed b7        or      a
4bee caf74b    jp      z,$4bf7
4bf1 21324d    ld      hl,$4d32
4bf4 cdcd71    call    $71cd
4bf7 217686    ld      hl,$8676
4bfa cd3a4d    call    $4d3a
4bfd 327d86    ld      ($867d),a
4c00 b7        or      a
4c01 c2d24c    jp      nz,$4cd2
4c04 3a7686    ld      a,($8676)
4c07 d67f      sub     $7f
4c09 d601      sub     $01
4c0b 9f        sbc     a,a
4c0c 327d86    ld      ($867d),a
4c0f 3a7686    ld      a,($8676)
4c12 d608      sub     $08
4c14 d601      sub     $01
4c16 9f        sbc     a,a
4c17 217d86    ld      hl,$867d
4c1a b6        or      (hl)
4c1b 327e86    ld      ($867e),a
4c1e b7        or      a
4c1f c2704c    jp      nz,$4c70
4c22 3a7686    ld      a,($8676)
4c25 d620      sub     $20
4c27 17        rla     
4c28 3f        ccf     
4c29 9f        sbc     a,a
4c2a 327d86    ld      ($867d),a
4c2d b7        or      a
4c2e c2e34c    jp      nz,$4ce3
4c31 3a7686    ld      a,($8676)
4c34 d60d      sub     $0d
4c36 d601      sub     $01
4c38 9f        sbc     a,a
4c39 327d86    ld      ($867d),a
4c3c b7        or      a
4c3d c2d74c    jp      nz,$4cd7
4c40 3a7686    ld      a,($8676)
4c43 d609      sub     $09
4c45 d601      sub     $01
4c47 9f        sbc     a,a
4c48 327d86    ld      ($867d),a
4c4b b7        or      a
4c4c c2ac4c    jp      nz,$4cac
4c4f 3a7686    ld      a,($8676)
4c52 d618      sub     $18
4c54 d601      sub     $01
4c56 9f        sbc     a,a
4c57 327d86    ld      ($867d),a
4c5a b7        or      a
4c5b c2c94c    jp      nz,$4cc9
4c5e 3a7686    ld      a,($8676)
4c61 d61a      sub     $1a
4c63 d601      sub     $01
4c65 9f        sbc     a,a
4c66 327d86    ld      ($867d),a
4c69 b7        or      a
4c6a c2d24c    jp      nz,$4cd2
4c6d c3f74b    jp      $4bf7
4c70 3e01      ld      a,$01
4c72 327786    ld      ($8677),a
4c75 3a1f8e    ld      a,($8e1f)
4c78 d601      sub     $01
4c7a 9f        sbc     a,a
4c7b 327d86    ld      ($867d),a
4c7e b7        or      a
4c7f c2f74b    jp      nz,$4bf7
4c82 2a7486    ld      hl,($8674)
4c85 7e        ld      a,(hl)
4c86 b7        or      a
4c87 ca904c    jp      z,$4c90
4c8a 217886    ld      hl,$8678
4c8d cd3556    call    $5635
4c90 3a1f8e    ld      a,($8e1f)
4c93 3d        dec     a
4c94 321f8e    ld      ($8e1f),a
4c97 3a7786    ld      a,($8677)
4c9a 3d        dec     a
4c9b 327786    ld      ($8677),a
4c9e 3d        dec     a
4c9f d67f      sub     $7f
4ca1 9f        sbc     a,a
4ca2 327d86    ld      ($867d),a
4ca5 b7        or      a
4ca6 c2754c    jp      nz,$4c75
4ca9 c3f74b    jp      $4bf7
4cac 3a1f8e    ld      a,($8e1f)
4caf c608      add     a,$08
4cb1 e6f8      and     $f8
4cb3 211f8e    ld      hl,$8e1f
4cb6 96        sub     (hl)
4cb7 327786    ld      ($8677),a
4cba 3e20      ld      a,$20
4cbc 327686    ld      ($8676),a
4cbf 3a7786    ld      a,($8677)
4cc2 3d        dec     a
4cc3 327786    ld      ($8677),a
4cc6 c3e34c    jp      $4ce3
4cc9 3a1f8e    ld      a,($8e1f)
4ccc 327786    ld      ($8677),a
4ccf c3754c    jp      $4c75
4cd2 3eff      ld      a,$ff
4cd4 32b48d    ld      ($8db4),a
4cd7 2a7486    ld      hl,($8674)
4cda 7e        ld      a,(hl)
4cdb b7        or      a
4cdc cae24c    jp      z,$4ce2
4cdf cddd55    call    $55dd
4ce2 c9        ret     

4ce3 3a1f8e    ld      a,($8e1f)
4ce6 211e8e    ld      hl,$8e1e
4ce9 96        sub     (hl)
4cea 17        rla     
4ceb 3f        ccf     
4cec 9f        sbc     a,a
4ced 327d86    ld      ($867d),a
4cf0 b7        or      a
4cf1 cafa4c    jp      z,$4cfa
4cf4 21364d    ld      hl,$4d36
4cf7 cdcd71    call    $71cd
4cfa 2a7486    ld      hl,($8674)
4cfd 7e        ld      a,(hl)
4cfe b7        or      a
4cff ca084d    jp      z,$4d08
4d02 217686    ld      hl,$8676
4d05 cdbb73    call    $73bb
4d08 3a1f8e    ld      a,($8e1f)
4d0b 3c        inc     a
4d0c 321f8e    ld      ($8e1f),a
4d0f 111f8e    ld      de,$8e1f
4d12 6f        ld      l,a
4d13 17        rla     
4d14 9f        sbc     a,a
4d15 67        ld      h,a
4d16 19        add     hl,de
4d17 227f86    ld      ($867f),hl
4d1a 3a7686    ld      a,($8676)
4d1d 2a7f86    ld      hl,($867f)
4d20 77        ld      (hl),a
4d21 3a7786    ld      a,($8677)
4d24 3d        dec     a
4d25 d67f      sub     $7f
4d27 9f        sbc     a,a
4d28 327d86    ld      ($867d),a
4d2b b7        or      a
4d2c c2bf4c    jp      nz,$4cbf
4d2f c3f74b    jp      $4bf7
4d32 08        ex      af,af'
4d33 00        nop     
4d34 00        nop     
4d35 00        nop     
4d36 0d        dec     c
4d37 00        nop     
4d38 00        nop     
4d39 00        nop     
4d3a 228a86    ld      ($868a),hl
4d3d 3ab68d    ld      a,($8db6)
4d40 b7        or      a
4d41 c2524d    jp      nz,$4d52
4d44 af        xor     a
4d45 328286    ld      ($8682),a
4d48 2a8a86    ld      hl,($868a)
4d4b cd8f73    call    $738f
4d4e 3a8286    ld      a,($8682)
4d51 c9        ret     

4d52 213a8c    ld      hl,$8c3a
4d55 cd956c    call    $6c95
4d58 11654d    ld      de,$4d65
4d5b 2a8a86    ld      hl,($868a)
4d5e cd4a6b    call    $6b4a
4d61 328286    ld      ($8682),a
4d64 c9        ret     

4d65 010000    ld      bc,$0000
4d68 00        nop     
4d69 228e86    ld      ($868e),hl
4d6c eb        ex      de,hl
4d6d 229086    ld      ($8690),hl
4d70 3e02      ld      a,$02
4d72 219286    ld      hl,$8692
4d75 cdbb80    call    $80bb
4d78 3aa4a2    ld      a,($a2a4)
4d7b b7        or      a
4d7c c2a64e    jp      nz,$4ea6
4d7f 3eff      ld      a,$ff
4d81 329f86    ld      ($869f),a
4d84 af        xor     a
4d85 32a086    ld      ($86a0),a
4d88 2a9086    ld      hl,($8690)
4d8b 22a186    ld      ($86a1),hl
4d8e 2a9286    ld      hl,($8692)
4d91 22a386    ld      ($86a3),hl
4d94 2a9486    ld      hl,($8694)
4d97 22a586    ld      ($86a5),hl
4d9a 01a186    ld      bc,$86a1
4d9d 11db4e    ld      de,$4edb
4da0 2a8e86    ld      hl,($868e)
4da3 cde14e    call    $4ee1
4da6 2a9486    ld      hl,($8694)
4da9 7e        ld      a,(hl)
4daa 329886    ld      ($8698),a
4dad 210100    ld      hl,$0001
4db0 eb        ex      de,hl
4db1 2a9486    ld      hl,($8694)
4db4 73        ld      (hl),e
4db5 23        inc     hl
4db6 72        ld      (hl),d
4db7 3e01      ld      a,$01
4db9 329786    ld      ($8697),a
4dbc 3e01      ld      a,$01
4dbe 329686    ld      ($8696),a
4dc1 3a9686    ld      a,($8696)
4dc4 6f        ld      l,a
4dc5 17        rla     
4dc6 9f        sbc     a,a
4dc7 67        ld      h,a
4dc8 eb        ex      de,hl
4dc9 21ffff    ld      hl,$ffff
4dcc 19        add     hl,de
4dcd eb        ex      de,hl
4dce 2a9286    ld      hl,($8692)
4dd1 19        add     hl,de
4dd2 7e        ld      a,(hl)
4dd3 329986    ld      ($8699),a
4dd6 219e86    ld      hl,$869e
4dd9 96        sub     (hl)
4dda d601      sub     $01
4ddc 9f        sbc     a,a
4ddd 32a786    ld      ($86a7),a
4de0 b7        or      a
4de1 c2664e    jp      nz,$4e66
4de4 3a9786    ld      a,($8697)
4de7 6f        ld      l,a
4de8 17        rla     
4de9 9f        sbc     a,a
4dea 67        ld      h,a
4deb eb        ex      de,hl
4dec 21ffff    ld      hl,$ffff
4def 19        add     hl,de
4df0 eb        ex      de,hl
4df1 2a9286    ld      hl,($8692)
4df4 19        add     hl,de
4df5 22a886    ld      ($86a8),hl
4df8 3a9986    ld      a,($8699)
4dfb 2aa886    ld      hl,($86a8)
4dfe 77        ld      (hl),a
4dff 3a9f86    ld      a,($869f)
4e02 b7        or      a
4e03 c2794e    jp      nz,$4e79
4e06 3a9986    ld      a,($8699)
4e09 219c86    ld      hl,$869c
4e0c 96        sub     (hl)
4e0d d601      sub     $01
4e0f 9f        sbc     a,a
4e10 32a786    ld      ($86a7),a
4e13 b7        or      a
4e14 c2524e    jp      nz,$4e52
4e17 3a9986    ld      a,($8699)
4e1a 219a86    ld      hl,$869a
4e1d 96        sub     (hl)
4e1e d601      sub     $01
4e20 9f        sbc     a,a
4e21 32a786    ld      ($86a7),a
4e24 b7        or      a
4e25 c25e4e    jp      nz,$4e5e
4e28 3a9986    ld      a,($8699)
4e2b 219b86    ld      hl,$869b
4e2e 96        sub     (hl)
4e2f d601      sub     $01
4e31 9f        sbc     a,a
4e32 21a086    ld      hl,$86a0
4e35 a6        and     (hl)
4e36 32a786    ld      ($86a7),a
4e39 b7        or      a
4e3a c24b4e    jp      nz,$4e4b
4e3d 3a9786    ld      a,($8697)
4e40 6f        ld      l,a
4e41 17        rla     
4e42 9f        sbc     a,a
4e43 67        ld      h,a
4e44 eb        ex      de,hl
4e45 2a9486    ld      hl,($8694)
4e48 73        ld      (hl),e
4e49 23        inc     hl
4e4a 72        ld      (hl),d
4e4b 3a9786    ld      a,($8697)
4e4e 3c        inc     a
4e4f 329786    ld      ($8697),a
4e52 3a9686    ld      a,($8696)
4e55 219886    ld      hl,$8698
4e58 be        cp      (hl)
4e59 3c        inc     a
4e5a dabe4d    jp      c,$4dbe
4e5d c9        ret     

4e5e 3eff      ld      a,$ff
4e60 32a086    ld      ($86a0),a
4e63 c34b4e    jp      $4e4b
4e66 2a9486    ld      hl,($8694)
4e69 7e        ld      a,(hl)
4e6a 23        inc     hl
4e6b 66        ld      h,(hl)
4e6c 6f        ld      l,a
4e6d 23        inc     hl
4e6e 7d        ld      a,l
4e6f 329786    ld      ($8697),a
4e72 af        xor     a
4e73 32a086    ld      ($86a0),a
4e76 c3e44d    jp      $4de4
4e79 3a9986    ld      a,($8699)
4e7c 219d86    ld      hl,$869d
4e7f 96        sub     (hl)
4e80 3d        dec     a
4e81 c681      add     a,$81
4e83 9f        sbc     a,a
4e84 32a786    ld      ($86a7),a
4e87 3a9986    ld      a,($8699)
4e8a 219b86    ld      hl,$869b
4e8d 96        sub     (hl)
4e8e 17        rla     
4e8f 3f        ccf     
4e90 9f        sbc     a,a
4e91 21a786    ld      hl,$86a7
4e94 a6        and     (hl)
4e95 32aa86    ld      ($86aa),a
4e98 b7        or      a
4e99 c29f4e    jp      nz,$4e9f
4e9c c3064e    jp      $4e06
4e9f af        xor     a
4ea0 329f86    ld      ($869f),a
4ea3 c33d4e    jp      $4e3d
4ea6 21dd4e    ld      hl,$4edd
4ea9 cd2380    call    $8023
4eac 2a8e86    ld      hl,($868e)
4eaf cde17b    call    $7be1
4eb2 cdd678    call    $78d6
4eb5 22ab86    ld      ($86ab),hl
4eb8 210800    ld      hl,$0008
4ebb eb        ex      de,hl
4ebc 2a9086    ld      hl,($8690)
4ebf 19        add     hl,de
4ec0 22a886    ld      ($86a8),hl
4ec3 01ab86    ld      bc,$86ab
4ec6 2aa886    ld      hl,($86a8)
4ec9 eb        ex      de,hl
4eca 2a9286    ld      hl,($8692)
4ecd cd566b    call    $6b56
4ed0 2a9486    ld      hl,($8694)
4ed3 eb        ex      de,hl
4ed4 2a9286    ld      hl,($8692)
4ed7 cd165d    call    $5d16
4eda c9        ret     

4edb 0f        rrca    
4edc 00        nop     
4edd cccc4c    call    z,$4ccc
4ee0 7d        ld      a,l
4ee1 22ae86    ld      ($86ae),hl
4ee4 eb        ex      de,hl
4ee5 22b086    ld      ($86b0),hl
4ee8 3e03      ld      a,$03
4eea 21b286    ld      hl,$86b2
4eed cdbb80    call    $80bb
4ef0 2aae86    ld      hl,($86ae)
4ef3 cd2380    call    $8023
4ef6 21e18a    ld      hl,$8ae1
4ef9 cd1480    call    $8014
4efc 2ab286    ld      hl,($86b2)
4eff 7e        ld      a,(hl)
4f00 32de8a    ld      ($8ade),a
4f03 2ab086    ld      hl,($86b0)
4f06 7e        ld      a,(hl)
4f07 32dd8a    ld      ($8add),a
4f0a af        xor     a
4f0b 32e08a    ld      ($8ae0),a
4f0e af        xor     a
4f0f 32b986    ld      ($86b9),a
4f12 af        xor     a
4f13 32bc86    ld      ($86bc),a
4f16 21e18a    ld      hl,$8ae1
4f19 cd2380    call    $8023
4f1c cac450    jp      z,$50c4
4f1f f23e4f    jp      p,$4f3e
4f22 11c186    ld      de,$86c1
4f25 2ab486    ld      hl,($86b4)
4f28 cda551    call    $51a5
4f2b 32c286    ld      ($86c2),a
4f2e b7        or      a
4f2f c22251    jp      nz,$5122
4f32 21e18a    ld      hl,$8ae1
4f35 cd307a    call    $7a30
4f38 21e18a    ld      hl,$8ae1
4f3b cd1480    call    $8014
4f3e 21e18a    ld      hl,$8ae1
4f41 cd377a    call    $7a37
4f44 214d51    ld      hl,$514d
4f47 cde17b    call    $7be1
4f4a cd6078    call    $7860
4f4d 32df8a    ld      ($8adf),a
4f50 d628      sub     $28
4f52 32df8a    ld      ($8adf),a
4f55 21bd86    ld      hl,$86bd
4f58 cd2380    call    $8023
4f5b 3adf8a    ld      a,($8adf)
4f5e 6f        ld      l,a
4f5f 17        rla     
4f60 9f        sbc     a,a
4f61 67        ld      h,a
4f62 cd467a    call    $7a46
4f65 21c386    ld      hl,$86c3
4f68 cd1480    call    $8014
4f6b 21bd86    ld      hl,$86bd
4f6e cd2380    call    $8023
4f71 3ade8a    ld      a,($8ade)
4f74 6f        ld      l,a
4f75 17        rla     
4f76 9f        sbc     a,a
4f77 67        ld      h,a
4f78 cd467a    call    $7a46
4f7b 21c786    ld      hl,$86c7
4f7e cd1480    call    $8014
4f81 215151    ld      hl,$5151
4f84 cd2380    call    $8023
4f87 21c786    ld      hl,$86c7
4f8a cd567c    call    $7c56
4f8d 21cb86    ld      hl,$86cb
4f90 cd1480    call    $8014
4f93 21e18a    ld      hl,$8ae1
4f96 cd2380    call    $8023
4f99 21c386    ld      hl,$86c3
4f9c cd567c    call    $7c56
4f9f 21cb86    ld      hl,$86cb
4fa2 cde17b    call    $7be1
4fa5 21e18a    ld      hl,$8ae1
4fa8 cd1480    call    $8014
4fab 3ade8a    ld      a,($8ade)
4fae c606      add     a,$06
4fb0 32b886    ld      ($86b8),a
4fb3 3adf8a    ld      a,($8adf)
4fb6 21de8a    ld      hl,$8ade
4fb9 96        sub     (hl)
4fba 17        rla     
4fbb 9f        sbc     a,a
4fbc 32c286    ld      ($86c2),a
4fbf b7        or      a
4fc0 c2de4f    jp      nz,$4fde
4fc3 3adf8a    ld      a,($8adf)
4fc6 c603      add     a,$03
4fc8 32c286    ld      ($86c2),a
4fcb 3ab886    ld      a,($86b8)
4fce 21c286    ld      hl,$86c2
4fd1 96        sub     (hl)
4fd2 17        rla     
4fd3 9f        sbc     a,a
4fd4 32cf86    ld      ($86cf),a
4fd7 b7        or      a
4fd8 c2b750    jp      nz,$50b7
4fdb c31f50    jp      $501f
4fde 3adf8a    ld      a,($8adf)
4fe1 17        rla     
4fe2 9f        sbc     a,a
4fe3 32c286    ld      ($86c2),a
4fe6 b7        or      a
4fe7 c20150    jp      nz,$5001
4fea 3ade8a    ld      a,($8ade)
4fed c602      add     a,$02
4fef 21b886    ld      hl,$86b8
4ff2 96        sub     (hl)
4ff3 3d        dec     a
4ff4 d67f      sub     $7f
4ff6 9f        sbc     a,a
4ff7 32c286    ld      ($86c2),a
4ffa b7        or      a
4ffb c2b750    jp      nz,$50b7
4ffe c31f50    jp      $501f
5001 3adf8a    ld      a,($8adf)
5004 21b886    ld      hl,$86b8
5007 86        add     a,(hl)
5008 32c286    ld      ($86c2),a
500b 3ade8a    ld      a,($8ade)
500e c602      add     a,$02
5010 21c286    ld      hl,$86c2
5013 96        sub     (hl)
5014 3d        dec     a
5015 d67f      sub     $7f
5017 9f        sbc     a,a
5018 32cf86    ld      ($86cf),a
501b b7        or      a
501c c2b750    jp      nz,$50b7
501f 3adf8a    ld      a,($8adf)
5022 17        rla     
5023 3f        ccf     
5024 9f        sbc     a,a
5025 32c286    ld      ($86c2),a
5028 b7        or      a
5029 c24c50    jp      nz,$504c
502c 3ade8a    ld      a,($8ade)
502f 21df8a    ld      hl,$8adf
5032 96        sub     (hl)
5033 32de8a    ld      ($8ade),a
5036 af        xor     a
5037 32df8a    ld      ($8adf),a
503a 21c386    ld      hl,$86c3
503d cd2380    call    $8023
5040 21e18a    ld      hl,$8ae1
5043 cd547d    call    $7d54
5046 21e18a    ld      hl,$8ae1
5049 cd1480    call    $8014
504c 2ab486    ld      hl,($86b4)
504f cd5551    call    $5155
5052 32c286    ld      ($86c2),a
5055 b7        or      a
5056 c22251    jp      nz,$5122
5059 3ade8a    ld      a,($8ade)
505c 3d        dec     a
505d 3d        dec     a
505e d67f      sub     $7f
5060 9f        sbc     a,a
5061 32c286    ld      ($86c2),a
5064 b7        or      a
5065 c28250    jp      nz,$5082
5068 3adf8a    ld      a,($8adf)
506b 3d        dec     a
506c c681      add     a,$81
506e 9f        sbc     a,a
506f 32c286    ld      ($86c2),a
5072 b7        or      a
5073 c2d550    jp      nz,$50d5
5076 214951    ld      hl,$5149
5079 cd2380    call    $8023
507c 21e18a    ld      hl,$8ae1
507f cd1480    call    $8014
5082 3ade8a    ld      a,($8ade)
5085 3d        dec     a
5086 32de8a    ld      ($8ade),a
5089 3adf8a    ld      a,($8adf)
508c c6ff      add     a,$ff
508e 9f        sbc     a,a
508f 32c286    ld      ($86c2),a
5092 b7        or      a
5093 c2ad50    jp      nz,$50ad
5096 3abc86    ld      a,($86bc)
5099 b7        or      a
509a c2d550    jp      nz,$50d5
509d 11d086    ld      de,$86d0
50a0 2ab486    ld      hl,($86b4)
50a3 cda551    call    $51a5
50a6 32c286    ld      ($86c2),a
50a9 b7        or      a
50aa c22251    jp      nz,$5122
50ad 3adf8a    ld      a,($8adf)
50b0 3d        dec     a
50b1 32df8a    ld      ($8adf),a
50b4 c34c50    jp      $504c
50b7 3adf8a    ld      a,($8adf)
50ba 32b986    ld      ($86b9),a
50bd af        xor     a
50be 32df8a    ld      ($8adf),a
50c1 c34c50    jp      $504c
50c4 3e30      ld      a,$30
50c6 2ab486    ld      hl,($86b4)
50c9 77        ld      (hl),a
50ca 210100    ld      hl,$0001
50cd eb        ex      de,hl
50ce 2ab686    ld      hl,($86b6)
50d1 73        ld      (hl),e
50d2 23        inc     hl
50d3 72        ld      (hl),d
50d4 c9        ret     

50d5 3ab986    ld      a,($86b9)
50d8 d601      sub     $01
50da 9f        sbc     a,a
50db 32c286    ld      ($86c2),a
50de b7        or      a
50df c21351    jp      nz,$5113
50e2 11d186    ld      de,$86d1
50e5 2ab486    ld      hl,($86b4)
50e8 cda551    call    $51a5
50eb 32c286    ld      ($86c2),a
50ee b7        or      a
50ef c22251    jp      nz,$5122
50f2 3e02      ld      a,$02
50f4 32de8a    ld      ($8ade),a
50f7 3ab986    ld      a,($86b9)
50fa 6f        ld      l,a
50fb 17        rla     
50fc 9f        sbc     a,a
50fd 67        ld      h,a
50fe cd347e    call    $7e34
5101 21e18a    ld      hl,$8ae1
5104 cd1480    call    $8014
5107 af        xor     a
5108 32b986    ld      ($86b9),a
510b 3eff      ld      a,$ff
510d 32bc86    ld      ($86bc),a
5110 c3164f    jp      $4f16
5113 3ae08a    ld      a,($8ae0)
5116 6f        ld      l,a
5117 17        rla     
5118 9f        sbc     a,a
5119 67        ld      h,a
511a eb        ex      de,hl
511b 2ab686    ld      hl,($86b6)
511e 73        ld      (hl),e
511f 23        inc     hl
5120 72        ld      (hl),d
5121 c9        ret     

5122 af        xor     a
5123 32e08a    ld      ($8ae0),a
5126 3e01      ld      a,$01
5128 32de8a    ld      ($8ade),a
512b 11d286    ld      de,$86d2
512e 2ab486    ld      hl,($86b4)
5131 cda551    call    $51a5
5134 32c286    ld      ($86c2),a
5137 b7        or      a
5138 c2d550    jp      nz,$50d5
513b 3ade8a    ld      a,($8ade)
513e 2ab286    ld      hl,($86b2)
5141 be        cp      (hl)
5142 3c        inc     a
5143 da2851    jp      c,$5128
5146 c3d550    jp      $50d5
5149 00        nop     
514a 00        nop     
514b 00        nop     
514c 00        nop     
514d 00        nop     
514e 00        nop     
514f 2086      jr      nz,$50d7
5151 00        nop     
5152 00        nop     
5153 2083      jr      nz,$50d8
5155 22dc86    ld      ($86dc),hl
5158 21e18a    ld      hl,$8ae1
515b cd2380    call    $8023
515e cd6078    call    $7860
5161 32df86    ld      ($86df),a
5164 21e18a    ld      hl,$8ae1
5167 cd2380    call    $8023
516a 3adf86    ld      a,($86df)
516d 6f        ld      l,a
516e 17        rla     
516f 9f        sbc     a,a
5170 67        ld      h,a
5171 cd3d7c    call    $7c3d
5174 21e18a    ld      hl,$8ae1
5177 cd1480    call    $8014
517a 21a151    ld      hl,$51a1
517d cd2380    call    $8023
5180 21e18a    ld      hl,$8ae1
5183 cd547d    call    $7d54
5186 21e18a    ld      hl,$8ae1
5189 cd1480    call    $8014
518c 3adf86    ld      a,($86df)
518f c630      add     a,$30
5191 32e086    ld      ($86e0),a
5194 11e086    ld      de,$86e0
5197 2adc86    ld      hl,($86dc)
519a cda551    call    $51a5
519d 32d486    ld      ($86d4),a
51a0 c9        ret     

51a1 00        nop     
51a2 00        nop     
51a3 2084      jr      nz,$5129
51a5 22ea86    ld      ($86ea),hl
51a8 eb        ex      de,hl
51a9 22ec86    ld      ($86ec),hl
51ac 3ae08a    ld      a,($8ae0)
51af 21dd8a    ld      hl,$8add
51b2 96        sub     (hl)
51b3 17        rla     
51b4 3f        ccf     
51b5 9f        sbc     a,a
51b6 32ee86    ld      ($86ee),a
51b9 b7        or      a
51ba c2e251    jp      nz,$51e2
51bd 3ae08a    ld      a,($8ae0)
51c0 3c        inc     a
51c1 32e08a    ld      ($8ae0),a
51c4 6f        ld      l,a
51c5 17        rla     
51c6 9f        sbc     a,a
51c7 67        ld      h,a
51c8 eb        ex      de,hl
51c9 21ffff    ld      hl,$ffff
51cc 19        add     hl,de
51cd eb        ex      de,hl
51ce 2aea86    ld      hl,($86ea)
51d1 19        add     hl,de
51d2 22ef86    ld      ($86ef),hl
51d5 2aec86    ld      hl,($86ec)
51d8 7e        ld      a,(hl)
51d9 2aef86    ld      hl,($86ef)
51dc 77        ld      (hl),a
51dd af        xor     a
51de 32e286    ld      ($86e2),a
51e1 c9        ret     

51e2 3eff      ld      a,$ff
51e4 32e286    ld      ($86e2),a
51e7 c9        ret     

51e8 22fa86    ld      ($86fa),hl
51eb eb        ex      de,hl
51ec 22fc86    ld      ($86fc),hl
51ef 60        ld      h,b
51f0 69        ld      l,c
51f1 22fe86    ld      ($86fe),hl
51f4 2afe86    ld      hl,($86fe)
51f7 7e        ld      a,(hl)
51f8 327f8b    ld      ($8b7f),a
51fb af        xor     a
51fc 32838b    ld      ($8b83),a
51ff 2afc86    ld      hl,($86fc)
5202 cd5d52    call    $525d
5205 3a818b    ld      a,($8b81)
5208 32f286    ld      ($86f2),a
520b b7        or      a
520c ca1352    jp      z,$5213
520f 3af286    ld      a,($86f2)
5212 c9        ret     

5213 21768b    ld      hl,$8b76
5216 cd2380    call    $8023
5219 2afa86    ld      hl,($86fa)
521c cd1480    call    $8014
521f 3af286    ld      a,($86f2)
5222 c9        ret     

5223 220987    ld      ($8709),hl
5226 eb        ex      de,hl
5227 220b87    ld      ($870b),hl
522a 60        ld      h,b
522b 69        ld      l,c
522c 220d87    ld      ($870d),hl
522f 2a0d87    ld      hl,($870d)
5232 7e        ld      a,(hl)
5233 327f8b    ld      ($8b7f),a
5236 3eff      ld      a,$ff
5238 32838b    ld      ($8b83),a
523b 2a0b87    ld      hl,($870b)
523e cd5d52    call    $525d
5241 3a818b    ld      a,($8b81)
5244 320187    ld      ($8701),a
5247 b7        or      a
5248 ca4f52    jp      z,$524f
524b 3a0187    ld      a,($8701)
524e c9        ret     

524f 2a7a8b    ld      hl,($8b7a)
5252 eb        ex      de,hl
5253 2a0987    ld      hl,($8709)
5256 73        ld      (hl),e
5257 23        inc     hl
5258 72        ld      (hl),d
5259 3a0187    ld      a,($8701)
525c c9        ret     

525d 221087    ld      ($8710),hl
5260 af        xor     a
5261 32808b    ld      ($8b80),a
5264 af        xor     a
5265 32818b    ld      ($8b81),a
5268 af        xor     a
5269 321687    ld      ($8716),a
526c 3e01      ld      a,$01
526e 327d8b    ld      ($8b7d),a
5271 219353    ld      hl,$5393
5274 cd2380    call    $8023
5277 21768b    ld      hl,$8b76
527a cd1480    call    $8014
527d 2a1087    ld      hl,($8710)
5280 cd9b53    call    $539b
5283 3a7c8b    ld      a,($8b7c)
5286 3c        inc     a
5287 327d8b    ld      ($8b7d),a
528a 3a828b    ld      a,($8b82)
528d b7        or      a
528e c2c652    jp      nz,$52c6
5291 3a808b    ld      a,($8b80)
5294 b7        or      a
5295 ca9952    jp      z,$5299
5298 c9        ret     

5299 3a7e8b    ld      a,($8b7e)
529c 211287    ld      hl,$8712
529f 96        sub     (hl)
52a0 d601      sub     $01
52a2 9f        sbc     a,a
52a3 321887    ld      ($8718),a
52a6 b7        or      a
52a7 c27d52    jp      nz,$527d
52aa 3a7e8b    ld      a,($8b7e)
52ad 211387    ld      hl,$8713
52b0 96        sub     (hl)
52b1 d601      sub     $01
52b3 9f        sbc     a,a
52b4 321887    ld      ($8718),a
52b7 b7        or      a
52b8 c2be52    jp      nz,$52be
52bb c38d53    jp      $538d
52be 3eff      ld      a,$ff
52c0 321687    ld      ($8716),a
52c3 c37d52    jp      $527d
52c6 3a808b    ld      a,($8b80)
52c9 b7        or      a
52ca c26e53    jp      nz,$536e
52cd 3a7e8b    ld      a,($8b7e)
52d0 211587    ld      hl,$8715
52d3 96        sub     (hl)
52d4 c6ff      add     a,$ff
52d6 9f        sbc     a,a
52d7 21838b    ld      hl,$8b83
52da b6        or      (hl)
52db 321887    ld      ($8718),a
52de b7        or      a
52df c28d53    jp      nz,$538d
52e2 3eff      ld      a,$ff
52e4 32838b    ld      ($8b83),a
52e7 af        xor     a
52e8 321787    ld      ($8717),a
52eb 2a1087    ld      hl,($8710)
52ee cd9b53    call    $539b
52f1 3a7c8b    ld      a,($8b7c)
52f4 3c        inc     a
52f5 327d8b    ld      ($8b7d),a
52f8 3a828b    ld      a,($8b82)
52fb b7        or      a
52fc c22c53    jp      nz,$532c
52ff 3a7e8b    ld      a,($8b7e)
5302 211287    ld      hl,$8712
5305 96        sub     (hl)
5306 d601      sub     $01
5308 9f        sbc     a,a
5309 321887    ld      ($8718),a
530c b7        or      a
530d c2eb52    jp      nz,$52eb
5310 3a7e8b    ld      a,($8b7e)
5313 211387    ld      hl,$8713
5316 96        sub     (hl)
5317 d601      sub     $01
5319 9f        sbc     a,a
531a 321887    ld      ($8718),a
531d b7        or      a
531e c22453    jp      nz,$5324
5321 c38d53    jp      $538d
5324 3eff      ld      a,$ff
5326 321787    ld      ($8717),a
5329 c3eb52    jp      $52eb
532c 3a1787    ld      a,($8717)
532f b7        or      a
5330 ca3f53    jp      z,$533f
5333 2a7a8b    ld      hl,($8b7a)
5336 af        xor     a
5337 95        sub     l
5338 6f        ld      l,a
5339 9c        sbc     a,h
533a 95        sub     l
533b 67        ld      h,a
533c 227a8b    ld      ($8b7a),hl
533f 219753    ld      hl,$5397
5342 cd2380    call    $8023
5345 2a7a8b    ld      hl,($8b7a)
5348 cd467a    call    $7a46
534b 21768b    ld      hl,$8b76
534e cd547d    call    $7d54
5351 21768b    ld      hl,$8b76
5354 cd1480    call    $8014
5357 3a1687    ld      a,($8716)
535a b7        or      a
535b ca6d53    jp      z,$536d
535e 21768b    ld      hl,$8b76
5361 cd2380    call    $8023
5364 cddc7a    call    $7adc
5367 21768b    ld      hl,$8b76
536a cd1480    call    $8014
536d c9        ret     

536e 3a838b    ld      a,($8b83)
5371 2f        cpl     
5372 321887    ld      ($8718),a
5375 b7        or      a
5376 c25753    jp      nz,$5357
5379 3a1687    ld      a,($8716)
537c b7        or      a
537d ca8c53    jp      z,$538c
5380 2a7a8b    ld      hl,($8b7a)
5383 af        xor     a
5384 95        sub     l
5385 6f        ld      l,a
5386 9c        sbc     a,h
5387 95        sub     l
5388 67        ld      h,a
5389 227a8b    ld      ($8b7a),hl
538c c9        ret     

538d 3eff      ld      a,$ff
538f 32818b    ld      ($8b81),a
5392 c9        ret     

5393 00        nop     
5394 00        nop     
5395 00        nop     
5396 00        nop     
5397 00        nop     
5398 00        nop     
5399 2084      jr      nz,$531f
539b 221a87    ld      ($871a),hl
539e 212287    ld      hl,$8722
53a1 cd2380    call    $8023
53a4 212687    ld      hl,$8726
53a7 cd1480    call    $8014
53aa 210000    ld      hl,$0000
53ad 227a8b    ld      ($8b7a),hl
53b0 af        xor     a
53b1 32828b    ld      ($8b82),a
53b4 af        xor     a
53b5 321c87    ld      ($871c),a
53b8 3a7d8b    ld      a,($8b7d)
53bb 327c8b    ld      ($8b7c),a
53be 3a7c8b    ld      a,($8b7c)
53c1 6f        ld      l,a
53c2 17        rla     
53c3 9f        sbc     a,a
53c4 67        ld      h,a
53c5 eb        ex      de,hl
53c6 21ffff    ld      hl,$ffff
53c9 19        add     hl,de
53ca eb        ex      de,hl
53cb 2a1a87    ld      hl,($871a)
53ce 19        add     hl,de
53cf 7e        ld      a,(hl)
53d0 327e8b    ld      ($8b7e),a
53d3 212187    ld      hl,$8721
53d6 96        sub     (hl)
53d7 3d        dec     a
53d8 d67f      sub     $7f
53da 9f        sbc     a,a
53db 322a87    ld      ($872a),a
53de 3a7e8b    ld      a,($8b7e)
53e1 212087    ld      hl,$8720
53e4 96        sub     (hl)
53e5 17        rla     
53e6 9f        sbc     a,a
53e7 212a87    ld      hl,$872a
53ea b6        or      (hl)
53eb 322b87    ld      ($872b),a
53ee b7        or      a
53ef c28454    jp      nz,$5484
53f2 3a7e8b    ld      a,($8b7e)
53f5 d630      sub     $30
53f7 327e8b    ld      ($8b7e),a
53fa 3a838b    ld      a,($8b83)
53fd b7        or      a
53fe c25854    jp      nz,$5458
5401 3a1c87    ld      a,($871c)
5404 b7        or      a
5405 c22754    jp      nz,$5427
5408 21d654    ld      hl,$54d6
540b cd2380    call    $8023
540e 21768b    ld      hl,$8b76
5411 cd547d    call    $7d54
5414 3a7e8b    ld      a,($8b7e)
5417 6f        ld      l,a
5418 17        rla     
5419 9f        sbc     a,a
541a 67        ld      h,a
541b cddb7b    call    $7bdb
541e 21768b    ld      hl,$8b76
5421 cd1480    call    $8014
5424 c36e54    jp      $546e
5427 212687    ld      hl,$8726
542a cd2380    call    $8023
542d 3a7e8b    ld      a,($8b7e)
5430 6f        ld      l,a
5431 17        rla     
5432 9f        sbc     a,a
5433 67        ld      h,a
5434 cd4e7d    call    $7d4e
5437 21768b    ld      hl,$8b76
543a cde17b    call    $7be1
543d 21768b    ld      hl,$8b76
5440 cd1480    call    $8014
5443 212687    ld      hl,$8726
5446 cd2380    call    $8023
5449 212287    ld      hl,$8722
544c cd547d    call    $7d54
544f 212687    ld      hl,$8726
5452 cd1480    call    $8014
5455 c36e54    jp      $546e
5458 2a7a8b    ld      hl,($8b7a)
545b eb        ex      de,hl
545c 210a00    ld      hl,$000a
545f cdd37e    call    $7ed3
5462 eb        ex      de,hl
5463 3a7e8b    ld      a,($8b7e)
5466 6f        ld      l,a
5467 17        rla     
5468 9f        sbc     a,a
5469 67        ld      h,a
546a 19        add     hl,de
546b 227a8b    ld      ($8b7a),hl
546e 3eff      ld      a,$ff
5470 32828b    ld      ($8b82),a
5473 3a7c8b    ld      a,($8b7c)
5476 217f8b    ld      hl,$8b7f
5479 be        cp      (hl)
547a 3c        inc     a
547b dabb53    jp      c,$53bb
547e 3eff      ld      a,$ff
5480 32808b    ld      ($8b80),a
5483 c9        ret     

5484 3a7e8b    ld      a,($8b7e)
5487 211d87    ld      hl,$871d
548a 96        sub     (hl)
548b d601      sub     $01
548d 9f        sbc     a,a
548e 322a87    ld      ($872a),a
5491 b7        or      a
5492 c27354    jp      nz,$5473
5495 3a7e8b    ld      a,($8b7e)
5498 211e87    ld      hl,$871e
549b 96        sub     (hl)
549c d601      sub     $01
549e 9f        sbc     a,a
549f 322a87    ld      ($872a),a
54a2 b7        or      a
54a3 c27e54    jp      nz,$547e
54a6 3a7e8b    ld      a,($8b7e)
54a9 211f87    ld      hl,$871f
54ac 96        sub     (hl)
54ad c6ff      add     a,$ff
54af 9f        sbc     a,a
54b0 322a87    ld      ($872a),a
54b3 b7        or      a
54b4 cab854    jp      z,$54b8
54b7 c9        ret     

54b8 3a838b    ld      a,($8b83)
54bb 211c87    ld      hl,$871c
54be b6        or      (hl)
54bf 322a87    ld      ($872a),a
54c2 b7        or      a
54c3 c2ce54    jp      nz,$54ce
54c6 3eff      ld      a,$ff
54c8 321c87    ld      ($871c),a
54cb c37354    jp      $5473
54ce 3eff      ld      a,$ff
54d0 32818b    ld      ($8b81),a
54d3 c37e54    jp      $547e
54d6 00        nop     
54d7 00        nop     
54d8 2084      jr      nz,$545e
54da 211055    ld      hl,$5510
54dd cdbb73    call    $73bb
54e0 212d87    ld      hl,$872d
54e3 cd8873    call    $7388
54e6 3a2d87    ld      a,($872d)
54e9 2f        cpl     
54ea 323087    ld      ($8730),a
54ed b7        or      a
54ee caf254    jp      z,$54f2
54f1 c9        ret     

54f2 212e87    ld      hl,$872e
54f5 cd8f73    call    $738f
54f8 3a2e87    ld      a,($872e)
54fb 212f87    ld      hl,$872f
54fe 96        sub     (hl)
54ff d601      sub     $01
5501 9f        sbc     a,a
5502 323087    ld      ($8730),a
5505 b7        or      a
5506 ca0f55    jp      z,$550f
5509 211455    ld      hl,$5514
550c cdcd71    call    $71cd
550f c9        ret     

5510 00        nop     
5511 00        nop     
5512 00        nop     
5513 00        nop     
5514 25        dec     h
5515 00        nop     
5516 00        nop     
5517 00        nop     
5518 223a87    ld      ($873a),hl
551b eb        ex      de,hl
551c 223c87    ld      ($873c),hl
551f 214f55    ld      hl,$554f
5522 cdcf03    call    $03cf
5525 213f87    ld      hl,$873f
5528 cdcc03    call    $03cc
552b 2a3c87    ld      hl,($873c)
552e eb        ex      de,hl
552f 2a3a87    ld      hl,($873a)
5532 cdbb5c    call    $5cbb
5535 215355    ld      hl,$5553
5538 cdcf03    call    $03cf
553b 2a3c87    ld      hl,($873c)
553e eb        ex      de,hl
553f 2a3a87    ld      hl,($873a)
5542 cdc05b    call    $5bc0
5545 213f87    ld      hl,$873f
5548 cd2573    call    $7325
554b 323287    ld      ($8732),a
554e c9        ret     

554f 02        ld      (bc),a
5550 00        nop     
5551 00        nop     
5552 00        nop     
5553 00        nop     
5554 00        nop     
5555 00        nop     
5556 00        nop     
5557 224287    ld      ($8742),hl
555a eb        ex      de,hl
555b 224487    ld      ($8744),hl
555e 114a87    ld      de,$874a
5561 214687    ld      hl,$8746
5564 cd8d5c    call    $5c8d
5567 2a4487    ld      hl,($8744)
556a 7e        ld      a,(hl)
556b 3d        dec     a
556c 6f        ld      l,a
556d 17        rla     
556e 9f        sbc     a,a
556f 67        ld      h,a
5570 cd347e    call    $7e34
5573 21b3a2    ld      hl,$a2b3
5576 cd547d    call    $7d54
5579 21aba2    ld      hl,$a2ab
557c cde17b    call    $7be1
557f 21d955    ld      hl,$55d9
5582 cd547d    call    $7d54
5585 214e87    ld      hl,$874e
5588 cd1480    call    $8014
558b af        xor     a
558c 32748b    ld      ($8b74),a
558f 11b7a2    ld      de,$a2b7
5592 214e87    ld      hl,$874e
5595 cd2f60    call    $602f
5598 214a87    ld      hl,$874a
559b cd2380    call    $8023
559e 21708b    ld      hl,$8b70
55a1 cd437c    call    $7c43
55a4 215287    ld      hl,$8752
55a7 cd1480    call    $8014
55aa 214687    ld      hl,$8746
55ad cd2380    call    $8023
55b0 216c8b    ld      hl,$8b6c
55b3 cd437c    call    $7c43
55b6 215687    ld      hl,$8756
55b9 cd1480    call    $8014
55bc 114a87    ld      de,$874a
55bf 215687    ld      hl,$8756
55c2 cdc05b    call    $5bc0
55c5 2a4487    ld      hl,($8744)
55c8 eb        ex      de,hl
55c9 2a4287    ld      hl,($8742)
55cc cd735d    call    $5d73
55cf 115287    ld      de,$8752
55d2 214687    ld      hl,$8746
55d5 cdc05b    call    $5bc0
55d8 c9        ret     

55d9 00        nop     
55da 00        nop     
55db 00        nop     
55dc 80        add     a,b
55dd 21ea55    ld      hl,$55ea
55e0 cdbb73    call    $73bb
55e3 21ee55    ld      hl,$55ee
55e6 cdbb73    call    $73bb
55e9 c9        ret     

55ea 0d        dec     c
55eb 00        nop     
55ec 00        nop     
55ed 00        nop     
55ee 0a        ld      a,(bc)
55ef 00        nop     
55f0 00        nop     
55f1 00        nop     
55f2 225c87    ld      ($875c),hl
55f5 eb        ex      de,hl
55f6 225e87    ld      ($875e),hl
55f9 3e01      ld      a,$01
55fb 326087    ld      ($8760),a
55fe 3a6087    ld      a,($8760)
5601 2a5e87    ld      hl,($875e)
5604 96        sub     (hl)
5605 3d        dec     a
5606 d67f      sub     $7f
5608 9f        sbc     a,a
5609 326187    ld      ($8761),a
560c b7        or      a
560d ca1156    jp      z,$5611
5610 c9        ret     

5611 3a6087    ld      a,($8760)
5614 6f        ld      l,a
5615 17        rla     
5616 9f        sbc     a,a
5617 67        ld      h,a
5618 eb        ex      de,hl
5619 21ffff    ld      hl,$ffff
561c 19        add     hl,de
561d eb        ex      de,hl
561e 2a5c87    ld      hl,($875c)
5621 19        add     hl,de
5622 226287    ld      ($8762),hl
5625 2a6287    ld      hl,($8762)
5628 cdbb73    call    $73bb
562b 3a6087    ld      a,($8760)
562e 3c        inc     a
562f 326087    ld      ($8760),a
5632 c3fe55    jp      $55fe
5635 226587    ld      ($8765),hl
5638 210100    ld      hl,$0001
563b 226887    ld      ($8768),hl
563e 2a6887    ld      hl,($8768)
5641 2b        dec     hl
5642 eb        ex      de,hl
5643 2a6587    ld      hl,($8765)
5646 19        add     hl,de
5647 7e        ld      a,(hl)
5648 326787    ld      ($8767),a
564b d624      sub     $24
564d d601      sub     $01
564f 9f        sbc     a,a
5650 326a87    ld      ($876a),a
5653 b7        or      a
5654 ca5856    jp      z,$5658
5657 c9        ret     

5658 216787    ld      hl,$8767
565b cdbb73    call    $73bb
565e 2a6887    ld      hl,($8768)
5661 23        inc     hl
5662 226887    ld      ($8768),hl
5665 c33e56    jp      $563e
5668 0a        ld      a,(bc)
5669 b7        or      a
566a c8        ret     z

566b fe09      cp      $09
566d da7256    jp      c,$5672
5670 3e08      ld      a,$08
5672 326c87    ld      ($876c),a
5675 47        ld      b,a
5676 7e        ld      a,(hl)
5677 326d87    ld      ($876d),a
567a b7        or      a
567b c8        ret     z

567c 23        inc     hl
567d 23        inc     hl
567e 7e        ld      a,(hl)
567f 326e87    ld      ($876e),a
5682 23        inc     hl
5683 0e01      ld      c,$01
5685 d5        push    de
5686 e5        push    hl
5687 1a        ld      a,(de)
5688 fe61      cp      $61
568a da8f56    jp      c,$568f
568d e6df      and     $df
568f be        cp      (hl)
5690 c29e56    jp      nz,$569e
5693 23        inc     hl
5694 13        inc     de
5695 05        dec     b
5696 c28756    jp      nz,$5687
5699 3eff      ld      a,$ff
569b c3b856    jp      $56b8
569e 3a6d87    ld      a,($876d)
56a1 b9        cp      c
56a2 cab656    jp      z,$56b6
56a5 0c        inc     c
56a6 3a6c87    ld      a,($876c)
56a9 47        ld      b,a
56aa e1        pop     hl
56ab 1600      ld      d,$00
56ad 3a6e87    ld      a,($876e)
56b0 5f        ld      e,a
56b1 19        add     hl,de
56b2 d1        pop     de
56b3 c38556    jp      $5685
56b6 af        xor     a
56b7 4f        ld      c,a
56b8 219d8d    ld      hl,$8d9d
56bb 71        ld      (hl),c
56bc 23        inc     hl
56bd 3600      ld      (hl),$00
56bf e1        pop     hl
56c0 d1        pop     de
56c1 c9        ret     

56c2 3a9d8d    ld      a,($8d9d)
56c5 327087    ld      ($8770),a
56c8 3eff      ld      a,$ff
56ca c3ce56    jp      $56ce
56cd af        xor     a
56ce 326f87    ld      ($876f),a
56d1 0a        ld      a,(bc)
56d2 b7        or      a
56d3 c2d856    jp      nz,$56d8
56d6 2f        cpl     
56d7 c9        ret     

56d8 fe09      cp      $09
56da dadf56    jp      c,$56df
56dd 3e08      ld      a,$08
56df 326c87    ld      ($876c),a
56e2 e5        push    hl
56e3 d5        push    de
56e4 c5        push    bc
56e5 216b87    ld      hl,$876b
56e8 cd2049    call    $4920
56eb 7e        ld      a,(hl)
56ec c1        pop     bc
56ed d1        pop     de
56ee e1        pop     hl
56ef b7        or      a
56f0 3eff      ld      a,$ff
56f2 c0        ret     nz

56f3 d5        push    de
56f4 3a6f87    ld      a,($876f)
56f7 b7        or      a
56f8 c21157    jp      nz,$5711
56fb 7e        ld      a,(hl)
56fc 326d87    ld      ($876d),a
56ff 23        inc     hl
5700 be        cp      (hl)
5701 da0a57    jp      c,$570a
5704 216457    ld      hl,$5764
5707 cdcd71    call    $71cd
570a 2b        dec     hl
570b 34        inc     (hl)
570c 23        inc     hl
570d 23        inc     hl
570e c32457    jp      $5724
5711 23        inc     hl
5712 3a7087    ld      a,($8770)
5715 3d        dec     a
5716 326d87    ld      ($876d),a
5719 be        cp      (hl)
571a 23        inc     hl
571b da2457    jp      c,$5724
571e 216257    ld      hl,$5762
5721 cdcd71    call    $71cd
5724 7e        ld      a,(hl)
5725 326e87    ld      ($876e),a
5728 23        inc     hl
5729 e5        push    hl
572a 6f        ld      l,a
572b 2600      ld      h,$00
572d 3a6d87    ld      a,($876d)
5730 5f        ld      e,a
5731 1600      ld      d,$00
5733 cdd37e    call    $7ed3
5736 eb        ex      de,hl
5737 e1        pop     hl
5738 19        add     hl,de
5739 d1        pop     de
573a 3a6c87    ld      a,($876c)
573d 47        ld      b,a
573e 04        inc     b
573f 05        dec     b
5740 ca5157    jp      z,$5751
5743 1a        ld      a,(de)
5744 fe61      cp      $61
5746 da4b57    jp      c,$574b
5749 e6df      and     $df
574b 77        ld      (hl),a
574c 23        inc     hl
574d 13        inc     de
574e c33f57    jp      $573f
5751 3a6c87    ld      a,($876c)
5754 fe08      cp      $08
5756 ca6057    jp      z,$5760
5759 362e      ld      (hl),$2e
575b 23        inc     hl
575c 3c        inc     a
575d c35457    jp      $5754
5760 af        xor     a
5761 c9        ret     

5762 1a        ld      a,(de)
5763 00        nop     
5764 19        add     hl,de
5765 00        nop     
5766 4b        ld      c,e
5767 00        nop     
5768 08        ex      af,af'
5769 40        ld      b,b
576a 7c        ld      a,h
576b 7c        ld      a,h
576c 7c        ld      a,h
576d 7c        ld      a,h
576e 7c        ld      a,h
576f 7c        ld      a,h
5770 7c        ld      a,h
5771 40        ld      b,b
5772 44        ld      b,h
5773 41        ld      b,c
5774 54        ld      d,h
5775 41        ld      b,c
5776 7c        ld      a,h
5777 7c        ld      a,h
5778 7c        ld      a,h
5779 42        ld      b,d
577a 41        ld      b,c
577b 52        ld      d,d
577c 7c        ld      a,h
577d 7c        ld      a,h
577e 7c        ld      a,h
577f 7c        ld      a,h
5780 7c        ld      a,h
5781 42        ld      b,d
5782 4f        ld      c,a
5783 58        ld      e,b
5784 7c        ld      a,h
5785 7c        ld      a,h
5786 7c        ld      a,h
5787 7c        ld      a,h
5788 7c        ld      a,h
5789 43        ld      b,e
578a 55        ld      d,l
578b 52        ld      d,d
578c 56        ld      d,(hl)
578d 45        ld      b,l
578e 7c        ld      a,h
578f 7c        ld      a,h
5790 7c        ld      a,h
5791 43        ld      b,e
5792 54        ld      d,h
5793 45        ld      b,l
5794 58        ld      e,b
5795 54        ld      d,h
5796 7c        ld      a,h
5797 7c        ld      a,h
5798 7c        ld      a,h
5799 43        ld      b,e
579a 4c        ld      c,h
579b 45        ld      b,l
579c 41        ld      b,c
579d 52        ld      d,d
579e 53        ld      d,e
579f 43        ld      b,e
57a0 52        ld      d,d
57a1 44        ld      b,h
57a2 52        ld      d,d
57a3 41        ld      b,c
57a4 57        ld      d,a
57a5 7c        ld      a,h
57a6 7c        ld      a,h
57a7 7c        ld      a,h
57a8 7c        ld      a,h
57a9 44        ld      b,h
57aa 41        ld      b,c
57ab 54        ld      d,h
57ac 41        ld      b,c
57ad 46        ld      b,(hl)
57ae 49        ld      c,c
57af 4c        ld      c,h
57b0 45        ld      b,l
57b1 44        ld      b,h
57b2 49        ld      c,c
57b3 53        ld      d,e
57b4 4b        ld      c,e
57b5 7c        ld      a,h
57b6 7c        ld      a,h
57b7 7c        ld      a,h
57b8 7c        ld      a,h
57b9 44        ld      b,h
57ba 55        ld      d,l
57bb 4d        ld      c,l
57bc 50        ld      d,b
57bd 7c        ld      a,h
57be 7c        ld      a,h
57bf 7c        ld      a,h
57c0 7c        ld      a,h
57c1 45        ld      b,l
57c2 43        ld      b,e
57c3 48        ld      c,b
57c4 4f        ld      c,a
57c5 7c        ld      a,h
57c6 7c        ld      a,h
57c7 7c        ld      a,h
57c8 7c        ld      a,h
57c9 45        ld      b,l
57ca 4e        ld      c,(hl)
57cb 44        ld      b,h
57cc 7c        ld      a,h
57cd 7c        ld      a,h
57ce 7c        ld      a,h
57cf 7c        ld      a,h
57d0 7c        ld      a,h
57d1 45        ld      b,l
57d2 52        ld      d,d
57d3 41        ld      b,c
57d4 53        ld      d,e
57d5 45        ld      b,l
57d6 7c        ld      a,h
57d7 7c        ld      a,h
57d8 7c        ld      a,h
57d9 45        ld      b,l
57da 58        ld      e,b
57db 49        ld      c,c
57dc 54        ld      d,h
57dd 7c        ld      a,h
57de 7c        ld      a,h
57df 7c        ld      a,h
57e0 7c        ld      a,h
57e1 45        ld      b,l
57e2 44        ld      b,h
57e3 49        ld      c,c
57e4 54        ld      d,h
57e5 7c        ld      a,h
57e6 7c        ld      a,h
57e7 7c        ld      a,h
57e8 7c        ld      a,h
57e9 49        ld      c,c
57ea 4e        ld      c,(hl)
57eb 49        ld      c,c
57ec 54        ld      d,h
57ed 49        ld      c,c
57ee 41        ld      b,c
57ef 4c        ld      c,h
57f0 49        ld      c,c
57f1 4a        ld      c,d
57f2 4f        ld      c,a
57f3 59        ld      e,c
57f4 53        ld      d,e
57f5 54        ld      d,h
57f6 49        ld      c,c
57f7 43        ld      b,e
57f8 4b        ld      c,e
57f9 4b        ld      c,e
57fa 45        ld      b,l
57fb 59        ld      e,c
57fc 42        ld      b,d
57fd 4f        ld      c,a
57fe 41        ld      b,c
57ff 52        ld      d,d
5800 44        ld      b,h
5801 4c        ld      c,h
5802 45        ld      b,l
5803 47        ld      b,a
5804 45        ld      b,l
5805 4e        ld      c,(hl)
5806 44        ld      b,h
5807 7c        ld      a,h
5808 7c        ld      a,h
5809 4d        ld      c,l
580a 4f        ld      c,a
580b 56        ld      d,(hl)
580c 45        ld      b,l
580d 7c        ld      a,h
580e 7c        ld      a,h
580f 7c        ld      a,h
5810 7c        ld      a,h
5811 4d        ld      c,l
5812 41        ld      b,c
5813 52        ld      d,d
5814 4b        ld      c,e
5815 7c        ld      a,h
5816 7c        ld      a,h
5817 7c        ld      a,h
5818 7c        ld      a,h
5819 4e        ld      c,(hl)
581a 4f        ld      c,a
581b 2020      jr      nz,$583d
581d 2020      jr      nz,$583f
581f 7c        ld      a,h
5820 7c        ld      a,h
5821 50        ld      d,b
5822 49        ld      c,c
5823 45        ld      b,l
5824 43        ld      b,e
5825 48        ld      c,b
5826 41        ld      b,c
5827 52        ld      d,d
5828 54        ld      d,h
5829 50        ld      d,b
582a 4c        ld      c,h
582b 4f        ld      c,a
582c 54        ld      d,h
582d 7c        ld      a,h
582e 7c        ld      a,h
582f 7c        ld      a,h
5830 7c        ld      a,h
5831 52        ld      d,d
5832 4d        ld      c,l
5833 4f        ld      c,a
5834 56        ld      d,(hl)
5835 45        ld      b,l
5836 7c        ld      a,h
5837 7c        ld      a,h
5838 7c        ld      a,h
5839 52        ld      d,d
583a 55        ld      d,l
583b 4e        ld      c,(hl)
583c 7c        ld      a,h
583d 7c        ld      a,h
583e 7c        ld      a,h
583f 7c        ld      a,h
5840 7c        ld      a,h
5841 52        ld      d,d
5842 4d        ld      c,l
5843 41        ld      b,c
5844 52        ld      d,d
5845 4b        ld      c,e
5846 7c        ld      a,h
5847 7c        ld      a,h
5848 7c        ld      a,h
5849 52        ld      d,d
584a 44        ld      b,h
584b 52        ld      d,d
584c 41        ld      b,c
584d 57        ld      d,a
584e 7c        ld      a,h
584f 7c        ld      a,h
5850 7c        ld      a,h
5851 53        ld      d,e
5852 54        ld      d,h
5853 41        ld      b,c
5854 54        ld      d,h
5855 55        ld      d,l
5856 53        ld      d,e
5857 7c        ld      a,h
5858 7c        ld      a,h
5859 53        ld      d,e
585a 54        ld      d,h
585b 4f        ld      c,a
585c 50        ld      d,b
585d 7c        ld      a,h
585e 7c        ld      a,h
585f 7c        ld      a,h
5860 7c        ld      a,h
5861 54        ld      d,h
5862 45        ld      b,l
5863 58        ld      e,b
5864 54        ld      d,h
5865 7c        ld      a,h
5866 7c        ld      a,h
5867 7c        ld      a,h
5868 7c        ld      a,h
5869 58        ld      e,b
586a 7c        ld      a,h
586b 7c        ld      a,h
586c 7c        ld      a,h
586d 7c        ld      a,h
586e 7c        ld      a,h
586f 7c        ld      a,h
5870 7c        ld      a,h
5871 59        ld      e,c
5872 7c        ld      a,h
5873 7c        ld      a,h
5874 7c        ld      a,h
5875 7c        ld      a,h
5876 7c        ld      a,h
5877 7c        ld      a,h
5878 7c        ld      a,h
5879 7c        ld      a,h
587a 7c        ld      a,h
587b 7c        ld      a,h
587c 7c        ld      a,h
587d 7c        ld      a,h
587e 7c        ld      a,h
587f 7c        ld      a,h
5880 7c        ld      a,h
5881 3f        ccf     
5882 53        ld      d,e
5883 48        ld      c,b
5884 41        ld      b,c
5885 50        ld      d,b
5886 45        ld      b,l
5887 7c        ld      a,h
5888 7c        ld      a,h
5889 3f        ccf     
588a 7c        ld      a,h
588b 7c        ld      a,h
588c 7c        ld      a,h
588d 7c        ld      a,h
588e 7c        ld      a,h
588f 7c        ld      a,h
5890 7c        ld      a,h
5891 3f        ccf     
5892 43        ld      b,e
5893 48        ld      c,b
5894 41        ld      b,c
5895 52        ld      d,d
5896 46        ld      b,(hl)
5897 4f        ld      c,a
5898 52        ld      d,d
5899 3f        ccf     
589a 43        ld      b,e
589b 55        ld      d,l
589c 52        ld      d,d
589d 53        ld      d,e
589e 4f        ld      c,a
589f 52        ld      d,d
58a0 7c        ld      a,h
58a1 41        ld      b,c
58a2 4e        ld      c,(hl)
58a3 47        ld      b,a
58a4 4c        ld      c,h
58a5 45        ld      b,l
58a6 7c        ld      a,h
58a7 7c        ld      a,h
58a8 7c        ld      a,h
58a9 41        ld      b,c
58aa 44        ld      b,h
58ab 4a        ld      c,d
58ac 55        ld      d,l
58ad 53        ld      d,e
58ae 54        ld      d,h
58af 7c        ld      a,h
58b0 7c        ld      a,h
58b1 41        ld      b,c
58b2 55        ld      d,l
58b3 54        ld      d,h
58b4 4f        ld      c,a
58b5 53        ld      d,e
58b6 43        ld      b,e
58b7 41        ld      b,c
58b8 4c        ld      c,h
58b9 41        ld      b,c
58ba 52        ld      d,d
58bb 43        ld      b,e
58bc 7c        ld      a,h
58bd 7c        ld      a,h
58be 7c        ld      a,h
58bf 7c        ld      a,h
58c0 7c        ld      a,h
58c1 43        ld      b,e
58c2 48        ld      c,b
58c3 41        ld      b,c
58c4 52        ld      d,d
58c5 41        ld      b,c
58c6 43        ld      b,e
58c7 54        ld      d,h
58c8 45        ld      b,l
58c9 43        ld      b,e
58ca 49        ld      c,c
58cb 52        ld      d,d
58cc 43        ld      b,e
58cd 4c        ld      c,h
58ce 45        ld      b,l
58cf 7c        ld      a,h
58d0 7c        ld      a,h
58d1 43        ld      b,e
58d2 4f        ld      c,a
58d3 4c        ld      c,h
58d4 4f        ld      c,a
58d5 52        ld      d,d
58d6 7c        ld      a,h
58d7 7c        ld      a,h
58d8 7c        ld      a,h
58d9 43        ld      b,e
58da 4f        ld      c,a
58db 4c        ld      c,h
58dc 55        ld      d,l
58dd 4d        ld      c,l
58de 4e        ld      c,(hl)
58df 53        ld      d,e
58e0 7c        ld      a,h
58e1 43        ld      b,e
58e2 4c        ld      c,h
58e3 49        ld      c,c
58e4 50        ld      d,b
58e5 50        ld      d,b
58e6 49        ld      c,c
58e7 4e        ld      c,(hl)
58e8 47        ld      b,a
58e9 44        ld      b,h
58ea 45        ld      b,l
58eb 43        ld      b,e
58ec 4c        ld      c,h
58ed 41        ld      b,c
58ee 52        ld      d,d
58ef 45        ld      b,l
58f0 7c        ld      a,h
58f1 44        ld      b,h
58f2 45        ld      b,l
58f3 56        ld      d,(hl)
58f4 49        ld      c,c
58f5 43        ld      b,e
58f6 45        ld      b,l
58f7 7c        ld      a,h
58f8 7c        ld      a,h
58f9 45        ld      b,l
58fa 4e        ld      c,(hl)
58fb 44        ld      b,h
58fc 44        ld      b,h
58fd 45        ld      b,l
58fe 56        ld      d,(hl)
58ff 49        ld      c,c
5900 43        ld      b,e
5901 45        ld      b,l
5902 4d        ld      c,l
5903 50        ld      d,b
5904 48        ld      c,b
5905 41        ld      b,c
5906 53        ld      d,e
5907 49        ld      c,c
5908 53        ld      d,e
5909 46        ld      b,(hl)
590a 55        ld      d,l
590b 4c        ld      c,h
590c 4c        ld      c,h
590d 7c        ld      a,h
590e 7c        ld      a,h
590f 7c        ld      a,h
5910 7c        ld      a,h
5911 48        ld      c,b
5912 45        ld      b,l
5913 4c        ld      c,h
5914 50        ld      d,b
5915 7c        ld      a,h
5916 7c        ld      a,h
5917 7c        ld      a,h
5918 7c        ld      a,h
5919 49        ld      c,c
591a 47        ld      b,a
591b 4e        ld      c,(hl)
591c 4f        ld      c,a
591d 52        ld      d,d
591e 45        ld      b,l
591f 7c        ld      a,h
5920 7c        ld      a,h
5921 4c        ld      c,h
5922 49        ld      c,c
5923 4e        ld      c,(hl)
5924 45        ld      b,l
5925 7c        ld      a,h
5926 7c        ld      a,h
5927 7c        ld      a,h
5928 7c        ld      a,h
5929 4d        ld      c,l
592a 45        ld      b,l
592b 53        ld      d,e
592c 53        ld      d,e
592d 41        ld      b,c
592e 47        ld      b,a
592f 45        ld      b,l
5930 7c        ld      a,h
5931 4e        ld      c,(hl)
5932 55        ld      d,l
5933 4d        ld      c,l
5934 42        ld      b,d
5935 45        ld      b,l
5936 52        ld      d,d
5937 7c        ld      a,h
5938 7c        ld      a,h
5939 50        ld      d,b
593a 41        ld      b,c
593b 55        ld      d,l
593c 53        ld      d,e
593d 45        ld      b,l
593e 7c        ld      a,h
593f 7c        ld      a,h
5940 7c        ld      a,h
5941 52        ld      d,d
5942 4f        ld      c,a
5943 57        ld      d,a
5944 53        ld      d,e
5945 7c        ld      a,h
5946 7c        ld      a,h
5947 7c        ld      a,h
5948 7c        ld      a,h
5949 52        ld      d,d
594a 45        ld      b,l
594b 53        ld      d,e
594c 45        ld      b,l
594d 52        ld      d,d
594e 56        ld      d,(hl)
594f 45        ld      b,l
5950 7c        ld      a,h
5951 52        ld      d,d
5952 45        ld      b,l
5953 47        ld      b,a
5954 49        ld      c,c
5955 4f        ld      c,a
5956 4e        ld      c,(hl)
5957 7c        ld      a,h
5958 7c        ld      a,h
5959 53        ld      d,e
595a 45        ld      b,l
595b 51        ld      d,c
595c 55        ld      d,l
595d 45        ld      b,l
595e 4e        ld      c,(hl)
595f 43        ld      b,e
5960 45        ld      b,l
5961 53        ld      d,e
5962 4f        ld      c,a
5963 4c        ld      c,h
5964 49        ld      c,c
5965 44        ld      b,h
5966 7c        ld      a,h
5967 7c        ld      a,h
5968 7c        ld      a,h
5969 53        ld      d,e
596a 48        ld      c,b
596b 41        ld      b,c
596c 44        ld      b,h
596d 49        ld      c,c
596e 4e        ld      c,(hl)
596f 47        ld      b,a
5970 7c        ld      a,h
5971 53        ld      d,e
5972 50        ld      d,b
5973 41        ld      b,c
5974 43        ld      b,e
5975 49        ld      c,c
5976 4e        ld      c,(hl)
5977 47        ld      b,a
5978 7c        ld      a,h
5979 53        ld      d,e
597a 48        ld      c,b
597b 41        ld      b,c
597c 50        ld      d,b
597d 45        ld      b,l
597e 7c        ld      a,h
597f 7c        ld      a,h
5980 7c        ld      a,h
5981 53        ld      d,e
5982 43        ld      b,e
5983 41        ld      b,c
5984 4c        ld      c,h
5985 45        ld      b,l
5986 7c        ld      a,h
5987 7c        ld      a,h
5988 7c        ld      a,h
5989 53        ld      d,e
598a 59        ld      e,c
598b 4d        ld      c,l
598c 42        ld      b,d
598d 4f        ld      c,a
598e 4c        ld      c,h
598f 7c        ld      a,h
5990 7c        ld      a,h
5991 53        ld      d,e
5992 51        ld      d,c
5993 55        ld      d,l
5994 41        ld      b,c
5995 52        ld      d,d
5996 45        ld      b,l
5997 7c        ld      a,h
5998 7c        ld      a,h
5999 54        ld      d,h
599a 49        ld      c,c
599b 54        ld      d,h
599c 4c        ld      c,h
599d 45        ld      b,l
599e 7c        ld      a,h
599f 7c        ld      a,h
59a0 7c        ld      a,h
59a1 55        ld      d,l
59a2 56        ld      d,(hl)
59a3 49        ld      c,c
59a4 45        ld      b,l
59a5 57        ld      d,a
59a6 50        ld      d,b
59a7 4f        ld      c,a
59a8 52        ld      d,d
59a9 55        ld      d,l
59aa 57        ld      d,a
59ab 49        ld      c,c
59ac 4e        ld      c,(hl)
59ad 44        ld      b,h
59ae 4f        ld      c,a
59af 57        ld      d,a
59b0 7c        ld      a,h
59b1 57        ld      d,a
59b2 56        ld      d,(hl)
59b3 49        ld      c,c
59b4 45        ld      b,l
59b5 57        ld      d,a
59b6 50        ld      d,b
59b7 4f        ld      c,a
59b8 52        ld      d,d
59b9 57        ld      d,a
59ba 57        ld      d,a
59bb 49        ld      c,c
59bc 4e        ld      c,(hl)
59bd 44        ld      b,h
59be 4f        ld      c,a
59bf 57        ld      d,a
59c0 7c        ld      a,h
59c1 00        nop     
59c2 0a        ld      a,(bc)
59c3 08        ex      af,af'
59c4 2e2e      ld      l,$2e
59c6 2e2e      ld      l,$2e
59c8 2e2e      ld      l,$2e
59ca 2e2e      ld      l,$2e
59cc 2e2e      ld      l,$2e
59ce 2e2e      ld      l,$2e
59d0 2e2e      ld      l,$2e
59d2 2e2e      ld      l,$2e
59d4 2e2e      ld      l,$2e
59d6 2e2e      ld      l,$2e
59d8 2e2e      ld      l,$2e
59da 2e2e      ld      l,$2e
59dc 2e2e      ld      l,$2e
59de 2e2e      ld      l,$2e
59e0 2e2e      ld      l,$2e
59e2 2e2e      ld      l,$2e
59e4 2e2e      ld      l,$2e
59e6 2e2e      ld      l,$2e
59e8 2e2e      ld      l,$2e
59ea 2e2e      ld      l,$2e
59ec 2e2e      ld      l,$2e
59ee 2e2e      ld      l,$2e
59f0 2e2e      ld      l,$2e
59f2 2e2e      ld      l,$2e
59f4 2e2e      ld      l,$2e
59f6 2e2e      ld      l,$2e
59f8 2e2e      ld      l,$2e
59fa 2e2e      ld      l,$2e
59fc 2e2e      ld      l,$2e
59fe 2e2e      ld      l,$2e
5a00 2e2e      ld      l,$2e
5a02 2e2e      ld      l,$2e
5a04 2e2e      ld      l,$2e
5a06 2e2e      ld      l,$2e
5a08 2e2e      ld      l,$2e
5a0a 2e2e      ld      l,$2e
5a0c 2e2e      ld      l,$2e
5a0e 2e2e      ld      l,$2e
5a10 2e2e      ld      l,$2e
5a12 2e2e      ld      l,$2e
5a14 00        nop     
5a15 00        nop     
5a16 08        ex      af,af'
5a17 15        dec     d
5a18 15        dec     d
5a19 08        ex      af,af'
5a1a 52        ld      d,d
5a1b 302e      jr      nc,$5a4b
5a1d 2e2e      ld      l,$2e
5a1f 2e2e      ld      l,$2e
5a21 2e52      ld      l,$52
5a23 312e2e    ld      sp,$2e2e
5a26 2e2e      ld      l,$2e
5a28 2e2e      ld      l,$2e
5a2a 52        ld      d,d
5a2b 322e2e    ld      ($2e2e),a
5a2e 2e2e      ld      l,$2e
5a30 2e2e      ld      l,$2e
5a32 52        ld      d,d
5a33 33        inc     sp
5a34 2e2e      ld      l,$2e
5a36 2e2e      ld      l,$2e
5a38 2e2e      ld      l,$2e
5a3a 52        ld      d,d
5a3b 34        inc     (hl)
5a3c 2e2e      ld      l,$2e
5a3e 2e2e      ld      l,$2e
5a40 2e2e      ld      l,$2e
5a42 52        ld      d,d
5a43 35        dec     (hl)
5a44 2e2e      ld      l,$2e
5a46 2e2e      ld      l,$2e
5a48 2e2e      ld      l,$2e
5a4a 52        ld      d,d
5a4b 362e      ld      (hl),$2e
5a4d 2e2e      ld      l,$2e
5a4f 2e2e      ld      l,$2e
5a51 2e52      ld      l,$52
5a53 37        scf     
5a54 2e2e      ld      l,$2e
5a56 2e2e      ld      l,$2e
5a58 2e2e      ld      l,$2e
5a5a 52        ld      d,d
5a5b 382e      jr      c,$5a8b
5a5d 2e2e      ld      l,$2e
5a5f 2e2e      ld      l,$2e
5a61 2e52      ld      l,$52
5a63 39        add     hl,sp
5a64 2e2e      ld      l,$2e
5a66 2e2e      ld      l,$2e
5a68 2e2e      ld      l,$2e
5a6a 52        ld      d,d
5a6b 31302e    ld      sp,$2e30
5a6e 2e2e      ld      l,$2e
5a70 2e2e      ld      l,$2e
5a72 52        ld      d,d
5a73 31312e    ld      sp,$2e31
5a76 2e2e      ld      l,$2e
5a78 2e2e      ld      l,$2e
5a7a 52        ld      d,d
5a7b 31322e    ld      sp,$2e32
5a7e 2e2e      ld      l,$2e
5a80 2e2e      ld      l,$2e
5a82 52        ld      d,d
5a83 31332e    ld      sp,$2e33
5a86 2e2e      ld      l,$2e
5a88 2e2e      ld      l,$2e
5a8a 52        ld      d,d
5a8b 31342e    ld      sp,$2e34
5a8e 2e2e      ld      l,$2e
5a90 2e2e      ld      l,$2e
5a92 52        ld      d,d
5a93 31352e    ld      sp,$2e35
5a96 2e2e      ld      l,$2e
5a98 2e2e      ld      l,$2e
5a9a 52        ld      d,d
5a9b 31362e    ld      sp,$2e36
5a9e 2e2e      ld      l,$2e
5aa0 2e2e      ld      l,$2e
5aa2 52        ld      d,d
5aa3 31372e    ld      sp,$2e37
5aa6 2e2e      ld      l,$2e
5aa8 2e2e      ld      l,$2e
5aaa 52        ld      d,d
5aab 31382e    ld      sp,$2e38
5aae 2e2e      ld      l,$2e
5ab0 2e2e      ld      l,$2e
5ab2 52        ld      d,d
5ab3 31392e    ld      sp,$2e39
5ab6 2e2e      ld      l,$2e
5ab8 2e2e      ld      l,$2e
5aba 52        ld      d,d
5abb 32302e    ld      ($2e30),a
5abe 2e2e      ld      l,$2e
5ac0 2e2e      ld      l,$2e
5ac2 15        dec     d
5ac3 15        dec     d
5ac4 08        ex      af,af'
5ac5 43        ld      b,e
5ac6 302e      jr      nc,$5af6
5ac8 2e2e      ld      l,$2e
5aca 2e2e      ld      l,$2e
5acc 2e43      ld      l,$43
5ace 312e2e    ld      sp,$2e2e
5ad1 2e2e      ld      l,$2e
5ad3 2e2e      ld      l,$2e
5ad5 43        ld      b,e
5ad6 322e2e    ld      ($2e2e),a
5ad9 2e2e      ld      l,$2e
5adb 2e2e      ld      l,$2e
5add 43        ld      b,e
5ade 33        inc     sp
5adf 2e2e      ld      l,$2e
5ae1 2e2e      ld      l,$2e
5ae3 2e2e      ld      l,$2e
5ae5 43        ld      b,e
5ae6 34        inc     (hl)
5ae7 2e2e      ld      l,$2e
5ae9 2e2e      ld      l,$2e
5aeb 2e2e      ld      l,$2e
5aed 43        ld      b,e
5aee 35        dec     (hl)
5aef 2e2e      ld      l,$2e
5af1 2e2e      ld      l,$2e
5af3 2e2e      ld      l,$2e
5af5 43        ld      b,e
5af6 362e      ld      (hl),$2e
5af8 2e2e      ld      l,$2e
5afa 2e2e      ld      l,$2e
5afc 2e43      ld      l,$43
5afe 37        scf     
5aff 2e2e      ld      l,$2e
5b01 2e2e      ld      l,$2e
5b03 2e2e      ld      l,$2e
5b05 43        ld      b,e
5b06 382e      jr      c,$5b36
5b08 2e2e      ld      l,$2e
5b0a 2e2e      ld      l,$2e
5b0c 2e43      ld      l,$43
5b0e 39        add     hl,sp
5b0f 2e2e      ld      l,$2e
5b11 2e2e      ld      l,$2e
5b13 2e2e      ld      l,$2e
5b15 43        ld      b,e
5b16 31302e    ld      sp,$2e30
5b19 2e2e      ld      l,$2e
5b1b 2e2e      ld      l,$2e
5b1d 43        ld      b,e
5b1e 31312e    ld      sp,$2e31
5b21 2e2e      ld      l,$2e
5b23 2e2e      ld      l,$2e
5b25 43        ld      b,e
5b26 31322e    ld      sp,$2e32
5b29 2e2e      ld      l,$2e
5b2b 2e2e      ld      l,$2e
5b2d 43        ld      b,e
5b2e 31332e    ld      sp,$2e33
5b31 2e2e      ld      l,$2e
5b33 2e2e      ld      l,$2e
5b35 43        ld      b,e
5b36 31342e    ld      sp,$2e34
5b39 2e2e      ld      l,$2e
5b3b 2e2e      ld      l,$2e
5b3d 43        ld      b,e
5b3e 31352e    ld      sp,$2e35
5b41 2e2e      ld      l,$2e
5b43 2e2e      ld      l,$2e
5b45 43        ld      b,e
5b46 31362e    ld      sp,$2e36
5b49 2e2e      ld      l,$2e
5b4b 2e2e      ld      l,$2e
5b4d 43        ld      b,e
5b4e 31372e    ld      sp,$2e37
5b51 2e2e      ld      l,$2e
5b53 2e2e      ld      l,$2e
5b55 43        ld      b,e
5b56 31382e    ld      sp,$2e38
5b59 2e2e      ld      l,$2e
5b5b 2e2e      ld      l,$2e
5b5d 43        ld      b,e
5b5e 31392e    ld      sp,$2e39
5b61 2e2e      ld      l,$2e
5b63 2e2e      ld      l,$2e
5b65 43        ld      b,e
5b66 32302e    ld      ($2e30),a
5b69 2e2e      ld      l,$2e
5b6b 2e2e      ld      l,$2e
5b6d 227a87    ld      ($877a),hl
5b70 2a7a87    ld      hl,($877a)
5b73 cdc92a    call    $2ac9
5b76 327287    ld      ($8772),a
5b79 2f        cpl     
5b7a 327d87    ld      ($877d),a
5b7d b7        or      a
5b7e ca855b    jp      z,$5b85
5b81 3a7287    ld      a,($8772)
5b84 c9        ret     

5b85 cd3c61    call    $613c
5b88 cd8167    call    $6781
5b8b 3a7287    ld      a,($8772)
5b8e c9        ret     

5b8f 227f87    ld      ($877f),hl
5b92 af        xor     a
5b93 32958a    ld      ($8a95),a
5b96 2a7f87    ld      hl,($877f)
5b99 7e        ld      a,(hl)
5b9a 32948a    ld      ($8a94),a
5b9d 2f        cpl     
5b9e 328187    ld      ($8781),a
5ba1 b7        or      a
5ba2 caa65b    jp      z,$5ba6
5ba5 c9        ret     

5ba6 cd3c61    call    $613c
5ba9 11688b    ld      de,$8b68
5bac 21648b    ld      hl,$8b64
5baf cd3965    call    $6539
5bb2 3a938a    ld      a,($8a93)
5bb5 21928a    ld      hl,$8a92
5bb8 b6        or      (hl)
5bb9 c6ff      add     a,$ff
5bbb 9f        sbc     a,a
5bbc 32958a    ld      ($8a95),a
5bbf c9        ret     

5bc0 228387    ld      ($8783),hl
5bc3 eb        ex      de,hl
5bc4 228587    ld      ($8785),hl
5bc7 af        xor     a
5bc8 32608b    ld      ($8b60),a
5bcb 3eff      ld      a,$ff
5bcd 32748b    ld      ($8b74),a
5bd0 2a8587    ld      hl,($8785)
5bd3 eb        ex      de,hl
5bd4 2a8387    ld      hl,($8783)
5bd7 cde65e    call    $5ee6
5bda cda664    call    $64a6
5bdd c9        ret     

5bde 228887    ld      ($8788),hl
5be1 eb        ex      de,hl
5be2 228a87    ld      ($878a),hl
5be5 af        xor     a
5be6 32608b    ld      ($8b60),a
5be9 af        xor     a
5bea 32748b    ld      ($8b74),a
5bed 2a8a87    ld      hl,($878a)
5bf0 eb        ex      de,hl
5bf1 2a8887    ld      hl,($8788)
5bf4 cde65e    call    $5ee6
5bf7 cda664    call    $64a6
5bfa c9        ret     

5bfb 228d87    ld      ($878d),hl
5bfe eb        ex      de,hl
5bff 228f87    ld      ($878f),hl
5c02 3e01      ld      a,$01
5c04 32608b    ld      ($8b60),a
5c07 3eff      ld      a,$ff
5c09 32748b    ld      ($8b74),a
5c0c 2a8f87    ld      hl,($878f)
5c0f eb        ex      de,hl
5c10 2a8d87    ld      hl,($878d)
5c13 cde65e    call    $5ee6
5c16 cda664    call    $64a6
5c19 c9        ret     

5c1a 229287    ld      ($8792),hl
5c1d eb        ex      de,hl
5c1e 229487    ld      ($8794),hl
5c21 3e01      ld      a,$01
5c23 32608b    ld      ($8b60),a
5c26 af        xor     a
5c27 32748b    ld      ($8b74),a
5c2a 2a9487    ld      hl,($8794)
5c2d eb        ex      de,hl
5c2e 2a9287    ld      hl,($8792)
5c31 cde65e    call    $5ee6
5c34 cda664    call    $64a6
5c37 c9        ret     

5c38 229787    ld      ($8797),hl
5c3b eb        ex      de,hl
5c3c 229987    ld      ($8799),hl
5c3f 60        ld      h,b
5c40 69        ld      l,c
5c41 229b87    ld      ($879b),hl
5c44 2a9b87    ld      hl,($879b)
5c47 7e        ld      a,(hl)
5c48 32618b    ld      ($8b61),a
5c4b 3e02      ld      a,$02
5c4d 32608b    ld      ($8b60),a
5c50 3eff      ld      a,$ff
5c52 32748b    ld      ($8b74),a
5c55 2a9987    ld      hl,($8799)
5c58 eb        ex      de,hl
5c59 2a9787    ld      hl,($8797)
5c5c cde65e    call    $5ee6
5c5f cda664    call    $64a6
5c62 c9        ret     

5c63 229e87    ld      ($879e),hl
5c66 eb        ex      de,hl
5c67 22a087    ld      ($87a0),hl
5c6a 60        ld      h,b
5c6b 69        ld      l,c
5c6c 22a287    ld      ($87a2),hl
5c6f 2aa287    ld      hl,($87a2)
5c72 7e        ld      a,(hl)
5c73 32618b    ld      ($8b61),a
5c76 3e02      ld      a,$02
5c78 32608b    ld      ($8b60),a
5c7b af        xor     a
5c7c 32748b    ld      ($8b74),a
5c7f 2aa087    ld      hl,($87a0)
5c82 eb        ex      de,hl
5c83 2a9e87    ld      hl,($879e)
5c86 cde65e    call    $5ee6
5c89 cda664    call    $64a6
5c8c c9        ret     

5c8d 22a587    ld      ($87a5),hl
5c90 eb        ex      de,hl
5c91 22a787    ld      ($87a7),hl
5c94 3eff      ld      a,$ff
5c96 32748b    ld      ($8b74),a
5c99 11688b    ld      de,$8b68
5c9c 21648b    ld      hl,$8b64
5c9f cd2f60    call    $602f
5ca2 216c8b    ld      hl,$8b6c
5ca5 cd2380    call    $8023
5ca8 2aa587    ld      hl,($87a5)
5cab cd1480    call    $8014
5cae 21708b    ld      hl,$8b70
5cb1 cd2380    call    $8023
5cb4 2aa787    ld      hl,($87a7)
5cb7 cd1480    call    $8014
5cba c9        ret     

5cbb 22aa87    ld      ($87aa),hl
5cbe eb        ex      de,hl
5cbf 22ac87    ld      ($87ac),hl
5cc2 11b087    ld      de,$87b0
5cc5 21ae87    ld      hl,$87ae
5cc8 cdd203    call    $03d2
5ccb 2aae87    ld      hl,($87ae)
5cce cd347e    call    $7e34
5cd1 21298b    ld      hl,$8b29
5cd4 cd567c    call    $7c56
5cd7 21648b    ld      hl,$8b64
5cda cd1480    call    $8014
5cdd 2ab087    ld      hl,($87b0)
5ce0 cd347e    call    $7e34
5ce3 21318b    ld      hl,$8b31
5ce6 cd567c    call    $7c56
5ce9 21688b    ld      hl,$8b68
5cec cd1480    call    $8014
5cef 3eff      ld      a,$ff
5cf1 32748b    ld      ($8b74),a
5cf4 11688b    ld      de,$8b68
5cf7 21648b    ld      hl,$8b64
5cfa cd2f60    call    $602f
5cfd 216c8b    ld      hl,$8b6c
5d00 cd2380    call    $8023
5d03 2aaa87    ld      hl,($87aa)
5d06 cd1480    call    $8014
5d09 21708b    ld      hl,$8b70
5d0c cd2380    call    $8023
5d0f 2aac87    ld      hl,($87ac)
5d12 cd1480    call    $8014
5d15 c9        ret     

5d16 22b387    ld      ($87b3),hl
5d19 eb        ex      de,hl
5d1a 22b587    ld      ($87b5),hl
5d1d 210000    ld      hl,$0000
5d20 eb        ex      de,hl
5d21 2ab587    ld      hl,($87b5)
5d24 73        ld      (hl),e
5d25 23        inc     hl
5d26 72        ld      (hl),d
5d27 2ab587    ld      hl,($87b5)
5d2a 7e        ld      a,(hl)
5d2b 23        inc     hl
5d2c 66        ld      h,(hl)
5d2d 6f        ld      l,a
5d2e eb        ex      de,hl
5d2f 2ab387    ld      hl,($87b3)
5d32 19        add     hl,de
5d33 7e        ld      a,(hl)
5d34 215f8b    ld      hl,$8b5f
5d37 96        sub     (hl)
5d38 d601      sub     $01
5d3a 9f        sbc     a,a
5d3b 32b787    ld      ($87b7),a
5d3e b7        or      a
5d3f ca435d    jp      z,$5d43
5d42 c9        ret     

5d43 2ab587    ld      hl,($87b5)
5d46 7e        ld      a,(hl)
5d47 23        inc     hl
5d48 66        ld      h,(hl)
5d49 6f        ld      l,a
5d4a 23        inc     hl
5d4b eb        ex      de,hl
5d4c 2ab587    ld      hl,($87b5)
5d4f 73        ld      (hl),e
5d50 23        inc     hl
5d51 72        ld      (hl),d
5d52 eb        ex      de,hl
5d53 117cff    ld      de,$ff7c
5d56 19        add     hl,de
5d57 7d        ld      a,l
5d58 07        rlca    
5d59 b5        or      l
5d5a e67f      and     $7f
5d5c b4        or      h
5d5d 3d        dec     a
5d5e c681      add     a,$81
5d60 9f        sbc     a,a
5d61 32b787    ld      ($87b7),a
5d64 b7        or      a
5d65 c2275d    jp      nz,$5d27
5d68 210100    ld      hl,$0001
5d6b eb        ex      de,hl
5d6c 2ab587    ld      hl,($87b5)
5d6f 73        ld      (hl),e
5d70 23        inc     hl
5d71 72        ld      (hl),d
5d72 c9        ret     

5d73 22b987    ld      ($87b9),hl
5d76 eb        ex      de,hl
5d77 22bb87    ld      ($87bb),hl
5d7a 21648b    ld      hl,$8b64
5d7d cd2380    call    $8023
5d80 21be87    ld      hl,$87be
5d83 cd1480    call    $8014
5d86 21688b    ld      hl,$8b68
5d89 cd2380    call    $8023
5d8c 21c287    ld      hl,$87c2
5d8f cd1480    call    $8014
5d92 af        xor     a
5d93 32608b    ld      ($8b60),a
5d96 210100    ld      hl,$0001
5d99 22c687    ld      ($87c6),hl
5d9c 2ac687    ld      hl,($87c6)
5d9f 2b        dec     hl
5da0 eb        ex      de,hl
5da1 2ab987    ld      hl,($87b9)
5da4 19        add     hl,de
5da5 7e        ld      a,(hl)
5da6 32bd87    ld      ($87bd),a
5da9 d60a      sub     $0a
5dab d601      sub     $01
5dad 9f        sbc     a,a
5dae 32c887    ld      ($87c8),a
5db1 b7        or      a
5db2 c2145e    jp      nz,$5e14
5db5 3abd87    ld      a,($87bd)
5db8 d60d      sub     $0d
5dba d601      sub     $01
5dbc 9f        sbc     a,a
5dbd 32c887    ld      ($87c8),a
5dc0 b7        or      a
5dc1 c25f5e    jp      nz,$5e5f
5dc4 3a958a    ld      a,($8a95)
5dc7 2f        cpl     
5dc8 32c887    ld      ($87c8),a
5dcb b7        or      a
5dcc cad85d    jp      z,$5dd8
5dcf 117a5e    ld      de,$5e7a
5dd2 21bd87    ld      hl,$87bd
5dd5 cdea03    call    $03ea
5dd8 21bba2    ld      hl,$a2bb
5ddb cd2380    call    $8023
5dde 21648b    ld      hl,$8b64
5de1 cde17b    call    $7be1
5de4 216c8b    ld      hl,$8b6c
5de7 cd1480    call    $8014
5dea 21bfa2    ld      hl,$a2bf
5ded cd2380    call    $8023
5df0 21688b    ld      hl,$8b68
5df3 cde17b    call    $7be1
5df6 21708b    ld      hl,$8b70
5df9 cd1480    call    $8014
5dfc cda664    call    $64a6
5dff 2ac687    ld      hl,($87c6)
5e02 23        inc     hl
5e03 eb        ex      de,hl
5e04 2abb87    ld      hl,($87bb)
5e07 7e        ld      a,(hl)
5e08 23        inc     hl
5e09 66        ld      h,(hl)
5e0a 6f        ld      l,a
5e0b eb        ex      de,hl
5e0c 7b        ld      a,e
5e0d 95        sub     l
5e0e 7a        ld      a,d
5e0f 9c        sbc     a,h
5e10 f2995d    jp      p,$5d99
5e13 c9        ret     

5e14 21c3a2    ld      hl,$a2c3
5e17 cd2380    call    $8023
5e1a 21648b    ld      hl,$8b64
5e1d cde17b    call    $7be1
5e20 216c8b    ld      hl,$8b6c
5e23 cd1480    call    $8014
5e26 21688b    ld      hl,$8b68
5e29 cd2380    call    $8023
5e2c 21c7a2    ld      hl,$a2c7
5e2f cd437c    call    $7c43
5e32 21708b    ld      hl,$8b70
5e35 cd1480    call    $8014
5e38 21be87    ld      hl,$87be
5e3b cd2380    call    $8023
5e3e 21c3a2    ld      hl,$a2c3
5e41 cde17b    call    $7be1
5e44 21be87    ld      hl,$87be
5e47 cd1480    call    $8014
5e4a 21c287    ld      hl,$87c2
5e4d cd2380    call    $8023
5e50 21c7a2    ld      hl,$a2c7
5e53 cd437c    call    $7c43
5e56 21c287    ld      hl,$87c2
5e59 cd1480    call    $8014
5e5c c3fc5d    jp      $5dfc
5e5f 21be87    ld      hl,$87be
5e62 cd2380    call    $8023
5e65 216c8b    ld      hl,$8b6c
5e68 cd1480    call    $8014
5e6b 21c287    ld      hl,$87c2
5e6e cd2380    call    $8023
5e71 21708b    ld      hl,$8b70
5e74 cd1480    call    $8014
5e77 c3fc5d    jp      $5dfc
5e7a 010000    ld      bc,$0000
5e7d 00        nop     
5e7e 22ca87    ld      ($87ca),hl
5e81 eb        ex      de,hl
5e82 22cc87    ld      ($87cc),hl
5e85 60        ld      h,b
5e86 69        ld      l,c
5e87 22ce87    ld      ($87ce),hl
5e8a 21298b    ld      hl,$8b29
5e8d cd2380    call    $8023
5e90 2aca87    ld      hl,($87ca)
5e93 cd547d    call    $7d54
5e96 21e25e    ld      hl,$5ee2
5e99 cde17b    call    $7be1
5e9c cdd678    call    $78d6
5e9f 22598b    ld      ($8b59),hl
5ea2 21318b    ld      hl,$8b31
5ea5 cd2380    call    $8023
5ea8 2acc87    ld      hl,($87cc)
5eab cd547d    call    $7d54
5eae 21e25e    ld      hl,$5ee2
5eb1 cde17b    call    $7be1
5eb4 cdd678    call    $78d6
5eb7 225b8b    ld      ($8b5b),hl
5eba 21298b    ld      hl,$8b29
5ebd cd2380    call    $8023
5ec0 2ace87    ld      hl,($87ce)
5ec3 cd547d    call    $7d54
5ec6 21e25e    ld      hl,$5ee2
5ec9 cde17b    call    $7be1
5ecc cdd678    call    $78d6
5ecf 225d8b    ld      ($8b5d),hl
5ed2 015d8b    ld      bc,$8b5d
5ed5 115b8b    ld      de,$8b5b
5ed8 21598b    ld      hl,$8b59
5edb cded03    call    $03ed
5ede cd8167    call    $6781
5ee1 c9        ret     

5ee2 00        nop     
5ee3 00        nop     
5ee4 00        nop     
5ee5 80        add     a,b
5ee6 22d187    ld      ($87d1),hl
5ee9 eb        ex      de,hl
5eea 22d387    ld      ($87d3),hl
5eed 3a758b    ld      a,($8b75)
5ef0 c6ff      add     a,$ff
5ef2 9f        sbc     a,a
5ef3 32d587    ld      ($87d5),a
5ef6 b7        or      a
5ef7 c23f5f    jp      nz,$5f3f
5efa 3a748b    ld      a,($8b74)
5efd b7        or      a
5efe c2265f    jp      nz,$5f26
5f01 21648b    ld      hl,$8b64
5f04 cd2380    call    $8023
5f07 2ad187    ld      hl,($87d1)
5f0a cde17b    call    $7be1
5f0d 216c8b    ld      hl,$8b6c
5f10 cd1480    call    $8014
5f13 21688b    ld      hl,$8b68
5f16 cd2380    call    $8023
5f19 2ad387    ld      hl,($87d3)
5f1c cde17b    call    $7be1
5f1f 21708b    ld      hl,$8b70
5f22 cd1480    call    $8014
5f25 c9        ret     

5f26 2ad187    ld      hl,($87d1)
5f29 cd2380    call    $8023
5f2c 216c8b    ld      hl,$8b6c
5f2f cd1480    call    $8014
5f32 2ad387    ld      hl,($87d3)
5f35 cd2380    call    $8023
5f38 21708b    ld      hl,$8b70
5f3b cd1480    call    $8014
5f3e c9        ret     

5f3f 3a758b    ld      a,($8b75)
5f42 3d        dec     a
5f43 c6ff      add     a,$ff
5f45 9f        sbc     a,a
5f46 32d587    ld      ($87d5),a
5f49 b7        or      a
5f4a c2b65f    jp      nz,$5fb6
5f4d 3a748b    ld      a,($8b74)
5f50 b7        or      a
5f51 c2855f    jp      nz,$5f85
5f54 2103a3    ld      hl,$a303
5f57 cd2380    call    $8023
5f5a 2ad187    ld      hl,($87d1)
5f5d cd547d    call    $7d54
5f60 21648b    ld      hl,$8b64
5f63 cde17b    call    $7be1
5f66 216c8b    ld      hl,$8b6c
5f69 cd1480    call    $8014
5f6c 210ba3    ld      hl,$a30b
5f6f cd2380    call    $8023
5f72 2ad387    ld      hl,($87d3)
5f75 cd547d    call    $7d54
5f78 21688b    ld      hl,$8b68
5f7b cde17b    call    $7be1
5f7e 21708b    ld      hl,$8b70
5f81 cd1480    call    $8014
5f84 c9        ret     

5f85 2103a3    ld      hl,$a303
5f88 cd2380    call    $8023
5f8b 2ad187    ld      hl,($87d1)
5f8e cd547d    call    $7d54
5f91 21ffa2    ld      hl,$a2ff
5f94 cde17b    call    $7be1
5f97 216c8b    ld      hl,$8b6c
5f9a cd1480    call    $8014
5f9d 210ba3    ld      hl,$a30b
5fa0 cd2380    call    $8023
5fa3 2ad387    ld      hl,($87d3)
5fa6 cd547d    call    $7d54
5fa9 2107a3    ld      hl,$a307
5fac cde17b    call    $7be1
5faf 21708b    ld      hl,$8b70
5fb2 cd1480    call    $8014
5fb5 c9        ret     

5fb6 3a758b    ld      a,($8b75)
5fb9 d602      sub     $02
5fbb c6ff      add     a,$ff
5fbd 9f        sbc     a,a
5fbe 32d587    ld      ($87d5),a
5fc1 b7        or      a
5fc2 c22e60    jp      nz,$602e
5fc5 3a748b    ld      a,($8b74)
5fc8 b7        or      a
5fc9 c2fd5f    jp      nz,$5ffd
5fcc 21e3a2    ld      hl,$a2e3
5fcf cd2380    call    $8023
5fd2 2ad187    ld      hl,($87d1)
5fd5 cd547d    call    $7d54
5fd8 21648b    ld      hl,$8b64
5fdb cde17b    call    $7be1
5fde 216c8b    ld      hl,$8b6c
5fe1 cd1480    call    $8014
5fe4 21eba2    ld      hl,$a2eb
5fe7 cd2380    call    $8023
5fea 2ad387    ld      hl,($87d3)
5fed cd547d    call    $7d54
5ff0 21688b    ld      hl,$8b68
5ff3 cde17b    call    $7be1
5ff6 21708b    ld      hl,$8b70
5ff9 cd1480    call    $8014
5ffc c9        ret     

5ffd 21e3a2    ld      hl,$a2e3
6000 cd2380    call    $8023
6003 2ad187    ld      hl,($87d1)
6006 cd547d    call    $7d54
6009 21dfa2    ld      hl,$a2df
600c cde17b    call    $7be1
600f 216c8b    ld      hl,$8b6c
6012 cd1480    call    $8014
6015 21eba2    ld      hl,$a2eb
6018 cd2380    call    $8023
601b 2ad387    ld      hl,($87d3)
601e cd547d    call    $7d54
6021 21e7a2    ld      hl,$a2e7
6024 cde17b    call    $7be1
6027 21708b    ld      hl,$8b70
602a cd1480    call    $8014
602d c9        ret     

602e c9        ret     

602f 22d787    ld      ($87d7),hl
6032 eb        ex      de,hl
6033 22d987    ld      ($87d9),hl
6036 3a758b    ld      a,($8b75)
6039 c6ff      add     a,$ff
603b 9f        sbc     a,a
603c 32db87    ld      ($87db),a
603f b7        or      a
6040 c25c60    jp      nz,$605c
6043 2ad787    ld      hl,($87d7)
6046 cd2380    call    $8023
6049 216c8b    ld      hl,$8b6c
604c cd1480    call    $8014
604f 2ad987    ld      hl,($87d9)
6052 cd2380    call    $8023
6055 21708b    ld      hl,$8b70
6058 cd1480    call    $8014
605b c9        ret     

605c 3a758b    ld      a,($8b75)
605f 3d        dec     a
6060 c6ff      add     a,$ff
6062 9f        sbc     a,a
6063 32db87    ld      ($87db),a
6066 b7        or      a
6067 c2cb60    jp      nz,$60cb
606a 3a748b    ld      a,($8b74)
606d 2f        cpl     
606e 32db87    ld      ($87db),a
6071 b7        or      a
6072 c2a660    jp      nz,$60a6
6075 2ad787    ld      hl,($87d7)
6078 cd2380    call    $8023
607b 21ffa2    ld      hl,$a2ff
607e cd437c    call    $7c43
6081 2103a3    ld      hl,$a303
6084 cd567c    call    $7c56
6087 216c8b    ld      hl,$8b6c
608a cd1480    call    $8014
608d 2ad987    ld      hl,($87d9)
6090 cd2380    call    $8023
6093 2107a3    ld      hl,$a307
6096 cd437c    call    $7c43
6099 210ba3    ld      hl,$a30b
609c cd567c    call    $7c56
609f 21708b    ld      hl,$8b70
60a2 cd1480    call    $8014
60a5 c9        ret     

60a6 2ad787    ld      hl,($87d7)
60a9 cd2380    call    $8023
60ac 2103a3    ld      hl,$a303
60af cd567c    call    $7c56
60b2 216c8b    ld      hl,$8b6c
60b5 cd1480    call    $8014
60b8 2ad987    ld      hl,($87d9)
60bb cd2380    call    $8023
60be 210ba3    ld      hl,$a30b
60c1 cd567c    call    $7c56
60c4 21708b    ld      hl,$8b70
60c7 cd1480    call    $8014
60ca c9        ret     

60cb 3a758b    ld      a,($8b75)
60ce d602      sub     $02
60d0 c6ff      add     a,$ff
60d2 9f        sbc     a,a
60d3 32db87    ld      ($87db),a
60d6 b7        or      a
60d7 c23b61    jp      nz,$613b
60da 3a748b    ld      a,($8b74)
60dd 2f        cpl     
60de 32db87    ld      ($87db),a
60e1 b7        or      a
60e2 c21661    jp      nz,$6116
60e5 2ad787    ld      hl,($87d7)
60e8 cd2380    call    $8023
60eb 21dfa2    ld      hl,$a2df
60ee cd437c    call    $7c43
60f1 21e3a2    ld      hl,$a2e3
60f4 cd567c    call    $7c56
60f7 216c8b    ld      hl,$8b6c
60fa cd1480    call    $8014
60fd 2ad987    ld      hl,($87d9)
6100 cd2380    call    $8023
6103 21e7a2    ld      hl,$a2e7
6106 cd437c    call    $7c43
6109 21eba2    ld      hl,$a2eb
610c cd567c    call    $7c56
610f 21708b    ld      hl,$8b70
6112 cd1480    call    $8014
6115 c9        ret     

6116 2ad787    ld      hl,($87d7)
6119 cd2380    call    $8023
611c 21e3a2    ld      hl,$a2e3
611f cd567c    call    $7c56
6122 216c8b    ld      hl,$8b6c
6125 cd1480    call    $8014
6128 2ad987    ld      hl,($87d9)
612b cd2380    call    $8023
612e 21eba2    ld      hl,$a2eb
6131 cd567c    call    $7c56
6134 21708b    ld      hl,$8b70
6137 cd1480    call    $8014
613a c9        ret     

613b c9        ret     

613c 3a628b    ld      a,($8b62)
613f b7        or      a
6140 c28b62    jp      nz,$628b
6143 114f8b    ld      de,$8b4f
6146 214d8b    ld      hl,$8b4d
6149 cdde03    call    $03de
614c 21de87    ld      hl,$87de
614f cd2380    call    $8023
6152 21258b    ld      hl,$8b25
6155 cd1480    call    $8014
6158 21de87    ld      hl,$87de
615b cd2380    call    $8023
615e 212d8b    ld      hl,$8b2d
6161 cd1480    call    $8014
6164 2a4d8b    ld      hl,($8b4d)
6167 cd347e    call    $7e34
616a 21298b    ld      hl,$8b29
616d cd1480    call    $8014
6170 2a4f8b    ld      hl,($8b4f)
6173 cd347e    call    $7e34
6176 21318b    ld      hl,$8b31
6179 cd1480    call    $8014
617c 21298b    ld      hl,$8b29
617f cd567c    call    $7c56
6182 21e287    ld      hl,$87e2
6185 cd1480    call    $8014
6188 21498b    ld      hl,$8b49
618b cd2380    call    $8023
618e 21458b    ld      hl,$8b45
6191 cd567c    call    $7c56
6194 21e687    ld      hl,$87e6
6197 cd1480    call    $8014
619a 21c563    ld      hl,$63c5
619d cd437c    call    $7c43
61a0 3d        dec     a
61a1 d67f      sub     $7f
61a3 9f        sbc     a,a
61a4 32dd87    ld      ($87dd),a
61a7 21e687    ld      hl,$87e6
61aa cd2380    call    $8023
61ad 21e287    ld      hl,$87e2
61b0 cd437c    call    $7c43
61b3 17        rla     
61b4 9f        sbc     a,a
61b5 32ea87    ld      ($87ea),a
61b8 b7        or      a
61b9 c2e861    jp      nz,$61e8
61bc 3add87    ld      a,($87dd)
61bf 2f        cpl     
61c0 32ea87    ld      ($87ea),a
61c3 b7        or      a
61c4 cad961    jp      z,$61d9
61c7 21318b    ld      hl,$8b31
61ca cd2380    call    $8023
61cd 21e687    ld      hl,$87e6
61d0 cd567c    call    $7c56
61d3 21318b    ld      hl,$8b31
61d6 cd1480    call    $8014
61d9 21318b    ld      hl,$8b31
61dc cd2380    call    $8023
61df 21298b    ld      hl,$8b29
61e2 cd1480    call    $8014
61e5 c30d62    jp      $620d
61e8 3add87    ld      a,($87dd)
61eb b7        or      a
61ec ca0162    jp      z,$6201
61ef 21e687    ld      hl,$87e6
61f2 cd2380    call    $8023
61f5 21298b    ld      hl,$8b29
61f8 cd547d    call    $7d54
61fb 21298b    ld      hl,$8b29
61fe cd1480    call    $8014
6201 21298b    ld      hl,$8b29
6204 cd2380    call    $8023
6207 21318b    ld      hl,$8b31
620a cd1480    call    $8014
620d 21f98a    ld      hl,$8af9
6210 cd2380    call    $8023
6213 21f58a    ld      hl,$8af5
6216 cd437c    call    $7c43
6219 21eb87    ld      hl,$87eb
621c cd1480    call    $8014
621f 21e98a    ld      hl,$8ae9
6222 cd2380    call    $8023
6225 21e58a    ld      hl,$8ae5
6228 cd437c    call    $7c43
622b 21eb87    ld      hl,$87eb
622e cd567c    call    $7c56
6231 2103a3    ld      hl,$a303
6234 cd1480    call    $8014
6237 21f58a    ld      hl,$8af5
623a cd547d    call    $7d54
623d 21e58a    ld      hl,$8ae5
6240 cd437c    call    $7c43
6243 cddc7a    call    $7adc
6246 21ffa2    ld      hl,$a2ff
6249 cd1480    call    $8014
624c 21018b    ld      hl,$8b01
624f cd2380    call    $8023
6252 21fd8a    ld      hl,$8afd
6255 cd437c    call    $7c43
6258 21ef87    ld      hl,$87ef
625b cd1480    call    $8014
625e 21f18a    ld      hl,$8af1
6261 cd2380    call    $8023
6264 21ed8a    ld      hl,$8aed
6267 cd437c    call    $7c43
626a 21ef87    ld      hl,$87ef
626d cd567c    call    $7c56
6270 210ba3    ld      hl,$a30b
6273 cd1480    call    $8014
6276 21fd8a    ld      hl,$8afd
6279 cd547d    call    $7d54
627c 21ed8a    ld      hl,$8aed
627f cd437c    call    $7c43
6282 cddc7a    call    $7adc
6285 2107a3    ld      hl,$a307
6288 cd1480    call    $8014
628b 21198b    ld      hl,$8b19
628e cd2380    call    $8023
6291 21158b    ld      hl,$8b15
6294 cd437c    call    $7c43
6297 21eb87    ld      hl,$87eb
629a cd1480    call    $8014
629d 21098b    ld      hl,$8b09
62a0 cd2380    call    $8023
62a3 21058b    ld      hl,$8b05
62a6 cd437c    call    $7c43
62a9 21eb87    ld      hl,$87eb
62ac cd567c    call    $7c56
62af 21f3a2    ld      hl,$a2f3
62b2 cd1480    call    $8014
62b5 21158b    ld      hl,$8b15
62b8 cd547d    call    $7d54
62bb 21058b    ld      hl,$8b05
62be cd437c    call    $7c43
62c1 cddc7a    call    $7adc
62c4 21efa2    ld      hl,$a2ef
62c7 cd1480    call    $8014
62ca 21218b    ld      hl,$8b21
62cd cd2380    call    $8023
62d0 211d8b    ld      hl,$8b1d
62d3 cd437c    call    $7c43
62d6 21ef87    ld      hl,$87ef
62d9 cd1480    call    $8014
62dc 21118b    ld      hl,$8b11
62df cd2380    call    $8023
62e2 210d8b    ld      hl,$8b0d
62e5 cd437c    call    $7c43
62e8 21ef87    ld      hl,$87ef
62eb cd567c    call    $7c56
62ee 21fba2    ld      hl,$a2fb
62f1 cd1480    call    $8014
62f4 211d8b    ld      hl,$8b1d
62f7 cd547d    call    $7d54
62fa 210d8b    ld      hl,$8b0d
62fd cd437c    call    $7c43
6300 cddc7a    call    $7adc
6303 21f7a2    ld      hl,$a2f7
6306 cd1480    call    $8014
6309 2103a3    ld      hl,$a303
630c cd2380    call    $8023
630f 21f3a2    ld      hl,$a2f3
6312 cd547d    call    $7d54
6315 21e3a2    ld      hl,$a2e3
6318 cd1480    call    $8014
631b 2103a3    ld      hl,$a303
631e cd2380    call    $8023
6321 21efa2    ld      hl,$a2ef
6324 cd547d    call    $7d54
6327 21ffa2    ld      hl,$a2ff
632a cde17b    call    $7be1
632d 21dfa2    ld      hl,$a2df
6330 cd1480    call    $8014
6333 210ba3    ld      hl,$a30b
6336 cd2380    call    $8023
6339 21fba2    ld      hl,$a2fb
633c cd547d    call    $7d54
633f 21eba2    ld      hl,$a2eb
6342 cd1480    call    $8014
6345 210ba3    ld      hl,$a30b
6348 cd2380    call    $8023
634b 21f7a2    ld      hl,$a2f7
634e cd547d    call    $7d54
6351 2107a3    ld      hl,$a307
6354 cde17b    call    $7be1
6357 21e7a2    ld      hl,$a2e7
635a cd1480    call    $8014
635d af        xor     a
635e 32628b    ld      ($8b62),a
6361 2103a3    ld      hl,$a303
6364 cd2380    call    $8023
6367 21058b    ld      hl,$8b05
636a cd547d    call    $7d54
636d 21ffa2    ld      hl,$a2ff
6370 cde17b    call    $7be1
6373 21358b    ld      hl,$8b35
6376 cd1480    call    $8014
6379 2103a3    ld      hl,$a303
637c cd2380    call    $8023
637f 21098b    ld      hl,$8b09
6382 cd547d    call    $7d54
6385 21ffa2    ld      hl,$a2ff
6388 cde17b    call    $7be1
638b 21398b    ld      hl,$8b39
638e cd1480    call    $8014
6391 210ba3    ld      hl,$a30b
6394 cd2380    call    $8023
6397 210d8b    ld      hl,$8b0d
639a cd547d    call    $7d54
639d 2107a3    ld      hl,$a307
63a0 cde17b    call    $7be1
63a3 213d8b    ld      hl,$8b3d
63a6 cd1480    call    $8014
63a9 210ba3    ld      hl,$a30b
63ac cd2380    call    $8023
63af 21118b    ld      hl,$8b11
63b2 cd547d    call    $7d54
63b5 2107a3    ld      hl,$a307
63b8 cde17b    call    $7be1
63bb 21418b    ld      hl,$8b41
63be cd1480    call    $8014
63c1 cdc963    call    $63c9
63c4 c9        ret     

63c5 00        nop     
63c6 00        nop     
63c7 00        nop     
63c8 81        add     a,c
63c9 3a948a    ld      a,($8a94)
63cc 2f        cpl     
63cd 32f587    ld      ($87f5),a
63d0 b7        or      a
63d1 cad563    jp      z,$63d5
63d4 c9        ret     

63d5 3a758b    ld      a,($8b75)
63d8 c6ff      add     a,$ff
63da 9f        sbc     a,a
63db 32f587    ld      ($87f5),a
63de b7        or      a
63df c21564    jp      nz,$6415
63e2 21a264    ld      hl,$64a2
63e5 cd2380    call    $8023
63e8 219e8a    ld      hl,$8a9e
63eb cd1480    call    $8014
63ee 21458b    ld      hl,$8b45
63f1 cd2380    call    $8023
63f4 21a28a    ld      hl,$8aa2
63f7 cd1480    call    $8014
63fa 21a264    ld      hl,$64a2
63fd cd2380    call    $8023
6400 21a68a    ld      hl,$8aa6
6403 cd1480    call    $8014
6406 21498b    ld      hl,$8b49
6409 cd2380    call    $8023
640c 21aa8a    ld      hl,$8aaa
640f cd1480    call    $8014
6412 c39564    jp      $6495
6415 3a758b    ld      a,($8b75)
6418 3d        dec     a
6419 c6ff      add     a,$ff
641b 9f        sbc     a,a
641c 32f587    ld      ($87f5),a
641f b7        or      a
6420 c25664    jp      nz,$6456
6423 21e58a    ld      hl,$8ae5
6426 cd2380    call    $8023
6429 219e8a    ld      hl,$8a9e
642c cd1480    call    $8014
642f 21e98a    ld      hl,$8ae9
6432 cd2380    call    $8023
6435 21a28a    ld      hl,$8aa2
6438 cd1480    call    $8014
643b 21ed8a    ld      hl,$8aed
643e cd2380    call    $8023
6441 21a68a    ld      hl,$8aa6
6444 cd1480    call    $8014
6447 21f18a    ld      hl,$8af1
644a cd2380    call    $8023
644d 21aa8a    ld      hl,$8aaa
6450 cd1480    call    $8014
6453 c39564    jp      $6495
6456 3a758b    ld      a,($8b75)
6459 d602      sub     $02
645b c6ff      add     a,$ff
645d 9f        sbc     a,a
645e 32f587    ld      ($87f5),a
6461 b7        or      a
6462 c29564    jp      nz,$6495
6465 21358b    ld      hl,$8b35
6468 cd2380    call    $8023
646b 219e8a    ld      hl,$8a9e
646e cd1480    call    $8014
6471 21398b    ld      hl,$8b39
6474 cd2380    call    $8023
6477 21a28a    ld      hl,$8aa2
647a cd1480    call    $8014
647d 213d8b    ld      hl,$8b3d
6480 cd2380    call    $8023
6483 21a68a    ld      hl,$8aa6
6486 cd1480    call    $8014
6489 21418b    ld      hl,$8b41
648c cd2380    call    $8023
648f 21aa8a    ld      hl,$8aaa
6492 cd1480    call    $8014
6495 11688b    ld      de,$8b68
6498 21648b    ld      hl,$8b64
649b cd3965    call    $6539
649e 32958a    ld      ($8a95),a
64a1 c9        ret     

64a2 00        nop     
64a3 00        nop     
64a4 00        nop     
64a5 00        nop     
64a6 3a948a    ld      a,($8a94)
64a9 b7        or      a
64aa c2b764    jp      nz,$64b7
64ad 11708b    ld      de,$8b70
64b0 216c8b    ld      hl,$8b6c
64b3 cd4b68    call    $684b
64b6 c9        ret     

64b7 11708b    ld      de,$8b70
64ba 216c8b    ld      hl,$8b6c
64bd cd3965    call    $6539
64c0 32f787    ld      ($87f7),a
64c3 3a958a    ld      a,($8a95)
64c6 b7        or      a
64c7 c2ff64    jp      nz,$64ff
64ca 3af787    ld      a,($87f7)
64cd 2f        cpl     
64ce 32fc87    ld      ($87fc),a
64d1 b7        or      a
64d2 c2ad64    jp      nz,$64ad
64d5 3eff      ld      a,$ff
64d7 32958a    ld      ($8a95),a
64da cd1466    call    $6614
64dd 119a8a    ld      de,$8a9a
64e0 21968a    ld      hl,$8a96
64e3 cd4b68    call    $684b
64e6 216c8b    ld      hl,$8b6c
64e9 cd2380    call    $8023
64ec 21648b    ld      hl,$8b64
64ef cd1480    call    $8014
64f2 21708b    ld      hl,$8b70
64f5 cd2380    call    $8023
64f8 21688b    ld      hl,$8b68
64fb cd1480    call    $8014
64fe c9        ret     

64ff 3af787    ld      a,($87f7)
6502 b7        or      a
6503 c2e664    jp      nz,$64e6
6506 af        xor     a
6507 32958a    ld      ($8a95),a
650a 3a608b    ld      a,($8b60)
650d 3d        dec     a
650e c6ff      add     a,$ff
6510 9f        sbc     a,a
6511 32fc87    ld      ($87fc),a
6514 b7        or      a
6515 c2ad64    jp      nz,$64ad
6518 af        xor     a
6519 32608b    ld      ($8b60),a
651c 11688b    ld      de,$8b68
651f 21648b    ld      hl,$8b64
6522 cd3965    call    $6539
6525 cd1466    call    $6614
6528 119a8a    ld      de,$8a9a
652b 21968a    ld      hl,$8a96
652e cd4b68    call    $684b
6531 3e01      ld      a,$01
6533 32608b    ld      ($8b60),a
6536 c3ad64    jp      $64ad
6539 220688    ld      ($8806),hl
653c eb        ex      de,hl
653d 220888    ld      ($8808),hl
6540 c35a65    jp      $655a
6543 221288    ld      ($8812),hl
6546 2a1288    ld      hl,($8812)
6549 cd2380    call    $8023
654c 210e88    ld      hl,$880e
654f cd437c    call    $7c43
6552 3d        dec     a
6553 c681      add     a,$81
6555 9f        sbc     a,a
6556 321488    ld      ($8814),a
6559 c9        ret     

655a 2a0688    ld      hl,($8806)
655d cd2380    call    $8023
6560 21a28a    ld      hl,$8aa2
6563 cd437c    call    $7c43
6566 211588    ld      hl,$8815
6569 cd1480    call    $8014
656c 211588    ld      hl,$8815
656f cd4365    call    $6543
6572 321988    ld      ($8819),a
6575 b7        or      a
6576 c28265    jp      nz,$6582
6579 3a0b88    ld      a,($880b)
657c 32928a    ld      ($8a92),a
657f c3b065    jp      $65b0
6582 219e8a    ld      hl,$8a9e
6585 cd2380    call    $8023
6588 2a0688    ld      hl,($8806)
658b cd437c    call    $7c43
658e 211588    ld      hl,$8815
6591 cd1480    call    $8014
6594 211588    ld      hl,$8815
6597 cd4365    call    $6543
659a 321988    ld      ($8819),a
659d b7        or      a
659e c2aa65    jp      nz,$65aa
65a1 3a0d88    ld      a,($880d)
65a4 32928a    ld      ($8a92),a
65a7 c3b065    jp      $65b0
65aa 3a0c88    ld      a,($880c)
65ad 32928a    ld      ($8a92),a
65b0 2a0888    ld      hl,($8808)
65b3 cd2380    call    $8023
65b6 21aa8a    ld      hl,$8aaa
65b9 cd437c    call    $7c43
65bc 211588    ld      hl,$8815
65bf cd1480    call    $8014
65c2 211588    ld      hl,$8815
65c5 cd4365    call    $6543
65c8 321988    ld      ($8819),a
65cb b7        or      a
65cc c2d865    jp      nz,$65d8
65cf 3a0b88    ld      a,($880b)
65d2 32938a    ld      ($8a93),a
65d5 c30666    jp      $6606
65d8 21a68a    ld      hl,$8aa6
65db cd2380    call    $8023
65de 2a0888    ld      hl,($8808)
65e1 cd437c    call    $7c43
65e4 211588    ld      hl,$8815
65e7 cd1480    call    $8014
65ea 211588    ld      hl,$8815
65ed cd4365    call    $6543
65f0 321988    ld      ($8819),a
65f3 b7        or      a
65f4 c20066    jp      nz,$6600
65f7 3a0d88    ld      a,($880d)
65fa 32938a    ld      ($8a93),a
65fd c30666    jp      $6606
6600 3a0c88    ld      a,($880c)
6603 32938a    ld      ($8a93),a
6606 3a938a    ld      a,($8a93)
6609 21928a    ld      hl,$8a92
660c b6        or      (hl)
660d c6ff      add     a,$ff
660f 9f        sbc     a,a
6610 32fe87    ld      ($87fe),a
6613 c9        ret     

6614 216c8b    ld      hl,$8b6c
6617 cd2380    call    $8023
661a 21648b    ld      hl,$8b64
661d cd437c    call    $7c43
6620 211e88    ld      hl,$881e
6623 cd1480    call    $8014
6626 21708b    ld      hl,$8b70
6629 cd2380    call    $8023
662c 21688b    ld      hl,$8b68
662f cd437c    call    $7c43
6632 212288    ld      hl,$8822
6635 cd1480    call    $8014
6638 3a928a    ld      a,($8a92)
663b 211c88    ld      hl,$881c
663e 96        sub     (hl)
663f d601      sub     $01
6641 9f        sbc     a,a
6642 322688    ld      ($8826),a
6645 b7        or      a
6646 c23067    jp      nz,$6730
6649 3a928a    ld      a,($8a92)
664c 211b88    ld      hl,$881b
664f 96        sub     (hl)
6650 c6ff      add     a,$ff
6652 9f        sbc     a,a
6653 322688    ld      ($8826),a
6656 b7        or      a
6657 c26966    jp      nz,$6669
665a 21a28a    ld      hl,$8aa2
665d cd2380    call    $8023
6660 212788    ld      hl,$8827
6663 cd1480    call    $8014
6666 c37566    jp      $6675
6669 219e8a    ld      hl,$8a9e
666c cd2380    call    $8023
666f 212788    ld      hl,$8827
6672 cd1480    call    $8014
6675 212788    ld      hl,$8827
6678 cd2380    call    $8023
667b 21648b    ld      hl,$8b64
667e cd437c    call    $7c43
6681 212288    ld      hl,$8822
6684 cd547d    call    $7d54
6687 211e88    ld      hl,$881e
668a cd567c    call    $7c56
668d 21688b    ld      hl,$8b68
6690 cde17b    call    $7be1
6693 219a8a    ld      hl,$8a9a
6696 cd1480    call    $8014
6699 3a938a    ld      a,($8a93)
669c 211b88    ld      hl,$881b
669f 96        sub     (hl)
66a0 c6ff      add     a,$ff
66a2 9f        sbc     a,a
66a3 322688    ld      ($8826),a
66a6 b7        or      a
66a7 c2b966    jp      nz,$66b9
66aa 21aa8a    ld      hl,$8aaa
66ad cd2380    call    $8023
66b0 212b88    ld      hl,$882b
66b3 cd1480    call    $8014
66b6 c3d666    jp      $66d6
66b9 3a938a    ld      a,($8a93)
66bc 211c88    ld      hl,$881c
66bf 96        sub     (hl)
66c0 d601      sub     $01
66c2 9f        sbc     a,a
66c3 322688    ld      ($8826),a
66c6 b7        or      a
66c7 c22167    jp      nz,$6721
66ca 21a68a    ld      hl,$8aa6
66cd cd2380    call    $8023
66d0 212b88    ld      hl,$882b
66d3 cd1480    call    $8014
66d6 219a8a    ld      hl,$8a9a
66d9 cd2380    call    $8023
66dc 21aa8a    ld      hl,$8aaa
66df cd437c    call    $7c43
66e2 3d        dec     a
66e3 c681      add     a,$81
66e5 9f        sbc     a,a
66e6 322688    ld      ($8826),a
66e9 b7        or      a
66ea c2fc66    jp      nz,$66fc
66ed 21aa8a    ld      hl,$8aaa
66f0 cd2380    call    $8023
66f3 219a8a    ld      hl,$8a9a
66f6 cd1480    call    $8014
66f9 c35c67    jp      $675c
66fc 219a8a    ld      hl,$8a9a
66ff cd2380    call    $8023
6702 21a68a    ld      hl,$8aa6
6705 cd437c    call    $7c43
6708 17        rla     
6709 3f        ccf     
670a 9f        sbc     a,a
670b 322688    ld      ($8826),a
670e b7        or      a
670f c22167    jp      nz,$6721
6712 21a68a    ld      hl,$8aa6
6715 cd2380    call    $8023
6718 219a8a    ld      hl,$8a9a
671b cd1480    call    $8014
671e c35c67    jp      $675c
6721 212788    ld      hl,$8827
6724 cd2380    call    $8023
6727 21968a    ld      hl,$8a96
672a cd1480    call    $8014
672d c38067    jp      $6780
6730 3a938a    ld      a,($8a93)
6733 211b88    ld      hl,$881b
6736 96        sub     (hl)
6737 c6ff      add     a,$ff
6739 9f        sbc     a,a
673a 322688    ld      ($8826),a
673d b7        or      a
673e c25067    jp      nz,$6750
6741 21aa8a    ld      hl,$8aaa
6744 cd2380    call    $8023
6747 219a8a    ld      hl,$8a9a
674a cd1480    call    $8014
674d c35c67    jp      $675c
6750 21a68a    ld      hl,$8aa6
6753 cd2380    call    $8023
6756 219a8a    ld      hl,$8a9a
6759 cd1480    call    $8014
675c 219a8a    ld      hl,$8a9a
675f cd2380    call    $8023
6762 21688b    ld      hl,$8b68
6765 cd437c    call    $7c43
6768 211e88    ld      hl,$881e
676b cd547d    call    $7d54
676e 212288    ld      hl,$8822
6771 cd567c    call    $7c56
6774 21648b    ld      hl,$8b64
6777 cde17b    call    $7be1
677a 21968a    ld      hl,$8a96
677d cd1480    call    $8014
6780 c9        ret     

6781 015d8b    ld      bc,$8b5d
6784 115b8b    ld      de,$8b5b
6787 21598b    ld      hl,$8b59
678a cdf003    call    $03f0
678d 2a598b    ld      hl,($8b59)
6790 cd347e    call    $7e34
6793 21518b    ld      hl,$8b51
6796 cd1480    call    $8014
6799 2a5b8b    ld      hl,($8b5b)
679c cd347e    call    $7e34
679f 21558b    ld      hl,$8b55
67a2 cd1480    call    $8014
67a5 21518b    ld      hl,$8b51
67a8 cd2380    call    $8023
67ab 21298b    ld      hl,$8b29
67ae cd567c    call    $7c56
67b1 21aba2    ld      hl,$a2ab
67b4 cd1480    call    $8014
67b7 21558b    ld      hl,$8b55
67ba cd2380    call    $8023
67bd 21318b    ld      hl,$8b31
67c0 cd567c    call    $7c56
67c3 21afa2    ld      hl,$a2af
67c6 cd1480    call    $8014
67c9 2a5d8b    ld      hl,($8b5d)
67cc cd347e    call    $7e34
67cf 21298b    ld      hl,$8b29
67d2 cd567c    call    $7c56
67d5 21b3a2    ld      hl,$a2b3
67d8 cd1480    call    $8014
67db 21afa2    ld      hl,$a2af
67de cd2380    call    $8023
67e1 21d7a2    ld      hl,$a2d7
67e4 cd567c    call    $7c56
67e7 21b7a2    ld      hl,$a2b7
67ea cd1480    call    $8014
67ed 21aba2    ld      hl,$a2ab
67f0 cd2380    call    $8023
67f3 21b3a2    ld      hl,$a2b3
67f6 cd567c    call    $7c56
67f9 21dba2    ld      hl,$a2db
67fc cd1480    call    $8014
67ff 21d3a2    ld      hl,$a2d3
6802 cd2380    call    $8023
6805 21b3a2    ld      hl,$a2b3
6808 cd547d    call    $7d54
680b 21bba2    ld      hl,$a2bb
680e cd1480    call    $8014
6811 21cfa2    ld      hl,$a2cf
6814 cd2380    call    $8023
6817 21b3a2    ld      hl,$a2b3
681a cd547d    call    $7d54
681d 21bfa2    ld      hl,$a2bf
6820 cd1480    call    $8014
6823 21cfa2    ld      hl,$a2cf
6826 cd2380    call    $8023
6829 21b7a2    ld      hl,$a2b7
682c cd547d    call    $7d54
682f cddc7a    call    $7adc
6832 21c3a2    ld      hl,$a2c3
6835 cd1480    call    $8014
6838 21d3a2    ld      hl,$a2d3
683b cd2380    call    $8023
683e 21b7a2    ld      hl,$a2b7
6841 cd547d    call    $7d54
6844 21c7a2    ld      hl,$a2c7
6847 cd1480    call    $8014
684a c9        ret     

684b 223188    ld      ($8831),hl
684e eb        ex      de,hl
684f 223388    ld      ($8833),hl
6852 3ab78a    ld      a,($8ab7)
6855 3d        dec     a
6856 3d        dec     a
6857 d67f      sub     $7f
6859 9f        sbc     a,a
685a 323d88    ld      ($883d),a
685d 3a608b    ld      a,($8b60)
6860 3d        dec     a
6861 d601      sub     $01
6863 9f        sbc     a,a
6864 213d88    ld      hl,$883d
6867 a6        and     (hl)
6868 323e88    ld      ($883e),a
686b b7        or      a
686c c29568    jp      nz,$6895
686f af        xor     a
6870 32b68a    ld      ($8ab6),a
6873 2a3188    ld      hl,($8831)
6876 cd2380    call    $8023
6879 21648b    ld      hl,$8b64
687c cd1480    call    $8014
687f 2a3388    ld      hl,($8833)
6882 cd2380    call    $8023
6885 21688b    ld      hl,$8b68
6888 cd1480    call    $8014
688b 11688b    ld      de,$8b68
688e 21648b    ld      hl,$8b64
6891 cd576a    call    $6a57
6894 c9        ret     

6895 2a3188    ld      hl,($8831)
6898 cd2380    call    $8023
689b 21648b    ld      hl,$8b64
689e cd437c    call    $7c43
68a1 213f88    ld      hl,$883f
68a4 cd1480    call    $8014
68a7 2a3388    ld      hl,($8833)
68aa cd2380    call    $8023
68ad 21688b    ld      hl,$8b68
68b0 cd437c    call    $7c43
68b3 214388    ld      hl,$8843
68b6 cd1480    call    $8014
68b9 210200    ld      hl,$0002
68bc cd467a    call    $7a46
68bf 214b88    ld      hl,$884b
68c2 cd1480    call    $8014
68c5 213f88    ld      hl,$883f
68c8 cd2380    call    $8023
68cb 210200    ld      hl,$0002
68ce cd467a    call    $7a46
68d1 214b88    ld      hl,$884b
68d4 cde17b    call    $7be1
68d7 214f88    ld      hl,$884f
68da cd1480    call    $8014
68dd 214f88    ld      hl,$884f
68e0 cd8278    call    $7882
68e3 214788    ld      hl,$8847
68e6 cd1480    call    $8014
68e9 213988    ld      hl,$8839
68ec cd437c    call    $7c43
68ef 3d        dec     a
68f0 c681      add     a,$81
68f2 9f        sbc     a,a
68f3 323d88    ld      ($883d),a
68f6 b7        or      a
68f7 cafb68    jp      z,$68fb
68fa c9        ret     

68fb 213f88    ld      hl,$883f
68fe cd2380    call    $8023
6901 214788    ld      hl,$8847
6904 cd567c    call    $7c56
6907 215388    ld      hl,$8853
690a cd1480    call    $8014
690d 214388    ld      hl,$8843
6910 cd2380    call    $8023
6913 214788    ld      hl,$8847
6916 cd567c    call    $7c56
6919 215788    ld      hl,$8857
691c cd1480    call    $8014
691f 3a3688    ld      a,($8836)
6922 32608b    ld      ($8b60),a
6925 3a3588    ld      a,($8835)
6928 21b78a    ld      hl,$8ab7
692b 96        sub     (hl)
692c d601      sub     $01
692e 9f        sbc     a,a
692f 21b68a    ld      hl,$8ab6
6932 a6        and     (hl)
6933 323d88    ld      ($883d),a
6936 b7        or      a
6937 c2b169    jp      nz,$69b1
693a 3ab78a    ld      a,($8ab7)
693d 323588    ld      ($8835),a
6940 af        xor     a
6941 323788    ld      ($8837),a
6944 3a3588    ld      a,($8835)
6947 d602      sub     $02
6949 6f        ld      l,a
694a 17        rla     
694b 9f        sbc     a,a
694c 67        ld      h,a
694d 29        add     hl,hl
694e 29        add     hl,hl
694f 23        inc     hl
6950 eb        ex      de,hl
6951 3a3788    ld      a,($8837)
6954 6f        ld      l,a
6955 17        rla     
6956 9f        sbc     a,a
6957 67        ld      h,a
6958 19        add     hl,de
6959 225b88    ld      ($885b),hl
695c 11bc8a    ld      de,$8abc
695f 19        add     hl,de
6960 7e        ld      a,(hl)
6961 323888    ld      ($8838),a
6964 3a3788    ld      a,($8837)
6967 3c        inc     a
6968 e603      and     $03
696a 323788    ld      ($8837),a
696d 3e01      ld      a,$01
696f 32608b    ld      ($8b60),a
6972 3a3888    ld      a,($8838)
6975 b7        or      a
6976 ca4469    jp      z,$6944
6979 f29569    jp      p,$6995
697c af        xor     a
697d 32608b    ld      ($8b60),a
6980 210000    ld      hl,$0000
6983 eb        ex      de,hl
6984 3a3888    ld      a,($8838)
6987 6f        ld      l,a
6988 17        rla     
6989 9f        sbc     a,a
698a 67        ld      h,a
698b 7b        ld      a,e
698c 95        sub     l
698d 6f        ld      l,a
698e 7a        ld      a,d
698f 9c        sbc     a,h
6990 67        ld      h,a
6991 7d        ld      a,l
6992 323888    ld      ($8838),a
6995 21b98a    ld      hl,$8ab9
6998 cd2380    call    $8023
699b 3a3888    ld      a,($8838)
699e 6f        ld      l,a
699f 17        rla     
69a0 9f        sbc     a,a
69a1 67        ld      h,a
69a2 cd4e7d    call    $7d4e
69a5 215d88    ld      hl,$885d
69a8 cd1480    call    $8014
69ab 216188    ld      hl,$8861
69ae cd1480    call    $8014
69b1 214788    ld      hl,$8847
69b4 cd2380    call    $8023
69b7 216188    ld      hl,$8861
69ba cd437c    call    $7c43
69bd 214788    ld      hl,$8847
69c0 cd1480    call    $8014
69c3 af        xor     a
69c4 32b68a    ld      ($8ab6),a
69c7 214788    ld      hl,$8847
69ca cd2380    call    $8023
69cd 213988    ld      hl,$8839
69d0 cd437c    call    $7c43
69d3 17        rla     
69d4 3f        ccf     
69d5 9f        sbc     a,a
69d6 323d88    ld      ($883d),a
69d9 b7        or      a
69da c2006a    jp      nz,$6a00
69dd 3eff      ld      a,$ff
69df 32b68a    ld      ($8ab6),a
69e2 216188    ld      hl,$8861
69e5 cd2380    call    $8023
69e8 214788    ld      hl,$8847
69eb cde17b    call    $7be1
69ee 216188    ld      hl,$8861
69f1 cd1480    call    $8014
69f4 214788    ld      hl,$8847
69f7 cd307a    call    $7a30
69fa 214788    ld      hl,$8847
69fd cd1480    call    $8014
6a00 216188    ld      hl,$8861
6a03 cd2380    call    $8023
6a06 215388    ld      hl,$8853
6a09 cd547d    call    $7d54
6a0c 21648b    ld      hl,$8b64
6a0f cde17b    call    $7be1
6a12 21648b    ld      hl,$8b64
6a15 cd1480    call    $8014
6a18 216188    ld      hl,$8861
6a1b cd2380    call    $8023
6a1e 215788    ld      hl,$8857
6a21 cd547d    call    $7d54
6a24 21688b    ld      hl,$8b68
6a27 cde17b    call    $7be1
6a2a 21688b    ld      hl,$8b68
6a2d cd1480    call    $8014
6a30 11688b    ld      de,$8b68
6a33 21648b    ld      hl,$8b64
6a36 cd576a    call    $6a57
6a39 3ab68a    ld      a,($8ab6)
6a3c 2f        cpl     
6a3d 323d88    ld      ($883d),a
6a40 b7        or      a
6a41 c24469    jp      nz,$6944
6a44 214788    ld      hl,$8847
6a47 cd2380    call    $8023
6a4a 216188    ld      hl,$8861
6a4d cd1480    call    $8014
6a50 3a608b    ld      a,($8b60)
6a53 323688    ld      ($8836),a
6a56 c9        ret     

6a57 226688    ld      ($8866),hl
6a5a eb        ex      de,hl
6a5b 226888    ld      ($8868),hl
6a5e cdda54    call    $54da
6a61 21298b    ld      hl,$8b29
6a64 cd2380    call    $8023
6a67 2a6688    ld      hl,($8866)
6a6a cd547d    call    $7d54
6a6d 21258b    ld      hl,$8b25
6a70 cde17b    call    $7be1
6a73 cdd678    call    $78d6
6a76 226d88    ld      ($886d),hl
6a79 21318b    ld      hl,$8b31
6a7c cd2380    call    $8023
6a7f 2a6888    ld      hl,($8868)
6a82 cd547d    call    $7d54
6a85 212d8b    ld      hl,$8b2d
6a88 cde17b    call    $7be1
6a8b cdd678    call    $78d6
6a8e 226f88    ld      ($886f),hl
6a91 3a608b    ld      a,($8b60)
6a94 216a88    ld      hl,$886a
6a97 96        sub     (hl)
6a98 c6ff      add     a,$ff
6a9a 9f        sbc     a,a
6a9b 327188    ld      ($8871),a
6a9e b7        or      a
6a9f c2ac6a    jp      nz,$6aac
6aa2 116f88    ld      de,$886f
6aa5 216d88    ld      hl,$886d
6aa8 cdd503    call    $03d5
6aab c9        ret     

6aac 3a608b    ld      a,($8b60)
6aaf 216b88    ld      hl,$886b
6ab2 96        sub     (hl)
6ab3 c6ff      add     a,$ff
6ab5 9f        sbc     a,a
6ab6 327188    ld      ($8871),a
6ab9 b7        or      a
6aba c2c76a    jp      nz,$6ac7
6abd 116f88    ld      de,$886f
6ac0 216d88    ld      hl,$886d
6ac3 cdd803    call    $03d8
6ac6 c9        ret     

6ac7 01618b    ld      bc,$8b61
6aca 116f88    ld      de,$886f
6acd 216d88    ld      hl,$886d
6ad0 cde703    call    $03e7
6ad3 c9        ret     

6ad4 21db6a    ld      hl,$6adb
6ad7 223289    ld      ($8932),hl
6ada c9        ret     

6adb 21e16a    ld      hl,$6ae1
6ade c3cd71    jp      $71cd
6ae1 09        add     hl,bc
6ae2 00        nop     
6ae3 c5        push    bc
6ae4 eb        ex      de,hl
6ae5 4e        ld      c,(hl)
6ae6 23        inc     hl
6ae7 46        ld      b,(hl)
6ae8 eb        ex      de,hl
6ae9 71        ld      (hl),c
6aea 23        inc     hl
6aeb 70        ld      (hl),b
6aec 23        inc     hl
6aed eb        ex      de,hl
6aee 2ada8b    ld      hl,($8bda)
6af1 eb        ex      de,hl
6af2 73        ld      (hl),e
6af3 23        inc     hl
6af4 72        ld      (hl),d
6af5 3adc8b    ld      a,($8bdc)
6af8 23        inc     hl
6af9 77        ld      (hl),a
6afa 23        inc     hl
6afb 3a948b    ld      a,($8b94)
6afe 77        ld      (hl),a
6aff d1        pop     de
6b00 eb        ex      de,hl
6b01 5e        ld      e,(hl)
6b02 23        inc     hl
6b03 56        ld      d,(hl)
6b04 60        ld      h,b
6b05 69        ld      l,c
6b06 cd506c    call    $6c50
6b09 eb        ex      de,hl
6b0a 79        ld      a,c
6b0b 21da8b    ld      hl,$8bda
6b0e 4e        ld      c,(hl)
6b0f 23        inc     hl
6b10 46        ld      b,(hl)
6b11 23        inc     hl
6b12 eb        ex      de,hl
6b13 09        add     hl,bc
6b14 eb        ex      de,hl
6b15 8e        adc     a,(hl)
6b16 eb        ex      de,hl
6b17 32dc8b    ld      ($8bdc),a
6b1a 22da8b    ld      ($8bda),hl
6b1d c9        ret     

6b1e 210000    ld      hl,$0000
6b21 22da8b    ld      ($8bda),hl
6b24 97        sub     a
6b25 32dc8b    ld      ($8bdc),a
6b28 c9        ret     

6b29 46        ld      b,(hl)
6b2a eb        ex      de,hl
6b2b 7e        ld      a,(hl)
6b2c 23        inc     hl
6b2d 66        ld      h,(hl)
6b2e 6f        ld      l,a
6b2f 97        sub     a
6b30 78        ld      a,b
6b31 1f        rra     
6b32 47        ld      b,a
6b33 d23a6b    jp      nc,$6b3a
6b36 7c        ld      a,h
6b37 f680      or      $80
6b39 67        ld      h,a
6b3a 110100    ld      de,$0001
6b3d cd786c    call    $6c78
6b40 22d78b    ld      ($8bd7),hl
6b43 78        ld      a,b
6b44 de00      sbc     a,$00
6b46 32d98b    ld      ($8bd9),a
6b49 c9        ret     

6b4a e5        push    hl
6b4b eb        ex      de,hl
6b4c 5e        ld      e,(hl)
6b4d 23        inc     hl
6b4e 56        ld      d,(hl)
6b4f eb        ex      de,hl
6b50 22916c    ld      ($6c91),hl
6b53 c35d6b    jp      $6b5d
6b56 e5        push    hl
6b57 cdab6b    call    $6bab
6b5a cdc26b    call    $6bc2
6b5d 97        sub     a
6b5e cde86b    call    $6be8
6b61 cd406c    call    $6c40
6b64 2a936c    ld      hl,($6c93)
6b67 d1        pop     de
6b68 cd816c    call    $6c81
6b6b d5        push    de
6b6c b7        or      a
6b6d c25e6b    jp      nz,$6b5e
6b70 d1        pop     de
6b71 3a718f    ld      a,($8f71)
6b74 c9        ret     

6b75 e5        push    hl
6b76 eb        ex      de,hl
6b77 5e        ld      e,(hl)
6b78 23        inc     hl
6b79 56        ld      d,(hl)
6b7a eb        ex      de,hl
6b7b 22916c    ld      ($6c91),hl
6b7e c3886b    jp      $6b88
6b81 e5        push    hl
6b82 cdab6b    call    $6bab
6b85 cdc26b    call    $6bc2
6b88 97        sub     a
6b89 cde86b    call    $6be8
6b8c cd406c    call    $6c40
6b8f 2a936c    ld      hl,($6c93)
6b92 d1        pop     de
6b93 f5        push    af
6b94 eb        ex      de,hl
6b95 cd816c    call    $6c81
6b98 3aea8b    ld      a,($8bea)
6b9b f608      or      $08
6b9d 32ea8b    ld      ($8bea),a
6ba0 f1        pop     af
6ba1 e5        push    hl
6ba2 b7        or      a
6ba3 c2896b    jp      nz,$6b89
6ba6 e1        pop     hl
6ba7 3a718f    ld      a,($8f71)
6baa c9        ret     

6bab 210500    ld      hl,$0005
6bae 19        add     hl,de
6baf 3a948b    ld      a,($8b94)
6bb2 be        cp      (hl)
6bb3 c8        ret     z

6bb4 d5        push    de
6bb5 c5        push    bc
6bb6 7e        ld      a,(hl)
6bb7 21c16b    ld      hl,$6bc1
6bba 77        ld      (hl),a
6bbb cd956c    call    $6c95
6bbe c1        pop     bc
6bbf d1        pop     de
6bc0 c9        ret     

6bc1 00        nop     
6bc2 eb        ex      de,hl
6bc3 5e        ld      e,(hl)
6bc4 23        inc     hl
6bc5 56        ld      d,(hl)
6bc6 23        inc     hl
6bc7 e5        push    hl
6bc8 eb        ex      de,hl
6bc9 22916c    ld      ($6c91),hl
6bcc 0a        ld      a,(bc)
6bcd 5f        ld      e,a
6bce 03        inc     bc
6bcf 0a        ld      a,(bc)
6bd0 57        ld      d,a
6bd1 1b        dec     de
6bd2 cd506c    call    $6c50
6bd5 eb        ex      de,hl
6bd6 79        ld      a,c
6bd7 e1        pop     hl
6bd8 4e        ld      c,(hl)
6bd9 23        inc     hl
6bda 46        ld      b,(hl)
6bdb 23        inc     hl
6bdc eb        ex      de,hl
6bdd 09        add     hl,bc
6bde eb        ex      de,hl
6bdf 8e        adc     a,(hl)
6be0 eb        ex      de,hl
6be1 32d98b    ld      ($8bd9),a
6be4 22d78b    ld      ($8bd7),hl
6be7 c9        ret     

6be8 b7        or      a
6be9 caf46b    jp      z,$6bf4
6bec 2a3e6c    ld      hl,($6c3e)
6bef 44        ld      b,h
6bf0 4d        ld      c,l
6bf1 c3f96b    jp      $6bf9
6bf4 2a916c    ld      hl,($6c91)
6bf7 44        ld      b,h
6bf8 4d        ld      c,l
6bf9 2add8b    ld      hl,($8bdd)
6bfc eb        ex      de,hl
6bfd 2ad78b    ld      hl,($8bd7)
6c00 cd786c    call    $6c78
6c03 22e08b    ld      ($8be0),hl
6c06 eb        ex      de,hl
6c07 3ad98b    ld      a,($8bd9)
6c0a 21df8b    ld      hl,$8bdf
6c0d 9e        sbc     a,(hl)
6c0e c2366c    jp      nz,$6c36
6c11 2ae48b    ld      hl,($8be4)
6c14 2b        dec     hl
6c15 cd786c    call    $6c78
6c18 da366c    jp      c,$6c36
6c1b e5        push    hl
6c1c 2ae88b    ld      hl,($8be8)
6c1f 19        add     hl,de
6c20 22936c    ld      ($6c93),hl
6c23 d1        pop     de
6c24 60        ld      h,b
6c25 69        ld      l,c
6c26 13        inc     de
6c27 13        inc     de
6c28 cd786c    call    $6c78
6c2b d8        ret     c

6c2c 23        inc     hl
6c2d 223e6c    ld      ($6c3e),hl
6c30 1b        dec     de
6c31 42        ld      b,d
6c32 4b        ld      c,e
6c33 3eff      ld      a,$ff
6c35 c9        ret     

6c36 c5        push    bc
6c37 cd6f6d    call    $6d6f
6c3a c1        pop     bc
6c3b c3f96b    jp      $6bf9
6c3e 00        nop     
6c3f 00        nop     
6c40 57        ld      d,a
6c41 97        sub     a
6c42 2ad78b    ld      hl,($8bd7)
6c45 09        add     hl,bc
6c46 22d78b    ld      ($8bd7),hl
6c49 21d98b    ld      hl,$8bd9
6c4c 8e        adc     a,(hl)
6c4d 77        ld      (hl),a
6c4e 7a        ld      a,d
6c4f c9        ret     

6c50 e5        push    hl
6c51 210000    ld      hl,$0000
6c54 010000    ld      bc,$0000
6c57 e3        ex      (sp),hl
6c58 7c        ld      a,h
6c59 b5        or      l
6c5a ca756c    jp      z,$6c75
6c5d 97        sub     a
6c5e 7c        ld      a,h
6c5f 1f        rra     
6c60 67        ld      h,a
6c61 7d        ld      a,l
6c62 1f        rra     
6c63 6f        ld      l,a
6c64 e3        ex      (sp),hl
6c65 d26c6c    jp      nc,$6c6c
6c68 19        add     hl,de
6c69 78        ld      a,b
6c6a 89        adc     a,c
6c6b 4f        ld      c,a
6c6c eb        ex      de,hl
6c6d 29        add     hl,hl
6c6e eb        ex      de,hl
6c6f 78        ld      a,b
6c70 8f        adc     a,a
6c71 47        ld      b,a
6c72 c3576c    jp      $6c57
6c75 e3        ex      (sp),hl
6c76 d1        pop     de
6c77 c9        ret     

6c78 7d        ld      a,l
6c79 93        sub     e
6c7a 6f        ld      l,a
6c7b 7c        ld      a,h
6c7c 9a        sbc     a,d
6c7d 67        ld      h,a
6c7e 3e00      ld      a,$00
6c80 c9        ret     

6c81 f5        push    af
6c82 c38a6c    jp      $6c8a
6c85 7e        ld      a,(hl)
6c86 12        ld      (de),a
6c87 23        inc     hl
6c88 13        inc     de
6c89 0b        dec     bc
6c8a 78        ld      a,b
6c8b b1        or      c
6c8c c2856c    jp      nz,$6c85
6c8f f1        pop     af
6c90 c9        ret     

6c91 0100b3    ld      bc,$b300
6c94 b9        cp      c
6c95 227388    ld      ($8873),hl
6c98 2a7388    ld      hl,($8873)
6c9b 7e        ld      a,(hl)
6c9c 21948b    ld      hl,$8b94
6c9f 96        sub     (hl)
6ca0 d601      sub     $01
6ca2 9f        sbc     a,a
6ca3 327888    ld      ($8878),a
6ca6 b7        or      a
6ca7 caab6c    jp      z,$6cab
6caa c9        ret     

6cab af        xor     a
6cac 32718f    ld      ($8f71),a
6caf 2a7388    ld      hl,($8873)
6cb2 7e        ld      a,(hl)
6cb3 3d        dec     a
6cb4 e6f8      and     $f8
6cb6 c6ff      add     a,$ff
6cb8 9f        sbc     a,a
6cb9 327888    ld      ($8878),a
6cbc b7        or      a
6cbd cac96c    jp      z,$6cc9
6cc0 cd2e7d    call    $7d2e
6cc3 53        ld      d,e
6cc4 45        ld      b,l
6cc5 4c        ld      c,h
6cc6 46        ld      b,(hl)
6cc7 49        ld      c,c
6cc8 4c        ld      c,h
6cc9 3a948b    ld      a,($8b94)
6ccc c6ff      add     a,$ff
6cce 9f        sbc     a,a
6ccf 327888    ld      ($8878),a
6cd2 b7        or      a
6cd3 caeb6c    jp      z,$6ceb
6cd6 3a948b    ld      a,($8b94)
6cd9 6f        ld      l,a
6cda 17        rla     
6cdb 9f        sbc     a,a
6cdc 67        ld      h,a
6cdd 29        add     hl,hl
6cde 119f8b    ld      de,$8b9f
6ce1 19        add     hl,de
6ce2 227988    ld      ($8879),hl
6ce5 2a7988    ld      hl,($8879)
6ce8 cd5f71    call    $715f
6ceb 2a7388    ld      hl,($8873)
6cee 7e        ld      a,(hl)
6cef 32948b    ld      ($8b94),a
6cf2 11988b    ld      de,$8b98
6cf5 6f        ld      l,a
6cf6 17        rla     
6cf7 9f        sbc     a,a
6cf8 67        ld      h,a
6cf9 19        add     hl,de
6cfa 227988    ld      ($8879),hl
6cfd 2a7988    ld      hl,($8879)
6d00 7e        ld      a,(hl)
6d01 b7        or      a
6d02 c2516d    jp      nz,$6d51
6d05 3a948b    ld      a,($8b94)
6d08 11988b    ld      de,$8b98
6d0b 6f        ld      l,a
6d0c 17        rla     
6d0d 9f        sbc     a,a
6d0e 67        ld      h,a
6d0f 19        add     hl,de
6d10 227988    ld      ($8879),hl
6d13 3eff      ld      a,$ff
6d15 2a7988    ld      hl,($8879)
6d18 77        ld      (hl),a
6d19 117b88    ld      de,$887b
6d1c 217688    ld      hl,$8876
6d1f cd3c73    call    $733c
6d22 327888    ld      ($8878),a
6d25 b7        or      a
6d26 ca326d    jp      z,$6d32
6d29 cd2e7d    call    $7d2e
6d2c 45        ld      b,l
6d2d 4d        ld      c,l
6d2e 2d        dec     l
6d2f 4d        ld      c,l
6d30 45        ld      b,l
6d31 4d        ld      c,l
6d32 3a948b    ld      a,($8b94)
6d35 6f        ld      l,a
6d36 17        rla     
6d37 9f        sbc     a,a
6d38 67        ld      h,a
6d39 29        add     hl,hl
6d3a 119f8b    ld      de,$8b9f
6d3d 19        add     hl,de
6d3e 227988    ld      ($8879),hl
6d41 2a7b88    ld      hl,($887b)
6d44 eb        ex      de,hl
6d45 2a7988    ld      hl,($8879)
6d48 73        ld      (hl),e
6d49 23        inc     hl
6d4a 72        ld      (hl),d
6d4b 217b88    ld      hl,$887b
6d4e cd6c71    call    $716c
6d51 3a948b    ld      a,($8b94)
6d54 6f        ld      l,a
6d55 17        rla     
6d56 9f        sbc     a,a
6d57 67        ld      h,a
6d58 29        add     hl,hl
6d59 119f8b    ld      de,$8b9f
6d5c 19        add     hl,de
6d5d 227988    ld      ($8879),hl
6d60 2a7988    ld      hl,($8879)
6d63 cd5171    call    $7151
6d66 216d6d    ld      hl,$6d6d
6d69 cd9171    call    $7191
6d6c c9        ret     

6d6d 00        nop     
6d6e 00        nop     
6d6f af        xor     a
6d70 32718f    ld      ($8f71),a
6d73 cdd26d    call    $6dd2
6d76 3a718f    ld      a,($8f71)
6d79 b7        or      a
6d7a ca7e6d    jp      z,$6d7e
6d7d c9        ret     

6d7e cd946f    call    $6f94
6d81 3a718f    ld      a,($8f71)
6d84 b7        or      a
6d85 ca896d    jp      z,$6d89
6d88 c9        ret     

6d89 118088    ld      de,$8880
6d8c 21d78b    ld      hl,$8bd7
6d8f cd4271    call    $7142
6d92 2a8088    ld      hl,($8880)
6d95 eb        ex      de,hl
6d96 2ae28b    ld      hl,($8be2)
6d99 7b        ld      a,e
6d9a 95        sub     l
6d9b 6f        ld      l,a
6d9c 7a        ld      a,d
6d9d 9c        sbc     a,h
6d9e 67        ld      h,a
6d9f 228288    ld      ($8882),hl
6da2 11d06d    ld      de,$6dd0
6da5 218288    ld      hl,$8882
6da8 3e02      ld      a,$02
6daa cdbf78    call    $78bf
6dad 22d58b    ld      ($8bd5),hl
6db0 11dd8b    ld      de,$8bdd
6db3 21d58b    ld      hl,$8bd5
6db6 cd2d71    call    $712d
6db9 2ae68b    ld      hl,($8be6)
6dbc 22958b    ld      ($8b95),hl
6dbf 2ae88b    ld      hl,($8be8)
6dc2 22978b    ld      ($8b97),hl
6dc5 cdc46f    call    $6fc4
6dc8 3a728f    ld      a,($8f72)
6dcb b7        or      a
6dcc c2c56d    jp      nz,$6dc5
6dcf c9        ret     

6dd0 00        nop     
6dd1 00        nop     
6dd2 3aea8b    ld      a,($8bea)
6dd5 e607      and     $07
6dd7 d607      sub     $07
6dd9 d601      sub     $01
6ddb 9f        sbc     a,a
6ddc 329688    ld      ($8896),a
6ddf b7        or      a
6de0 cae46d    jp      z,$6de4
6de3 c9        ret     

6de4 21586e    ld      hl,$6e58
6de7 cd8571    call    $7185
6dea 2f        cpl     
6deb 329688    ld      ($8896),a
6dee b7        or      a
6def cafb6d    jp      z,$6dfb
6df2 cd2e7d    call    $7d2e
6df5 53        ld      d,e
6df6 45        ld      b,l
6df7 4c        ld      c,h
6df8 46        ld      b,(hl)
6df9 49        ld      c,c
6dfa 4c        ld      c,h
6dfb 21566e    ld      hl,$6e56
6dfe cd8571    call    $7185
6e01 329688    ld      ($8896),a
6e04 b7        or      a
6e05 c23c6e    jp      nz,$6e3c
6e08 015c6e    ld      bc,$6e5c
6e0b 11d78b    ld      de,$8bd7
6e0e 219388    ld      hl,$8893
6e11 cd0672    call    $7206
6e14 3a948b    ld      a,($8b94)
6e17 c630      add     a,$30
6e19 328d88    ld      ($888d),a
6e1c 01566e    ld      bc,$6e56
6e1f 119288    ld      de,$8892
6e22 218788    ld      hl,$8887
6e25 cd5e6e    call    $6e5e
6e28 329688    ld      ($8896),a
6e2b b7        or      a
6e2c ca306e    jp      z,$6e30
6e2f c9        ret     

6e30 015c6e    ld      bc,$6e5c
6e33 119388    ld      de,$8893
6e36 21d78b    ld      hl,$8bd7
6e39 cd0672    call    $7206
6e3c 21546e    ld      hl,$6e54
6e3f cd8571    call    $7185
6e42 329688    ld      ($8896),a
6e45 b7        or      a
6e46 ca4a6e    jp      z,$6e4a
6e49 c9        ret     

6e4a 115a6e    ld      de,$6e5a
6e4d 21566e    ld      hl,$6e56
6e50 cdd26e    call    $6ed2
6e53 c9        ret     

6e54 02        ld      (bc),a
6e55 00        nop     
6e56 010000    ld      bc,$0000
6e59 00        nop     
6e5a 00        nop     
6e5b 00        nop     
6e5c 03        inc     bc
6e5d 00        nop     
6e5e 22a088    ld      ($88a0),hl
6e61 eb        ex      de,hl
6e62 22a288    ld      ($88a2),hl
6e65 60        ld      h,b
6e66 69        ld      l,c
6e67 22a488    ld      ($88a4),hl
6e6a 21ce6e    ld      hl,$6ece
6e6d cd8571    call    $7185
6e70 2f        cpl     
6e71 32a988    ld      ($88a9),a
6e74 b7        or      a
6e75 ca816e    jp      z,$6e81
6e78 cd2e7d    call    $7d2e
6e7b 53        ld      d,e
6e7c 45        ld      b,l
6e7d 4c        ld      c,h
6e7e 46        ld      b,(hl)
6e7f 49        ld      c,c
6e80 4c        ld      c,h
6e81 11a788    ld      de,$88a7
6e84 21b18b    ld      hl,$8bb1
6e87 cd6372    call    $7263
6e8a 01d06e    ld      bc,$6ed0
6e8d 2aa088    ld      hl,($88a0)
6e90 eb        ex      de,hl
6e91 21b28b    ld      hl,$8bb2
6e94 cd0672    call    $7206
6e97 2aa488    ld      hl,($88a4)
6e9a 44        ld      b,h
6e9b 4d        ld      c,l
6e9c 2aa288    ld      hl,($88a2)
6e9f eb        ex      de,hl
6ea0 21b18b    ld      hl,$8bb1
6ea3 cd9570    call    $7095
6ea6 3a718f    ld      a,($8f71)
6ea9 329888    ld      ($8898),a
6eac 3a718f    ld      a,($8f71)
6eaf b7        or      a
6eb0 c2c26e    jp      nz,$6ec2
6eb3 21cc6e    ld      hl,$6ecc
6eb6 cd9171    call    $7191
6eb9 3eff      ld      a,$ff
6ebb 32df8b    ld      ($8bdf),a
6ebe 3a9888    ld      a,($8898)
6ec1 c9        ret     

6ec2 21cc6e    ld      hl,$6ecc
6ec5 cdcd71    call    $71cd
6ec8 3a9888    ld      a,($8898)
6ecb c9        ret     

6ecc 010000    ld      bc,$0000
6ecf 00        nop     
6ed0 0b        dec     bc
6ed1 00        nop     
6ed2 22b388    ld      ($88b3),hl
6ed5 eb        ex      de,hl
6ed6 22b588    ld      ($88b5),hl
6ed9 21426f    ld      hl,$6f42
6edc cd8571    call    $7185
6edf 32b988    ld      ($88b9),a
6ee2 b7        or      a
6ee3 caea6e    jp      z,$6eea
6ee6 3aab88    ld      a,($88ab)
6ee9 c9        ret     

6eea 2ab388    ld      hl,($88b3)
6eed 7e        ld      a,(hl)
6eee 23        inc     hl
6eef 66        ld      h,(hl)
6ef0 6f        ld      l,a
6ef1 22e68b    ld      ($8be6),hl
6ef4 29        add     hl,hl
6ef5 29        add     hl,hl
6ef6 29        add     hl,hl
6ef7 29        add     hl,hl
6ef8 29        add     hl,hl
6ef9 29        add     hl,hl
6efa 29        add     hl,hl
6efb 22e48b    ld      ($8be4),hl
6efe 11e88b    ld      de,$8be8
6f01 21e48b    ld      hl,$8be4
6f04 cd3c73    call    $733c
6f07 32b988    ld      ($88b9),a
6f0a b7        or      a
6f0b ca176f    jp      z,$6f17
6f0e cd2e7d    call    $7d2e
6f11 45        ld      b,l
6f12 4d        ld      c,l
6f13 2d        dec     l
6f14 4d        ld      c,l
6f15 45        ld      b,l
6f16 4d        ld      c,l
6f17 210000    ld      hl,$0000
6f1a 22e28b    ld      ($8be2),hl
6f1d 2ab588    ld      hl,($88b5)
6f20 7e        ld      a,(hl)
6f21 b7        or      a
6f22 ca346f    jp      z,$6f34
6f25 2ae68b    ld      hl,($8be6)
6f28 23        inc     hl
6f29 eb        ex      de,hl
6f2a 210200    ld      hl,$0002
6f2d cd777e    call    $7e77
6f30 2b        dec     hl
6f31 22e28b    ld      ($8be2),hl
6f34 af        xor     a
6f35 32ab88    ld      ($88ab),a
6f38 21426f    ld      hl,$6f42
6f3b cd9171    call    $7191
6f3e 3aab88    ld      a,($88ab)
6f41 c9        ret     

6f42 02        ld      (bc),a
6f43 00        nop     
6f44 21676f    ld      hl,$6f67
6f47 cd6b6f    call    $6f6b
6f4a 32c588    ld      ($88c5),a
6f4d b7        or      a
6f4e c2606f    jp      nz,$6f60
6f51 11696f    ld      de,$6f69
6f54 21be8b    ld      hl,$8bbe
6f57 cd6372    call    $7263
6f5a 21b18b    ld      hl,$8bb1
6f5d cd1975    call    $7519
6f60 3a718f    ld      a,($8f71)
6f63 32bb88    ld      ($88bb),a
6f66 c9        ret     

6f67 00        nop     
6f68 00        nop     
6f69 1c        inc     e
6f6a 00        nop     
6f6b cd946f    call    $6f94
6f6e 21b18b    ld      hl,$8bb1
6f71 cd1f75    call    $751f
6f74 d6ff      sub     $ff
6f76 c6ff      add     a,$ff
6f78 9f        sbc     a,a
6f79 32d088    ld      ($88d0),a
6f7c b7        or      a
6f7d c28b6f    jp      nz,$6f8b
6f80 3eff      ld      a,$ff
6f82 32718f    ld      ($8f71),a
6f85 21926f    ld      hl,$6f92
6f88 cdcd71    call    $71cd
6f8b 3a718f    ld      a,($8f71)
6f8e 32c788    ld      ($88c7),a
6f91 c9        ret     

6f92 02        ld      (bc),a
6f93 00        nop     
6f94 21c26f    ld      hl,$6fc2
6f97 cd8571    call    $7185
6f9a 2f        cpl     
6f9b 32d388    ld      ($88d3),a
6f9e b7        or      a
6f9f caa36f    jp      z,$6fa3
6fa2 c9        ret     

6fa3 21c26f    ld      hl,$6fc2
6fa6 cd9b71    call    $719b
6fa9 11d58b    ld      de,$8bd5
6fac 21dd8b    ld      hl,$8bdd
6faf cd4271    call    $7142
6fb2 2ae68b    ld      hl,($8be6)
6fb5 22958b    ld      ($8b95),hl
6fb8 2ae88b    ld      hl,($8be8)
6fbb 22978b    ld      ($8b97),hl
6fbe cd3770    call    $7037
6fc1 c9        ret     

6fc2 03        inc     bc
6fc3 00        nop     
6fc4 af        xor     a
6fc5 32718f    ld      ($8f71),a
6fc8 af        xor     a
6fc9 32728f    ld      ($8f72),a
6fcc 21958b    ld      hl,$8b95
6fcf cd1072    call    $7210
6fd2 32d888    ld      ($88d8),a
6fd5 b7        or      a
6fd6 cada6f    jp      z,$6fda
6fd9 c9        ret     

6fda 21978b    ld      hl,$8b97
6fdd cd7575    call    $7575
6fe0 2a978b    ld      hl,($8b97)
6fe3 118000    ld      de,$0080
6fe6 19        add     hl,de
6fe7 22978b    ld      ($8b97),hl
6fea 2ad58b    ld      hl,($8bd5)
6fed 22d28b    ld      ($8bd2),hl
6ff0 21b18b    ld      hl,$8bb1
6ff3 cd6375    call    $7563
6ff6 32d588    ld      ($88d5),a
6ff9 2ad58b    ld      hl,($8bd5)
6ffc 23        inc     hl
6ffd 22d58b    ld      ($8bd5),hl
7000 2a958b    ld      hl,($8b95)
7003 2b        dec     hl
7004 22958b    ld      ($8b95),hl
7007 3ad588    ld      a,($88d5)
700a d601      sub     $01
700c 9f        sbc     a,a
700d 32d888    ld      ($88d8),a
7010 b7        or      a
7011 c2cc6f    jp      nz,$6fcc
7014 3eff      ld      a,$ff
7016 32718f    ld      ($8f71),a
7019 3ad588    ld      a,($88d5)
701c e602      and     $02
701e d601      sub     $01
7020 9f        sbc     a,a
7021 32d888    ld      ($88d8),a
7024 b7        or      a
7025 c22f70    jp      nz,$702f
7028 213570    ld      hl,$7035
702b cdcd71    call    $71cd
702e c9        ret     

702f 3eff      ld      a,$ff
7031 32728f    ld      ($8f72),a
7034 c9        ret     

7035 03        inc     bc
7036 00        nop     
7037 af        xor     a
7038 32718f    ld      ($8f71),a
703b af        xor     a
703c 32728f    ld      ($8f72),a
703f 21958b    ld      hl,$8b95
7042 cd1072    call    $7210
7045 32dd88    ld      ($88dd),a
7048 b7        or      a
7049 ca4d70    jp      z,$704d
704c c9        ret     

704d 21978b    ld      hl,$8b97
7050 cd7575    call    $7575
7053 2a978b    ld      hl,($8b97)
7056 118000    ld      de,$0080
7059 19        add     hl,de
705a 22978b    ld      ($8b97),hl
705d 2ad58b    ld      hl,($8bd5)
7060 22d28b    ld      ($8bd2),hl
7063 21b18b    ld      hl,$8bb1
7066 cd6975    call    $7569
7069 32da88    ld      ($88da),a
706c 2ad58b    ld      hl,($8bd5)
706f 23        inc     hl
7070 22d58b    ld      ($8bd5),hl
7073 2a958b    ld      hl,($8b95)
7076 2b        dec     hl
7077 22958b    ld      ($8b95),hl
707a 3ada88    ld      a,($88da)
707d d601      sub     $01
707f 9f        sbc     a,a
7080 32dd88    ld      ($88dd),a
7083 b7        or      a
7084 c23f70    jp      nz,$703f
7087 3eff      ld      a,$ff
7089 32718f    ld      ($8f71),a
708c 219370    ld      hl,$7093
708f cdcd71    call    $71cd
7092 c9        ret     

7093 04        inc     b
7094 00        nop     
7095 22df88    ld      ($88df),hl
7098 eb        ex      de,hl
7099 22e188    ld      ($88e1),hl
709c 60        ld      h,b
709d 69        ld      l,c
709e 22e388    ld      ($88e3),hl
70a1 2ae188    ld      hl,($88e1)
70a4 7e        ld      a,(hl)
70a5 2adf88    ld      hl,($88df)
70a8 77        ld      (hl),a
70a9 2adf88    ld      hl,($88df)
70ac cd1975    call    $7519
70af 32e588    ld      ($88e5),a
70b2 af        xor     a
70b3 32718f    ld      ($8f71),a
70b6 2ae388    ld      hl,($88e3)
70b9 7e        ld      a,(hl)
70ba b7        or      a
70bb c2da70    jp      nz,$70da
70be 3ae588    ld      a,($88e5)
70c1 d6ff      sub     $ff
70c3 c6ff      add     a,$ff
70c5 9f        sbc     a,a
70c6 32e888    ld      ($88e8),a
70c9 b7        or      a
70ca cace70    jp      z,$70ce
70cd c9        ret     

70ce 3eff      ld      a,$ff
70d0 32718f    ld      ($8f71),a
70d3 212771    ld      hl,$7127
70d6 cdcd71    call    $71cd
70d9 c9        ret     

70da 3ae588    ld      a,($88e5)
70dd d6ff      sub     $ff
70df c6ff      add     a,$ff
70e1 9f        sbc     a,a
70e2 32e888    ld      ($88e8),a
70e5 b7        or      a
70e6 c20b71    jp      nz,$710b
70e9 2adf88    ld      hl,($88df)
70ec cd4375    call    $7543
70ef 32e588    ld      ($88e5),a
70f2 d6ff      sub     $ff
70f4 c6ff      add     a,$ff
70f6 9f        sbc     a,a
70f7 32e888    ld      ($88e8),a
70fa b7        or      a
70fb caff70    jp      z,$70ff
70fe c9        ret     

70ff 3eff      ld      a,$ff
7101 32718f    ld      ($8f71),a
7104 212971    ld      hl,$7129
7107 cdcd71    call    $71cd
710a c9        ret     

710b 2ae388    ld      hl,($88e3)
710e 7e        ld      a,(hl)
710f 3d        dec     a
7110 d601      sub     $01
7112 9f        sbc     a,a
7113 32e888    ld      ($88e8),a
7116 b7        or      a
7117 ca1b71    jp      z,$711b
711a c9        ret     

711b 3eff      ld      a,$ff
711d 32718f    ld      ($8f71),a
7120 212b71    ld      hl,$712b
7123 cdcd71    call    $71cd
7126 c9        ret     

7127 05        dec     b
7128 00        nop     
7129 0600      ld      b,$00
712b 07        rlca    
712c 00        nop     
712d 7e        ld      a,(hl)
712e 23        inc     hl
712f 66        ld      h,(hl)
7130 6f        ld      l,a
7131 13        inc     de
7132 13        inc     de
7133 eb        ex      de,hl
7134 af        xor     a
7135 7a        ld      a,d
7136 1f        rra     
7137 77        ld      (hl),a
7138 2b        dec     hl
7139 7b        ld      a,e
713a 1f        rra     
713b 77        ld      (hl),a
713c 2b        dec     hl
713d 3e00      ld      a,$00
713f 1f        rra     
7140 77        ld      (hl),a
7141 c9        ret     

7142 7e        ld      a,(hl)
7143 17        rla     
7144 23        inc     hl
7145 7e        ld      a,(hl)
7146 17        rla     
7147 4f        ld      c,a
7148 23        inc     hl
7149 7e        ld      a,(hl)
714a 17        rla     
714b 47        ld      b,a
714c eb        ex      de,hl
714d 71        ld      (hl),c
714e 23        inc     hl
714f 70        ld      (hl),b
7150 c9        ret     

7151 5e        ld      e,(hl)
7152 23        inc     hl
7153 56        ld      d,(hl)
7154 013a00    ld      bc,$003a
7157 21b18b    ld      hl,$8bb1
715a eb        ex      de,hl
715b cddd71    call    $71dd
715e c9        ret     

715f 5e        ld      e,(hl)
7160 23        inc     hl
7161 56        ld      d,(hl)
7162 013a00    ld      bc,$003a
7165 21b18b    ld      hl,$8bb1
7168 cddd71    call    $71dd
716b c9        ret     

716c 5e        ld      e,(hl)
716d 23        inc     hl
716e 56        ld      d,(hl)
716f 013a00    ld      bc,$003a
7172 eb        ex      de,hl
7173 e5        push    hl
7174 af        xor     a
7175 77        ld      (hl),a
7176 23        inc     hl
7177 0b        dec     bc
7178 78        ld      a,b
7179 b1        or      c
717a c27471    jp      nz,$7174
717d e1        pop     hl
717e 112e00    ld      de,$002e
7181 19        add     hl,de
7182 36ff      ld      (hl),$ff
7184 c9        ret     

7185 46        ld      b,(hl)
7186 cda671    call    $71a6
7189 21ea8b    ld      hl,$8bea
718c a6        and     (hl)
718d c8        ret     z

718e 3eff      ld      a,$ff
7190 c9        ret     

7191 46        ld      b,(hl)
7192 cda671    call    $71a6
7195 21ea8b    ld      hl,$8bea
7198 b6        or      (hl)
7199 77        ld      (hl),a
719a c9        ret     

719b 46        ld      b,(hl)
719c cda671    call    $71a6
719f 21ea8b    ld      hl,$8bea
71a2 2f        cpl     
71a3 a6        and     (hl)
71a4 77        ld      (hl),a
71a5 c9        ret     

71a6 3e01      ld      a,$01
71a8 04        inc     b
71a9 05        dec     b
71aa c8        ret     z

71ab 07        rlca    
71ac c3a971    jp      $71a9
71af 7e        ld      a,(hl)
71b0 b7        or      a
71b1 cac571    jp      z,$71c5
71b4 e1        pop     hl
71b5 22ea71    ld      ($71ea),hl
71b8 210000    ld      hl,$0000
71bb 39        add     hl,sp
71bc 22e871    ld      ($71e8),hl
71bf 2aea71    ld      hl,($71ea)
71c2 e5        push    hl
71c3 97        sub     a
71c4 c9        ret     

71c5 210000    ld      hl,$0000
71c8 22e871    ld      ($71e8),hl
71cb 97        sub     a
71cc c9        ret     

71cd cd1942    call    $4219
71d0 2ae871    ld      hl,($71e8)
71d3 7c        ld      a,h
71d4 b5        or      l
71d5 c8        ret     z

71d6 f9        ld      sp,hl
71d7 2aea71    ld      hl,($71ea)
71da 97        sub     a
71db 3d        dec     a
71dc e9        jp      (hl)
71dd 78        ld      a,b
71de b1        or      c
71df c8        ret     z

71e0 7e        ld      a,(hl)
71e1 12        ld      (de),a
71e2 23        inc     hl
71e3 13        inc     de
71e4 0b        dec     bc
71e5 c3dd71    jp      $71dd
71e8 03        inc     bc
71e9 feeb      cp      $eb
71eb 3a0102    ld      a,($0201)
71ee 00        nop     
71ef 78        ld      a,b
71f0 b1        or      c
71f1 c8        ret     z

71f2 1a        ld      a,(de)
71f3 77        ld      (hl),a
71f4 23        inc     hl
71f5 13        inc     de
71f6 0b        dec     bc
71f7 c3ef71    jp      $71ef
71fa 010400    ld      bc,$0004
71fd c3ef71    jp      $71ef
7200 010800    ld      bc,$0008
7203 c3ef71    jp      $71ef
7206 e5        push    hl
7207 60        ld      h,b
7208 69        ld      l,c
7209 4e        ld      c,(hl)
720a 23        inc     hl
720b 46        ld      b,(hl)
720c e1        pop     hl
720d c3ef71    jp      $71ef
7210 010200    ld      bc,$0002
7213 7e        ld      a,(hl)
7214 b7        or      a
7215 c22272    jp      nz,$7222
7218 23        inc     hl
7219 0b        dec     bc
721a 78        ld      a,b
721b b1        or      c
721c c21372    jp      nz,$7213
721f 3eff      ld      a,$ff
7221 c9        ret     

7222 af        xor     a
7223 c9        ret     

7224 010400    ld      bc,$0004
7227 c31372    jp      $7213
722a 010800    ld      bc,$0008
722d c31372    jp      $7213
7230 eb        ex      de,hl
7231 4e        ld      c,(hl)
7232 23        inc     hl
7233 46        ld      b,(hl)
7234 eb        ex      de,hl
7235 c31372    jp      $7213
7238 010200    ld      bc,$0002
723b 1a        ld      a,(de)
723c be        cp      (hl)
723d c24b72    jp      nz,$724b
7240 23        inc     hl
7241 13        inc     de
7242 0b        dec     bc
7243 78        ld      a,b
7244 b1        or      c
7245 c23b72    jp      nz,$723b
7248 3eff      ld      a,$ff
724a c9        ret     

724b af        xor     a
724c c9        ret     

724d 010400    ld      bc,$0004
7250 c33b72    jp      $723b
7253 010800    ld      bc,$0008
7256 c33b72    jp      $723b
7259 e5        push    hl
725a 60        ld      h,b
725b 69        ld      l,c
725c 4e        ld      c,(hl)
725d 23        inc     hl
725e 46        ld      b,(hl)
725f e1        pop     hl
7260 c33b72    jp      $723b
7263 0e00      ld      c,$00
7265 c36f72    jp      $726f
7268 0e20      ld      c,$20
726a c36f72    jp      $726f
726d 0a        ld      a,(bc)
726e 4f        ld      c,a
726f eb        ex      de,hl
7270 7e        ld      a,(hl)
7271 23        inc     hl
7272 66        ld      h,(hl)
7273 6f        ld      l,a
7274 b4        or      h
7275 c8        ret     z

7276 eb        ex      de,hl
7277 71        ld      (hl),c
7278 23        inc     hl
7279 1b        dec     de
727a 7a        ld      a,d
727b b3        or      e
727c c27772    jp      nz,$7277
727f c9        ret     

7280 22f288    ld      ($88f2),hl
7283 eb        ex      de,hl
7284 22f488    ld      ($88f4),hl
7287 2af288    ld      hl,($88f2)
728a 7e        ld      a,(hl)
728b 23        inc     hl
728c 66        ld      h,(hl)
728d 6f        ld      l,a
728e eb        ex      de,hl
728f 2af488    ld      hl,($88f4)
7292 7e        ld      a,(hl)
7293 23        inc     hl
7294 66        ld      h,(hl)
7295 6f        ld      l,a
7296 7b        ld      a,e
7297 95        sub     l
7298 6f        ld      l,a
7299 7a        ld      a,d
729a 9c        sbc     a,h
729b 67        ld      h,a
729c 7d        ld      a,l
729d 07        rlca    
729e b5        or      l
729f e67f      and     $7f
72a1 b4        or      h
72a2 3d        dec     a
72a3 c681      add     a,$81
72a5 9f        sbc     a,a
72a6 32ea88    ld      ($88ea),a
72a9 c9        ret     

72aa 22ff88    ld      ($88ff),hl
72ad eb        ex      de,hl
72ae 220189    ld      ($8901),hl
72b1 2aff88    ld      hl,($88ff)
72b4 7e        ld      a,(hl)
72b5 23        inc     hl
72b6 66        ld      h,(hl)
72b7 6f        ld      l,a
72b8 eb        ex      de,hl
72b9 2a0189    ld      hl,($8901)
72bc 7e        ld      a,(hl)
72bd 23        inc     hl
72be 66        ld      h,(hl)
72bf 6f        ld      l,a
72c0 7b        ld      a,e
72c1 95        sub     l
72c2 6f        ld      l,a
72c3 7a        ld      a,d
72c4 9c        sbc     a,h
72c5 67        ld      h,a
72c6 7d        ld      a,l
72c7 07        rlca    
72c8 b5        or      l
72c9 e67f      and     $7f
72cb b4        or      h
72cc d601      sub     $01
72ce 9f        sbc     a,a
72cf 32f788    ld      ($88f7),a
72d2 c9        ret     

72d3 220c89    ld      ($890c),hl
72d6 eb        ex      de,hl
72d7 220e89    ld      ($890e),hl
72da 2a0c89    ld      hl,($890c)
72dd 7e        ld      a,(hl)
72de 23        inc     hl
72df 66        ld      h,(hl)
72e0 6f        ld      l,a
72e1 eb        ex      de,hl
72e2 2a0e89    ld      hl,($890e)
72e5 7e        ld      a,(hl)
72e6 23        inc     hl
72e7 66        ld      h,(hl)
72e8 6f        ld      l,a
72e9 7b        ld      a,e
72ea 95        sub     l
72eb 6f        ld      l,a
72ec 7a        ld      a,d
72ed 9c        sbc     a,h
72ee 67        ld      h,a
72ef 7d        ld      a,l
72f0 07        rlca    
72f1 b5        or      l
72f2 e67f      and     $7f
72f4 b4        or      h
72f5 17        rla     
72f6 9f        sbc     a,a
72f7 320489    ld      ($8904),a
72fa c9        ret     

72fb 221989    ld      ($8919),hl
72fe eb        ex      de,hl
72ff 221b89    ld      ($891b),hl
7302 2a1989    ld      hl,($8919)
7305 7e        ld      a,(hl)
7306 23        inc     hl
7307 66        ld      h,(hl)
7308 6f        ld      l,a
7309 eb        ex      de,hl
730a 2a1b89    ld      hl,($891b)
730d 7e        ld      a,(hl)
730e 23        inc     hl
730f 66        ld      h,(hl)
7310 6f        ld      l,a
7311 7b        ld      a,e
7312 95        sub     l
7313 6f        ld      l,a
7314 7a        ld      a,d
7315 9c        sbc     a,h
7316 67        ld      h,a
7317 7d        ld      a,l
7318 07        rlca    
7319 b5        or      l
731a e67f      and     $7f
731c b4        or      h
731d 3d        dec     a
731e d67f      sub     $7f
7320 9f        sbc     a,a
7321 321189    ld      ($8911),a
7324 c9        ret     

7325 222689    ld      ($8926),hl
7328 2a2689    ld      hl,($8926)
732b 7e        ld      a,(hl)
732c 23        inc     hl
732d 66        ld      h,(hl)
732e 6f        ld      l,a
732f 7d        ld      a,l
7330 07        rlca    
7331 b5        or      l
7332 e67f      and     $7f
7334 b4        or      h
7335 d601      sub     $01
7337 9f        sbc     a,a
7338 321e89    ld      ($891e),a
733b c9        ret     

733c d5        push    de
733d 5e        ld      e,(hl)
733e 23        inc     hl
733f 56        ld      d,(hl)
7340 eb        ex      de,hl
7341 226873    ld      ($7368),hl
7344 eb        ex      de,hl
7345 2abe81    ld      hl,($81be)
7348 19        add     hl,de
7349 da6473    jp      c,$7364
734c 97        sub     a
734d eb        ex      de,hl
734e 2a0600    ld      hl,($0006)
7351 cd8173    call    $7381
7354 da6473    jp      c,$7364
7357 2abe81    ld      hl,($81be)
735a eb        ex      de,hl
735b 22be81    ld      ($81be),hl
735e e1        pop     hl
735f 73        ld      (hl),e
7360 23        inc     hl
7361 72        ld      (hl),d
7362 af        xor     a
7363 c9        ret     

7364 e1        pop     hl
7365 3eff      ld      a,$ff
7367 c9        ret     

7368 80        add     a,b
7369 00        nop     
736a e5        push    hl
736b 2abe81    ld      hl,($81be)
736e eb        ex      de,hl
736f 2a0600    ld      hl,($0006)
7372 cd8173    call    $7381
7375 d27b73    jp      nc,$737b
7378 210000    ld      hl,$0000
737b eb        ex      de,hl
737c e1        pop     hl
737d 73        ld      (hl),e
737e 23        inc     hl
737f 72        ld      (hl),d
7380 c9        ret     

7381 7d        ld      a,l
7382 93        sub     e
7383 6f        ld      l,a
7384 7c        ld      a,h
7385 9a        sbc     a,d
7386 67        ld      h,a
7387 c9        ret     

7388 e5        push    hl
7389 cdb073    call    $73b0
738c e1        pop     hl
738d 77        ld      (hl),a
738e c9        ret     

738f e5        push    hl
7390 cdb873    call    $73b8
7393 e1        pop     hl
7394 77        ld      (hl),a
7395 e5        push    hl
7396 0e17      ld      c,$17
7398 cd4474    call    $7444
739b e1        pop     hl
739c c8        ret     z

739d be        cp      (hl)
739e c0        ret     nz

739f e5        push    hl
73a0 cdb873    call    $73b8
73a3 e1        pop     hl
73a4 be        cp      (hl)
73a5 c8        ret     z

73a6 f680      or      $80
73a8 77        ld      (hl),a
73a9 c9        ret     

73aa 5e        ld      e,(hl)
73ab 0e05      ld      c,$05
73ad c30500    jp      $0005
73b0 cda674    call    $74a6
73b3 b7        or      a
73b4 c8        ret     z

73b5 3eff      ld      a,$ff
73b7 c9        ret     

73b8 c38974    jp      $7489
73bb 5e        ld      e,(hl)
73bc d5        push    de
73bd cddb03    call    $03db
73c0 d1        pop     de
73c1 c37874    jp      $7478
73c4 5e        ld      e,(hl)
73c5 c37874    jp      $7478
73c8 7e        ld      a,(hl)
73c9 fe24      cp      $24
73cb c8        ret     z

73cc e5        push    hl
73cd cdbb73    call    $73bb
73d0 e1        pop     hl
73d1 23        inc     hl
73d2 c3c873    jp      $73c8
73d5 7e        ld      a,(hl)
73d6 b7        or      a
73d7 c8        ret     z

73d8 e5        push    hl
73d9 cdbb73    call    $73bb
73dc e1        pop     hl
73dd 23        inc     hl
73de c3d573    jp      $73d5
73e1 eb        ex      de,hl
73e2 0e0a      ld      c,$0a
73e4 c30500    jp      $0005
73e7 0e18      ld      c,$18
73e9 cd4474    call    $7444
73ec c4d573    call    nz,$73d5
73ef 0e22      ld      c,$22
73f1 cd4474    call    $7444
73f4 c8        ret     z

73f5 0632      ld      b,$32
73f7 e3        ex      (sp),hl
73f8 e3        ex      (sp),hl
73f9 e3        ex      (sp),hl
73fa e3        ex      (sp),hl
73fb 05        dec     b
73fc c2f773    jp      nz,$73f7
73ff 3d        dec     a
7400 c2f573    jp      nz,$73f5
7403 c9        ret     

7404 15        dec     d
7405 1d        dec     e
7406 0e01      ld      c,$01
7408 cd4474    call    $7444
740b ca1174    jp      z,$7411
740e 7b        ld      a,e
740f 5a        ld      e,d
7410 57        ld      d,a
7411 d5        push    de
7412 0e02      ld      c,$02
7414 cd4474    call    $7444
7417 c4d573    call    nz,$73d5
741a 0e08      ld      c,$08
741c cd4474    call    $7444
741f d1        pop     de
7420 d5        push    de
7421 82        add     a,d
7422 0e09      ld      c,$09
7424 cd4d74    call    $744d
7427 0e0a      ld      c,$0a
7429 cd4474    call    $7444
742c c4d573    call    nz,$73d5
742f 0e10      ld      c,$10
7431 cd4474    call    $7444
7434 d1        pop     de
7435 83        add     a,e
7436 0e11      ld      c,$11
7438 cd4d74    call    $744d
743b 0e12      ld      c,$12
743d cd4474    call    $7444
7440 c4d573    call    nz,$73d5
7443 c9        ret     

7444 218e02    ld      hl,$028e
7447 0600      ld      b,$00
7449 09        add     hl,bc
744a 7e        ld      a,(hl)
744b b7        or      a
744c c9        ret     

744d d5        push    de
744e 5f        ld      e,a
744f cd4474    call    $7444
7452 c25a74    jp      nz,$745a
7455 cdbc73    call    $73bc
7458 d1        pop     de
7459 c9        ret     

745a 7b        ld      a,e
745b 1e30      ld      e,$30
745d fe0a      cp      $0a
745f da6874    jp      c,$7468
7462 de0a      sbc     a,$0a
7464 1c        inc     e
7465 c35d74    jp      $745d
7468 f5        push    af
7469 7b        ld      a,e
746a fe30      cp      $30
746c c4bc73    call    nz,$73bc
746f f1        pop     af
7470 c630      add     a,$30
7472 5f        ld      e,a
7473 cdbc73    call    $73bc
7476 d1        pop     de
7477 c9        ret     

7478 d5        push    de
7479 cdaf74    call    $74af
747c 3afe74    ld      a,($74fe)
747f b7        or      a
7480 c27974    jp      nz,$7479
7483 c1        pop     bc
7484 060c      ld      b,$0c
7486 c3f374    jp      $74f3
7489 cda674    call    $74a6
748c b7        or      a
748d ca8974    jp      z,$7489
7490 210075    ld      hl,$7500
7493 4e        ld      c,(hl)
7494 79        ld      a,c
7495 3c        inc     a
7496 e607      and     $07
7498 77        ld      (hl),a
7499 79        ld      a,c
749a 210175    ld      hl,$7501
749d b7        or      a
749e 85        add     a,l
749f 6f        ld      l,a
74a0 3e00      ld      a,$00
74a2 8c        adc     a,h
74a3 67        ld      h,a
74a4 7e        ld      a,(hl)
74a5 c9        ret     

74a6 cdaf74    call    $74af
74a9 2aff74    ld      hl,($74ff)
74ac 7c        ld      a,h
74ad 95        sub     l
74ae c9        ret     

74af 0606      ld      b,$06
74b1 cdf374    call    $74f3
74b4 b7        or      a
74b5 c8        ret     z

74b6 0609      ld      b,$09
74b8 cdf374    call    $74f3
74bb 47        ld      b,a
74bc 3afd74    ld      a,($74fd)
74bf b7        or      a
74c0 cadd74    jp      z,$74dd
74c3 21fe74    ld      hl,$74fe
74c6 3e13      ld      a,$13
74c8 b8        cp      b
74c9 c2cf74    jp      nz,$74cf
74cc 3601      ld      (hl),$01
74ce c9        ret     

74cf 7e        ld      a,(hl)
74d0 b7        or      a
74d1 cadd74    jp      z,$74dd
74d4 3e11      ld      a,$11
74d6 b8        cp      b
74d7 c2dd74    jp      nz,$74dd
74da af        xor     a
74db 77        ld      (hl),a
74dc c9        ret     

74dd 21ff74    ld      hl,$74ff
74e0 4e        ld      c,(hl)
74e1 79        ld      a,c
74e2 3c        inc     a
74e3 e607      and     $07
74e5 77        ld      (hl),a
74e6 79        ld      a,c
74e7 210175    ld      hl,$7501
74ea b7        or      a
74eb 85        add     a,l
74ec 6f        ld      l,a
74ed 3e00      ld      a,$00
74ef 8c        adc     a,h
74f0 67        ld      h,a
74f1 70        ld      (hl),b
74f2 c9        ret     

74f3 21fc74    ld      hl,$74fc
74f6 e5        push    hl
74f7 2a0100    ld      hl,($0001)
74fa 68        ld      l,b
74fb e9        jp      (hl)
74fc c9        ret     

74fd 00        nop     
74fe 00        nop     
74ff 00        nop     
7500 00        nop     
7501 00        nop     
7502 00        nop     
7503 00        nop     
7504 00        nop     
7505 00        nop     
7506 00        nop     
7507 00        nop     
7508 00        nop     
7509 c30000    jp      $0000
750c 0e0d      ld      c,$0d
750e c30500    jp      $0005
7511 0e0e      ld      c,$0e
7513 5e        ld      e,(hl)
7514 1600      ld      d,$00
7516 c30500    jp      $0005
7519 0e0f      ld      c,$0f
751b eb        ex      de,hl
751c c30500    jp      $0005
751f 0e10      ld      c,$10
7521 eb        ex      de,hl
7522 c30500    jp      $0005
7525 0e11      ld      c,$11
7527 eb        ex      de,hl
7528 c30500    jp      $0005
752b 0e12      ld      c,$12
752d eb        ex      de,hl
752e c30500    jp      $0005
7531 0e13      ld      c,$13
7533 eb        ex      de,hl
7534 c30500    jp      $0005
7537 0e14      ld      c,$14
7539 eb        ex      de,hl
753a c30500    jp      $0005
753d 0e15      ld      c,$15
753f eb        ex      de,hl
7540 c30500    jp      $0005
7543 0e16      ld      c,$16
7545 eb        ex      de,hl
7546 c30500    jp      $0005
7549 0e17      ld      c,$17
754b eb        ex      de,hl
754c c30500    jp      $0005
754f 0e18      ld      c,$18
7551 e5        push    hl
7552 cd0500    call    $0005
7555 e1        pop     hl
7556 77        ld      (hl),a
7557 c9        ret     

7558 0e19      ld      c,$19
755a c35175    jp      $7551
755d 0e1a      ld      c,$1a
755f eb        ex      de,hl
7560 c30500    jp      $0005
7563 0e21      ld      c,$21
7565 eb        ex      de,hl
7566 c30500    jp      $0005
7569 0e22      ld      c,$22
756b eb        ex      de,hl
756c c30500    jp      $0005
756f 0e24      ld      c,$24
7571 eb        ex      de,hl
7572 c30500    jp      $0005
7575 7e        ld      a,(hl)
7576 23        inc     hl
7577 66        ld      h,(hl)
7578 6f        ld      l,a
7579 c35d75    jp      $755d
757c e5        push    hl
757d c5        push    bc
757e d5        push    de
757f cd2777    call    $7727
7582 cd9877    call    $7798
7585 c29375    jp      nz,$7593
7588 e5        push    hl
7589 110c00    ld      de,$000c
758c 19        add     hl,de
758d 220376    ld      ($7603),hl
7590 c3fe75    jp      $75fe
7593 d1        pop     de
7594 c1        pop     bc
7595 e1        pop     hl
7596 e5        push    hl
7597 c5        push    bc
7598 d5        push    de
7599 cd0577    call    $7705
759c 2a8200    ld      hl,($0082)
759f 220a01    ld      ($010a),hl
75a2 2a8000    ld      hl,($0080)
75a5 1180ff    ld      de,$ff80
75a8 19        add     hl,de
75a9 e5        push    hl
75aa eb        ex      de,hl
75ab 218c00    ld      hl,$008c
75ae 19        add     hl,de
75af 220376    ld      ($7603),hl
75b2 e1        pop     hl
75b3 018000    ld      bc,$0080
75b6 09        add     hl,bc
75b7 e5        push    hl
75b8 eb        ex      de,hl
75b9 2a0a01    ld      hl,($010a)
75bc 7d        ld      a,l
75bd 93        sub     e
75be 6f        ld      l,a
75bf 7c        ld      a,h
75c0 9a        sbc     a,d
75c1 67        ld      h,a
75c2 c2ed75    jp      nz,$75ed
75c5 7d        ld      a,l
75c6 fe80      cp      $80
75c8 f2ed75    jp      p,$75ed
75cb e5        push    hl
75cc 118000    ld      de,$0080
75cf 0e1a      ld      c,$1a
75d1 cd0500    call    $0005
75d4 0e14      ld      c,$14
75d6 11f277    ld      de,$77f2
75d9 cd0500    call    $0005
75dc b7        or      a
75dd e1        pop     hl
75de c2fe75    jp      nz,$75fe
75e1 d1        pop     de
75e2 d5        push    de
75e3 4d        ld      c,l
75e4 218000    ld      hl,$0080
75e7 cdda76    call    $76da
75ea c3fe75    jp      $75fe
75ed 0e1a      ld      c,$1a
75ef cd0500    call    $0005
75f2 0e14      ld      c,$14
75f4 11f277    ld      de,$77f2
75f7 cd0500    call    $0005
75fa b7        or      a
75fb cab275    jp      z,$75b2
75fe e1        pop     hl
75ff d1        pop     de
7600 c1        pop     bc
7601 e1        pop     hl
7602 c3bd02    jp      $02bd
7605 21f377    ld      hl,$77f3
7608 113a76    ld      de,$763a
760b 0e08      ld      c,$08
760d cdda76    call    $76da
7610 111b76    ld      de,$761b
7613 0e09      ld      c,$09
7615 cd0500    call    $0005
7618 c30000    jp      $0000
761b 0d        dec     c
761c 0a        ld      a,(bc)
761d 0d        dec     c
761e 0a        ld      a,(bc)
761f 2a2a2a    ld      hl,($2a2a)
7622 2055      jr      nz,$7679
7624 4e        ld      c,(hl)
7625 41        ld      b,c
7626 42        ld      b,d
7627 4c        ld      c,h
7628 45        ld      b,l
7629 2054      jr      nz,$767f
762b 4f        ld      c,a
762c 2047      jr      nz,$7675
762e 45        ld      b,l
762f 54        ld      d,h
7630 204f      jr      nz,$7681
7632 56        ld      d,(hl)
7633 45        ld      b,l
7634 52        ld      d,d
7635 4c        ld      c,h
7636 41        ld      b,c
7637 59        ld      e,c
7638 2028      jr      nz,$7662
763a 58        ld      e,b
763b 58        ld      e,b
763c 58        ld      e,b
763d 58        ld      e,b
763e 58        ld      e,b
763f 58        ld      e,b
7640 58        ld      e,b
7641 58        ld      e,b
7642 29        add     hl,hl
7643 202a      jr      nz,$766f
7645 2a2a0a    ld      hl,($0a2a)
7648 0d        dec     c
7649 0a        ld      a,(bc)
764a 0d        dec     c
764b 24        inc     h
764c e1        pop     hl
764d 22d876    ld      ($76d8),hl
7650 2a0600    ld      hl,($0006)
7653 2b        dec     hl
7654 f9        ld      sp,hl
7655 210c01    ld      hl,$010c
7658 11f377    ld      de,$77f3
765b 0e08      ld      c,$08
765d cdda76    call    $76da
7660 0e15      ld      c,$15
7662 af        xor     a
7663 11fe77    ld      de,$77fe
7666 cde376    call    $76e3
7669 010400    ld      bc,$0004
766c c5        push    bc
766d 2a0801    ld      hl,($0108)
7670 222378    ld      ($7823),hl
7673 eb        ex      de,hl
7674 0e1a      ld      c,$1a
7676 cd0500    call    $0005
7679 11f277    ld      de,$77f2
767c 0e0f      ld      c,$0f
767e cd0500    call    $0005
7681 11f277    ld      de,$77f2
7684 0e14      ld      c,$14
7686 cd0500    call    $0005
7689 b7        or      a
768a c20576    jp      nz,$7605
768d 118000    ld      de,$0080
7690 2a2378    ld      hl,($7823)
7693 19        add     hl,de
7694 222378    ld      ($7823),hl
7697 eb        ex      de,hl
7698 0e1a      ld      c,$1a
769a cd0500    call    $0005
769d c1        pop     bc
769e 0d        dec     c
769f c5        push    bc
76a0 c28176    jp      nz,$7681
76a3 c1        pop     bc
76a4 2a0801    ld      hl,($0108)
76a7 7e        ld      a,(hl)
76a8 23        inc     hl
76a9 66        ld      h,(hl)
76aa 6f        ld      l,a
76ab 29        add     hl,hl
76ac 29        add     hl,hl
76ad e5        push    hl
76ae 29        add     hl,hl
76af d1        pop     de
76b0 19        add     hl,de
76b1 110200    ld      de,$0002
76b4 19        add     hl,de
76b5 eb        ex      de,hl
76b6 2a0801    ld      hl,($0108)
76b9 221978    ld      ($7819),hl
76bc 19        add     hl,de
76bd 220801    ld      ($0108),hl
76c0 2a1978    ld      hl,($7819)
76c3 110200    ld      de,$0002
76c6 19        add     hl,de
76c7 221b78    ld      ($781b),hl
76ca 2a1978    ld      hl,($7819)
76cd 7e        ld      a,(hl)
76ce 23        inc     hl
76cf 66        ld      h,(hl)
76d0 6f        ld      l,a
76d1 222578    ld      ($7825),hl
76d4 2a0600    ld      hl,($0006)
76d7 c30301    jp      $0103
76da 7e        ld      a,(hl)
76db 12        ld      (de),a
76dc 23        inc     hl
76dd 13        inc     de
76de 0d        dec     c
76df c2da76    jp      nz,$76da
76e2 c9        ret     

76e3 12        ld      (de),a
76e4 13        inc     de
76e5 0d        dec     c
76e6 c2e376    jp      nz,$76e3
76e9 c9        ret     

76ea 320477    ld      ($7704),a
76ed 7d        ld      a,l
76ee 93        sub     e
76ef f5        push    af
76f0 7c        ld      a,h
76f1 9a        sbc     a,d
76f2 c2fe76    jp      nz,$76fe
76f5 7c        ld      a,h
76f6 ba        cp      d
76f7 c2fe76    jp      nz,$76fe
76fa f1        pop     af
76fb c30077    jp      $7700
76fe 33        inc     sp
76ff 33        inc     sp
7700 3a0477    ld      a,($7704)
7703 c9        ret     

7704 00        nop     
7705 cd2777    call    $7727
7708 221f78    ld      ($781f),hl
770b 110200    ld      de,$0002
770e 19        add     hl,de
770f 7e        ld      a,(hl)
7710 23        inc     hl
7711 66        ld      h,(hl)
7712 6f        ld      l,a
7713 221378    ld      ($7813),hl
7716 0e1a      ld      c,$1a
7718 118000    ld      de,$0080
771b cd0500    call    $0005
771e 11f277    ld      de,$77f2
7721 0e21      ld      c,$21
7723 cd0500    call    $0005
7726 c9        ret     

7727 222178    ld      ($7821),hl
772a 211d78    ld      hl,$781d
772d 3600      ld      (hl),$00
772f 2a1b78    ld      hl,($781b)
7732 e5        push    hl
7733 e1        pop     hl
7734 e5        push    hl
7735 110400    ld      de,$0004
7738 19        add     hl,de
7739 eb        ex      de,hl
773a 2a2178    ld      hl,($7821)
773d 0e08      ld      c,$08
773f 1a        ld      a,(de)
7740 be        cp      (hl)
7741 c24c77    jp      nz,$774c
7744 23        inc     hl
7745 13        inc     de
7746 0d        dec     c
7747 c23f77    jp      nz,$773f
774a e1        pop     hl
774b c9        ret     

774c e1        pop     hl
774d 110c00    ld      de,$000c
7750 19        add     hl,de
7751 e5        push    hl
7752 211d78    ld      hl,$781d
7755 34        inc     (hl)
7756 3a2578    ld      a,($7825)
7759 be        cp      (hl)
775a c23377    jp      nz,$7733
775d 2a2178    ld      hl,($7821)
7760 117677    ld      de,$7776
7763 0e08      ld      c,$08
7765 cdda76    call    $76da
7768 117377    ld      de,$7773
776b 0e09      ld      c,$09
776d cd0500    call    $0005
7770 c30000    jp      $0000
7773 0a        ld      a,(bc)
7774 0a        ld      a,(bc)
7775 0d        dec     c
7776 58        ld      e,b
7777 58        ld      e,b
7778 58        ld      e,b
7779 58        ld      e,b
777a 58        ld      e,b
777b 58        ld      e,b
777c 58        ld      e,b
777d 58        ld      e,b
777e 2049      jr      nz,$77c9
7780 53        ld      d,e
7781 204e      jr      nz,$77d1
7783 4f        ld      c,a
7784 54        ld      d,h
7785 2041      jr      nz,$77c8
7787 4e        ld      c,(hl)
7788 204f      jr      nz,$77d9
778a 56        ld      d,(hl)
778b 45        ld      b,l
778c 52        ld      d,d
778d 4c        ld      c,h
778e 41        ld      b,c
778f 59        ld      e,c
7790 204e      jr      nz,$77e0
7792 41        ld      b,c
7793 4d        ld      c,l
7794 45        ld      b,l
7795 0a        ld      a,(bc)
7796 0d        dec     c
7797 24        inc     h
7798 221778    ld      ($7817),hl
779b 7e        ld      a,(hl)
779c 23        inc     hl
779d 66        ld      h,(hl)
779e 6f        ld      l,a
779f e5        push    hl
77a0 110400    ld      de,$0004
77a3 19        add     hl,de
77a4 eb        ex      de,hl
77a5 2a1778    ld      hl,($7817)
77a8 010400    ld      bc,$0004
77ab 09        add     hl,bc
77ac eb        ex      de,hl
77ad 0e08      ld      c,$08
77af 1a        ld      a,(de)
77b0 be        cp      (hl)
77b1 c2ba77    jp      nz,$77ba
77b4 23        inc     hl
77b5 13        inc     de
77b6 0d        dec     c
77b7 c2af77    jp      nz,$77af
77ba e1        pop     hl
77bb c9        ret     

77bc e3        ex      (sp),hl
77bd c5        push    bc
77be d5        push    de
77bf 5e        ld      e,(hl)
77c0 23        inc     hl
77c1 56        ld      d,(hl)
77c2 23        inc     hl
77c3 46        ld      b,(hl)
77c4 eb        ex      de,hl
77c5 220376    ld      ($7603),hl
77c8 2600      ld      h,$00
77ca 68        ld      l,b
77cb 29        add     hl,hl
77cc 29        add     hl,hl
77cd e5        push    hl
77ce 29        add     hl,hl
77cf d1        pop     de
77d0 19        add     hl,de
77d1 eb        ex      de,hl
77d2 2a1b78    ld      hl,($781b)
77d5 19        add     hl,de
77d6 e5        push    hl
77d7 cd9877    call    $7798
77da cafe75    jp      z,$75fe
77dd e1        pop     hl
77de cd0877    call    $7708
77e1 2a8200    ld      hl,($0082)
77e4 220a01    ld      ($010a),hl
77e7 2a8000    ld      hl,($0080)
77ea 1180ff    ld      de,$ff80
77ed 19        add     hl,de
77ee e5        push    hl
77ef c3b275    jp      $75b2
77f2 00        nop     
77f3 47        ld      b,a
77f4 52        ld      d,d
77f5 41        ld      b,c
77f6 46        ld      b,(hl)
77f7 54        ld      d,h
77f8 41        ld      b,c
77f9 4c        ld      c,h
77fa 4b        ld      c,e
77fb 4f        ld      c,a
77fc 56        ld      d,(hl)
77fd 4c        ld      c,h
77fe 00        nop     
77ff 00        nop     
7800 00        nop     
7801 80        add     a,b
7802 010203    ld      bc,$0302
7805 04        inc     b
7806 05        dec     b
7807 0607      ld      b,$07
7809 08        ex      af,af'
780a 09        add     hl,bc
780b 0a        ld      a,(bc)
780c 0b        dec     bc
780d 0c        inc     c
780e 0d        dec     c
780f 0e0f      ld      c,$0f
7811 100a      djnz    $781d
7813 08        ex      af,af'
7814 00        nop     
7815 00        nop     
7816 00        nop     
7817 9b        sbc     a,e
7818 b8        cp      b
7819 5d        ld      e,l
781a b8        cp      b
781b 5f        ld      e,a
781c b8        cp      b
781d 05        dec     b
781e 00        nop     
781f 9b        sbc     a,e
7820 b8        cp      b
7821 40        ld      b,b
7822 2b        dec     hl
7823 5d        ld      e,l
7824 ba        cp      d
7825 13        inc     de
7826 00        nop     
7827 cd347e    call    $7e34
782a c33078    jp      $7830
782d cd2380    call    $8023
7830 0604      ld      b,$04
7832 af        xor     a
7833 21ef89    ld      hl,$89ef
7836 77        ld      (hl),a
7837 23        inc     hl
7838 05        dec     b
7839 c23678    jp      nz,$7836
783c c35380    jp      $8053
783f cd4778    call    $7847
7842 7d        ld      a,l
7843 c9        ret     

7844 cd7c78    call    $787c
7847 cd5078    call    $7850
784a c3d678    jp      $78d6
784d cd7c78    call    $787c
7850 cdee7e    call    $7eee
7853 21f289    ld      hl,$89f2
7856 46        ld      b,(hl)
7857 23        inc     hl
7858 5e        ld      e,(hl)
7859 23        inc     hl
785a 56        ld      d,(hl)
785b 23        inc     hl
785c 4e        ld      c,(hl)
785d c3ea7f    jp      $7fea
7860 cdd678    call    $78d6
7863 7d        ld      a,l
7864 c9        ret     

7865 11f989    ld      de,$89f9
7868 0608      ld      b,$08
786a 7e        ld      a,(hl)
786b 12        ld      (de),a
786c 13        inc     de
786d 23        inc     hl
786e 05        dec     b
786f c26a78    jp      nz,$786a
7872 b7        or      a
7873 47        ld      b,a
7874 2b        dec     hl
7875 2b        dec     hl
7876 4e        ld      c,(hl)
7877 c8        ret     z

7878 79        ld      a,c
7879 c35b80    jp      $805b
787c 11ef89    ld      de,$89ef
787f c36878    jp      $7868
7882 cd2380    call    $8023
7885 c8        ret     z

7886 fabb78    jp      m,$78bb
7889 78        ld      a,b
788a 1f        rra     
788b f5        push    af
788c 3e40      ld      a,$40
788e 17        rla     
788f 47        ld      b,a
7890 32f689    ld      ($89f6),a
7893 3e04      ld      a,$04
7895 f5        push    af
7896 cd037f    call    $7f03
7899 d5        push    de
789a c5        push    bc
789b 78        ld      a,b
789c b7        or      a
789d cd597c    call    $7c59
78a0 c1        pop     bc
78a1 d1        pop     de
78a2 cde47b    call    $7be4
78a5 217979    ld      hl,$7979
78a8 cd547d    call    $7d54
78ab cd0d7f    call    $7f0d
78ae f1        pop     af
78af 3d        dec     a
78b0 c29578    jp      nz,$7895
78b3 f1        pop     af
78b4 c6c0      add     a,$c0
78b6 80        add     a,b
78b7 47        ld      b,a
78b8 c32c80    jp      $802c
78bb cd2581    call    $8125
78be 8b        adc     a,e
78bf cdcd80    call    $80cd
78c2 af        xor     a
78c3 32f289    ld      ($89f2),a
78c6 cd9e7e    call    $7e9e
78c9 eb        ex      de,hl
78ca e5        push    hl
78cb cd9e7e    call    $7e9e
78ce e1        pop     hl
78cf d8        ret     c

78d0 cd187f    call    $7f18
78d3 c3ca78    jp      $78ca
78d6 21f389    ld      hl,$89f3
78d9 cd2380    call    $8023
78dc 3e90      ld      a,$90
78de b8        cp      b
78df ca1379    jp      z,$7913
78e2 d2eb78    jp      nc,$78eb
78e5 cd2581    call    $8125
78e8 14        inc     d
78e9 068f      ld      b,$8f
78eb cd4c80    call    $804c
78ee cd217a    call    $7a21
78f1 cd3a80    call    $803a
78f4 eb        ex      de,hl
78f5 ca0f79    jp      z,$790f
78f8 eb        ex      de,hl
78f9 21f789    ld      hl,$89f7
78fc 3680      ld      (hl),$80
78fe cdfb7e    call    $7efb
7901 67        ld      h,a
7902 3e98      ld      a,$98
7904 90        sub     b
7905 cd9780    call    $8097
7908 7c        ld      a,h
7909 17        rla     
790a d4bc7e    call    nc,$7ebc
790d eb        ex      de,hl
790e c9        ret     

790f 210000    ld      hl,$0000
7912 c9        ret     

7913 3e80      ld      a,$80
7915 a9        xor     c
7916 b2        or      d
7917 b3        or      e
7918 c2e578    jp      nz,$78e5
791b 61        ld      h,c
791c 6b        ld      l,e
791d c9        ret     

791e 7e        ld      a,(hl)
791f 23        inc     hl
7920 66        ld      h,(hl)
7921 6f        ld      l,a
7922 c3347e    jp      $7e34
7925 cd2380    call    $8023
7928 21127a    ld      hl,$7a12
792b cde17b    call    $7be1
792e c33479    jp      $7934
7931 cd2380    call    $8023
7934 c8        ret     z

7935 78        ld      a,b
7936 fe99      cp      $99
7938 da3f79    jp      c,$793f
793b cd2581    call    $8125
793e 17        rla     
793f 01227e    ld      bc,$7e22
7942 1183f9    ld      de,$f983
7945 cd5e7d    call    $7d5e
7948 cd037f    call    $7f03
794b cdcc7d    call    $7dcc
794e cd0d7f    call    $7f0d
7951 78        ld      a,b
7952 b1        or      c
7953 cd467c    call    $7c46
7956 217d79    ld      hl,$797d
7959 cd437c    call    $7c43
795c f5        push    af
795d fa6979    jp      m,$7969
7960 217979    ld      hl,$7979
7963 cd437c    call    $7c43
7966 f4dc7a    call    p,$7adc
7969 217d79    ld      hl,$797d
796c cde17b    call    $7be1
796f f1        pop     af
7970 f4dc7a    call    p,$7adc
7973 218179    ld      hl,$7981
7976 c3a27b    jp      $7ba2
7979 00        nop     
797a 00        nop     
797b 00        nop     
797c 80        add     a,b
797d 00        nop     
797e 00        nop     
797f 00        nop     
7980 7f        ld      a,a
7981 05        dec     b
7982 fb        ei      
7983 d7        rst     $10
7984 1e86      ld      e,$86
7986 64        ld      h,h
7987 2699      ld      h,$99
7989 87        add     a,a
798a 58        ld      e,b
798b 34        inc     (hl)
798c 23        inc     hl
798d 87        add     a,a
798e e1        pop     hl
798f 5d        ld      e,l
7990 a5        and     l
7991 86        add     a,(hl)
7992 db0f      in      a,($0f)
7994 49        ld      c,c
7995 83        add     a,e
7996 cd2380    call    $8023
7999 f2a379    jp      p,$79a3
799c cddc7a    call    $7adc
799f 21dc7a    ld      hl,$7adc
79a2 e5        push    hl
79a3 010081    ld      bc,$8100
79a6 51        ld      d,c
79a7 59        ld      e,c
79a8 cd067e    call    $7e06
79ab dab879    jp      c,$79b8
79ae 21e979    ld      hl,$79e9
79b1 e5        push    hl
79b2 cdca7e    call    $7eca
79b5 cd5c7c    call    $7c5c
79b8 01097f    ld      bc,$7f09
79bb 11a338    ld      de,$38a3
79be cd067e    call    $7e06
79c1 dae379    jp      c,$79e3
79c4 21f279    ld      hl,$79f2
79c7 e5        push    hl
79c8 cd037f    call    $7f03
79cb 21f979    ld      hl,$79f9
79ce cde17b    call    $7be1
79d1 c1        pop     bc
79d2 d1        pop     de
79d3 cdca7e    call    $7eca
79d6 d5        push    de
79d7 c5        push    bc
79d8 21f879    ld      hl,$79f8
79db cdb67b    call    $7bb6
79de c1        pop     bc
79df d1        pop     de
79e0 cd5c7c    call    $7c5c
79e3 21017a    ld      hl,$7a01
79e6 c3a27b    jp      $7ba2
79e9 21127a    ld      hl,$7a12
79ec cd437c    call    $7c43
79ef c3dc7a    jp      $7adc
79f2 21167a    ld      hl,$7a16
79f5 c3e17b    jp      $7be1
79f8 02        ld      (bc),a
79f9 d7        rst     $10
79fa b3        or      e
79fb 5d        ld      e,l
79fc 81        add     a,c
79fd 00        nop     
79fe 00        nop     
79ff 80        add     a,b
7a00 81        add     a,c
7a01 04        inc     b
7a02 62        ld      h,d
7a03 35        dec     (hl)
7a04 83        add     a,e
7a05 7e        ld      a,(hl)
7a06 50        ld      d,b
7a07 24        inc     h
7a08 4c        ld      c,h
7a09 7e        ld      a,(hl)
7a0a 79        ld      a,c
7a0b a9        xor     c
7a0c aa        xor     d
7a0d 7f        ld      a,a
7a0e 00        nop     
7a0f 00        nop     
7a10 00        nop     
7a11 81        add     a,c
7a12 db0f      in      a,($0f)
7a14 49        ld      c,c
7a15 81        add     a,c
7a16 92        sub     d
7a17 0a        ld      a,(bc)
7a18 0680      ld      b,$80
7a1a 00        nop     
7a1b 00        nop     
7a1c 00        nop     
7a1d 81        add     a,c
7a1e cd2380    call    $8023
7a21 c8        ret     z

7a22 f5        push    af
7a23 fcdc7a    call    m,$7adc
7a26 cdcc7d    call    $7dcc
7a29 f1        pop     af
7a2a fadc7a    jp      m,$7adc
7a2d c35380    jp      $8053
7a30 cd2380    call    $8023
7a33 fadc7a    jp      m,$7adc
7a36 c9        ret     

7a37 cd2380    call    $8023
7a3a cd597b    call    $7b59
7a3d 011a7f    ld      bc,$7f1a
7a40 119b20    ld      de,$209b
7a43 c35d7d    jp      $7d5d
7a46 7c        ld      a,h
7a47 b5        or      l
7a48 caea7a    jp      z,$7aea
7a4b 7c        ld      a,h
7a4c b7        or      a
7a4d f2597a    jp      p,$7a59
7a50 118b7a    ld      de,$7a8b
7a53 d5        push    de
7a54 eb        ex      de,hl
7a55 cdae7e    call    $7eae
7a58 eb        ex      de,hl
7a59 3e11      ld      a,$11
7a5b 29        add     hl,hl
7a5c 3d        dec     a
7a5d d25b7a    jp      nc,$7a5b
7a60 e5        push    hl
7a61 32f289    ld      ($89f2),a
7a64 2af389    ld      hl,($89f3)
7a67 22dc89    ld      ($89dc),hl
7a6a 2af589    ld      hl,($89f5)
7a6d 22de89    ld      ($89de),hl
7a70 21f289    ld      hl,$89f2
7a73 35        dec     (hl)
7a74 ca897a    jp      z,$7a89
7a77 cd3a80    call    $803a
7a7a cd5a7d    call    $7d5a
7a7d e1        pop     hl
7a7e 29        add     hl,hl
7a7f e5        push    hl
7a80 21dc89    ld      hl,$89dc
7a83 dc547d    call    c,$7d54
7a86 c3707a    jp      $7a70
7a89 e1        pop     hl
7a8a c9        ret     

7a8b 010081    ld      bc,$8100
7a8e 51        ld      d,c
7a8f 59        ld      e,c
7a90 cdca7e    call    $7eca
7a93 78        ld      a,b
7a94 b1        or      c
7a95 c3597c    jp      $7c59
7a98 cd4480    call    $8044
7a9b caea7a    jp      z,$7aea
7a9e f5        push    af
7a9f cd5380    call    $8053
7aa2 caf27a    jp      z,$7af2
7aa5 e1        pop     hl
7aa6 cd037f    call    $7f03
7aa9 f2ba7a    jp      p,$7aba
7aac c5        push    bc
7aad d5        push    de
7aae cdcf7d    call    $7dcf
7ab1 d1        pop     de
7ab2 c1        pop     bc
7ab3 f5        push    af
7ab4 cd067e    call    $7e06
7ab7 e1        pop     hl
7ab8 7c        ld      a,h
7ab9 1f        rra     
7aba cd2f80    call    $802f
7abd c1        pop     bc
7abe d1        pop     de
7abf d2c67a    jp      nc,$7ac6
7ac2 21dc7a    ld      hl,$7adc
7ac5 e5        push    hl
7ac6 ccd77a    call    z,$7ad7
7ac9 cd037f    call    $7f03
7acc cd567b    call    $7b56
7acf c1        pop     bc
7ad0 d1        pop     de
7ad1 cd5a7d    call    $7d5a
7ad4 c3f97a    jp      $7af9
7ad7 3e7f      ld      a,$7f
7ad9 a1        and     c
7ada 4f        ld      c,a
7adb c9        ret     

7adc 21f689    ld      hl,$89f6
7adf 7e        ld      a,(hl)
7ae0 b7        or      a
7ae1 c8        ret     z

7ae2 2b        dec     hl
7ae3 3e80      ld      a,$80
7ae5 ae        xor     (hl)
7ae6 77        ld      (hl),a
7ae7 c35380    jp      $8053
7aea 010081    ld      bc,$8100
7aed 51        ld      d,c
7aee 59        ld      e,c
7aef c32c80    jp      $802c
7af2 f1        pop     af
7af3 fa9a7e    jp      m,$7e9a
7af6 c35380    jp      $8053
7af9 3af689    ld      a,($89f6)
7afc fe88      cp      $88
7afe d2307b    jp      nc,$7b30
7b01 fe68      cp      $68
7b03 da287b    jp      c,$7b28
7b06 cd037f    call    $7f03
7b09 cdcc7d    call    $7dcc
7b0c c681      add     a,$81
7b0e c1        pop     bc
7b0f d1        pop     de
7b10 ca307b    jp      z,$7b30
7b13 f5        push    af
7b14 cdca7e    call    $7eca
7b17 cd497c    call    $7c49
7b1a 21397b    ld      hl,$7b39
7b1d cdb67b    call    $7bb6
7b20 c1        pop     bc
7b21 110000    ld      de,$0000
7b24 4a        ld      c,d
7b25 c35e7d    jp      $7d5e
7b28 010081    ld      bc,$8100
7b2b 51        ld      d,c
7b2c 59        ld      e,c
7b2d c32c80    jp      $802c
7b30 cd5380    call    $8053
7b33 fa0a80    jp      m,$800a
7b36 c3d97f    jp      $7fd9
7b39 07        rlca    
7b3a 7c        ld      a,h
7b3b 88        adc     a,b
7b3c 59        ld      e,c
7b3d 74        ld      (hl),h
7b3e e0        ret     po

7b3f 97        sub     a
7b40 2677      ld      h,$77
7b42 c41d1e    call    nz,$1e1d
7b45 7a        ld      a,d
7b46 5e        ld      e,(hl)
7b47 50        ld      d,b
7b48 63        ld      h,e
7b49 7c        ld      a,h
7b4a 1a        ld      a,(de)
7b4b fe75      cp      $75
7b4d 7e        ld      a,(hl)
7b4e 1872      jr      $7bc2
7b50 318000    ld      sp,$0080
7b53 00        nop     
7b54 00        nop     
7b55 81        add     a,c
7b56 cd2c80    call    $802c
7b59 e2607b    jp      po,$7b60
7b5c cd2581    call    $8125
7b5f 8a        adc     a,d
7b60 3e80      ld      a,$80
7b62 32f689    ld      ($89f6),a
7b65 a8        xor     b
7b66 f5        push    af
7b67 217d7b    ld      hl,$7b7d
7b6a cdb67b    call    $7bb6
7b6d f1        pop     af
7b6e cd037f    call    $7f03
7b71 6f        ld      l,a
7b72 17        rla     
7b73 9f        sbc     a,a
7b74 67        ld      h,a
7b75 cd347e    call    $7e34
7b78 c1        pop     bc
7b79 d1        pop     de
7b7a c3e77b    jp      $7be7
7b7d 09        add     hl,bc
7b7e d8        ret     c

7b7f ee94      xor     $94
7b81 82        add     a,d
7b82 a9        xor     c
7b83 aa        xor     d
7b84 7d        ld      a,l
7b85 84        add     a,h
7b86 7d        ld      a,l
7b87 99        sbc     a,c
7b88 bf        cp      a
7b89 86        add     a,(hl)
7b8a 7b        ld      a,e
7b8b e5        push    hl
7b8c 2887      jr      z,$7b15
7b8e 8a        adc     a,d
7b8f 71        ld      (hl),c
7b90 c0        ret     nz

7b91 87        add     a,a
7b92 6e        ld      l,(hl)
7b93 95        sub     l
7b94 14        inc     d
7b95 87        add     a,a
7b96 b2        or      d
7b97 1ea0      ld      e,$a0
7b99 86        add     a,(hl)
7b9a ad        xor     l
7b9b 7a        ld      a,d
7b9c 02        ld      (bc),a
7b9d 85        add     a,l
7b9e 09        add     hl,bc
7b9f 9d        sbc     a,l
7ba0 8d        adc     a,l
7ba1 83        add     a,e
7ba2 eb        ex      de,hl
7ba3 cd037f    call    $7f03
7ba6 d5        push    de
7ba7 cd3a80    call    $803a
7baa cd5a7d    call    $7d5a
7bad e1        pop     hl
7bae cdb67b    call    $7bb6
7bb1 c1        pop     bc
7bb2 d1        pop     de
7bb3 c35a7d    jp      $7d5a
7bb6 eb        ex      de,hl
7bb7 cd037f    call    $7f03
7bba eb        ex      de,hl
7bbb 7e        ld      a,(hl)
7bbc f5        push    af
7bbd 23        inc     hl
7bbe cd2380    call    $8023
7bc1 f1        pop     af
7bc2 c1        pop     bc
7bc3 d1        pop     de
7bc4 3d        dec     a
7bc5 c8        ret     z

7bc6 d5        push    de
7bc7 c5        push    bc
7bc8 f5        push    af
7bc9 e5        push    hl
7bca 78        ld      a,b
7bcb b1        or      c
7bcc cd577d    call    $7d57
7bcf e1        pop     hl
7bd0 cd4480    call    $8044
7bd3 e5        push    hl
7bd4 cde77b    call    $7be7
7bd7 e1        pop     hl
7bd8 c3c17b    jp      $7bc1
7bdb cd467e    call    $7e46
7bde c3e47b    jp      $7be4
7be1 cd4480    call    $8044
7be4 ca5380    jp      z,$8053
7be7 3af689    ld      a,($89f6)
7bea b7        or      a
7beb ca2c80    jp      z,$802c
7bee 90        sub     b
7bef d2f77b    jp      nc,$7bf7
7bf2 2f        cpl     
7bf3 3c        inc     a
7bf4 cdca7e    call    $7eca
7bf7 fe19      cp      $19
7bf9 d25380    jp      nc,$8053
7bfc f5        push    af
7bfd cdee7e    call    $7eee
7c00 67        ld      h,a
7c01 f1        pop     af
7c02 e5        push    hl
7c03 cd9780    call    $8097
7c06 f1        pop     af
7c07 b7        or      a
7c08 21f389    ld      hl,$89f3
7c0b f2297c    jp      p,$7c29
7c0e 7e        ld      a,(hl)
7c0f 83        add     a,e
7c10 5f        ld      e,a
7c11 23        inc     hl
7c12 7e        ld      a,(hl)
7c13 8a        adc     a,d
7c14 57        ld      d,a
7c15 23        inc     hl
7c16 7e        ld      a,(hl)
7c17 89        adc     a,c
7c18 4f        ld      c,a
7c19 d2ea7f    jp      nc,$7fea
7c1c 23        inc     hl
7c1d 34        inc     (hl)
7c1e cad97f    jp      z,$7fd9
7c21 2e01      ld      l,$01
7c23 cdad80    call    $80ad
7c26 c3ea7f    jp      $7fea
7c29 af        xor     a
7c2a 90        sub     b
7c2b 47        ld      b,a
7c2c 7e        ld      a,(hl)
7c2d 9b        sbc     a,e
7c2e 5f        ld      e,a
7c2f 23        inc     hl
7c30 7e        ld      a,(hl)
7c31 9a        sbc     a,d
7c32 57        ld      d,a
7c33 23        inc     hl
7c34 7e        ld      a,(hl)
7c35 99        sbc     a,c
7c36 4f        ld      c,a
7c37 dcb67e    call    c,$7eb6
7c3a c32c7f    jp      $7f2c
7c3d cd467e    call    $7e46
7c40 c3467c    jp      $7c46
7c43 cd4480    call    $8044
7c46 ca5380    jp      z,$8053
7c49 3e80      ld      a,$80
7c4b a9        xor     c
7c4c 4f        ld      c,a
7c4d c3e77b    jp      $7be7
7c50 cd467e    call    $7e46
7c53 c3597c    jp      $7c59
7c56 cd4480    call    $8044
7c59 ca9a7e    jp      z,$7e9a
7c5c cd5380    call    $8053
7c5f c8        ret     z

7c60 af        xor     a
7c61 90        sub     b
7c62 47        ld      b,a
7c63 cdac7d    call    $7dac
7c66 eb        ex      de,hl
7c67 22dc89    ld      ($89dc),hl
7c6a eb        ex      de,hl
7c6b 79        ld      a,c
7c6c 32de89    ld      ($89de),a
7c6f 46        ld      b,(hl)
7c70 af        xor     a
7c71 6f        ld      l,a
7c72 cdc17e    call    $7ec1
7c75 cdca7e    call    $7eca
7c78 210000    ld      hl,$0000
7c7b 44        ld      b,h
7c7c e5        push    hl
7c7d 2af389    ld      hl,($89f3)
7c80 3af589    ld      a,($89f5)
7c83 19        add     hl,de
7c84 89        adc     a,c
7c85 4f        ld      c,a
7c86 d2967c    jp      nc,$7c96
7c89 11f689    ld      de,$89f6
7c8c eb        ex      de,hl
7c8d 34        inc     (hl)
7c8e eb        ex      de,hl
7c8f d1        pop     de
7c90 cad97f    jp      z,$7fd9
7c93 c3ae7c    jp      $7cae
7c96 d1        pop     de
7c97 cdbe7c    call    $7cbe
7c9a 67        ld      h,a
7c9b 2e00      ld      l,$00
7c9d e5        push    hl
7c9e 2adc89    ld      hl,($89dc)
7ca1 3ade89    ld      a,($89de)
7ca4 19        add     hl,de
7ca5 89        adc     a,c
7ca6 4f        ld      c,a
7ca7 d1        pop     de
7ca8 7a        ld      a,d
7ca9 8b        adc     a,e
7caa d1        pop     de
7cab d2977c    jp      nc,$7c97
7cae cdbe7c    call    $7cbe
7cb1 67        ld      h,a
7cb2 2eff      ld      l,$ff
7cb4 e5        push    hl
7cb5 2af389    ld      hl,($89f3)
7cb8 3af589    ld      a,($89f5)
7cbb c3a47c    jp      $7ca4
7cbe 78        ld      a,b
7cbf 3c        inc     a
7cc0 3d        dec     a
7cc1 fad57c    jp      m,$7cd5
7cc4 7b        ld      a,e
7cc5 17        rla     
7cc6 5f        ld      e,a
7cc7 7a        ld      a,d
7cc8 17        rla     
7cc9 57        ld      d,a
7cca 78        ld      a,b
7ccb 17        rla     
7ccc 47        ld      b,a
7ccd 29        add     hl,hl
7cce 79        ld      a,c
7ccf 17        rla     
7cd0 4f        ld      c,a
7cd1 9f        sbc     a,a
7cd2 eb        ex      de,hl
7cd3 e3        ex      (sp),hl
7cd4 e9        jp      (hl)
7cd5 1f        rra     
7cd6 48        ld      c,b
7cd7 47        ld      b,a
7cd8 e1        pop     hl
7cd9 c3ea7f    jp      $7fea
7cdc cd0c7d    call    $7d0c
7cdf 3e20      ld      a,$20
7ce1 32018a    ld      ($8a01),a
7ce4 215041    ld      hl,$4150
7ce7 22028a    ld      ($8a02),hl
7cea 215553    ld      hl,$5355
7ced 22048a    ld      ($8a04),hl
7cf0 214520    ld      hl,$2045
7cf3 22068a    ld      ($8a06),hl
7cf6 cd1d7d    call    $7d1d
7cf9 2a8889    ld      hl,($8988)
7cfc 360a      ld      (hl),$0a
7cfe cd4d82    call    $824d
7d01 2a8889    ld      hl,($8988)
7d04 360a      ld      (hl),$0a
7d06 fe54      cp      $54
7d08 ca2882    jp      z,$8228
7d0b c9        ret     

7d0c e1        pop     hl
7d0d e3        ex      (sp),hl
7d0e 0606      ld      b,$06
7d10 11088a    ld      de,$8a08
7d13 7e        ld      a,(hl)
7d14 12        ld      (de),a
7d15 23        inc     hl
7d16 13        inc     de
7d17 05        dec     b
7d18 c2137d    jp      nz,$7d13
7d1b e3        ex      (sp),hl
7d1c e9        jp      (hl)
7d1d 21018a    ld      hl,$8a01
7d20 060d      ld      b,$0d
7d22 c5        push    bc
7d23 7e        ld      a,(hl)
7d24 cd3e82    call    $823e
7d27 c1        pop     bc
7d28 05        dec     b
7d29 23        inc     hl
7d2a c2227d    jp      nz,$7d22
7d2d c9        ret     

7d2e cd0c7d    call    $7d0c
7d31 3e20      ld      a,$20
7d33 32018a    ld      ($8a01),a
7d36 215354    ld      hl,$5453
7d39 22028a    ld      ($8a02),hl
7d3c 214f50    ld      hl,$504f
7d3f 22048a    ld      ($8a04),hl
7d42 212020    ld      hl,$2020
7d45 22068a    ld      ($8a06),hl
7d48 cd1d7d    call    $7d1d
7d4b c32882    jp      $8228
7d4e cd467e    call    $7e46
7d51 c3577d    jp      $7d57
7d54 cd4480    call    $8044
7d57 ca2f80    jp      z,$802f
7d5a cd5380    call    $8053
7d5d c8        ret     z

7d5e cdac7d    call    $7dac
7d61 79        ld      a,c
7d62 0e00      ld      c,$00
7d64 c5        push    bc
7d65 0e08      ld      c,$08
7d67 2b        dec     hl
7d68 46        ld      b,(hl)
7d69 c5        push    bc
7d6a 2b        dec     hl
7d6b 46        ld      b,(hl)
7d6c c5        push    bc
7d6d 2b        dec     hl
7d6e 46        ld      b,(hl)
7d6f c5        push    bc
7d70 77        ld      (hl),a
7d71 010000    ld      bc,$0000
7d74 60        ld      h,b
7d75 68        ld      l,b
7d76 e3        ex      (sp),hl
7d77 7c        ld      a,h
7d78 b7        or      a
7d79 caa47d    jp      z,$7da4
7d7c 1f        rra     
7d7d 67        ld      h,a
7d7e 79        ld      a,c
7d7f e3        ex      (sp),hl
7d80 d2887d    jp      nc,$7d88
7d83 19        add     hl,de
7d84 3af389    ld      a,($89f3)
7d87 89        adc     a,c
7d88 1f        rra     
7d89 4f        ld      c,a
7d8a 7c        ld      a,h
7d8b 1f        rra     
7d8c 67        ld      h,a
7d8d 7d        ld      a,l
7d8e 1f        rra     
7d8f 6f        ld      l,a
7d90 78        ld      a,b
7d91 1f        rra     
7d92 47        ld      b,a
7d93 e3        ex      (sp),hl
7d94 2d        dec     l
7d95 7c        ld      a,h
7d96 c27c7d    jp      nz,$7d7c
7d99 e1        pop     hl
7d9a e3        ex      (sp),hl
7d9b 7d        ld      a,l
7d9c b7        or      a
7d9d c2777d    jp      nz,$7d77
7da0 d1        pop     de
7da1 c32c7f    jp      $7f2c
7da4 e1        pop     hl
7da5 45        ld      b,l
7da6 6c        ld      l,h
7da7 61        ld      h,c
7da8 4f        ld      c,a
7da9 c3767d    jp      $7d76
7dac 21f689    ld      hl,$89f6
7daf 7e        ld      a,(hl)
7db0 80        add     a,b
7db1 47        ld      b,a
7db2 1f        rra     
7db3 a8        xor     b
7db4 78        ld      a,b
7db5 f2c47d    jp      p,$7dc4
7db8 c680      add     a,$80
7dba ca0980    jp      z,$8009
7dbd 77        ld      (hl),a
7dbe cdee7e    call    $7eee
7dc1 77        ld      (hl),a
7dc2 2b        dec     hl
7dc3 c9        ret     

7dc4 b7        or      a
7dc5 e1        pop     hl
7dc6 fad97f    jp      m,$7fd9
7dc9 c30a80    jp      $800a
7dcc cd3a80    call    $803a
7dcf 78        ld      a,b
7dd0 fe98      cp      $98
7dd2 7b        ld      a,e
7dd3 d22f80    jp      nc,$802f
7dd6 21f789    ld      hl,$89f7
7dd9 3680      ld      (hl),$80
7ddb cdfb7e    call    $7efb
7dde 77        ld      (hl),a
7ddf 67        ld      h,a
7de0 faea7d    jp      m,$7dea
7de3 7a        ld      a,d
7de4 b3        or      e
7de5 c2e97d    jp      nz,$7de9
7de8 0d        dec     c
7de9 1b        dec     de
7dea 3e98      ld      a,$98
7dec 90        sub     b
7ded cd9780    call    $8097
7df0 7c        ld      a,h
7df1 17        rla     
7df2 d4fc7f    call    nc,$7ffc
7df5 0600      ld      b,$00
7df7 7b        ld      a,e
7df8 f5        push    af
7df9 3e98      ld      a,$98
7dfb 32f689    ld      ($89f6),a
7dfe cd2c7f    call    $7f2c
7e01 f1        pop     af
7e02 d8        ret     c

7e03 2f        cpl     
7e04 3c        inc     a
7e05 c9        ret     

7e06 78        ld      a,b
7e07 b1        or      c
7e08 ca5380    jp      z,$8053
7e0b 215b80    ld      hl,$805b
7e0e e5        push    hl
7e0f cd5380    call    $8053
7e12 79        ld      a,c
7e13 2f        cpl     
7e14 c8        ret     z

7e15 21f589    ld      hl,$89f5
7e18 ae        xor     (hl)
7e19 7e        ld      a,(hl)
7e1a f0        ret     p

7e1b cd217e    call    $7e21
7e1e 1f        rra     
7e1f a9        xor     c
7e20 c9        ret     

7e21 23        inc     hl
7e22 7e        ld      a,(hl)
7e23 b8        cp      b
7e24 c0        ret     nz

7e25 2b        dec     hl
7e26 7e        ld      a,(hl)
7e27 b9        cp      c
7e28 c0        ret     nz

7e29 2b        dec     hl
7e2a 7e        ld      a,(hl)
7e2b ba        cp      d
7e2c c0        ret     nz

7e2d 2b        dec     hl
7e2e 7e        ld      a,(hl)
7e2f 93        sub     e
7e30 c0        ret     nz

7e31 e1        pop     hl
7e32 e1        pop     hl
7e33 c9        ret     

7e34 4c        ld      c,h
7e35 55        ld      d,l
7e36 0600      ld      b,$00
7e38 58        ld      e,b
7e39 29        add     hl,hl
7e3a 219080    ld      hl,$8090
7e3d 22f689    ld      ($89f6),hl
7e40 dcb67e    call    c,$7eb6
7e43 c32c7f    jp      $7f2c
7e46 eb        ex      de,hl
7e47 cd037f    call    $7f03
7e4a eb        ex      de,hl
7e4b cd347e    call    $7e34
7e4e c1        pop     bc
7e4f d1        pop     de
7e50 cdca7e    call    $7eca
7e53 c9        ret     

7e54 7c        ld      a,h
7e55 b7        or      a
7e56 c2727e    jp      nz,$7e72
7e59 b5        or      l
7e5a ca727e    jp      z,$7e72
7e5d d1        pop     de
7e5e 1a        ld      a,(de)
7e5f bd        cp      l
7e60 da6b7e    jp      c,$7e6b
7e63 29        add     hl,hl
7e64 19        add     hl,de
7e65 2b        dec     hl
7e66 7e        ld      a,(hl)
7e67 23        inc     hl
7e68 66        ld      h,(hl)
7e69 6f        ld      l,a
7e6a e9        jp      (hl)
7e6b 6f        ld      l,a
7e6c 2600      ld      h,$00
7e6e 29        add     hl,hl
7e6f 23        inc     hl
7e70 19        add     hl,de
7e71 e9        jp      (hl)
7e72 d1        pop     de
7e73 1a        ld      a,(de)
7e74 c36b7e    jp      $7e6b
7e77 eb        ex      de,hl
7e78 7a        ld      a,d
7e79 b3        or      e
7e7a ca9a7e    jp      z,$7e9a
7e7d 7a        ld      a,d
7e7e b7        or      a
7e7f 42        ld      b,d
7e80 fcae7e    call    m,$7eae
7e83 7c        ld      a,h
7e84 a8        xor     b
7e85 47        ld      b,a
7e86 7c        ld      a,h
7e87 b5        or      l
7e88 c8        ret     z

7e89 7c        ld      a,h
7e8a b7        or      a
7e8b eb        ex      de,hl
7e8c fcae7e    call    m,$7eae
7e8f c5        push    bc
7e90 cd6380    call    $8063
7e93 f1        pop     af
7e94 b7        or      a
7e95 fcae7e    call    m,$7eae
7e98 eb        ex      de,hl
7e99 c9        ret     

7e9a cd2581    call    $8125
7e9d 89        adc     a,c
7e9e cde180    call    $80e1
7ea1 d8        ret     c

7ea2 5e        ld      e,(hl)
7ea3 23        inc     hl
7ea4 56        ld      d,(hl)
7ea5 3af289    ld      a,($89f2)
7ea8 b7        or      a
7ea9 fcae7e    call    m,$7eae
7eac b7        or      a
7ead c9        ret     

7eae af        xor     a
7eaf 4f        ld      c,a
7eb0 93        sub     e
7eb1 5f        ld      e,a
7eb2 79        ld      a,c
7eb3 9a        sbc     a,d
7eb4 57        ld      d,a
7eb5 c9        ret     

7eb6 21f789    ld      hl,$89f7
7eb9 7e        ld      a,(hl)
7eba 2f        cpl     
7ebb 77        ld      (hl),a
7ebc af        xor     a
7ebd 6f        ld      l,a
7ebe 90        sub     b
7ebf 47        ld      b,a
7ec0 7d        ld      a,l
7ec1 9b        sbc     a,e
7ec2 5f        ld      e,a
7ec3 7d        ld      a,l
7ec4 9a        sbc     a,d
7ec5 57        ld      d,a
7ec6 7d        ld      a,l
7ec7 99        sbc     a,c
7ec8 4f        ld      c,a
7ec9 c9        ret     

7eca cd037f    call    $7f03
7ecd cd2f80    call    $802f
7ed0 c1        pop     bc
7ed1 d1        pop     de
7ed2 c9        ret     

7ed3 7c        ld      a,h
7ed4 b5        or      l
7ed5 c8        ret     z

7ed6 eb        ex      de,hl
7ed7 7c        ld      a,h
7ed8 b5        or      l
7ed9 c8        ret     z

7eda 44        ld      b,h
7edb 4d        ld      c,l
7edc 210000    ld      hl,$0000
7edf 3e10      ld      a,$10
7ee1 29        add     hl,hl
7ee2 eb        ex      de,hl
7ee3 29        add     hl,hl
7ee4 eb        ex      de,hl
7ee5 d2e97e    jp      nc,$7ee9
7ee8 09        add     hl,bc
7ee9 3d        dec     a
7eea c2e17e    jp      nz,$7ee1
7eed c9        ret     

7eee 21f589    ld      hl,$89f5
7ef1 7e        ld      a,(hl)
7ef2 07        rlca    
7ef3 37        scf     
7ef4 1f        rra     
7ef5 77        ld      (hl),a
7ef6 3f        ccf     
7ef7 1f        rra     
7ef8 23        inc     hl
7ef9 23        inc     hl
7efa 77        ld      (hl),a
7efb 79        ld      a,c
7efc 07        rlca    
7efd 37        scf     
7efe 1f        rra     
7eff 4f        ld      c,a
7f00 1f        rra     
7f01 ae        xor     (hl)
7f02 c9        ret     

7f03 2af389    ld      hl,($89f3)
7f06 e3        ex      (sp),hl
7f07 e5        push    hl
7f08 2af589    ld      hl,($89f5)
7f0b e3        ex      (sp),hl
7f0c e9        jp      (hl)
7f0d e1        pop     hl
7f0e e3        ex      (sp),hl
7f0f 22f589    ld      ($89f5),hl
7f12 e1        pop     hl
7f13 e3        ex      (sp),hl
7f14 22f389    ld      ($89f3),hl
7f17 c9        ret     

7f18 7c        ld      a,h
7f19 aa        xor     d
7f1a f2217f    jp      p,$7f21
7f1d ac        xor     h
7f1e f8        ret     m

7f1f eb        ex      de,hl
7f20 c9        ret     

7f21 7d        ld      a,l
7f22 93        sub     e
7f23 7c        ld      a,h
7f24 9a        sbc     a,d
7f25 47        ld      b,a
7f26 1f        rra     
7f27 a8        xor     b
7f28 a8        xor     b
7f29 f0        ret     p

7f2a eb        ex      de,hl
7f2b c9        ret     

7f2c 61        ld      h,c
7f2d 6a        ld      l,d
7f2e 53        ld      d,e
7f2f 58        ld      e,b
7f30 cd737f    call    $7f73
7f33 14        inc     d
7f34 15        dec     d
7f35 ca0a80    jp      z,$800a
7f38 4a        ld      c,d
7f39 53        ld      d,e
7f3a 5c        ld      e,h
7f3b 45        ld      b,l
7f3c 21f689    ld      hl,$89f6
7f3f 96        sub     (hl)
7f40 d20a80    jp      nc,$800a
7f43 2f        cpl     
7f44 3c        inc     a
7f45 77        ld      (hl),a
7f46 c3ea7f    jp      $7fea
7f49 0600      ld      b,$00
7f4b 21d689    ld      hl,$89d6
7f4e 7e        ld      a,(hl)
7f4f b7        or      a
7f50 c2667f    jp      nz,$7f66
7f53 78        ld      a,b
7f54 d638      sub     $38
7f56 c25b7f    jp      nz,$7f5b
7f59 47        ld      b,a
7f5a c9        ret     

7f5b c640      add     a,$40
7f5d 47        ld      b,a
7f5e 1608      ld      d,$08
7f60 cdd17f    call    $7fd1
7f63 c34b7f    jp      $7f4b
7f66 fa717f    jp      m,$7f71
7f69 cdbe7f    call    $7fbe
7f6c 04        inc     b
7f6d b7        or      a
7f6e f2667f    jp      p,$7f66
7f71 78        ld      a,b
7f72 c9        ret     

7f73 0600      ld      b,$00
7f75 7c        ld      a,h
7f76 b7        or      a
7f77 c2a07f    jp      nz,$7fa0
7f7a b5        or      l
7f7b c2877f    jp      nz,$7f87
7f7e b2        or      d
7f7f c2907f    jp      nz,$7f90
7f82 b3        or      e
7f83 c2997f    jp      nz,$7f99
7f86 c9        ret     

7f87 65        ld      h,l
7f88 6a        ld      l,d
7f89 53        ld      d,e
7f8a 58        ld      e,b
7f8b 0608      ld      b,$08
7f8d c3a07f    jp      $7fa0
7f90 eb        ex      de,hl
7f91 110000    ld      de,$0000
7f94 0610      ld      b,$10
7f96 c3a07f    jp      $7fa0
7f99 63        ld      h,e
7f9a 68        ld      l,b
7f9b 110000    ld      de,$0000
7f9e 0618      ld      b,$18
7fa0 7c        ld      a,h
7fa1 b7        or      a
7fa2 fab57f    jp      m,$7fb5
7fa5 7b        ld      a,e
7fa6 17        rla     
7fa7 5f        ld      e,a
7fa8 7a        ld      a,d
7fa9 17        rla     
7faa 57        ld      d,a
7fab 7d        ld      a,l
7fac 17        rla     
7fad 6f        ld      l,a
7fae 7c        ld      a,h
7faf 17        rla     
7fb0 67        ld      h,a
7fb1 04        inc     b
7fb2 c3a17f    jp      $7fa1
7fb5 22d189    ld      ($89d1),hl
7fb8 eb        ex      de,hl
7fb9 22cf89    ld      ($89cf),hl
7fbc 78        ld      a,b
7fbd c9        ret     

7fbe e5        push    hl
7fbf 21cf89    ld      hl,$89cf
7fc2 1e08      ld      e,$08
7fc4 b7        or      a
7fc5 7e        ld      a,(hl)
7fc6 17        rla     
7fc7 77        ld      (hl),a
7fc8 23        inc     hl
7fc9 1d        dec     e
7fca c2c57f    jp      nz,$7fc5
7fcd e1        pop     hl
7fce c9        ret     

7fcf 1604      ld      d,$04
7fd1 cdbe7f    call    $7fbe
7fd4 15        dec     d
7fd5 c2d17f    jp      nz,$7fd1
7fd8 c9        ret     

7fd9 11f27f    ld      de,$7ff2
7fdc d5        push    de
7fdd cd2581    call    $8125
7fe0 13        inc     de
7fe1 11ffff    ld      de,$ffff
7fe4 4a        ld      c,d
7fe5 21f689    ld      hl,$89f6
7fe8 71        ld      (hl),c
7fe9 c9        ret     

7fea 78        ld      a,b
7feb 21f689    ld      hl,$89f6
7fee b7        or      a
7fef fcfc7f    call    m,$7ffc
7ff2 46        ld      b,(hl)
7ff3 23        inc     hl
7ff4 7e        ld      a,(hl)
7ff5 e680      and     $80
7ff7 a9        xor     c
7ff8 4f        ld      c,a
7ff9 c32c80    jp      $802c
7ffc 1c        inc     e
7ffd c0        ret     nz

7ffe 14        inc     d
7fff c0        ret     nz

8000 0c        inc     c
8001 c0        ret     nz

8002 0e80      ld      c,$80
8004 34        inc     (hl)
8005 c0        ret     nz

8006 c3dd7f    jp      $7fdd
8009 e1        pop     hl
800a af        xor     a
800b 67        ld      h,a
800c 6f        ld      l,a
800d 22f389    ld      ($89f3),hl
8010 22f589    ld      ($89f5),hl
8013 c9        ret     

8014 e5        push    hl
8015 cd3a80    call    $803a
8018 e1        pop     hl
8019 73        ld      (hl),e
801a 23        inc     hl
801b 72        ld      (hl),d
801c 23        inc     hl
801d 71        ld      (hl),c
801e 23        inc     hl
801f 70        ld      (hl),b
8020 c34c80    jp      $804c
8023 cd4480    call    $8044
8026 e5        push    hl
8027 cd2f80    call    $802f
802a e1        pop     hl
802b c9        ret     

802c cd4c80    call    $804c
802f eb        ex      de,hl
8030 22f389    ld      ($89f3),hl
8033 eb        ex      de,hl
8034 60        ld      h,b
8035 69        ld      l,c
8036 22f589    ld      ($89f5),hl
8039 c9        ret     

803a 2af389    ld      hl,($89f3)
803d eb        ex      de,hl
803e 2af589    ld      hl,($89f5)
8041 44        ld      b,h
8042 4d        ld      c,l
8043 c9        ret     

8044 5e        ld      e,(hl)
8045 23        inc     hl
8046 56        ld      d,(hl)
8047 23        inc     hl
8048 4e        ld      c,(hl)
8049 23        inc     hl
804a 46        ld      b,(hl)
804b 23        inc     hl
804c 78        ld      a,b
804d b7        or      a
804e c8        ret     z

804f 79        ld      a,c
8050 c35b80    jp      $805b
8053 3af689    ld      a,($89f6)
8056 b7        or      a
8057 c8        ret     z

8058 3af589    ld      a,($89f5)
805b 17        rla     
805c 9f        sbc     a,a
805d b7        or      a
805e 37        scf     
805f c0        ret     nz

8060 c601      add     a,$01
8062 c9        ret     

8063 7c        ld      a,h
8064 2f        cpl     
8065 47        ld      b,a
8066 7d        ld      a,l
8067 2f        cpl     
8068 4f        ld      c,a
8069 03        inc     bc
806a 210000    ld      hl,$0000
806d 3e11      ld      a,$11
806f f5        push    af
8070 b7        or      a
8071 c37e80    jp      $807e
8074 f5        push    af
8075 e5        push    hl
8076 09        add     hl,bc
8077 d27d80    jp      nc,$807d
807a f1        pop     af
807b 37        scf     
807c 3ee1      ld      a,$e1
807e 7b        ld      a,e
807f 17        rla     
8080 5f        ld      e,a
8081 7a        ld      a,d
8082 17        rla     
8083 57        ld      d,a
8084 7d        ld      a,l
8085 17        rla     
8086 6f        ld      l,a
8087 7c        ld      a,h
8088 17        rla     
8089 67        ld      h,a
808a f1        pop     af
808b 3d        dec     a
808c c27480    jp      nz,$8074
808f 7c        ld      a,h
8090 b7        or      a
8091 1f        rra     
8092 67        ld      h,a
8093 7d        ld      a,l
8094 1f        rra     
8095 6f        ld      l,a
8096 c9        ret     

8097 0600      ld      b,$00
8099 d608      sub     $08
809b daa680    jp      c,$80a6
809e 43        ld      b,e
809f 5a        ld      e,d
80a0 51        ld      d,c
80a1 0e00      ld      c,$00
80a3 c39980    jp      $8099
80a6 c609      add     a,$09
80a8 6f        ld      l,a
80a9 af        xor     a
80aa 2d        dec     l
80ab c8        ret     z

80ac 79        ld      a,c
80ad 1f        rra     
80ae 4f        ld      c,a
80af 7a        ld      a,d
80b0 1f        rra     
80b1 57        ld      d,a
80b2 7b        ld      a,e
80b3 1f        rra     
80b4 5f        ld      e,a
80b5 78        ld      a,b
80b6 1f        rra     
80b7 47        ld      b,a
80b8 c3a980    jp      $80a9
80bb eb        ex      de,hl
80bc 60        ld      h,b
80bd 69        ld      l,c
80be 4e        ld      c,(hl)
80bf 23        inc     hl
80c0 46        ld      b,(hl)
80c1 23        inc     hl
80c2 eb        ex      de,hl
80c3 71        ld      (hl),c
80c4 23        inc     hl
80c5 70        ld      (hl),b
80c6 23        inc     hl
80c7 eb        ex      de,hl
80c8 3d        dec     a
80c9 c2be80    jp      nz,$80be
80cc c9        ret     

80cd 328a89    ld      ($898a),a
80d0 22dc89    ld      ($89dc),hl
80d3 eb        ex      de,hl
80d4 22de89    ld      ($89de),hl
80d7 60        ld      h,b
80d8 69        ld      l,c
80d9 228b89    ld      ($898b),hl
80dc af        xor     a
80dd 328d89    ld      ($898d),a
80e0 c9        ret     

80e1 e5        push    hl
80e2 d5        push    de
80e3 3a8d89    ld      a,($898d)
80e6 fe02      cp      $02
80e8 d2f680    jp      nc,$80f6
80eb 21dc89    ld      hl,$89dc
80ee 87        add     a,a
80ef 5f        ld      e,a
80f0 1600      ld      d,$00
80f2 19        add     hl,de
80f3 c30a81    jp      $810a
80f6 f5        push    af
80f7 3a8a89    ld      a,($898a)
80fa fe04      cp      $04
80fc 2a8b89    ld      hl,($898b)
80ff da0f81    jp      c,$810f
8102 f1        pop     af
8103 d602      sub     $02
8105 87        add     a,a
8106 5f        ld      e,a
8107 1600      ld      d,$00
8109 19        add     hl,de
810a 7e        ld      a,(hl)
810b 23        inc     hl
810c 66        ld      h,(hl)
810d 6f        ld      l,a
810e f5        push    af
810f f1        pop     af
8110 3a8d89    ld      a,($898d)
8113 3c        inc     a
8114 328d89    ld      ($898d),a
8117 57        ld      d,a
8118 3a8a89    ld      a,($898a)
811b ba        cp      d
811c d1        pop     de
811d d22281    jp      nc,$8122
8120 e1        pop     hl
8121 c9        ret     

8122 e3        ex      (sp),hl
8123 e1        pop     hl
8124 c9        ret     

8125 e1        pop     hl
8126 7e        ld      a,(hl)
8127 23        inc     hl
8128 e5        push    hl
8129 b7        or      a
812a 17        rla     
812b f5        push    af
812c 4f        ld      c,a
812d 0600      ld      b,$00
812f 217781    ld      hl,$8177
8132 09        add     hl,bc
8133 5e        ld      e,(hl)
8134 23        inc     hl
8135 56        ld      d,(hl)
8136 eb        ex      de,hl
8137 222c89    ld      ($892c),hl
813a 212889    ld      hl,$8928
813d 360d      ld      (hl),$0d
813f 23        inc     hl
8140 360a      ld      (hl),$0a
8142 23        inc     hl
8143 362a      ld      (hl),$2a
8145 23        inc     hl
8146 362a      ld      (hl),$2a
8148 23        inc     hl
8149 23        inc     hl
814a 23        inc     hl
814b 362a      ld      (hl),$2a
814d 23        inc     hl
814e 362a      ld      (hl),$2a
8150 23        inc     hl
8151 360d      ld      (hl),$0d
8153 23        inc     hl
8154 360a      ld      (hl),$0a
8156 212889    ld      hl,$8928
8159 060a      ld      b,$0a
815b c5        push    bc
815c 7e        ld      a,(hl)
815d cd3e82    call    $823e
8160 c1        pop     bc
8161 05        dec     b
8162 23        inc     hl
8163 c25b81    jp      nz,$815b
8166 3abd81    ld      a,($81bd)
8169 3c        inc     a
816a 32bd81    ld      ($81bd),a
816d fe14      cp      $14
816f d22882    jp      nc,$8228
8172 f1        pop     af
8173 d0        ret     nc

8174 c32882    jp      $8228
8177 49        ld      c,c
8178 44        ld      b,h
8179 46        ld      b,(hl)
817a 304d      jr      nc,$81c9
817c 50        ld      d,b
817d 49        ld      c,c
817e 52        ld      d,d
817f 46        ld      b,(hl)
8180 57        ld      d,a
8181 49        ld      c,c
8182 54        ld      d,h
8183 45        ld      b,l
8184 58        ld      e,b
8185 44        ld      b,h
8186 4f        ld      c,a
8187 4d        ld      c,l
8188 4c        ld      c,h
8189 44        ld      b,h
818a 5a        ld      e,d
818b 4c        ld      c,h
818c 47        ld      b,a
818d 53        ld      d,e
818e 51        ld      d,c
818f 49        ld      c,c
8190 42        ld      b,d
8191 54        ld      d,h
8192 4c        ld      c,h
8193 4f        ld      c,a
8194 42        ld      b,d
8195 44        ld      b,h
8196 45        ld      b,l
8197 49        ld      c,c
8198 53        ld      d,e
8199 42        ld      b,d
819a 45        ld      b,l
819b 49        ld      c,c
819c 4e        ld      c,(hl)
819d 4f        ld      c,a
819e 56        ld      d,(hl)
819f 43        ld      b,e
81a0 4e        ld      c,(hl)
81a1 47        ld      b,a
81a2 4c        ld      c,h
81a3 47        ld      b,a
81a4 53        ld      d,e
81a5 53        ld      d,e
81a6 4e        ld      c,(hl)
81a7 41        ld      b,c
81a8 32494f    ld      ($4f49),a
81ab 44        ld      b,h
81ac 54        ld      d,h
81ad 42        ld      b,d
81ae 49        ld      c,c
81af 52        ld      d,d
81b0 43        ld      b,e
81b1 45        ld      b,l
81b2 46        ld      b,(hl)
81b3 a8        xor     b
81b4 e3        ex      (sp),hl
81b5 a9        xor     c
81b6 a0        and     b
81b7 c1        pop     bc
81b8 d6d4      sub     $d4
81ba c5        push    bc
81bb cb00      rlc     b
81bd 00        nop     
81be fdb9      cp      c
81c0 3a0001    ld      a,($0100)
81c3 fec3      cp      $c3
81c5 cace81    jp      z,$81ce
81c8 2a0801    ld      hl,($0108)
81cb 22be81    ld      ($81be),hl
81ce 2a0600    ld      hl,($0006)
81d1 2b        dec     hl
81d2 f9        ld      sp,hl
81d3 c5        push    bc
81d4 21da81    ld      hl,$81da
81d7 223289    ld      ($8932),hl
81da c9        ret     

81db 21ed81    ld      hl,$81ed
81de 7e        ld      a,(hl)
81df a7        and     a
81e0 c8        ret     z

81e1 e5        push    hl
81e2 5f        ld      e,a
81e3 0e02      ld      c,$02
81e5 cd0500    call    $0005
81e8 e1        pop     hl
81e9 23        inc     hl
81ea c3de81    jp      $81de
81ed 0d        dec     c
81ee 0a        ld      a,(bc)
81ef 41        ld      b,c
81f0 50        ld      d,b
81f1 55        ld      d,l
81f2 4c        ld      c,h
81f3 49        ld      c,c
81f4 42        ld      b,d
81f5 2056      jr      nz,$824d
81f7 65        ld      h,l
81f8 72        ld      (hl),d
81f9 73        ld      (hl),e
81fa 69        ld      l,c
81fb 6f        ld      l,a
81fc 6e        ld      l,(hl)
81fd 2031      jr      nz,$8230
81ff 2e35      ld      l,$35
8201 33        inc     sp
8202 4e        ld      c,(hl)
8203 0d        dec     c
8204 0a        ld      a,(bc)
8205 43        ld      b,e
8206 6f        ld      l,a
8207 70        ld      (hl),b
8208 79        ld      a,c
8209 72        ld      (hl),d
820a 69        ld      l,c
820b 67        ld      h,a
820c 68        ld      l,b
820d 74        ld      (hl),h
820e 2031      jr      nz,$8241
8210 39        add     hl,sp
8211 37        scf     
8212 39        add     hl,sp
8213 2028      jr      nz,$823d
8215 63        ld      h,e
8216 29        add     hl,hl
8217 2042      jr      nz,$825b
8219 79        ld      a,c
821a 2041      jr      nz,$825d
821c 56        ld      d,(hl)
821d 54        ld      d,h
821e 45        ld      b,l
821f 4b        ld      c,e
8220 2049      jr      nz,$826b
8222 6e        ld      l,(hl)
8223 63        ld      h,e
8224 2e0d      ld      l,$0d
8226 0a        ld      a,(bc)
8227 00        nop     
8228 213082    ld      hl,$8230
822b e5        push    hl
822c 2a3289    ld      hl,($8932)
822f e9        jp      (hl)
8230 3e0d      ld      a,$0d
8232 cd3e82    call    $823e
8235 3e0a      ld      a,$0a
8237 cd3e82    call    $823e
823a c30000    jp      $0000
823d c9        ret     

823e c5        push    bc
823f d5        push    de
8240 e5        push    hl
8241 f5        push    af
8242 0e02      ld      c,$02
8244 5f        ld      e,a
8245 cd0500    call    $0005
8248 f1        pop     af
8249 e1        pop     hl
824a d1        pop     de
824b c1        pop     bc
824c c9        ret     

824d e5        push    hl
824e 2a8889    ld      hl,($8988)
8251 7e        ld      a,(hl)
8252 fe0a      cp      $0a
8254 cc5e82    call    z,$825e
8257 23        inc     hl
8258 7e        ld      a,(hl)
8259 228889    ld      ($8988),hl
825c e1        pop     hl
825d c9        ret     

825e c5        push    bc
825f d5        push    de
8260 0e0a      ld      c,$0a
8262 113489    ld      de,$8934
8265 cd0500    call    $0005
8268 213589    ld      hl,$8935
826b 5e        ld      e,(hl)
826c 1600      ld      d,$00
826e eb        ex      de,hl
826f 19        add     hl,de
8270 23        inc     hl
8271 360d      ld      (hl),$0d
8273 23        inc     hl
8274 3e0a      ld      a,$0a
8276 cd3e82    call    $823e
8279 77        ld      (hl),a
827a eb        ex      de,hl
827b d1        pop     de
827c c1        pop     bc
827d c9        ret     

827e 84        add     a,h
827f 00        nop     
8280 80        add     a,b
8281 00        nop     
8282 00        nop     
8283 00        nop     
8284 010700    ld      bc,$0007
8287 00        nop     
8288 00        nop     
8289 010000    ld      bc,$0000
828c 010000    ld      bc,$0000
828f 00        nop     
8290 00        nop     
8291 00        nop     
8292 00        nop     
8293 00        nop     
8294 00        nop     
8295 00        nop     
8296 00        nop     
8297 00        nop     
8298 00        nop     
8299 00        nop     
829a 00        nop     
829b 00        nop     
829c 95        sub     l
829d 82        add     a,d
829e 00        nop     
829f ff        rst     $38
82a0 00        nop     
82a1 00        nop     
82a2 00        nop     
82a3 00        nop     
82a4 00        nop     
82a5 00        nop     
82a6 00        nop     
82a7 8d        adc     a,l
82a8 97        sub     a
82a9 8b        adc     a,e
82aa 97        sub     a
82ab 00        nop     
82ac ff        rst     $38
82ad 00        nop     
82ae 00        nop     
82af 00        nop     
82b0 00        nop     
82b1 00        nop     
82b2 00        nop     
82b3 00        nop     
82b4 bd        cp      l
82b5 82        add     a,d
82b6 00        nop     
82b7 ad        xor     l
82b8 99        sbc     a,c
82b9 70        ld      (hl),b
82ba 83        add     a,e
82bb a0        and     b
82bc 310000    ld      sp,$0000
82bf 00        nop     
82c0 00        nop     
82c1 010001    ld      bc,$0100
82c4 00        nop     
82c5 00        nop     
82c6 00        nop     
82c7 00        nop     
82c8 ff        rst     $38
82c9 ad        xor     l
82ca 99        sbc     a,c
82cb 00        nop     
82cc ff        rst     $38
82cd 00        nop     
82ce 00        nop     
82cf 00        nop     
82d0 00        nop     
82d1 00        nop     
82d2 00        nop     
82d3 00        nop     
82d4 48        ld      c,b
82d5 27        daa     
82d6 f9        ld      sp,hl
82d7 3600      ld      (hl),$00
82d9 ff        rst     $38
82da 00        nop     
82db 00        nop     
82dc 00        nop     
82dd 00        nop     
82de 00        nop     
82df 00        nop     
82e0 00        nop     
82e1 70        ld      (hl),b
82e2 83        add     a,e
82e3 00        nop     
82e4 ff        rst     $38
82e5 00        nop     
82e6 00        nop     
82e7 00        nop     
82e8 00        nop     
82e9 00        nop     
82ea 00        nop     
82eb 00        nop     
82ec 50        ld      d,b
82ed 27        daa     
82ee f9        ld      sp,hl
82ef 3600      ld      (hl),$00
82f1 00        nop     
82f2 00        nop     
82f3 00        nop     
82f4 00        nop     
82f5 00        nop     
82f6 00        nop     
82f7 00        nop     
82f8 00        nop     
82f9 00        nop     
82fa 00        nop     
82fb 00        nop     
82fc 00        nop     
82fd 00        nop     
82fe 00        nop     
82ff 00        nop     
8300 00        nop     
8301 00        nop     
8302 00        nop     
8303 00        nop     
8304 8d        adc     a,l
8305 97        sub     a
8306 9d        sbc     a,l
8307 97        sub     a
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
8313 00        nop     
8314 00        nop     
8315 00        nop     
8316 00        nop     
8317 00        nop     
8318 00        nop     
8319 00        nop     
831a 00        nop     
831b 00        nop     
831c 00        nop     
831d 00        nop     
831e f9        ld      sp,hl
831f 3600      ld      (hl),$00
8321 00        nop     
8322 00        nop     
8323 00        nop     
8324 00        nop     
8325 00        nop     
8326 ff        rst     $38
8327 00        nop     
8328 00        nop     
8329 00        nop     
832a 00        nop     
832b 00        nop     
832c 00        nop     
832d 00        nop     
832e 6e        ld      l,(hl)
832f 84        add     a,h
8330 14        inc     d
8331 39        add     hl,sp
8332 00        nop     
8333 00        nop     
8334 00        nop     
8335 00        nop     
8336 00        nop     
8337 00        nop     
8338 00        nop     
8339 00        nop     
833a 00        nop     
833b bd        cp      l
833c 82        add     a,d
833d 00        nop     
833e 00        nop     
833f 00        nop     
8340 00        nop     
8341 00        nop     
8342 00        nop     
8343 00        nop     
8344 00        nop     
8345 00        nop     
8346 00        nop     
8347 00        nop     
8348 00        nop     
8349 ff        rst     $38
834a 00        nop     
834b 00        nop     
834c 00        nop     
834d 00        nop     
834e 00        nop     
834f 00        nop     
8350 00        nop     
8351 93        sub     e
8352 97        sub     a
8353 8b        adc     a,e
8354 97        sub     a
8355 00        nop     
8356 210000    ld      hl,$0000
8359 00        nop     
835a 00        nop     
835b 00        nop     
835c 00        nop     
835d 00        nop     
835e 00        nop     
835f 00        nop     
8360 00        nop     
8361 00        nop     
8362 00        nop     
8363 00        nop     
8364 00        nop     
8365 00        nop     
8366 00        nop     
8367 00        nop     
8368 00        nop     
8369 00        nop     
836a 00        nop     
836b 00        nop     
836c 00        nop     
836d 00        nop     
836e 00        nop     
836f 00        nop     
8370 010000    ld      bc,$0000
8373 00        nop     
8374 00        nop     
8375 00        nop     
8376 00        nop     
8377 00        nop     
8378 00        nop     
8379 00        nop     
837a 00        nop     
837b 85        add     a,l
837c 82        add     a,d
837d 89        adc     a,c
837e 82        add     a,d
837f 00        nop     
8380 00        nop     
8381 00        nop     
8382 00        nop     
8383 ff        rst     $38
8384 00        nop     
8385 00        nop     
8386 00        nop     
8387 00        nop     
8388 00        nop     
8389 00        nop     
838a 00        nop     
838b 00        nop     
838c 00        nop     
838d 00        nop     
838e 00        nop     
838f 00        nop     
8390 00        nop     
8391 00        nop     
8392 00        nop     
8393 00        nop     
8394 00        nop     
8395 00        nop     
8396 00        nop     
8397 00        nop     
8398 00        nop     
8399 00        nop     
839a 00        nop     
839b 00        nop     
839c 00        nop     
839d 00        nop     
839e 00        nop     
839f 00        nop     
83a0 00        nop     
83a1 00        nop     
83a2 00        nop     
83a3 00        nop     
83a4 00        nop     
83a5 00        nop     
83a6 00        nop     
83a7 00        nop     
83a8 00        nop     
83a9 00        nop     
83aa 00        nop     
83ab 00        nop     
83ac 00        nop     
83ad 00        nop     
83ae 00        nop     
83af 00        nop     
83b0 00        nop     
83b1 00        nop     
83b2 00        nop     
83b3 00        nop     
83b4 00        nop     
83b5 00        nop     
83b6 00        nop     
83b7 00        nop     
83b8 00        nop     
83b9 00        nop     
83ba 00        nop     
83bb 00        nop     
83bc 00        nop     
83bd 00        nop     
83be 00        nop     
83bf 00        nop     
83c0 00        nop     
83c1 00        nop     
83c2 00        nop     
83c3 00        nop     
83c4 00        nop     
83c5 00        nop     
83c6 00        nop     
83c7 00        nop     
83c8 00        nop     
83c9 00        nop     
83ca 00        nop     
83cb 00        nop     
83cc 00        nop     
83cd 00        nop     
83ce 00        nop     
83cf 00        nop     
83d0 00        nop     
83d1 00        nop     
83d2 00        nop     
83d3 00        nop     
83d4 00        nop     
83d5 00        nop     
83d6 00        nop     
83d7 00        nop     
83d8 00        nop     
83d9 00        nop     
83da 00        nop     
83db 00        nop     
83dc 00        nop     
83dd 00        nop     
83de 00        nop     
83df 00        nop     
83e0 00        nop     
83e1 00        nop     
83e2 00        nop     
83e3 00        nop     
83e4 00        nop     
83e5 00        nop     
83e6 00        nop     
83e7 00        nop     
83e8 00        nop     
83e9 00        nop     
83ea 00        nop     
83eb 00        nop     
83ec 00        nop     
83ed 00        nop     
83ee 00        nop     
83ef 00        nop     
83f0 00        nop     
83f1 00        nop     
83f2 00        nop     
83f3 00        nop     
83f4 00        nop     
83f5 00        nop     
83f6 00        nop     
83f7 00        nop     
83f8 00        nop     
83f9 00        nop     
83fa 00        nop     
83fb 00        nop     
83fc 00        nop     
83fd 00        nop     
83fe 00        nop     
83ff 00        nop     
8400 00        nop     
8401 00        nop     
8402 00        nop     
8403 00        nop     
8404 00        nop     
8405 00        nop     
8406 00        nop     
8407 49        ld      c,c
8408 99        sbc     a,c
8409 75        ld      (hl),l
840a 97        sub     a
840b 00        nop     
840c 00        nop     
840d 00        nop     
840e 00        nop     
840f 0e84      ld      c,$84
8411 0b        dec     bc
8412 84        add     a,h
8413 00        nop     
8414 00        nop     
8415 49        ld      c,c
8416 99        sbc     a,c
8417 75        ld      (hl),l
8418 97        sub     a
8419 0e84      ld      c,$84
841b 0b        dec     bc
841c 84        add     a,h
841d 00        nop     
841e 00        nop     
841f 00        nop     
8420 04        inc     b
8421 02        ld      (bc),a
8422 00        nop     
8423 00        nop     
8424 00        nop     
8425 00        nop     
8426 ff        rst     $38
8427 00        nop     
8428 00        nop     
8429 00        nop     
842a 00        nop     
842b 00        nop     
842c 00        nop     
842d 00        nop     
842e 00        nop     
842f 00        nop     
8430 00        nop     
8431 00        nop     
8432 00        nop     
8433 00        nop     
8434 00        nop     
8435 00        nop     
8436 00        nop     
8437 00        nop     
8438 00        nop     
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
8446 00        nop     
8447 00        nop     
8448 00        nop     
8449 00        nop     
844a 00        nop     
844b 00        nop     
844c 00        nop     
844d 00        nop     
844e 00        nop     
844f 00        nop     
8450 00        nop     
8451 00        nop     
8452 00        nop     
8453 00        nop     
8454 00        nop     
8455 00        nop     
8456 00        nop     
8457 ff        rst     $38
8458 00        nop     
8459 00        nop     
845a 00        nop     
845b 00        nop     
845c 00        nop     
845d 00        nop     
845e 00        nop     
845f 0b        dec     bc
8460 84        add     a,h
8461 0c        inc     c
8462 84        add     a,h
8463 ff        rst     $38
8464 ff        rst     $38
8465 00        nop     
8466 2084      jr      nz,$83ec
8468 83        add     a,e
8469 84        add     a,h
846a 00        nop     
846b 00        nop     
846c 04        inc     b
846d 00        nop     
846e 02        ld      (bc),a
846f 00        nop     
8470 00        nop     
8471 00        nop     
8472 04        inc     b
8473 00        nop     
8474 00        nop     
8475 00        nop     
8476 00        nop     
8477 00        nop     
8478 00        nop     
8479 2184ff    ld      hl,$ff84
847c 228400    ld      ($0084),hl
847f 2084      jr      nz,$8405
8481 75        ld      (hl),l
8482 97        sub     a
8483 04        inc     b
8484 00        nop     
8485 00        nop     
8486 2084      jr      nz,$840c
8488 3e39      ld      a,$39
848a 218422    ld      hl,$2284
848d 84        add     a,h
848e 00        nop     
848f 00        nop     
8490 00        nop     
8491 00        nop     
8492 00        nop     
8493 00        nop     
8494 00        nop     
8495 00        nop     
8496 00        nop     
8497 00        nop     
8498 00        nop     
8499 00        nop     
849a 00        nop     
849b 00        nop     
849c 9b        sbc     a,e
849d 2c        inc     l
849e 00        nop     
849f 00        nop     
84a0 00        nop     
84a1 00        nop     
84a2 00        nop     
84a3 00        nop     
84a4 00        nop     
84a5 45        ld      b,l
84a6 4e        ld      c,(hl)
84a7 44        ld      b,h
84a8 00        nop     
84a9 00        nop     
84aa 00        nop     
84ab 00        nop     
84ac 212000    ld      hl,$0020
84af 2e00      ld      l,$00
84b1 00        nop     
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
84c8 00        nop     
84c9 00        nop     
84ca 00        nop     
84cb 00        nop     
84cc 00        nop     
84cd 00        nop     
84ce 00        nop     
84cf 00        nop     
84d0 00        nop     
84d1 00        nop     
84d2 49        ld      c,c
84d3 8f        adc     a,a
84d4 7a        ld      a,d
84d5 8d        adc     a,l
84d6 00        nop     
84d7 00        nop     
84d8 4d        ld      c,l
84d9 4f        ld      c,a
84da 56        ld      d,(hl)
84db 45        ld      b,l
84dc 2020      jr      nz,$84fe
84de 2020      jr      nz,$8500
84e0 00        nop     
84e1 00        nop     
84e2 0d        dec     c
84e3 00        nop     
84e4 08        ex      af,af'
84e5 41        ld      b,c
84e6 44        ld      b,h
84e7 4a        ld      c,d
84e8 55        ld      d,l
84e9 53        ld      d,e
84ea 54        ld      d,h
84eb 7c        ld      a,h
84ec 7c        ld      a,h
84ed 41        ld      b,c
84ee 55        ld      d,l
84ef 54        ld      d,h
84f0 4f        ld      c,a
84f1 53        ld      d,e
84f2 43        ld      b,e
84f3 41        ld      b,c
84f4 4c        ld      c,h
84f5 43        ld      b,e
84f6 48        ld      c,b
84f7 41        ld      b,c
84f8 52        ld      d,d
84f9 41        ld      b,c
84fa 43        ld      b,e
84fb 54        ld      d,h
84fc 45        ld      b,l
84fd 43        ld      b,e
84fe 4c        ld      c,h
84ff 49        ld      c,c
8500 50        ld      d,b
8501 50        ld      d,b
8502 49        ld      c,c
8503 4e        ld      c,(hl)
8504 47        ld      b,a
8505 43        ld      b,e
8506 4f        ld      c,a
8507 4c        ld      c,h
8508 4f        ld      c,a
8509 52        ld      d,d
850a 7c        ld      a,h
850b 7c        ld      a,h
850c 7c        ld      a,h
850d 45        ld      b,l
850e 43        ld      b,e
850f 48        ld      c,b
8510 4f        ld      c,a
8511 7c        ld      a,h
8512 7c        ld      a,h
8513 7c        ld      a,h
8514 7c        ld      a,h
8515 45        ld      b,l
8516 4d        ld      c,l
8517 50        ld      d,b
8518 48        ld      c,b
8519 41        ld      b,c
851a 53        ld      d,e
851b 49        ld      c,c
851c 53        ld      d,e
851d 4c        ld      c,h
851e 45        ld      b,l
851f 47        ld      b,a
8520 45        ld      b,l
8521 4e        ld      c,(hl)
8522 44        ld      b,h
8523 7c        ld      a,h
8524 7c        ld      a,h
8525 50        ld      d,b
8526 49        ld      c,c
8527 45        ld      b,l
8528 7c        ld      a,h
8529 7c        ld      a,h
852a 7c        ld      a,h
852b 7c        ld      a,h
852c 7c        ld      a,h
852d 53        ld      d,e
852e 48        ld      c,b
852f 41        ld      b,c
8530 44        ld      b,h
8531 45        ld      b,l
8532 7c        ld      a,h
8533 7c        ld      a,h
8534 7c        ld      a,h
8535 54        ld      d,h
8536 49        ld      c,c
8537 54        ld      d,h
8538 4c        ld      c,h
8539 45        ld      b,l
853a 7c        ld      a,h
853b 7c        ld      a,h
853c 7c        ld      a,h
853d 58        ld      e,b
853e 7c        ld      a,h
853f 7c        ld      a,h
8540 7c        ld      a,h
8541 7c        ld      a,h
8542 7c        ld      a,h
8543 7c        ld      a,h
8544 7c        ld      a,h
8545 59        ld      e,c
8546 7c        ld      a,h
8547 7c        ld      a,h
8548 7c        ld      a,h
8549 7c        ld      a,h
854a 7c        ld      a,h
854b 7c        ld      a,h
854c 7c        ld      a,h
854d 00        nop     
854e 00        nop     
854f 00        nop     
8550 00        nop     
8551 3d        dec     a
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
8576 0d        dec     c
8577 0a        ld      a,(bc)
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
8594 b1        or      c
8595 3b        dec     sp
8596 00        nop     
8597 81        add     a,c
8598 00        nop     
8599 00        nop     
859a 00        nop     
859b ff        rst     $38
859c 47        ld      b,a
859d 52        ld      d,d
859e 41        ld      b,c
859f 46        ld      b,(hl)
85a0 54        ld      d,h
85a1 41        ld      b,c
85a2 4c        ld      c,h
85a3 4b        ld      c,e
85a4 45        ld      b,l
85a5 52        ld      d,d
85a6 52        ld      d,d
85a7 41        ld      b,c
85a8 00        nop     
85a9 1c        inc     e
85aa 00        nop     
85ab 9b        sbc     a,e
85ac 0100bc    ld      bc,$bc00
85af 8e        adc     a,(hl)
85b0 2a2a20    ld      hl,($202a)
85b3 45        ld      b,l
85b4 52        ld      d,d
85b5 52        ld      d,d
85b6 4f        ld      c,a
85b7 52        ld      d,d
85b8 202a      jr      nz,$85e4
85ba 2a2024    ld      hl,($2420)
85bd 5e        ld      e,(hl)
85be 00        nop     
85bf 00        nop     
85c0 00        nop     
85c1 00        nop     
85c2 00        nop     
85c3 00        nop     
85c4 00        nop     
85c5 00        nop     
85c6 2e00      ld      l,$00
85c8 00        nop     
85c9 00        nop     
85ca 00        nop     
85cb 00        nop     
85cc 00        nop     
85cd 00        nop     
85ce 00        nop     
85cf 00        nop     
85d0 00        nop     
85d1 00        nop     
85d2 00        nop     
85d3 03        inc     bc
85d4 00        nop     
85d5 08        ex      af,af'
85d6 3a7c7c    ld      a,($7c7c)
85d9 7c        ld      a,h
85da 7c        ld      a,h
85db 7c        ld      a,h
85dc 7c        ld      a,h
85dd 7c        ld      a,h
85de 56        ld      d,(hl)
85df 53        ld      d,e
85e0 7c        ld      a,h
85e1 7c        ld      a,h
85e2 7c        ld      a,h
85e3 7c        ld      a,h
85e4 7c        ld      a,h
85e5 7c        ld      a,h
85e6 56        ld      d,(hl)
85e7 45        ld      b,l
85e8 52        ld      d,d
85e9 53        ld      d,e
85ea 55        ld      d,l
85eb 53        ld      d,e
85ec 7c        ld      a,h
85ed 7c        ld      a,h
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
8601 00        nop     
8602 00        nop     
8603 00        nop     
8604 00        nop     
8605 00        nop     
8606 23        inc     hl
8607 00        nop     
8608 00        nop     
8609 00        nop     
860a 00        nop     
860b 00        nop     
860c 00        nop     
860d 00        nop     
860e 00        nop     
860f 00        nop     
8610 00        nop     
8611 00        nop     
8612 00        nop     
8613 00        nop     
8614 00        nop     
8615 00        nop     
8616 00        nop     
8617 00        nop     
8618 00        nop     
8619 00        nop     
861a 00        nop     
861b 00        nop     
861c 00        nop     
861d 00        nop     
861e 00        nop     
861f 00        nop     
8620 00        nop     
8621 00        nop     
8622 00        nop     
8623 00        nop     
8624 00        nop     
8625 00        nop     
8626 00        nop     
8627 00        nop     
8628 00        nop     
8629 00        nop     
862a 00        nop     
862b 00        nop     
862c 23        inc     hl
862d 00        nop     
862e 00        nop     
862f 00        nop     
8630 00        nop     
8631 00        nop     
8632 00        nop     
8633 00        nop     
8634 00        nop     
8635 00        nop     
8636 00        nop     
8637 00        nop     
8638 00        nop     
8639 2020      jr      nz,$865b
863b 2024      jr      nz,$8661
863d 00        nop     
863e 00        nop     
863f 00        nop     
8640 00        nop     
8641 00        nop     
8642 00        nop     
8643 00        nop     
8644 00        nop     
8645 00        nop     
8646 00        nop     
8647 00        nop     
8648 00        nop     
8649 00        nop     
864a 00        nop     
864b 00        nop     
864c 00        nop     
864d 00        nop     
864e 00        nop     
864f 00        nop     
8650 00        nop     
8651 00        nop     
8652 2e00      ld      l,$00
8654 00        nop     
8655 00        nop     
8656 00        nop     
8657 00        nop     
8658 00        nop     
8659 00        nop     
865a 00        nop     
865b 00        nop     
865c 00        nop     
865d 00        nop     
865e 00        nop     
865f 00        nop     
8660 00        nop     
8661 00        nop     
8662 00        nop     
8663 00        nop     
8664 00        nop     
8665 00        nop     
8666 265c      ld      h,$5c
8668 205f      jr      nz,$86c9
866a 0d        dec     c
866b 0a        ld      a,(bc)
866c 7c        ld      a,h
866d 00        nop     
866e 00        nop     
866f 00        nop     
8670 00        nop     
8671 00        nop     
8672 00        nop     
8673 00        nop     
8674 00        nop     
8675 00        nop     
8676 00        nop     
8677 00        nop     
8678 08        ex      af,af'
8679 2008      jr      nz,$8683
867b 24        inc     h
867c 00        nop     
867d 00        nop     
867e 00        nop     
867f 00        nop     
8680 00        nop     
8681 00        nop     
8682 00        nop     
8683 00        nop     
8684 00        nop     
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
8690 00        nop     
8691 00        nop     
8692 00        nop     
8693 00        nop     
8694 00        nop     
8695 00        nop     
8696 00        nop     
8697 00        nop     
8698 00        nop     
8699 00        nop     
869a 2e30      ld      l,$30
869c 2039      jr      nz,$86d7
869e 45        ld      b,l
869f 00        nop     
86a0 00        nop     
86a1 00        nop     
86a2 00        nop     
86a3 00        nop     
86a4 00        nop     
86a5 00        nop     
86a6 00        nop     
86a7 00        nop     
86a8 00        nop     
86a9 00        nop     
86aa 00        nop     
86ab 00        nop     
86ac 00        nop     
86ad 00        nop     
86ae 00        nop     
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
86be 00        nop     
86bf 2084      jr      nz,$8645
86c1 2d        dec     l
86c2 00        nop     
86c3 00        nop     
86c4 00        nop     
86c5 00        nop     
86c6 00        nop     
86c7 00        nop     
86c8 00        nop     
86c9 00        nop     
86ca 00        nop     
86cb 00        nop     
86cc 00        nop     
86cd 00        nop     
86ce 00        nop     
86cf 00        nop     
86d0 2e45      ld      l,$45
86d2 2a0000    ld      hl,($0000)
86d5 00        nop     
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
86e1 00        nop     
86e2 00        nop     
86e3 00        nop     
86e4 00        nop     
86e5 00        nop     
86e6 00        nop     
86e7 00        nop     
86e8 00        nop     
86e9 00        nop     
86ea 00        nop     
86eb 00        nop     
86ec 00        nop     
86ed 00        nop     
86ee 00        nop     
86ef 00        nop     
86f0 00        nop     
86f1 00        nop     
86f2 00        nop     
86f3 00        nop     
86f4 00        nop     
86f5 00        nop     
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
870e 00        nop     
870f 00        nop     
8710 00        nop     
8711 00        nop     
8712 2b        dec     hl
8713 2d        dec     l
8714 0d        dec     c
8715 45        ld      b,l
8716 00        nop     
8717 00        nop     
8718 00        nop     
8719 00        nop     
871a 00        nop     
871b 00        nop     
871c 00        nop     
871d 200d      jr      nz,$872c
871f 2e30      ld      l,$30
8721 39        add     hl,sp
8722 cccc4c    call    z,$4ccc
8725 7d        ld      a,l
8726 00        nop     
8727 00        nop     
8728 00        nop     
8729 00        nop     
872a 00        nop     
872b 00        nop     
872c 00        nop     
872d 00        nop     
872e 00        nop     
872f 1b        dec     de
8730 00        nop     
8731 00        nop     
8732 00        nop     
8733 00        nop     
8734 00        nop     
8735 00        nop     
8736 00        nop     
8737 00        nop     
8738 00        nop     
8739 00        nop     
873a 00        nop     
873b 00        nop     
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
8746 00        nop     
8747 00        nop     
8748 00        nop     
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
8759 00        nop     
875a 00        nop     
875b 00        nop     
875c a1        and     c
875d 8e        adc     a,(hl)
875e a9        xor     c
875f 85        add     a,l
8760 1d        dec     e
8761 ff        rst     $38
8762 bc        cp      h
8763 8e        adc     a,(hl)
8764 00        nop     
8765 00        nop     
8766 00        nop     
8767 00        nop     
8768 00        nop     
8769 00        nop     
876a 00        nop     
876b 00        nop     
876c 00        nop     
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
877a 4d        ld      c,l
877b ac        xor     h
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
878d 00        nop     
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
8798 00        nop     
8799 00        nop     
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
87a6 00        nop     
87a7 00        nop     
87a8 00        nop     
87a9 00        nop     
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
87bb 00        nop     
87bc 00        nop     
87bd 00        nop     
87be 00        nop     
87bf 00        nop     
87c0 00        nop     
87c1 00        nop     
87c2 00        nop     
87c3 00        nop     
87c4 00        nop     
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
87d1 00        nop     
87d2 00        nop     
87d3 00        nop     
87d4 00        nop     
87d5 00        nop     
87d6 00        nop     
87d7 00        nop     
87d8 00        nop     
87d9 00        nop     
87da 00        nop     
87db 00        nop     
87dc 00        nop     
87dd 00        nop     
87de 00        nop     
87df 00        nop     
87e0 00        nop     
87e1 80        add     a,b
87e2 00        nop     
87e3 00        nop     
87e4 00        nop     
87e5 00        nop     
87e6 00        nop     
87e7 00        nop     
87e8 00        nop     
87e9 00        nop     
87ea 00        nop     
87eb 00        nop     
87ec 00        nop     
87ed 00        nop     
87ee 00        nop     
87ef 00        nop     
87f0 00        nop     
87f1 00        nop     
87f2 00        nop     
87f3 00        nop     
87f4 00        nop     
87f5 00        nop     
87f6 00        nop     
87f7 00        nop     
87f8 00        nop     
87f9 0100ff    ld      bc,$ff00
87fc 00        nop     
87fd 00        nop     
87fe 00        nop     
87ff 00        nop     
8800 00        nop     
8801 00        nop     
8802 00        nop     
8803 00        nop     
8804 00        nop     
8805 00        nop     
8806 00        nop     
8807 00        nop     
8808 00        nop     
8809 00        nop     
880a 00        nop     
880b 0100ff    ld      bc,$ff00
880e 17        rla     
880f b7        or      a
8810 51        ld      d,c
8811 73        ld      (hl),e
8812 00        nop     
8813 00        nop     
8814 00        nop     
8815 00        nop     
8816 00        nop     
8817 00        nop     
8818 00        nop     
8819 00        nop     
881a 00        nop     
881b 0100ff    ld      bc,$ff00
881e 00        nop     
881f 00        nop     
8820 00        nop     
8821 00        nop     
8822 00        nop     
8823 00        nop     
8824 00        nop     
8825 00        nop     
8826 00        nop     
8827 00        nop     
8828 00        nop     
8829 00        nop     
882a 00        nop     
882b 00        nop     
882c 00        nop     
882d 00        nop     
882e 00        nop     
882f 00        nop     
8830 00        nop     
8831 00        nop     
8832 00        nop     
8833 00        nop     
8834 00        nop     
8835 00        nop     
8836 00        nop     
8837 00        nop     
8838 00        nop     
8839 00        nop     
883a 00        nop     
883b 00        nop     
883c 00        nop     
883d 00        nop     
883e 00        nop     
883f 00        nop     
8840 00        nop     
8841 00        nop     
8842 00        nop     
8843 00        nop     
8844 00        nop     
8845 00        nop     
8846 00        nop     
8847 00        nop     
8848 00        nop     
8849 00        nop     
884a 00        nop     
884b 00        nop     
884c 00        nop     
884d 00        nop     
884e 00        nop     
884f 00        nop     
8850 00        nop     
8851 00        nop     
8852 00        nop     
8853 00        nop     
8854 00        nop     
8855 00        nop     
8856 00        nop     
8857 00        nop     
8858 00        nop     
8859 00        nop     
885a 00        nop     
885b 00        nop     
885c 00        nop     
885d 00        nop     
885e 00        nop     
885f 00        nop     
8860 00        nop     
8861 00        nop     
8862 00        nop     
8863 00        nop     
8864 00        nop     
8865 00        nop     
8866 00        nop     
8867 00        nop     
8868 00        nop     
8869 00        nop     
886a 00        nop     
886b 010200    ld      bc,$0002
886e 00        nop     
886f 00        nop     
8870 00        nop     
8871 00        nop     
8872 00        nop     
8873 bd        cp      l
8874 43        ld      b,e
8875 00        nop     
8876 3a0000    ld      a,($0000)
8879 af        xor     a
887a 8b        adc     a,e
887b 43        ld      b,e
887c b9        cp      c
887d 00        nop     
887e 00        nop     
887f 00        nop     
8880 03        inc     bc
8881 00        nop     
8882 03        inc     bc
8883 00        nop     
8884 00        nop     
8885 00        nop     
8886 00        nop     
8887 45        ld      b,l
8888 58        ld      e,b
8889 54        ld      d,h
888a 4d        ld      c,l
888b 45        ld      b,l
888c 4d        ld      c,l
888d 00        nop     
888e 2044      jr      nz,$88d4
8890 41        ld      b,c
8891 54        ld      d,h
8892 00        nop     
8893 00        nop     
8894 00        nop     
8895 00        nop     
8896 ff        rst     $38
8897 00        nop     
8898 00        nop     
8899 00        nop     
889a 00        nop     
889b 00        nop     
889c 00        nop     
889d 00        nop     
889e 00        nop     
889f 00        nop     
88a0 9c        sbc     a,h
88a1 85        add     a,l
88a2 b9        cp      c
88a3 43        ld      b,e
88a4 c1        pop     bc
88a5 43        ld      b,e
88a6 00        nop     
88a7 29        add     hl,hl
88a8 00        nop     
88a9 00        nop     
88aa 00        nop     
88ab 00        nop     
88ac 00        nop     
88ad 00        nop     
88ae 00        nop     
88af 00        nop     
88b0 00        nop     
88b1 00        nop     
88b2 00        nop     
88b3 56        ld      d,(hl)
88b4 6e        ld      l,(hl)
88b5 5a        ld      e,d
88b6 6e        ld      l,(hl)
88b7 00        nop     
88b8 00        nop     
88b9 00        nop     
88ba 00        nop     
88bb 00        nop     
88bc 00        nop     
88bd 00        nop     
88be 00        nop     
88bf 00        nop     
88c0 00        nop     
88c1 00        nop     
88c2 00        nop     
88c3 00        nop     
88c4 00        nop     
88c5 00        nop     
88c6 00        nop     
88c7 00        nop     
88c8 00        nop     
88c9 00        nop     
88ca 00        nop     
88cb 00        nop     
88cc 00        nop     
88cd 00        nop     
88ce 00        nop     
88cf 00        nop     
88d0 ff        rst     $38
88d1 00        nop     
88d2 00        nop     
88d3 ff        rst     $38
88d4 00        nop     
88d5 00        nop     
88d6 00        nop     
88d7 00        nop     
88d8 ff        rst     $38
88d9 00        nop     
88da 00        nop     
88db 00        nop     
88dc 00        nop     
88dd 00        nop     
88de 00        nop     
88df b1        or      c
88e0 8b        adc     a,e
88e1 b9        cp      c
88e2 43        ld      b,e
88e3 c1        pop     bc
88e4 43        ld      b,e
88e5 00        nop     
88e6 00        nop     
88e7 00        nop     
88e8 ff        rst     $38
88e9 00        nop     
88ea 00        nop     
88eb 00        nop     
88ec 00        nop     
88ed 00        nop     
88ee 00        nop     
88ef 00        nop     
88f0 00        nop     
88f1 00        nop     
88f2 00        nop     
88f3 00        nop     
88f4 00        nop     
88f5 00        nop     
88f6 00        nop     
88f7 00        nop     
88f8 00        nop     
88f9 00        nop     
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
8908 00        nop     
8909 00        nop     
890a 00        nop     
890b 00        nop     
890c 00        nop     
890d 00        nop     
890e 00        nop     
890f 00        nop     
8910 00        nop     
8911 00        nop     
8912 00        nop     
8913 00        nop     
8914 00        nop     
8915 00        nop     
8916 00        nop     
8917 00        nop     
8918 00        nop     
8919 b1        or      c
891a 3b        dec     sp
891b a7        and     a
891c 85        add     a,l
891d 00        nop     
891e 00        nop     
891f 00        nop     
8920 00        nop     
8921 00        nop     
8922 00        nop     
8923 00        nop     
8924 00        nop     
8925 00        nop     
8926 b1        or      c
8927 3b        dec     sp
8928 00        nop     
8929 00        nop     
892a 00        nop     
892b 00        nop     
892c 00        nop     
892d 00        nop     
892e 00        nop     
892f 00        nop     
8930 00        nop     
8931 00        nop     
8932 db6a      in      a,($6a)
8934 50        ld      d,b
8935 00        nop     
8936 0a        ld      a,(bc)
8937 00        nop     
8938 00        nop     
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
8948 00        nop     
8949 00        nop     
894a 00        nop     
894b 00        nop     
894c 00        nop     
894d 00        nop     
894e 00        nop     
894f 00        nop     
8950 00        nop     
8951 00        nop     
8952 00        nop     
8953 00        nop     
8954 00        nop     
8955 00        nop     
8956 00        nop     
8957 00        nop     
8958 00        nop     
8959 00        nop     
895a 00        nop     
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
896e 00        nop     
896f 00        nop     
8970 00        nop     
8971 00        nop     
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
8988 3689      ld      (hl),$89
898a 02        ld      (bc),a
898b 03        inc     bc
898c 00        nop     
898d 03        inc     bc
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
89a3 00        nop     
89a4 00        nop     
89a5 00        nop     
89a6 00        nop     
89a7 00        nop     
89a8 00        nop     
89a9 00        nop     
89aa 00        nop     
89ab 00        nop     
89ac 00        nop     
89ad 00        nop     
89ae 00        nop     
89af 00        nop     
89b0 00        nop     
89b1 00        nop     
89b2 00        nop     
89b3 00        nop     
89b4 00        nop     
89b5 00        nop     
89b6 00        nop     
89b7 00        nop     
89b8 00        nop     
89b9 00        nop     
89ba 00        nop     
89bb 00        nop     
89bc 00        nop     
89bd 00        nop     
89be 00        nop     
89bf 00        nop     
89c0 00        nop     
89c1 00        nop     
89c2 00        nop     
89c3 00        nop     
89c4 00        nop     
89c5 00        nop     
89c6 00        nop     
89c7 00        nop     
89c8 00        nop     
89c9 00        nop     
89ca 00        nop     
89cb 00        nop     
89cc 00        nop     
89cd 00        nop     
89ce 00        nop     
89cf 00        nop     
89d0 00        nop     
89d1 00        nop     
89d2 00        nop     
89d3 00        nop     
89d4 00        nop     
89d5 00        nop     
89d6 00        nop     
89d7 00        nop     
89d8 00        nop     
89d9 00        nop     
89da 00        nop     
89db 00        nop     
89dc 82        add     a,d
89dd 88        adc     a,b
89de d0        ret     nc

89df 6d        ld      l,l
89e0 00        nop     
89e1 00        nop     
89e2 00        nop     
89e3 00        nop     
89e4 00        nop     
89e5 00        nop     
89e6 00        nop     
89e7 00        nop     
89e8 00        nop     
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
89f4 00        nop     
89f5 00        nop     
89f6 00        nop     
89f7 00        nop     
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
8a05 00        nop     
8a06 00        nop     
8a07 00        nop     
8a08 00        nop     
8a09 00        nop     
8a0a 00        nop     
8a0b 00        nop     
8a0c 00        nop     
8a0d 00        nop     
8a0e 00        nop     
8a0f 00        nop     
8a10 00        nop     
8a11 00        nop     
8a12 00        nop     
8a13 00        nop     
8a14 00        nop     
8a15 00        nop     
8a16 00        nop     
8a17 00        nop     
8a18 00        nop     
8a19 00        nop     
8a1a 00        nop     
8a1b 00        nop     
8a1c 00        nop     
8a1d 00        nop     
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
8a28 00        nop     
8a29 00        nop     
8a2a 00        nop     
8a2b 00        nop     
8a2c 00        nop     
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
8a7e 00        nop     
8a7f 00        nop     
8a80 00        nop     
8a81 00        nop     
8a82 00        nop     
8a83 00        nop     
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
8ab7 01080a    ld      bc,$0a08
8aba d7        rst     $10
8abb 23        inc     hl
8abc 79        ld      a,c
8abd 01fe00    ld      bc,$00fe
8ac0 00        nop     
8ac1 04        inc     b
8ac2 fb        ei      
8ac3 00        nop     
8ac4 00        nop     
8ac5 04        inc     b
8ac6 fe01      cp      $01
8ac8 fe01      cp      $01
8aca fc0000    call    m,$0000
8acd 03        inc     bc
8ace fe00      cp      $00
8ad0 00        nop     
8ad1 01f800    ld      bc,$00f8
8ad4 00        nop     
8ad5 01fe07    ld      bc,$07fe
8ad8 f9        ld      sp,hl
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
8ae8 00        nop     
8ae9 00        nop     
8aea 00        nop     
8aeb 00        nop     
8aec 81        add     a,c
8aed 00        nop     
8aee 00        nop     
8aef 00        nop     
8af0 00        nop     
8af1 00        nop     
8af2 00        nop     
8af3 00        nop     
8af4 81        add     a,c
8af5 00        nop     
8af6 00        nop     
8af7 00        nop     
8af8 00        nop     
8af9 00        nop     
8afa 00        nop     
8afb 00        nop     
8afc 81        add     a,c
8afd 00        nop     
8afe 00        nop     
8aff 00        nop     
8b00 00        nop     
8b01 00        nop     
8b02 00        nop     
8b03 00        nop     
8b04 81        add     a,c
8b05 00        nop     
8b06 00        nop     
8b07 00        nop     
8b08 00        nop     
8b09 00        nop     
8b0a 00        nop     
8b0b 00        nop     
8b0c 81        add     a,c
8b0d 00        nop     
8b0e 00        nop     
8b0f 00        nop     
8b10 00        nop     
8b11 00        nop     
8b12 00        nop     
8b13 00        nop     
8b14 81        add     a,c
8b15 00        nop     
8b16 00        nop     
8b17 00        nop     
8b18 00        nop     
8b19 00        nop     
8b1a 00        nop     
8b1b 00        nop     
8b1c 81        add     a,c
8b1d 00        nop     
8b1e 00        nop     
8b1f 00        nop     
8b20 00        nop     
8b21 00        nop     
8b22 00        nop     
8b23 00        nop     
8b24 81        add     a,c
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
8b48 81        add     a,c
8b49 00        nop     
8b4a 00        nop     
8b4b 00        nop     
8b4c 81        add     a,c
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
8b5f 24        inc     h
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
8b75 010000    ld      bc,$0000
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
8b85 02        ld      (bc),a
8b86 fa0000    jp      m,$0000
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
8b94 08        ex      af,af'
8b95 00        nop     
8b96 00        nop     
8b97 fdb9      cp      c
8b99 00        nop     
8b9a 00        nop     
8b9b 00        nop     
8b9c 00        nop     
8b9d 00        nop     
8b9e 00        nop     
8b9f 00        nop     
8ba0 ff        rst     $38
8ba1 00        nop     
8ba2 00        nop     
8ba3 00        nop     
8ba4 00        nop     
8ba5 00        nop     
8ba6 00        nop     
8ba7 00        nop     
8ba8 00        nop     
8ba9 00        nop     
8baa 00        nop     
8bab 00        nop     
8bac 00        nop     
8bad 00        nop     
8bae 00        nop     
8baf 43        ld      b,e
8bb0 b9        cp      c
8bb1 00        nop     
8bb2 47        ld      b,a
8bb3 52        ld      d,d
8bb4 41        ld      b,c
8bb5 46        ld      b,(hl)
8bb6 54        ld      d,h
8bb7 41        ld      b,c
8bb8 4c        ld      c,h
8bb9 4b        ld      c,e
8bba 45        ld      b,l
8bbb 52        ld      d,d
8bbc 52        ld      d,d
8bbd 00        nop     
8bbe 00        nop     
8bbf 00        nop     
8bc0 80        add     a,b
8bc1 010203    ld      bc,$0302
8bc4 04        inc     b
8bc5 05        dec     b
8bc6 0607      ld      b,$07
8bc8 08        ex      af,af'
8bc9 09        add     hl,bc
8bca 0a        ld      a,(bc)
8bcb 0b        dec     bc
8bcc 0c        inc     c
8bcd 0d        dec     c
8bce 0e0f      ld      c,$0f
8bd0 1003      djnz    $8bd5
8bd2 03        inc     bc
8bd3 00        nop     
8bd4 00        nop     
8bd5 04        inc     b
8bd6 00        nop     
8bd7 b7        or      a
8bd8 010000    ld      bc,$0000
8bdb 00        nop     
8bdc 00        nop     
8bdd 80        add     a,b
8bde 010036    ld      bc,$3600
8be1 00        nop     
8be2 00        nop     
8be3 00        nop     
8be4 80        add     a,b
8be5 00        nop     
8be6 01007d    ld      bc,$7d00
8be9 b9        cp      c
8bea 07        rlca    
8beb 00        nop     
8bec 00        nop     
8bed 00        nop     
8bee 00        nop     
8bef 00        nop     
8bf0 00        nop     
8bf1 00        nop     
8bf2 00        nop     
8bf3 00        nop     
8bf4 00        nop     
8bf5 00        nop     
8bf6 00        nop     
8bf7 00        nop     
8bf8 00        nop     
8bf9 00        nop     
8bfa 00        nop     
8bfb 00        nop     
8bfc 00        nop     
8bfd 00        nop     
8bfe 00        nop     
8bff 00        nop     
8c00 00        nop     
8c01 00        nop     
8c02 00        nop     
8c03 00        nop     
8c04 00        nop     
8c05 00        nop     
8c06 00        nop     
8c07 00        nop     
8c08 00        nop     
8c09 00        nop     
8c0a 00        nop     
8c0b 00        nop     
8c0c 00        nop     
8c0d 00        nop     
8c0e 00        nop     
8c0f 00        nop     
8c10 00        nop     
8c11 00        nop     
8c12 00        nop     
8c13 00        nop     
8c14 00        nop     
8c15 00        nop     
8c16 00        nop     
8c17 00        nop     
8c18 00        nop     
8c19 00        nop     
8c1a 00        nop     
8c1b 00        nop     
8c1c 00        nop     
8c1d 00        nop     
8c1e 00        nop     
8c1f 00        nop     
8c20 00        nop     
8c21 00        nop     
8c22 00        nop     
8c23 00        nop     
8c24 00        nop     
8c25 00        nop     
8c26 00        nop     
8c27 00        nop     
8c28 00        nop     
8c29 00        nop     
8c2a 00        nop     
8c2b 00        nop     
8c2c 00        nop     
8c2d 00        nop     
8c2e 00        nop     
8c2f 00        nop     
8c30 00        nop     
8c31 00        nop     
8c32 00        nop     
8c33 00        nop     
8c34 00        nop     
8c35 00        nop     
8c36 00        nop     
8c37 00        nop     
8c38 00        nop     
8c39 00        nop     
8c3a 00        nop     
8c3b 00        nop     
8c3c 00        nop     
8c3d 00        nop     
8c3e 00        nop     
8c3f 00        nop     
8c40 00        nop     
8c41 00        nop     
8c42 00        nop     
8c43 00        nop     
8c44 00        nop     
8c45 00        nop     
8c46 00        nop     
8c47 00        nop     
8c48 00        nop     
8c49 00        nop     
8c4a 00        nop     
8c4b 00        nop     
8c4c 00        nop     
8c4d 00        nop     
8c4e 00        nop     
8c4f 00        nop     
8c50 00        nop     
8c51 00        nop     
8c52 00        nop     
8c53 00        nop     
8c54 00        nop     
8c55 00        nop     
8c56 00        nop     
8c57 00        nop     
8c58 00        nop     
8c59 00        nop     
8c5a 00        nop     
8c5b 00        nop     
8c5c 00        nop     
8c5d 00        nop     
8c5e 00        nop     
8c5f 00        nop     
8c60 00        nop     
8c61 00        nop     
8c62 00        nop     
8c63 00        nop     
8c64 00        nop     
8c65 00        nop     
8c66 00        nop     
8c67 00        nop     
8c68 00        nop     
8c69 00        nop     
8c6a 00        nop     
8c6b 00        nop     
8c6c 00        nop     
8c6d 00        nop     
8c6e 00        nop     
8c6f 00        nop     
8c70 00        nop     
8c71 00        nop     
8c72 00        nop     
8c73 00        nop     
8c74 00        nop     
8c75 00        nop     
8c76 00        nop     
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
8c82 00        nop     
8c83 00        nop     
8c84 00        nop     
8c85 00        nop     
8c86 00        nop     
8c87 00        nop     
8c88 00        nop     
8c89 00        nop     
8c8a 00        nop     
8c8b 00        nop     
8c8c 00        nop     
8c8d 00        nop     
8c8e 00        nop     
8c8f 00        nop     
8c90 00        nop     
8c91 00        nop     
8c92 00        nop     
8c93 00        nop     
8c94 00        nop     
8c95 00        nop     
8c96 00        nop     
8c97 00        nop     
8c98 00        nop     
8c99 00        nop     
8c9a 00        nop     
8c9b 00        nop     
8c9c 08        ex      af,af'
8c9d 0c        inc     c
8c9e 0b        dec     bc
8c9f 0a        ld      a,(bc)
8ca0 2000      jr      nz,$8ca2
8ca2 00        nop     
8ca3 00        nop     
8ca4 00        nop     
8ca5 00        nop     
8ca6 00        nop     
8ca7 00        nop     
8ca8 00        nop     
8ca9 00        nop     
8caa 00        nop     
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
8cc0 00        nop     
8cc1 00        nop     
8cc2 00        nop     
8cc3 00        nop     
8cc4 00        nop     
8cc5 00        nop     
8cc6 00        nop     
8cc7 00        nop     
8cc8 00        nop     
8cc9 00        nop     
8cca 00        nop     
8ccb 00        nop     
8ccc 00        nop     
8ccd 00        nop     
8cce 00        nop     
8ccf 00        nop     
8cd0 00        nop     
8cd1 00        nop     
8cd2 00        nop     
8cd3 00        nop     
8cd4 00        nop     
8cd5 00        nop     
8cd6 00        nop     
8cd7 00        nop     
8cd8 00        nop     
8cd9 00        nop     
8cda 00        nop     
8cdb 00        nop     
8cdc 00        nop     
8cdd 00        nop     
8cde 00        nop     
8cdf 00        nop     
8ce0 00        nop     
8ce1 00        nop     
8ce2 00        nop     
8ce3 00        nop     
8ce4 00        nop     
8ce5 00        nop     
8ce6 00        nop     
8ce7 00        nop     
8ce8 00        nop     
8ce9 00        nop     
8cea 00        nop     
8ceb 00        nop     
8cec 00        nop     
8ced 00        nop     
8cee 00        nop     
8cef 00        nop     
8cf0 00        nop     
8cf1 00        nop     
8cf2 00        nop     
8cf3 00        nop     
8cf4 00        nop     
8cf5 00        nop     
8cf6 00        nop     
8cf7 00        nop     
8cf8 00        nop     
8cf9 00        nop     
8cfa 00        nop     
8cfb 00        nop     
8cfc 00        nop     
8cfd 00        nop     
8cfe 00        nop     
8cff 00        nop     
8d00 00        nop     
8d01 00        nop     
8d02 00        nop     
8d03 00        nop     
8d04 00        nop     
8d05 00        nop     
8d06 00        nop     
8d07 00        nop     
8d08 00        nop     
8d09 00        nop     
8d0a 00        nop     
8d0b 00        nop     
8d0c 00        nop     
8d0d 00        nop     
8d0e 00        nop     
8d0f 00        nop     
8d10 00        nop     
8d11 00        nop     
8d12 00        nop     
8d13 00        nop     
8d14 00        nop     
8d15 00        nop     
8d16 00        nop     
8d17 00        nop     
8d18 00        nop     
8d19 00        nop     
8d1a 00        nop     
8d1b 00        nop     
8d1c 00        nop     
8d1d 00        nop     
8d1e 00        nop     
8d1f 00        nop     
8d20 00        nop     
8d21 00        nop     
8d22 00        nop     
8d23 00        nop     
8d24 00        nop     
8d25 00        nop     
8d26 00        nop     
8d27 00        nop     
8d28 00        nop     
8d29 00        nop     
8d2a 00        nop     
8d2b 00        nop     
8d2c 00        nop     
8d2d 00        nop     
8d2e 00        nop     
8d2f 00        nop     
8d30 00        nop     
8d31 00        nop     
8d32 00        nop     
8d33 00        nop     
8d34 00        nop     
8d35 00        nop     
8d36 00        nop     
8d37 00        nop     
8d38 00        nop     
8d39 00        nop     
8d3a 00        nop     
8d3b 00        nop     
8d3c 00        nop     
8d3d 00        nop     
8d3e 00        nop     
8d3f 00        nop     
8d40 00        nop     
8d41 00        nop     
8d42 00        nop     
8d43 00        nop     
8d44 00        nop     
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
8d4f 00        nop     
8d50 00        nop     
8d51 00        nop     
8d52 00        nop     
8d53 00        nop     
8d54 00        nop     
8d55 00        nop     
8d56 00        nop     
8d57 00        nop     
8d58 00        nop     
8d59 00        nop     
8d5a 00        nop     
8d5b 00        nop     
8d5c 00        nop     
8d5d 00        nop     
8d5e 00        nop     
8d5f 00        nop     
8d60 00        nop     
8d61 00        nop     
8d62 00        nop     
8d63 00        nop     
8d64 00        nop     
8d65 00        nop     
8d66 00        nop     
8d67 00        nop     
8d68 00        nop     
8d69 00        nop     
8d6a 00        nop     
8d6b 00        nop     
8d6c 00        nop     
8d6d 00        nop     
8d6e 00        nop     
8d6f 00        nop     
8d70 00        nop     
8d71 00        nop     
8d72 00        nop     
8d73 00        nop     
8d74 00        nop     
8d75 00        nop     
8d76 00        nop     
8d77 00        nop     
8d78 00        nop     
8d79 00        nop     
8d7a 00        nop     
8d7b 00        nop     
8d7c 00        nop     
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
8d88 00        nop     
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
8d94 ff        rst     $38
8d95 00        nop     
8d96 00        nop     
8d97 00        nop     
8d98 00        nop     
8d99 00        nop     
8d9a 00        nop     
8d9b 00        nop     
8d9c 00        nop     
8d9d 00        nop     
8d9e 00        nop     
8d9f 00        nop     
8da0 00        nop     
8da1 00        nop     
8da2 00        nop     
8da3 00        nop     
8da4 00        nop     
8da5 00        nop     
8da6 00        nop     
8da7 00        nop     
8da8 00        nop     
8da9 00        nop     
8daa 00        nop     
8dab 00        nop     
8dac 00        nop     
8dad 00        nop     
8dae 00        nop     
8daf 00        nop     
8db0 00        nop     
8db1 00        nop     
8db2 00        nop     
8db3 00        nop     
8db4 00        nop     
8db5 00        nop     
8db6 00        nop     
8db7 00        nop     
8db8 50        ld      d,b
8db9 00        nop     
8dba 00        nop     
8dbb 00        nop     
8dbc 00        nop     
8dbd 00        nop     
8dbe 2000      jr      nz,$8dc0
8dc0 00        nop     
8dc1 00        nop     
8dc2 00        nop     
8dc3 00        nop     
8dc4 00        nop     
8dc5 00        nop     
8dc6 00        nop     
8dc7 00        nop     
8dc8 00        nop     
8dc9 00        nop     
8dca 00        nop     
8dcb 00        nop     
8dcc 00        nop     
8dcd 00        nop     
8dce 00        nop     
8dcf 00        nop     
8dd0 00        nop     
8dd1 00        nop     
8dd2 00        nop     
8dd3 00        nop     
8dd4 00        nop     
8dd5 00        nop     
8dd6 00        nop     
8dd7 00        nop     
8dd8 00        nop     
8dd9 00        nop     
8dda 00        nop     
8ddb 00        nop     
8ddc 00        nop     
8ddd 00        nop     
8dde 00        nop     
8ddf 00        nop     
8de0 00        nop     
8de1 00        nop     
8de2 00        nop     
8de3 00        nop     
8de4 00        nop     
8de5 00        nop     
8de6 00        nop     
8de7 00        nop     
8de8 00        nop     
8de9 00        nop     
8dea 00        nop     
8deb 00        nop     
8dec 00        nop     
8ded 00        nop     
8dee 00        nop     
8def 00        nop     
8df0 00        nop     
8df1 00        nop     
8df2 00        nop     
8df3 00        nop     
8df4 00        nop     
8df5 00        nop     
8df6 00        nop     
8df7 00        nop     
8df8 00        nop     
8df9 00        nop     
8dfa 00        nop     
8dfb 00        nop     
8dfc 00        nop     
8dfd 00        nop     
8dfe 00        nop     
8dff 00        nop     
8e00 00        nop     
8e01 00        nop     
8e02 00        nop     
8e03 00        nop     
8e04 00        nop     
8e05 00        nop     
8e06 00        nop     
8e07 00        nop     
8e08 00        nop     
8e09 00        nop     
8e0a 00        nop     
8e0b 00        nop     
8e0c 00        nop     
8e0d 00        nop     
8e0e 00        nop     
8e0f 00        nop     
8e10 00        nop     
8e11 00        nop     
8e12 00        nop     
8e13 00        nop     
8e14 00        nop     
8e15 00        nop     
8e16 00        nop     
8e17 00        nop     
8e18 00        nop     
8e19 00        nop     
8e1a 00        nop     
8e1b 00        nop     
8e1c 01007f    ld      bc,$7f00
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
8e9f 59        ld      e,c
8ea0 4e        ld      c,(hl)
8ea1 0d        dec     c
8ea2 0a        ld      a,(bc)
8ea3 0a        ld      a,(bc)
8ea4 54        ld      d,h
8ea5 79        ld      a,c
8ea6 70        ld      (hl),b
8ea7 65        ld      h,l
8ea8 2048      jr      nz,$8ef2
8eaa 45        ld      b,l
8eab 4c        ld      c,h
8eac 50        ld      d,b
8ead 2066      jr      nz,$8f15
8eaf 6f        ld      l,a
8eb0 72        ld      (hl),d
8eb1 2069      jr      nz,$8f1c
8eb3 6e        ld      l,(hl)
8eb4 66        ld      h,(hl)
8eb5 6f        ld      l,a
8eb6 72        ld      (hl),d
8eb7 6d        ld      l,l
8eb8 61        ld      h,c
8eb9 74        ld      (hl),h
8eba 69        ld      l,c
8ebb 6f        ld      l,a
8ebc 6e        ld      l,(hl)
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
8ffa 00        nop     
8ffb 00        nop     
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
902c 00        nop     
902d 00        nop     
902e 00        nop     
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
905e 00        nop     
905f 00        nop     
9060 00        nop     
9061 00        nop     
9062 00        nop     
9063 00        nop     
9064 00        nop     
9065 00        nop     
9066 00        nop     
9067 00        nop     
9068 00        nop     
9069 00        nop     
906a 00        nop     
906b 00        nop     
906c 00        nop     
906d 00        nop     
906e 00        nop     
906f 00        nop     
9070 00        nop     
9071 00        nop     
9072 00        nop     
9073 00        nop     
9074 00        nop     
9075 00        nop     
9076 00        nop     
9077 00        nop     
9078 00        nop     
9079 00        nop     
907a 00        nop     
907b 00        nop     
907c 00        nop     
907d 00        nop     
907e 00        nop     
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
90c7 00        nop     
90c8 00        nop     
90c9 00        nop     
90ca 00        nop     
90cb 00        nop     
90cc 00        nop     
90cd 00        nop     
90ce 00        nop     
90cf 00        nop     
90d0 00        nop     
90d1 00        nop     
90d2 00        nop     
90d3 00        nop     
90d4 00        nop     
90d5 00        nop     
90d6 00        nop     
90d7 00        nop     
90d8 00        nop     
90d9 00        nop     
90da 00        nop     
90db 00        nop     
90dc 00        nop     
90dd 00        nop     
90de 00        nop     
90df 00        nop     
90e0 00        nop     
90e1 00        nop     
90e2 00        nop     
90e3 00        nop     
90e4 00        nop     
90e5 00        nop     
90e6 00        nop     
90e7 00        nop     
90e8 00        nop     
90e9 00        nop     
90ea 00        nop     
90eb 00        nop     
90ec 00        nop     
90ed 00        nop     
90ee 00        nop     
90ef 00        nop     
90f0 00        nop     
90f1 00        nop     
90f2 00        nop     
90f3 00        nop     
90f4 00        nop     
90f5 00        nop     
90f6 00        nop     
90f7 00        nop     
90f8 00        nop     
90f9 00        nop     
90fa 00        nop     
90fb 00        nop     
90fc 00        nop     
90fd 00        nop     
90fe 00        nop     
90ff 00        nop     
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
91d6 00        nop     
91d7 00        nop     
91d8 00        nop     
91d9 00        nop     
91da 00        nop     
91db 00        nop     
91dc 00        nop     
91dd 00        nop     
91de 00        nop     
91df 00        nop     
91e0 00        nop     
91e1 00        nop     
91e2 00        nop     
91e3 00        nop     
91e4 00        nop     
91e5 00        nop     
91e6 00        nop     
91e7 00        nop     
91e8 00        nop     
91e9 00        nop     
91ea 00        nop     
91eb 00        nop     
91ec 00        nop     
91ed 00        nop     
91ee 00        nop     
91ef 00        nop     
91f0 00        nop     
91f1 00        nop     
91f2 00        nop     
91f3 00        nop     
91f4 00        nop     
91f5 00        nop     
91f6 00        nop     
91f7 00        nop     
91f8 00        nop     
91f9 00        nop     
91fa 00        nop     
91fb 00        nop     
91fc 00        nop     
91fd 00        nop     
91fe 00        nop     
91ff 00        nop     
9200 00        nop     
9201 00        nop     
9202 00        nop     
9203 00        nop     
9204 00        nop     
9205 00        nop     
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
9298 00        nop     
9299 00        nop     
929a 00        nop     
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
9775 010001    ld      bc,$0100
9778 00        nop     
9779 010001    ld      bc,$0100
977c 00        nop     
977d 00        nop     
977e 00        nop     
977f 33        inc     sp
9780 00        nop     
9781 00        nop     
9782 00        nop     
9783 03        inc     bc
9784 00        nop     
9785 03        inc     bc
9786 00        nop     
9787 010004    ld      bc,$0400
978a 00        nop     
978b 010001    ld      bc,$0100
978e 00        nop     
978f 00        nop     
9790 00        nop     
9791 00        nop     
9792 00        nop     
9793 00        nop     
9794 00        nop     
9795 04        inc     b
9796 00        nop     
9797 010002    ld      bc,$0200
979a 00        nop     
979b 03        inc     bc
979c 00        nop     
979d 00        nop     
979e 00        nop     
979f 00        nop     
97a0 00        nop     
97a1 00        nop     
97a2 00        nop     
97a3 00        nop     
97a4 00        nop     
97a5 010001    ld      bc,$0100
97a8 00        nop     
97a9 010001    ld      bc,$0100
97ac 00        nop     
97ad 00        nop     
97ae 00        nop     
97af 00        nop     
97b0 00        nop     
97b1 010050    ld      bc,$5000
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
97c3 80        add     a,b
97c4 00        nop     
97c5 00        nop     
97c6 00        nop     
97c7 00        nop     
97c8 ff        rst     $38
97c9 00        nop     
97ca 00        nop     
97cb 00        nop     
97cc 00        nop     
97cd 00        nop     
97ce 00        nop     
97cf 00        nop     
97d0 00        nop     
97d1 00        nop     
97d2 010101    ld      bc,$0101
97d5 010000    ld      bc,$0000
97d8 7f        ld      a,a
97d9 1804      jr      $97df
97db 08        ex      af,af'
97dc 0c        inc     c
97dd 0b        dec     bc
97de 0a        ld      a,(bc)
97df 160e      ld      d,$0e
97e1 1c        inc     e
97e2 0f        rrca    
97e3 14        inc     d
97e4 1011      djnz    $97f7
97e6 02        ld      (bc),a
97e7 0609      ld      b,$09
97e9 0d        dec     c
97ea 05        dec     b
97eb 07        rlca    
97ec 00        nop     
97ed 00        nop     
97ee 00        nop     
97ef 00        nop     
97f0 00        nop     
97f1 00        nop     
97f2 00        nop     
97f3 010000    ld      bc,$0000
97f6 00        nop     
97f7 010101    ld      bc,$0101
97fa 010101    ld      bc,$0101
97fd 010302    ld      bc,$0203
9800 04        inc     b
9801 00        nop     
9802 00        nop     
9803 00        nop     
9804 00        nop     
9805 010200    ld      bc,$0002
9808 00        nop     
9809 00        nop     
980a 010100    ld      bc,$0001
980d 00        nop     
980e 00        nop     
980f 00        nop     
9810 00        nop     
9811 00        nop     
9812 010200    ld      bc,$0002
9815 02        ld      (bc),a
9816 00        nop     
9817 00        nop     
9818 00        nop     
9819 00        nop     
981a 00        nop     
981b 00        nop     
981c 00        nop     
981d 00        nop     
981e 00        nop     
981f 02        ld      (bc),a
9820 00        nop     
9821 00        nop     
9822 02        ld      (bc),a
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
98d6 0e52      ld      c,$52
98d8 44        ld      b,h
98d9 53        ld      d,e
98da 57        ld      d,a
98db 57        ld      d,a
98dc 52        ld      d,d
98dd 45        ld      b,l
98de 58        ld      e,b
98df 49        ld      c,c
98e0 46        ld      b,(hl)
98e1 4f        ld      c,a
98e2 46        ld      b,(hl)
98e3 46        ld      b,(hl)
98e4 53        ld      d,e
98e5 53        ld      d,e
98e6 47        ld      b,a
98e7 53        ld      d,e
98e8 52        ld      d,d
98e9 57        ld      d,a
98ea 53        ld      d,e
98eb 58        ld      e,b
98ec 52        ld      d,d
98ed 4c        ld      c,h
98ee 49        ld      c,c
98ef 45        ld      b,l
98f0 52        ld      d,d
98f1 49        ld      c,c
98f2 4e        ld      c,(hl)
98f3 44        ld      b,h
98f4 49        ld      c,c
98f5 47        ld      b,a
98f6 47        ld      b,a
98f7 47        ld      b,a
98f8 52        ld      d,d
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
9949 2020      jr      nz,$996b
994b 2020      jr      nz,$996d
994d 2020      jr      nz,$996f
994f 2020      jr      nz,$9971
9951 2020      jr      nz,$9973
9953 2020      jr      nz,$9975
9955 2020      jr      nz,$9977
9957 2020      jr      nz,$9979
9959 2020      jr      nz,$997b
995b 2020      jr      nz,$997d
995d 2020      jr      nz,$997f
995f 2020      jr      nz,$9981
9961 2020      jr      nz,$9983
9963 2020      jr      nz,$9985
9965 2020      jr      nz,$9987
9967 2020      jr      nz,$9989
9969 2020      jr      nz,$998b
996b 2020      jr      nz,$998d
996d 2020      jr      nz,$998f
996f 2020      jr      nz,$9991
9971 2020      jr      nz,$9993
9973 2020      jr      nz,$9995
9975 2020      jr      nz,$9997
9977 2020      jr      nz,$9999
9979 2020      jr      nz,$999b
997b 2020      jr      nz,$999d
997d 2020      jr      nz,$999f
997f 2020      jr      nz,$99a1
9981 2020      jr      nz,$99a3
9983 2020      jr      nz,$99a5
9985 2020      jr      nz,$99a7
9987 2020      jr      nz,$99a9
9989 2020      jr      nz,$99ab
998b 2020      jr      nz,$99ad
998d 2020      jr      nz,$99af
998f 2020      jr      nz,$99b1
9991 2020      jr      nz,$99b3
9993 2020      jr      nz,$99b5
9995 2020      jr      nz,$99b7
9997 2020      jr      nz,$99b9
9999 2d        dec     l
999a 2d        dec     l
999b 2d        dec     l
999c 2d        dec     l
999d 2d        dec     l
999e 2d        dec     l
999f 4e        ld      c,(hl)
99a0 2820      jr      z,$99c2
99a2 2020      jr      nz,$99c4
99a4 2020      jr      nz,$99c6
99a6 312c20    ld      sp,$202c
99a9 2031      jr      nz,$99dc
99ab 29        add     hl,hl
99ac 3c        inc     a
99ad 313e20    ld      sp,$203e
99b0 2020      jr      nz,$99d2
99b2 2020      jr      nz,$99d4
99b4 2020      jr      nz,$99d6
99b6 2020      jr      nz,$99d8
99b8 2020      jr      nz,$99da
99ba 2020      jr      nz,$99dc
99bc 2020      jr      nz,$99de
99be 2020      jr      nz,$99e0
99c0 2020      jr      nz,$99e2
99c2 2020      jr      nz,$99e4
99c4 2020      jr      nz,$99e6
99c6 2020      jr      nz,$99e8
99c8 2020      jr      nz,$99ea
99ca 2020      jr      nz,$99ec
99cc 2020      jr      nz,$99ee
99ce 2020      jr      nz,$99f0
99d0 2020      jr      nz,$99f2
99d2 2020      jr      nz,$99f4
99d4 2020      jr      nz,$99f6
99d6 2020      jr      nz,$99f8
99d8 2020      jr      nz,$99fa
99da 2020      jr      nz,$99fc
99dc 2020      jr      nz,$99fe
99de 2020      jr      nz,$9a00
99e0 2020      jr      nz,$9a02
99e2 2020      jr      nz,$9a04
99e4 2020      jr      nz,$9a06
99e6 2020      jr      nz,$9a08
99e8 2020      jr      nz,$9a0a
99ea 2020      jr      nz,$9a0c
99ec 2020      jr      nz,$9a0e
99ee 2020      jr      nz,$9a10
99f0 2020      jr      nz,$9a12
99f2 2020      jr      nz,$9a14
99f4 2020      jr      nz,$9a16
99f6 2020      jr      nz,$9a18
99f8 2020      jr      nz,$9a1a
99fa 2020      jr      nz,$9a1c
99fc 2020      jr      nz,$9a1e
99fe 2020      jr      nz,$9a20
9a00 2020      jr      nz,$9a22
9a02 2020      jr      nz,$9a24
9a04 2020      jr      nz,$9a26
9a06 2020      jr      nz,$9a28
9a08 2020      jr      nz,$9a2a
9a0a 2020      jr      nz,$9a2c
9a0c 2020      jr      nz,$9a2e
9a0e 2020      jr      nz,$9a30
9a10 2020      jr      nz,$9a32
9a12 2020      jr      nz,$9a34
9a14 2020      jr      nz,$9a36
9a16 2020      jr      nz,$9a38
9a18 2020      jr      nz,$9a3a
9a1a 2020      jr      nz,$9a3c
9a1c 2020      jr      nz,$9a3e
9a1e 2020      jr      nz,$9a40
9a20 2020      jr      nz,$9a42
9a22 2020      jr      nz,$9a44
9a24 2020      jr      nz,$9a46
9a26 2020      jr      nz,$9a48
9a28 2020      jr      nz,$9a4a
9a2a 2020      jr      nz,$9a4c
9a2c 2020      jr      nz,$9a4e
9a2e 2020      jr      nz,$9a50
9a30 2020      jr      nz,$9a52
9a32 2020      jr      nz,$9a54
9a34 2020      jr      nz,$9a56
9a36 2020      jr      nz,$9a58
9a38 2020      jr      nz,$9a5a
9a3a 2020      jr      nz,$9a5c
9a3c 2020      jr      nz,$9a5e
9a3e 2020      jr      nz,$9a60
9a40 2020      jr      nz,$9a62
9a42 2020      jr      nz,$9a64
9a44 2020      jr      nz,$9a66
9a46 2020      jr      nz,$9a68
9a48 2020      jr      nz,$9a6a
9a4a 2020      jr      nz,$9a6c
9a4c 2020      jr      nz,$9a6e
9a4e 2020      jr      nz,$9a70
9a50 2020      jr      nz,$9a72
9a52 2020      jr      nz,$9a74
9a54 2020      jr      nz,$9a76
9a56 2020      jr      nz,$9a78
9a58 2020      jr      nz,$9a7a
9a5a 2020      jr      nz,$9a7c
9a5c 2020      jr      nz,$9a7e
9a5e 2020      jr      nz,$9a80
9a60 2020      jr      nz,$9a82
9a62 2020      jr      nz,$9a84
9a64 2020      jr      nz,$9a86
9a66 2020      jr      nz,$9a88
9a68 2020      jr      nz,$9a8a
9a6a 2020      jr      nz,$9a8c
9a6c 2020      jr      nz,$9a8e
9a6e 2020      jr      nz,$9a90
9a70 2020      jr      nz,$9a92
9a72 2020      jr      nz,$9a94
9a74 2020      jr      nz,$9a96
9a76 2020      jr      nz,$9a98
9a78 2020      jr      nz,$9a9a
9a7a 2020      jr      nz,$9a9c
9a7c 2020      jr      nz,$9a9e
9a7e 2020      jr      nz,$9aa0
9a80 2020      jr      nz,$9aa2
9a82 2020      jr      nz,$9aa4
9a84 2020      jr      nz,$9aa6
9a86 2020      jr      nz,$9aa8
9a88 2020      jr      nz,$9aaa
9a8a 2020      jr      nz,$9aac
9a8c 2020      jr      nz,$9aae
9a8e 2020      jr      nz,$9ab0
9a90 2020      jr      nz,$9ab2
9a92 2020      jr      nz,$9ab4
9a94 2020      jr      nz,$9ab6
9a96 2020      jr      nz,$9ab8
9a98 2020      jr      nz,$9aba
9a9a 2020      jr      nz,$9abc
9a9c 2020      jr      nz,$9abe
9a9e 2020      jr      nz,$9ac0
9aa0 2020      jr      nz,$9ac2
9aa2 2020      jr      nz,$9ac4
9aa4 2020      jr      nz,$9ac6
9aa6 2020      jr      nz,$9ac8
9aa8 2020      jr      nz,$9aca
9aaa 2020      jr      nz,$9acc
9aac 2020      jr      nz,$9ace
9aae 2020      jr      nz,$9ad0
9ab0 2020      jr      nz,$9ad2
9ab2 2020      jr      nz,$9ad4
9ab4 2020      jr      nz,$9ad6
9ab6 2020      jr      nz,$9ad8
9ab8 2020      jr      nz,$9ada
9aba 2020      jr      nz,$9adc
9abc 2020      jr      nz,$9ade
9abe 2020      jr      nz,$9ae0
9ac0 2020      jr      nz,$9ae2
9ac2 2020      jr      nz,$9ae4
9ac4 2020      jr      nz,$9ae6
9ac6 2020      jr      nz,$9ae8
9ac8 2020      jr      nz,$9aea
9aca 2020      jr      nz,$9aec
9acc 2020      jr      nz,$9aee
9ace 2020      jr      nz,$9af0
9ad0 2020      jr      nz,$9af2
9ad2 2020      jr      nz,$9af4
9ad4 2020      jr      nz,$9af6
9ad6 2020      jr      nz,$9af8
9ad8 2020      jr      nz,$9afa
9ada 2020      jr      nz,$9afc
9adc 2020      jr      nz,$9afe
9ade 2020      jr      nz,$9b00
9ae0 2020      jr      nz,$9b02
9ae2 2020      jr      nz,$9b04
9ae4 2020      jr      nz,$9b06
9ae6 2020      jr      nz,$9b08
9ae8 2020      jr      nz,$9b0a
9aea 2020      jr      nz,$9b0c
9aec 2020      jr      nz,$9b0e
9aee 2020      jr      nz,$9b10
9af0 2020      jr      nz,$9b12
9af2 2020      jr      nz,$9b14
9af4 2020      jr      nz,$9b16
9af6 2020      jr      nz,$9b18
9af8 2020      jr      nz,$9b1a
9afa 2020      jr      nz,$9b1c
9afc 2020      jr      nz,$9b1e
9afe 2020      jr      nz,$9b20
9b00 2020      jr      nz,$9b22
9b02 2020      jr      nz,$9b24
9b04 2020      jr      nz,$9b26
9b06 2020      jr      nz,$9b28
9b08 2020      jr      nz,$9b2a
9b0a 2020      jr      nz,$9b2c
9b0c 2020      jr      nz,$9b2e
9b0e 2020      jr      nz,$9b30
9b10 2020      jr      nz,$9b32
9b12 2020      jr      nz,$9b34
9b14 2020      jr      nz,$9b36
9b16 2020      jr      nz,$9b38
9b18 2020      jr      nz,$9b3a
9b1a 2020      jr      nz,$9b3c
9b1c 2020      jr      nz,$9b3e
9b1e 2020      jr      nz,$9b40
9b20 2020      jr      nz,$9b42
9b22 2020      jr      nz,$9b44
9b24 2020      jr      nz,$9b46
9b26 2020      jr      nz,$9b48
9b28 2020      jr      nz,$9b4a
9b2a 2020      jr      nz,$9b4c
9b2c 2020      jr      nz,$9b4e
9b2e 2020      jr      nz,$9b50
9b30 2020      jr      nz,$9b52
9b32 2020      jr      nz,$9b54
9b34 2020      jr      nz,$9b56
9b36 2020      jr      nz,$9b58
9b38 2020      jr      nz,$9b5a
9b3a 2020      jr      nz,$9b5c
9b3c 2020      jr      nz,$9b5e
9b3e 2020      jr      nz,$9b60
9b40 2020      jr      nz,$9b62
9b42 2020      jr      nz,$9b64
9b44 2020      jr      nz,$9b66
9b46 2020      jr      nz,$9b68
9b48 2020      jr      nz,$9b6a
9b4a 2020      jr      nz,$9b6c
9b4c 2020      jr      nz,$9b6e
9b4e 2020      jr      nz,$9b70
9b50 2020      jr      nz,$9b72
9b52 2020      jr      nz,$9b74
9b54 2020      jr      nz,$9b76
9b56 2020      jr      nz,$9b78
9b58 2020      jr      nz,$9b7a
9b5a 2020      jr      nz,$9b7c
9b5c 2020      jr      nz,$9b7e
9b5e 2020      jr      nz,$9b80
9b60 2020      jr      nz,$9b82
9b62 2020      jr      nz,$9b84
9b64 2020      jr      nz,$9b86
9b66 2020      jr      nz,$9b88
9b68 2020      jr      nz,$9b8a
9b6a 2020      jr      nz,$9b8c
9b6c 2020      jr      nz,$9b8e
9b6e 2020      jr      nz,$9b90
9b70 2020      jr      nz,$9b92
9b72 2020      jr      nz,$9b94
9b74 2020      jr      nz,$9b96
9b76 2020      jr      nz,$9b98
9b78 2020      jr      nz,$9b9a
9b7a 2020      jr      nz,$9b9c
9b7c 2020      jr      nz,$9b9e
9b7e 2020      jr      nz,$9ba0
9b80 2020      jr      nz,$9ba2
9b82 2020      jr      nz,$9ba4
9b84 2020      jr      nz,$9ba6
9b86 2020      jr      nz,$9ba8
9b88 2020      jr      nz,$9baa
9b8a 2020      jr      nz,$9bac
9b8c 2020      jr      nz,$9bae
9b8e 2020      jr      nz,$9bb0
9b90 2020      jr      nz,$9bb2
9b92 2020      jr      nz,$9bb4
9b94 2020      jr      nz,$9bb6
9b96 2020      jr      nz,$9bb8
9b98 2020      jr      nz,$9bba
9b9a 2020      jr      nz,$9bbc
9b9c 2020      jr      nz,$9bbe
9b9e 2020      jr      nz,$9bc0
9ba0 2020      jr      nz,$9bc2
9ba2 2020      jr      nz,$9bc4
9ba4 2020      jr      nz,$9bc6
9ba6 2020      jr      nz,$9bc8
9ba8 2020      jr      nz,$9bca
9baa 2020      jr      nz,$9bcc
9bac 2020      jr      nz,$9bce
9bae 2020      jr      nz,$9bd0
9bb0 2020      jr      nz,$9bd2
9bb2 2020      jr      nz,$9bd4
9bb4 2020      jr      nz,$9bd6
9bb6 2020      jr      nz,$9bd8
9bb8 2020      jr      nz,$9bda
9bba 2020      jr      nz,$9bdc
9bbc 2020      jr      nz,$9bde
9bbe 2020      jr      nz,$9be0
9bc0 2020      jr      nz,$9be2
9bc2 2020      jr      nz,$9be4
9bc4 2020      jr      nz,$9be6
9bc6 2020      jr      nz,$9be8
9bc8 2020      jr      nz,$9bea
9bca 2020      jr      nz,$9bec
9bcc 2020      jr      nz,$9bee
9bce 2020      jr      nz,$9bf0
9bd0 2020      jr      nz,$9bf2
9bd2 2020      jr      nz,$9bf4
9bd4 2020      jr      nz,$9bf6
9bd6 2020      jr      nz,$9bf8
9bd8 2020      jr      nz,$9bfa
9bda 2020      jr      nz,$9bfc
9bdc 2020      jr      nz,$9bfe
9bde 2020      jr      nz,$9c00
9be0 2020      jr      nz,$9c02
9be2 2020      jr      nz,$9c04
9be4 2020      jr      nz,$9c06
9be6 2020      jr      nz,$9c08
9be8 2020      jr      nz,$9c0a
9bea 2020      jr      nz,$9c0c
9bec 2020      jr      nz,$9c0e
9bee 2020      jr      nz,$9c10
9bf0 2020      jr      nz,$9c12
9bf2 2020      jr      nz,$9c14
9bf4 2020      jr      nz,$9c16
9bf6 2020      jr      nz,$9c18
9bf8 2020      jr      nz,$9c1a
9bfa 2020      jr      nz,$9c1c
9bfc 2020      jr      nz,$9c1e
9bfe 2020      jr      nz,$9c20
9c00 2020      jr      nz,$9c22
9c02 2020      jr      nz,$9c24
9c04 2020      jr      nz,$9c26
9c06 2020      jr      nz,$9c28
9c08 2020      jr      nz,$9c2a
9c0a 2020      jr      nz,$9c2c
9c0c 2020      jr      nz,$9c2e
9c0e 2020      jr      nz,$9c30
9c10 2020      jr      nz,$9c32
9c12 2020      jr      nz,$9c34
9c14 2020      jr      nz,$9c36
9c16 2020      jr      nz,$9c38
9c18 2020      jr      nz,$9c3a
9c1a 2020      jr      nz,$9c3c
9c1c 2020      jr      nz,$9c3e
9c1e 2020      jr      nz,$9c40
9c20 2020      jr      nz,$9c42
9c22 2020      jr      nz,$9c44
9c24 2020      jr      nz,$9c46
9c26 2020      jr      nz,$9c48
9c28 2020      jr      nz,$9c4a
9c2a 2020      jr      nz,$9c4c
9c2c 2020      jr      nz,$9c4e
9c2e 2020      jr      nz,$9c50
9c30 2020      jr      nz,$9c52
9c32 2020      jr      nz,$9c54
9c34 2020      jr      nz,$9c56
9c36 2020      jr      nz,$9c58
9c38 2020      jr      nz,$9c5a
9c3a 2020      jr      nz,$9c5c
9c3c 2020      jr      nz,$9c5e
9c3e 2020      jr      nz,$9c60
9c40 2020      jr      nz,$9c62
9c42 2020      jr      nz,$9c64
9c44 2020      jr      nz,$9c66
9c46 2020      jr      nz,$9c68
9c48 2020      jr      nz,$9c6a
9c4a 2020      jr      nz,$9c6c
9c4c 2020      jr      nz,$9c6e
9c4e 2020      jr      nz,$9c70
9c50 2020      jr      nz,$9c72
9c52 2020      jr      nz,$9c74
9c54 2020      jr      nz,$9c76
9c56 2020      jr      nz,$9c78
9c58 2020      jr      nz,$9c7a
9c5a 2020      jr      nz,$9c7c
9c5c 2020      jr      nz,$9c7e
9c5e 2020      jr      nz,$9c80
9c60 2020      jr      nz,$9c82
9c62 2020      jr      nz,$9c84
9c64 2020      jr      nz,$9c86
9c66 2020      jr      nz,$9c88
9c68 2020      jr      nz,$9c8a
9c6a 2020      jr      nz,$9c8c
9c6c 2020      jr      nz,$9c8e
9c6e 2020      jr      nz,$9c90
9c70 2020      jr      nz,$9c92
9c72 2020      jr      nz,$9c94
9c74 2020      jr      nz,$9c96
9c76 2020      jr      nz,$9c98
9c78 2020      jr      nz,$9c9a
9c7a 2020      jr      nz,$9c9c
9c7c 2020      jr      nz,$9c9e
9c7e 2020      jr      nz,$9ca0
9c80 2020      jr      nz,$9ca2
9c82 2020      jr      nz,$9ca4
9c84 2020      jr      nz,$9ca6
9c86 2020      jr      nz,$9ca8
9c88 2020      jr      nz,$9caa
9c8a 2020      jr      nz,$9cac
9c8c 2020      jr      nz,$9cae
9c8e 2020      jr      nz,$9cb0
9c90 2020      jr      nz,$9cb2
9c92 2020      jr      nz,$9cb4
9c94 2020      jr      nz,$9cb6
9c96 2020      jr      nz,$9cb8
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
9ce8 2020      jr      nz,$9d0a
9cea 2020      jr      nz,$9d0c
9cec 2020      jr      nz,$9d0e
9cee 2020      jr      nz,$9d10
9cf0 2020      jr      nz,$9d12
9cf2 2020      jr      nz,$9d14
9cf4 2020      jr      nz,$9d16
9cf6 2020      jr      nz,$9d18
9cf8 2020      jr      nz,$9d1a
9cfa 2020      jr      nz,$9d1c
9cfc 2020      jr      nz,$9d1e
9cfe 2020      jr      nz,$9d20
9d00 2020      jr      nz,$9d22
9d02 2020      jr      nz,$9d24
9d04 2020      jr      nz,$9d26
9d06 2020      jr      nz,$9d28
9d08 2020      jr      nz,$9d2a
9d0a 2020      jr      nz,$9d2c
9d0c 2020      jr      nz,$9d2e
9d0e 2020      jr      nz,$9d30
9d10 2020      jr      nz,$9d32
9d12 2020      jr      nz,$9d34
9d14 2020      jr      nz,$9d36
9d16 2020      jr      nz,$9d38
9d18 2020      jr      nz,$9d3a
9d1a 2020      jr      nz,$9d3c
9d1c 2020      jr      nz,$9d3e
9d1e 2020      jr      nz,$9d40
9d20 2020      jr      nz,$9d42
9d22 2020      jr      nz,$9d44
9d24 2020      jr      nz,$9d46
9d26 2020      jr      nz,$9d48
9d28 2020      jr      nz,$9d4a
9d2a 2020      jr      nz,$9d4c
9d2c 2020      jr      nz,$9d4e
9d2e 2020      jr      nz,$9d50
9d30 2020      jr      nz,$9d52
9d32 2020      jr      nz,$9d54
9d34 2020      jr      nz,$9d56
9d36 2020      jr      nz,$9d58
9d38 2020      jr      nz,$9d5a
9d3a 2020      jr      nz,$9d5c
9d3c 2020      jr      nz,$9d5e
9d3e 2020      jr      nz,$9d60
9d40 2020      jr      nz,$9d62
9d42 2020      jr      nz,$9d64
9d44 2020      jr      nz,$9d66
9d46 2020      jr      nz,$9d68
9d48 2020      jr      nz,$9d6a
9d4a 2020      jr      nz,$9d6c
9d4c 2020      jr      nz,$9d6e
9d4e 2020      jr      nz,$9d70
9d50 2020      jr      nz,$9d72
9d52 2020      jr      nz,$9d74
9d54 2020      jr      nz,$9d76
9d56 2020      jr      nz,$9d78
9d58 2020      jr      nz,$9d7a
9d5a 2020      jr      nz,$9d7c
9d5c 2020      jr      nz,$9d7e
9d5e 2020      jr      nz,$9d80
9d60 2020      jr      nz,$9d82
9d62 2020      jr      nz,$9d84
9d64 2020      jr      nz,$9d86
9d66 2020      jr      nz,$9d88
9d68 2020      jr      nz,$9d8a
9d6a 2020      jr      nz,$9d8c
9d6c 2020      jr      nz,$9d8e
9d6e 2020      jr      nz,$9d90
9d70 2020      jr      nz,$9d92
9d72 2020      jr      nz,$9d94
9d74 2020      jr      nz,$9d96
9d76 2020      jr      nz,$9d98
9d78 2020      jr      nz,$9d9a
9d7a 2020      jr      nz,$9d9c
9d7c 2020      jr      nz,$9d9e
9d7e 2020      jr      nz,$9da0
9d80 2020      jr      nz,$9da2
9d82 2020      jr      nz,$9da4
9d84 2020      jr      nz,$9da6
9d86 2020      jr      nz,$9da8
9d88 2020      jr      nz,$9daa
9d8a 2020      jr      nz,$9dac
9d8c 2020      jr      nz,$9dae
9d8e 2020      jr      nz,$9db0
9d90 2020      jr      nz,$9db2
9d92 2020      jr      nz,$9db4
9d94 2020      jr      nz,$9db6
9d96 2020      jr      nz,$9db8
9d98 2020      jr      nz,$9dba
9d9a 2020      jr      nz,$9dbc
9d9c 2020      jr      nz,$9dbe
9d9e 2020      jr      nz,$9dc0
9da0 2020      jr      nz,$9dc2
9da2 2020      jr      nz,$9dc4
9da4 2020      jr      nz,$9dc6
9da6 2020      jr      nz,$9dc8
9da8 2020      jr      nz,$9dca
9daa 2020      jr      nz,$9dcc
9dac 2020      jr      nz,$9dce
9dae 2020      jr      nz,$9dd0
9db0 2020      jr      nz,$9dd2
9db2 2020      jr      nz,$9dd4
9db4 2020      jr      nz,$9dd6
9db6 2020      jr      nz,$9dd8
9db8 2020      jr      nz,$9dda
9dba 2020      jr      nz,$9ddc
9dbc 2020      jr      nz,$9dde
9dbe 2020      jr      nz,$9de0
9dc0 2020      jr      nz,$9de2
9dc2 2020      jr      nz,$9de4
9dc4 2020      jr      nz,$9de6
9dc6 2020      jr      nz,$9de8
9dc8 2020      jr      nz,$9dea
9dca 2020      jr      nz,$9dec
9dcc 2020      jr      nz,$9dee
9dce 2020      jr      nz,$9df0
9dd0 2020      jr      nz,$9df2
9dd2 2020      jr      nz,$9df4
9dd4 2020      jr      nz,$9df6
9dd6 2020      jr      nz,$9df8
9dd8 2020      jr      nz,$9dfa
9dda 2020      jr      nz,$9dfc
9ddc 2020      jr      nz,$9dfe
9dde 2020      jr      nz,$9e00
9de0 2020      jr      nz,$9e02
9de2 2020      jr      nz,$9e04
9de4 2020      jr      nz,$9e06
9de6 2020      jr      nz,$9e08
9de8 2020      jr      nz,$9e0a
9dea 2020      jr      nz,$9e0c
9dec 2020      jr      nz,$9e0e
9dee 2020      jr      nz,$9e10
9df0 2020      jr      nz,$9e12
9df2 2020      jr      nz,$9e14
9df4 2020      jr      nz,$9e16
9df6 2020      jr      nz,$9e18
9df8 2020      jr      nz,$9e1a
9dfa 2020      jr      nz,$9e1c
9dfc 2020      jr      nz,$9e1e
9dfe 2020      jr      nz,$9e20
9e00 2020      jr      nz,$9e22
9e02 2020      jr      nz,$9e24
9e04 2020      jr      nz,$9e26
9e06 2020      jr      nz,$9e28
9e08 2020      jr      nz,$9e2a
9e0a 2020      jr      nz,$9e2c
9e0c 2020      jr      nz,$9e2e
9e0e 2020      jr      nz,$9e30
9e10 2020      jr      nz,$9e32
9e12 2020      jr      nz,$9e34
9e14 2020      jr      nz,$9e36
9e16 2020      jr      nz,$9e38
9e18 2020      jr      nz,$9e3a
9e1a 2020      jr      nz,$9e3c
9e1c 2020      jr      nz,$9e3e
9e1e 2020      jr      nz,$9e40
9e20 2020      jr      nz,$9e42
9e22 2020      jr      nz,$9e44
9e24 2020      jr      nz,$9e46
9e26 2020      jr      nz,$9e48
9e28 2020      jr      nz,$9e4a
9e2a 2020      jr      nz,$9e4c
9e2c 2020      jr      nz,$9e4e
9e2e 2020      jr      nz,$9e50
9e30 2020      jr      nz,$9e52
9e32 2020      jr      nz,$9e54
9e34 2020      jr      nz,$9e56
9e36 2020      jr      nz,$9e58
9e38 2020      jr      nz,$9e5a
9e3a 2020      jr      nz,$9e5c
9e3c 2020      jr      nz,$9e5e
9e3e 2020      jr      nz,$9e60
9e40 2020      jr      nz,$9e62
9e42 2020      jr      nz,$9e64
9e44 2020      jr      nz,$9e66
9e46 2020      jr      nz,$9e68
9e48 2020      jr      nz,$9e6a
9e4a 2020      jr      nz,$9e6c
9e4c 2020      jr      nz,$9e6e
9e4e 2020      jr      nz,$9e70
9e50 2020      jr      nz,$9e72
9e52 2020      jr      nz,$9e74
9e54 2020      jr      nz,$9e76
9e56 2020      jr      nz,$9e78
9e58 2020      jr      nz,$9e7a
9e5a 2020      jr      nz,$9e7c
9e5c 2020      jr      nz,$9e7e
9e5e 2020      jr      nz,$9e80
9e60 2020      jr      nz,$9e82
9e62 2020      jr      nz,$9e84
9e64 2020      jr      nz,$9e86
9e66 2020      jr      nz,$9e88
9e68 2020      jr      nz,$9e8a
9e6a 2020      jr      nz,$9e8c
9e6c 2020      jr      nz,$9e8e
9e6e 2020      jr      nz,$9e90
9e70 2020      jr      nz,$9e92
9e72 2020      jr      nz,$9e94
9e74 2020      jr      nz,$9e96
9e76 2020      jr      nz,$9e98
9e78 2020      jr      nz,$9e9a
9e7a 2020      jr      nz,$9e9c
9e7c 2020      jr      nz,$9e9e
9e7e 2020      jr      nz,$9ea0
9e80 2020      jr      nz,$9ea2
9e82 2020      jr      nz,$9ea4
9e84 2020      jr      nz,$9ea6
9e86 2020      jr      nz,$9ea8
9e88 2020      jr      nz,$9eaa
9e8a 2020      jr      nz,$9eac
9e8c 2020      jr      nz,$9eae
9e8e 2020      jr      nz,$9eb0
9e90 2020      jr      nz,$9eb2
9e92 2020      jr      nz,$9eb4
9e94 2020      jr      nz,$9eb6
9e96 2020      jr      nz,$9eb8
9e98 2020      jr      nz,$9eba
9e9a 2020      jr      nz,$9ebc
9e9c 2020      jr      nz,$9ebe
9e9e 2020      jr      nz,$9ec0
9ea0 2020      jr      nz,$9ec2
9ea2 2020      jr      nz,$9ec4
9ea4 2020      jr      nz,$9ec6
9ea6 2020      jr      nz,$9ec8
9ea8 2020      jr      nz,$9eca
9eaa 2020      jr      nz,$9ecc
9eac 2020      jr      nz,$9ece
9eae 2020      jr      nz,$9ed0
9eb0 2020      jr      nz,$9ed2
9eb2 2020      jr      nz,$9ed4
9eb4 2020      jr      nz,$9ed6
9eb6 2020      jr      nz,$9ed8
9eb8 2020      jr      nz,$9eda
9eba 2020      jr      nz,$9edc
9ebc 2020      jr      nz,$9ede
9ebe 2020      jr      nz,$9ee0
9ec0 2020      jr      nz,$9ee2
9ec2 2020      jr      nz,$9ee4
9ec4 2020      jr      nz,$9ee6
9ec6 2020      jr      nz,$9ee8
9ec8 2020      jr      nz,$9eea
9eca 2020      jr      nz,$9eec
9ecc 2020      jr      nz,$9eee
9ece 2020      jr      nz,$9ef0
9ed0 2020      jr      nz,$9ef2
9ed2 2020      jr      nz,$9ef4
9ed4 2020      jr      nz,$9ef6
9ed6 2020      jr      nz,$9ef8
9ed8 2020      jr      nz,$9efa
9eda 2020      jr      nz,$9efc
9edc 2020      jr      nz,$9efe
9ede 2020      jr      nz,$9f00
9ee0 2020      jr      nz,$9f02
9ee2 2020      jr      nz,$9f04
9ee4 2020      jr      nz,$9f06
9ee6 2020      jr      nz,$9f08
9ee8 2020      jr      nz,$9f0a
9eea 2020      jr      nz,$9f0c
9eec 2020      jr      nz,$9f0e
9eee 2020      jr      nz,$9f10
9ef0 2020      jr      nz,$9f12
9ef2 2020      jr      nz,$9f14
9ef4 2020      jr      nz,$9f16
9ef6 2020      jr      nz,$9f18
9ef8 2020      jr      nz,$9f1a
9efa 2020      jr      nz,$9f1c
9efc 2020      jr      nz,$9f1e
9efe 2020      jr      nz,$9f20
9f00 2020      jr      nz,$9f22
9f02 2020      jr      nz,$9f24
9f04 2020      jr      nz,$9f26
9f06 2020      jr      nz,$9f28
9f08 2020      jr      nz,$9f2a
9f0a 2020      jr      nz,$9f2c
9f0c 2020      jr      nz,$9f2e
9f0e 2020      jr      nz,$9f30
9f10 2020      jr      nz,$9f32
9f12 2020      jr      nz,$9f34
9f14 2020      jr      nz,$9f36
9f16 2020      jr      nz,$9f38
9f18 2020      jr      nz,$9f3a
9f1a 2020      jr      nz,$9f3c
9f1c 2020      jr      nz,$9f3e
9f1e 2020      jr      nz,$9f40
9f20 2020      jr      nz,$9f42
9f22 2020      jr      nz,$9f44
9f24 2020      jr      nz,$9f46
9f26 2020      jr      nz,$9f48
9f28 2020      jr      nz,$9f4a
9f2a 2020      jr      nz,$9f4c
9f2c 2020      jr      nz,$9f4e
9f2e 2020      jr      nz,$9f50
9f30 2020      jr      nz,$9f52
9f32 2020      jr      nz,$9f54
9f34 2020      jr      nz,$9f56
9f36 2020      jr      nz,$9f58
9f38 2020      jr      nz,$9f5a
9f3a 2020      jr      nz,$9f5c
9f3c 2020      jr      nz,$9f5e
9f3e 2020      jr      nz,$9f60
9f40 2020      jr      nz,$9f62
9f42 2020      jr      nz,$9f64
9f44 2020      jr      nz,$9f66
9f46 2020      jr      nz,$9f68
9f48 2020      jr      nz,$9f6a
9f4a 2020      jr      nz,$9f6c
9f4c 2020      jr      nz,$9f6e
9f4e 2020      jr      nz,$9f70
9f50 2020      jr      nz,$9f72
9f52 2020      jr      nz,$9f74
9f54 2020      jr      nz,$9f76
9f56 2020      jr      nz,$9f78
9f58 2020      jr      nz,$9f7a
9f5a 2020      jr      nz,$9f7c
9f5c 2020      jr      nz,$9f7e
9f5e 2020      jr      nz,$9f80
9f60 2020      jr      nz,$9f82
9f62 2020      jr      nz,$9f84
9f64 2020      jr      nz,$9f86
9f66 2020      jr      nz,$9f88
9f68 2020      jr      nz,$9f8a
9f6a 2020      jr      nz,$9f8c
9f6c 2020      jr      nz,$9f8e
9f6e 2020      jr      nz,$9f90
9f70 2020      jr      nz,$9f92
9f72 2020      jr      nz,$9f94
9f74 2020      jr      nz,$9f96
9f76 2020      jr      nz,$9f98
9f78 2020      jr      nz,$9f9a
9f7a 2020      jr      nz,$9f9c
9f7c 2020      jr      nz,$9f9e
9f7e 2020      jr      nz,$9fa0
9f80 2020      jr      nz,$9fa2
9f82 2020      jr      nz,$9fa4
9f84 2020      jr      nz,$9fa6
9f86 2020      jr      nz,$9fa8
9f88 2020      jr      nz,$9faa
9f8a 2020      jr      nz,$9fac
9f8c 2020      jr      nz,$9fae
9f8e 2020      jr      nz,$9fb0
9f90 2020      jr      nz,$9fb2
9f92 2020      jr      nz,$9fb4
9f94 2020      jr      nz,$9fb6
9f96 2020      jr      nz,$9fb8
9f98 2020      jr      nz,$9fba
9f9a 2020      jr      nz,$9fbc
9f9c 2020      jr      nz,$9fbe
9f9e 2020      jr      nz,$9fc0
9fa0 2020      jr      nz,$9fc2
9fa2 2020      jr      nz,$9fc4
9fa4 2020      jr      nz,$9fc6
9fa6 2020      jr      nz,$9fc8
9fa8 2020      jr      nz,$9fca
9faa 2020      jr      nz,$9fcc
9fac 2020      jr      nz,$9fce
9fae 2020      jr      nz,$9fd0
9fb0 2020      jr      nz,$9fd2
9fb2 2020      jr      nz,$9fd4
9fb4 2020      jr      nz,$9fd6
9fb6 2020      jr      nz,$9fd8
9fb8 2020      jr      nz,$9fda
9fba 2020      jr      nz,$9fdc
9fbc 2020      jr      nz,$9fde
9fbe 2020      jr      nz,$9fe0
9fc0 2020      jr      nz,$9fe2
9fc2 2020      jr      nz,$9fe4
9fc4 2020      jr      nz,$9fe6
9fc6 2020      jr      nz,$9fe8
9fc8 2020      jr      nz,$9fea
9fca 2020      jr      nz,$9fec
9fcc 2020      jr      nz,$9fee
9fce 2020      jr      nz,$9ff0
9fd0 2020      jr      nz,$9ff2
9fd2 2020      jr      nz,$9ff4
9fd4 2020      jr      nz,$9ff6
9fd6 2020      jr      nz,$9ff8
9fd8 2020      jr      nz,$9ffa
9fda 2020      jr      nz,$9ffc
9fdc 2020      jr      nz,$9ffe
9fde 2020      jr      nz,$a000
9fe0 2020      jr      nz,$a002
9fe2 2020      jr      nz,$a004
9fe4 2020      jr      nz,$a006
9fe6 2020      jr      nz,$a008
9fe8 2020      jr      nz,$a00a
9fea 2020      jr      nz,$a00c
9fec 2020      jr      nz,$a00e
9fee 2020      jr      nz,$a010
9ff0 2020      jr      nz,$a012
9ff2 2020      jr      nz,$a014
9ff4 2020      jr      nz,$a016
9ff6 2020      jr      nz,$a018
9ff8 2020      jr      nz,$a01a
9ffa 2020      jr      nz,$a01c
9ffc 2020      jr      nz,$a01e
9ffe 2020      jr      nz,$a020
a000 2020      jr      nz,$a022
a002 2020      jr      nz,$a024
a004 2020      jr      nz,$a026
a006 2020      jr      nz,$a028
a008 2020      jr      nz,$a02a
a00a 2020      jr      nz,$a02c
a00c 2020      jr      nz,$a02e
a00e 2020      jr      nz,$a030
a010 2020      jr      nz,$a032
a012 2020      jr      nz,$a034
a014 2020      jr      nz,$a036
a016 2020      jr      nz,$a038
a018 2020      jr      nz,$a03a
a01a 2020      jr      nz,$a03c
a01c 2020      jr      nz,$a03e
a01e 2020      jr      nz,$a040
a020 2020      jr      nz,$a042
a022 2020      jr      nz,$a044
a024 2020      jr      nz,$a046
a026 2020      jr      nz,$a048
a028 2020      jr      nz,$a04a
a02a 2020      jr      nz,$a04c
a02c 2020      jr      nz,$a04e
a02e 2020      jr      nz,$a050
a030 2020      jr      nz,$a052
a032 2020      jr      nz,$a054
a034 2020      jr      nz,$a056
a036 2020      jr      nz,$a058
a038 2020      jr      nz,$a05a
a03a 2020      jr      nz,$a05c
a03c 2020      jr      nz,$a05e
a03e 2020      jr      nz,$a060
a040 2020      jr      nz,$a062
a042 2020      jr      nz,$a064
a044 2020      jr      nz,$a066
a046 2020      jr      nz,$a068
a048 2020      jr      nz,$a06a
a04a 2020      jr      nz,$a06c
a04c 2020      jr      nz,$a06e
a04e 2020      jr      nz,$a070
a050 2020      jr      nz,$a072
a052 2020      jr      nz,$a074
a054 2020      jr      nz,$a076
a056 2020      jr      nz,$a078
a058 2020      jr      nz,$a07a
a05a 2020      jr      nz,$a07c
a05c 2020      jr      nz,$a07e
a05e 2020      jr      nz,$a080
a060 2020      jr      nz,$a082
a062 2020      jr      nz,$a084
a064 2020      jr      nz,$a086
a066 2020      jr      nz,$a088
a068 2020      jr      nz,$a08a
a06a 2020      jr      nz,$a08c
a06c 2020      jr      nz,$a08e
a06e 2020      jr      nz,$a090
a070 2020      jr      nz,$a092
a072 2020      jr      nz,$a094
a074 2020      jr      nz,$a096
a076 2020      jr      nz,$a098
a078 2020      jr      nz,$a09a
a07a 2020      jr      nz,$a09c
a07c 2020      jr      nz,$a09e
a07e 2020      jr      nz,$a0a0
a080 2020      jr      nz,$a0a2
a082 2020      jr      nz,$a0a4
a084 2020      jr      nz,$a0a6
a086 2020      jr      nz,$a0a8
a088 2020      jr      nz,$a0aa
a08a 2020      jr      nz,$a0ac
a08c 2020      jr      nz,$a0ae
a08e 2020      jr      nz,$a0b0
a090 2020      jr      nz,$a0b2
a092 2020      jr      nz,$a0b4
a094 2020      jr      nz,$a0b6
a096 2020      jr      nz,$a0b8
a098 2020      jr      nz,$a0ba
a09a 2020      jr      nz,$a0bc
a09c 2020      jr      nz,$a0be
a09e 2020      jr      nz,$a0c0
a0a0 2020      jr      nz,$a0c2
a0a2 2020      jr      nz,$a0c4
a0a4 2020      jr      nz,$a0c6
a0a6 2020      jr      nz,$a0c8
a0a8 2020      jr      nz,$a0ca
a0aa 2020      jr      nz,$a0cc
a0ac 2020      jr      nz,$a0ce
a0ae 2020      jr      nz,$a0d0
a0b0 2020      jr      nz,$a0d2
a0b2 2020      jr      nz,$a0d4
a0b4 2020      jr      nz,$a0d6
a0b6 2020      jr      nz,$a0d8
a0b8 2020      jr      nz,$a0da
a0ba 2020      jr      nz,$a0dc
a0bc 2020      jr      nz,$a0de
a0be 2020      jr      nz,$a0e0
a0c0 2020      jr      nz,$a0e2
a0c2 2020      jr      nz,$a0e4
a0c4 2020      jr      nz,$a0e6
a0c6 2020      jr      nz,$a0e8
a0c8 2020      jr      nz,$a0ea
a0ca 2020      jr      nz,$a0ec
a0cc 2020      jr      nz,$a0ee
a0ce 2020      jr      nz,$a0f0
a0d0 2020      jr      nz,$a0f2
a0d2 2020      jr      nz,$a0f4
a0d4 2020      jr      nz,$a0f6
a0d6 2020      jr      nz,$a0f8
a0d8 2020      jr      nz,$a0fa
a0da 2020      jr      nz,$a0fc
a0dc 2020      jr      nz,$a0fe
a0de 2020      jr      nz,$a100
a0e0 2020      jr      nz,$a102
a0e2 2020      jr      nz,$a104
a0e4 2020      jr      nz,$a106
a0e6 2020      jr      nz,$a108
a0e8 2020      jr      nz,$a10a
a0ea 2020      jr      nz,$a10c
a0ec 2020      jr      nz,$a10e
a0ee 2020      jr      nz,$a110
a0f0 2020      jr      nz,$a112
a0f2 2020      jr      nz,$a114
a0f4 2020      jr      nz,$a116
a0f6 2020      jr      nz,$a118
a0f8 2020      jr      nz,$a11a
a0fa 2020      jr      nz,$a11c
a0fc 2020      jr      nz,$a11e
a0fe 2020      jr      nz,$a120
a100 2020      jr      nz,$a122
a102 2020      jr      nz,$a124
a104 2020      jr      nz,$a126
a106 2020      jr      nz,$a128
a108 2020      jr      nz,$a12a
a10a 2020      jr      nz,$a12c
a10c 2020      jr      nz,$a12e
a10e 2020      jr      nz,$a130
a110 2020      jr      nz,$a132
a112 2020      jr      nz,$a134
a114 2020      jr      nz,$a136
a116 2020      jr      nz,$a138
a118 2020      jr      nz,$a13a
a11a 2020      jr      nz,$a13c
a11c 2020      jr      nz,$a13e
a11e 2020      jr      nz,$a140
a120 2020      jr      nz,$a142
a122 2020      jr      nz,$a144
a124 2020      jr      nz,$a146
a126 2020      jr      nz,$a148
a128 2020      jr      nz,$a14a
a12a 2020      jr      nz,$a14c
a12c 2020      jr      nz,$a14e
a12e 2020      jr      nz,$a150
a130 2020      jr      nz,$a152
a132 2020      jr      nz,$a154
a134 2020      jr      nz,$a156
a136 2020      jr      nz,$a158
a138 2020      jr      nz,$a15a
a13a 2020      jr      nz,$a15c
a13c 2020      jr      nz,$a15e
a13e 2020      jr      nz,$a160
a140 2020      jr      nz,$a162
a142 2020      jr      nz,$a164
a144 2020      jr      nz,$a166
a146 2020      jr      nz,$a168
a148 2020      jr      nz,$a16a
a14a 2020      jr      nz,$a16c
a14c 2020      jr      nz,$a16e
a14e 2020      jr      nz,$a170
a150 2020      jr      nz,$a172
a152 2020      jr      nz,$a174
a154 2020      jr      nz,$a176
a156 2020      jr      nz,$a178
a158 2020      jr      nz,$a17a
a15a 2020      jr      nz,$a17c
a15c 2020      jr      nz,$a17e
a15e 2020      jr      nz,$a180
a160 2020      jr      nz,$a182
a162 2020      jr      nz,$a184
a164 2020      jr      nz,$a186
a166 2020      jr      nz,$a188
a168 2020      jr      nz,$a18a
a16a 2020      jr      nz,$a18c
a16c 2020      jr      nz,$a18e
a16e 2020      jr      nz,$a190
a170 2020      jr      nz,$a192
a172 2020      jr      nz,$a194
a174 2020      jr      nz,$a196
a176 2020      jr      nz,$a198
a178 2020      jr      nz,$a19a
a17a 2020      jr      nz,$a19c
a17c 2020      jr      nz,$a19e
a17e 2020      jr      nz,$a1a0
a180 2020      jr      nz,$a1a2
a182 2020      jr      nz,$a1a4
a184 2020      jr      nz,$a1a6
a186 2020      jr      nz,$a1a8
a188 2020      jr      nz,$a1aa
a18a 2020      jr      nz,$a1ac
a18c 2020      jr      nz,$a1ae
a18e 2020      jr      nz,$a1b0
a190 2020      jr      nz,$a1b2
a192 2020      jr      nz,$a1b4
a194 2020      jr      nz,$a1b6
a196 2020      jr      nz,$a1b8
a198 2020      jr      nz,$a1ba
a19a 2020      jr      nz,$a1bc
a19c 2020      jr      nz,$a1be
a19e 2020      jr      nz,$a1c0
a1a0 2020      jr      nz,$a1c2
a1a2 2020      jr      nz,$a1c4
a1a4 2020      jr      nz,$a1c6
a1a6 2020      jr      nz,$a1c8
a1a8 2020      jr      nz,$a1ca
a1aa 2020      jr      nz,$a1cc
a1ac 2020      jr      nz,$a1ce
a1ae 2020      jr      nz,$a1d0
a1b0 2020      jr      nz,$a1d2
a1b2 2020      jr      nz,$a1d4
a1b4 2020      jr      nz,$a1d6
a1b6 2020      jr      nz,$a1d8
a1b8 2020      jr      nz,$a1da
a1ba 2020      jr      nz,$a1dc
a1bc 2020      jr      nz,$a1de
a1be 2020      jr      nz,$a1e0
a1c0 2020      jr      nz,$a1e2
a1c2 2020      jr      nz,$a1e4
a1c4 2020      jr      nz,$a1e6
a1c6 2020      jr      nz,$a1e8
a1c8 2020      jr      nz,$a1ea
a1ca 2020      jr      nz,$a1ec
a1cc 2020      jr      nz,$a1ee
a1ce 2020      jr      nz,$a1f0
a1d0 2020      jr      nz,$a1f2
a1d2 2020      jr      nz,$a1f4
a1d4 2020      jr      nz,$a1f6
a1d6 2020      jr      nz,$a1f8
a1d8 2020      jr      nz,$a1fa
a1da 2020      jr      nz,$a1fc
a1dc 2020      jr      nz,$a1fe
a1de 2020      jr      nz,$a200
a1e0 2020      jr      nz,$a202
a1e2 2020      jr      nz,$a204
a1e4 2020      jr      nz,$a206
a1e6 2020      jr      nz,$a208
a1e8 2020      jr      nz,$a20a
a1ea 2020      jr      nz,$a20c
a1ec 2020      jr      nz,$a20e
a1ee 2020      jr      nz,$a210
a1f0 2020      jr      nz,$a212
a1f2 2020      jr      nz,$a214
a1f4 2020      jr      nz,$a216
a1f6 2020      jr      nz,$a218
a1f8 2020      jr      nz,$a21a
a1fa 2020      jr      nz,$a21c
a1fc 2020      jr      nz,$a21e
a1fe 2020      jr      nz,$a220
a200 2020      jr      nz,$a222
a202 2020      jr      nz,$a224
a204 2020      jr      nz,$a226
a206 2020      jr      nz,$a228
a208 2000      jr      nz,$a20a
a20a 00        nop     
a20b 00        nop     
a20c 00        nop     
a20d 00        nop     
a20e 00        nop     
a20f 00        nop     
a210 00        nop     
a211 00        nop     
a212 00        nop     
a213 00        nop     
a214 00        nop     
a215 00        nop     
a216 00        nop     
a217 00        nop     
a218 00        nop     
a219 00        nop     
a21a 00        nop     
a21b 00        nop     
a21c 00        nop     
a21d 00        nop     
a21e 00        nop     
a21f 00        nop     
a220 00        nop     
a221 00        nop     
a222 00        nop     
a223 00        nop     
a224 00        nop     
a225 00        nop     
a226 00        nop     
a227 00        nop     
a228 00        nop     
a229 00        nop     
a22a 00        nop     
a22b 00        nop     
a22c 00        nop     
a22d 00        nop     
a22e 00        nop     
a22f 00        nop     
a230 00        nop     
a231 00        nop     
a232 00        nop     
a233 00        nop     
a234 00        nop     
a235 00        nop     
a236 00        nop     
a237 00        nop     
a238 00        nop     
a239 00        nop     
a23a 00        nop     
a23b 00        nop     
a23c 00        nop     
a23d 00        nop     
a23e 00        nop     
a23f 00        nop     
a240 00        nop     
a241 00        nop     
a242 00        nop     
a243 00        nop     
a244 00        nop     
a245 00        nop     
a246 00        nop     
a247 00        nop     
a248 00        nop     
a249 00        nop     
a24a 00        nop     
a24b 00        nop     
a24c 00        nop     
a24d 00        nop     
a24e 00        nop     
a24f 00        nop     
a250 00        nop     
a251 00        nop     
a252 00        nop     
a253 00        nop     
a254 00        nop     
a255 00        nop     
a256 00        nop     
a257 00        nop     
a258 00        nop     
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
a289 2640      ld      h,$40
a28b 00        nop     
a28c 00        nop     
a28d 00        nop     
a28e 00        nop     
a28f 00        nop     
a290 00        nop     
a291 00        nop     
a292 00        nop     
a293 00        nop     
a294 00        nop     
a295 00        nop     
a296 00        nop     
a297 00        nop     
a298 00        nop     
a299 00        nop     
a29a 0a        ld      a,(bc)
a29b d7        rst     $10
a29c 23        inc     hl
a29d 7b        ld      a,e
a29e 02        ld      (bc),a
a29f 00        nop     
a2a0 02        ld      (bc),a
a2a1 00        nop     
a2a2 08        ex      af,af'
a2a3 00        nop     
a2a4 00        nop     
a2a5 00        nop     
a2a6 00        nop     
a2a7 00        nop     
a2a8 00        nop     
a2a9 00        nop     
a2aa 00        nop     
a2ab 00        nop     
a2ac 00        nop     
a2ad 00        nop     
a2ae 00        nop     
a2af 00        nop     
a2b0 00        nop     
a2b1 00        nop     
a2b2 00        nop     
a2b3 00        nop     
a2b4 00        nop     
a2b5 00        nop     
a2b6 00        nop     
a2b7 00        nop     
a2b8 00        nop     
a2b9 00        nop     
a2ba 00        nop     
a2bb 00        nop     
a2bc 00        nop     
a2bd 00        nop     
a2be 00        nop     
a2bf 00        nop     
a2c0 00        nop     
a2c1 00        nop     
a2c2 00        nop     
a2c3 00        nop     
a2c4 00        nop     
a2c5 00        nop     
a2c6 00        nop     
a2c7 00        nop     
a2c8 00        nop     
a2c9 00        nop     
a2ca 00        nop     
a2cb 00        nop     
a2cc 00        nop     
a2cd 00        nop     
a2ce 00        nop     
a2cf 00        nop     
a2d0 00        nop     
a2d1 00        nop     
a2d2 00        nop     
a2d3 00        nop     
a2d4 00        nop     
a2d5 00        nop     
a2d6 81        add     a,c
a2d7 00        nop     
a2d8 00        nop     
a2d9 40        ld      b,b
a2da 80        add     a,b
a2db 00        nop     
a2dc 00        nop     
a2dd 40        ld      b,b
a2de 80        add     a,b
a2df 00        nop     
a2e0 00        nop     
a2e1 00        nop     
a2e2 00        nop     
a2e3 00        nop     
a2e4 00        nop     
a2e5 00        nop     
a2e6 00        nop     
a2e7 00        nop     
a2e8 00        nop     
a2e9 00        nop     
a2ea 00        nop     
a2eb 00        nop     
a2ec 00        nop     
a2ed 00        nop     
a2ee 00        nop     
a2ef 00        nop     
a2f0 00        nop     
a2f1 00        nop     
a2f2 00        nop     
a2f3 00        nop     
a2f4 00        nop     
a2f5 00        nop     
a2f6 00        nop     
a2f7 00        nop     
a2f8 00        nop     
a2f9 00        nop     
a2fa 00        nop     
a2fb 00        nop     
a2fc 00        nop     
a2fd 00        nop     
a2fe 00        nop     
a2ff 00        nop     
a300 00        nop     
a301 cdcdcd    call    $cdcd
a304 cdcdcd    call    $cdcd
a307 cdcdcd    call    $cdcd
a30a cdcdcd    call    $cdcd
a30d cdcd0f    call    $0fcd
a310 a3        and     e
a311 e4ad49    call    po,$49ad
a314 4e        ld      c,(hl)
a315 49        ld      c,c
a316 54        ld      d,h
a317 41        ld      b,c
a318 4c        ld      c,h
a319 2020      jr      nz,$a33b
a31b 3a948d    ld      a,($8d94)
a31e b7        or      a
a31f c26fa3    jp      nz,$a36f
a322 3eff      ld      a,$ff
a324 32948d    ld      ($8d94),a
a327 0160a6    ld      bc,$a660
a32a 1100ad    ld      de,$ad00
a32d 21648c    ld      hl,$8c64
a330 cd383a    call    $3a38
a333 cd18a7    call    $a718
a336 210100    ld      hl,$0001
a339 224bac    ld      ($ac4b),hl
a33c 2a4bac    ld      hl,($ac4b)
a33f 2b        dec     hl
a340 224dac    ld      ($ac4d),hl
a343 214dac    ld      hl,$ac4d
a346 cd6d5b    call    $5b6d
a349 324fac    ld      ($ac4f),a
a34c b7        or      a
a34d c266a3    jp      nz,$a366
a350 2a4bac    ld      hl,($ac4b)
a353 23        inc     hl
a354 3e03      ld      a,$03
a356 95        sub     l
a357 3e00      ld      a,$00
a359 9c        sbc     a,h
a35a f239a3    jp      p,$a339
a35d 2150ac    ld      hl,$ac50
a360 cd3556    call    $5635
a363 cd0975    call    $7509
a366 cd3ea7    call    $a73e
a369 cde3a6    call    $a6e3
a36c c372a3    jp      $a372
a36f cdc8a9    call    $a9c8
a372 3eff      ld      a,$ff
a374 32a9a2    ld      ($a2a9),a
a377 3eff      ld      a,$ff
a379 32aaa2    ld      ($a2aa),a
a37c af        xor     a
a37d 32a5a2    ld      ($a2a5),a
a380 af        xor     a
a381 32a6a2    ld      ($a2a6),a
a384 af        xor     a
a385 323b8c    ld      ($8c3b),a
a388 af        xor     a
a389 323c8c    ld      ($8c3c),a
a38c af        xor     a
a38d 323d8c    ld      ($8c3d),a
a390 af        xor     a
a391 32578c    ld      ($8c57),a
a394 3eff      ld      a,$ff
a396 32588c    ld      ($8c58),a
a399 3eff      ld      a,$ff
a39b 32598c    ld      ($8c59),a
a39e af        xor     a
a39f 325a8c    ld      ($8c5a),a
a3a2 af        xor     a
a3a3 325b8c    ld      ($8c5b),a
a3a6 210000    ld      hl,$0000
a3a9 225c8c    ld      ($8c5c),hl
a3ac 210000    ld      hl,$0000
a3af 225e8c    ld      ($8c5e),hl
a3b2 211400    ld      hl,$0014
a3b5 22608c    ld      ($8c60),hl
a3b8 211400    ld      hl,$0014
a3bb 22628c    ld      ($8c62),hl
a3be af        xor     a
a3bf 32b78d    ld      ($8db7),a
a3c2 af        xor     a
a3c3 32bc8d    ld      ($8dbc),a
a3c6 3e20      ld      a,$20
a3c8 32be8d    ld      ($8dbe),a
a3cb 3e2c      ld      a,$2c
a3cd 32bf8d    ld      ($8dbf),a
a3d0 015ca6    ld      bc,$a65c
a3d3 11e9ac    ld      de,$ace9
a3d6 21c08d    ld      hl,$8dc0
a3d9 cd383a    call    $3a38
a3dc af        xor     a
a3dd 32858d    ld      ($8d85),a
a3e0 af        xor     a
a3e1 32868d    ld      ($8d86),a
a3e4 af        xor     a
a3e5 32878d    ld      ($8d87),a
a3e8 3eff      ld      a,$ff
a3ea 32848d    ld      ($8d84),a
a3ed 3eff      ld      a,$ff
a3ef 328b8d    ld      ($8d8b),a
a3f2 af        xor     a
a3f3 328c8d    ld      ($8d8c),a
a3f6 3eff      ld      a,$ff
a3f8 328d8d    ld      ($8d8d),a
a3fb 3eff      ld      a,$ff
a3fd 32958d    ld      ($8d95),a
a400 af        xor     a
a401 32968d    ld      ($8d96),a
a404 3eff      ld      a,$ff
a406 328f8d    ld      ($8d8f),a
a409 3eff      ld      a,$ff
a40b 32908d    ld      ($8d90),a
a40e 3eff      ld      a,$ff
a410 32918d    ld      ($8d91),a
a413 3eff      ld      a,$ff
a415 32928d    ld      ($8d92),a
a418 3eff      ld      a,$ff
a41a 32938d    ld      ($8d93),a
a41d af        xor     a
a41e 32978d    ld      ($8d97),a
a421 af        xor     a
a422 32988d    ld      ($8d98),a
a425 af        xor     a
a426 32998d    ld      ($8d99),a
a429 2166a6    ld      hl,$a666
a42c cd2380    call    $8023
a42f 219aa2    ld      hl,$a29a
a432 cd1480    call    $8014
a435 3eff      ld      a,$ff
a437 329a8d    ld      ($8d9a),a
a43a 3eff      ld      a,$ff
a43c 329b8d    ld      ($8d9b),a
a43f af        xor     a
a440 329c8d    ld      ($8d9c),a
a443 210a00    ld      hl,$000a
a446 225c8d    ld      ($8d5c),hl
a449 210a00    ld      hl,$000a
a44c 225e8d    ld      ($8d5e),hl
a44f 210100    ld      hl,$0001
a452 22608d    ld      ($8d60),hl
a455 210100    ld      hl,$0001
a458 22628d    ld      ($8d62),hl
a45b 210500    ld      hl,$0005
a45e 22248d    ld      ($8d24),hl
a461 210500    ld      hl,$0005
a464 22348d    ld      ($8d34),hl
a467 211400    ld      hl,$0014
a46a 22648d    ld      ($8d64),hl
a46d 215100    ld      hl,$0051
a470 22668d    ld      ($8d66),hl
a473 211500    ld      hl,$0015
a476 22688d    ld      ($8d68),hl
a479 2148a6    ld      hl,$a648
a47c cd2380    call    $8023
a47f 216a8d    ld      hl,$8d6a
a482 cd1480    call    $8014
a485 2138ad    ld      hl,$ad38
a488 cd2380    call    $8023
a48b 216e8d    ld      hl,$8d6e
a48e cd1480    call    $8014
a491 213cad    ld      hl,$ad3c
a494 cd2380    call    $8023
a497 21728d    ld      hl,$8d72
a49a cd1480    call    $8014
a49d 2140ad    ld      hl,$ad40
a4a0 cd2380    call    $8023
a4a3 21768d    ld      hl,$8d76
a4a6 cd1480    call    $8014
a4a9 210000    ld      hl,$0000
a4ac 227a8d    ld      ($8d7a),hl
a4af 210100    ld      hl,$0001
a4b2 22eb8b    ld      ($8beb),hl
a4b5 210100    ld      hl,$0001
a4b8 22ed8b    ld      ($8bed),hl
a4bb 210100    ld      hl,$0001
a4be 22ef8b    ld      ($8bef),hl
a4c1 210100    ld      hl,$0001
a4c4 22f18b    ld      ($8bf1),hl
a4c7 210000    ld      hl,$0000
a4ca 22f38b    ld      ($8bf3),hl
a4cd af        xor     a
a4ce 32f58b    ld      ($8bf5),a
a4d1 210000    ld      hl,$0000
a4d4 22a08d    ld      ($8da0),hl
a4d7 210000    ld      hl,$0000
a4da 22a28d    ld      ($8da2),hl
a4dd 210200    ld      hl,$0002
a4e0 22f68b    ld      ($8bf6),hl
a4e3 210100    ld      hl,$0001
a4e6 227c8d    ld      ($8d7c),hl
a4e9 2144ad    ld      hl,$ad44
a4ec cd2380    call    $8023
a4ef 21028c    ld      hl,$8c02
a4f2 cd1480    call    $8014
a4f5 216ea6    ld      hl,$a66e
a4f8 cd2380    call    $8023
a4fb 21fc8b    ld      hl,$8bfc
a4fe cd1480    call    $8014
a501 2148ad    ld      hl,$ad48
a504 cd2380    call    $8023
a507 21068c    ld      hl,$8c06
a50a cd1480    call    $8014
a50d 2154ad    ld      hl,$ad54
a510 cd2380    call    $8023
a513 21128c    ld      hl,$8c12
a516 cd1480    call    $8014
a519 214cad    ld      hl,$ad4c
a51c cd2380    call    $8023
a51f 210a8c    ld      hl,$8c0a
a522 cd1480    call    $8014
a525 2150ad    ld      hl,$ad50
a528 cd2380    call    $8023
a52b 210e8c    ld      hl,$8c0e
a52e cd1480    call    $8014
a531 2144a6    ld      hl,$a644
a534 cd2380    call    $8023
a537 21168c    ld      hl,$8c16
a53a cd1480    call    $8014
a53d 2172a6    ld      hl,$a672
a540 cd2380    call    $8023
a543 211a8c    ld      hl,$8c1a
a546 cd1480    call    $8014
a549 2144a6    ld      hl,$a644
a54c cd2380    call    $8023
a54f 211e8c    ld      hl,$8c1e
a552 cd1480    call    $8014
a555 2176a6    ld      hl,$a676
a558 cd2380    call    $8023
a55b 21228c    ld      hl,$8c22
a55e cd1480    call    $8014
a561 2144a6    ld      hl,$a644
a564 cd2380    call    $8023
a567 21268c    ld      hl,$8c26
a56a cd1480    call    $8014
a56d 210100    ld      hl,$0001
a570 222e8c    ld      ($8c2e),hl
a573 210100    ld      hl,$0001
a576 22308c    ld      ($8c30),hl
a579 210100    ld      hl,$0001
a57c 22328c    ld      ($8c32),hl
a57f 210100    ld      hl,$0001
a582 22348c    ld      ($8c34),hl
a585 210100    ld      hl,$0001
a588 22368c    ld      ($8c36),hl
a58b af        xor     a
a58c 328ca2    ld      ($a28c),a
a58f 3eff      ld      a,$ff
a591 328ba2    ld      ($a28b),a
a594 af        xor     a
a595 3295a2    ld      ($a295),a
a598 216aa6    ld      hl,$a66a
a59b cd956c    call    $6c95
a59e 1150a6    ld      de,$a650
a5a1 2154a6    ld      hl,$a654
a5a4 cd296b    call    $6b29
a5a7 017aa6    ld      bc,$a67a
a5aa 1158a6    ld      de,$a658
a5ad 2123ac    ld      hl,$ac23
a5b0 cd8ea6    call    $a68e
a5b3 117ea6    ld      de,$a67e
a5b6 2123ac    ld      hl,$ac23
a5b9 cd756b    call    $6b75
a5bc 1182a6    ld      de,$a682
a5bf 2158ad    ld      hl,$ad58
a5c2 cd756b    call    $6b75
a5c5 1182a6    ld      de,$a682
a5c8 2180ad    ld      hl,$ad80
a5cb cd756b    call    $6b75
a5ce 1182a6    ld      de,$a682
a5d1 21a8ad    ld      hl,$ada8
a5d4 cd756b    call    $6b75
a5d7 014ca6    ld      bc,$a64c
a5da 1158a6    ld      de,$a658
a5dd 2123ac    ld      hl,$ac23
a5e0 cd8ea6    call    $a68e
a5e3 1158a6    ld      de,$a658
a5e6 21d0ad    ld      hl,$add0
a5e9 cd756b    call    $6b75
a5ec 0186a6    ld      bc,$a686
a5ef 1158a6    ld      de,$a658
a5f2 2123ac    ld      hl,$ac23
a5f5 cd8ea6    call    $a68e
a5f8 115ca6    ld      de,$a65c
a5fb 2123ac    ld      hl,$ac23
a5fe cd756b    call    $6b75
a601 018aa6    ld      bc,$a68a
a604 1158a6    ld      de,$a658
a607 2123ac    ld      hl,$ac23
a60a cd8ea6    call    $a68e
a60d 2a688d    ld      hl,($8d68)
a610 22a2a2    ld      ($a2a2),hl
a613 2164a6    ld      hl,$a664
a616 cd8f5b    call    $5b8f
a619 2154a6    ld      hl,$a654
a61c cdefab    call    $abef
a61f 1172ac    ld      de,$ac72
a622 216eac    ld      hl,$ac6e
a625 cd74ab    call    $ab74
a628 1172ac    ld      de,$ac72
a62b 216eac    ld      hl,$ac6e
a62e cd10ab    call    $ab10
a631 0176ac    ld      bc,$ac76
a634 116eac    ld      de,$ac6e
a637 2148a6    ld      hl,$a648
a63a cdcdaa    call    $aacd
a63d 2144a6    ld      hl,$a644
a640 cd2f40    call    $402f
a643 c9        ret     

a644 00        nop     
a645 00        nop     
a646 00        nop     
a647 81        add     a,c
a648 00        nop     
a649 00        nop     
a64a 00        nop     
a64b 00        nop     
a64c 02        ld      (bc),a
a64d 00        nop     
a64e 00        nop     
a64f 00        nop     
a650 010000    ld      bc,$0000
a653 00        nop     
a654 00        nop     
a655 00        nop     
a656 00        nop     
a657 00        nop     
a658 14        inc     d
a659 00        nop     
a65a 00        nop     
a65b 00        nop     
a65c 03        inc     bc
a65d 00        nop     
a65e 00        nop     
a65f 00        nop     
a660 3800      jr      c,$a662
a662 00        nop     
a663 00        nop     
a664 00        nop     
a665 00        nop     
a666 0a        ld      a,(bc)
a667 d7        rst     $10
a668 23        inc     hl
a669 7b        ld      a,e
a66a 05        dec     b
a66b 00        nop     
a66c 00        nop     
a66d 00        nop     
a66e 00        nop     
a66f 00        nop     
a670 80        add     a,b
a671 81        add     a,c
a672 33        inc     sp
a673 33        inc     sp
a674 33        inc     sp
a675 81        add     a,c
a676 00        nop     
a677 00        nop     
a678 00        nop     
a679 82        add     a,d
a67a 1d        dec     e
a67b 00        nop     
a67c 00        nop     
a67d 00        nop     
a67e 08        ex      af,af'
a67f 00        nop     
a680 00        nop     
a681 00        nop     
a682 2800      jr      z,$a684
a684 00        nop     
a685 00        nop     
a686 9b        sbc     a,e
a687 00        nop     
a688 00        nop     
a689 00        nop     
a68a 0600      ld      b,$00
a68c 00        nop     
a68d 00        nop     
a68e 227bac    ld      ($ac7b),hl
a691 eb        ex      de,hl
a692 227dac    ld      ($ac7d),hl
a695 60        ld      h,b
a696 69        ld      l,c
a697 227fac    ld      ($ac7f),hl
a69a 210100    ld      hl,$0001
a69d 2281ac    ld      ($ac81),hl
a6a0 2a7dac    ld      hl,($ac7d)
a6a3 eb        ex      de,hl
a6a4 2a7bac    ld      hl,($ac7b)
a6a7 cd756b    call    $6b75
a6aa 2a81ac    ld      hl,($ac81)
a6ad 23        inc     hl
a6ae eb        ex      de,hl
a6af 2a7fac    ld      hl,($ac7f)
a6b2 7e        ld      a,(hl)
a6b3 23        inc     hl
a6b4 66        ld      h,(hl)
a6b5 6f        ld      l,a
a6b6 eb        ex      de,hl
a6b7 7b        ld      a,e
a6b8 95        sub     l
a6b9 7a        ld      a,d
a6ba 9c        sbc     a,h
a6bb f29da6    jp      p,$a69d
a6be c9        ret     

a6bf 21dba6    ld      hl,$a6db
a6c2 cd956c    call    $6c95
a6c5 cd6b6f    call    $6f6b
a6c8 cdfaab    call    $abfa
a6cb 21dfa6    ld      hl,$a6df
a6ce cd956c    call    $6c95
a6d1 cd6b6f    call    $6f6b
a6d4 cdfaab    call    $abfa
a6d7 cd29a9    call    $a929
a6da c9        ret     

a6db 05        dec     b
a6dc 00        nop     
a6dd 00        nop     
a6de 00        nop     
a6df 0600      ld      b,$00
a6e1 00        nop     
a6e2 00        nop     
a6e3 1186ac    ld      de,$ac86
a6e6 21a18e    ld      hl,$8ea1
a6e9 cd0da9    call    $a90d
a6ec 2f        cpl     
a6ed 3288ac    ld      ($ac88),a
a6f0 b7        or      a
a6f1 caf5a6    jp      z,$a6f5
a6f4 c9        ret     

a6f5 2112a7    ld      hl,$a712
a6f8 cd956c    call    $6c95
a6fb 0116a7    ld      bc,$a716
a6fe 1186ac    ld      de,$ac86
a701 21a18e    ld      hl,$8ea1
a704 cd5e6e    call    $6e5e
a707 3e01      ld      a,$01
a709 323a8c    ld      ($8c3a),a
a70c 3eff      ld      a,$ff
a70e 32b68d    ld      ($8db6),a
a711 c9        ret     

a712 010000    ld      bc,$0000
a715 00        nop     
a716 00        nop     
a717 00        nop     
a718 013aa7    ld      bc,$a73a
a71b 11ecac    ld      de,$acec
a71e 21d897    ld      hl,$97d8
a721 cd383a    call    $3a38
a724 0136a7    ld      bc,$a736
a727 11efac    ld      de,$acef
a72a 219c8c    ld      hl,$8c9c
a72d cd383a    call    $3a38
a730 3e20      ld      a,$20
a732 32a08c    ld      ($8ca0),a
a735 c9        ret     

a736 04        inc     b
a737 00        nop     
a738 00        nop     
a739 00        nop     
a73a 14        inc     d
a73b 00        nop     
a73c 00        nop     
a73d 00        nop     
a73e 218bac    ld      hl,$ac8b
a741 cd6a73    call    $736a
a744 2a8bac    ld      hl,($ac8b)
a747 1124fb    ld      de,$fb24
a74a 19        add     hl,de
a74b 228bac    ld      ($ac8b),hl
a74e eb        ex      de,hl
a74f 218000    ld      hl,$0080
a752 cd777e    call    $7e77
a755 228bac    ld      ($ac8b),hl
a758 7d        ld      a,l
a759 07        rlca    
a75a b5        or      l
a75b e67f      and     $7f
a75d b4        or      h
a75e 3d        dec     a
a75f c681      add     a,$81
a761 9f        sbc     a,a
a762 328dac    ld      ($ac8d),a
a765 b7        or      a
a766 ca72a7    jp      z,$a772
a769 cd2e7d    call    $7d2e
a76c 4d        ld      c,l
a76d 45        ld      b,l
a76e 4d        ld      c,l
a76f 4f        ld      c,a
a770 52        ld      d,d
a771 59        ld      e,c
a772 2a8bac    ld      hl,($ac8b)
a775 eb        ex      de,hl
a776 210400    ld      hl,$0004
a779 cd777e    call    $7e77
a77c 228eac    ld      ($ac8e),hl
a77f 210100    ld      hl,$0001
a782 eb        ex      de,hl
a783 2a8eac    ld      hl,($ac8e)
a786 7b        ld      a,e
a787 95        sub     l
a788 6f        ld      l,a
a789 7a        ld      a,d
a78a 9c        sbc     a,h
a78b 67        ld      h,a
a78c eb        ex      de,hl
a78d 2a8bac    ld      hl,($ac8b)
a790 19        add     hl,de
a791 2290ac    ld      ($ac90),hl
a794 2a8eac    ld      hl,($ac8e)
a797 23        inc     hl
a798 228eac    ld      ($ac8e),hl
a79b 21f5a8    ld      hl,$a8f5
a79e cd956c    call    $6c95
a7a1 01e1a8    ld      bc,$a8e1
a7a4 11e5a8    ld      de,$a8e5
a7a7 2192ac    ld      hl,$ac92
a7aa cd5e6e    call    $6e5e
a7ad 11f9a8    ld      de,$a8f9
a7b0 2190ac    ld      hl,$ac90
a7b3 cdd26e    call    $6ed2
a7b6 cd1e6b    call    $6b1e
a7b9 01fba8    ld      bc,$a8fb
a7bc 11f1a8    ld      de,$a8f1
a7bf 21cc8c    ld      hl,$8ccc
a7c2 cde36a    call    $6ae3
a7c5 01fba8    ld      bc,$a8fb
a7c8 11f1a8    ld      de,$a8f1
a7cb 21c48c    ld      hl,$8cc4
a7ce cde36a    call    $6ae3
a7d1 01fba8    ld      bc,$a8fb
a7d4 11f1a8    ld      de,$a8f1
a7d7 21d48c    ld      hl,$8cd4
a7da cde36a    call    $6ae3
a7dd 01fba8    ld      bc,$a8fb
a7e0 11dda8    ld      de,$a8dd
a7e3 21dc8c    ld      hl,$8cdc
a7e6 cde36a    call    $6ae3
a7e9 01fba8    ld      bc,$a8fb
a7ec 11f1a8    ld      de,$a8f1
a7ef 21ac8c    ld      hl,$8cac
a7f2 cde36a    call    $6ae3
a7f5 01fba8    ld      bc,$a8fb
a7f8 11f1a8    ld      de,$a8f1
a7fb 21a48c    ld      hl,$8ca4
a7fe cde36a    call    $6ae3
a801 01fba8    ld      bc,$a8fb
a804 11f1a8    ld      de,$a8f1
a807 21b48c    ld      hl,$8cb4
a80a cde36a    call    $6ae3
a80d 01fba8    ld      bc,$a8fb
a810 11dda8    ld      de,$a8dd
a813 21bc8c    ld      hl,$8cbc
a816 cde36a    call    $6ae3
a819 01e9a8    ld      bc,$a8e9
a81c 11dda8    ld      de,$a8dd
a81f 21e48c    ld      hl,$8ce4
a822 cde36a    call    $6ae3
a825 01e9a8    ld      bc,$a8e9
a828 11dda8    ld      de,$a8dd
a82b 21ec8c    ld      hl,$8cec
a82e cde36a    call    $6ae3
a831 01e9a8    ld      bc,$a8e9
a834 11dda8    ld      de,$a8dd
a837 21f48c    ld      hl,$8cf4
a83a cde36a    call    $6ae3
a83d 01e9a8    ld      bc,$a8e9
a840 11dda8    ld      de,$a8dd
a843 21fc8c    ld      hl,$8cfc
a846 cde36a    call    $6ae3
a849 01e9a8    ld      bc,$a8e9
a84c 11e1a8    ld      de,$a8e1
a84f 21048d    ld      hl,$8d04
a852 cde36a    call    $6ae3
a855 01e9a8    ld      bc,$a8e9
a858 11f1a8    ld      de,$a8f1
a85b 21a48d    ld      hl,$8da4
a85e cde36a    call    $6ae3
a861 01e1a8    ld      bc,$a8e1
a864 11ffa8    ld      de,$a8ff
a867 21148d    ld      hl,$8d14
a86a cde36a    call    $6ae3
a86d 01e1a8    ld      bc,$a8e1
a870 11ffa8    ld      de,$a8ff
a873 210c8d    ld      hl,$8d0c
a876 cde36a    call    $6ae3
a879 01e1a8    ld      bc,$a8e1
a87c 11ffa8    ld      de,$a8ff
a87f 211c8d    ld      hl,$8d1c
a882 cde36a    call    $6ae3
a885 01e9a8    ld      bc,$a8e9
a888 11fba8    ld      de,$a8fb
a88b 212c8d    ld      hl,$8d2c
a88e cde36a    call    $6ae3
a891 01e9a8    ld      bc,$a8e9
a894 11fba8    ld      de,$a8fb
a897 213c8d    ld      hl,$8d3c
a89a cde36a    call    $6ae3
a89d 01e9a8    ld      bc,$a8e9
a8a0 11fba8    ld      de,$a8fb
a8a3 218da2    ld      hl,$a28d
a8a6 cde36a    call    $6ae3
a8a9 01e9a8    ld      bc,$a8e9
a8ac 1103a9    ld      de,$a903
a8af 21448d    ld      hl,$8d44
a8b2 cde36a    call    $6ae3
a8b5 0107a9    ld      bc,$a907
a8b8 11f1a8    ld      de,$a8f1
a8bb 213f8c    ld      hl,$8c3f
a8be cde36a    call    $6ae3
a8c1 21eda8    ld      hl,$a8ed
a8c4 cd956c    call    $6c95
a8c7 01e1a8    ld      bc,$a8e1
a8ca 11e5a8    ld      de,$a8e5
a8cd 219dac    ld      hl,$ac9d
a8d0 cd5e6e    call    $6e5e
a8d3 110ba9    ld      de,$a90b
a8d6 218eac    ld      hl,$ac8e
a8d9 cdd26e    call    $6ed2
a8dc c9        ret     

a8dd 02        ld      (bc),a
a8de 00        nop     
a8df 00        nop     
a8e0 00        nop     
a8e1 010000    ld      bc,$0000
a8e4 00        nop     
a8e5 00        nop     
a8e6 00        nop     
a8e7 00        nop     
a8e8 00        nop     
a8e9 14        inc     d
a8ea 00        nop     
a8eb 00        nop     
a8ec 00        nop     
a8ed 0600      ld      b,$00
a8ef 00        nop     
a8f0 00        nop     
a8f1 04        inc     b
a8f2 00        nop     
a8f3 00        nop     
a8f4 00        nop     
a8f5 05        dec     b
a8f6 00        nop     
a8f7 00        nop     
a8f8 00        nop     
a8f9 ff        rst     $38
a8fa ff        rst     $38
a8fb 15        dec     d
a8fc 00        nop     
a8fd 00        nop     
a8fe 00        nop     
a8ff 51        ld      d,c
a900 00        nop     
a901 00        nop     
a902 00        nop     
a903 50        ld      d,b
a904 00        nop     
a905 00        nop     
a906 00        nop     
a907 1e00      ld      e,$00
a909 00        nop     
a90a 00        nop     
a90b 00        nop     
a90c 00        nop     
a90d 3a5c00    ld      a,($005c)
a910 12        ld      (de),a
a911 115d00    ld      de,$005d
a914 060b      ld      b,$0b
a916 0e00      ld      c,$00
a918 1a        ld      a,(de)
a919 77        ld      (hl),a
a91a fe20      cp      $20
a91c ca21a9    jp      z,$a921
a91f 0eff      ld      c,$ff
a921 23        inc     hl
a922 13        inc     de
a923 05        dec     b
a924 c218a9    jp      nz,$a918
a927 79        ld      a,c
a928 c9        ret     

a929 0e19      ld      c,$19
a92b cd0500    call    $0005
a92e f5        push    af
a92f 0e0d      ld      c,$0d
a931 cd0500    call    $0005
a934 110001    ld      de,$0100
a937 0e1a      ld      c,$1a
a939 cd0500    call    $0005
a93c f1        pop     af
a93d 5f        ld      e,a
a93e 0e0e      ld      c,$0e
a940 cd0500    call    $0005
a943 2a0600    ld      hl,($0006)
a946 2b        dec     hl
a947 f9        ld      sp,hl
a948 2e00      ld      l,$00
a94a 25        dec     h
a94b 0657      ld      b,$57
a94d 1172a9    ld      de,$a972
a950 eb        ex      de,hl
a951 d5        push    de
a952 cd69a9    call    $a969
a955 d1        pop     de
a956 d5        push    de
a957 0e0f      ld      c,$0f
a959 cd0500    call    $0005
a95c 3c        inc     a
a95d ca0000    jp      z,$0000
a960 d1        pop     de
a961 212100    ld      hl,$0021
a964 19        add     hl,de
a965 018000    ld      bc,$0080
a968 e9        jp      (hl)
a969 7e        ld      a,(hl)
a96a 12        ld      (de),a
a96b 13        inc     de
a96c 23        inc     hl
a96d 05        dec     b
a96e c269a9    jp      nz,$a969
a971 c9        ret     

a972 00        nop     
a973 43        ld      b,e
a974 42        ld      b,d
a975 53        ld      d,e
a976 4c        ld      c,h
a977 49        ld      c,c
a978 4e        ld      c,(hl)
a979 4b        ld      c,e
a97a 2043      jr      nz,$a9bf
a97c 4f        ld      c,a
a97d 4d        ld      c,l
a97e 00        nop     
a97f 00        nop     
a980 00        nop     
a981 00        nop     
a982 00        nop     
a983 00        nop     
a984 00        nop     
a985 00        nop     
a986 00        nop     
a987 00        nop     
a988 00        nop     
a989 00        nop     
a98a 00        nop     
a98b 00        nop     
a98c 00        nop     
a98d 00        nop     
a98e 00        nop     
a98f 00        nop     
a990 00        nop     
a991 00        nop     
a992 00        nop     
a993 d5        push    de
a994 218000    ld      hl,$0080
a997 09        add     hl,bc
a998 eb        ex      de,hl
a999 d5        push    de
a99a 0e1a      ld      c,$1a
a99c cd0500    call    $0005
a99f c1        pop     bc
a9a0 d1        pop     de
a9a1 d5        push    de
a9a2 c5        push    bc
a9a3 0e14      ld      c,$14
a9a5 cd0500    call    $0005
a9a8 c1        pop     bc
a9a9 d1        pop     de
a9aa b7        or      a
a9ab 212100    ld      hl,$0021
a9ae 19        add     hl,de
a9af e5        push    hl
a9b0 c8        ret     z

a9b1 eb        ex      de,hl
a9b2 f9        ld      sp,hl
a9b3 eb        ex      de,hl
a9b4 0e10      ld      c,$10
a9b6 cd0500    call    $0005
a9b9 210000    ld      hl,$0000
a9bc e5        push    hl
a9bd 118000    ld      de,$0080
a9c0 0e1a      ld      c,$1a
a9c2 cd0500    call    $0005
a9c5 c30001    jp      $0100
a9c8 21aeac    ld      hl,$acae
a9cb cd2380    call    $8023
a9ce 21458b    ld      hl,$8b45
a9d1 cd1480    call    $8014
a9d4 21aeac    ld      hl,$acae
a9d7 cd2380    call    $8023
a9da 21498b    ld      hl,$8b49
a9dd cd1480    call    $8014
a9e0 21aaac    ld      hl,$acaa
a9e3 cd2380    call    $8023
a9e6 21648b    ld      hl,$8b64
a9e9 cd1480    call    $8014
a9ec 21aaac    ld      hl,$acaa
a9ef cd2380    call    $8023
a9f2 21688b    ld      hl,$8b68
a9f5 cd1480    call    $8014
a9f8 af        xor     a
a9f9 32628b    ld      ($8b62),a
a9fc 3aa9ac    ld      a,($aca9)
a9ff 325f8b    ld      ($8b5f),a
aa02 3e01      ld      a,$01
aa04 32758b    ld      ($8b75),a
aa07 21a9aa    ld      hl,$aaa9
aa0a cd2380    call    $8023
aa0d 21d7a2    ld      hl,$a2d7
aa10 cd1480    call    $8014
aa13 21aaac    ld      hl,$acaa
aa16 cd2380    call    $8023
aa19 21cba2    ld      hl,$a2cb
aa1c cd1480    call    $8014
aa1f 21aaac    ld      hl,$acaa
aa22 cd2380    call    $8023
aa25 21cfa2    ld      hl,$a2cf
aa28 cd1480    call    $8014
aa2b 21aeac    ld      hl,$acae
aa2e cd2380    call    $8023
aa31 21d3a2    ld      hl,$a2d3
aa34 cd1480    call    $8014
aa37 210100    ld      hl,$0001
aa3a 22b2ac    ld      ($acb2),hl
aa3d 2ab2ac    ld      hl,($acb2)
aa40 29        add     hl,hl
aa41 29        add     hl,hl
aa42 11e18a    ld      de,$8ae1
aa45 19        add     hl,de
aa46 22b4ac    ld      ($acb4),hl
aa49 21aaac    ld      hl,$acaa
aa4c cd2380    call    $8023
aa4f 2ab4ac    ld      hl,($acb4)
aa52 cd1480    call    $8014
aa55 2ab2ac    ld      hl,($acb2)
aa58 29        add     hl,hl
aa59 29        add     hl,hl
aa5a 11e58a    ld      de,$8ae5
aa5d 19        add     hl,de
aa5e 22b4ac    ld      ($acb4),hl
aa61 21aeac    ld      hl,$acae
aa64 cd2380    call    $8023
aa67 2ab4ac    ld      hl,($acb4)
aa6a cd1480    call    $8014
aa6d 2ab2ac    ld      hl,($acb2)
aa70 23        inc     hl
aa71 23        inc     hl
aa72 3e18      ld      a,$18
aa74 95        sub     l
aa75 3e00      ld      a,$00
aa77 9c        sbc     a,h
aa78 f23aaa    jp      p,$aa3a
aa7b 21b2ac    ld      hl,$acb2
aa7e cd312b    call    $2b31
aa81 cde403    call    $03e4
aa84 21b2ac    ld      hl,$acb2
aa87 cd6d5b    call    $5b6d
aa8a 21a3aa    ld      hl,$aaa3
aa8d cdadaa    call    $aaad
aa90 21a9ac    ld      hl,$aca9
aa93 cdefab    call    $abef
aa96 21a7aa    ld      hl,$aaa7
aa99 cd8f5b    call    $5b8f
aa9c cd3c61    call    $613c
aa9f cd8167    call    $6781
aaa2 c9        ret     

aaa3 010000    ld      bc,$0000
aaa6 00        nop     
aaa7 00        nop     
aaa8 00        nop     
aaa9 00        nop     
aaaa 00        nop     
aaab 40        ld      b,b
aaac 80        add     a,b
aaad 22b7ac    ld      ($acb7),hl
aab0 3a758b    ld      a,($8b75)
aab3 2ab7ac    ld      hl,($acb7)
aab6 96        sub     (hl)
aab7 d601      sub     $01
aab9 9f        sbc     a,a
aaba 32b9ac    ld      ($acb9),a
aabd b7        or      a
aabe cac2aa    jp      z,$aac2
aac1 c9        ret     

aac2 2ab7ac    ld      hl,($acb7)
aac5 7e        ld      a,(hl)
aac6 32758b    ld      ($8b75),a
aac9 cdc963    call    $63c9
aacc c9        ret     

aacd 22bbac    ld      ($acbb),hl
aad0 eb        ex      de,hl
aad1 22bdac    ld      ($acbd),hl
aad4 3e02      ld      a,$02
aad6 21bfac    ld      hl,$acbf
aad9 cdbb80    call    $80bb
aadc 2abbac    ld      hl,($acbb)
aadf cd2380    call    $8023
aae2 21e58a    ld      hl,$8ae5
aae5 cd1480    call    $8014
aae8 2abdac    ld      hl,($acbd)
aaeb cd2380    call    $8023
aaee 21e98a    ld      hl,$8ae9
aaf1 cd1480    call    $8014
aaf4 2abfac    ld      hl,($acbf)
aaf7 cd2380    call    $8023
aafa 21ed8a    ld      hl,$8aed
aafd cd1480    call    $8014
ab00 2ac1ac    ld      hl,($acc1)
ab03 cd2380    call    $8023
ab06 21f18a    ld      hl,$8af1
ab09 cd1480    call    $8014
ab0c cd3c61    call    $613c
ab0f c9        ret     

ab10 22c4ac    ld      ($acc4),hl
ab13 eb        ex      de,hl
ab14 22c6ac    ld      ($acc6),hl
ab17 2ac6ac    ld      hl,($acc6)
ab1a cd2380    call    $8023
ab1d 2ac4ac    ld      hl,($acc4)
ab20 cd437c    call    $7c43
ab23 3d        dec     a
ab24 d67f      sub     $7f
ab26 9f        sbc     a,a
ab27 32ccac    ld      ($accc),a
ab2a b7        or      a
ab2b c24fab    jp      nz,$ab4f
ab2e 2ac6ac    ld      hl,($acc6)
ab31 cd2380    call    $8023
ab34 2ac4ac    ld      hl,($acc4)
ab37 cd567c    call    $7c56
ab3a 21498b    ld      hl,$8b49
ab3d cd1480    call    $8014
ab40 21c8ac    ld      hl,$acc8
ab43 cd2380    call    $8023
ab46 21458b    ld      hl,$8b45
ab49 cd1480    call    $8014
ab4c c36dab    jp      $ab6d
ab4f 2ac4ac    ld      hl,($acc4)
ab52 cd2380    call    $8023
ab55 2ac6ac    ld      hl,($acc6)
ab58 cd567c    call    $7c56
ab5b 21458b    ld      hl,$8b45
ab5e cd1480    call    $8014
ab61 21c8ac    ld      hl,$acc8
ab64 cd2380    call    $8023
ab67 21498b    ld      hl,$8b49
ab6a cd1480    call    $8014
ab6d cd3c61    call    $613c
ab70 cd8167    call    $6781
ab73 c9        ret     

ab74 22ceac    ld      ($acce),hl
ab77 eb        ex      de,hl
ab78 22d0ac    ld      ($acd0),hl
ab7b 2a4f8b    ld      hl,($8b4f)
ab7e eb        ex      de,hl
ab7f 2a4d8b    ld      hl,($8b4d)
ab82 7b        ld      a,e
ab83 95        sub     l
ab84 6f        ld      l,a
ab85 7a        ld      a,d
ab86 9c        sbc     a,h
ab87 67        ld      h,a
ab88 7d        ld      a,l
ab89 07        rlca    
ab8a b5        or      l
ab8b e67f      and     $7f
ab8d b4        or      h
ab8e 3d        dec     a
ab8f d67f      sub     $7f
ab91 9f        sbc     a,a
ab92 32d6ac    ld      ($acd6),a
ab95 b7        or      a
ab96 c2c4ab    jp      nz,$abc4
ab99 21d2ac    ld      hl,$acd2
ab9c cd2380    call    $8023
ab9f 2aceac    ld      hl,($acce)
aba2 cd1480    call    $8014
aba5 214d8b    ld      hl,$8b4d
aba8 cd1e79    call    $791e
abab 21d7ac    ld      hl,$acd7
abae cd1480    call    $8014
abb1 2a4f8b    ld      hl,($8b4f)
abb4 cd347e    call    $7e34
abb7 21d7ac    ld      hl,$acd7
abba cd567c    call    $7c56
abbd 2ad0ac    ld      hl,($acd0)
abc0 cd1480    call    $8014
abc3 c9        ret     

abc4 21d2ac    ld      hl,$acd2
abc7 cd2380    call    $8023
abca 2ad0ac    ld      hl,($acd0)
abcd cd1480    call    $8014
abd0 214f8b    ld      hl,$8b4f
abd3 cd1e79    call    $791e
abd6 21d7ac    ld      hl,$acd7
abd9 cd1480    call    $8014
abdc 2a4d8b    ld      hl,($8b4d)
abdf cd347e    call    $7e34
abe2 21d7ac    ld      hl,$acd7
abe5 cd567c    call    $7c56
abe8 2aceac    ld      hl,($acce)
abeb cd1480    call    $8014
abee c9        ret     

abef 22dcac    ld      ($acdc),hl
abf2 2adcac    ld      hl,($acdc)
abf5 7e        ld      a,(hl)
abf6 325f8b    ld      ($8b5f),a
abf9 c9        ret     

abfa af        xor     a
abfb 32dfac    ld      ($acdf),a
abfe 21b18b    ld      hl,$8bb1
ac01 cd3175    call    $7531
ac04 d6ff      sub     $ff
ac06 d601      sub     $01
ac08 9f        sbc     a,a
ac09 32e8ac    ld      ($ace8),a
ac0c b7        or      a
ac0d ca15ac    jp      z,$ac15
ac10 3eff      ld      a,$ff
ac12 32dfac    ld      ($acdf),a
ac15 3aea8b    ld      a,($8bea)
ac18 e6f5      and     $f5
ac1a 32ea8b    ld      ($8bea),a
ac1d 3adfac    ld      a,($acdf)
ac20 c9        ret     

ac21 00        nop     
ac22 00        nop     
ac23 00        nop     
ac24 00        nop     
ac25 00        nop     
ac26 00        nop     
ac27 00        nop     
ac28 00        nop     
ac29 00        nop     
ac2a 00        nop     
ac2b 00        nop     
ac2c 00        nop     
ac2d 00        nop     
ac2e 00        nop     
ac2f 00        nop     
ac30 00        nop     
ac31 00        nop     
ac32 00        nop     
ac33 00        nop     
ac34 00        nop     
ac35 00        nop     
ac36 00        nop     
ac37 010101    ld      bc,$0101
ac3a 010101    ld      bc,$0101
ac3d 010101    ld      bc,$0101
ac40 010101    ld      bc,$0101
ac43 010101    ld      bc,$0101
ac46 010101    ld      bc,$0101
ac49 010101    ld      bc,$0101
ac4c 00        nop     
ac4d 00        nop     
ac4e 00        nop     
ac4f 00        nop     
ac50 4e        ld      c,(hl)
ac51 4f        ld      c,a
ac52 2044      jr      nz,$ac98
ac54 45        ld      b,l
ac55 56        ld      d,(hl)
ac56 49        ld      c,c
ac57 43        ld      b,e
ac58 45        ld      b,l
ac59 2048      jr      nz,$aca3
ac5b 41        ld      b,c
ac5c 53        ld      d,e
ac5d 2042      jr      nz,$aca1
ac5f 45        ld      b,l
ac60 45        ld      b,l
ac61 4e        ld      c,(hl)
ac62 2049      jr      nz,$acad
ac64 4e        ld      c,(hl)
ac65 53        ld      d,e
ac66 54        ld      d,h
ac67 41        ld      b,c
ac68 4c        ld      c,h
ac69 4c        ld      c,h
ac6a 45        ld      b,l
ac6b 44        ld      b,h
ac6c 2e24      ld      l,$24
ac6e 00        nop     
ac6f 00        nop     
ac70 00        nop     
ac71 00        nop     
ac72 00        nop     
ac73 00        nop     
ac74 00        nop     
ac75 00        nop     
ac76 48        ld      c,b
ac77 a6        and     (hl)
ac78 72        ld      (hl),d
ac79 ac        xor     h
ac7a 00        nop     
ac7b 00        nop     
ac7c 00        nop     
ac7d 00        nop     
ac7e 00        nop     
ac7f 00        nop     
ac80 00        nop     
ac81 00        nop     
ac82 00        nop     
ac83 00        nop     
ac84 00        nop     
ac85 00        nop     
ac86 00        nop     
ac87 00        nop     
ac88 00        nop     
ac89 00        nop     
ac8a 00        nop     
ac8b 00        nop     
ac8c 00        nop     
ac8d 00        nop     
ac8e 00        nop     
ac8f 00        nop     
ac90 00        nop     
ac91 00        nop     
ac92 47        ld      b,a
ac93 52        ld      d,d
ac94 41        ld      b,c
ac95 46        ld      b,(hl)
ac96 54        ld      d,h
ac97 4c        ld      c,h
ac98 4b        ld      c,e
ac99 3024      jr      nc,$acbf
ac9b 24        inc     h
ac9c 24        inc     h
ac9d 47        ld      b,a
ac9e 52        ld      d,d
ac9f 41        ld      b,c
aca0 46        ld      b,(hl)
aca1 54        ld      d,h
aca2 4c        ld      c,h
aca3 4b        ld      c,e
aca4 312424    ld      sp,$2424
aca7 24        inc     h
aca8 00        nop     
aca9 24        inc     h
acaa 00        nop     
acab 00        nop     
acac 00        nop     
acad 00        nop     
acae 00        nop     
acaf 00        nop     
acb0 00        nop     
acb1 81        add     a,c
acb2 00        nop     
acb3 00        nop     
acb4 00        nop     
acb5 00        nop     
acb6 00        nop     
acb7 00        nop     
acb8 00        nop     
acb9 00        nop     
acba 00        nop     
acbb 00        nop     
acbc 00        nop     
acbd 00        nop     
acbe 00        nop     
acbf 00        nop     
acc0 00        nop     
acc1 00        nop     
acc2 00        nop     
acc3 00        nop     
acc4 00        nop     
acc5 00        nop     
acc6 00        nop     
acc7 00        nop     
acc8 00        nop     
acc9 00        nop     
acca 00        nop     
accb 81        add     a,c
accc 00        nop     
accd 00        nop     
acce 00        nop     
accf 00        nop     
acd0 00        nop     
acd1 00        nop     
acd2 00        nop     
acd3 00        nop     
acd4 00        nop     
acd5 81        add     a,c
acd6 00        nop     
acd7 00        nop     
acd8 00        nop     
acd9 00        nop     
acda 00        nop     
acdb 00        nop     
acdc 00        nop     
acdd 00        nop     
acde 00        nop     
acdf 00        nop     
ace0 00        nop     
ace1 00        nop     
ace2 00        nop     
ace3 00        nop     
ace4 00        nop     
ace5 00        nop     
ace6 00        nop     
ace7 00        nop     
ace8 00        nop     
ace9 24        inc     h
acea 2c        inc     l
aceb 25        dec     h
acec 7f        ld      a,a
aced 1804      jr      $acf3
acef 08        ex      af,af'
acf0 0c        inc     c
acf1 0b        dec     bc
acf2 0a        ld      a,(bc)
acf3 160e      ld      d,$0e
acf5 1c        inc     e
acf6 0f        rrca    
acf7 14        inc     d
acf8 1011      djnz    $ad0b
acfa 02        ld      (bc),a
acfb 0609      ld      b,$09
acfd 0d        dec     c
acfe 05        dec     b
acff 07        rlca    
ad00 00        nop     
ad01 00        nop     
ad02 00        nop     
ad03 00        nop     
ad04 00        nop     
ad05 00        nop     
ad06 00        nop     
ad07 00        nop     
ad08 00        nop     
ad09 00        nop     
ad0a 00        nop     
ad0b 00        nop     
ad0c 00        nop     
ad0d 00        nop     
ad0e 00        nop     
ad0f 00        nop     
ad10 00        nop     
ad11 00        nop     
ad12 00        nop     
ad13 00        nop     
ad14 00        nop     
ad15 00        nop     
ad16 00        nop     
ad17 00        nop     
ad18 00        nop     
ad19 00        nop     
ad1a 00        nop     
ad1b 00        nop     
ad1c 00        nop     
ad1d 00        nop     
ad1e 00        nop     
ad1f 00        nop     
ad20 00        nop     
ad21 00        nop     
ad22 00        nop     
ad23 00        nop     
ad24 00        nop     
ad25 00        nop     
ad26 00        nop     
ad27 00        nop     
ad28 00        nop     
ad29 00        nop     
ad2a 00        nop     
ad2b 00        nop     
ad2c 00        nop     
ad2d 00        nop     
ad2e 00        nop     
ad2f 00        nop     
ad30 00        nop     
ad31 00        nop     
ad32 00        nop     
ad33 00        nop     
ad34 00        nop     
ad35 00        nop     
ad36 00        nop     
ad37 00        nop     
ad38 8f        adc     a,a
ad39 c2757a    jp      nz,$7a75
ad3c a5        and     l
ad3d 9b        sbc     a,e
ad3e 44        ld      b,h
ad3f 77        ld      (hl),a
ad40 8f        adc     a,a
ad41 c2757c    jp      nz,$7c75
ad44 0a        ld      a,(bc)
ad45 d7        rst     $10
ad46 23        inc     hl
ad47 7a        ld      a,d
ad48 00        nop     
ad49 00        nop     
ad4a 00        nop     
ad4b 81        add     a,c
ad4c 8f        adc     a,a
ad4d c23580    jp      nz,$8035
ad50 00        nop     
ad51 00        nop     
ad52 40        ld      b,b
ad53 80        add     a,b
ad54 00        nop     
ad55 00        nop     
ad56 40        ld      b,b
ad57 81        add     a,c
ad58 04        inc     b
ad59 00        nop     
ad5a 08        ex      af,af'
ad5b 00        nop     
ad5c 010002    ld      bc,$0200
ad5f 00        nop     
ad60 0c        inc     c
ad61 00        nop     
ad62 03        inc     bc
ad63 00        nop     
ad64 05        dec     b
ad65 00        nop     
ad66 0a        ld      a,(bc)
ad67 00        nop     
ad68 0600      ld      b,$00
ad6a 09        add     hl,bc
ad6b 00        nop     
ad6c 07        rlca    
ad6d 00        nop     
ad6e 0b        dec     bc
ad6f 00        nop     
ad70 0d        dec     c
ad71 00        nop     
ad72 0e00      ld      c,$00
ad74 0f        rrca    
ad75 00        nop     
ad76 1000      djnz    $ad78
ad78 00        nop     
ad79 00        nop     
ad7a 04        inc     b
ad7b 00        nop     
ad7c 08        ex      af,af'
ad7d 00        nop     
ad7e 010002    ld      bc,$0200
ad81 00        nop     
ad82 03        inc     bc
ad83 00        nop     
ad84 04        inc     b
ad85 00        nop     
ad86 05        dec     b
ad87 00        nop     
ad88 0600      ld      b,$00
ad8a 07        rlca    
ad8b 00        nop     
ad8c 08        ex      af,af'
ad8d 00        nop     
ad8e 010002    ld      bc,$0200
ad91 00        nop     
ad92 03        inc     bc
ad93 00        nop     
ad94 04        inc     b
ad95 00        nop     
ad96 05        dec     b
ad97 00        nop     
ad98 0600      ld      b,$00
ad9a 07        rlca    
ad9b 00        nop     
ad9c 08        ex      af,af'
ad9d 00        nop     
ad9e 010002    ld      bc,$0200
ada1 00        nop     
ada2 03        inc     bc
ada3 00        nop     
ada4 04        inc     b
ada5 00        nop     
ada6 05        dec     b
ada7 00        nop     
ada8 010002    ld      bc,$0200
adab 00        nop     
adac 03        inc     bc
adad 00        nop     
adae 04        inc     b
adaf 00        nop     
adb0 05        dec     b
adb1 00        nop     
adb2 0600      ld      b,$00
adb4 07        rlca    
adb5 00        nop     
adb6 08        ex      af,af'
adb7 00        nop     
adb8 010002    ld      bc,$0200
adbb 00        nop     
adbc 03        inc     bc
adbd 00        nop     
adbe 04        inc     b
adbf 00        nop     
adc0 05        dec     b
adc1 00        nop     
adc2 0600      ld      b,$00
adc4 07        rlca    
adc5 00        nop     
adc6 08        ex      af,af'
adc7 00        nop     
adc8 010002    ld      bc,$0200
adcb 00        nop     
adcc 03        inc     bc
adcd 00        nop     
adce 04        inc     b
adcf 00        nop     
add0 2a2b58    ld      hl,($582b)
add3 4f        ld      c,a
add4 40        ld      b,b
add5 41        ld      b,c
add6 42        ld      b,d
add7 43        ld      b,e
add8 44        ld      b,h
add9 45        ld      b,l
adda 46        ld      b,(hl)
addb 47        ld      b,a
addc 48        ld      c,b
addd 49        ld      c,c
adde 4a        ld      c,d
addf 4b        ld      c,e
ade0 4c        ld      c,h
ade1 4d        ld      c,l
ade2 4e        ld      c,(hl)
ade3 31cdcd    ld      sp,$cdcd
ade6 cdcdcd    call    $cdcd
ade9 cdcdcd    call    $cdcd
adec cdcdcd    call    $cdcd
adef cdcdcd    call    $cdcd
adf2 cdcdcd    call    $cdcd
adf5 cdcdcd    call    $cdcd
adf8 cdcdcd    call    $cdcd
adfb cdcdcd    call    $cdcd
adfe cdcdcd    call    $cdcd
ae01 cdcdcd    call    $cdcd
ae04 cdcdcd    call    $cdcd
ae07 cdcdcd    call    $cdcd
ae0a cdcdcd    call    $cdcd
ae0d cdcdcd    call    $cdcd
ae10 cdcdcd    call    $cdcd
ae13 cdcdcd    call    $cdcd
ae16 cdcdcd    call    $cdcd
ae19 cdcdcd    call    $cdcd
ae1c cdcdcd    call    $cdcd
ae1f cdcdcd    call    $cdcd
ae22 cdcdcd    call    $cdcd
ae25 cdcdcd    call    $cdcd
ae28 cdcdcd    call    $cdcd
ae2b cdcdcd    call    $cdcd
ae2e cdcdcd    call    $cdcd
ae31 cdcdcd    call    $cdcd
ae34 cdcdcd    call    $cdcd
ae37 cdcdcd    call    $cdcd
ae3a cdcdcd    call    $cdcd
ae3d cdcdcd    call    $cdcd
ae40 cdcdcd    call    $cdcd
ae43 cdcdcd    call    $cdcd
ae46 cdcdcd    call    $cdcd
ae49 cdcdcd    call    $cdcd
ae4c cdcdcd    call    $cdcd
ae4f cdcdcd    call    $cdcd
ae52 cdcdcd    call    $cdcd
ae55 cdcdcd    call    $cdcd
ae58 cdcdcd    call    $cdcd
ae5b cdcdcd    call    $cdcd
ae5e cdcdcd    call    $cdcd
ae61 cdcdcd    call    $cdcd
ae64 cdcdcd    call    $cdcd
ae67 cdcdcd    call    $cdcd
ae6a cdcdcd    call    $cdcd
ae6d cdcdcd    call    $cdcd
ae70 cdcdcd    call    $cdcd
ae73 cdcdcd    call    $cdcd
ae76 cdcdcd    call    $cdcd
ae79 cdcdcd    call    $cdcd
ae7c cdcdcd    call    $cdcd
ae7f cdcdcd    call    $cdcd
ae82 cdcdcd    call    $cdcd
ae85 cdcdcd    call    $cdcd
ae88 cdcdcd    call    $cdcd
ae8b cdcdcd    call    $cdcd
ae8e cdcdcd    call    $cdcd
ae91 cdcdcd    call    $cdcd
ae94 cdcdcd    call    $cdcd
ae97 cdcdcd    call    $cdcd
ae9a cdcdcd    call    $cdcd
ae9d cdcdcd    call    $cdcd
aea0 cdcdcd    call    $cdcd
aea3 cdcdcd    call    $cdcd
aea6 cdcdcd    call    $cdcd
aea9 cdcdcd    call    $cdcd
aeac cdcdcd    call    $cdcd
aeaf cdcdcd    call    $cdcd
aeb2 cdcdcd    call    $cdcd
aeb5 cdcdcd    call    $cdcd
aeb8 cdcdcd    call    $cdcd
aebb cdcdcd    call    $cdcd
aebe cdcdcd    call    $cdcd
aec1 cdcdcd    call    $cdcd
aec4 cdcdcd    call    $cdcd
aec7 cdcdcd    call    $cdcd
aeca cdcdcd    call    $cdcd
aecd cdcdcd    call    $cdcd
aed0 cdcdcd    call    $cdcd
aed3 cdcdcd    call    $cdcd
aed6 cdcdcd    call    $cdcd
aed9 cdcdcd    call    $cdcd
aedc cdcdcd    call    $cdcd
aedf cdcdcd    call    $cdcd
aee2 cdcdcd    call    $cdcd
aee5 cdcdcd    call    $cdcd
aee8 cdcdcd    call    $cdcd
aeeb cdcdcd    call    $cdcd
aeee cdcdcd    call    $cdcd
aef1 cdcdcd    call    $cdcd
aef4 cdcdcd    call    $cdcd
aef7 cdcdcd    call    $cdcd
aefa cdcdcd    call    $cdcd
aefd cdcdcd    call    $cdcd
af00 cdcdcd    call    $cdcd
af03 cdcdcd    call    $cdcd
af06 cdcdcd    call    $cdcd
af09 cdcdcd    call    $cdcd
af0c cdcdcd    call    $cdcd
af0f cdcdcd    call    $cdcd
af12 cdcdcd    call    $cdcd
af15 cdcdcd    call    $cdcd
af18 cdcdcd    call    $cdcd
af1b cdcdcd    call    $cdcd
af1e cdcdcd    call    $cdcd
af21 cdcdcd    call    $cdcd
af24 cdcdcd    call    $cdcd
af27 cdcdcd    call    $cdcd
af2a cdcdcd    call    $cdcd
af2d cdcdcd    call    $cdcd
af30 cdcdcd    call    $cdcd
af33 cdcdcd    call    $cdcd
af36 cdcdcd    call    $cdcd
af39 cdcdcd    call    $cdcd
af3c cdcdcd    call    $cdcd
af3f cdcdcd    call    $cdcd
af42 cdcdcd    call    $cdcd
af45 cdcdcd    call    $cdcd
af48 cdcdcd    call    $cdcd
af4b cdcdcd    call    $cdcd
af4e cdcdcd    call    $cdcd
af51 cdcdcd    call    $cdcd
af54 cdcdcd    call    $cdcd
af57 cdcdcd    call    $cdcd
af5a cdcdcd    call    $cdcd
af5d cdcdcd    call    $cdcd
af60 cdcdcd    call    $cdcd
af63 cdcdcd    call    $cdcd
af66 cdcdcd    call    $cdcd
af69 cdcdcd    call    $cdcd
af6c cdcdcd    call    $cdcd
af6f cdcdcd    call    $cdcd
af72 cdcdcd    call    $cdcd
af75 cdcdcd    call    $cdcd
af78 cdcdcd    call    $cdcd
af7b cdcdcd    call    $cdcd
af7e cdcdcd    call    $cdcd
af81 cdcdcd    call    $cdcd
af84 cdcdcd    call    $cdcd
af87 cdcdcd    call    $cdcd
af8a cdcdcd    call    $cdcd
af8d cdcdcd    call    $cdcd
af90 cdcdcd    call    $cdcd
af93 cdcdcd    call    $cdcd
af96 cdcdcd    call    $cdcd
af99 cdcdcd    call    $cdcd
af9c cdcdcd    call    $cdcd
af9f cdcdcd    call    $cdcd
afa2 cdcdcd    call    $cdcd
afa5 cdcdcd    call    $cdcd
afa8 cdcdcd    call    $cdcd
afab cdcdcd    call    $cdcd
afae cdcdcd    call    $cdcd
afb1 cdcdcd    call    $cdcd
afb4 cdcdcd    call    $cdcd
afb7 cdcdcd    call    $cdcd
afba cdcdcd    call    $cdcd
afbd cdcdcd    call    $cdcd
afc0 cdcdcd    call    $cdcd
afc3 cdcdcd    call    $cdcd
afc6 cdcdcd    call    $cdcd
afc9 cdcdcd    call    $cdcd
afcc cdcdcd    call    $cdcd
afcf cdcdcd    call    $cdcd
afd2 cdcdcd    call    $cdcd
afd5 cdcdcd    call    $cdcd
afd8 cdcdcd    call    $cdcd
afdb cdcdcd    call    $cdcd
afde cdcdcd    call    $cdcd
afe1 cdcdcd    call    $cdcd
afe4 cdcdcd    call    $cdcd
afe7 cdcdcd    call    $cdcd
afea cdcdcd    call    $cdcd
afed cdcdcd    call    $cdcd
aff0 cdcdcd    call    $cdcd
aff3 cdcdcd    call    $cdcd
aff6 cdcdcd    call    $cdcd
aff9 cdcdcd    call    $cdcd
affc cdcdcd    call    $cdcd
afff cdcdcd    call    $cdcd
b002 cdcdcd    call    $cdcd
b005 cdcdcd    call    $cdcd
b008 cdcdcd    call    $cdcd
b00b cdcdcd    call    $cdcd
b00e cdcdcd    call    $cdcd
b011 cdcdcd    call    $cdcd
b014 cdcdcd    call    $cdcd
b017 cdcdcd    call    $cdcd
b01a cdcdcd    call    $cdcd
b01d cdcdcd    call    $cdcd
b020 cdcdcd    call    $cdcd
b023 cdcdcd    call    $cdcd
b026 cdcdcd    call    $cdcd
b029 cdcdcd    call    $cdcd
b02c cdcdcd    call    $cdcd
b02f cdcdcd    call    $cdcd
b032 cdcdcd    call    $cdcd
b035 cdcdcd    call    $cdcd
b038 cdcdcd    call    $cdcd
b03b cdcdcd    call    $cdcd
b03e cdcdcd    call    $cdcd
b041 cdcdcd    call    $cdcd
b044 cdcdcd    call    $cdcd
b047 cdcdcd    call    $cdcd
b04a cdcdcd    call    $cdcd
b04d cdcdcd    call    $cdcd
b050 cdcdcd    call    $cdcd
b053 cdcdcd    call    $cdcd
b056 cdcdcd    call    $cdcd
b059 cdcdcd    call    $cdcd
b05c cdcdcd    call    $cdcd
b05f cdcdcd    call    $cdcd
b062 cdcdcd    call    $cdcd
b065 cdcdcd    call    $cdcd
b068 cdcdcd    call    $cdcd
b06b cdcdcd    call    $cdcd
b06e cdcdcd    call    $cdcd
b071 cdcdcd    call    $cdcd
b074 cdcdcd    call    $cdcd
b077 cdcdcd    call    $cdcd
b07a cdcdcd    call    $cdcd
b07d cdcdcd    call    $cdcd
b080 cdcdcd    call    $cdcd
b083 cdcdcd    call    $cdcd
b086 cdcdcd    call    $cdcd
b089 cdcdcd    call    $cdcd
b08c cdcdcd    call    $cdcd
b08f cdcdcd    call    $cdcd
b092 cdcdcd    call    $cdcd
b095 cdcdcd    call    $cdcd
b098 cdcdcd    call    $cdcd
b09b cdcdcd    call    $cdcd
b09e cdcdcd    call    $cdcd
b0a1 cdcdcd    call    $cdcd
b0a4 cdcdcd    call    $cdcd
b0a7 cdcdcd    call    $cdcd
b0aa cdcdcd    call    $cdcd
b0ad cdcdcd    call    $cdcd
b0b0 cdcdcd    call    $cdcd
b0b3 cdcdcd    call    $cdcd
b0b6 cdcdcd    call    $cdcd
b0b9 cdcdcd    call    $cdcd
b0bc cdcdcd    call    $cdcd
b0bf cdcdcd    call    $cdcd
b0c2 cdcdcd    call    $cdcd
b0c5 cdcdcd    call    $cdcd
b0c8 cdcdcd    call    $cdcd
b0cb cdcdcd    call    $cdcd
b0ce cdcdcd    call    $cdcd
b0d1 cdcdcd    call    $cdcd
b0d4 cdcdcd    call    $cdcd
b0d7 cdcdcd    call    $cdcd
b0da cdcdcd    call    $cdcd
b0dd cdcdcd    call    $cdcd
b0e0 cdcdcd    call    $cdcd
b0e3 cdcdcd    call    $cdcd
b0e6 cdcdcd    call    $cdcd
b0e9 cdcdcd    call    $cdcd
b0ec cdcdcd    call    $cdcd
b0ef cdcdcd    call    $cdcd
b0f2 cdcdcd    call    $cdcd
b0f5 cdcdcd    call    $cdcd
b0f8 cdcdcd    call    $cdcd
b0fb cdcdcd    call    $cdcd
b0fe cdcdcd    call    $cdcd
b101 cdcdcd    call    $cdcd
b104 cdcdcd    call    $cdcd
b107 cdcdcd    call    $cdcd
b10a cdcdcd    call    $cdcd
b10d cdcdcd    call    $cdcd
b110 cdcdcd    call    $cdcd
b113 cdcdcd    call    $cdcd
b116 cdcdcd    call    $cdcd
b119 cdcdcd    call    $cdcd
b11c cdcdcd    call    $cdcd
b11f cdcdcd    call    $cdcd
b122 cdcdcd    call    $cdcd
b125 cdcdcd    call    $cdcd
b128 cdcdcd    call    $cdcd
b12b cdcdcd    call    $cdcd
b12e cdcdcd    call    $cdcd
b131 cdcdcd    call    $cdcd
b134 cdcdcd    call    $cdcd
b137 cdcdcd    call    $cdcd
b13a cdcdcd    call    $cdcd
b13d cdcdcd    call    $cdcd
b140 cdcdcd    call    $cdcd
b143 cdcdcd    call    $cdcd
b146 cdcdcd    call    $cdcd
b149 cdcdcd    call    $cdcd
b14c cdcdcd    call    $cdcd
b14f cdcdcd    call    $cdcd
b152 cdcdcd    call    $cdcd
b155 cdcdcd    call    $cdcd
b158 cdcdcd    call    $cdcd
b15b cdcdcd    call    $cdcd
b15e cdcdcd    call    $cdcd
b161 cdcdcd    call    $cdcd
b164 cdcdcd    call    $cdcd
b167 cdcdcd    call    $cdcd
b16a cdcdcd    call    $cdcd
b16d cdcdcd    call    $cdcd
b170 cdcdcd    call    $cdcd
b173 cdcdcd    call    $cdcd
b176 cdcdcd    call    $cdcd
b179 cdcdcd    call    $cdcd
b17c cdcdcd    call    $cdcd
b17f cdcdcd    call    $cdcd
b182 cdcdcd    call    $cdcd
b185 cdcdcd    call    $cdcd
b188 cdcdcd    call    $cdcd
b18b cdcdcd    call    $cdcd
b18e cdcdcd    call    $cdcd
b191 cdcdcd    call    $cdcd
b194 cdcdcd    call    $cdcd
b197 cdcdcd    call    $cdcd
b19a cdcdcd    call    $cdcd
b19d cdcdcd    call    $cdcd
b1a0 cdcdcd    call    $cdcd
b1a3 cdcdcd    call    $cdcd
b1a6 cdcdcd    call    $cdcd
b1a9 cdcdcd    call    $cdcd
b1ac cdcdcd    call    $cdcd
b1af cdcdcd    call    $cdcd
b1b2 cdcdcd    call    $cdcd
b1b5 cdcdcd    call    $cdcd
b1b8 cdcdcd    call    $cdcd
b1bb cdcdcd    call    $cdcd
b1be cdcdcd    call    $cdcd
b1c1 cdcdcd    call    $cdcd
b1c4 cdcdcd    call    $cdcd
b1c7 cdcdcd    call    $cdcd
b1ca cdcdcd    call    $cdcd
b1cd cdcdcd    call    $cdcd
b1d0 cdcdcd    call    $cdcd
b1d3 cdcdcd    call    $cdcd
b1d6 cdcdcd    call    $cdcd
b1d9 cdcdcd    call    $cdcd
b1dc cdcdcd    call    $cdcd
b1df cdcdcd    call    $cdcd
b1e2 cdcdcd    call    $cdcd
b1e5 cdcdcd    call    $cdcd
b1e8 cdcdcd    call    $cdcd
b1eb cdcdcd    call    $cdcd
b1ee cdcdcd    call    $cdcd
b1f1 cdcdcd    call    $cdcd
b1f4 cdcdcd    call    $cdcd
b1f7 cdcdcd    call    $cdcd
b1fa cdcdcd    call    $cdcd
b1fd cdcdcd    call    $cdcd
b200 cdcdcd    call    $cdcd
b203 cdcdcd    call    $cdcd
b206 cdcdcd    call    $cdcd
b209 cdcdcd    call    $cdcd
b20c cdcdcd    call    $cdcd
b20f cdcdcd    call    $cdcd
b212 cdcdcd    call    $cdcd
b215 cdcdcd    call    $cdcd
b218 cdcdcd    call    $cdcd
b21b cdcdcd    call    $cdcd
b21e cdcdcd    call    $cdcd
b221 cdcdcd    call    $cdcd
b224 cdcdcd    call    $cdcd
b227 cdcdcd    call    $cdcd
b22a cdcdcd    call    $cdcd
b22d cdcdcd    call    $cdcd
b230 cdcdcd    call    $cdcd
b233 cdcdcd    call    $cdcd
b236 cdcdcd    call    $cdcd
b239 cdcdcd    call    $cdcd
b23c cdcdcd    call    $cdcd
b23f cdcdcd    call    $cdcd
b242 cdcdcd    call    $cdcd
b245 cdcdcd    call    $cdcd
b248 cdcdcd    call    $cdcd
b24b cdcdcd    call    $cdcd
b24e cdcdcd    call    $cdcd
b251 cdcdcd    call    $cdcd
b254 cdcdcd    call    $cdcd
b257 cdcdcd    call    $cdcd
b25a cdcdcd    call    $cdcd
b25d cdcdcd    call    $cdcd
b260 cdcdcd    call    $cdcd
b263 cdcdcd    call    $cdcd
b266 cdcdcd    call    $cdcd
b269 cdcdcd    call    $cdcd
b26c cdcdcd    call    $cdcd
b26f cdcdcd    call    $cdcd
b272 cdcdcd    call    $cdcd
b275 cdcdcd    call    $cdcd
b278 cdcdcd    call    $cdcd
b27b cdcdcd    call    $cdcd
b27e cdcdcd    call    $cdcd
b281 cdcdcd    call    $cdcd
b284 cdcdcd    call    $cdcd
b287 cdcdcd    call    $cdcd
b28a cdcdcd    call    $cdcd
b28d cdcdcd    call    $cdcd
b290 cdcdcd    call    $cdcd
b293 cdcdcd    call    $cdcd
b296 cdcdcd    call    $cdcd
b299 cdcdcd    call    $cdcd
b29c cdcdcd    call    $cdcd
b29f cdcdcd    call    $cdcd
b2a2 cdcdcd    call    $cdcd
b2a5 cdcdcd    call    $cdcd
b2a8 cdcdcd    call    $cdcd
b2ab cdacb2    call    $b2ac
b2ae cab753    jp      z,$53b7
b2b1 43        ld      b,e
b2b2 41        ld      b,c
b2b3 3843      jr      c,$b2f8
b2b5 2020      jr      nz,$b2d7
b2b7 2022      jr      nz,$b2db
b2b9 6d        ld      l,l
b2ba b7        or      a
b2bb eb        ex      de,hl
b2bc 226fb7    ld      ($b76f),hl
b2bf 60        ld      h,b
b2c0 69        ld      l,c
b2c1 2271b7    ld      ($b771),hl
b2c4 2a7597    ld      hl,($9775)
b2c7 227db7    ld      ($b77d),hl
b2ca 3ad297    ld      a,($97d2)
b2cd 327fb7    ld      ($b77f),a
b2d0 3e01      ld      a,$01
b2d2 3281b7    ld      ($b781),a
b2d5 210100    ld      hl,$0001
b2d8 eb        ex      de,hl
b2d9 3ad397    ld      a,($97d3)
b2dc 6f        ld      l,a
b2dd 17        rla     
b2de 9f        sbc     a,a
b2df 67        ld      h,a
b2e0 7b        ld      a,e
b2e1 95        sub     l
b2e2 6f        ld      l,a
b2e3 7a        ld      a,d
b2e4 9c        sbc     a,h
b2e5 67        ld      h,a
b2e6 eb        ex      de,hl
b2e7 2a7597    ld      hl,($9775)
b2ea 19        add     hl,de
b2eb 2277b7    ld      ($b777),hl
b2ee 2a6fb7    ld      hl,($b76f)
b2f1 7e        ld      a,(hl)
b2f2 b7        or      a
b2f3 c26eb4    jp      nz,$b46e
b2f6 217d97    ld      hl,$977d
b2f9 cd902f    call    $2f90
b2fc 3290b7    ld      ($b790),a
b2ff b7        or      a
b300 c23fb4    jp      nz,$b43f
b303 2a7597    ld      hl,($9775)
b306 2279b7    ld      ($b779),hl
b309 2a7997    ld      hl,($9779)
b30c 227bb7    ld      ($b77b),hl
b30f 217d97    ld      hl,$977d
b312 cd202d    call    $2d20
b315 3290b7    ld      ($b790),a
b318 b7        or      a
b319 ca22b3    jp      z,$b322
b31c 210100    ld      hl,$0001
b31f 227d97    ld      ($977d),hl
b322 3e01      ld      a,$01
b324 32d397    ld      ($97d3),a
b327 2a7597    ld      hl,($9775)
b32a 2275b7    ld      ($b775),hl
b32d cd5d36    call    $365d
b330 210100    ld      hl,$0001
b333 2273b7    ld      ($b773),hl
b336 3aef97    ld      a,($97ef)
b339 11e899    ld      de,$99e8
b33c 6f        ld      l,a
b33d 17        rla     
b33e 9f        sbc     a,a
b33f 67        ld      h,a
b340 19        add     hl,de
b341 2291b7    ld      ($b791),hl
b344 2a6db7    ld      hl,($b76d)
b347 2295b7    ld      ($b795),hl
b34a 0193b7    ld      bc,$b793
b34d 2a91b7    ld      hl,($b791)
b350 eb        ex      de,hl
b351 217fb7    ld      hl,$b77f
b354 cdf9b5    call    $b5f9
b357 3a7fb7    ld      a,($b77f)
b35a 3d        dec     a
b35b d67f      sub     $7f
b35d 9f        sbc     a,a
b35e 3290b7    ld      ($b790),a
b361 b7        or      a
b362 c29fb3    jp      nz,$b39f
b365 2a7597    ld      hl,($9775)
b368 eb        ex      de,hl
b369 3a81b7    ld      a,($b781)
b36c 6f        ld      l,a
b36d 17        rla     
b36e 9f        sbc     a,a
b36f 67        ld      h,a
b370 19        add     hl,de
b371 227597    ld      ($9775),hl
b374 1179b7    ld      de,$b779
b377 217597    ld      hl,$9775
b37a cd682f    call    $2f68
b37d 3290b7    ld      ($b790),a
b380 117bb7    ld      de,$b77b
b383 217597    ld      hl,$9775
b386 cd722e    call    $2e72
b389 2190b7    ld      hl,$b790
b38c b6        or      (hl)
b38d 3297b7    ld      ($b797),a
b390 b7        or      a
b391 c25fb4    jp      nz,$b45f
b394 cd5d36    call    $365d
b397 3e01      ld      a,$01
b399 327fb7    ld      ($b77f),a
b39c c336b3    jp      $b336
b39f 2a6fb7    ld      hl,($b76f)
b3a2 7e        ld      a,(hl)
b3a3 b7        or      a
b3a4 c2c8b4    jp      nz,$b4c8
b3a7 3aed97    ld      a,($97ed)
b3aa 217fb7    ld      hl,$b77f
b3ad 86        add     a,(hl)
b3ae 327fb7    ld      ($b77f),a
b3b1 2a7597    ld      hl,($9775)
b3b4 2275b7    ld      ($b775),hl
b3b7 3a7fb7    ld      a,($b77f)
b3ba d650      sub     $50
b3bc 3d        dec     a
b3bd d67f      sub     $7f
b3bf 9f        sbc     a,a
b3c0 3290b7    ld      ($b790),a
b3c3 b7        or      a
b3c4 caccb3    jp      z,$b3cc
b3c7 3e50      ld      a,$50
b3c9 327fb7    ld      ($b77f),a
b3cc 3a7fb7    ld      a,($b77f)
b3cf 32d297    ld      ($97d2),a
b3d2 2a73b7    ld      hl,($b773)
b3d5 23        inc     hl
b3d6 eb        ex      de,hl
b3d7 2a7d97    ld      hl,($977d)
b3da eb        ex      de,hl
b3db 7b        ld      a,e
b3dc 95        sub     l
b3dd 7a        ld      a,d
b3de 9c        sbc     a,h
b3df f233b3    jp      p,$b333
b3e2 cde001    call    $01e0
b3e5 2a7597    ld      hl,($9775)
b3e8 23        inc     hl
b3e9 eb        ex      de,hl
b3ea 2a77b7    ld      hl,($b777)
b3ed 7b        ld      a,e
b3ee 95        sub     l
b3ef 6f        ld      l,a
b3f0 7a        ld      a,d
b3f1 9c        sbc     a,h
b3f2 67        ld      h,a
b3f3 2273b7    ld      ($b773),hl
b3f6 11eaff    ld      de,$ffea
b3f9 19        add     hl,de
b3fa 7d        ld      a,l
b3fb 07        rlca    
b3fc b5        or      l
b3fd e67f      and     $7f
b3ff b4        or      h
b400 3d        dec     a
b401 c681      add     a,$81
b403 9f        sbc     a,a
b404 3290b7    ld      ($b790),a
b407 2a73b7    ld      hl,($b773)
b40a 2b        dec     hl
b40b 7d        ld      a,l
b40c 07        rlca    
b40d b5        or      l
b40e e67f      and     $7f
b410 b4        or      h
b411 17        rla     
b412 3f        ccf     
b413 9f        sbc     a,a
b414 2190b7    ld      hl,$b790
b417 a6        and     (hl)
b418 3297b7    ld      ($b797),a
b41b b7        or      a
b41c ca25b4    jp      z,$b425
b41f 3a73b7    ld      a,($b773)
b422 32d397    ld      ($97d3),a
b425 cd5d36    call    $365d
b428 cd9532    call    $3295
b42b 117db7    ld      de,$b77d
b42e 217597    ld      hl,$9775
b431 cd7630    call    $3076
b434 3290b7    ld      ($b790),a
b437 b7        or      a
b438 ca3eb4    jp      z,$b43e
b43b cd9939    call    $3999
b43e c9        ret     

b43f 3eff      ld      a,$ff
b441 3281b7    ld      ($b781),a
b444 210100    ld      hl,$0001
b447 2279b7    ld      ($b779),hl
b44a 2a7597    ld      hl,($9775)
b44d 227bb7    ld      ($b77b),hl
b450 2a7d97    ld      hl,($977d)
b453 af        xor     a
b454 95        sub     l
b455 6f        ld      l,a
b456 9c        sbc     a,h
b457 95        sub     l
b458 67        ld      h,a
b459 227d97    ld      ($977d),hl
b45c c30fb3    jp      $b30f
b45f 2a75b7    ld      hl,($b775)
b462 227597    ld      ($9775),hl
b465 2198b7    ld      hl,$b798
b468 cda62f    call    $2fa6
b46b c3e5b3    jp      $b3e5
b46e 2a71b7    ld      hl,($b771)
b471 7e        ld      a,(hl)
b472 b7        or      a
b473 c2a9b4    jp      nz,$b4a9
b476 2a7597    ld      hl,($9775)
b479 2279b7    ld      ($b779),hl
b47c 2a7797    ld      hl,($9777)
b47f 227bb7    ld      ($b77b),hl
b482 1179b7    ld      de,$b779
b485 217bb7    ld      hl,$b77b
b488 cd322e    call    $2e32
b48b 3290b7    ld      ($b790),a
b48e b7        or      a
b48f c20fb3    jp      nz,$b30f
b492 117bb7    ld      de,$b77b
b495 2179b7    ld      hl,$b779
b498 cde830    call    $30e8
b49b 3eff      ld      a,$ff
b49d 3281b7    ld      ($b781),a
b4a0 3ad497    ld      a,($97d4)
b4a3 327fb7    ld      ($b77f),a
b4a6 c30fb3    jp      $b30f
b4a9 210100    ld      hl,$0001
b4ac 2279b7    ld      ($b779),hl
b4af 2a7997    ld      hl,($9779)
b4b2 227bb7    ld      ($b77b),hl
b4b5 210100    ld      hl,$0001
b4b8 227597    ld      ($9775),hl
b4bb 3e01      ld      a,$01
b4bd 32d297    ld      ($97d2),a
b4c0 3e01      ld      a,$01
b4c2 327fb7    ld      ($b77f),a
b4c5 c30fb3    jp      $b30f
b4c8 3aed97    ld      a,($97ed)
b4cb 217fb7    ld      hl,$b77f
b4ce 86        add     a,(hl)
b4cf 3285b7    ld      ($b785),a
b4d2 3a7fb7    ld      a,($b77f)
b4d5 3287b7    ld      ($b787),a
b4d8 215100    ld      hl,$0051
b4db eb        ex      de,hl
b4dc 3a85b7    ld      a,($b785)
b4df 6f        ld      l,a
b4e0 17        rla     
b4e1 9f        sbc     a,a
b4e2 67        ld      h,a
b4e3 7b        ld      a,e
b4e4 95        sub     l
b4e5 6f        ld      l,a
b4e6 7a        ld      a,d
b4e7 9c        sbc     a,h
b4e8 67        ld      h,a
b4e9 7d        ld      a,l
b4ea 3286b7    ld      ($b786),a
b4ed 3a87b7    ld      a,($b787)
b4f0 114899    ld      de,$9948
b4f3 6f        ld      l,a
b4f4 17        rla     
b4f5 9f        sbc     a,a
b4f6 67        ld      h,a
b4f7 19        add     hl,de
b4f8 2291b7    ld      ($b791),hl
b4fb 3a85b7    ld      a,($b785)
b4fe 114899    ld      de,$9948
b501 6f        ld      l,a
b502 17        rla     
b503 9f        sbc     a,a
b504 67        ld      h,a
b505 19        add     hl,de
b506 22a4b7    ld      ($b7a4),hl
b509 0186b7    ld      bc,$b786
b50c 2aa4b7    ld      hl,($b7a4)
b50f eb        ex      de,hl
b510 2a91b7    ld      hl,($b791)
b513 cd573a    call    $3a57
b516 3a87b7    ld      a,($b787)
b519 2186b7    ld      hl,$b786
b51c 86        add     a,(hl)
b51d 3287b7    ld      ($b787),a
b520 3a87b7    ld      a,($b787)
b523 114899    ld      de,$9948
b526 6f        ld      l,a
b527 17        rla     
b528 9f        sbc     a,a
b529 67        ld      h,a
b52a 19        add     hl,de
b52b 2291b7    ld      ($b791),hl
b52e 11ed97    ld      de,$97ed
b531 2a91b7    ld      hl,($b791)
b534 cda33a    call    $3aa3
b537 3aed97    ld      a,($97ed)
b53a 2187b7    ld      hl,$b787
b53d 86        add     a,(hl)
b53e 3287b7    ld      ($b787),a
b541 3aee97    ld      a,($97ee)
b544 d601      sub     $01
b546 9f        sbc     a,a
b547 3290b7    ld      ($b790),a
b54a b7        or      a
b54b c2f3b5    jp      nz,$b5f3
b54e 3aee97    ld      a,($97ee)
b551 217fb7    ld      hl,$b77f
b554 86        add     a,(hl)
b555 3286b7    ld      ($b786),a
b558 215100    ld      hl,$0051
b55b eb        ex      de,hl
b55c 3aee97    ld      a,($97ee)
b55f 6f        ld      l,a
b560 17        rla     
b561 9f        sbc     a,a
b562 67        ld      h,a
b563 7b        ld      a,e
b564 95        sub     l
b565 6f        ld      l,a
b566 7a        ld      a,d
b567 9c        sbc     a,h
b568 67        ld      h,a
b569 eb        ex      de,hl
b56a 3a7fb7    ld      a,($b77f)
b56d 6f        ld      l,a
b56e 17        rla     
b56f 9f        sbc     a,a
b570 67        ld      h,a
b571 7b        ld      a,e
b572 95        sub     l
b573 6f        ld      l,a
b574 7a        ld      a,d
b575 9c        sbc     a,h
b576 67        ld      h,a
b577 7d        ld      a,l
b578 3288b7    ld      ($b788),a
b57b 3a86b7    ld      a,($b786)
b57e 114899    ld      de,$9948
b581 6f        ld      l,a
b582 17        rla     
b583 9f        sbc     a,a
b584 67        ld      h,a
b585 19        add     hl,de
b586 2291b7    ld      ($b791),hl
b589 3a7fb7    ld      a,($b77f)
b58c 114899    ld      de,$9948
b58f 6f        ld      l,a
b590 17        rla     
b591 9f        sbc     a,a
b592 67        ld      h,a
b593 19        add     hl,de
b594 22a4b7    ld      ($b7a4),hl
b597 0188b7    ld      bc,$b788
b59a 2aa4b7    ld      hl,($b7a4)
b59d eb        ex      de,hl
b59e 2a91b7    ld      hl,($b791)
b5a1 cd7a3a    call    $3a7a
b5a4 3af097    ld      a,($97f0)
b5a7 3286b7    ld      ($b786),a
b5aa 3e01      ld      a,$01
b5ac 3285b7    ld      ($b785),a
b5af 3a7fb7    ld      a,($b77f)
b5b2 114899    ld      de,$9948
b5b5 6f        ld      l,a
b5b6 17        rla     
b5b7 9f        sbc     a,a
b5b8 67        ld      h,a
b5b9 19        add     hl,de
b5ba 2291b7    ld      ($b791),hl
b5bd 3a86b7    ld      a,($b786)
b5c0 11e899    ld      de,$99e8
b5c3 6f        ld      l,a
b5c4 17        rla     
b5c5 9f        sbc     a,a
b5c6 67        ld      h,a
b5c7 19        add     hl,de
b5c8 7e        ld      a,(hl)
b5c9 2a91b7    ld      hl,($b791)
b5cc 77        ld      (hl),a
b5cd 3a86b7    ld      a,($b786)
b5d0 3c        inc     a
b5d1 3286b7    ld      ($b786),a
b5d4 3a7fb7    ld      a,($b77f)
b5d7 3c        inc     a
b5d8 327fb7    ld      ($b77f),a
b5db d650      sub     $50
b5dd 3d        dec     a
b5de d67f      sub     $7f
b5e0 9f        sbc     a,a
b5e1 3290b7    ld      ($b790),a
b5e4 b7        or      a
b5e5 c2f3b5    jp      nz,$b5f3
b5e8 3a85b7    ld      a,($b785)
b5eb 21ee97    ld      hl,$97ee
b5ee be        cp      (hl)
b5ef 3c        inc     a
b5f0 daacb5    jp      c,$b5ac
b5f3 cd1602    call    $0216
b5f6 c3b1b3    jp      $b3b1
b5f9 22a7b7    ld      ($b7a7),hl
b5fc eb        ex      de,hl
b5fd 22a9b7    ld      ($b7a9),hl
b600 3e02      ld      a,$02
b602 21abb7    ld      hl,$b7ab
b605 cdbb80    call    $80bb
b608 214999    ld      hl,$9949
b60b cdde2e    call    $2ede
b60e 3c        inc     a
b60f 2aabb7    ld      hl,($b7ab)
b612 96        sub     (hl)
b613 32b2b7    ld      ($b7b2),a
b616 2aa7b7    ld      hl,($b7a7)
b619 7e        ld      a,(hl)
b61a 21b2b7    ld      hl,$b7b2
b61d 96        sub     (hl)
b61e 3d        dec     a
b61f d67f      sub     $7f
b621 9f        sbc     a,a
b622 32b3b7    ld      ($b7b3),a
b625 b7        or      a
b626 c290b6    jp      nz,$b690
b629 2aa7b7    ld      hl,($b7a7)
b62c 7e        ld      a,(hl)
b62d 32b0b7    ld      ($b7b0),a
b630 3e01      ld      a,$01
b632 32afb7    ld      ($b7af),a
b635 3ab0b7    ld      a,($b7b0)
b638 114899    ld      de,$9948
b63b 6f        ld      l,a
b63c 17        rla     
b63d 9f        sbc     a,a
b63e 67        ld      h,a
b63f 19        add     hl,de
b640 22b4b7    ld      ($b7b4),hl
b643 3aafb7    ld      a,($b7af)
b646 6f        ld      l,a
b647 17        rla     
b648 9f        sbc     a,a
b649 67        ld      h,a
b64a eb        ex      de,hl
b64b 21ffff    ld      hl,$ffff
b64e 19        add     hl,de
b64f eb        ex      de,hl
b650 2aa9b7    ld      hl,($b7a9)
b653 19        add     hl,de
b654 22b6b7    ld      ($b7b6),hl
b657 2ab4b7    ld      hl,($b7b4)
b65a 7e        ld      a,(hl)
b65b 2ab6b7    ld      hl,($b7b6)
b65e 96        sub     (hl)
b65f c6ff      add     a,$ff
b661 9f        sbc     a,a
b662 32b3b7    ld      ($b7b3),a
b665 b7        or      a
b666 c27cb6    jp      nz,$b67c
b669 3ab0b7    ld      a,($b7b0)
b66c 3c        inc     a
b66d 32b0b7    ld      ($b7b0),a
b670 3aafb7    ld      a,($b7af)
b673 2aabb7    ld      hl,($b7ab)
b676 be        cp      (hl)
b677 3c        inc     a
b678 da32b6    jp      c,$b632
b67b c9        ret     

b67c 2aadb7    ld      hl,($b7ad)
b67f 7e        ld      a,(hl)
b680 b7        or      a
b681 c290b6    jp      nz,$b690
b684 2aa7b7    ld      hl,($b7a7)
b687 7e        ld      a,(hl)
b688 3c        inc     a
b689 2aa7b7    ld      hl,($b7a7)
b68c 77        ld      (hl),a
b68d c316b6    jp      $b616
b690 af        xor     a
b691 2aa7b7    ld      hl,($b7a7)
b694 77        ld      (hl),a
b695 c9        ret     

b696 210100    ld      hl,$0001
b699 22bcb7    ld      ($b7bc),hl
b69c 210100    ld      hl,$0001
b69f 22beb7    ld      ($b7be),hl
b6a2 2abeb7    ld      hl,($b7be)
b6a5 eb        ex      de,hl
b6a6 210300    ld      hl,$0003
b6a9 cdd37e    call    $7ed3
b6ac 22c0b7    ld      ($b7c0),hl
b6af 111b98    ld      de,$981b
b6b2 19        add     hl,de
b6b3 22c2b7    ld      ($b7c2),hl
b6b6 af        xor     a
b6b7 2ac2b7    ld      hl,($b7c2)
b6ba 77        ld      (hl),a
b6bb 2ac0b7    ld      hl,($b7c0)
b6be 111c98    ld      de,$981c
b6c1 19        add     hl,de
b6c2 22c4b7    ld      ($b7c4),hl
b6c5 3e02      ld      a,$02
b6c7 2ac4b7    ld      hl,($b7c4)
b6ca 77        ld      (hl),a
b6cb 2ac0b7    ld      hl,($b7c0)
b6ce 111d98    ld      de,$981d
b6d1 19        add     hl,de
b6d2 22c6b7    ld      ($b7c6),hl
b6d5 af        xor     a
b6d6 2ac6b7    ld      hl,($b7c6)
b6d9 77        ld      (hl),a
b6da 2abeb7    ld      hl,($b7be)
b6dd 11fc97    ld      de,$97fc
b6e0 19        add     hl,de
b6e1 22c8b7    ld      ($b7c8),hl
b6e4 2abeb7    ld      hl,($b7be)
b6e7 29        add     hl,hl
b6e8 2b        dec     hl
b6e9 7d        ld      a,l
b6ea 2ac8b7    ld      hl,($b7c8)
b6ed 77        ld      (hl),a
b6ee 2abeb7    ld      hl,($b7be)
b6f1 11fe97    ld      de,$97fe
b6f4 19        add     hl,de
b6f5 22c0b7    ld      ($b7c0),hl
b6f8 2abeb7    ld      hl,($b7be)
b6fb 29        add     hl,hl
b6fc 7d        ld      a,l
b6fd 2ac0b7    ld      hl,($b7c0)
b700 77        ld      (hl),a
b701 2abeb7    ld      hl,($b7be)
b704 23        inc     hl
b705 3e02      ld      a,$02
b707 95        sub     l
b708 3e00      ld      a,$00
b70a 9c        sbc     a,h
b70b f29fb6    jp      p,$b69f
b70e 210100    ld      hl,$0001
b711 22beb7    ld      ($b7be),hl
b714 2abeb7    ld      hl,($b7be)
b717 29        add     hl,hl
b718 119397    ld      de,$9793
b71b 19        add     hl,de
b71c 22c0b7    ld      ($b7c0),hl
b71f 2abeb7    ld      hl,($b7be)
b722 eb        ex      de,hl
b723 2ac0b7    ld      hl,($b7c0)
b726 73        ld      (hl),e
b727 23        inc     hl
b728 72        ld      (hl),d
b729 2abeb7    ld      hl,($b7be)
b72c 23        inc     hl
b72d 3e04      ld      a,$04
b72f 95        sub     l
b730 3e00      ld      a,$00
b732 9c        sbc     a,h
b733 f211b7    jp      p,$b711
b736 210100    ld      hl,$0001
b739 22bcb7    ld      ($b7bc),hl
b73c cd3736    call    $3637
b73f 210100    ld      hl,$0001
b742 227597    ld      ($9775),hl
b745 210100    ld      hl,$0001
b748 227997    ld      ($9779),hl
b74b 1168b7    ld      de,$b768
b74e 211498    ld      hl,$9814
b751 cd4239    call    $3942
b754 116ab7    ld      de,$b76a
b757 214999    ld      hl,$9949
b75a cda33a    call    $3aa3
b75d cd8802    call    $0288
b760 af        xor     a
b761 32cd97    ld      ($97cd),a
b764 cdc039    call    $39c0
b767 c9        ret     

b768 00        nop     
b769 02        ld      (bc),a
b76a 50        ld      d,b
b76b 00        nop     
b76c 00        nop     
b76d 00        nop     
b76e 00        nop     
b76f 00        nop     
b770 00        nop     
b771 00        nop     
b772 00        nop     
b773 00        nop     
b774 00        nop     
b775 00        nop     
b776 00        nop     
b777 00        nop     
b778 00        nop     
b779 00        nop     
b77a 00        nop     
b77b 00        nop     
b77c 00        nop     
b77d 00        nop     
b77e 00        nop     
b77f 00        nop     
b780 00        nop     
b781 00        nop     
b782 00        nop     
b783 00        nop     
b784 00        nop     
b785 00        nop     
b786 00        nop     
b787 00        nop     
b788 00        nop     
b789 00        nop     
b78a 00        nop     
b78b 00        nop     
b78c 00        nop     
b78d 00        nop     
b78e 00        nop     
b78f 00        nop     
b790 00        nop     
b791 00        nop     
b792 00        nop     
b793 ed97      db      $ed, $97         ; Undocumented 8 T-State NOP
b795 00        nop     
b796 00        nop     
b797 00        nop     
b798 4d        ld      c,l
b799 61        ld      h,c
b79a 74        ld      (hl),h
b79b 63        ld      h,e
b79c 68        ld      l,b
b79d 2066      jr      nz,$b805
b79f 61        ld      h,c
b7a0 69        ld      l,c
b7a1 6c        ld      l,h
b7a2 73        ld      (hl),e
b7a3 210000    ld      hl,$0000
b7a6 00        nop     
b7a7 00        nop     
b7a8 00        nop     
b7a9 00        nop     
b7aa 00        nop     
b7ab 00        nop     
b7ac ac        xor     h
b7ad b2        or      d
b7ae af        xor     a
b7af b6        or      (hl)
b7b0 53        ld      d,e
b7b1 43        ld      b,e
b7b2 41        ld      b,c
b7b3 3844      jr      c,$b7f9
b7b5 2020      jr      nz,$b7d7
b7b7 20c9      jr      nz,$b782
b7b9 2209b6    ld      ($b609),hl
b7bc 010004    ld      bc,$0400
b7bf 00        nop     
b7c0 9b        sbc     a,e
b7c1 97        sub     a
b7c2 219822    ld      hl,$2298
b7c5 98        sbc     a,b
b7c6 23        inc     hl
b7c7 98        sbc     a,b
b7c8 fe97      cp      $97
b7ca cdcdcd    call    $cdcd
b7cd cdcdcd    call    $cdcd
b7d0 cdcdcd    call    $cdcd
b7d3 cdcdcd    call    $cdcd
b7d6 cdcdcd    call    $cdcd
b7d9 cdcdcd    call    $cdcd
b7dc cdcdcd    call    $cdcd
b7df cdcdcd    call    $cdcd
b7e2 cdcdcd    call    $cdcd
b7e5 cdcdcd    call    $cdcd
b7e8 cdcdcd    call    $cdcd
b7eb cdcdcd    call    $cdcd
b7ee cdcdcd    call    $cdcd
b7f1 cdcdcd    call    $cdcd
b7f4 cdcdcd    call    $cdcd
b7f7 cdcdcd    call    $cdcd
b7fa cdcdcd    call    $cdcd
b7fd cdcdcd    call    $cdcd
b800 cdcdcd    call    $cdcd
b803 cdcdcd    call    $cdcd
b806 cdcdcd    call    $cdcd
b809 cdcdcd    call    $cdcd
b80c cdcdcd    call    $cdcd
b80f cdcdcd    call    $cdcd
b812 cdcdcd    call    $cdcd
b815 cdcdcd    call    $cdcd
b818 cdcdcd    call    $cdcd
b81b cdcdcd    call    $cdcd
b81e cdcdcd    call    $cdcd
b821 cdcdcd    call    $cdcd
b824 cdcdcd    call    $cdcd
b827 cdcdcd    call    $cdcd
b82a cdcdcd    call    $cdcd
b82d cdcdcd    call    $cdcd
b830 cdcdcd    call    $cdcd
b833 cdcdcd    call    $cdcd
b836 cdcdcd    call    $cdcd
b839 cdcdcd    call    $cdcd
b83c cdcdcd    call    $cdcd
b83f cdcdcd    call    $cdcd
b842 cdcdcd    call    $cdcd
b845 cdcdcd    call    $cdcd
b848 cdcdcd    call    $cdcd
b84b cdcdcd    call    $cdcd
b84e cdcdcd    call    $cdcd
b851 cdcdcd    call    $cdcd
b854 cdcdcd    call    $cdcd
b857 cdcdcd    call    $cdcd
b85a cdcdcd    call    $cdcd
b85d 13        inc     de
b85e 00        nop     
b85f 0f        rrca    
b860 a3        and     e
b861 52        ld      d,d
b862 014241    ld      bc,$4142
b865 52        ld      d,d
b866 2020      jr      nz,$b888
b868 2020      jr      nz,$b88a
b86a 200f      jr      nz,$b87b
b86c a3        and     e
b86d 27        daa     
b86e 014558    ld      bc,$5845
b871 314220    ld      sp,$2042
b874 2020      jr      nz,$b896
b876 20c9      jr      nz,$b841
b878 0e8b      ld      c,$8b
b87a 00        nop     
b87b 45        ld      b,l
b87c 58        ld      e,b
b87d 33        inc     sp
b87e 2020      jr      nz,$b8a0
b880 2020      jr      nz,$b8a2
b882 200f      jr      nz,$b893
b884 a3        and     e
b885 49        ld      c,c
b886 014649    ld      bc,$4946
b889 4c        ld      c,h
b88a 45        ld      b,l
b88b 53        ld      d,e
b88c 2020      jr      nz,$b8ae
b88e 200f      jr      nz,$b89f
b890 a3        and     e
b891 f0        ret     p

b892 00        nop     
b893 49        ld      c,c
b894 4e        ld      c,(hl)
b895 49        ld      c,c
b896 54        ld      d,h
b897 41        ld      b,c
b898 4c        ld      c,h
b899 2020      jr      nz,$b8bb
b89b b1        or      c
b89c 02        ld      (bc),a
b89d 08        ex      af,af'
b89e 00        nop     
b89f 49        ld      c,c
b8a0 4f        ld      c,a
b8a1 50        ld      d,b
b8a2 41        ld      b,c
b8a3 4b        ld      c,e
b8a4 3020      jr      nc,$b8c6
b8a6 20b1      jr      nz,$b859
b8a8 02        ld      (bc),a
b8a9 0b        dec     bc
b8aa 00        nop     
b8ab 49        ld      c,c
b8ac 4f        ld      c,a
b8ad 50        ld      d,b
b8ae 41        ld      b,c
b8af 4b        ld      c,e
b8b0 312020    ld      sp,$2020
b8b3 b1        or      c
b8b4 02        ld      (bc),a
b8b5 0e00      ld      c,$00
b8b7 49        ld      c,c
b8b8 4f        ld      c,a
b8b9 50        ld      d,b
b8ba 41        ld      b,c
b8bb 4b        ld      c,e
b8bc 322020    ld      ($2020),a
b8bf 0f        rrca    
b8c0 a3        and     e
b8c1 ef        rst     $28
b8c2 00        nop     
b8c3 4f        ld      c,a
b8c4 56        ld      d,(hl)
b8c5 4c        ld      c,h
b8c6 42        ld      b,d
b8c7 46        ld      b,(hl)
b8c8 52        ld      d,d
b8c9 2020      jr      nz,$b8eb
b8cb 0f        rrca    
b8cc a3        and     e
b8cd 7d        ld      a,l
b8ce 015049    ld      bc,$4950
b8d1 45        ld      b,l
b8d2 2020      jr      nz,$b8f4
b8d4 2020      jr      nz,$b8f6
b8d6 20bd      jr      nz,$b895
b8d8 03        inc     bc
b8d9 2800      jr      z,$b8db
b8db 50        ld      d,b
b8dc 4c        ld      c,h
b8dd 4f        ld      c,a
b8de 54        ld      d,h
b8df 54        ld      d,h
b8e0 45        ld      b,l
b8e1 52        ld      d,d
b8e2 20bd      jr      nz,$b8a1
b8e4 03        inc     bc
b8e5 3f        ccf     
b8e6 00        nop     
b8e7 50        ld      d,b
b8e8 52        ld      d,d
b8e9 49        ld      c,c
b8ea 4e        ld      c,(hl)
b8eb 54        ld      d,h
b8ec 45        ld      b,l
b8ed 52        ld      d,d
b8ee 20c9      jr      nz,$b8b9
b8f0 0ec2      ld      c,$c2
b8f2 00        nop     
b8f3 50        ld      d,b
b8f4 52        ld      d,d
b8f5 54        ld      d,h
b8f6 44        ld      b,h
b8f7 55        ld      d,l
b8f8 4d        ld      c,l
b8f9 50        ld      d,b
b8fa 200f      jr      nz,$b90b
b8fc a3        and     e
b8fd a7        and     a
b8fe 015343    ld      bc,$4353
b901 41        ld      b,c
b902 2020      jr      nz,$b924
b904 2020      jr      nz,$b926
b906 20ac      jr      nz,$b8b4
b908 b2        or      d
b909 c7        rst     $00
b90a 015343    ld      bc,$4353
b90d 41        ld      b,c
b90e 3843      jr      c,$b953
b910 2020      jr      nz,$b932
b912 20ac      jr      nz,$b8c0
b914 b2        or      d
b915 d1        pop     de
b916 015343    ld      bc,$4353
b919 41        ld      b,c
b91a 3844      jr      c,$b960
b91c 2020      jr      nz,$b93e
b91e 20c9      jr      nz,$b8e9
b920 0e56      ld      c,$56
b922 00        nop     
b923 53        ld      d,e
b924 43        ld      b,e
b925 41        ld      b,c
b926 54        ld      d,h
b927 45        ld      b,l
b928 312020    ld      sp,$2020
b92b bd        cp      l
b92c 03        inc     bc
b92d 110053    ld      de,$5300
b930 43        ld      b,e
b931 52        ld      d,d
b932 45        ld      b,l
b933 45        ld      b,l
b934 4e        ld      c,(hl)
b935 2020      jr      nz,$b957
b937 0f        rrca    
b938 a3        and     e
b939 0601      ld      b,$01
b93b 53        ld      d,e
b93c 54        ld      d,h
b93d 41        ld      b,c
b93e 54        ld      d,h
b93f 55        ld      d,l
b940 53        ld      d,e
b941 2020      jr      nz,$b963
b943 00        nop     
b944 00        nop     
b945 00        nop     
b946 00        nop     
b947 00        nop     
b948 00        nop     
b949 00        nop     
b94a 00        nop     
b94b 00        nop     
b94c 00        nop     
b94d 00        nop     
b94e 00        nop     
b94f 00        nop     
b950 00        nop     
b951 00        nop     
b952 00        nop     
b953 00        nop     
b954 00        nop     
b955 00        nop     
b956 00        nop     
b957 00        nop     
b958 00        nop     
b959 00        nop     
b95a 00        nop     
b95b 00        nop     
b95c 00        nop     
b95d 00        nop     
b95e 00        nop     
b95f 00        nop     
b960 00        nop     
b961 00        nop     
b962 00        nop     
b963 00        nop     
b964 00        nop     
b965 00        nop     
b966 00        nop     
b967 00        nop     
b968 00        nop     
b969 00        nop     
b96a 00        nop     
b96b 00        nop     
b96c 00        nop     
b96d 00        nop     
b96e 00        nop     
b96f 00        nop     
b970 00        nop     
b971 ff        rst     $38
b972 00        nop     
b973 00        nop     
b974 00        nop     
b975 00        nop     
b976 00        nop     
b977 00        nop     
b978 00        nop     
b979 00        nop     
b97a 00        nop     
b97b 00        nop     
b97c 00        nop     
b97d 65        ld      h,l
b97e 65        ld      h,l
b97f 64        ld      h,h
b980 73        ld      (hl),e
b981 2073      jr      nz,$b9f6
b983 69        ld      l,c
b984 7a        ld      a,d
b985 65        ld      h,l
b986 206f      jr      nz,$b9f7
b988 66        ld      h,(hl)
b989 206c      jr      nz,$b9f7
b98b 69        ld      l,c
b98c 6e        ld      l,(hl)
b98d 65        ld      h,l
b98e 2062      jr      nz,$b9f2
b990 75        ld      (hl),l
b991 66        ld      h,(hl)
b992 66        ld      h,(hl)
b993 65        ld      h,l
b994 72        ld      (hl),d
b995 00        nop     
b996 00        nop     
b997 0d        dec     c
b998 0a        ld      a,(bc)
b999 0a        ld      a,(bc)
b99a 54        ld      d,h
b99b 79        ld      a,c
b99c 70        ld      (hl),b
b99d 65        ld      h,l
b99e 2048      jr      nz,$b9e8
b9a0 45        ld      b,l
b9a1 4c        ld      c,h
b9a2 50        ld      d,b
b9a3 2066      jr      nz,$ba0b
b9a5 6f        ld      l,a
b9a6 72        ld      (hl),d
b9a7 2069      jr      nz,$ba12
b9a9 6e        ld      l,(hl)
b9aa 66        ld      h,(hl)
b9ab 6f        ld      l,a
b9ac 72        ld      (hl),d
b9ad 6d        ld      l,l
b9ae 61        ld      h,c
b9af 74        ld      (hl),h
b9b0 69        ld      l,c
b9b1 6f        ld      l,a
b9b2 6e        ld      l,(hl)
b9b3 81        add     a,c
b9b4 55        ld      d,l
b9b5 6e        ld      l,(hl)
b9b6 6b        ld      l,e
b9b7 6e        ld      l,(hl)
b9b8 6f        ld      l,a
b9b9 77        ld      (hl),a
b9ba 6e        ld      l,(hl)
b9bb 206f      jr      nz,$ba2c
b9bd 72        ld      (hl),d
b9be 2069      jr      nz,$ba29
b9c0 6e        ld      l,(hl)
b9c1 61        ld      h,c
b9c2 70        ld      (hl),b
b9c3 70        ld      (hl),b
b9c4 72        ld      (hl),d
b9c5 6f        ld      l,a
b9c6 70        ld      (hl),b
b9c7 72        ld      (hl),d
b9c8 69        ld      l,c
b9c9 61        ld      h,c
b9ca 74        ld      (hl),h
b9cb 65        ld      h,l
b9cc 2063      jr      nz,$ba31
b9ce 6f        ld      l,a
b9cf 6d        ld      l,l
b9d0 6d        ld      l,l
b9d1 61        ld      h,c
b9d2 6e        ld      l,(hl)
b9d3 64        ld      h,h
b9d4 00        nop     
b9d5 55        ld      d,l
b9d6 6e        ld      l,(hl)
b9d7 6b        ld      l,e
b9d8 6e        ld      l,(hl)
b9d9 6f        ld      l,a
b9da 77        ld      (hl),a
b9db 6e        ld      l,(hl)
b9dc 2076      jr      nz,$ba54
b9de 61        ld      h,c
b9df 72        ld      (hl),d
b9e0 69        ld      l,c
b9e1 61        ld      h,c
b9e2 62        ld      h,d
b9e3 6c        ld      l,h
b9e4 65        ld      h,l
b9e5 206e      jr      nz,$ba55
b9e7 61        ld      h,c
b9e8 6d        ld      l,l
b9e9 65        ld      h,l
b9ea 00        nop     
b9eb 54        ld      d,h
b9ec 6f        ld      l,a
b9ed 6f        ld      l,a
b9ee 206d      jr      nz,$ba5d
b9f0 61        ld      h,c
b9f1 6e        ld      l,(hl)
b9f2 79        ld      a,c
b9f3 2061      jr      nz,$ba56
b9f5 63        ld      h,e
b9f6 74        ld      (hl),h
b9f7 69        ld      l,c
b9f8 76        halt    
b9f9 65        ld      h,l
b9fa 2063      jr      nz,$ba5f
b9fc 6f        ld      l,a
b9fd 2020      jr      nz,$ba1f
b9ff 2020      jr      nz,$ba21
ba01 2020      jr      nz,$ba23
ba03 2020      jr      nz,$ba25
ba05 2020      jr      nz,$ba27
ba07 2020      jr      nz,$ba29
ba09 2020      jr      nz,$ba2b
ba0b 2020      jr      nz,$ba2d
ba0d 2020      jr      nz,$ba2f
ba0f 2020      jr      nz,$ba31
ba11 2020      jr      nz,$ba33
ba13 2020      jr      nz,$ba35
ba15 2020      jr      nz,$ba37
ba17 2020      jr      nz,$ba39
ba19 2020      jr      nz,$ba3b
ba1b 2020      jr      nz,$ba3d
ba1d 2020      jr      nz,$ba3f
ba1f 2020      jr      nz,$ba41
ba21 2020      jr      nz,$ba43
ba23 2020      jr      nz,$ba45
ba25 2020      jr      nz,$ba47
ba27 2020      jr      nz,$ba49
ba29 2020      jr      nz,$ba4b
ba2b 2020      jr      nz,$ba4d
ba2d 2020      jr      nz,$ba4f
ba2f 2020      jr      nz,$ba51
ba31 2020      jr      nz,$ba53
ba33 2020      jr      nz,$ba55
ba35 2020      jr      nz,$ba57
ba37 2020      jr      nz,$ba59
ba39 2020      jr      nz,$ba5b
ba3b 2020      jr      nz,$ba5d
ba3d 2020      jr      nz,$ba5f
ba3f 2020      jr      nz,$ba61
ba41 2020      jr      nz,$ba63
ba43 2020      jr      nz,$ba65
ba45 2020      jr      nz,$ba67
ba47 2020      jr      nz,$ba69
ba49 2020      jr      nz,$ba6b
ba4b 2020      jr      nz,$ba6d
ba4d 2020      jr      nz,$ba6f
ba4f 2020      jr      nz,$ba71
ba51 2020      jr      nz,$ba73
ba53 2020      jr      nz,$ba75
ba55 2020      jr      nz,$ba77
ba57 2020      jr      nz,$ba79
ba59 2020      jr      nz,$ba7b
ba5b 2020      jr      nz,$ba7d
ba5d cdcdcd    call    $cdcd
ba60 cdcdcd    call    $cdcd
ba63 cdcdcd    call    $cdcd
ba66 cdcdcd    call    $cdcd
ba69 cdcdcd    call    $cdcd
ba6c cdcdcd    call    $cdcd
ba6f cdcdcd    call    $cdcd
ba72 cdcdcd    call    $cdcd
ba75 cdcdcd    call    $cdcd
ba78 cdcdcd    call    $cdcd
ba7b cdcdcd    call    $cdcd
ba7e cdcdcd    call    $cdcd
ba81 cdcdcd    call    $cdcd
ba84 cdcdcd    call    $cdcd
ba87 cdcdcd    call    $cdcd
ba8a cdcdcd    call    $cdcd
ba8d cdcdcd    call    $cdcd
ba90 cdcdcd    call    $cdcd
ba93 cdcdcd    call    $cdcd
ba96 cdcdcd    call    $cdcd
ba99 cdcdcd    call    $cdcd
ba9c cdcdcd    call    $cdcd
ba9f cdcdcd    call    $cdcd
baa2 cdcdcd    call    $cdcd
baa5 cdcdcd    call    $cdcd
baa8 cdcdcd    call    $cdcd
baab cdcdcd    call    $cdcd
baae cdcdcd    call    $cdcd
bab1 cdcdcd    call    $cdcd
bab4 cdcdcd    call    $cdcd
bab7 cdcdcd    call    $cdcd
baba cdcdcd    call    $cdcd
babd cdcdcd    call    $cdcd
bac0 cdcdcd    call    $cdcd
bac3 cdcdcd    call    $cdcd
bac6 cdcdcd    call    $cdcd
bac9 cdcdcd    call    $cdcd
bacc cdcdcd    call    $cdcd
bacf cdcdcd    call    $cdcd
bad2 cdcdcd    call    $cdcd
bad5 cdcdcd    call    $cdcd
bad8 cdcdcd    call    $cdcd
badb cdcdcd    call    $cdcd
bade cdcdcd    call    $cdcd
bae1 cdcdcd    call    $cdcd
bae4 cdcdcd    call    $cdcd
bae7 cdcdcd    call    $cdcd
baea cdcdcd    call    $cdcd
baed cdcdcd    call    $cdcd
baf0 cdcdcd    call    $cdcd
baf3 cdcdcd    call    $cdcd
baf6 cdcdcd    call    $cdcd
baf9 cdcdcd    call    $cdcd
bafc cdcdcd    call    $cdcd
baff cdcdcd    call    $cdcd
bb02 cdcdcd    call    $cdcd
bb05 cdcdcd    call    $cdcd
bb08 cdcdcd    call    $cdcd
bb0b cdcdcd    call    $cdcd
bb0e cdcdcd    call    $cdcd
bb11 cdcdcd    call    $cdcd
bb14 cdcdcd    call    $cdcd
bb17 cdcdcd    call    $cdcd
bb1a cdcdcd    call    $cdcd
bb1d cdcdcd    call    $cdcd
bb20 cdcdcd    call    $cdcd
bb23 cdcdcd    call    $cdcd
bb26 cdcdcd    call    $cdcd
bb29 cdcdcd    call    $cdcd
bb2c cdcdcd    call    $cdcd
bb2f cdcdcd    call    $cdcd
bb32 cdcdcd    call    $cdcd
bb35 cdcdcd    call    $cdcd
bb38 cdcdcd    call    $cdcd
bb3b cdcdcd    call    $cdcd
bb3e cdcdcd    call    $cdcd
bb41 cdcdcd    call    $cdcd
bb44 cdcdcd    call    $cdcd
bb47 cdcdcd    call    $cdcd
bb4a cdcdcd    call    $cdcd
bb4d cdcdcd    call    $cdcd
bb50 cdcdcd    call    $cdcd
bb53 cdcdcd    call    $cdcd
bb56 cdcdcd    call    $cdcd
bb59 cdcdcd    call    $cdcd
bb5c cdcdcd    call    $cdcd
bb5f cdcdcd    call    $cdcd
bb62 cdcdcd    call    $cdcd
bb65 cdcdcd    call    $cdcd
bb68 cdcdcd    call    $cdcd
bb6b cdcdcd    call    $cdcd
bb6e cdcdcd    call    $cdcd
bb71 cdcdcd    call    $cdcd
bb74 cdcdcd    call    $cdcd
bb77 cdcdcd    call    $cdcd
bb7a cdcdcd    call    $cdcd
bb7d cdcdcd    call    $cdcd
bb80 cdcdcd    call    $cdcd
bb83 cdcdcd    call    $cdcd
bb86 cdcdcd    call    $cdcd
bb89 cdcdcd    call    $cdcd
bb8c cdcdcd    call    $cdcd
bb8f cdcdcd    call    $cdcd
bb92 cdcdcd    call    $cdcd
bb95 cdcdcd    call    $cdcd
bb98 cdcdcd    call    $cdcd
bb9b cdcdcd    call    $cdcd
bb9e cdcdcd    call    $cdcd
bba1 cdcdcd    call    $cdcd
bba4 cdcdcd    call    $cdcd
bba7 cdcdcd    call    $cdcd
bbaa cdcdcd    call    $cdcd
bbad cdcdcd    call    $cdcd
bbb0 cdcdcd    call    $cdcd
bbb3 cdcdcd    call    $cdcd
bbb6 cdcdcd    call    $cdcd
bbb9 cdcdcd    call    $cdcd
bbbc cdcdcd    call    $cdcd
bbbf cdcdcd    call    $cdcd
bbc2 cdcdcd    call    $cdcd
bbc5 cdcdcd    call    $cdcd
bbc8 cdcdcd    call    $cdcd
bbcb cdcdcd    call    $cdcd
bbce cdcdcd    call    $cdcd
bbd1 cdcdcd    call    $cdcd
bbd4 cdcdcd    call    $cdcd
bbd7 cdcdcd    call    $cdcd
bbda cdcdcd    call    $cdcd
bbdd cdcdcd    call    $cdcd
bbe0 cdcdcd    call    $cdcd
bbe3 cdcdcd    call    $cdcd
bbe6 cdcdcd    call    $cdcd
bbe9 cdcdcd    call    $cdcd
bbec cdcdcd    call    $cdcd
bbef cdcdcd    call    $cdcd
bbf2 cdcdcd    call    $cdcd
bbf5 cdcdcd    call    $cdcd
bbf8 cdcdcd    call    $cdcd
bbfb cdcdcd    call    $cdcd
bbfe cdcdcd    call    $cdcd
bc01 cdcdcd    call    $cdcd
bc04 cdcdcd    call    $cdcd
bc07 cdcdcd    call    $cdcd
bc0a cdcdcd    call    $cdcd
bc0d cdcdcd    call    $cdcd
bc10 cdcdcd    call    $cdcd
bc13 cdcdcd    call    $cdcd
bc16 cdcdcd    call    $cdcd
bc19 cdcdcd    call    $cdcd
bc1c cdcdcd    call    $cdcd
bc1f cdcdcd    call    $cdcd
bc22 cdcdcd    call    $cdcd
bc25 cdcdcd    call    $cdcd
bc28 cdcdcd    call    $cdcd
bc2b cdcdcd    call    $cdcd
bc2e cdcdcd    call    $cdcd
bc31 cdcdcd    call    $cdcd
bc34 cdcdcd    call    $cdcd
bc37 cdcdcd    call    $cdcd
bc3a cdcdcd    call    $cdcd
bc3d cdcdcd    call    $cdcd
bc40 cdcdcd    call    $cdcd
bc43 cdcdcd    call    $cdcd
bc46 cdcdcd    call    $cdcd
bc49 cdcdcd    call    $cdcd
bc4c cdcdcd    call    $cdcd
bc4f cdcdcd    call    $cdcd
bc52 cdcdcd    call    $cdcd
bc55 cdcdcd    call    $cdcd
bc58 cdcdcd    call    $cdcd
bc5b cdcdcd    call    $cdcd
bc5e cdcdcd    call    $cdcd
bc61 cdcdcd    call    $cdcd
bc64 cdcdcd    call    $cdcd
bc67 cdcdcd    call    $cdcd
bc6a cdcdcd    call    $cdcd
bc6d cdcdcd    call    $cdcd
bc70 cdcdcd    call    $cdcd
bc73 cdcdcd    call    $cdcd
bc76 cdcdcd    call    $cdcd
bc79 cdcdcd    call    $cdcd
bc7c cdcdcd    call    $cdcd
bc7f cdcdcd    call    $cdcd
bc82 cdcdcd    call    $cdcd
bc85 cdcdcd    call    $cdcd
bc88 cdcdcd    call    $cdcd
bc8b cdcdcd    call    $cdcd
bc8e cdcdcd    call    $cdcd
bc91 cdcdcd    call    $cdcd
bc94 cdcdcd    call    $cdcd
bc97 cdcdcd    call    $cdcd
bc9a cdcdcd    call    $cdcd
bc9d cdcdcd    call    $cdcd
bca0 cdcdcd    call    $cdcd
bca3 cdcdcd    call    $cdcd
bca6 cdcdcd    call    $cdcd
bca9 cdcdcd    call    $cdcd
bcac cdcdcd    call    $cdcd
bcaf cdcdcd    call    $cdcd
bcb2 cdcdcd    call    $cdcd
bcb5 cdcdcd    call    $cdcd
bcb8 cdcdcd    call    $cdcd
bcbb cdcdcd    call    $cdcd
bcbe cdcdcd    call    $cdcd
bcc1 cdcdcd    call    $cdcd
bcc4 cdcdcd    call    $cdcd
bcc7 cdcdcd    call    $cdcd
bcca cdcdcd    call    $cdcd
bccd cdcdcd    call    $cdcd
bcd0 cdcdcd    call    $cdcd
bcd3 cdcdcd    call    $cdcd
bcd6 cdcdcd    call    $cdcd
bcd9 cdcdcd    call    $cdcd
bcdc cdcdcd    call    $cdcd
bcdf cdcdcd    call    $cdcd
bce2 cdcdcd    call    $cdcd
bce5 cdcdcd    call    $cdcd
bce8 cdcdcd    call    $cdcd
bceb cdcdcd    call    $cdcd
bcee cdcdcd    call    $cdcd
bcf1 cdcdcd    call    $cdcd
bcf4 cdcdcd    call    $cdcd
bcf7 cdcdcd    call    $cdcd
bcfa cdcdcd    call    $cdcd
bcfd cdcdcd    call    $cdcd
bd00 cdcdcd    call    $cdcd
bd03 cdcdcd    call    $cdcd
bd06 cdcdcd    call    $cdcd
bd09 cdcdcd    call    $cdcd
bd0c cdcdcd    call    $cdcd
bd0f cdcdcd    call    $cdcd
bd12 cdcdcd    call    $cdcd
bd15 cdcdcd    call    $cdcd
bd18 cdcdcd    call    $cdcd
bd1b cdcdcd    call    $cdcd
bd1e cdcdcd    call    $cdcd
bd21 cdcdcd    call    $cdcd
bd24 cdcdcd    call    $cdcd
bd27 cdcdcd    call    $cdcd
bd2a cdcdcd    call    $cdcd
bd2d cdcdcd    call    $cdcd
bd30 cdcdcd    call    $cdcd
bd33 cdcdcd    call    $cdcd
bd36 cdcdcd    call    $cdcd
bd39 cdcdcd    call    $cdcd
bd3c cdcdcd    call    $cdcd
bd3f cdcdcd    call    $cdcd
bd42 cdcdcd    call    $cdcd
bd45 cdcdcd    call    $cdcd
bd48 cdcdcd    call    $cdcd
bd4b cdcdcd    call    $cdcd
bd4e cdcdcd    call    $cdcd
bd51 cdcdcd    call    $cdcd
bd54 cdcdcd    call    $cdcd
bd57 cdcdcd    call    $cdcd
bd5a cdcdcd    call    $cdcd
bd5d cdcdcd    call    $cdcd
bd60 cdcdcd    call    $cdcd
bd63 cdcdcd    call    $cdcd
bd66 cdcdcd    call    $cdcd
bd69 cdcdcd    call    $cdcd
bd6c cdcdcd    call    $cdcd
bd6f cdcdcd    call    $cdcd
bd72 cdcdcd    call    $cdcd
bd75 cdcdcd    call    $cdcd
bd78 cdcdcd    call    $cdcd
bd7b cdcdcd    call    $cdcd
bd7e cdcdcd    call    $cdcd
bd81 cdcdcd    call    $cdcd
bd84 cdcdcd    call    $cdcd
bd87 cdcdcd    call    $cdcd
bd8a cdcdcd    call    $cdcd
bd8d cdcdcd    call    $cdcd
bd90 cdcdcd    call    $cdcd
bd93 cdcdcd    call    $cdcd
bd96 cdcdcd    call    $cdcd
bd99 cdcdcd    call    $cdcd
bd9c cdcdcd    call    $cdcd
bd9f cdcdcd    call    $cdcd
bda2 cdcdcd    call    $cdcd
bda5 cdcdcd    call    $cdcd
bda8 cdcdcd    call    $cdcd
bdab cdcdcd    call    $cdcd
bdae cdcdcd    call    $cdcd
bdb1 cdcdcd    call    $cdcd
bdb4 cdcdcd    call    $cdcd
bdb7 cdcdcd    call    $cdcd
bdba cdcdcd    call    $cdcd
bdbd cdcdcd    call    $cdcd
bdc0 cdcdcd    call    $cdcd
bdc3 cdcdcd    call    $cdcd
bdc6 cdcdcd    call    $cdcd
bdc9 cdcdcd    call    $cdcd
bdcc cdcdcd    call    $cdcd
bdcf cdcdcd    call    $cdcd
bdd2 cdcdcd    call    $cdcd
bdd5 cdcdcd    call    $cdcd
bdd8 cdcdcd    call    $cdcd
bddb cdcdcd    call    $cdcd
bdde cdcdcd    call    $cdcd
bde1 cdcdcd    call    $cdcd
bde4 cdcdcd    call    $cdcd
bde7 cdcdcd    call    $cdcd
bdea cdcdcd    call    $cdcd
bded cdcdcd    call    $cdcd
bdf0 cdcdcd    call    $cdcd
bdf3 cdcdcd    call    $cdcd
bdf6 cdcdcd    call    $cdcd
bdf9 cdcdcd    call    $cdcd
bdfc cdcdcd    call    $cdcd
bdff cdcdcd    call    $cdcd
be02 cdcdcd    call    $cdcd
be05 cdcdcd    call    $cdcd
be08 cdcdcd    call    $cdcd
be0b cdcdcd    call    $cdcd
be0e cdcdcd    call    $cdcd
be11 cdcdcd    call    $cdcd
be14 cdcdcd    call    $cdcd
be17 cdcdcd    call    $cdcd
be1a cdcdcd    call    $cdcd
be1d cdcdcd    call    $cdcd
be20 cdcdcd    call    $cdcd
be23 cdcdcd    call    $cdcd
be26 cdcdcd    call    $cdcd
be29 cdcdcd    call    $cdcd
be2c cdcdcd    call    $cdcd
be2f cdcdcd    call    $cdcd
be32 cdcdcd    call    $cdcd
be35 cdcdcd    call    $cdcd
be38 cdcdcd    call    $cdcd
be3b cdcdcd    call    $cdcd
be3e cdcdcd    call    $cdcd
be41 cdcdcd    call    $cdcd
be44 cdcdcd    call    $cdcd
be47 cdcdcd    call    $cdcd
be4a cdcdcd    call    $cdcd
be4d cdcdcd    call    $cdcd
be50 cdcdcd    call    $cdcd
be53 cdcdcd    call    $cdcd
be56 cdcdcd    call    $cdcd
be59 cdcdcd    call    $cdcd
be5c cdcdcd    call    $cdcd
be5f cdcdcd    call    $cdcd
be62 cdcdcd    call    $cdcd
be65 cdcdcd    call    $cdcd
be68 cdcdcd    call    $cdcd
be6b cdcdcd    call    $cdcd
be6e cdcdcd    call    $cdcd
be71 cdcdcd    call    $cdcd
be74 cdcdcd    call    $cdcd
be77 cdcdcd    call    $cdcd
be7a cdcdcd    call    $cdcd
be7d cdcdcd    call    $cdcd
be80 cdcdcd    call    $cdcd
be83 cdcdcd    call    $cdcd
be86 cdcdcd    call    $cdcd
be89 cdcdcd    call    $cdcd
be8c cdcdcd    call    $cdcd
be8f cdcdcd    call    $cdcd
be92 cdcdcd    call    $cdcd
be95 cdcdcd    call    $cdcd
be98 cdcdcd    call    $cdcd
be9b cdcdcd    call    $cdcd
be9e cdcdcd    call    $cdcd
bea1 cdcdcd    call    $cdcd
bea4 cdcdcd    call    $cdcd
bea7 cdcdcd    call    $cdcd
beaa cdcdcd    call    $cdcd
bead cdcdcd    call    $cdcd
beb0 cdcdcd    call    $cdcd
beb3 cdcdcd    call    $cdcd
beb6 cdcdcd    call    $cdcd
beb9 cdcdcd    call    $cdcd
bebc cdcdcd    call    $cdcd
bebf cdcdcd    call    $cdcd
bec2 cdcdcd    call    $cdcd
bec5 cdcdcd    call    $cdcd
bec8 cdcdcd    call    $cdcd
becb cdcdcd    call    $cdcd
bece cdcdcd    call    $cdcd
bed1 cdcdcd    call    $cdcd
bed4 cdcdcd    call    $cdcd
bed7 cdcdcd    call    $cdcd
beda cdcdcd    call    $cdcd
bedd cdcdcd    call    $cdcd
bee0 cdcdcd    call    $cdcd
bee3 cdcdcd    call    $cdcd
bee6 cdcdcd    call    $cdcd
bee9 cdcdcd    call    $cdcd
beec cdcdcd    call    $cdcd
beef cdcdcd    call    $cdcd
bef2 cdcdcd    call    $cdcd
bef5 cdcdcd    call    $cdcd
bef8 cdcdcd    call    $cdcd
befb cdcdcd    call    $cdcd
befe cdcdcd    call    $cdcd
bf01 cdcdcd    call    $cdcd
bf04 cdcdcd    call    $cdcd
bf07 cdcdcd    call    $cdcd
bf0a cdcdcd    call    $cdcd
bf0d cdcdcd    call    $cdcd
bf10 cdcdcd    call    $cdcd
bf13 cdcdcd    call    $cdcd
bf16 cdcdcd    call    $cdcd
bf19 cdcdcd    call    $cdcd
bf1c cdcdcd    call    $cdcd
bf1f cdcdcd    call    $cdcd
bf22 cdcdcd    call    $cdcd
bf25 cdcdcd    call    $cdcd
bf28 cdcdcd    call    $cdcd
bf2b cdcdcd    call    $cdcd
bf2e cdcdcd    call    $cdcd
bf31 cdcdcd    call    $cdcd
bf34 cdcdcd    call    $cdcd
bf37 cdcdcd    call    $cdcd
bf3a cdcdcd    call    $cdcd
bf3d cdcdcd    call    $cdcd
bf40 cdcdcd    call    $cdcd
bf43 cdcdcd    call    $cdcd
bf46 cdcdcd    call    $cdcd
bf49 cdcdcd    call    $cdcd
bf4c cdcdcd    call    $cdcd
bf4f cdcdcd    call    $cdcd
bf52 cdcdcd    call    $cdcd
bf55 cdcdcd    call    $cdcd
bf58 cdcdcd    call    $cdcd
bf5b cdcdcd    call    $cdcd
bf5e cdcdcd    call    $cdcd
bf61 cdcdcd    call    $cdcd
bf64 cdcdcd    call    $cdcd
bf67 cdcdcd    call    $cdcd
bf6a cdcdcd    call    $cdcd
bf6d cdcdcd    call    $cdcd
bf70 cdcdcd    call    $cdcd
bf73 cdcdcd    call    $cdcd
bf76 cdcdcd    call    $cdcd
bf79 cdcdcd    call    $cdcd
bf7c cdcdcd    call    $cdcd
bf7f cdcdcd    call    $cdcd
bf82 cdcdcd    call    $cdcd
bf85 cdcdcd    call    $cdcd
bf88 cdcdcd    call    $cdcd
bf8b cdcdcd    call    $cdcd
bf8e cdcdcd    call    $cdcd
bf91 cdcdcd    call    $cdcd
bf94 cdcdcd    call    $cdcd
bf97 cdcdcd    call    $cdcd
bf9a cdcdcd    call    $cdcd
bf9d cdcdcd    call    $cdcd
bfa0 cdcdcd    call    $cdcd
bfa3 cdcdcd    call    $cdcd
bfa6 cdcdcd    call    $cdcd
bfa9 cdcdcd    call    $cdcd
bfac cdcdcd    call    $cdcd
bfaf cdcdcd    call    $cdcd
bfb2 cdcdcd    call    $cdcd
bfb5 cdcdcd    call    $cdcd
bfb8 cdcdcd    call    $cdcd
bfbb cdcdcd    call    $cdcd
bfbe cdcdcd    call    $cdcd
bfc1 cdcdcd    call    $cdcd
bfc4 cdcdcd    call    $cdcd
bfc7 cdcdcd    call    $cdcd
bfca cdcdcd    call    $cdcd
bfcd cdcdcd    call    $cdcd
bfd0 cdcdcd    call    $cdcd
bfd3 cdcdcd    call    $cdcd
bfd6 cdcdcd    call    $cdcd
bfd9 cdcdcd    call    $cdcd
bfdc cdcdcd    call    $cdcd
bfdf cdcdcd    call    $cdcd
bfe2 cdcdcd    call    $cdcd
bfe5 cdcdcd    call    $cdcd
bfe8 cdcdcd    call    $cdcd
bfeb cdcdcd    call    $cdcd
bfee cdcdcd    call    $cdcd
bff1 cdcdcd    call    $cdcd
bff4 cdcdcd    call    $cdcd
bff7 cdcdcd    call    $cdcd
bffa cdcdcd    call    $cdcd
bffd cdcdcd    call    $cdcd
c000 cdcdcd    call    $cdcd
c003 cdcdcd    call    $cdcd
c006 cdcdcd    call    $cdcd
c009 cdcdcd    call    $cdcd
c00c cdcdcd    call    $cdcd
c00f cdcdcd    call    $cdcd
c012 cdcdcd    call    $cdcd
c015 cdcdcd    call    $cdcd
c018 cdcdcd    call    $cdcd
c01b cdcdcd    call    $cdcd
c01e cdcdcd    call    $cdcd
c021 cdcdcd    call    $cdcd
c024 cdcdcd    call    $cdcd
c027 cdcdcd    call    $cdcd
c02a cdcdcd    call    $cdcd
c02d cdcdcd    call    $cdcd
c030 cdcdcd    call    $cdcd
c033 cdcdcd    call    $cdcd
c036 cdcdcd    call    $cdcd
c039 cdcdcd    call    $cdcd
c03c cdcdcd    call    $cdcd
c03f cdcdcd    call    $cdcd
c042 cdcdcd    call    $cdcd
c045 cdcdcd    call    $cdcd
c048 cdcdcd    call    $cdcd
c04b cdcdcd    call    $cdcd
c04e cdcdcd    call    $cdcd
c051 cdcdcd    call    $cdcd
c054 cdcdcd    call    $cdcd
c057 cdcdcd    call    $cdcd
c05a cdcdcd    call    $cdcd
c05d cdcdcd    call    $cdcd
c060 cdcdcd    call    $cdcd
c063 cdcdcd    call    $cdcd
c066 cdcdcd    call    $cdcd
c069 cdcdcd    call    $cdcd
c06c cdcdcd    call    $cdcd
c06f cdcdcd    call    $cdcd
c072 cdcdcd    call    $cdcd
c075 cdcdcd    call    $cdcd
c078 cdcdcd    call    $cdcd
c07b cdcdcd    call    $cdcd
c07e cdcdcd    call    $cdcd
c081 cdcdcd    call    $cdcd
c084 cdcdcd    call    $cdcd
c087 cdcdcd    call    $cdcd
c08a cdcdcd    call    $cdcd
c08d cdcdcd    call    $cdcd
c090 cdcdcd    call    $cdcd
c093 cdcdcd    call    $cdcd
c096 cdcdcd    call    $cdcd
c099 cdcdcd    call    $cdcd
c09c cdcdcd    call    $cdcd
c09f cdcdcd    call    $cdcd
c0a2 cdcdcd    call    $cdcd
c0a5 cdcdcd    call    $cdcd
c0a8 cdcdcd    call    $cdcd
c0ab cdcdcd    call    $cdcd
c0ae cdcdcd    call    $cdcd
c0b1 cdcdcd    call    $cdcd
c0b4 cdcdcd    call    $cdcd
c0b7 cdcdcd    call    $cdcd
c0ba cdcdcd    call    $cdcd
c0bd cdcdcd    call    $cdcd
c0c0 cdcdcd    call    $cdcd
c0c3 cdcdcd    call    $cdcd
c0c6 cdcdcd    call    $cdcd
c0c9 cdcdcd    call    $cdcd
c0cc cdcdcd    call    $cdcd
c0cf cdcdcd    call    $cdcd
c0d2 cdcdcd    call    $cdcd
c0d5 cdcdcd    call    $cdcd
c0d8 cdcdcd    call    $cdcd
c0db cdcdcd    call    $cdcd
c0de cdcdcd    call    $cdcd
c0e1 cdcdcd    call    $cdcd
c0e4 cdcdcd    call    $cdcd
c0e7 cdcdcd    call    $cdcd
c0ea cdcdcd    call    $cdcd
c0ed cdcdcd    call    $cdcd
c0f0 cdcdcd    call    $cdcd
c0f3 cdcdcd    call    $cdcd
c0f6 cdcdcd    call    $cdcd
c0f9 cdcdcd    call    $cdcd
c0fc cdcdcd    call    $cdcd
c0ff cdcdcd    call    $cdcd
c102 cdcdcd    call    $cdcd
c105 cdcdcd    call    $cdcd
c108 cdcdcd    call    $cdcd
c10b cdcdcd    call    $cdcd
c10e cdcdcd    call    $cdcd
c111 cdcdcd    call    $cdcd
c114 cdcdcd    call    $cdcd
c117 cdcdcd    call    $cdcd
c11a cdcdcd    call    $cdcd
c11d cdcdcd    call    $cdcd
c120 cdcdcd    call    $cdcd
c123 cdcdcd    call    $cdcd
c126 cdcdcd    call    $cdcd
c129 cdcdcd    call    $cdcd
c12c cdcdcd    call    $cdcd
c12f cdcdcd    call    $cdcd
c132 cdcdcd    call    $cdcd
c135 cdcdcd    call    $cdcd
c138 cdcdcd    call    $cdcd
c13b cdcdcd    call    $cdcd
c13e cdcdcd    call    $cdcd
c141 cdcdcd    call    $cdcd
c144 cdcdcd    call    $cdcd
c147 cdcdcd    call    $cdcd
c14a cdcdcd    call    $cdcd
c14d cdcdcd    call    $cdcd
c150 cdcdcd    call    $cdcd
c153 cdcdcd    call    $cdcd
c156 cdcdcd    call    $cdcd
c159 cdcdcd    call    $cdcd
c15c cdcdcd    call    $cdcd
c15f cdcdcd    call    $cdcd
c162 cdcdcd    call    $cdcd
c165 cdcdcd    call    $cdcd
c168 cdcdcd    call    $cdcd
c16b cdcdcd    call    $cdcd
c16e cdcdcd    call    $cdcd
c171 cdcdcd    call    $cdcd
c174 cdcdcd    call    $cdcd
c177 cdcdcd    call    $cdcd
c17a cdcdcd    call    $cdcd
c17d cdcdcd    call    $cdcd
c180 cdcdcd    call    $cdcd
c183 cdcdcd    call    $cdcd
c186 cdcdcd    call    $cdcd
c189 cdcdcd    call    $cdcd
c18c cdcdcd    call    $cdcd
c18f cdcdcd    call    $cdcd
c192 cdcdcd    call    $cdcd
c195 cdcdcd    call    $cdcd
c198 cdcdcd    call    $cdcd
c19b cdcdcd    call    $cdcd
c19e cdcdcd    call    $cdcd
c1a1 cdcdcd    call    $cdcd
c1a4 cdcdcd    call    $cdcd
c1a7 cdcdcd    call    $cdcd
c1aa cdcdcd    call    $cdcd
c1ad cdcdcd    call    $cdcd
c1b0 cdcdcd    call    $cdcd
c1b3 cdcdcd    call    $cdcd
c1b6 cdcdcd    call    $cdcd
c1b9 cdcdcd    call    $cdcd
c1bc cdcdcd    call    $cdcd
c1bf cdcdcd    call    $cdcd
c1c2 cdcdcd    call    $cdcd
c1c5 cdcdcd    call    $cdcd
c1c8 cdcdcd    call    $cdcd
c1cb cdcdcd    call    $cdcd
c1ce cdcdcd    call    $cdcd
c1d1 cdcdcd    call    $cdcd
c1d4 cdcdcd    call    $cdcd
c1d7 cdcdcd    call    $cdcd
c1da cdcdcd    call    $cdcd
c1dd cdcdcd    call    $cdcd
c1e0 cdcdcd    call    $cdcd
c1e3 cdcdcd    call    $cdcd
c1e6 cdcdcd    call    $cdcd
c1e9 cdcdcd    call    $cdcd
c1ec cdcdcd    call    $cdcd
c1ef cdcdcd    call    $cdcd
c1f2 cdcdcd    call    $cdcd
c1f5 cdcdcd    call    $cdcd
c1f8 cdcdcd    call    $cdcd
c1fb cdcdcd    call    $cdcd
c1fe cdcdcd    call    $cdcd
c201 cdcdcd    call    $cdcd
c204 cdcdcd    call    $cdcd
c207 cdcdcd    call    $cdcd
c20a cdcdcd    call    $cdcd
c20d cdcdcd    call    $cdcd
c210 cdcdcd    call    $cdcd
c213 cdcdcd    call    $cdcd
c216 cdcdcd    call    $cdcd
c219 cdcdcd    call    $cdcd
c21c cdcdcd    call    $cdcd
c21f cdcdcd    call    $cdcd
c222 cdcdcd    call    $cdcd
c225 cdcdcd    call    $cdcd
c228 cdcdcd    call    $cdcd
c22b cdcdcd    call    $cdcd
c22e cdcdcd    call    $cdcd
c231 cdcdcd    call    $cdcd
c234 cdcdcd    call    $cdcd
c237 cdcdcd    call    $cdcd
c23a cdcdcd    call    $cdcd
c23d cdcdcd    call    $cdcd
c240 cdcdcd    call    $cdcd
c243 cdcdcd    call    $cdcd
c246 cdcdcd    call    $cdcd
c249 cdcdcd    call    $cdcd
c24c cdcdcd    call    $cdcd
c24f cdcdcd    call    $cdcd
c252 cdcdcd    call    $cdcd
c255 cdcdcd    call    $cdcd
c258 cdcdcd    call    $cdcd
c25b cdcdcd    call    $cdcd
c25e cdcdcd    call    $cdcd
c261 cdcdcd    call    $cdcd
c264 cdcdcd    call    $cdcd
c267 cdcdcd    call    $cdcd
c26a cdcdcd    call    $cdcd
c26d cdcdcd    call    $cdcd
c270 cdcdcd    call    $cdcd
c273 cdcdcd    call    $cdcd
c276 cdcdcd    call    $cdcd
c279 cdcdcd    call    $cdcd
c27c cdcdcd    call    $cdcd
c27f cdcdcd    call    $cdcd
c282 cdcdcd    call    $cdcd
c285 cdcdcd    call    $cdcd
c288 cdcdcd    call    $cdcd
c28b cdcdcd    call    $cdcd
c28e cdcdcd    call    $cdcd
c291 cdcdcd    call    $cdcd
c294 cdcdcd    call    $cdcd
c297 cdcdcd    call    $cdcd
c29a cdcdcd    call    $cdcd
c29d cdcdcd    call    $cdcd
c2a0 cdcdcd    call    $cdcd
c2a3 cdcdcd    call    $cdcd
c2a6 cdcdcd    call    $cdcd
c2a9 cdcdcd    call    $cdcd
c2ac cdcdcd    call    $cdcd
c2af cdcdcd    call    $cdcd
c2b2 cdcdcd    call    $cdcd
c2b5 cdcdcd    call    $cdcd
c2b8 cdcdcd    call    $cdcd
c2bb cdcdcd    call    $cdcd
c2be cdcdcd    call    $cdcd
c2c1 cdcdcd    call    $cdcd
c2c4 cdcdcd    call    $cdcd
c2c7 cdcdcd    call    $cdcd
c2ca cdcdcd    call    $cdcd
c2cd cdcdcd    call    $cdcd
c2d0 cdcdcd    call    $cdcd
c2d3 cdcdcd    call    $cdcd
c2d6 cdcdcd    call    $cdcd
c2d9 cdcdcd    call    $cdcd
c2dc cdcdcd    call    $cdcd
c2df cdcdcd    call    $cdcd
c2e2 cdcdcd    call    $cdcd
c2e5 cdcdcd    call    $cdcd
c2e8 cdcdcd    call    $cdcd
c2eb cdcdcd    call    $cdcd
c2ee cdcdcd    call    $cdcd
c2f1 cdcdcd    call    $cdcd
c2f4 cdcdcd    call    $cdcd
c2f7 cdcdcd    call    $cdcd
c2fa cdcdcd    call    $cdcd
c2fd cdcdcd    call    $cdcd
c300 cdcdcd    call    $cdcd
c303 cdcdcd    call    $cdcd
c306 cdcdcd    call    $cdcd
c309 cdcdcd    call    $cdcd
c30c cdcdcd    call    $cdcd
c30f cdcdcd    call    $cdcd
c312 cdcdcd    call    $cdcd
c315 cdcdcd    call    $cdcd
c318 cdcdcd    call    $cdcd
c31b cdcdcd    call    $cdcd
c31e cdcdcd    call    $cdcd
c321 cdcdcd    call    $cdcd
c324 cdcdcd    call    $cdcd
c327 cdcdcd    call    $cdcd
c32a cdcdcd    call    $cdcd
c32d cdcdcd    call    $cdcd
c330 cdcdcd    call    $cdcd
c333 cdcdcd    call    $cdcd
c336 cdcdcd    call    $cdcd
c339 cdcdcd    call    $cdcd
c33c cdcdcd    call    $cdcd
c33f cdcdcd    call    $cdcd
c342 cdcdcd    call    $cdcd
c345 cdcdcd    call    $cdcd
c348 cdcdcd    call    $cdcd
c34b cdcdcd    call    $cdcd
c34e cdcdcd    call    $cdcd
c351 cdcdcd    call    $cdcd
c354 cdcdcd    call    $cdcd
c357 cdcdcd    call    $cdcd
c35a cdcdcd    call    $cdcd
c35d cdcdcd    call    $cdcd
c360 cdcdcd    call    $cdcd
c363 cdcdcd    call    $cdcd
c366 cdcdcd    call    $cdcd
c369 cdcdcd    call    $cdcd
c36c cdcdcd    call    $cdcd
c36f cdcdcd    call    $cdcd
c372 cdcdcd    call    $cdcd
c375 cdcdcd    call    $cdcd
c378 cdcdcd    call    $cdcd
c37b cdcdcd    call    $cdcd
c37e cdcdcd    call    $cdcd
c381 cdcdcd    call    $cdcd
c384 cdcdcd    call    $cdcd
c387 cdcdcd    call    $cdcd
c38a cdcdcd    call    $cdcd
c38d cdcdcd    call    $cdcd
c390 cdcdcd    call    $cdcd
c393 cdcdcd    call    $cdcd
c396 cdcdcd    call    $cdcd
c399 cdcdcd    call    $cdcd
c39c cdcdcd    call    $cdcd
c39f cdcdcd    call    $cdcd
c3a2 cdcdcd    call    $cdcd
c3a5 cdcdcd    call    $cdcd
c3a8 cdcdcd    call    $cdcd
c3ab cdcdcd    call    $cdcd
c3ae cdcdcd    call    $cdcd
c3b1 cdcdcd    call    $cdcd
c3b4 cdcdcd    call    $cdcd
c3b7 cdcdcd    call    $cdcd
c3ba cdcdcd    call    $cdcd
c3bd cdcdcd    call    $cdcd
c3c0 cdcdcd    call    $cdcd
c3c3 cdcdcd    call    $cdcd
c3c6 cdcdcd    call    $cdcd
c3c9 cdcdcd    call    $cdcd
c3cc cdcdcd    call    $cdcd
c3cf cdcdcd    call    $cdcd
c3d2 cdcdcd    call    $cdcd
c3d5 cdcdcd    call    $cdcd
c3d8 cdcdcd    call    $cdcd
c3db cdcdcd    call    $cdcd
c3de cdcdcd    call    $cdcd
c3e1 cdcdcd    call    $cdcd
c3e4 cdcdcd    call    $cdcd
c3e7 cdcdcd    call    $cdcd
c3ea cdcdcd    call    $cdcd
c3ed cdcdcd    call    $cdcd
c3f0 cdcdcd    call    $cdcd
c3f3 cdcdcd    call    $cdcd
c3f6 cdcdcd    call    $cdcd
c3f9 cdcdcd    call    $cdcd
c3fc cdcdcd    call    $cdcd
c3ff cdcdcd    call    $cdcd
c402 cdcdcd    call    $cdcd
c405 cdcdcd    call    $cdcd
c408 cdcdcd    call    $cdcd
c40b cdcdcd    call    $cdcd
c40e cdcdcd    call    $cdcd
c411 cdcdcd    call    $cdcd
c414 cdcdcd    call    $cdcd
c417 cdcdcd    call    $cdcd
c41a cdcdcd    call    $cdcd
c41d cdcdcd    call    $cdcd
c420 cdcdcd    call    $cdcd
c423 cdcdcd    call    $cdcd
c426 cdcdcd    call    $cdcd
c429 cdcdcd    call    $cdcd
c42c cdcdcd    call    $cdcd
c42f cdcdcd    call    $cdcd
c432 cdcdcd    call    $cdcd
c435 cdcdcd    call    $cdcd
c438 cdcdcd    call    $cdcd
c43b cdcdcd    call    $cdcd
c43e cdcdcd    call    $cdcd
c441 cdcdcd    call    $cdcd
c444 cdcdcd    call    $cdcd
c447 cdcdcd    call    $cdcd
c44a cdcdcd    call    $cdcd
c44d cdcdcd    call    $cdcd
c450 cdcdcd    call    $cdcd
c453 cdcdcd    call    $cdcd
c456 cdcdcd    call    $cdcd
c459 cdcdcd    call    $cdcd
c45c cdcdcd    call    $cdcd
c45f cdcdcd    call    $cdcd
c462 cdcdcd    call    $cdcd
c465 cdcdcd    call    $cdcd
c468 cdcdcd    call    $cdcd
c46b cdcdcd    call    $cdcd
c46e cdcdcd    call    $cdcd
c471 cdcdcd    call    $cdcd
c474 cdcdcd    call    $cdcd
c477 cdcdcd    call    $cdcd
c47a cdcdcd    call    $cdcd
c47d cdcdcd    call    $cdcd
c480 cdcdcd    call    $cdcd
c483 cdcdcd    call    $cdcd
c486 cdcdcd    call    $cdcd
c489 cdcdcd    call    $cdcd
c48c cdcdcd    call    $cdcd
c48f cdcdcd    call    $cdcd
c492 cdcdcd    call    $cdcd
c495 cdcdcd    call    $cdcd
c498 cdcdcd    call    $cdcd
c49b cdcdcd    call    $cdcd
c49e cdcdcd    call    $cdcd
c4a1 cdcdcd    call    $cdcd
c4a4 cdcdcd    call    $cdcd
c4a7 cdcdcd    call    $cdcd
c4aa cdcdcd    call    $cdcd
c4ad cdcdcd    call    $cdcd
c4b0 cdcdcd    call    $cdcd
c4b3 cdcdcd    call    $cdcd
c4b6 cdcdcd    call    $cdcd
c4b9 cdcdcd    call    $cdcd
c4bc cdcdcd    call    $cdcd
c4bf cdcdcd    call    $cdcd
c4c2 cdcdcd    call    $cdcd
c4c5 cdcdcd    call    $cdcd
c4c8 cdcdcd    call    $cdcd
c4cb cdcdcd    call    $cdcd
c4ce cdcdcd    call    $cdcd
c4d1 cdcdcd    call    $cdcd
c4d4 cdcdcd    call    $cdcd
c4d7 cdcdcd    call    $cdcd
c4da cdcdcd    call    $cdcd
c4dd cdcdcd    call    $cdcd
c4e0 cdcdcd    call    $cdcd
c4e3 cdcdcd    call    $cdcd
c4e6 cdcdcd    call    $cdcd
c4e9 cdcdcd    call    $cdcd
c4ec cdcdcd    call    $cdcd
c4ef cdcdcd    call    $cdcd
c4f2 cdcdcd    call    $cdcd
c4f5 cdcdcd    call    $cdcd
c4f8 cdcdcd    call    $cdcd
c4fb cdcdcd    call    $cdcd
c4fe cdcdcd    call    $cdcd
c501 cdcdcd    call    $cdcd
c504 cdcdcd    call    $cdcd
c507 cdcdcd    call    $cdcd
c50a cdcdcd    call    $cdcd
c50d cdcdcd    call    $cdcd
c510 cdcdcd    call    $cdcd
c513 cdcdcd    call    $cdcd
c516 cdcdcd    call    $cdcd
c519 cdcdcd    call    $cdcd
c51c cdcdcd    call    $cdcd
c51f cdcdcd    call    $cdcd
c522 cdcdcd    call    $cdcd
c525 cdcdcd    call    $cdcd
c528 cdcdcd    call    $cdcd
c52b cdcdcd    call    $cdcd
c52e cdcdcd    call    $cdcd
c531 cdcdcd    call    $cdcd
c534 cdcdcd    call    $cdcd
c537 cdcdcd    call    $cdcd
c53a cdcdcd    call    $cdcd
c53d cdcdcd    call    $cdcd
c540 cdcdcd    call    $cdcd
c543 cdcdcd    call    $cdcd
c546 cdcdcd    call    $cdcd
c549 cdcdcd    call    $cdcd
c54c cdcdcd    call    $cdcd
c54f cdcdcd    call    $cdcd
c552 cdcdcd    call    $cdcd
c555 cdcdcd    call    $cdcd
c558 cdcdcd    call    $cdcd
c55b cdcdcd    call    $cdcd
c55e cdcdcd    call    $cdcd
c561 cdcdcd    call    $cdcd
c564 cdcdcd    call    $cdcd
c567 cdcdcd    call    $cdcd
c56a cdcdcd    call    $cdcd
c56d cdcdcd    call    $cdcd
c570 cdcdcd    call    $cdcd
c573 cdcdcd    call    $cdcd
c576 cdcdcd    call    $cdcd
c579 cdcdcd    call    $cdcd
c57c cdcdcd    call    $cdcd
c57f cdcdcd    call    $cdcd
c582 cdcdcd    call    $cdcd
c585 cdcdcd    call    $cdcd
c588 cdcdcd    call    $cdcd
c58b cdcdcd    call    $cdcd
c58e cdcdcd    call    $cdcd
c591 cdcdcd    call    $cdcd
c594 cdcdcd    call    $cdcd
c597 cdcdcd    call    $cdcd
c59a cdcdcd    call    $cdcd
c59d cdcdcd    call    $cdcd
c5a0 cdcdcd    call    $cdcd
c5a3 cdcdcd    call    $cdcd
c5a6 cdcdcd    call    $cdcd
c5a9 cdcdcd    call    $cdcd
c5ac cdcdcd    call    $cdcd
c5af cdcdcd    call    $cdcd
c5b2 cdcdcd    call    $cdcd
c5b5 cdcdcd    call    $cdcd
c5b8 cdcdcd    call    $cdcd
c5bb cdcdcd    call    $cdcd
c5be cdcdcd    call    $cdcd
c5c1 cdcdcd    call    $cdcd
c5c4 cdcdcd    call    $cdcd
c5c7 cdcdcd    call    $cdcd
c5ca cdcdcd    call    $cdcd
c5cd cdcdcd    call    $cdcd
c5d0 cdcdcd    call    $cdcd
c5d3 cdcdcd    call    $cdcd
c5d6 cdcdcd    call    $cdcd
c5d9 cdcdcd    call    $cdcd
c5dc cdcdcd    call    $cdcd
c5df cdcdcd    call    $cdcd
c5e2 cdcdcd    call    $cdcd
c5e5 cdcdcd    call    $cdcd
c5e8 cdcdcd    call    $cdcd
c5eb cdcdcd    call    $cdcd
c5ee cdcdcd    call    $cdcd
c5f1 cdcdcd    call    $cdcd
c5f4 cdcdcd    call    $cdcd
c5f7 cdcdcd    call    $cdcd
c5fa cdcdcd    call    $cdcd
c5fd cdcdcd    call    $cdcd
c600 cdcdcd    call    $cdcd
c603 cdcdcd    call    $cdcd
c606 cdcdcd    call    $cdcd
c609 cdcdcd    call    $cdcd
c60c cdcdcd    call    $cdcd
c60f cdcdcd    call    $cdcd
c612 cdcdcd    call    $cdcd
c615 cdcdcd    call    $cdcd
c618 cdcdcd    call    $cdcd
c61b cdcdcd    call    $cdcd
c61e cdcdcd    call    $cdcd
c621 cdcdcd    call    $cdcd
c624 cdcdcd    call    $cdcd
c627 cdcdcd    call    $cdcd
c62a cdcdcd    call    $cdcd
c62d cdcdcd    call    $cdcd
c630 cdcdcd    call    $cdcd
c633 cdcdcd    call    $cdcd
c636 cdcdcd    call    $cdcd
c639 cdcdcd    call    $cdcd
c63c cdcdcd    call    $cdcd
c63f cdcdcd    call    $cdcd
c642 cdcdcd    call    $cdcd
c645 cdcdcd    call    $cdcd
c648 cdcdcd    call    $cdcd
c64b cdcdcd    call    $cdcd
c64e cdcdcd    call    $cdcd
c651 cdcdcd    call    $cdcd
c654 cdcdcd    call    $cdcd
c657 cdcdcd    call    $cdcd
c65a cdcdcd    call    $cdcd
c65d cdcdcd    call    $cdcd
c660 cdcdcd    call    $cdcd
c663 cdcdcd    call    $cdcd
c666 cdcdcd    call    $cdcd
c669 cdcdcd    call    $cdcd
c66c cdcdcd    call    $cdcd
c66f cdcdcd    call    $cdcd
c672 cdcdcd    call    $cdcd
c675 cdcdcd    call    $cdcd
c678 cdcdcd    call    $cdcd
c67b cdcdcd    call    $cdcd
c67e cdcdcd    call    $cdcd
c681 cdcdcd    call    $cdcd
c684 cdcdcd    call    $cdcd
c687 cdcdcd    call    $cdcd
c68a cdcdcd    call    $cdcd
c68d cdcdcd    call    $cdcd
c690 cdcdcd    call    $cdcd
c693 cdcdcd    call    $cdcd
c696 cdcdcd    call    $cdcd
c699 cdcdcd    call    $cdcd
c69c cdcdcd    call    $cdcd
c69f cdcdcd    call    $cdcd
c6a2 cdcdcd    call    $cdcd
c6a5 cdcdcd    call    $cdcd
c6a8 cdcdcd    call    $cdcd
c6ab cdcdcd    call    $cdcd
c6ae cdcdcd    call    $cdcd
c6b1 cdcdcd    call    $cdcd
c6b4 cdcdcd    call    $cdcd
c6b7 cdcdcd    call    $cdcd
c6ba cdcdcd    call    $cdcd
c6bd cdcdcd    call    $cdcd
c6c0 cdcdcd    call    $cdcd
c6c3 cdcdcd    call    $cdcd
c6c6 cdcdcd    call    $cdcd
c6c9 cdcdcd    call    $cdcd
c6cc cdcdcd    call    $cdcd
c6cf cdcdcd    call    $cdcd
c6d2 cdcdcd    call    $cdcd
c6d5 cdcdcd    call    $cdcd
c6d8 cdcdcd    call    $cdcd
c6db cdcdcd    call    $cdcd
c6de cdcdcd    call    $cdcd
c6e1 cdcdcd    call    $cdcd
c6e4 cdcdcd    call    $cdcd
c6e7 cdcdcd    call    $cdcd
c6ea cdcdcd    call    $cdcd
c6ed cdcdcd    call    $cdcd
c6f0 cdcdcd    call    $cdcd
c6f3 cdcdcd    call    $cdcd
c6f6 cdcdcd    call    $cdcd
c6f9 cdcdcd    call    $cdcd
c6fc cdcdcd    call    $cdcd
c6ff cdcdcd    call    $cdcd
c702 cdcdcd    call    $cdcd
c705 cdcdcd    call    $cdcd
c708 cdcdcd    call    $cdcd
c70b cdcdcd    call    $cdcd
c70e cdcdcd    call    $cdcd
c711 cdcdcd    call    $cdcd
c714 cdcdcd    call    $cdcd
c717 cdcdcd    call    $cdcd
c71a cdcdcd    call    $cdcd
c71d cdcdcd    call    $cdcd
c720 cdcdcd    call    $cdcd
c723 cdcdcd    call    $cdcd
c726 cdcdcd    call    $cdcd
c729 cdcdcd    call    $cdcd
c72c cdcdcd    call    $cdcd
c72f cdcdcd    call    $cdcd
c732 cdcdcd    call    $cdcd
c735 cdcdcd    call    $cdcd
c738 cdcdcd    call    $cdcd
c73b cdcdcd    call    $cdcd
c73e cdcdcd    call    $cdcd
c741 cdcdcd    call    $cdcd
c744 cdcdcd    call    $cdcd
c747 cdcdcd    call    $cdcd
c74a cdcdcd    call    $cdcd
c74d cdcdcd    call    $cdcd
c750 cdcdcd    call    $cdcd
c753 cdcdcd    call    $cdcd
c756 cdcdcd    call    $cdcd
c759 cdcdcd    call    $cdcd
c75c cdcdcd    call    $cdcd
c75f cdcdcd    call    $cdcd
c762 cdcdcd    call    $cdcd
c765 cdcdcd    call    $cdcd
c768 cdcdcd    call    $cdcd
c76b cdcdcd    call    $cdcd
c76e cdcdcd    call    $cdcd
c771 cdcdcd    call    $cdcd
c774 cdcdcd    call    $cdcd
c777 cdcdcd    call    $cdcd
c77a cdcdcd    call    $cdcd
c77d cdcdcd    call    $cdcd
c780 cdcdcd    call    $cdcd
c783 cdcdcd    call    $cdcd
c786 cdcdcd    call    $cdcd
c789 cdcdcd    call    $cdcd
c78c cdcdcd    call    $cdcd
c78f cdcdcd    call    $cdcd
c792 cdcdcd    call    $cdcd
c795 cdcdcd    call    $cdcd
c798 cdcdcd    call    $cdcd
c79b cdcdcd    call    $cdcd
c79e cdcdcd    call    $cdcd
c7a1 cdcdcd    call    $cdcd
c7a4 cdcdcd    call    $cdcd
c7a7 cdcdcd    call    $cdcd
c7aa cdcdcd    call    $cdcd
c7ad cdcdcd    call    $cdcd
c7b0 cdcdcd    call    $cdcd
c7b3 cdcdcd    call    $cdcd
c7b6 cdcdcd    call    $cdcd
c7b9 cdcdcd    call    $cdcd
c7bc cdcdcd    call    $cdcd
c7bf cdcdcd    call    $cdcd
c7c2 cdcdcd    call    $cdcd
c7c5 cdcdcd    call    $cdcd
c7c8 cdcdcd    call    $cdcd
c7cb cdcdcd    call    $cdcd
c7ce cdcdcd    call    $cdcd
c7d1 cdcdcd    call    $cdcd
c7d4 cdcdcd    call    $cdcd
c7d7 cdcdcd    call    $cdcd
c7da cdcdcd    call    $cdcd
c7dd cdcdcd    call    $cdcd
c7e0 cdcdcd    call    $cdcd
c7e3 cdcdcd    call    $cdcd
c7e6 cdcdcd    call    $cdcd
c7e9 cdcdcd    call    $cdcd
c7ec cdcdcd    call    $cdcd
c7ef cdcdcd    call    $cdcd
c7f2 cdcdcd    call    $cdcd
c7f5 cdcdcd    call    $cdcd
c7f8 cdcdcd    call    $cdcd
c7fb cdcdcd    call    $cdcd
c7fe cdcdcd    call    $cdcd
c801 cdcdcd    call    $cdcd
c804 cdcdcd    call    $cdcd
c807 cdcdcd    call    $cdcd
c80a cdcdcd    call    $cdcd
c80d cdcdcd    call    $cdcd
c810 cdcdcd    call    $cdcd
c813 cdcdcd    call    $cdcd
c816 cdcdcd    call    $cdcd
c819 cdcdcd    call    $cdcd
c81c cdcdcd    call    $cdcd
c81f cdcdcd    call    $cdcd
c822 cdcdcd    call    $cdcd
c825 cdcdcd    call    $cdcd
c828 cdcdcd    call    $cdcd
c82b cdcdcd    call    $cdcd
c82e cdcdcd    call    $cdcd
c831 cdcdcd    call    $cdcd
c834 cdcdcd    call    $cdcd
c837 cdcdcd    call    $cdcd
c83a cdcdcd    call    $cdcd
c83d cdcdcd    call    $cdcd
c840 cdcdcd    call    $cdcd
c843 cdcdcd    call    $cdcd
c846 cdcdcd    call    $cdcd
c849 cdcdcd    call    $cdcd
c84c cdcdcd    call    $cdcd
c84f cdcdcd    call    $cdcd
c852 cdcdcd    call    $cdcd
c855 cdcdcd    call    $cdcd
c858 cdcdcd    call    $cdcd
c85b cdcdcd    call    $cdcd
c85e cdcdcd    call    $cdcd
c861 cdcdcd    call    $cdcd
c864 cdcdcd    call    $cdcd
c867 cdcdcd    call    $cdcd
c86a cdcdcd    call    $cdcd
c86d cdcdcd    call    $cdcd
c870 cdcdcd    call    $cdcd
c873 cdcdcd    call    $cdcd
c876 cdcdcd    call    $cdcd
c879 cdcdcd    call    $cdcd
c87c cdcdcd    call    $cdcd
c87f cdcdcd    call    $cdcd
c882 cdcdcd    call    $cdcd
c885 cdcdcd    call    $cdcd
c888 cdcdcd    call    $cdcd
c88b cdcdcd    call    $cdcd
c88e cdcdcd    call    $cdcd
c891 cdcdcd    call    $cdcd
c894 cdcdcd    call    $cdcd
c897 cdcdcd    call    $cdcd
c89a cdcdcd    call    $cdcd
c89d cdcdcd    call    $cdcd
c8a0 cdcdcd    call    $cdcd
c8a3 cdcdcd    call    $cdcd
c8a6 cdcdcd    call    $cdcd
c8a9 cdcdcd    call    $cdcd
c8ac cdcdcd    call    $cdcd
c8af cdcdcd    call    $cdcd
c8b2 cdcdcd    call    $cdcd
c8b5 cdcdcd    call    $cdcd
c8b8 cdcdcd    call    $cdcd
c8bb cdcdcd    call    $cdcd
c8be cdcdcd    call    $cdcd
c8c1 cdcdcd    call    $cdcd
c8c4 cdcdcd    call    $cdcd
c8c7 cdcdcd    call    $cdcd
c8ca cdcdcd    call    $cdcd
c8cd cdcdcd    call    $cdcd
c8d0 cdcdcd    call    $cdcd
c8d3 cdcdcd    call    $cdcd
c8d6 cdcdcd    call    $cdcd
c8d9 cdcdcd    call    $cdcd
c8dc cdcdcd    call    $cdcd
c8df cdcdcd    call    $cdcd
c8e2 cdcdcd    call    $cdcd
c8e5 cdcdcd    call    $cdcd
c8e8 cdcdcd    call    $cdcd
c8eb cdcdcd    call    $cdcd
c8ee cdcdcd    call    $cdcd
c8f1 cdcdcd    call    $cdcd
c8f4 cdcdcd    call    $cdcd
c8f7 cdcdcd    call    $cdcd
c8fa cdcdcd    call    $cdcd
c8fd cdcdcd    call    $cdcd
c900 cdcdcd    call    $cdcd
c903 cdcdcd    call    $cdcd
c906 cdcdcd    call    $cdcd
c909 cdcdcd    call    $cdcd
c90c cdcdcd    call    $cdcd
c90f cdcdcd    call    $cdcd
c912 cdcdcd    call    $cdcd
c915 cdcdcd    call    $cdcd
c918 cdcdcd    call    $cdcd
c91b cdcdcd    call    $cdcd
c91e cdcdcd    call    $cdcd
c921 cdcdcd    call    $cdcd
c924 cdcdcd    call    $cdcd
c927 cdcdcd    call    $cdcd
c92a cdcdcd    call    $cdcd
c92d cdcdcd    call    $cdcd
c930 cdcdcd    call    $cdcd
c933 cdcdcd    call    $cdcd
c936 cdcdcd    call    $cdcd
c939 cdcdcd    call    $cdcd
c93c cdcdcd    call    $cdcd
c93f cdcdcd    call    $cdcd
c942 cdcdcd    call    $cdcd
c945 cdcdcd    call    $cdcd
c948 cdcdcd    call    $cdcd
c94b cdcdcd    call    $cdcd
c94e cdcdcd    call    $cdcd
c951 cdcdcd    call    $cdcd
c954 cdcdcd    call    $cdcd
c957 cdcdcd    call    $cdcd
c95a cdcdcd    call    $cdcd
c95d cdcdcd    call    $cdcd
c960 cdcdcd    call    $cdcd
c963 cdcdcd    call    $cdcd
c966 cdcdcd    call    $cdcd
c969 cdcdcd    call    $cdcd
c96c cdcdcd    call    $cdcd
c96f cdcdcd    call    $cdcd
c972 cdcdcd    call    $cdcd
c975 cdcdcd    call    $cdcd
c978 cdcdcd    call    $cdcd
c97b cdcdcd    call    $cdcd
c97e cdcdcd    call    $cdcd
c981 cdcdcd    call    $cdcd
c984 cdcdcd    call    $cdcd
c987 cdcdcd    call    $cdcd
c98a cdcdcd    call    $cdcd
c98d cdcdcd    call    $cdcd
c990 cdcdcd    call    $cdcd
c993 cdcdcd    call    $cdcd
c996 cdcdcd    call    $cdcd
c999 cdcdcd    call    $cdcd
c99c cdcdcd    call    $cdcd
c99f cdcdcd    call    $cdcd
c9a2 cdcdcd    call    $cdcd
c9a5 cdcdcd    call    $cdcd
c9a8 cdcdcd    call    $cdcd
c9ab cdcdcd    call    $cdcd
c9ae cdcdcd    call    $cdcd
c9b1 cdcdcd    call    $cdcd
c9b4 cdcdcd    call    $cdcd
c9b7 cdcdcd    call    $cdcd
c9ba cdcdcd    call    $cdcd
c9bd cdcdcd    call    $cdcd
c9c0 cdcdcd    call    $cdcd
c9c3 cdcdcd    call    $cdcd
c9c6 cdcdcd    call    $cdcd
c9c9 cdcdcd    call    $cdcd
c9cc cdcdcd    call    $cdcd
c9cf cdcdcd    call    $cdcd
c9d2 cdcdcd    call    $cdcd
c9d5 cdcdcd    call    $cdcd
c9d8 cdcdcd    call    $cdcd
c9db cdcdcd    call    $cdcd
c9de cdcdcd    call    $cdcd
c9e1 cdcdcd    call    $cdcd
c9e4 cdcdcd    call    $cdcd
c9e7 cdcdcd    call    $cdcd
c9ea cdcdcd    call    $cdcd
c9ed cdcdcd    call    $cdcd
c9f0 cdcdcd    call    $cdcd
c9f3 cdcdcd    call    $cdcd
c9f6 cdcdcd    call    $cdcd
c9f9 cdcdcd    call    $cdcd
c9fc cdcdcd    call    $cdcd
c9ff cdcdcd    call    $cdcd
ca02 cdcdcd    call    $cdcd
ca05 cdcdcd    call    $cdcd
ca08 cdcdcd    call    $cdcd
ca0b cdcdcd    call    $cdcd
ca0e cdcdcd    call    $cdcd
ca11 cdcdcd    call    $cdcd
ca14 cdcdcd    call    $cdcd
ca17 cdcdcd    call    $cdcd
ca1a cdcdcd    call    $cdcd
ca1d cdcdcd    call    $cdcd
ca20 cdcdcd    call    $cdcd
ca23 cdcdcd    call    $cdcd
ca26 cdcdcd    call    $cdcd
ca29 cdcdcd    call    $cdcd
ca2c cdcdcd    call    $cdcd
ca2f cdcdcd    call    $cdcd
ca32 cdcdcd    call    $cdcd
ca35 cdcdcd    call    $cdcd
ca38 cdcdcd    call    $cdcd
ca3b cdcdcd    call    $cdcd
ca3e cdcdcd    call    $cdcd
ca41 cdcdcd    call    $cdcd
ca44 cdcdcd    call    $cdcd
ca47 cdcdcd    call    $cdcd
ca4a cdcdcd    call    $cdcd
ca4d cdcdcd    call    $cdcd
ca50 cdcdcd    call    $cdcd
ca53 cdcdcd    call    $cdcd
ca56 cdcdcd    call    $cdcd
ca59 cdcdcd    call    $cdcd
ca5c cdcdcd    call    $cdcd
ca5f cdcdcd    call    $cdcd
ca62 cdcdcd    call    $cdcd
ca65 cdcdcd    call    $cdcd
ca68 cdcdcd    call    $cdcd
ca6b cdcdcd    call    $cdcd
ca6e cdcdcd    call    $cdcd
ca71 cdcdcd    call    $cdcd
ca74 cdcdcd    call    $cdcd
ca77 cdcdcd    call    $cdcd
ca7a cdcdcd    call    $cdcd
ca7d cdcdcd    call    $cdcd
ca80 cdcdcd    call    $cdcd
ca83 cdcdcd    call    $cdcd
ca86 cdcdcd    call    $cdcd
ca89 cdcdcd    call    $cdcd
ca8c cdcdcd    call    $cdcd
ca8f cdcdcd    call    $cdcd
ca92 cdcdcd    call    $cdcd
ca95 cdcdcd    call    $cdcd
ca98 cdcdcd    call    $cdcd
ca9b cdcdcd    call    $cdcd
ca9e cdcdcd    call    $cdcd
caa1 cdcdcd    call    $cdcd
caa4 cdcdcd    call    $cdcd
caa7 cdcdcd    call    $cdcd
caaa cdcdcd    call    $cdcd
caad cdcdcd    call    $cdcd
cab0 cdcdcd    call    $cdcd
cab3 cdcdcd    call    $cdcd
cab6 cdcdcd    call    $cdcd
cab9 cdcdcd    call    $cdcd
cabc cdcdcd    call    $cdcd
cabf cdcdcd    call    $cdcd
cac2 cdcdcd    call    $cdcd
cac5 cdcdcd    call    $cdcd
cac8 cdcdcd    call    $cdcd
cacb cdcdcd    call    $cdcd
cace cdcdcd    call    $cdcd
cad1 cdcdcd    call    $cdcd
cad4 cdcdcd    call    $cdcd
cad7 cdcdcd    call    $cdcd
cada cdcdcd    call    $cdcd
cadd cdcdcd    call    $cdcd
cae0 cdcdcd    call    $cdcd
cae3 cdcdcd    call    $cdcd
cae6 cdcdcd    call    $cdcd
cae9 cdcdcd    call    $cdcd
caec cdcdcd    call    $cdcd
caef cdcdcd    call    $cdcd
caf2 cdcdcd    call    $cdcd
caf5 cdcdcd    call    $cdcd
caf8 cdcdcd    call    $cdcd
cafb cdcdcd    call    $cdcd
cafe cdcdcd    call    $cdcd
cb01 cdcdcd    call    $cdcd
cb04 cdcdcd    call    $cdcd
cb07 cdcdcd    call    $cdcd
cb0a cdcdcd    call    $cdcd
cb0d cdcdcd    call    $cdcd
cb10 cdcdcd    call    $cdcd
cb13 cdcdcd    call    $cdcd
cb16 cdcdcd    call    $cdcd
cb19 cdcdcd    call    $cdcd
cb1c cdcdcd    call    $cdcd
cb1f cdcdcd    call    $cdcd
cb22 cdcdcd    call    $cdcd
cb25 cdcdcd    call    $cdcd
cb28 cdcdcd    call    $cdcd
cb2b cdcdcd    call    $cdcd
cb2e cdcdcd    call    $cdcd
cb31 cdcdcd    call    $cdcd
cb34 cdcdcd    call    $cdcd
cb37 cdcdcd    call    $cdcd
cb3a cdcdcd    call    $cdcd
cb3d cdcdcd    call    $cdcd
cb40 cdcdcd    call    $cdcd
cb43 cdcdcd    call    $cdcd
cb46 cdcdcd    call    $cdcd
cb49 cdcdcd    call    $cdcd
cb4c cdcdcd    call    $cdcd
cb4f cdcdcd    call    $cdcd
cb52 cdcdcd    call    $cdcd
cb55 cdcdcd    call    $cdcd
cb58 cdcdcd    call    $cdcd
cb5b cdcdcd    call    $cdcd
cb5e cdcdcd    call    $cdcd
cb61 cdcdcd    call    $cdcd
cb64 cdcdcd    call    $cdcd
cb67 cdcdcd    call    $cdcd
cb6a cdcdcd    call    $cdcd
cb6d cdcdcd    call    $cdcd
cb70 cdcdcd    call    $cdcd
cb73 cdcdcd    call    $cdcd
cb76 cdcdcd    call    $cdcd
cb79 cdcdcd    call    $cdcd
cb7c cdcdcd    call    $cdcd
cb7f cdcdcd    call    $cdcd
cb82 cdcdcd    call    $cdcd
cb85 cdcdcd    call    $cdcd
cb88 cdcdcd    call    $cdcd
cb8b cdcdcd    call    $cdcd
cb8e cdcdcd    call    $cdcd
cb91 cdcdcd    call    $cdcd
cb94 cdcdcd    call    $cdcd
cb97 cdcdcd    call    $cdcd
cb9a cdcdcd    call    $cdcd
cb9d cdcdcd    call    $cdcd
cba0 cdcdcd    call    $cdcd
cba3 cdcdcd    call    $cdcd
cba6 cdcdcd    call    $cdcd
cba9 cdcdcd    call    $cdcd
cbac cdcdcd    call    $cdcd
cbaf cdcdcd    call    $cdcd
cbb2 cdcdcd    call    $cdcd
cbb5 cdcdcd    call    $cdcd
cbb8 cdcdcd    call    $cdcd
cbbb cdcdcd    call    $cdcd
cbbe cdcdcd    call    $cdcd
cbc1 cdcdcd    call    $cdcd
cbc4 cdcdcd    call    $cdcd
cbc7 cdcdcd    call    $cdcd
cbca cdcdcd    call    $cdcd
cbcd cdcdcd    call    $cdcd
cbd0 cdcdcd    call    $cdcd
cbd3 cdcdcd    call    $cdcd
cbd6 cdcdcd    call    $cdcd
cbd9 cdcdcd    call    $cdcd
cbdc cdcdcd    call    $cdcd
cbdf cdcdcd    call    $cdcd
cbe2 cdcdcd    call    $cdcd
cbe5 cdcdcd    call    $cdcd
cbe8 cdcdcd    call    $cdcd
cbeb cdcdcd    call    $cdcd
cbee cdcdcd    call    $cdcd
cbf1 cdcdcd    call    $cdcd
cbf4 cdcdcd    call    $cdcd
cbf7 cdcdcd    call    $cdcd
cbfa cdcdcd    call    $cdcd
cbfd cdcdcd    call    $cdcd
cc00 cdcdcd    call    $cdcd
cc03 cdcdcd    call    $cdcd
cc06 cdcdcd    call    $cdcd
cc09 cdcdcd    call    $cdcd
cc0c cdcdcd    call    $cdcd
cc0f cdcdcd    call    $cdcd
cc12 cdcdcd    call    $cdcd
cc15 cdcdcd    call    $cdcd
cc18 cdcdcd    call    $cdcd
cc1b cdcdcd    call    $cdcd
cc1e cdcdcd    call    $cdcd
cc21 cdcdcd    call    $cdcd
cc24 cdcdcd    call    $cdcd
cc27 cdcdcd    call    $cdcd
cc2a cdcdcd    call    $cdcd
cc2d cdcdcd    call    $cdcd
cc30 cdcdcd    call    $cdcd
cc33 cdcdcd    call    $cdcd
cc36 cdcdcd    call    $cdcd
cc39 cdcdcd    call    $cdcd
cc3c cdcdcd    call    $cdcd
cc3f cdcdcd    call    $cdcd
cc42 cdcdcd    call    $cdcd
cc45 cdcdcd    call    $cdcd
cc48 cdcdcd    call    $cdcd
cc4b cdcdcd    call    $cdcd
cc4e cdcdcd    call    $cdcd
cc51 cdcdcd    call    $cdcd
cc54 cdcdcd    call    $cdcd
cc57 cdcdcd    call    $cdcd
cc5a cdcdcd    call    $cdcd
cc5d cdcdcd    call    $cdcd
cc60 cdcdcd    call    $cdcd
cc63 cdcdcd    call    $cdcd
cc66 cdcdcd    call    $cdcd
cc69 cdcdcd    call    $cdcd
cc6c cdcdcd    call    $cdcd
cc6f cdcdcd    call    $cdcd
cc72 cdcdcd    call    $cdcd
cc75 cdcdcd    call    $cdcd
cc78 cdcdcd    call    $cdcd
cc7b cdcdcd    call    $cdcd
cc7e cdcdcd    call    $cdcd
cc81 cdcdcd    call    $cdcd
cc84 cdcdcd    call    $cdcd
cc87 cdcdcd    call    $cdcd
cc8a cdcdcd    call    $cdcd
cc8d cdcdcd    call    $cdcd
cc90 cdcdcd    call    $cdcd
cc93 cdcdcd    call    $cdcd
cc96 cdcdcd    call    $cdcd
cc99 cdcdcd    call    $cdcd
cc9c cdcdcd    call    $cdcd
cc9f cdcdcd    call    $cdcd
cca2 cdcdcd    call    $cdcd
cca5 cdcdcd    call    $cdcd
cca8 cdcdcd    call    $cdcd
ccab cdcdcd    call    $cdcd
ccae cdcdcd    call    $cdcd
ccb1 cdcdcd    call    $cdcd
ccb4 cdcdcd    call    $cdcd
ccb7 cdcdcd    call    $cdcd
ccba cdcdcd    call    $cdcd
ccbd cdcdcd    call    $cdcd
ccc0 cdcdcd    call    $cdcd
ccc3 cdcdcd    call    $cdcd
ccc6 cdcdcd    call    $cdcd
ccc9 cdcdcd    call    $cdcd
cccc cdcdcd    call    $cdcd
cccf cdcdcd    call    $cdcd
ccd2 cdcdcd    call    $cdcd
ccd5 cdcdcd    call    $cdcd
ccd8 cdcdcd    call    $cdcd
ccdb cdcdcd    call    $cdcd
ccde cdcdcd    call    $cdcd
cce1 cdcdcd    call    $cdcd
cce4 cdcdcd    call    $cdcd
cce7 cdcdcd    call    $cdcd
ccea cdcdcd    call    $cdcd
cced cdcdcd    call    $cdcd
ccf0 cdcdcd    call    $cdcd
ccf3 cdcdcd    call    $cdcd
ccf6 cdcdcd    call    $cdcd
ccf9 cdcdcd    call    $cdcd
ccfc cdcdcd    call    $cdcd
ccff cdcdcd    call    $cdcd
cd02 cdcdcd    call    $cdcd
cd05 cdcdcd    call    $cdcd
cd08 cdcdcd    call    $cdcd
cd0b cdcdcd    call    $cdcd
cd0e cdcdcd    call    $cdcd
cd11 cdcdcd    call    $cdcd
cd14 cdcdcd    call    $cdcd
cd17 cdcdcd    call    $cdcd
cd1a cdcdcd    call    $cdcd
cd1d cdcdcd    call    $cdcd
cd20 cdcdcd    call    $cdcd
cd23 cdcdcd    call    $cdcd
cd26 cdcdcd    call    $cdcd
cd29 cdcdcd    call    $cdcd
cd2c cdcdcd    call    $cdcd
cd2f cdcdcd    call    $cdcd
cd32 cdcdcd    call    $cdcd
cd35 cdcdcd    call    $cdcd
cd38 cdcdcd    call    $cdcd
cd3b cdcdcd    call    $cdcd
cd3e cdcdcd    call    $cdcd
cd41 cdcdcd    call    $cdcd
cd44 cdcdcd    call    $cdcd
cd47 cdcdcd    call    $cdcd
cd4a cdcdcd    call    $cdcd
cd4d cdcdcd    call    $cdcd
cd50 cdcdcd    call    $cdcd
cd53 cdcdcd    call    $cdcd
cd56 cdcdcd    call    $cdcd
cd59 cdcdcd    call    $cdcd
cd5c cdcdcd    call    $cdcd
cd5f cdcdcd    call    $cdcd
cd62 cdcdcd    call    $cdcd
cd65 cdcdcd    call    $cdcd
cd68 cdcdcd    call    $cdcd
cd6b cdcdcd    call    $cdcd
cd6e cdcdcd    call    $cdcd
cd71 cdcdcd    call    $cdcd
cd74 cdcdcd    call    $cdcd
cd77 cdcdcd    call    $cdcd
cd7a cdcdcd    call    $cdcd
cd7d cdcdcd    call    $cdcd
cd80 cdcdcd    call    $cdcd
cd83 cdcdcd    call    $cdcd
cd86 cdcdcd    call    $cdcd
cd89 cdcdcd    call    $cdcd
cd8c cdcdcd    call    $cdcd
cd8f cdcdcd    call    $cdcd
cd92 cdcdcd    call    $cdcd
cd95 cdcdcd    call    $cdcd
cd98 cdcdcd    call    $cdcd
cd9b cdcdcd    call    $cdcd
cd9e cdcdcd    call    $cdcd
cda1 cdcdcd    call    $cdcd
cda4 cdcdcd    call    $cdcd
cda7 cdcdcd    call    $cdcd
cdaa cdcdcd    call    $cdcd
cdad cdcdcd    call    $cdcd
cdb0 cdcdcd    call    $cdcd
cdb3 cdcdcd    call    $cdcd
cdb6 cdcdcd    call    $cdcd
cdb9 cdcdcd    call    $cdcd
cdbc cdcdcd    call    $cdcd
cdbf cdcdcd    call    $cdcd
cdc2 cdcdcd    call    $cdcd
cdc5 cdcdcd    call    $cdcd
cdc8 cdcdcd    call    $cdcd
cdcb cdcdcd    call    $cdcd
cdce cdcdcd    call    $cdcd
cdd1 cdcdcd    call    $cdcd
cdd4 cdcdcd    call    $cdcd
cdd7 cdcdcd    call    $cdcd
cdda cdcdcd    call    $cdcd
cddd cdcdcd    call    $cdcd
cde0 cdcdcd    call    $cdcd
cde3 cdcdcd    call    $cdcd
cde6 cdcdcd    call    $cdcd
cde9 cdcdcd    call    $cdcd
cdec cdcdcd    call    $cdcd
cdef cdcdcd    call    $cdcd
cdf2 cdcdcd    call    $cdcd
cdf5 cdcdcd    call    $cdcd
cdf8 cdcdcd    call    $cdcd
cdfb cdcdcd    call    $cdcd
cdfe cdcdcd    call    $cdcd
ce01 cdcdcd    call    $cdcd
ce04 cdcdcd    call    $cdcd
ce07 cdcdcd    call    $cdcd
ce0a cdcdcd    call    $cdcd
ce0d cdcdcd    call    $cdcd
ce10 cdcdcd    call    $cdcd
ce13 cdcdcd    call    $cdcd
ce16 cdcdcd    call    $cdcd
ce19 cdcdcd    call    $cdcd
ce1c cdcdcd    call    $cdcd
ce1f cdcdcd    call    $cdcd
ce22 cdcdcd    call    $cdcd
ce25 cdcdcd    call    $cdcd
ce28 cdcdcd    call    $cdcd
ce2b cdcdcd    call    $cdcd
ce2e cdcdcd    call    $cdcd
ce31 cdcdcd    call    $cdcd
ce34 cdcdcd    call    $cdcd
ce37 cdcdcd    call    $cdcd
ce3a cdcdcd    call    $cdcd
ce3d cdcdcd    call    $cdcd
ce40 cdcdcd    call    $cdcd
ce43 cdcdcd    call    $cdcd
ce46 cdcdcd    call    $cdcd
ce49 cdcdcd    call    $cdcd
ce4c cdcdcd    call    $cdcd
ce4f cdcdcd    call    $cdcd
ce52 cdcdcd    call    $cdcd
ce55 cdcdcd    call    $cdcd
ce58 cdcdcd    call    $cdcd
ce5b cdcdcd    call    $cdcd
ce5e cdcdcd    call    $cdcd
ce61 cdcdcd    call    $cdcd
ce64 cdcdcd    call    $cdcd
ce67 cdcdcd    call    $cdcd
ce6a cdcdcd    call    $cdcd
ce6d cdcdcd    call    $cdcd
ce70 cdcdcd    call    $cdcd
ce73 cdcdcd    call    $cdcd
ce76 cdcdcd    call    $cdcd
ce79 cdcdcd    call    $cdcd
ce7c cdcdcd    call    $cdcd
ce7f cdcdcd    call    $cdcd
ce82 cdcdcd    call    $cdcd
ce85 cdcdcd    call    $cdcd
ce88 cdcdcd    call    $cdcd
ce8b cdcdcd    call    $cdcd
ce8e cdcdcd    call    $cdcd
ce91 cdcdcd    call    $cdcd
ce94 cdcdcd    call    $cdcd
ce97 cdcdcd    call    $cdcd
ce9a cdcdcd    call    $cdcd
ce9d cdcdcd    call    $cdcd
cea0 cdcdcd    call    $cdcd
cea3 cdcdcd    call    $cdcd
cea6 cdcdcd    call    $cdcd
cea9 cdcdcd    call    $cdcd
ceac cdcdcd    call    $cdcd
ceaf cdcdcd    call    $cdcd
ceb2 cdcdcd    call    $cdcd
ceb5 cdcdcd    call    $cdcd
ceb8 cdcdcd    call    $cdcd
cebb cdcdcd    call    $cdcd
cebe cdcdcd    call    $cdcd
cec1 cdcdcd    call    $cdcd
cec4 cdcdcd    call    $cdcd
cec7 cdcdcd    call    $cdcd
ceca cdcdcd    call    $cdcd
cecd cdcdcd    call    $cdcd
ced0 cdcdcd    call    $cdcd
ced3 cdcdcd    call    $cdcd
ced6 cdcdcd    call    $cdcd
ced9 cdcdcd    call    $cdcd
cedc cdcdcd    call    $cdcd
cedf cdcdcd    call    $cdcd
cee2 cdcdcd    call    $cdcd
cee5 cdcdcd    call    $cdcd
cee8 cdcdcd    call    $cdcd
ceeb cdcdcd    call    $cdcd
ceee cdcdcd    call    $cdcd
cef1 cdcdcd    call    $cdcd
cef4 cdcdcd    call    $cdcd
cef7 cdcdcd    call    $cdcd
cefa cdcdcd    call    $cdcd
cefd cdcdcd    call    $cdcd
cf00 cdcdcd    call    $cdcd
cf03 cdcdcd    call    $cdcd
cf06 cdcdcd    call    $cdcd
cf09 cdcdcd    call    $cdcd
cf0c cdcdcd    call    $cdcd
cf0f cdcdcd    call    $cdcd
cf12 cdcdcd    call    $cdcd
cf15 cdcdcd    call    $cdcd
cf18 cdcdcd    call    $cdcd
cf1b cdcdcd    call    $cdcd
cf1e cdcdcd    call    $cdcd
cf21 cdcdcd    call    $cdcd
cf24 cdcdcd    call    $cdcd
cf27 cdcdcd    call    $cdcd
cf2a cdcdcd    call    $cdcd
cf2d cdcdcd    call    $cdcd
cf30 cdcdcd    call    $cdcd
cf33 cdcdcd    call    $cdcd
cf36 cdcdcd    call    $cdcd
cf39 cdcdcd    call    $cdcd
cf3c cdcdcd    call    $cdcd
cf3f cdcdcd    call    $cdcd
cf42 cdcdcd    call    $cdcd
cf45 cdcdcd    call    $cdcd
cf48 cdcdcd    call    $cdcd
cf4b cdcdcd    call    $cdcd
cf4e cdcdcd    call    $cdcd
cf51 cdcdcd    call    $cdcd
cf54 cdcdcd    call    $cdcd
cf57 cdcdcd    call    $cdcd
cf5a cdcdcd    call    $cdcd
cf5d cdcdcd    call    $cdcd
cf60 cdcdcd    call    $cdcd
cf63 cdcdcd    call    $cdcd
cf66 cdcdcd    call    $cdcd
cf69 cdcdcd    call    $cdcd
cf6c cdcdcd    call    $cdcd
cf6f cdcdcd    call    $cdcd
cf72 cdcdcd    call    $cdcd
cf75 cdcdcd    call    $cdcd
cf78 cdcdcd    call    $cdcd
cf7b cdcdcd    call    $cdcd
cf7e cdcdcd    call    $cdcd
cf81 cdcdcd    call    $cdcd
cf84 cdcdcd    call    $cdcd
cf87 cdcdcd    call    $cdcd
cf8a cdcdcd    call    $cdcd
cf8d cdcdcd    call    $cdcd
cf90 cdcdcd    call    $cdcd
cf93 cdcdcd    call    $cdcd
cf96 cdcdcd    call    $cdcd
cf99 cdcdcd    call    $cdcd
cf9c cdcdcd    call    $cdcd
cf9f cdcdcd    call    $cdcd
cfa2 cdcdcd    call    $cdcd
cfa5 cdcdcd    call    $cdcd
cfa8 cdcdcd    call    $cdcd
cfab cdcdcd    call    $cdcd
cfae cdcdcd    call    $cdcd
cfb1 cdcdcd    call    $cdcd
cfb4 cdcdcd    call    $cdcd
cfb7 cdcdcd    call    $cdcd
cfba cdcdcd    call    $cdcd
cfbd cdcdcd    call    $cdcd
cfc0 cdcdcd    call    $cdcd
cfc3 cdcdcd    call    $cdcd
cfc6 cdcdcd    call    $cdcd
cfc9 cdcdcd    call    $cdcd
cfcc cdcdcd    call    $cdcd
cfcf cdcdcd    call    $cdcd
cfd2 cdcdcd    call    $cdcd
cfd5 cdcdcd    call    $cdcd
cfd8 cdcdcd    call    $cdcd
cfdb cdcdcd    call    $cdcd
cfde cdcdcd    call    $cdcd
cfe1 cdcdcd    call    $cdcd
cfe4 cdcdcd    call    $cdcd
cfe7 cdcdcd    call    $cdcd
cfea cdcdcd    call    $cdcd
cfed cdcdcd    call    $cdcd
cff0 cdcdcd    call    $cdcd
cff3 cdcdcd    call    $cdcd
cff6 cdcdcd    call    $cdcd
cff9 cdcdcd    call    $cdcd
cffc cdcdcd    call    $cdcd
cfff cdcdcd    call    $cdcd
d002 cdcdcd    call    $cdcd
d005 cdcdcd    call    $cdcd
d008 cdcdcd    call    $cdcd
d00b cdcdcd    call    $cdcd
d00e cdcdcd    call    $cdcd
d011 cdcdcd    call    $cdcd
d014 cdcdcd    call    $cdcd
d017 cdcdcd    call    $cdcd
d01a cdcdcd    call    $cdcd
d01d cdcdcd    call    $cdcd
d020 cdcdcd    call    $cdcd
d023 cdcdcd    call    $cdcd
d026 cdcdcd    call    $cdcd
d029 cdcdcd    call    $cdcd
d02c cdcdcd    call    $cdcd
d02f cdcdcd    call    $cdcd
d032 cdcdcd    call    $cdcd
d035 cdcdcd    call    $cdcd
d038 cdcdcd    call    $cdcd
d03b cdcdcd    call    $cdcd
d03e cdcdcd    call    $cdcd
d041 cdcdcd    call    $cdcd
d044 cdcdcd    call    $cdcd
d047 cdcdcd    call    $cdcd
d04a cdcdcd    call    $cdcd
d04d cdcdcd    call    $cdcd
d050 cdcdcd    call    $cdcd
d053 cdcdcd    call    $cdcd
d056 cdcdcd    call    $cdcd
d059 cdcdcd    call    $cdcd
d05c cdcdcd    call    $cdcd
d05f cdcdcd    call    $cdcd
d062 cdcdcd    call    $cdcd
d065 cdcdcd    call    $cdcd
d068 cdcdcd    call    $cdcd
d06b cdcdcd    call    $cdcd
d06e cdcdcd    call    $cdcd
d071 cdcdcd    call    $cdcd
d074 cdcdcd    call    $cdcd
d077 cdcdcd    call    $cdcd
d07a cdcdcd    call    $cdcd
d07d cdcdcd    call    $cdcd
d080 cdcdcd    call    $cdcd
d083 cdcdcd    call    $cdcd
d086 cdcdcd    call    $cdcd
d089 cdcdcd    call    $cdcd
d08c cdcdcd    call    $cdcd
d08f cdcdcd    call    $cdcd
d092 cdcdcd    call    $cdcd
d095 cdcdcd    call    $cdcd
d098 cdcdcd    call    $cdcd
d09b cdcdcd    call    $cdcd
d09e cdcdcd    call    $cdcd
d0a1 cdcdcd    call    $cdcd
d0a4 cdcdcd    call    $cdcd
d0a7 cdcdcd    call    $cdcd
d0aa cdcdcd    call    $cdcd
d0ad cdcdcd    call    $cdcd
d0b0 cdcdcd    call    $cdcd
d0b3 cdcdcd    call    $cdcd
d0b6 cdcdcd    call    $cdcd
d0b9 cdcdcd    call    $cdcd
d0bc cdcdcd    call    $cdcd
d0bf cdcdcd    call    $cdcd
d0c2 cdcdcd    call    $cdcd
d0c5 cdcdcd    call    $cdcd
d0c8 cdcdcd    call    $cdcd
d0cb cdcdcd    call    $cdcd
d0ce cdcdcd    call    $cdcd
d0d1 cdcdcd    call    $cdcd
d0d4 cdcdcd    call    $cdcd
d0d7 cdcdcd    call    $cdcd
d0da cdcdcd    call    $cdcd
d0dd cdcdcd    call    $cdcd
d0e0 cdcdcd    call    $cdcd
d0e3 cdcdcd    call    $cdcd
d0e6 cdcdcd    call    $cdcd
d0e9 cdcdcd    call    $cdcd
d0ec cdcdcd    call    $cdcd
d0ef cdcdcd    call    $cdcd
d0f2 cdcdcd    call    $cdcd
d0f5 cdcdcd    call    $cdcd
d0f8 cdcdcd    call    $cdcd
d0fb cdcdcd    call    $cdcd
d0fe cdcdcd    call    $cdcd
d101 cdcdcd    call    $cdcd
d104 cdcdcd    call    $cdcd
d107 cdcdcd    call    $cdcd
d10a cdcdcd    call    $cdcd
d10d cdcdcd    call    $cdcd
d110 cdcdcd    call    $cdcd
d113 cdcdcd    call    $cdcd
d116 cdcdcd    call    $cdcd
d119 cdcdcd    call    $cdcd
d11c cdcdcd    call    $cdcd
d11f cdcdcd    call    $cdcd
d122 cdcdcd    call    $cdcd
d125 cdcdcd    call    $cdcd
d128 cdcdcd    call    $cdcd
d12b cdcdcd    call    $cdcd
d12e cdcdcd    call    $cdcd
d131 cdcdcd    call    $cdcd
d134 cdcdcd    call    $cdcd
d137 cdcdcd    call    $cdcd
d13a cdcdcd    call    $cdcd
d13d cdcdcd    call    $cdcd
d140 cdcdcd    call    $cdcd
d143 cdcdcd    call    $cdcd
d146 cdcdcd    call    $cdcd
d149 cdcdcd    call    $cdcd
d14c cdcdcd    call    $cdcd
d14f cdcdcd    call    $cdcd
d152 cdcdcd    call    $cdcd
d155 cdcdcd    call    $cdcd
d158 cdcdcd    call    $cdcd
d15b cdcdcd    call    $cdcd
d15e cdcdcd    call    $cdcd
d161 cdcdcd    call    $cdcd
d164 cdcdcd    call    $cdcd
d167 cdcdcd    call    $cdcd
d16a cdcdcd    call    $cdcd
d16d cdcdcd    call    $cdcd
d170 cdcdcd    call    $cdcd
d173 cdcdcd    call    $cdcd
d176 cdcdcd    call    $cdcd
d179 cdcdcd    call    $cdcd
d17c cdcdcd    call    $cdcd
d17f cdcdcd    call    $cdcd
d182 cdcdcd    call    $cdcd
d185 cdcdcd    call    $cdcd
d188 cdcdcd    call    $cdcd
d18b cdcdcd    call    $cdcd
d18e cdcdcd    call    $cdcd
d191 cdcdcd    call    $cdcd
d194 cdcdcd    call    $cdcd
d197 cdcdcd    call    $cdcd
d19a cdcdcd    call    $cdcd
d19d cdcdcd    call    $cdcd
d1a0 cdcdcd    call    $cdcd
d1a3 cdcdcd    call    $cdcd
d1a6 cdcdcd    call    $cdcd
d1a9 cdcdcd    call    $cdcd
d1ac cdcdcd    call    $cdcd
d1af cdcdcd    call    $cdcd
d1b2 cdcdcd    call    $cdcd
d1b5 cdcdcd    call    $cdcd
d1b8 cdcdcd    call    $cdcd
d1bb cdcdcd    call    $cdcd
d1be cdcdcd    call    $cdcd
d1c1 cdcdcd    call    $cdcd
d1c4 cdcdcd    call    $cdcd
d1c7 cdcdcd    call    $cdcd
d1ca cdcdcd    call    $cdcd
d1cd cdcdcd    call    $cdcd
d1d0 cdcdcd    call    $cdcd
d1d3 cdcdcd    call    $cdcd
d1d6 cdcdcd    call    $cdcd
d1d9 cdcdcd    call    $cdcd
d1dc cdcdcd    call    $cdcd
d1df cdcdcd    call    $cdcd
d1e2 cdcdcd    call    $cdcd
d1e5 cdcdcd    call    $cdcd
d1e8 cdcdcd    call    $cdcd
d1eb cdcdcd    call    $cdcd
d1ee cdcdcd    call    $cdcd
d1f1 cdcdcd    call    $cdcd
d1f4 cdcdcd    call    $cdcd
d1f7 cdcdcd    call    $cdcd
d1fa cdcdcd    call    $cdcd
d1fd cdcdcd    call    $cdcd
d200 cdcdcd    call    $cdcd
d203 cdcdcd    call    $cdcd
d206 cdcdcd    call    $cdcd
d209 cdcdcd    call    $cdcd
d20c cdcdcd    call    $cdcd
d20f cdcdcd    call    $cdcd
d212 cdcdcd    call    $cdcd
d215 cdcdcd    call    $cdcd
d218 cdcdcd    call    $cdcd
d21b cdcdcd    call    $cdcd
d21e cdcdcd    call    $cdcd
d221 cdcdcd    call    $cdcd
d224 cdcdcd    call    $cdcd
d227 cdcdcd    call    $cdcd
d22a cdcdcd    call    $cdcd
d22d cdcdcd    call    $cdcd
d230 cdcdcd    call    $cdcd
d233 cdcdcd    call    $cdcd
d236 cdcdcd    call    $cdcd
d239 cdcdcd    call    $cdcd
d23c cdcdcd    call    $cdcd
d23f cdcdcd    call    $cdcd
d242 cdcdcd    call    $cdcd
d245 cdcdcd    call    $cdcd
d248 cdcdcd    call    $cdcd
d24b cdcdcd    call    $cdcd
d24e cdcdcd    call    $cdcd
d251 cdcdcd    call    $cdcd
d254 cdcdcd    call    $cdcd
d257 cdcdcd    call    $cdcd
d25a cdcdcd    call    $cdcd
d25d cdcdcd    call    $cdcd
d260 cdcdcd    call    $cdcd
d263 cdcdcd    call    $cdcd
d266 cdcdcd    call    $cdcd
d269 cdcdcd    call    $cdcd
d26c cdcdcd    call    $cdcd
d26f cdcdcd    call    $cdcd
d272 cdcdcd    call    $cdcd
d275 cdcdcd    call    $cdcd
d278 cdcdcd    call    $cdcd
d27b cdcdcd    call    $cdcd
d27e cdcdcd    call    $cdcd
d281 cdcdcd    call    $cdcd
d284 cdcdcd    call    $cdcd
d287 cdcdcd    call    $cdcd
d28a cdcdcd    call    $cdcd
d28d cdcdcd    call    $cdcd
d290 cdcdcd    call    $cdcd
d293 cdcdcd    call    $cdcd
d296 cdcdcd    call    $cdcd
d299 cdcdcd    call    $cdcd
d29c cdcdcd    call    $cdcd
d29f cdcdcd    call    $cdcd
d2a2 cdcdcd    call    $cdcd
d2a5 cdcdcd    call    $cdcd
d2a8 cdcdcd    call    $cdcd
d2ab cdcdcd    call    $cdcd
d2ae cdcdcd    call    $cdcd
d2b1 cdcdcd    call    $cdcd
d2b4 cdcdcd    call    $cdcd
d2b7 cdcdcd    call    $cdcd
d2ba cdcdcd    call    $cdcd
d2bd cdcdcd    call    $cdcd
d2c0 cdcdcd    call    $cdcd
d2c3 cdcdcd    call    $cdcd
d2c6 cdcdcd    call    $cdcd
d2c9 cdcdcd    call    $cdcd
d2cc cdcdcd    call    $cdcd
d2cf cdcdcd    call    $cdcd
d2d2 cdcdcd    call    $cdcd
d2d5 cdcdcd    call    $cdcd
d2d8 cdcdcd    call    $cdcd
d2db cdcdcd    call    $cdcd
d2de cdcdcd    call    $cdcd
d2e1 cdcdcd    call    $cdcd
d2e4 cdcdcd    call    $cdcd
d2e7 cdcdcd    call    $cdcd
d2ea cdcdcd    call    $cdcd
d2ed cdcdcd    call    $cdcd
d2f0 cdcdcd    call    $cdcd
d2f3 cdcdcd    call    $cdcd
d2f6 cdcdcd    call    $cdcd
d2f9 cdcdcd    call    $cdcd
d2fc cdcdcd    call    $cdcd
d2ff cdcdcd    call    $cdcd
d302 cdcdcd    call    $cdcd
d305 cdcdcd    call    $cdcd
d308 cdcdcd    call    $cdcd
d30b cdcdcd    call    $cdcd
d30e cdcdcd    call    $cdcd
d311 cdcdcd    call    $cdcd
d314 cdcdcd    call    $cdcd
d317 cdcdcd    call    $cdcd
d31a cdcdcd    call    $cdcd
d31d cdcdcd    call    $cdcd
d320 cdcdcd    call    $cdcd
d323 cdcdcd    call    $cdcd
d326 cdcdcd    call    $cdcd
d329 cdcdcd    call    $cdcd
d32c cdcdcd    call    $cdcd
d32f cdcdcd    call    $cdcd
d332 cdcdcd    call    $cdcd
d335 cdcdcd    call    $cdcd
d338 cdcdcd    call    $cdcd
d33b cdcdcd    call    $cdcd
d33e cdcdcd    call    $cdcd
d341 cdcdcd    call    $cdcd
d344 cdcdcd    call    $cdcd
d347 cdcdcd    call    $cdcd
d34a cdcdcd    call    $cdcd
d34d cdcdcd    call    $cdcd
d350 cdcdcd    call    $cdcd
d353 cdcdcd    call    $cdcd
d356 cdcdcd    call    $cdcd
d359 cdcdcd    call    $cdcd
d35c cdcdcd    call    $cdcd
d35f cdcdcd    call    $cdcd
d362 cdcdcd    call    $cdcd
d365 cdcdcd    call    $cdcd
d368 cdcdcd    call    $cdcd
d36b cdcdcd    call    $cdcd
d36e cdcdcd    call    $cdcd
d371 cdcdcd    call    $cdcd
d374 cdcdcd    call    $cdcd
d377 cdcdcd    call    $cdcd
d37a cdcdcd    call    $cdcd
d37d cdcdcd    call    $cdcd
d380 cdcdcd    call    $cdcd
d383 cdcdcd    call    $cdcd
d386 cdcdcd    call    $cdcd
d389 cdcdcd    call    $cdcd
d38c cdcdcd    call    $cdcd
d38f cdcdcd    call    $cdcd
d392 cdcdcd    call    $cdcd
d395 cdcdcd    call    $cdcd
d398 cdcdcd    call    $cdcd
d39b cdcdcd    call    $cdcd
d39e cdcdcd    call    $cdcd
d3a1 cdcdcd    call    $cdcd
d3a4 cdcdcd    call    $cdcd
d3a7 cdcdcd    call    $cdcd
d3aa cdcdcd    call    $cdcd
d3ad cdcdcd    call    $cdcd
d3b0 cdcdcd    call    $cdcd
d3b3 cdcdcd    call    $cdcd
d3b6 cdcdcd    call    $cdcd
d3b9 cdcdcd    call    $cdcd
d3bc cdcdcd    call    $cdcd
d3bf cdcdcd    call    $cdcd
d3c2 cdcdcd    call    $cdcd
d3c5 cdcdcd    call    $cdcd
d3c8 cdcdcd    call    $cdcd
d3cb cdcdcd    call    $cdcd
d3ce cdcdcd    call    $cdcd
d3d1 cdcdcd    call    $cdcd
d3d4 cdcdcd    call    $cdcd
d3d7 cdcdcd    call    $cdcd
d3da cdcdcd    call    $cdcd
d3dd cdcdcd    call    $cdcd
d3e0 cdcdcd    call    $cdcd
d3e3 cdcdcd    call    $cdcd
d3e6 cdcdcd    call    $cdcd
d3e9 cdcdcd    call    $cdcd
d3ec cdcdcd    call    $cdcd
d3ef cdcdcd    call    $cdcd
d3f2 cdcdcd    call    $cdcd
d3f5 cdcdcd    call    $cdcd
d3f8 cdcdcd    call    $cdcd
d3fb cdcdcd    call    $cdcd
d3fe cdcdcd    call    $cdcd
d401 cdcdcd    call    $cdcd
d404 cdcdcd    call    $cdcd
d407 cdcdcd    call    $cdcd
d40a cdcdcd    call    $cdcd
d40d cdcdcd    call    $cdcd
d410 cdcdcd    call    $cdcd
d413 cdcdcd    call    $cdcd
d416 cdcdcd    call    $cdcd
d419 cdcdcd    call    $cdcd
d41c cdcdcd    call    $cdcd
d41f cdcdcd    call    $cdcd
d422 cdcdcd    call    $cdcd
d425 cdcdcd    call    $cdcd
d428 cdcdcd    call    $cdcd
d42b cdcdcd    call    $cdcd
d42e cdcdcd    call    $cdcd
d431 cdcdcd    call    $cdcd
d434 cdcdcd    call    $cdcd
d437 cdcdcd    call    $cdcd
d43a cdcdcd    call    $cdcd
d43d cdcdcd    call    $cdcd
d440 cdcdcd    call    $cdcd
d443 cdcdcd    call    $cdcd
d446 cdcdcd    call    $cdcd
d449 cdcdcd    call    $cdcd
d44c cdcdcd    call    $cdcd
d44f cdcdcd    call    $cdcd
d452 cdcdcd    call    $cdcd
d455 cdcdcd    call    $cdcd
d458 cdcdcd    call    $cdcd
d45b cdcdcd    call    $cdcd
d45e cdcdcd    call    $cdcd
d461 cdcdcd    call    $cdcd
d464 cdcdcd    call    $cdcd
d467 cdcdcd    call    $cdcd
d46a cdcdcd    call    $cdcd
d46d cdcdcd    call    $cdcd
d470 cdcdcd    call    $cdcd
d473 cdcdcd    call    $cdcd
d476 cdcdcd    call    $cdcd
d479 cdcdcd    call    $cdcd
d47c cdcdcd    call    $cdcd
d47f cdcdcd    call    $cdcd
d482 cdcdcd    call    $cdcd
d485 cdcdcd    call    $cdcd
d488 cdcdcd    call    $cdcd
d48b cdcdcd    call    $cdcd
d48e cdcdcd    call    $cdcd
d491 cdcdcd    call    $cdcd
d494 cdcdcd    call    $cdcd
d497 cdcdcd    call    $cdcd
d49a cdcdcd    call    $cdcd
d49d cdcdcd    call    $cdcd
d4a0 cdcdcd    call    $cdcd
d4a3 cdcdcd    call    $cdcd
d4a6 cdcdcd    call    $cdcd
d4a9 cdcdcd    call    $cdcd
d4ac cdcdcd    call    $cdcd
d4af cdcdcd    call    $cdcd
d4b2 cdcdcd    call    $cdcd
d4b5 cdcdcd    call    $cdcd
d4b8 cdcdcd    call    $cdcd
d4bb cdcdcd    call    $cdcd
d4be cdcdcd    call    $cdcd
d4c1 cdcdcd    call    $cdcd
d4c4 cdcdcd    call    $cdcd
d4c7 cdcdcd    call    $cdcd
d4ca cdcdcd    call    $cdcd
d4cd cdcdcd    call    $cdcd
d4d0 cdcdcd    call    $cdcd
d4d3 cdcdcd    call    $cdcd
d4d6 cdcdcd    call    $cdcd
d4d9 cdcdcd    call    $cdcd
d4dc cdcdcd    call    $cdcd
d4df cdcdcd    call    $cdcd
d4e2 cdcdcd    call    $cdcd
d4e5 cdcdcd    call    $cdcd
d4e8 cdcdcd    call    $cdcd
d4eb cdcdcd    call    $cdcd
d4ee cdcdcd    call    $cdcd
d4f1 cdcdcd    call    $cdcd
d4f4 cdcdcd    call    $cdcd
d4f7 cdcdcd    call    $cdcd
d4fa cdcdcd    call    $cdcd
d4fd cdcdcd    call    $cdcd
d500 cdcdcd    call    $cdcd
d503 cdcdcd    call    $cdcd
d506 cdcdcd    call    $cdcd
d509 cdcdcd    call    $cdcd
d50c cdcdcd    call    $cdcd
d50f cdcdcd    call    $cdcd
d512 cdcdcd    call    $cdcd
d515 cdcdcd    call    $cdcd
d518 cdcdcd    call    $cdcd
d51b cdcdcd    call    $cdcd
d51e cdcdcd    call    $cdcd
d521 cdcdcd    call    $cdcd
d524 cdcdcd    call    $cdcd
d527 cdcdcd    call    $cdcd
d52a cdcdcd    call    $cdcd
d52d cdcdcd    call    $cdcd
d530 cdcdcd    call    $cdcd
d533 cdcdcd    call    $cdcd
d536 cdcdcd    call    $cdcd
d539 cdcdcd    call    $cdcd
d53c cdcdcd    call    $cdcd
d53f cdcdcd    call    $cdcd
d542 cdcdcd    call    $cdcd
d545 cdcdcd    call    $cdcd
d548 cdcdcd    call    $cdcd
d54b cdcdcd    call    $cdcd
d54e cdcdcd    call    $cdcd
d551 cdcdcd    call    $cdcd
d554 cdcdcd    call    $cdcd
d557 cdcdcd    call    $cdcd
d55a cdcdcd    call    $cdcd
d55d cdcdcd    call    $cdcd
d560 cdcdcd    call    $cdcd
d563 cdcdcd    call    $cdcd
d566 cdcdcd    call    $cdcd
d569 cdcdcd    call    $cdcd
d56c cdcdcd    call    $cdcd
d56f cdcdcd    call    $cdcd
d572 cdcdcd    call    $cdcd
d575 cdcdcd    call    $cdcd
d578 cdcdcd    call    $cdcd
d57b cdcdcd    call    $cdcd
d57e cdcdcd    call    $cdcd
d581 cdcdcd    call    $cdcd
d584 cdcdcd    call    $cdcd
d587 cdcdcd    call    $cdcd
d58a cdcdcd    call    $cdcd
d58d cdcdcd    call    $cdcd
d590 cdcdcd    call    $cdcd
d593 cdcdcd    call    $cdcd
d596 cdcdcd    call    $cdcd
d599 cdcdcd    call    $cdcd
d59c cdcdcd    call    $cdcd
d59f cdcdcd    call    $cdcd
d5a2 cdcdcd    call    $cdcd
d5a5 cdcdcd    call    $cdcd
d5a8 cdcdcd    call    $cdcd
d5ab cdcdcd    call    $cdcd
d5ae cdcdcd    call    $cdcd
d5b1 cdcdcd    call    $cdcd
d5b4 cdcdcd    call    $cdcd
d5b7 cdcdcd    call    $cdcd
d5ba cdcdcd    call    $cdcd
d5bd cdcdcd    call    $cdcd
d5c0 cdcdcd    call    $cdcd
d5c3 cdcdcd    call    $cdcd
d5c6 cdcdcd    call    $cdcd
d5c9 cdcdcd    call    $cdcd
d5cc cdcdcd    call    $cdcd
d5cf cdcdcd    call    $cdcd
d5d2 cdcdcd    call    $cdcd
d5d5 cdcdcd    call    $cdcd
d5d8 cdcdcd    call    $cdcd
d5db cdcdcd    call    $cdcd
d5de cdcdcd    call    $cdcd
d5e1 cdcdcd    call    $cdcd
d5e4 cdcdcd    call    $cdcd
d5e7 cdcdcd    call    $cdcd
d5ea cdcdcd    call    $cdcd
d5ed cdcdcd    call    $cdcd
d5f0 cdcdcd    call    $cdcd
d5f3 cdcdcd    call    $cdcd
d5f6 cdcdcd    call    $cdcd
d5f9 cdcdcd    call    $cdcd
d5fc cdcdcd    call    $cdcd
d5ff cdcdcd    call    $cdcd
d602 cdcdcd    call    $cdcd
d605 cdcdcd    call    $cdcd
d608 cdcdcd    call    $cdcd
d60b cdcdcd    call    $cdcd
d60e cdcdcd    call    $cdcd
d611 cdcdcd    call    $cdcd
d614 cdcdcd    call    $cdcd
d617 cdcdcd    call    $cdcd
d61a cdcdcd    call    $cdcd
d61d cdcdcd    call    $cdcd
d620 cdcdcd    call    $cdcd
d623 cdcdcd    call    $cdcd
d626 cdcdcd    call    $cdcd
d629 cdcdcd    call    $cdcd
d62c cdcdcd    call    $cdcd
d62f cdcdcd    call    $cdcd
d632 cdcdcd    call    $cdcd
d635 cdcdcd    call    $cdcd
d638 cdcdcd    call    $cdcd
d63b cdcdcd    call    $cdcd
d63e cdcdcd    call    $cdcd
d641 cdcdcd    call    $cdcd
d644 cdcdcd    call    $cdcd
d647 cdcdcd    call    $cdcd
d64a cdcdcd    call    $cdcd
d64d cdcdcd    call    $cdcd
d650 cdcdcd    call    $cdcd
d653 cdcdcd    call    $cdcd
d656 cdcdcd    call    $cdcd
d659 cdcdcd    call    $cdcd
d65c cdcdcd    call    $cdcd
d65f cdcdcd    call    $cdcd
d662 cdcdcd    call    $cdcd
d665 cdcdcd    call    $cdcd
d668 cdcdcd    call    $cdcd
d66b cdcdcd    call    $cdcd
d66e cdcdcd    call    $cdcd
d671 cdcdcd    call    $cdcd
d674 cdcdcd    call    $cdcd
d677 cdcdcd    call    $cdcd
d67a cdcdcd    call    $cdcd
d67d cdcdcd    call    $cdcd
d680 cdcdcd    call    $cdcd
d683 cdcdcd    call    $cdcd
d686 cdcdcd    call    $cdcd
d689 cdcdcd    call    $cdcd
d68c cdcdcd    call    $cdcd
d68f cdcdcd    call    $cdcd
d692 cdcdcd    call    $cdcd
d695 cdcdcd    call    $cdcd
d698 cdcdcd    call    $cdcd
d69b cdcdcd    call    $cdcd
d69e cdcdcd    call    $cdcd
d6a1 cdcdcd    call    $cdcd
d6a4 cdcdcd    call    $cdcd
d6a7 cdcdcd    call    $cdcd
d6aa cdcdcd    call    $cdcd
d6ad cdcdcd    call    $cdcd
d6b0 cdcdcd    call    $cdcd
d6b3 cdcdcd    call    $cdcd
d6b6 cdcdcd    call    $cdcd
d6b9 cdcdcd    call    $cdcd
d6bc cdcdcd    call    $cdcd
d6bf cdcdcd    call    $cdcd
d6c2 cdcdcd    call    $cdcd
d6c5 cdcdcd    call    $cdcd
d6c8 cdcdcd    call    $cdcd
d6cb cdcdcd    call    $cdcd
d6ce cdcdcd    call    $cdcd
d6d1 cdcdcd    call    $cdcd
d6d4 cdcdcd    call    $cdcd
d6d7 cdcdcd    call    $cdcd
d6da cdcdcd    call    $cdcd
d6dd cdcdcd    call    $cdcd
d6e0 cdcdcd    call    $cdcd
d6e3 cdcdcd    call    $cdcd
d6e6 cdcdcd    call    $cdcd
d6e9 cdcdcd    call    $cdcd
d6ec cdcdcd    call    $cdcd
d6ef cdcdcd    call    $cdcd
d6f2 cdcdcd    call    $cdcd
d6f5 cdcdcd    call    $cdcd
d6f8 cdcdcd    call    $cdcd
d6fb cdcdcd    call    $cdcd
d6fe cdcdcd    call    $cdcd
d701 cdcdcd    call    $cdcd
d704 cdcdcd    call    $cdcd
d707 cdcdcd    call    $cdcd
d70a cdcdcd    call    $cdcd
d70d cdcdcd    call    $cdcd
d710 cdcdcd    call    $cdcd
d713 cdcdcd    call    $cdcd
d716 cdcdcd    call    $cdcd
d719 cdcdcd    call    $cdcd
d71c cdcdcd    call    $cdcd
d71f cdcdcd    call    $cdcd
d722 cdcdcd    call    $cdcd
d725 cdcdcd    call    $cdcd
d728 cdcdcd    call    $cdcd
d72b cdcdcd    call    $cdcd
d72e cdcdcd    call    $cdcd
d731 cdcdcd    call    $cdcd
d734 cdcdcd    call    $cdcd
d737 cdcdcd    call    $cdcd
d73a cdcdcd    call    $cdcd
d73d cdcdcd    call    $cdcd
d740 cdcdcd    call    $cdcd
d743 cdcdcd    call    $cdcd
d746 cdcdcd    call    $cdcd
d749 cdcdcd    call    $cdcd
d74c cdcdcd    call    $cdcd
d74f cdcdcd    call    $cdcd
d752 cdcdcd    call    $cdcd
d755 cdcdcd    call    $cdcd
d758 cdcdcd    call    $cdcd
d75b cdcdcd    call    $cdcd
d75e cdcdcd    call    $cdcd
d761 cdcdcd    call    $cdcd
d764 cdcdcd    call    $cdcd
d767 cdcdcd    call    $cdcd
d76a cdcdcd    call    $cdcd
d76d cdcdcd    call    $cdcd
d770 cdcdcd    call    $cdcd
d773 cdcdcd    call    $cdcd
d776 cdcdcd    call    $cdcd
d779 cdcdcd    call    $cdcd
d77c cdcdcd    call    $cdcd
d77f cdcdcd    call    $cdcd
d782 cdcdcd    call    $cdcd
d785 cdcdcd    call    $cdcd
d788 cdcdcd    call    $cdcd
d78b cdcdcd    call    $cdcd
d78e cdcdcd    call    $cdcd
d791 cdcdcd    call    $cdcd
d794 cdcdcd    call    $cdcd
d797 cdcdcd    call    $cdcd
d79a cdcdcd    call    $cdcd
d79d cdcdcd    call    $cdcd
d7a0 cdcdcd    call    $cdcd
d7a3 cdcdcd    call    $cdcd
d7a6 cdcdcd    call    $cdcd
d7a9 cdcdcd    call    $cdcd
d7ac cdcdcd    call    $cdcd
d7af cdcdcd    call    $cdcd
d7b2 cdcdcd    call    $cdcd
d7b5 cdcdcd    call    $cdcd
d7b8 cdcdcd    call    $cdcd
d7bb cdcdcd    call    $cdcd
d7be cdcdcd    call    $cdcd
d7c1 cdcdcd    call    $cdcd
d7c4 cdcdcd    call    $cdcd
d7c7 cdcdcd    call    $cdcd
d7ca cdcdcd    call    $cdcd
d7cd cdcdcd    call    $cdcd
d7d0 cdcdcd    call    $cdcd
d7d3 cdcdcd    call    $cdcd
d7d6 cdcdcd    call    $cdcd
d7d9 cdcdcd    call    $cdcd
d7dc cdcdcd    call    $cdcd
d7df cdcdcd    call    $cdcd
d7e2 cdcdcd    call    $cdcd
d7e5 cdcdcd    call    $cdcd
d7e8 cdcdcd    call    $cdcd
d7eb cdcdcd    call    $cdcd
d7ee cdcdcd    call    $cdcd
d7f1 cdcdcd    call    $cdcd
d7f4 cdcdcd    call    $cdcd
d7f7 cdcdcd    call    $cdcd
d7fa cdcdcd    call    $cdcd
d7fd cdcdcd    call    $cdcd
d800 cdcdcd    call    $cdcd
d803 cdcdcd    call    $cdcd
d806 cdcdcd    call    $cdcd
d809 cdcdcd    call    $cdcd
d80c cdcdcd    call    $cdcd
d80f cdcdcd    call    $cdcd
d812 cdcdcd    call    $cdcd
d815 cdcdcd    call    $cdcd
d818 cdcdcd    call    $cdcd
d81b cdcdcd    call    $cdcd
d81e cdcdcd    call    $cdcd
d821 cdcdcd    call    $cdcd
d824 cdcdcd    call    $cdcd
d827 cdcdcd    call    $cdcd
d82a cdcdcd    call    $cdcd
d82d cdcdcd    call    $cdcd
d830 cdcdcd    call    $cdcd
d833 cdcdcd    call    $cdcd
d836 cdcdcd    call    $cdcd
d839 cdcdcd    call    $cdcd
d83c cdcdcd    call    $cdcd
d83f cdcdcd    call    $cdcd
d842 cdcdcd    call    $cdcd
d845 cdcdcd    call    $cdcd
d848 cdcdcd    call    $cdcd
d84b cdcdcd    call    $cdcd
d84e cdcdcd    call    $cdcd
d851 cdcdcd    call    $cdcd
d854 cdcdcd    call    $cdcd
d857 cdcdcd    call    $cdcd
d85a cdcdcd    call    $cdcd
d85d cdcdcd    call    $cdcd
d860 cdcdcd    call    $cdcd
d863 cdcdcd    call    $cdcd
d866 cdcdcd    call    $cdcd
d869 cdcdcd    call    $cdcd
d86c cdcdcd    call    $cdcd
d86f cdcdcd    call    $cdcd
d872 cdcdcd    call    $cdcd
d875 cdcdcd    call    $cdcd
d878 cdcdcd    call    $cdcd
d87b cdcdcd    call    $cdcd
d87e cdcdcd    call    $cdcd
d881 cdcdcd    call    $cdcd
d884 cdcdcd    call    $cdcd
d887 cdcdcd    call    $cdcd
d88a cdcdcd    call    $cdcd
d88d cdcdcd    call    $cdcd
d890 cdcdcd    call    $cdcd
d893 cdcdcd    call    $cdcd
d896 cdcdcd    call    $cdcd
d899 cdcdcd    call    $cdcd
d89c cdcdcd    call    $cdcd
d89f cdcdcd    call    $cdcd
d8a2 cdcdcd    call    $cdcd
d8a5 cdcdcd    call    $cdcd
d8a8 cdcdcd    call    $cdcd
d8ab cdcdcd    call    $cdcd
d8ae cdcdcd    call    $cdcd
d8b1 cdcdcd    call    $cdcd
d8b4 cdcdcd    call    $cdcd
d8b7 cdcdcd    call    $cdcd
d8ba cdcdcd    call    $cdcd
d8bd cdcdcd    call    $cdcd
d8c0 cdcdcd    call    $cdcd
d8c3 cdcdcd    call    $cdcd
d8c6 cdcdcd    call    $cdcd
d8c9 cdcdcd    call    $cdcd
d8cc cdcdcd    call    $cdcd
d8cf cdcdcd    call    $cdcd
d8d2 cdcdcd    call    $cdcd
d8d5 cdcdcd    call    $cdcd
d8d8 cdcdcd    call    $cdcd
d8db cdcdcd    call    $cdcd
d8de cdcdcd    call    $cdcd
d8e1 cdcdcd    call    $cdcd
d8e4 cdcdcd    call    $cdcd
d8e7 cdcdcd    call    $cdcd
d8ea cdcdcd    call    $cdcd
d8ed cdcdcd    call    $cdcd
d8f0 cdcdcd    call    $cdcd
d8f3 cdcdcd    call    $cdcd
d8f6 cdcdcd    call    $cdcd
d8f9 cdcdcd    call    $cdcd
d8fc cdcdcd    call    $cdcd
d8ff cdcdcd    call    $cdcd
d902 cdcdcd    call    $cdcd
d905 cdcdcd    call    $cdcd
d908 cdcdcd    call    $cdcd
d90b cdcdcd    call    $cdcd
d90e cdcdcd    call    $cdcd
d911 cdcdcd    call    $cdcd
d914 cdcdcd    call    $cdcd
d917 cdcdcd    call    $cdcd
d91a cdcdcd    call    $cdcd
d91d cdcdcd    call    $cdcd
d920 cdcdcd    call    $cdcd
d923 cdcdcd    call    $cdcd
d926 cdcdcd    call    $cdcd
d929 cdcdcd    call    $cdcd
d92c cdcdcd    call    $cdcd
d92f cdcdcd    call    $cdcd
d932 cdcdcd    call    $cdcd
d935 cdcdcd    call    $cdcd
d938 cdcdcd    call    $cdcd
d93b cdcdcd    call    $cdcd
d93e cdcdcd    call    $cdcd
d941 cdcdcd    call    $cdcd
d944 cdcdcd    call    $cdcd
d947 cdcdcd    call    $cdcd
d94a cdcdcd    call    $cdcd
d94d cdcdcd    call    $cdcd
d950 cdcdcd    call    $cdcd
d953 cdcdcd    call    $cdcd
d956 cdcdcd    call    $cdcd
d959 cdcdcd    call    $cdcd
d95c cdcdcd    call    $cdcd
d95f cdcdcd    call    $cdcd
d962 cdcdcd    call    $cdcd
d965 cdcdcd    call    $cdcd
d968 cdcdcd    call    $cdcd
d96b cdcdcd    call    $cdcd
d96e cdcdcd    call    $cdcd
d971 cdcdcd    call    $cdcd
d974 cdcdcd    call    $cdcd
d977 cdcdcd    call    $cdcd
d97a cdcdcd    call    $cdcd
d97d cdcdcd    call    $cdcd
d980 cdcdcd    call    $cdcd
d983 cdcdcd    call    $cdcd
d986 cdcdcd    call    $cdcd
d989 cdcdcd    call    $cdcd
d98c cdcdcd    call    $cdcd
d98f cdcdcd    call    $cdcd
d992 cdcdcd    call    $cdcd
d995 cdcdcd    call    $cdcd
d998 cdcdcd    call    $cdcd
d99b cdcdcd    call    $cdcd
d99e cdcdcd    call    $cdcd
d9a1 cdcdcd    call    $cdcd
d9a4 cdcdcd    call    $cdcd
d9a7 cdcdcd    call    $cdcd
d9aa cdcdcd    call    $cdcd
d9ad cdcdcd    call    $cdcd
d9b0 cdcdcd    call    $cdcd
d9b3 cdcdcd    call    $cdcd
d9b6 cdcdcd    call    $cdcd
d9b9 cdcdcd    call    $cdcd
d9bc cdcdcd    call    $cdcd
d9bf cdcdcd    call    $cdcd
d9c2 cdcdcd    call    $cdcd
d9c5 cdcdcd    call    $cdcd
d9c8 cdcdcd    call    $cdcd
d9cb cdcdcd    call    $cdcd
d9ce cdcdcd    call    $cdcd
d9d1 cdcdcd    call    $cdcd
d9d4 cdcdcd    call    $cdcd
d9d7 cdcdcd    call    $cdcd
d9da cdcdcd    call    $cdcd
d9dd cdcdcd    call    $cdcd
d9e0 cdcdcd    call    $cdcd
d9e3 cdcdcd    call    $cdcd
d9e6 cdcdcd    call    $cdcd
d9e9 cdcdcd    call    $cdcd
d9ec cdcdcd    call    $cdcd
d9ef cdcdcd    call    $cdcd
d9f2 cdcdcd    call    $cdcd
d9f5 cdcdcd    call    $cdcd
d9f8 cdcdcd    call    $cdcd
d9fb cdcdcd    call    $cdcd
d9fe cdcdcd    call    $cdcd
da01 cdcdcd    call    $cdcd
da04 cdcdcd    call    $cdcd
da07 cdcdcd    call    $cdcd
da0a cdcdcd    call    $cdcd
da0d cdcdcd    call    $cdcd
da10 cdcdcd    call    $cdcd
da13 cdcdcd    call    $cdcd
da16 cdcdcd    call    $cdcd
da19 cdcdcd    call    $cdcd
da1c cdcdcd    call    $cdcd
da1f cdcdcd    call    $cdcd
da22 cdcdcd    call    $cdcd
da25 cdcdcd    call    $cdcd
da28 cdcdcd    call    $cdcd
da2b cdcdcd    call    $cdcd
da2e cdcdcd    call    $cdcd
da31 cdcdcd    call    $cdcd
da34 cdcdcd    call    $cdcd
da37 cdcdcd    call    $cdcd
da3a cdcdcd    call    $cdcd
da3d cdcdcd    call    $cdcd
da40 cdcdcd    call    $cdcd
da43 cdcdcd    call    $cdcd
da46 cdcdcd    call    $cdcd
da49 cdcdcd    call    $cdcd
da4c cdcdcd    call    $cdcd
da4f cdcdcd    call    $cdcd
da52 cdcdcd    call    $cdcd
da55 cdcdcd    call    $cdcd
da58 cdcdcd    call    $cdcd
da5b cdcdcd    call    $cdcd
da5e cdcdcd    call    $cdcd
da61 cdcdcd    call    $cdcd
da64 cdcdcd    call    $cdcd
da67 cdcdcd    call    $cdcd
da6a cdcdcd    call    $cdcd
da6d cdcdcd    call    $cdcd
da70 cdcdcd    call    $cdcd
da73 cdcdcd    call    $cdcd
da76 cdcdcd    call    $cdcd
da79 cdcdcd    call    $cdcd
da7c cdcdcd    call    $cdcd
da7f cdcdcd    call    $cdcd
da82 cdcdcd    call    $cdcd
da85 cdcdcd    call    $cdcd
da88 cdcdcd    call    $cdcd
da8b cdcdcd    call    $cdcd
da8e cdcdcd    call    $cdcd
da91 cdcdcd    call    $cdcd
da94 cdcdcd    call    $cdcd
da97 cdcdcd    call    $cdcd
da9a cdcdcd    call    $cdcd
da9d cdcdcd    call    $cdcd
daa0 cdcdcd    call    $cdcd
daa3 cdcdcd    call    $cdcd
daa6 cdcdcd    call    $cdcd
daa9 cdcdcd    call    $cdcd
daac cdcdcd    call    $cdcd
daaf cdcdcd    call    $cdcd
dab2 cdcdcd    call    $cdcd
dab5 cdcdcd    call    $cdcd
dab8 cdcdcd    call    $cdcd
dabb cdcdcd    call    $cdcd
dabe cdcdcd    call    $cdcd
dac1 cdcdcd    call    $cdcd
dac4 cdcdcd    call    $cdcd
dac7 cdcdcd    call    $cdcd
daca cdcdcd    call    $cdcd
dacd cdcdcd    call    $cdcd
dad0 cdcdcd    call    $cdcd
dad3 cdcdcd    call    $cdcd
dad6 cdcdcd    call    $cdcd
dad9 cdcdcd    call    $cdcd
dadc cdcdcd    call    $cdcd
dadf cdcdcd    call    $cdcd
dae2 cdcdcd    call    $cdcd
dae5 cdcdcd    call    $cdcd
dae8 cdcdcd    call    $cdcd
daeb cdcdcd    call    $cdcd
daee cdcdcd    call    $cdcd
daf1 cdcdcd    call    $cdcd
daf4 cdcdcd    call    $cdcd
daf7 cdcdcd    call    $cdcd
dafa cdcdcd    call    $cdcd
dafd cdcdcd    call    $cdcd
db00 cdcdcd    call    $cdcd
db03 cdcdcd    call    $cdcd
db06 cdcdcd    call    $cdcd
db09 cdcdcd    call    $cdcd
db0c cdcdcd    call    $cdcd
db0f cdcdcd    call    $cdcd
db12 cdcdcd    call    $cdcd
db15 cdcdcd    call    $cdcd
db18 cdcdcd    call    $cdcd
db1b cdcdcd    call    $cdcd
db1e cdcdcd    call    $cdcd
db21 cdcdcd    call    $cdcd
db24 cdcdcd    call    $cdcd
db27 cdcdcd    call    $cdcd
db2a cdcdcd    call    $cdcd
db2d cdcdcd    call    $cdcd
db30 cdcdcd    call    $cdcd
db33 cdcdcd    call    $cdcd
db36 cdcdcd    call    $cdcd
db39 cdcdcd    call    $cdcd
db3c cdcdcd    call    $cdcd
db3f cdcdcd    call    $cdcd
db42 cdcdcd    call    $cdcd
db45 cdcdcd    call    $cdcd
db48 cdcdcd    call    $cdcd
db4b cdcdcd    call    $cdcd
db4e cdcdcd    call    $cdcd
db51 cdcdcd    call    $cdcd
db54 cdcdcd    call    $cdcd
db57 cdcdcd    call    $cdcd
db5a cdcdcd    call    $cdcd
db5d cdcdcd    call    $cdcd
db60 cdcdcd    call    $cdcd
db63 cdcdcd    call    $cdcd
db66 cdcdcd    call    $cdcd
db69 cdcdcd    call    $cdcd
db6c cdcdcd    call    $cdcd
db6f cdcdcd    call    $cdcd
db72 cdcdcd    call    $cdcd
db75 cdcdcd    call    $cdcd
db78 cdcdcd    call    $cdcd
db7b cdcdcd    call    $cdcd
db7e cdcdcd    call    $cdcd
db81 cdcdcd    call    $cdcd
db84 cdcdcd    call    $cdcd
db87 cdcdcd    call    $cdcd
db8a cdcdcd    call    $cdcd
db8d cdcdcd    call    $cdcd
db90 cdcdcd    call    $cdcd
db93 cdcdcd    call    $cdcd
db96 cdcdcd    call    $cdcd
db99 cdcdcd    call    $cdcd
db9c cdcdcd    call    $cdcd
db9f cdcdcd    call    $cdcd
dba2 cdcdcd    call    $cdcd
dba5 cdcdcd    call    $cdcd
dba8 cdcdcd    call    $cdcd
dbab cdcdcd    call    $cdcd
dbae cdcdcd    call    $cdcd
dbb1 cdcdcd    call    $cdcd
dbb4 cdcdcd    call    $cdcd
dbb7 cdcdcd    call    $cdcd
dbba cdcdcd    call    $cdcd
dbbd cdcdcd    call    $cdcd
dbc0 cdcdcd    call    $cdcd
dbc3 cdcdcd    call    $cdcd
dbc6 cdcdcd    call    $cdcd
dbc9 cdcdcd    call    $cdcd
dbcc cdcdcd    call    $cdcd
dbcf cdcdcd    call    $cdcd
dbd2 cdcdcd    call    $cdcd
dbd5 cdcdcd    call    $cdcd
dbd8 cdcdcd    call    $cdcd
dbdb cdcdcd    call    $cdcd
dbde cdcdcd    call    $cdcd
dbe1 cdcdcd    call    $cdcd
dbe4 cdcdcd    call    $cdcd
dbe7 cdcdcd    call    $cdcd
dbea cdcdcd    call    $cdcd
dbed cdcdcd    call    $cdcd
dbf0 cdcdcd    call    $cdcd
dbf3 cdcdcd    call    $cdcd
dbf6 cdcdcd    call    $cdcd
dbf9 cdcdcd    call    $cdcd
dbfc cdcdcd    call    $cdcd
dbff cdcdcd    call    $cdcd
dc02 cdcdcd    call    $cdcd
dc05 cdcdcd    call    $cdcd
dc08 cdcdcd    call    $cdcd
dc0b cdcdcd    call    $cdcd
dc0e cdcdcd    call    $cdcd
dc11 cdcdcd    call    $cdcd
dc14 cdcdcd    call    $cdcd
dc17 cdcdcd    call    $cdcd
dc1a cdcdcd    call    $cdcd
dc1d cdcdcd    call    $cdcd
dc20 cdcdcd    call    $cdcd
dc23 cdcdcd    call    $cdcd
dc26 cdcdcd    call    $cdcd
dc29 cdcdcd    call    $cdcd
dc2c cdcdcd    call    $cdcd
dc2f cdcdcd    call    $cdcd
dc32 cdcdcd    call    $cdcd
dc35 cdcdcd    call    $cdcd
dc38 cdcdcd    call    $cdcd
dc3b cdcdcd    call    $cdcd
dc3e cdcdcd    call    $cdcd
dc41 cdcdcd    call    $cdcd
dc44 cdcdcd    call    $cdcd
dc47 cdcdcd    call    $cdcd
dc4a cdcdcd    call    $cdcd
dc4d cdcdcd    call    $cdcd
dc50 cdcdcd    call    $cdcd
dc53 cdcdcd    call    $cdcd
dc56 cdcdcd    call    $cdcd
dc59 cdcdcd    call    $cdcd
dc5c cdcdcd    call    $cdcd
dc5f cdcdcd    call    $cdcd
dc62 cdcdcd    call    $cdcd
dc65 cdcdcd    call    $cdcd
dc68 cdcdcd    call    $cdcd
dc6b cdcdcd    call    $cdcd
dc6e cdcdcd    call    $cdcd
dc71 cdcdcd    call    $cdcd
dc74 cdcdcd    call    $cdcd
dc77 cdcdcd    call    $cdcd
dc7a cdcdcd    call    $cdcd
dc7d cdcdcd    call    $cdcd
dc80 cdcdcd    call    $cdcd
dc83 cdcdcd    call    $cdcd
dc86 cdcdcd    call    $cdcd
dc89 cdcdcd    call    $cdcd
dc8c cdcdcd    call    $cdcd
dc8f cdcdcd    call    $cdcd
dc92 cdcdcd    call    $cdcd
dc95 cdcdcd    call    $cdcd
dc98 cdcdcd    call    $cdcd
dc9b cdcdcd    call    $cdcd
dc9e cdcdcd    call    $cdcd
dca1 cdcdcd    call    $cdcd
dca4 cdcdcd    call    $cdcd
dca7 cdcdcd    call    $cdcd
dcaa cdcdcd    call    $cdcd
dcad cdcdcd    call    $cdcd
dcb0 cdcdcd    call    $cdcd
dcb3 cdcdcd    call    $cdcd
dcb6 cdcdcd    call    $cdcd
dcb9 cdcdcd    call    $cdcd
dcbc cdcdcd    call    $cdcd
dcbf cdcdcd    call    $cdcd
dcc2 cdcdcd    call    $cdcd
dcc5 cdcdcd    call    $cdcd
dcc8 cdcdcd    call    $cdcd
dccb cdcdcd    call    $cdcd
dcce cdcdcd    call    $cdcd
dcd1 cdcdcd    call    $cdcd
dcd4 cdcdcd    call    $cdcd
dcd7 cdcdcd    call    $cdcd
dcda cdcdcd    call    $cdcd
dcdd cdcdcd    call    $cdcd
dce0 cdcdcd    call    $cdcd
dce3 cdcdcd    call    $cdcd
dce6 cdcdcd    call    $cdcd
dce9 cdcdcd    call    $cdcd
dcec cdcdcd    call    $cdcd
dcef cdcdcd    call    $cdcd
dcf2 cdcdcd    call    $cdcd
dcf5 cdcdcd    call    $cdcd
dcf8 cdcdcd    call    $cdcd
dcfb cdcdcd    call    $cdcd
dcfe cdcdcd    call    $cdcd
dd01 cdcdcd    call    $cdcd
dd04 cdcdcd    call    $cdcd
dd07 cdcdcd    call    $cdcd
dd0a cdcdcd    call    $cdcd
dd0d cdcdcd    call    $cdcd
dd10 cdcdcd    call    $cdcd
dd13 cdcdcd    call    $cdcd
dd16 cdcdcd    call    $cdcd
dd19 cdcdcd    call    $cdcd
dd1c cdcdcd    call    $cdcd
dd1f cdcdcd    call    $cdcd
dd22 cdcdcd    call    $cdcd
dd25 cdcdcd    call    $cdcd
dd28 cdcdcd    call    $cdcd
dd2b cdcdcd    call    $cdcd
dd2e cdcdcd    call    $cdcd
dd31 cdcdcd    call    $cdcd
dd34 cdcdcd    call    $cdcd
dd37 cdcdcd    call    $cdcd
dd3a cdcdcd    call    $cdcd
dd3d cdcdcd    call    $cdcd
dd40 cdcdcd    call    $cdcd
dd43 cdcdcd    call    $cdcd
dd46 cdcdcd    call    $cdcd
dd49 cdcdcd    call    $cdcd
dd4c cdcdcd    call    $cdcd
dd4f cdcdcd    call    $cdcd
dd52 cdcdcd    call    $cdcd
dd55 cdcdcd    call    $cdcd
dd58 cdcdcd    call    $cdcd
dd5b cdcdcd    call    $cdcd
dd5e cdcdcd    call    $cdcd
dd61 cdcdcd    call    $cdcd
dd64 cdcdcd    call    $cdcd
dd67 cdcdcd    call    $cdcd
dd6a cdcdcd    call    $cdcd
dd6d cdcdcd    call    $cdcd
dd70 cdcdcd    call    $cdcd
dd73 cdcdcd    call    $cdcd
dd76 cdcdcd    call    $cdcd
dd79 cdcdcd    call    $cdcd
dd7c cdcdcd    call    $cdcd
dd7f cdcdcd    call    $cdcd
dd82 cdcdcd    call    $cdcd
dd85 cdcdcd    call    $cdcd
dd88 cdcdcd    call    $cdcd
dd8b cdcdcd    call    $cdcd
dd8e cdcdcd    call    $cdcd
dd91 cdcdcd    call    $cdcd
dd94 cdcdcd    call    $cdcd
dd97 cdcdcd    call    $cdcd
dd9a cdcdcd    call    $cdcd
dd9d cdcdcd    call    $cdcd
dda0 cdcdcd    call    $cdcd
dda3 cdcdcd    call    $cdcd
dda6 cdcdcd    call    $cdcd
dda9 cdcdcd    call    $cdcd
ddac cdcdcd    call    $cdcd
ddaf cdcdcd    call    $cdcd
ddb2 cdcdcd    call    $cdcd
ddb5 cdcdcd    call    $cdcd
ddb8 cdcdcd    call    $cdcd
ddbb cdcdcd    call    $cdcd
ddbe cdcdcd    call    $cdcd
ddc1 cdcdcd    call    $cdcd
ddc4 cdcdcd    call    $cdcd
ddc7 cdcdcd    call    $cdcd
ddca cdcdcd    call    $cdcd
ddcd cdcdcd    call    $cdcd
ddd0 cdcdcd    call    $cdcd
ddd3 cdcdcd    call    $cdcd
ddd6 cdcdcd    call    $cdcd
ddd9 cdcdcd    call    $cdcd
dddc cdcdcd    call    $cdcd
dddf cdcdcd    call    $cdcd
dde2 cdcdcd    call    $cdcd
dde5 cdcdcd    call    $cdcd
dde8 cdcdcd    call    $cdcd
ddeb cdcdcd    call    $cdcd
ddee cdcdcd    call    $cdcd
ddf1 cdcdcd    call    $cdcd
ddf4 cdcdcd    call    $cdcd
ddf7 cdcdcd    call    $cdcd
ddfa cdcdcd    call    $cdcd
ddfd cdcdcd    call    $cdcd
de00 cdcdcd    call    $cdcd
de03 cdcdcd    call    $cdcd
de06 cdcdcd    call    $cdcd
de09 cdcdcd    call    $cdcd
de0c cdcdcd    call    $cdcd
de0f cdcdcd    call    $cdcd
de12 cdcdcd    call    $cdcd
de15 cdcdcd    call    $cdcd
de18 cdcdcd    call    $cdcd
de1b cdcdcd    call    $cdcd
de1e cdcdcd    call    $cdcd
de21 cdcdcd    call    $cdcd
de24 cdcdcd    call    $cdcd
de27 cdcdcd    call    $cdcd
de2a cdcdcd    call    $cdcd
de2d cdcdcd    call    $cdcd
de30 cdcdcd    call    $cdcd
de33 cdcdcd    call    $cdcd
de36 cdcdcd    call    $cdcd
de39 cdcdcd    call    $cdcd
de3c cdcdcd    call    $cdcd
de3f cdcdcd    call    $cdcd
de42 cdcdcd    call    $cdcd
de45 cdcdcd    call    $cdcd
de48 cdcdcd    call    $cdcd
de4b cdcdcd    call    $cdcd
de4e cdcdcd    call    $cdcd
de51 cdcdcd    call    $cdcd
de54 cdcdcd    call    $cdcd
de57 cdcdcd    call    $cdcd
de5a cdcdcd    call    $cdcd
de5d cdcdcd    call    $cdcd
de60 cdcdcd    call    $cdcd
de63 cdcdcd    call    $cdcd
de66 cdcdcd    call    $cdcd
de69 cdcdcd    call    $cdcd
de6c cdcdcd    call    $cdcd
de6f cdcdcd    call    $cdcd
de72 cdcdcd    call    $cdcd
de75 cdcdcd    call    $cdcd
de78 cdcdcd    call    $cdcd
de7b cdcdcd    call    $cdcd
de7e cdcdcd    call    $cdcd
de81 cdcdcd    call    $cdcd
de84 cdcdcd    call    $cdcd
de87 cdcdcd    call    $cdcd
de8a cdcdcd    call    $cdcd
de8d cdcdcd    call    $cdcd
de90 cdcdcd    call    $cdcd
de93 cdcdcd    call    $cdcd
de96 cdcdcd    call    $cdcd
de99 cdcdcd    call    $cdcd
de9c cdcdcd    call    $cdcd
de9f cdcdcd    call    $cdcd
dea2 cdcdcd    call    $cdcd
dea5 cdcdcd    call    $cdcd
dea8 cdcdcd    call    $cdcd
deab cdcdcd    call    $cdcd
deae cdcdcd    call    $cdcd
deb1 cdcdcd    call    $cdcd
deb4 cdcdcd    call    $cdcd
deb7 cdcdcd    call    $cdcd
deba cdcdcd    call    $cdcd
debd cdcdcd    call    $cdcd
dec0 cdcdcd    call    $cdcd
dec3 cdcdcd    call    $cdcd
dec6 cdcdcd    call    $cdcd
dec9 cdcdcd    call    $cdcd
decc cdcdcd    call    $cdcd
decf cdcdcd    call    $cdcd
ded2 cdcdcd    call    $cdcd
ded5 cdcdcd    call    $cdcd
ded8 cdcdcd    call    $cdcd
dedb cdcdcd    call    $cdcd
dede cdcdcd    call    $cdcd
dee1 cdcdcd    call    $cdcd
dee4 cdcdcd    call    $cdcd
dee7 cdcdcd    call    $cdcd
deea cdcdcd    call    $cdcd
deed cdcdcd    call    $cdcd
def0 cdcdcd    call    $cdcd
def3 cdcdcd    call    $cdcd
def6 cdcdcd    call    $cdcd
def9 cdcdcd    call    $cdcd
defc cdcdcd    call    $cdcd
deff cdcdcd    call    $cdcd
df02 cdcdcd    call    $cdcd
df05 cdcdcd    call    $cdcd
df08 cdcdcd    call    $cdcd
df0b cdcdcd    call    $cdcd
df0e cdcdcd    call    $cdcd
df11 cdcdcd    call    $cdcd
df14 cdcdcd    call    $cdcd
df17 cdcdcd    call    $cdcd
df1a cdcdcd    call    $cdcd
df1d cdcdcd    call    $cdcd
df20 cdcdcd    call    $cdcd
df23 cdcdcd    call    $cdcd
df26 cdcdcd    call    $cdcd
df29 cdcdcd    call    $cdcd
df2c cdcdcd    call    $cdcd
df2f cdcdcd    call    $cdcd
df32 cdcdcd    call    $cdcd
df35 cdcdcd    call    $cdcd
df38 cdcdcd    call    $cdcd
df3b cdcdcd    call    $cdcd
df3e cdcdcd    call    $cdcd
df41 cdcdcd    call    $cdcd
df44 cdcdcd    call    $cdcd
df47 cdcdcd    call    $cdcd
df4a cdcdcd    call    $cdcd
df4d cdcdcd    call    $cdcd
df50 cdcdcd    call    $cdcd
df53 cdcdcd    call    $cdcd
df56 cdcdcd    call    $cdcd
df59 cdcdcd    call    $cdcd
df5c cdcdcd    call    $cdcd
df5f cdcdcd    call    $cdcd
df62 cdcdcd    call    $cdcd
df65 cdcdcd    call    $cdcd
df68 cdcdcd    call    $cdcd
df6b cdcdcd    call    $cdcd
df6e cdcdcd    call    $cdcd
df71 cdcdcd    call    $cdcd
df74 cdcdcd    call    $cdcd
df77 cdcdcd    call    $cdcd
df7a cdcdcd    call    $cdcd
df7d cdcdcd    call    $cdcd
df80 cdcdcd    call    $cdcd
df83 cdcdcd    call    $cdcd
df86 cdcdcd    call    $cdcd
df89 cdcdcd    call    $cdcd
df8c cdcdcd    call    $cdcd
df8f cdcdcd    call    $cdcd
df92 cdcdcd    call    $cdcd
df95 cdcdcd    call    $cdcd
df98 cdcdcd    call    $cdcd
df9b cdcdcd    call    $cdcd
df9e cdcdcd    call    $cdcd
dfa1 cdcdcd    call    $cdcd
dfa4 cdcdcd    call    $cdcd
dfa7 cdcdcd    call    $cdcd
dfaa cdcdcd    call    $cdcd
dfad cdcdcd    call    $cdcd
dfb0 cdcdcd    call    $cdcd
dfb3 cdcdcd    call    $cdcd
dfb6 cdcdcd    call    $cdcd
dfb9 cdcdcd    call    $cdcd
dfbc cdcdcd    call    $cdcd
dfbf cdcdcd    call    $cdcd
dfc2 cdcdcd    call    $cdcd
dfc5 cdcdcd    call    $cdcd
dfc8 cdcdcd    call    $cdcd
dfcb cdcdcd    call    $cdcd
dfce cdcdcd    call    $cdcd
dfd1 cdcdcd    call    $cdcd
dfd4 cdcdcd    call    $cdcd
dfd7 cdcdcd    call    $cdcd
dfda cdcdcd    call    $cdcd
dfdd cdcdcd    call    $cdcd
dfe0 cdcdcd    call    $cdcd
dfe3 cdcdcd    call    $cdcd
dfe6 cdcdcd    call    $cdcd
dfe9 cdcdcd    call    $cdcd
dfec cdcdcd    call    $cdcd
dfef cdcdcd    call    $cdcd
dff2 cdcdcd    call    $cdcd
dff5 cdcdcd    call    $cdcd
dff8 cdcdcd    call    $cdcd
dffb cdcdcd    call    $cdcd
dffe cdcdcd    call    $cdcd
e001 cdcdcd    call    $cdcd
e004 cdcdcd    call    $cdcd
e007 cdcdcd    call    $cdcd
e00a cdcdcd    call    $cdcd
e00d cdcdcd    call    $cdcd
e010 cdcdcd    call    $cdcd
e013 cdcdcd    call    $cdcd
e016 cdcdcd    call    $cdcd
e019 cdcdcd    call    $cdcd
e01c cdcdcd    call    $cdcd
e01f cdcdcd    call    $cdcd
e022 cdcdcd    call    $cdcd
e025 cdcdcd    call    $cdcd
e028 cdcdcd    call    $cdcd
e02b cdcdcd    call    $cdcd
e02e cdcdcd    call    $cdcd
e031 cdcdcd    call    $cdcd
e034 cdcdcd    call    $cdcd
e037 cdcdcd    call    $cdcd
e03a cdcdcd    call    $cdcd
e03d cdcdcd    call    $cdcd
e040 cdcdcd    call    $cdcd
e043 cdcdcd    call    $cdcd
e046 cdcdcd    call    $cdcd
e049 cdcdcd    call    $cdcd
e04c cdcdcd    call    $cdcd
e04f cdcdcd    call    $cdcd
e052 cdcdcd    call    $cdcd
e055 cdcdcd    call    $cdcd
e058 cdcdcd    call    $cdcd
e05b cdcdcd    call    $cdcd
e05e cdcdcd    call    $cdcd
e061 cdcdcd    call    $cdcd
e064 cdcdcd    call    $cdcd
e067 cdcdcd    call    $cdcd
e06a cdcdcd    call    $cdcd
e06d cdcdcd    call    $cdcd
e070 cdcdcd    call    $cdcd
e073 cdcdcd    call    $cdcd
e076 cdcdcd    call    $cdcd
e079 cdcdcd    call    $cdcd
e07c cdcdcd    call    $cdcd
e07f cdcdcd    call    $cdcd
e082 cdcdcd    call    $cdcd
e085 cdcdcd    call    $cdcd
e088 cdcdcd    call    $cdcd
e08b cdcdcd    call    $cdcd
e08e cdcdcd    call    $cdcd
e091 cdcdcd    call    $cdcd
e094 cdcdcd    call    $cdcd
e097 cdcdcd    call    $cdcd
e09a cdcdcd    call    $cdcd
e09d cdcdcd    call    $cdcd
e0a0 cdcdcd    call    $cdcd
e0a3 cdcdcd    call    $cdcd
e0a6 cdcdcd    call    $cdcd
e0a9 cdcdcd    call    $cdcd
e0ac cdcdcd    call    $cdcd
e0af cdcdcd    call    $cdcd
e0b2 cdcdcd    call    $cdcd
e0b5 cdcdcd    call    $cdcd
e0b8 cdcdcd    call    $cdcd
e0bb cdcdcd    call    $cdcd
e0be cdcdcd    call    $cdcd
e0c1 cdcdcd    call    $cdcd
e0c4 cdcdcd    call    $cdcd
e0c7 cdcdcd    call    $cdcd
e0ca cdcdcd    call    $cdcd
e0cd cdcdcd    call    $cdcd
e0d0 cdcdcd    call    $cdcd
e0d3 cdcdcd    call    $cdcd
e0d6 cdcdcd    call    $cdcd
e0d9 cdcdcd    call    $cdcd
e0dc cdcdcd    call    $cdcd
e0df cdcdcd    call    $cdcd
e0e2 cdcdcd    call    $cdcd
e0e5 cdcdcd    call    $cdcd
e0e8 cdcdcd    call    $cdcd
e0eb cdcdcd    call    $cdcd
e0ee cdcdcd    call    $cdcd
e0f1 cdcdcd    call    $cdcd
e0f4 cdcdcd    call    $cdcd
e0f7 cdcdcd    call    $cdcd
e0fa cdcdcd    call    $cdcd
e0fd cdcdcd    call    $cdcd
e100 cdcdcd    call    $cdcd
e103 cdcdcd    call    $cdcd
e106 cdcdcd    call    $cdcd
e109 cdcdcd    call    $cdcd
e10c cdcdcd    call    $cdcd
e10f cdcdcd    call    $cdcd
e112 cdcdcd    call    $cdcd
e115 cdcdcd    call    $cdcd
e118 cdcdcd    call    $cdcd
e11b cdcdcd    call    $cdcd
e11e cdcdcd    call    $cdcd
e121 cdcdcd    call    $cdcd
e124 cdcdcd    call    $cdcd
e127 cdcdcd    call    $cdcd
e12a cdcdcd    call    $cdcd
e12d cdcdcd    call    $cdcd
e130 cdcdcd    call    $cdcd
e133 cdcdcd    call    $cdcd
e136 cdcdcd    call    $cdcd
e139 cdcdcd    call    $cdcd
e13c cdcdcd    call    $cdcd
e13f cdcdcd    call    $cdcd
e142 cdcdcd    call    $cdcd
e145 cdcdcd    call    $cdcd
e148 cdcdcd    call    $cdcd
e14b cdcdcd    call    $cdcd
e14e cdcdcd    call    $cdcd
e151 cdcdcd    call    $cdcd
e154 cdcdcd    call    $cdcd
e157 cdcdcd    call    $cdcd
e15a cdcdcd    call    $cdcd
e15d cdcdcd    call    $cdcd
e160 cdcdcd    call    $cdcd
e163 cdcdcd    call    $cdcd
e166 cdcdcd    call    $cdcd
e169 cdcdcd    call    $cdcd
e16c cdcdcd    call    $cdcd
e16f cdcdcd    call    $cdcd
e172 cdcdcd    call    $cdcd
e175 cdcdcd    call    $cdcd
e178 cdcdcd    call    $cdcd
e17b cdcdcd    call    $cdcd
e17e cdcdcd    call    $cdcd
e181 cdcdcd    call    $cdcd
e184 cdcdcd    call    $cdcd
e187 cdcdcd    call    $cdcd
e18a cdcdcd    call    $cdcd
e18d cdcdcd    call    $cdcd
e190 cdcdcd    call    $cdcd
e193 cdcdcd    call    $cdcd
e196 cdcdcd    call    $cdcd
e199 cdcdcd    call    $cdcd
e19c cdcdcd    call    $cdcd
e19f cdcdcd    call    $cdcd
e1a2 cdcdcd    call    $cdcd
e1a5 cdcdcd    call    $cdcd
e1a8 cdcdcd    call    $cdcd
e1ab cdcdcd    call    $cdcd
e1ae cdcdcd    call    $cdcd
e1b1 cdcdcd    call    $cdcd
e1b4 cdcdcd    call    $cdcd
e1b7 cdcdcd    call    $cdcd
e1ba cdcdcd    call    $cdcd
e1bd cdcdcd    call    $cdcd
e1c0 cdcdcd    call    $cdcd
e1c3 cdcdcd    call    $cdcd
e1c6 cdcdcd    call    $cdcd
e1c9 cdcdcd    call    $cdcd
e1cc cdcdcd    call    $cdcd
e1cf cdcdcd    call    $cdcd
e1d2 cdcdcd    call    $cdcd
e1d5 cdcdcd    call    $cdcd
e1d8 cdcdcd    call    $cdcd
e1db cdcdcd    call    $cdcd
e1de cdcdcd    call    $cdcd
e1e1 cdcdcd    call    $cdcd
e1e4 cdcdcd    call    $cdcd
e1e7 cdcdcd    call    $cdcd
e1ea cdcdcd    call    $cdcd
e1ed cdcdcd    call    $cdcd
e1f0 cdcdcd    call    $cdcd
e1f3 cdcdcd    call    $cdcd
e1f6 cdcdcd    call    $cdcd
e1f9 cdcdcd    call    $cdcd
e1fc cdcdcd    call    $cdcd
e1ff cdcdcd    call    $cdcd
e202 cdcdcd    call    $cdcd
e205 cdcdcd    call    $cdcd
e208 cdcdcd    call    $cdcd
e20b cdcdcd    call    $cdcd
e20e cdcdcd    call    $cdcd
e211 cdcdcd    call    $cdcd
e214 cdcdcd    call    $cdcd
e217 cdcdcd    call    $cdcd
e21a cdcdcd    call    $cdcd
e21d cdcdcd    call    $cdcd
e220 cdcdcd    call    $cdcd
e223 cdcdcd    call    $cdcd
e226 cdcdcd    call    $cdcd
e229 cdcdcd    call    $cdcd
e22c cdcdcd    call    $cdcd
e22f cdcdcd    call    $cdcd
e232 cdcdcd    call    $cdcd
e235 cdcdcd    call    $cdcd
e238 cdcdcd    call    $cdcd
e23b cdcdcd    call    $cdcd
e23e cdcdcd    call    $cdcd
e241 cdcdcd    call    $cdcd
e244 cdcdcd    call    $cdcd
e247 cdcdcd    call    $cdcd
e24a cdcdcd    call    $cdcd
e24d cdcdcd    call    $cdcd
e250 cdcdcd    call    $cdcd
e253 cdcdcd    call    $cdcd
e256 cdcdcd    call    $cdcd
e259 cdcdcd    call    $cdcd
e25c cdcdcd    call    $cdcd
e25f cdcdcd    call    $cdcd
e262 cdcdcd    call    $cdcd
e265 cdcdcd    call    $cdcd
e268 cdcdcd    call    $cdcd
e26b cdcdcd    call    $cdcd
e26e cdcdcd    call    $cdcd
e271 cdcdcd    call    $cdcd
e274 cdcdcd    call    $cdcd
e277 cdcdcd    call    $cdcd
e27a cdcdcd    call    $cdcd
e27d cdcdcd    call    $cdcd
e280 cdcdcd    call    $cdcd
e283 cdcdcd    call    $cdcd
e286 cdcdcd    call    $cdcd
e289 cdcdcd    call    $cdcd
e28c cdcdcd    call    $cdcd
e28f cdcdcd    call    $cdcd
e292 cdcdcd    call    $cdcd
e295 cdcdcd    call    $cdcd
e298 cdcdcd    call    $cdcd
e29b cdcdcd    call    $cdcd
e29e cdcdcd    call    $cdcd
e2a1 cdcdcd    call    $cdcd
e2a4 cdcdcd    call    $cdcd
e2a7 cdcdcd    call    $cdcd
e2aa cdcdcd    call    $cdcd
e2ad cdcdcd    call    $cdcd
e2b0 cdcdcd    call    $cdcd
e2b3 cdcdcd    call    $cdcd
e2b6 cdcdcd    call    $cdcd
e2b9 cdcdcd    call    $cdcd
e2bc cdcdcd    call    $cdcd
e2bf cdcdcd    call    $cdcd
e2c2 cdcdcd    call    $cdcd
e2c5 cdcdcd    call    $cdcd
e2c8 cdcdcd    call    $cdcd
e2cb cdcdcd    call    $cdcd
e2ce cdcdcd    call    $cdcd
e2d1 cdcdcd    call    $cdcd
e2d4 cdcdcd    call    $cdcd
e2d7 cdcdcd    call    $cdcd
e2da cdcdcd    call    $cdcd
e2dd cdcdcd    call    $cdcd
e2e0 cdcdcd    call    $cdcd
e2e3 cdcdcd    call    $cdcd
e2e6 cdcdcd    call    $cdcd
e2e9 cdcdcd    call    $cdcd
e2ec cdcdcd    call    $cdcd
e2ef cdcdcd    call    $cdcd
e2f2 cdcdcd    call    $cdcd
e2f5 cdcdcd    call    $cdcd
e2f8 cdcdcd    call    $cdcd
e2fb cdcdcd    call    $cdcd
e2fe cdcdcd    call    $cdcd
e301 cdcdcd    call    $cdcd
e304 cdcdcd    call    $cdcd
e307 cdcdcd    call    $cdcd
e30a cdcdcd    call    $cdcd
e30d cdcdcd    call    $cdcd
e310 cdcdcd    call    $cdcd
e313 cdcdcd    call    $cdcd
e316 cdcdcd    call    $cdcd
e319 cdcdcd    call    $cdcd
e31c cdcdcd    call    $cdcd
e31f cdcdcd    call    $cdcd
e322 cdcdcd    call    $cdcd
e325 cdcdcd    call    $cdcd
e328 cdcdcd    call    $cdcd
e32b cdcdcd    call    $cdcd
e32e cdcdcd    call    $cdcd
e331 cdcdcd    call    $cdcd
e334 cdcdcd    call    $cdcd
e337 cdcdcd    call    $cdcd
e33a cdcdcd    call    $cdcd
e33d cdcdcd    call    $cdcd
e340 cdcdcd    call    $cdcd
e343 cdcdcd    call    $cdcd
e346 cdcdcd    call    $cdcd
e349 cdcdcd    call    $cdcd
e34c cdcdcd    call    $cdcd
e34f cdcdcd    call    $cdcd
e352 cdcdcd    call    $cdcd
e355 cdcdcd    call    $cdcd
e358 cdcdcd    call    $cdcd
e35b cdcdcd    call    $cdcd
e35e cdcdcd    call    $cdcd
e361 cdcdcd    call    $cdcd
e364 cdcdcd    call    $cdcd
e367 cdcdcd    call    $cdcd
e36a cdcdcd    call    $cdcd
e36d cdcdcd    call    $cdcd
e370 cdcdcd    call    $cdcd
e373 cdcdcd    call    $cdcd
e376 cdcdcd    call    $cdcd
e379 cdcdcd    call    $cdcd
e37c cdcdcd    call    $cdcd
e37f cdcdcd    call    $cdcd
e382 cdcdcd    call    $cdcd
e385 cdcdcd    call    $cdcd
e388 cdcdcd    call    $cdcd
e38b cdcdcd    call    $cdcd
e38e cdcdcd    call    $cdcd
e391 cdcdcd    call    $cdcd
e394 cdcdcd    call    $cdcd
e397 cdcdcd    call    $cdcd
e39a cdcdcd    call    $cdcd
e39d cdcdcd    call    $cdcd
e3a0 cdcdcd    call    $cdcd
e3a3 cdcdcd    call    $cdcd
e3a6 cdcdcd    call    $cdcd
e3a9 cdcdcd    call    $cdcd
e3ac cdcdcd    call    $cdcd
e3af cdcdcd    call    $cdcd
e3b2 cdcdcd    call    $cdcd
e3b5 cdcdcd    call    $cdcd
e3b8 cdcdcd    call    $cdcd
e3bb cdcdcd    call    $cdcd
e3be cdcdcd    call    $cdcd
e3c1 cdcdcd    call    $cdcd
e3c4 cdcdcd    call    $cdcd
e3c7 cdcdcd    call    $cdcd
e3ca cdcdcd    call    $cdcd
e3cd cdcdcd    call    $cdcd
e3d0 cdcdcd    call    $cdcd
e3d3 cdcdcd    call    $cdcd
e3d6 cdcdcd    call    $cdcd
e3d9 cdcdcd    call    $cdcd
e3dc cdcdcd    call    $cdcd
e3df cdcdcd    call    $cdcd
e3e2 cdcdcd    call    $cdcd
e3e5 cdcdcd    call    $cdcd
e3e8 cdcdcd    call    $cdcd
e3eb cdcdcd    call    $cdcd
e3ee cdcdcd    call    $cdcd
e3f1 cdcdcd    call    $cdcd
e3f4 cdcdcd    call    $cdcd
e3f7 cdcdcd    call    $cdcd
e3fa cdcdcd    call    $cdcd
e3fd cdcdcd    call    $cdcd
e400 cdcdcd    call    $cdcd
e403 cdcdcd    call    $cdcd
e406 cdcdcd    call    $cdcd
e409 cdcdcd    call    $cdcd
e40c cdcdcd    call    $cdcd
e40f cdcdcd    call    $cdcd
e412 cdcdcd    call    $cdcd
e415 cdcdcd    call    $cdcd
e418 cdcdcd    call    $cdcd
e41b cdcdcd    call    $cdcd
e41e cdcdcd    call    $cdcd
e421 cdcdcd    call    $cdcd
e424 cdcdcd    call    $cdcd
e427 cdcdcd    call    $cdcd
e42a cdcdcd    call    $cdcd
e42d cdcdcd    call    $cdcd
e430 cdcdcd    call    $cdcd
e433 cdcdcd    call    $cdcd
e436 cdcdcd    call    $cdcd
e439 cdcdcd    call    $cdcd
e43c cdcdcd    call    $cdcd
e43f cdcdcd    call    $cdcd
e442 cdcdcd    call    $cdcd
e445 cdcdcd    call    $cdcd
e448 cdcdcd    call    $cdcd
e44b cdcdcd    call    $cdcd
e44e cdcdcd    call    $cdcd
e451 cdcdcd    call    $cdcd
e454 cdcdcd    call    $cdcd
e457 cdcdcd    call    $cdcd
e45a cdcdcd    call    $cdcd
e45d cdcdcd    call    $cdcd
e460 cdcdcd    call    $cdcd
e463 cdcdcd    call    $cdcd
e466 cdcdcd    call    $cdcd
e469 cdcdcd    call    $cdcd
e46c cdcdcd    call    $cdcd
e46f cdcdcd    call    $cdcd
e472 cdcdcd    call    $cdcd
e475 cdcdcd    call    $cdcd
e478 cdcdcd    call    $cdcd
e47b cdcdcd    call    $cdcd
e47e cdcdcd    call    $cdcd
e481 cdcdcd    call    $cdcd
e484 cdcdcd    call    $cdcd
e487 cdcdcd    call    $cdcd
e48a cdcdcd    call    $cdcd
e48d cdcdcd    call    $cdcd
e490 cdcdcd    call    $cdcd
e493 cdcdcd    call    $cdcd
e496 cdcdcd    call    $cdcd
e499 cdcdcd    call    $cdcd
e49c cdcdcd    call    $cdcd
e49f cdcdcd    call    $cdcd
e4a2 cdcdcd    call    $cdcd
e4a5 cdcdcd    call    $cdcd
e4a8 cdcdcd    call    $cdcd
e4ab cdcdcd    call    $cdcd
e4ae cdcdcd    call    $cdcd
e4b1 cdcdcd    call    $cdcd
e4b4 cdcdcd    call    $cdcd
e4b7 cdcdcd    call    $cdcd
e4ba cdcdcd    call    $cdcd
e4bd cdcdcd    call    $cdcd
e4c0 cdcdcd    call    $cdcd
e4c3 cdcdcd    call    $cdcd
e4c6 cdcdcd    call    $cdcd
e4c9 cdcdcd    call    $cdcd
e4cc cdcdcd    call    $cdcd
e4cf cdcdcd    call    $cdcd
e4d2 cdcdcd    call    $cdcd
e4d5 cdcdcd    call    $cdcd
e4d8 cdcdcd    call    $cdcd
e4db cdcdcd    call    $cdcd
e4de cdcdcd    call    $cdcd
e4e1 cdcdcd    call    $cdcd
e4e4 cdcdcd    call    $cdcd
e4e7 cdcdcd    call    $cdcd
e4ea cdcdcd    call    $cdcd
e4ed cdcdcd    call    $cdcd
e4f0 cdcdcd    call    $cdcd
e4f3 cdcdcd    call    $cdcd
e4f6 cdcdcd    call    $cdcd
e4f9 cdcdcd    call    $cdcd
e4fc cdcdcd    call    $cdcd
e4ff cdcdcd    call    $cdcd
e502 cdcdcd    call    $cdcd
e505 cdcdcd    call    $cdcd
e508 cdcdcd    call    $cdcd
e50b cdcdcd    call    $cdcd
e50e cdcdcd    call    $cdcd
e511 cdcdcd    call    $cdcd
e514 cdcdcd    call    $cdcd
e517 cdcdcd    call    $cdcd
e51a cdcdcd    call    $cdcd
e51d cdcdcd    call    $cdcd
e520 cdcdcd    call    $cdcd
e523 cdcdcd    call    $cdcd
e526 cdcdcd    call    $cdcd
e529 cdcdcd    call    $cdcd
e52c cdcdcd    call    $cdcd
e52f cdcdcd    call    $cdcd
e532 cdcdcd    call    $cdcd
e535 cdcdcd    call    $cdcd
e538 cdcdcd    call    $cdcd
e53b cdcdcd    call    $cdcd
e53e cdcdcd    call    $cdcd
e541 cdcdcd    call    $cdcd
e544 cdcdcd    call    $cdcd
e547 cdcdcd    call    $cdcd
e54a cdcdcd    call    $cdcd
e54d cdcdcd    call    $cdcd
e550 cdcdcd    call    $cdcd
e553 cdcdcd    call    $cdcd
e556 cdcdcd    call    $cdcd
e559 cdcdcd    call    $cdcd
e55c cdcdcd    call    $cdcd
e55f cdcdcd    call    $cdcd
e562 cdcdcd    call    $cdcd
e565 cdcdcd    call    $cdcd
e568 cdcdcd    call    $cdcd
e56b cdcdcd    call    $cdcd
e56e cdcdcd    call    $cdcd
e571 cdcdcd    call    $cdcd
e574 cdcdcd    call    $cdcd
e577 cdcdcd    call    $cdcd
e57a cdcdcd    call    $cdcd
e57d cdcdcd    call    $cdcd
e580 cdcdcd    call    $cdcd
e583 cdcdcd    call    $cdcd
e586 cdcdcd    call    $cdcd
e589 cdcdcd    call    $cdcd
e58c cdcdcd    call    $cdcd
e58f cdcdcd    call    $cdcd
e592 cdcdcd    call    $cdcd
e595 cdcdcd    call    $cdcd
e598 cdcdcd    call    $cdcd
e59b cdcdcd    call    $cdcd
e59e cdcdcd    call    $cdcd
e5a1 cdcdcd    call    $cdcd
e5a4 cdcdcd    call    $cdcd
e5a7 cdcdcd    call    $cdcd
e5aa cdcdcd    call    $cdcd
e5ad cdcdcd    call    $cdcd
e5b0 cdcdcd    call    $cdcd
e5b3 cdcdcd    call    $cdcd
e5b6 cdcdcd    call    $cdcd
e5b9 cdcdcd    call    $cdcd
e5bc cdcdcd    call    $cdcd
e5bf cdcdcd    call    $cdcd
e5c2 cdcdcd    call    $cdcd
e5c5 cdcdcd    call    $cdcd
e5c8 cdcdcd    call    $cdcd
e5cb cdcdcd    call    $cdcd
e5ce cdcdcd    call    $cdcd
e5d1 cdcdcd    call    $cdcd
e5d4 cdcdcd    call    $cdcd
e5d7 cdcdcd    call    $cdcd
e5da cdcdcd    call    $cdcd
e5dd cdcdcd    call    $cdcd
e5e0 cdcdcd    call    $cdcd
e5e3 cdcdcd    call    $cdcd
e5e6 cdcdcd    call    $cdcd
e5e9 cdcdcd    call    $cdcd
e5ec cdcdcd    call    $cdcd
e5ef cdcdcd    call    $cdcd
e5f2 cdcdcd    call    $cdcd
e5f5 cdcdcd    call    $cdcd
e5f8 cdcdcd    call    $cdcd
e5fb cdcdcd    call    $cdcd
e5fe cdcdcd    call    $cdcd
e601 cdcdcd    call    $cdcd
e604 cdcdcd    call    $cdcd
e607 cdcdcd    call    $cdcd
e60a cdcdcd    call    $cdcd
e60d cdcdcd    call    $cdcd
e610 cdcdcd    call    $cdcd
e613 cdcdcd    call    $cdcd
e616 cdcdcd    call    $cdcd
e619 cdcdcd    call    $cdcd
e61c cdcdcd    call    $cdcd
e61f cdcdcd    call    $cdcd
e622 cdcdcd    call    $cdcd
e625 cdcdcd    call    $cdcd
e628 cdcdcd    call    $cdcd
e62b cdcdcd    call    $cdcd
e62e cdcdcd    call    $cdcd
e631 cdcdcd    call    $cdcd
e634 cdcdcd    call    $cdcd
e637 cdcdcd    call    $cdcd
e63a cdcdcd    call    $cdcd
e63d cdcdcd    call    $cdcd
e640 cdcdcd    call    $cdcd
e643 cdcdcd    call    $cdcd
e646 cdcdcd    call    $cdcd
e649 cdcdcd    call    $cdcd
e64c cdcdcd    call    $cdcd
e64f cdcdcd    call    $cdcd
e652 cdcdcd    call    $cdcd
e655 cdcdcd    call    $cdcd
e658 cdcdcd    call    $cdcd
e65b cdcdcd    call    $cdcd
e65e cdcdcd    call    $cdcd
e661 cdcdcd    call    $cdcd
e664 cdcdcd    call    $cdcd
e667 cdcdcd    call    $cdcd
e66a cdcdcd    call    $cdcd
e66d cdcdcd    call    $cdcd
e670 cdcdcd    call    $cdcd
e673 cdcdcd    call    $cdcd
e676 cdcdcd    call    $cdcd
e679 cdcdcd    call    $cdcd
e67c cdcdcd    call    $cdcd
e67f cdcdcd    call    $cdcd
e682 cdcdcd    call    $cdcd
e685 cdcdcd    call    $cdcd
e688 cdcdcd    call    $cdcd
e68b cdcdcd    call    $cdcd
e68e cdcdcd    call    $cdcd
e691 cdcdcd    call    $cdcd
e694 cdcdcd    call    $cdcd
e697 cdcdcd    call    $cdcd
e69a cdcdcd    call    $cdcd
e69d cdcdcd    call    $cdcd
e6a0 cdcdcd    call    $cdcd
e6a3 cdcdcd    call    $cdcd
e6a6 cdcdcd    call    $cdcd
e6a9 cdcdcd    call    $cdcd
e6ac cdcdcd    call    $cdcd
e6af cdcdcd    call    $cdcd
e6b2 cdcdcd    call    $cdcd
e6b5 cdcdcd    call    $cdcd
e6b8 cdcdcd    call    $cdcd
e6bb cdcdcd    call    $cdcd
e6be cdcdcd    call    $cdcd
e6c1 cdcdcd    call    $cdcd
e6c4 cdcdcd    call    $cdcd
e6c7 cdcdcd    call    $cdcd
e6ca cdcdcd    call    $cdcd
e6cd cdcdcd    call    $cdcd
e6d0 cdcdcd    call    $cdcd
e6d3 cdcdcd    call    $cdcd
e6d6 cdcdcd    call    $cdcd
e6d9 cdcdcd    call    $cdcd
e6dc cdcdcd    call    $cdcd
e6df cdcdcd    call    $cdcd
e6e2 cdcdcd    call    $cdcd
e6e5 cdcdcd    call    $cdcd
e6e8 cdcdcd    call    $cdcd
e6eb cdcdcd    call    $cdcd
e6ee cdcdcd    call    $cdcd
e6f1 cdcdcd    call    $cdcd
e6f4 cdcdcd    call    $cdcd
e6f7 cdcdcd    call    $cdcd
e6fa cdcdcd    call    $cdcd
e6fd cdcdcd    call    $cdcd
e700 cdcdcd    call    $cdcd
e703 cdcdcd    call    $cdcd
e706 cdcdcd    call    $cdcd
e709 cdcdcd    call    $cdcd
e70c cdcdcd    call    $cdcd
e70f cdcdcd    call    $cdcd
e712 cdcdcd    call    $cdcd
e715 cdcdcd    call    $cdcd
e718 cdcdcd    call    $cdcd
e71b cdcdcd    call    $cdcd
e71e cdcdcd    call    $cdcd
e721 cdcdcd    call    $cdcd
e724 cdcdcd    call    $cdcd
e727 cdcdcd    call    $cdcd
e72a cdcdcd    call    $cdcd
e72d cdcdcd    call    $cdcd
e730 cdcdcd    call    $cdcd
e733 cdcdcd    call    $cdcd
e736 cdcdcd    call    $cdcd
e739 cdcdcd    call    $cdcd
e73c cdcdcd    call    $cdcd
e73f cdcdcd    call    $cdcd
e742 cdcdcd    call    $cdcd
e745 cdcdcd    call    $cdcd
e748 cdcdcd    call    $cdcd
e74b cdcdcd    call    $cdcd
e74e cdcdcd    call    $cdcd
e751 cdcdcd    call    $cdcd
e754 cdcdcd    call    $cdcd
e757 cdcdcd    call    $cdcd
e75a cdcdcd    call    $cdcd
e75d cdcdcd    call    $cdcd
e760 cdcdcd    call    $cdcd
e763 cdcdcd    call    $cdcd
e766 cdcdcd    call    $cdcd
e769 cdcdcd    call    $cdcd
e76c cdcdcd    call    $cdcd
e76f cdcdcd    call    $cdcd
e772 cdcdcd    call    $cdcd
e775 cdcdcd    call    $cdcd
e778 cdcdcd    call    $cdcd
e77b cdcdcd    call    $cdcd
e77e cdcdcd    call    $cdcd
e781 cdcdcd    call    $cdcd
e784 cdcdcd    call    $cdcd
e787 cdcdcd    call    $cdcd
e78a cdcdcd    call    $cdcd
e78d cdcdcd    call    $cdcd
e790 cdcdcd    call    $cdcd
e793 cdcdcd    call    $cdcd
e796 cdcdcd    call    $cdcd
e799 cdcdcd    call    $cdcd
e79c cdcdcd    call    $cdcd
e79f cdcdcd    call    $cdcd
e7a2 cdcdcd    call    $cdcd
e7a5 cdcdcd    call    $cdcd
e7a8 cdcdcd    call    $cdcd
e7ab cdcdcd    call    $cdcd
e7ae cdcdcd    call    $cdcd
e7b1 cdcdcd    call    $cdcd
e7b4 cdcdcd    call    $cdcd
e7b7 cdcdcd    call    $cdcd
e7ba cdcdcd    call    $cdcd
e7bd cdcdcd    call    $cdcd
e7c0 cdcdcd    call    $cdcd
e7c3 cdcdcd    call    $cdcd
e7c6 cdcdcd    call    $cdcd
e7c9 cdcdcd    call    $cdcd
e7cc cdcdcd    call    $cdcd
e7cf cdcdcd    call    $cdcd
e7d2 cdcdcd    call    $cdcd
e7d5 cdcdcd    call    $cdcd
e7d8 cdcdcd    call    $cdcd
e7db cdcdcd    call    $cdcd
e7de cdcdcd    call    $cdcd
e7e1 cdcdcd    call    $cdcd
e7e4 cdcdcd    call    $cdcd
e7e7 cdcdcd    call    $cdcd
e7ea cdcdcd    call    $cdcd
e7ed cdcdcd    call    $cdcd
e7f0 cdcdcd    call    $cdcd
e7f3 cdcdcd    call    $cdcd
e7f6 cdcdcd    call    $cdcd
e7f9 cdcdcd    call    $cdcd
e7fc cdcdcd    call    $cdcd
e7ff cdcdcd    call    $cdcd
e802 cdcdcd    call    $cdcd
e805 cdcdcd    call    $cdcd
e808 cdcdcd    call    $cdcd
e80b cdcdcd    call    $cdcd
e80e cdcdcd    call    $cdcd
e811 cdcdcd    call    $cdcd
e814 cdcdcd    call    $cdcd
e817 cdcdcd    call    $cdcd
e81a cdcdcd    call    $cdcd
e81d cdcdcd    call    $cdcd
e820 cdcdcd    call    $cdcd
e823 cdcdcd    call    $cdcd
e826 cdcdcd    call    $cdcd
e829 cdcdcd    call    $cdcd
e82c cdcdcd    call    $cdcd
e82f cdcdcd    call    $cdcd
e832 cdcdcd    call    $cdcd
e835 cdcdcd    call    $cdcd
e838 cdcdcd    call    $cdcd
e83b cdcdcd    call    $cdcd
e83e cdcdcd    call    $cdcd
e841 cdcdcd    call    $cdcd
e844 cdcdcd    call    $cdcd
e847 cdcdcd    call    $cdcd
e84a cdcdcd    call    $cdcd
e84d cdcdcd    call    $cdcd
e850 cdcdcd    call    $cdcd
e853 cdcdcd    call    $cdcd
e856 cdcdcd    call    $cdcd
e859 cdcdcd    call    $cdcd
e85c cdcdcd    call    $cdcd
e85f cdcdcd    call    $cdcd
e862 cdcdcd    call    $cdcd
e865 cdcdcd    call    $cdcd
e868 cdcdcd    call    $cdcd
e86b cdcdcd    call    $cdcd
e86e cdcdcd    call    $cdcd
e871 cdcdcd    call    $cdcd
e874 cdcdcd    call    $cdcd
e877 cdcdcd    call    $cdcd
e87a cdcdcd    call    $cdcd
e87d cdcdcd    call    $cdcd
e880 cdcdcd    call    $cdcd
e883 cdcdcd    call    $cdcd
e886 cdcdcd    call    $cdcd
e889 cdcdcd    call    $cdcd
e88c cdcdcd    call    $cdcd
e88f cdcdcd    call    $cdcd
e892 cdcdcd    call    $cdcd
e895 cdcdcd    call    $cdcd
e898 cdcdcd    call    $cdcd
e89b cdcdcd    call    $cdcd
e89e cdcdcd    call    $cdcd
e8a1 cdcdcd    call    $cdcd
e8a4 cdcdcd    call    $cdcd
e8a7 cdcdcd    call    $cdcd
e8aa cdcdcd    call    $cdcd
e8ad cdcdcd    call    $cdcd
e8b0 cdcdcd    call    $cdcd
e8b3 cdcdcd    call    $cdcd
e8b6 cdcdcd    call    $cdcd
e8b9 cdcdcd    call    $cdcd
e8bc cdcdcd    call    $cdcd
e8bf cdcdcd    call    $cdcd
e8c2 cdcdcd    call    $cdcd
e8c5 cdcdcd    call    $cdcd
e8c8 cdcdcd    call    $cdcd
e8cb cdcdcd    call    $cdcd
e8ce cdcdcd    call    $cdcd
e8d1 cdcdcd    call    $cdcd
e8d4 cdcdcd    call    $cdcd
e8d7 cdcdcd    call    $cdcd
e8da cdcdcd    call    $cdcd
e8dd cdcdcd    call    $cdcd
e8e0 cdcdcd    call    $cdcd
e8e3 cdcdcd    call    $cdcd
e8e6 cdcdcd    call    $cdcd
e8e9 cdcdcd    call    $cdcd
e8ec cdcdcd    call    $cdcd
e8ef cdcdcd    call    $cdcd
e8f2 cdcdcd    call    $cdcd
e8f5 cdcdcd    call    $cdcd
e8f8 cdcdcd    call    $cdcd
e8fb cdcdcd    call    $cdcd
e8fe cdcdcd    call    $cdcd
e901 cdcdcd    call    $cdcd
e904 cdcdcd    call    $cdcd
e907 cdcdcd    call    $cdcd
e90a cdcdcd    call    $cdcd
e90d cdcdcd    call    $cdcd
e910 cdcdcd    call    $cdcd
e913 cdcdcd    call    $cdcd
e916 cdcdcd    call    $cdcd
e919 cdcdcd    call    $cdcd
e91c cdcdcd    call    $cdcd
e91f cdcdcd    call    $cdcd
e922 cdcdcd    call    $cdcd
e925 cdcdcd    call    $cdcd
e928 cdcdcd    call    $cdcd
e92b cdcdcd    call    $cdcd
e92e cdcdcd    call    $cdcd
e931 cdcdcd    call    $cdcd
e934 cdcdcd    call    $cdcd
e937 cdcdcd    call    $cdcd
e93a cdcdcd    call    $cdcd
e93d cdcdcd    call    $cdcd
e940 cdcdcd    call    $cdcd
e943 cdcdcd    call    $cdcd
e946 cdcdcd    call    $cdcd
e949 cdcdcd    call    $cdcd
e94c cdcdcd    call    $cdcd
e94f cdcdcd    call    $cdcd
e952 cdcdcd    call    $cdcd
e955 cdcdcd    call    $cdcd
e958 cdcdcd    call    $cdcd
e95b cdcdcd    call    $cdcd
e95e cdcdcd    call    $cdcd
e961 cdcdcd    call    $cdcd
e964 cdcdcd    call    $cdcd
e967 cdcdcd    call    $cdcd
e96a cdcdcd    call    $cdcd
e96d cdcdcd    call    $cdcd
e970 cdcdcd    call    $cdcd
e973 cdcdcd    call    $cdcd
e976 cdcdcd    call    $cdcd
e979 cdcdcd    call    $cdcd
e97c cdcdcd    call    $cdcd
e97f cdcdcd    call    $cdcd
e982 cdcdcd    call    $cdcd
e985 cdcdcd    call    $cdcd
e988 cdcdcd    call    $cdcd
e98b cdcdcd    call    $cdcd
e98e cdcdcd    call    $cdcd
e991 cdcdcd    call    $cdcd
e994 cdcdcd    call    $cdcd
e997 cdcdcd    call    $cdcd
e99a cdcdcd    call    $cdcd
e99d cdcdcd    call    $cdcd
e9a0 cdcdcd    call    $cdcd
e9a3 cdcdcd    call    $cdcd
e9a6 cdcdcd    call    $cdcd
e9a9 cdcdcd    call    $cdcd
e9ac cdcdcd    call    $cdcd
e9af cdcdcd    call    $cdcd
e9b2 cdcdcd    call    $cdcd
e9b5 cdcdcd    call    $cdcd
e9b8 cdcdcd    call    $cdcd
e9bb cdcdcd    call    $cdcd
e9be cdcdcd    call    $cdcd
e9c1 cdcdcd    call    $cdcd
e9c4 cdcdcd    call    $cdcd
e9c7 cdcdcd    call    $cdcd
e9ca cdcdcd    call    $cdcd
e9cd cdcdcd    call    $cdcd
e9d0 cdcdcd    call    $cdcd
e9d3 cdcdcd    call    $cdcd
e9d6 cdcdcd    call    $cdcd
e9d9 cdcdcd    call    $cdcd
e9dc cdcdcd    call    $cdcd
e9df cdcdcd    call    $cdcd
e9e2 cdcdcd    call    $cdcd
e9e5 cdcdcd    call    $cdcd
e9e8 cdcdcd    call    $cdcd
e9eb cdcdcd    call    $cdcd
e9ee cdcdcd    call    $cdcd
e9f1 cdcdcd    call    $cdcd
e9f4 cdcdcd    call    $cdcd
e9f7 cdcdcd    call    $cdcd
e9fa cdcdcd    call    $cdcd
e9fd cdcdcd    call    $cdcd
ea00 cdcdcd    call    $cdcd
ea03 cdcdcd    call    $cdcd
ea06 cdcdcd    call    $cdcd
ea09 cdcdcd    call    $cdcd
ea0c cdcdcd    call    $cdcd
ea0f cdcdcd    call    $cdcd
ea12 cdcdcd    call    $cdcd
ea15 cdcdcd    call    $cdcd
ea18 cdcdcd    call    $cdcd
ea1b cdcdcd    call    $cdcd
ea1e cdcdcd    call    $cdcd
ea21 cdcdcd    call    $cdcd
ea24 cdcdcd    call    $cdcd
ea27 cdcdcd    call    $cdcd
ea2a cdcdcd    call    $cdcd
ea2d cdcdcd    call    $cdcd
ea30 cdcdcd    call    $cdcd
ea33 cdcdcd    call    $cdcd
ea36 cdcdcd    call    $cdcd
ea39 cdcdcd    call    $cdcd
ea3c cdcdcd    call    $cdcd
ea3f cdcdcd    call    $cdcd
ea42 cdcdcd    call    $cdcd
ea45 cdcdcd    call    $cdcd
ea48 cdcdcd    call    $cdcd
ea4b cdcdcd    call    $cdcd
ea4e cdcdcd    call    $cdcd
ea51 cdcdcd    call    $cdcd
ea54 cdcdcd    call    $cdcd
ea57 cdcdcd    call    $cdcd
ea5a cdcdcd    call    $cdcd
ea5d cdcdcd    call    $cdcd
ea60 cdcdcd    call    $cdcd
ea63 cdcdcd    call    $cdcd
ea66 cdcdcd    call    $cdcd
ea69 cdcdcd    call    $cdcd
ea6c cdcdcd    call    $cdcd
ea6f cdcdcd    call    $cdcd
ea72 cdcdcd    call    $cdcd
ea75 cdcdcd    call    $cdcd
ea78 cdcdcd    call    $cdcd
ea7b cdcdcd    call    $cdcd
ea7e cdcdcd    call    $cdcd
ea81 cdcdcd    call    $cdcd
ea84 cdcdcd    call    $cdcd
ea87 cdcdcd    call    $cdcd
ea8a cdcdcd    call    $cdcd
ea8d cdcdcd    call    $cdcd
ea90 cdcdcd    call    $cdcd
ea93 cdcdcd    call    $cdcd
ea96 cdcdcd    call    $cdcd
ea99 cdcdcd    call    $cdcd
ea9c cdcdcd    call    $cdcd
ea9f cdcdcd    call    $cdcd
eaa2 cdcdcd    call    $cdcd
eaa5 cdcdcd    call    $cdcd
eaa8 cdcdcd    call    $cdcd
eaab cdcdcd    call    $cdcd
eaae cdcdcd    call    $cdcd
eab1 cdcdcd    call    $cdcd
eab4 cdcdcd    call    $cdcd
eab7 cdcdcd    call    $cdcd
eaba cdcdcd    call    $cdcd
eabd cdcdcd    call    $cdcd
eac0 cdcdcd    call    $cdcd
eac3 cdcdcd    call    $cdcd
eac6 cdcdcd    call    $cdcd
eac9 cdcdcd    call    $cdcd
eacc cdcdcd    call    $cdcd
eacf cdcdcd    call    $cdcd
ead2 cdcdcd    call    $cdcd
ead5 cdcdcd    call    $cdcd
ead8 cdcdcd    call    $cdcd
eadb cdcdcd    call    $cdcd
eade cdcdcd    call    $cdcd
eae1 cdcdcd    call    $cdcd
eae4 cdcdcd    call    $cdcd
eae7 cdcdcd    call    $cdcd
eaea cdcdcd    call    $cdcd
eaed cdcdcd    call    $cdcd
eaf0 cdcdcd    call    $cdcd
eaf3 cdcdcd    call    $cdcd
eaf6 cdcdcd    call    $cdcd
eaf9 cdcdcd    call    $cdcd
eafc cdcdcd    call    $cdcd
eaff cdcdcd    call    $cdcd
eb02 cdcdcd    call    $cdcd
eb05 cdcdcd    call    $cdcd
eb08 cdcdcd    call    $cdcd
eb0b cdcdcd    call    $cdcd
eb0e cdcdcd    call    $cdcd
eb11 cdcdcd    call    $cdcd
eb14 cdcdcd    call    $cdcd
eb17 cdcdcd    call    $cdcd
eb1a cdcdcd    call    $cdcd
eb1d cdcdcd    call    $cdcd
eb20 cdcdcd    call    $cdcd
eb23 cdcdcd    call    $cdcd
eb26 cdcdcd    call    $cdcd
eb29 cdcdcd    call    $cdcd
eb2c cdcdcd    call    $cdcd
eb2f cdcdcd    call    $cdcd
eb32 cdcdcd    call    $cdcd
eb35 cdcdcd    call    $cdcd
eb38 cdcdcd    call    $cdcd
eb3b cdcdcd    call    $cdcd
eb3e cdcdcd    call    $cdcd
eb41 cdcdcd    call    $cdcd
eb44 cdcdcd    call    $cdcd
eb47 cdcdcd    call    $cdcd
eb4a cdcdcd    call    $cdcd
eb4d cdcdcd    call    $cdcd
eb50 cdcdcd    call    $cdcd
eb53 cdcdcd    call    $cdcd
eb56 cdcdcd    call    $cdcd
eb59 cdcdcd    call    $cdcd
eb5c cdcdcd    call    $cdcd
eb5f cdcdcd    call    $cdcd
eb62 cdcdcd    call    $cdcd
eb65 cdcdcd    call    $cdcd
eb68 cdcdcd    call    $cdcd
eb6b cdcdcd    call    $cdcd
eb6e cdcdcd    call    $cdcd
eb71 cdcdcd    call    $cdcd
eb74 cdcdcd    call    $cdcd
eb77 cdcdcd    call    $cdcd
eb7a cdcdcd    call    $cdcd
eb7d cdcdcd    call    $cdcd
eb80 cdcdcd    call    $cdcd
eb83 cdcdcd    call    $cdcd
eb86 cdcdcd    call    $cdcd
eb89 cdcdcd    call    $cdcd
eb8c cdcdcd    call    $cdcd
eb8f cdcdcd    call    $cdcd
eb92 cdcdcd    call    $cdcd
eb95 cdcdcd    call    $cdcd
eb98 cdcdcd    call    $cdcd
eb9b cdcdcd    call    $cdcd
eb9e cdcdcd    call    $cdcd
eba1 cdcdcd    call    $cdcd
eba4 cdcdcd    call    $cdcd
eba7 cdcdcd    call    $cdcd
ebaa cdcdcd    call    $cdcd
ebad cdcdcd    call    $cdcd
ebb0 cdcdcd    call    $cdcd
ebb3 cdcdcd    call    $cdcd
ebb6 cdcdcd    call    $cdcd
ebb9 cdcdcd    call    $cdcd
ebbc cdcdcd    call    $cdcd
ebbf cdcdcd    call    $cdcd
ebc2 cdcdcd    call    $cdcd
ebc5 cdcdcd    call    $cdcd
ebc8 cdcdcd    call    $cdcd
ebcb cdcdcd    call    $cdcd
ebce cdcdcd    call    $cdcd
ebd1 cdcdcd    call    $cdcd
ebd4 cdcdcd    call    $cdcd
ebd7 cdcdcd    call    $cdcd
ebda cdcdcd    call    $cdcd
ebdd cdcdcd    call    $cdcd
ebe0 cdcdcd    call    $cdcd
ebe3 cdcdcd    call    $cdcd
ebe6 cdcdcd    call    $cdcd
ebe9 cdcdcd    call    $cdcd
ebec cdcdcd    call    $cdcd
ebef cdcdcd    call    $cdcd
ebf2 cdcdcd    call    $cdcd
ebf5 cdcdcd    call    $cdcd
ebf8 cdcdcd    call    $cdcd
ebfb cdcdcd    call    $cdcd
ebfe cdcdcd    call    $cdcd
ec01 cdcdcd    call    $cdcd
ec04 cdcdcd    call    $cdcd
ec07 cdcdcd    call    $cdcd
ec0a cdcdcd    call    $cdcd
ec0d cdcdcd    call    $cdcd
ec10 cdcdcd    call    $cdcd
ec13 cdcdcd    call    $cdcd
ec16 cdcdcd    call    $cdcd
ec19 cdcdcd    call    $cdcd
ec1c cdcdcd    call    $cdcd
ec1f cdcdcd    call    $cdcd
ec22 cdcdcd    call    $cdcd
ec25 cdcdcd    call    $cdcd
ec28 cdcdcd    call    $cdcd
ec2b cdcdcd    call    $cdcd
ec2e cdcdcd    call    $cdcd
ec31 cdcdcd    call    $cdcd
ec34 cdcdcd    call    $cdcd
ec37 cdcdcd    call    $cdcd
ec3a cdcdcd    call    $cdcd
ec3d cdcdcd    call    $cdcd
ec40 cdcdcd    call    $cdcd
ec43 cdcdcd    call    $cdcd
ec46 cdcdcd    call    $cdcd
ec49 cdcdcd    call    $cdcd
ec4c cdcdcd    call    $cdcd
ec4f cdcdcd    call    $cdcd
ec52 cdcdcd    call    $cdcd
ec55 cdcdcd    call    $cdcd
ec58 cdcdcd    call    $cdcd
ec5b cdcdcd    call    $cdcd
ec5e cdcdcd    call    $cdcd
ec61 cdcdcd    call    $cdcd
ec64 cdcdcd    call    $cdcd
ec67 cdcdcd    call    $cdcd
ec6a cdcdcd    call    $cdcd
ec6d cdcdcd    call    $cdcd
ec70 cdcdcd    call    $cdcd
ec73 cdcdcd    call    $cdcd
ec76 cdcdcd    call    $cdcd
ec79 cdcdcd    call    $cdcd
ec7c cdcdcd    call    $cdcd
ec7f cdcdcd    call    $cdcd
ec82 cdcdcd    call    $cdcd
ec85 cdcdcd    call    $cdcd
ec88 cdcdcd    call    $cdcd
ec8b cdcdcd    call    $cdcd
ec8e cdcdcd    call    $cdcd
ec91 cdcdcd    call    $cdcd
ec94 cdcdcd    call    $cdcd
ec97 cdcdcd    call    $cdcd
ec9a cdcdcd    call    $cdcd
ec9d cdcdcd    call    $cdcd
eca0 cdcdcd    call    $cdcd
eca3 cdcdcd    call    $cdcd
eca6 cdcdcd    call    $cdcd
eca9 cdcdcd    call    $cdcd
ecac cdcdcd    call    $cdcd
ecaf cdcdcd    call    $cdcd
ecb2 cdcdcd    call    $cdcd
ecb5 cdcdcd    call    $cdcd
ecb8 cdcdcd    call    $cdcd
ecbb cdcdcd    call    $cdcd
ecbe cdcdcd    call    $cdcd
ecc1 cdcdcd    call    $cdcd
ecc4 cdcdcd    call    $cdcd
ecc7 cdcdcd    call    $cdcd
ecca cdcdcd    call    $cdcd
eccd cdcdcd    call    $cdcd
ecd0 cdcdcd    call    $cdcd
ecd3 cdcdcd    call    $cdcd
ecd6 cdcdcd    call    $cdcd
ecd9 cdcdcd    call    $cdcd
ecdc cdcdcd    call    $cdcd
ecdf cdcdcd    call    $cdcd
ece2 cdcdcd    call    $cdcd
ece5 cdcdcd    call    $cdcd
ece8 cdcdcd    call    $cdcd
eceb cdcdcd    call    $cdcd
ecee cdcdcd    call    $cdcd
ecf1 cdcdcd    call    $cdcd
ecf4 cdcdcd    call    $cdcd
ecf7 cdcdcd    call    $cdcd
ecfa cdcdcd    call    $cdcd
ecfd cdcdcd    call    $cdcd
ed00 cdcdcd    call    $cdcd
ed03 cdcdcd    call    $cdcd
ed06 cdcdcd    call    $cdcd
ed09 cdcdcd    call    $cdcd
ed0c cdcdcd    call    $cdcd
ed0f cdcdcd    call    $cdcd
ed12 cdcdcd    call    $cdcd
ed15 cdcdcd    call    $cdcd
ed18 cdcdcd    call    $cdcd
ed1b cdcdcd    call    $cdcd
ed1e cdcdcd    call    $cdcd
ed21 cdcdcd    call    $cdcd
ed24 cdcdcd    call    $cdcd
ed27 cdcdcd    call    $cdcd
ed2a cdcdcd    call    $cdcd
ed2d cdcdcd    call    $cdcd
ed30 cdcdcd    call    $cdcd
ed33 cdcdcd    call    $cdcd
ed36 cdcdcd    call    $cdcd
ed39 cdcdcd    call    $cdcd
ed3c cdcdcd    call    $cdcd
ed3f cdcdcd    call    $cdcd
ed42 cdcdcd    call    $cdcd
ed45 cdcdcd    call    $cdcd
ed48 cdcdcd    call    $cdcd
ed4b cdcdcd    call    $cdcd
ed4e cdcdcd    call    $cdcd
ed51 cdcdcd    call    $cdcd
ed54 cdcdcd    call    $cdcd
ed57 cdcdcd    call    $cdcd
ed5a cdcdcd    call    $cdcd
ed5d cdcdcd    call    $cdcd
ed60 cdcdcd    call    $cdcd
ed63 cdcdcd    call    $cdcd
ed66 cdcdcd    call    $cdcd
ed69 cdcdcd    call    $cdcd
ed6c cdcdcd    call    $cdcd
ed6f cdcdcd    call    $cdcd
ed72 cdcdcd    call    $cdcd
ed75 cdcdcd    call    $cdcd
ed78 cdcdcd    call    $cdcd
ed7b cdcdcd    call    $cdcd
ed7e cdcdcd    call    $cdcd
ed81 cdcdcd    call    $cdcd
ed84 cdcdcd    call    $cdcd
ed87 cdcdcd    call    $cdcd
ed8a cdcdcd    call    $cdcd
ed8d cdcdcd    call    $cdcd
ed90 cdcdcd    call    $cdcd
ed93 cdcdcd    call    $cdcd
ed96 cdcdcd    call    $cdcd
ed99 cdcdcd    call    $cdcd
ed9c cdcdcd    call    $cdcd
ed9f cdcdcd    call    $cdcd
eda2 cdcdcd    call    $cdcd
eda5 cdcdcd    call    $cdcd
eda8 cdcdcd    call    $cdcd
edab cdcdcd    call    $cdcd
edae cdcdcd    call    $cdcd
edb1 cdcdcd    call    $cdcd
edb4 cdcdcd    call    $cdcd
edb7 cdcdcd    call    $cdcd
edba cdcdcd    call    $cdcd
edbd cdcdcd    call    $cdcd
edc0 cdcdcd    call    $cdcd
edc3 cdcdcd    call    $cdcd
edc6 cdcdcd    call    $cdcd
edc9 cdcdcd    call    $cdcd
edcc cdcdcd    call    $cdcd
edcf cdcdcd    call    $cdcd
edd2 cdcdcd    call    $cdcd
edd5 cdcdcd    call    $cdcd
edd8 cdcdcd    call    $cdcd
eddb cdcdcd    call    $cdcd
edde cdcdcd    call    $cdcd
ede1 cdcdcd    call    $cdcd
ede4 cdcdcd    call    $cdcd
ede7 cdcdcd    call    $cdcd
edea cdcdcd    call    $cdcd
eded cdcdcd    call    $cdcd
edf0 cdcdcd    call    $cdcd
edf3 cdcdcd    call    $cdcd
edf6 cdcdcd    call    $cdcd
edf9 cdcdcd    call    $cdcd
edfc cdcdcd    call    $cdcd
edff cdcdcd    call    $cdcd
ee02 cdcdcd    call    $cdcd
ee05 cdcdcd    call    $cdcd
ee08 cdcdcd    call    $cdcd
ee0b cdcdcd    call    $cdcd
ee0e cdcdcd    call    $cdcd
ee11 cdcdcd    call    $cdcd
ee14 cdcdcd    call    $cdcd
ee17 cdcdcd    call    $cdcd
ee1a cdcdcd    call    $cdcd
ee1d cdcdcd    call    $cdcd
ee20 cdcdcd    call    $cdcd
ee23 cdcdcd    call    $cdcd
ee26 cdcdcd    call    $cdcd
ee29 cdcdcd    call    $cdcd
ee2c cdcdcd    call    $cdcd
ee2f cdcdcd    call    $cdcd
ee32 cdcdcd    call    $cdcd
ee35 cdcdcd    call    $cdcd
ee38 cdcdcd    call    $cdcd
ee3b cdcdcd    call    $cdcd
ee3e cdcdcd    call    $cdcd
ee41 cdcdcd    call    $cdcd
ee44 cdcdcd    call    $cdcd
ee47 cdcdcd    call    $cdcd
ee4a cdcdcd    call    $cdcd
ee4d cdcdcd    call    $cdcd
ee50 cdcdcd    call    $cdcd
ee53 cdcdcd    call    $cdcd
ee56 cdcdcd    call    $cdcd
ee59 cdcdcd    call    $cdcd
ee5c cdcdcd    call    $cdcd
ee5f cdcdcd    call    $cdcd
ee62 cdcdcd    call    $cdcd
ee65 cdcdcd    call    $cdcd
ee68 cdcdcd    call    $cdcd
ee6b cdcdcd    call    $cdcd
ee6e cdcdcd    call    $cdcd
ee71 cdcdcd    call    $cdcd
ee74 cdcdcd    call    $cdcd
ee77 cdcdcd    call    $cdcd
ee7a cdcdcd    call    $cdcd
ee7d cdcdcd    call    $cdcd
ee80 cdcdcd    call    $cdcd
ee83 cdcdcd    call    $cdcd
ee86 cdcdcd    call    $cdcd
ee89 cdcdcd    call    $cdcd
ee8c cdcdcd    call    $cdcd
ee8f cdcdcd    call    $cdcd
ee92 cdcdcd    call    $cdcd
ee95 cdcdcd    call    $cdcd
ee98 cdcdcd    call    $cdcd
ee9b cdcdcd    call    $cdcd
ee9e cdcdcd    call    $cdcd
eea1 cdcdcd    call    $cdcd
eea4 cdcdcd    call    $cdcd
eea7 cdcdcd    call    $cdcd
eeaa cdcdcd    call    $cdcd
eead cdcdcd    call    $cdcd
eeb0 cdcdcd    call    $cdcd
eeb3 cdcdcd    call    $cdcd
eeb6 cdcdcd    call    $cdcd
eeb9 cdcdcd    call    $cdcd
eebc cdcdcd    call    $cdcd
eebf cdcdcd    call    $cdcd
eec2 cdcdcd    call    $cdcd
eec5 cdcdcd    call    $cdcd
eec8 cdcdcd    call    $cdcd
eecb cdcdcd    call    $cdcd
eece cdcdcd    call    $cdcd
eed1 cdcdcd    call    $cdcd
eed4 cdcdcd    call    $cdcd
eed7 cdcdcd    call    $cdcd
eeda cdcdcd    call    $cdcd
eedd cdcdcd    call    $cdcd
eee0 cdcdcd    call    $cdcd
eee3 cdcdcd    call    $cdcd
eee6 cdcdcd    call    $cdcd
eee9 cdcdcd    call    $cdcd
eeec cdcdcd    call    $cdcd
eeef cdcdcd    call    $cdcd
eef2 cdcdcd    call    $cdcd
eef5 cdcdcd    call    $cdcd
eef8 cdcdcd    call    $cdcd
eefb cdcdcd    call    $cdcd
eefe cdcdcd    call    $cdcd
ef01 cdcdcd    call    $cdcd
ef04 cdcdcd    call    $cdcd
ef07 cdcdcd    call    $cdcd
ef0a cdcdcd    call    $cdcd
ef0d cdcdcd    call    $cdcd
ef10 cdcdcd    call    $cdcd
ef13 cdcdcd    call    $cdcd
ef16 cdcdcd    call    $cdcd
ef19 cdcdcd    call    $cdcd
ef1c cdcdcd    call    $cdcd
ef1f cdcdcd    call    $cdcd
ef22 cdcdcd    call    $cdcd
ef25 cdcdcd    call    $cdcd
ef28 cdcdcd    call    $cdcd
ef2b cdcdcd    call    $cdcd
ef2e cdcdcd    call    $cdcd
ef31 cdcdcd    call    $cdcd
ef34 cdcdcd    call    $cdcd
ef37 cdcdcd    call    $cdcd
ef3a cdcdcd    call    $cdcd
ef3d cdcdcd    call    $cdcd
ef40 cdcdcd    call    $cdcd
ef43 cdcdcd    call    $cdcd
ef46 cdcdcd    call    $cdcd
ef49 cdcdcd    call    $cdcd
ef4c cdcdcd    call    $cdcd
ef4f cdcdcd    call    $cdcd
ef52 cdcdcd    call    $cdcd
ef55 cdcdcd    call    $cdcd
ef58 cdcdcd    call    $cdcd
ef5b cdcdcd    call    $cdcd
ef5e cdcdcd    call    $cdcd
ef61 cdcdcd    call    $cdcd
ef64 cdcdcd    call    $cdcd
ef67 cdcdcd    call    $cdcd
ef6a cdcdcd    call    $cdcd
ef6d cdcdcd    call    $cdcd
ef70 cdcdcd    call    $cdcd
ef73 cdcdcd    call    $cdcd
ef76 cdcdcd    call    $cdcd
ef79 cdcdcd    call    $cdcd
ef7c cdcdcd    call    $cdcd
ef7f cdcdcd    call    $cdcd
ef82 cdcdcd    call    $cdcd
ef85 cdcdcd    call    $cdcd
ef88 cdcdcd    call    $cdcd
ef8b cdcdcd    call    $cdcd
ef8e cdcdcd    call    $cdcd
ef91 cdcdcd    call    $cdcd
ef94 cdcdcd    call    $cdcd
ef97 cdcdcd    call    $cdcd
ef9a cdcdcd    call    $cdcd
ef9d cdcdcd    call    $cdcd
efa0 cdcdcd    call    $cdcd
efa3 cdcdcd    call    $cdcd
efa6 cdcdcd    call    $cdcd
efa9 cdcdcd    call    $cdcd
efac cdcdcd    call    $cdcd
efaf cdcdcd    call    $cdcd
efb2 cdcdcd    call    $cdcd
efb5 cdcdcd    call    $cdcd
efb8 cdcdcd    call    $cdcd
efbb cdcdcd    call    $cdcd
efbe cdcdcd    call    $cdcd
efc1 cdcdcd    call    $cdcd
efc4 cdcdcd    call    $cdcd
efc7 cdcdcd    call    $cdcd
efca cdcdcd    call    $cdcd
efcd cdcdcd    call    $cdcd
efd0 cdcdcd    call    $cdcd
efd3 cdcdcd    call    $cdcd
efd6 cdcdcd    call    $cdcd
efd9 cdcdcd    call    $cdcd
efdc cdcdcd    call    $cdcd
efdf cdcdcd    call    $cdcd
efe2 cdcdcd    call    $cdcd
efe5 cdcdcd    call    $cdcd
efe8 cdcdcd    call    $cdcd
efeb cdcdcd    call    $cdcd
efee cdcdcd    call    $cdcd
eff1 cdcdcd    call    $cdcd
eff4 cdcdcd    call    $cdcd
eff7 cdcdcd    call    $cdcd
effa cdcdcd    call    $cdcd
effd cdcdcd    call    $cdcd
f000 cdcdcd    call    $cdcd
f003 cdcdcd    call    $cdcd
f006 cdcdcd    call    $cdcd
f009 cdcdcd    call    $cdcd
f00c cdcdcd    call    $cdcd
f00f cdcdcd    call    $cdcd
f012 cdcdcd    call    $cdcd
f015 cdcdcd    call    $cdcd
f018 cdcdcd    call    $cdcd
f01b cdcdcd    call    $cdcd
f01e cdcdcd    call    $cdcd
f021 cdcdcd    call    $cdcd
f024 cdcdcd    call    $cdcd
f027 cdcdcd    call    $cdcd
f02a cdcdcd    call    $cdcd
f02d cdcdcd    call    $cdcd
f030 cdcdcd    call    $cdcd
f033 cdcdcd    call    $cdcd
f036 cdcdcd    call    $cdcd
f039 cdcdcd    call    $cdcd
f03c cdcdcd    call    $cdcd
f03f cdcdcd    call    $cdcd
f042 cdcdcd    call    $cdcd
f045 cdcdcd    call    $cdcd
f048 cdcdcd    call    $cdcd
f04b cdcdcd    call    $cdcd
f04e cdcdcd    call    $cdcd
f051 cdcdcd    call    $cdcd
f054 cdcdcd    call    $cdcd
f057 cdcdcd    call    $cdcd
f05a cdcdcd    call    $cdcd
f05d cdcdcd    call    $cdcd
f060 cdcdcd    call    $cdcd
f063 cdcdcd    call    $cdcd
f066 cdcdcd    call    $cdcd
f069 cdcdcd    call    $cdcd
f06c cdcdcd    call    $cdcd
f06f cdcdcd    call    $cdcd
f072 cdcdcd    call    $cdcd
f075 cdcdcd    call    $cdcd
f078 cdcdcd    call    $cdcd
f07b cdcdcd    call    $cdcd
f07e cdcdcd    call    $cdcd
f081 cdcdcd    call    $cdcd
f084 cdcdcd    call    $cdcd
f087 cdcdcd    call    $cdcd
f08a cdcdcd    call    $cdcd
f08d cdcdcd    call    $cdcd
f090 cdcdcd    call    $cdcd
f093 cdcdcd    call    $cdcd
f096 cdcdcd    call    $cdcd
f099 cdcdcd    call    $cdcd
f09c cdcdcd    call    $cdcd
f09f cdcdcd    call    $cdcd
f0a2 cdcdcd    call    $cdcd
f0a5 cdcdcd    call    $cdcd
f0a8 cdcdcd    call    $cdcd
f0ab cdcdcd    call    $cdcd
f0ae cdcdcd    call    $cdcd
f0b1 cdcdcd    call    $cdcd
f0b4 cdcdcd    call    $cdcd
f0b7 cdcdcd    call    $cdcd
f0ba cdcdcd    call    $cdcd
f0bd cdcdcd    call    $cdcd
f0c0 cdcdcd    call    $cdcd
f0c3 cdcdcd    call    $cdcd
f0c6 cdcdcd    call    $cdcd
f0c9 cdcdcd    call    $cdcd
f0cc cdcdcd    call    $cdcd
f0cf cdcdcd    call    $cdcd
f0d2 cdcdcd    call    $cdcd
f0d5 cdcdcd    call    $cdcd
f0d8 cdcdcd    call    $cdcd
f0db cdcdcd    call    $cdcd
f0de cdcdcd    call    $cdcd
f0e1 cdcdcd    call    $cdcd
f0e4 cdcdcd    call    $cdcd
f0e7 cdcdcd    call    $cdcd
f0ea cdcdcd    call    $cdcd
f0ed cdcdcd    call    $cdcd
f0f0 cdcdcd    call    $cdcd
f0f3 cdcdcd    call    $cdcd
f0f6 cdcdcd    call    $cdcd
f0f9 cdcdcd    call    $cdcd
f0fc cdcdcd    call    $cdcd
f0ff cdcdcd    call    $cdcd
f102 cdcdcd    call    $cdcd
f105 cdcdcd    call    $cdcd
f108 cdcdcd    call    $cdcd
f10b cdcdcd    call    $cdcd
f10e cdcdcd    call    $cdcd
f111 cdcdcd    call    $cdcd
f114 cdcdcd    call    $cdcd
f117 cdcdcd    call    $cdcd
f11a cdcdcd    call    $cdcd
f11d cdcdcd    call    $cdcd
f120 cdcdcd    call    $cdcd
f123 cdcdcd    call    $cdcd
f126 cdcdcd    call    $cdcd
f129 cdcdcd    call    $cdcd
f12c cdcdcd    call    $cdcd
f12f cdcdcd    call    $cdcd
f132 cdcdcd    call    $cdcd
f135 cdcdcd    call    $cdcd
f138 cdcdcd    call    $cdcd
f13b cdcdcd    call    $cdcd
f13e cdcdcd    call    $cdcd
f141 cdcdcd    call    $cdcd
f144 cdcdcd    call    $cdcd
f147 cdcdcd    call    $cdcd
f14a cdcdcd    call    $cdcd
f14d cdcdcd    call    $cdcd
f150 cdcdcd    call    $cdcd
f153 cdcdcd    call    $cdcd
f156 cdcdcd    call    $cdcd
f159 cdcdcd    call    $cdcd
f15c cdcdcd    call    $cdcd
f15f cdcdcd    call    $cdcd
f162 cdcdcd    call    $cdcd
f165 cdcdcd    call    $cdcd
f168 cdcdcd    call    $cdcd
f16b cdcdcd    call    $cdcd
f16e cdcdcd    call    $cdcd
f171 cdcdcd    call    $cdcd
f174 cdcdcd    call    $cdcd
f177 cdcdcd    call    $cdcd
f17a cdcdcd    call    $cdcd
f17d cdcdcd    call    $cdcd
f180 cdcdcd    call    $cdcd
f183 cdcdcd    call    $cdcd
f186 cdcdcd    call    $cdcd
f189 cdcdcd    call    $cdcd
f18c cdcdcd    call    $cdcd
f18f cdcdcd    call    $cdcd
f192 cdcdcd    call    $cdcd
f195 cdcdcd    call    $cdcd
f198 cdcdcd    call    $cdcd
f19b cdcdcd    call    $cdcd
f19e cdcdcd    call    $cdcd
f1a1 cdcdcd    call    $cdcd
f1a4 cdcdcd    call    $cdcd
f1a7 cdcdcd    call    $cdcd
f1aa cdcdcd    call    $cdcd
f1ad cdcdcd    call    $cdcd
f1b0 cdcdcd    call    $cdcd
f1b3 cdcdcd    call    $cdcd
f1b6 cdcdcd    call    $cdcd
f1b9 cdcdcd    call    $cdcd
f1bc cdcdcd    call    $cdcd
f1bf cdcdcd    call    $cdcd
f1c2 cdcdcd    call    $cdcd
f1c5 cdcdcd    call    $cdcd
f1c8 cdcdcd    call    $cdcd
f1cb cdcdcd    call    $cdcd
f1ce cdcdcd    call    $cdcd
f1d1 cdcdcd    call    $cdcd
f1d4 cdcdcd    call    $cdcd
f1d7 cdcdcd    call    $cdcd
f1da cdcdcd    call    $cdcd
f1dd cdcdcd    call    $cdcd
f1e0 cdcdcd    call    $cdcd
f1e3 cdcdcd    call    $cdcd
f1e6 cdcdcd    call    $cdcd
f1e9 cdcdcd    call    $cdcd
f1ec cdcdcd    call    $cdcd
f1ef cdcdcd    call    $cdcd
f1f2 cdcdcd    call    $cdcd
f1f5 cdcdcd    call    $cdcd
f1f8 cdcdcd    call    $cdcd
f1fb cdcdcd    call    $cdcd
f1fe cdcdcd    call    $cdcd
f201 cdcdcd    call    $cdcd
f204 cdcdcd    call    $cdcd
f207 cdcdcd    call    $cdcd
f20a cdcdcd    call    $cdcd
f20d cdcdcd    call    $cdcd
f210 cdcdcd    call    $cdcd
f213 cdcdcd    call    $cdcd
f216 cdcdcd    call    $cdcd
f219 cdcdcd    call    $cdcd
f21c cdcdcd    call    $cdcd
f21f cdcdcd    call    $cdcd
f222 cdcdcd    call    $cdcd
f225 cdcdcd    call    $cdcd
f228 cdcdcd    call    $cdcd
f22b cdcdcd    call    $cdcd
f22e cdcdcd    call    $cdcd
f231 cdcdcd    call    $cdcd
f234 cdcdcd    call    $cdcd
f237 cdcdcd    call    $cdcd
f23a cdcdcd    call    $cdcd
f23d cdcdcd    call    $cdcd
f240 cdcdcd    call    $cdcd
f243 cdcdcd    call    $cdcd
f246 cdcdcd    call    $cdcd
f249 cdcdcd    call    $cdcd
f24c cdcdcd    call    $cdcd
f24f cdcdcd    call    $cdcd
f252 cdcdcd    call    $cdcd
f255 cdcdcd    call    $cdcd
f258 cdcdcd    call    $cdcd
f25b cdcdcd    call    $cdcd
f25e cdcdcd    call    $cdcd
f261 cdcdcd    call    $cdcd
f264 cdcdcd    call    $cdcd
f267 cdcdcd    call    $cdcd
f26a cdcdcd    call    $cdcd
f26d cdcdcd    call    $cdcd
f270 cdcdcd    call    $cdcd
f273 cdcdcd    call    $cdcd
f276 cdcdcd    call    $cdcd
f279 cdcdcd    call    $cdcd
f27c cdcdcd    call    $cdcd
f27f cdcdcd    call    $cdcd
f282 cdcdcd    call    $cdcd
f285 cdcdcd    call    $cdcd
f288 cdcdcd    call    $cdcd
f28b cdcdcd    call    $cdcd
f28e cdcdcd    call    $cdcd
f291 cdcdcd    call    $cdcd
f294 cdcdcd    call    $cdcd
f297 cdcdcd    call    $cdcd
f29a cdcdcd    call    $cdcd
f29d cdcdcd    call    $cdcd
f2a0 cdcdcd    call    $cdcd
f2a3 cdcdcd    call    $cdcd
f2a6 cdcdcd    call    $cdcd
f2a9 cdcdcd    call    $cdcd
f2ac cdcdcd    call    $cdcd
f2af cdcdcd    call    $cdcd
f2b2 cdcdcd    call    $cdcd
f2b5 cdcdcd    call    $cdcd
f2b8 cdcdcd    call    $cdcd
f2bb cdcdcd    call    $cdcd
f2be cdcdcd    call    $cdcd
f2c1 cdcdcd    call    $cdcd
f2c4 cdcdcd    call    $cdcd
f2c7 cdcdcd    call    $cdcd
f2ca cdcdcd    call    $cdcd
f2cd cdcdcd    call    $cdcd
f2d0 cdcdcd    call    $cdcd
f2d3 cdcdcd    call    $cdcd
f2d6 cdcdcd    call    $cdcd
f2d9 cdcdcd    call    $cdcd
f2dc cdcdcd    call    $cdcd
f2df cdcdcd    call    $cdcd
f2e2 cdcdcd    call    $cdcd
f2e5 cdcdcd    call    $cdcd
f2e8 cdcdcd    call    $cdcd
f2eb cdcdcd    call    $cdcd
f2ee cdcdcd    call    $cdcd
f2f1 cdcdcd    call    $cdcd
f2f4 cdcdcd    call    $cdcd
f2f7 cdcdcd    call    $cdcd
f2fa cdcdcd    call    $cdcd
f2fd cdcdcd    call    $cdcd
f300 cdcdcd    call    $cdcd
f303 cdcdcd    call    $cdcd
f306 cdcdcd    call    $cdcd
f309 cdcdcd    call    $cdcd
f30c cdcdcd    call    $cdcd
f30f cdcdcd    call    $cdcd
f312 cdcdcd    call    $cdcd
f315 cdcdcd    call    $cdcd
f318 cdcdcd    call    $cdcd
f31b cdcdcd    call    $cdcd
f31e cdcdcd    call    $cdcd
f321 cdcdcd    call    $cdcd
f324 cdcdcd    call    $cdcd
f327 cdcdcd    call    $cdcd
f32a cdcdcd    call    $cdcd
f32d cdcdcd    call    $cdcd
f330 cdcdcd    call    $cdcd
f333 cdcdcd    call    $cdcd
f336 cdcdcd    call    $cdcd
f339 cdcdcd    call    $cdcd
f33c cdcdcd    call    $cdcd
f33f cdcdcd    call    $cdcd
f342 cdcdcd    call    $cdcd
f345 cdcdcd    call    $cdcd
f348 cdcdcd    call    $cdcd
f34b cdcdcd    call    $cdcd
f34e cdcdcd    call    $cdcd
f351 cdcdcd    call    $cdcd
f354 cdcdcd    call    $cdcd
f357 cdcdcd    call    $cdcd
f35a cdcdcd    call    $cdcd
f35d cdcdcd    call    $cdcd
f360 cdcdcd    call    $cdcd
f363 cdcdcd    call    $cdcd
f366 cdcdcd    call    $cdcd
f369 cdcdcd    call    $cdcd
f36c cdcdcd    call    $cdcd
f36f cdcdcd    call    $cdcd
f372 cdcdcd    call    $cdcd
f375 cdcdcd    call    $cdcd
f378 cdcdcd    call    $cdcd
f37b cdcdcd    call    $cdcd
f37e cdcdcd    call    $cdcd
f381 cdcdcd    call    $cdcd
f384 cdcdcd    call    $cdcd
f387 cdcdcd    call    $cdcd
f38a cdcdcd    call    $cdcd
f38d cdcdcd    call    $cdcd
f390 cdcdcd    call    $cdcd
f393 cdcdcd    call    $cdcd
f396 cdcdcd    call    $cdcd
f399 cdcdcd    call    $cdcd
f39c cdcdcd    call    $cdcd
f39f cdcdcd    call    $cdcd
f3a2 cdcdcd    call    $cdcd
f3a5 cdcdcd    call    $cdcd
f3a8 cdcdcd    call    $cdcd
f3ab cdcdcd    call    $cdcd
f3ae cdcdcd    call    $cdcd
f3b1 cdcdcd    call    $cdcd
f3b4 cdcdcd    call    $cdcd
f3b7 cdcdcd    call    $cdcd
f3ba cdcdcd    call    $cdcd
f3bd cdcdcd    call    $cdcd
f3c0 cdcdcd    call    $cdcd
f3c3 cdcdcd    call    $cdcd
f3c6 cdcdcd    call    $cdcd
f3c9 cdcdcd    call    $cdcd
f3cc cdcdcd    call    $cdcd
f3cf cdcdcd    call    $cdcd
f3d2 cdcdcd    call    $cdcd
f3d5 cdcdcd    call    $cdcd
f3d8 cdcdcd    call    $cdcd
f3db cdcdcd    call    $cdcd
f3de cdcdcd    call    $cdcd
f3e1 cdcdcd    call    $cdcd
f3e4 cdcdcd    call    $cdcd
f3e7 cdcdcd    call    $cdcd
f3ea cdcdcd    call    $cdcd
f3ed cdcdcd    call    $cdcd
f3f0 cdcdcd    call    $cdcd
f3f3 cdcdcd    call    $cdcd
f3f6 cdcdcd    call    $cdcd
f3f9 cdcdcd    call    $cdcd
f3fc cdcdcd    call    $cdcd
f3ff cdcdcd    call    $cdcd
f402 cdcdcd    call    $cdcd
f405 cdcdcd    call    $cdcd
f408 cdcdcd    call    $cdcd
f40b cdcdcd    call    $cdcd
f40e cdcdcd    call    $cdcd
f411 cdcdcd    call    $cdcd
f414 cdcdcd    call    $cdcd
f417 cdcdcd    call    $cdcd
f41a cdcdcd    call    $cdcd
f41d cdcdcd    call    $cdcd
f420 cdcdcd    call    $cdcd
f423 cdcdcd    call    $cdcd
f426 cdcdcd    call    $cdcd
f429 cdcdcd    call    $cdcd
f42c cdcdcd    call    $cdcd
f42f cdcdcd    call    $cdcd
f432 cdcdcd    call    $cdcd
f435 cdcdcd    call    $cdcd
f438 cdcdcd    call    $cdcd
f43b cdcdcd    call    $cdcd
f43e cdcdcd    call    $cdcd
f441 cdcdcd    call    $cdcd
f444 cdcdcd    call    $cdcd
f447 cdcdcd    call    $cdcd
f44a cdcdcd    call    $cdcd
f44d cdcdcd    call    $cdcd
f450 cdcdcd    call    $cdcd
f453 cdcdcd    call    $cdcd
f456 cdcdcd    call    $cdcd
f459 cdcdcd    call    $cdcd
f45c cdcdcd    call    $cdcd
f45f cdcdcd    call    $cdcd
f462 cdcdcd    call    $cdcd
f465 cdcdcd    call    $cdcd
f468 cdcdcd    call    $cdcd
f46b cdcdcd    call    $cdcd
f46e cdcdcd    call    $cdcd
f471 cdcdcd    call    $cdcd
f474 cdcdcd    call    $cdcd
f477 cdcdcd    call    $cdcd
f47a cdcdcd    call    $cdcd
f47d cdcdcd    call    $cdcd
f480 cdcdcd    call    $cdcd
f483 cdcdcd    call    $cdcd
f486 cdcdcd    call    $cdcd
f489 cdcdcd    call    $cdcd
f48c cdcdcd    call    $cdcd
f48f cdcdcd    call    $cdcd
f492 cdcdcd    call    $cdcd
f495 cdcdcd    call    $cdcd
f498 cdcdcd    call    $cdcd
f49b cdcdcd    call    $cdcd
f49e cdcdcd    call    $cdcd
f4a1 cdcdcd    call    $cdcd
f4a4 cdcdcd    call    $cdcd
f4a7 cdcdcd    call    $cdcd
f4aa cdcdcd    call    $cdcd
f4ad cdcdcd    call    $cdcd
f4b0 cdcdcd    call    $cdcd
f4b3 cdcdcd    call    $cdcd
f4b6 cdcdcd    call    $cdcd
f4b9 cdcdcd    call    $cdcd
f4bc cdcdcd    call    $cdcd
f4bf cdcdcd    call    $cdcd
f4c2 cdcdcd    call    $cdcd
f4c5 cdcdcd    call    $cdcd
f4c8 cdcdcd    call    $cdcd
f4cb cdcdcd    call    $cdcd
f4ce cdcdcd    call    $cdcd
f4d1 cdcdcd    call    $cdcd
f4d4 cdcdcd    call    $cdcd
f4d7 cdcdcd    call    $cdcd
f4da cdcdcd    call    $cdcd
f4dd cdcdcd    call    $cdcd
f4e0 cdcdcd    call    $cdcd
f4e3 cdcdcd    call    $cdcd
f4e6 cdcdcd    call    $cdcd
f4e9 cdcdcd    call    $cdcd
f4ec cdcdcd    call    $cdcd
f4ef cdcdcd    call    $cdcd
f4f2 cdcdcd    call    $cdcd
f4f5 cdcdcd    call    $cdcd
f4f8 cdcdcd    call    $cdcd
f4fb cdcdcd    call    $cdcd
f4fe cdcdcd    call    $cdcd
f501 cdcdcd    call    $cdcd
f504 cdcdcd    call    $cdcd
f507 cdcdcd    call    $cdcd
f50a cdcdcd    call    $cdcd
f50d cdcdcd    call    $cdcd
f510 cdcdcd    call    $cdcd
f513 cdcdcd    call    $cdcd
f516 cdcdcd    call    $cdcd
f519 cdcdcd    call    $cdcd
f51c cdcdcd    call    $cdcd
f51f cdcdcd    call    $cdcd
f522 cdcdcd    call    $cdcd
f525 cdcdcd    call    $cdcd
f528 cdcdcd    call    $cdcd
f52b cdcdcd    call    $cdcd
f52e cdcdcd    call    $cdcd
f531 cdcdcd    call    $cdcd
f534 cdcdcd    call    $cdcd
f537 cdcdcd    call    $cdcd
f53a cdcdcd    call    $cdcd
f53d cdcdcd    call    $cdcd
f540 cdcdcd    call    $cdcd
f543 cdcdcd    call    $cdcd
f546 cdcdcd    call    $cdcd
f549 cdcdcd    call    $cdcd
f54c cdcdcd    call    $cdcd
f54f cdcdcd    call    $cdcd
f552 cdcdcd    call    $cdcd
f555 cdcdcd    call    $cdcd
f558 cdcdcd    call    $cdcd
f55b cdcdcd    call    $cdcd
f55e cdcdcd    call    $cdcd
f561 cdcdcd    call    $cdcd
f564 cdcdcd    call    $cdcd
f567 cdcdcd    call    $cdcd
f56a cdcdcd    call    $cdcd
f56d cdcdcd    call    $cdcd
f570 cdcdcd    call    $cdcd
f573 cdcdcd    call    $cdcd
f576 cdcdcd    call    $cdcd
f579 cdcdcd    call    $cdcd
f57c cdcdcd    call    $cdcd
f57f cdcdcd    call    $cdcd
f582 cdcdcd    call    $cdcd
f585 cdcdcd    call    $cdcd
f588 cdcdcd    call    $cdcd
f58b cdcdcd    call    $cdcd
f58e cdcdcd    call    $cdcd
f591 cdcdcd    call    $cdcd
f594 cdcdcd    call    $cdcd
f597 cdcdcd    call    $cdcd
f59a cdcdcd    call    $cdcd
f59d cdcdcd    call    $cdcd
f5a0 cdcdcd    call    $cdcd
f5a3 cdcdcd    call    $cdcd
f5a6 cdcdcd    call    $cdcd
f5a9 cdcdcd    call    $cdcd
f5ac cdcdcd    call    $cdcd
f5af cdcdcd    call    $cdcd
f5b2 cdcdcd    call    $cdcd
f5b5 cdcdcd    call    $cdcd
f5b8 cdcdcd    call    $cdcd
f5bb cdcdcd    call    $cdcd
f5be cdcdcd    call    $cdcd
f5c1 cdcdcd    call    $cdcd
f5c4 cdcdcd    call    $cdcd
f5c7 cdcdcd    call    $cdcd
f5ca cdcdcd    call    $cdcd
f5cd cdcdcd    call    $cdcd
f5d0 cdcdcd    call    $cdcd
f5d3 cdcdcd    call    $cdcd
f5d6 cdcdcd    call    $cdcd
f5d9 cdcdcd    call    $cdcd
f5dc cdcdcd    call    $cdcd
f5df cdcdcd    call    $cdcd
f5e2 cdcdcd    call    $cdcd
f5e5 cdcdcd    call    $cdcd
f5e8 cdcdcd    call    $cdcd
f5eb cdcdcd    call    $cdcd
f5ee cdcdcd    call    $cdcd
f5f1 cdcdcd    call    $cdcd
f5f4 cdcdcd    call    $cdcd
f5f7 cdcdcd    call    $cdcd
f5fa cdcdcd    call    $cdcd
f5fd cdcdcd    call    $cdcd
f600 cdcdcd    call    $cdcd
f603 cdcdcd    call    $cdcd
f606 cdcdcd    call    $cdcd
f609 cdcdcd    call    $cdcd
f60c cdcdcd    call    $cdcd
f60f cdcdcd    call    $cdcd
f612 cdcdcd    call    $cdcd
f615 cdcdcd    call    $cdcd
f618 cdcdcd    call    $cdcd
f61b cdcdcd    call    $cdcd
f61e cdcdcd    call    $cdcd
f621 cdcdcd    call    $cdcd
f624 cdcdcd    call    $cdcd
f627 cdcdcd    call    $cdcd
f62a cdcdcd    call    $cdcd
f62d cdcdcd    call    $cdcd
f630 cdcdcd    call    $cdcd
f633 cdcdcd    call    $cdcd
f636 cdcdcd    call    $cdcd
f639 cdcdcd    call    $cdcd
f63c cdcdcd    call    $cdcd
f63f cdcdcd    call    $cdcd
f642 cdcdcd    call    $cdcd
f645 cdcdcd    call    $cdcd
f648 cdcdcd    call    $cdcd
f64b cdcdcd    call    $cdcd
f64e cdcdcd    call    $cdcd
f651 cdcdcd    call    $cdcd
f654 cdcdcd    call    $cdcd
f657 cdcdcd    call    $cdcd
f65a cdcdcd    call    $cdcd
f65d cdcdcd    call    $cdcd
f660 cdcdcd    call    $cdcd
f663 cdcdcd    call    $cdcd
f666 cdcdcd    call    $cdcd
f669 cdcdcd    call    $cdcd
f66c cdcdcd    call    $cdcd
f66f cdcdcd    call    $cdcd
f672 cdcdcd    call    $cdcd
f675 cdcdcd    call    $cdcd
f678 cdcdcd    call    $cdcd
f67b cdcdcd    call    $cdcd
f67e cdcdcd    call    $cdcd
f681 cdcdcd    call    $cdcd
f684 cdcdcd    call    $cdcd
f687 cdcdcd    call    $cdcd
f68a cdcdcd    call    $cdcd
f68d cdcdcd    call    $cdcd
f690 cdcdcd    call    $cdcd
f693 cdcdcd    call    $cdcd
f696 cdcdcd    call    $cdcd
f699 cdcdcd    call    $cdcd
f69c cdcdcd    call    $cdcd
f69f cdcdcd    call    $cdcd
f6a2 cdcdcd    call    $cdcd
f6a5 cdcdcd    call    $cdcd
f6a8 cdcdcd    call    $cdcd
f6ab cdcdcd    call    $cdcd
f6ae cdcdcd    call    $cdcd
f6b1 cdcdcd    call    $cdcd
f6b4 cdcdcd    call    $cdcd
f6b7 cdcdcd    call    $cdcd
f6ba cdcdcd    call    $cdcd
f6bd cdcdcd    call    $cdcd
f6c0 cdcdcd    call    $cdcd
f6c3 cdcdcd    call    $cdcd
f6c6 cdcdcd    call    $cdcd
f6c9 cdcdcd    call    $cdcd
f6cc cdcdcd    call    $cdcd
f6cf cdcdcd    call    $cdcd
f6d2 cdcdcd    call    $cdcd
f6d5 cdcdcd    call    $cdcd
f6d8 cdcdcd    call    $cdcd
f6db cdcdcd    call    $cdcd
f6de cdcdcd    call    $cdcd
f6e1 cdcdcd    call    $cdcd
f6e4 cdcdcd    call    $cdcd
f6e7 cdcdcd    call    $cdcd
f6ea cdcdcd    call    $cdcd
f6ed cdcdcd    call    $cdcd
f6f0 cdcdcd    call    $cdcd
f6f3 cdcdcd    call    $cdcd
f6f6 cdcdcd    call    $cdcd
f6f9 cdcdcd    call    $cdcd
f6fc cdcdcd    call    $cdcd
f6ff cdcdcd    call    $cdcd
f702 cdcdcd    call    $cdcd
f705 cdcdcd    call    $cdcd
f708 cdcdcd    call    $cdcd
f70b cdcdcd    call    $cdcd
f70e cdcdcd    call    $cdcd
f711 cdcdcd    call    $cdcd
f714 cdcdcd    call    $cdcd
f717 cdcdcd    call    $cdcd
f71a cdcdcd    call    $cdcd
f71d cdcdcd    call    $cdcd
f720 cdcdcd    call    $cdcd
f723 cdcdcd    call    $cdcd
f726 cdcdcd    call    $cdcd
f729 cdcdcd    call    $cdcd
f72c cdcdcd    call    $cdcd
f72f cdcdcd    call    $cdcd
f732 cdcdcd    call    $cdcd
f735 cdcdcd    call    $cdcd
f738 cdcdcd    call    $cdcd
f73b cdcdcd    call    $cdcd
f73e cdcdcd    call    $cdcd
f741 cdcdcd    call    $cdcd
f744 cdcdcd    call    $cdcd
f747 cdcdcd    call    $cdcd
f74a cdcdcd    call    $cdcd
f74d cdcdcd    call    $cdcd
f750 cdcdcd    call    $cdcd
f753 cdcdcd    call    $cdcd
f756 cdcdcd    call    $cdcd
f759 cdcdcd    call    $cdcd
f75c cdcdcd    call    $cdcd
f75f cdcdcd    call    $cdcd
f762 cdcdcd    call    $cdcd
f765 cdcdcd    call    $cdcd
f768 cdcdcd    call    $cdcd
f76b cdcdcd    call    $cdcd
f76e cdcdcd    call    $cdcd
f771 cdcdcd    call    $cdcd
f774 cdcdcd    call    $cdcd
f777 cdcdcd    call    $cdcd
f77a cdcdcd    call    $cdcd
f77d cdcdcd    call    $cdcd
f780 cdcdcd    call    $cdcd
f783 cdcdcd    call    $cdcd
f786 cdcdcd    call    $cdcd
f789 cdcdcd    call    $cdcd
f78c cdcdcd    call    $cdcd
f78f cdcdcd    call    $cdcd
f792 cdcdcd    call    $cdcd
f795 cdcdcd    call    $cdcd
f798 cdcdcd    call    $cdcd
f79b cdcdcd    call    $cdcd
f79e cdcdcd    call    $cdcd
f7a1 cdcdcd    call    $cdcd
f7a4 cdcdcd    call    $cdcd
f7a7 cdcdcd    call    $cdcd
f7aa cdcdcd    call    $cdcd
f7ad cdcdcd    call    $cdcd
f7b0 cdcdcd    call    $cdcd
f7b3 cdcdcd    call    $cdcd
f7b6 cdcdcd    call    $cdcd
f7b9 cdcdcd    call    $cdcd
f7bc cdcdcd    call    $cdcd
f7bf cdcdcd    call    $cdcd
f7c2 cdcdcd    call    $cdcd
f7c5 cdcdcd    call    $cdcd
f7c8 cdcdcd    call    $cdcd
f7cb cdcdcd    call    $cdcd
f7ce cdcdcd    call    $cdcd
f7d1 cdcdcd    call    $cdcd
f7d4 cdcdcd    call    $cdcd
f7d7 cdcdcd    call    $cdcd
f7da cdcdcd    call    $cdcd
f7dd cdcdcd    call    $cdcd
f7e0 cdcdcd    call    $cdcd
f7e3 cdcdcd    call    $cdcd
f7e6 cdcdcd    call    $cdcd
f7e9 cdcdcd    call    $cdcd
f7ec cdcdcd    call    $cdcd
f7ef cdcdcd    call    $cdcd
f7f2 cdcdcd    call    $cdcd
f7f5 cdcdcd    call    $cdcd
f7f8 cdcdcd    call    $cdcd
f7fb cdcdcd    call    $cdcd
f7fe cdcdcd    call    $cdcd
f801 cdcdcd    call    $cdcd
f804 cdcdcd    call    $cdcd
f807 cdcdcd    call    $cdcd
f80a cdcdcd    call    $cdcd
f80d cdcdcd    call    $cdcd
f810 cdcdcd    call    $cdcd
f813 cdcdcd    call    $cdcd
f816 cdcdcd    call    $cdcd
f819 cdcdcd    call    $cdcd
f81c cdcdcd    call    $cdcd
f81f cdcdcd    call    $cdcd
f822 cdcdcd    call    $cdcd
f825 cdcdcd    call    $cdcd
f828 cdcdcd    call    $cdcd
f82b cdcdcd    call    $cdcd
f82e cdcdcd    call    $cdcd
f831 cdcdcd    call    $cdcd
f834 cdcdcd    call    $cdcd
f837 cdcdcd    call    $cdcd
f83a cdcdcd    call    $cdcd
f83d cdcdcd    call    $cdcd
f840 cdcdcd    call    $cdcd
f843 cdcdcd    call    $cdcd
f846 cdcdcd    call    $cdcd
f849 cdcdcd    call    $cdcd
f84c cdcdcd    call    $cdcd
f84f cdcdcd    call    $cdcd
f852 cdcdcd    call    $cdcd
f855 cdcdcd    call    $cdcd
f858 cdcdcd    call    $cdcd
f85b cdcdcd    call    $cdcd
f85e cdcdcd    call    $cdcd
f861 cdcdcd    call    $cdcd
f864 cdcdcd    call    $cdcd
f867 cdcdcd    call    $cdcd
f86a cdcdcd    call    $cdcd
f86d cdcdcd    call    $cdcd
f870 cdcdcd    call    $cdcd
f873 cdcdcd    call    $cdcd
f876 cdcdcd    call    $cdcd
f879 cdcdcd    call    $cdcd
f87c cdcdcd    call    $cdcd
f87f cdcdcd    call    $cdcd
f882 cdcdcd    call    $cdcd
f885 cdcdcd    call    $cdcd
f888 cdcdcd    call    $cdcd
f88b cdcdcd    call    $cdcd
f88e cdcdcd    call    $cdcd
f891 cdcdcd    call    $cdcd
f894 cdcdcd    call    $cdcd
f897 cdcdcd    call    $cdcd
f89a cdcdcd    call    $cdcd
f89d cdcdcd    call    $cdcd
f8a0 cdcdcd    call    $cdcd
f8a3 cdcdcd    call    $cdcd
f8a6 cdcdcd    call    $cdcd
f8a9 cdcdcd    call    $cdcd
f8ac cdcdcd    call    $cdcd
f8af cdcdcd    call    $cdcd
f8b2 cdcdcd    call    $cdcd
f8b5 cdcdcd    call    $cdcd
f8b8 cdcdcd    call    $cdcd
f8bb cdcdcd    call    $cdcd
f8be cdcdcd    call    $cdcd
f8c1 cdcdcd    call    $cdcd
f8c4 cdcdcd    call    $cdcd
f8c7 cdcdcd    call    $cdcd
f8ca cdcdcd    call    $cdcd
f8cd cdcdcd    call    $cdcd
f8d0 cdcdcd    call    $cdcd
f8d3 cdcdcd    call    $cdcd
f8d6 cdcdcd    call    $cdcd
f8d9 cdcdcd    call    $cdcd
f8dc cdcdcd    call    $cdcd
f8df cdcdcd    call    $cdcd
f8e2 cdcdcd    call    $cdcd
f8e5 cdcdcd    call    $cdcd
f8e8 cdcdcd    call    $cdcd
f8eb cdcdcd    call    $cdcd
f8ee cdcdcd    call    $cdcd
f8f1 cdcdcd    call    $cdcd
f8f4 cdcdcd    call    $cdcd
f8f7 cdcdcd    call    $cdcd
f8fa cdcdcd    call    $cdcd
f8fd cdcdcd    call    $cdcd
f900 cdcdcd    call    $cdcd
f903 cdcdcd    call    $cdcd
f906 cdcdcd    call    $cdcd
f909 cdcdcd    call    $cdcd
f90c cdcdcd    call    $cdcd
f90f cdcdcd    call    $cdcd
f912 cdcdcd    call    $cdcd
f915 cdcdcd    call    $cdcd
f918 cdcdcd    call    $cdcd
f91b cdcdcd    call    $cdcd
f91e cdcdcd    call    $cdcd
f921 cdcdcd    call    $cdcd
f924 cdcdcd    call    $cdcd
f927 cdcdcd    call    $cdcd
f92a cdcdcd    call    $cdcd
f92d cdcdcd    call    $cdcd
f930 cdcdcd    call    $cdcd
f933 cdcdcd    call    $cdcd
f936 cdcdcd    call    $cdcd
f939 cdcdcd    call    $cdcd
f93c cdcdcd    call    $cdcd
f93f cdcdcd    call    $cdcd
f942 cdcdcd    call    $cdcd
f945 cdcdcd    call    $cdcd
f948 cdcdcd    call    $cdcd
f94b cdcdcd    call    $cdcd
f94e cdcdcd    call    $cdcd
f951 cdcdcd    call    $cdcd
f954 cdcdcd    call    $cdcd
f957 cdcdcd    call    $cdcd
f95a cdcdcd    call    $cdcd
f95d cdcdcd    call    $cdcd
f960 cdcdcd    call    $cdcd
f963 cdcdcd    call    $cdcd
f966 cdcdcd    call    $cdcd
f969 cdcdcd    call    $cdcd
f96c cdcdcd    call    $cdcd
f96f cdcdcd    call    $cdcd
f972 cdcdcd    call    $cdcd
f975 cdcdcd    call    $cdcd
f978 cdcdcd    call    $cdcd
f97b cdcdcd    call    $cdcd
f97e cdcdcd    call    $cdcd
f981 cdcdcd    call    $cdcd
f984 cdcdcd    call    $cdcd
f987 cdcdcd    call    $cdcd
f98a cdcdcd    call    $cdcd
f98d cdcdcd    call    $cdcd
f990 cdcdcd    call    $cdcd
f993 cdcdcd    call    $cdcd
f996 cdcdcd    call    $cdcd
f999 cdcdcd    call    $cdcd
f99c cdcdcd    call    $cdcd
f99f cdcdcd    call    $cdcd
f9a2 cdcdcd    call    $cdcd
f9a5 cdcdcd    call    $cdcd
f9a8 cdcdcd    call    $cdcd
f9ab cdcdcd    call    $cdcd
f9ae cdcdcd    call    $cdcd
f9b1 cdcdcd    call    $cdcd
f9b4 cdcdcd    call    $cdcd
f9b7 cdcdcd    call    $cdcd
f9ba cdcdcd    call    $cdcd
f9bd cdcdcd    call    $cdcd
f9c0 cdcdcd    call    $cdcd
f9c3 cdcdcd    call    $cdcd
f9c6 cdcdcd    call    $cdcd
f9c9 cdcdcd    call    $cdcd
f9cc cdcdcd    call    $cdcd
f9cf cdcdcd    call    $cdcd
f9d2 cdcdcd    call    $cdcd
f9d5 cdcdcd    call    $cdcd
f9d8 cdcdcd    call    $cdcd
f9db cdcdcd    call    $cdcd
f9de cdcdcd    call    $cdcd
f9e1 cdcdcd    call    $cdcd
f9e4 cdcdcd    call    $cdcd
f9e7 cdcdcd    call    $cdcd
f9ea cdcdcd    call    $cdcd
f9ed cdcdcd    call    $cdcd
f9f0 cdcdcd    call    $cdcd
f9f3 cdcdcd    call    $cdcd
f9f6 cdcdcd    call    $cdcd
f9f9 cdcdcd    call    $cdcd
f9fc cdcdcd    call    $cdcd
f9ff cdcdcd    call    $cdcd
fa02 cdcdcd    call    $cdcd
fa05 cdcdcd    call    $cdcd
fa08 cdcdcd    call    $cdcd
fa0b cdcdcd    call    $cdcd
fa0e cdcdcd    call    $cdcd
fa11 cdcdcd    call    $cdcd
fa14 cdcdcd    call    $cdcd
fa17 cdcdcd    call    $cdcd
fa1a cdcdcd    call    $cdcd
fa1d cdcdcd    call    $cdcd
fa20 cdcdcd    call    $cdcd
fa23 cdcdcd    call    $cdcd
fa26 cdcdcd    call    $cdcd
fa29 cdcdcd    call    $cdcd
fa2c cdcdcd    call    $cdcd
fa2f cdcdcd    call    $cdcd
fa32 cdcdcd    call    $cdcd
fa35 cdcdcd    call    $cdcd
fa38 cdcdcd    call    $cdcd
fa3b cdcdcd    call    $cdcd
fa3e cdcdcd    call    $cdcd
fa41 cdcdcd    call    $cdcd
fa44 cdcdcd    call    $cdcd
fa47 cdcdcd    call    $cdcd
fa4a cdcdcd    call    $cdcd
fa4d cdcdcd    call    $cdcd
fa50 cdcdcd    call    $cdcd
fa53 cdcdcd    call    $cdcd
fa56 cdcdcd    call    $cdcd
fa59 cdcdcd    call    $cdcd
fa5c cdcdcd    call    $cdcd
fa5f cdcdcd    call    $cdcd
fa62 cdcdcd    call    $cdcd
fa65 cdcdcd    call    $cdcd
fa68 cdcdcd    call    $cdcd
fa6b cdcdcd    call    $cdcd
fa6e cdcdcd    call    $cdcd
fa71 cdcdcd    call    $cdcd
fa74 cdcdcd    call    $cdcd
fa77 cdcdcd    call    $cdcd
fa7a cdcdcd    call    $cdcd
fa7d cdcdcd    call    $cdcd
fa80 cdcdcd    call    $cdcd
fa83 cdcdcd    call    $cdcd
fa86 cdcdcd    call    $cdcd
fa89 cdcdcd    call    $cdcd
fa8c cdcdcd    call    $cdcd
fa8f cdcdcd    call    $cdcd
fa92 cdcdcd    call    $cdcd
fa95 cdcdcd    call    $cdcd
fa98 cdcdcd    call    $cdcd
fa9b cdcdcd    call    $cdcd
fa9e cdcdcd    call    $cdcd
faa1 cdcdcd    call    $cdcd
faa4 cdcdcd    call    $cdcd
faa7 cdcdcd    call    $cdcd
faaa cdcdcd    call    $cdcd
faad cdcdcd    call    $cdcd
fab0 cdcdcd    call    $cdcd
fab3 cdcdcd    call    $cdcd
fab6 cdcdcd    call    $cdcd
fab9 cdcdcd    call    $cdcd
fabc cdcdcd    call    $cdcd
fabf cdcdcd    call    $cdcd
fac2 cdcdcd    call    $cdcd
fac5 cdcdcd    call    $cdcd
fac8 cdcdcd    call    $cdcd
facb cdcdcd    call    $cdcd
face cdcdcd    call    $cdcd
fad1 cdcdcd    call    $cdcd
fad4 cdcdcd    call    $cdcd
fad7 cdcdcd    call    $cdcd
fada cdcdcd    call    $cdcd
fadd cdcdcd    call    $cdcd
fae0 cdcdcd    call    $cdcd
fae3 cdcdcd    call    $cdcd
fae6 cdcdcd    call    $cdcd
fae9 cdcdcd    call    $cdcd
faec cdcdcd    call    $cdcd
faef cdcdcd    call    $cdcd
faf2 cdcdcd    call    $cdcd
faf5 cdcdcd    call    $cdcd
faf8 cdcdcd    call    $cdcd
fafb cdcdcd    call    $cdcd
fafe cdcdcd    call    $cdcd
fb01 cdcdcd    call    $cdcd
fb04 cdcdcd    call    $cdcd
fb07 cdcdcd    call    $cdcd
fb0a cdcdcd    call    $cdcd
fb0d cdcdcd    call    $cdcd
fb10 cdcdcd    call    $cdcd
fb13 cdcdcd    call    $cdcd
fb16 cdcdcd    call    $cdcd
fb19 cdcdcd    call    $cdcd
fb1c cdcdcd    call    $cdcd
fb1f cdcdcd    call    $cdcd
fb22 cdcdcd    call    $cdcd
fb25 cdcdcd    call    $cdcd
fb28 cdcdcd    call    $cdcd
fb2b cdcdcd    call    $cdcd
fb2e cdcdcd    call    $cdcd
fb31 cdcdcd    call    $cdcd
fb34 cdcdcd    call    $cdcd
fb37 cdcdcd    call    $cdcd
fb3a cdcdcd    call    $cdcd
fb3d cdcdcd    call    $cdcd
fb40 cdcdcd    call    $cdcd
fb43 cdcdcd    call    $cdcd
fb46 cdcdcd    call    $cdcd
fb49 cdcdcd    call    $cdcd
fb4c cdcdcd    call    $cdcd
fb4f cdcdcd    call    $cdcd
fb52 cdcdcd    call    $cdcd
fb55 cdcdcd    call    $cdcd
fb58 cdcdcd    call    $cdcd
fb5b cdcdcd    call    $cdcd
fb5e cdcdcd    call    $cdcd
fb61 cdcdcd    call    $cdcd
fb64 cdcdcd    call    $cdcd
fb67 cdcdcd    call    $cdcd
fb6a cdcdcd    call    $cdcd
fb6d cdcdcd    call    $cdcd
fb70 cdcdcd    call    $cdcd
fb73 cdcdcd    call    $cdcd
fb76 cdcdcd    call    $cdcd
fb79 cdcdcd    call    $cdcd
fb7c cdcdcd    call    $cdcd
fb7f cdcdcd    call    $cdcd
fb82 cdcdcd    call    $cdcd
fb85 cdcdcd    call    $cdcd
fb88 cdcdcd    call    $cdcd
fb8b cdcdcd    call    $cdcd
fb8e cdcdcd    call    $cdcd
fb91 cdcdcd    call    $cdcd
fb94 cdcdcd    call    $cdcd
fb97 cdcdcd    call    $cdcd
fb9a cdcdcd    call    $cdcd
fb9d cdcdcd    call    $cdcd
fba0 cdcdcd    call    $cdcd
fba3 cdcdcd    call    $cdcd
fba6 cdcdcd    call    $cdcd
fba9 cdcdcd    call    $cdcd
fbac cdcdcd    call    $cdcd
fbaf cdcdcd    call    $cdcd
fbb2 cdcdcd    call    $cdcd
fbb5 cdcdcd    call    $cdcd
fbb8 cdcdcd    call    $cdcd
fbbb cdcdcd    call    $cdcd
fbbe cdcdcd    call    $cdcd
fbc1 cdcdcd    call    $cdcd
fbc4 cdcdcd    call    $cdcd
fbc7 cdcdcd    call    $cdcd
fbca cdcdcd    call    $cdcd
fbcd cdcdcd    call    $cdcd
fbd0 cdcdcd    call    $cdcd
fbd3 cdcdcd    call    $cdcd
fbd6 cdcdcd    call    $cdcd
fbd9 cdcdcd    call    $cdcd
fbdc cdcdcd    call    $cdcd
fbdf cdcdcd    call    $cdcd
fbe2 cdcdcd    call    $cdcd
fbe5 cdcdcd    call    $cdcd
fbe8 cdcdcd    call    $cdcd
fbeb cdcdcd    call    $cdcd
fbee cdcdcd    call    $cdcd
fbf1 cdcdcd    call    $cdcd
fbf4 cdcdcd    call    $cdcd
fbf7 cdcdcd    call    $cdcd
fbfa cdcdcd    call    $cdcd
fbfd cdcdcd    call    $cdcd
fc00 cdcdcd    call    $cdcd
fc03 cdcdcd    call    $cdcd
fc06 cdcdcd    call    $cdcd
fc09 cdcdcd    call    $cdcd
fc0c cdcdcd    call    $cdcd
fc0f cdcdcd    call    $cdcd
fc12 cdcdcd    call    $cdcd
fc15 cdcdcd    call    $cdcd
fc18 cdcdcd    call    $cdcd
fc1b cdcdcd    call    $cdcd
fc1e cdcdcd    call    $cdcd
fc21 cdcdcd    call    $cdcd
fc24 cdcdcd    call    $cdcd
fc27 cdcdcd    call    $cdcd
fc2a cdcdcd    call    $cdcd
fc2d cdcdcd    call    $cdcd
fc30 cdcdcd    call    $cdcd
fc33 cdcdcd    call    $cdcd
fc36 cdcdcd    call    $cdcd
fc39 cdcdcd    call    $cdcd
fc3c cdcdcd    call    $cdcd
fc3f cdcdcd    call    $cdcd
fc42 cdcdcd    call    $cdcd
fc45 cdcdcd    call    $cdcd
fc48 cdcdcd    call    $cdcd
fc4b cdcdcd    call    $cdcd
fc4e cdcdcd    call    $cdcd
fc51 cdcdcd    call    $cdcd
fc54 cdcdcd    call    $cdcd
fc57 cdcdcd    call    $cdcd
fc5a cdcdcd    call    $cdcd
fc5d cdcdcd    call    $cdcd
fc60 cdcdcd    call    $cdcd
fc63 cdcdcd    call    $cdcd
fc66 cdcdcd    call    $cdcd
fc69 cdcdcd    call    $cdcd
fc6c cdcdcd    call    $cdcd
fc6f cdcdcd    call    $cdcd
fc72 cdcdcd    call    $cdcd
fc75 cdcdcd    call    $cdcd
fc78 cdcdcd    call    $cdcd
fc7b cdcdcd    call    $cdcd
fc7e cdcdcd    call    $cdcd
fc81 cdcdcd    call    $cdcd
fc84 cdcdcd    call    $cdcd
fc87 cdcdcd    call    $cdcd
fc8a cdcdcd    call    $cdcd
fc8d cdcdcd    call    $cdcd
fc90 cdcdcd    call    $cdcd
fc93 cdcdcd    call    $cdcd
fc96 cdcdcd    call    $cdcd
fc99 cdcdcd    call    $cdcd
fc9c cdcdcd    call    $cdcd
fc9f cdcdcd    call    $cdcd
fca2 cdcdcd    call    $cdcd
fca5 cdcdcd    call    $cdcd
fca8 cdcdcd    call    $cdcd
fcab cdcdcd    call    $cdcd
fcae cdcdcd    call    $cdcd
fcb1 cdcdcd    call    $cdcd
fcb4 cdcdcd    call    $cdcd
fcb7 cdcdcd    call    $cdcd
fcba cdcdcd    call    $cdcd
fcbd cdcdcd    call    $cdcd
fcc0 cdcdcd    call    $cdcd
fcc3 cdcdcd    call    $cdcd
fcc6 cdcdcd    call    $cdcd
fcc9 cdcdcd    call    $cdcd
fccc cdcdcd    call    $cdcd
fccf cdcdcd    call    $cdcd
fcd2 cdcdcd    call    $cdcd
fcd5 cdcdcd    call    $cdcd
fcd8 cdcdcd    call    $cdcd
fcdb cdcdcd    call    $cdcd
fcde cdcdcd    call    $cdcd
fce1 cdcdcd    call    $cdcd
fce4 cdcdcd    call    $cdcd
fce7 cdcdcd    call    $cdcd
fcea cdcdcd    call    $cdcd
fced cdcdcd    call    $cdcd
fcf0 cdcdcd    call    $cdcd
fcf3 cdcdcd    call    $cdcd
fcf6 cdcdcd    call    $cdcd
fcf9 cdcd03    call    $03cd
fcfc 0100fd    ld      bc,$fd00
fcff cdedfd    call    $fded
fd02 cdcdcd    call    $cdcd
fd05 cdcdcd    call    $cdcd
fd08 cdcdcd    call    $cdcd
fd0b cdcdcd    call    $cdcd
fd0e cdcdcd    call    $cdcd
fd11 cdcdcd    call    $cdcd
fd14 cdcdcd    call    $cdcd
fd17 cdcdcd    call    $cdcd
fd1a cdcdcd    call    $cdcd
fd1d cdcdcd    call    $cdcd
fd20 cdcdcd    call    $cdcd
fd23 cdcdcd    call    $cdcd
fd26 cdcdcd    call    $cdcd
fd29 cdcdcd    call    $cdcd
fd2c cdcdcd    call    $cdcd
fd2f cdcdcd    call    $cdcd
fd32 cdcdcd    call    $cdcd
fd35 cdcdcd    call    $cdcd
fd38 cdcdcd    call    $cdcd
fd3b cdcdcd    call    $cdcd
fd3e cdcdcd    call    $cdcd
fd41 cdcdcd    call    $cdcd
fd44 cdcdcd    call    $cdcd
fd47 cdcdcd    call    $cdcd
fd4a cdcdcd    call    $cdcd
fd4d cdcdcd    call    $cdcd
fd50 cdcdcd    call    $cdcd
fd53 cdcdcd    call    $cdcd
fd56 cdcdcd    call    $cdcd
fd59 cdcdcd    call    $cdcd
fd5c cdcdcd    call    $cdcd
fd5f cdcdcd    call    $cdcd
fd62 cdcdcd    call    $cdcd
fd65 cdcdcd    call    $cdcd
fd68 cdcdcd    call    $cdcd
fd6b cdcdcd    call    $cdcd
fd6e cdcdcd    call    $cdcd
fd71 cdcdcd    call    $cdcd
fd74 cdcdcd    call    $cdcd
fd77 cdcdcd    call    $cdcd
fd7a cdcdcd    call    $cdcd
fd7d cdcdcd    call    $cdcd
fd80 cdcdcd    call    $cdcd
fd83 cdcdcd    call    $cdcd
fd86 cdcdcd    call    $cdcd
fd89 cdcdcd    call    $cdcd
fd8c cdcdcd    call    $cdcd
fd8f cdcdcd    call    $cdcd
fd92 cdcdcd    call    $cdcd
fd95 cdcdcd    call    $cdcd
fd98 cdcdcd    call    $cdcd
fd9b cdcdcd    call    $cdcd
fd9e cdcdcd    call    $cdcd
fda1 cdcdcd    call    $cdcd
fda4 cdcdcd    call    $cdcd
fda7 cdcdcd    call    $cdcd
fdaa cdcdcd    call    $cdcd
fdad cdcdcd    call    $cdcd
fdb0 cdcdcd    call    $cdcd
fdb3 cdcdcd    call    $cdcd
fdb6 cdcdcd    call    $cdcd
fdb9 cdcdcd    call    $cdcd
fdbc cdcdcd    call    $cdcd
fdbf cdcdcd    call    $cdcd
fdc2 cdcdcd    call    $cdcd
fdc5 cdcdcd    call    $cdcd
fdc8 cdcdcd    call    $cdcd
fdcb cdcdcd    call    $cdcd
fdce cdcdcd    call    $cdcd
fdd1 cdcdcd    call    $cdcd
fdd4 cdcdcd    call    $cdcd
fdd7 cdcdcd    call    $cdcd
fdda cdcdcd    call    $cdcd
fddd cdcdcd    call    $cdcd
fde0 cdcdcd    call    $cdcd
fde3 cdcdcd    call    $cdcd
fde6 cdcdcd    call    $cdcd
fde9 42        ld      b,d
fdea 02        ld      (bc),a
fdeb 00        nop     
fdec 00        nop     
fded dc75ea    call    c,$ea75
fdf0 75        ld      (hl),l
fdf1 310357    ld      sp,$5703
fdf4 03        inc     bc
fdf5 67        ld      h,a
fdf6 03        inc     bc
fdf7 0c        inc     c
fdf8 03        inc     bc
fdf9 1b        dec     de
fdfa 2b        dec     hl
fdfb 40        ld      b,b
fdfc 2b        dec     hl
fdfd 76        halt    
fdfe 5b        ld      e,e
fdff 49        ld      c,c
fe00 a3        and     e
fe01 f8        ret     m

fe02 3a562c    ld      a,($2c56)
fe05 cdedfe    call    $feed
fe08 c9        ret     

fe09 cdcdcd    call    $cdcd
fe0c cdcdcd    call    $cdcd
fe0f cdcdcd    call    $cdcd
fe12 cdcdcd    call    $cdcd
fe15 cdcdcd    call    $cdcd
fe18 cdcdcd    call    $cdcd
fe1b cdcdcd    call    $cdcd
fe1e cdcdcd    call    $cdcd
fe21 cdcdcd    call    $cdcd
fe24 cdcdcd    call    $cdcd
fe27 cdcdcd    call    $cdcd
fe2a cdcdcd    call    $cdcd
fe2d cdcdcd    call    $cdcd
fe30 cdcdcd    call    $cdcd
fe33 cdcdcd    call    $cdcd
fe36 cdcdcd    call    $cdcd
fe39 cdcdcd    call    $cdcd
fe3c cdcdcd    call    $cdcd
fe3f cdcdcd    call    $cdcd
fe42 cdcdcd    call    $cdcd
fe45 cdcdcd    call    $cdcd
fe48 cdcdcd    call    $cdcd
fe4b cdcdcd    call    $cdcd
fe4e cdcdcd    call    $cdcd
fe51 cdcdcd    call    $cdcd
fe54 cdcdcd    call    $cdcd
fe57 cdcdcd    call    $cdcd
fe5a cdcdcd    call    $cdcd
fe5d cdcdcd    call    $cdcd
fe60 cdcdcd    call    $cdcd
fe63 cdcdcd    call    $cdcd
fe66 cdcdcd    call    $cdcd
fe69 cdcdcd    call    $cdcd
fe6c cdcdcd    call    $cdcd
fe6f cdcdcd    call    $cdcd
fe72 cdcdcd    call    $cdcd
fe75 cdcdcd    call    $cdcd
fe78 cdcdcd    call    $cdcd
fe7b cdcdcd    call    $cdcd
fe7e cdcdcd    call    $cdcd
fe81 cdcdcd    call    $cdcd
fe84 cdcdcd    call    $cdcd
fe87 cdcdcd    call    $cdcd
fe8a cdcdcd    call    $cdcd
fe8d cdcdcd    call    $cdcd
fe90 cdcdcd    call    $cdcd
fe93 cdcdcd    call    $cdcd
fe96 cdcdcd    call    $cdcd
fe99 cdcdcd    call    $cdcd
fe9c cdcdcd    call    $cdcd
fe9f cdcdcd    call    $cdcd
fea2 cdcdcd    call    $cdcd
fea5 cdcdcd    call    $cdcd
fea8 cdcdcd    call    $cdcd
feab cdcdcd    call    $cdcd
feae cdcdcd    call    $cdcd
feb1 cdcdcd    call    $cdcd
feb4 cdcdcd    call    $cdcd
feb7 cdcdcd    call    $cdcd
feba cdcdcd    call    $cdcd
febd cdcdcd    call    $cdcd
fec0 cdcdcd    call    $cdcd
fec3 cdcdcd    call    $cdcd
fec6 cdcdcd    call    $cdcd
fec9 cdcdcd    call    $cdcd
fecc cdcdcd    call    $cdcd
fecf cdcdcd    call    $cdcd
fed2 cdcdcd    call    $cdcd
fed5 cdcdcd    call    $cdcd
fed8 cdcdcd    call    $cdcd
fedb cdcdcd    call    $cdcd
fede cdcdcd    call    $cdcd
fee1 cdcdcd    call    $cdcd
fee4 cdcdcd    call    $cdcd
fee7 cdcdcd    call    $cdcd
feea cdcdcd    call    $cdcd
feed cdcdcd    call    $cdcd
fef0 cdcdcd    call    $cdcd
fef3 cdcdcd    call    $cdcd
fef6 cdcdcd    call    $cdcd
fef9 cdcdcd    call    $cdcd
fefc cdcdcd    call    $cdcd
feff cdc360    call    $60c3
ff02 ff        rst     $38
ff03 c364ff    jp      $ff64
ff06 c368ff    jp      $ff68
ff09 c36cff    jp      $ff6c
ff0c c370ff    jp      $ff70
ff0f c374ff    jp      $ff74
ff12 c378ff    jp      $ff78
ff15 c37cff    jp      $ff7c
ff18 c380ff    jp      $ff80
ff1b c384ff    jp      $ff84
ff1e c388ff    jp      $ff88
ff21 c38cff    jp      $ff8c
ff24 c390ff    jp      $ff90
ff27 c394ff    jp      $ff94
ff2a c398ff    jp      $ff98
ff2d c39cff    jp      $ff9c
ff30 c3a0ff    jp      $ffa0
ff33 c3a4ff    jp      $ffa4
ff36 c3a8ff    jp      $ffa8
ff39 c3acff    jp      $ffac
ff3c c3b0ff    jp      $ffb0
ff3f c3b4ff    jp      $ffb4
ff42 c3b8ff    jp      $ffb8
ff45 c3bcff    jp      $ffbc
ff48 c3c0ff    jp      $ffc0
ff4b c3c4ff    jp      $ffc4
ff4e c3c8ff    jp      $ffc8
ff51 c3ccff    jp      $ffcc
ff54 c3d0ff    jp      $ffd0
ff57 c3d4ff    jp      $ffd4
ff5a c3d8ff    jp      $ffd8
ff5d c3dcff    jp      $ffdc
ff60 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff62 00        nop     
ff63 c9        ret     

ff64 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff66 01c9ed    ld      bc,$edc9
ff69 ff        rst     $38
ff6a 02        ld      (bc),a
ff6b c9        ret     

ff6c edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff6e 03        inc     bc
ff6f c9        ret     

ff70 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff72 04        inc     b
ff73 c9        ret     

ff74 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff76 05        dec     b
ff77 c9        ret     

ff78 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff7a 06c9      ld      b,$c9
ff7c edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff7e 07        rlca    
ff7f c9        ret     

ff80 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff82 08        ex      af,af'
ff83 c9        ret     

ff84 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff86 09        add     hl,bc
ff87 c9        ret     

ff88 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff8a 0a        ld      a,(bc)
ff8b c9        ret     

ff8c edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff8e 0b        dec     bc
ff8f c9        ret     

ff90 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff92 0c        inc     c
ff93 c9        ret     

ff94 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff96 0d        dec     c
ff97 c9        ret     

ff98 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff9a 0ec9      ld      c,$c9
ff9c edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ff9e 0f        rrca    
ff9f c9        ret     

ffa0 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffa2 10c9      djnz    $ff6d
ffa4 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffa6 11c9ed    ld      de,$edc9
ffa9 ff        rst     $38
ffaa 12        ld      (de),a
ffab c9        ret     

ffac edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffae 13        inc     de
ffaf c9        ret     

ffb0 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffb2 14        inc     d
ffb3 c9        ret     

ffb4 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffb6 15        dec     d
ffb7 c9        ret     

ffb8 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffba 16c9      ld      d,$c9
ffbc edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffbe 17        rla     
ffbf c9        ret     

ffc0 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffc2 18c9      jr      $ff8d
ffc4 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffc6 19        add     hl,de
ffc7 c9        ret     

ffc8 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffca 1a        ld      a,(de)
ffcb c9        ret     

ffcc edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffce 1b        dec     de
ffcf c9        ret     

ffd0 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffd2 1c        inc     e
ffd3 c9        ret     

ffd4 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffd6 1d        dec     e
ffd7 c9        ret     

ffd8 edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffda 1ec9      ld      e,$c9
ffdc edff      db      $ed, $ff         ; Undocumented 8 T-State NOP
ffde 1f        rra     
ffdf c9        ret     

ffe0 cdcdcd    call    $cdcd
ffe3 cdcdcd    call    $cdcd
ffe6 cdcdcd    call    $cdcd
ffe9 cdcdcd    call    $cdcd
ffec cdcdcd    call    $cdcd
ffef cdcdcd    call    $cdcd
fff2 cdcdcd    call    $cdcd
fff5 cdcdcd    call    $cdcd
fff8 cdcdcd    call    $cdcd
fffb cdcdcd    call    $cdcd
fffe cdcdc3    call    $c3cd
