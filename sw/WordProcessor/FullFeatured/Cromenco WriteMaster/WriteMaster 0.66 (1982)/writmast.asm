; Disassembly of the file "E:\Tmp\cpm\pcw\writmast.com"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Sunday, 14 of January 2024 at 05:43 PM
; 
0100 c34504    jp      $0445

0103 dde5      push    ix
0105 dd211301  ld      ix,$0113
0109 cd9d43    call    $439d
010c dde1      pop     ix
010e c9        ret     

010f eded      db      $ed, $ed         ; Undocumented 8 T-State NOP
0111 00        nop     
0112 66        ld      h,(hl)
0113 09        add     hl,bc
0114 1b        dec     de
0115 64        ld      h,h
0116 48        ld      c,b
0117 57        ld      d,a
0118 72        ld      (hl),d
0119 69        ld      l,c
011a 74        ld      (hl),h
011b 65        ld      h,l
011c 4d        ld      c,l
011d 61        ld      h,c
011e 73        ld      (hl),e
011f 74        ld      (hl),h
0120 65        ld      h,l
0121 72        ld      (hl),d
0122 1b        dec     de
0123 64        ld      h,h
0124 40        ld      b,b
0125 2d        dec     l
0126 2d        dec     l
0127 43        ld      b,e
0128 72        ld      (hl),d
0129 6f        ld      l,a
012a 6d        ld      l,l
012b 65        ld      h,l
012c 6d        ld      l,l
012d 63        ld      h,e
012e 6f        ld      l,a
012f 2057      jr      nz,$0188
0131 6f        ld      l,a
0132 72        ld      (hl),d
0133 64        ld      h,h
0134 2050      jr      nz,$0186
0136 72        ld      (hl),d
0137 6f        ld      l,a
0138 63        ld      h,e
0139 65        ld      h,l
013a 73        ld      (hl),e
013b 73        ld      (hl),e
013c 69        ld      l,c
013d 6e        ld      l,(hl)
013e 67        ld      h,a
013f 2053      jr      nz,$0194
0141 79        ld      a,c
0142 73        ld      (hl),e
0143 74        ld      (hl),h
0144 65        ld      h,l
0145 6d        ld      l,l
0146 2c        inc     l
0147 2076      jr      nz,$01bf
0149 65        ld      h,l
014a 72        ld      (hl),d
014b 73        ld      (hl),e
014c 69        ld      l,c
014d 6f        ld      l,a
014e 6e        ld      l,(hl)
014f 2030      jr      nz,$0181
0151 302e      jr      nc,$0181
0153 3636      ld      (hl),$36
0155 200d      jr      nz,$0164
0157 0a        ld      a,(bc)
0158 09        add     hl,bc
0159 43        ld      b,e
015a 6f        ld      l,a
015b 70        ld      (hl),b
015c 79        ld      a,c
015d 72        ld      (hl),d
015e 69        ld      l,c
015f 67        ld      h,a
0160 68        ld      l,b
0161 74        ld      (hl),h
0162 2028      jr      nz,$018c
0164 63        ld      h,e
0165 29        add     hl,hl
0166 2031      jr      nz,$0199
0168 39        add     hl,sp
0169 3831      jr      c,$019c
016b 2c        inc     l
016c 2031      jr      nz,$019f
016e 39        add     hl,sp
016f 3832      jr      c,$01a3
0171 2c        inc     l
0172 2043      jr      nz,$01b7
0174 72        ld      (hl),d
0175 6f        ld      l,a
0176 6d        ld      l,l
0177 65        ld      h,l
0178 6d        ld      l,l
0179 63        ld      h,e
017a 6f        ld      l,a
017b 2c        inc     l
017c 2049      jr      nz,$01c7
017e 6e        ld      l,(hl)
017f 63        ld      h,e
0180 2e20      ld      l,$20
0182 2041      jr      nz,$01c5
0184 6c        ld      l,h
0185 6c        ld      l,h
0186 2072      jr      nz,$01fa
0188 69        ld      l,c
0189 67        ld      h,a
018a 68        ld      l,b
018b 74        ld      (hl),h
018c 73        ld      (hl),e
018d 2072      jr      nz,$0201
018f 65        ld      h,l
0190 73        ld      (hl),e
0191 65        ld      h,l
0192 72        ld      (hl),d
0193 76        halt    
0194 65        ld      h,l
0195 64        ld      h,h
0196 2e24      ld      l,$24
0198 cd883c    call    $3c88
019b 281c      jr      z,$01b9
019d c5        push    bc
019e e5        push    hl
019f 21ba01    ld      hl,$01ba
01a2 011600    ld      bc,$0016
01a5 edb1      cpir    
01a7 200e      jr      nz,$01b7
01a9 01ba01    ld      bc,$01ba
01ac 2b        dec     hl
01ad b7        or      a
01ae ed42      sbc     hl,bc
01b0 44        ld      b,h
01b1 4d        ld      c,l
01b2 21d001    ld      hl,$01d0
01b5 09        add     hl,bc
01b6 7e        ld      a,(hl)
01b7 e1        pop     hl
01b8 c1        pop     bc
01b9 c9        ret     

01ba ecedee    call    pe,$eeed
01bd ef        rst     $28
01be ff        rst     $38
01bf fefd      cp      $fd
01c1 fcfbfa    call    m,$fafb
01c4 f9        ld      sp,hl
01c5 f8        ret     m

01c6 f7        rst     $30
01c7 f6f5      or      $f5
01c9 f4f200    call    p,$00f2
01cc 1c        inc     e
01cd 1d        dec     e
01ce 1e1f      ld      e,$1f
01d0 f0        ret     p

01d1 fb        ei      
01d2 f8        ret     m

01d3 f5        push    af
01d4 ecf4f9    call    pe,$f9f4
01d7 faf7f6    jp      m,$f6f7
01da f2f3ee    jp      p,$eef3
01dd edfd      db      $ed, $fd         ; Undocumented 8 T-State NOP
01df feef      cp      $ef
01e1 fcebff    call    m,$ffeb
01e4 eaf1c5    jp      pe,$c5f1
01e7 d5        push    de
01e8 0e02      ld      c,$02
01ea 1e1b      ld      e,$1b		
01ec cd0500    call    $0005		call BDOS 
01ef 1e47      ld      e,$47
01f1 cd0500    call    $0005		call BDOS 
01f4 0e80      ld      c,$80
01f6 cd0500    call    $0005		call BDOS 
01f9 d1        pop     de
01fa c1        pop     bc
01fb c9        ret     

01fc f5        push    af
01fd c5        push    bc
01fe d5        push    de
01ff 0e02      ld      c,$02
0201 1e1b      ld      e,$1b
0203 cd0500    call    $0005		call BDOS 
0206 1e4c      ld      e,$4c
0208 cd0500    call    $0005		call BDOS 
020b d1        pop     de
020c c1        pop     bc
020d f1        pop     af
020e c9        ret     

020f f5        push    af
0210 c5        push    bc
0211 d5        push    de
0212 0e02      ld      c,$02
0214 1e1b      ld      e,$1b
0216 cd0500    call    $0005		call BDOS 
0219 1e4d      ld      e,$4d
021b cd0500    call    $0005		call BDOS 
021e d1        pop     de
021f c1        pop     bc
0220 f1        pop     af
0221 c9        ret     

0222 f5        push    af
0223 c5        push    bc
0224 d5        push    de
0225 1e07      ld      e,$07
0227 0e02      ld      c,$02
0229 cd0500    call    $0005		call BDOS 
022c d1        pop     de
022d c1        pop     bc
022e f1        pop     af
022f c9        ret     

0230 f5        push    af
0231 c5        push    bc
0232 d5        push    de
0233 113f02    ld      de,$023f
0236 0e09      ld      c,$09
0238 cd0500    call    $0005		call BDOS 
023b d1        pop     de
023c c1        pop     bc
023d f1        pop     af
023e c9        ret     

023f 0d        dec     c
0240 0a        ld      a,(bc)
0241 24        inc     h
0242 f5        push    af
0243 c5        push    bc
0244 d5        push    de
0245 1606      ld      d,$06		DE=0600 -> clear to end of line
0247 1e00      ld      e,$00		 
0249 0e8e      ld      c,$8e		CDOS: set special crt function
024b cd0500    call    $0005		call BDOS 
024e d1        pop     de
024f c1        pop     bc
0250 f1        pop     af
0251 c9        ret     

0252 f5        push    af
0253 e5        push    hl
0254 3e07      ld      a,$07
0256 67        ld      h,a
0257 cdc78e    call    $8ec7
025a fe01      cp      $01
025c 2003      jr      nz,$0261
025e 97        sub     a
025f 181b      jr      $027c
0261 fe0d      cp      $0d
0263 2804      jr      z,$0269
0265 fe0a      cp      $0a
0267 2008      jr      nz,$0271
0269 cd208f    call    $8f20
026c cd5380    call    $8053
026f 180b      jr      $027c
0271 cd5091    call    $9150
0274 cd5380    call    $8053
0277 f5        push    af
0278 cd208f    call    $8f20
027b f1        pop     af
027c cd8202    call    $0282
027f e1        pop     hl
0280 f1        pop     af
0281 c9        ret     

0282 cdd502    call    $02d5
0285 cd6503    call    $0365
0288 cde702    call    $02e7
028b 7c        ld      a,h
028c cd6503    call    $0365
028f c9        ret     

0290 f5        push    af
0291 c5        push    bc
0292 cd3e83    call    $833e
0295 3d        dec     a
0296 47        ld      b,a
0297 3e4c      ld      a,$4c
0299 cdb202    call    $02b2
029c c1        pop     bc
029d f1        pop     af
029e c9        ret     

029f cd203c    call    $3c20
02a2 200d      jr      nz,$02b1
02a4 f5        push    af
02a5 c5        push    bc
02a6 cd3e83    call    $833e
02a9 47        ld      b,a
02aa 3e3e      ld      a,$3e
02ac cdb202    call    $02b2
02af c1        pop     bc
02b0 f1        pop     af
02b1 c9        ret     

02b2 d5        push    de
02b3 32d202    ld      ($02d2),a
02b6 11ce02    ld      de,$02ce
02b9 0e09      ld      c,$09
02bb cd0500    call    $0005		call BDOS 
02be 78        ld      a,b
02bf c61f      add     a,$1f
02c1 cd7844    call    $4478		write char in A
02c4 11d102    ld      de,$02d1
02c7 0e09      ld      c,$09
02c9 cd0500    call    $0005		call BDOS 
02cc d1        pop     de
02cd c9        ret     

02ce 1b        dec     de
02cf 5e        ld      e,(hl)
02d0 24        inc     h
02d1 6f        ld      l,a
02d2 4c        ld      c,h
02d3 1d        dec     e
02d4 24        inc     h
02d5 f5        push    af
02d6 c5        push    bc
02d7 d5        push    de
02d8 3eff      ld      a,$ff
02da 1e00      ld      e,$00
02dc 1603      ld      d,$03		cursor right
02de 0e8e      ld      c,$8e		CDOS: set special crt function
02e0 cd0b8c    call    $8c0b
02e3 d1        pop     de
02e4 c1        pop     bc
02e5 f1        pop     af
02e6 c9        ret     

02e7 f5        push    af
02e8 c5        push    bc
02e9 d5        push    de
02ea 3eff      ld      a,$ff
02ec 1e00      ld      e,$00
02ee 1602      ld      d,$02		cursor left
02f0 0e8e      ld      c,$8e		CDOS: set special crt function
02f2 cd0b8c    call    $8c0b
02f5 d1        pop     de
02f6 c1        pop     bc
02f7 f1        pop     af
02f8 c9        ret     

02f9 0e02      ld      c,$02
02fb 1e1b      ld      e,$1b
02fd cd0500    call    $0005		call BDOS 
0300 1e65      ld      e,$65
0302 cd0500    call    $0005		call BDOS 
0305 c9        ret     

0306 f5        push    af
0307 c5        push    bc
0308 d5        push    de
0309 cde702    call    $02e7
030c 1e20      ld      e,$20
030e 0e02      ld      c,$02
0310 cd0500    call    $0005		call BDOS 
0313 cde702    call    $02e7
0316 d1        pop     de
0317 c1        pop     bc
0318 f1        pop     af
0319 c9        ret     

031a f5        push    af
031b c5        push    bc
031c d5        push    de
031d 112903    ld      de,$0329
0320 0e09      ld      c,$09
0322 cd0500    call    $0005		call BDOS 
0325 d1        pop     de
0326 c1        pop     bc
0327 f1        pop     af
0328 c9        ret     

0329 1b        dec     de
032a 5a        ld      e,d
032b 24        inc     h
032c f5        push    af
032d c5        push    bc
032e d5        push    de
032f 113b03    ld      de,$033b
0332 0e09      ld      c,$09
0334 cd0500    call    $0005		call BDOS 
0337 d1        pop     de
0338 c1        pop     bc
0339 f1        pop     af
033a c9        ret     

033b 1b        dec     de
033c 5a        ld      e,d
033d 24        inc     h

				clear screen
033e f5        push    af
033f c5        push    bc
0340 d5        push    de
0341 1600      ld      d,$00	DE=0000 -> clear screen
0343 1e00      ld      e,$00
0345 0e8e      ld      c,$8e	CDOS: set special crt function (not implemented)
0347 cd0500    call    $0005	call BDOS 142
034a 1e0d      ld      e,$0d
034c 0e02      ld      c,$02
034e cd0500    call    $0005	call BDOS 2 conout <CR>
0351 d1        pop     de
0352 c1        pop     bc
0353 f1        pop     af
0354 c9        ret     

0355 f5        push    af
0356 c5        push    bc
0357 d5        push    de
0358 1607      ld      d,$07	clear to end of screen
035a 1e00      ld      e,$00
035c 0e8e      ld      c,$8e	CDOS: set special crt function
035e cd0500    call    $0005		call BDOS 
0361 d1        pop     de
0362 c1        pop     bc
0363 f1        pop     af
0364 c9        ret     

0365 f5        push    af
0366 c5        push    bc
0367 d5        push    de
0368 e5        push    hl
0369 fe11      cp      $11
036b 3012      jr      nc,$037f
036d 218403    ld      hl,$0384
0370 cd5d8c    call    $8c5d
0373 7e        ld      a,(hl)
0374 119503    ld      de,$0395
0377 0e09      ld      c,$09
0379 cd0500    call    $0005		call BDOS 
037c cd7844    call    $4478		write char in A
037f e1        pop     hl
0380 d1        pop     de
0381 c1        pop     bc
0382 f1        pop     af
0383 c9        ret     

0384 40        ld      b,b
0385 41        ld      b,c
0386 42        ld      b,d
0387 43        ld      b,e
0388 50        ld      d,b
0389 51        ld      d,c
038a 52        ld      d,d
038b 53        ld      d,e
038c 60        ld      h,b
038d 61        ld      h,c
038e 62        ld      h,d
038f 63        ld      h,e
0390 70        ld      (hl),b
0391 71        ld      (hl),c
0392 72        ld      (hl),d
0393 73        ld      (hl),e
0394 24        inc     h
0395 1b        dec     de
0396 64        ld      h,h
0397 24        inc     h
0398 f5        push    af
0399 c5        push    bc
039a d5        push    de
039b 0e09      ld      c,$09
039d 11b003    ld      de,$03b0
03a0 cd0500    call    $0005		call BDOS 
03a3 cda343    call    $43a3
03a6 11b303    ld      de,$03b3
03a9 cd0500    call    $0005		call BDOS 
03ac d1        pop     de
03ad c1        pop     bc
03ae f1        pop     af
03af c9        ret     

03b0 1b        dec     de
03b1 3b        dec     sp
03b2 24        inc     h
03b3 1d        dec     e
03b4 1b        dec     de
03b5 3124f5    ld      sp,$f524
03b8 c5        push    bc
03b9 d5        push    de
03ba 11c603    ld      de,$03c6
03bd 0e09      ld      c,$09
03bf cd0500    call    $0005		call BDOS 
03c2 d1        pop     de
03c3 c1        pop     bc
03c4 f1        pop     af
03c5 c9        ret     

03c6 1b        dec     de
03c7 321b2d    ld      ($2d1b),a
03ca 24        inc     h
03cb f5        push    af
03cc c5        push    bc
03cd d5        push    de
03ce f5        push    af
03cf 11e103    ld      de,$03e1
03d2 0e09      ld      c,$09
03d4 cd0500    call    $0005		call BDOS 
03d7 f1        pop     af
03d8 c61f      add     a,$1f
03da cd7844    call    $4478		write char in A
03dd d1        pop     de
03de c1        pop     bc
03df f1        pop     af
03e0 c9        ret     

03e1 1b        dec     de
03e2 3c        inc     a
03e3 24        inc     h
03e4 f5        push    af
03e5 c5        push    bc
03e6 d5        push    de
03e7 f5        push    af
03e8 11fa03    ld      de,$03fa
03eb 0e09      ld      c,$09
03ed cd0500    call    $0005		call BDOS 
03f0 f1        pop     af
03f1 c61f      add     a,$1f
03f3 cd7844    call    $4478		write char in A
03f6 d1        pop     de
03f7 c1        pop     bc
03f8 f1        pop     af
03f9 c9        ret     

03fa 1b        dec     de
03fb 3d        dec     a
03fc 24        inc     h
03fd c5        push    bc
03fe d5        push    de
03ff 110a04    ld      de,$040a
0402 0e09      ld      c,$09
0404 cd0500    call    $0005		call BDOS 
0407 d1        pop     de
0408 c1        pop     bc
0409 c9        ret     

040a 0d        dec     c
040b 09        add     hl,bc
040c 09        add     hl,bc
040d 09        add     hl,bc
040e 09        add     hl,bc
040f 09        add     hl,bc
0410 09        add     hl,bc
0411 09        add     hl,bc
0412 09        add     hl,bc
0413 09        add     hl,bc
0414 2020      jr      nz,$0436
0416 2020      jr      nz,$0438
0418 2020      jr      nz,$043a
041a 1b        dec     de
041b 64        ld      h,h
041c 40        ld      b,b
041d 0d        dec     c
041e 1b        dec     de
041f 64        ld      h,h
0420 61        ld      h,c
0421 24        inc     h
0422 c5        push    bc
0423 d5        push    de
0424 1e7e      ld      e,$7e
0426 0e02      ld      c,$02
0428 cd0500    call    $0005		call BDOS 
042b d1        pop     de
042c c1        pop     bc
042d c9        ret     

042e c5        push    bc
042f 0e8e      ld      c,$8e		CDOS: set special crt function
0431 cd0500    call    $0005		call BDOS 
0434 c1        pop     bc
0435 c9        ret     

0436 114004    ld      de,$0440
0439 0e09      ld      c,$09
043b cd0500    call    $0005		call BDOS 
043e 1804      jr      $0444
0440 1b        dec     de
0441 2e39      ld      l,$39
0443 24        inc     h
0444 c9        ret     

					start program

0445 318905    ld      sp,$0589
0448 cdbd8c    call    $8cbd
044b cd2c03    call    $032c
044e cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
0451 382c      jr      c,$047f
0453 cd0301    call    $0103
0456 dd211cbb  ld      ix,$bb1c
045a cda343    call    $43a3
045d 0e8d      ld      c,$8d
045f cd0500    call    $0005		call BDOS 
0462 fe03      cp      $03
0464 2006      jr      nz,$046c
0466 dd2135bd  ld      ix,$bd35
046a 1804      jr      $0470
046c dd2144bd  ld      ix,$bd44
0470 cda343    call    $43a3
0473 dd2155bd  ld      ix,$bd55
0477 cda343    call    $43a3
047a cd4e08    call    $084e
047d 18cf      jr      $044e
047f cd6482    call    $8264
0482 cd1a03    call    $031a
0485 cdec7c    call    $7cec
0488 cd9e73    call    $739e
048b cd2c03    call    $032c
048e cdb28c    call    $8cb2
0491 3005      jr      nc,$0498
0493 cdbb0e    call    $0ebb
0496 18e7      jr      $047f
0498 21ac04    ld      hl,$04ac
049b 012400    ld      bc,$0024
049e edb1      cpir    
04a0 2005      jr      nz,$04a7
04a2 cdd004    call    $04d0
04a5 18a7      jr      $044e
04a7 cd2202    call    $0222
04aa 18d3      jr      $047f
04ac 09        add     hl,bc
04ad 0b        dec     bc
04ae 0a        ld      a,(bc)
04af 08        ex      af,af'
04b0 0c        inc     c
04b1 19        add     hl,de
04b2 0d        dec     c
04b3 f8        ret     m

04b4 f5        push    af
04b5 edee      db      $ed, $ee         ; Undocumented 8 T-State NOP
04b7 ff        rst     $38
04b8 ef        rst     $28
04b9 e0        ret     po

04ba e1        pop     hl
04bb fefd      cp      $fd
04bd e3        ex      (sp),hl
04be e2f17f    jp      po,$7ff1
04c1 ece81b    call    pe,$1be8
04c4 eb        ex      de,hl
04c5 fb        ei      
04c6 f3        di      
04c7 eaf0f4    jp      pe,$f4f0
04ca fcfaf9    call    m,$f9fa
04cd f7        rst     $30
04ce f6f2      or      $f2
04d0 01ac04    ld      bc,$04ac
04d3 b7        or      a
04d4 ed42      sbc     hl,bc
04d6 7d        ld      a,l
04d7 21dd04    ld      hl,$04dd
04da c38088    jp      $8880
04dd b4        or      h
04de 07        rlca    
04df c60b      add     a,$0b
04e1 d0        ret     nc

04e2 0b        dec     bc
04e3 da0be7    jp      c,$e70b
04e6 0b        dec     bc
04e7 f40b0b    call    p,$0b0b
04ea 0e26      ld      c,$26
04ec 08        ex      af,af'
04ed fe0b      cp      $0b
04ef ba        cp      d
04f0 07        rlca    
04f1 e0        ret     po

04f2 07        rlca    
04f3 12        ld      (de),a
04f4 08        ex      af,af'
04f5 1c        inc     e
04f6 08        ex      af,af'
04f7 90        sub     b
04f8 08        ex      af,af'
04f9 2d        dec     l
04fa 0a        ld      a,(bc)
04fb 88        adc     a,b
04fc 0b        dec     bc
04fd 98        sbc     a,b
04fe 0b        dec     bc
04ff da0ae7    jp      c,$e70a
0502 0a        ld      a,(bc)
0503 1b        dec     de
0504 0b        dec     bc
0505 6a        ld      l,d
0506 0b        dec     bc
0507 e0        ret     po

0508 0c        inc     c
0509 a3        and     e
050a 0a        ld      a,(bc)
050b 4e        ld      c,(hl)
050c 08        ex      af,af'
050d a8        xor     b
050e 0b        dec     bc
050f c20b01    jp      nz,$010b
0512 0d        dec     c
0513 d1        pop     de
0514 0d        dec     c
0515 e1        pop     hl
0516 0d        dec     c
0517 15        dec     d
0518 0689      ld      b,$89
051a 05        dec     b
051b 79        ld      a,c
051c 067f      ld      b,$7f
051e 06b9      ld      b,$b9
0520 067b      ld      b,$7b
0522 07        rlca    
0523 89        adc     a,c
0524 07        rlca    
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
0589 cdde3a    call    $3ade
058c cd1a03    call    $031a
058f 212020    ld      hl,$2020
0592 221206    ld      ($0612),hl
0595 cd934a    call    $4a93
0598 211106    ld      hl,$0611
059b 4f        ld      c,a
059c 0600      ld      b,$00
059e cd5e8b    call    $8b5e
05a1 dd21f405  ld      ix,$05f4
05a5 cd9803    call    $0398
05a8 cdec7c    call    $7cec
05ab feeb      cp      $eb
05ad 2012      jr      nz,$05c1
05af dd21a5b3  ld      ix,$b3a5
05b3 cd9d43    call    $439d
05b6 cd6f43    call    $436f
05b9 cd7d7a    call    $7a7d
05bc cd6482    call    $8264
05bf 18e0      jr      $05a1
05c1 fe1b      cp      $1b
05c3 2828      jr      z,$05ed
05c5 fe08      cp      $08
05c7 2005      jr      nz,$05ce
05c9 cd2d4a    call    $4a2d
05cc 181f      jr      $05ed
05ce fe0c      cp      $0c
05d0 2005      jr      nz,$05d7
05d2 cd454a    call    $4a45
05d5 1816      jr      $05ed
05d7 cd934a    call    $4a93
05da 47        ld      b,a
05db cd2b83    call    $832b
05de 32f44a    ld      ($4af4),a
05e1 cd3f48    call    $483f
05e4 3807      jr      c,$05ed
05e6 fd21f44a  ld      iy,$4af4
05ea cd824a    call    $4a82
05ed cd2c03    call    $032c
05f0 cdb703    call    $03b7
05f3 c9        ret     

05f4 53        ld      d,e
05f5 65        ld      h,l
05f6 74        ld      (hl),h
05f7 204c      jr      nz,$0645
05f9 65        ld      h,l
05fa 66        ld      h,(hl)
05fb 74        ld      (hl),h
05fc 204d      jr      nz,$064b
05fe 61        ld      h,c
05ff 72        ld      (hl),d
0600 67        ld      h,a
0601 69        ld      l,c
0602 6e        ld      l,(hl)
0603 2e20      ld      l,$20
0605 2043      jr      nz,$064a
0607 75        ld      (hl),l
0608 72        ld      (hl),d
0609 72        ld      (hl),d
060a 65        ld      h,l
060b 6e        ld      l,(hl)
060c 74        ld      (hl),h
060d 6c        ld      l,h
060e 79        ld      a,c
060f 3a2000    ld      a,($0020)
0612 00        nop     
0613 00        nop     
0614 24        inc     h
0615 cdde3a    call    $3ade
0618 cda44a    call    $4aa4
061b 47        ld      b,a
061c 0e00      ld      c,$00
061e cdc78e    call    $8ec7
0621 fe01      cp      $01
0623 281f      jr      z,$0644
0625 fe0d      cp      $0d
0627 2810      jr      z,$0639
0629 fe0a      cp      $0a
062b 2817      jr      z,$0644
062d fe20      cp      $20
062f 28ed      jr      z,$061e
0631 fe09      cp      $09
0633 28e9      jr      z,$061e
0635 0e00      ld      c,$00
0637 18e5      jr      $061e
0639 0c        inc     c
063a 78        ld      a,b
063b b9        cp      c
063c 30e0      jr      nc,$061e
063e cd5237    call    $3752
0641 cde440    call    $40e4
0644 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	 
0647 cd208f    call    $8f20
064a 0e00      ld      c,$00
064c cd208f    call    $8f20
064f fe01      cp      $01
0651 2819      jr      z,$066c
0653 fe0d      cp      $0d
0655 2810      jr      z,$0667
0657 fe0a      cp      $0a
0659 2811      jr      z,$066c
065b fe20      cp      $20
065d 28ed      jr      z,$064c
065f fe09      cp      $09
0661 28e9      jr      z,$064c
0663 0e00      ld      c,$00
0665 18e5      jr      $064c
0667 0c        inc     c
0668 78        ld      a,b
0669 b9        cp      c
066a 30e0      jr      nc,$064c
066c cd6533    call    $3365
066f cdd482    call    $82d4
0672 cd4e83    call    $834e
0675 cd7d7a    call    $7a7d
0678 c9        ret     

0679 0e86      ld      c,$86
067b cd8506    call    $0685
067e c9        ret     

067f 0e81      ld      c,$81
0681 cd8506    call    $0685
0684 c9        ret     

0685 cde010    call    $10e0
0688 cd5091    call    $9150
068b cd8f3e    call    $3e8f
068e 79        ld      a,c
068f 2805      jr      z,$0696
0691 cd223e    call    $3e22
0694 180a      jr      $06a0
0696 cdef3c    call    $3cef
0699 3005      jr      nc,$06a0
069b cd7d7a    call    $7a7d
069e 1818      jr      $06b8
06a0 cd3e11    call    $113e
06a3 cda440    call    $40a4
06a6 cd6482    call    $8264
06a9 cd8e11    call    $118e
06ac cd1611    call    $1116
06af cd0141    call    $4101
06b2 cda440    call    $40a4
06b5 cd4911    call    $1149
06b8 c9        ret     

06b9 97        sub     a
06ba 328407    ld      ($0784),a
06bd dde5      push    ix
06bf fde5      push    iy
06c1 cd393b    call    $3a6c		reset BIT4 flag at 3c98
06c4 2006      jr      nz,$06cc
06c6 cdd85f    call    $5fd8
06c9 c37307    jp      $0773
06cc cd3e11    call    $113e
06cf fd218507  ld      iy,$0785
06d3 cddd5e    call    $5edd
06d6 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
06d9 cd1e41    call    $411e
06dc ed4bb894  ld      bc,($94b8)
06e0 2aba94    ld      hl,($94ba)
06e3 b7        or      a
06e4 ed42      sbc     hl,bc
06e6 7c        ld      a,h
06e7 fe02      cp      $02
06e9 2003      jr      nz,$06ee
06eb 7d        ld      a,l
06ec fe00      cp      $00
06ee 300c      jr      nc,$06fc
06f0 cde95e    call    $5ee9
06f3 cd1e41    call    $411e
06f6 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
06f9 cd1e41    call    $411e
06fc cde95e    call    $5ee9
06ff cdd68a    call    $8ad6
0702 7a        ld      a,d
0703 b3        or      e
0704 2059      jr      nz,$075f
0706 7c        ld      a,h
0707 fe02      cp      $02
0709 2003      jr      nz,$070e
070b 7d        ld      a,l
070c fe00      cp      $00
070e 304f      jr      nc,$075f
0710 44        ld      b,h
0711 4d        ld      c,l
0712 c5        push    bc
0713 111e76    ld      de,$761e
0716 2ab894    ld      hl,($94b8)
0719 edb0      ldir    
071b c1        pop     bc
071c 3a8407    ld      a,($0784)
071f b7        or      a
0720 282e      jr      z,$0750
0722 cd3992    call    $9239
0725 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
0728 fd219212  ld      iy,$1292
072c cdd68a    call    $8ad6
072f 301f      jr      nc,$0750
0731 60        ld      h,b
0732 69        ld      l,c
0733 110000    ld      de,$0000
0736 fd218507  ld      iy,$0785
073a cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
073d fd219212  ld      iy,$1292
0741 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
0744 fd218507  ld      iy,$0785
0748 cdd68a    call    $8ad6
074b cd1e41    call    $411e
074e 1807      jr      $0757
0750 fd219212  ld      iy,$1292
0754 cd4911    call    $1149
0757 111e76    ld      de,$761e
075a cdca91    call    $91ca
075d 180e      jr      $076d
075f dd2199b4  ld      ix,$b499
0763 cd0544    call    $4405
0766 fd219212  ld      iy,$1292
076a cd4911    call    $1149
076d cdd482    call    $82d4
0770 cd4e83    call    $834e
0773 cd7d7a    call    $7a7d
0776 fde1      pop     iy
0778 dde1      pop     ix
077a c9        ret     

077b 3e01      ld      a,$01
077d 328407    ld      ($0784),a
0780 cdbd06    call    $06bd
0783 c9        ret     

0784 00        nop     
0785 00        nop     
0786 00        nop     
0787 00        nop     
0788 00        nop     
0789 cd2b83    call    $832b
078c fe01      cp      $01
078e 2806      jr      z,$0796
0790 cd2d0a    call    $0a2d
0793 cdc78e    call    $8ec7
0796 cd9383    call    $8393
0799 47        ld      b,a
079a cd3e83    call    $833e
079d b8        cp      b
079e dcd183    call    c,$83d1
07a1 cd6482    call    $8264
07a4 cdfc01    call    $01fc
07a7 cdfd03    call    $03fd
07aa cde53f    call    $3fe5
07ad cd0e81    call    $810e
07b0 cd4e83    call    $834e
07b3 c9        ret     

07b4 3e09      ld      a,$09
07b6 cdbb0e    call    $0ebb
07b9 c9        ret     

07ba cd3e83    call    $833e
07bd f5        push    af
07be c617      add     a,$17
07c0 47        ld      b,a
07c1 cde440    call    $40e4
07c4 fe01      cp      $01
07c6 2808      jr      z,$07d0
07c8 cd3e83    call    $833e
07cb b8        cp      b
07cc 38f3      jr      c,$07c1
07ce 1804      jr      $07d4
07d0 47        ld      b,a
07d1 cda440    call    $40a4
07d4 f1        pop     af
07d5 cd4683    call    $8346
07d8 cd7d7a    call    $7a7d
07db cd4e83    call    $834e
07de 78        ld      a,b
07df c9        ret     

07e0 cd3e83    call    $833e
07e3 f5        push    af
07e4 47        ld      b,a
07e5 c616      add     a,$16
07e7 cd4683    call    $8346
07ea cd0141    call    $4101
07ed fe01      cp      $01
07ef 280f      jr      z,$0800
07f1 cd3e83    call    $833e
07f4 b8        cp      b
07f5 30f3      jr      nc,$07ea
07f7 cda440    call    $40a4
07fa f1        pop     af
07fb cddc82    call    $82dc
07fe 180a      jr      $080a
0800 47        ld      b,a
0801 cda440    call    $40a4
0804 f1        pop     af
0805 3e02      ld      a,$02
0807 cd4683    call    $8346
080a cd7d7a    call    $7a7d
080d cd4e83    call    $834e
0810 78        ld      a,b
0811 c9        ret     

0812 cda440    call    $40a4
0815 dc7d7a    call    c,$7a7d
0818 cd4e83    call    $834e
081b c9        ret     

081c cdc440    call    $40c4
081f dc7d7a    call    c,$7a7d
0822 cd4e83    call    $834e
0825 c9        ret     

0826 cdc78e    call    $8ec7
0829 f5        push    af
082a cd988c    call    $8c98
082d 3806      jr      c,$0835
082f f1        pop     af
0830 cd0e81    call    $810e
0833 1815      jr      $084a
0835 cd208f    call    $8f20
0838 ee20      xor     $20
083a 5f        ld      e,a
083b cdae92    call    $92ae
083e f1        pop     af
083f 3806      jr      c,$0847
0841 7b        ld      a,e
0842 cd7844    call    $4478		write char in A
0845 1803      jr      $084a
0847 cd7d7a    call    $7a7d
084a cd4e83    call    $834e
084d c9        ret     

084e cd1a03    call    $031a
0851 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
0854 3006      jr      nc,$085c
0856 cd5202    call    $0252
0859 cdde3a    call    $3ade
085c dd21d91e  ld      ix,$1ed9
0860 fd21de89  ld      iy,$89de
0864 cd6e85    call    $856e
0867 2132cb    ld      hl,$cb32
086a cd3884    call    $8438
086d b7        or      a
086e 2808      jr      z,$0878
0870 210022    ld      hl,$2200
0873 cd8088    call    $8880
0876 1801      jr      $0879
0878 37        scf     
0879 cd9e85    call    $859e
087c cd2c03    call    $032c
087f 3005      jr      nc,$0886
0881 cd7d7a    call    $7a7d
0884 3009      jr      nc,$088f
0886 cd6482    call    $8264
0889 cd8102    call    $0281
088c cd4e83    call    $834e
088f c9        ret     

0890 cd5312    call    $1253
0893 cd8291    call    $9182
0896 cd3e11    call    $113e
0899 cd2b83    call    $832b
089c 329012    ld      ($1290),a
089f cde010    call    $10e0
08a2 cdf373    call    $73f3
08a5 cd5091    call    $9150
08a8 fe0c      cp      $0c
08aa 2019      jr      nz,$08c5
08ac cd0d4a    call    $4a0d
08af 3014      jr      nc,$08c5
08b1 cdcf11    call    $11cf
08b4 300f      jr      nc,$08c5
08b6 cd0f02    call    $020f
08b9 010100    ld      bc,$0001
08bc cd3992    call    $9239
08bf cde783    call    $83e7
08c2 c30e0a    jp      $0a0e
08c5 0601      ld      b,$01
08c7 cdfe3f    call    $3ffe
08ca 380e      jr      c,$08da
08cc cdfa11    call    $11fa
08cf cd203f    call    $3f20
08d2 cd5091    call    $9150
08d5 fe01      cp      $01
08d7 c2eb08    jp      nz,$08eb
08da cd8e11    call    $118e
08dd cd9383    call    $8393
08e0 47        ld      b,a
08e1 cd3e83    call    $833e
08e4 b8        cp      b
08e5 dcd183    call    c,$83d1
08e8 c3050a    jp      $0a05
08eb 3a9012    ld      a,($1290)
08ee fe01      cp      $01
08f0 286e      jr      z,$0960
08f2 cd5091    call    $9150
08f5 fe0c      cp      $0c
08f7 2009      jr      nz,$0902
08f9 cddd3f    call    $3fdd
08fc cd8e11    call    $118e
08ff c3050a    jp      $0a05
0902 3a8f12    ld      a,($128f)
0905 fe18      cp      $18
0907 2006      jr      nz,$090f
0909 cd150a    call    $0a15
090c c3050a    jp      $0a05
090f fe17      cp      $17
0911 2031      jr      nz,$0944
0913 cd9383    call    $8393
0916 fe18      cp      $18
0918 28ef      jr      z,$0909
091a 3a8e12    ld      a,($128e)
091d fe01      cp      $01
091f 2012      jr      nz,$0933
0921 cd0f02    call    $020f
0924 cde440    call    $40e4
0927 cd3002    call    $0230
092a cd8e11    call    $118e
092d cd1611    call    $1116
0930 c3050a    jp      $0a05
0933 cd150a    call    $0a15
0936 cd3002    call    $0230
0939 cd8e11    call    $118e
093c fe01      cp      $01
093e c41611    call    nz,$1116
0941 c3050a    jp      $0a05
0944 3a8e12    ld      a,($128e)
0947 fe01      cp      $01
0949 2813      jr      z,$095e
094b cd150a    call    $0a15
094e cd3002    call    $0230
0951 fe01      cp      $01
0953 2006      jr      nz,$095b
0955 cd8e11    call    $118e
0958 c3080a    jp      $0a08
095b cd208f    call    $8f20
095e 1835      jr      $0995
0960 3a8f12    ld      a,($128f)
0963 fe18      cp      $18
0965 2006      jr      nz,$096d
0967 cd150a    call    $0a15
096a c3050a    jp      $0a05
096d fe17      cp      $17
096f 2024      jr      nz,$0995
0971 cd9383    call    $8393
0974 fe18      cp      $18
0976 201d      jr      nz,$0995
0978 cd5091    call    $9150
097b fe0c      cp      $0c
097d 2011      jr      nz,$0990
097f cd8e11    call    $118e
0982 cdfd03    call    $03fd
0985 cdd183    call    $83d1
0988 cdc78e    call    $8ec7
098b cd1611    call    $1116
098e 1875      jr      $0a05
0990 cd150a    call    $0a15
0993 1870      jr      $0a05
0995 cdbf83    call    $83bf
0998 cd0f02    call    $020f
099b cdc883    call    $83c8
099e 3a8f12    ld      a,($128f)
09a1 47        ld      b,a
09a2 cd9383    call    $8393
09a5 90        sub     b
09a6 2e00      ld      l,$00
09a8 3802      jr      c,$09ac
09aa 04        inc     b
09ab 6f        ld      l,a
09ac 3e18      ld      a,$18
09ae 90        sub     b
09af 47        ld      b,a
09b0 2600      ld      h,$00
09b2 2d        dec     l
09b3 7d        ld      a,l
09b4 b7        or      a
09b5 2017      jr      nz,$09ce
09b7 cd5091    call    $9150
09ba fe0c      cp      $0c
09bc 2007      jr      nz,$09c5
09be cdd183    call    $83d1
09c1 26ff      ld      h,$ff
09c3 1809      jr      $09ce
09c5 fe01      cp      $01
09c7 2005      jr      nz,$09ce
09c9 cdd183    call    $83d1
09cc 1837      jr      $0a05
09ce cde440    call    $40e4
09d1 10df      djnz    $09b2
09d3 1601      ld      d,$01
09d5 7c        ld      a,h
09d6 b7        or      a
09d7 201e      jr      nz,$09f7
09d9 1e18      ld      e,$18
09db cd9383    call    $8393
09de fe18      cp      $18
09e0 200d      jr      nz,$09ef
09e2 cd5091    call    $9150
09e5 fe0c      cp      $0c
09e7 2005      jr      nz,$09ee
09e9 cdd183    call    $83d1
09ec 1809      jr      $09f7
09ee 1d        dec     e
09ef cd2e04    call    $042e	CDOS: set special crt function
09f2 cd1611    call    $1116
09f5 180e      jr      $0a05
09f7 1e17      ld      e,$17
09f9 cd2e04    call    $042e	CDOS: set special crt function
09fc cd1611    call    $1116
09ff cd3002    call    $0230
0a02 cd1611    call    $1116
0a05 cd0141    call    $4101
0a08 cda440    call    $40a4
0a0b cd4911    call    $1149
0a0e cd0011    call    $1100
0a11 cd4e83    call    $834e
0a14 c9        ret     

0a15 3a8e12    ld      a,($128e)
0a18 fe01      cp      $01
0a1a c4e702    call    nz,$02e7
0a1d cd8e11    call    $118e
0a20 cd5091    call    $9150
0a23 cd5380    call    $8053
0a26 cd6503    call    $0365
0a29 cd2511    call    $1125
0a2c c9        ret     

0a2d cd5312    call    $1253
0a30 cd5091    call    $9150
0a33 cdbc11    call    $11bc
0a36 c48291    call    nz,$9182
0a39 cde010    call    $10e0
0a3c cd3e11    call    $113e
0a3f cdfa11    call    $11fa
0a42 cddd3f    call    $3fdd
0a45 cd1c90    call    $901c
0a48 cdfa11    call    $11fa
0a4b cdc78e    call    $8ec7
0a4e cdfa11    call    $11fa
0a51 cdbf83    call    $83bf
0a54 3a8e12    ld      a,($128e)
0a57 fe01      cp      $01
0a59 2817      jr      z,$0a72
0a5b fe4e      cp      $4e
0a5d dc8e11    call    c,$118e
0a60 cd3e83    call    $833e
0a63 fe19      cp      $19
0a65 282f      jr      z,$0a96
0a67 cd3002    call    $0230
0a6a cdfc01    call    $01fc
0a6d cd1611    call    $1116
0a70 1803      jr      $0a75
0a72 cdfc01    call    $01fc
0a75 cd0d4a    call    $4a0d
0a78 301c      jr      nc,$0a96
0a7a cdcf11    call    $11cf
0a7d 3017      jr      nc,$0a96
0a7f cd5091    call    $9150
0a82 fe01      cp      $01
0a84 2810      jr      z,$0a96
0a86 fe0c      cp      $0c
0a88 280c      jr      z,$0a96
0a8a cde440    call    $40e4
0a8d cd3e83    call    $833e
0a90 bb        cp      e
0a91 38ec      jr      c,$0a7f
0a93 cde783    call    $83e7
0a96 cdc883    call    $83c8
0a99 cd4911    call    $1149
0a9c cd0011    call    $1100
0a9f cd4e83    call    $834e
0aa2 c9        ret     

0aa3 cd5011    call    $1150
0aa6 282e      jr      z,$0ad6
0aa8 cd5312    call    $1253
0aab cd5091    call    $9150
0aae fe0d      cp      $0d
0ab0 2824      jr      z,$0ad6
0ab2 fe0a      cp      $0a
0ab4 2820      jr      z,$0ad6
0ab6 cde010    call    $10e0
0ab9 cd8e11    call    $118e
0abc cdf373    call    $73f3
0abf 0601      ld      b,$01
0ac1 cdfe3f    call    $3ffe
0ac4 cdfa11    call    $11fa
0ac7 cd5091    call    $9150
0aca cddd3f    call    $3fdd
0acd cd208f    call    $8f20
0ad0 cdc810    call    $10c8
0ad3 dc7d7a    call    c,$7a7d
0ad6 cd4e83    call    $834e
0ad9 c9        ret     

0ada cd743a    call    $3a74
0add cc7c3a    call    z,$3a7c
0ae0 c4de3a    call    nz,$3ade
0ae3 cd4e83    call    $834e
0ae6 c9        ret     

0ae7 cd5091    call    $9150
0aea cdbc11    call    $11bc
0aed 2828      jr      z,$0b17
0aef cde010    call    $10e0
0af2 cdd473    call    $73d4
0af5 010100    ld      bc,$0001
0af8 cd3992    call    $9239
0afb cd203f    call    $3f20
0afe cdc810    call    $10c8
0b01 3005      jr      nc,$0b08
0b03 cd7d7a    call    $7a7d
0b06 180f      jr      $0b17
0b08 cd3e11    call    $113e
0b0b cd8e11    call    $118e
0b0e cd2511    call    $1125
0b11 cd4911    call    $1149
0b14 cd0011    call    $1100
0b17 cd4e83    call    $834e
0b1a c9        ret     

0b1b cd3e11    call    $113e
0b1e cd5091    call    $9150
0b21 cd600b    call    $0b60
0b24 200f      jr      nz,$0b35
0b26 dd21c7bf  ld      ix,$bfc7
0b2a cd0544    call    $4405
0b2d cd7d7a    call    $7a7d
0b30 cd4911    call    $1149
0b33 182a      jr      $0b5f
0b35 cd208f    call    $8f20
0b38 cd600b    call    $0b60
0b3b 20f8      jr      nz,$0b35
0b3d fe01      cp      $01
0b3f c4c78e    call    nz,$8ec7
0b42 cd5091    call    $9150
0b45 cd600b    call    $0b60
0b48 2805      jr      z,$0b4f
0b4a cdef0a    call    $0aef
0b4d 18f3      jr      $0b42
0b4f cdbc11    call    $11bc
0b52 280b      jr      z,$0b5f
0b54 cdef0a    call    $0aef
0b57 cd5091    call    $9150
0b5a cd600b    call    $0b60
0b5d 28f0      jr      z,$0b4f
0b5f c9        ret     

0b60 cdf842    call    $42f8
0b63 c8        ret     z

0b64 fe01      cp      $01
0b66 c8        ret     z

0b67 fe01      cp      $01
0b69 c9        ret     

0b6a cde010    call    $10e0
0b6d cd8291    call    $9182
0b70 cdbc11    call    $11bc
0b73 280f      jr      z,$0b84
0b75 cd208f    call    $8f20
0b78 cdc810    call    $10c8
0b7b dc7d7a    call    c,$7a7d
0b7e cd6482    call    $8264
0b81 cdef0a    call    $0aef
0b84 cd4e83    call    $834e
0b87 c9        ret     

0b88 cde010    call    $10e0
0b8b cd4437    call    $3744
0b8e cdc810    call    $10c8
0b91 cd0e81    call    $810e
0b94 cd4e83    call    $834e
0b97 c9        ret     

0b98 cde010    call    $10e0
0b9b cd5237    call    $3752
0b9e cdc810    call    $10c8
0ba1 cd6081    call    $8160
0ba4 cd4e83    call    $834e
0ba7 c9        ret     

0ba8 dd21f5b4  ld      ix,$b4f5
0bac cd9d43    call    $439d
0baf cd8643    call    $4386
0bb2 280a      jr      z,$0bbe
0bb4 dd21f6b8  ld      ix,$b8f6
0bb8 cd9d43    call    $439d
0bbb cd6f43    call    $436f
0bbe cd7d7a    call    $7a7d
0bc1 c9        ret     

0bc2 cd7d7a    call    $7a7d
0bc5 c9        ret     

0bc6 cd3740    call    $4037
0bc9 cd6081    call    $8160
0bcc cda37d    call    $7da3		discard keys typed on terminal
0bcf c9        ret     

0bd0 cd5a40    call    $405a
0bd3 cd0e81    call    $810e
0bd6 cda37d    call    $7da3		discard keys typed on terminal
0bd9 c9        ret     

0bda cd208f    call    $8f20
0bdd cd6081    call    $8160
0be0 cd4e83    call    $834e
0be3 cda37d    call    $7da3		discard keys typed on terminal
0be6 c9        ret     

0be7 cdc78e    call    $8ec7
0bea cd0e81    call    $810e
0bed cd4e83    call    $834e
0bf0 cda37d    call    $7da3		discard keys typed on terminal
0bf3 c9        ret     

0bf4 cd6041    call    $4160
0bf7 dc7d7a    call    c,$7a7d
0bfa cd4e83    call    $834e
0bfd c9        ret     

0bfe cde010    call    $10e0
0c01 cd934a    call    $4a93
0c04 47        ld      b,a
0c05 cd974a    call    $4a97
0c08 90        sub     b
0c09 287e      jr      z,$0c89
0c0b 387c      jr      c,$0c89
0c0d 4f        ld      c,a
0c0e cda440    call    $40a4
0c11 cd5091    call    $9150
0c14 fe01      cp      $01
0c16 2871      jr      z,$0c89
0c18 fe0c      cp      $0c
0c1a 2808      jr      z,$0c24
0c1c fe0a      cp      $0a
0c1e 2804      jr      z,$0c24
0c20 fe0d      cp      $0d
0c22 2008      jr      nz,$0c2c
0c24 cd5a40    call    $405a
0c27 cd0e81    call    $810e
0c2a 185d      jr      $0c89
0c2c c5        push    bc
0c2d cdc00c    call    $0cc0
0c30 c1        pop     bc
0c31 fe01      cp      $01
0c33 2854      jr      z,$0c89
0c35 fe0d      cp      $0d
0c37 28eb      jr      z,$0c24
0c39 fe0a      cp      $0a
0c3b 28e7      jr      z,$0c24
0c3d cdc440    call    $40c4
0c40 cd2b83    call    $832b
0c43 d602      sub     $02
0c45 47        ld      b,a
0c46 cda440    call    $40a4
0c49 cd798f    call    $8f79
0c4c fe8b      cp      $8b
0c4e c41c90    call    nz,$901c
0c51 79        ld      a,c
0c52 90        sub     b
0c53 300d      jr      nc,$0c62
0c55 78        ld      a,b
0c56 91        sub     c
0c57 b7        or      a
0c58 1f        rra     
0c59 47        ld      b,a
0c5a cd934a    call    $4a93
0c5d 90        sub     b
0c5e 38c4      jr      c,$0c24
0c60 1806      jr      $0c68
0c62 1f        rra     
0c63 47        ld      b,a
0c64 cd934a    call    $4a93
0c67 80        add     a,b
0c68 cd8d0c    call    $0c8d
0c6b 381c      jr      c,$0c89
0c6d cda440    call    $40a4
0c70 cdc810    call    $10c8
0c73 3008      jr      nc,$0c7d
0c75 cde440    call    $40e4
0c78 cd7d7a    call    $7a7d
0c7b 180c      jr      $0c89
0c7d cd6482    call    $8264
0c80 cd8e11    call    $118e
0c83 cd1611    call    $1116
0c86 cd0e81    call    $810e
0c89 cd4e83    call    $834e
0c8c c9        ret     

0c8d b7        or      a
0c8e 282e      jr      z,$0cbe
0c90 3d        dec     a
0c91 d608      sub     $08
0c93 380f      jr      c,$0ca4
0c95 f5        push    af
0c96 010100    ld      bc,$0001
0c99 11df0c    ld      de,$0cdf
0c9c cdca91    call    $91ca
0c9f 3819      jr      c,$0cba
0ca1 f1        pop     af
0ca2 18ed      jr      $0c91
0ca4 c608      add     a,$08
0ca6 2816      jr      z,$0cbe
0ca8 47        ld      b,a
0ca9 c5        push    bc
0caa 010100    ld      bc,$0001
0cad 11de0c    ld      de,$0cde
0cb0 cdca91    call    $91ca
0cb3 3805      jr      c,$0cba
0cb5 c1        pop     bc
0cb6 10f1      djnz    $0ca9
0cb8 1804      jr      $0cbe
0cba c1        pop     bc
0cbb 37        scf     
0cbc 1801      jr      $0cbf
0cbe b7        or      a
0cbf c9        ret     

0cc0 cdc78e    call    $8ec7
0cc3 fe01      cp      $01
0cc5 2816      jr      z,$0cdd
0cc7 fe09      cp      $09
0cc9 2804      jr      z,$0ccf
0ccb fe20      cp      $20
0ccd 200b      jr      nz,$0cda
0ccf cd208f    call    $8f20
0cd2 010100    ld      bc,$0001
0cd5 cd3992    call    $9239
0cd8 18e6      jr      $0cc0
0cda cd208f    call    $8f20
0cdd c9        ret     

0cde 2009      jr      nz,$0ce9
0ce0 cd513b    call    $3b51
0ce3 2012      jr      nz,$0cf7
0ce5 cddd3d    call    $3ddd
0ce8 3808      jr      c,$0cf2
0cea cd735e    call    $5e73
0ced cd7d7a    call    $7a7d
0cf0 180e      jr      $0d00
0cf2 cd735e    call    $5e73
0cf5 1809      jr      $0d00
0cf7 cddd3d    call    $3ddd
0cfa cd8e5e    call    $5e8e
0cfd c47d7a    call    nz,$7a7d
0d00 c9        ret     

0d01 cde010    call    $10e0
0d04 cdc442    call    $42c4
0d07 fe01      cp      $01
0d09 2803      jr      z,$0d0e
0d0b cd208f    call    $8f20
0d0e cd208f    call    $8f20
0d11 fe01      cp      $01
0d13 ca910d    jp      z,$0d91
0d16 fe0d      cp      $0d
0d18 28f4      jr      z,$0d0e
0d1a fe0c      cp      $0c
0d1c 28f0      jr      z,$0d0e
0d1e fe20      cp      $20
0d20 28ec      jr      z,$0d0e
0d22 fe09      cp      $09
0d24 28e8      jr      z,$0d0e
0d26 fe0a      cp      $0a
0d28 201b      jr      nz,$0d45
0d2a 3e0d      ld      a,$0d
0d2c cdae92    call    $92ae
0d2f cd208f    call    $8f20
0d32 cdc810    call    $10c8
0d35 3808      jr      c,$0d3f
0d37 cd6482    call    $8264
0d3a 3e20      ld      a,$20
0d3c cd7844    call    $4478		write char in A
0d3f cdc442    call    $42c4
0d42 c3c90d    jp      $0dc9
0d45 cdc78e    call    $8ec7
0d48 cdc810    call    $10c8
0d4b 3809      jr      c,$0d56
0d4d cd6482    call    $8264
0d50 cd8e11    call    $118e
0d53 cd2204    call    $0422
0d56 cd5091    call    $9150
0d59 fe20      cp      $20
0d5b 2804      jr      z,$0d61
0d5d fe09      cp      $09
0d5f 2008      jr      nz,$0d69
0d61 010100    ld      bc,$0001
0d64 cd3992    call    $9239
0d67 18ed      jr      $0d56
0d69 fe0d      cp      $0d
0d6b 2007      jr      nz,$0d74
0d6d 0601      ld      b,$01
0d6f cdfe3f    call    $3ffe
0d72 1814      jr      $0d88
0d74 fe01      cp      $01
0d76 2810      jr      z,$0d88
0d78 cd3e83    call    $833e
0d7b fe18      cp      $18
0d7d 3009      jr      nc,$0d88
0d7f cd3002    call    $0230
0d82 cd6011    call    $1160
0d85 cd8411    call    $1184
0d88 010100    ld      bc,$0001
0d8b 11d00d    ld      de,$0dd0
0d8e cdca91    call    $91ca
0d91 cdc442    call    $42c4
0d94 cd154a    call    $4a15
0d97 dc4939    call    c,$3949
0d9a cdc810    call    $10c8
0d9d 382a      jr      c,$0dc9
0d9f cd5091    call    $9150
0da2 fe01      cp      $01
0da4 2823      jr      z,$0dc9
0da6 cd3e83    call    $833e
0da9 fe19      cp      $19
0dab 301c      jr      nc,$0dc9
0dad cda440    call    $40a4
0db0 cd6482    call    $8264
0db3 cd8e11    call    $118e
0db6 cd1611    call    $1116
0db9 cd0141    call    $4101
0dbc cda440    call    $40a4
0dbf cdc442    call    $42c4
0dc2 fe20      cp      $20
0dc4 c4208f    call    nz,$8f20
0dc7 1803      jr      $0dcc
0dc9 cd0e81    call    $810e
0dcc cd4e83    call    $834e
0dcf c9        ret     

0dd0 0a        ld      a,(bc)
0dd1 cd1a03    call    $031a
0dd4 cd9452    call    $5294
0dd7 cd2c03    call    $032c
0dda cdd482    call    $82d4
0ddd cd7d7a    call    $7a7d
0de0 c9        ret     

0de1 cde010    call    $10e0
0de4 cd6774    call    $7467
0de7 281e      jr      z,$0e07
0de9 cdc810    call    $10c8
0dec 3005      jr      nc,$0df3
0dee cd7d7a    call    $7a7d
0df1 1817      jr      $0e0a
0df3 cd3e11    call    $113e
0df6 cde010    call    $10e0
0df9 cd2511    call    $1125
0dfc cda440    call    $40a4
0dff cd4911    call    $1149
0e02 cd0011    call    $1100
0e05 1803      jr      $0e0a
0e07 cd2202    call    $0222
0e0a c9        ret     

0e0b cde010    call    $10e0
0e0e cde440    call    $40e4
0e11 f5        push    af
0e12 fe01      cp      $01
0e14 2039      jr      nz,$0e4f
0e16 cd3683    call    $8336
0e19 4f        ld      c,a
0e1a cddd3f    call    $3fdd
0e1d cd3002    call    $0230
0e20 cd6011    call    $1160
0e23 cd154a    call    $4a15
0e26 3015      jr      nc,$0e3d
0e28 cda44a    call    $4aa4
0e2b 3d        dec     a
0e2c 280c      jr      z,$0e3a
0e2e 47        ld      b,a
0e2f cddd3f    call    $3fdd
0e32 cd3002    call    $0230
0e35 cd6011    call    $1160
0e38 10f5      djnz    $0e2f
0e3a cd4939    call    $3949
0e3d cd3e83    call    $833e
0e40 fe19      cp      $19
0e42 3805      jr      c,$0e49
0e44 3e18      ld      a,$18
0e46 cd4683    call    $8346
0e49 cd5583    call    $8355
0e4c c1        pop     bc
0e4d 1865      jr      $0eb4
0e4f cd154a    call    $4a15
0e52 305f      jr      nc,$0eb3
0e54 cda44a    call    $4aa4
0e57 47        ld      b,a
0e58 1807      jr      $0e61
0e5a cde440    call    $40e4
0e5d fe01      cp      $01
0e5f 28ce      jr      z,$0e2f
0e61 cd3e83    call    $833e
0e64 fe19      cp      $19
0e66 3006      jr      nc,$0e6e
0e68 cd3002    call    $0230
0e6b cd6011    call    $1160
0e6e 10ea      djnz    $0e5a
0e70 cdc78e    call    $8ec7
0e73 fe20      cp      $20
0e75 28f9      jr      z,$0e70
0e77 fe09      cp      $09
0e79 28f5      jr      z,$0e70
0e7b fe01      cp      $01
0e7d 280c      jr      z,$0e8b
0e7f fe0c      cp      $0c
0e81 2005      jr      nz,$0e88
0e83 cd3002    call    $0230
0e86 18e8      jr      $0e70
0e88 cd208f    call    $8f20
0e8b cd934a    call    $4a93
0e8e 47        ld      b,a
0e8f cd2b83    call    $832b
0e92 b8        cp      b
0e93 281e      jr      z,$0eb3
0e95 f1        pop     af
0e96 cd4939    call    $3949
0e99 cdc810    call    $10c8
0e9c 3816      jr      c,$0eb4
0e9e cd3e83    call    $833e
0ea1 fe19      cp      $19
0ea3 300f      jr      nc,$0eb4
0ea5 cd3e11    call    $113e
0ea8 cda440    call    $40a4
0eab cd6482    call    $8264
0eae cdb810    call    $10b8
0eb1 1804      jr      $0eb7
0eb3 f1        pop     af
0eb4 cd0e81    call    $810e
0eb7 cd4e83    call    $834e
0eba c9        ret     

0ebb cd5011    call    $1150
0ebe ca7210    jp      z,$1072
0ec1 327610    ld      ($1076),a
0ec4 cde010    call    $10e0
0ec7 cd743a    call    $3a74
0eca 286b      jr      z,$0f37
0ecc cd2b83    call    $832b
0ecf 329012    ld      ($1290),a
0ed2 3a7610    ld      a,($1076)
0ed5 fe09      cp      $09
0ed7 2037      jr      nz,$0f10
0ed9 cd8291    call    $9182
0edc cd3e11    call    $113e
0edf cda367    call    $67a3
0ee2 da7210    jp      c,$1072
0ee5 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
0ee8 d5        push    de
0ee9 e5        push    hl
0eea cda440    call    $40a4
0eed cd4911    call    $1149
0ef0 e1        pop     hl
0ef1 d1        pop     de
0ef2 cdc810    call    $10c8
0ef5 da6810    jp      c,$1068
0ef8 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
0efb cd6482    call    $8264
0efe cd8e11    call    $118e
0f01 cd2511    call    $1125
0f04 cd0141    call    $4101
0f07 cda440    call    $40a4
0f0a cd4911    call    $1149
0f0d c36810    jp      $1068
0f10 cd8291    call    $9182
0f13 cd3e11    call    $113e
0f16 117610    ld      de,$1076
0f19 010100    ld      bc,$0001
0f1c cdca91    call    $91ca
0f1f da7210    jp      c,$1072
0f22 cd208f    call    $8f20
0f25 cd8e11    call    $118e
0f28 cd2511    call    $1125
0f2b cd4911    call    $1149
0f2e cd0011    call    $1100
0f31 cdc78e    call    $8ec7
0f34 c36810    jp      $1068
0f37 3a7610    ld      a,($1076)
0f3a fe09      cp      $09
0f3c 2006      jr      nz,$0f44
0f3e cda367    call    $67a3
0f41 c36810    jp      $1068
0f44 cdf741    call    $41f7
0f47 da7210    jp      c,$1072
0f4a cdc47c    call    $7cc4
0f4d cd5091    call    $9150
0f50 fe0a      cp      $0a
0f52 2006      jr      nz,$0f5a
0f54 cd2204    call    $0422
0f57 cde702    call    $02e7
0f5a cd2b83    call    $832b
0f5d 47        ld      b,a
0f5e cd974a    call    $4a97
0f61 3d        dec     a
0f62 b8        cp      b
0f63 d26810    jp      nc,$1068
0f66 c602      add     a,$02
0f68 b8        cp      b
0f69 d42202    call    nc,$0222
0f6c cd154a    call    $4a15
0f6f d26810    jp      nc,$1068
0f72 3a7610    ld      a,($1076)
0f75 fe20      cp      $20
0f77 c26810    jp      nz,$1068
0f7a 05        dec     b
0f7b 05        dec     b
0f7c cd974a    call    $4a97
0f7f b8        cp      b
0f80 301b      jr      nc,$0f9d
0f82 cdde42    call    $42de
0f85 cd3e11    call    $113e
0f88 cd1037    call    $3710
0f8b 280d      jr      z,$0f9a
0f8d 3e00      ld      a,$00
0f8f 327710    ld      ($1077),a
0f92 cd597d    call    $7d59		read key into keyboard buffer
0f95 cd7810    call    $1078
0f98 184c      jr      $0fe6
0f9a cd4911    call    $1149
0f9d cd208f    call    $8f20
0fa0 010100    ld      bc,$0001
0fa3 cd3992    call    $9239
0fa6 cd5091    call    $9150
0fa9 327710    ld      ($1077),a
0fac fe01      cp      $01
0fae 283c      jr      z,$0fec
0fb0 fe0a      cp      $0a
0fb2 280b      jr      z,$0fbf
0fb4 fe0d      cp      $0d
0fb6 2807      jr      z,$0fbf
0fb8 3eff      ld      a,$ff
0fba 327710    ld      ($1077),a
0fbd 1827      jr      $0fe6
0fbf cd9a10    call    $109a
0fc2 cda44a    call    $4aa4
0fc5 47        ld      b,a
0fc6 cde440    call    $40e4
0fc9 fe01      cp      $01
0fcb 2814      jr      z,$0fe1
0fcd cd5091    call    $9150
0fd0 fe0c      cp      $0c
0fd2 280d      jr      z,$0fe1
0fd4 cd3002    call    $0230
0fd7 cd6011    call    $1160
0fda cd597d    call    $7d59		read key into keyboard buffer
0fdd 10e7      djnz    $0fc6
0fdf 1845      jr      $1026
0fe1 327710    ld      ($1077),a
0fe4 1820      jr      $1006
0fe6 cd8e11    call    $118e
0fe9 cd597d    call    $7d59		read key into keyboard buffer
0fec cda44a    call    $4aa4
0fef 47        ld      b,a
0ff0 cddd3f    call    $3fdd
0ff3 387d      jr      c,$1072
0ff5 cd208f    call    $8f20
0ff8 cd9a10    call    $109a
0ffb cdc78e    call    $8ec7
0ffe cd3002    call    $0230
1001 cd6011    call    $1160
1004 1815      jr      $101b
1006 cddd3f    call    $3fdd
1009 3867      jr      c,$1072
100b cd3002    call    $0230
100e cd6011    call    $1160
1011 3a7710    ld      a,($1077)
1014 feff      cp      $ff
1016 2803      jr      z,$101b
1018 b7        or      a
1019 2006      jr      nz,$1021
101b 78        ld      a,b
101c fe01      cp      $01
101e c48411    call    nz,$1184
1021 cd597d    call    $7d59		read key into keyboard buffer
1024 10e0      djnz    $1006
1026 cdc78e    call    $8ec7
1029 fe20      cp      $20
102b 28f9      jr      z,$1026
102d fe09      cp      $09
102f 28f5      jr      z,$1026
1031 fe01      cp      $01
1033 2808      jr      z,$103d
1035 fe0c      cp      $0c
1037 cc208f    call    z,$8f20
103a cd208f    call    $8f20
103d cd4939    call    $3949
1040 3a7710    ld      a,($1077)
1043 feff      cp      $ff
1045 2809      jr      z,$1050
1047 b7        or      a
1048 2009      jr      nz,$1053
104a cdf336    call    $36f3
104d cdc78e    call    $8ec7
1050 cd8411    call    $1184
1053 cd3e11    call    $113e
1056 cd3e83    call    $833e
1059 fe19      cp      $19
105b 3805      jr      c,$1062
105d 3e18      ld      a,$18
105f cd4683    call    $8346
1062 cda440    call    $40a4
1065 cdb810    call    $10b8
1068 3a9112    ld      a,($1291)
106b 4f        ld      c,a
106c cd5583    call    $8355
106f dc7d7a    call    c,$7a7d
1072 cd4e83    call    $834e
1075 c9        ret     

1076 00        nop     
1077 00        nop     
1078 3a9112    ld      a,($1291)
107b 4f        ld      c,a
107c cd3683    call    $8336
107f b9        cp      c
1080 2814      jr      z,$1096
1082 cd3a83    call    $833a
1085 c608      add     a,$08
1087 cd4a83    call    $834a
108a f5        push    af
108b cd6482    call    $8264
108e f1        pop     af
108f d608      sub     $08
1091 cd4a83    call    $834a
1094 1803      jr      $1099
1096 cd6482    call    $8264
1099 c9        ret     

109a cd1d4a    call    $4a1d
109d c8        ret     z

109e cd597d    call    $7d59		read key into keyboard buffer
10a1 cd6636    call    $3666
10a4 d0        ret     nc

10a5 cd597d    call    $7d59		read key into keyboard buffer
10a8 cda440    call    $40a4
10ab cd6482    call    $8264
10ae cd8e11    call    $118e
10b1 cd1611    call    $1116
10b4 cd208f    call    $8f20
10b7 c9        ret     

10b8 cd8e11    call    $118e
10bb cd1611    call    $1116
10be cd208f    call    $8f20
10c1 cda440    call    $40a4
10c4 cd4911    call    $1149
10c7 c9        ret     

10c8 c5        push    bc
10c9 3a9112    ld      a,($1291)
10cc 4f        ld      c,a
10cd cd5583    call    $8355
10d0 380c      jr      c,$10de
10d2 3a9612    ld      a,($1296)
10d5 b7        or      a
10d6 2806      jr      z,$10de
10d8 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
10db 2001      jr      nz,$10de
10dd 37        scf     
10de c1        pop     bc
10df c9        ret     

10e0 cd3683    call    $8336
10e3 329112    ld      ($1291),a
10e6 cd3a83    call    $833a
10e9 328e12    ld      ($128e),a
10ec cd3e83    call    $833e
10ef 328f12    ld      ($128f),a
10f2 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
10f5 2003      jr      nz,$10fa
10f7 97        sub     a
10f8 1802      jr      $10fc
10fa 3e01      ld      a,$01
10fc 329612    ld      ($1296),a
10ff c9        ret     

1100 3a9112    ld      a,($1291)
1103 cd1c83    call    $831c
1106 3a8f12    ld      a,($128f)
1109 cd4683    call    $8346
110c 3a8e12    ld      a,($128e)
110f cd4a83    call    $834a
1112 cd6482    call    $8264
1115 c9        ret     

1116 c5        push    bc
1117 d5        push    de
1118 3a9112    ld      a,($1291)
111b 47        ld      b,a
111c c64e      add     a,$4e
111e 57        ld      d,a
111f cdf07a    call    $7af0
1122 d1        pop     de
1123 c1        pop     bc
1124 c9        ret     

1125 c5        push    bc
1126 d5        push    de
1127 cda440    call    $40a4
112a 3a9112    ld      a,($1291)
112d 4f        ld      c,a
112e 3a8e12    ld      a,($128e)
1131 81        add     a,c
1132 3d        dec     a
1133 47        ld      b,a
1134 3e4e      ld      a,$4e
1136 81        add     a,c
1137 57        ld      d,a
1138 cdf07a    call    $7af0
113b d1        pop     de
113c c1        pop     bc
113d c9        ret     

113e cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1141 fd219212  ld      iy,$1292
1145 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
1148 c9        ret     

1149 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
114c cd1e41    call    $411e
114f c9        ret     

1150 325f11    ld      ($115f),a
1153 cd5091    call    $9150
1156 fe0c      cp      $0c
1158 cc2202    call    z,$0222
115b 3a5f11    ld      a,($115f)
115e c9        ret     

115f 00        nop     
1160 c5        push    bc
1161 cd0d4a    call    $4a0d
1164 301c      jr      nc,$1182
1166 cda769    call    $69a7
1169 210100    ld      hl,$0001
116c 7c        ld      a,h
116d b8        cp      b
116e 2002      jr      nz,$1172
1170 7d        ld      a,l
1171 b9        cp      c
1172 200e      jr      nz,$1182
1174 cd0381    call    $8103
1177 cd3002    call    $0230
117a cd9383    call    $8393
117d fe18      cp      $18
117f ccb283    call    z,$83b2
1182 c1        pop     bc
1183 c9        ret     

1184 cdbf83    call    $83bf
1187 cdfc01    call    $01fc
118a cdc883    call    $83c8
118d c9        ret     

118e f5        push    af
118f c5        push    bc
1190 cd208f    call    $8f20
1193 fe01      cp      $01
1195 281f      jr      z,$11b6
1197 cd5380    call    $8053
119a b7        or      a
119b 2816      jr      z,$11b3
119d 47        ld      b,a
119e cdc78e    call    $8ec7
11a1 cd5091    call    $9150
11a4 cd5380    call    $8053
11a7 b8        cp      b
11a8 280c      jr      z,$11b6
11aa cd4202    call    $0242
11ad 97        sub     a
11ae cd6503    call    $0365
11b1 1806      jr      $11b9
11b3 cdc78e    call    $8ec7
11b6 cd4202    call    $0242
11b9 c1        pop     bc
11ba f1        pop     af
11bb c9        ret     

11bc fe01      cp      $01
11be 280e      jr      z,$11ce
11c0 fe01      cp      $01
11c2 280a      jr      z,$11ce
11c4 fe0d      cp      $0d
11c6 2806      jr      z,$11ce
11c8 fe0a      cp      $0a
11ca 2802      jr      z,$11ce
11cc fe0c      cp      $0c
11ce c9        ret     

11cf cd9f4a    call    $4a9f
11d2 60        ld      h,b
11d3 69        ld      l,c
11d4 cda769    call    $69a7
11d7 0b        dec     bc
11d8 b7        or      a
11d9 ed42      sbc     hl,bc
11db 7c        ld      a,h
11dc b7        or      a
11dd 2019      jr      nz,$11f8
11df cd3e83    call    $833e
11e2 47        ld      b,a
11e3 3e18      ld      a,$18
11e5 90        sub     b
11e6 3810      jr      c,$11f8
11e8 bd        cp      l
11e9 380d      jr      c,$11f8
11eb 78        ld      a,b
11ec 85        add     a,l
11ed 5f        ld      e,a
11ee cd9383    call    $8393
11f1 bb        cp      e
11f2 2804      jr      z,$11f8
11f4 7b        ld      a,e
11f5 37        scf     
11f6 1801      jr      $11f9
11f8 b7        or      a
11f9 c9        ret     

11fa f5        push    af
11fb cde73b    call    $3be7
11fe 2805      jr      z,$1205
1200 115012    ld      de,$1250
1203 1812      jr      $1217
1205 cddf3b    call    $3bdf
1208 2805      jr      z,$120f
120a 115112    ld      de,$1251
120d 1808      jr      $1217
120f cdf83b    call    $3bf8
1212 280c      jr      z,$1220
1214 115212    ld      de,$1252
1217 010100    ld      bc,$0001
121a cdca91    call    $91ca
121d cd1c90    call    $901c
1220 3a8e12    ld      a,($128e)
1223 fe01      cp      $01
1225 2827      jr      z,$124e
1227 cd5380    call    $8053
122a fe04      cp      $04
122c 280c      jr      z,$123a
122e fe05      cp      $05
1230 2808      jr      z,$123a
1232 fe0c      cp      $0c
1234 2804      jr      z,$123a
1236 fe0d      cp      $0d
1238 2004      jr      nz,$123e
123a 3e04      ld      a,$04
123c 1801      jr      $123f
123e 97        sub     a
123f cd6503    call    $0365
1242 cd3e83    call    $833e
1245 fe19      cp      $19
1247 2805      jr      z,$124e
1249 3e20      ld      a,$20
124b cd7844    call    $4478		write char in A
124e f1        pop     af
124f c9        ret     

1250 81        add     a,c
1251 86        add     a,(hl)
1252 87        add     a,a
1253 cd403c    call    $3c40
1256 2804      jr      z,$125c
1258 0682      ld      b,$82
125a 1807      jr      $1263
125c cd283c    call    $3c28
125f 282c      jr      z,$128d
1261 0683      ld      b,$83
1263 cde010    call    $10e0
1266 cd2b83    call    $832b
1269 329012    ld      ($1290),a
126c 78        ld      a,b
126d cd223e    call    $3e22
1270 cda440    call    $40a4
1273 cd6482    call    $8264
1276 cd8e11    call    $118e
1279 cd1611    call    $1116
127c cd0141    call    $4101
127f cda440    call    $40a4
1282 3a9012    ld      a,($1290)
1285 47        ld      b,a
1286 cd8040    call    $4080
1289 cd0011    call    $1100
128c 37        scf     
128d c9        ret     

128e 00        nop     
128f 00        nop     
1290 00        nop     
1291 00        nop     
1292 00        nop     
1293 00        nop     
1294 00        nop     
1295 00        nop     
1296 00        nop     
1297 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
129a 3809      jr      c,$12a5
129c dd2108c4  ld      ix,$c408
12a0 cd0544    call    $4405
12a3 181a      jr      $12bf
12a5 dd2121c4  ld      ix,$c421
12a9 cd9d43    call    $439d
12ac cd2e44    call    $442e
12af 280e      jr      z,$12bf
12b1 300c      jr      nc,$12bf
12b3 cd6c3a    call    $3a6c		Reset BIT4 flag at 3c98
12b6 cdc627    call    $27c6
12b9 cd7731    call    $3177
12bc cd8d31    call    $318d
12bf 37        scf     
12c0 c9        ret     

12c1 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
12c4 3805      jr      c,$12cb
12c6 cd6c44    call    $446c
12c9 1827      jr      $12f2
12cb dd217920  ld      ix,$2079
12cf fd21de89  ld      iy,$89de
12d3 cd3884    call    $8438
12d6 b7        or      a
12d7 2819      jr      z,$12f2
12d9 216c22    ld      hl,$226c
12dc cd8088    call    $8880
12df b7        or      a
12e0 2810      jr      z,$12f2
12e2 dd2103c3  ld      ix,$c303
12e6 cd9d43    call    $439d
12e9 cd2c03    call    $032c
12ec cd6533    call    $3365
12ef cd1a03    call    $031a
12f2 37        scf     
12f3 c9        ret     

12f4 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
12f7 3805      jr      c,$12fe
12f9 cd6c44    call    $446c
12fc 1814      jr      $1312
12fe dd217421  ld      ix,$2174
1302 fd21de89  ld      iy,$89de
1306 cd3884    call    $8438
1309 b7        or      a
130a 2806      jr      z,$1312
130c 21a622    ld      hl,$22a6
130f cd8088    call    $8880
1312 37        scf     
1313 c9        ret     

1314 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1317 3805      jr      c,$131e
1319 cd6c44    call    $446c
131c 1803      jr      $1321
131e cd901d    call    $1d90
1321 37        scf     
1322 c9        ret     

1323 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1326 300a      jr      nc,$1332
1328 dd217cc2  ld      ix,$c27c
132c cd0544    call    $4405
132f 97        sub     a
1330 183b      jr      $136d
1332 fd21268a  ld      iy,$8a26
1336 dd21f1be  ld      ix,$bef1
133a 0e0d      ld      c,$0d
133c cd9488    call    $8894
133f b7        or      a
1340 282b      jr      z,$136d
1342 37        scf     
1343 cdd627    call    $27d6
1346 feff      cp      $ff
1348 2823      jr      z,$136d
134a fe02      cp      $02
134c 2010      jr      nz,$135e
134e dd21d8c2  ld      ix,$c2d8
1352 cd0544    call    $4405
1355 cda885    call    $85a8
1358 04        inc     b
1359 cd8b88    call    $888b
135c 18c5      jr      $1323
135e cdb892    call    $92b8
1361 cdc182    call    $82c1
1364 cd231a    call    $1a23
1367 cda93b    call    $3ba9
136a cd643a    call    $3a64 		Set BIT4 flag at 3c98 		Set BIT4 flag at 3c98
136d 37        scf     
136e c9        ret     

136f cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1372 3805      jr      c,$1379
1374 cd6c44    call    $446c
1377 1814      jr      $138d
1379 dd217421  ld      ix,$2174
137d fd21de89  ld      iy,$89de
1381 cd3884    call    $8438
1384 b7        or      a
1385 2806      jr      z,$138d
1387 218622    ld      hl,$2286
138a cd8088    call    $8880
138d 37        scf     
138e c9        ret     

138f dd21a420  ld      ix,$20a4
1393 fd21de89  ld      iy,$89de
1397 cd3884    call    $8438
139a b7        or      a
139b 2806      jr      z,$13a3
139d 217422    ld      hl,$2274
13a0 cd8088    call    $8880
13a3 37        scf     
13a4 c9        ret     

13a5 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
13a8 3805      jr      c,$13af
13aa cd6c44    call    $446c
13ad 180d      jr      $13bc
13af cd393b    call    $3a6c		Reset BIT4 flag at 3c98
13b2 2805      jr      z,$13b9
13b4 cd493b    call    $3b49
13b7 1803      jr      $13bc
13b9 cdd85f    call    $5fd8
13bc 37        scf     
13bd c9        ret     

13be cd9226    call    $2692		return current drive in A (A:=1, B:=2, etc)
13c1 c640      add     a,$40
13c3 32f113    ld      ($13f1),a
13c6 11de13    ld      de,$13de
13c9 fd21268a  ld      iy,$8a26
13cd 0600      ld      b,$00
13cf 21c894    ld      hl,$94c8		94c8=end of WordMaster program
13d2 cd1886    call    $8618
13d5 fe0d      cp      $0d
13d7 2803      jr      z,$13dc
13d9 cd6f43    call    $436f
13dc 37        scf     
13dd c9        ret     

13de 54        ld      d,h
13df 65        ld      h,l
13e0 78        ld      a,b
13e1 74        ld      (hl),h
13e2 2066      jr      nz,$144a
13e4 69        ld      l,c
13e5 6c        ld      l,h
13e6 65        ld      h,l
13e7 73        ld      (hl),e
13e8 206f      jr      nz,$1459
13ea 6e        ld      l,(hl)
13eb 2064      jr      nz,$1451
13ed 69        ld      l,c
13ee 73        ld      (hl),e
13ef 6b        ld      l,e
13f0 2000      jr      nz,$13f2
13f2 3a24cd    ld      a,($cd24)
13f5 56        ld      d,(hl)
13f6 3a3009    ld      a,($0930)
13f9 dd21aac2  ld      ix,$c2aa
13fd cd0544    call    $4405
1400 180c      jr      $140e
1402 cd5926    call    $2659
1405 cdc422    call    $22c4
1408 d4ef14    call    nc,$14ef
140b cdbe13    call    $13be
140e 37        scf     
140f c9        ret     

1410 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1413 3805      jr      c,$141a
1415 cd6c44    call    $446c
1418 1822      jr      $143c
141a 213e14    ld      hl,$143e
141d cd7689    call    $8976
1420 dd21b463  ld      ix,$63b4
1424 2161c8    ld      hl,$c861
1427 cd0284    call    $8402
142a b7        or      a
142b 280f      jr      z,$143c
142d 3a6072    ld      a,($7260)
1430 3d        dec     a
1431 21ff63    ld      hl,$63ff
1434 5f        ld      e,a
1435 1600      ld      d,$00
1437 19        add     hl,de
1438 7e        ld      a,(hl)
1439 cd2063    call    $6320
143c 37        scf     
143d c9        ret     

143e 66        ld      h,(hl)
143f 72        ld      (hl),d
1440 6f        ld      l,a
1441 6d        ld      l,l
1442 2074      jr      nz,$14b8
1444 65        ld      h,l
1445 6d        ld      l,l
1446 70        ld      (hl),b
1447 2066      jr      nz,$14af
1449 69        ld      l,c
144a 6c        ld      l,h
144b 65        ld      h,l
144c 2024      jr      nz,$1472
144e cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1451 300a      jr      nc,$145d
1453 dd217cc2  ld      ix,$c27c
1457 cd0544    call    $4405
145a 97        sub     a
145b 185f      jr      $14bc
145d dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
1461 216cba    ld      hl,$ba6c
1464 cd0284    call    $8402
1467 b7        or      a
1468 2852      jr      z,$14bc
146a b7        or      a
146b cdd627    call    $27d6
146e feff      cp      $ff
1470 284a      jr      z,$14bc
1472 fe02      cp      $02
1474 280a      jr      z,$1480
1476 cdb892    call    $92b8
1479 cde392    call    $92e3
147c fe02      cp      $02
147e 200f      jr      nz,$148f
1480 dd2153c2  ld      ix,$c253
1484 cd0544    call    $4405
1487 cda885    call    $85a8
148a cd8b88    call    $888b
148d 18ce      jr      $145d
148f cdc182    call    $82c1
1492 cd231a    call    $1a23
1495 cda93b    call    $3ba9
1498 cd643a    call    $3a64 		Set BIT4 flag at 3c98
149b cddd49    call    $49dd
149e fe01      cp      $01
14a0 281a      jr      z,$14bc
14a2 cd9d42    call    $429d
14a5 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
14a8 cd8f42    call    $428f
14ab cded1c    call    $1ced
14ae b7        or      a
14af 2805      jr      z,$14b6
14b1 cdb312    call    $12b3
14b4 1806      jr      $14bc
14b6 cd8f42    call    $428f
14b9 cdc182    call    $82c1
14bc 37        scf     
14bd c9        ret     

14be cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
14c1 3808      jr      c,$14cb
14c3 cd6c44    call    $446c
14c6 cd3002    call    $0230
14c9 1824      jr      $14ef
14cb dd211fc3  ld      ix,$c31f
14cf cd9d43    call    $439d
14d2 cd2e44    call    $442e
14d5 2851      jr      z,$1528
14d7 300e      jr      nc,$14e7
14d9 cdfc49    call    $49fc
14dc cd5194    call    $9451
14df cd042a    call    $2a04
14e2 112d15    ld      de,$152d
14e5 1803      jr      $14ea
14e7 113d15    ld      de,$153d
14ea 0e09      ld      c,$09
14ec cd0500    call    $0005		call BDOS 
14ef cd1086    call    $8610
14f2 cd7731    call    $3177
14f5 cd8d31    call    $318d
14f8 cd7a63    call    $637a
14fb cd003c    call    $3c00
14fe 2805      jr      z,$1505
1500 cd858e    call    $8e85
1503 180b      jr      $1510
1505 11000d    ld      de,$0d00		dynamic function keys
1508 cd2e04    call    $042e		CDOS: set special crt function
150b 0ea2      ld      c,$a2
150d cd0500    call    $0005		call BDOS 
1510 0e0b      ld      c,$0b
1512 cd0500    call    $0005		call BDOS 
1515 b7        or      a
1516 2805      jr      z,$151d
1518 0e80      ld      c,$80
151a cd0500    call    $0005		call BDOS 
151d 115115    ld      de,$1551
1520 0e09      ld      c,$09
1522 cd0500    call    $0005		call BDOS 
1525 c30000    jp      $0000
1528 cd6888    call    $8868
152b 37        scf     
152c c9        ret     

152d 0d        dec     c
152e 0a        ld      a,(bc)
152f 54        ld      d,h
1530 65        ld      h,l
1531 78        ld      a,b
1532 74        ld      (hl),h
1533 2073      jr      nz,$15a8
1535 61        ld      h,c
1536 76        halt    
1537 65        ld      h,l
1538 64        ld      h,h
1539 2e2e      ld      l,$2e
153b 2e24      ld      l,$24
153d 0d        dec     c
153e 0a        ld      a,(bc)
153f 54        ld      d,h
1540 65        ld      h,l
1541 78        ld      a,b
1542 74        ld      (hl),h
1543 206e      jr      nz,$15b3
1545 6f        ld      l,a
1546 74        ld      (hl),h
1547 2073      jr      nz,$15bc
1549 61        ld      h,c
154a 76        halt    
154b 65        ld      h,l
154c 64        ld      h,h
154d 2e2e      ld      l,$2e
154f 2e24      ld      l,$24
1551 47        ld      b,a
1552 6f        ld      l,a
1553 6f        ld      l,a
1554 64        ld      h,h
1555 62        ld      h,d
1556 79        ld      a,c
1557 65        ld      h,l
1558 0d        dec     c
1559 0a        ld      a,(bc)
155a 24        inc     h
155b cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
155e d46c44    call    nc,$446c
1561 3038      jr      nc,$159b
1563 cdb95a    call    $5ab9
1566 b7        or      a
1567 2832      jr      z,$159b
1569 cd2c03    call    $032c
156c cd4d89    call    $894d
156f cd2b55    call    $552b
1572 301b      jr      nc,$158f
1574 cd513b    call    $3b51
1577 200e      jr      nz,$1587
1579 cd735e    call    $5e73
157c cd1e41    call    $411e
157f cd8e5e    call    $5e8e
1582 cdd482    call    $82d4
1585 1811      jr      $1598
1587 cd1e41    call    $411e
158a cdd482    call    $82d4
158d 1809      jr      $1598
158f cd1e41    call    $411e
1592 cd6089    call    $8960
1595 cda55d    call    $5da5
1598 cd1a03    call    $031a
159b 37        scf     
159c c9        ret     

159d cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
15a0 3805      jr      c,$15a7
15a2 cd6c44    call    $446c
15a5 181a      jr      $15c1
15a7 21c315    ld      hl,$15c3
15aa cd7689    call    $8976
15ad dd212520  ld      ix,$2025
15b1 fd21de89  ld      iy,$89de
15b5 cd3884    call    $8438
15b8 b7        or      a
15b9 2806      jr      z,$15c1
15bb 215c22    ld      hl,$225c
15be cd8088    call    $8880
15c1 37        scf     
15c2 c9        ret     

15c3 74        ld      (hl),h
15c4 6f        ld      l,a
15c5 2024      jr      nz,$15eb
15c7 cd2c03    call    $032c
15ca 2132cb    ld      hl,$cb32
15cd cd4764    call    $6447
15d0 cd1a03    call    $031a
15d3 37        scf     
15d4 c9        ret     

15d5 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
15d8 3805      jr      c,$15df
15da cd6c44    call    $446c
15dd 181a      jr      $15f9
15df fd21268a  ld      iy,$8a26
15e3 cd522a    call    $2a52
15e6 cdf72d    call    $2df7
15e9 fe02      cp      $02
15eb 2805      jr      z,$15f2
15ed cd3978    call    $7839
15f0 1807      jr      $15f9
15f2 dd2135c2  ld      ix,$c235
15f6 cd0544    call    $4405
15f9 37        scf     
15fa c9        ret     

15fb cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
15fe 3805      jr      c,$1605
1600 cd6c44    call    $446c
1603 181e      jr      $1623
1605 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
1608 2005      jr      nz,$160f
160a cdd85f    call    $5fd8
160d 1814      jr      $1623
160f dd21cd21  ld      ix,$21cd
1613 fd21de89  ld      iy,$89de
1617 cd3884    call    $8438
161a b7        or      a
161b 2806      jr      z,$1623
161d 21b422    ld      hl,$22b4
1620 cd8088    call    $8880
1623 37        scf     
1624 c9        ret     

1625 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
1628 3805      jr      c,$162f
162a cd6c44    call    $446c
162d 183e      jr      $166d
162f 97        sub     a
1630 32433a    ld      ($3a43),a
1633 dd218821  ld      ix,$2188
1637 fd21de89  ld      iy,$89de
163b cd3884    call    $8438
163e b7        or      a
163f 282c      jr      z,$166d
1641 21aa22    ld      hl,$22aa
1644 cd8088    call    $8880
1647 b7        or      a
1648 2823      jr      z,$166d
164a 3a433a    ld      a,($3a43)
164d b7        or      a
164e 2817      jr      z,$1667
1650 dd217920  ld      ix,$2079
1654 fd21de89  ld      iy,$89de
1658 cd3884    call    $8438
165b b7        or      a
165c 280f      jr      z,$166d
165e 216c22    ld      hl,$226c
1661 cd8088    call    $8880
1664 b7        or      a
1665 2806      jr      z,$166d
1667 cd9b39    call    $399b
166a cdd482    call    $82d4
166d 37        scf     
166e c9        ret     

166f cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
1672 3805      jr      c,$1679
1674 cd6c44    call    $446c
1677 183e      jr      $16b7
1679 97        sub     a
167a 32433a    ld      ($3a43),a
167d dd218821  ld      ix,$2188
1681 fd21de89  ld      iy,$89de
1685 cd3884    call    $8438
1688 b7        or      a
1689 282c      jr      z,$16b7
168b 21aa22    ld      hl,$22aa
168e cd8088    call    $8880
1691 b7        or      a
1692 2823      jr      z,$16b7
1694 3a433a    ld      a,($3a43)
1697 b7        or      a
1698 2817      jr      z,$16b1
169a dd217920  ld      ix,$2079
169e fd21de89  ld      iy,$89de
16a2 cd3884    call    $8438
16a5 b7        or      a
16a6 280f      jr      z,$16b7
16a8 216c22    ld      hl,$226c
16ab cd8088    call    $8880
16ae b7        or      a
16af 2806      jr      z,$16b7
16b1 cdf139    call    $39f1
16b4 cdd482    call    $82d4
16b7 37        scf     
16b8 c9        ret     

16b9 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98 		Carry=BIT4 from flags at 3c98
16bc 3805      jr      c,$16c3
16be cd6c44    call    $446c
16c1 181a      jr      $16dd
16c3 21df16    ld      hl,$16df
16c6 cd7689    call    $8976
16c9 dd21f321  ld      ix,$21f3
16cd fd21de89  ld      iy,$89de
16d1 cd3884    call    $8438
16d4 b7        or      a
16d5 2806      jr      z,$16dd
16d7 21c022    ld      hl,$22c0
16da cd8088    call    $8880
16dd 37        scf     
16de c9        ret     

16df 61        ld      h,c
16e0 6e        ld      l,(hl)
16e1 64        ld      h,h
16e2 2024      jr      nz,$1708
16e4 dd210c21  ld      ix,$210c
16e8 fd21de89  ld      iy,$89de
16ec cd3884    call    $8438
16ef b7        or      a
16f0 2806      jr      z,$16f8
16f2 218a22    ld      hl,$228a
16f5 cd8088    call    $8880
16f8 37        scf     
16f9 c9        ret     

16fa cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
16fd 3805      jr      c,$1704
16ff cd6c44    call    $446c
1702 182d      jr      $1731
1704 dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
1708 216cba    ld      hl,$ba6c
170b cd0284    call    $8402
170e b7        or      a
170f 2820      jr      z,$1731
1711 cdf62c    call    $2cf6
1714 fe02      cp      $02
1716 280a      jr      z,$1722
1718 3e01      ld      a,$01
171a cd1b2d    call    $2d1b
171d cdd482    call    $82d4
1720 180f      jr      $1731
1722 dd2153c2  ld      ix,$c253
1726 cd0544    call    $4405
1729 cda885    call    $85a8
172c cd8b88    call    $888b
172f 18d3      jr      $1704
1731 37        scf     
1732 c9        ret     

1733 cdb22e    call    $2eb2
1736 2803      jr      z,$173b
1738 cdbe13    call    $13be
173b 37        scf     
173c c9        ret     

173d cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1740 3805      jr      c,$1747
1742 cd6c44    call    $446c
1745 1803      jr      $174a
1747 cdb26d    call    $6db2
174a 37        scf     
174b c9        ret     

174c cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
174f 3805      jr      c,$1756
1751 cd6c44    call    $446c
1754 1874      jr      $17ca
1756 dd2194c1  ld      ix,$c194
175a cd9d43    call    $439d
175d cd4d89    call    $894d
1760 fd21cc17  ld      iy,$17cc
1764 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1767 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
176a cdfc49    call    $49fc
176d fd21de89  ld      iy,$89de
1771 cd522a    call    $2a52
1774 cd5194    call    $9451
1777 cd042a    call    $2a04
177a dd21afc1  ld      ix,$c1af
177e cd9d43    call    $439d
1781 cd2e44    call    $442e
1784 303a      jr      nc,$17c0
1786 fd21de89  ld      iy,$89de
178a b7        or      a
178b cdd627    call    $27d6
178e feff      cp      $ff
1790 282e      jr      z,$17c0
1792 fe02      cp      $02
1794 2823      jr      z,$17b9
1796 dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
179a cdc422    call    $22c4
179d cdb892    call    $92b8
17a0 cde392    call    $92e3
17a3 fe02      cp      $02
17a5 2812      jr      z,$17b9
17a7 cddd49    call    $49dd
17aa fd21cc17  ld      iy,$17cc
17ae cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
17b1 cd1e41    call    $411e
17b4 cd6089    call    $8960
17b7 1811      jr      $17ca
17b9 dd21dec1  ld      ix,$c1de
17bd cd0544    call    $4405
17c0 dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
17c4 cdc422    call    $22c4
17c7 cd6c3a    call    $3a6c		Reset BIT4 flag at 3c98
17ca 37        scf     
17cb c9        ret     

17cc 00        nop     
17cd 00        nop     
17ce 00        nop     
17cf 00        nop     
17d0 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
17d3 3805      jr      c,$17da
17d5 cd6c44    call    $446c
17d8 1817      jr      $17f1
17da dd21f11f  ld      ix,$1ff1
17de fd21de89  ld      iy,$89de
17e2 cd3884    call    $8438
17e5 b7        or      a
17e6 2003      jr      nz,$17eb
17e8 37        scf     
17e9 1806      jr      $17f1
17eb 215022    ld      hl,$2250
17ee cd8088    call    $8880
17f1 37        scf     
17f2 c9        ret     

17f3 dd21e41f  ld      ix,$1fe4
17f7 fd21de89  ld      iy,$89de
17fb cd3884    call    $8438
17fe b7        or      a
17ff 2806      jr      z,$1807
1801 214c22    ld      hl,$224c
1804 cd8088    call    $8880
1807 37        scf     
1808 c9        ret     

1809 dd214a21  ld      ix,$214a
180d fd21de89  ld      iy,$89de
1811 cd3884    call    $8438
1814 b7        or      a
1815 2806      jr      z,$181d
1817 219422    ld      hl,$2294
181a cd8088    call    $8880
181d 37        scf     
181e c9        ret     

181f dd210320  ld      ix,$2003
1823 fd21de89  ld      iy,$89de
1827 cd3884    call    $8438
182a b7        or      a
182b 2806      jr      z,$1833
182d 215422    ld      hl,$2254
1830 cd8088    call    $8880
1833 37        scf     
1834 c9        ret     

1835 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1838 3805      jr      c,$183f
183a cd6c44    call    $446c
183d 1814      jr      $1853
183f dd21e321  ld      ix,$21e3
1843 fd21de89  ld      iy,$89de
1847 cd3884    call    $8438
184a b7        or      a
184b 2806      jr      z,$1853
184d 21bc22    ld      hl,$22bc
1850 cd8088    call    $8880
1853 37        scf     
1854 c9        ret     

1855 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1858 3805      jr      c,$185f
185a cd6c44    call    $446c
185d 1814      jr      $1873
185f dd21e321  ld      ix,$21e3
1863 fd21de89  ld      iy,$89de
1867 cd3884    call    $8438
186a b7        or      a
186b 2806      jr      z,$1873
186d 21b822    ld      hl,$22b8
1870 cd8088    call    $8880
1873 37        scf     
1874 c9        ret     

1875 dd216421  ld      ix,$2164
1879 fd21de89  ld      iy,$89de
187d cd3884    call    $8438
1880 b7        or      a
1881 2806      jr      z,$1889
1883 219e22    ld      hl,$229e
1886 cd8088    call    $8880
1889 37        scf     
188a c9        ret     

188b cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
188e 3805      jr      c,$1895
1890 cd6c44    call    $446c
1893 1814      jr      $18a9
1895 dd217421  ld      ix,$2174
1899 fd21de89  ld      iy,$89de
189d cd3884    call    $8438
18a0 b7        or      a
18a1 2806      jr      z,$18a9
18a3 21a222    ld      hl,$22a2
18a6 cd8088    call    $8880
18a9 37        scf     
18aa c9        ret     

18ab cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
18ae 300a      jr      nc,$18ba
18b0 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
18b3 200a      jr      nz,$18bf
18b5 cdd85f    call    $5fd8
18b8 1847      jr      $1901
18ba cd6c44    call    $446c
18bd 1842      jr      $1901
18bf 210319    ld      hl,$1903
18c2 cd7689    call    $8976
18c5 fd21268a  ld      iy,$8a26
18c9 dd21f1be  ld      ix,$bef1
18cd 0e0d      ld      c,$0d
18cf cd9488    call    $8894
18d2 b7        or      a
18d3 282c      jr      z,$1901
18d5 cd8230    call    $3082
18d8 2009      jr      nz,$18e3
18da dd21d8c2  ld      ix,$c2d8
18de cd0544    call    $4405
18e1 181e      jr      $1901
18e3 11f14a    ld      de,$4af1
18e6 014800    ld      bc,$0048
18e9 cd1519    call    $1915
18ec cdfc60    call    $60fc
18ef cdc422    call    $22c4
18f2 d4ef14    call    nc,$14ef
18f5 cddd5e    call    $5edd
18f8 cd1e41    call    $411e
18fb cdbe13    call    $13be
18fe cdd482    call    $82d4
1901 37        scf     
1902 c9        ret     

1903 73        ld      (hl),e
1904 65        ld      h,l
1905 6c        ld      l,h
1906 65        ld      h,l
1907 63        ld      h,e
1908 74        ld      (hl),h
1909 65        ld      h,l
190a 64        ld      h,h
190b 2074      jr      nz,$1981
190d 65        ld      h,l
190e 78        ld      a,b
190f 74        ld      (hl),h
1910 2074      jr      nz,$1986
1912 6f        ld      l,a
1913 2024      jr      nz,$1939
1915 78        ld      a,b
1916 b1        or      c
1917 2808      jr      z,$1921
1919 1a        ld      a,(de)
191a cda430    call    $30a4
191d 13        inc     de
191e 0b        dec     bc
191f 18f4      jr      $1915
1921 c9        ret     

1922 cda346    call    $46a3
1925 c9        ret     

1926 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1929 3805      jr      c,$1930
192b cd6c44    call    $446c
192e 1803      jr      $1933
1930 cdb364    call    $64b3
1933 c9        ret     

1934 cda148    call    $48a1
1937 cd6f43    call    $436f
193a c9        ret     

193b 21b463    ld      hl,$63b4
193e 11ff63    ld      de,$63ff
1941 ed53a38a  ld      ($8aa3),de
1945 112764    ld      de,$6427
1948 ed53a58a  ld      ($8aa5),de
194c 3e01      ld      a,$01
194e 32a78a    ld      ($8aa7),a
1951 1187c3    ld      de,$c387
1954 0600      ld      b,$00
1956 cd1886    call    $8618
1959 cd6f43    call    $436f
195c c9        ret     

195d cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1960 3805      jr      c,$1967
1962 cd6c44    call    $446c
1965 1842      jr      $19a9
1967 dd21bac6  ld      ix,$c6ba
196b cd9d43    call    $439d
196e ed5baa19  ld      de,($19aa)
1972 cd2e04    call    $042e		CDOS: set special crt function
1975 cd3e43    call    $433e
1978 cda769    call    $69a7
197b ed5bac19  ld      de,($19ac)
197f cd2a7f    call    $7f2a
1982 cda269    call    $69a2
1985 ed5bae19  ld      de,($19ae)
1989 cd2a7f    call    $7f2a
198c cd2b83    call    $832b
198f ed5bb019  ld      de,($19b0)
1993 cd217f    call    $7f21
1996 cd3683    call    $8336
1999 ed5bb219  ld      de,($19b2)
199d cd217f    call    $7f21
19a0 cd2c03    call    $032c
19a3 cd6f43    call    $436f
19a6 cd1a03    call    $031a
19a9 c9        ret     

19aa 03        inc     bc
19ab 13        inc     de
19ac 07        rlca    
19ad 0e07      ld      c,$07
19af 1d        dec     e
19b0 09        add     hl,bc
19b1 100b      djnz    $19be
19b3 18cd      jr      $1982
19b5 2b        dec     hl
19b6 1a        ld      a,(de)
19b7 cd8f42    call    $428f
19ba cdc182    call    $82c1
19bd c9        ret     

19be cd2b1a    call    $1a2b
19c1 cd9d42    call    $429d
19c4 cdd482    call    $82d4
19c7 c9        ret     

19c8 cd2b1a    call    $1a2b
19cb cdd941    call    $41d9
19ce cdd482    call    $82d4
19d1 c9        ret     

19d2 3e05      ld      a,$05
19d4 cdd47d    call    $7dd4
19d7 3810      jr      c,$19e9
19d9 cd2b1a    call    $1a2b
19dc 44        ld      b,h
19dd 4d        ld      c,l
19de 78        ld      a,b
19df b1        or      c
19e0 cca269    call    z,$69a2
19e3 cd8d41    call    $418d
19e6 cdd482    call    $82d4
19e9 c9        ret     

19ea cda269    call    $69a2
19ed 03        inc     bc
19ee cd8d41    call    $418d
19f1 cdd482    call    $82d4
19f4 c9        ret     

19f5 cda269    call    $69a2
19f8 0b        dec     bc
19f9 18f3      jr      $19ee
19fb cd393b    call    $3a6c		Reset BIT4 flag at 3c98
19fe 280e      jr      z,$1a0e
1a00 cd2b1a    call    $1a2b
1a03 cddd5e    call    $5edd
1a06 cd1e41    call    $411e
1a09 cdd482    call    $82d4
1a0c 1803      jr      $1a11
1a0e cdd85f    call    $5fd8
1a11 c9        ret     

1a12 fd213c1a  ld      iy,$1a3c
1a16 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
1a19 cd2b1a    call    $1a2b
1a1c cd1e41    call    $411e
1a1f cdd482    call    $82d4
1a22 c9        ret     

1a23 fd213c1a  ld      iy,$1a3c
1a27 cd358b    call    $8b35
1a2a c9        ret     

1a2b f5        push    af
1a2c d5        push    de
1a2d e5        push    hl
1a2e cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1a31 fd213c1a  ld      iy,$1a3c
1a35 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
1a38 e1        pop     hl
1a39 d1        pop     de
1a3a f1        pop     af
1a3b c9        ret     

1a3c 00        nop     
1a3d 00        nop     
1a3e 00        nop     
1a3f 00        nop     
1a40 3af44a    ld      a,($4af4)
1a43 32433a    ld      ($3a43),a
1a46 c9        ret     

1a47 cd9d42    call    $429d
1a4a cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1a4d cd8f42    call    $428f
1a50 3e01      ld      a,$01
1a52 c9        ret     

1a53 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1a56 cd8f42    call    $428f
1a59 3e01      ld      a,$01
1a5b c9        ret     

1a5c cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1a5f fd21901a  ld      iy,$1a90
1a63 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
1a66 cd9d42    call    $429d
1a69 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1a6c d5        push    de
1a6d e5        push    hl
1a6e cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
1a71 cd1e41    call    $411e
1a74 3e01      ld      a,$01
1a76 e1        pop     hl
1a77 d1        pop     de
1a78 c9        ret     

1a79 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
1a7c 280d      jr      z,$1a8b
1a7e cddd5e    call    $5edd
1a81 cd1e41    call    $411e
1a84 cde95e    call    $5ee9
1a87 3e01      ld      a,$01
1a89 1804      jr      $1a8f
1a8b cdd85f    call    $5fd8
1a8e 97        sub     a
1a8f c9        ret     

1a90 00        nop     
1a91 00        nop     
1a92 00        nop     
1a93 00        nop     
1a94 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1a97 3805      jr      c,$1a9e
1a99 cd6c44    call    $446c
1a9c 1822      jr      $1ac0
1a9e cd393b    call    $3a6c		Reset BIT4 flag at 3c98
1aa1 281a      jr      z,$1abd
1aa3 cddd5e    call    $5edd
1aa6 cd1e41    call    $411e
1aa9 cddd3d    call    $3ddd
1aac cde95e    call    $5ee9
1aaf cd1e41    call    $411e
1ab2 cddd3d    call    $3ddd
1ab5 cde05f    call    $5fe0
1ab8 cdd482    call    $82d4
1abb 1803      jr      $1ac0
1abd cdd85f    call    $5fd8
1ac0 c9        ret     

1ac1 cdc22f    call    $2fc2
1ac4 b7        or      a
1ac5 2803      jr      z,$1aca
1ac7 cdbe13    call    $13be
1aca c9        ret     

1acb cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1ace 3805      jr      c,$1ad5
1ad0 cd6c44    call    $446c
1ad3 1811      jr      $1ae6
1ad5 cd5091    call    $9150
1ad8 3e86      ld      a,$86
1ada cd223e    call    $3e22
1add 3007      jr      nc,$1ae6
1adf dd219ac3  ld      ix,$c39a
1ae3 cd0544    call    $4405
1ae6 c9        ret     

1ae7 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1aea 3805      jr      c,$1af1
1aec cd6c44    call    $446c
1aef 1811      jr      $1b02
1af1 cd5091    call    $9150
1af4 3e81      ld      a,$81
1af6 cd223e    call    $3e22
1af9 3007      jr      nc,$1b02
1afb dd21acc3  ld      ix,$c3ac
1aff cd0544    call    $4405
1b02 c9        ret     

1b03 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1b06 3805      jr      c,$1b0d
1b08 cd6c44    call    $446c
1b0b 1811      jr      $1b1e
1b0d cd5091    call    $9150
1b10 3e87      ld      a,$87
1b12 cd223e    call    $3e22
1b15 3007      jr      nc,$1b1e
1b17 dd21bfc3  ld      ix,$c3bf
1b1b cd0544    call    $4405
1b1e c9        ret     

1b1f cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1b22 3805      jr      c,$1b29
1b24 cd6c44    call    $446c
1b27 1811      jr      $1b3a
1b29 cd5091    call    $9150
1b2c 3e82      ld      a,$82
1b2e cd223e    call    $3e22
1b31 3007      jr      nc,$1b3a
1b33 dd21cfc3  ld      ix,$c3cf
1b37 cd0544    call    $4405
1b3a c9        ret     

1b3b cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1b3e 3805      jr      c,$1b45
1b40 cd6c44    call    $446c
1b43 1811      jr      $1b56
1b45 cd5091    call    $9150
1b48 3e83      ld      a,$83
1b4a cd223e    call    $3e22
1b4d 3007      jr      nc,$1b56
1b4f dd21e5c3  ld      ix,$c3e5
1b53 cd0544    call    $4405
1b56 c9        ret     

1b57 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1b5a 3805      jr      c,$1b61
1b5c cd6c44    call    $446c
1b5f 181b      jr      $1b7c
1b61 cda31b    call    $1ba3
1b64 3016      jr      nc,$1b7c
1b66 fd217d1b  ld      iy,$1b7d
1b6a cd358b    call    $8b35
1b6d cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1b70 cddd3d    call    $3ddd
1b73 cd8f42    call    $428f
1b76 cda93f    call    $3fa9
1b79 cdc182    call    $82c1
1b7c c9        ret     

1b7d 00        nop     
1b7e 00        nop     
1b7f 00        nop     
1b80 00        nop     
1b81 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1b84 3805      jr      c,$1b8b
1b86 cd6c44    call    $446c
1b89 1817      jr      $1ba2
1b8b cda31b    call    $1ba3
1b8e 3012      jr      nc,$1ba2
1b90 cddd3d    call    $3ddd
1b93 010100    ld      bc,$0001
1b96 cd3992    call    $9239
1b99 cda994    call    $94a9
1b9c 010100    ld      bc,$0001
1b9f cd3992    call    $9239
1ba2 c9        ret     

1ba3 dd21f9c3  ld      ix,$c3f9
1ba7 cd9d43    call    $439d
1baa cd2e44    call    $442e
1bad d46888    call    nc,$8868
1bb0 c9        ret     

1bb1 dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
1bb5 216cba    ld      hl,$ba6c
1bb8 cd0284    call    $8402
1bbb 210000    ld      hl,$0000
1bbe fe00      cp      $00
1bc0 c4a131    call    nz,$31a1
1bc3 c9        ret     

1bc4 dd21b463  ld      ix,$63b4
1bc8 2161c8    ld      hl,$c861
1bcb cd0284    call    $8402
1bce fe00      cp      $00
1bd0 c44163    call    nz,$6341
1bd3 c9        ret     

1bd4 dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
1bd8 216cba    ld      hl,$ba6c
1bdb cd0284    call    $8402
1bde b7        or      a
1bdf 2835      jr      z,$1c16
1be1 cdf62c    call    $2cf6
1be4 fe02      cp      $02
1be6 281f      jr      z,$1c07
1be8 cd6d54    call    $546d
1beb 21171c    ld      hl,$1c17
1bee cd7689    call    $8976
1bf1 dd212521  ld      ix,$2125
1bf5 fd21de89  ld      iy,$89de
1bf9 cd3884    call    $8438
1bfc b7        or      a
1bfd 2817      jr      z,$1c16
1bff 219022    ld      hl,$2290
1c02 cd8088    call    $8880
1c05 180f      jr      $1c16
1c07 dd2153c2  ld      ix,$c253
1c0b cd0544    call    $4405
1c0e cda885    call    $85a8
1c11 cd8b88    call    $888b
1c14 18be      jr      $1bd4
1c16 c9        ret     

1c17 77        ld      (hl),a
1c18 69        ld      l,c
1c19 74        ld      (hl),h
1c1a 68        ld      l,b
1c1b 2024      jr      nz,$1c41
1c1d cd4d4d    call    $4d4d
1c20 cd7454    call    $5474
1c23 c9        ret     

1c24 dd21c4c5  ld      ix,$c5c4
1c28 cd9d43    call    $439d
1c2b cd2e44    call    $442e
1c2e 2808      jr      z,$1c38
1c30 3006      jr      nc,$1c38
1c32 cd7d4d    call    $4d7d
1c35 cd7454    call    $5474
1c38 c9        ret     

1c39 00        nop     
1c3a cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
1c3d 3805      jr      c,$1c44
1c3f cd6c44    call    $446c
1c42 1823      jr      $1c67
1c44 cd3e11    call    $113e
1c47 cde010    call    $10e0
1c4a fde5      push    iy
1c4c fd21268a  ld      iy,$8a26
1c50 cd522a    call    $2a52
1c53 cd6d54    call    $546d
1c56 cd4653    call    $5346
1c59 dc6888    call    c,$8868
1c5c cd7454    call    $5474
1c5f fde1      pop     iy
1c61 cd4911    call    $1149
1c64 cd0011    call    $1100
1c67 37        scf     
1c68 c9        ret     

1c69 cd6b52    call    $526b
1c6c c9        ret     

1c6d cd454a    call    $4a45
1c70 cd5e4a    call    $4a5e
1c73 c9        ret     

1c74 cd2d4a    call    $4a2d
1c77 cd394a    call    $4a39
1c7a c9        ret     

1c7b cd2d4a    call    $4a2d
1c7e cd5e4a    call    $4a5e
1c81 c9        ret     

1c82 cd454a    call    $4a45
1c85 cd394a    call    $4a39
1c88 c9        ret     

1c89 cd774a    call    $4a77
1c8c c9        ret     

1c8d cde73b    call    $3be7
1c90 2805      jr      z,$1c97
1c92 cde71a    call    $1ae7
1c95 1805      jr      $1c9c
1c97 3e81      ld      a,$81
1c99 cd9b3c    call    $3c9b
1c9c c9        ret     

1c9d cde73b    call    $3be7
1ca0 2805      jr      z,$1ca7
1ca2 cde71a    call    $1ae7
1ca5 1805      jr      $1cac
1ca7 3e81      ld      a,$81
1ca9 cdef3c    call    $3cef
1cac c9        ret     

1cad cddf3b    call    $3bdf
1cb0 2805      jr      z,$1cb7
1cb2 cdcb1a    call    $1acb
1cb5 1805      jr      $1cbc
1cb7 3e86      ld      a,$86
1cb9 cd9b3c    call    $3c9b
1cbc c9        ret     

1cbd cddf3b    call    $3bdf
1cc0 2805      jr      z,$1cc7
1cc2 cdcb1a    call    $1acb
1cc5 1805      jr      $1ccc
1cc7 3e86      ld      a,$86
1cc9 cdef3c    call    $3cef
1ccc c9        ret     

1ccd cdf83b    call    $3bf8
1cd0 2805      jr      z,$1cd7
1cd2 cd031b    call    $1b03
1cd5 1805      jr      $1cdc
1cd7 3e87      ld      a,$87
1cd9 cdef3c    call    $3cef
1cdc c9        ret     

1cdd cdf83b    call    $3bf8
1ce0 2805      jr      z,$1ce7
1ce2 cd031b    call    $1b03
1ce5 1805      jr      $1cec
1ce7 3e87      ld      a,$87
1ce9 cd9b3c    call    $3c9b
1cec c9        ret     

1ced fd216e1d  ld      iy,$1d6e
1cf1 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
1cf4 dd21268a  ld      ix,$8a26
1cf8 cd721d    call    $1d72
1cfb cd9d43    call    $439d
1cfe cd811d    call    $1d81
1d01 dd2172c4  ld      ix,$c472
1d05 cda343    call    $43a3
1d08 cda37d    call    $7da3		discard keys typed on terminal
1d0b cdec7c    call    $7cec
1d0e cd7c8c    call    $8c7c
1d11 fe43      cp      $43
1d13 2826      jr      z,$1d3b
1d15 fe57      cp      $57
1d17 2853      jr      z,$1d6c
1d19 fe1b      cp      $1b
1d1b 2805      jr      z,$1d22
1d1d cd2202    call    $0222
1d20 18e6      jr      $1d08
1d22 fd216e1d  ld      iy,$1d6e
1d26 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
1d29 d5        push    de
1d2a e5        push    hl
1d2b cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1d2e cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
1d31 e1        pop     hl
1d32 d1        pop     de
1d33 cda93f    call    $3fa9
1d36 cd6888    call    $8868
1d39 1832      jr      $1d6d
1d3b cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
1d3e fd216e1d  ld      iy,$1d6e
1d42 cdec8a    call    $8aec
1d45 3025      jr      nc,$1d6c
1d47 cdc78e    call    $8ec7
1d4a fe01      cp      $01
1d4c 281e      jr      z,$1d6c
1d4e fe09      cp      $09
1d50 28e9      jr      z,$1d3b
1d52 fe0d      cp      $0d
1d54 28e5      jr      z,$1d3b
1d56 fe0c      cp      $0c
1d58 28e1      jr      z,$1d3b
1d5a fe20      cp      $20
1d5c 30dd      jr      nc,$1d3b
1d5e cd208f    call    $8f20
1d61 010100    ld      bc,$0001
1d64 cd3992    call    $9239
1d67 cd168b    call    $8b16
1d6a 18cf      jr      $1d3b
1d6c 97        sub     a
1d6d c9        ret     

1d6e 00        nop     
1d6f 00        nop     
1d70 00        nop     
1d71 00        nop     
1d72 3e00      ld      a,$00
1d74 dde5      push    ix
1d76 e1        pop     hl
1d77 010f00    ld      bc,$000f
1d7a edb1      cpir    
1d7c 2002      jr      nz,$1d80
1d7e 3624      ld      (hl),$24
1d80 c9        ret     

1d81 3e24      ld      a,$24
1d83 dde5      push    ix
1d85 e1        pop     hl
1d86 010f00    ld      bc,$000f
1d89 edb1      cpir    
1d8b 2002      jr      nz,$1d8f
1d8d 3600      ld      (hl),$00
1d8f c9        ret     

1d90 cd8f42    call    $428f
1d93 dd213fc5  ld      ix,$c53f
1d97 cd9d43    call    $439d
1d9a cd2e44    call    $442e
1d9d 3805      jr      c,$1da4
1d9f cd6888    call    $8868
1da2 185b      jr      $1dff
1da4 cd798f    call    $8f79
1da7 fe01      cp      $01
1da9 2842      jr      z,$1ded
1dab fe82      cp      $82
1dad 2820      jr      z,$1dcf
1daf fe83      cp      $83
1db1 281c      jr      z,$1dcf
1db3 fe87      cp      $87
1db5 2818      jr      z,$1dcf
1db7 fe86      cp      $86
1db9 2814      jr      z,$1dcf
1dbb fe81      cp      $81
1dbd 2810      jr      z,$1dcf
1dbf fe60      cp      $60
1dc1 280c      jr      z,$1dcf
1dc3 fe0a      cp      $0a
1dc5 2813      jr      z,$1dda
1dc7 fe0d      cp      $0d
1dc9 2817      jr      z,$1de2
1dcb fe0c      cp      $0c
1dcd 20d5      jr      nz,$1da4
1dcf cd1c90    call    $901c
1dd2 010100    ld      bc,$0001
1dd5 cd3992    call    $9239
1dd8 18ca      jr      $1da4
1dda cd1c90    call    $901c
1ddd 3e0d      ld      a,$0d
1ddf cdae92    call    $92ae
1de2 11001e    ld      de,$1e00
1de5 010100    ld      bc,$0001
1de8 cdca91    call    $91ca
1deb 18b7      jr      $1da4
1ded cd5194    call    $9451
1df0 cd042a    call    $2a04
1df3 cd6c3a    call    $3a6c		Reset BIT4 flag at 3c98
1df6 cdc422    call    $22c4
1df9 d4ef14    call    nc,$14ef
1dfc cdbe13    call    $13be
1dff c9        ret     

1e00 0a        ld      a,(bc)
1e01 21151e    ld      hl,$1e15
1e04 cd7689    call    $8976
1e07 cd6c61    call    $616c
1e0a c9        ret     

1e0b 21151e    ld      hl,$1e15
1e0e cd7689    call    $8976
1e11 cd7e60    call    $607e
1e14 c9        ret     

1e15 69        ld      l,c
1e16 6e        ld      l,(hl)
1e17 74        ld      (hl),h
1e18 6f        ld      l,a
1e19 2074      jr      nz,$1e8f
1e1b 65        ld      h,l
1e1c 6d        ld      l,l
1e1d 70        ld      (hl),b
1e1e 2066      jr      nz,$1e86
1e20 69        ld      l,c
1e21 6c        ld      l,h
1e22 65        ld      h,l
1e23 2024      jr      nz,$1e49
1e25 cd5091    call    $9150
1e28 cd403c    call    $3c40
1e2b 2805      jr      z,$1e32
1e2d cd1f1b    call    $1b1f
1e30 180b      jr      $1e3d
1e32 cd283c    call    $3c28
1e35 c43b1b    call    nz,$1b3b
1e38 3e82      ld      a,$82
1e3a cd4e3d    call    $3d4e
1e3d c9        ret     

1e3e cd5091    call    $9150
1e41 cd403c    call    $3c40
1e44 2805      jr      z,$1e4b
1e46 cd1f1b    call    $1b1f
1e49 180b      jr      $1e56
1e4b cd283c    call    $3c28
1e4e c43b1b    call    nz,$1b3b
1e51 3e82      ld      a,$82
1e53 cdef3c    call    $3cef
1e56 c9        ret     

1e57 cd5091    call    $9150
1e5a cd283c    call    $3c28
1e5d 2805      jr      z,$1e64
1e5f cd3b1b    call    $1b3b
1e62 180b      jr      $1e6f
1e64 cd403c    call    $3c40
1e67 c41f1b    call    nz,$1b1f
1e6a 3e83      ld      a,$83
1e6c cd4e3d    call    $3d4e
1e6f c9        ret     

1e70 cd5091    call    $9150
1e73 cd283c    call    $3c28
1e76 2805      jr      z,$1e7d
1e78 cd3b1b    call    $1b3b
1e7b 180b      jr      $1e88
1e7d cd403c    call    $3c40
1e80 c41f1b    call    nz,$1b1f
1e83 3e83      ld      a,$83
1e85 cdef3c    call    $3cef
1e88 c9        ret     

1e89 97        sub     a
1e8a 327746    ld      ($4677),a
1e8d dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
1e91 216cba    ld      hl,$ba6c
1e94 cd0284    call    $8402
1e97 b7        or      a
1e98 2835      jr      z,$1ecf
1e9a cdf72d    call    $2df7
1e9d fe02      cp      $02
1e9f 281c      jr      z,$1ebd
1ea1 3a7746    ld      a,($4677)
1ea4 b7        or      a
1ea5 280a      jr      z,$1eb1
1ea7 cd3150    call    $5031
1eaa 3820      jr      c,$1ecc
1eac cd5150    call    $5051
1eaf 381b      jr      c,$1ecc
1eb1 dd2165c6  ld      ix,$c665
1eb5 cd9d43    call    $439d
1eb8 cd9b44    call    $449b
1ebb 1812      jr      $1ecf
1ebd dd2153c2  ld      ix,$c253
1ec1 cd0544    call    $4405
1ec4 cda885    call    $85a8
1ec7 cd8b88    call    $888b
1eca 18c1      jr      $1e8d
1ecc cd6888    call    $8868
1ecf c9        ret     

1ed0 3e01      ld      a,$01
1ed2 327746    ld      ($4677),a
1ed5 cd8d1e    call    $1e8d
1ed8 c9        ret     

1ed9 41        ld      b,c
1eda 42        ld      b,d
1edb 4f        ld      c,a
1edc 52        ld      d,d
1edd 54        ld      d,h
1ede ff        rst     $38
1edf 41        ld      b,c
1ee0 4c        ld      c,h
1ee1 49        ld      c,c
1ee2 47        ld      b,a
1ee3 4e        ld      c,(hl)
1ee4 ff        rst     $38
1ee5 42        ld      b,d
1ee6 4f        ld      c,a
1ee7 4c        ld      c,h
1ee8 44        ld      b,h
1ee9 46        ld      b,(hl)
1eea 41        ld      b,c
1eeb 43        ld      b,e
1eec 45        ld      b,l
1eed ff        rst     $38
1eee 43        ld      b,e
1eef 4f        ld      c,a
1ef0 4e        ld      c,(hl)
1ef1 56        ld      d,(hl)
1ef2 45        ld      b,l
1ef3 52        ld      d,d
1ef4 54        ld      d,h
1ef5 2d        dec     l
1ef6 54        ld      d,h
1ef7 4f        ld      c,a
1ef8 2d        dec     l
1ef9 53        ld      d,e
1efa 43        ld      b,e
1efb 52        ld      d,d
1efc 45        ld      b,l
1efd 45        ld      b,l
1efe 4e        ld      c,(hl)
1eff ff        rst     $38
1f00 43        ld      b,e
1f01 52        ld      d,d
1f02 45        ld      b,l
1f03 41        ld      b,c
1f04 54        ld      d,h
1f05 45        ld      b,l
1f06 ff        rst     $38
1f07 44        ld      b,h
1f08 45        ld      b,l
1f09 4c        ld      c,h
1f0a 45        ld      b,l
1f0b 54        ld      d,h
1f0c 45        ld      b,l
1f0d ff        rst     $38
1f0e 44        ld      b,h
1f0f 45        ld      b,l
1f10 53        ld      d,e
1f11 45        ld      b,l
1f12 4c        ld      c,h
1f13 45        ld      b,l
1f14 43        ld      b,e
1f15 54        ld      d,h
1f16 ff        rst     $38
1f17 44        ld      b,h
1f18 49        ld      c,c
1f19 52        ld      d,d
1f1a 45        ld      b,l
1f1b 43        ld      b,e
1f1c 54        ld      d,h
1f1d 4f        ld      c,a
1f1e 52        ld      d,d
1f1f 59        ld      e,c
1f20 ff        rst     $38
1f21 44        ld      b,h
1f22 49        ld      c,c
1f23 53        ld      d,e
1f24 4b        ld      c,e
1f25 ff        rst     $38
1f26 44        ld      b,h
1f27 55        ld      d,l
1f28 4d        ld      c,l
1f29 50        ld      d,b
1f2a ff        rst     $38
1f2b 45        ld      b,l
1f2c 44        ld      b,h
1f2d 49        ld      c,c
1f2e 54        ld      d,h
1f2f ff        rst     $38
1f30 45        ld      b,l
1f31 58        ld      e,b
1f32 49        ld      c,c
1f33 54        ld      d,h
1f34 ff        rst     $38
1f35 46        ld      b,(hl)
1f36 49        ld      c,c
1f37 4e        ld      c,(hl)
1f38 44        ld      b,h
1f39 ff        rst     $38
1f3a 47        ld      b,a
1f3b 4f        ld      c,a
1f3c ff        rst     $38
1f3d 48        ld      c,b
1f3e 45        ld      b,l
1f3f 4c        ld      c,h
1f40 50        ld      d,b
1f41 ff        rst     $38
1f42 49        ld      c,c
1f43 4e        ld      c,(hl)
1f44 44        ld      b,h
1f45 45        ld      b,l
1f46 58        ld      e,b
1f47 ff        rst     $38
1f48 4a        ld      c,d
1f49 55        ld      d,l
1f4a 4d        ld      c,l
1f4b 50        ld      d,b
1f4c ff        rst     $38
1f4d 4c        ld      c,h
1f4e 49        ld      c,c
1f4f 53        ld      d,e
1f50 54        ld      d,h
1f51 ff        rst     $38
1f52 4c        ld      c,h
1f53 4f        ld      c,a
1f54 41        ld      b,c
1f55 44        ld      b,h
1f56 ff        rst     $38
1f57 4c        ld      c,h
1f58 4f        ld      c,a
1f59 43        ld      b,e
1f5a 4b        ld      c,e
1f5b ff        rst     $38
1f5c 4d        ld      c,l
1f5d 41        ld      b,c
1f5e 52        ld      d,d
1f5f 4b        ld      c,e
1f60 2d        dec     l
1f61 46        ld      b,(hl)
1f62 4f        ld      c,a
1f63 52        ld      d,d
1f64 2d        dec     l
1f65 49        ld      c,c
1f66 4e        ld      c,(hl)
1f67 44        ld      b,h
1f68 45        ld      b,l
1f69 58        ld      e,b
1f6a ff        rst     $38
1f6b 4d        ld      c,l
1f6c 45        ld      b,l
1f6d 52        ld      d,d
1f6e 47        ld      b,a
1f6f 45        ld      b,l
1f70 ff        rst     $38
1f71 50        ld      d,b
1f72 52        ld      d,d
1f73 49        ld      c,c
1f74 4e        ld      c,(hl)
1f75 54        ld      d,h
1f76 ff        rst     $38
1f77 51        ld      d,c
1f78 55        ld      d,l
1f79 49        ld      c,c
1f7a 54        ld      d,h
1f7b ff        rst     $38
1f7c 52        ld      d,d
1f7d 45        ld      b,l
1f7e 41        ld      b,c
1f7f 44        ld      b,h
1f80 ff        rst     $38
1f81 52        ld      d,d
1f82 45        ld      b,l
1f83 4e        ld      c,(hl)
1f84 41        ld      b,c
1f85 4d        ld      c,l
1f86 45        ld      b,l
1f87 ff        rst     $38
1f88 52        ld      d,d
1f89 45        ld      b,l
1f8a 50        ld      d,b
1f8b 4c        ld      c,h
1f8c 41        ld      b,c
1f8d 43        ld      b,e
1f8e 45        ld      b,l
1f8f ff        rst     $38
1f90 53        ld      d,e
1f91 41        ld      b,c
1f92 56        ld      d,(hl)
1f93 45        ld      b,l
1f94 ff        rst     $38
1f95 53        ld      d,e
1f96 43        ld      b,e
1f97 41        ld      b,c
1f98 4e        ld      c,(hl)
1f99 ff        rst     $38
1f9a 53        ld      d,e
1f9b 45        ld      b,l
1f9c 54        ld      d,h
1f9d ff        rst     $38
1f9e 53        ld      d,e
1f9f 48        ld      c,b
1fa0 49        ld      c,c
1fa1 46        ld      b,(hl)
1fa2 54        ld      d,h
1fa3 2d        dec     l
1fa4 4d        ld      c,l
1fa5 41        ld      b,c
1fa6 52        ld      d,d
1fa7 47        ld      b,a
1fa8 49        ld      c,c
1fa9 4e        ld      c,(hl)
1faa 53        ld      d,e
1fab ff        rst     $38
1fac 53        ld      d,e
1fad 48        ld      c,b
1fae 4f        ld      c,a
1faf 57        ld      d,a
1fb0 ff        rst     $38
1fb1 53        ld      d,e
1fb2 55        ld      d,l
1fb3 42        ld      b,d
1fb4 53        ld      d,e
1fb5 43        ld      b,e
1fb6 52        ld      d,d
1fb7 49        ld      c,c
1fb8 50        ld      d,b
1fb9 54        ld      d,h
1fba ff        rst     $38
1fbb 53        ld      d,e
1fbc 55        ld      d,l
1fbd 50        ld      d,b
1fbe 45        ld      b,l
1fbf 52        ld      d,d
1fc0 53        ld      d,e
1fc1 43        ld      b,e
1fc2 52        ld      d,d
1fc3 49        ld      c,c
1fc4 50        ld      d,b
1fc5 54        ld      d,h
1fc6 ff        rst     $38
1fc7 54        ld      d,h
1fc8 59        ld      e,c
1fc9 50        ld      d,b
1fca 45        ld      b,l
1fcb ff        rst     $38
1fcc 55        ld      d,l
1fcd 4e        ld      c,(hl)
1fce 44        ld      b,h
1fcf 45        ld      b,l
1fd0 52        ld      d,d
1fd1 4c        ld      c,h
1fd2 49        ld      c,c
1fd3 4e        ld      c,(hl)
1fd4 45        ld      b,l
1fd5 ff        rst     $38
1fd6 55        ld      d,l
1fd7 4e        ld      c,(hl)
1fd8 4c        ld      c,h
1fd9 4f        ld      c,a
1fda 43        ld      b,e
1fdb 4b        ld      c,e
1fdc ff        rst     $38
1fdd 57        ld      d,a
1fde 52        ld      d,d
1fdf 49        ld      c,c
1fe0 54        ld      d,h
1fe1 45        ld      b,l
1fe2 ff        rst     $38
1fe3 00        nop     
1fe4 46        ld      b,(hl)
1fe5 4f        ld      c,a
1fe6 52        ld      d,d
1fe7 4d        ld      c,l
1fe8 41        ld      b,c
1fe9 54        ld      d,h
1fea ff        rst     $38
1feb 54        ld      d,h
1fec 41        ld      b,c
1fed 42        ld      b,d
1fee 53        ld      d,e
1fef ff        rst     $38
1ff0 00        nop     
1ff1 42        ld      b,d
1ff2 41        ld      b,c
1ff3 43        ld      b,e
1ff4 4b        ld      c,e
1ff5 57        ld      d,a
1ff6 41        ld      b,c
1ff7 52        ld      d,d
1ff8 44        ld      b,h
1ff9 ff        rst     $38
1ffa 46        ld      b,(hl)
1ffb 4f        ld      c,a
1ffc 52        ld      d,d
1ffd 57        ld      d,a
1ffe 41        ld      b,c
1fff 52        ld      d,d
2000 44        ld      b,h
2001 ff        rst     $38
2002 00        nop     
2003 46        ld      b,(hl)
2004 49        ld      c,c
2005 4c        ld      c,h
2006 45        ld      b,l
2007 53        ld      d,e
2008 ff        rst     $38
2009 46        ld      b,(hl)
200a 4f        ld      c,a
200b 52        ld      d,d
200c 4d        ld      c,l
200d 41        ld      b,c
200e 54        ld      d,h
200f ff        rst     $38
2010 4c        ld      c,h
2011 4f        ld      c,a
2012 43        ld      b,e
2013 41        ld      b,c
2014 54        ld      d,h
2015 49        ld      c,c
2016 4f        ld      c,a
2017 4e        ld      c,(hl)
2018 ff        rst     $38
2019 54        ld      d,h
201a 45        ld      b,l
201b 4d        ld      c,l
201c 50        ld      d,b
201d 2d        dec     l
201e 46        ld      b,(hl)
201f 49        ld      c,c
2020 4c        ld      c,h
2021 45        ld      b,l
2022 53        ld      d,e
2023 ff        rst     $38
2024 00        nop     
2025 42        ld      b,d
2026 45        ld      b,l
2027 47        ld      b,a
2028 49        ld      c,c
2029 4e        ld      c,(hl)
202a 4e        ld      c,(hl)
202b 49        ld      c,c
202c 4e        ld      c,(hl)
202d 47        ld      b,a
202e ff        rst     $38
202f 45        ld      b,l
2030 4e        ld      c,(hl)
2031 44        ld      b,h
2032 ff        rst     $38
2033 49        ld      c,c
2034 4e        ld      c,(hl)
2035 44        ld      b,h
2036 45        ld      b,l
2037 58        ld      e,b
2038 2d        dec     l
2039 45        ld      b,l
203a 4e        ld      c,(hl)
203b 54        ld      d,h
203c 52        ld      d,d
203d 59        ld      e,c
203e ff        rst     $38
203f 4c        ld      c,h
2040 41        ld      b,c
2041 53        ld      d,e
2042 54        ld      d,h
2043 2d        dec     l
2044 4c        ld      c,h
2045 4f        ld      c,a
2046 43        ld      b,e
2047 41        ld      b,c
2048 54        ld      d,h
2049 49        ld      c,c
204a 4f        ld      c,a
204b 4e        ld      c,(hl)
204c ff        rst     $38
204d 4e        ld      c,(hl)
204e 45        ld      b,l
204f 58        ld      e,b
2050 54        ld      d,h
2051 2d        dec     l
2052 50        ld      d,b
2053 41        ld      b,c
2054 47        ld      b,a
2055 45        ld      b,l
2056 ff        rst     $38
2057 50        ld      d,b
2058 41        ld      b,c
2059 47        ld      b,a
205a 45        ld      b,l
205b ff        rst     $38
205c 50        ld      d,b
205d 52        ld      d,d
205e 45        ld      b,l
205f 56        ld      d,(hl)
2060 49        ld      c,c
2061 4f        ld      c,a
2062 55        ld      d,l
2063 53        ld      d,e
2064 2d        dec     l
2065 50        ld      d,b
2066 41        ld      b,c
2067 47        ld      b,a
2068 45        ld      b,l
2069 ff        rst     $38
206a 53        ld      d,e
206b 45        ld      b,l
206c 4c        ld      c,h
206d 45        ld      b,l
206e 43        ld      b,e
206f 54        ld      d,h
2070 45        ld      b,l
2071 44        ld      b,h
2072 2d        dec     l
2073 54        ld      d,h
2074 45        ld      b,l
2075 58        ld      e,b
2076 54        ld      d,h
2077 ff        rst     $38
2078 00        nop     
2079 41        ld      b,c
207a 4c        ld      c,h
207b 4c        ld      c,h
207c ff        rst     $38
207d 42        ld      b,d
207e 45        ld      b,l
207f 47        ld      b,a
2080 49        ld      c,c
2081 4e        ld      c,(hl)
2082 2d        dec     l
2083 43        ld      b,e
2084 55        ld      d,l
2085 52        ld      d,d
2086 53        ld      d,e
2087 4f        ld      c,a
2088 52        ld      d,d
2089 ff        rst     $38
208a 43        ld      b,e
208b 55        ld      d,l
208c 52        ld      d,d
208d 53        ld      d,e
208e 4f        ld      c,a
208f 52        ld      d,d
2090 2d        dec     l
2091 45        ld      b,l
2092 4e        ld      c,(hl)
2093 44        ld      b,h
2094 ff        rst     $38
2095 53        ld      d,e
2096 45        ld      b,l
2097 4c        ld      c,h
2098 45        ld      b,l
2099 43        ld      b,e
209a 54        ld      d,h
209b 45        ld      b,l
209c 44        ld      b,h
209d 2d        dec     l
209e 54        ld      d,h
209f 45        ld      b,l
20a0 58        ld      e,b
20a1 54        ld      d,h
20a2 ff        rst     $38
20a3 00        nop     
20a4 42        ld      b,d
20a5 45        ld      b,l
20a6 47        ld      b,a
20a7 49        ld      c,c
20a8 4e        ld      c,(hl)
20a9 2d        dec     l
20aa 43        ld      b,e
20ab 55        ld      d,l
20ac 52        ld      d,d
20ad 53        ld      d,e
20ae 4f        ld      c,a
20af 52        ld      d,d
20b0 ff        rst     $38
20b1 42        ld      b,d
20b2 4f        ld      c,a
20b3 4c        ld      c,h
20b4 44        ld      b,h
20b5 46        ld      b,(hl)
20b6 41        ld      b,c
20b7 43        ld      b,e
20b8 49        ld      c,c
20b9 4e        ld      c,(hl)
20ba 47        ld      b,a
20bb ff        rst     $38
20bc 43        ld      b,e
20bd 55        ld      d,l
20be 52        ld      d,d
20bf 53        ld      d,e
20c0 4f        ld      c,a
20c1 52        ld      d,d
20c2 2d        dec     l
20c3 45        ld      b,l
20c4 4e        ld      c,(hl)
20c5 44        ld      b,h
20c6 ff        rst     $38
20c7 46        ld      b,(hl)
20c8 49        ld      c,c
20c9 4c        ld      c,h
20ca 45        ld      b,l
20cb ff        rst     $38
20cc 49        ld      c,c
20cd 4e        ld      c,(hl)
20ce 44        ld      b,h
20cf 45        ld      b,l
20d0 58        ld      e,b
20d1 49        ld      c,c
20d2 4e        ld      c,(hl)
20d3 47        ld      b,a
20d4 ff        rst     $38
20d5 53        ld      d,e
20d6 45        ld      b,l
20d7 4c        ld      c,h
20d8 45        ld      b,l
20d9 43        ld      b,e
20da 54        ld      d,h
20db 45        ld      b,l
20dc 44        ld      b,h
20dd 2d        dec     l
20de 54        ld      d,h
20df 45        ld      b,l
20e0 58        ld      e,b
20e1 54        ld      d,h
20e2 ff        rst     $38
20e3 53        ld      d,e
20e4 55        ld      d,l
20e5 42        ld      b,d
20e6 53        ld      d,e
20e7 43        ld      b,e
20e8 52        ld      d,d
20e9 49        ld      c,c
20ea 50        ld      d,b
20eb 54        ld      d,h
20ec 49        ld      c,c
20ed 4e        ld      c,(hl)
20ee 47        ld      b,a
20ef ff        rst     $38
20f0 53        ld      d,e
20f1 55        ld      d,l
20f2 50        ld      d,b
20f3 45        ld      b,l
20f4 52        ld      d,d
20f5 53        ld      d,e
20f6 43        ld      b,e
20f7 52        ld      d,d
20f8 49        ld      c,c
20f9 50        ld      d,b
20fa 54        ld      d,h
20fb 49        ld      c,c
20fc 4e        ld      c,(hl)
20fd 47        ld      b,a
20fe ff        rst     $38
20ff 55        ld      d,l
2100 4e        ld      c,(hl)
2101 44        ld      b,h
2102 45        ld      b,l
2103 52        ld      d,d
2104 4c        ld      c,h
2105 49        ld      c,c
2106 4e        ld      c,(hl)
2107 49        ld      c,c
2108 4e        ld      c,(hl)
2109 47        ld      b,a
210a ff        rst     $38
210b 00        nop     
210c 46        ld      b,(hl)
210d 49        ld      c,c
210e 4c        ld      c,h
210f 45        ld      b,l
2110 ff        rst     $38
2111 53        ld      d,e
2112 43        ld      b,e
2113 52        ld      d,d
2114 45        ld      b,l
2115 45        ld      b,l
2116 4e        ld      c,(hl)
2117 ff        rst     $38
2118 54        ld      d,h
2119 4f        ld      c,a
211a 50        ld      d,b
211b 2d        dec     l
211c 4f        ld      c,a
211d 46        ld      b,(hl)
211e 2d        dec     l
211f 46        ld      b,(hl)
2120 4f        ld      c,a
2121 52        ld      d,d
2122 4d        ld      c,l
2123 ff        rst     $38
2124 00        nop     
2125 49        ld      c,c
2126 4e        ld      c,(hl)
2127 43        ld      b,e
2128 52        ld      d,d
2129 45        ld      b,l
212a 4d        ld      c,l
212b 45        ld      b,l
212c 4e        ld      c,(hl)
212d 54        ld      d,h
212e 41        ld      b,c
212f 4c        ld      c,h
2130 2d        dec     l
2131 53        ld      d,e
2132 50        ld      d,b
2133 41        ld      b,c
2134 43        ld      b,e
2135 49        ld      c,c
2136 4e        ld      c,(hl)
2137 47        ld      b,a
2138 ff        rst     $38
2139 52        ld      d,d
213a 45        ld      b,l
213b 47        ld      b,a
213c 55        ld      d,l
213d 4c        ld      c,h
213e 41        ld      b,c
213f 52        ld      d,d
2140 2d        dec     l
2141 53        ld      d,e
2142 50        ld      d,b
2143 41        ld      b,c
2144 43        ld      b,e
2145 49        ld      c,c
2146 4e        ld      c,(hl)
2147 47        ld      b,a
2148 ff        rst     $38
2149 00        nop     
214a 49        ld      c,c
214b 4e        ld      c,(hl)
214c ff        rst     $38
214d 4c        ld      c,h
214e 45        ld      b,l
214f 46        ld      b,(hl)
2150 54        ld      d,h
2151 ff        rst     $38
2152 4e        ld      c,(hl)
2153 4f        ld      c,a
2154 52        ld      d,d
2155 4d        ld      c,l
2156 41        ld      b,c
2157 4c        ld      c,h
2158 ff        rst     $38
2159 4f        ld      c,a
215a 55        ld      d,l
215b 54        ld      d,h
215c ff        rst     $38
215d 52        ld      d,d
215e 49        ld      c,c
215f 47        ld      b,a
2160 48        ld      c,b
2161 54        ld      d,h
2162 ff        rst     $38
2163 00        nop     
2164 46        ld      b,(hl)
2165 49        ld      c,c
2166 4c        ld      c,h
2167 45        ld      b,l
2168 ff        rst     $38
2169 54        ld      d,h
216a 45        ld      b,l
216b 4d        ld      c,l
216c 50        ld      d,b
216d 2d        dec     l
216e 46        ld      b,(hl)
216f 49        ld      c,c
2170 4c        ld      c,h
2171 45        ld      b,l
2172 ff        rst     $38
2173 00        nop     
2174 53        ld      d,e
2175 45        ld      b,l
2176 4c        ld      c,h
2177 45        ld      b,l
2178 43        ld      b,e
2179 54        ld      d,h
217a 45        ld      b,l
217b 44        ld      b,h
217c 2d        dec     l
217d 54        ld      d,h
217e 45        ld      b,l
217f 58        ld      e,b
2180 54        ld      d,h
2181 ff        rst     $38
2182 57        ld      d,a
2183 4f        ld      c,a
2184 52        ld      d,d
2185 44        ld      b,h
2186 ff        rst     $38
2187 00        nop     
2188 41        ld      b,c
2189 4c        ld      c,h
218a 4c        ld      c,h
218b ff        rst     $38
218c 42        ld      b,d
218d 45        ld      b,l
218e 47        ld      b,a
218f 49        ld      c,c
2190 4e        ld      c,(hl)
2191 2d        dec     l
2192 43        ld      b,e
2193 55        ld      d,l
2194 52        ld      d,d
2195 53        ld      d,e
2196 4f        ld      c,a
2197 52        ld      d,d
2198 ff        rst     $38
2199 43        ld      b,e
219a 55        ld      d,l
219b 52        ld      d,d
219c 53        ld      d,e
219d 4f        ld      c,a
219e 52        ld      d,d
219f 2d        dec     l
21a0 45        ld      b,l
21a1 4e        ld      c,(hl)
21a2 44        ld      b,h
21a3 ff        rst     $38
21a4 4c        ld      c,h
21a5 49        ld      c,c
21a6 4e        ld      c,(hl)
21a7 45        ld      b,l
21a8 53        ld      d,e
21a9 2d        dec     l
21aa 57        ld      d,a
21ab 49        ld      c,c
21ac 54        ld      d,h
21ad 48        ld      c,b
21ae 2d        dec     l
21af 43        ld      b,e
21b0 55        ld      d,l
21b1 52        ld      d,d
21b2 52        ld      d,d
21b3 45        ld      b,l
21b4 4e        ld      c,(hl)
21b5 54        ld      d,h
21b6 2d        dec     l
21b7 4d        ld      c,l
21b8 41        ld      b,c
21b9 52        ld      d,d
21ba 47        ld      b,a
21bb 49        ld      c,c
21bc 4e        ld      c,(hl)
21bd ff        rst     $38
21be 53        ld      d,e
21bf 45        ld      b,l
21c0 4c        ld      c,h
21c1 45        ld      b,l
21c2 43        ld      b,e
21c3 54        ld      d,h
21c4 45        ld      b,l
21c5 44        ld      b,h
21c6 2d        dec     l
21c7 54        ld      d,h
21c8 45        ld      b,l
21c9 58        ld      e,b
21ca 54        ld      d,h
21cb ff        rst     $38
21cc 00        nop     
21cd 43        ld      b,e
21ce 4f        ld      c,a
21cf 4c        ld      c,h
21d0 55        ld      d,l
21d1 4d        ld      c,l
21d2 4e        ld      c,(hl)
21d3 ff        rst     $38
21d4 53        ld      d,e
21d5 45        ld      b,l
21d6 4c        ld      c,h
21d7 45        ld      b,l
21d8 43        ld      b,e
21d9 54        ld      d,h
21da 45        ld      b,l
21db 44        ld      b,h
21dc 2d        dec     l
21dd 54        ld      d,h
21de 45        ld      b,l
21df 58        ld      e,b
21e0 54        ld      d,h
21e1 ff        rst     $38
21e2 00        nop     
21e3 43        ld      b,e
21e4 48        ld      c,b
21e5 41        ld      b,c
21e6 52        ld      d,d
21e7 41        ld      b,c
21e8 43        ld      b,e
21e9 54        ld      d,h
21ea 45        ld      b,l
21eb 52        ld      d,d
21ec ff        rst     $38
21ed 57        ld      d,a
21ee 4f        ld      c,a
21ef 52        ld      d,d
21f0 44        ld      b,h
21f1 ff        rst     $38
21f2 00        nop     
21f3 50        ld      d,b
21f4 52        ld      d,d
21f5 49        ld      c,c
21f6 4e        ld      c,(hl)
21f7 54        ld      d,h
21f8 ff        rst     $38
21f9 53        ld      d,e
21fa 54        ld      d,h
21fb 4f        ld      c,a
21fc 52        ld      d,d
21fd 45        ld      b,l
21fe ff        rst     $38
21ff 00        nop     
2200 97        sub     a
2201 12        ld      (de),a
2202 c1        pop     bc
2203 12        ld      (de),a
2204 f41214    call    p,$1412
2207 13        inc     de
2208 23        inc     hl
2209 13        inc     de
220a 8f        adc     a,a
220b 13        inc     de
220c a5        and     l
220d 13        inc     de
220e be        cp      (hl)
220f 13        inc     de
2210 f41310    call    p,$1013
2213 14        inc     d
2214 4e        ld      c,(hl)
2215 14        inc     d
2216 be        cp      (hl)
2217 14        inc     d
2218 5b        ld      e,e
2219 15        dec     d
221a 9d        sbc     a,l
221b 15        dec     d
221c c7        rst     $00
221d 15        dec     d
221e d5        push    de
221f 15        dec     d
2220 9d        sbc     a,l
2221 15        dec     d
2222 be        cp      (hl)
2223 13        inc     de
2224 fb        ei      
2225 15        dec     d
2226 25        dec     h
2227 166f      ld      d,$6f
2229 13        inc     de
222a b9        cp      c
222b 16e4      ld      d,$e4
222d 16be      ld      d,$be
222f 14        inc     d
2230 fa1633    jp      m,$3316
2233 17        rla     
2234 3d        dec     a
2235 17        rla     
2236 4c        ld      c,h
2237 17        rla     
2238 d0        ret     nc

2239 17        rla     
223a f3        di      
223b 17        rla     
223c 09        add     hl,bc
223d 181f      jr      $225e
223f 1855      jr      $2296
2241 1835      jr      $2278
2243 1875      jr      $22ba
2245 188b      jr      $21d2
2247 186f      jr      $22b8
2249 16ab      ld      d,$ab
224b 1822      jr      $226f
224d 19        add     hl,de
224e 2619      ld      h,$19
2250 6f        ld      l,a
2251 72        ld      (hl),d
2252 61        ld      h,c
2253 72        ld      (hl),d
2254 be        cp      (hl)
2255 13        inc     de
2256 34        inc     (hl)
2257 19        add     hl,de
2258 5d        ld      e,l
2259 19        add     hl,de
225a 3b        dec     sp
225b 19        add     hl,de
225c b4        or      h
225d 19        add     hl,de
225e be        cp      (hl)
225f 19        add     hl,de
2260 c8        ret     z

2261 19        add     hl,de
2262 12        ld      (de),a
2263 1a        ld      a,(de)
2264 ea19d2    jp      pe,$d219
2267 19        add     hl,de
2268 f5        push    af
2269 19        add     hl,de
226a fb        ei      
226b 19        add     hl,de
226c 47        ld      b,a
226d 1a        ld      a,(de)
226e 53        ld      d,e
226f 1a        ld      a,(de)
2270 5c        ld      e,h
2271 1a        ld      a,(de)
2272 79        ld      a,c
2273 1a        ld      a,(de)
2274 57        ld      d,a
2275 1b        dec     de
2276 cb1a      rr      d
2278 81        add     a,c
2279 1b        dec     de
227a c1        pop     bc
227b 1a        ld      a,(de)
227c 03        inc     bc
227d 1b        dec     de
227e 94        sub     h
227f 1a        ld      a,(de)
2280 3b        dec     sp
2281 1b        dec     de
2282 1f        rra     
2283 1b        dec     de
2284 e7        rst     $20
2285 1a        ld      a,(de)
2286 dd1c      inc     e
2288 cd1cd4    call    $d41c
228b 1b        dec     de
228c 3a1c69    ld      a,($691c)
228f 1c        inc     e
2290 24        inc     h
2291 1c        inc     e
2292 1d        dec     e
2293 1c        inc     e
2294 6d        ld      l,l
2295 1c        inc     e
2296 7b        ld      a,e
2297 1c        inc     e
2298 89        adc     a,c
2299 1c        inc     e
229a 74        ld      (hl),h
229b 1c        inc     e
229c 82        add     a,d
229d 1c        inc     e
229e b1        or      c
229f 1b        dec     de
22a0 c41b8d    call    nz,$8d1b
22a3 1c        inc     e
22a4 9d        sbc     a,l
22a5 1c        inc     e
22a6 ad        xor     l
22a7 1c        inc     e
22a8 bd        cp      l
22a9 1c        inc     e
22aa 47        ld      b,a
22ab 1a        ld      a,(de)
22ac 53        ld      d,e
22ad 1a        ld      a,(de)
22ae 5c        ld      e,h
22af 1a        ld      a,(de)
22b0 40        ld      b,b
22b1 1a        ld      a,(de)
22b2 79        ld      a,c
22b3 1a        ld      a,(de)
22b4 011e0b    ld      bc,$0b1e
22b7 1e57      ld      e,$57
22b9 1e70      ld      e,$70
22bb 1e25      ld      e,$25
22bd 1e3e      ld      e,$3e
22bf 1ed0      ld      e,$d0
22c1 1e89      ld      e,$89
22c3 1e

					scan directory with SEARCH
22c4 c5        push    bc
22c5 d5        push    de
22c6 e5        push    hl
22c7 97        sub     a		clear a
22c8 322f24    ld      ($242f),a
22cb cda92e    call    $2ea9		Set DMA address to default $0080
22ce 2a0600    ld      hl,($0006)	HL=top of men
22d1 11c894    ld      de,$94c8		94c8=end of WordMaster program
22d4 b7        or      a		clear carry
22d5 ed52      sbc     hl,de		calc in HL available mem
22d7 cb3c      srl     h		div by 2
22d9 cb1d      rr      l
22db 19        add     hl,de
22dc 220d26    ld      ($260d),hl	[260d]=free mem zone 2
22df cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
22e2 301a      jr      nc,$22fe		
22e4 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
22e7 2808      jr      z,$22f1
22e9 cd493b    call    $3b49
22ec 3e01      ld      a,$01
22ee 322f24    ld      ($242f),a
22f1 fd210f26  ld      iy,$260f
22f5 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
22f8 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
22fb cdac42    call    $42ac
22fe 21c894    ld      hl,$94c8		94c8=end of WordMaster program
2301 36ff      ld      (hl),$ff
2303 23        inc     hl
2304 3600      ld      (hl),$00
2306 23        inc     hl
2307 36ff      ld      (hl),$ff
2309 23        inc     hl
230a 221326    ld      ($2613),hl
230d e5        push    hl
230e 111526    ld      de,$2615		fcb for "?????????"
2311 0e11      ld      c,$11		SEARCH 1ST 
2313 cd0500    call    $0005		call BDOS 
2316 c1        pop     bc
2317 feff      cp      $ff		not found?
2319 ca9a23    jp      z,$239a		jump if not found (no more files)
231c 7e        ld      a,(hl)		get first char of dir entry
231d fee5      cp      $e5		deleted file?
231f 286c      jr      z,$238d		yes, jump to skip this file processing
2321 112226    ld      de,$2622
2324 cd5c24    call    $245c
2327 3064      jr      nc,$238d
2329 54        ld      d,h
232a 5d        ld      e,l
232b cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
232e 3020      jr      nc,$2350
2330 60        ld      h,b
2331 69        ld      l,c
2332 3e0f      ld      a,$0f
2334 cd5d8c    call    $8c5d
2337 dd21c494  ld      ix,$94c4
233b 7c        ld      a,h
233c ddbe01    cp      (ix+$01)
233f 2004      jr      nz,$2345
2341 7d        ld      a,l
2342 ddbe00    cp      (ix+$00)
2345 3809      jr      c,$2350
2347 cd3024    call    $2430
234a 3004      jr      nc,$2350
234c b7        or      a
234d c31324    jp      $2413
2350 c5        push    bc
2351 fde1      pop     iy
2353 cd0a43    call    $430a
2356 fd23      inc     iy
2358 fd7e00    ld      a,(iy+$00)
235b fe20      cp      $20
235d 30f7      jr      nc,$2356
235f fd2b      dec     iy
2361 fd7e00    ld      a,(iy+$00)
2364 fe2e      cp      $2e
2366 2802      jr      z,$236a
2368 fd23      inc     iy
236a fde5      push    iy
236c e1        pop     hl
236d 36ff      ld      (hl),$ff
236f 23        inc     hl
2370 44        ld      b,h
2371 4d        ld      c,l
2372 dd210d26  ld      ix,$260d		[260d]=free mem zone 2
2376 78        ld      a,b
2377 ddbe01    cp      (ix+$01)
237a 2004      jr      nz,$2380
237c 79        ld      a,c
237d ddbe00    cp      (ix+$00)
2380 380b      jr      c,$238d
2382 dd217cc0  ld      ix,$c07c
2386 cd0544    call    $4405
2389 b7        or      a
238a c31324    jp      $2413
238d c5        push    bc
238e 111526    ld      de,$2615
2391 0e12      ld      c,$12
2393 cd0500    call    $0005		call BDOS 
2396 c1        pop     bc
2397 c31723    jp      $2317
239a 60        ld      h,b
239b 69        ld      l,c
239c ed5b1326  ld      de,($2613)
23a0 b7        or      a
23a1 ed52      sbc     hl,de
23a3 2012      jr      nz,$23b7
23a5 3e00      ld      a,$00
23a7 21c894    ld      hl,$94c8		94c8=end of WordMaster program
23aa 77        ld      (hl),a
23ab 2a1326    ld      hl,($2613)
23ae 22c494    ld      ($94c4),hl
23b1 22c694    ld      ($94c6),hl
23b4 37        scf     
23b5 185c      jr      $2413
23b7 50        ld      d,b
23b8 59        ld      e,c
23b9 2ab894    ld      hl,($94b8)
23bc ed53c494  ld      ($94c4),de
23c0 ed53b894  ld      ($94b8),de
23c4 1b        dec     de
23c5 ed53c694  ld      ($94c6),de
23c9 13        inc     de
23ca cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
23cd 300a      jr      nc,$23d9
23cf b7        or      a
23d0 ed42      sbc     hl,bc
23d2 2805      jr      z,$23d9
23d4 44        ld      b,h
23d5 4d        ld      c,l
23d6 cd3992    call    $9239
23d9 62        ld      h,d
23da 6b        ld      l,e
23db 01c894    ld      bc,$94c8		94c8=end of WordMaster program
23de b7        or      a
23df ed42      sbc     hl,bc
23e1 44        ld      b,h
23e2 4d        ld      c,l
23e3 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
23e6 3011      jr      nc,$23f9
23e8 11c894    ld      de,$94c8		94c8=end of WordMaster program
23eb cdca91    call    $91ca
23ee 3003      jr      nc,$23f3
23f0 b7        or      a
23f1 1820      jr      $2413
23f3 ed5bb894  ld      de,($94b8)
23f7 1805      jr      $23fe
23f9 21c894    ld      hl,$94c8		94c8=end of WordMaster program
23fc edb0      ldir    
23fe 62        ld      h,d
23ff 6b        ld      l,e
2400 2b        dec     hl
2401 11c894    ld      de,$94c8		94c8=end of WordMaster program
2404 cd8670    call    $7086
2407 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
240a 3006      jr      nc,$2412
240c cdac42    call    $42ac
240f cd3992    call    $9239
2412 37        scf     
2413 f5        push    af
2414 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
2417 300a      jr      nc,$2423
2419 fd210f26  ld      iy,$260f
241d cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
2420 cd1e41    call    $411e
2423 3a2f24    ld      a,($242f)
2426 b7        or      a
2427 c4413b    call    nz,$3b41
242a f1        pop     af
242b e1        pop     hl
242c d1        pop     de
242d c1        pop     bc
242e c9        ret     

242f 00        nop     
2430 c5        push    bc
2431 d5        push    de
2432 e5        push    hl
2433 dde5      push    ix
2435 fde5      push    iy
2437 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
243a d5        push    de
243b 117964    ld      de,$6479
243e 010f00    ld      bc,$000f
2441 cdca91    call    $91ca
2444 ed4bb894  ld      bc,($94b8)
2448 ed43c494  ld      ($94c4),bc
244c d1        pop     de
244d fd21c094  ld      iy,$94c0
2451 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
2454 fde1      pop     iy
2456 dde1      pop     ix
2458 e1        pop     hl
2459 d1        pop     de
245a c1        pop     bc
245b c9        ret     

245c e5        push    hl
245d d5        push    de
245e c5        push    bc
245f 23        inc     hl
2460 e5        push    hl
2461 1a        ld      a,(de)
2462 a7        and     a
2463 282d      jr      z,$2492
2465 0608      ld      b,$08
2467 cd9524    call    $2495
246a 381e      jr      c,$248a
246c 010800    ld      bc,$0008
246f 09        add     hl,bc
2470 1a        ld      a,(de)
2471 13        inc     de
2472 fe2e      cp      $2e
2474 280d      jr      z,$2483
2476 a7        and     a
2477 20f7      jr      nz,$2470
2479 7e        ld      a,(hl)
247a fe20      cp      $20
247c 2011      jr      nz,$248f
247e e1        pop     hl
247f c1        pop     bc
2480 d1        pop     de
2481 e1        pop     hl
2482 c9        ret     

2483 0603      ld      b,$03
2485 cd9524    call    $2495
2488 30f4      jr      nc,$247e
248a 1a        ld      a,(de)
248b 13        inc     de
248c a7        and     a
248d 20fb      jr      nz,$248a
248f e1        pop     hl
2490 18ce      jr      $2460
2492 37        scf     
2493 18e9      jr      $247e
2495 c5        push    bc
2496 d5        push    de
2497 e5        push    hl
2498 1a        ld      a,(de)
2499 a7        and     a
249a 287c      jr      z,$2518
249c fe2e      cp      $2e
249e 2878      jr      z,$2518
24a0 fe5b      cp      $5b
24a2 283a      jr      z,$24de
24a4 fe2a      cp      $2a
24a6 281a      jr      z,$24c2
24a8 fe3f      cp      $3f
24aa 2803      jr      z,$24af
24ac be        cp      (hl)
24ad 206e      jr      nz,$251d
24af 13        inc     de
24b0 23        inc     hl
24b1 10e5      djnz    $2498
24b3 1a        ld      a,(de)
24b4 a7        and     a
24b5 2867      jr      z,$251e
24b7 fe2e      cp      $2e
24b9 2863      jr      z,$251e
24bb fe2a      cp      $2a
24bd 13        inc     de
24be 28f3      jr      z,$24b3
24c0 185b      jr      $251d
24c2 13        inc     de
24c3 1a        ld      a,(de)
24c4 fe2a      cp      $2a
24c6 28fa      jr      z,$24c2
24c8 a7        and     a
24c9 2853      jr      z,$251e
24cb fe2e      cp      $2e
24cd 284f      jr      z,$251e
24cf cd9524    call    $2495
24d2 304a      jr      nc,$251e
24d4 23        inc     hl
24d5 7e        ld      a,(hl)
24d6 fe20      cp      $20
24d8 28d9      jr      z,$24b3
24da 10f3      djnz    $24cf
24dc 18d5      jr      $24b3
24de 13        inc     de
24df 1a        ld      a,(de)
24e0 a7        and     a
24e1 283a      jr      z,$251d
24e3 fe2e      cp      $2e
24e5 2836      jr      z,$251d
24e7 fe5d      cp      $5d
24e9 2832      jr      z,$251d
24eb be        cp      (hl)
24ec 281b      jr      z,$2509
24ee 4f        ld      c,a
24ef 13        inc     de
24f0 1a        ld      a,(de)
24f1 fe2d      cp      $2d
24f3 20eb      jr      nz,$24e0
24f5 13        inc     de
24f6 1a        ld      a,(de)
24f7 a7        and     a
24f8 2823      jr      z,$251d
24fa fe2e      cp      $2e
24fc 281f      jr      z,$251d
24fe fe5d      cp      $5d
2500 281b      jr      z,$251d
2502 be        cp      (hl)
2503 38db      jr      c,$24e0
2505 79        ld      a,c
2506 be        cp      (hl)
2507 30d7      jr      nc,$24e0
2509 1a        ld      a,(de)
250a a7        and     a
250b 280b      jr      z,$2518
250d fe2e      cp      $2e
250f 2807      jr      z,$2518
2511 fe5d      cp      $5d
2513 289a      jr      z,$24af
2515 13        inc     de
2516 18f1      jr      $2509
2518 7e        ld      a,(hl)
2519 fe20      cp      $20
251b 2801      jr      z,$251e
251d 37        scf     
251e e1        pop     hl
251f d1        pop     de
2520 c1        pop     bc
2521 c9        ret     

					check if at least HL free KB in disk

2522 c5        push    bc		
2523 cd3b25    call    $253b		return in BC number of free KB in disk
2526 03        inc     bc
2527 b7        or      a
2528 ed42      sbc     hl,bc
252a 380d      jr      c,$2539
252c cd2202    call    $0222
252f dd21acc0  ld      ix,$c0ac
2533 cd9d43    call    $439d
2536 cd2e44    call    $442e
2539 c1        pop     bc
253a c9        ret     

					return in BC number of free KB in disk

253b f5        push    af		
253c d5        push    de
253d cd4b25    call    $254b		return in BC number of free clusters, a=records per cluster
2540 fe08      cp      $08
2542 2804      jr      z,$2548
2544 cb21      sla     c
2546 cb10      rl      b
2548 d1        pop     de
2549 f1        pop     af
254a c9        ret     

					return in BC number of free clusters
254b e5        push    hl		
254c 0e1b      ld      c,$1b
254e cd0500    call    $0005		call BDOS 27: Get Alloc Vector addr in HL
2551 f5        push    af
2552 d5        push    de
2553 60        ld      h,b		HL=BC=bitmap addr
2554 69        ld      l,c
2555 3e80      ld      a,$80		set bit mast to $80
2557 010000    ld      bc,$0000		count of free clusters
255a f5        push    af		save mask
255b a6        and     (hl)		apply mask
255c 2001      jr      nz,$255f
255e 03        inc     bc		if bit=0 -> inc bc = number of free clusters
255f 1b        dec     de
2560 7a        ld      a,d
2561 b3        or      e
2562 2807      jr      z,$256b		exit if all cluster have been examinated
2564 f1        pop     af		restore mask
2565 0f        rrca    			shift
2566 30f2      jr      nc,$255a
2568 23        inc     hl
2569 18ef      jr      $255a
256b f1        pop     af
256c d1        pop     de
256d f1        pop     af
256e e1        pop     hl
256f c9        ret     

2570 c5        push    bc
2571 fde5      push    iy
2573 d5        push    de
2574 fde1      pop     iy
2576 fd7e0c    ld      a,(iy+$0c)
2579 320c26    ld      ($260c),a
257c fd360c00  ld      (iy+$0c),$00
2580 0e11      ld      c,$11
2582 cd0500    call    $0005		call BDOS 
2585 feff      cp      $ff
2587 2876      jr      z,$25ff
2589 e5        push    hl
258a dde1      pop     ix
258c dd7e00    ld      a,(ix+$00)
258f fee5      cp      $e5
2591 2004      jr      nz,$2597
2593 0e12      ld      c,$12
2595 18eb      jr      $2582
2597 0e1b      ld      c,$1b
2599 cd0500    call    $0005		call BDOS 
259c 320b26    ld      ($260b),a
259f fde5      push    iy
25a1 d1        pop     de
25a2 dd7e0f    ld      a,(ix+$0f)
25a5 fe80      cp      $80
25a7 2020      jr      nz,$25c9
25a9 fd340c    inc     (iy+$0c)
25ac 0e11      ld      c,$11
25ae cd0500    call    $0005		call BDOS 
25b1 feff      cp      $ff
25b3 280c      jr      z,$25c1
25b5 e5        push    hl
25b6 dde1      pop     ix
25b8 dd7e00    ld      a,(ix+$00)
25bb fee5      cp      $e5
25bd 28ea      jr      z,$25a9
25bf 18d6      jr      $2597
25c1 fd7e0c    ld      a,(iy+$0c)
25c4 210000    ld      hl,$0000
25c7 1821      jr      $25ea
25c9 2600      ld      h,$00
25cb 6f        ld      l,a
25cc 3a0b26    ld      a,($260b)
25cf 1600      ld      d,$00
25d1 5f        ld      e,a
25d2 0e8a      ld      c,$8a
25d4 cd0500    call    $0005		call BDOS 
25d7 7a        ld      a,d
25d8 b3        or      e
25d9 2801      jr      z,$25dc
25db 23        inc     hl
25dc 3a0b26    ld      a,($260b)
25df fe10      cp      $10
25e1 2001      jr      nz,$25e4
25e3 29        add     hl,hl
25e4 dd7e0c    ld      a,(ix+$0c)
25e7 b7        or      a
25e8 2814      jr      z,$25fe
25ea 0600      ld      b,$00
25ec 4f        ld      c,a
25ed cb21      sla     c
25ef cb10      rl      b
25f1 cb21      sla     c
25f3 cb10      rl      b
25f5 cb21      sla     c
25f7 cb10      rl      b
25f9 cb21      sla     c
25fb cb10      rl      b
25fd 09        add     hl,bc
25fe 97        sub     a
25ff f5        push    af
2600 3a0c26    ld      a,($260c)
2603 fd770c    ld      (iy+$0c),a
2606 f1        pop     af
2607 fde1      pop     iy
2609 c1        pop     bc
260a c9        ret     

260b 00        nop     
260c 00        nop     
260d 00        nop     
260e 00        nop     
260f 00        nop     
2610 00        nop     
2611 00        nop     
2612 00        nop     
2613 00        nop     
2614 00        nop     
2615 00        nop     
2616 3f        ccf     
2617 3f        ccf     
2618 3f        ccf     
2619 3f        ccf     
261a 3f        ccf     
261b 3f        ccf     
261c 3f        ccf     
261d 3f        ccf     
261e 3f        ccf     
261f 3f        ccf     
2620 3f        ccf     
2621 00        nop     
2622 2a2e43    ld      hl,($432e)
2625 4f        ld      c,a
2626 4d        ld      c,l
2627 00        nop     
2628 2a2e52    ld      hl,($522e)
262b 45        ld      b,l
262c 4c        ld      c,h
262d 00        nop     
262e 2a2e42    ld      hl,($422e)
2631 49        ld      c,c
2632 4e        ld      c,(hl)
2633 00        nop     
2634 2a2e4f    ld      hl,($4f2e)
2637 56        ld      d,(hl)
2638 52        ld      d,d
2639 00        nop     
263a 2a2e54    ld      hl,($542e)
263d 52        ld      d,d
263e 4b        ld      c,e
263f 00        nop     
2640 2a2e48    ld      hl,($482e)
2643 4c        ld      c,h
2644 50        ld      d,b
2645 00        nop     
2646 57        ld      d,a
2647 52        ld      d,d
2648 49        ld      c,c
2649 54        ld      d,h
264a 4d        ld      c,l
264b 41        ld      b,c
264c 53        ld      d,e
264d 54        ld      d,h
264e 2e54      ld      l,$54
2650 41        ld      b,c
2651 42        ld      b,d
2652 00        nop     
2653 2a2e24    ld      hl,($242e)
2656 2a0000    ld      hl,($0000)
2659 e5        push    hl
265a dde5      push    ix
265c dd2122c1  ld      ix,$c122
2660 218226    ld      hl,$2682
2663 cda17e    call    $7ea1
2666 3816      jr      c,$267e
2668 fe20      cp      $20
266a 2804      jr      z,$2670
266c fe0d      cp      $0d
266e 2005      jr      nz,$2675
2670 cd9226    call    $2692		return current drive in A (A:=1, B:=2, etc)
2673 c640      add     a,$40
2675 cd7844    call    $4478		write char in A
2678 d641      sub     $41
267a cd9b26    call    $269b
267d b7        or      a
267e dde1      pop     ix
2680 e1        pop     hl
2681 c9        ret     

2682 200d      jr      nz,$2691
2684 41        ld      b,c
2685 42        ld      b,d
2686 43        ld      b,e
2687 44        ld      b,h
2688 45        ld      b,l
2689 46        ld      b,(hl)
268a 47        ld      b,a
268b 48        ld      c,b
268c 00        nop     
268d 3a9126    ld      a,($2691)	$2691=current drive
2690 c9        ret     
2691 00        nop     

				return current drive in A (A:=1, B:=2, etc)
2692 c5        push    bc	
2693 0e19      ld      c,$19	
2695 cd0500    call    $0005	call BDOS 25: Read Drive Num (return current drive)
2698 3c        inc     a
2699 c1        pop     bc
269a c9        ret     

269b c5        push    bc
269c d5        push    de
269d 0e0d      ld      c,$0d
269f cd0500    call    $0005		call BDOS 
26a2 5f        ld      e,a
26a3 0e0e      ld      c,$0e
26a5 cd0500    call    $0005		call BDOS 
26a8 d1        pop     de
26a9 c1        pop     bc
26aa c9        ret     

26ab 3ae426    ld      a,($26e4)
26ae b7        or      a
26af c9        ret     

26b0 0e81      ld      c,$81		
26b2 cd0500    call    $0005		call BDOS 129: CDOS: get user register pointer 
26b5 210500    ld      hl,$0005			BC=addr
26b8 09        add     hl,bc			HL=addr+5
26b9 5e        ld      e,(hl)			DE=[addr+5]
26ba 23        inc     hl
26bb 56        ld      d,(hl)
26bc eb        ex      de,hl			HL=[addr+5]
26bd 23        inc     hl			HL=[addr+5]+1
26be 0604      ld      b,$04
26c0 0e41      ld      c,$41	'A'
26c2 11e526    ld      de,$26e5
26c5 7e        ld      a,(hl)
26c6 23        inc     hl
26c7 b6        or      (hl)
26c8 2807      jr      z,$26d1
26ca 79        ld      a,c
26cb 12        ld      (de),a
26cc 13        inc     de
26cd 3e2c      ld      a,$2c	','
26cf 12        ld      (de),a
26d0 13        inc     de
26d1 0c        inc     c
26d2 23        inc     hl
26d3 10f0      djnz    $26c5
26d5 1b        dec     de
26d6 97        sub     a
26d7 12        ld      (de),a
26d8 1b        dec     de
26d9 1a        ld      a,(de)
26da fe41      cp      $41
26dc 2005      jr      nz,$26e3 
26de 3e01      ld      a,$01
26e0 32e426    ld      ($26e4),a
26e3 c9        ret     

26e4 00        nop     
26e5 00        nop     
26e6 00        nop     
26e7 00        nop     
26e8 00        nop     
26e9 00        nop     
26ea 00        nop     
26eb 00        nop     
26ec 00        nop     
26ed d5        push    de
26ee e5        push    hl
26ef 21e526    ld      hl,$26e5
26f2 57        ld      d,a
26f3 fe2c      cp      $2c
26f5 2003      jr      nz,$26fa
26f7 97        sub     a
26f8 180a      jr      $2704
26fa 7a        ld      a,d
26fb be        cp      (hl)
26fc 2805      jr      z,$2703
26fe 23        inc     hl
26ff 97        sub     a
2700 be        cp      (hl)
2701 20f7      jr      nz,$26fa
2703 7e        ld      a,(hl)
2704 a7        and     a
2705 e1        pop     hl
2706 d1        pop     de
2707 c9        ret     

2708 00        nop     
2709 00        nop     
270a 00        nop     
270b 00        nop     
270c 00        nop     
270d 00        nop     
270e 00        nop     
270f 00        nop     
2710 00        nop     
2711 00        nop     
2712 00        nop     
2713 00        nop     
2714 00        nop     
2715 00        nop     
2716 00        nop     
2717 00        nop     
2718 00        nop     
2719 00        nop     
271a 00        nop     
271b 00        nop     
271c 00        nop     
271d 00        nop     
271e 00        nop     
271f 00        nop     
2720 00        nop     
2721 00        nop     
2722 00        nop     
2723 00        nop     
2724 00        nop     
2725 00        nop     
2726 00        nop     
2727 00        nop     
2728 00        nop     
2729 00        nop     
272a 00        nop     
272b 2d        dec     l
272c 2d        dec     l
272d 2d        dec     l
272e 2d        dec     l
272f 2d        dec     l
2730 2d        dec     l
2731 2d        dec     l
2732 2d        dec     l
2733 2d        dec     l
2734 2d        dec     l
2735 2d        dec     l
2736 00        nop     
2737 00        nop     
2738 00        nop     
2739 00        nop     
273a 00        nop     
273b 00        nop     
273c 00        nop     
273d 00        nop     
273e 00        nop     
273f 00        nop     
2740 00        nop     
2741 00        nop     
2742 00        nop     
2743 00        nop     
2744 00        nop     
2745 00        nop     
2746 00        nop     
2747 00        nop     
2748 00        nop     
2749 00        nop     
274a 00        nop     
274b 00        nop     
274c 2d        dec     l
274d 2d        dec     l
274e 2d        dec     l
274f 2d        dec     l
2750 2d        dec     l
2751 2d        dec     l
2752 2d        dec     l
2753 2d        dec     l
2754 2d        dec     l
2755 2d        dec     l
2756 2d        dec     l
2757 00        nop     
2758 00        nop     
2759 00        nop     
275a 00        nop     
275b 00        nop     
275c 00        nop     
275d 00        nop     
275e 00        nop     
275f 00        nop     
2760 00        nop     
2761 00        nop     
2762 00        nop     
2763 00        nop     
2764 00        nop     
2765 00        nop     
2766 00        nop     
2767 00        nop     
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
2776 00        nop     
2777 00        nop     
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
27be e5        push    hl
27bf 210827    ld      hl,$2708
27c2 cb96      res     2,(hl)
27c4 e1        pop     hl
27c5 c9        ret     

27c6 e5        push    hl
27c7 210827    ld      hl,$2708
27ca cb86      res     0,(hl)
27cc e1        pop     hl
27cd c9        ret     

27ce e5        push    hl
27cf 210827    ld      hl,$2708
27d2 cb8e      res     1,(hl)
27d4 e1        pop     hl
27d5 c9        ret     

27d6 c5        push    bc
27d7 d5        push    de
27d8 e5        push    hl
27d9 dde5      push    ix
27db fde5      push    iy
27dd f5        push    af
27de 97        sub     a
27df 320927    ld      ($2709),a
27e2 fde5      push    iy
27e4 e1        pop     hl
27e5 110927    ld      de,$2709
27e8 0e86      ld      c,$86
27ea cd0500    call    $0005		call BDOS 
27ed 210927    ld      hl,$2709
27f0 11cc28    ld      de,$28cc
27f3 cd5c24    call    $245c
27f6 3808      jr      c,$2800
27f8 f1        pop     af
27f9 dd21efbd  ld      ix,$bdef
27fd c3bf28    jp      $28bf
2800 fde5      push    iy
2802 e1        pop     hl
2803 114b27    ld      de,$274b
2806 0e86      ld      c,$86
2808 cd0500    call    $0005		call BDOS 
280b cdd928    call    $28d9
280e fde5      push    iy
2810 e1        pop     hl
2811 112a27    ld      de,$272a
2814 0e86      ld      c,$86
2816 cd0500    call    $0005		call BDOS 
2819 cde728    call    $28e7
281c f1        pop     af
281d 3829      jr      c,$2848
281f 110927    ld      de,$2709
2822 0e0f      ld      c,$0f
2824 cd0500    call    $0005		call BDOS 
2827 feff      cp      $ff
2829 ca9328    jp      z,$2893
282c 210827    ld      hl,$2708
282f cbd6      set     2,(hl)
2831 210827    ld      hl,$2708
2834 cb9e      res     3,(hl)
2836 cd003c    call    $3c00
2839 202e      jr      nz,$2869
283b 110927    ld      de,$2709
283e cd7025    call    $2570
2841 cd2225    call    $2522		check if at least HL free KB in disk
2844 3823      jr      c,$2869
2846 1844      jr      $288c
2848 110927    ld      de,$2709
284b 0e11      ld      c,$11
284d cd0500    call    $0005		call BDOS 
2850 feff      cp      $ff
2852 206e      jr      nz,$28c2
2854 cd003c    call    $3c00
2857 2008      jr      nz,$2861
2859 210400    ld      hl,$0004
285c cd2225    call    $2522		check if at least HL free KB in disk
285f 302b      jr      nc,$288c
2861 cdbe27    call    $27be
2864 210827    ld      hl,$2708
2867 cbde      set     3,(hl)
2869 114b27    ld      de,$274b
286c 0e0f      ld      c,$0f
286e cd0500    call    $0005		call BDOS 
2871 feff      cp      $ff
2873 282a      jr      z,$289f
2875 210827    ld      hl,$2708
2878 cb8e      res     1,(hl)
287a 112a27    ld      de,$272a
287d 0e0f      ld      c,$0f
287f cd0500    call    $0005		call BDOS 
2882 feff      cp      $ff
2884 282a      jr      z,$28b0
2886 cdc627    call    $27c6
2889 97        sub     a
288a 1838      jr      $28c4
288c cd6888    call    $8868
288f 3eff      ld      a,$ff
2891 1831      jr      $28c4
2893 dd2199bd  ld      ix,$bd99
2897 1826      jr      $28bf
2899 dd21aabd  ld      ix,$bdaa
289d 1820      jr      $28bf
289f dd214b27  ld      ix,$274b
28a3 cde92c    call    $2ce9
28a6 feff      cp      $ff
28a8 20d0      jr      nz,$287a
28aa dd21bdbd  ld      ix,$bdbd
28ae 180f      jr      $28bf
28b0 dd212a27  ld      ix,$272a
28b4 cde92c    call    $2ce9
28b7 feff      cp      $ff
28b9 20ce      jr      nz,$2889
28bb dd21d7bd  ld      ix,$bdd7
28bf cd0544    call    $4405
28c2 3e02      ld      a,$02
28c4 fde1      pop     iy
28c6 dde1      pop     ix
28c8 e1        pop     hl
28c9 d1        pop     de
28ca c1        pop     bc
28cb c9        ret     

28cc 2a2e42    ld      hl,($422e)
28cf 41        ld      b,c
28d0 4b        ld      c,e
28d1 00        nop     
28d2 2a2e50    ld      hl,($502e)
28d5 52        ld      d,d
28d6 54        ld      d,h
28d7 00        nop     
28d8 00        nop     
28d9 e5        push    hl
28da 215427    ld      hl,$2754
28dd 3624      ld      (hl),$24
28df 23        inc     hl
28e0 3624      ld      (hl),$24
28e2 23        inc     hl
28e3 364f      ld      (hl),$4f
28e5 e1        pop     hl
28e6 c9        ret     

28e7 e5        push    hl
28e8 213327    ld      hl,$2733
28eb 3624      ld      (hl),$24
28ed 23        inc     hl
28ee 3624      ld      (hl),$24
28f0 23        inc     hl
28f1 3654      ld      (hl),$54
28f3 e1        pop     hl
28f4 c9        ret     

28f5 e5        push    hl
28f6 dde5      push    ix
28f8 210827    ld      hl,$2708
28fb cb4e      bit     1,(hl)
28fd 2826      jr      z,$2925
28ff cdfd29    call    $29fd
2902 cda12e    call    $2ea1		Set DMA address to DE
2905 dd214b27  ld      ix,$274b
2909 cd8029    call    $2980
290c fe02      cp      $02
290e 2009      jr      nz,$2919
2910 dd21afbf  ld      ix,$bfaf
2914 cd0544    call    $4405
2917 180e      jr      $2927
2919 fe01      cp      $01
291b 2802      jr      z,$291f
291d 1808      jr      $2927
291f cdf629    call    $29f6
2922 cdce27    call    $27ce
2925 3e01      ld      a,$01
2927 cda92e    call    $2ea9		Set DMA address to default $0080
292a dde1      pop     ix
292c e1        pop     hl
292d c9        ret     

292e c5        push    bc
292f e5        push    hl
2930 dde5      push    ix
2932 cda12e    call    $2ea1		Set DMA address to DE
2935 210827    ld      hl,$2708
2938 cb46      bit     0,(hl)
293a 2813      jr      z,$294f
293c dd212a27  ld      ix,$272a
2940 cd8029    call    $2980
2943 fe01      cp      $01
2945 2805      jr      z,$294c
2947 cdf629    call    $29f6
294a 182c      jr      $2978
294c cdc627    call    $27c6
294f 210827    ld      hl,$2708
2952 cb56      bit     2,(hl)
2954 2004      jr      nz,$295a
2956 3e01      ld      a,$01
2958 181e      jr      $2978
295a d5        push    de
295b 110927    ld      de,$2709
295e 0e14      ld      c,$14
2960 cd0500    call    $0005		call BDOS 
2963 d1        pop     de
2964 fe01      cp      $01
2966 2809      jr      z,$2971
2968 fe02      cp      $02
296a 280a      jr      z,$2976
296c cdf629    call    $29f6
296f 1807      jr      $2978
2971 cdbe27    call    $27be
2974 1802      jr      $2978
2976 3e02      ld      a,$02
2978 cda92e    call    $2ea9		Set DMA address to default $0080
297b dde1      pop     ix
297d e1        pop     hl
297e c1        pop     bc
297f c9        ret     

2980 c5        push    bc
2981 d5        push    de
2982 cd128c    call    $8c12
2985 b7        or      a
2986 fa9b29    jp      m,$299b
2989 dde5      push    ix
298b d1        pop     de
298c 0e14      ld      c,$14
298e cd0500    call    $0005		call BDOS 
2991 fe02      cp      $02
2993 280a      jr      z,$299f
2995 cd128c    call    $8c12
2998 97        sub     a
2999 1806      jr      $29a1
299b 3e01      ld      a,$01
299d 1802      jr      $29a1
299f 3e02      ld      a,$02
29a1 d1        pop     de
29a2 c1        pop     bc
29a3 c9        ret     

29a4 c5        push    bc
29a5 e5        push    hl
29a6 cda12e    call    $2ea1		Set DMA address to DE
29a9 d5        push    de
29aa 114b27    ld      de,$274b
29ad 0e15      ld      c,$15
29af cd0500    call    $0005		call BDOS 
29b2 d1        pop     de
29b3 b7        or      a
29b4 200a      jr      nz,$29c0
29b6 210827    ld      hl,$2708
29b9 cbce      set     1,(hl)
29bb cdf629    call    $29f6
29be 1807      jr      $29c7
29c0 cd5d2a    call    $2a5d
29c3 30e1      jr      nc,$29a6
29c5 3e02      ld      a,$02
29c7 cda92e    call    $2ea9		Set DMA address to default $0080
29ca e1        pop     hl
29cb c1        pop     bc
29cc c9        ret     

29cd c5        push    bc
29ce e5        push    hl
29cf cdfd29    call    $29fd
29d2 cda12e    call    $2ea1		Set DMA address to DE
29d5 d5        push    de
29d6 112a27    ld      de,$272a
29d9 0e15      ld      c,$15
29db cd0500    call    $0005		call BDOS 
29de d1        pop     de
29df b7        or      a
29e0 2007      jr      nz,$29e9
29e2 210827    ld      hl,$2708
29e5 cbc6      set     0,(hl)
29e7 1807      jr      $29f0
29e9 cd5d2a    call    $2a5d
29ec 30e4      jr      nc,$29d2
29ee 3e02      ld      a,$02
29f0 cda92e    call    $2ea9		Set DMA address to default $0080
29f3 e1        pop     hl
29f4 c1        pop     bc
29f5 c9        ret     

29f6 218000    ld      hl,$0080
29f9 19        add     hl,de
29fa 54        ld      d,h
29fb 5d        ld      e,l
29fc c9        ret     

29fd 2180ff    ld      hl,$ff80
2a00 19        add     hl,de
2a01 54        ld      d,h
2a02 5d        ld      e,l
2a03 c9        ret     

2a04 c5        push    bc
2a05 d5        push    de
2a06 e5        push    hl
2a07 114b27    ld      de,$274b
2a0a 0e10      ld      c,$10
2a0c cd0500    call    $0005		call BDOS 
2a0f 210a27    ld      hl,$270a
2a12 115c27    ld      de,$275c
2a15 011000    ld      bc,$0010
2a18 edb0      ldir    
2a1a 97        sub     a
2a1b 325b27    ld      ($275b),a
2a1e 210927    ld      hl,$2709
2a21 111927    ld      de,$2719
2a24 010900    ld      bc,$0009
2a27 edb0      ldir    
2a29 62        ld      h,d
2a2a 6b        ld      l,e
2a2b 3642      ld      (hl),$42
2a2d 23        inc     hl
2a2e 3641      ld      (hl),$41
2a30 23        inc     hl
2a31 364b      ld      (hl),$4b
2a33 111927    ld      de,$2719
2a36 0e13      ld      c,$13
2a38 cd0500    call    $0005		call BDOS 
2a3b 110927    ld      de,$2709
2a3e 0e17      ld      c,$17
2a40 cd0500    call    $0005		call BDOS 
2a43 114b27    ld      de,$274b
2a46 0e17      ld      c,$17
2a48 cd0500    call    $0005		call BDOS 
2a4b cd8d31    call    $318d
2a4e e1        pop     hl
2a4f d1        pop     de
2a50 c1        pop     bc
2a51 c9        ret     

2a52 d5        push    de
2a53 e5        push    hl
2a54 110927    ld      de,$2709
2a57 cd0a43    call    $430a
2a5a e1        pop     hl
2a5b d1        pop     de
2a5c c9        ret     

2a5d f5        push    af
2a5e c5        push    bc
2a5f d5        push    de
2a60 e5        push    hl
2a61 dde5      push    ix
2a63 fde5      push    iy
2a65 218000    ld      hl,$0080
2a68 111e76    ld      de,$761e
2a6b 018000    ld      bc,$0080
2a6e edb0      ldir    
2a70 cda92e    call    $2ea9		Set DMA address to default $0080
2a73 cd2202    call    $0222
2a76 119ba0    ld      de,$a09b
2a79 0600      ld      b,$00
2a7b 21c894    ld      hl,$94c8		94c8=end of WordMaster program
2a7e cd1886    call    $8618
2a81 1601      ld      d,$01
2a83 1e18      ld      e,$18		set cursor pos
2a85 cd2e04    call    $042e		CDOS: set special crt function
2a88 cd2e44    call    $442e
2a8b 302f      jr      nc,$2abc
2a8d 216c27    ld      hl,$276c
2a90 11ad2c    ld      de,$2cad
2a93 012100    ld      bc,$0021
2a96 edb0      ldir    
2a98 dd21dda0  ld      ix,$a0dd
2a9c cd9d43    call    $439d
2a9f cd6e85    call    $856e
2aa2 21a02c    ld      hl,$2ca0
2aa5 cd7689    call    $8976
2aa8 cdc22f    call    $2fc2
2aab b7        or      a
2aac 20ea      jr      nz,$2a98
2aae 21ad2c    ld      hl,$2cad
2ab1 116c27    ld      de,$276c
2ab4 012100    ld      bc,$0021
2ab7 edb0      ldir    
2ab9 c38b2c    jp      $2c8b
2abc cd003c    call    $3c00
2abf c20f2c    jp      nz,$2c0f
2ac2 dd2180a1  ld      ix,$a180
2ac6 cda343    call    $43a3
2ac9 cd2e44    call    $442e
2acc d20f2c    jp      nc,$2c0f
2acf 21a464    ld      hl,$64a4		fname WRITM066.HLP
2ad2 11ad2c    ld      de,$2cad
2ad5 0e86      ld      c,$86
2ad7 cd0500    call    $0005		call BDOS 
2ada 11ad2c    ld      de,$2cad
2add 0e0f      ld      c,$0f
2adf cd0500    call    $0005		call BDOS 
2ae2 11ad2c    ld      de,$2cad
2ae5 0e14      ld      c,$14
2ae7 cd0500    call    $0005		call BDOS 
2aea fe02      cp      $02
2aec ca0f2c    jp      z,$2c0f
2aef 218000    ld      hl,$0080
2af2 119e76    ld      de,$769e
2af5 018000    ld      bc,$0080
2af8 edb0      ldir    
2afa 11ad2c    ld      de,$2cad
2afd 0e14      ld      c,$14
2aff cd0500    call    $0005		call BDOS 
2b02 fe02      cp      $02
2b04 ca0f2c    jp      z,$2c0f
2b07 218000    ld      hl,$0080
2b0a 111e77    ld      de,$771e
2b0d 018000    ld      bc,$0080
2b10 edb0      ldir    
2b12 cdab26    call    $26ab
2b15 2812      jr      z,$2b29
2b17 dd2154a2  ld      ix,$a254
2b1b cd9d43    call    $439d
2b1e cddf2c    call    $2cdf
2b21 fe1b      cp      $1b
2b23 ca0f2c    jp      z,$2c0f
2b26 97        sub     a
2b27 181c      jr      $2b45
2b29 dd21c5a1  ld      ix,$a1c5
2b2d cd9d43    call    $439d
2b30 cddf2c    call    $2cdf
2b33 fe1b      cp      $1b
2b35 ca0f2c    jp      z,$2c0f
2b38 cd7c8c    call    $8c7c
2b3b cded26    call    $26ed
2b3e 28f0      jr      z,$2b30
2b40 cd7844    call    $4478		write char in A
2b43 d641      sub     $41
2b45 cd9b26    call    $269b
2b48 cd3002    call    $0230
2b4b 21d02c    ld      hl,$2cd0
2b4e 11ad2c    ld      de,$2cad
2b51 010c00    ld      bc,$000c
2b54 edb0      ldir    
2b56 dd21ad2c  ld      ix,$2cad
2b5a cde92c    call    $2ce9
2b5d feff      cp      $ff
2b5f 200c      jr      nz,$2b6d
2b61 dd21a176  ld      ix,$76a1
2b65 cda343    call    $43a3
2b68 cddf2c    call    $2cdf
2b6b 18c3      jr      $2b30
2b6d 21132c    ld      hl,$2c13
2b70 220101    ld      ($0101),hl
2b73 ed73ce2c  ld      ($2cce),sp
2b77 3a2927    ld      a,($2729)
2b7a 32dc2c    ld      ($2cdc),a
2b7d 3a6b27    ld      a,($276b)
2b80 32dd2c    ld      ($2cdd),a
2b83 3a4a27    ld      a,($274a)
2b86 32de2c    ld      ($2cde),a
2b89 210001    ld      hl,$0100
2b8c e5        push    hl
2b8d 118000    ld      de,$0080
2b90 018000    ld      bc,$0080
2b93 edb0      ldir    
2b95 11ad2c    ld      de,$2cad
2b98 0e15      ld      c,$15
2b9a cd0500    call    $0005		call BDOS 
2b9d e1        pop     hl
2b9e 54        ld      d,h
2b9f 5d        ld      e,l
2ba0 2aba94    ld      hl,($94ba)
2ba3 b7        or      a
2ba4 ed52      sbc     hl,de
2ba6 3805      jr      c,$2bad
2ba8 cdf629    call    $29f6
2bab 18df      jr      $2b8c
2bad 11ad2c    ld      de,$2cad
2bb0 0e10      ld      c,$10
2bb2 cd0500    call    $0005		call BDOS 
2bb5 cdab26    call    $26ab
2bb8 280d      jr      z,$2bc7
2bba dd210877  ld      ix,$7708
2bbe cda343    call    $43a3
2bc1 cddf2c    call    $2cdf
2bc4 cd3002    call    $0230
2bc7 cd8d26    call    $268d
2bca 3d        dec     a
2bcb cd9b26    call    $269b
2bce dd21c1a2  ld      ix,$a2c1
2bd2 cda343    call    $43a3
2bd5 cdab26    call    $26ab
2bd8 2806      jr      z,$2be0
2bda dd2120a4  ld      ix,$a420
2bde 1804      jr      $2be4
2be0 dd21f0a3  ld      ix,$a3f0
2be4 cda343    call    $43a3
2be7 dd2147a4  ld      ix,$a447
2beb cda343    call    $43a3
2bee cd6f43    call    $436f
2bf1 cd1086    call    $8610
2bf4 110927    ld      de,$2709
2bf7 0e10      ld      c,$10
2bf9 cd0500    call    $0005
2bfc 114b27    ld      de,$274b
2bff 0e10      ld      c,$10
2c01 cd0500    call    $0005
2c04 112a27    ld      de,$272a
2c07 0e10      ld      c,$10
2c09 cd0500    call    $0005
2c0c c30000    jp      $0000
2c0f 37        scf     
2c10 c3972c    jp      $2c97
2c13 ed7bce2c  ld      sp,($2cce)
2c17 cd3e03    call    $033e		clear screen
2c1a cd6564    call    $6465
2c1d feff      cp      $ff
2c1f 200a      jr      nz,$2c2b
2c21 117964    ld      de,$6479
2c24 0e09      ld      c,$09
2c26 cd0500    call    $0005
2c29 18e1      jr      $2c0c
2c2b 210827    ld      hl,$2708
2c2e cb5e      bit     3,(hl)
2c30 201e      jr      nz,$2c50
2c32 110927    ld      de,$2709
2c35 0e0f      ld      c,$0f
2c37 cd0500    call    $0005
2c3a feff      cp      $ff
2c3c 200c      jr      nz,$2c4a
2c3e cd3002    call    $0230
2c41 cd3e43    call    $433e
2c44 dd21eda4  ld      ix,$a4ed
2c48 182e      jr      $2c78
2c4a 3adc2c    ld      a,($2cdc)
2c4d 322927    ld      ($2729),a
2c50 114b27    ld      de,$274b
2c53 0e0f      ld      c,$0f
2c55 cd0500    call    $0005
2c58 feff      cp      $ff
2c5a 2006      jr      nz,$2c62
2c5c dd2100a5  ld      ix,$a500
2c60 1816      jr      $2c78
2c62 3add2c    ld      a,($2cdd)
2c65 326b27    ld      ($276b),a
2c68 112a27    ld      de,$272a
2c6b 0e0f      ld      c,$0f
2c6d cd0500    call    $0005
2c70 feff      cp      $ff
2c72 2009      jr      nz,$2c7d
2c74 dd211ea5  ld      ix,$a51e
2c78 cda343    call    $43a3
2c7b 188f      jr      $2c0c
2c7d 3ade2c    ld      a,($2cde)
2c80 324a27    ld      ($274a),a
2c83 11ad2c    ld      de,$2cad
2c86 0e13      ld      c,$13
2c88 cd0500    call    $0005
2c8b 211e76    ld      hl,$761e
2c8e 118000    ld      de,$0080
2c91 018000    ld      bc,$0080
2c94 edb0      ldir    
2c96 b7        or      a
2c97 fde1      pop     iy
2c99 dde1      pop     ix
2c9b e1        pop     hl
2c9c d1        pop     de
2c9d c1        pop     bc
2c9e f1        pop     af
2c9f c9        ret     

2ca0 64        ld      h,h
2ca1 65        ld      h,l
2ca2 6c        ld      l,h
2ca3 65        ld      h,l
2ca4 74        ld      (hl),h
2ca5 65        ld      h,l
2ca6 2066      jr      nz,$2d0e
2ca8 69        ld      l,c
2ca9 6c        ld      l,h
2caa 65        ld      h,l
2cab 2024      jr      nz,$2cd1
2cad 00        nop     
2cae 00        nop     
2caf 00        nop     
2cb0 00        nop     
2cb1 00        nop     
2cb2 00        nop     
2cb3 00        nop     
2cb4 00        nop     
2cb5 00        nop     
2cb6 00        nop     
2cb7 00        nop     
2cb8 00        nop     
2cb9 00        nop     
2cba 00        nop     
2cbb 00        nop     
2cbc 00        nop     
2cbd 00        nop     
2cbe 00        nop     
2cbf 00        nop     
2cc0 00        nop     
2cc1 00        nop     
2cc2 00        nop     
2cc3 00        nop     
2cc4 00        nop     
2cc5 00        nop     
2cc6 00        nop     
2cc7 00        nop     
2cc8 00        nop     
2cc9 00        nop     
2cca 00        nop     
2ccb 00        nop     
2ccc 00        nop     
2ccd 00        nop     
2cce 00        nop     
2ccf 00        nop     
2cd0 00        nop     
2cd1 52        ld      d,d
2cd2 45        ld      b,l
2cd3 53        ld      d,e
2cd4 54        ld      d,h
2cd5 41        ld      b,c
2cd6 52        ld      d,d
2cd7 54        ld      d,h
2cd8 2043      jr      nz,$2d1d
2cda 4f        ld      c,a
2cdb 4d        ld      c,l
2cdc 00        nop     
2cdd 00        nop     
2cde 00        nop     
2cdf cd2202    call    $0222
2ce2 cda37d    call    $7da3		discard keys typed on terminal
2ce5 cdec7c    call    $7cec
2ce8 c9        ret     

2ce9 dd360c00  ld      (ix+$0c),$00
2ced dde5      push    ix
2cef d1        pop     de
2cf0 0e16      ld      c,$16
2cf2 cd0500    call    $0005
2cf5 c9        ret     

2cf6 c5        push    bc
2cf7 d5        push    de
2cf8 e5        push    hl
2cf9 dde5      push    ix
2cfb cd872e    call    $2e87
2cfe 116c27    ld      de,$276c
2d01 0e0f      ld      c,$0f
2d03 cd0500    call    $0005
2d06 feff      cp      $ff
2d08 2004      jr      nz,$2d0e
2d0a 3e02      ld      a,$02
2d0c 1806      jr      $2d14
2d0e 3e01      ld      a,$01
2d10 321a2d    ld      ($2d1a),a
2d13 97        sub     a
2d14 dde1      pop     ix
2d16 e1        pop     hl
2d17 d1        pop     de
2d18 c1        pop     bc
2d19 c9        ret     

2d1a 00        nop     
2d1b c5        push    bc
2d1c d5        push    de
2d1d e5        push    hl
2d1e dde5      push    ix
2d20 fde5      push    iy
2d22 32862d    ld      ($2d86),a
2d25 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
2d28 fd21872d  ld      iy,$2d87
2d2c cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
2d2f 218000    ld      hl,$0080
2d32 116c27    ld      de,$276c
2d35 cd9e2d    call    $2d9e
2d38 fe01      cp      $01
2d3a 2842      jr      z,$2d7e
2d3c b7        or      a
2d3d 2003      jr      nz,$2d42
2d3f 32862d    ld      ($2d86),a
2d42 54        ld      d,h
2d43 5d        ld      e,l
2d44 010000    ld      bc,$0000
2d47 1a        ld      a,(de)
2d48 fe1a      cp      $1a
2d4a 2813      jr      z,$2d5f
2d4c fe01      cp      $01
2d4e 280f      jr      z,$2d5f
2d50 13        inc     de
2d51 03        inc     bc
2d52 cb42      bit     0,d
2d54 28f1      jr      z,$2d47
2d56 54        ld      d,h
2d57 5d        ld      e,l
2d58 cdca91    call    $91ca
2d5b 3807      jr      c,$2d64
2d5d 18d0      jr      $2d2f
2d5f 54        ld      d,h
2d60 5d        ld      e,l
2d61 cdca91    call    $91ca
2d64 3a862d    ld      a,($2d86)
2d67 b7        or      a
2d68 2814      jr      z,$2d7e
2d6a cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
2d6d d5        push    de
2d6e e5        push    hl
2d6f fd21872d  ld      iy,$2d87
2d73 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
2d76 cd1e41    call    $411e
2d79 e1        pop     hl
2d7a d1        pop     de
2d7b cded1c    call    $1ced
2d7e fde1      pop     iy
2d80 dde1      pop     ix
2d82 e1        pop     hl
2d83 d1        pop     de
2d84 c1        pop     bc
2d85 c9        ret     

2d86 00        nop     
2d87 00        nop     
2d88 00        nop     
2d89 00        nop     
2d8a 00        nop     
2d8b c5        push    bc
2d8c d5        push    de
2d8d e5        push    hl
2d8e 116c27    ld      de,$276c
2d91 218000    ld      hl,$0080
2d94 cd9e2d    call    $2d9e
2d97 e5        push    hl
2d98 dde1      pop     ix
2d9a e1        pop     hl
2d9b d1        pop     de
2d9c c1        pop     bc
2d9d c9        ret     

2d9e c5        push    bc
2d9f d5        push    de
2da0 dde5      push    ix
2da2 d5        push    de
2da3 54        ld      d,h
2da4 5d        ld      e,l
2da5 cda12e    call    $2ea1		Set DMA address to DE
2da8 d1        pop     de
2da9 0e14      ld      c,$14
2dab cd0500    call    $0005
2dae fe02      cp      $02
2db0 2832      jr      z,$2de4
2db2 fe01      cp      $01
2db4 2835      jr      z,$2deb
2db6 3a1a2d    ld      a,($2d1a)
2db9 fe01      cp      $01
2dbb 2023      jr      nz,$2de0
2dbd 97        sub     a
2dbe 321a2d    ld      ($2d1a),a
2dc1 d5        push    de
2dc2 dde1      pop     ix
2dc4 dd7e20    ld      a,(ix+$20)
2dc7 fe01      cp      $01
2dc9 2015      jr      nz,$2de0
2dcb dd7e0c    ld      a,(ix+$0c)
2dce b7        or      a
2dcf 200f      jr      nz,$2de0
2dd1 7e        ld      a,(hl)
2dd2 b7        or      a
2dd3 2804      jr      z,$2dd9
2dd5 fe01      cp      $01
2dd7 2007      jr      nz,$2de0
2dd9 cd094a    call    $4a09
2ddc 09        add     hl,bc
2ddd 97        sub     a
2dde 1812      jr      $2df2
2de0 3e03      ld      a,$03
2de2 180e      jr      $2df2
2de4 dd214ebe  ld      ix,$be4e
2de8 cd0544    call    $4405
2deb 0e10      ld      c,$10
2ded cd0500    call    $0005
2df0 3e01      ld      a,$01
2df2 dde1      pop     ix
2df4 d1        pop     de
2df5 c1        pop     bc
2df6 c9        ret     

2df7 c5        push    bc
2df8 d5        push    de
2df9 e5        push    hl
2dfa dde5      push    ix
2dfc cd952e    call    $2e95
2dff 11252f    ld      de,$2f25
2e02 cda12e    call    $2ea1		Set DMA address to DE
2e05 119d27    ld      de,$279d
2e08 0e0f      ld      c,$0f
2e0a cd0500    call    $0005
2e0d feff      cp      $ff
2e0f 2004      jr      nz,$2e15
2e11 3e02      ld      a,$02
2e13 1806      jr      $2e1b
2e15 3e01      ld      a,$01
2e17 321a2d    ld      ($2d1a),a
2e1a 97        sub     a
2e1b dde1      pop     ix
2e1d e1        pop     hl
2e1e d1        pop     de
2e1f c1        pop     bc
2e20 c9        ret     

2e21 c5        push    bc
2e22 d5        push    de
2e23 e5        push    hl
2e24 01a52f    ld      bc,$2fa5
2e27 3a1a2d    ld      a,($2d1a)
2e2a fe01      cp      $01
2e2c 200f      jr      nz,$2e3d
2e2e 119d27    ld      de,$279d
2e31 21252f    ld      hl,$2f25
2e34 cd9e2d    call    $2d9e
2e37 fe01      cp      $01
2e39 2816      jr      z,$2e51
2e3b 1804      jr      $2e41
2e3d 2aa52f    ld      hl,($2fa5)
2e40 23        inc     hl
2e41 22a52f    ld      ($2fa5),hl
2e44 7c        ld      a,h
2e45 b8        cp      b
2e46 2002      jr      nz,$2e4a
2e48 7d        ld      a,l
2e49 b9        cp      c
2e4a 30e2      jr      nc,$2e2e
2e4c 7e        ld      a,(hl)
2e4d fe1a      cp      $1a
2e4f 28dd      jr      z,$2e2e
2e51 f5        push    af
2e52 cda92e    call    $2ea9		Set DMA address to default $0080
2e55 f1        pop     af
2e56 e1        pop     hl
2e57 d1        pop     de
2e58 c1        pop     bc
2e59 c9        ret     

2e5a e5        push    hl
2e5b c5        push    bc
2e5c 2aa52f    ld      hl,($2fa5)
2e5f 01242f    ld      bc,$2f24
2e62 b7        or      a
2e63 ed42      sbc     hl,bc
2e65 2808      jr      z,$2e6f
2e67 2aa52f    ld      hl,($2fa5)
2e6a 77        ld      (hl),a
2e6b 2b        dec     hl
2e6c 22a52f    ld      ($2fa5),hl
2e6f c1        pop     bc
2e70 e1        pop     hl
2e71 c9        ret     

2e72 cd952e    call    $2e95
2e75 cd8d26    call    $268d
2e78 329d27    ld      ($279d),a
2e7b 215631    ld      hl,$3156
2e7e 11a627    ld      de,$27a6
2e81 010300    ld      bc,$0003
2e84 edb0      ldir    
2e86 c9        ret     

2e87 c5        push    bc
2e88 fde5      push    iy
2e8a e1        pop     hl
2e8b 116c27    ld      de,$276c
2e8e 0e86      ld      c,$86
2e90 cd0500    call    $0005
2e93 c1        pop     bc
2e94 c9        ret     

2e95 fde5      push    iy
2e97 e1        pop     hl
2e98 119d27    ld      de,$279d
2e9b 0e86      ld      c,$86
2e9d cd0500    call    $0005
2ea0 c9        ret     

					Set DMA address to DE

2ea1 c5        push    bc
2ea2 0e1a      ld      c,$1a		Set DMA Address 
2ea4 cd0500    call    $0005		BDOS call
2ea7 c1        pop     bc
2ea8 c9        ret     

					Set DMA address to default $0080

2ea9 d5        push    de		
2eaa 118000    ld      de,$0080
2ead cda12e    call    $2ea1		Set DMA address to DE
2eb0 d1        pop     de
2eb1 c9        ret     

2eb2 dd219cbe  ld      ix,$be9c
2eb6 cdd72f    call    $2fd7
2eb9 b7        or      a
2eba 285b      jr      z,$2f17
2ebc 21a72f    ld      hl,$2fa7
2ebf cd7689    call    $8976
2ec2 dd21f1be  ld      ix,$bef1
2ec6 fd21182f  ld      iy,$2f18
2eca 0e0d      ld      c,$0d
2ecc cd9488    call    $8894
2ecf b7        or      a
2ed0 2845      jr      z,$2f17
2ed2 78        ld      a,b
2ed3 fe0d      cp      $0d
2ed5 3806      jr      c,$2edd
2ed7 dd2168be  ld      ix,$be68
2edb 182b      jr      $2f08
2edd fde5      push    iy
2edf e1        pop     hl
2ee0 117c27    ld      de,$277c
2ee3 0e86      ld      c,$86
2ee5 cd0500    call    $0005
2ee8 217c27    ld      hl,$277c
2eeb 112226    ld      de,$2622
2eee cd5c24    call    $245c
2ef1 3806      jr      c,$2ef9
2ef3 dd21c7be  ld      ix,$bec7
2ef7 180f      jr      $2f08
2ef9 116c27    ld      de,$276c
2efc 0e17      ld      c,$17
2efe cd0500    call    $0005
2f01 b7        or      a
2f02 2010      jr      nz,$2f14
2f04 dd217fbe  ld      ix,$be7f
2f08 04        inc     b
2f09 cd8b88    call    $888b
2f0c cd0544    call    $4405
2f0f cda885    call    $85a8
2f12 18ae      jr      $2ec2
2f14 cdc422    call    $22c4
2f17 c9        ret     

2f18 00        nop     
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
2f2e 00        nop     
2f2f 00        nop     
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
2f45 00        nop     
2f46 00        nop     
2f47 00        nop     
2f48 00        nop     
2f49 00        nop     
2f4a 00        nop     
2f4b 00        nop     
2f4c 00        nop     
2f4d 00        nop     
2f4e 00        nop     
2f4f 00        nop     
2f50 00        nop     
2f51 00        nop     
2f52 00        nop     
2f53 00        nop     
2f54 00        nop     
2f55 00        nop     
2f56 00        nop     
2f57 00        nop     
2f58 00        nop     
2f59 00        nop     
2f5a 00        nop     
2f5b 00        nop     
2f5c 00        nop     
2f5d 00        nop     
2f5e 00        nop     
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
2f72 00        nop     
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
2f8a 00        nop     
2f8b 00        nop     
2f8c 00        nop     
2f8d 00        nop     
2f8e 00        nop     
2f8f 00        nop     
2f90 00        nop     
2f91 00        nop     
2f92 00        nop     
2f93 00        nop     
2f94 00        nop     
2f95 00        nop     
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
2fa7 74        ld      (hl),h
2fa8 6f        ld      l,a
2fa9 2024      jr      nz,$2fcf
2fab c5        push    bc
2fac fde5      push    iy
2fae fd21182f  ld      iy,$2f18
2fb2 cd522a    call    $2a52
2fb5 47        ld      b,a
2fb6 04        inc     b
2fb7 fde5      push    iy
2fb9 dde1      pop     ix
2fbb fde1      pop     iy
2fbd cd5185    call    $8551
2fc0 c1        pop     bc
2fc1 c9        ret     

2fc2 dd2184bf  ld      ix,$bf84
2fc6 cdd72f    call    $2fd7
2fc9 b7        or      a
2fca 280a      jr      z,$2fd6
2fcc 0e13      ld      c,$13
2fce cd0500    call    $0005
2fd1 cdc422    call    $22c4
2fd4 3e01      ld      a,$01
2fd6 c9        ret     

2fd7 dde5      push    ix
2fd9 dd21c894  ld      ix,$94c8		94c8=end of WordMaster program
2fdd 216cba    ld      hl,$ba6c
2fe0 cd0284    call    $8402
2fe3 dde1      pop     ix
2fe5 b7        or      a
2fe6 281e      jr      z,$3006
2fe8 cd872e    call    $2e87
2feb cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
2fee 3014      jr      nc,$3004
2ff0 cdab2f    call    $2fab
2ff3 200f      jr      nz,$3004
2ff5 cd8b88    call    $888b
2ff8 dd2184bf  ld      ix,$bf84
2ffc cd0544    call    $4405
2fff cda885    call    $85a8
3002 18d3      jr      $2fd7
3004 3e01      ld      a,$01
3006 c9        ret     

3007 c5        push    bc
3008 d5        push    de
3009 e5        push    hl
300a 119d27    ld      de,$279d
300d 0e13      ld      c,$13
300f cd0500    call    $0005
3012 119d27    ld      de,$279d
3015 0e16      ld      c,$16
3017 cd0500    call    $0005
301a feff      cp      $ff
301c 280c      jr      z,$302a
301e 119d27    ld      de,$279d
3021 0e0f      ld      c,$0f
3023 cd0500    call    $0005
3026 feff      cp      $ff
3028 2001      jr      nz,$302b
302a 97        sub     a
302b e1        pop     hl
302c d1        pop     de
302d c1        pop     bc
302e c9        ret     

302f c5        push    bc
3030 d5        push    de
3031 cd722e    call    $2e72
3034 119d27    ld      de,$279d
3037 0e13      ld      c,$13
3039 cd0500    call    $0005
303c d1        pop     de
303d c1        pop     bc
303e c9        ret     

303f c5        push    bc
3040 d5        push    de
3041 e5        push    hl
3042 11252f    ld      de,$2f25
3045 cda12e    call    $2ea1		Set DMA address to DE
3048 01252f    ld      bc,$2f25
304b 2ae830    ld      hl,($30e8)
304e 7c        ld      a,h
304f b8        cp      b
3050 2002      jr      nz,$3054
3052 7d        ld      a,l
3053 b9        cp      c
3054 281d      jr      z,$3073
3056 ed43e830  ld      ($30e8),bc
305a 01a52f    ld      bc,$2fa5
305d 7c        ld      a,h
305e b8        cp      b
305f 2002      jr      nz,$3063
3061 7d        ld      a,l
3062 b9        cp      c
3063 3006      jr      nc,$306b
3065 3e1a      ld      a,$1a
3067 77        ld      (hl),a
3068 23        inc     hl
3069 18f2      jr      $305d
306b 119d27    ld      de,$279d
306e 0e15      ld      c,$15
3070 cd0500    call    $0005
3073 119d27    ld      de,$279d
3076 0e10      ld      c,$10
3078 cd0500    call    $0005
307b cda92e    call    $2ea9		Set DMA address to default $0080
307e e1        pop     hl
307f d1        pop     de
3080 c1        pop     bc
3081 c9        ret     

3082 cd952e    call    $2e95
3085 cd0730    call    $3007
3088 c9        ret     

3089 cd952e    call    $2e95
308c cd8d26    call    $268d
308f 329d27    ld      ($279d),a
3092 21a130    ld      hl,$30a1
3095 11a627    ld      de,$27a6
3098 010300    ld      bc,$0003
309b edb0      ldir    
309d cd0730    call    $3007
30a0 c9        ret     

30a1 50        ld      d,b
30a2 52        ld      d,d
30a3 54        ld      d,h
30a4 c5        push    bc
30a5 d5        push    de
30a6 e5        push    hl
30a7 32e730    ld      ($30e7),a
30aa 01a52f    ld      bc,$2fa5
30ad 11252f    ld      de,$2f25
30b0 cda12e    call    $2ea1		Set DMA address to DE
30b3 2ae830    ld      hl,($30e8)
30b6 3ae730    ld      a,($30e7)
30b9 77        ld      (hl),a
30ba 23        inc     hl
30bb 22e830    ld      ($30e8),hl
30be 7c        ld      a,h
30bf b8        cp      b
30c0 2002      jr      nz,$30c4
30c2 7d        ld      a,l
30c3 b9        cp      c
30c4 3814      jr      c,$30da
30c6 119d27    ld      de,$279d
30c9 0e15      ld      c,$15
30cb cd0500    call    $0005
30ce b7        or      a
30cf 2803      jr      z,$30d4
30d1 97        sub     a
30d2 180a      jr      $30de
30d4 21252f    ld      hl,$2f25
30d7 22e830    ld      ($30e8),hl
30da 3ae730    ld      a,($30e7)
30dd b7        or      a
30de f5        push    af
30df cda92e    call    $2ea9		Set DMA address to default $0080
30e2 f1        pop     af
30e3 e1        pop     hl
30e4 d1        pop     de
30e5 c1        pop     bc
30e6 c9        ret     

30e7 00        nop     
30e8 25        dec     h
30e9 2f        cpl     
30ea c5        push    bc
30eb d5        push    de
30ec dde5      push    ix
30ee c5        push    bc
30ef cd722e    call    $2e72
30f2 c1        pop     bc
30f3 fde5      push    iy
30f5 e1        pop     hl
30f6 48        ld      c,b
30f7 0600      ld      b,$00
30f9 09        add     hl,bc
30fa 36ff      ld      (hl),$ff
30fc e5        push    hl
30fd dd21b463  ld      ix,$63b4
3101 dd7e00    ld      a,(ix+$00)
3104 b7        or      a
3105 281c      jr      z,$3123
3107 41        ld      b,c
3108 cd1085    call    $8510
310b fe02      cp      $02
310d 2814      jr      z,$3123
310f f5        push    af
3110 e5        push    hl
3111 dde1      pop     ix
3113 06ff      ld      b,$ff
3115 cd2671    call    $7126
3118 280d      jr      z,$3127
311a f1        pop     af
311b b7        or      a
311c 2805      jr      z,$3123
311e cd5d71    call    $715d
3121 18e4      jr      $3107
3123 3eff      ld      a,$ff
3125 1801      jr      $3128
3127 f1        pop     af
3128 e1        pop     hl
3129 3600      ld      (hl),$00
312b dde1      pop     ix
312d d1        pop     de
312e c1        pop     bc
312f c9        ret     

3130 c5        push    bc
3131 d5        push    de
3132 e5        push    hl
3133 cd4931    call    $3149
3136 cdf62c    call    $2cf6
3139 e1        pop     hl
313a d1        pop     de
313b c1        pop     bc
313c c9        ret     

313d e5        push    hl
313e cd4931    call    $3149
3141 210000    ld      hl,$0000
3144 cda131    call    $31a1
3147 e1        pop     hl
3148 c9        ret     

3149 dde5      push    ix
314b dd215531  ld      ix,$3155
314f cd5a31    call    $315a
3152 dde1      pop     ix
3154 c9        ret     

3155 2e54      ld      l,$54
3157 52        ld      d,d
3158 4b        ld      c,e
3159 00        nop     
315a f5        push    af
315b c5        push    bc
315c d5        push    de
315d e5        push    hl
315e fde5      push    iy
3160 e1        pop     hl
3161 010b00    ld      bc,$000b
3164 97        sub     a
3165 edb1      cpir    
3167 2b        dec     hl
3168 54        ld      d,h
3169 5d        ld      e,l
316a dde5      push    ix
316c e1        pop     hl
316d 010500    ld      bc,$0005
3170 edb0      ldir    
3172 e1        pop     hl
3173 d1        pop     de
3174 c1        pop     bc
3175 f1        pop     af
3176 c9        ret     

3177 c5        push    bc
3178 d5        push    de
3179 e5        push    hl
317a 3a4c27    ld      a,($274c)
317d fe2d      cp      $2d
317f 2808      jr      z,$3189
3181 114b27    ld      de,$274b
3184 0e13      ld      c,$13
3186 cd0500    call    $0005
3189 e1        pop     hl
318a d1        pop     de
318b c1        pop     bc
318c c9        ret     

318d c5        push    bc
318e d5        push    de
318f 3a2b27    ld      a,($272b)
3192 fe2d      cp      $2d
3194 2808      jr      z,$319e
3196 112a27    ld      de,$272a
3199 0e13      ld      c,$13
319b cd0500    call    $0005
319e d1        pop     de
319f c1        pop     bc
31a0 c9        ret     

31a1 c5        push    bc
31a2 d5        push    de
31a3 e5        push    hl
31a4 e5        push    hl
31a5 fde5      push    iy
31a7 e1        pop     hl
31a8 cdfd85    call    $85fd
31ab cdf72d    call    $2df7
31ae e1        pop     hl
31af b7        or      a
31b0 c24832    jp      nz,$3248
31b3 7c        ld      a,h
31b4 b5        or      l
31b5 c4e943    call    nz,$43e9
31b8 0617      ld      b,$17
31ba 2601      ld      h,$01
31bc cd212e    call    $2e21
31bf 6f        ld      l,a
31c0 fe01      cp      $01
31c2 ca4e32    jp      z,$324e
31c5 fe0a      cp      $0a
31c7 280c      jr      z,$31d5
31c9 fe0d      cp      $0d
31cb 201a      jr      nz,$31e7
31cd cd212e    call    $2e21
31d0 fe0a      cp      $0a
31d2 c45a2e    call    nz,$2e5a
31d5 05        dec     b
31d6 2805      jr      z,$31dd
31d8 cd3002    call    $0230
31db 18dd      jr      $31ba
31dd cd8643    call    $4386
31e0 286f      jr      z,$3251
31e2 cd3002    call    $0230
31e5 18d1      jr      $31b8
31e7 fe60      cp      $60
31e9 2805      jr      z,$31f0
31eb cdb28c    call    $8cb2
31ee 3034      jr      nc,$3224
31f0 24        inc     h
31f1 7c        ld      a,h
31f2 fe51      cp      $51
31f4 3005      jr      nc,$31fb
31f6 cd5632    call    $3256
31f9 18c1      jr      $31bc
31fb 05        dec     b
31fc 2805      jr      z,$3203
31fe cd5632    call    $3256
3201 18b7      jr      $31ba
3203 1e1b      ld      e,$1b
3205 0e09      ld      c,$09
3207 cd0500    call    $0005
320a 1e5e      ld      e,$5e
320c cd0500    call    $0005
320f 1e31      ld      e,$31
3211 cd0500    call    $0005
3214 1e69      ld      e,$69
3216 cd0500    call    $0005
3219 5f        ld      e,a
321a cd0500    call    $0005
321d 1e1d      ld      e,$1d
321f cd0500    call    $0005
3222 18b9      jr      $31dd
3224 fe09      cp      $09
3226 2012      jr      nz,$323a
3228 3e08      ld      a,$08
322a 25        dec     h
322b 84        add     a,h
322c e6f8      and     $f8
322e 67        ld      h,a
322f 24        inc     h
3230 fe51      cp      $51
3232 d2ba31    jp      nc,$31ba
3235 cd5632    call    $3256
3238 1882      jr      $31bc
323a fe0c      cp      $0c
323c c2bc31    jp      nz,$31bc
323f cdfd03    call    $03fd
3242 cd3002    call    $0230
3245 c3ba31    jp      $31ba
3248 cd0544    call    $4405
324b 37        scf     
324c 1804      jr      $3252
324e cd6f43    call    $436f
3251 b7        or      a
3252 e1        pop     hl
3253 d1        pop     de
3254 c1        pop     bc
3255 c9        ret     

3256 5d        ld      e,l
3257 0e02      ld      c,$02
3259 cd0500    call    $0005
325c c9        ret     

325d f5        push    af
325e c5        push    bc
325f d5        push    de
3260 e5        push    hl
3261 219d27    ld      hl,$279d
3264 11bf32    ld      de,$32bf
3267 012100    ld      bc,$0021
326a edb0      ldir    
326c 21252f    ld      hl,$2f25
326f 11e032    ld      de,$32e0
3272 018000    ld      bc,$0080
3275 edb0      ldir    
3277 3a1a2d    ld      a,($2d1a)
327a 326033    ld      ($3360),a
327d 2aa52f    ld      hl,($2fa5)
3280 226133    ld      ($3361),hl
3283 2ae830    ld      hl,($30e8)
3286 226333    ld      ($3363),hl
3289 e1        pop     hl
328a d1        pop     de
328b c1        pop     bc
328c f1        pop     af
328d c9        ret     

328e f5        push    af
328f c5        push    bc
3290 d5        push    de
3291 e5        push    hl
3292 21bf32    ld      hl,$32bf
3295 119d27    ld      de,$279d
3298 012100    ld      bc,$0021
329b edb0      ldir    
329d 21e032    ld      hl,$32e0
32a0 11252f    ld      de,$2f25
32a3 018000    ld      bc,$0080
32a6 edb0      ldir    
32a8 3a6033    ld      a,($3360)
32ab 321a2d    ld      ($2d1a),a
32ae 2a6133    ld      hl,($3361)
32b1 22a52f    ld      ($2fa5),hl
32b4 2a6333    ld      hl,($3363)
32b7 22e830    ld      ($30e8),hl
32ba e1        pop     hl
32bb d1        pop     de
32bc c1        pop     bc
32bd f1        pop     af
32be c9        ret     

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
3306 00        nop     
3307 00        nop     
3308 00        nop     
3309 00        nop     
330a 00        nop     
330b 00        nop     
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
3365 fd21493a  ld      iy,$3a49
3369 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
336c cd5091    call    $9150
336f cd203c    call    $3c20
3372 280d      jr      z,$3381
3374 cde440    call    $40e4
3377 cd5091    call    $9150
337a fe01      cp      $01
337c caf635    jp      z,$35f6
337f 18ee      jr      $336f
3381 cd3c36    call    $363c
3384 c37f35    jp      $357f
3387 cd6a37    call    $376a
338a d2f635    jp      nc,$35f6
338d cd2b83    call    $832b
3390 47        ld      b,a
3391 cd974a    call    $4a97
3394 b8        cp      b
3395 d2a834    jp      nc,$34a8
3398 cdde42    call    $42de
339b fe20      cp      $20
339d c4c78e    call    nz,$8ec7
33a0 cd5091    call    $9150
33a3 fe0a      cp      $0a
33a5 c2ae33    jp      nz,$33ae
33a8 cdc78e    call    $8ec7
33ab c35e35    jp      $355e
33ae fe0d      cp      $0d
33b0 2808      jr      z,$33ba
33b2 fe20      cp      $20
33b4 2804      jr      z,$33ba
33b6 fe09      cp      $09
33b8 205a      jr      nz,$3414
33ba cd3c36    call    $363c
33bd cd6a37    call    $376a
33c0 d20236    jp      nc,$3602
33c3 cdde42    call    $42de
33c6 cd5091    call    $9150
33c9 fe20      cp      $20
33cb 280b      jr      z,$33d8
33cd fe09      cp      $09
33cf 2807      jr      z,$33d8
33d1 fe0d      cp      $0d
33d3 2803      jr      z,$33d8
33d5 cdc78e    call    $8ec7
33d8 cdc737    call    $37c7
33db cda44a    call    $4aa4
33de 47        ld      b,a
33df cdc43f    call    $3fc4
33e2 cd8937    call    $3789
33e5 10fb      djnz    $33e2
33e7 cdc737    call    $37c7
33ea cd5091    call    $9150
33ed cd3e11    call    $113e
33f0 cd203f    call    $3f20
33f3 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
33f6 cdd68a    call    $8ad6
33f9 fd21493a  ld      iy,$3a49
33fd cdc28a    call    $8ac2
3400 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
3403 cd5091    call    $9150
3406 fe0d      cp      $0d
3408 205a      jr      nz,$3464
340a 0601      ld      b,$01
340c cdfe3f    call    $3ffe
340f cd9137    call    $3791
3412 18ef      jr      $3403
3414 cd208f    call    $8f20
3417 fe2d      cp      $2d
3419 281c      jr      z,$3437
341b fe20      cp      $20
341d 2826      jr      z,$3445
341f fe09      cp      $09
3421 2822      jr      z,$3445
3423 fe0d      cp      $0d
3425 2804      jr      z,$342b
3427 fe0a      cp      $0a
3429 20e9      jr      nz,$3414
342b cdc442    call    $42c4
342e cdf336    call    $36f3
3431 cd9b37    call    $379b
3434 c39934    jp      $3499
3437 cdc78e    call    $8ec7
343a cd5838    call    $3858
343d cd8937    call    $3789
3440 cd208f    call    $8f20
3443 181c      jr      $3461
3445 cd2b83    call    $832b
3448 47        ld      b,a
3449 cd934a    call    $4a93
344c b8        cp      b
344d 30dc      jr      nc,$342b
344f cdde42    call    $42de
3452 cdc78e    call    $8ec7
3455 cd254a    call    $4a25
3458 2807      jr      z,$3461
345a cd6438    call    $3864
345d b7        or      a
345e ca0236    jp      z,$3602
3461 cd9b37    call    $379b
3464 cd1d4a    call    $4a1d
3467 2830      jr      z,$3499
3469 cda44a    call    $4aa4
346c 47        ld      b,a
346d cd0141    call    $4101
3470 10fb      djnz    $346d
3472 cd1037    call    $3710
3475 fe01      cp      $01
3477 280c      jr      z,$3485
3479 fe0c      cp      $0c
347b 2808      jr      z,$3485
347d fe0a      cp      $0a
347f 2804      jr      z,$3485
3481 fe0d      cp      $0d
3483 2005      jr      nz,$348a
3485 cde440    call    $40e4
3488 180f      jr      $3499
348a cdc440    call    $40c4
348d cd6636    call    $3666
3490 cda44a    call    $4aa4
3493 47        ld      b,a
3494 cde440    call    $40e4
3497 10fb      djnz    $3494
3499 cd6a37    call    $376a
349c d20236    jp      nc,$3602
349f cd934a    call    $4a93
34a2 cd1736    call    $3617
34a5 c38733    jp      $3387
34a8 cdc78e    call    $8ec7
34ab fe01      cp      $01
34ad ca0236    jp      z,$3602
34b0 fe20      cp      $20
34b2 2026      jr      nz,$34da
34b4 cd208f    call    $8f20
34b7 cd8291    call    $9182
34ba fe20      cp      $20
34bc 2016      jr      nz,$34d4
34be cd208f    call    $8f20
34c1 cd8291    call    $9182
34c4 cd3038    call    $3830
34c7 2805      jr      z,$34ce
34c9 cdc78e    call    $8ec7
34cc 1806      jr      $34d4
34ce cdc78e    call    $8ec7
34d1 cd4938    call    $3849
34d4 cdc78e    call    $8ec7
34d7 c38733    jp      $3387
34da fead      cp      $ad
34dc 2041      jr      nz,$351f
34de cd2b83    call    $832b
34e1 3d        dec     a
34e2 47        ld      b,a
34e3 cd974a    call    $4a97
34e6 90        sub     b
34e7 fe06      cp      $06
34e9 daa033    jp      c,$33a0
34ec cd4938    call    $3849
34ef cd5091    call    $9150
34f2 fe0d      cp      $0d
34f4 2804      jr      z,$34fa
34f6 fe0a      cp      $0a
34f8 201f      jr      nz,$3519
34fa cdc78e    call    $8ec7
34fd cd4938    call    $3849
3500 cda44a    call    $4aa4
3503 47        ld      b,a
3504 cdc78e    call    $8ec7
3507 fe0d      cp      $0d
3509 2809      jr      z,$3514
350b fe0a      cp      $0a
350d 2805      jr      z,$3514
350f cd208f    call    $8f20
3512 1805      jr      $3519
3514 cd4938    call    $3849
3517 10eb      djnz    $3504
3519 cd3c36    call    $363c
351c c38733    jp      $3387
351f fe09      cp      $09
3521 200a      jr      nz,$352d
3523 cd208f    call    $8f20
3526 3e20      ld      a,$20
3528 cdae92    call    $92ae
352b 1887      jr      $34b4
352d fe0d      cp      $0d
352f c24c35    jp      nz,$354c
3532 cd0e7d    call    $7d0e
3535 da0236    jp      c,$3602
3538 cd5091    call    $9150
353b cd203c    call    $3c20
353e 2019      jr      nz,$3559
3540 fe0c      cp      $0c
3542 204f      jr      nz,$3593
3544 cdde42    call    $42de
3547 cdc78e    call    $8ec7
354a 1812      jr      $355e
354c fe0a      cp      $0a
354e c28733    jp      nz,$3387
3551 cd5091    call    $9150
3554 cd203c    call    $3c20
3557 2805      jr      z,$355e
3559 cde440    call    $40e4
355c 18f3      jr      $3551
355e cd6a37    call    $376a
3561 d20236    jp      nc,$3602
3564 3e01      ld      a,$01
3566 cd4683    call    $8346
3569 cd3c36    call    $363c
356c cd3e83    call    $833e
356f 47        ld      b,a
3570 cda44a    call    $4aa4
3573 90        sub     b
3574 2809      jr      z,$357f
3576 3807      jr      c,$357f
3578 47        ld      b,a
3579 cdc43f    call    $3fc4
357c da0236    jp      c,$3602
357f cd6a37    call    $376a
3582 d20236    jp      nc,$3602
3585 cd934a    call    $4a93
3588 cd1736    call    $3617
358b cd0636    call    $3606
358e 3872      jr      c,$3602
3590 c38733    jp      $3387
3593 cd208f    call    $8f20
3596 cd8291    call    $9182
3599 fe2d      cp      $2d
359b 2008      jr      nz,$35a5
359d cdc78e    call    $8ec7
35a0 cd4938    call    $3849
35a3 1840      jr      $35e5
35a5 cd3038    call    $3830
35a8 2806      jr      z,$35b0
35aa cd5838    call    $3858
35ad cd8937    call    $3789
35b0 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
35b3 d5        push    de
35b4 e5        push    hl
35b5 cdc442    call    $42c4
35b8 cd6a37    call    $376a
35bb e1        pop     hl
35bc d1        pop     de
35bd f5        push    af
35be cd1e41    call    $411e
35c1 f1        pop     af
35c2 3805      jr      c,$35c9
35c4 cdc78e    call    $8ec7
35c7 1839      jr      $3602
35c9 cd5091    call    $9150
35cc 3e20      ld      a,$20
35ce cdae92    call    $92ae
35d1 cd6a37    call    $376a
35d4 302c      jr      nc,$3602
35d6 cdc78e    call    $8ec7
35d9 fe0d      cp      $0d
35db 2005      jr      nz,$35e2
35dd cd4938    call    $3849
35e0 18ef      jr      $35d1
35e2 cd208f    call    $8f20
35e5 cd2b83    call    $832b
35e8 47        ld      b,a
35e9 cd3c36    call    $363c
35ec cd2b83    call    $832b
35ef b8        cp      b
35f0 c4de42    call    nz,$42de
35f3 c38733    jp      $3387
35f6 cdde42    call    $42de
35f9 cdc78e    call    $8ec7
35fc cd3c36    call    $363c
35ff cddd3f    call    $3fdd
3602 cdd482    call    $82d4
3605 c9        ret     

3606 cd9b4a    call    $4a9b
3609 47        ld      b,a
360a b7        or      a
360b 2809      jr      z,$3616
360d cd5838    call    $3858
3610 cd8937    call    $3789
3613 10f8      djnz    $360d
3615 b7        or      a
3616 c9        ret     

3617 f5        push    af
3618 cd8291    call    $9182
361b f1        pop     af
361c b7        or      a
361d 281c      jr      z,$363b
361f 3d        dec     a
3620 d608      sub     $08
3622 380a      jr      c,$362e
3624 cd3738    call    $3837
3627 f5        push    af
3628 cd8937    call    $3789
362b f1        pop     af
362c 18f2      jr      $3620
362e c608      add     a,$08
3630 2809      jr      z,$363b
3632 47        ld      b,a
3633 cd5838    call    $3858
3636 cd8937    call    $3789
3639 10f8      djnz    $3633
363b c9        ret     

363c cd6a37    call    $376a
363f 3024      jr      nc,$3665
3641 cdc78e    call    $8ec7
3644 cd203c    call    $3c20
3647 20f3      jr      nz,$363c
3649 fe09      cp      $09
364b 2804      jr      z,$3651
364d fe20      cp      $20
364f 2005      jr      nz,$3656
3651 cd4938    call    $3849
3654 18e6      jr      $363c
3656 fe0d      cp      $0d
3658 28e2      jr      z,$363c
365a fe0c      cp      $0c
365c 28de      jr      z,$363c
365e fe0a      cp      $0a
3660 28da      jr      z,$363c
3662 cd208f    call    $8f20
3665 c9        ret     

3666 c5        push    bc
3667 cdde42    call    $42de
366a cdc78e    call    $8ec7
366d fe20      cp      $20
366f cc4938    call    z,$3849
3672 cd2b83    call    $832b
3675 3d        dec     a
3676 47        ld      b,a
3677 cd974a    call    $4a97
367a 90        sub     b
367b 2873      jr      z,$36f0
367d 3871      jr      c,$36f0
367f 47        ld      b,a
3680 cd3e83    call    $833e
3683 4f        ld      c,a
3684 3a483a    ld      a,($3a48)
3687 3c        inc     a
3688 32483a    ld      ($3a48),a
368b cb47      bit     0,a
368d 2836      jr      z,$36c5
368f cd5237    call    $3752
3692 cd208f    call    $8f20
3695 fe01      cp      $01
3697 2836      jr      z,$36cf
3699 fe0a      cp      $0a
369b 2832      jr      z,$36cf
369d fe0d      cp      $0d
369f 282e      jr      z,$36cf
36a1 cd8291    call    $9182
36a4 fe20      cp      $20
36a6 28ea      jr      z,$3692
36a8 fe09      cp      $09
36aa 28e6      jr      z,$3692
36ac fe01      cp      $01
36ae 2818      jr      z,$36c8
36b0 fe0a      cp      $0a
36b2 2814      jr      z,$36c8
36b4 fe0d      cp      $0d
36b6 2810      jr      z,$36c8
36b8 cd5091    call    $9150
36bb cd5838    call    $3858
36be cd8937    call    $3789
36c1 10cc      djnz    $368f
36c3 1825      jr      $36ea
36c5 cda440    call    $40a4
36c8 cd934a    call    $4a93
36cb fe01      cp      $01
36cd 2803      jr      z,$36d2
36cf cd4437    call    $3744
36d2 cd4437    call    $3744
36d5 fe01      cp      $01
36d7 2817      jr      z,$36f0
36d9 cd3e83    call    $833e
36dc b9        cp      c
36dd 20b0      jr      nz,$368f
36df cd8291    call    $9182
36e2 cd5838    call    $3858
36e5 cd8937    call    $3789
36e8 10e8      djnz    $36d2
36ea cdc440    call    $40c4
36ed 37        scf     
36ee 1801      jr      $36f1
36f0 b7        or      a
36f1 c1        pop     bc
36f2 c9        ret     

36f3 cdc78e    call    $8ec7
36f6 fe20      cp      $20
36f8 2812      jr      z,$370c
36fa fe09      cp      $09
36fc 280e      jr      z,$370c
36fe fe0d      cp      $0d
3700 280a      jr      z,$370c
3702 fe0a      cp      $0a
3704 2806      jr      z,$370c
3706 fe01      cp      $01
3708 2805      jr      z,$370f
370a 18e7      jr      $36f3
370c cd208f    call    $8f20
370f c9        ret     

3710 cd208f    call    $8f20
3713 fe01      cp      $01
3715 282c      jr      z,$3743
3717 fe0a      cp      $0a
3719 2828      jr      z,$3743
371b fe0d      cp      $0d
371d 2824      jr      z,$3743
371f fe09      cp      $09
3721 2804      jr      z,$3727
3723 fe20      cp      $20
3725 20e9      jr      nz,$3710
3727 cd8291    call    $9182
372a fe01      cp      $01
372c 2815      jr      z,$3743
372e fe0a      cp      $0a
3730 2811      jr      z,$3743
3732 fe0d      cp      $0d
3734 280d      jr      z,$3743
3736 fe09      cp      $09
3738 2804      jr      z,$373e
373a fe20      cp      $20
373c 2005      jr      nz,$3743
373e cd208f    call    $8f20
3741 18e4      jr      $3727
3743 c9        ret     

3744 c5        push    bc
3745 cdc442    call    $42c4
3748 fe01      cp      $01
374a 2804      jr      z,$3750
374c fe20      cp      $20
374e 20f5      jr      nz,$3745
3750 c1        pop     bc
3751 c9        ret     

3752 c5        push    bc
3753 cdde42    call    $42de
3756 fe01      cp      $01
3758 280e      jr      z,$3768
375a cdde42    call    $42de
375d fe01      cp      $01
375f 2807      jr      z,$3768
3761 fe20      cp      $20
3763 20f5      jr      nz,$375a
3765 cdc442    call    $42c4
3768 c1        pop     bc
3769 c9        ret     

376a d5        push    de
376b e5        push    hl
376c 214c3a    ld      hl,$3a4c
376f 11c394    ld      de,$94c3
3772 1a        ld      a,(de)
3773 be        cp      (hl)
3774 2010      jr      nz,$3786
3776 2b        dec     hl
3777 1b        dec     de
3778 1a        ld      a,(de)
3779 be        cp      (hl)
377a 200a      jr      nz,$3786
377c 2b        dec     hl
377d 1b        dec     de
377e 1a        ld      a,(de)
377f be        cp      (hl)
3780 2004      jr      nz,$3786
3782 2b        dec     hl
3783 1b        dec     de
3784 1a        ld      a,(de)
3785 be        cp      (hl)
3786 e1        pop     hl
3787 d1        pop     de
3788 c9        ret     

3789 fd21493a  ld      iy,$3a49
378d cd038b    call    $8b03
3790 c9        ret     

3791 e5        push    hl
3792 fd21493a  ld      iy,$3a49
3796 cd168b    call    $8b16
3799 e1        pop     hl
379a c9        ret     

379b cd5091    call    $9150
379e cdf737    call    $37f7
37a1 cda44a    call    $4aa4
37a4 47        ld      b,a
37a5 3e0d      ld      a,$0d
37a7 cdae92    call    $92ae
37aa 05        dec     b
37ab 2812      jr      z,$37bf
37ad cd8937    call    $3789
37b0 c5        push    bc
37b1 010100    ld      bc,$0001
37b4 11443a    ld      de,$3a44
37b7 cdca91    call    $91ca
37ba 380a      jr      c,$37c6
37bc c1        pop     bc
37bd 10ee      djnz    $37ad
37bf cdf737    call    $37f7
37c2 cd3c36    call    $363c
37c5 b7        or      a
37c6 c9        ret     

37c7 cd403c    call    $3c40
37ca 2814      jr      z,$37e0
37cc 010100    ld      bc,$0001
37cf 112f38    ld      de,$382f
37d2 cdca91    call    $91ca
37d5 cd8937    call    $3789
37d8 cd503c    call    $3c50
37db cd383c    call    $3c38
37de 1817      jr      $37f7
37e0 cd283c    call    $3c28
37e3 2812      jr      z,$37f7
37e5 010100    ld      bc,$0001
37e8 112e38    ld      de,$382e
37eb cdca91    call    $91ca
37ee cd8937    call    $3789
37f1 cd303c    call    $3c30
37f4 cd483c    call    $3c48
37f7 cde73b    call    $3be7
37fa 280c      jr      z,$3808
37fc 010100    ld      bc,$0001
37ff 112b38    ld      de,$382b
3802 cdca91    call    $91ca
3805 cd8937    call    $3789
3808 cddf3b    call    $3bdf
380b 280c      jr      z,$3819
380d 010100    ld      bc,$0001
3810 112c38    ld      de,$382c
3813 cdca91    call    $91ca
3816 cd8937    call    $3789
3819 cdf83b    call    $3bf8
381c 280c      jr      z,$382a
381e 010100    ld      bc,$0001
3821 112d38    ld      de,$382d
3824 cdca91    call    $91ca
3827 cd8937    call    $3789
382a c9        ret     

382b 81        add     a,c
382c 86        add     a,(hl)
382d 87        add     a,a
382e 82        add     a,d
382f 83        add     a,e
3830 21513a    ld      hl,$3a51
3833 cdc27e    call    $7ec2
3836 c9        ret     

3837 f5        push    af
3838 010100    ld      bc,$0001
383b 11463a    ld      de,$3a46
383e cdca91    call    $91ca
3841 3004      jr      nc,$3847
3843 f1        pop     af
3844 37        scf     
3845 1801      jr      $3848
3847 f1        pop     af
3848 c9        ret     

3849 c5        push    bc
384a cd208f    call    $8f20
384d 010100    ld      bc,$0001
3850 cd3992    call    $9239
3853 cd9137    call    $3791
3856 c1        pop     bc
3857 c9        ret     

3858 c5        push    bc
3859 010100    ld      bc,$0001
385c 11453a    ld      de,$3a45
385f cdca91    call    $91ca
3862 c1        pop     bc
3863 c9        ret     

3864 c5        push    bc
3865 d5        push    de
3866 e5        push    hl
3867 dde5      push    ix
3869 fde5      push    iy
386b cd2b83    call    $832b
386e 47        ld      b,a
386f cd974a    call    $4a97
3872 90        sub     b
3873 fe06      cp      $06
3875 daff38    jp      c,$38ff
3878 cdc442    call    $42c4
387b cd1a03    call    $031a
387e cdf336    call    $36f3
3881 cdd482    call    $82d4
3884 cd7d7a    call    $7a7d
3887 cd208f    call    $8f20
388a cd1037    call    $3710
388d cdc442    call    $42c4
3890 dd210939  ld      ix,$3909
3894 cd2744    call    $4427
3897 cd6482    call    $8264
389a cdec7c    call    $7cec
389d feeb      cp      $eb
389f 200c      jr      nz,$38ad
38a1 dd21e4bf  ld      ix,$bfe4
38a5 cd9d43    call    $439d
38a8 cd6f43    call    $436f
38ab 18d1      jr      $387e
38ad fe1b      cp      $1b
38af 2009      jr      nz,$38ba
38b1 cd1037    call    $3710
38b4 cd6888    call    $8868
38b7 97        sub     a
38b8 183f      jr      $38f9
38ba fe0d      cp      $0d
38bc 2007      jr      nz,$38c5
38be cd1037    call    $3710
38c1 3e01      ld      a,$01
38c3 1834      jr      $38f9
38c5 fe2d      cp      $2d
38c7 281c      jr      z,$38e5
38c9 fe08      cp      $08
38cb 2005      jr      nz,$38d2
38cd cd208f    call    $8f20
38d0 18c5      jr      $3897
38d2 fe0c      cp      $0c
38d4 20c1      jr      nz,$3897
38d6 cd974a    call    $4a97
38d9 47        ld      b,a
38da cd2b83    call    $832b
38dd b8        cp      b
38de 30b7      jr      nc,$3897
38e0 cdc78e    call    $8ec7
38e3 18b2      jr      $3897
38e5 110739    ld      de,$3907
38e8 010200    ld      bc,$0002
38eb cdca91    call    $91ca
38ee cd208f    call    $8f20
38f1 cd8937    call    $3789
38f4 cd8937    call    $3789
38f7 3e01      ld      a,$01
38f9 cdb703    call    $03b7
38fc cd2c03    call    $032c
38ff fde1      pop     iy
3901 dde1      pop     ix
3903 e1        pop     hl
3904 d1        pop     de
3905 c1        pop     bc
3906 c9        ret     

3907 ad        xor     l
3908 2050      jr      nz,$395a
390a 6c        ld      l,h
390b 65        ld      h,l
390c 61        ld      h,c
390d 73        ld      (hl),e
390e 65        ld      h,l
390f 206d      jr      nz,$397e
3911 6f        ld      l,a
3912 76        halt    
3913 65        ld      h,l
3914 2063      jr      nz,$3979
3916 75        ld      (hl),l
3917 72        ld      (hl),d
3918 73        ld      (hl),e
3919 6f        ld      l,a
391a 72        ld      (hl),d
391b 2074      jr      nz,$3991
391d 6f        ld      l,a
391e 2064      jr      nz,$3984
3920 65        ld      h,l
3921 73        ld      (hl),e
3922 69        ld      l,c
3923 72        ld      (hl),d
3924 65        ld      h,l
3925 64        ld      h,h
3926 206c      jr      nz,$3994
3928 6f        ld      l,a
3929 63        ld      h,e
392a 61        ld      h,c
392b 74        ld      (hl),h
392c 69        ld      l,c
392d 6f        ld      l,a
392e 6e        ld      l,(hl)
392f 2061      jr      nz,$3992
3931 6e        ld      l,(hl)
3932 64        ld      h,h
3933 2070      jr      nz,$39a5
3935 72        ld      (hl),d
3936 65        ld      h,l
3937 73        ld      (hl),e
3938 73        ld      (hl),e
3939 2074      jr      nz,$39af
393b 68        ld      l,b
393c 65        ld      h,l
393d 2068      jr      nz,$39a7
393f 79        ld      a,c
3940 70        ld      (hl),b
3941 68        ld      l,b
3942 65        ld      h,l
3943 6e        ld      l,(hl)
3944 206b      jr      nz,$39b1
3946 65        ld      h,l
3947 79        ld      a,c
3948 24        inc     h
3949 c5        push    bc
394a fde5      push    iy
394c fd21493a  ld      iy,$3a49
3950 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
3953 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
3956 cda440    call    $40a4
3959 cd5091    call    $9150
395c fe0c      cp      $0c
395e 281a      jr      z,$397a
3960 cd203c    call    $3c20
3963 2015      jr      nz,$397a
3965 cdde42    call    $42de
3968 cd5091    call    $9150
396b fe0a      cp      $0a
396d 2008      jr      nz,$3977
396f cd8839    call    $3988
3972 d40636    call    nc,$3606
3975 1803      jr      $397a
3977 cd8839    call    $3988
397a f5        push    af
397b cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
397e cd1e41    call    $411e
3981 f1        pop     af
3982 1800      jr      $3984
3984 fde1      pop     iy
3986 c1        pop     bc
3987 c9        ret     

3988 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
398b cd1e41    call    $411e
398e cda440    call    $40a4
3991 cd3c36    call    $363c
3994 cd934a    call    $4a93
3997 cd1736    call    $3617
399a c9        ret     

399b fd21493a  ld      iy,$3a49
399f cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
39a2 cda440    call    $40a4
39a5 cd0e7d    call    $7d0e
39a8 3845      jr      c,$39ef
39aa 2ab894    ld      hl,($94b8)
39ad 7e        ld      a,(hl)
39ae fe8b      cp      $8b
39b0 2833      jr      z,$39e5
39b2 3a433a    ld      a,($3a43)
39b5 b7        or      a
39b6 281e      jr      z,$39d6
39b8 47        ld      b,a
39b9 cdde42    call    $42de
39bc cd5091    call    $9150
39bf fe0a      cp      $0a
39c1 200a      jr      nz,$39cd
39c3 cdc442    call    $42c4
39c6 cd9b4a    call    $4a9b
39c9 80        add     a,b
39ca 47        ld      b,a
39cb 1803      jr      $39d0
39cd cdc442    call    $42c4
39d0 cd2b83    call    $832b
39d3 b8        cp      b
39d4 200f      jr      nz,$39e5
39d6 cda440    call    $40a4
39d9 010100    ld      bc,$0001
39dc 11f039    ld      de,$39f0
39df cdca91    call    $91ca
39e2 cd8937    call    $3789
39e5 cde440    call    $40e4
39e8 e5        push    hl
39e9 cd6a37    call    $376a
39ec e1        pop     hl
39ed 38b6      jr      c,$39a5
39ef c9        ret     

39f0 8b        adc     a,e
39f1 fd21493a  ld      iy,$3a49
39f5 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
39f8 cda440    call    $40a4
39fb cd0e7d    call    $7d0e
39fe 3842      jr      c,$3a42
3a00 2ab894    ld      hl,($94b8)
3a03 7e        ld      a,(hl)
3a04 fe8b      cp      $8b
3a06 2030      jr      nz,$3a38
3a08 3a433a    ld      a,($3a43)
3a0b b7        or      a
3a0c 281e      jr      z,$3a2c
3a0e 47        ld      b,a
3a0f cdde42    call    $42de
3a12 cd5091    call    $9150
3a15 fe0a      cp      $0a
3a17 200a      jr      nz,$3a23
3a19 cdc442    call    $42c4
3a1c cd9b4a    call    $4a9b
3a1f 80        add     a,b
3a20 47        ld      b,a
3a21 1803      jr      $3a26
3a23 cdc442    call    $42c4
3a26 cd2b83    call    $832b
3a29 b8        cp      b
3a2a 200c      jr      nz,$3a38
3a2c cda440    call    $40a4
3a2f 010100    ld      bc,$0001
3a32 cd3992    call    $9239
3a35 cd9137    call    $3791
3a38 cde440    call    $40e4
3a3b e5        push    hl
3a3c cd6a37    call    $376a
3a3f e1        pop     hl
3a40 38b9      jr      c,$39fb
3a42 c9        ret     

3a43 00        nop     
3a44 0d        dec     c
3a45 2009      jr      nz,$3a50
3a47 010000    ld      bc,$0000
3a4a 00        nop     
3a4b 00        nop     
3a4c 00        nop     
3a4d 00        nop     
3a4e 00        nop     
3a4f 00        nop     
3a50 00        nop     
3a51 2e3f      ld      l,$3f
3a53 213a00    ld      hl,$003a

3a56 e5        push    hl		Carry=BIT4 from flags at 3c98
3a57 21983c    ld      hl,$3c98
3a5a cb66      bit     4,(hl)
3a5c 2803      jr      z,$3a61
3a5e 37        scf     
3a5f 1801      jr      $3a62
3a61 b7        or      a
3a62 e1        pop     hl
3a63 c9        ret     

3a64 e5        push    hl		Set BIT4 flag at 3c98
3a65 21983c    ld      hl,$3c98
3a68 cbe6      set     4,(hl)
3a6a e1        pop     hl
3a6b c9        ret     

3a6c e5        push    hl		reset BIT4 flag at 3c98
3a6d 21983c    ld      hl,$3c98
3a70 cba6      res     4,(hl)
3a72 e1        pop     hl
3a73 c9        ret     

3a74 e5        push    hl		Zero flag=BIT5 from flags at 3c98
3a75 21983c    ld      hl,$3c98
3a78 cb6e      bit     5,(hl)
3a7a e1        pop     hl
3a7b c9        ret     

3a7c e5        push    hl
3a7d dde5      push    ix
3a7f dd218f3a  ld      ix,$3a8f
3a83 cd2744    call    $4427
3a86 21983c    ld      hl,$3c98
3a89 cbee      set     5,(hl)
3a8b dde1      pop     ix
3a8d e1        pop     hl
3a8e c9        ret     

3a8f 43        ld      b,e
3a90 68        ld      l,b
3a91 61        ld      h,c
3a92 72        ld      (hl),d
3a93 61        ld      h,c
3a94 63        ld      h,e
3a95 74        ld      (hl),h
3a96 65        ld      h,l
3a97 72        ld      (hl),d
3a98 73        ld      (hl),e
3a99 2074      jr      nz,$3b0f
3a9b 79        ld      a,c
3a9c 70        ld      (hl),b
3a9d 65        ld      h,l
3a9e 64        ld      h,h
3a9f 2070      jr      nz,$3b11
3aa1 75        ld      (hl),l
3aa2 73        ld      (hl),e
3aa3 68        ld      l,b
3aa4 2072      jr      nz,$3b18
3aa6 65        ld      h,l
3aa7 73        ld      (hl),e
3aa8 74        ld      (hl),h
3aa9 206f      jr      nz,$3b1a
3aab 66        ld      h,(hl)
3aac 206c      jr      nz,$3b1a
3aae 69        ld      l,c
3aaf 6e        ld      l,(hl)
3ab0 65        ld      h,l
3ab1 2072      jr      nz,$3b25
3ab3 69        ld      l,c
3ab4 67        ld      h,a
3ab5 68        ld      l,b
3ab6 74        ld      (hl),h
3ab7 2e20      ld      l,$20
3ab9 2050      jr      nz,$3b0b
3abb 72        ld      (hl),d
3abc 65        ld      h,l
3abd 73        ld      (hl),e
3abe 73        ld      (hl),e
3abf 2049      jr      nz,$3b0a
3ac1 4e        ld      c,(hl)
3ac2 53        ld      d,e
3ac3 2043      jr      nz,$3b08
3ac5 48        ld      c,b
3ac6 41        ld      b,c
3ac7 52        ld      d,d
3ac8 206b      jr      nz,$3b35
3aca 65        ld      h,l
3acb 79        ld      a,c
3acc 2061      jr      nz,$3b2f
3ace 67        ld      h,a
3acf 61        ld      h,c
3ad0 69        ld      l,c
3ad1 6e        ld      l,(hl)
3ad2 2077      jr      nz,$3b4b
3ad4 68        ld      l,b
3ad5 65        ld      h,l
3ad6 6e        ld      l,(hl)
3ad7 2064      jr      nz,$3b3d
3ad9 6f        ld      l,a
3ada 6e        ld      l,(hl)
3adb 65        ld      h,l
3adc 2e24      ld      l,$24
3ade f5        push    af
3adf e5        push    hl
3ae0 21983c    ld      hl,$3c98
3ae3 cb6e      bit     5,(hl)
3ae5 2805      jr      z,$3aec
3ae7 cbae      res     5,(hl)
3ae9 cdb703    call    $03b7
3aec e1        pop     hl
3aed f1        pop     af
3aee c9        ret     

3aef e5        push    hl	 	Zero flag=BIT0 from flags at 3c98
3af0 21983c    ld      hl,$3c98
3af3 cb46      bit     0,(hl)
3af5 e1        pop     hl
3af6 c9        ret     

3af7 e5        push    hl		Set BIT0 flag at 3c98
3af8 21983c    ld      hl,$3c98
3afb cbc6      set     0,(hl)
3afd e1        pop     hl
3afe c9        ret     

3aff e5        push    hl		Set BIT1 if BIT2 clear into flag at 3c98
3b00 21983c    ld      hl,$3c98
3b03 cb56      bit     2,(hl)
3b05 2002      jr      nz,$3b09
3b07 cb4e      bit     1,(hl)
3b09 e1        pop     hl
3b0a c9        ret     

3b0b e5        push    hl
3b0c 21983c    ld      hl,$3c98
3b0f cbd6      set     2,(hl)
3b11 e1        pop     hl
3b12 c9        ret     

3b13 e5        push    hl
3b14 21983c    ld      hl,$3c98
3b17 cb96      res     2,(hl)
3b19 e1        pop     hl
3b1a c9        ret     

3b1b e5        push    hl
3b1c 21983c    ld      hl,$3c98
3b1f cbce      set     1,(hl)
3b21 e1        pop     hl
3b22 c9        ret     

3b23 f5        push    af
3b24 3a983c    ld      a,($3c98)
3b27 e6fc      and     $fc
3b29 32983c    ld      ($3c98),a
3b2c f1        pop     af
3b2d c9        ret     

3b2e f5        push    af
3b2f 3a983c    ld      a,($3c98)
3b32 e6f7      and     $f7
3b34 32983c    ld      ($3c98),a
3b37 f1        pop     af
3b38 c9        ret     

3b39 e5        push    hl		Zero flag=BIT7 from flags at 3c98
3b3a 21983c    ld      hl,$3c98
3b3d cb7e      bit     7,(hl)
3b3f e1        pop     hl
3b40 c9        ret     

3b41 e5        push    hl
3b42 21983c    ld      hl,$3c98
3b45 cbfe      set     7,(hl)
3b47 e1        pop     hl
3b48 c9        ret     

3b49 e5        push    hl
3b4a 21983c    ld      hl,$3c98
3b4d cbbe      res     7,(hl)
3b4f e1        pop     hl
3b50 c9        ret     

3b51 e5        push    hl
3b52 21993c    ld      hl,$3c99
3b55 cb46      bit     0,(hl)
3b57 e1        pop     hl
3b58 c9        ret     

3b59 e5        push    hl
3b5a 21993c    ld      hl,$3c99
3b5d cbc6      set     0,(hl)
3b5f e1        pop     hl
3b60 c9        ret     

3b61 e5        push    hl
3b62 21993c    ld      hl,$3c99
3b65 cb86      res     0,(hl)
3b67 e1        pop     hl
3b68 c9        ret     

3b69 e5        push    hl
3b6a 21993c    ld      hl,$3c99
3b6d cb4e      bit     1,(hl)
3b6f e1        pop     hl
3b70 c9        ret     

3b71 e5        push    hl
3b72 21993c    ld      hl,$3c99
3b75 cbce      set     1,(hl)
3b77 e1        pop     hl
3b78 c9        ret     

3b79 e5        push    hl
3b7a 21993c    ld      hl,$3c99
3b7d cb8e      res     1,(hl)
3b7f e1        pop     hl
3b80 c9        ret     

3b81 e5        push    hl
3b82 21983c    ld      hl,$3c98
3b85 cb76      bit     6,(hl)
3b87 e1        pop     hl
3b88 c9        ret     

3b89 e5        push    hl
3b8a 21983c    ld      hl,$3c98
3b8d cbf6      set     6,(hl)
3b8f e1        pop     hl
3b90 c9        ret     

3b91 e5        push    hl
3b92 21993c    ld      hl,$3c99
3b95 cb56      bit     2,(hl)
3b97 e1        pop     hl
3b98 c9        ret     

3b99 e5        push    hl
3b9a 21993c    ld      hl,$3c99
3b9d cbd6      set     2,(hl)
3b9f e1        pop     hl
3ba0 c9        ret     

3ba1 e5        push    hl
3ba2 21993c    ld      hl,$3c99
3ba5 cb96      res     2,(hl)
3ba7 e1        pop     hl
3ba8 c9        ret     

3ba9 e5        push    hl
3baa 21983c    ld      hl,$3c98
3bad cb8e      res     1,(hl)
3baf cbd6      set     2,(hl)
3bb1 cbae      res     5,(hl)
3bb3 cbbe      res     7,(hl)
3bb5 23        inc     hl
3bb6 cb86      res     0,(hl)
3bb8 cb96      res     2,(hl)
3bba cb9e      res     3,(hl)
3bbc cba6      res     4,(hl)
3bbe cbae      res     5,(hl)
3bc0 cbbe      res     7,(hl)
3bc2 23        inc     hl
3bc3 cb86      res     0,(hl)
3bc5 cb8e      res     1,(hl)
3bc7 cb96      res     2,(hl)
3bc9 cb9e      res     3,(hl)
3bcb e1        pop     hl
3bcc c9        ret     

3bcd 3a993c    ld      a,($3c99)
3bd0 ee08      xor     $08
3bd2 32993c    ld      ($3c99),a
3bd5 c9        ret     

3bd6 3a993c    ld      a,($3c99)
3bd9 ee10      xor     $10
3bdb 32993c    ld      ($3c99),a
3bde c9        ret     

3bdf e5        push    hl
3be0 21993c    ld      hl,$3c99
3be3 cb5e      bit     3,(hl)
3be5 e1        pop     hl
3be6 c9        ret     

3be7 e5        push    hl
3be8 21993c    ld      hl,$3c99
3beb cb66      bit     4,(hl)
3bed e1        pop     hl
3bee c9        ret     

3bef 3a993c    ld      a,($3c99)
3bf2 ee20      xor     $20
3bf4 32993c    ld      ($3c99),a
3bf7 c9        ret     

3bf8 e5        push    hl
3bf9 21993c    ld      hl,$3c99
3bfc cb6e      bit     5,(hl)
3bfe e1        pop     hl
3bff c9        ret     

3c00 e5        push    hl
3c01 21993c    ld      hl,$3c99
3c04 cb76      bit     6,(hl)
3c06 e1        pop     hl
3c07 c9        ret     

3c08 e5        push    hl
3c09 21993c    ld      hl,$3c99
3c0c cbf6      set     6,(hl)
3c0e e1        pop     hl
3c0f c9        ret     

3c10 e5        push    hl
3c11 21993c    ld      hl,$3c99
3c14 cbfe      set     7,(hl)
3c16 e1        pop     hl
3c17 c9        ret     

3c18 e5        push    hl
3c19 21993c    ld      hl,$3c99
3c1c cbbe      res     7,(hl)
3c1e e1        pop     hl
3c1f c9        ret     

3c20 e5        push    hl
3c21 21993c    ld      hl,$3c99
3c24 cb7e      bit     7,(hl)
3c26 e1        pop     hl
3c27 c9        ret     

3c28 e5        push    hl
3c29 219a3c    ld      hl,$3c9a
3c2c cb46      bit     0,(hl)
3c2e e1        pop     hl
3c2f c9        ret     

3c30 e5        push    hl
3c31 219a3c    ld      hl,$3c9a
3c34 cb86      res     0,(hl)
3c36 e1        pop     hl
3c37 c9        ret     

3c38 e5        push    hl
3c39 219a3c    ld      hl,$3c9a
3c3c cbc6      set     0,(hl)
3c3e e1        pop     hl
3c3f c9        ret     

3c40 e5        push    hl
3c41 219a3c    ld      hl,$3c9a
3c44 cb4e      bit     1,(hl)
3c46 e1        pop     hl
3c47 c9        ret     

3c48 e5        push    hl
3c49 219a3c    ld      hl,$3c9a
3c4c cbce      set     1,(hl)
3c4e e1        pop     hl
3c4f c9        ret     

3c50 e5        push    hl
3c51 219a3c    ld      hl,$3c9a
3c54 cb8e      res     1,(hl)
3c56 e1        pop     hl
3c57 c9        ret     

3c58 e5        push    hl
3c59 219a3c    ld      hl,$3c9a
3c5c cb56      bit     2,(hl)
3c5e e1        pop     hl
3c5f c9        ret     

3c60 e5        push    hl
3c61 219a3c    ld      hl,$3c9a
3c64 cbd6      set     2,(hl)
3c66 e1        pop     hl
3c67 c9        ret     

3c68 e5        push    hl
3c69 219a3c    ld      hl,$3c9a
3c6c cb96      res     2,(hl)
3c6e e1        pop     hl
3c6f c9        ret     

3c70 e5        push    hl
3c71 219a3c    ld      hl,$3c9a
3c74 cb5e      bit     3,(hl)
3c76 e1        pop     hl
3c77 c9        ret     

3c78 e5        push    hl		Set BIT3 flag at 3c9a
3c79 219a3c    ld      hl,$3c9a
3c7c cbde      set     3,(hl)
3c7e e1        pop     hl
3c7f c9        ret     

3c80 e5        push    hl		Reset BIT3 flag at 3c9a
3c81 219a3c    ld      hl,$3c9a
3c84 cb9e      res     3,(hl)
3c86 e1        pop     hl
3c87 c9        ret     

3c88 e5        push    hl		Zero flag=BIT4 from flags at 3c9a
3c89 219a3c    ld      hl,$3c9a
3c8c cb66      bit     4,(hl)
3c8e e1        pop     hl
3c8f c9        ret     

3c90 e5        push    hl		Set BIT4 flag at 3c9a
3c91 219a3c    ld      hl,$3c9a
3c94 cbe6      set     4,(hl)
3c96 e1        pop     hl
3c97 c9        ret     

3c98 00        nop     
3c99 00        nop     
3c9a 00        nop     
3c9b cd393b    call    $3a6c		Reset BIT4 flag at 3c98
3c9e 2005      jr      nz,$3ca5
3ca0 cdd85f    call    $5fd8
3ca3 1849      jr      $3cee
3ca5 cd723d    call    $3d72
3ca8 cddd5e    call    $5edd
3cab cd1e41    call    $411e
3cae fd21fc5f  ld      iy,$5ffc
3cb2 cd5091    call    $9150
3cb5 cda03d    call    $3da0
3cb8 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
3cbb cdec8a    call    $8aec
3cbe 301f      jr      nc,$3cdf
3cc0 cdc78e    call    $8ec7
3cc3 fe0d      cp      $0d
3cc5 2804      jr      z,$3ccb
3cc7 fe0a      cp      $0a
3cc9 20ed      jr      nz,$3cb8
3ccb cd208f    call    $8f20
3cce cd8291    call    $9182
3cd1 cdc03d    call    $3dc0
3cd4 cdc442    call    $42c4
3cd7 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
3cda cdec8a    call    $8aec
3cdd 38d6      jr      c,$3cb5
3cdf cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
3ce2 cd1e41    call    $411e
3ce5 cd8291    call    $9182
3ce8 cdc03d    call    $3dc0
3ceb cd953d    call    $3d95
3cee c9        ret     

3cef cd723d    call    $3d72
3cf2 cd5091    call    $9150
3cf5 fe21      cp      $21
3cf7 3804      jr      c,$3cfd
3cf9 fe7f      cp      $7f
3cfb 382c      jr      c,$3d29
3cfd cd8291    call    $9182
3d00 fe21      cp      $21
3d02 381b      jr      c,$3d1f
3d04 fe7f      cp      $7f
3d06 3017      jr      nc,$3d1f
3d08 cd208f    call    $8f20
3d0b 3ad73d    ld      a,($3dd7)
3d0e 4f        ld      c,a
3d0f cd8f3e    call    $3e8f
3d12 2815      jr      z,$3d29
3d14 cd223e    call    $3e22
3d17 cdf336    call    $36f3
3d1a cd5091    call    $9150
3d1d 181f      jr      $3d3e
3d1f dd21c7bf  ld      ix,$bfc7
3d23 cd0544    call    $4405
3d26 37        scf     
3d27 1816      jr      $3d3f
3d29 cd1037    call    $3710
3d2c cd403d    call    $3d40
3d2f d4c442    call    nc,$42c4
3d32 cda03d    call    $3da0
3d35 cdf336    call    $36f3
3d38 cd5091    call    $9150
3d3b cdce3d    call    $3dce
3d3e b7        or      a
3d3f c9        ret     

3d40 fe01      cp      $01
3d42 2803      jr      z,$3d47
3d44 b7        or      a
3d45 1806      jr      $3d4d
3d47 cd5091    call    $9150
3d4a cd988c    call    $8c98
3d4d c9        ret     

3d4e cd723d    call    $3d72
3d51 cd5091    call    $9150
3d54 cdb28c    call    $8cb2
3d57 3004      jr      nc,$3d5d
3d59 fe20      cp      $20
3d5b 200a      jr      nz,$3d67
3d5d dd21d3bf  ld      ix,$bfd3
3d61 cd0544    call    $4405
3d64 37        scf     
3d65 180a      jr      $3d71
3d67 cda03d    call    $3da0
3d6a cdc78e    call    $8ec7
3d6d cdce3d    call    $3dce
3d70 b7        or      a
3d71 c9        ret     

3d72 32d73d    ld      ($3dd7),a
3d75 fe82      cp      $82
3d77 2004      jr      nz,$3d7d
3d79 3e83      ld      a,$83
3d7b 1806      jr      $3d83
3d7d fe83      cp      $83
3d7f 2002      jr      nz,$3d83
3d81 3e82      ld      a,$82
3d83 32d83d    ld      ($3dd8),a
3d86 97        sub     a
3d87 32d63d    ld      ($3dd6),a
3d8a cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
3d8d fd21d93d  ld      iy,$3dd9
3d91 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
3d94 c9        ret     

3d95 fd21d93d  ld      iy,$3dd9
3d99 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
3d9c cd1e41    call    $411e
3d9f c9        ret     

3da0 11d73d    ld      de,$3dd7
3da3 1a        ld      a,(de)
3da4 4f        ld      c,a
3da5 cd8f3e    call    $3e8f
3da8 c0        ret     nz

3da9 3e01      ld      a,$01
3dab 32d63d    ld      ($3dd6),a
3dae fde5      push    iy
3db0 010100    ld      bc,$0001
3db3 cdca91    call    $91ca
3db6 fd21d93d  ld      iy,$3dd9
3dba cd175f    call    $5f17
3dbd fde1      pop     iy
3dbf c9        ret     

3dc0 3ad63d    ld      a,($3dd6)
3dc3 b7        or      a
3dc4 c8        ret     z

3dc5 97        sub     a
3dc6 32d63d    ld      ($3dd6),a
3dc9 11d83d    ld      de,$3dd8
3dcc 18e0      jr      $3dae
3dce cdc03d    call    $3dc0
3dd1 cd953d    call    $3d95
3dd4 b7        or      a
3dd5 c9        ret     

3dd6 00        nop     
3dd7 00        nop     
3dd8 00        nop     
3dd9 00        nop     
3dda 00        nop     
3ddb 00        nop     
3ddc 00        nop     
3ddd dde5      push    ix
3ddf dd21213e  ld      ix,$3e21
3de3 97        sub     a
3de4 dd7700    ld      (ix+$00),a
3de7 3e81      ld      a,$81
3de9 cd223e    call    $3e22
3dec 3803      jr      c,$3df1
3dee dd3400    inc     (ix+$00)
3df1 3e86      ld      a,$86
3df3 cd223e    call    $3e22
3df6 3803      jr      c,$3dfb
3df8 dd3400    inc     (ix+$00)
3dfb 3e87      ld      a,$87
3dfd cd223e    call    $3e22
3e00 3803      jr      c,$3e05
3e02 dd3400    inc     (ix+$00)
3e05 3e83      ld      a,$83
3e07 cd223e    call    $3e22
3e0a 3803      jr      c,$3e0f
3e0c dd3400    inc     (ix+$00)
3e0f 3e82      ld      a,$82
3e11 cd223e    call    $3e22
3e14 3803      jr      c,$3e19
3e16 dd3400    inc     (ix+$00)
3e19 dd7e00    ld      a,(ix+$00)
3e1c d601      sub     $01
3e1e dde1      pop     ix
3e20 c9        ret     

3e21 00        nop     
3e22 c5        push    bc
3e23 d5        push    de
3e24 e5        push    hl
3e25 fde5      push    iy
3e27 4f        ld      c,a
3e28 cd8f3e    call    $3e8f
3e2b 2806      jr      z,$3e33
3e2d cd3e3e    call    $3e3e
3e30 b7        or      a
3e31 1801      jr      $3e34
3e33 37        scf     
3e34 fde1      pop     iy
3e36 e1        pop     hl
3e37 d1        pop     de
3e38 c1        pop     bc
3e39 c9        ret     

3e3a 00        nop     
3e3b 00        nop     
3e3c 00        nop     
3e3d 00        nop     
3e3e fd213a3e  ld      iy,$3e3a
3e42 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
3e45 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
3e48 cd208f    call    $8f20
3e4b fe01      cp      $01
3e4d 202c      jr      nz,$3e7b
3e4f 79        ld      a,c
3e50 fe82      cp      $82
3e52 2005      jr      nz,$3e59
3e54 cd503c    call    $3c50
3e57 181e      jr      $3e77
3e59 fe83      cp      $83
3e5b 2005      jr      nz,$3e62
3e5d cd303c    call    $3c30
3e60 1815      jr      $3e77
3e62 fe81      cp      $81
3e64 2005      jr      nz,$3e6b
3e66 cdd63b    call    $3bd6
3e69 180c      jr      $3e77
3e6b fe86      cp      $86
3e6d 2005      jr      nz,$3e74
3e6f cdcd3b    call    $3bcd
3e72 1803      jr      $3e77
3e74 cdef3b    call    $3bef
3e77 0601      ld      b,$01
3e79 1807      jr      $3e82
3e7b cd8f3e    call    $3e8f
3e7e 20c8      jr      nz,$3e48
3e80 0602      ld      b,$02
3e82 cd168b    call    $8b16
3e85 cdbf3e    call    $3ebf
3e88 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
3e8b cd1e41    call    $411e
3e8e c9        ret     

3e8f 79        ld      a,c
3e90 fe82      cp      $82
3e92 2005      jr      nz,$3e99
3e94 cd403c    call    $3c40
3e97 1825      jr      $3ebe
3e99 fe83      cp      $83
3e9b 2005      jr      nz,$3ea2
3e9d cd283c    call    $3c28
3ea0 181c      jr      $3ebe
3ea2 fe81      cp      $81
3ea4 2005      jr      nz,$3eab
3ea6 cde73b    call    $3be7
3ea9 1813      jr      $3ebe
3eab fe86      cp      $86
3ead 2005      jr      nz,$3eb4
3eaf cddf3b    call    $3bdf
3eb2 180a      jr      $3ebe
3eb4 fe87      cp      $87
3eb6 2005      jr      nz,$3ebd
3eb8 cdf83b    call    $3bf8
3ebb 1801      jr      $3ebe
3ebd 97        sub     a
3ebe c9        ret     

3ebf c5        push    bc
3ec0 d5        push    de
3ec1 cd798f    call    $8f79
3ec4 fe01      cp      $01
3ec6 2855      jr      z,$3f1d
3ec8 b9        cp      c
3ec9 2839      jr      z,$3f04
3ecb fe82      cp      $82
3ecd 200b      jr      nz,$3eda
3ecf cd283c    call    $3c28
3ed2 c4303c    call    nz,$3c30
3ed5 cc483c    call    z,$3c48
3ed8 18e7      jr      $3ec1
3eda fe83      cp      $83
3edc 200b      jr      nz,$3ee9
3ede cd403c    call    $3c40
3ee1 c4503c    call    nz,$3c50
3ee4 cc383c    call    z,$3c38
3ee7 18d8      jr      $3ec1
3ee9 fe81      cp      $81
3eeb 2005      jr      nz,$3ef2
3eed cdd63b    call    $3bd6
3ef0 18cf      jr      $3ec1
3ef2 fe86      cp      $86
3ef4 2005      jr      nz,$3efb
3ef6 cdcd3b    call    $3bcd
3ef9 18c6      jr      $3ec1
3efb fe87      cp      $87
3efd 20c2      jr      nz,$3ec1
3eff cdef3b    call    $3bef
3f02 18bd      jr      $3ec1
3f04 fe82      cp      $82
3f06 2003      jr      nz,$3f0b
3f08 0c        inc     c
3f09 1805      jr      $3f10
3f0b fe83      cp      $83
3f0d 2001      jr      nz,$3f10
3f0f 0d        dec     c
3f10 cd1c90    call    $901c
3f13 c5        push    bc
3f14 010100    ld      bc,$0001
3f17 cd3992    call    $9239
3f1a c1        pop     bc
3f1b 10a4      djnz    $3ec1
3f1d d1        pop     de
3f1e c1        pop     bc
3f1f c9        ret     

3f20 c5        push    bc
3f21 d5        push    de
3f22 dde5      push    ix
3f24 97        sub     a
3f25 47        ld      b,a
3f26 4f        ld      c,a
3f27 50        ld      d,b
3f28 58        ld      e,b
3f29 32a83f    ld      ($3fa8),a
3f2c cd208f    call    $8f20
3f2f fe01      cp      $01
3f31 2803      jr      z,$3f36
3f33 cdc78e    call    $8ec7
3f36 dd2ab894  ld      ix,($94b8)
3f3a dd7e00    ld      a,(ix+$00)
3f3d fe81      cp      $81
3f3f 2003      jr      nz,$3f44
3f41 04        inc     b
3f42 180c      jr      $3f50
3f44 fe86      cp      $86
3f46 2003      jr      nz,$3f4b
3f48 14        inc     d
3f49 1805      jr      $3f50
3f4b fe87      cp      $87
3f4d 2005      jr      nz,$3f54
3f4f 1c        inc     e
3f50 dd23      inc     ix
3f52 18e6      jr      $3f3a
3f54 dd21a83f  ld      ix,$3fa8
3f58 78        ld      a,b
3f59 fe02      cp      $02
3f5b 3816      jr      c,$3f73
3f5d e6fe      and     $fe
3f5f 47        ld      b,a
3f60 0e81      ld      c,$81
3f62 cdbf3e    call    $3ebf
3f65 ddcb00c6  set     0,(ix+$00)
3f69 cd208f    call    $8f20
3f6c fe01      cp      $01
3f6e 2803      jr      z,$3f73
3f70 cdc78e    call    $8ec7
3f73 7a        ld      a,d
3f74 fe02      cp      $02
3f76 3816      jr      c,$3f8e
3f78 e6fe      and     $fe
3f7a 47        ld      b,a
3f7b 0e86      ld      c,$86
3f7d cdbf3e    call    $3ebf
3f80 ddcb00c6  set     0,(ix+$00)
3f84 cd208f    call    $8f20
3f87 fe01      cp      $01
3f89 2803      jr      z,$3f8e
3f8b cdc78e    call    $8ec7
3f8e 7b        ld      a,e
3f8f fe02      cp      $02
3f91 380c      jr      c,$3f9f
3f93 e6fe      and     $fe
3f95 47        ld      b,a
3f96 0e87      ld      c,$87
3f98 cdbf3e    call    $3ebf
3f9b ddcb00c6  set     0,(ix+$00)
3f9f dd7e00    ld      a,(ix+$00)
3fa2 1f        rra     
3fa3 dde1      pop     ix
3fa5 d1        pop     de
3fa6 c1        pop     bc
3fa7 c9        ret     

3fa8 00        nop     
3fa9 c5        push    bc
3faa d5        push    de
3fab e5        push    hl
3fac cdd68a    call    $8ad6
3faf 44        ld      b,h
3fb0 4d        ld      c,l
3fb1 cd3992    call    $9239
3fb4 7a        ld      a,d
3fb5 b3        or      e
3fb6 2808      jr      z,$3fc0
3fb8 b7        or      a
3fb9 ed42      sbc     hl,bc
3fbb 3001      jr      nc,$3fbe
3fbd 1b        dec     de
3fbe 18ef      jr      $3faf
3fc0 e1        pop     hl
3fc1 d1        pop     de
3fc2 c1        pop     bc
3fc3 c9        ret     

3fc4 c5        push    bc
3fc5 d5        push    de
3fc6 c5        push    bc
3fc7 11dc3f    ld      de,$3fdc
3fca 010100    ld      bc,$0001
3fcd cdca91    call    $91ca
3fd0 c1        pop     bc
3fd1 3805      jr      c,$3fd8
3fd3 10f1      djnz    $3fc6
3fd5 b7        or      a
3fd6 1801      jr      $3fd9
3fd8 37        scf     
3fd9 d1        pop     de
3fda c1        pop     bc
3fdb c9        ret     

3fdc 0d        dec     c
3fdd c5        push    bc
3fde 0601      ld      b,$01
3fe0 cdc43f    call    $3fc4
3fe3 c1        pop     bc
3fe4 c9        ret     

3fe5 c5        push    bc
3fe6 d5        push    de
3fe7 cd2b83    call    $832b
3fea fe01      cp      $01
3fec 2803      jr      z,$3ff1
3fee cddd3f    call    $3fdd
3ff1 11fd3f    ld      de,$3ffd
3ff4 010100    ld      bc,$0001
3ff7 cdca91    call    $91ca
3ffa d1        pop     de
3ffb c1        pop     bc
3ffc c9        ret     

3ffd 0c        inc     c
3ffe c5        push    bc
3fff d5        push    de
4000 e5        push    hl
4001 fde5      push    iy
4003 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
4006 fd213340  ld      iy,$4033
400a cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
400d cde440    call    $40e4
4010 fe01      cp      $01
4012 2805      jr      z,$4019
4014 10f7      djnz    $400d
4016 b7        or      a
4017 1801      jr      $401a
4019 37        scf     
401a f5        push    af
401b cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
401e cdd68a    call    $8ad6
4021 44        ld      b,h
4022 4d        ld      c,l
4023 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
4026 cd1e41    call    $411e
4029 cd3992    call    $9239
402c f1        pop     af
402d fde1      pop     iy
402f e1        pop     hl
4030 d1        pop     de
4031 c1        pop     bc
4032 c9        ret     

4033 00        nop     
4034 00        nop     
4035 00        nop     
4036 00        nop     
4037 c5        push    bc
4038 d5        push    de
4039 327f40    ld      ($407f),a
403c cd3683    call    $8336
403f 4f        ld      c,a
4040 cd4283    call    $8342
4043 47        ld      b,a
4044 cd0141    call    $4101
4047 cda440    call    $40a4
404a cd8040    call    $4080
404d 79        ld      a,c
404e cd6783    call    $8367
4051 cd5583    call    $8355
4054 3a7f40    ld      a,($407f)
4057 d1        pop     de
4058 c1        pop     bc
4059 c9        ret     

405a c5        push    bc
405b d5        push    de
405c 327f40    ld      ($407f),a
405f cd3683    call    $8336
4062 4f        ld      c,a
4063 cd4283    call    $8342
4066 47        ld      b,a
4067 cde440    call    $40e4
406a fe01      cp      $01
406c cca440    call    z,$40a4
406f cd8040    call    $4080
4072 79        ld      a,c
4073 cd6783    call    $8367
4076 cd5583    call    $8355
4079 3a7f40    ld      a,($407f)
407c d1        pop     de
407d c1        pop     bc
407e c9        ret     

407f 00        nop     
4080 f5        push    af
4081 cda440    call    $40a4
4084 cdc78e    call    $8ec7
4087 fe0d      cp      $0d
4089 2814      jr      z,$409f
408b fe0a      cp      $0a
408d 2810      jr      z,$409f
408f fe0c      cp      $0c
4091 280c      jr      z,$409f
4093 fe01      cp      $01
4095 280b      jr      z,$40a2
4097 cd2b83    call    $832b
409a b8        cp      b
409b 38e7      jr      c,$4084
409d 2803      jr      z,$40a2
409f cd208f    call    $8f20
40a2 f1        pop     af
40a3 c9        ret     

40a4 c5        push    bc
40a5 cd3683    call    $8336
40a8 4f        ld      c,a
40a9 cd208f    call    $8f20
40ac fe01      cp      $01
40ae 280f      jr      z,$40bf
40b0 fe0c      cp      $0c
40b2 2808      jr      z,$40bc
40b4 fe0a      cp      $0a
40b6 2804      jr      z,$40bc
40b8 fe0d      cp      $0d
40ba 20ed      jr      nz,$40a9
40bc cdc78e    call    $8ec7
40bf cd5583    call    $8355
40c2 c1        pop     bc
40c3 c9        ret     

40c4 c5        push    bc
40c5 cd3683    call    $8336
40c8 4f        ld      c,a
40c9 cdc78e    call    $8ec7
40cc fe01      cp      $01
40ce 280f      jr      z,$40df
40d0 fe0c      cp      $0c
40d2 2808      jr      z,$40dc
40d4 fe0a      cp      $0a
40d6 2804      jr      z,$40dc
40d8 fe0d      cp      $0d
40da 20ed      jr      nz,$40c9
40dc cd208f    call    $8f20
40df cd5583    call    $8355
40e2 c1        pop     bc
40e3 c9        ret     

40e4 c5        push    bc
40e5 cd3683    call    $8336
40e8 4f        ld      c,a
40e9 cdc78e    call    $8ec7
40ec fe01      cp      $01
40ee 280c      jr      z,$40fc
40f0 fe0c      cp      $0c
40f2 2808      jr      z,$40fc
40f4 fe0a      cp      $0a
40f6 2804      jr      z,$40fc
40f8 fe0d      cp      $0d
40fa 20ed      jr      nz,$40e9
40fc cd5583    call    $8355
40ff c1        pop     bc
4100 c9        ret     

4101 c5        push    bc
4102 cd3683    call    $8336
4105 4f        ld      c,a
4106 cd208f    call    $8f20
4109 fe01      cp      $01
410b 280c      jr      z,$4119
410d fe0c      cp      $0c
410f 2808      jr      z,$4119
4111 fe0a      cp      $0a
4113 2804      jr      z,$4119
4115 fe0d      cp      $0d
4117 20ed      jr      nz,$4106
4119 cd5583    call    $8355
411c c1        pop     bc
411d c9        ret     

411e d5        push    de
411f e5        push    hl
4120 fde5      push    iy
4122 fd215541  ld      iy,$4155
4126 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
4129 cd5941    call    $4159
412c 3813      jr      c,$4141
412e 2820      jr      z,$4150
4130 cd208f    call    $8f20
4133 cd5941    call    $4159
4136 2818      jr      z,$4150
4138 3802      jr      c,$413c
413a 18f4      jr      $4130
413c cdc78e    call    $8ec7
413f 180f      jr      $4150
4141 cdc78e    call    $8ec7
4144 fe01      cp      $01
4146 2808      jr      z,$4150
4148 cd5941    call    $4159
414b 38f4      jr      c,$4141
414d c4208f    call    nz,$8f20
4150 fde1      pop     iy
4152 e1        pop     hl
4153 d1        pop     de
4154 c9        ret     

4155 00        nop     
4156 00        nop     
4157 00        nop     
4158 00        nop     
4159 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
415c cdec8a    call    $8aec
415f c9        ret     

4160 c5        push    bc
4161 328c41    ld      ($418c),a
4164 cd3683    call    $8336
4167 4f        ld      c,a
4168 cd3e83    call    $833e
416b 47        ld      b,a
416c 05        dec     b
416d 05        dec     b
416e 2809      jr      z,$4179
4170 cd0141    call    $4101
4173 fe01      cp      $01
4175 2805      jr      z,$417c
4177 18f4      jr      $416d
4179 cda440    call    $40a4
417c cd3e83    call    $833e
417f fe01      cp      $01
4181 cce440    call    z,$40e4
4184 cd5583    call    $8355
4187 3a8c41    ld      a,($418c)
418a c1        pop     bc
418b c9        ret     

418c 00        nop     
418d 79        ld      a,c
418e b0        or      b
418f 2005      jr      nz,$4196
4191 cd8f42    call    $428f
4194 1840      jr      $41d6
4196 ed43d741  ld      ($41d7),bc
419a fd21d741  ld      iy,$41d7
419e cda269    call    $69a2
41a1 78        ld      a,b
41a2 fdbe01    cp      (iy+$01)
41a5 2004      jr      nz,$41ab
41a7 79        ld      a,c
41a8 fdbe00    cp      (iy+$00)
41ab 2814      jr      z,$41c1
41ad 3809      jr      c,$41b8
41af cd0141    call    $4101
41b2 fe01      cp      $01
41b4 2820      jr      z,$41d6
41b6 18e6      jr      $419e
41b8 cde440    call    $40e4
41bb fe01      cp      $01
41bd 2817      jr      z,$41d6
41bf 18dd      jr      $419e
41c1 cda769    call    $69a7
41c4 78        ld      a,b
41c5 fe00      cp      $00
41c7 2003      jr      nz,$41cc
41c9 79        ld      a,c
41ca fe01      cp      $01
41cc 2808      jr      z,$41d6
41ce cd0141    call    $4101
41d1 cda440    call    $40a4
41d4 18eb      jr      $41c1
41d6 c9        ret     

41d7 00        nop     
41d8 00        nop     
41d9 cdf83b    call    $3bf8
41dc 2809      jr      z,$41e7
41de cdc78e    call    $8ec7
41e1 fe01      cp      $01
41e3 2811      jr      z,$41f6
41e5 18f2      jr      $41d9
41e7 cdc78e    call    $8ec7
41ea fe01      cp      $01
41ec 2808      jr      z,$41f6
41ee cdf83b    call    $3bf8
41f1 28f4      jr      z,$41e7
41f3 cd208f    call    $8f20
41f6 c9        ret     

41f7 c5        push    bc
41f8 d5        push    de
41f9 e5        push    hl
41fa 328e42    ld      ($428e),a
41fd cd5091    call    $9150
4200 fe0a      cp      $0a
4202 2808      jr      z,$420c
4204 fe0d      cp      $0d
4206 2804      jr      z,$420c
4208 fe01      cp      $01
420a 200b      jr      nz,$4217
420c 010100    ld      bc,$0001
420f 118e42    ld      de,$428e
4212 cdca91    call    $91ca
4215 1870      jr      $4287
4217 fe09      cp      $09
4219 3a8e42    ld      a,($428e)
421c 2014      jr      nz,$4232
421e fe09      cp      $09
4220 285b      jr      z,$427d
4222 cd3a83    call    $833a
4225 3d        dec     a
4226 47        ld      b,a
4227 e6f8      and     $f8
4229 c608      add     a,$08
422b 90        sub     b
422c fe01      cp      $01
422e 284d      jr      z,$427d
4230 18da      jr      $420c
4232 fe09      cp      $09
4234 203d      jr      nz,$4273
4236 cd3a83    call    $833a
4239 47        ld      b,a
423a 3d        dec     a
423b e6f8      and     $f8
423d c608      add     a,$08
423f 90        sub     b
4240 47        ld      b,a
4241 0e00      ld      c,$00
4243 cdc78e    call    $8ec7
4246 cdc78e    call    $8ec7
4249 0c        inc     c
424a fe09      cp      $09
424c 2819      jr      z,$4267
424e fe0d      cp      $0d
4250 280d      jr      z,$425f
4252 fe01      cp      $01
4254 280d      jr      z,$4263
4256 cdb28c    call    $8cb2
4259 30eb      jr      nc,$4246
425b 10e9      djnz    $4246
425d 1808      jr      $4267
425f 41        ld      b,c
4260 0d        dec     c
4261 1805      jr      $4268
4263 0d        dec     c
4264 41        ld      b,c
4265 1801      jr      $4268
4267 41        ld      b,c
4268 cd208f    call    $8f20
426b 10fb      djnz    $4268
426d cd3992    call    $9239
4270 cd208f    call    $8f20
4273 cd5091    call    $9150
4276 fe20      cp      $20
4278 2803      jr      z,$427d
427a cd2202    call    $0222
427d cdd473    call    $73d4
4280 3a8e42    ld      a,($428e)
4283 cdae92    call    $92ae
4286 b7        or      a
4287 e1        pop     hl
4288 d1        pop     de
4289 c1        pop     bc
428a 3a8e42    ld      a,($428e)
428d c9        ret     

428e 00        nop     
428f 32ab42    ld      ($42ab),a
4292 cd208f    call    $8f20
4295 fe01      cp      $01
4297 20f9      jr      nz,$4292
4299 3aab42    ld      a,($42ab)
429c c9        ret     

429d 32ab42    ld      ($42ab),a
42a0 cdc78e    call    $8ec7
42a3 fe01      cp      $01
42a5 20f9      jr      nz,$42a0
42a7 3aab42    ld      a,($42ab)
42aa c9        ret     

42ab 00        nop     
42ac c5        push    bc
42ad e5        push    hl
42ae ed4bc494  ld      bc,($94c4)
42b2 2ab894    ld      hl,($94b8)
42b5 b7        or      a
42b6 ed42      sbc     hl,bc
42b8 2807      jr      z,$42c1
42ba 3805      jr      c,$42c1
42bc cd208f    call    $8f20
42bf 18f1      jr      $42b2
42c1 e1        pop     hl
42c2 c1        pop     bc
42c3 c9        ret     

42c4 cdc78e    call    $8ec7
42c7 cdf842    call    $42f8
42ca 2011      jr      nz,$42dd
42cc cdc78e    call    $8ec7
42cf cdf842    call    $42f8
42d2 2002      jr      nz,$42d6
42d4 18f6      jr      $42cc
42d6 fe01      cp      $01
42d8 c4208f    call    nz,$8f20
42db 3e20      ld      a,$20
42dd c9        ret     

42de cd208f    call    $8f20
42e1 cdf842    call    $42f8
42e4 2011      jr      nz,$42f7
42e6 cd208f    call    $8f20
42e9 cdf842    call    $42f8
42ec 2002      jr      nz,$42f0
42ee 18f6      jr      $42e6
42f0 fe01      cp      $01
42f2 c4c78e    call    nz,$8ec7
42f5 3e20      ld      a,$20
42f7 c9        ret     

42f8 e5        push    hl
42f9 c5        push    bc
42fa 010500    ld      bc,$0005
42fd 210543    ld      hl,$4305
4300 edb1      cpir    
4302 c1        pop     bc
4303 e1        pop     hl
4304 c9        ret     

4305 2009      jr      nz,$4310
4307 0d        dec     c
4308 0a        ld      a,(bc)
4309 0c        inc     c
430a c5        push    bc
430b d5        push    de
430c e5        push    hl
430d fde5      push    iy
430f e1        pop     hl
4310 010000    ld      bc,$0000
4313 13        inc     de
4314 79        ld      a,c
4315 b7        or      a
4316 2005      jr      nz,$431d
4318 78        ld      a,b
4319 fe08      cp      $08
431b 2812      jr      z,$432f
431d 1a        ld      a,(de)
431e 13        inc     de
431f fe20      cp      $20
4321 3814      jr      c,$4337
4323 200d      jr      nz,$4332
4325 1a        ld      a,(de)
4326 13        inc     de
4327 fe20      cp      $20
4329 28fa      jr      z,$4325
432b 1b        dec     de
432c b7        or      a
432d 2808      jr      z,$4337
432f 0c        inc     c
4330 3e2e      ld      a,$2e
4332 77        ld      (hl),a
4333 23        inc     hl
4334 04        inc     b
4335 18dd      jr      $4314
4337 97        sub     a
4338 77        ld      (hl),a
4339 78        ld      a,b
433a e1        pop     hl
433b d1        pop     de
433c c1        pop     bc
433d c9        ret     

433e f5        push    af
433f e5        push    hl
4340 dde5      push    ix
4342 fde5      push    iy
4344 fd216143  ld      iy,$4361
4348 cd522a    call    $2a52
434b fde5      push    iy
434d e1        pop     hl
434e cd5d8c    call    $8c5d
4351 3624      ld      (hl),$24
4353 fde5      push    iy
4355 dde1      pop     ix
4357 cda343    call    $43a3
435a fde1      pop     iy
435c dde1      pop     ix
435e e1        pop     hl
435f f1        pop     af
4360 c9        ret     

4361 00        nop     
4362 00        nop     
4363 00        nop     
4364 00        nop     
4365 00        nop     
4366 00        nop     
4367 00        nop     
4368 00        nop     
4369 00        nop     
436a 00        nop     
436b 00        nop     
436c 00        nop     
436d 00        nop     
436e 00        nop     
436f f5        push    af
4370 dde5      push    ix
4372 dd2196ba  ld      ix,$ba96
4376 cd2744    call    $4427
4379 cda37d    call    $7da3		discard keys typed on terminal
437c cdec7c    call    $7cec
437f cdb703    call    $03b7
4382 dde1      pop     ix
4384 f1        pop     af
4385 c9        ret     

4386 dde5      push    ix
4388 dd21b9ba  ld      ix,$bab9
438c cd2744    call    $4427
438f cda37d    call    $7da3		discard keys typed on terminal
4392 cdec7c    call    $7cec
4395 fe1b      cp      $1b
4397 cdb703    call    $03b7
439a dde1      pop     ix
439c c9        ret     

439d cdfd85    call    $85fd
43a0 cd3002    call    $0230
43a3 c5        push    bc
43a4 d5        push    de
43a5 e5        push    hl
43a6 fde5      push    iy
43a8 dde5      push    ix
43aa e1        pop     hl
43ab 1100a0    ld      de,$a000
43ae b7        or      a
43af ed52      sbc     hl,de
43b1 3828      jr      c,$43db
43b3 cd5d32    call    $325d
43b6 fd21a464  ld      iy,$64a4		fname WRITM066.HLP
43ba cdf72d    call    $2df7
43bd b7        or      a
43be 2017      jr      nz,$43d7
43c0 cde943    call    $43e9
43c3 cd212e    call    $2e21
43c6 fe01      cp      $01
43c8 2808      jr      z,$43d2
43ca b7        or      a
43cb 2805      jr      z,$43d2
43cd cd7844    call    $4478		write char in A
43d0 18f1      jr      $43c3
43d2 cd8e32    call    $328e
43d5 180c      jr      $43e3
43d7 dd217964  ld      ix,$6479
43db dde5      push    ix
43dd d1        pop     de
43de 0e09      ld      c,$09
43e0 cd0500    call    $0005
43e3 fde1      pop     iy
43e5 e1        pop     hl
43e6 d1        pop     de
43e7 c1        pop     bc
43e8 c9        ret     

43e9 118000    ld      de,$0080
43ec 3e03      ld      a,$03
43ee cd5d8c    call    $8c5d
43f1 0e8a      ld      c,$8a
43f3 cd0500    call    $0005
43f6 7d        ld      a,l
43f7 32bd27    ld      ($27bd),a
43fa 7b        ld      a,e
43fb b7        or      a
43fc 2806      jr      z,$4404
43fe 47        ld      b,a
43ff cd212e    call    $2e21
4402 10fb      djnz    $43ff
4404 c9        ret     

4405 f5        push    af
4406 c5        push    bc
4407 d5        push    de
4408 dde5      push    ix
440a cd2202    call    $0222
440d dd212244  ld      ix,$4422
4411 cd9d43    call    $439d
4414 dde1      pop     ix
4416 cda343    call    $43a3
4419 3e03      ld      a,$03
441b cd8544    call    $4485
441e d1        pop     de
441f c1        pop     bc
4420 f1        pop     af
4421 c9        ret     

4422 0a        ld      a,(bc)
4423 0a        ld      a,(bc)
4424 0a        ld      a,(bc)
4425 0a        ld      a,(bc)
4426 24        inc     h
4427 cd2202    call    $0222
442a cd9803    call    $0398
442d c9        ret     

442e c5        push    bc
442f dde5      push    ix
4431 dd21f3ba  ld      ix,$baf3
4435 cda343    call    $43a3
4438 cda37d    call    $7da3		discard keys typed on terminal
443b cdec7c    call    $7cec
443e cd7c8c    call    $8c7c
4441 fe59      cp      $59
4443 2812      jr      z,$4457
4445 fe4e      cp      $4e
4447 2816      jr      z,$445f
4449 fe1b      cp      $1b
444b 2805      jr      z,$4452
444d cd2202    call    $0222
4450 18e6      jr      $4438
4452 97        sub     a
4453 b7        or      a
4454 b7        or      a
4455 1811      jr      $4468
4457 47        ld      b,a
4458 3e01      ld      a,$01
445a b7        or      a
445b 78        ld      a,b
445c 37        scf     
445d 1806      jr      $4465
445f 47        ld      b,a
4460 3e01      ld      a,$01
4462 b7        or      a
4463 78        ld      a,b
4464 b7        or      a
4465 cd7844    call    $4478		write char in A
4468 dde1      pop     ix
446a c1        pop     bc
446b c9        ret     

446c dde5      push    ix
446e dd219dc5  ld      ix,$c59d
4472 cd0544    call    $4405
4475 dde1      pop     ix
4477 c9        ret     

4478 f5        push    af		write char in A
4479 c5        push    bc
447a d5        push    de
447b 5f        ld      e,a
447c 0e02      ld      c,$02
447e cd0500    call    $0005		BDOS Call 2 C_WRITE Console Output 
4481 d1        pop     de
4482 c1        pop     bc
4483 f1        pop     af
4484 c9        ret     

4485 f5        push    af
4486 e5        push    hl
4487 cd003c    call    $3c00
448a 2007      jr      nz,$4493
448c ed44      neg     
448e cde88b    call    $8be8
4491 1805      jr      $4498
4493 6f        ld      l,a
4494 2600      ld      h,$00
4496 cf        rst     $08
4497 42        ld      b,d
4498 e1        pop     hl
4499 f1        pop     af
449a c9        ret     

449b cd8f42    call    $428f
449e fd216446  ld      iy,$4664
44a2 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
44a5 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
44a8 cd212e    call    $2e21
44ab fe60      cp      $60
44ad 2807      jr      z,$44b6
44af fe01      cp      $01
44b1 ca7345    jp      z,$4573
44b4 18f2      jr      $44a8
44b6 21b357    ld      hl,$57b3
44b9 3e5c      ld      a,$5c
44bb 77        ld      (hl),a
44bc 21b457    ld      hl,$57b4
44bf 064b      ld      b,$4b
44c1 cd0e7d    call    $7d0e
44c4 da6e45    jp      c,$456e
44c7 cd212e    call    $2e21
44ca fe60      cp      $60
44cc 2008      jr      nz,$44d6
44ce cddf45    call    $45df
44d1 da6e45    jp      c,$456e
44d4 18e6      jr      $44bc
44d6 fe01      cp      $01
44d8 ca7345    jp      z,$4573
44db fe3a      cp      $3a
44dd 2825      jr      z,$4504
44df fe0d      cp      $0d
44e1 28d9      jr      z,$44bc
44e3 fe0a      cp      $0a
44e5 28d5      jr      z,$44bc
44e7 fe0c      cp      $0c
44e9 28d1      jr      z,$44bc
44eb fe20      cp      $20
44ed 2804      jr      z,$44f3
44ef fe09      cp      $09
44f1 200a      jr      nz,$44fd
44f3 11b457    ld      de,$57b4
44f6 e5        push    hl
44f7 b7        or      a
44f8 ed52      sbc     hl,de
44fa e1        pop     hl
44fb 28ca      jr      z,$44c7
44fd cd7c8c    call    $8c7c
4500 77        ld      (hl),a
4501 23        inc     hl
4502 10c3      djnz    $44c7
4504 3e5c      ld      a,$5c
4506 77        ld      (hl),a
4507 23        inc     hl
4508 97        sub     a
4509 77        ld      (hl),a
450a cd2b55    call    $552b
450d 380c      jr      c,$451b
450f fd216446  ld      iy,$4664
4513 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
4516 cd1e41    call    $411e
4519 18a1      jr      $44bc
451b ed4bb894  ld      bc,($94b8)
451f cd1e41    call    $411e
4522 fd219946  ld      iy,$4699
4526 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
4529 cd8445    call    $4584
452c cd9345    call    $4593
452f fe60      cp      $60
4531 cabc44    jp      z,$44bc
4534 fe01      cp      $01
4536 283b      jr      z,$4573
4538 cd2b55    call    $552b
453b 30d2      jr      nc,$450f
453d ed4bb894  ld      bc,($94b8)
4541 fd219d46  ld      iy,$469d
4545 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
4548 fd219946  ld      iy,$4699
454c cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
454f cd1e41    call    $411e
4552 ed5bb894  ld      de,($94b8)
4556 d5        push    de
4557 fd219d46  ld      iy,$469d
455b cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
455e cd1e41    call    $411e
4561 cd8445    call    $4584
4564 d1        pop     de
4565 ed4ba146  ld      bc,($46a1)
4569 cdca91    call    $91ca
456c 18ca      jr      $4538
456e cd6888    call    $8868
4571 180d      jr      $4580
4573 3a7746    ld      a,($4677)
4576 b7        or      a
4577 c4df45    call    nz,$45df
457a cd8f42    call    $428f
457d cd8769    call    $6987
4580 cdd482    call    $82d4
4583 c9        ret     

4584 60        ld      h,b
4585 69        ld      l,c
4586 ed4bb894  ld      bc,($94b8)
458a b7        or      a
458b ed42      sbc     hl,bc
458d 44        ld      b,h
458e 4d        ld      c,l
458f cd3992    call    $9239
4592 c9        ret     

4593 210000    ld      hl,$0000
4596 22a146    ld      ($46a1),hl
4599 cd212e    call    $2e21
459c fe01      cp      $01
459e 283e      jr      z,$45de
45a0 fe60      cp      $60
45a2 2005      jr      nz,$45a9
45a4 cddf45    call    $45df
45a7 1835      jr      $45de
45a9 fe5c      cp      $5c
45ab 20ec      jr      nz,$4599
45ad 211e76    ld      hl,$761e
45b0 110000    ld      de,$0000
45b3 06ff      ld      b,$ff
45b5 cd212e    call    $2e21
45b8 fe60      cp      $60
45ba 2005      jr      nz,$45c1
45bc cddf45    call    $45df
45bf 181d      jr      $45de
45c1 fe5c      cp      $5c
45c3 280a      jr      z,$45cf
45c5 77        ld      (hl),a
45c6 23        inc     hl
45c7 13        inc     de
45c8 10eb      djnz    $45b5
45ca cdcf45    call    $45cf
45cd 18de      jr      $45ad
45cf 42        ld      b,d
45d0 4b        ld      c,e
45d1 111e76    ld      de,$761e
45d4 2aa146    ld      hl,($46a1)
45d7 09        add     hl,bc
45d8 22a146    ld      ($46a1),hl
45db cdca91    call    $91ca
45de c9        ret     

45df c5        push    bc
45e0 d5        push    de
45e1 e5        push    hl
45e2 dde5      push    ix
45e4 3a7746    ld      a,($4677)
45e7 b7        or      a
45e8 2008      jr      nz,$45f2
45ea cd9d42    call    $429d
45ed cde53f    call    $3fe5
45f0 1846      jr      $4638
45f2 cd8f42    call    $428f
45f5 219d27    ld      hl,$279d
45f8 117846    ld      de,$4678
45fb 012100    ld      bc,$0021
45fe edb0      ldir    
4600 cda269    call    $69a2
4603 60        ld      h,b
4604 69        ld      l,c
4605 e5        push    hl
4606 cda152    call    $52a1
4609 e1        pop     hl
460a 3852      jr      c,$465e
460c cd7150    call    $5071
460f cda269    call    $69a2
4612 b7        or      a
4613 ed42      sbc     hl,bc
4615 38ee      jr      c,$4605
4617 3a9846    ld      a,($4698)
461a 3d        dec     a
461b 329846    ld      ($4698),a
461e 217846    ld      hl,$4678
4621 119d27    ld      de,$279d
4624 012100    ld      bc,$0021
4627 edb0      ldir    
4629 119d27    ld      de,$279d
462c 21252f    ld      hl,$2f25
462f cd9e2d    call    $2d9e
4632 cda92e    call    $2ea9		Set DMA address to default $0080
4635 cd661b    call    $1b66
4638 fd216446  ld      iy,$4664
463c cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
463f cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
4642 fd216846  ld      iy,$4668
4646 cd522a    call    $2a52
4649 cdf62c    call    $2cf6
464c 3e00      ld      a,$00
464e cd1b2d    call    $2d1b
4651 380b      jr      c,$465e
4653 fd216446  ld      iy,$4664
4657 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
465a cd1e41    call    $411e
465d b7        or      a
465e dde1      pop     ix
4660 e1        pop     hl
4661 d1        pop     de
4662 c1        pop     bc
4663 c9        ret     

4664 00        nop     
4665 00        nop     
4666 00        nop     
4667 00        nop     
4668 00        nop     
4669 00        nop     
466a 00        nop     
466b 00        nop     
466c 00        nop     
466d 00        nop     
466e 00        nop     
466f 00        nop     
4670 00        nop     
4671 00        nop     
4672 00        nop     
4673 00        nop     
4674 00        nop     
4675 00        nop     
4676 00        nop     
4677 00        nop     
4678 00        nop     
4679 00        nop     
467a 00        nop     
467b 00        nop     
467c 00        nop     
467d 00        nop     
467e 00        nop     
467f 00        nop     
4680 00        nop     
4681 00        nop     
4682 00        nop     
4683 00        nop     
4684 00        nop     
4685 00        nop     
4686 00        nop     
4687 00        nop     
4688 00        nop     
4689 00        nop     
468a 00        nop     
468b 00        nop     
468c 00        nop     
468d 00        nop     
468e 00        nop     
468f 00        nop     
4690 00        nop     
4691 00        nop     
4692 00        nop     
4693 00        nop     
4694 00        nop     
4695 00        nop     
4696 00        nop     
4697 00        nop     
4698 00        nop     
4699 00        nop     
469a 00        nop     
469b 00        nop     
469c 00        nop     
469d 00        nop     
469e 00        nop     
469f 00        nop     
46a0 00        nop     
46a1 00        nop     
46a2 00        nop     
46a3 cdc049    call    $49c0
46a6 3e01      ld      a,$01
46a8 cdbb85    call    $85bb
46ab cdbc7e    call    $7ebc
46ae cd2c03    call    $032c
46b1 cda148    call    $48a1
46b4 fd212048  ld      iy,$4820
46b8 dd2132a7  ld      ix,$a732
46bc 21b04a    ld      hl,$4ab0
46bf cda17e    call    $7ea1
46c2 cd1a03    call    $031a
46c5 daed47    jp      c,$47ed
46c8 28dc      jr      z,$46a6
46ca fe41      cp      $41
46cc ca7247    jp      z,$4772
46cf fe57      cp      $57
46d1 ca9547    jp      z,$4795
46d4 fe4a      cp      $4a
46d6 ca8247    jp      z,$4782
46d9 fe4e      cp      $4e
46db caa847    jp      z,$47a8
46de fe48      cp      $48
46e0 cabf47    jp      z,$47bf
46e3 fe0d      cp      $0d
46e5 caf247    jp      z,$47f2
46e8 78        ld      a,b
46e9 21be4a    ld      hl,$4abe
46ec cd5d8c    call    $8c5d
46ef 7e        ld      a,(hl)
46f0 32394b    ld      ($4b39),a
46f3 78        ld      a,b
46f4 80        add     a,b
46f5 0600      ld      b,$00
46f7 4f        ld      c,a
46f8 21d34a    ld      hl,$4ad3
46fb 09        add     hl,bc
46fc e5        push    hl
46fd dde1      pop     ix
46ff dd6e00    ld      l,(ix+$00)
4702 dd6601    ld      h,(ix+$01)
4705 e5        push    hl
4706 dde1      pop     ix
4708 21e14a    ld      hl,$4ae1
470b 09        add     hl,bc
470c e5        push    hl
470d fde1      pop     iy
470f fd5e00    ld      e,(iy+$00)
4712 fd5601    ld      d,(iy+$01)
4715 ed532f48  ld      ($482f),de
4719 21c54a    ld      hl,$4ac5
471c 09        add     hl,bc
471d e5        push    hl
471e fde1      pop     iy
4720 cd2848    call    $4828
4723 fde5      push    iy
4725 fd212148  ld      iy,$4821
4729 3a394b    ld      a,($4b39)
472c cdd47d    call    $7dd4
472f fde1      pop     iy
4731 daa646    jp      c,$46a6
4734 7c        ld      a,h
4735 fdbe01    cp      (iy+$01)
4738 2004      jr      nz,$473e
473a 7d        ld      a,l
473b fdbe00    cp      (iy+$00)
473e d2a646    jp      nc,$46a6
4741 3a394b    ld      a,($4b39)
4744 fe05      cp      $05
4746 3817      jr      c,$475f
4748 7c        ld      a,h
4749 b5        or      l
474a caa646    jp      z,$46a6
474d 7c        ld      a,h
474e fe00      cp      $00
4750 2003      jr      nz,$4755
4752 7d        ld      a,l
4753 fe18      cp      $18
4755 daa346    jp      c,$46a3
4758 7c        ld      a,h
4759 dd7701    ld      (ix+$01),a
475c 7d        ld      a,l
475d 180d      jr      $476c
475f 7d        ld      a,l
4760 b7        or      a
4761 2009      jr      nz,$476c
4763 3a394b    ld      a,($4b39)
4766 fe02      cp      $02
4768 c2a646    jp      nz,$46a6
476b 97        sub     a
476c dd7700    ld      (ix+$00),a
476f c3a646    jp      $46a6
4772 3af14a    ld      a,($4af1)
4775 b7        or      a
4776 2803      jr      z,$477b
4778 97        sub     a
4779 1801      jr      $477c
477b 3c        inc     a
477c 32f14a    ld      ($4af1),a
477f c3a646    jp      $46a6
4782 3a384b    ld      a,($4b38)
4785 cb4f      bit     1,a
4787 2804      jr      z,$478d
4789 cb8f      res     1,a
478b 1802      jr      $478f
478d cbcf      set     1,a
478f 32384b    ld      ($4b38),a
4792 c3a646    jp      $46a6
4795 3a384b    ld      a,($4b38)
4798 cb47      bit     0,a
479a 2804      jr      z,$47a0
479c cb87      res     0,a
479e 1802      jr      $47a2
47a0 cbc7      set     0,a
47a2 32384b    ld      ($4b38),a
47a5 c3a646    jp      $46a6
47a8 3af24a    ld      a,($4af2)
47ab b7        or      a
47ac 280a      jr      z,$47b8
47ae cb5f      bit     3,a
47b0 2003      jr      nz,$47b5
47b2 17        rla     
47b3 1804      jr      $47b9
47b5 97        sub     a
47b6 1801      jr      $47b9
47b8 3c        inc     a
47b9 32f24a    ld      ($4af2),a
47bc c3a646    jp      $46a6
47bf cd3448    call    $4834
47c2 3e0b      ld      a,$0b
47c4 cdbb85    call    $85bb
47c7 fd213148  ld      iy,$4831
47cb dd2153a9  ld      ix,$a953
47cf 211e76    ld      hl,$761e
47d2 cdd67e    call    $7ed6
47d5 b7        or      a
47d6 2812      jr      z,$47ea
47d8 78        ld      a,b
47d9 b7        or      a
47da 280e      jr      z,$47ea
47dc 32374b    ld      ($4b37),a
47df 211e76    ld      hl,$761e
47e2 11fb4a    ld      de,$4afb
47e5 0600      ld      b,$00
47e7 4f        ld      c,a
47e8 edb0      ldir    
47ea c3a646    jp      $46a6
47ed cdd249    call    $49d2
47f0 182b      jr      $481d
47f2 cd3f48    call    $483f
47f5 3809      jr      c,$4800
47f7 cd4a48    call    $484a
47fa d2a646    jp      nc,$46a6
47fd cd8548    call    $4885
4800 cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
4803 3018      jr      nc,$481d
4805 cd154a    call    $4a15
4808 3013      jr      nc,$481d
480a cd5091    call    $9150
480d fe20      cp      $20
480f 2804      jr      z,$4815
4811 fe09      cp      $09
4813 2005      jr      nz,$481a
4815 cdc78e    call    $8ec7
4818 18f0      jr      $480a
481a cd4939    call    $3949
481d cdb67e    call    $7eb6
4820 c9        ret     

4821 cda148    call    $48a1
4824 ed5b2f48  ld      de,($482f)
4828 cd2e04    call    $042e		CDOS: set special crt function
482b cd4202    call    $0242
482e c9        ret     

482f 00        nop     
4830 00        nop     
4831 cda148    call    $48a1
4834 ed5bef4a  ld      de,($4aef)
4838 cd2e04    call    $042e		CDOS: set special crt function
483b cd4202    call    $0242
483e c9        ret     

483f c5        push    bc
4840 3af34a    ld      a,($4af3)
4843 47        ld      b,a
4844 3af44a    ld      a,($4af4)
4847 b8        cp      b
4848 c1        pop     bc
4849 c9        ret     

484a dd214eaa  ld      ix,$aa4e
484e cd9d43    call    $439d
4851 3af44a    ld      a,($4af4)
4854 ed5b9948  ld      de,($4899)
4858 cd217f    call    $7f21
485b 3af34a    ld      a,($4af3)
485e ed5b9b48  ld      de,($489b)
4862 cd217f    call    $7f21
4865 3a084d    ld      a,($4d08)
4868 ed5b9d48  ld      de,($489d)
486c cd217f    call    $7f21
486f 3a074d    ld      a,($4d07)
4872 ed5b9f48  ld      de,($489f)
4876 cd217f    call    $7f21
4879 119448    ld      de,$4894
487c 0e09      ld      c,$09
487e cd0500    call    $0005
4881 cd2e44    call    $442e
4884 c9        ret     

4885 f5        push    af
4886 3a084d    ld      a,($4d08)
4889 32f44a    ld      ($4af4),a
488c 3a074d    ld      a,($4d07)
488f 32f34a    ld      ($4af3),a
4892 f1        pop     af
4893 c9        ret     

4894 0d        dec     c
4895 0a        ld      a,(bc)
4896 0a        ld      a,(bc)
4897 0a        ld      a,(bc)
4898 24        inc     h
4899 05        dec     b
489a 1806      jr      $48a2
489c 1808      jr      $48a6
489e 1809      jr      $48a9
48a0 18c5      jr      $4867
48a2 d5        push    de
48a3 e5        push    hl
48a4 dde5      push    ix
48a6 fde5      push    iy
48a8 010000    ld      bc,$0000
48ab cd934a    call    $4a93
48ae 4f        ld      c,a
48af 21734b    ld      hl,$4b73
48b2 cd678b    call    $8b67
48b5 010000    ld      bc,$0000
48b8 cd974a    call    $4a97
48bb 4f        ld      c,a
48bc 218d4b    ld      hl,$4b8d
48bf cd678b    call    $8b67
48c2 010000    ld      bc,$0000
48c5 cd9b4a    call    $4a9b
48c8 4f        ld      c,a
48c9 21a54b    ld      hl,$4ba5
48cc cd678b    call    $8b67
48cf cd0d4a    call    $4a0d
48d2 3823      jr      c,$48f7
48d4 21e24c    ld      hl,$4ce2
48d7 11be4b    ld      de,$4bbe
48da 010600    ld      bc,$0006
48dd edb0      ldir    
48df 11094c    ld      de,$4c09
48e2 21e84c    ld      hl,$4ce8
48e5 010600    ld      bc,$0006
48e8 edb0      ldir    
48ea 11ef4b    ld      de,$4bef
48ed 21e84c    ld      hl,$4ce8
48f0 010600    ld      bc,$0006
48f3 edb0      ldir    
48f5 1823      jr      $491a
48f7 cd9f4a    call    $4a9f
48fa 21be4b    ld      hl,$4bbe
48fd cd678b    call    $8b67
4900 010000    ld      bc,$0000
4903 cda84a    call    $4aa8
4906 4f        ld      c,a
4907 21ef4b    ld      hl,$4bef
490a cd678b    call    $8b67
490d 010000    ld      bc,$0000
4910 cdac4a    call    $4aac
4913 4f        ld      c,a
4914 21094c    ld      hl,$4c09
4917 cd678b    call    $8b67
491a cda44a    call    $4aa4
491d 4f        ld      c,a
491e 0600      ld      b,$00
4920 21d84b    ld      hl,$4bd8
4923 cd678b    call    $8b67
4926 114c4c    ld      de,$4c4c
4929 cd154a    call    $4a15
492c cdb049    call    $49b0
492f 11604c    ld      de,$4c60
4932 cd1d4a    call    $4a1d
4935 cdb049    call    $49b0
4938 11774c    ld      de,$4c77
493b cd254a    call    $4a25
493e cdb049    call    $49b0
4941 119e4c    ld      de,$4c9e
4944 cd0d4a    call    $4a0d
4947 cdb049    call    $49b0
494a dd213a4b  ld      ix,$4b3a
494e cd9d43    call    $439d
4951 3af24a    ld      a,($4af2)
4954 cb47      bit     0,a
4956 2805      jr      z,$495d
4958 21dd4c    ld      hl,$4cdd
495b 1819      jr      $4976
495d cb4f      bit     1,a
495f 2805      jr      z,$4966
4961 21d64c    ld      hl,$4cd6
4964 1810      jr      $4976
4966 cb57      bit     2,a
4968 2805      jr      z,$496f
496a 21cc4c    ld      hl,$4ccc
496d 1807      jr      $4976
496f cb5f      bit     3,a
4971 2812      jr      z,$4985
4973 21bb4c    ld      hl,$4cbb
4976 11a84c    ld      de,$4ca8
4979 0e09      ld      c,$09
497b cd0500    call    $0005
497e 54        ld      d,h
497f 5d        ld      e,l
4980 0e09      ld      c,$09
4982 cd0500    call    $0005
4985 11ee4c    ld      de,$4cee
4988 0e09      ld      c,$09
498a cd0500    call    $0005
498d 3a374b    ld      a,($4b37)
4990 b7        or      a
4991 200a      jr      nz,$499d
4993 11004d    ld      de,$4d00
4996 0e09      ld      c,$09
4998 cd0500    call    $0005
499b 180b      jr      $49a8
499d 47        ld      b,a
499e 21fb4a    ld      hl,$4afb
49a1 7e        ld      a,(hl)
49a2 23        inc     hl
49a3 cd7844    call    $4478		write char in A
49a6 10f9      djnz    $49a1
49a8 fde1      pop     iy
49aa dde1      pop     ix
49ac e1        pop     hl
49ad d1        pop     de
49ae c1        pop     bc
49af c9        ret     

49b0 2805      jr      z,$49b7
49b2 21a24c    ld      hl,$4ca2
49b5 1803      jr      $49ba
49b7 21a54c    ld      hl,$4ca5
49ba 010300    ld      bc,$0003
49bd edb0      ldir    
49bf c9        ret     

49c0 c5        push    bc
49c1 d5        push    de
49c2 e5        push    hl
49c3 21f14a    ld      hl,$4af1
49c6 11054d    ld      de,$4d05
49c9 014800    ld      bc,$0048
49cc edb0      ldir    
49ce e1        pop     hl
49cf d1        pop     de
49d0 c1        pop     bc
49d1 c9        ret     

49d2 c5        push    bc
49d3 d5        push    de
49d4 e5        push    hl
49d5 21054d    ld      hl,$4d05
49d8 11f14a    ld      de,$4af1
49db 18ec      jr      $49c9
49dd 2ab894    ld      hl,($94b8)
49e0 7e        ld      a,(hl)
49e1 b7        or      a
49e2 2807      jr      z,$49eb
49e4 3d        dec     a
49e5 2804      jr      z,$49eb
49e7 3e00      ld      a,$00
49e9 1810      jr      $49fb
49eb 11f14a    ld      de,$4af1
49ee 014800    ld      bc,$0048
49f1 edb0      ldir    
49f3 014800    ld      bc,$0048
49f6 cd3992    call    $9239
49f9 3e01      ld      a,$01
49fb c9        ret     

49fc cd8f42    call    $428f
49ff 11f14a    ld      de,$4af1
4a02 014800    ld      bc,$0048
4a05 cdca91    call    $91ca
4a08 c9        ret     

4a09 014800    ld      bc,$0048
4a0c c9        ret     

4a0d 3af24a    ld      a,($4af2)
4a10 b7        or      a
4a11 2801      jr      z,$4a14
4a13 37        scf     
4a14 c9        ret     

4a15 3af14a    ld      a,($4af1)
4a18 b7        or      a
4a19 2801      jr      z,$4a1c
4a1b 37        scf     
4a1c c9        ret     

4a1d e5        push    hl
4a1e 21384b    ld      hl,$4b38
4a21 cb4e      bit     1,(hl)
4a23 e1        pop     hl
4a24 c9        ret     

4a25 e5        push    hl
4a26 21384b    ld      hl,$4b38
4a29 cb46      bit     0,(hl)
4a2b e1        pop     hl
4a2c c9        ret     

4a2d 3af44a    ld      a,($4af4)
4a30 cdfa67    call    $67fa
4a33 3003      jr      nc,$4a38
4a35 32f44a    ld      ($4af4),a
4a38 c9        ret     

4a39 3af34a    ld      a,($4af3)
4a3c cddc67    call    $67dc
4a3f 3003      jr      nc,$4a44
4a41 32f34a    ld      ($4af3),a
4a44 c9        ret     

4a45 cd934a    call    $4a93
4a48 47        ld      b,a
4a49 cdd167    call    $67d1
4a4c 300f      jr      nc,$4a5d
4a4e 32f44a    ld      ($4af4),a
4a51 cd3f48    call    $483f
4a54 3807      jr      c,$4a5d
4a56 fd21f44a  ld      iy,$4af4
4a5a cd824a    call    $4a82
4a5d c9        ret     

4a5e cd974a    call    $4a97
4a61 47        ld      b,a
4a62 cd0568    call    $6805
4a65 300f      jr      nc,$4a76
4a67 32f34a    ld      ($4af3),a
4a6a cd3f48    call    $483f
4a6d 3807      jr      c,$4a76
4a6f fd21f34a  ld      iy,$4af3
4a73 cd824a    call    $4a82
4a76 c9        ret     

4a77 3e0a      ld      a,$0a
4a79 32f44a    ld      ($4af4),a
4a7c 3e46      ld      a,$46
4a7e 32f34a    ld      ($4af3),a
4a81 c9        ret     

4a82 cd2202    call    $0222
4a85 dd217dc6  ld      ix,$c67d
4a89 cd0544    call    $4405
4a8c fd7000    ld      (iy+$00),b
4a8f cd7d7a    call    $7a7d
4a92 c9        ret     

4a93 3af44a    ld      a,($4af4)
4a96 c9        ret     

4a97 3af34a    ld      a,($4af3)
4a9a c9        ret     

4a9b 3af54a    ld      a,($4af5)
4a9e c9        ret     

4a9f ed4bf64a  ld      bc,($4af6)
4aa3 c9        ret     

4aa4 3af84a    ld      a,($4af8)
4aa7 c9        ret     

4aa8 3af94a    ld      a,($4af9)
4aab c9        ret     

4aac 3afa4a    ld      a,($4afa)
4aaf c9        ret     

4ab0 4c        ld      c,h
4ab1 52        ld      d,d
4ab2 49        ld      c,c
4ab3 50        ld      d,b
4ab4 53        ld      d,e
4ab5 54        ld      d,h
4ab6 42        ld      b,d
4ab7 41        ld      b,c
4ab8 4a        ld      c,d
4ab9 57        ld      d,a
4aba 4e        ld      c,(hl)
4abb 48        ld      c,b
4abc 0d        dec     c
4abd 00        nop     
4abe 03        inc     bc
4abf 03        inc     bc
4ac0 02        ld      (bc),a
4ac1 05        dec     b
4ac2 010202    ld      bc,$0202
4ac5 00        nop     
4ac6 010001    ld      bc,$0100
4ac9 1a        ld      a,(de)
4aca 00        nop     
4acb ff        rst     $38
4acc 7f        ld      a,a
4acd 0a        ld      a,(bc)
4ace 00        nop     
4acf 1a        ld      a,(de)
4ad0 00        nop     
4ad1 1a        ld      a,(de)
4ad2 00        nop     
4ad3 f44af3    call    p,$f34a
4ad6 4a        ld      c,d
4ad7 f5        push    af
4ad8 4a        ld      c,d
4ad9 f64a      or      $4a
4adb f8        ret     m

4adc 4a        ld      c,d
4add f9        ld      sp,hl
4ade 4a        ld      c,d
4adf fa4a05    jp      m,$054a
4ae2 15        dec     d
4ae3 0616      ld      b,$16
4ae5 07        rlca    
4ae6 15        dec     d
4ae7 08        ex      af,af'
4ae8 13        inc     de
4ae9 09        add     hl,bc
4aea 180a      jr      $4af6
4aec 13        inc     de
4aed 0b        dec     bc
4aee 1813      jr      $4b03
4af0 1000      djnz    $4af2
4af2 00        nop     
4af3 46        ld      b,(hl)
4af4 0a        ld      a,(bc)
4af5 05        dec     b
4af6 37        scf     
4af7 00        nop     
4af8 010505    ld      bc,$0505
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
4b3a 74        ld      (hl),h
4b3b 68        ld      l,b
4b3c 65        ld      h,l
4b3d 2063      jr      nz,$4ba2
4b3f 75        ld      (hl),l
4b40 72        ld      (hl),d
4b41 72        ld      (hl),d
4b42 65        ld      h,l
4b43 6e        ld      l,(hl)
4b44 74        ld      (hl),h
4b45 2074      jr      nz,$4bbb
4b47 65        ld      h,l
4b48 78        ld      a,b
4b49 74        ld      (hl),h
4b4a 2066      jr      nz,$4bb2
4b4c 6f        ld      l,a
4b4d 72        ld      (hl),d
4b4e 6d        ld      l,l
4b4f 61        ld      h,c
4b50 74        ld      (hl),h
4b51 2073      jr      nz,$4bc6
4b53 65        ld      h,l
4b54 74        ld      (hl),h
4b55 74        ld      (hl),h
4b56 69        ld      l,c
4b57 6e        ld      l,(hl)
4b58 67        ld      h,a
4b59 73        ld      (hl),e
4b5a 2061      jr      nz,$4bbd
4b5c 72        ld      (hl),d
4b5d 65        ld      h,l
4b5e 3a0d0a    ld      a,($0a0d)
4b61 0a        ld      a,(bc)
4b62 4c        ld      c,h
4b63 65        ld      h,l
4b64 66        ld      h,(hl)
4b65 74        ld      (hl),h
4b66 206d      jr      nz,$4bd5
4b68 61        ld      h,c
4b69 72        ld      (hl),d
4b6a 67        ld      h,a
4b6b 69        ld      l,c
4b6c 6e        ld      l,(hl)
4b6d 2831      jr      z,$4ba0
4b6f 3029      jr      nc,$4b9a
4b71 3d        dec     a
4b72 2000      jr      nz,$4b74
4b74 00        nop     
4b75 00        nop     
4b76 00        nop     
4b77 00        nop     
4b78 00        nop     
4b79 0d        dec     c
4b7a 0a        ld      a,(bc)
4b7b 52        ld      d,d
4b7c 69        ld      l,c
4b7d 67        ld      h,a
4b7e 68        ld      l,b
4b7f 74        ld      (hl),h
4b80 206d      jr      nz,$4bef
4b82 61        ld      h,c
4b83 72        ld      (hl),d
4b84 67        ld      h,a
4b85 69        ld      l,c
4b86 6e        ld      l,(hl)
4b87 2837      jr      z,$4bc0
4b89 3029      jr      nc,$4bb4
4b8b 3d        dec     a
4b8c 2000      jr      nz,$4b8e
4b8e 00        nop     
4b8f 00        nop     
4b90 00        nop     
4b91 00        nop     
4b92 00        nop     
4b93 0d        dec     c
4b94 0a        ld      a,(bc)
4b95 49        ld      c,c
4b96 6e        ld      l,(hl)
4b97 64        ld      h,h
4b98 65        ld      h,l
4b99 6e        ld      l,(hl)
4b9a 74        ld      (hl),h
4b9b 61        ld      h,c
4b9c 74        ld      (hl),h
4b9d 69        ld      l,c
4b9e 6f        ld      l,a
4b9f 6e        ld      l,(hl)
4ba0 2835      jr      z,$4bd7
4ba2 29        add     hl,hl
4ba3 3d        dec     a
4ba4 2000      jr      nz,$4ba6
4ba6 00        nop     
4ba7 00        nop     
4ba8 00        nop     
4ba9 00        nop     
4baa 00        nop     
4bab 0d        dec     c
4bac 0a        ld      a,(bc)
4bad 50        ld      d,b
4bae 61        ld      h,c
4baf 67        ld      h,a
4bb0 65        ld      h,l
4bb1 206c      jr      nz,$4c1f
4bb3 65        ld      h,l
4bb4 6e        ld      l,(hl)
4bb5 67        ld      h,a
4bb6 74        ld      (hl),h
4bb7 68        ld      l,b
4bb8 2835      jr      z,$4bef
4bba 35        dec     (hl)
4bbb 29        add     hl,hl
4bbc 3d        dec     a
4bbd 2000      jr      nz,$4bbf
4bbf 00        nop     
4bc0 00        nop     
4bc1 00        nop     
4bc2 00        nop     
4bc3 00        nop     
4bc4 0d        dec     c
4bc5 0a        ld      a,(bc)
4bc6 53        ld      d,e
4bc7 70        ld      (hl),b
4bc8 61        ld      h,c
4bc9 63        ld      h,e
4bca 69        ld      l,c
4bcb 6e        ld      l,(hl)
4bcc 67        ld      h,a
4bcd 2c        inc     l
4bce 206c      jr      nz,$4c3c
4bd0 69        ld      l,c
4bd1 6e        ld      l,(hl)
4bd2 65        ld      h,l
4bd3 2831      jr      z,$4c06
4bd5 29        add     hl,hl
4bd6 3d        dec     a
4bd7 2000      jr      nz,$4bd9
4bd9 00        nop     
4bda 00        nop     
4bdb 00        nop     
4bdc 00        nop     
4bdd 00        nop     
4bde 0d        dec     c
4bdf 0a        ld      a,(bc)
4be0 54        ld      d,h
4be1 6f        ld      l,a
4be2 70        ld      (hl),b
4be3 206d      jr      nz,$4c52
4be5 61        ld      h,c
4be6 72        ld      (hl),d
4be7 67        ld      h,a
4be8 69        ld      l,c
4be9 6e        ld      l,(hl)
4bea 2835      jr      z,$4c21
4bec 29        add     hl,hl
4bed 3d        dec     a
4bee 2000      jr      nz,$4bf0
4bf0 00        nop     
4bf1 00        nop     
4bf2 00        nop     
4bf3 00        nop     
4bf4 00        nop     
4bf5 0d        dec     c
4bf6 0a        ld      a,(bc)
4bf7 42        ld      b,d
4bf8 6f        ld      l,a
4bf9 74        ld      (hl),h
4bfa 74        ld      (hl),h
4bfb 6f        ld      l,a
4bfc 6d        ld      l,l
4bfd 206d      jr      nz,$4c6c
4bff 61        ld      h,c
4c00 72        ld      (hl),d
4c01 67        ld      h,a
4c02 69        ld      l,c
4c03 6e        ld      l,(hl)
4c04 2835      jr      z,$4c3b
4c06 29        add     hl,hl
4c07 3d        dec     a
4c08 2000      jr      nz,$4c0a
4c0a 00        nop     
4c0b 00        nop     
4c0c 00        nop     
4c0d 00        nop     
4c0e 00        nop     
4c0f 0d        dec     c
4c10 0a        ld      a,(bc)
4c11 0a        ld      a,(bc)
4c12 61        ld      h,c
4c13 75        ld      (hl),l
4c14 74        ld      (hl),h
4c15 6f        ld      l,a
4c16 6d        ld      l,l
4c17 61        ld      h,c
4c18 74        ld      (hl),h
4c19 69        ld      l,c
4c1a 63        ld      h,e
4c1b 2066      jr      nz,$4c83
4c1d 6f        ld      l,a
4c1e 72        ld      (hl),d
4c1f 6d        ld      l,l
4c20 61        ld      h,c
4c21 74        ld      (hl),h
4c22 2066      jr      nz,$4c8a
4c24 75        ld      (hl),l
4c25 6e        ld      l,(hl)
4c26 63        ld      h,e
4c27 74        ld      (hl),h
4c28 69        ld      l,c
4c29 6f        ld      l,a
4c2a 6e        ld      l,(hl)
4c2b 2073      jr      nz,$4ca0
4c2d 74        ld      (hl),h
4c2e 61        ld      h,c
4c2f 74        ld      (hl),h
4c30 75        ld      (hl),l
4c31 73        ld      (hl),e
4c32 3a0d0a    ld      a,($0a0d)
4c35 0a        ld      a,(bc)
4c36 41        ld      b,c
4c37 6c        ld      l,h
4c38 69        ld      l,c
4c39 67        ld      h,a
4c3a 6e        ld      l,(hl)
4c3b 6d        ld      l,l
4c3c 65        ld      h,l
4c3d 6e        ld      l,(hl)
4c3e 74        ld      (hl),h
4c3f 2c        inc     l
4c40 2061      jr      nz,$4ca3
4c42 75        ld      (hl),l
4c43 74        ld      (hl),h
4c44 6f        ld      l,a
4c45 6d        ld      l,l
4c46 61        ld      h,c
4c47 74        ld      (hl),h
4c48 69        ld      l,c
4c49 63        ld      h,e
4c4a 3a204f    ld      a,($4f20)
4c4d 46        ld      b,(hl)
4c4e 46        ld      b,(hl)
4c4f 0d        dec     c
4c50 0a        ld      a,(bc)
4c51 4a        ld      c,d
4c52 75        ld      (hl),l
4c53 73        ld      (hl),e
4c54 74        ld      (hl),h
4c55 69        ld      l,c
4c56 66        ld      h,(hl)
4c57 69        ld      l,c
4c58 63        ld      h,e
4c59 61        ld      h,c
4c5a 74        ld      (hl),h
4c5b 69        ld      l,c
4c5c 6f        ld      l,a
4c5d 6e        ld      l,(hl)
4c5e 3a204f    ld      a,($4f20)
4c61 46        ld      b,(hl)
4c62 46        ld      b,(hl)
4c63 0d        dec     c
4c64 0a        ld      a,(bc)
4c65 57        ld      d,a
4c66 6f        ld      l,a
4c67 72        ld      (hl),d
4c68 64        ld      h,h
4c69 2068      jr      nz,$4cd3
4c6b 79        ld      a,c
4c6c 70        ld      (hl),b
4c6d 68        ld      l,b
4c6e 65        ld      h,l
4c6f 6e        ld      l,(hl)
4c70 61        ld      h,c
4c71 74        ld      (hl),h
4c72 69        ld      l,c
4c73 6f        ld      l,a
4c74 6e        ld      l,(hl)
4c75 3a204f    ld      a,($4f20)
4c78 46        ld      b,(hl)
4c79 46        ld      b,(hl)
4c7a 0d        dec     c
4c7b 0a        ld      a,(bc)
4c7c 4e        ld      c,(hl)
4c7d 75        ld      (hl),l
4c7e 6d        ld      l,l
4c7f 62        ld      h,d
4c80 65        ld      h,l
4c81 72        ld      (hl),d
4c82 69        ld      l,c
4c83 6e        ld      l,(hl)
4c84 67        ld      h,a
4c85 2026      jr      nz,$4cad
4c87 2061      jr      nz,$4cea
4c89 75        ld      (hl),l
4c8a 74        ld      (hl),h
4c8b 6f        ld      l,a
4c8c 6d        ld      l,l
4c8d 61        ld      h,c
4c8e 74        ld      (hl),h
4c8f 69        ld      l,c
4c90 63        ld      h,e
4c91 2070      jr      nz,$4d03
4c93 61        ld      h,c
4c94 67        ld      h,a
4c95 69        ld      l,c
4c96 6e        ld      l,(hl)
4c97 61        ld      h,c
4c98 74        ld      (hl),h
4c99 69        ld      l,c
4c9a 6f        ld      l,a
4c9b 6e        ld      l,(hl)
4c9c 3a204f    ld      a,($4f20)
4c9f 46        ld      b,(hl)
4ca0 46        ld      b,(hl)
4ca1 24        inc     h
4ca2 204f      jr      nz,$4cf3
4ca4 4e        ld      c,(hl)
4ca5 4f        ld      c,a
4ca6 46        ld      b,(hl)
4ca7 46        ld      b,(hl)
4ca8 2d        dec     l
4ca9 2d        dec     l
4caa 6e        ld      l,(hl)
4cab 75        ld      (hl),l
4cac 6d        ld      l,l
4cad 62        ld      h,d
4cae 65        ld      h,l
4caf 72        ld      (hl),d
4cb0 206c      jr      nz,$4d1e
4cb2 6f        ld      l,a
4cb3 63        ld      h,e
4cb4 61        ld      h,c
4cb5 74        ld      (hl),h
4cb6 65        ld      h,l
4cb7 64        ld      h,h
4cb8 3a2024    ld      a,($2420)
4cbb 54        ld      d,h
4cbc 4f        ld      c,a
4cbd 50        ld      d,b
4cbe 204c      jr      nz,$4d0c
4cc0 45        ld      b,l
4cc1 46        ld      b,(hl)
4cc2 54        ld      d,h
4cc3 2026      jr      nz,$4ceb
4cc5 2052      jr      nz,$4d19
4cc7 49        ld      c,c
4cc8 47        ld      b,a
4cc9 48        ld      c,b
4cca 54        ld      d,h
4ccb 24        inc     h
4ccc 54        ld      d,h
4ccd 4f        ld      c,a
4cce 50        ld      d,b
4ccf 2052      jr      nz,$4d23
4cd1 49        ld      c,c
4cd2 47        ld      b,a
4cd3 48        ld      c,b
4cd4 54        ld      d,h
4cd5 24        inc     h
4cd6 42        ld      b,d
4cd7 4f        ld      c,a
4cd8 54        ld      d,h
4cd9 54        ld      d,h
4cda 4f        ld      c,a
4cdb 4d        ld      c,l
4cdc 24        inc     h
4cdd 4e        ld      c,(hl)
4cde 4f        ld      c,a
4cdf 4e        ld      c,(hl)
4ce0 45        ld      b,l
4ce1 24        inc     h
4ce2 2020      jr      nz,$4d04
4ce4 4f        ld      c,a
4ce5 46        ld      b,(hl)
4ce6 46        ld      b,(hl)
4ce7 2020      jr      nz,$4d09
4ce9 2020      jr      nz,$4d0b
4ceb 202d      jr      nz,$4d1a
4ced 2d        dec     l
4cee 0d        dec     c
4cef 0a        ld      a,(bc)
4cf0 48        ld      c,b
4cf1 65        ld      h,l
4cf2 61        ld      h,c
4cf3 64        ld      h,h
4cf4 69        ld      l,c
4cf5 6e        ld      l,(hl)
4cf6 67        ld      h,a
4cf7 2c        inc     l
4cf8 2070      jr      nz,$4d6a
4cfa 61        ld      h,c
4cfb 67        ld      h,a
4cfc 65        ld      h,l
4cfd 3a2024    ld      a,($2420)
4d00 4e        ld      c,(hl)
4d01 4f        ld      c,a
4d02 4e        ld      c,(hl)
4d03 45        ld      b,l
4d04 24        inc     h
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
4d4d cd664f    call    $4f66
4d50 3827      jr      c,$4d79
4d52 1811      jr      $4d65
4d54 cd0e7d    call    $7d0e
4d57 3820      jr      c,$4d79
4d59 cd974f    call    $4f97
4d5c 3807      jr      c,$4d65
4d5e cd8b2d    call    $2d8b
4d61 fe01      cp      $01
4d63 2814      jr      z,$4d79
4d65 dd7e00    ld      a,(ix+$00)
4d68 fe87      cp      $87
4d6a 2809      jr      z,$4d75
4d6c fe8b      cp      $8b
4d6e 2805      jr      z,$4d75
4d70 e67f      and     $7f
4d72 cdb74f    call    $4fb7
4d75 fe1a      cp      $1a
4d77 20db      jr      nz,$4d54
4d79 cda54f    call    $4fa5
4d7c c9        ret     

4d7d 97        sub     a
4d7e 32644f    ld      ($4f64),a
4d81 32654f    ld      ($4f65),a
4d84 32604f    ld      ($4f60),a
4d87 cd664f    call    $4f66
4d8a da5c4f    jp      c,$4f5c
4d8d 211e76    ld      hl,$761e
4d90 06ff      ld      b,$ff
4d92 1812      jr      $4da6
4d94 cd974f    call    $4f97
4d97 380d      jr      c,$4da6
4d99 cd8b2d    call    $2d8b
4d9c fe01      cp      $01
4d9e 2006      jr      nz,$4da6
4da0 cdf550    call    $50f5
4da3 c35c4f    jp      $4f5c
4da6 dd7e00    ld      a,(ix+$00)
4da9 fe1a      cp      $1a
4dab 200d      jr      nz,$4dba
4dad 3a604f    ld      a,($4f60)
4db0 b7        or      a
4db1 20e6      jr      nz,$4d99
4db3 3e01      ld      a,$01
4db5 32604f    ld      ($4f60),a
4db8 1816      jr      $4dd0
4dba fe87      cp      $87
4dbc 28d6      jr      z,$4d94
4dbe fe8b      cp      $8b
4dc0 28d2      jr      z,$4d94
4dc2 e67f      and     $7f
4dc4 77        ld      (hl),a
4dc5 23        inc     hl
4dc6 fe0d      cp      $0d
4dc8 280a      jr      z,$4dd4
4dca fe0a      cp      $0a
4dcc 2806      jr      z,$4dd4
4dce 10c4      djnz    $4d94
4dd0 3e0d      ld      a,$0d
4dd2 77        ld      (hl),a
4dd3 23        inc     hl
4dd4 3e8c      ld      a,$8c
4dd6 32624f    ld      ($4f62),a
4dd9 cdb74f    call    $4fb7
4ddc 111e76    ld      de,$761e
4ddf b7        or      a
4de0 ed52      sbc     hl,de
4de2 cafe4e    jp      z,$4efe
4de5 44        ld      b,h
4de6 4d        ld      c,l
4de7 62        ld      h,d
4de8 6b        ld      l,e
4de9 7e        ld      a,(hl)
4dea 23        inc     hl
4deb fe0d      cp      $0d
4ded 2871      jr      z,$4e60
4def fe0a      cp      $0a
4df1 286d      jr      z,$4e60
4df3 fe20      cp      $20
4df5 2804      jr      z,$4dfb
4df7 fe09      cp      $09
4df9 2010      jr      nz,$4e0b
4dfb cdb74f    call    $4fb7
4dfe 0b        dec     bc
4dff c5        push    bc
4e00 e5        push    hl
4e01 54        ld      d,h
4e02 5d        ld      e,l
4e03 1b        dec     de
4e04 edb0      ldir    
4e06 e1        pop     hl
4e07 c1        pop     bc
4e08 2b        dec     hl
4e09 18de      jr      $4de9
4e0b 7e        ld      a,(hl)
4e0c 23        inc     hl
4e0d fe0d      cp      $0d
4e0f 284f      jr      z,$4e60
4e11 fe0a      cp      $0a
4e13 284b      jr      z,$4e60
4e15 fe09      cp      $09
4e17 cafe4e    jp      z,$4efe
4e1a fe20      cp      $20
4e1c 281e      jr      z,$4e3c
4e1e fe2e      cp      $2e
4e20 2808      jr      z,$4e2a
4e22 fe21      cp      $21
4e24 2804      jr      z,$4e2a
4e26 fe3f      cp      $3f
4e28 20e1      jr      nz,$4e0b
4e2a 7e        ld      a,(hl)
4e2b fe20      cp      $20
4e2d 20dc      jr      nz,$4e0b
4e2f 23        inc     hl
4e30 7e        ld      a,(hl)
4e31 fe20      cp      $20
4e33 20d6      jr      nz,$4e0b
4e35 23        inc     hl
4e36 3a644f    ld      a,($4f64)
4e39 3c        inc     a
4e3a 1803      jr      $4e3f
4e3c 3a644f    ld      a,($4f64)
4e3f 3c        inc     a
4e40 32644f    ld      ($4f64),a
4e43 0e00      ld      c,$00
4e45 7e        ld      a,(hl)
4e46 fe20      cp      $20
4e48 200d      jr      nz,$4e57
4e4a 3ecc      ld      a,$cc
4e4c 77        ld      (hl),a
4e4d 23        inc     hl
4e4e 0c        inc     c
4e4f 79        ld      a,c
4e50 fe05      cp      $05
4e52 d2fe4e    jp      nc,$4efe
4e55 18ee      jr      $4e45
4e57 3a654f    ld      a,($4f65)
4e5a 81        add     a,c
4e5b 32654f    ld      ($4f65),a
4e5e 18ab      jr      $4e0b
4e60 111e76    ld      de,$761e
4e63 b7        or      a
4e64 ed52      sbc     hl,de
4e66 cafe4e    jp      z,$4efe
4e69 7d        ld      a,l
4e6a 32634f    ld      ($4f63),a
4e6d 44        ld      b,h
4e6e 4d        ld      c,l
4e6f 62        ld      h,d
4e70 6b        ld      l,e
4e71 7e        ld      a,(hl)
4e72 fecc      cp      $cc
4e74 200b      jr      nz,$4e81
4e76 c5        push    bc
4e77 e5        push    hl
4e78 54        ld      d,h
4e79 5d        ld      e,l
4e7a 23        inc     hl
4e7b edb0      ldir    
4e7d e1        pop     hl
4e7e c1        pop     bc
4e7f 1801      jr      $4e82
4e81 23        inc     hl
4e82 0b        dec     bc
4e83 78        ld      a,b
4e84 b1        or      c
4e85 20ea      jr      nz,$4e71
4e87 97        sub     a
4e88 32614f    ld      ($4f61),a
4e8b 3a654f    ld      a,($4f65)
4e8e b7        or      a
4e8f 286d      jr      z,$4efe
4e91 4f        ld      c,a
4e92 3a644f    ld      a,($4f64)
4e95 47        ld      b,a
4e96 3a634f    ld      a,($4f63)
4e99 91        sub     c
4e9a 90        sub     b
4e9b 3861      jr      c,$4efe
4e9d 32634f    ld      ($4f63),a
4ea0 97        sub     a
4ea1 210000    ld      hl,$0000
4ea4 110000    ld      de,$0000
4ea7 3e0c      ld      a,$0c
4ea9 cd5d8c    call    $8c5d
4eac 0d        dec     c
4ead 20f8      jr      nz,$4ea7
4eaf 0ecc      ld      c,$cc
4eb1 58        ld      e,b
4eb2 b7        or      a
4eb3 ed52      sbc     hl,de
4eb5 3840      jr      c,$4ef7
4eb7 0c        inc     c
4eb8 79        ld      a,c
4eb9 fed2      cp      $d2
4ebb 3002      jr      nc,$4ebf
4ebd 18f3      jr      $4eb2
4ebf 3a634f    ld      a,($4f63)
4ec2 d602      sub     $02
4ec4 3838      jr      c,$4efe
4ec6 2836      jr      z,$4efe
4ec8 5f        ld      e,a
4ec9 b7        or      a
4eca ed52      sbc     hl,de
4ecc 380d      jr      c,$4edb
4ece 3a624f    ld      a,($4f62)
4ed1 3c        inc     a
4ed2 32624f    ld      ($4f62),a
4ed5 fe91      cp      $91
4ed7 3015      jr      nc,$4eee
4ed9 18ee      jr      $4ec9
4edb 19        add     hl,de
4edc 7c        ld      a,h
4edd b5        or      l
4ede 280e      jr      z,$4eee
4ee0 7d        ld      a,l
4ee1 32614f    ld      ($4f61),a
4ee4 3a624f    ld      a,($4f62)
4ee7 3c        inc     a
4ee8 32624f    ld      ($4f62),a
4eeb 210000    ld      hl,$0000
4eee 58        ld      e,b
4eef b7        or      a
4ef0 ed52      sbc     hl,de
4ef2 3803      jr      c,$4ef7
4ef4 0c        inc     c
4ef5 18f8      jr      $4eef
4ef7 19        add     hl,de
4ef8 45        ld      b,l
4ef9 211e76    ld      hl,$761e
4efc 1807      jr      $4f05
4efe 0600      ld      b,$00
4f00 0e20      ld      c,$20
4f02 211e76    ld      hl,$761e
4f05 3a624f    ld      a,($4f62)
4f08 cdb74f    call    $4fb7
4f0b 7e        ld      a,(hl)
4f0c fe0d      cp      $0d
4f0e 2831      jr      z,$4f41
4f10 fe0a      cp      $0a
4f12 282d      jr      z,$4f41
4f14 fe20      cp      $20
4f16 2010      jr      nz,$4f28
4f18 78        ld      a,b
4f19 b7        or      a
4f1a 2003      jr      nz,$4f1f
4f1c 79        ld      a,c
4f1d 1803      jr      $4f22
4f1f 05        dec     b
4f20 79        ld      a,c
4f21 3c        inc     a
4f22 cdb74f    call    $4fb7
4f25 23        inc     hl
4f26 18e3      jr      $4f0b
4f28 cdb74f    call    $4fb7
4f2b 23        inc     hl
4f2c 3a614f    ld      a,($4f61)
4f2f b7        or      a
4f30 28d9      jr      z,$4f0b
4f32 3d        dec     a
4f33 32614f    ld      ($4f61),a
4f36 20d3      jr      nz,$4f0b
4f38 3a624f    ld      a,($4f62)
4f3b 3d        dec     a
4f3c cdb74f    call    $4fb7
4f3f 18ca      jr      $4f0b
4f41 cdb74f    call    $4fb7
4f44 211e76    ld      hl,$761e
4f47 06ff      ld      b,$ff
4f49 97        sub     a
4f4a 32614f    ld      ($4f61),a
4f4d 32634f    ld      ($4f63),a
4f50 32644f    ld      ($4f64),a
4f53 32654f    ld      ($4f65),a
4f56 cd0e7d    call    $7d0e
4f59 d2944d    jp      nc,$4d94
4f5c cda54f    call    $4fa5
4f5f c9        ret     

4f60 00        nop     
4f61 00        nop     
4f62 8c        adc     a,h
4f63 00        nop     
4f64 00        nop     
4f65 00        nop     
4f66 97        sub     a
4f67 32d154    ld      ($54d1),a
4f6a 3e01      ld      a,$01
4f6c 32e054    ld      ($54e0),a
4f6f 210100    ld      hl,$0001
4f72 22d254    ld      ($54d2),hl
4f75 22d454    ld      ($54d4),hl
4f78 cd8b2d    call    $2d8b
4f7b cdbf53    call    $53bf
4f7e dde5      push    ix
4f80 3812      jr      c,$4f94
4f82 cd3150    call    $5031
4f85 380d      jr      c,$4f94
4f87 cd5150    call    $5051
4f8a 3808      jr      c,$4f94
4f8c dd2128c7  ld      ix,$c728
4f90 cd9d43    call    $439d
4f93 b7        or      a
4f94 dde1      pop     ix
4f96 c9        ret     

4f97 dd23      inc     ix
4f99 dde5      push    ix
4f9b d1        pop     de
4f9c 7a        ld      a,d
4f9d fe01      cp      $01
4f9f 2003      jr      nz,$4fa4
4fa1 7b        ld      a,e
4fa2 fe00      cp      $00
4fa4 c9        ret     

4fa5 cd003c    call    $3c00
4fa8 2007      jr      nz,$4fb1
4faa 3e0c      ld      a,$0c
4fac cd2352    call    $5223
4faf 1805      jr      $4fb6
4fb1 3e0d      ld      a,$0d
4fb3 cd2352    call    $5223
4fb6 c9        ret     

4fb7 f5        push    af
4fb8 c5        push    bc
4fb9 e5        push    hl
4fba fe0d      cp      $0d
4fbc 2804      jr      z,$4fc2
4fbe fe0a      cp      $0a
4fc0 2005      jr      nz,$4fc7
4fc2 cdf44f    call    $4ff4
4fc5 1829      jr      $4ff0
4fc7 fe1a      cp      $1a
4fc9 2005      jr      nz,$4fd0
4fcb cdf550    call    $50f5
4fce 1820      jr      $4ff0
4fd0 fe0c      cp      $0c
4fd2 2005      jr      nz,$4fd9
4fd4 cd2450    call    $5024
4fd7 1817      jr      $4ff0
4fd9 fe09      cp      $09
4fdb 2005      jr      nz,$4fe2
4fdd cd0f52    call    $520f
4fe0 180e      jr      $4ff0
4fe2 fe02      cp      $02
4fe4 2804      jr      z,$4fea
4fe6 fe03      cp      $03
4fe8 2003      jr      nz,$4fed
4fea cd9450    call    $5094
4fed cd2352    call    $5223
4ff0 e1        pop     hl
4ff1 c1        pop     bc
4ff2 f1        pop     af
4ff3 c9        ret     

4ff4 c5        push    bc
4ff5 d5        push    de
4ff6 e5        push    hl
4ff7 ed5bd254  ld      de,($54d2)
4ffb 3ae554    ld      a,($54e5)
4ffe b7        or      a
4fff 2817      jr      z,$5018
5001 2ae954    ld      hl,($54e9)
5004 b7        or      a
5005 ed52      sbc     hl,de
5007 2802      jr      z,$500b
5009 300d      jr      nc,$5018
500b 13        inc     de
500c ed53d254  ld      ($54d2),de
5010 cd5552    call    $5255
5013 cd2450    call    $5024
5016 1808      jr      $5020
5018 13        inc     de
5019 ed53d254  ld      ($54d2),de
501d cd5552    call    $5255
5020 e1        pop     hl
5021 d1        pop     de
5022 c1        pop     bc
5023 c9        ret     

5024 cdf550    call    $50f5
5027 cdef51    call    $51ef
502a cd7150    call    $5071
502d cd5051    call    $5150
5030 c9        ret     

5031 cd003c    call    $3c00
5034 2016      jr      nz,$504c
5036 dd2163c7  ld      ix,$c763
503a cd9d43    call    $439d
503d cd2e44    call    $442e
5040 2003      jr      nz,$5045
5042 37        scf     
5043 180b      jr      $5050
5045 3005      jr      nc,$504c
5047 cd603c    call    $3c60
504a 1803      jr      $504f
504c cd683c    call    $3c68
504f b7        or      a
5050 c9        ret     

5051 cd003c    call    $3c00
5054 2016      jr      nz,$506c
5056 dd217bc7  ld      ix,$c77b
505a cd9d43    call    $439d
505d cd2e44    call    $442e
5060 2003      jr      nz,$5065
5062 37        scf     
5063 180b      jr      $5070
5065 3005      jr      nc,$506c
5067 cd783c    call    $3c78
506a 1803      jr      $506f
506c cd803c    call    $3c80
506f b7        or      a
5070 c9        ret     

5071 dde5      push    ix
5073 cd583c    call    $3c58
5076 2819      jr      z,$5091
5078 dd213cc8  ld      ix,$c83c
507c cda343    call    $43a3
507f cd2202    call    $0222
5082 cda37d    call    $7da3		discard keys typed on terminal
5085 cdec7c    call    $7cec
5088 1e2e      ld      e,$2e
508a 3efd      ld      a,$fd
508c 0e02      ld      c,$02
508e cd0b8c    call    $8c0b
5091 dde1      pop     ix
5093 c9        ret     

5094 f5        push    af
5095 dde5      push    ix
5097 e67f      and     $7f
5099 cd703c    call    $3c70
509c 2853      jr      z,$50f1
509e fe02      cp      $02
50a0 281a      jr      z,$50bc
50a2 3ad154    ld      a,($54d1)
50a5 fe00      cp      $00
50a7 3848      jr      c,$50f1
50a9 3d        dec     a
50aa 32d154    ld      ($54d1),a
50ad dd21a1c7  ld      ix,$c7a1
50b1 fe00      cp      $00
50b3 fad550    jp      m,$50d5
50b6 dd210bc8  ld      ix,$c80b
50ba 1819      jr      $50d5
50bc 3ad154    ld      a,($54d1)
50bf fe01      cp      $01
50c1 f2f150    jp      p,$50f1
50c4 3c        inc     a
50c5 32d154    ld      ($54d1),a
50c8 dd21d5c7  ld      ix,$c7d5
50cc fe01      cp      $01
50ce f2d550    jp      p,$50d5
50d1 dd210bc8  ld      ix,$c80b
50d5 cd9d43    call    $439d
50d8 dd213cc8  ld      ix,$c83c
50dc cda343    call    $43a3
50df cd2202    call    $0222
50e2 cda37d    call    $7da3		discard keys typed on terminal
50e5 cdec7c    call    $7cec
50e8 1e2e      ld      e,$2e
50ea 3efd      ld      a,$fd
50ec 0e02      ld      c,$02
50ee cd0b8c    call    $8c0b
50f1 dde1      pop     ix
50f3 f1        pop     af
50f4 c9        ret     

50f5 c5        push    bc
50f6 d5        push    de
50f7 e5        push    hl
50f8 3ae554    ld      a,($54e5)
50fb cb4f      bit     1,a
50fd 284d      jr      z,$514c
50ff 2ad454    ld      hl,($54d4)
5102 ed5be154  ld      de,($54e1)
5106 b7        or      a
5107 ed52      sbc     hl,de
5109 3841      jr      c,$514c
510b 2ae954    ld      hl,($54e9)
510e 3aec54    ld      a,($54ec)
5111 cd5d8c    call    $8c5d
5114 54        ld      d,h
5115 5d        ld      e,l
5116 2ad254    ld      hl,($54d2)
5119 3aec54    ld      a,($54ec)
511c cd5d8c    call    $8c5d
511f 7a        ld      a,d
5120 bc        cp      h
5121 380c      jr      c,$512f
5123 2004      jr      nz,$5129
5125 7b        ld      a,e
5126 bd        cp      l
5127 3806      jr      c,$512f
5129 cd5552    call    $5255
512c 23        inc     hl
512d 18f0      jr      $511f
512f cd5552    call    $5255
5132 cd3b54    call    $543b
5135 3ae754    ld      a,($54e7)
5138 5f        ld      e,a
5139 3ae654    ld      a,($54e6)
513c 83        add     a,e
513d 80        add     a,b
513e cb3f      srl     a
5140 d606      sub     $06
5142 47        ld      b,a
5143 cd1b52    call    $521b
5146 cd5a54    call    $545a
5149 cd5552    call    $5255
514c e1        pop     hl
514d d1        pop     de
514e c1        pop     bc
514f c9        ret     

5150 c5        push    bc
5151 d5        push    de
5152 e5        push    hl
5153 3ae554    ld      a,($54e5)
5156 b7        or      a
5157 cad951    jp      z,$51d9
515a 2ad454    ld      hl,($54d4)
515d ed5be154  ld      de,($54e1)
5161 b7        or      a
5162 ed52      sbc     hl,de
5164 3865      jr      c,$51cb
5166 3ae554    ld      a,($54e5)
5169 cb4f      bit     1,a
516b 205b      jr      nz,$51c8
516d cb57      bit     2,a
516f 2821      jr      z,$5192
5171 cddd51    call    $51dd
5174 3a2a55    ld      a,($552a)
5177 47        ld      b,a
5178 3ae654    ld      a,($54e6)
517b 90        sub     b
517c 384d      jr      c,$51cb
517e d60b      sub     $0b
5180 2849      jr      z,$51cb
5182 3847      jr      c,$51cb
5184 f5        push    af
5185 cd3b54    call    $543b
5188 f1        pop     af
5189 47        ld      b,a
518a cd1b52    call    $521b
518d cd5a54    call    $545a
5190 1839      jr      $51cb
5192 cb5f      bit     3,a
5194 2835      jr      z,$51cb
5196 2ae354    ld      hl,($54e3)
5199 cb45      bit     0,l
519b 20d4      jr      nz,$5171
519d 3ae754    ld      a,($54e7)
51a0 b7        or      a
51a1 2807      jr      z,$51aa
51a3 3d        dec     a
51a4 2804      jr      z,$51aa
51a6 47        ld      b,a
51a7 cd1b52    call    $521b
51aa cd3b54    call    $543b
51ad cd5a54    call    $545a
51b0 3ae754    ld      a,($54e7)
51b3 5f        ld      e,a
51b4 3a2a55    ld      a,($552a)
51b7 4f        ld      c,a
51b8 3ae654    ld      a,($54e6)
51bb 91        sub     c
51bc 90        sub     b
51bd 93        sub     e
51be d605      sub     $05
51c0 3806      jr      c,$51c8
51c2 2804      jr      z,$51c8
51c4 47        ld      b,a
51c5 cd1b52    call    $521b
51c8 cddd51    call    $51dd
51cb 3aec54    ld      a,($54ec)
51ce b7        or      a
51cf 2808      jr      z,$51d9
51d1 47        ld      b,a
51d2 1803      jr      $51d7
51d4 cd5552    call    $5255
51d7 10fb      djnz    $51d4
51d9 e1        pop     hl
51da d1        pop     de
51db c1        pop     bc
51dc c9        ret     

51dd 3a2a55    ld      a,($552a)
51e0 b7        or      a
51e1 280b      jr      z,$51ee
51e3 47        ld      b,a
51e4 21ee54    ld      hl,$54ee
51e7 7e        ld      a,(hl)
51e8 cd2352    call    $5223
51eb 23        inc     hl
51ec 10f9      djnz    $51e7
51ee c9        ret     

51ef 3e0c      ld      a,$0c
51f1 cd2352    call    $5223
51f4 3e0d      ld      a,$0d
51f6 cd2352    call    $5223
51f9 110100    ld      de,$0001
51fc ed53d254  ld      ($54d2),de
5200 3e01      ld      a,$01
5202 32e054    ld      ($54e0),a
5205 ed5bd454  ld      de,($54d4)
5209 13        inc     de
520a ed53d454  ld      ($54d4),de
520e c9        ret     

520f 3ae054    ld      a,($54e0)
5212 47        ld      b,a
5213 3d        dec     a
5214 c608      add     a,$08
5216 e6f8      and     $f8
5218 3c        inc     a
5219 90        sub     b
521a 47        ld      b,a
521b 3e20      ld      a,$20
521d cd2352    call    $5223
5220 10f9      djnz    $521b
5222 c9        ret     

5223 dde5      push    ix
5225 fec0      cp      $c0
5227 300c      jr      nc,$5235
5229 fe01      cp      $01
522b 280f      jr      z,$523c
522d fe06      cp      $06
522f 280b      jr      z,$523c
5231 cb7f      bit     7,a
5233 2007      jr      nz,$523c
5235 dd21e054  ld      ix,$54e0
5239 dd3400    inc     (ix+$00)
523c cd003c    call    $3c00
523f 280b      jr      z,$524c
5241 c5        push    bc
5242 d5        push    de
5243 e5        push    hl
5244 cda430    call    $30a4
5247 e1        pop     hl
5248 d1        pop     de
5249 c1        pop     bc
524a 1806      jr      $5252
524c 5f        ld      e,a
524d 0e05      ld      c,$05
524f cd0500    call    $0005
5252 dde1      pop     ix
5254 c9        ret     

5255 f5        push    af
5256 c5        push    bc
5257 d5        push    de
5258 3e0d      ld      a,$0d
525a cd2352    call    $5223
525d 3e0a      ld      a,$0a
525f cd2352    call    $5223
5262 3e01      ld      a,$01
5264 32e054    ld      ($54e0),a
5267 d1        pop     de
5268 c1        pop     bc
5269 f1        pop     af
526a c9        ret     

526b cd003c    call    $3c00
526e 2817      jr      z,$5287
5270 218b52    ld      hl,$528b
5273 0e00      ld      c,$00
5275 cf        rst     $08
5276 08        ex      af,af'
5277 218b52    ld      hl,$528b
527a 11c254    ld      de,$54c2
527d 010900    ld      bc,$0009
5280 edb0      ldir    
5282 cd8654    call    $5486
5285 1803      jr      $528a
5287 cda54f    call    $4fa5
528a c9        ret     

528b 5f        ld      e,a
528c 66        ld      h,(hl)
528d 6f        ld      l,a
528e 6f        ld      l,a
528f 2e62      ld      l,$62
5291 61        ld      h,c
5292 72        ld      (hl),d
5293 00        nop     
5294 cd5150    call    $5051
5297 da3a53    jp      c,$533a
529a dd2128c7  ld      ix,$c728
529e cd9d43    call    $439d
52a1 fd21268a  ld      iy,$8a26
52a5 cd522a    call    $2a52
52a8 cd6d54    call    $546d
52ab 3e01      ld      a,$01
52ad 32e054    ld      ($54e0),a
52b0 cd0d4a    call    $4a0d
52b3 3026      jr      nc,$52db
52b5 21f24a    ld      hl,$4af2
52b8 014600    ld      bc,$0046
52bb 11e554    ld      de,$54e5
52be edb0      ldir    
52c0 97        sub     a
52c1 32d154    ld      ($54d1),a
52c4 210100    ld      hl,$0001
52c7 22d254    ld      ($54d2),hl
52ca cda269    call    $69a2
52cd 60        ld      h,b
52ce 69        ld      l,c
52cf 22e154    ld      ($54e1),hl
52d2 22e354    ld      ($54e3),hl
52d5 22d454    ld      ($54d4),hl
52d8 cd5051    call    $5150
52db cd3b53    call    $533b
52de 2807      jr      z,$52e7
52e0 cd0141    call    $4101
52e3 fe01      cp      $01
52e5 20f4      jr      nz,$52db
52e7 cda440    call    $40a4
52ea cd0e7d    call    $7d0e
52ed 3843      jr      c,$5332
52ef cda053    call    $53a0
52f2 fe01      cp      $01
52f4 2838      jr      z,$532e
52f6 fe0c      cp      $0c
52f8 2834      jr      z,$532e
52fa fe0d      cp      $0d
52fc 2804      jr      z,$5302
52fe fe0a      cp      $0a
5300 2011      jr      nz,$5313
5302 cd5552    call    $5255
5305 2ad254    ld      hl,($54d2)
5308 23        inc     hl
5309 22d254    ld      ($54d2),hl
530c cd3b53    call    $533b
530f 281d      jr      z,$532e
5311 18d7      jr      $52ea
5313 fe09      cp      $09
5315 2005      jr      nz,$531c
5317 cd0f52    call    $520f
531a 18ce      jr      $52ea
531c fe83      cp      $83
531e 2804      jr      z,$5324
5320 fe82      cp      $82
5322 2003      jr      nz,$5327
5324 cd9450    call    $5094
5327 e67f      and     $7f
5329 cd2352    call    $5223
532c 18bc      jr      $52ea
532e cdf550    call    $50f5
5331 b7        or      a
5332 f5        push    af
5333 cda54f    call    $4fa5
5336 cd7454    call    $5474
5339 f1        pop     af
533a c9        ret     

533b cda769    call    $69a7
533e 78        ld      a,b
533f b7        or      a
5340 2003      jr      nz,$5345
5342 79        ld      a,c
5343 fe01      cp      $01
5345 c9        ret     

5346 cd5150    call    $5051
5349 3854      jr      c,$539f
534b dd2128c7  ld      ix,$c728
534f cd9d43    call    $439d
5352 97        sub     a
5353 32d154    ld      ($54d1),a
5356 3e01      ld      a,$01
5358 32e054    ld      ($54e0),a
535b cd6041    call    $4160
535e cd0e7d    call    $7d0e
5361 3837      jr      c,$539a
5363 cd3e83    call    $833e
5366 fe19      cp      $19
5368 302f      jr      nc,$5399
536a cda053    call    $53a0
536d fe01      cp      $01
536f 2828      jr      z,$5399
5371 fe0d      cp      $0d
5373 2804      jr      z,$5379
5375 fe0a      cp      $0a
5377 2005      jr      nz,$537e
5379 cd5552    call    $5255
537c 18e0      jr      $535e
537e fe09      cp      $09
5380 2005      jr      nz,$5387
5382 cd0f52    call    $520f
5385 18d7      jr      $535e
5387 fe83      cp      $83
5389 2804      jr      z,$538f
538b fe82      cp      $82
538d 2003      jr      nz,$5392
538f cd9450    call    $5094
5392 e67f      and     $7f
5394 cd2352    call    $5223
5397 18c5      jr      $535e
5399 b7        or      a
539a f5        push    af
539b cda54f    call    $4fa5
539e f1        pop     af
539f c9        ret     

53a0 cd798f    call    $8f79
53a3 fe8b      cp      $8b
53a5 28f9      jr      z,$53a0
53a7 fe81      cp      $81
53a9 f5        push    af
53aa ccd63b    call    z,$3bd6
53ad f1        pop     af
53ae fe86      cp      $86
53b0 f5        push    af
53b1 cccd3b    call    z,$3bcd
53b4 f1        pop     af
53b5 fe87      cp      $87
53b7 2005      jr      nz,$53be
53b9 cdef3b    call    $3bef
53bc 18e2      jr      $53a0
53be c9        ret     

53bf c5        push    bc
53c0 d5        push    de
53c1 e5        push    hl
53c2 dde5      push    ix
53c4 fde5      push    iy
53c6 218000    ld      hl,$0080
53c9 7e        ld      a,(hl)
53ca fe02      cp      $02
53cc 3804      jr      c,$53d2
53ce 97        sub     a
53cf 23        inc     hl
53d0 1802      jr      $53d4
53d2 23        inc     hl
53d3 7e        ld      a,(hl)
53d4 32e554    ld      ($54e5),a
53d7 b7        or      a
53d8 283b      jr      z,$5415
53da 23        inc     hl
53db 014500    ld      bc,$0045
53de 11e654    ld      de,$54e6
53e1 edb0      ldir    
53e3 3ae554    ld      a,($54e5)
53e6 cb47      bit     0,a
53e8 2028      jr      nz,$5412
53ea cdbc7e    call    $7ebc
53ed cd2154    call    $5421
53f0 fd212154  ld      iy,$5421
53f4 3e04      ld      a,$04
53f6 cdd47d    call    $7dd4
53f9 381b      jr      c,$5416
53fb 22e154    ld      ($54e1),hl
53fe cd3354    call    $5433
5401 fd212954  ld      iy,$5429
5405 3e04      ld      a,$04
5407 cdd47d    call    $7dd4
540a 380a      jr      c,$5416
540c 22e354    ld      ($54e3),hl
540f 3ae554    ld      a,($54e5)
5412 cd5051    call    $5150
5415 b7        or      a
5416 cdb67e    call    $7eb6
5419 fde1      pop     iy
541b dde1      pop     ix
541d e1        pop     hl
541e d1        pop     de
541f c1        pop     bc
5420 c9        ret     

5421 dd2137c7  ld      ix,$c737
5425 cd9d43    call    $439d
5428 c9        ret     

5429 cd2154    call    $5421
542c ed4be154  ld      bc,($54e1)
5430 cd497f    call    $7f49
5433 dd2150c7  ld      ix,$c750
5437 cda343    call    $43a3
543a c9        ret     

543b e5        push    hl
543c 21e354    ld      hl,$54e3
543f 34        inc     (hl)
5440 4e        ld      c,(hl)
5441 23        inc     hl
5442 46        ld      b,(hl)
5443 0b        dec     bc
5444 21d654    ld      hl,$54d6
5447 cd678b    call    $8b67
544a 21d654    ld      hl,$54d6
544d 0606      ld      b,$06
544f 7e        ld      a,(hl)
5450 cda08c    call    $8ca0
5453 3803      jr      c,$5458
5455 23        inc     hl
5456 10f7      djnz    $544f
5458 e1        pop     hl
5459 c9        ret     

545a f5        push    af
545b c5        push    bc
545c e5        push    hl
545d 21d654    ld      hl,$54d6
5460 0606      ld      b,$06
5462 7e        ld      a,(hl)
5463 cd2352    call    $5223
5466 23        inc     hl
5467 10f9      djnz    $5462
5469 e1        pop     hl
546a c1        pop     bc
546b f1        pop     af
546c c9        ret     

546d cd003c    call    $3c00
5470 c48930    call    nz,$3089
5473 c9        ret     

5474 cd003c    call    $3c00
5477 2828      jr      z,$54a1
5479 cd3f30    call    $303f
547c fd21c254  ld      iy,$54c2
5480 119d27    ld      de,$279d
5483 cd0a43    call    $430a
5486 0e01      ld      c,$01
5488 210000    ld      hl,$0000
548b cf        rst     $08
548c 45        ld      b,l
548d 010000    ld      bc,$0000
5490 11b154    ld      de,$54b1
5493 21a254    ld      hl,$54a2
5496 cf        rst     $08
5497 4b        ld      c,e
5498 3007      jr      nc,$54a1
549a dd2151c3  ld      ix,$c351
549e cd0544    call    $4405
54a1 c9        ret     

54a2 2f        cpl     
54a3 62        ld      h,d
54a4 69        ld      l,c
54a5 6e        ld      l,(hl)
54a6 2f        cpl     
54a7 73        ld      (hl),e
54a8 70        ld      (hl),b
54a9 6f        ld      l,a
54aa 6f        ld      l,a
54ab 6c        ld      l,h
54ac 2e62      ld      l,$62
54ae 69        ld      l,c
54af 6e        ld      l,(hl)
54b0 00        nop     
54b1 b9        cp      c
54b2 54        ld      d,h
54b3 bf        cp      a
54b4 54        ld      d,h
54b5 c25400    jp      nz,$0054
54b8 00        nop     
54b9 73        ld      (hl),e
54ba 70        ld      (hl),b
54bb 6f        ld      l,a
54bc 6f        ld      l,a
54bd 6c        ld      l,h
54be 00        nop     
54bf 2d        dec     l
54c0 64        ld      h,h
54c1 00        nop     
54c2 00        nop     
54c3 00        nop     
54c4 00        nop     
54c5 00        nop     
54c6 00        nop     
54c7 00        nop     
54c8 00        nop     
54c9 00        nop     
54ca 00        nop     
54cb 00        nop     
54cc 00        nop     
54cd 00        nop     
54ce 00        nop     
54cf 00        nop     
54d0 00        nop     
54d1 00        nop     
54d2 00        nop     
54d3 00        nop     
54d4 00        nop     
54d5 00        nop     
54d6 00        nop     
54d7 00        nop     
54d8 00        nop     
54d9 00        nop     
54da 00        nop     
54db 00        nop     
54dc 00        nop     
54dd 00        nop     
54de 00        nop     
54df 00        nop     
54e0 00        nop     
54e1 00        nop     
54e2 00        nop     
54e3 00        nop     
54e4 00        nop     
54e5 00        nop     
54e6 00        nop     
54e7 00        nop     
54e8 00        nop     
54e9 00        nop     
54ea 00        nop     
54eb 00        nop     
54ec 00        nop     
54ed 00        nop     
54ee 00        nop     
54ef 00        nop     
54f0 00        nop     
54f1 00        nop     
54f2 00        nop     
54f3 00        nop     
54f4 00        nop     
54f5 00        nop     
54f6 00        nop     
54f7 00        nop     
54f8 00        nop     
54f9 00        nop     
54fa 00        nop     
54fb 00        nop     
54fc 00        nop     
54fd 00        nop     
54fe 00        nop     
54ff 00        nop     
5500 00        nop     
5501 00        nop     
5502 00        nop     
5503 00        nop     
5504 00        nop     
5505 00        nop     
5506 00        nop     
5507 00        nop     
5508 00        nop     
5509 00        nop     
550a 00        nop     
550b 00        nop     
550c 00        nop     
550d 00        nop     
550e 00        nop     
550f 00        nop     
5510 00        nop     
5511 00        nop     
5512 00        nop     
5513 00        nop     
5514 00        nop     
5515 00        nop     
5516 00        nop     
5517 00        nop     
5518 00        nop     
5519 00        nop     
551a 00        nop     
551b 00        nop     
551c 00        nop     
551d 00        nop     
551e 00        nop     
551f 00        nop     
5520 00        nop     
5521 00        nop     
5522 00        nop     
5523 00        nop     
5524 00        nop     
5525 00        nop     
5526 00        nop     
5527 00        nop     
5528 00        nop     
5529 00        nop     
552a 00        nop     
552b c5        push    bc
552c dde5      push    ix
552e fde5      push    iy
5530 cda555    call    $55a5
5533 cd7557    call    $5775
5536 b7        or      a
5537 2828      jr      z,$5561
5539 fef1      cp      $f1
553b 2005      jr      nz,$5542
553d cd893b    call    $3b89
5540 18f1      jr      $5533
5542 cd0e7d    call    $7d0e
5545 3815      jr      c,$555c
5547 cd8e55    call    $558e
554a 3010      jr      nc,$555c
554c cd6a55    call    $556a
554f 3006      jr      nc,$5557
5551 fe01      cp      $01
5553 2807      jr      z,$555c
5555 18df      jr      $5536
5557 cd0656    call    $5606
555a 18e6      jr      $5542
555c cdc955    call    $55c9
555f 1803      jr      $5564
5561 cdd155    call    $55d1
5564 fde1      pop     iy
5566 dde1      pop     ix
5568 c1        pop     bc
5569 c9        ret     

556a cdda55    call    $55da
556d cd7557    call    $5775
5570 b7        or      a
5571 2819      jr      z,$558c
5573 fef1      cp      $f1
5575 2815      jr      z,$558c
5577 320358    ld      ($5803),a
557a cdc442    call    $42c4
557d fe01      cp      $01
557f 280b      jr      z,$558c
5581 5f        ld      e,a
5582 3a0358    ld      a,($5803)
5585 cd2856    call    $5628
5588 3003      jr      nc,$558d
558a 18e1      jr      $556d
558c 37        scf     
558d c9        ret     

558e 320358    ld      ($5803),a
5591 cdc442    call    $42c4
5594 fe01      cp      $01
5596 280b      jr      z,$55a3
5598 5f        ld      e,a
5599 3a0358    ld      a,($5803)
559c cd2856    call    $5628
559f 30f0      jr      nc,$5591
55a1 1801      jr      $55a4
55a3 b7        or      a
55a4 c9        ret     

55a5 dd21b357  ld      ix,$57b3
55a9 cd233b    call    $3b23
55ac cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
55af fd210a58  ld      iy,$580a
55b3 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
55b6 fd210e58  ld      iy,$580e
55ba cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
55bd fd21983c  ld      iy,$3c98
55c1 fdcb00b6  res     6,(iy+$00)
55c5 cdc78e    call    $8ec7
55c8 c9        ret     

55c9 fd210a58  ld      iy,$580a
55cd cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
55d0 c9        ret     

55d1 fd210e58  ld      iy,$580e
55d5 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
55d8 37        scf     
55d9 c9        ret     

55da dd220458  ld      ($5804),ix
55de 3a983c    ld      a,($3c98)
55e1 e603      and     $03
55e3 321258    ld      ($5812),a
55e6 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
55e9 fd210658  ld      iy,$5806
55ed cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
55f0 cd813b    call    $3b81
55f3 2010      jr      nz,$5605
55f5 cdde42    call    $42de
55f8 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
55fb fd210e58  ld      iy,$580e
55ff cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5602 cdc442    call    $42c4
5605 c9        ret     

5606 fd210658  ld      iy,$5806
560a cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
560d cd1e41    call    $411e
5610 cd233b    call    $3b23
5613 fd21983c  ld      iy,$3c98
5617 3a1258    ld      a,($5812)
561a fdb600    or      (iy+$00)
561d 32983c    ld      ($3c98),a
5620 dd2a0458  ld      ix,($5804)
5624 dd7eff    ld      a,(ix-$01)
5627 c9        ret     

5628 c5        push    bc
5629 e5        push    hl
562a 320358    ld      ($5803),a
562d 010500    ld      bc,$0005
5630 217a56    ld      hl,$567a
5633 edb1      cpir    
5635 2820      jr      z,$5657
5637 cdff3a    call    $3aff
563a 2808      jr      z,$5644
563c 7b        ld      a,e
563d cd7c8c    call    $8c7c
5640 5f        ld      e,a
5641 3a0358    ld      a,($5803)
5644 cdef3a    call    $3aef
5647 2009      jr      nz,$5652
5649 fef0      cp      $f0
564b 2820      jr      z,$566d
564d bb        cp      e
564e 281d      jr      z,$566d
5650 1821      jr      $5673
5652 bb        cp      e
5653 281e      jr      z,$5673
5655 1816      jr      $566d
5657 3e04      ld      a,$04
5659 91        sub     c
565a cb27      sla     a
565c cdef3a    call    $3aef
565f 2007      jr      nz,$5668
5661 cd7f56    call    $567f
5664 2807      jr      z,$566d
5666 180b      jr      $5673
5668 cd7f56    call    $567f
566b 2806      jr      z,$5673
566d cd233b    call    $3b23
5670 37        scf     
5671 1801      jr      $5674
5673 b7        or      a
5674 e1        pop     hl
5675 c1        pop     bc
5676 3a0358    ld      a,($5803)
5679 c9        ret     

567a 81        add     a,c
567b 82        add     a,d
567c f5        push    af
567d f6f7      or      $f7
567f 219156    ld      hl,$5691
5682 cd5d8c    call    $8c5d
5685 7e        ld      a,(hl)
5686 23        inc     hl
5687 66        ld      h,(hl)
5688 6f        ld      l,a
5689 4e        ld      c,(hl)
568a 0600      ld      b,$00
568c 23        inc     hl
568d 7b        ld      a,e
568e edb1      cpir    
5690 c9        ret     

5691 9b        sbc     a,e
5692 56        ld      d,(hl)
5693 d8        ret     c

5694 56        ld      d,(hl)
5695 15        dec     d
5696 57        ld      d,a
5697 4a        ld      c,d
5698 57        ld      d,a
5699 55        ld      d,l
569a 57        ld      d,a
569b 00        nop     
569c 00        nop     
569d 00        nop     
569e 00        nop     
569f 00        nop     
56a0 00        nop     
56a1 00        nop     
56a2 00        nop     
56a3 00        nop     
56a4 00        nop     
56a5 00        nop     
56a6 00        nop     
56a7 00        nop     
56a8 00        nop     
56a9 00        nop     
56aa 00        nop     
56ab 00        nop     
56ac 00        nop     
56ad 00        nop     
56ae 00        nop     
56af 00        nop     
56b0 00        nop     
56b1 00        nop     
56b2 00        nop     
56b3 00        nop     
56b4 00        nop     
56b5 00        nop     
56b6 00        nop     
56b7 00        nop     
56b8 00        nop     
56b9 00        nop     
56ba 00        nop     
56bb 00        nop     
56bc 00        nop     
56bd 00        nop     
56be 00        nop     
56bf 00        nop     
56c0 00        nop     
56c1 00        nop     
56c2 00        nop     
56c3 00        nop     
56c4 00        nop     
56c5 00        nop     
56c6 00        nop     
56c7 00        nop     
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
56d2 00        nop     
56d3 00        nop     
56d4 00        nop     
56d5 00        nop     
56d6 00        nop     
56d7 00        nop     
56d8 00        nop     
56d9 00        nop     
56da 00        nop     
56db 00        nop     
56dc 00        nop     
56dd 00        nop     
56de 00        nop     
56df 00        nop     
56e0 00        nop     
56e1 00        nop     
56e2 00        nop     
56e3 00        nop     
56e4 00        nop     
56e5 00        nop     
56e6 00        nop     
56e7 00        nop     
56e8 00        nop     
56e9 00        nop     
56ea 00        nop     
56eb 00        nop     
56ec 00        nop     
56ed 00        nop     
56ee 00        nop     
56ef 00        nop     
56f0 00        nop     
56f1 00        nop     
56f2 00        nop     
56f3 00        nop     
56f4 00        nop     
56f5 00        nop     
56f6 00        nop     
56f7 00        nop     
56f8 00        nop     
56f9 00        nop     
56fa 00        nop     
56fb 00        nop     
56fc 00        nop     
56fd 00        nop     
56fe 00        nop     
56ff 00        nop     
5700 00        nop     
5701 00        nop     
5702 00        nop     
5703 00        nop     
5704 00        nop     
5705 00        nop     
5706 00        nop     
5707 00        nop     
5708 00        nop     
5709 00        nop     
570a 00        nop     
570b 00        nop     
570c 00        nop     
570d 00        nop     
570e 00        nop     
570f 00        nop     
5710 00        nop     
5711 00        nop     
5712 00        nop     
5713 00        nop     
5714 00        nop     
5715 34        inc     (hl)
5716 61        ld      h,c
5717 62        ld      h,d
5718 63        ld      h,e
5719 64        ld      h,h
571a 65        ld      h,l
571b 66        ld      h,(hl)
571c 67        ld      h,a
571d 68        ld      l,b
571e 69        ld      l,c
571f 6a        ld      l,d
5720 6b        ld      l,e
5721 6c        ld      l,h
5722 6d        ld      l,l
5723 6e        ld      l,(hl)
5724 6f        ld      l,a
5725 70        ld      (hl),b
5726 71        ld      (hl),c
5727 72        ld      (hl),d
5728 73        ld      (hl),e
5729 74        ld      (hl),h
572a 75        ld      (hl),l
572b 76        halt    
572c 77        ld      (hl),a
572d 78        ld      a,b
572e 79        ld      a,c
572f 7a        ld      a,d
5730 41        ld      b,c
5731 42        ld      b,d
5732 43        ld      b,e
5733 44        ld      b,h
5734 45        ld      b,l
5735 46        ld      b,(hl)
5736 47        ld      b,a
5737 48        ld      c,b
5738 49        ld      c,c
5739 4a        ld      c,d
573a 4b        ld      c,e
573b 4c        ld      c,h
573c 4d        ld      c,l
573d 4e        ld      c,(hl)
573e 4f        ld      c,a
573f 50        ld      d,b
5740 51        ld      d,c
5741 52        ld      d,d
5742 53        ld      d,e
5743 54        ld      d,h
5744 55        ld      d,l
5745 56        ld      d,(hl)
5746 57        ld      d,a
5747 58        ld      e,b
5748 59        ld      e,c
5749 5a        ld      e,d
574a 0a        ld      a,(bc)
574b 313233    ld      sp,$3332
574e 34        inc     (hl)
574f 35        dec     (hl)
5750 3637      ld      (hl),$37
5752 3839      jr      c,$578d
5754 301f      jr      nc,$5775
5756 212223    ld      hl,$2322
5759 24        inc     h
575a 25        dec     h
575b 2627      ld      h,$27
575d 2829      jr      z,$5788
575f 5f        ld      e,a
5760 60        ld      h,b
5761 7b        ld      a,e
5762 7d        ld      a,l
5763 7e        ld      a,(hl)
5764 7c        ld      a,h
5765 40        ld      b,b
5766 5b        ld      e,e
5767 5d        ld      e,l
5768 5e        ld      e,(hl)
5769 2d        dec     l
576a 3d        dec     a
576b 3b        dec     sp
576c 2b        dec     hl
576d 3a2a2c    ld      a,($2c2a)
5770 3c        inc     a
5771 2e3e      ld      l,$3e
5773 2f        cpl     
5774 3f        ccf     
5775 dd7e00    ld      a,(ix+$00)
5778 dd23      inc     ix
577a fef2      cp      $f2
577c 2005      jr      nz,$5783
577e cdf73a    call    $3af7
5781 18f2      jr      $5775
5783 fef8      cp      $f8
5785 2005      jr      nz,$578c
5787 cd1b3b    call    $3b1b
578a 18e9      jr      $5775
578c c9        ret     

578d dd7e00    ld      a,(ix+$00)
5790 dd2b      dec     ix
5792 c9        ret     

5793 f5        push    af
5794 c5        push    bc
5795 d5        push    de
5796 e5        push    hl
5797 219b56    ld      hl,$569b
579a 111358    ld      de,$5813
579d 017a00    ld      bc,$007a
57a0 edb0      ldir    
57a2 e1        pop     hl
57a3 d1        pop     de
57a4 c1        pop     bc
57a5 f1        pop     af
57a6 c9        ret     

57a7 f5        push    af
57a8 c5        push    bc
57a9 d5        push    de
57aa e5        push    hl
57ab 211358    ld      hl,$5813
57ae 119b56    ld      de,$569b
57b1 18ea      jr      $579d
57b3 00        nop     
57b4 00        nop     
57b5 00        nop     
57b6 00        nop     
57b7 00        nop     
57b8 00        nop     
57b9 00        nop     
57ba 00        nop     
57bb 00        nop     
57bc 00        nop     
57bd 00        nop     
57be 00        nop     
57bf 00        nop     
57c0 00        nop     
57c1 00        nop     
57c2 00        nop     
57c3 00        nop     
57c4 00        nop     
57c5 00        nop     
57c6 00        nop     
57c7 00        nop     
57c8 00        nop     
57c9 00        nop     
57ca 00        nop     
57cb 00        nop     
57cc 00        nop     
57cd 00        nop     
57ce 00        nop     
57cf 00        nop     
57d0 00        nop     
57d1 00        nop     
57d2 00        nop     
57d3 00        nop     
57d4 00        nop     
57d5 00        nop     
57d6 00        nop     
57d7 00        nop     
57d8 00        nop     
57d9 00        nop     
57da 00        nop     
57db 00        nop     
57dc 00        nop     
57dd 00        nop     
57de 00        nop     
57df 00        nop     
57e0 00        nop     
57e1 00        nop     
57e2 00        nop     
57e3 00        nop     
57e4 00        nop     
57e5 00        nop     
57e6 00        nop     
57e7 00        nop     
57e8 00        nop     
57e9 00        nop     
57ea 00        nop     
57eb 00        nop     
57ec 00        nop     
57ed 00        nop     
57ee 00        nop     
57ef 00        nop     
57f0 00        nop     
57f1 00        nop     
57f2 00        nop     
57f3 00        nop     
57f4 00        nop     
57f5 00        nop     
57f6 00        nop     
57f7 00        nop     
57f8 00        nop     
57f9 00        nop     
57fa 00        nop     
57fb 00        nop     
57fc 00        nop     
57fd 00        nop     
57fe 00        nop     
57ff 00        nop     
5800 00        nop     
5801 00        nop     
5802 00        nop     
5803 00        nop     
5804 00        nop     
5805 00        nop     
5806 00        nop     
5807 00        nop     
5808 00        nop     
5809 00        nop     
580a 00        nop     
580b 00        nop     
580c 00        nop     
580d 00        nop     
580e 00        nop     
580f 00        nop     
5810 00        nop     
5811 00        nop     
5812 00        nop     
5813 00        nop     
5814 00        nop     
5815 00        nop     
5816 00        nop     
5817 00        nop     
5818 00        nop     
5819 00        nop     
581a 00        nop     
581b 00        nop     
581c 00        nop     
581d 00        nop     
581e 00        nop     
581f 00        nop     
5820 00        nop     
5821 00        nop     
5822 00        nop     
5823 00        nop     
5824 00        nop     
5825 00        nop     
5826 00        nop     
5827 00        nop     
5828 00        nop     
5829 00        nop     
582a 00        nop     
582b 00        nop     
582c 00        nop     
582d 00        nop     
582e 00        nop     
582f 00        nop     
5830 00        nop     
5831 00        nop     
5832 00        nop     
5833 00        nop     
5834 00        nop     
5835 00        nop     
5836 00        nop     
5837 00        nop     
5838 00        nop     
5839 00        nop     
583a 00        nop     
583b 00        nop     
583c 00        nop     
583d 00        nop     
583e 00        nop     
583f 00        nop     
5840 00        nop     
5841 00        nop     
5842 00        nop     
5843 00        nop     
5844 00        nop     
5845 00        nop     
5846 00        nop     
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
585c 00        nop     
585d 00        nop     
585e 00        nop     
585f 00        nop     
5860 00        nop     
5861 00        nop     
5862 00        nop     
5863 00        nop     
5864 00        nop     
5865 00        nop     
5866 00        nop     
5867 00        nop     
5868 00        nop     
5869 00        nop     
586a 00        nop     
586b 00        nop     
586c 00        nop     
586d 00        nop     
586e 00        nop     
586f 00        nop     
5870 00        nop     
5871 00        nop     
5872 00        nop     
5873 00        nop     
5874 00        nop     
5875 00        nop     
5876 00        nop     
5877 00        nop     
5878 00        nop     
5879 00        nop     
587a 00        nop     
587b 00        nop     
587c 00        nop     
587d 00        nop     
587e 00        nop     
587f 00        nop     
5880 00        nop     
5881 00        nop     
5882 00        nop     
5883 00        nop     
5884 00        nop     
5885 00        nop     
5886 00        nop     
5887 00        nop     
5888 00        nop     
5889 00        nop     
588a 00        nop     
588b 00        nop     
588c 00        nop     
588d e5        push    hl
588e dde5      push    ix
5890 cdf058    call    $58f0
5893 cdbc7e    call    $7ebc
5896 cd2c03    call    $032c
5899 cd2c59    call    $592c
589c 21645e    ld      hl,$5e64
589f fd21ef58  ld      iy,$58ef
58a3 dd2100ad  ld      ix,$ad00
58a7 cda17e    call    $7ea1
58aa cd1a03    call    $031a
58ad 3837      jr      c,$58e6
58af 28e5      jr      z,$5896
58b1 fe0d      cp      $0d
58b3 2834      jr      z,$58e9
58b5 78        ld      a,b
58b6 80        add     a,b
58b7 010000    ld      bc,$0000
58ba 4f        ld      c,a
58bb dd21695e  ld      ix,$5e69
58bf dd09      add     ix,bc
58c1 dd6e00    ld      l,(ix+$00)
58c4 dd6601    ld      h,(ix+$01)
58c7 e9        jp      (hl)
58c8 cdff3a    call    $3aff
58cb cd1359    call    $5913
58ce 18c6      jr      $5896
58d0 ed5b6f5e  ld      de,($5e6f)
58d4 3e31      ld      a,$31
58d6 1806      jr      $58de
58d8 ed5b715e  ld      de,($5e71)
58dc 3e32      ld      a,$32
58de cd735a    call    $5a73
58e1 cd6a59    call    $596a
58e4 18b0      jr      $5896
58e6 cdfc58    call    $58fc
58e9 cdb67e    call    $7eb6
58ec dde1      pop     ix
58ee e1        pop     hl
58ef c9        ret     

58f0 f5        push    af
58f1 3a983c    ld      a,($3c98)
58f4 321259    ld      ($5912),a
58f7 cd9357    call    $5793
58fa f1        pop     af
58fb c9        ret     

58fc f5        push    af
58fd c5        push    bc
58fe d5        push    de
58ff e5        push    hl
5900 3a1259    ld      a,($5912)
5903 ee04      xor     $04
5905 cb57      bit     2,a
5907 cd1359    call    $5913
590a cda757    call    $57a7
590d e1        pop     hl
590e d1        pop     de
590f c1        pop     bc
5910 f1        pop     af
5911 c9        ret     

5912 00        nop     
5913 2808      jr      z,$591d
5915 cd133b    call    $3b13
5918 214e5e    ld      hl,$5e4e
591b 1806      jr      $5923
591d cd0b3b    call    $3b0b
5920 21595e    ld      hl,$5e59
5923 11425e    ld      de,$5e42
5926 010b00    ld      bc,$000b
5929 edb0      ldir    
592b c9        ret     

592c c5        push    bc
592d d5        push    de
592e dde5      push    ix
5930 dd213c5e  ld      ix,$5e3c
5934 cd9d43    call    $439d
5937 11155e    ld      de,$5e15
593a 0e09      ld      c,$09
593c cd0500    call    $0005
593f dd219156  ld      ix,$5691
5943 0602      ld      b,$02
5945 3e33      ld      a,$33
5947 90        sub     b
5948 32395e    ld      ($5e39),a
594b 11395e    ld      de,$5e39
594e 0e09      ld      c,$09
5950 cd0500    call    $0005
5953 dd5e00    ld      e,(ix+$00)
5956 dd23      inc     ix
5958 dd5600    ld      d,(ix+$00)
595b dd23      inc     ix
595d cda55a    call    $5aa5
5960 cd3002    call    $0230
5963 10e0      djnz    $5945
5965 dde1      pop     ix
5967 d1        pop     de
5968 c1        pop     bc
5969 c9        ret     

596a c5        push    bc
596b d5        push    de
596c e5        push    hl
596d dde5      push    ix
596f fde5      push    iy
5971 32385e    ld      ($5e38),a
5974 d631      sub     $31
5976 cb27      sla     a
5978 219156    ld      hl,$5691
597b cd5d8c    call    $8c5d
597e 7e        ld      a,(hl)
597f 23        inc     hl
5980 66        ld      h,(hl)
5981 6f        ld      l,a
5982 221c5a    ld      ($5a1c),hl
5985 211e5a    ld      hl,$5a1e
5988 3600      ld      (hl),$00
598a 23        inc     hl
598b e5        push    hl
598c fde1      pop     iy
598e fde5      push    iy
5990 dd211caf  ld      ix,$af1c
5994 fd215b5a  ld      iy,$5a5b
5998 cd527e    call    $7e52
599b fde1      pop     iy
599d 3874      jr      c,$5a13
599f 2008      jr      nz,$59a9
59a1 111e5a    ld      de,$5a1e
59a4 cd7a5a    call    $5a7a
59a7 18e5      jr      $598e
59a9 cdb28c    call    $8cb2
59ac 3031      jr      nc,$59df
59ae 32b65d    ld      ($5db6),a
59b1 3a1e5a    ld      a,($5a1e)
59b4 b7        or      a
59b5 2817      jr      z,$59ce
59b7 211f5a    ld      hl,$5a1f
59ba 3a1e5a    ld      a,($5a1e)
59bd 4f        ld      c,a
59be 0600      ld      b,$00
59c0 3ab65d    ld      a,($5db6)
59c3 edb1      cpir    
59c5 2846      jr      z,$5a0d
59c7 3a1e5a    ld      a,($5a1e)
59ca fe3c      cp      $3c
59cc 303f      jr      nc,$5a0d
59ce 3c        inc     a
59cf 321e5a    ld      ($5a1e),a
59d2 3ab65d    ld      a,($5db6)
59d5 fd7700    ld      (iy+$00),a
59d8 fd23      inc     iy
59da cd7844    call    $4478		write char in A
59dd 18af      jr      $598e
59df fe08      cp      $08
59e1 2804      jr      z,$59e7
59e3 fe7f      cp      $7f
59e5 2011      jr      nz,$59f8
59e7 3a1e5a    ld      a,($5a1e)
59ea b7        or      a
59eb 2820      jr      z,$5a0d
59ed cd0603    call    $0306
59f0 3d        dec     a
59f1 321e5a    ld      ($5a1e),a
59f4 fd2b      dec     iy
59f6 1896      jr      $598e
59f8 fe0d      cp      $0d
59fa 2011      jr      nz,$5a0d
59fc 211e5a    ld      hl,$5a1e
59ff ed5b1c5a  ld      de,($5a1c)
5a03 0600      ld      b,$00
5a05 4e        ld      c,(hl)
5a06 03        inc     bc
5a07 edb0      ldir    
5a09 3e01      ld      a,$01
5a0b 1807      jr      $5a14
5a0d cd2202    call    $0222
5a10 c38e59    jp      $598e
5a13 97        sub     a
5a14 fde1      pop     iy
5a16 dde1      pop     ix
5a18 e1        pop     hl
5a19 d1        pop     de
5a1a c1        pop     bc
5a1b c9        ret     

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
5a42 00        nop     
5a43 00        nop     
5a44 00        nop     
5a45 00        nop     
5a46 00        nop     
5a47 00        nop     
5a48 00        nop     
5a49 00        nop     
5a4a 00        nop     
5a4b 00        nop     
5a4c 00        nop     
5a4d 00        nop     
5a4e 00        nop     
5a4f 00        nop     
5a50 00        nop     
5a51 00        nop     
5a52 00        nop     
5a53 00        nop     
5a54 00        nop     
5a55 00        nop     
5a56 00        nop     
5a57 00        nop     
5a58 00        nop     
5a59 00        nop     
5a5a 00        nop     
5a5b cd2c59    call    $592c
5a5e 3a385e    ld      a,($5e38)
5a61 fe31      cp      $31
5a63 2006      jr      nz,$5a6b
5a65 ed5b6f5e  ld      de,($5e6f)
5a69 1808      jr      $5a73
5a6b fe32      cp      $32
5a6d 200a      jr      nz,$5a79
5a6f ed5b715e  ld      de,($5e71)
5a73 cd2e04    call    $042e		CDOS: set special crt function
5a76 cd4202    call    $0242
5a79 c9        ret     

5a7a c5        push    bc
5a7b d5        push    de
5a7c dde5      push    ix
5a7e d5        push    de
5a7f dde1      pop     ix
5a81 dd7e00    ld      a,(ix+$00)
5a84 b7        or      a
5a85 200a      jr      nz,$5a91
5a87 11095e    ld      de,$5e09
5a8a 0e09      ld      c,$09
5a8c cd0500    call    $0005
5a8f 180f      jr      $5aa0
5a91 47        ld      b,a
5a92 dd23      inc     ix
5a94 dd5e00    ld      e,(ix+$00)
5a97 0e02      ld      c,$02
5a99 cd0500    call    $0005
5a9c dd23      inc     ix
5a9e 10f4      djnz    $5a94
5aa0 dde1      pop     ix
5aa2 d1        pop     de
5aa3 c1        pop     bc
5aa4 c9        ret     

5aa5 d5        push    de
5aa6 1e7b      ld      e,$7b
5aa8 0e02      ld      c,$02
5aaa cd0500    call    $0005
5aad d1        pop     de
5aae cd7a5a    call    $5a7a
5ab1 1e7d      ld      e,$7d
5ab3 0e02      ld      c,$02
5ab5 cd0500    call    $0005
5ab8 c9        ret     

5ab9 d5        push    de
5aba e5        push    hl
5abb dde5      push    ix
5abd 1600      ld      d,$00
5abf 3e04      ld      a,$04
5ac1 cd6503    call    $0365
5ac4 21b357    ld      hl,$57b3
5ac7 dd216db0  ld      ix,$b06d
5acb cd527e    call    $7e52
5ace f5        push    af
5acf fe0d      cp      $0d
5ad1 2008      jr      nz,$5adb
5ad3 3aa75c    ld      a,($5ca7)
5ad6 47        ld      b,a
5ad7 f1        pop     af
5ad8 c37f5c    jp      $5c7f
5adb cd233b    call    $3b23
5ade cd2e3b    call    $3b2e
5ae1 f1        pop     af
5ae2 1807      jr      $5aeb
5ae4 dd216db0  ld      ix,$b06d
5ae8 cd527e    call    $7e52
5aeb daa45c    jp      c,$5ca4
5aee cdb28c    call    $8cb2
5af1 3033      jr      nc,$5b26
5af3 cdbf85    call    $85bf
5af6 38ec      jr      c,$5ae4
5af8 cd7844    call    $4478		write char in A
5afb dd21983c  ld      ix,$3c98
5aff ddcb004e  bit     1,(ix+$00)
5b03 2010      jr      nz,$5b15
5b05 ddcb0046  bit     0,(ix+$00)
5b09 280d      jr      z,$5b18
5b0b cdbf85    call    $85bf
5b0e 3005      jr      nc,$5b15
5b10 cdf285    call    $85f2
5b13 18cf      jr      $5ae4
5b15 cdb45c    call    $5cb4
5b18 cdff3a    call    $3aff
5b1b c47c8c    call    nz,$8c7c
5b1e cd795d    call    $5d79
5b21 cd233b    call    $3b23
5b24 18be      jr      $5ae4
5b26 fe08      cp      $08
5b28 2804      jr      z,$5b2e
5b2a fe7f      cp      $7f
5b2c 2010      jr      nz,$5b3e
5b2e 3e00      ld      a,$00
5b30 ba        cp      d
5b31 2806      jr      z,$5b39
5b33 cdbc5c    call    $5cbc
5b36 15        dec     d
5b37 18ab      jr      $5ae4
5b39 cd2202    call    $0222
5b3c 18a6      jr      $5ae4
5b3e dd21983c  ld      ix,$3c98
5b42 ddcb004e  bit     1,(ix+$00)
5b46 c2975c    jp      nz,$5c97
5b49 fef3      cp      $f3
5b4b 207c      jr      nz,$5bc9
5b4d dd21b75d  ld      ix,$5db7
5b51 cd7d5d    call    $5d7d
5b54 da8a5c    jp      c,$5c8a
5b57 dd21dbae  ld      ix,$aedb
5b5b e5        push    hl
5b5c 21b15d    ld      hl,$5db1
5b5f cda17e    call    $7ea1
5b62 e1        pop     hl
5b63 daa45c    jp      c,$5ca4
5b66 fe31      cp      $31
5b68 2013      jr      nz,$5b7d
5b6a f5        push    af
5b6b 3a9b56    ld      a,($569b)
5b6e b7        or      a
5b6f 2007      jr      nz,$5b78
5b71 f1        pop     af
5b72 dd2104af  ld      ix,$af04
5b76 181c      jr      $5b94
5b78 f1        pop     af
5b79 0e81      ld      c,$81
5b7b 182d      jr      $5baa
5b7d fe32      cp      $32
5b7f 201b      jr      nz,$5b9c
5b81 f5        push    af
5b82 3ad856    ld      a,($56d8)
5b85 b7        or      a
5b86 2007      jr      nz,$5b8f
5b88 f1        pop     af
5b89 dd2104af  ld      ix,$af04
5b8d 1805      jr      $5b94
5b8f f1        pop     af
5b90 0e82      ld      c,$82
5b92 1816      jr      $5baa
5b94 cd0544    call    $4405
5b97 cda885    call    $85a8
5b9a 18bb      jr      $5b57
5b9c 0605      ld      b,$05
5b9e cdef3a    call    $3aef
5ba1 2801      jr      z,$5ba4
5ba3 05        dec     b
5ba4 cd8b88    call    $888b
5ba7 c3e45a    jp      $5ae4
5baa cdbf85    call    $85bf
5bad 38a8      jr      c,$5b57
5baf cd7844    call    $4478		write char in A
5bb2 cdbf85    call    $85bf
5bb5 3005      jr      nc,$5bbc
5bb7 cdf285    call    $85f2
5bba 189b      jr      $5b57
5bbc 79        ld      a,c
5bbd cd795d    call    $5d79
5bc0 cdb45c    call    $5cb4
5bc3 cd233b    call    $3b23
5bc6 c3e45a    jp      $5ae4
5bc9 fef5      cp      $f5
5bcb 2006      jr      nz,$5bd3
5bcd dd21bd5d  ld      ix,$5dbd
5bd1 1852      jr      $5c25
5bd3 fef6      cp      $f6
5bd5 2006      jr      nz,$5bdd
5bd7 dd21c65d  ld      ix,$5dc6
5bdb 1848      jr      $5c25
5bdd fef7      cp      $f7
5bdf 2006      jr      nz,$5be7
5be1 dd21ce5d  ld      ix,$5dce
5be5 183e      jr      $5c25
5be7 fef4      cp      $f4
5be9 2013      jr      nz,$5bfe
5beb cd8d58    call    $588d
5bee b7        or      a
5bef caa45c    jp      z,$5ca4
5bf2 cd7d7a    call    $7a7d
5bf5 cda885    call    $85a8
5bf8 cd233b    call    $3b23
5bfb c3e45a    jp      $5ae4
5bfe fef0      cp      $f0
5c00 2011      jr      nz,$5c13
5c02 dd21983c  ld      ix,$3c98
5c06 ddcb0046  bit     0,(ix+$00)
5c0a c2975c    jp      nz,$5c97
5c0d dd21e25d  ld      ix,$5de2
5c11 1812      jr      $5c25
5c13 fef1      cp      $f1
5c15 201c      jr      nz,$5c33
5c17 dd21983c  ld      ix,$3c98
5c1b ddcb0046  bit     0,(ix+$00)
5c1f 2076      jr      nz,$5c97
5c21 dd21ed5d  ld      ix,$5ded
5c25 cd7d5d    call    $5d7d
5c28 3860      jr      c,$5c8a
5c2a cd795d    call    $5d79
5c2d cd233b    call    $3b23
5c30 c3e45a    jp      $5ae4
5c33 fef2      cp      $f2
5c35 201c      jr      nz,$5c53
5c37 cdef3a    call    $3aef
5c3a 205b      jr      nz,$5c97
5c3c dd21f35d  ld      ix,$5df3
5c40 cd7d5d    call    $5d7d
5c43 3845      jr      c,$5c8a
5c45 dd21983c  ld      ix,$3c98
5c49 ddcb00c6  set     0,(ix+$00)
5c4d cd795d    call    $5d79
5c50 c3e45a    jp      $5ae4
5c53 fef8      cp      $f8
5c55 2017      jr      nz,$5c6e
5c57 dd21f95d  ld      ix,$5df9
5c5b cd7d5d    call    $5d7d
5c5e 382a      jr      c,$5c8a
5c60 dd21983c  ld      ix,$3c98
5c64 ddcb00ce  set     1,(ix+$00)
5c68 cd795d    call    $5d79
5c6b c3e45a    jp      $5ae4
5c6e fe0d      cp      $0d
5c70 2012      jr      nz,$5c84
5c72 3600      ld      (hl),$00
5c74 97        sub     a
5c75 cd6503    call    $0365
5c78 42        ld      b,d
5c79 7a        ld      a,d
5c7a 32a75c    ld      ($5ca7),a
5c7d 3e01      ld      a,$01
5c7f dde1      pop     ix
5c81 e1        pop     hl
5c82 d1        pop     de
5c83 c9        ret     

5c84 cd2202    call    $0222
5c87 c3e45a    jp      $5ae4
5c8a f5        push    af
5c8b 3efb      ld      a,$fb
5c8d cdfb8b    call    $8bfb
5c90 f1        pop     af
5c91 cd8b88    call    $888b
5c94 c3e45a    jp      $5ae4
5c97 dd211fb3  ld      ix,$b31f
5c9b cd0544    call    $4405
5c9e cda885    call    $85a8
5ca1 c3e45a    jp      $5ae4
5ca4 97        sub     a
5ca5 18d8      jr      $5c7f
5ca7 00        nop     
5ca8 e5        push    hl
5ca9 dde1      pop     ix
5cab dd7eff    ld      a,(ix-$01)
5cae fef2      cp      $f2
5cb0 2001      jr      nz,$5cb3
5cb2 05        dec     b
5cb3 c9        ret     

5cb4 1e3e      ld      e,$3e
5cb6 0e02      ld      c,$02
5cb8 cd0500    call    $0005
5cbb c9        ret     

5cbc f5        push    af
5cbd c5        push    bc
5cbe d5        push    de
5cbf dde5      push    ix
5cc1 2b        dec     hl
5cc2 0600      ld      b,$00
5cc4 e5        push    hl
5cc5 dde1      pop     ix
5cc7 dd7e00    ld      a,(ix+$00)
5cca cdb28c    call    $8cb2
5ccd 3029      jr      nc,$5cf8
5ccf 04        inc     b
5cd0 dd7eff    ld      a,(ix-$01)
5cd3 fef8      cp      $f8
5cd5 2015      jr      nz,$5cec
5cd7 78        ld      a,b
5cd8 c610      add     a,$10
5cda 47        ld      b,a
5cdb 2b        dec     hl
5cdc dd7efe    ld      a,(ix-$02)
5cdf fef2      cp      $f2
5ce1 c2705d    jp      nz,$5d70
5ce4 78        ld      a,b
5ce5 c604      add     a,$04
5ce7 47        ld      b,a
5ce8 2b        dec     hl
5ce9 c3705d    jp      $5d70
5cec fef2      cp      $f2
5cee c2705d    jp      nz,$5d70
5cf1 78        ld      a,b
5cf2 c606      add     a,$06
5cf4 47        ld      b,a
5cf5 2b        dec     hl
5cf6 1878      jr      $5d70
5cf8 fef1      cp      $f1
5cfa 2004      jr      nz,$5d00
5cfc 0605      ld      b,$05
5cfe 1870      jr      $5d70
5d00 fef0      cp      $f0
5d02 2004      jr      nz,$5d08
5d04 060a      ld      b,$0a
5d06 1868      jr      $5d70
5d08 fe81      cp      $81
5d0a 2004      jr      nz,$5d10
5d0c 0607      ld      b,$07
5d0e 1854      jr      $5d64
5d10 fe82      cp      $82
5d12 2004      jr      nz,$5d18
5d14 0607      ld      b,$07
5d16 184c      jr      $5d64
5d18 fef5      cp      $f5
5d1a 2004      jr      nz,$5d20
5d1c 0608      ld      b,$08
5d1e 1844      jr      $5d64
5d20 fef6      cp      $f6
5d22 2004      jr      nz,$5d28
5d24 0607      ld      b,$07
5d26 183c      jr      $5d64
5d28 fef7      cp      $f7
5d2a 2004      jr      nz,$5d30
5d2c 0608      ld      b,$08
5d2e 1834      jr      $5d64
5d30 fef2      cp      $f2
5d32 200c      jr      nz,$5d40
5d34 0605      ld      b,$05
5d36 dd21983c  ld      ix,$3c98
5d3a ddcb0086  res     0,(ix+$00)
5d3e 1830      jr      $5d70
5d40 fef8      cp      $f8
5d42 2014      jr      nz,$5d58
5d44 060f      ld      b,$0f
5d46 dd7eff    ld      a,(ix-$01)
5d49 fef2      cp      $f2
5d4b 2001      jr      nz,$5d4e
5d4d 05        dec     b
5d4e dd21983c  ld      ix,$3c98
5d52 ddcb008e  res     1,(ix+$00)
5d56 1818      jr      $5d70
5d58 dd2134b3  ld      ix,$b334
5d5c cd0544    call    $4405
5d5f cda885    call    $85a8
5d62 180f      jr      $5d73
5d64 dd7eff    ld      a,(ix-$01)
5d67 fef2      cp      $f2
5d69 2005      jr      nz,$5d70
5d6b 3e04      ld      a,$04
5d6d 80        add     a,b
5d6e 47        ld      b,a
5d6f 2b        dec     hl
5d70 cd8b88    call    $888b
5d73 dde1      pop     ix
5d75 d1        pop     de
5d76 c1        pop     bc
5d77 f1        pop     af
5d78 c9        ret     

5d79 77        ld      (hl),a
5d7a 23        inc     hl
5d7b 14        inc     d
5d7c c9        ret     

5d7d 32b65d    ld      ($5db6),a
5d80 e5        push    hl
5d81 dde5      push    ix
5d83 fde5      push    iy
5d85 cdef3a    call    $3aef
5d88 200a      jr      nz,$5d94
5d8a fd21983c  ld      iy,$3c98
5d8e fdcb004e  bit     1,(iy+$00)
5d92 2802      jr      z,$5d96
5d94 dd23      inc     ix
5d96 dde5      push    ix
5d98 e1        pop     hl
5d99 cd7689    call    $8976
5d9c 3ab65d    ld      a,($5db6)
5d9f fde1      pop     iy
5da1 dde1      pop     ix
5da3 e1        pop     hl
5da4 c9        ret     

5da5 dde5      push    ix
5da7 dd2165b3  ld      ix,$b365
5dab cd0544    call    $4405
5dae dde1      pop     ix
5db0 c9        ret     

5db1 7f        ld      a,a
5db2 08        ex      af,af'
5db3 313200    ld      sp,$0032
5db6 00        nop     
5db7 3c        inc     a
5db8 73        ld      (hl),e
5db9 65        ld      h,l
5dba 74        ld      (hl),h
5dbb 2024      jr      nz,$5de1
5dbd 3c        inc     a
5dbe 6c        ld      l,h
5dbf 65        ld      h,l
5dc0 74        ld      (hl),h
5dc1 74        ld      (hl),h
5dc2 65        ld      h,l
5dc3 72        ld      (hl),d
5dc4 3e24      ld      a,$24
5dc6 3c        inc     a
5dc7 64        ld      h,h
5dc8 69        ld      l,c
5dc9 67        ld      h,a
5dca 69        ld      l,c
5dcb 74        ld      (hl),h
5dcc 3e24      ld      a,$24
5dce 3c        inc     a
5dcf 70        ld      (hl),b
5dd0 75        ld      (hl),l
5dd1 6e        ld      l,(hl)
5dd2 63        ld      h,e
5dd3 74        ld      (hl),h
5dd4 2e3e      ld      l,$3e
5dd6 24        inc     h
5dd7 3c        inc     a
5dd8 74        ld      (hl),h
5dd9 65        ld      h,l
5dda 6d        ld      l,l
5ddb 70        ld      (hl),b
5ddc 2073      jr      nz,$5e51
5dde 65        ld      h,l
5ddf 74        ld      (hl),h
5de0 3a243c    ld      a,($3c24)
5de3 61        ld      h,c
5de4 6e        ld      l,(hl)
5de5 79        ld      a,c
5de6 2063      jr      nz,$5e4b
5de8 68        ld      l,b
5de9 61        ld      h,c
5dea 72        ld      (hl),d
5deb 3e24      ld      a,$24
5ded 3c        inc     a
5dee 2e2e      ld      l,$2e
5df0 2e3e      ld      l,$3e
5df2 24        inc     h
5df3 3c        inc     a
5df4 6e        ld      l,(hl)
5df5 6f        ld      l,a
5df6 74        ld      (hl),h
5df7 2024      jr      nz,$5e1d
5df9 3c        inc     a
5dfa 43        ld      b,e
5dfb 41        ld      b,c
5dfc 50        ld      d,b
5dfd 53        ld      d,e
5dfe 206f      jr      nz,$5e6f
5e00 72        ld      (hl),d
5e01 206c      jr      nz,$5e6f
5e03 6f        ld      l,a
5e04 77        ld      (hl),a
5e05 65        ld      h,l
5e06 72        ld      (hl),d
5e07 2024      jr      nz,$5e2d
5e09 2a2a2a    ld      hl,($2a2a)
5e0c 45        ld      b,l
5e0d 4d        ld      c,l
5e0e 50        ld      d,b
5e0f 54        ld      d,h
5e10 59        ld      e,c
5e11 2a2a2a    ld      hl,($2a2a)
5e14 24        inc     h
5e15 0d        dec     c
5e16 0a        ld      a,(bc)
5e17 0a        ld      a,(bc)
5e18 75        ld      (hl),l
5e19 73        ld      (hl),e
5e1a 65        ld      h,l
5e1b 72        ld      (hl),d
5e1c 2064      jr      nz,$5e82
5e1e 65        ld      h,l
5e1f 66        ld      h,(hl)
5e20 69        ld      l,c
5e21 6e        ld      l,(hl)
5e22 65        ld      h,l
5e23 64        ld      h,h
5e24 2063      jr      nz,$5e89
5e26 68        ld      l,b
5e27 61        ld      h,c
5e28 72        ld      (hl),d
5e29 61        ld      h,c
5e2a 63        ld      h,e
5e2b 74        ld      (hl),h
5e2c 65        ld      h,l
5e2d 72        ld      (hl),d
5e2e 2073      jr      nz,$5ea3
5e30 65        ld      h,l
5e31 74        ld      (hl),h
5e32 73        ld      (hl),e
5e33 3a0d0a    ld      a,($0a0d)
5e36 0a        ld      a,(bc)
5e37 24        inc     h
5e38 00        nop     
5e39 00        nop     
5e3a 3a2443    ld      a,($4324)
5e3d 61        ld      h,c
5e3e 73        ld      (hl),e
5e3f 65        ld      h,l
5e40 3a2049    ld      a,($4920)
5e43 4e        ld      c,(hl)
5e44 53        ld      d,e
5e45 45        ld      b,l
5e46 4e        ld      c,(hl)
5e47 53        ld      d,e
5e48 49        ld      c,c
5e49 54        ld      d,h
5e4a 49        ld      c,c
5e4b 56        ld      d,(hl)
5e4c 45        ld      b,l
5e4d 24        inc     h
5e4e 2020      jr      nz,$5e70
5e50 53        ld      d,e
5e51 45        ld      b,l
5e52 4e        ld      c,(hl)
5e53 53        ld      d,e
5e54 49        ld      c,c
5e55 54        ld      d,h
5e56 49        ld      c,c
5e57 56        ld      d,(hl)
5e58 45        ld      b,l
5e59 49        ld      c,c
5e5a 4e        ld      c,(hl)
5e5b 53        ld      d,e
5e5c 45        ld      b,l
5e5d 4e        ld      c,(hl)
5e5e 53        ld      d,e
5e5f 49        ld      c,c
5e60 54        ld      d,h
5e61 49        ld      c,c
5e62 56        ld      d,(hl)
5e63 45        ld      b,l
5e64 43        ld      b,e
5e65 31320d    ld      sp,$0d32
5e68 00        nop     
5e69 c8        ret     z

5e6a 58        ld      e,b
5e6b d0        ret     nc

5e6c 58        ld      e,b
5e6d d8        ret     c

5e6e 58        ld      e,b
5e6f 07        rlca    
5e70 03        inc     bc
5e71 08        ex      af,af'
5e72 03        inc     bc
5e73 f5        push    af
5e74 d5        push    de
5e75 e5        push    hl
5e76 fde5      push    iy
5e78 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
5e7b fd21f85f  ld      iy,$5ff8
5e7f cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5e82 cd593b    call    $3b59
5e85 cd493b    call    $3b49
5e88 fde1      pop     iy
5e8a e1        pop     hl
5e8b d1        pop     de
5e8c f1        pop     af
5e8d c9        ret     

5e8e d5        push    de
5e8f e5        push    hl
5e90 fde5      push    iy
5e92 32d45e    ld      ($5ed4),a
5e95 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
5e98 fd21f85f  ld      iy,$5ff8
5e9c cdec8a    call    $8aec
5e9f 282b      jr      z,$5ecc
5ea1 3013      jr      nc,$5eb6
5ea3 d5        push    de
5ea4 e5        push    hl
5ea5 fde5      push    iy
5ea7 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5eaa cdd55e    call    $5ed5
5ead fde1      pop     iy
5eaf e1        pop     hl
5eb0 d1        pop     de
5eb1 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5eb4 1803      jr      $5eb9
5eb6 cdd55e    call    $5ed5
5eb9 cd613b    call    $3b61
5ebc cd413b    call    $3b41
5ebf f5        push    af
5ec0 3efe      ld      a,$fe
5ec2 cdfb8b    call    $8bfb
5ec5 f1        pop     af
5ec6 cda37d    call    $7da3		discard keys typed on terminal
5ec9 3e01      ld      a,$01
5ecb b7        or      a
5ecc fde1      pop     iy
5ece e1        pop     hl
5ecf d1        pop     de
5ed0 3ad45e    ld      a,($5ed4)
5ed3 c9        ret     

5ed4 00        nop     
5ed5 fd21fc5f  ld      iy,$5ffc
5ed9 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5edc c9        ret     

5edd fde5      push    iy
5edf fd21f85f  ld      iy,$5ff8
5ee3 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5ee6 fde1      pop     iy
5ee8 c9        ret     

5ee9 fde5      push    iy
5eeb fd21fc5f  ld      iy,$5ffc
5eef cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5ef2 fde1      pop     iy
5ef4 c9        ret     

5ef5 c9        ret     

5ef6 d5        push    de
5ef7 e5        push    hl
5ef8 fde5      push    iy
5efa cd513b    call    $3b51
5efd 200c      jr      nz,$5f0b
5eff cd393b    call    $3a6c		Reset BIT4 flag at 3c98
5f02 280e      jr      z,$5f12
5f04 fd21fc5f  ld      iy,$5ffc
5f08 cd175f    call    $5f17
5f0b fd21f85f  ld      iy,$5ff8
5f0f cd175f    call    $5f17
5f12 fde1      pop     iy
5f14 e1        pop     hl
5f15 d1        pop     de
5f16 c9        ret     

5f17 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
5f1a cdec8a    call    $8aec
5f1d 2802      jr      z,$5f21
5f1f 300b      jr      nc,$5f2c
5f21 110000    ld      de,$0000
5f24 60        ld      h,b
5f25 69        ld      l,c
5f26 cdc28a    call    $8ac2
5f29 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5f2c c9        ret     

5f2d d5        push    de
5f2e e5        push    hl
5f2f fde5      push    iy
5f31 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
5f34 fd210060  ld      iy,$6000
5f38 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5f3b 09        add     hl,bc
5f3c 3001      jr      nc,$5f3f
5f3e 13        inc     de
5f3f fd210460  ld      iy,$6004
5f43 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5f46 cd513b    call    $3b51
5f49 2061      jr      nz,$5fac
5f4b cd393b    call    $3a6c		Reset BIT4 flag at 3c98
5f4e 2879      jr      z,$5fc9
5f50 fd21f85f  ld      iy,$5ff8
5f54 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5f57 fd210460  ld      iy,$6004
5f5b cdec8a    call    $8aec
5f5e 3813      jr      c,$5f73
5f60 fd21f85f  ld      iy,$5ff8
5f64 cdce5f    call    $5fce
5f67 fd21fc5f  ld      iy,$5ffc
5f6b cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5f6e cdce5f    call    $5fce
5f71 1856      jr      $5fc9
5f73 fd210060  ld      iy,$6000
5f77 cdec8a    call    $8aec
5f7a 3019      jr      nc,$5f95
5f7c fde5      push    iy
5f7e fd21fc5f  ld      iy,$5ffc
5f82 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5f85 fde1      pop     iy
5f87 cdec8a    call    $8aec
5f8a 380e      jr      c,$5f9a
5f8c fd210460  ld      iy,$6004
5f90 cdec8a    call    $8aec
5f93 3005      jr      nc,$5f9a
5f95 cd493b    call    $3b49
5f98 182f      jr      $5fc9
5f9a fd210460  ld      iy,$6004
5f9e cdec8a    call    $8aec
5fa1 3826      jr      c,$5fc9
5fa3 fd21fc5f  ld      iy,$5ffc
5fa7 cdce5f    call    $5fce
5faa 181d      jr      $5fc9
5fac fd21f85f  ld      iy,$5ff8
5fb0 cdec8a    call    $8aec
5fb3 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
5fb6 2802      jr      z,$5fba
5fb8 3003      jr      nc,$5fbd
5fba cdce5f    call    $5fce
5fbd fd210060  ld      iy,$6000
5fc1 cdec8a    call    $8aec
5fc4 3803      jr      c,$5fc9
5fc6 cd613b    call    $3b61
5fc9 fde1      pop     iy
5fcb e1        pop     hl
5fcc d1        pop     de
5fcd c9        ret     

5fce b7        or      a
5fcf ed42      sbc     hl,bc
5fd1 3001      jr      nc,$5fd4
5fd3 1b        dec     de
5fd4 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
5fd7 c9        ret     

5fd8 dd21ebac  ld      ix,$aceb
5fdc cd0544    call    $4405
5fdf c9        ret     

5fe0 fde5      push    iy
5fe2 cddd5e    call    $5edd
5fe5 cd1e41    call    $411e
5fe8 cde95e    call    $5ee9
5feb fd21f85f  ld      iy,$5ff8
5fef cda93f    call    $3fa9
5ff2 cdd482    call    $82d4
5ff5 fde1      pop     iy
5ff7 c9        ret     

5ff8 00        nop     
5ff9 00        nop     
5ffa 00        nop     
5ffb 00        nop     
5ffc 00        nop     
5ffd 00        nop     
5ffe 00        nop     
5fff 00        nop     
6000 00        nop     
6001 00        nop     
6002 00        nop     
6003 00        nop     
6004 00        nop     
6005 00        nop     
6006 00        nop     
6007 00        nop     
6008 c5        push    bc
6009 d5        push    de
600a e5        push    hl
600b dde5      push    ix
600d fde5      push    iy
600f dd214fc9  ld      ix,$c94f
6013 fd21268a  ld      iy,$8a26
6017 0e2e      ld      c,$2e
6019 cd9488    call    $8894
601c b7        or      a
601d ca7660    jp      z,$6076
6020 cdea30    call    $30ea
6023 feff      cp      $ff
6025 200e      jr      nz,$6035
6027 dd21b463  ld      ix,$63b4
602b 11ff63    ld      de,$63ff
602e cd8e71    call    $718e
6031 381c      jr      c,$604f
6033 1823      jr      $6058
6035 dd218ec8  ld      ix,$c88e
6039 cd9d43    call    $439d
603c cd2e44    call    $442e
603f 3005      jr      nc,$6046
6041 cda885    call    $85a8
6044 1812      jr      $6058
6046 cda885    call    $85a8
6049 04        inc     b
604a cd8b88    call    $888b
604d 18c0      jr      $600f
604f dd21bcc8  ld      ix,$c8bc
6053 cd0544    call    $4405
6056 18ee      jr      $6046
6058 3a6072    ld      a,($7260)
605b 47        ld      b,a
605c 3e28      ld      a,$28
605e 90        sub     b
605f 112664    ld      de,$6426
6062 212564    ld      hl,$6425
6065 0600      ld      b,$00
6067 4f        ld      c,a
6068 edb8      lddr    
606a 3ab263    ld      a,($63b2)
606d 12        ld      (de),a
606e cd0730    call    $3007
6071 28dc      jr      z,$604f
6073 3e01      ld      a,$01
6075 b7        or      a
6076 fde1      pop     iy
6078 dde1      pop     ix
607a e1        pop     hl
607b d1        pop     de
607c c1        pop     bc
607d c9        ret     

607e 3e00      ld      a,$00
6080 32b263    ld      ($63b2),a
6083 cd0860    call    $6008
6086 2870      jr      z,$60f8
6088 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
608b fd21ae63  ld      iy,$63ae
608f cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
6092 cdfc60    call    $60fc
6095 3009      jr      nc,$60a0
6097 dd21d1c8  ld      ix,$c8d1
609b cd0544    call    $4405
609e 184f      jr      $60ef
60a0 21a563    ld      hl,$63a5
60a3 cd7689    call    $8976
60a6 dd21e7c8  ld      ix,$c8e7
60aa 21f960    ld      hl,$60f9
60ad cda17e    call    $7ea1
60b0 3003      jr      nc,$60b5
60b2 97        sub     a
60b3 183a      jr      $60ef
60b5 cd7844    call    $4478		write char in A
60b8 fe4e      cp      $4e
60ba 2833      jr      z,$60ef
60bc cde05f    call    $5fe0
60bf cddd5e    call    $5edd
60c2 cdec8a    call    $8aec
60c5 2802      jr      z,$60c9
60c7 3026      jr      nc,$60ef
60c9 cde95e    call    $5ee9
60cc cdec8a    call    $8aec
60cf 3805      jr      c,$60d6
60d1 cddd5e    call    $5edd
60d4 181c      jr      $60f2
60d6 cddd5e    call    $5edd
60d9 cdc28a    call    $8ac2
60dc d5        push    de
60dd e5        push    hl
60de cde95e    call    $5ee9
60e1 fd21ae63  ld      iy,$63ae
60e5 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
60e8 e1        pop     hl
60e9 d1        pop     de
60ea cdd68a    call    $8ad6
60ed 1803      jr      $60f2
60ef cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
60f2 cd1e41    call    $411e
60f5 cdd482    call    $82d4
60f8 c9        ret     

60f9 59        ld      e,c
60fa 4e        ld      c,(hl)
60fb 00        nop     
60fc c5        push    bc
60fd d5        push    de
60fe e5        push    hl
60ff fde5      push    iy
6101 fd216861  ld      iy,$6168
6105 cddd5e    call    $5edd
6108 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
610b cde95e    call    $5ee9
610e cdd68a    call    $8ad6
6111 44        ld      b,h
6112 4d        ld      c,l
6113 7a        ld      a,d
6114 b3        or      e
6115 2806      jr      z,$611d
6117 01ffff    ld      bc,$ffff
611a 1b        dec     de
611b 18f6      jr      $6113
611d cddd5e    call    $5edd
6120 cd1e41    call    $411e
6123 cde95e    call    $5ee9
6126 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
6129 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
612c cdec8a    call    $8aec
612f 302d      jr      nc,$615e
6131 cd798f    call    $8f79
6134 fe81      cp      $81
6136 2007      jr      nz,$613f
6138 cdd63b    call    $3bd6
613b 3e81      ld      a,$81
613d 1814      jr      $6153
613f fe86      cp      $86
6141 2007      jr      nz,$614a
6143 cdcd3b    call    $3bcd
6146 3e86      ld      a,$86
6148 1809      jr      $6153
614a fe87      cp      $87
614c 2005      jr      nz,$6153
614e cdef3b    call    $3bef
6151 3e87      ld      a,$87
6153 cda430    call    $30a4
6156 20d1      jr      nz,$6129
6158 cd3f30    call    $303f
615b 37        scf     
615c 1804      jr      $6162
615e cd3f30    call    $303f
6161 b7        or      a
6162 fde1      pop     iy
6164 e1        pop     hl
6165 d1        pop     de
6166 c1        pop     bc
6167 c9        ret     

6168 00        nop     
6169 00        nop     
616a 00        nop     
616b 00        nop     
616c cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
616f fd21ae63  ld      iy,$63ae
6173 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
6176 010000    ld      bc,$0000
6179 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
617c fd21f85f  ld      iy,$5ff8
6180 cdec8a    call    $8aec
6183 3808      jr      c,$618d
6185 2806      jr      z,$618d
6187 cd0141    call    $4101
618a 03        inc     bc
618b 18ec      jr      $6179
618d 78        ld      a,b
618e b1        or      c
618f ca6d62    jp      z,$626d
6192 0b        dec     bc
6193 78        ld      a,b
6194 b1        or      c
6195 ca6d62    jp      z,$626d
6198 ed439762  ld      ($6297),bc
619c cddd5e    call    $5edd
619f cd1e41    call    $411e
61a2 cd2b83    call    $832b
61a5 47        ld      b,a
61a6 321c63    ld      ($631c),a
61a9 cd3e83    call    $833e
61ac 4f        ld      c,a
61ad cde95e    call    $5ee9
61b0 cd1e41    call    $411e
61b3 cd3e83    call    $833e
61b6 b9        cp      c
61b7 c26d62    jp      nz,$626d
61ba cd2b83    call    $832b
61bd 329962    ld      ($6299),a
61c0 cda440    call    $40a4
61c3 3a1c63    ld      a,($631c)
61c6 47        ld      b,a
61c7 cd8040    call    $4080
61ca 3e11      ld      a,$11
61cc 32b263    ld      ($63b2),a
61cf cd0860    call    $6008
61d2 ca7762    jp      z,$6277
61d5 218562    ld      hl,$6285
61d8 cd7689    call    $8976
61db dd21e7c8  ld      ix,$c8e7
61df 21f960    ld      hl,$60f9
61e2 cda17e    call    $7ea1
61e5 3004      jr      nc,$61eb
61e7 97        sub     a
61e8 c37762    jp      $6277
61eb cd7844    call    $4478		write char in A
61ee fe59      cp      $59
61f0 2004      jr      nz,$61f6
61f2 0e01      ld      c,$01
61f4 1802      jr      $61f8
61f6 0e00      ld      c,$00
61f8 ed5b9762  ld      de,($6297)
61fc 3a9962    ld      a,($6299)
61ff 6f        ld      l,a
6200 3a1c63    ld      a,($631c)
6203 47        ld      b,a
6204 cdc78e    call    $8ec7
6207 fe01      cp      $01
6209 285d      jr      z,$6268
620b fe0d      cp      $0d
620d 2814      jr      z,$6223
620f fe0a      cp      $0a
6211 2810      jr      z,$6223
6213 cda430    call    $30a4
6216 cd2b83    call    $832b
6219 bd        cp      l
621a 38e8      jr      c,$6204
621c 3e0d      ld      a,$0d
621e cda430    call    $30a4
6221 1814      jr      $6237
6223 cd208f    call    $8f20
6226 cd2b83    call    $832b
6229 67        ld      h,a
622a 7d        ld      a,l
622b 94        sub     h
622c 67        ld      h,a
622d 3e20      ld      a,$20
622f cda430    call    $30a4
6232 25        dec     h
6233 28e7      jr      z,$621c
6235 18f6      jr      $622d
6237 cb41      bit     0,c
6239 2817      jr      z,$6252
623b c5        push    bc
623c cddd3f    call    $3fdd
623f cd208f    call    $8f20
6242 cda440    call    $40a4
6245 3a1c63    ld      a,($631c)
6248 47        ld      b,a
6249 cd8040    call    $4080
624c 0601      ld      b,$01
624e cdfe3f    call    $3ffe
6251 c1        pop     bc
6252 1b        dec     de
6253 7a        ld      a,d
6254 b3        or      e
6255 2811      jr      z,$6268
6257 cde440    call    $40e4
625a fe01      cp      $01
625c 280a      jr      z,$6268
625e 78        ld      a,b
625f cd8040    call    $4080
6262 3a9962    ld      a,($6299)
6265 6f        ld      l,a
6266 189c      jr      $6204
6268 cd3f30    call    $303f
626b 1814      jr      $6281
626d dd21a6c9  ld      ix,$c9a6
6271 cd0544    call    $4405
6274 cd6f43    call    $436f
6277 fd21ae63  ld      iy,$63ae
627b cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
627e cd1e41    call    $411e
6281 cdd482    call    $82d4
6284 c9        ret     

6285 2044      jr      nz,$62cb
6287 65        ld      h,l
6288 6c        ld      l,h
6289 65        ld      h,l
628a 74        ld      (hl),h
628b 65        ld      h,l
628c 2063      jr      nz,$62f1
628e 6f        ld      l,a
628f 6c        ld      l,h
6290 75        ld      (hl),l
6291 6d        ld      l,l
6292 6e        ld      l,(hl)
6293 73        ld      (hl),e
6294 3f        ccf     
6295 2024      jr      nz,$62bb
6297 00        nop     
6298 00        nop     
6299 00        nop     
629a cd2b83    call    $832b
629d 321c63    ld      ($631c),a
62a0 cd4c63    call    $634c
62a3 cd4931    call    $3149
62a6 cdf72d    call    $2df7
62a9 cd212e    call    $2e21
62ac fe01      cp      $01
62ae 2868      jr      z,$6318
62b0 fe0d      cp      $0d
62b2 2810      jr      z,$62c4
62b4 fe0a      cp      $0a
62b6 280c      jr      z,$62c4
62b8 111d63    ld      de,$631d
62bb 12        ld      (de),a
62bc 010100    ld      bc,$0001
62bf cdca91    call    $91ca
62c2 18e5      jr      $62a9
62c4 cde440    call    $40e4
62c7 cd5091    call    $9150
62ca fe01      cp      $01
62cc 2003      jr      nz,$62d1
62ce cddd3f    call    $3fdd
62d1 3a1c63    ld      a,($631c)
62d4 47        ld      b,a
62d5 cd8040    call    $4080
62d8 cd2b83    call    $832b
62db b8        cp      b
62dc 28cb      jr      z,$62a9
62de 3805      jr      c,$62e5
62e0 cd208f    call    $8f20
62e3 18f3      jr      $62d8
62e5 cd2b83    call    $832b
62e8 3d        dec     a
62e9 c608      add     a,$08
62eb e6f8      and     $f8
62ed 3c        inc     a
62ee b8        cp      b
62ef 2802      jr      z,$62f3
62f1 300d      jr      nc,$6300
62f3 c5        push    bc
62f4 111f63    ld      de,$631f
62f7 010100    ld      bc,$0001
62fa cdca91    call    $91ca
62fd c1        pop     bc
62fe 18e5      jr      $62e5
6300 cd2b83    call    $832b
6303 4f        ld      c,a
6304 78        ld      a,b
6305 91        sub     c
6306 28a1      jr      z,$62a9
6308 47        ld      b,a
6309 c5        push    bc
630a 111e63    ld      de,$631e
630d 010100    ld      bc,$0001
6310 cdca91    call    $91ca
6313 c1        pop     bc
6314 10f3      djnz    $6309
6316 1891      jr      $62a9
6318 cdd482    call    $82d4
631b c9        ret     

631c 00        nop     
631d 00        nop     
631e 2009      jr      nz,$6329
6320 fe11      cp      $11
6322 ca9a62    jp      z,$629a
6325 cd4c63    call    $634c
6328 cd3031    call    $3130
632b fe02      cp      $02
632d 2009      jr      nz,$6338
632f dd2191c9  ld      ix,$c991
6333 cd0544    call    $4405
6336 1808      jr      $6340
6338 3e00      ld      a,$00
633a cd1b2d    call    $2d1b
633d cdd482    call    $82d4
6340 c9        ret     

6341 cd4c63    call    $634c
6344 dd2191c9  ld      ix,$c991
6348 cd3d31    call    $313d
634b c9        ret     

634c c5        push    bc
634d d5        push    de
634e e5        push    hl
634f cd8d26    call    $268d
6352 c640      add     a,$40
6354 326a63    ld      ($636a),a
6357 fde5      push    iy
6359 e1        pop     hl
635a 116c63    ld      de,$636c
635d 010e00    ld      bc,$000e
6360 edb0      ldir    
6362 fd216a63  ld      iy,$636a
6366 e1        pop     hl
6367 d1        pop     de
6368 c1        pop     bc
6369 c9        ret     

636a 00        nop     
636b 3a0000    ld      a,($0000)
636e 00        nop     
636f 00        nop     
6370 00        nop     
6371 00        nop     
6372 00        nop     
6373 00        nop     
6374 00        nop     
6375 00        nop     
6376 00        nop     
6377 00        nop     
6378 00        nop     
6379 00        nop     
637a f5        push    af
637b e5        push    hl
637c dde5      push    ix
637e fde5      push    iy
6380 fd21268a  ld      iy,$8a26
6384 dd21b463  ld      ix,$63b4
6388 21268a    ld      hl,$8a26
638b dd7e00    ld      a,(ix+$00)
638e b7        or      a
638f 280d      jr      z,$639e
6391 cd7971    call    $7179
6394 3600      ld      (hl),$00
6396 cd2f30    call    $302f
6399 cd5d71    call    $715d
639c 18ea      jr      $6388
639e fde1      pop     iy
63a0 dde1      pop     ix
63a2 e1        pop     hl
63a3 f1        pop     af
63a4 c9        ret     

63a5 2044      jr      nz,$63eb
63a7 65        ld      h,l
63a8 6c        ld      l,h
63a9 65        ld      h,l
63aa 74        ld      (hl),h
63ab 65        ld      h,l
63ac 3f        ccf     
63ad 24        inc     h
63ae 00        nop     
63af 00        nop     
63b0 00        nop     
63b1 00        nop     
63b2 00        nop     
63b3 00        nop     
63b4 00        nop     
63b5 00        nop     
63b6 00        nop     
63b7 00        nop     
63b8 00        nop     
63b9 00        nop     
63ba 00        nop     
63bb 00        nop     
63bc 00        nop     
63bd 00        nop     
63be 00        nop     
63bf 00        nop     
63c0 00        nop     
63c1 00        nop     
63c2 00        nop     
63c3 00        nop     
63c4 00        nop     
63c5 00        nop     
63c6 00        nop     
63c7 00        nop     
63c8 00        nop     
63c9 00        nop     
63ca 00        nop     
63cb 00        nop     
63cc 00        nop     
63cd 00        nop     
63ce 00        nop     
63cf 00        nop     
63d0 00        nop     
63d1 00        nop     
63d2 00        nop     
63d3 00        nop     
63d4 00        nop     
63d5 00        nop     
63d6 00        nop     
63d7 00        nop     
63d8 00        nop     
63d9 00        nop     
63da 00        nop     
63db 00        nop     
63dc 00        nop     
63dd 00        nop     
63de 00        nop     
63df 00        nop     
63e0 00        nop     
63e1 00        nop     
63e2 00        nop     
63e3 00        nop     
63e4 00        nop     
63e5 00        nop     
63e6 00        nop     
63e7 00        nop     
63e8 00        nop     
63e9 00        nop     
63ea 00        nop     
63eb 00        nop     
63ec 00        nop     
63ed 00        nop     
63ee 00        nop     
63ef 00        nop     
63f0 00        nop     
63f1 00        nop     
63f2 00        nop     
63f3 00        nop     
63f4 00        nop     
63f5 00        nop     
63f6 00        nop     
63f7 00        nop     
63f8 00        nop     
63f9 00        nop     
63fa 00        nop     
63fb 00        nop     
63fc 00        nop     
63fd 00        nop     
63fe 00        nop     
63ff 00        nop     
6400 00        nop     
6401 00        nop     
6402 00        nop     
6403 00        nop     
6404 00        nop     
6405 00        nop     
6406 00        nop     
6407 00        nop     
6408 00        nop     
6409 00        nop     
640a 00        nop     
640b 00        nop     
640c 00        nop     
640d 00        nop     
640e 00        nop     
640f 00        nop     
6410 00        nop     
6411 00        nop     
6412 00        nop     
6413 00        nop     
6414 00        nop     
6415 00        nop     
6416 00        nop     
6417 00        nop     
6418 00        nop     
6419 00        nop     
641a 00        nop     
641b 00        nop     
641c 00        nop     
641d 00        nop     
641e 00        nop     
641f 00        nop     
6420 00        nop     
6421 00        nop     
6422 00        nop     
6423 00        nop     
6424 00        nop     
6425 00        nop     
6426 00        nop     
6427 2028      jr      nz,$6451
6429 73        ld      (hl),e
642a 65        ld      h,l
642b 6c        ld      l,h
642c 65        ld      h,l
642d 63        ld      h,e
642e 74        ld      (hl),h
642f 65        ld      h,l
6430 64        ld      h,h
6431 2074      jr      nz,$64a7
6433 65        ld      h,l
6434 78        ld      a,b
6435 74        ld      (hl),h
6436 29        add     hl,hl
6437 ff        rst     $38
6438 2028      jr      nz,$6462
643a 63        ld      h,e
643b 6f        ld      l,a
643c 6c        ld      l,h
643d 75        ld      (hl),l
643e 6d        ld      l,l
643f 6e        ld      l,(hl)
6440 2074      jr      nz,$64b6
6442 65        ld      h,l
6443 78        ld      a,b
6444 74        ld      (hl),h
6445 29        add     hl,hl
6446 ff        rst     $38
6447 f5        push    af
6448 d5        push    de
6449 fde5      push    iy
644b dde5      push    ix
644d fd21a464  ld      iy,$64a4		fname WRITM066.HLP
6451 1100a0    ld      de,$a000
6454 b7        or      a
6455 ed52      sbc     hl,de
6457 dd217964  ld      ix,$6479
645b cda131    call    $31a1
645e dde1      pop     ix
6460 fde1      pop     iy
6462 d1        pop     de
6463 f1        pop     af
6464 c9        ret     

6465 21a464    ld      hl,$64a4		fname WRITM066.HLP
6468 119d27    ld      de,$279d
646b 0e86      ld      c,$86
646d cd0500    call    $0005
6470 119d27    ld      de,$279d
6473 0e11      ld      c,$11
6475 cd0500    call    $0005
6478 c9        ret     

6479 4d        ld      c,l
647a 65        ld      h,l
647b 73        ld      (hl),e
647c 73        ld      (hl),e
647d 61        ld      h,c
647e 67        ld      h,a
647f 65        ld      h,l
6480 2066      jr      nz,$64e8
6482 69        ld      l,c
6483 6c        ld      l,h
6484 65        ld      h,l
6485 2028      jr      nz,$64af
6487 57        ld      d,a
6488 52        ld      d,d
6489 49        ld      c,c
648a 54        ld      d,h
648b 4d        ld      c,l
648c 3036      jr      nc,$64c4
648e 362e      ld      (hl),$2e
6490 48        ld      c,b
6491 4c        ld      c,h
6492 50        ld      d,b
6493 29        add     hl,hl
6494 206e      jr      nz,$6504
6496 6f        ld      l,a
6497 74        ld      (hl),h
6498 2061      jr      nz,$64fb
649a 76        halt    
649b 61        ld      h,c
649c 69        ld      l,c
649d 6c        ld      l,h
649e 61        ld      h,c
649f 62        ld      h,d
64a0 6c        ld      l,h
64a1 65        ld      h,l
64a2 2e24      ld      l,$24
64a4 00        nop     
64a5 3a5752    ld      a,($5257)
64a8 49        ld      c,c
64a9 54        ld      d,h
64aa 4d        ld      c,l
64ab 3036      jr      nc,$64e3
64ad 362e      ld      (hl),$2e
64af 48        ld      c,b
64b0 4c        ld      c,h
64b1 50        ld      d,b
64b2 00        nop     
64b3 fd21ac68  ld      iy,$68ac
64b7 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
64ba cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
64bd cdaa66    call    $66aa
64c0 b7        or      a
64c1 280a      jr      z,$64cd
64c3 dd219366  ld      ix,$6693
64c7 cd0544    call    $4405
64ca c3ea65    jp      $65ea
64cd 97        sub     a
64ce 32f865    ld      ($65f8),a
64d1 cdbc7e    call    $7ebc
64d4 dd213ca5  ld      ix,$a53c
64d8 fd21f066  ld      iy,$66f0
64dc cd527e    call    $7e52
64df dae265    jp      c,$65e2
64e2 fe20      cp      $20
64e4 201a      jr      nz,$6500
64e6 cd5091    call    $9150
64e9 fe0d      cp      $0d
64eb cadc65    jp      z,$65dc
64ee 3e20      ld      a,$20
64f0 cdae92    call    $92ae
64f3 cd7844    call    $4478		write char in A
64f6 1803      jr      $64fb
64f8 cdc78e    call    $8ec7
64fb cd9f68    call    $689f
64fe 18dc      jr      $64dc
6500 fe08      cp      $08
6502 201c      jr      nz,$6520
6504 cd8291    call    $9182
6507 fe0d      cp      $0d
6509 cadc65    jp      z,$65dc
650c cd208f    call    $8f20
650f cd2c03    call    $032c
6512 cd6081    call    $8160
6515 cd6482    call    $8264
6518 cd1a03    call    $031a
651b cd4e83    call    $834e
651e 18bc      jr      $64dc
6520 fe0c      cp      $0c
6522 2013      jr      nz,$6537
6524 cd5091    call    $9150
6527 fe0d      cp      $0d
6529 cadc65    jp      z,$65dc
652c cdc78e    call    $8ec7
652f cd9f68    call    $689f
6532 cd4e83    call    $834e
6535 18a5      jr      $64dc
6537 fe09      cp      $09
6539 201c      jr      nz,$6557
653b cd2b83    call    $832b
653e cdaf67    call    $67af
6541 d2dc65    jp      nc,$65dc
6544 47        ld      b,a
6545 cd3683    call    $8336
6548 4f        ld      c,a
6549 c5        push    bc
654a cd8040    call    $4080
654d c1        pop     bc
654e cd5583    call    $8355
6551 cd9f68    call    $689f
6554 c3dc64    jp      $64dc
6557 fe0b      cp      $0b
6559 2014      jr      nz,$656f
655b 3af865    ld      a,($65f8)
655e b7        or      a
655f cadc64    jp      z,$64dc
6562 97        sub     a
6563 32f865    ld      ($65f8),a
6566 cd3740    call    $4037
6569 cd6482    call    $8264
656c c3dc64    jp      $64dc
656f fe0a      cp      $0a
6571 2014      jr      nz,$6587
6573 3af865    ld      a,($65f8)
6576 b7        or      a
6577 c2dc64    jp      nz,$64dc
657a 3c        inc     a
657b 32f865    ld      ($65f8),a
657e cd5a40    call    $405a
6581 cd6482    call    $8264
6584 c3dc64    jp      $64dc
6587 fe0d      cp      $0d
6589 201a      jr      nz,$65a5
658b cd1167    call    $6711
658e cd8d26    call    $268d
6591 c640      add     a,$40
6593 32b468    ld      ($68b4),a
6596 fd21b468  ld      iy,$68b4
659a cd8230    call    $3082
659d cdfc60    call    $60fc
65a0 cd3f30    call    $303f
65a3 183d      jr      $65e2
65a5 cd7c8c    call    $8c7c
65a8 fe4c      cp      $4c
65aa 200a      jr      nz,$65b6
65ac 3af865    ld      a,($65f8)
65af b7        or      a
65b0 282a      jr      z,$65dc
65b2 3e4c      ld      a,$4c
65b4 181a      jr      $65d0
65b6 fe52      cp      $52
65b8 200a      jr      nz,$65c4
65ba 3af865    ld      a,($65f8)
65bd b7        or      a
65be 281c      jr      z,$65dc
65c0 3e52      ld      a,$52
65c2 180c      jr      $65d0
65c4 fe5e      cp      $5e
65c6 2014      jr      nz,$65dc
65c8 3af865    ld      a,($65f8)
65cb b7        or      a
65cc 200e      jr      nz,$65dc
65ce 3e5e      ld      a,$5e
65d0 cdae92    call    $92ae
65d3 cd7844    call    $4478		write char in A
65d6 cd9f68    call    $689f
65d9 c3dc64    jp      $64dc
65dc cd2202    call    $0222
65df c3dc64    jp      $64dc
65e2 cd6041    call    $4160
65e5 0605      ld      b,$05
65e7 cdfe3f    call    $3ffe
65ea fd21ac68  ld      iy,$68ac
65ee cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
65f1 cd1e41    call    $411e
65f4 cdb67e    call    $7eb6
65f7 c9        ret     

65f8 00        nop     
65f9 21c468    ld      hl,$68c4
65fc 22d368    ld      ($68d3),hl
65ff 21d668    ld      hl,$68d6
6602 22e568    ld      ($68e5),hl
6605 cd8d26    call    $268d
6608 c640      add     a,$40
660a 32b468    ld      ($68b4),a
660d fd21b468  ld      iy,$68b4
6611 cdf72d    call    $2df7
6614 fe02      cp      $02
6616 200a      jr      nz,$6622
6618 dd219366  ld      ix,$6693
661c cd0544    call    $4405
661f c39166    jp      $6691
6622 21e768    ld      hl,$68e7
6625 0e00      ld      c,$00
6627 cd212e    call    $2e21
662a fe01      cp      $01
662c 2863      jr      z,$6691
662e fe0d      cp      $0d
6630 2007      jr      nz,$6639
6632 97        sub     a
6633 3c        inc     a
6634 329266    ld      ($6692),a
6637 18ee      jr      $6627
6639 fe4c      cp      $4c
663b 201c      jr      nz,$6659
663d ed5bd368  ld      de,($68d3)
6641 e5        push    hl
6642 21d368    ld      hl,$68d3
6645 7a        ld      a,d
6646 bc        cp      h
6647 2002      jr      nz,$664b
6649 7b        ld      a,e
664a bd        cp      l
664b e1        pop     hl
664c 303a      jr      nc,$6688
664e 3a9266    ld      a,($6692)
6651 12        ld      (de),a
6652 13        inc     de
6653 ed53d368  ld      ($68d3),de
6657 182f      jr      $6688
6659 fe52      cp      $52
665b 201c      jr      nz,$6679
665d ed5be568  ld      de,($68e5)
6661 e5        push    hl
6662 21e568    ld      hl,$68e5
6665 7a        ld      a,d
6666 bc        cp      h
6667 2002      jr      nz,$666b
6669 7b        ld      a,e
666a bd        cp      l
666b e1        pop     hl
666c 301a      jr      nc,$6688
666e 3a9266    ld      a,($6692)
6671 12        ld      (de),a
6672 13        inc     de
6673 ed53e568  ld      ($68e5),de
6677 180f      jr      $6688
6679 fe5e      cp      $5e
667b 200b      jr      nz,$6688
667d 0c        inc     c
667e 79        ld      a,c
667f fe1f      cp      $1f
6681 30a4      jr      nc,$6627
6683 3a9266    ld      a,($6692)
6686 77        ld      (hl),a
6687 23        inc     hl
6688 3a9266    ld      a,($6692)
668b 3c        inc     a
668c 329266    ld      ($6692),a
668f 1896      jr      $6627
6691 c9        ret     

6692 015752    ld      bc,$5257
6695 49        ld      c,c
6696 54        ld      d,h
6697 4d        ld      c,l
6698 41        ld      b,c
6699 53        ld      d,e
669a 54        ld      d,h
669b 2e54      ld      l,$54
669d 41        ld      b,c
669e 42        ld      b,d
669f 206e      jr      nz,$670f
66a1 6f        ld      l,a
66a2 74        ld      (hl),h
66a3 2066      jr      nz,$670b
66a5 6f        ld      l,a
66a6 75        ld      (hl),l
66a7 6e        ld      l,(hl)
66a8 64        ld      h,h
66a9 24        inc     h
66aa fde5      push    iy
66ac cd6041    call    $4160
66af cd8d26    call    $268d
66b2 c640      add     a,$40
66b4 32b468    ld      ($68b4),a
66b7 fd21b468  ld      iy,$68b4
66bb cdf62c    call    $2cf6
66be fe02      cp      $02
66c0 282b      jr      z,$66ed
66c2 3e00      ld      a,$00
66c4 cd1b2d    call    $2d1b
66c7 fd21b068  ld      iy,$68b0
66cb cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
66ce cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
66d1 cd6041    call    $4160
66d4 cd735e    call    $5e73
66d7 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
66da cd1e41    call    $411e
66dd cd8e5e    call    $5e8e
66e0 cd0141    call    $4101
66e3 cd0141    call    $4101
66e6 cda440    call    $40a4
66e9 cdf066    call    $66f0
66ec 97        sub     a
66ed fde1      pop     iy
66ef c9        ret     

66f0 fde5      push    iy
66f2 fd21b068  ld      iy,$68b0
66f6 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
66f9 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
66fc cd2c03    call    $032c
66ff cd7d7a    call    $7a7d
6702 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
6705 cd1e41    call    $411e
6708 cd6482    call    $8264
670b cd1a03    call    $031a
670e fde1      pop     iy
6710 c9        ret     

6711 c5        push    bc
6712 d5        push    de
6713 e5        push    hl
6714 21c468    ld      hl,$68c4
6717 22d368    ld      ($68d3),hl
671a 21d668    ld      hl,$68d6
671d 22e568    ld      ($68e5),hl
6720 3af865    ld      a,($65f8)
6723 b7        or      a
6724 2803      jr      z,$6729
6726 cd3740    call    $4037
6729 cda440    call    $40a4
672c dd21e768  ld      ix,$68e7
6730 0600      ld      b,$00
6732 cdc78e    call    $8ec7
6735 fe0d      cp      $0d
6737 2005      jr      nz,$673e
6739 cd208f    call    $8f20
673c 1804      jr      $6742
673e fe20      cp      $20
6740 28f0      jr      z,$6732
6742 cd2b83    call    $832b
6745 3d        dec     a
6746 dd7700    ld      (ix+$00),a
6749 dd23      inc     ix
674b 04        inc     b
674c 78        ld      a,b
674d fe1f      cp      $1f
674f 3002      jr      nc,$6753
6751 18df      jr      $6732
6753 cde440    call    $40e4
6756 cdc78e    call    $8ec7
6759 fe0d      cp      $0d
675b 2842      jr      z,$679f
675d fe4c      cp      $4c
675f 201d      jr      nz,$677e
6761 ed5bd368  ld      de,($68d3)
6765 e5        push    hl
6766 21d368    ld      hl,$68d3
6769 7a        ld      a,d
676a bc        cp      h
676b 2002      jr      nz,$676f
676d 7b        ld      a,e
676e bd        cp      l
676f e1        pop     hl
6770 30e4      jr      nc,$6756
6772 cd2b83    call    $832b
6775 3d        dec     a
6776 12        ld      (de),a
6777 13        inc     de
6778 ed53d368  ld      ($68d3),de
677c 18d8      jr      $6756
677e fe52      cp      $52
6780 20d4      jr      nz,$6756
6782 ed5be568  ld      de,($68e5)
6786 e5        push    hl
6787 21e568    ld      hl,$68e5
678a 7a        ld      a,d
678b bc        cp      h
678c 2002      jr      nz,$6790
678e 7b        ld      a,e
678f bd        cp      l
6790 e1        pop     hl
6791 30c3      jr      nc,$6756
6793 cd2b83    call    $832b
6796 3d        dec     a
6797 12        ld      (de),a
6798 13        inc     de
6799 ed53e568  ld      ($68e5),de
679d 18b7      jr      $6756
679f e1        pop     hl
67a0 d1        pop     de
67a1 c1        pop     bc
67a2 c9        ret     

67a3 cd2b83    call    $832b
67a6 cdaf67    call    $67af
67a9 3003      jr      nc,$67ae
67ab cd2b68    call    $682b
67ae c9        ret     

67af c5        push    bc
67b0 dde5      push    ix
67b2 dd21e768  ld      ix,$68e7
67b6 0600      ld      b,$00
67b8 ddbe00    cp      (ix+$00)
67bb 380c      jr      c,$67c9
67bd dd23      inc     ix
67bf 04        inc     b
67c0 4f        ld      c,a
67c1 78        ld      a,b
67c2 fe1f      cp      $1f
67c4 3007      jr      nc,$67cd
67c6 79        ld      a,c
67c7 18ef      jr      $67b8
67c9 dd7e00    ld      a,(ix+$00)
67cc 37        scf     
67cd dde1      pop     ix
67cf c1        pop     bc
67d0 c9        ret     

67d1 21c468    ld      hl,$68c4
67d4 ed5bd368  ld      de,($68d3)
67d8 cde767    call    $67e7
67db c9        ret     

67dc 21d668    ld      hl,$68d6
67df ed5be568  ld      de,($68e5)
67e3 cde767    call    $67e7
67e6 c9        ret     

67e7 be        cp      (hl)
67e8 380d      jr      c,$67f7
67ea 23        inc     hl
67eb 4f        ld      c,a
67ec 7c        ld      a,h
67ed ba        cp      d
67ee 2002      jr      nz,$67f2
67f0 7d        ld      a,l
67f1 bb        cp      e
67f2 3005      jr      nc,$67f9
67f4 79        ld      a,c
67f5 18f0      jr      $67e7
67f7 7e        ld      a,(hl)
67f8 37        scf     
67f9 c9        ret     

67fa 21c368    ld      hl,$68c3
67fd ed5bd368  ld      de,($68d3)
6801 cd1068    call    $6810
6804 c9        ret     

6805 21d568    ld      hl,$68d5
6808 ed5be568  ld      de,($68e5)
680c cd1068    call    $6810
680f c9        ret     

6810 77        ld      (hl),a
6811 23        inc     hl
6812 be        cp      (hl)
6813 280f      jr      z,$6824
6815 380d      jr      c,$6824
6817 23        inc     hl
6818 4f        ld      c,a
6819 7c        ld      a,h
681a ba        cp      d
681b 2002      jr      nz,$681f
681d 7d        ld      a,l
681e bb        cp      e
681f 3003      jr      nc,$6824
6821 79        ld      a,c
6822 18ee      jr      $6812
6824 2b        dec     hl
6825 7e        ld      a,(hl)
6826 b7        or      a
6827 2801      jr      z,$682a
6829 37        scf     
682a c9        ret     

682b 47        ld      b,a
682c cd3683    call    $8336
682f 4f        ld      c,a
6830 cd743a    call    $3a74
6833 2006      jr      nz,$683b
6835 cd8040    call    $4080
6838 cd6482    call    $8264
683b cd2b83    call    $832b
683e 3d        dec     a
683f c608      add     a,$08
6841 e6f8      and     $f8
6843 3c        inc     a
6844 b8        cp      b
6845 2802      jr      z,$6849
6847 3025      jr      nc,$686e
6849 3e09      ld      a,$09
684b cd743a    call    $3a74
684e 280f      jr      z,$685f
6850 c5        push    bc
6851 010100    ld      bc,$0001
6854 119d68    ld      de,$689d
6857 cdca91    call    $91ca
685a c1        pop     bc
685b 383f      jr      c,$689c
685d 18dc      jr      $683b
685f cdf741    call    $41f7
6862 cd5583    call    $8355
6865 3805      jr      c,$686c
6867 3e09      ld      a,$09
6869 cdc47c    call    $7cc4
686c 18cd      jr      $683b
686e cd2b83    call    $832b
6871 57        ld      d,a
6872 78        ld      a,b
6873 92        sub     d
6874 2826      jr      z,$689c
6876 47        ld      b,a
6877 3e20      ld      a,$20
6879 cd743a    call    $3a74
687c 280f      jr      z,$688d
687e c5        push    bc
687f 010100    ld      bc,$0001
6882 119e68    ld      de,$689e
6885 cdca91    call    $91ca
6888 c1        pop     bc
6889 3811      jr      c,$689c
688b 180d      jr      $689a
688d cdf741    call    $41f7
6890 cd5583    call    $8355
6893 3805      jr      c,$689a
6895 3e20      ld      a,$20
6897 cdc47c    call    $7cc4
689a 10db      djnz    $6877
689c c9        ret     

689d 09        add     hl,bc
689e 20cd      jr      nz,$686d
68a0 2c        inc     l
68a1 03        inc     bc
68a2 cd0e81    call    $810e
68a5 cd6482    call    $8264
68a8 cd1a03    call    $031a
68ab c9        ret     

68ac 00        nop     
68ad 00        nop     
68ae 00        nop     
68af 00        nop     
68b0 00        nop     
68b1 00        nop     
68b2 00        nop     
68b3 00        nop     
68b4 00        nop     
68b5 3a5752    ld      a,($5257)
68b8 49        ld      c,c
68b9 54        ld      d,h
68ba 4d        ld      c,l
68bb 41        ld      b,c
68bc 53        ld      d,e
68bd 54        ld      d,h
68be 2e54      ld      l,$54
68c0 41        ld      b,c
68c1 42        ld      b,d
68c2 00        nop     
68c3 00        nop     
68c4 01050a    ld      bc,$0a05
68c7 0f        rrca    
68c8 14        inc     d
68c9 19        add     hl,de
68ca 1e00      ld      e,$00
68cc 00        nop     
68cd 00        nop     
68ce 00        nop     
68cf 00        nop     
68d0 00        nop     
68d1 00        nop     
68d2 00        nop     
68d3 00        nop     
68d4 00        nop     
68d5 00        nop     
68d6 282d      jr      z,$6905
68d8 32373c    ld      ($3c37),a
68db 41        ld      b,c
68dc 46        ld      b,(hl)
68dd 00        nop     
68de 00        nop     
68df 00        nop     
68e0 00        nop     
68e1 00        nop     
68e2 00        nop     
68e3 00        nop     
68e4 00        nop     
68e5 00        nop     
68e6 00        nop     
68e7 09        add     hl,bc
68e8 111921    ld      de,$2119
68eb 29        add     hl,hl
68ec 313941    ld      sp,$4139
68ef 49        ld      c,c
68f0 51        ld      d,c
68f1 59        ld      e,c
68f2 61        ld      h,c
68f3 69        ld      l,c
68f4 71        ld      (hl),c
68f5 79        ld      a,c
68f6 81        add     a,c
68f7 89        adc     a,c
68f8 91        sub     c
68f9 99        sbc     a,c
68fa a1        and     c
68fb a9        xor     c
68fc b1        or      c
68fd b9        cp      c
68fe c1        pop     bc
68ff c9        ret     

6900 d1        pop     de
6901 d9        exx     
6902 e1        pop     hl
6903 e9        jp      (hl)
6904 f1        pop     af
6905 f9        ld      sp,hl
6906 f5        push    af
6907 c5        push    bc
6908 e5        push    hl
6909 2ab06d    ld      hl,($6db0)
690c cd0d4a    call    $4a0d
690f 300b      jr      nc,$691c
6911 cd9f4a    call    $4a9f
6914 7c        ld      a,h
6915 b8        cp      b
6916 2002      jr      nz,$691a
6918 7d        ld      a,l
6919 b9        cp      c
691a 3006      jr      nc,$6922
691c 23        inc     hl
691d 22b06d    ld      ($6db0),hl
6920 1806      jr      $6928
6922 cd4469    call    $6944
6925 cd1382    call    $8213
6928 e1        pop     hl
6929 c1        pop     bc
692a f1        pop     af
692b c9        ret     

692c f5        push    af
692d e5        push    hl
692e 2ab06d    ld      hl,($6db0)
6931 2b        dec     hl
6932 7c        ld      a,h
6933 b5        or      l
6934 2805      jr      z,$693b
6936 22b06d    ld      ($6db0),hl
6939 1806      jr      $6941
693b cd5469    call    $6954
693e cd0c82    call    $820c
6941 e1        pop     hl
6942 f1        pop     af
6943 c9        ret     

6944 e5        push    hl
6945 cd6169    call    $6961
6948 cd9969    call    $6999
694b 2aae6d    ld      hl,($6dae)
694e 23        inc     hl
694f 22ae6d    ld      ($6dae),hl
6952 e1        pop     hl
6953 c9        ret     

6954 e5        push    hl
6955 cd7469    call    $6974
6958 2aae6d    ld      hl,($6dae)
695b 2b        dec     hl
695c 22ae6d    ld      ($6dae),hl
695f e1        pop     hl
6960 c9        ret     

6961 c5        push    bc
6962 e5        push    hl
6963 2aac6d    ld      hl,($6dac)
6966 ed4bb06d  ld      bc,($6db0)
696a 2b        dec     hl
696b 70        ld      (hl),b
696c 2b        dec     hl
696d 71        ld      (hl),c
696e 22ac6d    ld      ($6dac),hl
6971 e1        pop     hl
6972 c1        pop     bc
6973 c9        ret     

6974 c5        push    bc
6975 e5        push    hl
6976 2aac6d    ld      hl,($6dac)
6979 4e        ld      c,(hl)
697a 23        inc     hl
697b 46        ld      b,(hl)
697c 23        inc     hl
697d 22ac6d    ld      ($6dac),hl
6980 ed43b06d  ld      ($6db0),bc
6984 e1        pop     hl
6985 c1        pop     bc
6986 c9        ret     

6987 e5        push    hl
6988 21ac6d    ld      hl,$6dac
698b 22ac6d    ld      ($6dac),hl
698e 210100    ld      hl,$0001
6991 22ae6d    ld      ($6dae),hl
6994 cd9969    call    $6999
6997 e1        pop     hl
6998 c9        ret     

6999 e5        push    hl
699a 210100    ld      hl,$0001
699d 22b06d    ld      ($6db0),hl
69a0 e1        pop     hl
69a1 c9        ret     

69a2 ed4bae6d  ld      bc,($6dae)
69a6 c9        ret     

69a7 ed4bb06d  ld      bc,($6db0)
69ab c9        ret     

69ac 00        nop     
69ad 00        nop     
69ae 00        nop     
69af 00        nop     
69b0 00        nop     
69b1 00        nop     
69b2 00        nop     
69b3 00        nop     
69b4 00        nop     
69b5 00        nop     
69b6 00        nop     
69b7 00        nop     
69b8 00        nop     
69b9 00        nop     
69ba 00        nop     
69bb 00        nop     
69bc 00        nop     
69bd 00        nop     
69be 00        nop     
69bf 00        nop     
69c0 00        nop     
69c1 00        nop     
69c2 00        nop     
69c3 00        nop     
69c4 00        nop     
69c5 00        nop     
69c6 00        nop     
69c7 00        nop     
69c8 00        nop     
69c9 00        nop     
69ca 00        nop     
69cb 00        nop     
69cc 00        nop     
69cd 00        nop     
69ce 00        nop     
69cf 00        nop     
69d0 00        nop     
69d1 00        nop     
69d2 00        nop     
69d3 00        nop     
69d4 00        nop     
69d5 00        nop     
69d6 00        nop     
69d7 00        nop     
69d8 00        nop     
69d9 00        nop     
69da 00        nop     
69db 00        nop     
69dc 00        nop     
69dd 00        nop     
69de 00        nop     
69df 00        nop     
69e0 00        nop     
69e1 00        nop     
69e2 00        nop     
69e3 00        nop     
69e4 00        nop     
69e5 00        nop     
69e6 00        nop     
69e7 00        nop     
69e8 00        nop     
69e9 00        nop     
69ea 00        nop     
69eb 00        nop     
69ec 00        nop     
69ed 00        nop     
69ee 00        nop     
69ef 00        nop     
69f0 00        nop     
69f1 00        nop     
69f2 00        nop     
69f3 00        nop     
69f4 00        nop     
69f5 00        nop     
69f6 00        nop     
69f7 00        nop     
69f8 00        nop     
69f9 00        nop     
69fa 00        nop     
69fb 00        nop     
69fc 00        nop     
69fd 00        nop     
69fe 00        nop     
69ff 00        nop     
6a00 00        nop     
6a01 00        nop     
6a02 00        nop     
6a03 00        nop     
6a04 00        nop     
6a05 00        nop     
6a06 00        nop     
6a07 00        nop     
6a08 00        nop     
6a09 00        nop     
6a0a 00        nop     
6a0b 00        nop     
6a0c 00        nop     
6a0d 00        nop     
6a0e 00        nop     
6a0f 00        nop     
6a10 00        nop     
6a11 00        nop     
6a12 00        nop     
6a13 00        nop     
6a14 00        nop     
6a15 00        nop     
6a16 00        nop     
6a17 00        nop     
6a18 00        nop     
6a19 00        nop     
6a1a 00        nop     
6a1b 00        nop     
6a1c 00        nop     
6a1d 00        nop     
6a1e 00        nop     
6a1f 00        nop     
6a20 00        nop     
6a21 00        nop     
6a22 00        nop     
6a23 00        nop     
6a24 00        nop     
6a25 00        nop     
6a26 00        nop     
6a27 00        nop     
6a28 00        nop     
6a29 00        nop     
6a2a 00        nop     
6a2b 00        nop     
6a2c 00        nop     
6a2d 00        nop     
6a2e 00        nop     
6a2f 00        nop     
6a30 00        nop     
6a31 00        nop     
6a32 00        nop     
6a33 00        nop     
6a34 00        nop     
6a35 00        nop     
6a36 00        nop     
6a37 00        nop     
6a38 00        nop     
6a39 00        nop     
6a3a 00        nop     
6a3b 00        nop     
6a3c 00        nop     
6a3d 00        nop     
6a3e 00        nop     
6a3f 00        nop     
6a40 00        nop     
6a41 00        nop     
6a42 00        nop     
6a43 00        nop     
6a44 00        nop     
6a45 00        nop     
6a46 00        nop     
6a47 00        nop     
6a48 00        nop     
6a49 00        nop     
6a4a 00        nop     
6a4b 00        nop     
6a4c 00        nop     
6a4d 00        nop     
6a4e 00        nop     
6a4f 00        nop     
6a50 00        nop     
6a51 00        nop     
6a52 00        nop     
6a53 00        nop     
6a54 00        nop     
6a55 00        nop     
6a56 00        nop     
6a57 00        nop     
6a58 00        nop     
6a59 00        nop     
6a5a 00        nop     
6a5b 00        nop     
6a5c 00        nop     
6a5d 00        nop     
6a5e 00        nop     
6a5f 00        nop     
6a60 00        nop     
6a61 00        nop     
6a62 00        nop     
6a63 00        nop     
6a64 00        nop     
6a65 00        nop     
6a66 00        nop     
6a67 00        nop     
6a68 00        nop     
6a69 00        nop     
6a6a 00        nop     
6a6b 00        nop     
6a6c 00        nop     
6a6d 00        nop     
6a6e 00        nop     
6a6f 00        nop     
6a70 00        nop     
6a71 00        nop     
6a72 00        nop     
6a73 00        nop     
6a74 00        nop     
6a75 00        nop     
6a76 00        nop     
6a77 00        nop     
6a78 00        nop     
6a79 00        nop     
6a7a 00        nop     
6a7b 00        nop     
6a7c 00        nop     
6a7d 00        nop     
6a7e 00        nop     
6a7f 00        nop     
6a80 00        nop     
6a81 00        nop     
6a82 00        nop     
6a83 00        nop     
6a84 00        nop     
6a85 00        nop     
6a86 00        nop     
6a87 00        nop     
6a88 00        nop     
6a89 00        nop     
6a8a 00        nop     
6a8b 00        nop     
6a8c 00        nop     
6a8d 00        nop     
6a8e 00        nop     
6a8f 00        nop     
6a90 00        nop     
6a91 00        nop     
6a92 00        nop     
6a93 00        nop     
6a94 00        nop     
6a95 00        nop     
6a96 00        nop     
6a97 00        nop     
6a98 00        nop     
6a99 00        nop     
6a9a 00        nop     
6a9b 00        nop     
6a9c 00        nop     
6a9d 00        nop     
6a9e 00        nop     
6a9f 00        nop     
6aa0 00        nop     
6aa1 00        nop     
6aa2 00        nop     
6aa3 00        nop     
6aa4 00        nop     
6aa5 00        nop     
6aa6 00        nop     
6aa7 00        nop     
6aa8 00        nop     
6aa9 00        nop     
6aaa 00        nop     
6aab 00        nop     
6aac 00        nop     
6aad 00        nop     
6aae 00        nop     
6aaf 00        nop     
6ab0 00        nop     
6ab1 00        nop     
6ab2 00        nop     
6ab3 00        nop     
6ab4 00        nop     
6ab5 00        nop     
6ab6 00        nop     
6ab7 00        nop     
6ab8 00        nop     
6ab9 00        nop     
6aba 00        nop     
6abb 00        nop     
6abc 00        nop     
6abd 00        nop     
6abe 00        nop     
6abf 00        nop     
6ac0 00        nop     
6ac1 00        nop     
6ac2 00        nop     
6ac3 00        nop     
6ac4 00        nop     
6ac5 00        nop     
6ac6 00        nop     
6ac7 00        nop     
6ac8 00        nop     
6ac9 00        nop     
6aca 00        nop     
6acb 00        nop     
6acc 00        nop     
6acd 00        nop     
6ace 00        nop     
6acf 00        nop     
6ad0 00        nop     
6ad1 00        nop     
6ad2 00        nop     
6ad3 00        nop     
6ad4 00        nop     
6ad5 00        nop     
6ad6 00        nop     
6ad7 00        nop     
6ad8 00        nop     
6ad9 00        nop     
6ada 00        nop     
6adb 00        nop     
6adc 00        nop     
6add 00        nop     
6ade 00        nop     
6adf 00        nop     
6ae0 00        nop     
6ae1 00        nop     
6ae2 00        nop     
6ae3 00        nop     
6ae4 00        nop     
6ae5 00        nop     
6ae6 00        nop     
6ae7 00        nop     
6ae8 00        nop     
6ae9 00        nop     
6aea 00        nop     
6aeb 00        nop     
6aec 00        nop     
6aed 00        nop     
6aee 00        nop     
6aef 00        nop     
6af0 00        nop     
6af1 00        nop     
6af2 00        nop     
6af3 00        nop     
6af4 00        nop     
6af5 00        nop     
6af6 00        nop     
6af7 00        nop     
6af8 00        nop     
6af9 00        nop     
6afa 00        nop     
6afb 00        nop     
6afc 00        nop     
6afd 00        nop     
6afe 00        nop     
6aff 00        nop     
6b00 00        nop     
6b01 00        nop     
6b02 00        nop     
6b03 00        nop     
6b04 00        nop     
6b05 00        nop     
6b06 00        nop     
6b07 00        nop     
6b08 00        nop     
6b09 00        nop     
6b0a 00        nop     
6b0b 00        nop     
6b0c 00        nop     
6b0d 00        nop     
6b0e 00        nop     
6b0f 00        nop     
6b10 00        nop     
6b11 00        nop     
6b12 00        nop     
6b13 00        nop     
6b14 00        nop     
6b15 00        nop     
6b16 00        nop     
6b17 00        nop     
6b18 00        nop     
6b19 00        nop     
6b1a 00        nop     
6b1b 00        nop     
6b1c 00        nop     
6b1d 00        nop     
6b1e 00        nop     
6b1f 00        nop     
6b20 00        nop     
6b21 00        nop     
6b22 00        nop     
6b23 00        nop     
6b24 00        nop     
6b25 00        nop     
6b26 00        nop     
6b27 00        nop     
6b28 00        nop     
6b29 00        nop     
6b2a 00        nop     
6b2b 00        nop     
6b2c 00        nop     
6b2d 00        nop     
6b2e 00        nop     
6b2f 00        nop     
6b30 00        nop     
6b31 00        nop     
6b32 00        nop     
6b33 00        nop     
6b34 00        nop     
6b35 00        nop     
6b36 00        nop     
6b37 00        nop     
6b38 00        nop     
6b39 00        nop     
6b3a 00        nop     
6b3b 00        nop     
6b3c 00        nop     
6b3d 00        nop     
6b3e 00        nop     
6b3f 00        nop     
6b40 00        nop     
6b41 00        nop     
6b42 00        nop     
6b43 00        nop     
6b44 00        nop     
6b45 00        nop     
6b46 00        nop     
6b47 00        nop     
6b48 00        nop     
6b49 00        nop     
6b4a 00        nop     
6b4b 00        nop     
6b4c 00        nop     
6b4d 00        nop     
6b4e 00        nop     
6b4f 00        nop     
6b50 00        nop     
6b51 00        nop     
6b52 00        nop     
6b53 00        nop     
6b54 00        nop     
6b55 00        nop     
6b56 00        nop     
6b57 00        nop     
6b58 00        nop     
6b59 00        nop     
6b5a 00        nop     
6b5b 00        nop     
6b5c 00        nop     
6b5d 00        nop     
6b5e 00        nop     
6b5f 00        nop     
6b60 00        nop     
6b61 00        nop     
6b62 00        nop     
6b63 00        nop     
6b64 00        nop     
6b65 00        nop     
6b66 00        nop     
6b67 00        nop     
6b68 00        nop     
6b69 00        nop     
6b6a 00        nop     
6b6b 00        nop     
6b6c 00        nop     
6b6d 00        nop     
6b6e 00        nop     
6b6f 00        nop     
6b70 00        nop     
6b71 00        nop     
6b72 00        nop     
6b73 00        nop     
6b74 00        nop     
6b75 00        nop     
6b76 00        nop     
6b77 00        nop     
6b78 00        nop     
6b79 00        nop     
6b7a 00        nop     
6b7b 00        nop     
6b7c 00        nop     
6b7d 00        nop     
6b7e 00        nop     
6b7f 00        nop     
6b80 00        nop     
6b81 00        nop     
6b82 00        nop     
6b83 00        nop     
6b84 00        nop     
6b85 00        nop     
6b86 00        nop     
6b87 00        nop     
6b88 00        nop     
6b89 00        nop     
6b8a 00        nop     
6b8b 00        nop     
6b8c 00        nop     
6b8d 00        nop     
6b8e 00        nop     
6b8f 00        nop     
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
6dac ac        xor     h
6dad 6d        ld      l,l
6dae 00        nop     
6daf 00        nop     
6db0 00        nop     
6db1 00        nop     
6db2 cdb95a    call    $5ab9
6db5 b7        or      a
6db6 ca036f    jp      z,$6f03
6db9 cdf902    call    $02f9
6dbc cd2c03    call    $032c
6dbf 1611      ld      d,$11		set cursor pos
6dc1 1e01      ld      e,$01
6dc3 cd2e04    call    $042e		CDOS: set special crt function
6dc6 063e      ld      b,$3e
6dc8 214876    ld      hl,$7648
6dcb cde601    call    $01e6
6dce 77        ld      (hl),a
6dcf 23        inc     hl
6dd0 cdd502    call    $02d5
6dd3 10f6      djnz    $6dcb
6dd5 3624      ld      (hl),$24
6dd7 dd214876  ld      ix,$7648
6ddb cd9803    call    $0398
6dde 3e08      ld      a,$08
6de0 cdbb85    call    $85bb
6de3 cda885    call    $85a8
6de6 210870    ld      hl,$7008
6de9 cd7689    call    $8976
6dec 97        sub     a
6ded cd6503    call    $0365
6df0 211370    ld      hl,$7013
6df3 cd7689    call    $8976
6df6 3ed2      ld      a,$d2
6df8 0e02      ld      c,$02
6dfa 1e20      ld      e,$20
6dfc cd0b8c    call    $8c0b
6dff cda885    call    $85a8
6e02 cd5c6f    call    $6f5c
6e05 b7        or      a
6e06 cafd6e    jp      z,$6efd
6e09 3e18      ld      a,$18
6e0b cdbb85    call    $85bb
6e0e cda885    call    $85a8
6e11 211a70    ld      hl,$701a
6e14 cd7689    call    $8976
6e17 97        sub     a
6e18 cd6503    call    $0365
6e1b 212570    ld      hl,$7025
6e1e cd7689    call    $8976
6e21 3e02      ld      a,$02
6e23 cd6503    call    $0365
6e26 212970    ld      hl,$7029
6e29 cd7689    call    $8976
6e2c cde46f    call    $6fe4
6e2f dafd6e    jp      c,$6efd
6e32 228776    ld      ($7687),hl
6e35 1645      ld      d,$45	set cursor pos
6e37 1e01      ld      e,$01
6e39 cd2e04    call    $042e	CDOS: set special crt function
6e3c 97        sub     a
6e3d cd6503    call    $0365
6e40 113970    ld      de,$7039
6e43 0e09      ld      c,$09
6e45 cd0500    call    $0005
6e48 cdf56f    call    $6ff5
6e4b 3e25      ld      a,$25
6e4d cdbb85    call    $85bb
6e50 cda885    call    $85a8
6e53 214070    ld      hl,$7040
6e56 cd7689    call    $8976
6e59 cdbb6f    call    $6fbb
6e5c b7        or      a
6e5d cafd6e    jp      z,$6efd
6e60 cd7844    call    $4478		write char in A
6e63 dd215670  ld      ix,$7056
6e67 cd9d43    call    $439d
6e6a cd693b    call    $3b69
6e6d 2008      jr      nz,$6e77
6e6f 116370    ld      de,$7063
6e72 0e09      ld      c,$09
6e74 cd0500    call    $0005
6e77 cd4d89    call    $894d
6e7a cd2b55    call    $552b
6e7d 3063      jr      nc,$6ee2
6e7f cd126f    call    $6f12
6e82 cdf56f    call    $6ff5
6e85 cd236f    call    $6f23
6e88 cd1e41    call    $411e
6e8b cd693b    call    $3b69
6e8e 200c      jr      nz,$6e9c
6e90 cd326f    call    $6f32
6e93 3863      jr      c,$6ef8
6e95 cd076f    call    $6f07
6e98 2853      jr      z,$6eed
6e9a 18db      jr      $6e77
6e9c cdd482    call    $82d4
6e9f cd7d7a    call    $7a7d
6ea2 cd6482    call    $8264
6ea5 cd5202    call    $0252
6ea8 3e25      ld      a,$25
6eaa cdbb85    call    $85bb
6ead cda885    call    $85a8
6eb0 217170    ld      hl,$7071
6eb3 cd7689    call    $8976
6eb6 11046f    ld      de,$6f04
6eb9 0e09      ld      c,$09
6ebb cd0500    call    $0005
6ebe cde702    call    $02e7
6ec1 cde702    call    $02e7
6ec4 cd836f    call    $6f83
6ec7 b7        or      a
6ec8 282e      jr      z,$6ef8
6eca cd7844    call    $4478		write char in A
6ecd fe4e      cp      $4e
6ecf 280a      jr      z,$6edb
6ed1 fe59      cp      $59
6ed3 c4793b    call    nz,$3b79
6ed6 cd326f    call    $6f32
6ed9 381d      jr      c,$6ef8
6edb cd076f    call    $6f07
6ede 280d      jr      z,$6eed
6ee0 1881      jr      $6e63
6ee2 cd1e41    call    $411e
6ee5 cd6089    call    $8960
6ee8 cda55d    call    $5da5
6eeb 180b      jr      $6ef8
6eed 3e24      ld      a,$24
6eef cdbb85    call    $85bb
6ef2 cda885    call    $85a8
6ef5 cd4202    call    $0242
6ef8 cdd482    call    $82d4
6efb 3e01      ld      a,$01
6efd cdb703    call    $03b7
6f00 cd1a03    call    $031a
6f03 c9        ret     

6f04 2020      jr      nz,$6f26
6f06 24        inc     h
6f07 dd218776  ld      ix,$7687
6f0b dd7e00    ld      a,(ix+$00)
6f0e ddb601    or      (ix+$01)
6f11 c9        ret     

6f12 dd218776  ld      ix,$7687
6f16 dd7e00    ld      a,(ix+$00)
6f19 b7        or      a
6f1a 2003      jr      nz,$6f1f
6f1c dd3501    dec     (ix+$01)
6f1f dd3500    dec     (ix+$00)
6f22 c9        ret     

6f23 d5        push    de
6f24 e5        push    hl
6f25 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
6f28 fd218a76  ld      iy,$768a
6f2c cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
6f2f e1        pop     hl
6f30 d1        pop     de
6f31 c9        ret     

6f32 c5        push    bc
6f33 fde5      push    iy
6f35 fd218a76  ld      iy,$768a
6f39 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
6f3c d5        push    de
6f3d e5        push    hl
6f3e cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
6f41 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
6f44 e1        pop     hl
6f45 d1        pop     de
6f46 cda93f    call    $3fa9
6f49 111e76    ld      de,$761e
6f4c 3a8976    ld      a,($7689)
6f4f 4f        ld      c,a
6f50 0600      ld      b,$00
6f52 cdca91    call    $91ca
6f55 cd208f    call    $8f20
6f58 fde1      pop     iy
6f5a c1        pop     bc
6f5b c9        ret     

6f5c e5        push    hl
6f5d dde5      push    ix
6f5f cd1a03    call    $031a
6f62 3e04      ld      a,$04
6f64 cd6503    call    $0365
6f67 dd21ffaa  ld      ix,$aaff
6f6b 211e76    ld      hl,$761e
6f6e cdd67e    call    $7ed6
6f71 b7        or      a
6f72 2808      jr      z,$6f7c
6f74 3624      ld      (hl),$24
6f76 78        ld      a,b
6f77 328976    ld      ($7689),a
6f7a 3e01      ld      a,$01
6f7c cd2c03    call    $032c
6f7f dde1      pop     ix
6f81 e1        pop     hl
6f82 c9        ret     

6f83 dde5      push    ix
6f85 cd1a03    call    $031a
6f88 cda37d    call    $7da3		discard keys typed on terminal
6f8b dd2195ab  ld      ix,$ab95
6f8f 21b56f    ld      hl,$6fb5
6f92 cda17e    call    $7ea1
6f95 3817      jr      c,$6fae
6f97 fe4f      cp      $4f
6f99 2006      jr      nz,$6fa1
6f9b dd214876  ld      ix,$7648
6f9f 1808      jr      $6fa9
6fa1 fe52      cp      $52
6fa3 200a      jr      nz,$6faf
6fa5 dd211e76  ld      ix,$761e
6fa9 cd9803    call    $0398
6fac 18dd      jr      $6f8b
6fae 97        sub     a
6faf cd2c03    call    $032c
6fb2 dde1      pop     ix
6fb4 c9        ret     

6fb5 59        ld      e,c
6fb6 4e        ld      c,(hl)
6fb7 43        ld      b,e
6fb8 4f        ld      c,a
6fb9 52        ld      d,d
6fba 00        nop     
6fbb cd1a03    call    $031a
6fbe cda37d    call    $7da3		discard keys typed on terminal
6fc1 dd217aac  ld      ix,$ac7a
6fc5 21e06f    ld      hl,$6fe0
6fc8 cda17e    call    $7ea1
6fcb 3003      jr      nc,$6fd0
6fcd 97        sub     a
6fce 180c      jr      $6fdc
6fd0 fe4e      cp      $4e
6fd2 2005      jr      nz,$6fd9
6fd4 cd793b    call    $3b79
6fd7 1803      jr      $6fdc
6fd9 cd713b    call    $3b71
6fdc cd2c03    call    $032c
6fdf c9        ret     

6fe0 59        ld      e,c
6fe1 4e        ld      c,(hl)
6fe2 0d        dec     c
6fe3 00        nop     
6fe4 cd1a03    call    $031a
6fe7 3e05      ld      a,$05
6fe9 cdd47d    call    $7dd4
6fec 7c        ld      a,h
6fed b5        or      l
6fee 2001      jr      nz,$6ff1
6ff0 2c        inc     l
6ff1 cd2c03    call    $032c
6ff4 c9        ret     

6ff5 c5        push    bc
6ff6 d5        push    de
6ff7 cd1086    call    $8610
6ffa ed4b8776  ld      bc,($7687)
6ffe 164b      ld      d,$4b
7000 1e01      ld      e,$01
7002 cd2a7f    call    $7f2a
7005 d1        pop     de
7006 c1        pop     bc
7007 c9        ret     

7008 3c        inc     a
7009 6f        ld      l,a
700a 6c        ld      l,h
700b 64        ld      h,h
700c 2074      jr      nz,$7082
700e 65        ld      h,l
700f 78        ld      a,b
7010 74        ld      (hl),h
7011 3e24      ld      a,$24
7013 2077      jr      nz,$708c
7015 69        ld      l,c
7016 74        ld      (hl),h
7017 68        ld      l,b
7018 3a243c    ld      a,($3c24)
701b 6e        ld      l,(hl)
701c 65        ld      h,l
701d 77        ld      (hl),a
701e 2074      jr      nz,$7094
7020 65        ld      h,l
7021 78        ld      a,b
7022 74        ld      (hl),h
7023 3e24      ld      a,$24
7025 2e20      ld      l,$20
7027 2024      jr      nz,$704d
7029 48        ld      c,b
702a 6f        ld      l,a
702b 77        ld      (hl),a
702c 206d      jr      nz,$709b
702e 61        ld      h,c
702f 6e        ld      l,(hl)
7030 79        ld      a,c
7031 2074      jr      nz,$70a7
7033 69        ld      l,c
7034 6d        ld      l,l
7035 65        ld      h,l
7036 73        ld      (hl),e
7037 3f        ccf     
7038 24        inc     h
7039 43        ld      b,e
703a 4f        ld      c,a
703b 55        ld      d,l
703c 4e        ld      c,(hl)
703d 54        ld      d,h
703e 3a2443    ld      a,($4324)
7041 6f        ld      l,a
7042 6e        ld      l,(hl)
7043 66        ld      h,(hl)
7044 69        ld      l,c
7045 72        ld      (hl),d
7046 6d        ld      l,l
7047 2072      jr      nz,$70bb
7049 65        ld      h,l
704a 70        ld      (hl),b
704b 6c        ld      l,h
704c 61        ld      h,c
704d 63        ld      h,e
704e 65        ld      h,l
704f 6d        ld      l,l
7050 65        ld      h,l
7051 6e        ld      l,(hl)
7052 74        ld      (hl),h
7053 73        ld      (hl),e
7054 3f        ccf     
7055 24        inc     h
7056 53        ld      d,e
7057 65        ld      h,l
7058 61        ld      h,c
7059 72        ld      (hl),d
705a 63        ld      h,e
705b 68        ld      l,b
705c 69        ld      l,c
705d 6e        ld      l,(hl)
705e 67        ld      h,a
705f 2e2e      ld      l,$2e
7061 2e24      ld      l,$24
7063 61        ld      h,c
7064 6e        ld      l,(hl)
7065 64        ld      h,h
7066 2072      jr      nz,$70da
7068 65        ld      h,l
7069 70        ld      (hl),b
706a 6c        ld      l,h
706b 61        ld      h,c
706c 63        ld      h,e
706d 69        ld      l,c
706e 6e        ld      l,(hl)
706f 67        ld      h,a
7070 24        inc     h
7071 54        ld      d,h
7072 65        ld      h,l
7073 78        ld      a,b
7074 74        ld      (hl),h
7075 2066      jr      nz,$70dd
7077 6f        ld      l,a
7078 75        ld      (hl),l
7079 6e        ld      l,(hl)
707a 64        ld      h,h
707b 2e20      ld      l,$20
707d 52        ld      d,d
707e 65        ld      h,l
707f 70        ld      (hl),b
7080 6c        ld      l,h
7081 61        ld      h,c
7082 63        ld      h,e
7083 65        ld      h,l
7084 3f        ccf     
7085 24        inc     h
7086 c5        push    bc
7087 d5        push    de
7088 dde5      push    ix
708a fde5      push    iy
708c 224272    ld      ($7242),hl
708f cd6a71    call    $716a
7092 cd1a71    call    $711a
7095 387b      jr      c,$7112
7097 224472    ld      ($7244),hl
709a e5        push    hl
709b dde1      pop     ix
709d dd23      inc     ix
709f cd6a71    call    $716a
70a2 cd1a71    call    $711a
70a5 383e      jr      c,$70e5
70a7 e5        push    hl
70a8 fde1      pop     iy
70aa fd23      inc     iy
70ac 06ff      ld      b,$ff
70ae cd2671    call    $7126
70b1 282d      jr      z,$70e0
70b3 382b      jr      c,$70e0
70b5 215372    ld      hl,$7253
70b8 cd7971    call    $7179
70bb 36ff      ld      (hl),$ff
70bd 214672    ld      hl,$7246
70c0 fde5      push    iy
70c2 dde1      pop     ix
70c4 cd7971    call    $7179
70c7 36ff      ld      (hl),$ff
70c9 dde5      push    ix
70cb e1        pop     hl
70cc dd215372  ld      ix,$7253
70d0 cd7971    call    $7179
70d3 36ff      ld      (hl),$ff
70d5 224472    ld      ($7244),hl
70d8 23        inc     hl
70d9 dd214672  ld      ix,$7246
70dd cd7971    call    $7179
70e0 2a4472    ld      hl,($7244)
70e3 18aa      jr      $708f
70e5 62        ld      h,d
70e6 6b        ld      l,e
70e7 cd7971    call    $7179
70ea 36ff      ld      (hl),$ff
70ec 23        inc     hl
70ed 54        ld      d,h
70ee 5d        ld      e,l
70ef dde5      push    ix
70f1 e1        pop     hl
70f2 3600      ld      (hl),$00
70f4 23        inc     hl
70f5 7e        ld      a,(hl)
70f6 feff      cp      $ff
70f8 20f8      jr      nz,$70f2
70fa ed4b4272  ld      bc,($7242)
70fe 7c        ld      a,h
70ff b8        cp      b
7100 2002      jr      nz,$7104
7102 7d        ld      a,l
7103 b9        cp      c
7104 2805      jr      z,$710b
7106 2a4272    ld      hl,($7242)
7109 1884      jr      $708f
710b 62        ld      h,d
710c 6b        ld      l,e
710d 3600      ld      (hl),$00
710f b7        or      a
7110 1801      jr      $7113
7112 37        scf     
7113 fde1      pop     iy
7115 dde1      pop     ix
7117 d1        pop     de
7118 c1        pop     bc
7119 c9        ret     

711a e5        push    hl
711b 23        inc     hl
711c 7e        ld      a,(hl)
711d b7        or      a
711e 2803      jr      z,$7123
7120 b7        or      a
7121 1801      jr      $7124
7123 37        scf     
7124 e1        pop     hl
7125 c9        ret     

7126 dde5      push    ix
7128 fde5      push    iy
712a c5        push    bc
712b e5        push    hl
712c dd7e00    ld      a,(ix+$00)
712f dd23      inc     ix
7131 b8        cp      b
7132 2819      jr      z,$714d
7134 4f        ld      c,a
7135 fd7e00    ld      a,(iy+$00)
7138 fd23      inc     iy
713a b8        cp      b
713b 280a      jr      z,$7147
713d b9        cp      c
713e 3807      jr      c,$7147
7140 28ea      jr      z,$712c
7142 3e01      ld      a,$01
7144 b7        or      a
7145 180f      jr      $7156
7147 3e01      ld      a,$01
7149 b7        or      a
714a 37        scf     
714b 1809      jr      $7156
714d 4f        ld      c,a
714e fd7e00    ld      a,(iy+$00)
7151 fd23      inc     iy
7153 b8        cp      b
7154 20ec      jr      nz,$7142
7156 e1        pop     hl
7157 c1        pop     bc
7158 fde1      pop     iy
715a dde1      pop     ix
715c c9        ret     

715d dd7e00    ld      a,(ix+$00)
7160 b7        or      a
7161 2806      jr      z,$7169
7163 dd23      inc     ix
7165 feff      cp      $ff
7167 20f4      jr      nz,$715d
7169 c9        ret     

716a 7e        ld      a,(hl)
716b feff      cp      $ff
716d 2803      jr      z,$7172
716f 2b        dec     hl
7170 18f8      jr      $716a
7172 2b        dec     hl
7173 7e        ld      a,(hl)
7174 feff      cp      $ff
7176 20fa      jr      nz,$7172
7178 c9        ret     

7179 f5        push    af
717a dde5      push    ix
717c dd7e00    ld      a,(ix+$00)
717f dd23      inc     ix
7181 feff      cp      $ff
7183 2805      jr      z,$718a
7185 77        ld      (hl),a
7186 23        inc     hl
7187 0c        inc     c
7188 18f2      jr      $717c
718a dde1      pop     ix
718c f1        pop     af
718d c9        ret     

718e c5        push    bc
718f d5        push    de
7190 e5        push    hl
7191 dde5      push    ix
7193 c5        push    bc
7194 c5        push    bc
7195 dde5      push    ix
7197 e1        pop     hl
7198 01ff00    ld      bc,$00ff
719b 97        sub     a
719c edb1      cpir    
719e 2b        dec     hl
719f 22ff71    ld      ($71ff),hl
71a2 c1        pop     bc
71a3 04        inc     b
71a4 78        ld      a,b
71a5 cd5d8c    call    $8c5d
71a8 7c        ld      a,h
71a9 ba        cp      d
71aa 2002      jr      nz,$71ae
71ac 7d        ld      a,l
71ad bb        cp      e
71ae 3047      jr      nc,$71f7
71b0 220172    ld      ($7201),hl
71b3 06ff      ld      b,$ff
71b5 3e01      ld      a,$01
71b7 326072    ld      ($7260),a
71ba dd7e00    ld      a,(ix+$00)
71bd b7        or      a
71be 2811      jr      z,$71d1
71c0 cd2671    call    $7126
71c3 380c      jr      c,$71d1
71c5 cd5d71    call    $715d
71c8 3a6072    ld      a,($7260)
71cb 3c        inc     a
71cc 326072    ld      ($7260),a
71cf 18e9      jr      $71ba
71d1 2aff71    ld      hl,($71ff)
71d4 e5        push    hl
71d5 23        inc     hl
71d6 dde5      push    ix
71d8 c1        pop     bc
71d9 b7        or      a
71da ed42      sbc     hl,bc
71dc 44        ld      b,h
71dd 4d        ld      c,l
71de e1        pop     hl
71df ed5b0172  ld      de,($7201)
71e3 edb8      lddr    
71e5 c1        pop     bc
71e6 48        ld      c,b
71e7 0600      ld      b,$00
71e9 dde5      push    ix
71eb d1        pop     de
71ec fde5      push    iy
71ee e1        pop     hl
71ef edb0      ldir    
71f1 3eff      ld      a,$ff
71f3 12        ld      (de),a
71f4 b7        or      a
71f5 1802      jr      $71f9
71f7 c1        pop     bc
71f8 37        scf     
71f9 dde1      pop     ix
71fb e1        pop     hl
71fc d1        pop     de
71fd c1        pop     bc
71fe c9        ret     

71ff 00        nop     
7200 00        nop     
7201 00        nop     
7202 00        nop     
7203 c5        push    bc
7204 d5        push    de
7205 e5        push    hl
7206 dde5      push    ix
7208 cd1085    call    $8510
720b fe02      cp      $02
720d 282c      jr      z,$723b
720f 4f        ld      c,a
7210 5d        ld      e,l
7211 54        ld      d,h
7212 78        ld      a,b
7213 cd5d8c    call    $8c5d
7216 7e        ld      a,(hl)
7217 feff      cp      $ff
7219 280a      jr      z,$7225
721b 79        ld      a,c
721c b7        or      a
721d 281c      jr      z,$723b
721f 23        inc     hl
7220 e5        push    hl
7221 dde1      pop     ix
7223 18e3      jr      $7208
7225 23        inc     hl
7226 e5        push    hl
7227 010000    ld      bc,$0000
722a 3e00      ld      a,$00
722c edb1      cpir    
722e 78        ld      a,b
722f 2f        cpl     
7230 47        ld      b,a
7231 79        ld      a,c
7232 2f        cpl     
7233 4f        ld      c,a
7234 03        inc     bc
7235 e1        pop     hl
7236 edb0      ldir    
7238 b7        or      a
7239 1801      jr      $723c
723b 37        scf     
723c dde1      pop     ix
723e e1        pop     hl
723f d1        pop     de
7240 c1        pop     bc
7241 c9        ret     

7242 00        nop     
7243 00        nop     
7244 00        nop     
7245 00        nop     
7246 00        nop     
7247 00        nop     
7248 00        nop     
7249 00        nop     
724a 00        nop     
724b 00        nop     
724c 00        nop     
724d 00        nop     
724e 00        nop     
724f 00        nop     
7250 00        nop     
7251 00        nop     
7252 00        nop     
7253 00        nop     
7254 00        nop     
7255 00        nop     
7256 00        nop     
7257 00        nop     
7258 00        nop     
7259 00        nop     
725a 00        nop     
725b 00        nop     
725c 00        nop     
725d 00        nop     
725e 00        nop     
725f 00        nop     
7260 00        nop     
7261 cd8b88    call    $888b
7264 97        sub     a
7265 329d73    ld      ($739d),a
7268 216873    ld      hl,$7368
726b cd7e72    call    $727e
726e c9        ret     

726f cd8b88    call    $888b
7272 3e01      ld      a,$01
7274 329d73    ld      ($739d),a
7277 217a73    ld      hl,$737a
727a cd7e72    call    $727e
727d c9        ret     

727e cd2c03    call    $032c
7281 cd7689    call    $8976
7284 04        inc     b
7285 78        ld      a,b
7286 329b73    ld      ($739b),a
7289 3a9c73    ld      a,($739c)
728c f630      or      $30
728e cd7844    call    $4478		write char in A
7291 cdbf85    call    $85bf
7294 cd917d    call    $7d91
7297 202d      jr      nz,$72c6
7299 3a9c73    ld      a,($739c)
729c b7        or      a
729d 28f5      jr      z,$7294
729f d609      sub     $09
72a1 ed44      neg     
72a3 c48544    call    nz,$4485
72a6 cd917d    call    $7d91
72a9 201b      jr      nz,$72c6
72ab 3a9d73    ld      a,($739d)
72ae b7        or      a
72af 280b      jr      z,$72bc
72b1 cde007    call    $07e0
72b4 fe01      cp      $01
72b6 20dc      jr      nz,$7294
72b8 97        sub     a
72b9 c34273    jp      $7342
72bc cdba07    call    $07ba
72bf fe01      cp      $01
72c1 20d1      jr      nz,$7294
72c3 97        sub     a
72c4 187c      jr      $7342
72c6 215473    ld      hl,$7354
72c9 dd21acca  ld      ix,$caac
72cd cda17e    call    $7ea1
72d0 387e      jr      c,$7350
72d2 f5        push    af
72d3 cd7d7a    call    $7a7d
72d6 cda885    call    $85a8
72d9 f1        pop     af
72da cda08c    call    $8ca0
72dd 3863      jr      c,$7342
72df 78        ld      a,b
72e0 80        add     a,b
72e1 010000    ld      bc,$0000
72e4 4f        ld      c,a
72e5 dd216273  ld      ix,$7362
72e9 dd09      add     ix,bc
72eb dd6e00    ld      l,(ix+$00)
72ee dd6601    ld      h,(ix+$01)
72f1 e9        jp      (hl)
72f2 cda885    call    $85a8
72f5 3a9b73    ld      a,($739b)
72f8 47        ld      b,a
72f9 cd8b88    call    $888b
72fc 218d73    ld      hl,$738d
72ff cd7689    call    $8976
7302 78        ld      a,b
7303 329b73    ld      ($739b),a
7306 3e04      ld      a,$04
7308 cd8544    call    $4485
730b 3a9b73    ld      a,($739b)
730e 47        ld      b,a
730f cd8b88    call    $888b
7312 3a9d73    ld      a,($739d)
7315 b7        or      a
7316 2806      jr      z,$731e
7318 217a73    ld      hl,$737a
731b c38172    jp      $7281
731e 216873    ld      hl,$7368
7321 c38172    jp      $7281
7324 3e01      ld      a,$01
7326 329d73    ld      ($739d),a
7329 217a73    ld      hl,$737a
732c 1807      jr      $7335
732e 97        sub     a
732f 329d73    ld      ($739d),a
7332 216873    ld      hl,$7368
7335 cda885    call    $85a8
7338 3a9b73    ld      a,($739b)
733b 47        ld      b,a
733c cd8b88    call    $888b
733f c38172    jp      $7281
7342 e60f      and     $0f
7344 329c73    ld      ($739c),a
7347 cda885    call    $85a8
734a cdf285    call    $85f2
734d c38972    jp      $7289
7350 cd1a03    call    $031a
7353 c9        ret     

7354 df        rst     $18
7355 0b        dec     bc
7356 0a        ld      a,(bc)
7357 313233    ld      sp,$3332
735a 34        inc     (hl)
735b 35        dec     (hl)
735c 3637      ld      (hl),$37
735e 3839      jr      c,$7399
7360 3000      jr      nc,$7362
7362 f27224    jp      p,$2472
7365 73        ld      (hl),e
7366 2e73      ld      l,$73
7368 46        ld      b,(hl)
7369 4f        ld      c,a
736a 52        ld      d,d
736b 57        ld      d,a
736c 41        ld      b,c
736d 52        ld      d,d
736e 44        ld      b,h
736f 2061      jr      nz,$73d2
7371 74        ld      (hl),h
7372 2073      jr      nz,$73e7
7374 70        ld      (hl),b
7375 65        ld      h,l
7376 65        ld      h,l
7377 64        ld      h,h
7378 2024      jr      nz,$739e
737a 42        ld      b,d
737b 41        ld      b,c
737c 43        ld      b,e
737d 4b        ld      c,e
737e 57        ld      d,a
737f 41        ld      b,c
7380 52        ld      d,d
7381 44        ld      b,h
7382 2061      jr      nz,$73e5
7384 74        ld      (hl),h
7385 2073      jr      nz,$73fa
7387 70        ld      (hl),b
7388 65        ld      h,l
7389 65        ld      h,l
738a 64        ld      h,h
738b 2024      jr      nz,$73b1
738d 2e2e      ld      l,$2e
738f 2e50      ld      l,$50
7391 41        ld      b,c
7392 55        ld      d,l
7393 53        ld      d,e
7394 49        ld      c,c
7395 4e        ld      c,(hl)
7396 47        ld      b,a
7397 2e2e      ld      l,$2e
7399 2e24      ld      l,$24
739b 00        nop     
739c 05        dec     b
739d 00        nop     
739e f5        push    af
739f d5        push    de
73a0 e5        push    hl
73a1 fef0      cp      $f0
73a3 282b      jr      z,$73d0
73a5 5f        ld      e,a
73a6 3a0b76    ld      a,($760b)
73a9 57        ld      d,a
73aa 7b        ld      a,e
73ab 210c76    ld      hl,$760c
73ae cdc27e    call    $7ec2
73b1 2809      jr      z,$73bc
73b3 ba        cp      d
73b4 281a      jr      z,$73d0
73b6 7b        ld      a,e
73b7 cd9474    call    $7494
73ba 1811      jr      $73cd
73bc 7b        ld      a,e
73bd cdb28c    call    $8cb2
73c0 3803      jr      c,$73c5
73c2 97        sub     a
73c3 18f2      jr      $73b7
73c5 7a        ld      a,d
73c6 cdc27e    call    $7ec2
73c9 c49474    call    nz,$7494
73cc 7b        ld      a,e
73cd 320b76    ld      ($760b),a
73d0 e1        pop     hl
73d1 d1        pop     de
73d2 f1        pop     af
73d3 c9        ret     

73d4 f5        push    af
73d5 e5        push    hl
73d6 3a0b76    ld      a,($760b)
73d9 b7        or      a
73da 2814      jr      z,$73f0
73dc 2ab894    ld      hl,($94b8)
73df 7e        ld      a,(hl)
73e0 23        inc     hl
73e1 fe60      cp      $60
73e3 2808      jr      z,$73ed
73e5 fead      cp      $ad
73e7 2804      jr      z,$73ed
73e9 cb7f      bit     7,a
73eb 20f2      jr      nz,$73df
73ed cd3174    call    $7431
73f0 e1        pop     hl
73f1 f1        pop     af
73f2 c9        ret     

73f3 f5        push    af
73f4 fde5      push    iy
73f6 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
73f9 fd212c74  ld      iy,$742c
73fd cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
7400 cd3683    call    $8336
7403 323074    ld      ($7430),a
7406 cdc78e    call    $8ec7
7409 fe01      cp      $01
740b 280f      jr      z,$741c
740d cd3174    call    $7431
7410 fe0d      cp      $0d
7412 2808      jr      z,$741c
7414 fe0a      cp      $0a
7416 2804      jr      z,$741c
7418 fe0c      cp      $0c
741a 20ea      jr      nz,$7406
741c cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
741f cd1e41    call    $411e
7422 3a3074    ld      a,($7430)
7425 cd1c83    call    $831c
7428 fde1      pop     iy
742a f1        pop     af
742b c9        ret     

742c 00        nop     
742d 00        nop     
742e 00        nop     
742f 00        nop     
7430 00        nop     
7431 f5        push    af
7432 c5        push    bc
7433 d5        push    de
7434 e5        push    hl
7435 dde5      push    ix
7437 4f        ld      c,a
7438 2a2178    ld      hl,($7821)
743b dd211f78  ld      ix,$781f
743f 7c        ld      a,h
7440 ddbe01    cp      (ix+$01)
7443 2004      jr      nz,$7449
7445 7d        ld      a,l
7446 ddbe00    cp      (ix+$00)
7449 380f      jr      c,$745a
744b 79        ld      a,c
744c 77        ld      (hl),a
744d 211f76    ld      hl,$761f
7450 111e76    ld      de,$761e
7453 010002    ld      bc,$0200
7456 edb0      ldir    
7458 1806      jr      $7460
745a 79        ld      a,c
745b 77        ld      (hl),a
745c 23        inc     hl
745d 222178    ld      ($7821),hl
7460 dde1      pop     ix
7462 e1        pop     hl
7463 d1        pop     de
7464 c1        pop     bc
7465 f1        pop     af
7466 c9        ret     

7467 3a0b76    ld      a,($760b)
746a b7        or      a
746b 2826      jr      z,$7493
746d 2a2178    ld      hl,($7821)
7470 111e76    ld      de,$761e
7473 b7        or      a
7474 ed52      sbc     hl,de
7476 281b      jr      z,$7493
7478 210c76    ld      hl,$760c
747b 3a0b76    ld      a,($760b)
747e cdc27e    call    $7ec2
7481 211276    ld      hl,$7612
7484 78        ld      a,b
7485 80        add     a,b
7486 cd5d8c    call    $8c5d
7489 e5        push    hl
748a dde1      pop     ix
748c dd6e00    ld      l,(ix+$00)
748f dd6601    ld      h,(ix+$01)
7492 e9        jp      (hl)
7493 c9        ret     

7494 211e76    ld      hl,$761e
7497 222178    ld      ($7821),hl
749a c9        ret     

749b cd8291    call    $9182
749e fd210776  ld      iy,$7607
74a2 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
74a5 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
74a8 cd5091    call    $9150
74ab cdfa11    call    $11fa
74ae ed5b2178  ld      de,($7821)
74b2 1b        dec     de
74b3 211d76    ld      hl,$761d
74b6 b7        or      a
74b7 ed52      sbc     hl,de
74b9 3023      jr      nc,$74de
74bb 1a        ld      a,(de)
74bc fe0d      cp      $0d
74be 2808      jr      z,$74c8
74c0 fe0a      cp      $0a
74c2 2804      jr      z,$74c8
74c4 fe0c      cp      $0c
74c6 20ea      jr      nz,$74b2
74c8 1b        dec     de
74c9 211d76    ld      hl,$761d
74cc b7        or      a
74cd ed52      sbc     hl,de
74cf 300d      jr      nc,$74de
74d1 1a        ld      a,(de)
74d2 fe0d      cp      $0d
74d4 2808      jr      z,$74de
74d6 fe0a      cp      $0a
74d8 2804      jr      z,$74de
74da fe0c      cp      $0c
74dc 20ea      jr      nz,$74c8
74de 13        inc     de
74df 42        ld      b,d
74e0 4b        ld      c,e
74e1 2a2178    ld      hl,($7821)
74e4 ed532178  ld      ($7821),de
74e8 b7        or      a
74e9 ed42      sbc     hl,bc
74eb 44        ld      b,h
74ec 4d        ld      c,l
74ed cdca91    call    $91ca
74f0 cd0141    call    $4101
74f3 cda440    call    $40a4
74f6 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
74f9 cd1e41    call    $411e
74fc cd5091    call    $9150
74ff cdfa11    call    $11fa
7502 cd203f    call    $3f20
7505 cd5091    call    $9150
7508 cd7d7a    call    $7a7d
750b 97        sub     a
750c b7        or      a
750d c9        ret     

750e 2600      ld      h,$00
7510 010000    ld      bc,$0000
7513 ed5b2178  ld      de,($7821)
7517 cd5275    call    $7552
751a 3010      jr      nc,$752c
751c 28f9      jr      z,$7517
751e cd5275    call    $7552
7521 3009      jr      nc,$752c
7523 20f9      jr      nz,$751e
7525 cd5275    call    $7552
7528 3002      jr      nc,$752c
752a 28f9      jr      z,$7525
752c 13        inc     de
752d 0b        dec     bc
752e ed532178  ld      ($7821),de
7532 d9        exx     
7533 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
7536 d5        push    de
7537 e5        push    hl
7538 d9        exx     
7539 cdca91    call    $91ca
753c e1        pop     hl
753d d1        pop     de
753e cd1e41    call    $411e
7541 cb44      bit     0,h
7543 2008      jr      nz,$754d
7545 cd4202    call    $0242
7548 3e01      ld      a,$01
754a b7        or      a
754b 1804      jr      $7551
754d cd7d7a    call    $7a7d
7550 af        xor     a
7551 c9        ret     

7552 03        inc     bc
7553 1b        dec     de
7554 211d76    ld      hl,$761d
7557 b7        or      a
7558 ed52      sbc     hl,de
755a 3019      jr      nc,$7575
755c 1a        ld      a,(de)
755d cd600b    call    $0b60
7560 2803      jr      z,$7565
7562 37        scf     
7563 1810      jr      $7575
7565 fe0d      cp      $0d
7567 2808      jr      z,$7571
7569 fe0a      cp      $0a
756b 2804      jr      z,$7571
756d fe0c      cp      $0c
756f 2002      jr      nz,$7573
7571 cbc4      set     0,h
7573 af        xor     a
7574 37        scf     
7575 c9        ret     

7576 ed5b2178  ld      de,($7821)
757a 1b        dec     de
757b ed532178  ld      ($7821),de
757f 010100    ld      bc,$0001
7582 cdca91    call    $91ca
7585 cd208f    call    $8f20
7588 cd6482    call    $8264
758b cd4202    call    $0242
758e 3e01      ld      a,$01
7590 b7        or      a
7591 c9        ret     

7592 ed5b2178  ld      de,($7821)
7596 1b        dec     de
7597 ed532178  ld      ($7821),de
759b 1a        ld      a,(de)
759c 010100    ld      bc,$0001
759f cdca91    call    $91ca
75a2 cd208f    call    $8f20
75a5 cdc78e    call    $8ec7
75a8 cdc47c    call    $7cc4
75ab cd6482    call    $8264
75ae 3e01      ld      a,$01
75b0 b7        or      a
75b1 c9        ret     

75b2 fd210776  ld      iy,$7607
75b6 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
75b9 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
75bc 011e76    ld      bc,$761e
75bf 50        ld      d,b
75c0 59        ld      e,c
75c1 2a2178    ld      hl,($7821)
75c4 ed432178  ld      ($7821),bc
75c8 2b        dec     hl
75c9 b7        or      a
75ca ed42      sbc     hl,bc
75cc 44        ld      b,h
75cd 4d        ld      c,l
75ce cdca91    call    $91ca
75d1 cda440    call    $40a4
75d4 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
75d7 cd1e41    call    $411e
75da cd7d7a    call    $7a7d
75dd 97        sub     a
75de b7        or      a
75df c9        ret     

75e0 cd3683    call    $8336
75e3 4f        ld      c,a
75e4 cd208f    call    $8f20
75e7 cd5583    call    $8355
75ea dc7d7a    call    c,$7a7d
75ed cd6482    call    $8264
75f0 2a2178    ld      hl,($7821)
75f3 2b        dec     hl
75f4 222178    ld      ($7821),hl
75f7 7e        ld      a,(hl)
75f8 cdae92    call    $92ae
75fb cdc47c    call    $7cc4
75fe cd208f    call    $8f20
7601 cd6482    call    $8264
7604 97        sub     a
7605 b7        or      a
7606 c9        ret     

7607 00        nop     
7608 00        nop     
7609 00        nop     
760a 00        nop     
760b 00        nop     
760c e0        ret     po

760d e27fe8    jp      po,$e87f
7610 f1        pop     af
7611 00        nop     
7612 9b        sbc     a,e
7613 74        ld      (hl),h
7614 76        halt    
7615 75        ld      (hl),l
7616 92        sub     d
7617 75        ld      (hl),l
7618 b2        or      d
7619 75        ld      (hl),l
761a 0e75      ld      c,$75
761c e0        ret     po

761d 75        ld      (hl),l
761e 00        nop     
761f 00        nop     
7620 00        nop     
7621 00        nop     
7622 00        nop     
7623 00        nop     
7624 00        nop     
7625 00        nop     
7626 00        nop     
7627 00        nop     
7628 00        nop     
7629 00        nop     
762a 00        nop     
762b 00        nop     
762c 00        nop     
762d 00        nop     
762e 00        nop     
762f 00        nop     
7630 00        nop     
7631 00        nop     
7632 00        nop     
7633 00        nop     
7634 00        nop     
7635 00        nop     
7636 00        nop     
7637 00        nop     
7638 00        nop     
7639 00        nop     
763a 00        nop     
763b 00        nop     
763c 00        nop     
763d 00        nop     
763e 00        nop     
763f 00        nop     
7640 00        nop     
7641 00        nop     
7642 00        nop     
7643 00        nop     
7644 00        nop     
7645 00        nop     
7646 00        nop     
7647 00        nop     
7648 00        nop     
7649 00        nop     
764a 00        nop     
764b 00        nop     
764c 00        nop     
764d 00        nop     
764e 00        nop     
764f 00        nop     
7650 00        nop     
7651 00        nop     
7652 00        nop     
7653 00        nop     
7654 00        nop     
7655 00        nop     
7656 00        nop     
7657 00        nop     
7658 00        nop     
7659 00        nop     
765a 00        nop     
765b 00        nop     
765c 00        nop     
765d 00        nop     
765e 00        nop     
765f 00        nop     
7660 00        nop     
7661 00        nop     
7662 00        nop     
7663 00        nop     
7664 00        nop     
7665 00        nop     
7666 00        nop     
7667 00        nop     
7668 00        nop     
7669 00        nop     
766a 00        nop     
766b 00        nop     
766c 00        nop     
766d 00        nop     
766e 00        nop     
766f 00        nop     
7670 00        nop     
7671 00        nop     
7672 00        nop     
7673 00        nop     
7674 00        nop     
7675 00        nop     
7676 00        nop     
7677 00        nop     
7678 00        nop     
7679 00        nop     
767a 00        nop     
767b 00        nop     
767c 00        nop     
767d 00        nop     
767e 00        nop     
767f 00        nop     
7680 00        nop     
7681 00        nop     
7682 00        nop     
7683 00        nop     
7684 00        nop     
7685 00        nop     
7686 00        nop     
7687 00        nop     
7688 00        nop     
7689 00        nop     
768a 00        nop     
768b 00        nop     
768c 00        nop     
768d 00        nop     
768e 00        nop     
768f 00        nop     
7690 00        nop     
7691 00        nop     
7692 00        nop     
7693 00        nop     
7694 00        nop     
7695 00        nop     
7696 00        nop     
7697 00        nop     
7698 00        nop     
7699 00        nop     
769a 00        nop     
769b 00        nop     
769c 00        nop     
769d 00        nop     
769e 00        nop     
769f 00        nop     
76a0 00        nop     
76a1 00        nop     
76a2 00        nop     
76a3 00        nop     
76a4 00        nop     
76a5 00        nop     
76a6 00        nop     
76a7 00        nop     
76a8 00        nop     
76a9 00        nop     
76aa 00        nop     
76ab 00        nop     
76ac 00        nop     
76ad 00        nop     
76ae 00        nop     
76af 00        nop     
76b0 00        nop     
76b1 00        nop     
76b2 00        nop     
76b3 00        nop     
76b4 00        nop     
76b5 00        nop     
76b6 00        nop     
76b7 00        nop     
76b8 00        nop     
76b9 00        nop     
76ba 00        nop     
76bb 00        nop     
76bc 00        nop     
76bd 00        nop     
76be 00        nop     
76bf 00        nop     
76c0 00        nop     
76c1 00        nop     
76c2 00        nop     
76c3 00        nop     
76c4 00        nop     
76c5 00        nop     
76c6 00        nop     
76c7 00        nop     
76c8 00        nop     
76c9 00        nop     
76ca 00        nop     
76cb 00        nop     
76cc 00        nop     
76cd 00        nop     
76ce 00        nop     
76cf 00        nop     
76d0 00        nop     
76d1 00        nop     
76d2 00        nop     
76d3 00        nop     
76d4 00        nop     
76d5 00        nop     
76d6 00        nop     
76d7 00        nop     
76d8 00        nop     
76d9 00        nop     
76da 00        nop     
76db 00        nop     
76dc 00        nop     
76dd 00        nop     
76de 00        nop     
76df 00        nop     
76e0 00        nop     
76e1 00        nop     
76e2 00        nop     
76e3 00        nop     
76e4 00        nop     
76e5 00        nop     
76e6 00        nop     
76e7 00        nop     
76e8 00        nop     
76e9 00        nop     
76ea 00        nop     
76eb 00        nop     
76ec 00        nop     
76ed 00        nop     
76ee 00        nop     
76ef 00        nop     
76f0 00        nop     
76f1 00        nop     
76f2 00        nop     
76f3 00        nop     
76f4 00        nop     
76f5 00        nop     
76f6 00        nop     
76f7 00        nop     
76f8 00        nop     
76f9 00        nop     
76fa 00        nop     
76fb 00        nop     
76fc 00        nop     
76fd 00        nop     
76fe 00        nop     
76ff 00        nop     
7700 00        nop     
7701 00        nop     
7702 00        nop     
7703 00        nop     
7704 00        nop     
7705 00        nop     
7706 00        nop     
7707 00        nop     
7708 00        nop     
7709 00        nop     
770a 00        nop     
770b 00        nop     
770c 00        nop     
770d 00        nop     
770e 00        nop     
770f 00        nop     
7710 00        nop     
7711 00        nop     
7712 00        nop     
7713 00        nop     
7714 00        nop     
7715 00        nop     
7716 00        nop     
7717 00        nop     
7718 00        nop     
7719 00        nop     
771a 00        nop     
771b 00        nop     
771c 00        nop     
771d 00        nop     
771e 00        nop     
771f 00        nop     
7720 00        nop     
7721 00        nop     
7722 00        nop     
7723 00        nop     
7724 00        nop     
7725 00        nop     
7726 00        nop     
7727 00        nop     
7728 00        nop     
7729 00        nop     
772a 00        nop     
772b 00        nop     
772c 00        nop     
772d 00        nop     
772e 00        nop     
772f 00        nop     
7730 00        nop     
7731 00        nop     
7732 00        nop     
7733 00        nop     
7734 00        nop     
7735 00        nop     
7736 00        nop     
7737 00        nop     
7738 00        nop     
7739 00        nop     
773a 00        nop     
773b 00        nop     
773c 00        nop     
773d 00        nop     
773e 00        nop     
773f 00        nop     
7740 00        nop     
7741 00        nop     
7742 00        nop     
7743 00        nop     
7744 00        nop     
7745 00        nop     
7746 00        nop     
7747 00        nop     
7748 00        nop     
7749 00        nop     
774a 00        nop     
774b 00        nop     
774c 00        nop     
774d 00        nop     
774e 00        nop     
774f 00        nop     
7750 00        nop     
7751 00        nop     
7752 00        nop     
7753 00        nop     
7754 00        nop     
7755 00        nop     
7756 00        nop     
7757 00        nop     
7758 00        nop     
7759 00        nop     
775a 00        nop     
775b 00        nop     
775c 00        nop     
775d 00        nop     
775e 00        nop     
775f 00        nop     
7760 00        nop     
7761 00        nop     
7762 00        nop     
7763 00        nop     
7764 00        nop     
7765 00        nop     
7766 00        nop     
7767 00        nop     
7768 00        nop     
7769 00        nop     
776a 00        nop     
776b 00        nop     
776c 00        nop     
776d 00        nop     
776e 00        nop     
776f 00        nop     
7770 00        nop     
7771 00        nop     
7772 00        nop     
7773 00        nop     
7774 00        nop     
7775 00        nop     
7776 00        nop     
7777 00        nop     
7778 00        nop     
7779 00        nop     
777a 00        nop     
777b 00        nop     
777c 00        nop     
777d 00        nop     
777e 00        nop     
777f 00        nop     
7780 00        nop     
7781 00        nop     
7782 00        nop     
7783 00        nop     
7784 00        nop     
7785 00        nop     
7786 00        nop     
7787 00        nop     
7788 00        nop     
7789 00        nop     
778a 00        nop     
778b 00        nop     
778c 00        nop     
778d 00        nop     
778e 00        nop     
778f 00        nop     
7790 00        nop     
7791 00        nop     
7792 00        nop     
7793 00        nop     
7794 00        nop     
7795 00        nop     
7796 00        nop     
7797 00        nop     
7798 00        nop     
7799 00        nop     
779a 00        nop     
779b 00        nop     
779c 00        nop     
779d 00        nop     
779e 00        nop     
779f 00        nop     
77a0 00        nop     
77a1 00        nop     
77a2 00        nop     
77a3 00        nop     
77a4 00        nop     
77a5 00        nop     
77a6 00        nop     
77a7 00        nop     
77a8 00        nop     
77a9 00        nop     
77aa 00        nop     
77ab 00        nop     
77ac 00        nop     
77ad 00        nop     
77ae 00        nop     
77af 00        nop     
77b0 00        nop     
77b1 00        nop     
77b2 00        nop     
77b3 00        nop     
77b4 00        nop     
77b5 00        nop     
77b6 00        nop     
77b7 00        nop     
77b8 00        nop     
77b9 00        nop     
77ba 00        nop     
77bb 00        nop     
77bc 00        nop     
77bd 00        nop     
77be 00        nop     
77bf 00        nop     
77c0 00        nop     
77c1 00        nop     
77c2 00        nop     
77c3 00        nop     
77c4 00        nop     
77c5 00        nop     
77c6 00        nop     
77c7 00        nop     
77c8 00        nop     
77c9 00        nop     
77ca 00        nop     
77cb 00        nop     
77cc 00        nop     
77cd 00        nop     
77ce 00        nop     
77cf 00        nop     
77d0 00        nop     
77d1 00        nop     
77d2 00        nop     
77d3 00        nop     
77d4 00        nop     
77d5 00        nop     
77d6 00        nop     
77d7 00        nop     
77d8 00        nop     
77d9 00        nop     
77da 00        nop     
77db 00        nop     
77dc 00        nop     
77dd 00        nop     
77de 00        nop     
77df 00        nop     
77e0 00        nop     
77e1 00        nop     
77e2 00        nop     
77e3 00        nop     
77e4 00        nop     
77e5 00        nop     
77e6 00        nop     
77e7 00        nop     
77e8 00        nop     
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
781f 1e78      ld      e,$78
7821 1e76      ld      e,$76
7823 2e2e      ld      l,$2e
7825 2e46      ld      l,$46
7827 6f        ld      l,a
7828 72        ld      (hl),d
7829 6d        ld      l,l
782a 69        ld      l,c
782b 6e        ld      l,(hl)
782c 67        ld      h,a
782d 2049      jr      nz,$7878
782f 6e        ld      l,(hl)
7830 64        ld      h,h
7831 65        ld      h,l
7832 78        ld      a,b
7833 2e2e      ld      l,$2e
7835 2e0d      ld      l,$0d
7837 0a        ld      a,(bc)
7838 24        inc     h
7839 cd9f4a    call    $4a9f
783c ed43777a  ld      ($7a77),bc
7840 21e378    ld      hl,$78e3
7843 cd7689    call    $8976
7846 3e04      ld      a,$04
7848 cdd47d    call    $7dd4
784b dadf78    jp      c,$78df
784e 227b7a    ld      ($7a7b),hl
7851 210000    ld      hl,$0000
7854 22797a    ld      ($7a79),hl
7857 dd212378  ld      ix,$7823
785b cd9d43    call    $439d
785e fd216f7a  ld      iy,$7a6f
7862 cd9d42    call    $429d
7865 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
7868 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
786b cd0e7d    call    $7d0e
786e 386f      jr      c,$78df
7870 fd211e76  ld      iy,$761e
7874 cd934a    call    $4a93
7877 3d        dec     a
7878 280a      jr      z,$7884
787a 47        ld      b,a
787b 3e20      ld      a,$20
787d fd7700    ld      (iy+$00),a
7880 fd23      inc     iy
7882 10f9      djnz    $787d
7884 cdff78    call    $78ff
7887 fe01      cp      $01
7889 2815      jr      z,$78a0
788b fd216f7a  ld      iy,$7a6f
788f cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
7892 cd1e41    call    $411e
7895 fd211e76  ld      iy,$761e
7899 cd6f79    call    $796f
789c 3841      jr      c,$78df
789e 18cb      jr      $786b
78a0 fd216f7a  ld      iy,$7a6f
78a4 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
78a7 cd1e41    call    $411e
78aa 3e21      ld      a,$21
78ac 57        ld      d,a
78ad cdc78e    call    $8ec7
78b0 fe01      cp      $01
78b2 282b      jr      z,$78df
78b4 fe0d      cp      $0d
78b6 201a      jr      nz,$78d2
78b8 cdc442    call    $42c4
78bb cd5091    call    $9150
78be cd7c8c    call    $8c7c
78c1 ba        cp      d
78c2 280e      jr      z,$78d2
78c4 57        ld      d,a
78c5 3e01      ld      a,$01
78c7 cda440    call    $40a4
78ca cddd3f    call    $3fdd
78cd 3810      jr      c,$78df
78cf cdc442    call    $42c4
78d2 b7        or      a
78d3 20d8      jr      nz,$78ad
78d5 cd208f    call    $8f20
78d8 3e2c      ld      a,$2c
78da cdae92    call    $92ae
78dd 18ce      jr      $78ad
78df cdd482    call    $82d4
78e2 c9        ret     

78e3 2d        dec     l
78e4 77        ld      (hl),a
78e5 69        ld      l,c
78e6 74        ld      (hl),h
78e7 68        ld      l,b
78e8 2066      jr      nz,$7950
78ea 69        ld      l,c
78eb 72        ld      (hl),d
78ec 73        ld      (hl),e
78ed 74        ld      (hl),h
78ee 2070      jr      nz,$7960
78f0 61        ld      h,c
78f1 67        ld      h,a
78f2 65        ld      h,l
78f3 206e      jr      nz,$7963
78f5 75        ld      (hl),l
78f6 6d        ld      l,l
78f7 62        ld      h,d
78f8 65        ld      h,l
78f9 72        ld      (hl),d
78fa 206f      jr      nz,$796b
78fc 66        ld      h,(hl)
78fd 2024      jr      nz,$7923
78ff 0632      ld      b,$32
7901 cd212e    call    $2e21
7904 cd317a    call    $7a31
7907 fe01      cp      $01
7909 2863      jr      z,$796e
790b fe87      cp      $87
790d 20f2      jr      nz,$7901
790f cd212e    call    $2e21
7912 fe87      cp      $87
7914 28eb      jr      z,$7901
7916 cd317a    call    $7a31
7919 fe20      cp      $20
791b 28f2      jr      z,$790f
791d 38f0      jr      c,$790f
791f 1803      jr      $7924
7921 cd212e    call    $2e21
7924 fe86      cp      $86
7926 28f9      jr      z,$7921
7928 fe81      cp      $81
792a 28f5      jr      z,$7921
792c fe82      cp      $82
792e 28f1      jr      z,$7921
7930 fe83      cp      $83
7932 28ed      jr      z,$7921
7934 fe8b      cp      $8b
7936 28e9      jr      z,$7921
7938 cd317a    call    $7a31
793b fe87      cp      $87
793d 2809      jr      z,$7948
793f fd7700    ld      (iy+$00),a
7942 fd23      inc     iy
7944 10db      djnz    $7921
7946 18b7      jr      $78ff
7948 97        sub     a
7949 fd7700    ld      (iy+$00),a
794c fd23      inc     iy
794e ed4b7b7a  ld      bc,($7a7b)
7952 fde5      push    iy
7954 e1        pop     hl
7955 cd678b    call    $8b67
7958 3e0d      ld      a,$0d
795a 77        ld      (hl),a
795b 23        inc     hl
795c 3e24      ld      a,$24
795e 77        ld      (hl),a
795f 111e76    ld      de,$761e
7962 0e09      ld      c,$09
7964 cd0500    call    $0005
7967 1e0a      ld      e,$0a
7969 0e02      ld      c,$02
796b cd0500    call    $0005
796e c9        ret     

796f dde5      push    ix
7971 fde5      push    iy
7973 dde1      pop     ix
7975 fd2ab894  ld      iy,($94b8)
7979 97        sub     a
797a 47        ld      b,a
797b cdf979    call    $79f9
797e 3009      jr      nc,$7989
7980 cde440    call    $40e4
7983 fe01      cp      $01
7985 2854      jr      z,$79db
7987 18ec      jr      $7975
7989 2050      jr      nz,$79db
798b cdc440    call    $40c4
798e dd7e00    ld      a,(ix+$00)
7991 b7        or      a
7992 2804      jr      z,$7998
7994 dd23      inc     ix
7996 18f6      jr      $798e
7998 dd7e00    ld      a,(ix+$00)
799b cda08c    call    $8ca0
799e 3804      jr      c,$79a4
79a0 dd23      inc     ix
79a2 18f4      jr      $7998
79a4 dd2b      dec     ix
79a6 dde5      push    ix
79a8 d1        pop     de
79a9 3e2c      ld      a,$2c
79ab dd7700    ld      (ix+$00),a
79ae dd7e00    ld      a,(ix+$00)
79b1 fe0d      cp      $0d
79b3 2804      jr      z,$79b9
79b5 dd23      inc     ix
79b7 18f5      jr      $79ae
79b9 dde5      push    ix
79bb e1        pop     hl
79bc b7        or      a
79bd ed52      sbc     hl,de
79bf 44        ld      b,h
79c0 4d        ld      c,l
79c1 fd2ab894  ld      iy,($94b8)
79c5 fd2b      dec     iy
79c7 dd2b      dec     ix
79c9 fd7e00    ld      a,(iy+$00)
79cc cda08c    call    $8ca0
79cf 3025      jr      nc,$79f6
79d1 ddbe00    cp      (ix+$00)
79d4 28ef      jr      z,$79c5
79d6 cdca91    call    $91ca
79d9 181b      jr      $79f6
79db dde5      push    ix
79dd d1        pop     de
79de dd7e00    ld      a,(ix+$00)
79e1 fe0d      cp      $0d
79e3 2804      jr      z,$79e9
79e5 dd23      inc     ix
79e7 18f5      jr      $79de
79e9 dd23      inc     ix
79eb dde5      push    ix
79ed e1        pop     hl
79ee b7        or      a
79ef ed52      sbc     hl,de
79f1 44        ld      b,h
79f2 4d        ld      c,l
79f3 cdca91    call    $91ca
79f6 dde1      pop     ix
79f8 c9        ret     

79f9 dde5      push    ix
79fb fde5      push    iy
79fd c5        push    bc
79fe e5        push    hl
79ff dd7e00    ld      a,(ix+$00)
7a02 dd23      inc     ix
7a04 b8        cp      b
7a05 281a      jr      z,$7a21
7a07 cd7c8c    call    $8c7c
7a0a 4f        ld      c,a
7a0b fd7e00    ld      a,(iy+$00)
7a0e fd23      inc     iy
7a10 b8        cp      b
7a11 280b      jr      z,$7a1e
7a13 cd7c8c    call    $8c7c
7a16 b9        cp      c
7a17 3805      jr      c,$7a1e
7a19 28e4      jr      z,$79ff
7a1b b7        or      a
7a1c 180c      jr      $7a2a
7a1e 37        scf     
7a1f 1809      jr      $7a2a
7a21 4f        ld      c,a
7a22 fd7e00    ld      a,(iy+$00)
7a25 fd23      inc     iy
7a27 b8        cp      b
7a28 20f1      jr      nz,$7a1b
7a2a e1        pop     hl
7a2b c1        pop     bc
7a2c fde1      pop     iy
7a2e dde1      pop     ix
7a30 c9        ret     

7a31 f5        push    af
7a32 c5        push    bc
7a33 dde5      push    ix
7a35 fe0c      cp      $0c
7a37 2821      jr      z,$7a5a
7a39 fe0d      cp      $0d
7a3b 2804      jr      z,$7a41
7a3d fe0a      cp      $0a
7a3f 2029      jr      nz,$7a6a
7a41 ed4b797a  ld      bc,($7a79)
7a45 03        inc     bc
7a46 ed43797a  ld      ($7a79),bc
7a4a dd21777a  ld      ix,$7a77
7a4e 78        ld      a,b
7a4f ddbe01    cp      (ix+$01)
7a52 2004      jr      nz,$7a58
7a54 79        ld      a,c
7a55 ddbe00    cp      (ix+$00)
7a58 3810      jr      c,$7a6a
7a5a 010000    ld      bc,$0000
7a5d ed43797a  ld      ($7a79),bc
7a61 ed4b7b7a  ld      bc,($7a7b)
7a65 03        inc     bc
7a66 ed437b7a  ld      ($7a7b),bc
7a6a dde1      pop     ix
7a6c c1        pop     bc
7a6d f1        pop     af
7a6e c9        ret     

7a6f 00        nop     
7a70 00        nop     
7a71 00        nop     
7a72 00        nop     
7a73 00        nop     
7a74 00        nop     
7a75 00        nop     
7a76 00        nop     
7a77 00        nop     
7a78 00        nop     
7a79 00        nop     
7a7a 00        nop     
7a7b 00        nop     
7a7c 00        nop     
7a7d cd563a    call    $3a56 		Carry=BIT4 from flags at 3c98
7a80 306d      jr      nc,$7aef
7a82 f5        push    af
7a83 c5        push    bc
7a84 d5        push    de
7a85 e5        push    hl
7a86 fde5      push    iy
7a88 97        sub     a
7a89 320084    ld      ($8400),a
7a8c cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
7a8f fd21fc83  ld      iy,$83fc
7a93 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
7a96 3afa83    ld      a,($83fa)
7a99 32c17c    ld      ($7cc1),a
7a9c 3af883    ld      a,($83f8)
7a9f 32c37c    ld      ($7cc3),a
7aa2 3af783    ld      a,($83f7)
7aa5 32c27c    ld      ($7cc2),a
7aa8 cd6041    call    $4160
7aab cdfd85    call    $85fd
7aae 3ac17c    ld      a,($7cc1)
7ab1 47        ld      b,a
7ab2 c64e      add     a,$4e
7ab4 57        ld      d,a
7ab5 2617      ld      h,$17
7ab7 cd737f    call    $7f73
7aba 3005      jr      nc,$7ac1
7abc cd0381    call    $8103
7abf 1807      jr      $7ac8
7ac1 cdf07a    call    $7af0
7ac4 fe01      cp      $01
7ac6 280b      jr      z,$7ad3
7ac8 25        dec     h
7ac9 2808      jr      z,$7ad3
7acb cd3002    call    $0230
7ace cd597d    call    $7d59		read key into keyboard buffer
7ad1 18e4      jr      $7ab7
7ad3 cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
7ad6 cd1e41    call    $411e
7ad9 3ac37c    ld      a,($7cc3)
7adc 32f883    ld      ($83f8),a
7adf 3ac17c    ld      a,($7cc1)
7ae2 32fa83    ld      ($83fa),a
7ae5 cda13b    call    $3ba1
7ae8 fde1      pop     iy
7aea e1        pop     hl
7aeb d1        pop     de
7aec c1        pop     bc
7aed f1        pop     af
7aee 37        scf     
7aef c9        ret     

7af0 c5        push    bc
7af1 d5        push    de
7af2 97        sub     a
7af3 32fa7b    ld      ($7bfa),a
7af6 3c        inc     a
7af7 325180    ld      ($8051),a
7afa cd5380    call    $8053
7afd b7        or      a
7afe c4a440    call    nz,$40a4
7b01 cd5091    call    $9150
7b04 fe0c      cp      $0c
7b06 2009      jr      nz,$7b11
7b08 cdfd03    call    $03fd
7b0b cdc78e    call    $8ec7
7b0e c3ee7b    jp      $7bee
7b11 cd8291    call    $9182
7b14 cdfb7b    call    $7bfb
7b17 380a      jr      c,$7b23
7b19 cde440    call    $40e4
7b1c b7        or      a
7b1d cd597d    call    $7d59		read key into keyboard buffer
7b20 c3ee7b    jp      $7bee
7b23 cd5091    call    $9150
7b26 cda37f    call    $7fa3
7b29 cd2b83    call    $832b
7b2c fefe      cp      $fe
7b2e d2dd7b    jp      nc,$7bdd
7b31 b8        cp      b
7b32 3017      jr      nc,$7b4b
7b34 cd5091    call    $9150
7b37 fe0d      cp      $0d
7b39 ca9f7b    jp      z,$7b9f
7b3c fe0a      cp      $0a
7b3e ca9f7b    jp      z,$7b9f
7b41 fe01      cp      $01
7b43 caee7b    jp      z,$7bee
7b46 cdc78e    call    $8ec7
7b49 18db      jr      $7b26
7b4b 2809      jr      z,$7b56
7b4d ed44      neg     
7b4f 1e20      ld      e,$20
7b51 0e02      ld      c,$02
7b53 cd0b8c    call    $8c0b
7b56 cd597d    call    $7d59		read key into keyboard buffer
7b59 cd203c    call    $3c20
7b5c 2807      jr      z,$7b65
7b5e 3e01      ld      a,$01
7b60 32fa7b    ld      ($7bfa),a
7b63 1804      jr      $7b69
7b65 97        sub     a
7b66 32fa7b    ld      ($7bfa),a
7b69 cd597d    call    $7d59		read key into keyboard buffer
7b6c cd2b83    call    $832b
7b6f fefe      cp      $fe
7b71 306a      jr      nc,$7bdd
7b73 ba        cp      d
7b74 301e      jr      nc,$7b94
7b76 cd5091    call    $9150
7b79 cdbe7f    call    $7fbe
7b7c cdc78e    call    $8ec7
7b7f fe0d      cp      $0d
7b81 286b      jr      z,$7bee
7b83 fe0a      cp      $0a
7b85 2867      jr      z,$7bee
7b87 fe01      cp      $01
7b89 2863      jr      z,$7bee
7b8b fe09      cp      $09
7b8d 2818      jr      z,$7ba7
7b8f cdc47c    call    $7cc4
7b92 18d5      jr      $7b69
7b94 cd5091    call    $9150
7b97 fe0d      cp      $0d
7b99 2804      jr      z,$7b9f
7b9b fe0a      cp      $0a
7b9d 201e      jr      nz,$7bbd
7b9f cdbe7f    call    $7fbe
7ba2 cdc78e    call    $8ec7
7ba5 1847      jr      $7bee
7ba7 cd2b83    call    $832b
7baa fefe      cp      $fe
7bac 2005      jr      nz,$7bb3
7bae cd208f    call    $8f20
7bb1 1838      jr      $7beb
7bb3 ba        cp      d
7bb4 3007      jr      nc,$7bbd
7bb6 3e09      ld      a,$09
7bb8 cdc47c    call    $7cc4
7bbb 18ac      jr      $7b69
7bbd 3e0d      ld      a,$0d
7bbf cdbe7f    call    $7fbe
7bc2 cd9f02    call    $029f
7bc5 cd2b83    call    $832b
7bc8 fefe      cp      $fe
7bca 3011      jr      nc,$7bdd
7bcc cdc78e    call    $8ec7
7bcf fe0d      cp      $0d
7bd1 281b      jr      z,$7bee
7bd3 fe0a      cp      $0a
7bd5 2817      jr      z,$7bee
7bd7 fe01      cp      $01
7bd9 2813      jr      z,$7bee
7bdb 18e8      jr      $7bc5
7bdd cdc78e    call    $8ec7
7be0 fe0a      cp      $0a
7be2 280a      jr      z,$7bee
7be4 fe0d      cp      $0d
7be6 2806      jr      z,$7bee
7be8 cd208f    call    $8f20
7beb cddd3f    call    $3fdd
7bee f5        push    af
7bef 3afa7b    ld      a,($7bfa)
7bf2 b7        or      a
7bf3 c49002    call    nz,$0290
7bf6 f1        pop     af
7bf7 d1        pop     de
7bf8 c1        pop     bc
7bf9 c9        ret     

7bfa 00        nop     
7bfb c5        push    bc
7bfc d5        push    de
7bfd e5        push    hl
7bfe 32c07c    ld      ($7cc0),a
7c01 cd003c    call    $3c00
7c04 cab87c    jp      z,$7cb8
7c07 3e01      ld      a,$01
7c09 b8        cp      b
7c0a c2b87c    jp      nz,$7cb8
7c0d 3e4f      ld      a,$4f
7c0f ba        cp      d
7c10 c2b87c    jp      nz,$7cb8
7c13 cd203c    call    $3c20
7c16 c2b87c    jp      nz,$7cb8
7c19 2ab894    ld      hl,($94b8)
7c1c 7e        ld      a,(hl)
7c1d 23        inc     hl
7c1e fe20      cp      $20
7c20 380c      jr      c,$7c2e
7c22 fe7f      cp      $7f
7c24 3008      jr      nc,$7c2e
7c26 04        inc     b
7c27 7a        ld      a,d
7c28 b8        cp      b
7c29 dab87c    jp      c,$7cb8
7c2c 18ee      jr      $7c1c
7c2e fead      cp      $ad
7c30 28f4      jr      z,$7c26
7c32 fe09      cp      $09
7c34 2008      jr      nz,$7c3e
7c36 3e08      ld      a,$08
7c38 80        add     a,b
7c39 e6f8      and     $f8
7c3b 47        ld      b,a
7c3c 18e9      jr      $7c27
7c3e fe0d      cp      $0d
7c40 2804      jr      z,$7c46
7c42 fe0a      cp      $0a
7c44 2072      jr      nz,$7cb8
7c46 2b        dec     hl
7c47 ed4bba94  ld      bc,($94ba)
7c4b 7c        ld      a,h
7c4c b8        cp      b
7c4d 2004      jr      nz,$7c53
7c4f 7d        ld      a,l
7c50 b9        cp      c
7c51 2802      jr      z,$7c55
7c53 3063      jr      nc,$7cb8
7c55 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
7c58 2847      jr      z,$7ca1
7c5a e5        push    hl
7c5b 2ac294    ld      hl,($94c2)
7c5e ed4bfe5f  ld      bc,($5ffe)
7c62 a7        and     a
7c63 ed42      sbc     hl,bc
7c65 200a      jr      nz,$7c71
7c67 ed4bfc5f  ld      bc,($5ffc)
7c6b 2ac094    ld      hl,($94c0)
7c6e a7        and     a
7c6f ed42      sbc     hl,bc
7c71 e1        pop     hl
7c72 2844      jr      z,$7cb8
7c74 302b      jr      nc,$7ca1
7c76 e5        push    hl
7c77 ed4bb894  ld      bc,($94b8)
7c7b b7        or      a
7c7c ed42      sbc     hl,bc
7c7e ed4bc094  ld      bc,($94c0)
7c82 09        add     hl,bc
7c83 ed5bc294  ld      de,($94c2)
7c87 3001      jr      nc,$7c8a
7c89 13        inc     de
7c8a ed4bfa5f  ld      bc,($5ffa)
7c8e eb        ex      de,hl
7c8f a7        and     a
7c90 ed42      sbc     hl,bc
7c92 2008      jr      nz,$7c9c
7c94 ed4bf85f  ld      bc,($5ff8)
7c98 eb        ex      de,hl
7c99 a7        and     a
7c9a ed42      sbc     hl,bc
7c9c e1        pop     hl
7c9d 2819      jr      z,$7cb8
7c9f 3017      jr      nc,$7cb8
7ca1 7e        ld      a,(hl)
7ca2 3600      ld      (hl),$00
7ca4 0601      ld      b,$01
7ca6 e5        push    hl
7ca7 2ab894    ld      hl,($94b8)
7caa cf        rst     $08
7cab 19        add     hl,de
7cac e1        pop     hl
7cad 77        ld      (hl),a
7cae fe0a      cp      $0a
7cb0 2003      jr      nz,$7cb5
7cb2 cd2204    call    $0422
7cb5 b7        or      a
7cb6 1801      jr      $7cb9
7cb8 37        scf     
7cb9 e1        pop     hl
7cba d1        pop     de
7cbb c1        pop     bc
7cbc 3ac07c    ld      a,($7cc0)
7cbf c9        ret     

7cc0 00        nop     
7cc1 00        nop     
7cc2 00        nop     
7cc3 00        nop     
7cc4 c5        push    bc
7cc5 d5        push    de
7cc6 e67f      and     $7f
7cc8 fe09      cp      $09
7cca 2808      jr      z,$7cd4
7ccc 5f        ld      e,a
7ccd 0e06      ld      c,$06
7ccf cd0500    call    $0005
7cd2 1815      jr      $7ce9
7cd4 cd2b83    call    $832b
7cd7 47        ld      b,a
7cd8 cd208f    call    $8f20
7cdb cd2b83    call    $832b
7cde 90        sub     b
7cdf 1e20      ld      e,$20
7ce1 0e06      ld      c,$06
7ce3 cd0b8c    call    $8c0b
7ce6 cdc78e    call    $8ec7
7ce9 d1        pop     de
7cea c1        pop     bc
7ceb c9        ret     

7cec c5        push    bc
7ced cd2a7d    call    $7d2a
7cf0 fe20      cp      $20
7cf2 3018      jr      nc,$7d0c
7cf4 fe02      cp      $02
7cf6 2011      jr      nz,$7d09
7cf8 cd2a7d    call    $7d2a
7cfb fe02      cp      $02
7cfd 2008      jr      nz,$7d07
7cff cd2a7d    call    $7d2a
7d02 f5        push    af
7d03 cd2a7d    call    $7d2a
7d06 f1        pop     af
7d07 f680      or      $80
7d09 cd9801    call    $0198
7d0c c1        pop     bc
7d0d c9        ret     

7d0e c5        push    bc
7d0f d5        push    de
7d10 32297d    ld      ($7d29),a
7d13 cd917d    call    $7d91
7d16 280a      jr      z,$7d22
7d18 cdec7c    call    $7cec
7d1b fe1b      cp      $1b
7d1d 2003      jr      nz,$7d22
7d1f 37        scf     
7d20 1801      jr      $7d23
7d22 b7        or      a
7d23 d1        pop     de
7d24 c1        pop     bc
7d25 3a297d    ld      a,($7d29)
7d28 c9        ret     

7d29 00        nop     
7d2a c5        push    bc
7d2b d5        push    de
7d2c e5        push    hl
7d2d 2ab47d    ld      hl,($7db4)
7d30 ed4bb27d  ld      bc,($7db2)
7d34 b7        or      a
7d35 ed42      sbc     hl,bc
7d37 2815      jr      z,$7d4e
7d39 60        ld      h,b
7d3a 69        ld      l,c
7d3b 7e        ld      a,(hl)
7d3c 03        inc     bc
7d3d 21d47d    ld      hl,$7dd4
7d40 b7        or      a
7d41 ed42      sbc     hl,bc
7d43 2003      jr      nz,$7d48
7d45 01b67d    ld      bc,$7db6
7d48 ed43b27d  ld      ($7db2),bc
7d4c 1807      jr      $7d55
7d4e 0e80      ld      c,$80
7d50 1efd      ld      e,$fd
7d52 cd0500    call    $0005
7d55 e1        pop     hl
7d56 d1        pop     de
7d57 c1        pop     bc
7d58 c9        ret     

7d59 f5        push    af	read key into keyboard buffer
7d5a c5        push    bc
7d5b d5        push    de
7d5c e5        push    hl
7d5d 0e0b      ld      c,$0b
7d5f 1efe      ld      e,$fe
7d61 cd0500    call    $0005	BDOS Call 11 C_STAT Console Status
7d64 b7        or      a
7d65 2825      jr      z,$7d8c	exit if no key pressed
7d67 0e80      ld      c,$80
7d69 1efd      ld      e,$fd
7d6b cd0500    call    $0005	BDOS 128 read console, blocking, no echo
7d6e 2ab47d    ld      hl,($7db4)
7d71 77        ld      (hl),a
7d72 23        inc     hl
7d73 44        ld      b,h
7d74 4d        ld      c,l
7d75 21d47d    ld      hl,$7dd4
7d78 b7        or      a
7d79 ed42      sbc     hl,bc
7d7b 2003      jr      nz,$7d80
7d7d 01b67d    ld      bc,$7db6
7d80 2ab27d    ld      hl,($7db2)
7d83 b7        or      a
7d84 ed42      sbc     hl,bc
7d86 2804      jr      z,$7d8c
7d88 ed43b47d  ld      ($7db4),bc
7d8c e1        pop     hl
7d8d d1        pop     de
7d8e c1        pop     bc
7d8f f1        pop     af
7d90 c9        ret     

7d91 c5        push    bc
7d92 e5        push    hl
7d93 cd597d    call    $7d59		read key into keyboard buffer
7d96 2ab47d    ld      hl,($7db4)
7d99 ed4bb27d  ld      bc,($7db2)
7d9d b7        or      a
7d9e ed42      sbc     hl,bc
7da0 e1        pop     hl
7da1 c1        pop     bc
7da2 c9        ret     

					discard keys typed on terminal

7da3 e5        push    hl		
7da4 cd597d    call    $7d59		read key into keyboard buffer
7da7 21b67d    ld      hl,$7db6
7daa 22b27d    ld      ($7db2),hl
7dad 22b47d    ld      ($7db4),hl
7db0 e1        pop     hl
7db1 c9        ret     

7db2 b6        or      (hl)
7db3 7d        ld      a,l
7db4 b6        or      (hl)
7db5 7d        ld      a,l
7db6 00        nop     
7db7 00        nop     
7db8 00        nop     
7db9 00        nop     
7dba 00        nop     
7dbb 00        nop     
7dbc 00        nop     
7dbd 00        nop     
7dbe 00        nop     
7dbf 00        nop     
7dc0 00        nop     
7dc1 00        nop     
7dc2 00        nop     
7dc3 00        nop     
7dc4 00        nop     
7dc5 00        nop     
7dc6 00        nop     
7dc7 00        nop     
7dc8 00        nop     
7dc9 00        nop     
7dca 00        nop     
7dcb 00        nop     
7dcc 00        nop     
7dcd 00        nop     
7dce 00        nop     
7dcf 00        nop     
7dd0 00        nop     
7dd1 00        nop     
7dd2 00        nop     
7dd3 00        nop     
7dd4 c5        push    bc
7dd5 d5        push    de
7dd6 dde5      push    ix
7dd8 fde5      push    iy
7dda cd5e7f    call    $7f5e
7ddd 57        ld      d,a
7dde 1e00      ld      e,$00
7de0 016c7f    ld      bc,$7f6c
7de3 dd21b3a6  ld      ix,$a6b3
7de7 21437e    ld      hl,$7e43
7dea c5        push    bc
7deb cda17e    call    $7ea1
7dee c1        pop     bc
7def 384b      jr      c,$7e3c
7df1 2831      jr      z,$7e24
7df3 fe0d      cp      $0d
7df5 283e      jr      z,$7e35
7df7 fe20      cp      $20
7df9 283a      jr      z,$7e35
7dfb fe7f      cp      $7f
7dfd 2804      jr      z,$7e03
7dff fe08      cp      $08
7e01 200b      jr      nz,$7e0e
7e03 7b        ld      a,e
7e04 b7        or      a
7e05 28e0      jr      z,$7de7
7e07 1d        dec     e
7e08 0b        dec     bc
7e09 cdf285    call    $85f2
7e0c 18d9      jr      $7de7
7e0e 67        ld      h,a
7e0f 7a        ld      a,d
7e10 bb        cp      e
7e11 280c      jr      z,$7e1f
7e13 7c        ld      a,h
7e14 02        ld      (bc),a
7e15 cd7844    call    $4478		write char in A
7e18 cdbf85    call    $85bf
7e1b 03        inc     bc
7e1c 1c        inc     e
7e1d 18c8      jr      $7de7
7e1f cd2202    call    $0222
7e22 18c3      jr      $7de7
7e24 216c7f    ld      hl,$7f6c
7e27 e5        push    hl
7e28 b7        or      a
7e29 ed42      sbc     hl,bc
7e2b e1        pop     hl
7e2c 30b9      jr      nc,$7de7
7e2e 7e        ld      a,(hl)
7e2f 23        inc     hl
7e30 cd7844    call    $4478		write char in A
7e33 18f2      jr      $7e27
7e35 016c7f    ld      bc,$7f6c
7e38 cd468b    call    $8b46
7e3b b7        or      a
7e3c fde1      pop     iy
7e3e dde1      pop     ix
7e40 d1        pop     de
7e41 c1        pop     bc
7e42 c9        ret     

7e43 3031      jr      nc,$7e76
7e45 323334    ld      ($3433),a
7e48 35        dec     (hl)
7e49 3637      ld      (hl),$37
7e4b 3839      jr      c,$7e86
7e4d 200d      jr      nz,$7e5c
7e4f 7f        ld      a,a
7e50 08        ex      af,af'
7e51 00        nop     
7e52 3ac17e    ld      a,($7ec1)
7e55 b7        or      a
7e56 f5        push    af
7e57 cdec7c    call    $7cec
7e5a fe1b      cp      $1b
7e5c 2009      jr      nz,$7e67
7e5e f1        pop     af
7e5f 2803      jr      z,$7e64
7e61 cd6888    call    $8868
7e64 37        scf     
7e65 1837      jr      $7e9e
7e67 feeb      cp      $eb
7e69 201f      jr      nz,$7e8a
7e6b cd9d43    call    $439d
7e6e f1        pop     af
7e6f 2014      jr      nz,$7e85
7e71 cd6f43    call    $436f
7e74 f5        push    af
7e75 c5        push    bc
7e76 d5        push    de
7e77 e5        push    hl
7e78 dde5      push    ix
7e7a cd9f7e    call    $7e9f
7e7d dde1      pop     ix
7e7f e1        pop     hl
7e80 d1        pop     de
7e81 c1        pop     bc
7e82 f1        pop     af
7e83 1819      jr      $7e9e
7e85 cda885    call    $85a8
7e88 18c8      jr      $7e52
7e8a fefc      cp      $fc
7e8c 200d      jr      nz,$7e9b
7e8e f1        pop     af
7e8f 2805      jr      z,$7e96
7e91 cd3e89    call    $893e
7e94 18bc      jr      $7e52
7e96 cd2202    call    $0222
7e99 18b7      jr      $7e52
7e9b e3        ex      (sp),hl
7e9c e1        pop     hl
7e9d b7        or      a
7e9e c9        ret     

7e9f fde9      jp      (iy)
7ea1 cd527e    call    $7e52
7ea4 380f      jr      c,$7eb5
7ea6 280d      jr      z,$7eb5
7ea8 cd7c8c    call    $8c7c
7eab cdc27e    call    $7ec2
7eae 2005      jr      nz,$7eb5
7eb0 cd2202    call    $0222
7eb3 18ec      jr      $7ea1
7eb5 c9        ret     

7eb6 3e01      ld      a,$01
7eb8 32c17e    ld      ($7ec1),a
7ebb c9        ret     

7ebc 97        sub     a
7ebd 32c17e    ld      ($7ec1),a
7ec0 c9        ret     

7ec1 01d5e5    ld      bc,$e5d5
7ec4 0600      ld      b,$00
7ec6 5f        ld      e,a
7ec7 7e        ld      a,(hl)
7ec8 bb        cp      e
7ec9 2807      jr      z,$7ed2
7ecb b7        or      a
7ecc 2804      jr      z,$7ed2
7ece 23        inc     hl
7ecf 04        inc     b
7ed0 18f5      jr      $7ec7
7ed2 b7        or      a
7ed3 e1        pop     hl
7ed4 d1        pop     de
7ed5 c9        ret     

7ed6 221f7f    ld      ($7f1f),hl
7ed9 0600      ld      b,$00
7edb cd527e    call    $7e52
7ede 383e      jr      c,$7f1e
7ee0 2829      jr      z,$7f0b
7ee2 fe0d      cp      $0d
7ee4 2837      jr      z,$7f1d
7ee6 fe7f      cp      $7f
7ee8 2804      jr      z,$7eee
7eea fe08      cp      $08
7eec 200b      jr      nz,$7ef9
7eee 97        sub     a
7eef b0        or      b
7ef0 2826      jr      z,$7f18
7ef2 05        dec     b
7ef3 2b        dec     hl
7ef4 cdf285    call    $85f2
7ef7 18e2      jr      $7edb
7ef9 cdb28c    call    $8cb2
7efc 301a      jr      nc,$7f18
7efe cdbf85    call    $85bf
7f01 3815      jr      c,$7f18
7f03 cd7844    call    $4478		write char in A
7f06 04        inc     b
7f07 77        ld      (hl),a
7f08 23        inc     hl
7f09 18d0      jr      $7edb
7f0b 3624      ld      (hl),$24
7f0d ed5b1f7f  ld      de,($7f1f)
7f11 0e09      ld      c,$09
7f13 cd0500    call    $0005
7f16 18c3      jr      $7edb
7f18 cd2202    call    $0222
7f1b 18be      jr      $7edb
7f1d b7        or      a
7f1e c9        ret     

7f1f 00        nop     
7f20 00        nop     
7f21 c5        push    bc
7f22 cd2e04    call    $042e		CDOS: set special crt function
7f25 cd317f    call    $7f31
7f28 c1        pop     bc
7f29 c9        ret     

7f2a cd2e04    call    $042e		CDOS: set special crt function
7f2d cd497f    call    $7f49
7f30 c9        ret     

7f31 c5        push    bc
7f32 d5        push    de
7f33 e5        push    hl
7f34 4f        ld      c,a
7f35 0600      ld      b,$00
7f37 216c7f    ld      hl,$7f6c
7f3a cd678b    call    $8b67
7f3d 116e7f    ld      de,$7f6e
7f40 0e09      ld      c,$09
7f42 cd0500    call    $0005
7f45 e1        pop     hl
7f46 d1        pop     de
7f47 c1        pop     bc
7f48 c9        ret     

7f49 c5        push    bc
7f4a d5        push    de
7f4b e5        push    hl
7f4c 216c7f    ld      hl,$7f6c
7f4f cd678b    call    $8b67
7f52 116c7f    ld      de,$7f6c
7f55 0e09      ld      c,$09
7f57 cd0500    call    $0005
7f5a e1        pop     hl
7f5b d1        pop     de
7f5c c1        pop     bc
7f5d c9        ret     

7f5e 216c7f    ld      hl,$7f6c
7f61 116d7f    ld      de,$7f6d
7f64 010500    ld      bc,$0005
7f67 3600      ld      (hl),$00
7f69 edb0      ldir    
7f6b c9        ret     

7f6c 00        nop     
7f6d 00        nop     
7f6e 00        nop     
7f6f 00        nop     
7f70 00        nop     
7f71 00        nop     
7f72 24        inc     h
7f73 c5        push    bc
7f74 cda269    call    $69a2
7f77 0b        dec     bc
7f78 78        ld      a,b
7f79 b1        or      c
7f7a 2821      jr      z,$7f9d
7f7c cda769    call    $69a7
7f7f 0b        dec     bc
7f80 78        ld      a,b
7f81 b1        or      c
7f82 2019      jr      nz,$7f9d
7f84 cd8291    call    $9182
7f87 fe0c      cp      $0c
7f89 2812      jr      z,$7f9d
7f8b cd3e83    call    $833e
7f8e fe02      cp      $02
7f90 280b      jr      z,$7f9d
7f92 cd913b    call    $3b91
7f95 2006      jr      nz,$7f9d
7f97 cd993b    call    $3b99
7f9a 37        scf     
7f9b 1804      jr      $7fa1
7f9d cda13b    call    $3ba1
7fa0 b7        or      a
7fa1 c1        pop     bc
7fa2 c9        ret     

7fa3 f5        push    af
7fa4 c5        push    bc
7fa5 cd5091    call    $9150
7fa8 3a5280    ld      a,($8052)
7fab 47        ld      b,a
7fac cd5380    call    $8053
7faf b8        cp      b
7fb0 2809      jr      z,$7fbb
7fb2 325280    ld      ($8052),a
7fb5 cd2b83    call    $832b
7fb8 325180    ld      ($8051),a
7fbb c1        pop     bc
7fbc f1        pop     af
7fbd c9        ret     

7fbe c5        push    bc
7fbf d5        push    de
7fc0 e5        push    hl
7fc1 fe0d      cp      $0d
7fc3 280a      jr      z,$7fcf
7fc5 fe0a      cp      $0a
7fc7 2043      jr      nz,$800c
7fc9 cd2204    call    $0422
7fcc cde702    call    $02e7
7fcf cd5380    call    $8053
7fd2 b7        or      a
7fd3 2837      jr      z,$800c
7fd5 fe04      cp      $04
7fd7 2807      jr      z,$7fe0
7fd9 3a5280    ld      a,($8052)
7fdc 67        ld      h,a
7fdd 97        sub     a
7fde 1833      jr      $8013
7fe0 cd3e83    call    $833e
7fe3 5f        ld      e,a
7fe4 164f      ld      d,$4f
7fe6 cd2e04    call    $042e	CDOS: set special crt function
7fe9 97        sub     a
7fea cd6503    call    $0365
7fed 3ac17c    ld      a,($7cc1)
7ff0 57        ld      d,a
7ff1 cd2b83    call    $832b
7ff4 92        sub     d
7ff5 3001      jr      nc,$7ff8
7ff7 97        sub     a
7ff8 3c        inc     a
7ff9 57        ld      d,a
7ffa cd2e04    call    $042e	CDOS: set special crt function
7ffd 3a5280    ld      a,($8052)
8000 67        ld      h,a
8001 fe04      cp      $04
8003 2816      jr      z,$801b
8005 3e04      ld      a,$04
8007 cd6503    call    $0365
800a 180f      jr      $801b
800c 3a5280    ld      a,($8052)
800f 67        ld      h,a
8010 cd5380    call    $8053
8013 bc        cp      h
8014 2837      jr      z,$804d
8016 6f        ld      l,a
8017 97        sub     a
8018 cd6503    call    $0365
801b 3ac17c    ld      a,($7cc1)
801e 57        ld      d,a
801f 3a5180    ld      a,($8051)
8022 92        sub     d
8023 3001      jr      nc,$8026
8025 97        sub     a
8026 3c        inc     a
8027 57        ld      d,a
8028 cd3e83    call    $833e
802b 5f        ld      e,a
802c cd2b83    call    $832b
802f 325180    ld      ($8051),a
8032 cd2e04    call    $042e		CDOS: set special crt function
8035 7c        ld      a,h
8036 cd6503    call    $0365
8039 3ac17c    ld      a,($7cc1)
803c 57        ld      d,a
803d cd2b83    call    $832b
8040 92        sub     d
8041 3001      jr      nc,$8044
8043 97        sub     a
8044 3c        inc     a
8045 57        ld      d,a
8046 cd2e04    call    $042e		CDOS: set special crt function
8049 7d        ld      a,l
804a 325280    ld      ($8052),a
804d e1        pop     hl
804e d1        pop     de
804f c1        pop     bc
8050 c9        ret     

8051 00        nop     
8052 00        nop     
8053 e5        push    hl
8054 219a3c    ld      hl,$3c9a
8057 cb46      bit     0,(hl)
8059 2804      jr      z,$805f
805b 3e03      ld      a,$03
805d 1853      jr      $80b2
805f cb4e      bit     1,(hl)
8061 2804      jr      z,$8067
8063 3e06      ld      a,$06
8065 184b      jr      $80b2
8067 21993c    ld      hl,$3c99
806a cb6e      bit     5,(hl)
806c 2804      jr      z,$8072
806e 3e02      ld      a,$02
8070 1840      jr      $80b2
8072 21993c    ld      hl,$3c99
8075 cb66      bit     4,(hl)
8077 281e      jr      z,$8097
8079 cb5e      bit     3,(hl)
807b 280d      jr      z,$808a
807d cdb580    call    $80b5
8080 2804      jr      z,$8086
8082 3e0d      ld      a,$0d
8084 182c      jr      $80b2
8086 3e09      ld      a,$09
8088 1828      jr      $80b2
808a cdb580    call    $80b5
808d 2804      jr      z,$8093
808f 3e0c      ld      a,$0c
8091 181f      jr      $80b2
8093 3e08      ld      a,$08
8095 181b      jr      $80b2
8097 cb5e      bit     3,(hl)
8099 280d      jr      z,$80a8
809b cdb580    call    $80b5
809e 2804      jr      z,$80a4
80a0 3e05      ld      a,$05
80a2 180e      jr      $80b2
80a4 3e01      ld      a,$01
80a6 180a      jr      $80b2
80a8 cdb580    call    $80b5
80ab 2804      jr      z,$80b1
80ad 3e04      ld      a,$04
80af 1801      jr      $80b2
80b1 97        sub     a
80b2 b7        or      a
80b3 e1        pop     hl
80b4 c9        ret     

80b5 cd393b    call    $3a6c		Reset BIT4 flag at 3c98
80b8 2844      jr      z,$80fe
80ba d5        push    de
80bb e5        push    hl
80bc 21fb5f    ld      hl,$5ffb
80bf 11c394    ld      de,$94c3
80c2 1a        ld      a,(de)
80c3 be        cp      (hl)
80c4 2010      jr      nz,$80d6
80c6 2b        dec     hl
80c7 1b        dec     de
80c8 1a        ld      a,(de)
80c9 be        cp      (hl)
80ca 200a      jr      nz,$80d6
80cc 2b        dec     hl
80cd 1b        dec     de
80ce 1a        ld      a,(de)
80cf be        cp      (hl)
80d0 2004      jr      nz,$80d6
80d2 2b        dec     hl
80d3 1b        dec     de
80d4 1a        ld      a,(de)
80d5 be        cp      (hl)
80d6 3823      jr      c,$80fb
80d8 21ff5f    ld      hl,$5fff
80db 11c394    ld      de,$94c3
80de 1a        ld      a,(de)
80df be        cp      (hl)
80e0 2010      jr      nz,$80f2
80e2 2b        dec     hl
80e3 1b        dec     de
80e4 1a        ld      a,(de)
80e5 be        cp      (hl)
80e6 200a      jr      nz,$80f2
80e8 2b        dec     hl
80e9 1b        dec     de
80ea 1a        ld      a,(de)
80eb be        cp      (hl)
80ec 2004      jr      nz,$80f2
80ee 2b        dec     hl
80ef 1b        dec     de
80f0 1a        ld      a,(de)
80f1 be        cp      (hl)
80f2 3007      jr      nc,$80fb
80f4 e1        pop     hl
80f5 d1        pop     de
80f6 3e01      ld      a,$01
80f8 b7        or      a
80f9 1803      jr      $80fe
80fb e1        pop     hl
80fc d1        pop     de
80fd 97        sub     a
80fe c9        ret     

80ff 00        nop     
8100 00        nop     
8101 00        nop     
8102 00        nop     
8103 cd3e83    call    $833e
8106 3d        dec     a
8107 320084    ld      ($8400),a
810a cdfd03    call    $03fd
810d c9        ret     

810e f5        push    af
810f cd3e83    call    $833e
8112 fe19      cp      $19
8114 3845      jr      c,$815b
8116 fe1a      cp      $1a
8118 3827      jr      c,$8141
811a cd737f    call    $7f73
811d 3017      jr      nc,$8136
811f 1601      ld      d,$01		set cursor pos
8121 1e18      ld      e,$18
8123 cd2e04    call    $042e		CDOS: set special crt function
8126 cd3002    call    $0230
8129 3e18      ld      a,$18
812b 320084    ld      ($8400),a
812e cdfd03    call    $03fd
8131 cda13b    call    $3ba1
8134 180b      jr      $8141
8136 3e18      ld      a,$18
8138 cd4683    call    $8346
813b f1        pop     af
813c cd7d7a    call    $7a7d
813f 181e      jr      $815f
8141 3e18      ld      a,$18
8143 cd4683    call    $8346
8146 f1        pop     af
8147 38f3      jr      c,$813c
8149 1601      ld      d,$01		set cursor pos
814b 1e18      ld      e,$18	
814d cd2e04    call    $042e		CDOS: set special crt function
8150 cd3002    call    $0230
8153 cdc981    call    $81c9
8156 cdb283    call    $83b2
8159 1804      jr      $815f
815b f1        pop     af
815c dc7d7a    call    c,$7a7d
815f c9        ret     

8160 f5        push    af
8161 cd3e83    call    $833e
8164 fe19      cp      $19
8166 3051      jr      nc,$81b9
8168 b7        or      a
8169 2030      jr      nz,$819b
816b 47        ld      b,a
816c cd3683    call    $8336
816f 4f        ld      c,a
8170 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
8173 cde440    call    $40e4
8176 cd3e83    call    $833e
8179 90        sub     b
817a fe02      cp      $02
817c f5        push    af
817d cd1e41    call    $411e
8180 79        ld      a,c
8181 cd1c83    call    $831c
8184 f1        pop     af
8185 2032      jr      nz,$81b9
8187 1601      ld      d,$01		set cursor pos
8189 1e02      ld      e,$02
818b cd2e04    call    $042e		CDOS: set special crt function
818e cdfc01    call    $01fc
8191 3e02      ld      a,$02
8193 320084    ld      ($8400),a
8196 cdfd03    call    $03fd
8199 1804      jr      $819f
819b fe02      cp      $02
819d 3025      jr      nc,$81c4
819f 3e02      ld      a,$02
81a1 cd4683    call    $8346
81a4 f1        pop     af
81a5 3818      jr      c,$81bf
81a7 1601      ld      d,$01		set cursor pos
81a9 1e02      ld      e,$02
81ab cd2e04    call    $042e		CDOS: set special crt function
81ae cdfc01    call    $01fc
81b1 cdc981    call    $81c9
81b4 cda583    call    $83a5
81b7 180f      jr      $81c8
81b9 f1        pop     af
81ba 3e02      ld      a,$02
81bc cd4683    call    $8346
81bf cd7d7a    call    $7a7d
81c2 1804      jr      $81c8
81c4 f1        pop     af
81c5 dc7d7a    call    c,$7a7d
81c8 c9        ret     

81c9 c5        push    bc
81ca d5        push    de
81cb e5        push    hl
81cc fde5      push    iy
81ce cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
81d1 fd210682  ld      iy,$8206
81d5 cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
81d8 cd3a83    call    $833a
81db 320a82    ld      ($820a),a
81de cd3683    call    $8336
81e1 320b82    ld      ($820b),a
81e4 47        ld      b,a
81e5 c64e      add     a,$4e
81e7 57        ld      d,a
81e8 cda440    call    $40a4
81eb cdf07a    call    $7af0
81ee cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
81f1 cd1e41    call    $411e
81f4 3a0a82    ld      a,($820a)
81f7 cd4a83    call    $834a
81fa 3a0b82    ld      a,($820b)
81fd cd1c83    call    $831c
8200 fde1      pop     iy
8202 e1        pop     hl
8203 d1        pop     de
8204 c1        pop     bc
8205 c9        ret     

8206 00        nop     
8207 00        nop     
8208 00        nop     
8209 00        nop     
820a 00        nop     
820b 00        nop     
820c e5        push    hl
820d 21f783    ld      hl,$83f7
8210 35        dec     (hl)
8211 e1        pop     hl
8212 c9        ret     

8213 e5        push    hl
8214 21f783    ld      hl,$83f7
8217 34        inc     (hl)
8218 e1        pop     hl
8219 c9        ret     

821a 32fb83    ld      ($83fb),a
821d e5        push    hl
821e 3af883    ld      a,($83f8)
8221 fe01      cp      $01
8223 200f      jr      nz,$8234
8225 3ef8      ld      a,$f8
8227 cd0d83    call    $830d
822a 300c      jr      nc,$8238
822c 3e08      ld      a,$08
822e 32f883    ld      ($83f8),a
8231 37        scf     
8232 1805      jr      $8239
8234 21f883    ld      hl,$83f8
8237 35        dec     (hl)
8238 b7        or      a
8239 3afb83    ld      a,($83fb)
823c e1        pop     hl
823d c9        ret     

823e 32fb83    ld      ($83fb),a
8241 3af883    ld      a,($83f8)
8244 fe4e      cp      $4e
8246 2013      jr      nz,$825b
8248 3e08      ld      a,$08
824a cd0d83    call    $830d
824d 3803      jr      c,$8252
824f 97        sub     a
8250 180d      jr      $825f
8252 3e47      ld      a,$47
8254 32f883    ld      ($83f8),a
8257 b7        or      a
8258 37        scf     
8259 1805      jr      $8260
825b 3c        inc     a
825c 32f883    ld      ($83f8),a
825f b7        or      a
8260 3afb83    ld      a,($83fb)
8263 c9        ret     

8264 d5        push    de
8265 3af783    ld      a,($83f7)
8268 5f        ld      e,a
8269 3af883    ld      a,($83f8)
826c 57        ld      d,a
826d cd2e04    call    $042e		CDOS: set special crt function
8270 d1        pop     de
8271 c9        ret     

8272 32fb83    ld      ($83fb),a
8275 3e01      ld      a,$01
8277 32f883    ld      ($83f8),a
827a 3afa83    ld      a,($83fa)
827d fe01      cp      $01
827f 2808      jr      z,$8289
8281 3e01      ld      a,$01
8283 cd1c83    call    $831c
8286 37        scf     
8287 1801      jr      $828a
8289 b7        or      a
828a 3afb83    ld      a,($83fb)
828d c9        ret     

828e 32fb83    ld      ($83fb),a
8291 3af883    ld      a,($83f8)
8294 3d        dec     a
8295 c608      add     a,$08
8297 e6f8      and     $f8
8299 3c        inc     a
829a fe4f      cp      $4f
829c 381b      jr      c,$82b9
829e f5        push    af
829f 3e08      ld      a,$08
82a1 cd0d83    call    $830d
82a4 3809      jr      c,$82af
82a6 f1        pop     af
82a7 3e4e      ld      a,$4e
82a9 cd4a83    call    $834a
82ac 97        sub     a
82ad 180d      jr      $82bc
82af f1        pop     af
82b0 d608      sub     $08
82b2 b7        or      a
82b3 37        scf     
82b4 cd4a83    call    $834a
82b7 1804      jr      $82bd
82b9 cd4a83    call    $834a
82bc b7        or      a
82bd 3afb83    ld      a,($83fb)
82c0 c9        ret     

82c1 32d382    ld      ($82d3),a
82c4 3e02      ld      a,$02
82c6 32f783    ld      ($83f7),a
82c9 cd7282    call    $8272
82cc 3ad382    ld      a,($82d3)
82cf cd4e83    call    $834e
82d2 c9        ret     

82d3 00        nop     
82d4 c5        push    bc
82d5 3e0d      ld      a,$0d
82d7 cddc82    call    $82dc
82da c1        pop     bc
82db c9        ret     

82dc f5        push    af
82dd d5        push    de
82de e5        push    hl
82df fde5      push    iy
82e1 d602      sub     $02
82e3 281d      jr      z,$8302
82e5 f5        push    af
82e6 47        ld      b,a
82e7 cd3994    call    $9439 		HL=[94c0], DE=[94c2]	
82ea fd21fc83  ld      iy,$83fc
82ee cda88a    call    $8aa8 		[IY, IY+1]=HL, [IY+2, IY+3]=DE
82f1 cd0141    call    $4101
82f4 fe01      cp      $01
82f6 2802      jr      z,$82fa
82f8 10f7      djnz    $82f1
82fa cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
82fd cd1e41    call    $411e
8300 f1        pop     af
8301 90        sub     b
8302 c602      add     a,$02
8304 32f783    ld      ($83f7),a
8307 fde1      pop     iy
8309 e1        pop     hl
830a d1        pop     de
830b f1        pop     af
830c c9        ret     

830d c5        push    bc
830e 47        ld      b,a
830f 3afa83    ld      a,($83fa)
8312 80        add     a,b
8313 feb4      cp      $b4
8315 3003      jr      nc,$831a
8317 32fa83    ld      ($83fa),a
831a c1        pop     bc
831b c9        ret     

831c f5        push    af
831d b7        or      a
831e 2809      jr      z,$8329
8320 feb4      cp      $b4
8322 3005      jr      nc,$8329
8324 32fa83    ld      ($83fa),a
8327 1800      jr      $8329
8329 f1        pop     af
832a c9        ret     

832b e5        push    hl
832c 3af883    ld      a,($83f8)
832f 21fa83    ld      hl,$83fa
8332 3d        dec     a
8333 86        add     a,(hl)
8334 e1        pop     hl
8335 c9        ret     

8336 3afa83    ld      a,($83fa)
8339 c9        ret     

833a 3af883    ld      a,($83f8)
833d c9        ret     

833e 3af783    ld      a,($83f7)
8341 c9        ret     

8342 3af983    ld      a,($83f9)
8345 c9        ret     

8346 32f783    ld      ($83f7),a
8349 c9        ret     

834a 32f883    ld      ($83f8),a
834d c9        ret     

834e cd2b83    call    $832b
8351 32f983    ld      ($83f9),a
8354 c9        ret     

8355 326683    ld      ($8366),a
8358 cd3683    call    $8336
835b b9        cp      c
835c 2803      jr      z,$8361
835e 37        scf     
835f 1801      jr      $8362
8361 b7        or      a
8362 3a6683    ld      a,($8366)
8365 c9        ret     

8366 00        nop     
8367 c5        push    bc
8368 fe01      cp      $01
836a 2825      jr      z,$8391
836c 47        ld      b,a
836d cd2b83    call    $832b
8370 b8        cp      b
8371 3007      jr      nc,$837a
8373 78        ld      a,b
8374 d608      sub     $08
8376 3819      jr      c,$8391
8378 18ee      jr      $8368
837a 90        sub     b
837b fe4e      cp      $4e
837d 3012      jr      nc,$8391
837f cd3683    call    $8336
8382 4f        ld      c,a
8383 78        ld      a,b
8384 cd1c83    call    $831c
8387 78        ld      a,b
8388 91        sub     c
8389 47        ld      b,a
838a cd3a83    call    $833a
838d 90        sub     b
838e cd4a83    call    $834a
8391 c1        pop     bc
8392 c9        ret     

8393 cd0d4a    call    $4a0d
8396 300b      jr      nc,$83a3
8398 3a0084    ld      a,($8400)
839b fe02      cp      $02
839d 3804      jr      c,$83a3
839f fe19      cp      $19
83a1 3801      jr      c,$83a4
83a3 97        sub     a
83a4 c9        ret     

83a5 f5        push    af
83a6 cd9383    call    $8393
83a9 b7        or      a
83aa 2804      jr      z,$83b0
83ac 3c        inc     a
83ad 320084    ld      ($8400),a
83b0 f1        pop     af
83b1 c9        ret     

83b2 f5        push    af
83b3 cd9383    call    $8393
83b6 b7        or      a
83b7 2804      jr      z,$83bd
83b9 3d        dec     a
83ba 320084    ld      ($8400),a
83bd f1        pop     af
83be c9        ret     

83bf f5        push    af
83c0 cd9383    call    $8393
83c3 c4cb03    call    nz,$03cb
83c6 f1        pop     af
83c7 c9        ret     

83c8 f5        push    af
83c9 cd9383    call    $8393
83cc c4e403    call    nz,$03e4
83cf f1        pop     af
83d0 c9        ret     

83d1 d5        push    de
83d2 3a0084    ld      a,($8400)
83d5 5f        ld      e,a
83d6 1601      ld      d,$01
83d8 cdc883    call    $83c8
83db cd2e04    call    $042e		CDOS: set special crt function
83de cd0f02    call    $020f
83e1 97        sub     a
83e2 320084    ld      ($8400),a
83e5 d1        pop     de
83e6 c9        ret     

83e7 1601      ld      d,$01
83e9 cd2e04    call    $042e		CDOS: set special crt function
83ec cdfc01    call    $01fc
83ef 7b        ld      a,e
83f0 320084    ld      ($8400),a
83f3 cdfd03    call    $03fd
83f6 c9        ret     

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
8402 e5        push    hl
8403 dde5      push    ix
8405 dd7e00    ld      a,(ix+$00)
8408 b7        or      a
8409 2008      jr      nz,$8413
840b e5        push    hl
840c dde1      pop     ix
840e cd0544    call    $4405
8411 1821      jr      $8434
8413 fde5      push    iy
8415 e1        pop     hl
8416 fd21268a  ld      iy,$8a26
841a cd3884    call    $8438
841d b7        or      a
841e 2814      jr      z,$8434
8420 326072    ld      ($7260),a
8423 4f        ld      c,a
8424 0d        dec     c
8425 2805      jr      z,$842c
8427 cd5d71    call    $715d
842a 18f8      jr      $8424
842c fde5      push    iy
842e e1        pop     hl
842f cd7971    call    $7179
8432 3600      ld      (hl),$00
8434 dde1      pop     ix
8436 e1        pop     hl
8437 c9        ret     

8438 c5        push    bc
8439 d5        push    de
843a e5        push    hl
843b 220e85    ld      ($850e),hl
843e 3a6e8a    ld      a,($8a6e)
8441 f5        push    af
8442 0600      ld      b,$00
8444 fde5      push    iy
8446 d1        pop     de
8447 cdec7c    call    $7cec
844a feeb      cp      $eb
844c 202e      jr      nz,$847c
844e cd1085    call    $8510
8451 b7        or      a
8452 2817      jr      z,$846b
8454 fe01      cp      $01
8456 2806      jr      z,$845e
8458 cd5b88    call    $885b
845b b7        or      a
845c 280d      jr      z,$846b
845e d5        push    de
845f 118e89    ld      de,$898e
8462 cd1886    call    $8618
8465 d1        pop     de
8466 cda885    call    $85a8
8469 18dc      jr      $8447
846b cd0f88    call    $880f
846e cd3d88    call    $883d
8471 79        ld      a,c
8472 b7        or      a
8473 ca0085    jp      z,$8500
8476 cda885    call    $85a8
8479 c30085    jp      $8500
847c fefb      cp      $fb
847e 2005      jr      nz,$8485
8480 cd3e89    call    $893e
8483 18c2      jr      $8447
8485 fe08      cp      $08
8487 2804      jr      z,$848d
8489 fe7f      cp      $7f
848b 2010      jr      nz,$849d
848d 78        ld      a,b
848e b7        or      a
848f 2807      jr      z,$8498
8491 cdf285    call    $85f2
8494 1b        dec     de
8495 05        dec     b
8496 18af      jr      $8447
8498 cd2202    call    $0222
849b 18aa      jr      $8447
849d fe0d      cp      $0d
849f 2804      jr      z,$84a5
84a1 fe20      cp      $20
84a3 2033      jr      nz,$84d8
84a5 cd1085    call    $8510
84a8 b7        or      a
84a9 281a      jr      z,$84c5
84ab fe01      cp      $01
84ad 281b      jr      z,$84ca
84af cd5b88    call    $885b
84b2 fe01      cp      $01
84b4 2814      jr      z,$84ca
84b6 cd0f88    call    $880f
84b9 cd3d88    call    $883d
84bc 79        ld      a,c
84bd b7        or      a
84be 2840      jr      z,$8500
84c0 cda885    call    $85a8
84c3 183b      jr      $8500
84c5 cd0f88    call    $880f
84c8 1836      jr      $8500
84ca d5        push    de
84cb 118e89    ld      de,$898e
84ce cd1886    call    $8618
84d1 d1        pop     de
84d2 cda885    call    $85a8
84d5 c34784    jp      $8447
84d8 fe1b      cp      $1b
84da 2007      jr      nz,$84e3
84dc cd6888    call    $8868
84df 0e00      ld      c,$00
84e1 181d      jr      $8500
84e3 cdb28c    call    $8cb2
84e6 3012      jr      nc,$84fa
84e8 cdbf85    call    $85bf
84eb da4784    jp      c,$8447
84ee cd7844    call    $4478		write char in A
84f1 cd7c8c    call    $8c7c
84f4 12        ld      (de),a
84f5 13        inc     de
84f6 04        inc     b
84f7 c34784    jp      $8447
84fa cd2202    call    $0222
84fd c34784    jp      $8447
8500 f1        pop     af
8501 57        ld      d,a
8502 3a6e8a    ld      a,($8a6e)
8505 92        sub     d
8506 47        ld      b,a
8507 79        ld      a,c
8508 e1        pop     hl
8509 d1        pop     de
850a e3        ex      (sp),hl
850b 4d        ld      c,l
850c e1        pop     hl
850d c9        ret     

850e 00        nop     
850f 00        nop     
8510 fde5      push    iy
8512 dde5      push    ix
8514 0e01      ld      c,$01
8516 cd5185    call    $8551
8519 280c      jr      z,$8527
851b cd5d71    call    $715d
851e 0c        inc     c
851f dd7e00    ld      a,(ix+$00)
8522 b7        or      a
8523 2825      jr      z,$854a
8525 18ef      jr      $8516
8527 dde5      push    ix
8529 e1        pop     hl
852a cd5d71    call    $715d
852d dd7e00    ld      a,(ix+$00)
8530 b7        or      a
8531 2805      jr      z,$8538
8533 cd5185    call    $8551
8536 2803      jr      z,$853b
8538 97        sub     a
8539 1811      jr      $854c
853b e5        push    hl
853c 78        ld      a,b
853d cd5d8c    call    $8c5d
8540 3eff      ld      a,$ff
8542 be        cp      (hl)
8543 e1        pop     hl
8544 28f2      jr      z,$8538
8546 3e01      ld      a,$01
8548 1802      jr      $854c
854a 3e02      ld      a,$02
854c dde1      pop     ix
854e fde1      pop     iy
8550 c9        ret     

8551 dde5      push    ix
8553 fde5      push    iy
8555 c5        push    bc
8556 04        inc     b
8557 05        dec     b
8558 280e      jr      z,$8568
855a fd7e00    ld      a,(iy+$00)
855d fd23      inc     iy
855f ddbe00    cp      (ix+$00)
8562 2004      jr      nz,$8568
8564 dd23      inc     ix
8566 18ef      jr      $8557
8568 c1        pop     bc
8569 fde1      pop     iy
856b dde1      pop     ix
856d c9        ret     

856e c5        push    bc
856f d5        push    de
8570 cd1086    call    $8610
8573 1601      ld      d,$01		set cursor pos at 1,1 -> home
8575 1e01      ld      e,$01
8577 cd2e04    call    $042e		CDOS: set special crt function
857a cd4202    call    $0242
857d 164f      ld      d,$4f		set cursor pos
857f 1e01      ld      e,$01
8581 cd2e04    call    $042e		CDOS: set special crt function
8584 97        sub     a
8585 cd6503    call    $0365
8588 1601      ld      d,$01		set cursor pos at 1,1 -> home
858a 1e01      ld      e,$01
858c cd2e04    call    $042e		CDOS: set special crt function
858f 11a489    ld      de,$89a4
8592 0e09      ld      c,$09
8594 cd0500    call    $0005
8597 97        sub     a
8598 326e8a    ld      ($8a6e),a
859b d1        pop     de
859c c1        pop     bc
859d c9        ret     

859e f5        push    af
859f c5        push    bc
85a0 d5        push    de
85a1 cd0886    call    $8608
85a4 d1        pop     de
85a5 c1        pop     bc
85a6 f1        pop     af
85a7 c9        ret     

85a8 c5        push    bc
85a9 d5        push    de
85aa cd1086    call    $8610
85ad 3a6e8a    ld      a,($8a6e)
85b0 c609      add     a,$09
85b2 57        ld      d,a
85b3 1e01      ld      e,$01
85b5 cd2e04    call    $042e		CDOS: set special crt function
85b8 d1        pop     de
85b9 c1        pop     bc
85ba c9        ret     

85bb 326e8a    ld      ($8a6e),a
85be c9        ret     

85bf 32ad89    ld      ($89ad),a
85c2 3a6e8a    ld      a,($8a6e)
85c5 3c        inc     a
85c6 fe46      cp      $46
85c8 3808      jr      c,$85d2
85ca d5        push    de
85cb cd2202    call    $0222
85ce d1        pop     de
85cf 37        scf     
85d0 1804      jr      $85d6
85d2 326e8a    ld      ($8a6e),a
85d5 b7        or      a
85d6 3aad89    ld      a,($89ad)
85d9 c9        ret     

85da c5        push    bc
85db 47        ld      b,a
85dc 3a6e8a    ld      a,($8a6e)
85df 80        add     a,b
85e0 fe46      cp      $46
85e2 3808      jr      c,$85ec
85e4 d5        push    de
85e5 cd2202    call    $0222
85e8 d1        pop     de
85e9 37        scf     
85ea 1804      jr      $85f0
85ec 326e8a    ld      ($8a6e),a
85ef b7        or      a
85f0 c1        pop     bc
85f1 c9        ret     

85f2 cd0603    call    $0306
85f5 3a6e8a    ld      a,($8a6e)
85f8 3d        dec     a
85f9 326e8a    ld      ($8a6e),a
85fc c9        ret     

85fd c5        push    bc
85fe d5        push    de
85ff cd0886    call    $8608
8602 cd3e03    call    $033e		clear screen
8605 d1        pop     de
8606 c1        pop     bc
8607 c9        ret     

8608 f5        push    af
8609 3e01      ld      a,$01
860b cdcb03    call    $03cb
860e f1        pop     af
860f c9        ret     

8610 f5        push    af
8611 3e01      ld      a,$01
8613 cde403    call    $03e4
8616 f1        pop     af
8617 c9        ret     

8618 e5        push    hl
8619 dde5      push    ix
861b fde5      push    iy
861d d5        push    de
861e dde1      pop     ix
8620 cd9d43    call    $439d
8623 cd3002    call    $0230
8626 cd3002    call    $0230
8629 22d489    ld      ($89d4),hl
862c ed5ba38a  ld      de,($8aa3)
8630 ed53d689  ld      ($89d6),de
8634 110000    ld      de,$0000
8637 97        sub     a
8638 32dc89    ld      ($89dc),a
863b e5        push    hl
863c dde1      pop     ix
863e cdaf87    call    $87af
8641 13        inc     de
8642 30fa      jr      nc,$863e
8644 cb43      bit     0,e
8646 2005      jr      nz,$864d
8648 3e01      ld      a,$01
864a 32dc89    ld      ($89dc),a
864d 3f        ccf     
864e cb1a      rr      d
8650 cb1b      rr      e
8652 dde5      push    ix
8654 e1        pop     hl
8655 dd21d489  ld      ix,$89d4
8659 7c        ld      a,h
865a ddbe01    cp      (ix+$01)
865d 2004      jr      nz,$8663
865f 7d        ld      a,l
8660 ddbe00    cp      (ix+$00)
8663 200b      jr      nz,$8670
8665 11958a    ld      de,$8a95
8668 0e09      ld      c,$09
866a cd0500    call    $0005
866d c38087    jp      $8780
8670 7a        ld      a,d
8671 b3        or      e
8672 202a      jr      nz,$869e
8674 dd2ad689  ld      ix,($89d6)
8678 dd22a38a  ld      ($8aa3),ix
867c dd2ad489  ld      ix,($89d4)
8680 cd5185    call    $8551
8683 2806      jr      z,$868b
8685 cdaf87    call    $87af
8688 b7        or      a
8689 28da      jr      z,$8665
868b 0e00      ld      c,$00
868d 21ae89    ld      hl,$89ae
8690 cd8b87    call    $878b
8693 3624      ld      (hl),$24
8695 cdf687    call    $87f6
8698 cd3589    call    $8935
869b c38087    jp      $8780
869e cdd187    call    $87d1
86a1 1b        dec     de
86a2 7a        ld      a,d
86a3 b3        or      e
86a4 20f8      jr      nz,$869e
86a6 22d889    ld      ($89d8),hl
86a9 dd2aa38a  ld      ix,($8aa3)
86ad dd2b      dec     ix
86af dd22da89  ld      ($89da),ix
86b3 dd2ad689  ld      ix,($89d6)
86b7 dd22a38a  ld      ($8aa3),ix
86bb dd2ad489  ld      ix,($89d4)
86bf 3e00      ld      a,$00
86c1 32dd89    ld      ($89dd),a
86c4 0e00      ld      c,$00
86c6 21ae89    ld      hl,$89ae
86c9 cd8b87    call    $878b
86cc 3624      ld      (hl),$24
86ce 3add89    ld      a,($89dd)
86d1 cb47      bit     0,a
86d3 280c      jr      z,$86e1
86d5 3c        inc     a
86d6 32dd89    ld      ($89dd),a
86d9 cdf687    call    $87f6
86dc cd3589    call    $8935
86df 1818      jr      $86f9
86e1 3c        inc     a
86e2 32dd89    ld      ($89dd),a
86e5 79        ld      a,c
86e6 cdf687    call    $87f6
86e9 cd3589    call    $8935
86ec 1e09      ld      e,$09
86ee 0e02      ld      c,$02
86f0 cd0500    call    $0005
86f3 c608      add     a,$08
86f5 fe28      cp      $28
86f7 38f3      jr      c,$86ec
86f9 3add89    ld      a,($89dd)
86fc cb47      bit     0,a
86fe 281a      jr      z,$871a
8700 dd22d489  ld      ($89d4),ix
8704 dd2aa38a  ld      ix,($8aa3)
8708 dd22d689  ld      ($89d6),ix
870c dd2ada89  ld      ix,($89da)
8710 dd22a38a  ld      ($8aa3),ix
8714 dd2ad889  ld      ix,($89d8)
8718 1840      jr      $875a
871a 3adc89    ld      a,($89dc)
871d cb47      bit     0,a
871f 2817      jr      z,$8738
8721 dde5      push    ix
8723 dd2aa38a  ld      ix,($8aa3)
8727 dd22da89  ld      ($89da),ix
872b dde1      pop     ix
872d dd22d889  ld      ($89d8),ix
8731 cdaf87    call    $87af
8734 384a      jr      c,$8780
8736 180c      jr      $8744
8738 dd22d889  ld      ($89d8),ix
873c dd2aa38a  ld      ix,($8aa3)
8740 dd22da89  ld      ($89da),ix
8744 dd2ad689  ld      ix,($89d6)
8748 dd22a38a  ld      ($8aa3),ix
874c dd2ad489  ld      ix,($89d4)
8750 3add89    ld      a,($89dd)
8753 fe28      cp      $28
8755 280f      jr      z,$8766
8757 cd3002    call    $0230
875a cdaf87    call    $87af
875d dd7e00    ld      a,(ix+$00)
8760 b7        or      a
8761 281d      jr      z,$8780
8763 c3c486    jp      $86c4
8766 cd8643    call    $4386
8769 2815      jr      z,$8780
876b d5        push    de
876c 1601      ld      d,$01		set cursor pos
876e 1e04      ld      e,$04
8770 cd2e04    call    $042e		CDOS: set special crt function
8773 d1        pop     de
8774 cd5503    call    $0355
8777 cd3002    call    $0230
877a 97        sub     a
877b 32dd89    ld      ($89dd),a
877e 18da      jr      $875a
8780 3e00      ld      a,$00
8782 32a78a    ld      ($8aa7),a
8785 fde1      pop     iy
8787 dde1      pop     ix
8789 e1        pop     hl
878a c9        ret     

878b f5        push    af
878c d5        push    de
878d dde5      push    ix
878f cd7971    call    $7179
8792 3aa78a    ld      a,($8aa7)
8795 b7        or      a
8796 2812      jr      z,$87aa
8798 dd2aa38a  ld      ix,($8aa3)
879c dd5e00    ld      e,(ix+$00)
879f 1600      ld      d,$00
87a1 dd2aa58a  ld      ix,($8aa5)
87a5 dd19      add     ix,de
87a7 cd7971    call    $7179
87aa dde1      pop     ix
87ac d1        pop     de
87ad f1        pop     af
87ae c9        ret     

87af cd5d71    call    $715d
87b2 3aa78a    ld      a,($8aa7)
87b5 b7        or      a
87b6 280b      jr      z,$87c3
87b8 d5        push    de
87b9 ed5ba38a  ld      de,($8aa3)
87bd 13        inc     de
87be ed53a38a  ld      ($8aa3),de
87c2 d1        pop     de
87c3 dd7e00    ld      a,(ix+$00)
87c6 b7        or      a
87c7 2806      jr      z,$87cf
87c9 cd5185    call    $8551
87cc c8        ret     z

87cd 18e0      jr      $87af
87cf 37        scf     
87d0 c9        ret     

87d1 cd6a71    call    $716a
87d4 3aa78a    ld      a,($8aa7)
87d7 b7        or      a
87d8 280b      jr      z,$87e5
87da d5        push    de
87db ed5ba38a  ld      de,($8aa3)
87df 1b        dec     de
87e0 ed53a38a  ld      ($8aa3),de
87e4 d1        pop     de
87e5 7e        ld      a,(hl)
87e6 b7        or      a
87e7 280b      jr      z,$87f4
87e9 e5        push    hl
87ea dde1      pop     ix
87ec dd23      inc     ix
87ee cd5185    call    $8551
87f1 c8        ret     z

87f2 18dd      jr      $87d1
87f4 37        scf     
87f5 c9        ret     

87f6 f5        push    af
87f7 21ae89    ld      hl,$89ae
87fa 23        inc     hl
87fb 1804      jr      $8801
87fd f5        push    af
87fe 21ae89    ld      hl,$89ae
8801 7e        ld      a,(hl)
8802 fe24      cp      $24
8804 2807      jr      z,$880d
8806 cd838c    call    $8c83
8809 77        ld      (hl),a
880a 23        inc     hl
880b 18f4      jr      $8801
880d f1        pop     af
880e c9        ret     

880f f5        push    af
8810 c5        push    bc
8811 d5        push    de
8812 dde5      push    ix
8814 78        ld      a,b
8815 cd5d8c    call    $8c5d
8818 54        ld      d,h
8819 5d        ld      e,l
881a e5        push    hl
881b dde1      pop     ix
881d 21ae89    ld      hl,$89ae
8820 0e01      ld      c,$01
8822 cd7971    call    $7179
8825 3620      ld      (hl),$20
8827 23        inc     hl
8828 3624      ld      (hl),$24
882a 3a6e8a    ld      a,($8a6e)
882d 81        add     a,c
882e 326e8a    ld      ($8a6e),a
8831 cdfd87    call    $87fd
8834 cd3589    call    $8935
8837 dde1      pop     ix
8839 d1        pop     de
883a c1        pop     bc
883b f1        pop     af
883c c9        ret     

883d f5        push    af
883e d5        push    de
883f dde5      push    ix
8841 c5        push    bc
8842 dd217b8a  ld      ix,$8a7b
8846 cd9d43    call    $439d
8849 cd2e44    call    $442e
884c 3807      jr      c,$8855
884e cd6888    call    $8868
8851 c1        pop     bc
8852 0e00      ld      c,$00
8854 c5        push    bc
8855 c1        pop     bc
8856 dde1      pop     ix
8858 d1        pop     de
8859 f1        pop     af
885a c9        ret     

885b cdf285    call    $85f2
885e 05        dec     b
885f 1b        dec     de
8860 cd1085    call    $8510
8863 fe02      cp      $02
8865 28f4      jr      z,$885b
8867 c9        ret     

8868 d5        push    de
8869 cda885    call    $85a8
886c 1608      ld      d,$08		set cursor pos
886e 1e01      ld      e,$01
8870 cd2e04    call    $042e		CDOS: set special crt function
8873 cd4202    call    $0242
8876 116f8a    ld      de,$8a6f
8879 0e09      ld      c,$09
887b cd0500    call    $0005
887e d1        pop     de
887f c9        ret     

8880 3d        dec     a
8881 cb27      sla     a
8883 cd5d8c    call    $8c5d
8886 7e        ld      a,(hl)
8887 23        inc     hl
8888 66        ld      h,(hl)
8889 6f        ld      l,a
888a e9        jp      (hl)
888b 04        inc     b
888c 1001      djnz    $888f
888e c9        ret     

888f cdf285    call    $85f2
8892 18f8      jr      $888c
8894 d5        push    de
8895 e5        push    hl
8896 0600      ld      b,$00
8898 fde5      push    iy
889a e1        pop     hl
889b cd527e    call    $7e52
889e 3003      jr      nc,$88a3
88a0 97        sub     a
88a1 1835      jr      $88d8
88a3 fe08      cp      $08
88a5 2804      jr      z,$88ab
88a7 fe7f      cp      $7f
88a9 2009      jr      nz,$88b4
88ab cddb88    call    $88db
88ae feff      cp      $ff
88b0 2826      jr      z,$88d8
88b2 18e7      jr      $889b
88b4 fe0d      cp      $0d
88b6 2807      jr      z,$88bf
88b8 b9        cp      c
88b9 2804      jr      z,$88bf
88bb fe20      cp      $20
88bd 200a      jr      nz,$88c9
88bf cdeb88    call    $88eb
88c2 2014      jr      nz,$88d8
88c4 cd2202    call    $0222
88c7 18d2      jr      $889b
88c9 cdb28c    call    $8cb2
88cc 3005      jr      nc,$88d3
88ce cdfe88    call    $88fe
88d1 18c8      jr      $889b
88d3 cd2202    call    $0222
88d6 18c3      jr      $889b
88d8 e1        pop     hl
88d9 d1        pop     de
88da c9        ret     

88db 78        ld      a,b
88dc b7        or      a
88dd 2807      jr      z,$88e6
88df cdf285    call    $85f2
88e2 05        dec     b
88e3 2b        dec     hl
88e4 1803      jr      $88e9
88e6 cd2202    call    $0222
88e9 97        sub     a
88ea c9        ret     

88eb 78        ld      a,b
88ec b7        or      a
88ed 280e      jr      z,$88fd
88ef cdbf85    call    $85bf
88f2 3807      jr      c,$88fb
88f4 1e20      ld      e,$20
88f6 0e02      ld      c,$02
88f8 cd0500    call    $0005
88fb 3600      ld      (hl),$00
88fd c9        ret     

88fe f5        push    af
88ff 78        ld      a,b
8900 fe08      cp      $08
8902 381c      jr      c,$8920
8904 c5        push    bc
8905 e5        push    hl
8906 2b        dec     hl
8907 010300    ld      bc,$0003
890a 3e2e      ld      a,$2e
890c edb9      cpdr    
890e e1        pop     hl
890f c1        pop     bc
8910 280e      jr      z,$8920
8912 f1        pop     af
8913 fe2e      cp      $2e
8915 201a      jr      nz,$8931
8917 78        ld      a,b
8918 fe08      cp      $08
891a 2015      jr      nz,$8931
891c 3e2e      ld      a,$2e
891e 1801      jr      $8921
8920 f1        pop     af
8921 cdbf85    call    $85bf
8924 380b      jr      c,$8931
8926 cd7844    call    $4478		write char in A
8929 cd7c8c    call    $8c7c
892c 77        ld      (hl),a
892d 23        inc     hl
892e 04        inc     b
892f 1803      jr      $8934
8931 cd2202    call    $0222
8934 c9        ret     

8935 11ae89    ld      de,$89ae
8938 0e09      ld      c,$09
893a cd0500    call    $0005
893d c9        ret     

893e cd7d7a    call    $7a7d
8941 3006      jr      nc,$8949
8943 cd6482    call    $8264
8946 cd5202    call    $0252
8949 cda885    call    $85a8
894c c9        ret     

894d cd3a83    call    $833a
8950 327389    ld      ($8973),a
8953 cd3e83    call    $833e
8956 327489    ld      ($8974),a
8959 cd3683    call    $8336
895c 327589    ld      ($8975),a
895f c9        ret     

8960 3a7389    ld      a,($8973)
8963 cd4a83    call    $834a
8966 3a7489    ld      a,($8974)
8969 cd4683    call    $8346
896c 3a7589    ld      a,($8975)
896f cd1c83    call    $831c
8972 c9        ret     

8973 00        nop     
8974 00        nop     
8975 00        nop     
8976 d5        push    de
8977 e5        push    hl
8978 0600      ld      b,$00
897a 7e        ld      a,(hl)
897b fe24      cp      $24
897d 280c      jr      z,$898b
897f cdbf85    call    $85bf
8982 3807      jr      c,$898b
8984 cd7844    call    $4478		write char in A
8987 23        inc     hl
8988 04        inc     b
8989 18ef      jr      $897a
898b e1        pop     hl
898c d1        pop     de
898d c9        ret     

898e 4f        ld      c,a
898f 6e        ld      l,(hl)
8990 65        ld      h,l
8991 206f      jr      nz,$8a02
8993 66        ld      h,(hl)
8994 2074      jr      nz,$8a0a
8996 68        ld      l,b
8997 65        ld      h,l
8998 2066      jr      nz,$8a00
899a 6f        ld      l,a
899b 6c        ld      l,h
899c 6c        ld      l,h
899d 6f        ld      l,a
899e 77        ld      (hl),a
899f 69        ld      l,c
89a0 6e        ld      l,(hl)
89a1 67        ld      h,a
89a2 3a2443    ld      a,($4324)
89a5 4f        ld      c,a
89a6 4d        ld      c,l
89a7 4d        ld      c,l
89a8 41        ld      b,c
89a9 4e        ld      c,(hl)
89aa 44        ld      b,h
89ab 3a2400    ld      a,($0024)
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
89dc 00        nop     
89dd 00        nop     
89de 00        nop     
89df 00        nop     
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
8a6f 2043      jr      nz,$8ab4
8a71 41        ld      b,c
8a72 4e        ld      c,(hl)
8a73 43        ld      b,e
8a74 45        ld      b,l
8a75 4c        ld      c,h
8a76 4c        ld      c,h
8a77 45        ld      b,l
8a78 44        ld      b,h
8a79 2e24      ld      l,$24
8a7b 49        ld      c,c
8a7c 73        ld      (hl),e
8a7d 2074      jr      nz,$8af3
8a7f 68        ld      l,b
8a80 61        ld      h,c
8a81 74        ld      (hl),h
8a82 2077      jr      nz,$8afb
8a84 68        ld      l,b
8a85 61        ld      h,c
8a86 74        ld      (hl),h
8a87 2079      jr      nz,$8b02
8a89 6f        ld      l,a
8a8a 75        ld      (hl),l
8a8b 206d      jr      nz,$8afa
8a8d 65        ld      h,l
8a8e 61        ld      h,c
8a8f 6e        ld      l,(hl)
8a90 74        ld      (hl),h
8a91 3f        ccf     
8a92 0d        dec     c
8a93 0a        ld      a,(bc)
8a94 24        inc     h
8a95 2a2a2a    ld      hl,($2a2a)
8a98 2065      jr      nz,$8aff
8a9a 6d        ld      l,l
8a9b 70        ld      (hl),b
8a9c 74        ld      (hl),h
8a9d 79        ld      a,c
8a9e 202a      jr      nz,$8aca
8aa0 2a2a24    ld      hl,($242a)
8aa3 00        nop     
8aa4 00        nop     
8aa5 00        nop     
8aa6 00        nop     
8aa7 00        nop     

8aa8 fd7500    ld      (iy+$00),l	[IY, IY+1]=HL, [IY+2, IY+3]=DE
8aab fd7401    ld      (iy+$01),h
8aae fd7302    ld      (iy+$02),e
8ab1 fd7203    ld      (iy+$03),d
8ab4 c9        ret     

8ab5 fd6e00    ld      l,(iy+$00)	HL=[IY, IY+1], DE=[IY+2, IY+3]
8ab8 fd6601    ld      h,(iy+$01)
8abb fd5e02    ld      e,(iy+$02)
8abe fd5603    ld      d,(iy+$03)
8ac1 c9        ret     

8ac2 c5        push    bc
8ac3 fd4e00    ld      c,(iy+$00)
8ac6 fd4601    ld      b,(iy+$01)
8ac9 09        add     hl,bc
8aca fd4e02    ld      c,(iy+$02)
8acd fd4603    ld      b,(iy+$03)
8ad0 eb        ex      de,hl
8ad1 ed4a      adc     hl,bc
8ad3 eb        ex      de,hl
8ad4 c1        pop     bc
8ad5 c9        ret     

8ad6 c5        push    bc
8ad7 fd4e00    ld      c,(iy+$00)
8ada fd4601    ld      b,(iy+$01)
8add b7        or      a
8ade ed42      sbc     hl,bc
8ae0 fd4e02    ld      c,(iy+$02)
8ae3 fd4603    ld      b,(iy+$03)
8ae6 eb        ex      de,hl
8ae7 ed42      sbc     hl,bc
8ae9 eb        ex      de,hl
8aea c1        pop     bc
8aeb c9        ret     

8aec 7a        ld      a,d
8aed fdbe03    cp      (iy+$03)
8af0 2004      jr      nz,$8af6
8af2 7b        ld      a,e
8af3 fdbe02    cp      (iy+$02)
8af6 200a      jr      nz,$8b02
8af8 7c        ld      a,h
8af9 fdbe01    cp      (iy+$01)
8afc 2004      jr      nz,$8b02
8afe 7d        ld      a,l
8aff fdbe00    cp      (iy+$00)
8b02 c9        ret     

8b03 fd3400    inc     (iy+$00)
8b06 200d      jr      nz,$8b15
8b08 fd3401    inc     (iy+$01)
8b0b 2008      jr      nz,$8b15
8b0d fd3402    inc     (iy+$02)
8b10 2003      jr      nz,$8b15
8b12 fd3403    inc     (iy+$03)
8b15 c9        ret     

8b16 fd7e00    ld      a,(iy+$00)
8b19 b7        or      a
8b1a 2015      jr      nz,$8b31
8b1c fd7e01    ld      a,(iy+$01)
8b1f b7        or      a
8b20 200c      jr      nz,$8b2e
8b22 fd7e02    ld      a,(iy+$02)
8b25 b7        or      a
8b26 2003      jr      nz,$8b2b
8b28 fd3503    dec     (iy+$03)
8b2b fd3502    dec     (iy+$02)
8b2e fd3501    dec     (iy+$01)
8b31 fd3500    dec     (iy+$00)
8b34 c9        ret     

8b35 fd360000  ld      (iy+$00),$00
8b39 fd360100  ld      (iy+$01),$00
8b3d fd360200  ld      (iy+$02),$00
8b41 fd360300  ld      (iy+$03),$00
8b45 c9        ret     

8b46 210000    ld      hl,$0000
8b49 0a        ld      a,(bc)
8b4a d630      sub     $30
8b4c f8        ret     m

8b4d fe0a      cp      $0a
8b4f d0        ret     nc

8b50 54        ld      d,h
8b51 5d        ld      e,l
8b52 29        add     hl,hl
8b53 29        add     hl,hl
8b54 19        add     hl,de
8b55 29        add     hl,hl
8b56 5f        ld      e,a
8b57 1600      ld      d,$00
8b59 19        add     hl,de
8b5a 03        inc     bc
8b5b c3498b    jp      $8b49
8b5e af        xor     a
8b5f c3698b    jp      $8b69
8b62 3e30      ld      a,$30
8b64 c3698b    jp      $8b69
8b67 3e20      ld      a,$20
8b69 32e58b    ld      ($8be5),a
8b6c 22e68b    ld      ($8be6),hl
8b6f 60        ld      h,b
8b70 69        ld      l,c
8b71 7c        ld      a,h
8b72 b7        or      a
8b73 3e20      ld      a,$20
8b75 f27d8b    jp      p,$8b7d
8b78 cddd8b    call    $8bdd
8b7b 3e2d      ld      a,$2d
8b7d cdbe8b    call    $8bbe
8b80 010500    ld      bc,$0005
8b83 11f0d8    ld      de,$d8f0
8b86 cda58b    call    $8ba5
8b89 1118fc    ld      de,$fc18
8b8c cda58b    call    $8ba5
8b8f 119cff    ld      de,$ff9c
8b92 cda58b    call    $8ba5
8b95 11f6ff    ld      de,$fff6
8b98 cda58b    call    $8ba5
8b9b 11ffff    ld      de,$ffff
8b9e cda58b    call    $8ba5
8ba1 2ae68b    ld      hl,($8be6)
8ba4 c9        ret     

8ba5 c5        push    bc
8ba6 062f      ld      b,$2f
8ba8 04        inc     b
8ba9 19        add     hl,de
8baa 7c        ld      a,h
8bab 17        rla     
8bac d2a88b    jp      nc,$8ba8
8baf eb        ex      de,hl
8bb0 cddd8b    call    $8bdd
8bb3 19        add     hl,de
8bb4 78        ld      a,b
8bb5 c1        pop     bc
8bb6 fe30      cp      $30
8bb8 cac98b    jp      z,$8bc9
8bbb 0680      ld      b,$80
8bbd 0d        dec     c
8bbe e5        push    hl
8bbf 2ae68b    ld      hl,($8be6)
8bc2 77        ld      (hl),a
8bc3 23        inc     hl
8bc4 22e68b    ld      ($8be6),hl
8bc7 e1        pop     hl
8bc8 c9        ret     

8bc9 80        add     a,b
8bca f2d18b    jp      p,$8bd1
8bcd 90        sub     b
8bce c3bd8b    jp      $8bbd
8bd1 0d        dec     c
8bd2 cacd8b    jp      z,$8bcd
8bd5 3ae58b    ld      a,($8be5)
8bd8 a7        and     a
8bd9 c2be8b    jp      nz,$8bbe
8bdc c9        ret     

8bdd 7d        ld      a,l
8bde 2f        cpl     
8bdf 6f        ld      l,a
8be0 7c        ld      a,h
8be1 2f        cpl     
8be2 67        ld      h,a
8be3 23        inc     hl
8be4 c9        ret     

8be5 00        nop     
8be6 00        nop     
8be7 00        nop     
8be8 c5        push    bc
8be9 010000    ld      bc,$0000
8bec 0c        inc     c
8bed dde3      ex      (sp),ix
8bef dde3      ex      (sp),ix
8bf1 20f9      jr      nz,$8bec
8bf3 04        inc     b
8bf4 20f6      jr      nz,$8bec
8bf6 3c        inc     a
8bf7 20f3      jr      nz,$8bec
8bf9 c1        pop     bc
8bfa c9        ret     

8bfb c5        push    bc
8bfc 0e00      ld      c,$00
8bfe 069c      ld      b,$9c
8c00 0c        inc     c
8c01 20fd      jr      nz,$8c00
8c03 04        inc     b
8c04 20fa      jr      nz,$8c00
8c06 3c        inc     a
8c07 20f3      jr      nz,$8bfc
8c09 c1        pop     bc
8c0a c9        ret     

8c0b cd0500    call    $0005
8c0e 3c        inc     a
8c0f 20fa      jr      nz,$8c0b
8c11 c9        ret     

8c12 dd3520    dec     (ix+$20)
8c15 dd7e20    ld      a,(ix+$20)
8c18 b7        or      a
8c19 f0        ret     p

8c1a dd362000  ld      (ix+$20),$00
8c1e dd7e0c    ld      a,(ix+$0c)
8c21 d601      sub     $01
8c23 f8        ret     m

8c24 d5        push    de
8c25 c5        push    bc
8c26 dde5      push    ix
8c28 d1        pop     de
8c29 0e10      ld      c,$10
8c2b cd0500    call    $0005
8c2e feff      cp      $ff
8c30 2004      jr      nz,$8c36
8c32 3efe      ld      a,$fe
8c34 1824      jr      $8c5a
8c36 3a0800    ld      a,($0008)
8c39 feff      cp      $ff
8c3b 2005      jr      nz,$8c42
8c3d 0e9e      ld      c,$9e
8c3f cd0500    call    $0005
8c42 dd350c    dec     (ix+$0c)
8c45 0e0f      ld      c,$0f
8c47 cd0500    call    $0005
8c4a feff      cp      $ff
8c4c 2004      jr      nz,$8c52
8c4e 3efd      ld      a,$fd
8c50 1808      jr      $8c5a
8c52 dd7e0f    ld      a,(ix+$0f)
8c55 3d        dec     a
8c56 dd7720    ld      (ix+$20),a
8c59 af        xor     a
8c5a c1        pop     bc
8c5b d1        pop     de
8c5c c9        ret     

8c5d 85        add     a,l
8c5e 6f        ld      l,a
8c5f d0        ret     nc

8c60 24        inc     h
8c61 c9        ret     

8c62 83        add     a,e
8c63 5f        ld      e,a
8c64 d0        ret     nc

8c65 14        inc     d
8c66 c9        ret     

8c67 81        add     a,c
8c68 4f        ld      c,a
8c69 d0        ret     nc

8c6a 04        inc     b
8c6b c9        ret     

8c6c c5        push    bc
8c6d 4f        ld      c,a
8c6e 0600      ld      b,$00
8c70 dd09      add     ix,bc
8c72 c1        pop     bc
8c73 c9        ret     

8c74 c5        push    bc
8c75 4f        ld      c,a
8c76 0600      ld      b,$00
8c78 fd09      add     iy,bc
8c7a c1        pop     bc
8c7b c9        ret     

8c7c cd918c    call    $8c91
8c7f d0        ret     nc

8c80 d620      sub     $20
8c82 c9        ret     

8c83 cd8a8c    call    $8c8a
8c86 d0        ret     nc

8c87 c620      add     a,$20
8c89 c9        ret     

8c8a fe41      cp      $41
8c8c 3f        ccf     
8c8d d0        ret     nc

8c8e fe5b      cp      $5b
8c90 c9        ret     

8c91 fe61      cp      $61
8c93 3f        ccf     
8c94 d0        ret     nc

8c95 fe7b      cp      $7b
8c97 c9        ret     

8c98 cd8a8c    call    $8c8a
8c9b d8        ret     c

8c9c cd918c    call    $8c91
8c9f c9        ret     

8ca0 fe30      cp      $30
8ca2 3f        ccf     
8ca3 d0        ret     nc

8ca4 fe3a      cp      $3a
8ca6 c9        ret     

8ca7 cda08c    call    $8ca0
8caa d8        ret     c

8cab fe41      cp      $41
8cad 3f        ccf     
8cae d0        ret     nc

8caf fe47      cp      $47
8cb1 c9        ret     

8cb2 fe20      cp      $20
8cb4 3805      jr      c,$8cbb
8cb6 fe7f      cp      $7f
8cb8 3001      jr      nc,$8cbb
8cba c9        ret     

8cbb b7        or      a
8cbc c9        ret     
					check terminal type

8cbd cd3e03    call    $033e		clear screen
8cc0 cd9226    call    $2692		return current drive in A (A:=1, B:=2, etc)
8cc3 329126    ld      ($2691),a	save current drive number
8cc6 c640      add     a,$40
8cc8 32a464    ld      ($64a4),a	save current drive letter ('A', 'B', etc) in fname ?:WRITM066.HLP
8ccb cd888d    call    $8d88		chek terminal type c=0 if <4KB free in disk
8cce 3046      jr      nc,$8d16
8cd0 cdbc8d    call    $8dbc		
8cd3 3805      jr      c,$8cda		jump if terminal ok
8cd5 11438d    ld      de,$8d43		"Terminal must be Cromemco 3102, C-10"
8cd8 1831      jr      $8d0b		print string

8cda cd6c3a    call    $3a6c		Reset BIT4 flag at 3c98
8cdd cdc422    call    $22c4		scan directory with SEARCH
8ce0 3805      jr      c,$8ce7
8ce2 11248d    ld      de,$8d24
8ce5 1824      jr      $8d0b
8ce7 cd6564    call    $6465
8cea feff      cp      $ff
8cec 2005      jr      nz,$8cf3
8cee 117964    ld      de,$6479
8cf1 1818      jr      $8d0b
8cf3 cd3604    call    $0436
8cf6 0e82      ld      c,$82
8cf8 11ffff    ld      de,$ffff
8cfb cd0500    call    $0005
8cfe 11000e    ld      de,$0e00		static function keys
8d01 cd2e04    call    $042e		CDOS: set special crt function
8d04 cdb892    call    $92b8
8d07 cdf965    call    $65f9
8d0a c9        ret     

8d0b 0e09      ld      c,$09
8d0d cd0500    call    $0005
8d10 11000d    ld      de,$0d00		dynamic funcion keys
8d13 cd2e04    call    $042e		CDOS: set special crt function
8d16 cd3002    call    $0230
8d19 11718d    ld      de,$8d71
8d1c 0e09      ld      c,$09
8d1e cd0500    call    $0005
8d21 c30000    jp      $0000
8d24 55        ld      d,l
8d25 6e        ld      l,(hl)
8d26 61        ld      h,c
8d27 62        ld      h,d
8d28 6c        ld      l,h
8d29 65        ld      h,l
8d2a 2074      jr      nz,$8da0
8d2c 6f        ld      l,a
8d2d 2072      jr      nz,$8da1
8d2f 65        ld      h,l
8d30 61        ld      h,c
8d31 64        ld      h,h
8d32 2064      jr      nz,$8d98
8d34 69        ld      l,c
8d35 73        ld      (hl),e
8d36 6b        ld      l,e
8d37 2064      jr      nz,$8d9d
8d39 69        ld      l,c
8d3a 72        ld      (hl),d
8d3b 65        ld      h,l
8d3c 63        ld      h,e
8d3d 74        ld      (hl),h
8d3e 6f        ld      l,a
8d3f 72        ld      (hl),d
8d40 79        ld      a,c
8d41 2e24      ld      l,$24
8d43 54        ld      d,h
8d44 65        ld      h,l
8d45 72        ld      (hl),d
8d46 6d        ld      l,l
8d47 69        ld      l,c
8d48 6e        ld      l,(hl)
8d49 61        ld      h,c
8d4a 6c        ld      l,h
8d4b 206d      jr      nz,$8dba
8d4d 75        ld      (hl),l
8d4e 73        ld      (hl),e
8d4f 74        ld      (hl),h
8d50 2062      jr      nz,$8db4
8d52 65        ld      h,l
8d53 2043      jr      nz,$8d98
8d55 72        ld      (hl),d
8d56 6f        ld      l,a
8d57 6d        ld      l,l
8d58 65        ld      h,l
8d59 6d        ld      l,l
8d5a 63        ld      h,e
8d5b 6f        ld      l,a
8d5c 2033      jr      nz,$8d91
8d5e 313032    ld      sp,$3230
8d61 2c        inc     l
8d62 2043      jr      nz,$8da7
8d64 2d        dec     l
8d65 31302c    ld      sp,$2c30
8d68 206f      jr      nz,$8dd9
8d6a 72        ld      (hl),d
8d6b 2043      jr      nz,$8db0
8d6d 2d        dec     l
8d6e 312e24    ld      sp,$242e
8d71 57        ld      d,a
8d72 72        ld      (hl),d
8d73 69        ld      l,c
8d74 74        ld      (hl),h
8d75 65        ld      h,l
8d76 4d        ld      c,l
8d77 61        ld      h,c
8d78 73        ld      (hl),e
8d79 74        ld      (hl),h
8d7a 65        ld      h,l
8d7b 72        ld      (hl),d
8d7c 2061      jr      nz,$8ddf
8d7e 62        ld      h,d
8d7f 6f        ld      l,a
8d80 72        ld      (hl),d
8d81 74        ld      (hl),h
8d82 65        ld      h,l
8d83 64        ld      h,h
8d84 2e0d      ld      l,$0d
8d86 0a        ld      a,(bc)
8d87 24        inc     h

8d88 0e8d      ld      c,$8d		CDOS: get version
8d8a cd0500    call    $0005		call BDOS 141: A=0 for CDOS, 1=Multi User Basic, 2=cromix
8d8d fe02      cp      $02
8d8f 2008      jr      nz,$8d99
8d91 cd338e    call    $8e33
8d94 cd083c    call    $3c08
8d97 1821      jr      $8dba
8d99 fe03      cp      $03
8d9b 2012      jr      nz,$8daf
8d9d 3e06      ld      a,$06
8d9f 214f7d    ld      hl,$7d4f
8da2 77        ld      (hl),a
8da3 21687d    ld      hl,$7d68
8da6 77        ld      (hl),a
8da7 215e7d    ld      hl,$7d5e
8daa 77        ld      (hl),a
8dab 21c78d    ld      hl,$8dc7
8dae 77        ld      (hl),a
8daf 210400    ld      hl,$0004		
8db2 cd2225    call    $2522		check if at least HL free KB in disk
8db5 3004      jr      nc,$8dbb		if not, jump to exit
8db7 cdb026    call    $26b0
8dba 37        scf     
8dbb c9        ret     

					return c=0 if terminal not ok

8dbc cda37d    call    $7da3		discard keys typed on terminal
8dbf 3e05      ld      a,$05 -> ld a,$33
8dc1 cd7844    call    $4478 -> jp 8e0b		write char in A -> write ^E
8dc4 06ff      ld      b,$ff		send console id inquiry
8dc6 0e0b      ld      c,$0b
8dc8 1efe      ld      e,$fe
8dca cd0500    call    $0005		BDOS Call 11 C_STAT Console Status 
8dcd b7        or      a
8dce 2005      jr      nz,$8dd5		jump if key pressed
8dd0 10f4      djnz    $8dc6
8dd2 b7        or      a
8dd3 1841      jr      $8e16		exit bad terminal, not 3102
8dd5 cd2a7d    call    $7d2a
8dd8 cd178e    call    $8e17
8ddb fe02      cp      $02		read ^B (STX)
8ddd 28f6      jr      z,$8dd5
8ddf fe33      cp      $33
8de1 2828      jr      z,$8e0b
8de3 cd903c    call    $3c90
8de6 3e72      ld      a,$72
8de8 322a03    ld      ($032a),a
8deb 3e71      ld      a,$71
8ded 323c03    ld      ($033c),a
8df0 3e24      ld      a,$24
8df2 32c803    ld      ($03c8),a
8df5 211f8e    ld      hl,$8e1f
8df8 118403    ld      de,$0384
8dfb 011100    ld      bc,$0011
8dfe edb0      ldir    
8e00 21308e    ld      hl,$8e30
8e03 116301    ld      de,$0163
8e06 010300    ld      bc,$0003
8e09 edb0      ldir    
8e0b 0605      ld      b,$05
8e0d cd178e    call    $8e17
8e10 cda37d    call    $7da3		discard keys typed on terminal
8e13 10f8      djnz    $8e0d
8e15 37        scf     
8e16 c9        ret     

8e17 f5        push    af
8e18 3e02      ld      a,$02
8e1a cd7844    call    $4478		write char in A
8e1d f1        pop     af
8e1e c9        ret     

8e1f 40        ld      b,b
8e20 48        ld      c,b
8e21 42        ld      b,d
8e22 4a        ld      c,d
8e23 50        ld      d,b
8e24 58        ld      e,b
8e25 52        ld      d,d
8e26 5a        ld      e,d
8e27 60        ld      h,b
8e28 68        ld      l,b
8e29 62        ld      h,d
8e2a 6a        ld      l,d
8e2b 70        ld      (hl),b
8e2c 78        ld      a,b
8e2d 72        ld      (hl),d
8e2e 7a        ld      a,d
8e2f 24        inc     h
8e30 00        nop     
8e31 7f        ld      a,a
8e32 00        nop     
8e33 0e98      ld      c,$98
8e35 16ff      ld      d,$ff
8e37 cdbc8e    call    $8ebc
8e3a 3009      jr      nc,$8e45
8e3c 0e05      ld      c,$05
8e3e 1602      ld      d,$02
8e40 1e02      ld      e,$02
8e42 cdbc8e    call    $8ebc
8e45 7a        ld      a,d
8e46 32c48e    ld      ($8ec4),a
8e49 0e04      ld      c,$04
8e4b 1602      ld      d,$02
8e4d 1e4b      ld      e,$4b
8e4f cdb78e    call    $8eb7
8e52 7a        ld      a,d
8e53 32c38e    ld      ($8ec3),a
8e56 0e02      ld      c,$02
8e58 1620      ld      d,$20
8e5a 1e26      ld      e,$26
8e5c cdb78e    call    $8eb7
8e5f 7a        ld      a,d
8e60 32c28e    ld      ($8ec2),a
8e63 0e0b      ld      c,$0b
8e65 1600      ld      d,$00
8e67 cdb78e    call    $8eb7
8e6a 7a        ld      a,d
8e6b 32c18e    ld      ($8ec1),a
8e6e 0e0c      ld      c,$0c
8e70 1600      ld      d,$00
8e72 cdb78e    call    $8eb7
8e75 7a        ld      a,d
8e76 32c58e    ld      ($8ec5),a
8e79 0e0a      ld      c,$0a
8e7b 1618      ld      d,$18
8e7d cdb78e    call    $8eb7
8e80 7a        ld      a,d
8e81 32c68e    ld      ($8ec6),a
8e84 c9        ret     

8e85 3ac38e    ld      a,($8ec3)
8e88 0e04      ld      c,$04
8e8a 57        ld      d,a
8e8b 1e4b      ld      e,$4b
8e8d cdb78e    call    $8eb7
8e90 3ac28e    ld      a,($8ec2)
8e93 0e02      ld      c,$02
8e95 57        ld      d,a
8e96 1e25      ld      e,$25
8e98 cdb78e    call    $8eb7
8e9b 3ac18e    ld      a,($8ec1)
8e9e 0e0b      ld      c,$0b
8ea0 57        ld      d,a
8ea1 cdb78e    call    $8eb7
8ea4 3ac58e    ld      a,($8ec5)
8ea7 57        ld      d,a
8ea8 0e0c      ld      c,$0c
8eaa cdb78e    call    $8eb7
8ead 3ac68e    ld      a,($8ec6)
8eb0 57        ld      d,a
8eb1 0e0a      ld      c,$0a
8eb3 cdb78e    call    $8eb7
8eb6 c9        ret     

8eb7 0601      ld      b,$01
8eb9 cf        rst     $08
8eba 13        inc     de
8ebb c9        ret     

8ebc 0600      ld      b,$00
8ebe cf        rst     $08
8ebf 13        inc     de
8ec0 c9        ret     

8ec1 00        nop     
8ec2 00        nop     
8ec3 00        nop     
8ec4 00        nop     
8ec5 00        nop     
8ec6 00        nop     
8ec7 c5        push    bc
8ec8 cd798f    call    $8f79
8ecb f5        push    af
8ecc c1        pop     bc
8ecd cb7f      bit     7,a
8ecf 284b      jr      z,$8f1c
8ed1 fe8b      cp      $8b
8ed3 28f3      jr      z,$8ec8
8ed5 fe82      cp      $82
8ed7 2012      jr      nz,$8eeb
8ed9 cd283c    call    $3c28
8edc 2805      jr      z,$8ee3
8ede cd303c    call    $3c30
8ee1 18e5      jr      $8ec8
8ee3 cd403c    call    $3c40
8ee6 cc483c    call    z,$3c48
8ee9 18dd      jr      $8ec8
8eeb fe83      cp      $83
8eed 2012      jr      nz,$8f01
8eef cd403c    call    $3c40
8ef2 2805      jr      z,$8ef9
8ef4 cd503c    call    $3c50
8ef7 18cf      jr      $8ec8
8ef9 cd283c    call    $3c28
8efc cc383c    call    z,$3c38
8eff 18c7      jr      $8ec8
8f01 fe81      cp      $81
8f03 2005      jr      nz,$8f0a
8f05 cdd63b    call    $3bd6
8f08 18be      jr      $8ec8
8f0a fe86      cp      $86
8f0c 2005      jr      nz,$8f13
8f0e cdcd3b    call    $3bcd
8f11 18b5      jr      $8ec8
8f13 fe87      cp      $87
8f15 2005      jr      nz,$8f1c
8f17 cdef3b    call    $3bef
8f1a 18ac      jr      $8ec8
8f1c c5        push    bc
8f1d f1        pop     af
8f1e c1        pop     bc
8f1f c9        ret     

8f20 c5        push    bc
8f21 cd1c90    call    $901c
8f24 f5        push    af
8f25 c1        pop     bc
8f26 cb7f      bit     7,a
8f28 284b      jr      z,$8f75
8f2a fe8b      cp      $8b
8f2c 28f3      jr      z,$8f21
8f2e fe82      cp      $82
8f30 2012      jr      nz,$8f44
8f32 cd403c    call    $3c40
8f35 2805      jr      z,$8f3c
8f37 cd503c    call    $3c50
8f3a 18e5      jr      $8f21
8f3c cd283c    call    $3c28
8f3f cc383c    call    z,$3c38
8f42 18dd      jr      $8f21
8f44 fe83      cp      $83
8f46 2012      jr      nz,$8f5a
8f48 cd283c    call    $3c28
8f4b 2805      jr      z,$8f52
8f4d cd303c    call    $3c30
8f50 18cf      jr      $8f21
8f52 cd403c    call    $3c40
8f55 cc483c    call    z,$3c48
8f58 18c7      jr      $8f21
8f5a fe81      cp      $81
8f5c 2005      jr      nz,$8f63
8f5e cdd63b    call    $3bd6
8f61 18be      jr      $8f21
8f63 fe86      cp      $86
8f65 2005      jr      nz,$8f6c
8f67 cdcd3b    call    $3bcd
8f6a 18b5      jr      $8f21
8f6c fe87      cp      $87
8f6e 2005      jr      nz,$8f75
8f70 cdef3b    call    $3bef
8f73 18ac      jr      $8f21
8f75 c5        push    bc
8f76 f1        pop     af
8f77 c1        pop     bc
8f78 c9        ret     

8f79 e5        push    hl
8f7a fde5      push    iy
8f7c c5        push    bc
8f7d d5        push    de
8f7e 2aba94    ld      hl,($94ba)
8f81 ed4bb894  ld      bc,($94b8)
8f85 b7        or      a
8f86 ed42      sbc     hl,bc
8f88 300c      jr      nc,$8f96
8f8a cd0393    call    $9303
8f8d dc1a93    call    c,$931a
8f90 cd5793    call    $9357
8f93 ca1690    jp      z,$9016
8f96 2ab894    ld      hl,($94b8)
8f99 7e        ld      a,(hl)
8f9a 23        inc     hl
8f9b 22b894    ld      ($94b8),hl
8f9e 21c094    ld      hl,$94c0
8fa1 34        inc     (hl)
8fa2 200a      jr      nz,$8fae
8fa4 23        inc     hl
8fa5 34        inc     (hl)
8fa6 2006      jr      nz,$8fae
8fa8 23        inc     hl
8fa9 34        inc     (hl)
8faa 2002      jr      nz,$8fae
8fac 23        inc     hl
8fad 34        inc     (hl)
8fae fe20      cp      $20
8fb0 3804      jr      c,$8fb6
8fb2 fe7f      cp      $7f
8fb4 385d      jr      c,$9013
8fb6 fe0a      cp      $0a
8fb8 2804      jr      z,$8fbe
8fba fe0d      cp      $0d
8fbc 200e      jr      nz,$8fcc
8fbe cd183c    call    $3c18
8fc1 cd0669    call    $6906
8fc4 cd7282    call    $8272
8fc7 cd1382    call    $8213
8fca 184a      jr      $9016
8fcc fe0c      cp      $0c
8fce 2005      jr      nz,$8fd5
8fd0 cd4469    call    $6944
8fd3 18f2      jr      $8fc7
8fd5 fe09      cp      $09
8fd7 2005      jr      nz,$8fde
8fd9 cd8e82    call    $828e
8fdc 1838      jr      $9016
8fde cb7f      bit     7,a
8fe0 2831      jr      z,$9013
8fe2 fe8b      cp      $8b
8fe4 2005      jr      nz,$8feb
8fe6 cd103c    call    $3c10
8fe9 182b      jr      $9016
8feb fe82      cp      $82
8fed 2827      jr      z,$9016
8fef fe83      cp      $83
8ff1 2823      jr      z,$9016
8ff3 fe81      cp      $81
8ff5 281f      jr      z,$9016
8ff7 fe86      cp      $86
8ff9 281b      jr      z,$9016
8ffb fe87      cp      $87
8ffd 2817      jr      z,$9016
8fff fe1a      cp      $1a
9001 2010      jr      nz,$9013
9003 3e01      ld      a,$01
9005 21b894    ld      hl,$94b8
9008 35        dec     (hl)
9009 fd21c094  ld      iy,$94c0
900d cd168b    call    $8b16
9010 b7        or      a
9011 1803      jr      $9016
9013 cd3e82    call    $823e
9016 d1        pop     de
9017 c1        pop     bc
9018 fde1      pop     iy
901a e1        pop     hl
901b c9        ret     

901c e5        push    hl
901d fde5      push    iy
901f c5        push    bc
9020 d5        push    de
9021 ed4bb894  ld      bc,($94b8)
9025 2ac494    ld      hl,($94c4)
9028 b7        or      a
9029 ed42      sbc     hl,bc
902b 382a      jr      c,$9057
902d 21c094    ld      hl,$94c0
9030 7e        ld      a,(hl)
9031 b7        or      a
9032 2015      jr      nz,$9049
9034 23        inc     hl
9035 7e        ld      a,(hl)
9036 b7        or      a
9037 2010      jr      nz,$9049
9039 23        inc     hl
903a 7e        ld      a,(hl)
903b b7        or      a
903c 200b      jr      nz,$9049
903e 23        inc     hl
903f 7e        ld      a,(hl)
9040 b7        or      a
9041 2006      jr      nz,$9049
9043 3e01      ld      a,$01
9045 b7        or      a
9046 c3d290    jp      $90d2
9049 cd0393    call    $9303
904c dc7e93    call    c,$937e
904f cdf193    call    $93f1
9052 cd9a93    call    $939a
9055 287b      jr      z,$90d2
9057 cd3683    call    $8336
905a 4f        ld      c,a
905b 21c094    ld      hl,$94c0
905e 7e        ld      a,(hl)
905f b7        or      a
9060 2011      jr      nz,$9073
9062 23        inc     hl
9063 7e        ld      a,(hl)
9064 b7        or      a
9065 200a      jr      nz,$9071
9067 23        inc     hl
9068 7e        ld      a,(hl)
9069 b7        or      a
906a 2003      jr      nz,$906f
906c 23        inc     hl
906d 35        dec     (hl)
906e 2b        dec     hl
906f 35        dec     (hl)
9070 2b        dec     hl
9071 35        dec     (hl)
9072 2b        dec     hl
9073 35        dec     (hl)
9074 2ab894    ld      hl,($94b8)
9077 2b        dec     hl
9078 7e        ld      a,(hl)
9079 22b894    ld      ($94b8),hl
907c fe20      cp      $20
907e 3804      jr      c,$9084
9080 fe7f      cp      $7f
9082 3848      jr      c,$90cc
9084 fe0c      cp      $0c
9086 2005      jr      nz,$908d
9088 cd5469    call    $6954
908b 1815      jr      $90a2
908d fe1a      cp      $1a
908f 283e      jr      z,$90cf
9091 fe0a      cp      $0a
9093 2804      jr      z,$9099
9095 fe0d      cp      $0d
9097 200e      jr      nz,$90a7
9099 cd183c    call    $3c18
909c cd2c69    call    $692c
909f cdda90    call    $90da
90a2 cd0c82    call    $820c
90a5 1828      jr      $90cf
90a7 fe09      cp      $09
90a9 2005      jr      nz,$90b0
90ab cdda90    call    $90da
90ae 181f      jr      $90cf
90b0 cb7f      bit     7,a
90b2 2818      jr      z,$90cc
90b4 fe82      cp      $82
90b6 281a      jr      z,$90d2
90b8 fe83      cp      $83
90ba 2816      jr      z,$90d2
90bc fe8b      cp      $8b
90be 2812      jr      z,$90d2
90c0 fe81      cp      $81
90c2 280e      jr      z,$90d2
90c4 fe86      cp      $86
90c6 280a      jr      z,$90d2
90c8 fe87      cp      $87
90ca 2806      jr      z,$90d2
90cc cd1a82    call    $821a
90cf cd5583    call    $8355
90d2 d1        pop     de
90d3 c1        pop     bc
90d4 fde1      pop     iy
90d6 e1        pop     hl
90d7 c9        ret     

90d8 00        nop     
90d9 00        nop     
90da f5        push    af
90db c5        push    bc
90dc dde5      push    ix
90de cd3683    call    $8336
90e1 f5        push    af
90e2 224e91    ld      ($914e),hl
90e5 ed4bc494  ld      bc,($94c4)
90e9 2b        dec     hl
90ea 7e        ld      a,(hl)
90eb fe0a      cp      $0a
90ed 2810      jr      z,$90ff
90ef fe0c      cp      $0c
90f1 280c      jr      z,$90ff
90f3 fe0d      cp      $0d
90f5 2808      jr      z,$90ff
90f7 7c        ld      a,h
90f8 b8        cp      b
90f9 2002      jr      nz,$90fd
90fb 7d        ld      a,l
90fc b9        cp      c
90fd 30ea      jr      nc,$90e9
90ff cd7282    call    $8272
9102 7e        ld      a,(hl)
9103 23        inc     hl
9104 dd214e91  ld      ix,$914e
9108 7c        ld      a,h
9109 ddbe01    cp      (ix+$01)
910c 2004      jr      nz,$9112
910e 7d        ld      a,l
910f ddbe00    cp      (ix+$00)
9112 2831      jr      z,$9145
9114 7e        ld      a,(hl)
9115 23        inc     hl
9116 fe09      cp      $09
9118 2005      jr      nz,$911f
911a cd8e82    call    $828e
911d 18e9      jr      $9108
911f cb7f      bit     7,a
9121 281d      jr      z,$9140
9123 fe8b      cp      $8b
9125 2005      jr      nz,$912c
9127 cd103c    call    $3c10
912a 18dc      jr      $9108
912c fe82      cp      $82
912e 28d8      jr      z,$9108
9130 fe83      cp      $83
9132 28d4      jr      z,$9108
9134 fe81      cp      $81
9136 28d0      jr      z,$9108
9138 fe86      cp      $86
913a 28cc      jr      z,$9108
913c fe87      cp      $87
913e 28c8      jr      z,$9108
9140 cd3e82    call    $823e
9143 18c3      jr      $9108
9145 f1        pop     af
9146 cd6783    call    $8367
9149 dde1      pop     ix
914b c1        pop     bc
914c f1        pop     af
914d c9        ret     

914e 00        nop     
914f 00        nop     
9150 c5        push    bc
9151 e5        push    hl
9152 2aba94    ld      hl,($94ba)
9155 ed4bb894  ld      bc,($94b8)
9159 b7        or      a
915a ed42      sbc     hl,bc
915c 2813      jr      z,$9171
915e 3811      jr      c,$9171
9160 0a        ld      a,(bc)
9161 fe1a      cp      $1a
9163 2008      jr      nz,$916d
9165 ed43ba94  ld      ($94ba),bc
9169 3e01      ld      a,$01
916b 1812      jr      $917f
916d cb7f      bit     7,a
916f 280e      jr      z,$917f
9171 cdac91    call    $91ac
9174 cdc78e    call    $8ec7
9177 fe01      cp      $01
9179 c4208f    call    nz,$8f20
917c cdb991    call    $91b9
917f e1        pop     hl
9180 c1        pop     bc
9181 c9        ret     

9182 c5        push    bc
9183 e5        push    hl
9184 2ab894    ld      hl,($94b8)
9187 ed4bc494  ld      bc,($94c4)
918b b7        or      a
918c ed42      sbc     hl,bc
918e 280b      jr      z,$919b
9190 3809      jr      c,$919b
9192 2ab894    ld      hl,($94b8)
9195 2b        dec     hl
9196 7e        ld      a,(hl)
9197 cb7f      bit     7,a
9199 280e      jr      z,$91a9
919b cdac91    call    $91ac
919e cd208f    call    $8f20
91a1 fe01      cp      $01
91a3 c4c78e    call    nz,$8ec7
91a6 cdb991    call    $91b9
91a9 e1        pop     hl
91aa c1        pop     bc
91ab c9        ret     

91ac cd3a83    call    $833a
91af 32c891    ld      ($91c8),a
91b2 cd3683    call    $8336
91b5 32c991    ld      ($91c9),a
91b8 c9        ret     

91b9 f5        push    af
91ba 3ac891    ld      a,($91c8)
91bd cd4a83    call    $834a
91c0 3ac991    ld      a,($91c9)
91c3 cd1c83    call    $831c
91c6 f1        pop     af
91c7 c9        ret     

91c8 00        nop     
91c9 00        nop     
91ca c5        push    bc
91cb d5        push    de
91cc e5        push    hl
91cd 78        ld      a,b
91ce b1        or      c
91cf 2862      jr      z,$9233
91d1 d5        push    de
91d2 c5        push    bc
91d3 2aba94    ld      hl,($94ba)
91d6 09        add     hl,bc
91d7 223792    ld      ($9237),hl
91da ed5bbc94  ld      de,($94bc)
91de b7        or      a
91df ed52      sbc     hl,de
91e1 3822      jr      c,$9205
91e3 2ac494    ld      hl,($94c4)
91e6 110008    ld      de,$0800
91e9 19        add     hl,de
91ea ed5bb894  ld      de,($94b8)
91ee b7        or      a
91ef ed52      sbc     hl,de
91f1 3009      jr      nc,$91fc
91f3 cd1a93    call    $931a
91f6 fe02      cp      $02
91f8 2838      jr      z,$9232
91fa 18d7      jr      $91d3
91fc cd7e93    call    $937e
91ff fe02      cp      $02
9201 282f      jr      z,$9232
9203 18ce      jr      $91d3
9205 2aba94    ld      hl,($94ba)
9208 e5        push    hl
9209 ed5bb894  ld      de,($94b8)
920d 23        inc     hl
920e b7        or      a
920f ed52      sbc     hl,de
9211 44        ld      b,h
9212 4d        ld      c,l
9213 ed5b3792  ld      de,($9237)
9217 ed53ba94  ld      ($94ba),de
921b e1        pop     hl
921c 2802      jr      z,$9220
921e edb8      lddr    
9220 c1        pop     bc
9221 e1        pop     hl
9222 cdf65e    call    $5ef6
9225 7e        ld      a,(hl)
9226 23        inc     hl
9227 cdae92    call    $92ae
922a 0b        dec     bc
922b 78        ld      a,b
922c b1        or      c
922d 20f6      jr      nz,$9225
922f b7        or      a
9230 1801      jr      $9233
9232 37        scf     
9233 e1        pop     hl
9234 d1        pop     de
9235 c1        pop     bc
9236 c9        ret     

9237 00        nop     
9238 00        nop     
9239 f5        push    af
923a c5        push    bc
923b d5        push    de
923c e5        push    hl
923d cd2d5f    call    $5f2d
9240 2aba94    ld      hl,($94ba)
9243 ed5bb894  ld      de,($94b8)
9247 b7        or      a
9248 ed52      sbc     hl,de
924a 385b      jr      c,$92a7
924c 23        inc     hl
924d 22ac92    ld      ($92ac),hl
9250 7c        ld      a,h
9251 b8        cp      b
9252 2002      jr      nz,$9256
9254 7d        ld      a,l
9255 b9        cp      c
9256 3032      jr      nc,$928a
9258 ed5bb894  ld      de,($94b8)
925c 2abc94    ld      hl,($94bc)
925f b7        or      a
9260 ed52      sbc     hl,de
9262 7c        ld      a,h
9263 fe08      cp      $08
9265 2003      jr      nz,$926a
9267 7d        ld      a,l
9268 fe01      cp      $01
926a dc1a93    call    c,$931a
926d 2ab894    ld      hl,($94b8)
9270 2b        dec     hl
9271 22ba94    ld      ($94ba),hl
9274 cd5793    call    $9357
9277 282e      jr      z,$92a7
9279 60        ld      h,b
927a 69        ld      l,c
927b ed5bac92  ld      de,($92ac)
927f b7        or      a
9280 ed52      sbc     hl,de
9282 44        ld      b,h
9283 4d        ld      c,l
9284 78        ld      a,b
9285 b1        or      c
9286 281f      jr      z,$92a7
9288 18b6      jr      $9240
928a c5        push    bc
928b 2aac92    ld      hl,($92ac)
928e b7        or      a
928f ed42      sbc     hl,bc
9291 44        ld      b,h
9292 4d        ld      c,l
9293 d1        pop     de
9294 2ab894    ld      hl,($94b8)
9297 19        add     hl,de
9298 ed5bb894  ld      de,($94b8)
929c 78        ld      a,b
929d b1        or      c
929e 2802      jr      z,$92a2
92a0 edb0      ldir    
92a2 1b        dec     de
92a3 ed53ba94  ld      ($94ba),de
92a7 e1        pop     hl
92a8 d1        pop     de
92a9 c1        pop     bc
92aa f1        pop     af
92ab c9        ret     

92ac 00        nop     
92ad 00        nop     
92ae e5        push    hl
92af 2ab894    ld      hl,($94b8)
92b2 77        ld      (hl),a
92b3 cd798f    call    $8f79
92b6 e1        pop     hl
92b7 c9        ret     

92b8 d5        push    de
92b9 e5        push    hl
92ba 2a0600    ld      hl,($0006)
92bd 2b        dec     hl
92be 22bc94    ld      ($94bc),hl
92c1 ed5bc694  ld      de,($94c6)
92c5 13        inc     de
92c6 ed53c494  ld      ($94c4),de
92ca 1b        dec     de
92cb ed53ba94  ld      ($94ba),de
92cf b7        or      a
92d0 ed52      sbc     hl,de
92d2 22be94    ld      ($94be),hl
92d5 13        inc     de
92d6 ed53b894  ld      ($94b8),de
92da cd4594    call    $9445
92dd cd8769    call    $6987
92e0 e1        pop     hl
92e1 d1        pop     de
92e2 c9        ret     

92e3 c5        push    bc
92e4 d5        push    de
92e5 e5        push    hl
92e6 dde5      push    ix
92e8 2abe94    ld      hl,($94be)
92eb 110008    ld      de,$0800
92ee 0e8a      ld      c,$8a
92f0 cd0500    call    $0005
92f3 45        ld      b,l
92f4 cd5793    call    $9357
92f7 fe01      cp      $01
92f9 2802      jr      z,$92fd
92fb 10f7      djnz    $92f4
92fd dde1      pop     ix
92ff e1        pop     hl
9300 d1        pop     de
9301 c1        pop     bc
9302 c9        ret     

9303 c5        push    bc
9304 e5        push    hl
9305 2abc94    ld      hl,($94bc)
9308 ed4bba94  ld      bc,($94ba)
930c b7        or      a
930d ed42      sbc     hl,bc
930f 7c        ld      a,h
9310 fe08      cp      $08
9312 2003      jr      nz,$9317
9314 7d        ld      a,l
9315 fe00      cp      $00
9317 e1        pop     hl
9318 c1        pop     bc
9319 c9        ret     

931a c5        push    bc
931b d5        push    de
931c e5        push    hl
931d cd1994    call    $9419
9320 ed5bc494  ld      de,($94c4)
9324 cda429    call    $29a4
9327 b7        or      a
9328 2029      jr      nz,$9353
932a 10f8      djnz    $9324
932c 2aba94    ld      hl,($94ba)
932f b7        or      a
9330 ed52      sbc     hl,de
9332 23        inc     hl
9333 44        ld      b,h
9334 4d        ld      c,l
9335 62        ld      h,d
9336 6b        ld      l,e
9337 ed5bc494  ld      de,($94c4)
933b edb0      ldir    
933d 2aba94    ld      hl,($94ba)
9340 1b        dec     de
9341 ed53ba94  ld      ($94ba),de
9345 b7        or      a
9346 ed52      sbc     hl,de
9348 54        ld      d,h
9349 5d        ld      e,l
934a 2ab894    ld      hl,($94b8)
934d b7        or      a
934e ed52      sbc     hl,de
9350 22b894    ld      ($94b8),hl
9353 e1        pop     hl
9354 d1        pop     de
9355 c1        pop     bc
9356 c9        ret     

9357 c5        push    bc
9358 d5        push    de
9359 0610      ld      b,$10
935b ed5bba94  ld      de,($94ba)
935f 13        inc     de
9360 cd2e29    call    $292e
9363 fe01      cp      $01
9365 2805      jr      z,$936c
9367 10f7      djnz    $9360
9369 05        dec     b
936a 1805      jr      $9371
936c cde693    call    $93e6
936f 280a      jr      z,$937b
9371 1b        dec     de
9372 1a        ld      a,(de)
9373 fe1a      cp      $1a
9375 28fa      jr      z,$9371
9377 ed53ba94  ld      ($94ba),de
937b d1        pop     de
937c c1        pop     bc
937d c9        ret     

937e c5        push    bc
937f d5        push    de
9380 e5        push    hl
9381 cd1994    call    $9419
9384 ed5bba94  ld      de,($94ba)
9388 13        inc     de
9389 cdcd29    call    $29cd
938c b7        or      a
938d 2007      jr      nz,$9396
938f 10f8      djnz    $9389
9391 1b        dec     de
9392 ed53ba94  ld      ($94ba),de
9396 e1        pop     hl
9397 d1        pop     de
9398 c1        pop     bc
9399 c9        ret     

939a c5        push    bc
939b d5        push    de
939c e5        push    hl
939d 2ac494    ld      hl,($94c4)
93a0 110008    ld      de,$0800
93a3 19        add     hl,de
93a4 54        ld      d,h
93a5 5d        ld      e,l
93a6 0610      ld      b,$10
93a8 cdf528    call    $28f5
93ab fe01      cp      $01
93ad 2804      jr      z,$93b3
93af 10f7      djnz    $93a8
93b1 182f      jr      $93e2
93b3 c5        push    bc
93b4 62        ld      h,d
93b5 6b        ld      l,e
93b6 ed4bc494  ld      bc,($94c4)
93ba b7        or      a
93bb ed42      sbc     hl,bc
93bd 44        ld      b,h
93be 4d        ld      c,l
93bf 2ab894    ld      hl,($94b8)
93c2 b7        or      a
93c3 ed42      sbc     hl,bc
93c5 22b894    ld      ($94b8),hl
93c8 2aba94    ld      hl,($94ba)
93cb 23        inc     hl
93cc b7        or      a
93cd ed52      sbc     hl,de
93cf 44        ld      b,h
93d0 4d        ld      c,l
93d1 62        ld      h,d
93d2 6b        ld      l,e
93d3 ed5bc494  ld      de,($94c4)
93d7 edb0      ldir    
93d9 1b        dec     de
93da ed53ba94  ld      ($94ba),de
93de c1        pop     bc
93df cde693    call    $93e6
93e2 e1        pop     hl
93e3 d1        pop     de
93e4 c1        pop     bc
93e5 c9        ret     

93e6 32f093    ld      ($93f0),a
93e9 78        ld      a,b
93ea fe10      cp      $10
93ec 3af093    ld      a,($93f0)
93ef c9        ret     

93f0 00        nop     
93f1 c5        push    bc
93f2 d5        push    de
93f3 e5        push    hl
93f4 2aba94    ld      hl,($94ba)
93f7 e5        push    hl
93f8 010008    ld      bc,$0800
93fb 09        add     hl,bc
93fc 22ba94    ld      ($94ba),hl
93ff 54        ld      d,h
9400 5d        ld      e,l
9401 e1        pop     hl
9402 e5        push    hl
9403 23        inc     hl
9404 ed4bc494  ld      bc,($94c4)
9408 b7        or      a
9409 ed42      sbc     hl,bc
940b 44        ld      b,h
940c 4d        ld      c,l
940d e1        pop     hl
940e edb8      lddr    
9410 13        inc     de
9411 ed53b894  ld      ($94b8),de
9415 e1        pop     hl
9416 d1        pop     de
9417 c1        pop     bc
9418 c9        ret     

9419 2aba94    ld      hl,($94ba)
941c ed4bc494  ld      bc,($94c4)
9420 b7        or      a
9421 ed42      sbc     hl,bc
9423 118000    ld      de,$0080
9426 0e8a      ld      c,$8a
9428 cd0500    call    $0005
942b 7c        ld      a,h
942c fe00      cp      $00
942e 2003      jr      nz,$9433
9430 7d        ld      a,l
9431 fe10      cp      $10
9433 3802      jr      c,$9437
9435 2e10      ld      l,$10
9437 45        ld      b,l
9438 c9        ret     

9439 fde5      push    iy		HL=[94c0], DE=[94c2]	
943b fd21c094  ld      iy,$94c0
943f cdb58a    call    $8ab5 		HL=[IY, IY+1], DE=[IY+2, IY+3]
9442 fde1      pop     iy
9444 c9        ret     

9445 fde5      push    iy
9447 fd21c094  ld      iy,$94c0
944b cd358b    call    $8b35
944e fde1      pop     iy
9450 c9        ret     

9451 d5        push    de
9452 e5        push    hl
9453 cd9d42    call    $429d
9456 2aba94    ld      hl,($94ba)
9459 ed5bc494  ld      de,($94c4)
945d 1b        dec     de
945e b7        or      a
945f ed52      sbc     hl,de
9461 118000    ld      de,$0080
9464 0e8a      ld      c,$8a
9466 cd0500    call    $0005
9469 d5        push    de
946a ed5bc494  ld      de,($94c4)
946e 7c        ld      a,h
946f b5        or      l
9470 280a      jr      z,$947c
9472 cda429    call    $29a4
9475 fe02      cp      $02
9477 282d      jr      z,$94a6
9479 2b        dec     hl
947a 18f2      jr      $946e
947c c1        pop     bc
947d 78        ld      a,b
947e b1        or      c
947f 2821      jr      z,$94a2
9481 218000    ld      hl,$0080
9484 b7        or      a
9485 ed42      sbc     hl,bc
9487 44        ld      b,h
9488 4d        ld      c,l
9489 d5        push    de
948a 2aba94    ld      hl,($94ba)
948d 23        inc     hl
948e 361a      ld      (hl),$1a
9490 54        ld      d,h
9491 5d        ld      e,l
9492 13        inc     de
9493 0b        dec     bc
9494 78        ld      a,b
9495 b1        or      c
9496 2802      jr      z,$949a
9498 edb0      ldir    
949a d1        pop     de
949b cda429    call    $29a4
949e fe02      cp      $02
94a0 2804      jr      z,$94a6
94a2 cdb892    call    $92b8
94a5 97        sub     a
94a6 e1        pop     hl
94a7 d1        pop     de
94a8 c9        ret     

94a9 e5        push    hl
94aa 2ab894    ld      hl,($94b8)
94ad 22ba94    ld      ($94ba),hl
94b0 cdbe27    call    $27be
94b3 cdc627    call    $27c6
94b6 e1        pop     hl
94b7 c9        ret     

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
94c8 21c094    ld      hl,$94c0
94cb cd358b    call    $8b35
94ce fde1      pop     iy
94d0 c9        ret     

94d1 d5        push    de
94d2 e5        push    hl
94d3 cd9d42    call    $429d
94d6 2aba94    ld      hl,($94ba)
94d9 ed5bc494  ld      de,($94c4)
94dd 1b        dec     de
94de b7        or      a
94df ed52      sbc     hl,de
94e1 118000    ld      de,$0080
94e4 0e8a      ld      c,$8a
94e6 cd0500    call    $0005
94e9 d5        push    de
94ea ed5bc494  ld      de,($94c4)
94ee 7c        ld      a,h
94ef b5        or      l
94f0 280a      jr      z,$94fc
94f2 cda429    call    $29a4
94f5 fe02      cp      $02
94f7 282d      jr      z,$9526
94f9 2b        dec     hl
94fa 18f2      jr      $94ee
94fc c1        pop     bc
94fd 78        ld      a,b
94fe b1        or      c
94ff 2800      jr      z,$9501
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
