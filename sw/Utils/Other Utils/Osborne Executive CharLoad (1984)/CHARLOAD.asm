; Disassembly of the file "E:\Tmp\cpm\pcw\CHARLOAD.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Friday, 19 of January 2024 at 07:02 PM
; 
0100 c35e01    jp      $015e

0103 cd1e0c    call    $0c1e
0106 0d        dec     c
0107 0a        ld      a,(bc)
0108 09        add     hl,bc
0109 09        add     hl,bc
010a 4f        ld      c,a
010b 73        ld      (hl),e
010c 62        ld      h,d
010d 6f        ld      l,a
010e 72        ld      (hl),d
010f 6e        ld      l,(hl)
0110 65        ld      h,l
0111 2045      jr      nz,$0158
0113 78        ld      a,b
0114 65        ld      h,l
0115 63        ld      h,e
0116 75        ld      (hl),l
0117 74        ld      (hl),h
0118 69        ld      l,c
0119 76        halt    
011a 65        ld      h,l
011b 2043      jr      nz,$0160
011d 68        ld      l,b
011e 61        ld      h,c
011f 72        ld      (hl),d
0120 61        ld      h,c
0121 63        ld      h,e
0122 74        ld      (hl),h
0123 65        ld      h,l
0124 72        ld      (hl),d
0125 2046      jr      nz,$016d
0127 6f        ld      l,a
0128 6e        ld      l,(hl)
0129 74        ld      (hl),h
012a 204c      jr      nz,$0178
012c 6f        ld      l,a
012d 61        ld      h,c
012e 64        ld      h,h
012f 65        ld      h,l
0130 72        ld      (hl),d
0131 2020      jr      nz,$0153
0133 56        ld      d,(hl)
0134 322e30    ld      ($302e),a
0137 0d        dec     c
0138 0a        ld      a,(bc)
0139 09        add     hl,bc
013a 09        add     hl,bc
013b 09        add     hl,bc
013c 43        ld      b,e
013d 6f        ld      l,a
013e 70        ld      (hl),b
013f 79        ld      a,c
0140 72        ld      (hl),d
0141 69        ld      l,c
0142 67        ld      h,a
0143 68        ld      l,b
0144 74        ld      (hl),h
0145 2031      jr      nz,$0178
0147 39        add     hl,sp
0148 3834      jr      c,$017e
014a 2c        inc     l
014b 2042      jr      nz,$018f
014d 6f        ld      l,a
014e 62        ld      h,d
014f 2041      jr      nz,$0192
0151 62        ld      h,d
0152 72        ld      (hl),d
0153 61        ld      h,c
0154 68        ld      l,b
0155 61        ld      h,c
0156 6d        ld      l,l
0157 73        ld      (hl),e
0158 0d        dec     c
0159 0a        ld      a,(bc)
015a 0a        ld      a,(bc)
015b 00        nop     
015c c9        ret     

015d 1a        ld      a,(de)

					progrma start

015e 310080    ld      sp,$8000
0161 0e19      ld      c,$19		Read Drive Num (return current drive: A=$00)
0163 cd0500    call    $0005		call BDOS
0166 32420c    ld      ($0c42),a	0c42=current drive
0169 0e0c      ld      c,$0c		Return Version (A = HL=$31)
016b cd0500    call    $0005		call BDOS
016e 7c        ld      a,h
016f b7        or      a
0170 c27b01    jp      nz,$017b
0173 7d        ld      a,l
0174 e6f0      and     $f0
0176 fe30      cp      $30
0178 ca9201    jp      z,$0192		jump if version > $30 -> cpm 3.0
017b cd1e0c    call    $0c1e
017e 0d        dec     c
017f 0a        ld      a,(bc)
0180 4e        ld      c,(hl)
0181 6f        ld      l,a
0182 74        ld      (hl),h
0183 2043      jr      nz,$01c8
0185 50        ld      d,b
0186 2f        cpl     
0187 4d        ld      c,l
0188 2050      jr      nz,$01da
018a 6c        ld      l,h
018b 75        ld      (hl),l
018c 73        ld      (hl),e
018d 2e00      ld      l,$00
018f c31808    jp      $0818

0192 2a0100    ld      hl,($0001)	bios base 
0195 2e00      ld      l,$00
0197 225408    ld      ($0854),hl	0854 = BIOS BASE=c000
019a 3a8000    ld      a,($0080)	command line length
019d b7        or      a
019e c2e301    jp      nz,$01e3		jump if command line to process

01a1 3eff      ld      a,$ff
01a3 32390c    ld      ($0c39),a
01a6 3e1a      ld      a,$1a
01a8 cdd70b    call    $0bd7
01ab cd0301    call    $0103
01ae cd030b    call    $0b03
01b1 cd300b    call    $0b30
01b4 cd540b    call    $0b54
01b7 218000    ld      hl,$0080
01ba 3678      ld      (hl),$78
01bc 23        inc     hl
01bd 118200    ld      de,$0082
01c0 3600      ld      (hl),$00
01c2 017a00    ld      bc,$007a
01c5 edb0      ldir    
01c7 cd1e0c    call    $0c1e
01ca 0d        dec     c
01cb 0a        ld      a,(bc)
01cc 2a000e    ld      hl,($0e00)
01cf 0a        ld      a,(bc)
01d0 118000    ld      de,$0080
01d3 cd0500    call    $0005
01d6 cdcb0b    call    $0bcb
01d9 218100    ld      hl,$0081
01dc 7e        ld      a,(hl)
01dd b7        or      a
01de ca4608    jp      z,$0846
01e1 3620      ld      (hl),$20

					process command line

01e3 21480c    ld      hl,$0c48		clear 0c48..0c48+5a
01e6 11490c    ld      de,$0c49
01e9 015a00    ld      bc,$005a
01ec 3600      ld      (hl),$00
01ee edb0      ldir    
01f0 0e98      ld      c,$98		CP/M 3: Parse FileName: 'OCCFONT.HEX' to FCB
01f2 113a0c    ld      de,$0c3a		fname at $0081, fcb at $0c4e	
01f5 cd0500    call    $0005		call BDOS
01f8 114f0c    ld      de,$0c4f		DE=0c4f=start of fname in fcb
01fb cdd808    call    $08d8		check Parse filename result (return in A=first fname char)
01fe b7        or      a
01ff f20502    jp      p,$0205		jump if plus (if fname starts wiith regular ascii char)
0202 324a0c    ld      ($0c4a),a
0205 cd0f09    call    $090f		return fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found
0208 ca9902    jp      z,$0299		jump if no more filenames nor params in command line
020b da2802    jp      c,$0228		yyy
020e fe5b      cp      $5b
0210 c26c02    jp      nz,$026c
0213 11470c    ld      de,$0c47
0216 cd2a09    call    $092a
0219 ca9902    jp      z,$0299
021c cd0f09    call    $090f		return fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found

021f ca9902    jp      z,$0299
0222 da2802    jp      c,$0228
0225 c36c02    jp      $026c
0228 223e0c    ld      ($0c3e),hl
022b 0e98      ld      c,$98
022d 113e0c    ld      de,$0c3e
0230 cd0500    call    $0005
0233 11790c    ld      de,$0c79
0236 cdd808    call    $08d8		check Parse filename result (return in A=first fname char)
0239 ca5d02    jp      z,$025d
023c b7        or      a
023d f24302    jp      p,$0243
0240 32740c    ld      ($0c74),a
0243 cd0f09    call    $090f		return fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found
0246 cabf02    jp      z,$02bf
0249 fe5b      cp      $5b
024b c25d02    jp      nz,$025d
024e 11710c    ld      de,$0c71
0251 cd2a09    call    $092a
0254 cabf02    jp      z,$02bf
0257 cd0f09    call    $090f		return fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found
025a cabf02    jp      z,$02bf
025d cd1e0c    call    $0c1e
0260 0d        dec     c
0261 0a        ld      a,(bc)
0262 53        ld      d,e
0263 6f        ld      l,a
0264 75        ld      (hl),l
0265 72        ld      (hl),d
0266 63        ld      h,e
0267 65        ld      h,l
0268 00        nop     
0269 c38602    jp      $0286

					invalid filename

