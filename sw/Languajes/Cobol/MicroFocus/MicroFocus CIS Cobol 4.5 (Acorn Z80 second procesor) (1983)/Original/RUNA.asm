; Disassembly of the file "E:\Tmp\cpm\pcw\RUNA.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Saturday, 16 of April 2016 at 03:06 AM
; 
0100 c30119    jp      $1901	; StartUp
0103 c35907    jp      $0759	; StartUp 2
0106 c3151c    jp      $1c15	; get End of TPA
0109 c3981d    jp      $1d98
010c c39e1d    jp      $1d9e
010f c3f760    jp      $60f7
0112 c3101b    jp      $1b10
0115 c3c11b    jp      $1bc1
0118 c3ea19    jp      $19ea
011b c3911c    jp      $1c91
011e c3f01c    jp      $1cf0
0121 c3e81b    jp      $1be8
0124 43        ld      b,e
0125 35        dec     (hl)
0126 49        ld      c,c
0127 35        dec     (hl)
0128 3d        dec     a
0129 35        dec     (hl)
012a c31019    jp      $1910
012d c3991a    jp      $1a99
0130 c32054    jp      $5420
0133 c3bb53    jp      $53bb
0136 c35d54    jp      $545d
0139 c30855    jp      $5508
013c c32755    jp      $5527
013f c36a55    jp      $556a
0142 c3c655    jp      $55c6
0145 c3d655    jp      $55d6
0148 c30656    jp      $5606
014b c3e455    jp      $55e4
014e c31856    jp      $5618
0151 c32c55    jp      $552c
0154 c34e55    jp      $554e
0157 00        nop     
0158 00        nop     
0159 00        nop     
015a 00        nop     
015b 00        nop     
015c 00        nop     
015d 00        nop     
015e 00        nop     
015f 00        nop     
0160 00        nop     
0161 00        nop     
0162 0620      ld      b,$20
0164 2028      jr      nz,$018e
0166 43        ld      b,e
0167 29        add     hl,hl
0168 2020      jr      nz,$018a
016a 313937    ld      sp,$3739
016d 382c      jr      c,$019b
016f 2031      jr      nz,$01a2
0171 39        add     hl,sp
0172 3833      jr      c,$01a7
0174 2020      jr      nz,$0196
0176 4d        ld      c,l
0177 49        ld      c,c
0178 43        ld      b,e
0179 52        ld      d,d
017a 4f        ld      c,a
017b 2046      jr      nz,$01c3
017d 4f        ld      c,a
017e 43        ld      b,e
017f 55        ld      d,l
0180 53        ld      d,e
0181 204c      jr      nz,$01cf
0183 54        ld      d,h
0184 44        ld      b,h
0185 42        ld      b,d
0186 51        ld      d,c
0187 0c        inc     c
0188 bd        cp      l
0189 42        ld      b,d
018a 43        ld      b,e
018b 04        inc     b
018c 05        dec     b
018d 00        nop     
018e 00        nop     
018f 014f1d    ld      bc,$1d4f
0192 00        nop     
0193 00        nop     
0194 00        nop     
0195 00        nop     
0196 0d        dec     c
0197 88        adc     a,b
0198 89        adc     a,c
0199 8b        adc     a,e
019a 8a        adc     a,d
019b 87        add     a,a
019c 09        add     hl,bc
019d 1b        dec     de
019e 00        nop     
019f f600      or      $00
01a1 f7        rst     $30
01a2 02        ld      (bc),a
01a3 f600      or      $00
01a5 f7        rst     $30
01a6 010158    ld      bc,$5801
01a9 00        nop     
01aa 59        ld      e,c
01ab 00        nop     
01ac 00        nop     
01ad 00        nop     
01ae 1f        rra     
01af 00        nop     
01b0 00        nop     
01b1 00        nop     
01b2 00        nop     
01b3 00        nop     
01b4 00        nop     
01b5 00        nop     
01b6 00        nop     
01b7 00        nop     
01b8 04        inc     b
01b9 011100    ld      bc,$0011
01bc 118114    ld      de,$1481
01bf 00        nop     
01c0 010c00    ld      bc,$000c
01c3 00        nop     
01c4 011e00    ld      bc,$001e
01c7 00        nop     
01c8 07        rlca    
01c9 00        nop     
01ca 00        nop     
01cb 00        nop     
01cc 00        nop     
01cd dd010000  ld      bc,$0000
01d1 db4a      in      a,($4a)
01d3 bc        cp      h
01d4 56        ld      d,(hl)
01d5 ac        xor     h
01d6 73        ld      (hl),e
01d7 58        ld      e,b
01d8 79        ld      a,c
01d9 ab        xor     e
01da 83        add     a,e
01db 63        ld      h,e
01dc 88        adc     a,b
01dd 09        add     hl,bc
01de 08        ex      af,af'
01df 1018      djnz    $01f9
01e1 2028      jr      nz,$020b
01e3 3038      jr      nc,$021d
01e5 40        ld      b,b
01e6 48        ld      c,b
01e7 00        nop     
01e8 00        nop     
01e9 00        nop     
01ea 00        nop     
01eb 00        nop     
01ec 2001      jr      nz,$01ef
01ee 00        nop     
01ef 00        nop     
01f0 00        nop     
01f1 00        nop     
01f2 00        nop     
01f3 00        nop     
01f4 00        nop     
01f5 ff        rst     $38
01f6 00        nop     
01f7 00        nop     
01f8 00        nop     
01f9 02        ld      (bc),a
01fa 4a        ld      c,d
01fb 0100c3    ld      bc,$c300
01fe 3001      jr      nc,$0201
0200 00        nop     
0201 00        nop     
0202 00        nop     
0203 00        nop     
0204 00        nop     
0205 00        nop     
0206 00        nop     
0207 00        nop     
0208 00        nop     
0209 00        nop     
020a 00        nop     
020b 00        nop     
020c 00        nop     
020d 0100d1    ld      bc,$d100
0210 c1        pop     bc
0211 70        ld      (hl),b
0212 2b        dec     hl
0213 71        ld      (hl),c
0214 d5        push    de
0215 f5        push    af
0216 79        ld      a,c
0217 cd8f06    call    $068f
021a f1        pop     af
021b c9        ret     

021c fe00      cp      $00
021e 00        nop     
021f 00        nop     
0220 00        nop     
0221 00        nop     
0222 00        nop     
0223 00        nop     
0224 00        nop     
0225 00        nop     
0226 00        nop     
0227 00        nop     
0228 00        nop     
0229 00        nop     
022a 00        nop     
022b 00        nop     
022c 00        nop     
022d 00        nop     
022e 00        nop     
022f 00        nop     
0230 00        nop     
0231 00        nop     
0232 00        nop     
0233 00        nop     
0234 00        nop     
0235 00        nop     
0236 00        nop     
0237 00        nop     
0238 00        nop     
0239 00        nop     
023a 00        nop     
023b 00        nop     
023c 00        nop     
023d 00        nop     
023e 3e00      ld      a,$00
0240 00        nop     
0241 00        nop     
0242 00        nop     
0243 ff        rst     $38
0244 ff        rst     $38
0245 00        nop     
0246 00        nop     
0247 00        nop     
0248 00        nop     
0249 00        nop     
024a 00        nop     
024b 00        nop     
024c 00        nop     
024d 00        nop     
024e 00        nop     
024f 00        nop     
0250 00        nop     
0251 00        nop     
0252 00        nop     
0253 00        nop     
0254 00        nop     
0255 00        nop     
0256 00        nop     
0257 00        nop     
0258 00        nop     
0259 00        nop     
025a 00        nop     
025b 00        nop     
025c 00        nop     
025d 00        nop     
025e 00        nop     
025f 00        nop     
0260 00        nop     
0261 00        nop     
0262 00        nop     
0263 00        nop     
0264 00        nop     
0265 00        nop     
0266 00        nop     
0267 00        nop     
0268 00        nop     
0269 00        nop     
026a 00        nop     
026b 00        nop     
026c 00        nop     
026d 00        nop     
026e 00        nop     
026f 00        nop     
0270 00        nop     
0271 00        nop     
0272 00        nop     
0273 00        nop     
0274 7a        ld      a,d
0275 02        ld      (bc),a
0276 00        nop     
0277 00        nop     
0278 00        nop     
0279 00        nop     
027a 00        nop     
027b 00        nop     
027c 00        nop     
027d 00        nop     
027e 98        sbc     a,b
027f 063d      ld      b,$3d
0281 c21805    jp      nz,$0518
0284 eb        ex      de,hl
0285 4e        ld      c,(hl)
0286 00        nop     
0287 00        nop     
0288 00        nop     
0289 00        nop     
028a 00        nop     
028b 00        nop     
028c 00        nop     
028d 00        nop     
028e 00        nop     
028f 00        nop     
0290 00        nop     
0291 00        nop     
0292 00        nop     
0293 00        nop     
0294 00        nop     
0295 00        nop     
0296 00        nop     
0297 00        nop     
0298 05        dec     b
0299 1800      jr      $029b
029b 00        nop     
029c 00        nop     
029d 00        nop     
029e c8        ret     z

029f 00        nop     
02a0 fc00fd    call    m,$fd00
02a3 00        nop     
02a4 fe00      cp      $00
02a6 00        nop     
02a7 010a00    ld      bc,$000a
02aa 00        nop     
02ab 00        nop     
02ac 00        nop     
02ad 00        nop     
02ae 00        nop     
02af 00        nop     
02b0 00        nop     
02b1 00        nop     
02b2 00        nop     
02b3 00        nop     
02b4 00        nop     
02b5 00        nop     
02b6 00        nop     
02b7 00        nop     
02b8 00        nop     
02b9 00        nop     
02ba 00        nop     
02bb 00        nop     
02bc 00        nop     
02bd 00        nop     
02be 00        nop     
02bf 00        nop     
02c0 00        nop     
02c1 00        nop     
02c2 00        nop     
02c3 00        nop     
02c4 00        nop     
02c5 00        nop     
02c6 00        nop     
02c7 00        nop     
02c8 00        nop     
02c9 00        nop     
02ca 00        nop     
02cb 00        nop     
02cc 00        nop     
02cd 00        nop     
02ce 00        nop     
02cf 00        nop     
02d0 00        nop     
02d1 0a        ld      a,(bc)
02d2 00        nop     
02d3 00        nop     
02d4 00        nop     
02d5 00        nop     
02d6 00        nop     
02d7 00        nop     
02d8 00        nop     
02d9 00        nop     
02da 00        nop     
02db 00        nop     
02dc 48        ld      c,b
02dd 5a        ld      e,d
02de 48        ld      c,b
02df da4a00    jp      c,$004a
02e2 00        nop     
02e3 00        nop     
02e4 00        nop     
02e5 00        nop     
02e6 00        nop     
02e7 00        nop     
02e8 00        nop     
02e9 00        nop     
02ea 00        nop     
02eb 00        nop     
02ec 00        nop     
02ed 00        nop     
02ee 00        nop     
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
02f9 00        nop     
02fa 00        nop     
02fb 00        nop     
02fc 00        nop     
02fd 00        nop     
02fe 00        nop     
02ff 00        nop     
0300 00        nop     
0301 00        nop     
0302 00        nop     
0303 00        nop     
0304 79        ld      a,c
0305 3000      jr      nc,$0307
0307 00        nop     
0308 00        nop     
0309 00        nop     
030a 00        nop     
030b 00        nop     
030c 80        add     a,b
030d 00        nop     
030e 00        nop     
030f 00        nop     
0310 00        nop     
0311 00        nop     
0312 00        nop     
0313 fe03      cp      $03
0315 ca1805    jp      z,$0518
0318 fe04      cp      $04
031a c0        ret     nz

031b 3d        dec     a
031c c9        ret     

031d 217a06    ld      hl,$067a
0320 117b06    ld      de,$067b
0323 0e02      ld      c,$02
0325 1a        ld      a,(de)
0326 77        ld      (hl),a
0327 23        inc     hl
0328 13        inc     de
0329 0d        dec     c
032a c22501    jp      nz,$0125
032d 1a        ld      a,(de)
032e fe20      cp      $20
0330 c21800    jp      nz,$0018
0333 00        nop     
0334 3000      jr      nc,$0336
0336 00        nop     
0337 00        nop     
0338 00        nop     
0339 010080    ld      bc,$8000
033c 00        nop     
033d 00        nop     
033e 00        nop     
033f 00        nop     
0340 00        nop     
0341 cd9300    call    $0093
0344 c9        ret     

0345 cd1d01    call    $011d
0348 f5        push    af
0349 cd7d00    call    $007d
034c f1        pop     af
034d f6c0      or      $c0
034f c9        ret     

0350 1a        ld      a,(de)
0351 2a1100    ld      hl,($0011)
0354 77        ld      (hl),a
0355 23        inc     hl
0356 221100    ld      ($0011),hl
0359 c9        ret     

035a cd8c06    call    $068c
035d fe0d      cp      $0d
035f ca4000    jp      z,$0040
0362 00        nop     
0363 3000      jr      nc,$0365
0365 00        nop     
0366 00        nop     
0367 00        nop     
0368 010080    ld      bc,$8000
036b 00        nop     
036c 00        nop     
036d 00        nop     
036e 00        nop     
036f 00        nop     
0370 a6        and     (hl)
0371 05        dec     b
0372 114505    ld      de,$0545
0375 cdb700    call    $00b7
0378 c27e01    jp      nz,$017e
037b c35001    jp      $0150
037e 0e0a      ld      c,$0a
0380 21ce05    ld      hl,$05ce
0383 cdb700    call    $00b7
0386 c29201    jp      nz,$0192
0389 00        nop     
038a 80        add     a,b
038b 01cd8c    ld      bc,$8ccd
038e 00        nop     
038f c30000    jp      $0000
0392 00        nop     
0393 00        nop     
0394 21e605    ld      hl,$05e6
0397 cdb700    call    $00b7
039a c2aa01    jp      nz,$01aa
039d cd5001    call    $0150
03a0 cd7d00    call    $007d
03a3 cd5101    call    $0151
03a6 78        ld      a,b
03a7 c30000    jp      $0000
03aa 0e01      ld      c,$01
03ac 21ea05    ld      hl,$05ea
03af cdb700    call    $00b7
03b2 c2c601    jp      nz,$01c6
03b5 cddb00    call    $00db
03b8 cd9300    call    $0093
03bb 47        ld      b,a
03bc 0e40      ld      c,$40
03be cddb00    call    $00db
03c1 b1        or      c
03c2 b0        or      b
03c3 c35101    jp      $0151
03c6 0e08      ld      c,$08
03c8 00        nop     
03c9 00        nop     
03ca 06cd      ld      b,$cd
03cc b7        or      a
03cd 00        nop     
03ce c2dc01    jp      nz,$01dc
03d1 0d        dec     c
03d2 79        ld      a,c
03d3 cd9300    call    $0093
03d6 47        ld      b,a
03d7 0e80      ld      c,$80
03d9 c3be01    jp      $01be
03dc 0e02      ld      c,$02
03de 211206    ld      hl,$0612
03e1 cdb700    call    $00b7
03e4 c2f401    jp      nz,$01f4
03e7 0c        inc     c
03e8 010000    ld      bc,$0000
03eb db00      in      a,($00)
03ed cd9300    call    $0093
03f0 b1        or      c
03f1 c35101    jp      $0151
03f4 0e01      ld      c,$01
03f6 211606    ld      hl,$0616
03f9 cdb700    call    $00b7
03fc c21002    jp      nz,$0210
03ff cddb00    call    $00db
0402 cd9300    call    $0093
0405 f606      or      $06
0407 cd5101    call    $0151
040a cd8c00    call    $008c
040d c35101    jp      $0151
0410 0e06      ld      c,$06
0412 212e06    ld      hl,$062e
0415 cdb700    call    $00b7
0418 c23602    jp      nz,$0236
041b 79        ld      a,c
041c fe04      cp      $04
041e da2302    jp      c,$0223
0421 c605      add     a,$05
0423 47        ld      b,a
0424 cd0701    call    $0107
0427 cd9900    call    $0099
042a b0        or      b
042b cd5101    call    $0151
042e e6cf      and     $cf
0430 fe01      cp      $01
0432 c0        ret     nz

0433 c3a001    jp      $01a0
0436 0e01      ld      c,$01
0438 213206    ld      hl,$0632
043b cdb700    call    $00b7
043e c25102    jp      nz,$0251
0441 cd8c00    call    $008c
0444 fe08      cp      $08
0446 d21805    jp      nc,$0518
0449 cd9300    call    $0093
044c f6c7      or      $c7
044e c35101    jp      $0151
0451 0e02      ld      c,$02
0453 213e06    ld      hl,$063e
0456 cdb700    call    $00b7
0459 c27102    jp      nz,$0271
045c 0d        dec     c
045d c26502    jp      nz,$0265
0460 0ec1      ld      c,$c1
0462 c36702    jp      $0267
0465 0ec5      ld      c,$c5
0467 cd1001    call    $0110
046a cd9900    call    $0099
046d b1        or      c
046e c35101    jp      $0151
0471 3a7a06    ld      a,($067a)
0474 53        ld      d,e
0475 44        ld      b,h
0476 42        ld      b,d
0477 2043      jr      nz,$04bc
0479 42        ld      b,d
047a 4c        ld      c,h
047b 2053      jr      nz,$04d0
047d 43        ld      b,e
047e 50        ld      d,b
047f 2044      jr      nz,$04c5
0481 44        ld      b,h
0482 43        ld      b,e
0483 2000      jr      nz,$0485
0485 2020      jr      nz,$04a7
0487 2020      jr      nz,$04a9
0489 2020      jr      nz,$04ab
048b 01be3e    ld      bc,$3ebe
048e cb3e      srl     (hl)
0490 bf        cp      a
0491 3ecc      ld      a,$cc
0493 3e41      ld      a,$41
0495 0c        inc     c
0496 41        ld      b,c
0497 0c        inc     c
0498 41        ld      b,c
0499 0c        inc     c
049a 41        ld      b,c
049b 0c        inc     c
049c 41        ld      b,c
049d 0c        inc     c
049e 41        ld      b,c
049f 0c        inc     c
04a0 41        ld      b,c
04a1 0c        inc     c
04a2 41        ld      b,c
04a3 0c        inc     c
04a4 41        ld      b,c
04a5 0c        inc     c
04a6 41        ld      b,c
04a7 0c        inc     c
04a8 41        ld      b,c
04a9 0c        inc     c
04aa 41        ld      b,c
04ab 0c        inc     c
04ac 9f        sbc     a,a
04ad 39        add     hl,sp
04ae 9e        sbc     a,(hl)
04af 39        add     hl,sp
04b0 b5        or      l
04b1 39        add     hl,sp
04b2 b4        or      h
04b3 39        add     hl,sp
04b4 fb        ei      
04b5 3b        dec     sp
04b6 bf        cp      a
04b7 3b        dec     sp
04b8 ac        xor     h
04b9 3ee5      ld      a,$e5
04bb 3d        dec     a
04bc 03        inc     bc
04bd 3e02      ld      a,$02
04bf 3e0a      ld      a,$0a
04c1 3e09      ld      a,$09
04c3 3e71      ld      a,$71
04c5 3f        ccf     
04c6 5a        ld      e,d
04c7 3f        ccf     
04c8 88        adc     a,b
04c9 41        ld      b,c
04ca 4e        ld      c,(hl)
04cb 42        ld      b,d
04cc 58        ld      e,b
04cd 0e85      ld      c,$85
04cf 3e41      ld      a,$41
04d1 0c        inc     c
04d2 89        adc     a,c
04d3 0e41      ld      c,$41
04d5 0c        inc     c
04d6 41        ld      b,c
04d7 0c        inc     c
04d8 41        ld      b,c
04d9 0c        inc     c
04da 41        ld      b,c
04db 0c        inc     c
04dc e9        jp      (hl)
04dd 47        ld      b,a
04de be        cp      (hl)
04df 47        ld      b,a
04e0 f9        ld      sp,hl
04e1 47        ld      b,a
04e2 41        ld      b,c
04e3 0c        inc     c
04e4 41        ld      b,c
04e5 0c        inc     c
04e6 8e        adc     a,(hl)
04e7 3ee6      ld      a,$e6
04e9 09        add     hl,bc
04ea 56        ld      d,(hl)
04eb 11033f    ld      de,$3f03
04ee 02        ld      (bc),a
04ef 3f        ccf     
04f0 d7        rst     $10
04f1 44        ld      b,h
04f2 d644      sub     $44
04f4 db3e      in      a,($3e)
04f6 1145ee    ld      de,$ee45
04f9 44        ld      b,h
04fa 05        dec     b
04fb 45        ld      b,l
04fc 8d        adc     a,l
04fd 47        ld      b,a
04fe a3        and     e
04ff 47        ld      b,a
0500 41        ld      b,c
0501 0c        inc     c
0502 41        ld      b,c
0503 0c        inc     c
0504 41        ld      b,c
0505 0c        inc     c
0506 41        ld      b,c
0507 0c        inc     c
0508 41        ld      b,c
0509 0c        inc     c
050a 41        ld      b,c
050b 0c        inc     c
050c 94        sub     h
050d 0f        rrca    
050e 85        add     a,l
050f 0f        rrca    
0510 74        ld      (hl),h
0511 0f        rrca    
0512 6f        ld      l,a
0513 0f        rrca    
0514 73        ld      (hl),e
0515 0f        rrca    
0516 70        ld      (hl),b
0517 0f        rrca    
0518 71        ld      (hl),c
0519 0f        rrca    
051a 72        ld      (hl),d
051b 0f        rrca    
051c 56        ld      d,(hl)
051d 11410c    ld      de,$0c41
0520 41        ld      b,c
0521 0c        inc     c
0522 41        ld      b,c
0523 0c        inc     c
0524 41        ld      b,c
0525 0c        inc     c
0526 41        ld      b,c
0527 0c        inc     c
0528 7e        ld      a,(hl)
0529 37        scf     
052a e8        ret     pe

052b 37        scf     
052c 2610      ld      h,$10
052e 85        add     a,l
052f 10f6      djnz    $0527
0531 102d      djnz    $0560
0533 11410a    ld      de,$0a41
0536 dd37      scf     
0538 5a        ld      e,d
0539 11a510    ld      de,$10a5
053c f5        push    af
053d 0f        rrca    
053e 9f        sbc     a,a
053f 0f        rrca    
0540 59        ld      e,c
0541 0f        rrca    
0542 5b        ld      e,e
0543 0f        rrca    
0544 45        ld      b,l
0545 0f        rrca    
0546 47        ld      b,a
0547 0f        rrca    
0548 41        ld      b,c
0549 0f        rrca    
054a 43        ld      b,e
054b 0f        rrca    
054c db4a      in      a,($4a)
054e db4a      in      a,($4a)
0550 41        ld      b,c
0551 0c        inc     c
0552 41        ld      b,c
0553 0c        inc     c
0554 db4a      in      a,($4a)
0556 db4a      in      a,($4a)
0558 41        ld      b,c
0559 0c        inc     c
055a 41        ld      b,c
055b 0c        inc     c
055c db4a      in      a,($4a)
055e db4a      in      a,($4a)
0560 41        ld      b,c
0561 0c        inc     c
0562 41        ld      b,c
0563 0c        inc     c
0564 db4a      in      a,($4a)
0566 db4a      in      a,($4a)
0568 41        ld      b,c
0569 0c        inc     c
056a 41        ld      b,c
056b 0c        inc     c
056c 88        adc     a,b
056d 09        add     hl,bc
056e 88        adc     a,b
056f 09        add     hl,bc
0570 88        adc     a,b
0571 09        add     hl,bc
0572 89        adc     a,c
0573 09        add     hl,bc
0574 89        adc     a,c
0575 09        add     hl,bc
0576 89        adc     a,c
0577 09        add     hl,bc
0578 89        adc     a,c
0579 09        add     hl,bc
057a 89        adc     a,c
057b 09        add     hl,bc
057c 87        add     a,a
057d 09        add     hl,bc
057e 41        ld      b,c
057f 0c        inc     c
0580 6d        ld      l,l
0581 09        add     hl,bc
0582 41        ld      b,c
0583 0c        inc     c
0584 41        ld      b,c
0585 0c        inc     c
0586 e8        ret     pe

0587 1041      djnz    $05ca
0589 0c        inc     c
058a 58        ld      e,b
058b 79        ld      a,c
058c 00        nop     
058d 53        ld      d,e
058e 45        ld      b,l
058f 47        ld      b,a
0590 4d        ld      c,l
0591 45        ld      b,l
0592 4e        ld      c,(hl)
0593 54        ld      d,h
0594 3a2052    ld      a,($5220)
0597 54        ld      d,h
0598 45        ld      b,l
0599 52        ld      d,d
059a 52        ld      d,d
059b 4f        ld      c,a
059c 52        ld      d,d
059d 2031      jr      nz,$05d0
059f 323309    ld      ($0933),a
05a2 2043      jr      nz,$05e7
05a4 4f        ld      c,a
05a5 42        ld      b,d
05a6 4f        ld      c,a
05a7 4c        ld      c,h
05a8 2050      jr      nz,$05fa
05aa 43        ld      b,e
05ab 2034      jr      nz,$05e1
05ad 35        dec     (hl)
05ae 3637      ld      (hl),$37
05b0 0d        dec     c
05b1 0a        ld      a,(bc)
05b2 00        nop     
05b3 c3fa10    jp      $10fa
05b6 13        inc     de
05b7 13        inc     de
05b8 c31e08    jp      $081e
05bb 00        nop     
05bc 00        nop     
05bd 00        nop     
05be 49        ld      c,c
05bf 53        ld      d,e
05c0 52        ld      d,d
05c1 2049      jr      nz,$060c
05c3 2020      jr      nz,$05e5
05c5 2000      jr      nz,$05c7
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
05d1 00        nop     
05d2 00        nop     
05d3 00        nop     
05d4 f0        ret     p

05d5 00        nop     
05d6 f0        ret     p

05d7 80        add     a,b
05d8 f201f5    jp      p,$f501
05db 45        ld      b,l
05dc 52        ld      d,d
05dd 52        ld      d,d
05de 4f        ld      c,a
05df 52        ld      d,d
05e0 204f      jr      nz,$0631
05e2 4e        ld      c,(hl)
05e3 204f      jr      nz,$0634
05e5 50        ld      d,b
05e6 45        ld      b,l
05e7 4e        ld      c,(hl)
05e8 49        ld      c,c
05e9 4e        ld      c,(hl)
05ea 47        ld      b,a
05eb 2046      jr      nz,$0633
05ed 49        ld      c,c
05ee 4c        ld      c,h
05ef 45        ld      b,l
05f0 3a2041    ld      a,($4120)
05f3 4e        ld      c,(hl)
05f4 49        ld      c,c
05f5 4d        ld      c,l
05f6 41        ld      b,c
05f7 54        ld      d,h
05f8 49        ld      c,c
05f9 4f        ld      c,a
05fa 4e        ld      c,(hl)
05fb 204f      jr      nz,$064c
05fd 46        ld      b,(hl)
05fe 2052      jr      nz,$0652
0600 4f        ld      c,a
0601 4f        ld      c,a
0602 54        ld      d,h
0603 2050      jr      nz,$0655
0605 52        ld      d,d
0606 4f        ld      c,a
0607 47        ld      b,a
0608 52        ld      d,d
0609 41        ld      b,c
060a 4d        ld      c,l
060b 2049      jr      nz,$0656
060d 4e        ld      c,(hl)
060e 48        ld      c,b
060f 49        ld      c,c
0610 42        ld      b,d
0611 49        ld      c,c
0612 54        ld      d,h
0613 45        ld      b,l
0614 44        ld      b,h
0615 202d      jr      nz,$0644
0617 204d      jr      nz,$0666
0619 49        ld      c,c
061a 53        ld      d,e
061b 53        ld      d,e
061c 49        ld      c,c
061d 4e        ld      c,(hl)
061e 47        ld      b,a
061f 2046      jr      nz,$0667
0621 49        ld      c,c
0622 4c        ld      c,h
0623 45        ld      b,l
0624 53        ld      d,e
0625 02        ld      (bc),a
0626 c3c900    jp      $00c9
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
0648 010000    ld      bc,$0000
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
0659 04        inc     b
065a fe03      cp      $03
065c da6104    jp      c,$0461
065f d605      sub     $05
0661 87        add     a,a
0662 87        add     a,a
0663 4f        ld      c,a
0664 09        add     hl,bc
0665 cdf302    call    $02f3
0668 cd2403    call    $0324
066b c37103    jp      $0371
066e cdf302    call    $02f3
0671 cd2403    call    $0324
0674 0e2c      ld      c,$2c
0676 cd1500    call    $0015
0679 c3d904    jp      $04d9
067c 211606    ld      hl,$0616
067f cdf302    call    $02f3
0682 cd0303    call    $0303
0685 cdbe02    call    $02be
0688 0e2c      ld      c,$2c
068a cd1500    call    $0015
068d c3f404    jp      $04f4
0690 211206    ld      hl,$0612
0693 c39904    jp      $0499
0696 210e06    ld      hl,$060e
0699 cdf302    call    $02f3
069c cd0303    call    $0303
069f cdbe02    call    $02be
06a2 c37103    jp      $0371
06a5 7a        ld      a,d
06a6 e638      and     $38
06a8 0f        rrca    
06a9 4f        ld      c,a
06aa 21ee05    ld      hl,$05ee
06ad 09        add     hl,bc
06ae cdf302    call    $02f3
06b1 c3c504    jp      $04c5
06b4 21ea05    ld      hl,$05ea
06b7 cdf302    call    $02f3
06ba cd0303    call    $0303
06bd cdbe02    call    $02be
06c0 0e2c      ld      c,$2c
06c2 cd1500    call    $0015
06c5 7a        ld      a,d
06c6 e607      and     $07
06c8 cdbe02    call    $02be
06cb c37103    jp      $0371
06ce 79        ld      a,c
06cf 87        add     a,a
06d0 87        add     a,a
06d1 4f        ld      c,a
06d2 21ce05    ld      hl,$05ce
06d5 09        add     hl,bc
06d6 cdf302    call    $02f3
06d9 cda302    call    $02a3
06dc f5        push    af
06dd cda302    call    $02a3
06e0 57        ld      d,a
06e1 f1        pop     af
06e2 5f        ld      e,a
06e3 cd9506    call    $0695
06e6 c37103    jp      $0371
06e9 79        ld      a,c
06ea 87        add     a,a
06eb 87        add     a,a
06ec 4f        ld      c,a
06ed 21a605    ld      hl,$05a6
06f0 09        add     hl,bc
06f1 cdf302    call    $02f3
06f4 cda302    call    $02a3
06f7 cd9206    call    $0692
06fa c37103    jp      $0371
06fd 79        ld      a,c
06fe 87        add     a,a
06ff 87        add     a,a
0700 4f        ld      c,a
0701 216205    ld      hl,$0562
0704 09        add     hl,bc
0705 cdf302    call    $02f3
0708 c37103    jp      $0371
070b 217606    ld      hl,$0676
070e cdf302    call    $02f3
0711 7a        ld      a,d
0712 cd9206    call    $0692
0715 c37103    jp      $0371
0718 cd2e00    call    $002e
071b 0e3f      ld      c,$3f
071d cd1500    call    $0015
0720 2a1300    ld      hl,($0013)
0723 f9        ld      sp,hl
0724 210000    ld      hl,$0000
0727 39        add     hl,sp
0728 221300    ld      ($0013),hl
072b cd3803    call    $0338
072e 221100    ld      ($0011),hl
0731 cd8906    call    $0689
0734 cd5a01    call    $015a
0737 2a1100    ld      hl,($0011)
073a 220c00    ld      ($000c),hl
073d c32b05    jp      $052b
0740 2a1300    ld      hl,($0013)
0743 f9        ld      sp,hl
0744 c9        ret     

0745 00        nop     
0746 07        rlca    
0747 0f        rrca    
0748 17        rla     
0749 1f        rra     
074a 27        daa     
074b 2f        cpl     
074c 37        scf     
074d 3f        ccf     
074e 76        halt    
074f c9        ret     

0750 e3        ex      (sp),hl
0751 e9        jp      (hl)
0752 eb        ex      de,hl
0753 f3        di      
0754 f9        ld      sp,hl
0755 fb        ei      
0756 c6ce      add     a,$ce
0758 d3

; StartUp 2

0759 cd0601    call    $0106	; get End of TPA
075c 22ab02    ld      ($02ab),hl
075f e5        push    hl
0760 3aee01    ld      a,($01ee)
0763 b7        or      a
0764 c28507    jp      nz,$0785
0767 cdab83    call    $83ab	; print wellcome message
076a cd2a01    call    $012a
076d 3e80      ld      a,$80
076f 32d202    ld      ($02d2),a
0772 210001    ld      hl,$0100
0775 22d302    ld      ($02d3),hl
0778 2a1d02    ld      hl,($021d)
077b 22d502    ld      ($02d5),hl
077e 22a902    ld      ($02a9),hl
0781 af        xor     a
0782 cdeb11    call    $11eb
0785 cd602b    call    $2b60	; No retorna !!!!!
0788 b7        or      a
0789 caa407    jp      z,$07a4
078c 3a9101    ld      a,($0191)
078f 47        ld      b,a
0790 3a9001    ld      a,($0190)
0793 2a4e02    ld      hl,($024e)
0796 3620      ld      (hl),$20
0798 23        inc     hl
0799 3d        dec     a
079a f29607    jp      p,$0796
079d 3a9001    ld      a,($0190)
07a0 05        dec     b
07a1 f29607    jp      p,$0796
07a4 e1        pop     hl
07a5 eb        ex      de,hl
07a6 2a8c02    ld      hl,($028c)
07a9 220402    ld      ($0204),hl
07ac 7b        ld      a,e
07ad 95        sub     l
07ae 6f        ld      l,a
07af 7a        ld      a,d
07b0 9c        sbc     a,h
07b1 67        ld      h,a
07b2 228e02    ld      ($028e),hl
07b5 cd6a14    call    $146a
07b8 d5        push    de
07b9 2a2801    ld      hl,($0128)
07bc e5        push    hl
07bd 01ff03    ld      bc,$03ff
07c0 110904    ld      de,$0409
07c3 cd1201    call    $0112
07c6 210000    ld      hl,$0000
07c9 e5        push    hl
07ca 39        add     hl,sp
07cb 229a02    ld      ($029a),hl
07ce 2a2502    ld      hl,($0225)
07d1 eb        ex      de,hl
07d2 3a5f01    ld      a,($015f)
07d5 47        ld      b,a
07d6 3a0602    ld      a,($0206)
07d9 b0        or      b
07da ccef07    call    z,$07ef
07dd c4e307    call    nz,$07e3
07e0 c31e08    jp      $081e
07e3 21f707    ld      hl,$07f7
07e6 3ec3      ld      a,$c3
07e8 322308    ld      ($0823),a
07eb 222408    ld      ($0824),hl
07ee c9        ret     

07ef 215808    ld      hl,$0858
07f2 3ed2      ld      a,$d2
07f4 c3e807    jp      $07e8
07f7 3a0602    ld      a,($0206)
07fa b7        or      a
07fb ca5879    jp      z,$7958
07fe c32a74    jp      $742a
0801 13        inc     de
0802 87        add     a,a
0803 d25808    jp      nc,$0858
0806 c32608    jp      $0826
0809 e1        pop     hl
080a f1        pop     af
080b c21808    jp      nz,$0818
080e d5        push    de
080f 011d08    ld      bc,$081d
0812 c5        push    bc
0813 e9        jp      (hl)
0814 13        inc     de
0815 13        inc     de
0816 13        inc     de
0817 13        inc     de
0818 f5        push    af
0819 1a        ld      a,(de)
081a c32108    jp      $0821
081d d1        pop     de
081e af        xor     a
081f 1a        ld      a,(de)
0820 f5        push    af
0821 13        inc     de
0822 87        add     a,a
0823 d25808    jp      nc,$0858
0826 feb0      cp      $b0
0828 caf50f    jp      z,$0ff5
082b fea4      cp      $a4
082d caf610    jp      z,$10f6
0830 fe80      cp      $80
0832 ca940f    jp      z,$0f94
0835 fea0      cp      $a0
0837 ca2610    jp      z,$1026
083a 4f        ld      c,a
083b 0600      ld      b,$00
083d 218c04    ld      hl,$048c
0840 09        add     hl,bc
0841 7e        ld      a,(hl)
0842 23        inc     hl
0843 66        ld      h,(hl)
0844 6f        ld      l,a
0845 af        xor     a
0846 e9        jp      (hl)
0847 214102    ld      hl,$0241
084a 3600      ld      (hl),$00
084c ca5008    jp      z,$0850
084f 77        ld      (hl),a
0850 1b        dec     de
0851 1b        dec     de
0852 210000    ld      hl,$0000
0855 c3f20c    jp      $0cf2
0858 87        add     a,a
0859 da6208    jp      c,$0862
085c fa9308    jp      m,$0893
085f c37808    jp      $0878
0862 62        ld      h,d
0863 6b        ld      l,e
0864 13        inc     de
0865 07        rlca    
0866 07        rlca    
0867 07        rlca    
0868 d26c08    jp      nc,$086c
086b 13        inc     de
086c faad08    jp      m,$08ad
086f f1        pop     af
0870 c21708    jp      nz,$0817
0873 0600      ld      b,$00
0875 c38608    jp      $0886
0878 f1        pop     af
0879 c21608    jp      nz,$0816
087c eb        ex      de,hl
087d 4e        ld      c,(hl)
087e 23        inc     hl
087f eb        ex      de,hl
0880 0600      ld      b,$00
0882 2a1f02    ld      hl,($021f)
0885 09        add     hl,bc
0886 e5        push    hl
0887 eb        ex      de,hl
0888 4e        ld      c,(hl)
0889 23        inc     hl
088a eb        ex      de,hl
088b 2a1f02    ld      hl,($021f)
088e 09        add     hl,bc
088f c1        pop     bc
0890 c3d008    jp      $08d0
0893 1a        ld      a,(de)
0894 13        inc     de
0895 47        ld      b,a
0896 1a        ld      a,(de)
0897 13        inc     de
0898 4f        ld      c,a
0899 2a2d02    ld      hl,($022d)
089c 09        add     hl,bc
089d d2a908    jp      nc,$08a9
08a0 f1        pop     af
08a1 f5        push    af
08a2 cd4708    call    $0847
08a5 c5        push    bc
08a6 c3ae08    jp      $08ae
08a9 2a1d02    ld      hl,($021d)
08ac 09        add     hl,bc
08ad e5        push    hl
08ae 1a        ld      a,(de)
08af 13        inc     de
08b0 47        ld      b,a
08b1 1a        ld      a,(de)
08b2 13        inc     de
08b3 4f        ld      c,a
08b4 2a2d02    ld      hl,($022d)
08b7 09        add     hl,bc
08b8 d2c708    jp      nc,$08c7
08bb e1        pop     hl
08bc f1        pop     af
08bd f5        push    af
08be e5        push    hl
08bf cd4708    call    $0847
08c2 60        ld      h,b
08c3 69        ld      l,c
08c4 c3cb08    jp      $08cb
08c7 2a1d02    ld      hl,($021d)
08ca 09        add     hl,bc
08cb c1        pop     bc
08cc f1        pop     af
08cd c21808    jp      nz,$0818
08d0 e60f      and     $0f
08d2 ca1309    jp      z,$0913
08d5 fe08      cp      $08
08d7 ca0f09    jp      z,$090f
08da d2ee08    jp      nc,$08ee
08dd fe04      cp      $04
08df ca2f09    jp      z,$092f
08e2 da1f09    jp      c,$091f
08e5 fe05      cp      $05
08e7 c25809    jp      nz,$0958
08ea 37        scf     
08eb c30809    jp      $0908
08ee fe0c      cp      $0c
08f0 ca2809    jp      z,$0928
08f3 da1809    jp      c,$0918
08f6 fe0d      cp      $0d
08f8 c23509    jp      nz,$0935
08fb 03        inc     bc
08fc 0a        ld      a,(bc)
08fd d601      sub     $01
08ff da0709    jp      c,$0907
0902 23        inc     hl
0903 96        sub     (hl)
0904 2f        cpl     
0905 77        ld      (hl),a
0906 2b        dec     hl
0907 0b        dec     bc
0908 0a        ld      a,(bc)
0909 2f        cpl     
090a 8e        adc     a,(hl)
090b 77        ld      (hl),a
090c c31e08    jp      $081e
090f 0a        ld      a,(bc)
0910 77        ld      (hl),a
0911 03        inc     bc
0912 23        inc     hl
0913 0a        ld      a,(bc)
0914 77        ld      (hl),a
0915 c31e08    jp      $081e
0918 0a        ld      a,(bc)
0919 be        cp      (hl)
091a c22109    jp      nz,$0921
091d 03        inc     bc
091e 23        inc     hl
091f 0a        ld      a,(bc)
0920 be        cp      (hl)
0921 3f        ccf     
0922 cd990b    call    $0b99
0925 c31e08    jp      $081e
0928 03        inc     bc
0929 23        inc     hl
092a 0a        ld      a,(bc)
092b 86        add     a,(hl)
092c 77        ld      (hl),a
092d 0b        dec     bc
092e 2b        dec     hl
092f 0a        ld      a,(bc)
0930 8e        adc     a,(hl)
0931 77        ld      (hl),a
0932 c31e08    jp      $081e
0935 d5        push    de
0936 e5        push    hl
0937 69        ld      l,c
0938 60        ld      h,b
0939 c1        pop     bc
093a c5        push    bc
093b 46        ld      b,(hl)
093c 23        inc     hl
093d 4e        ld      c,(hl)
093e e1        pop     hl
093f e5        push    hl
0940 56        ld      d,(hl)
0941 23        inc     hl
0942 5e        ld      e,(hl)
0943 cd4d09    call    $094d
0946 e1        pop     hl
0947 72        ld      (hl),d
0948 23        inc     hl
0949 73        ld      (hl),e
094a c31d08    jp      $081d
094d e601      and     $01
094f f5        push    af
0950 cc300b    call    z,$0b30
0953 f1        pop     af
0954 c4530b    call    nz,$0b53
0957 c9        ret     

0958 d5        push    de
0959 e5        push    hl
095a 69        ld      l,c
095b 60        ld      h,b
095c c1        pop     bc
095d c5        push    bc
095e 1600      ld      d,$00
0960 0600      ld      b,$00
0962 4e        ld      c,(hl)
0963 e1        pop     hl
0964 e5        push    hl
0965 5e        ld      e,(hl)
0966 cd4d09    call    $094d
0969 e1        pop     hl
096a c34909    jp      $0949
096d 1a        ld      a,(de)
096e fedc      cp      $dc
0970 3e00      ld      a,$00
0972 da8809    jp      c,$0988
0975 42        ld      b,d
0976 4b        ld      c,e
0977 13        inc     de
0978 f1        pop     af
0979 c21808    jp      nz,$0818
097c d5        push    de
097d 0b        dec     bc
097e 116303    ld      de,$0363
0981 cd0901    call    $0109
0984 c31d08    jp      $081d
0987 3c        inc     a
0988 3c        inc     a
0989 47        ld      b,a
098a 6f        ld      l,a
098b 2600      ld      h,$00
098d 19        add     hl,de
098e eb        ex      de,hl
098f f1        pop     af
0990 c21608    jp      nz,$0816
0993 13        inc     de
0994 13        inc     de
0995 d5        push    de
0996 2b        dec     hl
0997 e5        push    hl
0998 2a1d02    ld      hl,($021d)
099b 05        dec     b
099c 05        dec     b
099d faa309    jp      m,$09a3
09a0 1b        dec     de
09a1 1a        ld      a,(de)
09a2 77        ld      (hl),a
09a3 1b        dec     de
09a4 1a        ld      a,(de)
09a5 4f        ld      c,a
09a6 1b        dec     de
09a7 1a        ld      a,(de)
09a8 47        ld      b,a
09a9 09        add     hl,bc
09aa 3630      ld      (hl),$30
09ac eb        ex      de,hl
09ad c1        pop     bc
09ae d5        push    de
09af cd0c01    call    $010c
09b2 d1        pop     de
09b3 210200    ld      hl,$0002
09b6 19        add     hl,de
09b7 d5        push    de
09b8 eb        ex      de,hl
09b9 210000    ld      hl,$0000
09bc cdf20c    call    $0cf2
09bf 60        ld      h,b
09c0 69        ld      l,c
09c1 d1        pop     de
09c2 1a        ld      a,(de)
09c3 13        inc     de
09c4 77        ld      (hl),a
09c5 fe39      cp      $39
09c7 23        inc     hl
09c8 1a        ld      a,(de)
09c9 1b        dec     de
09ca 77        ld      (hl),a
09cb c2d909    jp      nz,$09d9
09ce 4f        ld      c,a
09cf 210600    ld      hl,$0006
09d2 19        add     hl,de
09d3 7e        ld      a,(hl)
09d4 b7        or      a
09d5 79        ld      a,c
09d6 f2440c    jp      p,$0c44
09d9 210700    ld      hl,$0007
09dc 19        add     hl,de
09dd 7e        ld      a,(hl)
09de 3c        inc     a
09df 2a1d02    ld      hl,($021d)
09e2 77        ld      (hl),a
09e3 c31d08    jp      $081d
09e6 cd0908    call    $0809
09e9 3a9d02    ld      a,($029d)
09ec b7        or      a
09ed caf709    jp      z,$09f7
09f0 3a4b02    ld      a,($024b)
09f3 b7        or      a
09f4 c44d56    call    nz,$564d
09f7 2a1d02    ld      hl,($021d)
09fa eb        ex      de,hl
09fb 2aa202    ld      hl,($02a2)
09fe 19        add     hl,de
09ff 7e        ld      a,(hl)
0a00 cd8614    call    $1486
0a03 7e        ld      a,(hl)
0a04 e6bf      and     $bf
0a06 77        ld      (hl),a
0a07 cd9211    call    $1192
0a0a 21d102    ld      hl,$02d1
0a0d 110500    ld      de,$0005
0a10 46        ld      b,(hl)
0a11 23        inc     hl
0a12 0e00      ld      c,$00
0a14 7e        ld      a,(hl)
0a15 07        rlca    
0a16 da2c0a    jp      c,$0a2c
0a19 07        rlca    
0a1a d22c0a    jp      nc,$0a2c
0a1d 07        rlca    
0a1e 07        rlca    
0a1f 07        rlca    
0a20 da2c0a    jp      c,$0a2c
0a23 e5        push    hl
0a24 d5        push    de
0a25 c5        push    bc
0a26 cd9537    call    $3795
0a29 c1        pop     bc
0a2a d1        pop     de
0a2b e1        pop     hl
0a2c 19        add     hl,de
0a2d 0c        inc     c
0a2e 05        dec     b
0a2f c2140a    jp      nz,$0a14
0a32 cdec17    call    $17ec
0a35 019403    ld      bc,$0394
0a38 cd1801    call    $0118
0a3b c9        ret     

0a3c 3ea4      ld      a,$a4
0a3e c32c0c    jp      $0c2c
0a41 cde60d    call    $0de6
0a44 1a        ld      a,(de)
0a45 13        inc     de
0a46 4f        ld      c,a
0a47 32eb03    ld      ($03eb),a
0a4a 87        add     a,a
0a4b 6f        ld      l,a
0a4c 2600      ld      h,$00
0a4e 19        add     hl,de
0a4f eb        ex      de,hl
0a50 f1        pop     af
0a51 c21808    jp      nz,$0818
0a54 e5        push    hl
0a55 210000    ld      hl,$0000
0a58 39        add     hl,sp
0a59 220b02    ld      ($020b),hl
0a5c eb        ex      de,hl
0a5d e3        ex      (sp),hl
0a5e eb        ex      de,hl
0a5f 21ffff    ld      hl,$ffff
0a62 e5        push    hl
0a63 69        ld      l,c
0a64 2c        inc     l
0a65 2d        dec     l
0a66 ca760a    jp      z,$0a76
0a69 e5        push    hl
0a6a 210000    ld      hl,$0000
0a6d cdf20c    call    $0cf2
0a70 60        ld      h,b
0a71 69        ld      l,c
0a72 e3        ex      (sp),hl
0a73 c3650a    jp      $0a65
0a76 3aeb03    ld      a,($03eb)
0a79 f5        push    af
0a7a cd8b0b    call    $0b8b
0a7d 2a5a02    ld      hl,($025a)
0a80 3a5102    ld      a,($0251)
0a83 47        ld      b,a
0a84 4f        ld      c,a
0a85 54        ld      d,h
0a86 5d        ld      e,l
0a87 1a        ld      a,(de)
0a88 13        inc     de
0a89 fe30      cp      $30
0a8b daa60a    jp      c,$0aa6
0a8e fe3a      cp      $3a
0a90 d2a60a    jp      nc,$0aa6
0a93 05        dec     b
0a94 c2870a    jp      nz,$0a87
0a97 79        ld      a,c
0a98 cd100c    call    $0c10
0a9b 7b        ld      a,e
0a9c 15        dec     d
0a9d fab70a    jp      m,$0ab7
0aa0 2a9802    ld      hl,($0298)
0aa3 c3ba0a    jp      $0aba
0aa6 0d        dec     c
0aa7 c24337    jp      nz,$3743
0aaa 7e        ld      a,(hl)
0aab 2a9802    ld      hl,($0298)
0aae b7        or      a
0aaf faba0a    jp      m,$0aba
0ab2 fe20      cp      $20
0ab4 d24337    jp      nc,$3743
0ab7 2a8d01    ld      hl,($018d)
0aba e67f      and     $7f
0abc 34        inc     (hl)
0abd be        cp      (hl)
0abe d23c0a    jp      nc,$0a3c
0ac1 35        dec     (hl)
0ac2 23        inc     hl
0ac3 87        add     a,a
0ac4 5f        ld      e,a
0ac5 1600      ld      d,$00
0ac7 19        add     hl,de
0ac8 5e        ld      e,(hl)
0ac9 23        inc     hl
0aca 56        ld      d,(hl)
0acb eb        ex      de,hl
0acc 22ec03    ld      ($03ec),hl
0acf 01ffff    ld      bc,$ffff
0ad2 50        ld      d,b
0ad3 59        ld      e,c
0ad4 f1        pop     af
0ad5 3d        dec     a
0ad6 fade0a    jp      m,$0ade
0ad9 cadd0a    jp      z,$0add
0adc d1        pop     de
0add c1        pop     bc
0ade 21e60a    ld      hl,$0ae6
0ae1 e5        push    hl
0ae2 2aec03    ld      hl,($03ec)
0ae5 e9        jp      (hl)
0ae6 2a0b02    ld      hl,($020b)
0ae9 f9        ld      sp,hl
0aea c31d08    jp      $081d
0aed e1        pop     hl
0aee 22eb03    ld      ($03eb),hl
0af1 60        ld      h,b
0af2 69        ld      l,c
0af3 1a        ld      a,(de)
0af4 4f        ld      c,a
0af5 56        ld      d,(hl)
0af6 23        inc     hl
0af7 5e        ld      e,(hl)
0af8 1b        dec     de
0af9 e1        pop     hl
0afa 19        add     hl,de
0afb eb        ex      de,hl
0afc e1        pop     hl
0afd 46        ld      b,(hl)
0afe e1        pop     hl
0aff 7e        ld      a,(hl)
0b00 23        inc     hl
0b01 6e        ld      l,(hl)
0b02 67        ld      h,a
0b03 eb        ex      de,hl
0b04 1b        dec     de
0b05 e3        ex      (sp),hl
0b06 19        add     hl,de
0b07 d1        pop     de
0b08 e5        push    hl
0b09 2aeb03    ld      hl,($03eb)
0b0c e3        ex      (sp),hl
0b0d 0c        inc     c
0b0e 0d        dec     c
0b0f c8        ret     z

0b10 78        ld      a,b
0b11 b7        or      a
0b12 3e20      ld      a,$20
0b14 ca1a0b    jp      z,$0b1a
0b17 05        dec     b
0b18 7e        ld      a,(hl)
0b19 23        inc     hl
0b1a 12        ld      (de),a
0b1b 13        inc     de
0b1c c30e0b    jp      $0b0e
0b1f 79        ld      a,c
0b20 cd3f0b    call    $0b3f
0b23 e5        push    hl
0b24 6f        ld      l,a
0b25 78        ld      a,b
0b26 45        ld      b,l
0b27 cd3f0b    call    $0b3f
0b2a d1        pop     de
0b2b 4a        ld      c,d
0b2c 09        add     hl,bc
0b2d ce00      adc     a,$00
0b2f c9        ret     

0b30 79        ld      a,c
0b31 cd3f0b    call    $0b3f
0b34 e5        push    hl
0b35 6f        ld      l,a
0b36 78        ld      a,b
0b37 cd3f0b    call    $0b3f
0b3a d1        pop     de
0b3b 7a        ld      a,d
0b3c 85        add     a,l
0b3d 57        ld      d,a
0b3e c9        ret     

0b3f 0e08      ld      c,$08
0b41 210000    ld      hl,$0000
0b44 b7        or      a
0b45 c8        ret     z

0b46 29        add     hl,hl
0b47 17        rla     
0b48 d24e0b    jp      nc,$0b4e
0b4b 19        add     hl,de
0b4c ce00      adc     a,$00
0b4e 0d        dec     c
0b4f c2460b    jp      nz,$0b46
0b52 c9        ret     

0b53 210000    ld      hl,$0000
0b56 3e10      ld      a,$10
0b58 f5        push    af
0b59 29        add     hl,hl
0b5a f5        push    af
0b5b eb        ex      de,hl
0b5c 29        add     hl,hl
0b5d eb        ex      de,hl
0b5e d2620b    jp      nc,$0b62
0b61 23        inc     hl
0b62 13        inc     de
0b63 7d        ld      a,l
0b64 91        sub     c
0b65 6f        ld      l,a
0b66 7c        ld      a,h
0b67 98        sbc     a,b
0b68 67        ld      h,a
0b69 d2730b    jp      nc,$0b73
0b6c f1        pop     af
0b6d f5        push    af
0b6e da730b    jp      c,$0b73
0b71 1b        dec     de
0b72 09        add     hl,bc
0b73 f1        pop     af
0b74 f1        pop     af
0b75 3d        dec     a
0b76 c2580b    jp      nz,$0b58
0b79 c9        ret     

0b7a cd7e0b    call    $0b7e
0b7d 19        add     hl,de
0b7e af        xor     a
0b7f 95        sub     l
0b80 6f        ld      l,a
0b81 9c        sbc     a,h
0b82 95        sub     l
0b83 67        ld      h,a
0b84 c9        ret     

0b85 2a1d02    ld      hl,($021d)
0b88 3600      ld      (hl),$00
0b8a c9        ret     

0b8b 2a9602    ld      hl,($0296)
0b8e 39        add     hl,sp
0b8f d8        ret     c

0b90 af        xor     a
0b91 320602    ld      ($0206),a
0b94 3e9a      ld      a,$9a
0b96 c3430c    jp      $0c43
0b99 3e01      ld      a,$01
0b9b caa20b    jp      z,$0ba2
0b9e d2a30b    jp      nc,$0ba3
0ba1 87        add     a,a
0ba2 87        add     a,a
0ba3 324502    ld      ($0245),a
0ba6 c9        ret     

0ba7 0c        inc     c
0ba8 0d        dec     c
0ba9 c8        ret     z

0baa 1a        ld      a,(de)
0bab 77        ld      (hl),a
0bac 13        inc     de
0bad 23        inc     hl
0bae c3a80b    jp      $0ba8
0bb1 79        ld      a,c
0bb2 b0        or      b
0bb3 c8        ret     z

0bb4 1a        ld      a,(de)
0bb5 77        ld      (hl),a
0bb6 13        inc     de
0bb7 23        inc     hl
0bb8 0b        dec     bc
0bb9 c3b10b    jp      $0bb1
0bbc 0c        inc     c
0bbd 0d        dec     c
0bbe c8        ret     z

0bbf 1a        ld      a,(de)
0bc0 be        cp      (hl)
0bc1 c0        ret     nz

0bc2 13        inc     de
0bc3 23        inc     hl
0bc4 c3bd0b    jp      $0bbd
0bc7 3e20      ld      a,$20
0bc9 0c        inc     c
0bca 0d        dec     c
0bcb c8        ret     z

0bcc 77        ld      (hl),a
0bcd 23        inc     hl
0bce c3ca0b    jp      $0bca
0bd1 1600      ld      d,$00
0bd3 d606      sub     $06
0bd5 2f        cpl     
0bd6 328c05    ld      ($058c),a
0bd9 010000    ld      bc,$0000
0bdc c5        push    bc
0bdd 01f6ff    ld      bc,$fff6
0be0 c5        push    bc
0be1 019cff    ld      bc,$ff9c
0be4 c5        push    bc
0be5 0118fc    ld      bc,$fc18
0be8 c5        push    bc
0be9 01f0d8    ld      bc,$d8f0
0bec e5        push    hl
0bed 3e2f      ld      a,$2f
0bef eb        ex      de,hl
0bf0 3c        inc     a
0bf1 eb        ex      de,hl
0bf2 60        ld      h,b
0bf3 69        ld      l,c
0bf4 19        add     hl,de
0bf5 daf00b    jp      c,$0bf0
0bf8 e1        pop     hl
0bf9 77        ld      (hl),a
0bfa 3a8c05    ld      a,($058c)
0bfd 3d        dec     a
0bfe 328c05    ld      ($058c),a
0c01 f2050c    jp      p,$0c05
0c04 23        inc     hl
0c05 c1        pop     bc
0c06 78        ld      a,b
0c07 b1        or      c
0c08 c2ec0b    jp      nz,$0bec
0c0b 3e30      ld      a,$30
0c0d 83        add     a,e
0c0e 77        ld      (hl),a
0c0f c9        ret     

0c10 eb        ex      de,hl
0c11 210000    ld      hl,$0000
0c14 f5        push    af
0c15 29        add     hl,hl
0c16 44        ld      b,h
0c17 4d        ld      c,l
0c18 29        add     hl,hl
0c19 29        add     hl,hl
0c1a 09        add     hl,bc
0c1b 1a        ld      a,(de)
0c1c 13        inc     de
0c1d e60f      and     $0f
0c1f 0600      ld      b,$00
0c21 4f        ld      c,a
0c22 09        add     hl,bc
0c23 f1        pop     af
0c24 3d        dec     a
0c25 c2140c    jp      nz,$0c14
0c28 eb        ex      de,hl
0c29 c9        ret     

0c2a 3ea1      ld      a,$a1
0c2c 2a0b02    ld      hl,($020b)
0c2f 47        ld      b,a
0c30 7c        ld      a,h
0c31 b5        or      l
0c32 78        ld      a,b
0c33 2a2502    ld      hl,($0225)
0c36 e5        push    hl
0c37 ca440c    jp      z,$0c44
0c3a 2a0b02    ld      hl,($020b)
0c3d f9        ld      sp,hl
0c3e c3440c    jp      $0c44
0c41 3ea1      ld      a,$a1

0c43 d5        push    de
0c44 f5        push    af
0c45 3a0602    ld      a,($0206)
0c48 b7        or      a
0c49 ca580c    jp      z,$0c58
0c4c 116075    ld      de,$7560
0c4f 010a00    ld      bc,$000a
0c52 cda014    call    $14a0
0c55 c21d74    jp      nz,$741d
0c58 2a1d02    ld      hl,($021d)
0c5b eb        ex      de,hl
0c5c 2a9e02    ld      hl,($029e)
0c5f 19        add     hl,de
0c60 e5        push    hl
0c61 1e32      ld      e,$32
0c63 3e20      ld      a,$20
0c65 010000    ld      bc,$0000
0c68 be        cp      (hl)
0c69 ca720c    jp      z,$0c72
0c6c 23        inc     hl
0c6d 03        inc     bc
0c6e 1d        dec     e
0c6f c2680c    jp      nz,$0c68
0c72 d1        pop     de
0c73 cdf217    call    $17f2
0c76 11b005    ld      de,$05b0
0c79 010200    ld      bc,$0002
0c7c cdf217    call    $17f2	; Print PI.INT
0c7f f1        pop     af
0c80 d1        pop     de
0c81 1b        dec     de
0c82 2a3402    ld      hl,($0234)
0c85 19        add     hl,de
0c86 eb        ex      de,hl
0c87 d5        push    de
0c88 f5        push    af
0c89 2a0202    ld      hl,($0202)
0c8c 7b        ld      a,e
0c8d 95        sub     l
0c8e 7a        ld      a,d
0c8f 9c        sbc     a,h
0c90 da9f0c    jp      c,$0c9f
0c93 3a0802    ld      a,($0208)
0c96 5f        ld      e,a
0c97 3e02      ld      a,$02
0c99 219605    ld      hl,$0596
0c9c cdd10b    call    $0bd1   
0c9f 118d05    ld      de,$058d
0ca2 010b00    ld      bc,$000b
0ca5 cdf217    call    $17f2	; print SEGMENT ---> XXX
0ca8 f1        pop     af
0ca9 5f        ld      e,a
0caa 3e03      ld      a,$03
0cac 219e05    ld      hl,$059e
0caf cdd10b    call    $0bd1
0cb2 d1        pop     de
0cb3 7a        ld      a,d
0cb4 21ac05    ld      hl,$05ac
0cb7 cdcd0c    call    $0ccd
0cba 7b        ld      a,e
0cbb cdcd0c    call    $0ccd
0cbe 119805    ld      de,$0598
0cc1 011800    ld      bc,$0018
0cc4 cdf217    call    $17f2	; print ERROR 183	COBOL
0cc7 cdec17    call    $17ec	; print PC 8A5B
0cca cd1801    call    $0118	; exit to CP/M
0ccd 47        ld      b,a
0cce 0f        rrca    
0ccf 0f        rrca    
0cd0 0f        rrca    
0cd1 0f        rrca    
0cd2 cdd60c    call    $0cd6
0cd5 78        ld      a,b
0cd6 e60f      and     $0f
0cd8 c690      add     a,$90
0cda 27        daa     
0cdb ce40      adc     a,$40
0cdd 27        daa     
0cde 77        ld      (hl),a
0cdf 23        inc     hl
0ce0 c9        ret     

0ce1 e620      and     $20
0ce3 c2f20c    jp      nz,$0cf2
0ce6 1a        ld      a,(de)
0ce7 13        inc     de
0ce8 e5        push    hl
0ce9 0600      ld      b,$00
0ceb 4f        ld      c,a
0cec 2a1f02    ld      hl,($021f)
0cef c35b0d    jp      $0d5b
0cf2 eb        ex      de,hl
0cf3 46        ld      b,(hl)
0cf4 23        inc     hl
0cf5 4e        ld      c,(hl)
0cf6 23        inc     hl
0cf7 eb        ex      de,hl
0cf8 e5        push    hl
0cf9 2a0402    ld      hl,($0204)
0cfc 78        ld      a,b
0cfd b7        or      a
0cfe fa820d    jp      m,$0d82
0d01 03        inc     bc
0d02 78        ld      a,b
0d03 b7        or      a
0d04 fa5c0d    jp      m,$0d5c
0d07 0b        dec     bc
0d08 2a2d02    ld      hl,($022d)
0d0b 09        add     hl,bc
0d0c 2a1d02    ld      hl,($021d)
0d0f d25b0d    jp      nc,$0d5b
0d12 d5        push    de
0d13 eb        ex      de,hl
0d14 2a2f02    ld      hl,($022f)
0d17 09        add     hl,bc
0d18 d2230d    jp      nc,$0d23
0d1b 2a3102    ld      hl,($0231)
0d1e 19        add     hl,de
0d1f d1        pop     de
0d20 c35b0d    jp      $0d5b
0d23 2a2302    ld      hl,($0223)
0d26 3a3302    ld      a,($0233)
0d29 32b205    ld      ($05b2),a
0d2c e5        push    hl
0d2d 56        ld      d,(hl)
0d2e 23        inc     hl
0d2f 5e        ld      e,(hl)
0d30 23        inc     hl
0d31 e3        ex      (sp),hl
0d32 79        ld      a,c
0d33 93        sub     e
0d34 78        ld      a,b
0d35 9a        sbc     a,d
0d36 da510d    jp      c,$0d51
0d39 67        ld      h,a
0d3a 79        ld      a,c
0d3b 93        sub     e
0d3c 6f        ld      l,a
0d3d b4        or      h
0d3e e3        ex      (sp),hl
0d3f ca560d    jp      z,$0d56
0d42 23        inc     hl
0d43 23        inc     hl
0d44 3ab205    ld      a,($05b2)
0d47 3d        dec     a
0d48 32b205    ld      ($05b2),a
0d4b c22d0d    jp      nz,$0d2d
0d4e c3540d    jp      $0d54
0d51 e3        ex      (sp),hl
0d52 2b        dec     hl
0d53 2b        dec     hl
0d54 2b        dec     hl
0d55 2b        dec     hl
0d56 4e        ld      c,(hl)
0d57 23        inc     hl
0d58 46        ld      b,(hl)
0d59 e1        pop     hl
0d5a d1        pop     de
0d5b 09        add     hl,bc
0d5c 44        ld      b,h
0d5d 4d        ld      c,l
0d5e e1        pop     hl
0d5f 7c        ld      a,h
0d60 b5        or      l
0d61 c8        ret     z

0d62 d5        push    de
0d63 5e        ld      e,(hl)
0d64 23        inc     hl
0d65 56        ld      d,(hl)
0d66 23        inc     hl
0d67 eb        ex      de,hl
0d68 09        add     hl,bc
0d69 44        ld      b,h
0d6a 4d        ld      c,l
0d6b eb        ex      de,hl
0d6c 7e        ld      a,(hl)
0d6d b7        or      a
0d6e c2770d    jp      nz,$0d77
0d71 2b        dec     hl
0d72 77        ld      (hl),a
0d73 2b        dec     hl
0d74 77        ld      (hl),a
0d75 23        inc     hl
0d76 23        inc     hl
0d77 af        xor     a
0d78 77        ld      (hl),a
0d79 23        inc     hl
0d7a 23        inc     hl
0d7b 23        inc     hl
0d7c 71        ld      (hl),c
0d7d 23        inc     hl
0d7e 70        ld      (hl),b
0d7f 23        inc     hl
0d80 d1        pop     de
0d81 c9        ret     

0d82 a1        and     c
0d83 3c        inc     a
0d84 ca8f0d    jp      z,$0d8f
0d87 78        ld      a,b
0d88 e67f      and     $7f
0d8a 47        ld      b,a
0d8b 2a1d02    ld      hl,($021d)
0d8e 09        add     hl,bc
0d8f e5        push    hl
0d90 eb        ex      de,hl
0d91 46        ld      b,(hl)
0d92 23        inc     hl
0d93 4e        ld      c,(hl)
0d94 23        inc     hl
0d95 c5        push    bc
0d96 46        ld      b,(hl)
0d97 23        inc     hl
0d98 4e        ld      c,(hl)
0d99 23        inc     hl
0d9a c5        push    bc
0d9b 7e        ld      a,(hl)
0d9c 23        inc     hl
0d9d fe04      cp      $04
0d9f f2ad0d    jp      p,$0dad
0da2 0600      ld      b,$00
0da4 4e        ld      c,(hl)
0da5 23        inc     hl
0da6 eb        ex      de,hl
0da7 2a1f02    ld      hl,($021f)
0daa c3b50d    jp      $0db5
0dad 46        ld      b,(hl)
0dae 23        inc     hl
0daf 4e        ld      c,(hl)
0db0 23        inc     hl
0db1 eb        ex      de,hl
0db2 2a1d02    ld      hl,($021d)
0db5 09        add     hl,bc
0db6 e602      and     $02
0db8 0600      ld      b,$00
0dba cabf0d    jp      z,$0dbf
0dbd 46        ld      b,(hl)
0dbe 23        inc     hl
0dbf 4e        ld      c,(hl)
0dc0 0b        dec     bc
0dc1 e1        pop     hl
0dc2 3a4102    ld      a,($0241)
0dc5 b7        or      a
0dc6 c2d80d    jp      nz,$0dd8
0dc9 2b        dec     hl
0dca 7d        ld      a,l
0dcb b4        or      h
0dcc cad80d    jp      z,$0dd8
0dcf 7d        ld      a,l
0dd0 91        sub     c
0dd1 7c        ld      a,h
0dd2 98        sbc     a,b
0dd3 3e99      ld      a,$99
0dd5 da430c    jp      c,$0c43
0dd8 e1        pop     hl
0dd9 7d        ld      a,l
0dda 210000    ld      hl,$0000
0ddd 09        add     hl,bc
0dde 3d        dec     a
0ddf c2dd0d    jp      nz,$0ddd
0de2 c1        pop     bc
0de3 c35b0d    jp      $0d5b
0de6 215002    ld      hl,$0250
0de9 c3ef0d    jp      $0def
0dec 215e02    ld      hl,$025e
0def 3608      ld      (hl),$08
0df1 23        inc     hl
0df2 1a        ld      a,(de)
0df3 13        inc     de
0df4 f5        push    af
0df5 e61f      and     $1f
0df7 47        ld      b,a
0df8 1a        ld      a,(de)
0df9 13        inc     de
0dfa 4f        ld      c,a
0dfb f1        pop     af
0dfc 17        rla     
0dfd f5        push    af
0dfe da050e    jp      c,$0e05
0e01 1b        dec     de
0e02 48        ld      c,b
0e03 0600      ld      b,$00
0e05 03        inc     bc
0e06 71        ld      (hl),c
0e07 23        inc     hl
0e08 70        ld      (hl),b
0e09 23        inc     hl
0e0a 3612      ld      (hl),$12
0e0c 23        inc     hl
0e0d 3620      ld      (hl),$20
0e0f f1        pop     af
0e10 b7        or      a
0e11 fa230e    jp      m,$0e23
0e14 23        inc     hl
0e15 c5        push    bc
0e16 0f        rrca    
0e17 cde10c    call    $0ce1
0e1a eb        ex      de,hl
0e1b e3        ex      (sp),hl
0e1c 09        add     hl,bc
0e1d eb        ex      de,hl
0e1e 73        ld      (hl),e
0e1f 23        inc     hl
0e20 72        ld      (hl),d
0e21 d1        pop     de
0e22 c9        ret     

0e23 17        rla     
0e24 b7        or      a
0e25 f22a0e    jp      p,$0e2a
0e28 1a        ld      a,(de)
0e29 77        ld      (hl),a
0e2a d5        push    de
0e2b 110600    ld      de,$0006
0e2e 19        add     hl,de
0e2f d1        pop     de
0e30 73        ld      (hl),e
0e31 23        inc     hl
0e32 72        ld      (hl),d
0e33 23        inc     hl
0e34 eb        ex      de,hl
0e35 09        add     hl,bc
0e36 eb        ex      de,hl
0e37 73        ld      (hl),e
0e38 23        inc     hl
0e39 72        ld      (hl),d
0e3a c9        ret     

0e3b 2a5f02    ld      hl,($025f)
0e3e 44        ld      b,h
0e3f 4d        ld      c,l
0e40 eb        ex      de,hl
0e41 2a5102    ld      hl,($0251)
0e44 7c        ld      a,h
0e45 ba        cp      d
0e46 c24b0e    jp      nz,$0e4b
0e49 7d        ld      a,l
0e4a bb        cp      e
0e4b d2500e    jp      nc,$0e50
0e4e 44        ld      b,h
0e4f 4d        ld      c,l
0e50 2a5a02    ld      hl,($025a)
0e53 eb        ex      de,hl
0e54 2a6802    ld      hl,($0268)
0e57 c9        ret     

0e58 f1        pop     af
0e59 f5        push    af
0e5a c25e0e    jp      nz,$0e5e
0e5d af        xor     a
0e5e 324102    ld      ($0241),a
0e61 cde60d    call    $0de6
0e64 cdec0d    call    $0dec
0e67 cd0908    call    $0809
0e6a cd3b0e    call    $0e3b
0e6d d2b10b    jp      nc,$0bb1
0e70 cdb10b    call    $0bb1
0e73 eb        ex      de,hl
0e74 2a6a02    ld      hl,($026a)
0e77 eb        ex      de,hl
0e78 3a5402    ld      a,($0254)
0e7b 47        ld      b,a
0e7c 7d        ld      a,l
0e7d bb        cp      e
0e7e c2840e    jp      nz,$0e84
0e81 7c        ld      a,h
0e82 ba        cp      d
0e83 c8        ret     z

0e84 70        ld      (hl),b
0e85 23        inc     hl
0e86 c37c0e    jp      $0e7c
0e89 f1        pop     af
0e8a f5        push    af
0e8b c28f0e    jp      nz,$0e8f
0e8e af        xor     a
0e8f 324102    ld      ($0241),a
0e92 cde60d    call    $0de6
0e95 cdec0d    call    $0dec
0e98 cd0908    call    $0809
0e9b cd3b0e    call    $0e3b
0e9e eb        ex      de,hl
0e9f f5        push    af
0ea0 78        ld      a,b
0ea1 b1        or      c
0ea2 cab10e    jp      z,$0eb1
0ea5 0b        dec     bc
0ea6 1a        ld      a,(de)
0ea7 be        cp      (hl)
0ea8 23        inc     hl
0ea9 13        inc     de
0eaa caa00e    jp      z,$0ea0
0ead e1        pop     hl
0eae c3990b    jp      $0b99
0eb1 f1        pop     af
0eb2 ca990b    jp      z,$0b99
0eb5 d2d20e    jp      nc,$0ed2
0eb8 2a6a02    ld      hl,($026a)
0ebb 3a5402    ld      a,($0254)
0ebe 47        ld      b,a
0ebf 7d        ld      a,l
0ec0 bb        cp      e
0ec1 c2c90e    jp      nz,$0ec9
0ec4 7c        ld      a,h
0ec5 ba        cp      d
0ec6 ca990b    jp      z,$0b99
0ec9 1a        ld      a,(de)
0eca b8        cp      b
0ecb c2990b    jp      nz,$0b99
0ece 13        inc     de
0ecf c3bf0e    jp      $0ebf
0ed2 eb        ex      de,hl
0ed3 2a5c02    ld      hl,($025c)
0ed6 3a6202    ld      a,($0262)
0ed9 47        ld      b,a
0eda eb        ex      de,hl
0edb 7c        ld      a,h
0edc ba        cp      d
0edd c2e50e    jp      nz,$0ee5
0ee0 7d        ld      a,l
0ee1 bb        cp      e
0ee2 ca990b    jp      z,$0b99
0ee5 78        ld      a,b
0ee6 be        cp      (hl)
0ee7 c2990b    jp      nz,$0b99
0eea 23        inc     hl
0eeb c3db0e    jp      $0edb
0eee e5        push    hl
0eef d5        push    de
0ef0 2a0202    ld      hl,($0202)
0ef3 eb        ex      de,hl
0ef4 2a2502    ld      hl,($0225)
0ef7 19        add     hl,de
0ef8 d1        pop     de
0ef9 7d        ld      a,l
0efa 93        sub     e
0efb 7c        ld      a,h
0efc 9a        sbc     a,d
0efd e1        pop     hl
0efe c9        ret     

0eff 1a        ld      a,(de)
0f00 13        inc     de
0f01 47        ld      b,a
0f02 1a        ld      a,(de)
0f03 13        inc     de
0f04 4f        ld      c,a
0f05 78        ld      a,b
0f06 b7        or      a
0f07 f23b0f    jp      p,$0f3b
0f0a e67f      and     $7f
0f0c 47        ld      b,a
0f0d 2a2702    ld      hl,($0227)
0f10 09        add     hl,bc
0f11 46        ld      b,(hl)
0f12 23        inc     hl
0f13 4e        ld      c,(hl)
0f14 78        ld      a,b
0f15 b7        or      a
0f16 f23b0f    jp      p,$0f3b
0f19 e67f      and     $7f
0f1b 47        ld      b,a
0f1c 2a0002    ld      hl,($0200)
0f1f 09        add     hl,bc
0f20 3a0802    ld      a,($0208)
0f23 be        cp      (hl)
0f24 c22f0f    jp      nz,$0f2f
0f27 cdee0e    call    $0eee
0f2a 3e00      ld      a,$00
0f2c da330f    jp      c,$0f33
0f2f 7e        ld      a,(hl)
0f30 329002    ld      ($0290),a
0f33 23        inc     hl
0f34 46        ld      b,(hl)
0f35 23        inc     hl
0f36 4e        ld      c,(hl)
0f37 b7        or      a
0f38 c33c0f    jp      $0f3c
0f3b af        xor     a
0f3c 2a2502    ld      hl,($0225)
0f3f 09        add     hl,bc
0f40 c9        ret     

0f41 c608      add     a,$08
0f43 c608      add     a,$08
0f45 c608      add     a,$08
0f47 c6c2      add     a,$c2
0f49 32b305    ld      ($05b3),a
0f4c f1        pop     af
0f4d c21508    jp      nz,$0815
0f50 2a1f02    ld      hl,($021f)
0f53 1a        ld      a,(de)
0f54 13        inc     de
0f55 be        cp      (hl)
0f56 c3b305    jp      $05b3
0f59 c608      add     a,$08
0f5b c6d2      add     a,$d2
0f5d 32b305    ld      ($05b3),a
0f60 f1        pop     af
0f61 c21508    jp      nz,$0815
0f64 2a1f02    ld      hl,($021f)
0f67 1a        ld      a,(de)
0f68 13        inc     de
0f69 4f        ld      c,a
0f6a 7e        ld      a,(hl)
0f6b b9        cp      c
0f6c c3b305    jp      $05b3
0f6f 3c        inc     a
0f70 3c        inc     a
0f71 3c        inc     a
0f72 3c        inc     a
0f73 3c        inc     a
0f74 3c        inc     a
0f75 4f        ld      c,a
0f76 f1        pop     af
0f77 c2810f    jp      nz,$0f81
0f7a 3a4502    ld      a,($0245)
0f7d a1        and     c
0f7e c21e08    jp      nz,$081e
0f81 3c        inc     a
0f82 c31808    jp      $0818
0f85 f1        pop     af
0f86 c28d0f    jp      nz,$0f8d
0f89 af        xor     a
0f8a c3810f    jp      $0f81
0f8d 3d        dec     a
0f8e ca1e08    jp      z,$081e
0f91 c3810f    jp      $0f81
0f94 f1        pop     af
0f95 ca1e08    jp      z,$081e
0f98 3d        dec     a
0f99 ca1e08    jp      z,$081e
0f9c c31808    jp      $0818
0f9f f1        pop     af
0fa0 c1        pop     bc
0fa1 78        ld      a,b
0fa2 b7        or      a
0fa3 fac00f    jp      m,$0fc0
0fa6 c5        push    bc
0fa7 eb        ex      de,hl
0fa8 56        ld      d,(hl)
0fa9 23        inc     hl
0faa 5e        ld      e,(hl)
0fab 23        inc     hl
0fac eb        ex      de,hl
0fad 0b        dec     bc
0fae 3a0702    ld      a,($0207)
0fb1 b7        or      a
0fb2 c21e08    jp      nz,$081e
0fb5 79        ld      a,c
0fb6 bd        cp      l
0fb7 c21e08    jp      nz,$081e
0fba 78        ld      a,b
0fbb bc        cp      h
0fbc c21e08    jp      nz,$081e
0fbf c1        pop     bc
0fc0 210d02    ld      hl,$020d
0fc3 35        dec     (hl)
0fc4 d1        pop     de
0fc5 2a2502    ld      hl,($0225)
0fc8 19        add     hl,de
0fc9 eb        ex      de,hl
0fca d21e08    jp      nc,$081e
0fcd 7c        ld      a,h
0fce a5        and     l
0fcf 3c        inc     a
0fd0 c21e08    jp      nz,$081e
0fd3 d1        pop     de
0fd4 19        add     hl,de
0fd5 d2eb0f    jp      nc,$0feb
0fd8 d1        pop     de
0fd9 d5        push    de
0fda e5        push    hl
0fdb 21ffff    ld      hl,$ffff
0fde e5        push    hl
0fdf 78        ld      a,b
0fe0 e67f      and     $7f
0fe2 47        ld      b,a
0fe3 c5        push    bc
0fe4 210d02    ld      hl,$020d
0fe7 34        inc     (hl)
0fe8 c3ed0f    jp      $0fed
0feb d1        pop     de
0fec d1        pop     de
0fed 2a2502    ld      hl,($0225)
0ff0 19        add     hl,de
0ff1 eb        ex      de,hl
0ff2 c31e08    jp      $081e
0ff5 f1        pop     af
0ff6 c21808    jp      nz,$0818
0ff9 c1        pop     bc
0ffa 78        ld      a,b
0ffb b7        or      a
0ffc fac00f    jp      m,$0fc0
0fff c5        push    bc
1000 2a2502    ld      hl,($0225)
1003 09        add     hl,bc
1004 7b        ld      a,e
1005 bd        cp      l
1006 c21e08    jp      nz,$081e
1009 7a        ld      a,d
100a bc        cp      h
100b c21e08    jp      nz,$081e
100e c1        pop     bc
100f 78        ld      a,b
1010 f680      or      $80
1012 47        ld      b,a
1013 c5        push    bc
1014 c31e08    jp      $081e
1017 e1        pop     hl
1018 7c        ld      a,h
1019 a5        and     l
101a 3c        inc     a
101b c22110    jp      nz,$1021
101e e1        pop     hl
101f e1        pop     hl
1020 e1        pop     hl
1021 3eb0      ld      a,$b0
1023 c3430c    jp      $0c43
1026 f1        pop     af
1027 c21608    jp      nz,$0816
102a 2a3402    ld      hl,($0234)
102d 19        add     hl,de
102e 23        inc     hl
102f 23        inc     hl
1030 e5        push    hl
1031 3a0702    ld      a,($0207)
1034 3d        dec     a
1035 fa4910    jp      m,$1049
1038 cdff0e    call    $0eff
103b eb        ex      de,hl
103c 03        inc     bc
103d 78        ld      a,b
103e f680      or      $80
1040 47        ld      b,a
1041 c5        push    bc
1042 cd8b0b    call    $0b8b
1045 13        inc     de
1046 c31e08    jp      $081e
1049 cdff0e    call    $0eff
104c eb        ex      de,hl
104d ca5d10    jp      z,$105d
1050 eb        ex      de,hl
1051 cdee0e    call    $0eee
1054 da1710    jp      c,$1017
1057 eb        ex      de,hl
1058 c5        push    bc
1059 cd2c14    call    $142c
105c c1        pop     bc
105d 03        inc     bc
105e c5        push    bc
105f cd8b0b    call    $0b8b
1062 210d02    ld      hl,$020d
1065 34        inc     (hl)
1066 3a0702    ld      a,($0207)
1069 b7        or      a
106a ca1e08    jp      z,$081e
106d c1        pop     bc
106e 2a2502    ld      hl,($0225)
1071 09        add     hl,bc
1072 2b        dec     hl
1073 7e        ld      a,(hl)
1074 fed9      cp      $d9
1076 c28110    jp      nz,$1081
1079 d5        push    de
107a eb        ex      de,hl
107b 13        inc     de
107c cdff0e    call    $0eff
107f d1        pop     de
1080 03        inc     bc
1081 c5        push    bc
1082 c31e08    jp      $081e
1085 f1        pop     af
1086 c21408    jp      nz,$0814
1089 2a3402    ld      hl,($0234)
108c 19        add     hl,de
108d 23        inc     hl
108e 23        inc     hl
108f 23        inc     hl
1090 23        inc     hl
1091 e5        push    hl
1092 cdff0e    call    $0eff
1095 e5        push    hl
1096 67        ld      h,a
1097 e5        push    hl
1098 cdff0e    call    $0eff
109b e1        pop     hl
109c bc        cp      h
109d e1        pop     hl
109e c21710    jp      nz,$1017
10a1 b7        or      a
10a2 c34c10    jp      $104c
10a5 f1        pop     af
10a6 c21808    jp      nz,$0818
10a9 1a        ld      a,(de)
10aa 13        inc     de
10ab 42        ld      b,d
10ac 4b        ld      c,e
10ad 03        inc     bc
10ae 03        inc     bc
10af fed0      cp      $d0
10b1 cab610    jp      z,$10b6
10b4 03        inc     bc
10b5 03        inc     bc
10b6 2a3402    ld      hl,($0234)
10b9 09        add     hl,bc
10ba e5        push    hl
10bb cdff0e    call    $0eff
10be c5        push    bc
10bf 1b        dec     de
10c0 1b        dec     de
10c1 1b        dec     de
10c2 3aa803    ld      a,($03a8)
10c5 b7        or      a
10c6 c2eb0f    jp      nz,$0feb
10c9 d5        push    de
10ca 21aa03    ld      hl,$03aa
10cd cdfe38    call    $38fe
10d0 e1        pop     hl
10d1 daeb0f    jp      c,$0feb
10d4 caeb0f    jp      z,$0feb
10d7 1b        dec     de
10d8 d5        push    de
10d9 11ffff    ld      de,$ffff
10dc d5        push    de
10dd eb        ex      de,hl
10de 1a        ld      a,(de)
10df 13        inc     de
10e0 fed0      cp      $d0
10e2 ca4910    jp      z,$1049
10e5 c39210    jp      $1092
10e8 f1        pop     af
10e9 c21608    jp      nz,$0816
10ec cdff0e    call    $0eff
10ef eb        ex      de,hl
10f0 c42c14    call    nz,$142c
10f3 c31e08    jp      $081e
10f6 f1        pop     af
10f7 c21608    jp      nz,$0816
10fa cdff0e    call    $0eff
10fd eb        ex      de,hl
10fe c42c14    call    nz,$142c
1101 3a0702    ld      a,($0207)
1104 b7        or      a
1105 ca1611    jp      z,$1116
1108 1a        ld      a,(de)
1109 f21f11    jp      p,$111f
110c fed8      cp      $d8
110e ca1611    jp      z,$1116
1111 fed9      cp      $d9
1113 c21e08    jp      nz,$081e
1116 c1        pop     bc
1117 78        ld      a,b
1118 e67f      and     $7f
111a 47        ld      b,a
111b c5        push    bc
111c c31e08    jp      $081e
111f fed8      cp      $d8
1121 c21e08    jp      nz,$081e
1124 13        inc     de
1125 c1        pop     bc
1126 78        ld      a,b
1127 e67f      and     $7f
1129 47        ld      b,a
112a c3ff0f    jp      $0fff
112d f1        pop     af
112e c24d11    jp      nz,$114d
1131 2a1d02    ld      hl,($021d)
1134 7e        ld      a,(hl)
1135 b7        or      a
1136 ca4c11    jp      z,$114c
1139 fa4c11    jp      m,$114c
113c 2600      ld      h,$00
113e 6f        ld      l,a
113f 1a        ld      a,(de)
1140 bd        cp      l
1141 da4c11    jp      c,$114c
1144 13        inc     de
1145 2b        dec     hl
1146 29        add     hl,hl
1147 19        add     hl,de
1148 eb        ex      de,hl
1149 c3fa10    jp      $10fa
114c af        xor     a
114d f5        push    af
114e 1a        ld      a,(de)
114f 13        inc     de
1150 2600      ld      h,$00
1152 6f        ld      l,a
1153 29        add     hl,hl
1154 19        add     hl,de
1155 eb        ex      de,hl
1156 cd0908    call    $0809
1159 c9        ret     

115a 3a0602    ld      a,($0206)
115d b7        or      a
115e ca6611    jp      z,$1166
1161 3ea1      ld      a,$a1
1163 c3430c    jp      $0c43
1166 f1        pop     af
1167 c21408    jp      nz,$0814
116a cdff0e    call    $0eff
116d c22110    jp      nz,$1021
1170 23        inc     hl
1171 7e        ld      a,(hl)
1172 fed2      cp      $d2
1174 c2410c    jp      nz,$0c41
1177 23        inc     hl
1178 1a        ld      a,(de)
1179 77        ld      (hl),a
117a 13        inc     de
117b 23        inc     hl
117c 1a        ld      a,(de)
117d 77        ld      (hl),a
117e 13        inc     de
117f c31e08    jp      $081e
1182 110002    ld      de,$0200
1185 c38b11    jp      $118b
1188 210002    ld      hl,$0200
118b 3a3e02    ld      a,($023e)
118e 4f        ld      c,a
118f c3a70b    jp      $0ba7
1192 3a3b02    ld      a,($023b)
1195 3c        inc     a
1196 c0        ret     nz

1197 00        nop     
1198 00        nop     
1199 213c02    ld      hl,$023c
119c 56        ld      d,(hl)
119d 23        inc     hl
119e 5e        ld      e,(hl)
119f 7a        ld      a,d
11a0 a3        and     e
11a1 3c        inc     a
11a2 c8        ret     z

11a3 2a1d02    ld      hl,($021d)
11a6 19        add     hl,de
11a7 e5        push    hl
11a8 23        inc     hl
11a9 23        inc     hl
11aa eb        ex      de,hl
11ab cdde11    call    $11de
11ae e1        pop     hl
11af c39c11    jp      $119c
11b2 4f        ld      c,a
11b3 2a1d02    ld      hl,($021d)
11b6 24        inc     h
11b7 110000    ld      de,$0000
11ba 79        ld      a,c
11bb 3d        dec     a
11bc 4f        ld      c,a
11bd cadd11    jp      z,$11dd
11c0 19        add     hl,de
11c1 eb        ex      de,hl
11c2 210b00    ld      hl,$000b
11c5 19        add     hl,de
11c6 7e        ld      a,(hl)
11c7 b7        or      a
11c8 216100    ld      hl,$0061
11cb cad111    jp      z,$11d1
11ce 212f00    ld      hl,$002f
11d1 c5        push    bc
11d2 d5        push    de
11d3 e5        push    hl
11d4 cdde11    call    $11de
11d7 d1        pop     de
11d8 e1        pop     hl
11d9 c1        pop     bc
11da c3ba11    jp      $11ba
11dd c9        ret     

11de 210700    ld      hl,$0007
11e1 19        add     hl,de
11e2 66        ld      h,(hl)
11e3 29        add     hl,hl
11e4 01d605    ld      bc,$05d6
11e7 d40c01    call    nc,$010c
11ea c9        ret     

11eb d5        push    de
11ec 32bc05    ld      ($05bc),a
11ef 79        ld      a,c
11f0 32bd05    ld      ($05bd),a
11f3 cda014    call    $14a0
11f6 ca2012    jp      z,$1220
11f9 32bb05    ld      ($05bb),a
11fc eb        ex      de,hl
11fd 2a1d02    ld      hl,($021d)
1200 e3        ex      (sp),hl
1201 c5        push    bc
1202 d5        push    de
1203 cd8811    call    $1188
1206 cd8314    call    $1483
1209 7e        ld      a,(hl)
120a f620      or      $20
120c 77        ld      (hl),a
120d cd6616    call    $1666
1210 d1        pop     de
1211 c1        pop     bc
1212 e1        pop     hl
1213 78        ld      a,b
1214 e608      and     $08
1216 ca4212    jp      z,$1242
1219 23        inc     hl
121a 220402    ld      ($0204),hl
121d c34212    jp      $1242
1220 cd4015    call    $1540
1223 d1        pop     de
1224 c0        ret     nz

1225 32bb05    ld      ($05bb),a
1228 cd7012    call    $1270
122b c0        ret     nz

122c d5        push    de
122d cd8314    call    $1483
1230 eb        ex      de,hl
1231 2a1d02    ld      hl,($021d)
1234 eb        ex      de,hl
1235 c1        pop     bc
1236 7e        ld      a,(hl)
1237 f660      or      $60
1239 77        ld      (hl),a
123a 23        inc     hl
123b 73        ld      (hl),e
123c 23        inc     hl
123d 72        ld      (hl),d
123e 23        inc     hl
123f 71        ld      (hl),c
1240 23        inc     hl
1241 70        ld      (hl),b
1242 2aa002    ld      hl,($02a0)
1245 19        add     hl,de
1246 3abc05    ld      a,($05bc)
1249 77        ld      (hl),a
124a 23        inc     hl
124b 3abb05    ld      a,($05bb)
124e 77        ld      (hl),a
124f 3abc05    ld      a,($05bc)
1252 b7        or      a
1253 ca5812    jp      z,$1258
1256 af        xor     a
1257 c9        ret     

1258 3aee01    ld      a,($01ee)
125b b7        or      a
125c c8        ret     z

125d 2a8c02    ld      hl,($028c)
1260 44        ld      b,h
1261 4d        ld      c,l
1262 116b12    ld      de,$126b
1265 cd1b01    call    $011b
1268 c31801    jp      $0118
126b 53        ld      d,e
126c 41        ld      b,c
126d 56        ld      d,(hl)
126e 45        ld      b,l
126f 203e      jr      nz,$12af
1271 ff        rst     $38
1272 324a02    ld      ($024a),a
1275 3abd05    ld      a,($05bd)
1278 010000    ld      bc,$0000
127b 60        ld      h,b
127c 69        ld      l,c
127d 39        add     hl,sp
127e 22cc05    ld      ($05cc),hl
1281 cd8a16    call    $168a
1284 cd5715    call    $1557
1287 d5        push    de
1288 22d205    ld      ($05d2),hl
128b e5        push    hl
128c eb        ex      de,hl
128d 2a9e02    ld      hl,($029e)
1290 19        add     hl,de
1291 3620      ld      (hl),$20
1293 e1        pop     hl
1294 22d005    ld      ($05d0),hl
1297 e5        push    hl
1298 cd2114    call    $1421
129b cdee16    call    $16ee
129e cd2e17    call    $172e
12a1 e1        pop     hl
12a2 221d02    ld      ($021d),hl
12a5 110602    ld      de,$0206
12a8 af        xor     a
12a9 12        ld      (de),a
12aa 3a9d02    ld      a,($029d)
12ad b7        or      a
12ae ca0213    jp      z,$1302
12b1 7e        ld      a,(hl)
12b2 fe01      cp      $01
12b4 c20213    jp      nz,$1302
12b7 cdbd77    call    $77bd
12ba daf112    jp      c,$12f1
12bd 12        ld      (de),a
12be e5        push    hl
12bf cd9017    call    $1790
12c2 e1        pop     hl
12c3 e5        push    hl
12c4 118000    ld      de,$0080
12c7 19        add     hl,de
12c8 eb        ex      de,hl
12c9 cdca15    call    $15ca
12cc cdde16    call    $16de
12cf 2a2502    ld      hl,($0225)
12d2 e5        push    hl
12d3 cd2114    call    $1421
12d6 e1        pop     hl
12d7 d1        pop     de
12d8 0e80      ld      c,$80
12da cda70b    call    $0ba7
12dd cdee16    call    $16ee
12e0 2a2502    ld      hl,($0225)
12e3 eb        ex      de,hl
12e4 2a2902    ld      hl,($0229)
12e7 19        add     hl,de
12e8 cd6217    call    $1762
12eb cd1717    call    $1717
12ee c30b13    jp      $130b
12f1 218b04    ld      hl,$048b
12f4 af        xor     a
12f5 b6        or      (hl)
12f6 ca0213    jp      z,$1302
12f9 11f205    ld      de,$05f2
12fc 013300    ld      bc,$0033
12ff cdf217    call    $17f2
1302 cd1717    call    $1717
1305 cd2114    call    $1421
1308 cd5f17    call    $175f
130b cdde16    call    $16de
130e af        xor     a
130f 328b04    ld      ($048b),a
1312 2ad005    ld      hl,($05d0)
1315 e5        push    hl
1316 11f0ff    ld      de,$fff0
1319 19        add     hl,de
131a 46        ld      b,(hl)
131b 23        inc     hl
131c 4e        ld      c,(hl)
131d 3e03      ld      a,$03
131f b8        cp      b
1320 ca3113    jp      z,$1331
1323 3a8b01    ld      a,($018b)
1326 a8        xor     b
1327 c2e317    jp      nz,$17e3
132a 79        ld      a,c
132b de05      sbc     a,$05
132d da3113    jp      c,$1331
1330 af        xor     a
1331 320702    ld      ($0207),a
1334 3e03      ld      a,$03
1336 b8        cp      b
1337 c24313    jp      nz,$1343
133a 3e04      ld      a,$04
133c b9        cp      c
133d c2e317    jp      nz,$17e3
1340 c36d13    jp      $136d
1343 3a9c02    ld      a,($029c)
1346 b7        or      a
1347 ca5b13    jp      z,$135b
134a 3a8b01    ld      a,($018b)
134d b8        cp      b
134e c2e317    jp      nz,$17e3
1351 3a8c01    ld      a,($018c)
1354 b9        cp      c
1355 c2e317    jp      nz,$17e3
1358 c36d13    jp      $136d
135b 3e04      ld      a,$04
135d b8        cp      b
135e c2e317    jp      nz,$17e3
1361 3e02      ld      a,$02
1363 b9        cp      c
1364 d2e317    jp      nc,$17e3
1367 3e05      ld      a,$05
1369 b9        cp      c
136a dae317    jp      c,$17e3
136d cd6a14    call    $146a
1370 e5        push    hl
1371 2a7003    ld      hl,($0370)
1374 7c        ld      a,h
1375 65        ld      h,l
1376 6f        ld      l,a
1377 eb        ex      de,hl
1378 3eff      ld      a,$ff
137a cd7414    call    $1474
137d 0e08      ld      c,$08
137f 2aa602    ld      hl,($02a6)
1382 d1        pop     de
1383 19        add     hl,de
1384 117e02    ld      de,$027e
1387 cda70b    call    $0ba7
138a d1        pop     de
138b d5        push    de
138c cdca15    call    $15ca
138f e1        pop     hl
1390 22d205    ld      ($05d2),hl
1393 e5        push    hl
1394 11e3ff    ld      de,$ffe3
1397 19        add     hl,de
1398 eb        ex      de,hl
1399 213b02    ld      hl,$023b
139c 0e03      ld      c,$03
139e cda70b    call    $0ba7
13a1 e1        pop     hl
13a2 e5        push    hl
13a3 11e6ff    ld      de,$ffe6
13a6 19        add     hl,de
13a7 7e        ld      a,(hl)
13a8 07        rlca    
13a9 d20f14    jp      nc,$140f
13ac 2a7003    ld      hl,($0370)
13af 55        ld      d,l
13b0 5c        ld      e,h
13b1 01be05    ld      bc,$05be
13b4 cd8816    call    $1688
13b7 2ad205    ld      hl,($05d2)
13ba cd2114    call    $1421
13bd cdd816    call    $16d8
13c0 e1        pop     hl
13c1 56        ld      d,(hl)
13c2 23        inc     hl
13c3 5e        ld      e,(hl)
13c4 23        inc     hl
13c5 3a0602    ld      a,($0206)
13c8 b7        or      a
13c9 cad613    jp      z,$13d6
13cc 220002    ld      ($0200),hl
13cf 2ad005    ld      hl,($05d0)
13d2 e5        push    hl
13d3 c30f14    jp      $140f
13d6 e5        push    hl
13d7 2a2502    ld      hl,($0225)
13da 19        add     hl,de
13db cdbd15    call    $15bd
13de dad217    jp      c,$17d2
13e1 eb        ex      de,hl
13e2 2aca05    ld      hl,($05ca)
13e5 2b        dec     hl
13e6 2b        dec     hl
13e7 eb        ex      de,hl
13e8 19        add     hl,de
13e9 cdbd15    call    $15bd
13ec dad217    jp      c,$17d2
13ef 44        ld      b,h
13f0 4d        ld      c,l
13f1 e3        ex      (sp),hl
13f2 19        add     hl,de
13f3 78        ld      a,b
13f4 bc        cp      h
13f5 c2fa13    jp      nz,$13fa
13f8 79        ld      a,c
13f9 bd        cp      l
13fa d2ff13    jp      nc,$13ff
13fd 4d        ld      c,l
13fe 44        ld      b,h
13ff 7e        ld      a,(hl)
1400 02        ld      (bc),a
1401 2b        dec     hl
1402 0b        dec     bc
1403 1b        dec     de
1404 7a        ld      a,d
1405 b7        or      a
1406 f2ff13    jp      p,$13ff
1409 03        inc     bc
140a 60        ld      h,b
140b 69        ld      l,c
140c 220002    ld      ($0200),hl
140f e1        pop     hl
1410 3abc05    ld      a,($05bc)
1413 b7        or      a
1414 c21a14    jp      nz,$141a
1417 228c02    ld      ($028c),hl
141a d1        pop     de
141b eb        ex      de,hl
141c 73        ld      (hl),e
141d 23        inc     hl
141e 72        ld      (hl),d
141f af        xor     a
1420 c9        ret     

1421 118000    ld      de,$0080
1424 19        add     hl,de
1425 cdbd15    call    $15bd
1428 dad217    jp      c,$17d2
142b c9        ret     

142c 3a0602    ld      a,($0206)
142f b7        or      a
1430 3a9002    ld      a,($0290)
1433 320802    ld      ($0208),a
1436 c0        ret     nz

1437 d5        push    de
1438 5f        ld      e,a
1439 3e02      ld      a,$02
143b 21c305    ld      hl,$05c3
143e cdd10b    call    $0bd1
1441 cd6a14    call    $146a
1444 01c205    ld      bc,$05c2
1447 cd8816    call    $1688
144a 2a0202    ld      hl,($0202)
144d eb        ex      de,hl
144e 2a2502    ld      hl,($0225)
1451 e5        push    hl
1452 19        add     hl,de
1453 e5        push    hl
1454 22d205    ld      ($05d2),hl
1457 cdd816    call    $16d8
145a 2aca05    ld      hl,($05ca)
145d d1        pop     de
145e 19        add     hl,de
145f 2b        dec     hl
1460 5e        ld      e,(hl)
1461 2b        dec     hl
1462 56        ld      d,(hl)
1463 e1        pop     hl
1464 19        add     hl,de
1465 222702    ld      ($0227),hl
1468 d1        pop     de
1469 c9        ret     

146a 2a1d02    ld      hl,($021d)
146d eb        ex      de,hl
146e 2a9e02    ld      hl,($029e)
1471 19        add     hl,de
1472 eb        ex      de,hl
1473 c9        ret     

1474 0620      ld      b,$20
1476 4f        ld      c,a
1477 1a        ld      a,(de)
1478 77        ld      (hl),a
1479 13        inc     de
147a 23        inc     hl
147b b8        cp      b
147c c8        ret     z

147d 0d        dec     c
147e c27714    jp      nz,$1477
1481 70        ld      (hl),b
1482 c9        ret     

1483 3abb05    ld      a,($05bb)
1486 d5        push    de
1487 21d102    ld      hl,$02d1
148a 46        ld      b,(hl)
148b b8        cp      b
148c d29b14    jp      nc,$149b
148f 23        inc     hl
1490 47        ld      b,a
1491 07        rlca    
1492 07        rlca    
1493 80        add     a,b
1494 5f        ld      e,a
1495 1600      ld      d,$00
1497 19        add     hl,de
1498 78        ld      a,b
1499 d1        pop     de
149a c9        ret     

149b 3ea4      ld      a,$a4
149d c32c0c    jp      $0c2c
14a0 1a        ld      a,(de)
14a1 fe24      cp      $24
14a3 caec14    jp      z,$14ec
14a6 c5        push    bc
14a7 214004    ld      hl,$0440
14aa e5        push    hl
14ab e5        push    hl
14ac 3e33      ld      a,$33
14ae 91        sub     c
14af 47        ld      b,a
14b0 da2a0c    jp      c,$0c2a
14b3 cda70b    call    $0ba7
14b6 48        ld      c,b
14b7 0c        inc     c
14b8 cdc70b    call    $0bc7
14bb 11ff03    ld      de,$03ff
14be d5        push    de
14bf 113104    ld      de,$0431
14c2 010904    ld      bc,$0409
14c5 cd1201    call    $0112
14c8 d1        pop     de
14c9 c1        pop     bc
14ca d5        push    de
14cb d5        push    de
14cc 21ff03    ld      hl,$03ff
14cf cad514    jp      z,$14d5
14d2 2a2801    ld      hl,($0128)
14d5 e5        push    hl
14d6 113104    ld      de,$0431
14d9 010904    ld      bc,$0409
14dc cd1501    call    $0115
14df e1        pop     hl
14e0 e5        push    hl
14e1 0eff      ld      c,$ff
14e3 7e        ld      a,(hl)
14e4 0c        inc     c
14e5 23        inc     hl
14e6 fe20      cp      $20
14e8 c2e314    jp      nz,$14e3
14eb d1        pop     de
14ec 21d202    ld      hl,$02d2
14ef 0600      ld      b,$00
14f1 7e        ld      a,(hl)
14f2 e5        push    hl
14f3 e640      and     $40
14f5 ca2b15    jp      z,$152b
14f8 d5        push    de
14f9 23        inc     hl
14fa 5e        ld      e,(hl)
14fb 23        inc     hl
14fc 56        ld      d,(hl)
14fd 2a9e02    ld      hl,($029e)
1500 19        add     hl,de
1501 d1        pop     de
1502 d5        push    de
1503 c5        push    bc
1504 cdbc0b    call    $0bbc
1507 c22915    jp      nz,$1529
150a 7e        ld      a,(hl)
150b fe20      cp      $20
150d c22915    jp      nz,$1529
1510 c1        pop     bc
1511 d1        pop     de
1512 e1        pop     hl
1513 7e        ld      a,(hl)
1514 e620      and     $20
1516 c23b15    jp      nz,$153b
1519 78        ld      a,b
151a 46        ld      b,(hl)
151b 23        inc     hl
151c c5        push    bc
151d 4e        ld      c,(hl)
151e 23        inc     hl
151f 46        ld      b,(hl)
1520 23        inc     hl
1521 5e        ld      e,(hl)
1522 23        inc     hl
1523 56        ld      d,(hl)
1524 c5        push    bc
1525 e1        pop     hl
1526 c1        pop     bc
1527 b7        or      a
1528 c9        ret     

1529 c1        pop     bc
152a d1        pop     de
152b e1        pop     hl
152c 23        inc     hl
152d 23        inc     hl
152e 23        inc     hl
152f 23        inc     hl
1530 23        inc     hl
1531 04        inc     b
1532 3ad102    ld      a,($02d1)
1535 b8        cp      b
1536 c2f114    jp      nz,$14f1
1539 af        xor     a
153a c9        ret     

153b 3eae      ld      a,$ae
153d c32c0c    jp      $0c2c
1540 21d202    ld      hl,$02d2
1543 0600      ld      b,$00
1545 7e        ld      a,(hl)
1546 b7        or      a
1547 78        ld      a,b
1548 c8        ret     z

1549 110500    ld      de,$0005
154c 19        add     hl,de
154d 04        inc     b
154e 3ad102    ld      a,($02d1)
1551 b8        cp      b
1552 c24515    jp      nz,$1545
1555 b7        or      a
1556 c9        ret     

1557 210000    ld      hl,$0000
155a 22d205    ld      ($05d2),hl
155d 22c605    ld      ($05c6),hl
1560 21a802    ld      hl,$02a8
1563 46        ld      b,(hl)
1564 23        inc     hl
1565 c5        push    bc
1566 7e        ld      a,(hl)
1567 23        inc     hl
1568 b6        or      (hl)
1569 2b        dec     hl
156a caa015    jp      z,$15a0
156d e5        push    hl
156e 5e        ld      e,(hl)
156f 23        inc     hl
1570 56        ld      d,(hl)
1571 23        inc     hl
1572 4e        ld      c,(hl)
1573 23        inc     hl
1574 46        ld      b,(hl)
1575 e1        pop     hl
1576 79        ld      a,c
1577 93        sub     e
1578 4f        ld      c,a
1579 78        ld      a,b
157a 9a        sbc     a,d
157b 47        ld      b,a
157c b1        or      c
157d c28b15    jp      nz,$158b
1580 77        ld      (hl),a
1581 23        inc     hl
1582 77        ld      (hl),a
1583 23        inc     hl
1584 77        ld      (hl),a
1585 23        inc     hl
1586 77        ld      (hl),a
1587 23        inc     hl
1588 c3a415    jp      $15a4
158b eb        ex      de,hl
158c 2ac605    ld      hl,($05c6)
158f eb        ex      de,hl
1590 79        ld      a,c
1591 93        sub     e
1592 78        ld      a,b
1593 9a        sbc     a,d
1594 daa015    jp      c,$15a0
1597 22d205    ld      ($05d2),hl
159a c5        push    bc
159b e3        ex      (sp),hl
159c 22c605    ld      ($05c6),hl
159f e1        pop     hl
15a0 010400    ld      bc,$0004
15a3 09        add     hl,bc
15a4 c1        pop     bc
15a5 05        dec     b
15a6 c26515    jp      nz,$1565
15a9 2ad205    ld      hl,($05d2)
15ac 23        inc     hl
15ad 23        inc     hl
15ae 23        inc     hl
15af 56        ld      d,(hl)
15b0 2b        dec     hl
15b1 5e        ld      e,(hl)
15b2 2b        dec     hl
15b3 eb        ex      de,hl
15b4 22c805    ld      ($05c8),hl
15b7 eb        ex      de,hl
15b8 56        ld      d,(hl)
15b9 2b        dec     hl
15ba 5e        ld      e,(hl)
15bb eb        ex      de,hl
15bc c9        ret     

15bd d8        ret     c

15be d5        push    de
15bf eb        ex      de,hl
15c0 2ac805    ld      hl,($05c8)
15c3 7d        ld      a,l
15c4 93        sub     e
15c5 7c        ld      a,h
15c6 9a        sbc     a,d
15c7 eb        ex      de,hl
15c8 d1        pop     de
15c9 c9        ret     

15ca 2a1d02    ld      hl,($021d)
15cd eb        ex      de,hl
15ce e5        push    hl
15cf 01f2ff    ld      bc,$fff2
15d2 09        add     hl,bc
15d3 44        ld      b,h
15d4 4d        ld      c,l
15d5 0a        ld      a,(bc)
15d6 03        inc     bc
15d7 323802    ld      ($0238),a
15da 0a        ld      a,(bc)
15db 03        inc     bc
15dc 323602    ld      ($0236),a
15df 0a        ld      a,(bc)
15e0 03        inc     bc
15e1 323702    ld      ($0237),a
15e4 03        inc     bc
15e5 cd8116    call    $1681
15e8 7d        ld      a,l
15e9 a4        and     h
15ea 3c        inc     a
15eb caef15    jp      z,$15ef
15ee 19        add     hl,de
15ef 223902    ld      ($0239),hl
15f2 cd8116    call    $1681
15f5 222b02    ld      ($022b),hl
15f8 19        add     hl,de
15f9 221f02    ld      ($021f),hl
15fc e5        push    hl
15fd cd8116    call    $1681
1600 cd7e0b    call    $0b7e
1603 223102    ld      ($0231),hl
1606 cd8116    call    $1681
1609 d1        pop     de
160a 19        add     hl,de
160b 222102    ld      ($0221),hl
160e cd8116    call    $1681
1611 220202    ld      ($0202),hl
1614 e3        ex      (sp),hl
1615 01e6ff    ld      bc,$ffe6
1618 09        add     hl,bc
1619 44        ld      b,h
161a 4d        ld      c,l
161b cd8116    call    $1681
161e 7c        ld      a,h
161f e67f      and     $7f
1621 67        ld      h,a
1622 e5        push    hl
1623 cd7916    call    $1679
1626 cd7916    call    $1679
1629 323302    ld      ($0233),a
162c cd8116    call    $1681
162f eb        ex      de,hl
1630 2a2102    ld      hl,($0221)
1633 19        add     hl,de
1634 222302    ld      ($0223),hl
1637 d1        pop     de
1638 19        add     hl,de
1639 222502    ld      ($0225),hl
163c d1        pop     de
163d 19        add     hl,de
163e 222702    ld      ($0227),hl
1641 2a1d02    ld      hl,($021d)
1644 cd7e0b    call    $0b7e
1647 222902    ld      ($0229),hl
164a eb        ex      de,hl
164b 2a2102    ld      hl,($0221)
164e 19        add     hl,de
164f cd7e0b    call    $0b7e
1652 222d02    ld      ($022d),hl
1655 eb        ex      de,hl
1656 2a3102    ld      hl,($0231)
1659 19        add     hl,de
165a 222f02    ld      ($022f),hl
165d 2a2502    ld      hl,($0225)
1660 cd7e0b    call    $0b7e
1663 223402    ld      ($0234),hl
1666 af        xor     a
1667 320802    ld      ($0208),a
166a 320e02    ld      ($020e),a
166d 3c        inc     a
166e 320d02    ld      ($020d),a
1671 2a1d02    ld      hl,($021d)
1674 3a9502    ld      a,($0295)
1677 77        ld      (hl),a
1678 c9        ret     

1679 b7        or      a
167a 7c        ld      a,h
167b 1f        rra     
167c 67        ld      h,a
167d 7d        ld      a,l
167e 1f        rra     
167f 6f        ld      l,a
1680 c9        ret     

1681 0a        ld      a,(bc)
1682 03        inc     bc
1683 67        ld      h,a
1684 0a        ld      a,(bc)
1685 03        inc     bc
1686 6f        ld      l,a
1687 c9        ret     

1688 3eff      ld      a,$ff
168a c5        push    bc
168b 214004    ld      hl,$0440
168e e5        push    hl
168f cd7414    call    $1474
1692 21ff03    ld      hl,$03ff
1695 e5        push    hl
1696 010904    ld      bc,$0409
1699 113104    ld      de,$0431
169c cd1201    call    $0112
169f d1        pop     de
16a0 210032    ld      hl,$3200
16a3 226e03    ld      ($036e),hl
16a6 214004    ld      hl,$0440
16a9 e5        push    hl
16aa 7c        ld      a,h
16ab 65        ld      h,l
16ac 6f        ld      l,a
16ad 227003    ld      ($0370),hl
16b0 21ff03    ld      hl,$03ff
16b3 cac816    jp      z,$16c8
16b6 010904    ld      bc,$0409
16b9 0a        ld      a,(bc)
16ba fe24      cp      $24
16bc cac516    jp      z,$16c5
16bf 2a2801    ld      hl,($0128)
16c2 c3c816    jp      $16c8
16c5 218504    ld      hl,$0485
16c8 e5        push    hl
16c9 010904    ld      bc,$0409
16cc 7a        ld      a,d
16cd b3        or      e
16ce c2d416    jp      nz,$16d4
16d1 113104    ld      de,$0431
16d4 cd1501    call    $0115
16d7 c9        ret     

16d8 cdee16    call    $16ee
16db cd5917    call    $1759
16de 116303    ld      de,$0363
16e1 01d605    ld      bc,$05d6
16e4 cd0901    call    $0109
16e7 cd1117    call    $1711
16ea c2cd17    jp      nz,$17cd
16ed c9        ret     

16ee af        xor     a
16ef 326903    ld      ($0369),a
16f2 3c        inc     a
16f3 326803    ld      ($0368),a
16f6 210000    ld      hl,$0000
16f9 22ca05    ld      ($05ca),hl
16fc 2680      ld      h,$80
16fe 228903    ld      ($0389),hl
1701 116303    ld      de,$0363
1704 01d405    ld      bc,$05d4
1707 cd0901    call    $0109
170a cd1117    call    $1711
170d c2a117    jp      nz,$17a1
1710 c9        ret     

1711 3a6303    ld      a,($0363)
1714 fe30      cp      $30
1716 c9        ret     

1717 118000    ld      de,$0080
171a 2ad005    ld      hl,($05d0)
171d 19        add     hl,de
171e 22d005    ld      ($05d0),hl
1721 c9        ret     

1722 2aca05    ld      hl,($05ca)
1725 eb        ex      de,hl
1726 2ace05    ld      hl,($05ce)
1729 7b        ld      a,e
172a 95        sub     l
172b 7a        ld      a,d
172c 9c        sbc     a,h
172d c9        ret     

172e 2ad005    ld      hl,($05d0)
1731 7c        ld      a,h
1732 65        ld      h,l
1733 6f        ld      l,a
1734 228b03    ld      ($038b),hl
1737 116303    ld      de,$0363
173a 01da05    ld      bc,$05da
173d cd0901    call    $0109
1740 3a6303    ld      a,($0363)
1743 fe31      cp      $31
1745 c8        ret     z

1746 cd1117    call    $1711
1749 c2cd17    jp      nz,$17cd
174c 118000    ld      de,$0080
174f 2aca05    ld      hl,($05ca)
1752 19        add     hl,de
1753 22ca05    ld      ($05ca),hl
1756 f601      or      $01
1758 c9        ret     

1759 2ad205    ld      hl,($05d2)
175c 22d005    ld      ($05d0),hl
175f 21ffff    ld      hl,$ffff
1762 22ce05    ld      ($05ce),hl
1765 cd2217    call    $1722
1768 d0        ret     nc

1769 cd2e17    call    $172e
176c c8        ret     z

176d cd1717    call    $1717
1770 118000    ld      de,$0080
1773 19        add     hl,de
1774 cdbd15    call    $15bd
1777 d26517    jp      nc,$1765
177a 2ad005    ld      hl,($05d0)
177d e5        push    hl
177e 1180ff    ld      de,$ff80
1781 19        add     hl,de
1782 22d005    ld      ($05d0),hl
1785 cd2e17    call    $172e
1788 e1        pop     hl
1789 22d005    ld      ($05d0),hl
178c c8        ret     z

178d c3d217    jp      $17d2
1790 21ffff    ld      hl,$ffff
1793 22ce05    ld      ($05ce),hl
1796 cd2217    call    $1722
1799 d0        ret     nc

179a cd2e17    call    $172e
179d c8        ret     z

179e c39617    jp      $1796
17a1 3abc05    ld      a,($05bc)
17a4 b7        or      a
17a5 c29b14    jp      nz,$149b
17a8 11db05    ld      de,$05db
17ab 011700    ld      bc,$0017
17ae cdf217    call    $17f2
17b1 2a7003    ld      hl,($0370)
17b4 5c        ld      e,h
17b5 55        ld      d,l
17b6 62        ld      h,d
17b7 6b        ld      l,e
17b8 01ffff    ld      bc,$ffff
17bb 3e20      ld      a,$20
17bd be        cp      (hl)
17be 23        inc     hl
17bf 03        inc     bc
17c0 c2bd17    jp      nz,$17bd
17c3 cdf217    call    $17f2
17c6 cdec17    call    $17ec
17c9 cd1801    call    $0118
17cc c7        rst     $00
17cd 3e9c      ld      a,$9c
17cf c32c0c    jp      $0c2c
17d2 cdde16    call    $16de
17d5 3abc05    ld      a,($05bc)
17d8 b7        or      a
17d9 3e9d      ld      a,$9d
17db cae517    jp      z,$17e5
17de 2acc05    ld      hl,($05cc)
17e1 f9        ld      sp,hl
17e2 c9        ret     

17e3 3ea5      ld      a,$a5
17e5 2a2502    ld      hl,($0225)
17e8 eb        ex      de,hl
17e9 c3430c    jp      $0c43
17ec 210000    ld      hl,$0000
17ef c3f917    jp      $17f9
17f2 6a        ld      l,d
17f3 63        ld      h,e
17f4 225c03    ld      ($035c),hl
17f7 68        ld      l,b
17f8 61        ld      h,c
17f9 225a03    ld      ($035a),hl
17fc 113403    ld      de,$0334
17ff 01d805    ld      bc,$05d8
1802 c30901    jp      $0109
1805 2b        dec     hl
1806 6d        ld      l,l
1807 18a2      jr      $17ab
1809 182a      jr      $1835
180b 0c        inc     c
180c 2a0cb4    ld      hl,($b40c)
180f 18b8      jr      $17c9
1811 18c4      jr      $17d7
1813 18d0      jr      $17e5
1815 18e4      jr      $17fb
1817 18f8      jr      $1811
1819 180c      jr      $1827
181b 011b01    ld      bc,$011b
181e 12        ld      (de),a
181f 011501    ld      bc,$0115
1822 21016a    ld      hl,$6a01
1825 75        ld      (hl),l
1826 6f        ld      l,a
1827 75        ld      (hl),l
1828 2c        inc     l
1829 78        ld      a,b
182a 96        sub     (hl)
182b 75        ld      (hl),l
182c 3f        ccf     
182d 78        ld      a,b
182e 2678      ld      h,$78
1830 80        add     a,b
1831 78        ld      a,b
1832 a1        and     c
1833 78        ld      a,b
1834 f3        di      
1835 75        ld      (hl),l
1836 1878      jr      $18b0
1838 4d        ld      c,l
1839 56        ld      d,(hl)
183a 09        add     hl,bc
183b 76        halt    
183c 19        add     hl,de
183d 76        halt    
183e 1d        dec     e
183f 76        halt    
1840 39        add     hl,sp
1841 013f01    ld      bc,$013f
1844 42        ld      b,d
1845 016376    ld      bc,$7663
1848 5e        ld      e,(hl)
1849 18ed      jr      $1838
184b 0a        ld      a,(bc)
184c 6f        ld      l,a
184d 76        halt    
184e 7c        ld      a,h
184f 76        halt    
1850 89        adc     a,c
1851 76        halt    
1852 a4        and     h
1853 76        halt    
1854 00        nop     
1855 77        ld      (hl),a
1856 90        sub     b
1857 77        ld      (hl),a
1858 a8        xor     b
1859 77        ld      (hl),a
185a 67        ld      h,a
185b 77        ld      (hl),a
185c 7d        ld      a,l
185d 77        ld      (hl),a
185e 2a1d02    ld      hl,($021d)
1861 118500    ld      de,$0085
1864 19        add     hl,de
1865 eb        ex      de,hl
1866 60        ld      h,b
1867 69        ld      l,c
1868 0e06      ld      c,$06
186a c3a70b    jp      $0ba7
186d d5        push    de
186e 60        ld      h,b
186f 69        ld      l,c
1870 56        ld      d,(hl)
1871 23        inc     hl
1872 5e        ld      e,(hl)
1873 3e01      ld      a,$01
1875 32ee01    ld      ($01ee),a
1878 2a8c02    ld      hl,($028c)
187b 7a        ld      a,d
187c bb        cp      e
187d c29b18    jp      nz,$189b
1880 b7        or      a
1881 ca9c18    jp      z,$189c
1884 3c        inc     a
1885 c29b18    jp      nz,$189b
1888 21d202    ld      hl,$02d2
188b 0e0a      ld      c,$0a
188d cdc90b    call    $0bc9
1890 2a1d02    ld      hl,($021d)
1893 af        xor     a
1894 32ee01    ld      ($01ee),a
1897 325f01    ld      ($015f),a
189a 13        inc     de
189b 19        add     hl,de
189c e5        push    hl
189d c1        pop     bc
189e d1        pop     de
189f c31b01    jp      $011b
18a2 215f01    ld      hl,$015f
18a5 0a        ld      a,(bc)
18a6 3d        dec     a
18a7 caaf18    jp      z,$18af
18aa 3c        inc     a
18ab c22a0c    jp      nz,$0c2a
18ae eb        ex      de,hl
18af 0e8f      ld      c,$8f
18b1 c3a70b    jp      $0ba7
18b4 c5        push    bc
18b5 c31e01    jp      $011e
18b8 d5        push    de
18b9 3e05      ld      a,$05
18bb 60        ld      h,b
18bc 69        ld      l,c
18bd cd100c    call    $0c10
18c0 e1        pop     hl
18c1 1a        ld      a,(de)
18c2 77        ld      (hl),a
18c3 c9        ret     

18c4 d5        push    de
18c5 3e05      ld      a,$05
18c7 60        ld      h,b
18c8 69        ld      l,c
18c9 cd100c    call    $0c10
18cc e1        pop     hl
18cd 7e        ld      a,(hl)
18ce 12        ld      (de),a
18cf c9        ret     

18d0 d5        push    de
18d1 3e03      ld      a,$03
18d3 60        ld      h,b
18d4 69        ld      l,c
18d5 cd100c    call    $0c10
18d8 63        ld      h,e
18d9 2edb      ld      l,$db
18db 222506    ld      ($0625),hl
18de e1        pop     hl
18df cd2506    call    $0625
18e2 77        ld      (hl),a
18e3 c9        ret     

18e4 d5        push    de
18e5 3e03      ld      a,$03
18e7 60        ld      h,b
18e8 69        ld      l,c
18e9 cd100c    call    $0c10
18ec 63        ld      h,e
18ed 2ed3      ld      l,$d3
18ef 222506    ld      ($0625),hl
18f2 e1        pop     hl
18f3 7e        ld      a,(hl)
18f4 cd2506    call    $0625
18f7 c9        ret     

18f8 3e05      ld      a,$05
18fa 60        ld      h,b
18fb 69        ld      l,c
18fc cd100c    call    $0c10
18ff eb        ex      de,hl
1900 e9        jp      (hl)

; Startup

1901 c31e19    jp      $191e

1904 52        ld      d,d
1905 04        inc     b
1906 01ca2a    ld      bc,$2aca
1909 1f        rra     
190a ff        rst     $38
190b 0f        rrca    
190c 28ca      jr      z,$18d8
190e 2b        dec     hl
190f 00        nop     
1910 3a9d02    ld      a,($029d)
1913 47        ld      b,a
1914 3a5f01    ld      a,($015f)
1917 b0        or      b
1918 c8        ret     z

1919 af        xor     a
191a 325b35    ld      ($355b),a
191d c9        ret     

; Startup

191e af        xor     a
191f 327036    ld      ($3670),a
1922 327336    ld      ($3673),a
1925 215907    ld      hl,$0759
1928 f9        ld      sp,hl
1929 229a02    ld      ($029a),hl
192c 01e000    ld      bc,$00e0
192f 79        ld      a,c
1930 95        sub     l
1931 329602    ld      ($0296),a
1934 78        ld      a,b
1935 9c        sbc     a,h
1936 329702    ld      ($0297),a
1939 3a0919    ld      a,($1909)
193c 327436    ld      ($3674),a
193f 21ffff    ld      hl,$ffff
1942 0e0c      ld      c,$0c
1944 cda62a    call    $2aa6	; BDOS CALL Get Version Number HL=A=31 o bien 22
1947 23        inc     hl
1948 7c        ld      a,h
1949 b5        or      l
194a 2b        dec     hl
194b c25619    jp      nz,$1956 ; Version > 0 -> Jump
194e 67        ld      h,a
194f 6f        ld      l,a
1950 3a0a19    ld      a,($190a)
1953 327436    ld      ($3674),a
1956 cd802b    call    $2b80	; ??? CALL OSWORD
1959 216035    ld      hl,$3560
195c 225c35    ld      ($355c),hl
195f 118000    ld      de,$0080	; Command line: 07, " PI.INT"
1962 1a        ld      a,(de)
1963 13        inc     de
1964 47        ld      b,a
1965 b7        or      a
1966 ca7119    jp      z,$1971
1969 1a        ld      a,(de)
196a fe20      cp      $20
196c c27119    jp      nz,$1971
196f 13        inc     de
1970 05        dec     b
1971 78        ld      a,b
1972 c602      add     a,$02
1974 325b35    ld      ($355b),a
1977 04        inc     b
1978 05        dec     b
1979 ca8319    jp      z,$1983
197c 1a        ld      a,(de)
197d 13        inc     de
197e 77        ld      (hl),a
197f 23        inc     hl
1980 c37819    jp      $1978
1983 3620      ld      (hl),$20
1985 23        inc     hl
1986 360d      ld      (hl),$0d
1988 23        inc     hl
1989 360a      ld      (hl),$0a
198b af        xor     a
198c 326f36    ld      ($366f),a
198f cdc119    call    $19c1
1992 214335    ld      hl,$3543
1995 7d        ld      a,l
1996 6c        ld      l,h
1997 67        ld      h,a
1998 221203    ld      ($0312),hl
199b 214935    ld      hl,$3549
199e 7d        ld      a,l
199f 6c        ld      l,h
19a0 67        ld      h,a
19a1 224103    ld      ($0341),hl
19a4 c30301    jp      $0103

19a7 21ca2b    ld      hl,$2bca
19aa 11b000    ld      de,$00b0
19ad 060d      ld      b,$0d
19af 7e        ld      a,(hl)
19b0 23        inc     hl
19b1 b6        or      (hl)
19b2 cabb19    jp      z,$19bb
19b5 19        add     hl,de
19b6 05        dec     b
19b7 c2af19    jp      nz,$19af
19ba c9        ret     

19bb 36ff      ld      (hl),$ff
19bd 23        inc     hl
19be c601      add     a,$01
19c0 c9        ret     

19c1 21ca2b    ld      hl,$2bca
19c4 11b000    ld      de,$00b0
19c7 af        xor     a
19c8 060d      ld      b,$0d
19ca 05        dec     b
19cb f8        ret     m

19cc 77        ld      (hl),a
19cd 23        inc     hl
19ce 77        ld      (hl),a
19cf 19        add     hl,de
19d0 c3ca19    jp      $19ca
19d3 2b        dec     hl
19d4 3600      ld      (hl),$00
19d6 c9        ret     

19d7 21ca2b    ld      hl,$2bca
19da 11af00    ld      de,$00af
19dd 060d      ld      b,$0d
19df 7e        ld      a,(hl)
19e0 23        inc     hl
19e1 b6        or      (hl)
19e2 23        inc     hl
19e3 c0        ret     nz

19e4 19        add     hl,de
19e5 05        dec     b
19e6 c2df19    jp      nz,$19df
19e9 c9        ret     

19ea cdd719    call    $19d7
19ed ca1d1a    jp      z,$1a1d
19f0 e5        push    hl
19f1 112400    ld      de,$0024
19f4 19        add     hl,de
19f5 5e        ld      e,(hl)
19f6 23        inc     hl
19f7 56        ld      d,(hl)
19f8 af        xor     a
19f9 326936    ld      ($3669),a
19fc f680      or      $80
19fe 326a36    ld      ($366a),a
1a01 016936    ld      bc,$3669
1a04 d5        push    de
1a05 cd9e1d    call    $1d9e
1a08 e1        pop     hl
1a09 7e        ld      a,(hl)
1a0a fe30      cp      $30
1a0c d1        pop     de
1a0d caea19    jp      z,$19ea
1a10 d5        push    de
1a11 e1        pop     hl
1a12 2b        dec     hl
1a13 3600      ld      (hl),$00
1a15 0e10      ld      c,$10
1a17 cd8d2a    call    $2a8d
1a1a c3ea19    jp      $19ea
1a1d 3a7036    ld      a,($3670)
1a20 b7        or      a
1a21 c0        ret     nz

1a22 0e09      ld      c,$09
1a24 117936    ld      de,$3679		; "HIT KEy TO EXIT:$"
1a27 3af701    ld      a,($01f7)
1a2a b7        or      a
1a2b f5        push    af
1a2c c40500    call    nz,$0005		; BDOS CALL Ptr$
1a2f f1        pop     af
1a30 c43001    call    nz,$0130
1a33 c3502b    jp      $2b50		; exit to CP/M
1a36 af        xor     a
1a37 326636    ld      ($3666),a
1a3a d5        push    de
1a3b e5        push    hl
1a3c 216936    ld      hl,$3669
1a3f e5        push    hl
1a40 210100    ld      hl,$0001
1a43 19        add     hl,de
1a44 44        ld      b,h
1a45 4d        ld      c,l
1a46 210900    ld      hl,$0009
1a49 19        add     hl,de
1a4a eb        ex      de,hl
1a4b cd101b    call    $1b10
1a4e c2581a    jp      nz,$1a58
1a51 3a6936    ld      a,($3669)
1a54 3d        dec     a
1a55 c35d1a    jp      $1a5d
1a58 0e19      ld      c,$19
1a5a cd9c2a    call    $2a9c		; BDOS CALL Return Current Drive
1a5d e60f      and     $0f
1a5f 3c        inc     a
1a60 210000    ld      hl,$0000
1a63 d1        pop     de
1a64 19        add     hl,de
1a65 77        ld      (hl),a
1a66 210c00    ld      hl,$000c
1a69 19        add     hl,de
1a6a 0618      ld      b,$18
1a6c af        xor     a
1a6d 3600      ld      (hl),$00
1a6f 23        inc     hl
1a70 05        dec     b
1a71 c26d1a    jp      nz,$1a6d
1a74 c9        ret     

1a75 e5        push    hl
1a76 216636    ld      hl,$3666
1a79 3601      ld      (hl),$01
1a7b e1        pop     hl
1a7c c9        ret     

1a7d fe21      cp      $21
1a7f dc751a    call    c,$1a75
1a82 d8        ret     c

1a83 e5        push    hl
1a84 c5        push    bc
1a85 214f35    ld      hl,$354f
1a88 060c      ld      b,$0c
1a8a be        cp      (hl)
1a8b cc751a    call    z,$1a75
1a8e ca961a    jp      z,$1a96
1a91 23        inc     hl
1a92 05        dec     b
1a93 c28a1a    jp      nz,$1a8a
1a96 c1        pop     bc
1a97 e1        pop     hl
1a98 c9        ret     

1a99 60        ld      h,b
1a9a 69        ld      l,c
1a9b 11c734    ld      de,$34c7
1a9e cd361a    call    $1a36
1aa1 3a6636    ld      a,($3666)
1aa4 b7        or      a
1aa5 c2c11a    jp      nz,$1ac1
1aa8 012300    ld      bc,$0023
1aab cdcb29    call    $29cb
1aae 3a6536    ld      a,($3665)
1ab1 fe01      cp      $01
1ab3 cac81a    jp      z,$1ac8
1ab6 0e11      ld      c,$11
1ab8 cd8d2a    call    $2a8d
1abb 3c        inc     a
1abc cac51a    jp      z,$1ac5
1abf af        xor     a
1ac0 c9        ret     

1ac1 af        xor     a
1ac2 2f        cpl     
1ac3 3f        ccf     
1ac4 c9        ret     

1ac5 3c        inc     a
1ac6 3f        ccf     
1ac7 c9        ret     

1ac8 0e0f      ld      c,$0f
1aca cd8d2a    call    $2a8d
1acd 3c        inc     a
1ace cac51a    jp      z,$1ac5
1ad1 0e10      ld      c,$10
1ad3 cd8d2a    call    $2a8d
1ad6 af        xor     a
1ad7 c9        ret     

1ad8 e5        push    hl
1ad9 060e      ld      b,$0e
1adb 110535    ld      de,$3505
1ade d5        push    de
1adf 13        inc     de
1ae0 1a        ld      a,(de)
1ae1 be        cp      (hl)
1ae2 c2fa1a    jp      nz,$1afa
1ae5 23        inc     hl
1ae6 13        inc     de
1ae7 1a        ld      a,(de)
1ae8 be        cp      (hl)
1ae9 c2fa1a    jp      nz,$1afa
1aec 23        inc     hl
1aed 13        inc     de
1aee 1a        ld      a,(de)
1aef be        cp      (hl)
1af0 c2fa1a    jp      nz,$1afa
1af3 23        inc     hl
1af4 7e        ld      a,(hl)
1af5 fe3a      cp      $3a
1af7 ca0c1b    jp      z,$1b0c
1afa 3e05      ld      a,$05
1afc 05        dec     b
1afd ca0b1b    jp      z,$1b0b
1b00 e1        pop     hl
1b01 110400    ld      de,$0004
1b04 19        add     hl,de
1b05 d1        pop     de
1b06 d5        push    de
1b07 eb        ex      de,hl
1b08 c3de1a    jp      $1ade
1b0b af        xor     a
1b0c d1        pop     de
1b0d e1        pop     hl
1b0e b7        or      a
1b0f c9        ret     

1b10 e1        pop     hl
1b11 225a36    ld      ($365a),hl
1b14 eb        ex      de,hl
1b15 d1        pop     de
1b16 e3        ex      (sp),hl
1b17 c5        push    bc
1b18 0e06      ld      c,$06
1b1a cd0a1c    call    $1c0a
1b1d d5        push    de
1b1e cdd81a    call    $1ad8
1b21 ca341b    jp      z,$1b34
1b24 d1        pop     de
1b25 eb        ex      de,hl
1b26 cd001c    call    $1c00
1b29 e1        pop     hl
1b2a 3620      ld      (hl),$20
1b2c e1        pop     hl
1b2d 3620      ld      (hl),$20
1b2f 063a      ld      b,$3a
1b31 c3ba1b    jp      $1bba
1b34 d1        pop     de
1b35 7e        ld      a,(hl)
1b36 fe3a      cp      $3a
1b38 c25f1b    jp      nz,$1b5f
1b3b 47        ld      b,a
1b3c 23        inc     hl
1b3d 7e        ld      a,(hl)
1b3e fe46      cp      $46
1b40 c4751a    call    nz,$1a75
1b43 23        inc     hl
1b44 7e        ld      a,(hl)
1b45 fe30      cp      $30
1b47 dc751a    call    c,$1a75
1b4a fe3a      cp      $3a
1b4c d4751a    call    nc,$1a75
1b4f c611      add     a,$11
1b51 12        ld      (de),a
1b52 13        inc     de
1b53 23        inc     hl
1b54 7e        ld      a,(hl)
1b55 fe3a      cp      $3a
1b57 c4751a    call    nz,$1a75
1b5a 12        ld      (de),a
1b5b 23        inc     hl
1b5c c3791b    jp      $1b79
1b5f 23        inc     hl
1b60 7e        ld      a,(hl)
1b61 2b        dec     hl
1b62 fe3a      cp      $3a
1b64 47        ld      b,a
1b65 c2791b    jp      nz,$1b79
1b68 7e        ld      a,(hl)
1b69 23        inc     hl
1b6a fe41      cp      $41
1b6c dc751a    call    c,$1a75
1b6f fe51      cp      $51
1b71 d4751a    call    nc,$1a75
1b74 12        ld      (de),a
1b75 13        inc     de
1b76 7e        ld      a,(hl)
1b77 23        inc     hl
1b78 12        ld      (de),a
1b79 0e0a      ld      c,$0a
1b7b d1        pop     de
1b7c cd0a1c    call    $1c0a
1b7f 0e09      ld      c,$09
1b81 7e        ld      a,(hl)
1b82 fe2e      cp      $2e
1b84 ca991b    jp      z,$1b99
1b87 fe20      cp      $20
1b89 ca991b    jp      z,$1b99
1b8c cd7d1a    call    $1a7d
1b8f 23        inc     hl
1b90 12        ld      (de),a
1b91 13        inc     de
1b92 0d        dec     c
1b93 c2811b    jp      nz,$1b81
1b96 cd751a    call    $1a75
1b99 0e05      ld      c,$05
1b9b d1        pop     de
1b9c cd0a1c    call    $1c0a
1b9f 7e        ld      a,(hl)
1ba0 fe2e      cp      $2e
1ba2 c2ba1b    jp      nz,$1bba
1ba5 0e04      ld      c,$04
1ba7 23        inc     hl
1ba8 7e        ld      a,(hl)
1ba9 12        ld      (de),a
1baa 13        inc     de
1bab fe20      cp      $20
1bad caba1b    jp      z,$1bba
1bb0 cd7d1a    call    $1a7d
1bb3 0d        dec     c
1bb4 c2a71b    jp      nz,$1ba7
1bb7 cd751a    call    $1a75
1bba 78        ld      a,b
1bbb fe3a      cp      $3a
1bbd 2a5a36    ld      hl,($365a)
1bc0 e9        jp      (hl)
1bc1 e1        pop     hl
1bc2 225a36    ld      ($365a),hl
1bc5 eb        ex      de,hl
1bc6 d1        pop     de
1bc7 e3        ex      (sp),hl
1bc8 c5        push    bc
1bc9 0e12      ld      c,$12
1bcb eb        ex      de,hl
1bcc cd0a1c    call    $1c0a
1bcf eb        ex      de,hl
1bd0 cd001c    call    $1c00
1bd3 d1        pop     de
1bd4 cd001c    call    $1c00
1bd7 d1        pop     de
1bd8 1a        ld      a,(de)
1bd9 fe20      cp      $20
1bdb cae41b    jp      z,$1be4
1bde 362e      ld      (hl),$2e
1be0 23        inc     hl
1be1 cd001c    call    $1c00
1be4 2a5a36    ld      hl,($365a)
1be7 e9        jp      (hl)
1be8 eb        ex      de,hl
1be9 113d35    ld      de,$353d
1bec cd001c    call    $1c00
1bef 60        ld      h,b
1bf0 69        ld      l,c
1bf1 114935    ld      de,$3549
1bf4 cd001c    call    $1c00
1bf7 e1        pop     hl
1bf8 e3        ex      (sp),hl
1bf9 114335    ld      de,$3543
1bfc cd001c    call    $1c00
1bff c9        ret     

1c00 1a        ld      a,(de)
1c01 fe20      cp      $20
1c03 c8        ret     z

1c04 77        ld      (hl),a
1c05 13        inc     de
1c06 23        inc     hl
1c07 c3001c    jp      $1c00
1c0a 3e20      ld      a,$20
1c0c d5        push    de
1c0d 12        ld      (de),a
1c0e 13        inc     de
1c0f 0d        dec     c
1c10 c20d1c    jp      nz,$1c0d
1c13 d1        pop     de
1c14 c9        ret     

; get End of TPA

1c15 2a0600    ld      hl,($0006)
1c18 2b        dec     hl
1c19 c9        ret     

1c1a c5        push    bc
1c1b d5        push    de
1c1c e5        push    hl
1c1d 3af501    ld      a,($01f5)
1c20 a1        and     c
1c21 4f        ld      c,a
1c22 3a6436    ld      a,($3664)
1c25 b7        or      a
1c26 ca431c    jp      z,$1c43
1c29 3a6536    ld      a,($3665)
1c2c fe01      cp      $01
1c2e ca3a1c    jp      z,$1c3a
1c31 59        ld      e,c
1c32 0e06      ld      c,$06
1c34 cda62a    call    $2aa6	; BDOS CALL Console I/O -> print char
1c37 c34d1c    jp      $1c4d
1c3a 59        ld      e,c
1c3b 0e04      ld      c,$04
1c3d cda62a    call    $2aa6	; BDOS CALL punch print char
1c40 c34d1c    jp      $1c4d
1c43 2a0100    ld      hl,($0001)
1c46 110900    ld      de,$0009
1c49 19        add     hl,de
1c4a cd3e24    call    $243e
1c4d e1        pop     hl
1c4e d1        pop     de
1c4f c1        pop     bc
1c50 79        ld      a,c
1c51 c9        ret     

1c52 c5        push    bc
1c53 d5        push    de
1c54 e5        push    hl
1c55 3a6436    ld      a,($3664)
1c58 b7        or      a
1c59 ca7e1c    jp      z,$1c7e
1c5c 3a6536    ld      a,($3665)
1c5f fe01      cp      $01
1c61 ca721c    jp      z,$1c72
1c64 1eff      ld      e,$ff
1c66 0e06      ld      c,$06
1c68 cda62a    call    $2aa6	; BDOS CALL Read char nonblocking no echo
1c6b a7        and     a
1c6c ca641c    jp      z,$1c64
1c6f c3881c    jp      $1c88
1c72 0e03      ld      c,$03
1c74 cda62a    call    $2aa6	; BDOS CALL read char aux
1c77 a7        and     a
1c78 ca721c    jp      z,$1c72
1c7b c3881c    jp      $1c88
1c7e 2a0100    ld      hl,($0001)
1c81 110600    ld      de,$0006
1c84 19        add     hl,de
1c85 cd3e24    call    $243e
1c88 e1        pop     hl
1c89 d1        pop     de
1c8a 4f        ld      c,a
1c8b 3af501    ld      a,($01f5)
1c8e a1        and     c
1c8f c1        pop     bc
1c90 c9        ret     

1c91 c5        push    bc
1c92 21c734    ld      hl,$34c7
1c95 eb        ex      de,hl
1c96 cd361a    call    $1a36
1c99 118000    ld      de,$0080
1c9c 0e1a      ld      c,$1a
1c9e cda62a    call    $2aa6	; BDOS CALL Set DMA Addr
1ca1 0e13      ld      c,$13
1ca3 cd8d2a    call    $2a8d
1ca6 0e16      ld      c,$16
1ca8 cd8d2a    call    $2a8d
1cab feff      cp      $ff
1cad cce81c    call    z,$1ce8
1cb0 018000    ld      bc,$0080
1cb3 c5        push    bc
1cb4 110001    ld      de,$0100
1cb7 0e1a      ld      c,$1a
1cb9 d5        push    de
1cba cda62a    call    $2aa6	; BDOS CALL Set DMA Addr
1cbd 0e15      ld      c,$15
1cbf cd8d2a    call    $2a8d
1cc2 b7        or      a
1cc3 e1        pop     hl
1cc4 c1        pop     bc
1cc5 d1        pop     de
1cc6 c4e81c    call    nz,$1ce8
1cc9 09        add     hl,bc
1cca eb        ex      de,hl
1ccb 7a        ld      a,d
1ccc bc        cp      h
1ccd dad81c    jp      c,$1cd8
1cd0 c2dd1c    jp      nz,$1cdd
1cd3 7b        ld      a,e
1cd4 bd        cp      l
1cd5 d2dd1c    jp      nc,$1cdd
1cd8 e5        push    hl
1cd9 c5        push    bc
1cda c3b71c    jp      $1cb7
1cdd 0e10      ld      c,$10
1cdf cd8d2a    call    $2a8d
1ce2 feff      cp      $ff
1ce4 cce81c    call    z,$1ce8
1ce7 c9        ret     

1ce8 3ec5      ld      a,$c5
1cea cd430c    call    $0c43
1ced cd1801    call    $0118
1cf0 217036    ld      hl,$3670
1cf3 3601      ld      (hl),$01
1cf5 cd1801    call    $0118
1cf8 115c00    ld      de,$005c
1cfb e1        pop     hl
1cfc d5        push    de
1cfd e5        push    hl
1cfe cd361a    call    $1a36
1d01 3a6636    ld      a,($3666)
1d04 b7        or      a
1d05 c2451d    jp      nz,$1d45
1d08 e1        pop     hl
1d09 d1        pop     de
1d0a 3a6436    ld      a,($3664)
1d0d fe30      cp      $30
1d0f d24d1d    jp      nc,$1d4d
1d12 0e0f      ld      c,$0f
1d14 cda62a    call    $2aa6	; BDOS CALL Open File
1d17 feff      cp      $ff
1d19 ca451d    jp      z,$1d45
1d1c 0e23      ld      c,$23
1d1e cda62a    call    $2aa6	; BDOS CALL Get File Size
1d21 2a7d00    ld      hl,($007d)
1d24 7c        ld      a,h
1d25 b7        or      a
1d26 c2451d    jp      nz,$1d45
1d29 45        ld      b,l
1d2a cd151c    call    $1c15	; get End of TPA
1d2d 7c        ld      a,h
1d2e 3d        dec     a
1d2f 87        add     a,a
1d30 b8        cp      b
1d31 da451d    jp      c,$1d45
1d34 21711d    ld      hl,$1d71
1d37 118000    ld      de,$0080
1d3a 0e27      ld      c,$27
1d3c cd0b2a    call    $2a0b
1d3f 310001    ld      sp,$0100
1d42 c38000    jp      $0080
1d45 3ec6      ld      a,$c6
1d47 cd430c    call    $0c43
1d4a c30000    jp      $0000
1d4d 118000    ld      de,$0080
1d50 0e1a      ld      c,$1a
1d52 cd0500    call    $0005	; BDOS CALL Set DMA Addr
1d55 7e        ld      a,(hl)
1d56 fe2e      cp      $2e
1d58 ca661d    jp      z,$1d66
1d5b fe20      cp      $20
1d5d ca661d    jp      z,$1d66
1d60 12        ld      (de),a
1d61 23        inc     hl
1d62 13        inc     de
1d63 c3551d    jp      $1d55
1d66 3e00      ld      a,$00
1d68 12        ld      (de),a
1d69 0e2f      ld      c,$2f
1d6b cd0500    call    $0005	; BDOS CALL CPM3 CHAIN XXX
1d6e c3451d    jp      $1d45
1d71 00        nop     
1d72 00        nop     
1d73 2aa500    ld      hl,($00a5)
1d76 118000    ld      de,$0080
1d79 19        add     hl,de
1d7a 22a500    ld      ($00a5),hl
1d7d eb        ex      de,hl
1d7e 0e1a      ld      c,$1a
1d80 cd0500    call    $0005	; BDOS CALL Set DMA Addr
1d83 115c00    ld      de,$005c
1d86 0e14      ld      c,$14
1d88 cd0500    call    $0005	; BDOS CALL SEQ Read Next record
1d8b b7        or      a
1d8c ca8000    jp      z,$0080
1d8f 3d        dec     a
1d90 ca0001    jp      z,$0100
1d93 c30000    jp      $0000
1d96 80        add     a,b
1d97 00        nop     
1d98 210000    ld      hl,$0000
1d9b c3a11d    jp      $1da1
1d9e 2a1d02    ld      hl,($021d)
1da1 225636    ld      ($3656),hl
1da4 60        ld      h,b
1da5 69        ld      l,c
1da6 227736    ld      ($3677),hl
1da9 62        ld      h,d
1daa 6b        ld      l,e
1dab 226036    ld      ($3660),hl
1dae 3630      ld      (hl),$30
1db0 23        inc     hl
1db1 3630      ld      (hl),$30
1db3 23        inc     hl
1db4 23        inc     hl
1db5 23        inc     hl
1db6 7e        ld      a,(hl)
1db7 23        inc     hl
1db8 325c36    ld      ($365c),a
1dbb 7e        ld      a,(hl)
1dbc 23        inc     hl
1dbd fe02      cp      $02
1dbf c2cf1d    jp      nz,$1dcf
1dc2 3e01      ld      a,$01
1dc4 327336    ld      ($3673),a
1dc7 cd0f01    call    $010f
1dca af        xor     a
1dcb 327336    ld      ($3673),a
1dce c9        ret     

1dcf 325d36    ld      ($365d),a
1dd2 7e        ld      a,(hl)
1dd3 23        inc     hl
1dd4 e67f      and     $7f
1dd6 325e36    ld      ($365e),a
1dd9 7e        ld      a,(hl)
1dda 325f36    ld      ($365f),a
1ddd 210000    ld      hl,$0000
1de0 39        add     hl,sp
1de1 225836    ld      ($3658),hl
1de4 212600    ld      hl,$0026
1de7 19        add     hl,de
1de8 56        ld      d,(hl)
1de9 23        inc     hl
1dea 5e        ld      e,(hl)
1deb 23        inc     hl
1dec eb        ex      de,hl
1ded 22ff34    ld      ($34ff),hl
1df0 eb        ex      de,hl
1df1 56        ld      d,(hl)
1df2 23        inc     hl
1df3 5e        ld      e,(hl)
1df4 2a5636    ld      hl,($3656)
1df7 19        add     hl,de
1df8 22fd34    ld      ($34fd),hl
1dfb 0a        ld      a,(bc)
1dfc 03        inc     bc
1dfd e60f      and     $0f
1dff 6f        ld      l,a
1e00 fe0b      cp      $0b
1e02 d2271e    jp      nc,$1e27
1e05 0a        ld      a,(bc)
1e06 326236    ld      ($3662),a
1e09 7d        ld      a,l
1e0a 2a6036    ld      hl,($3660)
1e0d eb        ex      de,hl
1e0e cd3124    call    $2431
1e11 2c        inc     l
1e12 1eac      ld      e,$ac
1e14 21b821    ld      hl,$21b8
1e17 89        adc     a,c
1e18 213522    ld      hl,$2235
1e1b 56        ld      d,(hl)
1e1c 225c24    ld      ($245c),hl
1e1f ee24      xor     $24
1e21 4c        ld      c,h
1e22 25        dec     h
1e23 27        daa     
1e24 1ea7      ld      e,$a7
1e26 23        inc     hl
1e27 3ea1      ld      a,$a1
1e29 cd430c    call    $0c43
1e2c af        xor     a
1e2d 327136    ld      ($3671),a
1e30 3a6236    ld      a,($3662)
1e33 b7        or      a
1e34 fae120    jp      m,$20e1
1e37 f5        push    af
1e38 010100    ld      bc,$0001
1e3b cd8a23    call    $238a
1e3e cd7723    call    $2377
1e41 e5        push    hl
1e42 010300    ld      bc,$0003
1e45 09        add     hl,bc
1e46 7e        ld      a,(hl)
1e47 fe3a      cp      $3a
1e49 c2a31e    jp      nz,$1ea3
1e4c 2b        dec     hl
1e4d 2b        dec     hl
1e4e 7e        ld      a,(hl)
1e4f fe46      cp      $46
1e51 caa31e    jp      z,$1ea3
1e54 e1        pop     hl
1e55 cdd81a    call    $1ad8
1e58 3e05      ld      a,$05
1e5a ccea23    call    z,$23ea
1e5d eb        ex      de,hl
1e5e f1        pop     af
1e5f 57        ld      d,a
1e60 f5        push    af
1e61 7e        ld      a,(hl)
1e62 fe14      cp      $14
1e64 c27c1e    jp      nz,$1e7c
1e67 7a        ld      a,d
1e68 fe00      cp      $00
1e6a 3e01      ld      a,$01
1e6c ca7c1e    jp      z,$1e7c
1e6f 7a        ld      a,d
1e70 fe01      cp      $01
1e72 3e02      ld      a,$02
1e74 ca7c1e    jp      z,$1e7c
1e77 3e16      ld      a,$16
1e79 cddd20    call    $20dd
1e7c 325c36    ld      ($365c),a
1e7f 3d        dec     a
1e80 cd3124    call    $2431
1e83 99        sbc     a,c
1e84 1e8f      ld      e,$8f
1e86 1e99      ld      e,$99
1e88 1e8f      ld      e,$8f
1e8a 1e8f      ld      e,$8f
1e8c 1ec0      ld      e,$c0
1e8e 207a      jr      nz,$1f0a
1e90 3d        dec     a
1e91 3e16      ld      a,$16
1e93 c4dd20    call    nz,$20dd
1e96 c3c020    jp      $20c0
1e99 7a        ld      a,d
1e9a b7        or      a
1e9b 3e16      ld      a,$16
1e9d c4dd20    call    nz,$20dd
1ea0 c3c020    jp      $20c0
1ea3 3a5f36    ld      a,($365f)
1ea6 fe80      cp      $80
1ea8 3e0c      ld      a,$0c
1eaa c4dd20    call    nz,$20dd
1ead af        xor     a
1eae 325c36    ld      ($365c),a
1eb1 e1        pop     hl
1eb2 11c734    ld      de,$34c7
1eb5 cd361a    call    $1a36
1eb8 3a6636    ld      a,($3666)
1ebb b7        or      a
1ebc 3e04      ld      a,$04
1ebe c4dd20    call    nz,$20dd
1ec1 012300    ld      bc,$0023
1ec4 cdcb29    call    $29cb
1ec7 3a6f36    ld      a,($366f)
1eca fe0d      cp      $0d
1ecc dad41e    jp      c,$1ed4
1ecf 3e03      ld      a,$03
1ed1 cddd20    call    $20dd
1ed4 3c        inc     a
1ed5 326f36    ld      ($366f),a
1ed8 cdd719    call    $19d7
1edb ca061f    jp      z,$1f06
1ede e5        push    hl
1edf d5        push    de
1ee0 c5        push    bc
1ee1 11c734    ld      de,$34c7
1ee4 060c      ld      b,$0c
1ee6 1a        ld      a,(de)
1ee7 13        inc     de
1ee8 be        cp      (hl)
1ee9 23        inc     hl
1eea c2fd1e    jp      nz,$1efd
1eed 05        dec     b
1eee c2e61e    jp      nz,$1ee6
1ef1 3a6f36    ld      a,($366f)
1ef4 3d        dec     a
1ef5 326f36    ld      ($366f),a
1ef8 3e0c      ld      a,$0c
1efa cddd20    call    $20dd
1efd c1        pop     bc
1efe d1        pop     de
1eff e1        pop     hl
1f00 cde419    call    $19e4
1f03 c2de1e    jp      nz,$1ede
1f06 cda719    call    $19a7
1f09 3e01      ld      a,$01
1f0b ccdd20    call    z,$20dd
1f0e 226736    ld      ($3667),hl
1f11 e5        push    hl
1f12 012f00    ld      bc,$002f
1f15 09        add     hl,bc
1f16 220135    ld      ($3501),hl
1f19 cd872a    call    $2a87
1f1c d1        pop     de
1f1d 2a6036    ld      hl,($3660)
1f20 22eb34    ld      ($34eb),hl
1f23 012400    ld      bc,$0024
1f26 09        add     hl,bc
1f27 73        ld      (hl),e
1f28 23        inc     hl
1f29 72        ld      (hl),d
1f2a 3a6236    ld      a,($3662)
1f2d b7        or      a
1f2e ca721f    jp      z,$1f72
1f31 3d        dec     a
1f32 c2811f    jp      nz,$1f81
1f35 0e13      ld      c,$13
1f37 cd8d2a    call    $2a8d
1f3a 0e16      ld      c,$16
1f3c cd8d2a    call    $2a8d
1f3f feff      cp      $ff
1f41 3e09      ld      a,$09
1f43 cc7c21    call    z,$217c
1f46 3a7336    ld      a,($3673)
1f49 ee01      xor     $01
1f4b 32f234    ld      ($34f2),a
1f4e 3e80      ld      a,$80
1f50 1e00      ld      e,$00
1f52 061a      ld      b,$1a
1f54 cd4b29    call    $294b
1f57 3a5d36    ld      a,($365d)
1f5a fe03      cp      $03
1f5c c26c1f    jp      nz,$1f6c
1f5f 3a7336    ld      a,($3673)
1f62 b7        or      a
1f63 c26c1f    jp      nz,$1f6c
1f66 cd2925    call    $2529
1f69 cdab25    call    $25ab
1f6c cd6829    call    $2968
1f6f c3c020    jp      $20c0
1f72 0e0f      ld      c,$0f
1f74 cd8d2a    call    $2a8d
1f77 feff      cp      $ff
1f79 3e0d      ld      a,$0d
1f7b cc7c21    call    z,$217c
1f7e c38b1f    jp      $1f8b
1f81 0e0f      ld      c,$0f
1f83 cd8d2a    call    $2a8d
1f86 feff      cp      $ff
1f88 ca3a1f    jp      z,$1f3a
1f8b 21ffff    ld      hl,$ffff
1f8e 22ee34    ld      ($34ee),hl
1f91 3a6436    ld      a,($3664)
1f94 b7        or      a
1f95 c2db1f    jp      nz,$1fdb
1f98 af        xor     a
1f99 47        ld      b,a
1f9a 0e11      ld      c,$11
1f9c 32d334    ld      ($34d3),a
1f9f cd8d2a    call    $2a8d
1fa2 feff      cp      $ff
1fa4 cab01f    jp      z,$1fb0
1fa7 04        inc     b
1fa8 3a7436    ld      a,($3674)
1fab b8        cp      b
1fac 78        ld      a,b
1fad d29c1f    jp      nc,$1f9c
1fb0 05        dec     b
1fb1 78        ld      a,b
1fb2 fa461f    jp      m,$1f46
1fb5 32d334    ld      ($34d3),a
1fb8 0e0f      ld      c,$0f
1fba cd8d2a    call    $2a8d
1fbd 3ad634    ld      a,($34d6)
1fc0 3d        dec     a
1fc1 32e734    ld      ($34e7),a
1fc4 fab01f    jp      m,$1fb0
1fc7 4f        ld      c,a
1fc8 3ad334    ld      a,($34d3)
1fcb 0f        rrca    
1fcc f5        push    af
1fcd e67f      and     $7f
1fcf 67        ld      h,a
1fd0 f1        pop     af
1fd1 e680      and     $80
1fd3 b1        or      c
1fd4 6f        ld      l,a
1fd5 22e834    ld      ($34e8),hl
1fd8 c31a20    jp      $201a
1fdb 210800    ld      hl,$0008
1fde 11c734    ld      de,$34c7
1fe1 19        add     hl,de
1fe2 7e        ld      a,(hl)
1fe3 e680      and     $80
1fe5 ca0920    jp      z,$2009
1fe8 0e20      ld      c,$20
1fea 1eff      ld      e,$ff
1fec cd9c2a    call    $2a9c		; BDOS CALL Get Set user Number
1fef f5        push    af
1ff0 0e20      ld      c,$20
1ff2 1e00      ld      e,$00
1ff4 cd9c2a    call    $2a9c		; BDOS CALL Get Set User Number
1ff7 0e23      ld      c,$23
1ff9 cd8d2a    call    $2a8d
1ffc f1        pop     af
1ffd 5f        ld      e,a
1ffe 0e20      ld      c,$20
2000 cd9c2a    call    $2a9c		; BDOS CALL Get Set User Number
2003 11c734    ld      de,$34c7
2006 c30e20    jp      $200e
2009 0e23      ld      c,$23
200b cd8d2a    call    $2a8d
200e 2ae834    ld      hl,($34e8)
2011 7c        ld      a,h
2012 b5        or      l
2013 ca461f    jp      z,$1f46
2016 2b        dec     hl
2017 22e834    ld      ($34e8),hl
201a cd6828    call    $2868
201d 2a0135    ld      hl,($3501)
2020 54        ld      d,h
2021 5d        ld      e,l
2022 018000    ld      bc,$0080
2025 09        add     hl,bc
2026 061a      ld      b,$1a
2028 78        ld      a,b
2029 2b        dec     hl
202a be        cp      (hl)
202b c23520    jp      nz,$2035
202e 0d        dec     c
202f c22920    jp      nz,$2029
2032 c35b20    jp      $205b
2035 3e18      ld      a,$18
2037 b9        cp      c
2038 da5b20    jp      c,$205b
203b 78        ld      a,b
203c eb        ex      de,hl
203d 51        ld      d,c
203e 011400    ld      bc,$0014
2041 09        add     hl,bc
2042 42        ld      b,d
2043 54        ld      d,h
2044 5d        ld      e,l
2045 2b        dec     hl
2046 be        cp      (hl)
2047 c25a20    jp      nz,$205a
204a 0d        dec     c
204b c24520    jp      nz,$2045
204e eb        ex      de,hl
204f 7e        ld      a,(hl)
2050 23        inc     hl
2051 fe1a      cp      $1a
2053 ca7d20    jp      z,$207d
2056 b7        or      a
2057 ca6e20    jp      z,$206e
205a 48        ld      c,b
205b 79        ld      a,c
205c 32ed34    ld      ($34ed),a
205f 3a5d36    ld      a,($365d)
2062 b7        or      a
2063 ca9220    jp      z,$2092
2066 3eb4      ld      a,$b4
2068 327136    ld      ($3671),a
206b c39220    jp      $2092
206e 5e        ld      e,(hl)
206f 23        inc     hl
2070 56        ld      d,(hl)
2071 23        inc     hl
2072 7e        ld      a,(hl)
2073 eb        ex      de,hl
2074 22e834    ld      ($34e8),hl
2077 32ed34    ld      ($34ed),a
207a c39220    jp      $2092
207d 56        ld      d,(hl)
207e 23        inc     hl
207f 5e        ld      e,(hl)
2080 23        inc     hl
2081 7e        ld      a,(hl)
2082 32ed34    ld      ($34ed),a
2085 af        xor     a
2086 7b        ld      a,e
2087 17        rla     
2088 6f        ld      l,a
2089 7a        ld      a,d
208a 1f        rra     
208b 67        ld      h,a
208c 7d        ld      a,l
208d 1f        rra     
208e 6f        ld      l,a
208f 22e834    ld      ($34e8),hl
2092 cd6829    call    $2968
2095 3a6236    ld      a,($3662)
2098 fe03      cp      $03
209a 210000    ld      hl,$0000
209d 7d        ld      a,l
209e c2a820    jp      nz,$20a8
20a1 2aee34    ld      hl,($34ee)
20a4 3af034    ld      a,($34f0)
20a7 b7        or      a
20a8 32ed34    ld      ($34ed),a
20ab 22e834    ld      ($34e8),hl
20ae cab720    jp      z,$20b7
20b1 cd7e28    call    $287e
20b4 c3c020    jp      $20c0
20b7 3e80      ld      a,$80
20b9 1e00      ld      e,$00
20bb 061a      ld      b,$1a
20bd cd4b29    call    $294b
20c0 3a5c36    ld      a,($365c)
20c3 2a6036    ld      hl,($3660)
20c6 110400    ld      de,$0004
20c9 eb        ex      de,hl
20ca 19        add     hl,de
20cb 77        ld      (hl),a
20cc f1        pop     af
20cd 210700    ld      hl,$0007
20d0 19        add     hl,de
20d1 77        ld      (hl),a
20d2 cde129    call    $29e1
20d5 3a7136    ld      a,($3671)
20d8 b7        or      a
20d9 c4ea23    call    nz,$23ea
20dc c9        ret     

20dd f5        push    af
20de c38021    jp      $2180
20e1 3a5f36    ld      a,($365f)
20e4 b7        or      a
20e5 f8        ret     m

20e6 010200    ld      bc,$0002
20e9 cd172a    call    $2a17
20ec c25f21    jp      nz,$215f
20ef 3af234    ld      a,($34f2)
20f2 b7        or      a
20f3 c20021    jp      nz,$2100
20f6 3a6536    ld      a,($3665)
20f9 b7        or      a
20fa c23e21    jp      nz,$213e
20fd c34d21    jp      $214d
2100 3af134    ld      a,($34f1)
2103 b7        or      a
2104 c4b328    call    nz,$28b3
2107 2aee34    ld      hl,($34ee)
210a 3af034    ld      a,($34f0)
210d b7        or      a
210e ca1221    jp      z,$2112
2111 23        inc     hl
2112 22e834    ld      ($34e8),hl
2115 3e80      ld      a,$80
2117 1e00      ld      e,$00
2119 061a      ld      b,$1a
211b cd4b29    call    $294b
211e 2a0135    ld      hl,($3501)
2121 011500    ld      bc,$0015
2124 09        add     hl,bc
2125 eb        ex      de,hl
2126 2aee34    ld      hl,($34ee)
2129 7d        ld      a,l
212a e67f      and     $7f
212c 47        ld      b,a
212d 29        add     hl,hl
212e eb        ex      de,hl
212f 72        ld      (hl),d
2130 23        inc     hl
2131 3e00      ld      a,$00
2133 1f        rra     
2134 b0        or      b
2135 77        ld      (hl),a
2136 23        inc     hl
2137 3af034    ld      a,($34f0)
213a 77        ld      (hl),a
213b cdb328    call    $28b3
213e 0e10      ld      c,$10
2140 cd8d2a    call    $2a8d
2143 feff      cp      $ff
2145 c24d21    jp      nz,$214d
2148 3e0d      ld      a,$0d
214a cd7c21    call    $217c
214d 2a6736    ld      hl,($3667)
2150 cdd319    call    $19d3
2153 216f36    ld      hl,$366f
2156 7e        ld      a,(hl)
2157 b7        or      a
2158 ca5c21    jp      z,$215c
215b 35        dec     (hl)
215c cd7e2a    call    $2a7e
215f 2a6036    ld      hl,($3660)
2162 110700    ld      de,$0007
2165 19        add     hl,de
2166 3680      ld      (hl),$80
2168 fe05      cp      $05
216a c0        ret     nz

216b 3a6536    ld      a,($3665)
216e 3d        dec     a
216f c0        ret     nz

2170 3a6436    ld      a,($3664)
2173 fe30      cp      $30
2175 c0        ret     nz

2176 0e9f      ld      c,$9f
2178 cd0500    call    $0005	; BDOS CALL Detach printer MP/M XXX
217b c9        ret     

217c f5        push    af
217d cd4d21    call    $214d
2180 3eff      ld      a,$ff
2182 325c36    ld      ($365c),a
2185 f1        pop     af
2186 c3ea23    jp      $23ea
2189 cd142a    call    $2a14
218c 3e01      ld      a,$01
218e 326236    ld      ($3662),a
2191 3a5d36    ld      a,($365d)
2194 3d        dec     a
2195 faaf21    jp      m,$21af
2198 c28724    jp      nz,$2487
219b 3a5c36    ld      a,($365c)
219e fe05      cp      $05
21a0 cabb21    jp      z,$21bb
21a3 cdb525    call    $25b5
21a6 cd1422    call    $2214
21a9 c3e129    jp      $29e1
21ac cd142a    call    $2a14
21af cdec21    call    $21ec
21b2 cdc421    call    $21c4
21b5 c3e129    jp      $29e1
21b8 cd142a    call    $2a14
21bb cdc421    call    $21c4
21be cdec21    call    $21ec
21c1 c3e129    jp      $29e1
21c4 3a6236    ld      a,($3662)
21c7 fe80      cp      $80
21c9 215536    ld      hl,$3655
21cc 110100    ld      de,$0001
21cf ca1422    jp      z,$2214
21d2 215436    ld      hl,$3654
21d5 110100    ld      de,$0001
21d8 d21422    jp      nc,$2214
21db b7        or      a
21dc c8        ret     z

21dd 215336    ld      hl,$3653
21e0 110100    ld      de,$0001
21e3 f5        push    af
21e4 cd1422    call    $2214
21e7 f1        pop     af
21e8 3d        dec     a
21e9 c3dc21    jp      $21dc
21ec cdb525    call    $25b5
21ef 3a5d36    ld      a,($365d)
21f2 b7        or      a
21f3 c20822    jp      nz,$2208
21f6 19        add     hl,de
21f7 13        inc     de
21f8 2b        dec     hl
21f9 1b        dec     de
21fa 7b        ld      a,e
21fb b2        or      d
21fc ca0b22    jp      z,$220b
21ff 7e        ld      a,(hl)
2200 fe20      cp      $20
2202 caf821    jp      z,$21f8
2205 2afd34    ld      hl,($34fd)
2208 cd1422    call    $2214
220b 215236    ld      hl,$3652
220e 110100    ld      de,$0001
2211 c31422    jp      $2214
2214 22f934    ld      ($34f9),hl
2217 eb        ex      de,hl
2218 22fb34    ld      ($34fb),hl
221b eb        ex      de,hl
221c 3a5c36    ld      a,($365c)
221f b7        or      a
2220 cacd27    jp      z,$27cd
2223 fe06      cp      $06
2225 d0        ret     nc

; BDOS CALL XXX

2226 4f        ld      c,a
2227 7a        ld      a,d
2228 b3        or      e
2229 c8        ret     z
222a 1b        dec     de
222b d5        push    de
222c 5e        ld      e,(hl)
222d 23        inc     hl
222e cd9c2a    call    $2a9c		; BDOS CALL 
2231 d1        pop     de
2232 c32722    jp      $2227
2235 011001    ld      bc,$0110
2238 cd172a    call    $2a17
223b 3a5d36    ld      a,($365d)
223e 3d        dec     a
223f 3e9e      ld      a,$9e
2241 fcea23    call    m,$23ea
2244 c2c824    jp      nz,$24c8
2247 cd0926    call    $2609
224a cd9e25    call    $259e
224d cdb525    call    $25b5
2250 cdca27    call    $27ca
2253 c3e129    jp      $29e1
2256 010400    ld      bc,$0004
2259 cd172a    call    $2a17
225c cdb525    call    $25b5
225f 3a5d36    ld      a,($365d)
2262 3d        dec     a
2263 faa222    jp      m,$22a2
2266 c23f24    jp      nz,$243f
2269 3a5c36    ld      a,($365c)
226c fe01      cp      $01
226e fa1323    jp      m,$2313
2271 cd9423    call    $2394
2274 ca2223    jp      z,$2322
2277 fe06      cp      $06
2279 d41424    call    nc,$2414
227c 4f        ld      c,a
227d 0600      ld      b,$00
227f 7a        ld      a,d
2280 b3        or      e
2281 c8        ret     z

2282 cd9c2a    call    $2a9c
2285 e67f      and     $7f
2287 ca7f22    jp      z,$227f
228a fe1a      cp      $1a
228c cc1424    call    z,$2414
228f 04        inc     b
2290 05        dec     b
2291 ca9c22    jp      z,$229c
2294 fe0d      cp      $0d
2296 ca7f22    jp      z,$227f
2299 fe0a      cp      $0a
229b c8        ret     z

229c 77        ld      (hl),a
229d 23        inc     hl
229e 1b        dec     de
229f c37f22    jp      $227f
22a2 cd9423    call    $2394
22a5 3a5c36    ld      a,($365c)
22a8 fe01      cp      $01
22aa fad522    jp      m,$22d5
22ad cabb22    jp      z,$22bb
22b0 fe06      cp      $06
22b2 d41424    call    nc,$2414
22b5 4f        ld      c,a
22b6 0601      ld      b,$01
22b8 c37f22    jp      $227f
22bb cd2223    call    $2322
22be 2b        dec     hl
22bf 7e        ld      a,(hl)
22c0 fe0a      cp      $0a
22c2 ccd222    call    z,$22d2
22c5 fe0d      cp      $0d
22c7 ccd222    call    z,$22d2
22ca 2b        dec     hl
22cb 7e        ld      a,(hl)
22cc fe0d      cp      $0d
22ce ccd222    call    z,$22d2
22d1 c9        ret     

22d2 3620      ld      (hl),$20
22d4 c9        ret     

22d5 13        inc     de
22d6 13        inc     de
22d7 eb        ex      de,hl
22d8 22fb34    ld      ($34fb),hl
22db cdc529    call    $29c5
22de dc1424    call    c,$2414
22e1 cda727    call    $27a7
22e4 2b        dec     hl
22e5 7e        ld      a,(hl)
22e6 fe0a      cp      $0a
22e8 ca0323    jp      z,$2303
22eb fe1a      cp      $1a
22ed 3e9f      ld      a,$9f
22ef c4ea23    call    nz,$23ea
22f2 3620      ld      (hl),$20
22f4 2aee34    ld      hl,($34ee)
22f7 22e834    ld      ($34e8),hl
22fa 3af034    ld      a,($34f0)
22fd 32ed34    ld      ($34ed),a
2300 c3e129    jp      $29e1
2303 3620      ld      (hl),$20
2305 2b        dec     hl
2306 7e        ld      a,(hl)
2307 fe0d      cp      $0d
2309 3e9f      ld      a,$9f
230b c4ea23    call    nz,$23ea
230e 3620      ld      (hl),$20
2310 c3e129    jp      $29e1
2313 cdab25    call    $25ab
2316 cdc529    call    $29c5
2319 dc1424    call    c,$2414
231c cda727    call    $27a7
231f c3e129    jp      $29e1
2322 3a5b35    ld      a,($355b)
2325 4f        ld      c,a
2326 b7        or      a
2327 c25323    jp      nz,$2353
232a 0e0a      ld      c,$0a
232c 115e35    ld      de,$355e
232f d5        push    de
2330 cda62a    call    $2aa6	; BDOS CALL read input line until return
2333 1e0a      ld      e,$0a
2335 0e02      ld      c,$02
2337 cda62a    call    $2aa6	; BDOS CALL Print char
233a e1        pop     hl
233b 23        inc     hl
233c 7e        ld      a,(hl)
233d c602      add     a,$02
233f 4f        ld      c,a
2340 23        inc     hl
2341 225c35    ld      ($355c),hl
2344 7e        ld      a,(hl)
2345 fe1a      cp      $1a
2347 cc1424    call    z,$2414
234a 2b        dec     hl
234b 0600      ld      b,$00
234d 09        add     hl,bc
234e 360a      ld      (hl),$0a
2350 2b        dec     hl
2351 360d      ld      (hl),$0d
2353 2af934    ld      hl,($34f9)
2356 e5        push    hl
2357 2afb34    ld      hl,($34fb)
235a eb        ex      de,hl
235b 2a5c35    ld      hl,($355c)
235e 7a        ld      a,d
235f b3        or      e
2360 ca6e23    jp      z,$236e
2363 7e        ld      a,(hl)
2364 23        inc     hl
2365 e3        ex      (sp),hl
2366 77        ld      (hl),a
2367 23        inc     hl
2368 e3        ex      (sp),hl
2369 1b        dec     de
236a 0d        dec     c
236b c25e23    jp      nz,$235e
236e 225c35    ld      ($355c),hl
2371 e1        pop     hl
2372 79        ld      a,c
2373 325b35    ld      ($355b),a
2376 c9        ret     

2377 210b00    ld      hl,$000b
237a 19        add     hl,de
237b af        xor     a
237c be        cp      (hl)
237d c0        ret     nz

237e 210d00    ld      hl,$000d
2381 19        add     hl,de
2382 46        ld      b,(hl)
2383 23        inc     hl
2384 4e        ld      c,(hl)
2385 2a5636    ld      hl,($3656)
2388 09        add     hl,bc
2389 c9        ret     

238a 212300    ld      hl,$0023
238d 19        add     hl,de
238e 7e        ld      a,(hl)
238f 326336    ld      ($3663),a
2392 71        ld      (hl),c
2393 c9        ret     

2394 f5        push    af
2395 e5        push    hl
2396 d5        push    de
2397 7a        ld      a,d
2398 b3        or      e
2399 caa323    jp      z,$23a3
239c 3620      ld      (hl),$20
239e 23        inc     hl
239f 1b        dec     de
23a0 c39723    jp      $2397
23a3 d1        pop     de
23a4 e1        pop     hl
23a5 f1        pop     af
23a6 c9        ret     

23a7 0a        ld      a,(bc)
23a8 ded3      sbc     a,$d3
23aa cac923    jp      z,$23c9
23ad da271e    jp      c,$1e27
23b0 de05      sbc     a,$05
23b2 da271e    jp      c,$1e27
23b5 fe06      cp      $06
23b7 f2271e    jp      p,$1e27
23ba cd3124    call    $2431
23bd 56        ld      d,(hl)
23be 225622    ld      ($2256),hl
23c1 5c        ld      e,h
23c2 24        inc     h
23c3 5c        ld      e,h
23c4 24        inc     h
23c5 a6        and     (hl)
23c6 23        inc     hl
23c7 a6        and     (hl)
23c8 23        inc     hl
23c9 af        xor     a
23ca 326236    ld      ($3662),a
23cd cdaf21    call    $21af
23d0 cd521c    call    $1c52
23d3 fe0d      cp      $0d
23d5 cae323    jp      z,$23e3
23d8 fe1a      cp      $1a
23da cae909    jp      z,$09e9
23dd cd4201    call    $0142
23e0 c3d023    jp      $23d0
23e3 0e02      ld      c,$02
23e5 1e0a      ld      e,$0a
23e7 c3a62a    jp      $2aa6
23ea 0639      ld      b,$39
23ec 4f        ld      c,a
23ed 2a6036    ld      hl,($3660)
23f0 eb        ex      de,hl
23f1 210000    ld      hl,$0000
23f4 19        add     hl,de
23f5 70        ld      (hl),b
23f6 23        inc     hl
23f7 71        ld      (hl),c
23f8 3e00      ld      a,$00
23fa cd8a23    call    $238a
23fd 3a5c36    ld      a,($365c)
2400 b7        or      a
2401 cc022a    call    z,$2a02
2404 cd7e2a    call    $2a7e
2407 3a7336    ld      a,($3673)
240a e601      and     $01
240c 327336    ld      ($3673),a
240f 2a5836    ld      hl,($3658)
2412 f9        ld      sp,hl
2413 c9        ret     

2414 013031    ld      bc,$3130
2417 c3ed23    jp      $23ed
241a 013432    ld      bc,$3234
241d c3ed23    jp      $23ed
2420 013332    ld      bc,$3233
2423 c3ed23    jp      $23ed
2426 013232    ld      bc,$3232
2429 c3ed23    jp      $23ed
242c 3ec7      ld      a,$c7
242e c3ea23    jp      $23ea
2431 60        ld      h,b
2432 69        ld      l,c
2433 87        add     a,a
2434 4f        ld      c,a
2435 0600      ld      b,$00
2437 e3        ex      (sp),hl
2438 09        add     hl,bc
2439 7e        ld      a,(hl)
243a 23        inc     hl
243b 66        ld      h,(hl)
243c 6f        ld      l,a
243d c1        pop     bc
243e e9        jp      (hl)
243f cd9e25    call    $259e
2442 cdb525    call    $25b5
2445 cdbc29    call    $29bc
2448 dc1424    call    c,$2414
244b cda427    call    $27a4
244e cdd125    call    $25d1
2451 f5        push    af
2452 cdab25    call    $25ab
2455 f1        pop     af
2456 ca3f24    jp      z,$243f
2459 c3e129    jp      $29e1
245c 010800    ld      bc,$0008
245f cd172a    call    $2a17
2462 cdb525    call    $25b5
2465 cd2526    call    $2625
2468 cc2024    call    z,$2420
246b dc2024    call    c,$2420
246e cda427    call    $27a4
2471 cdd125    call    $25d1
2474 47        ld      b,a
2475 3a7336    ld      a,($3673)
2478 b7        or      a
2479 c28124    jp      nz,$2481
247c 78        ld      a,b
247d b7        or      a
247e cc2024    call    z,$2420
2481 cdab25    call    $25ab
2484 c3e129    jp      $29e1
2487 3a5e36    ld      a,($365e)
248a b7        or      a
248b c2a024    jp      nz,$24a0
248e cd9e25    call    $259e
2491 cdb525    call    $25b5
2494 cdca27    call    $27ca
2497 cdf325    call    $25f3
249a cdab25    call    $25ab
249d c3e129    jp      $29e1
24a0 3a7336    ld      a,($3673)
24a3 b7        or      a
24a4 c2b624    jp      nz,$24b6
24a7 cd2d26    call    $262d
24aa cc2024    call    z,$2420
24ad dab624    jp      c,$24b6
24b0 cdce25    call    $25ce
24b3 c42624    call    nz,$2426
24b6 cd2526    call    $2625
24b9 cc1a24    call    z,$241a
24bc cdb525    call    $25b5
24bf cdca27    call    $27ca
24c2 cdf325    call    $25f3
24c5 c3e129    jp      $29e1
24c8 3a5e36    ld      a,($365e)
24cb b7        or      a
24cc c2d524    jp      nz,$24d5
24cf cd0926    call    $2609
24d2 c3b624    jp      $24b6
24d5 3a7336    ld      a,($3673)
24d8 b7        or      a
24d9 c2b624    jp      nz,$24b6
24dc cd2d26    call    $262d
24df cc1a24    call    z,$241a
24e2 dc2024    call    c,$2420
24e5 cdce25    call    $25ce
24e8 cc2024    call    z,$2420
24eb c3b624    jp      $24b6
24ee 012001    ld      bc,$0120
24f1 cd172a    call    $2a17
24f4 3a5e36    ld      a,($365e)
24f7 b7        or      a
24f8 c21025    jp      nz,$2510
24fb cd0926    call    $2609
24fe cd2526    call    $2625
2501 cc2c24    call    z,$242c
2504 dc2c24    call    c,$242c
2507 cda526    call    $26a5
250a cd2925    call    $2529
250d c3e129    jp      $29e1
2510 3a7336    ld      a,($3673)
2513 b7        or      a
2514 c2fe24    jp      nz,$24fe
2517 cd2d26    call    $262d
251a cc1a24    call    z,$241a
251d dc2024    call    c,$2420
2520 cdce25    call    $25ce
2523 cc2024    call    z,$2420
2526 c3fe24    jp      $24fe
2529 af        xor     a
252a 320335    ld      ($3503),a
252d 210335    ld      hl,$3503
2530 22f934    ld      ($34f9),hl
2533 210100    ld      hl,$0001
2536 22fb34    ld      ($34fb),hl
2539 2aff34    ld      hl,($34ff)
253c 23        inc     hl
253d 11ffff    ld      de,$ffff
2540 e5        push    hl
2541 d5        push    de
2542 cdcd27    call    $27cd
2545 d1        pop     de
2546 e1        pop     hl
2547 19        add     hl,de
2548 da4025    jp      c,$2540
254b c9        ret     

254c 014000    ld      bc,$0040
254f cd172a    call    $2a17
2552 3a6236    ld      a,($3662)
2555 3d        dec     a
2556 3d        dec     a
2557 fa8025    jp      m,$2580
255a ca6c25    jp      z,$256c
255d cd2d26    call    $262d
2560 ca6c25    jp      z,$256c
2563 dc2024    call    c,$2420
2566 cdce25    call    $25ce
2569 c28f25    jp      nz,$258f
256c cd1f26    call    $261f
256f dc2024    call    c,$2420
2572 cdce25    call    $25ce
2575 f5        push    af
2576 cdd829    call    $29d8
2579 f1        pop     af
257a c28f25    jp      nz,$258f
257d c36c25    jp      $256c
2580 cd2d26    call    $262d
2583 cc2024    call    z,$2420
2586 dc2024    call    c,$2420
2589 cdce25    call    $25ce
258c ca2024    jp      z,$2420
258f cd2526    call    $2625
2592 cc2c24    call    z,$242c
2595 cda526    call    $26a5
2598 cdab25    call    $25ab
259b c3e129    jp      $29e1
259e 2af334    ld      hl,($34f3)
25a1 22f634    ld      ($34f6),hl
25a4 3af534    ld      a,($34f5)
25a7 32f834    ld      ($34f8),a
25aa c9        ret     

25ab cdc325    call    $25c3
25ae 22f334    ld      ($34f3),hl
25b1 32f534    ld      ($34f5),a
25b4 c9        ret     

25b5 2aff34    ld      hl,($34ff)
25b8 22fb34    ld      ($34fb),hl
25bb eb        ex      de,hl
25bc 2afd34    ld      hl,($34fd)
25bf 22f934    ld      ($34f9),hl
25c2 c9        ret     

25c3 2ae834    ld      hl,($34e8)
25c6 3aed34    ld      a,($34ed)
25c9 b7        or      a
25ca f0        ret     p

25cb 23        inc     hl
25cc af        xor     a
25cd c9        ret     

25ce cda526    call    $26a5
25d1 210335    ld      hl,$3503
25d4 22f934    ld      ($34f9),hl
25d7 210200    ld      hl,$0002
25da 22fb34    ld      ($34fb),hl
25dd cda727    call    $27a7
25e0 2a0335    ld      hl,($3503)
25e3 7d        ld      a,l
25e4 fe0d      cp      $0d
25e6 c2f125    jp      nz,$25f1
25e9 7c        ld      a,h
25ea fe0a      cp      $0a
25ec c2f125    jp      nz,$25f1
25ef a7        and     a
25f0 c9        ret     

25f1 af        xor     a
25f2 c9        ret     

25f3 210d0a    ld      hl,$0a0d
25f6 220335    ld      ($3503),hl
25f9 210335    ld      hl,$3503
25fc 22f934    ld      ($34f9),hl
25ff 210200    ld      hl,$0002
2602 22fb34    ld      ($34fb),hl
2605 cdcd27    call    $27cd
2608 c9        ret     

2609 3a6336    ld      a,($3663)
260c fe04      cp      $04
260e c8        ret     z

260f 3ec3      ld      a,$c3
2611 cdea23    call    $23ea
2614 7d        ld      a,l
2615 2f        cpl     
2616 c601      add     a,$01
2618 6f        ld      l,a
2619 7c        ld      a,h
261a 2f        cpl     
261b ce00      adc     a,$00
261d 67        ld      h,a
261e c9        ret     

261f 2aff34    ld      hl,($34ff)
2622 c33926    jp      $2639
2625 2aff34    ld      hl,($34ff)
2628 23        inc     hl
2629 23        inc     hl
262a c33026    jp      $2630
262d 210200    ld      hl,$0002
2630 cd1426    call    $2614
2633 01ffff    ld      bc,$ffff
2636 c33c26    jp      $263c
2639 010000    ld      bc,$0000
263c e5        push    hl
263d 112e00    ld      de,$002e
2640 2a6036    ld      hl,($3660)
2643 19        add     hl,de
2644 5e        ld      e,(hl)
2645 2b        dec     hl
2646 56        ld      d,(hl)
2647 2b        dec     hl
2648 7e        ld      a,(hl)
2649 2b        dec     hl
264a b6        or      (hl)
264b c4a026    call    nz,$26a0
264e 7a        ld      a,d
264f b3        or      e
2650 c25826    jp      nz,$2658
2653 78        ld      a,b
2654 3c        inc     a
2655 e1        pop     hl
2656 c8        ret     z

2657 e5        push    hl
2658 3a7336    ld      a,($3673)
265b b7        or      a
265c c26026    jp      nz,$2660
265f 13        inc     de
2660 2aff34    ld      hl,($34ff)
2663 23        inc     hl
2664 23        inc     hl
2665 c5        push    bc
2666 e5        push    hl
2667 c1        pop     bc
2668 cd1f0b    call    $0b1f
266b c4a026    call    nz,$26a0
266e af        xor     a
266f c1        pop     bc
2670 55        ld      d,l
2671 6c        ld      l,h
2672 67        ld      h,a
2673 e3        ex      (sp),hl
2674 19        add     hl,de
2675 e3        ex      (sp),hl
2676 57        ld      d,a
2677 17        rla     
2678 5f        ld      e,a
2679 19        add     hl,de
267a 09        add     hl,bc
267b af        xor     a
267c d1        pop     de
267d 7b        ld      a,e
267e 17        rla     
267f f5        push    af
2680 7b        ld      a,e
2681 e67f      and     $7f
2683 32f834    ld      ($34f8),a
2686 f1        pop     af
2687 eb        ex      de,hl
2688 7c        ld      a,h
2689 17        rla     
268a 6f        ld      l,a
268b 7b        ld      a,e
268c 17        rla     
268d 67        ld      h,a
268e 22f634    ld      ($34f6),hl
2691 dca026    call    c,$26a0
2694 7a        ld      a,d
2695 b7        or      a
2696 c4a026    call    nz,$26a0
2699 cdbc29    call    $29bc
269c 3e00      ld      a,$00
269e 3c        inc     a
269f c9        ret     

26a0 3ec4      ld      a,$c4
26a2 c3ea23    jp      $23ea
26a5 2ae834    ld      hl,($34e8)
26a8 eb        ex      de,hl
26a9 2af634    ld      hl,($34f6)
26ac 7d        ld      a,l
26ad bb        cp      e
26ae c2d526    jp      nz,$26d5
26b1 7c        ld      a,h
26b2 ba        cp      d
26b3 c2d526    jp      nz,$26d5
26b6 cdbc29    call    $29bc
26b9 d2cb26    jp      nc,$26cb
26bc 0600      ld      b,$00
26be 3af034    ld      a,($34f0)
26c1 5f        ld      e,a
26c2 3af834    ld      a,($34f8)
26c5 cd4b29    call    $294b
26c8 c45b29    call    nz,$295b
26cb 3af834    ld      a,($34f8)
26ce 32ed34    ld      ($34ed),a
26d1 cd6429    call    $2964
26d4 c9        ret     

26d5 cdc529    call    $29c5
26d8 c20227    jp      nz,$2702
26db cdbc29    call    $29bc
26de d20227    jp      nc,$2702
26e1 f5        push    af
26e2 3aed34    ld      a,($34ed)
26e5 b7        or      a
26e6 f24527    jp      p,$2745
26e9 3af134    ld      a,($34f1)
26ec b7        or      a
26ed c4b328    call    nz,$28b3
26f0 2ae834    ld      hl,($34e8)
26f3 23        inc     hl
26f4 22e834    ld      ($34e8),hl
26f7 af        xor     a
26f8 32ed34    ld      ($34ed),a
26fb f1        pop     af
26fc c24927    jp      nz,$2749
26ff c32427    jp      $2724
2702 3af134    ld      a,($34f1)
2705 b7        or      a
2706 c4b328    call    nz,$28b3
2709 cdbc29    call    $29bc
270c da2427    jp      c,$2724
270f 2af634    ld      hl,($34f6)
2712 22e834    ld      ($34e8),hl
2715 af        xor     a
2716 32ed34    ld      ($34ed),a
2719 3a7336    ld      a,($3673)
271c fe03      cp      $03
271e c46828    call    nz,$2868
2721 c3cb26    jp      $26cb
2724 f5        push    af
2725 2aee34    ld      hl,($34ee)
2728 22e834    ld      ($34e8),hl
272b af        xor     a
272c 32ed34    ld      ($34ed),a
272f 3af034    ld      a,($34f0)
2732 b7        or      a
2733 c24227    jp      nz,$2742
2736 1e00      ld      e,$00
2738 061a      ld      b,$1a
273a 3e80      ld      a,$80
273c cd4b29    call    $294b
273f c34527    jp      $2745
2742 cd6828    call    $2868
2745 f1        pop     af
2746 cabc26    jp      z,$26bc
2749 3af034    ld      a,($34f0)
274c 5f        ld      e,a
274d 0600      ld      b,$00
274f 3e80      ld      a,$80
2751 cd4b29    call    $294b
2754 cdb328    call    $28b3
2757 c37b27    jp      $277b
275a 2af634    ld      hl,($34f6)
275d 22e834    ld      ($34e8),hl
2760 3af834    ld      a,($34f8)
2763 1e00      ld      e,$00
2765 0600      ld      b,$00
2767 cd4b29    call    $294b
276a c45b29    call    nz,$295b
276d 3af834    ld      a,($34f8)
2770 5f        ld      e,a
2771 061a      ld      b,$1a
2773 3e80      ld      a,$80
2775 cd4b29    call    $294b
2778 c3cb26    jp      $26cb
277b 0600      ld      b,$00
277d 58        ld      e,b
277e 3e80      ld      a,$80
2780 cd4b29    call    $294b
2783 2af634    ld      hl,($34f6)
2786 eb        ex      de,hl
2787 2ae834    ld      hl,($34e8)
278a 23        inc     hl
278b 22e834    ld      ($34e8),hl
278e 7a        ld      a,d
278f bc        cp      h
2790 dc2c24    call    c,$242c
2793 c29e27    jp      nz,$279e
2796 7b        ld      a,e
2797 bd        cp      l
2798 dc2c24    call    c,$242c
279b ca5a27    jp      z,$275a
279e cdb328    call    $28b3
27a1 c37b27    jp      $277b
27a4 cda526    call    $26a5
27a7 cd2e28    call    $282e
27aa c5        push    bc
27ab d5        push    de
27ac 47        ld      b,a
27ad 3a5d36    ld      a,($365d)
27b0 3d        dec     a
27b1 78        ld      a,b
27b2 c1        pop     bc
27b3 d1        pop     de
27b4 cdf227    call    $27f2
27b7 fac027    jp      m,$27c0
27ba 7c        ld      a,h
27bb 32ed34    ld      ($34ed),a
27be eb        ex      de,hl
27bf c9        ret     

27c0 d5        push    de
27c1 cd4528    call    $2845
27c4 42        ld      b,d
27c5 4b        ld      c,e
27c6 d1        pop     de
27c7 c3b427    jp      $27b4
27ca cda526    call    $26a5
27cd cd5b29    call    $295b
27d0 cd2e28    call    $282e
27d3 cdf227    call    $27f2
27d6 fae027    jp      m,$27e0
27d9 7c        ld      a,h
27da 32ed34    ld      ($34ed),a
27dd c36429    jp      $2964
27e0 c5        push    bc
27e1 cd4528    call    $2845
27e4 c1        pop     bc
27e5 f5        push    af
27e6 7c        ld      a,h
27e7 b5        or      l
27e8 caee27    jp      z,$27ee
27eb cd5b29    call    $295b
27ee f1        pop     af
27ef c3d327    jp      $27d3
27f2 f5        push    af
27f3 e3        ex      (sp),hl
27f4 7c        ld      a,h
27f5 b7        or      a
27f6 7d        ld      a,l
27f7 fa0a28    jp      m,$280a
27fa 24        inc     h
27fb b7        or      a
27fc e3        ex      (sp),hl
27fd 0a        ld      a,(bc)
27fe 03        inc     bc
27ff fc0c28    call    m,$280c
2802 12        ld      (de),a
2803 13        inc     de
2804 2b        dec     hl
2805 7c        ld      a,h
2806 b5        or      l
2807 c2f327    jp      nz,$27f3
280a e1        pop     hl
280b c9        ret     

280c f5        push    af
280d e3        ex      (sp),hl
280e e6ff      and     $ff
2810 67        ld      h,a
2811 e3        ex      (sp),hl
2812 fe0a      cp      $0a
2814 ca2128    jp      z,$2821
2817 fe1a      cp      $1a
2819 ca2928    jp      z,$2829
281c f1        pop     af
281d 327236    ld      ($3672),a
2820 c9        ret     

2821 3a7236    ld      a,($3672)
2824 fe0d      cp      $0d
2826 c21c28    jp      nz,$281c
2829 f1        pop     af
282a 210100    ld      hl,$0001
282d c9        ret     

282e 2af934    ld      hl,($34f9)
2831 44        ld      b,h
2832 4d        ld      c,l
2833 af        xor     a
2834 327236    ld      ($3672),a
2837 2a0135    ld      hl,($3501)
283a 57        ld      d,a
283b 3aed34    ld      a,($34ed)
283e 5f        ld      e,a
283f 19        add     hl,de
2840 eb        ex      de,hl
2841 2afb34    ld      hl,($34fb)
2844 c9        ret     

2845 e5        push    hl
2846 6f        ld      l,a
2847 e5        push    hl
2848 3e80      ld      a,$80
284a 32ed34    ld      ($34ed),a
284d cd6429    call    $2964
2850 2ae834    ld      hl,($34e8)
2853 23        inc     hl
2854 22f634    ld      ($34f6),hl
2857 af        xor     a
2858 32f834    ld      ($34f8),a
285b cda526    call    $26a5
285e 2a0135    ld      hl,($3501)
2861 eb        ex      de,hl
2862 f1        pop     af
2863 3aed34    ld      a,($34ed)
2866 e1        pop     hl
2867 c9        ret     

2868 3a5d36    ld      a,($365d)
286b b7        or      a
286c c27e28    jp      nz,$287e
286f cdc529    call    $29c5
2872 d27e28    jp      nc,$287e
2875 3e80      ld      a,$80
2877 1e00      ld      e,$00
2879 061a      ld      b,$1a
287b c34b29    jp      $294b
287e 3a6436    ld      a,($3664)
2881 b7        or      a
2882 ca9f28    jp      z,$289f
2885 012103    ld      bc,$0321
2888 cd8d2a    call    $2a8d
288b c8        ret     z

288c fe03      cp      $03
288e c29528    jp      nz,$2895
2891 05        dec     b
2892 c28828    jp      nz,$2888
2895 fe05      cp      $05
2897 daa828    jp      c,$28a8
289a 3e18      ld      a,$18
289c cdea23    call    $23ea
289f cde128    call    $28e1
28a2 0e14      ld      c,$14
28a4 cd8d2a    call    $2a8d
28a7 c8        ret     z

28a8 0600      ld      b,$00
28aa 58        ld      e,b
28ab 3e80      ld      a,$80
28ad cd4b29    call    $294b
28b0 c35b29    jp      $295b
28b3 3a6436    ld      a,($3664)
28b6 b7        or      a
28b7 cad128    jp      z,$28d1
28ba 012203    ld      bc,$0322
28bd cd8d2a    call    $2a8d
28c0 cadc28    jp      z,$28dc
28c3 fe03      cp      $03
28c5 c2cc28    jp      nz,$28cc
28c8 05        dec     b
28c9 c2bd28    jp      nz,$28bd
28cc 3e18      ld      a,$18
28ce cdea23    call    $23ea
28d1 cde128    call    $28e1
28d4 0e15      ld      c,$15
28d6 cd8d2a    call    $2a8d
28d9 c2cc28    jp      nz,$28cc
28dc af        xor     a
28dd 32f134    ld      ($34f1),a
28e0 c9        ret     

28e1 3a6436    ld      a,($3664)
28e4 b7        or      a
28e5 c0        ret     nz

28e6 2ae834    ld      hl,($34e8)
28e9 af        xor     a
28ea 7d        ld      a,l
28eb 17        rla     
28ec 7c        ld      a,h
28ed 17        rla     
28ee 67        ld      h,a
28ef 3a7436    ld      a,($3674)
28f2 bc        cp      h
28f3 dc4629    call    c,$2946
28f6 7d        ld      a,l
28f7 e67f      and     $7f
28f9 6f        ld      l,a
28fa 3ad334    ld      a,($34d3)
28fd bc        cp      h
28fe e5        push    hl
28ff ca4029    jp      z,$2940
2902 3c        inc     a
2903 bc        cp      h
2904 c21529    jp      nz,$2915
2907 3ae734    ld      a,($34e7)
290a b7        or      a
290b f21529    jp      p,$2915
290e 7d        ld      a,l
290f b7        or      a
2910 c21529    jp      nz,$2915
2913 e1        pop     hl
2914 c9        ret     

2915 cd7e2a    call    $2a7e
2918 0e10      ld      c,$10
291a cd8d2a    call    $2a8d
291d feff      cp      $ff
291f cc4629    call    z,$2946
2922 c1        pop     bc
2923 c5        push    bc
2924 0e14      ld      c,$14
2926 cdcb29    call    $29cb
2929 0e0f      ld      c,$0f
292b cd8d2a    call    $2a8d
292e feff      cp      $ff
2930 c23d29    jp      nz,$293d
2933 0e16      ld      c,$16
2935 cd8d2a    call    $2a8d
2938 feff      cp      $ff
293a cc4629    call    z,$2946
293d cd842a    call    $2a84
2940 e1        pop     hl
2941 7d        ld      a,l
2942 32e734    ld      ($34e7),a
2945 c9        ret     

2946 3ec2      ld      a,$c2
2948 c3ea23    jp      $23ea
294b 93        sub     e
294c c8        ret     z

294d 1600      ld      d,$00
294f 2a0135    ld      hl,($3501)
2952 19        add     hl,de
2953 70        ld      (hl),b
2954 23        inc     hl
2955 3d        dec     a
2956 c25329    jp      nz,$2953
2959 3d        dec     a
295a c9        ret     

295b 3e01      ld      a,$01
295d 32f134    ld      ($34f1),a
2960 32f234    ld      ($34f2),a
2963 c9        ret     

2964 cdc529    call    $29c5
2967 d0        ret     nc

2968 cdc325    call    $25c3
296b 32f034    ld      ($34f0),a
296e 22ee34    ld      ($34ee),hl
2971 011b00    ld      bc,$001b
2974 eb        ex      de,hl
2975 2aff34    ld      hl,($34ff)
2978 23        inc     hl
2979 23        inc     hl
297a c5        push    bc
297b e5        push    hl
297c 67        ld      h,a
297d af        xor     a
297e 7a        ld      a,d
297f 1f        rra     
2980 6f        ld      l,a
2981 7b        ld      a,e
2982 1f        rra     
2983 57        ld      d,a
2984 3e00      ld      a,$00
2986 1f        rra     
2987 84        add     a,h
2988 5f        ld      e,a
2989 2600      ld      h,$00
298b dc2c24    call    c,$242c
298e c1        pop     bc
298f cd560b    call    $0b56
2992 3a7336    ld      a,($3673)
2995 b7        or      a
2996 c29a29    jp      nz,$299a
2999 1b        dec     de
299a c1        pop     bc
299b 2a6036    ld      hl,($3660)
299e 09        add     hl,bc
299f af        xor     a
29a0 77        ld      (hl),a
29a1 23        inc     hl
29a2 77        ld      (hl),a
29a3 23        inc     hl
29a4 72        ld      (hl),d
29a5 23        inc     hl
29a6 73        ld      (hl),e
29a7 c9        ret     

29a8 eb        ex      de,hl
29a9 47        ld      b,a
29aa 2aee34    ld      hl,($34ee)
29ad 7c        ld      a,h
29ae ba        cp      d
29af c0        ret     nz

29b0 7d        ld      a,l
29b1 bb        cp      e
29b2 c0        ret     nz

29b3 3af034    ld      a,($34f0)
29b6 04        inc     b
29b7 b8        cp      b
29b8 2e01      ld      l,$01
29ba 2d        dec     l
29bb c9        ret     

29bc 2af634    ld      hl,($34f6)
29bf 3af834    ld      a,($34f8)
29c2 c3a829    jp      $29a8
29c5 cdc325    call    $25c3
29c8 c3a829    jp      $29a8
29cb 21d334    ld      hl,$34d3
29ce 70        ld      (hl),b
29cf 23        inc     hl
29d0 3600      ld      (hl),$00
29d2 23        inc     hl
29d3 0d        dec     c
29d4 c2d029    jp      nz,$29d0
29d7 c9        ret     

29d8 012b00    ld      bc,$002b
29db cdc325    call    $25c3
29de c37429    jp      $2974
29e1 3a5c36    ld      a,($365c)
29e4 b7        or      a
29e5 c0        ret     nz

29e6 3a5d36    ld      a,($365d)
29e9 fe03      cp      $03
29eb ccd829    call    z,$29d8
29ee 3a7336    ld      a,($3673)
29f1 47        ld      b,a
29f2 e601      and     $01
29f4 327336    ld      ($3673),a
29f7 3af134    ld      a,($34f1)
29fa 07        rlca    
29fb a0        and     b
29fc c4b328    call    nz,$28b3
29ff cd7e2a    call    $2a7e
2a02 2a6736    ld      hl,($3667)
2a05 eb        ex      de,hl
2a06 21c734    ld      hl,$34c7
2a09 0e2f      ld      c,$2f
2a0b 7e        ld      a,(hl)
2a0c 23        inc     hl
2a0d 12        ld      (de),a
2a0e 13        inc     de
2a0f 0d        dec     c
2a10 c20b2a    jp      nz,$2a0b
2a13 c9        ret     

2a14 018001    ld      bc,$0180
2a17 3a5f36    ld      a,($365f)
2a1a b7        or      a
2a1b f2292a    jp      p,$2a29
2a1e 3aff00    ld      a,($00ff)
2a21 325c36    ld      ($365c),a
2a24 3e02      ld      a,$02
2a26 cdea23    call    $23ea
2a29 c2332a    jp      nz,$2a33
2a2c 78        ld      a,b
2a2d b7        or      a
2a2e 3e06      ld      a,$06
2a30 c4ea23    call    nz,$23ea
2a33 3a7336    ld      a,($3673)
2a36 a0        and     b
2a37 ca4a2a    jp      z,$2a4a
2a3a 2aff34    ld      hl,($34ff)
2a3d 23        inc     hl
2a3e 23        inc     hl
2a3f 29        add     hl,hl
2a40 7d        ld      a,l
2a41 b7        or      a
2a42 c24a2a    jp      nz,$2a4a
2a45 3e03      ld      a,$03
2a47 327336    ld      ($3673),a
2a4a 2a6036    ld      hl,($3660)
2a4d eb        ex      de,hl
2a4e cd8a23    call    $238a
2a51 3a5c36    ld      a,($365c)
2a54 b7        or      a
2a55 c0        ret     nz

2a56 d5        push    de
2a57 212400    ld      hl,$0024
2a5a 19        add     hl,de
2a5b 46        ld      b,(hl)
2a5c 23        inc     hl
2a5d 66        ld      h,(hl)
2a5e 68        ld      l,b
2a5f 226736    ld      ($3667),hl
2a62 11c734    ld      de,$34c7
2a65 0e2f      ld      c,$2f
2a67 cd0b2a    call    $2a0b
2a6a 220135    ld      ($3501),hl
2a6d cd872a    call    $2a87
2a70 d1        pop     de
2a71 2aeb34    ld      hl,($34eb)
2a74 cd1426    call    $2614
2a77 19        add     hl,de
2a78 7c        ld      a,h
2a79 b5        or      l
2a7a c42c24    call    nz,$242c
2a7d c9        ret     

2a7e 218000    ld      hl,$0080
2a81 c3872a    jp      $2a87
2a84 2a0135    ld      hl,($3501)
2a87 eb        ex      de,hl
2a88 0e1a      ld      c,$1a
2a8a c3a62a    jp      $2aa6
2a8d d5        push    de
2a8e 3a6536    ld      a,($3665)
2a91 fe02      cp      $02
2a93 caab2a    jp      z,$2aab
2a96 11c734    ld      de,$34c7
2a99 c39d2a    jp      $2a9d

2a9c d5        push    de
2a9d c5        push    bc
2a9e e5        push    hl
2a9f cda62a    call    $2aa6	; BDOS CALL Generic XXX
2aa2 e1        pop     hl
2aa3 c1        pop     bc
2aa4 d1        pop     de
2aa5 c9        ret     

; BDOS call XXX

2aa6 cd0500    call    $0005
2aa9 b7        or      a
2aaa c9        ret     

2aab c5        push    bc
2aac e5        push    hl
2aad c5        push    bc
2aae cd022a    call    $2a02
2ab1 2a6736    ld      hl,($3667)
2ab4 eb        ex      de,hl
2ab5 c1        pop     bc
2ab6 cda62a    call    $2aa6	; BDOS CALL Generic XXX
2ab9 f5        push    af
2aba 2a6736    ld      hl,($3667)
2abd 11c734    ld      de,$34c7
2ac0 0e2f      ld      c,$2f
2ac2 cd0b2a    call    $2a0b
2ac5 f1        pop     af
2ac6 e1        pop     hl
2ac7 c1        pop     bc
2ac8 d1        pop     de
2ac9 c9        ret     

2aca e3        ex      (sp),hl
2acb fe0a      cp      $0a
2acd cada2a    jp      z,$2ada
2ad0 fe1a      cp      $1a
2ad2 cae22a    jp      z,$2ae2
2ad5 f1        pop     af
2ad6 322b39    ld      ($392b),a
2ad9 c9        ret     

2ada 3a2b39    ld      a,($392b)
2add fe0d      cp      $0d
2adf c2d52a    jp      nz,$2ad5
2ae2 f1        pop     af
2ae3 210100    ld      hl,$0001
2ae6 c9        ret     

2ae7 2ab237    ld      hl,($37b2)
2aea 44        ld      b,h
2aeb 4d        ld      c,l
2aec af        xor     a
2aed 322b39    ld      ($392b),a
2af0 2aba37    ld      hl,($37ba)
2af3 57        ld      d,a
2af4 3aa637    ld      a,($37a6)
2af7 5f        ld      e,a
2af8 19        add     hl,de
2af9 eb        ex      de,hl
2afa 2ab437    ld      hl,($37b4)
2afd c9        ret     

2afe e5        push    hl
2aff 6f        ld      l,a
2b00 e5        push    hl
2b01 3e80      ld      a,$80
2b03 32a637    ld      ($37a6),a
2b06 cd1d2c    call    $2c1d
2b09 2aa137    ld      hl,($37a1)
2b0c 23        inc     hl
2b0d 22af37    ld      ($37af),hl
2b10 af        xor     a
2b11 32b137    ld      ($37b1),a
2b14 cd5e29    call    $295e
2b17 2aba37    ld      hl,($37ba)
2b1a eb        ex      de,hl
2b1b f1        pop     af
2b1c 3aa637    ld      a,($37a6)
2b1f e1        pop     hl
2b20 c9        ret     

2b21 3a1639    ld      a,($3916)
2b24 b7        or      a
2b25 c2372b    jp      nz,$2b37
2b28 cd7e2c    call    $2c7e
2b2b d2372b    jp      nc,$2b37
2b2e 3e80      ld      a,$80
2b30 1e00      ld      e,$00
2b32 061a      ld      b,$1a
2b34 c3042c    jp      $2c04
2b37 3a1d39    ld      a,($391d)
2b3a b7        or      a
2b3b ca582b    jp      z,$2b58
2b3e 012103    ld      bc,$0321
2b41 cd462d    call    $2d46
2b44 c8        ret     z

2b45 fe03      cp      $03
2b47 c24e2b    jp      nz,$2b4e
2b4a 05        dec     b
2b4b c2412b    jp      nz,$2b41
2b4e fe05      cp      $05

; Exit to CP/M

2b50 3e04      ld      a,$04
2b52 210000    ld      hl,$0000
2b55 cdf4ff    call    $fff4 ; call OSBYTE	; NOP
2b58 c30000    jp      $0000

2b5b 0e14      ld      c,$14
2b5d cd462d    call    $2d46

2b60 3e04      ld      a,$04		
2b62 210100    ld      hl,$0001
2b65 cdf4ff    call    $fff4 ; call OSBYTE	; NOP
2b68 c3702b    jp      $2b70

2b6b 2c        inc     l
2b6c 3a1d39    ld      a,($391d)
2b6f b7        or      a
2b70 3ac42b    ld      a,($2bc4)	; Control Acton Z80
2b73 b7        or      a
2b74 3a9d02    ld      a,($029d)
2b77 c0        ret     nz		; NZ -> control ok -> ret

2b78 d1        pop     de
2b79 3eb7      ld      a,$b7		; generate error 183 (=$b7)
2b7b c3430c    jp      $0c43
2b7e 00        nop     
2b7f 00        nop     

; Init vars 

2b80 226436    ld      ($3664),hl
2b83 af        xor     a
2b84 21c42b    ld      hl,$2bc4
2b87 77        ld      (hl),a
2b88 23        inc     hl
2b89 77        ld      (hl),a
2b8a 23        inc     hl
2b8b 23        inc     hl
2b8c 77        ld      (hl),a
2b8d 23        inc     hl
2b8e 77        ld      (hl),a
2b8f 23        inc     hl
2b90 77        ld      (hl),a
2b91 3eff      ld      a,$ff
2b93 32c62b    ld      ($2bc6),a
2b96 011600    ld      bc,$0016
2b99 21c52b    ld      hl,$2bc5
2b9c c5        push    bc
2b9d e5        push    hl
2b9e 3e05      ld      a,$05
2ba0 cdf1ff    call    $fff1	; CALL OSWORD
2ba3 e1        pop     hl		; 3e 20  ld a, $20
2ba4 7d        ld      a,l		; e1     pop hl
2ba5 c604      add     a,$04		; c1     pop bc
2ba7 5f        ld      e,a		; 00     nop
2ba8 7c        ld      a,h		...
2ba9 ce00      adc     a,$00
2bab 57        ld      d,a
2bac 7e        ld      a,(hl)
2bad c603      add     a,$03
2baf 77        ld      (hl),a
2bb0 1a        ld      a,(de)
2bb1 c1        pop     bc
2bb2 b0        or      b
2bb3 47        ld      b,a
2bb4 0d        dec     c
2bb5 c29c2b    jp      nz,$2b9c		...
2bb8 78        ld      a,b		; 00     nop
2bb9 fe20      cp      $20
2bbb c0        ret     nz

2bbc 32c42b    ld      ($2bc4),a
2bbf c9        ret     

2bc0 00        nop     
2bc1 00        nop     
2bc2 00        nop     
2bc3 00        nop     
2bc4 00        nop     			; 20 42      jp nz, 2c08
2bc5 00        nop     			
2bc6 00        nop     			; FF         rst $38
2bc7 00        nop     			; F2 00 20   jp $p,2000
2bc8 00        nop     
2bc9 00        nop     
2bca ce2b      adc     a,$2b
2bcc e1        pop     hl
2bcd c9        ret     

2bce cd372d    call    $2d37
2bd1 0e10      ld      c,$10
2bd3 cd462d    call    $2d46
2bd6 feff      cp      $ff
2bd8 ccff2b    call    z,$2bff
2bdb c1        pop     bc
2bdc c5        push    bc
2bdd 0e14      ld      c,$14
2bdf cd842c    call    $2c84
2be2 0e0f      ld      c,$0f
2be4 cd462d    call    $2d46
2be7 feff      cp      $ff
2be9 c2f62b    jp      nz,$2bf6
2bec 0e16      ld      c,$16
2bee cd462d    call    $2d46
2bf1 feff      cp      $ff
2bf3 ccff2b    call    z,$2bff
2bf6 cd3d2d    call    $2d3d
2bf9 e1        pop     hl
2bfa 7d        ld      a,l
2bfb 32a037    ld      ($37a0),a
2bfe c9        ret     

2bff 3ec2      ld      a,$c2
2c01 c3a326    jp      $26a3
2c04 93        sub     e
2c05 c8        ret     z

2c06 1600      ld      d,$00
2c08 2aba37    ld      hl,($37ba)
2c0b 19        add     hl,de
2c0c 70        ld      (hl),b
2c0d 23        inc     hl
2c0e 3d        dec     a
2c0f c20c2c    jp      nz,$2c0c
2c12 3d        dec     a
2c13 c9        ret     

2c14 3e01      ld      a,$01
2c16 32aa37    ld      ($37aa),a
2c19 32ab37    ld      ($37ab),a
2c1c c9        ret     

2c1d cd7e2c    call    $2c7e
2c20 d0        ret     nc

2c21 cd7c28    call    $287c
2c24 32a937    ld      ($37a9),a
2c27 22a737    ld      ($37a7),hl
2c2a 011b00    ld      bc,$001b
2c2d eb        ex      de,hl
2c2e 2ab837    ld      hl,($37b8)
2c31 23        inc     hl
2c32 23        inc     hl
2c33 c5        push    bc
2c34 e5        push    hl
2c35 67        ld      h,a
2c36 af        xor     a
2c37 7a        ld      a,d
2c38 1f        rra     
2c39 6f        ld      l,a
2c3a 7b        ld      a,e
2c3b 1f        rra     
2c3c 57        ld      d,a
2c3d 3e00      ld      a,$00
2c3f 1f        rra     
2c40 84        add     a,h
2c41 5f        ld      e,a
2c42 2600      ld      h,$00
2c44 dce526    call    c,$26e5
2c47 c1        pop     bc
2c48 cd360b    call    $0b36
2c4b 3a2c39    ld      a,($392c)
2c4e b7        or      a
2c4f c2532c    jp      nz,$2c53
2c52 1b        dec     de
2c53 c1        pop     bc
2c54 2a1939    ld      hl,($3919)
2c57 09        add     hl,bc
2c58 af        xor     a
2c59 77        ld      (hl),a
2c5a 23        inc     hl
2c5b 77        ld      (hl),a
2c5c 23        inc     hl
2c5d 72        ld      (hl),d
2c5e 23        inc     hl
2c5f 73        ld      (hl),e
2c60 c9        ret     

2c61 eb        ex      de,hl
2c62 47        ld      b,a
2c63 2aa737    ld      hl,($37a7)
2c66 7c        ld      a,h
2c67 ba        cp      d
2c68 c0        ret     nz

2c69 7d        ld      a,l
2c6a bb        cp      e
2c6b c0        ret     nz

2c6c 3aa937    ld      a,($37a9)
2c6f 04        inc     b
2c70 b8        cp      b
2c71 2e01      ld      l,$01
2c73 2d        dec     l
2c74 c9        ret     

2c75 2aaf37    ld      hl,($37af)
2c78 3ab137    ld      a,($37b1)
2c7b c3612c    jp      $2c61
2c7e cd7c28    call    $287c
2c81 c3612c    jp      $2c61
2c84 218c37    ld      hl,$378c
2c87 70        ld      (hl),b
2c88 23        inc     hl
2c89 3600      ld      (hl),$00
2c8b 23        inc     hl
2c8c 0d        dec     c
2c8d c2892c    jp      nz,$2c89
2c90 c9        ret     

2c91 012b00    ld      bc,$002b
2c94 cd7c28    call    $287c
2c97 c32d2c    jp      $2c2d
2c9a 3a1539    ld      a,($3915)
2c9d b7        or      a
2c9e c0        ret     nz

2c9f 3a1639    ld      a,($3916)
2ca2 fe03      cp      $03
2ca4 cc912c    call    z,$2c91
2ca7 3a2c39    ld      a,($392c)
2caa 47        ld      b,a
2cab e601      and     $01
2cad 322c39    ld      ($392c),a
2cb0 3aaa37    ld      a,($37aa)
2cb3 07        rlca    
2cb4 a0        and     b
2cb5 c46c2b    call    nz,$2b6c
2cb8 cd372d    call    $2d37
2cbb 2a2039    ld      hl,($3920)
2cbe eb        ex      de,hl
2cbf 218037    ld      hl,$3780
2cc2 0e2f      ld      c,$2f
2cc4 7e        ld      a,(hl)
2cc5 23        inc     hl
2cc6 12        ld      (de),a
2cc7 13        inc     de
2cc8 0d        dec     c
2cc9 c2c42c    jp      nz,$2cc4
2ccc c9        ret     

2ccd 018001    ld      bc,$0180
2cd0 3a1839    ld      a,($3918)
2cd3 b7        or      a
2cd4 f2e22c    jp      p,$2ce2
2cd7 3aff00    ld      a,($00ff)
2cda 321539    ld      ($3915),a
2cdd 3e02      ld      a,$02
2cdf cda326    call    $26a3
2ce2 c2ec2c    jp      nz,$2cec
2ce5 78        ld      a,b
2ce6 b7        or      a
2ce7 3e06      ld      a,$06
2ce9 c4a326    call    nz,$26a3
2cec 3a2c39    ld      a,($392c)
2cef a0        and     b
2cf0 ca032d    jp      z,$2d03
2cf3 2ab837    ld      hl,($37b8)
2cf6 23        inc     hl
2cf7 23        inc     hl
2cf8 29        add     hl,hl
2cf9 7d        ld      a,l
2cfa b7        or      a
2cfb c2032d    jp      nz,$2d03
2cfe 3e03      ld      a,$03
2d00 322c39    ld      ($392c),a
2d03 2a1939    ld      hl,($3919)
2d06 eb        ex      de,hl
2d07 cd4326    call    $2643
2d0a 3a1539    ld      a,($3915)
2d0d b7        or      a
2d0e c0        ret     nz

2d0f d5        push    de
2d10 212400    ld      hl,$0024
2d13 19        add     hl,de
2d14 46        ld      b,(hl)
2d15 23        inc     hl
2d16 66        ld      h,(hl)
2d17 68        ld      l,b
2d18 222039    ld      ($3920),hl
2d1b 118037    ld      de,$3780
2d1e 0e2f      ld      c,$2f
2d20 cdc42c    call    $2cc4
2d23 22ba37    ld      ($37ba),hl
2d26 cd402d    call    $2d40
2d29 d1        pop     de
2d2a 2aa437    ld      hl,($37a4)
2d2d cdcd28    call    $28cd
2d30 19        add     hl,de
2d31 7c        ld      a,h
2d32 b5        or      l
2d33 c4e526    call    nz,$26e5
2d36 c9        ret     

2d37 218000    ld      hl,$0080
2d3a c3402d    jp      $2d40
2d3d 2aba37    ld      hl,($37ba)
2d40 eb        ex      de,hl
2d41 0e1a      ld      c,$1a
2d43 c35f2d    jp      $2d5f
2d46 d5        push    de
2d47 3a1e39    ld      a,($391e)
2d4a fe02      cp      $02
2d4c ca642d    jp      z,$2d64
2d4f 118037    ld      de,$3780
2d52 c3562d    jp      $2d56
2d55 d5        push    de
2d56 c5        push    bc
2d57 e5        push    hl
2d58 cd5f2d    call    $2d5f
2d5b e1        pop     hl
2d5c c1        pop     bc
2d5d d1        pop     de
2d5e c9        ret     

; Call BDOS XXX

2d5f cd0500    call    $0005
2d62 b7        or      a
2d63 c9        ret     

2d64 c5        push    bc
2d65 e5        push    hl
2d66 c5        push    bc
2d67 cdbb2c    call    $2cbb
2d6a 2a2039    ld      hl,($3920)
2d6d eb        ex      de,hl
2d6e c1        pop     bc
2d6f cd5f2d    call    $2d5f
2d72 f5        push    af
2d73 2a2039    ld      hl,($3920)
2d76 118037    ld      de,$3780
2d79 0e2f      ld      c,$2f
2d7b cdc42c    call    $2cc4
2d7e f1        pop     af
2d7f e1        pop     hl
2d80 c1        pop     bc
2d81 d1        pop     de
2d82 c9        ret     

2d83 00        nop     
2d84 00        nop     
2d85 00        nop     
2d86 00        nop     
2d87 00        nop     
2d88 00        nop     
2d89 00        nop     
2d8a 00        nop     
2d8b 00        nop     
2d8c 00        nop     
2d8d 00        nop     
2d8e 00        nop     
2d8f 00        nop     
2d90 00        nop     
2d91 00        nop     
2d92 00        nop     
2d93 00        nop     
2d94 00        nop     
2d95 00        nop     
2d96 ff        rst     $38
2d97 00        nop     
2d98 00        nop     
2d99 00        nop     
2d9a 00        nop     
2d9b 00        nop     
2d9c 00        nop     
2d9d 00        nop     
2d9e 00        nop     
2d9f 00        nop     
2da0 00        nop     
2da1 00        nop     
2da2 00        nop     
2da3 00        nop     
2da4 00        nop     
2da5 00        nop     
2da6 00        nop     
2da7 00        nop     
2da8 00        nop     
2da9 00        nop     
2daa 00        nop     
2dab 00        nop     
2dac 00        nop     
2dad 00        nop     
2dae 00        nop     
2daf 00        nop     
2db0 00        nop     
2db1 00        nop     
2db2 0b        dec     bc
2db3 0c        inc     c
2db4 b9        cp      c
2db5 0f        rrca    
2db6 23        inc     hl
2db7 23        inc     hl
2db8 c5        push    bc
2db9 e5        push    hl
2dba c1        pop     bc
2dbb cd0000    call    $0000
2dbe 00        nop     
2dbf 00        nop     
2dc0 0c        inc     c
2dc1 af        xor     a
2dc2 c1        pop     bc
2dc3 0c        inc     c
2dc4 00        nop     
2dc5 00        nop     
2dc6 00        nop     
2dc7 00        nop     
2dc8 00        nop     
2dc9 00        nop     
2dca 00        nop     
2dcb 00        nop     
2dcc 00        nop     
2dcd 00        nop     
2dce ff        rst     $38
2dcf 0d        dec     c
2dd0 00        nop     
2dd1 00        nop     
2dd2 00        nop     
2dd3 00        nop     
2dd4 00        nop     
2dd5 00        nop     
2dd6 00        nop     
2dd7 00        nop     
2dd8 00        nop     
2dd9 01ff3a    ld      bc,$3aff
2ddc 56        ld      d,(hl)
2ddd 49        ld      c,c
2dde 3a203a    ld      a,($3a20)
2de1 56        ld      d,(hl)
2de2 4f        ld      c,a
2de3 3a2000    ld      a,($0020)
2de6 0c        inc     c
2de7 0c        inc     c
2de8 db2d      in      a,($2d)
2dea e0        ret     po

2deb 2d        dec     l
2dec 012931    ld      bc,$3129
2def 3e00      ld      a,$00
2df1 3c        inc     a
2df2 c9        ret     

2df3 3ec4      ld      a,$c4
2df5 c33d2b    jp      $2b3d
2df8 2aa200    ld      hl,($00a2)
2dfb 00        nop     
2dfc 2ab00d    ld      hl,($0db0)
2dff 0a        ld      a,(bc)
2e00 45        ld      b,l
2e01 52        ld      d,d
2e02 52        ld      d,d
2e03 4f        ld      c,a
2e04 52        ld      d,d
2e05 ba        cp      d
2e06 c2282e    jp      nz,$2e28
2e09 2055      jr      nz,$2e60
2e0b 53        ld      d,e
2e0c 45        ld      b,l
2e0d 52        ld      d,d
2e0e 2050      jr      nz,$2e60
2e10 43        ld      b,e
2e11 20aa      jr      nz,$2dbd
2e13 0f        rrca    
2e14 5f        ld      e,a
2e15 3a0d0a    ld      a,($0a0d)
2e18 53        ld      d,e
2e19 54        ld      d,h
2e1a 41        ld      b,c
2e1b 54        ld      d,h
2e1c 55        ld      d,l
2e1d 53        ld      d,e
2e1e 3d        dec     a
2e1f b2        or      d
2e20 0f        rrca    
2e21 32a70d    ld      ($0da7),a
2e24 0a        ld      a,(bc)
2e25 44        ld      b,h
2e26 3d        dec     a
2e27 20cd      jr      nz,$2df6
2e29 2054      jr      nz,$2e7f
2e2b 3d        dec     a
2e2c 55        ld      d,l
2e2d 2020      jr      nz,$2e4f
2e2f 2020      jr      nz,$2e51
2e31 53        ld      d,e
2e32 3d        dec     a
2e33 2e20      ld      l,$20
2e35 2020      jr      nz,$2e57
2e37 0d        dec     c
2e38 0a        ld      a,(bc)
2e39 00        nop     
2e3a 15        dec     d
2e3b 2e3a      ld      l,$3a
2e3d ab        xor     e
2e3e 0f        rrca    
2e3f b7        or      a
2e40 c40830    call    nz,$3008
2e43 2aa20f    ld      hl,($0fa2)
2e46 23        inc     hl
2e47 22a215    ld      ($15a2),hl
2e4a 3a4630    ld      a,($3046)
2e4d 3a4953    ld      a,($5349)
2e50 49        ld      c,c
2e51 53        ld      d,e
2e52 2e43      ld      l,$43
2e54 4c        ld      c,h
2e55 49        ld      c,c
2e56 200c      jr      nz,$2e64
2e58 12        ld      (de),a
2e59 4a        ld      c,d
2e5a 2e00      ld      l,$00
2e5c 00        nop     
2e5d 010000    ld      bc,$0000
2e60 00        nop     
2e61 0c        inc     c
2e62 13        inc     de
2e63 010405    ld      bc,$0504
2e66 00        nop     
2e67 0100b9    ld      bc,$b900
2e6a 3604      ld      (hl),$04
2e6c 00        nop     
2e6d 27        daa     
2e6e 110000    ld      de,$0000
2e71 80        add     a,b
2e72 3680      ld      (hl),$80
2e74 31b936    ld      sp,$36b9
2e77 00        nop     
2e78 00        nop     
2e79 4a        ld      c,d
2e7a 2e01      ld      l,$01
2e7c 00        nop     
2e7d 00        nop     
2e7e 00        nop     
2e7f 0c        inc     c
2e80 01ff00    ld      bc,$00ff
2e83 12        ld      (de),a
2e84 fc0030    call    m,$3000
2e87 00        nop     
2e88 49        ld      c,c
2e89 53        ld      d,e
2e8a 49        ld      c,c
2e8b 53        ld      d,e
2e8c 00        nop     
2e8d 00        nop     
2e8e 43        ld      b,e
2e8f 4c        ld      c,h
2e90 49        ld      c,c
2e91 03        inc     bc
2e92 0130cd    ld      bc,$cd30
2e95 08        ex      af,af'
2e96 303a      jr      nc,$2ed2
2e98 1811      jr      $2eab
2e9a fe22      cp      $22
2e9c dad02e    jp      c,$2ed0
2e9f 56        ld      d,(hl)
2ea0 2e87      ld      l,$87
2ea2 2e30      ld      l,$30
2ea4 46        ld      b,(hl)
2ea5 00        nop     
2ea6 0a        ld      a,(bc)
2ea7 0a        ld      a,(bc)
2ea8 49        ld      c,c
2ea9 4a        ld      c,d
2eaa 2e87      ld      l,$87
2eac 2e00      ld      l,$00
2eae 00        nop     
2eaf 2ab00f    ld      hl,($0fb0)
2eb2 22a20f    ld      ($0fa2),hl
2eb5 3ab20f    ld      a,($0fb2)
2eb8 1e00      ld      e,$00
2eba 0600      ld      b,$00
2ebc cdb830    call    $30b8
2ebf 0b        dec     bc
2ec0 00        nop     
2ec1 3004      jr      nc,$2ec7
2ec3 00        nop     
2ec4 09        add     hl,bc
2ec5 62        ld      h,d
2ec6 14        inc     d
2ec7 2d        dec     l
2ec8 00        nop     
2ec9 0c        inc     c
2eca 3a410c    ld      a,($0c41)
2ecd 6b        ld      l,e
2ece 2e04      ld      l,$04
2ed0 00        nop     
2ed1 6b        ld      l,e
2ed2 2eff      ld      l,$ff
2ed4 80        add     a,b
2ed5 cdff80    call    $80ff
2ed8 300b      jr      nc,$2ee5
2eda f42e01    call    p,$012e
2edd 00        nop     
2ede f5        push    af
2edf 2e0a      ld      l,$0a
2ee1 b4        or      h
2ee2 3600      ld      (hl),$00
2ee4 00        nop     
2ee5 dc7f2b    call    c,$2b7f
2ee8 0b        dec     bc
2ee9 0e40      ld      c,$40
2eeb 80        add     a,b
2eec 00        nop     
2eed 93        sub     e
2eee 40        ld      b,b
2eef 00        nop     
2ef0 30ff      jr      nc,$2ef1
2ef2 00        nop     
2ef3 00        nop     
2ef4 0d        dec     c
2ef5 00        nop     
2ef6 00        nop     
2ef7 0a        ld      a,(bc)
2ef8 0c        inc     c
2ef9 03        inc     bc
2efa 00        nop     
2efb 6f        ld      l,a
2efc 2e65      ld      l,$65
2efe 2ec5      ld      l,$c5
2f00 d5        push    de
2f01 0a        ld      a,(bc)
2f02 00        nop     
2f03 00        nop     
2f04 00        nop     
2f05 3d        dec     a
2f06 78        ld      a,b
2f07 ff        rst     $38
2f08 4c        ld      c,h
2f09 4c        ld      c,h
2f0a 4c        ld      c,h
2f0b 4c        ld      c,h
2f0c 4c        ld      c,h
2f0d 00        nop     
2f0e 00        nop     
2f0f 00        nop     
2f10 00        nop     
2f11 00        nop     
2f12 34        inc     (hl)
2f13 34        inc     (hl)
2f14 34        inc     (hl)
2f15 34        inc     (hl)
2f16 1a        ld      a,(de)
2f17 00        nop     
2f18 00        nop     
2f19 00        nop     
2f1a 00        nop     
2f1b 00        nop     
2f1c c3092f    jp      $2f09
2f1f cdf82d    call    $2df8
2f22 cdc830    call    $30c8
2f25 cd832f    call    $2f83
2f28 cd472f    call    $2f47
2f2b fa352f    jp      m,$2f35
2f2e 7c        ld      a,h
2f2f 32a70f    ld      ($0fa7),a
2f32 c3d130    jp      $30d1
2f35 c5        push    bc
2f36 cd9a2f    call    $2f9a
2f39 c1        pop     bc
2f3a f5        push    af
2f3b 7c        ld      a,h
2f3c b5        or      l
2f3d ca432f    jp      z,$2f43
2f40 cdc830    call    $30c8
2f43 f1        pop     af
2f44 c3282f    jp      $2f28
2f47 f5        push    af
2f48 e3        ex      (sp),hl
2f49 7c        ld      a,h
2f4a b7        or      a
2f4b 7d        ld      a,l
2f4c fa5f2f    jp      m,$2f5f
2f4f 24        inc     h
2f50 b7        or      a
2f51 e3        ex      (sp),hl
2f52 0a        ld      a,(bc)
2f53 03        inc     bc
2f54 fc612f    call    m,$2f61
2f57 12        ld      (de),a
2f58 13        inc     de
2f59 2b        dec     hl
2f5a 7c        ld      a,h
2f5b b5        or      l
2f5c c2482f    jp      nz,$2f48
2f5f e1        pop     hl
2f60 c9        ret     

2f61 f5        push    af
2f62 e3        ex      (sp),hl
2f63 e6ff      and     $ff
2f65 67        ld      h,a
2f66 e3        ex      (sp),hl
2f67 fe0a      cp      $0a
2f69 ca762f    jp      z,$2f76
2f6c fe1a      cp      $1a
2f6e ca7e2f    jp      z,$2f7e
2f71 f1        pop     af
2f72 322611    ld      ($1126),a
2f75 c9        ret     

2f76 3a2611    ld      a,($1126)
2f79 fe0d      cp      $0d
2f7b c2712f    jp      nz,$2f71
2f7e f1        pop     af
2f7f 210100    ld      hl,$0001
2f82 c9        ret     

2f83 2ab30f    ld      hl,($0fb3)
2f86 44        ld      b,h
2f87 4d        ld      c,l
2f88 af        xor     a
2f89 322611    ld      ($1126),a
2f8c 2abb0f    ld      hl,($0fbb)
2f8f 57        ld      d,a
2f90 3aa70f    ld      a,($0fa7)
2f93 5f        ld      e,a
2f94 19        add     hl,de
2f95 eb        ex      de,hl
2f96 2ab50f    ld      hl,($0fb5)
2f99 c9        ret     

2f9a e5        push    hl
2f9b 6f        ld      l,a
2f9c ff        rst     $38
2f9d 00        nop     
2f9e 80        add     a,b
2f9f 32a70f    ld      ($0fa7),a
2fa2 80        add     a,b
2fa3 04        inc     b
2fa4 010202    ld      bc,$0202
2fa7 1c        inc     e
2fa8 2f        cpl     
2fa9 ff        rst     $38
2faa 00        nop     
2fab 00        nop     
2fac 00        nop     
2fad 00        nop     
2fae b2        or      d
2faf 0f        rrca    
2fb0 ff        rst     $38
2fb1 f8        ret     m

2fb2 2d        dec     l
2fb3 ff        rst     $38
2fb4 bb        cp      e
2fb5 0f        rrca    
2fb6 eb        ex      de,hl
2fb7 f1        pop     af
2fb8 3aa70f    ld      a,($0fa7)
2fbb e1        pop     hl
2fbc 02        ld      (bc),a
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
2fc9 010101    ld      bc,$0101
2fcc 010101    ld      bc,$0101
2fcf 01c3b8    ld      bc,$b8c3
2fd2 80        add     a,b
2fd3 3012      jr      nc,$2fe7
2fd5 a0        and     b
2fd6 0600      ld      b,$00
2fd8 310e2d    ld      sp,$2d0e
2fdb 80        add     a,b
2fdc 3080      jr      nc,$2f5e
2fde 3000      jr      nc,$2fe0
2fe0 f42fe4    call    p,$e42f
2fe3 2f        cpl     
2fe4 00        nop     
2fe5 49        ld      c,c
2fe6 53        ld      d,e
2fe7 49        ld      c,c
2fe8 53        ld      d,e
2fe9 00        nop     
2fea 00        nop     
2feb 43        ld      b,e
2fec 4c        ld      c,h
2fed 49        ld      c,c
2fee 83        add     a,e
2fef 67        ld      h,a
2ff0 13        inc     de
2ff1 00        nop     
2ff2 3003      jr      nc,$2ff7
2ff4 05        dec     b
2ff5 00        nop     
2ff6 3087      jr      nc,$2f7f
2ff8 2e00      ld      l,$00
2ffa 50        ld      d,b
2ffb 00        nop     
2ffc ff        rst     $38
2ffd 00        nop     
2ffe d3ff      out     ($ff),a
3000 db79      in      a,($79)
3002 db7b      in      a,($7b)
3004 dbff      in      a,($ff)
3006 e602      and     $02
3008 c20430    jp      nz,$3004
300b 211e30    ld      hl,$301e
300e 0680      ld      b,$80
3010 118000    ld      de,$0080
3013 7e        ld      a,(hl)
3014 12        ld      (de),a
3015 23        inc     hl
3016 13        inc     de
3017 05        dec     b
3018 c21330    jp      nz,$3013
301b c38000    jp      $0080
301e 310001    ld      sp,$0100
3021 d37f      out     ($7f),a
3023 0602      ld      b,$02
3025 21b700    ld      hl,$00b7
3028 7d        ld      a,l
3029 d379      out     ($79),a
302b 7c        ld      a,h
302c d37a      out     ($7a),a
302e db78      in      a,($78)
3030 e604      and     $04
3032 ca9000    jp      z,$0090
3035 db79      in      a,($79)
3037 e603      and     $03
3039 fe02      cp      $02
303b d28000    jp      nc,$0080
303e db7b      in      a,($7b)
3040 17        rla     
3041 dc0fff    call    c,$ff0f
3044 1f        rra     
3045 e61e      and     $1e
3047 c28000    jp      nz,$0080
304a 110700    ld      de,$0007
304d 19        add     hl,de
304e 05        dec     b
304f c28a00    jp      nz,$008a
3052 c300f2    jp      $f200
3055 80        add     a,b
3056 04        inc     b
3057 33        inc     sp
3058 00        nop     
3059 02        ld      (bc),a
305a 00        nop     
305b dc8004    call    c,$0480
305e 05        dec     b
305f 010180    ld      bc,$8001
3062 f5        push    af
3063 00        nop     
3064 00        nop     
3065 00        nop     
3066 00        nop     
3067 00        nop     
3068 00        nop     
3069 00        nop     
306a 00        nop     
306b 00        nop     
306c 00        nop     
306d 00        nop     
306e 00        nop     
306f 00        nop     
3070 00        nop     
3071 00        nop     
3072 00        nop     
3073 00        nop     
3074 00        nop     
3075 00        nop     
3076 00        nop     
3077 00        nop     
3078 00        nop     
3079 00        nop     
307a 00        nop     
307b 00        nop     
307c 00        nop     
307d 00        nop     
307e 00        nop     
307f 00        nop     
3080 c35cdf    jp      $df5c
3083 c358df    jp      $df58
3086 7f        ld      a,a
3087 00        nop     
3088 2020      jr      nz,$30aa
308a 2020      jr      nz,$30ac
308c 2020      jr      nz,$30ae
308e 2020      jr      nz,$30b0
3090 2020      jr      nz,$30b2
3092 2020      jr      nz,$30b4
3094 2020      jr      nz,$30b6
3096 2020      jr      nz,$30b8
3098 43        ld      b,e
3099 4f        ld      c,a
309a 50        ld      d,b
309b 59        ld      e,c
309c 52        ld      d,d
309d 49        ld      c,c
309e 47        ld      b,a
309f 48        ld      c,b
30a0 54        ld      d,h
30a1 2028      jr      nz,$30cb
30a3 43        ld      b,e
30a4 29        add     hl,hl
30a5 2031      jr      nz,$30d8
30a7 39        add     hl,sp
30a8 37        scf     
30a9 39        add     hl,sp
30aa 2c        inc     l
30ab 2044      jr      nz,$30f1
30ad 49        ld      c,c
30ae 47        ld      b,a
30af 49        ld      c,c
30b0 54        ld      d,h
30b1 41        ld      b,c
30b2 4c        ld      c,h
30b3 2052      jr      nz,$3107
30b5 45        ld      b,l
30b6 53        ld      d,e
30b7 45        ld      b,l
30b8 41        ld      b,c
30b9 52        ld      d,d
30ba 43        ld      b,e
30bb 48        ld      c,b
30bc 2020      jr      nz,$30de
30be 00        nop     
30bf 00        nop     
30c0 00        nop     
30c1 00        nop     
30c2 00        nop     
30c3 00        nop     
30c4 00        nop     
30c5 00        nop     
30c6 00        nop     
30c7 00        nop     
30c8 00        nop     
30c9 00        nop     
30ca 00        nop     
30cb 00        nop     
30cc 00        nop     
30cd 00        nop     
30ce 00        nop     
30cf 00        nop     
30d0 00        nop     
30d1 00        nop     
30d2 00        nop     
30d3 00        nop     
30d4 00        nop     
30d5 00        nop     
30d6 00        nop     
30d7 00        nop     
30d8 00        nop     
30d9 00        nop     
30da 00        nop     
30db 00        nop     
30dc 00        nop     
30dd 00        nop     
30de 00        nop     
30df 00        nop     
30e0 00        nop     
30e1 00        nop     
30e2 00        nop     
30e3 00        nop     
30e4 00        nop     
30e5 00        nop     
30e6 00        nop     
30e7 00        nop     
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
30ff 00        nop     
3100 00        nop     
3101 00        nop     
3102 00        nop     
3103 00        nop     
3104 00        nop     
3105 00        nop     
3106 00        nop     
3107 00        nop     
3108 08        ex      af,af'
3109 dc0000    call    c,$0000
310c 5f        ld      e,a
310d 0e02      ld      c,$02
310f c30500    jp      $0005	; BDOS CALL Print char

3112 c5        push    bc
3113 cd8cdc    call    $dc8c
3116 c1        pop     bc
3117 c9        ret     

3118 3e0d      ld      a,$0d
311a cd92dc    call    $dc92
311d 3e0a      ld      a,$0a
311f c392dc    jp      $dc92
3122 3e20      ld      a,$20
3124 c392dc    jp      $dc92
3127 c5        push    bc
3128 cd98dc    call    $dc98
312b e1        pop     hl
312c 7e        ld      a,(hl)
312d b7        or      a
312e c8        ret     z

312f 23        inc     hl
3130 e5        push    hl
3131 cd8cdc    call    $dc8c
3134 e1        pop     hl
3135 c3acdc    jp      $dcac
3138 0e0d      ld      c,$0d
313a c30500    jp      $0005	; BDOS CALL Reset Disks
313d 5f        ld      e,a
313e 0e0e      ld      c,$0e
3140 c30500    jp      $0005	; BDOS CALL Select Disk

; BDOS CALL XXX

3143 cd0500    call    $0005
3146 32eee3    ld      ($e3ee),a
3149 3c        inc     a
314a c9        ret     

314b 0e0f      ld      c,$0f
314d c3c3dc    jp      $dcc3
3150 af        xor     a
3151 32ede3    ld      ($e3ed),a
3154 11cde3    ld      de,$e3cd
3157 c3cbdc    jp      $dccb
315a 0e10      ld      c,$10
315c c3c3dc    jp      $dcc3
315f 0e11      ld      c,$11
3161 c3c3dc    jp      $dcc3
3164 0e12      ld      c,$12
3166 c3c3dc    jp      $dcc3
3169 11cde3    ld      de,$e3cd
316c c3dfdc    jp      $dcdf
316f 0e13      ld      c,$13	
3171 c30500    jp      $0005	; BDOS CALL Delete File

; BDOS XXX

3174 cd0500    call    $0005
3177 b7        or      a
3178 c9        ret     

3179 0e14      ld      c,$14
317b c3f4dc    jp      $dcf4
317e 11cde3    ld      de,$e3cd
3181 c3f9dc    jp      $dcf9
3184 0e15      ld      c,$15
3186 c3f4dc    jp      $dcf4
3189 0e16      ld      c,$16
318b c3c3dc    jp      $dcc3

318e 0e17      ld      c,$17
3190 c30500    jp      $0005	; BDOS CALL Rename File

3193 1eff      ld      e,$ff
3195 0e20      ld      c,$20
3197 c30500    jp      $0005	; BDOS CALL getSet User Number

319a cd13dd    call    $dd13
319d 87        add     a,a
319e 87        add     a,a
319f 87        add     a,a
31a0 87        add     a,a
31a1 21efe3    ld      hl,$e3ef
31a4 b6        or      (hl)
31a5 320400    ld      ($0004),a
31a8 c9        ret     

31a9 3aefe3    ld      a,($e3ef)
31ac 320400    ld      ($0004),a
31af c9        ret     

31b0 fe61      cp      $61
31b2 d8        ret     c

31b3 fe7b      cp      $7b
31b5 d0        ret     nc

31b6 e65f      and     $5f
31b8 c9        ret     

31b9 3aabe3    ld      a,($e3ab)
31bc b7        or      a
31bd ca96dd    jp      z,$dd96
31c0 3aefe3    ld      a,($e3ef)
31c3 b7        or      a
31c4 3e00      ld      a,$00
31c6 c4bddc    call    nz,$dcbd
31c9 11ace3    ld      de,$e3ac
31cc cdcbdc    call    $dccb
31cf ca96dd    jp      z,$dd96
31d2 3abbe3    ld      a,($e3bb)
31d5 3d        dec     a
31d6 32cce3    ld      ($e3cc),a
31d9 11ace3    ld      de,$e3ac
31dc cdf9dc    call    $dcf9
31df c296dd    jp      nz,$dd96
31e2 1107dc    ld      de,$dc07
31e5 218000    ld      hl,$0080
31e8 0680      ld      b,$80
31ea cd42e0    call    $e042
31ed 21bae3    ld      hl,$e3ba
31f0 3600      ld      (hl),$00
31f2 23        inc     hl
31f3 35        dec     (hl)
31f4 11ace3    ld      de,$e3ac
31f7 cddadc    call    $dcda
31fa ca96dd    jp      z,$dd96
31fd 3aefe3    ld      a,($e3ef)
3200 b7        or      a
3201 c4bddc    call    nz,$dcbd
3204 2108dc    ld      hl,$dc08
3207 cdacdc    call    $dcac
320a cdc2dd    call    $ddc2
320d caa7dd    jp      z,$dda7
3210 cddddd    call    $dddd
3213 c382df    jp      $df82
3216 cddddd    call    $dddd
3219 cd1add    call    $dd1a
321c 0e0a      ld      c,$0a
321e 1106dc    ld      de,$dc06
3221 cd0500    call    $0005	; BDOS CALL Read Line until return
3224 cd29dd    call    $dd29
3227 2107dc    ld      hl,$dc07
322a 46        ld      b,(hl)
322b 23        inc     hl
322c 78        ld      a,b
322d b7        or      a
322e cabadd    jp      z,$ddba
3231 7e        ld      a,(hl)
3232 cd30dd    call    $dd30
3235 77        ld      (hl),a
3236 05        dec     b
3237 c3abdd    jp      $ddab
323a 77        ld      (hl),a
323b 2108dc    ld      hl,$dc08
323e 2288dc    ld      ($dc88),hl
3241 c9        ret     

3242 0e0b      ld      c,$0b
3244 cd0500    call    $0005	; BDOS CALL Console Status
3247 b7        or      a
3248 c8        ret     z

3249 0e01      ld      c,$01
324b cd0500    call    $0005
324e b7        or      a
324f c9        ret     

3250 0e19      ld      c,$19
3252 c30500    jp      $0005
3255 118000    ld      de,$0080
3258 0e1a      ld      c,$1a
325a c30500    jp      $0005
325d 21abe3    ld      hl,$e3ab
3260 7e        ld      a,(hl)
3261 b7        or      a
3262 c8        ret     z

3263 3600      ld      (hl),$00
3265 af        xor     a
3266 cdbddc    call    $dcbd
3269 11ace3    ld      de,$e3ac
326c cdefdc    call    $dcef
326f 3aefe3    ld      a,($e3ef)
3272 c3bddc    jp      $dcbd
3275 1128df    ld      de,$df28
3278 2100e4    ld      hl,$e400
327b 0606      ld      b,$06
327d 1a        ld      a,(de)
327e be        cp      (hl)
327f c2cfdf    jp      nz,$dfcf
3282 13        inc     de
3283 23        inc     hl
3284 05        dec     b
3285 c2fddd    jp      nz,$ddfd
3288 c9        ret     

3289 cd98dc    call    $dc98
328c 2a8adc    ld      hl,($dc8a)
328f 7e        ld      a,(hl)
3290 fe20      cp      $20
3292 ca22de    jp      z,$de22
3295 b7        or      a
3296 ca22de    jp      z,$de22
3299 e5        push    hl
329a cd8cdc    call    $dc8c
329d e1        pop     hl
329e 23        inc     hl
329f c30fde    jp      $de0f
32a2 3e3f      ld      a,$3f
32a4 cd8cdc    call    $dc8c
32a7 cd98dc    call    $dc98
32aa cddddd    call    $dddd
32ad c382df    jp      $df82
32b0 1a        ld      a,(de)
32b1 b7        or      a
32b2 c8        ret     z

32b3 fe20      cp      $20
32b5 da09de    jp      c,$de09
32b8 c8        ret     z

32b9 fe3d      cp      $3d
32bb c8        ret     z

32bc fe5f      cp      $5f
32be c8        ret     z

32bf fe2e      cp      $2e
32c1 c8        ret     z

32c2 fe3a      cp      $3a
32c4 c8        ret     z

32c5 fe3b      cp      $3b
32c7 c8        ret     z

32c8 fe3c      cp      $3c
32ca c8        ret     z

32cb fe3e      cp      $3e
32cd c8        ret     z

32ce c9        ret     

32cf 1a        ld      a,(de)
32d0 b7        or      a
32d1 c8        ret     z

32d2 fe20      cp      $20
32d4 c0        ret     nz

32d5 13        inc     de
32d6 c34fde    jp      $de4f
32d9 85        add     a,l
32da 6f        ld      l,a
32db d0        ret     nc

32dc 24        inc     h
32dd c9        ret     

32de 3e00      ld      a,$00
32e0 21cde3    ld      hl,$e3cd
32e3 cd59de    call    $de59
32e6 e5        push    hl
32e7 e5        push    hl
32e8 af        xor     a
32e9 32f0e3    ld      ($e3f0),a
32ec 2a88dc    ld      hl,($dc88)
32ef eb        ex      de,hl
32f0 cd4fde    call    $de4f
32f3 eb        ex      de,hl
32f4 228adc    ld      ($dc8a),hl
32f7 eb        ex      de,hl
32f8 e1        pop     hl
32f9 1a        ld      a,(de)
32fa b7        or      a
32fb ca89de    jp      z,$de89
32fe de40      sbc     a,$40
3300 47        ld      b,a
3301 13        inc     de
3302 1a        ld      a,(de)
3303 fe3a      cp      $3a
3305 ca90de    jp      z,$de90
3308 1b        dec     de
3309 3aefe3    ld      a,($e3ef)
330c 77        ld      (hl),a
330d c396de    jp      $de96
3310 78        ld      a,b
3311 32f0e3    ld      ($e3f0),a
3314 70        ld      (hl),b
3315 13        inc     de
3316 0608      ld      b,$08
3318 cd30de    call    $de30
331b cab9de    jp      z,$deb9
331e 23        inc     hl
331f fe2a      cp      $2a
3321 c2a9de    jp      nz,$dea9
3324 363f      ld      (hl),$3f
3326 c3abde    jp      $deab
3329 77        ld      (hl),a
332a 13        inc     de
332b 05        dec     b
332c c298de    jp      nz,$de98
332f cd30de    call    $de30
3332 cac0de    jp      z,$dec0
3335 13        inc     de
3336 c3afde    jp      $deaf
3339 23        inc     hl
333a 3620      ld      (hl),$20
333c 05        dec     b
333d c2b9de    jp      nz,$deb9
3340 0603      ld      b,$03
3342 fe2e      cp      $2e
3344 c2e9de    jp      nz,$dee9
3347 13        inc     de
3348 cd30de    call    $de30
334b cae9de    jp      z,$dee9
334e 23        inc     hl
334f fe2a      cp      $2a
3351 c2d9de    jp      nz,$ded9
3354 363f      ld      (hl),$3f
3356 c3dbde    jp      $dedb
3359 77        ld      (hl),a
335a 13        inc     de
335b 05        dec     b
335c c2c8de    jp      nz,$dec8
335f cd30de    call    $de30
3362 caf0de    jp      z,$def0
3365 13        inc     de
3366 c3dfde    jp      $dedf
3369 23        inc     hl
336a 3620      ld      (hl),$20
336c 05        dec     b
336d c2e9de    jp      nz,$dee9
3370 0603      ld      b,$03
3372 23        inc     hl
3373 3600      ld      (hl),$00
3375 05        dec     b
3376 c2f2de    jp      nz,$def2
3379 eb        ex      de,hl
337a 2288dc    ld      ($dc88),hl
337d e1        pop     hl
337e 010b00    ld      bc,$000b
3381 23        inc     hl
3382 7e        ld      a,(hl)
3383 fe3f      cp      $3f
3385 c209df    jp      nz,$df09
3388 04        inc     b
3389 0d        dec     c
338a c201df    jp      nz,$df01
338d 78        ld      a,b
338e b7        or      a
338f c9        ret     

3390 44        ld      b,h
3391 49        ld      c,c
3392 52        ld      d,d
3393 2045      jr      nz,$33da
3395 52        ld      d,d
3396 41        ld      b,c
3397 2054      jr      nz,$33ed
3399 59        ld      e,c
339a 50        ld      d,b
339b 45        ld      b,l
339c 53        ld      d,e
339d 41        ld      b,c
339e 56        ld      d,(hl)
339f 45        ld      b,l
33a0 52        ld      d,d
33a1 45        ld      b,l
33a2 4e        ld      c,(hl)
33a3 2055      jr      nz,$33fa
33a5 53        ld      d,e
33a6 45        ld      b,l
33a7 52        ld      d,d
33a8 00        nop     
33a9 1600      ld      d,$00
33ab 00        nop     
33ac 08        ex      af,af'
33ad 64        ld      h,h
33ae 2110df    ld      hl,$df10
33b1 0e00      ld      c,$00
33b3 79        ld      a,c
33b4 fe06      cp      $06
33b6 d0        ret     nc

33b7 11cee3    ld      de,$e3ce
33ba 0604      ld      b,$04
33bc 1a        ld      a,(de)
33bd be        cp      (hl)
33be c24fdf    jp      nz,$df4f
33c1 13        inc     de
33c2 23        inc     hl
33c3 05        dec     b
33c4 c23cdf    jp      nz,$df3c
33c7 1a        ld      a,(de)
33c8 fe20      cp      $20
33ca c254df    jp      nz,$df54
33cd 79        ld      a,c
33ce c9        ret     

33cf 23        inc     hl
33d0 05        dec     b
33d1 c24fdf    jp      nz,$df4f
33d4 0c        inc     c
33d5 c333df    jp      $df33
33d8 af        xor     a
33d9 3207dc    ld      ($dc07),a
33dc 31abe3    ld      sp,$e3ab
33df c5        push    bc
33e0 79        ld      a,c
33e1 1f        rra     
33e2 1f        rra     
33e3 1f        rra     
33e4 1f        rra     
33e5 e60f      and     $0f
33e7 5f        ld      e,a
33e8 cd15dd    call    $dd15
33eb cdb8dc    call    $dcb8
33ee 32abe3    ld      ($e3ab),a
33f1 c1        pop     bc
33f2 79        ld      a,c
33f3 e60f      and     $0f
33f5 32efe3    ld      ($e3ef),a
33f8 cdbddc    call    $dcbd
33fb 3a07dc    ld      a,($dc07)
33fe b7        or      a
33ff c298df    jp      nz,$df98
3402 31abe3    ld      sp,$e3ab
3405 cd98dc    call    $dc98
3408 cdd0dd    call    $ddd0
340b c641      add     a,$41
340d cd8cdc    call    $dc8c
3410 3e3e      ld      a,$3e
3412 cd8cdc    call    $dc8c
3415 cd39dd    call    $dd39
3418 118000    ld      de,$0080
341b cdd8dd    call    $ddd8
341e cdd0dd    call    $ddd0
3421 32efe3    ld      ($e3ef),a
3424 cd5ede    call    $de5e
3427 c409de    call    nz,$de09
342a 3af0e3    ld      a,($e3f0)
342d b7        or      a
342e c2a5e2    jp      nz,$e2a5
3431 cd2edf    call    $df2e
3434 21c1df    ld      hl,$dfc1
3437 5f        ld      e,a
3438 1600      ld      d,$00
343a 19        add     hl,de
343b 19        add     hl,de
343c 7e        ld      a,(hl)
343d 23        inc     hl
343e 66        ld      h,(hl)
343f 6f        ld      l,a
3440 e9        jp      (hl)
3441 77        ld      (hl),a
3442 e0        ret     po

3443 1f        rra     
3444 e1        pop     hl
3445 5d        ld      e,l
3446 e1        pop     hl
3447 ad        xor     l
3448 e1        pop     hl
3449 10e2      djnz    $342d
344b 8e        adc     a,(hl)
344c e2a5e2    jp      po,$e2a5
344f 21f376    ld      hl,$76f3
3452 2200dc    ld      ($dc00),hl
3455 2100dc    ld      hl,$dc00
3458 e9        jp      (hl)
3459 01dfdf    ld      bc,$dfdf
345c c3a7dc    jp      $dca7
345f 52        ld      d,d
3460 45        ld      b,l
3461 41        ld      b,c
3462 44        ld      b,h
3463 2045      jr      nz,$34aa
3465 52        ld      d,d
3466 52        ld      d,d
3467 4f        ld      c,a
3468 52        ld      d,d
3469 00        nop     
346a 01f0df    ld      bc,$dff0
346d c3a7dc    jp      $dca7
3470 4e        ld      c,(hl)
3471 4f        ld      c,a
3472 2046      jr      nz,$34ba
3474 49        ld      c,c
3475 4c        ld      c,h
3476 45        ld      b,l
3477 00        nop     
3478 cd5ede    call    $de5e
347b 3af0e3    ld      a,($e3f0)
347e b7        or      a
347f c209de    jp      nz,$de09
3482 21cee3    ld      hl,$e3ce
3485 010b00    ld      bc,$000b
3488 7e        ld      a,(hl)
3489 fe20      cp      $20
348b ca33e0    jp      z,$e033
348e 23        inc     hl
348f d630      sub     $30
3491 fe0a      cp      $0a
3493 d209de    jp      nc,$de09
3496 57        ld      d,a
3497 78        ld      a,b
3498 e6e0      and     $e0
349a c209de    jp      nz,$de09
349d 78        ld      a,b
349e 07        rlca    
349f 07        rlca    
34a0 07        rlca    
34a1 80        add     a,b
34a2 da09de    jp      c,$de09
34a5 80        add     a,b
34a6 da09de    jp      c,$de09
34a9 82        add     a,d
34aa da09de    jp      c,$de09
34ad 47        ld      b,a
34ae 0d        dec     c
34af c208e0    jp      nz,$e008
34b2 c9        ret     

34b3 7e        ld      a,(hl)
34b4 fe20      cp      $20
34b6 c209de    jp      nz,$de09
34b9 23        inc     hl
34ba 0d        dec     c
34bb c233e0    jp      nz,$e033
34be 78        ld      a,b
34bf c9        ret     

34c0 0603      ld      b,$03
34c2 7e        ld      a,(hl)
34c3 12        ld      (de),a
34c4 23        inc     hl
34c5 13        inc     de
34c6 05        dec     b
34c7 00        nop     
34c8 2020      jr      nz,$34ea
34ca 2020      jr      nz,$34ec
34cc 2020      jr      nz,$34ee
34ce 2020      jr      nz,$34f0
34d0 2020      jr      nz,$34f2
34d2 2000      jr      nz,$34d4
34d4 00        nop     
34d5 00        nop     
34d6 00        nop     
34d7 e3        ex      (sp),hl
34d8 3af0e3    ld      a,($e3f0)
34db b7        or      a
34dc c8        ret     z

34dd 3d        dec     a
34de 21efe3    ld      hl,$e3ef
34e1 be        cp      (hl)
34e2 c8        ret     z

34e3 c3bddc    jp      $dcbd
34e6 3a0000    ld      a,($0000)
34e9 00        nop     
34ea 00        nop     
34eb 00        nop     
34ec 00        nop     
34ed 00        nop     
34ee 00        nop     
34ef 00        nop     
34f0 00        nop     
34f1 00        nop     
34f2 00        nop     
34f3 00        nop     
34f4 00        nop     
34f5 00        nop     
34f6 00        nop     
34f7 00        nop     
34f8 00        nop     
34f9 00        nop     
34fa 00        nop     
34fb 00        nop     
34fc 00        nop     
34fd 00        nop     
34fe 00        nop     
34ff 00        nop     
3500 00        nop     
3501 00        nop     
3502 00        nop     
3503 c28f05    jp      nz,$058f
3506 4c        ld      c,h
3507 50        ld      d,b
3508 54        ld      d,h
3509 05        dec     b
350a 4c        ld      c,h
350b 53        ld      d,e
350c 54        ld      d,h
350d 05        dec     b
350e 3a4c50    ld      a,($504c)
3511 063a      ld      b,$3a
3513 42        ld      b,d
3514 42        ld      b,d
3515 013a43    ld      bc,$433a
3518 49        ld      c,c
3519 02        ld      (bc),a
351a 3a434f    ld      a,($4f43)
351d 14        inc     d
351e 43        ld      b,e
351f 4f        ld      c,a
3520 4e        ld      c,(hl)
3521 04        inc     b
3522 50        ld      d,b
3523 55        ld      d,l
3524 4e        ld      c,(hl)
3525 04        inc     b
3526 3a5450    ld      a,($5054)
3529 04        inc     b
352a 3a4850    ld      a,($5048)
352d 03        inc     bc
352e 52        ld      d,d
352f 44        ld      b,h
3530 52        ld      d,d
3531 03        inc     bc
3532 3a5452    ld      a,($5254)
3535 03        inc     bc
3536 3a4852    ld      a,($5248)
3539 05        dec     b
353a 50        ld      d,b
353b 52        ld      d,d
353c 4e        ld      c,(hl)
353d 2020      jr      nz,$355f
353f 2020      jr      nz,$3561
3541 2020      jr      nz,$3563
3543 43        ld      b,e
3544 4f        ld      c,a
3545 4e        ld      c,(hl)
3546 3a2020    ld      a,($2020)
3549 43        ld      b,e
354a 4f        ld      c,a
354b 4e        ld      c,(hl)
354c 3a2020    ld      a,($2020)
354f 3c        inc     a
3550 3e2e      ld      a,$2e
3552 2c        inc     l
3553 3b        dec     sp
3554 3a3d3f    ld      a,($3f3d)
3557 2a5b5d    ld      hl,($5d5b)
355a 7f        ld      a,a
355b 00        nop     
355c 00        nop     
355d 00        nop     
355e f0        ret     p

355f 00        nop     
3560 00        nop     
3561 00        nop     
3562 00        nop     
3563 00        nop     
3564 00        nop     
3565 00        nop     
3566 00        nop     
3567 00        nop     
3568 00        nop     
3569 00        nop     
356a 00        nop     
356b 00        nop     
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
3577 00        nop     
3578 00        nop     
3579 00        nop     
357a 00        nop     
357b 00        nop     
357c 00        nop     
357d 00        nop     
357e 00        nop     
357f 00        nop     
3580 00        nop     
3581 00        nop     
3582 00        nop     
3583 00        nop     
3584 00        nop     
3585 00        nop     
3586 00        nop     
3587 00        nop     
3588 00        nop     
3589 00        nop     
358a 00        nop     
358b 00        nop     
358c 00        nop     
358d 00        nop     
358e 00        nop     
358f 00        nop     
3590 00        nop     
3591 00        nop     
3592 00        nop     
3593 00        nop     
3594 00        nop     
3595 00        nop     
3596 00        nop     
3597 00        nop     
3598 00        nop     
3599 00        nop     
359a 00        nop     
359b 00        nop     
359c 00        nop     
359d 00        nop     
359e 00        nop     
359f 00        nop     
35a0 5e        ld      e,(hl)
35a1 defe      sbc     a,$fe
35a3 0b        dec     bc
35a4 c242e1    jp      nz,$e142
35a7 0152e1    ld      bc,$e152
35aa cda7dc    call    $dca7
35ad cd39dd    call    $dd39
35b0 2107dc    ld      hl,$dc07
35b3 35        dec     (hl)
35b4 c282df    jp      nz,$df82
35b7 23        inc     hl
35b8 7e        ld      a,(hl)
35b9 fe59      cp      $59
35bb c282df    jp      nz,$df82
35be 23        inc     hl
35bf 2288dc    ld      ($dc88),hl
35c2 cd54e0    call    $e054
35c5 11cde3    ld      de,$e3cd
35c8 cdefdc    call    $dcef
35cb 3c        inc     a
35cc cceadf    call    z,$dfea
35cf c386e3    jp      $e386
35d2 41        ld      b,c
35d3 4c        ld      c,h
35d4 4c        ld      c,h
35d5 2028      jr      nz,$35ff
35d7 59        ld      e,c
35d8 2f        cpl     
35d9 4e        ld      c,(hl)
35da 29        add     hl,hl
35db 3f        ccf     
35dc 00        nop     
35dd cd5ede    call    $de5e
35e0 c209de    jp      nz,$de09
35e3 cd54e0    call    $e054
35e6 cdd0dc    call    $dcd0
35e9 caa7e1    jp      z,$e1a7
35ec cd98dc    call    $dc98
35ef 21f1e3    ld      hl,$e3f1
35f2 36ff      ld      (hl),$ff
35f4 21f1e3    ld      hl,$e3f1
35f7 7e        ld      a,(hl)
35f8 fe80      cp      $80
35fa da87e1    jp      c,$e187
35fd e5        push    hl
35fe cdfedc    call    $dcfe
3601 e1        pop     hl
3602 c2a0e1    jp      nz,$e1a0
3605 af        xor     a
3606 77        ld      (hl),a
3607 34        inc     (hl)
3608 218000    ld      hl,$0080
360b cd59de    call    $de59
360e 7e        ld      a,(hl)
360f fe1a      cp      $1a
3611 ca86e3    jp      z,$e386
3614 cd8cdc    call    $dc8c
3617 cdc2dd    call    $ddc2
361a c286e3    jp      nz,$e386
361d c374e1    jp      $e174
3620 3d        dec     a
3621 ca86e3    jp      z,$e386
3624 cdd9df    call    $dfd9
3627 cd66e0    call    $e066
362a c309de    jp      $de09
362d cdf8df    call    $dff8
3630 f5        push    af
3631 cd5ede    call    $de5e
3634 c209de    jp      nz,$de09
3637 cd54e0    call    $e054
363a 11cde3    ld      de,$e3cd
363d d5        push    de
363e cdefdc    call    $dcef
3641 d1        pop     de
3642 cd09dd    call    $dd09
3645 cafbe1    jp      z,$e1fb
3648 af        xor     a
3649 32ede3    ld      ($e3ed),a
364c f1        pop     af
364d 6f        ld      l,a
364e 2600      ld      h,$00
3650 29        add     hl,hl
3651 110d0a    ld      de,$0a0d
3654 0b        dec     bc
3655 0c        inc     c
3656 00        nop     
3657 00        nop     
3658 00        nop     
3659 00        nop     
365a 00        nop     
365b 00        nop     
365c 00        nop     
365d 00        nop     
365e 00        nop     
365f 00        nop     
3660 00        nop     
3661 00        nop     
3662 00        nop     
3663 00        nop     
3664 00        nop     
3665 00        nop     
3666 00        nop     
3667 00        nop     
3668 00        nop     
3669 00        nop     
366a 00        nop     
366b 00        nop     
366c 00        nop     
366d 00        nop     
366e 00        nop     
366f 00        nop     
3670 00        nop     
3671 00        nop     
3672 00        nop     
3673 00        nop     
3674 cdda00    call    $00da
3677 00        nop     
3678 00        nop     
3679 48        ld      c,b
367a 49        ld      c,c
367b 54        ld      d,h
367c 204b      jr      nz,$36c9
367e 45        ld      b,l
367f 59        ld      e,c
3680 2054      jr      nz,$36d6
3682 4f        ld      c,a
3683 2045      jr      nz,$36ca
3685 58        ld      e,b
3686 49        ld      c,c
3687 54        ld      d,h
3688 3a24e5    ld      a,($e524)
368b c5        push    bc
368c d5        push    de
368d cdc736    call    $36c7
3690 e5        push    hl
3691 f5        push    af
3692 ca9836    jp      z,$3698
3695 73        ld      (hl),e
3696 23        inc     hl
3697 72        ld      (hl),d
3698 c5        push    bc
3699 d5        push    de
369a c1        pop     bc
369b d1        pop     de
369c cdcd36    call    $36cd
369f cab536    jp      z,$36b5
36a2 f1        pop     af
36a3 cabf36    jp      z,$36bf
36a6 af        xor     a
36a7 77        ld      (hl),a
36a8 23        inc     hl
36a9 77        ld      (hl),a
36aa 23        inc     hl
36ab 5e        ld      e,(hl)
36ac 77        ld      (hl),a
36ad 23        inc     hl
36ae 56        ld      d,(hl)
36af 77        ld      (hl),a
36b0 e1        pop     hl
36b1 e5        push    hl
36b2 c3bf36    jp      $36bf
36b5 f1        pop     af
36b6 c2c236    jp      nz,$36c2
36b9 73        ld      (hl),e
36ba 23        inc     hl
36bb 72        ld      (hl),d
36bc 23        inc     hl
36bd 50        ld      d,b
36be 59        ld      e,c
36bf 73        ld      (hl),e
36c0 23        inc     hl
36c1 72        ld      (hl),d
36c2 e1        pop     hl
36c3 d1        pop     de
36c4 c1        pop     bc
36c5 e1        pop     hl
36c6 c9        ret     

36c7 21ab02    ld      hl,$02ab
36ca c3d036    jp      $36d0
36cd 21a902    ld      hl,$02a9
36d0 d5        push    de
36d1 e5        push    hl
36d2 3aa802    ld      a,($02a8)
36d5 b7        or      a
36d6 f5        push    af
36d7 5e        ld      e,(hl)
36d8 23        inc     hl
36d9 56        ld      d,(hl)
36da 2b        dec     hl
36db 7b        ld      a,e
36dc b2        or      d
36dd c2eb36    jp      nz,$36eb
36e0 f1        pop     af
36e1 dae736    jp      c,$36e7
36e4 d1        pop     de
36e5 e5        push    hl
36e6 37        scf     
36e7 f5        push    af
36e8 c3f136    jp      $36f1
36eb cd0137    call    $3701
36ee cafd36    jp      z,$36fd
36f1 110400    ld      de,$0004
36f4 19        add     hl,de
36f5 f1        pop     af
36f6 3d        dec     a
36f7 c2d636    jp      nz,$36d6
36fa e1        pop     hl
36fb d1        pop     de
36fc c9        ret     

36fd f1        pop     af
36fe d1        pop     de
36ff d1        pop     de
3700 c9        ret     

3701 7b        ld      a,e
3702 b9        cp      c
3703 c0        ret     nz

3704 7a        ld      a,d
3705 b8        cp      b
3706 c9        ret     

3707 2a1d02    ld      hl,($021d)
370a eb        ex      de,hl
370b 2aa002    ld      hl,($02a0)
370e 19        add     hl,de
370f 7e        ld      a,(hl)
3710 b7        or      a
3711 c8        ret     z

3712 f5        push    af
3713 23        inc     hl
3714 7e        ld      a,(hl)
3715 cd8614    call    $1486
3718 7e        ld      a,(hl)
3719 e6df      and     $df
371b 77        ld      (hl),a
371c eb        ex      de,hl
371d cd8211    call    $1182
3720 f1        pop     af
3721 0e00      ld      c,$00
3723 c5        push    bc
3724 cd8614    call    $1486
3727 23        inc     hl
3728 5e        ld      e,(hl)
3729 23        inc     hl
372a 56        ld      d,(hl)
372b d5        push    de
372c cd8811    call    $1188
372f e1        pop     hl
3730 c1        pop     bc
3731 71        ld      (hl),c
3732 2a0902    ld      hl,($0209)
3735 eb        ex      de,hl
3736 2a2502    ld      hl,($0225)
3739 19        add     hl,de
373a eb        ex      de,hl
373b 2a0b02    ld      hl,($020b)
373e 23        inc     hl
373f 23        inc     hl
3740 f601      or      $01
3742 c9        ret     

3743 2a0b02    ld      hl,($020b)
3746 5e        ld      e,(hl)
3747 23        inc     hl
3748 56        ld      d,(hl)
3749 2a3402    ld      hl,($0234)
374c 19        add     hl,de
374d 220902    ld      ($0209),hl
3750 210000    ld      hl,$0000
3753 39        add     hl,sp
3754 227c02    ld      ($027c),hl
3757 2a1d02    ld      hl,($021d)
375a e5        push    hl
375b cd8211    call    $1182
375e 3a5102    ld      a,($0251)
3761 4f        ld      c,a
3762 d1        pop     de
3763 2aa202    ld      hl,($02a2)
3766 19        add     hl,de
3767 7e        ld      a,(hl)
3768 2a5a02    ld      hl,($025a)
376b eb        ex      de,hl
376c cdeb11    call    $11eb
376f cac607    jp      z,$07c6
3772 3abc05    ld      a,($05bc)
3775 0e01      ld      c,$01
3777 cd2337    call    $3723
377a f9        ld      sp,hl
377b c3d207    jp      $07d2
377e cde60d    call    $0de6
3781 cd0908    call    $0809
3784 2a5a02    ld      hl,($025a)
3787 eb        ex      de,hl
3788 3a5102    ld      a,($0251)
378b 4f        ld      c,a
378c cda014    call    $14a0
378f c8        ret     z

3790 4f        ld      c,a
3791 78        ld      a,b
3792 e608      and     $08
3794 c0        ret     nz

3795 79        ld      a,c
3796 cd8614    call    $1486
3799 7e        ld      a,(hl)
379a e6bf      and     $bf
379c 77        ld      (hl),a
379d 23        inc     hl
379e 4e        ld      c,(hl)
379f 23        inc     hl
37a0 46        ld      b,(hl)
37a1 23        inc     hl
37a2 5e        ld      e,(hl)
37a3 23        inc     hl
37a4 56        ld      d,(hl)
37a5 cd8a36    call    $368a
37a8 2a1d02    ld      hl,($021d)
37ab e5        push    hl
37ac c5        push    bc
37ad cd8211    call    $1182
37b0 c1        pop     bc
37b1 e1        pop     hl
37b2 e5        push    hl
37b3 60        ld      h,b
37b4 69        ld      l,c
37b5 221d02    ld      ($021d),hl
37b8 e5        push    hl
37b9 54        ld      d,h
37ba 5d        ld      e,l
37bb 2a4602    ld      hl,($0246)
37be 7d        ld      a,l
37bf 93        sub     e
37c0 5f        ld      e,a
37c1 7c        ld      a,h
37c2 9a        sbc     a,d
37c3 b3        or      e
37c4 c2cd37    jp      nz,$37cd
37c7 210000    ld      hl,$0000
37ca 224602    ld      ($0246),hl
37cd d1        pop     de
37ce cd8811    call    $1188
37d1 cd9211    call    $1192
37d4 e1        pop     hl
37d5 221d02    ld      ($021d),hl
37d8 eb        ex      de,hl
37d9 cd8811    call    $1188
37dc c9        ret     

37dd cd0908    call    $0809
37e0 cd0737    call    $3707
37e3 c8        ret     z

37e4 f9        ld      sp,hl
37e5 c3d207    jp      $07d2
37e8 f1        pop     af
37e9 1a        ld      a,(de)
37ea 4f        ld      c,a
37eb 13        inc     de
37ec 87        add     a,a
37ed 6f        ld      l,a
37ee 2600      ld      h,$00
37f0 19        add     hl,de
37f1 e5        push    hl
37f2 2a7c02    ld      hl,($027c)
37f5 7c        ld      a,h
37f6 b5        or      l
37f7 ca1d08    jp      z,$081d
37fa d5        push    de
37fb 23        inc     hl
37fc 5e        ld      e,(hl)
37fd 1600      ld      d,$00
37ff 19        add     hl,de
3800 19        add     hl,de
3801 23        inc     hl
3802 e5        push    hl
3803 7b        ld      a,e
3804 b9        cp      c
3805 d20938    jp      nc,$3809
3808 4f        ld      c,a
3809 d1        pop     de
380a e1        pop     hl
380b 0d        dec     c
380c fa1d08    jp      m,$081d
380f d5        push    de
3810 56        ld      d,(hl)
3811 23        inc     hl
3812 5e        ld      e,(hl)
3813 23        inc     hl
3814 e3        ex      (sp),hl
3815 e5        push    hl
3816 2a2302    ld      hl,($0223)
3819 3a3302    ld      a,($0233)
381c 47        ld      b,a
381d 05        dec     b
381e fa4738    jp      m,$3847
3821 7a        ld      a,d
3822 be        cp      (hl)
3823 23        inc     hl
3824 23        inc     hl
3825 c24238    jp      nz,$3842
3828 2b        dec     hl
3829 7b        ld      a,e
382a be        cp      (hl)
382b 23        inc     hl
382c c24238    jp      nz,$3842
382f eb        ex      de,hl
3830 e3        ex      (sp),hl
3831 eb        ex      de,hl
3832 1b        dec     de
3833 1b        dec     de
3834 1a        ld      a,(de)
3835 77        ld      (hl),a
3836 23        inc     hl
3837 13        inc     de
3838 1a        ld      a,(de)
3839 77        ld      (hl),a
383a 13        inc     de
383b 23        inc     hl
383c eb        ex      de,hl
383d e3        ex      (sp),hl
383e eb        ex      de,hl
383f c31d38    jp      $381d
3842 23        inc     hl
3843 23        inc     hl
3844 c31d38    jp      $381d
3847 d1        pop     de
3848 1b        dec     de
3849 1b        dec     de
384a d5        push    de
384b c30938    jp      $3809
384e 216c02    ld      hl,$026c
3851 c36138    jp      $3861
3854 215002    ld      hl,$0250
3857 c36138    jp      $3861
385a cd5438    call    $3854
385d af        xor     a
385e 215e02    ld      hl,$025e
3861 eb        ex      de,hl
3862 46        ld      b,(hl)
3863 23        inc     hl
3864 4e        ld      c,(hl)
3865 23        inc     hl
3866 b7        or      a
3867 3e20      ld      a,$20
3869 ca7838    jp      z,$3878
386c a0        and     b
386d 3e20      ld      a,$20
386f ca7738    jp      z,$3877
3872 019180    ld      bc,$8091
3875 2b        dec     hl
3876 7e        ld      a,(hl)
3877 b7        or      a
3878 eb        ex      de,hl
3879 d5        push    de
387a c5        push    bc
387b f5        push    af
387c 3e40      ld      a,$40
387e a0        and     b
387f 57        ld      d,a
3880 3ee0      ld      a,$e0
3882 a1        and     c
3883 0f        rrca    
3884 0f        rrca    
3885 0f        rrca    
3886 0f        rrca    
3887 82        add     a,d
3888 77        ld      (hl),a
3889 23        inc     hl
388a 3e1f      ld      a,$1f
388c a1        and     c
388d 4f        ld      c,a
388e 3e1f      ld      a,$1f
3890 a0        and     b
3891 5f        ld      e,a
3892 de13      sbc     a,$13
3894 daa638    jp      c,$38a6
3897 3c        inc     a
3898 5f        ld      e,a
3899 79        ld      a,c
389a 0f        rrca    
389b 0f        rrca    
389c e607      and     $07
389e 83        add     a,e
389f 5f        ld      e,a
38a0 3e03      ld      a,$03
38a2 a1        and     c
38a3 c620      add     a,$20
38a5 4f        ld      c,a
38a6 1c        inc     e
38a7 1600      ld      d,$00
38a9 0c        inc     c
38aa 73        ld      (hl),e
38ab 23        inc     hl
38ac 72        ld      (hl),d
38ad 23        inc     hl
38ae 71        ld      (hl),c
38af 23        inc     hl
38b0 f1        pop     af
38b1 77        ld      (hl),a
38b2 23        inc     hl
38b3 c1        pop     bc
38b4 78        ld      a,b
38b5 cad538    jp      z,$38d5
38b8 e640      and     $40
38ba cac938    jp      z,$38c9
38bd 79        ld      a,c
38be e680      and     $80
38c0 42        ld      b,d
38c1 4b        ld      c,e
38c2 eb        ex      de,hl
38c3 cd6d39    call    $396d
38c6 eb        ex      de,hl
38c7 50        ld      d,b
38c8 5f        ld      e,a
38c9 010500    ld      bc,$0005
38cc 09        add     hl,bc
38cd c1        pop     bc
38ce 71        ld      (hl),c
38cf 23        inc     hl
38d0 70        ld      (hl),b
38d1 eb        ex      de,hl
38d2 09        add     hl,bc
38d3 eb        ex      de,hl
38d4 c9        ret     

38d5 d1        pop     de
38d6 c3e10c    jp      $0ce1
38d9 00        nop     
38da 0a        ld      a,(bc)
38db 14        inc     d
38dc 1e28      ld      e,$28
38de 323c46    ld      ($463c),a
38e1 50        ld      d,b
38e2 5a        ld      e,d
38e3 00        nop     
38e4 1632      ld      d,$32
38e6 48        ld      c,b
38e7 64        ld      h,h
38e8 80        add     a,b
38e9 96        sub     (hl)
38ea 79        ld      a,c
38eb f5        push    af
38ec e6f0      and     $f0
38ee 0f        rrca    
38ef 0f        rrca    
38f0 0f        rrca    
38f1 0f        rrca    
38f2 4f        ld      c,a
38f3 21d938    ld      hl,$38d9
38f6 09        add     hl,bc
38f7 4e        ld      c,(hl)
38f8 f1        pop     af
38f9 e60f      and     $0f
38fb 81        add     a,c
38fc 4f        ld      c,a
38fd c9        ret     

38fe 010a00    ld      bc,$000a
3901 50        ld      d,b
3902 58        ld      e,b
3903 7e        ld      a,(hl)
3904 b7        or      a
3905 c20e39    jp      nz,$390e
3908 23        inc     hl
3909 0d        dec     c
390a c20339    jp      nz,$3903
390d c9        ret     

390e 0d        dec     c
390f 79        ld      a,c
3910 322d06    ld      ($062d),a
3913 4e        ld      c,(hl)
3914 23        inc     hl
3915 222b06    ld      ($062b),hl
3918 cdea38    call    $38ea
391b eb        ex      de,hl
391c 09        add     hl,bc
391d eb        ex      de,hl
391e d8        ret     c

391f 212d06    ld      hl,$062d
3922 35        dec     (hl)
3923 f8        ret     m

3924 2170fd    ld      hl,$fd70
3927 19        add     hl,de
3928 d8        ret     c

3929 62        ld      h,d
392a 6b        ld      l,e
392b 19        add     hl,de
392c 29        add     hl,hl
392d 19        add     hl,de
392e 54        ld      d,h
392f 5d        ld      e,l
3930 29        add     hl,hl
3931 29        add     hl,hl
3932 19        add     hl,de
3933 29        add     hl,hl
3934 29        add     hl,hl
3935 eb        ex      de,hl
3936 2a2b06    ld      hl,($062b)
3939 c31339    jp      $3913
393c 115e02    ld      de,$025e
393f 62        ld      h,d
3940 6b        ld      l,e
3941 23        inc     hl
3942 af        xor     a
3943 c34e39    jp      $394e
3946 115e02    ld      de,$025e
3949 62        ld      h,d
394a 6b        ld      l,e
394b 23        inc     hl
394c af        xor     a
394d 96        sub     (hl)
394e 23        inc     hl
394f 23        inc     hl
3950 86        add     a,(hl)
3951 37        scf     
3952 3f        ccf     
3953 1f        rra     
3954 3c        inc     a
3955 4f        ld      c,a
3956 0600      ld      b,$00
3958 c9        ret     

3959 41        ld      b,c
395a 1a        ld      a,(de)
395b 2f        cpl     
395c 12        ld      (de),a
395d 13        inc     de
395e 0d        dec     c
395f c25a39    jp      nz,$395a
3962 37        scf     
3963 1b        dec     de
3964 1a        ld      a,(de)
3965 89        adc     a,c
3966 12        ld      (de),a
3967 d0        ret     nc

3968 05        dec     b
3969 c26339    jp      nz,$3963
396c c9        ret     

396d 218b39    ld      hl,$398b
3970 b7        or      a
3971 ca7739    jp      z,$3977
3974 217939    ld      hl,$3979
3977 09        add     hl,bc
3978 7e        ld      a,(hl)
3979 c9        ret     

397a 010102    ld      bc,$0201
397d 02        ld      (bc),a
397e 03        inc     bc
397f 03        inc     bc
3980 03        inc     bc
3981 04        inc     b
3982 04        inc     b
3983 05        dec     b
3984 05        dec     b
3985 05        dec     b
3986 0606      ld      b,$06
3988 07        rlca    
3989 07        rlca    
398a 08        ex      af,af'
398b 08        ex      af,af'
398c 010102    ld      bc,$0201
398f 02        ld      (bc),a
3990 03        inc     bc
3991 03        inc     bc
3992 04        inc     b
3993 04        inc     b
3994 04        inc     b
3995 05        dec     b
3996 05        dec     b
3997 0606      ld      b,$06
3999 0607      ld      b,$07
399b 07        rlca    
399c 08        ex      af,af'
399d 08        ex      af,af'
399e 3c        inc     a
399f cd5438    call    $3854
39a2 cd0908    call    $0809
39a5 115002    ld      de,$0250
39a8 019203    ld      bc,$0392
39ab c3c139    jp      $39c1
39ae 115002    ld      de,$0250
39b1 c3be39    jp      $39be
39b4 3c        inc     a
39b5 cd5e38    call    $385e
39b8 cd0908    call    $0809
39bb 115e02    ld      de,$025e
39be 01a803    ld      bc,$03a8
39c1 60        ld      h,b
39c2 69        ld      l,c
39c3 03        inc     bc
39c4 03        inc     bc
39c5 c5        push    bc
39c6 e5        push    hl
39c7 af        xor     a
39c8 32e903    ld      ($03e9),a
39cb 0e16      ld      c,$16
39cd cdc90b    call    $0bc9
39d0 1a        ld      a,(de)
39d1 e640      and     $40
39d3 c2413a    jp      nz,$3a41
39d6 d5        push    de
39d7 eb        ex      de,hl
39d8 23        inc     hl
39d9 4e        ld      c,(hl)
39da 23        inc     hl
39db 46        ld      b,(hl)
39dc 110800    ld      de,$0008
39df 19        add     hl,de
39e0 5e        ld      e,(hl)
39e1 23        inc     hl
39e2 56        ld      d,(hl)
39e3 eb        ex      de,hl
39e4 d1        pop     de
39e5 e5        push    hl
39e6 1a        ld      a,(de)
39e7 e608      and     $08
39e9 c2123a    jp      nz,$3a12
39ec 1a        ld      a,(de)
39ed e606      and     $06
39ef fe06      cp      $06
39f1 c2fa39    jp      nz,$39fa
39f4 7e        ld      a,(hl)
39f5 23        inc     hl
39f6 e3        ex      (sp),hl
39f7 c3013a    jp      $3a01
39fa fe02      cp      $02
39fc c2063a    jp      nz,$3a06
39ff 09        add     hl,bc
3a00 7e        ld      a,(hl)
3a01 fe2d      cp      $2d
3a03 c3123a    jp      $3a12
3a06 fe04      cp      $04
3a08 ca0d3a    jp      z,$3a0d
3a0b 09        add     hl,bc
3a0c 2b        dec     hl
3a0d 7e        ld      a,(hl)
3a0e e640      and     $40
3a10 fe40      cp      $40
3a12 e1        pop     hl
3a13 e3        ex      (sp),hl
3a14 c2183a    jp      nz,$3a18
3a17 35        dec     (hl)
3a18 cd4939    call    $3949
3a1b 13        inc     de
3a1c 1a        ld      a,(de)
3a1d d1        pop     de
3a1e e1        pop     hl
3a1f f5        push    af
3a20 b7        or      a
3a21 c2263a    jp      nz,$3a26
3a24 f1        pop     af
3a25 c9        ret     

3a26 09        add     hl,bc
3a27 4f        ld      c,a
3a28 f1        pop     af
3a29 da353a    jp      c,$3a35
3a2c 1a        ld      a,(de)
3a2d 87        add     a,a
3a2e 87        add     a,a
3a2f 87        add     a,a
3a30 87        add     a,a
3a31 77        ld      (hl),a
3a32 13        inc     de
3a33 0d        dec     c
3a34 c8        ret     z

3a35 1a        ld      a,(de)
3a36 e60f      and     $0f
3a38 86        add     a,(hl)
3a39 77        ld      (hl),a
3a3a 23        inc     hl
3a3b 13        inc     de
3a3c 0d        dec     c
3a3d c22c3a    jp      nz,$3a2c
3a40 c9        ret     

3a41 1a        ld      a,(de)
3a42 e602      and     $02
3a44 caec3a    jp      z,$3aec
3a47 e1        pop     hl
3a48 e3        ex      (sp),hl
3a49 d5        push    de
3a4a e5        push    hl
3a4b cd4939    call    $3949
3a4e 7e        ld      a,(hl)
3a4f f5        push    af
3a50 13        inc     de
3a51 1a        ld      a,(de)
3a52 210900    ld      hl,$0009
3a55 19        add     hl,de
3a56 5e        ld      e,(hl)
3a57 23        inc     hl
3a58 56        ld      d,(hl)
3a59 e1        pop     hl
3a5a e3        ex      (sp),hl
3a5b 09        add     hl,bc
3a5c 4f        ld      c,a
3a5d f1        pop     af
3a5e f5        push    af
3a5f 1f        rra     
3a60 da823a    jp      c,$3a82
3a63 f1        pop     af
3a64 da6f3a    jp      c,$3a6f
3a67 1a        ld      a,(de)
3a68 13        inc     de
3a69 87        add     a,a
3a6a 87        add     a,a
3a6b 87        add     a,a
3a6c 87        add     a,a
3a6d 77        ld      (hl),a
3a6e 0d        dec     c
3a6f 1a        ld      a,(de)
3a70 0f        rrca    
3a71 0f        rrca    
3a72 0f        rrca    
3a73 0f        rrca    
3a74 e60f      and     $0f
3a76 86        add     a,(hl)
3a77 77        ld      (hl),a
3a78 23        inc     hl
3a79 0d        dec     c
3a7a c2673a    jp      nz,$3a67
3a7d 1a        ld      a,(de)
3a7e 47        ld      b,a
3a7f c3983a    jp      $3a98
3a82 f1        pop     af
3a83 da8a3a    jp      c,$3a8a
3a86 0d        dec     c
3a87 ca933a    jp      z,$3a93
3a8a 1a        ld      a,(de)
3a8b 77        ld      (hl),a
3a8c 13        inc     de
3a8d 23        inc     hl
3a8e 0d        dec     c
3a8f 0d        dec     c
3a90 c28a3a    jp      nz,$3a8a
3a93 1a        ld      a,(de)
3a94 47        ld      b,a
3a95 e6f0      and     $f0
3a97 77        ld      (hl),a
3a98 d1        pop     de
3a99 e1        pop     hl
3a9a 1a        ld      a,(de)
3a9b e608      and     $08
3a9d c0        ret     nz

3a9e 78        ld      a,b
3a9f e60f      and     $0f
3aa1 fe0d      cp      $0d
3aa3 c0        ret     nz

3aa4 35        dec     (hl)
3aa5 c9        ret     

3aa6 00        nop     
3aa7 00        nop     
3aa8 04        inc     b
3aa9 1a        ld      a,(de)
3aaa 08        ex      af,af'
3aab 34        inc     (hl)
3aac 02        ld      (bc),a
3aad 4d        ld      c,l
3aae 0667      ld      b,$67
3ab0 00        nop     
3ab1 80        add     a,b
3ab2 04        inc     b
3ab3 9a        sbc     a,d
3ab4 08        ex      af,af'
3ab5 b4        or      h
3ab6 02        ld      (bc),a
3ab7 cd06e7    call    $e706
3aba 00        nop     
3abb 00        nop     
3abc 2c        inc     l
3abd 03        inc     bc
3abe 58        ld      e,b
3abf 0620      ld      b,$20
3ac1 08        ex      af,af'
3ac2 4c        ld      c,h
3ac3 0b        dec     bc
3ac4 14        inc     d
3ac5 0d        dec     c
3ac6 40        ld      b,b
3ac7 1008      djnz    $3ad1
3ac9 12        ld      (de),a
3aca 34        inc     (hl)
3acb 15        dec     d
3acc 60        ld      h,b
3acd 1828      jr      $3af7
3acf 1a        ld      a,(de)
3ad0 54        ld      d,h
3ad1 1d        dec     e
3ad2 1c        inc     e
3ad3 1f        rra     
3ad4 48        ld      c,b
3ad5 221024    ld      ($2410),hl
3ad8 3c        inc     a
3ad9 27        daa     
3ada 04        inc     b
3adb 29        add     hl,hl
3adc 302c      jr      nc,$3b0a
3ade 5c        ld      e,h
3adf 2f        cpl     
3ae0 24        inc     h
3ae1 315034    ld      sp,$3450
3ae4 1836      jr      $3b1c
3ae6 44        ld      b,h
3ae7 39        add     hl,sp
3ae8 0c        inc     c
3ae9 3b        dec     sp
3aea 383e      jr      c,$3b2a
3aec d5        push    de
3aed eb        ex      de,hl
3aee 7e        ld      a,(hl)
3aef e608      and     $08
3af1 23        inc     hl
3af2 4e        ld      c,(hl)
3af3 23        inc     hl
3af4 46        ld      b,(hl)
3af5 cd6d39    call    $396d
3af8 322806    ld      ($0628),a
3afb d1        pop     de
3afc d5        push    de
3afd 4f        ld      c,a
3afe 210a00    ld      hl,$000a
3b01 44        ld      b,h
3b02 19        add     hl,de
3b03 5e        ld      e,(hl)
3b04 23        inc     hl
3b05 56        ld      d,(hl)
3b06 21eb03    ld      hl,$03eb
3b09 222906    ld      ($0629),hl
3b0c e5        push    hl
3b0d cda70b    call    $0ba7
3b10 d1        pop     de
3b11 c1        pop     bc
3b12 e1        pop     hl
3b13 c5        push    bc
3b14 0a        ld      a,(bc)
3b15 e608      and     $08
3b17 c2273b    jp      nz,$3b27
3b1a 1a        ld      a,(de)
3b1b b7        or      a
3b1c f2273b    jp      p,$3b27
3b1f 35        dec     (hl)
3b20 3a2806    ld      a,($0628)
3b23 4f        ld      c,a
3b24 cd5939    call    $3959
3b27 d1        pop     de
3b28 cd3f39    call    $393f
3b2b e1        pop     hl
3b2c f5        push    af
3b2d 09        add     hl,bc
3b2e f1        pop     af
3b2f e5        push    hl
3b30 0664      ld      b,$64
3b32 21ba3a    ld      hl,$3aba
3b35 d23d3b    jp      nc,$3b3d
3b38 060a      ld      b,$0a
3b3a 21a63a    ld      hl,$3aa6
3b3d 222b06    ld      ($062b),hl
3b40 2a2906    ld      hl,($0629)
3b43 eb        ex      de,hl
3b44 212806    ld      hl,$0628
3b47 1a        ld      a,(de)
3b48 35        dec     (hl)
3b49 fabd3b    jp      m,$3bbd
3b4c 13        inc     de
3b4d b7        or      a
3b4e ca473b    jp      z,$3b47
3b51 34        inc     (hl)
3b52 1b        dec     de
3b53 af        xor     a
3b54 4e        ld      c,(hl)
3b55 eb        ex      de,hl
3b56 222906    ld      ($0629),hl
3b59 e5        push    hl
3b5a 2a2b06    ld      hl,($062b)
3b5d 1119ff    ld      de,$ff19
3b60 14        inc     d
3b61 93        sub     e
3b62 d2603b    jp      nc,$3b60
3b65 83        add     a,e
3b66 87        add     a,a
3b67 5f        ld      e,a
3b68 7a        ld      a,d
3b69 0f        rrca    
3b6a 0f        rrca    
3b6b 1600      ld      d,$00
3b6d 19        add     hl,de
3b6e 5e        ld      e,(hl)
3b6f 23        inc     hl
3b70 86        add     a,(hl)
3b71 57        ld      d,a
3b72 e1        pop     hl
3b73 7e        ld      a,(hl)
3b74 72        ld      (hl),d
3b75 93        sub     e
3b76 da7e3b    jp      c,$3b7e
3b79 34        inc     (hl)
3b7a 90        sub     b
3b7b d2793b    jp      nc,$3b79
3b7e 80        add     a,b
3b7f 35        dec     (hl)
3b80 23        inc     hl
3b81 0d        dec     c
3b82 c2593b    jp      nz,$3b59
3b85 5f        ld      e,a
3b86 51        ld      d,c
3b87 78        ld      a,b
3b88 fe0a      cp      $0a
3b8a c2a03b    jp      nz,$3ba0
3b8d 7b        ld      a,e
3b8e 07        rlca    
3b8f 07        rlca    
3b90 07        rlca    
3b91 07        rlca    
3b92 e1        pop     hl
3b93 77        ld      (hl),a
3b94 e5        push    hl
3b95 21ba3a    ld      hl,$3aba
3b98 222b06    ld      ($062b),hl
3b9b 0664      ld      b,$64
3b9d c3403b    jp      $3b40
3ba0 7b        ld      a,e
3ba1 f5        push    af
3ba2 e6f0      and     $f0
3ba4 0f        rrca    
3ba5 0f        rrca    
3ba6 0f        rrca    
3ba7 0f        rrca    
3ba8 5f        ld      e,a
3ba9 21e338    ld      hl,$38e3
3bac 19        add     hl,de
3bad 5e        ld      e,(hl)
3bae f1        pop     af
3baf e60f      and     $0f
3bb1 b7        or      a
3bb2 27        daa     
3bb3 83        add     a,e
3bb4 27        daa     
3bb5 5e        ld      e,(hl)
3bb6 e1        pop     hl
3bb7 2b        dec     hl
3bb8 77        ld      (hl),a
3bb9 e5        push    hl
3bba c3403b    jp      $3b40
3bbd e1        pop     hl
3bbe c9        ret     

3bbf cd5e38    call    $385e
3bc2 cd0908    call    $0809
3bc5 cd3c39    call    $393c
3bc8 11aa03    ld      de,$03aa
3bcb 21ca03    ld      hl,$03ca
3bce 222b06    ld      ($062b),hl
3bd1 41        ld      b,c
3bd2 0c        inc     c
3bd3 cda70b    call    $0ba7
3bd6 2b        dec     hl
3bd7 dae23b    jp      c,$3be2
3bda fe50      cp      $50
3bdc 2b        dec     hl
3bdd 3e01      ld      a,$01
3bdf c3e83b    jp      $3be8
3be2 e60f      and     $0f
3be4 fe05      cp      $05
3be6 3e10      ld      a,$10
3be8 da073c    jp      c,$3c07
3beb 86        add     a,(hl)
3bec 27        daa     
3bed 77        ld      (hl),a
3bee d2073c    jp      nc,$3c07
3bf1 2b        dec     hl
3bf2 3e01      ld      a,$01
3bf4 05        dec     b
3bf5 ca443c    jp      z,$3c44
3bf8 c3eb3b    jp      $3beb
3bfb cd5e38    call    $385e
3bfe cd0908    call    $0809
3c01 21aa03    ld      hl,$03aa
3c04 222b06    ld      ($062b),hl
3c07 3ae903    ld      a,($03e9)
3c0a b7        or      a
3c0b ca4e3c    jp      z,$3c4e
3c0e 3aa903    ld      a,($03a9)
3c11 b7        or      a
3c12 c2443c    jp      nz,$3c44
3c15 32ea03    ld      ($03ea),a
3c18 cd4639    call    $3946
3c1b f5        push    af
3c1c 2a2b06    ld      hl,($062b)
3c1f 7e        ld      a,(hl)
3c20 b7        or      a
3c21 c2303c    jp      nz,$3c30
3c24 23        inc     hl
3c25 04        inc     b
3c26 78        ld      a,b
3c27 fe14      cp      $14
3c29 c21f3c    jp      nz,$3c1f
3c2c f1        pop     af
3c2d c34e3c    jp      $3c4e
3c30 78        ld      a,b
3c31 b9        cp      c
3c32 c1        pop     bc
3c33 da443c    jp      c,$3c44
3c36 c24e3c    jp      nz,$3c4e
3c39 c5        push    bc
3c3a f1        pop     af
3c3b d24e3c    jp      nc,$3c4e
3c3e 7e        ld      a,(hl)
3c3f fe0a      cp      $0a
3c41 da4e3c    jp      c,$3c4e
3c44 3eff      ld      a,$ff
3c46 32ea03    ld      ($03ea),a
3c49 2a1d02    ld      hl,($021d)
3c4c 77        ld      (hl),a
3c4d c9        ret     

3c4e 115e02    ld      de,$025e
3c51 1a        ld      a,(de)
3c52 e640      and     $40
3c54 c2c23c    jp      nz,$3cc2
3c57 cd4639    call    $3946
3c5a f5        push    af
3c5b 13        inc     de
3c5c 1a        ld      a,(de)
3c5d 2a6802    ld      hl,($0268)
3c60 eb        ex      de,hl
3c61 2a2b06    ld      hl,($062b)
3c64 09        add     hl,bc
3c65 4f        ld      c,a
3c66 3a5e02    ld      a,($025e)
3c69 e606      and     $06
3c6b fe06      cp      $06
3c6d c2713c    jp      nz,$3c71
3c70 13        inc     de
3c71 f1        pop     af
3c72 da843c    jp      c,$3c84
3c75 7e        ld      a,(hl)
3c76 0f        rrca    
3c77 0f        rrca    
3c78 0f        rrca    
3c79 0f        rrca    
3c7a e60f      and     $0f
3c7c c630      add     a,$30
3c7e 12        ld      (de),a
3c7f 13        inc     de
3c80 0d        dec     c
3c81 ca903c    jp      z,$3c90
3c84 7e        ld      a,(hl)
3c85 23        inc     hl
3c86 e60f      and     $0f
3c88 c630      add     a,$30
3c8a 12        ld      (de),a
3c8b 13        inc     de
3c8c 0d        dec     c
3c8d c2753c    jp      nz,$3c75
3c90 eb        ex      de,hl
3c91 115e02    ld      de,$025e
3c94 1a        ld      a,(de)
3c95 e608      and     $08
3c97 c0        ret     nz

3c98 1a        ld      a,(de)
3c99 e604      and     $04
3c9b 1a        ld      a,(de)
3c9c caa83c    jp      z,$3ca8
3c9f 2a6802    ld      hl,($0268)
3ca2 e602      and     $02
3ca4 c2b83c    jp      nz,$3cb8
3ca7 23        inc     hl
3ca8 e602      and     $02
3caa c2b83c    jp      nz,$3cb8
3cad 2b        dec     hl
3cae 3aa803    ld      a,($03a8)
3cb1 b7        or      a
3cb2 c8        ret     z

3cb3 7e        ld      a,(hl)
3cb4 c640      add     a,$40
3cb6 77        ld      (hl),a
3cb7 c9        ret     

3cb8 362b      ld      (hl),$2b
3cba 3aa803    ld      a,($03a8)
3cbd b7        or      a
3cbe c8        ret     z

3cbf 362d      ld      (hl),$2d
3cc1 c9        ret     

3cc2 1a        ld      a,(de)
3cc3 e602      and     $02
3cc5 ca293d    jp      z,$3d29
3cc8 cd4639    call    $3946
3ccb 7e        ld      a,(hl)
3ccc f5        push    af
3ccd 13        inc     de
3cce 1a        ld      a,(de)
3ccf 2a6802    ld      hl,($0268)
3cd2 eb        ex      de,hl
3cd3 2a2b06    ld      hl,($062b)
3cd6 09        add     hl,bc
3cd7 4f        ld      c,a
3cd8 f1        pop     af
3cd9 f5        push    af
3cda 1f        rra     
3cdb dafd3c    jp      c,$3cfd
3cde f1        pop     af
3cdf daef3c    jp      c,$3cef
3ce2 0600      ld      b,$00
3ce4 7e        ld      a,(hl)
3ce5 0f        rrca    
3ce6 0f        rrca    
3ce7 0f        rrca    
3ce8 0f        rrca    
3ce9 e60f      and     $0f
3ceb 80        add     a,b
3cec 12        ld      (de),a
3ced 13        inc     de
3cee 0d        dec     c
3cef 7e        ld      a,(hl)
3cf0 23        inc     hl
3cf1 87        add     a,a
3cf2 87        add     a,a
3cf3 87        add     a,a
3cf4 87        add     a,a
3cf5 47        ld      b,a
3cf6 0d        dec     c
3cf7 c2e43c    jp      nz,$3ce4
3cfa c3113d    jp      $3d11
3cfd 0d        dec     c
3cfe f1        pop     af
3cff 7e        ld      a,(hl)
3d00 d2063d    jp      nc,$3d06
3d03 e60f      and     $0f
3d05 0c        inc     c
3d06 12        ld      (de),a
3d07 13        inc     de
3d08 23        inc     hl
3d09 7e        ld      a,(hl)
3d0a 0d        dec     c
3d0b 0d        dec     c
3d0c c2063d    jp      nz,$3d06
3d0f e6f0      and     $f0
3d11 47        ld      b,a
3d12 3a5e02    ld      a,($025e)
3d15 e608      and     $08
3d17 3e0f      ld      a,$0f
3d19 c2263d    jp      nz,$3d26
3d1c 3aa803    ld      a,($03a8)
3d1f b7        or      a
3d20 3e0c      ld      a,$0c
3d22 ca263d    jp      z,$3d26
3d25 3c        inc     a
3d26 80        add     a,b
3d27 12        ld      (de),a
3d28 c9        ret     

3d29 0e08      ld      c,$08
3d2b 21eb03    ld      hl,$03eb
3d2e af        xor     a
3d2f 322806    ld      ($0628),a
3d32 cdc90b    call    $0bc9
3d35 cd4639    call    $3946
3d38 3a5f02    ld      a,($025f)
3d3b f5        push    af
3d3c 2a2b06    ld      hl,($062b)
3d3f 09        add     hl,bc
3d40 f1        pop     af
3d41 3c        inc     a
3d42 d24c3d    jp      nc,$3d4c
3d45 4f        ld      c,a
3d46 7e        ld      a,(hl)
3d47 e60f      and     $0f
3d49 77        ld      (hl),a
3d4a 79        ld      a,c
3d4b 3c        inc     a
3d4c 3d        dec     a
3d4d 3d        dec     a
3d4e fab23d    jp      m,$3db2
3d51 ca8c3d    jp      z,$3d8c
3d54 f5        push    af
3d55 4e        ld      c,(hl)
3d56 23        inc     hl
3d57 e5        push    hl
3d58 cdea38    call    $38ea
3d5b 3a2806    ld      a,($0628)
3d5e 21f303    ld      hl,$03f3
3d61 2b        dec     hl
3d62 3d        dec     a
3d63 fa7d3d    jp      m,$3d7d
3d66 5e        ld      e,(hl)
3d67 50        ld      d,b
3d68 e5        push    hl
3d69 62        ld      h,d
3d6a 6b        ld      l,e
3d6b 19        add     hl,de
3d6c 29        add     hl,hl
3d6d 19        add     hl,de
3d6e 54        ld      d,h
3d6f 5d        ld      e,l
3d70 29        add     hl,hl
3d71 29        add     hl,hl
3d72 19        add     hl,de
3d73 29        add     hl,hl
3d74 29        add     hl,hl
3d75 09        add     hl,bc
3d76 eb        ex      de,hl
3d77 e1        pop     hl
3d78 73        ld      (hl),e
3d79 4a        ld      c,d
3d7a c3613d    jp      $3d61
3d7d 79        ld      a,c
3d7e b7        or      a
3d7f ca873d    jp      z,$3d87
3d82 77        ld      (hl),a
3d83 212806    ld      hl,$0628
3d86 34        inc     (hl)
3d87 e1        pop     hl
3d88 f1        pop     af
3d89 c34c3d    jp      $3d4c
3d8c 7e        ld      a,(hl)
3d8d 0f        rrca    
3d8e 0f        rrca    
3d8f 0f        rrca    
3d90 0f        rrca    
3d91 e60f      and     $0f
3d93 4f        ld      c,a
3d94 3a2806    ld      a,($0628)
3d97 21f303    ld      hl,$03f3
3d9a 2b        dec     hl
3d9b 3d        dec     a
3d9c fab13d    jp      m,$3db1
3d9f 5e        ld      e,(hl)
3da0 50        ld      d,b
3da1 e5        push    hl
3da2 62        ld      h,d
3da3 6b        ld      l,e
3da4 19        add     hl,de
3da5 29        add     hl,hl
3da6 29        add     hl,hl
3da7 19        add     hl,de
3da8 19        add     hl,de
3da9 09        add     hl,bc
3daa eb        ex      de,hl
3dab e1        pop     hl
3dac 73        ld      (hl),e
3dad 4a        ld      c,d
3dae c39a3d    jp      $3d9a
3db1 71        ld      (hl),c
3db2 215e02    ld      hl,$025e
3db5 7e        ld      a,(hl)
3db6 e608      and     $08
3db8 c2cd3d    jp      nz,$3dcd
3dbb 3aa803    ld      a,($03a8)
3dbe b7        or      a
3dbf cacc3d    jp      z,$3dcc
3dc2 0e08      ld      c,$08
3dc4 11eb03    ld      de,$03eb
3dc7 e5        push    hl
3dc8 cd5939    call    $3959
3dcb e1        pop     hl
3dcc af        xor     a
3dcd 23        inc     hl
3dce 4e        ld      c,(hl)
3dcf 23        inc     hl
3dd0 46        ld      b,(hl)
3dd1 cd6d39    call    $396d
3dd4 4f        ld      c,a
3dd5 2a6802    ld      hl,($0268)
3dd8 09        add     hl,bc
3dd9 11f303    ld      de,$03f3
3ddc 2b        dec     hl
3ddd 1b        dec     de
3dde 1a        ld      a,(de)
3ddf 77        ld      (hl),a
3de0 0d        dec     c
3de1 c2dc3d    jp      nz,$3ddc
3de4 c9        ret     

3de5 cd0908    call    $0809
3de8 119203    ld      de,$0392
3deb 21a803    ld      hl,$03a8
3dee 0e16      ld      c,$16
3df0 1a        ld      a,(de)
3df1 46        ld      b,(hl)
3df2 77        ld      (hl),a
3df3 78        ld      a,b
3df4 12        ld      (de),a
3df5 13        inc     de
3df6 23        inc     hl
3df7 0d        dec     c
3df8 c2f03d    jp      nz,$3df0
3dfb c9        ret     

3dfc cd0908    call    $0809
3dff c3850b    jp      $0b85
3e02 3c        inc     a
3e03 215502    ld      hl,$0255
3e06 c30d3e    jp      $3e0d
3e09 3c        inc     a
3e0a 216302    ld      hl,$0263
3e0d f5        push    af
3e0e e5        push    hl
3e0f cd4e38    call    $384e
3e12 e1        pop     hl
3e13 f1        pop     af
3e14 47        ld      b,a
3e15 f1        pop     af
3e16 c21408    jp      nz,$0814
3e19 e5        push    hl
3e1a 3a6c02    ld      a,($026c)
3e1d e646      and     $46
3e1f fe40      cp      $40
3e21 c23f3e    jp      nz,$3e3f
3e24 3a6d02    ld      a,($026d)
3e27 fe04      cp      $04
3e29 c23f3e    jp      nz,$3e3f
3e2c 78        ld      a,b
3e2d 2a7602    ld      hl,($0276)
3e30 46        ld      b,(hl)
3e31 23        inc     hl
3e32 4e        ld      c,(hl)
3e33 b7        or      a
3e34 c2663e    jp      nz,$3e66
3e37 78        ld      a,b
3e38 b1        or      c
3e39 ca803e    jp      z,$3e80
3e3c c35d3e    jp      $3e5d
3e3f d5        push    de
3e40 01c803    ld      bc,$03c8
3e43 c5        push    bc
3e44 116c02    ld      de,$026c
3e47 cdc139    call    $39c1
3e4a e1        pop     hl
3e4b 34        inc     (hl)
3e4c ca803e    jp      z,$3e80
3e4f 23        inc     hl
3e50 23        inc     hl
3e51 cdfe38    call    $38fe
3e54 42        ld      b,d
3e55 4b        ld      c,e
3e56 d1        pop     de
3e57 ca803e    jp      z,$3e80
3e5a da803e    jp      c,$3e80
3e5d 13        inc     de
3e5e 1a        ld      a,(de)
3e5f 91        sub     c
3e60 1b        dec     de
3e61 1a        ld      a,(de)
3e62 98        sbc     a,b
3e63 da803e    jp      c,$3e80
3e66 13        inc     de
3e67 13        inc     de
3e68 0b        dec     bc
3e69 eb        ex      de,hl
3e6a 56        ld      d,(hl)
3e6b 23        inc     hl
3e6c 5e        ld      e,(hl)
3e6d 23        inc     hl
3e6e e5        push    hl
3e6f cd300b    call    $0b30
3e72 e1        pop     hl
3e73 e3        ex      (sp),hl
3e74 4e        ld      c,(hl)
3e75 23        inc     hl
3e76 46        ld      b,(hl)
3e77 eb        ex      de,hl
3e78 09        add     hl,bc
3e79 eb        ex      de,hl
3e7a 72        ld      (hl),d
3e7b 2b        dec     hl
3e7c 73        ld      (hl),e
3e7d c31d08    jp      $081d
3e80 3e99      ld      a,$99
3e82 c3430c    jp      $0c43
3e85 cd0908    call    $0809
3e88 3eff      ld      a,$ff
3e8a 325702    ld      ($0257),a
3e8d c9        ret     

3e8e f1        pop     af
3e8f c21408    jp      nz,$0814
3e92 215502    ld      hl,$0255
3e95 cdf20c    call    $0cf2
3e98 2a2902    ld      hl,($0229)
3e9b 09        add     hl,bc
3e9c e5        push    hl
3e9d 217102    ld      hl,$0271
3ea0 cdf20c    call    $0cf2
3ea3 60        ld      h,b
3ea4 69        ld      l,c
3ea5 c1        pop     bc
3ea6 70        ld      (hl),b
3ea7 23        inc     hl
3ea8 71        ld      (hl),c
3ea9 c31e08    jp      $081e
3eac cd0908    call    $0809
3eaf 2a5502    ld      hl,($0255)
3eb2 eb        ex      de,hl
3eb3 2a6302    ld      hl,($0263)
3eb6 225502    ld      ($0255),hl
3eb9 eb        ex      de,hl
3eba 226302    ld      ($0263),hl
3ebd c9        ret     

3ebe 3c        inc     a
3ebf cd5a38    call    $385a
3ec2 cd0908    call    $0809
3ec5 cdae39    call    $39ae
3ec8 c3013c    jp      $3c01
3ecb 3c        inc     a
3ecc cd5a38    call    $385a
3ecf cd0908    call    $0809
3ed2 cda539    call    $39a5
3ed5 cdbb39    call    $39bb
3ed8 c35d3f    jp      $3f5d
3edb cde60d    call    $0de6
3ede af        xor     a
3edf cd5e38    call    $385e
3ee2 cd0908    call    $0809
3ee5 2a5102    ld      hl,($0251)
3ee8 01edff    ld      bc,$ffed
3eeb 09        add     hl,bc
3eec d2c53e    jp      nc,$3ec5
3eef 23        inc     hl
3ef0 44        ld      b,h
3ef1 4d        ld      c,l
3ef2 2a5a02    ld      hl,($025a)
3ef5 09        add     hl,bc
3ef6 225a02    ld      ($025a),hl
3ef9 211200    ld      hl,$0012
3efc 225102    ld      ($0251),hl
3eff c3c53e    jp      $3ec5
3f02 3c        inc     a
3f03 cd5438    call    $3854
3f06 cdec0d    call    $0dec
3f09 cd0908    call    $0809
3f0c cdae39    call    $39ae
3f0f 3a5102    ld      a,($0251)
3f12 4f        ld      c,a
3f13 3a5302    ld      a,($0253)
3f16 216102    ld      hl,$0261
3f19 77        ld      (hl),a
3f1a d612      sub     $12
3f1c d2243f    jp      nc,$3f24
3f1f 2f        cpl     
3f20 3c        inc     a
3f21 81        add     a,c
3f22 3612      ld      (hl),$12
3f24 b9        cp      c
3f25 da293f    jp      c,$3f29
3f28 4f        ld      c,a
3f29 eb        ex      de,hl
3f2a 2a5f02    ld      hl,($025f)
3f2d 7d        ld      a,l
3f2e 91        sub     c
3f2f 6f        ld      l,a
3f30 7c        ld      a,h
3f31 de00      sbc     a,$00
3f33 da543f    jp      c,$3f54
3f36 67        ld      h,a
3f37 b5        or      l
3f38 ca013c    jp      z,$3c01
3f3b eb        ex      de,hl
3f3c 69        ld      l,c
3f3d 2600      ld      h,$00
3f3f 225f02    ld      ($025f),hl
3f42 2a6a02    ld      hl,($026a)
3f45 3a5402    ld      a,($0254)
3f48 47        ld      b,a
3f49 2b        dec     hl
3f4a 70        ld      (hl),b
3f4b 1b        dec     de
3f4c 7a        ld      a,d
3f4d b3        or      e
3f4e c2493f    jp      nz,$3f49
3f51 c3013c    jp      $3c01
3f54 1a        ld      a,(de)
3f55 85        add     a,l
3f56 12        ld      (de),a
3f57 c3013c    jp      $3c01
3f5a cd0908    call    $0809
3f5d 3a9203    ld      a,($0392)
3f60 2f        cpl     
3f61 47        ld      b,a
3f62 b7        or      a
3f63 3e01      ld      a,$01
3f65 ca6a3f    jp      z,$3f6a
3f68 3e04      ld      a,$04
3f6a 324502    ld      ($0245),a
3f6d 78        ld      a,b
3f6e c3773f    jp      $3f77
3f71 cd0908    call    $0809
3f74 3a9203    ld      a,($0392)
3f77 322e06    ld      ($062e),a
3f7a af        xor     a
3f7b 2f        cpl     
3f7c 32e903    ld      ($03e9),a
3f7f 219303    ld      hl,$0393
3f82 11a903    ld      de,$03a9
3f85 1a        ld      a,(de)
3f86 b6        or      (hl)
3f87 12        ld      (de),a
3f88 c0        ret     nz

3f89 23        inc     hl
3f8a 13        inc     de
3f8b 011400    ld      bc,$0014
3f8e e5        push    hl
3f8f d5        push    de
3f90 c5        push    bc
3f91 1a        ld      a,(de)
3f92 b6        or      (hl)
3f93 c29c3f    jp      nz,$3f9c
3f96 13        inc     de
3f97 23        inc     hl
3f98 0d        dec     c
3f99 c2913f    jp      nz,$3f91
3f9c 222f06    ld      ($062f),hl
3f9f eb        ex      de,hl
3fa0 223406    ld      ($0634),hl
3fa3 79        ld      a,c
3fa4 c1        pop     bc
3fa5 d1        pop     de
3fa6 e1        pop     hl
3fa7 caf03f    jp      z,$3ff0
3faa 09        add     hl,bc
3fab eb        ex      de,hl
3fac 09        add     hl,bc
3fad 4f        ld      c,a
3fae 2b        dec     hl
3faf 1b        dec     de
3fb0 0d        dec     c
3fb1 1a        ld      a,(de)
3fb2 b6        or      (hl)
3fb3 caae3f    jp      z,$3fae
3fb6 3a2e06    ld      a,($062e)
3fb9 47        ld      b,a
3fba 3aa803    ld      a,($03a8)
3fbd b8        cp      b
3fbe c2dc3f    jp      nz,$3fdc
3fc1 1a        ld      a,(de)
3fc2 8e        adc     a,(hl)
3fc3 27        daa     
3fc4 77        ld      (hl),a
3fc5 1b        dec     de
3fc6 2b        dec     hl
3fc7 0d        dec     c
3fc8 f2c13f    jp      p,$3fc1
3fcb d0        ret     nc

3fcc 3601      ld      (hl),$01
3fce 11aa03    ld      de,$03aa
3fd1 7d        ld      a,l
3fd2 93        sub     e
3fd3 7c        ld      a,h
3fd4 9a        sbc     a,d
3fd5 d0        ret     nc

3fd6 3eff      ld      a,$ff
3fd8 32a903    ld      ($03a9),a
3fdb c9        ret     

3fdc c5        push    bc
3fdd d5        push    de
3fde e5        push    hl
3fdf 2a3406    ld      hl,($0634)
3fe2 eb        ex      de,hl
3fe3 2a2f06    ld      hl,($062f)
3fe6 0c        inc     c
3fe7 cdbc0b    call    $0bbc
3fea c20540    jp      nz,$4005
3fed e1        pop     hl
3fee d1        pop     de
3fef c1        pop     bc
3ff0 3e02      ld      a,$02
3ff2 324502    ld      ($0245),a
3ff5 af        xor     a
3ff6 32a803    ld      ($03a8),a
3ff9 21aa03    ld      hl,$03aa
3ffc 0e14      ld      c,$14
3ffe 77        ld      (hl),a
3fff 23        inc     hl
4000 0d        dec     c
4001 c2fe3f    jp      nz,$3ffe
4004 c9        ret     

4005 e1        pop     hl
4006 d1        pop     de
4007 c1        pop     bc
4008 d22240    jp      nc,$4022
400b 3e99      ld      a,$99
400d ce00      adc     a,$00
400f 96        sub     (hl)
4010 eb        ex      de,hl
4011 86        add     a,(hl)
4012 eb        ex      de,hl
4013 27        daa     
4014 77        ld      (hl),a
4015 1b        dec     de
4016 2b        dec     hl
4017 0d        dec     c
4018 f20b40    jp      p,$400b
401b 21a803    ld      hl,$03a8
401e 7e        ld      a,(hl)
401f 2f        cpl     
4020 77        ld      (hl),a
4021 c9        ret     

4022 37        scf     
4023 3e99      ld      a,$99
4025 ce00      adc     a,$00
4027 eb        ex      de,hl
4028 96        sub     (hl)
4029 eb        ex      de,hl
402a 86        add     a,(hl)
402b 27        daa     
402c 77        ld      (hl),a
402d 1b        dec     de
402e 2b        dec     hl
402f 0d        dec     c
4030 f22340    jp      p,$4023
4033 214502    ld      hl,$0245
4036 3e05      ld      a,$05
4038 96        sub     (hl)
4039 77        ld      (hl),a
403a c9        ret     

403b 3eff      ld      a,$ff
403d 32e903    ld      ($03e9),a
4040 119203    ld      de,$0392
4043 21a803    ld      hl,$03a8
4046 1a        ld      a,(de)
4047 ae        xor     (hl)
4048 77        ld      (hl),a
4049 13        inc     de
404a 23        inc     hl
404b 1a        ld      a,(de)
404c b6        or      (hl)
404d 77        ld      (hl),a
404e c0        ret     nz

404f 23        inc     hl
4050 11ca03    ld      de,$03ca
4053 011400    ld      bc,$0014
4056 7e        ld      a,(hl)
4057 12        ld      (de),a
4058 70        ld      (hl),b
4059 13        inc     de
405a 23        inc     hl
405b 0d        dec     c
405c c25640    jp      nz,$4056
405f 0e0a      ld      c,$0a
4061 af        xor     a
4062 12        ld      (de),a
4063 77        ld      (hl),a
4064 13        inc     de
4065 23        inc     hl
4066 0d        dec     c
4067 c26240    jp      nz,$4062
406a 119403    ld      de,$0394
406d 212f06    ld      hl,$062f
4070 cd7840    call    $4078
4073 37        scf     
4074 c8        ret     z

4075 11ca03    ld      de,$03ca
4078 d5        push    de
4079 0e14      ld      c,$14
407b 1a        ld      a,(de)
407c b7        or      a
407d c28840    jp      nz,$4088
4080 13        inc     de
4081 0d        dec     c
4082 c27b40    jp      nz,$407b
4085 d1        pop     de
4086 af        xor     a
4087 c9        ret     

4088 73        ld      (hl),e
4089 23        inc     hl
408a 72        ld      (hl),d
408b 23        inc     hl
408c e3        ex      (sp),hl
408d 111400    ld      de,$0014
4090 19        add     hl,de
4091 eb        ex      de,hl
4092 1b        dec     de
4093 0d        dec     c
4094 1a        ld      a,(de)
4095 b7        or      a
4096 ca9240    jp      z,$4092
4099 e1        pop     hl
409a 73        ld      (hl),e
409b 23        inc     hl
409c 72        ld      (hl),d
409d 23        inc     hl
409e 71        ld      (hl),c
409f 23        inc     hl
40a0 c9        ret     

40a1 00        nop     
40a2 00        nop     
40a3 00        nop     
40a4 00        nop     
40a5 00        nop     
40a6 00        nop     
40a7 00        nop     
40a8 00        nop     
40a9 00        nop     
40aa 00        nop     
40ab caa140    jp      z,$40a1
40ae fe0d      cp      $0d
40b0 ca0001    jp      z,$0100
40b3 02        ld      (bc),a
40b4 03        inc     bc
40b5 04        inc     b
40b6 05        dec     b
40b7 0607      ld      b,$07
40b9 08        ex      af,af'
40ba 09        add     hl,bc
40bb 2d        dec     l
40bc cac640    jp      z,$40c6
40bf 1601      ld      d,$01
40c1 00        nop     
40c2 02        ld      (bc),a
40c3 04        inc     b
40c4 0608      ld      b,$08
40c6 1012      djnz    $40da
40c8 14        inc     d
40c9 1618      ld      d,$18
40cb caee40    jp      z,$40ee
40ce fe20      cp      $20
40d0 ca0003    jp      z,$0300
40d3 0609      ld      b,$09
40d5 12        ld      (de),a
40d6 15        dec     d
40d7 1821      jr      $40fa
40d9 24        inc     h
40da 27        daa     
40db 35        dec     (hl)
40dc 3f        ccf     
40dd d630      sub     $30
40df 5f        ld      e,a
40e0 7a        ld      a,d
40e1 00        nop     
40e2 04        inc     b
40e3 08        ex      af,af'
40e4 12        ld      (de),a
40e5 1620      ld      d,$20
40e7 24        inc     h
40e8 2832      jr      z,$411c
40ea 36d1      ld      (hl),$d1
40ec e1        pop     hl
40ed c9        ret     

40ee 7a        ld      a,d
40ef 329500    ld      ($0095),a
40f2 05        dec     b
40f3 1015      djnz    $410a
40f5 2025      jr      nz,$411c
40f7 3035      jr      nc,$412e
40f9 40        ld      b,b
40fa 45        ld      b,l
40fb 1b        dec     de
40fc cd2d01    call    $012d
40ff d2a100    jp      nc,$00a1
4102 0612      ld      b,$12
4104 1824      jr      $412a
4106 3036      jr      nc,$413e
4108 42        ld      b,d
4109 48        ld      c,b
410a 54        ld      d,h
410b 3f        ccf     
410c cd7b40    call    $407b
410f c3a100    jp      $00a1
4112 07        rlca    
4113 14        inc     d
4114 212835    ld      hl,$3528
4117 42        ld      b,d
4118 49        ld      c,c
4119 56        ld      d,(hl)
411a 63        ld      h,e
411b 42        ld      b,d
411c 4f        ld      c,a
411d 4c        ld      c,h
411e 2052      jr      nz,$4172
4120 54        ld      d,h
4121 00        nop     
4122 08        ex      af,af'
4123 1624      ld      d,$24
4125 324048    ld      ($4840),a
4128 56        ld      d,(hl)
4129 64        ld      h,h
412a 72        ld      (hl),d
412b 207f      jr      nz,$41ac
412d be        cp      (hl)
412e da6041    jp      c,$4160
4131 00        nop     
4132 09        add     hl,bc
4133 1827      jr      $415c
4135 3645      ld      (hl),$45
4137 54        ld      d,h
4138 63        ld      h,e
4139 72        ld      (hl),d
413a 81        add     a,c
413b e6f0      and     $f0
413d b2        or      d
413e 21a140    ld      hl,$40a1
4141 85        add     a,l
4142 6f        ld      l,a
4143 d24741    jp      nc,$4147
4146 24        inc     h
4147 6e        ld      l,(hl)
4148 e3        ex      (sp),hl
4149 e9        jp      (hl)
414a 78        ld      a,b
414b e60f      and     $0f
414d 57        ld      d,a
414e 79        ld      a,c
414f 07        rlca    
4150 07        rlca    
4151 07        rlca    
4152 07        rlca    
4153 5f        ld      e,a
4154 cd3b41    call    $413b
4157 79        ld      a,c
4158 cd3b41    call    $413b
415b 78        ld      a,b
415c 92        sub     d
415d 57        ld      d,a
415e 79        ld      a,c
415f e60f      and     $0f
4161 cd3d41    call    $413d
4164 7b        ld      a,e
4165 e60f      and     $0f
4167 cd3d41    call    $413d
416a d1        pop     de
416b c1        pop     bc
416c e1        pop     hl
416d 7d        ld      a,l
416e 81        add     a,c
416f 27        daa     
4170 6f        ld      l,a
4171 3e00      ld      a,$00
4173 8f        adc     a,a
4174 67        ld      h,a
4175 29        add     hl,hl
4176 29        add     hl,hl
4177 29        add     hl,hl
4178 29        add     hl,hl
4179 7b        ld      a,e
417a 84        add     a,h
417b 27        daa     
417c 67        ld      h,a
417d d1        pop     de
417e 7b        ld      a,e
417f 85        add     a,l
4180 27        daa     
4181 5f        ld      e,a
4182 7c        ld      a,h
4183 ce00      adc     a,$00
4185 27        daa     
4186 57        ld      d,a
4187 c9        ret     

4188 cd0908    call    $0809
418b cd3b40    call    $403b
418e caf53f    jp      z,$3ff5
4191 3aa903    ld      a,($03a9)
4194 b7        or      a
4195 c0        ret     nz

4196 2a3106    ld      hl,($0631)
4199 eb        ex      de,hl
419a 2a3606    ld      hl,($0636)
419d 19        add     hl,de
419e eb        ex      de,hl
419f 019403    ld      bc,$0394
41a2 21ca03    ld      hl,$03ca
41a5 09        add     hl,bc
41a6 7b        ld      a,e
41a7 95        sub     l
41a8 6f        ld      l,a
41a9 7a        ld      a,d
41aa 94        sub     h
41ab 67        ld      h,a
41ac 11f7ff    ld      de,$fff7
41af 19        add     hl,de
41b0 3a3306    ld      a,($0633)
41b3 4f        ld      c,a
41b4 3a3806    ld      a,($0638)
41b7 81        add     a,c
41b8 3d        dec     a
41b9 95        sub     l
41ba f2d63f    jp      p,$3fd6
41bd 11aa03    ld      de,$03aa
41c0 19        add     hl,de
41c1 eb        ex      de,hl
41c2 d5        push    de
41c3 2a3606    ld      hl,($0636)
41c6 af        xor     a
41c7 3a3806    ld      a,($0638)
41ca 4f        ld      c,a
41cb eb        ex      de,hl
41cc c5        push    bc
41cd d5        push    de
41ce e5        push    hl
41cf f5        push    af
41d0 2a3106    ld      hl,($0631)
41d3 46        ld      b,(hl)
41d4 1a        ld      a,(de)
41d5 4f        ld      c,a
41d6 cd4a41    call    $414a
41d9 f1        pop     af
41da 3e00      ld      a,$00
41dc 8a        adc     a,d
41dd 57        ld      d,a
41de e1        pop     hl
41df 7e        ld      a,(hl)
41e0 83        add     a,e
41e1 27        daa     
41e2 77        ld      (hl),a
41e3 2b        dec     hl
41e4 7e        ld      a,(hl)
41e5 8a        adc     a,d
41e6 27        daa     
41e7 77        ld      (hl),a
41e8 d1        pop     de
41e9 1b        dec     de
41ea c1        pop     bc
41eb 0d        dec     c
41ec f2cc41    jp      p,$41cc
41ef d2f541    jp      nc,$41f5
41f2 2b        dec     hl
41f3 3601      ld      (hl),$01
41f5 d1        pop     de
41f6 1b        dec     de
41f7 2a3106    ld      hl,($0631)
41fa 2b        dec     hl
41fb 223106    ld      ($0631),hl
41fe 213306    ld      hl,$0633
4201 35        dec     (hl)
4202 f2c241    jp      p,$41c2
4205 c9        ret     

4206 010000    ld      bc,$0000
4209 3e99      ld      a,$99
420b 67        ld      h,a
420c 95        sub     l
420d 3c        inc     a
420e 27        daa     
420f 6f        ld      l,a
4210 7d        ld      a,l
4211 83        add     a,e
4212 27        daa     
4213 7c        ld      a,h
4214 8a        adc     a,d
4215 27        daa     
4216 d22642    jp      nc,$4226
4219 e5        push    hl
421a 0c        inc     c
421b 7d        ld      a,l
421c 87        add     a,a
421d 27        daa     
421e 6f        ld      l,a
421f 7c        ld      a,h
4220 8f        adc     a,a
4221 27        daa     
4222 67        ld      h,a
4223 da1042    jp      c,$4210
4226 0d        dec     c
4227 f8        ret     m

4228 78        ld      a,b
4229 87        add     a,a
422a 27        daa     
422b 47        ld      b,a
422c e1        pop     hl
422d 7b        ld      a,e
422e 85        add     a,l
422f 27        daa     
4230 6f        ld      l,a
4231 7a        ld      a,d
4232 8c        adc     a,h
4233 27        daa     
4234 d22642    jp      nc,$4226
4237 04        inc     b
4238 57        ld      d,a
4239 5d        ld      e,l
423a c32642    jp      $4226
423d 4f        ld      c,a
423e 0600      ld      b,$00
4240 09        add     hl,bc
4241 7e        ld      a,(hl)
4242 8f        adc     a,a
4243 27        daa     
4244 77        ld      (hl),a
4245 2b        dec     hl
4246 0d        dec     c
4247 f24142    jp      p,$4241
424a d0        ret     nc

424b 3601      ld      (hl),$01
424d c9        ret     

424e cd0908    call    $0809
4251 cd3b40    call    $403b
4254 dad63f    jp      c,$3fd6
4257 caf53f    jp      z,$3ff5
425a 3aa903    ld      a,($03a9)
425d b7        or      a
425e c0        ret     nz

425f 119403    ld      de,$0394
4262 21eb03    ld      hl,$03eb
4265 0e14      ld      c,$14
4267 cda70b    call    $0ba7
426a 2a2f06    ld      hl,($062f)
426d 7e        ld      a,(hl)
426e fe50      cp      $50
4270 d28f42    jp      nc,$428f
4273 3a3306    ld      a,($0633)
4276 cd3d42    call    $423d
4279 2a3406    ld      hl,($0634)
427c 3a3806    ld      a,($0638)
427f cd3d42    call    $423d
4282 d26a42    jp      nc,$426a
4285 223406    ld      ($0634),hl
4288 213806    ld      hl,$0638
428b 34        inc     (hl)
428c c36a42    jp      $426a
428f 2a2f06    ld      hl,($062f)
4292 11ca03    ld      de,$03ca
4295 19        add     hl,de
4296 eb        ex      de,hl
4297 3d        dec     a
4298 2a3406    ld      hl,($0634)
429b be        cp      (hl)
429c d2a342    jp      nc,$42a3
429f 2b        dec     hl
42a0 223406    ld      ($0634),hl
42a3 019e03    ld      bc,$039e
42a6 09        add     hl,bc
42a7 7d        ld      a,l
42a8 93        sub     e
42a9 6f        ld      l,a
42aa 7c        ld      a,h
42ab 9a        sbc     a,d
42ac 67        ld      h,a
42ad b7        or      a
42ae f2b742    jp      p,$42b7
42b1 cd6743    call    $4367
42b4 c3d63f    jp      $3fd6
42b7 11aa03    ld      de,$03aa
42ba 19        add     hl,de
42bb eb        ex      de,hl
42bc 2a2f06    ld      hl,($062f)
42bf 46        ld      b,(hl)
42c0 2a3406    ld      hl,($0634)
42c3 2b        dec     hl
42c4 1b        dec     de
42c5 23        inc     hl
42c6 13        inc     de
42c7 7e        ld      a,(hl)
42c8 b7        or      a
42c9 cac542    jp      z,$42c5
42cc b8        cp      b
42cd dad242    jp      c,$42d2
42d0 2b        dec     hl
42d1 1b        dec     de
42d2 223406    ld      ($0634),hl
42d5 21be03    ld      hl,$03be
42d8 7b        ld      a,e
42d9 95        sub     l
42da 7a        ld      a,d
42db 9c        sbc     a,h
42dc d26743    jp      nc,$4367
42df d5        push    de
42e0 2a3406    ld      hl,($0634)
42e3 e5        push    hl
42e4 56        ld      d,(hl)
42e5 23        inc     hl
42e6 5e        ld      e,(hl)
42e7 68        ld      l,b
42e8 cd0642    call    $4206
42eb e1        pop     hl
42ec 3a3306    ld      a,($0633)
42ef b7        or      a
42f0 c2f942    jp      nz,$42f9
42f3 77        ld      (hl),a
42f4 23        inc     hl
42f5 73        ld      (hl),e
42f6 c34f43    jp      $434f
42f9 4f        ld      c,a
42fa 5f        ld      e,a
42fb 1c        inc     e
42fc 1600      ld      d,$00
42fe 19        add     hl,de
42ff eb        ex      de,hl
4300 2a3106    ld      hl,($0631)
4303 c5        push    bc
4304 e5        push    hl
4305 d5        push    de
4306 f5        push    af
4307 4e        ld      c,(hl)
4308 cd4a41    call    $414a
430b f1        pop     af
430c 3e00      ld      a,$00
430e 8a        adc     a,d
430f 27        daa     
4310 57        ld      d,a
4311 e1        pop     hl
4312 3e9a      ld      a,$9a
4314 93        sub     e
4315 86        add     a,(hl)
4316 27        daa     
4317 77        ld      (hl),a
4318 2b        dec     hl
4319 3e99      ld      a,$99
431b ce00      adc     a,$00
431d 92        sub     d
431e 86        add     a,(hl)
431f 27        daa     
4320 3f        ccf     
4321 77        ld      (hl),a
4322 eb        ex      de,hl
4323 e1        pop     hl
4324 2b        dec     hl
4325 c1        pop     bc
4326 0d        dec     c
4327 f20343    jp      p,$4303
432a d24f43    jp      nc,$434f
432d 78        ld      a,b
432e c699      add     a,$99
4330 27        daa     
4331 47        ld      b,a
4332 3a3306    ld      a,($0633)
4335 2a3406    ld      hl,($0634)
4338 3c        inc     a
4339 5f        ld      e,a
433a 4f        ld      c,a
433b 1600      ld      d,$00
433d 19        add     hl,de
433e eb        ex      de,hl
433f 2a3106    ld      hl,($0631)
4342 1a        ld      a,(de)
4343 8e        adc     a,(hl)
4344 27        daa     
4345 12        ld      (de),a
4346 1b        dec     de
4347 2b        dec     hl
4348 0d        dec     c
4349 f24243    jp      p,$4342
434c d22d43    jp      nc,$432d
434f e1        pop     hl
4350 78        ld      a,b
4351 b7        or      a
4352 ca5943    jp      z,$4359
4355 70        ld      (hl),b
4356 c3bb42    jp      $42bb
4359 23        inc     hl
435a e5        push    hl
435b 2a3406    ld      hl,($0634)
435e 23        inc     hl
435f 223406    ld      ($0634),hl
4362 0699      ld      b,$99
4364 c3ec42    jp      $42ec
4367 11eb03    ld      de,$03eb
436a 219403    ld      hl,$0394
436d 0e14      ld      c,$14
436f c3a70b    jp      $0ba7
4372 215e02    ld      hl,$025e
4375 e5        push    hl
4376 eb        ex      de,hl
4377 223a06    ld      ($063a),hl
437a eb        ex      de,hl
437b 1a        ld      a,(de)
437c 323906    ld      ($0639),a
437f 47        ld      b,a
4380 e61f      and     $1f
4382 3c        inc     a
4383 323e06    ld      ($063e),a
4386 4f        ld      c,a
4387 21ffff    ld      hl,$ffff
438a 224306    ld      ($0643),hl
438d 78        ld      a,b
438e b7        or      a
438f 3eff      ld      a,$ff
4391 f5        push    af
4392 faf243    jp      m,$43f2
4395 d5        push    de
4396 c5        push    bc
4397 0d        dec     c
4398 faf043    jp      m,$43f0
439b 13        inc     de
439c 1a        ld      a,(de)
439d e60f      and     $0f
439f 3c        inc     a
43a0 47        ld      b,a
43a1 1a        ld      a,(de)
43a2 e6f0      and     $f0
43a4 fe50      cp      $50
43a6 cae143    jp      z,$43e1
43a9 fe20      cp      $20
43ab cad543    jp      z,$43d5
43ae fe10      cp      $10
43b0 cac943    jp      z,$43c9
43b3 fe60      cp      $60
43b5 cac343    jp      z,$43c3
43b8 fed0      cp      $d0
43ba c29743    jp      nz,$4397
43bd 212aff    ld      hl,$ff2a
43c0 c3ed43    jp      $43ed
43c3 2120ff    ld      hl,$ff20
43c6 c3ed43    jp      $43ed
43c9 78        ld      a,b
43ca 85        add     a,l
43cb 6f        ld      l,a
43cc ca9743    jp      z,$4397
43cf 212010    ld      hl,$1020
43d2 c3ed43    jp      $43ed
43d5 78        ld      a,b
43d6 85        add     a,l
43d7 6f        ld      l,a
43d8 ca9743    jp      z,$4397
43db 212b20    ld      hl,$202b
43de c3ed43    jp      $43ed
43e1 78        ld      a,b
43e2 84        add     a,h
43e3 67        ld      h,a
43e4 ca9743    jp      z,$4397
43e7 3a3802    ld      a,($0238)
43ea 6f        ld      l,a
43eb 2650      ld      h,$50
43ed 224306    ld      ($0643),hl
43f0 c1        pop     bc
43f1 d1        pop     de
43f2 3e08      ld      a,$08
43f4 324706    ld      ($0647),a
43f7 af        xor     a
43f8 324506    ld      ($0645),a
43fb 67        ld      h,a
43fc 6f        ld      l,a
43fd 224106    ld      ($0641),hl
4400 13        inc     de
4401 0d        dec     c
4402 fa9f44    jp      m,$449f
4405 1a        ld      a,(de)
4406 e60f      and     $0f
4408 3c        inc     a
4409 47        ld      b,a
440a 1a        ld      a,(de)
440b e6f0      and     $f0
440d fea0      cp      $a0
440f ca7e44    jp      z,$447e
4412 fec0      cp      $c0
4414 ca6044    jp      z,$4460
4417 fef0      cp      $f0
4419 ca7744    jp      z,$4477
441c e5        push    hl
441d f5        push    af
441e 78        ld      a,b
441f 2a4106    ld      hl,($0641)
4422 85        add     a,l
4423 6f        ld      l,a
4424 d22844    jp      nc,$4428
4427 24        inc     h
4428 224106    ld      ($0641),hl
442b f1        pop     af
442c 214406    ld      hl,$0644
442f be        cp      (hl)
4430 e1        pop     hl
4431 ca5644    jp      z,$4456
4434 f1        pop     af
4435 f5        push    af
4436 1a        ld      a,(de)
4437 fa8444    jp      m,$4484
443a e6f0      and     $f0
443c fee0      cp      $e0
443e ca7e44    jp      z,$447e
4441 fe60      cp      $60
4443 ca9544    jp      z,$4495
4446 fed0      cp      $d0
4448 ca9544    jp      z,$4495
444b fe40      cp      $40
444d c20044    jp      nz,$4400
4450 324506    ld      ($0645),a
4453 c39544    jp      $4495
4456 f1        pop     af
4457 da5c44    jp      c,$445c
445a 05        dec     b
445b 37        scf     
445c f5        push    af
445d c39544    jp      $4495
4460 7d        ld      a,l
4461 b7        or      a
4462 c26744    jp      nz,$4467
4465 90        sub     b
4466 47        ld      b,a
4467 f1        pop     af
4468 f5        push    af
4469 feff      cp      $ff
446b c26f44    jp      nz,$446f
446e 7d        ld      a,l
446f 80        add     a,b
4470 47        ld      b,a
4471 f1        pop     af
4472 78        ld      a,b
4473 f5        push    af
4474 c30044    jp      $4400
4477 af        xor     a
4478 324706    ld      ($0647),a
447b c30044    jp      $4400
447e f1        pop     af
447f 7d        ld      a,l
4480 f5        push    af
4481 c30044    jp      $4400
4484 e6f0      and     $f0
4486 fe10      cp      $10
4488 ca9544    jp      z,$4495
448b fe40      cp      $40
448d ca9544    jp      z,$4495
4490 fe80      cp      $80
4492 c20044    jp      nz,$4400
4495 78        ld      a,b
4496 85        add     a,l
4497 6f        ld      l,a
4498 d20044    jp      nc,$4400
449b 24        inc     h
449c c30044    jp      $4400
449f eb        ex      de,hl
44a0 223c06    ld      ($063c),hl
44a3 eb        ex      de,hl
44a4 c1        pop     bc
44a5 e3        ex      (sp),hl
44a6 3a4706    ld      a,($0647)
44a9 77        ld      (hl),a
44aa 23        inc     hl
44ab 78        ld      a,b
44ac c1        pop     bc
44ad c5        push    bc
44ae 71        ld      (hl),c
44af 23        inc     hl
44b0 70        ld      (hl),b
44b1 23        inc     hl
44b2 feff      cp      $ff
44b4 cab944    jp      z,$44b9
44b7 91        sub     c
44b8 2f        cpl     
44b9 c613      add     a,$13
44bb 77        ld      (hl),a
44bc 23        inc     hl
44bd 3620      ld      (hl),$20
44bf 23        inc     hl
44c0 3a3906    ld      a,($0639)
44c3 cde10c    call    $0ce1
44c6 eb        ex      de,hl
44c7 e3        ex      (sp),hl
44c8 09        add     hl,bc
44c9 eb        ex      de,hl
44ca 73        ld      (hl),e
44cb 23        inc     hl
44cc 72        ld      (hl),d
44cd 2a4106    ld      hl,($0641)
44d0 09        add     hl,bc
44d1 223f06    ld      ($063f),hl
44d4 d1        pop     de
44d5 c9        ret     

44d6 3c        inc     a
44d7 cd5438    call    $3854
44da cd7243    call    $4372
44dd cd0908    call    $0809
44e0 214245    ld      hl,$4542
44e3 e5        push    hl
44e4 3a3906    ld      a,($0639)
44e7 b7        or      a
44e8 fa0c3f    jp      m,$3f0c
44eb c3c53e    jp      $3ec5
44ee cde60d    call    $0de6
44f1 cd7243    call    $4372
44f4 cd0908    call    $0809
44f7 214245    ld      hl,$4542
44fa e5        push    hl
44fb 3a3906    ld      a,($0639)
44fe b7        or      a
44ff fa6a0e    jp      m,$0e6a
4502 c3e53e    jp      $3ee5
4505 cd7243    call    $4372
4508 cd0908    call    $0809
450b cdc53b    call    $3bc5
450e c31a45    jp      $451a
4511 cd7243    call    $4372
4514 cd0908    call    $0809
4517 cd013c    call    $3c01
451a 3aea03    ld      a,($03ea)
451d b7        or      a
451e ca4245    jp      z,$4542
4521 c9        ret     

4522 8b        adc     a,e
4523 45        ld      b,l
4524 8e        adc     a,(hl)
4525 45        ld      b,l
4526 9e        sbc     a,(hl)
4527 45        ld      b,l
4528 aa        xor     d
4529 45        ld      b,l
452a ed45      retn    

452c ad        xor     l
452d 45        ld      b,l
452e ed45      retn    

4530 b1        or      c
4531 45        ld      b,l
4532 b5        or      l
4533 45        ld      b,l
4534 c2455f    jp      nz,$5f45
4537 45        ld      b,l
4538 c5        push    bc
4539 45        ld      b,l
453a 5f        ld      e,a
453b 45        ld      b,l
453c ed45      retn    

453e dd45      ld      b,ixl
4540 5f        ld      e,a
4541 45        ld      b,l
4542 2a6802    ld      hl,($0268)
4545 2b        dec     hl
4546 e5        push    hl
4547 7e        ld      a,(hl)
4548 f5        push    af
4549 3630      ld      (hl),$30
454b af        xor     a
454c 324606    ld      ($0646),a
454f 3a3e06    ld      a,($063e)
4552 4f        ld      c,a
4553 2a6a02    ld      hl,($026a)
4556 e5        push    hl
4557 2a3f06    ld      hl,($063f)
455a e5        push    hl
455b 2a3c06    ld      hl,($063c)
455e eb        ex      de,hl
455f 0d        dec     c
4560 fa2446    jp      m,$4624
4563 1b        dec     de
4564 1a        ld      a,(de)
4565 e6f0      and     $f0
4567 214406    ld      hl,$0644
456a be        cp      (hl)
456b 21ed45    ld      hl,$45ed
456e ca8145    jp      z,$4581
4571 0f        rrca    
4572 0f        rrca    
4573 0f        rrca    
4574 212245    ld      hl,$4522
4577 85        add     a,l
4578 6f        ld      l,a
4579 d27d45    jp      nc,$457d
457c 24        inc     h
457d 7e        ld      a,(hl)
457e 23        inc     hl
457f 66        ld      h,(hl)
4580 6f        ld      l,a
4581 1a        ld      a,(de)
4582 e60f      and     $0f
4584 3c        inc     a
4585 47        ld      b,a
4586 e5        push    hl
4587 21e045    ld      hl,$45e0
458a c9        ret     

458b 3e20      ld      a,$20
458d e9        jp      (hl)
458e 3a3906    ld      a,($0639)
4591 b7        or      a
4592 faed45    jp      m,$45ed
4595 3aa803    ld      a,($03a8)
4598 b7        or      a
4599 3e20      ld      a,$20
459b c3a445    jp      $45a4
459e 3aa803    ld      a,($03a8)
45a1 b7        or      a
45a2 3e2b      ld      a,$2b
45a4 cae045    jp      z,$45e0
45a7 3e2d      ld      a,$2d
45a9 e9        jp      (hl)
45aa 3e30      ld      a,$30
45ac e9        jp      (hl)
45ad 3a3802    ld      a,($0238)
45b0 e9        jp      (hl)
45b1 3a3702    ld      a,($0237)
45b4 e9        jp      (hl)
45b5 3a3906    ld      a,($0639)
45b8 b7        or      a
45b9 faed45    jp      m,$45ed
45bc 215243    ld      hl,$4352
45bf c3c845    jp      $45c8
45c2 3e2f      ld      a,$2f
45c4 e9        jp      (hl)
45c5 214244    ld      hl,$4442
45c8 3aa803    ld      a,($03a8)
45cb b7        or      a
45cc c2d245    jp      nz,$45d2
45cf 212020    ld      hl,$2020
45d2 eb        ex      de,hl
45d3 e3        ex      (sp),hl
45d4 2b        dec     hl
45d5 73        ld      (hl),e
45d6 2b        dec     hl
45d7 72        ld      (hl),d
45d8 d1        pop     de
45d9 e5        push    hl
45da c35f45    jp      $455f
45dd 3a3602    ld      a,($0236)
45e0 eb        ex      de,hl
45e1 e3        ex      (sp),hl
45e2 2b        dec     hl
45e3 77        ld      (hl),a
45e4 05        dec     b
45e5 c2e245    jp      nz,$45e2
45e8 d1        pop     de
45e9 e5        push    hl
45ea c35f45    jp      $455f
45ed e1        pop     hl
45ee eb        ex      de,hl
45ef e3        ex      (sp),hl
45f0 1b        dec     de
45f1 2b        dec     hl
45f2 7e        ld      a,(hl)
45f3 12        ld      (de),a
45f4 fe30      cp      $30
45f6 cafc45    jp      z,$45fc
45f9 324606    ld      ($0646),a
45fc 05        dec     b
45fd c2f045    jp      nz,$45f0
4600 e3        ex      (sp),hl
4601 eb        ex      de,hl
4602 e5        push    hl
4603 c35f45    jp      $455f
4606 ba        cp      d
4607 46        ld      b,(hl)
4608 ba        cp      d
4609 46        ld      b,(hl)
460a ba        cp      d
460b 46        ld      b,(hl)
460c ba        cp      d
460d 46        ld      b,(hl)
460e 8d        adc     a,l
460f 46        ld      b,(hl)
4610 ba        cp      d
4611 46        ld      b,(hl)
4612 a8        xor     b
4613 46        ld      b,(hl)
4614 ba        cp      d
4615 46        ld      b,(hl)
4616 ba        cp      d
4617 46        ld      b,(hl)
4618 ba        cp      d
4619 46        ld      b,(hl)
461a 8d        adc     a,l
461b 46        ld      b,(hl)
461c ba        cp      d
461d 46        ld      b,(hl)
461e 56        ld      d,(hl)
461f 46        ld      b,(hl)
4620 a8        xor     b
4621 46        ld      b,(hl)
4622 8d        adc     a,l
4623 46        ld      b,(hl)
4624 e1        pop     hl
4625 e1        pop     hl
4626 f1        pop     af
4627 e1        pop     hl
4628 77        ld      (hl),a
4629 3a3906    ld      a,($0639)
462c 07        rlca    
462d d8        ret     c

462e 47        ld      b,a
462f 3a4606    ld      a,($0646)
4632 b7        or      a
4633 c24746    jp      nz,$4647
4636 78        ld      a,b
4637 b7        or      a
4638 3e20      ld      a,$20
463a f2dd46    jp      p,$46dd
463d 3a4506    ld      a,($0645)
4640 b7        or      a
4641 3a4306    ld      a,($0643)
4644 cadd46    jp      z,$46dd
4647 3a4306    ld      a,($0643)
464a 3c        inc     a
464b c8        ret     z

464c af        xor     a
464d 4f        ld      c,a
464e 2a3a06    ld      hl,($063a)
4651 eb        ex      de,hl
4652 2a6802    ld      hl,($0268)
4655 e5        push    hl
4656 13        inc     de
4657 1a        ld      a,(de)
4658 e6f0      and     $f0
465a 214406    ld      hl,$0644
465d be        cp      (hl)
465e 217a46    ld      hl,$467a
4661 ca7446    jp      z,$4674
4664 0f        rrca    
4665 0f        rrca    
4666 0f        rrca    
4667 210646    ld      hl,$4606
466a 85        add     a,l
466b 6f        ld      l,a
466c d27046    jp      nc,$4670
466f 24        inc     h
4670 7e        ld      a,(hl)
4671 23        inc     hl
4672 66        ld      h,(hl)
4673 6f        ld      l,a
4674 1a        ld      a,(de)
4675 e60f      and     $0f
4677 3c        inc     a
4678 47        ld      b,a
4679 e9        jp      (hl)
467a e1        pop     hl
467b 0e20      ld      c,$20
467d 3e30      ld      a,$30
467f be        cp      (hl)
4680 c28c46    jp      nz,$468c
4683 71        ld      (hl),c
4684 23        inc     hl
4685 05        dec     b
4686 c27f46    jp      nz,$467f
4689 c35546    jp      $4655
468c e5        push    hl
468d e1        pop     hl
468e 3a4406    ld      a,($0644)
4691 3c        inc     a
4692 c8        ret     z

4693 2b        dec     hl
4694 fe51      cp      $51
4696 caa346    jp      z,$46a3
4699 3aa803    ld      a,($03a8)
469c b7        or      a
469d caa346    jp      z,$46a3
46a0 362d      ld      (hl),$2d
46a2 c9        ret     

46a3 3a4306    ld      a,($0643)
46a6 77        ld      (hl),a
46a7 c9        ret     

46a8 3a4306    ld      a,($0643)
46ab e1        pop     hl
46ac 4f        ld      c,a
46ad 3e30      ld      a,$30
46af be        cp      (hl)
46b0 c0        ret     nz

46b1 71        ld      (hl),c
46b2 23        inc     hl
46b3 05        dec     b
46b4 c2af46    jp      nz,$46af
46b7 c35546    jp      $4655
46ba e1        pop     hl
46bb 79        ld      a,c
46bc b7        or      a
46bd cad346    jp      z,$46d3
46c0 3a4306    ld      a,($0643)
46c3 fe2a      cp      $2a
46c5 caca46    jp      z,$46ca
46c8 3e20      ld      a,$20
46ca 05        dec     b
46cb fa5546    jp      m,$4655
46ce 77        ld      (hl),a
46cf 23        inc     hl
46d0 c3ca46    jp      $46ca
46d3 7d        ld      a,l
46d4 80        add     a,b
46d5 6f        ld      l,a
46d6 d25546    jp      nc,$4655
46d9 24        inc     h
46da c35546    jp      $4655
46dd fe2a      cp      $2a
46df 3a4106    ld      a,($0641)
46e2 4f        ld      c,a
46e3 2a6802    ld      hl,($0268)
46e6 c2c70b    jp      nz,$0bc7
46e9 3a3602    ld      a,($0236)
46ec be        cp      (hl)
46ed caf246    jp      z,$46f2
46f0 362a      ld      (hl),$2a
46f2 23        inc     hl
46f3 0d        dec     c
46f4 c2ec46    jp      nz,$46ec
46f7 c9        ret     

46f8 4f        ld      c,a
46f9 0c        inc     c
46fa 11ca03    ld      de,$03ca
46fd d5        push    de
46fe 3e2b      ld      a,$2b
4700 324706    ld      ($0647),a
4703 3eff      ld      a,$ff
4705 f5        push    af
4706 0600      ld      b,$00
4708 0d        dec     c
4709 ca6847    jp      z,$4768
470c 3a3602    ld      a,($0236)
470f be        cp      (hl)
4710 7e        ld      a,(hl)
4711 23        inc     hl
4712 c21f47    jp      nz,$471f
4715 f1        pop     af
4716 da1b47    jp      c,$471b
4719 78        ld      a,b
471a 37        scf     
471b f5        push    af
471c c30847    jp      $4708
471f fe2d      cp      $2d
4721 c25847    jp      nz,$4758
4724 324706    ld      ($0647),a
4727 c30847    jp      $4708
472a 2b        dec     hl
472b 3a4806    ld      a,($0648)
472e b7        or      a
472f 7e        ld      a,(hl)
4730 23        inc     hl
4731 ca5847    jp      z,$4758
4734 fe43      cp      $43
4736 c24a47    jp      nz,$474a
4739 7e        ld      a,(hl)
473a fe52      cp      $52
473c 2b        dec     hl
473d 7e        ld      a,(hl)
473e 23        inc     hl
473f c24a47    jp      nz,$474a
4742 3e2d      ld      a,$2d
4744 324706    ld      ($0647),a
4747 c30847    jp      $4708
474a fe44      cp      $44
474c c25847    jp      nz,$4758
474f 7e        ld      a,(hl)
4750 fe42      cp      $42
4752 ca4247    jp      z,$4742
4755 2b        dec     hl
4756 7e        ld      a,(hl)
4757 23        inc     hl
4758 fe30      cp      $30
475a da0847    jp      c,$4708
475d fe3a      cp      $3a
475f d20847    jp      nc,$4708
4762 12        ld      (de),a
4763 13        inc     de
4764 04        inc     b
4765 c30847    jp      $4708
4768 3a4706    ld      a,($0647)
476b 12        ld      (de),a
476c 215002    ld      hl,$0250
476f 3602      ld      (hl),$02
4771 23        inc     hl
4772 70        ld      (hl),b
4773 23        inc     hl
4774 71        ld      (hl),c
4775 23        inc     hl
4776 3612      ld      (hl),$12
4778 f1        pop     af
4779 d28147    jp      nc,$4781
477c 90        sub     b
477d 2f        cpl     
477e c613      add     a,$13
4780 77        ld      (hl),a
4781 23        inc     hl
4782 3620      ld      (hl),$20
4784 110600    ld      de,$0006
4787 19        add     hl,de
4788 d1        pop     de
4789 73        ld      (hl),e
478a 23        inc     hl
478b 72        ld      (hl),d
478c c9        ret     

478d cd7243    call    $4372
4790 cd0908    call    $0809
4793 2a6802    ld      hl,($0268)
4796 af        xor     a
4797 324806    ld      ($0648),a
479a 3a4106    ld      a,($0641)
479d cdf846    call    $46f8
47a0 c3e044    jp      $44e0
47a3 cde60d    call    $0de6
47a6 af        xor     a
47a7 cd5e38    call    $385e
47aa cd0908    call    $0809
47ad 2a5a02    ld      hl,($025a)
47b0 3e01      ld      a,$01
47b2 324806    ld      ($0648),a
47b5 3a5102    ld      a,($0251)
47b8 cdf846    call    $46f8
47bb c3c53e    jp      $3ec5
47be cde60d    call    $0de6
47c1 cd0908    call    $0809
47c4 2a5102    ld      hl,($0251)
47c7 44        ld      b,h
47c8 4d        ld      c,l
47c9 2a5a02    ld      hl,($025a)
47cc 7e        ld      a,(hl)
47cd fe20      cp      $20
47cf cadf47    jp      z,$47df
47d2 fe41      cp      $41
47d4 da990b    jp      c,$0b99
47d7 fe5a      cp      $5a
47d9 cadf47    jp      z,$47df
47dc d2990b    jp      nc,$0b99
47df 23        inc     hl
47e0 0b        dec     bc
47e1 78        ld      a,b
47e2 b1        or      c
47e3 c2cc47    jp      nz,$47cc
47e6 c3990b    jp      $0b99
47e9 cde60d    call    $0de6
47ec cd0908    call    $0809
47ef 2a5102    ld      hl,($0251)
47f2 eb        ex      de,hl
47f3 2a5a02    ld      hl,($025a)
47f6 c34248    jp      $4842
47f9 cd5438    call    $3854
47fc cd0908    call    $0809
47ff 2a5102    ld      hl,($0251)
4802 eb        ex      de,hl
4803 2a5a02    ld      hl,($025a)
4806 3a5002    ld      a,($0250)
4809 e60e      and     $0e
480b 07        rlca    
480c 07        rlca    
480d 07        rlca    
480e 07        rlca    
480f 07        rlca    
4810 da4248    jp      c,$4842
4813 07        rlca    
4814 da2b48    jp      c,$482b
4817 e5        push    hl
4818 07        rlca    
4819 da2548    jp      c,$4825
481c 19        add     hl,de
481d 2b        dec     hl
481e 7e        ld      a,(hl)
481f e6bf      and     $bf
4821 e1        pop     hl
4822 c34448    jp      $4844
4825 19        add     hl,de
4826 7e        ld      a,(hl)
4827 e1        pop     hl
4828 c33848    jp      $4838
482b 07        rlca    
482c da3648    jp      c,$4836
482f 7e        ld      a,(hl)
4830 e6bf      and     $bf
4832 23        inc     hl
4833 c34448    jp      $4844
4836 7e        ld      a,(hl)
4837 23        inc     hl
4838 fe2d      cp      $2d
483a ca4248    jp      z,$4842
483d fe2b      cp      $2b
483f c2990b    jp      nz,$0b99
4842 7e        ld      a,(hl)
4843 23        inc     hl
4844 fe30      cp      $30
4846 da990b    jp      c,$0b99
4849 fe39      cp      $39
484b ca5148    jp      z,$4851
484e d2990b    jp      nc,$0b99
4851 1b        dec     de
4852 7a        ld      a,d
4853 b3        or      e
4854 c24248    jp      nz,$4842
4857 c3990b    jp      $0b99
485a 2020      jr      nz,$487c
485c 2020      jr      nz,$487e
485e 2020      jr      nz,$4880
4860 2020      jr      nz,$4882
4862 2020      jr      nz,$4884
4864 2020      jr      nz,$4886
4866 2020      jr      nz,$4888
4868 2020      jr      nz,$488a
486a 2020      jr      nz,$488c
486c 2020      jr      nz,$488e
486e 2020      jr      nz,$4890
4870 2020      jr      nz,$4892
4872 2020      jr      nz,$4894
4874 2020      jr      nz,$4896
4876 2020      jr      nz,$4898
4878 2020      jr      nz,$489a
487a 2020      jr      nz,$489c
487c 2020      jr      nz,$489e
487e 2020      jr      nz,$48a0
4880 2020      jr      nz,$48a2
4882 2020      jr      nz,$48a4
4884 2020      jr      nz,$48a6
4886 2020      jr      nz,$48a8
4888 2020      jr      nz,$48aa
488a 2020      jr      nz,$48ac
488c 2020      jr      nz,$48ae
488e 2020      jr      nz,$48b0
4890 2020      jr      nz,$48b2
4892 2020      jr      nz,$48b4
4894 2020      jr      nz,$48b6
4896 2020      jr      nz,$48b8
4898 2020      jr      nz,$48ba
489a 2020      jr      nz,$48bc
489c 2020      jr      nz,$48be
489e 2020      jr      nz,$48c0
48a0 2020      jr      nz,$48c2
48a2 2020      jr      nz,$48c4
48a4 2020      jr      nz,$48c6
48a6 2020      jr      nz,$48c8
48a8 2020      jr      nz,$48ca
48aa 2020      jr      nz,$48cc
48ac 2020      jr      nz,$48ce
48ae 2020      jr      nz,$48d0
48b0 2020      jr      nz,$48d2
48b2 2020      jr      nz,$48d4
48b4 2020      jr      nz,$48d6
48b6 2020      jr      nz,$48d8
48b8 2020      jr      nz,$48da
48ba 2020      jr      nz,$48dc
48bc 2020      jr      nz,$48de
48be 2020      jr      nz,$48e0
48c0 2020      jr      nz,$48e2
48c2 2020      jr      nz,$48e4
48c4 2020      jr      nz,$48e6
48c6 2020      jr      nz,$48e8
48c8 2020      jr      nz,$48ea
48ca 2020      jr      nz,$48ec
48cc 2020      jr      nz,$48ee
48ce 2020      jr      nz,$48f0
48d0 2020      jr      nz,$48f2
48d2 2020      jr      nz,$48f4
48d4 2020      jr      nz,$48f6
48d6 2020      jr      nz,$48f8
48d8 2020      jr      nz,$48fa
48da 2020      jr      nz,$48fc
48dc 2020      jr      nz,$48fe
48de 2020      jr      nz,$4900
48e0 2020      jr      nz,$4902
48e2 2020      jr      nz,$4904
48e4 2020      jr      nz,$4906
48e6 2020      jr      nz,$4908
48e8 2020      jr      nz,$490a
48ea 2020      jr      nz,$490c
48ec 2020      jr      nz,$490e
48ee 2020      jr      nz,$4910
48f0 2020      jr      nz,$4912
48f2 2020      jr      nz,$4914
48f4 2020      jr      nz,$4916
48f6 2020      jr      nz,$4918
48f8 2020      jr      nz,$491a
48fa 2020      jr      nz,$491c
48fc 2020      jr      nz,$491e
48fe 2020      jr      nz,$4920
4900 2020      jr      nz,$4922
4902 2020      jr      nz,$4924
4904 2020      jr      nz,$4926
4906 2020      jr      nz,$4928
4908 2020      jr      nz,$492a
490a 2020      jr      nz,$492c
490c 2020      jr      nz,$492e
490e 2020      jr      nz,$4930
4910 2020      jr      nz,$4932
4912 2020      jr      nz,$4934
4914 2020      jr      nz,$4936
4916 2020      jr      nz,$4938
4918 2020      jr      nz,$493a
491a 2020      jr      nz,$493c
491c 2020      jr      nz,$493e
491e 2020      jr      nz,$4940
4920 2020      jr      nz,$4942
4922 24        inc     h
4923 49        ld      c,c
4924 4e        ld      c,(hl)
4925 53        ld      d,e
4926 50        ld      d,b
4927 45        ld      b,l
4928 43        ld      b,e
4929 54        ld      d,h
492a 2020      jr      nz,$494c
492c 2020      jr      nz,$494e
492e 2020      jr      nz,$4950
4930 2020      jr      nz,$4952
4932 00        nop     
4933 02        ld      (bc),a
4934 2020      jr      nz,$4956
4936 2020      jr      nz,$4958
4938 2020      jr      nz,$495a
493a 2020      jr      nz,$495c
493c 2020      jr      nz,$495e
493e 2020      jr      nz,$4960
4940 2020      jr      nz,$4962
4942 2020      jr      nz,$4964
4944 2020      jr      nz,$4966
4946 2020      jr      nz,$4968
4948 2020      jr      nz,$496a
494a 2020      jr      nz,$496c
494c 2020      jr      nz,$496e
494e 2020      jr      nz,$4970
4950 2020      jr      nz,$4972
4952 2020      jr      nz,$4974
4954 2020      jr      nz,$4976
4956 2020      jr      nz,$4978
4958 2020      jr      nz,$497a
495a 2020      jr      nz,$497c
495c 2020      jr      nz,$497e
495e 2020      jr      nz,$4980
4960 2020      jr      nz,$4982
4962 2020      jr      nz,$4984
4964 2020      jr      nz,$4986
4966 2020      jr      nz,$4988
4968 2020      jr      nz,$498a
496a a2        and     d
496b 00        nop     
496c 010f01    ld      bc,$010f
496f 08        ex      af,af'
4970 d8        ret     c

4971 d40010    call    nc,$1000
4974 067f      ld      b,$7f
4976 ff        rst     $38
4977 011401    ld      bc,$0114
497a 13        inc     de
497b 010001    ld      bc,$0100
497e 110113    ld      de,$1301
4981 d8        ret     c

4982 d40010    call    nc,$1000
4985 067f      ld      b,$7f
4987 ff        rst     $38
4988 010001    ld      bc,$0100
498b 12        ld      (de),a
498c 010f01    ld      bc,$010f
498f 110112    ld      de,$1201
4992 2001      jr      nz,$4995
4994 08        ex      af,af'
4995 00        nop     
4996 00        nop     
4997 d303      out     ($03),a
4999 80        add     a,b
499a 00        nop     
499b 80        add     a,b
499c 02        ld      (bc),a
499d 80        add     a,b
499e 04        inc     b
499f a3        and     e
49a0 00        nop     
49a1 0f        rrca    
49a2 00        nop     
49a3 09        add     hl,bc
49a4 c5        push    bc
49a5 d28002    jp      nc,$0280
49a8 c0        ret     nz

49a9 d28006    jp      nc,$0680
49ac d8        ret     c

49ad a3        and     e
49ae 00        nop     
49af 0f        rrca    
49b0 00        nop     
49b1 09        add     hl,bc
49b2 c44002    call    nz,$0240
49b5 08        ex      af,af'
49b6 c0        ret     nz

49b7 d28004    jp      nc,$0480
49ba d8        ret     c

49bb 43        ld      b,e
49bc 03        inc     bc
49bd 06c4      ld      b,$c4
49bf d28008    jp      nc,$0880
49c2 c0        ret     nz

49c3 a3        and     e
49c4 00        nop     
49c5 0f        rrca    
49c6 00        nop     
49c7 07        rlca    
49c8 c5        push    bc
49c9 d2800a    jp      nc,$0a80
49cc c0        ret     nz

49cd d8        ret     c

49ce 4c        ld      c,h
49cf 00        nop     
49d0 0104d2    ld      bc,$d204
49d3 80        add     a,b
49d4 04        inc     b
49d5 d8        ret     c

49d6 43        ld      b,e
49d7 02        ld      (bc),a
49d8 06c5      ld      b,$c5
49da d28004    jp      nc,$0480
49dd c0        ret     nz

49de d8        ret     c

49df 43        ld      b,e
49e0 03        inc     bc
49e1 0d        dec     c
49e2 c4d280    call    nz,$80d2
49e5 0c        inc     c
49e6 c0        ret     nz

49e7 40        ld      b,b
49e8 03        inc     bc
49e9 08        ex      af,af'
49ea d8        ret     c

49eb 2001      jr      nz,$49ee
49ed 0d        dec     c
49ee 00        nop     
49ef 00        nop     
49f0 d303      out     ($03),a
49f2 80        add     a,b
49f3 0e80      ld      c,$80
49f5 1080      djnz    $4977
49f7 12        ld      (de),a
49f8 a3        and     e
49f9 00        nop     
49fa 0f        rrca    
49fb 00        nop     
49fc 0ec5      ld      c,$c5
49fe d28010    jp      nc,$1080
4a01 c0        ret     nz

4a02 d28014    jp      nc,$1480
4a05 d8        ret     c

4a06 a3        and     e
4a07 00        nop     
4a08 0f        rrca    
4a09 00        nop     
4a0a 0ec4      ld      c,$c4
4a0c 40        ld      b,b
4a0d 02        ld      (bc),a
4a0e 0d        dec     c
4a0f c0        ret     nz

4a10 d28012    jp      nc,$1280
4a13 d8        ret     c

4a14 43        ld      b,e
4a15 03        inc     bc
4a16 0a        ld      a,(bc)
4a17 c4d280    call    nz,$80d2
4a1a 16c0      ld      d,$c0
4a1c a3        and     e
4a1d 00        nop     
4a1e 0f        rrca    
4a1f 00        nop     
4a20 0b        dec     bc
4a21 c5        push    bc
4a22 d28018    jp      nc,$1880
4a25 c0        ret     nz

4a26 d8        ret     c

4a27 d40010    call    nc,$1000
4a2a 0601      ld      b,$01
4a2c 0c        inc     c
4a2d 011101    ld      bc,$0111
4a30 12        ld      (de),a
4a31 7f        ld      a,a
4a32 ff        rst     $38
4a33 010001    ld      bc,$0100
4a36 12        ld      (de),a
4a37 43        ld      b,e
4a38 010ac4    ld      bc,$c40a
4a3b d28014    jp      nc,$1480
4a3e c0        ret     nz

4a3f d28012    jp      nc,$1280
4a42 d8        ret     c

4a43 43        ld      b,e
4a44 02        ld      (bc),a
4a45 0a        ld      a,(bc)
4a46 c5        push    bc
4a47 d28012    jp      nc,$1280
4a4a c0        ret     nz

4a4b d8        ret     c

4a4c 43        ld      b,e
4a4d 03        inc     bc
4a4e 08        ex      af,af'
4a4f c4d280    call    nz,$80d2
4a52 0c        inc     c
4a53 c0        ret     nz

4a54 40        ld      b,b
4a55 03        inc     bc
4a56 0d        dec     c
4a57 d8        ret     c

4a58 0b        dec     bc
4a59 02        ld      (bc),a
4a5a 00        nop     
4a5b c64c      add     a,$4c
4a5d 00        nop     
4a5e 0100d2    ld      bc,$d200
4a61 00        nop     
4a62 11c0d8    ld      de,$d8c0
4a65 d40010    call    nc,$1000
4a68 0601      ld      b,$01
4a6a 00        nop     
4a6b 011101    ld      bc,$0111
4a6e 13        inc     de
4a6f 7f        ld      a,a
4a70 ff        rst     $38
4a71 011401    ld      bc,$0114
4a74 13        inc     de
4a75 d8        ret     c

4a76 d5        push    de
4a77 00        nop     
4a78 3c        inc     a
4a79 00        nop     
4a7a 4a        ld      c,d
4a7b 00        nop     
4a7c 7a        ld      a,d
4a7d 00        nop     
4a7e 6e        ld      l,(hl)
4a7f 00        nop     
4a80 5d        ld      e,l
4a81 00        nop     
4a82 65        ld      h,l
4a83 00        nop     
4a84 f40095    call    p,$9500
4a87 00        nop     
4a88 a3        and     e
4a89 00        nop     
4a8a e7        rst     $20
4a8b 00        nop     
4a8c db00      in      a,($00)
4a8e b6        or      (hl)
4a8f 00        nop     
4a90 d28012    jp      nc,$1280
4a93 d8        ret     c

4a94 43        ld      b,e
4a95 03        inc     bc
4a96 0a        ld      a,(bc)
4a97 c4d280    call    nz,$80d2
4a9a 16c0      ld      d,$c0
4a9c a3        and     e
4a9d 00        nop     
4a9e 0f        rrca    
4a9f 00        nop     
4aa0 0b        dec     bc
4aa1 c5        push    bc
4aa2 d28018    jp      nc,$1880
4aa5 c0        ret     nz

4aa6 d8        ret     c

4aa7 d40010    call    nc,$1000
4aaa 0601      ld      b,$01
4aac 0c        inc     c
4aad 011101    ld      bc,$0111
4ab0 12        ld      (de),a
4ab1 7f        ld      a,a
4ab2 ff        rst     $38
4ab3 010001    ld      bc,$0100
4ab6 12        ld      (de),a
4ab7 43        ld      b,e
4ab8 010ac4    ld      bc,$c40a
4abb d28014    jp      nc,$1480
4abe c0        ret     nz

4abf d20000    jp      nc,$0000
4ac2 00        nop     
4ac3 00        nop     
4ac4 41        ld      b,c
4ac5 41        ld      b,c
4ac6 00        nop     
4ac7 00        nop     
4ac8 41        ld      b,c
4ac9 41        ld      b,c
4aca 04        inc     b
4acb 04        inc     b
4acc 24        inc     h
4acd 2e2c      ld      l,$2c
4acf 00        nop     
4ad0 ff        rst     $38
4ad1 ff        rst     $38
4ad2 010000    ld      bc,$0000
4ad5 00        nop     
4ad6 00        nop     
4ad7 1601      ld      d,$01
4ad9 07        rlca    
4ada 00        nop     
4adb 62        ld      h,d
4adc 6b        ld      l,e
4add 2b        dec     hl
4ade 7e        ld      a,(hl)
4adf 328b02    ld      ($028b),a
4ae2 229302    ld      ($0293),hl
4ae5 cde60d    call    $0de6
4ae8 eb        ex      de,hl
4ae9 223f02    ld      ($023f),hl
4aec 225c02    ld      ($025c),hl
4aef 2a5a02    ld      hl,($025a)
4af2 225f02    ld      ($025f),hl
4af5 f1        pop     af
4af6 f5        push    af
4af7 3e80      ld      a,$80
4af9 c2fd4a    jp      nz,$4afd
4afc 07        rlca    
4afd 324102    ld      ($0241),a
4b00 cd0b4b    call    $4b0b
4b03 2a3f02    ld      hl,($023f)
4b06 eb        ex      de,hl
4b07 cd0908    call    $0809
4b0a c9        ret     

4b0b af        xor     a
4b0c 328802    ld      ($0288),a
4b0f cdaf53    call    $53af
4b12 21ffff    ld      hl,$ffff
4b15 224e06    ld      ($064e),hl
4b18 2a4302    ld      hl,($0243)
4b1b 010100    ld      bc,$0001
4b1e 09        add     hl,bc
4b1f d2284b    jp      nc,$4b28
4b22 224302    ld      ($0243),hl
4b25 cd4801    call    $0148
4b28 af        xor     a
4b29 114906    ld      de,$0649
4b2c 12        ld      (de),a
4b2d 13        inc     de
4b2e 12        ld      (de),a
4b2f 2a3902    ld      hl,($0239)
4b32 7c        ld      a,h
4b33 a5        and     l
4b34 3c        inc     a
4b35 ca634b    jp      z,$4b63
4b38 7e        ld      a,(hl)
4b39 23        inc     hl
4b3a b6        or      (hl)
4b3b 23        inc     hl
4b3c b6        or      (hl)
4b3d 23        inc     hl
4b3e b6        or      (hl)
4b3f fe20      cp      $20
4b41 ca634b    jp      z,$4b63
4b44 fe30      cp      $30
4b46 ca634b    jp      z,$4b63
4b49 3e01      ld      a,$01
4b4b 12        ld      (de),a
4b4c 1b        dec     de
4b4d 12        ld      (de),a
4b4e 2b        dec     hl
4b4f 2b        dec     hl
4b50 2b        dec     hl
4b51 3a9101    ld      a,($0191)
4b54 cdb04b    call    $4bb0
4b57 58        ld      e,b
4b58 3a9001    ld      a,($0190)
4b5b cdb04b    call    $4bb0
4b5e 6b        ld      l,e
4b5f 60        ld      h,b
4b60 224b06    ld      ($064b),hl
4b63 3a9d02    ld      a,($029d)
4b66 114b02    ld      de,$024b
4b69 b7        or      a
4b6a ca824b    jp      z,$4b82
4b6d 3a0602    ld      a,($0206)
4b70 b7        or      a
4b71 ca7d4b    jp      z,$4b7d
4b74 2a4802    ld      hl,($0248)
4b77 23        inc     hl
4b78 7e        ld      a,(hl)
4b79 b7        or      a
4b7a c2824b    jp      nz,$4b82
4b7d 1a        ld      a,(de)
4b7e b7        or      a
4b7f c44d56    call    nz,$564d
4b82 cd6853    call    $5368
4b85 3a8b02    ld      a,($028b)
4b88 fee5      cp      $e5
4b8a c2c84b    jp      nz,$4bc8
4b8d 3a4102    ld      a,($0241)
4b90 07        rlca    
4b91 d8        ret     c

4b92 2a5a02    ld      hl,($025a)
4b95 3a9101    ld      a,($0191)
4b98 cdb04b    call    $4bb0
4b9b d29f4b    jp      nc,$4b9f
4b9e 47        ld      b,a
4b9f 58        ld      e,b
4ba0 3a9001    ld      a,($0190)
4ba3 cdb04b    call    $4bb0
4ba6 d2aa4b    jp      nc,$4baa
4ba9 47        ld      b,a
4baa 6b        ld      l,e
4bab 60        ld      h,b
4bac 224302    ld      ($0243),hl
4baf c9        ret     

4bb0 f5        push    af
4bb1 7e        ld      a,(hl)
4bb2 23        inc     hl
4bb3 e60f      and     $0f
4bb5 07        rlca    
4bb6 47        ld      b,a
4bb7 07        rlca    
4bb8 07        rlca    
4bb9 80        add     a,b
4bba 47        ld      b,a
4bbb 7e        ld      a,(hl)
4bbc 23        inc     hl
4bbd e60f      and     $0f
4bbf 80        add     a,b
4bc0 3d        dec     a
4bc1 47        ld      b,a
4bc2 f1        pop     af
4bc3 b8        cp      b
4bc4 d0        ret     nc

4bc5 0600      ld      b,$00
4bc7 c9        ret     

4bc8 fee8      cp      $e8
4bca dae64b    jp      c,$4be6
4bcd 2a9302    ld      hl,($0293)
4bd0 23        inc     hl
4bd1 7e        ld      a,(hl)
4bd2 fe60      cp      $60
4bd4 c2e64b    jp      nz,$4be6
4bd7 23        inc     hl
4bd8 7e        ld      a,(hl)
4bd9 fe20      cp      $20
4bdb c2e64b    jp      nz,$4be6
4bde 3a4102    ld      a,($0241)
4be1 07        rlca    
4be2 d43f01    call    nc,$013f
4be5 c9        ret     

4be6 3e01      ld      a,$01
4be8 324202    ld      ($0242),a
4beb 2a4302    ld      hl,($0243)
4bee 228602    ld      ($0286),hl
4bf1 c3f74b    jp      $4bf7
4bf4 cd844f    call    $4f84
4bf7 3a4102    ld      a,($0241)
4bfa 07        rlca    
4bfb da5c4c    jp      c,$4c5c
4bfe 3a8b02    ld      a,($028b)
4c01 0f        rrca    
4c02 d21f4c    jp      nc,$4c1f
4c05 2a5102    ld      hl,($0251)
4c08 eb        ex      de,hl
4c09 2a5a02    ld      hl,($025a)
4c0c e5        push    hl
4c0d c1        pop     bc
4c0e cd064d    call    $4d06
4c11 d25c4c    jp      nc,$4c5c
4c14 3a8b02    ld      a,($028b)
4c17 fee8      cp      $e8
4c19 d24a4c    jp      nc,$4c4a
4c1c c39e4c    jp      $4c9e
4c1f 3a4202    ld      a,($0242)
4c22 0f        rrca    
4c23 d23c4c    jp      nc,$4c3c
4c26 2a8602    ld      hl,($0286)
4c29 226102    ld      ($0261),hl
4c2c 2a9302    ld      hl,($0293)
4c2f 226a02    ld      ($026a),hl
4c32 2a5a02    ld      hl,($025a)
4c35 226802    ld      ($0268),hl
4c38 af        xor     a
4c39 324202    ld      ($0242),a
4c3c 3a8b02    ld      a,($028b)
4c3f fee8      cp      $e8
4c41 da524c    jp      c,$4c52
4c44 cd914e    call    $4e91
4c47 ca5c4c    jp      z,$4c5c
4c4a 3e80      ld      a,$80
4c4c 324102    ld      ($0241),a
4c4f c35c4c    jp      $4c5c
4c52 3a4b02    ld      a,($024b)
4c55 b7        or      a
4c56 c44d56    call    nz,$564d
4c59 cd5c4d    call    $4d5c
4c5c 2a5c02    ld      hl,($025c)
4c5f 229302    ld      ($0293),hl
4c62 7e        ld      a,(hl)
4c63 e6f2      and     $f2
4c65 fee2      cp      $e2
4c67 c2754c    jp      nz,$4c75
4c6a 7e        ld      a,(hl)
4c6b 328b02    ld      ($028b),a
4c6e 23        inc     hl
4c6f 225c02    ld      ($025c),hl
4c72 c3f44b    jp      $4bf4
4c75 3a4102    ld      a,($0241)
4c78 07        rlca    
4c79 dad34c    jp      c,$4cd3
4c7c 2a3f02    ld      hl,($023f)
4c7f 3a9402    ld      a,($0294)
4c82 bc        cp      h
4c83 da904c    jp      c,$4c90
4c86 c2964c    jp      nz,$4c96
4c89 3a9302    ld      a,($0293)
4c8c bd        cp      l
4c8d d2964c    jp      nc,$4c96
4c90 2a5c02    ld      hl,($025c)
4c93 c36a4c    jp      $4c6a
4c96 3a8b02    ld      a,($028b)
4c99 fee8      cp      $e8
4c9b d2d34c    jp      nc,$4cd3
4c9e 3a5006    ld      a,($0650)
4ca1 b7        or      a
4ca2 c44201    call    nz,$0142
4ca5 3a4202    ld      a,($0242)
4ca8 0f        rrca    
4ca9 da4a4c    jp      c,$4c4a
4cac 2a5a02    ld      hl,($025a)
4caf e5        push    hl
4cb0 c1        pop     bc
4cb1 2a5102    ld      hl,($0251)
4cb4 eb        ex      de,hl
4cb5 3e02      ld      a,$02
4cb7 324202    ld      ($0242),a
4cba 3d        dec     a
4cbb 328802    ld      ($0288),a
4cbe 3a9901    ld      a,($0199)
4cc1 210000    ld      hl,$0000
4cc4 39        add     hl,sp
4cc5 2b        dec     hl
4cc6 2b        dec     hl
4cc7 229102    ld      ($0291),hl
4cca cdd94f    call    $4fd9
4ccd cdb553    call    $53b5
4cd0 c35c4c    jp      $4c5c
4cd3 2a5c02    ld      hl,($025c)
4cd6 223f02    ld      ($023f),hl
4cd9 210000    ld      hl,$0000
4cdc 224302    ld      ($0243),hl
4cdf af        xor     a
4ce0 21f901    ld      hl,$01f9
4ce3 86        add     a,(hl)
4ce4 fa054d    jp      m,$4d05
4ce7 c2f04c    jp      nz,$4cf0
4cea cd7653    call    $5376
4ced c3054d    jp      $4d05
4cf0 0f        rrca    
4cf1 f5        push    af
4cf2 3a8b02    ld      a,($028b)
4cf5 e608      and     $08
4cf7 ca014d    jp      z,$4d01
4cfa f1        pop     af
4cfb dc7653    call    c,$5376
4cfe c3054d    jp      $4d05
4d01 f1        pop     af
4d02 d47653    call    nc,$5376
4d05 c9        ret     

4d06 c5        push    bc
4d07 d5        push    de
4d08 2a8602    ld      hl,($0286)
4d0b eb        ex      de,hl
4d0c 5a        ld      e,d
4d0d 1600      ld      d,$00
4d0f af        xor     a
4d10 bc        cp      h
4d11 c2314d    jp      nz,$4d31
4d14 3a9001    ld      a,($0190)
4d17 93        sub     e
4d18 bd        cp      l
4d19 da314d    jp      c,$4d31
4d1c ca314d    jp      z,$4d31
4d1f 7d        ld      a,l
4d20 2a8602    ld      hl,($0286)
4d23 84        add     a,h
4d24 67        ld      h,a
4d25 228602    ld      ($0286),hl
4d28 e1        pop     hl
4d29 d1        pop     de
4d2a 19        add     hl,de
4d2b 225a02    ld      ($025a),hl
4d2e d0        ret     nc

4d2f 3f        ccf     
4d30 c9        ret     

4d31 3a9001    ld      a,($0190)
4d34 4f        ld      c,a
4d35 0600      ld      b,$00
4d37 03        inc     bc
4d38 19        add     hl,de
4d39 eb        ex      de,hl
4d3a cd530b    call    $0b53
4d3d e5        push    hl
4d3e 2a8602    ld      hl,($0286)
4d41 2600      ld      h,$00
4d43 19        add     hl,de
4d44 af        xor     a
4d45 bc        cp      h
4d46 c2574d    jp      nz,$4d57
4d49 3a9101    ld      a,($0191)
4d4c bd        cp      l
4d4d da574d    jp      c,$4d57
4d50 eb        ex      de,hl
4d51 e1        pop     hl
4d52 65        ld      h,l
4d53 6b        ld      l,e
4d54 c3254d    jp      $4d25
4d57 e1        pop     hl
4d58 d1        pop     de
4d59 c1        pop     bc
4d5a 37        scf     
4d5b c9        ret     

4d5c 210000    ld      hl,$0000
4d5f 39        add     hl,sp
4d60 229102    ld      ($0291),hl
4d63 2a5a02    ld      hl,($025a)
4d66 e5        push    hl
4d67 c1        pop     bc
4d68 2a5102    ld      hl,($0251)
4d6b eb        ex      de,hl
4d6c 3a4202    ld      a,($0242)
4d6f de02      sbc     a,$02
4d71 c2834d    jp      nz,$4d83
4d74 324202    ld      ($0242),a
4d77 1b        dec     de
4d78 cd064d    call    $4d06
4d7b 2a5a02    ld      hl,($025a)
4d7e e5        push    hl
4d7f c1        pop     bc
4d80 110100    ld      de,$0001
4d83 3a5606    ld      a,($0656)
4d86 de01      sbc     a,$01
4d88 c2914d    jp      nz,$4d91
4d8b 325606    ld      ($0656),a
4d8e 110100    ld      de,$0001
4d91 cd0f53    call    $530f
4d94 e5        push    hl
4d95 3a4906    ld      a,($0649)
4d98 b7        or      a
4d99 c2a54d    jp      nz,$4da5
4d9c 325506    ld      ($0655),a
4d9f cdfd01    call    $01fd
4da2 c3034e    jp      $4e03
4da5 f5        push    af
4da6 2a8602    ld      hl,($0286)
4da9 3a4d06    ld      a,($064d)
4dac b7        or      a
4dad c2c24d    jp      nz,$4dc2
4db0 3a4e06    ld      a,($064e)
4db3 bd        cp      l
4db4 c2c24d    jp      nz,$4dc2
4db7 3a4f06    ld      a,($064f)
4dba bc        cp      h
4dbb c2c24d    jp      nz,$4dc2
4dbe f1        pop     af
4dbf c3d84d    jp      $4dd8
4dc2 af        xor     a
4dc3 324d06    ld      ($064d),a
4dc6 3c        inc     a
4dc7 328802    ld      ($0288),a
4dca 224e06    ld      ($064e),hl
4dcd f1        pop     af
4dce 3d        dec     a
4dcf c2f74d    jp      nz,$4df7
4dd2 cd8253    call    $5382
4dd5 c2e34d    jp      nz,$4de3
4dd8 af        xor     a
4dd9 324906    ld      ($0649),a
4ddc 328802    ld      ($0288),a
4ddf e1        pop     hl
4de0 c3834d    jp      $4d83
4de3 d2f14d    jp      nc,$4df1
4de6 3e02      ld      a,$02
4de8 324906    ld      ($0649),a
4deb 3a9901    ld      a,($0199)
4dee c3034e    jp      $4e03
4df1 3a9a01    ld      a,($019a)
4df4 c3034e    jp      $4e03
4df7 cd8253    call    $5382
4dfa cad84d    jp      z,$4dd8
4dfd dad84d    jp      c,$4dd8
4e00 3a9801    ld      a,($0198)
4e03 e1        pop     hl
4e04 cdd94f    call    $4fd9
4e07 ca834d    jp      z,$4d83
4e0a c5        push    bc
4e0b 4f        ld      c,a
4e0c cd4501    call    $0145
4e0f c1        pop     bc
4e10 ca834d    jp      z,$4d83
4e13 f5        push    af
4e14 3a8b02    ld      a,($028b)
4e17 e6fd      and     $fd
4e19 fee4      cp      $e4
4e1b c2454e    jp      nz,$4e45
4e1e e3        ex      (sp),hl
4e1f 3a3602    ld      a,($0236)
4e22 bc        cp      h
4e23 e3        ex      (sp),hl
4e24 c2314e    jp      nz,$4e31
4e27 f1        pop     af
4e28 cd4a52    call    $524a
4e2b cd7750    call    $5077
4e2e c3834d    jp      $4d83
4e31 f1        pop     af
4e32 fe30      cp      $30
4e34 da3c4e    jp      c,$4e3c
4e37 fe3a      cp      $3a
4e39 da464e    jp      c,$4e46
4e3c cd7153    call    $5371
4e3f cd4201    call    $0142
4e42 c3834d    jp      $4d83
4e45 f1        pop     af
4e46 02        ld      (bc),a
4e47 67        ld      h,a
4e48 3a9201    ld      a,($0192)
4e4b fe00      cp      $00
4e4d 7c        ld      a,h
4e4e ca5d4e    jp      z,$4e5d
4e51 c5        push    bc
4e52 4c        ld      c,h
4e53 cd4e01    call    $014e
4e56 c1        pop     bc
4e57 cc4b53    call    z,$534b
4e5a c3604e    jp      $4e60
4e5d cd0153    call    $5301
4e60 cdab4f    call    $4fab
4e63 d27b4e    jp      nc,$4e7b
4e66 af        xor     a
4e67 bc        cp      h
4e68 ca7b4e    jp      z,$4e7b
4e6b cd7153    call    $5371
4e6e 3a5006    ld      a,($0650)
4e71 b7        or      a
4e72 c44201    call    nz,$0142
4e75 cdb553    call    $53b5
4e78 c3834d    jp      $4d83
4e7b cd0f53    call    $530f
4e7e 03        inc     bc
4e7f 1b        dec     de
4e80 7a        ld      a,d
4e81 b3        or      e
4e82 c2944d    jp      nz,$4d94
4e85 cdc34f    call    $4fc3
4e88 cdab4f    call    $4fab
4e8b c5        push    bc
4e8c e1        pop     hl
4e8d 225a02    ld      ($025a),hl
4e90 c9        ret     

4e91 af        xor     a
4e92 324906    ld      ($0649),a
4e95 cd0f53    call    $530f
4e98 2a5102    ld      hl,($0251)
4e9b eb        ex      de,hl
4e9c 2a5a02    ld      hl,($025a)
4e9f e5        push    hl
4ea0 c1        pop     bc
4ea1 af        xor     a
4ea2 329403    ld      ($0394),a
4ea5 32aa03    ld      ($03aa),a
4ea8 3a8b02    ld      a,($028b)
4eab e604      and     $04
4ead caee4e    jp      z,$4eee
4eb0 3e01      ld      a,$01
4eb2 329403    ld      ($0394),a
4eb5 cd5101    call    $0151
4eb8 1f        rra     
4eb9 d2ee4e    jp      nc,$4eee
4ebc 3e01      ld      a,$01
4ebe 32aa03    ld      ($03aa),a
4ec1 3aca03    ld      a,($03ca)
4ec4 b7        or      a
4ec5 cad54e    jp      z,$4ed5
4ec8 3d        dec     a
4ec9 e5        push    hl
4eca f5        push    af
4ecb 03        inc     bc
4ecc 1b        dec     de
4ecd cdab4f    call    $4fab
4ed0 f1        pop     af
4ed1 e1        pop     hl
4ed2 c3c44e    jp      $4ec4
4ed5 2a8602    ld      hl,($0286)
4ed8 228902    ld      ($0289),hl
4edb 3aff03    ld      a,($03ff)
4ede 3d        dec     a
4edf f2e64e    jp      p,$4ee6
4ee2 13        inc     de
4ee3 c3ee4e    jp      $4eee
4ee6 caee4e    jp      z,$4eee
4ee9 1b        dec     de
4eea 3d        dec     a
4eeb c3e64e    jp      $4ee6
4eee 7a        ld      a,d
4eef b7        or      a
4ef0 fa624f    jp      m,$4f62
4ef3 b3        or      e
4ef4 ca624f    jp      z,$4f62
4ef7 3a9403    ld      a,($0394)
4efa b7        or      a
4efb ca354f    jp      z,$4f35
4efe 7a        ld      a,d
4eff b7        or      a
4f00 c2354f    jp      nz,$4f35
4f03 7b        ld      a,e
4f04 fe01      cp      $01
4f06 c2354f    jp      nz,$4f35
4f09 3aaa03    ld      a,($03aa)
4f0c b7        or      a
4f0d ca354f    jp      z,$4f35
4f10 cd5401    call    $0154
4f13 1b        dec     de
4f14 3aff03    ld      a,($03ff)
4f17 b7        or      a
4f18 ca254f    jp      z,$4f25
4f1b 03        inc     bc
4f1c f5        push    af
4f1d cdab4f    call    $4fab
4f20 f1        pop     af
4f21 3d        dec     a
4f22 c3184f    jp      $4f18
4f25 2a8602    ld      hl,($0286)
4f28 228902    ld      ($0289),hl
4f2b af        xor     a
4f2c 329403    ld      ($0394),a
4f2f 32aa03    ld      ($03aa),a
4f32 c3624f    jp      $4f62
4f35 cd0f53    call    $530f
4f38 0a        ld      a,(bc)
4f39 03        inc     bc
4f3a 1b        dec     de
4f3b f5        push    af
4f3c 3a8b02    ld      a,($028b)
4f3f feec      cp      $ec
4f41 da4e4f    jp      c,$4f4e
4f44 f1        pop     af
4f45 c5        push    bc
4f46 4f        ld      c,a
4f47 cd3c01    call    $013c
4f4a c1        pop     bc
4f4b c34f4f    jp      $4f4f
4f4e f1        pop     af
4f4f cd0153    call    $5301
4f52 cdab4f    call    $4fab
4f55 d2ee4e    jp      nc,$4eee
4f58 3e00      ld      a,$00
4f5a bc        cp      h
4f5b c0        ret     nz

4f5c cd0f53    call    $530f
4f5f c3ee4e    jp      $4eee
4f62 3a9403    ld      a,($0394)
4f65 b7        or      a
4f66 ca704f    jp      z,$4f70
4f69 cd5401    call    $0154
4f6c af        xor     a
4f6d 329403    ld      ($0394),a
4f70 cdc34f    call    $4fc3
4f73 cdab4f    call    $4fab
4f76 d27d4f    jp      nc,$4f7d
4f79 3e00      ld      a,$00
4f7b bc        cp      h
4f7c c0        ret     nz

4f7d c5        push    bc
4f7e e1        pop     hl
4f7f 225a02    ld      ($025a),hl
4f82 af        xor     a
4f83 c9        ret     

4f84 2a5c02    ld      hl,($025c)
4f87 7e        ld      a,(hl)
4f88 e69f      and     $9f
4f8a 5f        ld      e,a
4f8b 1600      ld      d,$00
4f8d fe80      cp      $80
4f8f da974f    jp      c,$4f97
4f92 e61f      and     $1f
4f94 57        ld      d,a
4f95 23        inc     hl
4f96 5e        ld      e,(hl)
4f97 23        inc     hl
4f98 3a8b02    ld      a,($028b)
4f9b e602      and     $02
4f9d c2a24f    jp      nz,$4fa2
4fa0 23        inc     hl
4fa1 23        inc     hl
4fa2 225c02    ld      ($025c),hl
4fa5 13        inc     de
4fa6 eb        ex      de,hl
4fa7 225102    ld      ($0251),hl
4faa c9        ret     

4fab 2a8602    ld      hl,($0286)
4fae 24        inc     h
4faf 3a9001    ld      a,($0190)
4fb2 bc        cp      h
4fb3 d2bf4f    jp      nc,$4fbf
4fb6 2c        inc     l
4fb7 3a9101    ld      a,($0191)
4fba bd        cp      l
4fbb d8        ret     c

4fbc 2600      ld      h,$00
4fbe 3f        ccf     
4fbf 228602    ld      ($0286),hl
4fc2 c9        ret     

4fc3 2a8602    ld      hl,($0286)
4fc6 3e00      ld      a,$00
4fc8 bc        cp      h
4fc9 c2d44f    jp      nz,$4fd4
4fcc 3a9001    ld      a,($0190)
4fcf 67        ld      h,a
4fd0 2d        dec     l
4fd1 c3d54f    jp      $4fd5
4fd4 25        dec     h
4fd5 228602    ld      ($0286),hl
4fd8 c9        ret     

4fd9 f5        push    af
4fda 3a9401    ld      a,($0194)
4fdd b7        or      a
4fde ca0850    jp      z,$5008
4fe1 3a8802    ld      a,($0288)
4fe4 3d        dec     a
4fe5 ca0850    jp      z,$5008
4fe8 f1        pop     af
4fe9 c5        push    bc
4fea 4f        ld      c,a
4feb cd4b01    call    $014b
4fee c1        pop     bc
4fef c0        ret     nz

4ff0 f5        push    af
4ff1 3a9401    ld      a,($0194)
4ff4 fe02      cp      $02
4ff6 ca0150    jp      z,$5001
4ff9 3e01      ld      a,$01
4ffb 328802    ld      ($0288),a
4ffe f1        pop     af
4fff af        xor     a
5000 c9        ret     

5001 f1        pop     af
5002 f5        push    af
5003 e680      and     $80
5005 caf94f    jp      z,$4ff9
5008 af        xor     a
5009 328802    ld      ($0288),a
500c f1        pop     af
500d 214650    ld      hl,$5046
5010 e5        push    hl
5011 6f        ld      l,a
5012 3a9601    ld      a,($0196)
5015 bd        cp      l
5016 ca6650    jp      z,$5066
5019 3a9701    ld      a,($0197)
501c bd        cp      l
501d ca9450    jp      z,$5094
5020 3a9801    ld      a,($0198)
5023 bd        cp      l
5024 ca7750    jp      z,$5077
5027 3a9901    ld      a,($0199)
502a bd        cp      l
502b cabc50    jp      z,$50bc
502e 3a9a01    ld      a,($019a)
5031 bd        cp      l
5032 ca5751    jp      z,$5157
5035 3a9b01    ld      a,($019b)
5038 bd        cp      l
5039 ca4850    jp      z,$5048
503c 3a9c01    ld      a,($019c)
503f bd        cp      l
5040 cac052    jp      z,$52c0
5043 7d        ld      a,l
5044 e1        pop     hl
5045 c9        ret     

5046 af        xor     a
5047 c9        ret     

5048 cdaf53    call    $53af
504b 2a6102    ld      hl,($0261)
504e 228602    ld      ($0286),hl
5051 2a6a02    ld      hl,($026a)
5054 7e        ld      a,(hl)
5055 328b02    ld      ($028b),a
5058 225c02    ld      ($025c),hl
505b 2a6802    ld      hl,($0268)
505e 225a02    ld      ($025a),hl
5061 2a9102    ld      hl,($0291)
5064 f9        ld      sp,hl
5065 c9        ret     

5066 3a4a06    ld      a,($064a)
5069 b7        or      a
506a c48f53    call    nz,$538f
506d 3e80      ld      a,$80
506f 324102    ld      ($0241),a
5072 2a9102    ld      hl,($0291)
5075 f9        ld      sp,hl
5076 c9        ret     

5077 1b        dec     de
5078 7a        ld      a,d
5079 b3        or      e
507a ca8850    jp      z,$5088
507d cdab4f    call    $4fab
5080 d29050    jp      nc,$5090
5083 af        xor     a
5084 bc        cp      h
5085 ca9050    jp      z,$5090
5088 1e01      ld      e,$01
508a cd5751    call    $5157
508d c34201    jp      $0142
5090 03        inc     bc
5091 c30f53    jp      $530f
5094 cdaf53    call    $53af
5097 2a5102    ld      hl,($0251)
509a 7b        ld      a,e
509b bd        cp      l
509c c2b350    jp      nz,$50b3
509f 7a        ld      a,d
50a0 bc        cp      h
50a1 c2b350    jp      nz,$50b3
50a4 3e02      ld      a,$02
50a6 324202    ld      ($0242),a
50a9 cdbc50    call    $50bc
50ac af        xor     a
50ad 324202    ld      ($0242),a
50b0 c34201    jp      $0142
50b3 cdc34f    call    $4fc3
50b6 cd0f53    call    $530f
50b9 0b        dec     bc
50ba 13        inc     de
50bb c9        ret     

50bc cdaf53    call    $53af
50bf c5        push    bc
50c0 d5        push    de
50c1 2a5102    ld      hl,($0251)
50c4 7d        ld      a,l
50c5 93        sub     e
50c6 6f        ld      l,a
50c7 7c        ld      a,h
50c8 9a        sbc     a,d
50c9 67        ld      h,a
50ca eb        ex      de,hl
50cb 2a9302    ld      hl,($0293)
50ce eb        ex      de,hl
50cf 7d        ld      a,l
50d0 b4        or      h
50d1 c20c51    jp      nz,$510c
50d4 e5        push    hl
50d5 2a3f02    ld      hl,($023f)
50d8 7a        ld      a,d
50d9 bc        cp      h
50da daf450    jp      c,$50f4
50dd c2fb50    jp      nz,$50fb
50e0 7b        ld      a,e
50e1 bd        cp      l
50e2 daf450    jp      c,$50f4
50e5 c2fb50    jp      nz,$50fb
50e8 1b        dec     de
50e9 1b        dec     de
50ea 1b        dec     de
50eb 1b        dec     de
50ec 1b        dec     de
50ed 1a        ld      a,(de)
50ee 13        inc     de
50ef 13        inc     de
50f0 0f        rrca    
50f1 d2fc50    jp      nc,$50fc
50f4 e1        pop     hl
50f5 cd4201    call    $0142
50f8 d1        pop     de
50f9 c1        pop     bc
50fa c9        ret     

50fb 1b        dec     de
50fc e1        pop     hl
50fd 1a        ld      a,(de)
50fe 4f        ld      c,a
50ff 1b        dec     de
5100 1a        ld      a,(de)
5101 e61f      and     $1f
5103 47        ld      b,a
5104 03        inc     bc
5105 09        add     hl,bc
5106 1b        dec     de
5107 1a        ld      a,(de)
5108 0f        rrca    
5109 dad450    jp      c,$50d4
510c eb        ex      de,hl
510d 225c02    ld      ($025c),hl
5110 e1        pop     hl
5111 e1        pop     hl
5112 7d        ld      a,l
5113 93        sub     e
5114 6f        ld      l,a
5115 7c        ld      a,h
5116 9a        sbc     a,d
5117 67        ld      h,a
5118 225a02    ld      ($025a),hl
511b 2a8602    ld      hl,($0286)
511e 3e00      ld      a,$00
5120 ba        cp      d
5121 c22d51    jp      nz,$512d
5124 7c        ld      a,h
5125 bb        cp      e
5126 da2d51    jp      c,$512d
5129 93        sub     e
512a c34e51    jp      $514e
512d 7b        ld      a,e
512e 94        sub     h
512f 5f        ld      e,a
5130 7a        ld      a,d
5131 de00      sbc     a,$00
5133 57        ld      d,a
5134 e5        push    hl
5135 219001    ld      hl,$0190
5138 4e        ld      c,(hl)
5139 0600      ld      b,$00
513b e1        pop     hl
513c eb        ex      de,hl
513d 09        add     hl,bc
513e eb        ex      de,hl
513f 03        inc     bc
5140 cd530b    call    $0b53
5143 45        ld      b,l
5144 2a8602    ld      hl,($0286)
5147 7d        ld      a,l
5148 93        sub     e
5149 6f        ld      l,a
514a 3a9001    ld      a,($0190)
514d 90        sub     b
514e 67        ld      h,a
514f 228602    ld      ($0286),hl
5152 2a9102    ld      hl,($0291)
5155 f9        ld      sp,hl
5156 c9        ret     

5157 d5        push    de
5158 c5        push    bc
5159 2a8602    ld      hl,($0286)
515c e5        push    hl
515d d5        push    de
515e 1b        dec     de
515f 62        ld      h,d
5160 6b        ld      l,e
5161 225306    ld      ($0653),hl
5164 7a        ld      a,d
5165 b3        or      e
5166 ca7051    jp      z,$5170
5169 cdab4f    call    $4fab
516c 1b        dec     de
516d c36451    jp      $5164
5170 2a8602    ld      hl,($0286)
5173 225106    ld      ($0651),hl
5176 d1        pop     de
5177 e1        pop     hl
5178 228602    ld      ($0286),hl
517b c3a451    jp      $51a4
517e 7b        ld      a,e
517f fe01      cp      $01
5181 c28a51    jp      nz,$518a
5184 7a        ld      a,d
5185 fe00      cp      $00
5187 caba51    jp      z,$51ba
518a 1b        dec     de
518b cd064d    call    $4d06
518e daba51    jp      c,$51ba
5191 cd4201    call    $0142
5194 cdb553    call    $53b5
5197 e1        pop     hl
5198 e1        pop     hl
5199 2a5a02    ld      hl,($025a)
519c e5        push    hl
519d c1        pop     bc
519e 110100    ld      de,$0001
51a1 c3c251    jp      $51c2
51a4 2a5c02    ld      hl,($025c)
51a7 44        ld      b,h
51a8 4d        ld      c,l
51a9 62        ld      h,d
51aa 6b        ld      l,e
51ab 0a        ld      a,(bc)
51ac e6f2      and     $f2
51ae fee2      cp      $e2
51b0 cac351    jp      z,$51c3
51b3 c1        pop     bc
51b4 d1        pop     de
51b5 d5        push    de
51b6 c5        push    bc
51b7 c37e51    jp      $517e
51ba cdb553    call    $53b5
51bd cd4201    call    $0142
51c0 c1        pop     bc
51c1 d1        pop     de
51c2 c9        ret     

51c3 0a        ld      a,(bc)
51c4 0f        rrca    
51c5 d2d651    jp      nc,$51d6
51c8 03        inc     bc
51c9 0a        ld      a,(bc)
51ca e61f      and     $1f
51cc 57        ld      d,a
51cd 03        inc     bc
51ce 0a        ld      a,(bc)
51cf 5f        ld      e,a
51d0 13        inc     de
51d1 19        add     hl,de
51d2 03        inc     bc
51d3 c3ab51    jp      $51ab
51d6 eb        ex      de,hl
51d7 e1        pop     hl
51d8 e5        push    hl
51d9 c5        push    bc
51da 44        ld      b,h
51db 4d        ld      c,l
51dc 3a4906    ld      a,($0649)
51df fe02      cp      $02
51e1 c22452    jp      nz,$5224
51e4 3a5506    ld      a,($0655)
51e7 b7        or      a
51e8 c22452    jp      nz,$5224
51eb c5        push    bc
51ec d5        push    de
51ed 2a8602    ld      hl,($0286)
51f0 cd3352    call    $5233
51f3 19        add     hl,de
51f4 eb        ex      de,hl
51f5 2a4b06    ld      hl,($064b)
51f8 cd3352    call    $5233
51fb 7b        ld      a,e
51fc 95        sub     l
51fd 4f        ld      c,a
51fe 7a        ld      a,d
51ff 9c        sbc     a,h
5200 47        ld      b,a
5201 eb        ex      de,hl
5202 2a5106    ld      hl,($0651)
5205 cd3352    call    $5233
5208 7b        ld      a,e
5209 95        sub     l
520a 5f        ld      e,a
520b 7a        ld      a,d
520c 9c        sbc     a,h
520d 57        ld      d,a
520e 79        ld      a,c
520f 93        sub     e
5210 78        ld      a,b
5211 9a        sbc     a,d
5212 d1        pop     de
5213 c1        pop     bc
5214 fa2452    jp      m,$5224
5217 2a9302    ld      hl,($0293)
521a e3        ex      (sp),hl
521b 2a5306    ld      hl,($0653)
521e eb        ex      de,hl
521f 3e01      ld      a,$01
5221 325606    ld      ($0656),a
5224 cd064d    call    $4d06
5227 e1        pop     hl
5228 daba51    jp      c,$51ba
522b 225c02    ld      ($025c),hl
522e 2a9102    ld      hl,($0291)
5231 f9        ld      sp,hl
5232 c9        ret     

5233 d5        push    de
5234 c5        push    bc
5235 3a9001    ld      a,($0190)
5238 3c        inc     a
5239 5f        ld      e,a
523a af        xor     a
523b 57        ld      d,a
523c 4d        ld      c,l
523d 47        ld      b,a
523e e5        push    hl
523f cd300b    call    $0b30
5242 e1        pop     hl
5243 af        xor     a
5244 6c        ld      l,h
5245 67        ld      h,a
5246 19        add     hl,de
5247 c1        pop     bc
5248 d1        pop     de
5249 c9        ret     

524a d5        push    de
524b cdab4f    call    $4fab
524e d25a52    jp      nc,$525a
5251 af        xor     a
5252 bc        cp      h
5253 ca5a52    jp      z,$525a
5256 d1        pop     de
5257 c36452    jp      $5264
525a 1b        dec     de
525b 7a        ld      a,d
525c b3        or      e
525d c24b52    jp      nz,$524b
5260 d1        pop     de
5261 cdc34f    call    $4fc3
5264 2a8602    ld      hl,($0286)
5267 e5        push    hl
5268 cd0f53    call    $530f
526b 0b        dec     bc
526c 60        ld      h,b
526d 69        ld      l,c
526e 19        add     hl,de
526f e5        push    hl
5270 d5        push    de
5271 3a5102    ld      a,($0251)
5274 93        sub     e
5275 5f        ld      e,a
5276 3a5202    ld      a,($0252)
5279 9a        sbc     a,d
527a 57        ld      d,a
527b 7a        ld      a,d
527c b3        or      e
527d ca9352    jp      z,$5293
5280 0a        ld      a,(bc)
5281 77        ld      (hl),a
5282 cd0153    call    $5301
5285 2b        dec     hl
5286 0b        dec     bc
5287 1b        dec     de
5288 e5        push    hl
5289 cdc34f    call    $4fc3
528c cd0f53    call    $530f
528f e1        pop     hl
5290 c37b52    jp      $527b
5293 d1        pop     de
5294 3e30      ld      a,$30
5296 77        ld      (hl),a
5297 cd0153    call    $5301
529a 2b        dec     hl
529b e5        push    hl
529c 2a8602    ld      hl,($0286)
529f 7c        ld      a,h
52a0 b5        or      l
52a1 caaa52    jp      z,$52aa
52a4 cdc34f    call    $4fc3
52a7 cd0f53    call    $530f
52aa e1        pop     hl
52ab 1b        dec     de
52ac 7a        ld      a,d
52ad b3        or      e
52ae c29452    jp      nz,$5294
52b1 c1        pop     bc
52b2 e1        pop     hl
52b3 228602    ld      ($0286),hl
52b6 cd0f53    call    $530f
52b9 110100    ld      de,$0001
52bc 0a        ld      a,(bc)
52bd fe00      cp      $00
52bf c9        ret     

52c0 e5        push    hl
52c1 d5        push    de
52c2 c5        push    bc
52c3 215506    ld      hl,$0655
52c6 3601      ld      (hl),$01
52c8 2acd01    ld      hl,($01cd)
52cb 7c        ld      a,h
52cc b5        or      l
52cd cafd52    jp      z,$52fd
52d0 7e        ld      a,(hl)
52d1 b7        or      a
52d2 cafd52    jp      z,$52fd
52d5 47        ld      b,a
52d6 3a8702    ld      a,($0287)
52d9 3c        inc     a
52da 23        inc     hl
52db be        cp      (hl)
52dc cae252    jp      z,$52e2
52df dae952    jp      c,$52e9
52e2 05        dec     b
52e3 c2da52    jp      nz,$52da
52e6 219001    ld      hl,$0190
52e9 7e        ld      a,(hl)
52ea 3d        dec     a
52eb 2a8602    ld      hl,($0286)
52ee 224e06    ld      ($064e),hl
52f1 67        ld      h,a
52f2 224b06    ld      ($064b),hl
52f5 3e02      ld      a,$02
52f7 324906    ld      ($0649),a
52fa 324d06    ld      ($064d),a
52fd c1        pop     bc
52fe d1        pop     de
52ff e1        pop     hl
5300 c9        ret     

5301 c5        push    bc
5302 4f        ld      c,a
5303 cd4e01    call    $014e
5306 cc4b53    call    z,$534b
5309 4f        ld      c,a
530a cd3301    call    $0133
530d c1        pop     bc
530e c9        ret     

530f 3a4906    ld      a,($0649)
5312 b7        or      a
5313 c0        ret     nz

5314 e5        push    hl
5315 2a8902    ld      hl,($0289)
5318 eb        ex      de,hl
5319 e5        push    hl
531a 2a8602    ld      hl,($0286)
531d 7d        ld      a,l
531e b4        or      h
531f c22853    jp      nz,$5328
5322 cd7153    call    $5371
5325 c34253    jp      $5342
5328 7b        ld      a,e
5329 bd        cp      l
532a c23253    jp      nz,$5332
532d 7a        ld      a,d
532e bc        cp      h
532f ca4253    jp      z,$5342
5332 c5        push    bc
5333 e5        push    hl
5334 2a8902    ld      hl,($0289)
5337 44        ld      b,h
5338 4d        ld      c,l
5339 2a8602    ld      hl,($0286)
533c eb        ex      de,hl
533d e1        pop     hl
533e cd3601    call    $0136
5341 c1        pop     bc
5342 2a8602    ld      hl,($0286)
5345 228902    ld      ($0289),hl
5348 d1        pop     de
5349 e1        pop     hl
534a c9        ret     

534b f5        push    af
534c e5        push    hl
534d 2a8902    ld      hl,($0289)
5350 24        inc     h
5351 3a9001    ld      a,($0190)
5354 bc        cp      h
5355 d26253    jp      nc,$5362
5358 3a9101    ld      a,($0191)
535b bd        cp      l
535c d26253    jp      nc,$5362
535f 210000    ld      hl,$0000
5362 228902    ld      ($0289),hl
5365 e1        pop     hl
5366 f1        pop     af
5367 c9        ret     

5368 e5        push    hl
5369 21ffff    ld      hl,$ffff
536c 228902    ld      ($0289),hl
536f e1        pop     hl
5370 c9        ret     

5371 3a4102    ld      a,($0241)
5374 07        rlca    
5375 d8        ret     c

5376 cd3901    call    $0139
5379 e5        push    hl
537a 21ffff    ld      hl,$ffff
537d 228902    ld      ($0289),hl
5380 e1        pop     hl
5381 c9        ret     

5382 2a8602    ld      hl,($0286)
5385 3a4b06    ld      a,($064b)
5388 bd        cp      l
5389 c0        ret     nz

538a 3a4c06    ld      a,($064c)
538d bc        cp      h
538e c9        ret     

538f d5        push    de
5390 c5        push    bc
5391 2a8602    ld      hl,($0286)
5394 24        inc     h
5395 2c        inc     l
5396 e5        push    hl
5397 5d        ld      e,l
5398 3e02      ld      a,$02
539a 2a3902    ld      hl,($0239)
539d cdd10b    call    $0bd1
53a0 d1        pop     de
53a1 23        inc     hl
53a2 af        xor     a
53a3 324906    ld      ($0649),a
53a6 5a        ld      e,d
53a7 3e02      ld      a,$02
53a9 cdd10b    call    $0bd1
53ac c1        pop     bc
53ad d1        pop     de
53ae c9        ret     

53af 3e00      ld      a,$00
53b1 325006    ld      ($0650),a
53b4 c9        ret     

53b5 3e01      ld      a,$01
53b7 325006    ld      ($0650),a
53ba c9        ret     

53bb f5        push    af
53bc 3a9d02    ld      a,($029d)
53bf b7        or      a
53c0 cae453    jp      z,$53e4
53c3 e5        push    hl
53c4 d5        push    de
53c5 cdd655    call    $55d6
53c8 cad953    jp      z,$53d9
53cb 2a4c02    ld      hl,($024c)
53ce eb        ex      de,hl
53cf 2a4e02    ld      hl,($024e)
53d2 19        add     hl,de
53d3 71        ld      (hl),c
53d4 13        inc     de
53d5 eb        ex      de,hl
53d6 224c02    ld      ($024c),hl
53d9 d1        pop     de
53da e1        pop     hl
53db 3a4b02    ld      a,($024b)
53de b7        or      a
53df c2ee53    jp      nz,$53ee
53e2 f1        pop     af
53e3 f5        push    af
53e4 3a9e01    ld      a,($019e)
53e7 b7        or      a
53e8 c2f053    jp      nz,$53f0
53eb cd1a1c    call    $1c1a
53ee f1        pop     af
53ef c9        ret     

53f0 c5        push    bc
53f1 e5        push    hl
53f2 3aa501    ld      a,($01a5)
53f5 47        ld      b,a
53f6 79        ld      a,c
53f7 32ee03    ld      ($03ee),a
53fa 0edb      ld      c,$db
53fc cd5154    call    $5451
53ff 21a601    ld      hl,$01a6
5402 a6        and     (hl)
5403 c20c54    jp      nz,$540c
5406 cdeb03    call    $03eb
5409 c30254    jp      $5402
540c 3aa301    ld      a,($01a3)
540f 47        ld      b,a
5410 0ed3      ld      c,$d3
5412 3aee03    ld      a,($03ee)
5415 21a401    ld      hl,$01a4
5418 ae        xor     (hl)
5419 cd5154    call    $5451
541c e1        pop     hl
541d c1        pop     bc
541e f1        pop     af
541f c9        ret     

5420 3a9e01    ld      a,($019e)
5423 b7        or      a
5424 ca521c    jp      z,$1c52
5427 e5        push    hl
5428 c5        push    bc
5429 3aa101    ld      a,($01a1)
542c 47        ld      b,a
542d 0edb      ld      c,$db
542f cd5154    call    $5451
5432 21a201    ld      hl,$01a2
5435 a6        and     (hl)
5436 c23f54    jp      nz,$543f
5439 cdeb03    call    $03eb
543c c33554    jp      $5435
543f 3a9f01    ld      a,($019f)
5442 47        ld      b,a
5443 0edb      ld      c,$db
5445 cd5154    call    $5451
5448 e67f      and     $7f
544a 21a001    ld      hl,$01a0
544d ae        xor     (hl)
544e c1        pop     bc
544f e1        pop     hl
5450 c9        ret     

5451 21eb03    ld      hl,$03eb
5454 71        ld      (hl),c
5455 23        inc     hl
5456 70        ld      (hl),b
5457 23        inc     hl
5458 36c9      ld      (hl),$c9
545a c3eb03    jp      $03eb
545d cda656    call    $56a6
5460 3a9d02    ld      a,($029d)
5463 b7        or      a
5464 ca8454    jp      z,$5484
5467 c5        push    bc
5468 d5        push    de
5469 af        xor     a
546a 47        ld      b,a
546b 67        ld      h,a
546c 3a9001    ld      a,($0190)
546f 3c        inc     a
5470 4f        ld      c,a
5471 6a        ld      l,d
5472 1d        dec     e
5473 fa7a54    jp      m,$547a
5476 09        add     hl,bc
5477 c37254    jp      $5472
547a 224c02    ld      ($024c),hl
547d d1        pop     de
547e c1        pop     bc
547f 3a4b02    ld      a,($024b)
5482 b7        or      a
5483 c0        ret     nz

5484 3a8f01    ld      a,($018f)
5487 b7        or      a
5488 caa354    jp      z,$54a3
548b 3aac01    ld      a,($01ac)
548e 82        add     a,d
548f 57        ld      d,a
5490 3aad01    ld      a,($01ad)
5493 83        add     a,e
5494 5f        ld      e,a
5495 d5        push    de
5496 11a701    ld      de,$01a7
5499 21ae01    ld      hl,$01ae
549c 0605      ld      b,$05
549e cd1d56    call    $561d
54a1 d1        pop     de
54a2 c9        ret     

54a3 79        ld      a,c
54a4 3c        inc     a
54a5 c2ad54    jp      nz,$54ad
54a8 cd0255    call    $5502
54ab 47        ld      b,a
54ac 4f        ld      c,a
54ad c5        push    bc
54ae 7a        ld      a,d
54af 90        sub     b
54b0 67        ld      h,a
54b1 cad054    jp      z,$54d0
54b4 dac554    jp      c,$54c5
54b7 3aa901    ld      a,($01a9)
54ba 47        ld      b,a
54bb cdf054    call    $54f0
54be 25        dec     h
54bf c2b754    jp      nz,$54b7
54c2 c3d054    jp      $54d0
54c5 3aaa01    ld      a,($01aa)
54c8 47        ld      b,a
54c9 cdf054    call    $54f0
54cc 24        inc     h
54cd c2c554    jp      nz,$54c5
54d0 7b        ld      a,e
54d1 c1        pop     bc
54d2 91        sub     c
54d3 6f        ld      l,a
54d4 c8        ret     z

54d5 dae454    jp      c,$54e4
54d8 3aa801    ld      a,($01a8)
54db 47        ld      b,a
54dc cdf054    call    $54f0
54df 2d        dec     l
54e0 c2d854    jp      nz,$54d8
54e3 c9        ret     

54e4 3aa701    ld      a,($01a7)
54e7 47        ld      b,a
54e8 cdf054    call    $54f0
54eb 2c        inc     l
54ec c2e454    jp      nz,$54e4
54ef c9        ret     

54f0 3a9501    ld      a,($0195)
54f3 b7        or      a
54f4 cafe54    jp      z,$54fe
54f7 3a9d01    ld      a,($019d)
54fa 4f        ld      c,a
54fb cde353    call    $53e3
54fe 48        ld      c,b
54ff c3e353    jp      $53e3
5502 cda656    call    $56a6
5505 c31d55    jp      $551d
5508 cda656    call    $56a6
550b 3a9d02    ld      a,($029d)
550e b7        or      a
550f ca1d55    jp      z,$551d
5512 210000    ld      hl,$0000
5515 224c02    ld      ($024c),hl
5518 3a4b02    ld      a,($024b)
551b b7        or      a
551c c0        ret     nz

551d 11c401    ld      de,$01c4
5520 21c501    ld      hl,$01c5
5523 cd1b56    call    $561b
5526 c9        ret     

5527 3ab701    ld      a,($01b7)
552a b1        or      c
552b c9        ret     

552c e5        push    hl
552d 2ab801    ld      hl,($01b8)
5530 7c        ld      a,h
5531 b5        or      l
5532 e1        pop     hl
5533 3a9301    ld      a,($0193)
5536 c8        ret     z

5537 cda656    call    $56a6
553a 11b801    ld      de,$01b8
553d 1a        ld      a,(de)
553e 32ca03    ld      ($03ca),a
5541 13        inc     de
5542 1a        ld      a,(de)
5543 32ff03    ld      ($03ff),a
5546 1b        dec     de
5547 21ba01    ld      hl,$01ba
554a cd1b56    call    $561b
554d c9        ret     

554e e5        push    hl
554f 2ab801    ld      hl,($01b8)
5552 7c        ld      a,h
5553 b5        or      l
5554 e1        pop     hl
5555 c8        ret     z

5556 cda656    call    $56a6
5559 21b801    ld      hl,$01b8
555c 5e        ld      e,(hl)
555d af        xor     a
555e 57        ld      d,a
555f 21ba01    ld      hl,$01ba
5562 19        add     hl,de
5563 11b901    ld      de,$01b9
5566 cd1b56    call    $561b
5569 c9        ret     

556a cda656    call    $56a6
556d 3a9d02    ld      a,($029d)
5570 b7        or      a
5571 ca8c55    jp      z,$558c
5574 3a9101    ld      a,($0191)
5577 47        ld      b,a
5578 2a4e02    ld      hl,($024e)
557b 3a9001    ld      a,($0190)
557e 4f        ld      c,a
557f 0c        inc     c
5580 cdc70b    call    $0bc7
5583 05        dec     b
5584 f27b55    jp      p,$557b
5587 3a4b02    ld      a,($024b)
558a b7        or      a
558b c0        ret     nz

558c cd3901    call    $0139
558f 3ac001    ld      a,($01c0)
5592 b7        or      a
5593 caa955    jp      z,$55a9
5596 11c001    ld      de,$01c0
5599 21c101    ld      hl,$01c1
559c cd1b56    call    $561b
559f 01ff0f    ld      bc,$0fff
55a2 0b        dec     bc
55a3 79        ld      a,c
55a4 b0        or      b
55a5 c2a255    jp      nz,$55a2
55a8 c9        ret     

55a9 3a9001    ld      a,($0190)
55ac 3c        inc     a
55ad 57        ld      d,a
55ae 3a9101    ld      a,($0191)
55b1 3c        inc     a
55b2 5f        ld      e,a
55b3 0e20      ld      c,$20
55b5 cde353    call    $53e3
55b8 15        dec     d
55b9 c2b555    jp      nz,$55b5
55bc 3a9001    ld      a,($0190)
55bf 3c        inc     a
55c0 57        ld      d,a
55c1 1d        dec     e
55c2 c2b555    jp      nz,$55b5
55c5 c9        ret     

55c6 c5        push    bc
55c7 f5        push    af
55c8 3ac801    ld      a,($01c8)
55cb b7        or      a
55cc cad355    jp      z,$55d3
55cf 4f        ld      c,a
55d0 cde353    call    $53e3
55d3 f1        pop     af
55d4 c1        pop     bc
55d5 c9        ret     

55d6 79        ld      a,c
55d7 feff      cp      $ff
55d9 c8        ret     z

55da fe20      cp      $20
55dc dae255    jp      c,$55e2
55df fe7f      cp      $7f
55e1 c9        ret     

55e2 bf        cp      a
55e3 c9        ret     

55e4 3a9d01    ld      a,($019d)
55e7 b9        cp      c
55e8 79        ld      a,c
55e9 c8        ret     z

55ea 3a9401    ld      a,($0194)
55ed fe02      cp      $02
55ef 79        ld      a,c
55f0 c0        ret     nz

55f1 f680      or      $80
55f3 e5        push    hl
55f4 219601    ld      hl,$0196
55f7 0607      ld      b,$07
55f9 be        cp      (hl)
55fa ca0356    jp      z,$5603
55fd 23        inc     hl
55fe 05        dec     b
55ff c2f955    jp      nz,$55f9
5602 79        ld      a,c
5603 be        cp      (hl)
5604 e1        pop     hl
5605 c9        ret     

5606 cda656    call    $56a6
5609 3a9d02    ld      a,($029d)
560c b7        or      a
560d c0        ret     nz

560e 11c901    ld      de,$01c9
5611 21ca01    ld      hl,$01ca
5614 cd1b56    call    $561b
5617 c9        ret     

5618 79        ld      a,c
5619 bf        cp      a
561a c9        ret     

561b 0601      ld      b,$01
561d e3        ex      (sp),hl
561e 225706    ld      ($0657),hl
5621 e1        pop     hl
5622 1a        ld      a,(de)
5623 13        inc     de
5624 b7        or      a
5625 ca4556    jp      z,$5645
5628 fe07      cp      $07
562a da3c56    jp      c,$563c
562d e3        ex      (sp),hl
562e fe58      cp      $58
5630 4c        ld      c,h
5631 ca3556    jp      z,$5635
5634 4d        ld      c,l
5635 e3        ex      (sp),hl
5636 cde353    call    $53e3
5639 c34556    jp      $5645
563c 4e        ld      c,(hl)
563d 23        inc     hl
563e cde353    call    $53e3
5641 3d        dec     a
5642 c23c56    jp      nz,$563c
5645 05        dec     b
5646 c22256    jp      nz,$5622
5649 2a5706    ld      hl,($0657)
564c e9        jp      (hl)
564d cda656    call    $56a6
5650 cd8c55    call    $558c
5653 af        xor     a
5654 324b02    ld      ($024b),a
5657 5f        ld      e,a
5658 2a4e02    ld      hl,($024e)
565b 3a9101    ld      a,($0191)
565e bb        cp      e
565f d27356    jp      nc,$5673
5662 0eff      ld      c,$ff
5664 2a8902    ld      hl,($0289)
5667 23        inc     hl
5668 7c        ld      a,h
5669 b5        or      l
566a ca6e56    jp      z,$566e
566d 2b        dec     hl
566e eb        ex      de,hl
566f cd5d54    call    $545d
5672 c9        ret     

5673 3a9001    ld      a,($0190)
5676 3c        inc     a
5677 4f        ld      c,a
5678 0600      ld      b,$00
567a e5        push    hl
567b 09        add     hl,bc
567c e5        push    hl
567d 3e20      ld      a,$20
567f 2b        dec     hl
5680 be        cp      (hl)
5681 c28e56    jp      nz,$568e
5684 0d        dec     c
5685 c27f56    jp      nz,$567f
5688 e1        pop     hl
5689 c1        pop     bc
568a 1c        inc     e
568b c35b56    jp      $565b
568e 79        ld      a,c
568f 50        ld      d,b
5690 01ffff    ld      bc,$ffff
5693 cd5d54    call    $545d
5696 e1        pop     hl
5697 e3        ex      (sp),hl
5698 4e        ld      c,(hl)
5699 23        inc     hl
569a cde353    call    $53e3
569d 3d        dec     a
569e c29856    jp      nz,$5698
56a1 1c        inc     e
56a2 e1        pop     hl
56a3 c35b56    jp      $565b
56a6 225706    ld      ($0657),hl
56a9 e3        ex      (sp),hl
56aa f5        push    af
56ab c5        push    bc
56ac d5        push    de
56ad e5        push    hl
56ae 21b756    ld      hl,$56b7
56b1 e3        ex      (sp),hl
56b2 e5        push    hl
56b3 2a5706    ld      hl,($0657)
56b6 c9        ret     

56b7 d1        pop     de
56b8 c1        pop     bc
56b9 f1        pop     af
56ba e1        pop     hl
56bb c9        ret     

56bc 00        nop     
56bd 00        nop     
56be 00        nop     
56bf 00        nop     
56c0 00        nop     
56c1 00        nop     
56c2 00        nop     
56c3 00        nop     
56c4 00        nop     
56c5 fe00      cp      $00
56c7 02        ld      (bc),a
56c8 00        nop     
56c9 00        nop     
56ca 00        nop     
56cb 00        nop     
56cc 00        nop     
56cd 00        nop     
56ce 00        nop     
56cf 00        nop     
56d0 00        nop     
56d1 00        nop     
56d2 0d        dec     c
56d3 0a        ld      a,(bc)
56d4 00        nop     
56d5 00        nop     
56d6 00        nop     
56d7 00        nop     
56d8 00        nop     
56d9 2020      jr      nz,$56fb
56db 2020      jr      nz,$56fd
56dd 2020      jr      nz,$56ff
56df 2020      jr      nz,$5701
56e1 2020      jr      nz,$5703
56e3 2020      jr      nz,$5705
56e5 2020      jr      nz,$5707
56e7 2020      jr      nz,$5709
56e9 2020      jr      nz,$570b
56eb 2020      jr      nz,$570d
56ed 2030      jr      nz,$571f
56ef 314135    ld      sp,$3541
56f2 48        ld      c,b
56f3 2050      jr      nz,$5745
56f5 55        ld      d,l
56f6 42        ld      b,d
56f7 2020      jr      nz,$5719
56f9 4f        ld      c,a
56fa 54        ld      d,h
56fb 53        ld      d,e
56fc 54        ld      d,h
56fd 50        ld      d,b
56fe 54        ld      d,h
56ff 2020      jr      nz,$5721
5701 2020      jr      nz,$5723
5703 2020      jr      nz,$5725
5705 2020      jr      nz,$5727
5707 2020      jr      nz,$5729
5709 2020      jr      nz,$572b
570b 2020      jr      nz,$572d
570d 2020      jr      nz,$572f
570f 2020      jr      nz,$5731
5711 2020      jr      nz,$5733
5713 2020      jr      nz,$5735
5715 2020      jr      nz,$5737
5717 2020      jr      nz,$5739
5719 3031      jr      nc,$574c
571b 34        inc     (hl)
571c 45        ld      b,l
571d 48        ld      c,b
571e 2050      jr      nz,$5770
5720 55        ld      d,l
5721 42        ld      b,d
5722 2020      jr      nz,$5744
5724 50        ld      d,b
5725 43        ld      b,e
5726 48        ld      c,b
5727 41        ld      b,c
5728 49        ld      c,c
5729 0d        dec     c
572a 0a        ld      a,(bc)
572b 3031      jr      nc,$575e
572d 43        ld      b,e
572e 46        ld      b,(hl)
572f 48        ld      c,b
5730 2050      jr      nz,$5782
5732 55        ld      d,l
5733 42        ld      b,d
5734 2020      jr      nz,$5756
5736 50        ld      d,b
5737 52        ld      d,d
5738 45        ld      b,l
5739 41        ld      b,c
573a 44        ld      b,h
573b 52        ld      d,d
573c 2020      jr      nz,$575e
573e 2020      jr      nz,$5760
5740 2020      jr      nz,$5762
5742 2020      jr      nz,$5764
5744 2020      jr      nz,$5766
5746 2020      jr      nz,$5768
5748 2020      jr      nz,$576a
574a 2020      jr      nz,$576c
574c 2020      jr      nz,$576e
574e 2020      jr      nz,$5770
5750 2020      jr      nz,$5772
5752 2020      jr      nz,$5774
5754 2020      jr      nz,$5776
5756 3031      jr      nc,$5789
5758 33        inc     sp
5759 33        inc     sp
575a 48        ld      c,b
575b 2050      jr      nz,$57ad
575d 55        ld      d,l
575e 42        ld      b,d
575f 2020      jr      nz,$5781
5761 50        ld      d,b
5762 55        ld      d,l
5763 54        ld      d,h
5764 43        ld      b,e
5765 48        ld      c,b
5766 49        ld      c,c
5767 2020      jr      nz,$5789
5769 2020      jr      nz,$578b
576b 2020      jr      nz,$578d
576d 2020      jr      nz,$578f
576f 2020      jr      nz,$5791
5771 2020      jr      nz,$5793
5773 2020      jr      nz,$5795
5775 2020      jr      nz,$5797
5777 2020      jr      nz,$5799
5779 2020      jr      nz,$579b
577b 2020      jr      nz,$579d
577d 2020      jr      nz,$579f
577f 2020      jr      nz,$57a1
5781 3031      jr      nc,$57b4
5783 46        ld      b,(hl)
5784 314820    ld      sp,$2048
5787 50        ld      d,b
5788 55        ld      d,l
5789 42        ld      b,d
578a 2020      jr      nz,$57ac
578c 52        ld      d,d
578d 45        ld      b,l
578e 43        ld      b,e
578f 4f        ld      c,a
5790 46        ld      b,(hl)
5791 46        ld      b,(hl)
5792 0d        dec     c
5793 0a        ld      a,(bc)
5794 3031      jr      nc,$57c7
5796 46        ld      b,(hl)
5797 3048      jr      nc,$57e1
5799 2050      jr      nz,$57eb
579b 55        ld      d,l
579c 42        ld      b,d
579d 2020      jr      nz,$57bf
579f 52        ld      d,d
57a0 45        ld      b,l
57a1 43        ld      b,e
57a2 4f        ld      c,a
57a3 4e        ld      c,(hl)
57a4 2020      jr      nz,$57c6
57a6 2020      jr      nz,$57c8
57a8 2020      jr      nz,$57ca
57aa 2020      jr      nz,$57cc
57ac 2020      jr      nz,$57ce
57ae 2020      jr      nz,$57d0
57b0 2020      jr      nz,$57d2
57b2 2020      jr      nz,$57d4
57b4 2020      jr      nz,$57d6
57b6 2020      jr      nz,$57d8
57b8 2020      jr      nz,$57da
57ba 2020      jr      nz,$57dc
57bc 2020      jr      nz,$57de
57be 2030      jr      nz,$57f0
57c0 313339    ld      sp,$3933
57c3 48        ld      c,b
57c4 2050      jr      nz,$5816
57c6 55        ld      d,l
57c7 42        ld      b,d
57c8 2020      jr      nz,$57ea
57ca 52        ld      d,d
57cb 45        ld      b,l
57cc 46        ld      b,(hl)
57cd 43        ld      b,e
57ce 55        ld      d,l
57cf 49        ld      c,c
57d0 2020      jr      nz,$57f2
57d2 2020      jr      nz,$57f4
57d4 2020      jr      nz,$57f6
57d6 2020      jr      nz,$57f8
57d8 2020      jr      nz,$57fa
57da 2020      jr      nz,$57fc
57dc 2020      jr      nz,$57fe
57de 2020      jr      nz,$5800
57e0 2020      jr      nz,$5802
57e2 2020      jr      nz,$5804
57e4 2020      jr      nz,$5806
57e6 2020      jr      nz,$5808
57e8 2020      jr      nz,$580a
57ea 3031      jr      nc,$581d
57ec 46        ld      b,(hl)
57ed 33        inc     sp
57ee 48        ld      c,b
57ef 2050      jr      nz,$5841
57f1 55        ld      d,l
57f2 42        ld      b,d
57f3 2020      jr      nz,$5815
57f5 52        ld      d,d
57f6 00        nop     
57f7 00        nop     
57f8 00        nop     
57f9 00        nop     
57fa 00        nop     
57fb 0d        dec     c
57fc 0a        ld      a,(bc)
57fd 3031      jr      nc,$5830
57ff 46        ld      b,(hl)
5800 3848      jr      c,$584a
5802 2050      jr      nz,$5854
5804 55        ld      d,l
5805 42        ld      b,d
5806 2020      jr      nz,$5828
5808 52        ld      d,d
5809 50        ld      d,b
580a 4c        ld      c,h
580b 4f        ld      c,a
580c 46        ld      b,(hl)
580d 53        ld      d,e
580e 2020      jr      nz,$5830
5810 2020      jr      nz,$5832
5812 2020      jr      nz,$5834
5814 2020      jr      nz,$5836
5816 2020      jr      nz,$5838
5818 2020      jr      nz,$583a
581a 2020      jr      nz,$583c
581c 2020      jr      nz,$583e
581e 2020      jr      nz,$5840
5820 2020      jr      nz,$5842
5822 2020      jr      nz,$5844
5824 2020      jr      nz,$5846
5826 2020      jr      nz,$5848
5828 3031      jr      nc,$585b
582a 46        ld      b,(hl)
582b 324820    ld      ($2048),a
582e 50        ld      d,b
582f 55        ld      d,l
5830 42        ld      b,d
5831 2020      jr      nz,$5853
5833 52        ld      d,d
5834 50        ld      d,b
5835 4c        ld      c,h
5836 4f        ld      c,a
5837 4e        ld      c,(hl)
5838 2020      jr      nz,$585a
583a 2020      jr      nz,$585c
583c 2020      jr      nz,$585e
583e 2020      jr      nz,$5860
5840 2020      jr      nz,$5862
5842 2020      jr      nz,$5864
5844 2020      jr      nz,$5866
5846 2020      jr      nz,$5868
5848 2020      jr      nz,$586a
584a 2020      jr      nz,$586c
584c 2020      jr      nz,$586e
584e 2020      jr      nz,$5870
5850 2020      jr      nz,$5872
5852 2030      jr      nz,$5884
5854 313630    ld      sp,$3036
5857 48        ld      c,b
5858 2050      jr      nz,$58aa
585a 55        ld      d,l
585b 42        ld      b,d
585c 2020      jr      nz,$587e
585e 52        ld      d,d
585f 54        ld      d,h
5860 53        ld      d,e
5861 42        ld      b,d
5862 4c        ld      c,h
5863 44        ld      b,h
5864 0d        dec     c
5865 0a        ld      a,(bc)
5866 3031      jr      nc,$5899
5868 39        add     hl,sp
5869 34        inc     (hl)
586a 48        ld      c,b
586b 2050      jr      nz,$58bd
586d 55        ld      d,l
586e 42        ld      b,d
586f 2020      jr      nz,$5891
5871 53        ld      d,e
5872 45        ld      b,l
5873 51        ld      d,c
5874 4f        ld      c,a
5875 4e        ld      c,(hl)
5876 2020      jr      nz,$5898
5878 2020      jr      nz,$589a
587a 2020      jr      nz,$589c
587c 2020      jr      nz,$589e
587e 2020      jr      nz,$58a0
5880 2020      jr      nz,$58a2
5882 2020      jr      nz,$58a4
5884 2020      jr      nz,$58a6
5886 2020      jr      nz,$58a8
5888 2020      jr      nz,$58aa
588a 2020      jr      nz,$58ac
588c 2020      jr      nz,$58ae
588e 2020      jr      nz,$58b0
5890 2030      jr      nz,$58c2
5892 313935    ld      sp,$3539
5895 48        ld      c,b
5896 2050      jr      nz,$58e8
5898 55        ld      d,l
5899 42        ld      b,d
589a 2020      jr      nz,$58bc
589c 53        ld      d,e
589d 45        ld      b,l
589e 51        ld      d,c
589f 4f        ld      c,a
58a0 54        ld      d,h
58a1 2020      jr      nz,$58c3
58a3 2020      jr      nz,$58c5
58a5 2020      jr      nz,$58c7
58a7 2020      jr      nz,$58c9
58a9 2020      jr      nz,$58cb
58ab 2020      jr      nz,$58cd
58ad 2020      jr      nz,$58cf
58af 2020      jr      nz,$58d1
58b1 2020      jr      nz,$58d3
58b3 2020      jr      nz,$58d5
58b5 2020      jr      nz,$58d7
58b7 2020      jr      nz,$58d9
58b9 2020      jr      nz,$58db
58bb 2030      jr      nz,$58ed
58bd 313531    ld      sp,$3135
58c0 48        ld      c,b
58c1 2050      jr      nz,$5913
58c3 55        ld      d,l
58c4 42        ld      b,d
58c5 2020      jr      nz,$58e7
58c7 53        ld      d,e
58c8 54        ld      d,h
58c9 41        ld      b,c
58ca 52        ld      d,d
58cb 54        ld      d,h
58cc 49        ld      c,c
58cd 0d        dec     c
58ce 0a        ld      a,(bc)
58cf 3031      jr      nc,$5902
58d1 35        dec     (hl)
58d2 34        inc     (hl)
58d3 48        ld      c,b
58d4 2050      jr      nz,$5926
58d6 55        ld      d,l
58d7 42        ld      b,d
58d8 2020      jr      nz,$58fa
58da 53        ld      d,e
58db 54        ld      d,h
58dc 4f        ld      c,a
58dd 50        ld      d,b
58de 49        ld      c,c
58df 2020      jr      nz,$5901
58e1 2020      jr      nz,$5903
58e3 2020      jr      nz,$5905
58e5 2020      jr      nz,$5907
58e7 2020      jr      nz,$5909
58e9 2020      jr      nz,$590b
58eb 2020      jr      nz,$590d
58ed 2020      jr      nz,$590f
58ef 2020      jr      nz,$5911
58f1 2020      jr      nz,$5913
58f3 2020      jr      nz,$5915
58f5 2020      jr      nz,$5917
58f7 2020      jr      nz,$5919
58f9 2030      jr      nz,$592b
58fb 314637    ld      sp,$3746
58fe 48        ld      c,b
58ff 2050      jr      nz,$5951
5901 55        ld      d,l
5902 42        ld      b,d
5903 2020      jr      nz,$5925
5905 53        ld      d,e
5906 54        ld      d,h
5907 50        ld      d,b
5908 46        ld      b,(hl)
5909 4c        ld      c,h
590a 47        ld      b,a
590b 2020      jr      nz,$592d
590d 2020      jr      nz,$592f
590f 2020      jr      nz,$5931
5911 2020      jr      nz,$5933
5913 2020      jr      nz,$5935
5915 2020      jr      nz,$5937
5917 2000      jr      nz,$5919
5919 00        nop     
591a 00        nop     
591b 00        nop     
591c 00        nop     
591d 00        nop     
591e 00        nop     
591f 00        nop     
5920 00        nop     
5921 00        nop     
5922 00        nop     
5923 00        nop     
5924 00        nop     
5925 03        inc     bc
5926 08        ex      af,af'
5927 80        add     a,b
5928 00        nop     
5929 00        nop     
592a 00        nop     
592b 00        nop     
592c 00        nop     
592d 00        nop     
592e 00        nop     
592f 00        nop     
5930 00        nop     
5931 00        nop     
5932 00        nop     
5933 00        nop     
5934 48        ld      c,b
5935 52        ld      d,d
5936 0d        dec     c
5937 0a        ld      a,(bc)
5938 3031      jr      nc,$596b
593a 43        ld      b,e
593b 44        ld      b,h
593c 48        ld      c,b
593d 2050      jr      nz,$598f
593f 55        ld      d,l
5940 42        ld      b,d
5941 2020      jr      nz,$5963
5943 54        ld      d,h
5944 41        ld      b,c
5945 42        ld      b,d
5946 49        ld      c,c
5947 2020      jr      nz,$5969
5949 2020      jr      nz,$596b
594b 2020      jr      nz,$596d
594d 2020      jr      nz,$596f
594f 2020      jr      nz,$5971
5951 2020      jr      nz,$5973
5953 2020      jr      nz,$5975
5955 2020      jr      nz,$5977
5957 2020      jr      nz,$5979
5959 2020      jr      nz,$597b
595b 2020      jr      nz,$597d
595d 2020      jr      nz,$597f
595f 2020      jr      nz,$5981
5961 2020      jr      nz,$5983
5963 3031      jr      nc,$5996
5965 3837      jr      c,$599e
5967 48        ld      c,b
5968 2050      jr      nz,$59ba
596a 55        ld      d,l
596b 42        ld      b,d
596c 2020      jr      nz,$598e
596e 55        ld      d,l
596f 53        ld      d,e
5970 52        ld      d,d
5971 4e        ld      c,(hl)
5972 4d        ld      c,l
5973 2020      jr      nz,$5995
5975 2020      jr      nz,$5997
5977 2020      jr      nz,$5999
5979 2020      jr      nz,$599b
597b 2020      jr      nz,$599d
597d 2020      jr      nz,$599f
597f 2020      jr      nz,$59a1
5981 2020      jr      nz,$59a3
5983 2020      jr      nz,$59a5
5985 2020      jr      nz,$59a7
5987 2020      jr      nz,$59a9
5989 2020      jr      nz,$59ab
598b 2020      jr      nz,$59ad
598d 2030      jr      nz,$59bf
598f 313438    ld      sp,$3834
5992 48        ld      c,b
5993 2050      jr      nz,$59e5
5995 55        ld      d,l
5996 42        ld      b,d
5997 2020      jr      nz,$59b9
5999 56        ld      d,(hl)
599a 44        ld      b,h
599b 49        ld      c,c
599c 4e        ld      c,(hl)
599d 49        ld      c,c
599e 49        ld      c,c
599f 0d        dec     c
59a0 0a        ld      a,(bc)
59a1 3031      jr      nc,$59d4
59a3 3030      jr      nc,$59d5
59a5 48        ld      c,b
59a6 2050      jr      nz,$59f8
59a8 55        ld      d,l
59a9 42        ld      b,d
59aa 2020      jr      nz,$59cc
59ac 56        ld      d,(hl)
59ad 45        ld      b,l
59ae 43        ld      b,e
59af 54        ld      d,h
59b0 4f        ld      c,a
59b1 52        ld      d,d
59b2 2020      jr      nz,$59d4
59b4 2020      jr      nz,$59d6
59b6 2020      jr      nz,$59d8
59b8 2020      jr      nz,$59da
59ba 2020      jr      nz,$59dc
59bc 2020      jr      nz,$59de
59be 2020      jr      nz,$59e0
59c0 2020      jr      nz,$59e2
59c2 2020      jr      nz,$59e4
59c4 2020      jr      nz,$59e6
59c6 2020      jr      nz,$59e8
59c8 2020      jr      nz,$59ea
59ca 2020      jr      nz,$59ec
59cc 3031      jr      nc,$59ff
59ce 3842      jr      c,$5a12
59d0 48        ld      c,b
59d1 2050      jr      nz,$5a23
59d3 55        ld      d,l
59d4 42        ld      b,d
59d5 2020      jr      nz,$59f7
59d7 56        ld      d,(hl)
59d8 45        ld      b,l
59d9 52        ld      d,d
59da 53        ld      d,e
59db 4e        ld      c,(hl)
59dc 312020    ld      sp,$2020
59df 2020      jr      nz,$5a01
59e1 2020      jr      nz,$5a03
59e3 2020      jr      nz,$5a05
59e5 2020      jr      nz,$5a07
59e7 2000      jr      nz,$59e9
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
5a04 49        ld      c,c
5a05 44        ld      b,h
5a06 58        ld      e,b
5a07 200d      jr      nz,$5a16
5a09 0a        ld      a,(bc)
5a0a 3032      jr      nc,$5a3e
5a0c 314448    ld      sp,$4844
5a0f 2050      jr      nz,$5a61
5a11 55        ld      d,l
5a12 42        ld      b,d
5a13 2020      jr      nz,$5a35
5a15 41        ld      b,c
5a16 46        ld      b,(hl)
5a17 41        ld      b,c
5a18 2020      jr      nz,$5a3a
5a1a 2020      jr      nz,$5a3c
5a1c 2020      jr      nz,$5a3e
5a1e 2020      jr      nz,$5a40
5a20 2020      jr      nz,$5a42
5a22 2020      jr      nz,$5a44
5a24 2020      jr      nz,$5a46
5a26 2020      jr      nz,$5a48
5a28 2020      jr      nz,$5a4a
5a2a 2020      jr      nz,$5a4c
5a2c 2020      jr      nz,$5a4e
5a2e 2020      jr      nz,$5a50
5a30 2020      jr      nz,$5a52
5a32 2020      jr      nz,$5a54
5a34 2030      jr      nz,$5a66
5a36 323239    ld      ($3932),a
5a39 48        ld      c,b
5a3a 2050      jr      nz,$5a8c
5a3c 55        ld      d,l
5a3d 42        ld      b,d
5a3e 2020      jr      nz,$5a60
5a40 41        ld      b,c
5a41 46        ld      b,(hl)
5a42 41        ld      b,c
5a43 58        ld      e,b
5a44 2020      jr      nz,$5a66
5a46 2020      jr      nz,$5a68
5a48 2020      jr      nz,$5a6a
5a4a 2020      jr      nz,$5a6c
5a4c 2020      jr      nz,$5a6e
5a4e 2020      jr      nz,$5a70
5a50 2020      jr      nz,$5a72
5a52 2020      jr      nz,$5a74
5a54 2020      jr      nz,$5a76
5a56 2020      jr      nz,$5a78
5a58 2020      jr      nz,$5a7a
5a5a 2020      jr      nz,$5a7c
5a5c 2020      jr      nz,$5a7e
5a5e 2020      jr      nz,$5a80
5a60 3032      jr      nc,$5a94
5a62 323748    ld      ($4837),a
5a65 2050      jr      nz,$5ab7
5a67 55        ld      d,l
5a68 42        ld      b,d
5a69 2020      jr      nz,$5a8b
5a6b 41        ld      b,c
5a6c 47        ld      b,a
5a6d 41        ld      b,c
5a6e 0d        dec     c
5a6f 0a        ld      a,(bc)
5a70 3032      jr      nc,$5aa4
5a72 324648    ld      ($4846),a
5a75 2050      jr      nz,$5ac7
5a77 55        ld      d,l
5a78 42        ld      b,d
5a79 2020      jr      nz,$5a9b
5a7b 41        ld      b,c
5a7c 49        ld      c,c
5a7d 41        ld      b,c
5a7e 52        ld      d,d
5a7f 58        ld      e,b
5a80 4c        ld      c,h
5a81 2020      jr      nz,$5aa3
5a83 2020      jr      nz,$5aa5
5a85 2020      jr      nz,$5aa7
5a87 2020      jr      nz,$5aa9
5a89 2020      jr      nz,$5aab
5a8b 2020      jr      nz,$5aad
5a8d 2020      jr      nz,$5aaf
5a8f 2020      jr      nz,$5ab1
5a91 2020      jr      nz,$5ab3
5a93 2020      jr      nz,$5ab5
5a95 2020      jr      nz,$5ab7
5a97 2020      jr      nz,$5ab9
5a99 2020      jr      nz,$5abb
5a9b 3032      jr      nc,$5acf
5a9d 323148    ld      ($4831),a
5aa0 2050      jr      nz,$5af2
5aa2 55        ld      d,l
5aa3 42        ld      b,d
5aa4 2020      jr      nz,$5ac6
5aa6 41        ld      b,c
5aa7 4b        ld      c,e
5aa8 41        ld      b,c
5aa9 2020      jr      nz,$5acb
5aab 2020      jr      nz,$5acd
5aad 2020      jr      nz,$5acf
5aaf 2020      jr      nz,$5ad1
5ab1 2020      jr      nz,$5ad3
5ab3 2020      jr      nz,$5ad5
5ab5 2020      jr      nz,$5ad7
5ab7 2020      jr      nz,$5ad9
5ab9 2020      jr      nz,$5adb
5abb 2020      jr      nz,$5add
5abd 2020      jr      nz,$5adf
5abf 2020      jr      nz,$5ae1
5ac1 2020      jr      nz,$5ae3
5ac3 2020      jr      nz,$5ae5
5ac5 2030      jr      nz,$5af7
5ac7 323244    ld      ($4432),a
5aca 48        ld      c,b
5acb 2050      jr      nz,$5b1d
5acd 55        ld      d,l
5ace 42        ld      b,d
5acf 2020      jr      nz,$5af1
5ad1 41        ld      b,c
5ad2 4b        ld      c,e
5ad3 41        ld      b,c
5ad4 52        ld      d,d
5ad5 58        ld      e,b
5ad6 4c        ld      c,h
5ad7 0d        dec     c
5ad8 0a        ld      a,(bc)
5ad9 3032      jr      nc,$5b0d
5adb 323348    ld      ($4833),a
5ade 2050      jr      nz,$5b30
5ae0 55        ld      d,l
5ae1 42        ld      b,d
5ae2 2020      jr      nz,$5b04
5ae4 41        ld      b,c
5ae5 4c        ld      c,h
5ae6 41        ld      b,c
5ae7 2020      jr      nz,$5b09
5ae9 2020      jr      nz,$5b0b
5aeb 2020      jr      nz,$5b0d
5aed 2020      jr      nz,$5b0f
5aef 2020      jr      nz,$5b11
5af1 2020      jr      nz,$5b13
5af3 2020      jr      nz,$5b15
5af5 2020      jr      nz,$5b17
5af7 2020      jr      nz,$5b19
5af9 2020      jr      nz,$5b1b
5afb 2020      jr      nz,$5b1d
5afd 2020      jr      nz,$5b1f
5aff 2020      jr      nz,$5b21
5b01 2020      jr      nz,$5b23
5b03 2030      jr      nz,$5b35
5b05 323333    ld      ($3333),a
5b08 48        ld      c,b
5b09 2050      jr      nz,$5b5b
5b0b 55        ld      d,l
5b0c 42        ld      b,d
5b0d 2020      jr      nz,$5b2f
5b0f 41        ld      b,c
5b10 4c        ld      c,h
5b11 4d        ld      c,l
5b12 45        ld      b,l
5b13 4e        ld      c,(hl)
5b14 54        ld      d,h
5b15 2020      jr      nz,$5b37
5b17 2020      jr      nz,$5b39
5b19 2020      jr      nz,$5b3b
5b1b 2020      jr      nz,$5b3d
5b1d 2020      jr      nz,$5b3f
5b1f 2020      jr      nz,$5b41
5b21 2020      jr      nz,$5b43
5b23 2020      jr      nz,$5b45
5b25 2020      jr      nz,$5b47
5b27 2020      jr      nz,$5b49
5b29 2020      jr      nz,$5b4b
5b2b 2020      jr      nz,$5b4d
5b2d 2020      jr      nz,$5b4f
5b2f 3032      jr      nc,$5b63
5b31 3036      jr      nc,$5b69
5b33 48        ld      c,b
5b34 2050      jr      nz,$5b86
5b36 55        ld      d,l
5b37 42        ld      b,d
5b38 2020      jr      nz,$5b5a
5b3a 41        ld      b,c
5b3b 4e        ld      c,(hl)
5b3c 46        ld      b,(hl)
5b3d 4c        ld      c,h
5b3e 47        ld      b,a
5b3f 0d        dec     c
5b40 0a        ld      a,(bc)
5b41 3032      jr      nc,$5b75
5b43 323548    ld      ($4835),a
5b46 2050      jr      nz,$5b98
5b48 55        ld      d,l
5b49 42        ld      b,d
5b4a 2020      jr      nz,$5b6c
5b4c 41        ld      b,c
5b4d 50        ld      d,b
5b4e 41        ld      b,c
5b4f 2020      jr      nz,$5b71
5b51 2020      jr      nz,$5b73
5b53 2020      jr      nz,$5b75
5b55 2020      jr      nz,$5b77
5b57 2020      jr      nz,$5b79
5b59 2020      jr      nz,$5b7b
5b5b 2020      jr      nz,$5b7d
5b5d 2020      jr      nz,$5b7f
5b5f 2020      jr      nz,$5b81
5b61 2020      jr      nz,$5b83
5b63 2020      jr      nz,$5b85
5b65 2020      jr      nz,$5b87
5b67 2020      jr      nz,$5b89
5b69 2020      jr      nz,$5b8b
5b6b 2030      jr      nz,$5b9d
5b6d 323334    ld      ($3433),a
5b70 48        ld      c,b
5b71 2050      jr      nz,$5bc3
5b73 55        ld      d,l
5b74 42        ld      b,d
5b75 2020      jr      nz,$5b97
5b77 41        ld      b,c
5b78 50        ld      d,b
5b79 41        ld      b,c
5b7a 58        ld      e,b
5b7b 2020      jr      nz,$5b9d
5b7d 2020      jr      nz,$5b9f
5b7f 2020      jr      nz,$5ba1
5b81 2020      jr      nz,$5ba3
5b83 2020      jr      nz,$5ba5
5b85 2020      jr      nz,$5ba7
5b87 2020      jr      nz,$5ba9
5b89 2020      jr      nz,$5bab
5b8b 2020      jr      nz,$5bad
5b8d 2020      jr      nz,$5baf
5b8f 2020      jr      nz,$5bb1
5b91 2020      jr      nz,$5bb3
5b93 2020      jr      nz,$5bb5
5b95 2020      jr      nz,$5bb7
5b97 3032      jr      nc,$5bcb
5b99 314648    ld      sp,$4846
5b9c 2050      jr      nz,$5bee
5b9e 55        ld      d,l
5b9f 42        ld      b,d
5ba0 2020      jr      nz,$5bc2
5ba2 41        ld      b,c
5ba3 57        ld      d,a
5ba4 41        ld      b,c
5ba5 0d        dec     c
5ba6 0a        ld      a,(bc)
5ba7 3032      jr      nc,$5bdb
5ba9 324248    ld      ($4842),a
5bac 2050      jr      nz,$5bfe
5bae 55        ld      d,l
5baf 42        ld      b,d
5bb0 2020      jr      nz,$5bd2
5bb2 41        ld      b,c
5bb3 57        ld      d,a
5bb4 41        ld      b,c
5bb5 52        ld      d,d
5bb6 45        ld      b,l
5bb7 4c        ld      c,h
5bb8 2020      jr      nz,$5bda
5bba 2020      jr      nz,$5bdc
5bbc 2020      jr      nz,$5bde
5bbe 2020      jr      nz,$5be0
5bc0 2020      jr      nz,$5be2
5bc2 2020      jr      nz,$5be4
5bc4 2020      jr      nz,$5be6
5bc6 2020      jr      nz,$5be8
5bc8 2020      jr      nz,$5bea
5bca 2020      jr      nz,$5bec
5bcc 2020      jr      nz,$5bee
5bce 2020      jr      nz,$5bf0
5bd0 2020      jr      nz,$5bf2
5bd2 3032      jr      nc,$5c06
5bd4 3045      jr      nc,$5c1b
5bd6 48        ld      c,b
5bd7 2050      jr      nz,$5c29
5bd9 55        ld      d,l
5bda 42        ld      b,d
5bdb 2020      jr      nz,$5bfd
5bdd 42        ld      b,d
5bde 4b        ld      c,e
5bdf 41        ld      b,c
5be0 2020      jr      nz,$5c02
5be2 2020      jr      nz,$5c04
5be4 2020      jr      nz,$5c06
5be6 2020      jr      nz,$5c08
5be8 2020      jr      nz,$5c0a
5bea 2020      jr      nz,$5c0c
5bec 2020      jr      nz,$5c0e
5bee 2020      jr      nz,$5c10
5bf0 2020      jr      nz,$5c12
5bf2 2020      jr      nz,$5c14
5bf4 2020      jr      nz,$5c16
5bf6 2020      jr      nz,$5c18
5bf8 2020      jr      nz,$5c1a
5bfa 2020      jr      nz,$5c1c
5bfc 2030      jr      nz,$5c2e
5bfe 323042    ld      ($4230),a
5c01 48        ld      c,b
5c02 2050      jr      nz,$5c54
5c04 55        ld      d,l
5c05 42        ld      b,d
5c06 2020      jr      nz,$5c28
5c08 43        ld      b,e
5c09 41        ld      b,c
5c0a 4c        ld      c,h
5c0b 53        ld      d,e
5c0c 54        ld      d,h
5c0d 4b        ld      c,e
5c0e 0d        dec     c
5c0f 0a        ld      a,(bc)
5c10 3032      jr      nc,$5c44
5c12 33        inc     sp
5c13 37        scf     
5c14 48        ld      c,b
5c15 2050      jr      nz,$5c67
5c17 55        ld      d,l
5c18 42        ld      b,d
5c19 2020      jr      nz,$5c3b
5c1b 43        ld      b,e
5c1c 4f        ld      c,a
5c1d 4d        ld      c,l
5c1e 4d        ld      c,l
5c1f 41        ld      b,c
5c20 2020      jr      nz,$5c42
5c22 2020      jr      nz,$5c44
5c24 2020      jr      nz,$5c46
5c26 2020      jr      nz,$5c48
5c28 2020      jr      nz,$5c4a
5c2a 2020      jr      nz,$5c4c
5c2c 2020      jr      nz,$5c4e
5c2e 2020      jr      nz,$5c50
5c30 2020      jr      nz,$5c52
5c32 2020      jr      nz,$5c54
5c34 2020      jr      nz,$5c56
5c36 2020      jr      nz,$5c58
5c38 2020      jr      nz,$5c5a
5c3a 2030      jr      nz,$5c6c
5c3c 323338    ld      ($3833),a
5c3f 48        ld      c,b
5c40 2050      jr      nz,$5c92
5c42 55        ld      d,l
5c43 42        ld      b,d
5c44 2020      jr      nz,$5c66
5c46 43        ld      b,e
5c47 53        ld      d,e
5c48 49        ld      c,c
5c49 47        ld      b,a
5c4a 4e        ld      c,(hl)
5c4b 2020      jr      nz,$5c6d
5c4d 2020      jr      nz,$5c6f
5c4f 2020      jr      nz,$5c71
5c51 2020      jr      nz,$5c73
5c53 2020      jr      nz,$5c75
5c55 2020      jr      nz,$5c77
5c57 2020      jr      nz,$5c79
5c59 2020      jr      nz,$5c7b
5c5b 2020      jr      nz,$5c7d
5c5d 2020      jr      nz,$5c7f
5c5f 2020      jr      nz,$5c81
5c61 2020      jr      nz,$5c83
5c63 2020      jr      nz,$5c85
5c65 2030      jr      nz,$5c97
5c67 323339    ld      ($3933),a
5c6a 48        ld      c,b
5c6b 2050      jr      nz,$5cbd
5c6d 55        ld      d,l
5c6e 42        ld      b,d
5c6f 2020      jr      nz,$5c91
5c71 43        ld      b,e
5c72 55        ld      d,l
5c73 52        ld      d,d
5c74 41        ld      b,c
5c75 44        ld      b,h
5c76 0d        dec     c
5c77 0a        ld      a,(bc)
5c78 3032      jr      nc,$5cac
5c7a 3038      jr      nc,$5cb4
5c7c 48        ld      c,b
5c7d 2050      jr      nz,$5ccf
5c7f 55        ld      d,l
5c80 42        ld      b,d
5c81 2020      jr      nz,$5ca3
5c83 43        ld      b,e
5c84 55        ld      d,l
5c85 52        ld      d,d
5c86 53        ld      d,e
5c87 45        ld      b,l
5c88 47        ld      b,a
5c89 2020      jr      nz,$5cab
5c8b 2020      jr      nz,$5cad
5c8d 2020      jr      nz,$5caf
5c8f 2020      jr      nz,$5cb1
5c91 2020      jr      nz,$5cb3
5c93 2020      jr      nz,$5cb5
5c95 2020      jr      nz,$5cb7
5c97 2020      jr      nz,$5cb9
5c99 2020      jr      nz,$5cbb
5c9b 2020      jr      nz,$5cbd
5c9d 2020      jr      nz,$5cbf
5c9f 2020      jr      nz,$5cc1
5ca1 2020      jr      nz,$5cc3
5ca3 3032      jr      nc,$5cd7
5ca5 33        inc     sp
5ca6 3648      ld      (hl),$48
5ca8 2050      jr      nz,$5cfa
5caa 55        ld      d,l
5cab 42        ld      b,d
5cac 2020      jr      nz,$5cce
5cae 44        ld      b,h
5caf 50        ld      d,b
5cb0 5a        ld      e,d
5cb1 2020      jr      nz,$5cd3
5cb3 2020      jr      nz,$5cd5
5cb5 2020      jr      nz,$5cd7
5cb7 2020      jr      nz,$5cd9
5cb9 2020      jr      nz,$5cdb
5cbb 2020      jr      nz,$5cdd
5cbd 2020      jr      nz,$5cdf
5cbf 2020      jr      nz,$5ce1
5cc1 2020      jr      nz,$5ce3
5cc3 2020      jr      nz,$5ce5
5cc5 2020      jr      nz,$5ce7
5cc7 2020      jr      nz,$5ce9
5cc9 2020      jr      nz,$5ceb
5ccb 2020      jr      nz,$5ced
5ccd 2030      jr      nz,$5cff
5ccf 323034    ld      ($3430),a
5cd2 48        ld      c,b
5cd3 2050      jr      nz,$5d25
5cd5 55        ld      d,l
5cd6 42        ld      b,d
5cd7 2020      jr      nz,$5cf9
5cd9 44        ld      b,h
5cda 59        ld      e,c
5cdb 4e        ld      c,(hl)
5cdc 41        ld      b,c
5cdd 42        ld      b,d
5cde 53        ld      d,e
5cdf 0d        dec     c
5ce0 0a        ld      a,(bc)
5ce1 3032      jr      nc,$5d15
5ce3 3030      jr      nc,$5d15
5ce5 48        ld      c,b
5ce6 2050      jr      nz,$5d38
5ce8 55        ld      d,l
5ce9 42        ld      b,d
5cea 2020      jr      nz,$5d0c
5cec 49        ld      c,c
5ced 53        ld      d,e
5cee 52        ld      d,d
5cef 41        ld      b,c
5cf0 44        ld      b,h
5cf1 2020      jr      nz,$5d13
5cf3 2020      jr      nz,$5d15
5cf5 2020      jr      nz,$5d17
5cf7 2020      jr      nz,$5d19
5cf9 2020      jr      nz,$5d1b
5cfb 2020      jr      nz,$5d1d
5cfd 2020      jr      nz,$5d1f
5cff 2020      jr      nz,$5d21
5d01 2020      jr      nz,$5d23
5d03 2020      jr      nz,$5d25
5d05 2020      jr      nz,$5d27
5d07 2020      jr      nz,$5d29
5d09 2020      jr      nz,$5d2b
5d0b 2030      jr      nz,$5d3d
5d0d 323331    ld      ($3133),a
5d10 48        ld      c,b
5d11 2050      jr      nz,$5d63
5d13 55        ld      d,l
5d14 42        ld      b,d
5d15 2020      jr      nz,$5d37
5d17 4c        ld      c,h
5d18 53        ld      d,e
5d19 58        ld      e,b
5d1a 2020      jr      nz,$5d3c
5d1c 2020      jr      nz,$5d3e
5d1e 2020      jr      nz,$5d40
5d20 2020      jr      nz,$5d42
5d22 2020      jr      nz,$5d44
5d24 2020      jr      nz,$5d46
5d26 2020      jr      nz,$5d48
5d28 2020      jr      nz,$5d4a
5d2a 2020      jr      nz,$5d4c
5d2c 2020      jr      nz,$5d4e
5d2e 2020      jr      nz,$5d50
5d30 2020      jr      nz,$5d52
5d32 2020      jr      nz,$5d54
5d34 2020      jr      nz,$5d56
5d36 2030      jr      nz,$5d68
5d38 323032    ld      ($3230),a
5d3b 48        ld      c,b
5d3c 2050      jr      nz,$5d8e
5d3e 55        ld      d,l
5d3f 42        ld      b,d
5d40 2020      jr      nz,$5d62
5d42 4f        ld      c,a
5d43 56        ld      d,(hl)
5d44 4c        ld      c,h
5d45 41        ld      b,c
5d46 44        ld      b,h
5d47 0d        dec     c
5d48 0a        ld      a,(bc)
5d49 3032      jr      nc,$5d7d
5d4b 3039      jr      nc,$5d86
5d4d 48        ld      c,b
5d4e 2050      jr      nz,$5da0
5d50 55        ld      d,l
5d51 42        ld      b,d
5d52 2020      jr      nz,$5d74
5d54 50        ld      d,b
5d55 43        ld      b,e
5d56 52        ld      d,d
5d57 45        ld      b,l
5d58 4c        ld      c,h
5d59 2020      jr      nz,$5d7b
5d5b 2020      jr      nz,$5d7d
5d5d 2020      jr      nz,$5d7f
5d5f 2020      jr      nz,$5d81
5d61 2020      jr      nz,$5d83
5d63 2020      jr      nz,$5d85
5d65 2020      jr      nz,$5d87
5d67 2020      jr      nz,$5d89
5d69 2020      jr      nz,$5d8b
5d6b 2020      jr      nz,$5d8d
5d6d 2020      jr      nz,$5d8f
5d6f 2020      jr      nz,$5d91
5d71 2020      jr      nz,$5d93
5d73 2030      jr      nz,$5da5
5d75 323044    ld      ($4430),a
5d78 48        ld      c,b
5d79 2050      jr      nz,$5dcb
5d7b 55        ld      d,l
5d7c 42        ld      b,d
5d7d 2020      jr      nz,$5d9f
5d7f 50        ld      d,b
5d80 4c        ld      c,h
5d81 45        ld      b,l
5d82 56        ld      d,(hl)
5d83 45        ld      b,l
5d84 4c        ld      c,h
5d85 2020      jr      nz,$5da7
5d87 2020      jr      nz,$5da9
5d89 2020      jr      nz,$5dab
5d8b 2020      jr      nz,$5dad
5d8d 2020      jr      nz,$5daf
5d8f 2020      jr      nz,$5db1
5d91 2020      jr      nz,$5db3
5d93 2020      jr      nz,$5db5
5d95 2020      jr      nz,$5db7
5d97 2020      jr      nz,$5db9
5d99 2020      jr      nz,$5dbb
5d9b 2020      jr      nz,$5dbd
5d9d 2020      jr      nz,$5dbf
5d9f 3032      jr      nc,$5dd3
5da1 3030      jr      nc,$5dd3
5da3 48        ld      c,b
5da4 2050      jr      nz,$5df6
5da6 55        ld      d,l
5da7 42        ld      b,d
5da8 2020      jr      nz,$5dca
5daa 52        ld      d,d
5dab 55        ld      d,l
5dac 4e        ld      c,(hl)
5dad 4d        ld      c,l
5dae 43        ld      b,e
5daf 48        ld      c,b
5db0 0d        dec     c
5db1 0a        ld      a,(bc)
5db2 3032      jr      nc,$5de6
5db4 33        inc     sp
5db5 45        ld      b,l
5db6 48        ld      c,b
5db7 2050      jr      nz,$5e09
5db9 55        ld      d,l
5dba 42        ld      b,d
5dbb 2020      jr      nz,$5ddd
5dbd 53        ld      d,e
5dbe 41        ld      b,c
5dbf 56        ld      d,(hl)
5dc0 53        ld      d,e
5dc1 5a        ld      e,d
5dc2 45        ld      b,l
5dc3 2020      jr      nz,$5de5
5dc5 2020      jr      nz,$5de7
5dc7 2020      jr      nz,$5de9
5dc9 2020      jr      nz,$5deb
5dcb 2020      jr      nz,$5ded
5dcd 2020      jr      nz,$5def
5dcf 2020      jr      nz,$5df1
5dd1 2020      jr      nz,$5df3
5dd3 2020      jr      nz,$5df5
5dd5 2020      jr      nz,$5df7
5dd7 2020      jr      nz,$5df9
5dd9 2020      jr      nz,$5dfb
5ddb 2020      jr      nz,$5dfd
5ddd 3032      jr      nc,$5e11
5ddf 3037      jr      nc,$5e18
5de1 48        ld      c,b
5de2 2050      jr      nz,$5e34
5de4 55        ld      d,l
5de5 42        ld      b,d
5de6 2020      jr      nz,$5e08
5de8 53        ld      d,e
5de9 46        ld      b,(hl)
5dea 4c        ld      c,h
5deb 41        ld      b,c
5dec 47        ld      b,a
5ded 2020      jr      nz,$5e0f
5def 2020      jr      nz,$5e11
5df1 2020      jr      nz,$5e13
5df3 2020      jr      nz,$5e15
5df5 2020      jr      nz,$5e17
5df7 2020      jr      nz,$5e19
5df9 2020      jr      nz,$5e1b
5dfb 2020      jr      nz,$5e1d
5dfd 2020      jr      nz,$5e1f
5dff 2020      jr      nz,$5e21
5e01 2020      jr      nz,$5e23
5e03 2020      jr      nz,$5e25
5e05 2020      jr      nz,$5e27
5e07 2030      jr      nz,$5e39
5e09 323343    ld      ($4333),a
5e0c 48        ld      c,b
5e0d 2050      jr      nz,$5e5f
5e0f 55        ld      d,l
5e10 42        ld      b,d
5e11 2020      jr      nz,$5e33
5e13 53        ld      d,e
5e14 56        ld      d,(hl)
5e15 46        ld      b,(hl)
5e16 43        ld      b,e
5e17 44        ld      b,h
5e18 50        ld      d,b
5e19 0d        dec     c
5e1a 0a        ld      a,(bc)
5e1b 3032      jr      nc,$5e4f
5e1d 33        inc     sp
5e1e 42        ld      b,d
5e1f 48        ld      c,b
5e20 2050      jr      nz,$5e72
5e22 55        ld      d,l
5e23 42        ld      b,d
5e24 2020      jr      nz,$5e46
5e26 53        ld      d,e
5e27 56        ld      d,(hl)
5e28 46        ld      b,(hl)
5e29 4c        ld      c,h
5e2a 47        ld      b,a
5e2b 2020      jr      nz,$5e4d
5e2d 2020      jr      nz,$5e4f
5e2f 2020      jr      nz,$5e51
5e31 2020      jr      nz,$5e53
5e33 2020      jr      nz,$5e55
5e35 2020      jr      nz,$5e57
5e37 2020      jr      nz,$5e59
5e39 2020      jr      nz,$5e5b
5e3b 2020      jr      nz,$5e5d
5e3d 2020      jr      nz,$5e5f
5e3f 2020      jr      nz,$5e61
5e41 2020      jr      nz,$5e63
5e43 2020      jr      nz,$5e65
5e45 2030      jr      nz,$5e77
5e47 323938    ld      ($3839),a
5e4a 48        ld      c,b
5e4b 2050      jr      nz,$5e9d
5e4d 55        ld      d,l
5e4e 42        ld      b,d
5e4f 2020      jr      nz,$5e71
5e51 40        ld      b,b
5e52 43        ld      b,e
5e53 41        ld      b,c
5e54 4c        ld      c,h
5e55 53        ld      d,e
5e56 2020      jr      nz,$5e78
5e58 2020      jr      nz,$5e7a
5e5a 2020      jr      nz,$5e7c
5e5c 2020      jr      nz,$5e7e
5e5e 2020      jr      nz,$5e80
5e60 2020      jr      nz,$5e82
5e62 2020      jr      nz,$5e84
5e64 2020      jr      nz,$5e86
5e66 2020      jr      nz,$5e88
5e68 2020      jr      nz,$5e8a
5e6a 2020      jr      nz,$5e8c
5e6c 2020      jr      nz,$5e8e
5e6e 2020      jr      nz,$5e90
5e70 2030      jr      nz,$5ea2
5e72 323432    ld      ($3234),a
5e75 48        ld      c,b
5e76 2050      jr      nz,$5ec8
5e78 55        ld      d,l
5e79 42        ld      b,d
5e7a 2020      jr      nz,$5e9c
5e7c 41        ld      b,c
5e7d 44        ld      b,h
5e7e 46        ld      b,(hl)
5e7f 4c        ld      c,h
5e80 47        ld      b,a
5e81 0d        dec     c
5e82 0a        ld      a,(bc)
5e83 3034      jr      nc,$5eb9
5e85 3842      jr      c,$5ec9
5e87 48        ld      c,b
5e88 2050      jr      nz,$5eda
5e8a 55        ld      d,l
5e8b 42        ld      b,d
5e8c 2020      jr      nz,$5eae
5e8e 41        ld      b,c
5e8f 4d        ld      c,l
5e90 53        ld      d,e
5e91 47        ld      b,a
5e92 2020      jr      nz,$5eb4
5e94 2020      jr      nz,$5eb6
5e96 2020      jr      nz,$5eb8
5e98 2020      jr      nz,$5eba
5e9a 2020      jr      nz,$5ebc
5e9c 2020      jr      nz,$5ebe
5e9e 2020      jr      nz,$5ec0
5ea0 2020      jr      nz,$5ec2
5ea2 2020      jr      nz,$5ec4
5ea4 2020      jr      nz,$5ec6
5ea6 2020      jr      nz,$5ec8
5ea8 2020      jr      nz,$5eca
5eaa 2020      jr      nz,$5ecc
5eac 2020      jr      nz,$5ece
5eae 3032      jr      nc,$5ee2
5eb0 34        inc     (hl)
5eb1 42        ld      b,d
5eb2 48        ld      c,b
5eb3 2050      jr      nz,$5f05
5eb5 55        ld      d,l
5eb6 42        ld      b,d
5eb7 2020      jr      nz,$5ed9
5eb9 41        ld      b,c
5eba 4e        ld      c,(hl)
5ebb 43        ld      b,e
5ebc 52        ld      d,d
5ebd 54        ld      d,h
5ebe 2020      jr      nz,$5ee0
5ec0 2020      jr      nz,$5ee2
5ec2 2020      jr      nz,$5ee4
5ec4 2020      jr      nz,$5ee6
5ec6 2020      jr      nz,$5ee8
5ec8 2020      jr      nz,$5eea
5eca 2020      jr      nz,$5eec
5ecc 2020      jr      nz,$5eee
5ece 2020      jr      nz,$5ef0
5ed0 2020      jr      nz,$5ef2
5ed2 2020      jr      nz,$5ef4
5ed4 2020      jr      nz,$5ef6
5ed6 2020      jr      nz,$5ef8
5ed8 2030      jr      nz,$5f0a
5eda 323443    ld      ($4334),a
5edd 48        ld      c,b
5ede 2050      jr      nz,$5f30
5ee0 55        ld      d,l
5ee1 42        ld      b,d
5ee2 2020      jr      nz,$5f04
5ee4 41        ld      b,c
5ee5 4e        ld      c,(hl)
5ee6 43        ld      b,e
5ee7 55        ld      d,l
5ee8 52        ld      d,d
5ee9 0d        dec     c
5eea 0a        ld      a,(bc)
5eeb 3034      jr      nc,$5f21
5eed 37        scf     
5eee 34        inc     (hl)
5eef 48        ld      c,b
5ef0 2050      jr      nz,$5f42
5ef2 55        ld      d,l
5ef3 42        ld      b,d
5ef4 2020      jr      nz,$5f16
5ef6 41        ld      b,c
5ef7 4e        ld      c,(hl)
5ef8 46        ld      b,(hl)
5ef9 4c        ld      c,h
5efa 53        ld      d,e
5efb 2020      jr      nz,$5f1d
5efd 2020      jr      nz,$5f1f
5eff 2020      jr      nz,$5f21
5f01 2020      jr      nz,$5f23
5f03 2020      jr      nz,$5f25
5f05 2020      jr      nz,$5f27
5f07 2020      jr      nz,$5f29
5f09 2020      jr      nz,$5f2b
5f0b 2020      jr      nz,$5f2d
5f0d 2020      jr      nz,$5f2f
5f0f 2020      jr      nz,$5f31
5f11 2020      jr      nz,$5f33
5f13 2020      jr      nz,$5f35
5f15 2030      jr      nz,$5f47
5f17 323944    ld      ($4439),a
5f1a 48        ld      c,b
5f1b 2050      jr      nz,$5f6d
5f1d 55        ld      d,l
5f1e 42        ld      b,d
5f1f 2020      jr      nz,$5f41
5f21 41        ld      b,c
5f22 4e        ld      c,(hl)
5f23 49        ld      c,c
5f24 4d        ld      c,l
5f25 53        ld      d,e
5f26 57        ld      d,a
5f27 2020      jr      nz,$5f49
5f29 2020      jr      nz,$5f4b
5f2b 2020      jr      nz,$5f4d
5f2d 2020      jr      nz,$5f4f
5f2f 2020      jr      nz,$5f51
5f31 2020      jr      nz,$5f53
5f33 2020      jr      nz,$5f55
5f35 2020      jr      nz,$5f57
5f37 2020      jr      nz,$5f59
5f39 2020      jr      nz,$5f5b
5f3b 2020      jr      nz,$5f5d
5f3d 2020      jr      nz,$5f5f
5f3f 2020      jr      nz,$5f61
5f41 3032      jr      nc,$5f75
5f43 34        inc     (hl)
5f44 45        ld      b,l
5f45 48        ld      c,b
5f46 2050      jr      nz,$5f98
5f48 55        ld      d,l
5f49 42        ld      b,d
5f4a 2020      jr      nz,$5f6c
5f4c 41        ld      b,c
5f4d 4e        ld      c,(hl)
5f4e 4d        ld      c,l
5f4f 41        ld      b,c
5f50 50        ld      d,b
5f51 0d        dec     c
5f52 0a        ld      a,(bc)
5f53 3032      jr      nc,$5f87
5f55 34        inc     (hl)
5f56 41        ld      b,c
5f57 48        ld      c,b
5f58 2050      jr      nz,$5faa
5f5a 55        ld      d,l
5f5b 42        ld      b,d
5f5c 2020      jr      nz,$5f7e
5f5e 41        ld      b,c
5f5f 4e        ld      c,(hl)
5f60 4d        ld      c,l
5f61 45        ld      b,l
5f62 4d        ld      c,l
5f63 2020      jr      nz,$5f85
5f65 2026      jr      nz,$5f8d
5f67 5a        ld      e,d
5f68 2a0000    ld      hl,($0000)
5f6b 00        nop     
5f6c 00        nop     
5f6d 00        nop     
5f6e 00        nop     
5f6f 00        nop     
5f70 00        nop     
5f71 00        nop     
5f72 00        nop     
5f73 00        nop     
5f74 00        nop     
5f75 00        nop     
5f76 00        nop     
5f77 00        nop     
5f78 00        nop     
5f79 00        nop     
5f7a 00        nop     
5f7b 00        nop     
5f7c 00        nop     
5f7d 00        nop     
5f7e 00        nop     
5f7f 00        nop     
5f80 00        nop     
5f81 00        nop     
5f82 00        nop     
5f83 00        nop     
5f84 00        nop     
5f85 00        nop     
5f86 00        nop     
5f87 00        nop     
5f88 00        nop     
5f89 00        nop     
5f8a 00        nop     
5f8b 00        nop     
5f8c 00        nop     
5f8d 00        nop     
5f8e 00        nop     
5f8f 00        nop     
5f90 00        nop     
5f91 00        nop     
5f92 00        nop     
5f93 00        nop     
5f94 6a        ld      l,d
5f95 5f        ld      e,a
5f96 00        nop     
5f97 00        nop     
5f98 00        nop     
5f99 00        nop     
5f9a 00        nop     
5f9b 00        nop     
5f9c 010000    ld      bc,$0000
5f9f 00        nop     
5fa0 00        nop     
5fa1 00        nop     
5fa2 00        nop     
5fa3 00        nop     
5fa4 02        ld      (bc),a
5fa5 00        nop     
5fa6 00        nop     
5fa7 00        nop     
5fa8 00        nop     
5fa9 00        nop     
5faa 00        nop     
5fab 00        nop     
5fac 03        inc     bc
5fad 00        nop     
5fae 00        nop     
5faf 00        nop     
5fb0 00        nop     
5fb1 00        nop     
5fb2 00        nop     
5fb3 00        nop     
5fb4 04        inc     b
5fb5 00        nop     
5fb6 00        nop     
5fb7 00        nop     
5fb8 00        nop     
5fb9 00        nop     
5fba 00        nop     
5fbb 00        nop     
5fbc 05        dec     b
5fbd 00        nop     
5fbe 00        nop     
5fbf 00        nop     
5fc0 00        nop     
5fc1 00        nop     
5fc2 00        nop     
5fc3 00        nop     
5fc4 0600      ld      b,$00
5fc6 00        nop     
5fc7 00        nop     
5fc8 00        nop     
5fc9 00        nop     
5fca 00        nop     
5fcb 47        ld      b,a
5fcc 2020      jr      nz,$5fee
5fce 2020      jr      nz,$5ff0
5fd0 2020      jr      nz,$5ff2
5fd2 2020      jr      nz,$5ff4
5fd4 2020      jr      nz,$5ff6
5fd6 2020      jr      nz,$5ff8
5fd8 2020      jr      nz,$5ffa
5fda 2020      jr      nz,$5ffc
5fdc 2020      jr      nz,$5ffe
5fde 2020      jr      nz,$6000
5fe0 2020      jr      nz,$6002
5fe2 2020      jr      nz,$6004
5fe4 2020      jr      nz,$6006
5fe6 3033      jr      nc,$601b
5fe8 39        add     hl,sp
5fe9 324820    ld      ($2048),a
5fec 50        ld      d,b
5fed 55        ld      d,l
5fee 42        ld      b,d
5fef 2020      jr      nz,$6011
5ff1 43        ld      b,e
5ff2 44        ld      b,h
5ff3 52        ld      d,d
5ff4 45        ld      b,l
5ff5 53        ld      d,e
5ff6 2020      jr      nz,$6018
5ff8 2020      jr      nz,$601a
5ffa 00        nop     
5ffb 2020      jr      nz,$601d
5ffd 2020      jr      nz,$601f
5fff 2020      jr      nz,$6021
6001 2020      jr      nz,$6023
6003 2020      jr      nz,$6025
6005 2020      jr      nz,$6027
6007 2020      jr      nz,$6029
6009 2020      jr      nz,$602b
600b 2020      jr      nz,$602d
600d 2020      jr      nz,$602f
600f 2020      jr      nz,$6031
6011 3032      jr      nc,$6045
6013 39        add     hl,sp
6014 33        inc     sp
6015 48        ld      c,b
6016 2050      jr      nz,$6068
6018 55        ld      d,l
6019 42        ld      b,d
601a 2020      jr      nz,$603c
601c 43        ld      b,e
601d 44        ld      b,h
601e 53        ld      d,e
601f 54        ld      d,h
6020 54        ld      d,h
6021 0d        dec     c
6022 0a        ld      a,(bc)
6023 3033      jr      nc,$6058
6025 3034      jr      nc,$605b
6027 48        ld      c,b
6028 2050      jr      nz,$607a
602a 00        nop     
602b 42        ld      b,d
602c 2020      jr      nz,$604e
602e 43        ld      b,e
602f 49        ld      c,c
6030 43        ld      b,e
6031 48        ld      c,b
6032 41        ld      b,c
6033 52        ld      d,d
6034 2020      jr      nz,$6056
6036 2020      jr      nz,$6058
6038 2020      jr      nz,$605a
603a 2020      jr      nz,$605c
603c 2020      jr      nz,$605e
603e 2020      jr      nz,$6060
6040 2020      jr      nz,$6062
6042 2020      jr      nz,$6064
6044 2020      jr      nz,$6066
6046 2020      jr      nz,$6068
6048 2020      jr      nz,$606a
604a 2020      jr      nz,$606c
604c 2020      jr      nz,$606e
604e 3033      jr      nc,$6083
6050 3035      jr      nc,$6087
6052 48        ld      c,b
6053 2050      jr      nz,$60a5
6055 55        ld      d,l
6056 42        ld      b,d
6057 2020      jr      nz,$6079
6059 43        ld      b,e
605a 00        nop     
605b 46        ld      b,(hl)
605c 43        ld      b,e
605d 44        ld      b,h
605e 2020      jr      nz,$6080
6060 2020      jr      nz,$6082
6062 2020      jr      nz,$6084
6064 2020      jr      nz,$6086
6066 2020      jr      nz,$6088
6068 2020      jr      nz,$608a
606a 2020      jr      nz,$608c
606c 2020      jr      nz,$608e
606e 2020      jr      nz,$6090
6070 2020      jr      nz,$6092
6072 2020      jr      nz,$6094
6074 2020      jr      nz,$6096
6076 2020      jr      nz,$6098
6078 2030      jr      nz,$60aa
607a 324134    ld      ($3441),a
607d 48        ld      c,b
607e 2050      jr      nz,$60d0
6080 55        ld      d,l
6081 42        ld      b,d
6082 2020      jr      nz,$60a4
6084 43        ld      b,e
6085 4c        ld      c,h
6086 44        ld      b,h
6087 4f        ld      c,a
6088 46        ld      b,(hl)
6089 46        ld      b,(hl)
608a 00        nop     
608b 0a        ld      a,(bc)
608c 3032      jr      nc,$60c0
608e 41        ld      b,c
608f 3048      jr      nc,$60d9
6091 2050      jr      nz,$60e3
6093 55        ld      d,l
6094 42        ld      b,d
6095 2020      jr      nz,$60b7
6097 43        ld      b,e
6098 4c        ld      c,h
6099 49        ld      c,c
609a 4f        ld      c,a
609b 46        ld      b,(hl)
609c 46        ld      b,(hl)
609d 2020      jr      nz,$60bf
609f 2020      jr      nz,$60c1
60a1 2020      jr      nz,$60c3
60a3 2020      jr      nz,$60c5
60a5 2020      jr      nz,$60c7
60a7 2020      jr      nz,$60c9
60a9 2020      jr      nz,$60cb
60ab 2020      jr      nz,$60cd
60ad 2020      jr      nz,$60cf
60af 2020      jr      nz,$60d1
60b1 2020      jr      nz,$60d3
60b3 2020      jr      nz,$60d5
60b5 2020      jr      nz,$60d7
60b7 3032      jr      nc,$60eb
60b9 41        ld      b,c
60ba 00        nop     
60bb 48        ld      c,b
60bc 2050      jr      nz,$610e
60be 55        ld      d,l
60bf 42        ld      b,d
60c0 2020      jr      nz,$60e2
60c2 43        ld      b,e
60c3 4c        ld      c,h
60c4 4c        ld      c,h
60c5 4f        ld      c,a
60c6 46        ld      b,(hl)
60c7 46        ld      b,(hl)
60c8 2020      jr      nz,$60ea
60ca 2020      jr      nz,$60ec
60cc 2020      jr      nz,$60ee
60ce 2020      jr      nz,$60f0
60d0 2020      jr      nz,$60f2
60d2 2020      jr      nz,$60f4
60d4 2020      jr      nz,$60f6
60d6 2020      jr      nz,$60f8
60d8 2020      jr      nz,$60fa
60da 2020      jr      nz,$60fc
60dc 2020      jr      nz,$60fe
60de 2020      jr      nz,$6100
60e0 2020      jr      nz,$6102
60e2 3032      jr      nc,$6116
60e4 3838      jr      c,$611e
60e6 48        ld      c,b
60e7 2050      jr      nz,$6139
60e9 55        ld      d,l
60ea 00        nop     
60eb 00        nop     
60ec 00        nop     
60ed 00        nop     
60ee 00        nop     
60ef 00        nop     
60f0 00        nop     
60f1 00        nop     
60f2 00        nop     
60f3 00        nop     
60f4 00        nop     
60f5 00        nop     
60f6 00        nop     
60f7 210000    ld      hl,$0000
60fa 39        add     hl,sp
60fb 222159    ld      ($5921),hl
60fe 2a1d02    ld      hl,($021d)
6101 7e        ld      a,(hl)
6102 32025a    ld      ($5a02),a
6105 eb        ex      de,hl
6106 22fe59    ld      ($59fe),hl
6109 0a        ld      a,(bc)
610a e60f      and     $0f
610c 32005a    ld      ($5a00),a
610f 03        inc     bc
6110 0a        ld      a,(bc)
6111 32015a    ld      ($5a01),a
6114 110800    ld      de,$0008
6117 cd8263    call    $6382
611a 3a025a    ld      a,($5a02)
611d b7        or      a
611e c22561    jp      nz,$6125
6121 7a        ld      a,d
6122 32025a    ld      ($5a02),a
6125 210000    ld      hl,$0000
6128 22c85f    ld      ($5fc8),hl
612b 6a        ld      l,d
612c 222d59    ld      ($592d),hl
612f 23        inc     hl
6130 23        inc     hl
6131 22f659    ld      ($59f6),hl
6134 af        xor     a
6135 32fd59    ld      ($59fd),a
6138 321859    ld      ($5918),a
613b 32ea60    ld      ($60ea),a
613e 3a005a    ld      a,($5a00)
6141 01aa00    ld      bc,$00aa
6144 6f        ld      l,a
6145 29        add     hl,hl
6146 114f61    ld      de,$614f
6149 19        add     hl,de
614a 5e        ld      e,(hl)
614b 23        inc     hl
614c 56        ld      d,(hl)
614d eb        ex      de,hl
614e e9        jp      (hl)
614f a9        xor     c
6150 6d        ld      l,l
6151 9b        sbc     a,e
6152 63        ld      h,e
6153 9b        sbc     a,e
6154 63        ld      h,e
6155 86        add     a,(hl)
6156 62        ld      h,d
6157 2d        dec     l
6158 63        ld      h,e
6159 e8        ret     pe

615a 61        ld      h,c
615b d1        pop     de
615c 61        ld      h,c
615d 54        ld      d,h
615e 62        ld      h,d
615f 7a        ld      a,d
6160 61        ld      h,c
6161 9b        sbc     a,e
6162 63        ld      h,e
6163 65        ld      h,l
6164 61        ld      h,c
6165 3a015a    ld      a,($5a01)
6168 ded8      sbc     a,$d8
616a da9b63    jp      c,$639b
616d de02      sbc     a,$02
616f dae861    jp      c,$61e8
6172 de02      sbc     a,$02
6174 dad161    jp      c,$61d1
6177 c39b63    jp      $639b
617a cd6f63    call    $636f
617d 1f        rra     
617e 01ab00    ld      bc,$00ab
6181 da9b63    jp      c,$639b
6184 cd7763    call    $6377
6187 3a015a    ld      a,($5a01)
618a 32fd59    ld      ($59fd),a
618d fe02      cp      $02
618f c29e61    jp      nz,$619e
6192 3a025a    ld      a,($5a02)
6195 4f        ld      c,a
6196 e5        push    hl
6197 cd1662    call    $6216
619a e1        pop     hl
619b caaf63    jp      z,$63af
619e cdef66    call    $66ef
61a1 3afd59    ld      a,($59fd)
61a4 caaf61    jp      z,$61af
61a7 d2af63    jp      nc,$63af
61aa fe02      cp      $02
61ac daaf63    jp      c,$63af
61af cd3b62    call    $623b
61b2 2a2d59    ld      hl,($592d)
61b5 eb        ex      de,hl
61b6 cd1f62    call    $621f
61b9 3ec0      ld      a,$c0
61bb cdbf61    call    $61bf
61be c9        ret     

61bf e5        push    hl
61c0 f5        push    af
61c1 2ac85f    ld      hl,($5fc8)
61c4 7d        ld      a,l
61c5 b4        or      h
61c6 c2cc61    jp      nz,$61cc
61c9 f1        pop     af
61ca e1        pop     hl
61cb c9        ret     

61cc f1        pop     af
61cd 23        inc     hl
61ce 77        ld      (hl),a
61cf e1        pop     hl
61d0 c9        ret     

61d1 cd6f63    call    $636f
61d4 1f        rra     
61d5 01ab00    ld      bc,$00ab
61d8 da9b63    jp      c,$639b
61db cd7763    call    $6377
61de cdef66    call    $66ef
61e1 c2af63    jp      nz,$63af
61e4 cd2962    call    $6229
61e7 c9        ret     

61e8 cd6f63    call    $636f
61eb 1f        rra     
61ec 01ab00    ld      bc,$00ab
61ef da9b63    jp      c,$639b
61f2 111f00    ld      de,$001f
61f5 cd8a63    call    $638a
61f8 d5        push    de
61f9 2a2d59    ld      hl,($592d)
61fc 4d        ld      c,l
61fd eb        ex      de,hl
61fe cd1662    call    $6216
6201 e1        pop     hl
6202 cdef66    call    $66ef
6205 da1262    jp      c,$6212
6208 ca1262    jp      z,$6212
620b 0e30      ld      c,$30
620d 3e31      ld      a,$31
620f c3b763    jp      $63b7
6212 cd2962    call    $6229
6215 c9        ret     

6216 09        add     hl,bc
6217 2b        dec     hl
6218 34        inc     (hl)
6219 c0        ret     nz

621a 0d        dec     c
621b c8        ret     z

621c c31762    jp      $6217
621f 2b        dec     hl
6220 7e        ld      a,(hl)
6221 35        dec     (hl)
6222 b7        or      a
6223 c0        ret     nz

6224 1d        dec     e
6225 c8        ret     z

6226 c31f62    jp      $621f
6229 cd3b62    call    $623b
622c 5e        ld      e,(hl)
622d 23        inc     hl
622e 56        ld      d,(hl)
622f cd6d63    call    $636d
6232 cd206a    call    $6a20
6235 3e80      ld      a,$80
6237 cdbf61    call    $61bf
623a c9        ret     

623b eb        ex      de,hl
623c 2a2d59    ld      hl,($592d)
623f e5        push    hl
6240 eb        ex      de,hl
6241 cd8a6d    call    $6d8a
6244 e5        push    hl
6245 111f00    ld      de,$001f
6248 cd8263    call    $6382
624b 63        ld      h,e
624c 6a        ld      l,d
624d d1        pop     de
624e c1        pop     bc
624f cdcb65    call    $65cb
6252 eb        ex      de,hl
6253 c9        ret     

6254 cd6f63    call    $636f
6257 fe02      cp      $02
6259 01ac00    ld      bc,$00ac
625c c29b63    jp      nz,$639b
625f cd7763    call    $6377
6262 cdef66    call    $66ef
6265 c2af63    jp      nz,$63af
6268 af        xor     a
6269 cdbf61    call    $61bf
626c 5e        ld      e,(hl)
626d 23        inc     hl
626e 56        ld      d,(hl)
626f 2b        dec     hl
6270 d5        push    de
6271 cdfc65    call    $65fc
6274 d1        pop     de
6275 d5        push    de
6276 cd6d63    call    $636d
6279 e5        push    hl
627a 2607      ld      h,$07
627c e3        ex      (sp),hl
627d cdae6a    call    $6aae
6280 d1        pop     de
6281 af        xor     a
6282 cd646b    call    $6b64
6285 c9        ret     

6286 cd6f63    call    $636f
6289 01ad00    ld      bc,$00ad
628c b7        or      a
628d ca9b63    jp      z,$639b
6290 cd7763    call    $6377
6293 e5        push    hl
6294 2afe59    ld      hl,($59fe)
6297 eb        ex      de,hl
6298 210600    ld      hl,$0006
629b 19        add     hl,de
629c 7e        ld      a,(hl)
629d e67f      and     $7f
629f fe00      cp      $00
62a1 c2d562    jp      nz,$62d5
62a4 23        inc     hl
62a5 7e        ld      a,(hl)
62a6 fe01      cp      $01
62a8 c2d562    jp      nz,$62d5
62ab 211f00    ld      hl,$001f
62ae 19        add     hl,de
62af 5e        ld      e,(hl)
62b0 23        inc     hl
62b1 56        ld      d,(hl)
62b2 e1        pop     hl
62b3 e5        push    hl
62b4 eb        ex      de,hl
62b5 cdbe69    call    $69be
62b8 e1        pop     hl
62b9 daa563    jp      c,$63a5
62bc c2d062    jp      nz,$62d0
62bf e5        push    hl
62c0 af        xor     a
62c1 cdca72    call    $72ca
62c4 212300    ld      hl,$0023
62c7 19        add     hl,de
62c8 7e        ld      a,(hl)
62c9 fe80      cp      $80
62cb e1        pop     hl
62cc caaa63    jp      z,$63aa
62cf e5        push    hl
62d0 af        xor     a
62d1 3c        inc     a
62d2 c3d662    jp      $62d6
62d5 af        xor     a
62d6 e1        pop     hl
62d7 32ea60    ld      ($60ea),a
62da cdef66    call    $66ef
62dd c2ea62    jp      nz,$62ea
62e0 3aea60    ld      a,($60ea)
62e3 b7        or      a
62e4 caaa63    jp      z,$63aa
62e7 c3a563    jp      $63a5
62ea af        xor     a
62eb cdbf61    call    $61bf
62ee c5        push    bc
62ef e5        push    hl
62f0 af        xor     a
62f1 cd336b    call    $6b33
62f4 d5        push    de
62f5 cd6d63    call    $636d
62f8 cd7f6a    call    $6a7f
62fb cd4b63    call    $634b
62fe d1        pop     de
62ff e1        pop     hl
6300 c1        pop     bc
6301 3aea60    ld      a,($60ea)
6304 b7        or      a
6305 ca0d63    jp      z,$630d
6308 3e80      ld      a,$80
630a cdbf61    call    $61bf
630d cdc663    call    $63c6
6310 3aea60    ld      a,($60ea)
6313 b7        or      a
6314 c8        ret     z

6315 cd7763    call    $6377
6318 e5        push    hl
6319 111f00    ld      de,$001f
631c 2afe59    ld      hl,($59fe)
631f 19        add     hl,de
6320 5e        ld      e,(hl)
6321 23        inc     hl
6322 56        ld      d,(hl)
6323 2a2d59    ld      hl,($592d)
6326 e3        ex      (sp),hl
6327 c1        pop     bc
6328 eb        ex      de,hl
6329 cdcb65    call    $65cb
632c c9        ret     

632d cd6f63    call    $636f
6330 fe02      cp      $02
6332 019800    ld      bc,$0098
6335 c29b63    jp      nz,$639b
6338 cd7763    call    $6377
633b cdef66    call    $66ef
633e c2af63    jp      nz,$63af
6341 5e        ld      e,(hl)
6342 23        inc     hl
6343 56        ld      d,(hl)
6344 cd6d63    call    $636d
6347 cd7f6a    call    $6a7f
634a c9        ret     

634b 2a2d59    ld      hl,($592d)
634e eb        ex      de,hl
634f 210200    ld      hl,$0002
6352 19        add     hl,de
6353 22f659    ld      ($59f6),hl
6356 eb        ex      de,hl
6357 210600    ld      hl,$0006
635a 0600      ld      b,$00
635c 19        add     hl,de
635d 04        inc     b
635e 7c        ld      a,h
635f b7        or      a
6360 ca5c63    jp      z,$635c
6363 af        xor     a
6364 b5        or      l
6365 212c59    ld      hl,$592c
6368 70        ld      (hl),b
6369 c0        ret     nz

636a 04        inc     b
636b 70        ld      (hl),b
636c c9        ret     

636d af        xor     a
636e c9        ret     

636f 110700    ld      de,$0007
6372 cd8263    call    $6382
6375 7a        ld      a,d
6376 c9        ret     

6377 110900    ld      de,$0009
637a cd8263    call    $6382
637d 2a1d02    ld      hl,($021d)
6380 19        add     hl,de
6381 c9        ret     

6382 2afe59    ld      hl,($59fe)
6385 19        add     hl,de
6386 56        ld      d,(hl)
6387 23        inc     hl
6388 5e        ld      e,(hl)
6389 c9        ret     

638a 2afe59    ld      hl,($59fe)
638d 19        add     hl,de
638e 5e        ld      e,(hl)
638f 23        inc     hl
6390 56        ld      d,(hl)
6391 c9        ret     

6392 01c700    ld      bc,$00c7
6395 c39b63    jp      $639b
6398 019c00    ld      bc,$009c
639b 3e39      ld      a,$39
639d cdb763    call    $63b7
63a0 2a2159    ld      hl,($5921)
63a3 f9        ld      sp,hl
63a4 c9        ret     

63a5 0e31      ld      c,$31
63a7 c3b163    jp      $63b1
63aa 0e32      ld      c,$32
63ac c3b163    jp      $63b1
63af 0e33      ld      c,$33
63b1 3e32      ld      a,$32
63b3 cdb763    call    $63b7
63b6 c9        ret     

63b7 110000    ld      de,$0000
63ba 2afe59    ld      hl,($59fe)
63bd 19        add     hl,de
63be 77        ld      (hl),a
63bf 23        inc     hl
63c0 71        ld      (hl),c
63c1 af        xor     a
63c2 cdbf61    call    $61bf
63c5 c9        ret     

63c6 af        xor     a
63c7 32eb60    ld      ($60eb),a
63ca cd8169    call    $6981
63cd d5        push    de
63ce eb        ex      de,hl
63cf 2a2d59    ld      hl,($592d)
63d2 eb        ex      de,hl
63d3 cd8a6d    call    $6d8a
63d6 22f459    ld      ($59f4),hl
63d9 e5        push    hl
63da 210000    ld      hl,$0000
63dd 13        inc     de
63de 13        inc     de
63df cdd665    call    $65d6
63e2 44        ld      b,h
63e3 4d        ld      c,l
63e4 e1        pop     hl
63e5 2b        dec     hl
63e6 09        add     hl,bc
63e7 e5        push    hl
63e8 19        add     hl,de
63e9 d1        pop     de
63ea cdc065    call    $65c0
63ed 2afb59    ld      hl,($59fb)
63f0 eb        ex      de,hl
63f1 2a2d59    ld      hl,($592d)
63f4 44        ld      b,h
63f5 4d        ld      c,l
63f6 2af459    ld      hl,($59f4)
63f9 cdcb65    call    $65cb
63fc d1        pop     de
63fd 73        ld      (hl),e
63fe 23        inc     hl
63ff 72        ld      (hl),d
6400 2aee59    ld      hl,($59ee)
6403 34        inc     (hl)
6404 3a2c59    ld      a,($592c)
6407 be        cp      (hl)
6408 ca1d64    jp      z,$641d
640b 3aeb60    ld      a,($60eb)
640e b7        or      a
640f c21964    jp      nz,$6419
6412 3aea60    ld      a,($60ea)
6415 b7        or      a
6416 c2ff64    jp      nz,$64ff
6419 cddc65    call    $65dc
641c c9        ret     

641d 3aea60    ld      a,($60ea)
6420 b7        or      a
6421 ca2e64    jp      z,$642e
6424 32eb60    ld      ($60eb),a
6427 af        xor     a
6428 cdbf61    call    $61bf
642b 32ec60    ld      ($60ec),a
642e cd2d65    call    $652d
6431 cddc65    call    $65dc
6434 cd6a65    call    $656a
6437 2ac65f    ld      hl,($5fc6)
643a 2b        dec     hl
643b 56        ld      d,(hl)
643c 2b        dec     hl
643d 5e        ld      e,(hl)
643e 7a        ld      a,d
643f b3        or      e
6440 ca9964    jp      z,$6499
6443 e5        push    hl
6444 3aec59    ld      a,($59ec)
6447 21d456    ld      hl,$56d4
644a eb        ex      de,hl
644b 01fe00    ld      bc,$00fe
644e cd026a    call    $6a02
6451 2a2d59    ld      hl,($592d)
6454 44        ld      b,h
6455 4d        ld      c,l
6456 e1        pop     hl
6457 2b        dec     hl
6458 56        ld      d,(hl)
6459 2b        dec     hl
645a 5e        ld      e,(hl)
645b e5        push    hl
645c 21d756    ld      hl,$56d7
645f 22ee59    ld      ($59ee),hl
6462 19        add     hl,de
6463 e5        push    hl
6464 eb        ex      de,hl
6465 2a2d59    ld      hl,($592d)
6468 eb        ex      de,hl
6469 cd8a6d    call    $6d8a
646c 113459    ld      de,$5934
646f cdcb65    call    $65cb
6472 2af659    ld      hl,($59f6)
6475 eb        ex      de,hl
6476 213459    ld      hl,$5934
6479 3a2f59    ld      a,($592f)
647c 47        ld      b,a
647d cdd665    call    $65d6
6480 22fb59    ld      ($59fb),hl
6483 d1        pop     de
6484 e1        pop     hl
6485 2b        dec     hl
6486 46        ld      b,(hl)
6487 22c65f    ld      ($5fc6),hl
648a 2af659    ld      hl,($59f6)
648d 19        add     hl,de
648e eb        ex      de,hl
648f 2a3259    ld      hl,($5932)
6492 eb        ex      de,hl
6493 cd2265    call    $6522
6496 c3cd63    jp      $63cd
6499 cd6669    call    $6966
649c 3e01      ld      a,$01
649e cd336b    call    $6b33
64a1 eb        ex      de,hl
64a2 22c756    ld      ($56c7),hl
64a5 e5        push    hl
64a6 01fe00    ld      bc,$00fe
64a9 21d456    ld      hl,$56d4
64ac af        xor     a
64ad cd7b6d    call    $6d7b
64b0 cd2b6a    call    $6a2b
64b3 21d456    ld      hl,$56d4
64b6 d1        pop     de
64b7 3aec59    ld      a,($59ec)
64ba 77        ld      (hl),a
64bb 23        inc     hl
64bc 73        ld      (hl),e
64bd 23        inc     hl
64be 72        ld      (hl),d
64bf 3e02      ld      a,$02
64c1 23        inc     hl
64c2 22ee59    ld      ($59ee),hl
64c5 77        ld      (hl),a
64c6 3d        dec     a
64c7 23        inc     hl
64c8 77        ld      (hl),a
64c9 23        inc     hl
64ca 110000    ld      de,$0000
64cd 73        ld      (hl),e
64ce 23        inc     hl
64cf 72        ld      (hl),d
64d0 23        inc     hl
64d1 eb        ex      de,hl
64d2 2a2d59    ld      hl,($592d)
64d5 44        ld      b,h
64d6 4d        ld      c,l
64d7 c5        push    bc
64d8 eb        ex      de,hl
64d9 113459    ld      de,$5934
64dc cdcb65    call    $65cb
64df d5        push    de
64e0 eb        ex      de,hl
64e1 2a3059    ld      hl,($5930)
64e4 eb        ex      de,hl
64e5 73        ld      (hl),e
64e6 23        inc     hl
64e7 72        ld      (hl),d
64e8 23        inc     hl
64e9 d1        pop     de
64ea 13        inc     de
64eb 13        inc     de
64ec c1        pop     bc
64ed cdcb65    call    $65cb
64f0 eb        ex      de,hl
64f1 2a3259    ld      hl,($5932)
64f4 eb        ex      de,hl
64f5 73        ld      (hl),e
64f6 23        inc     hl
64f7 72        ld      (hl),d
64f8 cddc65    call    $65dc
64fb cd5f6d    call    $6d5f
64fe c9        ret     

64ff af        xor     a
6500 3c        inc     a
6501 32ec60    ld      ($60ec),a
6504 2aee59    ld      hl,($59ee)
6507 22ef60    ld      ($60ef),hl
650a 3aec59    ld      a,($59ec)
650d 32f160    ld      ($60f1),a
6510 2ac65f    ld      hl,($5fc6)
6513 23        inc     hl
6514 5e        ld      e,(hl)
6515 23        inc     hl
6516 56        ld      d,(hl)
6517 e5        push    hl
6518 2af659    ld      hl,($59f6)
651b 19        add     hl,de
651c eb        ex      de,hl
651d e1        pop     hl
651e 72        ld      (hl),d
651f 2b        dec     hl
6520 73        ld      (hl),e
6521 c9        ret     

6522 cd2b6a    call    $6a2b
6525 af        xor     a
6526 32d456    ld      ($56d4),a
6529 32f657    ld      ($57f6),a
652c c9        ret     

652d 2aee59    ld      hl,($59ee)
6530 af        xor     a
6531 3a2c59    ld      a,($592c)
6534 1f        rra     
6535 4f        ld      c,a
6536 322f59    ld      ($592f),a
6539 7e        ld      a,(hl)
653a 91        sub     c
653b 77        ld      (hl),a
653c 47        ld      b,a
653d 23        inc     hl
653e 7e        ld      a,(hl)
653f 32f859    ld      ($59f8),a
6542 23        inc     hl
6543 3601      ld      (hl),$01
6545 23        inc     hl
6546 23        inc     hl
6547 eb        ex      de,hl
6548 05        dec     b
6549 2af659    ld      hl,($59f6)
654c eb        ex      de,hl
654d cdd665    call    $65d6
6550 e5        push    hl
6551 41        ld      b,c
6552 04        inc     b
6553 210000    ld      hl,$0000
6556 cdd665    call    $65d6
6559 44        ld      b,h
655a 4d        ld      c,l
655b d1        pop     de
655c 213459    ld      hl,$5934
655f cdcb65    call    $65cb
6562 cdf265    call    $65f2
6565 eb        ex      de,hl
6566 223059    ld      ($5930),hl
6569 c9        ret     

656a 3e01      ld      a,$01
656c cd336b    call    $6b33
656f d5        push    de
6570 eb        ex      de,hl
6571 223259    ld      ($5932),hl
6574 cd2b6a    call    $6a2b
6577 21f657    ld      hl,$57f6
657a 010101    ld      bc,$0101
657d af        xor     a
657e cd7b6d    call    $6d7b
6581 21f657    ld      hl,$57f6
6584 3aec59    ld      a,($59ec)
6587 77        ld      (hl),a
6588 23        inc     hl
6589 d1        pop     de
658a 73        ld      (hl),e
658b 23        inc     hl
658c 72        ld      (hl),d
658d 23        inc     hl
658e 22ee59    ld      ($59ee),hl
6591 3a2f59    ld      a,($592f)
6594 77        ld      (hl),a
6595 47        ld      b,a
6596 3af859    ld      a,($59f8)
6599 23        inc     hl
659a 77        ld      (hl),a
659b 113459    ld      de,$5934
659e 2af659    ld      hl,($59f6)
65a1 eb        ex      de,hl
65a2 19        add     hl,de
65a3 e5        push    hl
65a4 22e859    ld      ($59e8),hl
65a7 210000    ld      hl,$0000
65aa cdd665    call    $65d6
65ad 44        ld      b,h
65ae 4d        ld      c,l
65af 21fb57    ld      hl,$57fb
65b2 3601      ld      (hl),$01
65b4 23        inc     hl
65b5 3600      ld      (hl),$00
65b7 23        inc     hl
65b8 d1        pop     de
65b9 cdcb65    call    $65cb
65bc cddc65    call    $65dc
65bf c9        ret     

65c0 78        ld      a,b
65c1 b1        or      c
65c2 c8        ret     z

65c3 1a        ld      a,(de)
65c4 77        ld      (hl),a
65c5 1b        dec     de
65c6 2b        dec     hl
65c7 0b        dec     bc
65c8 c3c065    jp      $65c0
65cb 78        ld      a,b
65cc b1        or      c
65cd c8        ret     z

65ce 1a        ld      a,(de)
65cf 77        ld      (hl),a
65d0 23        inc     hl
65d1 13        inc     de
65d2 0b        dec     bc
65d3 c3cb65    jp      $65cb
65d6 05        dec     b
65d7 f8        ret     m

65d8 19        add     hl,de
65d9 c3d665    jp      $65d6
65dc cdf265    call    $65f2
65df 3e01      ld      a,$01
65e1 01fe00    ld      bc,$00fe
65e4 cd7f6a    call    $6a7f
65e7 c9        ret     

65e8 21f757    ld      hl,$57f7
65eb 5e        ld      e,(hl)
65ec 23        inc     hl
65ed 56        ld      d,(hl)
65ee 23        inc     hl
65ef c3df65    jp      $65df
65f2 2aee59    ld      hl,($59ee)
65f5 2b        dec     hl
65f6 56        ld      d,(hl)
65f7 2b        dec     hl
65f8 5e        ld      e,(hl)
65f9 23        inc     hl
65fa 23        inc     hl
65fb c9        ret     

65fc af        xor     a
65fd 321f59    ld      ($591f),a
6600 5e        ld      e,(hl)
6601 23        inc     hl
6602 56        ld      d,(hl)
6603 2b        dec     hl
6604 22f059    ld      ($59f0),hl
6607 2aee59    ld      hl,($59ee)
660a 35        dec     (hl)
660b c25a66    jp      nz,$665a
660e 23        inc     hl
660f 23        inc     hl
6610 7e        ld      a,(hl)
6611 23        inc     hl
6612 b6        or      (hl)
6613 ca4a66    jp      z,$664a
6616 cdf265    call    $65f2
6619 d5        push    de
661a 211f59    ld      hl,$591f
661d 34        inc     (hl)
661e 2ac65f    ld      hl,($5fc6)
6621 2b        dec     hl
6622 56        ld      d,(hl)
6623 2b        dec     hl
6624 5e        ld      e,(hl)
6625 e5        push    hl
6626 cd2265    call    $6522
6629 21f657    ld      hl,$57f6
662c eb        ex      de,hl
662d 01fe00    ld      bc,$00fe
6630 3aec59    ld      a,($59ec)
6633 cd026a    call    $6a02
6636 e1        pop     hl
6637 2b        dec     hl
6638 56        ld      d,(hl)
6639 2b        dec     hl
663a 5e        ld      e,(hl)
663b 2b        dec     hl
663c 46        ld      b,(hl)
663d 22c65f    ld      ($5fc6),hl
6640 21f957    ld      hl,$57f9
6643 22ee59    ld      ($59ee),hl
6646 19        add     hl,de
6647 c30066    jp      $6600
664a 2aee59    ld      hl,($59ee)
664d 01fe00    ld      bc,$00fe
6650 af        xor     a
6651 cd7b6d    call    $6d7b
6654 cddc65    call    $65dc
6657 c38866    jp      $6688
665a 2a2d59    ld      hl,($592d)
665d eb        ex      de,hl
665e c5        push    bc
665f 2af059    ld      hl,($59f0)
6662 cd8a6d    call    $6d8a
6665 e5        push    hl
6666 13        inc     de
6667 13        inc     de
6668 d5        push    de
6669 cd8a6d    call    $6d8a
666c 22e859    ld      ($59e8),hl
666f 210000    ld      hl,$0000
6672 cdd665    call    $65d6
6675 44        ld      b,h
6676 4d        ld      c,l
6677 e1        pop     hl
6678 d1        pop     de
6679 19        add     hl,de
667a eb        ex      de,hl
667b cdcb65    call    $65cb
667e cddc65    call    $65dc
6681 c1        pop     bc
6682 cd9866    call    $6698
6685 cd2265    call    $6522
6688 211f59    ld      hl,$591f
668b 7e        ld      a,(hl)
668c b7        or      a
668d c8        ret     z

668e 35        dec     (hl)
668f d1        pop     de
6690 3e01      ld      a,$01
6692 cd646b    call    $6b64
6695 c38866    jp      $6688
6698 3e01      ld      a,$01
669a b8        cp      b
669b c0        ret     nz

669c 2a2d59    ld      hl,($592d)
669f 44        ld      b,h
66a0 4d        ld      c,l
66a1 2ae859    ld      hl,($59e8)
66a4 eb        ex      de,hl
66a5 213459    ld      hl,$5934
66a8 cdcb65    call    $65cb
66ab 2ac65f    ld      hl,($5fc6)
66ae 2b        dec     hl
66af 56        ld      d,(hl)
66b0 2b        dec     hl
66b1 5e        ld      e,(hl)
66b2 7a        ld      a,d
66b3 b3        or      e
66b4 c8        ret     z

66b5 e5        push    hl
66b6 21d456    ld      hl,$56d4
66b9 eb        ex      de,hl
66ba 01fe00    ld      bc,$00fe
66bd 3aec59    ld      a,($59ec)
66c0 cd026a    call    $6a02
66c3 e1        pop     hl
66c4 2b        dec     hl
66c5 56        ld      d,(hl)
66c6 2b        dec     hl
66c7 5e        ld      e,(hl)
66c8 e5        push    hl
66c9 2a2d59    ld      hl,($592d)
66cc 44        ld      b,h
66cd 4d        ld      c,l
66ce eb        ex      de,hl
66cf cd8a6d    call    $6d8a
66d2 eb        ex      de,hl
66d3 21d756    ld      hl,$56d7
66d6 22ee59    ld      ($59ee),hl
66d9 19        add     hl,de
66da 113459    ld      de,$5934
66dd cdcb65    call    $65cb
66e0 cddc65    call    $65dc
66e3 e1        pop     hl
66e4 2b        dec     hl
66e5 22c65f    ld      ($5fc6),hl
66e8 7e        ld      a,(hl)
66e9 fe01      cp      $01
66eb c0        ret     nz

66ec c3ab66    jp      $66ab
66ef e5        push    hl
66f0 cd2573    call    $7325
66f3 32ec59    ld      ($59ec),a
66f6 c3f167    jp      $67f1
66f9 cd6669    call    $6966
66fc 21ca5f    ld      hl,$5fca
66ff 010600    ld      bc,$0006
6702 113000    ld      de,$0030
6705 3aec59    ld      a,($59ec)
6708 23        inc     hl
6709 be        cp      (hl)
670a ca1e67    jp      z,$671e
670d 19        add     hl,de
670e 0d        dec     c
670f c20967    jp      nz,$6709
6712 21ca5f    ld      hl,$5fca
6715 7e        ld      a,(hl)
6716 b7        or      a
6717 ca1f67    jp      z,$671f
671a 19        add     hl,de
671b c31567    jp      $6715
671e 2b        dec     hl
671f 36ff      ld      (hl),$ff
6721 23        inc     hl
6722 3aec59    ld      a,($59ec)
6725 77        ld      (hl),a
6726 22c85f    ld      ($5fc8),hl
6729 23        inc     hl
672a 3600      ld      (hl),$00
672c 23        inc     hl
672d 23        inc     hl
672e 23        inc     hl
672f 23        inc     hl
6730 3600      ld      (hl),$00
6732 23        inc     hl
6733 3600      ld      (hl),$00
6735 23        inc     hl
6736 22c65f    ld      ($5fc6),hl
6739 21d756    ld      hl,$56d7
673c 22ee59    ld      ($59ee),hl
673f 2ac756    ld      hl,($56c7)
6742 22f259    ld      ($59f2),hl
6745 11d456    ld      de,$56d4
6748 01fe00    ld      bc,$00fe
674b 3aec59    ld      a,($59ec)
674e cd026a    call    $6a02
6751 2aee59    ld      hl,($59ee)
6754 cd9369    call    $6993
6757 eb        ex      de,hl
6758 f5        push    af
6759 da7067    jp      c,$6770
675c ca7067    jp      z,$6770
675f 2aee59    ld      hl,($59ee)
6762 23        inc     hl
6763 7e        ld      a,(hl)
6764 b7        or      a
6765 ca7067    jp      z,$6770
6768 2af659    ld      hl,($59f6)
676b eb        ex      de,hl
676c cd8a6d    call    $6d8a
676f eb        ex      de,hl
6770 d5        push    de
6771 2aee59    ld      hl,($59ee)
6774 eb        ex      de,hl
6775 cd8a6d    call    $6d8a
6778 eb        ex      de,hl
6779 2ac65f    ld      hl,($5fc6)
677c 70        ld      (hl),b
677d 23        inc     hl
677e 73        ld      (hl),e
677f 23        inc     hl
6780 72        ld      (hl),d
6781 eb        ex      de,hl
6782 2af259    ld      hl,($59f2)
6785 eb        ex      de,hl
6786 23        inc     hl
6787 73        ld      (hl),e
6788 23        inc     hl
6789 72        ld      (hl),d
678a 23        inc     hl
678b 22c65f    ld      ($5fc6),hl
678e eb        ex      de,hl
678f 2aee59    ld      hl,($59ee)
6792 23        inc     hl
6793 7e        ld      a,(hl)
6794 b7        or      a
6795 caad67    jp      z,$67ad
6798 e1        pop     hl
6799 f1        pop     af
679a 5e        ld      e,(hl)
679b 23        inc     hl
679c 56        ld      d,(hl)
679d 21f957    ld      hl,$57f9
67a0 22ee59    ld      ($59ee),hl
67a3 21f657    ld      hl,$57f6
67a6 eb        ex      de,hl
67a7 22f259    ld      ($59f2),hl
67aa c34867    jp      $6748
67ad 2ac65f    ld      hl,($5fc6)
67b0 2b        dec     hl
67b1 2b        dec     hl
67b2 2b        dec     hl
67b3 2b        dec     hl
67b4 2b        dec     hl
67b5 22c65f    ld      ($5fc6),hl
67b8 210000    ld      hl,$0000
67bb 39        add     hl,sp
67bc 23        inc     hl
67bd 23        inc     hl
67be 7e        ld      a,(hl)
67bf 2ac85f    ld      hl,($5fc8)
67c2 23        inc     hl
67c3 23        inc     hl
67c4 77        ld      (hl),a
67c5 23        inc     hl
67c6 73        ld      (hl),e
67c7 23        inc     hl
67c8 72        ld      (hl),d
67c9 c5        push    bc
67ca 2aee59    ld      hl,($59ee)
67cd 11d756    ld      de,$56d7
67d0 7d        ld      a,l
67d1 93        sub     e
67d2 c2ec67    jp      nz,$67ec
67d5 7c        ld      a,h
67d6 9a        sbc     a,d
67d7 c2ec67    jp      nz,$67ec
67da 21f657    ld      hl,$57f6
67dd 11d456    ld      de,$56d4
67e0 0e03      ld      c,$03
67e2 cde469    call    $69e4
67e5 c2ec67    jp      nz,$67ec
67e8 2b        dec     hl
67e9 71        ld      (hl),c
67ea 2b        dec     hl
67eb 71        ld      (hl),c
67ec c1        pop     bc
67ed e1        pop     hl
67ee f1        pop     af
67ef d1        pop     de
67f0 c9        ret     

67f1 3a005a    ld      a,($5a00)
67f4 fe04      cp      $04
67f6 ca1268    jp      z,$6812
67f9 fe05      cp      $05
67fb ca1268    jp      z,$6812
67fe fe06      cp      $06
6800 ca1268    jp      z,$6812
6803 fe07      cp      $07
6805 ca1268    jp      z,$6812
6808 3aea60    ld      a,($60ea)
680b b7        or      a
680c c21268    jp      nz,$6812
680f c36369    jp      $6963
6812 cd2573    call    $7325
6815 32ec59    ld      ($59ec),a
6818 21ca5f    ld      hl,$5fca
681b 113000    ld      de,$0030
681e 010600    ld      bc,$0006
6821 7e        ld      a,(hl)
6822 23        inc     hl
6823 b7        or      a
6824 ca2e68    jp      z,$682e
6827 3aec59    ld      a,($59ec)
682a be        cp      (hl)
682b ca3768    jp      z,$6837
682e 2b        dec     hl
682f 0d        dec     c
6830 ca6369    jp      z,$6963
6833 19        add     hl,de
6834 c32168    jp      $6821
6837 23        inc     hl
6838 7e        ld      a,(hl)
6839 e680      and     $80
683b ca6369    jp      z,$6963
683e 2b        dec     hl
683f 22c85f    ld      ($5fc8),hl
6842 3aea60    ld      a,($60ea)
6845 b7        or      a
6846 c2b768    jp      nz,$68b7
6849 3a005a    ld      a,($5a00)
684c fe05      cp      $05
684e cab768    jp      z,$68b7
6851 fe06      cp      $06
6853 c29b68    jp      nz,$689b
6856 23        inc     hl
6857 23        inc     hl
6858 23        inc     hl
6859 5e        ld      e,(hl)
685a 23        inc     hl
685b 56        ld      d,(hl)
685c eb        ex      de,hl
685d 2b        dec     hl
685e 56        ld      d,(hl)
685f 2b        dec     hl
6860 5e        ld      e,(hl)
6861 2b        dec     hl
6862 2b        dec     hl
6863 2b        dec     hl
6864 229668    ld      ($6896),hl
6867 3aec59    ld      a,($59ec)
686a 21f657    ld      hl,$57f6
686d be        cp      (hl)
686e c29868    jp      nz,$6898
6871 23        inc     hl
6872 cdf769    call    $69f7
6875 c29868    jp      nz,$6898
6878 23        inc     hl
6879 23        inc     hl
687a eb        ex      de,hl
687b 22f259    ld      ($59f2),hl
687e eb        ex      de,hl
687f cd9369    call    $6993
6882 c29868    jp      nz,$6898
6885 eb        ex      de,hl
6886 f5        push    af
6887 2a9668    ld      hl,($6896)
688a 22c65f    ld      ($5fc6),hl
688d 21f957    ld      hl,$57f9
6890 22ee59    ld      ($59ee),hl
6893 c37067    jp      $6770
6896 00        nop     
6897 00        nop     
6898 2ac85f    ld      hl,($5fc8)
689b 23        inc     hl
689c 7e        ld      a,(hl)
689d e640      and     $40
689f c26369    jp      nz,$6963
68a2 2afe59    ld      hl,($59fe)
68a5 111f00    ld      de,$001f
68a8 19        add     hl,de
68a9 5e        ld      e,(hl)
68aa 23        inc     hl
68ab 56        ld      d,(hl)
68ac e1        pop     hl
68ad e5        push    hl
68ae cdbe69    call    $69be
68b1 c26369    jp      nz,$6963
68b4 2ac85f    ld      hl,($5fc8)
68b7 23        inc     hl
68b8 23        inc     hl
68b9 23        inc     hl
68ba 5e        ld      e,(hl)
68bb 23        inc     hl
68bc 56        ld      d,(hl)
68bd eb        ex      de,hl
68be 2b        dec     hl
68bf 56        ld      d,(hl)
68c0 2b        dec     hl
68c1 5e        ld      e,(hl)
68c2 eb        ex      de,hl
68c3 22f560    ld      ($60f5),hl
68c6 eb        ex      de,hl
68c7 2b        dec     hl
68c8 56        ld      d,(hl)
68c9 2b        dec     hl
68ca 5e        ld      e,(hl)
68cb e5        push    hl
68cc 3a005a    ld      a,($5a00)
68cf fe05      cp      $05
68d1 c2e968    jp      nz,$68e9
68d4 2ac85f    ld      hl,($5fc8)
68d7 23        inc     hl
68d8 7e        ld      a,(hl)
68d9 e640      and     $40
68db c2e968    jp      nz,$68e9
68de 2af659    ld      hl,($59f6)
68e1 19        add     hl,de
68e2 eb        ex      de,hl
68e3 e1        pop     hl
68e4 73        ld      (hl),e
68e5 23        inc     hl
68e6 72        ld      (hl),d
68e7 2b        dec     hl
68e8 e5        push    hl
68e9 d5        push    de
68ea 21d456    ld      hl,$56d4
68ed 3aec59    ld      a,($59ec)
68f0 be        cp      (hl)
68f1 c20569    jp      nz,$6905
68f4 23        inc     hl
68f5 eb        ex      de,hl
68f6 2af560    ld      hl,($60f5)
68f9 eb        ex      de,hl
68fa cdf769    call    $69f7
68fd c20569    jp      nz,$6905
6900 23        inc     hl
6901 23        inc     hl
6902 c31769    jp      $6917
6905 11f657    ld      de,$57f6
6908 2af560    ld      hl,($60f5)
690b 01fe00    ld      bc,$00fe
690e 3aec59    ld      a,($59ec)
6911 cd026a    call    $6a02
6914 21f957    ld      hl,$57f9
6917 22ee59    ld      ($59ee),hl
691a d1        pop     de
691b 19        add     hl,de
691c 22ed60    ld      ($60ed),hl
691f eb        ex      de,hl
6920 e1        pop     hl
6921 2b        dec     hl
6922 46        ld      b,(hl)
6923 3a005a    ld      a,($5a00)
6926 fe05      cp      $05
6928 c24c69    jp      nz,$694c
692b e5        push    hl
692c 2ac85f    ld      hl,($5fc8)
692f 23        inc     hl
6930 7e        ld      a,(hl)
6931 e640      and     $40
6933 c24769    jp      nz,$6947
6936 05        dec     b
6937 e1        pop     hl
6938 70        ld      (hl),b
6939 c24c69    jp      nz,$694c
693c e5        push    hl
693d 2ac85f    ld      hl,($5fc8)
6940 23        inc     hl
6941 3600      ld      (hl),$00
6943 e1        pop     hl
6944 c36369    jp      $6963
6947 7e        ld      a,(hl)
6948 e6bf      and     $bf
694a 77        ld      (hl),a
694b e1        pop     hl
694c 22c65f    ld      ($5fc6),hl
694f 2ac85f    ld      hl,($5fc8)
6952 23        inc     hl
6953 23        inc     hl
6954 5e        ld      e,(hl)
6955 3aea60    ld      a,($60ea)
6958 b7        or      a
6959 ca5e69    jp      z,$695e
695c d5        push    de
695d f1        pop     af
695e 2aed60    ld      hl,($60ed)
6961 d1        pop     de
6962 c9        ret     

6963 c3f966    jp      $66f9
6966 3aec59    ld      a,($59ec)
6969 21bc56    ld      hl,$56bc
696c be        cp      (hl)
696d 77        ld      (hl),a
696e c27d69    jp      nz,$697d
6971 110100    ld      de,$0001
6974 21bd56    ld      hl,$56bd
6977 cdf769    call    $69f7
697a ca8069    jp      z,$6980
697d cd916d    call    $6d91
6980 c9        ret     

6981 d5        push    de
6982 e5        push    hl
6983 110900    ld      de,$0009
6986 cd8263    call    $6382
6989 2a1d02    ld      hl,($021d)
698c 19        add     hl,de
698d 22fb59    ld      ($59fb),hl
6990 e1        pop     hl
6991 d1        pop     de
6992 c9        ret     

6993 7e        ld      a,(hl)
6994 b7        or      a
6995 47        ld      b,a
6996 23        inc     hl
6997 23        inc     hl
6998 23        inc     hl
6999 23        inc     hl
699a cab569    jp      z,$69b5
699d e5        push    hl
699e 210400    ld      hl,$0004
69a1 39        add     hl,sp
69a2 5e        ld      e,(hl)
69a3 23        inc     hl
69a4 56        ld      d,(hl)
69a5 e1        pop     hl
69a6 c5        push    bc
69a7 d5        push    de
69a8 cdbe69    call    $69be
69ab d1        pop     de
69ac c1        pop     bc
69ad d8        ret     c

69ae c8        ret     z

69af 23        inc     hl
69b0 23        inc     hl
69b1 05        dec     b
69b2 c2a669    jp      nz,$69a6
69b5 af        xor     a
69b6 47        ld      b,a
69b7 3c        inc     a
69b8 eb        ex      de,hl
69b9 2a2d59    ld      hl,($592d)
69bc 19        add     hl,de
69bd c9        ret     

69be 3afd59    ld      a,($59fd)
69c1 b7        or      a
69c2 cadc69    jp      z,$69dc
69c5 3a025a    ld      a,($5a02)
69c8 4f        ld      c,a
69c9 cde469    call    $69e4
69cc f5        push    af
69cd e5        push    hl
69ce 21025a    ld      hl,$5a02
69d1 3a2d59    ld      a,($592d)
69d4 96        sub     (hl)
69d5 4f        ld      c,a
69d6 0600      ld      b,$00
69d8 e1        pop     hl
69d9 09        add     hl,bc
69da f1        pop     af
69db c9        ret     

69dc 3a2d59    ld      a,($592d)
69df 4f        ld      c,a
69e0 cde469    call    $69e4
69e3 c9        ret     

69e4 1a        ld      a,(de)
69e5 be        cp      (hl)
69e6 23        inc     hl
69e7 13        inc     de
69e8 c2f069    jp      nz,$69f0
69eb 0d        dec     c
69ec c8        ret     z

69ed c3e469    jp      $69e4
69f0 f5        push    af
69f1 0d        dec     c
69f2 0600      ld      b,$00
69f4 09        add     hl,bc
69f5 f1        pop     af
69f6 c9        ret     

69f7 d5        push    de
69f8 7b        ld      a,e
69f9 96        sub     (hl)
69fa 5f        ld      e,a
69fb 23        inc     hl
69fc 7a        ld      a,d
69fd 96        sub     (hl)
69fe b3        or      e
69ff 2b        dec     hl
6a00 d1        pop     de
6a01 c9        ret     

6a02 f5        push    af
6a03 eb        ex      de,hl
6a04 be        cp      (hl)
6a05 77        ld      (hl),a
6a06 23        inc     hl
6a07 c2126a    jp      nz,$6a12
6a0a cdf769    call    $69f7
6a0d c2126a    jp      nz,$6a12
6a10 f1        pop     af
6a11 c9        ret     

6a12 cd2b6a    call    $6a2b
6a15 73        ld      (hl),e
6a16 23        inc     hl
6a17 72        ld      (hl),d
6a18 23        inc     hl
6a19 f1        pop     af
6a1a 3e01      ld      a,$01
6a1c cd206a    call    $6a20
6a1f c9        ret     

6a20 e5        push    hl
6a21 2606      ld      h,$06
6a23 e3        ex      (sp),hl
6a24 cd2b6a    call    $6a2b
6a27 cdae6a    call    $6aae
6a2a c9        ret     

6a2b f5        push    af
6a2c 3aec60    ld      a,($60ec)
6a2f b7        or      a
6a30 ca7d6a    jp      z,$6a7d
6a33 e5        push    hl
6a34 d5        push    de
6a35 c5        push    bc
6a36 2aef60    ld      hl,($60ef)
6a39 eb        ex      de,hl
6a3a 3af160    ld      a,($60f1)
6a3d 3d        dec     a
6a3e d5        push    de
6a3f 110800    ld      de,$0008
6a42 210000    ld      hl,$0000
6a45 47        ld      b,a
6a46 cdd665    call    $65d6
6a49 11965f    ld      de,$5f96
6a4c 19        add     hl,de
6a4d 5e        ld      e,(hl)
6a4e 23        inc     hl
6a4f 56        ld      d,(hl)
6a50 2afe59    ld      hl,($59fe)
6a53 22f360    ld      ($60f3),hl
6a56 eb        ex      de,hl
6a57 22fe59    ld      ($59fe),hl
6a5a d1        pop     de
6a5b d5        push    de
6a5c eb        ex      de,hl
6a5d 2b        dec     hl
6a5e 56        ld      d,(hl)
6a5f 2b        dec     hl
6a60 5e        ld      e,(hl)
6a61 01fe00    ld      bc,$00fe
6a64 3e01      ld      a,$01
6a66 e1        pop     hl
6a67 e5        push    hl
6a68 cd7f6a    call    $6a7f
6a6b af        xor     a
6a6c 32ec60    ld      ($60ec),a
6a6f e1        pop     hl
6a70 2b        dec     hl
6a71 77        ld      (hl),a
6a72 2b        dec     hl
6a73 77        ld      (hl),a
6a74 2af360    ld      hl,($60f3)
6a77 22fe59    ld      ($59fe),hl
6a7a c1        pop     bc
6a7b d1        pop     de
6a7c e1        pop     hl
6a7d f1        pop     af
6a7e c9        ret     

6a7f e5        push    hl
6a80 f5        push    af
6a81 b7        or      a
6a82 c2906a    jp      nz,$6a90
6a85 3a005a    ld      a,($5a00)
6a88 b7        or      a
6a89 ca906a    jp      z,$6a90
6a8c 67        ld      h,a
6a8d c3a06a    jp      $6aa0
6a90 212359    ld      hl,$5923
6a93 cdf769    call    $69f7
6a96 ca9e6a    jp      z,$6a9e
6a99 2604      ld      h,$04
6a9b c3a06a    jp      $6aa0
6a9e 2603      ld      h,$03
6aa0 e5        push    hl
6aa1 210000    ld      hl,$0000
6aa4 222359    ld      ($5923),hl
6aa7 e1        pop     hl
6aa8 f1        pop     af
6aa9 e3        ex      (sp),hl
6aaa cdae6a    call    $6aae
6aad c9        ret     

6aae e5        push    hl
6aaf c5        push    bc
6ab0 d5        push    de
6ab1 cdca72    call    $72ca
6ab4 212e00    ld      hl,$002e
6ab7 19        add     hl,de
6ab8 c1        pop     bc
6ab9 71        ld      (hl),c
6aba 2b        dec     hl
6abb 70        ld      (hl),b
6abc b7        or      a
6abd cad66a    jp      z,$6ad6
6ac0 212600    ld      hl,$0026
6ac3 19        add     hl,de
6ac4 c1        pop     bc
6ac5 70        ld      (hl),b
6ac6 23        inc     hl
6ac7 71        ld      (hl),c
6ac8 212800    ld      hl,$0028
6acb 19        add     hl,de
6acc eb        ex      de,hl
6acd e3        ex      (sp),hl
6ace eb        ex      de,hl
6acf cd206b    call    $6b20
6ad2 d1        pop     de
6ad3 c3d86a    jp      $6ad8
6ad6 c1        pop     bc
6ad7 c1        pop     bc
6ad8 eb        ex      de,hl
6ad9 222a59    ld      ($592a),hl
6adc 21005a    ld      hl,$5a00
6adf 46        ld      b,(hl)
6ae0 eb        ex      de,hl
6ae1 e1        pop     hl
6ae2 e3        ex      (sp),hl
6ae3 eb        ex      de,hl
6ae4 72        ld      (hl),d
6ae5 c5        push    bc
6ae6 2afe59    ld      hl,($59fe)
6ae9 e5        push    hl
6aea 2a2a59    ld      hl,($592a)
6aed eb        ex      de,hl
6aee d5        push    de
6aef 01005a    ld      bc,$5a00
6af2 cd0c01    call    $010c
6af5 d1        pop     de
6af6 e1        pop     hl
6af7 22fe59    ld      ($59fe),hl
6afa f1        pop     af
6afb 32005a    ld      ($5a00),a
6afe eb        ex      de,hl
6aff 7e        ld      a,(hl)
6b00 23        inc     hl
6b01 4e        ld      c,(hl)
6b02 fe30      cp      $30
6b04 c8        ret     z

6b05 fe32      cp      $32
6b07 c29d63    jp      nz,$639d
6b0a 57        ld      d,a
6b0b 79        ld      a,c
6b0c fe34      cp      $34
6b0e 7a        ld      a,d
6b0f ca9d63    jp      z,$639d
6b12 79        ld      a,c
6b13 fe33      cp      $33
6b15 c29863    jp      nz,$6398
6b18 3a1859    ld      a,($5918)
6b1b b7        or      a
6b1c c0        ret     nz

6b1d c39863    jp      $6398
6b20 e5        push    hl
6b21 2a1d02    ld      hl,($021d)
6b24 eb        ex      de,hl
6b25 cd8a6d    call    $6d8a
6b28 eb        ex      de,hl
6b29 e1        pop     hl
6b2a 72        ld      (hl),d
6b2b 23        inc     hl
6b2c 73        ld      (hl),e
6b2d c9        ret     

6b2e eb        ex      de,hl
6b2f 72        ld      (hl),d
6b30 23        inc     hl
6b31 73        ld      (hl),e
6b32 c9        ret     

6b33 cd046d    call    $6d04
6b36 7e        ld      a,(hl)
6b37 b7        or      a
6b38 ca3f6b    jp      z,$6b3f
6b3b cdac6c    call    $6cac
6b3e c9        ret     

6b3f 1a        ld      a,(de)
6b40 13        inc     de
6b41 4f        ld      c,a
6b42 1a        ld      a,(de)
6b43 1b        dec     de
6b44 b1        or      c
6b45 3a1d59    ld      a,($591d)
6b48 ca536b    jp      z,$6b53
6b4b e5        push    hl
6b4c cd806b    call    $6b80
6b4f e1        pop     hl
6b50 c33b6b    jp      $6b3b
6b53 cdca72    call    $72ca
6b56 211d00    ld      hl,$001d
6b59 19        add     hl,de
6b5a 56        ld      d,(hl)
6b5b 23        inc     hl
6b5c 5e        ld      e,(hl)
6b5d 13        inc     de
6b5e eb        ex      de,hl
6b5f 222359    ld      ($5923),hl
6b62 eb        ex      de,hl
6b63 c9        ret     

6b64 d5        push    de
6b65 cd046d    call    $6d04
6b68 7e        ld      a,(hl)
6b69 fe10      cp      $10
6b6b ca736b    jp      z,$6b73
6b6e d1        pop     de
6b6f cdba6c    call    $6cba
6b72 c9        ret     

6b73 3a1d59    ld      a,($591d)
6b76 e5        push    hl
6b77 cd016c    call    $6c01
6b7a e1        pop     hl
6b7b d1        pop     de
6b7c cdba6c    call    $6cba
6b7f c9        ret     

6b80 d5        push    de
6b81 e5        push    hl
6b82 cdc76c    call    $6cc7
6b85 2aee59    ld      hl,($59ee)
6b88 1a        ld      a,(de)
6b89 4f        ld      c,a
6b8a 13        inc     de
6b8b 1a        ld      a,(de)
6b8c 47        ld      b,a
6b8d 50        ld      d,b
6b8e 59        ld      e,c
6b8f c1        pop     bc
6b90 d5        push    de
6b91 c5        push    bc
6b92 01fe00    ld      bc,$00fe
6b95 3aec59    ld      a,($59ec)
6b98 2b        dec     hl
6b99 2b        dec     hl
6b9a 2b        dec     hl
6b9b eb        ex      de,hl
6b9c cd026a    call    $6a02
6b9f 2aee59    ld      hl,($59ee)
6ba2 7e        ld      a,(hl)
6ba3 fe09      cp      $09
6ba5 dabb6b    jp      c,$6bbb
6ba8 3e08      ld      a,$08
6baa eb        ex      de,hl
6bab e1        pop     hl
6bac cd226d    call    $6d22
6baf 3a1d59    ld      a,($591d)
6bb2 d1        pop     de
6bb3 cddc65    call    $65dc
6bb6 d1        pop     de
6bb7 cdda6c    call    $6cda
6bba c9        ret     

6bbb eb        ex      de,hl
6bbc e1        pop     hl
6bbd cd226d    call    $6d22
6bc0 eb        ex      de,hl
6bc1 23        inc     hl
6bc2 23        inc     hl
6bc3 4e        ld      c,(hl)
6bc4 23        inc     hl
6bc5 46        ld      b,(hl)
6bc6 d1        pop     de
6bc7 e1        pop     hl
6bc8 71        ld      (hl),c
6bc9 23        inc     hl
6bca 70        ld      (hl),b
6bcb 3e01      ld      a,$01
6bcd cd646b    call    $6b64
6bd0 cdd76b    call    $6bd7
6bd3 cdda6c    call    $6cda
6bd6 c9        ret     

6bd7 01fe00    ld      bc,$00fe
6bda 2aee59    ld      hl,($59ee)
6bdd 2b        dec     hl
6bde 2b        dec     hl
6bdf 2b        dec     hl
6be0 110100    ld      de,$0001
6be3 eb        ex      de,hl
6be4 3aec59    ld      a,($59ec)
6be7 cd026a    call    $6a02
6bea 2aee59    ld      hl,($59ee)
6bed 110000    ld      de,$0000
6bf0 19        add     hl,de
6bf1 e5        push    hl
6bf2 cd546d    call    $6d54
6bf5 eb        ex      de,hl
6bf6 e1        pop     hl
6bf7 010400    ld      bc,$0004
6bfa cdcb65    call    $65cb
6bfd cddc65    call    $65dc
6c00 c9        ret     

6c01 d5        push    de
6c02 e5        push    hl
6c03 eb        ex      de,hl
6c04 7e        ld      a,(hl)
6c05 23        inc     hl
6c06 b6        or      (hl)
6c07 2b        dec     hl
6c08 eb        ex      de,hl
6c09 c2466c    jp      nz,$6c46
6c0c 3a1d59    ld      a,($591d)
6c0f b7        or      a
6c10 c21d6c    jp      nz,$6c1d
6c13 3e01      ld      a,$01
6c15 cd336b    call    $6b33
6c18 42        ld      b,d
6c19 4b        ld      c,e
6c1a c3226c    jp      $6c22
6c1d cdac6c    call    $6cac
6c20 4b        ld      c,e
6c21 42        ld      b,d
6c22 cdc76c    call    $6cc7
6c25 e1        pop     hl
6c26 d1        pop     de
6c27 d5        push    de
6c28 e5        push    hl
6c29 2aee59    ld      hl,($59ee)
6c2c cd8c6c    call    $6c8c
6c2f d1        pop     de
6c30 1a        ld      a,(de)
6c31 fe09      cp      $09
6c33 da386c    jp      c,$6c38
6c36 3e08      ld      a,$08
6c38 cd226d    call    $6d22
6c3b cddc65    call    $65dc
6c3e cdd76b    call    $6bd7
6c41 cdda6c    call    $6cda
6c44 d1        pop     de
6c45 c9        ret     

6c46 cdc76c    call    $6cc7
6c49 eb        ex      de,hl
6c4a 5e        ld      e,(hl)
6c4b 23        inc     hl
6c4c 56        ld      d,(hl)
6c4d 01fe00    ld      bc,$00fe
6c50 2aee59    ld      hl,($59ee)
6c53 2b        dec     hl
6c54 2b        dec     hl
6c55 2b        dec     hl
6c56 3aec59    ld      a,($59ec)
6c59 eb        ex      de,hl
6c5a cd026a    call    $6a02
6c5d e1        pop     hl
6c5e e5        push    hl
6c5f 7e        ld      a,(hl)
6c60 fe09      cp      $09
6c62 da676c    jp      c,$6c67
6c65 3e08      ld      a,$08
6c67 eb        ex      de,hl
6c68 2aee59    ld      hl,($59ee)
6c6b fe01      cp      $01
6c6d ca786c    jp      z,$6c78
6c70 f5        push    af
6c71 86        add     a,(hl)
6c72 fe7c      cp      $7c
6c74 d2846c    jp      nc,$6c84
6c77 f1        pop     af
6c78 cd226d    call    $6d22
6c7b cddc65    call    $65dc
6c7e cdda6c    call    $6cda
6c81 e1        pop     hl
6c82 d1        pop     de
6c83 c9        ret     

6c84 f1        pop     af
6c85 e1        pop     hl
6c86 d1        pop     de
6c87 d5        push    de
6c88 e5        push    hl
6c89 c30c6c    jp      $6c0c
6c8c 2b        dec     hl
6c8d 70        ld      (hl),b
6c8e 2b        dec     hl
6c8f 71        ld      (hl),c
6c90 2b        dec     hl
6c91 3aec59    ld      a,($59ec)
6c94 77        ld      (hl),a
6c95 23        inc     hl
6c96 23        inc     hl
6c97 23        inc     hl
6c98 af        xor     a
6c99 77        ld      (hl),a
6c9a 23        inc     hl
6c9b 77        ld      (hl),a
6c9c 23        inc     hl
6c9d 1a        ld      a,(de)
6c9e 77        ld      (hl),a
6c9f 79        ld      a,c
6ca0 12        ld      (de),a
6ca1 23        inc     hl
6ca2 13        inc     de
6ca3 1a        ld      a,(de)
6ca4 77        ld      (hl),a
6ca5 78        ld      a,b
6ca6 12        ld      (de),a
6ca7 1b        dec     de
6ca8 2b        dec     hl
6ca9 2b        dec     hl
6caa 2b        dec     hl
6cab c9        ret     

6cac 7e        ld      a,(hl)
6cad 35        dec     (hl)
6cae 3d        dec     a
6caf 87        add     a,a
6cb0 010400    ld      bc,$0004
6cb3 09        add     hl,bc
6cb4 4f        ld      c,a
6cb5 09        add     hl,bc
6cb6 5e        ld      e,(hl)
6cb7 23        inc     hl
6cb8 56        ld      d,(hl)
6cb9 c9        ret     

6cba 7e        ld      a,(hl)
6cbb 34        inc     (hl)
6cbc 010400    ld      bc,$0004
6cbf 09        add     hl,bc
6cc0 87        add     a,a
6cc1 4f        ld      c,a
6cc2 09        add     hl,bc
6cc3 73        ld      (hl),e
6cc4 23        inc     hl
6cc5 72        ld      (hl),d
6cc6 c9        ret     

6cc7 f5        push    af
6cc8 c5        push    bc
6cc9 d5        push    de
6cca e5        push    hl
6ccb 3a1e59    ld      a,($591e)
6cce b7        or      a
6ccf c2ff6c    jp      nz,$6cff
6cd2 3e01      ld      a,$01
6cd4 321e59    ld      ($591e),a
6cd7 c3e96c    jp      $6ce9
6cda f5        push    af
6cdb c5        push    bc
6cdc d5        push    de
6cdd e5        push    hl
6cde 3a1e59    ld      a,($591e)
6ce1 b7        or      a
6ce2 caff6c    jp      z,$6cff
6ce5 af        xor     a
6ce6 321e59    ld      ($591e),a
6ce9 21ee59    ld      hl,$59ee
6cec 11d756    ld      de,$56d7
6cef cdf769    call    $69f7
6cf2 c2f86c    jp      nz,$6cf8
6cf5 11f957    ld      de,$57f9
6cf8 eb        ex      de,hl
6cf9 22ee59    ld      ($59ee),hl
6cfc cd2b6a    call    $6a2b
6cff e1        pop     hl
6d00 d1        pop     de
6d01 c1        pop     bc
6d02 f1        pop     af
6d03 c9        ret     

6d04 321d59    ld      ($591d),a
6d07 111f00    ld      de,$001f
6d0a cd8a63    call    $638a
6d0d eb        ex      de,hl
6d0e 012400    ld      bc,$0024
6d11 09        add     hl,bc
6d12 e5        push    hl
6d13 2b        dec     hl
6d14 2b        dec     hl
6d15 b7        or      a
6d16 ca1d6d    jp      z,$6d1d
6d19 eb        ex      de,hl
6d1a e1        pop     hl
6d1b 09        add     hl,bc
6d1c c9        ret     

6d1d 2b        dec     hl
6d1e 2b        dec     hl
6d1f d1        pop     de
6d20 eb        ex      de,hl
6d21 c9        ret     

6d22 f5        push    af
6d23 c5        push    bc
6d24 d5        push    de
6d25 e5        push    hl
6d26 4f        ld      c,a
6d27 81        add     a,c
6d28 47        ld      b,a
6d29 79        ld      a,c
6d2a 48        ld      c,b
6d2b 0600      ld      b,$00
6d2d c5        push    bc
6d2e 4f        ld      c,a
6d2f 7e        ld      a,(hl)
6d30 f5        push    af
6d31 81        add     a,c
6d32 77        ld      (hl),a
6d33 eb        ex      de,hl
6d34 7e        ld      a,(hl)
6d35 91        sub     c
6d36 f5        push    af
6d37 77        ld      (hl),a
6d38 79        ld      a,c
6d39 87        add     a,a
6d3a 010400    ld      bc,$0004
6d3d 09        add     hl,bc
6d3e f1        pop     af
6d3f 87        add     a,a
6d40 4f        ld      c,a
6d41 09        add     hl,bc
6d42 eb        ex      de,hl
6d43 010400    ld      bc,$0004
6d46 09        add     hl,bc
6d47 f1        pop     af
6d48 87        add     a,a
6d49 4f        ld      c,a
6d4a 09        add     hl,bc
6d4b c1        pop     bc
6d4c cdcb65    call    $65cb
6d4f e1        pop     hl
6d50 d1        pop     de
6d51 c1        pop     bc
6d52 f1        pop     af
6d53 c9        ret     

6d54 111f00    ld      de,$001f
6d57 cd8a63    call    $638a
6d5a 212000    ld      hl,$0020
6d5d 19        add     hl,de
6d5e c9        ret     

6d5f 010301    ld      bc,$0103
6d62 cd2b6a    call    $6a2b
6d65 21d456    ld      hl,$56d4
6d68 af        xor     a
6d69 cd7b6d    call    $6d7b
6d6c 110100    ld      de,$0001
6d6f 21bf56    ld      hl,$56bf
6d72 01fe00    ld      bc,$00fe
6d75 3e01      ld      a,$01
6d77 cd7f6a    call    $6a7f
6d7a c9        ret     

6d7b d5        push    de
6d7c 57        ld      d,a
6d7d 78        ld      a,b
6d7e b1        or      c
6d7f ca886d    jp      z,$6d88
6d82 0b        dec     bc
6d83 72        ld      (hl),d
6d84 23        inc     hl
6d85 c37d6d    jp      $6d7d
6d88 d1        pop     de
6d89 c9        ret     

6d8a 7d        ld      a,l
6d8b 93        sub     e
6d8c 6f        ld      l,a
6d8d 7c        ld      a,h
6d8e 9a        sbc     a,d
6d8f 67        ld      h,a
6d90 c9        ret     

6d91 01fe00    ld      bc,$00fe
6d94 cd2573    call    $7325
6d97 32ec59    ld      ($59ec),a
6d9a 32bc56    ld      ($56bc),a
6d9d 110100    ld      de,$0001
6da0 21bf56    ld      hl,$56bf
6da3 3e01      ld      a,$01
6da5 cd206a    call    $6a20
6da8 c9        ret     

6da9 3a015a    ld      a,($5a01)
6dac fe80      cp      $80
6dae ca2471    jp      z,$7124
6db1 110800    ld      de,$0008
6db4 2afe59    ld      hl,($59fe)
6db7 19        add     hl,de
6db8 7e        ld      a,(hl)
6db9 01a900    ld      bc,$00a9
6dbc fe21      cp      $21
6dbe d29b63    jp      nc,$639b
6dc1 32cb56    ld      ($56cb),a
6dc4 af        xor     a
6dc5 cdd472    call    $72d4
6dc8 010c00    ld      bc,$000c
6dcb b7        or      a
6dcc ca9b63    jp      z,$639b
6dcf 21965f    ld      hl,$5f96
6dd2 11c65f    ld      de,$5fc6
6dd5 e5        push    hl
6dd6 cd8a6d    call    $6d8a
6dd9 e1        pop     hl
6dda c2e36d    jp      nz,$6de3
6ddd 010300    ld      bc,$0003
6de0 c39b63    jp      $639b
6de3 110000    ld      de,$0000
6de6 cdf769    call    $69f7
6de9 caf36d    jp      z,$6df3
6dec 110800    ld      de,$0008
6def 19        add     hl,de
6df0 c3d26d    jp      $6dd2
6df3 eb        ex      de,hl
6df4 2afe59    ld      hl,($59fe)
6df7 eb        ex      de,hl
6df8 73        ld      (hl),e
6df9 23        inc     hl
6dfa 72        ld      (hl),d
6dfb 23        inc     hl
6dfc 11de00    ld      de,$00de
6dff cdd571    call    $71d5
6e02 7a        ld      a,d
6e03 b3        or      e
6e04 c20d6e    jp      nz,$6e0d
6e07 01a800    ld      bc,$00a8
6e0a c39b63    jp      $639b
6e0d 73        ld      (hl),e
6e0e 23        inc     hl
6e0f 72        ld      (hl),d
6e10 23        inc     hl
6e11 e5        push    hl
6e12 212f00    ld      hl,$002f
6e15 19        add     hl,de
6e16 eb        ex      de,hl
6e17 e1        pop     hl
6e18 73        ld      (hl),e
6e19 23        inc     hl
6e1a 72        ld      (hl),d
6e1b cd2265    call    $6522
6e1e 32bc56    ld      ($56bc),a
6e21 110b00    ld      de,$000b
6e24 2afe59    ld      hl,($59fe)
6e27 19        add     hl,de
6e28 7e        ld      a,(hl)
6e29 b7        or      a
6e2a c2886e    jp      nz,$6e88
6e2d e5        push    hl
6e2e af        xor     a
6e2f cdca72    call    $72ca
6e32 210b00    ld      hl,$000b
6e35 19        add     hl,de
6e36 d1        pop     de
6e37 d5        push    de
6e38 010400    ld      bc,$0004
6e3b cdcb65    call    $65cb
6e3e e1        pop     hl
6e3f 7e        ld      a,(hl)
6e40 b7        or      a
6e41 c29263    jp      nz,$6392
6e44 23        inc     hl
6e45 7e        ld      a,(hl)
6e46 fe15      cp      $15
6e48 d29263    jp      nc,$6392
6e4b 011400    ld      bc,$0014
6e4e 23        inc     hl
6e4f 56        ld      d,(hl)
6e50 23        inc     hl
6e51 5e        ld      e,(hl)
6e52 2a1d02    ld      hl,($021d)
6e55 19        add     hl,de
6e56 e5        push    hl
6e57 c5        push    bc
6e58 af        xor     a
6e59 cdca72    call    $72ca
6e5c 215e00    ld      hl,$005e
6e5f 19        add     hl,de
6e60 c1        pop     bc
6e61 d1        pop     de
6e62 e5        push    hl
6e63 c5        push    bc
6e64 cdcb65    call    $65cb
6e67 3e01      ld      a,$01
6e69 cdca72    call    $72ca
6e6c 210b00    ld      hl,$000b
6e6f 19        add     hl,de
6e70 af        xor     a
6e71 77        ld      (hl),a
6e72 c1        pop     bc
6e73 23        inc     hl
6e74 71        ld      (hl),c
6e75 23        inc     hl
6e76 d1        pop     de
6e77 d5        push    de
6e78 e5        push    hl
6e79 2a1d02    ld      hl,($021d)
6e7c eb        ex      de,hl
6e7d cd8a6d    call    $6d8a
6e80 eb        ex      de,hl
6e81 e1        pop     hl
6e82 72        ld      (hl),d
6e83 23        inc     hl
6e84 73        ld      (hl),e
6e85 c3ab6e    jp      $6eab
6e88 e5        push    hl
6e89 011400    ld      bc,$0014
6e8c c5        push    bc
6e8d af        xor     a
6e8e cdca72    call    $72ca
6e91 210b00    ld      hl,$000b
6e94 19        add     hl,de
6e95 c1        pop     bc
6e96 d1        pop     de
6e97 d5        push    de
6e98 c5        push    bc
6e99 cdcb65    call    $65cb
6e9c 3e01      ld      a,$01
6e9e cdca72    call    $72ca
6ea1 c1        pop     bc
6ea2 210b00    ld      hl,$000b
6ea5 19        add     hl,de
6ea6 d1        pop     de
6ea7 e5        push    hl
6ea8 cdcb65    call    $65cb
6eab e1        pop     hl
6eac e5        push    hl
6ead e5        push    hl
6eae 11085a    ld      de,$5a08
6eb1 d5        push    de
6eb2 010d5a    ld      bc,$5a0d
6eb5 11215a    ld      de,$5a21
6eb8 cd1201    call    $0112
6ebb 11085a    ld      de,$5a08
6ebe d5        push    de
6ebf 010d5a    ld      bc,$5a0d
6ec2 11045a    ld      de,$5a04
6ec5 cd1501    call    $0115
6ec8 af        xor     a
6ec9 cdca72    call    $72ca
6ecc 210500    ld      hl,$0005
6ecf 19        add     hl,de
6ed0 010300    ld      bc,$0003
6ed3 112559    ld      de,$5925
6ed6 d5        push    de
6ed7 c5        push    bc
6ed8 cdcb65    call    $65cb
6edb 3e01      ld      a,$01
6edd cdca72    call    $72ca
6ee0 210500    ld      hl,$0005
6ee3 19        add     hl,de
6ee4 c1        pop     bc
6ee5 d1        pop     de
6ee6 cdcb65    call    $65cb
6ee9 112600    ld      de,$0026
6eec 2afe59    ld      hl,($59fe)
6eef 19        add     hl,de
6ef0 5e        ld      e,(hl)
6ef1 23        inc     hl
6ef2 56        ld      d,(hl)
6ef3 d5        push    de
6ef4 af        xor     a
6ef5 cdca72    call    $72ca
6ef8 212600    ld      hl,$0026
6efb 19        add     hl,de
6efc d1        pop     de
6efd 73        ld      (hl),e
6efe 23        inc     hl
6eff 72        ld      (hl),d
6f00 3e01      ld      a,$01
6f02 cdca72    call    $72ca
6f05 212600    ld      hl,$0026
6f08 19        add     hl,de
6f09 11fe00    ld      de,$00fe
6f0c 72        ld      (hl),d
6f0d 23        inc     hl
6f0e 73        ld      (hl),e
6f0f 112800    ld      de,$0028
6f12 2afe59    ld      hl,($59fe)
6f15 19        add     hl,de
6f16 56        ld      d,(hl)
6f17 23        inc     hl
6f18 5e        ld      e,(hl)
6f19 d5        push    de
6f1a af        xor     a
6f1b cdca72    call    $72ca
6f1e 212800    ld      hl,$0028
6f21 19        add     hl,de
6f22 d1        pop     de
6f23 72        ld      (hl),d
6f24 23        inc     hl
6f25 73        ld      (hl),e
6f26 af        xor     a
6f27 322059    ld      ($5920),a
6f2a 3a015a    ld      a,($5a01)
6f2d 32035a    ld      ($5a03),a
6f30 af        xor     a
6f31 cd426f    call    $6f42
6f34 321a59    ld      ($591a),a
6f37 3e01      ld      a,$01
6f39 cd426f    call    $6f42
6f3c 321959    ld      ($5919),a
6f3f c3636f    jp      $6f63
6f42 cdca72    call    $72ca
6f45 210b00    ld      hl,$000b
6f48 23        inc     hl
6f49 23        inc     hl
6f4a 19        add     hl,de
6f4b 56        ld      d,(hl)
6f4c 23        inc     hl
6f4d 5e        ld      e,(hl)
6f4e 2a1d02    ld      hl,($021d)
6f51 19        add     hl,de
6f52 44        ld      b,h
6f53 4d        ld      c,l
6f54 cd2d01    call    $012d
6f57 010400    ld      bc,$0004
6f5a fa9b63    jp      m,$639b
6f5d ca626f    jp      z,$6f62
6f60 3e01      ld      a,$01
6f62 c9        ret     

6f63 211a59    ld      hl,$591a
6f66 86        add     a,(hl)
6f67 321b59    ld      ($591b),a
6f6a fe01      cp      $01
6f6c c28a6f    jp      nz,$6f8a
6f6f c3f16f    jp      $6ff1
6f72 3a1959    ld      a,($5919)
6f75 b7        or      a
6f76 c2aa6f    jp      nz,$6faa
6f79 3e01      ld      a,$01
6f7b 0601      ld      b,$01
6f7d cdfa6f    call    $6ffa
6f80 3e01      ld      a,$01
6f82 0680      ld      b,$80
6f84 cdfa6f    call    $6ffa
6f87 c3aa6f    jp      $6faa
6f8a fe02      cp      $02
6f8c ca9a6f    jp      z,$6f9a
6f8f 3a035a    ld      a,($5a03)
6f92 fe01      cp      $01
6f94 c2aa6f    jp      nz,$6faa
6f97 c3726f    jp      $6f72
6f9a 3a035a    ld      a,($5a03)
6f9d b7        or      a
6f9e c2aa6f    jp      nz,$6faa
6fa1 cd8471    call    $7184
6fa4 010d00    ld      bc,$000d
6fa7 c39b63    jp      $639b
6faa 3a035a    ld      a,($5a03)
6fad b7        or      a
6fae cab36f    jp      z,$6fb3
6fb1 3e02      ld      a,$02
6fb3 47        ld      b,a
6fb4 3e01      ld      a,$01
6fb6 cdfa6f    call    $6ffa
6fb9 3a035a    ld      a,($5a03)
6fbc 47        ld      b,a
6fbd af        xor     a
6fbe cdfa6f    call    $6ffa
6fc1 3a035a    ld      a,($5a03)
6fc4 b7        or      a
6fc5 cadc6f    jp      z,$6fdc
6fc8 fe01      cp      $01
6fca cad46f    jp      z,$6fd4
6fcd 3a1b59    ld      a,($591b)
6fd0 b7        or      a
6fd1 cadc6f    jp      z,$6fdc
6fd4 cd2e73    call    $732e
6fd7 3e01      ld      a,$01
6fd9 322059    ld      ($5920),a
6fdc 3a035a    ld      a,($5a03)
6fdf 32015a    ld      ($5a01),a
6fe2 c32b70    jp      $702b
6fe5 cdca72    call    $72ca
6fe8 eb        ex      de,hl
6fe9 7e        ld      a,(hl)
6fea e60f      and     $0f
6fec b7        or      a
6fed c8        ret     z

6fee 3e01      ld      a,$01
6ff0 c9        ret     

6ff1 cd8471    call    $7184
6ff4 019c00    ld      bc,$009c
6ff7 c39b63    jp      $639b
6ffa cd1370    call    $7013
6ffd f5        push    af
6ffe cde56f    call    $6fe5
7001 ca1170    jp      z,$7011
7004 46        ld      b,(hl)
7005 23        inc     hl
7006 4e        ld      c,(hl)
7007 c5        push    bc
7008 2b        dec     hl
7009 cd8471    call    $7184
700c c1        pop     bc
700d 78        ld      a,b
700e c39d63    jp      $639d
7011 f1        pop     af
7012 c9        ret     

7013 c5        push    bc
7014 d5        push    de
7015 e5        push    hl
7016 f5        push    af
7017 78        ld      a,b
7018 32015a    ld      ($5a01),a
701b f1        pop     af
701c f5        push    af
701d cdca72    call    $72ca
7020 01005a    ld      bc,$5a00
7023 cd0c01    call    $010c
7026 f1        pop     af
7027 e1        pop     hl
7028 d1        pop     de
7029 c1        pop     bc
702a c9        ret     

702b af        xor     a
702c cdca72    call    $72ca
702f 217200    ld      hl,$0072
7032 19        add     hl,de
7033 e5        push    hl
7034 3a015a    ld      a,($5a01)
7037 fe01      cp      $01
7039 ca4470    jp      z,$7044
703c 012000    ld      bc,$0020
703f 3eff      ld      a,$ff
7041 cd7b6d    call    $6d7b
7044 111f00    ld      de,$001f
7047 2afe59    ld      hl,($59fe)
704a 19        add     hl,de
704b d1        pop     de
704c 73        ld      (hl),e
704d 23        inc     hl
704e 72        ld      (hl),d
704f 3a2059    ld      a,($5920)
7052 fe01      cp      $01
7054 ca1271    jp      z,$7112
7057 3e01      ld      a,$01
7059 321859    ld      ($5918),a
705c cd916d    call    $6d91
705f af        xor     a
7060 321859    ld      ($5918),a
7063 112600    ld      de,$0026
7066 cd8263    call    $6382
7069 23        inc     hl
706a 46        ld      b,(hl)
706b 23        inc     hl
706c 4e        ld      c,(hl)
706d 2acc56    ld      hl,($56cc)
7070 cd8a6d    call    $6d8a
7073 7c        ld      a,h
7074 b5        or      l
7075 c2f16f    jp      nz,$6ff1
7078 110800    ld      de,$0008
707b cd8263    call    $6382
707e 3acb56    ld      a,($56cb)
7081 ba        cp      d
7082 c2f16f    jp      nz,$6ff1
7085 c5        push    bc
7086 56        ld      d,(hl)
7087 23        inc     hl
7088 5e        ld      e,(hl)
7089 eb        ex      de,hl
708a d1        pop     de
708b cd8a6d    call    $6d8a
708e eb        ex      de,hl
708f 2ac956    ld      hl,($56c9)
7092 cd8a6d    call    $6d8a
7095 7c        ld      a,h
7096 b5        or      l
7097 c2f16f    jp      nz,$6ff1
709a 3a035a    ld      a,($5a03)
709d b7        or      a
709e ca1271    jp      z,$7112
70a1 3ac456    ld      a,($56c4)
70a4 e610      and     $10
70a6 c2cd70    jp      nz,$70cd
70a9 21bf56    ld      hl,$56bf
70ac af        xor     a
70ad 77        ld      (hl),a
70ae 23        inc     hl
70af 77        ld      (hl),a
70b0 23        inc     hl
70b1 77        ld      (hl),a
70b2 23        inc     hl
70b3 77        ld      (hl),a
70b4 23        inc     hl
70b5 23        inc     hl
70b6 7e        ld      a,(hl)
70b7 f610      or      $10
70b9 77        ld      (hl),a
70ba 3ad256    ld      a,($56d2)
70bd fe0d      cp      $0d
70bf c2cd70    jp      nz,$70cd
70c2 3ad356    ld      a,($56d3)
70c5 fe0a      cp      $0a
70c7 c2cd70    jp      nz,$70cd
70ca c3e070    jp      $70e0
70cd 21d256    ld      hl,$56d2
70d0 360d      ld      (hl),$0d
70d2 23        inc     hl
70d3 360a      ld      (hl),$0a
70d5 21ce56    ld      hl,$56ce
70d8 af        xor     a
70d9 77        ld      (hl),a
70da 23        inc     hl
70db 77        ld      (hl),a
70dc 23        inc     hl
70dd 77        ld      (hl),a
70de 23        inc     hl
70df 77        ld      (hl),a
70e0 cd5f6d    call    $6d5f
70e3 cd546d    call    $6d54
70e6 eb        ex      de,hl
70e7 21bf56    ld      hl,$56bf
70ea eb        ex      de,hl
70eb 010400    ld      bc,$0004
70ee cdcb65    call    $65cb
70f1 21bf56    ld      hl,$56bf
70f4 7e        ld      a,(hl)
70f5 23        inc     hl
70f6 b6        or      (hl)
70f7 ca0171    jp      z,$7101
70fa af        xor     a
70fb cd046d    call    $6d04
70fe cd806b    call    $6b80
7101 21c156    ld      hl,$56c1
7104 7e        ld      a,(hl)
7105 23        inc     hl
7106 b6        or      (hl)
7107 ca1271    jp      z,$7112
710a 3e01      ld      a,$01
710c cd046d    call    $6d04
710f cd806b    call    $6b80
7112 110700    ld      de,$0007
7115 2afe59    ld      hl,($59fe)
7118 19        add     hl,de
7119 3a035a    ld      a,($5a03)
711c 77        ld      (hl),a
711d c9        ret     

711e 23        inc     hl
711f 4e        ld      c,(hl)
7120 cdb763    call    $63b7
7123 c9        ret     

7124 cd2b6a    call    $6a2b
7127 cd2573    call    $7325
712a 21ca5f    ld      hl,$5fca
712d 010600    ld      bc,$0006
7130 113000    ld      de,$0030
7133 23        inc     hl
7134 be        cp      (hl)
7135 ca4071    jp      z,$7140
7138 19        add     hl,de
7139 0d        dec     c
713a c23471    jp      nz,$7134
713d c34471    jp      $7144
7140 af        xor     a
7141 77        ld      (hl),a
7142 2b        dec     hl
7143 77        ld      (hl),a
7144 cd6f63    call    $636f
7147 b7        or      a
7148 ca8471    jp      z,$7184
714b cd916d    call    $6d91
714e af        xor     a
714f cd5a71    call    $715a
7152 3e01      ld      a,$01
7154 cd5a71    call    $715a
7157 c37471    jp      $7174
715a cd046d    call    $6d04
715d 7e        ld      a,(hl)
715e b7        or      a
715f c8        ret     z

7160 3e01      ld      a,$01
7162 321c59    ld      ($591c),a
7165 3a1d59    ld      a,($591d)
7168 f5        push    af
7169 cd016c    call    $6c01
716c af        xor     a
716d 321c59    ld      ($591c),a
7170 f1        pop     af
7171 c35a71    jp      $715a
7174 cd546d    call    $6d54
7177 eb        ex      de,hl
7178 21bf56    ld      hl,$56bf
717b 010400    ld      bc,$0004
717e cdcb65    call    $65cb
7181 cd5f6d    call    $6d5f
7184 3e80      ld      a,$80
7186 32015a    ld      ($5a01),a
7189 01005a    ld      bc,$5a00
718c 3e01      ld      a,$01
718e cdca72    call    $72ca
7191 cd0c01    call    $010c
7194 01005a    ld      bc,$5a00
7197 af        xor     a
7198 cdca72    call    $72ca
719b cd0c01    call    $010c
719e 110700    ld      de,$0007
71a1 2afe59    ld      hl,($59fe)
71a4 19        add     hl,de
71a5 3680      ld      (hl),$80
71a7 21965f    ld      hl,$5f96
71aa eb        ex      de,hl
71ab 2afe59    ld      hl,($59fe)
71ae eb        ex      de,hl
71af cdf769    call    $69f7
71b2 cabc71    jp      z,$71bc
71b5 110800    ld      de,$0008
71b8 19        add     hl,de
71b9 c3aa71    jp      $71aa
71bc 3600      ld      (hl),$00
71be 23        inc     hl
71bf 3600      ld      (hl),$00
71c1 23        inc     hl
71c2 5e        ld      e,(hl)
71c3 23        inc     hl
71c4 56        ld      d,(hl)
71c5 eb        ex      de,hl
71c6 11de00    ld      de,$00de
71c9 cd6d72    call    $726d
71cc 7a        ld      a,d
71cd b3        or      e
71ce c0        ret     nz

71cf 01a800    ld      bc,$00a8
71d2 c39b63    jp      $639b
71d5 f5        push    af
71d6 c5        push    bc
71d7 e5        push    hl
71d8 d5        push    de
71d9 cd5672    call    $7256
71dc 2a685f    ld      hl,($5f68)
71df cd8a6d    call    $6d8a
71e2 da4e72    jp      c,$724e
71e5 42        ld      b,d
71e6 4b        ld      c,e
71e7 2a685f    ld      hl,($5f68)
71ea eb        ex      de,hl
71eb 2a945f    ld      hl,($5f94)
71ee af        xor     a
71ef f5        push    af
71f0 c5        push    bc
71f1 e5        push    hl
71f2 f5        push    af
71f3 7e        ld      a,(hl)
71f4 b7        or      a
71f5 c20b72    jp      nz,$720b
71f8 f1        pop     af
71f9 3c        inc     a
71fa f5        push    af
71fb 23        inc     hl
71fc 1b        dec     de
71fd 0b        dec     bc
71fe 79        ld      a,c
71ff b7        or      a
7200 ca2072    jp      z,$7220
7203 7a        ld      a,d
7204 b3        or      e
7205 ca4a72    jp      z,$724a
7208 c3f371    jp      $71f3
720b 1b        dec     de
720c 7a        ld      a,d
720d b3        or      e
720e ca4a72    jp      z,$724a
7211 f1        pop     af
7212 3c        inc     a
7213 23        inc     hl
7214 c1        pop     bc
7215 c1        pop     bc
7216 33        inc     sp
7217 33        inc     sp
7218 f5        push    af
7219 c5        push    bc
721a e5        push    hl
721b 1b        dec     de
721c f5        push    af
721d c3f371    jp      $71f3
7220 f1        pop     af
7221 e1        pop     hl
7222 c1        pop     bc
7223 f1        pop     af
7224 f5        push    af
7225 3601      ld      (hl),$01
7227 23        inc     hl
7228 0b        dec     bc
7229 79        ld      a,c
722a b7        or      a
722b c22572    jp      nz,$7225
722e 2a665f    ld      hl,($5f66)
7231 112000    ld      de,$0020
7234 f1        pop     af
7235 b7        or      a
7236 ca3e72    jp      z,$723e
7239 3d        dec     a
723a 19        add     hl,de
723b c33572    jp      $7235
723e c1        pop     bc
723f e5        push    hl
7240 3e00      ld      a,$00
7242 cd7b6d    call    $6d7b
7245 d1        pop     de
7246 e1        pop     hl
7247 c1        pop     bc
7248 f1        pop     af
7249 c9        ret     

724a f1        pop     af
724b e1        pop     hl
724c c1        pop     bc
724d f1        pop     af
724e d1        pop     de
724f 110000    ld      de,$0000
7252 e1        pop     hl
7253 c1        pop     bc
7254 f1        pop     af
7255 c9        ret     

7256 eb        ex      de,hl
7257 3e03      ld      a,$03
7259 f5        push    af
725a 54        ld      d,h
725b 5d        ld      e,l
725c 19        add     hl,de
725d f1        pop     af
725e 3d        dec     a
725f c25972    jp      nz,$7259
7262 7d        ld      a,l
7263 b7        or      a
7264 ca6872    jp      z,$7268
7267 24        inc     h
7268 6c        ld      l,h
7269 2600      ld      h,$00
726b eb        ex      de,hl
726c c9        ret     

726d f5        push    af
726e c5        push    bc
726f d5        push    de
7270 eb        ex      de,hl
7271 2a665f    ld      hl,($5f66)
7274 eb        ex      de,hl
7275 cd8a6d    call    $6d8a
7278 dac372    jp      c,$72c3
727b 7d        ld      a,l
727c e61f      and     $1f
727e c2c372    jp      nz,$72c3
7281 eb        ex      de,hl
7282 cd5672    call    $7256
7285 e1        pop     hl
7286 d5        push    de
7287 eb        ex      de,hl
7288 cd5672    call    $7256
728b e1        pop     hl
728c e5        push    hl
728d 19        add     hl,de
728e d5        push    de
728f eb        ex      de,hl
7290 2a685f    ld      hl,($5f68)
7293 cd8a6d    call    $6d8a
7296 dac272    jp      c,$72c2
7299 2a945f    ld      hl,($5f94)
729c c1        pop     bc
729d d1        pop     de
729e c5        push    bc
729f 19        add     hl,de
72a0 7e        ld      a,(hl)
72a1 fe00      cp      $00
72a3 cac372    jp      z,$72c3
72a6 23        inc     hl
72a7 0b        dec     bc
72a8 78        ld      a,b
72a9 b1        or      c
72aa c2a072    jp      nz,$72a0
72ad c1        pop     bc
72ae 2a945f    ld      hl,($5f94)
72b1 19        add     hl,de
72b2 3e00      ld      a,$00
72b4 77        ld      (hl),a
72b5 23        inc     hl
72b6 0b        dec     bc
72b7 78        ld      a,b
72b8 b1        or      c
72b9 c2b272    jp      nz,$72b2
72bc 110100    ld      de,$0001
72bf c1        pop     bc
72c0 f1        pop     af
72c1 c9        ret     

72c2 c1        pop     bc
72c3 c1        pop     bc
72c4 110000    ld      de,$0000
72c7 c1        pop     bc
72c8 f1        pop     af
72c9 c9        ret     

72ca f5        push    af
72cb af        xor     a
72cc 32d372    ld      ($72d3),a
72cf f1        pop     af
72d0 c3df72    jp      $72df
72d3 00        nop     
72d4 f5        push    af
72d5 3e01      ld      a,$01
72d7 32d372    ld      ($72d3),a
72da f1        pop     af
72db cddf72    call    $72df
72de c9        ret     

72df e5        push    hl
72e0 c5        push    bc
72e1 f5        push    af
72e2 2afe59    ld      hl,($59fe)
72e5 eb        ex      de,hl
72e6 21965f    ld      hl,$5f96
72e9 d5        push    de
72ea e5        push    hl
72eb 11c65f    ld      de,$5fc6
72ee cd8a6d    call    $6d8a
72f1 e1        pop     hl
72f2 d1        pop     de
72f3 c20973    jp      nz,$7309
72f6 3ad372    ld      a,($72d3)
72f9 b7        or      a
72fa ca0373    jp      z,$7303
72fd f1        pop     af
72fe c1        pop     bc
72ff e1        pop     hl
7300 3eff      ld      a,$ff
7302 c9        ret     

7303 010200    ld      bc,$0002
7306 c39b63    jp      $639b
7309 cdf769    call    $69f7
730c ca1673    jp      z,$7316
730f 010800    ld      bc,$0008
7312 09        add     hl,bc
7313 c3e972    jp      $72e9
7316 f1        pop     af
7317 f5        push    af
7318 3c        inc     a
7319 87        add     a,a
731a 4f        ld      c,a
731b 0600      ld      b,$00
731d 09        add     hl,bc
731e 5e        ld      e,(hl)
731f 23        inc     hl
7320 56        ld      d,(hl)
7321 f1        pop     af
7322 c1        pop     bc
7323 e1        pop     hl
7324 c9        ret     

7325 3e02      ld      a,$02
7327 d5        push    de
7328 cdca72    call    $72ca
732b 7b        ld      a,e
732c d1        pop     de
732d c9        ret     

732e 21bf56    ld      hl,$56bf
7331 013801    ld      bc,$0138
7334 af        xor     a
7335 cd7b6d    call    $6d7b
7338 cd2573    call    $7325
733b 32ec59    ld      ($59ec),a
733e 32bc56    ld      ($56bc),a
7341 32d456    ld      ($56d4),a
7344 21c456    ld      hl,$56c4
7347 3610      ld      (hl),$10
7349 21d256    ld      hl,$56d2
734c 360d      ld      (hl),$0d
734e 23        inc     hl
734f 360a      ld      (hl),$0a
7351 af        xor     a
7352 322459    ld      ($5924),a
7355 3e01      ld      a,$01
7357 32bd56    ld      ($56bd),a
735a 322359    ld      ($5923),a
735d 3c        inc     a
735e 32d556    ld      ($56d5),a
7361 32c756    ld      ($56c7),a
7364 21fe00    ld      hl,$00fe
7367 22c556    ld      ($56c5),hl
736a 112600    ld      de,$0026
736d cd8263    call    $6382
7370 eb        ex      de,hl
7371 22cc56    ld      ($56cc),hl
7374 eb        ex      de,hl
7375 23        inc     hl
7376 56        ld      d,(hl)
7377 23        inc     hl
7378 5e        ld      e,(hl)
7379 d5        push    de
737a 110800    ld      de,$0008
737d cd8263    call    $6382
7380 7a        ld      a,d
7381 32cb56    ld      ($56cb),a
7384 56        ld      d,(hl)
7385 23        inc     hl
7386 5e        ld      e,(hl)
7387 eb        ex      de,hl
7388 d1        pop     de
7389 cd8a6d    call    $6d8a
738c 22c956    ld      ($56c9),hl
738f cd5f6d    call    $6d5f
7392 21d756    ld      hl,$56d7
7395 22ee59    ld      ($59ee),hl
7398 f5        push    af
7399 3aec59    ld      a,($59ec)
739c 32d456    ld      ($56d4),a
739f 3e02      ld      a,$02
73a1 322359    ld      ($5923),a
73a4 32d556    ld      ($56d5),a
73a7 f1        pop     af
73a8 cddc65    call    $65dc
73ab c9        ret     

73ac 7e        ld      a,(hl)
73ad 23        inc     hl
73ae bb        cp      e
73af c0        ret     nz

73b0 7e        ld      a,(hl)
73b1 ba        cp      d
73b2 c9        ret     

73b3 2af003    ld      hl,($03f0)
73b6 eb        ex      de,hl
73b7 2a4802    ld      hl,($0248)
73ba 010c00    ld      bc,$000c
73bd 09        add     hl,bc
73be 0603      ld      b,$03
73c0 3aef03    ld      a,($03ef)
73c3 be        cp      (hl)
73c4 23        inc     hl
73c5 c2cd73    jp      nz,$73cd
73c8 cdac73    call    $73ac
73cb c8        ret     z

73cc 2b        dec     hl
73cd 23        inc     hl
73ce 23        inc     hl
73cf 23        inc     hl
73d0 23        inc     hl
73d1 23        inc     hl
73d2 05        dec     b
73d3 f2c073    jp      p,$73c0
73d6 c9        ret     

73d7 eb        ex      de,hl
73d8 2af003    ld      hl,($03f0)
73db eb        ex      de,hl
73dc cdac73    call    $73ac
73df 3f        ccf     
73e0 d8        ret     c

73e1 23        inc     hl
73e2 cdac73    call    $73ac
73e5 c0        ret     nz

73e6 37        scf     
73e7 c9        ret     

73e8 3ec8      ld      a,$c8
73ea c3430c    jp      $0c43
73ed d5        push    de
73ee 110001    ld      de,$0100
73f1 2a1d02    ld      hl,($021d)
73f4 19        add     hl,de
73f5 226036    ld      ($3660),hl
73f8 eb        ex      de,hl
73f9 210b00    ld      hl,$000b
73fc 19        add     hl,de
73fd 7e        ld      a,(hl)
73fe b7        or      a
73ff c20774    jp      nz,$7407
7402 23        inc     hl
7403 6e        ld      l,(hl)
7404 67        ld      h,a
7405 19        add     hl,de
7406 eb        ex      de,hl
7407 212f00    ld      hl,$002f
740a 19        add     hl,de
740b 79        ld      a,c
740c 95        sub     l
740d 78        ld      a,b
740e 9c        sbc     a,h
740f d2f573    jp      nc,$73f5
7412 d1        pop     de
7413 c9        ret     

7414 f5        push    af
7415 af        xor     a
7416 320602    ld      ($0206),a
7419 f1        pop     af
741a c3440c    jp      $0c44
741d f1        pop     af
741e b7        or      a
741f ca1474    jp      z,$7414
7422 32ec03    ld      ($03ec),a
7425 d1        pop     de
7426 af        xor     a
7427 c32f74    jp      $742f
742a af        xor     a
742b 32ec03    ld      ($03ec),a
742e f1        pop     af
742f f5        push    af
7430 c23474    jp      nz,$7434
7433 af        xor     a
7434 32ed03    ld      ($03ed),a
7437 1b        dec     de
7438 d5        push    de
7439 2a3402    ld      hl,($0234)
743c 19        add     hl,de
743d 220902    ld      ($0209),hl
7440 eb        ex      de,hl
7441 3a0d02    ld      a,($020d)
7444 21ee03    ld      hl,$03ee
7447 77        ld      (hl),a
7448 23        inc     hl
7449 47        ld      b,a
744a 3a0802    ld      a,($0208)
744d 77        ld      (hl),a
744e 23        inc     hl
744f 72        ld      (hl),d
7450 23        inc     hl
7451 73        ld      (hl),e
7452 c2e074    jp      nz,$74e0
7455 2a4602    ld      hl,($0246)
7458 eb        ex      de,hl
7459 2a1d02    ld      hl,($021d)
745c 224602    ld      ($0246),hl
745f 7d        ld      a,l
7460 93        sub     e
7461 5f        ld      e,a
7462 7c        ld      a,h
7463 9a        sbc     a,d
7464 b3        or      e
7465 ca7374    jp      z,$7473
7468 3aec03    ld      a,($03ec)
746b b7        or      a
746c c21474    jp      nz,$7414
746f 3c        inc     a
7470 c3fe74    jp      $74fe
7473 3a4a02    ld      a,($024a)
7476 b7        or      a
7477 3e02      ld      a,$02
7479 c2fe74    jp      nz,$74fe
747c 3aec03    ld      a,($03ec)
747f b7        or      a
7480 c2fd74    jp      nz,$74fd
7483 3a0802    ld      a,($0208)
7486 2a4802    ld      hl,($0248)
7489 be        cp      (hl)
748a c2fd74    jp      nz,$74fd
748d 23        inc     hl
748e 3c        inc     a
748f cad374    jp      z,$74d3
7492 c5        push    bc
7493 e5        push    hl
7494 cdb373    call    $73b3
7497 e1        pop     hl
7498 c1        pop     bc
7499 cad274    jp      z,$74d2
749c d1        pop     de
749d d5        push    de
749e 1a        ld      a,(de)
749f fefa      cp      $fa
74a1 cafd74    jp      z,$74fd
74a4 fef1      cp      $f1
74a6 daae74    jp      c,$74ae
74a9 fef6      cp      $f6
74ab dafd74    jp      c,$74fd
74ae feae      cp      $ae
74b0 cafd74    jp      z,$74fd
74b3 fed5      cp      $d5
74b5 cafd74    jp      z,$74fd
74b8 fed6      cp      $d6
74ba cafd74    jp      z,$74fd
74bd fed4      cp      $d4
74bf c2ca74    jp      nz,$74ca
74c2 3a0802    ld      a,($0208)
74c5 feff      cp      $ff
74c7 c2fd74    jp      nz,$74fd
74ca 7e        ld      a,(hl)
74cb b8        cp      b
74cc d2d374    jp      nc,$74d3
74cf c3e074    jp      $74e0
74d2 70        ld      (hl),b
74d3 110500    ld      de,$0005
74d6 19        add     hl,de
74d7 cdd773    call    $73d7
74da dafd74    jp      c,$74fd
74dd c3f874    jp      $74f8
74e0 2a4802    ld      hl,($0248)
74e3 23        inc     hl
74e4 23        inc     hl
74e5 cdd773    call    $73d7
74e8 dafd74    jp      c,$74fd
74eb 015e02    ld      bc,$025e
74ee cd2c78    call    $782c
74f1 3a5e02    ld      a,($025e)
74f4 b7        or      a
74f5 c2fd74    jp      nz,$74fd
74f8 d1        pop     de
74f9 1a        ld      a,(de)
74fa c30108    jp      $0801
74fd af        xor     a
74fe 32eb03    ld      ($03eb),a
7501 d1        pop     de
7502 210000    ld      hl,$0000
7505 39        add     hl,sp
7506 220b02    ld      ($020b),hl
7509 2a1d02    ld      hl,($021d)
750c e5        push    hl
750d cd8211    call    $1182
7510 d1        pop     de
7511 2aa202    ld      hl,($02a2)
7514 19        add     hl,de
7515 7e        ld      a,(hl)
7516 116075    ld      de,$7560
7519 0e0a      ld      c,$0a
751b cdeb11    call    $11eb
751e c2e873    jp      nz,$73e8
7521 af        xor     a
7522 329d02    ld      ($029d),a
7525 324a02    ld      ($024a),a
7528 11eb03    ld      de,$03eb
752b 2a1f02    ld      hl,($021f)
752e 0e07      ld      c,$07
7530 cda70b    call    $0ba7
7533 3a4b02    ld      a,($024b)
7536 77        ld      (hl),a
7537 23        inc     hl
7538 e5        push    hl
7539 cdb373    call    $73b3
753c e1        pop     hl
753d c24275    jp      nz,$7542
7540 3601      ld      (hl),$01
7542 3aeb03    ld      a,($03eb)
7545 3d        dec     a
7546 c2c607    jp      nz,$07c6
7549 23        inc     hl
754a e5        push    hl
754b 2a4602    ld      hl,($0246)
754e eb        ex      de,hl
754f 2a9e02    ld      hl,($029e)
7552 19        add     hl,de
7553 d1        pop     de
7554 7e        ld      a,(hl)
7555 12        ld      (de),a
7556 23        inc     hl
7557 13        inc     de
7558 fe20      cp      $20
755a c25475    jp      nz,$7554
755d c3c607    jp      $07c6
7560 24        inc     h
7561 41        ld      b,c
7562 4e        ld      c,(hl)
7563 49        ld      c,c
7564 4d        ld      c,l
7565 2e56      ld      l,$56
7567 34        inc     (hl)
7568 35        dec     (hl)
7569 200a      jr      nz,$7575
756b 4f        ld      c,a
756c c33301    jp      $0133
756f c5        push    bc
7570 cd3001    call    $0130
7573 e1        pop     hl
7574 77        ld      (hl),a
7575 3a9401    ld      a,($0194)
7578 b7        or      a
7579 ca8475    jp      z,$7584
757c 3a9d01    ld      a,($019d)
757f be        cp      (hl)
7580 c0        ret     nz

7581 cd3001    call    $0130
7584 0607      ld      b,$07
7586 119c01    ld      de,$019c
7589 1a        ld      a,(de)
758a be        cp      (hl)
758b ca9475    jp      z,$7594
758e 1b        dec     de
758f 05        dec     b
7590 c28975    jp      nz,$7589
7593 c9        ret     

7594 70        ld      (hl),b
7595 c9        ret     

7596 d5        push    de
7597 d5        push    de
7598 c5        push    bc
7599 2a1f02    ld      hl,($021f)
759c 110700    ld      de,$0007
759f 19        add     hl,de
75a0 7e        ld      a,(hl)
75a1 324b02    ld      ($024b),a
75a4 cd0737    call    $3707
75a7 3e01      ld      a,$01
75a9 329d02    ld      ($029d),a
75ac e1        pop     hl
75ad 224802    ld      ($0248),hl
75b0 7e        ld      a,(hl)
75b1 320802    ld      ($0208),a
75b4 23        inc     hl
75b5 23        inc     hl
75b6 46        ld      b,(hl)
75b7 23        inc     hl
75b8 4e        ld      c,(hl)
75b9 23        inc     hl
75ba 23        inc     hl
75bb 23        inc     hl
75bc e3        ex      (sp),hl
75bd 7d        ld      a,l
75be 91        sub     c
75bf 6f        ld      l,a
75c0 7c        ld      a,h
75c1 98        sbc     a,b
75c2 67        ld      h,a
75c3 222502    ld      ($0225),hl
75c6 cd7e0b    call    $0b7e
75c9 223402    ld      ($0234),hl
75cc e1        pop     hl
75cd 46        ld      b,(hl)
75ce 23        inc     hl
75cf 4e        ld      c,(hl)
75d0 23        inc     hl
75d1 23        inc     hl
75d2 23        inc     hl
75d3 eb        ex      de,hl
75d4 2a2502    ld      hl,($0225)
75d7 09        add     hl,bc
75d8 eb        ex      de,hl
75d9 46        ld      b,(hl)
75da 23        inc     hl
75db 4e        ld      c,(hl)
75dc e1        pop     hl
75dd 2b        dec     hl
75de 09        add     hl,bc
75df 222702    ld      ($0227),hl
75e2 2a0b02    ld      hl,($020b)
75e5 f9        ld      sp,hl
75e6 f1        pop     af
75e7 c2eb75    jp      nz,$75eb
75ea 1a        ld      a,(de)
75eb f5        push    af
75ec cde307    call    $07e3
75ef 1a        ld      a,(de)
75f0 c30108    jp      $0801
75f3 1678      ld      d,$78
75f5 0a        ld      a,(bc)
75f6 fe20      cp      $20
75f8 da0076    jp      c,$7600
75fb fe7f      cp      $7f
75fd da0376    jp      c,$7603
7600 3e5e      ld      a,$5e
7602 02        ld      (bc),a
7603 03        inc     bc
7604 15        dec     d
7605 c2f575    jp      nz,$75f5
7608 c9        ret     

7609 c5        push    bc
760a cd5715    call    $1557
760d 220402    ld      ($0204),hl
7610 2ac605    ld      hl,($05c6)
7613 eb        ex      de,hl
7614 e1        pop     hl
7615 72        ld      (hl),d
7616 23        inc     hl
7617 73        ld      (hl),e
7618 c9        ret     

7619 af        xor     a
761a c31f76    jp      $761f
761d 3e01      ld      a,$01
761f e1        pop     hl
7620 22eb03    ld      ($03eb),hl
7623 eb        ex      de,hl
7624 56        ld      d,(hl)
7625 23        inc     hl
7626 5e        ld      e,(hl)
7627 eb        ex      de,hl
7628 e3        ex      (sp),hl
7629 56        ld      d,(hl)
762a 23        inc     hl
762b 5e        ld      e,(hl)
762c 60        ld      h,b
762d 69        ld      l,c
762e 46        ld      b,(hl)
762f 23        inc     hl
7630 4e        ld      c,(hl)
7631 e1        pop     hl
7632 e3        ex      (sp),hl
7633 2b        dec     hl
7634 eb        ex      de,hl
7635 19        add     hl,de
7636 eb        ex      de,hl
7637 09        add     hl,bc
7638 44        ld      b,h
7639 4d        ld      c,l
763a 2aeb03    ld      hl,($03eb)
763d e3        ex      (sp),hl
763e b7        or      a
763f c24f76    jp      nz,$764f
7642 19        add     hl,de
7643 7d        ld      a,l
7644 91        sub     c
7645 7c        ld      a,h
7646 98        sbc     a,b
7647 d0        ret     nc

7648 7e        ld      a,(hl)
7649 12        ld      (de),a
764a 23        inc     hl
764b 13        inc     de
764c c34376    jp      $7643
764f c5        push    bc
7650 79        ld      a,c
7651 95        sub     l
7652 6f        ld      l,a
7653 78        ld      a,b
7654 9c        sbc     a,h
7655 67        ld      h,a
7656 c1        pop     bc
7657 7b        ld      a,e
7658 95        sub     l
7659 7a        ld      a,d
765a 9c        sbc     a,h
765b d0        ret     nc

765c 2b        dec     hl
765d 0b        dec     bc
765e 7e        ld      a,(hl)
765f 02        ld      (bc),a
7660 c35776    jp      $7657
7663 60        ld      h,b
7664 69        ld      l,c
7665 4e        ld      c,(hl)
7666 23        inc     hl
7667 46        ld      b,(hl)
7668 eb        ex      de,hl
7669 5e        ld      e,(hl)
766a 23        inc     hl
766b 56        ld      d,(hl)
766c c33601    jp      $0136
766f 1a        ld      a,(de)
7670 b7        or      a
7671 c8        ret     z

7672 57        ld      d,a
7673 0a        ld      a,(bc)
7674 b7        or      a
7675 17        rla     
7676 15        dec     d
7677 c27476    jp      nz,$7674
767a 02        ld      (bc),a
767b c9        ret     

767c 1a        ld      a,(de)
767d b7        or      a
767e c8        ret     z

767f 57        ld      d,a
7680 0a        ld      a,(bc)
7681 b7        or      a
7682 1f        rra     
7683 15        dec     d
7684 c28176    jp      nz,$7681
7687 02        ld      (bc),a
7688 c9        ret     

7689 60        ld      h,b
768a 69        ld      l,c
768b 1a        ld      a,(de)
768c 0600      ld      b,$00
768e 4f        ld      c,a
768f 0b        dec     bc
7690 09        add     hl,bc
7691 3e20      ld      a,$20
7693 4d        ld      c,l
7694 2b        dec     hl
7695 23        inc     hl
7696 be        cp      (hl)
7697 ca9576    jp      z,$7695
769a 7d        ld      a,l
769b 91        sub     c
769c eb        ex      de,hl
769d 86        add     a,(hl)
769e 77        ld      (hl),a
769f e1        pop     hl
76a0 e3        ex      (sp),hl
76a1 1a        ld      a,(de)
76a2 77        ld      (hl),a
76a3 c9        ret     

76a4 e1        pop     hl
76a5 22eb03    ld      ($03eb),hl
76a8 e1        pop     hl
76a9 e5        push    hl
76aa c5        push    bc
76ab 6e        ld      l,(hl)
76ac 2600      ld      h,$00
76ae 2b        dec     hl
76af 19        add     hl,de
76b0 110000    ld      de,$0000
76b3 7e        ld      a,(hl)
76b4 fe41      cp      $41
76b6 dacf76    jp      c,$76cf
76b9 fe5b      cp      $5b
76bb dade76    jp      c,$76de
76be fe61      cp      $61
76c0 dae676    jp      c,$76e6
76c3 fe7b      cp      $7b
76c5 d2e676    jp      nc,$76e6
76c8 d620      sub     $20
76ca 1601      ld      d,$01
76cc c3de76    jp      $76de
76cf fe2d      cp      $2d
76d1 cade76    jp      z,$76de
76d4 fe30      cp      $30
76d6 dae676    jp      c,$76e6
76d9 fe3a      cp      $3a
76db d2e676    jp      nc,$76e6
76de 02        ld      (bc),a
76df 83        add     a,e
76e0 5f        ld      e,a
76e1 23        inc     hl
76e2 03        inc     bc
76e3 c3b376    jp      $76b3
76e6 0b        dec     bc
76e7 0a        ld      a,(bc)
76e8 c680      add     a,$80
76ea 02        ld      (bc),a
76eb 03        inc     bc
76ec 46        ld      b,(hl)
76ed 79        ld      a,c
76ee e1        pop     hl
76ef 95        sub     l
76f0 4f        ld      c,a
76f1 e1        pop     hl
76f2 86        add     a,(hl)
76f3 77        ld      (hl),a
76f4 e1        pop     hl
76f5 71        ld      (hl),c
76f6 e1        pop     hl
76f7 70        ld      (hl),b
76f8 e1        pop     hl
76f9 73        ld      (hl),e
76fa e1        pop     hl
76fb 72        ld      (hl),d
76fc 2aeb03    ld      hl,($03eb)
76ff e9        jp      (hl)
7700 e1        pop     hl
7701 22eb03    ld      ($03eb),hl
7704 e1        pop     hl
7705 7e        ld      a,(hl)
7706 e1        pop     hl
7707 e5        push    hl
7708 c5        push    bc
7709 6e        ld      l,(hl)
770a 2600      ld      h,$00
770c 2b        dec     hl
770d 19        add     hl,de
770e 57        ld      d,a
770f 1e00      ld      e,$00
7711 7e        ld      a,(hl)
7712 fe30      cp      $30
7714 da2277    jp      c,$7722
7717 fe3a      cp      $3a
7719 d24177    jp      nc,$7741
771c 02        ld      (bc),a
771d 03        inc     bc
771e 23        inc     hl
771f c31177    jp      $7711
7722 fe20      cp      $20
7724 ca4177    jp      z,$7741
7727 ba        cp      d
7728 c24177    jp      nz,$7741
772b 23        inc     hl
772c 7e        ld      a,(hl)
772d fe20      cp      $20
772f 2b        dec     hl
7730 ca4177    jp      z,$7741
7733 af        xor     a
7734 bb        cp      e
7735 c24177    jp      nz,$7741
7738 79        ld      a,c
7739 e3        ex      (sp),hl
773a 95        sub     l
773b e3        ex      (sp),hl
773c 3c        inc     a
773d 5f        ld      e,a
773e c31e77    jp      $771e
7741 79        ld      a,c
7742 c1        pop     bc
7743 91        sub     c
7744 e3        ex      (sp),hl
7745 57        ld      d,a
7746 86        add     a,(hl)
7747 77        ld      (hl),a
7748 7b        ld      a,e
7749 b7        or      a
774a ca4e77    jp      z,$774e
774d 34        inc     (hl)
774e e1        pop     hl
774f e3        ex      (sp),hl
7750 73        ld      (hl),e
7751 e1        pop     hl
7752 e3        ex      (sp),hl
7753 72        ld      (hl),d
7754 e1        pop     hl
7755 7e        ld      a,(hl)
7756 e1        pop     hl
7757 77        ld      (hl),a
7758 60        ld      h,b
7759 69        ld      l,c
775a 7a        ld      a,d
775b cd100c    call    $0c10
775e e1        pop     hl
775f 72        ld      (hl),d
7760 23        inc     hl
7761 73        ld      (hl),e
7762 2aeb03    ld      hl,($03eb)
7765 e9        jp      (hl)
7766 c9        ret     

7767 2a0b02    ld      hl,($020b)
776a f9        ld      sp,hl
776b d1        pop     de
776c 0a        ld      a,(bc)
776d 87        add     a,a
776e 87        add     a,a
776f 2f        cpl     
7770 d6ff      sub     $ff
7772 2a9a02    ld      hl,($029a)
7775 4f        ld      c,a
7776 9f        sbc     a,a
7777 47        ld      b,a
7778 09        add     hl,bc
7779 f9        ld      sp,hl
777a c31e08    jp      $081e
777d 1a        ld      a,(de)
777e e1        pop     hl
777f e3        ex      (sp),hl
7780 1600      ld      d,$00
7782 5e        ld      e,(hl)
7783 3d        dec     a
7784 ca8a77    jp      z,$778a
7787 53        ld      d,e
7788 23        inc     hl
7789 5e        ld      e,(hl)
778a e1        pop     hl
778b e3        ex      (sp),hl
778c 0a        ld      a,(bc)
778d c3d30b    jp      $0bd3
7790 21300b    ld      hl,$0b30
7793 d5        push    de
7794 e5        push    hl
7795 60        ld      h,b
7796 69        ld      l,c
7797 46        ld      b,(hl)
7798 23        inc     hl
7799 4e        ld      c,(hl)
779a eb        ex      de,hl
779b 56        ld      d,(hl)
779c 23        inc     hl
779d 5e        ld      e,(hl)
779e 21a377    ld      hl,$77a3
77a1 e3        ex      (sp),hl
77a2 e9        jp      (hl)
77a3 e1        pop     hl
77a4 72        ld      (hl),d
77a5 23        inc     hl
77a6 73        ld      (hl),e
77a7 c9        ret     

77a8 21530b    ld      hl,$0b53
77ab c39377    jp      $7793
77ae 3a4349    ld      a,($4943)
77b1 3a2020    ld      a,($2020)
77b4 3a434f    ld      a,($4f43)
77b7 3a2020    ld      a,($2020)
77ba 00        nop     
77bb 00        nop     
77bc 00        nop     
77bd f5        push    af
77be d5        push    de
77bf e5        push    hl
77c0 af        xor     a
77c1 32bc77    ld      ($77bc),a
77c4 2a7003    ld      hl,($0370)
77c7 7c        ld      a,h
77c8 65        ld      h,l
77c9 6f        ld      l,a
77ca 22ba77    ld      ($77ba),hl
77cd e5        push    hl
77ce 11eb03    ld      de,$03eb
77d1 eb        ex      de,hl
77d2 0e14      ld      c,$14
77d4 cda70b    call    $0ba7
77d7 217404    ld      hl,$0474
77da e5        push    hl
77db e1        pop     hl
77dc 7e        ld      a,(hl)
77dd b7        or      a
77de cafb77    jp      z,$77fb
77e1 44        ld      b,h
77e2 4d        ld      c,l
77e3 23        inc     hl
77e4 23        inc     hl
77e5 23        inc     hl
77e6 23        inc     hl
77e7 e5        push    hl
77e8 2aba77    ld      hl,($77ba)
77eb eb        ex      de,hl
77ec cd8816    call    $1688
77ef 014004    ld      bc,$0440
77f2 cd2d01    call    $012d
77f5 da1178    jp      c,$7811
77f8 c3db77    jp      $77db
77fb e1        pop     hl
77fc 0e14      ld      c,$14
77fe 11eb03    ld      de,$03eb
7801 cda70b    call    $0ba7
7804 3abc77    ld      a,($77bc)
7807 b7        or      a
7808 ca0c78    jp      z,$780c
780b 37        scf     
780c e1        pop     hl
780d d1        pop     de
780e c1        pop     bc
780f 78        ld      a,b
7810 c9        ret     

7811 21bc77    ld      hl,$77bc
7814 34        inc     (hl)
7815 c3db77    jp      $77db
7818 60        ld      h,b
7819 69        ld      l,c
781a 1a        ld      a,(de)
781b 47        ld      b,a
781c 05        dec     b
781d f8        ret     m

781e 4e        ld      c,(hl)
781f 23        inc     hl
7820 cd3301    call    $0133
7823 c31c78    jp      $781c
7826 c5        push    bc
7827 0e01      ld      c,$01
7829 c32f78    jp      $782f
782c c5        push    bc
782d 0e0b      ld      c,$0b
782f cd0500    call    $0005
7832 c1        pop     bc
7833 02        ld      (bc),a
7834 c9        ret     

7835 43        ld      b,e
7836 35        dec     (hl)
7837 49        ld      c,c
7838 35        dec     (hl)
7839 ae        xor     (hl)
783a 77        ld      (hl),a
783b b4        or      h
783c 77        ld      (hl),a
783d 00        nop     
783e 00        nop     
783f c5        push    bc
7840 eb        ex      de,hl
7841 56        ld      d,(hl)
7842 23        inc     hl
7843 5e        ld      e,(hl)
7844 2a4602    ld      hl,($0246)
7847 19        add     hl,de
7848 eb        ex      de,hl
7849 210b00    ld      hl,$000b
784c 19        add     hl,de
784d 7e        ld      a,(hl)
784e b7        or      a
784f c25d78    jp      nz,$785d
7852 210d00    ld      hl,$000d
7855 19        add     hl,de
7856 56        ld      d,(hl)
7857 23        inc     hl
7858 5e        ld      e,(hl)
7859 2a4602    ld      hl,($0246)
785c 19        add     hl,de
785d 113578    ld      de,$7835
7860 e5        push    hl
7861 1a        ld      a,(de)
7862 13        inc     de
7863 4f        ld      c,a
7864 1a        ld      a,(de)
7865 13        inc     de
7866 47        ld      b,a
7867 b1        or      c
7868 ca7c78    jp      z,$787c
786b e1        pop     hl
786c e5        push    hl
786d 0a        ld      a,(bc)
786e be        cp      (hl)
786f c26178    jp      nz,$7861
7872 3e20      ld      a,$20
7874 be        cp      (hl)
7875 23        inc     hl
7876 03        inc     bc
7877 c26d78    jp      nz,$786d
787a 3e01      ld      a,$01
787c e1        pop     hl
787d e1        pop     hl
787e 77        ld      (hl),a
787f c9        ret     

7880 cdf978    call    $78f9
7883 cded73    call    $73ed
7886 d5        push    de
7887 cdeb78    call    $78eb
788a 2ae834    ld      hl,($34e8)
788d eb        ex      de,hl
788e 3aed34    ld      a,($34ed)
7891 b7        or      a
7892 f29878    jp      p,$7898
7895 13        inc     de
7896 e67f      and     $7f
7898 e1        pop     hl
7899 73        ld      (hl),e
789a 23        inc     hl
789b 72        ld      (hl),d
789c 23        inc     hl
789d 77        ld      (hl),a
789e c3de78    jp      $78de
78a1 cdf978    call    $78f9
78a4 cded73    call    $73ed
78a7 d5        push    de
78a8 cdeb78    call    $78eb
78ab d1        pop     de
78ac 1a        ld      a,(de)
78ad 13        inc     de
78ae 32e834    ld      ($34e8),a
78b1 1a        ld      a,(de)
78b2 13        inc     de
78b3 32e934    ld      ($34e9),a
78b6 1a        ld      a,(de)
78b7 32ed34    ld      ($34ed),a
78ba cd7e28    call    $287e
78bd cd022a    call    $2a02
78c0 cd7e2a    call    $2a7e
78c3 c3de78    jp      $78de
78c6 00        nop     
78c7 00        nop     
78c8 e5        push    hl
78c9 e5        push    hl
78ca e5        push    hl
78cb e5        push    hl
78cc e5        push    hl
78cd e5        push    hl
78ce e5        push    hl
78cf e5        push    hl
78d0 e5        push    hl
78d1 e5        push    hl
78d2 e5        push    hl
78d3 e5        push    hl
78d4 e5        push    hl
78d5 e5        push    hl
78d6 e5        push    hl
78d7 e5        push    hl
78d8 da782a    jp      c,$2a78
78db c678      add     a,$78
78dd f9        ld      sp,hl
78de e1        pop     hl
78df e3        ex      (sp),hl
78e0 eb        ex      de,hl
78e1 2a6036    ld      hl,($3660)
78e4 7e        ld      a,(hl)
78e5 12        ld      (de),a
78e6 23        inc     hl
78e7 13        inc     de
78e8 7e        ld      a,(hl)
78e9 12        ld      (de),a
78ea c9        ret     

78eb 2a6036    ld      hl,($3660)
78ee e5        push    hl
78ef 54        ld      d,h
78f0 5d        ld      e,l
78f1 3630      ld      (hl),$30
78f3 23        inc     hl
78f4 3630      ld      (hl),$30
78f6 c3572a    jp      $2a57
78f9 21d878    ld      hl,$78d8
78fc 225836    ld      ($3658),hl
78ff 210000    ld      hl,$0000
7902 39        add     hl,sp
7903 22c678    ld      ($78c6),hl
7906 c9        ret     

7907 00        nop     
7908 00        nop     
7909 00        nop     
790a 00        nop     
790b 84        add     a,h
790c 81        add     a,c
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
7953 59        ld      e,c
7954 80        add     a,b
7955 00        nop     
7956 00        nop     
7957 011bd5    ld      bc,$d51b
795a 63        ld      h,e
795b 6a        ld      l,d
795c 224179    ld      ($7941),hl
795f 210000    ld      hl,$0000
7962 39        add     hl,sp
7963 220d79    ld      ($790d),hl
7966 214579    ld      hl,$7945
7969 7e        ld      a,(hl)
796a 3602      ld      (hl),$02
796c 21d47a    ld      hl,$7ad4
796f b7        or      a
7970 ccb27a    call    z,$7ab2
7973 2a2502    ld      hl,($0225)
7976 5c        ld      e,h
7977 65        ld      h,l
7978 6b        ld      l,e
7979 224a79    ld      ($794a),hl
797c 2a1f02    ld      hl,($021f)
797f 5c        ld      e,h
7980 65        ld      h,l
7981 6b        ld      l,e
7982 224c79    ld      ($794c),hl
7985 2a1d02    ld      hl,($021d)
7988 5c        ld      e,h
7989 65        ld      h,l
798a 6b        ld      l,e
798b 224e79    ld      ($794e),hl
798e cdb379    call    $79b3
7991 cd2a7a    call    $7a2a
7994 3a3879    ld      a,($7938)
7997 b7        or      a
7998 c2f579    jp      nz,$79f5
799b 3a3979    ld      a,($7939)
799e b7        or      a
799f c2f579    jp      nz,$79f5
79a2 c38e79    jp      $798e
79a5 cdb379    call    $79b3
79a8 fe0d      cp      $0d
79aa caa579    jp      z,$79a5
79ad fe0a      cp      $0a
79af caa579    jp      z,$79a5
79b2 c9        ret     

79b3 3a0779    ld      a,($7907)
79b6 e602      and     $02
79b8 c2c979    jp      nz,$79c9
79bb cd167a    call    $7a16
79be fe20      cp      $20
79c0 cabb79    jp      z,$79bb
79c3 fe11      cp      $11
79c5 cabb79    jp      z,$79bb
79c8 c9        ret     

79c9 3a0779    ld      a,($7907)
79cc e601      and     $01
79ce c2db79    jp      nz,$79db
79d1 2a3a79    ld      hl,($793a)
79d4 cde579    call    $79e5
79d7 223a79    ld      ($793a),hl
79da c9        ret     

79db 2a3d79    ld      hl,($793d)
79de cde579    call    $79e5
79e1 223d79    ld      ($793d),hl
79e4 c9        ret     

79e5 7e        ld      a,(hl)
79e6 23        inc     hl
79e7 fe20      cp      $20
79e9 cae579    jp      z,$79e5
79ec fe11      cp      $11
79ee cae579    jp      z,$79e5
79f1 325579    ld      ($7955),a
79f4 c9        ret     

79f5 2a3879    ld      hl,($7938)
79f8 e5        push    hl
79f9 210000    ld      hl,$0000
79fc 223879    ld      ($7938),hl
79ff cdb77d    call    $7db7
7a02 2a0b79    ld      hl,($790b)
7a05 01e6ff    ld      bc,$ffe6
7a08 09        add     hl,bc
7a09 220b79    ld      ($790b),hl
7a0c cd2d7e    call    $7e2d
7a0f e1        pop     hl
7a10 223d79    ld      ($793d),hl
7a13 c39479    jp      $7994
7a16 cd0683    call    $8306
7a19 325579    ld      ($7955),a
7a1c 3a5779    ld      a,($7957)
7a1f b7        or      a
7a20 3a5579    ld      a,($7955)
7a23 c4a283    call    nz,$83a2
7a26 325579    ld      ($7955),a
7a29 c9        ret     

7a2a 3a4079    ld      a,($7940)
7a2d b7        or      a
7a2e c4f47e    call    nz,$7ef4
7a31 3a5579    ld      a,($7955)
7a34 cd427a    call    $7a42
7a37 5e        ld      e,(hl)
7a38 23        inc     hl
7a39 56        ld      d,(hl)
7a3a 23        inc     hl
7a3b 7e        ld      a,(hl)
7a3c b7        or      a
7a3d c2b77d    jp      nz,$7db7
7a40 eb        ex      de,hl
7a41 e9        jp      (hl)
7a42 218581    ld      hl,$8185
7a45 4f        ld      c,a
7a46 0600      ld      b,$00
7a48 09        add     hl,bc
7a49 09        add     hl,bc
7a4a 09        add     hl,bc
7a4b c9        ret     

7a4c 2a5379    ld      hl,($7953)
7a4f eb        ex      de,hl
7a50 cda579    call    $79a5
7a53 cd427a    call    $7a42
7a56 73        ld      (hl),e
7a57 23        inc     hl
7a58 72        ld      (hl),d
7a59 23        inc     hl
7a5a 3e01      ld      a,$01
7a5c 77        ld      (hl),a
7a5d cda579    call    $79a5
7a60 12        ld      (de),a
7a61 13        inc     de
7a62 fe24      cp      $24
7a64 ca737a    jp      z,$7a73
7a67 fe3b      cp      $3b
7a69 c25d7a    jp      nz,$7a5d
7a6c 1b        dec     de
7a6d cdf17c    call    $7cf1
7a70 c35d7a    jp      $7a5d
7a73 eb        ex      de,hl
7a74 225379    ld      ($7953),hl
7a77 c9        ret     

7a78 21c97a    ld      hl,$7ac9
7a7b cdbe7a    call    $7abe
7a7e 3a5579    ld      a,($7955)
7a81 cd5583    call    $8355
7a84 cdb27a    call    $7ab2
7a87 3a0779    ld      a,($7907)
7a8a fe03      cp      $03
7a8c c4f17c    call    nz,$7cf1
7a8f cde87a    call    $7ae8
7a92 210000    ld      hl,$0000
7a95 220779    ld      ($7907),hl
7a98 223d79    ld      ($793d),hl
7a9b 223879    ld      ($7938),hl
7a9e 223a79    ld      ($793a),hl
7aa1 7c        ld      a,h
7aa2 323c79    ld      ($793c),a
7aa5 2a0d79    ld      hl,($790d)
7aa8 f9        ld      sp,hl
7aa9 218481    ld      hl,$8184
7aac 220b79    ld      ($790b),hl
7aaf c38e79    jp      $798e
7ab2 4e        ld      c,(hl)
7ab3 79        ld      a,c
7ab4 fe00      cp      $00
7ab6 c8        ret     z

7ab7 cd5583    call    $8355
7aba 23        inc     hl
7abb c3b27a    jp      $7ab2
7abe 3e0d      ld      a,$0d
7ac0 cd5583    call    $8355
7ac3 3e0a      ld      a,$0a
7ac5 cd5583    call    $8355
7ac8 c9        ret     

7ac9 202d      jr      nz,$7af8
7acb 2065      jr      nz,$7b32
7acd 72        ld      (hl),d
7ace 72        ld      (hl),d
7acf 6f        ld      l,a
7ad0 72        ld      (hl),d
7ad1 0d        dec     c
7ad2 0a        ld      a,(bc)
7ad3 00        nop     
7ad4 0d        dec     c
7ad5 0a        ld      a,(bc)
7ad6 44        ld      b,h
7ad7 65        ld      h,l
7ad8 62        ld      h,d
7ad9 75        ld      (hl),l
7ada 67        ld      h,a
7adb 204d      jr      nz,$7b2a
7add 61        ld      h,c
7ade 72        ld      (hl),d
7adf 6b        ld      l,e
7ae0 2033      jr      nz,$7b15
7ae2 2e31      ld      l,$31
7ae4 0d        dec     c
7ae5 0a        ld      a,(bc)
7ae6 3f        ccf     
7ae7 00        nop     
7ae8 3e3f      ld      a,$3f
7aea cd5583    call    $8355
7aed c9        ret     

7aee 2a0d79    ld      hl,($790d)
7af1 f9        ld      sp,hl
7af2 d1        pop     de
7af3 1a        ld      a,(de)
7af4 c30108    jp      $0801
7af7 cda579    call    $79a5
7afa fe76      cp      $76
7afc ca1a7b    jp      z,$7b1a
7aff fe75      cp      $75
7b01 cabc7b    jp      z,$7bbc
7b04 fe67      cp      $67
7b06 ca127b    jp      z,$7b12
7b09 fe78      cp      $78
7b0b c2787a    jp      nz,$7a78
7b0e cd897b    call    $7b89
7b11 c9        ret     

7b12 cd897b    call    $7b89
7b15 01ecff    ld      bc,$ffec
7b18 09        add     hl,bc
7b19 c9        ret     

7b1a cda579    call    $79a5
7b1d 323f79    ld      ($793f),a
7b20 fe22      cp      $22
7b22 ca647b    jp      z,$7b64
7b25 fe70      cp      $70
7b27 ca7d7b    jp      z,$7b7d
7b2a fe77      cp      $77
7b2c ca817b    jp      z,$7b81
7b2f fe66      cp      $66
7b31 ca857b    jp      z,$7b85
7b34 324879    ld      ($7948),a
7b37 cda579    call    $79a5
7b3a 324979    ld      ($7949),a
7b3d cdc97b    call    $7bc9
7b40 324779    ld      ($7947),a
7b43 cda97d    call    $7da9
7b46 214779    ld      hl,$7947
7b49 c0        ret     nz

7b4a 3a4779    ld      a,($7947)
7b4d 324679    ld      ($7946),a
7b50 cda579    call    $79a5
7b53 324879    ld      ($7948),a
7b56 cda579    call    $79a5
7b59 324979    ld      ($7949),a
7b5c cdc97b    call    $7bc9
7b5f 214779    ld      hl,$7947
7b62 77        ld      (hl),a
7b63 c9        ret     

7b64 cda579    call    $79a5
7b67 214779    ld      hl,$7947
7b6a 77        ld      (hl),a
7b6b cda97d    call    $7da9
7b6e c0        ret     nz

7b6f 3a4779    ld      a,($7947)
7b72 324679    ld      ($7946),a
7b75 cda579    call    $79a5
7b78 214779    ld      hl,$7947
7b7b 77        ld      (hl),a
7b7c c9        ret     

7b7d 214b79    ld      hl,$794b
7b80 c9        ret     

7b81 214d79    ld      hl,$794d
7b84 c9        ret     

7b85 214f79    ld      hl,$794f
7b88 c9        ret     

7b89 cda579    call    $79a5
7b8c fe73      cp      $73
7b8e cab07b    jp      z,$7bb0
7b91 fe70      cp      $70
7b93 cab47b    jp      z,$7bb4
7b96 fe66      cp      $66
7b98 cab87b    jp      z,$7bb8
7b9b fe30      cp      $30
7b9d da787a    jp      c,$7a78
7ba0 fe3a      cp      $3a
7ba2 f2787a    jp      p,$7a78
7ba5 d630      sub     $30
7ba7 07        rlca    
7ba8 4f        ld      c,a
7ba9 0600      ld      b,$00
7bab 212479    ld      hl,$7924
7bae 09        add     hl,bc
7baf c9        ret     

7bb0 214479    ld      hl,$7944
7bb3 c9        ret     

7bb4 214279    ld      hl,$7942
7bb7 c9        ret     

7bb8 213779    ld      hl,$7937
7bbb c9        ret     

7bbc cd897b    call    $7b89
7bbf 5e        ld      e,(hl)
7bc0 2b        dec     hl
7bc1 56        ld      d,(hl)
7bc2 eb        ex      de,hl
7bc3 cda97d    call    $7da9
7bc6 c0        ret     nz

7bc7 23        inc     hl
7bc8 c9        ret     

7bc9 3a4879    ld      a,($7948)
7bcc cd077f    call    $7f07
7bcf da787a    jp      c,$7a78
7bd2 07        rlca    
7bd3 07        rlca    
7bd4 07        rlca    
7bd5 07        rlca    
7bd6 5f        ld      e,a
7bd7 3a4979    ld      a,($7949)
7bda cd077f    call    $7f07
7bdd da787a    jp      c,$7a78
7be0 83        add     a,e
7be1 c9        ret     

7be2 cdf77a    call    $7af7
7be5 7e        ld      a,(hl)
7be6 325279    ld      ($7952),a
7be9 cda97d    call    $7da9
7bec c0        ret     nz

7bed 2b        dec     hl
7bee 7e        ld      a,(hl)
7bef 325179    ld      ($7951),a
7bf2 c9        ret     

7bf3 cdf77a    call    $7af7
7bf6 3a5279    ld      a,($7952)
7bf9 77        ld      (hl),a
7bfa cda97d    call    $7da9
7bfd c0        ret     nz

7bfe 2b        dec     hl
7bff 3a5179    ld      a,($7951)
7c02 77        ld      (hl),a
7c03 c9        ret     

7c04 cdf77a    call    $7af7
7c07 3a5279    ld      a,($7952)
7c0a a6        and     (hl)
7c0b 325279    ld      ($7952),a
7c0e cda97d    call    $7da9
7c11 c0        ret     nz

7c12 3a5179    ld      a,($7951)
7c15 2b        dec     hl
7c16 a6        and     (hl)
7c17 325179    ld      ($7951),a
7c1a c9        ret     

7c1b cdf77a    call    $7af7
7c1e 3a5279    ld      a,($7952)
7c21 b6        or      (hl)
7c22 325279    ld      ($7952),a
7c25 cda97d    call    $7da9
7c28 c0        ret     nz

7c29 3a5179    ld      a,($7951)
7c2c 2b        dec     hl
7c2d b6        or      (hl)
7c2e 325179    ld      ($7951),a
7c31 c9        ret     

7c32 cdf77a    call    $7af7
7c35 3a5279    ld      a,($7952)
7c38 86        add     a,(hl)
7c39 325279    ld      ($7952),a
7c3c cda97d    call    $7da9
7c3f c0        ret     nz

7c40 3a5179    ld      a,($7951)
7c43 2b        dec     hl
7c44 8e        adc     a,(hl)
7c45 325179    ld      ($7951),a
7c48 c9        ret     

7c49 cdf77a    call    $7af7
7c4c 3a5279    ld      a,($7952)
7c4f 96        sub     (hl)
7c50 325279    ld      ($7952),a
7c53 cda97d    call    $7da9
7c56 c0        ret     nz

7c57 3a5179    ld      a,($7951)
7c5a 2b        dec     hl
7c5b 9e        sbc     a,(hl)
7c5c 325179    ld      ($7951),a
7c5f c9        ret     

7c60 cdf77a    call    $7af7
7c63 cda97d    call    $7da9
7c66 c27a7c    jp      nz,$7c7a
7c69 2b        dec     hl
7c6a 3a5179    ld      a,($7951)
7c6d be        cp      (hl)
7c6e ca797c    jp      z,$7c79
7c71 3e00      ld      a,$00
7c73 323779    ld      ($7937),a
7c76 3e80      ld      a,$80
7c78 c9        ret     

7c79 23        inc     hl
7c7a 3a5279    ld      a,($7952)
7c7d be        cp      (hl)
7c7e c3717c    jp      $7c71
7c81 cd607c    call    $7c60
7c84 d0        ret     nc

7c85 323779    ld      ($7937),a
7c88 c9        ret     

7c89 cd607c    call    $7c60
7c8c c8        ret     z

7c8d f8        ret     m

7c8e 323779    ld      ($7937),a
7c91 c9        ret     

7c92 cd607c    call    $7c60
7c95 c0        ret     nz

7c96 323779    ld      ($7937),a
7c99 c9        ret     

7c9a 3a5279    ld      a,($7952)
7c9d 2f        cpl     
7c9e 325279    ld      ($7952),a
7ca1 cda97d    call    $7da9
7ca4 c0        ret     nz

7ca5 3a5179    ld      a,($7951)
7ca8 2f        cpl     
7ca9 325179    ld      ($7951),a
7cac c9        ret     

7cad 215279    ld      hl,$7952
7cb0 34        inc     (hl)
7cb1 c0        ret     nz

7cb2 cda97d    call    $7da9
7cb5 c0        ret     nz

7cb6 2b        dec     hl
7cb7 34        inc     (hl)
7cb8 c9        ret     

7cb9 215279    ld      hl,$7952
7cbc 35        dec     (hl)
7cbd d0        ret     nc

7cbe cda97d    call    $7da9
7cc1 c0        ret     nz

7cc2 2b        dec     hl
7cc3 35        dec     (hl)
7cc4 c9        ret     

7cc5 3a5279    ld      a,($7952)
7cc8 37        scf     
7cc9 3f        ccf     
7cca 17        rla     
7ccb 325279    ld      ($7952),a
7cce cda97d    call    $7da9
7cd1 c0        ret     nz

7cd2 3a5179    ld      a,($7951)
7cd5 17        rla     
7cd6 325179    ld      ($7951),a
7cd9 c9        ret     

7cda cda97d    call    $7da9
7cdd 37        scf     
7cde 3f        ccf     
7cdf c2e97c    jp      nz,$7ce9
7ce2 3a5179    ld      a,($7951)
7ce5 1f        rra     
7ce6 325179    ld      ($7951),a
7ce9 3a5279    ld      a,($7952)
7cec 1f        rra     
7ced 325279    ld      ($7952),a
7cf0 c9        ret     

7cf1 cdb379    call    $79b3
7cf4 fe0d      cp      $0d
7cf6 c2f17c    jp      nz,$7cf1
7cf9 c9        ret     

7cfa c7        rst     $00
7cfb c9        ret     

7cfc e1        pop     hl
7cfd c3ee7a    jp      $7aee
7d00 c3a579    jp      $79a5
7d03 3a0779    ld      a,($7907)
7d06 fe03      cp      $03
7d08 c2787a    jp      nz,$7a78
7d0b cda579    call    $79a5
7d0e 5f        ld      e,a
7d0f cda579    call    $79a5
7d12 fe2b      cp      $2b
7d14 ca3c7d    jp      z,$7d3c
7d17 fe2d      cp      $2d
7d19 c2787a    jp      nz,$7a78
7d1c 2a3d79    ld      hl,($793d)
7d1f 2b        dec     hl
7d20 2b        dec     hl
7d21 2b        dec     hl
7d22 7e        ld      a,(hl)
7d23 fe20      cp      $20
7d25 ca217d    jp      z,$7d21
7d28 bb        cp      e
7d29 c2217d    jp      nz,$7d21
7d2c 2b        dec     hl
7d2d 7e        ld      a,(hl)
7d2e fe20      cp      $20
7d30 ca2c7d    jp      z,$7d2c
7d33 fe3a      cp      $3a
7d35 c2217d    jp      nz,$7d21
7d38 223d79    ld      ($793d),hl
7d3b c9        ret     

7d3c cda579    call    $79a5
7d3f fe3a      cp      $3a
7d41 c23c7d    jp      nz,$7d3c
7d44 cda579    call    $79a5
7d47 bb        cp      e
7d48 c23c7d    jp      nz,$7d3c
7d4b c9        ret     

7d4c 210000    ld      hl,$0000
7d4f 39        add     hl,sp
7d50 eb        ex      de,hl
7d51 2a0b79    ld      hl,($790b)
7d54 f9        ld      sp,hl
7d55 3a3779    ld      a,($7937)
7d58 f5        push    af
7d59 210000    ld      hl,$0000
7d5c 39        add     hl,sp
7d5d 220b79    ld      ($790b),hl
7d60 eb        ex      de,hl
7d61 f9        ld      sp,hl
7d62 c9        ret     

7d63 210000    ld      hl,$0000
7d66 39        add     hl,sp
7d67 eb        ex      de,hl
7d68 2a0b79    ld      hl,($790b)
7d6b f9        ld      sp,hl
7d6c f1        pop     af
7d6d 323779    ld      ($7937),a
7d70 210000    ld      hl,$0000
7d73 39        add     hl,sp
7d74 220b79    ld      ($790b),hl
7d77 eb        ex      de,hl
7d78 f9        ld      sp,hl
7d79 c9        ret     

7d7a 0600      ld      b,$00
7d7c cda579    call    $79a5
7d7f fe28      cp      $28
7d81 c2857d    jp      nz,$7d85
7d84 04        inc     b
7d85 fe29      cp      $29
7d87 c27c7d    jp      nz,$7d7c
7d8a 05        dec     b
7d8b 3e00      ld      a,$00
7d8d b8        cp      b
7d8e c8        ret     z

7d8f c37c7d    jp      $7d7c
7d92 3a3779    ld      a,($7937)
7d95 b7        or      a
7d96 c0        ret     nz

7d97 c37a7d    jp      $7d7a
7d9a 3a3779    ld      a,($7937)
7d9d b7        or      a
7d9e c8        ret     z

7d9f c37a7d    jp      $7d7a
7da2 3a5579    ld      a,($7955)
7da5 325079    ld      ($7950),a
7da8 c9        ret     

7da9 1f        rra     
7daa 325679    ld      ($7956),a
7dad 3a5079    ld      a,($7950)
7db0 fe61      cp      $61
7db2 3a5679    ld      a,($7956)
7db5 17        rla     
7db6 c9        ret     

7db7 cdd87d    call    $7dd8
7dba cd067e    call    $7e06
7dbd 2a3d79    ld      hl,($793d)
7dc0 223a79    ld      ($793a),hl
7dc3 eb        ex      de,hl
7dc4 223d79    ld      ($793d),hl
7dc7 3a0879    ld      a,($7908)
7dca 323c79    ld      ($793c),a
7dcd 3e02      ld      a,$02
7dcf 320879    ld      ($7908),a
7dd2 3e03      ld      a,$03
7dd4 320779    ld      ($7907),a
7dd7 c9        ret     

7dd8 2a5379    ld      hl,($7953)
7ddb 012700    ld      bc,$0027
7dde 09        add     hl,bc
7ddf 3a0c79    ld      a,($790c)
7de2 bc        cp      h
7de3 daec7d    jp      c,$7dec
7de6 c0        ret     nz

7de7 3a0b79    ld      a,($790b)
7dea bd        cp      l
7deb d0        ret     nc

7dec 21f57d    ld      hl,$7df5
7def cdb27a    call    $7ab2
7df2 c3787a    jp      $7a78
7df5 0d        dec     c
7df6 0a        ld      a,(bc)
7df7 53        ld      d,e
7df8 74        ld      (hl),h
7df9 61        ld      h,c
7dfa 63        ld      h,e
7dfb 6b        ld      l,e
7dfc 206f      jr      nz,$7e6d
7dfe 76        halt    
7dff 65        ld      h,l
7e00 72        ld      (hl),d
7e01 66        ld      h,(hl)
7e02 6c        ld      l,h
7e03 6f        ld      l,a
7e04 77        ld      (hl),a
7e05 00        nop     
7e06 210000    ld      hl,$0000
7e09 39        add     hl,sp
7e0a 220979    ld      ($7909),hl
7e0d 2a0b79    ld      hl,($790b)
7e10 f9        ld      sp,hl
7e11 212379    ld      hl,$7923
7e14 3e00      ld      a,$00
7e16 46        ld      b,(hl)
7e17 23        inc     hl
7e18 4e        ld      c,(hl)
7e19 c5        push    bc
7e1a 23        inc     hl
7e1b 3c        inc     a
7e1c fe0d      cp      $0d
7e1e fa167e    jp      m,$7e16
7e21 210000    ld      hl,$0000
7e24 39        add     hl,sp
7e25 220b79    ld      ($790b),hl
7e28 2a0979    ld      hl,($7909)
7e2b f9        ld      sp,hl
7e2c c9        ret     

7e2d 2a3a79    ld      hl,($793a)
7e30 223d79    ld      ($793d),hl
7e33 3a3c79    ld      a,($793c)
7e36 320879    ld      ($7908),a
7e39 f601      or      $01
7e3b 320779    ld      ($7907),a
7e3e 210000    ld      hl,$0000
7e41 39        add     hl,sp
7e42 220979    ld      ($7909),hl
7e45 2a0b79    ld      hl,($790b)
7e48 f9        ld      sp,hl
7e49 213c79    ld      hl,$793c
7e4c 3e00      ld      a,$00
7e4e c1        pop     bc
7e4f 71        ld      (hl),c
7e50 2b        dec     hl
7e51 70        ld      (hl),b
7e52 2b        dec     hl
7e53 3c        inc     a
7e54 fe0d      cp      $0d
7e56 fa4e7e    jp      m,$7e4e
7e59 210000    ld      hl,$0000
7e5c 39        add     hl,sp
7e5d 220b79    ld      ($790b),hl
7e60 2a0979    ld      hl,($7909)
7e63 f9        ld      sp,hl
7e64 c9        ret     

7e65 cda579    call    $79a5
7e68 fe63      cp      $63
7e6a ca9b7e    jp      z,$7e9b
7e6d cda97d    call    $7da9
7e70 c2797e    jp      nz,$7e79
7e73 3a5179    ld      a,($7951)
7e76 cd807e    call    $7e80
7e79 3a5279    ld      a,($7952)
7e7c cd807e    call    $7e80
7e7f c9        ret     

7e80 324879    ld      ($7948),a
7e83 e6f0      and     $f0
7e85 1f        rra     
7e86 1f        rra     
7e87 1f        rra     
7e88 1f        rra     
7e89 cd197f    call    $7f19
7e8c cd5583    call    $8355
7e8f 3a4879    ld      a,($7948)
7e92 e60f      and     $0f
7e94 cd197f    call    $7f19
7e97 cd5583    call    $8355
7e9a c9        ret     

7e9b cda97d    call    $7da9
7e9e c2a77e    jp      nz,$7ea7
7ea1 3a5179    ld      a,($7951)
7ea4 cd5583    call    $8355
7ea7 3a5279    ld      a,($7952)
7eaa cd5583    call    $8355
7ead c9        ret     

7eae 3a3c79    ld      a,($793c)
7eb1 e602      and     $02
7eb3 320779    ld      ($7907),a
7eb6 cda579    call    $79a5
7eb9 fe72      cp      $72
7ebb cad97e    jp      z,$7ed9
7ebe cd207b    call    $7b20
7ec1 7e        ld      a,(hl)
7ec2 325279    ld      ($7952),a
7ec5 cda97d    call    $7da9
7ec8 c2d07e    jp      nz,$7ed0
7ecb 2b        dec     hl
7ecc 7e        ld      a,(hl)
7ecd 325179    ld      ($7951),a
7ed0 3a0879    ld      a,($7908)
7ed3 f601      or      $01
7ed5 320779    ld      ($7907),a
7ed8 c9        ret     

7ed9 2a3d79    ld      hl,($793d)
7edc e5        push    hl
7edd cdb77d    call    $7db7
7ee0 2a0b79    ld      hl,($790b)
7ee3 011a00    ld      bc,$001a
7ee6 09        add     hl,bc
7ee7 220b79    ld      ($790b),hl
7eea cd2d7e    call    $7e2d
7eed e1        pop     hl
7eee 223879    ld      ($7938),hl
7ef1 c3ae7e    jp      $7eae
7ef4 3a5579    ld      a,($7955)
7ef7 cd5583    call    $8355
7efa c9        ret     

7efb 3e01      ld      a,$01
7efd 324079    ld      ($7940),a
7f00 c9        ret     

7f01 3e00      ld      a,$00
7f03 324079    ld      ($7940),a
7f06 c9        ret     

7f07 d630      sub     $30
7f09 d8        ret     c

7f0a c6e9      add     a,$e9
7f0c d8        ret     c

7f0d c606      add     a,$06
7f0f f2157f    jp      p,$7f15
7f12 c607      add     a,$07
7f14 d8        ret     c

7f15 c60a      add     a,$0a
7f17 b7        or      a
7f18 c9        ret     

7f19 e60f      and     $0f
7f1b c690      add     a,$90
7f1d 27        daa     
7f1e ce40      adc     a,$40
7f20 27        daa     
7f21 4f        ld      c,a
7f22 c9        ret     

7f23 3a5779    ld      a,($7957)
7f26 ee01      xor     $01
7f28 325779    ld      ($7957),a
7f2b c9        ret     

7f2c c9        ret     

7f2d 61        ld      h,c
7f2e 72        ld      (hl),d
7f2f 2b        dec     hl
7f30 76        halt    
7f31 66        ld      h,(hl)
7f32 73        ld      (hl),e
7f33 78        ld      a,b
7f34 316272    ld      sp,$7262
7f37 73        ld      (hl),e
7f38 75        ld      (hl),l
7f39 312462    ld      sp,$6224
7f3c 72        ld      (hl),d
7f3d 77        ld      (hl),a
7f3e 63        ld      h,e
7f3f 24        inc     h
7f40 61        ld      h,c
7f41 72        ld      (hl),d
7f42 2b        dec     hl
7f43 76        halt    
7f44 66        ld      h,(hl)
7f45 73        ld      (hl),e
7f46 78        ld      a,b
7f47 312b76    ld      sp,$762b
7f4a 3030      jr      nc,$7f7c
7f4c 313073    ld      sp,$7330
7f4f 78        ld      a,b
7f50 323a61    ld      ($613a),a
7f53 62        ld      h,d
7f54 6c        ld      l,h
7f55 75        ld      (hl),l
7f56 317768    ld      sp,$6877
7f59 6c        ld      l,h
7f5a 76        halt    
7f5b 222d77    ld      ($772d),hl
7f5e 63        ld      h,e
7f5f 6c        ld      l,h
7f60 76        halt    
7f61 323073    ld      ($7330),a
7f64 78        ld      a,b
7f65 35        dec     (hl)
7f66 6c        ld      l,h
7f67 75        ld      (hl),l
7f68 313e76    ld      sp,$763e
7f6b 323074    ld      ($7430),a
7f6e 283c      jr      z,$7fac
7f70 76        halt    
7f71 3830      jr      c,$7fa3
7f73 74        ld      (hl),h
7f74 2873      jr      z,$7fe9
7f76 78        ld      a,b
7f77 35        dec     (hl)
7f78 29        add     hl,hl
7f79 29        add     hl,hl
7f7a 6c        ld      l,h
7f7b 78        ld      a,b
7f7c 35        dec     (hl)
7f7d 77        ld      (hl),a
7f7e 63        ld      h,e
7f7f 6c        ld      l,h
7f80 76        halt    
7f81 323077    ld      ($7730),a
7f84 63        ld      h,e
7f85 61        ld      h,c
7f86 6c        ld      l,h
7f87 78        ld      a,b
7f88 312b76    ld      sp,$762b
7f8b 3030      jr      nc,$7fbd
7f8d 3031      jr      nc,$7fc0
7f8f 73        ld      (hl),e
7f90 78        ld      a,b
7f91 313d78    ld      sp,$783d
7f94 32666a    ld      ($6a66),a
7f97 61        ld      h,c
7f98 2d        dec     l
7f99 2829      jr      z,$7fc4
7f9b 4c        ld      c,h
7f9c 24        inc     h
7f9d 61        ld      h,c
7f9e 72        ld      (hl),d
7f9f 73        ld      (hl),e
7fa0 78        ld      a,b
7fa1 313a61    ld      sp,$613a
7fa4 65        ld      h,l
7fa5 6c        ld      l,h
7fa6 78        ld      a,b
7fa7 70        ld      (hl),b
7fa8 2d        dec     l
7fa9 76        halt    
7faa 70        ld      (hl),b
7fab 3d        dec     a
7fac 78        ld      a,b
7fad 31666a    ld      sp,$6a66
7fb0 61        ld      h,c
7fb1 2d        dec     l
7fb2 2829      jr      z,$7fdd
7fb4 24        inc     h
7fb5 61        ld      h,c
7fb6 6c        ld      l,h
7fb7 76        halt    
7fb8 3044      jr      nc,$7ffe
7fba 3041      jr      nc,$7ffd
7fbc 77        ld      (hl),a
7fbd 63        ld      h,e
7fbe 24        inc     h
7fbf 61        ld      h,c
7fc0 6c        ld      l,h
7fc1 78        ld      a,b
7fc2 70        ld      (hl),b
7fc3 2d        dec     l
7fc4 76        halt    
7fc5 70        ld      (hl),b
7fc6 77        ld      (hl),a
7fc7 68        ld      l,b
7fc8 4c        ld      c,h
7fc9 24        inc     h
7fca 61        ld      h,c
7fcb 72        ld      (hl),d
7fcc 2b        dec     hl
7fcd 76        halt    
7fce 66        ld      h,(hl)
7fcf 73        ld      (hl),e
7fd0 67        ld      h,a
7fd1 37        scf     
7fd2 24        inc     h
7fd3 61        ld      h,c
7fd4 72        ld      (hl),d
7fd5 73        ld      (hl),e
7fd6 78        ld      a,b
7fd7 313a61    ld      sp,$613a
7fda 65        ld      h,l
7fdb 62        ld      h,d
7fdc 6c        ld      l,h
7fdd 75        ld      (hl),l
7fde 70        ld      (hl),b
7fdf 3d        dec     a
7fe0 76        halt    
7fe1 44        ld      b,h
7fe2 3874      jr      c,$8058
7fe4 50        ld      d,b
7fe5 2829      jr      z,$8010
7fe7 61        ld      h,c
7fe8 6c        ld      l,h
7fe9 78        ld      a,b
7fea 70        ld      (hl),b
7feb 2d        dec     l
7fec 76        halt    
7fed 70        ld      (hl),b
7fee 3d        dec     a
7fef 78        ld      a,b
7ff0 31666a    ld      sp,$6a66
7ff3 61        ld      h,c
7ff4 2d        dec     l
7ff5 2829      jr      z,$8020
7ff7 24        inc     h
7ff8 3a6162    ld      a,($6261)
7ffb 6c        ld      l,h
7ffc 75        ld      (hl),l
7ffd 70        ld      (hl),b
7ffe 3d        dec     a
7fff 76        halt    
8000 44        ld      b,h
8001 3874      jr      c,$8077
8003 65        ld      h,l
8004 6a        ld      l,d
8005 61        ld      h,c
8006 2d        dec     l
8007 2829      jr      z,$8032
8009 3d        dec     a
800a 76        halt    
800b 43        ld      b,e
800c 3074      jr      nc,$8082
800e 65        ld      h,l
800f 50        ld      d,b
8010 23        inc     hl
8011 2829      jr      z,$803c
8013 2676      ld      h,$76
8015 46        ld      b,(hl)
8016 303d      jr      nc,$8055
8018 76        halt    
8019 43        ld      b,e
801a 3074      jr      nc,$8090
801c 65        ld      h,l
801d 6a        ld      l,d
801e 61        ld      h,c
801f 2d        dec     l
8020 2829      jr      z,$804b
8022 65        ld      h,l
8023 50        ld      d,b
8024 24        inc     h
8025 61        ld      h,c
8026 6c        ld      l,h
8027 67        ld      h,a
8028 37        scf     
8029 73        ld      (hl),e
802a 78        ld      a,b
802b 316973    ld      sp,$7369
802e 67        ld      h,a
802f 37        scf     
8030 62        ld      h,d
8031 72        ld      (hl),d
8032 73        ld      (hl),e
8033 75        ld      (hl),l
8034 312461    ld      sp,$6124
8037 6c        ld      l,h
8038 67        ld      h,a
8039 37        scf     
803a 69        ld      l,c
803b 73        ld      (hl),e
803c 67        ld      h,a
803d 37        scf     
803e 24        inc     h
803f 61        ld      h,c
8040 6c        ld      l,h
8041 67        ld      h,a
8042 37        scf     
8043 73        ld      (hl),e
8044 78        ld      a,b
8045 312d76    ld      sp,$762d
8048 66        ld      h,(hl)
8049 77        ld      (hl),a
804a 68        ld      l,b
804b 62        ld      h,d
804c 6c        ld      l,h
804d 76        halt    
804e 323077    ld      ($7730),a
8051 63        ld      h,e
8052 6c        ld      l,h
8053 75        ld      (hl),l
8054 317768    ld      sp,$6877
8057 4c        ld      c,h
8058 24        inc     h
8059 2a1e7b    ld      hl,($7b1e)
805c f9        ld      sp,hl
805d c9        ret     

805e 2a4f7b    ld      hl,($7b4f)
8061 22527b    ld      ($7b52),hl
8064 3a517b    ld      a,($7b51)
8067 321d7b    ld      ($7b1d),a
806a f601      or      $01
806c 321c7b    ld      ($7b1c),a
806f 210000    ld      hl,$0000
8072 39        add     hl,sp
8073 221e7b    ld      ($7b1e),hl
8076 2a207b    ld      hl,($7b20)
8079 f9        ld      sp,hl
807a 21517b    ld      hl,$7b51
807d 3e00      ld      a,$00
807f c1        pop     bc
8080 71        ld      (hl),c
8081 2b        dec     hl
8082 70        ld      (hl),b
8083 2b        dec     hl
8084 3c        inc     a
8085 fe0d      cp      $0d
8087 fa7f80    jp      m,$807f
808a 210000    ld      hl,$0000
808d 39        add     hl,sp
808e 22207b    ld      ($7b20),hl
8091 2a1e7b    ld      hl,($7b1e)
8094 f9        ld      sp,hl
8095 c9        ret     

8096 cdc67b    call    $7bc6
8099 fe63      cp      $63
809b cacc80    jp      z,$80cc
809e cdda7f    call    $7fda
80a1 c2aa80    jp      nz,$80aa
80a4 3a667b    ld      a,($7b66)
80a7 cdb180    call    $80b1
80aa 3a677b    ld      a,($7b67)
80ad cdb180    call    $80b1
80b0 c9        ret     

80b1 325d7b    ld      ($7b5d),a
80b4 e6f0      and     $f0
80b6 1f        rra     
80b7 1f        rra     
80b8 1f        rra     
80b9 1f        rra     
80ba cd4a81    call    $814a
80bd cd8085    call    $8580
80c0 3a5d7b    ld      a,($7b5d)
80c3 e60f      and     $0f
80c5 cd4a81    call    $814a
80c8 cd8085    call    $8580
80cb c9        ret     

80cc cdda7f    call    $7fda
80cf c2d880    jp      nz,$80d8
80d2 3a667b    ld      a,($7b66)
80d5 cd8085    call    $8580
80d8 3a677b    ld      a,($7b67)
80db cd8085    call    $8580
80de c9        ret     

80df 3a517b    ld      a,($7b51)
80e2 e602      and     $02
80e4 321c7b    ld      ($7b1c),a
80e7 cdc67b    call    $7bc6
80ea fe72      cp      $72
80ec ca0a81    jp      z,$810a
80ef cd417d    call    $7d41
80f2 7e        ld      a,(hl)
80f3 32677b    ld      ($7b67),a
80f6 cdda7f    call    $7fda
80f9 c20181    jp      nz,$8101
80fc 2b        dec     hl
80fd 7e        ld      a,(hl)
80fe 32667b    ld      ($7b66),a
8101 3a1d7b    ld      a,($7b1d)
8104 f601      or      $01
8106 321c7b    ld      ($7b1c),a
8109 c9        ret     

810a 2a527b    ld      hl,($7b52)
810d e5        push    hl
810e cde87f    call    $7fe8
8111 2a207b    ld      hl,($7b20)
8114 011a00    ld      bc,$001a
8117 09        add     hl,bc
8118 22207b    ld      ($7b20),hl
811b cd5e80    call    $805e
811e e1        pop     hl
811f 224d7b    ld      ($7b4d),hl
8122 c3df80    jp      $80df
8125 3a6a7b    ld      a,($7b6a)
8128 cd8085    call    $8580
812b c9        ret     

812c 3e01      ld      a,$01
812e 32557b    ld      ($7b55),a
8131 c9        ret     

8132 3e00      ld      a,$00
8134 32557b    ld      ($7b55),a
8137 c9        ret     

8138 d630      sub     $30
813a d8        ret     c

813b c6e9      add     a,$e9
813d d8        ret     c

813e c606      add     a,$06
8140 f24681    jp      p,$8146
8143 c607      add     a,$07
8145 d8        ret     c

8146 c60a      add     a,$0a
8148 b7        or      a
8149 c9        ret     

814a e60f      and     $0f
814c c690      add     a,$90
814e 27        daa     
814f ce40      adc     a,$40
8151 27        daa     
8152 4f        ld      c,a
8153 c9        ret     

8154 3a6c7b    ld      a,($7b6c)
8157 ee01      xor     $01
8159 326c7b    ld      ($7b6c),a
815c c9        ret     

815d c9        ret     

815e 61        ld      h,c
815f 72        ld      (hl),d
8160 2b        dec     hl
8161 76        halt    
8162 66        ld      h,(hl)
8163 73        ld      (hl),e
8164 78        ld      a,b
8165 316272    ld      sp,$7262
8168 73        ld      (hl),e
8169 75        ld      (hl),l
816a 312462    ld      sp,$6224
816d 72        ld      (hl),d
816e 77        ld      (hl),a
816f 63        ld      h,e
8170 24        inc     h
8171 61        ld      h,c
8172 72        ld      (hl),d
8173 2b        dec     hl
8174 76        halt    
8175 66        ld      h,(hl)
8176 73        ld      (hl),e
8177 78        ld      a,b
8178 312b76    ld      sp,$762b
817b 3030      jr      nc,$81ad
817d 313073    ld      sp,$7330
8180 78        ld      a,b
8181 323a61    ld      ($613a),a
8184 00        nop     
8185 78        ld      a,b
8186 7a        ld      a,d
8187 00        nop     
8188 78        ld      a,b
8189 7a        ld      a,d
818a 00        nop     
818b 78        ld      a,b
818c 7a        ld      a,d
818d 00        nop     
818e 78        ld      a,b
818f 7a        ld      a,d
8190 00        nop     
8191 78        ld      a,b
8192 7a        ld      a,d
8193 00        nop     
8194 78        ld      a,b
8195 7a        ld      a,d
8196 00        nop     
8197 78        ld      a,b
8198 7a        ld      a,d
8199 00        nop     
819a 78        ld      a,b
819b 7a        ld      a,d
819c 00        nop     
819d 78        ld      a,b
819e 7a        ld      a,d
819f 00        nop     
81a0 78        ld      a,b
81a1 7a        ld      a,d
81a2 00        nop     
81a3 e8        ret     pe

81a4 7a        ld      a,d
81a5 00        nop     
81a6 78        ld      a,b
81a7 7a        ld      a,d
81a8 00        nop     
81a9 78        ld      a,b
81aa 7a        ld      a,d
81ab 00        nop     
81ac 2c        inc     l
81ad 7f        ld      a,a
81ae 00        nop     
81af 78        ld      a,b
81b0 7a        ld      a,d
81b1 00        nop     
81b2 78        ld      a,b
81b3 7a        ld      a,d
81b4 00        nop     
81b5 78        ld      a,b
81b6 7a        ld      a,d
81b7 00        nop     
81b8 78        ld      a,b
81b9 7a        ld      a,d
81ba 00        nop     
81bb 78        ld      a,b
81bc 7a        ld      a,d
81bd 00        nop     
81be 78        ld      a,b
81bf 7a        ld      a,d
81c0 00        nop     
81c1 78        ld      a,b
81c2 7a        ld      a,d
81c3 00        nop     
81c4 78        ld      a,b
81c5 7a        ld      a,d
81c6 00        nop     
81c7 78        ld      a,b
81c8 7a        ld      a,d
81c9 00        nop     
81ca 78        ld      a,b
81cb 7a        ld      a,d
81cc 00        nop     
81cd 78        ld      a,b
81ce 7a        ld      a,d
81cf 00        nop     
81d0 78        ld      a,b
81d1 7a        ld      a,d
81d2 00        nop     
81d3 78        ld      a,b
81d4 7a        ld      a,d
81d5 00        nop     
81d6 78        ld      a,b
81d7 7a        ld      a,d
81d8 00        nop     
81d9 78        ld      a,b
81da 7a        ld      a,d
81db 00        nop     
81dc 78        ld      a,b
81dd 7a        ld      a,d
81de 00        nop     
81df 78        ld      a,b
81e0 7a        ld      a,d
81e1 00        nop     
81e2 78        ld      a,b
81e3 7a        ld      a,d
81e4 00        nop     
81e5 78        ld      a,b
81e6 7a        ld      a,d
81e7 00        nop     
81e8 1b        dec     de
81e9 7c        ld      a,h
81ea 00        nop     
81eb 78        ld      a,b
81ec 7a        ld      a,d
81ed 00        nop     
81ee 2d        dec     l
81ef 7e        ld      a,(hl)
81f0 00        nop     
81f1 2d        dec     l
81f2 7e        ld      a,(hl)
81f3 00        nop     
81f4 23        inc     hl
81f5 7f        ld      a,a
81f6 00        nop     
81f7 04        inc     b
81f8 7c        ld      a,h
81f9 00        nop     
81fa 9a        sbc     a,d
81fb 7c        ld      a,h
81fc 00        nop     
81fd 4c        ld      c,h
81fe 7d        ld      a,l
81ff 00        nop     
8200 63        ld      h,e
8201 7d        ld      a,l
8202 00        nop     
8203 78        ld      a,b
8204 7a        ld      a,d
8205 00        nop     
8206 327c00    ld      ($007c),a
8209 3680      ld      (hl),$80
820b 01497c    ld      bc,$7c49
820e 00        nop     
820f 25        dec     h
8210 80        add     a,b
8211 013f80    ld      bc,$803f
8214 01787a    ld      bc,$7a78
8217 00        nop     
8218 78        ld      a,b
8219 7a        ld      a,d
821a 00        nop     
821b 78        ld      a,b
821c 7a        ld      a,d
821d 00        nop     
821e 78        ld      a,b
821f 7a        ld      a,d
8220 00        nop     
8221 78        ld      a,b
8222 7a        ld      a,d
8223 00        nop     
8224 78        ld      a,b
8225 7a        ld      a,d
8226 00        nop     
8227 78        ld      a,b
8228 7a        ld      a,d
8229 00        nop     
822a 78        ld      a,b
822b 7a        ld      a,d
822c 00        nop     
822d 78        ld      a,b
822e 7a        ld      a,d
822f 00        nop     
8230 78        ld      a,b
8231 7a        ld      a,d
8232 00        nop     
8233 00        nop     
8234 7d        ld      a,l
8235 00        nop     
8236 f1        pop     af
8237 7c        ld      a,h
8238 00        nop     
8239 81        add     a,c
823a 7c        ld      a,h
823b 00        nop     
823c 92        sub     d
823d 7c        ld      a,h
823e 00        nop     
823f 89        adc     a,c
8240 7c        ld      a,h
8241 00        nop     
8242 fb        ei      
8243 7e        ld      a,(hl)
8244 00        nop     
8245 017f00    ld      bc,$007f
8248 2d        dec     l
8249 7f        ld      a,a
824a 01787a    ld      bc,$7a78
824d 00        nop     
824e 3b        dec     sp
824f 7f        ld      a,a
8250 01407f    ld      bc,$7f40
8253 01787a    ld      bc,$7a78
8256 00        nop     
8257 78        ld      a,b
8258 7a        ld      a,d
8259 00        nop     
825a 9d        sbc     a,l
825b 7f        ld      a,a
825c 01787a    ld      bc,$7a78
825f 00        nop     
8260 78        ld      a,b
8261 7a        ld      a,d
8262 00        nop     
8263 78        ld      a,b
8264 7a        ld      a,d
8265 00        nop     
8266 78        ld      a,b
8267 7a        ld      a,d
8268 00        nop     
8269 b5        or      l
826a 7f        ld      a,a
826b 014c7a    ld      bc,$7a4c
826e 00        nop     
826f 78        ld      a,b
8270 7a        ld      a,d
8271 00        nop     
8272 78        ld      a,b
8273 7a        ld      a,d
8274 00        nop     
8275 bf        cp      a
8276 7f        ld      a,a
8277 019e83    ld      bc,$839e
827a 00        nop     
827b 78        ld      a,b
827c 7a        ld      a,d
827d 00        nop     
827e ca7f01    jp      z,$017f
8281 d37f      out     ($7f),a
8283 01787a    ld      bc,$7a78
8286 00        nop     
8287 78        ld      a,b
8288 7a        ld      a,d
8289 00        nop     
828a 78        ld      a,b
828b 7a        ld      a,d
828c 00        nop     
828d f8        ret     m

828e 7f        ld      a,a
828f 01787a    ld      bc,$7a78
8292 00        nop     
8293 78        ld      a,b
8294 7a        ld      a,d
8295 00        nop     
8296 c5        push    bc
8297 7c        ld      a,h
8298 00        nop     
8299 78        ld      a,b
829a 7a        ld      a,d
829b 00        nop     
829c da7c00    jp      c,$007c
829f 78        ld      a,b
82a0 7a        ld      a,d
82a1 00        nop     
82a2 78        ld      a,b
82a3 7a        ld      a,d
82a4 00        nop     
82a5 78        ld      a,b
82a6 7a        ld      a,d
82a7 00        nop     
82a8 a2        and     d
82a9 7d        ld      a,l
82aa 00        nop     
82ab a2        and     d
82ac 7d        ld      a,l
82ad 00        nop     
82ae 78        ld      a,b
82af 7a        ld      a,d
82b0 00        nop     
82b1 b9        cp      c
82b2 7c        ld      a,h
82b3 00        nop     
82b4 ee7a      xor     $7a
82b6 00        nop     
82b7 9a        sbc     a,d
82b8 7d        ld      a,l
82b9 00        nop     
82ba fa7c00    jp      m,$007c
82bd fc7c00    call    m,$007c
82c0 ad        xor     l
82c1 7c        ld      a,h
82c2 00        nop     
82c3 03        inc     bc
82c4 7d        ld      a,l
82c5 00        nop     
82c6 78        ld      a,b
82c7 7a        ld      a,d
82c8 00        nop     
82c9 e27b00    jp      po,$007b
82cc 78        ld      a,b
82cd 7a        ld      a,d
82ce 00        nop     
82cf 78        ld      a,b
82d0 7a        ld      a,d
82d1 00        nop     
82d2 78        ld      a,b
82d3 7a        ld      a,d
82d4 00        nop     
82d5 78        ld      a,b
82d6 7a        ld      a,d
82d7 00        nop     
82d8 78        ld      a,b
82d9 7a        ld      a,d
82da 00        nop     
82db ae        xor     (hl)
82dc 7e        ld      a,(hl)
82dd 00        nop     
82de f3        di      
82df 7b        ld      a,e
82e0 00        nop     
82e1 92        sub     d
82e2 7d        ld      a,l
82e3 00        nop     
82e4 78        ld      a,b
82e5 7a        ld      a,d
82e6 00        nop     
82e7 78        ld      a,b
82e8 7a        ld      a,d
82e9 00        nop     
82ea 65        ld      h,l
82eb 7e        ld      a,(hl)
82ec 00        nop     
82ed 78        ld      a,b
82ee 7a        ld      a,d
82ef 00        nop     
82f0 78        ld      a,b
82f1 7a        ld      a,d
82f2 00        nop     
82f3 78        ld      a,b
82f4 7a        ld      a,d
82f5 00        nop     
82f6 78        ld      a,b
82f7 7a        ld      a,d
82f8 00        nop     
82f9 78        ld      a,b
82fa 7a        ld      a,d
82fb 00        nop     
82fc 78        ld      a,b
82fd 7a        ld      a,d
82fe 00        nop     
82ff 78        ld      a,b
8300 7a        ld      a,d
8301 00        nop     
8302 78        ld      a,b
8303 7a        ld      a,d
8304 00        nop     
8305 00        nop     
8306 c5        push    bc
8307 d5        push    de
8308 e5        push    hl
8309 2a1d02    ld      hl,($021d)
830c e5        push    hl
830d 210000    ld      hl,$0000
8310 221d02    ld      ($021d),hl
8313 110503    ld      de,$0305
8316 212800    ld      hl,$0028
8319 19        add     hl,de
831a 019a83    ld      bc,$839a
831d 70        ld      (hl),b
831e 23        inc     hl
831f 71        ld      (hl),c
8320 212600    ld      hl,$0026
8323 19        add     hl,de
8324 3600      ld      (hl),$00
8326 23        inc     hl
8327 3601      ld      (hl),$01
8329 210500    ld      hl,$0005
832c 19        add     hl,de
832d 3601      ld      (hl),$01
832f 015383    ld      bc,$8353
8332 cd0c01    call    $010c
8335 e1        pop     hl
8336 221d02    ld      ($021d),hl
8339 110503    ld      de,$0305
833c 210500    ld      hl,$0005
833f 19        add     hl,de
8340 3600      ld      (hl),$00
8342 210000    ld      hl,$0000
8345 19        add     hl,de
8346 7e        ld      a,(hl)
8347 fe30      cp      $30
8349 c2787a    jp      nz,$7a78
834c e1        pop     hl
834d d1        pop     de
834e c1        pop     bc
834f 3a9a83    ld      a,($839a)
8352 c9        ret     

8353 05        dec     b
8354 03        inc     bc
8355 c5        push    bc
8356 d5        push    de
8357 e5        push    hl
8358 329d83    ld      ($839d),a
835b 2a1d02    ld      hl,($021d)
835e e5        push    hl
835f 210000    ld      hl,$0000
8362 221d02    ld      ($021d),hl
8365 113403    ld      de,$0334
8368 212800    ld      hl,$0028
836b 19        add     hl,de
836c 019d83    ld      bc,$839d
836f 70        ld      (hl),b
8370 23        inc     hl
8371 71        ld      (hl),c
8372 212600    ld      hl,$0026
8375 19        add     hl,de
8376 3600      ld      (hl),$00
8378 23        inc     hl
8379 3601      ld      (hl),$01
837b 015483    ld      bc,$8354
837e cd0c01    call    $010c
8381 e1        pop     hl
8382 221d02    ld      ($021d),hl
8385 113403    ld      de,$0334
8388 210000    ld      hl,$0000
838b 19        add     hl,de
838c 7e        ld      a,(hl)
838d fe30      cp      $30
838f c2787a    jp      nz,$7a78
8392 e1        pop     hl
8393 d1        pop     de
8394 c1        pop     bc
8395 c9        ret     

8396 00        nop     
8397 00        nop     
8398 00        nop     
8399 00        nop     
839a 00        nop     
839b 00        nop     
839c 00        nop     
839d 00        nop     
839e cd1801    call    $0118
83a1 76        halt    
83a2 fe61      cp      $61
83a4 d8        ret     c

83a5 fe7b      cp      $7b
83a7 d0        ret     nc

83a8 d620      sub     $20
83aa c9        ret     

83ab 215a48    ld      hl,$485a
83ae 221d02    ld      ($021d),hl
83b1 11da4a    ld      de,$4ada
83b4 7c        ld      a,h
83b5 ba        cp      d
83b6 cac183    jp      z,$83c1
83b9 e5        push    hl
83ba cdca15    call    $15ca
83bd e1        pop     hl
83be cd8211    call    $1182
83c1 210001    ld      hl,$0100
83c4 222b03    ld      ($032b),hl
83c7 210403    ld      hl,$0304
83ca 7c        ld      a,h
83cb 65        ld      h,l
83cc 6f        ld      l,a
83cd 222d03    ld      ($032d),hl
83d0 110503    ld      de,$0305
83d3 015d88    ld      bc,$885d
83d6 cd0901    call    $0109
83d9 3a0503    ld      a,($0305)
83dc fe30      cp      $30
83de c2a685    jp      nz,$85a6
83e1 215000    ld      hl,$0050
83e4 7c        ld      a,h
83e5 65        ld      h,l
83e6 6f        ld      l,a
83e7 225a03    ld      ($035a),hl
83ea 219c86    ld      hl,$869c
83ed 7c        ld      a,h
83ee 65        ld      h,l
83ef 6f        ld      l,a
83f0 225c03    ld      ($035c),hl
83f3 113403    ld      de,$0334
83f6 015f88    ld      bc,$885f
83f9 cd0901    call    $0109
83fc 3a3403    ld      a,($0334)
83ff fe30      cp      $30
8401 c2a685    jp      nz,$85a6
8404 cdd387    call    $87d3
8407 af        xor     a
8408 325f01    ld      ($015f),a
840b 329d02    ld      ($029d),a
840e 32bd05    ld      ($05bd),a
8411 329502    ld      ($0295),a
8414 2f        cpl     
8415 329c02    ld      ($029c),a
8418 217e02    ld      hl,$027e
841b 0608      ld      b,$08
841d 3600      ld      (hl),$00
841f 23        inc     hl
8420 05        dec     b
8421 c21d84    jp      nz,$841d
8424 1600      ld      d,$00
8426 1e00      ld      e,$00
8428 cd9d85    call    $859d
842b fe0d      cp      $0d
842d ca2884    jp      z,$8428
8430 fe0a      cp      $0a
8432 ca2884    jp      z,$8428
8435 fe2a      cp      $2a
8437 c24584    jp      nz,$8445
843a 3e01      ld      a,$01
843c 325f01    ld      ($015f),a
843f 21d901    ld      hl,$01d9
8442 c3cb84    jp      $84cb
8445 fe2b      cp      $2b
8447 c25284    jp      nz,$8452
844a 14        inc     d
844b 1c        inc     e
844c 21d301    ld      hl,$01d3
844f c36384    jp      $8463
8452 fe2d      cp      $2d
8454 c25d84    jp      nz,$845d
8457 21d101    ld      hl,$01d1
845a c36384    jp      $8463
845d 21d501    ld      hl,$01d5
8460 c3ce84    jp      $84ce
8463 cd9d85    call    $859d
8466 fe43      cp      $43
8468 ca9884    jp      z,$8498
846b 23        inc     hl
846c 23        inc     hl
846d fe49      cp      $49
846f ca9884    jp      z,$8498
8472 23        inc     hl
8473 23        inc     hl
8474 1c        inc     e
8475 fe41      cp      $41
8477 ca9884    jp      z,$8498
847a 1c        inc     e
847b fe4b      cp      $4b
847d ca9884    jp      z,$8498
8480 1d        dec     e
8481 1d        dec     e
8482 23        inc     hl
8483 23        inc     hl
8484 14        inc     d
8485 fe44      cp      $44
8487 ca9884    jp      z,$8498
848a 15        dec     d
848b 23        inc     hl
848c 23        inc     hl
848d fe58      cp      $58
848f ca9884    jp      z,$8498
8492 cd6385    call    $8563
8495 c32484    jp      $8424
8498 7a        ld      a,d
8499 fe02      cp      $02
849b c2a684    jp      nz,$84a6
849e 3e01      ld      a,$01
84a0 325f01    ld      ($015f),a
84a3 c3cb84    jp      $84cb
84a6 7b        ld      a,e
84a7 fe02      cp      $02
84a9 c2cb84    jp      nz,$84cb
84ac 3e01      ld      a,$01
84ae 329d02    ld      ($029d),a
84b1 016075    ld      bc,$7560
84b4 e5        push    hl
84b5 cd2d01    call    $012d
84b8 e1        pop     hl
84b9 d2cb84    jp      nc,$84cb
84bc af        xor     a
84bd 329d02    ld      ($029d),a
84c0 014400    ld      bc,$0044
84c3 112e86    ld      de,$862e
84c6 e5        push    hl
84c7 cdec86    call    $86ec
84ca e1        pop     hl
84cb cd9d85    call    $859d
84ce 5e        ld      e,(hl)
84cf 23        inc     hl
84d0 56        ld      d,(hl)
84d1 eb        ex      de,hl
84d2 cdd185    call    $85d1
84d5 229203    ld      ($0392),hl
84d8 1600      ld      d,$00
84da fe2d      cp      $2d
84dc cae584    jp      z,$84e5
84df fe2b      cp      $2b
84e1 c2ee84    jp      nz,$84ee
84e4 14        inc     d
84e5 cd9d85    call    $859d
84e8 cd6385    call    $8563
84eb cd9d85    call    $859d
84ee 21ffff    ld      hl,$ffff
84f1 225a02    ld      ($025a),hl
84f4 21ee01    ld      hl,$01ee
84f7 3600      ld      (hl),$00
84f9 fe3d      cp      $3d
84fb c21685    jp      nz,$8516
84fe 3a9d02    ld      a,($029d)
8501 b7        or      a
8502 ca1185    jp      z,$8511
8505 012a00    ld      bc,$002a
8508 117286    ld      de,$8672
850b cdec86    call    $86ec
850e cd1801    call    $0118
8511 3601      ld      (hl),$01
8513 cd9d85    call    $859d
8516 113588    ld      de,$8835
8519 2a5a02    ld      hl,($025a)
851c 23        inc     hl
851d 225a02    ld      ($025a),hl
8520 19        add     hl,de
8521 77        ld      (hl),a
8522 fe20      cp      $20
8524 ca3185    jp      z,$8531
8527 21bd05    ld      hl,$05bd
852a 34        inc     (hl)
852b cd7485    call    $8574
852e c31685    jp      $8516
8531 2a9203    ld      hl,($0392)
8534 3a9d02    ld      a,($029d)
8537 b7        or      a
8538 ca5185    jp      z,$8551
853b e5        push    hl
853c af        xor     a
853d 47        ld      b,a
853e 57        ld      d,a
853f 3a9101    ld      a,($0191)
8542 3c        inc     a
8543 4f        ld      c,a
8544 3a9001    ld      a,($0190)
8547 3c        inc     a
8548 5f        ld      e,a
8549 cd300b    call    $0b30
854c e1        pop     hl
854d 224e02    ld      ($024e),hl
8550 19        add     hl,de
8551 221d02    ld      ($021d),hl
8554 210000    ld      hl,$0000
8557 e3        ex      (sp),hl
8558 e5        push    hl
8559 3abd05    ld      a,($05bd)
855c 4f        ld      c,a
855d 3e00      ld      a,$00
855f 113588    ld      de,$8835
8562 c9        ret     

8563 fe56      cp      $56
8565 c2a685    jp      nz,$85a6
8568 3a9c02    ld      a,($029c)
856b b7        or      a
856c f2a685    jp      p,$85a6
856f 7a        ld      a,d
8570 329c02    ld      ($029c),a
8573 c9        ret     

8574 e5        push    hl
8575 d5        push    de
8576 110503    ld      de,$0305
8579 016288    ld      bc,$8862
857c cd0901    call    $0109
857f 3a0503    ld      a,($0305)
8582 fe30      cp      $30
8584 c2a685    jp      nz,$85a6
8587 3a0403    ld      a,($0304)
858a d1        pop     de
858b e1        pop     hl
858c fe28      cp      $28
858e cc1087    call    z,$8710
8591 ca7485    jp      z,$8574
8594 fe61      cp      $61
8596 d8        ret     c

8597 fe7a      cp      $7a
8599 d0        ret     nc

859a d620      sub     $20
859c c9        ret     

859d cd7485    call    $8574
85a0 fe20      cp      $20
85a2 ca9d85    jp      z,$859d
85a5 c9        ret     

85a6 11b285    ld      de,$85b2
85a9 011f00    ld      bc,$001f
85ac cdec86    call    $86ec
85af cd1801    call    $0118
85b2 43        ld      b,e
85b3 4f        ld      c,a
85b4 4d        ld      c,l
85b5 4d        ld      c,l
85b6 41        ld      b,c
85b7 4e        ld      c,(hl)
85b8 44        ld      b,h
85b9 204c      jr      nz,$8607
85bb 49        ld      c,c
85bc 4e        ld      c,(hl)
85bd 45        ld      b,l
85be 2050      jr      nz,$8610
85c0 52        ld      d,d
85c1 4f        ld      c,a
85c2 43        ld      b,e
85c3 45        ld      b,l
85c4 53        ld      d,e
85c5 53        ld      d,e
85c6 49        ld      c,c
85c7 4e        ld      c,(hl)
85c8 47        ld      b,a
85c9 2045      jr      nz,$8610
85cb 52        ld      d,d
85cc 52        ld      d,d
85cd 4f        ld      c,a
85ce 52        ld      d,d
85cf 0d        dec     c
85d0 0a        ld      a,(bc)
85d1 f5        push    af
85d2 e5        push    hl
85d3 2acf01    ld      hl,($01cf)
85d6 7c        ld      a,h
85d7 b5        or      l
85d8 c2de85    jp      nz,$85de
85db e1        pop     hl
85dc f1        pop     af
85dd c9        ret     

85de d1        pop     de
85df 7d        ld      a,l
85e0 93        sub     e
85e1 7c        ld      a,h
85e2 9a        sbc     a,d
85e3 daee85    jp      c,$85ee
85e6 c3f785    jp      $85f7
85e9 2acf01    ld      hl,($01cf)
85ec f1        pop     af
85ed c9        ret     

85ee 011c00    ld      bc,$001c
85f1 111286    ld      de,$8612
85f4 cdec86    call    $86ec
85f7 3af401    ld      a,($01f4)
85fa fe00      cp      $00
85fc cae985    jp      z,$85e9
85ff fe01      cp      $01
8601 ca0b86    jp      z,$860b
8604 af        xor     a
8605 32ef01    ld      ($01ef),a
8608 329d02    ld      ($029d),a
860b af        xor     a
860c 325f01    ld      ($015f),a
860f c3e985    jp      $85e9
8612 50        ld      d,b
8613 52        ld      d,d
8614 45        ld      b,l
8615 2d        dec     l
8616 41        ld      b,c
8617 53        ld      d,e
8618 53        ld      d,e
8619 49        ld      c,c
861a 47        ld      b,a
861b 4e        ld      c,(hl)
861c 45        ld      b,l
861d 44        ld      b,h
861e 204c      jr      nz,$866c
8620 4f        ld      c,a
8621 41        ld      b,c
8622 44        ld      b,h
8623 2050      jr      nz,$8675
8625 4f        ld      c,a
8626 49        ld      c,c
8627 4e        ld      c,(hl)
8628 54        ld      d,h
8629 2055      jr      nz,$8680
862b 53        ld      d,e
862c 45        ld      b,l
862d 44        ld      b,h
862e 222441    ld      ($4124),hl
8631 4e        ld      c,(hl)
8632 49        ld      c,c
8633 4d        ld      c,l
8634 2e56      ld      l,$56
8636 34        inc     (hl)
8637 35        dec     (hl)
8638 22204e    ld      ($4e20),hl
863b 4f        ld      c,a
863c 54        ld      d,h
863d 2050      jr      nz,$868f
863f 52        ld      d,d
8640 45        ld      b,l
8641 53        ld      d,e
8642 45        ld      b,l
8643 4e        ld      c,(hl)
8644 54        ld      d,h
8645 204f      jr      nz,$8696
8647 4e        ld      c,(hl)
8648 204c      jr      nz,$8696
864a 4f        ld      c,a
864b 47        ld      b,a
864c 47        ld      b,a
864d 45        ld      b,l
864e 44        ld      b,h
864f 2049      jr      nz,$869a
8651 4e        ld      c,(hl)
8652 2044      jr      nz,$8698
8654 52        ld      d,d
8655 49        ld      c,c
8656 56        ld      d,(hl)
8657 45        ld      b,l
8658 202d      jr      nz,$8687
865a 2041      jr      nz,$869d
865c 4c        ld      c,h
865d 4c        ld      c,h
865e 2041      jr      nz,$86a1
8660 4e        ld      c,(hl)
8661 49        ld      c,c
8662 4d        ld      c,l
8663 41        ld      b,c
8664 54        ld      d,h
8665 49        ld      c,c
8666 4f        ld      c,a
8667 4e        ld      c,(hl)
8668 2049      jr      nz,$86b3
866a 4e        ld      c,(hl)
866b 48        ld      c,b
866c 49        ld      c,c
866d 42        ld      b,d
866e 49        ld      c,c
866f 54        ld      d,h
8670 45        ld      b,l
8671 44        ld      b,h
8672 223d22    ld      ($223d),hl
8675 204e      jr      nz,$86c5
8677 4f        ld      c,a
8678 54        ld      d,h
8679 2050      jr      nz,$86cb
867b 45        ld      b,l
867c 52        ld      d,d
867d 4d        ld      c,l
867e 49        ld      c,c
867f 54        ld      d,h
8680 54        ld      d,h
8681 45        ld      b,l
8682 44        ld      b,h
8683 2049      jr      nz,$86ce
8685 4e        ld      c,(hl)
8686 2043      jr      nz,$86cb
8688 4f        ld      c,a
8689 4e        ld      c,(hl)
868a 4a        ld      c,d
868b 55        ld      d,l
868c 4e        ld      c,(hl)
868d 43        ld      b,e
868e 54        ld      d,h
868f 49        ld      c,c
8690 4f        ld      c,a
8691 4e        ld      c,(hl)
8692 2057      jr      nz,$86eb
8694 49        ld      c,c
8695 54        ld      d,h
8696 48        ld      c,b
8697 2022      jr      nz,$86bb
8699 2b        dec     hl
869a 41        ld      b,c
869b 22b586    ld      ($86b5),hl
869e 23        inc     hl
869f 23        inc     hl
86a0 fe49      cp      $49
86a2 cab586    jp      z,$86b5
86a5 23        inc     hl
86a6 23        inc     hl
86a7 14        inc     d
86a8 fe44      cp      $44
86aa cab586    jp      z,$86b5
86ad 15        dec     d
86ae 23        inc     hl
86af 23        inc     hl
86b0 fe58      cp      $58
86b2 c26087    jp      nz,$8760
86b5 7a        ld      a,d
86b6 fe02      cp      $02
86b8 c2c386    jp      nz,$86c3
86bb 3e01      ld      a,$01
86bd 321403    ld      ($0314),a
86c0 325f01    ld      ($015f),a
86c3 5e        ld      e,(hl)
86c4 23        inc     hl
86c5 56        ld      d,(hl)
86c6 eb        ex      de,hl
86c7 cd6687    call    $8766
86ca 221c04    ld      ($041c),hl
86cd cd5787    call    $8757
86d0 21ffff    ld      hl,$ffff
86d3 22d802    ld      ($02d8),hl
86d6 211503    ld      hl,$0315
86d9 3600      ld      (hl),$00
86db fe3d      cp      $3d
86dd c2e586    jp      nz,$86e5
86e0 3601      ld      (hl),$01
86e2 cd5787    call    $8757
86e5 110f88    ld      de,$880f
86e8 2ad802    ld      hl,($02d8)
86eb 23        inc     hl
86ec d5        push    de
86ed c5        push    bc
86ee 219c86    ld      hl,$869c
86f1 0e50      ld      c,$50
86f3 cdc70b    call    $0bc7
86f6 c1        pop     bc
86f7 d1        pop     de
86f8 219c86    ld      hl,$869c
86fb cda70b    call    $0ba7
86fe 113403    ld      de,$0334
8701 016188    ld      bc,$8861
8704 cd0901    call    $0109
8707 3a3403    ld      a,($0334)
870a fe30      cp      $30
870c c2a685    jp      nz,$85a6
870f c9        ret     

8710 e5        push    hl
8711 d5        push    de
8712 cd7485    call    $8574
8715 fe29      cp      $29
8717 ca5c87    jp      z,$875c
871a fe20      cp      $20
871c ca1287    jp      z,$8712
871f fe0d      cp      $0d
8721 caa685    jp      z,$85a6
8724 fe2c      cp      $2c
8726 ca1287    jp      z,$8712
8729 1600      ld      d,$00
872b fe2d      cp      $2d
872d ca3787    jp      z,$8737
8730 1601      ld      d,$01
8732 fe2b      cp      $2b
8734 c2a685    jp      nz,$85a6
8737 cd7485    call    $8574
873a fe44      cp      $44
873c ca5f87    jp      z,$875f
873f fe20      cp      $20
8741 ca6687    jp      z,$8766
8744 fe30      cp      $30
8746 daa685    jp      c,$85a6
8749 fe38      cp      $38
874b d2a685    jp      nc,$85a6
874e d630      sub     $30
8750 5f        ld      e,a
8751 7a        ld      a,d
8752 1600      ld      d,$00
8754 217e02    ld      hl,$027e
8757 19        add     hl,de
8758 77        ld      (hl),a
8759 c31287    jp      $8712
875c d1        pop     de
875d e1        pop     hl
875e c9        ret     

875f 7a        ld      a,d
8760 329502    ld      ($0295),a
8763 c31287    jp      $8712
8766 7a        ld      a,d
8767 329d02    ld      ($029d),a
876a 016075    ld      bc,$7560
876d cd2d01    call    $012d
8770 d21287    jp      nc,$8712
8773 af        xor     a
8774 329d02    ld      ($029d),a
8777 014400    ld      bc,$0044
877a 112e86    ld      de,$862e
877d cdec86    call    $86ec
8780 c31287    jp      $8712
8783 2a2a20    ld      hl,($202a)
8786 43        ld      b,e
8787 49        ld      c,c
8788 53        ld      d,e
8789 2043      jr      nz,$87ce
878b 4f        ld      c,a
878c 42        ld      b,d
878d 4f        ld      c,a
878e 4c        ld      c,h
878f 2052      jr      nz,$87e3
8791 54        ld      d,h
8792 53        ld      d,e
8793 2056      jr      nz,$87eb
8795 fe2e      cp      $2e
8797 c22052    jp      nz,$5220
879a 45        ld      b,l
879b 56        ld      d,(hl)
879c 20d1      jr      nz,$876f
879e f1        pop     af
879f c9        ret     

87a0 50        ld      d,b
87a1 52        ld      d,d
87a2 45        ld      b,l
87a3 2d        dec     l
87a4 41        ld      b,c
87a5 53        ld      d,e
87a6 53        ld      d,e
87a7 49        ld      c,c
87a8 47        ld      b,a
87a9 4e        ld      c,(hl)
87aa 45        ld      b,l
87ab 44        ld      b,h
87ac 204c      jr      nz,$87fa
87ae 4f        ld      c,a
87af 41        ld      b,c
87b0 44        ld      b,h
87b1 2050      jr      nz,$8803
87b3 4f        ld      c,a
87b4 49        ld      c,c
87b5 4e        ld      c,(hl)
87b6 54        ld      d,h
87b7 2055      jr      nz,$880e
87b9 53        ld      d,e
87ba 45        ld      b,l
87bb 44        ld      b,h
87bc 0d        dec     c
87bd 0a        ld      a,(bc)
87be e5        push    hl
87bf d5        push    de
87c0 cd2e20    call    $202e
87c3 55        ld      d,l
87c4 52        ld      d,d
87c5 4e        ld      c,(hl)
87c6 2088      jr      nz,$8750
87c8 fe20      cp      $20
87ca cac087    jp      z,$87c0
87cd fe2f      cp      $2f
87cf ca600d    jp      z,$0d60
87d2 0a        ld      a,(bc)
87d3 116301    ld      de,$0163
87d6 012200    ld      bc,$0022
87d9 21a087    ld      hl,$87a0
87dc cda70b    call    $0ba7
87df 3a8b01    ld      a,($018b)
87e2 c630      add     a,$30
87e4 329587    ld      ($8795),a
87e7 3a8c01    ld      a,($018c)
87ea c630      add     a,$30
87ec 329787    ld      ($8797),a
87ef 0e03      ld      c,$03
87f1 219d87    ld      hl,$879d
87f4 116001    ld      de,$0160
87f7 1a        ld      a,(de)
87f8 c630      add     a,$30
87fa 77        ld      (hl),a
87fb 13        inc     de
87fc 23        inc     hl
87fd 0d        dec     c
87fe c2f787    jp      nz,$87f7
8801 21c787    ld      hl,$87c7
8804 118501    ld      de,$0185
8807 1a        ld      a,(de)
8808 77        ld      (hl),a
8809 13        inc     de
880a 23        inc     hl
880b 1a        ld      a,(de)
880c 77        ld      (hl),a
880d 21cf87    ld      hl,$87cf
8810 118901    ld      de,$0189
8813 1a        ld      a,(de)
8814 77        ld      (hl),a
8815 23        inc     hl
8816 13        inc     de
8817 1a        ld      a,(de)
8818 77        ld      (hl),a
8819 2a8701    ld      hl,($0187)
881c 55        ld      d,l
881d 5c        ld      e,h
881e 21c987    ld      hl,$87c9
8821 3e05      ld      a,$05
8823 cdd30b    call    $0bd3
8826 21c987    ld      hl,$87c9
8829 362f      ld      (hl),$2f
882b 015000    ld      bc,$0050
882e 118387    ld      de,$8783
8831 cdec86    call    $86ec
8834 c9        ret     

8835 37        scf     
8836 26f0      ld      h,$f0
8838 00        nop     
8839 f0        ret     p

883a 01f3f5    ld      bc,$f5f3
883d 00        nop     
883e 09        add     hl,bc
883f 117d3b    ld      de,$3b7d
8842 cd4cb3    call    $b34c
8845 b5        or      l
8846 c26188    jp      nz,$8861
8849 110500    ld      de,$0005
884c 2a3937    ld      hl,($3739)
884f 2600      ld      h,$00
8851 cd17b3    call    $b317
8854 01ab36    ld      bc,$36ab
8857 09        add     hl,bc
8858 e5        push    hl
8859 2a8036    ld      hl,($3680)
885c eb        ex      de,hl
885d f0        ret     p

885e 00        nop     
885f f0        ret     p

8860 01f3f5    ld      bc,$f5f3
8863 00        nop     
8864 3b        dec     sp
8865 70        ld      (hl),b
8866 2b        dec     hl
8867 71        ld      (hl),c
8868 3e00      ld      a,$00
886a 11703b    ld      de,$3b70
886d cd57b3    call    $b357
8870 b5        or      l
8871 c27588    jp      nz,$8875
8874 c9        ret     

8875 018036    ld      bc,$3680
8878 11b83a    ld      de,$3ab8
887b cd4ab3    call    $b34a
887e 23        inc     hl
887f 22723b    ld      ($3b72),hl
8882 11703b    ld      de,$3b70
8885 cd5ab3    call    $b35a
8888 d29688    jp      nc,$8896
888b 2a703b    ld      hl,($3b70)
888e 44        ld      b,h
888f 4d        ld      c,l
8890 cd7286    call    $8672
8893 c31489    jp      $8914
8896 2a8236    ld      hl,($3682)
8899 44        ld      b,h
889a 4d        ld      c,l
889b cd2378    call    $7823
889e 11723b    ld      de,$3b72
88a1 cd5ab3    call    $b35a
88a4 b5        or      l
88a5 c2ae88    jp      nz,$88ae
88a8 cd1a87    call    $871a
88ab c3b688    jp      $88b6
88ae 2a723b    ld      hl,($3b72)
88b1 44        ld      b,h
88b2 4d        ld      c,l
88b3 cdb587    call    $87b5
88b6 01723b    ld      bc,$3b72
88b9 11703b    ld      de,$3b70
88bc cd4ab3    call    $b34a
88bf eb        ex      de,hl
88c0 2b        dec     hl
88c1 73        ld      (hl),e
88c2 23        inc     hl
88c3 72        ld      (hl),d
88c4 3e00      ld      a,$00
88c6 21703b    ld      hl,$3b70
88c9 cd62b3    call    $b362
88cc 9f        sbc     a,a
88cd f5        push    af
88ce 3a8436    ld      a,($3684)
88d1 2f        cpl     
88d2 c1        pop     bc
88d3 48        ld      c,b
88d4 a1        and     c
88d5 1f        rra     
88d6 d21489    jp      nc,$8914
88d9 018036    ld      bc,$3680
88dc 11b83a    ld      de,$3ab8
88df cd4ab3    call    $b34a
88e2 23        inc     hl
88e3 22723b    ld      ($3b72),hl
88e6 11703b    ld      de,$3b70
88e9 cd5ab3    call    $b35a
88ec d20089    jp      nc,$8900
88ef 2a703b    ld      hl,($3b70)
88f2 44        ld      b,h
88f3 4d        ld      c,l
88f4 cd7286    call    $8672
88f7 210000    ld      hl,$0000
88fa 22703b    ld      ($3b70),hl
88fd c31189    jp      $8911
8900 1a        ld      a,(de)
8901 1a        ld      a,(de)
8902 1a        ld      a,(de)
8903 1a        ld      a,(de)
8904 1a        ld      a,(de)
8905 1a        ld      a,(de)
8906 1a        ld      a,(de)
8907 1a        ld      a,(de)
8908 1a        ld      a,(de)
8909 1a        ld      a,(de)
890a 1a        ld      a,(de)
890b 1a        ld      a,(de)
890c 1a        ld      a,(de)
890d 1a        ld      a,(de)
890e 1a        ld      a,(de)
890f 1a        ld      a,(de)
8910 1a        ld      a,(de)
8911 1a        ld      a,(de)
8912 1a        ld      a,(de)
8913 1a        ld      a,(de)
8914 1a        ld      a,(de)
8915 02        ld      (bc),a
8916 1000      djnz    $8918
8918 1a        ld      a,(de)
8919 1a        ld      a,(de)
891a 1a        ld      a,(de)
891b 1a        ld      a,(de)
891c 1a        ld      a,(de)
891d 1a        ld      a,(de)
891e 1a        ld      a,(de)
891f 1a        ld      a,(de)
8920 1a        ld      a,(de)
8921 1a        ld      a,(de)
8922 1a        ld      a,(de)
8923 1a        ld      a,(de)
8924 1a        ld      a,(de)
8925 1a        ld      a,(de)
8926 1a        ld      a,(de)
8927 1a        ld      a,(de)
8928 1a        ld      a,(de)
8929 1a        ld      a,(de)
892a 1a        ld      a,(de)
892b 1a        ld      a,(de)
892c 1a        ld      a,(de)
892d 1a        ld      a,(de)
892e 1a        ld      a,(de)
892f 1a        ld      a,(de)
8930 1a        ld      a,(de)
8931 1a        ld      a,(de)
8932 1a        ld      a,(de)
8933 1a        ld      a,(de)
8934 1a        ld      a,(de)
8935 1a        ld      a,(de)
8936 1a        ld      a,(de)
8937 1a        ld      a,(de)
8938 1a        ld      a,(de)
8939 1a        ld      a,(de)
893a 1a        ld      a,(de)
893b 1a        ld      a,(de)
893c 1a        ld      a,(de)
893d 1a        ld      a,(de)
893e 1a        ld      a,(de)
893f 1a        ld      a,(de)
8940 1a        ld      a,(de)
8941 1a        ld      a,(de)
8942 1a        ld      a,(de)
8943 1a        ld      a,(de)
8944 1a        ld      a,(de)
8945 1a        ld      a,(de)
8946 1a        ld      a,(de)
8947 1a        ld      a,(de)
8948 1a        ld      a,(de)
8949 1a        ld      a,(de)
894a 1a        ld      a,(de)
894b 1a        ld      a,(de)
894c 1a        ld      a,(de)
894d 1a        ld      a,(de)
894e 1a        ld      a,(de)
894f 1a        ld      a,(de)
8950 1a        ld      a,(de)
8951 1a        ld      a,(de)
8952 1a        ld      a,(de)
8953 1a        ld      a,(de)
8954 1a        ld      a,(de)
8955 1a        ld      a,(de)
8956 1a        ld      a,(de)
8957 1a        ld      a,(de)
8958 1a        ld      a,(de)
8959 1a        ld      a,(de)
895a 1a        ld      a,(de)
895b 1a        ld      a,(de)
895c 1a        ld      a,(de)
895d 1a        ld      a,(de)
895e 1a        ld      a,(de)
895f 1a        ld      a,(de)
8960 1a        ld      a,(de)
8961 1a        ld      a,(de)
8962 1a        ld      a,(de)
8963 1a        ld      a,(de)
8964 1a        ld      a,(de)
8965 1a        ld      a,(de)
8966 1a        ld      a,(de)
8967 1a        ld      a,(de)
8968 1a        ld      a,(de)
8969 1a        ld      a,(de)
896a 1a        ld      a,(de)
896b 1a        ld      a,(de)
896c 1a        ld      a,(de)
896d 1a        ld      a,(de)
896e 1a        ld      a,(de)
896f 1a        ld      a,(de)
8970 1a        ld      a,(de)
8971 1a        ld      a,(de)
8972 1a        ld      a,(de)
8973 1a        ld      a,(de)
8974 1a        ld      a,(de)
8975 1a        ld      a,(de)
8976 1a        ld      a,(de)
8977 1a        ld      a,(de)
8978 1a        ld      a,(de)
8979 1a        ld      a,(de)
897a 1a        ld      a,(de)
897b 1a        ld      a,(de)
897c 1a        ld      a,(de)
897d 1a        ld      a,(de)
897e 1a        ld      a,(de)
897f 1a        ld      a,(de)
8980 ff        rst     $38
8981 ff        rst     $38
8982 ff        rst     $38
8983 f7        rst     $30
8984 ff        rst     $38
8985 f7        rst     $30
8986 ff        rst     $38
8987 f7        rst     $30
8988 ff        rst     $38
8989 ff        rst     $38
898a ff        rst     $38
898b f7        rst     $30
898c ff        rst     $38
898d f7        rst     $30
898e ff        rst     $38
898f ff        rst     $38
8990 ff        rst     $38
8991 ff        rst     $38
8992 ff        rst     $38
8993 f7        rst     $30
8994 ff        rst     $38
8995 ff        rst     $38
8996 ff        rst     $38
8997 f7        rst     $30
8998 ff        rst     $38
8999 f7        rst     $30
899a ff        rst     $38
899b f7        rst     $30
899c ff        rst     $38
899d f7        rst     $30
899e ff        rst     $38
899f f7        rst     $30
89a0 ff        rst     $38
89a1 ff        rst     $38
89a2 ff        rst     $38
89a3 f7        rst     $30
89a4 ff        rst     $38
89a5 f7        rst     $30
89a6 ff        rst     $38
89a7 f7        rst     $30
89a8 ff        rst     $38
89a9 ff        rst     $38
89aa ff        rst     $38
89ab f7        rst     $30
89ac ff        rst     $38
89ad f7        rst     $30
89ae ff        rst     $38
89af f7        rst     $30
89b0 ff        rst     $38
89b1 ff        rst     $38
89b2 ff        rst     $38
89b3 f7        rst     $30
89b4 ff        rst     $38
89b5 f7        rst     $30
89b6 ff        rst     $38
89b7 f7        rst     $30
89b8 ff        rst     $38
89b9 ff        rst     $38
89ba ff        rst     $38
89bb f7        rst     $30
89bc ff        rst     $38
89bd f7        rst     $30
89be ff        rst     $38
89bf f7        rst     $30
89c0 ff        rst     $38
89c1 ff        rst     $38
89c2 ff        rst     $38
89c3 f7        rst     $30
89c4 ff        rst     $38
89c5 f7        rst     $30
89c6 ff        rst     $38
89c7 f7        rst     $30
89c8 ff        rst     $38
89c9 f7        rst     $30
89ca ff        rst     $38
89cb f7        rst     $30
89cc ff        rst     $38
89cd f7        rst     $30
89ce ff        rst     $38
89cf f7        rst     $30
89d0 ff        rst     $38
89d1 ff        rst     $38
89d2 ff        rst     $38
89d3 f7        rst     $30
89d4 ff        rst     $38
89d5 f7        rst     $30
89d6 ff        rst     $38
89d7 f7        rst     $30
89d8 ff        rst     $38
89d9 f7        rst     $30
89da ff        rst     $38
89db f7        rst     $30
89dc ff        rst     $38
89dd f7        rst     $30
89de ff        rst     $38
89df f7        rst     $30
89e0 ff        rst     $38
89e1 ff        rst     $38
89e2 ff        rst     $38
89e3 f7        rst     $30
89e4 ff        rst     $38
89e5 f7        rst     $30
89e6 ff        rst     $38
89e7 f7        rst     $30
89e8 ff        rst     $38
89e9 ff        rst     $38
89ea ff        rst     $38
89eb f7        rst     $30
89ec ff        rst     $38
89ed f7        rst     $30
89ee ff        rst     $38
89ef f7        rst     $30
89f0 ff        rst     $38
89f1 ff        rst     $38
89f2 ff        rst     $38
89f3 f7        rst     $30
89f4 ff        rst     $38
89f5 f7        rst     $30
89f6 ff        rst     $38
89f7 f7        rst     $30
89f8 ff        rst     $38
89f9 ff        rst     $38
89fa ff        rst     $38
89fb f7        rst     $30
89fc ff        rst     $38
89fd f7        rst     $30
89fe ff        rst     $38
89ff f7        rst     $30
8a00 1a        ld      a,(de)
8a01 1a        ld      a,(de)
8a02 1a        ld      a,(de)
8a03 1a        ld      a,(de)
8a04 1a        ld      a,(de)
8a05 1a        ld      a,(de)
8a06 1a        ld      a,(de)
8a07 1a        ld      a,(de)
8a08 1a        ld      a,(de)
8a09 1a        ld      a,(de)
8a0a 1a        ld      a,(de)
8a0b 1a        ld      a,(de)
8a0c 1a        ld      a,(de)
8a0d 1a        ld      a,(de)
8a0e 1a        ld      a,(de)
8a0f 1a        ld      a,(de)
8a10 1a        ld      a,(de)
8a11 1a        ld      a,(de)
8a12 1a        ld      a,(de)
8a13 1a        ld      a,(de)
8a14 1a        ld      a,(de)
8a15 02        ld      (bc),a
8a16 12        ld      (de),a
8a17 00        nop     
8a18 1a        ld      a,(de)
8a19 1a        ld      a,(de)
8a1a 1a        ld      a,(de)
8a1b 1a        ld      a,(de)
8a1c 1a        ld      a,(de)
8a1d 1a        ld      a,(de)
8a1e 1a        ld      a,(de)
8a1f 1a        ld      a,(de)
8a20 1a        ld      a,(de)
8a21 1a        ld      a,(de)
8a22 1a        ld      a,(de)
8a23 1a        ld      a,(de)
8a24 1a        ld      a,(de)
8a25 1a        ld      a,(de)
8a26 1a        ld      a,(de)
8a27 1a        ld      a,(de)
8a28 1a        ld      a,(de)
8a29 1a        ld      a,(de)
8a2a 1a        ld      a,(de)
8a2b 1a        ld      a,(de)
8a2c 1a        ld      a,(de)
8a2d 1a        ld      a,(de)
8a2e 1a        ld      a,(de)
8a2f 1a        ld      a,(de)
8a30 1a        ld      a,(de)
8a31 1a        ld      a,(de)
8a32 1a        ld      a,(de)
8a33 1a        ld      a,(de)
8a34 1a        ld      a,(de)
8a35 1a        ld      a,(de)
8a36 1a        ld      a,(de)
8a37 1a        ld      a,(de)
8a38 1a        ld      a,(de)
8a39 1a        ld      a,(de)
8a3a 1a        ld      a,(de)
8a3b 1a        ld      a,(de)
8a3c 1a        ld      a,(de)
8a3d 1a        ld      a,(de)
8a3e 1a        ld      a,(de)
8a3f 1a        ld      a,(de)
8a40 1a        ld      a,(de)
8a41 1a        ld      a,(de)
8a42 1a        ld      a,(de)
8a43 1a        ld      a,(de)
8a44 1a        ld      a,(de)
8a45 1a        ld      a,(de)
8a46 1a        ld      a,(de)
8a47 1a        ld      a,(de)
8a48 1a        ld      a,(de)
8a49 1a        ld      a,(de)
8a4a 1a        ld      a,(de)
8a4b 1a        ld      a,(de)
8a4c 1a        ld      a,(de)
8a4d 1a        ld      a,(de)
8a4e 1a        ld      a,(de)
8a4f 1a        ld      a,(de)
8a50 1a        ld      a,(de)
8a51 1a        ld      a,(de)
8a52 1a        ld      a,(de)
8a53 1a        ld      a,(de)
8a54 1a        ld      a,(de)
8a55 1a        ld      a,(de)
8a56 1a        ld      a,(de)
8a57 1a        ld      a,(de)
8a58 1a        ld      a,(de)
8a59 1a        ld      a,(de)
8a5a 1a        ld      a,(de)
8a5b 1a        ld      a,(de)
8a5c 1a        ld      a,(de)
8a5d 1a        ld      a,(de)
8a5e 1a        ld      a,(de)
8a5f 1a        ld      a,(de)
8a60 1a        ld      a,(de)
8a61 1a        ld      a,(de)
8a62 1a        ld      a,(de)
8a63 1a        ld      a,(de)
8a64 1a        ld      a,(de)
8a65 1a        ld      a,(de)
8a66 1a        ld      a,(de)
8a67 1a        ld      a,(de)
8a68 1a        ld      a,(de)
8a69 1a        ld      a,(de)
8a6a 1a        ld      a,(de)
8a6b 1a        ld      a,(de)
8a6c 1a        ld      a,(de)
8a6d 1a        ld      a,(de)
8a6e 1a        ld      a,(de)
8a6f 1a        ld      a,(de)
8a70 1a        ld      a,(de)
8a71 1a        ld      a,(de)
8a72 1a        ld      a,(de)
8a73 1a        ld      a,(de)
8a74 1a        ld      a,(de)
8a75 1a        ld      a,(de)
8a76 1a        ld      a,(de)
8a77 1a        ld      a,(de)
8a78 1a        ld      a,(de)
8a79 1a        ld      a,(de)
8a7a 1a        ld      a,(de)
8a7b 1a        ld      a,(de)
8a7c 1a        ld      a,(de)
8a7d 1a        ld      a,(de)
8a7e 1a        ld      a,(de)
8a7f 1a        ld      a,(de)
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
8ac6 00        nop     
8ac7 00        nop     
8ac8 00        nop     
8ac9 00        nop     
8aca 00        nop     
8acb 00        nop     
8acc 00        nop     
8acd 00        nop     
8ace 00        nop     
8acf 00        nop     
8ad0 00        nop     
8ad1 00        nop     
8ad2 00        nop     
8ad3 00        nop     
8ad4 00        nop     
8ad5 00        nop     
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
8ae8 00        nop     
8ae9 00        nop     
8aea 00        nop     
8aeb 00        nop     
8aec 00        nop     
8aed 00        nop     
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
8baf 00        nop     
8bb0 00        nop     
8bb1 00        nop     
8bb2 00        nop     
8bb3 00        nop     
8bb4 00        nop     
8bb5 00        nop     
8bb6 00        nop     
8bb7 00        nop     
8bb8 00        nop     
8bb9 00        nop     
8bba 00        nop     
8bbb 00        nop     
8bbc 00        nop     
8bbd 00        nop     
8bbe 00        nop     
8bbf 00        nop     
8bc0 00        nop     
8bc1 00        nop     
8bc2 00        nop     
8bc3 00        nop     
8bc4 00        nop     
8bc5 00        nop     
8bc6 00        nop     
8bc7 00        nop     
8bc8 00        nop     
8bc9 00        nop     
8bca 00        nop     
8bcb 00        nop     
8bcc 00        nop     
8bcd 00        nop     
8bce 00        nop     
8bcf 00        nop     
8bd0 00        nop     
8bd1 00        nop     
8bd2 00        nop     
8bd3 00        nop     
8bd4 00        nop     
8bd5 00        nop     
8bd6 00        nop     
8bd7 00        nop     
8bd8 00        nop     
8bd9 00        nop     
8bda 00        nop     
8bdb 00        nop     
8bdc 00        nop     
8bdd 00        nop     
8bde 00        nop     
8bdf 00        nop     
8be0 00        nop     
8be1 00        nop     
8be2 00        nop     
8be3 00        nop     
8be4 00        nop     
8be5 00        nop     
8be6 00        nop     
8be7 00        nop     
8be8 00        nop     
8be9 00        nop     
8bea 00        nop     
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
8c9c 00        nop     
8c9d 00        nop     
8c9e 00        nop     
8c9f 00        nop     
8ca0 00        nop     
8ca1 00        nop     
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