026c cd0f09    call    $090f		eturn fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found
026f ca5d02    jp      z,$025d
0272 d26c02    jp      nc,$026c
0275 cd1e0c    call    $0c1e
0278 0d        dec     c
0279 0a        ld      a,(bc)
027a 44        ld      b,h
027b 65        ld      h,l
027c 73        ld      (hl),e
027d 74        ld      (hl),h
027e 69        ld      l,c
027f 6e        ld      l,(hl)
0280 61        ld      h,c
0281 74        ld      (hl),h
0282 69        ld      l,c
0283 6f        ld      l,a
0284 6e        ld      l,(hl)
0285 00        nop     
0286 cd1e0c    call    $0c1e
0289 206e      jr      nz,$02f9
028b 61        ld      h,c
028c 6d        ld      l,l
028d 65        ld      h,l
028e 2065      jr      nz,$02f5
0290 72        ld      (hl),d
0291 72        ld      (hl),d
0292 6f        ld      l,a
0293 72        ld      (hl),d
0294 2e00      ld      l,$00
0296 c3e207    jp      $07e2

					load a font file

0299 3a4d0c    ld      a,($0c4d)
029c b7        or      a
029d c25d02    jp      nz,$025d
02a0 21480c    ld      hl,$0c48		memcopy 0c48 -> 0c72
02a3 11720c    ld      de,$0c72
02a6 012a00    ld      bc,$002a
02a9 edb0      ldir    
02ab 21480c    ld      hl,$0c48		clear 0c48
02ae 11490c    ld      de,$0c49
02b1 012900    ld      bc,$0029
02b4 af        xor     a
02b5 77        ld      (hl),a
02b6 edb0      ldir    
02b8 2f        cpl     			set a=ff
02b9 324d0c    ld      ($0c4d),a
02bc 324a0c    ld      ($0c4a),a
02bf ed5b480c  ld      de,($0c48)	de=0
02c3 ed4b720c  ld      bc,($0c72)	bc=0
02c7 3a760c    ld      a,($0c76)	a=0
02ca b7        or      a
02cb c2d302    jp      nz,$02d3
02ce 78        ld      a,b
02cf b1        or      c
02d0 c24509    jp      nz,$0945
02d3 2a4d0c    ld      hl,($0c4d)	hl=00ff
02d6 7c        ld      a,h
02d7 b5        or      l
02d8 c2e002    jp      nz,$02e0
02db 57        ld      d,a
02dc b3        or      e
02dd c24509    jp      nz,$0945
02e0 7a        ld      a,d
02e1 b3        or      e
02e2 b0        or      b
02e3 b1        or      c
02e4 ca0c03    jp      z,$030c
02e7 78        ld      a,b
02e8 a1        and     c
02e9 c2fe02    jp      nz,$02fe
02ec 7a        ld      a,d
02ed a3        and     e
02ee c20503    jp      nz,$0305
02f1 7a        ld      a,d
02f2 b3        or      e
02f3 cafe02    jp      z,$02fe
02f6 78        ld      a,b
02f7 b1        or      c
02f8 ca0503    jp      z,$0305
02fb c31303    jp      $0313
02fe ed43480c  ld      ($0c48),bc
0302 c31303    jp      $0313
0305 ed53720c  ld      ($0c72),de
0309 c31303    jp      $0313
030c 2f        cpl     
030d 32730c    ld      ($0c73),a
0310 32490c    ld      ($0c49),a
0313 21810c    ld      hl,$0c81
0316 7e        ld      a,(hl)
0317 fe20      cp      $20
0319 c22703    jp      nz,$0327
031c 112d0c    ld      de,$0c2d
031f cdac09    call    $09ac
0322 3eff      ld      a,$ff
0324 329e0c    ld      ($0c9e),a
0327 21810c    ld      hl,$0c81
032a ed4b740c  ld      bc,($0c74)
032e 78        ld      a,b
032f 32a10c    ld      ($0ca1),a
0332 cd7209    call    $0972
0335 ed43740c  ld      ($0c74),bc
0339 21570c    ld      hl,$0c57
033c ed4b4a0c  ld      bc,($0c4a)
0340 cd7209    call    $0972

0343 ed434a0c  ld      ($0c4a),bc
0347 7e        ld      a,(hl)
0348 fe20      cp      $20
034a c25b03    jp      nz,$035b
034d 78        ld      a,b
034e b7        or      a
034f 112d0c    ld      de,$0c2d
0352 c25803    jp      nz,$0358
0355 11310c    ld      de,$0c31
0358 cdac09    call    $09ac
035b 3a760c    ld      a,($0c76)
035e b7        or      a
035f c24304    jp      nz,$0443
0362 0e0f      ld      c,$0f		open "occfont.hex"
0364 11780c    ld      de,$0c78		fcb=0c78
0367 cd0500    call    $0005		call bdos
036a b7        or      a
036b cad003    jp      z,$03d0		jmup if open ok
036e 3a390c    ld      a,($0c39)
0371 2f        cpl     
0372 47        ld      b,a
0373 3a9e0c    ld      a,($0c9e)
0376 a0        and     b
0377 c2af03    jp      nz,$03af
037a 21780c    ld      hl,$0c78		fcb
037d cdaf0b    call    $0baf
0380 3a9f0c    ld      a,($0c9f)
0383 b7        or      a
0384 ca9e03    jp      z,$039e
0387 cd1e0c    call    $0c1e
038a 08        ex      af,af'
038b 08        ex      af,af'
038c 08        ex      af,af'
038d 08        ex      af,af'
038e 2e43      ld      l,$43
0390 48        ld      c,b
0391 52        ld      d,d
0392 2061      jr      nz,$03f5
0394 6e        ld      l,(hl)
0395 64        ld      h,h
0396 2000      jr      nz,$0398
0398 21780c    ld      hl,$0c78		fcb
039b cdaf0b    call    $0baf
039e cd1e0c    call    $0c1e
03a1 206e      jr      nz,$0411
03a3 6f        ld      l,a
03a4 74        ld      (hl),h
03a5 2066      jr      nz,$040d
03a7 6f        ld      l,a
03a8 75        ld      (hl),l
03a9 6e        ld      l,(hl)
03aa 64        ld      h,h
03ab 2e20      ld      l,$20
03ad 2000      jr      nz,$03af
03af 3a9e0c    ld      a,($0c9e)
03b2 3c        inc     a
03b3 c2e207    jp      nz,$07e2
03b6 329e0c    ld      ($0c9e),a
03b9 3a390c    ld      a,($0c39)
03bc 2f        cpl     
03bd 329f0c    ld      ($0c9f),a
03c0 3aa10c    ld      a,($0ca1)
03c3 32750c    ld      ($0c75),a
03c6 2f        cpl     
03c7 32740c    ld      ($0c74),a
03ca 21810c    ld      hl,$0c81
03cd c35503    jp      $0355

					process open font file

03d0 32980c    ld      ($0c98),a
03d3 3a390c    ld      a,($0c39)
03d6 b7        or      a
03d7 cae603    jp      z,$03e6
03da cd5c04    call    $045c
03dd 21780c    ld      hl,$0c78		fcb
03e0 cdaf0b    call    $0baf
03e3 cdf10b    call    $0bf1
03e6 3a750c    ld      a,($0c75)
03e9 b7        or      a
03ea ca0004    jp      z,$0400
03ed 110090    ld      de,$9000		dma addr where font file will be loaded
03f0 3a870c    ld      a,($0c87)	0c87=next char from input font file
03f3 fe81      cp      $81
03f5 dafa03    jp      c,$03fa
03f8 3e80      ld      a,$80
03fa 329c0c    ld      ($0c9c),a
03fd c31004    jp      $0410
0400 110080    ld      de,$8000
0403 3a870c    ld      a,($0c87)	0c87=next char from input font file
0406 fe11      cp      $11
0408 da0d04    jp      c,$040d
040b 3e10      ld      a,$10
040d 329d0c    ld      ($0c9d),a
0410 d5        push    de
0411 5f        ld      e,a		e=number of 128 bytes records of file opened
0412 0e2c      ld      c,$2c		CP/M 3: Set Multi-Recod Count 
0414 cd0500    call    $0005		call bdos
0417 d1        pop     de		(so file can be read al once with a single read call)
0418 0e1a      ld      c,$1a		Set DMA Address (to DE=9000)
041a cd0500    call    $0005		call bdos
041d 0e14      ld      c,$14		READ seq
041f 11780c    ld      de,$0c78		fcb
0422 cd0500    call    $0005		call BDOS
0425 b7        or      a
0426 caf604    jp      z,$04f6		jump if read ok
0429 cd1e0c    call    $0c1e
042c 0d        dec     c
042d 0a        ld      a,(bc)
042e 0a        ld      a,(bc)
042f 46        ld      b,(hl)
0430 69        ld      l,c
0431 6c        ld      l,h
0432 65        ld      h,l
0433 2052      jr      nz,$0487
0435 65        ld      h,l
0436 61        ld      h,c
0437 64        ld      h,h
0438 2065      jr      nz,$049f
043a 72        ld      (hl),d
043b 72        ld      (hl),d
043c 6f        ld      l,a
043d 72        ld      (hl),d
043e 2e00      ld      l,$00
0440 c31808    jp      $0818
0443 3a720c    ld      a,($0c72)
0446 b7        or      a
0447 cacd04    jp      z,$04cd
044a 3a730c    ld      a,($0c73)
044d 32a00c    ld      ($0ca0),a
0450 cd5c04    call    $045c
0453 cd6904    call    $0469
0456 210000    ld      hl,$0000
0459 c3dd04    jp      $04dd
045c cd0e0c    call    $0c0e
045f 52        ld      d,d
0460 65        ld      h,l
0461 61        ld      h,c
0462 64        ld      h,h
0463 69        ld      l,c
0464 6e        ld      l,(hl)
0465 67        ld      h,a
0466 2000      jr      nz,$0468
0468 c9        ret     

0469 cd0e0c    call    $0c0e
046c 53        ld      d,e
046d 79        ld      a,c
046e 73        ld      (hl),e
046f 74        ld      (hl),h
0470 65        ld      h,l
0471 6d        ld      l,l
0472 2054      jr      nz,$04c8
0474 72        ld      (hl),d
0475 61        ld      h,c
0476 63        ld      h,e
0477 6b        ld      l,e
0478 73        ld      (hl),e
0479 2c        inc     l
047a 204d      jr      nz,$04c9
047c 61        ld      h,c
047d 69        ld      l,c
047e 6e        ld      l,(hl)
047f 00        nop     
0480 c9        ret     

0481 cd0e0c    call    $0c0e
0484 53        ld      d,e
0485 79        ld      a,c
0486 73        ld      (hl),e
0487 74        ld      (hl),h
0488 65        ld      h,l
0489 6d        ld      l,l
048a 2054      jr      nz,$04e0
048c 72        ld      (hl),d
048d 61        ld      h,c
048e 63        ld      h,e
048f 6b        ld      l,e
0490 73        ld      (hl),e
0491 2c        inc     l
0492 2041      jr      nz,$04d5
0494 6c        ld      l,h
0495 74        ld      (hl),h
0496 65        ld      h,l
0497 72        ld      (hl),d
0498 6e        ld      l,(hl)
0499 61        ld      h,c
049a 74        ld      (hl),h
049b 65        ld      h,l
049c 00        nop     
049d c9        ret     

049e 3a390c    ld      a,($0c39)
04a1 b7        or      a
04a2 c8        ret     z

04a3 e5        push    hl
04a4 cd1e0c    call    $0c1e
04a7 2063      jr      nz,$050c
04a9 68        ld      l,b
04aa 61        ld      h,c
04ab 72        ld      (hl),d
04ac 61        ld      h,c
04ad 63        ld      h,e
04ae 74        ld      (hl),h
04af 65        ld      h,l
04b0 72        ld      (hl),d
04b1 2073      jr      nz,$0526
04b3 65        ld      h,l
04b4 74        ld      (hl),h
04b5 2c        inc     l
04b6 2064      jr      nz,$051c
04b8 72        ld      (hl),d
04b9 69        ld      l,c
04ba 76        halt    
04bb 65        ld      h,l
04bc 2000      jr      nz,$04be
04be e1        pop     hl
04bf cdfb0b    call    $0bfb
04c2 cdf10b    call    $0bf1
04c5 c9        ret     

04c6 cdcb0b    call    $0bcb
04c9 af        xor     a
04ca 32480c    ld      ($0c48),a
04cd af        xor     a
04ce 32720c    ld      ($0c72),a
04d1 32a00c    ld      ($0ca0),a
04d4 cd5c04    call    $045c
04d7 cd8104    call    $0481
04da 210200    ld      hl,$0002
04dd e5        push    hl
04de 21780c    ld      hl,$0c78		fcb
04e1 cd9e04    call    $049e
04e4 3a780c    ld      a,($0c78)	get drive from fcb
04e7 cd5908    call    $0859
04ea e1        pop     hl
04eb cd6808    call    $0868
04ee cdfa0a    call    $0afa
04f1 3e10      ld      a,$10
04f3 329d0c    ld      ($0c9d),a

04f6 ed4b740c  ld      bc,($0c74)
04fa ed5b4a0c  ld      de,($0c4a)
04fe 78        ld      a,b
04ff a3        and     e
0500 ca4305    jp      z,$0543
0503 cd0e0c    call    $0c0e
0506 43        ld      b,e
0507 6f        ld      l,a
0508 6e        ld      l,(hl)
0509 76        halt    
050a 65        ld      h,l
050b 72        ld      (hl),d
050c 74        ld      (hl),h
050d 69        ld      l,c
050e 6e        ld      l,(hl)
050f 67        ld      h,a
0510 2048      jr      nz,$055a
0512 45        ld      b,l
0513 58        ld      e,b
0514 2074      jr      nz,$058a
0516 6f        ld      l,a
0517 2049      jr      nz,$0562
0519 6d        ld      l,l
051a 61        ld      h,c
051b 67        ld      h,a
051c 65        ld      h,l
051d 2e2e      ld      l,$2e
051f 2e08      ld      l,$08
0521 00        nop     
0522 cdb509    call    $09b5
0525 d27805    jp      nc,$0578
0528 cd1e0c    call    $0c1e
052b 0d        dec     c
052c 0a        ld      a,(bc)
052d 0a        ld      a,(bc)
052e 48        ld      c,b
052f 45        ld      b,l
0530 58        ld      e,b
0531 2066      jr      nz,$0599
0533 6f        ld      l,a
0534 72        ld      (hl),d
0535 6d        ld      l,l
0536 61        ld      h,c
0537 74        ld      (hl),h
0538 2065      jr      nz,$059f
053a 72        ld      (hl),d
053b 72        ld      (hl),d
053c 6f        ld      l,a
053d 72        ld      (hl),d
053e 2e00      ld      l,$00
0540 c3e207    jp      $07e2
0543 79        ld      a,c
0544 a2        and     d
0545 ca7805    jp      z,$0578
0548 3a760c    ld      a,($0c76)
054b b7        or      a
054c ca5605    jp      z,$0556
054f cd0e0c    call    $0c0e
0552 0d        dec     c
0553 0a        ld      a,(bc)
0554 09        add     hl,bc
0555 00        nop     
0556 cd0e0c    call    $0c0e
0559 43        ld      b,e
055a 6f        ld      l,a
055b 6e        ld      l,(hl)
055c 76        halt    
055d 65        ld      h,l
055e 72        ld      (hl),d
055f 74        ld      (hl),h
0560 69        ld      l,c
0561 6e        ld      l,(hl)
0562 67        ld      h,a
0563 2049      jr      nz,$05ae
0565 6d        ld      l,l
0566 61        ld      h,c
0567 67        ld      h,a
0568 65        ld      h,l
0569 2074      jr      nz,$05df
056b 6f        ld      l,a
056c 2048      jr      nz,$05b6
056e 45        ld      b,l
056f 58        ld      e,b
0570 2e2e      ld      l,$2e
0572 2e08      ld      l,$08
0574 00        nop     
0575 cd510a    call    $0a51
0578 cdcb0b    call    $0bcb
057b 2a4c0c    ld      hl,($0c4c)
057e 7c        ld      a,h
057f b7        or      a
0580 c25907    jp      nz,$0759
0583 7d        ld      a,l
0584 b7        or      a
0585 c28907    jp      nz,$0789
0588 0e0f      ld      c,$0f
058a 114e0c    ld      de,$0c4e		fcb
058d cd0500    call    $0005
0590 b7        or      a
0591 c25206    jp      nz,$0652
0594 3a560c    ld      a,($0c56)
0597 e680      and     $80
0599 c25206    jp      nz,$0652
059c cdcb0b    call    $0bcb
059f 214e0c    ld      hl,$0c4e		fcb
05a2 cdaf0b    call    $0baf
05a5 cd1e0c    call    $0c1e
05a8 2065      jr      nz,$060f
05aa 78        ld      a,b
05ab 69        ld      l,c
05ac 73        ld      (hl),e
05ad 74        ld      (hl),h
05ae 73        ld      (hl),e
05af 00        nop     
05b0 3a570c    ld      a,($0c57)
05b3 e680      and     $80
05b5 cacb05    jp      z,$05cb
05b8 cd1e0c    call    $0c1e
05bb 2c        inc     l
05bc 2052      jr      nz,$0610
05be 65        ld      h,l
05bf 61        ld      h,c
05c0 64        ld      h,h
05c1 2f        cpl     
05c2 6f        ld      l,a
05c3 6e        ld      l,(hl)
05c4 6c        ld      l,h
05c5 79        ld      a,c
05c6 2e00      ld      l,$00
05c8 c3e207    jp      $07e2
05cb 3a550c    ld      a,($0c55)
05ce e680      and     $80
05d0 caf505    jp      z,$05f5
05d3 cd1e0c    call    $0c1e
05d6 2c        inc     l
05d7 2050      jr      nz,$0629
05d9 61        ld      h,c
05da 73        ld      (hl),e
05db 73        ld      (hl),e
05dc 77        ld      (hl),a
05dd 6f        ld      l,a
05de 72        ld      (hl),d
05df 64        ld      h,h
05e0 2057      jr      nz,$0639
05e2 72        ld      (hl),d
05e3 69        ld      l,c
05e4 74        ld      (hl),h
05e5 65        ld      h,l
05e6 2070      jr      nz,$0658
05e8 72        ld      (hl),d
05e9 6f        ld      l,a
05ea 74        ld      (hl),h
05eb 65        ld      h,l
05ec 63        ld      h,e
05ed 74        ld      (hl),h
05ee 65        ld      h,l
05ef 64        ld      h,h
05f0 2e00      ld      l,$00
05f2 c3e207    jp      $07e2
05f5 cd1e0c    call    $0c1e
05f8 2e20      ld      l,$20
05fa 204f      jr      nz,$064b
05fc 4b        ld      c,e
05fd 2074      jr      nz,$0673
05ff 6f        ld      l,a
0600 206f      jr      nz,$0671
0602 76        halt    
0603 65        ld      h,l
0604 72        ld      (hl),d
0605 77        ld      (hl),a
0606 72        ld      (hl),d
0607 69        ld      l,c
0608 74        ld      (hl),h
0609 65        ld      h,l
060a 3f        ccf     
060b 2028      jr      nz,$0635
060d 59        ld      e,c
060e 2f        cpl     
060f 4e        ld      c,(hl)
0610 29        add     hl,hl
0611 2000      jr      nz,$0613
0613 0e06      ld      c,$06
0615 1eff      ld      e,$ff
0617 cd0500    call    $0005
061a b7        or      a
061b ca1306    jp      z,$0613
061e cd6909    call    $0969
0621 fe59      cp      $59
0623 ca3d06    jp      z,$063d
0626 fe4e      cp      $4e
0628 ca3306    jp      z,$0633
062b 3e07      ld      a,$07
062d cdd70b    call    $0bd7
0630 c31306    jp      $0613
0633 cd1e0c    call    $0c1e
0636 4e        ld      c,(hl)
0637 6f        ld      l,a
0638 2e00      ld      l,$00
063a c3e207    jp      $07e2
063d 32a20c    ld      ($0ca2),a
0640 cd1e0c    call    $0c1e
0643 59        ld      e,c
0644 65        ld      h,l
0645 73        ld      (hl),e
0646 2e20      ld      l,$20
0648 2000      jr      nz,$064a
064a 0e13      ld      c,$13
064c 114e0c    ld      de,$0c4e		fcb
064f cd0500    call    $0005
0652 0e1a      ld      c,$1a
0654 118000    ld      de,$0080
0657 cd0500    call    $0005
065a 3a4e0c    ld      a,($0c4e)	drive unit from fcb
065d b7        or      a
065e c26506    jp      nz,$0665
0661 3a420c    ld      a,($0c42)	0c42=current drive
0664 3c        inc     a
0665 3d        dec     a
0666 5f        ld      e,a
0667 0e2e      ld      c,$2e
0669 cd0500    call    $0005
066c 2a8100    ld      hl,($0081)
066f 7c        ld      a,h
0670 b5        or      l
0671 c2a806    jp      nz,$06a8
0674 3a4b0c    ld      a,($0c4b)
0677 b7        or      a
0678 3a9c0c    ld      a,($0c9c)
067b c28106    jp      nz,$0681
067e 3a9d0c    ld      a,($0c9d)
0681 47        ld      b,a
0682 3a8000    ld      a,($0080)
0685 90        sub     b
0686 d2a806    jp      nc,$06a8
0689 cd1e0c    call    $0c1e
068c 49        ld      c,c
068d 6e        ld      l,(hl)
068e 73        ld      (hl),e
068f 75        ld      (hl),l
0690 66        ld      h,(hl)
0691 66        ld      h,(hl)
0692 69        ld      l,c
0693 63        ld      h,e
0694 69        ld      l,c
0695 65        ld      h,l
0696 6e        ld      l,(hl)
0697 74        ld      (hl),h
0698 2064      jr      nz,$06fe
069a 69        ld      l,c
069b 73        ld      (hl),e
069c 6b        ld      l,e
069d 2073      jr      nz,$0712
069f 70        ld      (hl),b
06a0 61        ld      h,c
06a1 63        ld      h,e
06a2 65        ld      h,l
06a3 2e00      ld      l,$00
06a5 c3e207    jp      $07e2
06a8 3a390c    ld      a,($0c39)
06ab b7        or      a
06ac cac706    jp      z,$06c7
06af cd9c07    call    $079c
06b2 214e0c    ld      hl,$0c4e		fcb
06b5 cdaf0b    call    $0baf
06b8 cdf10b    call    $0bf1
06bb 3aa20c    ld      a,($0ca2)
06be b7        or      a
06bf cac706    jp      z,$06c7
06c2 3e08      ld      a,$08
06c4 cdd70b    call    $0bd7
06c7 0e16      ld      c,$16
06c9 114e0c    ld      de,$0c4e		fcb
06cc cd0500    call    $0005
06cf b7        or      a
06d0 caec06    jp      z,$06ec
06d3 cd1e0c    call    $0c1e
06d6 0d        dec     c
06d7 0a        ld      a,(bc)
06d8 0a        ld      a,(bc)
06d9 44        ld      b,h
06da 69        ld      l,c
06db 72        ld      (hl),d
06dc 65        ld      h,l
06dd 63        ld      h,e
06de 74        ld      (hl),h
06df 6f        ld      l,a
06e0 72        ld      (hl),d
06e1 79        ld      a,c
06e2 2066      jr      nz,$074a
06e4 75        ld      (hl),l
06e5 6c        ld      l,h
06e6 6c        ld      l,h
06e7 2e00      ld      l,$00
06e9 c3e207    jp      $07e2
06ec 326e0c    ld      ($0c6e),a
06ef 0e1a      ld      c,$1a
06f1 110080    ld      de,$8000
06f4 3a4b0c    ld      a,($0c4b)
06f7 b7        or      a
06f8 3a9d0c    ld      a,($0c9d)
06fb ca0407    jp      z,$0704
06fe 110090    ld      de,$9000
0701 3a9c0c    ld      a,($0c9c)
0704 f5        push    af
0705 cd0500    call    $0005
0708 0e2c      ld      c,$2c
070a f1        pop     af
070b 5f        ld      e,a
070c cd0500    call    $0005
070f 0e15      ld      c,$15
0711 114e0c    ld      de,$0c4e		fcb
0714 cd0500    call    $0005
0717 b7        or      a
0718 ca3107    jp      z,$0731
071b cd1e0c    call    $0c1e
071e 0d        dec     c
071f 0a        ld      a,(bc)
0720 0a        ld      a,(bc)
0721 57        ld      d,a
0722 72        ld      (hl),d
0723 69        ld      l,c
0724 74        ld      (hl),h
0725 65        ld      h,l
0726 2065      jr      nz,$078d
0728 72        ld      (hl),d
0729 72        ld      (hl),d
072a 6f        ld      l,a
072b 72        ld      (hl),d
072c 2e00      ld      l,$00
072e c31808    jp      $0818
0731 0e10      ld      c,$10
0733 114e0c    ld      de,$0c4e		fcb
0736 cd0500    call    $0005
0739 b7        or      a
073a ca5307    jp      z,$0753
073d cd1e0c    call    $0c1e
0740 0d        dec     c
0741 0a        ld      a,(bc)
0742 0a        ld      a,(bc)
0743 43        ld      b,e
0744 6c        ld      l,h
0745 6f        ld      l,a
0746 73        ld      (hl),e
0747 65        ld      h,l
0748 2065      jr      nz,$07af
074a 72        ld      (hl),d
074b 72        ld      (hl),d
074c 6f        ld      l,a
074d 72        ld      (hl),d
074e 2e00      ld      l,$00
0750 c31808    jp      $0818
0753 cdcb0b    call    $0bcb
0756 c30b08    jp      $080b
0759 3a480c    ld      a,($0c48)
075c b7        or      a
075d ca7307    jp      z,$0773
0760 210000    ld      hl,$0000
0763 cdd10a    call    $0ad1
0766 cd9c07    call    $079c
0769 cd300b    call    $0b30
076c 3aa00c    ld      a,($0ca0)
076f b7        or      a
0770 c2c604    jp      nz,$04c6
0773 3a490c    ld      a,($0c49)
0776 b7        or      a
0777 ca0b08    jp      z,$080b
077a 210008    ld      hl,$0800
077d cdd10a    call    $0ad1
0780 cd9c07    call    $079c
0783 cd540b    call    $0b54
0786 c30b08    jp      $080b
0789 3a480c    ld      a,($0c48)
078c b7        or      a
078d caa907    jp      z,$07a9
0790 cd9c07    call    $079c
0793 cd6904    call    $0469
0796 210000    ld      hl,$0000
0799 c3b607    jp      $07b6
079c cd0e0c    call    $0c0e
079f 57        ld      d,a
07a0 72        ld      (hl),d
07a1 69        ld      l,c
07a2 74        ld      (hl),h
07a3 69        ld      l,c
07a4 6e        ld      l,(hl)
07a5 67        ld      h,a
07a6 2000      jr      nz,$07a8
07a8 c9        ret     

07a9 af        xor     a
07aa 32490c    ld      ($0c49),a
07ad cd9c07    call    $079c
07b0 cd8104    call    $0481
07b3 210200    ld      hl,$0002
07b6 e5        push    hl
07b7 214e0c    ld      hl,$0c4e		fcb
07ba cd9e04    call    $049e
07bd 3a4e0c    ld      a,($0c4e)	get drive from fcb
07c0 cd5908    call    $0859
07c3 e1        pop     hl
07c4 cd6308    call    $0863
07c7 cdfa0a    call    $0afa
07ca cdcb0b    call    $0bcb
07cd 3a480c    ld      a,($0c48)
07d0 47        ld      b,a
07d1 3aa00c    ld      a,($0ca0)
07d4 a0        and     b
07d5 c2c604    jp      nz,$04c6
07d8 3a490c    ld      a,($0c49)
07db b7        or      a
07dc c2a907    jp      nz,$07a9
07df c30b08    jp      $080b
07e2 3a390c    ld      a,($0c39)
07e5 b7        or      a
07e6 ca2b08    jp      z,$082b
07e9 310080    ld      sp,$8000
07ec cd1e0c    call    $0c1e
07ef 2020      jr      nz,$0811
07f1 46        ld      b,(hl)
07f2 75        ld      (hl),l
07f3 6e        ld      l,(hl)
07f4 63        ld      h,e
07f5 74        ld      (hl),h
07f6 69        ld      l,c
07f7 6f        ld      l,a
07f8 6e        ld      l,(hl)
07f9 2074      jr      nz,$086f
07fb 65        ld      h,l
07fc 72        ld      (hl),d
07fd 6d        ld      l,l
07fe 69        ld      l,c
07ff 6e        ld      l,(hl)
0800 61        ld      h,c
0801 74        ld      (hl),h
0802 65        ld      h,l
0803 64        ld      h,h
0804 2e0d      ld      l,$0d
0806 0a        ld      a,(bc)
0807 00        nop     
0808 c3b701    jp      $01b7
080b 310080    ld      sp,$8000
080e 3a390c    ld      a,($0c39)
0811 b7        or      a
0812 c2b701    jp      nz,$01b7
0815 c34608    jp      $0846
0818 cd1e0c    call    $0c1e
081b 2020      jr      nz,$083d
081d 46        ld      b,(hl)
081e 41        ld      b,c
081f 54        ld      d,h
0820 41        ld      b,c
0821 4c        ld      c,h
0822 2045      jr      nz,$0869
0824 52        ld      d,d
0825 52        ld      d,d
0826 4f        ld      c,a
0827 52        ld      d,d
0828 2e07      ld      l,$07
082a 00        nop     
082b cd1e0c    call    $0c1e
082e 2020      jr      nz,$0850
0830 50        ld      d,b
0831 72        ld      (hl),d
0832 6f        ld      l,a
0833 67        ld      h,a
0834 72        ld      (hl),d
0835 61        ld      h,c
0836 6d        ld      l,l
0837 2074      jr      nz,$08ad
0839 65        ld      h,l
083a 72        ld      (hl),d
083b 6d        ld      l,l
083c 69        ld      l,c
083d 6e        ld      l,(hl)
083e 61        ld      h,c
083f 74        ld      (hl),h
0840 65        ld      h,l
0841 64        ld      h,h
0842 2e0d      ld      l,$0d
0844 0a        ld      a,(bc)
0845 00        nop     
0846 cdfa0a    call    $0afa
0849 0e00      ld      c,$00
084b c30500    jp      $0005
084e d5        push    de
084f e5        push    hl
0850 d1        pop     de
0851 29        add     hl,hl
0852 19        add     hl,de
0853 110000    ld      de,$0000
0856 19        add     hl,de
0857 d1        pop     de
0858 e9        jp      (hl)
0859 b7        or      a
085a c8        ret     z

085b 3d        dec     a
085c 5f        ld      e,a
085d 0e0e      ld      c,$0e
085f cd0500    call    $0005
0862 c9        ret     

0863 3e0e      ld      a,$0e
0865 32cc08    ld      ($08cc),a
0868 37        scf     
0869 f5        push    af
086a 110084    ld      de,$8400
086d d5        push    de
086e 23        inc     hl
086f e5        push    hl
0870 b7        or      a
0871 f5        push    af
0872 110080    ld      de,$8000
0875 d5        push    de
0876 2b        dec     hl
0877 e5        push    hl
0878 211700    ld      hl,$0017
087b 0e02      ld      c,$02
087d cd4e08    call    $084e
0880 210a00    ld      hl,$000a
0883 010200    ld      bc,$0002
0886 cd4e08    call    $084e
0889 210b00    ld      hl,$000b
088c c1        pop     bc
088d cd4e08    call    $084e
0890 210c00    ld      hl,$000c
0893 c1        pop     bc
0894 cd4e08    call    $084e
0897 211c00    ld      hl,$001c
089a 3e01      ld      a,$01
089c cd4e08    call    $084e
089f 2acc08    ld      hl,($08cc)
08a2 0e01      ld      c,$01
08a4 cd4e08    call    $084e
08a7 b7        or      a
08a8 cace08    jp      z,$08ce
08ab cd1e0c    call    $0c1e
08ae 0d        dec     c
08af 0a        ld      a,(bc)
08b0 0a        ld      a,(bc)
08b1 53        ld      d,e
08b2 79        ld      a,c
08b3 73        ld      (hl),e
08b4 74        ld      (hl),h
08b5 65        ld      h,l
08b6 6d        ld      l,l
08b7 2054      jr      nz,$090d
08b9 72        ld      (hl),d
08ba 61        ld      h,c
08bb 63        ld      h,e
08bc 6b        ld      l,e
08bd 2049      jr      nz,$0908
08bf 2f        cpl     
08c0 4f        ld      c,a
08c1 2065      jr      nz,$0928
08c3 72        ld      (hl),d
08c4 72        ld      (hl),d
08c5 6f        ld      l,a
08c6 72        ld      (hl),d
08c7 2e00      ld      l,$00
08c9 c31808    jp      $0818
08cc 0d        dec     c
08cd 00        nop     
08ce f1        pop     af
08cf d28008    jp      nc,$0880
08d2 3e0d      ld      a,$0d
08d4 32cc08    ld      ($08cc),a
08d7 c9        ret     

					check Parse filename result 

08d8 7c        ld      a,h		
08d9 a5        and     l
08da 3c        inc     a
08db ca6c02    jp      z,$026c		jump if HL=FFFF (invalid filename)
08de d5        push    de
08df 060b      ld      b,$0b		12=filename length
08e1 1a        ld      a,(de)		get char of filename
08e2 13        inc     de
08e3 fe3f      cp      $3f		is '?' ?
08e5 ca6c02    jp      z,$026c		yes, jump tp 026c
08e8 05        dec     b
08e9 c2e108    jp      nz,$08e1		process next char in filename
08ec d1        pop     de		restart at first filename char
08ed 1a        ld      a,(de)		get char of filename
08ee fe20      cp      $20		is space?
08f0 ca6c02    jp      z,$026c		yes, jump to 026c
08f3 fe24      cp      $24		is  '$'
08f5 cafa08    jp      z,$08fa		yes, goto 08fa
08f8 b7        or      a		return first letter of filename
08f9 c9        ret     

08fa 13        inc     de
08fb 1a        ld      a,(de)
08fc 1b        dec     de
08fd 1b        dec     de
08fe 1b        dec     de
08ff fe46      cp      $46
0901 ca0b09    jp      z,$090b
0904 1b        dec     de
0905 fe53      cp      $53
0907 c26c02    jp      nz,$026c
090a b7        or      a
090b 3eff      ld      a,$ff
090d 12        ld      (de),a
090e c9        ret     

					return fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found

090f 7c        ld      a,h		if HL=0, return A=0
0910 b5        or      l
0911 c8        ret     z
0912 7e        ld      a,(hl)		get char after fname
0913 23        inc     hl	
0914 b7        or      a		
0915 c8        ret     z		if char=0 return A=0
0916 fe20      cp      $20
0918 ca1209    jp      z,$0912		jump to read next char to skip space
091b fe09      cp      $09
091d ca1209    jp      z,$0912		jump to read next char to skip tab
0920 fe3d      cp      $3d
0922 ca2709    jp      z,$0927		jump to 0912 if '='
0925 b7        or      a
0926 c9        ret     			if ascii char return it in A
0927 b7        or      a
0928 37        scf     
0929 c9        ret     			return C=1 ('=' char after fname)

092a cd0f09    call    $090f		return fname termination
					A=0 if no more filenames
					A=ascii char if another param in cmdline
					A='=', carry set if equal found
092d c8        ret     z

092e fe5d      cp      $5d
0930 c23509    jp      nz,$0935
0933 b7        or      a
0934 c9        ret     

0935 e5        push    hl
0936 21430c    ld      hl,$0c43
0939 d5        push    de
093a cd6909    call    $0969
093d 47        ld      b,a
093e 7e        ld      a,(hl)
093f 23        inc     hl
0940 13        inc     de
0941 b7        or      a
0942 c25e09    jp      nz,$095e
0945 cd1e0c    call    $0c1e
0948 0d        dec     c
0949 0a        ld      a,(bc)
094a 53        ld      d,e
094b 70        ld      (hl),b
094c 65        ld      h,l
094d 63        ld      h,e
094e 69        ld      l,c
094f 66        ld      h,(hl)
0950 69        ld      l,c
0951 65        ld      h,l
0952 72        ld      (hl),d
0953 2065      jr      nz,$09ba
0955 72        ld      (hl),d
0956 72        ld      (hl),d
0957 6f        ld      l,a
0958 72        ld      (hl),d
0959 2e00      ld      l,$00
095b c3e207    jp      $07e2
095e 90        sub     b
095f c23e09    jp      nz,$093e
0962 2f        cpl     
0963 12        ld      (de),a
0964 d1        pop     de
0965 e1        pop     hl
0966 c32a09    jp      $092a
0969 fe61      cp      $61
096b d8        ret     c

096c fe7b      cp      $7b
096e d0        ret     nc

096f d620      sub     $20
0971 c9        ret     

0972 79        ld      a,c
0973 a0        and     b
0974 c24509    jp      nz,$0945
0977 79        ld      a,c
0978 b0        or      b
0979 c29809    jp      nz,$0998
097c 7e        ld      a,(hl)
097d d620      sub     $20
097f ca9409    jp      z,$0994
0982 112d0c    ld      de,$0c2d
0985 cd9c09    call    $099c
0988 ca9409    jp      z,$0994
098b 11350c    ld      de,$0c35
098e cd9c09    call    $099c
0991 c29809    jp      nz,$0998
0994 4f        ld      c,a
0995 2f        cpl     
0996 47        ld      b,a
0997 c9        ret     

0998 78        ld      a,b
0999 2f        cpl     
099a 4f        ld      c,a
099b c9        ret     

099c e5        push    hl
099d 0e03      ld      c,$03
099f 1a        ld      a,(de)
09a0 13        inc     de
09a1 96        sub     (hl)
09a2 23        inc     hl
09a3 c2aa09    jp      nz,$09aa
09a6 0d        dec     c
09a7 c29f09    jp      nz,$099f
09aa e1        pop     hl
09ab c9        ret     

09ac 1a        ld      a,(de)
09ad 13        inc     de
09ae b7        or      a
09af c8        ret     z

09b0 77        ld      (hl),a
09b1 23        inc     hl
09b2 c3ac09    jp      $09ac
09b5 3e10      ld      a,$10
09b7 329d0c    ld      ($0c9d),a
09ba 210090    ld      hl,$9000
09bd 7e        ld      a,(hl)
09be d63a      sub     $3a
09c0 c24a0a    jp      nz,$0a4a
09c3 23        inc     hl
09c4 321a0a    ld      ($0a1a),a
09c7 cd1b0a    call    $0a1b
09ca d8        ret     c

09cb b7        or      a
09cc c8        ret     z

09cd fa4a0a    jp      m,$0a4a
09d0 fe11      cp      $11
09d2 d24a0a    jp      nc,$0a4a
09d5 32190a    ld      ($0a19),a
09d8 cd1b0a    call    $0a1b
09db d8        ret     c

09dc 57        ld      d,a
09dd cd1b0a    call    $0a1b
09e0 d8        ret     c

09e1 5f        ld      e,a
09e2 cd1b0a    call    $0a1b
09e5 d8        ret     c

09e6 e5        push    hl
09e7 210080    ld      hl,$8000
09ea 19        add     hl,de
09eb eb        ex      de,hl
09ec e1        pop     hl
09ed 3a190a    ld      a,($0a19)
09f0 47        ld      b,a
09f1 c5        push    bc
09f2 cd1b0a    call    $0a1b
09f5 c1        pop     bc
09f6 d8        ret     c

09f7 12        ld      (de),a
09f8 13        inc     de
09f9 05        dec     b
09fa c2f109    jp      nz,$09f1
09fd cd1b0a    call    $0a1b
0a00 d8        ret     c

0a01 3a1a0a    ld      a,($0a1a)
0a04 b7        or      a
0a05 c24a0a    jp      nz,$0a4a
0a08 7e        ld      a,(hl)
0a09 fe0d      cp      $0d
0a0b c24a0a    jp      nz,$0a4a
0a0e 23        inc     hl
0a0f 7e        ld      a,(hl)
0a10 fe0a      cp      $0a
0a12 c24a0a    jp      nz,$0a4a
0a15 23        inc     hl
0a16 c3bd09    jp      $09bd
0a19 00        nop     
0a1a 00        nop     
0a1b 46        ld      b,(hl)
0a1c 23        inc     hl
0a1d 4e        ld      c,(hl)
0a1e 23        inc     hl
0a1f 78        ld      a,b
0a20 cd3a0a    call    $0a3a
0a23 d8        ret     c

0a24 07        rlca    
0a25 07        rlca    
0a26 07        rlca    
0a27 07        rlca    
0a28 47        ld      b,a
0a29 79        ld      a,c
0a2a cd3a0a    call    $0a3a
0a2d d8        ret     c

0a2e b0        or      b
0a2f 47        ld      b,a
0a30 3a1a0a    ld      a,($0a1a)
0a33 80        add     a,b
0a34 321a0a    ld      ($0a1a),a
0a37 78        ld      a,b
0a38 b7        or      a
0a39 c9        ret     

0a3a fe30      cp      $30
0a3c d8        ret     c

0a3d fe3a      cp      $3a
0a3f da4e0a    jp      c,$0a4e
0a42 fe41      cp      $41
0a44 d8        ret     c

0a45 fe47      cp      $47
0a47 da4c0a    jp      c,$0a4c
0a4a 37        scf     
0a4b c9        ret     

0a4c d637      sub     $37
0a4e e60f      and     $0f
0a50 c9        ret     

0a51 110080    ld      de,$8000
0a54 210090    ld      hl,$9000
0a57 0680      ld      b,$80
0a59 c5        push    bc
0a5a af        xor     a
0a5b 321a0a    ld      ($0a1a),a
0a5e 363a      ld      (hl),$3a
0a60 23        inc     hl
0a61 3e10      ld      a,$10
0a63 cdb40a    call    $0ab4
0a66 d5        push    de
0a67 e5        push    hl
0a68 210080    ld      hl,$8000
0a6b 19        add     hl,de
0a6c eb        ex      de,hl
0a6d e1        pop     hl
0a6e 7a        ld      a,d
0a6f cdb40a    call    $0ab4
0a72 7b        ld      a,e
0a73 cdb40a    call    $0ab4
0a76 d1        pop     de
0a77 af        xor     a
0a78 cdb40a    call    $0ab4
0a7b 0610      ld      b,$10
0a7d 1a        ld      a,(de)
0a7e 13        inc     de
0a7f cdb40a    call    $0ab4
0a82 05        dec     b
0a83 c27d0a    jp      nz,$0a7d
0a86 3a1a0a    ld      a,($0a1a)
0a89 2f        cpl     
0a8a 3c        inc     a
0a8b cdb40a    call    $0ab4
0a8e 360d      ld      (hl),$0d
0a90 23        inc     hl
0a91 360a      ld      (hl),$0a
0a93 23        inc     hl
0a94 c1        pop     bc
0a95 05        dec     b
0a96 c2590a    jp      nz,$0a59
0a99 363a      ld      (hl),$3a
0a9b 23        inc     hl
0a9c 060a      ld      b,$0a
0a9e 3630      ld      (hl),$30
0aa0 23        inc     hl
0aa1 05        dec     b
0aa2 c29e0a    jp      nz,$0a9e
0aa5 0680      ld      b,$80
0aa7 361a      ld      (hl),$1a
0aa9 23        inc     hl
0aaa 05        dec     b
0aab c2a70a    jp      nz,$0aa7
0aae 3e2e      ld      a,$2e
0ab0 329c0c    ld      ($0c9c),a
0ab3 c9        ret     

0ab4 4f        ld      c,a
0ab5 3a1a0a    ld      a,($0a1a)
0ab8 81        add     a,c
0ab9 321a0a    ld      ($0a1a),a
0abc 79        ld      a,c
0abd f5        push    af
0abe 1f        rra     
0abf 1f        rra     
0ac0 1f        rra     
0ac1 1f        rra     
0ac2 cdc60a    call    $0ac6
0ac5 f1        pop     af
0ac6 e60f      and     $0f
0ac8 c690      add     a,$90
0aca 27        daa     
0acb ce40      adc     a,$40
0acd 27        daa     
0ace 77        ld      (hl),a
0acf 23        inc     hl
0ad0 c9        ret     

0ad1 e5        push    hl
0ad2 21e80a    ld      hl,$0ae8		copy code 0ae8 to 6000
0ad5 110060    ld      de,$6000
0ad8 011200    ld      bc,$0012
0adb edb0      ldir    
0add e1        pop     hl
0ade 110080    ld      de,$8000		
0ae1 eb        ex      de,hl
0ae2 010008    ld      bc,$0800
0ae5 c30060    jp      $6000
0ae8 db00      in      a,($00)		read mem bank activr
0aea 321160    ld      ($6011),a	save
0aed f680      or      $80		activate bank 8
0aef d300      out     ($00),a
0af1 edb0      ldir    			HL=8000 -> DE=0800 for BC=0800 bytes
0af3 3a1160    ld      a,($6011)	restore mem banks 
0af6 d300      out     ($00),a		
0af8 c9        ret     

0af9 00        nop     
0afa 3a420c    ld      a,($0c42)	0c42=current drive
0afd 5f        ld      e,a
0afe 0e0e      ld      c,$0e
0b00 c30500    jp      $0005
0b03 cd1e0c    call    $0c1e
0b06 1b        dec     de
0b07 29        add     hl,hl
0b08 0d        dec     c
0b09 09        add     hl,bc
0b0a 00        nop     
0b0b 0604      ld      b,$04
0b0d c5        push    bc
0b0e cd1e0c    call    $0c1e
0b11 3031      jr      nc,$0b44
0b13 323334    ld      ($3433),a
0b16 35        dec     (hl)
0b17 3637      ld      (hl),$37
0b19 3839      jr      c,$0b54
0b1b 41        ld      b,c
0b1c 42        ld      b,d
0b1d 43        ld      b,e
0b1e 44        ld      b,h
0b1f 45        ld      b,l
0b20 46        ld      b,(hl)
0b21 00        nop     
0b22 c1        pop     bc
0b23 05        dec     b
0b24 c20d0b    jp      nz,$0b0d
0b27 cd1e0c    call    $0c1e
0b2a 1b        dec     de
0b2b 280d      jr      z,$0b3a
0b2d 0a        ld      a,(bc)
0b2e 00        nop     
0b2f c9        ret     

0b30 3a390c    ld      a,($0c39)
0b33 b7        or      a
0b34 c8        ret     z

0b35 cd1e0c    call    $0c1e
0b38 1b        dec     de
0b39 41        ld      b,c
0b3a 4d        ld      c,l
0b3b 61        ld      h,c
0b3c 69        ld      l,c
0b3d 6e        ld      l,(hl)
0b3e 2063      jr      nz,$0ba3
0b40 68        ld      l,b
0b41 61        ld      h,c
0b42 72        ld      (hl),d
0b43 61        ld      h,c
0b44 63        ld      h,e
0b45 74        ld      (hl),h
0b46 65        ld      h,l
0b47 72        ld      (hl),d
0b48 2073      jr      nz,$0bbd
0b4a 65        ld      h,l
0b4b 74        ld      (hl),h
0b4c 3a0d0a    ld      a,($0a0d)
0b4f 00        nop     
0b50 cd860b    call    $0b86
0b53 c9        ret     

0b54 3a390c    ld      a,($0c39)
0b57 b7        or      a
0b58 c8        ret     z

0b59 cd1e0c    call    $0c1e
0b5c 1b        dec     de
0b5d 41        ld      b,c
0b5e 41        ld      b,c
0b5f 6c        ld      l,h
0b60 74        ld      (hl),h
0b61 65        ld      h,l
0b62 72        ld      (hl),d
0b63 6e        ld      l,(hl)
0b64 61        ld      h,c
0b65 74        ld      (hl),h
0b66 65        ld      h,l
0b67 2063      jr      nz,$0bcc
0b69 68        ld      l,b
0b6a 61        ld      h,c
0b6b 72        ld      (hl),d
0b6c 61        ld      h,c
0b6d 63        ld      h,e
0b6e 74        ld      (hl),h
0b6f 65        ld      h,l
0b70 72        ld      (hl),d
0b71 2073      jr      nz,$0be6
0b73 65        ld      h,l
0b74 74        ld      (hl),h
0b75 3a0d0a    ld      a,($0a0d)
0b78 1b        dec     de
0b79 61        ld      h,c
0b7a 0d        dec     c
0b7b 00        nop     
0b7c cd860b    call    $0b86
0b7f cd1e0c    call    $0c1e
0b82 1b        dec     de
0b83 41        ld      b,c
0b84 00        nop     
0b85 c9        ret     

0b86 1e80      ld      e,$80
0b88 0602      ld      b,$02
0b8a 0e02      ld      c,$02
0b8c 1640      ld      d,$40
0b8e c5        push    bc
0b8f d5        push    de
0b90 3e09      ld      a,$09
0b92 cdd70b    call    $0bd7
0b95 d1        pop     de
0b96 c1        pop     bc
0b97 c5        push    bc
0b98 d5        push    de
0b99 cd0500    call    $0005
0b9c d1        pop     de
0b9d c1        pop     bc
0b9e 1c        inc     e
0b9f 15        dec     d
0ba0 c2970b    jp      nz,$0b97
0ba3 c5        push    bc
0ba4 d5        push    de
0ba5 cdcb0b    call    $0bcb
0ba8 d1        pop     de
0ba9 c1        pop     bc
0baa 05        dec     b
0bab c28c0b    jp      nz,$0b8c
0bae c9        ret     

0baf e5        push    hl
0bb0 cdfb0b    call    $0bfb
0bb3 e1        pop     hl
0bb4 0608      ld      b,$08
0bb6 23        inc     hl
0bb7 e5        push    hl
0bb8 cddd0b    call    $0bdd
0bbb 3e2e      ld      a,$2e
0bbd cdd70b    call    $0bd7
0bc0 0603      ld      b,$03
0bc2 e1        pop     hl
0bc3 110800    ld      de,$0008
0bc6 19        add     hl,de
0bc7 cddd0b    call    $0bdd
0bca c9        ret     

0bcb 3a390c    ld      a,($0c39)
0bce b7        or      a
0bcf c8        ret     z

0bd0 3e0d      ld      a,$0d
0bd2 cdd70b    call    $0bd7
0bd5 3e0a      ld      a,$0a
0bd7 5f        ld      e,a
0bd8 0e02      ld      c,$02
0bda c30500    jp      $0005
0bdd 0e02      ld      c,$02
0bdf 7e        ld      a,(hl)
0be0 23        inc     hl
0be1 fe20      cp      $20
0be3 c8        ret     z

0be4 c5        push    bc
0be5 e5        push    hl
0be6 5f        ld      e,a
0be7 cd0500    call    $0005
0bea e1        pop     hl
0beb c1        pop     bc
0bec 05        dec     b
0bed c2df0b    jp      nz,$0bdf
0bf0 c9        ret     

0bf1 cd1e0c    call    $0c1e
0bf4 2e2e      ld      l,$2e
0bf6 2e20      ld      l,$20
0bf8 2000      jr      nz,$0bfa
0bfa c9        ret     

0bfb 7e        ld      a,(hl)
0bfc b7        or      a
0bfd c2040c    jp      nz,$0c04
0c00 3a420c    ld      a,($0c42)	0c42=current drive
0c03 3c        inc     a
0c04 c640      add     a,$40
0c06 cdd70b    call    $0bd7
0c09 3e3a      ld      a,$3a
0c0b c3d70b    jp      $0bd7
0c0e 3a390c    ld      a,($0c39)
0c11 b7        or      a
0c12 c21e0c    jp      nz,$0c1e
0c15 e1        pop     hl
0c16 7e        ld      a,(hl)
0c17 23        inc     hl
0c18 e5        push    hl
0c19 b7        or      a
0c1a c8        ret     z

0c1b c3150c    jp      $0c15
0c1e e1        pop     hl
0c1f 7e        ld      a,(hl)
0c20 23        inc     hl
0c21 e5        push    hl
0c22 b7        or      a
0c23 c8        ret     z

0c24 5f        ld      e,a
0c25 0e02      ld      c,$02
0c27 cd0500    call    $0005
0c2a c31e0c    jp      $0c1e
0c2d 43        ld      b,e
0c2e 48        ld      c,b
0c2f 52        ld      d,d
0c30 00        nop     
0c31 49        ld      c,c
0c32 4d        ld      c,l
0c33 47        ld      b,a
0c34 00        nop     
0c35 48        ld      c,b
0c36 45        ld      b,l
0c37 58        ld      e,b
0c38 00        nop     
0c39 00        nop     
0c3a DEFW		$0081	filename in command line
0c3c DEFW		$0c4e	fcb
0c3e 81        add     a,c
0c3f 00        nop     
0c40 78        ld      a,b
0c41 0c        inc     c
0c42 00        nop     
0c43 4d        ld      c,l
0c44 41        ld      b,c
0c45 49        ld      c,c
0c46 48        ld      c,b
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
